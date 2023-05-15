### Archived changelog entry

> The Dart package site [pub.dev](https://pub.dev/) restricts the size of the main [CHANGELOG.md](https://github.com/rydmike/flex_color_scheme/blob/master/CHANGELOG.md) file size to maximum 128kB. To work around this limitation, older change entries have been moved into individual files linked from the main changelog.

## 6.0.0-dev.1

**Aug 28, 2022**

This dev release is for Flutter *beta 3.3.0-0.5.pre*, it will be released when next Flutter
stable version after 3.0 comes out, presumably version 3.3.

If you experiment with this dev release and want to use the Theme Playground, then please use the
version 6 beta build, [**here**](https://rydmike.com/flexcolorscheme/themesplayground-v6). The doc
site does not yet contain any information about version 6, it will be added after its stable
release.

The change list below is identical to final 6.0.0 all changes were included in the release.

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

As a chore and clean up all previously deprecated members have been removed from version 6.0.0. It
no longer has any self deprecated members. This removes a lot legacy backwards compatibility with
deprecated members from versions 2, 3 and 4, and even one from version 5.1.0. Removed all earlier
self deprecated members as follows:

* *FlexSubThemesData:*  
  `inputDecorationRadius`, `bottomNavigationBarSchemeColor`,
  `navigationBarIsStyled`, `navigationBarTextSchemeColor`, `navigationBarMutedUnselectedText`,
  `navigationBarIconSchemeColor`, `navigationBarHighlightSchemeColor`.
* *FlexColorScheme:*  
  `primaryVariant`, `secondaryVariant`, `useSubThemes`. Removed static `FlexColorScheme.m3TextTheme`
  deprecated in 5.1.0 and static `FlexColorScheme.themedSystemNavigationBar` in version
  2 its deprecated parameter `nullContextBackground`.
* *FlexThemeData:*  
  `primaryVariant`, `secondaryVariant`, `useSubThemes`.
* *FlexSchemeColor:*  
  `primaryVariant`, `secondaryVariant`.
* *SchemeColor:*  
  `primaryVariant`, `secondaryVariant`.
* *FlexConstants:*  
  `kDarkenSecondaryVariant`, `kDarkenSecondaryVariantFromSecondary`, `kDarkenPrimaryVariant`.
* *FlexSubThemes.bottomNavigationBar:*
  `baseSchemeColor`.
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

* The opt-in opinionated tinted text themes were made less aggressive on the tint, and received a
  bit of opacity for styles that in 2014/2018/2021 styles have opacity. The custom styles uses
  significantly less opacity since they already also get alpha blended tint color applied.
  Combining it with same level of opacity would make them too low contrast.

* Style **fix**, the main text theme uses `surfaceTint` color instead of `primary` when tinted text
  theme is enabled. By default `surfaceTint` equals `primary`, but if theme `surfaceTint` is set
  to use a custom color, the for surface tinted textTheme is now also based on it, to fit the
  custom tinted surfaces. The primary text theme, that fits on primary color, still
  uses `primary` color as its tint color.

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
  now results in a more upcoming M3 styled `TextField` style by default, instead of its own more
  opinionated custom style, also when the opinionated component sub-themes are enabled.
  It still uses a touch a lot of its own style in M3 mode, because TextField's real M3 design is
  not yet available in Flutter 3.3. TextField FCS opinionated style, combined with M3 real defaults,
  will need more work on M3 styles after
  ["Migrate TextField to Material 3"](https://github.com/flutter/flutter/pull/108366) lands in
  stable channel.   
  The M3 alignment of FCS `InputDecoration` planned adjustments are:
    - Use same error container color idea for FCS default that M3 uses, could be OK for all modes.
    - Option to use FCS component defaults on fill colors and disabled colors, also when
      opting in on M3. These FCS defaults can provide a nice alternative also when opting in on M3,
      but should not force it on M3 unless asked for.

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
  defines its appropriate color value for `ThemeData`.


**EXAMPLES**

* *Themes Playground:* New feature, the used code highlight colors were added as colors in
  a `CodeTheme` class `ThemeExtension` to `ThemeData`. To demonstrate how one can use theme
  extensions directly with FlexColorScheme as well, in this case to add custom semantic colors
  for the code view's code keyword highlighter. Additionally, a fancy Material 3 feature was added,
  color harmonization of custom colors. The process is described in M3 guide under
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
  settings that have no impact when using seeded color schemes.

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

* [**#107305**](https://github.com/flutter/flutter/issues/107305) Regression: `AppBarTheme` properties `iconTheme` and `actionsIconTheme` ignored on master channel when `useMaterial3` is true. This was not in stable Flutter channel *stable 3.0.5*. This issue was fixed via [PR #108332](https://github.com/flutter/flutter/pull/108332) and could no longer be observed in *master, 3.1.0-0.0.pre.2108* or later versions. The fix did however not make it into  Flutter stable 3.3.0 and now exists there. The issue must be re-opened or a new one submitted.

* This issue discussed in SliverAppBar.medium and large [PR #103962](https://github.com/flutter/flutter/pull/103962#issuecomment-1224269768), now exists in stable channel. There is no open issue for it yet.