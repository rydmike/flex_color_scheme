### Archived changelog entry

> The Dart package site [pub.dev](https://pub.dev/) restricts the size of the main [CHANGELOG.md](https://github.com/rydmike/flex_color_scheme/blob/master/CHANGELOG.md) file size to maximum 128kB. To work around this limitation, older change entries have been moved into individual files linked from the main changelog.

## 3.0.1

**July 1, 2021**

**FIX**

* The internal order of swapping primary and secondary colors and reducing
  used colors in static function `FlexSchemeColor.effective(FlexSchemeColor colors,
  int usedColors, {bool swapColors = false})` matters for the intended result when
  used together in the same call. The function now swaps primary and secondary colors,
  before reducing the used colors.

* Documentation and typo fixes.

**Tests**
* Added tests for the above fix. The test captures the issue and fails
  in version 3.0.0. Total 741 tests, coverage 99.75%.
