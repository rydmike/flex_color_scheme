#!/usr/bin/env bash

set -euo pipefail

# Removes generated Claude Code artifacts (CLAUDE.md, CLAUDE.local.md,
# .claude/skills/). Optional cleanup: nothing depends on it. Cursor can be told
# to ignore third-party configs in its own settings instead - see scripts/README.md.
# Preserves other project files under .claude/ (e.g. settings.json).

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
project_root="$(cd -- "$script_dir/.." && pwd -P)"

claude_md="$project_root/CLAUDE.md"
claude_local_md="$project_root/CLAUDE.local.md"
claude_skills="$project_root/.claude/skills"

removed=0

if [[ -f "$claude_md" ]]; then
  rm -f "$claude_md"
  echo "Removed CLAUDE.md"
  removed=1
fi

if [[ -f "$claude_local_md" ]]; then
  rm -f "$claude_local_md"
  echo "Removed CLAUDE.local.md"
  removed=1
fi

if [[ -d "$claude_skills" ]]; then
  rm -rf "$claude_skills"
  echo "Removed .claude/skills/"
  removed=1
fi

if [[ "$removed" -eq 0 ]]; then
  echo "Nothing to remove (no CLAUDE.md, CLAUDE.local.md, or .claude/skills/)."
else
  echo "Claude Code generated config removed. Shared files under .claude/ (if any) were left in place."
fi
