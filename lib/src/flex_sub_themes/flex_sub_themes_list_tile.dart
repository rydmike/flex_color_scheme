part of '../flex_sub_themes.dart';

/// An opinionated [ListTileThemeData] theme.
ListTileThemeData _listTileTheme({
  /// Typically the same [ColorScheme] that is also used for your [ThemeData].
  required final ColorScheme colorScheme,

  /// Defines the color used for icons and text when the list tile is
  /// selected.
  ///
  /// If not defined, defaults to [ColorScheme.primary].
  final SchemeColor? selectedSchemeColor,

  /// Defines the default color for ListTile [leading] and [trailing] icons.
  ///
  /// If this property is null and [selected] is false then this color is
  /// used.
  ///
  /// If null and [ThemeData.useMaterial3] is true,
  /// [ColorScheme.onSurfaceVariant] is used, otherwise in M2 and if
  /// [ThemeData.brightness] is [Brightness.light], [Colors.black54] is used,
  /// and if [ThemeData.brightness] is [Brightness.dark], the value is null.
  ///
  /// If [selected] is true then [selectedSchemeColor] is used. If
  /// it is null then [ColorScheme.primary] is used.
  final SchemeColor? iconSchemeColor,

  /// Defines the text color for the [title], [subtitle], [leading], and
  /// [trailing].
  ///
  /// If this property is null and [selected] is false then
  /// [textSchemeColor] is used. If that is also null then
  /// default text color is used for the [title], [subtitle], [leading], and
  /// [trailing]. Except for [subtitle], if [ThemeData.useMaterial3] is false,
  /// [TextTheme.bodySmall] is used.
  ///
  /// If this property is null and [selected] is true then
  /// [selectedSchemeColor is used. If that is also null
  /// then [ColorScheme.primary] is used.
  ///
  /// If this color is a [WidgetStateColor] it will be resolved against
  /// [WidgetState.selected] and [WidgetState.disabled] states.
  final SchemeColor? textSchemeColor,

  /// The text style for ListTile's [title].
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
  final TextStyle? titleTextStyle,

  /// The text style for ListTile's [subtitle].
  ///
  /// If this property is null, then [ListTileThemeData.subtitleTextStyle]
  /// is used.
  ///
  /// If that is also null and [ThemeData.useMaterial3] is true,
  /// [TextTheme.bodyMedium] with [ColorScheme.onSurfaceVariant] will be used,
  /// otherwise [TextTheme.bodyMedium] with [TextTheme.bodySmall] color will
  /// be used.
  final TextStyle? subtitleTextStyle,

  /// The text style for ListTile's [leading] and [trailing].
  ///
  /// If this property is null, then
  /// [ListTileThemeData.leadingAndTrailingTextStyle] is used.
  ///
  /// If that is also null and [ThemeData.useMaterial3] is true,
  /// [TextTheme.labelSmall] with [ColorScheme.onSurfaceVariant] will be used,
  /// otherwise [TextTheme.bodyMedium] will be used.
  final TextStyle? leadingAndTrailingTextStyle,

  /// Defines the background color of `ListTile` when [selected] is false.
  ///
  /// If this property is null and [selected] is false then
  /// [ListTileThemeData.tileColor] is used. If that is also null and
  /// [selected] is true, [selectedTileColor] is used.
  ///
  /// When that is also null, the [ListTileTheme.selectedTileColor] is used,
  /// otherwise [Colors.transparent] is used.
  final SchemeColor? tileSchemeColor,

  /// Defines the background color of `ListTile` when [selected] is true.
  ///
  /// When the value if null, the [selectedTileColor] is set to
  /// [ListTileTheme.selectedTileColor] if it's not null and to
  /// [Colors.transparent] if it's null.
  final SchemeColor? selectedTileSchemeColor,

  // TODO(rydmike): Default is incorrect for M3 in Flutter doc comment. Fix!
  /// The tile's internal padding.
  ///
  /// Insets a [ListTile]'s contents: its [leading], [title], [subtitle],
  /// and [trailing] widgets.
  ///
  ///
  /// If null, `EdgeInsets.symmetric(horizontal: 16.0)` is used, if
  /// `useMaterial3` is `false`. If `useMaterial3` is `true` then
  /// `EdgeInsetsDirectional.only(start: 16.0, end: 24.0)` is used.
  final EdgeInsetsGeometry? contentPadding,

  /// The horizontal gap between the titles and the leading/trailing widgets.
  ///
  /// If not defined, defaults to 16.
  final double? horizontalTitleGap,

  /// The minimum padding on the top and bottom of the title and subtitle
  /// widgets.
  ///
  /// If not defined, defaults to 4.
  final double? minVerticalPadding,

  /// Defines the font used for the [title].
  ///
  /// If this property is null then [ListTileThemeData.style] is used. If that
  /// is also null then [ListTileStyle.list] is used.
  final ListTileStyle? style,

  /// Defines how [ListTile.leading] and [ListTile.trailing] are
  /// vertically aligned relative to the [ListTile]'s titles
  /// ([ListTile.title] and [ListTile.subtitle]).
  ///
  /// If this property is null then [ListTileThemeData.titleAlignment]
  /// is used. If that is also null then [ListTileTitleAlignment.threeLine]
  /// is used.
  final ListTileTitleAlignment? titleAlignment,

  /// If specified, overrides the default value of
  /// [CheckboxListTile.controlAffinity] or [ExpansionTile.controlAffinity]
  /// or [SwitchListTile.controlAffinity] or [RadioListTile.controlAffinity].
  final ListTileControlAffinity? controlAffinity,
}) {
  final Color selectedColor = FlexSubThemes.schemeColor(
    selectedSchemeColor ?? SchemeColor.primary,
    colorScheme,
  );

  final Color? iconColor = iconSchemeColor == null
      ? null
      : FlexSubThemes.schemeColor(iconSchemeColor, colorScheme);

  final Color? textColor = textSchemeColor == null
      ? null
      : FlexSubThemes.schemeColor(textSchemeColor, colorScheme);

  final Color? tileColor = tileSchemeColor == null
      ? null
      : FlexSubThemes.schemeColor(tileSchemeColor, colorScheme);

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
