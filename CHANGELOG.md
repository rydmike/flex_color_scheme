# Changelog

All changes to the **FlexColorScheme** (FCS) package are documented here.

## 7.0.0-dev.3

**Mar 18, 2023**

This is the final beta v7 release before stable v7. There will be no new features or API changes in the FlexColorScheme package from this version to stable version 7.0.0. The only changes to stable will be potential bug fixes, typo corrections, API doc comment improvements and adding more tests.

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


**TODO BEFORE FCS STABLE 7.0.0 RELEASE**

- Report all found Flutter SDK theming issues.
  - Insert issue info in Themes Playground app where relevant.
  - Update [FlexColorScheme docs known issues](https://docs.flexcolorscheme.com/known_issues), with summary of issues.
- TESTS: Fix test coverage
  - Down from 100% to 93% now. Get it back to 100%. Not hard, just a lot of tests to write. The class `FlexSubThemes` with all its new component themes is only 73% tested now, all other package files have 100% test coverage.
- DOCS: Add important changes to docs.flexcolorscheme.com:
  - Change summary update.
  - Update known Flutter M3 and theming impacting issues.

**TODO AFTER FCS STABLE 7.0.0 RELEASE**

- Tweet series about what is new.
- Update [FlexColorScheme docs](https://docs.flexcolorscheme.com), among other things:
  - Guides on how to use all the advanced new features of FCS in the Playground.
  - Add device thumbs and screenshots of all new built-in color schemes.
  - Info section, about what is still missing in Flutter 3.7 from M3.
  - Review and update old screenshots and GIFs.
  - Use image zoom feature in docs.page on new and old images.
  - Use new highlight banners feature, in the docs.page tool when appropriate.


## 7.0.0-dev.2

**Jan 25, 2023**

**CHANGE**

- Updated to require minimum Flutter stable 3.7.0, compared to 7.0.0-dev.1 that required beta 3.7.0-1.4.pre.
- Updated to stable release of FlexSeedScheme ^1.2.0.

**FIX**

- Fix new scheme `redM3` faulty dark mode colors.

**THEMES PLAYGROUND**

- CHANGE: Explanation for `SegmentedButton`.
- CHANGE: Intro text, to say that M3 in Flutter SDK is now ready for production.  
- FIX: Wrap for `PopupMenuButton`.
- ADD: ThemeShowcase now includes `Badge`, so it gets featured as well.

## 7.0.0-dev.1

**Jan 23, 2023**

* [Detailed changelog](https://github.com/rydmike/flex_color_scheme/blob/m3-master-channel/changelog/changelog_7_0_0_dev_1.md)

**Jan 23, 2023**

## 6.1.2

**Dec 26, 2022**

**FIX**

- Fix for issue [#106 bottomSheetModalBackgroundColor not correctly set](https://github.com/rydmike/flex_color_scheme/issues/106). Thanks [mcssym](https://github.com/mcssym) for the fix [PR #107](https://github.com/rydmike/flex_color_scheme/pull/107).

## 6.1.1

**Nov 22, 2022**

**FIX**

- Themes Playground (Example 5): Fixed scroll issue in page view mode on Web-builds. Only examples related, no package impact.
- API doc updates.

## 6.1.0

**Nov 20, 2022**

**FlexColorScheme** version 6.1.0 contains many new features, more component sub-themes and configurable properties. It improves seed-generated color scheme capabilities by adding more pre-configured seed generation configurations and color contrast accessibility options. 

A criticism of Material 3's color system and seed-generated color schemes, is that using colored contrasting colors may be less accessible. FlexColorScheme offers a way to enable in-app modification of its seed-generated color schemes, any seed generation configuration can optionally return results with plain white and black contrasting on colors. This can be applied separately for main on colors and on surfaces.

The **Themes Playground** application, has been updated to include most of the new features. It has been improved to make it easier to discover some of its previously existing features, like using custom colors in the Playground to define your own theme. 

**NEW**

* Scaffold background color can now be used as the themed AppBar background color. The enum `FlexAppBarStyle` that is used by property `appBarStyle` got a new value `scaffoldBackground` that enables this. This is useful for matching the AppBar color exactly to the Scaffold background color, when Scaffold background uses different surface blends than the theme's `ColorScheme` surface or background colors.
* Added properties `materialTapTargetSize` and `pageTransitionsTheme` to `FlexColorScheme` and `FlexThemeData`. They are only convenience properties to avoid having to use a `copyWith` on FlexColorScheme produced `ThemeData`, to define them.
* Property `swapLegacyOnMaterial3` in `FlexColorScheme.light/dark` and `FlexThemeData.light/dark` allows for better automatic adjustment of built-in scheme colors to the Material 3 color-system. It applies to color schemes that were originally designed for Material 2, when using the Material 3 mode with or without seed-generated ColorSchemes. 
  - Setting `swapLegacyOnMaterial3` to `true`, will when `useMaterial3` is `true`, swap the built-in scheme colors `secondary` and `tertiary` and also their container colors. 
  - This only happens for built-in schemes where this swap makes the color design **more compatible** with the intended design and usage of the `secondary` and `tertiary` colors in Material 3 color system.
  - To implement this, the class `FlexSchemeColor` has a new boolean meta-data property called `swapOnMaterial3`, that has been defined to be `true`, if the `FlexSchemeColor` it defines, benefits design compliance wise from swapping its `secondary` and `tertiary` colors when using Material 3.
  - For backwards compatibility the `swapLegacyOnMaterial3` is `false` by default, but it is recommended to always set it to `true`. The flag has no impact when using Material 2. 
  - The `swapLegacyOnMaterial3` flag can also be toggled in the **Themes Playground**, it is on by default there.
  - When the swap is done for a `FlexSchemeColor`, it is done before any other built-in scheme modifier properties, including `swapColor` and `usedColors`. 
* The `FloatingActionButton` can now be set to always be circular, also in Material 3 and without assigning a high-radius setting. If you always want a circular FAB, and stadium on extended FAB, then set `fabAlwaysCircular` in `FlexSubThemesData` to `true`, and FAB stays circular regardless of if you use M2 or M3, or how you modify the global default border radius. You could get this effect before too by setting a very high themed radius on the FAB, but this is more convenient.
* Additional new `FlexSubThemesData` properties:
  - `Slider` theme can now be adjusted via `FlexSubThemesData` properties `sliderBaseSchemeColor`, `sliderValueTinted` and `sliderTrackHeight`.
  - The `chipSelectedSchemeColor` was added as themed background color, it is used by Chips that are selectable. The `chipDeleteIconSchemeColor` can be used to theme the "Delete" icon color on Chips. While adding these features, some Flutter M3 Chip spec and theming issues were found, [see issue #115364](https://github.com/flutter/flutter/issues/115364) for more information.
  - Switch got a `switchThumbSchemeColor` property, to control the thumb color separately. A switch custom color theme was prepared for M3 `Switch`, which is not yet available in Flutter 3.3.
  - `Tooltip` theme now has `FlexSubThemesData` properties `tooltipRadius`, `tooltipWaitDuration`, `tooltipShowDuration`, `tooltipSchemeColor` and `tooltipSchemeColor`.
  - The `bottomSheetBackgroundColor` and `bottomSheetModalBackgroundColor` can be used to theme the background color of the `BottomSheet`.
  - Use `navigationBarElevation` to adjust the themed elevation of `NavigationBar`.
  - Use `popupMenuElevation` and `popupMenuSchemeColor` to further quick theme the `PopupMenuButton`.
  - The `outlinedButtonBorderWidth`, `outlinedButtonPressedBorderWidth`, `toggleButtonsBorderWidth`, `inputDecoratorBorderWidth` and `inputDecoratorFocusedBorderWidth` define the themed outline border thickness in different states of their respective components. These properties use previously existing properties `thinBorderWidth` and `thickBorderWidth` as their defaults. Resulting in that, the new properties are API backwards compatible, and they have shared global default settings. The new part is that you can now define themed outline border thickness separately for these components.
  - The `elevatedButtonTextStyle`, `outlinedButtonTextStyle` and `textButtonTextStyle` were added to be able to theme `TextStyle` on `ElevatedButton`, `OutlinedButton`, `TextButton`. These are convenience properties to allow different text styles on buttons without having to use `copyWith` on the overall `ThemeData` and its button component themes to modify the text styles, often sizes. 
    - These properties do not offer any simplification over standard `ThemeData` and its button themes. The current version does not include adjusting them in the Themes Playground. Adding all possible usage of them is currently not in the scope of the Playground app. However, button font size changes may be added later as a usage example of these properties. These properties are using the tricky `MaterialStateProperty`, that have so far been avoided in this flattened simplified theming. It was used for the benefit of offering the text styles as `ThemeData` pass along properties. Modifying the `ButtonStyle` theme using `copyWith`, is a bit more involved than for other sub themes, with these properties you can customize the button text style using `FlexSubThemesData` properties instead. If you need to modify the `FlexColorScheme` created buttons themes even further for some not included properties, an example of how to do that can be found [here](https://github.com/rydmike/flex_color_scheme/discussions/92).

**CHANGE**

* FlexColorScheme now uses **FlexSeedScheme** version 1.1. It includes the following new features and changes:
  - Features that enabled implementation of just black and white seeded **on** colors. 
  - Additional `FlexTones`, the `FlexTones.oneHue` and `FlexTones.vividBackground`.
  - See [FlexSeedScheme on pub.dev](https://pub.dev/packages/flex_seed_scheme/changelog) for more information.
* In `FlexSubThemesData` all component controlling properties except booleans, are now nullable and null by default. FlexColorScheme made sub themes still default to same values as before when assigning a default `FlexSubThemesData()` to `FlexColorScheme.subThemesData`. The properties are nullable to enable using different defaults in FlexColorScheme made sub-themes for Material 2 and Material 3 modes.
* **Style breaking:** Changed component themes `thinBorderWidth` to default to 1.0. It was 1.5 before. This is a style breaking change from previous thin outline style in FlexColorScheme.
  - Using fractional values may cause artefacts on monitors using native resolution where 1 dp = 1 physical display pixel (common on desktop PC/Linux monitors). We see the new default as a design FIX to avoid such issues with default settings. You can still set `thinBorderWidth` to 1.5, to get the same result as previous default theme.
* **Style breaking:** When opting in on opinionated sub-themes, the `Chip` style is slightly modified from previous versions. The new opinionated FCS default style is more distinct than before and more aligned with styling borrowed from the Material 3 mode `Chip` design. The `deleteIconnColor` now defaults to `onSurface` instead of `primary` and it can be defined to be any color scheme based color. The Chips revised style, look better than before. Using Material 3 and with it themed `Chips` is also fully supported, also customizing color on selected state of selectable **Chips** is available. Color-tinted chips are also available as before. Be aware though that Material 3 theming in the current 3.3 version of Flutter has some limitations. If you assign a custom color to selected chips, the disabled state of Chips can no longer conform, to M3 spec of disabled selected Chips. 
  - For more information, [see issue #115364](https://github.com/flutter/flutter/issues/115364). Note that if you deviate on Chips from its expected designed background brightness, which is now possible to do for **selected** Chips with the new theming capabilities in the Playground. There is no way via theming to set correct text and icon contrasting brightness for selected Chips that require dark text and icons on bright Chips in dark theme mode. Wise versa for light theme mode, setting light text on dark selected Chips in light mode, is also not possible. This limitation applies to selected `FilterChip` and `InputeChip`, there is simple not enough theme properties in `ChipTheme` to support this. Due to this limitation, we recommend only using Chip theme designs that work with dark text in light mode, and light text in dark mode.
* **Style breaking:** When opting in on opinionated sub-themes, the `BottomSheet` background color now defaults to theme's ColorScheme `surface` color, in both M2 and M3 mode. Previously it defaulted to the `Material`'s default color `theme.canvasColor`, that typically equals ColorScheme `background`. The new default follows upcoming Material 3 default for `BottomSheet`. The style change is minor, in most designs the color values are the same. If needed you can put it back to theme `background` color with:

```dart
    final ThemeData themeLight = FlexThemeData.light(
      subThemesData: const FlexSubThemesData(
        bottomSheetBackgroundColor: SchemeColor.background,
        bottomSheetModalBackgroundColor: SchemeColor.background,
      ),
    );
```

**FIX**

* **Temporary Material 3 Flutter SDK GAP fixes** 
  - The FlexColorScheme Material 3 mode sub-themed `BottomSheet` gets a manually applied elevation tint to keep it distinguishable from the background. This temporary fix works despite Material tint elevation being broken in Flutter 3.3 and earlier, when `useMaterial3` is true. 
  - Same temporary M3 fix is also used on themed `PopupMenuButton`. 
  - Unfortunately, elevation-based shadow cannot be added to any of them in the M3 mode. It will have to wait for actual implementation of the components and their Material 3 themes with support for it.
  - The M3 supporting components and themes for `BottomSheet` and `PopupMenuButton`, already exist in the Flutter master channel, they will probably land in next new stable release after Flutter 3.3. 
  - These temporary M3 fixes, make it possible to use the `BottomSheet` and `PopupMenuButton` when opting in on Material 3. Since shadow elevations are still not working for them in M3, it is not perfect, but much better.
  - The reasons why these issues exist are because these components have not yet been migrated to M3 in Flutter 3.3, plus the combination of this `Material` elevation [issue #107190](https://github.com/flutter/flutter/issues/107190) in M3 mode. As a result we get no elevation tint or any shadow on such `Material` using widgets in M3 mode.
  - The [issue #107190](https://github.com/flutter/flutter/issues/107190) has been fixed in master. Even if only it lands, we will get shadows back in M3 default `Material`, also if the components and their themes do not land. In combination with the here made M3 manual elevation tint fix, they would in such a case get the correct M3 default background elevation tint behaviour and shadow.
  - The above temporary work-around fixes will be removed when the stable version of the framework implements correct Material 3 elevation behavior for these widgets, and produces the same results itself. Hopefully in the next stable release of Flutter.

**THEMES PLAYGROUND**

* On **Theme colors** panel:
  - Improved the discoverability of defining and using totally custom colors for your theme in the **Playground**. It has always existed, but maybe now users will discover it more easily. You can still also copy any existing theme, as a starting point for your custom color definitions.
  - Simplified the terminology used on the **Theme colors** panel. Also simplified its color presentation.
  - Added an on/off switch that controls the `swapLegacyOnMaterial3` setting.

* Updated and shortened the **Introduction**. Probably nobody reads it, or the [package docs](https://docs.flexcolorscheme.com/) with **Playground** guides, but at least it is there.

* The **Seeded ColorScheme** panel:
  - When using seeded color schemes, it is now possible to force contrasting **on** colors for all the main colors (primary, secondary, tertiary, error and their containers) to be plain black or white, for better and more traditional contrast text and iconography colors. Likewise, for the **on** colors for all the surfaces, background, surface, surfaceVariant and inverseSurface. This is a great toggle to get a more classic look while seeding main and surface colors. Turning these toggles on can also help with accessibility by increasing contrast and not using color on color for contrast. Offering these as user controllable toggles in apps can be a good way to allow users to tune not only the look, but also color accessibility.  
  - Now also show the source input "Scheme defined" colors, the `FlexSchemeColor`, that gets used as key colors for the Material 3 seeded ColorScheme generation, when it is turned on.
    - Arranged the panel content for better inclusion and presentation of the created **Tonal Palettes** used to make the seeded ColorScheme.
    - The Tonal palette color **tones** now have tooltips that present each tone.

* On **Surface blends**: 
  - Changed the surface blend mode defaults to settings that are more mobile design-friendly. No API change involved. API defaults are the same as before, changes only affect the Playground app defaults. 
    - Previously used **Playground** default values were intended for desktop and tablet designs, where controls and text are placed on containers with a lower surface blend, like the **Cards** used in the Themes Playground app itself. While one can make a responsive app, that uses this design nicely from mobile to tablet and desktop sizes, most mobile only apps are not designed so. Using Playground defaults that produce a nice theme for more typical mobile designs, will help new FlexColorScheme and Themes Playground users, configure nice themes even quicker.
  - The blend mode control now also has a popup-menu, that always shows all surface blend modes, also in smaller UI. On smaller devices the `ToggleButtons` control, as before, only shows popular options.

* Other **new controllable properties** and features:
  - **AppBar** theming can now use themed `scaffoldBackground` color as its themed background color. This is useful for matching the AppBar color exactly to the Scaffold background color, when Scaffold background uses different surface blends than the theme's ColorScheme surface or background colors.
  - On **FAB and Chips** panel, added the **Always use circular FAB** feature.
  - Added support for adjusting background color and elevation of `BottomSheet`.
  - Added support for adjusting elevation of `NavigationBar`.
  - Added support for adjusting elevation and background color of `PopupMenuButton`.
  - Added support for component independent settings of `ToggleButtons` border width.
  - Added support for component independent settings of `OutlineButtons` border widths.
  - Added support for component independent settings of `InputDecorator` border widths.
  - Added support for adjusting `Dialog` elevation.
  - Added support for adjusting `Slider` via base color, track height and base color tinted value indicator.
  - Added support for adjusting `Tooltip` via scheme color, radius, opacity, show duration and wait duration.
  - Added support for adjusting `Switch` thumb color via scheme color selection.

* User interface changes:
  - New design of popup menu indicators for `AppBarStyle`, `SchemeColor` selection and `SurfaceStyle`. Their style follow `ToggleButtons` height and border radius.
  - All single option select `ToggleButtons` controls in a `ListTile` can now for convenience be toggled in sequence by just tapping on the `ListTile` it is used in.
  - Split out some components that where on shared panels, to their own panel/page. This is done when components get more settings and having them in a separate panel makes sense.
  - A themed `Slider` widget is now presented in the **Widget Showcase** panel. Basic theming options are now available. The Slider theme is already excellent out of the box. When you need more radical changes to it, those typically go beyond the scope of FCS and require extending the Slider widget. 
  - Removed animation from horizontal list **Theme selector** when selecting a theme.
  - Removed animation from the theming topics when selecting one on the **Page view**.
  - Removed the slide to page animation, when clicking on a topic, on the **topic panel selector**.
    - Direct panel/page selection via the control now instead uses a small **Fade and Zoom in** to show the selected settings panel.
    - Without any panel page change effect, it was hard to notice what changed. The default slide to the page animation, with the `PageView` is fine when swiping, where it remains, but it was a tad annoying when clicking on the panel page selector.
  - Changed all used `Slider.adaptive` to `Slider`.
    - The Cupertino adaptive one has poorer UX. You cannot click on the track to move the thumb to a given position. The app presents Material theming, so we will show only Material widgets in the apps own controls, on all platforms going forward.
  - Changed all used custom `SwitchListTileAdaptive` to just `SwitchListTile`.
    - We like using the Material theme following `SwitchListTileAdaptive` iOS switch on iOS on macOS. However, the app presents Material theming, and the new Material 3 Switch will land in Flutter stable soon. The new Material 3 `Switch` is even nicer than the Cupertino Switch, and we want to see it in the app when it lands. We will thus use the Material Switch in the Themes Playground app on all of its own controls on all platforms going forward.
    - The `SwitchListTileAdaptive` is kept in use on examples 2 to 4. As an example of how to make and use a theme following platform adaptive `ListTileSwitch`. In the `SwitchListTileAdaptive` doc comments it is mentioned that the plain `SwitchListTile.adaptive` is not theme color following on iOS/macOS platforms, nor can it be themed to be so. You have to make a custom wrapper like [`SwitchListTileAdaptive`](https://github.com/rydmike/flex_color_scheme/blob/master/example/lib/shared/widgets/universal/switch_list_tile_adaptive.dart).


* **FIX** Themes Playground 
    - Fixed codegen for Switch, CheckBox and Radio, that did not include color selection for setting primary color since it used to be default. The issue only concerned the Themes Playground code generation, APIs worked as expected.


## 6.0.1

**Sep 21, 2022**

**FIX**
 
* A null check was fixed by [sososdk](https://github.com/sososdk) in `FlexColorScheme.light` when using custom scheme [PR #90](https://github.com/rydmike/flex_color_scheme/pull/90). Issue did not exist in `FlexColorScheme.dark`.

* Cam16 from Material Color Utilities exported by accident by FlexColorScheme in version 6.0.0 via its **FlexSeedScheme** package export. This export was removed. Cam16 was not exported before moving features to FlexSeedScheme and should not have been now either. FlexSeedScheme does, however export it as before, it is used by the **FlexColorPicker**.

## 6.0.0

**Aug 31, 2022**

* Updated minimum dependencies to Dart >=2.18.0 and Flutter >= 3.3.0.

Due to a number of known and below documented Flutter SDK issues when using `useMaterial3` set to
`true`, we cannot yet recommend using the option in production. Use it only if you are willing to
accept the still incomplete Material 3 implementation in Flutter and the issues. If you
keep `useMaterial3` set to `false`, and use FCS opinionated component themes, you can create a
theme that is visually fairly similar to M3, but still using M2 `ThemeData` mode to avoid many
issues.

**BREAKING**

* This **FlexColorScheme** version no longer directly depends on the
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

* To allow for greater flexibility, and addition of tonal palette tones 5 (custom for FCS) and 98
  (Google Material 3, Web theme builder app includes tone 98 to, but not Flutter SDK),
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
  `TonalPalette`, with addition of tonal palette tones 5 and 98. Tone 98 also exists in the
  [Web Material Theme Builder app](https://m3.material.io/theme-builder#/custom), but not in
  Flutter or [Material Color Utilities package](https://pub.dev/packages/material_color_utilities).
  Tone 5 is custom addition for `FlexTones` and `FlexColorScheme`.

* Added `appBarCenterTitle` property to `FlexSubThemesData` configuration. It works the
  same way as `centerTitle` in `AppBar` and its theme. The property is not available in the
  Themes Playground app, only via the API. We recommend keeping it null to use platform
  adaptive default behavior, but offer it as a convenience property for those that like to use the
  same centering style, regardless of the used platform.

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
  background color. Material 3, and 2, have completely different elevated button styles.
  The Material 2 elevated button is color wise, like the M3 filled button, but with elevation.

* Added two new properties to `FlexSubThemes.outlinedButtonTheme`.
  * Boolean `useMaterial3`, defaults to false.
  * `outlineSchemeColor`, defaults to null `SchemeColor?`.
    When `useMaterial3` is `false`, the `outlineSchemeColor` defaults to `baseSchemeColor`.
    When `useMaterial3` is `true`, the `outlineSchemeColor` defaults to `SchemeColor.outline`.

**REMOVED EARLIER DEPRECATED MEMBERS**

As a chore and clean-up, all previously deprecated members have been removed from version 6.0.0. It
no longer has any self-deprecated members. This removes legacy backwards compatibility with
deprecated members from versions 2, 3 and 4, and even one from version 5.1.0. Removed all earlier
self-deprecated members as follows:

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

**STYLE CHANGE — BREAKING**

* `FlexSubThemesData.fabUseShape` opinionated component theme style default was changed from `true`
  to `false`, this breaks previous default style. The opinionated style change was done
  to use a style that by default matches M3 style when `ThemeData.useMaterial3` is `true`.
  The new default style is also a way to work around issue
  [#107946](https://github.com/flutter/flutter/issues/107946), where it is shown that you cannot
  create a theme that replicates the default roundings in M3 of the FAB.
  **Style migration**: If you had kept `FlexSubThemesData.fabUseShape` unspecified and relied on
  default value in a previous version, you must set it to `true` to get the same result as before.
  Breaking style changes like this, in the opinionated opt in component sub-themes are unfortunate.
  It is, however, required as FlexColorScheme continues to evolve with Flutter SDK to support Material 3
  theming, while offering its own opinionated tweaks on some M3 default styles as well.

**STYLE CHANGE — MINOR**

* The M3 color utilities package *material_color_utilities* from the Material team, that Flutter SDK
  depends on and FCS also uses, introduced a minor breaking change going from version 0.1.4 to
  0.1.5. Some colors in the tonal palettes no longer give exactly the same color values as before.
  This changes the results for some colors when you create a `ColorScheme.fromSeed` or FCS does
  it internally with its extended version `SeedColorScheme.fromSeeds`. The new algorithm changes, 
  all the default M3 error colors slightly. The changes in the color values are minor,
  and not visually noticeable to the eye. Values are still slightly different, and this release
  uses the new value for FCS M3 error colors. Tests were also updated to use the new values.
  The change did break FCS color value tests, and should per its own policy be considered a
  major breaking change. However, since the Material 3 design and **material_color_utilities**
  call this change minor, then so does FCS.  

* The opt-in opinionated tinted text themes were made less aggressive on the tint and received a
  bit of opacity for styles that in 2014/2018/2021 styles have opacity. The custom styles use
  significantly less opacity since they already also get alpha-blended tint color applied.
  Combining it with the same level of opacity would make them too low contrast.

* Style **fix**, the main text theme uses `surfaceTint` color instead of `primary` when tinted text
  theme is enabled. By default `surfaceTint` equals `primary`, but if theme `surfaceTint` is set
  to use a custom color, the for surface tinted textTheme is now also based on it, to fit the
  custom-tinted surfaces. The primary text theme, that fits on primary color, still
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

* Updated `TextButton` to support `useMaterial3` defaults concerning its use of a stadium border
  instead of 20 dp radius, as well M3 size and padding, when `useMaterial3` is opted in on.

* Changed opinionated dialog sub-theme defaults to match M3 defaults. Elevation set to 6, was
  10 and actionsPadding defaults to `EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0)`, it
  did not have a custom default before. These are new defaults for the opinionated dialog sub-theme
  for both M2 and M3.

* Updated `Chip` sub-theme when opting in on `useMaterial3`. When `true` it now uses upcoming M3
  styled Chips instead of its own opinionated custom style, also when the opinionated component
  sub-themes are enabled. To get the same opinionated coloring as before, but on the M3 styled
  chips when using M3, set component sub-themes data
  `subThemesData: const FlexSubThemesData(chipSchemeColor: SchemeColor.primary)`.
  This feature will only work with intended design in the stable channel, after the feature and PR
  ["Migrate Chips to Material 3"](https://github.com/flutter/flutter/pull/107166), lands in the stable
  channel. Currently, it is only available in Flutter *master 3.1.0-x*.

* Updated `InputDecoration` default sub-theme when opting in on `useMaterial3`. When `true` it
  now results in a more upcoming M3 styled `TextField` style by default, instead of its own more
  opinionated custom style, also when the opinionated component sub-themes are enabled.
  It still uses a touch a lot of its own style in M3 mode, because TextField's real M3 design is
  not yet available in Flutter 3.3. TextField FCS opinionated style, combined with M3 real defaults,
  will need more work on M3 styles after
  ["Migrate TextField to Material 3"](https://github.com/flutter/flutter/pull/108366) lands in
  the stable channel.   
  The M3 alignment of FCS `InputDecoration` planned adjustments are:
  - Use the same error container color idea for FCS default that M3 uses, could be OK for all modes.
  - Option to use FCS component defaults on fill colors and disabled colors, also when
    opting in on M3. These FCS defaults can provide a nice alternative also when opting in on M3,
    but should not force it on M3 unless asked for.

**CHANGE**

* Un-deprecated earlier internal deprecation of `FlexSubThemes.buttonTheme`, as long as Flutter
  SDK has not deprecated it, neither will FCS.
* Un-deprecated earlier internal deprecation of all *"variant"* named const `FlexColor` colors.
  They are not used actively by any built-in schemes. However, in line with past practice,
  the old M2 color names and values will not be removed. Feel free to use them, if so desired.
* To support deprecation of `toggleableActiveColor` when PR
  [Deprecate toggleableActiveColor #97972](https://github.com/flutter/flutter/pull/97972) lands,
  while retaining the previous FCS defaults for `Switch`, `CheckBox` and `Radio` widgets, when
  not opting in on component sub-themes. The created `SwitchThemeData`, `CheckboxThemeData` and
  `CheckboxThemeData` can no longer be null, when not opting in on sub-themes like before.
  To support the previous theme colored
  toggles in light and dark themes, that were set by defining the right scheme color for
  `toggleableActiveColor` in M2 and M3 theme modes, sub-themes for them that replicates the color
  styles must now be created also when not opting in on sub-themes. This update includes the
  necessary change to do so. This will be reflected in updates to the core default documentation.
  For a migration guide concerning `toggleableActiveColor` see
  [Flutter breaking-changes](https://flutter.dev/docs/release/breaking-changes/toggleable-active-color#migration-guide).
* Since Flutter 3.3 did not yet include the actual deprecation of `toggleableActiveColor` FCS still
  defines its appropriate color value for `ThemeData`.


**EXAMPLES**

* *Themes Playground:* New feature, the used code highlight colors were added as colors in
  a `CodeTheme` class `ThemeExtension` to `ThemeData`. To demonstrate how one can use theme
  extensions directly with FlexColorScheme as well, in this case to add custom semantic colors
  for the code view's code keyword highlighter. Additionally, a fancy Material 3 feature was added,
  color harmonization of custom colors. The process is described in the Material 3 guide under
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
  with no impact when using seeded color schemes. Code is also not generated for onColor blend
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

* Removed the duplicated section of 5.1.0 changelog entry with date July 5, 2022.

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
  FAB style defaults for the opinionated FAB theme in FCS was this issue.

* [**#108539**](https://github.com/flutter/flutter/issues/108539) Cannot theme shape independently
  for `SnackBar` with different `behavior`. This is the reason why FCS does not yet offer a
  custom shape in its opinionated `SnackBar` theme. To replicate the un-themed behavior with
  slightly different border radius values, one must make custom wrapper widgets for `SnackBar`.

The Flutter SDK M3 `useMaterial3` flag set to `true` continues to have a number of challenges in
addition to the above ones. We as before still have the issues below in Flutter *stable 3.0.5* and
also at least in Flutter *master 3.1.0-0.0.pre.2216* and earlier:

* [**#107190**](https://github.com/flutter/flutter/issues/107190) Elevation issue with `Material` widget, when opting in on `useMaterial3` causes widespread elevation issues. Concerning the reported elevation issue for dialogs included in the linked report, it was observed as fixed for them in master, but later the PR fixing it was reverted. After that, it was relanded, then the reland reverted, see [Issue #107423](https://github.com/flutter/flutter/issues/107423), [PR #108718](https://github.com/flutter/flutter/pull/108718), [PR #109170](https://github.com/flutter/flutter/pull/109170) and [PR 109172](https://github.com/flutter/flutter/pull/109172). Even after it eventually lands in stable, it will not solve all the mentioned incompleteness caused M3 elevation issues. It will only do so for Dialogs. Popup in particular will remain troublesome.

* [**#103864**](https://github.com/flutter/flutter/issues/103864) Dynamically changing `Typography`
  in `ThemeData` generates an error

* [**#107305**](https://github.com/flutter/flutter/issues/107305) Regression: `AppBarTheme` properties `iconTheme` and `actionsIconTheme` are ignored in the master channel when `useMaterial3` is true. This was not in stable Flutter channel *stable 3.0.5*. This issue was fixed via [PR #108332](https://github.com/flutter/flutter/pull/108332) and could no longer be observed in *master, 3.1.0-0.0.pre.2108* or later versions. The fix did however not make it into Flutter stable 3.3.0 and now exists there. The issue must be re-opened or a new one submitted.

* This issue discussed in `SliverAppBar.medium` and `large` [PR #103962](https://github.com/flutter/flutter/pull/103962#issuecomment-1224269768), now exists in the stable channel. There is no open issue for it yet.

## 6.0.0-dev.1

**Aug 28, 2022**

* [Detailed changelog](https://github.com/rydmike/flex_color_scheme/blob/master/changelog/changelog_6_0_0_dev_1.md)

## 5.1.0

**July 8, 2022**

* Updated to support *Flutter 3.0.0*, with *Dart 2.17* and latest Flutter package dependencies in example apps. Requires at least *Flutter 3.0.0* and *Dart 2.17.0*.

**NEW**

* **Added** full support for in *Flutter 3.0.0* new `ColorScheme.surfaceTint` color. It is set to `ColorScheme.primary` color by default, as Flutter and Material 3 does. If a custom `surfaceTint` color is provided, it is also used as the blend color, instead of `primary` color, for FlexColorScheme's surface blend feature.

* **Added** API for using *Flutter 3.0.0* theme extensions directly via FlexColorScheme API. It was added as a convenience feature in order to avoid having to add theme extensions with a `copyWith` on FlexColorScheme produced ThemeData. With the `FlexColorScheme.extensions` and `FlexThemeData.extensions` properties you can add custom theme extensions directly.

**DEPRECATED**

* **Deprecated:** `FlexColorScheme.m3TextTheme`. The custom M3 text theme is no longer needed after Flutter 3.0.0 release that includes the new M3 Typography in addition to its earlier released `TextTheme`. You can opt in on using the new M3 style TextTheme as before by setting `FlexColorScheme.subThemesData.useTextTheme` to true **or** by setting `FlexColorScheme.useMaterial3` to true. Using either does however, come with known issue [#103864](https://github.com/flutter/flutter/issues/103864), where dynamically switching Typography, e.g. from 2014 or 2018, to M3 2021 Typography, triggers mentioned assert in issue [#103864](https://github.com/flutter/flutter/issues/103864). This issue has always existed in Flutter SDK ThemeData when dynamically changing between different Typography. Before FlexColorScheme avoided triggering this issue by only using Typography 2018, also when opting in on M3 TextTheme, that before used 2018 based Typography to make a custom M3 like `TextTheme`. Avoiding this issue is no longer possible when opting in on M3, that now correctly uses its own and different Typography from M2. This exposes this issue if you dynamically change ThemeData from one to another Typography. To avoid this Flutter SDK issue, use the same Typography for all your themes in your app and do not dynamically switch theme between ThemeData objects that use different Typography in your application. The use cases for doing this are few, but it is still a Flutter SDK limitation to be aware of.

* **Deprecated:** `FlexSubThemes.buttonTheme` that creates an opinionated `ButtonThemeData`. The ButtonThemeData is marked as obsolete in Flutter SDK but not yet deprecated in Flutter 3.0.0. FlexColorscheme now marks it as **deprecated**. It will be removed in a future FlexColorScheme release when Flutter SDK deprecates `ButtonThemeData`.

**M3 STYLE FIXES AND CHANGES**

* **FAB M3 defaults change**: Floating Action Button background color, will when opting in on `ThemeData.useMaterail3`, use color `theme.colorScheme.primaryContainer`, otherwise `theme.colorScheme.secondary` is used.

* **Input Decorator default change**: The `TextField` and its `InputDecorator` border radius 
  default value was changed from 20 dp to 16 dp when using opinionated component themes.
  If opting in on Material 3, the default value for M3 design is used, which is only 4 dp.
  See specification https://m3.material.io/components/text-fields/specs.
  Flutter 3.0.x does not yet implement the new M3 TextField style, but via this change when
  opting in on M3, FlexColorScheme offers an early approximation of it. 

* **NavigationBar M3 defaults change**: Default colors of `NavigationBar` when opting in on 
  `useMaterial3` and not using opinionated component themes will now match M3 default colors. The background color will follow M3 style also by default when component themes are enabled and `useMaterial3` is true. This style is difficult to replicate with a single color otherwise. The difference is subtle for FCS surface tinted background colors. You can still set it to `background` color to replicate past FCS default color when sub-themes were enabled. For other properties, if opinionated component themes are not used, FCS will use default M3 theme styles on `NavigationBar` when `useMaterial3` is true. If opting in on opinionated component themes, FCS uses its own custom and opinionated default style. It can be modified to be the same as the default M3 style too, just as before. The change also includes a default font size change for FCS opinionated styled navigation bar, from 11 dp to 12 dp. This change was done to harmonize it with its M3 style.

* **NavigationRail M3 defaults change**: Default colors of `NavigationRail` when opting in on
  `useMaterial3` and not using opinionated component themes will now match M3 default colors. If opinionated component themes are not used, FCS will use default M3 theme styles on `NavigationRail` when `useMaterial3` is true. If opting in on opinionated component themes, FCS uses its own custom and opinionated default style. It can be modified to be the same as the default M3 style too, just as before. The change also includes a default font size change for FCS opinionated styled rail, from 14 dp to 12 dp. This change was done to harmonize it with its M3 style.

* **Toggleable M3 style change:** Default color of toggles (Switch, CheckBox and Radio) are now using `primary` color as the default theme color when opting in on opinionated component themes or setting `ThemeData.useMaterial3` to true. The Switch, CheckBox and Radio themes then use a style that matches the M3 color design intent. In it, switches and toggles are mostly primary color based. In M3 color design, the secondary color is a poor choice for switches and toggles, and it is therefore not used as their default color. It does not look nice with M3-based ColorSchemes, created e.g. using M3 color seeding. If you use a custom M3 color design, where secondary color is still prominent, you can, of course, still use it.

* **Fixed lint:** "Avoid using private types in public APIs". See tweet [discussion](https://twitter.com/RydMike/status/1533788260320923649) about why and when you might run into this lint being triggered by older Stateful Widgets. The lint warning was addressed in the package and examples.

**EXAMPLES**

* Added a **Theme Extensions** example to the default example app *Hot Reload Playground*.

* *Themes Playground:* Updated the default style info labels for Switch, CheckBox and Radio.

* *Themes Playground:* To the top row theme selector, where the FlexColorScheme and component themes switches are, added the "Use Material 3" toggle. Previously, this toggle was only available on the introduction panel. The availability in the header makes it easy to toggle it ON and OFF at any time, to see what impact it has on widgets.

* *Themes Playground:* Updated the default style info labels for the NavigationBar. The logic to display default color labels in different config modes (M2/M3/FCS/FCS+M2/FCS+M3) is quite involved, please report any issues. 

* *Themes Playground:* Updated the default style info labels for the NavigationRail. The logic to display default color labels in different config modes (M2/M3/FCS/FCS+M2/FCS+M3) is quite involved, please report any issues.

* *Themes Playground:* Due to issue [#107190](https://github.com/flutter/flutter/issues/107190), the Playground previous default to use Material 3 was changed to false. 

* *Themes Playground:* Added support to customize the `surfaceTint` color. It controls both the elevation color used for elevated `Material` surfaces in M3. Plus for FlexColorScheme it is also used as the surface blend color. By default, the `surfaceTint` color equals `ColorScheme.primary` color. Generally, there are not many good design reasons to change the color, but it is now possible to do so. A good graphical designer can use it to create subtle difference from the standard surface elevation color branding effects. Used poorly, it mostly creates not so appealing visual and coloring results.

**KNOWN FLUTTER SDK ISSUES**

The issues below in the Flutter SDK itself, are known to impact FlexColorScheme and Flutter 
theming in general.

* Switching `Typography` dynamically in Flutter SDK ThemeData is broken, see
  issue [#103864](https://github.com/flutter/flutter/issues/103864) for more information.
  If it is done and the error is ignored, an app doing so eventually becomes unstable.

* The *Themes Playground* app contains a workaround to avoid issue [#103864](https://github.com/flutter/flutter/issues/103864). The workaround is done by always using the 2021 Typography, and simulate 2018 Typography. This is done by using a custom TextTheme that looks like the 2018 Typography, when selecting it. The Playground App actually always stays in 2021 Typography, but it looks like it switches it. Which it does by applying a custom `TextTheme` to its 2021 Typography, that looks like 2018 Typography is used. All other examples avoid the issue by only using the M3 2021 Typography and not even mimicking a switch between M2 and M3 Typography.

  The above workaround is needed because the *Themes Playground* app has toggles that can switch `Typography`, without the workaround it will eventually crash. With this work-around it never switches Typography, it just looks like it does, but app stays in 2021 Typography all the time. The by Themes Playground generated ThemeData config will use the actual real effective Typography. This is also fine, since an app using the theme will likely never switch used Typography. However, if it does, it will face the same issue as the Playground app did. The issue is a Flutter SDK issue that FlexColorScheme cannot fix. Most likely, 99% of apps will never run into this issue.

* In Flutter *stable 3.0.x*, when opting in on `useMaterial3:true`, the `Material` widget and other SDK widgets built on it, gets no elevation when only the `elevation` property is defined. It is required to also define `shadowColor` and/or `surfaceTintColor` to get any elevation effect. When using the `Material` widget itself this is easy to address. However, widgets like `Drawer`, `PopupMenuButton`, `BottomNavigationBar`, `NavigationRail`, `Dialog`, `AlertDialog`, `TimePickerDialog`, `DatePickerDialog`, `MaterialBanner` and `BottomSheet` do not expose these `Material` properties and cannot be elevated. 
 
  The issue is reported and tracked here [#107190](https://github.com/flutter/flutter/issues/107190) and also mentioned in the `FlexColorScheme` repo here
  [#54](https://github.com/rydmike/flex_color_scheme/issues/54). There are no good workarounds for using elevation on these widgets when `useMaterial3` is true. The options are to not use M3 if such elevations are important to your app design. One working fix is to wrap those widgets in a theme where `useMaterial3` is false, then the rest of your app can still use it. This is, however, a rather tedious workaround. Due to current Flutter SDK `Material` elevation issues when `useMaterial3` is true, it is recommended to not use it until this issue is fixed.

* This regression in master channel impacts AppBar icon colors when using Material 3 [#107305](https://github.com/flutter/flutter/issues/107305). It has not yet landed in stable channel Flutter *stable 3.0.5*, but if you use the master channel, it is something to be aware of.

## 5.0.1

**April 29, 2022**

**FIX**

* For the custom and temporary `m3TextTheme`: Fixed the Typography letterSpacing for bodyLarge to match corrected M3 spec that had wrong specification on the M3 website 0.15 -> 0.5. See Flutter SDK issue [#102121](https://github.com/flutter/flutter/issues/102121).
* Themes Playground: Fix wrong color code copied to clipboard when tapping input color.
* Themes Playground: Make prettier default constructor for FlexSubThemesData() if that is all that was defined in Themes Playground config.

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
for all color values and helper classes with the name "variant" in them have been
self-deprecated in FlexColorScheme. The variant color values still exist
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
    manually using individual properties to match Flutter defaults
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
    defined, you must remove it to stop using it. If you need to toggle it ON and OFF, use a bool
    to enable and disable it, then pass in the `FlexSubThemesData` when enabled,
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
    version of FlexColorScheme and do not do any other changes. You need to
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
  * When you upgrade the package version to 5.0.0 and have used custom color schemes,
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
  It is **style-breaking** with 4.2.0 and 5.0.0-dev.1 & 2.
  It breaks past used style when opting in on component themes and its optional
  custom `m3TextTheme` enabled. The updated custom implementation of it now follows the
  implementation used in the Flutter master channel, apart from this
  [issue](https://github.com/flutter/flutter/issues/102121),
  where it for now implements the value used in the M3 Web guide.
  The changes in styles otherwise concern the addition of the font geometry height, which the
  previous custom implementation did not have. The usage of the custom `m3TextTheme` should be
  considered internal and temporary. It will be changed to use the actual Flutter implementation
  once [PR #97829](https://github.com/flutter/flutter/pull/97829) lands in the Flutter stable
  channel. The custom `m3TextTheme` will then be deprecated.

* The computed colors for `ThemeData` colors `primaryColorLight`, `primaryColorDark` and
  `secondaryHeaderColor` were changed.
  It is **style-breaking** with 4.2.0 and 5.0.0-dev.1 & 2. The change breaks past
  used styles on these rarely used colors. These `ThemeData` colors are also on
  a deprecation path and will likely receive some new none `MaterialColor` dependent
  color defaults when that change happens. The new `ColorScheme.primary` computed
  colors for these rarely used colors are better balanced than before and work well
  regardless of used `ColorScheme.primary` shade and tint.

* The color definition value for `FlexColor.espressoLightPrimary` color was changed.
  This is **style-breaking** with 4.2.0 and 5.0.0-dev.1 & 2. The new color for
  `FlexColor.espressoLightPrimary` breaks past used color for this color constant.
  The color was changed from `0xFF220804` to `0xFF452F2B`. Past color was too dark brown, almost
  black to be very usable in a UI. It was very black coffee like, but not very practical in a UI,
  it was too close to black. Since version 5 is anyway a major style breaking with the introduction
  of the new Material 3 ColorScheme, the opportunity to improve this color value used in the
  built-in theme `espresso` theme was used.

## 5.0.0-dev.3

**April 20, 2022**

* [Detailed changelog](https://github.com/rydmike/flex_color_scheme/blob/master/changelog/changelog_5_0_0_dev_3.md)

## 5.0.0-dev.2

**April 4, 2022**

* [Detailed changelog](https://github.com/rydmike/flex_color_scheme/blob/master/changelog/changelog_5_0_0_dev_2.md)

## 5.0.0-dev.1

**March 14, 2022**

### Overview

Version 5.0.0-dev.1 is a big refactor, with deprecation of previous `variant` based
color names in favor of `container` ones that were added to updated M3
based `ColorScheme` in Flutter 2.10.0. The same additions and changes are now
also introduced in FlexColorScheme. Despite being a very big release, with
many new features, actual breaking changes are very few and mostly concerns
in version 4 deprecated members and, of course, requiring minimum Flutter
2.10.0 to work.

* [Detailed changelog](https://github.com/rydmike/flex_color_scheme/blob/master/changelog/changelog_5_0_0_dev_1.md)

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
  To use this release, at least Flutter 2.8.0 is required.
 
* Added support for opinionated sub-theme for the new Material 3 based
  `NavigationBar`. Flutter version 2.8.0 is the first stable version that
  includes the new Material 3 design based `NavigationBar`.

* Custom `FlexColorScheme` based themes can now also be defined by
  alternatively passing in a `ColorScheme` object to the `colorScheme`
  property in the constructor, as well as in `FlexColorScheme.light` and
  `FlexColorScheme.dark` factories. When used it overrides the `scheme` and
  `colors` properties in the factories. Same color property in any constructor
  that exists as a direct property in the constructors, still have the highest
  priority and will also override corresponding color properties in passed in
  `colorScheme`. The capability to make custom FlexColorScheme based themes from
  standard Flutter color schemes is useful if you already have a predefined
  elaborate `ColorScheme` definition. You can now use it directly and still
  use FlexColorScheme for its surface color branding and easy sub-theming.
  This capability will also be very useful when Material 3 based `ColorScheme`
  in Flutter SDK arrives in the stable channel. With Material 3, color schemes
  may be created using the new Material 3 design color tools, e.g., from
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
    preferred `ColorScheme` color of the text and icon in the Material 3 based
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
* This quick selection of `ColorScheme` based colors as theme based
  colors of widget sub-themes, may be extended to a few more sub-themes in
  future versions. At least if it is seen as a practical and quick way to
  customize widget sub-theme colors within the constraints of colors in
  the `theme.colorScheme`.
* As before you can still apply your own total custom sub-themes to the
  `ThemeData` created with `FlexColorScheme` by using `copyWith`.
  FlexColorScheme is a way to easily make fancy, color consistent and
  balanced `ThemeData` objects using convenience-shortcut properties and
  methods. It does not prevent you from further modifying and tuning the
  produced `ThemeData` with standard Flutter SDK features.

**CHANGE**

* All properties in all `FlexColorScheme` constructors are now
  optional. The change is none breaking, and uses the Material 2
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
    to a version that disables them and resets their state when disabled.
    A few controls are hidden but take up the same space.
    Hiding the controls caused the panels to change size, often causing relayout
    of the masonry-grid layout. This was confusing UX, as entire panels might
    move into new places. While the UI hide animations were cool, this keeps
    the panels in the same place in the grid, which is less confusing to use.
    Panels can still be closed, and it, of course, causes relayout of the grid too,
    but in that use case it is expected.
  * Changed ColorScheme indicator boxes to use the themed border radius.
  * Added a button to copy theme, and improved the explanations to make the
    functionality more obvious and accessible. Previously, only the entire
    ListTile was the button. This UI with no button was not so clear. Now
    there is also a button that says COPY. Clicking on the ListTile still
    works as well.
  * Add and updated app icon resources used by all the example apps.
  * Updated to a new breaking version of StaggeredGridView 0.6.0. It no longer
    requires previously used bug work around(s) for a window resize issue that
    had existed since 2019. For more info on this solved issue, see this
    [article](https://rydmike.com/gridview).
  * Added most new features in version 4.2.0 to the Themes Playground app and
    its theme code generation.


* **Example theme — Copy Playground Theme**
  * Added a new simple template example, that is handy for trying copy-pasted
    theme setup code, generated by Themes Playground example 5.


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

* The `defaultRadius` in `FlexSubThemesData` now defaults to null, 
  sub-themes border radius will then default to M3 default border
  radius per widget. The const default value it had before was a remnant from early
  dev phase when widgets all defaulted to single shared radius and not M3
  defaults per widget type. If you explicitly passed in null, you did also in
  previous versions get the M3 defaults. Older tests did that, but now they expect
  the same result when no value is assigned, as it should have been.

**CHANGE**

Opt in opinionated sub themes minor style changes:

* Added missing themed background color for `SnackBarThemeData` when
  using opt in opinionated sub themes.
 
* Tuned the colored text theme on the sub themes that are applied when
  using the optional colored text themes. The text styles now better match
  the regular none colored style,
  and they are a bit more subtle. Text style `caption` got a bit
  of opacity. M2 designed widgets like `ListTile`, depend on it for
  making more muted subtitles by default for `ListTile` via the heading level
  opacity on `caption` text style. The opacity on it is lower though, to
  retain a bit more contrast on blended surfaces, while still adhering to
  the style intent.

* Major updates to readme doc, and typo corrections.

**EXAMPLES**

* Updated and tuned the examples. Example 5, the **Themes Playground**
  now includes capability to define custom color schemes starting from built-in ones.
  It can also generate the FlexColorScheme setup code needed for any defined
  viewed theme setup. You can copy/paste a theme's Flutter Dart code,
  from the Themes Playground to your app and use it as its theme. This is a
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
Version 4.0.0 does, however contain so many new
features, that it in itself warrants a new major release bump.

**BREAKING** 

* In dark mode, the `darkIsTrueBlack` now makes `surface` color
  8% darker instead of 6%. This change was needed to support overlay color
  in dark mode when using `darkIsTrueBlack` when using the new `surfaceMode`
  property. For more information, see Flutter SDK
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
  * The defaults for the sub-themes are inspired by
  [Material 3 design (M3)](https://m3.material.io). It mimics it to a large extent
  when using default value sub-theme values and settings. The varying corner
  radius is different per widget type. The new TextTheme Typography is also
  included. All parts cannot be made to look exactly like M3 in Flutter when using
  [Material 2 design (M2)](https://material.io), but many parts
  can, and where possible the defaults try follow those values. You can, of course, 
  override the defaults.
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
  * Via the sub themes, it is by default opted-in to also use a bit Material You
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
  property. Previously, only the individual color value definitions were exposed.
 
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
  in the previous version of FlexColorScheme, using it did however require
  special Android build configuration setup. This is no longer required.

* **New color schemes:** Added four new built-in color schemes.
  The total number of color schemes is now 36 matched light and dark pairs.
  * **Blue whale**, jungle green and outrageous tango orange.
    Use enum value `FlexScheme.blueWhale` for easy access to it.
    This theme is final and selected for inclusion as a new one.
  * **San Juan blue** and pink salmon theme.
    Use enum value `FlexScheme.sanJuanBlue` for easy access to it.
  * **Rosewood** red, with horses neck and driftwood theme.
    Use enum value `FlexScheme.rosewood` for easy access to it.
  * **Blumine**, easter blue and saffron mango theme.
    Use enum value `FlexScheme.blumineBlue` for easy access to it.
  
**CHANGE**

* The `FlexColor.schemesList` is now a `const` for improved efficiency.


**DOCS**
 
* The new main example is a complete quick start guide that doubles as the
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

* [Changes](https://github.com/rydmike/flex_color_scheme/blob/master/changelog/changelog_4_0_0_dev_1.md)

## 3.0.1

**July 1, 2021**

* [Changes](https://github.com/rydmike/flex_color_scheme/blob/master/changelog/changelog_3_0_1.md)

## 3.0.0

**June 25, 2021**

* [Changes](https://github.com/rydmike/flex_color_scheme/blob/master/changelog/changelog_3_0_0.md)

## 2.1.1

**March 30, 2021**

* [Changes](https://github.com/rydmike/flex_color_scheme/blob/master/changelog/changelog_2_1_1.md)

## 2.1.0

**March 22, 2021**

* [Changes](https://github.com/rydmike/flex_color_scheme/blob/master/changelog/changelog_2_1_0.md)

## 2.0.0

**March 15, 2021**

* [Changes](https://github.com/rydmike/flex_color_scheme/blob/master/changelog/changelog_2_0_0.md)

## 2.0.0-nullsafety.2

**March 15, 2021**

* [Changes](https://github.com/rydmike/flex_color_scheme/blob/master/changelog/changelog_2_0_0-nullsafety_2.md)

## 2.0.0-nullsafety.1

**February 4, 2021**

* [Changes](https://github.com/rydmike/flex_color_scheme/blob/master/changelog/changelog_2_0_0-nullsafety_1.md)

## 1.4.1
 
**January 31, 2021**

* [Changes](https://github.com/rydmike/flex_color_scheme/blob/master/changelog/changelog_1_4_1.md)

## 1.4.0

**January 18, 2021**

* [Changes](https://github.com/rydmike/flex_color_scheme/blob/master/changelog/changelog_1_4_0.md)

## 1.3.0

**January 7, 2021**

* [Changes](https://github.com/rydmike/flex_color_scheme/blob/master/changelog/changelog_1_3_0.md)

## 1.2.0

**January 4, 2021**

* [Changes](https://github.com/rydmike/flex_color_scheme/blob/master/changelog/changelog_1_2_0.md)

## 1.1.1

**December 31, 2020**

* [Changes](https://github.com/rydmike/flex_color_scheme/blob/master/changelog/changelog_1_1_1.md)

## 1.1.0

**December 29, 2020**

* [Changes](https://github.com/rydmike/flex_color_scheme/blob/master/changelog/changelog_1_1_0.md)

## 1.0.0

**December 21, 2020**

* Version 1.0.0 released

**DOCS**

* Documentation layout updates and typo corrections.

## 1.0.0-dev.2

**December 21, 2020**

* [Changes](https://github.com/rydmike/flex_color_scheme/blob/master/changelog/changelog_1_0_0-dev.2.md)

## 1.0.0-dev.1

**December 17, 2020**

* First development pre-release on pub.dev.
