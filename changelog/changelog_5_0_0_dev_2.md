### Archived changelog entry

> The Dart package site [pub.dev](https://pub.dev/) restricts the size of the main [CHANGELOG.md](https://github.com/rydmike/flex_color_scheme/blob/master/CHANGELOG.md) file size to maximum 128kB. To work around this limitation, older change entries have been moved into individual files linked from the main changelog.

## 5.0.0-dev.2

**April 4, 2022**

**BREAKING**

* Completed in version 4.0.0 for version 5.0.0 planned removal of
  deprecated property `surfaceStyle`, including all its implementing classes,
  enums and helpers:
    - Removed property: `surfaceStyle` in `FlexColorScheme.light`.
    - Removed property: `surfaceStyle` in `FlexColorScheme.dark`.
    - Removed: enum `FlexSurface`, that `surfaceStyle` where.
    - Removed: factory `FlexSchemeSurfaceColors.from` that was used to create
      surface using the `FlexSurface`. The factory `FlexSchemeSurfaceColors.blend`
      replaced in version 4.0.0 already when using `surfaceMode` and `blendLevel`.
    - Removed tests and modified tests needing to consider above removals.

* Deprecated property `useSubThemes`. This property has no function after
  4.2.0 stable and 5.0.0-dev.1. FlexColorScheme opinionated component sub-themes
  are now created by adding a default constructor `FlexSubThemesData()` or one with
  some custom property values set, to `subThemesData`. This creates sub-themes
  using the FlexColorScheme opinionated sub-themes. Removing this property makes the
  API more consistent. It now follows the same design that is used for `keyColors`
  with `FlexKeyColors` and `tones` with `FlexTones`.
  Setting the property `useSubThemes` will not cause an error, it just has no effect.
  You can safely remove it. The property `useSubThemes` will be removed in release 6.0.0.

* The property `navigationBarIsStyled` in `FlexSubThemesData` was removed in
  **v5.0.0-dev.1** as no longer needed. It is now kind of back with a new broader
  replacement called `FlexSubThemesData.useFlutterDefaults`.
  The in dev.1 version tested API-style to
  set various `SchemeColor` properties to null, to get SDK default for them was not
  nice. The `FlexSubThemesData` should default to its own preferred
  and recommended harmonized defaults when not defined. It is better to offer a
  toggle that can be set, to when possible/offer an opt-out from some bigger style
  differences from SDK defaults. This can be useful if one wants to create
  custom component themes and wish to start from less opinionated ones.
  The new `useFlutterDefaults` is false by default, and the sub-themes undefined
  null values result in its own harmonized and recommended settings. By setting
  it to `true` a bit messier and un-harmonized Flutter default are back. Currently,
  this impacts different styles and colors on `BottomNavigationBar`, `NavigationBar`,
  and `NavigationRail`. See API docs for details regarding
  defaults with this flag on and off.

* The `FlexSubThemesData` property `popupMenuRadius` and the radius in
  corresponding static sub-theme helper `FlexSubThemes.popupMenuTheme`,
  now defaults to 4.
  In versions before v5.0.0-dev.2 it defaulted to 10. The M3 spec for it
  was not available when it was chosen originally. It was assumed to have
  higher border radius like rest of designs. However, the spec has it
  defined [here](https://m3.material.io/components/menus/specs) now, and it
  is 4. Since border radius default values are stated in FlexColorScheme
  sub-theme design goals to follow the M3 design specs, it was updated to
  match the spec. A bit higher rounding, may actually fit better with
  the very round M3 design, try 8 or 10. It is very simple to change bach with
  the API.

**FIX**

* Pub.dev analysis does not like document references to deprecated Flutter
  properties. Changed the **primaryVariant** and **secondaryVariant** references
  in document comments to `primaryVariant` and `secondaryVariant`. Nor does it
  like when you use tests to deprecated Flutter SDK members, removed them too,
  they were not needed either after some redesign of a few tests.

* Fixed. When using sub-themes and selecting a `ColorScheme` based color, as
  color for the `AppBar`, instead of using `abbBarStyle` in light and dark
  factories, the `appBarOpacity` was not applied to the selected color. The
  priority of effective `AppBar` color was also revised to follow the norm,
  which from lowest to highest is:
    - `appBarStyle` in light/dark factories and ThemeData extensions, which
      selects the used color from active `scheme` or `colors`, in the same
      factories or extensions.
    - `appBarBackgroundSchemeColor` in `FlexSubThemesData` when used.
    - `appBarBackground` in FlexColorScheme.

**CHANGE**

* Changed the priority in FlexColorScheme when using direct input color
  properties, `colorScheme` input and using key color seeded ColorScheme
  generation. The new order is that input `colorScheme` is in this rare use case
  always overridden by the seed generate `ColorScheme`. This allows us
  to use a `colorScheme` as input to seed generation, where this color
  scheme could already have been externally seeded generated, but that we want
  to modify by using custom FlexTones or surface blends in FlexColorScheme.
  The direct properties overrides the seeded color scheme as before, unless it
  is `primary`, `secondary`, `tertiary` or their container colors. In that case
  the `keyColors`, "keep" property determines if those colors are kept or not.

* The `FlexSubThemesData` property `inputDecorationRadius` was deprecated and
  renamed to `inputDecoratorRadius`, to harmonize the other
  `InputDecoration` property names in `FlexSubThemesData`.
  The old name will be removed in release 6.0.0.

* Deprecated and renamed `navigationBarHighlightSchemeColor` to
  `navigationBarIndicatorSchemeColor` in `FlexSubThemesData`, to
  harmonize the naming standard. Likewise, the parameter `highlightSchemeColor`
  ìn `FlexSubThemes.navigationBarTheme` was deprecated and replaced by
  `indicatorSchemeColor`. The old names will be removed in release 6.0.0.

* In 5.0.0-dev.1, the renamed properties were deprecated and broken with 4.2.0.
  They are still deprecated, but now fallback via the old properties. They
  are no longer breaking. This concerns `FlexSubThemesData` properties:
    - `bottomNavigationBarSchemeColor` -> `bottomNavigationBarSelectedLabelSchemeColor`
    - `navigationBarTextSchemeColor` -> `navigationBarSelectedLabelSchemeColor`
    - `navigationBarMutedUnselectedText` -> `navigationBarMutedUnselectedLabel`
    - `navigationBarIconSchemeColor` -> `navigationBarSelectedIconSchemeColor`

  And `FlexSubThemes.navigationBarTheme` properties:
    - `textSchemeColor` -> `selectedLabelSchemeColor`
    - `unselectedTextSchemeColor` -> `unselectedLabelSchemeColor`
    - `iconSchemeColor` -> `selectedIconSchemeColor`
    -  `mutedUnselectedText` -> `mutedUnselectedLabel`

  And `FlexSubThemes.bottomNavigationBarTheme` properties:
    - `baseSchemeColor ` -> `selectedLabelSchemeColor`

  The old property names will be removed in release 6.0.0.

**NEW**

* Added `SchemeColor` based theming of `SnackBar` background color via
  `snackBarBackgroundSchemeColor` in `FlexSubThemesData` and support for it
  in `FlexSubThemes`.

* Changed the color values for `FlexColor.materialLightSecondaryContainer` and
  `FlexColor.materialLightSecondaryContainerHc`. These color properties
  do not have any specification in Material 2 spec. Updated the colors values
  that had been made up for **dev.1** release to better match the design intent
  of those colors for the new Material 3 `ColorScheme`.

* Added `inputDecoratorUnfocusedBorderIsColored` to `FlexSubThemesData` and
  support for it in `FlexSubThemes` via `unfocusedBorderIsColored`. Previously
  an unfocused or hovered border/underline always had a hint of selected
  base color. Setting this to false, leaves it at the grey defaults used by
  Flutter defaults.

* Added `navigationBarIndicatorOpacity` and `navigationRailIndicatorOpacity`
  to `FlexSubThemesData`, to expose their already existing properties in
  corresponding sub-themes used by `FlexColorScheme`.

**EXAMPLES**

* *Themes Playground:*
    - Added a new single panel "Page" view. The previous large masonry grid view
      is still available. Both views can be used and switch to based on what
      is appropriate when using different media sizes.
    - The switches to keep main input colors for primary, secondary, tertiary
      and their containers, where separated so that their state and code
      generation for light and dark theme mode are separate. This makes them
      more useful for actual theme setup. Earlier you had to separate them by
      editing the generated code.
    - Added display of SnackBar style to the Themed Material panel.
    - Added display of more ListTile types.
    - Added ColorScheme based color selection theming of SnackBar background color.
    - Added CodeView as a panel of its own. It is now possible to view the
      changes to generated code as settings are changed. In the
      advanced view where one can keep it open and close other panels, except one
      being operated in. In page view it is shown as last page, however if
      the media is large enough, it is shown side-by-side with controls on current
      page. This is a really handy view for studying what each control does in
      the generated code.
    - Added missing code gen for button border radius.
    - Fixed broken code gen for dark mode blend level.
    - Decoupled all bundled theming controls in the app.
    - Added individual override controls for border radius to all components.
    - Added option to swap or not swap computed dark mode main and container color.
    - Added indicator opacity controls to NavigationBar and NavigationRail.
    - Reduced amount of pre-set  defaults in the app, so it starts with simpler setup code.
    - Changed the code gen style for dark mode when using from light mode computed dark theme.
    - Changed the code gen, so it does not add any code when using API default values.
    - Changed the ThemeService to use generic types.

**TESTS**

* Finalized test updates. Now 1684 tests, coverage about 99.8%.
