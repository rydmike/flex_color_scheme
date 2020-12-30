import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Extensions on [Color] to brighten, lighten, darken and blend colors and
/// can get a shade for gradients.
///
/// Some of the extensions are rewrites of TinyColor's functions
/// https://pub.dev/packages/tinycolor. The TinyColor algorithms are also
/// been modified to use Flutter's HSLColor class instead of the custom one in
/// the TinyColor lib. The functions from TinyColor reimplemented as Color
/// extensions here are, [brighten], [lighten] and [darken]. They are used
/// for color calculations in FlexColorScheme but also exposed for reuse.
///
/// Another frequently used extension is the one used to [blend] two colors
/// using alpha value. This extension is used to calculate branded surface
/// colors used by FlexColorScheme's branded surfaces and for automatic dark
/// color schemes from a light scheme.
///
/// The [getShadeColor] extension is less frequently used and used used mostly
/// to make shades for gradient AppBars.
///
/// The color extension also include getting a color's RGB hex code as a string
/// in two different formats. Extension [hexCode] returns a Flutter style
/// HEX code string of a Color value, meaning it starts with 0x and alpha value
/// before the RGB Hex values. The plain [hex] extension returns a typical
/// API formatted hex color string starting with # and no alpha value.
extension FlexColorExtensions on Color {
  /// Like TinyColor brighten function, it brightens the color with the
  /// given integer percentage amount.
  Color brighten([int amount = 10]) {
    final Color color = Color.fromARGB(
      alpha,
      math.max(0, math.min(255, red - (255 * -(amount / 100)).round())),
      math.max(0, math.min(255, green - (255 * -(amount / 100)).round())),
      math.max(0, math.min(255, blue - (255 * -(amount / 100)).round())),
    );
    return color;
  }

  /// Lightens the color with the given integer percentage amount.
  /// Defaults to 10%.
  Color lighten([int amount = 10]) {
    // HSLColor returns saturation 1 for black, we want 0 instead to be able
    // lighten black color up along the grey scale from black.
    final HSLColor hsl = this == const Color(0xFF000000)
        ? HSLColor.fromColor(this).withSaturation(0)
        : HSLColor.fromColor(this);
    return hsl
        .withLightness(
            math.min(1, math.max(0, hsl.lightness + (amount ?? 10) / 100)))
        .toColor();
  }

  /// Darkens the color with the given integer percentage amount.
  /// Defaults to 10%.
  Color darken([int amount = 10]) {
    final HSLColor hsl = HSLColor.fromColor(this);
    return hsl
        .withLightness(
            math.min(1, math.max(0, hsl.lightness - (amount ?? 10) / 100)))
        .toColor();
  }

  /// Blend in the given input Color with a percentage of alpha.
  ///
  /// You typically apply this on a background color, light or dark
  /// to create a background color with a hint of a color used in a theme.
  ///
  /// This is a use case of the alphaBlend static function that exists in
  /// dart:ui Color. It is used to create the branded surface colors in
  /// FlexColorScheme and to calculate dark scheme colors from light ones,
  /// by blending in white color with light scheme color.
  ///
  /// Defaults to 10% alpha blend of the passed in Color value.
  Color blend(Color input, [int amount = 10]) {
    // Skip blending for impossible value and return the instance color value.
    if (amount == null || amount <= 0 || input == null || this == null) {
      return this;
    }
    // Blend amounts >= 100 results in the input Color.
    if (amount >= 100) return input;
    return Color.alphaBlend(input.withAlpha(255 * amount ~/ 100), this);
  }

  /// The [getShadeColor] extension is used to make a color darker or lighter,
  /// the [shadeValue] defines the amount in % that the shade should be changed.
  ///
  /// It can be used to make a shade of a color to be used in a gradient.
  /// By default it makes a color that is 15% lighter. If lighten is false
  /// it makes a color that is 15% darker by default.
  ///
  /// By default it does not affect black and white colors, but
  /// if [keepWhite] is set to false, it will darken white color when [lighten]
  /// is false and return a grey color. Wise versa for black with [keepBlack]
  /// set to false, it will lighten black color, when [lighten] is true and
  /// return a grey shade.
  ///
  /// White cannot be made lighter and black cannot be made
  /// darker, the extension just returns white or black for such attempts, with
  /// a quick exist from the call.
  Color getShadeColor({
    bool lighten = true,
    bool keepBlack = true,
    bool keepWhite = true,
    int shadeValue = 15, // The default shade change percentage
  }) {
    // Trying to make black darker, just return black
    if (this == Colors.black && !lighten) return this;
    // Black is defined to be kept as black.
    if (this == Colors.black && keepBlack) return this;
    // Make black lighter as lighten was set and we do not keepBlack
    if (this == Colors.black) return this.lighten(shadeValue);

    // Trying to make white lighter, just return white
    if (this == Colors.white && lighten) return this;
    // White is defined to be kept as white.
    if (this == Colors.white && keepWhite) return this;
    // Make white darker as we do not keep white.
    if (this == Colors.white) return darken(shadeValue);
    // We are dealing with some other color than white or black, so we
    // make it lighter or darker based on flag and requested shade %
    if (lighten) {
      return this.lighten(shadeValue);
    } else {
      return darken(shadeValue);
    }
  }

  /// Return uppercase Flutter style hex code string of the color.
  String get hexCode {
    return value.toRadixString(16).toUpperCase();
  }

  /// Return uppercase RGB hex code string, with # and no alpha value.
  /// This format is often used in APIs and in CSS color values..
  String get hex {
    return '#${value.toRadixString(16).substring(2).toUpperCase()}';
  }
}

/// Extensions on [String].
///
/// Included extensions are, [toColor] to convert a String to a Color.
/// To [capitalize] the first letter in a String and [dotTail] to get
/// remaining string after first dot "." in a String.
extension FlexStringExtensions on String {
  /// Convert a HEX value encoded RGB string to a Dart Color.
  ///
  /// The string may include the "#" char, but does not have to.
  /// The String may start with alpha channel hex value, but does not have to,
  /// if alpha is missing "FF" is used for alpha.
  /// If the value cannot be parsed to a Color, fully opaque black color
  /// is returned.
  Color toColor() {
    String hexColor = replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    if (hexColor.length == 8) {
      return Color(int.parse('0x$hexColor'));
    }
    // If the string cannot be parsed at all, or if it was not 6 or 8 chars
    // long, black color is returned.
    return const Color(0xFF000000);
  }

  /// Capitalize the first letter in a string.
  ///
  /// The extension can handle being passed an empty string or a null
  /// value in a safe way.
  String get capitalize {
    return (this != null && length > 1)
        ? this[0].toUpperCase() + substring(1)
        : (this != null)
            ? toUpperCase()
            : null;
  }

  /// Return the string remaining in a string after the first "." in a String.
  ///
  /// This function can be used to e.g. return the enum tail value from an
  /// enum's standard toString method.
  String get dotTail {
    return split('.').last;
  }
}
