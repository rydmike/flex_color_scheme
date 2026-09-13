---
name: release
description: Prepare or verify a FlexColorScheme release, version bump, pub.dev package contents, or Themes Playground deployment. Use when release work is requested; ordinary edits do not trigger publishing.
---

# Release

Read the [release checklist](references/release-checklist.md) for version sources, artifact contents, and actual deployment wiring. Inspect workflows before relying on their comments or on assumed CI coverage.

Separate readiness assessment from external actions. A request to check readiness does not authorize publishing, pushing tags, or creating a GitHub release. Execute external release steps only within the user's requested scope and preserve any authorization already given.

The repository is migrating to Flutter 3.47+. Do not present unfinished tests/lints or outdated generated code as release-ready, and do not expand a readiness review into fixing the migration unless requested. Record blockers and the checks actually performed.
