[![Pub Version](https://img.shields.io/pub/v/flex_color_scheme?label=flex_color_scheme&labelColor=333940&logo=dart)](https://pub.dev/packages/flex_color_scheme) [![codecov](https://codecov.io/gh/rydmike/flex_color_scheme/branch/master/graph/badge.svg?token=4XJU30IGO3)](https://codecov.io/gh/rydmike/flex_color_scheme) [![License](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)

# FlexColorScheme

[<img src="https://github.com/rydmike/flex_color_scheme_docs/blob/master/docs/images/flutter-favorite-logo.png?raw=true" alt="flutter favorite logo" width="170"/>](https://docs.flutter.dev/development/packages-and-plugins/favorites)

**FlexColorScheme** 9.x builds matched light and dark `ThemeData` for Flutter 3.47+, with full support for the SDK-decoupled [`material_ui`](https://pub.dev/packages/material_ui) and [`cupertino_ui`](https://pub.dev/packages/cupertino_ui) packages.

Version 9.0 is a major release because Flutter's UI libraries left the SDK. Theming features are otherwise an easy step from 8.4. Breaking API and seed-tone details are in the [changelog](https://pub.dev/packages/flex_color_scheme/changelog) and at [docs.flexcolorscheme.com](https://docs.flexcolorscheme.com/).

Use it to make Material Design themes with optional surface blends, seed-generated `ColorScheme`s, and quick component settings. The result is standard `ThemeData`, with more complete `ColorScheme` wiring than Flutter's `ThemeData.from` / `colorSchemeSeed` factories.

Configure visually in the **[Themes Playground](https://playground.flexcolorscheme.com/)** and copy the API setup into your app.

<table>
  <tr>
    <td><img src="https://raw.githubusercontent.com/rydmike/flex_color_scheme_docs/master/docs/images/fcs-v5-l-37.png" alt="Dash light" width="220"/></td>
    <td><img src="https://raw.githubusercontent.com/rydmike/flex_color_scheme_docs/master/docs/images/fcs-v5-d-37.png" alt="Dash dark" width="220"/></td>
    <td><img src="https://raw.githubusercontent.com/rydmike/flex_color_scheme_docs/master/docs/images/fcs-v5-l-38.png" alt="M3 baseline light" width="220"/></td>
    <td><img src="https://raw.githubusercontent.com/rydmike/flex_color_scheme_docs/master/docs/images/fcs-v5-d-38.png" alt="M3 baseline dark" width="220"/></td>
  </tr>
</table>

**FlexColorScheme** themes all Flutter SDK UI components from your `ColorScheme` and custom colors, including legacy `ThemeData` color properties, in Material 2 or Material 3 mode. Opt in on component themes to adjust shared styles, for example border radius on many widgets with one property.

<table>
  <tr>
    <td><img src="https://raw.githubusercontent.com/rydmike/flex_color_scheme_docs/master/docs/images/fcs-v5-l-39.png" alt="Verdun green light" width="220"/></td>
    <td><img src="https://raw.githubusercontent.com/rydmike/flex_color_scheme_docs/master/docs/images/fcs-v5-d-39.png" alt="Verdun green dark" width="220"/></td>
    <td><img src="https://raw.githubusercontent.com/rydmike/flex_color_scheme_docs/master/docs/images/fcs-v5-l-40.png" alt="Dell genoa light" width="220"/></td>
    <td><img src="https://raw.githubusercontent.com/rydmike/flex_color_scheme_docs/master/docs/images/fcs-v5-d-40.png" alt="Dell genoa dark" width="220"/></td>
  </tr>
</table>

### Material 3

Material 3 is the default since **FlexColorScheme** v8, matching Flutter's `ThemeData`. Component theme defaults follow Material 3, including per-widget radii from the [Material 3 Guide](https://m3.material.io/). Keep those defaults, set a shared global radius, or override radius per widget.

<table>
  <tr>
    <td><img src="https://raw.githubusercontent.com/rydmike/flex_color_scheme_docs/master/docs/images/fcs-v7-l-50.png" alt="Yukon gold light" /> </td>
    <td><img src="https://raw.githubusercontent.com/rydmike/flex_color_scheme_docs/master/docs/images/fcs-v7-d-50.png" alt="Yukon gold dark" /> </td>
    <td><img src="https://raw.githubusercontent.com/rydmike/flex_color_scheme_docs/master/docs/images/fcs-v7-l-52.png" alt="Rust light" /> </td>
    <td><img src="https://raw.githubusercontent.com/rydmike/flex_color_scheme_docs/master/docs/images/fcs-v7-d-52.png" alt="Rust dark" /> </td>
  </tr>
</table>

Surface alpha blends and seed-generated `ColorScheme`s go beyond Flutter's seed factory: multiple seed colors, custom minimum chroma, and custom tone mapping.

<table>
  <tr>
    <td><img src="https://raw.githubusercontent.com/rydmike/flex_color_scheme_docs/master/docs/images/fcs-v7-l-44.png" alt="Indigo San Marino light" /> </td>
    <td><img src="https://raw.githubusercontent.com/rydmike/flex_color_scheme_docs/master/docs/images/fcs-v7-d-44.png" alt="Indigo San Marino dark" /> </td>
    <td><img src="https://raw.githubusercontent.com/rydmike/flex_color_scheme_docs/master/docs/images/fcs-v7-l-42.png" alt="Lipstick pink light" /> </td>
    <td><img src="https://raw.githubusercontent.com/rydmike/flex_color_scheme_docs/master/docs/images/fcs-v7-d-42.png" alt="Lipstick pink dark" /> </td>
  </tr>
</table>

Component themes use simple flat properties. You can skip verbose SDK `ShapeBorder` and `WidgetState` theme objects for common cases.

## Getting Started

Requires Flutter **3.47** or later. FlexColorScheme depends on `material_ui` and `cupertino_ui`; your app still needs a direct `material_ui` import for `MaterialApp` and widgets.

```sh
flutter pub add flex_color_scheme
```

```dart
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:material_ui/material_ui.dart';
```

Start with a built-in `FlexScheme` palette, or define your own colors. The package **default example** is a heavily commented guide. See [Examples](https://docs.flexcolorscheme.com/examples) and the [Tutorial](https://docs.flexcolorscheme.com/tutorial1).

## FlexColorScheme Counter App

Create a new Flutter project and theme the default counter app with **Oh Mandy red** (`FlexScheme.mandyRed`). `ThemeMode.system` follows the device light/dark setting.

```dart
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:material_ui/material_ui.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // The Mandy red, light theme.
      theme: FlexThemeData.light(scheme: FlexScheme.mandyRed),
      // The Mandy red, dark theme.
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.mandyRed),
      // Use dark or light theme based on system setting.
      themeMode: ThemeMode.system,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
```

This gives a counter application that looks like this:

<table>
  <tr>
    <td><img src="https://raw.githubusercontent.com/rydmike/flex_color_scheme_docs/master/docs/images/fcs-v5-counter-01.png" alt="Counter light" width="280"/></td>
    <td><img src="https://raw.githubusercontent.com/rydmike/flex_color_scheme_docs/master/docs/images/fcs-v5-counter-02.png" alt="Counter dark" width="280"/></td>
  </tr>
</table>

*FlexColorScheme applied to the standard Flutter counter template*

The counter app uses few widgets, so it does not show the theme well. The package examples use placeholder UI only to present results; that demo UI is not part of using FlexColorScheme.

## Documentation

Tutorials, API walkthroughs, and Flutter theming guidance: [**docs.flexcolorscheme.com**](https://docs.flexcolorscheme.com/). Generated [**API documentation**](https://pub.dev/documentation/flex_color_scheme/latest/flex_color_scheme/flex_color_scheme-library.html) is on pub.dev. The documentation site is powered by [docs.page](https://docs.page/) from [Invertase](https://invertase.io/).

## Themes Playground

The [**Themes Playground**](https://playground.flexcolorscheme.com/) is a web companion that generates **FlexColorScheme** setup code for the active theme. The app itself, and the demos in its theme simulator, show the result of that code. Settings persist; reset them if you get lost. It is bundled as [example 5](https://github.com/rydmike/flex_color_scheme/tree/master/example/lib/example5_themes_playground), the last [tutorial](https://docs.flexcolorscheme.com/tutorial1) step.

[<img src="https://raw.githubusercontent.com/rydmike/flex_color_scheme_docs/master/docs/images/themes_playground_7_2.png" alt="Themes Playground Image"/>](https://playground.flexcolorscheme.com/)

*In [Themes Playground](https://playground.flexcolorscheme.com/) you can visually configure your theme and copy its setup code.*

Open the code view beside the controls to watch the API update as you change settings.

[<img src="https://raw.githubusercontent.com/rydmike/flex_color_scheme_docs/master/docs/images/themes_playground_7_2_dark_code.png" alt="Themes Playground Image"/>](https://playground.flexcolorscheme.com/)

*Viewing API configuration and its updates as you change settings in [Themes Playground](https://playground.flexcolorscheme.com/).*

Latest live build (WASM GC, with JS fallback): [playground.flexcolorscheme.com](https://playground.flexcolorscheme.com/). Usage notes: [Playground chapter](https://docs.flexcolorscheme.com/playground). Use the same major version of Themes Playground as your `flex_color_scheme` package, and for versions 7, 8, and 9 prefer matching the minor version too. GitHub Pages JS builds are in the table below.

Happy theming! 💙

### Available Themes Playground Versions

| Name         | Version        | Link                                                      |
| ------------ | -------------- | --------------------------------------------------------- |
| V9.0 WASM+JS | V9.0.0         | https://playground.flexcolorscheme.com/                   |
| V9.0 JS      | V9.0.0         | https://rydmike.com/flexcolorscheme/themesplayground-v9-0 |
| V8.4         | V8.4.0         | https://rydmike.com/flexcolorscheme/themesplayground-v8-4 |
| V8.2 & V8.3  | V8.2.0, V8.3.x | https://rydmike.com/flexcolorscheme/themesplayground-v8-3 |
| V8.1         | V8.1.1         | https://rydmike.com/flexcolorscheme/themesplayground-v8-1 |
| V8.0         | V8.0.2         | https://rydmike.com/flexcolorscheme/themesplayground-v8-0 |
| V7.3         | V7.3.1         | https://rydmike.com/flexcolorscheme/themesplayground-v7-3 |
| V7.2         | V7.2.0         | https://rydmike.com/flexcolorscheme/themesplayground-v7-2 |
| V7.1         | V7.1.2         | https://rydmike.com/flexcolorscheme/themesplayground-v7-1 |
| V7.0         | V7.0.5         | https://rydmike.com/flexcolorscheme/themesplayground-v7   |
| V6           | V6.1.1         | https://rydmike.com/flexcolorscheme/themesplayground-v6   |
| V5           | V5.1.0         | https://rydmike.com/flexcolorscheme/themesplayground-v5   |
| V4           | V4.2.0         | https://rydmike.com/flexcolorschemeV4Tut5                 |

> **NOTE!** Older and newer web builds on this domain share browser storage. Loading a newer Playground, then an older one, can fail until you clear site data (Settings → Delete browsing data → Cookies and other site data). You lose saved config. Version 8.0.0 and later uses a different storage name, so it does not conflict with V7 and older.

### Themes Playground as a Desktop App

A Windows, macOS, or Linux build of **Example 5** is smoother than the web app. For an older package version, download a ZIP from the GitHub [releases](https://github.com/rydmike/flex_color_scheme/releases).
