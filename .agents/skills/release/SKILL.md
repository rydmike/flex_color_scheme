---
name: release
description: Release FlexColorScheme to pub.dev and deploy the five web examples including Themes Playground. Use when publishing a new version, making a dev/prerelease, bumping the version, tagging a release, or verifying release readiness.
---

# Release

Releases are manual and ordered. Publishing to pub.dev does NOT deploy the web examples — publishing a **GitHub release** does, via [.github/workflows/deploy.yml](../../../.github/workflows/deploy.yml).

A request to check readiness does not authorize publishing, pushing tags, or creating a GitHub release. Execute external release steps only within the user's requested scope.

FCS-specific version sources, `.pubignore` notes, and workflow inventory: [release-checklist.md](references/release-checklist.md). Inspect workflows before relying on their comments or on assumed CI coverage.

## Versioning

- `version:` lives in [pubspec.yaml](../../../pubspec.yaml). CHANGELOG top section heading must match it, with a `**Mon DD, YYYY**` date line.
- Keep [example/pubspec.yaml](../../../example/pubspec.yaml) and Playground [`App.version`](../../../example/lib/shared/const/app.dart) (`versionMajor` / `versionMinor` / `versionPatch` / `version`) in sync. Generated theme comments and exports use `App.version`.
- Prereleases for testing on pub use `-dev.N` (example: `9.0.1-dev.1`), released with a `chore:` commit. The final version gets its own CHANGELOG heading; fold the dev-release notes into it.
- Flutter's guidance: a bump of the required Flutter SDK is a **major** release even with no API changes — state that explicitly in the CHANGELOG (see 9.0.0).

## Pre-flight (all must pass)

```bash
fvm flutter pub get
(cd example && fvm flutter pub get)
fvm dart analyze
fvm dart format --output=none --set-exit-if-changed .
fvm flutter test --coverage
dart pub publish --dry-run
```

Also verify:

- CHANGELOG top section: correct version, date, and tags (`BREAKING`, `FIX`, `CHANGE`, `NEW`, `CHORE`, `DOCS` under `Package` / `Test` / `Themes Playground`).
- There is no 100% coverage gate; still do not ship with unexplained test failures or missing tests for the release's behavior changes.
- README and `example/` updated for any user-facing change. Latest Playground is [https://playground.flexcolorscheme.com/](https://playground.flexcolorscheme.com/). GitHub Pages JS paths use the slug in [`.github/web-deploy.env`](../../../.github/web-deploy.env) (`WEB_VERSION`, currently `v9-0`).
- No dry-run warnings you cannot explain, and review the dry-run archive file tree. A multi-MB jump means `resources/` or other internal docs leaked in.
- Smoke-test the Playground and copied generated setup when the release touches them. Generated output still emits `package:flutter/material.dart`; report that as a known consumer-import mismatch, not as a silent pass after you rewrote the string.

## Publishing contents — .pubignore

The root [.pubignore](../../../.pubignore) controls what is published. Details and screenshot rules: [release-checklist.md](references/release-checklist.md).

## Publish

1. Commit and push; PR to `master` if not already there. The Test workflow is the active PR/push CI. Do not treat other workflows with `branches: [none]` as proof that CI ran.
2. `dart pub publish` — manual, interactive; the user runs it or explicitly asks for it.
3. Tag `X.Y.Z` and publish a **GitHub release** with the CHANGELOG section as body.
4. The GitHub release triggers [deploy.yml](../../../.github/workflows/deploy.yml): analyze → format check → tests → Codecov → build all **five** web examples to versioned GitHub Pages paths from `WEB_VERSION` → WASM Playground to Netlify. Playground JS: `lib/example5_themes_playground/main.dart` with base href `/flexcolorscheme/themesplayground-${WEB_VERSION}/`. Latest communicated Playground URL is [https://playground.flexcolorscheme.com/](https://playground.flexcolorscheme.com/).

## Post-release

- Check the pub.dev page: version, score, changelog rendering, screenshots.
- Check the Netlify Playground URL serves the new WASM build, and the versioned GitHub Pages JS apps (`/flexcolorscheme/{app}-${WEB_VERSION}/`) boot. Do not promise deploy succeeded just because a GitHub release was created.
- To freeze a minor/major, change `WEB_VERSION` in [`.github/web-deploy.env`](../../../.github/web-deploy.env) (for example `v9-0` → `v9-1`) before the next prod deploy. Previous path folders on `rydmike/rydmike.github.io` stay untouched. Do not copy from a `-latest` folder; that path is retired.
- After the first 9.0 deploy to `-v9-0`, delete the five leftover `*-latest` folders on GitHub Pages. 8.4 was snapshotted to `*-v8-4` with rewritten `base href` before that deploy.

## Do not

- Publish with failing package tests you introduced, or present unfinished generated-code imports as if they were already migrated.
- Create the GitHub release before pub publish succeeded (the demos would advertise an unpublished version).
- Edit released CHANGELOG sections later — corrections get a new entry.
- Exclude `example/screenshots/` from `.pubignore`.
- Expand a readiness review into fixing unrelated CI or generator work unless requested.
