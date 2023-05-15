import 'package:flutter/material.dart';

/// A utility class to set the color of the font color to null in all
/// [TextStyle]s in a [TextTheme].
class TextThemeColor {
  /// Set font color to null in all styles in passed in [TextTheme] and
  /// return the new [TextTheme] other properties remain unchanged.
  static TextTheme nullFontColor(TextTheme textTheme) {
    /// Set font color to null in all styles in passed in [TextTheme] and
    return TextTheme(
      displayLarge: nullColor(textTheme.displayLarge!),
      displayMedium: nullColor(textTheme.displayMedium!),
      displaySmall: nullColor(textTheme.displaySmall!),
      //
      headlineLarge: nullColor(textTheme.headlineLarge!),
      headlineMedium: nullColor(textTheme.headlineMedium!),
      headlineSmall: nullColor(textTheme.headlineSmall!),
      //
      titleLarge: nullColor(textTheme.titleLarge!),
      titleMedium: nullColor(textTheme.titleMedium!),
      titleSmall: nullColor(textTheme.titleSmall!),
      //
      bodyLarge: nullColor(textTheme.bodyLarge!),
      bodyMedium: nullColor(textTheme.bodyMedium!),
      bodySmall: nullColor(textTheme.bodySmall!),
      //
      labelLarge: nullColor(textTheme.labelLarge!),
      labelMedium: nullColor(textTheme.labelMedium!),
      labelSmall: nullColor(textTheme.labelSmall!),
    );
  }

  /// Set font color to null in all styles in passed in [TextStyle] and
  /// return the new [TextStyle] other properties remain unchanged.
  static TextStyle nullColor(TextStyle style) {
    return TextStyle(
      color: null, // Set color to NULL, let ThemeData handle default.
      backgroundColor: style.backgroundColor,
      fontSize: style.fontSize,
      fontWeight: style.fontWeight,
      fontStyle: style.fontStyle,
      letterSpacing: style.letterSpacing,
      wordSpacing: style.wordSpacing,
      textBaseline: style.textBaseline,
      height: style.height,
      leadingDistribution: style.leadingDistribution,
      locale: style.locale,
      foreground: style.foreground,
      background: style.background,
      shadows: style.shadows,
      fontFeatures: style.fontFeatures,
      fontVariations: style.fontVariations,
      decoration: style.decoration,
      decorationColor: style.decorationColor,
      decorationStyle: style.decorationStyle,
      decorationThickness: style.decorationThickness,
      debugLabel: style.debugLabel,
      fontFamily: style.fontFamily,
      fontFamilyFallback: style.fontFamilyFallback,
      overflow: style.overflow,
    );
  }
}
