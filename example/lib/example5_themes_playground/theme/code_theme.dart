import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flutter/material.dart';

/// A [ThemeExtension] for code highlight color properties used by code viewer.
class CodeTheme extends ThemeExtension<CodeTheme> {
  const CodeTheme({
    this.baseColor,
    this.numberColor,
    this.commentColor,
    this.keywordColor,
    this.stringColor,
    this.punctuationColor,
    this.classColor,
    this.constantColor,
  });
  final Color? baseColor;
  final Color? numberColor;
  final Color? commentColor;
  final Color? keywordColor;
  final Color? stringColor;
  final Color? punctuationColor;
  final Color? classColor;
  final Color? constantColor;

  /// Must override the copyWith method.
  @override
  CodeTheme copyWith({
    Color? baseColor,
    Color? numberColor,
    Color? commentColor,
    Color? keywordColor,
    Color? stringColor,
    Color? punctuationColor,
    Color? classColor,
    Color? constantColor,
  }) =>
      CodeTheme(
        baseColor: baseColor ?? this.baseColor,
        numberColor: numberColor ?? this.numberColor,
        commentColor: commentColor ?? this.commentColor,
        keywordColor: keywordColor ?? this.keywordColor,
        stringColor: stringColor ?? this.stringColor,
        punctuationColor: punctuationColor ?? this.punctuationColor,
        classColor: classColor ?? this.classColor,
        constantColor: constantColor ?? this.constantColor,
      );

  /// Must override the lerp method.
  @override
  CodeTheme lerp(ThemeExtension<CodeTheme>? other, double t) {
    if (other is! CodeTheme) {
      return this;
    }
    return CodeTheme(
      baseColor: Color.lerp(baseColor, other.baseColor, t),
      numberColor: Color.lerp(numberColor, other.numberColor, t),
      commentColor: Color.lerp(commentColor, other.commentColor, t),
      keywordColor: Color.lerp(keywordColor, other.keywordColor, t),
      stringColor: Color.lerp(stringColor, other.stringColor, t),
      punctuationColor: Color.lerp(punctuationColor, other.punctuationColor, t),
      classColor: Color.lerp(classColor, other.classColor, t),
      constantColor: Color.lerp(constantColor, other.constantColor, t),
    );
  }

  /// Code view theme colors for light mode.
  static const CodeTheme light = CodeTheme(
    baseColor: Color(0xFF092249),
    numberColor: Color(0xFF1565C0),
    commentColor: Color(0xFF446736),
    keywordColor: Color(0xFF9C27B0),
    stringColor: Color(0xFF43A047),
    punctuationColor: Color(0xFF081936),
    classColor: Color(0xFF6607C5),
    constantColor: Color(0xFF795548),
  );

  /// Code view theme colors for dark mode.
  static const CodeTheme dark = CodeTheme(
    baseColor: Color(0xFFEEEED6),
    numberColor: Color(0xFFB4CDA8),
    commentColor: Color(0xFF90C07A),
    keywordColor: Color(0xFF5BAAE8),
    stringColor: Color(0xFFD3A384),
    punctuationColor: Color(0xFFEAE9D4),
    classColor: Color(0xFF39C8B0),
    constantColor: Color(0xFFB9A1DC),
  );

  /// A harmonized code view color theme, based on [brightness] where colors
  /// are harmonized towards a given [sourceColor].
  factory CodeTheme.harmonized(Color sourceColor, Brightness brightness) {
    final int sourceColorValue = sourceColor.value;

    // Fallback color value that can be used for all colors in both modes.
    // This use case should never happen when CodeTheme is setup correctly.
    const int fallbackValue = 0xFF1565C0; // Bright dark blue

    // Use the code theme for target brightness.
    final CodeTheme codeTheme = brightness == Brightness.light ? light : dark;

    // MaterialColorUtilities Blend function is used to harmonize each color
    // towards the source color hue. This way the code view text will fit better
    // with the overall ColorScheme. This also works well if the source color
    // for the ColorScheme was extracted from OS theme colors or a device
    // wallpaper, or any image and then created with ColorScheme.fromSeed.
    return CodeTheme(
      baseColor: Color(
        Blend.harmonize(
          // As used used in this app we could bang the color, instead of using
          // a fallback, but this is safer generally.
          codeTheme.baseColor?.value ?? fallbackValue,
          sourceColorValue,
        ),
      ),
      numberColor: Color(
        Blend.harmonize(
          codeTheme.numberColor?.value ?? fallbackValue,
          sourceColorValue,
        ),
      ),
      commentColor: Color(
        Blend.harmonize(
          codeTheme.commentColor?.value ?? fallbackValue,
          sourceColorValue,
        ),
      ),
      keywordColor: Color(
        Blend.harmonize(
          codeTheme.keywordColor?.value ?? fallbackValue,
          sourceColorValue,
        ),
      ),
      stringColor: Color(
        Blend.harmonize(
          codeTheme.stringColor?.value ?? fallbackValue,
          sourceColorValue,
        ),
      ),
      punctuationColor: Color(
        Blend.harmonize(
          codeTheme.punctuationColor?.value ?? fallbackValue,
          sourceColorValue,
        ),
      ),
      classColor: Color(
        Blend.harmonize(
          codeTheme.classColor?.value ?? fallbackValue,
          sourceColorValue,
        ),
      ),
      constantColor: Color(
        Blend.harmonize(
          codeTheme.constantColor?.value ?? fallbackValue,
          sourceColorValue,
        ),
      ),
    );
  }
}
