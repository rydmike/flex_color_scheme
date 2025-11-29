part of '../flex_sub_themes.dart';

/// An opinionated [ProgressIndicatorThemeData] theme for the
/// [CircularProgressIndicator] and [LinearProgressIndicator].
ProgressIndicatorThemeData _progressIndicatorTheme({
  /// Typically the same [ColorScheme] that is also used for your [ThemeData].
  required final ColorScheme colorScheme,

  /// The color of the [ProgressIndicator]'s indicator.
  ///
  /// If null, then it will use [ColorScheme.primary] of the ambient
  /// [ThemeData.colorScheme].
  final SchemeColor? baseSchemeColor,

  /// Color of the track being filled by the linear indicator.
  ///
  /// If [linearTrackSchemeColor] is null then in M2 mode
  /// the ambient theme's deprecated [ColorScheme.background] color is used
  /// In M3 mode [ColorScheme.secondaryContainer] is used as default.
  final SchemeColor? linearTrackSchemeColor,

  /// The minimum height of the line used to draw the linear indicator.
  ///
  /// If [linearMinHeight] is null it defaults to 4dp.
  final double? linearMinHeight,

  /// Scheme color of the circular track being filled by circular indicator.
  ///
  /// If [circularTrackSchemeColor] is null the track will not be painted.
  final SchemeColor? circularTrackSchemeColor,

  /// Background scheme color fill under the circle of the refresh indicator.
  ///
  /// If [refreshBackgroundSchemeColor] is null then the ambient
  /// theme's [ThemeData.canvasColor]
  /// will be used. In FCs this defaults to [ColorScheme.surface].
  final SchemeColor? refreshBackgroundSchemeColor,

  /// The border radius of both the linear indicator and the track.
  ///
  /// Defaults to circular radius of 2 in Material-3, which produces a
  /// rounded shape with a rounded indicator. In Material-2 mode it defaults
  /// to [BorderRadius.zero], which produces a rectangular shape
  /// with a rectangular indicator.
  ///
  /// Providing a values of 0 or less will result in [BorderRadius.zero].
  final double? linearRadius,

  /// The scheme color of the stop indicator of the [LinearProgressIndicator].
  ///
  /// If [year2023] is true/null or [ThemeData.useMaterial3] is false, then
  /// no stop indicator will be drawn.
  ///
  /// Defaults to [SchemeColor.primary].
  final SchemeColor? stopIndicatorSchemeColor,

  /// Overrides the stop indicator radius of the [LinearProgressIndicator].
  ///
  /// If [LinearProgressIndicator.year2023] is true or
  /// [ThemeData.useMaterial3] is false, then no stop indicator will be drawn.
  final double? stopIndicatorRadius,

  /// The width of the line used to draw the circle in  the
  /// [CircularProgressIndicator].
  final double? strokeWidth,

  /// The relative position of the stroke on a [CircularProgressIndicator].
  ///
  /// Values typically range from -1.0
  /// ([CircularProgressIndicator.strokeAlignInside], inside stroke)
  /// to 1.0 ([CircularProgressIndicator.strokeAlignOutside], outside stroke),
  /// without any bound constraints (e.g., a value of -2.0 is not typical,
  /// but allowed).
  /// A value of 0 ([CircularProgressIndicator.strokeAlignCenter]) will center
  /// the border on the edge of the widget.
  ///
  /// If [progressIndicatorYear2023] is true, then the default value is
  /// [CircularProgressIndicator.strokeAlignCenter].
  /// Otherwise, the default value is
  /// [CircularProgressIndicator.strokeAlignInside].
  final double? strokeAlign,

  /// Overrides the stroke cap of the [CircularProgressIndicator].
  ///
  /// Determines the shape of the stroke ends of the progress indicator.
  /// By default, [strokeCap] is null.
  /// When value is null (indeterminate), the stroke ends are set to
  /// [StrokeCap.square]. When value is not null, the stroke
  /// ends are set to [StrokeCap.butt].
  ///
  /// Setting [strokeCap] to [StrokeCap.round] will result in a rounded end.
  /// Setting [strokeCap] to [StrokeCap.butt] with value == null will result
  /// in a slightly different indeterminate animation; the indicator
  /// completely disappears and reappears on its minimum value.
  /// Setting [strokeCap] to [StrokeCap.square] with [value] != null will
  /// result in a different display of value. The indicator will start
  /// drawing from slightly less than the start, and end slightly after
  /// the end. This will produce an alternative result, as the
  /// default behavior, for example, that a value of 0.5 starts at 90
  /// degrees and ends at 270 degrees. With [StrokeCap.square], it could
  /// start 85 degrees and end at 275 degrees.
  final StrokeCap? strokeCap,

  /// Defines minimum and maximum sizes for a [CircularProgressIndicator].
  ///
  /// If null, in Material-2 or Material-3 when [year2023] is true or null,
  /// defaults to a minimum width and height of 36 pixels.
  /// If Material-3 mode and [year2023] is false,
  /// defaults to a minimum width and height of 40 pixels.
  final BoxConstraints? constraints,

  /// Overrides the active indicator and the background track gap.
  ///
  /// If [year2023] is true or
  /// [ThemeData.useMaterial3] is false, then no track gap will be drawn.
  final double? trackGap,

  /// Overrides the padding of the [CircularProgressIndicator].
  final EdgeInsetsGeometry? circularTrackPadding,

  /// Overrides the [CircularProgressIndicator.year2023] and
  /// [LinearProgressIndicator.year2023] properties.
  ///
  /// When true, the [CircularProgressIndicator] and [LinearProgressIndicator]
  /// will use the 2023 Material-3 appearance. Defaults to true.
  ///
  /// If this is set to false, the [CircularProgressIndicator] and
  /// [LinearProgressIndicator] will use the latest Material-3 appearance,
  /// which was introduced in December 2023 and become common in 2024.
  ///
  /// If [ThemeData.useMaterial3] is false, then this property is ignored.
  final bool? year2023,
}) {
  // Get selected indicator color, defaults to primary if not defined.
  final Color? color = baseSchemeColor == null
      ? null
      : FlexSubThemes.schemeColor(baseSchemeColor, colorScheme);

  final Color? linearTrackColor = linearTrackSchemeColor == null
      ? null
      : FlexSubThemes.schemeColor(linearTrackSchemeColor, colorScheme);

  final Color? circularTrackColor = circularTrackSchemeColor == null
      ? null
      : FlexSubThemes.schemeColor(circularTrackSchemeColor, colorScheme);

  final Color? refreshBackgroundColor = refreshBackgroundSchemeColor == null
      ? null
      : FlexSubThemes.schemeColor(refreshBackgroundSchemeColor, colorScheme);

  final Color stopIndicatorColor = stopIndicatorSchemeColor == null
      // TODO(rydmike): Report null crash in Flutter SDK!
      // This should be null, but if year2023 is false, we get a crash in SDK
      // if we use Material-2 mode with null here and we have specified a
      // stopIndicatorRadius. We work around this by always
      // assigning a color here until the SDK is fixed.
      // The STOP indicator should not be drawn at all in M2 mode, but it
      // currently is if you set year2023 to false and give this property
      // a color, if you don't Flutter SDK throws a bang! crash on null.
      ? colorScheme.primary
      : FlexSubThemes.schemeColor(stopIndicatorSchemeColor, colorScheme);

  final BorderRadiusGeometry? borderRadius = linearRadius == null
      ? null
      : linearRadius <= 0
          ? BorderRadius.zero
          : BorderRadius.all(Radius.circular(linearRadius));

  return ProgressIndicatorThemeData(
    color: color,
    linearTrackColor: linearTrackColor,
    linearMinHeight: linearMinHeight,
    circularTrackColor: circularTrackColor,
    refreshBackgroundColor: refreshBackgroundColor,
    borderRadius: borderRadius,
    stopIndicatorColor: stopIndicatorColor,
    stopIndicatorRadius: stopIndicatorRadius,
    strokeWidth: strokeWidth,
    strokeAlign: strokeAlign,
    strokeCap: strokeCap,
    constraints: constraints,
    trackGap: trackGap,
    circularTrackPadding: circularTrackPadding,
    // ignore: deprecated_member_use, required to use current M3 style.
    year2023: year2023,
  );
}
