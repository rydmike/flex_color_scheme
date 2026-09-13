# Generator map and validation

Paths below are relative to `example/lib/example5_themes_playground/` unless stated otherwise.

## What generates what

`utils/generate_theme_dart_code.dart` implements `generateThemeDartCode(ThemeController)`. It computes color configuration and property strings, builds separate `lightSubTheme` / `darkSubTheme` blocks under `controller.useSubThemes`, and assembles light/dark `FlexThemeData` setup. Shared settings still need insertion in both blocks. Direct theme arguments belong in the top-level assemblies, not automatically in `FlexSubThemesData`.

`widgets/panels/theme_code/theme_code_panel.dart` and `widgets/dialogs/show_copy_setup_code_dialog.dart` consume this output. Check callers when changing presentation or wrapping; do not assume a saved UI setting controls generation.

`utils/generate_colorscheme_dart_code.dart` separately calls the light/dark FlexColorScheme builders and their `.toScheme` getters, then emits concrete role colors. ColorScheme output carries no component styling. A new component option generally needs theme-generation work but no ColorScheme serializer change; a change to color roles may affect both.

The preview configuration is in `theme/flex_theme_light.dart` / `flex_theme_dark.dart`. Their ThemeData wrappers add app-specific extensions and adjustments. `theme/theme_values.dart` and the shared adaptive models supply effective values. Decide whether output needs a portable adaptive rule or a fixed effective value; do not accidentally bake a simulator choice into a rule intended to adapt on the consumer's device.

## Current output modes and migration limits

As inspected during the Flutter 3.47 migration, the enabled FlexColorScheme path emits an `AppTheme` class with static light/dark themes. The disabled path returns inline MaterialApp theme arguments for a plain M2/M3 starting point. It does not serialize all Playground configuration.

`generateCodeForOwnFile` is still stored in the controller and Store, but the generator and current callers do not read it. Do not document this flag as a working inline/own-file toggle. Test each output shape the code actually supports; implementing that toggle requires an explicit behavior change.

The generator currently emits old `package:flutter/material.dart` and `package:flutter/cupertino.dart` imports, while this checkout uses `material_ui` and `cupertino_ui`. The ColorScheme generator also contains an older SDK-requirement comment. These are existing migration discrepancies, not authoritative consumer examples. Re-check them when working on output and remove this note once fixed. Documentation work must not fix the Dart generator incidentally.

## Adding an emitted argument

1. Read the package parameter docs and effective fallback in the constructor/conversion/component builder. Compare with the controller's default and preview use. `Store` defaults control UI/reset behavior; they are not necessarily the omission condition for generated consumer code.
2. Build a correctly typed fragment: enum identifier rather than a quoted display label, valid numeric literal, portable color formatting via the existing helper, and appropriate const placement. Null usually suppresses a nullable argument; preserve explicit false and zero when semantically distinct.
3. Insert shared component fragments in both `lightSubTheme` and `darkSubTheme`; insert brightness-specific fragments only in their matching branches. Direct factory arguments go in each relevant `FlexThemeData` call. Update section header conditions when needed so empty sections do not retain misleading headers.
4. Check controlling flags such as `useSubThemes`, seeding, Material mode, or adaptive selections. A disabled option can remain stored without appearing in output. Re-enabling it should restore the intended configuration.
5. Trace the output consumers and inspect the final string. Test the actual class or inline shape instead of assuming every return value is a complete Dart file.

## Validation recipe for future behavior changes

Use the SDK and dependencies required by the current root/example pubspecs. Do not modify tracked migration files merely to construct a passing check.

- Initialize a controller with an appropriate test service and await `loadAll()`. `ThemeServiceMem` suffices for default-based generation but not storage round trips; use a recording/persistent service when testing saved values.
- Generate cases for defaults and non-defaults; nullable numbers include null and valid zero, nullable bools include null/true/false, and enums include null plus a non-default value. Use visibly different light/dark values to catch branch mix-ups.
- Add relevant gate cases: subthemes off/on, seeding off/on, built-in/custom inputs, M2/M3, and adaptive platform behavior. Choose combinations affected by the change rather than a combinatorial full-matrix test.
- Save class output unchanged as a temporary Dart source in an isolated Flutter fixture using a path dependency on the current package. Wrap inline theme arguments in a minimal MaterialApp file with compatible imports. Wrap ColorScheme declarations with the imports they require. Add the fixture's direct dependencies for its imports.
- Resolve and analyze the fixture; run focused Flutter tests that import the emitted source. Compare affected fields in `AppTheme.light` / `.dark` to the corresponding preview configuration, accounting for Playground-only wrappers. For stateful component colors, resolve the relevant widget states. Compare emitted ColorScheme roles to `.toScheme` results separately.
- Check the visible code/copy path and the live control in the Playground when feasible. A successful compile establishes valid symbols and types, not complete visual parity.

Keep generated sources outside tracked package/example files unless the feature task intentionally adds a maintained test fixture. Report baseline failures faithfully. If old imports block compilation, preserve that failed result; any separately adapted experiment is diagnostic only and must not be reported as a successful test of the original output.

There is currently no substantive example widget test suite (`example/test/widget_test.dart` is empty). This recipe describes meaningful future checks; it does not claim such tests already exist or request adding them during guidance-only changes.
