# Changelog

All changes to the **FlexColorScheme** (FCS) package are documented here.

## 8.0.1-dev.3.22

**Nov 13, 2024**

### Package

**FIX** 

- This is a special release of **FlexColorScheme** version 8, it is identical to release 8.0.1, but it removes the `locale` API from the `InputDecorationTheme` to keep version 8 compatible with Flutter 3.22.x. If you use Flutter 3.24 or later, you should use the 8.0.0 or later releases instead. 


### Themes Playground

- Added a quick share button on the side menu. It exports the Playground settings to JSON, makes a URL of it and copies the result to the clip board in one go. Ready to be shared where needed.



## 8.0.0

**Nov 3, 2024**

### SUMMARY

Version 8.0.0 makes **FlexColorScheme** fully aligned with Flutter's **MAJOR BREAKING** Material-3 theming changes introduced in **Flutter version 3.22**. Due to Flutter 3.22 breaking many past Material styles, introducing new colors to `ColorScheme` and deprecating three colors, FlexColorScheme had to undergo major revision and also break many of its past styles and some older APIs.

Most APIs are still there and work as before, but a few produce results that differ slightly from past ones, just like **Flutter 3.22** also does over previous versions. Generally, the upgrade should be smooth, but you may need to review the produced theme result to see that you don't get any changes that don't fit with your design goals. Some past defaults have changed in FCS V8, but previous settings are still available. However, you will need to enable them explicitly to get the same results as before. The purpose of these default value changes is to make FCS have less opinionated defaults, and be more aligned with Flutter's Material-3 design defaults. The **Themes Playground** app will still have some of its own opinionated defaults, done via default settings values the app uses in its default configuration, but the package Material-3 default starting points are now much more aligned with Flutter's Material-3 defaults.

In the **Themes Playground** you can now export and import settings to a JSON file, and import them back into the Playground later. This is a great way to save your theme settings for later re-use. The exported JSON contains all the internal controller settings values you have configured in the Playground app, that are needed to restore a given configuration state. This **Playground** feature was a nice contribution by GitHub user [@akiller](https://github.com/akiller) in [!PR 257](https://github.com/rydmike/flex_color_scheme/pull/257), thank you! This contributed feature got enhanced with more error handling and a slightly refined UI to make it production ready. As a further enhancement of the JSON export feature, the **Themes Playground** app also got the ability to convert the exported settings JSON config to a shareable URL. You can now share Playground settings with other Flutter developers. 



### MIGRATION

The most critical changes to migrate from **FlexColorScheme V7 to V8** are listed below. For a full list of all breaking changes, see **PACKAGE CHANGES** and the **BREAKING** part further below.

* The flag `useMaterial3` now defaults to `true` in `FlexColorScheme` and `FlexThemeData` constructors. Set it to `false` to explicitly use Material-2 theming. It defaulted to true before. Material-2 is still fully supported in FCS v8 and Flutter v3.24, but will eventually be deprecated in Flutter, when that happens, it will also happen in FCS. 
  >With the **Themes Playground** app, you can use a pre-configured Material-3 based theme that looks very similar to legacy Material-2 design. This will continue to be available also after Material-2 is deprecated in Flutter.  

* The `FlexSubThemesData` properties `interactionEffects`, `tintedDisabledControls`, `defaultUseM2StyleDividerInM3` and `blendOnColors` now all default to `false`. In previous versions they defaulted to `true`. If you before had not explicitly turned these properties `false`, they were all `true` by default. To get the same result as before in FCS V8, you now have to set these properties to `true`. This change was made to have fewer opinionated defaults in FCS to align it more with Flutter SDK default styles. 

* The `FlexSubThemesData` property `navigationRailLabelType` no default to `NavigationRailLabelType.none`. To get the same result as before by default, you will need to set it to `NavigationRailLabelType.all`. This change was made to have fewer opinionated defaults in FCS to align it more with Flutter SDK default styles. The Playground defaults it to `NavigationRailLabelType.all` by adding this by default to new default themes.

* Since `ColorScheme.background` color was deprecated in Flutter 3.22.0 we can no longer use it as a part of surface blends and its modes. For example, when `surfaceMode` is set to `FlexSurfaceMode.highBackgroundLowScaffold` it now uses surface and dialog blends set to 2x instead of 1x, so that it represents the "high background" style as before, but done via surface color. Without this breaking change, this mode would produce the same result as `FlexSurfaceMode.levelSurfacesLowScaffold` and be redundant. 
  * **NOTE:** You may want to check your surface mode and blends to see that they still look as you want them to, as they may have changed slightly depending on your configuration. We have tried to keep required changes subtle, you may not notice any difference, but it is good to check. These changes we forced by Flutter 3.22.0 deprecation of `ColorScheme` colors `background`, `onBackground` and `surfaceVariant`.


This major release has many breaking changes forced via breaking changes in Flutter 3.22.0. Due to this, the release also uses this opportunity to clean up APIs with opinionated defaults, like the ones mentioned above. There are additional smaller and more subtle changes in defaults values, that align FCS to use the same color defaults from the new `ColorScheme` colors, that Flutter started using in version 3.22.0 as well. You can find all the details below in the **PACKAGE CHANGES** chapter.  

### BACKGROUND

Flutter 3.22 introduced a large number of breaking changes to the `ColorScheme` and default color mappings that Flutter's Material components use. In total, the Flutter 3.22.0 release adjusted 249 of its own internal tests to accommodate for new Material-3 spec changes, that all broke past Flutter Material-3 component styles. For a reference to the broken and updated tests, see [this issue side comment](https://github.com/flutter/flutter/issues/130135#issuecomment-2308522312).

FlexColorScheme V8 now allows you to use the new colors introduced in Flutter 3.22. As before, with FCS you can get fully defined hand-tuned `ColorScheme`s without using Material-3 design's Material Color Utilities (MCU) based seed-generated ColorSchemes. You may prefer to use seed generated ColorSchemes with Material-3, but it is nice to know you do not have to.

To the seed generated `ColorScheme`s, FCS adds support for all the Flutter `DynamicSchemeVariant` seed generated variants. It also improves them by allowing you to use separate seed colors for each palette. With Flutter's `ColorScheme.fromSeed`, you can only seed with one color, the primary color. The resulting `ColorScheme` always uses computed values for **secondary** and **tertiary** palettes, plus a hard coded fixed color for the **error** palette seeding. **Surfaces** colors are always tied to primary color as well and include a hint of primary color. With FCS, you do not have these limitations, you can seed with separate colors for each palette with even with Flutter's own dynamic scheme variants. This was always possible with FlexColorScheme and its FlexSeedScheme (FSS) based FlexTones, seed generated scheme variants. FCS now brings this feature to Flutter's own dynamic scheme variants as well.

As before, FCS also has its own even configurable `FlexTones` way of making seed generated ColorSchemes. Typically, you use predefined `FlexTones`, but you can also create your own `FlexTones` configurations. With it, you can define the chroma goals for each palette and define which tone is mapped to what `ColorScheme` color. An internal example of using them is the implementation of `FlexTones` modifiers. 

FlexColorScheme V8 adds three new `FlexTones` modifiers. The most useful one is called `monochromeSurfaces()`. This tone modifier makes the surface shades of any used `FlexTones` configuration use monochrome greyscale shades for the surface and surface variant palettes. It thus gives us greyscale colors for **ALL** surfaces, instead of primary-tinted ones. It can be applied to any `FlexTones` seed generated scheme variant. The other new modifiers are `expressiveOnContainer()` and `higherContrastFixed()`. Check the API docs for more details.

### PACKAGE CHANGES

This section contains a detailed list of all changes introduced in FlexColorScheme version 8.0.0.
  
**BREAKING CHANGES**

This version contains a lot of breaking changes due to updates in the Material-3 ColorScheme in Flutter 3.22. At the same time, this release uses the forced breaking change to clean up some older APIs. FCS is now more aligned with Flutter's Material-3 theming defaults, by typically using them as starting points in the default Material-3 mode. Material-2 mode is still supported, it has its own opinionated defaults as before.

- The `ThemeData` flag `useMaterial3` is now **true by default** to align with **Flutter 3.16.0** and later default for ThemeData. To continue using Material-2 theming, set `useMaterial3` to false. All component themes in `FlexSubThemes` that have a `useMaterial3` property now also default to true. 
- Keeping to Material-3 defaults, in the theme factories `light` and `dark`, if `scheme` is undefined it now defaults to `FlexScheme.materialBaseline` the Material-3 baseline scheme, when `useMaterial3` is true. If `useMaterial3` is false and `scheme`is undefined, it defaults to `FlexScheme.material`, the default Material-2 theme, as before. 


- Removed **ALL** references to in Flutter 3.22 deprecated `ColorScheme` colors `background`, `onBackground` and `surfaceVariant`. They are not used in FCS anymore. The `background` color was critical for FCS surface blending, it is now handled differently. The removal of these `ColorScheme` colors had far-reaching, but typically still subtle implications on styles created by FCS. There are many breaking minor style changes in this release due to this. Here are the critical changes caused by all these breaking changes in Flutter 3.22:
  - Deprecated `background` and `onBackground` colors in `FlexColorScheme`, `FlexColorScheme.light`, `FlexColorScheme.dark`, `FlexThemeData.light` and `FlexThemeData.dark` factories. They are not used anymore. Use `surface` and `onSurface` colors instead.
  - Deprecated `background`, `onBackground`, `surfaceVariant` from `FlexSchemeOnColors` and `FlexSchemeSurfaceColors`. They are no longer used and have no function. They were deprecated since the same colors were deprecated in `ColorScheme` in Flutter 3.22.
  - Deprecated `surfaceVariantAlpha` and `backgroundAlpha` colors in `FlexAlphaValues`. They are not used anymore and have no function, use `surfaceAlpha` instead. They were deprecated since the colors they related to were deprecated in `ColorScheme` in Flutter 3.22.
  - The `FlexSchemeSurfaceColors.blend` factory constructor produces slightly different blend result than in earlier versions. Because Flutter 3.22 deprecated `ColorScheme` colors `background`, `onBackground` and `surfaceVariant`, that were used in the blend calculation earlier. It is no longer possible to produce the same results as before, but the results are equivalent to previous design intent. With one exception, using `surfaceMode` with `FlexSurfaceMode.highBackgroundLowScaffold` sets surface and dialog blends to 2x instead of 1x, so that it represents the "high background" style as before, but done via surface. Without this breaking change, this mode would produce the same result `FlexSurfaceMode.levelSurfacesLowScaffold` and be redundant.
  - The enum `SchemeColor` **removed** all the corresponding colors that Flutter 3.22 deprecated. This is a **VERY breaking** change and will break your code if you happened to use any of the removed enum values. This may likely happen. The removed enum values are: `SchemeColor.background`, `SchemeColor.onBackground` and `SchemeColor.surfaceVariant`. For **background** Flutter recommends that you should use the values `SchemeColor.surface` and `SchemeColor.onSurface` instead and for `surfaceVariant` the `SchemeColor.surfaceContainerHighest` is recommended. In all cases you can try the other new surface colors as well, to see what best fits your design goals and intent. 
  - The enum `SchemeColor` got support for all the new colors in Flutter 3.22 `ColorScheme`. It also removed the colors Flutter 3.22 deprecated. The order of the enum values was modified. This will break usage that depends on the enum's index, for example, storage of the values for implementations that depend on the index value.
  - Property `systemNavBarStyle` in `FlexColorScheme.themedSystemNavigationBar` now defaults to `FlexSystemNavBarStyle.surface`, instead of `FlexSystemNavBarStyle.background`. Using `FlexSystemNavBarStyle.background` results in the color `Theme.of(context).colorScheme.surfaceContainerLow` being used, where it previously was `Theme.of(context).colorScheme.background`. This is because Flutter 3.22 deprecated `ColorSCheme.background`.
  - The enum `FlexAppBarStyle` value `background` now results in the `AppBar` using the `surfaceContainerLow` color instead of `background`. This breaking change was introduced because of the breaking change in Material-3 in Flutter 3.22 where the color `background` was deprecated. The new color is kind of the best match for the old `background` color in a typical FCS configuration.
  - The enum `FlexSystemNavBarStyle` value `background` now results in the app bar using the `surfaceContainerLow` color instead of `background`. This breaking change was introduced because of the breaking change in Material-3 in Flutter 3.22 where the color `background` was deprecated. The new color is kind of the best match for the old `background` color in typical FCS configuration. 


- Breaking rename: All helper component themes in `FlexSubThemes` ended with `Theme`, as designed, except `FlexSubThemes.bottomNavigationBar`. This mistake is now corrected, it was renamed to `FlexSubThemes.bottomNavigationBarTheme`. The old version is deprecated and passes its props through to the renamed version. The old and wrong named one will be removed in version 9.0.0. 

- Deprecated `FlexSubThemesData.blendTextTheme`, it no longer has any function. See topic _"Why is blendTextTheme deprecated?"_ further below for more information,

- Deprecated the FCS legacy property `useFlutterDefaults`. FlexColorScheme in Material-3 mode now defaults to using Flutter default styles. For other configurations, modify them as desired. In Material-2 mode, FCS continues to use its opinionated own defaults as before, as long as Material-2 exists.


- Deprecated the static function `FlexColorScheme.createPrimarySwatch`, it is no longer used by FlexColorScheme internally, it is now deprecated in FlexColorScheme and will go away in V9. After this, you will still be able to find this function in `ColorTools` in the package `flex_Color_picker`, where it will remain available.


- Replaced the FCS legacy property `useTextTheme` with a more feature correctly named property `useMaterial3Typography`. Use it instead. The `useTextTheme` originally had another function in much older versions of FCS. Its name no longer represented its function, the new name does. If not defined, the default is `true` in Material-3 mode and `false` in Material-2 mode. If you still use Material-2, try setting this to true to get nicer typography in Material-2 mode.


- The color `material3DarkOnErrorContainer` was changed from `Color(0xFFFFB4AB)` to `Color(0xFFFFDAD6)` to match the **new** Material-3 default dark error color used in **Flutter 3.22**. 


- Dialog background color now defaults to `surfaceContainerHigh` with no elevation tint color in Material-3 mode, instead of `surface` with elevation tint. Breaking change introduced to match the breaking change in Material-3 defaults in Flutter 3.22.


- The `ElevatedButton` background color now defaults to `surfaceContainerLow` with no elevation tint color in Material-3 mode, instead of `surface` with elevation tint. This breaking change was introduced to match the breaking change in Material-3 defaults in Flutter 3.22.


- The `PopupMenuButton` background color now defaults to `surfaceContainer` with no elevation tint color in Material-3 mode, instead of `surface` with elevation tint. This breaking change was introduced to match the breaking change in Material-3 defaults in Flutter 3.22.


- The `MenuBar` background color now defaults to `surfaceContainer` instead of `surface` with elevation tint in Material-3 mode. This breaking change was introduced to match the breaking change in Material-3 defaults in Flutter 3.22.

- The produced `MenuTheme` background color now defaults to `surfaceContainer` with no elevation tint color in Material-3 mode, instead of `surface` with elevation tint. This breaking change was introduced to match the breaking change in Material-3 defaults in Flutter 3.22. This affects default background color of the opened menu on `MenuBar`, `MenuAnchor` and `DropdownMenu`.


- The `BottomSheet` background color now defaults to `surfaceContainerLow` with no elevation tint color in Material-3 mode, instead of `surface` with elevation tint. This breaking change was introduced to match the breaking change in Material-3 defaults in Flutter 3.22.


- The produced `DrawerTheme` background color now defaults to `surfaceContainerLow` with no elevation tint color in Material-3 mode, instead of `surface` with elevation tint. This breaking change was introduced to match the breaking change in Material-3 defaults in Flutter 3.22. This affects the default background color of the `Drawer` and `NavigationDrawer`. FCS uses `surfaceContainerLow` as background color in Material-2 mode by default too.
- The produced `DrawerTheme` width now defaults to 304 dp in Material-3 mode. The [official Material-3 spec is 360 dp](Material-3 spec https://m3.material.io/components/navigation-drawer/specs), FCS was using it, but Flutter SDK has so far "declined" following the Material-3 spec here and still uses the older default 304 dp used in the Material-2 spec. This older default is actually a better choice, so FCS has now opted to revert to using it as default too. For more information about this and why 304 dp is better, see Flutter [issue #123380](https://github.com/flutter/flutter/issues/123380).  
 

- The `FlexSubThemesData` properties `interactionEffects`, `tintedDisabledControls` and `defaultUseM2StyleDividerInM3` now all default to `false`. In previous versions they defaulted to `true`. This change was made to have fewer opinionated defaults in FCS to align it more with Flutter SDK default styles. If you had **NOT** configured these values before, they defaulted to `true`. You now have to set them explicitly to `true` to opt in and get the same results as you got before when they were not configured.

 
- The `FlexSubThemesData` properties `blendOnColors` now defaults to `false`. In previous versions it defaulted to `true`. This change was made to have fewer opinionated defaults in FCS, to align it more with Flutter defaults. If you had **NOT** configured this values before, it defaulted to `true`. You now have to set it explicitly to `true` to get the same result as before, when it was not configured. Consider setting this property `true` in dark mode, and false in `light` theme mode, for a style that matches the Material-3 color design, when you are not using a seed generated `ColorScheme`. This setting has no effect when using a seed generated `ColorScheme`, as it generates blended/tinted onColors based on the seed algorithm, that overrides the effect of this setting. This setting creates a similar effect for none seeded ColorSchemes.


- The `FlexSubThemesData` property `inputSelectionHandleSchemeColor` when not defined, defaults to `inputDecoratorSchemeColor` and if it is not defined either, the effective text selection handle color result is `ColorScheme.primary`, same as Flutter SDK default. In previous versions, no definitions, resulted in `ThemeData.primaryColorDark` being used. This was changed in preparation of Flutter's planned deprecation of `primaryColorDark`.   
- The `FlexSubThemesData` property `inputDecoratorIsFilled` now default to `false` when undefined, like Flutter SDK does. Set it to `true` to get the same style it had with previous undefined value.
- The `FlexSubThemesData` property `inputDecoratorBorderType` now default to `FlexInputBorderType.underline` when undefined, producing same default as Flutter SDK does. Set it to `FlexInputBorderType.outline` to get the same style it had with previous undefined value.
- The `FlexSubThemesData` property `inputDecoratorUnfocusedBorderIsColored` now default to `false` when undefined, like Flutter SDK does. Set it to `true` to get the same style it had with previous undefined value.
- In `FlexSubTheme.InputDecorationTheme` the following properties have new breaking default values: `filled` default to `false`, `borderType` default to `FlexInputBorderType.underline` and `unfocusedBorderIsColored` to `false`.



- The `FlexSubThemesData` properties `navigationRailMutedUnselectedLabel` and `navigationRailMutedUnselectedIcon` now default to `false`. In previous versions they defaulted to `true`. This change was made to have fewer opinionated defaults in FCS and follow Material-3 design spec by default.
- The `FlexSubThemesData` properties `navigationRailUseIndicator` now defaults to `null`, resulting in `true` being used in Material-3 mode and `false` in Material-2 mode. In previous versions it defaulted to `true`. This change was made to have fewer opinionated defaults in FCS and follow Material design specs for default values. If you still use Material-2, you now have to set this to true to see the indicator. The Playground now always sets either true or false in both modes, it never leaves out the default choice in generated config code. The field is nullable, and you can now also get the M2/M3 different default styles, by not defining this property at all.
- In `FlexSubThemes.navigationRailTheme` the properties `mutedUnselectedLabel` and `mutedUnselectedIcon` now default to `false` if undefined. In previous versions they defaulted to `true`. Property `selectedLabelSchemeColor` defaults to `onSurface` and `unselectedLabelSchemeColor` default to `onSurfaceVariant`, they were `primary` before. Property `unselectedIconColor` now defaults to `onSurfaceVariant` it was `onSurface`. Property `selectedIconColor` now defaults to `onSecondaryContainer` it was `primary`. Property `labelType` now defaults to `NavigationRailLabelType.none` it was `NavigationRailLabelType.all`.
  - All these changes were made to have fewer opinionated defaults in FCS and follow Material-3 design spec by default. Past FCS defaults were made before some Material-3 specs existed. In some cases, earlier FCS versions also kept its opinionated defaults from Material-2 as defaults for its Material-3 default theme. 
- The `FlexSubThemesData` properties `navigationRailUnselectedLabelSchemeColor` and `navigationRailUnselectedIconSchemeColor` now default to `onSurfaceVariant` (was `onSurface`). The `onSurfaceVariant` is used as on color pair default when any surface color is used as background color for the rail, if a none surface color is used as background scheme color, its contrast color pair is used as default for the labels and unselected icons. The `navigationRailSelectedIconSchemeColor` will if undefined, default to the contrast color pair for `navigationRailIndicatorSchemeColor`. These default behaviors result in less configuration in typical designs, while starting points defaults are the same as before and full configuration options are also available as before. The equivalent colors in `FlexSubThemes.navigationRailTheme` behave the same way.


- The `FlexSubThemesData` properties `navigationBarMutedUnselectedLabel` and `navigationBarMutedUnselectedIcon` now default to `false`. In previous versions they defaulted to `true`. This change was made to have fewer opinionated defaults in FCS and follow Material-3 design spec by default.
- In `FlexSubThemes.navigationBarTheme` the properties `mutedUnselectedLabel` and `mutedUnselectedIcon` now default to `false` if undefined. In previous versions they defaulted to `true`. Property `selectedLabelSchemeColor` defaults to `onSurface` and `unselectedLabelSchemeColor` default to `onSurfaceVariant`, they were `primary` before. Property `unselectedIconColor` now defaults to `onSurfaceVariant` it was `onSurface`. Property `selectedIconColor` now defaults to `onSecondaryContainer` it was `primary`.
  - All these changes were made to have fewer opinionated defaults in FCS and follow Material-3 design spec by default. Past FCS defaults were made before some Material-3 specs existed. In some cases, earlier FCS versions also kept its opinionated defaults from Material-2 as defaults for its Material-3 default theme.
- The `FlexSubThemesData` properties `navigationBarUnselectedLabelSchemeColor` and `navigationBarUnselectedIconSchemeColor` now default to `onSurfaceVariant` (was `onSurface`). The `onSurfaceVariant` is used as on color pair default when any surface color is used as background color for the rail, if a none surface color is used as background scheme color, its contrast color pair is used as default for the labels and unselected icons. The `navigationBarSelectedIconSchemeColor` will if undefined, default to the contrast color pair for `navigationBarIndicatorSchemeColor`. These default behaviors result in less configuration in typical designs, while starting points defaults are the same as before and full configuration options are also available as before. The equivalent colors in `FlexSubThemes.navigationBarTheme` behave the same way.

  
- The `FlexSubThemesData` properties `bottomNavigationBarMutedUnselectedLabel` and `bottomNavigationBarMutedUnselectedIcon` now default to `null`, resulting in `true` being used as default in Material-2 mode and `false` in Material-3 mode. In previous versions these properties defaulted to `true` in both modes. This change was made to have fewer opinionated defaults in FCS.
- The `FlexSubThemesData` properties `bottomNavigationBarUnselectedLabelSchemeColor` and `bottomNavigationBarUnselectedIconSchemeColor` now default to `onSurfaceVariant` in Material-3 mode, it was `onSurface`, which remains the default in Material-3 mode. In Material-3 mode, the `onSurfaceVariant` is used as on color pair default when any surface color is used as background color for the navigation bar. If a none surface color is used as background scheme color, its contrast color pair is used as default for the labels and unselected icons, in both Material-2 and Material-3 mode. These default behaviors result in less configuration in typical designs, while starting points defaults are the same as before and full configuration options are also available as before. The equivalent colors in `FlexSubThemes.bottomNavigationBar` behave the same way.


- The `FlexSubThemesData` property `chipDeleteIconSchemeColor` now default to `SchemeColor.onSurfaceVariant`. In previous versions it defaulted to `SchemeColor.onSurface`. Likewise in `FlexSubThemes.chipTheme` the property `deleteIconSchemeColor` now defaults to `SchemeColor.onSurfaceVariant` if undefined. In previous versions it defaulted to `SchemeColor.onSurface`. This change was made to adjust to follow updated Material-3 spec defaults.


- The `FlexSubThemesData` property `drawerUnselectedItemSchemeColor` now default to `SchemeColor.onSurfaceVariant`, as on color pair default when any surface color is used as drawer background color. Previously it defaulted to `onSurface`. Likewise in `FlexSubThemes.navigationDrawerTheme` the property `unselectedItemSchemeColor` now defaults to `SchemeColor.onSurfaceVariant` if undefined. This was changed to use ase as Material-3 defaults.


- Minor style breaking, the tinted interactions were slightly modified. They are now a bit less pronounced and also have a bit less gray in them.

**NEW**

- Added three new `FlexScheme`s, called `blackWhite`, `greys` and `sepia`. They are primarily intended to be used as prototype phase color schemes that do not use colors. This can be useful for focusing on features and layout during the early development phase, keeping the discussion away from colors. The schemes can also be used as neutral baselines for custom color schemes, where only a few colors are overridden with custom colors.

- The const color definition class `FlexColor` got 24 new color values to support monochrome greyscale colors for all new surfaces and their on colors for light and dark mode. These are used as starting colors for the new surface colors in the **Flutter 3.22** updated and new Material-3 `ColorScheme`, when a seed generated `ColorScheme` is **NOT** used. These colors follow the naming convention `lightFlexSurface___` and `darkFlexSurface___`, plus their on and inverse versions.

- Added named bool parameter `useOnSurfaceVariant` that defaults to `false`, to `FlexSubTheme.schemeColorPair()` and to `FlexSubTheme.onSchemeColor()`, when set to true, the on color `onSurfaceVariant` is returned instead for `onSurface` for all surface colors.

- Added `black`, `white` and `transparent` as enum values to `SchemeColor`. These are not `ColorScheme` colors, **but** these colors can in many theming situations be useful instead of the `ColorScheme` based ones.
  - The automatic on color pair for black is white and white for black. For transparent, it is `onSurface`. 
- Added all the new surface colors in Flutter 3.22 to `FlexSchemeSurfaceColors`.
- Added all the new on colors in Flutter 3.22 to `FlexSchemeOnColors`.
 

- The `FlexKeyColor` class got three new properties, `contrastLevel`, `useExpressiveOnContainerColors` and `useLegacyMonochromeSeedBehavior`. They are used to control seed generation results.

  1) The `contrastLevel` is used to control the contrast level of MCU generated scheme colors. The `contrastLevel` parameter indicates the contrast level between color pairs, such as `primary` and `onPrimary`. The value 0.0 is the default, standard contrast; -1.0 is the lowest; 1.0 is the highest. From the Material-3 Design guideline, the standard, medium and high contrast options correspond to values 0.0, 0.5 and 1.0 respectively. 
      - The `contrastLevel` property is only available when seed generating a `ColorScheme` using `FlexSeedScheme`'s `SeedColorScheme.fromSeeds` when a scheme `variant` is used where its `FlexSchemeVariant.value`, `isFlutterScheme` is true. This set corresponds to all the `DynamicSchemeVariant`s available in the Flutter SDK.
      - The `contrastLevel` is the same as the Flutter `contrastLevel` property available in `ColorScheme.fromSeed`. As of Sep 3, 2024, this `contrastLevel` is still only available in the master channel. It will land in the next Flutter stable, released after Flutter 3.24. With FCS v8 you can use it already now.
        > When using FSS `tones` based seed generated schemes or a `variant` having its `FlexSchemeVariant.value`, `isFlutterScheme` it set to `false`, the `contrastLevel` value is ignored. With `tones` based schemes, the contrast level can instead be defined as desired using custom `FlexTones` configurations. There are two predefined higher contrast level tone and chroma mappings available as `FlexTones.highContrast` and `FlexTones.ultraContrast`, you can use them as they are, or as examples of how to create your own custom high contrast tone mappings.
 
  2) The boolean `useExpressiveOnContainerColors` is used to make the light theme mode colors `onPrimaryContainer`, `onSecondaryContainer`, `onTertiaryContainer` and `onErrorContainer` more color expressive, at the cost of their contrast level and accessibility. Defaults to `false` if undefined.

     - The Material design spec for the tones used by the colors `onPrimaryContainer`, `onSecondaryContainer`, `onTertiaryContainer` and `onErrorContainer` have changed from tone **10** to **30** for **LIGHT** theme mode. This change will land in Flutter when the Material Color Utilities (MCU) package is updated to at least 0.12.0. This has not been done even in master (Sep 3, 2024). 
     - Setting the `useExpressiveOnContainerColors` to `true` will make the colors use the new expressive tone. The expressive tone spec is not yet used in Flutter SDK, but is in the Material-3 design spec and also in MCU v 0.12.0. When this change lands in stable Flutter, it will be made **ON** by default in FCS too. You will still be able to opt out of using it. Flutter SDK and MCU will not contain such an opt-out feature.
     - The new **on** color tones for containers in light mode make them more color expressive, but they also reduce their contrast level and accessibility. We recommend keeping them at the higher contrast level, by setting `useExpressiveOnContainerColors` to `false`. With it set to false, you will also keep this preference when the Flutter SDK defaults to using the expressive tones. 

  3) The boolean `useLegacyMonochromeSeedBehavior` is used for enabling the legacy behavior for monochrome seed colors
     - With Flutter SDK and also FCS versions before 8.0.0, using a monochrome seed color or white color, resulted in a tonal palette with cyan color tones. Whereas a black seed color resulted in red like color tones. This is not very intuitive and not really expected or desired when using monochrome seed colors. In version 8.0.0 and later of FCS any monochrome RGB input value will result in the creation of a greyscale tonal palette for the palette using the monochrome seed color. An RGB monochrome value is one where Red, Green and Blue values are all equal.
     - If you require the old style seed result for monochrome seed colors, set `useLegacyMonochromeSeedBehavior` to `true`.
     - Defaults to `false`.
     - Under the hood this setting is passed to `respectMonochromeSeed` in `SeedColorScheme.fromSeeds` in FlexSeedScheme's internal MCU fork, and sets it `!useLegacyMonochromeSeedBehavior`. In FSS this feature is opt-in and recommended to be used. Here, in FCS this setting is opt-out if not desired, and it is strongly recommended to use the new behavior. When using `useLegacyMonochromeSeedBehavior` with
       > When using `useLegacyMonochromeSeedBehavior` with `DynamicSchemeVariant` variants `fidelity` or `content`, for some monochrome input colors they produce `primaryContainer` and `onPrimaryContainer` as well as `tertiaryContainer` and `onTertiaryContainer` color pairs, with low contrast. Consider using some other scheme variants with monochrome seed colors. All others work well with any monochrome seed color. This is just how the MCU `DynamicScheme`s `SchemeContent` and `SchemeFidelity` are defined in MCU. They also produce fairly low contrast for these color pairs with very dark seed colors. This behavior with MCU's `SchemeContent` and `SchemeFidelity` could be fixed in FlexSeedScheme's internal MCU fork, but we want to keep the result of these schemes consistent with MCU. 


- Added TextStyles for `FlexSubThemesData` so that:
  - `FlexSubThemes.appBarTheme` **uses** `FlexSubThemesData.appBarToolbarTextStyle` for its `toolbarTextStyle`.
  - `FlexSubThemes.appBarTheme` **uses** `FlexSubThemesData.appBarTitleTextStyle` for its `titleTextStyle`.
  - `FlexSubThemes.chipTheme` **uses** `FlexSubThemesData.chipLabelStyle` for its `labelStyle`.
  - `FlexSubThemes.chipTheme` **uses** `FlexSubThemesData.chipSecondaryLabelStyle` for its `secondaryLabelStyle`.
  - `FlexSubThemes.datePickerTheme` **uses** `FlexSubThemesData.datePickerHeaderHeadlineStyle` for its `headerHeadlineStyle`.
  - `FlexSubThemes.datePickerTheme` **uses** `FlexSubThemesData.datePickerHeaderHelpStyle` for its `headerHelpStyle`.
  - `FlexSubThemes.datePickerTheme` **uses** `FlexSubThemesData.datePickerWeekdayStyle` for its `weekdayStyle`.
  - `FlexSubThemes.datePickerTheme` **uses** `FlexSubThemesData.datePickerDayStyle` for its `dayStyle`.
  - `FlexSubThemes.datePickerTheme` **uses** `FlexSubThemesData.datePickerYearStyle` for its `yearStyle`.
  - `FlexSubThemes.datePickerTheme` **uses** `FlexSubThemesData.datePickerRangePickerHeaderHeadlineStyle` for its `rangePickerHeaderHeadlineStyle`.
  - `FlexSubThemes.datePickerTheme` **uses** `FlexSubThemesData.datePickerRangePickerHeaderHelpStyle` for its `rangePickerHeaderHelpStyle`.
  - `FlexSubThemes.dialogTheme` **uses** `FlexSubThemesData.dialogTitleTextStyle` for its `titleTextStyle`.
  - `FlexSubThemes.dialogTheme` **uses** `FlexSubThemesData.dialogContentTextStyle` for its `contentTextStyle`.
  - `FlexSubThemes.floatingActionButtonTheme` **uses** `FlexSubThemesData.fabExtendedTextStyle` for its `extendedTextStyle`.
  - `FlexSubThemes.menuButtonTheme` **uses** `FlexSubThemesData.menuButtonTextStyle` for its `textStyle`.  
  - `FlexSubThemes.timePickerTheme` **uses** `FlexSubThemesData.timePickerDayPeriodTextStyle` for its `dayPeriodTextStyle`.
  - `FlexSubThemes.timePickerTheme` **uses** `FlexSubThemesData.timePickerDialTextStyle` for its `dialTextStyle`.,
  - `FlexSubThemes.timePickerTheme` **uses** `FlexSubThemesData.timePickerHelpTextStyle` for its `helpTextStyle`.,
  - `FlexSubThemes.timePickerTheme` **uses** `FlexSubThemesData.timePickerHourMinuteTextStyle` for its `hourMinuteTextStyle`.,
  - `FlexSubThemes.toggleButtonsTheme` **uses** `FlexSubThemesData.toggleButtonsTextStyle` for its `textStyle`.
  - `FlexSubThemes.segmentedButtonTheme` **uses** `FlexSubThemesData.segmentedButtonTextStyle` for its `textStyle`.  
  - `FlexSubThemes.snackBarTheme` **uses** `FlexSubThemesData.snackBarContentTextStyle` for its `contentTextStyle`.
  - These are not available in the **Themes Playground**. Their purpose is that you can use them with the API to provide custom text styles for FCS styled components. You could do this in the past too, but you had to use rather complicated deep `copyWith` on the produced component themes. With these props you get access to direct `TextStyle` styling for these component properties in the FCS API too.


- Added `useCupertinoStyle` property to `FlexSubThemes.switchTheme`. Added `switchAdaptiveCupertinoLike` property to `FlexSubThemesData` and made `FlexSubThemes.switchTheme` use it.


- Added `secondarySelectedSchemeColor`, `fontSize`, `secondaryFontSize`, `iconSize` and `padding` properties to `FlexSubThemes.chipTheme`. Added `chipSecondarySelectedSchemeColor`, `chipFontSize`, `chipSecondaryFontSize`, `chipIconSize` and `chipPadding` properties to `FlexSubThemesData` and made `FlexSubThemes.chipTheme` use them.


- Added `headerForegroundSchemeColor` property to `FlexSubThemes.datePickerTheme`. Added `datePickerHeaderForegroundSchemeColor` property to `FlexSubThemesData` and made `FlexSubThemes.datePickerTheme` use it for its header foreground color.
- Added `dividerSchemeColor` property to `FlexSubThemes.datePickerTheme`. Added `datePickerDividerSchemeColor` property to `FlexSubThemesData` and made `FlexSubThemes.datePickerTheme` use it for its divider color.


- Added `isDense` property to `FlexSubThemes.inputDecoratorTheme`. Added `inputDecoratorIsDense` property to `FlexSubThemesData`.
- Added `contentPadding` property to `FlexSubThemes.inputDecoratorTheme`. Added `inputDecoratorContentPadding` property to `FlexSubThemesData` and made `FlexSubThemes.inputDecoratorTheme` use it.
- Added `inputDecoratorSuffixIconSchemeColor` property to `FlexSubThemes.inputDecorationTheme`. Added `toggleButtonsSelectedForegroundSchemeColor` property to `FlexSubThemesData` and made `FlexSubThemes.segmentedButtonTheme` use it.
- Added `adaptiveInputDecoratorRadius` and `inputDecoratorRadiusAdaptive` properties to `FlexSubThemesData`. They are used to select platform(s) to an alternative border radius response for the input decorator, for the selected platform(s).


- Added `minWidth` and `minExtendedWidth` to `FlexSubThemes.navigationRailTheme`. Added `navigationRailMinWidth` and `navigationRailMinExtendedWidth` properties to `FlexSubThemesData` and made `FlexSubThemes.navigationRailTheme` use them.


- Added `tabAlignment` property to `FlexSubThemes.tabAlignment`. Added `tabBarTabAlignment` property to `FlexSubThemesData` and made `FlexSubThemes.tabBarTheme` use it for its. (TODO: Add a note about thrown assert, open an issue in Flutter SDK about it and suggest an alternative solution.)


- Added `foregroundSchemeColor` property to `FlexSubThemes.floatingActionButtonTheme`. Added `fabForegroundSchemeColor` property to `FlexSubThemesData` and made `FlexSubThemes.floatingActionButtonTheme` use it for its foreground color.
 

- Added `selectedForegroundSchemeColor` property to `FlexSubThemes.segmentedButtonTheme`.
- Added `segmentedButtonSelectedForegroundSchemeColor` property to `FlexSubThemesData` and made `FlexSubThemes.segmentedButtonTheme` use it.
- Added `selectedForegroundSchemeColor` property to `FlexSubThemes.toggleButtonsTheme`.
- Added `toggleButtonsSelectedForegroundSchemeColor` property to `FlexSubThemesData` and made `FlexSubThemes.toggleButtonsTheme` use it.


- Added `appBarForegroundSchemeColor`, `appBarIconSchemeColor` and `appBarActionsIconSchemeColor` properties to `FlexSubThemesData` and made `FlexSubThemes.appBarTheme` use it for its colors on title, icon and actions.
- Added `bottomAppBarHeight` property to `FlexSubThemesData` and made `FlexSubThemes.bottomAppBarTheme` use it as its `height` value.


- Added `scaffoldBackgroundBaseColor` property to `FlexSubThemesData`. It is a `FlexScaffoldBaseColor` enum that can be used to select the base color used as `Themedata.scaffoldBackgroundColor` in a theme. The selected base color is modified by used `surfaceMode` and `blendLevel`] in the `FlexColorScheme`'s `light` and `dark` factory constructors.
- Added `scaffoldBackgroundSchemeColor` property to `FlexSubThemesData` and made `ThemeData.scaffoldBackgroundColor` use it as an override color, if it is defined. Setting `scaffoldBackgroundSchemeColor` will override any blended background or true black or plain white setting.


- Added `cupertinoOverrideTheme` to `FlexColorScheme` constructor and to `FlexColorScheme.light`, `FlexColorScheme.dark`, `FlexThemeData.light` and `FlexThemeData.dark` factory constructors.


- Added enum `variant` a `FlexSchemeVariant` to `FlexColorsScheme` and `FlexThemeData` light and dark. This is used to define the variant of the seeded `ColorScheme`. It is an alternative to `tones` that also includes scheme seed variants that Flutter SDK added in version 3.22.2. 


- Added enhanced enum functions `data` and `colors` to the `FlexScheme` enum, that returns the predefined `FlexSchemeData` and `FlexSchemeColor` respectively, that are associated with a given enum value. This could be done already using the `FlexColor.schemes` map. This is a convenience API to be able to use e.g. `FlexColor.mango.data` to get the predefined `FlexSchemeData` for the `mango` enum scheme and e.g. `FlexColor.barossa.colors(Brightness.dark)` to get the pre-defined dark colors used for the `barossa` scheme colors. See feature request: https://github.com/rydmike/flex_color_scheme/issues/210


- Added ability to use custom seed key colors to `FlexKeyColors`.
- Added support for error colors to `FlexKeyColors`.
- Added direct color properties for `errorContainer` and `onErrorContainer` to `FlexColorScheme`, `FlexColorScheme.light`, `FlexColorScheme.dark`, `FlexThemeData.light`, `FlexThemeData.dark`. It was required to support custom error container colors in the `FlexKeyColors` API.  
- Added `Color` properties `primaryLightRef`, `secondaryLightRef` and `tertiaryLightRef` to `FlexSchemeColor`.
  - They are used to store references to the corresponding color in a `FlexSchemeColor` made for light mode in the dark mode `FlexSchemeColor`. This is used to create computed "fixed" and "fixedDim" colors for dark mode and the light mode `ColorScheme` that are identical in light and dark mode.
  - Made `FlexSchemeColor()`, `FlexSchemeColor.from()`, `FlexSchemeColor.effective()` and `FlexSchemeColor.toDark()` work correctly with the new `primaryLightRef`, `secondaryLightRef` and `tertiaryLightRef` properties. 
  - Used all main `light` color properties in `FlexSchemeData` static `FlexSchemeColor` color definitions, as **lightRef** colors in their `dark` mode equivalent FlexSchemeColor. That was 156 color values to add to the 52 dark `FlexSchemeColor` definitions.

- Added `fixedColorStyle` to `FlexColorScheme`, `FlexColorScheme.light`, `FlexColorScheme.dark`, `FlexThemeData.light`, `FlexThemeData.dark`. It was required to support custom error container colors in the `FlexKeyColors` API. The property is an enum `FlexFixedColorStyle`, that allows us to choose the style of the generated "fixed" and "fixedDim" colors when not using seed generated color schemes. 


- Added `Color` properties `primaryLightRef`, `secondaryLightRef` and `tertiaryLightRef` to `FlexColorScheme.dark` and `FlexThemeData.dark`. If you use the override colors `primary`, `secondary` or `tertiary` and are not using seeded ColorScheme, you need them to provide the correct light mode reference colors for computing fixed colors that will match the light mode fixed colors, for that it is required to know what the light mode colors are. If you are seeding and use the overrides, and will switch between seeded and not seeded, you can provide the override for the not seeded values in `primary`, `secondary` or `tertiary`, and the ref to their seed colors from light mode, in the light ref colors. If you always seed when using the overrides, you can also provide the seed colors in the `primary`, `secondary` or `tertiary` overrides, the light refs fall through to these colors in that cases if not provided during seeding.


- Added style `navigationBar` to enum `FlexSystemNavBarStyle` that use the color for default or themed `NavigationBar` background color on the system navigation bar helper.
  - You can get a similar result with the transparent option. Using the `navigationBar` option does not require using the edge-to-edge config required when using transparent system navigation bar to see things behind it. The `transparent` option sets edge-to-edge mode behind the scenes when used. This can cause some layout changes that must be considered in the app design when used. This is an optional way to style the system navigation bar to match the app's themed `NavigationBar` background color, without using edge-to-edge Android screen mode.


- Added `ListTile` theming support to `FlexSubThemesData` and made corresponding `FlexSubThemes.listTileTheme` properties use them in `FlexColorScheme` as `ListTileTheme` theming properties.
  - The following `FlexSubThemesData` properties were added: `listTileSelectedSchemeColor`, `listTileIconSchemeColor`, `listTileTextSchemeColor`, `listTileTitleTextStyle`, `listTileSubtitleTextStyle`, `listTileLeadingAndTrailingTextStyle`, `listTileTileSchemeColor`,   `listTileSelectedTileSchemeColor`, `listTileContentPadding`, `listTileHorizontalTitleGap`, `listTileMinVerticalPadding`, `listTileStyle`, `listTileTitleAlignment` and `listTileControlAffinity`.


- Added `SearchBar` and `SearchView` theming support to `FlexSubThemesData` and made corresponding `FlexSubThemes.searchBarTheme` and `FlexSubThemes.searchViewTheme` properties use them in `FlexColorScheme` as `SearchBarThemeData` and `SearchViewThemeData` theming properties.
  - The following `FlexSubThemesData` properties were added: `searchBarBackgroundSchemeColor`, `searchViewBackgroundSchemeColor`, `searchBarElevation`, `searchViewElevation`, `searchBarRadius`, `searchViewRadius`, `searchViewHeaderHeight`, `searchBarTextStyle`, `searchViewHeaderTextStyle`, `searchBarHintStyle`, `searchViewHeaderHintStyle`, `searchViewDividerColor`, `searchBarShadowColor`, `searchBarTextCapitalization`, `searchBarPadding`, `searchBarConstraints`, `searchViewConstraints` and `searchUseGlobalShape`.


**CHANGE**

- Changed all internal usage of `MaterialStateProperty` and `MaterialState` to use new `WidgetStateProperty` and `WidgetState` introduced in **Flutter 3.22** and later.
- Static functions `FlexSubThemes.schemeColor` and `FlexSubThemes.onSchemeColor` now support the updated `SchemeColor` and `ColorScheme`.

- Improved the theming logic for `Card` theme.
  - It now avoids [issue #153912](https://github.com/flutter/flutter/issues/153912), but **only** when the Flutter default radius is used. This is done by not creating a shape theme when the default radius is used and using the default created one instead. This will keep the outline for the default radius theme cases. Previously FCS Card theme created a shape with the default radius. Both cases are now using default and null radius value, it keeps shape null and lets the widget default behavior be used, so we can keep the outline on `Card.outlined` variant for the default case at least. This Flutter theming limitation and impact is thus now the same in FCS, as it is with vanilla Flutter `ThemeData` and its `CardTheme`. It is still broken as mentioned in the above issue, but that is a Flutter theming issue and limitation that FCS cannot fix.

- Changed the `FlexSubThemes.inputDecoratorTheme` to use only `border` and its **WidgetState** for its theme. It offers more and nicer control over hover state than using the older legacy more limited border styles. 

**FIX**
 
- Fixed [#198 AppBar color issue when using seed generated scheme with key color locked](https://github.com/rydmike/flex_color_scheme/issues/198).
   
- Fixed that the Rectangular Slider value indicator did not default to `primary` color when undefined, as intended in FCS M2 and M3 mode. Only the Drop style indicator defaulted to primary. This came from the framework defaulting the old M2 rectangular indicator to a complex, opacity and alpha blended `onSurface` grey looking result.

#### Why is blendedTextTheme deprecated?

The `blendTextTheme` feature was originally made before Material-3's TextTheme was available, before it was fully known how it was going to be implemented. It was an approximation of the TextStyles that could be seen in early versions of Material-3 images. Since the actual Material-3 TextTheme is available, the tinted TextTheme feature is no longer required. While the FCS tinted TextTheme did provide an alternative version of the actual tint used in Material-3, the differences were quite subtle. Additionally, recent changes in Flutter make using it very verbose and complicated. Why it does so is explained in detail below.
    
In Material-3 Typography 2021, the TextTheme and all styles in it are fully opaque and use onSurface as color on all TextStyles. In a seed generated ColorScheme, the text styles become primary color tinted, because the onSurface color by default has subtle primary tint. With FCS, you can modify the onSurface to black or white to avoid this, if so preferred.
    
In Material-2 Typography 2018 and 2014, some TextStyles in their TextThemes use partially transparent white or black colors, making them appear tinted when placed on lightly colored backgrounds. Such TextStyles also have lower contrast. If the Material-3 default text theme is used on background colors that are tinted with a color that deviates a lot in hue from the hue used as tint color by the TextTheme, it may not fit it so well. The Material-2 opacity-based text styles do not have this limitation. It is unknown why Material-3 switched to a fixed tint color instead of using the opacity-based approach used in Material-2, that is more universally usable on backgrounds with different tint colors.
    
In Material-3, some component themes override the default color of the default TextTheme TextStyles they use with `onSurfaceVariant`. This color has slightly more tint and lower contrast than the default `onSurface`. This is used for elements in components that should have less emphasis. Many default Material-3 components also override the color in default TextTheme TextStyles they use with `ColorScheme.onSurface` color, that it actually already has in a default TextTheme. These two overrides results in that whatever color the default TextTheme TextStyles have, they will be overridden by these `ColorScheme` colors. Resulting in that any custom-colored `TextTheme`and its `TextStyle`s are not getting used by such Material-3 components and that the custom colors from the meticulously colored custom `TextTheme`, are rarely visible anywhere in a Material-3 application. Material-2 component themes do not do this, nor did older Flutter versions of Material-3 component themes do this.
    
An issue has been raised explaining the challenges this newer approach in Flutter causes when using custom colored text themes. If this issue is addressed, the tinted TextTheme feature in FCS may be brought back if it is a requested feature. 

In current Flutter versions, using a custom-tinted TextTheme is rather pointless. You can, but it is not enough to define the TextTheme. You also have to pass each tinted TextStyle it has to the appropriate TextStyles in ALL component themes that override its colors, for it to have any effect. It is typically not worth the effort.

### THEMES PLAYGROUND

**NEW**

- The **Theme Code** view panel now has a toggle that allows you to generate the configured code for the theme as input suitable for a separate app theme file. It has static getters that you can use in your `MaterialApp`'s `theme` and `darkTheme`.
  >**TIP:** You can modify this file and e.g., pass in controller that contains user-configurable settings for theme configuration properties and generate the theme on the fly in your app. This way you can let the user configure the theme in your app, a few props anyway. This is basically what the Playground app does with all theming properties. That is why you can see the result and impact of defined theme in the Playground app itself, as you modify the desired theme configuration in the app.
 
- The **Theme Code** view got a long asked for feature, Themes Playground settings export and import! You can now export your configured theme settings to a JSON file and import them back into the Playground later. This is a great way to save your theme settings for later use or to share them with others. The exported JSON file contains all the internal controller settings values you have configured in the Playground that are needed to restore a given configuration state. This Playground feature was contributed by GitHub user [@akiller](https://github.com/akiller) in [!PR 257](https://github.com/rydmike/flex_color_scheme/pull/257). Thank you! 
- The contributed feature got enhanced with more error handling and a slightly refined UI to make it production ready. 
- As a further enhancement of the JSON export feature, the **Themes Playground** app also got the ability to convert the exported settings JSON config to a shareable URL. You can now share Playground settings with other Flutter developers.


- On each theme settings panel, many controls now appear in two columns to reduce the need to scroll so much on wider media and see more controls on the same screen. The layout is panel width responsive and controls will be in one column as before on smaller media.
- Split the "FAB and Chip" settings panels to separate panels **FAB** and **Chip**. 
- Split the "BottomAppBar and SearchBar" panels to separate panels **SearchBar** and **BottomAppBar**.


- On the surface **Color Blends** settings panel, you can choose which surface color the scaffold background color will use as its starting point surface color and as base for the blend level and mode. You can also select any ColorScheme color and use it as an override for the scaffold background color. This will override any blended color result as well as the plain white and true black settings.


- The **ColorScheme** settings panel got **five** new settings:
  1) **Contrast level** slider control for MCU based scheme variants. This feature is equivalent to the FSS based scheme variant contrast level control. It is als available in the Flutter master channel as `contrastLevel` property in `ColorScheme.fromSeed`. It is used to control the contrast level of the generated scheme colors. It will most likely land in the next stable Flutter release after 3.24. With FCS V8 you can use it already now.
  2) A dropdown for **Fixed colors**, where you can choose between three different variants for the  `fixed`, `onFixed`, `fixedDim` and `onFixedVariant` colors, when a seed generated `ColorScheme` is **NOT** being used.
  3) A Switch for **Higher contrast fixed and fixedDim** colors. When using FSS based seed generated color schemes, you can keep the standard Material-3 based tones for the `fixed`, `onFixed`, `fixedDim` and `onFixedVariant` colors to the Material-3 design specified values 90, 10, 80, 30 **or** and or opt-in on an alternative set 92, 6, 84, 12 that have higher contrast. 
  4) A Switch for **Expressive LIGHT containers**. The Material design spec for the tones used by the colors `onPrimaryContainer`, `onSecondaryContainer`, `onTertiaryContainer` and `onErrorContainer` have changed from tone **10** to **30** for **LIGHT** theme mode. This change will land in Flutter when the Material Color Utilities (MCU) package is updated to at least 0.12.0. This has not been done even in master (Sep 3, 2024).
     - A toggle was added where you can opt in on using them already now in FCS. It is not ON by default. When it lands in stable Flutter, it will be made **ON** by default, but you will still be able to opt out of using it. Flutter SDK and MCU will not contain such an opt-out feature. The new **on** colors for containers in light mode, make them more color expressive, but it also reduces their contrast level and accessibility. We prefer them to have higher contrast.
  5) A switch for using **Legacy monochrome seed behavior**. See package changes for an explanation of this feature. It is not recommended to turn this ON, but it is there if you need it for legacy seed behavior with monochrome input colors. The new default behavior for monochrome seed colors is much better, more intuitive and what it should always have been.


- Added customizable error colors to the custom scheme. Only available when **Use Material3 error colors** setting is **OFF**, when using the custom scheme on **Input Colors** and **ColorScheme** settings panels.
- Added using error color as a seed color for error tonal palette in the **ColorScheme** settings panel. The tonal palette now also supports using a custom error color to generate its tonal palette. 
- Added error color and error container color locking to the **ColorScheme** settings panel.  
- Added code gen for custom error colors.


- Added **ColorScheme** code generation for all the new `ColorScheme` colors introduced in Flutter 3.22.
- Added showing the new Flutter 3.22 `ColorScheme` colors in the **Effective Colors** panel.
- Added showing the new Flutter 3.22 `ColorScheme` colors in the **ColorScheme** settings panel.
- Added showing the new Flutter 3.22 `ColorScheme` surface colors in the **Color Blends** settings panel.


- Added support for using MCU and FSS based seed generated `ColorScheme` variants using `FlexSchemeVariant`.
- Added code generation for the new MCU and FSS scheme variants.
  - For MCU based variants it uses `FlexColorScheme.variant` API with `FlexSchemeVariant` and for FSS based variants it uses `FlexColorScheme.tones` API with `FlexSchemeVariant` and its `tones` getter. 
  - The `FlexTones` modifiers only show up on FSS based variants with `FlexColorScheme.tones` API, as they are not available when using the `FlexColorScheme.variant` API.
- Added the FFS seed option "Monochrome surfaces" introduced in package **FlexSeedScheme** 3.0.0.


- Added an **Apply ColorScheme to all Cupertino components** setting to the **Component Themes** settings panel
  - It toggles setting `cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true)` and generate code for it and applies the setting to the Playground app's theme as well.  
- In the **Switch, Checkbox and Radio** settings panel, the **Switch** now has a platform adaptive theme setting for theming the Material `Switch` to look close to the iOS `CupertinoSwitch`.
- On the surface **Color Blends** settings panel, you can now select a scheme color to use as the theme resulting **Scaffold Background** color. The selection is independent for light and dark theme mode.
- Added separate controls and code gen for light and dark mode background color selection for the `BottomAppBar` on settings panel **BottomAppBar**.
- Added divider color selection to **Dialogs** settings panel for the **DatePicker** divider color. Setting it to transparent will hide the divider in Material-3 mode, in Material-2 mode the Divider does not exist. Also added feature to allow selection of DatePicker header foreground color independently of the used background color. Previously it always used the contrast pair of the background color, which is still the default if you do not select a custom foreground color.  
- Added the ability to change tab alignment in the **TabBar** settings panel.
- In the **Floating Action Button** settings panel, added the ability to change the foreground color of FAB to something that is not its automatic on-color pair.

- To **TextField** settings panel, added the ability to change the focused suffix icon color. The **TextField** also got controls for dense input decorator and custom content padding, as well as for using a platform adaptive border radius. It also has two new pre-made design examples. In addition to selecting Material-3 default and Playground defaults, you can now also use "Colored outline" and "Dense, no focused border" as design examples or as `TextField` starting configuration points.

- To **AppBar** settings panel, added the **Center title** setting to control if the title is centered or not. This API has been available in FCS since v6, but not offered in the Playground, now it is in the Playground too.
- To the **AppBar** settings panel, title foreground color, leading icon and actions icon color settings were added.
- The **Chip** settings now include separate color for the `ChoiceChip (called Suggestion Chip in M3 design). The feature that blends the selected main overall Chip color was made optional. It is a useful feature due to the limited independent theme control over the Chips.  
- The **Chip** settings panel now includes font size and padding controls.
- The **ListTile** settings panel now includes a large number of theming controls for ListTile theming.
- The **SearchBar** settings panel now includes theming controls for SearchBar and SearchView theming.
- On the **Adaptive Theming** settings panel you can now also control the `MaterialTapTargetSize` setting.
- The **Segmented Buttons** settings panel now includes a control for selected foreground colors for both `SegmentedButton` and `ToggleButtons`.
- Added feature [#224](https://github.com/rydmike/flex_color_scheme/issues/224) that adds `Card.filled` and `Card.outlined` to widget showcase. They are also used in the "**Card**" settings" panel for card presentation.

 
- The Playground can now also show the used color tones numbers for MCU based generated dynamic color schemes, also when they use dynamically obtained tones and when e.g., contrast level is adjusted. This feature is computationally complex and quite expensive, but we thought it was worth it to show the correct palette color tones also for DynamicScheme variants.



**CHANGE**

- The optional staggered grid-based Playground UI was removed.
  - The rationale for removing it is to simplify the app. 
  - The staggered grid view was originally included in the Playground for its "example 5" tutorial intent. It was used to demonstrate how the same widget panels could be used in a completely different app layout, for Flutter tutorial purposes. The UI was not so brilliant and way to heavy to use on web builds, at least if you opened up all panels. 
    - Did anybody use the staggered grid layout anyway? Let me know if you miss it. Just so I know, but it is not coming back :)
- No longer generate any code for `useMaterial3: true` value. The FSS default is now `true` and we thus no longer explicitly need to add API code gen when the setting is **ON**.
- The **Introduction** panel's content was updated.
- The Playground defaults the replacement for `useTextTheme`, the `useMaterial3Typography` to null. This makes Material-2 and Material-3 mode use their respective mode-based typography by default. If you still make a Material-2 app, prefer using Material-3 typography and set it to `true`, like the Playground did before. Material-3 typography is much nicer than Material-2 typography. This is not a breaking API change, just a change in the default value used when you rest the Playground to its default values. Turn it **ON** in **TextTheme** settings, to get the same config as you did with a reset before. If you use Material-3, this Playground settings change has no impact on your theme result.
- Updated the presentation of `Switch`, `Checkbox`and `Radio` on their settings panel.
- Changed the name of the "Theme colors" settings panel to **Input Colors**. 
- Changed the name of the "Surface blends" settings panel to **Color Blends**.
- Changed the name of the "Component Themes" settings panel to **General Settings**.
- Changed the order of topic panels. The **General Settings**, **Adaptive Theming** and **Shape Radius** panels now come before the color panels.
- The feature **Swap secondary and tertiary legacy colors in Material-3** on the **Input Colors** settings panel is now **OFF** by default. The settings info expand explains when it is preferable to use it.
- The feature **Use TextField's InputDecorationTheme in picker dialogs** on the "**Dialog**" settings panel is now OFF by default.

- Modified settings panel background and header colors, as well as theme selector buttons to use suitable new `ColorScheme` surface theme colors, instead of computing their own shades from theme colors.
- Changed surface and on-color blends to default to 0. Blends are not **ON** by default anymore in Playground. The feature is still very cool and useful for many different design goals.
- Adjusted the code gen for surface colors setting "Main and container colors on color blending" to handle the new `FlexSubThemesData.blendOnColors` default being `false` instead of `true`. The Playground still by default sets `blendOnColors` to `true` for dark mode and defaults to `false` for light mode. This is done to mimic seed generated `ColorScheme` behavior, when not using seed generated colors.
- Update Material-3 default info for `BottomAppBar` to `surfaceContainer`.
- Improved the `Chip` presentation, by having them in own wraps per type and a column that names the Chip type with both Flutter and Material-3 naming 
  - Flutter SDK ActionChip = Material-3 Assist Chip
  - Flutter SDK FilterChip = Material-3 Filter Chip
  - Flutter SDK InputChip = Material-3 InputChip
  - Flutter SDK ChoiceChip = Material-3 Suggestion Chip
- Improved `IconButton` presentation, by adding a text column explaining the type, as on the Chips panel.
- Improved presentation of `Switch`, `Checkbox` and `Radio`, by using more orderly columns and spacing and explanation labels, similar style as on `Chip` and `IconButton`.  


- The Playground default for the **TextField** settings panel is still using "Outline" and filled as default, not "Underline" and filled style like Flutter SDK does. The FCS API defaults to underline, only the Playground comes with a slightly opinionated nicer default. Playground **TextField** default, along with FCS API, it was changed to not using color on the unfocused border, like Flutter M3 and M2 default styles do. Making both Playground and FCS API less opinionated in its default values in this case. 

- In **General Settings**, the Playground by default turns **ON** the settings "Use Material-2 style Divider in Material-2", "Tinted disabled components" and "Tinted interaction". Corresponding to `FlexSubThemesData` for `useM2StyleDividerInM3`, `interactionEffects` and `tintedDisabledControls` being set to `true`. Their FCS API defaults are however `false`, to keep the API itself less opinionated. Before FCS v8, these API defaults were `true` as stated in breaking changes. The Playground thus keeps this past, already in API opinionated defaults, as its pre-configured defaults, but the defaults for the FCS API itself, in Material-3 mode, are much less opinionated now.

- In **Navigation Rail** panel settings, the "Labels when collapsed" defaults to "All items have labels". This means that `navigationRailLabelType: NavigationRailLabelType.all` is used by default in Playground generated `FlexSubThemesData()` passed to `subThemesData`, thus applying what was API default before. When you create a new theme with the Playground, you get same style as before. If you migrate from V7 you will need to set `NavigationRailLabelType.all` in yur old theme to get the same Rail style, if you had not defined it explicitly before. 

- The **NavigationRail** settings panel got controls for selected and unselected label size, as well as selected and unselected icon size. The panel now also has settings for collapsed and expanded rail widths and destination group alignment.

- The **NavigationBar** settings panel got controls for selected and unselected label size, as well as selected and unselected icon size.

- The **BottomNavigationBar** settings panel got controls for selected and unselected label size, as well as selected and unselected icon size. The `BottomNavigationBar` animates their size transitions as it is intended to use different sizes for selected and unselected item. The `NavigationBar`na d`NavigationRail` do not animate their item size changes, but you can still use it.


- Changed how ALL opacity sliders work. They now all work with default (null) color and opacity is also nullable. If the `SchemeColor` it is used on is null, it will use the default color and apply opacity on it. It is no longer required to select the same color as default to apply opacity anywhere.
- Major internal refactor of all `Sliders` used in the Playground. Converted the Sliders to custom composed `SliderListTileReveal`, a combo convenience widget used for `Sliders` with a null default value. Also having separate labels for disabled and null default values, and a built info `ListTileReveal`.

- Changed the style and speed of all popup menus. They are more compact with smaller font, and open under the ListTile you open them from, when there is room to do so. They also have no animation to open quickly and more desktop like, as this app is intended to be used primary on desktop. Their states now communicate the default for their settings better when FCS is used, as well as when FCS is disabled.
  > **DETAILS:** The bulk of used popups components in the Playground are now using a shared a generic `EnumPopupMenu<T extends Enum>`, based on `ListTile` and `PopupMenuButton` that now supports nullable enums and has built-in support for null selection and disabled defaults. It also has built-in `ListTileReveal` for info expand reveals. There are still a few special case popups that have some specialized features like `ColorSchemePopupMenu` but it is based on the same design. It needs to be able to communicate a large number of default color values for its color default labels, depending on active theme state, so it supports things like `defaultLabel`, `defaultLabelDark`, `defaultLabelM2`, `defaultLabelDarkM2`, `defaultDisabledLabel`, `defaultDisabledLabelDark`, `defaultDisabledLabelM2` and `defaultDisabledLabelDarkM2`. This refactoring was also in preparation for adding more features, as it makes it easier to add enum based props. Sadly the refactor and migration of the Playground to use these components took a long time and delayed the release at least two weeks, maybe more. Some snafus in shown default value labels may also exist concerning colors, due to this refactor.

- Updated the official Material-3 demo app in the Theme Simulator to a version with the same look as the latest official version. The updated version now also uses the demo's new Sliver-based cached scrolling. The version is still a fork, with some tweaks to make it work when embedded into the Playground simulator and getting its theme from the Playground and not inside the demo app. The fork also has a denser two-column layout with different breakpoints. This was done so that we in **portrait mode** can get two columns with a `NavigationRail` already on iPad Pro 11" and the expanded Rail on iPad Pro 12.9".

- In the *ColorScheme* panel, we brought back the ColorScheme color hover that highlights its color source tone in the Tonal Palette above. This feature existed before, but started causing issues on WEB builds and was removed 16.3.2023. It has now been brought back, and we will test if it works better now. It is a nice feature to see where the color comes from in the palette.

- The controls to test settings for platform adaptive responses are now hidden behind an expanding `ListTile`. This is used on every panel where the controls exist. It is intended to make the UI less cluttered, the controls are not used so often.

**FIX**

- Fixed [#188](https://github.com/rydmike/flex_color_scheme/issues/188) add info about theme simulator being an approximation.
- Fixed [#200](https://github.com/rydmike/flex_color_scheme/issues/200) FAB config code for `fabSchemeColor: SchemeColor.secondary` selection was not generated.
- Fixed [#222](https://github.com/rydmike/flex_color_scheme/issues/222) PersistentBottomSheetController's type in Example 5/Playground.
- Fixed that Card was not showing the correct default border radius in Material-2 mode when using FCS.
- Fixed that applying dialog elevation in the Playground app's own dark mode theme was missing.
- Fixed that enum `FlexAdaptive.setting` value `FlexAdaptive.appleWeb` did not return `AdaptiveTheme.appleWeb` when selected, it returned `FlexAdaptive.apple`. This only impacted **simulation** of responsive themes for the Apple and Web response **in the Playground app**. Themes using this feature worked correctly. 



## 7.3.1

**August 17, 2023**

- FIX: Themes Playground: Update the in-app documentation of known Flutter issues to reflect changes brought by Flutter 3.13.
- FIX: Changelog 7.3.0 typos and style corrections by @TahaTesser.

## 7.3.0

**August 16, 2023**

This release uses new features in Material-3 theming that are only available in Flutter 3.13 or later. It thus **requires** minimum **Flutter 3.13.0**. 

In the next Flutter stable release after 3.13, Flutter will change the `ThemeData.useMaterial3` default from `false` to true. In other words, applications using FCS will get the Material-3 colors, text styles, and other visuals, by default. The `FlexColorScheme` API will then be following along with this breaking change. In this release the `FlexColorScheme` API `useMaterial3` still defaults to `false`. The **Themes Playground** app has for quite some time already defaulted to setting the value to `true`. Which is also already the case in Flutter when you create a new application with `flutter create`.  

### PACKAGE

**NEW**

* To `FlexSubThemes` in `buttonTheme` **added** bool `alignedDropdown`.
* To `FlexSubThemesData` **added** bool `alignedDropdown`. Setting it to true improves the style of the `DropdownButton` and the `DropdownButtonFormField`. They no longer expand outside the width of the parent dropdown button but are kept size aligned with it.
  
 
* To `FlexSubThemes` in:
  - `chipTheme` **added** TextStyle `secondaryLabelStyle`
  - `dialogTheme` **added** TextStyle `titleTextStyle` and `contentTextStyle`
  - `floatingActionButtonTheme` **added** TextStyle `extendedTextStyle`
  - `menuButtonTheme` **added** TextStyle `textStyle`
  - `snackBarTheme` **added** TextStyle `contentTextStyle`
  - `timePickerTheme` **added** TextStyle `dayPeriodTextStyle`, `dialTextStyle`, `helpTextStyle`, and `hourMinuteTextStyle`
  - `toggleButtonsTheme` **added** TextStyle `textStyle`

* The `TextStyle` additions above, to mentioned `FlexSubThemes`, do not yet bring any new features usable via `FlexColorScheme` theming APIs. They are a preparation for adding more component `TextStyles` to `FlexSubThemesData`. This in turn, will enable more direct `TextStyle` theming via `FlexColorScheme` API without using `copyWith` to override produced `ThemeData`. 


* As planned in previous versions, made the `FlexSubThemesData.useInputDecoratorThemeInDialogs` apply also to `DatePickerDialog` and not only to `TimePickerDialog`. This feature is not optimally supported by the framework. The current implementation has severe limitations. See more info in [PR #128950 comment](https://github.com/flutter/flutter/pull/128950#issuecomment-1657177393). For more information about the differences in how `InputDecorationTheme` behaves in different component themes, read the proposal **"Make InputDecorationTheme usage in components consistent"** in [issue #131666](https://github.com/flutter/flutter/issues/131666).

**CHANGE** 

* **Minor style breaking changes:**

 - `FlexSubThemes.dropdownMenuTextStyle` now default to `TextTheme.bodyLarge` if not defined. Previously it used Flutter SDK default `TextTheme.bodyLarge`, which is a poor design default as the style does not fit with default style `bodyLarge` used as default style in `TextField`in Material-3 mode. See [issue #131350](https://github.com/flutter/flutter/issues/131350) that contains a mention of this style deviant. In Jetpack Compose, the `DropdownMenu` and its `TextField` part correctly defaults to using `bodyLarge`, this is thus assumed to be the correct spec wise. The issue of wrong default text styles in Flutter menus is further discussed in [issue #131676](https://github.com/flutter/flutter/issues/131676). FlexColorScheme will not internally correct the wrong default `TextStyle` on menu items, it will however change to follow the default when Flutter stable does. The difference in the `DropdownMenu` text input field was however significant enough to warrant a change already before the fix lands in Flutter stable.

**FIX**

* Fixed the `FlexSubThemes.checkboxTheme` that broke due to an unexpected breaking change in Flutter 3.13 caused by PR [#125643](https://github.com/flutter/flutter/pull/125643). The breaking change is discussed further in [issue #130295](https://github.com/flutter/flutter/issues/130295). The fix to the checkbox theme incorporates the new behavior to keep its custom styling working as before and expected.

* Fixed `useInputDecoratorThemeInDialogs` not working for some properties in the `InputDecorator`, when the value was null or `false`, where some properties in the `TextField`s in the `TimePickerDialog` did not revert to default styles. Now they do, but via defined values to mimic the default Material-3 style, as that is the only way to get back to it when a very custom `themeData.inputDecoratorTheme` is being used.

### THEMES PLAYGROUND

**NEW**

* The **PopupMenu and Dropdowns** panel got a setting for older Material-2 based `DropdownButtonFormField` and `DropdownButton` to set the new alignment property, which is an ancient theming property in the old `ButtonThemeData` that was used by deprecated and removed Material Buttons, but the theme is still used by these buttons. 

* On the TextField panel, added a feature to set the input decoration style back to FlexColorScheme's own defaults.

**CHANGE**

* Harmonized custom color activation settings on **Theme Colors** and **Seeded ColorScheme**.

* Removed old switch in custom colors in dark mode, that was used to enable using input scheme color as own seed colors in dark mode when using custom colors. For simplicity, the custom dark mode colors have been used directly as seed colors in a few releases in the Playground already. The control was an old left-over with no function anymore.

* The global themed input decorator usage is now on by default for `TimePickerDialog` and `DatePickerDialog`. This is the only style currently supported for `DatePickerDialog` in Flutter, so it makes sense to keep it on by default. Turning it OFF for now only removes the custom, input decorator style from the `TimePickerDialog`. Despite the new feature in Flutter SDK, it cannot be removed from the `DatePickerDialog`. This is discussed in [PR #128950 comment](https://github.com/flutter/flutter/pull/128950#issuecomment-1657177393). Additional info is also available in Flutter [issue #131666](https://github.com/flutter/flutter/issues/131666).

**FIX**

* Fixed the old default color info for the toggles Switch, Checkbox and Radio, that are shown when FlexColorScheme is disabled as default values in Material-2 dark mode. They have been updated in Flutter SDK to `ColorScheme.secondary` color and are no longer not the horrid dark mode teal color. This default color info, shown when FlexColorScheme is disabled in the **Themes Playground**, had not been updated for the dark Material-2 mode Switch, Checkbox and Radio colors. 


## 7.2.0

**July 20, 2023**

### PACKAGE

**NEW**  

* Added boolean property `switchThumbFixedSize` to `FlexSubThemesData`. When set to true, the Material-3 `Switch` themed thumb size is same size when `Switch` is ON and OFF. When the property value is false or undefined, it retains its default behavior and the thumb is smaller when the switch is OFF. Only has any impact in Material-3 mode.
* Added `FlexAdaptive` property `adaptiveRemoveNavigationBarTint` to `FlexSubThemesData`. It is used to control platform adaptive elevation tint removal on the `NavigationBar` theme.
* Added `textSelectionTheme` to `FlexSubThemes`, used to make a `TextSelectionThemeData`.
* Added properties `inputCursorSchemeColor`, `inputSelectionSchemeColor`, `inputSelectionOpacity`, and `inputSelectionHandleSchemeColor`, to `FlexSubThemesData` used to configure `TextSelectionThemeData` as a part of `FlexColorScheme.subThemesData`.
* Added a new feature that enables platform adaptive Material ink selection via `adaptiveSplash` a `FlexAdaptive` property, and the `FlexSplashType` values `splashType` and `splashTypeAdaptive` in `FlexSubThemesData`.
* FlexColorScheme got the `splashFactory` property, which can be used to override any splash type setting in `FlexSubThemesData`. This addition also removes the need to do a copy with on `ThemeData` to provide a custom `splashFactory`. Prefer using the `FlexSubThemesData` properties `splashType` and `splashTypeAdaptive` to control the selection of used ink factory together with `adaptiveSplash`, unless you have written a custom ink factory that you want to use, in which case using the `splashFactory` override is appropriate.
* New feature that enable platform adaptive theming of border radius on dialogs via `adaptiveDialogRadius` a `FlexAdaptive` property and double `dialogRadiusAdaptive` in `FlexSubThemesData`.
* Added tinted disable support when `FlexSubThemesData.tintedDisabledControls` is `true` to `FilledButton` and `FilledButton.tonal`. They have the same disabled style when not tinted, so we can do the same to their tinted variants. Even if we still cannot theme them to have different themed colors when enabled, due to [issue #118063](https://github.com/flutter/flutter/issues/118063), we can still theme their disabled state with tint when the option is used.
* Added tinted disable support when `FlexSubThemesData.tintedDisabledControls` is `true` to `IconButton`, `IconButton.filled`, `IconButton.filledTonal` and `IconButton.outlined` foreground colors. They have the same disabled foreground style when not tinted, so we can do the same to their tinted foreground color variants. We still cannot theme them to have different themed background colors when disabled, or at all when enabled, due to [issue #118063](https://github.com/flutter/flutter/issues/118063). We can only theme their disabled foreground color state with tint when the option is used.

**CHANGE**

* Updated to use version 1.4.0 of FlexSeedScheme offering two new `FlexTones` and extended tonal palette.

* **Minor style breaking changes:**

* Removed elevation tint impact of general `FlexSubThemesData.adaptiveRemoveElevationTint` setting, from the `NavigationBar` component. It instead has its own setting in `FlexSubThemesData.adaptiveRemoveNavigationBarTint`, that can be used independently of the general tint removal setting. This was done since it may be preferred to not remove the elevation tint from the `NavigationBar`, even when otherwise doing so on selected platforms.
* In Material-2 mode, when not using a component theme, `ThemeData.textSelectionTheme` it now gets a default `TextSelectionThemeData()` and its themed style defaults to SDK defaults. Enable and use component themes and its new theming features to style it further.
  * In previous versions in Material-2 mode, text selection handles used `Theme.of(context).primaryColorDark`, even when component themes where not enabled. They still do by default, but only when component themes are enabled. 
* In both Material-2 and Material-3 mode `bottomNavigationBarElevation` in `FlexSubThemesData` and `elevation` in `FlexSubThemes.bottomNavigationBar` when undefined, now default to elevation 3, giving the `BottomNavigationBar` a default elevation of 3 when using FlexColorScheme.
  * Previously default elevation was zero. Flutter SDK defaults to 8. The FlexColorScheme opinionated default value was changed to 3 to make it equal to the default elevation of `NavigationBar` in Material-3 mode, so that the bottom navigators share same default elevation when using FlexColorScheme. As before, you can adjust the elevation as needed with the API and in the Themes Playground.
* In Material-2 mode `navigationBarElevation` in `FlexSubThemesData` and `elevation` in `FlexSubThemes.navigationBarTheme` when undefined, now default to elevation 3, giving the `NavigationBar` a default elevation of 3 in Material-2 mode when using FlexColorScheme.
  * Previously default elevation was zero. Flutter SDK defaults to 0. The FlexColorScheme opinionated default value was changed to 3 to make it equal to the default elevation of `NavigationBar` in Material-3 mode, so that the bottom navigators share same default elevation when using FlexColorScheme. As before, you can adjust the elevation as needed with the API and in the Themes Playground.
* In Material-2 mode, `bottomAppBarElevation` when undefined, now also remains undefined in `FlexSubThemes.bottomAppBarTheme` causing default elevation in Material-2 mode to become 8 like in the SDK default for Material-2. 
    * Previous default used same elevation as `AppBar`, when `bottomAppBarElevation` was undefined, or 0 if `AppBar`'s elevation was also undefined. The rationale for removal of this default behavior is to start cleaning out opinionated behavior that no longer makes sense to keep around, especially since eventually Material-2 mode is going away in Flutter. 
    * The default for Material-3 mode is unchanged, using elevation 3, via SDK defaults when undefined.
* In Material-2 mode, `ElevatedButton`, `FilledButton`, `FilledButton.tonal`, `OutlinedButton`, `TextButton` and `ToggleButtons` now default to border radius 40 dp. Previously they defaulted to 20 dp. Their style is intended to match the used Stadium border design in Material-3, which is still the default in Material-3 mode. When using very tall buttons, the 20 dp default value was not enough to keep the buttons looking Stadium shaped as intended in FCS Material-2 mode.


**FIX**

* Fixed that `TextSelectionThemeData` did not automatically use colors that matched and followed `subThemes.inputDecoratorSchemeColor` when it was modified and text selection colors were not explicitly defined. The text selection, cursor and text selection handles should follow the input decoration's base color by default when they are not defined separately. Defining text selection colors was not possible before version 7.2.0, but defining input decoration colors was, but text selection remained using primary. Now they by default follow the input decoration color, but can also be separately defined via new features in version 7.2.0.
  * **Known limitation**: Text selection handles on iOS platform cannot be changed with a theme from `primary` color. So on iOS their themed color is always `colorScheme.primary`. The text selection color and cursor color do follow the theme also on iOS.
* Fixed `useFlutterDefaults` when elevation is null in `FlexSubThemes.bottomNavigationBar` not using Flutter SDK default elevation of 8.
* Added a built-in theme fix to make the elevation tint change in the `AppBar` animate when it changes. Based on Material spec and observed native Android behavior and compose behavior, the `AppBar` color change when it is scrolled under should animate. Flutter Material-3 apps do not do this, the color change is instant. Discovered a theme workaround that makes it animate. This is now always used in FCS themes until Flutter includes its own fix for it.
* The `FlexSubThemes.menuButtonTheme` and the `MenuButtonThemeData` it makes, got a `style` value, where `ButtonStyle.animationDuration` is always `Duration.zero`. This solved the issue reported in [issue #123615](https://github.com/flutter/flutter/issues/123615). Consequently, there is no need for a fix for the issue, since it could be solved with a theme property.


### THEMES PLAYGROUND

**NEW**

* In the **Switch Check Radio** panel, the `Switch` got a setting to control if thumb is fixed sized or not.
* The `NavigationBar` got its own setting for elevation tint removal in light and dark mode.
* Introduction text updated. New information about Material-3 design becoming the default in Flutter SDK soon added, and that Material-2 will be deprecated.
* Added text selection theming to the **Text Field** panel. By default, cursor color, text selection color and text selection handles, default to following the input decorator default color or its selected color. The cursor color, text selection, and text selection handle colors, can also be overridden and defined separately. These settings for light and dark mode, have their own property values in the Playground.  
* Added support for selecting a custom ink splash effect and another custom platform adaptive splash effect on selected other platforms. 
* Added support for configuring the used VisualDensity. When using mock platform setting in the Playground, it also affects the result of used setting when `VisualDensity.adaptivePlatformDensity`, `FlexColorScheme.comfortablePlatformDensity` or default undefined value, that falls back to `VisualDensity.adaptivePlatformDensity`, are used. 
* Added support for selecting and using `FlexTones.candyPop` and `FlexTones.chroma`.
* Added support for making any seed strategy use tone 100 (white) or tone 0 (black) as resulting surface and background tones.
* Added an option to show the new extended tonal palette tones to the seeded color scheme panel.
* Shape and radius now have their own theming topic panel, removed radius from **Component Themes** topic.
* Add adaptive border radius setting to the Dialogs panel. 
* Add TimePicker border radius override value setting to the Dialogs panel.
* Add DatePicker border radius override value setting to the Dialogs panel.
* Added a switch to show TextStyle details to TextTheme presentations.
* Added font NotoSans Medium (W500) to assets.
* On theme showcase and icon button panels, show both tappable and toggleable `IconButton` styles.
* Theme topic selector uses a group color on icons and selected item. The colors are fixed semantic colors, but the colors are Material-3 harmonized to active theme surface tint color. This makes them fit nicely when the overall color theme of the app changes. It is also a nice additional demo of theme extensions with many colors that are harmonized. The concept is the same as the one used on the code highlighter colors earlier. 


**CHANGE**

* The onColor blend-level and on onMain setting are no longer disabled when using seeded ColorScheme. Rationale: If some colors are locked to use custom colors, using onBlend level has an impact on their contrasting colors and should be allowed in the Playground. The API could use it before too, but Playground could not, now it can.
* Changed the order of theming topic panels. All color and surface related topic panels are now before component theme panels. Theme settings topic panels have been split into more discrete topics and have a new order.
* Changed the order of components and labels on many theme topic panels.
* The apps included in the **Theme Simulator** now all extend content behind their app bars and bottom navigation. This allows themed opacity settings on app bar and bottom navigation to become observable in the simulated apps.
* The Shop app in the **Theme Simulator** received some style updates to use more theme-dependent styling, like Card as containers for shop items. 

**FIX**

* Fixed allowing elevation changes of `BottomNavigationBar` and `NavigationBar` when `useFlutterDefaults` is true (ON).
* Fixed allowing opacity usage on `NavigationBar` when default undefined background color is used. 


**POSTPONED**

* The new Squircle and platform adaptive shape selection features were postponed. They may arrive later this year in version 7.3 or a later release. It is pending more investigation into the best choice concerning correct shapes and potential performance issues they might come with.


## 7.1.2

**May 17, 2023**

### PACKAGE

**FIX**

* SubThemes ElevatedButton in Material-3 mode, when using `elevatedButtonSecondarySchemeColor` and there was no value defined on `elevatedButtonSchemeColor` it resulted in wrong color being used as default for `elevatedButtonSchemeColor`. Issue and test fixed.

**CHORE**

* Updated Android runner included for all the examples. The previous one no longer worked with Flutter 3.10 and its used Kotlin version. With included updated version, the examples can be built as Android apps again.


## 7.1.1

**May 15, 2023**

### PACKAGE

**FIX**

* Fixed regression issue where custom a `textTheme`'s color is no longer applied. 
  * See issue [#151](https://github.com/rydmike/flex_color_scheme/issues/151). 
  * The issue was introduced in version 7.0.0, when adding a feature that provided automatic correct default contrast text color for **GoogleFonts**, when a default `GoogleFonts` and its `TextTheme`, like `GoogleFonts.notoSansTextTheme()` is used in `textTheme` or `primaryTextTheme` in `FlexColorScheme`. 
  * The `GoogleFonts` and its  `textTheme` color always defaults to the color from Material-2 mode default light mode `ThemeData.light().textTheme`. This when used in `ThemeData` forces users to assign correct Material-2/Material-3 color and `textTheme`/`primaryTextTheme` contrast color, to all its styles, whenever used in a situation where the default is light theme mode Material-2 color is the wrong color. The default contrast color is basically only correct for a light theme when using Material-2. For anything else, it is incorrect.
  * FCS version 7.0.0 got rid of the need to make such a correction assignment, but it also incorrectly disabled using custom colors used in any custom `TextTheme`.
  * The applied FIX keeps the desired "no need to give correct contrast color" to a default **GoogleFonts** `TextTheme` in **FlexColorScheme** and also allows making custom colored text custom text themes.
  * The FIX is a bit involved, it also led to an idea that maybe `GoogleFonts`, should just keep the font color default as null, and let Flutter's default Theme behavior handle the assignment of correct color for the Material-2/Material-3 mode and light/dark theme mode, using each mode's default contrast color, for each style in the `TextTheme`. See issue [GoogleFonts #401](https://github.com/material-foundation/flutter-packages/issues/401) for more info on this.
  * Tests added for the regression and for the new `GoogleFonts` default `TextTheme` being used and nulling its colors, so they get correct Material-2/Material-3 style contrast colors in both light and dark mode and for both `textTheme` and `primaryTextTheme`. 


### THEMES PLAYGROUND

**FIX**

* Fixed the code gen for `useTextTheme` setting to always generate code for setting's value in Playground code gen when it is not null. When it is undefined or null, it means that the `TextTheme` follows the Material-2/Material-3 specification mode default `TextTheme` and `Typography`. In previous versions, the code setting for `useTextTheme` only showed up in the generated code, when it was necessary to produce the viewed result. If the Material-2/m3 mode default produced the same result, the setting was not added to the generated API config. This may be confusing. It is clearer to always show it in code gen when it is set to a none null value. See discussion in repo [Q&A #150](https://github.com/rydmike/flex_color_scheme/discussions/150).


## 7.1.0 

**May 12, 2023**

FlexColorScheme v7.1.0 supports new theming features in Flutter 3.10, it thus requires minimum Flutter 3.10 and Dart 3.0. 

### PACKAGE

**NEW**

* Added support for "bring shadows back" adaptive theming feature to `BottomAppBar` and `BottomSheet`.
* Added `datePickerTheme` to `FlexSubThemes`.
* Added properties `datePickerDialogRadius` and `datePickerHeaderBackgroundSchemeColor` to `FlexSubThemesData`.

**CHANGE**

- Updated to use minimum `flex_seed_scheme ^1.3.0`. This version, no longer depends on `material_color_utilities`, thus avoiding all version issues and conflicts when Flutter changes what breaking version of `material_color_utilities` it uses on different channels and versions.

### THEMES PLAYGROUND

Themes Playground 7.1 for FlexColorScheme 7.1 can be found [here](https://rydmike.com/flexcolorscheme/themesplayground-v7-1).

**NEW**
  - Added selection of themed header color scheme color for the DatePickerDialog on the Dialogs panel.
  - Added showing SearchBar with SearchView to the AppBar panel.
  - Added showing SearchBar with SearchView to the Widget Showcase.

**UPDATE**
  - Reviewed and updated status of all known theming issues in info expands.
  - The SKIA **canvaskit** renderer is again being used to build all the web examples, including the **Themes Playground**.
  - Updated all examples to use new `ListenableBuilder` instead of `AnimatedBuilder` where appropriate.


## 7.0.5

**Apr 29, 2023**

- **Fix:** [#143](https://github.com/rydmike/flex_color_scheme/issues/143) Glitches in highlighting effect on mouse hover over `FlexThemeModeSwitch` and `FlexThemeModeOptionButton`.

## 7.1.0-dev.1

**Apr 24, 2023**

* [Detailed changelog](https://github.com/rydmike/flex_color_scheme/blob/master/changelog/changelog_7_1_0_dev_1.md)

## 7.0.4

**Apr 22, 2023**

* **Package**
  * No changes.
* **Themes Playground**
  * **FIX:** AppBar setting for using platform adaptive scroll under elevation tint removal was not working correctly. UI bug in Playground only, no package impact.   

## 7.0.3

**Apr 19, 2023**

- **Fix:** [#136](https://github.com/rydmike/flex_color_scheme/issues/136) default background color regression on `FlexThemeModeSwitch` and `FlexThemeModeOptionButton`.

## 7.0.2

**Apr 16, 2023**

- **Chore:** Changed to using `flex_seed_scheme: ^1.2.4` that depends on  `material_color_utilities` with version constraint set to `>=0.2.0 <0.4.0` from `^0.2.0`.
  - This change enables the package to be used on current Flutter **stable** 3.7 versions, as well as the latest 3.10.x versions on channels **beta** and **master**. It will also work with the next stable Flutter release after 3.7.

## 7.0.1

**Apr 6, 2023**

* **Package**
  * No changes.
* **CHANGE: Themes Playground**
  * Less chatty UI
  * Revised media size breakpoints. 
  * Vertical color selector mode. 
  * More compact UI options for smaller laptop displays and tablets.

## 7.0.0

**Apr 2, 2023**

This is a major update to the **FlexColorScheme** package and a significant leap for the companion app **Themes Playground**. For a detailed list of all changes, please refer to the incremental log from its development releases linked below.

* [Changes from 6.1.2 to 7.0.0-dev.1](https://github.com/rydmike/flex_color_scheme/blob/master/changelog/changelog_7_0_0_dev_1.md)

* [Changes from 7.0.0-dev.1 to 7.0.0-dev.2](https://github.com/rydmike/flex_color_scheme/blob/master/changelog/changelog_7_0_0_dev_2.md)

* [Changes from 7.0.0-dev.2 to 7.0.0-dev.3 (final beta)](https://github.com/rydmike/flex_color_scheme/blob/master/changelog/changelog_7_0_0_dev_3.md)

* Changes from 7.0.0-dev.3 to 7.0.0
  - Package: Only tests and documentation additions and updates.
  - Playground: Label and layout corrections.

The [Themes Playground](https://rydmike.com/flexcolorscheme/themesplayground-v7/) app built for this release is unfortunately not a SKIA renderer build, it is using the HTML renderer. This makes it less performant than the app would otherwise be. Additionally, scaled content, like the **Themes Simulator** panel in the **Playground**, is also fuzzier than it would be with the SKIA renderer. Due to an issue in Flutter stable 3.7.0 to at least 3.7.9, builds made with the SKIA renderer performs very poorly and crash quickly. For more information, see Flutter [issue #122189](https://github.com/flutter/flutter/issues/122189). A new build using the same package version will be made later and released when fixes for the SKIA issues are available on the Flutter stable channel.

## 7.0.0-dev.3

**Mar 18, 2023**

This is **the final beta v7** release before **stable v7**. There will be no new features or API changes in the FlexColorScheme package from this version to stable version 7.0.0. The only changes to stable will be potential bug fixes, typo corrections, API doc comment improvements and adding more tests.

The companion app **Themes Playground**, may get label improvements plus spelling and grammar corrections. Layouts in it may also be modified and improved as needed. It will not get any new features, but it may of course receive bug fixes.

* [Detailed changelog](https://github.com/rydmike/flex_color_scheme/blob/master/changelog/changelog_7_0_0_dev_3.md)

## 7.0.0-dev.2

**Jan 25, 2023**

* [Detailed changelog](https://github.com/rydmike/flex_color_scheme/blob/master/changelog/changelog_7_0_0_dev_2.md)

## 7.0.0-dev.1

**Jan 23, 2023**

* [Detailed changelog](https://github.com/rydmike/flex_color_scheme/blob/master/changelog/changelog_7_0_0_dev_1.md)

**Jan 23, 2023**

## 6.1.2

**Dec 26, 2022**

**FIX**

- Fix for issue [#106 bottomSheetModalBackgroundColor not correctly set](https://github.com/rydmike/flex_color_scheme/issues/106). Thanks [mcssym](https://github.com/mcssym) for the fix [PR #107](https://github.com/rydmike/flex_color_scheme/pull/107).

## 6.1.1

**Nov 22, 2022**

**FIX**

- Themes Playground (Example 5): Fixed scroll issue in page view mode on Web builds. Only examples related, no package impact.
- API doc updates.

## 6.1.0

**Nov 20, 2022**

**FlexColorScheme** version 6.1.0 contains many new features, more component themes and configurable properties. It improves seed-generated color scheme capabilities by adding more pre-configured seed generation configurations and color contrast accessibility options. 

A criticism of Material-3's color system and seed-generated color schemes, is that using colored contrasting colors may be less accessible. FlexColorScheme offers a way to enable in-app modification of its seed-generated color schemes. Any seed generation configuration can optionally return results with plain white and black contrasting on colors. This can be applied separately for main on colors and on surfaces.

The **Themes Playground** application has been updated to include most of the new features. It has been improved to make it easier to discover some of its previously existing features, like using custom colors in the Playground to define your own theme. 

**NEW**

* Scaffold background color can now be used as the themed AppBar background color. The enum `FlexAppBarStyle` that is used by property `appBarStyle` got a new value `scaffoldBackground` that enables this. This is useful for matching the AppBar color exactly to the Scaffold background color, when Scaffold background uses different surface blends than the theme's `ColorScheme` surface or background colors.
* Added properties `materialTapTargetSize` and `pageTransitionsTheme` to `FlexColorScheme` and `FlexThemeData`. They are only convenience properties to avoid having to use a `copyWith` on FlexColorScheme produced `ThemeData`, to define them.
* Property `swapLegacyOnMaterial3` in `FlexColorScheme.light/dark` and `FlexThemeData.light/dark` allows for better automatic adjustment of built-in scheme colors to the Material-3 color-system. It applies to color schemes that were originally designed for Material-2, when using the Material-3 mode with or without seed-generated ColorSchemes. 
  - Setting `swapLegacyOnMaterial3` to `true`, will when `useMaterial3` is `true`, swap the built-in scheme colors `secondary` and `tertiary` and also their container colors. 
  - This only happens for built-in schemes where this swap makes the color design **more compatible** with the intended design and usage of the `secondary` and `tertiary` colors in Material-3 color system.
  - To implement this, the class `FlexSchemeColor` has a new boolean meta-data property called `swapOnMaterial3`, that has been defined to be `true`, if the `FlexSchemeColor` it defines, benefits design compliance wise from swapping its `secondary` and `tertiary` colors when using Material-3.
  - For backwards compatibility the `swapLegacyOnMaterial3` is `false` by default, but it is recommended to always set it to `true`. The flag has no impact when using Material-2. 
  - The `swapLegacyOnMaterial3` flag can also be toggled in the **Themes Playground**, it is on by default there.
  - When the swap is done for a `FlexSchemeColor`, it is done before any other built-in scheme modifier properties, including `swapColor` and `usedColors`. 
* The `FloatingActionButton` can now be set to always be circular, also in Material-3 and without assigning a high-radius setting. If you always want a circular FAB, and stadium on extended FAB, then set `fabAlwaysCircular` in `FlexSubThemesData` to `true`, and FAB stays circular regardless of if you use Material-2 or Material-3, or how you modify the global default border radius. You could get this effect before too by setting a very high themed radius on the FAB, but this is more convenient.
* Additional new `FlexSubThemesData` properties:
  - `Slider` theme can now be adjusted via `FlexSubThemesData` properties `sliderBaseSchemeColor`, `sliderValueTinted` and `sliderTrackHeight`.
  - The `chipSelectedSchemeColor` was added as themed background color, it is used by Chips that are selectable. The `chipDeleteIconSchemeColor` can be used to theme the "Delete" icon color on Chips. While adding these features, some Flutter Material-3 Chip spec and theming issues were found, [see issue #115364](https://github.com/flutter/flutter/issues/115364) for more information.
  - Switch got a `switchThumbSchemeColor` property, to control the thumb color separately. A switch custom color theme was prepared for Material-3 `Switch`, which is not yet available in Flutter 3.3.
  - `Tooltip` theme now has `FlexSubThemesData` properties `tooltipRadius`, `tooltipWaitDuration`, `tooltipShowDuration`, `tooltipSchemeColor` and `tooltipSchemeColor`.
  - The `bottomSheetBackgroundColor` and `bottomSheetModalBackgroundColor` can be used to theme the background color of the `BottomSheet`.
  - Use `navigationBarElevation` to adjust the themed elevation of `NavigationBar`.
  - Use `popupMenuElevation` and `popupMenuSchemeColor` to further quick theme the `PopupMenuButton`.
  - The `outlinedButtonBorderWidth`, `outlinedButtonPressedBorderWidth`, `toggleButtonsBorderWidth`, `inputDecoratorBorderWidth` and `inputDecoratorFocusedBorderWidth` define the themed outline border thickness in different states of their respective components. These properties use previously existing properties `thinBorderWidth` and `thickBorderWidth` as their defaults. Resulting in that, the new properties are API backwards compatible, and they have shared global default settings. The new part is that you can now define themed outline border thickness separately for these components.
  - The `elevatedButtonTextStyle`, `outlinedButtonTextStyle` and `textButtonTextStyle` were added to be able to theme `TextStyle` on `ElevatedButton`, `OutlinedButton`, `TextButton`. These are convenience properties to allow different text styles on buttons without having to use `copyWith` on the overall `ThemeData` and its button component themes to modify the text styles, often sizes. 
    - These properties do not offer any simplification over standard `ThemeData` and its button themes. The current version does not include adjusting them in the Themes Playground. Adding all possible usage of them is currently not in the scope of the Playground app. However, button font size changes may be added later as a usage example of these properties. These properties are using the tricky `MaterialStateProperty`, that have so far been avoided in this flattened simplified theming. It was used for the benefit of offering the text styles as `ThemeData` pass along properties. Modifying the `ButtonStyle` theme using `copyWith`, is a bit more involved than for other component themes, with these properties you can customize the button text style using `FlexSubThemesData` properties instead. If you need to modify the `FlexColorScheme` created buttons themes even further for some not included properties, an example of how to do that can be found [here](https://github.com/rydmike/flex_color_scheme/discussions/92).

**CHANGE**

* FlexColorScheme now uses **FlexSeedScheme** version 1.1. It includes the following new features and changes:
  - Features that enabled implementation of just black and white seeded **on** colors. 
  - Additional `FlexTones`, the `FlexTones.oneHue` and `FlexTones.vividBackground`.
  - See [FlexSeedScheme on pub.dev](https://pub.dev/packages/flex_seed_scheme/changelog) for more information.
* In `FlexSubThemesData` all component controlling properties except booleans, are now nullable and null by default. FlexColorScheme made component themes still default to same values as before when assigning a default `FlexSubThemesData()` to `FlexColorScheme.subThemesData`. The properties are nullable to enable using different defaults in FlexColorScheme made component themes for Material-2 and Material-3 modes.
* **Style breaking:** Changed component themes `thinBorderWidth` to default to 1.0. It was 1.5 before. This is a style breaking change from previous thin outline style in FlexColorScheme.
  - Using fractional values may cause artifacts on monitors using native resolution where 1 dp = 1 physical display pixel (common on desktop PC/Linux monitors). We see the new default as a design FIX to avoid such issues with default settings. You can still set `thinBorderWidth` to 1.5, to get the same result as previous default theme.
* **Style breaking:** When opting in on opinionated component themes, the `Chip` style is slightly modified from previous versions. The new opinionated FCS default style is more distinct than before and more aligned with styling borrowed from the Material-3 mode `Chip` design. The `deleteIconColor` now defaults to `onSurface` instead of `primary` and it can be defined to be any `SchemeColor` based color. The Chips revised style, look better than before. Using Material-3 and with it themed `Chips` is also fully supported, also customizing color on selected state of selectable **Chips** is available. Color-tinted chips are also available as before. Be aware though that Material-3 theming in the current 3.3 version of Flutter has some limitations. If you assign a custom color to selected chips, the disabled state of Chips can no longer conform, to Material-3 spec of disabled selected Chips. 
  - For more information, [see issue #115364](https://github.com/flutter/flutter/issues/115364). Note that if you deviate on Chips from its expected designed background brightness, which is now possible to do for **selected** Chips with the new theming capabilities in the Playground. There is no way via theming to set correct text and icon contrasting brightness for selected Chips that require dark text and icons on bright Chips in dark theme mode. Wise versa for light theme mode, setting light text on dark selected Chips in light mode, is also not possible. This limitation applies to selected `FilterChip` and `InputChip`, there is simple not enough theme properties in `ChipTheme` to support this. Due to this limitation, we recommend only using Chip theme designs that work with dark text in light mode, and light text in dark mode.
* **Style breaking:** When opting in on opinionated component themes, the `BottomSheet` background color now defaults to theme's ColorScheme `surface` color, in both Material-2 and Material-3 mode. Previously it defaulted to the `Material`'s default color `theme.canvasColor`, that typically equals ColorScheme `background`. The new default follows upcoming Material-3 default for `BottomSheet`. The style change is minor, in most designs the color values are the same. If needed you can put it back to theme `background` color with:

```dart
    final ThemeData themeLight = FlexThemeData.light(
      subThemesData: const FlexSubThemesData(
        bottomSheetBackgroundColor: SchemeColor.background,
        bottomSheetModalBackgroundColor: SchemeColor.background,
      ),
    );
```

**FIX**

* **Temporary Material-3 Flutter SDK GAP fixes** 
  - The FlexColorScheme Material-3 mode, component themed `BottomSheet` gets a manually applied elevation tint to keep it distinguishable from the background. This temporary fix works despite Material tint elevation being broken in Flutter 3.3 and earlier, when `useMaterial3` is true. 
  - Same temporary Material-3 fix is also used on themed `PopupMenuButton`. 
  - Unfortunately, elevation-based shadow cannot be added to any of them in the Material-3 mode. It will have to wait for actual implementation of the components and their Material-3 themes with support for it.
  - The Material-3 supporting components and themes for `BottomSheet` and `PopupMenuButton`, already exist in the Flutter master channel, they will probably land in next new stable release after Flutter 3.3. 
  - These temporary Material-3 fixes, make it possible to use the `BottomSheet` and `PopupMenuButton` when opting in on Material-3. Since shadow elevations are still not working for them in Material-3 mode, it is not perfect, but much better.
  - The reasons why these issues exist are because these components have not yet been migrated to Material-3 in Flutter 3.3, plus the combination of this `Material` elevation [issue #107190](https://github.com/flutter/flutter/issues/107190) in Material-3 mode. As a result we get no elevation tint or any shadow on such `Material` using widgets in Material-3 mode.
  - The [issue #107190](https://github.com/flutter/flutter/issues/107190) has been fixed in master. Even if only it lands, we will get shadows back in Material-3 default `Material`, also if the components and their themes do not land. In combination with the here made Material-3 manual elevation tint fix, they would in such a case get the correct Material-3 default background elevation tint behavior and shadow.
  - The above temporary work-around fixes will be removed when the stable version of the framework implements the correct Material-3 elevation behavior for these widgets, and produces the same results itself. Hopefully in the next stable release of Flutter.

**THEMES PLAYGROUND**

* On **Theme colors** panel:
  - Improved the discoverability of defining and using totally custom colors for your theme in the **Playground**. It has always existed, but maybe now users will discover it more easily. You can still also copy any existing theme as a starting point for your custom color definitions.
  - Simplified the terminology used on the **Theme colors** panel. Also simplified its color presentation.
  - Added an on/off switch that controls the `swapLegacyOnMaterial3` setting.

* Updated and shortened the **Introduction**. Probably nobody reads it, or the [package docs](https://docs.flexcolorscheme.com/) with **Playground** guides, but at least it is there.

* The **Seeded ColorScheme** panel:
  - When using seeded color schemes, it is now possible to force contrasting **on** colors for all the main colors (primary, secondary, tertiary, error and their containers) to be plain black or white. This can result in better and more traditional contrast for text and iconography colors. Likewise, for the **on** colors for all the surfaces, background, surface, surfaceVariant and inverseSurface. This is a great toggle to get a more classic look while seeding main and surface colors. Turning these toggles on can also help with accessibility by increasing contrast and not using color on color for contrast. Offering these as user controllable toggles in apps can be a good way to allow users to tune not only the look, but also color accessibility.  
  - Now also show the source input "Scheme defined" colors, the `FlexSchemeColor`, that gets used as key colors for the Material-3 seeded ColorScheme generation, when it is turned on.
    - Arranged the panel content for better inclusion and presentation of the created **Tonal Palettes** used to make the seeded ColorScheme.
    - The Tonal palette color **tones** now have tooltips that present each tone.

* On **Surface blends**: 
  - Changed surface blend mode defaults to values that are more mobile design-friendly. No API change involved. API defaults are the same as before, changes only affect the Playground app defaults. 
    - Previously used **Playground** default values were intended for desktop and tablet designs, where controls and text are placed on containers with a lower surface blend, like the **Cards** used in the Themes Playground app itself. While one can make a responsive app, that uses this design nicely from mobile to tablet and desktop sizes, most mobile only apps are not designed so. Using Playground defaults that produce a nice theme for more typical mobile designs, will help new FlexColorScheme and Themes Playground users, configure nice themes even quicker.
  - The blend mode control now also has a popup menu that always shows all surface blend modes, also in smaller media. On smaller devices the `ToggleButtons` control, as before, only shows popular options.

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
  - Removed the slide to page animation, that was used when clicking on a topic on the **topic panel selector**.
    - Direct panel/page selection via the control now instead uses a small **Fade and Zoom in** to show the selected settings panel.
    - Without any panel page change effect, it was hard to notice what changed. The default slide to the page animation, with the `PageView` is fine when swiping, where it remains, but it was a tad annoying when clicking on the panel page selector.
  - Changed all used `Slider.adaptive` to `Slider`.
    - The Cupertino adaptive one has poorer UX. You cannot click on the track to move the thumb to a given position. The app presents Material theming, so we will show only Material widgets in the apps own controls, on all platforms going forward.
  - Changed all used custom `SwitchListTileAdaptive` to just `SwitchListTile`.
    - We like using the Material theme following `SwitchListTileAdaptive` iOS switch on iOS on macOS. However, the app presents Material theming, and the new Material-3 Switch will land in Flutter stable soon. The new Material-3 `Switch` is even nicer than the Cupertino Switch, and we want to see it in the app when it lands. We will thus use the Material Switch in the Themes Playground app on all of its own controls on all platforms going forward.
    - The `SwitchListTileAdaptive` is kept in use on examples 2 to 4. As an example of how to make and use a theme following platform adaptive `ListTileSwitch`. In the `SwitchListTileAdaptive` doc comments it is mentioned that the plain `SwitchListTile.adaptive` is not theme color following on iOS/macOS platforms, nor can it be themed to be so. You have to make a custom wrapper like [`SwitchListTileAdaptive`](https://github.com/rydmike/flex_color_scheme/blob/master/example/lib/shared/widgets/universal/switch_list_tile_adaptive.dart).


* **FIX** Themes Playground 
    - Fixed the codegen for Switch, Checkbox and Radio, that did not include color selection for setting primary color since it used to be default. The issue only concerned the Themes Playground code generation, APIs worked as expected.


## 6.0.1

**Sep 21, 2022**

**FIX**
 
* A null check was fixed by [sososdk](https://github.com/sososdk) in `FlexColorScheme.light` when using custom scheme [PR #90](https://github.com/rydmike/flex_color_scheme/pull/90). Issue did not exist in `FlexColorScheme.dark`.

* Cam16 from Material Color Utilities exported by accident by FlexColorScheme in version 6.0.0 via its **FlexSeedScheme** package export. This export was removed. Cam16 was not exported before moving features to FlexSeedScheme and should not have been now either. FlexSeedScheme does export it as before. It is used by the **FlexColorPicker**.

## 6.0.0

**Aug 31, 2022**

* Updated minimum dependencies to Dart >=2.18.0 and Flutter >= 3.3.0.

Due to a number of known and below documented Flutter SDK issues when using `useMaterial3` set to
`true`, we cannot yet recommend using the option in production. Use it only if you are willing to
accept the still incomplete Material-3 implementation in Flutter and the issues. If you
keep `useMaterial3` set to `false`, and use FCS opinionated component themes, you can create a
theme that is visually fairly similar to Material-3, but still using Material-2 `ThemeData` mode to avoid many
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
  The `FlexTones.light` and `FlexTones.dark` no longer produce the config for the Material-3 tone
  and chroma setup. They no longer lock the chroma values to the default values for Material-3, but use
  null in their configs for their chroma values. Resulting in that chroma from key colors will be
  used, as long as they are over set minimum values.
  These named constructors then provide a cleaner starting API for
  defining additional configurations, by not forcing `null` to be passed to use chroma value in
  key colors. To get the Material-3 configuration, use the factory `FlexTones.material` instead of
  `FlexTones.light` and `FlexTones.light`. It as before produces the correct Material-3
  configuration, by defining `secondaryChroma: 16` and `tertiaryChroma: 24` using `FlexTones.light`
  and `FlexTones.dark` to return the correct Material-3 matching `FlexTones` configuration as
  before. This change was introduced to prepare for extracting `FlexTones` and `FlexSeedScheme` to
  their own package that will provide a `fromFlexSeeds` extension on `ColorScheme`. It is unlikely
  to impact any normal usage of FlexColorScheme, but it is still a breaking change.

* In **FlexSeedScheme** `FlexCorePalette.fromSeeds` properties `secondaryChroma` and
  `tertiaryChroma` now default to null instead of previous Material-3 palette default generating values
  16 and 24 respectively. Set them to 16 and 24 to create same tonal palettes as
  Material Color Utilities `CorePalette` and previous versions of `FlexCorePalette`.

* To allow for greater flexibility, and addition of tonal palette tones 5 (custom for FCS) and 98
  (Google Material-3, Web theme builder app includes tone 98 to, but not Flutter SDK),
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
  component themes. FCS applies this color to `FlexSubThemes.elevatedButtonTheme.onBaseSchemeColor`.
  If `useMaterial3` is false, it is the foreground color. If `useMaterial3` is true, it is the
  background color. Material-3, and 2, have completely different elevated button styles.
  The Material-2 elevated button is color wise, like the Material-3-filled button, but with elevation.

* Added two new properties to `FlexSubThemes.outlinedButtonTheme`.
  * Boolean `useMaterial3`, defaults to false.
  * `outlineSchemeColor`, defaults to null `SchemeColor?`.
    When `useMaterial3` is `false`, the `outlineSchemeColor` defaults to `baseSchemeColor`.
    When `useMaterial3` is `true`, the `outlineSchemeColor` defaults to `SchemeColor.outline`.

**REMOVED EARLIER DEPRECATED MEMBERS**

As a chore and cleanup, all previously deprecated members have been removed from version 6.0.0. It
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
  to use a style that by default matches Material-3 style when `ThemeData.useMaterial3` is `true`.
  The new default style is also a way to work around issue
  [#107946](https://github.com/flutter/flutter/issues/107946), where it is shown that you cannot
  create a theme that replicates the default border radius in Material-3 of the FAB.
  **Style migration**: If you had kept `FlexSubThemesData.fabUseShape` unspecified and relied on
  default value in a previous version, you must set it to `true` to get the same result as before.
  Breaking style changes like this, in the opinionated opt-in component themes are unfortunate.
  They are, however, required as FlexColorScheme continues to evolve with Flutter SDK to support Material-3
  theming, while offering its own opinionated tweaks on some Material-3 default styles as well.

**STYLE CHANGE — MINOR**

* The Material-3 color utilities package *material_color_utilities* from the Material team, that Flutter SDK
  depends on and FCS also uses, introduced a minor breaking change going from version 0.1.4 to
  0.1.5. Some colors in the tonal palettes no longer give exactly the same color values as before.
  This changes the results for some colors when you create a `ColorScheme.fromSeed` or FCS does
  it internally with its extended version `SeedColorScheme.fromSeeds`. The new algorithm changes 
  all the default Material-3 error colors slightly. The changes in the color values are minor,
  and not visually noticeable to the eye. Values are still slightly different, and this release
  uses the new value for FCS Material-3 error colors. Tests were also updated to use the new values.
  The change did break FCS color value tests, and should per its own policy be considered a
  major breaking change. However, since the Material-3 design and **material_color_utilities**
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
  to match the un-themed defaults of Material-3 design `AppBar`.

* Updated `ElevatedButton` to support `useMaterial3` defaults concerning its switched foreground and
  background color roles. It now also uses a stadium border instead of 20 dp, Material-3 size, padding and
  elevation defaults, when `useMaterial3` is opted in on.

* Updated `OutlinedButton` to support `useMaterial3` defaults concerning its outline color default.
  It now also uses a stadium border instead of 20 dp, Material-3 size and padding, when `useMaterial3` is
  opted in on.

* Updated `TextButton` to support `useMaterial3` defaults concerning its use of a stadium border
  instead of 20 dp radius, as well Material-3 size and padding, when `useMaterial3` is opted in on.

* Changed opinionated dialog component theme defaults to match Material-3 defaults. Elevation set to 6, was
  10 and actionsPadding defaults to `EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0)`, it
  did not have a custom default before. These are new defaults for the opinionated dialog component theme
  for both Material-2 and Material-3.

* Updated `Chip` component theme when opting in on `useMaterial3`. When  `useMaterial3` is `true`, it 
  now uses upcoming 
  Material-3-styled Chips instead of its own opinionated custom style, also when the opinionated 
  component themes are enabled. To get the same opinionated coloring as before, but on the Material-3 styled
  chips when using Material-3, set component themes data
  `subThemesData: const FlexSubThemesData(chipSchemeColor: SchemeColor.primary)`.
  This feature will only work with intended design in the stable channel, after the feature and PR
  ["Migrate Chips to Material-3"](https://github.com/flutter/flutter/pull/107166), lands in the stable
  channel. Currently, it is only available in Flutter *master 3.1.0-x*.

* Updated `InputDecoration` default component theme when opting in on `useMaterial3`. When `true` it
  now results in a more upcoming Material-3 styled `TextField` style by default, instead of its own more
  opinionated custom style, also when the opinionated component themes are enabled.
  It still uses a touch a lot of its own style in Material-3 mode, because TextField's real Material-3 design is
  not yet available in Flutter 3.3. TextField FCS opinionated style, combined with Material-3 real defaults,
  will need more work on Material-3 styles after
  ["Migrate TextField to Material-3"](https://github.com/flutter/flutter/pull/108366) lands in
  the stable channel.   
  The Material-3 alignment of FCS `InputDecoration` planned adjustments are:
  - Use the same error container color idea for FCS default that Material-3 uses, could be OK for all modes.
  - Option to use FCS component defaults on fill colors and disabled colors, also when
    opting in on Material-3. These FCS defaults can provide a nice alternative also when opting in on Material-3,
    but should not force it on Material-3 unless asked for.

**CHANGE**

* Removed earlier internal deprecation of `FlexSubThemes.buttonTheme`, as long as Flutter
  SDK has not deprecated it, neither will FCS.
* Removed earlier internal deprecation of all *"variant"* named const `FlexColor` colors.
  They are not used actively by any built-in schemes. However, in line with past practice,
  the old Material-2 color names and values will not be removed. Feel free to use them, if so desired.
* To support deprecation of `toggleableActiveColor` when PR
  [Deprecate toggleableActiveColor #97972](https://github.com/flutter/flutter/pull/97972) lands,
  while retaining the previous FCS defaults for `Switch`, `CheckBox` and `Radio` widgets, when
  not opting in on component themes. The created `SwitchThemeData`, `CheckboxThemeData` and
  `CheckboxThemeData` can no longer be null, when not opting in on component themes like before.
  To support the previous theme colored
  toggles in light and dark themes, that were set by defining the right scheme color for
  `toggleableActiveColor` in Material-2 and Material-3 theme modes, component themes for them that replicates the color
  styles must now be created also when not opting in on component themes. This update includes the
  necessary change to do so. This will be reflected in updates to the core default documentation.
  For a migration guide concerning `toggleableActiveColor` see
  [Flutter breaking-changes](https://flutter.dev/docs/release/breaking-changes/toggleable-active-color#migration-guide).
* Since Flutter 3.3 did not yet include the actual deprecation of `toggleableActiveColor` FCS still
  defines its appropriate color value for `ThemeData`.


**EXAMPLES**

* *Themes Playground:* New feature, the used code highlight colors were added as colors in
  a `CodeTheme` class `ThemeExtension` to `ThemeData`. To demonstrate how one can use theme
  extensions directly with FlexColorScheme as well, in this case to add custom semantic colors
  for the code view's code keyword highlighter. Additionally, a fancy Material-3 feature was added,
  color harmonization of custom colors. The process is described in the Material-3 guide under
  [custom colors](https://m3.material.io/styles/color/the-color-system/custom-colors).
  The Material-3 library [MaterialColorUtilities](https://pub.dev/packages/material_color_utilities) has
  the `Blend` function needed to perform the color harmonization, as described
  [here](https://github.com/material-foundation/material-color-utilities#readme) and the Dart color
  `Blend` function is [here](https://github.com/material-foundation/material-color-utilities/blob/main/dart/lib/blend/blend.dart).

* *Themes Playground:* Updated the default AppBar style, it uses a dropdown menu that can also select
  'null' choice and use default Material-2 and Material-3 theming as defaults via it. The AppBar panel now also
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

* Harmonized the changelog style and its history. The new style and how it looks will be tested
  with a dev release to ensure it works well on pub.

**KNOWN FLUTTER SDK ISSUES IMPACTING THEMING**

The issues below in the Flutter SDK itself, are known to impact FlexColorScheme and Flutter theming
in general. The issues are typically caused by incomplete Material-3 implementation in Flutter.

* The Material-3 Chip themes available in Flutter `master 3.1.0-0.0.pre.2216` at the time of writing,
  do as noted here
  [PR #107166 comment](https://github.com/flutter/flutter/pull/107166#issuecomment-1189206217),
  not yet Material-3 theme plain vanilla `Chip` when using Material-3. This might be fixed in an
  additional PR later in the SDK. This proposal tracks the potential implementation of this
  [#109470](https://github.com/flutter/flutter/issues/109470).

* [**#107946**](https://github.com/flutter/flutter/issues/107946) Cannot theme Shape and IconSize
  differently for different sized FloatingActionButtons. One of the drivers behind the breaking
  FAB style defaults for the opinionated FAB theme in FCS was this issue.

* [**#108539**](https://github.com/flutter/flutter/issues/108539) Cannot theme shape independently
  for `SnackBar` with different `behavior`. This is the reason why FCS does not yet offer a
  custom shape in its opinionated `SnackBar` theme. To replicate the un-themed behavior with
  slightly different border radius values, one must make custom wrapper widgets for `SnackBar`.

The Flutter SDK Material-3 `useMaterial3` flag set to `true` continues to have a number of challenges in
addition to the above ones. We as before still have the issues below in Flutter *stable 3.0.5* and
also at least in Flutter *master 3.1.0-0.0.pre.2216* and earlier:

* [**#107190**](https://github.com/flutter/flutter/issues/107190) Elevation issue with `Material` widget, when opting in on `useMaterial3` causes widespread elevation issues. Concerning the reported elevation issue for dialogs included in the linked report, it was observed as fixed for them in master, but later the PR fixing it was reverted. After that, it was relanded, then the reland reverted, see [Issue #107423](https://github.com/flutter/flutter/issues/107423), [PR #108718](https://github.com/flutter/flutter/pull/108718), [PR #109170](https://github.com/flutter/flutter/pull/109170) and [PR 109172](https://github.com/flutter/flutter/pull/109172). Even after it eventually lands in stable, it will not solve all the mentioned incompleteness caused Material-3 elevation issues. It will only do so for Dialogs. Popup in particular will remain troublesome.

* [**#103864**](https://github.com/flutter/flutter/issues/103864) Dynamically changing `Typography`
  in `ThemeData` generates an error

* [**#107305**](https://github.com/flutter/flutter/issues/107305) Regression: `AppBarTheme` properties `iconTheme` and `actionsIconTheme` are ignored in the master channel when `useMaterial3` is true. This was not in stable Flutter channel *stable 3.0.5*. This issue was fixed via [PR #108332](https://github.com/flutter/flutter/pull/108332) and could no longer be observed in *master, 3.1.0-0.0.pre.2108* or later versions. The fix did however not make it into Flutter stable 3.3.0 and now exists there. The issue must be re-opened or a new one submitted.

* This issue discussed in `SliverAppBar.medium` and `large` [PR #103962](https://github.com/flutter/flutter/pull/103962#issuecomment-1224269768), now exists in the stable channel. There is no open issue for it yet.

## 6.0.0-dev.1

**Aug 28, 2022**

* [Detailed changelog](https://github.com/rydmike/flex_color_scheme/blob/master/changelog/changelog_6_0_0_dev_1.md)

## 5.1.0

**July 8, 2022**

* Updated to support *Flutter 3.0.0*, with *Dart 2.17* and the latest Flutter package dependencies in example apps. Requires at least *Flutter 3.0.0* and *Dart 2.17.0*.

**NEW**

* **Added** full support for in *Flutter 3.0.0* new `ColorScheme.surfaceTint` color. It is set to `ColorScheme.primary` color by default, as Flutter and Material-3 does. If a custom `surfaceTint` color is provided, it is also used as the blend color, instead of `primary` color, for FlexColorScheme's surface blend feature.

* **Added** API for using *Flutter 3.0.0* theme extensions directly via FlexColorScheme API. It was added as a convenience feature to avoid having to add theme extensions with a `copyWith` on FlexColorScheme produced ThemeData. With the `FlexColorScheme.extensions` and `FlexThemeData.extensions` properties you can add custom theme extensions directly.

**DEPRECATED**

* **Deprecated:** `FlexColorScheme.m3TextTheme`. The custom Material-3 text theme is no longer required after Flutter 3.0.0 release that includes the new Material-3 Typography in addition to its earlier released `TextTheme`. You can opt in on using the new Material-3 style TextTheme as before by setting `FlexColorScheme.subThemesData.useTextTheme` to true **or** by setting `FlexColorScheme.useMaterial3` to true. Using either does however, come with known issue [#103864](https://github.com/flutter/flutter/issues/103864), where dynamically switching Typography, e.g., from 2014 or 2018, to Material-3 2021 Typography triggers mentioned assert in issue [#103864](https://github.com/flutter/flutter/issues/103864). This issue has always existed in Flutter SDK ThemeData when dynamically changing between different Typography. Before FlexColorScheme avoided triggering this issue by only using Typography 2018, also when opting in on Material-3 TextTheme, that before used 2018 based Typography to make a custom Material-3 like `TextTheme`. Avoiding this issue is no longer possible when opting in on Material-3, that now correctly uses its own and different Typography from Material-2. This exposes this issue if you dynamically change ThemeData from one to another Typography. To avoid this Flutter SDK issue, use the same Typography for all your themes in your app and do not dynamically switch theme between ThemeData objects that use different Typography in your application. The use cases for doing this are few, but it is still a Flutter SDK limitation to be aware of.

* **Deprecated:** `FlexSubThemes.buttonTheme` that creates an opinionated `ButtonThemeData`. The ButtonThemeData is marked as obsolete in Flutter SDK but not yet deprecated in Flutter 3.0.0. FlexColorscheme now marks it as **deprecated**. It will be removed in a future FlexColorScheme release when Flutter SDK deprecates `ButtonThemeData`.

**Material-3 STYLE FIXES AND CHANGES**

* **FAB Material-3 defaults change**: Floating Action Button background color, will when opting in on `ThemeData.useMaterial3`, use color `theme.colorScheme.primaryContainer`, otherwise `theme.colorScheme.secondary` is used.

* **Input Decorator default change**: The `TextField` and its `InputDecorator` border radius 
  default value was changed from 20 dp to 16 dp when using opinionated component themes.
  If opting in on Material-3, the default value for Material-3 design is used, which is only 4 dp.
  See specification https://m3.material.io/components/text-fields/specs.
  Flutter 3.0.x does not yet implement the new Material-3 TextField style, but via this change when
  opting in on Material-3, FlexColorScheme offers an early approximation of it. 

* **NavigationBar Material-3 defaults change**: Default colors of `NavigationBar` when opting in on 
  `useMaterial3` and not using opinionated component themes will now match Material-3 default colors. The background color will follow Material-3 style also by default when component themes are enabled and `useMaterial3` is true. This style is difficult to replicate with a single color otherwise. The difference is subtle for FCS surface tinted background colors. You can still set it to `background` color to replicate past FCS default color when component themes were enabled. For other properties, if opinionated component themes are not used, FCS will use default Material-3 theme styles on `NavigationBar` when `useMaterial3` is true. If opting in on opinionated component themes, FCS uses its own custom and opinionated default style. It can be modified to be the same as the default Material-3 style too, just as before. The change also includes a default font size change for FCS opinionated styled navigation bar, from 11 dp to 12 dp. This change was done to harmonize it with its Material-3 style.

* **NavigationRail Material-3 defaults change**: Default colors of `NavigationRail` when opting in on
  `useMaterial3` and not using opinionated component themes will now match Material-3 default colors. If opinionated component themes are not used, FCS will use default Material-3 theme styles on `NavigationRail` when `useMaterial3` is true. If opting in on opinionated component themes, FCS uses its own custom and opinionated default style. It can be modified to be the same as the default Material-3 style too, just as before. The change also includes a default font size change for FCS opinionated styled rail, from 14 dp to 12 dp. This change was done to harmonize it with its Material-3 style.

* **Toggleable Material-3 style change:** Default color of toggles (Switch, CheckBox and Radio) are now using `primary` color as the default theme color when opting in on opinionated component themes or setting `ThemeData.useMaterial3` to true. The Switch, CheckBox and Radio themes then use a style that matches the Material-3 color design intent. In it, switches and toggles are mostly primary color. In Material-3 color design, the secondary color is a poor choice for switches and toggles, and it is therefore not used as their default color. It does not look nice with Material-3-based ColorSchemes, created e.g., using Material-3 color seeding. If you use a custom Material-3 color design, where secondary color is still prominent, you can, of course, still use it.

* **Fixed lint:** "Avoid using private types in public APIs". See tweet [discussion](https://twitter.com/RydMike/status/1533788260320923649) about why and when you might run into this lint being triggered by older Stateful Widgets. The lint warning was addressed in the package and examples.

**EXAMPLES**

* Added a **Theme Extensions** example to the default example app *Hot Reload Playground*.

* *Themes Playground:* Updated the default style info labels for Switch, Checkbox, and Radio.

* *Themes Playground:* To the top row theme selector, where the FlexColorScheme and component themes switches are, added the "Use Material-3" toggle. Previously, this toggle was only available on the introduction panel. The availability in the header makes it easy to toggle it ON and OFF at any time, to see what impact it has on widgets.

* *Themes Playground:* Updated the default style info labels for the NavigationBar. The logic to display default color labels in different config modes (Material-2/Material-3/FCS/FCS+Material-2/FCS+Material-3) is quite involved, please report any issues. 

* *Themes Playground:* Updated the default style info labels for the NavigationRail. The logic to display default color labels in different config modes (Material-2/Material-3/FCS/FCS+Material-2/FCS+Material-3) is quite involved, please report any issues.

* *Themes Playground:* Due to issue [#107190](https://github.com/flutter/flutter/issues/107190), the Playground previous default to use Material-3 was changed to false. 

* *Themes Playground:* Added support to customize the `surfaceTint` color. It controls both the elevation color used for elevated `Material` surfaces in Material-3. Plus for FlexColorScheme it is also used as the surface blend color. By default, the `surfaceTint` color equals `ColorScheme.primary` color. Generally, there are few good design reasons to change the color, but it is now possible to do so. A good graphical designer can use it to create subtle difference from the standard surface elevation color branding effects. Used poorly, it mostly creates not so appealing visual and coloring results.

**KNOWN FLUTTER SDK ISSUES**

The issues below in the Flutter SDK itself, are known to impact FlexColorScheme and Flutter 
theming in general.

* Switching `Typography` dynamically in Flutter SDK ThemeData is broken, see
  issue [#103864](https://github.com/flutter/flutter/issues/103864) for more information.
  If it is done and the error is ignored, an app doing so eventually becomes unstable.

* The *Themes Playground* app contains a workaround to avoid issue [#103864](https://github.com/flutter/flutter/issues/103864). The workaround is done by always using the 2021 Typography, and simulate 2018 Typography. This is done by using a custom TextTheme that looks like the 2018 Typography, when selecting it. The Playground App actually always stays in 2021 Typography, but it looks like it switches it. Which it does by applying a custom `TextTheme` to its 2021 Typography, that looks like 2018 Typography is used. All other examples avoid the issue by only using the Material-3 2021 Typography and not even mimicking a switch between Material-2 and Material-3 Typography.

  The above workaround is required because the **Themes Playground** app has toggles that can switch `Typography`, without the workaround it will eventually crash. With this work-around it never switches Typography, it just looks like it does, but app stays in 2021 Typography all the time. The by Themes Playground generated ThemeData config will use the actual real effective Typography. This is also fine, since an app using the theme will likely never switch used Typography. However, if it does, it will face the same issue as the Playground app did. The issue is a Flutter SDK issue that FlexColorScheme cannot fix. Most likely, 99% of apps will never run into this issue.

* In Flutter *stable 3.0.x*, when opting in on `useMaterial3:true`, the `Material` widget and other SDK widgets built on it, gets no elevation when only the `elevation` property is defined. It is required to also define `shadowColor` and/or `surfaceTintColor` to get any elevation effect. When using the `Material` widget itself this is easy to address. However, widgets like `Drawer`, `PopupMenuButton`, `BottomNavigationBar`, `NavigationRail`, `Dialog`, `AlertDialog`, `TimePickerDialog`, `DatePickerDialog`, `MaterialBanner` and `BottomSheet` do not expose these `Material` properties and cannot be elevated. 
 
  The issue is reported and tracked here [#107190](https://github.com/flutter/flutter/issues/107190) and also mentioned in the `FlexColorScheme` repo here
  [#54](https://github.com/rydmike/flex_color_scheme/issues/54). There are no good workarounds for using elevation on these widgets when `useMaterial3` is true. The options are to not use Material-3 if such elevations are important to your app design. One working fix is to wrap those widgets in a theme where `useMaterial3` is false, then the rest of your app can still use it. This is, however, a rather tedious workaround. Due to current Flutter SDK `Material` elevation issues when `useMaterial3` is true, it is recommended to not use it until this issue is fixed.

* This regression in master channel impacts AppBar icon colors when using Material-3 [#107305](https://github.com/flutter/flutter/issues/107305). It has not yet landed in stable channel Flutter *stable 3.0.5*, but if you use the master channel, it is something to be aware of.

## 5.0.1

**April 29, 2022**

**FIX**

* For the custom and temporary `m3TextTheme`: Fixed the Typography letterSpacing for bodyLarge to match corrected Material-3 spec that had wrong specification on the Material-3 website 0.15 -> 0.5. See Flutter SDK issue [#102121](https://github.com/flutter/flutter/issues/102121).
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
built-in produced `ColorScheme`s the themes' use have been revised to follow
the new Flutter 2.10.0 Material-3 based `ColorScheme`. The color changes to
the built-in schemes have been kept minimal compared to previous styles.

Mostly new color values were added to provide support for all the new
colors in the Flutter Material-3 `ColorScheme` update, that landed in Flutter
2.10.0. The new colors are style aligned with past styles as far as possible, while
also keeping them inline with the Material-3 ColorScheme design intent.

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
    the default set and configuration of the optional opinionated component themes,
    even if you did not pass any `FlexSubThemesData()` configuration data to
    `subThemesData`. Before when `useSubThemes` was true and no `subThemesData`
    defined, it created one internally using the default constructor
    `FlexSubThemesData()` and used it. It also ignored any defined and to
    `subThemesData` assigned one, if the flag was set to false.
  * The default component themes are now instead always activated and created by
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
    fit for a Material-3 design intent of container colors, but at least you will get
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
  the same order as their corresponding color properties in Flutter Material-3
  `ColorScheme` color values. The change of order is potentially breaking,
  but highly unlikely to break anything in major ways in normal usage.

**STYLE CHANGE - BREAKING**

* The custom "internal" and temporary `m3TextTheme` was changed.
  It is **style-breaking** with 4.2.0 and 5.0.0-dev.1 & 2.
  It breaks past used style when opting in on component themes and its optional
  custom `m3TextTheme` enabled. The updated custom implementation of it now follows the
  implementation used in the Flutter master channel, apart from this
  [issue](https://github.com/flutter/flutter/issues/102121),
  where it for now implements the value used in the Material-3 Web guide.
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
  it was too close to black. Since version 5 is anyway a major style-breaking with the introduction
  of the new Material-3 ColorScheme, the opportunity to improve this color value used in the
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

Version 5.0.0-dev.1 is a big refactor, with deprecation of previous `variant` based color names in favor of `container` ones that were added to updated Material-3 based `ColorScheme` in Flutter 2.10.0. The same additions and changes are now also introduced in FlexColorScheme. Despite being a big release, with many new features, actual breaking changes are very few and mostly concerns in version 4 deprecated members and, of course, requiring minimum Flutter 2.10.0 to work.

* [Detailed changelog](https://github.com/rydmike/flex_color_scheme/blob/master/changelog/changelog_5_0_0_dev_1.md)

## 4.2.0

**January 24, 2022**

**DEPRECATED**

* The property `surfaceStyle` has been deprecated. In
  version 4.0.0 it was already recommended to instead use the then introduced more
  powerful surface branding properties `surfaceMode` and `blendLevel`.
  The `surfaceStyle` property is still available and works as before, but you
  now get a deprecation warning if it is used. The property and all its related features
  will be completely removed in version 5.0.

**NEW**

* Updated required Dart SDK to minimum 2.15 that Flutter 2.8.0 uses.
  To use this release, at least Flutter 2.8.0 is required.
 
* Added support for opinionated component theme for the new Material-3 based
  `NavigationBar`. Flutter version 2.8.0 is the first stable version that
  includes the new Material-3 design based `NavigationBar`.

* Custom `FlexColorScheme` based themes can now also be defined by
  alternatively passing in a `ColorScheme` object to the `colorScheme`
  property in the constructor, as well as in `FlexColorScheme.light` and
  `FlexColorScheme.dark` factories. When used it overrides the `scheme` and
  `colors` properties in the factories. Same color properties in any constructor
  that exists as a direct property in the constructor still have the highest
  priority and will also override corresponding color properties in passed in
  `colorScheme`. The feature to make custom FlexColorScheme based themes from
  standard Flutter color schemes is useful if you already have a predefined
  elaborate `ColorScheme` definition. You can now use it directly and still
  use FlexColorScheme for its surface color branding and easy sub-theming.
  This capability will also be useful when Material-3 based `ColorScheme`
  in Flutter SDK arrives in the stable channel. With Material-3, color schemes
  may be created using the new Material-3 design color tools, e.g., from
  seed color(s) or using dynamic colors extracted from system wallpaper colors.
  With this feature it will then be able to feed those colors directly into
  FlexColorScheme, and use them as colors to create your `ThemeData`.

* Added a `ColorScheme` color selection option to selected opinionated
  component themes configuration class `FlexSubThemesData`. The component themes that
  support changing their `ColorScheme` based
  used theme color selection, have one or more properties called
  `nnnSchemeColor` where `nnn` describes the color feature that can be set
  to an alternative `ColorScheme` based color and not just its pre-defined
  `ColorScheme` based color property.
  The color selector is a `SchemeColor` enum property value used to
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
    preferred color of the icon and label text in the Material-2 based
    `BottomNavigationBar`, as well as used container background color.
  - `NavigationBar` in `FlexSubThemes.navigationBarTheme` to set the
    preferred `ColorScheme` color of the text and icon in the Material-3 based
    `NavigationBar`, as well as the pill shaped highlight color separately that
    surrounds the selected icon and its container background color.
  - `ChipThemeData` from `FlexSubThemes.chipTheme` to change the used
    `ColorScheme` based base color of Chips.
* The `SchemeColor` properties for the above component themes have a default selection
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
* A later FlexColorScheme version will add support for the new Material-3
  colors in `ColorScheme` when they land in the stable channel.
* This quick selection of `ColorScheme` based colors as theme-based
  colors of component themes, may be extended to a few more component themes in
  future versions. At least if it is seen as a practical and quick way to
  customize widget component theme colors within the constraints of colors in
  the `theme.colorScheme`.
* As before you can still apply your own total custom component themes to the
  `ThemeData` created with `FlexColorScheme` by using `copyWith`.
  FlexColorScheme is a way to easily make fancy, color consistent and
  balanced `ThemeData` objects using convenience-shortcut properties and
  methods. It does not prevent you from further modifying and tuning the
  produced `ThemeData` with standard Flutter SDK features.

**CHANGE**

* All properties in all `FlexColorScheme` constructors are now
  optional. The change is none breaking, and uses the Material-2
  design guide example theme light and dark as defaults for undefined values.

* Removed the `uses-material-design: true` line from library
  `pubspec.yaml` file was removed. It is not required since Material icon
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
    requires previously used bug work-around(s) for a window resize issue that
    had existed since 2019. For more info on this solved issue, see this
    [article](https://rydmike.com/gridview).
  * Added most new features in version 4.2.0 to the Themes Playground app and
    its theme code generation.


* **Example theme — Copy Playground Theme**
  * Added a new simple template example that is handy for trying copy-pasted
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
  component themes border radius will then default to Material-3 default border
  radius per widget. The const default value it had before was a remnant from early
  dev phase when widgets all defaulted to single shared radius and not Material-3
  defaults per widget type. If you explicitly passed in null, you did also in
  previous versions get the Material-3 defaults. Older tests did that, but now they expect
  the same result when no value is assigned, as it should have been.

**CHANGE**

Opt in opinionated component themes minor style changes:

* Added missing themed background color for `SnackBarThemeData` when
  using opt in opinionated component themes.
 
* Tuned the colored text theme on the component themes that are applied when
  using the optional colored text themes. The text styles now better match
  the regular none-colored style,
  and they are a bit more subtle. Text style `caption` got a bit
  of opacity. Material-2 designed widgets like `ListTile`, depend on it for
  making more muted subtitles by default for `ListTile` via the heading level
  opacity on `caption` text style. The opacity on it is lower though, to
  retain a bit more contrast on blended surfaces, while still adhering to
  the style intent.

* Major updates to readme doc, and typo corrections.

**EXAMPLES**

* Updated and tuned the examples. Example 5, the **Themes Playground**
  now includes the feature to define custom color schemes starting from built-in ones.
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
Version 4.0.0 does, however, contain so many new
features that it in itself warrants a new major release bump.

**BREAKING** 

* In dark mode, the `darkIsTrueBlack` now makes `surface` color
  8% darker instead of 6%. This change was required to support overlay color
  in dark mode when using `darkIsTrueBlack` when using the new `surfaceMode`
  property. For more information, see Flutter SDK
  issue [90353](https://github.com/flutter/flutter/issues/90353).
 
* From all the color scheme English descriptions, the sentence ending period was removed from all 
  description strings. If and when you want one, you can add it as needed.

**NEW**

* Added a more flexible and powerful alpha blending feature for
  surface and background colors. The new properties in the `FlexColorScheme`
  factories `light` and `dark` are `surfaceMode`, of type enum `FlexSurfaceMode`
  and integer `blendLevel`. Consider using them instead of previous
  `surfaceStyle`.
  The surface color blend style `surfaceStyle` is still default, and not yet
  deprecated, but may be so in version 5. It is not required anymore,
  but there was no major reason to break things by removing it either.
  
* Major new feature, easy sub-theming of Flutter SDK UI widgets.
  * You can opt in on nice looking opinionated component themes by setting
  `FlexColorScheme.useSubThemes` to true, it is false by default.
  * The defaults for the component themes are inspired by
  [Material-3 design (M3)](https://m3.material.io). It mimics it to a large extent
  when using default component theme values and settings. The varying corner
  radius is different per widget type. The new TextTheme Typography is also
  included. All parts cannot be made to look exactly like Material-3 in Flutter when using
  [Material-2 design (M2)](https://material.io), but many parts
  can, and where possible, the defaults try to follow those values. You can, of course, 
  override the defaults.
  * You can tweak these component themes with a number of parameters
  defined in the `FlexSubThemesData` class, passed to
  `FlexColorScheme.subThemesData`.
  * The `FlexSubThemesData` class provides parameters for easy adjustment
  of corner radius in Widgets that use `ShapeBorder` or decorations, that
  support changing the Widget's corner radius. With the component themes enabled, you
  can create a theme with a consistent corner radius on built-in
  Flutter SDK UI widgets.
  * The component themes also harmonize a few other styles, e.g. `ToggleButtons`
  to match the standard buttons regarding size and design as far as possible.
  * In case you still use the old deprecated buttons, they also get
  `ButtonThemeData` that as far as possible match the same style.
  * Via the component themes, it is by default opted-in to also use a bit of Material You
  like coloring on the text styles. This can also be opted out of, even if
  otherwise opting in on component themes, it is on by default when opting in on
    component themes.
  
* Added `FlexThemeData` static extension on `ThemeData`.
  * FlexColorScheme Themes can now also be created with the new syntax
  `FlexThemeData.light` and `FlexThemeData.dark`, instead of using
  `FlexColorScheme.light().toTheme` and `FlexColorScheme.dark().toTheme`.
  * The `toTheme` method is still available and works as before. It will not
    be deprecated. It is required when making elaborate custom component themes beyond
    what is offered when using `FlexColorScheme` based opt-in component themes. When
    you make custom component themes yourself, you often need access to
    the `ColorScheme` that is defined in current `FlexColorScheme()` instance.
    You can get it with `FlexColorScheme().toScheme`. Then use this
    standard `ColorScheme` or any of its colors, in your custom component theme
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
  if you wish to turn it off. It is not required or even desired when
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
  requires min Android SDK level 29, but other than that, it works without
  Android setup shenanigans. No added APIs, the API for it already existed
  in the previous version of FlexColorScheme, using it did, however, require
  special Android build configuration setup. This is no longer required.

* **New color schemes:** Added four new built-in color schemes. The total number of color schemes is now 36 matched light and dark theme pairs.
  * **Blue whale**, jungle green and outrageous tango orange. Use enum value `FlexScheme.blueWhale` for easy access to it. This theme is final and selected for inclusion as a new one.
  * **San Juan blue** and pink salmon theme. Use enum value `FlexScheme.sanJuanBlue` for easy access to it.
  * **Rosewood** red, with horses neck and driftwood theme. Use enum value `FlexScheme.rosewood` for easy access to it.
  * **Blumine**, easter blue and saffron mango theme. Use enum value `FlexScheme.blumineBlue` for easy access to it.
  
**CHANGE**

* The `FlexColor.schemesList` is now a `const` for improved efficiency.


**DOCS**
 
* The new main example is a complete quick start guide that doubles as the "developers" hot reload playground template. It has comments explaining what is going on. If you skip reading the readme docs and tutorial, the example may help to kick-start using FlexColorScheme and all its features. It shows most of the features in last tutorial example 5, but without any interactive UI. You are the UI and can edit prop values and use hot-reload to see changes.
* All examples now use the new `FlexThemeData` extension syntax to create the `ThemeData` and `surfaceMode` to define the alpha blended surfaces.
* Examples 2 to 5 also use the in Flutter 2.5 new skeleton architecture, with a ChangeNotifier based controller. AnimatedBuilder to listen to it, and an abstract service to get and persist the theme settings, with a concrete in-memory implementation, plus the implementations to persist the theme.
  * Examples #2 to #4 use the Hive implementation.
  * Example #5 uses the SharedPreferences implementation.

**TESTS**

* Added tests for the new features, total 1066 tests.
* Coverage is now 99%, will improve it more later.

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
