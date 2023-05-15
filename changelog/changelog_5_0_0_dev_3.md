### Archived changelog entry

> The Dart package site [pub.dev](https://pub.dev/) restricts the size of the main [CHANGELOG.md](https://github.com/rydmike/flex_color_scheme/blob/master/CHANGELOG.md) file size to maximum 128kB. To work around this limitation, older change entries have been moved into individual files linked from the main changelog.

## 5.0.0-dev.3

**April 20, 2022**

**STYLE CHANGE - BREAKING**

* The custom "internal" and temporary `m3TextTheme` was changed.
  It is **style breaking** with 4.2.0 and 5.0.0-dev.1 & 2.
  It breaks past used style when opting in on component themes and its optional
  custom `m3TextTheme` enabled. The updated custom implementation of it now follows the
  implementation used in Flutter master channel, apart from this
  [issue](https://github.com/flutter/flutter/issues/102121),
  where it for now implements the value used in the M3 Web guide.
  The changes in styles otherwise concern the addition of the font geometry, height, which the
  previous custom implementation did not have. The usage of the custom `m3TextTheme` should be
  considered internal and temporary, it will be changed to use the actual Flutter implementation
  once [PR #97829](https://github.com/flutter/flutter/pull/97829) lands in Flutter stable
  channel. The custom `m3TextTheme` will then be deprecated.

* The computed colors for `ThemeData` colors `primaryColorLight`, `primaryColorDark` and
  `secondaryHeaderColor` were changed.
  It is **style breaking** with 4.2.0 and 5.0.0-dev.1 & 2. The change breaks past
  used styles on these rarely used colors. These `ThemeData` colors are also on
  a deprecation path and will likely receive some new none `MaterialColor` dependent
  color defaults when that change happens. The new `ColorScheme.primary` computed
  colors for these rarely used colors are better balanced than before, and work well
  regardless of used `ColorScheme.primary` shade and tint.

* The color definition value for `FlexColor.espressoLightPrimary` color was changed.
  This is **style breaking** with 4.2.0 and 5.0.0-dev.1 & 2. The new color for
  `FlexColor.espressoLightPrimary` breaks past used color for this color constant.
  The color was changed from `0xFF220804` to `0xFF452F2B`. Past color was too dark brown, almost
  black to be very usable in a UI. It was very black coffee like, but not very practical in a UI,
  it was too close to black. Since version 5 is anyway a major style breaking with the introduction
  of the new Material 3 ColorScheme, the opportunity to improve this color value used in the
  built-in theme `espresso` theme was used.

**CHANGE**

* The package documentation has now moved too its own site at
  [docs.flexcolorscheme.com](https://docs.flexcolorscheme.com).
  It is a major update and rewrite of previous documentation. It also contains general
  Flutter theming guidance.

**FIX**

* The examples contain minor improvements and fixes.
