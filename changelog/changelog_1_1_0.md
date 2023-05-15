### Archived changelog entry

> The Dart package site [pub.dev](https://pub.dev/) restricts the size of the main [CHANGELOG.md](https://github.com/rydmike/flex_color_scheme/blob/master/CHANGELOG.md) file size to maximum 128kB. To work around this limitation, older change entries have been moved into individual files linked from the main changelog.

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

