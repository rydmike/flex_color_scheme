part of '../flex_sub_themes.dart';

/// An opinionated [MenuBarThemeData] theme.
MenuBarThemeData _menuBarTheme({
  // Typically the same [ColorScheme] that is also used for your [ThemeData].
  required final ColorScheme colorScheme,

  /// Select which color from the passed in [colorScheme] parameter to use as
  /// the MenuBar background color.
  ///
  /// If not defined, default to [colorScheme.surfaceContainer].
  ///
  /// FlexColorScheme passes in
  /// [FlexSubThemesData.menuBarBackgroundSchemeColor] first, can be null, and
  /// uses [FlexSubThemesData.menuSchemeColor] as fallback, can also be null.
  final SchemeColor? backgroundSchemeColor,

  /// The shadow color of the MenuBar's [Material].
  ///
  /// The material's elevation shadow can be difficult to see for dark themes,
  /// so by default the menu classes add a semi-transparent overlay to
  /// indicate elevation. See [ThemeData.applyElevationOverlayColor].
  final Color? shadowColor,

  /// The surface tint color of the MenuBar's [Material].
  ///
  /// See [Material.surfaceTintColor] for more details.
  final Color? surfaceTintColor,

  /// The elevation of the MenuBar's [Material].
  final double? elevation,

  /// MenuBar corner radius.
  ///
  /// If not defined, defaults to 4, the M3 specification, via Flutter SDK
  /// widget default values.
  final double? radius,
}) {
  final Color background = FlexSubThemes.schemeColor(
    backgroundSchemeColor ?? SchemeColor.surfaceContainer,
    colorScheme,
  );

  final bool allDefault = backgroundSchemeColor == null &&
      shadowColor == null &&
      surfaceTintColor == null &&
      elevation == null &&
      radius == null;

  return MenuBarThemeData(
    style: allDefault
        ? null
        : MenuStyle(
            backgroundColor: backgroundSchemeColor != null
                ? WidgetStatePropertyAll<Color?>(background)
                : null,
            surfaceTintColor: surfaceTintColor != null
                ? WidgetStatePropertyAll<Color?>(surfaceTintColor)
                : null,
            shadowColor: shadowColor != null
                ? WidgetStatePropertyAll<Color?>(shadowColor)
                : null,
            elevation: elevation != null
                ? WidgetStatePropertyAll<double?>(elevation)
                : null,
            shape: radius != null
                ? WidgetStatePropertyAll<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(radius),
                      ),
                    ),
                  )
                : null,
          ),
  );
}
