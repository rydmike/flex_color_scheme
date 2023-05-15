### Archived changelog entry

> The Dart package site [pub.dev](https://pub.dev/) restricts the size of the main [CHANGELOG.md](https://github.com/rydmike/flex_color_scheme/blob/master/CHANGELOG.md) file size to maximum 128kB. To work around this limitation, older change entries have been moved into individual files linked from the main changelog.

## 2.1.0

**March 22, 2021**

**FIX**

* Toggling `FlexColorScheme(transparentStatusBar)` from true to false, did not restore the
  Android default status bar scrim, unless the app was completely rebuilt. This has been fixed.

* When using `FlexColorScheme.themedSystemNavigationBar(useDivider)` in an `AnnotatedRegion`, toggling
  `useDivider` from true to false, did not remove the system navigation bar divider again, unless the
  app was completely rebuilt. This has been fixed, see API docs for more info.

**NEW**

* The `FlexColorScheme.themedSystemNavigationBar` for styling the system navigation bar got a
  new convenience property `systemNavBarStyle` that takes a `FlexSystemNavBarStyle` enum with values:
    * `system` for default white system nav bar in light theme and black in dark theme mode.
    * `surface` the system navigation bar will be the same color as active theme `colorScheme.surface` color.
      If your FlexColorScheme definition is set to use primary branded surface and background colors, the
      same primary color blend that the surface color has received will be used.
    * `background` the system navigation bar will be the same color as active theme `colorScheme.background` color.
      If your FlexColorScheme definition is set to use primary branded surface and background colors, the
      same primary color blend that the background color has received will be used.
    * `scaffoldBackground` the system navigation bar will be the same color as active theme `scaffoldBackground` color.
      If your FlexColorScheme definition is set to use primary branded surface and background colors, the
      same primary color blend that the scaffoldBackground color has received will be used.
    * `transparent` an experimental feature. The goal is to make the system navigation bar fully transparent,
      showing the background, while navigation buttons float over the background. This feature only works if it is
      also configured in the Android embedder and on SDK 30 or higher.
      More information in this example: https://github.com/rydmike/sysnavbar

**EXAMPLES**

* Added status bar scrim, system navigation bar divider,
  and navigation bar style toggles to example 5.
  These only work on Android builds and do not have any functionality on the live Web builds.

**TESTS**

* Added tests for the new features. Total 690 tests, coverage 99.75%.
