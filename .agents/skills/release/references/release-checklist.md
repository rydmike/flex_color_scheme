# Release checklist

Paths below are relative to the repository root.

## Versions and validation

Check `pubspec.yaml`, `example/pubspec.yaml`, `example/lib/shared/const/app.dart`, and the current `CHANGELOG.md` section together. The Playground's `App.version` also appears in exports and generated code. Preserve the repository's versioning intent; do not infer a release date from the execution date or rewrite already released entries.

Inspect SDK constraints and the selected SDK before dependency resolution. Resolve root and example packages separately. For an actual release, run analysis, a non-mutating format check, full package tests with coverage, and a pub publish dry-run using the chosen SDK. Smoke-test the Playground and copied generated code when relevant to the release. Current migration failures must be reported; there is no established 100% coverage gate in this guidance.

The older workflow configuration is not proof of validation: several push/PR triggers use `branches: [none]`, and some commands may predate the current SDK. Read `.github/workflows/` before describing what runs. Changing CI is a separate task.

## Package contents

Review `.pubignore` and the file list reported by `dart pub publish --dry-run` (or `fvm dart pub publish --dry-run`). Preserve the publishing-relevant ignore rules already present. Agent instructions, local Claude mirrors, internal `docs/`, and tooling `scripts/` are not package deliverables. Canonical skills are stored in the hidden `.agents/` tree and shared separately as skill folders.

Verify every screenshot path declared in the root pubspec exists and is included. Check any actual runtime assets against the applicable pubspec; this package has no picker opacity-asset requirement. Avoid deleting assets or excluding whole folders based on another repository's publishing recipe. Dry-run success alone does not prove server acceptance or app runtime behavior.

## Deployment wiring

`.github/workflows/deploy.yml` declares a published GitHub release trigger and builds all five web examples. The Playground target is `lib/example5_themes_playground/main.dart` within `example/`, with the `/flexcolorscheme/themesplayground-latest/` base path. This is distinct from publishing the Dart package to pub.dev.

The repository also has `deploy_dev.yml`, `deploy_playground.yml`, `deploy_dev_playground.yml`, and a Netlify workflow. Inspect their triggers and destinations before selecting one; do not describe workflows restricted to branch `none` as normally running on master or as manually dispatchable without checking `workflow_dispatch`.

When a full release is authorized, confirm the desired version and readiness, publish the package, then create the intended tag/GitHub release once package publication is confirmed. Check the resulting workflow and published package/Playground. Do not promise the deployment succeeded just because a release was created. No version bump, workflow edit, publishing, or deployment follows merely from installing this skill.
