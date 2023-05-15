### Archived changelog entry

> The Dart package site [pub.dev](https://pub.dev/) restricts the size of the main [CHANGELOG.md](https://github.com/rydmike/flex_color_scheme/blob/master/CHANGELOG.md) file size to maximum 128kB. To work around this limitation, older change entries have been moved into individual files linked from the main changelog.

## 4.0.0-dev.1

**November 13, 2021**

The change log for 4.0.0 is identical to this dev release all changes below landed without modifications in the final 4.0.0 release.

### Overview

The breaking case is a minor difference in produced style for true
black mode. Version 4.0.0 is still fully API compatible with version 3.
Version 4.0.0 does however contain so many new
features, that it in itself warrants a new major release bump.

**BREAKING**

* In dark mode, the `darkIsTrueBlack` now makes `surface` color
  8% darker instead of 6%. This change was needed to support overlay color
  in dark mode when using `darkIsTrueBlack` when using the new `surfaceMode`
  property. For more information see Flutter SDK
  issue [90353](https://github.com/flutter/flutter/issues/90353).

* From the color scheme English descriptions the sentence end "." was removed from all
  description strings. If and when you want one, you can add it as needed.

**NEW**

* Added a more flexible and powerful alpha blending feature for
  surface and background colors. The new properties in the `FlexColorScheme`
  factories `light` and `dark` are `surfaceMode`, of type enum `FlexSurfaceMode`
  and integer `blendLevel`. Consider using them instead of previous
  `surfaceStyle`.
  The surface color blend style `surfaceStyle` is still default, and not yet
  deprecated, but may be so in version 5. It is not really needed anymore,
  but there was no major reason to break things by removing it either.

* Major new feature, easy sub-theming of Flutter SDK UI widgets.
    * You can opt in on nice looking opinionated widget sub-themes by setting
      `FlexColorScheme.useSubThemes` to true, it is false by default.
    * The default settings for the sub-theme is inspired by
      [Material 3 design (M3)](https://m3.material.io/.) It mimics it to large extent
      when using default value sub-theme values and settings. The varying corner
      radius is different per widget type. The new TextTheme Typography is also
      included. All parts cannot be made to look exactly like M3 in Flutter when using
      [Material 2 design (M2)](https://material.io/), but many parts
      can, and where possible the defaults try follow those values. You can of
      course override the default.
    * You can tweak these sub themes with a number of parameters
      defined in the `FlexSubThemesData` class, passed to
      `FlexColorScheme.subThemesData`.
    * The `FlexSubThemesData` class provides parameters for easy adjustment
      of corner radius in Widgets that use `ShapeBorder` or decorations, that
      support changing the Widget's corner radius. With the sub themes enabled, you
      can easily create a theme with a consistent corner radius on built-in
      Flutter SDK UI widgets.
    * The widget sub-themes also harmonize a few other styles, e.g. `ToggleButtons`
      to match the standard buttons regarding size and design as far as possible.
    * In case you still use the old deprecated buttons, they also get
      `ButtonThemeData` that as far as possible match the same style.
    * Via the sub themes it is by default opted-in to also use a bit Material You
      like coloring on the text styles. This can also be opted out of, even if
      otherwise opting in on sub-themes, it is on by default when opting in on
      sub themes.

* Added `FlexThemeData` static extension on `ThemeData`.
    * FlexColorScheme Themes can now also be created with the new syntax
      `FlexThemeData.light` and `FlexThemeData.dark`, instead of using
      `FlexColorScheme.light().toTheme` and `FlexColorScheme.dark().toTheme`.
    * The `toTheme` method is still available and works as before. It will not
      be deprecated. It is needed when making elaborate custom sub themes beyond
      what is offered when using `FlexColorScheme` based opt-in sub themes. When
      you make custom sub themes yourself, you often need access to
      the `ColorScheme` that is defined in current `FlexColorScheme()` instance.
      You can get it with `FlexColorScheme().toScheme`. Then use this
      standard `ColorScheme` or any of its colors, in your custom sub theme
      definitions, that you then add with copyWith to your FlexColorScheme based
      theme, like `FlexColorScheme().toTheme.copyWith(..."your sub themes and
      other ThemeData over-rides here")`.

* Added `textTheme` and `primaryTextTheme` properties to
  `FlexColorScheme` to enable easy setup of custom `TextThemes`, without the
  need to add a custom `TextTheme` via a `copyWith`, plus `merge` with the
  default text theme.

* Added `FlexColorScheme.dialogBackground` as a background surface
  color that can be controlled and themed separately.

* Added `appBarOpacity` to `FlexColorScheme.light()` and `dark()`.
  With it, you can apply themed opacity to the `AppBar` background color to
  the selected `FlexAppBarStyle` it is using.

* On the `FlexColorScheme` factories `light` and `dark`, exposed
  the `Color` properties `primary`, `primaryVariant`, `secondary`,
  `secondaryVariant`, `appBarBackground`, `dialogBackground` and `error`.
  They all default to null, but if provided they can be used as override values
  to factory behaviors defined by `scheme`, `colors`, `appBarStyle`,
  `surfaceMode` and `surfaceStyle` that
  otherwise via the factories define the colors for these properties. If a value
  for one of the new direct color properties is used with the factory, it always
  has precedence over other properties that assign or compute colors for it.

* Exposed boolean property `applyElevationOverlayColor`. It has the same
  function as the same property in `ThemeData`. It applies a semi-transparent
  overlay color on Material surfaces to indicate elevation for dark themes.
  In `FlexColorScheme` it defaults to true. In Flutter `ThemeData.from` it
  also default to true, but in `ThemeData` it defaults to false.
  The property is just available for convenience, so you can avoid a `copyWith`
  if you wish to turn it off. It is not necessarily needed or even desired when
  using strong alpha blends on surfaces in dark mode, to use an elevation
  overlay color.

* All `FlexSchemeData` objects in `FlexColor` are exposed as static
  const objects, making them easy to pick and reuse as const objects
  individually in custom color scheme lists, or as input to the `colors`
  property. Previously only the individual color value definitions were exposed.

* Added convenience extension `.blendAlpha()` on `Color`
  in `FlexColorExtensions`.

* The `FlexThemeModeSwitch` got a bool property `hasTitle`, if set
  to `false` it removes the title entirely.

* The `FlexThemeModeSwitch` got a `buttonOrder` property using enum
  `FlexThemeModeButtonOrder` that you can use to define the order of its
  light, system and dark theme mode buttons, in all possible combinations.

* Added edgeToEdge support to
  `FlexColorScheme.themedSystemNavigationBar`. This brings the previously
  experimental support for transparent system navigation bar in Android
  into the supported fold in FlexColorScheme. Its functionality
  requires min Android SDK level 29, but other than that it works without
  Android setup shenanigans. No added APIs, the API for it already existed
  in previous version of FlexColorScheme, using it did however require
  special Android build configuration setup, this is no longer required.

* **New color schemes:** Added four new built-in color schemes.
  Total number of color schemes is now 36 matched light and dark pairs.
    * **Blue whale** - Blue whale, jungle green and outrageous tango orange.
      Use enum value `FlexScheme.blueWhale` for easy access to it.
      This theme is final and selected for inclusion as a new one.
    * **San Juan blue** - San Juan blue and pink salmon theme.
      Use enum value `FlexScheme.sanJuanBlue` for easy access to it.
    * **Rosewood** - Rosewood red, with horses neck and driftwood theme.
      Use enum value `FlexScheme.rosewood` for easy access to it.
    * **Blumine** - Blumine, easter blue and saffron mango theme.
      Use enum value `FlexScheme.blumineBlue` for easy access to it.

**CHANGE**

* The `FlexColor.schemesList` is now a `const` for improved  efficiency.

**DOCS**

* The new main example is a complete quick start guide that doubles as
  "developers" hot reload based playground template. It has comments
  explaining what is going on.
  If you skip reading the readme docs and tutorial, the example may help
  to kick-start using FlexColorScheme and all its features. It shows most
  of the features in last tutorial example 5, but without any interactive UI.
  You are the UI and can edit prop values and use hot-reload to see changes.
* All examples now use the new `FlexThemeData` extension syntax to create the
  `ThemeData` and `surfaceMode` to define the alpha blended surfaces.
* Examples 2 to 5 also use the in Flutter 2.5 new skeleton architecture, with
  a ChangeNotifier based controller. AnimatedBuilder to listen to it, and
  an abstract service to get and persist the theme settings, with a concrete
  in-memory implementation, plus the implementations to persist the theme.
    * Examples 2 to 4 use the Hive implementation.
    * Example 5 uses the SharedPreferences implementation

**TESTS**

* Added tests for the new features, total 1066 tests.
* Coverage 99%, will improve them more later.