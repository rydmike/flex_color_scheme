# Repository scripts

These scripts locate the checkout from their own location; they can be invoked from any working directory. They do not install editor hooks or change global configuration.

## Claude mirrors

Canonical sources are `AGENTS.md`, `.agents/skills/`, and linked repository references. For Claude Code, run after cloning and after source changes:

```bash
./scripts/sync_claude_code_config.sh
```

Requires Bash and Python 3 (standard library only). The shell entrypoint runs `sync_claude_code_config.py`. It validates skill entrypoints and local Markdown links, stages complete output, and replaces only `CLAUDE.md` and `.claude/skills/`. Re-running produces identical content; removing a canonical skill removes its generated copy. Skill resources and references are copied with their folders.

Repository skill link destinations are rewritten to the Claude mirror. Relative links to shared repository docs remain valid because `.agents/skills/` and `.claude/skills/` have equal depth. Prose identifying the canonical sources stays unchanged. Generated files have a notice directing edits back to the canonical sources.

The mirrors are gitignored and local to each checkout. They are not checked in or hand-edited. `.claude/settings.json`, `.claude/settings.local.json`, `CLAUDE.local.md`, and unrelated files are preserved. Sync refuses symlinked output locations to avoid replacing content outside this checkout. An invalid/missing source fails before replacing existing mirrors.

Optional cleanup:

```bash
./scripts/delete_claude_code_config.sh
```

Cleanup deletes only `CLAUDE.md` and `.claude/skills/`. It preserves `CLAUDE.local.md` and Claude settings. It is unnecessary for keeping configuration current; syncing is sufficient.

## Fresh worktree setup

```bash
./scripts/setup_worktree.sh
```

Uses `fvm flutter` if FVM is on PATH, otherwise `flutter`. Check that the selected SDK satisfies both pubspecs. It copies the main checkout's `example/android/local.properties` if available and absent from the new checkout, then resolves dependencies at the root and in `example/`. Set `ROOT_WORKTREE_PATH` to use a different source checkout.

This is manual setup unless you have configured an editor integration separately. Native platform configuration is left to the example project. See [worktree guidance](../docs/guides/using-worktrees-guidance.md).

## Tooling checks

```bash
bash -n scripts/sync_claude_code_config.sh scripts/delete_claude_code_config.sh scripts/setup_worktree.sh
python3 scripts/test_claude_code_config.py
```

The fixture tests exercise only temporary repositories and fake SDK commands; they do not run Flutter or alter local app settings.
