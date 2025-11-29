part of '../flex_sub_themes.dart';

/// An opinionated [DrawerThemeData] theme for the [Drawer].
///
/// The [NavigationDrawer] also uses these value for its drawer parts. Its
/// menu part has an own theme in Flutter SDK.
DrawerThemeData _drawerTheme({
  /// Typically the same [ColorScheme] that is also used for your [ThemeData].
  required final ColorScheme colorScheme,

  /// Selects which color from the passed in [colorScheme] to use as
  /// [Drawer] background color.
  ///
  /// If not defined, defaults to [SchemeColor.surfaceContainerLow].
  ///
  /// Flutter SDK uses surfaceContainerLow color as default in M3 and
  /// ThemeData's canvasColor in M2 mode, which is Colors.grey[50] in
  /// light mode and Colors.grey[850] in dark mode.
  final SchemeColor? backgroundSchemeColor,

  /// Corner radius of the [Drawer]'s visible edge.
  ///
  /// If not defined, defaults to [kDrawerRadius] 16 dp in M2 mode,
  /// in M3 mode, null is kept but gets 16 via M3 mode defaults.
  /// The 16 dp values is based on M3 specification:
  /// https://m3.material.io/components/navigation-drawer/specs
  final double? radius,

  /// Drawer elevation.
  ///
  /// If not defined, defaults to Flutter default values, in M2 mode (16)
  /// and in M3 (1) via SDK defaults.
  final double? elevation,

  /// Drawer elevation shadow color.
  ///
  /// In M2 defaults to [Colors.black] and elevation casts a shadow.
  /// In M3 it defaults [Colors.transparent] and there is no shadow.
  final Color? shadowColor,

  /// Overrides the default value for [Drawer.surfaceTintColor].
  final Color? surfaceTintColor,

  /// Themes the default width of the [Drawer].
  ///
  /// If not defined, defaults to 304dp via Flutter SDK defaults for both
  /// M2 and M3.
  ///
  /// M3 spec has it at 360dp for [NavigationDrawer], but
  /// Flutter still uses 304dp as default in M3 mode.
  ///
  /// For more info see issue:
  /// https://github.com/flutter/flutter/issues/123380
  final double? width,

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
  // Get selected background color, defaults to surface.
  final Color backgroundColor = FlexSubThemes.schemeColor(
    backgroundSchemeColor ?? SchemeColor.surfaceContainerLow,
    colorScheme,
  );

  return DrawerThemeData(
    backgroundColor: backgroundColor,
    elevation: elevation,
    width: width,
    shadowColor: shadowColor,
    surfaceTintColor: surfaceTintColor,
    shape: useM3 && radius == null
        ? null
        : RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.horizontal(
              end: Radius.circular(radius ?? kDrawerRadius),
            ),
          ),
    endShape: useM3 && radius == null
        ? null
        : RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.horizontal(
              start: Radius.circular(radius ?? kDrawerRadius),
            ),
          ),
  );
}
