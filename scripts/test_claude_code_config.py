#!/usr/bin/env python3
"""Exercise config scripts in disposable checkouts, without Flutter or user data."""

from pathlib import Path
import os
import shutil
import subprocess
import tempfile
import unittest

SCRIPTS = Path(__file__).resolve().parent


class ConfigScriptsTest(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='fcs config tests ')
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name) / 'checkout with spaces'
        self.root.mkdir()
        shutil.copytree(SCRIPTS, self.root / 'scripts', ignore=shutil.ignore_patterns('__pycache__'))
        self.write('AGENTS.md', '# Guidance\n\n[Alpha](.agents/skills/alpha/SKILL.md)\nEdit `.agents/skills/`.\n')
        self.write('docs/guide.md', '# Shared guide\n')
        self.skill('alpha')
        self.write('CLAUDE.local.md', 'Personal instructions\n')
        self.write('.claude/settings.json', '{"keep": true}\n')
        self.write('.claude/settings.local.json', '{"local": true}\n')
        self.write('.claude/notes.txt', 'Keep this too\n')

    def write(self, relative, content):
        path = self.root / relative
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(content)

    def skill(self, name):
        self.write(f'.agents/skills/{name}/SKILL.md', f'''---
name: {name}
description: Use this fixture skill for config testing.
---

[Reference](references/details.md)
[Shared guide](../../../docs/guide.md)
''')
        self.write(f'.agents/skills/{name}/references/details.md', '# Details\n')
        path = self.root / f'.agents/skills/{name}/assets/blob.bin'
        path.parent.mkdir()
        path.write_bytes(bytes(range(256)))

    def run_script(self, name, succeeds=True, env=None):
        result = subprocess.run(
            ['bash', str(self.root / 'scripts' / name)],
            cwd=self.temp.name, capture_output=True, text=True, env=env,
        )
        if succeeds:
            self.assertEqual(result.returncode, 0, result.stderr)
        else:
            self.assertNotEqual(result.returncode, 0)
        return result

    def mirror(self):
        files = [self.root / 'CLAUDE.md']
        files += sorted((self.root / '.claude/skills').rglob('*'))
        return {str(p.relative_to(self.root)): p.read_bytes() for p in files if p.is_file()}

    def assert_personal_files(self):
        self.assertEqual((self.root / 'CLAUDE.local.md').read_text(), 'Personal instructions\n')
        self.assertEqual((self.root / '.claude/settings.json').read_text(), '{"keep": true}\n')
        self.assertEqual((self.root / '.claude/settings.local.json').read_text(), '{"local": true}\n')
        self.assertEqual((self.root / '.claude/notes.txt').read_text(), 'Keep this too\n')

    def test_sync_resources_links_and_idempotence(self):
        original = (self.root / 'AGENTS.md').read_bytes()
        self.run_script('sync_claude_code_config.sh')
        first = self.mirror()
        guide = (self.root / 'CLAUDE.md').read_text()
        self.assertIn('](.claude/skills/alpha/SKILL.md)', guide)
        self.assertIn('Edit `.agents/skills/`.', guide)
        skill = (self.root / '.claude/skills/alpha/SKILL.md').read_text()
        self.assertTrue(skill.startswith('---\n'))
        self.assertIn('<!-- Generated', skill)
        self.assertEqual((self.root / '.claude/skills/alpha/assets/blob.bin').read_bytes(), bytes(range(256)))
        self.run_script('sync_claude_code_config.sh')
        self.assertEqual(first, self.mirror())
        self.assertEqual(original, (self.root / 'AGENTS.md').read_bytes())
        self.assert_personal_files()

    def test_removed_skill_is_pruned(self):
        self.skill('obsolete')
        self.run_script('sync_claude_code_config.sh')
        shutil.rmtree(self.root / '.agents/skills/obsolete')
        self.run_script('sync_claude_code_config.sh')
        self.assertFalse((self.root / '.claude/skills/obsolete').exists())

    def test_bad_inputs_preserve_existing_mirrors(self):
        self.run_script('sync_claude_code_config.sh')
        previous = self.mirror()
        guide = self.root / 'AGENTS.md'
        saved = guide.read_text()
        guide.unlink()
        self.run_script('sync_claude_code_config.sh', succeeds=False)
        self.assertEqual(previous, self.mirror())
        guide.write_text(saved)
        self.write('AGENTS.md', '[Missing](docs/missing.md)\n')
        self.run_script('sync_claude_code_config.sh', succeeds=False)
        self.assertEqual(previous, self.mirror())
        guide.write_text(saved)
        entry = self.root / '.agents/skills/alpha/SKILL.md'
        text = entry.read_text()
        entry.write_text('unfinished')
        self.run_script('sync_claude_code_config.sh', succeeds=False)
        self.assertEqual(previous, self.mirror())
        entry.write_text(text)
        source = self.root / '.agents/skills'
        source.rename(self.root / '.agents/skills-away')
        self.run_script('sync_claude_code_config.sh', succeeds=False)
        self.assertEqual(previous, self.mirror())

    def test_cleanup_is_repeatable_and_preserves_personal_files(self):
        self.run_script('sync_claude_code_config.sh')
        self.run_script('delete_claude_code_config.sh')
        self.run_script('delete_claude_code_config.sh')
        self.assertFalse((self.root / 'CLAUDE.md').exists())
        self.assertFalse((self.root / '.claude/skills').exists())
        self.assert_personal_files()
        self.assertTrue((self.root / '.agents/skills/alpha/SKILL.md').is_file())

    def test_sync_refuses_symlinked_output(self):
        external = Path(self.temp.name) / 'external.md'
        external.write_text('untouched')
        (self.root / 'CLAUDE.md').symlink_to(external)
        self.run_script('sync_claude_code_config.sh', succeeds=False)
        self.assertEqual(external.read_text(), 'untouched')

    def test_worktree_setup_uses_both_packages_and_preserves_local_properties(self):
        source = Path(self.temp.name) / 'source checkout'
        (source / 'example/android').mkdir(parents=True)
        (source / 'example/android/local.properties').write_text('sdk.dir=fixture\n')
        (self.root / 'example').mkdir()
        binary = Path(self.temp.name) / 'bin'
        binary.mkdir()
        fake = binary / 'fvm'
        fake.write_text('#!/bin/sh\n[ "$*" = "flutter pub get" ] || exit 2\nprintf "%s\\n" "$PWD" >> "$FCS_TEST_LOG"\n')
        fake.chmod(0o755)
        log = Path(self.temp.name) / 'commands.log'
        env = dict(os.environ, PATH=str(binary) + os.pathsep + os.environ['PATH'],
                   ROOT_WORKTREE_PATH=str(source), FCS_TEST_LOG=str(log))
        self.run_script('setup_worktree.sh', env=env)
        self.assertEqual(log.read_text().splitlines(), [str(self.root.resolve()), str((self.root / 'example').resolve())])
        target = self.root / 'example/android/local.properties'
        self.assertEqual(target.read_text(), 'sdk.dir=fixture\n')
        target.write_text('local override\n')
        self.run_script('setup_worktree.sh', env=env)
        self.assertEqual(target.read_text(), 'local override\n')


if __name__ == '__main__':
    unittest.main()
