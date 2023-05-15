### Archived changelog entry

> The Dart package site [pub.dev](https://pub.dev/) restricts the size of the main [CHANGELOG.md](https://github.com/rydmike/flex_color_scheme/blob/master/CHANGELOG.md) file size to maximum 128kB. To work around this limitation, older changelogs and dev release changelogs have been moved into individual files linked from the main changelog.

## 7.0.0-dev.3

**Mar 18, 2023**

This is **the final beta v7** release before **stable v7**. There will be no new features or API changes in the FlexColorScheme package from this version to stable version 7.0.0. The only changes to stable will be potential bug fixes, typo corrections, API doc comment improvements and adding more tests.

The companion app **Themes Playground**, may get label improvements plus spelling and grammar corrections. Layouts in it may also be modified and improved as needed. It will not get any new features, but it may of course receive bug fixes.

The **Themes Playground** app built for this **beta** release is unfortunately not a SKIA renderer build, it is using the HTML renderer. This makes it less performant than the app would otherwise be. Additionally, scaled content, like the **Themes Simulator** panel in the **Playground**, is also fuzzier than it would be with the SKIA renderer. Due to an issue in Flutter stable (3.7.7), builds made with the SKIA renderer performs very poorly and crashes quite quickly. For more information see Flutter [issue #122189](https://github.com/flutter/flutter/issues/122189). Hopefully, before the stable v7.0.0 release, a fix will be available. If not, a new build using the same package version will be made later and released when a fix is available.


**FIX**

- Fixed **bug** in legacy theme secondary and tertiary color swapping when using seed generated ColorScheme. In dark mode, combining legacy swapping and seed generation did not swap secondary and tertiary colors for schemes where it should do so. This is now fixed. If seed generation was not used, the swapping worked correctly in dark mode. In light mode it worked correctly also when seed generated schemes were used. The `swapLegacyOnMaterial3` feature was introduced in version 6.1.0, it has had this bug for this case since it was introduced.

- Fixed **bug** where `FlexSubThemes.drawerTheme` was using `BorderRadiusDirectional.horizontal` with `end` radius instead of `start` radius as its `endShape`. This bug was introduced by version 7.0.0-dev.1 and has not been in any stable version.

- The `FlexThemeModeOptionButton` now correctly displays its `hoverColor`, previously it was obscured by the colored boxes inside it.

- The [systemNavigationBarDividerColor issue #100027](https://github.com/flutter/flutter/issues/100027) in Flutter that in FCS v5 forced removing support for divider on the system navigation bar in Android, that was available via `FlexColorScheme.themedSystemNavigationBar` has been fixed. The issue could no longer be observed on Android versions 8 to 13 on Flutter 3.7.7 stable. The divider has been enabled again, and its test setting is also available in the **Themes Playground** app again. The extra `SystemUiOverlayStyle` call used as a work-around, for the same issue to fix an issue with Android 11, has also been removed, since the workaround was no longer needed.

- Fixed a **bug** where when passing in a custom `textTheme` or `primaryTextTheme`, instead of defining text theme via `fontFamily`, that FCS tinted text feature, via `subThemesData.blendTextTheme`, was not being correctly applied to the custom text themes. This is now fixed. If `subThemesData.blendTextTheme` is not being used, then the used Typography, either via `subThemesData.useTextTheme`, or by using a custom `FlexColorScheme.typography` override, always gets correct brightness for both `textTheme` and `primaryTextTheme`, regardless of brightness on passed in text themes. They also get the used Typography appropriate opacities on their text styles. In practice, this means that M2 style 2018 typography has opacity on some text styles, while M3 style 2021 typography, is fully opaque for all text styles.


**NEW**

- **Add**: `drawerIndicatorOpacity` to `FlexSubThemesData`.   
  It controls the `indicatorOpacity` property in the `FlexSubThemes.navigationDrawerTheme` used to customize the opacity of used color on the `NavigationDrawer` indicator.

- **Add**: `segmentedButtonUnselectedForegroundSchemeColor` to `FlexSubThemesData`.   
  It controls the `unselectedForegroundSchemeColor` property in the new `FlexSubThemes.segmentedButtonTheme` used to customize the `SegmentedButton`.

- **Add**:  `usedColors` value 7.
  In `FlexColorScheme` and `FlexThemeData` light/dark constructors, the `usedColors` now accepts value 7. When used, the `primary`, `secondary` and `tertiary` colors in the used input scheme, are used as defined, but `primaryContainer`, `secondaryContainer` and `tertiaryContainer` are computed. This is FlexColorScheme's own more Material2 version of seed generation of the container colors by using their main colors as input colors.

- **Add**: `bottomAppBarTheme`, `menuBarTheme` and `menuButtonTheme` to `FlexSubThemes`.

- **Add**: `inputDecoratorPrefixIconSchemeColor`, `drawerWidth`, `drawerIndicatorWidth`, `drawerIndicatorRadius`, `drawerIndicatorSchemeColor`, `navigationBarIndicatorRadius`, `navigationRailIndicatorRadius`, `menuBarRadius`, `menuBarElevation`, `menuBarShadowColor`, `snackBarActionSchemeColor` and `bottomAppBarSchemeColor` to `FlexSubThemesData`.

- **Add**: `menuRadius`, `menuElevation`, `menuOpacity`, `menuSchemeColor`  and `dropdownMenuTextStyle` to `FlexSubThemesData`.

- **Add**: `drawerSelectedItemSchemeColor`, `drawerUnselectedItemSchemeColor`, `tabBarIndicatorSize`, and `tabBarDividerColor` to `FlexSubThemesData`.

- **Add**: Static helper function `onSchemeColor` to `FlexSubThemes`.

- **Add**: To `FlexThemeModeOptionButton` added properties `semanticLabel`, `focusColor` and `setFocusOnTap`. If `setFocusOnTap` is set to true, the button will request focus when it is tapped. Display of previously not shown hover and focus effects where fixed, they now correctly use `hoverColor` and the new `focusColor`.

- **Add**: Property `snackBarRadius` to `FlexSubThemesData`, it controls the border radius via `FlexSubThemes.snackBarTheme` by using its `radius` property.
    - NOTE: If this property is set, both SnackBars with behavior fixed and floating will get the assigned radius. See Flutter issue: https://github.com/flutter/flutter/issues/108539

- **Add**: Properties `tabBarUnselectedItemSchemeColor`, `tabBarUnselectedItemOpacity`, `tabBarIndicatorWeight` and `tabBarIndicatorTopRadius` to `FlexSubThemesData`.

- **Add**: New configuration class `FlexAdaptive` used to configure on which platforms adaptive theming features are used. Including 100% unit test coverage for the new class.

- **Add**: Four new `FlexSubThemesData` properties that uses the `FlexAdaptive` configuration class, to configure the features `adaptiveRemoveElevationTint`, `adaptiveElevationShadowsBack`, `adaptiveAppBarScrollUnderOff` and `adaptiveRadius`. The `adaptiveRadius` controls if the `defaultRadiusAdaptive` is used as value for effective global border radius instead of `defaultRadius`.

- **Add**: Seven new `FlexSubThemesData` properties `menuBarBackgroundSchemeColor`, `menuPadding`, `menuItemBackgroundSchemeColor`, `menuItemForegroundSchemeColor`, `menuIndicatorBackgroundSchemeColor`, `menuIndicatorForegroundSchemeColor` and  `menuIndicatorRadius`.

- **Add**: Boolean property `useInputDecoratorThemeInDialogs` to `FlexSubThemesData`. Used to control if the application's themed input decoration is used or not, on time picker dialog theme text input fields. If not used, the time picker dialog uses null as input to its input decorator, in order to get the Flutter time picker default style. This toggle will also be used on date picker when/if it gets supported.


**CHANGE**

- **Style breaking**:  `FlexSubThemes.blendTextTheme` defaults to false.   
  In FCS before version 7, the default for `blendTextTheme` in `FlexSubThemes` was true, and blended text themes were used by default. Going forward if you want it, and also if you had not defined earlier and do not want to break your apps past style, set `blendTextTheme` to true.


- **Style breaking**: `Card` elevation default 1 dp.   
  The `Card` opinionated sub-theme now defaults to null elevation, resulting in same default of 1 dp elevation as Flutter SDK in both M2 and M3 mode. Previously, FCS defaulted to elevation 0 dp on `Cards` when opting in on sub-themes.


- **Style breaking**: `ColorScheme.outline` and `ColorScheme.outlineVariant`.  
  The FCS built-in computed none seeded values for `ColorScheme.outline` and `ColorScheme.outlineVariant` were modified. The new values are more in line with what you get with the M3 default seed algorithm, but plain grey-scale variants of them without any primary color blend. Technically light mode color for `outline` was changed from 30% lighten of light mode `onBackground` color to 45%, and `outlineVariant` from 60% lighten of `onBackground` to 75%. Likewise for the dark mode, but with darkening of the `onBackground` with the same percentage changes. The new values match the M3 design intent better.


- **Style breaking**: `lightSurfaceVariant` and `darkSurfaceVariant`.   
  FCS v7 introduces `FlexColor.lightSurfaceVariant` and `FlexColor.darkSurfaceVariant` colors that are used when making none-seeded ColorSchemes. The colors are plain not tinted light and greys, matching the grey level of the tinted versions you get with seed-generated M3 colors. The colors are used as defaults for light and dark `surfaceVariant` color in none-seeded versions of generated FlexColorScheme color schemes. In previous versions `surfaceVariant` was just white and black in light and dark theme mode. To be able to better match the M3 color system, without using seed generation, this surface color should not be just white or black. The new `surfaceVariant` corrects this past design to improve compatibility with the M3 color system when not using seed generated color schemes.


- **Style breaking**:  `NavigationBar`  
  Changed the default `NavigationBar` height from 62 dp to 80 dp. The 80 dp height is also the M3 spec default height for a Material 3 `NavigationBar` in Flutter. This makes the FCS default `NavigationBar` theme less opinionated compared to M3 spec. The FCS default background color is now using `surfaceVariant` in M2 mode, and defaults in M3 to its spec `surface` with elevation tint. The FCS M2 `surfaceVariant` default makes it look a bit more like the M3 mode surface with elevation tint. Especially if you use a seed-generated ColorScheme or FCS surface blends. This makes the FCS difference in style between M2 and M3 mode less than before. Since M2 does not support surface tint, it cannot match it exactly.
    - Using the M3 spec default height also avoids a Flutter SDK issue with using none default height. If you change the `NavigationBar` from M3 default value of 80 dp, the ink level moves up or down with same amount as the deviation from the default 80 dp height. See issue report and illustration here [FCS #114](https://github.com/rydmike/flex_color_scheme/issues/114) as well as in Flutter SDK issue [#117420](https://github.com/flutter/flutter/issues/117420). The issue is caused by a regression in Flutter 3.7.0 and 3.7.1. It does not exist in Flutter 3.3 and earlier. It is also fixed in the current master channel via [PR 117473](https://github.com/flutter/flutter/pull/117473). This fix has now been cherry-picked (CP) via [# 119553](https://github.com/flutter/flutter/pull/119553). This fix landed in Flutter hot-fix 3.7.2. To avoid the bug, upgrade to Flutter 3.7.2 or later.


- **Style breaking**: All component themes have null properties in M3 mode.   
  When enabling Material 3 and not enabling FCS sub-themes, and if no direct properties in FlexColorScheme raw constructor, or its light and dark factories are set in a way that requires creating a sub-theme to deliver the result, FlexColorScheme no longer creates any component sub-themes with none-null properties in Material 3 mode. In previous versions, it did so in a few cases. This is no longer required to deliver a nice starting point M3 theme, thanks to M3 now being almost fully supported in Flutter 3.7. When using FlexColorScheme with `useMaterial3` set to true and its other properties at default values, and not enabling sub-themes, all component sub-themes will have null by default properties in FCS, just like in plain `ThemeData`. When using Material 2, FlexColorScheme as before even when not enabling sub-themes, still creates core component themes listed under core default in the documentation. This is done for FCS legacy reasons, and to be able to deliver the default slightly opinionated M2 style it had before component sub-themes were a part of its offering.  
  **Impact**: The impact of this style breaking change is only visible on the Material 2 type `BottomNavigationBar` in dark mode. When using the M3 mode, its dark mode icons have changed to the Flutter default style. When you opt in on FCS sub-themes in the M3 mode, it gets the same icon color as before, like it still gets in the M2 FCS style, with or without sub-themes enabled. Since the `BottomNavigationBar` is a Material 2 component, this should be less relevant in the M3 mode. With component themes on, it looks as before.  
  **Note**: Later when `theme.scaffoldBackgroundColor` and maybe also some other colors in current `ThemeData` are deprecated, FlexColorscheme will need to set those colors in their own sub-theme, also in M3 mode to be able to continue to deliver e.g. surface blends that impacts the scaffold background color separately from ColorScheme colors. Currently, it does this via `theme.scaffoldBackgroundColor` without using a component theme.


- **Style breaking**: The `SnackBar` action button defaults to `inversePrimary`.   
  The `SnackBar` theming got property `snackBarActionSchemeColor` in `FlexSubThemes`. It defaults to M3 default `inversePrimary`. Earlier FCS used its foreground color with alpha 0xDD for the action button text color. Flutter's M2 defaults are poor designs and not very usable, but new Flutter M3 defaults are fine. As before, FCS uses a custom default style to fix M2 when using sub-themes. The M3 mode default is also opinionated, to make it match M3 defaults, set `FlexSubThemes.snackBarBackgroundSchemeColor` to `SchemeColor.inverseSurface`. By default, it uses the same style as its opinionated M2 style, which is `onSurface` alpha blended with primary and opacity, both alpha blend and opacity are different in light and dark theme mode. This was kept as the default also in M3 mode, so it can be used as an option there as well. If you want the pure M3 style, select `inverseSurface` instead. This part of the style is same as before so not style breaking, only `SnackBar` action button got a new default text color, that can be themed to any `ColorScheme` based color.


- **Style breaking**: Tinted TextTheme was made less obviously tinted. M3-seeded ColorSchemes brings color tint to themes, if then also using tinted text, via the optional tinted TextTheme, is becomes too much. It is now more subtle and more usable also with seeded ColorSchemes. The changes are:
    - TextTheme light mode:
        - Hi opacity style:  Blend 30% -> 20%, Opacity 75% -> 85%
        - Medium opacity style: Blend 26% -> 20%, Opacity 95% -> 96%
        - No opacity style: Unchanged.
    - TextTheme dark mode:
        - Hi opacity style:  Blend 25% -> 15%, Opacity 80% -> 92%
        - Medium opacity style: Blend 20% -> 12%
        - No opacity style:  Blend 18% -> 15%


- **Style breaking**: FlexColorSchemes own algorithm to compute light and dark theme container colors from their main colors, was modified to align better with expectation by the M3 color system. The changes are:
    - In light theme mode:
        - Primary container: primary.blend(Colors.white, 60) -> primary.lighten(20).blend(Colors.white, 60)
        - Secondary container: secondary.blend(Colors.white, 60) -> secondary.brighten(14).blend(Colors.white, 50)
        - Tertiary container: tertiary.blend(Colors.white, 80) -> tertiary.brighten(18).blend(Colors.white, 50)
    - In dark theme mode:
        - Primary container: primary.blend(Colors.black, 60) -> primary.darken(5).blend(Colors.black, 55)
        - Secondary container: secondary.blend(Colors.black, 60) ->  secondary.darken(25).blend(Colors.black, 50)
        - Tertiary container: tertiary?.blend(Colors.black, 80) -> tertiary.darken(15).blend(Colors.black, 60)


- **Style breaking**: The border radius on `ToolTip`, `PopupMenuButton`, `DropDownMenu` and `Menu` no longer follow the global override for `defaultRadius`. These items should generally not be themed together with a large general radius override. They can still be modified individually.


- **API default value breaking**: The `unselectedIsColored` parameters in `FlexSubThemes` functions `switchTheme`, `checkboxTheme` and `radioTheme` was changed to be nullable and to default to `false` if not defined. Previously, they were not nullable and defaulted to `true`. If you have not used these `FlexSubThemes` functions directly, typically they are not used directly, then this change has no impact on resulting themes, since `FlexSubThemedata.unselectedToggleIsColored` defaulted to `false` earlier as well, and set these sub-theme values to false by default, or true when so defined.


- **Label value breaking**: The `FlexColor.materialBaselineName` name string was changed from 'M3 baseline' to 'Material 3 purple'.
- **Label value breaking**: The `FlexColor.materialBaselineDescription` description string was changed from 'Material guide 3 baseline based theme' to 'Material 3 guide and default purple theme'.

- **Style breaking**: The boolean `FlexSubThemesData.interactionEffects` now correctly control if color-tinted interaction effects for hover, focus, highlight, pressed and splash are used. The setting affects both M2 and M3 mode, and all in FCS covered component themes, to the extent that the Flutter SDK supports changing their interaction effects. All components have new tinted interaction effects, that are used when setting this property to true. When it is false, all components use Flutter SDK default grey styles.

- **Style breaking**: In Material 2 mode the `InputDecorator`'s border radius default value was changed from 16 to 10, to be less rounded by default.


- **Style breaking**: The boolean `FlexSubThemesData.tintedDisabledControls` now correctly control if color-tinted disabled widgets are used. The setting affects both M2 and M3 mode, and all in FCS covered component themes, to the extent that the Flutter SDK supports changing their disabled color. All components have new tinted disabled styles, that are used when setting this property to true. When it is false, all components use Flutter SDK default disabled grey styles.


- **Style breaking**: The `ToggleButtons` theme has a slightly changed style in both M2 and M3 mode. It now also correctly reacts to `FlexSubThemesData.interactionEffects` and `FlexSubThemesData.tintedDisabledControls`. The slight change of past theme was needed to support this.


- **Minor style breaking**: The FlexColorScheme `TimePicker` dialog style in M3 mode was changed. It is now styled closer to the Material 3 specification. It is also closer to correct M3 style than Flutter is in version 3.7. When Flutter fully supports `TimePicker` M3 theming in the stable channel, FCS will use its native styling as its default too.


- **API breaking**: In `FlexSubThemes` the `floatingActionButtonTheme` and `timePickerTheme` now require the `colorScheme`, previously it was optional in both. Unless you have used `FlexSubThemes.floatingActionButtonTheme` or `FlexSubThemes.timePickerTheme` directly as helpers to make custom component themes with them, and not as typically used via `FlexSubThemesData`, you will not notice this breaking API change.


- **API default value breaking**: The `FlexSubThemesData` property `useTextTheme`, is now nullable and defaults to null. Previously it was not nullable and defaulted to false. As before, this boolean toggle determines if the Material 3 TextTheme and Typography is used.
    - When opted in on using FCS sub-themes, this flag controls if text theme uses the new Material `Typography.material2021`.
    - If not defined, and `ThemeData.useMaterial3` is true, then `useTextTheme` defaults to true and `Typography.material2021` is used.
    - If `ThemeData.useMaterial3` is false, then `useTextTheme` defaults to false, and `Typography.material2018` is used.
    - This toggle works as a quick override setting for using `Typography.material2021` in Material 2 mode, and for using `Typography.material2018` in Material 3 mode.
    - As before, when using FlexColorScheme and `ThemeData.useMaterial3` is false and sub themes are not used, the default typography is `Typography.material2018`. Note that if FlexColorScheme is not used at all, and your `ThemeData` has `ThemeData.useMaterial3` set to false, then Flutter defaults to using obsolete `Typography.material2014`. In such a case, consider defining your typography manually to `Typography.material2018` or why not even `Typography.material2021`.
    - If you specify a custom `typography` for `FlexColorScheme` or `FlexThemeData`, the `useTextTheme` property has no impact on used typography at all.

- The `SegmentedButton` unselected button foreground color defaults to the correct M3 spec color `onSurface`. This is a change from 7.0.0-dev.2, but not considered style breaking, since it has not existed in previous stable versions. Flutter 3.7.3 and earlier versions, via a spec deviation bug defaults to using `primary` color. See issue [#119733](https://github.com/flutter/flutter/issues/119733) for more information. Using the new `segmentedButtonUnselectedForegroundSchemeColor` we can also define it to use the `primary` color, that Flutter in version 3.7 uses as default. This selection actually looks quite nice. Some might say it looks better than the M3 specification, but that is why easy theming configurations are there, so you can change it to fit your design preferences.


- In `FlexSubThemes` the `filledButtonTheme` property `baseSchemecolor` was renamed to `backgroundSchemeColor`. This is a change from 7.0.0-dev.2, but not considered breaking since it has not existed in any previous stable versions.


- **Remove**: The `ListTileThemeData` workaround added in version 7.0.0-dev.2 was removed from core defaults. The issue https://github.com/flutter/flutter/issues/117700 never landed in Flutter 3.7 and its workaround is not needed. Extra setting of property value of `tileColor: Colors.transparent` in `ListTile`s used in elevated popupmenus were also removed from the **Playground** app. In previous dev releases, they were used to hide the issue in M3 mode in the app, when FCS was not used.


- **Remove**: The creation of `IconTheme` and `primaryIconTheme` when opting in on sub themes, was removed. Previously, their colors were set to be equal to the color of same typography color as
  used on `TextTheme` nad `PrimaryTextTheme`, by style `TitleLarge`. This is no longer needed and also got in the way of getting the undefined default behavior for `IconTheme` in some widgets. Like new `IconButtonThemeData` in master channel.


**THEMES PLAYGROUND**

The **Themes Playground** is example number 5 in the package repository, originally included as the last step in a "how to use FlexColorScheme" training tutorial. Since its humble introduction it has grown into a notable and quite extensive application of its own, and is too extensive to serve as a very helpful tutorial step anymore. Despite having many advanced and useful features as a companion application to the **FlexColorScheme** package, it is architecturally identical to steps and examples 3 and 4 in the tutorial.

The application has an architecture that is a bit too simplistic to be extended to offer all features users are asking for. There is a plan to refactor it and make it into a proper stand-alone application developed in its own repo. This is potentially the last major release of the **Themes Playground** in its current form, and as being included with the **FlexColorScheme** package as "just an example" of how to use the package to build a dynamically themed app, which is how it started. It will still remain in minor and fix versions of v7, but will likely be removed in a future v8 version of the **FlexColorScheme** package.

As a tutorial and example app, the **Themes Playground** has never had any functional guarantees or even any tests at all of its own. This is still the case. The **FlexColorScheme** package has and always aims for 100% test coverage in its stable releases.

Despite **Themes Playground** not having any formal guarantees, it is extensively used and user tested during development of **FlexColorScheme** releases. In addition to being a very useful tool to configure and experiment with different themes for Flutter apps, and to quickly copy needed API configuration to get the same theme in your app. It is also an excellent tool to use during development of the **FlexColorScheme** package. It is used to visually see and verify that all features in the package **actually** do what is expected of them. The changes to the **Themes Playground** app are also generally already quite thoroughly tracked, going back many releases. Changes to version v7.0.0-dev.3, from v7.0.0-dev.2 are listed below.

- Added "set to M3 default values" button to NavigationBar and NavigationRail settings.
- Added a feature to select which panel is shown in page view as the second panel. It is no longer locked to the code-view panel, it can be any of the available panels, enabling studying chosen panels side by side.
- Added an example themed-app panel view with a few screens. Can be used as a side screen to show what an app using the theme might look like. Screens still need demo content.
- Hides scheme input color definitions by default. You can turn it back ON if so desired. Showing input scheme color values shows the used color values before any input modifiers are used on them. Like seed generation, swapping legacy colors, swapping primary and secondary colors, seed generation, input color limiters, computed dark theme and using M3 error colors on legacy M2 schemes. In older versions of FCS, the scheme input color values were always shown. This may be confusing, so they are now hidden by default. Showing them may be useful to understand how the scheme defined input colors are being modified by input modifiers, but it is cluttered and confusing. If ON, scheme input color values show the colors before input modifiers, and the surrounding color shows the effective theme's ColorScheme.
- Added option to use the `usedColors` value 7 to the "Theme Colors" panel. It is presented more logically in the UI than a number, to make it more understandable.
- Added visualizations of surface colors to the **Surface blends** panel.
- Added color theming of BottomAppBar background color.
- Added theming of InputDecorator prefixIcon color.
- Added theming of Drawer, NavigationDrawer and indicator width, as well as indicator border radius and indicator item color.
- Added workaround for NavigationDrawer Flutter width and resize bugs. Bugs are still there, only worked around the cases to avoid them impacting the Playground.
- Added theme simulator with **Themed Components**.
- Separated the settings for `NavigationBar` icon and label colors. API already existed in FCS.
- Separated the settings for `NavigationRail` icon and label colors. API already existed in FCS.
- Added presentation of `ExpansionTile` and `ExpansionPanelList` to panel **ListTile** and **Widget Showcase**.
- For fun: Added confetti to sign in button on theme simulator mock sign-in screen.
- FIX: Shortcut entry bug on MenuAnchor widget showcase. Needed a workaround for this type of use case.
- Added control for indicator opacity in `NavigationDrawer` to panel **NavigationDrawer**.
- Added M3/M2, FCS ON/OFF, Sub themes ON/OFF to the custom side drawer/menu/rail.
- Added possibility to toggle between standard and compact UI mode. The compact mode is the same view mode as the smallest responsive view, with the addition that the switches under the horizontal theme color selector are also removed. When the compact-mode is on, it is used in all responsive sizes. The compact mode gives a larger view area for app controls. This is also useful on smaller desktops. In the compact-mode, settings controlled by the removed switches can be operated via the new optional controls on the rail/side menu.
- Added device selection capability to device theme simulator.
- Added theming of indicator border radius to `NavigationDrawer` to panel **Navigation Drawer**.
- Added theming of indicator border radius to `NavigationBar` to panel **Navigation Bar**.
- Added theming of indicator border radius to `NavigationRail` to panel **Navigation Rail**.
- Added theming of action color to `SnackBar` action button to panel **BottomSheet, Snack Banner**. The UI also got better testing feature of both fixed and floating `SnackBar` and correct defaults info for different settings and modes.
- Added controls to theme the new M3 menus consistently to the **Menu** panel.
- Added a panel with 10 pre-made example theme configurations.
- Added an option to remove divider on `TabBar` in M3 to panel **TabBar**. Unfortunately, the feature does not work due to a bug in Flutter. The issue has been fixed in the master channel via [PR #119690](https://github.com/flutter/flutter/pull/119690, but is not available in latest stable (3.7.7).
- Added an option to set the tab indicator size of the `TabBar` to panel **TabBar**.
- Added options to set the color of selected and unselected items in `NavigationDrawer` to panel **Navigation Drawer**.
- Added a new theme topic view is used when desktop width is larger than 1779 dp.
    - It offers separate vertical theme topic selectors for the two side-by-side theme topic panel views. This results in even more usable height available on e.g. a 1080p monitor, since the large horizontal theme topic selector for the main left panel is no longer on top of the screen. It is also quicker and easier to individually select the viewed theme topic for the left and right side. The new compact mode is also available in this view mode. Using the compact view mode further enlarges available vertical space to see more theme topic panel content on mid-sized desktop monitors (1080p). The breakpoint 1779 dp was chosen to get this view on 1780 dp, being a bit less than 1800 dp, the device pixels available on a MacBook Pro 14" screen when using the "More space" option in Display settings. It also gets used on common full HD 1080p monitors that are 1920 dp wide.
- Improved and added keyboard focus and navigation, by using `FocusTraversalGroup`:s and by letting important UI controls get focus on tap. This was done to make keyboard usage of the Playground easier. Its semantics were also improved, by adding the scheme names in the color selector to semantics.
- Added SnackBar controls for elevation and border radius to panel **BottomSheet Snack Banner**.
- Added TabBar controls for unselected item color, own controls for light and dark mode, unselected item opacity, indicator thickness and top radius to panel **TabBar**.
- Added controls for `defaultRadiusAdaptive` and `adaptiveRadius` to panel **Component themes**. They are used to define to make a platform adaptive override to the global border radius override value.
- Added controls for new platform adaptive elevation tinting and shadows in M3 mode to panel **Surface blends**. Settings are separate for light and dark mode and can only be used in M3-mode, they also only impact M3 mode themes even if used in API in M2-mode. The Themes Playground excludes them from code gen when they have no effect.
- Version 2.0.3 of package flutter_svg fixed its cache issue in version 2.0.0, 2.0.1 and 2.0.2, upgrade to version 2 was now (13.3.2023) possible and done.
- Added controls `menuBarBackgroundSchemeColor`, `menuItemBackgroundSchemeColor`, `menuItemForegroundSchemeColor`, `menuIndicatorBackgroundSchemeColor`, `menuIndicatorForegroundSchemeColor`, `menuIndicatorRadius` and for `menuPadding` properties via start, end, top, bottom values to panel **Menus** and codegen for same props.
- Added buttons to show actual `AlertDialog`, `TimePicker` and `DatePicker` dialogs to panel **Dialogs** and **Widget showcase**.
- **Removed**: The tonal palette tone indication feature was removed. This refers to a small not essential feature with an indicator appearing on the color tone, of a ColorScheme color below, on the **SeededColorScheme** page, when you hover over the ColorScheme color. This feature started showing strange side effects on web release mode builds, but only on web release mode builds (both skia and html renderer). The issue was not seen on web debug mode builds or any native VM builds, AOT or JIT compiled. The cause will be investigated further. This feature will be added back to the Playground when a reason and workaround for it is found, or when the root cause in the release web mode build is fixed. 