[![Pub Version](https://img.shields.io/pub/v/flex_color_scheme?label=flex_color_scheme&labelColor=333940&logo=dart)](https://pub.dev/packages/flex_color_scheme) [![codecov](https://codecov.io/gh/rydmike/flex_color_scheme/branch/master/graph/badge.svg?token=4XJU30IGO3)](https://codecov.io/gh/rydmike/flex_color_scheme) [![License](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)

# FlexColorScheme

> This is FlexColorScheme **beta** release 7.0.0-dev.3. It is intended for Flutter stable 3.7.0 or later. Themes Playground **beta** 7.0.0-dev.3 is available as a [web app here](https://rydmike.com/flexcolorscheme/themesplayground-v7). This is the last beta release before the stable v7 release. It is currently undergoing quality assurance testing. If you notice any issues with it or with the related Playground version, please report them in the [repo here](https://github.com/rydmike/flex_color_scheme/issues). For information about what has changed in this release see the [changelog](https://pub.dev/packages/flex_color_scheme/versions/7.0.0-dev.3/changelog). The FlexColorScheme documentation site has not yet been updated to cover this beta release. It does however contain a summary of [new features](https://docs.flexcolorscheme.com/whats_new) and list of [know Flutter issues](https://docs.flexcolorscheme.com/known_issues), that impact Flutter theming and via that FlexColorScheme.  

[<img src="https://github.com/rydmike/flex_color_scheme_docs/blob/master/docs/images/flutter-favorite-logo.png?raw=true?" alt="flutter favorite logo" width="170"/>](https://docs.flutter.dev/development/packages-and-plugins/favorites)

Use **FlexColorScheme** to make beautiful color scheme based Flutter Material design themes. Apply optional surface blends, and use Material 3 style seeded color schemes. The returned themes are standard `ThemeData` objects, but **very** sophisticated ones. They are based on the same idea as Flutter's `ThemeData.from(ColorScheme)` and `ThemeData(colorSchemeSeed)` themes, but with many additional features. Choose from numerous pre-made designs or make your own. You can also use optional component sub theming, that are quick and easy to configure.

<table>
  <tr>
    <td><img src="https://github.com/rydmike/flex_color_scheme_docs/blob/master/docs/images/fcs-v5-l-37.png?raw=true" alt="Dash light" width="220"/></td>
    <td><img src="https://github.com/rydmike/flex_color_scheme_docs/blob/master/docs/images/fcs-v5-d-37.png?raw=true" alt="Dash dark" width="220"/></td>
    <td><img src="https://github.com/rydmike/flex_color_scheme_docs/blob/master/docs/images/fcs-v5-l-38.png?raw=true" alt="M3 baseline light" width="220"/></td>
    <td><img src="https://github.com/rydmike/flex_color_scheme_docs/blob/master/docs/images/fcs-v5-d-38.png?raw=true" alt="M3 baseline dark" width="220"/></td>
  </tr>
</table>

When you theme a Flutter application correctly, all built-in widgets use the colors of the `ColorScheme` in your theme. At least in theory, and it is almost so if you defined your `ThemeData` by using the `ThemeData.from` factory, but it misses a few details. This apply in particular when you use Material 2 design in Flutter, which is the default. When you opt-in on using Material 3, the results are much more consistent. 

**FlexColorScheme** ensures that all Flutter SDK UI components get themed completely by its color schemes and custom colors you provide. It applies effective `ColorScheme` colors to all color properties in `ThemeData`. This ensures that all the direct colors properties in `ThemeData` match your `ColorScheme`. There are no surprising colors in `ThemeData` legacy colors that do not match your `ColorScheme`. This applies regardless of if you use Material 2 or Material 3 mode.

You can opt in on using opinionated component sub-themes. By doing so, you can, for example, adjust the border radius on all UI widgets with a single property value. Flutter's Material UI widgets still default to the Material 2 design, and thus use 4 dp corner radius on most widgets.

When you opt in on using the component sub-themes in Material 2 mode, border radius on widgets defaults to the new Material 3 rounded corner design. In it, the radius varies by widget type, as specified by the [Material 3 guide](https://m3.material.io/). You can keep this or set the shared global widget radius to a value you prefer. You can also easily set the themed border radius per widget, and override the Material 3 like defaults or the global radius value you defined. 

You can also opt in on using Material 3. The Material 3 mode component sub-theming is far less opinionated, using mostly Material 3 defaults, offering easy quick settings to customize Material 3 to suit your design goals.

<table>
  <tr>
    <td><img src="https://github.com/rydmike/flex_color_scheme_docs/blob/master/docs/images/fcs-v5-l-39.png?raw=true" alt="Verdun green light" width="220"/></td>
    <td><img src="https://github.com/rydmike/flex_color_scheme_docs/blob/master/docs/images/fcs-v5-d-39.png?raw=true" alt="Verdun green dark" width="220"/></td>
    <td><img src="https://github.com/rydmike/flex_color_scheme_docs/blob/master/docs/images/fcs-v5-l-40.png?raw=true" alt="Dell genoa light" width="220"/></td>
    <td><img src="https://github.com/rydmike/flex_color_scheme_docs/blob/master/docs/images/fcs-v5-d-40.png?raw=true" alt="Dell genoa dark" width="220"/></td>
  </tr>
</table>

With **FlexColorScheme** component themes, you use simple flat property values. No need for verbose Flutter SDK component sub-themes, with `ShapeBorder` definitions on multiple widget themes to change their border radius. The component theming provides a large number of easy to configure options via simple flat properties. In many cases you can avoid the both complicated and confusing `MaterialState` theming properties.

**FlexColorScheme** has many advanced coloring features, like using surface alpha blends. It also fully supports Material 3 based color schemes, including seed generated `ColorSchemes`. It offers different configuration options that you can use when you generate your `ColorScheme` from key colors. You can use this to make more saturated seed generated themes and themes with higher contrast. These seeded color scheme features are currently not available in Flutter. This includes using multiple key colors as seeds, custom minimum chroma levels and customized tone mapping to ColorScheme colors. 

In Material 3 you can also easily disable surface elevation tint in Material 3 mode and even bring back elevation shadows where they have been removed in M3. You can also choose to do this only on iOS and macOS platforms, where surface tint elevation may seem foreign, while still keeping the M3 tinted styles when the app is used on Android and other platforms.

## Getting Started

To use **FlexColorScheme** in your project, add the `flex_color_scheme` package to `pubspec.yaml`:

`dart pub add flex_color_scheme` or `flutter pub add flex_color_scheme`

Import the package to use it:

```dart
import 'package:flex_color_scheme/flex_color_scheme.dart';
```

You can now start using **FlexColorScheme** based color schemes and theming in your application. A quick way to do so, is to try one of the **52** built-in color schemes. They have enum values that you can use to select which one to use as the theme of your application.

The package **default example** offers a heavily commented code guide on how to use almost every property in FlexColorScheme. The [**Examples**](https://docs.flexcolorscheme.com/examples) chapter shows you how to try it. In the [**Tutorial**](https://docs.flexcolorscheme.com/tutorial1) you can learn more via five additional examples of increasing complexity.

## FlexColorScheme Counter App

Let's first setup FlexColorScheme in the default Flutter counter app. Create a new Flutter project, giving you the default counter app. Add the FlexColorScheme import, after that we change one line of code, and add two lines to enable it in the default counter app.

Here we use the **Oh Mandy red** color scheme, it is represented by `enum` value `FlexScheme.mandyRed`. Set the `MaterialApp.themeMode` to `ThemeMode.system` so that the device can control if the app uses its light or dark theme mode. You can then toggle the theme mode by changing mode on the used device.

Assign `FlexThemeData.light` to the app's `theme` property, which is the application's light theme definition property, and `FlexThemeData.dark` to `darkTheme`.

For both `FlexThemeData` dark and light we set the `scheme` property to `FlexScheme.mandyRed` to use the same **Oh Mandy red** predefined `scheme` colors in both theme modes. We then get matching light and dark themes based on the built-in scheme's color definitions.

The three line modified `MaterialApp`, of the Flutter default counter app becomes:

```dart
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
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

This gives us a counter application that looks like this:

<table>
  <tr>
    <td><img src="https://github.com/rydmike/flex_color_scheme_docs/blob/master/docs/images/fcs-v5-counter-01.png?raw=true" alt="Counter light" width="280"/></td>
    <td><img src="https://github.com/rydmike/flex_color_scheme_docs/blob/master/docs/images/fcs-v5-counter-02.png?raw=true" alt="Counter dark" width="280"/></td>
  </tr>
</table>

*FlexColorScheme applied to the standard Flutter counter template*


Not as exciting as the images shown above. That is because the basic counter app uses very few features and widgets, so it does not present the results very well.

The included examples contain placeholder user interface to better demonstrate the results. The used UI demonstration code in the examples is not relevant to using FlexColorScheme, it is only there to present the results.

## Documentation

For more information and tutorials on how to use **FlexColorScheme**, please see its documentation site at [**docs.flexcolorscheme.com**](https://docs.flexcolorscheme.com/). It contains additional getting started info, extensive tutorials, key API walkthrough and even general Flutter theming advice and guidance.

Please refer to it for more information and guidance on its usage and features. The documentation site is powered by [docs.page](https://docs.page/) from [Invertase](https://invertase.io/).

Complete generated package [**API documentation**](https://pub.dev/documentation/flex_color_scheme/latest/flex_color_scheme/flex_color_scheme-library.html) is also available. The API docs are very thorough as well.

## Themes Playground

To make it even easier to configure and setup **FlexColorScheme**, it comes with a WEB companion app called the **Themes Playground**.

The [**Themes Playground**](https://rydmike.com/flexcolorscheme/themesplayground-v7) is a useful tool to find **FlexColorScheme** themes and settings you like. You can use it to discover what you can do with FlexColorScheme. The playground persists all its settings. You can reset settings back to their default values, so you can always start over if you get lost in all the configuration possibilities.

The most useful and popular feature of the **Themes Playground** is that it can generate FlexColorScheme API setup code needed to produce the shown active theme configuration. It even shows and modifies the code as you change settings. You can see the code side-by-side as you change settings. This is a fun way to get familiar with the API. Beware, fiddling with all the different themes and settings can be quite fun and addictive, happy theming! 💙

The **Themes Playground** can be used as a [web app here](https://rydmike.com/flexcolorscheme/themesplayground-v7).

For guidance on how to use the Themes Playground, please read the [Themes Playground chapter](https://docs.flexcolorscheme.com/playground) in the docs.

[<img src="https://github.com/rydmike/flex_color_scheme_docs/blob/master/docs/images/fcs-v5-pg-01-pageview-3.gif?raw=true" alt="Page view demo"/>](https://rydmike.com/flexcolorscheme/themesplayground-v7)

### Open Source

The **Themes Playground** application is open source and bundled with the `FlexColorScheme` package in the example sub-folder. In its GitHub repository you can find it [here](https://github.com/rydmike/flex_color_scheme/tree/master/example/lib/example5_themes_playground).

The Playground app is also the last step in the package tutorial series. The [tutorial](https://docs.flexcolorscheme.com/tutorial1) goes through its main used features that are relevant to using `FlexColorScheme`, and features that differ from the previous examples. It does not go through all the details of the application. You are welcome to study its source code for more insights. It is on purposes a bit excessively commented. The tutorial also briefly talks about its background, design choices and limitations.

### Older versions of the Themes Playground

If you are using **FlexColorScheme version 6**, you can go here to use [**Themes Playground V6**](https://rydmike.com/flexcolorscheme/themesplayground-v6), to generate API setup code for version 6. It supports FlexColorScheme version 6.1, you can also use this version of the Playground with FlexColorScheme version 6.0. If you do, you may have to delete some generated API config setup code for properties only available in version 6.1 that are not supported by FlexColorScheme 6.0. You will see those as unsupported API errors when you copy/paste the Themes Playground code to Flutter if you use 6.0 and not 6.1. Delete such rows, or you can of course upgrade the package to 6.1 to get those features. 

If you are using **FlexColorScheme version 5**, you can go here to use [**Themes Playground V5**](https://rydmike.com/flexcolorscheme/themesplayground-v5), to generate API setup code for it.

If you are using **FlexColorScheme version 4**, you should really upgrade, but you can still use [**Themes Playground V4** here](https://rydmike.com/flexcolorschemeV4Tut5). It does not offer any API code generation, since version 4 did not have that feature.

You can also build a local Windows, macOS or Linux desktop version of the **Themes Playground**, it is highly recommended, as it runs much smoother and nicer than the WEB build. As mentioned above, the **Themes Playground** app is bundled with the package GitHub repository as **Example 5**. If you need a Themes Playground companion build for a specific older FlexColorScheme version, you can download a ZIP bundle from the GitHub repo for any past [release here](https://github.com/rydmike/flex_color_scheme/releases).