---
name: flex-color-scheme
description: Use FlexColorScheme 9.x in a Flutter 3.47+ app to build light/dark themes with built-in or custom colors, seed palettes, component themes, and adaptive styling. This is consumer guidance, not the package-maintenance workflow.
---

# Use FlexColorScheme

This skill targets the 9.x API and Flutter 3.47+ SDK-decoupled Material/Cupertino libraries. Check the app's pubspec, resolved package version, and available SDK before using these examples. Do not assume a version in a development checkout is already published or silently upgrade an older application.

Copy this entire skill folder, including `references/`, into a consuming app's `.agents/skills/` or `.cursor/skills/`. It has no dependency on the source repository's agent instructions.

Galleries and longer prose: [docs.flexcolorscheme.com](https://docs.flexcolorscheme.com), [pub.dev/packages/flex_color_scheme](https://pub.dev/packages/flex_color_scheme), [API](https://pub.dev/documentation/flex_color_scheme/latest/). The latest online documentation may differ from the version resolved by the app.

## Start with a matched light/dark pair

The app needs a compatible `flex_color_scheme` dependency and direct dependencies for the UI packages it imports. Use the public barrel, never `package:flex_color_scheme/src/...`.

```dart
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:material_ui/material_ui.dart';

MaterialApp(
  theme: FlexThemeData.light(scheme: FlexScheme.indigo),
  darkTheme: FlexThemeData.dark(scheme: FlexScheme.indigo),
  themeMode: ThemeMode.system,
  home: const Scaffold(body: Center(child: Text('Hello'))),
)
```

`FlexThemeData.light` / `.dark` return `ThemeData`. If you need the intermediate configuration, use `FlexColorScheme.light(...)` / `.dark(...)`, then the `.toTheme` or `.toScheme` getter (no parentheses).

The barrel also exports `FlexThemeModeSwitch`, a three-way light/dark/system toggle that can show scheme colors on its buttons.

## FlexSeedScheme is already included

FlexColorScheme ≥ 6 depends on FlexSeedScheme and **re-exports** its API. Add a direct `flex_seed_scheme` dependency only when calling those APIs without FCS, or when you need a floor version. Do not construct `FlexSeedScheme`; use `SeedColorScheme.fromSeeds` or FCS factory `keyColors` / `tones` / `variant`.

## Choose the level of configuration

- **Built-in palette:** `scheme: FlexScheme.indigo` (same enum in light and dark).
- **Custom palette:** `colors: FlexSchemeColor(...)` or a `FlexSchemeData` pair. If both `scheme` and `colors` are set, `colors` wins.
- **Existing ColorScheme:** `colorScheme:`. Direct color arguments can still override matching roles. Read [colors and seeding](references/colors-and-seeding.md).
- **Material seed generation:** opt in with `keyColors: const FlexKeyColors()`. Material 3 widget styling (`useMaterial3: true`, the factory default) does **not** by itself enable FCS seeding.
- **Surface blends:** `surfaceMode` and `blendLevel` (light and dark may differ).
- **Component styling:** `subThemesData: const FlexSubThemesData(...)`. Passing this object enables the optional component path; it can affect more than the one field you set. Read [components and adaptation](references/components-and-adaptation.md).
- **Platform adaptive values:** `FlexAdaptive` on `FlexSubThemesData` (for example `adaptiveRadius: FlexAdaptive.desktop()`).
- **Advanced tonal mapping:** `tones: FlexTones...` or `variant: FlexSchemeVariant...` (mutually exclusive; both omitted → `FlexTones.material` via FSS). `contrastLevel` applies only when `variant.isFlutterScheme` is true.

## Seeds are not role colors

A seed key sets **hue and chroma** of a tonal palette. It does not become `ColorScheme.primary` unless you also keep that input (`keepPrimary: true`, and the matching keep flags for other roles). In dark themes, pinning a light brand color to `primary` is usually too dark; prefer container keep flags or overrides.

`tones` and `variant` are mutually exclusive. Do not pass both. FlexTones modifiers (`onMainsUseBW`, `monochromeSurfaces`, …) only apply on the `tones` path.

## Playground-generated code

Inspect copied Playground setup before integrating it: package version, UI imports, and referenced symbols, then compile it in the consuming app. Current Playground output still emits `package:flutter/material.dart` and `package:flutter/cupertino.dart`; this checkout uses `material_ui` / `cupertino_ui`. Adapt imports to the app.

A standalone ColorScheme export contains colors; it does not carry component styling or the complete `ThemeData` configuration.

Playground `ThemeController`, `Store`, and `AdaptiveResponse` are app-only. Consumer adaptive APIs are `FlexAdaptive`.

## Anti-patterns

- Importing `package:flex_color_scheme/src/...`
- Treating `keyPrimary` / built-in scheme seed as `ColorScheme.primary` without a keep flag or override
- Passing both `tones` and `variant`
- Expecting `contrastLevel` or FlexTones modifiers to apply on the other path
- Passing `const FlexSubThemesData()` when you meant to omit component theming (those are different)
- Copying Playground `ThemeController` or `AdaptiveResponse` into an app
- Using a ColorScheme-only export as a full theme
- Mixing `package:flutter/material.dart` widget types with `material_ui` in the same theme
- Adding a second `flex_seed_scheme` constraint in an app that already depends on FlexColorScheme ≥ 6, unless you call FSS APIs directly and need a floor
- Using removed 9.0 leftovers: `background` / `onBackground` / `surfaceVariant` on FCS types; `useTextTheme` / `useFlutterDefaults` / `blendTextTheme`; `FlexColorScheme.createPrimarySwatch` (moved to FlexColorPicker `ColorTools`)
