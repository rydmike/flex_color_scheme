# Package architecture

Use this map to locate behavior, then read the relevant implementation and tests. Consumer recipes belong in the portable [consumer skill](../../.agents/skills/flex-color-scheme/SKILL.md); maintainer workflow belongs in [package development](../../.agents/skills/package-development/SKILL.md).

## Color inputs to ThemeData

1. The public barrel, `lib/flex_color_scheme.dart`, exports the supported FlexColorScheme API and re-exports FlexSeedScheme. Inspect the barrel before calling a type public; the presence of a source file alone does not make it exported.
2. `FlexScheme` selects built-in palettes in `FlexColor`; `FlexSchemeColor` describes one brightness and `FlexSchemeData` combines light/dark definitions and metadata. Applications can supply custom colors or a `ColorScheme` instead.
3. `FlexColorScheme.light` and `.dark` resolve color inputs, defaults, legacy swaps, surface blending, and optional seeding. `FlexKeyColors` controls seed inputs and retained colors; FlexSeedScheme supplies the tonal machinery. This package does generate color schemes.
4. `FlexSubThemesData` supplies flat component configuration. `FlexColorScheme.toTheme` routes that configuration into `FlexSubThemes` builders and assembles `ThemeData`. Trace precedence in the factory, conversion, and component builder rather than assuming a single global rule.
5. `toTheme` and `toScheme` are getters. `FlexThemeData.light` / `.dark` are convenience APIs that return `ThemeData` directly. Changes to factory parameters may need matching forwarding in these helpers.

## Maintenance boundaries

- `lib/src/flex_sub_themes_data.dart`: constructor/defaults, fields, `copyWith`, equality, hash, and diagnostics are maintained together.
- `lib/src/flex_sub_themes.dart`: component themes and Material-specific fallback behavior.
- `lib/src/flex_color_scheme.dart`: factory resolution and theme assembly; inspect both brightness paths.
- `lib/src/flex_theme_data_extensions.dart`: convenience API forwarding.
- `lib/src/flex_scheme_on_colors.dart`, `flex_scheme_surface_colors.dart`, and `flex_extensions.dart`: derived colors, surfaces, and color utilities. Preserve contrast and alpha behavior with focused tests.
- `test/`: matching data-object, subtheme, conversion, extension, and seeded-color suites. Use filenames and test groups from the current tree rather than copied test names.

## Examples and Playground

`example/pubspec.yaml` depends on the package by `path: ../`; dependencies must be resolved separately at the root and in `example/`. Five example entrypoints demonstrate increasing configuration depth. The Playground is example 5, not `example/lib/demo/`.

The Playground uses `ThemeController` with `ChangeNotifier`, generic `ThemeService` implementations, `Store` defaults/keys, and explicit widget controls. Its builders create configured themes and add Playground-specific extensions and preview adjustments. Generated consumer code and exported ColorSchemes serve different purposes; neither is a serialization of the entire app theme.

Use the [Playground development skill](../../.agents/skills/themes-playground-development/SKILL.md) for its state/UI map and the [code-generation skill](../../.agents/skills/themes-playground-code-generation/SKILL.md) for output behavior. The real `flex_color_picker` dependency is used for Playground color selection; this repository is not the picker package.
