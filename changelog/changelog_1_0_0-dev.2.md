### Archived changelog entry

> The Dart package site [pub.dev](https://pub.dev/) restricts the size of the main [CHANGELOG.md](https://github.com/rydmike/flex_color_scheme/blob/master/CHANGELOG.md) file size to maximum 128kB. To work around this limitation, older change entries have been moved into individual files linked from the main changelog.

## 1.0.0-dev.2

**December 21, 2020**

**BREAKING**

* Made planned API name changes, SchemeOnColors -> FlexSchemeOnColors and
  SchemeSurfaceColors -> FlexSchemeSurfaceColors. These are lower level APIs that are
  only used when making custom on and surface colors.
  Changed ThemeModeOptionButton -> FlexThemeModeOptionButton, this is a lower
  level API that can be used when making more advanced custom theme selection
  controls that are based on the same button that the `FlexThemeModeSwitch` uses.
* Removed the constants that had no function in the public interface from the API.

**NEW**
* Exposed planned configuration APIs for FlexThemeModeSwitch and FlexThemeModeOptionButton.

**CHANGE**

* Removed legacy usage of deprecated ThemeData properties textSelectionColor, cursorColor
  and textSelectionHandleColor. They are no longer needed even for the stable channel, they were
  useful earlier but not anymore, using only TextSelectionThemeData is
  enough in the latest stable version.

**DOCS**

* Documentation updates and corrections.
