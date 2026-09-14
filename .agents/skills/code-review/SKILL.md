---
name: code-review
description: Review FlexColorScheme changes for correctness, API stability, Playground completeness, and conventions. Use when reviewing a pull request, branch, or uncommitted diff, or when the user asks for a code review.
---

# Code review

Review the requested scope: current branch, given files or folders, a specific change, or all uncommitted work.

When reviewing the **entire current branch**, start from its real base (usually `master`). Do not review merge commits from other branches. Limit the review to work actually done on this branch. Preserve the author's working tree.

## Summary

First explain intent: what changed, why, and how it is implemented. Call out user benefit and impact on the published API. Use a mermaid flowchart only when a new theme or Playground path is hard to follow in prose.

## Principles

Find issues automated review bots would flag, before they do.

### Structure

- Number findings by **major**, **medium**, **minor**.
- Say what is good as well as what is bad.
- Be direct and polite.

### Complexity

Prefer simple, clear code. Flag over-engineering that does not add value. Suggest simplifications that keep behavior unchanged.

### Dead code

Unused variables, functions, classes, consts, and commented-out blocks.

### Logging, documentation, tests

- This package has no app logging stack. Do not ask for log statements.
- Documentation: public `///` on `lib/` API; comments on non-obvious paths. Path moves must update imports, comments, README, and example — not only Dart imports. See [.agents/skills/code-documentation/SKILL.md](../code-documentation/SKILL.md).
- Testing: new theme behavior needs focused package tests. There is **no** 100% coverage gate; missing coverage of a new branch or M2/M3 path is still a defect. See [.agents/skills/package-development/SKILL.md](../package-development/SKILL.md).

Ignore generated file churn (`coverage/`, `build/`, `.dart_tool/`).

## Package review checks

Classify by real impact (major / medium / minor).

### API stability

- New required parameters, renamed public symbols, or default flips. `useExpressiveOnContainerColors` defaulting to true in 9.0.0 is the cautionary case.
- Light/dark factory symmetry and `FlexThemeData.light` / `.dark` forwarding for new factory parameters.
- Expanding [`lib/flex_color_scheme.dart`](../../../lib/flex_color_scheme.dart) needs demand and a stability review. FlexSeedScheme is re-exported; FSS breaks are FCS breaks.
- `FlexSubThemesData.copyWith` must keep `field: field ?? this.field` nullable-copy semantics.

### Themes

- Explicit overrides versus fallbacks, brightness, M2/M3, surface/on-color contrast, seeded palette consistency, and platform adaptation.
- Seed keys are not role colors unless keep flags or overrides pin them.
- Do not reintroduce `background` / `onBackground` / `surfaceVariant` on FCS types, or removed `useTextTheme` / `useFlutterDefaults` / `blendTextTheme`.

### Flutter 3.47 / color values

- Material/Cupertino widgets stay on `material_ui` / `cupertino_ui`. Rewriting to `package:flutter/material.dart` is major (Playground **generated consumer** strings currently still emit the old imports — do not "fix" them as part of an unrelated review unless that is the task).
- Do not reintroduce deprecated `Color.value` or `.red` / `.green` / `.blue` / `.alpha`. Use `value32bit` / `*8bit`.

### Playground

New settings need Store key + default + `storageKeys` allowlist, controller load/set/reset, UI control, **both** light and dark theme builders, and emitted code. Follow [Playground development](../themes-playground-development/SKILL.md). A visible UI change alone is **major**.

### Generated code

Verify actual emitted Dart and the configured theme behavior. A fragment may exist but be absent from one assembly branch. Use the [generation skill](../themes-playground-code-generation/SKILL.md).

### Docs and example

- README, dartdoc, and `example/` stay aligned for user-facing behavior. Flag `[Symbol]` in function or factory **parameter-level** `///` comments (they do not resolve; body comments should use `## [paramName]` catalogs with `[Symbol]`, while parameter blurbs use backticks). Flag unresolved comment references that should use `@docImport`, `[Class.member]` qualification, or backticks for literals, non-dependencies, and removed APIs.
- CHANGELOG section tags when the change will ship (`Package` / `Test` / `Themes Playground`).

### Analyzer and format

- `dart format` and `dart analyze` clean. New `// ignore:` needs a reason that survives being read aloud.

## Reporting

Use GitHub-friendly markdown: `#` / `##` / `###` headings, numbered lists. Follow [AGENTS.md](../../../AGENTS.md) Markdown Style (one paragraph or bullet per line; do not hard-wrap prose). Do **not** use wide tables or `::code-comment` fences (GitHub cannot parse the latter).

### Implementation analysis

If a simpler approach would reach the same outcome, show it with a snippet. If the change is sound, do not invent noise. Do not manufacture a 100% coverage gate.

### Fix suggestions

For each numbered finding, give an adoptable snippet and any extra tests (numbered `FCS*` / `FSTC*` groups or `flex_sub_themes_*_test.dart`) that should land with the fix.

## Summary counts

- Issues by level: major, medium, minor
- Fix suggestions
- Additional tests suggested
