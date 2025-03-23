import 'dart:ui';

import 'package:flutter/material.dart' show ColorScheme; // For comment refs.

import 'flex_color.dart' show FlexColor;
import 'flex_color_scheme.dart';
import 'flex_scheme_color.dart' show FlexSchemeColor;
import 'flex_scheme_data.dart' show FlexSchemeData;

/// Enum that can be used to lookup predefined [FlexSchemeData] color theme
/// definition objects.
///
/// Contains 52 ready to use built-in matched light and dark color schemes.
enum FlexScheme {
  /// The example theme used in the Material Design guide.
  ///
  /// Light scheme version, in Flutter SDK known as [ColorScheme.light].
  /// https://material.io/design/color/the-color-system.html#color-usage-and-palettes
  ///
  /// Dark scheme version, in Flutter SDK known as [ColorScheme.dark].
  /// https://material.io/design/color/dark-theme.html#ui-application
  material,

  /// Material high contrast theme.
  ///
  /// Same as Flutter
  /// [ColorScheme.highContrastLight] and [ColorScheme.highContrastDark].
  materialHc,

  /// Material blue and Material light blue based theme.
  blue,

  /// Material indigo and Material deep purple based theme.
  indigo,

  /// Hippie blue with surfie green and chock pink.
  hippieBlue,

  /// Aqua tropical blue ocean theme.
  aquaBlue,

  /// Blue theme composed of well known blue brand colors.
  brandBlue,

  /// Deep blue dark abyss theme.
  deepBlue,

  /// Pink sakura cherry blossom inspired theme.
  sakura,

  /// Mandy red color and viking blue inspired theme.
  mandyRed,

  /// Material red and Material pink theme.
  red,

  /// Red wine inspired theme.
  redWine,

  /// Purple brown, aubergine and eggplant inspired theme.
  purpleBrown,

  /// Material green forest and Material teal based theme.
  green,

  /// Green money theme, as in "show me the money theme".
  money,

  /// Lush green jungle inspired theme.
  jungle,

  /// Somber Material blue-grey and legal purple and grey theme.
  greyLaw,

  /// Wild willow and wasabi green with orchid purple inspired theme.
  wasabi,

  /// Gold sunset inspired theme.
  gold,

  /// Playful mango mojito theme.
  mango,

  /// Material amber and blue accent based theme.
  amber,

  /// Vesuvius burned orange and eden green based theme.
  vesuviusBurn,

  /// Deep purple, daisy bush theme.
  deepPurple,

  /// Ebony clay deep blue grey and watercourse green theme.
  ebonyClay,

  /// Barossa red and cardin green theme.
  barossa,

  /// Shark grey and orange ecstasy theme.
  shark,

  /// Big stone blue and tulip tree yellow theme.
  bigStone,

  /// Damask red and lunar green theme.
  damask,

  /// Bahama blue and trinidad orange.
  bahamaBlue,

  /// Mallard green and valencia pink.
  mallardGreen,

  /// Espresso and crema theme.
  espresso,

  /// Outer space and red stage theme.
  outerSpace,

  /// Blue whale, jungle green and outrageous tango orange theme.
  blueWhale,

  /// San Juan blue and salmon pink theme.
  sanJuanBlue,

  /// Rosewood red, with horses neck and driftwood theme.
  rosewood,

  /// Blumine blumine blue green color, eastern blue, with saffron mango
  /// and mulled wine theme.
  blumineBlue,

  /// A color scheme based on the Flutter Dash mascot 4k wallpaper shared
  /// by Google before the launch of Flutter 2.10.
  flutterDash,

  /// The Material 3 color scheme baseline for primary, secondary and tertiary
  /// colors, used as an example in in the Material 3 design guide.
  /// https://m3.material.io/styles/color/the-color-system/tokens
  materialBaseline,

  /// A verdun and mineral green with hemlock grey-greens color scheme set
  /// found in an image in the Material 3 design guide
  /// [here](https://m3.material.io/styles/color/dynamic-color/overview).
  verdunHemlock,

  /// A dell, axolotl and genoa greens color scheme set
  /// found in an image in the Material 3 design guide
  /// [here](https://m3.material.io/styles/color/the-color-system/color-roles).
  dellGenoa,

  /// A red based Material-3 colorscheme.
  redM3,

  /// A pink based Material-3 colorscheme.
  pinkM3,

  /// A purple based Material-3 colorscheme.
  purpleM3,

  /// An indigo based Material-3 colorscheme, with old lavender tertiary.
  indigoM3,

  /// A blue based Material-3 colorscheme.
  blueM3,

  /// A cyan based Material-3 colorscheme.
  cyanM3,

  /// A teal based Material-3 colorscheme, with azure blue tertiary.
  tealM3,

  /// A green based Material-3 colorscheme, with william blue-grey tertiary.
  greenM3,

  /// A lime based Material-3 colorscheme.
  limeM3,

  /// A Yukon Gold based Material-3 colorscheme, with mineral green tertiary.
  yellowM3,

  /// An orange based Material-3 colorscheme, with verdigris green tertiary.
  orangeM3,

  /// A deep orange based Material-3 colorscheme.
  deepOrangeM3,

  /// A black and white based colorscheme, with monochrome greys.
  blackWhite,

  /// A monochrome grey scale based colorscheme.
  greys,

  /// Sepia, a warm slight brown yellow tinted neutral theme.
  sepia,

  /// Shadcn blue color inspired theme.
  shadBlue,

  /// Shadcn gray color inspired theme.
  shadGray,

  /// Shadcn green color inspired theme.
  shadGreen,

  /// Shadcn neutral color inspired theme.
  shadNeutral,

  /// Shadcn orange color inspired theme.
  shadOrange,

  /// Shadcn red color inspired theme.
  shadRed,

  /// Shadcn rose color inspired theme.
  shadRose,

  /// Shadcn slate color inspired theme.
  shadSlate,

  /// Shadcn stone color inspired theme.
  shadStone,

  /// Shadcn violet color inspired theme.
  shadViolet,

  /// Shadcn yellow color inspired theme.
  shadYellow,

  /// Shadcn zinc color inspired theme.
  shadZinc,

  /// Placeholder for adding a custom scheme. When this scheme
  /// is selected you should provide a [FlexColorScheme] based on a custom
  /// [FlexSchemeData] object. If not provided, it defaults to the
  /// [FlexScheme.material] theme.
  custom;

  /// Returns the [FlexSchemeData] associated with this enum value.
  ///
  /// Has fallback to [FlexColor.materialBaseline] value, the
  /// Material 3 defaults.
  FlexSchemeData get data {
    return FlexColor.schemes[this] ?? FlexColor.materialBaseline;
  }

  /// Returns the [FlexSchemeColor] associated with this enum value
  /// for the given [brightness] value.
  FlexSchemeColor colors(Brightness brightness) {
    switch (brightness) {
      case Brightness.light:
        return data.light;
      case Brightness.dark:
        return data.dark;
    }
  }
}
