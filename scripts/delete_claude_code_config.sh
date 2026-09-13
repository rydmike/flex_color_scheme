#!/usr/bin/env bash
set -euo pipefail

# Remove generated mirrors only. Preserve CLAUDE.local.md and all settings.
script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
project_root="$(cd -- "$script_dir/.." && pwd -P)"

# Unlink symlinks themselves; do not traverse their targets.
rm -f -- "$project_root/CLAUDE.md"
if [[ -L "$project_root/.claude" ]]; then
  echo "Error: .claude is a symlink; leaving its contents untouched." >&2
  exit 1
fi
rm -rf -- "$project_root/.claude/skills"
echo "Removed generated Claude mirrors; local instructions and settings preserved."
