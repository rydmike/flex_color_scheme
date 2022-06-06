# Roads to ThemeData

This file contains all the examples used to create ThemeData in the
documentation chapter [Roads to ThemeData](https://docs.flexcolorscheme.com/theming_roads).

In the chapter these examples are used with the Copy-Paste Playground to
study the different results.

To use the examples as in the road to ThemeData, you will also need to
copy in these constants into `main.dart` file.

```dart
final MaterialColor flexSwatch =
    FlexColorScheme.createPrimarySwatch(const Color(0xff6750a4));

const ColorScheme flexSchemeLight = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xff6750a4),
  onPrimary: Color(0xffffffff),
  primaryContainer: Color(0xffeaddff),
  onPrimaryContainer: Color(0xff000000),
  secondary: Color(0xff625b71),
  onSecondary: Color(0xffffffff),
  secondaryContainer: Color(0xffe8def8),
  onSecondaryContainer: Color(0xff000000),
  tertiary: Color(0xff7d5260),
  onTertiary: Color(0xffffffff),
  tertiaryContainer: Color(0xffffd8e4),
  onTertiaryContainer: Color(0xff000000),
  error: Color(0xffb00020),
  onError: Color(0xffffffff),
  errorContainer: Color(0xfffcd8df),
  onErrorContainer: Color(0xff000000),
  outline: Color(0xff4d4d4d),
  background: Color(0xffffffff),
  onBackground: Color(0xff000000),
  surface: Color(0xffffffff),
  onSurface: Color(0xff000000),
  surfaceVariant: Color(0xffffffff),
  onSurfaceVariant: Color(0xff000000),
  inverseSurface: Color(0xff121212),
  onInverseSurface: Color(0xffffffff),
  inversePrimary: Color(0xfff0e9ff),
  shadow: Color(0xff000000),
);

const ColorScheme flexSchemeDark = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xffd0bcff),
  onPrimary: Color(0xff000000),
  primaryContainer: Color(0xff4f378b),
  onPrimaryContainer: Color(0xffffffff),
  secondary: Color(0xffccc2dc),
  onSecondary: Color(0xff000000),
  secondaryContainer: Color(0xff4a4458),
  onSecondaryContainer: Color(0xffffffff),
  tertiary: Color(0xffefb8c8),
  onTertiary: Color(0xff000000),
  tertiaryContainer: Color(0xff633b48),
  onTertiaryContainer: Color(0xffffffff),
  error: Color(0xffcf6679),
  onError: Color(0xff000000),
  errorContainer: Color(0xffb1384e),
  onErrorContainer: Color(0xffffffff),
  outline: Color(0xffb3b3b3),
  background: Color(0xff121212),
  onBackground: Color(0xffffffff),
  surface: Color(0xff121212),
  onSurface: Color(0xffffffff),
  surfaceVariant: Color(0xff121212),
  onSurfaceVariant: Color(0xffffffff),
  inverseSurface: Color(0xffffffff),
  onInverseSurface: Color(0xff000000),
  inversePrimary: Color(0xff635b70),
  shadow: Color(0xff000000),
);
```

The examples, cases 1 to 12, and the custom modified ThemeData.from approach.

```dart
// 1a) TD.light
//    ThemeData(brightness: Brightness.light)
//    ThemeData(brightness: Brightness.dark)
//
title: '1a/b) TD.light',
theme: ThemeData.light(),
darkTheme: ThemeData.dark(),

// 1b) TD brightness
//    ThemeData(brightness: Brightness.light)
//    ThemeData(brightness: Brightness.dark)
//
title: '1b) TD brightness',
theme: ThemeData(
  brightness: Brightness.light,
),
darkTheme: ThemeData(
  brightness: Brightness.dark,
),

// 2) TD primarySwatch
//    ThemeData(brightness: ..., primarySwatch: Colors.blue)
//
title: '2) TD primarySwatch',
theme: ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
),
darkTheme: ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.blue,
),

// 2) TD primarySwatch
//    ThemeData(brightness: ..., primarySwatch: flexSwatch)
//
title: '2) TD primarySwatch',
theme: ThemeData(
  brightness: Brightness.light,
  primarySwatch: flexSwatch,
),
darkTheme: ThemeData(
  brightness: Brightness.dark,
  primarySwatch: flexSwatch,
),

// 3) TD scheme.fromSwatch
//    ThemeData(colorScheme: ColorScheme.fromSwatch(...))
//
title: '3) TD scheme.fromSwatch',
theme: ThemeData(
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: flexSwatch, // Colors.blue
    brightness: Brightness.light,
  ),
),
darkTheme: ThemeData(
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: flexSwatch, // Colors.blue
    brightness: Brightness.dark,
  ),
),

// 4) TD.from scheme.fromSwatch
//    ThemeData.from(colorScheme: ColorScheme.fromSwatch(...))
//
title: '4) TD.from fromSwatch',
theme: ThemeData.from(
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: flexSwatch,
    brightness: Brightness.light,
  ),
),
darkTheme: ThemeData.from(
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: flexSwatch,
    brightness: Brightness.dark,
  ),
),

// 5) TD colorScheme
//    ThemeData(colorScheme: ColorScheme(...))
//
title: '5) TD colorscheme',
theme: ThemeData(colorScheme: flexSchemeLight),
darkTheme: ThemeData.from(colorScheme: flexSchemeDark),

// 6) TD.from colorScheme
//    ThemeData.from(colorScheme: ColorScheme(...))
//
title: '6) TD.from colorScheme',
theme: ThemeData.from(colorScheme: flexSchemeLight),
darkTheme: ThemeData.from(colorScheme: flexSchemeDark),

// 7) TD colorSchemeSeed
//    ThemeData(colorSchemeSeed: Color(...))
//
title: '7) TD colorSchemeSeed',
theme: ThemeData(
  brightness: Brightness.light,
  colorSchemeSeed: const Color(0xff6750a4),
),
darkTheme: ThemeData(
  brightness: Brightness.dark,
  colorSchemeSeed: const Color(0xff6750a4),
),

// 8) TD scheme.fromSeed
//    ThemeData(colorScheme: ColorScheme.fromSeed(...))
//
title: '8) TD scheme.fromSeed',
theme: ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xff6750a4),
    brightness: Brightness.light,
  ),
),
darkTheme: ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xff6750a4),
    brightness: Brightness.dark,
  ),
),

// 9) TD.from scheme.fromSeed
//    ThemeData.from(colorScheme: ColorScheme.fromSeed(...))
//
title: '9) TD.from fromSeed',
theme: ThemeData.from(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xff6750a4),
    brightness: Brightness.light,
  ),
),
darkTheme: ThemeData.from(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xff6750a4),
    brightness: Brightness.dark,
  ),
),

// 10) FTD.light(colorScheme)
//    FlexThemeData.light(colorScheme:...),
//    FlexThemeData.dark(colorScheme:...),
//
title: '10) FTD.light(colorScheme)',
theme: FlexThemeData.light(colorScheme: flexSchemeLight),
darkTheme: FlexThemeData.dark(colorScheme: flexSchemeDark),

// 11) FTD.light(keyColors)
//    FlexThemeData.light(colorScheme:..., keyColors: ...),
//    FlexThemeData.dark(colorScheme:..., keyColors: ...),
//
title: '11) FTD.light(keyColors)',
theme: FlexThemeData.light(
  colorScheme: flexSchemeLight,
  keyColors: const FlexKeyColors(),
),
darkTheme: FlexThemeData.dark(
  colorScheme: flexSchemeDark,
  keyColors: const FlexKeyColors(),
),

// 12) FTD.light(key sub)
//    FlexThemeData.light(colorScheme:..., keyColors: ...),
//    FlexThemeData.dark(colorScheme:..., keyColors: ...),
//
title: '12) FTD.light(key sub)',
theme: FlexThemeData.light(
  colorScheme: flexSchemeLight,
  keyColors: const FlexKeyColors(),
  subThemesData: const FlexSubThemesData(
    defaultRadius: 4,
    fabUseShape: false,
    useTextTheme: false,
  ),
),
darkTheme: FlexThemeData.dark(
  colorScheme: flexSchemeDark,
  keyColors: const FlexKeyColors(),
  subThemesData: const FlexSubThemesData(
    defaultRadius: 4,
    fabUseShape: false,
    useTextTheme: false,
    interactionEffects: false,
  ),
),


// Custom ThemeData setup
// A modified "ThemeData.from" approach.
//
title: 'Custom ThemeData',
theme: ThemeData(
  colorScheme: flexSchemeLight,
  brightness: flexSchemeLight.brightness,
  primaryColor: flexSchemeLight.primary,
  primaryColorLight: Color.alphaBlend(
      Colors.white.withAlpha(0x66), flexSchemeLight.primary),
  primaryColorDark: Color.alphaBlend(
      Colors.black.withAlpha(0x66), flexSchemeLight.primary),
  secondaryHeaderColor: Color.alphaBlend(
      Colors.white.withAlpha(0xCC), flexSchemeLight.primary),
  toggleableActiveColor: flexSchemeLight.secondary,
  scaffoldBackgroundColor: flexSchemeLight.background,
  canvasColor: flexSchemeLight.background,
  backgroundColor: flexSchemeLight.background,
  cardColor: flexSchemeLight.surface,
  bottomAppBarColor: flexSchemeLight.surface,
  dialogBackgroundColor: flexSchemeLight.surface,
  indicatorColor: flexSchemeLight.onPrimary,
  dividerColor: flexSchemeLight.onSurface.withOpacity(0.12),
  errorColor: flexSchemeLight.error,
  applyElevationOverlayColor: false,
),
darkTheme: ThemeData(
  colorScheme: flexSchemeDark,
  brightness: flexSchemeDark.brightness,
  primaryColor: flexSchemeDark.primary,
  primaryColorLight: Color.alphaBlend(
      Colors.white.withAlpha(0x59), flexSchemeDark.primary),
  primaryColorDark: Color.alphaBlend(
      Colors.black.withAlpha(0x72), flexSchemeDark.primary),
  secondaryHeaderColor: Color.alphaBlend(
      Colors.black.withAlpha(0x99), flexSchemeDark.primary),
  toggleableActiveColor: flexSchemeDark.secondary,
  scaffoldBackgroundColor: flexSchemeDark.background,
  canvasColor: flexSchemeDark.background,
  backgroundColor: flexSchemeDark.background,
  cardColor: flexSchemeDark.surface,
  bottomAppBarColor: flexSchemeDark.surface,
  dialogBackgroundColor: flexSchemeDark.surface,
  indicatorColor: flexSchemeDark.onBackground,
  dividerColor: flexSchemeDark.onSurface.withOpacity(0.12),
  errorColor: flexSchemeDark.error,
  applyElevationOverlayColor: true,
),

```
