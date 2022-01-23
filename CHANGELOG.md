# Changelog

All notable changes to the **FlexColorScheme** package are documented here.

## [4.2.0] - January 23, 2022 (WORK IN PROGRESS)

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
  property in default the constructor, as well as in `FlexColorScheme.light` and
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
  With this feature will then be able to feed those colors directly into 
  FlexColorScheme and use them there too to create your `ThemeData`. 


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
  that results oin same `ColorScheme` color values being used as they had 
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
  `ColorScheme` supported by Flutter 2.8. It is recommended to avoid using the
  `primaryVariant` and `secondaryVariant` colors if you want to avoid later
  migrations, because these variant colors are being deprecated, 
  see [#93427](https://github.com/flutter/flutter/pull/93427). 
* A later FlexColorScheme version will add support for the new Material 3
  colors in `ColorScheme` when they land in the stable channel.
* This quick selection of `ColorScheme` based colors as none standard themed
  colors of widget sub-themes, may be extended to a few more sub-themes in 
  future versions, if it is seen as a practical and quick way to customize 
  widget sub-theme colors within the constraints of colors in 
  the `theme.colorScheme`. 
* As before you can still apply your own total custom sub-themes to the 
  `ThemeData` created with `FlexColorScheme` by using `copyWith`. 
  FlexColorScheme is a way to easily make fancy and color wise consistent and 
  balanced `ThemeData` objects using convenience shortcut properties and 
  methods, it does not prevent you from further modifying and tuning the 
  produced `ThemeData` with with standard Flutter SDK features.


* **Removed:** Removed the `uses-material-design: true` line from library 
  `pubspec.yaml` file. It is not needed since Material icon features are not 
  used by this package.


* **Examples:** Themes Playground (Example 5) Improvements:
  * Fixed onColor for a few colors in the ThemeData color presentation for cases
    where it might differ from colorScheme onColors. This could happen when 
    disabling FlexColorScheme and when some colors do not match its onColors.
  * Fixed index on _AppBarSettings card.
  * Changed ColorScheme indicator boxes to use the themed border radius.
  * Added a button to copy theme, and improved the explanations to make the 
    functionality more obvious and accessible. Previously only the entire
    ListTile was the button, this UI with no button was not so clear. Now 
    there is also a button that says COPY. Clicking on the ListTile still 
    works as well.
  * Add and updated app icon resources used by all the example apps.
  * Use new version of StaggeredGridview 0.6.0 that no longer requires 
    previously used bug work around(s) for a window resize issue it had 
    since 2019. For more info on this solved issue, see this
    [article](https://rydmike.com/gridview).
  * **TODO:** Add the new features in version 4.2.0 to the Themes Playground app.


* **Documentation:** Reviewed and corrected many API docs. The API docs are 
  very thorough and complete. They usually cover any question you might have and
  more. Added an API Intro and Guide chapter to the readme.


* **TODO WIP** **Tests:** Added tests to cover the new features, 
  now total 1104 tests. Test for the new `colorScheme` based feature are still
  missing and must be added before release.
  

## [4.1.1] - November 20, 2021

* **Documentation:** Fixed a broken link in the readme that pub.dev analyser found.

## [4.1.0] - November 20, 2021

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

## [4.0.0] - November 13, 2021

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
   
## [4.0.0-dev.1] - November 13, 2021

* See change log for stable 4.0.0, it was the same for the dev release.
  the text is just not repeated here anymore.
   
## [3.0.1] - July 1, 2021

* **Fix:** The internal order of swapping primary and secondary colors and reducing 
  used colors in static function `FlexSchemeColor.effective(FlexSchemeColor colors,
  int usedColors, {bool swapColors = false})` matters for the intended result when
  used together in the same call. The function now swaps primary and secondary colors,
  before reducing the used colors.
* **Tests:** Added tests for above fix that captures the issue and fails
  in version 3.0.0. Total 741 tests, coverage 99.75%.
* Documentation and typo fixes.

## [3.0.0] - June 25, 2021

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

## [2.1.1] - March 30, 2021

* **Change:** Made the VoidCallback `onSelect` in `FlexThemeModeOptionButton` nullable.
  The optional callback allows for the button to be used for example as a trailing
  widget in a ListTile. Keep it null to not have any callback, nor hover or Ink of its own, and use
  the select event of the parent instead. When it is used as standalone button you
  normally want to use this callback, but not if you want the parent to handle it, that use case was
  not allowed with previous version. 

## [2.1.0] - March 22, 2021

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

## [2.0.0] - March 15, 2021

* **First** stable release of FlexColorScheme with sound null safety.
* Includes the changes from [2.0.0-nullsafety.1] and [2.0.0-nullsafety.2].
* **Breaking:** The by default enabled divider for `FlexColorScheme.themedSystemNavigationBar` has been 
  revised to be disabled by default. To use a divider on the top of the system navigation bar on Android, 
  you have to enabled it manually. This is more in line with expected default behaviour. 
  
## [2.0.0-nullsafety.2] - March 15, 2021

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
     

## [2.0.0-nullsafety.1] - February 4, 2021

* **First** version with null-safety.
* **Breaking:** Removed the in version 1.3.0 deprecated `FlexSchemeSurfaceColors.themeSurface`, use
  `FlexSchemeSurfaceColors.surfaceStyle` instead.
* **Tests:** Number of tests were reduced from 723 to 639, when all null related tests were removed.  

## [1.4.1] - January 31, 2021

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
  
## [1.4.0] - January 18, 2021

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

## [1.3.0] - January 7, 2021

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
    
## [1.2.0] - January 4, 2021

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

## [1.1.1] - December 31, 2020

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

## [1.1.0] - December 29, 2020

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

## [1.0.0] - December 21, 2020

* Version 1.0.0 released
* Documentation layout updates and typo corrections. 
  
## [1.0.0-dev.2] - December 21, 2020

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

## [1.0.0-dev.1] - December 17, 2020

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

### TODO

- Version 5 will add support for Material 3 and will be released when a required
  level of M3 features have reached the Flutter stable channel. At minimum, it 
  will probably be visually breaking to some extent, when it starts using 
  SDK implementation of M3 design guide. Simple because its current own 
  M3 "like" M2 based implementation of existing theming and text capabilities
  cannot always match the M3 designs especially on color usage.

### COMPLETED
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

### MAYBE

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


### OUT OF SCOPE

#### Serialization of FlexColorScheme  
  
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
