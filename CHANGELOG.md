# Changelog

All changes to the **FlexColorScheme** (FCS) package are documented here.

## 7.3.1

**August 17, 2023**

- FIX: Themes Playground: Update the in-app documentation of known Flutter issues to reflect changes brought by Flutter 3.13.
- FIX: Changelog 7.3.0 typos and style corrections by @TahaTesser.

## 7.3.0

**August 16, 2023**

This release uses new features in Material-3 theming that are only available in Flutter 3.13 or later. It thus **requires** minimum **Flutter 3.13.0**. 

In the next Flutter stable release after 3.13, Flutter will change the `ThemeData.useMaterial3` default from `false` to true. In other words, applications using FCS will get the Material-3 colors, text styles, and other visuals, by default. The `FlexColorScheme` API will then be following along with this breaking change. In this release the `FlexColorScheme` API `useMaterial3` still defaults to `false`. The **Themes Playground** app has for quite some time already defaulted to setting the value to `true`. Which is also already the case in Flutter when you create a new application with `flutter create`.  

**PACKAGE**

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

 - `FlexSubThemes.dropdownMenuTextStyle` now default to `TextTheme.bodyLarge` if not defined. Previously it used Flutter SDK default `TextTheme.bodyLarge`, which is a poor design default as the style does not fit with default style `bodyLarge` used as default style in `TextField`in M3 mode. See [issue #131350](https://github.com/flutter/flutter/issues/131350) that contains a mention of this style deviant. In Jetpack compose, the `DropdownMenu` and its `TextField` part correctly defaults to using `bodyLarge`, this is thus assumed to be the correct spec wise. The issue of wrong default text styles in Flutter menus is further discussed in [issue #131676](https://github.com/flutter/flutter/issues/131676). FlexColorScheme will not internally correct the wrong default `TextStyle` on menu items, it will however change to follow the default when Flutter stable does. The difference in the `DropdownMenu` text input field was however significant enough to warrant a change already before the fix lands in Flutter stable.

**FIX**

* Fixed the `FlexSubThemes.checkboxTheme` that broke due to an unexpected breaking change in Flutter 3.13 caused by PR [#125643](https://github.com/flutter/flutter/pull/125643). The breaking change is discussed further in [issue #130295](https://github.com/flutter/flutter/issues/130295). The fix to the checkbox theme incorporates the new behavior to keep its custom styling working as before and expected.

* Fixed `useInputDecoratorThemeInDialogs` not working for some properties in the `InputDecorator`, when the value was null or `false`, where some properties in the `TextField`s in the `TimePickerDialog` did not revert back to default styles. Now they do, but via hard defined values to mimic the default M3 style, as that is the only way to get back to it when a very custom `themeData.inputDecoratorTheme` is being used.

**THEMES PLAYGROUND**

**NEW**

* The **PopupMenu and Dropdowns** panel got a setting for older Material-2 based `DropdownButtonFormField` and `DropdownButton` to set the new alignment property, which is an ancient theming property in the old `ButtonThemeData` that was used by deprecated and removed Material Buttons, but the theme is still used by these buttons. 

* On the TextField panel, added a feature to set the input decoration style back to FlexColorScheme's own defaults.

**CHANGE**

* Harmonized custom color activation settings on **Theme Colors** and **Seeded ColorScheme**.

* Removed old switch in custom colors in dark mode, that was used to enable using input scheme color as own seed colors in dark mode when using custom colors. For simplicity, the custom dark mode colors have been used directly as seed colors in a few releases in the Playground already. The control was an old left-over with no function anymore.

* The global themed input decorator usage is now on by default for `TimePickerDialog` and `DatePickerDialog`. This is the only style currently supported for `DatePickerDialog` in Flutter, so it makes sense to keep it on by default. Turning it OFF for now only removes the custom, input decorator style from the `TimePickerDialog`. Despite the new feature in Flutter SDK, it cannot be removed from the `DatePickerDialog`. This is discussed in [PR #128950 comment](https://github.com/flutter/flutter/pull/128950#issuecomment-1657177393). Additional info is also available in Flutter [issue #131666](https://github.com/flutter/flutter/issues/131666).

**FIX**

* Fixed the old default color info for the toggles Switch, Checkbox and Radio, that are shown when FlexColorScheme is disabled as default values in Material 2 dark mode. They have been updated in Flutter SDK to `ColorScheme.secondary` color and are no longer not the horrid dark mode teal color. This default color info, shown when FlexColorScheme is disabled in the **Themes Playground**, had not been updated for the dark M2 mode Switch, Checkbox and Radio colors. 


## 7.2.0

**July 20, 2023**

**PACKAGE**

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
* In M2 mode, when not using sub-theme, `ThemeData.textSelectionTheme` it now gets a default `TextSelectionThemeData()` and its themed style defaults to SDK defaults. Enable and use sub-themes and its new theming features to style it further.
  * In previous versions in M2 mode, text selection handles used `Theme.of(context).primaryColorDark`, even when sub-themes where not enabled. They still do by default, but only when sub-themes are enabled. 
* In both M2 and M3 mode `bottomNavigationBarElevation` in `FlexSubThemesData` and `elevation` in `FlexSubThemes.bottomNavigationBar` when undefined, now default to elevation 3, giving the `BottomNavigationBar` a default elevation of 3 when using FlexColorScheme.
  * Previously default elevation was zero. Flutter SDK defaults to 8. The FlexColorScheme opinionated default value was changed to 3 to make it equal to the default elevation of `NavigationBar` in M3 mode, so that the bottom navigators share same default elevation when using FlexColorScheme. As before, you can adjust the elevation as needed with the API and in the Themes Playground.
* In M2 mode `navigationBarElevation` in `FlexSubThemesData` and `elevation` in `FlexSubThemes.navigationBarTheme` when undefined, now default to elevation 3, giving the `NavigationBar` a default elevation of 3 in M2 mode when using FlexColorScheme.
  * Previously default elevation was zero. Flutter SDK defaults to 0. The FlexColorScheme opinionated default value was changed to 3 to make it equal to the default elevation of `NavigationBar` in M3 mode, so that the bottom navigators share same default elevation when using FlexColorScheme. As before, you can adjust the elevation as needed with the API and in the Themes Playground.
* In M2 mode, `bottomAppBarElevation` when undefined, now also remains undefined in `FlexSubThemes.bottomAppBarTheme` causing default elevation in M2 mode to become 8 like in the SDK default for M2. 
    * Previous default used same elevation as `AppBar`, when `bottomAppBarElevation` was undefined, or 0 if `AppBar`'s elevation was also undefined. The rationale for removal of this default behavior is to start cleaning out opinionated behavior that no longer makes sense to keep around, especially since eventually M2 mode is going away in Flutter. 
    * The default for M3 mode is unchanged, using elevation 3, via SDK defaults when undefined.
* In M2 mode, `ElevatedButton`, `FilledButton`, `FilledButton.tonal`, `OutlinedButton`, `TextButton` and `ToggleButtons` now default to border radius 40 dp. Previously they defaulted to 20 dp. Their style is intended to match the used Stadium border design in M3, which is still the default in M3 mode. When using very tall buttons, the 20 dp default value was not enough to keep the buttons looking Stadium shaped as intended in FCS M2 mode.


**FIX**

* Fixed that `TextSelectionThemeData` did not automatically use colors that matched and followed `subThemes.inputDecoratorSchemeColor` when it was modified and text selection colors were not explicitly defined. The text selection, cursor and text selection handles should follow the input decoration's base color by default when they are not defined separately. Defining text selection colors was not possible before version 7.2.0, but defining input decoration colors was, but text selection remained using primary. Now they by default follow the input decoration color, but can also be separately defined via new features in version 7.2.0.
  * **Known limitation**: Text selection handles on iOS platform cannot be changed with a theme from `primary` color. So on iOS their themed color is always `colorScheme.primary`. The text selection color and cursor color do follow the theme also on iOS.
* Fixed `useFlutterDefaults` when elevation is null in `FlexSubThemes.bottomNavigationBar` not using Flutter SDK default elevation of 8.
* Added a built-in theme fix to make the elevation tint change in the `AppBar` animate when it changes. Based on Material spec and observed native Android behavior and compose behavior, the `AppBar` color change when it is scrolled under should animate. Flutter M3 apps do not do this, the color change is instant. Discovered a theme workaround that makes it animate. This is now always used in FCS themes until Flutter includes its own fix for it.
* The `FlexSubThemes.menuButtonTheme` and the `MenuButtonThemeData` it makes, got a `style` value, where `ButtonStyle.animationDuration` is always `Duration.zero`. This solved the issue reported in [issue #123615](https://github.com/flutter/flutter/issues/123615). Consequently, there is no need for a fix for the issue, since it could be solved with a theme property.


**THEMES PLAYGROUND**

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
* The Shop app in the **Theme Simulator** received some style updates to use more theme dependent styling, like Card as containers for shop items. 

**FIX**

* Fixed allowing elevation changes of `BottomNavigationBar` and `NavigationBar` when `useFlutterDefaults` is true (ON).
* Fixed allowing opacity usage on `NavigationBar` when default undefined background color is used. 


**POSTPONED**

* The new Squircle and platform adaptive shape selection features were postponed. They may arrive later this year in version 7.3 or a later release. It is pending more investigation into the best choice concerning correct shapes and potential performance issues they might come with.


## 7.1.2

**May 17, 2023**

**PACKAGE**

**FIX**

* SubThemes ElevatedButton in M3 mode, when using `elevatedButtonSecondarySchemeColor` and there was no value defined on `elevatedButtonSchemeColor` it resulted in wrong color being used as default for `elevatedButtonSchemeColor`. Issue and test fixed.

**CHORE**

* Updated Android runner included for all the examples. The previous one no longer worked with Flutter 3.10 and its used Kotlin version. With included updated version, the examples can be built as Android apps again.


## 7.1.1

**May 15, 2023**

**PACKAGE**

**FIX**

* Fixed regression issue where custom a `textTheme`'s color is no longer applied. 
  * See issue [#151](https://github.com/rydmike/flex_color_scheme/issues/151). 
  * The issue was introduced in version 7.0.0, when adding a feature that provided automatic correct default contrast text color for **GoogleFonts**, when a default `GoogleFonts` and its `TextTheme`, like `GoogleFonts.notoSansTextTheme()` is used in `textTheme` or `primaryTextTheme` in `FlexColorScheme`. 
  * The `GoogleFonts` and its  `textTheme` color always defaults to the color from M2 mode default light mode `ThemeData.light().textTheme`. This when used in `ThemeData` forces users to assign correct M2/M3 color and `textTheme`/`primaryTextTheme` contrast color, to all its styles, whenever used in a situation where the default is light theme mode M2 color is the wrong color. The default contrast color is basically only correct for a light theme when using Material 2. For anything else, it is incorrect.
  * FCS version 7.0.0 got rid of the need to make such correction assignment, but it also incorrectly disabled using custom colors used in any custom `TextTheme`.
  * The applied FIX keeps the desired "no need to give correct contrast color" to a default **GoogleFonts** `TextTheme` in **FlexColorScheme** and also allows making custom colored text custom text themes.
  * The FIX is a bit involved, it also led to an idea that maybe `GoogleFonts`, should just keep the font color default as null, and let Flutter's default Theme behavior handle the assignment of correct color for the M2/M3 mode and light/dark theme mode, using each mode's default contrast color, for each style in the `TextTheme`. See issue [GoogleFonts #401](https://github.com/material-foundation/flutter-packages/issues/401) for more info on this.
  * Tests added for the regression and for the new `GoogleFonts` default `TextTheme` being used and nulling its colors, so they get correct M2/M3 mode default contrast colors in both light and dark mode and for both `textTheme` and `primaryTextTheme`. 


**THEMES PLAYGROUND**

**FIX**

* Fixed the code gen for `useTextTheme` setting to always generate code for setting's value in Playground code gen when it is not null. When it is undefined or null, it means that the `TextTheme` follows the M2/M3 specification mode default `TextTheme` and `Typography`. In previous versions, the code setting for `useTextTheme` only showed up in the generated code when it was needed to produce the viewed end result. If the M2/m3 mode default produced the same result, the setting was not added to the generated API config. This may be confusing. It is clearer to always show it in code gen when it is set to a none null value. See discussion in repo [Q&A #150](https://github.com/rydmike/flex_color_scheme/discussions/150).


## 7.1.0 

**May 12, 2023**

FlexColorScheme v7.1.0 supports new theming features in Flutter 3.10, it thus requires minimum Flutter 3.10 and Dart 3.0. 

**NEW**

* Added support for "bring shadows back" adaptive theming feature to `BottomAppBar` and `BottomSheet`.
* Added `datePickerTheme` to `FlexSubThemes`.
* Added properties `datePickerDialogRadius` and `datePickerHeaderBackgroundSchemeColor` to `FlexSubThemesData`.

**CHANGE**

- Updated to use minimum `flex_seed_scheme ^1.3.0`. This version, no longer depends on `material_color_utilities`, thus avoiding all version issues and conflicts when Flutter changes what breaking version of `material_color_utilities` it uses on different channels and versions.

**THEMES PLAYGROUND**
- Themes Playground 7.1 for FlexColorScheme 7.1 can be found [here](https://rydmike.com/flexcolorscheme/themesplayground-v7-1).

* **NEW**
  - Added selection of themed header color scheme color for the DatePickerDialog on the Dialogs panel.
  - Added showing SearchBar with SearchView to the AppBar panel.
  - Added showing SearchBar with SearchView to the Widget Showcase.

* **UPDATE**
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

This is a major update to the **FlexColorScheme** package and a substantial leap for the companion app **Themes Playground**. For a detailed list of all changes, please refer to the incremental log from its development releases linked below.

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

- Themes Playground (Example 5): Fixed scroll issue in page view mode on Web-builds. Only examples related, no package impact.
- API doc updates.

## 6.1.0

**Nov 20, 2022**

**FlexColorScheme** version 6.1.0 contains many new features, more component sub-themes and configurable properties. It improves seed-generated color scheme capabilities by adding more pre-configured seed generation configurations and color contrast accessibility options. 

A criticism of Material 3's color system and seed-generated color schemes, is that using colored contrasting colors may be less accessible. FlexColorScheme offers a way to enable in-app modification of its seed-generated color schemes. Any seed generation configuration can optionally return results with plain white and black contrasting on colors. This can be applied separately for main on colors and on surfaces.

The **Themes Playground** application has been updated to include most of the new features. It has been improved to make it easier to discover some of its previously existing features, like using custom colors in the Playground to define your own theme. 

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
* **Style breaking:** When opting in on opinionated sub-themes, the `Chip` style is slightly modified from previous versions. The new opinionated FCS default style is more distinct than before and more aligned with styling borrowed from the Material 3 mode `Chip` design. The `deleteIconColor` now defaults to `onSurface` instead of `primary` and it can be defined to be any `SchemeColor` based color. The Chips revised style, look better than before. Using Material 3 and with it themed `Chips` is also fully supported, also customizing color on selected state of selectable **Chips** is available. Color-tinted chips are also available as before. Be aware though that Material 3 theming in the current 3.3 version of Flutter has some limitations. If you assign a custom color to selected chips, the disabled state of Chips can no longer conform, to M3 spec of disabled selected Chips. 
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
  - These temporary M3 fixes, make it possible to use the `BottomSheet` and `PopupMenuButton` when opting in on Material 3. Since shadow elevations are still not working for them in M3 mode, it is not perfect, but much better.
  - The reasons why these issues exist are because these components have not yet been migrated to M3 in Flutter 3.3, plus the combination of this `Material` elevation [issue #107190](https://github.com/flutter/flutter/issues/107190) in M3 mode. As a result we get no elevation tint or any shadow on such `Material` using widgets in M3 mode.
  - The [issue #107190](https://github.com/flutter/flutter/issues/107190) has been fixed in master. Even if only it lands, we will get shadows back in M3 default `Material`, also if the components and their themes do not land. In combination with the here made M3 manual elevation tint fix, they would in such a case get the correct M3 default background elevation tint behaviour and shadow.
  - The above temporary work-around fixes will be removed when the stable version of the framework implements the correct Material 3 elevation behavior for these widgets, and produces the same results itself. Hopefully in the next stable release of Flutter.

**THEMES PLAYGROUND**

* On **Theme colors** panel:
  - Improved the discoverability of defining and using totally custom colors for your theme in the **Playground**. It has always existed, but maybe now users will discover it more easily. You can still also copy any existing theme as a starting point for your custom color definitions.
  - Simplified the terminology used on the **Theme colors** panel. Also simplified its color presentation.
  - Added an on/off switch that controls the `swapLegacyOnMaterial3` setting.

* Updated and shortened the **Introduction**. Probably nobody reads it, or the [package docs](https://docs.flexcolorscheme.com/) with **Playground** guides, but at least it is there.

* The **Seeded ColorScheme** panel:
  - When using seeded color schemes, it is now possible to force contrasting **on** colors for all the main colors (primary, secondary, tertiary, error and their containers) to be plain black or white, for better and more traditional contrast text and iconography colors. Likewise, for the **on** colors for all the surfaces, background, surface, surfaceVariant and inverseSurface. This is a great toggle to get a more classic look while seeding main and surface colors. Turning these toggles on can also help with accessibility by increasing contrast and not using color on color for contrast. Offering these as user controllable toggles in apps can be a good way to allow users to tune not only the look, but also color accessibility.  
  - Now also show the source input "Scheme defined" colors, the `FlexSchemeColor`, that gets used as key colors for the Material 3 seeded ColorScheme generation, when it is turned on.
    - Arranged the panel content for better inclusion and presentation of the created **Tonal Palettes** used to make the seeded ColorScheme.
    - The Tonal palette color **tones** now have tooltips that present each tone.

* On **Surface blends**: 
  - Changed surface blend mode defaults to values that are more mobile design-friendly. No API change involved. API defaults are the same as before, changes only affect the Playground app defaults. 
    - Previously used **Playground** default values were intended for desktop and tablet designs, where controls and text are placed on containers with a lower surface blend, like the **Cards** used in the Themes Playground app itself. While one can make a responsive app, that uses this design nicely from mobile to tablet and desktop sizes, most mobile only apps are not designed so. Using Playground defaults that produce a nice theme for more typical mobile designs, will help new FlexColorScheme and Themes Playground users, configure nice themes even quicker.
  - The blend mode control now also has a popupmenu that always shows all surface blend modes, also in smaller UI. On smaller devices the `ToggleButtons` control, as before, only shows popular options.

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
    - We like using the Material theme following `SwitchListTileAdaptive` iOS switch on iOS on macOS. However, the app presents Material theming, and the new Material 3 Switch will land in Flutter stable soon. The new Material 3 `Switch` is even nicer than the Cupertino Switch, and we want to see it in the app when it lands. We will thus use the Material Switch in the Themes Playground app on all of its own controls on all platforms going forward.
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
  The Material 2 elevated button is color wise, like the M3-filled button, but with elevation.

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
  it internally with its extended version `SeedColorScheme.fromSeeds`. The new algorithm changes 
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

* Updated `Chip` sub-theme when opting in on `useMaterial3`. When  `useMaterial3` is `true`, it 
  now uses upcoming 
  M3-styled Chips instead of its own opinionated custom style, also when the opinionated component
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

* Updated to support *Flutter 3.0.0*, with *Dart 2.17* and the latest Flutter package dependencies in example apps. Requires at least *Flutter 3.0.0* and *Dart 2.17.0*.

**NEW**

* **Added** full support for in *Flutter 3.0.0* new `ColorScheme.surfaceTint` color. It is set to `ColorScheme.primary` color by default, as Flutter and Material 3 does. If a custom `surfaceTint` color is provided, it is also used as the blend color, instead of `primary` color, for FlexColorScheme's surface blend feature.

* **Added** API for using *Flutter 3.0.0* theme extensions directly via FlexColorScheme API. It was added as a convenience feature in order to avoid having to add theme extensions with a `copyWith` on FlexColorScheme produced ThemeData. With the `FlexColorScheme.extensions` and `FlexThemeData.extensions` properties you can add custom theme extensions directly.

**DEPRECATED**

* **Deprecated:** `FlexColorScheme.m3TextTheme`. The custom M3 text theme is no longer needed after Flutter 3.0.0 release that includes the new M3 Typography in addition to its earlier released `TextTheme`. You can opt in on using the new M3 style TextTheme as before by setting `FlexColorScheme.subThemesData.useTextTheme` to true **or** by setting `FlexColorScheme.useMaterial3` to true. Using either does however, come with known issue [#103864](https://github.com/flutter/flutter/issues/103864), where dynamically switching Typography, e.g. from 2014 or 2018, to M3 2021 Typography triggers mentioned assert in issue [#103864](https://github.com/flutter/flutter/issues/103864). This issue has always existed in Flutter SDK ThemeData when dynamically changing between different Typography. Before FlexColorScheme avoided triggering this issue by only using Typography 2018, also when opting in on M3 TextTheme, that before used 2018 based Typography to make a custom M3 like `TextTheme`. Avoiding this issue is no longer possible when opting in on M3, that now correctly uses its own and different Typography from M2. This exposes this issue if you dynamically change ThemeData from one to another Typography. To avoid this Flutter SDK issue, use the same Typography for all your themes in your app and do not dynamically switch theme between ThemeData objects that use different Typography in your application. The use cases for doing this are few, but it is still a Flutter SDK limitation to be aware of.

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

* **Toggleable M3 style change:** Default color of toggles (Switch, CheckBox and Radio) are now using `primary` color as the default theme color when opting in on opinionated component themes or setting `ThemeData.useMaterial3` to true. The Switch, CheckBox and Radio themes then use a style that matches the M3 color design intent. In it, switches and toggles are mostly primary color. In M3 color design, the secondary color is a poor choice for switches and toggles, and it is therefore not used as their default color. It does not look nice with M3-based ColorSchemes, created e.g. using M3 color seeding. If you use a custom M3 color design, where secondary color is still prominent, you can, of course, still use it.

* **Fixed lint:** "Avoid using private types in public APIs". See tweet [discussion](https://twitter.com/RydMike/status/1533788260320923649) about why and when you might run into this lint being triggered by older Stateful Widgets. The lint warning was addressed in the package and examples.

**EXAMPLES**

* Added a **Theme Extensions** example to the default example app *Hot Reload Playground*.

* *Themes Playground:* Updated the default style info labels for Switch, Checkbox, and Radio.

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
built-in produced `ColorScheme`s the themes' use have been revised to follow
the new Flutter 2.10.0 Material 3 based `ColorScheme`. The color changes to
the built-in schemes have been kept minimal compared to previous styles.

Mostly new color values were added to provide support for all the new
colors in the Flutter Material 3 `ColorScheme` update, that landed in Flutter
2.10.0. The new colors are style aligned with past styles as far as possible, while
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
  it was too close to black. Since version 5 is anyway a major style-breaking with the introduction
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
  version 4.0.0 it was already recommended to instead use the then introduced more
  powerful surface branding properties `surfaceMode` and `blendLevel`.
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
* This quick selection of `ColorScheme` based colors as theme-based
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
  the regular none-colored style,
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
Version 4.0.0 does, however, contain so many new
features that it in itself warrants a new major release bump.

**BREAKING** 

* In dark mode, the `darkIsTrueBlack` now makes `surface` color
  8% darker instead of 6%. This change was needed to support overlay color
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
  can, and where possible, the defaults try to follow those values. You can, of course, 
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
  * Via the sub themes, it is by default opted-in to also use a bit of Material You
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
  requires min Android SDK level 29, but other than that, it works without
  Android setup shenanigans. No added APIs, the API for it already existed
  in the previous version of FlexColorScheme, using it did, however, require
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
  "developers" hot reload playground template. It has comments
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
