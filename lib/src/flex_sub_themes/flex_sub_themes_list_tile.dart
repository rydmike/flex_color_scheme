part of '../flex_sub_themes.dart';

/// An opinionated [ListTileThemeData] theme.
///
/// ## [colorScheme]
///
/// Typically the same [ColorScheme] that is also used for your [ThemeData].
///
/// ## [selectedSchemeColor]
///
/// Defines the color used for icons and text when the list tile is
/// selected.
///
/// If not defined, defaults to [ColorScheme.primary].
///
/// ## [iconSchemeColor]
///
/// Defines the default color for ListTile [ListTile.leading] and [ListTile.trailing] icons.
///
/// If this property is null and [ListTile.selected] is false then this color is
/// used.
///
/// If null and [ThemeData.useMaterial3] is true,
/// [ColorScheme.onSurfaceVariant] is used, otherwise in M2 and if
/// [ThemeData.brightness] is [Brightness.light], [Colors.black54] is used,
/// and if [ThemeData.brightness] is [Brightness.dark], the value is null.
///
/// If [ListTile.selected] is true then [selectedSchemeColor] is used. If
/// it is null then [ColorScheme.primary] is used.
///
/// ## [textSchemeColor]
///
/// Defines the text color for the [ListTile.title], [ListTile.subtitle], [ListTile.leading], and
/// [ListTile.trailing].
///
/// If this property is null and [ListTile.selected] is false then
/// [textSchemeColor] is used. If that is also null then
/// default text color is used for the [ListTile.title], [ListTile.subtitle], [ListTile.leading], and
/// [ListTile.trailing]. Except for [ListTile.subtitle], if [ThemeData.useMaterial3] is false,
/// [TextTheme.bodySmall] is used.
///
/// If this property is null and [ListTile.selected] is true then
/// [selectedSchemeColor is used. If that is also null
/// then [ColorScheme.primary] is used.
///
/// If this color is a [WidgetStateColor] it will be resolved against
/// [WidgetState.selected] and [WidgetState.disabled] states.
///
/// ## [titleTextStyle]
///
/// The text style for ListTile's [ListTile.title].
///
/// If this property is null, then [ListTileThemeData.titleTextStyle] is
/// used.
///
/// If that is also null and [ThemeData.useMaterial3] is true,
/// [TextTheme.bodyLarge] with [ColorScheme.onSurface] will be used.
///
/// Otherwise, If ListTile style is [ListTileStyle.list],
/// [TextTheme.titleMedium] will be used and if ListTile style
/// is [ListTileStyle.drawer], [TextTheme.bodyLarge] will be used.
///
/// ## [subtitleTextStyle]
///
/// The text style for ListTile's [ListTile.subtitle].
///
/// If this property is null, then [ListTileThemeData.subtitleTextStyle]
/// is used.
///
/// If that is also null and [ThemeData.useMaterial3] is true,
/// [TextTheme.bodyMedium] with [ColorScheme.onSurfaceVariant] will be used,
/// otherwise [TextTheme.bodyMedium] with [TextTheme.bodySmall] color will
/// be used.
///
/// ## [leadingAndTrailingTextStyle]
///
/// The text style for ListTile's [ListTile.leading] and [ListTile.trailing].
///
/// If this property is null, then
/// [ListTileThemeData.leadingAndTrailingTextStyle] is used.
///
/// If that is also null and [ThemeData.useMaterial3] is true,
/// [TextTheme.labelSmall] with [ColorScheme.onSurfaceVariant] will be used,
/// otherwise [TextTheme.bodyMedium] will be used.
///
/// ## [tileSchemeColor]
///
/// Defines the background color of [ListTile] when [ListTile.selected] is false.
///
/// If this property is null and [ListTile.selected] is false then
/// [ListTileThemeData.tileColor] is used. If that is also null and
/// [ListTile.selected] is true, [ListTile.selectedTileColor] is used.
///
/// When that is also null, the [ListTileTheme.selectedTileColor] is used,
/// otherwise [Colors.transparent] is used.
///
/// ## [selectedTileSchemeColor]
///
/// Defines the background color of [ListTile] when [ListTile.selected] is true.
///
/// When the value if null, the [ListTile.selectedTileColor] is set to
/// [ListTileTheme.selectedTileColor] if it's not null and to
/// [Colors.transparent] if it's null.
///
/// ## [contentPadding]
///
/// The tile's internal padding.
///
/// Insets a [ListTile]'s contents: its [ListTile.leading], [ListTile.title], [ListTile.subtitle],
/// and [ListTile.trailing] widgets.
///
///
/// If null, `EdgeInsets.symmetric(horizontal: 16.0)` is used, if
/// [ThemeData.useMaterial3] is false. If [ThemeData.useMaterial3] is true then
/// `EdgeInsetsDirectional.only(start: 16.0, end: 24.0)` is used.
///
/// ## [horizontalTitleGap]
///
/// The horizontal gap between the titles and the leading/trailing widgets.
///
/// If not defined, defaults to 16.
///
/// ## [minVerticalPadding]
///
/// The minimum padding on the top and bottom of the title and subtitle
/// widgets.
///
/// If not defined, defaults to 4.
///
/// ## [style]
///
/// Defines the font used for the [ListTile.title].
///
/// If this property is null then [ListTileThemeData.style] is used. If that
/// is also null then [ListTileStyle.list] is used.
///
/// ## [titleAlignment]
///
/// Defines how [ListTile.leading] and [ListTile.trailing] are
/// vertically aligned relative to the [ListTile]'s titles
/// ([ListTile.title] and [ListTile.subtitle]).
///
/// If this property is null then [ListTileThemeData.titleAlignment]
/// is used. If that is also null then [ListTileTitleAlignment.threeLine]
/// is used.
///
/// ## [controlAffinity]
///
/// If specified, overrides the default value of
/// [CheckboxListTile.controlAffinity] or [ExpansionTile.controlAffinity]
/// or [SwitchListTile.controlAffinity] or [RadioListTile.controlAffinity].
ListTileThemeData _listTileTheme({
  /// Typically the same `ColorScheme` that is also used for your `ThemeData`.
  required ColorScheme colorScheme,

  /// Defines the color used for icons and text when the list tile is
  /// selected.
  ///
  /// If not defined, defaults to `ColorScheme.primary`.
  SchemeColor? selectedSchemeColor,

  /// Defines the default color for ListTile `leading` and `trailing` icons.
  SchemeColor? iconSchemeColor,

  /// Defines the text color for the `title`, `subtitle`, `leading`, and
  /// `trailing`.
  SchemeColor? textSchemeColor,

  /// The text style for ListTile's `title`.
  TextStyle? titleTextStyle,

  /// The text style for ListTile's `subtitle`.
  TextStyle? subtitleTextStyle,

  /// The text style for ListTile's `leading` and `trailing`.
  TextStyle? leadingAndTrailingTextStyle,

  /// Defines the background color of `ListTile` when `selected` is false.
  SchemeColor? tileSchemeColor,

  /// Defines the background color of `ListTile` when `selected` is true.
  SchemeColor? selectedTileSchemeColor,

  /// The tile's internal padding.
  EdgeInsetsGeometry? contentPadding,

  /// The horizontal gap between the titles and the leading/trailing widgets.
  ///
  /// If not defined, defaults to 16.
  double? horizontalTitleGap,

  /// The minimum padding on the top and bottom of the title and subtitle
  /// widgets.
  ///
  /// If not defined, defaults to 4.
  double? minVerticalPadding,

  /// Defines the font used for the `title`.
  ListTileStyle? style,

  /// Defines how `ListTile.leading` and `ListTile.trailing` are
  /// vertically aligned relative to the `ListTile`'s titles
  /// (`ListTile.title` and `ListTile.subtitle`).
  ListTileTitleAlignment? titleAlignment,

  /// If specified, overrides the default value of
  /// `CheckboxListTile.controlAffinity` or `ExpansionTile.controlAffinity`
  /// or `SwitchListTile.controlAffinity` or `RadioListTile.controlAffinity`.
  ListTileControlAffinity? controlAffinity,
}) {
  final Color selectedColor = FlexSubThemes.schemeColor(
    selectedSchemeColor ?? SchemeColor.primary,
    colorScheme,
  );

  final Color? iconColor = iconSchemeColor == null ? null : FlexSubThemes.schemeColor(iconSchemeColor, colorScheme);

  final Color? textColor = textSchemeColor == null ? null : FlexSubThemes.schemeColor(textSchemeColor, colorScheme);

  final Color? tileColor = tileSchemeColor == null ? null : FlexSubThemes.schemeColor(tileSchemeColor, colorScheme);

  final Color? selectedTileColor = selectedTileSchemeColor == null
      ? null
      : FlexSubThemes.schemeColor(selectedTileSchemeColor, colorScheme);

  return ListTileThemeData(
    selectedColor: selectedColor,
    iconColor: iconColor,
    textColor: textColor,
    //
    titleTextStyle: titleTextStyle,
    subtitleTextStyle: subtitleTextStyle,
    leadingAndTrailingTextStyle: leadingAndTrailingTextStyle,
    //
    tileColor: tileColor,
    selectedTileColor: selectedTileColor,
    contentPadding: contentPadding,
    horizontalTitleGap: horizontalTitleGap,
    minVerticalPadding: minVerticalPadding,
    style: style,
    titleAlignment: titleAlignment,
    controlAffinity: controlAffinity,
  );
}
