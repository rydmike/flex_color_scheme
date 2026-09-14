---
name: code-documentation
description: Update Dart documentation for completeness and helpfulness in FlexColorScheme. Use when the user asks for documentation, and when creating or updating public API, comments, README, or CHANGELOG.
---

# Code documentation

Document intent and purpose so humans and agents can maintain this package. The user may request a scope: file(s), folder(s), a selected change, or uncommitted work.

**Never** document the entire repository in one pass.

Consumer tutorials live in the portable [consumer skill](../flex-color-scheme/SKILL.md). Internal navigation belongs in the [architecture guide](../../../docs/guides/architecture.md).

## Existing comments

- Do not remove or shorten comments unless the user asks, or the comment is stale, wrong, or refers to removed APIs.
- When you touch a comment, leave it more accurate than before.

## Completeness

- Public classes, enums, constructors, and members in `lib/` need `///` dartdoc. `public_member_api_docs` is enforced on the package; the example app turns it off.
- Private helpers use `//`. Terse is fine when the code is obvious; add more when the logic is not (seed vs role color, blend math, M2/M3 fallbacks, adaptive platforms).
- Explain purpose, defaults, interactions, and effective fallback behavior. Distinguish `null` (often delegation to another default) from explicit false or zero, and explain light/dark or M2/M3 differences when they affect callers. Usage tutorials belong in README and the consume skill, not in every member doc.

### Dartdoc references

- **`//` comments:** Do not use `[Type]` or `[member]`. Dartdoc does not resolve them there. Use ASCII backticks.
- **`///` comments:** Use `[Type]` / `[member]` only when the symbol is in dartdoc scope. Unresolved references produce analyzer info-level issues that fail CI.

Dartdoc `[Symbol]` links resolve in class docs, field docs, and the **body** comment of a function or factory (the `///` block above the signature). They do **not** resolve in parameter-level `///` comments and become `comment_references` infos with dead API-doc links.

For functions and factory constructors: keep a purpose/overview in the body comment, then document every parameter there in parameter-list order as `## [paramName]` headings (blank line after each heading). Use resolvable `[Symbol]` links in those body sections. Keep a short parameter-level `///` (typically 1–3 sentences) for in-source scanning, and use backticks for names, types, and members — never `[Symbol]`. Class constructors that document fields (`///` above `final` members) are not this rule; those field docs still use `[Symbol]`.

Qualify out-of-scope members as `[Class.member]` (for example `[ColorScheme.primary]`, `[ListTile.selected]`, `[FlexSubThemesData.defaultRadius]`). Do not write `[colorScheme.primary]` or other dotted instance paths; they do not resolve.

Prefer `@docImport` on a `library;` directive to bring types into dartdoc scope without a real import. Convert comment-only imports to `@docImport`. Part files inherit the parent library's doc imports.

Use backticks for boolean literals, packages that are not `lib/` dependencies (for example `GoogleFonts`), and removed APIs that still need a historic note (`surfaceStyle`, `FlexSurface`). Do not add a real import solely so a documentation reference resolves.

### Language

- Use US English.
- Use simple, direct language. Avoid jargon that does not help.
- Short `dart` snippets on `FlexThemeData`, `FlexKeyColors`, and `FlexSubThemesData` are welcome when they show a default, an interaction, or a migration. Do not paste the README.
- README, skills, and `docs/` follow [AGENTS.md](../../../AGENTS.md) Markdown Style: one paragraph or bullet per line; do not hard-wrap prose. Leave fenced code, tables, and headings as they are.
- Current 9.x examples and Playground-generated setup use the SDK-decoupled UI packages (`material_ui` / `cupertino_ui`). Do not document `package:flutter/material.dart` as the consumer import.

### Magic numbers

- Prefer a named local or static constant when a number is reused or its meaning is not obvious from context.
- Document what the value is, what it does, and how it was chosen when that is known (Material spec radius, blend level, seed chroma).

## Verify claims against code

Any doc comment stating a number (default, count, tone, version) must be verified against its source of truth before you write or keep it. Sources of truth:

- Factory parameter defaults in [`flex_color_scheme.dart`](../../../lib/src/flex_color_scheme.dart) and forwarding in [`flex_theme_data_extensions.dart`](../../../lib/src/flex_theme_data_extensions.dart)
- `FlexSubThemesData` constructor defaults in [`flex_sub_themes_data.dart`](../../../lib/src/flex_sub_themes_data.dart) — these are **not** always the eventual widget appearance
- Effective component fallbacks in [`flex_sub_themes.dart`](../../../lib/src/flex_sub_themes.dart)
- `FlexKeyColors` defaults in [`flex_key_color.dart`](../../../lib/src/flex_key_color.dart) — `useExpressiveOnContainerColors` true when undefined since 9.0
- Playground `Store` defaults in `example/lib/shared/const/store.dart` — UI/reset only; **not** package omission conditions

`FlexSubThemesData` field defaults alone may not describe the widget. Trace `FlexColorScheme` and the corresponding `FlexSubThemes` method. Document `toTheme` and `toScheme` as getters; `FlexThemeData.light` / `.dark` return `ThemeData` directly.

Get version and SDK requirements from pubspecs, formatting from analyzer configuration, and exported types from the barrel. Avoid static counts of schemes, properties, or tests.

Historic traps — claims that keep resurfacing stale:

- `surfaceStyle` / `FlexSurface`: removed; historic notes use backticks
- `background`, `onBackground`, `surfaceVariant`: removed from FCS types in 9.0 — use `surface` / `onSurface`
- `useTextTheme`, `useFlutterDefaults`, `blendTextTheme`: removed in 9.0 — use `useMaterial3Typography` instead of `useTextTheme`
- `FlexColorScheme.createPrimarySwatch`: moved to FlexColorPicker `ColorTools.createPrimarySwatch`
- `toTheme` / `toScheme` are getters, not methods
- `useExpressiveOnContainerColors` defaults to **true** since 9.0 (light on-container tone 30)
- Playground generated setup emits `material_ui` / `cupertino_ui`, matching in-repo consumer imports

## Public API docs

On `FlexColorScheme` / `FlexThemeData` factories, `FlexSubThemesData`, and `FlexKeyColors`, cover:

- What the API is for and when to choose it
- Defaults and null semantics (omission vs `const FlexSubThemesData()` vs explicit false/zero)
- Interactions: `scheme` vs `colors` vs `colorScheme` vs direct args; seeding vs keep flags; `tones` vs `variant`
- Light/dark and M2/M3 differences that still affect callers
- Breaking or default-flip history when it still affects callers

## On-demand extras

Only when the user asks, or when the change is user-facing:

- Update README and CHANGELOG for behavior or API that consumers will notice
- Keep comments in `example/` accurate, especially Playground panels and generated-code comments

CHANGELOG sections: `Package`, `Test`, `Themes Playground`. Tags: `BREAKING`, `NEW`, `FIX`, `CHANGE`, `CHORE`, `DOCS`. Do not add package release notes for routine agent-tooling edits unless requested.

Do not create per-folder README files under `lib/`.
