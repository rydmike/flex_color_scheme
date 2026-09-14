#!/usr/bin/env bash

set -euo pipefail

# Resolve this project's root directory
script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
project_root="$(cd -- "$script_dir/.." && pwd -P)"

agents_md="$project_root/AGENTS.md"
agents_skills="$project_root/.agents/skills"
claude_dir="$project_root/.claude"
claude_skills="$claude_dir/skills"
claude_md="$project_root/CLAUDE.md"

if [[ ! -f "$agents_md" ]]; then
  echo "Error: AGENTS.md not found at: $agents_md" >&2
  exit 1
fi

if [[ ! -d "$agents_skills" ]]; then
  echo "Error: .agents/skills directory not found at: $agents_skills" >&2
  exit 1
fi

# Generate CLAUDE.md from AGENTS.md by rewriting skill paths for Claude Code's
# mirrored layout (.claude/skills/). Developer-facing sync docs live in README files.
generate_claude_md() {
  awk '
    {
      gsub(/\.agents\/skills\//, ".claude/skills/")
      gsub(/\.agents\/skills/, ".claude/skills")
      gsub(/agents\/skills\//, ".claude/skills/")
      gsub(/agents\/skills/, ".claude/skills")
      print
    }
  ' "$agents_md" > "$claude_md"
}

validate_no_stale_skill_paths() {
  local target_path="$1"

  if grep -R -n -E -q '(\.agents/skills|agents/skills)' "$target_path"; then
    echo "Error: stale .agents/skills or agents/skills references found in $target_path" >&2
    exit 1
  fi
}

# Remove and recreate only generated Claude skills, preserving other Claude
# project settings such as .claude/settings.json and its local version.
mkdir -p "$claude_dir"
if [[ -d "$claude_skills" ]]; then
  rm -rf "$claude_skills"
fi

# Create .claude/skills and copy each skill
mkdir -p "$claude_skills"
skill_count=0

rewrite_skill_paths() {
  local skill_copy_dir="$1"
  local file

  while IFS= read -r -d '' file; do
    perl -0pi -e '
      s|\.agents/skills/|.claude/skills/|g;
      s|\.agents/skills\b|.claude/skills|g;
      s|agents/skills/|.claude/skills/|g;
      s|agents/skills\b|.claude/skills|g;
    ' "$file"
  done < <(find "$skill_copy_dir" -type f -name '*.md' -print0)
}

for skill_dir in "$agents_skills"/*/; do
  if [[ -d "$skill_dir" ]] && [[ -f "${skill_dir}SKILL.md" ]]; then
    skill_name="$(basename "$skill_dir")"
    cp -R "$skill_dir" "$claude_skills/$skill_name"
    rewrite_skill_paths "$claude_skills/$skill_name"
    ((skill_count++)) || true
  fi
done

generate_claude_md

validate_no_stale_skill_paths "$claude_skills"
validate_no_stale_skill_paths "$claude_md"

echo "Claude Code config synced:"
echo "  - CLAUDE.md (from AGENTS.md)"
echo "  - .claude/skills/ ($skill_count skills)"
