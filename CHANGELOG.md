# Changelog

All notable changes to the **FlexColorScheme** package will be documented in this file.

## [1.0.0] - December 21, 2020

* Version 1.0.0 released
* Documentation layout updates and typo corrections. 
  
## [1.0.0-dev.2] - December 21, 2020

* Made planned API name changes, SchemeOnColors -> FlexSchemeOnColors and 
  SchemeSurfaceColors -> FlexSchemeSurfaceColors. These are lower level APIs that are 
  only used when making custom on and surface colors.
  Changed ThemeModeOptionButton -> FlexThemeModeOptionButton, this is also a lower
  level API that can be used when making more advanced custom theme selection 
  control that are based on the same button as the FlexThemeModeSwitch uses.     
* Exposed planned configuration APIs for the FlexThemeModeSwitch and FlexThemeModeOptionButton.
* Removed the constants that had no function in the public interface from the API.
* Documentation updates and corrections.
* Removed legacy usage of deprecated ThemeData properties textSelectionColor, cursorColor
  and textSelectionHandleColor. They are no longer needed even for stable channel, they were
  useful earlier but not anymore, using only TextSelectionThemeData is 
  enough in the latest stable version.     

## [1.0.0-dev.1] - December 17, 2020

* First development pre-release on pub.dev.

---

## To do list and planned feature updates

- [x] Release first version 1.0.0-dev.1 publicly on GitHub and pub.dev.
- [x] Complete the documentation.
- [x] Publish live Web versions of the five examples.
- [x] Review and update the API.
- [x] Review and correct documentation mistakes and typos, first pass anyway.
- [x] Release version 1.0.0 on pub.dev.
- [ ] Add an API the can create the dark scheme based on the light primary color.
- [ ] Change the current "white" AppBarTheme implementation to new AppBarTheme when it lands in stable. See https://github.com/flutter/flutter/pull/71184 and https://github.com/flutter/flutter/issues/72206.
- [ ] Version 1.0.x: Add tests.
- [ ] Version 2.0.0-nullsafety.1: Add null safe version.