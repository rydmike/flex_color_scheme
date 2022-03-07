# Changelog

All notable changes to the **FlexColorScheme** package are documented here.

## v5.0.0-dev.1 - March 7, 2022 - WORK IN PROGRESS

Version 5 is a big refactor with deprecation of previous `variant` based
color names in favor of `container` ones that were added to updated M3
based `Colorcheme` in Flutter 2.10.0. The same additions and changes are now 
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
the generated `ColorScheme`. Using `secondary` and `teritary` colors can each 
optionally be turned OFF. If both are, the result is same as when using 
`ColorScheme.fromSeed`, with the `primary` color as seed key color.

When using a key seed color generated `ColorScheme`, it may sometimes, e.g. for
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
up-to-date. And this book long change log should help. There are only a few 
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
  `BottomNavigationBar` and `NaivgationRail` a few properties in 
  `FlexSubThemesData` and `FlexSubThemes` had to be modified and broken.
  Impact is estimated to be low for most users. 
  
  The following properties were renamed in `FlexSubThemesData`:
  * `navigationBarTextSchemeColor` -> `navigationBarSelectedLabelSchemeColor`
  * `navigationBarMutedUnselectedText` -> `navigationBarMutedUnselectedLabel`
  * `navigationBarIconSchemeColor` -> `navigationBarSelectedIconSchemeColor`
  
  In `FlexThemeData` the property `navigationBarIsStyled` was removed. It is 
  no longer needed. The same end result it enabled can be achieved by
  by setting all NavigationBar related properties in `FlexSubThemesData` that 
  have a none null default value to null.

  The following parameters were renamed in `FlexSubThemes.navigationBarTheme`:
  * `textSchemeColor` -> `selectedLabelSchemeColor`
  * `unselectedTextSchemeColor` -> `unselectedLabelSchemeColor`
  * `iconSchemeColor` -> `selectedIconSchemeColor`
  * `mutedUnselectedText` -> `mutedUnselectedLabel`


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
   - `primaryContainer`, if not assigned, falls back via old `primaryVariant`. 
   - `secondaryContainer`, if not assigned, falls back via old `secondaryVariant`.

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
  a dark mode intended M3 scheme. When `brightess` is defined the factory
  also sets defaults for `error` and `errorContainer` colors, if they
  were not passed in. The `error` color is based on the Material 2 guide color
  and `errorContaier` is a FlexColorScheme definition as it has no M2 value.
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
  `primary` <> `primarycontainer`, `secondary`<> `secondarycontainer` and 
  `tertiary`<> `tertiaryContainer` in the input light theme mode designed
  `FlexSchemeColor` are swapped before producing the output `FlexSchemeColor` 
  suitable for a dark theme mode. This is useful if the input  
  `FlexSchemeColor` is designed for a light M3 based `ColorScheme`. If it is
  then, to get a correct M3 designed output and via `whiteBlend` value 
  desaturated colors, the main and container values of the light mode colors 
  should be swapped in the result. In light mode, M3 main is darker than
  container, but in M3 dark mode it should be the other way around so that 
  main is lighter and container is darker. By swapping the colors and then 
  desaturating them with an adjustable white alpha blend, we can achieve
  this design goal as well, when computed dark theme mode colors from a set
  of provided light theme mode input colors.


* Added additional opinionated component sub-themes for:
  - `SwitchThemeData` via `FlexSubThemes.switchTheme`.
  - `CheckboxTHemeData` via `FlexSubThemes.checkboxTheme`.
  - `Radio` via `FlexSubThemes.radioTheme`.
  - `NavigationRailThemeData` via `FlexSubThemes.navigationRailTheme`.  
  
  There are many quick and easy configuration parameters added 
  to `FlexSubThemesData`. There following built in widgets hnow ave quick and
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
  implementation makes it easy to use use a combination of key seeded colors and
  fixed colors, in any combination, to produce the color scheme.
  This makes using seeded colors an option for supplementary colors while e.g.
  primary color is locked to a given brand or design color value, but
  other colors in the ColorScheme are less critical, and it is more important
  that they match the tone of the over all theme.
 
* Added custom tone configuration for seeded `ColorScheme`. M3 color design
  has it own fixed defaults for which tone from the relevant `TonalPalette`
  is used as input on each color property in the light and corresponding dark
  `ColorScheme`. By configuring and passing in a `FlexTones` to `tones` in 
  `FlexColorScheme.light` and `FlexColorScheme.dark` it is possible
  to control which color tone from the relevant `TonalPalette` is used for 
  each color property in generated `ColorScheme`.
  Obviously making poor selections produces bad results, but there are some
  tuning that works very well for different needs, e.g. primary could 
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
  In a similar fashion there are 3 alternative  
  configurations. `FlexTones.soft`, for even softer and more earthy tones than 
  M3 defaults, that are pretty soft and pastel like to begin with. If you prefer
  more vivid tones to be generated, try `FlexTones.vivid`. If you like or need
  more contrast differences between your colors, you can try 
  `FlexTones.highContrast`. It is easy to make your own configs with the API.
  The setup of the these built-in examples shows how.

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
  was not even in master at the time when when Flutter 2.10.0 was released. 
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


**FIXED**

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
  contrast color value **white** being used on them. Regardless of this the
  Material 2 guide specifies and Flutter SDK uses the on color for these 
  colors as **black**. These two cases were added as special considerations
  to return black color for these two particular cases, even if the Flutter 
  contrast color computation says it should be white, but M2 spec is black.

**TESTS TODO**
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

**EXAMPLES and Themes Playground**
* Update examples 1...4
  - **DONE:** Review and add a few of the new features to examples 3 and 4.
  - **DONE:** Removed showing the old, already in Flutter v1.26 deprecated
    buttons `RaisedButton`, `OutlineButton` and `FlatButton` in ALL the examples.
    They are going away in next stable release of Flutter after 2.10.x, as
    per this notice [#98537](https://github.com/flutter/flutter/issues/98537).
  
* Update default example app, the **Hot Reload Playground**.
* Major update for "example 5" the **Themes Playground**
  to include support for all the new features. Updates listed below:
  
  - **DONE:** Added config for unselected toggleable style.
  - **DONE:** Added feature to export the code for the active `ColorScheme`. 
  - **DONE:** Added color scheme color configuration to all opinionated component
    sub-themes that have it.
  - **DONE:** Added color limit input `usedColors`, it is an old
    API in FlexColorScheme, it has just never been featured much.
  - **DONE:** Added `useMaterial3` toggle.
  - **DONE:** Added controls for using key color dynamic seeded ColorScheme, using
    the predefined colors primary, secondary and tertiary as seed colors.
  - **DONE:** * To the playground app, added a setup that demonstrates the usage
    of `FlexTones`. Made some useful setups as preconfigured FlexTones, and the
    playground uses demo. Now comes with `FlexTones.material` for the default
    Material 3 design guide config, and `FlexTones.soft`, `FlexTones.vivid` 
    and `FlexTones.highContrast` as built-in preconfigured options. It is easy
    to make your own configs with the API.
  - **DONE:** The ThemesPlayground paints active TonalPalettes and highlights selected
    tones in the palettes when you have on a ColorScheme color. May extend this 
    to make an interactively configurable tonal setup by pickling tones from
    the `TonalPalette` and sliders to adjust chroma. this could later be used to 
    create a custom `FlexTones` config and get it as part of setup code too. 
  - **DONE:** Playground Cupertino adaptive switches now also follow theme via 
    a custom SwitchListTileAdaptive wrapper. The iOS green switches are an 
    eyesore imo, but the SDK adaptive switch cannot be changed via a theme 
    alone. Needed to make a custom  widget where active thumb,
    explicitly uses switch theme color as thumb color, sigh.


**IN PROGRESS**
  Added the `FlexSubThemesData` properties for using 
  `FlexSubThemes.navigationRailTheme`. It still needd doc comments review plus
   updates and connection setup to FlexColorScheme theme config. The 
   implmentation in ThemesPlayground needs to be updated too.

**TODO** 
* Review and manual testing of all things above.
* Add loading animation to Themes Playground web build. Might be pushed to
  when Flutter SDK supports it out of the box, seemed a bit tedious to do still.


### What is Next?

Curious about what is planned next for FlexColorScheme? Head over
to the TODO section at the end of this page and read more
[here](#planned-updates-and-new-features).

## v4.2.0 - January 24, 2022

* **New:** Updated required Dart SDK to minimum 2.15 that Flutter 2.8.0 uses.  
  To use this release at least Flutter 2.8.0 is required.
* **New:** Added support for opinionated sub-theme for the new Material 3 based
  `NavigationBar`. Flutter version 2.8.0 is the first stable version that 
  includes the new Material 3 design based `NavigationBar`. 
* **Deprecated:** The property `surfaceStyle` has been deprecated. In
  version 4.0.0 it was already recommended to use, the then introduced more
  powerful surface branding properties `surfaceMode` and `blendLevel` instead.
  The `surfaceStyle` property is still available and works as before, but you 
  now get a deprecation warning if it is used. The property and all its related features 
  will be completely removed in version 5.0.


* **New:** Custom `FlexColorScheme` based themes can now also be defined by
  alternatively passing in a `ColorScheme` object to the `colorScheme`
  property in the constructor, as well as in `FlexColorScheme.light` and
  `FlexColorScheme.dark` factories. When used it overrides the `scheme` and 
  `colors` properties in the factories. Same color property in any constructor
  that exist as direct property in the constructors, still have the highest 
  priority and will also override corresponding color properties in passed in 
  `colorScheme`. The capability to make custom FlexColorScheme based themes from
  standard Flutter color schemes is useful if you already have a predefined
  elaborate `ColorScheme` definition. You can now use it directly and still 
  use FlexColorScheme for its surface color branding and easy sub-theming. 
  This capability will also be very useful when Material 3 based `ColorScheme`
  in Flutter SDK arrives in the stable channel. With Material 3, color schemes 
  may be created using new Material 3 design based color tools, e.g. from
  seed color(s) or using dynamic colors extracted from system wallpaper colors.
  With this feature it will then be able to feed those colors directly into 
  FlexColorScheme, and use them as colors to create your `ThemeData`. 


* **Changed:** All properties in all `FlexColorScheme` constructors are now
  optional. The change is none breaking, and uses Material 2 based
  design guide example theme light and dark as defaults for undefined values. 


* **New:** Added a `ColorScheme` color selection option to selected opinionated 
  sub-themes configuration class `FlexSubThemesData`. The sub-themes that 
  support changing their `ColorScheme` based 
  used theme color selection, have one or more properties called
  `nnnSchemeColor` where `nnn` describes the color feature that can be set
  to an alternative `ColorScheme` based color and not just its pre-defined
  `ColorScheme` based color property.
  The color selector is a `SchemeColor` enum property value that is used to 
  select the enum value that corresponds to same named color 
  property value in `theme.colorScheme`. This `SchemeColor` color quick 
  selection option has been added to:
  - Theming `TextField` via `FlexSubThemes.inputDecorationTheme` to select a 
    base color for the border and fill color.
  - `TabBar` sub-theming to select its indicator color, when you want it to be a 
    different color than the color of the `TabBar` icon and text, which are 
    controlled via `FlexTabBarStyle` in the `FlexColorScheme.tabBarStyle` 
    property as before. It gives you an easy option to override the indicator
    color with any of the theme's `colorScheme` colors.
  - To `BottomNavigationBar` via `FlexSubThemes.bottomNavigationBar` to set the 
    preferred color of the icon and label text in the Material 2 based 
    `BottomNavigationBar`, as well as used container background color.
  - `NavigationBar` in `FlexSubThemes.navigationBarTheme` to set the
    preferred `ColorScheme` color of the text, icon in the Material 3 based 
    `NavigationBar`, as well as the pill shaped highlight color separately that
    surrounds the selected icon and its container background color.
  - `ChipThemeData` from `FlexSubThemes.chipTheme` to change the used 
    `ColorScheme` based base color of Chips.  
* The `SchemeColor` properties for the above sub-themes have a default selection 
  that results in same `ColorScheme` color values being used as they had 
  before. The additional configuration options are none breaking. The enum 
  properties to modify the used `ColorScheme` color can be defined in the 
  configuration class `FlexSubThemesData` using its new properties:
  - `inputDecoratorSchemeColor`
  - `chipSchemeColor`
  - `tabBarIndicatorSchemeColor`
  - `bottomNavigationBarUsedColor`
  - `bottomNavigationBarSchemeColor`
  - `bottomNavigationBarBackgroundSchemeColor`
  - `navigationBarIconSchemeColor`
  - `navigationBarTextSchemeColor`
  - `navigationBarHighlightSchemeColor`
  - `navigationBarBackgroundSchemeColor`
  
* Usage examples of the above new configuration possibilities have been added to
  the default example, the so-called developers hot reload playground.
* The ColorScheme color selection in `SchemeColor` includes all colors in 
  `ColorScheme` supported by Flutter 2.8. You may want to avoid using the
  `primaryVariant` and `secondaryVariant` colors if you want to avoid later
  migrations. These variant colors are being deprecated in Flutter SDK, 
  see [#93427](https://github.com/flutter/flutter/pull/93427). 
* A later FlexColorScheme version will add support for the new Material 3
  colors in `ColorScheme` when they land in the stable channel.
* This quick selection of `ColorScheme` based colors as none standard themed
  colors of widget sub-themes, may be extended to a few more sub-themes in 
  future versions. At least if it is seen as a practical and quick way to 
  customize widget sub-theme colors within the constraints of colors in 
  the `theme.colorScheme`. 
* As before you can still apply your own total custom sub-themes to the 
  `ThemeData` created with `FlexColorScheme` by using `copyWith`. 
  FlexColorScheme is a way to easily make fancy and color wise consistent and 
  balanced `ThemeData` objects using convenience shortcut properties and 
  methods. It does not prevent you from further modifying and tuning the 
  produced `ThemeData` with standard Flutter SDK features.


* **Removed:** The `uses-material-design: true` line from library 
  `pubspec.yaml` file was removed. It is not needed since Material icon 
   features are not used by this package.


* **Example 5 - Themes Playground**
  * Fixed onColor for a few colors in the ThemeData color presentation boxes 
    for cases where it might differ from colorScheme onColors. This could happen 
    when disabling FlexColorScheme.
  * Fixed index on _AppBarSettings card.
  * Changed the feature that animate hides not available options based on selections
    to a version that disables them and resets their state while disabled. 
    Plus a few controls are hidden but take up same space.
    Hiding the controls caused the panels to change size, often causing relayout 
    of the masonry grid layout. This was confusing UX, as entire panels might
    move into new places. While the UI hide animations were cool, this keeps
    the panels in same place in the grid, which is less confusing to use.
    Panels can still be closed and it of course causes relayout of the grid too,
    but in that use case it is expected.
  * Changed ColorScheme indicator boxes to use the themed border radius.
  * Added a button to copy theme, and improved the explanations to make the 
    functionality more obvious and accessible. Previously only the entire
    ListTile was the button, this UI with no button was not so clear. Now 
    there is also a button that says COPY. Clicking on the ListTile still 
    works as well.
  * Add and updated app icon resources used by all the example apps.
  * Update to new breaking version of StaggeredGridview 0.6.0. It no longer 
    requires previously used bug work around(s) for a window resize issue that 
    had existed since 2019. For more info on this solved issue, see this
    [article](https://rydmike.com/gridview).
  * Added most new features in version 4.2.0 to the Themes Playground app and 
    its theme code generation.
  

* **Example theme - Copy Playground Theme**
  * Added a new simple template example, that is handy for trying copy-pasted
    theme setup code, generated by the Themes Playground example 5. 
  

* **Documentation:** Reviewed and corrected many API docs. The API docs are 
  very thorough and complete. They usually cover any question you might have and
  more. Added a brief "API Intro and Guide" chapter to the readme.


* **Tests:** Added tests to cover the new features, now total 1123 tests.


## v4.1.1 - November 20, 2021

* **Documentation:** Fixed a broken link in the readme that pub.dev analyser found.

## v4.1.0 - November 20, 2021

* **Fix:** The `defaultRadius` in `FlexSubThemesData` now defaults to null 
  so all sub-themes border radius will default to M3 default border 
  radius per widget. The const default value it had, was a remnant from early 
  dev phase when widgets all defaulted to single shared radius and not M3 
  defaults per widget type. If you explicitly passed in null, you did also in
  previous version get the M3 defaults. Older tests did that, now they expect
  same result when no value is assigned, as it should have been.


* **Examples:** Updated and tuned the examples. Example 5 "Themes Playground" 
  now includes capability to define custom color schemes starting from built-in ones.
  It can also generate the FlexColorScheme setup code needed for any defined 
  viewed theme setup. You can copy/paste a theme's Flutter Dart code,
  from the Themes Playground to your app and use it as its theme. This is a very
  quick and convenient way to try a theme you made and see in the Themes 
  Playground in your own app.


* **Opt in opinionated sub themes minor style changes:**  
   * Added missing themed background color for `SnackBarThemeData` when 
     using opt in opinionated sub themes.
   * Tuned the colored text theme on the sub themes that is applied when 
     using the optional colored text themes. The text styles now better match
     the regular none colored style, 
     and they are a bit more subtle. Text style `caption` got a bit 
     of opacity. M2 designed widgets like `ListTile`, depend on it for 
     making more muted subtitles by default for `ListTile` via the heading level 
     opacity on `caption` text style. The opacity on it is lower though, to 
     retain a bit more contrast on blended surfaces, while still adhering to
     the style intent.
     >Minor details on the opinionated sub themes may still be tuned and 
     changed slightly as a part of improving them and their appeal. For the 
     text theme coloring future version may expose parameter(s) that can be 
     used to adjust the color tint effect on text theme when colored 
     text theme is enabled.
      
   
* Major updates to readme doc, and typo corrections. 

 
* **Tests:**
  * Modified tests to catch the fixed `defaultRadius` issue.
  * Added more tests, now total 1069 tests.

## v4.0.0 - November 13, 2021

* The breaking case is a minor difference in produced style for true
  black mode. Version 4.0.0 is still fully API compatible with version 3.
  Version 4.0.0 does however contain so many new 
  features, that it in itself warrants a new major release bump.


* **Breaking:** In dark mode, the `darkIsTrueBlack` now makes `surface` color
  8% darker instead of 6%. This change was needed to support overlay color
  in dark mode when using `darkIsTrueBlack` when using the new `surfaceMode`
  property. For more information see Flutter SDK
  issue [90353](https://github.com/flutter/flutter/issues/90353).
* **Fix/Breaking**: From the color scheme English descriptions the sentence
  end "." was removed from all description strings. If and when you want one, 
  you can add it as needed.
 
* **New:** Added a more flexible and powerful alpha blending feature for 
  surface and background colors. The new properties in the `FlexColorScheme` 
  factories `light` and `dark` are `surfaceMode`, of type enum `FlexSurfaceMode`
  and integer `blendLevel`. Consider using them instead of previous 
  `surfaceStyle`.
  The surface color blend style `surfaceStyle` is still default, and not yet
  deprecated, but may be so in later versions. It is not really needed anymore,
  but there was no major reason to break things by removing it either.
* **New:** Major new feature; easy sub-theming of Flutter SDK UI widgets.  
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
* **New:** Added `FlexThemeData` static extension on `ThemeData`. 
  * FlexColorScheme Themes can now also be created with the new syntax
  `FlexThemeData.light` and `FlexThemeData.dark`, instead of using 
  `FlexColorScheme.light().toTheme` and `FlexColorScheme.dark().toTheme`. 
  * The `toTheme` method is still available and works as before. It will not
    be deprecated. It is needed when making elaborate custom sub themes beyond
    what is offered when using `FlexColorScheme` based opt-in sub themes. When 
    you make custom sub themes yourself, you often need access to
    the `ColorScheme` that is defined in current `FlexColorScheme()` instance. 
    You can get it with `FlexColorScheme().toScheme`. Then use this 
    this standard `ColorScheme` or any of its colors, in your custom sub theme 
    definitions, that you then add with copyWith to your FlexColorScheme based 
    theme, like `FlexColorScheme().toTheme.copyWith(..."your sub themes and  
    other ThemeData over-rides here")`. 
* **New:** Added `textTheme` and `primaryTextTheme` properties to 
  `FlexColorScheme` to enable easy setup of custom `TextThemes`, without the
   need to add a custom `TextTheme` via a `copyWith`, plus `merge` with the 
   default text theme.
* **New:** Added `FlexColorScheme.dialogBackground` as a background surface 
  color that can be controlled and themed separately. 
* **New:** Added `appBarOpacity` to `FlexColorScheme.light()` and `dark()`.
  With it, you can apply themed opacity to the `AppBar` background color to  
  the selected `FlexAppBarStyle` it is using.
* **New:** On the `FlexColorScheme` factories `light` and `dark`, exposed 
  the `Color` properties `primary`, `primaryVariant`, `secondary`, 
  `sedondaryVariant`, `appBarBackground`, `dialogBackground` and `error`.
  They all default to null, but if provided they can be used as override values
  to factory behaviors defined by `scheme`, `colors`, `appBarStyle`,
  `surfaceMode` and `surfaceStyle` that
  otherwise via the factories define the colors for these properties. If a value
  for one of the new direct color properties is used with the factory, it always
  has precedence over other properties that assign or compute colors for it. 
* **New:** Exposed boolean property `applyElevationOverlayColor`. It has the same
  function as the same property in `ThemeData`. It applies a semi-transparent 
  overlay color on Material surfaces to indicate elevation for dark themes.
  In `FlexColorScheme` it defaults to true. In Flutter `ThemeData.from` it
  also default to true, but in `ThemeData` it defaults to false.
  The property is just available for convenience, so you can avoid a `copyWith`
  if you wish to turn it off. It is not necessarily needed or even desired when 
  using strong alpha blends on surfaces in dark mode, to use an elevation 
  overlay color.
  
* **New:** All `FlexSchemeData` objects in `FlexColor` are exposed as static 
  const objects, making them easy to pick and reuse as const objects 
  individually in custom color scheme lists, or as input to the `colors` 
  property. Previously only the individual color value definitions were exposed.
* **New:** Added convenience extension `.blendAlpha()` on `Color` 
  in `FlexColorExtensions`.

* **New:** The `FlexThemeModeSwitch` got a bool property `hasTitle`, if set
    to `false` it removes the title entirely.
* **New:** The `FlexThemeModeSwitch` got a `buttonOrder` property using enum
  `FlexThemeModeButtonOrder` that you can use to define the order of its
  light, system and dark theme mode buttons, in all possible combinations.

* **New:** Added edgeToEdge support to
  `FlexColorScheme.themedSystemNavigationBar`. This brings the previously 
   experimental support for transparent system navigation bar in Android 
   into the supported fold in FlexColorScheme. Its functionality 
   requires min Android SDK level 29, but other than that it works without
   Android setup shenanigans. No added APIs, the API for it already existed
   in previous version of FlexColorScheme, using it did however require 
   special Android build configuration setup, this is no longer required.


* **Change:** The `FlexColor.schemesList` is now a `const` for improved
  efficiency.


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
  

* **Documentation:** 
  * The new main example is a complete quick start guide that doubles as 
    "developers" hot reload based playground template. It has comments 
    explaining what is going on.
    If you skip reading the readme docs and tutorial, the example may help
    to kick-start using FlexColorScheme and all its features. It shows most 
    of the features in last tutorial example 5, but without any interactive UI.
    You are the UI and can edit prop values and use hot-reload to see changes.
  * All examples now use the new `FlexThemeData` extension syntax to create the
    `ThemeData` and `surfaceMode` to define the alpha blended surfaces.
  * Examples 2 to 5 also use the in Flutter 2.5 new skeleton architecture with
    a ChangeNotifier based controller, AnimatedBuilder to listen to it and
    an abstract service to get and persist the theme settings, with a concrete
    in-memory implementation, plus the implementations to persist the theme.
    * Examples 2 to 4 use the Hive implementation. 
    * Example 5 uses the SharedPreferences implementation

* **Tests:** 
  * Added tests for the new features, total 1066 tests. 
  * Coverage 99%, will improve them more later.
   
## v4.0.0-dev.1 - November 13, 2021

* See change log for stable 4.0.0, it was the same for the dev release.
  the text is just not repeated here anymore.
   
## v3.0.1 - July 1, 2021

* **Fix:** The internal order of swapping primary and secondary colors and reducing 
  used colors in static function `FlexSchemeColor.effective(FlexSchemeColor colors,
  int usedColors, {bool swapColors = false})` matters for the intended result when
  used together in the same call. The function now swaps primary and secondary colors,
  before reducing the used colors.
* **Tests:** Added tests for above fix that captures the issue and fails
  in version 3.0.0. Total 741 tests, coverage 99.75%.
* Documentation and typo fixes.

## v3.0.0 - June 25, 2021

* **Breaking:** The color `accentColor` is being deprecated in Flutter SDK `ThemeData` starting
  from version v2.3.0-0.1.pre. For more info see 
  [Flutter docs here.](https://flutter.dev/docs/release/breaking-changes/theme-data-accent-properties)  
  
  Usage of `accentColor` in **FlexColorScheme** is removed to support this
  transition. The property is deprecated in FlexColorScheme, but it is still present. Its
  usage does however no longer have any impact on produced themes. 
  This is a potential breaking change.
  The probability that you might have used it as a property in your 
  FlexColorScheme based theme is low. It was before set to primary color
  in FlexColorScheme, as a way to make the highlight color of outlines and underlines on
  text field boxes primary colored in dark theme mode. In default Flutter dark theme they
  used accentColor that followed `colorScheme.secondary` color. The old `accentColor` was 
  previously not used for anything else in themes anymore when using FlexColorScheme. 
  The property is now going away totally in Flutter SDK. 
  The default ThemeData in Flutter SDK in dark mode now creates a
  theme for outline and underline indicators on input fields that are based on primary color, 
  just like **FlexColorScheme** always did. The resulting default dark mode style on text 
  fields thus remains unchanged in FlexColorScheme even with this definition removed.  
  
  If you had used `accentColor` in FlexColorScheme as an unusual way to define a different 
  text field outline or underline color in dark mode than primary color. In that case 
  you will need to recreate this style via a text field decoration theme.
  
  
* **New:** The `FlexColorScheme.dark` and `FlexColorScheme.light` factories have a new 
  property called `swapColors`. If true, this will swap `primary` and `primaryVariant`
  colors with their secondary counter-parts.
  
  This flag can be set to true if you want to make a theme where your primary and secondary 
  colors are swapped compared to their definition. It is useful if you want to quickly 
  swap primary and secondary colors when using the pre-defined color 
  schemes or with computed dark schemes from light schemes. It doubles the
  variation possibilities of themes based on the pre-defined color schemes. 
  
  If you are explicitly defining all you light or dark scheme colors, you can of course define
  them in desired order. This feature will still swap whatever 
  colors you defined for primary and secondary when set to true. You can thus also 
  use this feature as an easy end-user modifiable theme option, if you like
  to offer the capability to toggle the primary and secondary theme colors the 
  other way around.
  
  
* **New:** The static function `FlexSchemeColor.effective(FlexSchemeColor colors,
  int usedColors, {bool swapColors = false})` is used to implement the above
  `swapColors` feature. It also exposes the logic behind the FlexColorScheme 
  dark and light theme `usedColors` property. This static method is helpful if 
  you need to compute effective built-in theme colors externally to FlexColorScheme 
  to present the active theme, based on these settings. This is used by example 5
  to change the colors on the theme mode switch when the swap color settings
  is toggled. The `usedColors` property is not shown in any bundled
  example, but it can be used the same way.
  

* **New color schemes:** Added four new built-in color schemes.  
  * **Bahama and trinidad** - Bahama blue and trinidad orange colored theme.
    Use enum value `FlexScheme.bahamaBlue` for easy access to it.
  * **Mallard and valencia** - Mallard green and Valencia pink colored theme.
    Use enum value `FlexScheme.mallardGreen` for easy access to it.
  * **Espresso and crema** - Espresso dark brown and crema colored theme.
    Use enum value `FlexScheme.espresso` for easy access to it.
  * **Outer space stage** - Outer space dark blue-grey and stage red theme.
    Use enum value `FlexScheme.outerSpace` for easy access to it.

* **Tests:** Added tests for the new features and removed test related to
  `accentColor`. Total 736 tests, coverage 99.75%.


* Inspired by **MaterialYou** at GoogleIO 2021, I recently hooked up **FlexColorScheme**
  with a Google Dart library that extracts prominent colors from images. Then fed these
  colors to FlexColorScheme to make themes from them. The above new color schemes in
  release 3.0.0 came from these image based theme experiments. You can see examples
  of **FlexColorScheme** making color schemes and themes from images in my Tweets about it.
  This was a first [quick test](https://twitter.com/RydMike/status/1399139552200114179?s=20)
  of the idea, later I added some more features to it, [here](https://twitter.com/RydMike/status/1399301081939820545?s=20) and [here](https://twitter.com/RydMike/status/1399933068614504451?s=20). These
  quick tests show that FlexColorScheme is very versatile. It already supports
  Android 12 like image color branded themes, by wiring extracted image
  colors, to colors in a FlexColorScheme based theme.

## v2.1.1 - March 30, 2021

* **Change:** Made the VoidCallback `onSelect` in `FlexThemeModeOptionButton` nullable.
  The optional callback allows for the button to be used for example as a trailing
  widget in a ListTile. Keep it null to not have any callback, nor hover or Ink of its own, and use
  the select event of the parent instead. When it is used as standalone button you
  normally want to use this callback, but not if you want the parent to handle it, that use case was
  not allowed with previous version. 

## v2.1.0 - March 22, 2021

* **Fix:** Toggling `FlexColorScheme(transparentStatusBar)` from true to false, did not restore the
  Android default status bar scrim, unless the app was completely rebuilt. This has been fixed.
* **Fix:** When using `FlexColorScheme.themedSystemNavigationBar(useDivider)` in an `AnnotatedRegion`, toggling
  `useDivider` from true to false, did not remove the system navigation bar divider again, unless the 
  app was completely rebuilt. This has been fixed, see API docs for more info. 
* **Feature:** The `FlexColorScheme.themedSystemNavigationBar` for styling the system navigation bar got a
  new convenience property `systemNavBarStyle` that takes a `FlexSystemNavBarStyle` enum with values:
  * `system`:  For default white system nav bar in light theme and black in dark theme mode.
  * `surface`: The system navigation bar will be the same color as active theme `colorScheme.surface` color. 
    If your FlexColorScheme definition is set to use primary branded surface and background colors, the 
    same primary color blend that the surface color has received will be used.
  * `background`: The system navigation bar will be the same color as active theme `colorScheme.background` color.
    If your FlexColorScheme definition is set to use primary branded surface and background colors, the
    same primary color blend that the background color has received will be used.
  * `scaffoldBackground`: The system navigation bar will be the same color as active theme `scaffoldBackground` color.
    If your FlexColorScheme definition is set to use primary branded surface and background colors, the
    same primary color blend that the scaffoldBackground color has received will be used.
  * `transparent`: An experimental feature. The goal is to make the system navigation bar fully transparent, 
    showing the background, while navigation buttons float over the background. This feature only works if it is 
    also configured in the Android embedder and on SDK 30 or higher.
    More information in this example: https://github.com/rydmike/sysnavbar
* **Examples:** Added status bar scrim, system navigation bar divider, 
  and navigation bar style toggles to example 5.
  These only work on Android builds and do not have any functionality on the live Web builds.
* **Tests:** Added tests for the new features. Total 690 tests, coverage 99.75%.

## v2.0.0 - March 15, 2021

* **First** stable release of FlexColorScheme with sound null safety.
* Includes the changes from [2.0.0-nullsafety.1] and [2.0.0-nullsafety.2].
* **Breaking:** The by default enabled divider for `FlexColorScheme.themedSystemNavigationBar` has been 
  revised to be disabled by default. To use a divider on the top of the system navigation bar on Android, 
  you have to enabled it manually. This is more in line with expected default behaviour. 
  
## v2.0.0-nullsafety.2 - March 15, 2021

* **Breaking** Minor change to the none default `tooltipsMatchBackground: true` border style, it now uses
  the theme divider color as its default outline color.
* **Breaking:** As stated earlier in the documentation, as a planned change for version 2.0.0, the sub theme for
  `FloatingActionButtonThemeData` was removed. It is thus now null, just as in a default Flutter ThemeData.
  It still produces the same theme as before, the ThemeData definition was just no longer needed to do so.
* **Features:** The static helper `FlexColorScheme.themedSystemNavigationBar` received three new properties
  `noAppBar`, `invertStatusIcons` and `systemNavigationBarDividerColor`. The old property
  `nullContextBackground` was deprecated and replaced with `systemNavigationBarColor`. Example 5
  has been updated to show how and when these new features can be used.
* **Migrated** AppBar theming to use the implementation introduced in Flutter 2.0.0 instead of using
  its own custom implementation for the "white" app bar theme.
* **Tests:** Number of tests increased from 639 to 661. Coverage 99.78%.  
* **Documentation:** Added thumbnails to **Appendix A**. This pub.dev version is also to test the
  thumbnails work and how they look on pub.dev before stable 2.0.0 release.
     

## v2.0.0-nullsafety.1 - February 4, 2021

* **First** version with null-safety.
* **Breaking:** Removed the in version 1.3.0 deprecated `FlexSchemeSurfaceColors.themeSurface`, use
  `FlexSchemeSurfaceColors.surfaceStyle` instead.
* **Tests:** Number of tests were reduced from 723 to 639, when all null related tests were removed.  

## v1.4.1 - January 31, 2021

* **New color schemes:** Added four new built-in color schemes.
  * **Barossa** - Barossa red and cardin green theme.
    Use enum value `FlexScheme.barossa` for easy access to it.
  * **Shark and orange** - Shark grey and orange ecstasy theme.
    Use enum value `FlexScheme.shark` for easy access to it.
  * **Big stone tulip** - Big stone blue and tulip tree yellow theme.
    Use enum value `FlexScheme.bigStone` for easy access to it.
  * **Damask and lunar** - Damask red and lunar green theme.
    Use enum value `FlexScheme.damask` for easy access to it.
    
* **Improved:** Semantics for the ThemeMode Widget buttons.
* **Tests:** FlexThemeModeSwitch widget tests, makes and checks for system mode changes. 
* **Tests:** More tests, totally 723 tests, codecov is now > 99.5%.
* **CI/CD:** Added GitHub actions to automate build and to publish the examples on the Web on a new release.  
* **Examples:** Minor changes to the examples. Modified to not need the `late` keyword when they are converted 
  to null safe versions.
* **Documentation:**
  * Added the new color schemes to the documentation.
  * Minor typo corrections. 
  
## v1.4.0 - January 18, 2021

* **Feature:** Added convenience property `scheme` to FlexColorScheme factories light and dark. This a shortcut for
  using the built-in color schemes. The `colors` property can still be used as before. The `.light` and
  `.dark` factories no longer have any required properties. If `scheme` is not provided it defaults 
  to `FlexScheme.material` and if both `scheme` and `colors` are provided, the scheme provided via `colors` prevail.
* **Examples:** Updated the simple example 1 to use the new `scheme` property, as in 
  `theme: FlexColorScheme.light(scheme: FlexScheme.mandyRed).toTheme`.  
* **Feature:** Added experimental support for transparent system navigation bar for Android for SDK >= 30 (Android 11).
  The support is added via new `opacity` property in `FlexColorScheme.themedSystemNavigationBar`.    
  
  A separate example that builds
  on example 5, shows and explains how and when transparent system navigation bar can be used in Android. It also shows
  how to make it look nice when using primary color branded background color applied to the system 
  navigation bar in Android, that is used when transparency is not supported. While if supported, your app otherwise 
  uses a transparent system navigation. Please see this separate small stand-alone example Android project
  [**sysnavbar** on GitHub](https://github.com/rydmike/sysnavbar) for more information.    
* **Tests:** Added more tests, now 689 tests. All color values used are now also tested, any modification to them is considered
  a breaking change. A bit more tests would still be nice, for the ThemeModeSwitch Widget at least.
  Total test coverage > 98%, it will do for now.
* **Documentation:** 
  * Changed example one and the intro, to use the new simpler `scheme` property when using built-in schemes.
  * Added a section that lists which sub-themes, and which of their properties, are NOT null when creating a theme data 
    object with FlexColorScheme.toTheme.  
  * Removed the "back to contents" link after each chapter. It was nice and worked fine on GitHub, but for some reason
    it did not on pub.dev.
  * Tried finding and adding comments for the 3 missing API comments needed to reach 100% API
    documentation comments, not sure if it succeeded. I will see when the update is published.

## v1.3.0 - January 7, 2021

* Marked `FlexSchemeSurfaceColors.themeSurface` as deprecated in favor of the correctly named
  `FlexSchemeSurfaceColors.surfaceStyle` version. The older `themeSurface` will be removed when
  null safe Version 2.0.0 is officially released as the main version.
* Added `Diagnosticable` mixin to classes `FlexSchemeOnColors`, `FlexSchemeSurfaceColors` and `FlexColorScheme`,
  that all also received proper identity overrides and `copyWith` methods.
* Improved internal null safe behavior, with fall-backs values in some classes and helper functions. 
  It might make migration to null-safety easier.
* Added 389 tests. Coverage is 89% based on Codecov report. Will add more tests later, enough for now.
* The tests will make the migration to null-safety easier by providing some quality control checks.
* Added GitHub actions to run all the tests and automated test coverage analysis with Codecov.
* Documentation improvements and API doc fixes.  
  In previous version API doc analysis says
  "441 out of 444 API elements (99.3 %) have documentation comments.". I have not been able to find any missing ones.
  The result from this update will only be seen after it has been uploaded, but I doubt it will change much. If
  somebody happens to find the missing doc comments let my know, the IDE analyser does not find them either.
    
## v1.2.0 - January 4, 2021

* Added four new built-in color schemes. 
  * **Amber blue** - Amber blaze and blue color theme, based on Material amber and blue accent colors.
    Use enum value `FlexScheme.amber` for easy access to it. 
  * **Vesuvius burned** - Vesuvius burned orange and eden green theme.
    Use enum value `FlexScheme.vesuviusBurn` for easy access to it.
  * **Deep purple** - Deep purple daisy bush theme, based on Material deepPurple and lightBlueAccent colors.
    Use enum value `FlexScheme.deepPurple` for easy access to it.
  * **Ebony clay** - Ebony clay dark blue-grey and watercourse green colored theme.
    Use enum value `FlexScheme.ebonyClay` for easy access to it.
  
* Added a style option for the tab bar. The `FlexColorScheme` created tab bar theme now **defaults** to a 
  `TabBarTheme` that fits its created `AppBarTheme`, also works via the factory app bar style options. There is also
  an optional style that makes the tab bar theme suitable for surface and background colors. This was the
  default style before. The change to this default style is a **fix** to make the default `TabBarTheme` one that
  fits on app bar's instead, which is expected default behavior in Flutter and Material design.
  The style is set via the `FlexColorScheme` property `tabBarStyle` using enum values `FlexTabBarStyle.forAppBar` 
  (default) and `FlexTabBarStyle.forBackground`.
  
* The themed `AppBar` and `BottomAppBar` elevations still default to 0. For convenience, the themed values 
  can now both be modified directly via the `FlexColorScheme` properties `appBarElevation` and `bottomAppBarElevation`, 
  without need to change these frequently modified values with an extra `copyWith` to get them re-themed as desired.
  When using the recommended `FlexColorScheme.light` and `FlexColorScheme.dark` factories, `appBarElevation` 
  defaults to '0', if not defined and `bottomAppBarElevation` defaults to `appBarElevation`, if not defined.
  When using the default constructor (the factories are recommended), they both default to '0'.

**Example updates**

* All examples: The widget showcase now show the resulting themed tab bar on two different backgrounds, one on the 
  app bar color and one on background color. This can guide you in which tab bar style is right for your use case.
* Example 4 and 5: The sub-page now has a demo tab bar in the app bar, and a demo bottom navigation bar.  
* Example 5: Now includes a toggle that can be used to select the tab bar theme style.
* Example 5: Now includes a slider to modify the themed app bar elevation.  
* Example 5: The Roboto font that is always used by the examples regardless of platform, is now also
  used when you create the theme from the scheme with the `ThemeData.from(colorScheme)`. It looked
  a bit odd when it changed to platform default font on Desktop and Web versions, while
  `FlexColorScheme.toTheme` used Roboto. This was modified so that the resulting themes use the 
  same font and are thus more comparable.

## v1.1.1 - December 31, 2020

* Updated example 5 to include UI that can be used to vary the computed dark themes white blend percentage level.
  This was added to better demonstrate the `toDark` feature.
* Added a `defaultError` modifier that enables the built-in schemes to use the Material design guide's default dark 
  error color when using the `toDark` method to compute a dark scheme from a light scheme.
  The `toDark` method can be used without the `defaultError` scheme modifier, but then the 
  error color also changes with the other computed dark scheme colors when using `toDark` method 
  and the level adjustment. This is not necessarily the desired behavior. The fix enables the alternative more often
  desired behavior and ensures that the dark error color just uses the default value. For custom schemes that do not 
  specify a custom error color for their light scheme and thus default to the Material Guide's standard error color, 
  the fix is not needed. Example 5 demonstrates the use case of `defaultError` as well.
* Major documentation review and updates.

## v1.1.0 - December 29, 2020

* Added API to make a matching dark scheme from a light scheme. See
  [FlexSchemeColor.toDark](https://pub.dev/documentation/flex_color_scheme/latest/flex_color_scheme/FlexSchemeColor/toDark.html).
* Added a [showSystemMode](https://pub.dev/documentation/flex_color_scheme/latest/flex_color_scheme/FlexThemeModeSwitch/showSystemMode.html)
  property to [FlexThemeModeSwitch](https://pub.dev/documentation/flex_color_scheme/latest/flex_color_scheme/FlexThemeModeSwitch-class.html).
  It defaults to true. Set it to `false`, to exclude the system setting based theme mode option.
* Added static method [FlexColorScheme.comfortablePlatformDensity](https://pub.dev/documentation/flex_color_scheme/latest/flex_color_scheme/FlexColorScheme/comfortablePlatformDensity.html).
* Added static method [FlexColorScheme.themedSystemNavigationBar](https://pub.dev/documentation/flex_color_scheme/latest/flex_color_scheme/FlexColorScheme/themedSystemNavigationBar.html) that can be used to assist with theming the system navigation bar via an annotated region. See updated example 5, for a demo on how to use it.
* Added API property [FlexColorScheme.transparentStatusBar](https://pub.dev/documentation/flex_color_scheme/latest/flex_color_scheme/FlexColorScheme/transparentStatusBar.html) to allow opting out of the one-toned AppBar in Android. 
* Updated the examples. 
  - All examples now use the new platform adaptive `FlexColorScheme.comfortablePlatformDensity` as their `visualDensity`
    setting. The Flutter default `compact` mode for desktop and web goes a bit overboard in its compactness. This 
    optional setting presents an alternative where `comfortable` density is used on desktops and Web, while devices keep
    their standard visual density. Just omit the setting if you prefer Flutter's super compact Web and Desktop widgets.
  - Example 3 excludes the system theme mode option, just to show this new feature of the switch.  
  - Example 4 includes all built-in schemes, plus 3 custom ones, including one where the dark scheme is made 
    with the `toDark` method. Example 4 also includes a sub-page that can be opened to see the same theme on a new page.    
  - Example 5 now includes an option make all the dark mode schemes with the `toDark` option, so it can be 
    toggled and compared to the hand-tuned versions. The same custom color scheme as in example 4 are also included.
    Example 5 also has the same sub-page as example 4. Example 5 now also show how to solve the issue that the system
    navigation bar does not get color scheme and theme mode appropriate style in Android when we 
    change the theme. This improvement is done with an `AnnotatedRegion` and the new static helper
    method `FlexColorScheme.themedSystemNavigationBar`.
* Documentation updates and typo corrections.

## v1.0.0 - December 21, 2020

* Version 1.0.0 released
* Documentation layout updates and typo corrections. 
  
## v1.0.0-dev.2 - December 21, 2020

* Made planned API name changes, SchemeOnColors -> FlexSchemeOnColors and 
  SchemeSurfaceColors -> FlexSchemeSurfaceColors. These are lower level APIs that are 
  only used when making custom on and surface colors.
  Changed ThemeModeOptionButton -> FlexThemeModeOptionButton, this is a lower
  level API that can be used when making more advanced custom theme selection 
  controls that are based on the same button that the `FlexThemeModeSwitch` uses.     
* Exposed planned configuration APIs for the FlexThemeModeSwitch and FlexThemeModeOptionButton.
* Removed the constants that had no function in the public interface from the API.
* Documentation updates and corrections.
* Removed legacy usage of deprecated ThemeData properties textSelectionColor, cursorColor
  and textSelectionHandleColor. They are no longer needed even for stable channel, they were
  useful earlier but not anymore, using only TextSelectionThemeData is 
  enough in the latest stable version.     

## v1.0.0-dev.1 - December 17, 2020

* First development pre-release on pub.dev.

---

# Known General Issues
- The color branding is not applied to Widgets using elevated `Material` of 
  type `canvas` in Flutter when using primary colored surface and backgrounds, 
  and the theme's `applyElevationOverlayColor: true` is true. This is caused 
  by this Flutter [SDK issue and limitation](https://github.com/flutter/flutter/issues/90353).
  Version 4.0.0 addresses this limitation by introducing more color blend
  modes that keep the colors equal in order to not be affected by this
  limitation. If you are using heavy color branding in dark theme mode, the 
  overlay color is not really necessary. Material 3 (You) is, based on some code
  comments seen on the NavigationBar, maybe leaning this way too.

---

# Planned Updates and New Features

These are the topics I currently have on the TODO list for this package. 
Have a new suggestion and idea? Feel free to open a 
[suggestion or issue](https://github.com/rydmike/flex_color_scheme/issues) 
in the repo. There is also a project where active and recent TODOs are
tracked [here](https://github.com/rydmike/flex_color_scheme/projects/1).

## TODO

- Add a sub-theme for the `NavigationRail`.
- Consider adding `SchemeColor` color selection to buttons and toggle buttons.
- Version 5 will add support for Material 3 and will be released when a required
  level of M3 features have reached the Flutter stable channel. At minimum, it 
  will probably be visually breaking to some extent when it starts using 
  SDK implementation of M3 design guide. Simply because its current own 
  M3 "like" M2 based implementation of existing theming and text capabilities
  cannot always match the M3 designs, especially on color usage.
- Version 5 will be breaking, in it, we may consider moving AppBar background 
  to sub-theme and use the full `SchemeColor` based color selection. This would
  be another breaking change in V5. It might be possible to also add it
  as a none breaking new feature.
- For version 5 also consider adding `SchemeColor` selection to TabBar, it might
  be possible to implement is an additional none-breaking feature.

## DONE

- Version 5.0.0 Added `SchemeColor` color selection to 
  the Floating Action Button sub-theme.
- Version 4.2.0 support making themes from standard ColorScheme. More 
  customization of sub-themes. Support for M3 NavigationBar and sub-theming it,
  and a default that matches FlexColorScheme styles.
- Version 4.0.0 Docs with quick start example first. 
- Version 4.0.0 Added a more complex example that also persists theme.
- Version 4.0.0 Added API offering more flexibility and customization 
  capabilities to the surface color branding.
- Version 3.0.0 Deprecated `accentColor`. Swap primary and secondary colors 
  feature added. Added 4 new color schemes.
- Version 2.0.0 Release official null-safe version, when nullsafety is
  available in Flutter stable channel.
- Version 2.0.0-nullsafety.2: Minor new APIs and features added. Example 5 updated.
- Since [#71184](https://github.com/flutter/flutter/pull/71184) landed in 
  Flutter 2.0.0. The past custom "white" 
  AppBarTheme implementation was as planned changed to the new one that is 
  supported by the SDK.  
- Version 2.0.0-nullsafety.1 released
- Version 1.4.1 Added automated build and publish pipes for the Web examples!
- Version 1.4.1 More tests, tests are now considered sufficient for current features. 
- Version 1.4.0: Increased unit and widget test to 689 tests. All color 
  definitions are now also tested to ensure they will not be changed by 
  any accidental edit. Test coverage is higher than 95%, certainly sufficient
  for this type of package, but there are still some areas that could and 
  will be improved.
- Version 1.3.0: Added 195 unit and widgets tests, mostly unit tests.
- API to assist with themed annotated region for system navigation bar theming.
- API to opt-out from one-toned AppBar and return it to Android's default two-toned.
- Add API that allows us to use an additional extra color definition for
  ThemeData.accentColor to easily make themes
  with custom input border color in dark-mode.
- Add API the can create the dark scheme based on a light scheme's colors.
- Release version 1.0.0 on pub.dev.
- Review and correct documentation mistakes and typos, first pass anyway.
- Review and update the API.
- Publish live Web versions of the five examples.
- Complete the documentation.
- Release first version 1.0.0-dev.1 publicly on GitHub and pub.dev.

## MAYBE

The maybe issues below were on the TODO agenda earlier, however it looks a 
better alternative going forward is to replace them with the Material 3 design
based color utilities called 
[material_color_utilities](https://pub.dev/packages/material_color_utilities)
that the Flutter SDK master channel also depends on.
While I don't like adding a none SDK library to the package, if Flutter SDK
uses it as well, then why not.

- Add a property option to use actual Material color shades when a Material
  color is selected as primary color, for its light/dark shade.

- For color swatch calculations, find and use the color algorithm Google uses on its
  Material colors site [here](https://material.io/design/color/the-color-system.html#tools-for-picking-colors) and [here](https://material.io/resources/color/#!/?view.left=0&view.right=0&primary.color=582aed&secondary.color=00B0FF).
- The algorithms for them are actually a bit different. The second link also
  seems to imply that ColorScheme's should have primary and secondary colors,
  with light and dark variants. Instead of using just one variant color like
  current `ColorScheme` class in Flutter. Maybe this is a coming change
  with Material 3 (You) or perhaps an older design? Status currently unknown.

  - Starting points for the Dart Material color swatch algorithm could be ports
    of [this](https://stackoverflow.com/questions/32942503/material-design-color-palette)
    and/or [this](https://github.com/Hammwerk/material-color-palette)
  - Wait and see if Google might make their Material color swatch algorithm
    available in Dart/Flutter with MaterialYou.
  - Interesting and simpler [Ant design](https://2x.ant.design/docs/spec/colors) color swatches.
  - Color palette [tools](https://onextrapixel.com/best-tools-generate-color-palettes/) as info.


## OUT OF SCOPE

### Serialization of FlexColorScheme  
  
Including built-in serialization of FlexColorScheme, and its key classes has 
been suggested. I consider `FlexColorScheme` to be functionally on a level 
similar to `ThemeData` and `ColorScheme`. Therefore, it should not cover 
serialization of itself. Serialization have to deal with a lot of potential 
failure points that I think should not have to be a concern in this type of 
component. I am not planning to add it.
  
My recommendation for saving the state of a `FlexColorScheme` is to include 
values for its settings that you use in your implementation in other models 
in your application, like an "AppSettings" model or similar.

You probably serialize and store such data already, perhaps with shared 
preferences, hive, get_storage or some other solution. Include the values 
you need for your `FlexColorScheme` implementation in your stored settings
and then use those values to restore your `FlexColorScheme` configuration and 
theme. This way, your implementation also remain in control of what it needs 
to store and restore. 
  
From version 4.0.0 a simple approach using the architecture introduced via the
Flutter "skeleton" template in Flutter version 2.5 was used together with 
Shared Preferences and Hive to persist and load FlexColorScheme on start.
This is just one example, other implementations together with Riverpod, Provider, 
Flutter Bloc, GetX etc., and completely different local persistence packages 
work well too. 
