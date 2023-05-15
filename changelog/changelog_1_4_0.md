### Archived changelog entry

> The Dart package site [pub.dev](https://pub.dev/) restricts the size of the main [CHANGELOG.md](https://github.com/rydmike/flex_color_scheme/blob/master/CHANGELOG.md) file size to maximum 128kB. To work around this limitation, older change entries have been moved into individual files linked from the main changelog.

## 1.4.0

**January 18, 2021**

**NEW**

* Added convenience property `scheme` to FlexColorScheme factories light and dark. This a shortcut for
  using the built-in color schemes. The `colors` property can still be used as before. The `.light` and
  `.dark` factories no longer have any required properties. If `scheme` is not provided it defaults
  to `FlexScheme.material` and if both `scheme` and `colors` are provided, the scheme provided via `colors` prevail.
* Added experimental support for transparent system navigation bar for Android for SDK >= 30 (Android 11).
  The support is added via new `opacity` property in `FlexColorScheme.themedSystemNavigationBar`.

**EXAMPLES**

* Updated the simple example 1 to use the new `scheme` property, as in
  `theme: FlexColorScheme.light(scheme: FlexScheme.mandyRed).toTheme`.

* Added a separate example that builds
  on example 5, shows and explains how and when transparent system navigation bar can be used in Android. It also shows
  how to make it look nice when using primary color branded background color applied to the system
  navigation bar in Android, that is used when transparency is not supported. While if supported, your app otherwise
  uses a transparent system navigation. Please see this separate small stand-alone example Android project
  [**sysnavbar** on GitHub](https://github.com/rydmike/sysnavbar) for more information.

**TESTS**
* Added more tests, now 689 tests. All color values used are now also tested, any modification to them is considered
  a breaking change. A bit more tests would still be nice, for the ThemeModeSwitch Widget at least.
  Total test coverage > 98%, it will do for now.

**DOCS**

* Changed example one and the intro, to use the new simpler `scheme` property when using built-in schemes.
* Added a section that lists which sub-themes, and which of their properties, are NOT null when creating a theme data
  object with FlexColorScheme.toTheme.
* Removed the "back to content" link after each chapter. It was nice and worked fine on GitHub, but for some reason
  it did not on pub.dev.
* Tried finding and adding comments for the 3 missing API comments needed to reach 100% API
