---
name: package-development
description: Develop and maintain FlexColorScheme: public ThemeData factories, FlexSubThemesData, seeding, tests, and examples. Use when editing this package's lib/, package tests, or CI; use the Playground skills for Playground state, UI, and emitted code.
---

# Package development

Maintain FlexColorScheme as a public Flutter package. Consumer usage belongs in [.agents/skills/flex-color-scheme/SKILL.md](../flex-color-scheme/SKILL.md). Documentation and review conventions are separate skills. Color-to-ThemeData map: [docs/guides/architecture.md](../../../docs/guides/architecture.md).

## Public vs internal

Barrel [`lib/flex_color_scheme.dart`](../../../lib/flex_color_scheme.dart) exports:

- `FlexColorScheme`, `FlexThemeData`, `FlexSubThemes`, `FlexSubThemesData`
- Palettes: `FlexColor`, `FlexScheme`, `FlexSchemeColor`, `FlexSchemeData`
- Seeding: `FlexKeyColors` (FlexSeedScheme is **re-exported** from this barrel)
- Surfaces and helpers: `FlexSurfaceMode`, `FlexSchemeOnColors`, `FlexSchemeSurfaceColors`, `FlexAdaptive`, `FlexSplashType`, color extensions
- Widget: `FlexThemeModeSwitch`

Inspect the barrel before treating a type as public. Presence of a source file is not an export. Do not expand the barrel without discussion.

Do not construct `FlexSeedScheme`. It is `@internal` in FlexSeedScheme. Callers use `SeedColorScheme.fromSeeds` via the re-export, or FCS `keyColors` / `tones` / `variant` on the factories.

Tests may import `package:flex_color_scheme/src/...`; apps must not.

## Flutter 3.47 UI packages

Material and Cupertino widgets come from `package:material_ui/material_ui.dart` and `package:cupertino_ui/cupertino_ui.dart`. Do not rewrite those imports to `package:flutter/material.dart`.

Persist and compare `Color` with `value32bit` / `alpha8bit` / `red8bit` / `green8bit` / `blue8bit`. Do not reintroduce deprecated `Color.value` or `.red`.

[`test/google_fonts_text_theme.dart`](../../../test/google_fonts_text_theme.dart) adapts `google_fonts` `TextTheme` (still typed against `package:flutter/material.dart`) into `material_ui` `TextTheme`. Keep that adapter until `google_fonts` ships Material-decoupled types.

## File map

| Task                                                 | Where                                                                                                          |
| ---------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| Factories, seeding, blending, `toTheme` / `toScheme` | [`flex_color_scheme.dart`](../../../lib/src/flex_color_scheme.dart)                                            |
| `FlexThemeData.light` / `.dark` forwarding           | [`flex_theme_data_extensions.dart`](../../../lib/src/flex_theme_data_extensions.dart)                          |
| Component config object                              | [`flex_sub_themes_data.dart`](../../../lib/src/flex_sub_themes_data.dart)                                      |
| Component `ThemeData` builders                       | [`flex_sub_themes.dart`](../../../lib/src/flex_sub_themes.dart)                                                |
| Built-in palettes                                    | [`flex_color.dart`](../../../lib/src/flex_color.dart), [`flex_scheme.dart`](../../../lib/src/flex_scheme.dart) |
| Seed inputs and keep flags                           | [`flex_key_color.dart`](../../../lib/src/flex_key_color.dart)                                                  |
| Surfaces, on-colors, alpha                           | `flex_scheme_surface_colors.dart`, `flex_scheme_on_colors.dart`, `flex_alpha_values.dart`                      |
| Adaptive platforms                                   | [`flex_adaptive.dart`](../../../lib/src/flex_adaptive.dart)                                                    |
| Color math / hex                                     | [`flex_extensions.dart`](../../../lib/src/flex_extensions.dart)                                                |

## Trace the change

Distinguish an API's declared constructor default from its **effective** default after color, brightness, platform, Material mode, and component fallbacks. Test the observable `ThemeData` / `ColorScheme` result.

### Factory option

A new `FlexColorScheme.light` / `.dark` parameter needs matching forwarding in `FlexThemeData.light` / `.dark`. Inspect both brightness paths. Verify direct `FlexColorScheme(...)` construction only where the option participates.

`toTheme` and `toScheme` are **getters** (no parentheses).

### Component option

Follow `FlexSubThemesData` through `FlexColorScheme.toTheme` into the matching `FlexSubThemes` builder. When adding a field, update together:

- Constructor, field, and dartdoc
- `copyWith` (keep `field: field ?? this.field` — this class cannot copy a nullable field back to null)
- Equality, hash, diagnostics
- The `FlexSubThemes` method that reads it
- Tests for the data object and the component theme

Omission of `subThemesData` and `const FlexSubThemesData()` are different configurations.

### Seeding

`FlexKeyColors` opts into FlexSeedScheme generation. Seed keys set hue/chroma; they are not role colors unless `keepPrimary` / `keepSecondary` / related flags retain them. Built-in `scheme` seeding uses the **light** palette's seeds for dark too. `useExpressiveOnContainerColors` defaults **true** since 9.0 (light on-container tone 30).

## Testing

There is no 100% coverage gate. New branches and user-visible theme behavior still need tests. `example/test/widget_test.dart` is empty; it does not replace package unit tests.

Use current filenames and group names from `test/`. Common numbered groups: `FCS1` (`FlexColorScheme`), `FSTC1` (`FlexSubThemesData`), `FKCS1` (`FlexKeyColors`), `FSOC1` (`FlexSchemeOnColors`), `FC1` (`FlexColor`). Many component files use `group('WITH: FlexSubThemes.<method> ', …)`.

| Change                    | Tests                                                                                                     |
| ------------------------- | --------------------------------------------------------------------------------------------------------- |
| `FlexSubThemesData` field | `flex_sub_themes_data_test.dart` (construct, copy, `==` / hash, diagnostics) plus the component file      |
| Component builder         | `test/flex_sub_themes_<widget>_test.dart` (and `flex_sub_themes_bottom_navigation_bar_test.dart` for BNB) |
| Factory / `toTheme`       | `flex_color_scheme_test.dart`, `flex_color_scheme_to_theme_test.dart`                                     |
| Seeding / key colors      | `flex_color_scheme_key_colors_test.dart`, `flex_key_color_test.dart`                                      |
| Surfaces / on-colors      | `flex_scheme_surface_colors_test.dart`, `flex_scheme_on_colors_test.dart`                                 |
| Adaptive / splash         | `flex_adaptive_test.dart`, `flex_splash_type_test.dart`                                                   |
| Built-in schemes          | `flex_color_test.dart`, `flex_scheme_test.dart`, `flex_scheme_color_test.dart`                            |

Cover omitted vs explicit values, light and dark, M2 and M3, and affected overrides. For seeded or blended color changes, add focused cases for the affected roles. Avoid rewriting unrelated goldens.

Resolve root and `example/` packages separately when needed. Run targeted Flutter tests and analysis/format on the changed scope; full `fvm flutter test --coverage` is for broader behavior changes and release validation. Existing failures do not justify suppressing new ones or widening the task.

## Do not edit without intent

- Built-in scheme tables in `flex_color.dart` / `flex_scheme.dart`
- `copyWith` nullable-copy convention (`?? this.field`)
- `coverage/`, `build/`, `.dart_tool/`
- Generated Claude mirrors (`CLAUDE.md`, `.claude/skills/`) — regenerate with `./scripts/sync_claude_code_config.sh`
- SDK constraints or lint policy as a side effect of a feature
- Adding a second `flex_seed_scheme` dependency inside this package (it is already a dependency and re-exported)

## Example and Playground

`example/` is a separate package (`path: ../`). Five themed entrypoints, plus a copy-paste sandbox:

- `example/lib/example1_basic_theme_usage/main.dart`
- `example/lib/example2_custom_theme/main.dart`
- `example/lib/example3_four_themes/main.dart`
- `example/lib/example4_all_themes/main.dart`
- `example/lib/example5_themes_playground/main.dart` — Themes Playground (`ThemeController` + `ChangeNotifier`, not Riverpod)
- `example/lib/example_copy_paste_from_playground/main.dart`

The Playground is example 5, not FlexColorPicker's `example/lib/demo/`.

User-facing API changes should show up in the Playground when the option is configurable, and in a simpler example when callers are expected to copy the pattern. A package parameter alone does **not** add a Playground control — follow [Playground development](../themes-playground-development/SKILL.md), including its code-generation handoff.

CHANGELOG tags: `BREAKING`, `FIX`, `CHANGE`, `NEW`, `CHORE`, `DOCS` under `Package` / `Test` / `Themes Playground`. Web demos deploy from GitHub **release** via `.github/workflows/deploy.yml`, not from `dart pub publish`. CI (pull requests and pushes to `master`): `dart analyze`, `dart format --output=none --set-exit-if-changed .`, `flutter test --coverage` → Codecov. Release deploys also upload coverage with `override_branch: master`. Other workflows still use `branches: [none]`; inspect triggers before describing them as running. Publishing to pub.dev is manual.

## Lint config is published externally

[analysis_options.yaml](../../../analysis_options.yaml) is the versioned "RydMike LINTER Preferences" file (see its version header), publicly shared as a gist: https://gist.github.com/rydmike/fdb53ddd933c37d20e6f3188a936cd4c. [all_lint_rules.yaml](../../../all_lint_rules.yaml) is its companion all-rules list, manually maintained from https://dart.dev/tools/linter-rules/all.

When either file changes (rule toggled, severity changed, formatter setting, version bump):

1. Bump/update the version header comment in `analysis_options.yaml` when the change is a rule or config change (not for pure comment fixes).
2. Add a CHANGELOG `CHORE` note describing the rule change.
3. Remind the user to post the updated `analysis_options.yaml` to the gist — the gist is updated manually by the user and must stay in sync with rule changes here.

## Style reminders

Package imports, `dart format`, `public_member_api_docs` on `lib/`. Unresolved dartdoc `[Type]` fails CI. Details: [AGENTS.md](../../../AGENTS.md) and [.agents/skills/code-documentation/SKILL.md](../code-documentation/SKILL.md).
