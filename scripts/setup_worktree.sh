#!/usr/bin/env bash

set -euo pipefail

# Prepares a fresh git worktree for development: copies the one gitignored file
# an Android example build may want, then resolves Dart/Flutter packages for the
# package root and the example app.
#
# Run this manually in a fresh checkout/worktree unless an editor integration
# has been configured separately. No editor hooks are installed by this repo.

worktree_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd -P)"
cd "$worktree_root"

# ROOT_WORKTREE_PATH can select the source checkout explicitly. Otherwise use
# the main checkout, which `git worktree list` reports first.
source_root="${ROOT_WORKTREE_PATH:-}"
if [[ -z "$source_root" ]]; then
  source_root="$(git worktree list --porcelain 2>/dev/null | sed -nE '1s/^worktree //p')"
fi

if [[ -z "$source_root" || "$source_root" == "$worktree_root" ]]; then
  echo "No separate source checkout found; skipping the local.properties copy." >&2
  echo "This looks like the main checkout rather than a worktree." >&2
else
  echo "Copying gitignored setup files from: $source_root"

  # Local Android SDK paths for the example app.
  # Flutter can regenerate this file; skip quietly when the source has none.
  local_properties_src="$source_root/example/android/local.properties"
  local_properties_dst="$worktree_root/example/android/local.properties"
  if [[ -f "$local_properties_src" ]]; then
    if [[ -f "$local_properties_dst" ]]; then
      echo "  example/android/local.properties already present, left untouched"
    else
      mkdir -p "$(dirname -- "$local_properties_dst")"
      cp "$local_properties_src" "$local_properties_dst"
      echo "  example/android/local.properties copied"
    fi
  fi
fi

# Prefer the configured FVM SDK; fall back to Flutter on PATH.
if command -v fvm >/dev/null 2>&1; then
  flutter_cmd=(fvm flutter)
else
  flutter_cmd=(flutter)
fi

echo "Running ${flutter_cmd[*]} pub get"
"${flutter_cmd[@]}" pub get

echo "Running ${flutter_cmd[*]} pub get in example/"
( cd example && "${flutter_cmd[@]}" pub get )

cat <<NEXT

Worktree ready: $worktree_root

Next steps:
  - Package tests: ${flutter_cmd[*]} test
  - Playground:    cd example && ${flutter_cmd[*]} run -d chrome lib/example5_themes_playground/main.dart
  - Claude setup:  ./scripts/sync_claude_code_config.sh
  - Inspect native platform configuration before troubleshooting iOS/macOS builds.
NEXT
