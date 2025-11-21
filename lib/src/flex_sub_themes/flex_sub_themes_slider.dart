part of '../flex_sub_themes.dart';

/// An opinionated [SliderThemeData] theme for the [Slider].
///
/// Requires a [ColorScheme] in [colorScheme]. The color scheme would
/// typically be equal the color scheme also used to define the color scheme
/// for your app theme.
SliderThemeData _sliderTheme({
  /// Typically the same `ColorScheme` that is also used for your `ThemeData`.
  required final ColorScheme colorScheme,

  /// Selects which color from the passed in colorScheme to use as the main
  /// color for the Slider.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// If not defined, [colorScheme.primary] will be used.
  final SchemeColor? baseSchemeColor,

  /// Selects which color from the passed in colorScheme to use as the thumb
  /// color for the Slider.
  ///
  /// If not defined, [baseSchemeColor] will be used.
  final SchemeColor? thumbSchemeColor,

  /// The height of the [Slider] track.
  ///
  /// If not defined, defaults to 4 via Flutter SDK defaults.
  final double? trackHeight,

  /// Whether the value indicator should be shown for different types of
  /// sliders.
  ///
  /// By default, [showValueIndicator] is set to
  /// [ShowValueIndicator.onlyForDiscrete]. The value indicator is only shown
  /// when the thumb is being touched.
  final ShowValueIndicator? showValueIndicator,

  /// Enum used to select the type of built-in value indicator used by
  /// [Slider].
  ///
  /// The current two options included Material 2 default
  /// [RectangularSliderValueIndicatorShape] and Material 3 default
  /// [DropSliderValueIndicatorShape].
  ///
  /// If not defined, the default for the M2/M3 mode is used.
  final FlexSliderIndicatorType? valueIndicatorType,

  /// The color given to the [valueIndicatorShape] to draw itself with.
  ///
  /// If undefined, defaults to using Flutter SDK's logic for the color.
  final Color? valueIndicatorColor,

  /// The text style for the text on the value indicator.
  ///
  /// If undefined, defaults to using Flutter SDK's logic for the TextStyle.
  final TextStyle? valueIndicatorTextStyle,

  /// Defines if the theme uses tinted interaction effects.
  ///
  /// If undefined, defaults to false.
  final bool? useTintedInteraction,

  /// Defines if the theme uses tinted disabled color.
  ///
  /// If undefined, defaults to false.
  final bool? useTintedDisable,

  /// Overrides the default value of [Slider.year2023].
  ///
  /// When true, the [Slider] will use the 2023 Material Design 3 appearance.
  ///
  /// If this is set to false, the [Slider] will use the latest Material-3
  /// appearance, which was introduced in December 2023 and become common
  /// in 2024.
  ///
  /// In Flutter Material SDK, this property is named `year2023`.
  ///
  /// If undefined, defaults to true, via Flutter Material's default behavior.
  /// If [useMaterial3] is false, then this property is ignored.
  final bool? useOldM3Design,

  /// A temporary flag used to disable Material-3 design and use legacy
  /// Material-2 design instead. Material-3 design is the default.
  /// Material-2 will be deprecated in Flutter.
  ///
  /// If set to true, the theme will use Material3 default styles when
  /// properties are undefined, if false defaults will use FlexColorScheme's
  /// own opinionated default values.
  ///
  /// The M2/M3 defaults will only be used for properties that are not
  /// defined, if defined they keep their defined values.
  ///
  /// If undefined, defaults to true.
  final bool? useMaterial3,
}) {
  final bool useM3 = useMaterial3 ?? true;
  final bool tintInteract = useTintedInteraction ?? false;
  final bool tintDisable = useTintedDisable ?? false;
  // Get selected color, defaults to primary.
  final Color baseColor = FlexSubThemes.schemeColor(
    baseSchemeColor ?? SchemeColor.primary,
    colorScheme,
  );
  final Color onBaseColor = FlexSubThemes.schemeColorPair(
    baseSchemeColor ?? SchemeColor.primary,
    colorScheme,
  );

  final Color thumbColor = FlexSubThemes.schemeColor(
    thumbSchemeColor ?? baseSchemeColor ?? SchemeColor.primary,
    colorScheme,
  );

  // Using these tinted overlay variable in all themes for ease of
  // reasoning and duplication.
  final Color overlay = colorScheme.surface;
  final Color tint = baseColor;
  final double factor =
      FlexSubThemes._tintAlphaFactor(tint, colorScheme.brightness, true);

  // Assign sliderShape with based on valueIndicatorType
  final SliderComponentShape? sliderShape = switch (valueIndicatorType) {
    FlexSliderIndicatorType.drop => const DropSliderValueIndicatorShape(),
    FlexSliderIndicatorType.rectangular =>
      const RectangularSliderValueIndicatorShape(),
    FlexSliderIndicatorType.rounded =>
      const RoundedRectSliderValueIndicatorShape(),
    null => null,
  };

  // Assign range sliderShape based on valueIndicatorType
  final RangeSliderValueIndicatorShape? rangeSliderShape =
      switch (valueIndicatorType) {
    FlexSliderIndicatorType.drop =>
      const PaddleRangeSliderValueIndicatorShape(),
    FlexSliderIndicatorType.rectangular =>
      const RectangularRangeSliderValueIndicatorShape(),
    FlexSliderIndicatorType.rounded =>
      const RoundedRectRangeSliderValueIndicatorShape(),
    null => useM3 && (useOldM3Design ?? true)
        ? const PaddleRangeSliderValueIndicatorShape()
        : null,
  };

  Color? overlayColor() =>
      WidgetStateColor.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.dragged)) {
          if (tintInteract) {
            return FlexSubThemes.tintedFocused(overlay, tint, factor);
          }
          return thumbColor.withAlpha(kAlphaFocused);
        }
        if (states.contains(WidgetState.hovered)) {
          if (tintInteract) {
            return FlexSubThemes.tintedHovered(overlay, tint, factor);
          }
          return thumbColor.withAlpha(kAlphaHovered);
        }
        if (states.contains(WidgetState.focused)) {
          if (tintInteract) {
            return FlexSubThemes.tintedFocused(overlay, tint, factor);
          }
          return thumbColor.withAlpha(kAlphaFocused);
        }
        return Colors.transparent;
      });

  // TODO(rydmike): Fidelity review of M3 theme for Slider.
  return SliderThemeData(
    // TODO(rydmike): Remove when SliderThemeData.year2023 is removed.
    // The year2023 property is directly deprecated in Flutter SDK,
    // we must ignore that it was directly deprecated when it was introduced
    // to not get a package score penalty, when we use it to access this
    // feature that allows us to toggle between older and current M3 style.
    //
    // ignore: deprecated_member_use, required to use current M3 style.
    year2023: useOldM3Design,
    trackHeight: trackHeight,
    activeTrackColor: baseColor,
    inactiveTrackColor: baseColor.withAlpha(kAlphaLowDisabled),
    // TODO(rydmike): Add secondaryActiveTrackColor
    //
    disabledActiveTrackColor: tintDisable
        ? FlexSubThemes.tintedDisable(colorScheme.onSurface, baseColor)
        : colorScheme.onSurface.withAlpha(kAlphaMediumDisabled),
    disabledInactiveTrackColor: colorScheme.onSurface.withAlpha(
      kAlphaVeryLowDisabled,
    ),
    // TODO(rydmike): Add disabledSecondaryActiveTrackColor
    //
    activeTickMarkColor: onBaseColor.withAlpha(kAlphaSliderTickMark),
    inactiveTickMarkColor: baseColor.withAlpha(kAlphaSliderTickMark),
    disabledActiveTickMarkColor: onBaseColor.withAlpha(kAlphaVeryLowDisabled),
    disabledInactiveTickMarkColor: colorScheme.onSurface.withAlpha(
      kAlphaVeryLowDisabled,
    ),
    //
    thumbColor: thumbColor,
    disabledThumbColor: tintDisable
        ? Color.alphaBlend(
            FlexSubThemes.tintedDisable(colorScheme.onSurface, baseColor),
            colorScheme.surface,
          )
        : Color.alphaBlend(
            colorScheme.onSurface.withAlpha(kAlphaDisabled),
            colorScheme.surface,
          ),
    overlayColor: overlayColor(),
    //
    showValueIndicator: showValueIndicator,
    valueIndicatorColor: valueIndicatorColor,
    valueIndicatorTextStyle: valueIndicatorTextStyle,
    //
    valueIndicatorShape: sliderShape,
    rangeValueIndicatorShape: rangeSliderShape,
  );
}
