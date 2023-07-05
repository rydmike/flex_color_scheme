import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flutter/material.dart';

/// A [ThemeExtension] for semantic theme topic group color properties.
class TopicTheme extends ThemeExtension<TopicTheme> {
  const TopicTheme({
    this.generalColor,
    this.colorsColor,
    this.componentsColor,
    this.controlsColor,
    this.inputsColor,
    this.barsColor,
    this.navigationColor,
    this.surfacesColor,
    this.textsColor,
  });
  final Color? generalColor;
  final Color? colorsColor;
  final Color? componentsColor;
  final Color? controlsColor;
  final Color? inputsColor;
  final Color? barsColor;
  final Color? navigationColor;
  final Color? surfacesColor;
  final Color? textsColor;

  /// Must override the copyWith method.
  @override
  TopicTheme copyWith({
    Color? generalColor,
    Color? colorsColor,
    Color? componentsColor,
    Color? controlsColor,
    Color? inputsColor,
    Color? barsColor,
    Color? navigationColor,
    Color? surfacesColor,
    Color? textsColor,
  }) =>
      TopicTheme(
        generalColor: generalColor ?? this.generalColor,
        colorsColor: colorsColor ?? this.colorsColor,
        componentsColor: componentsColor ?? this.componentsColor,
        controlsColor: controlsColor ?? this.controlsColor,
        inputsColor: inputsColor ?? this.inputsColor,
        barsColor: barsColor ?? this.barsColor,
        navigationColor: navigationColor ?? this.navigationColor,
        surfacesColor: surfacesColor ?? this.surfacesColor,
        textsColor: textsColor ?? this.textsColor,
      );

  /// Must override the lerp method.
  @override
  TopicTheme lerp(ThemeExtension<TopicTheme>? other, double t) {
    if (other is! TopicTheme) {
      return this;
    }
    return TopicTheme(
      generalColor: Color.lerp(generalColor, other.generalColor, t),
      colorsColor: Color.lerp(colorsColor, other.colorsColor, t),
      componentsColor: Color.lerp(componentsColor, other.componentsColor, t),
      controlsColor: Color.lerp(controlsColor, other.controlsColor, t),
      inputsColor: Color.lerp(inputsColor, other.inputsColor, t),
      barsColor: Color.lerp(barsColor, other.barsColor, t),
      navigationColor: Color.lerp(navigationColor, other.navigationColor, t),
      surfacesColor: Color.lerp(surfacesColor, other.surfacesColor, t),
      textsColor: Color.lerp(textsColor, other.textsColor, t),
    );
  }

  /// Topic theme colors for light mode.
  static const TopicTheme light = TopicTheme(
    generalColor: Color(0xFF262654),
    colorsColor: Color(0xFF910CAD),
    componentsColor: Color(0xFF035A9F),
    controlsColor: Color(0xFFAF0000),
    inputsColor: Color(0xFFDC6E04),
    barsColor: Color(0xFF00A8A4),
    navigationColor: Color(0xFF0A9811),
    surfacesColor: Color(0xFF1A5901),
    textsColor: Color(0xFF031E79),
  );

  /// Topic theme colors for dark mode.
  static const TopicTheme dark = TopicTheme(
    generalColor: Color(0xFFDBDBFC),
    colorsColor: Color(0xFFE9B2F6),
    componentsColor: Color(0xFF6FB1E7),
    controlsColor: Color(0xFFF18E8E),
    inputsColor: Color(0xFFECA359),
    barsColor: Color(0xFF7ED5D1),
    navigationColor: Color(0xFF83C588),
    surfacesColor: Color(0xFF419D73),
    textsColor: Color(0xFF7583B6),
  );

  /// A color harmonized topic theme, based on [brightness] where colors
  /// are harmonized towards a given [sourceColor].
  factory TopicTheme.harmonized(Color sourceColor, Brightness brightness) {
    final int sourceColorValue = sourceColor.value;

    // Fallback color value that can be used for all colors in both modes.
    // This use case should never happen when TopicTheme is setup correctly.
    const int fallbackValue = 0xFF1565C0; // Bright dark blue
    // Use the topic theme for target brightness.
    final TopicTheme topicTheme = brightness == Brightness.light ? light : dark;

    // MaterialColorUtilities Blend function is used to harmonize each color
    // towards the source color hue. This way the topic theme will fit better
    // with the overall ColorScheme. This also works well if the source color
    // for the ColorScheme was extracted from OS theme colors or a device
    // wallpaper, or any image and then created with ColorScheme.fromSeed.
    return TopicTheme(
      generalColor: Color(
        Blend.harmonize(
          // As used used in this app we could bang the color, instead of using
          // a fallback, but this is safer generally.
          topicTheme.generalColor?.value ?? fallbackValue,
          sourceColorValue,
        ),
      ),
      colorsColor: Color(
        Blend.harmonize(
          topicTheme.colorsColor?.value ?? fallbackValue,
          sourceColorValue,
        ),
      ),
      componentsColor: Color(
        Blend.harmonize(
          topicTheme.componentsColor?.value ?? fallbackValue,
          sourceColorValue,
        ),
      ),
      controlsColor: Color(
        Blend.harmonize(
          topicTheme.controlsColor?.value ?? fallbackValue,
          sourceColorValue,
        ),
      ),
      inputsColor: Color(
        Blend.harmonize(
          topicTheme.inputsColor?.value ?? fallbackValue,
          sourceColorValue,
        ),
      ),
      barsColor: Color(
        Blend.harmonize(
          topicTheme.barsColor?.value ?? fallbackValue,
          sourceColorValue,
        ),
      ),
      navigationColor: Color(
        Blend.harmonize(
          topicTheme.navigationColor?.value ?? fallbackValue,
          sourceColorValue,
        ),
      ),
      surfacesColor: Color(
        Blend.harmonize(
          topicTheme.surfacesColor?.value ?? fallbackValue,
          sourceColorValue,
        ),
      ),
      textsColor: Color(
        Blend.harmonize(
          topicTheme.textsColor?.value ?? fallbackValue,
          sourceColorValue,
        ),
      ),
    );
  }
}
