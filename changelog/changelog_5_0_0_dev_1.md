### Archived changelog entry

> The Dart package site [pub.dev](https://pub.dev/) restricts the size of the main [CHANGELOG.md](https://github.com/rydmike/flex_color_scheme/blob/master/CHANGELOG.md) file size to maximum 128kB. To work around this limitation, older change entries have been moved into individual files linked from the main changelog.

## 5.0.0-dev.1

**March 14, 2022**

### Overview

Version 5 is a big refactor with deprecation of previous `variant` based
color names in favor of `container` ones that were added to updated M3
based `ColorScheme` in Flutter 2.10.0. The same additions and changes are now
also introduced in FlexColorScheme. Despite being a very big release, with
many new features, actual breaking changes are very few and mostly concerns
in version 4 deprecated members and of course requiring minimum Flutter
2.10.0 to work.

The WIP updates now includes the version of the key color seeded M3 `ColorScheme`
usage intended for the final design. The feature supports seeding by not only
using a single `primary` key color, but also using separate key colors for
`secondary` and `tertiary` colors. The Flutter SDK `ColorScheme.fromSeed` only
support using a single color as seed. The `primary`, `secondary` and `tertiary`
color are used as key color seeds, when seeding is used, and by default all
three color are used as key for their respective tonal palette used by
the generated `ColorScheme`. Using `secondary` and `tertiary` colors can each
optionally be turned OFF. If both are, the result is same as when using
`ColorScheme.fromSeed`, with the `primary` color as seed key color.

When using a key seed color generated `ColorScheme`, it may sometimes, e.g., for
branding purposes, be useful to lock a certain color in the resulting
`ColorScheme` to the actual key color value used for `primary`, `secondary`
and `tertiary`. `FlexColorScheme` includes scheme appropriate colors for
each of these color properties, as well
their containers. You can for each property define which ones you want to keep
as defined by these input colors, in the seed generated `ColorScheme`. You
can of course use this feature with custom input colors as well.

The bundled example 5, the Themes Playground is now fully up to date with all
the new features. Its updated code generation still
needs results verification.

There are also now in Flutter master channel more actual
M3 impacts and ThemeData color property deprecations commits landed in Flutter
master channel that I reviewed and prepared for in advance when possible.

Much work on tests, and readme documentation updates remain, but API docs are
up-to-date. This book long change log may also help. There are only a few
breaking changes, and most of them are rarely used properties, so migration
should be relatively easy, despite the long list of changes and new features.

**BREAKING**

* Requires at least Flutter stable 2.10.0.This release uses new M3 `ColorScheme`
  properties that are not included before Flutter version 2.10.0, as well
  as the `ThemeData` flag `useMaterial3`.

* Removed parameter `surfaceStyle` from `FlexThemeData`
  extensions `FlexThemeData.light` and `FlexThemeData.dark` that uses
  in version 4.2.0 already deprecated property `surfaceStyle` in `FlexColorScheme`
  class. The same deprecated property `surfaceStyle` in `FlexColorScheme` class
  is still available in 5.0.0-dev.1. In the stable release 5.0.0 it might
  be removed as well. They were all scheduled for deprecation in version 5.0.0,
  but keeping it around a bit longer in the main class in 5.0.0-dev releases
  to prolong backwards API compatibility during development. Maybe I will keep
  it in the release too, many tests need to be rewritten when they are removed.

* The enum `SchemeColor` has new values and past values are in a
  new order. The **order was changed** to accommodate new color values and to
  keep them in the same order as their corresponding color properties
  in M3 `ColorScheme`. The change of order is potentially breaking, but unlikely
  to break anything in major ways, other than possibly local storage of selected
  enum values. In the bundled samples you might for example see wrong color
  selections loaded from local storage, just reset or select correct value
  to fix it.

* To get more harmonized setup on opt-in sub themes for `NavigationBar`,
  `BottomNavigationBar` and `NavigationRail` a few properties in
  `FlexSubThemesData` and `FlexSubThemes` had to be modified and broken.
  Impact is estimated to be low for most users.

  The following properties were renamed in `FlexSubThemesData`:
    * `navigationBarTextSchemeColor` -> `navigationBarSelectedLabelSchemeColor`
    * `navigationBarMutedUnselectedText` -> `navigationBarMutedUnselectedLabel`
    * `navigationBarIconSchemeColor` -> `navigationBarSelectedIconSchemeColor`
    * `bottomNavigationBarSchemeColor` -> `bottomNavigationBarSelectedLabelSchemeColor`

  In `FlexSubThemesData` the property `navigationBarIsStyled` was removed. It is
  no longer needed. The same end result it enabled can be achieved by
  setting all NavigationBar related properties in `FlexSubThemesData` that
  have a none null default value to null.

  The following parameters were renamed in `FlexSubThemes.navigationBarTheme`:
    * `textSchemeColor` -> `selectedLabelSchemeColor`
    * `unselectedTextSchemeColor` -> `unselectedLabelSchemeColor`
    * `iconSchemeColor` -> `selectedIconSchemeColor`
    * `mutedUnselectedText` -> `mutedUnselectedLabel`

  The following parameter was renamed in `FlexSubThemes.bottomNavigationBarTheme`:
    * `baseSchemeColor ` -> `selectedLabelSchemeColor`


**NEW**

* Added `useMaterial3` to all theme constructors and factories. This is
  the same flag as in `ThemeData`, it does not have any major impact on
  default themed widgets in Flutter 2.10.x. Opting in on opinionated
  sub-themes, will however as before give opinionated component sub-themes that
  result in Material 3 like styles. Similar look will become default widget
  design in later Flutter SDK versions when using the flag `useMaterial3` is
  set to true.

* Added new properties `onPrimaryContainer`, `onSecondaryContainer`,
  `tertiary`, `tertiaryContainer`, `onTertiary` and  `onTertiaryContainer` to
  the un-named`FlexColorScheme` constructor and factories
  `FlexColorScheme.light` and `FlexColorScheme.dark`, as well as to extension
  `FlexThemeData` to extensions `FlexThemeData.light` and `FlexThemeData.dark`
  on `ThemeData`.

* In `FlexColor` added new color properties for all color values to cover the
  new "`Container`" color properties in Flutter 2.10 new M3 `ColorScheme`.
  For every built-in `FlexColor`, there are now also these new color properties:
    - `primaryContainer`
    - `secondaryContainer`
    - `tertiary`
    - `tertiaryContainer`

  The previous color values maps as follows:
    - `tertiary` = old `secondaryVariant` color value, that is deprecated
      for each color value.
    - Old `primaryVariant`, is just deprecated for each color value.

  The "variant" colors are still available as deprecated properties, and will
  remain available until version 6.0.0. The old color properties and their values
  still work as inputs, and they produce same equivalent `ColorScheme` results
  as before. This is done by the values still being assigned as fallback value
  in custom schemes so that new:
    - `primaryContainer` if not assigned, falls back via old `primaryVariant`.
    - `secondaryContainer` if not assigned, falls back via old `secondaryVariant`.

  When it comes to the new built-in scheme designs, the color used on past:
    - `secondaryVariant` was a reasonable fit for new M3 `tertiary` color property
      and was used as its value.
    - The new properties `secondaryContainer` and
      `tertiaryContainer`, had to get new built-in color values that fit with
      the M3 design intent for those color properties. This while considering the
      value `secondary` already had, and the value `tertiary` got by being
      assigned the color value of past `secondaryVariant`.
    - The new color property `primaryContainer` also needed a new color value. The
      past `primaryVariant` is not the correct design fit for how the color
      value is intended to be used in M3 Color design.
    - In many cases it was possible to make nice color schemes, by reshuffling
      some existing color values and using colors from light scheme, in container
      properties in dark scheme and vice versa. Sometimes new better tuned
      color values were used. In all events all `Container` color properties
      are **new** features in this release, so they are considered "new" even
      if their color value might have been recycled from previous properties
      in some cases. Some `Container` color values **may** still be fine-tuned
      before final 5.0.0 release, but it is unlikely.


* In class `FlexSchemeColor` added **new** color properties
  `primaryContainer` and `secondaryContainer` they replace
  deprecated properties `primaryVariant`and `secondaryVariant`. The old
  properties still work and are
  used as fallback to the new ones when the new ones are not provided.
  The previous properties are still available as deprecated, and will remain
  available until version 6.0.0, or until they are removed from the Flutter
  stable channel, whichever comes first. The properties for built-in schemes
  were assigned to their new corresponding `FlexColor`values.

* In class `FlexSchemeColor` added **new** color definitions from `FlexColor`
  for `FlexSchemeColor.tertiary` and `FlexSchemeColor.tertiaryContainer`.

* In class `FlexSchemeColor` the `FlexSchemeColor.secondaryContainer`
  and `FlexSchemeColor.tertiaryContainer` should be brighter versions of their
  none container parent light mode and darker in dark mode. They receive
  such color values via new corresponding `FlexColor`values.

* In factory `FlexSchemeColor.from` added optional and nullable parameter
  `brightness`. If not assigned, the factory works as before, producing a
  complete `FlexSchemeColor` from just one or more color property inputs,
  by producing a toned complete `FlexSchemeColor` suitable for a light or
  dark M2 design based theme. If brightness is given value `Brightness.light`
  it produces a `FlexSchemeColor` from just one or more color property inputs
  suitable for a M3 light theme mode theme. If `brightness` is dark, for
  a dark mode intended M3 scheme. When `brightness` is defined the factory
  also sets defaults for `error` and `errorContainer` colors, if they
  were not passed in. The `error` color is based on the Material 2 guide color
  and `errorContainer` is a FlexColorScheme definition as it has no M2 value.
  Seed based new M3 error colors are used when using key based seeded M3
  ColorScheme. An option to also use M3 based error colors when not using
  seeded ColorScheme, may be added in a future version.


* Factory `FlexSchemeColor.effective` got the same nullable and optional
  `brightness` property as `FlexSchemeColor.from`, with same functionality,
  producing the same kind of M3 tone mapped colors when reducing amount of
  used colors, and also providing error color defaults.
  The `FlexSchemeColor.effective` factory otherwise works as before considering
  color swapping and effective input colors reduction. Producing same results
  via `usedColors` input limiter as if provided `FlexSchemeColor` would have
  been created with `FlexSchemeColor.from` limited to same colors as implied
  by `usedColors` parameter in the `FlexSchemeColor.effective` factory.

* To the method `FlexSchemeColor.toDark()`, that computes a dark theme mode
  appropriate `FlexSchemeColor` set from colors designed for light
  theme mode, added the optional positional bool parameter `swapColors`.
  It is false by default to not break past behavior.
  It is used to swap the "main" and its `Container` color properties. So that
  `primary` <> `primaryContainer`, `secondary`<> `secondaryContainer` and
  `tertiary`<> `tertiaryContainer` in the input light theme mode designed
  `FlexSchemeColor` are swapped before producing the output `FlexSchemeColor`
  suitable for a dark theme mode. This is useful if the input
  `FlexSchemeColor` is designed for a light M3 based `ColorScheme`. If it is
  then, to get a correct M3 designed output and via `whiteBlend` value
  desaturated colors, the main and container values of the light mode colors
  should be swapped in the result. In light mode, M3 main is darker than
  container, but in M3 dark mode it should be the other way around so that
  main is lighter and container is darker. By swapping the colors and then
  de-saturate them with an adjustable white alpha blend, we can achieve
  this design goal as well, when computed dark theme mode colors from a set
  of provided light theme mode input colors.


* Added additional opinionated component sub-themes for:
    - `SwitchThemeData` via `FlexSubThemes.switchTheme`.
    - `CheckboxTHemeData` via `FlexSubThemes.checkboxTheme`.
    - `Radio` via `FlexSubThemes.radioTheme`.
    - `NavigationRailThemeData` via `FlexSubThemes.navigationRailTheme`.

  There are many quick and easy configuration parameters added
  to `FlexSubThemesData`. The following built-in widgets now have quick and
  easy custom theming option via sub-themes opt-in.

    * `TextButton`
    * `ElevatedButton`
    * `OutlinedButton`
    * Older buttons using `ButtonThemeData`
    * `ToggleButtons`
    * `Switch`
    * `Checkbox`
    * `Radio`
    * `InputDecoration`
    * `FloatingActionButton`
    * `Chip`
    * `Card`
    * `PopupMenuButton`
    * `Dialog`
    * `TimePickerDialog`
    * `SnackBar`
    * `Tooltip`
    * `BottomSheet`
    * `BottomNavigationBar`
    * `NavigationBar`
    * `NavigationRail`

* Added additional `ColorScheme` color selection options to component
  sub-themes configuration class `FlexSubThemesData`. The feature
  introduced in version 4.2.0 is now also supported by sub-themes for:
    - `FloatingActionButton`, via `FlexSubThemesData.fabSchemeColor`.
    - `TextButton`, via `FlexSubThemesData.textButtonColor`.
    - `ElevatedButton`, via `FlexSubThemesData.elevatedButtonColor`.
    - `OutlinedButton`, via `FlexSubThemesData.outlinedButtonColor`.
    - `MaterialButton`, via `FlexSubThemesData.materialButtonColor`.
    - `ToggleButtons`, via `FlexSubThemesData.toggleButtonsColor`.
    - `Switch` via `FlexSubThemes.switchTheme`.
    - `Checkbox` via `FlexSubThemes.checkboxTheme`.
    - `Radio` via `FlexSubThemes.radioTheme`.
    - `NavigationRail` via `FlexSubThemes.navigationRailTheme`.
    - Dialog backgrounds, affects `DialogTheme` and `TimePickerThemeData`
      via `FlexSubThemesData.dialogBackgroundColor`. If used this property
      overrides color property `dialogBackground` in all FlexColorScheme
      constructors, factories and theme data extensions.
    - `AppBar` background color, via the AppBar sub-theme definition is built into
      the `FlexColorScheme.toTheme` method (legacy).
      May migrate its implementation to own `FlexSubThemes` sub-theme later.
    - `TabBar` for indicator and item color. The TabBar sub-theme definition
      is currently built into the `FlexColorScheme.toTheme` method (legacy).
      May migrate its implementation to own `FlexSubThemes` sub-theme later.


* Added a `FlexKeyColors` configuration class that can be used with
  the `FlexColorScheme.keyColors` to enable and configure Material 3 based
  key color based tonal palettes' generation that are then used to define
  the `ColorScheme`. The tonal palettes are generated using existing
  built-in or custom colors, as key colors for generating palettes.
  The method matches the `ColorScheme.fromSeed` Flutter SDK
  feature if you only use primary color as input. However, it also offers more
  configuration and flexibility on how to use key colors as seed colors. It
  does so without the need to go to lower API levels to produce custom tonal
  palettes and use them manually in the `ColorScheme` definition. The
  implementation makes it easy to use a combination of key seeded colors and
  fixed colors, in any combination, to produce the color scheme.
  This makes using seeded colors an option for supplementary colors while e.g.,
  primary color is locked to a given brand or design color value, but
  other colors in the ColorScheme are less critical, and it is more important
  that they match the tone of the over all theme.

* Added bool property `useMaterial3ErrorColors` to `FlexColorScheme.light` and
  `FlexColorScheme.dark`. Set to true, to use the new Material 3 error colors,
  instead of past Material2 based ones, which are still default. When using key
  color seed generated [ColorScheme]s always use the Material 3 based error
  colors.

* Added custom tone configuration for seeded `ColorScheme`. M3 color design
  has it own fixed defaults for which tone from the relevant `TonalPalette`
  is used as input on each color property in the light and corresponding dark
  `ColorScheme`. By configuring and passing in a `FlexTones` to `tones` in
  `FlexColorScheme.light` and `FlexColorScheme.dark` it is possible
  to control which color tone from the relevant `TonalPalette` is used for
  each color property in generated `ColorScheme`.
  Obviously making poor selections produces bad results, but there are some
  tuning that works very well for different needs, e.g., primary could
  be assigned a one step lower value in light mode, to produce seeded color
  schemes that are more vivid or saturated.


* The Material 3 based seeded `ColorScheme` also locks down the chroma level of
  seed color for secondary colors to 16 and to 24 for tertiary colors, and keeps
  it at min 48 for primary color. The `FlexTones` configuration makes it
  possible to change these restrictions. You can then get more vivid tonal
  palettes also for secondary and tertiary `TonalPalettes`. FlexTones has a
  `FlexTones.light` and `FlexTones.dark` constructor that have default values
  that gives the same result as using the hard coded `ColorScheme.fromSeed`
  tone mapping and chroma limit behavior on `TonalPalette`. These constructors
  are also convenient to use when making custom `FlexTones` setups. To show
  how, it comes with four built in examples. They take a `Brightness` value
  as input, and return `FlexTones` configs with different design goals suitable
  for dark or light mode brightness themes. There is `FlexTones.material`, it is
  an alternative `Brightness` input based API for `FlexTones.light` and
  `FlexTones.dark` to get the default Material 3 design guide config.
  Similarly, there are 3 alternative configurations.
    * `FlexTones.soft` for even softer and more earthy tones than
      M3 defaults, that are pretty soft and pastel like to begin with.
    * If you prefer more vivid tones to be generated, try `FlexTones.vivid`.
    * If you like or need more contrast differences between your colors, you can
      try `FlexTones.highContrast`.

  It is easy to make your own configs with the API. The setup of the
  these built-in examples shows how.


* Added new alpha blend control `blendOnLevel` value for onColors to class
  `FlexSubThemesData`. It is used to produce onColors for main colors that
  can be adjusted and be more in-line with M3 seed color usage design by tuning
  their blend level. Before, this was turned on via `blendOnColors` toggle
  that will remain, but has a slightly modified new function.
  The `blendOnLevel` introduces a new blend level value for onColor that is not
  tied to used blend level on surfaces.


* Defined matching color values for new `FlexSchemeColor.secondaryContainer`
  and `FlexSchemeColor.tertiaryContainer` for all existing built-in
  color schemes. This was surprisingly tedious task.

* **New color schemes:** Added four new built-in color schemes.
  Total number of color schemes is now 40 matched light and dark pairs.
    * **Flutter Dash** - A Flutter Dash 4k desktop wallpaper colors based theme.
      Use enum value `FlexScheme.flutterDash` for easy access to it.
    * **M3 baseline** - Material guide 3 baseline based theme.
      Use enum value `FlexScheme.materialBaseline` for easy access to it.
    * **Verdun green** - Material guide 3 verdun and mineral green with hemlock.
      Use enum value `FlexScheme.verdunHemlock` for easy access to it.
    * **Dell genoa green** - Material guide 3 theme with dell, axolotl
      and genoa greens.
      Use enum value `FlexScheme.dellGenoa` for easy access to it.

**CHANGE**

* Added all the new `ColorScheme` M3 color properties to `SchemeColor`
  enum and its static functions `schemeColor` and `schemeColorPair`.
  Deprecated the enum values `primaryVariant` and `secondaryVariant`. These
  deprecated enum values are still available, but return correct replacement M3
  color values from the in Flutter 2.10.0 updated `ColorScheme` when using
  functions `schemeColor` and `schemeColorPair`.

* To class `FlexColorScheme` default constructor, `light` and
  `dark` factories, added properties `primaryContainer` and
  `secondaryContainer`. They replace deprecated properties `primaryVariant`
  `secondaryVariant`. The old properties still work and are used as fallback to
  the new ones, if the new ones are not provided.
  The previous properties are still available as deprecated, and will remain
  available until version 6.0.0.

* In extension `FlexThemeData` to extensions `FlexThemeData.light`
  and `FlexThemeData.dark` added properties `primaryContainer` and
  `secondaryContainer`. They replace deprecated properties `primaryVariant`
  `secondaryVariant`. The old properties still work and are used as fallback to
  the new ones, if the new ones are not provided.
  The previous properties are still available as deprecated, and will remain
  available until version 6.0.0.


* The opt-in, custom M3 `TextTheme` is now defined using the
  new actual M3 `TextStyle` names available in Flutter 2.10.0. The change is
  none breaking thanks to underlying implementation in Flutter SDK 2.10.0.
  It now also includes the new styles `headlineMedium` and `labelMedium` that do
  not directly map to any previous M2 text styles. Flutter SDK automatically
  maps the new `TextTheme` and its `TextStyles` to corresponding M2 text style
  names, so they work and can be used as before. This opt-in TextTheme includes
  the new M3 typography (text size and letter spacing), for what presumably will
  become `EnglishLike2021` as `Typography` when it is included in Flutter.
  This typography (font geometry) is not yet available in Flutter 2.10.0 and
  was not even in master at the time when Flutter 2.10.0 was released.
  FlexColorScheme has included a EnglishLike2021 geometry since version
  4.0.0, now it also uses the correct `TextStyle` names since they became
  available in Flutter 2.10.0. The actual `EnglishLike2021` will arrive in
  the Flutter stable release after 2.10.x. The current custom version of it
  will be removed then.

* The feature of `blendOnColors` has changed design wise slightly, it is now
  used as a toggle to indicate that on colors for the main colors,
  that is onPrimary, onSecondary, onTertiary and onError should also receive
  an alpha bland of its color pair, of strength `blendOnLevel`/2 when
  `blendOnColors` is true. If `blendOnColors` is false, they use white or
  black contrast color as appropriate for their main color pair. The
  blending of onColor only occurs when their main color is not using seed
  based ColorScheme based color value.

* The `darkIsTrueBlack` option in `FlexColorScheme.dark` that makes and keeps
  scaffold background fully black, now makes other blended surfaces 5% darker
  instead of 8%, scaffold remains black.

* The `lightIsWhite` option in `FlexColorScheme.light` that makes and keeps
  scaffold background fully white, now makes other blended surfaces 5% lighter
  instead of 8%, scaffold remains white.

* The built-in description for `FlexScheme.material` was changed to
  "Default Material 2 color theme, used in the design guide" from
  "Default Material color theme, used in the design guide", to make it clear
  it came from the M2 guide.

* The built-in description for `FlexScheme.materialHc` was changed to
  "High contrast Material 2 design guide theme" from
  "High contrast Material design guide theme", to make it clear it came
  from the M2 guide.

* The order of the colors, in the rarely outside FlexColorScheme
  used demo apps, theme presentation/switch button `FlexThemeModeSwitch` was
  changed for better placement of new color `primaryContainer` and `tertiary`.
  The Colors `primaryVariant` and `secondaryVariant` were removed from it
  since the colors are deprecated in Flutter SDK. The change was from:

| Before           | Before            |
|------------------|-------------------|
| Primary          | Primary variant   |
| Secondary        | Secondary variant |

  to:

| After              | After           |
|--------------------|-----------------|
| Primary            | Secondary       |
| Primary container  | Tertiary        |

**FIX**

* When using `FlexSubThemesData.inputDecoratorSchemeColor` the floating label
  did not change to the selected ColorScheme based `SchemeColor`. Now it does,
  it also keeps the correct error color behavior. Tricky bugger to define this
  one by the way.

* **FIX TO MATCH M2 SPEC** and **STYLE BREAKING**: In **all** previous versions
  of FlexColorScheme, the Flutter
  `ThemeData.estimateBrightnessForColor` was used to calculate if black or white
  on color should be used on the `error` colors. In dark mode for the default
  error `FlexColor.materialDarkError` and the high contrast dark mode error
  color `FlexColor.materialDarkErrorHc`, this resulted in correctly computed
  contrast color value **white** being used on them. Regardless of this, the
  Material 2 guide specifies and Flutter SDK uses, **black** as the on color
  for these colors. These two cases were added as special considerations
  to return black color for these two particular color cases, even if the Flutter
  contrast color computation says it should be white, but since M2 spec is black,
  we decided to go with that despite this. It is a borderline case, both work
  but results in different style.

**KNOWN ISSUES**

* Due to Flutter SDK
  [issue #100027](https://github.com/flutter/flutter/issues/100027)
  "Using systemNavigationBarDividerColor changes statusBarIconBrightness and
  systemNavigationBarIconBrightness on Android 11" a number of temporary
  changes were made to `FlexColorScheme.themedSystemNavigationBar`. The
  divider feature is disabled until the issue has been resolved. There is
  also a temporary workaround implemented, it attempts to keep system icons from
  getting the wrong brightness on Android 11. It may not always work.

**EXAMPLES**

* Updates to examples 1...4
    - Add a few of the new features to examples 3 and 4.
    - Removed showing the old, already in Flutter v1.26 deprecated
      buttons `RaisedButton`, `OutlineButton` and `FlatButton` in ALL the examples.
      They are going away in next stable release of Flutter after 2.10.x, as
      per this notice [#98537](https://github.com/flutter/flutter/issues/98537).

* Update default example app *Hot Reload Playground*.

* Major update to example 5 *Themes Playground*, it now
  includes support for all the new features:

    - Added config for unselected toggleable style.
    - Added feature to export the code for the active `ColorScheme`.
    - Added color scheme color configuration to all opinionated component
      sub-themes that have it.
    - Added color limit input `usedColors`, it is an old
      API in FlexColorScheme, it has just never been featured much.
    - Added `useMaterial3` toggle.
    - Added controls for using key color dynamic seeded ColorScheme, using
      the predefined colors primary, secondary and tertiary as seed colors.
    - Added a setup that demonstrates the usage
      of `FlexTones`. Made some useful setups as pre-configured FlexTones, and the
      playground uses demo. Now comes with `FlexTones.material` for the default
      Material 3 design guide config, and `FlexTones.soft`, `FlexTones.vivid`,
      `FlexTones.vividSurfaces` and `FlexTones.highContrast` as built-in
      pre-configured options. It is easy to make own configs with the API.
    - The ThemesPlayground paints active TonalPalettes and highlights selected
      tones in the palettes when you have on a ColorScheme color. May extend this
      to make an interactively configurable tonal setup by pickling tones from
      the `TonalPalette` and sliders to adjust chroma. this could later be used to
      create a custom `FlexTones` config and get it as part of setup code too.
    - Playground Cupertino adaptive switches now also follow theme via
      a custom SwitchListTileAdaptive wrapper. The iOS green switches are an
      eyesore imo, but the SDK adaptive switch cannot be changed via a theme
      alone. Needed to make a custom  widget where active thumb,
      explicitly uses switch theme color as thumb color, sigh.
    - Added border radius individual override adjustments on buttons, to demo
      that the API can do it too.
    - NavigationBar, BottomNavigationBar and Android system navigation bar were
      given separate panels, and many new configuration options. They still share
      some controller values, might separate them in some future version of
      the app.
    - Added NavigationRail Settings panel, with similar settings and NavigationBar.

**TESTS**

* Tests are still incomplete and currently down to about 86% coverage,
  but at least all existing (1275) ones are passing and behave as expected.
* Add tests for new `SchemeColor` properties.
* Add tests for `FlexTones`.
* Add tests for `FlexKeyColors`.
* Add tests for `FlexCorePalette`.
* Add test for all new sub-themes in `FlexSubThemes`.
* Add tests for new `useMaterial3` property.
* Add tests for all new sub themes `FlexSubThemes` and its config data
  in `FlexSubThemesData`.
* Add more tests for legacy fallbacks when using old deprecated
  `primaryVariant` and `secondaryVariant` properties.
* Add tests and verification of old colors definition backwards behavior.


