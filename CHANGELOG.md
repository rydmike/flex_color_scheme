# Changelog

All notable changes to the **FlexColorScheme** (FCS) package are documented here.

## 6.0.0-dev.1

**Aug 27, 2022**

This dev release is for Flutter *beta 3.3.0-0.5.pre*, it will be released when next Flutter 
stable version after 3.0 comes out. 

If you experiment with this dev release and want to use the Theme Playground, then please build
bundled example 5 for macOS, Windows or Linux desktop. Don't use the 5.1.0 live web based version.
While it will work, to copy-paste code from it too, it is not broken. It will however not show you 
the exact same style in all cases that you actually get when you use it with this release.

Due to a number of known and below documented Flutter SDK issues when using `useMaterial3` set to
`true`, we cannot yet recommend using the option in production. Use it only if you are willing to
accept the still incomplete Material 3 implementation in Flutter and the issues. If you
keep `useMaterial3` set to `false`, and use FCS opinionated component themes, you can create a 
theme that is visually fairly similar to M3, but still using M2 `ThemeData` mode to avoid the 
issues.

**BREAKING**

* This **FlexColorScheme** version no longer directly depends on package
  [Material Color Utilities package](https://pub.dev/packages/material_color_utilities), which 
  is also used by Flutter SDK. Instead, it uses package 
  [FlexSeedScheme](https://pub.dev/packages/flex_seed_scheme) that depends on it.
  As a part of this change classes `FlexTones`, `FlexTonalPalette` and `FlexCorePalette` where
  moved into the package **FlexSeedScheme**. FlexColorScheme still exports these classes. If you
  were using them directly before, you can still do so without adding the FlexSeedScheme package.
  
* In **FlexSeedScheme**, `FlexTones` contains a minor breaking change to make the API cleaner. 
  The `FlexTones.light` and `FlexTones.dark` no longer produce the config for the Material 3 tone 
  and chroma setup. They no longer lock the chroma values to the default values for M3, but use
  null in their configs for their chroma values. Resulting in that chroma from key colors will be 
  used, as long as they are over set minimum values. 
  These named constructors then provide a cleaner starting API for
  defining additional configurations, by not forcing `null` to be passed to use chroma value in 
  key colors. To get the Material 3 configuration, use the factory `FlexTones.material` instead of 
  `FlexTones.light` and `FlexTones.light`. It as before produces the correct Material 3 
  configuration, by defining `secondaryChroma: 16` and `tertiaryChroma: 24` using `FlexTones.light`
  and `FlexTones.dark` to return the correct Material 3 matching `FlexTones` configuration as
  before. This change was introduced to prepare for extracting `FlexTones` and `FlexSeedScheme` to
  their own package that will provide a `fromFlexSeeds` extension on `ColorScheme`. It is unlikely
  to impact any normal usage of FlexColorScheme, but it is still a breaking change.

* In **FlexSeedScheme** `FlexCorePalette.fromSeeds` properties `secondaryChroma` and 
  `tertiaryChroma` now default to null instead of previous M3 palette default generating values 
  16 and 24 respectively. Set them to values 16 and 24 to create same tonal palettes as 
  Material Color Utilities `CorePalette` and previous versions of `FlexCorePalette`.
* 
* To allow for greater flexibility and addition of tonal palette tones 5 (custom for FCS) and 98
  (Google Material 3 Web theme builder app includes tone 98 to, but not Flutter SDK), 
 `FlexCorePalette` no longer extends `CorePalette`, it is a modified re-implementation.

* In **FlexSeedScheme** the `FlexTonalPalette` method `asList` and constructor `fromList`, now 
  include the values of the error color in produced asList, and as required values in fromList.

**NEW**

* In **FlexSeedScheme**, added customization possibility of `error` tonal palette to the default 
  `FlexTonalPalette` constructor.

* In **FlexSeedScheme**, added two new `FlexTones`:
  1. `FlexTones.ultraContrast` with even more contrast that `highContrast`.
  2. `FlexTones.jolly` for a seeded `ColorScheme` with more poppy and jolly seed colors.

* In **FlexSeedScheme**, added `SeedColorScheme.fromSeeds(...)` that can be used to create a 
  seeded `ColorScheme` using multiple seed colors and `FlexTones` configuration.

* In **FlexSeedScheme**, added `FlexTonalPalette` a re-implementation of Material Color Utilities
  `TonalPalette`, with addition of tonal palette tones 5 and 98. The tone 98 also exists in the
  [Web Material Theme Builder app](https://m3.material.io/theme-builder#/custom), but not in
  Flutter or [Material Color Utilities package](https://pub.dev/packages/material_color_utilities).
  Tone 5 is custom addition for `FlexTones` and `FlexColorScheme`.

* Added `appBarCenterTitle` property to `FlexSubThemesData` configuration. It works the
  same way as `centerTitle` in `AppBar` and its theme. The property is not available in the
  Themes Playground app, only via the API. We recommend keeping it null to use platform
  adaptive default behavior, but offer it as convenience property for those that like to use
  same centering style regardless of used platform.

* Added two new properties to `FlexSubThemes.elevatedButtonTheme`.
  * Boolean `useMaterial3`, defaults to false.
  * `onBaseSchemeColor`, defaults to null `SchemeColor?`.

  When `useMaterial3` is `false`, the `elevatedButtonTheme.baseSchemeColor` is used as background
  color as before, and the new property `elevatedButtonTheme.onBaseSchemeColor` is used as
  foreground color. However, when `useMaterial3` is `true`, their foreground and background
  color roles are reversed, and `baseSchemeColor` becomes its foreground color and the
  `onBaseSchemeColor` its background color.

* Added `elevatedButtonSecondarySchemeColor` property of type `SchemeColor?` to
  `FlexSubThemesData`. Use it to control secondary color of the `ElevatedButton` in its
  sub-themes. FCS applies this color to `FlexSubThemes.elevatedButtonTheme.onBaseSchemeColor`.
  If `useMaterial3` is false, it is the foreground color. If `useMaterial3` is true, it is the
  background color. Material 3 and 2 have a completely different default elevated button styles.
  The Material 2 elevated button is color wise, like the M3 filled button, but with elevation.

* Added two new properties to `FlexSubThemes.outlinedButtonTheme`.
  * Boolean `useMaterial3`, defaults to false.
  * `outlineSchemeColor`, defaults to null `SchemeColor?`.
    When `useMaterial3` is `false`, the `outlineSchemeColor` defaults to `baseSchemeColor`.
    When `useMaterial3` is `true`, the `outlineSchemeColor` defaults to `SchemeColor.outline`.

**REMOVED EARLIER DEPRECATED MEMBERS**

Removed in versions 4 and 5 deprecated members as follows:

* *FlexSubThemesData:*  
  `inputDecorationRadius`, `bottomNavigationBarSchemeColor`, 
  `navigationBarIsStyled`, `navigationBarTextSchemeColor`, `navigationBarMutedUnselectedText`,
  `navigationBarIconSchemeColor`, `navigationBarHighlightSchemeColor`
* *FlexColorScheme:*  
  `primaryVariant`, `secondaryVariant`, `useSubThemes`, `m3TextTheme`
* *FlexThemeData:*  
  `primaryVariant`, `secondaryVariant`, `useSubThemes`
* *FlexSchemeColor:*  
  `primaryVariant`, `secondaryVariant`
* *SchemeColor:*  
  `primaryVariant`, `secondaryVariant`
* *FlexConstants:*  
  `kDarkenSecondaryVariant`, `kDarkenSecondaryVariantFromSecondary`, `kDarkenPrimaryVariant`
* *FlexSubThemes.bottomNavigationBar:*
  `baseSchemeColor`
* *FlexSubThemes.navigationBarTheme:*
  `textSchemeColor`, `unselectedTextSchemeColor`, `mutedUnselectedText`, `iconSchemeColor`,
  `highlightSchemeColor`.


**STYLE CHANGE - BREAKING**

* `FlexSubThemesData.fabUseShape` opinionated component theme style default was changed from `true`
  to `false`, this breaks previous default style. The opinionated style change was done
  to use a style that by default matches M3 style when `ThemeData.useMaterial3` is `true`.
  The new default style is also a way to work around issue 
  [#107946](https://github.com/flutter/flutter/issues/107946), where it is shown that you cannot 
  create a theme that replicates the default roundings in M3 of the FAB.
  **Style migration**: If you had kept `FlexSubThemesData.fabUseShape` unspecified and relied on
  default value in a previous version, you must set it to `true` to get the same result as before.
  Breaking style changes like this, in the opinionated opt in component sub-themes are unfortunate.
  However, required as FlexColorScheme continues to evolve with Flutter SDK to support Material 3 
  theming, while offering its own opinionated tweaks on some M3 default styles as well.

**STYLE CHANGE - MINOR**

* The M3 color utilities package *material_color_utilities* from the Material team, that Flutter SDK
  depends on and FCS also uses, introduced a minor breaking change going from version 0.1.4 to
  0.1.5. Some colors in the tonal palettes no longer give exactly the same color values as before.
  This changes the results for some colors when you create a `ColorScheme.fromSeed` or FCS does
  it internally with its extended version `SeedColorScheme.fromSeeds`. The new algorithm changes
  for example all the default M3 error colors slightly. The changes in the color values are minor,
  and not visually noticeable to the eye. Values are however slightly different, and this release
  uses the new value for FCS M3 error colors. Tests were also updated to use the new values.
  The change did break FCS color value tests, and should be per its own policy be considered a
  major breaking change. However, since the Material 3 design and *material_color_utilities* calls
  this change minor, then so does FCS.

* The `FlexAppBarStyle` property was made nullable. It now defaults to null in all constructors.
  When it is null and `useMaterial3` is false, the app bar will use style `FlexAppBarStyle.primary`
  in light mode as default, like before and `FlexAppBarStyle.material` in dark mode. However, if
  `useMaterial3` is true, then it will use `FlexAppBarStyle.surface` in both light and dark mode,
  to match the un-themed defaults of Material 3 design `AppBar`.

* Updated `ElevatedButton` to support `useMaterial3` defaults concerning its switched foreground and 
  background color roles. It now also uses stadium border instead of 20dp, M3 size, padding and 
  elevation defaults, when `useMaterial3` is opted in on.

* Updated `OutlinedButton` to support `useMaterial3` defaults concerning its outline color default.
  It now also uses stadium border instead of 20dp, M3 size and padding, when `useMaterial3` is 
  opted in on.

* Updated `TextButton` to support `useMaterial3` defaults concerning its use of stadium border 
  instead of 20dp radius, as well M3 size and padding, when `useMaterial3` is opted in on.

* Changed opinionated dialog sub-theme defaults to match M3 defaults. Elevation set to 6, was
  10 and actionsPadding defaults to `EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0)`, it
  did not have a custom default before. These are new defaults for the opinionated dialog sub-theme
  for both M2 and M3.

* Updated `Chip` sub-theme when opting in on `useMaterial3`. When `true` it now uses upcoming M3
  styled Chips instead of its own opinionated custom style, also when the opinionated component
  sub-themes are enabled. To get the same opinionated coloring as before, but on the M3 styled
  chips when using M3, set component sub-themes data
  `subThemesData: const FlexSubThemesData(chipSchemeColor: SchemeColor.primary)`.
  This feature will only work with intended design in stable channel after feature and PR
  ["Migrate Chips to Material 3"](https://github.com/flutter/flutter/pull/107166) lands in stable
  channel. Currently, it is only available in Flutter *master 3.1.0-x*.

* Updated `InputDecoration` default sub-theme when opting in on `useMaterial3`. When `true` it 
  now results in more upcoming M3 styled `TextField` style, instead of its own totally opinionated 
  custom style also when the opinionated component sub-themes are enabled. It still uses a touch
  of its own style. To get the same opinionated coloring as before, but on the M3 styled
  'TextField' when using M3, set component sub-themes data
  `subThemesData: const FlexSubThemesData(cinputDecoratorSchemeColor: SchemeColor.primary)`.
  This feature will only work with intended design in stable channel after feature and PR
  ["Migrate TextField to Material 3"](https://github.com/flutter/flutter/pull/108366) lands in
  stable channel. Currently, it is only available in Flutter *master 3.1.0-x*. 
  The M3 alignment of FCS `InputDecoration` may still need more work, like:
  - Move towards same error container color idea for FCS default, like M3 uses
  - Option to use FCS component defaults on fill colors and disabled color when opting in on M3.

**CHANGE**
  
* Un-deprecated earlier internal deprecation of `FlexSubThemes.buttonTheme`, as long as Flutter
  SDK has not deprecated it, neither will FCS.
* Un-deprecated earlier internal deprecation of all *"variant"* named const `FlexColor` colors.
  They are not used actively by any built-in schemes. However, in line with past statement.
  The old M2 color names and values will not be removed. Feel free to use to them, if so desired.
* To support deprecation of `toggleableActiveColor` when PR 
  [Deprecate toggleableActiveColor #97972](https://github.com/flutter/flutter/pull/97972) lands,
  while retaining the previous FCS defaults for `Switch`, `CheckBox` and `Radio` widgets, when 
  not opting in on component sub-themes. The created `SwitchThemeData`, `CheckboxThemeData` and
  `CheckboxThemeData` can no longer be null, when not opting in on sub-themes like before.
  To support the previous nicely theme colored
  toggles in light and dark themes, that were set by defining the right scheme color for
  `toggleableActiveColor` in M2 and M3 theme modes, sub-themes for them that replicates the color
  styles must now be created also when not opting in on sub-themes. This update includes the
  necessary change to do so. This will be reflected in updates to the core defaults documentation.
  For a migration guide concerning `toggleableActiveColor` see 
  [Flutter breaking-changes](https://flutter.dev/docs/release/breaking-changes/toggleable-active-color#migration-guide).
* Since Flutter 3.3 did not yet include the actual deprecation of `toggleableActiveColor` FCS still
  defines its appropraiet color value for `ThemeData`.


**EXAMPLES**

* *Themes Playground:* New feature, the used code highlight colors were added as colors in 
  a `CodeTheme` class `ThemeExtension` to `ThemeData`. To demonstrate how one can use theme 
  extensions directly with FlexColorScheme as well, in this case to add custom semantic colors 
  for the code view's code keyword highlighter. Additionally, a fancy Material 3 feature was added, 
  color harmonization of custom colors. The proces is described in M3 guide under 
  [custom colors](https://m3.material.io/styles/color/the-color-system/custom-colors).
  The M3 library [MaterialColorUtilities](https://pub.dev/packages/material_color_utilities) has 
  the `Blend` function needed to perform the color harmonization, as described
  [here](https://github.com/material-foundation/material-color-utilities#readme) and the Dart color
  `Blend` function is [here](https://github.com/material-foundation/material-color-utilities/blob/main/dart/lib/blend/blend.dart).

* *Themes Playground:* Updated the default AppBar style, it uses a dropdown menu that can also select 
  'null' choice and use default M2 and M3 theming as defaults via it. The AppBar panel now also
  displays an AppBar Widget of its own, so one does not have to look at the actual AppBar to
  see the style. It also has widgets below it used to demonstrate the opacity setting.

* *Themes Playground:* Code gen and control enable/disable for onColor blends updated to lock controls
  with no impact when using seeded color scheme. Code is also not generated for onColor blend 
  settings that has no impact when using seeded color schemes.

* *Themes Playground*: Features and code gen for additional `Elevated.button` individual foreground
  and background colors.

* *Themes Playground*: Features and code gen for additional `Outlined.button` separate outline 
  color.

* *Themes Playground*: To the component panel added support to customize outline border
  thickness for `OutlinedButton`, `ToggleButtons` and `TextField`'s `InputDecorator`.

* *Themes Playground*: Added features and UI for new Flutter SDK `ColorScheme` colors 
  `outlineVariant` and `scrim`.

**DOCS**

* Removed duplicated section of 5.1.0 changelog entry with date July 5, 2022.

* Harmonized the changelog style and its past history. The new style and how it looks will be tested
  with a dev release to ensure it works well on pub.

**KNOWN FLUTTER SDK ISSUES IMPACTING THEMING**

The issues below in the Flutter SDK itself, are known to impact FlexColorScheme and Flutter theming
in general. The issues are typically caused by incomplete Material 3 implementation in Flutter.

* The M3 Chip themes available in Flutter `master 3.1.0-0.0.pre.2216` at the time of writing, 
  do as noted here
  [PR 107166 comment](https://github.com/flutter/flutter/pull/107166#issuecomment-1189206217),
  not yet M3 theme plain vanilla `Chip` when using Material 3. This might be fixed in an 
  additional PR later in the SDK. This proposal tracks the potential implementation of this
  [#109470](https://github.com/flutter/flutter/issues/109470).

* [**#107946**](https://github.com/flutter/flutter/issues/107946) Cannot theme Shape and IconSize 
  differently for different sized FloatingActionButtons. One of the drivers behind the breaking
  FAB style defaults for the opinionated FAB theme in FCS, was this issue.

* [**#108539**](https://github.com/flutter/flutter/issues/108539) Cannot theme shape independently 
  for `SnackBar` with different `behavior`. This is the reason why FCS does not yet offer a 
  custom shape in its opinionated `SnackBar` theme. To replicate the un-themed behavior with
  slightly different border radius values, one must make custom wrapper widgets for `SnackBar`.

The Flutter SDK M3 `useMaterial3` flag set to `true` continues to have a number of challenges in
addition to the above ones. We as before still have the issues below in Flutter *stable 3.0.5* and
also at least in Flutter *master 3.1.0-0.0.pre.2216* and earlier:

* [**#107190**](https://github.com/flutter/flutter/issues/107190) Elevation issue with `Material` 
  widget, when opting in on `useMaterial3` causes widespread elevation issues. Concerning the 
  reported elevation issue for dialogs included in the linked report, it was observed as fixed for
  them in master, but later the PR fixing it was reverted. Then it was relanded and then the reland 
  reverted, see [Issue #107423](https://github.com/flutter/flutter/issues/107423),
  [PR #108718](https://github.com/flutter/flutter/pull/108718), 
  [PR #109170](https://github.com/flutter/flutter/pull/109170) and
  [PR 109172](https://github.com/flutter/flutter/pull/109172). Even after it lands it won't solve
  all the mentioned incompleteness caused M3 elevation issues, only Dialogs. Popup in particular
  will remain troublesome.

* [**#103864**](https://github.com/flutter/flutter/issues/103864) Dynamically changing `Typography` 
  in `ThemeData` generates an error

* [**FIXED #107305**](https://github.com/flutter/flutter/issues/107305) Regression: `AppBarTheme` 
  properties `iconTheme` and `actionsIconTheme` ignored on master channel when `useMaterial3`
  is true. This is not in stable Flutter channel *stable 3.0.5*, but if you used 
  master channel it was something to be aware of, as it exists in Flutter
  *master 3.1.0-0.0.pre.2033* and many earlier *master 3.1.0-x* versions. This issue was fixed via
  [PR #108332](https://github.com/flutter/flutter/pull/108332) and can no longer be observed in
  *master, 3.1.0-0.0.pre.2108* or later versions.

## 5.1.0

**July 8, 2022**

* Updated to support *Flutter 3.0.0*, with *Dart 2.17* and latest Flutter package dependencies in
  example apps. Requires at least *Flutter 3.0.0* and *Dart 2.17.0*.

**NEW**

* **Added** full support for in *Flutter 3.0.0* new `ColorScheme.surfaceTint` color. It is set to 
  `ColorScheme.primary` color by default, as Flutter and Material 3 does. If a custom `surfaceTint` 
  color is provided, it is also used as the blend color, instead of `primary` color, for 
  FlexColorScheme's surface blend feature.

* **Added** API for using *Flutter 3.0.0* theme extensions directly via FlexColorScheme 
  API. It was added as a convenience feature in order to avoid having to add theme extensions with a
 `copyWith` on FlexColorScheme produced ThemeData. With the `FlexColorScheme.extensions` and
 `FlexThemeData.extensions` properties you can add custom theme extensions directly.

**DEPRECATED**

* **Deprecated:** `FlexColorScheme.m3TextTheme`. The custom M3 text theme is no longer needed after 
  Flutter 3.0.0 release that includes the new M3 Typography in addition to its earlier released
  `TextTheme`. You can opt in on using the new M3 style TextTheme as before by setting 
  `FlexColorScheme.subThemesData.useTextTheme` to true **or** by setting 
  `FlexColorScheme.useMaterial3` to true. Using either does however come with known issue
  [#103864](https://github.com/flutter/flutter/issues/103864), where dynamically switching 
  Typography, e.g. from 2014 or 2018, to M3 2021 Typography, triggers the mentioned assert in issue
  [#103864](https://github.com/flutter/flutter/issues/103864). This issue has always existed in
  Flutter SDK ThemeData when dynamically changing between different Typography. 
  Before FlexColorScheme avoided triggering this issue by only using Typography 2018, also when 
  opting in on M3 TextTheme, that before used 2018 based Typography to make a custom M3 like 
  `TextTheme`. Avoiding this issue is no longer possible when opting in on M3, that now correctly 
  uses its own and different Typography from M2. This exposes this issue if you dynamically 
  change ThemeData from one to another Typography.
  To avoid this Flutter SDK issue, use the same Typography for all your themes in your app and don't
  dynamically switch theme between ThemeData objects that uses different Typography in your 
  application. The use cases for doing this are few, but it is still a Flutter SDK limitation to be
  aware about.

* **Deprecated:** `FlexSubThemes.buttonTheme` that creates an opinionated `ButtonThemeData`.
  The ButtonThemeData is marked as obsolete in Flutter SDK, but not yet deprecated in 
  *Flutter 3.0.0*. FlexColorscheme now marks it as **deprecated**. It will be 
  removed in a future FlexColorScheme release when Flutter SDK deprecates `ButtonThemeData`.

**M3 STYLE FIXES AND CHANGES**

* **FAB M3 defaults change**: Floating Action Button background color, will when opting in on 
  `ThemeData.useMaterail3`, use color `theme.colorScheme.primaryContainer`, 
  otherwise `theme.colorScheme.secondary` is used.

* **Input Decorator default change**: The `TextField` and its `InputDecorator` border radius 
  default value was changed from 20dp to 16dp when using opinionated component themes.
  If opting in on Material 3, the default value for M3 design is used, which is only 4 dp.
  See specification https://m3.material.io/components/text-fields/specs.
  Flutter 3.0.x does not yet implement the new M3 TextField style, but via this change when
  opting in on M3, FlexColorScheme offers an early approximation of it. 

* **NavigationBar M3 defaults change**: Default colors of `NavigationBar` when opting in on 
  `useMaterial3` and not using opinionated component themes will now match M3 default colors. 
  The background color will follow M3 style also by default when component themes are enabled and
  `useMaterial3` is true. This style is difficult to replicate with a single color otherwise.  
  The difference is subtle for FCS surface tinted background colors. You can still set it to
  `background` color to replicate past FCS default color when sub-themes were enabled. 
  For other properties, if opinionated component themes are not used, FCS will use default M3
  theme styles on `NavigationBar` when `useMaterial3` is true. If opting in
  on opinionated component themes, FCS uses its own custom opinionated default style. Which can be
  modified to be the same as default M3 style too, just as before. The change also includes a 
  default font size change for FCS opinionated styled navigation bar, from 11dp to 12dp. This change
  was done to harmonize it with its M3 style.

* **NavigationRail M3 defaults change**: Default colors of `NavigationRail` when opting in on
  `useMaterial3` and not using opinionated component themes will now match M3 default colors. 
  If opinionated component themes are not used, FCS will use default M3 theme styles on 
  `NavigationRail` when `useMaterial3` is true. If opting in on opinionated component themes, 
  FCS uses its own custom opinionated default style. Which can be modified to be the same as 
  default M3 style too, just as before. The change also includes a default font
  size change for FCS opinionated styled rail, from 14dp to 12dp.  This change was
  done to harmonize it with its M3 style.

* **Toggleable M3 style change:** Default color of toggles (Switch, CheckBox and Radio) are now 
  using `primary` color as default themed color when opting in on opinionated component themes or
  setting `ThemeData.useMaterial3` to true. The Switch, CheckBox and Radio themes then use a style
  that match the M3 color design intent. In it, 
  switches and toggles are mostly primary color based. In M3 color design, the secondary color is a 
  poor choice for switches and toggles, and it is therefore not used as their default color. It 
  does not look nice with M3 based ColorSchemes, created e.g. using M3 color seeding. If you use a
  custom M3 color design, where secondary color is still prominent, you can of course still use it.

* **Fixed lint:** "Avoid using private types in public APIs". See tweet 
  [discussion](https://twitter.com/RydMike/status/1533788260320923649) about why and when you 
  might run into this lint being triggered by older Stateful Widgets. The lint warning was
  addressed in the package and examples.

**EXAMPLES**

* Added a **Theme Extensions** example to the default example app *Hot Reload Playground*.

* *Themes Playground:* Updated the default style info labels for Switch, CheckBox and Radio.

* *Themes Playground:* To the top row theme selector, where the FlexColorScheme and component themes  
  switches are, added the "Use Material 3" toggle. Previously this toggle was only available on the
  introduction panel. The availability in the header makes it easy to toggle it ON and OFF at
  any time, to see what impact it has on widgets.

* *Themes Playground:* Updated the default style info labels for the NavigationBar. The logic to display 
  default color labels in different config modes (M2/M3/FCS/FCS+M2/FCS+M3) is quite involved, please 
  report any issues. 

* *Themes Playground:* Updated the default style info labels for the NavigationRail. The logic to display
  default color labels in different config modes (M2/M3/FCS/FCS+M2/FCS+M3) is quite involved, please
  report any issues.

* *Themes Playground:* Due to issue [#107190](https://github.com/flutter/flutter/issues/107190), the
  Playground previous default to use Material 3 was changed to false. 

* *Themes Playground:* Added support to customize the `surfaceTint` color. It controls both the
  elevation color used for elevated `Material` surfaces in M3. Plus for FlexColorScheme it is also 
  used as the surface blend color. By default, the `surfaceTint` color equals `ColorScheme.primary` 
  color. Generally there are not many good design reasons to change the color, but it is now 
  possible to do so. A good graphical designer can use it to create subtle difference from the 
  standard surface elevation color branding effects. Used poorly, it mostly creates not so  
  appealing visual and coloring results.

**KNOWN FLUTTER SDK ISSUES**

The issues below in the Flutter SDK itself, are known to impact FlexColorScheme and Flutter 
theming in general.

* Switching `Typography` dynamically in Flutter SDK ThemeData is broken, see
  issue [#103864](https://github.com/flutter/flutter/issues/103864) for more information.
  If it is done and the error ignored, an app doing so eventually becomes unstable.

* The *Themes Playground* app contains a workaround to
  avoid issue [#103864](https://github.com/flutter/flutter/issues/103864). The workaround
  is done by always using 2021 Typography, but simulating 2018 Typography. This is done by using
  a custom TextTheme that looks like 2018 Typography is used when using M2 theme mode. The
  Playground App actually always stays in 2021 Typography, but looks 
  like it switches it. Which it does by applying a custom `TextTheme` in 2021 Typography, that looks
  like 2018 Typography is used. All other examples also avoid the issue by only using the 
  M3 2021 Typography and not even mimicking a switch between M2 and M3 Typography. 

  The above workaround is needed because the *Themes Playground* app has toggles that switches 
  `Typography` frequently, without the workaround it will eventually crash. With this workaround it never
  switches Typography, it just looks like it does, but app stays in 2021 Typography all the time.
  The by Themes Playground generated ThemeData config will use the actual real effective 
  Typography. This is also fine, since an app using the theme will likely never switch used 
  Typography. However, if it does, it will face the same issue the Playground app did. The issue
  is a Flutter SDK issue that FlexColorScheme cannot fix. Most likely 99% of apps will never run 
  into this issue.

* In Flutter *stable 3.0.x*, when opting in on `useMaterial3:true`, the `Material` widget and other
  SDK widgets built on it, gets no elevation when only the `elevation` property is defined. It is 
  required to also define `shadowColor` and/or `surfaceTintColor` to get any elevation effect.
  When using the `Material` widget itself this is easy to address. However, widgets like
  `Drawer`, `PopupMenuButton`, `BottomNavigationBar`, `NavigationRail`, `Dialog`, `AlertDialog`,
  `TimePickerDialog`, `DatePickerDialog`, `MaterialBanner` and `BottomSheet` do not expose these 
  `Material` properties and cannot be elevated. 
 
  The issue is reported and tracked here [#107190](https://github.com/flutter/flutter/issues/107190) 
  and also mentioned in the `FlexColorScheme` repo here
  [#54](https://github.com/rydmike/flex_color_scheme/issues/54). There are no good workarounds 
  for using elevation on these widgets when `useMaterial3` is true. The options are to not use
  M3, if such elevations are important to your app design. One working fix is to wrap those widgets
  in a theme where `useMaterial3` is false, then the rest of your app can still use it. This is 
  however a rather tedious workaround. Due to current Flutter SDK `Material` elevation issues when 
  `useMaterial3` is true, it is recommended to not use it yet.

* This regression in master channel impacts AppBar icon colors when using Material 3 
  [#107305](https://github.com/flutter/flutter/issues/107305). It has not yet landed in stable 
  channel Flutter *stable 3.0.5*, but if you use master channel it is something to be aware of.

## 5.0.1

**April 29, 2022**

**FIX**

* For the custom and temporary `m3TextTheme`: Fixed the Typography letterSpacing for bodyLarge to
  match corrected M3 spec that had wrong specification on the M3 website 0.15 -> 0.5. See
  Flutter SDK issue [#102121](https://github.com/flutter/flutter/issues/102121).
* Themes Playground: Fix wrong color code copied to clipboard when tapping input color.
* Themes Playground: Make prettier default constructor for FlexSubThemesData() if that is 
  all that was defined in Themes Playground config.

## 5.0.0

**April 21, 2022**

### Overview

The full journey from version 4.2.0 to stable 5.0.0 includes the steps in
change logs for development versions 5.0.0-dev.3, -dev.2 and -dev.1.
Please refer to them for all details. This changelog contains a summary of
breaking and other critical changes from version 4.2.0.

FlexColorScheme version 5 is style wise a big breaking change since all the
built-in produced `ColorScheme`s the themes use have been revised to follow
the new Flutter 2.10.0 Material 3 based `ColorScheme`. The color changes to
the built-in schemes have been kept minimal compared to previous styles.

Mostly new color values were added to provide support for all the new
colors in the Flutter Material 3 `ColorScheme` update, that landed in Flutter
2.10.0. The new colors are style aligned with past styles as far possible, while
also keeping them inline with the Material 3 ColorScheme design intent.

As `ColorScheme.primaryVariant` and `secondaryVariant` have been deprecated
in Flutter 2.10 SDK, so have they in FlexColorScheme. All past color constants
for all color values and helper classes with the name "variant" in them, have been
self deprecated in FlexColorScheme. The variant color values still exists,
if you have used any of them directly, they still work. The old built-in
variant color values will remain available at least until version 6.0,
maybe even 7.0 if so requested by users.

**BREAKING**

* Version 5.0.0 requires at least Flutter version 2.10.0 to work. This breaking
  change is required since the new color properties in `ColorScheme` do not exist
  in any stable version of Flutter before version 2.10.

* `surfaceStyle` removed.
  * In version 5.0.0, the in version 4.2.0 deprecated property `surfaceStyle`, including all
    its implementing classes, enums, helpers and tests have been removed.
  * Removed property: `surfaceStyle` in `FlexColorScheme.light` and `FlexSchemeData.light`.
  * Removed property: `surfaceStyle` in `FlexColorScheme.dark` and `FlexSchemeData.dark`.
  * Removed: enum `FlexSurface`, that only `surfaceStyle` was using.
  * Removed: factory `FlexSchemeSurfaceColors.from` that was used to create
    surface using the `surfaceStyle`. The factory `FlexSchemeSurfaceColors.blend`
    replaced it in version 4.0.0 already, when using `surfaceMode` and `blendLevel`.
  * **Migration:** Use `surfaceMode` and `blendLevel` instead, it has more blend
    styles and finer granularity than the removed `surfaceStyle`.

```
theme: FlexThemeData.light(
  scheme: FlexScheme.flutterDash,
  surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
  blendLevel: 20,
),
```

* `FlexSubThemesData.navigationBarIsStyled` removed.
  * The property `navigationBarIsStyled` in `FlexSubThemesData` has been
    removed. If you have used it, it has a broader more general replacement called
    `FlexSubThemesData.useFlutterDefaults`.
  * **Migration:** Consider using `useFlutterDefaults` instead, or set styles
    manually using individual properties to desired styles matching Flutter defaults
    un-themed component designs.


* `FlexColorScheme.useSubThemes` no function
  * Deprecated property `useSubThemes`. This property has no function after 4.2.0
    stable and 5.0.0-dev.1. Previously setting this property to true activated
    the default set and configuration of the optional opinionated component sub-themes,
    even if you did not pass any `FlexSubThemesData()` configuration data to
    `subThemesData`. Before when `useSubThemes` was true and no `subThemesData`
    defined, it created one internally using the default constructor
    `FlexSubThemesData()` and used it. It also ignored any defined and to
    `subThemesData` assigned one, if the flag was set to false.
  * The default component sub-themes are now instead always activated and created by
    explicitly assigning at least a default constructor `FlexSubThemesData()` to
    `FlexColorScheme.subThemesData`.
  * Removing this property makes the API more consistent. It follows the same
    design that is used for `keyColors`  with `FlexKeyColors` and `tones` with `FlexTones`.
  * **Migration:** If you previously had only set `FlexColorScheme.useSubThemes` to true and not
    specified any `subThemesData` properties, you must now add the default constructor. Likewise,
    if you had set `FlexColorScheme.useSubThemes` to false, and had a `FlexColorScheme.subThemesData`
    defined, you must remove it disable using it. If you need to toggle it ON and OFF, use a bool
    to enabled/disable it, then pass in the `FlexSubThemesData` when enabled,
    and null when not using it.


**DEPRECATED AND BREAKING** due to Flutter SDK change in 2.10.0 stable release.

* `primaryVariant` and `secondaryVariant`
  * The colors `primaryVariant` and `secondaryVariant` in FlexColorScheme are
    deprecated and can no longer be used to set colors values that result in any
    color values in Flutter SDK deprecated same named `ColorScheme` color properties.
  * The `ColorScheme` deprecated properties `primaryVariant` and
    `secondaryVariant` will always get their Flutter SDK default values,
    regardless of what input you give to them in FlexColorScheme. Flutter sets its
    deprecated `primaryVariant` equal to `primary` and `secondaryVariant` equal
    to `secondary`.
  * This means that if your application used those color scheme values on any
    custom widgets, their colors will change if you upgrade from a previous
    version of FlexColorScheme and don't do any other changes. You need to
    migrate to use `primaryContainer`, `secondaryContainer`, `tertiary` or
    `tertiaryContainer` color, as replacement colors in your custom widgets.
     The right choice depends on your color design.
  * If you use a `FlexColorScheme` setup made for a version before version 5.0,
    with version 5.0, and, if you have used custom color schemes where you
    defined the`FlexColorScheme` properties `primaryVariant` and `secondaryVariant`
    or defined and used them via custom `FlexSchemeColors`, in the `colors` property in
    `FlexColorScheme`. **Then**, in those cases the **variant** color
    properties will function as fallback input for color properties
    `primaryContainer` and `secondaryContainer` respectively, unless own color
    values for these properties are provided.
  * When you upgrade package version to 5.0.0 and have used custom color schemes,
    you will find your custom variant colors on the corresponding new
    container colors. Be aware that past variant color shades are not necessarily a great
    fit for a Material 3 design intent of container colors, but at least you will get
    your past custom colors used in the new theme by default.
  * **Migration:** Define new custom colors values for all container colors and
    tertiary color. Use them to make your custom `FlexColorScheme` instead.
    Then migrate away from using Flutter SDK `ColorScheme` colors `primaryVariant`
    and `secondaryVariant` anywhere in your application. Instead, use any of its new
    `ColorScheme` color properties as fitting with your design. This is something you have
    to do after Flutter 2.10, even if you are not using FlexColorScheme. Sure, not immediately, but
    eventually when the Flutter SDK `ColorScheme` colors `primaryVariant` and `secondaryVariant`
    are removed after a year or so.

* `SchemeColor` values and order, potentially breaking.
  The enum `SchemeColor` has new values and past values are in a new order.
  The order was changed to accommodate all the new color values, and to keep them in
  the same order as their corresponding color properties in Flutter Material 3
  `ColorScheme` color values. The change of order is potentially breaking,
  but highly unlikely to break anything in major ways in normal usage.

**STYLE CHANGE - BREAKING**

* The custom "internal" and temporary `m3TextTheme` was changed.
  It is **style breaking** with 4.2.0 and 5.0.0-dev.1 & 2.
  It breaks past used style when opting in on component themes and its optional
  custom `m3TextTheme` enabled. The updated custom implementation of it now follows the
  implementation used in Flutter master channel, apart from this
  [issue](https://github.com/flutter/flutter/issues/102121),
  where it for now implements the value used in the M3 Web guide.
  The changes in styles otherwise concern the addition of the font geometry height, which the
  previous custom implementation did not have. The usage of the custom `m3TextTheme` should be
  considered internal and temporary. It will be changed to use the actual Flutter implementation
  once [PR #97829](https://github.com/flutter/flutter/pull/97829) lands in Flutter stable
  channel. The custom `m3TextTheme` will then be deprecated.

* The computed colors for `ThemeData` colors `primaryColorLight`, `primaryColorDark` and
  `secondaryHeaderColor` were changed.
  It is **style breaking** with 4.2.0 and 5.0.0-dev.1 & 2. The change breaks past
  used styles on these rarely used colors. These `ThemeData` colors are also on
  a deprecation path and will likely receive some new none `MaterialColor` dependent
  color defaults when that change happens. The new `ColorScheme.primary` computed
  colors for these rarely used colors are better balanced than before, and work well
  regardless of used `ColorScheme.primary` shade and tint.

* The color definition value for `FlexColor.espressoLightPrimary` color was changed.
  This is **style breaking** with 4.2.0 and 5.0.0-dev.1 & 2. The new color for
  `FlexColor.espressoLightPrimary` breaks past used color for this color constant.
  The color was changed from `0xFF220804` to `0xFF452F2B`. Past color was too dark brown, almost
  black to be very usable in a UI. It was very black coffee like, but not very practical in a UI,
  it was too close to black. Since version 5 is anyway a major style breaking with the introduction
  of the new Material 3 ColorScheme, the opportunity to improve this color value used in the
  built-in theme `espresso` theme was used.

## 5.0.0-dev.3

**April 20, 2022**

**STYLE CHANGE - BREAKING**

* The custom "internal" and temporary `m3TextTheme` was changed.
  It is **style breaking** with 4.2.0 and 5.0.0-dev.1 & 2.
  It breaks past used style when opting in on component themes and its optional
  custom `m3TextTheme` enabled. The updated custom implementation of it now follows the
  implementation used in Flutter master channel, apart from this
  [issue](https://github.com/flutter/flutter/issues/102121),
  where it for now implements the value used in the M3 Web guide.
  The changes in styles otherwise concern the addition of the font geometry, height, which the
  previous custom implementation did not have. The usage of the custom `m3TextTheme` should be
  considered internal and temporary, it will be changed to use the actual Flutter implementation
  once [PR #97829](https://github.com/flutter/flutter/pull/97829) lands in Flutter stable
  channel. The custom `m3TextTheme` will then be deprecated.

* The computed colors for `ThemeData` colors `primaryColorLight`, `primaryColorDark` and
  `secondaryHeaderColor` were changed.
  It is **style breaking** with 4.2.0 and 5.0.0-dev.1 & 2. The change breaks past
  used styles on these rarely used colors. These `ThemeData` colors are also on
  a deprecation path and will likely receive some new none `MaterialColor` dependent
  color defaults when that change happens. The new `ColorScheme.primary` computed
  colors for these rarely used colors are better balanced than before, and work well
  regardless of used `ColorScheme.primary` shade and tint.

* The color definition value for `FlexColor.espressoLightPrimary` color was changed.
  This is **style breaking** with 4.2.0 and 5.0.0-dev.1 & 2. The new color for
  `FlexColor.espressoLightPrimary` breaks past used color for this color constant.
  The color was changed from `0xFF220804` to `0xFF452F2B`. Past color was too dark brown, almost
  black to be very usable in a UI. It was very black coffee like, but not very practical in a UI,
  it was too close to black. Since version 5 is anyway a major style breaking with the introduction
  of the new Material 3 ColorScheme, the opportunity to improve this color value used in the
  built-in theme `espresso` theme was used.

**CHANGE**

* The package documentation has now moved too its own site at
  [docs.flexcolorscheme.com](https://docs.flexcolorscheme.com).
  It is a major update and rewrite of previous documentation. It also contains general
  Flutter theming guidance.

**FIX**

* The examples contain minor improvements and fixes.

## 5.0.0-dev.2

**April 4, 2022**

**BREAKING**

* Completed in version 4.0.0 for version 5.0.0 planned removal of
  deprecated property `surfaceStyle`, including all its implementing classes,
  enums and helpers:
  - Removed property: `surfaceStyle` in `FlexColorScheme.light`.
  - Removed property: `surfaceStyle` in `FlexColorScheme.dark`.
  - Removed: enum `FlexSurface`, that `surfaceStyle` where.
  - Removed: factory `FlexSchemeSurfaceColors.from` that was used to create
    surface using the `FlexSurface`. The factory `FlexSchemeSurfaceColors.blend`
    replaced in version 4.0.0 already when using `surfaceMode` and `blendLevel`.
  - Removed tests and modified tests needing to consider above removals.

* Deprecated property `useSubThemes`. This property has no function after
  4.2.0 stable and 5.0.0-dev.1. FlexColorScheme opinionated component sub-themes
  are now created by adding a default constructor `FlexSubThemesData()` or one with
  some custom property values set, to `subThemesData`. This creates sub-themes
  using the FlexColorScheme opinionated sub-themes. Removing this property makes the
  API more consistent. It now follows the same design that is used for `keyColors`
  with `FlexKeyColors` and `tones` with `FlexTones`.
  Setting the property `useSubThemes` will not cause an error, it just has no effect.
  You can safely remove it. The property `useSubThemes` will be removed in release 6.0.0.

* The property `navigationBarIsStyled` in `FlexSubThemesData` was removed in
  **v5.0.0-dev.1** as no longer needed. It is now kind of back with a new broader
  replacement called `FlexSubThemesData.useFlutterDefaults`.
  The in dev.1 version tested API-style to
  set various `SchemeColor` properties to null, to get SDK default for them was not
  nice. The `FlexSubThemesData` should default to its own preferred
  and recommended harmonized defaults when not defined. It is better to offer a
  toggle that can be set, to when possible/offer an opt-out from some bigger style
  differences from SDK defaults. This can be useful if one wants to create
  custom component themes and wish to start from less opinionated ones.
  The new `useFlutterDefaults` is false by default, and the sub-themes undefined
  null values result in its own harmonized and recommended settings. By setting
  it to `true` a bit messier and un-harmonized Flutter default are back. Currently,
  this impacts different styles and colors on `BottomNavigationBar`, `NavigationBar`,
  and `NavigationRail`. See API docs for details regarding
  defaults with this flag on and off.

* The `FlexSubThemesData` property `popupMenuRadius` and the radius in
  corresponding static sub-theme helper `FlexSubThemes.popupMenuTheme`,
  now defaults to 4.
  In versions before v5.0.0-dev.2 it defaulted to 10. The M3 spec for it
  was not available when it was chosen originally. It was assumed to have
  higher border radius like rest of designs. However, the spec has it
  defined [here](https://m3.material.io/components/menus/specs) now, and it
  is 4. Since border radius default values are stated in FlexColorScheme
  sub-theme design goals to follow the M3 design specs, it was updated to
  match the spec. A bit higher rounding, may actually fit better with
  the very round M3 design, try 8 or 10. It is very simple to change bach with
  the API.

**FIX**

* Pub.dev analysis does not like document references to deprecated Flutter
  properties. Changed the **primaryVariant** and **secondaryVariant** references
  in document comments to `primaryVariant` and `secondaryVariant`. Nor does it
  like when you use tests to deprecated Flutter SDK members, removed them too,
  they were not needed either after some redesign of a few tests.

* Fixed. When using sub-themes and selecting a `ColorScheme` based color, as
  color for the `AppBar`, instead of using `abbBarStyle` in light and dark
  factories, the `appBarOpacity` was not applied to the selected color. The
  priority of effective `AppBar` color was also revised to follow the norm,
  which from lowest to highest is:
  - `appBarStyle` in light/dark factories and ThemeData extensions, which
     selects the used color from active `scheme` or `colors`, in the same
     factories or extensions.
  - `appBarBackgroundSchemeColor` in `FlexSubThemesData` when used.
  - `appBarBackground` in FlexColorScheme.

**CHANGE**

* Changed the priority in FlexColorScheme when using direct input color
  properties, `colorScheme` input and using key color seeded ColorScheme
  generation. The new order is that input `colorScheme` is in this rare use case
  always overridden by the seed generate `ColorScheme`. This allows us
  to use a `colorScheme` as input to seed generation, where this color
  scheme could already have been externally seeded generated, but that we want
  to modify by using custom FlexTones or surface blends in FlexColorScheme.
  The direct properties overrides the seeded color scheme as before, unless it
  is `primary`, `secondary`, `tertiary` or their container colors. In that case
  the `keyColors`, "keep" property determines if those colors are kept or not.

* The `FlexSubThemesData` property `inputDecorationRadius` was deprecated and
  renamed to `inputDecoratorRadius`, to harmonize the other
  `InputDecoration` property names in `FlexSubThemesData`.
  The old name will be removed in release 6.0.0.

* Deprecated and renamed `navigationBarHighlightSchemeColor` to
  `navigationBarIndicatorSchemeColor` in `FlexSubThemesData`, to
  harmonize the naming standard. Likewise, the parameter `highlightSchemeColor`
  ìn `FlexSubThemes.navigationBarTheme` was deprecated and replaced by
  `indicatorSchemeColor`. The old names will be removed in release 6.0.0.

* In 5.0.0-dev.1, the renamed properties were deprecated and broken with 4.2.0.
  They are still deprecated, but now fallback via the old properties. They
  are no longer breaking. This concerns `FlexSubThemesData` properties:
  - `bottomNavigationBarSchemeColor` -> `bottomNavigationBarSelectedLabelSchemeColor`
  - `navigationBarTextSchemeColor` -> `navigationBarSelectedLabelSchemeColor`
  - `navigationBarMutedUnselectedText` -> `navigationBarMutedUnselectedLabel`
  - `navigationBarIconSchemeColor` -> `navigationBarSelectedIconSchemeColor`

  And `FlexSubThemes.navigationBarTheme` properties:
  - `textSchemeColor` -> `selectedLabelSchemeColor`
  - `unselectedTextSchemeColor` -> `unselectedLabelSchemeColor`
  - `iconSchemeColor` -> `selectedIconSchemeColor`
  -  `mutedUnselectedText` -> `mutedUnselectedLabel`

  And `FlexSubThemes.bottomNavigationBarTheme` properties:
  - `baseSchemeColor ` -> `selectedLabelSchemeColor`

  The old property names will be removed in release 6.0.0.

**NEW**

* Added `SchemeColor` based theming of `SnackBar` background color via
  `snackBarBackgroundSchemeColor` in `FlexSubThemesData` and support for it
  in `FlexSubThemes`.

* Changed the color values for `FlexColor.materialLightSecondaryContainer` and
  `FlexColor.materialLightSecondaryContainerHc`. These color properties
  do not have any specification in Material 2 spec. Updated the colors values
  that had been made up for **dev.1** release to better match the design intent
  of those colors for the new Material 3 `ColorScheme`.

* Added `inputDecoratorUnfocusedBorderIsColored` to `FlexSubThemesData` and
  support for it in `FlexSubThemes` via `unfocusedBorderIsColored`. Previously
  an unfocused or hovered border/underline always had a hint of selected
  base color. Setting this to false, leaves it at the grey defaults used by
  Flutter defaults.

* Added `navigationBarIndicatorOpacity` and `navigationRailIndicatorOpacity`
  to `FlexSubThemesData`, to expose their already existing properties in
  corresponding sub-themes used by `FlexColorScheme`.

**EXAMPLES**

* *Themes Playground:*
  - Added a new single panel "Page" view. The previous large masonry grid view
    is still available. Both views can be used and switch to based on what
    is appropriate when using different media sizes.
  - The switches to keep main input colors for primary, secondary, tertiary
    and their containers, where separated so that their state and code
    generation for light and dark theme mode are separate. This makes them
    more useful for actual theme setup. Earlier you had to separate them by
    editing the generated code.
  - Added display of SnackBar style to the Themed Material panel.
  - Added display of more ListTile types.
  - Added ColorScheme based color selection theming of SnackBar background color.
  - Added CodeView as a panel of its own. It is now possible to view the
    changes to generated code as settings are changed. In the
    advanced view where one can keep it open and close other panels, except one
    being operated in. In page view it is shown as last page, however if
    the media is large enough, it is shown side-by-side with controls on current
    page. This is a really handy view for studying what each control does in
    the generated code.
  - Added missing code gen for button border radius.
  - Fixed broken code gen for dark mode blend level.
  - Decoupled all bundled theming controls in the app.
  - Added individual override controls for border radius to all components.
  - Added option to swap or not swap computed dark mode main and container color.
  - Added indicator opacity controls to NavigationBar and NavigationRail.
  - Reduced amount of pre-set  defaults in the app, so it starts with simpler setup code.
  - Changed the code gen style for dark mode when using from light mode computed dark theme.
  - Changed the code gen, so it does not add any code when using API default values.
  - Changed the ThemeService to use generic types.

**TESTS**

* Finalized test updates. Now 1684 tests, coverage about 99.8%.

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

### What is Next?

Curious about what is planned next for FlexColorScheme? Head over
to the TODO section at the end of this page and read more
[here](#future-features).

## 4.2.0

**January 24, 2022**

**DEPRECATED**

* The property `surfaceStyle` has been deprecated. In
  version 4.0.0 it was already recommended to use, the then introduced more
  powerful surface branding properties `surfaceMode` and `blendLevel` instead.
  The `surfaceStyle` property is still available and works as before, but you
  now get a deprecation warning if it is used. The property and all its related features
  will be completely removed in version 5.0.

**NEW**

* Updated required Dart SDK to minimum 2.15 that Flutter 2.8.0 uses.
  To use this release at least Flutter 2.8.0 is required.
 
* Added support for opinionated sub-theme for the new Material 3 based
  `NavigationBar`. Flutter version 2.8.0 is the first stable version that
  includes the new Material 3 design based `NavigationBar`.

* Custom `FlexColorScheme` based themes can now also be defined by
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
  may be created using new Material 3 design based color tools, e.g., from
  seed color(s) or using dynamic colors extracted from system wallpaper colors.
  With this feature it will then be able to feed those colors directly into
  FlexColorScheme, and use them as colors to create your `ThemeData`.

* Added a `ColorScheme` color selection option to selected opinionated
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

**CHANGE**

* All properties in all `FlexColorScheme` constructors are now
  optional. The change is none breaking, and uses Material 2 based
  design guide example theme light and dark as defaults for undefined values.

* Removed the `uses-material-design: true` line from library
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
    of the masonry-grid layout. This was confusing UX, as entire panels might
    move into new places. While the UI hide animations were cool, this keeps
    the panels in same place in the grid, which is less confusing to use.
    Panels can still be closed, and it of course causes relayout of the grid too,
    but in that use case it is expected.
  * Changed ColorScheme indicator boxes to use the themed border radius.
  * Added a button to copy theme, and improved the explanations to make the
    functionality more obvious and accessible. Previously only the entire
    ListTile was the button, this UI with no button was not so clear. Now
    there is also a button that says COPY. Clicking on the ListTile still
    works as well.
  * Add and updated app icon resources used by all the example apps.
  * Update to new breaking version of StaggeredGridView 0.6.0. It no longer
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


## 4.1.1

**November 20, 2021**

**FIX DOCS** 

* Fixed a broken link in the readme that pub.dev analyzer found.

## 4.1.0

**November 20, 2021**

**FIX**

* The `defaultRadius` in `FlexSubThemesData` now defaults to null
  so all sub-themes border radius will default to M3 default border
  radius per widget. The const default value it had, was a remnant from early
  dev phase when widgets all defaulted to single shared radius and not M3
  defaults per widget type. If you explicitly passed in null, you did also in
  previous version get the M3 defaults. Older tests did that, now they expect
  same result when no value is assigned, as it should have been.

**CHANGE**

Opt in opinionated sub themes minor style changes:

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

**EXAMPLES**

* Updated and tuned the examples. Example 5 *Themes Playground*
  now includes capability to define custom color schemes starting from built-in ones.
  It can also generate the FlexColorScheme setup code needed for any defined
  viewed theme setup. You can copy/paste a theme's Flutter Dart code,
  from the Themes Playground to your app and use it as its theme. This is a very
  quick and convenient way to try a theme you made and see in the Themes
  Playground in your own app.

**TESTS**
 
* Modified tests to catch the fixed `defaultRadius` issue.
* Added more tests, now total 1069 tests.

## 4.0.0

**November 13, 2021**

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

## 4.0.0-dev.1

**November 13, 2021**

* See change log for stable 4.0.0, it was the same for this dev release.
  the text is just not repeated here anymore.

## 3.0.1

**July 1, 2021**

**FIX**

* The internal order of swapping primary and secondary colors and reducing
  used colors in static function `FlexSchemeColor.effective(FlexSchemeColor colors,
  int usedColors, {bool swapColors = false})` matters for the intended result when
  used together in the same call. The function now swaps primary and secondary colors,
  before reducing the used colors.

* Documentation and typo fixes.

**Tests**
* Added tests for above fix that captures the issue and fails
  in version 3.0.0. Total 741 tests, coverage 99.75%.


## 3.0.0

**June 25, 2021**

**BREAKING**

* The color `accentColor` is being deprecated in Flutter SDK `ThemeData` starting
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


**NEW** 
 
* The `FlexColorScheme.dark` and `FlexColorScheme.light` factories have a new
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


* The static function `FlexSchemeColor.effective(FlexSchemeColor colors,
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

**TESTS** 
 
* Added tests for the new features and removed test related to
  `accentColor`. Total 736 tests, coverage 99.75%.

**OTHER**

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

## 2.1.1

**March 30, 2021**

**CHANGE** 
 
* Made the VoidCallback `onSelect` in `FlexThemeModeOptionButton` nullable.
  The optional callback allows for the button to be used for example as a trailing
  widget in a ListTile. Keep it null to not have any callback, nor hover or Ink of its own, and use
  the select event of the parent instead. When it is used as standalone button you
  normally want to use this callback, but not if you want the parent to handle it, that use case was
  not allowed with previous version.

## 2.1.0

**March 22, 2021**

**FIX** 
 
* Toggling `FlexColorScheme(transparentStatusBar)` from true to false, did not restore the
  Android default status bar scrim, unless the app was completely rebuilt. This has been fixed.
 
* When using `FlexColorScheme.themedSystemNavigationBar(useDivider)` in an `AnnotatedRegion`, toggling
  `useDivider` from true to false, did not remove the system navigation bar divider again, unless the
  app was completely rebuilt. This has been fixed, see API docs for more info.
 
**NEW** 
 
* The `FlexColorScheme.themedSystemNavigationBar` for styling the system navigation bar got a
  new convenience property `systemNavBarStyle` that takes a `FlexSystemNavBarStyle` enum with values:
  * `system` for default white system nav bar in light theme and black in dark theme mode.
  * `surface` the system navigation bar will be the same color as active theme `colorScheme.surface` color.
    If your FlexColorScheme definition is set to use primary branded surface and background colors, the
    same primary color blend that the surface color has received will be used.
  * `background` the system navigation bar will be the same color as active theme `colorScheme.background` color.
    If your FlexColorScheme definition is set to use primary branded surface and background colors, the
    same primary color blend that the background color has received will be used.
  * `scaffoldBackground` the system navigation bar will be the same color as active theme `scaffoldBackground` color.
    If your FlexColorScheme definition is set to use primary branded surface and background colors, the
    same primary color blend that the scaffoldBackground color has received will be used.
  * `transparent` an experimental feature. The goal is to make the system navigation bar fully transparent,
    showing the background, while navigation buttons float over the background. This feature only works if it is
    also configured in the Android embedder and on SDK 30 or higher.
    More information in this example: https://github.com/rydmike/sysnavbar
 
**EXAMPLES** 

* Added status bar scrim, system navigation bar divider,
  and navigation bar style toggles to example 5.
  These only work on Android builds and do not have any functionality on the live Web builds.

**TESTS**

* Added tests for the new features. Total 690 tests, coverage 99.75%.

## 2.0.0

**March 15, 2021**

## Overview

First stable release of FlexColorScheme with sound null safety.
Includes the changes from [2.0.0-nullsafety.1] and [2.0.0-nullsafety.2].
 
**BREAKING** 

* The by default enabled divider for `FlexColorScheme.themedSystemNavigationBar` has been
  revised to be disabled by default. To use a divider on the top of the system navigation bar on 
  Android, you have to enabled it manually. This is more in line with expected default behavior.

## 2.0.0-nullsafety.2

**March 15, 2021**

**BREAKING**

* Minor change to the none default `tooltipsMatchBackground: true` border style, it now uses
  the theme divider color as its default outline color.
* As stated earlier in the documentation, as a planned change for version 2.0.0, the sub theme for
  `FloatingActionButtonThemeData` was removed. It is thus now null, just as in a default Flutter ThemeData.
  It still produces the same theme as before, the ThemeData definition was just no longer needed to do so.
 
**NEW**

* The static helper `FlexColorScheme.themedSystemNavigationBar` received three new properties
  `noAppBar`, `invertStatusIcons` and `systemNavigationBarDividerColor`. The old property
  `nullContextBackground` was deprecated and replaced with `systemNavigationBarColor`. Example 5
  has been updated to show how and when these new features can be used.
 
**CHANGE**
* AppBar theming to use the implementation introduced in Flutter 2.0.0 instead of using
  its own custom implementation for the "white" app bar theme.
 
**TESTS**

* Number of tests increased from 639 to 661. Coverage 99.78%.
 
**DOCS**

* Added thumbnails to **Appendix A**. This pub.dev version is also to test the
  thumbnails work and how they look on pub.dev before stable 2.0.0 release.


## 2.0.0-nullsafety.1

**February 4, 2021**

### Overview

First dev version with null-safety. 

**BREAKING** 

* Removed the in version 1.3.0 deprecated `FlexSchemeSurfaceColors.themeSurface`, use
  `FlexSchemeSurfaceColors.surfaceStyle` instead.

**TESTS**

* Number of tests were reduced from 723 to 639, when all null related tests were removed.

## 1.4.1
 
**January 31, 2021**

**NEW**

* **New color schemes:** Added four new built-in color schemes.
  * **Barossa** - Barossa red and cardin green theme.
    Use enum value `FlexScheme.barossa` for easy access to it.
  * **Shark and orange** - Shark grey and orange ecstasy theme.
    Use enum value `FlexScheme.shark` for easy access to it.
  * **Big stone tulip** - Big stone blue and tulip tree yellow theme.
    Use enum value `FlexScheme.bigStone` for easy access to it.
  * **Damask and lunar** - Damask red and lunar green theme.
    Use enum value `FlexScheme.damask` for easy access to it.

* Semantics for the ThemeMode Widget buttons.

**TESTS**

* FlexThemeModeSwitch widget tests, makes and checks for system mode changes.
* More tests, totally 723 tests, codecov is now > 99.5%.
* **CI/CD:** Added GitHub actions to automate build and to publish the examples on the Web on a new release.

**EXAMPLES** 
 
* Minor changes to the examples. Modified to not need the `late` keyword when they are converted
  to null safe versions.

**DOCS**

* Added the new color schemes to the documentation.
* Minor typo corrections.

## 1.4.0

**January 18, 2021**

**NEW**
 
* Added convenience property `scheme` to FlexColorScheme factories light and dark. This a shortcut for
  using the built-in color schemes. The `colors` property can still be used as before. The `.light` and
  `.dark` factories no longer have any required properties. If `scheme` is not provided it defaults
  to `FlexScheme.material` and if both `scheme` and `colors` are provided, the scheme provided via `colors` prevail.
* Added experimental support for transparent system navigation bar for Android for SDK >= 30 (Android 11).
  The support is added via new `opacity` property in `FlexColorScheme.themedSystemNavigationBar`.
 
**EXAMPLES**

* Updated the simple example 1 to use the new `scheme` property, as in
  `theme: FlexColorScheme.light(scheme: FlexScheme.mandyRed).toTheme`.

* Added a separate example that builds
  on example 5, shows and explains how and when transparent system navigation bar can be used in Android. It also shows
  how to make it look nice when using primary color branded background color applied to the system
  navigation bar in Android, that is used when transparency is not supported. While if supported, your app otherwise
  uses a transparent system navigation. Please see this separate small stand-alone example Android project
  [**sysnavbar** on GitHub](https://github.com/rydmike/sysnavbar) for more information.
 
**TESTS**
* Added more tests, now 689 tests. All color values used are now also tested, any modification to them is considered
  a breaking change. A bit more tests would still be nice, for the ThemeModeSwitch Widget at least.
  Total test coverage > 98%, it will do for now.

**DOCS**

* Changed example one and the intro, to use the new simpler `scheme` property when using built-in schemes.
* Added a section that lists which sub-themes, and which of their properties, are NOT null when creating a theme data
  object with FlexColorScheme.toTheme.
* Removed the "back to content" link after each chapter. It was nice and worked fine on GitHub, but for some reason
  it did not on pub.dev.
* Tried finding and adding comments for the 3 missing API comments needed to reach 100% API
  documentation comments, not sure if it succeeded. I will see when the update is published.

## 1.3.0

**January 7, 2021**

**DEPRECATED**

* Marked `FlexSchemeSurfaceColors.themeSurface` as deprecated in favor of the correctly named
  `FlexSchemeSurfaceColors.surfaceStyle` version. The older `themeSurface` will be removed when
  null safe Version 2.0.0 is officially released as the main version.

**NEW**

* Added `Diagnosticable` mixin to classes `FlexSchemeOnColors`, `FlexSchemeSurfaceColors` and `FlexColorScheme`,
  that all also received proper identity overrides and `copyWith` methods.

**CHANGE** 
 
* Improved internal null safe behavior, with fall-backs values in some classes and helper functions.
  It might make migration to null-safety easier.

**TESTS**

* Added 389 tests. Coverage is 89% based on Codecov report. Will add more tests later, enough for now.
* The tests will make the migration to null-safety easier by providing some quality control checks.
* Added GitHub actions to run all the tests and automated test coverage analysis with Codecov.
 
**DOCS**
 
* Documentation improvements and API doc fixes.
  In previous version API-doc analysis says
  "441 out of 444 API elements (99.3 %) have documentation comments.". I have not been able to find any missing ones.
  The result from this update will only be seen after it has been uploaded, but I doubt it will change much. If
  somebody happens to find the missing doc comments let my know, the IDE analyzer does not find them either.

## 1.2.0

**January 4, 2021**

**NEW**
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

**EXAMPLES**

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

## 1.1.1

**December 31, 2020**

**NEW**

* Added a `defaultError` modifier that enables the built-in schemes to use the Material design guide's default dark
  error color when using the `toDark` method to compute a dark scheme from a light scheme.
  The `toDark` method can be used without the `defaultError` scheme modifier, but then the
  error color also changes with the other computed dark scheme colors when using `toDark` method
  and the level adjustment. This is not necessarily the desired behavior. The fix enables the alternative more often
  desired behavior and ensures that the dark error color just uses the default value. For custom schemes that do not
  specify a custom error color for their light scheme and thus default to the Material Guide's standard error color,
  the fix is not needed. Example 5 demonstrates the use case of `defaultError` as well.

**EXAMPLES**
 
* Updated example 5 to include UI that can be used to vary the computed dark themes white blend percentage level.
  This was added to better demonstrate the `toDark` feature.
 
**DOCS** 
 
* Major documentation review and updates.

## 1.1.0

**December 29, 2020**

**NEW**

* Added API to make a matching dark scheme from a light scheme. See
  [FlexSchemeColor.toDark](https://pub.dev/documentation/flex_color_scheme/latest/flex_color_scheme/FlexSchemeColor/toDark.html).
* Added a [showSystemMode](https://pub.dev/documentation/flex_color_scheme/latest/flex_color_scheme/FlexThemeModeSwitch/showSystemMode.html)
  property to [FlexThemeModeSwitch](https://pub.dev/documentation/flex_color_scheme/latest/flex_color_scheme/FlexThemeModeSwitch-class.html).
  It defaults to true. Set it to `false`, to exclude the system setting based theme mode option.
* Added static method [FlexColorScheme.comfortablePlatformDensity](https://pub.dev/documentation/flex_color_scheme/latest/flex_color_scheme/FlexColorScheme/comfortablePlatformDensity.html).
* Added static method [FlexColorScheme.themedSystemNavigationBar](https://pub.dev/documentation/flex_color_scheme/latest/flex_color_scheme/FlexColorScheme/themedSystemNavigationBar.html) that can be used to assist with theming the system navigation bar via an annotated region. See updated example 5, for a demo on how to use it.
* Added API property [FlexColorScheme.transparentStatusBar](https://pub.dev/documentation/flex_color_scheme/latest/flex_color_scheme/FlexColorScheme/transparentStatusBar.html) to allow opting out of the one-toned AppBar in Android.

**EXAMPLES** 

* All examples now use the new platform adaptive `FlexColorScheme.comfortablePlatformDensity` as their `visualDensity`
  setting. The Flutter default `compact` mode for desktop and web goes a bit overboard in its compactness. This
  optional setting presents an alternative where `comfortable` density is used on desktops and Web, while devices keep
  their standard visual density. Just omit the setting if you prefer Flutter's super compact Web and Desktop widgets.
* *Example 3:* excludes the system theme mode option, just to show this new feature of the switch.
* *Example 4:* includes all built-in schemes, plus 3 custom ones, including one where the dark scheme is made
  with the `toDark` method. Example 4 also includes a sub-page that can be opened to see the same theme on a new page.
* *Example 5:*  now includes an option make all the dark mode schemes with the `toDark` option, so it can be
  toggled and compared to the hand-tuned versions. The same custom color scheme as in example 4 are also included.
  Example 5 also has the same sub-page as example 4. Example 5 now also show how to solve the issue that the system
  navigation bar does not get color scheme and theme mode appropriate style in Android when we
  change the theme. This improvement is done with an `AnnotatedRegion` and the new static helper
  method `FlexColorScheme.themedSystemNavigationBar`.

**DOCS**

* Documentation updates and typo corrections.

## 1.0.0

**December 21, 2020**

* Version 1.0.0 released

**DOCS**

* Documentation layout updates and typo corrections.

## 1.0.0-dev.2

**December 21, 2020**

**BREAKING** 
 
* Made planned API name changes, SchemeOnColors -> FlexSchemeOnColors and
  SchemeSurfaceColors -> FlexSchemeSurfaceColors. These are lower level APIs that are
  only used when making custom on and surface colors.
  Changed ThemeModeOptionButton -> FlexThemeModeOptionButton, this is a lower
  level API that can be used when making more advanced custom theme selection
  controls that are based on the same button that the `FlexThemeModeSwitch` uses.
* Removed the constants that had no function in the public interface from the API.

**NEW** 
* Exposed planned configuration APIs for the FlexThemeModeSwitch and FlexThemeModeOptionButton.

**CHANGE**

* Removed legacy usage of deprecated ThemeData properties textSelectionColor, cursorColor
  and textSelectionHandleColor. They are no longer needed even for stable channel, they were
  useful earlier but not anymore, using only TextSelectionThemeData is
  enough in the latest stable version.

**DOCS**
 
* Documentation updates and corrections.
 

## 1.0.0-dev.1

**December 17, 2020**

* First development pre-release on pub.dev.


---

## Future Features

The topics on the list below were TODOs for this package prior to version 5.0.0 release.

Have a new suggestion and idea? Check the docs to see if it already exists in 
[future features](https://docs.flexcolorscheme.com/future_features). If not, feel free to open 
a suggestion in repo [discussions](https://github.com/rydmike/flex_color_scheme/discussions). 
There is also a project where active tasks being worked are 
[tracked](https://github.com/rydmike/flex_color_scheme/projects/1).

### TODOs

- [x] Created own documentation site for FlexColorScheme.
- [x] Version 5.0.0 Added a sub-theme for the `NavigationRail`.
- [x] Version 5.0.0 Added `SchemeColor` color selection to buttons and toggle buttons.
- [x] Version 5.0.0 Added support for Material.
- [x] Version 5.0.0 Added AppBar with optional `SchemeColor` based color selection.
- [x] Version 5.0.0 Added `SchemeColor` selection to TabBar
- [x] Version 5.0.0 Added `SchemeColor` color selection to the Floating Action Button sub-theme.
- [x] Version 4.2.0 support making themes from standard ColorScheme. More customization of sub-themes. Support for M3 NavigationBar and sub-theming it, and a default that matches FlexColorScheme styles.
- [x] Version 4.0.0 Docs with quick start example first.
- [x] Version 4.0.0 Added a more complex example that also persists theme.
- [x] Version 4.0.0 Added API offering more flexibility and customization capabilities to the surface color branding.
- [x] Version 3.0.0 Deprecated `accentColor`. Swap primary and secondary colors feature added. Added 4 new color schemes.
- [x] Version 2.0.0 Release official null-safe version, when nullsafety is available in Flutter stable channel.
- [x] Version 2.0.0-nullsafety.2: Minor new APIs and features added. Example 5 updated.
- [x] Since [#71184](https://github.com/flutter/flutter/pull/71184) landed in Flutter 2.0.0. The past custom "white" AppBarTheme implementation was as planned changed to the new one that is supported by the SDK.
- [x] Version 2.0.0-nullsafety.1 released
- [x] Version 1.4.1 Added automated build and publish pipes for the Web examples!
- [x] Version 1.4.1 More tests, tests are now considered sufficient for current features.
- [x] Version 1.4.0: Increased unit and widget test to 689 tests. All color definitions are now also tested to ensure they will not be changed by any accidental edit. Test coverage is higher than 95%, certainly sufficient for this type of package, but there are still some areas that could and will be improved.
- [x] Version 1.3.0: Added 195 unit and widgets tests, mostly unit tests.
- [x] API to assist with themed annotated region for system navigation bar theming.
- [x] API to opt-out from one-toned AppBar and return it to Android's default two-toned.
- [x] Add API that allows us to use an additional extra color definition for ThemeData.accentColor to easily make themes with custom input border color in dark-mode.
- [x] Add API the can create the dark scheme based on a light scheme's colors.
- [x] Release version 1.0.0 on pub.dev.
- [x] Review and correct documentation mistakes and typos, first pass anyway.
- [x] Review and update the API.
- [x] Publish live Web versions of the five examples.
- [x] Complete the documentation.
- [x] Release first version 1.0.0-dev.1 publicly on GitHub and pub.dev.

### Was maybe, now obsolete

These maybes were on the PLANNED agenda earlier, however for version 5
and Material 3 the correct alternative was to replace swatches with the
Material 3 design based color utilities called
[material_color_utilities](https://pub.dev/packages/material_color_utilities)
that the Flutter SDK also depends on.
While I don't like adding a none SDK library to the package, if Flutter SDK
uses it as well, then why not. It would still be nice to have the actual
Material 2 swatch algorithm in Dart as well, then we could:

- [ ] Use actual Material 2 color shades when a Material color is selected as primary color, for its light/dark shades. 
- [ ] For this we need to find and use the color algorithm Google uses on its Material colors site [here](https://material.io/design/color/the-color-system.html#tools-for-picking-colors) and [here](https://material.io/resources/color/#!/?view.left=0&view.right=0&primary.color=582aed&secondary.color=00B0FF).
- [ ] The algorithms for them are actually even a bit different. The second link also
  seems to imply that color schemes should have had primary and secondary colors,
  with light and dark variants. Instead of using just one variant color, like
  past `ColorScheme` class in Flutter did. This of course all changed with
  the updated Material 3 ColorScheme, that deprecated the variant colors.
  As for the actual old Material 2 swatch algorithm see these sources:
  https://stackoverflow.com/questions/32942503/material-design-color-palette
  Starting points here:
  - https://github.com/eugeneford/material-palette-generator
  - https://github.com/mbitson/mcg/issues/19
  - https://github.com/edelstone/material-palette-generator
