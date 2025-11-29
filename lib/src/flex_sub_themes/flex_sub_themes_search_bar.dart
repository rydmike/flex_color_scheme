part of '../flex_sub_themes.dart';

/// An opinionated [SearchBarThemeData] theme for the [SearchBar].
SearchBarThemeData _searchBarTheme({
  /// Typically the same [ColorScheme] that is also use for your [ThemeData].
  required final ColorScheme colorScheme,

  /// The search bar's background fill color.
  ///
  /// If null, the default value is `surfaceContainerHigh`.
  final SchemeColor? backgroundSchemeColor,

  /// The elevation of the search bar's [Material].
  ///
  /// If null, default value is 6.0.
  final double? elevation,

  /// The shadow color of the search bar's [Material].
  ///
  /// If null, the default value is [ColorScheme.shadow].
  final Color? shadowColor,

  /// The border radius of the search bar's underlying [Material].
  ///
  /// If not defined defaults to Stadium shape.
  final double? radius,

  // TODO(rydmike): Doing just a radius for now. Shapes later
  // The color and weight of the search bar's outline.
  //
  // This value is combined with [shape] to create a shape decorated
  // with an outline.
  //
  // If null, the search bar doesn't have a side by default.
  // final WidgetStateProperty<BorderSide?>? side,
  //
  // The shape of the search bar's underlying [Material].
  //
  // This shape is combined with [side] to create a shape decorated
  // with an outline.
  //
  // If null, defaults to [StadiumBorder].
  // final WidgetStateProperty<OutlinedBorder?>? shape,

  /// The padding between the search bar's boundary and its contents.
  ///
  /// If null, then the default value is 16.0 horizontally.
  final EdgeInsetsGeometry? padding,

  /// The style to use for the text being edited.
  ///
  /// If null, defaults to the `bodyLarge` text style from the current
  /// [Theme]. The default text color is [ColorScheme.onSurface].
  final WidgetStateProperty<TextStyle?>? textStyle,

  /// The style to use for the [hintText].
  ///
  /// If null, defaults to `bodyLarge` text style from the current [Theme].
  /// The default text color is [ColorScheme.onSurfaceVariant].
  final WidgetStateProperty<TextStyle?>? hintStyle,

  /// Optional size constraints for the search bar.
  ///
  /// If null, the value of [SearchBarThemeData.constraints] will be used. If
  /// this is also null, then the constraints defaults to:
  ///
  /// ```dart
  /// const BoxConstraints(minWidth: 360.0, maxWidth: 800.0, minHeight: 56.0)
  /// ```
  final BoxConstraints? constraints,

  /// Configures how the platform keyboard will select an uppercase or
  /// lowercase keyboard.
  ///
  /// Only supports text keyboards, other keyboard types will ignore this
  /// configuration. Capitalization is locale-aware.
  ///
  /// If not defined, defaults to [TextCapitalization.none]
  TextCapitalization? textCapitalization,

  /// Defines if the theme uses tinted interaction effects.
  ///
  /// If undefined, defaults to false.
  final bool? tintedInteractions,

  /// Defines if the theme uses tinted disabled color.
  ///
  /// If undefined, defaults to false.
  final bool? tintedDisabled,
}) {
  final bool tintInteract = tintedInteractions ?? false;
  final bool tintDisable = tintedDisabled ?? false;

  // Get selected color, defaults to primary.
  final Color backgroundColor = FlexSubThemes.schemeColor(
    backgroundSchemeColor ?? SchemeColor.surfaceContainerHigh,
    colorScheme,
  );
  final Color onBackgroundColor = FlexSubThemes.schemeColorPair(
    backgroundSchemeColor ?? SchemeColor.surfaceContainerHigh,
    colorScheme,
  );

  // The logic below is used to give a nice tinted interaction and disable
  // color regardless of how we customize the foreground and background
  // of the search bar.
  final bool isLight = colorScheme.brightness == Brightness.light;
  // Get brightness of the SearchBar background color.
  final bool buttonBgIsLight =
      ThemeData.estimateBrightnessForColor(backgroundColor) == Brightness.light;
  // For tint color use the one that is more likely to give a colored effect.
  final Color tint = isLight
      ? buttonBgIsLight
          ? onBackgroundColor
          : backgroundColor
      : buttonBgIsLight
          ? backgroundColor
          : onBackgroundColor;
  // The reverse color is used for overlay
  final Color overlay = isLight
      ? buttonBgIsLight
          ? backgroundColor
          : onBackgroundColor
      : buttonBgIsLight
          ? onBackgroundColor
          : backgroundColor;
  // We use surface mode tint factor, if it is light theme and background
  // is light OR if it is a dark theme and background is dark.
  final bool surfaceMode =
      (isLight && buttonBgIsLight) || (!isLight && !buttonBgIsLight);
  final double factor = FlexSubThemes._tintAlphaFactor(
    tint,
    colorScheme.brightness,
    surfaceMode,
  );

  return SearchBarThemeData(
    backgroundColor: backgroundSchemeColor != null
        ? WidgetStatePropertyAll<Color?>(backgroundColor)
        : null,
    elevation: WidgetStatePropertyAll<double?>(elevation),
    shadowColor: WidgetStatePropertyAll<Color?>(shadowColor),
    shape: radius != null
        ? WidgetStatePropertyAll<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius)),
            ),
          )
        : null,
    padding: WidgetStatePropertyAll<EdgeInsetsGeometry?>(padding),
    textStyle: textStyle,
    hintStyle: hintStyle,
    constraints: constraints,
    overlayColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      // TODO(rydmike): There is no disabled SearchBar, but there should be.
      // Maybe raise an issue about it, might be one already.
      if (states.contains(WidgetState.disabled)) {
        if (tintDisable) {
          return FlexSubThemes.tintedDisable(
            colorScheme.onSurface,
            backgroundColor,
          ).withAlpha(kAlphaUltraLowDisabled);
        }
        return colorScheme.onSurface.withAlpha(kAlphaUltraLowDisabled);
      }
      if (states.contains(WidgetState.pressed)) {
        if (tintInteract) {
          return FlexSubThemes.tintedPressed(backgroundColor, tint, factor);
        }
        return colorScheme.onSurface.withAlpha(kAlphaInputPressed);
      }
      if (states.contains(WidgetState.hovered)) {
        if (tintInteract) {
          return FlexSubThemes.tintedHovered(overlay, tint, factor);
        }
        return colorScheme.onSurface.withAlpha(kAlphaHovered);
      }
      return Colors.transparent;
    }),
    textCapitalization: textCapitalization,
  );
}
