part of '../flex_sub_themes.dart';

/// An opinionated [BottomAppBarTheme] theme.
///
/// The [BottomAppBarTheme] allows setting only of background color in FCS.
/// Other properties are not used by FCS at this stage.
///
/// The [BottomAppBarTheme] has no properties for foreground color. If you use
/// a background color that requires different contrast color than the
/// active theme's surface colors, you will need to set their colors on
/// widget level on elements placed on the [BottomAppBar].
BottomAppBarThemeData _bottomAppBarTheme({
  /// Typically the same [ColorScheme] that is also used for your [ThemeData].
  required final ColorScheme colorScheme,

  /// Selects which color from the passed in colorScheme to use as the
  /// background color for the [BottomAppBar].
  ///
  /// If not defined, [colorScheme.surfaceContainer] will be used via default
  /// widget behavior for M3 mode and explicitly set to [surface] for M2 mode.
  final SchemeColor? backgroundSchemeColor,

  /// Overrides the default value for [BottomAppBar.elevation].
  ///
  /// If undefined (null), defaults to 3 in M3 and to 8 in M2 mode.
  final double? elevation,

  /// Overrides the default value for [BottomAppBar.shape].
  final NotchedShape? shape,

  /// Overrides the default value for [BottomAppBar.height].
  ///
  /// If this is null, then in M2 the default value is the minimum in relation
  /// to the content, in M3 defaults to 80.0.
  final double? height,

  /// Overrides the default value for [BottomAppBar.padding].
  ///
  /// In M3 the padding will default to
  /// `EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0)`
  /// In M2 the value will default to EdgeInsets.zero.
  final EdgeInsetsGeometry? padding,

  /// Overrides the default value of [BottomSheet.shadowColor].
  final Color? shadowColor,

  /// Overrides the default value for [BottomAppBar.surfaceTintColor].
  ///
  /// See [Material.surfaceTintColor] for more details.
  final Color? surfaceTintColor,

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
  // Effective color, if null, keep null for M3 defaults via widget, but
  // set to surface for M2 mode.
  final Color backgroundColor = FlexSubThemes.schemeColor(
    backgroundSchemeColor ?? SchemeColor.surface,
    colorScheme,
  );
  final Color? effectiveColor =
      backgroundSchemeColor == null && useM3 ? null : backgroundColor;

  return BottomAppBarThemeData(
    color: effectiveColor,
    elevation: elevation,
    height: height,
    padding: padding,
    shadowColor: shadowColor,
    surfaceTintColor: surfaceTintColor,
  );
}
