### Archived changelog entry

> The Dart package site [pub.dev](https://pub.dev/) restricts the size of the main [CHANGELOG.md](https://github.com/rydmike/flex_color_scheme/blob/master/CHANGELOG.md) file size to maximum 128kB. To work around this limitation, older change entries have been moved into individual files linked from the main changelog.

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
