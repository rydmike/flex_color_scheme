[![Pub Version](https://img.shields.io/pub/v/flex_color_scheme?label=flex_color_scheme&labelColor=333940&logo=dart)](https://pub.dev/packages/flex_color_scheme) [![codecov](https://codecov.io/gh/rydmike/flex_color_scheme/branch/master/graph/badge.svg?token=4XJU30IGO3)](https://codecov.io/gh/rydmike/flex_color_scheme) [![License](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)

# FlexColorScheme

[<img src="https://github.com/rydmike/flex_color_scheme_docs/blob/master/docs/images/flutter-favorite-logo.png?raw=true?" alt="flutter favorite logo" width="170"/>](https://docs.flutter.dev/development/packages-and-plugins/favorites)

Use **FlexColorScheme** to make beautiful Flutter Material Design themes. Apply optional surface blends, and use Material-3 seeded generated ColorSchemes. The returned themes are standard `ThemeData` objects, but **very** sophisticated ones. They are based on the same idea as Flutter's `ThemeData.from(ColorScheme)` and `ThemeData(colorSchemeSeed)` themes, but with many additional features. Choose from many pre-made designs or make your own. You can also use easy-to-configure component themes.

>**NOTE:** This is a special release of **FlexColorScheme** version 8, it is identical to release 8.0.1, but it removes the `locale` API from the `InputDecorationTheme` to keep version 8 compatible with Flutter 3.22.x. If you use Flutter 3.24 or later, you should use the 8.0.0 or later releases instead.

<table>
  <tr>
    <td><img src="https://raw.githubusercontent.com/rydmike/flex_color_scheme_docs/master/docs/images/fcs-v5-l-37.png" alt="Dash light" width="220"/></td>
    <td><img src="https://raw.githubusercontent.com/rydmike/flex_color_scheme_docs/master/docs/images/fcs-v5-d-37.png" alt="Dash dark" width="220"/></td>
    <td><img src="https://raw.githubusercontent.com/rydmike/flex_color_scheme_docs/master/docs/images/fcs-v5-l-38.png" alt="M3 baseline light" width="220"/></td>
    <td><img src="https://raw.githubusercontent.com/rydmike/flex_color_scheme_docs/master/docs/images/fcs-v5-d-38.png" alt="M3 baseline dark" width="220"/></td>
  </tr>
</table>

When you theme a Flutter application **in the intended manner**, all built-in widgets use the colors of the `ColorScheme` in your theme. However, all Flutter's `ThemeData` factories misses a few details when it comes to direct color properties in `ThemeData`itself. This applies in particular if you still use legacy Material-2 mode in Flutter. When you use the current default Material-3 mode, the color results and styles are much more consistent by default, with only a few colors in `ThemeData` not matching the defined `ColorScheme` colors. 

**FlexColorScheme** ensures that all Flutter SDK UI components get themed completely by its `ColorScheme` and custom colors you provide. It also applies the `ColorScheme` colors to all legacy color properties in `ThemeData`. This ensures that all the direct colors properties in `ThemeData` match your `ColorScheme`. There are no surprising colors in `ThemeData` that do not match your `ColorScheme`. This applies regardless of if you use Material-2 or Material-3 mode.

You can also opt in on using FlexColorScheme's component theme customization features. By doing so, you can, for example, adjust the border radius on all UI widgets with a single property value. 

<table>
  <tr>
    <td><img src="https://raw.githubusercontent.com/rydmike/flex_color_scheme_docs/master/docs/images/fcs-v5-l-39.png" alt="Verdun green light" width="220"/></td>
    <td><img src="https://raw.githubusercontent.com/rydmike/flex_color_scheme_docs/master/docs/images/fcs-v5-d-39.png" alt="Verdun green dark" width="220"/></td>
    <td><img src="https://raw.githubusercontent.com/rydmike/flex_color_scheme_docs/master/docs/images/fcs-v5-l-40.png" alt="Dell genoa light" width="220"/></td>
    <td><img src="https://raw.githubusercontent.com/rydmike/flex_color_scheme_docs/master/docs/images/fcs-v5-d-40.png" alt="Dell genoa dark" width="220"/></td>
  </tr>
</table>

When you enable component themes in Material-2 mode, the border radius on components defaults to the Material-3 more rounded design. In Material-3, the radius varies by widget type, as specified by the [Material-3 Guide](https://m3.material.io/). You can keep this or set the shared global widget radius to a value you prefer. You can also set the themed border radius per widget and override the defaults or the global radius value you defined. 

### Material-3

As in Flutter's `ThemeData`, Material-3 mode is enabled by default in **FlexColorScheme** V8 and later. The Material-3 mode component theme defaults are far less opinionated than the Material-2 defaults. In **FlexColorScheme** V8 and later, enabling component themes use almost only Material-3 defaults as starting points for component styles and seeded `ColorScheme` generation. With the large number of component theme settings, you can quickly customize Material-3 to fit your application's design goals.

Since Flutter **3.7 and later**, using Material-3 design is production ready. Some minor issues may always exist. Please refer to the FlexColorScheme docs [known issues](https://docs.flexcolorscheme.com/known_issues) chapter for more information on the status of known **theming** issues in Flutter, and to which versions they apply.

<table>
  <tr>
    <td><img src="https://raw.githubusercontent.com/rydmike/flex_color_scheme_docs/master/docs/images/fcs-v7-l-50.png" alt="Yukon gold light" /> </td>
    <td><img src="https://raw.githubusercontent.com/rydmike/flex_color_scheme_docs/master/docs/images/fcs-v7-d-50.png" alt="Yukon gold dark" /> </td>
    <td><img src="https://raw.githubusercontent.com/rydmike/flex_color_scheme_docs/master/docs/images/fcs-v7-l-52.png" alt="Rust light" /> </td>
    <td><img src="https://raw.githubusercontent.com/rydmike/flex_color_scheme_docs/master/docs/images/fcs-v7-d-52.png" alt="Rust dark" /> </td>
  </tr>
</table>

**FlexColorScheme** has many advanced coloring features, like using surface alpha blends. It also fully supports Material-3 based ColorSchemes, including seed generated `ColorSchemes`. It offers many advanced configuration options that you can use when you generate your `ColorScheme` from seed colors. You can e.g., make more saturated seed generated themes and themes with higher contrast. FlexColorScheme's advanced seeded `ColorScheme` offer features that are not available in Flutter directly. This includes using multiple key colors as seeds, custom minimum chroma levels and customized tone mapping to ColorScheme colors.

<table>
  <tr>
    <td><img src="https://raw.githubusercontent.com/rydmike/flex_color_scheme_docs/master/docs/images/fcs-v7-l-44.png" alt="Indigo San Marino light" /> </td>
    <td><img src="https://raw.githubusercontent.com/rydmike/flex_color_scheme_docs/master/docs/images/fcs-v7-d-44.png" alt="Indigo San Marino dark" /> </td>
    <td><img src="https://raw.githubusercontent.com/rydmike/flex_color_scheme_docs/master/docs/images/fcs-v7-l-42.png" alt="Lipstick pink light" /> </td>
    <td><img src="https://raw.githubusercontent.com/rydmike/flex_color_scheme_docs/master/docs/images/fcs-v7-d-42.png" alt="Lipstick pink dark" /> </td>
  </tr>
</table>

With **FlexColorScheme** component themes, you use simple flat property values. No need for verbose Flutter SDK component themes, for example `ShapeBorder` definitions on multiple widget themes to change their border radius. Component theming provides a large number of easy-to-configure options via direct properties. In most cases you can avoid using complicated and sometimes confusing `WidgetState` theming properties.


## Getting Started

To use **FlexColorScheme** in your project, add the `flex_color_scheme` package to `pubspec.yaml`:

`dart pub add flex_color_scheme` or `flutter pub add flex_color_scheme`

Import the package to use it:

```dart
import 'package:flex_color_scheme/flex_color_scheme.dart';
```

You can now start using **FlexColorScheme** based color schemes and theming in your application. A quick way to do so is to try one of the **55** built-in color schemes. They have enum values that you use to select which one to use as the theme for your application.

The package **default example** offers a heavily commented code guide on how to use key features in FlexColorScheme. The [**Examples**](https://docs.flexcolorscheme.com/examples) chapter shows you how to try it. In the [**Tutorial**](https://docs.flexcolorscheme.com/tutorial1) you can learn more via five additional examples of increasing complexity.

## FlexColorScheme Counter App

Let's first setup FlexColorScheme in the default Flutter counter app. Create a new Flutter project, giving you the default counter-application. Add the FlexColorScheme import, after that we change one line of code, and add two lines to enable it in the default counter-application.

Here we use the **Oh Mandy red** color scheme, it is represented by `enum` value `FlexScheme.mandyRed`. Set the `MaterialApp.themeMode` to `ThemeMode.system` so that the device can control if the app uses its light or dark theme mode. You can then toggle the theme mode by changing mode on the used device.

Assign `FlexThemeData.light` to the app's `theme` property, which is the application's light theme definition property, and `FlexThemeData.dark` to `darkTheme`.

For both `FlexThemeData` dark and light we set the `scheme` property to `FlexScheme.mandyRed` to use the same **Oh Mandy red** predefined `scheme` colors in both theme modes. We then get matching light and dark themes based on the built-in scheme's color definitions.

The three line modified `MaterialApp`, of the Flutter default counter-application becomes:

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

This gives us a counter-application that looks like this:

<table>
  <tr>
    <td><img src="https://raw.githubusercontent.com/rydmike/flex_color_scheme_docs/master/docs/images/fcs-v5-counter-01.png" alt="Counter light" width="280"/></td>
    <td><img src="https://raw.githubusercontent.com/rydmike/flex_color_scheme_docs/master/docs/images/fcs-v5-counter-02.png" alt="Counter dark" width="280"/></td>
  </tr>
</table>

*FlexColorScheme in Material-2 mode applied to the standard Flutter counter template*


Not as exciting as the images shown above. That is because the basic counter-application uses very few features and widgets, so it does not present the results very well.

The included examples contain placeholder user interface to better demonstrate the results. The used UI demonstration code in the examples is not relevant to using FlexColorScheme, it is only there to present the results.

## Documentation

For more information and tutorials on how to use **FlexColorScheme**, please see its documentation site at [**docs.flexcolorscheme.com**](https://docs.flexcolorscheme.com/). It contains additional getting started info, extensive tutorials, key API walkthrough and even general Flutter theming advice and guidance. The documentation site is powered by [docs.page](https://docs.page/) from [Invertase](https://invertase.io/). 
Complete generated package [**API documentation**](https://pub.dev/documentation/flex_color_scheme/latest/flex_color_scheme/flex_color_scheme-library.html) is also available. 

## Themes Playground

To make it even easier to configure and setup **FlexColorScheme**, it comes with a WEB companion app called the [**Themes Playground**](https://rydmike.com/flexcolorscheme/themesplayground-latest).

The **Themes Playground** is a useful tool to find **FlexColorScheme** themes and settings you like. You can use it to discover what you can do with FlexColorScheme. The playground persists all its settings. You can reset settings back to their default values, so you can always start over if you get lost in all the configuration possibilities.

The most useful and popular feature of the **Playground** is that it can generate **FlexColorScheme API** setup code needed to produce the shown active theme configuration. The themed style of the app itself, and the same styled demo apps shown in its theme simulator, is what you get when you copy the theme config code to your app, and use it with the **FlexColorScheme** package. 

[<img src="https://raw.githubusercontent.com/rydmike/flex_color_scheme_docs/master/docs/images/themes_playground_7_2.png" alt="Themes Playround Image"/>](https://rydmike.com/flexcolorscheme/themesplayground-latest)

*In [Themes Playground](https://rydmike.com/flexcolorscheme/themesplayground-latest) you can visually configure your theme and copy its setup code.*

If you use the code view panel side-by-side, as you change settings, the Playground modifies the code as you change settings. This is a fun way to get familiar with the API.

[<img src="https://raw.githubusercontent.com/rydmike/flex_color_scheme_docs/master/docs/images/themes_playground_7_2_dark_code.png" alt="Themes Playround Image"/>](https://rydmike.com/flexcolorscheme/themesplayground-latest)

*Viewing API configuration and its updates as you change setting in [Themes Playground](https://rydmike.com/flexcolorscheme/themesplayground-latest).*

The latest **Themes Playground** build can be used as a [web app here](https://rydmike.com/flexcolorscheme/themesplayground-latest). For guidance on how to use the Themes Playground, please read the [Themes Playground chapter](https://docs.flexcolorscheme.com/playground) available in the documentation site.

Beware, fiddling with all the different themes and settings can be quite fun and addictive, happy theming! 💙


### Open Source

The **Themes Playground** application is open source and bundled with the `FlexColorScheme` package in the example folder. In its GitHub repository you can find it [here](https://github.com/rydmike/flex_color_scheme/tree/master/example/lib/example5_themes_playground).

The Playground app is also the last step in the package tutorial series. The [tutorial](https://docs.flexcolorscheme.com/tutorial1) goes through its main used features that are relevant to using `FlexColorScheme`, and features that differ from the previous examples. It does not go through all the details of the application. You are welcome to study its source code for more insights and inspiration. It is on purposes a bit excessively commented. The tutorial also briefly talks about its background, design choices and limitations.

### Available Themes Playground Versions

There are **Theme Playground** version builds corresponding to the last major releases of the **FlexColorScheme** package available. For Version 7 there are also Playground builds for the different minor releases.

You should use the same major version of **Themes Playground** as the `flex_color_scheme` package you are using. With version 7 and 8, you should prefer to match the minor version too.

| Name  | Version | Link                                                         |
|-------|---------|--------------------------------------------------------------| 
| V8.0  | V8.0.0  | https://rydmike.com/flexcolorscheme/themesplayground-latest  | 
| V7.3  | V7.3.1  | https://rydmike.com/flexcolorscheme/themesplayground-v7-3    |
| V7.2  | V7.2.0  | https://rydmike.com/flexcolorscheme/themesplayground-v7-2    |
| V7.1  | V7.1.2  | https://rydmike.com/flexcolorscheme/themesplayground-v7-1    |
| V7.0  | V7.0.5  | https://rydmike.com/flexcolorscheme/themesplayground-v7      |
| V6    | V6.1.1  | https://rydmike.com/flexcolorscheme/themesplayground-v6      |
| V5    | V5.1.0  | https://rydmike.com/flexcolorscheme/themesplayground-v5      |
| V4    | V4.2.0  | https://rydmike.com/flexcolorschemeV4Tut5                    |


> **NOTE!**  
> If you use a higher version of a WEB build and try to load a lower version again with the same browser, it will most likely fail and not load. This happens because older and newer builds run on the same domain and share the same browser local storage file. This allows newer versions to load data configured in older versions. However, older versions may not understand some data stored and inserted by the newer versions and they will fail. You can get the web build for an older version to start again by clearing stored browser data:  
>"Settings" → "Delete browsing data..." → "Cookies and other site data".  
> You do of course lose any config you had used then. This issue could be fixed, but would require updating rebuilding the old builds and there are currently no plans to do so.  
> Version 8.0.0 and later uses a new local storage name to avoid this issue, so it will not conflict with V7 and older versions. There are few storage settings in V8 that are backwards compatible anyway.
> 

You can also build Windows, macOS or Linux desktop versions of the **Themes Playground**, it is highly recommended, as it runs much smoother and nicer than the WEB build. The **Themes Playground** app is bundled with the package GitHub repository as **Example 5**. If you need a Themes Playground companion build for a specific older FlexColorScheme version, you can download a ZIP bundle from the GitHub repo for any past [release here](https://github.com/rydmike/flex_color_scheme/releases).
