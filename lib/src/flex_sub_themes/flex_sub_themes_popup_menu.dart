part of '../flex_sub_themes.dart';

/// An opinionated [PopupMenuThemeData] with custom corner radius.
///
/// When used by [FlexColorScheme] the corner radius of popup menus follows
/// the global [FlexSubThemesData.defaultRadius] if defined, until and
/// including 10 dp. After which it stays at 10 dp. If you need a higher
/// corner radius on popup menus than 10 dp, with [FlexColorScheme]
/// you will have to explicitly override
/// [FlexSubThemesData.popupMenuRadius].
///
/// It will not look very good when it is
/// over 10dp. The highlight inside the menu will start to overflow the
/// corners and is not clipped along the border radius. The underlying Widget
/// is not designed with this high border rounding in mind. This makes sense
/// since it does not look good with too much rounding on a small menu.
///
/// The built-in behavior in FlexColorScheme allows it to match at low
/// inherited radius values from [FlexSubThemesData.defaultRadius] but to
/// also stay below the usable max rounding automatically at higher global
/// border radius values.
PopupMenuThemeData _popupMenuTheme({
  /// Typically the same [ColorScheme] that is also used for your [ThemeData].
  final ColorScheme? colorScheme,

  /// Defines which [Theme] based [ColorScheme] based color is use as
  /// background color by [PopupMenuButton].
  ///
  /// Any passed in background color via the [color] property
  /// will override this [backgroundSchemeColor] value.
  ///
  /// If not defined, and [color] is undefined, then it defaults via Flutter
  /// SDK defaults to:
  /// - [useMaterial3] = false : default theme.cardColor.
  /// - [useMaterial3] = true  : default theme.colorScheme.surfaceContainer.
  /// Usually they are the same.
  final SchemeColor? backgroundSchemeColor,

  /// Defines which [Theme] based [ColorScheme] based color is use as
  /// foreground color by [PopupMenuButton].
  ///
  /// If not defined and [backgroundSchemeColor] is, then it will default to
  /// the schemeColorPair for the [backgroundSchemeColor]. If
  /// [backgroundSchemeColor] is also null, then it defaults to Flutter SDK
  /// default foreground color [ColorScheme.onSurface].
  final SchemeColor? foregroundSchemeColor,

  /// The background color of [PopupMenuButton].
  ///
  /// If not defined, and [backgroundSchemeColor] is undefined, then it
  /// defaults via Flutter SDK defaults to:
  /// - [useMaterial3] = false : defaults theme.cardColor.
  /// - [useMaterial3] = true  : defaults theme.colorScheme.surfaceContainer.
  /// Usually they are the same.
  final Color? color,

  /// The TextStyle of the selectable items on the [PopupMenuButton].
  ///
  /// The default is [textTheme.labelLarge], via Flutter SDK defaults.
  final TextStyle? textStyle,

  /// Popup menu corner radius.
  ///
  /// If not defined, defaults to 4 via Flutter SDK defaults.
  final double? radius,

  /// The elevation of the [PopupMenuButton].
  ///
  /// If not defined, then if [useMaterial3] is:
  /// - false : defaults to 8 dp
  /// - true  : defaults to 3 dp.
  /// via Flutter SDK widget default values.
  /// FCS will pass in [kPopupMenuM3Elevation] (3), if Material3 is true
  /// and [kPopupMenuM2Elevation] (6), if it is false.
  final double? elevation,

  /// The color used as an alpha overlay tint color on the effective
  /// [PopupMenuButton] background color.
  final Color? surfaceTintColor,
}) {
  // Get selected background color, defaults to surface in M3 if not defined
  // and to theme.cardColor in M2, typically they are the same.
  final Color? backgroundColor = color ??
      (colorScheme != null && backgroundSchemeColor != null
          ? FlexSubThemes.schemeColor(backgroundSchemeColor, colorScheme)
          : null);
  final Color? onBackgroundColor =
      colorScheme != null && backgroundSchemeColor != null
          ? FlexSubThemes.schemeColorPair(backgroundSchemeColor, colorScheme)
          : color != null
              ? ThemeData.estimateBrightnessForColor(color) == Brightness.light
                  ? Colors.black
                  : Colors.white
              : null;

  final Color? foregroundColor =
      colorScheme != null && foregroundSchemeColor != null
          ? FlexSubThemes.schemeColor(foregroundSchemeColor, colorScheme)
          : onBackgroundColor;

  final bool inputsNull =
      color == null && backgroundColor == null && foregroundColor == null;

  final TextStyle? effectiveTextStyle =
      inputsNull ? null : textStyle ?? const TextStyle();

  return PopupMenuThemeData(
    elevation: elevation,
    color: backgroundColor,
    surfaceTintColor: surfaceTintColor,
    textStyle: effectiveTextStyle?.apply(color: foregroundColor),
    labelTextStyle: effectiveTextStyle != null
        ? WidgetStateProperty.resolveWith((Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return effectiveTextStyle.apply(
                color: foregroundColor?.withAlpha(kAlphaDisabled),
              );
            }
            return effectiveTextStyle.apply(color: foregroundColor);
          })
        : null,
    shape: radius != null
        ? RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
          )
        : null,
  );
}
