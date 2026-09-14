# Release checklist

Paths below are relative to the repository root.

## Versions and validation

Check `pubspec.yaml`, `example/pubspec.yaml`, `example/lib/shared/const/app.dart`, and the current `CHANGELOG.md` section together. The Playground's `App.version` / `App.versionMajor` also appear in exports and generated code. Preserve the repository's versioning intent; do not infer a release date from the execution date or rewrite already released entries.

Inspect SDK constraints and the selected SDK before dependency resolution. Resolve root and example packages separately. For an actual release, run the pre-flight commands in [SKILL.md](../SKILL.md). There is no established 100% coverage gate.

The active PR/push CI is `.github/workflows/test.yml` (analyze, format check, tests with coverage → Codecov on pull requests and pushes to `master`). Other push/PR workflow triggers still use `branches: [none]`. Read `.github/workflows/` before describing what runs.

## Package contents

Review `.pubignore` and the file list reported by `dart pub publish --dry-run` (or `fvm dart pub publish --dry-run`).

- A `.pubignore` REPLACES the `.gitignore` in the same directory for publishing decisions. When adding publishing-relevant rules to the root `.gitignore`, mirror them in `.pubignore` — otherwise gitignored files reappear in the archive.
- It excludes internal content from the archive: `AGENTS.md`, `docs/`, `scripts/`, and `resources/` (README images load from GitHub blob/`raw=true` URLs; pub.dev does not need them). Excluding `docs/` also avoids pub's "rename docs to doc" layout warning. That warning is easy to miss in `--dry-run`; a real upload is stricter.
- Do not leave Flutter-generated example plugin registrant files (`example/{linux,macos,windows}/flutter/generated_plugin*`) tracked. They are gitignored and pubignored; checked-in copies make `dart pub publish` warn that gitignored files are in the index.
- **Never exclude `example/screenshots/`**: those files are declared in the pubspec `screenshots:` section and MUST be in the archive. The pub.dev SERVER rejects the upload if one is missing ("Screenshot ... is missing from archive") — the local dry run does NOT check this.
- Hidden dot-directories (`.agents/`, `.github/`, `.claude/`, …) are always excluded by pub; they need no rules. Canonical skills live in `.agents/` and are shared as skill folders, not as pub.dev content.
- This package has no picker-style runtime `assets/` requirement. Avoid deleting assets or excluding whole folders based on another repository's publishing recipe.
- Flutter tool generated example platform files are deliberately untracked. Do not re-add them to git.

## Deployment wiring

`.github/workflows/deploy.yml` declares a published GitHub release trigger (`release: types: [published]` on `master`) and also lists `push`/`pull_request` on `branches: [none]`. Only the release trigger is the normal deploy path. Production GitHub Pages path slug is `WEB_VERSION` in [`.github/web-deploy.env`](../../../.github/web-deploy.env) (currently `v9-0`). Change that file when starting a new frozen minor/major. It builds all five web examples from `example/` to versioned JS paths, then a WASM Playground to Netlify:

- example1 → `/flexcolorscheme/basictheme-${WEB_VERSION}/`
- example2 → `/flexcolorscheme/customtheme-${WEB_VERSION}/`
- example3 → `/flexcolorscheme/fourthemes-${WEB_VERSION}/`
- example4 → `/flexcolorscheme/allthemes-${WEB_VERSION}/`
- example5 Playground JS → `/flexcolorscheme/themesplayground-${WEB_VERSION}/` (`-t lib/example5_themes_playground/main.dart`)
- example5 Playground WASM → [https://playground.flexcolorscheme.com/](https://playground.flexcolorscheme.com/) (`flutter build web --wasm`, [example/netlify.toml](../../../example/netlify.toml))

Also present: `test.yml` (active PR/push CI and Codecov), `deploy_dev.yml` / `deploy_dev_playground.yml` (dev paths, unchanged `*-dev`), `deploy_playground.yml` (Playground JS to `${WEB_VERSION}` plus Netlify WASM), `deploy_playground_netlify.yml` (Netlify-only Playground), `build.yml`, `validate.yaml`. Inspect their triggers and destinations before selecting one; do not describe workflows restricted to branch `none` as normally running on master or as manually dispatchable without checking `workflow_dispatch`.

When a full release is authorized, confirm the desired version and readiness, publish the package, then create the intended tag/GitHub release once package publication is confirmed. Check the resulting workflow and published package/Playground. No version bump, workflow edit, publishing, or deployment follows merely from installing this skill.
