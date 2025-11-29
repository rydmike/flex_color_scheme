part of '../flex_sub_themes.dart';

/// An opinionated [MenuThemeData] theme.
///
/// This theme is used by the menu for the [DropdownMenu], [MenuBar] and
/// [MenuAnchor].
MenuThemeData _menuTheme({
  /// Typically the same [ColorScheme] that is also used for your [ThemeData].
  required final ColorScheme colorScheme,

  /// Defines which [Theme] based [ColorScheme] based background color
  /// of [PopupMenuButton].
  ///
  /// If not defined, will remains null and via Flutter SDK defaults get
  /// [ColorScheme.surfaceContainer] color.
  final SchemeColor? backgroundSchemeColor,

  /// Menu background opacity.
  ///
  /// Used by FlexColorScheme to modify the opacity the themed [MenuBar],
  /// [MenuAnchor] and [DropDownMenu] background color.
  ///
  /// Defaults to undefined (null).
  /// If undefined, produced result is same as 1, fully opaque.
  ///
  /// If opacity is defined and [backgroundSchemeColor] is undefined,
  /// then [ColorScheme.surfaceContainer] will be used as background color to
  /// make a background color with opacity.
  final double? opacity,

  /// Menu corner radius.
  ///
  /// If not defined, default to 4 via Menu widget Flutter SDK defaults.
  final double? radius,

  /// The padding between the menu's boundary and its child.
  final EdgeInsetsGeometry? padding,

  /// Popup menu elevation.
  ///
  /// If not defined, defaults to 3 dp via Flutter widget SDK defaults.
  final double? elevation,

  /// Overrides the default value for MenuThemeData
  /// [menuStyle.surfaceTintColor].
  final Color? surfaceTintColor,
}) {
  // Get effective background color.
  final Color? backgroundColor = backgroundSchemeColor != null
      ? FlexSubThemes.schemeColor(
          backgroundSchemeColor,
          colorScheme,
        ).withValues(alpha: opacity ?? 1.0)
      : opacity != null
          ? colorScheme.surfaceContainer.withValues(alpha: opacity)
          : null;

  final bool allDefaults = backgroundSchemeColor == null &&
      opacity == null &&
      radius == null &&
      padding == null &&
      elevation == null &&
      surfaceTintColor == null;

  return MenuThemeData(
    style: allDefaults
        ? null
        : MenuStyle(
            elevation: elevation == null
                ? null
                : WidgetStatePropertyAll<double?>(elevation),
            backgroundColor: backgroundSchemeColor == null && opacity == null
                ? null
                : WidgetStatePropertyAll<Color?>(backgroundColor),
            padding: padding == null
                ? null
                : WidgetStatePropertyAll<EdgeInsetsGeometry?>(padding),
            surfaceTintColor: surfaceTintColor == null
                ? null
                : WidgetStatePropertyAll<Color>(surfaceTintColor),
            shape: radius == null
                ? null
                : WidgetStatePropertyAll<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(radius),
                      ),
                    ),
                  ),
          ),
  );
}
