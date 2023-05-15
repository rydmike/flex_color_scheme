### Archived changelog entry

> The Dart package site [pub.dev](https://pub.dev/) restricts the size of the main [CHANGELOG.md](https://github.com/rydmike/flex_color_scheme/blob/master/CHANGELOG.md) file size to maximum 128kB. To work around this limitation, older changelogs and dev release changelogs have been moved into individual files linked from the main changelog.

## 7.1.0-dev.1

**Apr 24, 2023**

This beta-1 of FlexColorScheme v7.1.0. It is a dev release using Flutter 3.10 beta channel. It requires Flutter version 3.10.0-1.3.pre or later. This beta version is a first preparation version of FlexColorScheme for the next stable Flutter release after version 3.7.x.

**NEW**

* Added `datePickerTheme` to `FlexSubThemes`.
* Added properties `datePickerDialogRadius` and `datePickerHeaderBackgroundSchemeColor`  to `FlexSubThemesData`.

**THEMES PLAYGROUND**

* **NEW**
    - Added selection of themed header color scheme color for the DatePickerDialog on the Dialogs panel.
    - Added showing SearchBar with SearchView to the AppBar panel.
    - Added showing SearchBar with SearchView to the Widget Showcase.

* **UPDATE**
    - Reviewed and updated status of all known theming issues in info expands.

* **SKIA**
    - The SKIA **canvaskit** renderer is again being used to build all the web examples, including the Themes Playground.
    - The beta-1 version of Themes Playground 7.1 for FCS 7.1 can be tested [here](https://rydmike.com/flexcolorscheme/themesplayground-v7-1).