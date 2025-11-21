part of '../flex_sub_themes.dart';

/// An opinionated [TooltipThemeData]
TooltipThemeData _tooltipTheme({
  /// Typically the same [ColorScheme] that is also use for your [ThemeData].
  required final ColorScheme colorScheme,

  /// Selects which color from the passed in [colorScheme] to use as
  /// dialog background color.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// If not defined, defaults to [SchemeColor.onSurface].
  ///
  final SchemeColor? backgroundSchemeColor,

  /// Background color of the tooltip.
  ///
  /// If backgroundSchemeColor is defined, it will be used instead.
  final Color? backgroundColor,

  /// Foreground color of the tooltip.
  ///
  /// If backgroundSchemeColor is defined, its SchemeColor pair will be
  /// used instead.
  final Color? foregroundColor,

  /// Alpha value for the background color.
  ///
  /// If not defined, defaults to 0xFF, fully opaque.
  final int? backgroundAlpha,

  /// The border radius of the tooltip.
  ///
  /// If not defined, defaults to 4 same as Flutter SDK default.
  /// FCS sets it to 8 by default when using sub-themes and
  /// passes it here.
  final double? borderRadius,

  /// The color of the tooltip border.
  ///
  /// If not defined, defaults to fully transparent.
  final Color? borderColor,

  /// The tooltip text style.
  ///
  /// If not defined defaults to bodyMedium, with effective foregroundColor.
  final TextStyle? textStyle,

  /// The amount of space by which to inset the tooltip's [child].
  ///
  /// On mobile,
  ///   defaults to 16.0 logical pixels horizontally and 4.0 vertically.
  /// On desktop,
  ///   defaults to 8.0 logical pixels horizontally and 4.0 vertically.
  final EdgeInsetsGeometry? padding,

  /// If provided, the amount of empty space to surround the [Tooltip].
  ///
  /// Defines the tooltip's outer [Container.margin]. By default, a
  /// long tooltip will span the width of its window. If long enough,
  /// a tooltip might also span the window's height. This property allows
  /// one to define how much space the tooltip must be inset from the edges
  /// of their display window.
  ///
  /// If this property is null, the default margin is 0.0 logical
  /// pixels on all sides.
  final EdgeInsetsGeometry? margin,

  /// The length of time that a pointer must hover over a tooltip's widget
  /// before the tooltip will be shown.
  ///
  /// Defaults to 0 milliseconds (tooltips are shown immediately upon hover).
  final Duration? waitDuration,

  /// The length of time that the tooltip will be shown after a long press is
  /// released (if triggerMode is [TooltipTriggerMode.longPress]) or a tap is
  /// released (if triggerMode is [TooltipTriggerMode.tap]) or mouse pointer
  /// exits the widget.
  ///
  /// Defaults to 1.5 seconds for long press and tap released or 0.1 seconds
  /// for mouse pointer exits the widget.
  final Duration? showDuration,
}) {
  final Color background =
      (backgroundSchemeColor == null && backgroundColor != null)
          ? backgroundColor
          : FlexSubThemes.schemeColor(
              backgroundSchemeColor ?? SchemeColor.onSurface,
              colorScheme,
            );

  final Color foreground =
      (backgroundSchemeColor == null && foregroundColor != null)
          ? foregroundColor
          : FlexSubThemes.schemeColorPair(
              backgroundSchemeColor ?? SchemeColor.onSurface,
              colorScheme,
            );

  final TextStyle tooltipTextStyle = textStyle == null
      ? ThemeData(
          brightness: Brightness.light,
        ).textTheme.bodyMedium!.copyWith(color: foreground)
      : textStyle.copyWith(color: foreground);

  return TooltipThemeData(
    padding: padding,
    margin: margin,
    textStyle: tooltipTextStyle,
    decoration: BoxDecoration(
      color: background.withAlpha(backgroundAlpha ?? 0xFF),
      borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 4)),
      border: Border.all(color: borderColor ?? Colors.transparent),
    ),
    waitDuration: waitDuration,
    showDuration: showDuration,
  );
}
