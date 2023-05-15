### Archived changelog entry

> The Dart package site [pub.dev](https://pub.dev/) restricts the size of the main [CHANGELOG.md](https://github.com/rydmike/flex_color_scheme/blob/master/CHANGELOG.md) file size to maximum 128kB. To work around this limitation, older change entries have been moved into individual files linked from the main changelog.

## 2.0.0-nullsafety.1

**February 4, 2021**

### Overview

First dev version with null-safety.

**BREAKING**

* Removed the in version 1.3.0 deprecated `FlexSchemeSurfaceColors.themeSurface`, use
  `FlexSchemeSurfaceColors.surfaceStyle` instead.

**TESTS**

* Number of tests were reduced from 723 to 639, when all null related tests were removed.
