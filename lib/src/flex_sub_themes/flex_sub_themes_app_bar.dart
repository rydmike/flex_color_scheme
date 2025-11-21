part of '../flex_sub_themes.dart';

/// An opinionated [AppBarTheme] theme.
///
/// Contrary to the other opinionated static [FlexSubThemes] sub-theme
/// function, this one is only a sub-set of the original and does not do or
/// contain any feature shortcuts.
///
/// The [FlexColorScheme.toTheme] needs some of the properties, like fore-
/// and background colors used here, for other component theme definitions as
/// well, and has already computed them once, so they are only reused here.
///
/// At the moment the [FlexSubThemes.appBarTheme] is mostly included to
/// keep and have all [FlexColorScheme] used sub-themes in the [FlexSubThemes]
/// class. Actual convenience features may be added to
/// [FlexSubThemes.appBarTheme] later.
AppBarThemeData _appBarTheme({
  /// Typically the same [ColorScheme] that is also used for your [ThemeData].
  final ColorScheme? colorScheme,

  /// Whether the AppBar title should be centered.
  ///
  /// Overrides the default value of [AppBar.centerTitle] property in all
  /// descendant [AppBar] widgets. If this property is null, then value
  /// is adapted to the current [TargetPlatform].
  final bool? centerTitle,

  /// Overrides the default value of [AppBar.backgroundColor] in all
  /// descendant [AppBar] widgets.
  ///
  /// See also:
  ///
  ///  * [foregroundColor], which overrides the default value of
  ///    [AppBar.foregroundColor] in all descendant [AppBar] widgets.
  final Color? backgroundColor,

  /// Overrides the default value of [AppBar.foregroundColor] in all
  /// descendant [AppBar] widgets.
  ///
  /// See also:
  ///
  ///  * [backgroundColor], which overrides the default value of
  ///    [AppBar.backgroundColor] in all descendant [AppBar] widgets.
  final Color? foregroundColor,

  /// Overrides the default value of [AppBar.elevation] in all
  /// descendant [AppBar] widgets.
  final double? elevation,

  /// Overrides the default value of [AppBar.scrolledUnderElevation] in all
  /// descendant [AppBar] widgets.
  ///
  /// If not defined, defaults to 3.
  final double? scrolledUnderElevation,

  /// Overrides the default value of [AppBar.iconTheme] in all
  /// descendant [AppBar] widgets.
  ///
  /// See also:
  ///
  ///  * [actionsIconTheme], which overrides the default value of
  ///    [AppBar.actionsIconTheme] in all descendant [AppBar] widgets.
  ///  * [foregroundColor], which overrides the default value
  ///    [AppBar.foregroundColor] in all descendant [AppBar] widgets.
  final IconThemeData? iconTheme,

  /// Overrides the default value of [AppBar.actionsIconTheme] in all
  /// descendant [AppBar] widgets.
  ///
  /// See also:
  ///
  ///  * [iconTheme], which overrides the default value of
  ///    [AppBar.iconTheme] in all descendant [AppBar] widgets.
  ///  * [foregroundColor], which overrides the default value
  ///    [AppBar.foregroundColor] in all descendant [AppBar] widgets.
  final IconThemeData? actionsIconTheme,

  /// Overrides the default value of [AppBar.shadowColor] in all
  /// descendant [AppBar] widgets.
  final Color? shadowColor,

  /// Overrides the default value of the [AppBar.toolbarTextStyle]
  /// property in all descendant [AppBar] widgets.
  final TextStyle? toolbarTextStyle,

  /// Overrides the default value of [AppBar.titleTextStyle]
  /// property in all descendant [AppBar] widgets.
  final TextStyle? titleTextStyle,

  /// Overrides the default value of [AppBar.surfaceTintColor] in all
  /// descendant [AppBar] widgets.
  final Color? surfaceTintColor,

  /// Overrides the default value of [AppBar.systemOverlayStyle]
  /// property in all descendant [AppBar] widgets.
  final SystemUiOverlayStyle? systemOverlayStyle,
}) {
  return AppBarThemeData(
    centerTitle: centerTitle,
    backgroundColor: backgroundColor,
    foregroundColor: foregroundColor,
    elevation: elevation,
    scrolledUnderElevation: scrolledUnderElevation,
    iconTheme: iconTheme,
    actionsIconTheme: actionsIconTheme,
    systemOverlayStyle: systemOverlayStyle,
    shadowColor: shadowColor,
    surfaceTintColor: surfaceTintColor,
    toolbarTextStyle: toolbarTextStyle,
    titleTextStyle: titleTextStyle,
    // TODO(rydmike): This is a workaround to make tint elevation animate.
    // See issue https://github.com/flutter/flutter/issues/131042.
    shape: const RoundedRectangleBorder(),
  );
}
