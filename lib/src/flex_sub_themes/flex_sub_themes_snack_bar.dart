part of '../flex_sub_themes.dart';

/// An opinionated [SnackBarThemeData] with custom elevation.
///
/// The [elevation] defaults to [kSnackBarElevation] (4).
SnackBarThemeData _snackBarTheme({
  /// SnackBar elevation
  ///
  /// If undefined defaults to [kSnackBarElevation] = 4.
  final double? elevation,

  /// Corner radius of the [SnackBar].
  ///
  /// If not defined, defaults to 4 dp, but only when
  /// [SnackBar.behavior] style [SnackBarBehavior.floating] is used. This
  /// default is based on SDK widget default behavior and is  based on
  /// M3 Specification https://m3.material.io/components/snackbar/specs.
  ///
  /// NOTE: If this theme property is set, both SnackBars with behavior
  /// fixed and floating will get the assigned radius. See issue:
  /// https://github.com/flutter/flutter/issues/108539
  final double? radius,

  /// The background color of the themed SnackBar. Typically one of inverse
  /// brightness compared to theme's surface color brightness.
  ///
  /// If null then it default to Flutter SDK theme defaults below.
  /// When FlexColorScheme sub themes are used and [backgroundSchemeColor]
  /// has not been defined, it defaults to FCS default shown below:
  ///
  /// * Default in light theme mode:
  ///   * Via FCS: onSurface with primary blend at 45% opacity, with
  ///     total opacity 95%
  ///   * Flutter SDK M2 uses: colorScheme.onSurface with opacity 80%,
  ///     alpha blended on top of colorScheme.surface.
  ///   * Flutter SDK M3 uses: colorScheme.inverseSurface.
  ///
  /// * In dark theme mode:
  ///   * FCS: onSurface with primary blend at 39% opacity, with total
  ///     opacity 93%
  ///   * Flutter SDK M2 uses: colorScheme.onSurface
  ///   * Flutter SDK M2 uses: colorScheme.inverseSurface
  ///
  ///  If a [colorScheme] is passed in and [backgroundSchemeColor] is defined,
  ///  it will override [backgroundColor] and be used instead.
  final Color? backgroundColor,

  /// Typically the same [ColorScheme] that is also use for your [ThemeData].
  final ColorScheme? colorScheme,

  /// Selects which color from the passed in [colorScheme] to use as
  /// [SnackBar] background color.
  ///
  /// If not defined or [colorScheme] is not defined, then the passed in
  /// [backgroundColor] will be used, which may be null too and SnackBar then
  /// falls back Flutter SDK defaults, or to FCS default if this is used by
  /// FCS that passes in its one custom default.
  final SchemeColor? backgroundSchemeColor,

  /// Overrides the default value for [SnackBarAction.textColor].
  ///
  /// If null, [SnackBarAction] and [colorScheme] is defined, defaults to
  /// [ColorScheme.inversePrimary], if a [colorScheme] was not defined, then
  /// defaults to effective foreground color with alpha 0xDD.
  final SchemeColor? actionTextSchemeColor,

  /// Used to configure the [DefaultTextStyle] for the [SnackBar.content]
  /// widget.
  ///
  /// If null, [SnackBar] defines its default using titleMedium
  final TextStyle? contentTextStyle,
}) {
  final Color? background =
      (colorScheme == null || backgroundSchemeColor == null)
          ? backgroundColor // might be null, then SDK theme defaults.
          : FlexSubThemes.schemeColor(backgroundSchemeColor, colorScheme);

  final Color? foreground = (colorScheme != null &&
          backgroundSchemeColor != null)
      ? FlexSubThemes.schemeColorPair(backgroundSchemeColor, colorScheme)
      : background != null
          ? ThemeData.estimateBrightnessForColor(background) == Brightness.light
              ? Colors.black
              : Colors.white
          : null;

  final Color? actionForeground = colorScheme != null
      ? FlexSubThemes.schemeColor(
          actionTextSchemeColor ?? SchemeColor.inversePrimary,
          colorScheme,
        )
      : null;

  final TextStyle? snackTextStyle = foreground != null
      ? contentTextStyle == null
          ? ThemeData(
              brightness: Brightness.light,
            ).textTheme.titleMedium!.copyWith(color: foreground)
          : contentTextStyle.copyWith(color: foreground)
      : contentTextStyle;

  return SnackBarThemeData(
    elevation: elevation ?? kSnackBarElevation,
    shape: radius != null
        ? RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
          )
        : null,
    backgroundColor: background,
    contentTextStyle: snackTextStyle,
    actionTextColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
      return actionForeground ?? foreground?.withAlpha(0xDD) ?? Colors.grey;
    }),
    disabledActionTextColor:
        actionForeground?.withAlpha(0x11) ?? foreground?.withAlpha(0x11),

    // This is using same foreground as the text, but slightly muted from it
    // as the default should be, this just works with any resulting foreground
    // color and does not rely on M3 default onInverseSurface for similar
    // result, that only works on inverseSurface.
    closeIconColor: foreground?.withAlpha(0xAA),
  );
}
