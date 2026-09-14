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
///
/// ## [colorScheme]
///
/// Typically the same [ColorScheme] that is also used for your [ThemeData].
///
/// ## [centerTitle]
///
/// Whether the AppBar title should be centered.
///
/// Overrides the default value of [AppBar.centerTitle] property in all
/// descendant [AppBar] widgets. If this property is null, then value
/// is adapted to the current [TargetPlatform].
///
/// ## [backgroundColor]
///
/// Overrides the default value of [AppBar.backgroundColor] in all
/// descendant [AppBar] widgets.
///
/// See also:
///
///  * [foregroundColor], which overrides the default value of
///    [AppBar.foregroundColor] in all descendant [AppBar] widgets.
///
/// ## [foregroundColor]
///
/// Overrides the default value of [AppBar.foregroundColor] in all
/// descendant [AppBar] widgets.
///
/// See also:
///
///  * [backgroundColor], which overrides the default value of
///    [AppBar.backgroundColor] in all descendant [AppBar] widgets.
///
/// ## [elevation]
///
/// Overrides the default value of [AppBar.elevation] in all
/// descendant [AppBar] widgets.
///
/// ## [scrolledUnderElevation]
///
/// Overrides the default value of [AppBar.scrolledUnderElevation] in all
/// descendant [AppBar] widgets.
///
/// If not defined, defaults to 3.
///
/// ## [iconTheme]
///
/// Overrides the default value of [AppBar.iconTheme] in all
/// descendant [AppBar] widgets.
///
/// See also:
///
///  * [actionsIconTheme], which overrides the default value of
///    [AppBar.actionsIconTheme] in all descendant [AppBar] widgets.
///  * [foregroundColor], which overrides the default value
///    [AppBar.foregroundColor] in all descendant [AppBar] widgets.
///
/// ## [actionsIconTheme]
///
/// Overrides the default value of [AppBar.actionsIconTheme] in all
/// descendant [AppBar] widgets.
///
/// See also:
///
///  * [iconTheme], which overrides the default value of
///    [AppBar.iconTheme] in all descendant [AppBar] widgets.
///  * [foregroundColor], which overrides the default value
///    [AppBar.foregroundColor] in all descendant [AppBar] widgets.
///
/// ## [shadowColor]
///
/// Overrides the default value of [AppBar.shadowColor] in all
/// descendant [AppBar] widgets.
///
/// ## [toolbarTextStyle]
///
/// Overrides the default value of the [AppBar.toolbarTextStyle]
/// property in all descendant [AppBar] widgets.
///
/// ## [titleTextStyle]
///
/// Overrides the default value of [AppBar.titleTextStyle]
/// property in all descendant [AppBar] widgets.
///
/// ## [surfaceTintColor]
///
/// Overrides the default value of [AppBar.surfaceTintColor] in all
/// descendant [AppBar] widgets.
///
/// ## [systemOverlayStyle]
///
/// Overrides the default value of [AppBar.systemOverlayStyle]
/// property in all descendant [AppBar] widgets.
AppBarThemeData _appBarTheme({
  /// Typically the same `ColorScheme` that is also used for your `ThemeData`.
  ColorScheme? colorScheme,

  /// Whether the AppBar title should be centered.
  bool? centerTitle,

  /// Overrides the default value of `AppBar.backgroundColor` in all
  /// descendant `AppBar` widgets.
  Color? backgroundColor,

  /// Overrides the default value of `AppBar.foregroundColor` in all
  /// descendant `AppBar` widgets.
  Color? foregroundColor,

  /// Overrides the default value of `AppBar.elevation` in all
  /// descendant `AppBar` widgets.
  double? elevation,

  /// Overrides the default value of `AppBar.scrolledUnderElevation` in all
  /// descendant `AppBar` widgets.
  ///
  /// If not defined, defaults to 3.
  double? scrolledUnderElevation,

  /// Overrides the default value of `AppBar.iconTheme` in all
  /// descendant `AppBar` widgets.
  IconThemeData? iconTheme,

  /// Overrides the default value of `AppBar.actionsIconTheme` in all
  /// descendant `AppBar` widgets.
  IconThemeData? actionsIconTheme,

  /// Overrides the default value of `AppBar.shadowColor` in all
  /// descendant `AppBar` widgets.
  Color? shadowColor,

  /// Overrides the default value of the `AppBar.toolbarTextStyle`
  /// property in all descendant `AppBar` widgets.
  TextStyle? toolbarTextStyle,

  /// Overrides the default value of `AppBar.titleTextStyle`
  /// property in all descendant `AppBar` widgets.
  TextStyle? titleTextStyle,

  /// Overrides the default value of `AppBar.surfaceTintColor` in all
  /// descendant `AppBar` widgets.
  Color? surfaceTintColor,

  /// Overrides the default value of `AppBar.systemOverlayStyle`
  /// property in all descendant `AppBar` widgets.
  SystemUiOverlayStyle? systemOverlayStyle,
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
