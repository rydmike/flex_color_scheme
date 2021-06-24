# Changelog

All notable changes to the **FlexColorScheme** package will be documented in this file.

## [3.0.0] - June 24, 2021

* **Breaking:** The color `accentColor` is being deprecated in Flutter SDK `ThemeData`.
  Usage and dependence of `accentColor` in FlexColorScheme is removed to support this
  transition. Its abrupt removal as a property in FlexColorScheme is however
  a potential breaking change. The probability that you might have used it as a property in your 
  FlexColorScheme based theme is low. It only served the purpose of being defined to primary color
  in FlexColorScheme. Via that it set highlight color of outlines on
  text field boxes to primary color in dark theme mode. The old accent color was actually 
  not used for anything else in
  themes anymore when using FlexColorScheme. The property is now going away totally
  in Flutter SDK. The default ThemeData in Flutter SDK now in dark mode creates a
  theme for Outline and Underline indicator on input fields that are based on primary color 
  just like FlexColorScheme did before. It no longer uses `accentColor` for it. The resulting 
  default dark mode style on text fields thus remains unchanged. If you had used the
  `accentColor` property before in FlexColorScheme as a short-cut to define text field outline or 
  highlight color that differed from primary color in dark mode, then you will need 
  to recreate this via explicit text field decoration themes.
  
* **New:** The `FlexColorScheme.dark` and `FlexColorScheme.light` factories have a new 
  property `swapColors`. If true, this will swap primary and variant colors with their
  secondary counter-parts.
  
  This flag can be set to true, if you want to make a theme where your primary and secondary 
  colors are swapped compared to their definition. This effectively doubles the
  variation possibilities of themes based on the pre-defined color schemes.
  
  This feature is useful if you want to quickly swap primary and secondary colors when
  using the pre-defined color 
  schemes or with computed dark schemes from light schemes. If you are
  explicitly defining all you light or dark scheme colors, you can of course define
  them in desired order. Even if you do that, this feature will still swap whatever 
  colors you defined for primary and secondary when set to true. You can thus also 
  use this feature as an easy end-user modifiable theme option if you like
  to offer the capability to toggle the primary and secondary theme colors the 
  other way around.
  
* **New:** The static function `FlexSchemeColor.effective(FlexSchemeColor colors,
  int usedColors, {bool swapColors = false})` is used to implement the above
  `swapColors` feature. It also exposes the logic behind the FlexColorScheme 
  dark and light theme `usedColors` property. This static method is helpful if 
  you need to compute effective theme colors externally to FlexColorScheme 
  to present the active theme, based on same settings. This is used by example 5
  to change the colors on the theme mode switch when the swap color settings
  is toggled. The `usedColors` property is not shown in any 
  example, but it could be used similarly.

* **New schemes:** Added four new built-in color schemes.
  * **Barossa** - Barossa red and cardin green theme.
    Use enum value `FlexScheme.barossa` for easy access to it.
  * **Shark and orange** - Shark grey and orange ecstasy theme.
    Use enum value `FlexScheme.shark` for easy access to it.
  * **Big stone tulip** - Big stone blue and tulip tree yellow theme.
    Use enum value `FlexScheme.bigStone` for easy access to it.
  * **Damask and lunar** - Damask red and lunar green theme.
    Use enum value `FlexScheme.damask` for easy access to it.

* **Change:** Made the VoidCallback `onSelect` in `FlexThemeModeOptionButton` nullable.
  The optional callback allows the button to be used as a trailing
  widget in a ListTile by allowing it to use its parents onTap callback instead.
  
* **Tests:** Added tests for the new features and removed test related to
  accentColor. Total 696 tests, coverage 99.76%.

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
* **Examples:** Added top status bar scrim toggle, system navigation divider, and navbar style toggles to example 5.
  These only work on Android builds and do not have any functionality on the live Web builds.
* **Tests:** Added tests for the new features. Total 690 tests, coverage 99.76%.

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

* **New schemes:** Added four new built-in color schemes.
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
  * Removed the "back to contents" link after each chapter. It was nice and worked fine on Github, but for some reason
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
  
* The themed `AppBar` and `BottomAppBar` elevations still default to 0. However, and for convenience, the themed values 
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
* Example 5: Fixed so that the Roboto font, that is always used by the examples regardless of platform, now also gets
  used when you toggle to create the theme from the scheme with the ThemeData.from(colorScheme). It looked
  a bit ood when it changed to platform default font on Desktop and Web versions, and FlexColorScheme.toTheme used
  Roboto. This was modified so that the resulting themes use the same font and are comparable.

## [1.1.1] - December 31, 2020

* Updated example 5 to include UI that can be used to vary the computed dark themes white blend percentage level.
  This was added to better demonstrate the `toDark` feature.
* Added a `defaultError` fix/modifier that enables the built-in schemes to use the Material design guide's default dark 
  error color when using the `toDark` method to compute a dark scheme from a light scheme, that already defines a light 
  scheme error color. The `toDark` method can be used without the `defaultError` scheme modifier as well, but then the 
  dark error color also change with the other computed dark scheme colors when using the "Compute dark theme" feature 
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
    navigation bar does not get color scheme and theme mode appropriate system navigation bar style in Android as we 
    change the color scheme and theme mode. This is done with an `AnnotatedRegion` and the new helper
    method `FlexColorScheme.themedSystemNavigationBar`.
* Documentation updates and typo corrections.

## [1.0.0] - December 21, 2020

* Version 1.0.0 released
* Documentation layout updates and typo corrections. 
  
## [1.0.0-dev.2] - December 21, 2020

* Made planned API name changes, SchemeOnColors -> FlexSchemeOnColors and 
  SchemeSurfaceColors -> FlexSchemeSurfaceColors. These are lower level APIs that are 
  only used when making custom on and surface colors.
  Changed ThemeModeOptionButton -> FlexThemeModeOptionButton, this is also a lower
  level API that can be used when making more advanced custom theme selection 
  control that are based on the same button as the FlexThemeModeSwitch uses.     
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

# Planned Updates and New Features

These are the topics I currently have on the TODO list for this package. Have a new suggestion and idea? 
Feel free to open a [suggestion or issue](https://github.com/rydmike/flex_color_scheme/issues) in the repo. 

### TODO

- Version 2.2.0 Release even more color schemes. Making schemes is fun, documenting the changes a bit less so.
  
- WIP: (add test) ThemeData.accentColor is deprecated starting in v2.3.0-0.1.pre. When that lands in stable channel
  an update is needed to remove the usage of accentColor as a way to set the InputDecorator color to
  default to colorScheme.primary in both dark and light theme mode. 

  Based on a quick look at the modified code
  in the SDK to support the removal of ThemeData.accentColor, it seems like the new default for
  dak theme mode is also now the primary color. In the past it was using the accentColor as default 
  color for input decorators in dark theme mode. This was not inline with newer Material Design.
  FlexColorScheme currently corrects this by modifying the ThemeData.accentColor to be same as
  colorScheme.primary. This worked since the only widget in FlexColorScheme based ThemeData that
  used the ThemeData.accentColor was the InputDecorator, all other widgets that required the
  accentColor already uses colorScheme.secondary. It looks like the fixe for FlexColorScheme when
  it lands in stable will just be to deprecate its usage of accentColor but default behavior should 
  still remain unchanged from current defaults.
  
- Elevated surfaces for

- To dark scheme add a swap primary/secondary flag.

- Add a use actual Material color shades for the light/dark mode, when a Material color
  is selected. Make this new default and keep old around as option.
  
- Find the color algo google uses on it Material colors site here
  https://material.io/design/color/the-color-system.html#tools-for-picking-colors
  and here
  https://material.io/resources/color/#!/?view.left=0&view.right=0&primary.color=582aed&secondary.color=00B0FF
  
Starting points for the algo:
https://stackoverflow.com/questions/32942503/material-design-color-palette
https://github.com/Hammwerk/material-color-palette

Interesting and simpler Ant design: https://2x.ant.design/docs/spec/colors

Tools: https://onextrapixel.com/best-tools-generate-color-palettes/



### COMPLETED
- Version 2.0.0 Release official null-safe version, when nullsafety is available in Flutter stable channel.
- Version 2.0.0-nullsafety.2: Minor new APIs and features added. Example 5 updated.
- This [#71184](https://github.com/flutter/flutter/pull/71184) landed in Flutter 2.0.0. The past custom "white" 
  AppBarTheme implementation was as planned changed to the new one that is supported by the SDK.  
- Version 2.0.0-nullsafety.1 released
- Version 1.4.1 Added automated build and publish pipes for the Web examples!
- Version 1.4.1 More tests, tests are now considered sufficient for current features. 
- Version 1.4.0: Increased unit and widget test to 689 tests. All color definitions are now also tested to ensure
  they will not be changed by any accidental edit. Test coverage is higher than 95%, certainly sufficient for this
  type of package, but there are still some areas that could and will be improved.
- Version 1.3.0: Added 195 unit and widgets tests, mostly unit tests.
- API to assist with themed annotated region for system navigation bar theming.
- API to opt-out from one-toned AppBar and return it to Android's default two-toned.
- Add API that allows us to use an additional extra color definition for ThemeData.accentColor to easily make themes
  with custom input border color in dark-mode.
- Add API the can create the dark scheme based on a light scheme's colors.
- Release version 1.0.0 on pub.dev.
- Review and correct documentation mistakes and typos, first pass anyway.
- Review and update the API.
- Publish live Web versions of the five examples.
- Complete the documentation.
- Release first version 1.0.0-dev.1 publicly on GitHub and pub.dev.

### MAYBE
- **Companion Web App**  
  I started playing with a small companion app that will allow you to design `FlexColorSchemes` and copy-paste the 
  needed setup code into an app. If/when I finnish it, I will release it as live version with open source code as well.

- **Branded surface customization**
  Add API offering more flexibility and customization capabilities to the surface branding.

- **Serialization of FlexColorScheme**  
  Including built-in serialization of FlexColorScheme, and its key classes has been suggested. I consider
  `FlexColorScheme` to be functionally on a level similar to `ColorScheme`, and therefore it should not cover 
  serialization of itself. Serialization have to deal with a lot of potential failure points that I think should
  not have to be a concern in this type of component. I am not planning to add it, not yet at least, I might
  reconsider this later.
  
  My recommendation for saving the state of a `FlexColorScheme` is to include values for its settings that you 
  use in your implementation in other models in your application, like an "AppSettings" model or similar. 
  You probably serialize and store such data already, perhaps with shared preferences, hive, get_storage or 
  some other solution. Include the values you need for your `FlexColorScheme` implementation in your stored settings
  and then use those values to restore your `FlexColorScheme` configuration and theme. This way, your implementation
  also remain in control of what it needs to store and restore.  