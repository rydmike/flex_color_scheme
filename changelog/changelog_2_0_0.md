### Archived changelog entry

> The Dart package site [pub.dev](https://pub.dev/) restricts the size of the main [CHANGELOG.md](https://github.com/rydmike/flex_color_scheme/blob/master/CHANGELOG.md) file size to maximum 128kB. To work around this limitation, older change entries have been moved into individual files linked from the main changelog.

## 2.0.0

**March 15, 2021**

## Overview

First stable release of FlexColorScheme with sound null safety.
Includes the changes from [2.0.0-nullsafety.1] and [2.0.0-nullsafety.2].

**BREAKING**

* The by default enabled divider for `FlexColorScheme.themedSystemNavigationBar` has been
  revised to be disabled by default. To use a divider on the top of the system navigation bar on
  Android, you have to enabled it manually. This is more in line with expected default behavior.
