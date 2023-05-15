### Archived changelog entry

> The Dart package site [pub.dev](https://pub.dev/) restricts the size of the main [CHANGELOG.md](https://github.com/rydmike/flex_color_scheme/blob/master/CHANGELOG.md) file size to maximum 128kB. To work around this limitation, older change entries have been moved into individual files linked from the main changelog.

### 1.4.1

**January 31, 2021**

**NEW**

* **New color schemes:** Added four new built-in color schemes.
    * **Barossa** - Barossa red and cardin green theme.
      Use enum value `FlexScheme.barossa` for easy access to it.
    * **Shark and orange** - Shark grey and orange ecstasy theme.
      Use enum value `FlexScheme.shark` for easy access to it.
    * **Big stone tulip** - Big stone blue and tulip tree yellow theme.
      Use enum value `FlexScheme.bigStone` for easy access to it.
    * **Damask and lunar** - Damask red and lunar green theme.
      Use enum value `FlexScheme.damask` for easy access to it.

* Semantics for the ThemeMode Widget buttons.

**TESTS**

* FlexThemeModeSwitch widget tests, makes and checks for system mode changes.
* More tests, totally 723 tests, codecov is now > 99.5%.
* **CI/CD:** Added GitHub actions to automate build and to publish the examples on the Web on a new release.

**EXAMPLES**

* Minor changes to the examples. Modified to not need the `late` keyword when they are converted
  to null safe versions.

**DOCS**

* Added the new color schemes to the documentation.
* Minor typo corrections.
