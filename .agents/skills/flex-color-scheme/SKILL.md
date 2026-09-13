---
name: flex-color-scheme
description: Use FlexColorScheme 9.x in a Flutter 3.47+ app to build light/dark themes with built-in or custom colors, seed palettes, component themes, and adaptive styling. This is consumer guidance, not the package-maintenance workflow.
---

# Use FlexColorScheme

This skill targets the 9.x API and Flutter 3.47+ SDK-decoupled Material/Cupertino libraries. Check the app's pubspec, resolved package version, and available SDK before using these examples. Do not assume a version in a development checkout is already published or silently upgrade an older application.

Copy this entire skill folder, including `references/`, into a consuming app's skill directory. It has no dependency on the source repository's agent instructions.

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

## Choose the level of configuration

- **Built-in palette:** use `scheme: FlexScheme...` consistently in both themes.
- **Custom palette or existing ColorScheme:** read [colors and seeding](references/colors-and-seeding.md). Explicit color arguments, custom palette data, and seeding interact; avoid supplying overlapping inputs without a reason.
- **Material seed generation:** opt in with `keyColors: const FlexKeyColors()`. Material 3 widget styling alone does not enable FlexColorScheme seeding.
- **Component styling:** pass `subThemesData: const FlexSubThemesData(...)`. This enables the optional component configuration path; it can affect more than the single field you set. Read [components and adaptation](references/components-and-adaptation.md) for defaults and overrides.

Read the installed API documentation when combining advanced settings. Reference documentation: [FlexColorScheme guide](https://docs.flexcolorscheme.com), [package and versions](https://pub.dev/packages/flex_color_scheme), and [API](https://pub.dev/documentation/flex_color_scheme/latest/). The latest online documentation may differ from the version resolved by the app.

Inspect copied Playground code before integrating it: verify its package version, UI imports, and referenced symbols, then compile it in the consuming app. A standalone ColorScheme export contains colors; it does not carry component styling or the complete ThemeData configuration.
