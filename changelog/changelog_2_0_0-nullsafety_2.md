### Archived changelog entry

> The Dart package site [pub.dev](https://pub.dev/) restricts the size of the main [CHANGELOG.md](https://github.com/rydmike/flex_color_scheme/blob/master/CHANGELOG.md) file size to maximum 128kB. To work around this limitation, older change entries have been moved into individual files linked from the main changelog.

## 2.0.0-nullsafety.2

**March 15, 2021**

**BREAKING**

* Minor change to the none default `tooltipsMatchBackground: true` border style, it now uses
  the theme divider color as its default outline color.
* As stated earlier in the documentation, as a planned change for version 2.0.0, the sub theme for
  `FloatingActionButtonThemeData` was removed. It is thus now null, just as in a default Flutter ThemeData.
  It still produces the same theme as before, the ThemeData definition was just no longer needed to do so.

**NEW**

* The static helper `FlexColorScheme.themedSystemNavigationBar` received three new properties
  `noAppBar`, `invertStatusIcons` and `systemNavigationBarDividerColor`. The old property
  `nullContextBackground` was deprecated and replaced with `systemNavigationBarColor`. Example 5
  has been updated to show how and when these new features can be used.

**CHANGE**
* AppBar theming to use the implementation introduced in Flutter 2.0.0 instead of using
  its own custom implementation for the "white" app bar theme.

**TESTS**

* Number of tests increased from 639 to 661. Coverage 99.78%.

**DOCS**

* Added thumbnails to **Appendix A**. This pub.dev version is also to test the
  thumbnails work and how they look on pub.dev before stable 2.0.0 release.
