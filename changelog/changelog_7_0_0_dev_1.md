### Archived changelog entry

> The Dart package site [pub.dev](https://pub.dev/) restricts the size of the main [CHANGELOG.md](https://github.com/rydmike/flex_color_scheme/blob/master/CHANGELOG.md) file size to maximum 128kB. To work around this limitation, older changelogs and dev release changelogs have been moved into individual files linked from the main changelog.

## 7.0.0-dev.1

**Jan 23, 2023**

This major release does not contain any breaking API changes. However, the major version is bumped because some past styles and defaults, when opting in on Material 3 have been tuned to better align with new Material 3 widgets and design in the **Flutter 3.7** release. The new features are also significant.

Requires Flutter beta 3.7.0-1.4.pre or later.

**NEW**

- Added 12 new Material 3 color schemes: `redM3`,`pinkM3`, `purpleM3`, `indigoM3`, `blueM3`, `cyanM3`, `tealM3`, `greenM3`, `limeM3`, `yellowM3`, `orangeM3` and `deepOrangeM3` for a total of **52 built-in** light and dark theme pairs. These schemes work well in Material 3 with or without seed generation. But using FCS advanced and flexible key color-based seed generation is recommended when using Material 3. You can always lock e.g. primary and tertiary color to the color values you used, typically brand colors, as key colors for the seed generation.

- Added support for new `ColorScheme` colors `scrim` and `outlineVariant`.

- Added support for `fontFamilyFallback` and `package`, so a `copyWith` on `FlexColorScheme` generated `ThemeData` is not needed to use them.

- Added support for Material 3 buttons `FilledButton` and `FilledButton.tonal`.
  - Supported via `FlexSubThemes.filledButtonTheme` that is controlled via `FlexSubThemesData` properties `filledButtonRadius`, `filledButtonSchemeColor` and `filledButtonTextStyle`.
  - When setting up theming for `FilledButton` it was noticed that variant `FilledButton.tonal` cannot be themed separately, see issue: https://github.com/flutter/flutter/issues/115827.

- Added option to keep using the M2 style Divider in M3. The in M3 used primary color tinted outlineVariant does not fit on any color. The M2-style based on black or white with opacity does. It is also less prominent than the M3 style and may be preferred. Set `FlexSubThemesData` property `useM2StyleDividerInM3` to true to use the M2 style in M3. Defaults to false.
  - FlexColorScheme also sets `ThemeData.dividerColor` to `ThemeData.colorScheme.outlineVariant` when `ThemeData.useMaterial3` is `true`. This keeps the in Flutter SDK to be deprecated `ThemeData.dividerColor` always same as actually used effective `Divider` color. Thus, if an app uses `Theme.of(context).dividerColor` while it still exists, to set a color to it, and expects it be the same color as effective `Divider` color, it will be so in FCS, regardless of if M2 or M3 is being used. This is not the case in Flutter SDK by default, see issue https://github.com/flutter/flutter/issues/117755 for more information.

- Added `elevation` to `FlexSubThemes.timePickerTheme`, and make it use the dialog shared `FlexSubThemesData.dialogElevation` setting. This property works with the Flutter master channel, but does not yet exist in Flutter beta 3.7.0-1.4.pre. It was commented out of this released based on Flutter beta. It is unsure if it will land in the next stable Flutter, it probably will not. If it does not land, it will remain commented in next FCS7 stable release as well. Its addition will have to be left pending inclusion in the following Flutter stable release, probably in 3 to 4 months.

- Added boolean `tintedDisabledControls` to `FlexSubThemesData`. If set to true, disabled widgets will get a hint of primary color or their active main color, when disabled. In future minor versions, this will also apply to components that use own themed settings for disabled color, not only to the ones where disabled color is controlled by `ThemeData.disabledColor`. Previously tinted disabled color for `ThemeData.disabledColor` was included and defined when `FlexSubThemesData.interactionEffects` was set to true. It is now instead controlled by this separate tinted disabled-controls setting. Defaults to true, for an FCS opinionated default. This matches past default when it was included in `FlexSubThemesData.interactionEffects`.

- Added boolean `inputDecoratorFocusedHasBorder` to `FlexSubThemesData`. Defaults to true. If set to false, there is no border on the `InputDecorator`, typically used by text fields, when the input decorator is focused. It controls the new parameter `focusedHasBorder` in `FlexSubThemes.inputDecorationTheme`.

- Added `SchemeColor` value `inputDecoratorBorderSchemeColor` to `FlexSubThemesData`. It is used to define and customize the border color of `InputDecorator` on e.g. TextField. It controls the new parameter `borderSchemeColor` in `FlexSubThemes.inputDecorationTheme`.

- Added `appBarTheme` and `tabBarTheme` to `FlexSubThemes`.

- Added Material 3 styling to `TabBar` when M3 is used. Use `FlexTabBarStyle.flutterDefault` to get the SDK default colors in M3 mode. `TabBar` may get more configuration options in the next FCS version.

- Added `double` value `appBarScrolledUnderElevation` to `FlexSubThemesData`. It is used to define and customize the themed scrolled under elevation of the `AppBar`. It controls the new parameter `scrolledUnderElevation` in `FlexSubThemes.appBarTheme`.

- Added `SchemeColor` value `toggleButtonsUnselectedSchemeColor` and `toggleButtonsBorderSchemeColor` to `FlexSubThemesData`. They are used to define and customize the themed unselected button and border color of `ToggleButtons`. They control the new parameters `unselectedSchemeColor` and `borderSchemeColor` in `FlexSubThemes.toggleButtonsTheme`.

- Added `SchemeColor` value `sliderIndicatorSchemeColor`, and enum `FlexSliderIndicatorType` value `sliderValueIndicatorType`, plus enum `ShowValueIndicator` value `sliderShowValueIndicator` to `FlexSubThemesData`. They control the new parameters `valueIndicatorColor`, `valueIndicatorType` and `showValueIndicator` in `FlexSubThemes.sliderTheme`.

- Added `SchemeColor` value `drawerBackgroundSchemeColor` and double values `drawerRadius`, `drawerElevation` to `FlexSubThemesData`. They control the new parameters `backgroundSchemeColor`, `radius` and `elevation` in new sub-theme `FlexSubThemes.drawerTheme`.

- Added `menuTheme` to `FlexSubThemes`, it provides styling for elevation, radius and background color with optional opacity for the new Mw components `MenuAnchor`, `MenuBar` and `DropDownMenu`. The same `FlexSubThemesData` that are used for `PopupMenuButton` are used to control this theme. Those are `popupMenuRadius`, `popupMenuElevation`, `popupMenuSchemeColor`, and `popupMenuOpacity`.

- Added `timePickerElementRadius` to `FlexSubThemesData` that can be used to control `elementRadius` in `FlexSubThemes.timePickerTheme`, it changes the themed border radius of the time input entry elements.

- Added `segmentedButtonRadius`, `segmentedButtonSchemeColor`, `segmentedButtonUnselectedSchemeColor`, `segmentedButtonBorderSchemeColor` and `segmentedButtonBorderWidth` to `FlexSubThemesData` they control the equivalent properties in the new `FlexSubThemes.segmentedButtonTheme` used to customize the `SegmentedButton`.

**CHANGE**

- **Style breaking**: Tinted disabled components style.   
  Style change on tinted disabled components when opting in on `tintedDisabledControls`. It is visually breaking, but subtle. Disable opacity alpha and alpha blend constants where tuned, kDisabledAlphaBlend from 0xAA (67%) to 0xCC (80%) and kDisabledBackgroundAlpha from 0x31 (19%) to 0x26 (15%). The new tinted disable colors look better. They are close in style to default grey ones, with a subtle primary tint, while still being more legible than in previous versions. Opting in on tinted disabled components is still not yet available on all components. It is more available in M2 mode. In upcoming minor releases, tinted disabled components will be made available on all themed components and consistently applied in both M2 and M3 mode. More visual tuning of this feature may be required in later releases.


- **Style breaking**: `BottomAppBar` color.   
  Changed FlexColorScheme default `BottomAppBar` color to be `colorScheme.surface`, same as Flutter default. Previously FlexColorScheme used `colorScheme.background` color as an opinionated default. The change is minor, and in many designs the color values are the same.


- **Style breaking**: Error colors in M2 for `materialBaseline`, `verdunHemlock` and `dellGenoa`.   
  Previously existing native Material 3 color schemes, `materialBaseline`, `verdunHemlock` and `dellGenoa` were changed to use Material 3 error colors, also in Material 2 mode and when not using seed colors.


- Removed in version 6.1.0 included manual M3 elevation tint for `BottomSheet` and `PopupMenuButton`. In Flutter 3.7.0, the tint is included automatically as it should be and workaround is not needed anymore.

- The `ListTileThemeData` was added to core defaults. It sets `ListTileThemeData.tileColor` to `Colors.transparent` if `ThemeData.useMaterial3` is true. This is done to avoid issue: https://github.com/flutter/flutter/issues/117700. This extra M3 core default theme fix will be removed as soon as the issue is fixed.

- Changed `FlexColorScheme.bottomAppBarElevation` to be nullable. In M2 mode if is null, it follows defined `appBarElevation` as before. In M3, it is kept null in order to default to M3's default elevation of 3, so that `BottomAppBar` get elevation tint by default. Not considered style breaking because `BottomAppBar` was not supported before in M3. In M3 mode a minor spec deviation was noted in Flutter SDK and reported here https://github.com/flutter/flutter/issues/118150.

- The Material buttons `ElevatedButton`, `OutlinedButton` and `TextButon`, now only create custom sub-theme properties in Material 3 mode when using none default (none null) values. Previously, they created sub-themes for some properties corresponding to the default values. This task now falls to the role of default widget behaviour, as it should. Effective styles are unchanged.


- When making seed generated `ColorScheme` with a custom `surfaceTint` color. This tint color is now also used as seed-key for the neutral and neutral variant tonal palettes. Flutter SDK can only use
  primary color as seed-key for the neutral colors. This limitation in Flutter makes using a custom `surfaceTint` in seeded `ColorSchemes` less usable with often unappealing results. This happens because the custom tint color then differs from the slight `primary` tint that is hard coded into Flutter's seeded neutral colors used for surfaces and backgrounds, and the colors may clash. In FlexColorScheme the custom tint color is automatically also used to slightly tint the neutral colors used for surfaces and backgrounds in the seed-generated `ColorScheme`. The same color is then also used as `ColorScheme.surfaceTint` color. This makes the custom elevation tint color match the custom seed-tinted surface and background colors. This feature is enabled by the [FlexSeedScheme package](https://pub.dev/packages/flex_seed_scheme) starting from version 1.2.0-dev.1. When using a custom `surfaceTint` color, the same color is also used as the surface alpha blend color, when using `SurfaceMode` and `blendLevel` to adjust surface color with or without using seed generated `ColorScheme`. Ensuring that neutral seed tint, elevation and surface blend color always match, as they should.

- Changed, or one could call it fixed `SnackBarTheme` action and close icon colors. They are now also themed automatically to fit on selected SnackBar color.

- The boolean `FlexSubThemesData.interactionEffects` no longer modifies `ThemeData.disabledColor`. This part of the control is now instead controlled separately by `FlexSubThemesData.tintedDisabledControls`.

- The `InputDecorationTheme`, can now be configured to match Material 3 for critical styles if so desired. It uses a few opinionated values that give it a slightly different style by default. It can be configured to match M3 defaults if so desired. FCS does one opinionated adjustment to error border and suffix icon. It keeps them `error` colored on unfocused-hovered error state, instead of `onErrorContainer`. The M3 default looks odd. This FCS change is considered an opinionated M3 style fix in FCS. The M3 default of setting unfocused hovered error floating label also to `onErrorContainer`, is also keeping FCS own past style `error.withAlpha(0xA7)`, which looks more refined. There is currently no way to set these settings back to the M3 default style within FCS. You can of course as always adjust them and anything with `copyWith` on produced `ThemeData` if needed.

- Added M3 slider support with correct `DropSliderValueIndicatorShape` in M3 mode.

- Added theming for `TimePicker` that corrects Flutter SDK issue https://github.com/flutter/flutter/issues/118657 when using FCS component sub-themes.

- Made `tabBarStyle` in `FlexColorScheme`, `FlexColorScheme.light`, `FlexColorScheme.dark`, `FlexThemeData.light` and `FlexThemeData.dark` nullable and null by default. In M2 mode `tabBarStyle` defaults to `FlexTabBarStyle.forAppBar` as before. However, in M3 mode, if not defined, it defaults to `FlexTabBarStyle.flutterDefault`, producing a style matching M3 default TabBar.

**THEMES PLAYGROUND**

**NEW**

- Add UI to set elevation and background color of modal and none modal `BottomSheet` independently.
- Removed used `Typography` workaround in Playground app. Workaround was used before due to issue https://github.com/flutter/flutter/issues/103864 that is now fixed in Flutter by https://github.com/flutter/flutter/pull/110870.
- Improved codegen for used Typography selection, it is now only shown when needed.
- Improved codegen for when FlexColorScheme is not used at all. It can now use the setting for using Material 3 and Typography. It still does not support generating code for the active `ColorScheme`, when FCS is **not** in use.
- Added UI for theming `FilledButton` and `FilledButton.tonal`, see issue: https://github.com/flutter/flutter/issues/115827 for info on current theming limitations in the SDK for these new buttons.
- Added UI for `useM2StyleDividerInM3` to panel **Component Themes** with name "Use Material 2 styled Divider in Material 3". Playground defaults this setting to ON (true), but default in API is false. Rationale for keeping it on in the Playground when using component sub-themes; it just looks better than M3:s new default (opinionated). When using M3 and FCS component themes, for a true M3 styled `Divider`, turn OFF the setting.
- Added showing `SegmentedButton` in panel **Selection Buttons** and to **Widget Showcase**.
- Added settings for `SegementedButton` to control its colors, border radius and width.
- Added showing `Drawer` and `NavigationDrawer` in the new **Drawer** panel and to the **Widget Showcase**. Also added controls to theme color, border radius and elevation of the `Drawer`. The border radius follows the global border radius setting if it is used.
- Added showing `BottomAppBar` in panel **AppBar** and also to the **Widget Showcase**.
- Added `BottomAppBar` elevation setting to Playground in panel **AppBar**.
- Added showing new M3 `DropdownMenu` in panel **Text Field**, **Menu** and to **Widget Showcase**.
- Added showing new M3 `MenuBar` in panel **Menu** and to **Widget Showcase**.
- Added showing new M3 `MenuAnchor` in panel **Menu** and to **Widget Showcase**.
- In panel **Menu** the previous controls for `PopuMenuButton` now also control the menu style of `DropdownMenu`, `MenuBar` and `MenuAnchor`.
- Added setting for focused `TextField` has a border to panel **Text Field**.
- Added setting for border color selection of `TextField` to panel **Text Field**.
- Added setting for alpha control of `TextField` background color to panel **Text Field**.
- Added a button in panel **Text Field**, that can set `TextField` settings to match M3 default style.
- Added setting for scrolled under elevation of `AppBar` to panel **AppBar**.
- Added settings for unselected button and border colors for `ToggleButtons` to panel **Toggle Buttons**.
- Added showing `RangeSlider` in panel **Slider** and to **Widget Showcase**.
- Added settings for `Slider` value indicator color, visibility and value indicator type.
- Added setting for time picker input element border radius to pane **Dialogs**.


**FIX**

- ListTiles in the Themes Playground App must use and set transparent `tileColor` in M3, until a fix for https://github.com/flutter/flutter/issues/117700 lands via https://github.com/flutter/flutter/pull/117965. By doing this the ListTiles in the app will look OK also when FlexColorScheme theming is not used, even if issue #117965 might still be in effect. May not need this work around in V7.0 release if the issue does not land in new Flutter stable after 3.3, follow-up.

- Fixed Material Showcase surface tint and shadow presentation to support changes in `Material` in Flutter release.
