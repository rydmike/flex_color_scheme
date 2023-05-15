### Archived changelog entry

> The Dart package site [pub.dev](https://pub.dev/) restricts the size of the main [CHANGELOG.md](https://github.com/rydmike/flex_color_scheme/blob/master/CHANGELOG.md) file size to maximum 128kB. To work around this limitation, older change entries have been moved into individual files linked from the main changelog.

## 3.0.0

**June 25, 2021**

**BREAKING**

* The color `accentColor` is being deprecated in Flutter SDK `ThemeData` starting
  from version v2.3.0-0.1.pre. For more info see
  [Flutter docs here.](https://flutter.dev/docs/release/breaking-changes/theme-data-accent-properties)

  Usage of `accentColor` in **FlexColorScheme** is removed to support this
  transition. The property is deprecated in FlexColorScheme, but it is still present. Its
  usage does however no longer have any impact on produced themes.
  This is a potential breaking change.
  The probability that you might have used it as a property in your
  FlexColorScheme based theme is low. It was before set to primary color
  in FlexColorScheme, as a way to make the highlight color of outlines and underlines on
  text field boxes primary colored in dark theme mode. In default Flutter dark theme they
  used accentColor that followed `colorScheme.secondary` color. The old `accentColor` was
  previously not used for anything else in themes anymore when using FlexColorScheme.
  The property is now going away totally in Flutter SDK.
  The default ThemeData in Flutter SDK in dark mode now creates a
  theme for outline and underline indicators on input fields that are based on primary color,
  just like **FlexColorScheme** always did. The resulting default dark mode style on text
  fields thus remains unchanged in FlexColorScheme even with this definition removed.

  If you had used `accentColor` in FlexColorScheme as an unusual way to define a different
  text field outline or underline color in dark mode than primary color. In that case
  you will need to recreate this style via a text field decoration theme.


**NEW**

* The `FlexColorScheme.dark` and `FlexColorScheme.light` factories have a new
  property called `swapColors`. If true, this will swap `primary` and `primaryVariant`
  colors with their secondary counter-parts.

  This flag can be set to true if you want to make a theme where your primary and secondary
  colors are swapped compared to their definition. It is useful if you want to quickly
  swap primary and secondary colors when using the pre-defined color
  schemes or with computed dark schemes from light schemes. It doubles the
  variation possibilities of themes based on the pre-defined color schemes.

  If you are explicitly defining all you light or dark scheme colors, you can of course define
  them in desired order. This feature will still swap whatever
  colors you defined for primary and secondary when set to true. You can thus also
  use this feature as an easy end-user modifiable theme option, if you like
  to offer the capability to toggle the primary and secondary theme colors the
  other way around.


* The static function `FlexSchemeColor.effective(FlexSchemeColor colors,
  int usedColors, {bool swapColors = false})` is used to implement the above
  `swapColors` feature. It also exposes the logic behind the FlexColorScheme
  dark and light theme `usedColors` property. This static method is helpful if
  you need to compute effective built-in theme colors externally to FlexColorScheme
  to present the active theme, based on these settings. This is used by example 5
  to change the colors on the theme mode switch when the swap color settings
  is toggled. The `usedColors` property is not shown in any bundled
  example, but it can be used the same way.


* **New color schemes:** Added four new built-in color schemes.
    * **Bahama and trinidad** - Bahama blue and trinidad orange colored theme.
      Use enum value `FlexScheme.bahamaBlue` for easy access to it.
    * **Mallard and valencia** - Mallard green and Valencia pink colored theme.
      Use enum value `FlexScheme.mallardGreen` for easy access to it.
    * **Espresso and crema** - Espresso dark brown and crema colored theme.
      Use enum value `FlexScheme.espresso` for easy access to it.
    * **Outer space stage** - Outer space dark blue-grey and stage red theme.
      Use enum value `FlexScheme.outerSpace` for easy access to it.

**TESTS**

* Added tests for the new features and removed test related to
  `accentColor`. Total 736 tests, coverage 99.75%.

**OTHER**

* Inspired by **MaterialYou** at GoogleIO 2021, I recently hooked up **FlexColorScheme**
  with a Google Dart library that extracts prominent colors from images. Then fed these
  colors to FlexColorScheme to make themes from them. The above new color schemes in
  release 3.0.0 came from these image based theme experiments. You can see examples
  of **FlexColorScheme** making color schemes and themes from images in my Tweets about it.
  This was a first [quick test](https://twitter.com/RydMike/status/1399139552200114179?s=20)
  of the idea, later I added some more features to it, [here](https://twitter.com/RydMike/status/1399301081939820545?s=20) and [here](https://twitter.com/RydMike/status/1399933068614504451?s=20). These
  quick tests show that FlexColorScheme is very versatile. It already supports
  Android 12 like image color branded themes, by wiring extracted image
  colors, to colors in a FlexColorScheme based theme.
