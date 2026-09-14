# Release checklist

Paths below are relative to the repository root.

## Versions and validation

Check `pubspec.yaml`, `example/pubspec.yaml`, `example/lib/shared/const/app.dart`, and the current `CHANGELOG.md` section together. The Playground's `App.version` / `App.versionMajor` also appear in exports and generated code. Preserve the repository's versioning intent; do not infer a release date from the execution date or rewrite already released entries.

Inspect SDK constraints and the selected SDK before dependency resolution. Resolve root and example packages separately. For an actual release, run the pre-flight commands in [SKILL.md](../SKILL.md). There is no established 100% coverage gate.

Several push/PR workflow triggers use `branches: [none]`, and some commands may predate the current SDK (`flutter format` in `validate.yaml`). Read `.github/workflows/` before describing what runs. Changing CI is a separate task.

## Package contents

Review `.pubignore` and the file list reported by `dart pub publish --dry-run` (or `fvm dart pub publish --dry-run`).

- A `.pubignore` REPLACES the `.gitignore` in the same directory for publishing decisions. When adding publishing-relevant rules to the root `.gitignore`, mirror them in `.pubignore` — otherwise gitignored files reappear in the archive.
- It excludes internal content from the archive: `AGENTS.md`, `docs/`, `scripts/`, and `resources/` (README images load from GitHub blob/`raw=true` URLs; pub.dev does not need them). Excluding `docs/` also avoids pub's "rename docs to doc" layout warning.
- **Never exclude `example/screenshots/`**: those files are declared in the pubspec `screenshots:` section and MUST be in the archive. The pub.dev SERVER rejects the upload if one is missing ("Screenshot ... is missing from archive") — the local dry run does NOT check this.
- Hidden dot-directories (`.agents/`, `.github/`, `.claude/`, …) are always excluded by pub; they need no rules. Canonical skills live in `.agents/` and are shared as skill folders, not as pub.dev content.
- This package has no picker-style runtime `assets/` requirement. Avoid deleting assets or excluding whole folders based on another repository's publishing recipe.
- Flutter tool generated example platform files are deliberately untracked. Do not re-add them to git.

## Deployment wiring

`.github/workflows/deploy.yml` declares a published GitHub release trigger (`release: types: [published]` on `master`) and also lists `push`/`pull_request` on `branches: [none]`. Only the release trigger is the normal deploy path. It builds all five web examples from `example/`:

- example1 → `/flexcolorscheme/basictheme-latest/`
- example2 → `/flexcolorscheme/customtheme-latest/`
- example3 → `/flexcolorscheme/fourthemes-latest/`
- example4 → `/flexcolorscheme/allthemes-latest/`
- example5 Playground → `/flexcolorscheme/themesplayground-latest/` (`-t lib/example5_themes_playground/main.dart`)

Also present: `deploy_dev.yml` (dev paths), `deploy_playground.yml` / `deploy_dev_playground.yml` (Playground only), `deploy_playground_netlify.yml`, `build.yml`, `test.yml`, `validate.yaml`. Inspect their triggers and destinations before selecting one; do not describe workflows restricted to branch `none` as normally running on master or as manually dispatchable without checking `workflow_dispatch`.

When a full release is authorized, confirm the desired version and readiness, publish the package, then create the intended tag/GitHub release once package publication is confirmed. Check the resulting workflow and published package/Playground. No version bump, workflow edit, publishing, or deployment follows merely from installing this skill.
