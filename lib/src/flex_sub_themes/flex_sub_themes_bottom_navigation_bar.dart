part of '../flex_sub_themes.dart';

/// An opinionated [BottomNavigationBarThemeData] with custom elevation.
///
/// This sub-theme uses a style that prefers single use config parameters over
/// the ones that combines many styling options into TextStyle and icon
/// sub-theme properties. This is simpler to use when you want to
/// modify a single property like size and rest is fine. This of course comes
/// at the expense that the sub-theme instead has more properties.
///
/// Its [elevation] defaults to [kBottomNavigationBarElevation] = 0.
///
/// The bottom navigation bar uses opinionated colors choices from the passed
/// [colorScheme] to style the bottom navigation bar.
///
/// Background [opacity] can be set.
BottomNavigationBarThemeData _bottomNavigationBarTheme({
  /// Typically you would pass the same [ColorScheme] that is also used in
  /// your [ThemeData] definition.
  required final ColorScheme colorScheme,

  /// Optional text style for the [BottomNavigationBar] labels.
  ///
  /// If not defined [bodyMedium] will be used as base style for the style.
  ///
  /// The size and colors defined in any of the text size and color properties
  /// are applied as overrides on the text style.
  final TextStyle? labelTextStyle,

  /// The size of the text label on selected [BottomNavigationBar] item.
  ///
  /// If defined, it overrides the font size on effective label TextStyle
  /// on selected item
  ///
  /// Defaults to 14.
  final double? selectedLabelSize,

  /// The size of the text label on unselected [BottomNavigationBar] items.
  ///
  /// If defined, it overrides the font size on effective label TextStyle
  /// on unselected items. Defaults to [selectedLabelSize] - 2, but min 8.
  /// Smaller than 8dp is not legible on most screens.
  ///
  /// [BottomNavigationBar] uses this -2dp smaller font on the unselected
  /// label as default, since it is so based on Material-2 spec. By assigning
  /// same value as to selectedLabelSize, you can make them the same size.
  final double? unselectedLabelSize,

  /// Select which color from the theme's [ColorScheme] to use for
  /// the [BottomNavigationBar]'s selected label text color.
  ///
  /// If undefined, defaults to [SchemeColor.primary].
  final SchemeColor? selectedLabelSchemeColor,

  /// Select which color from the theme's [ColorScheme] to use for
  /// the [BottomNavigationBar]'s unselected label text color.
  ///
  /// When undefined, if [backgroundSchemeColor] is
  /// using any of the surface colors, the default on pair used will be
  /// [SchemeColor.onSurfaceVariant], instead of [SchemeColor.onSurface]
  /// that is the typical contrast color for surface colors.
  /// This is to make the unselected labels and icons look more muted.
  ///
  /// If other [backgroundSchemeColor] colors are used,
  /// while this value is undefined, their default contrasting onColor will
  /// be used. If the [backgroundSchemeColor] is also
  /// undefined, then in Material-3 this defaults to
  /// [SchemeColor.onSurfaceVariant] and in Material-2 to
  /// [SchemeColor.onSurface].
  ///
  /// Flutter SDK defaults to [ThemeData.unselectedWidgetColor] which is
  /// [Colors.black54] in light mode and [Colors.white70] in dark.
  final SchemeColor? unselectedLabelSchemeColor,

  /// If true, the unselected labels in the [BottomNavigationBar] use a
  /// more muted color version of the color defined by
  /// [unselectedLabelSchemeColor].
  ///
  /// If undefined, defaults to true in Material-2 and to false in Material-3.
  ///
  /// When true, this is visually similar to the default styling used in
  /// Material-2, but it is on purpose not an exact match, it is bit more
  /// color expressive.
  final bool? mutedUnselectedLabel,

  /// The size of the icon on selected [BottomNavigationBar] item.
  ///
  /// If undefined, it defaults to 24.
  final double? selectedIconSize,

  /// The size of the icons on unselected [BottomNavigationBar] items.
  ///
  /// If undefined, defaults to [selectedIconSize].
  final double? unselectedIconSize,

  /// Select which color from the theme's [ColorScheme] to use for
  /// the [BottomNavigationBar]'s selected item icon color.
  ///
  /// If undefined, defaults to [SchemeColor.primary].
  final SchemeColor? selectedIconSchemeColor,

  /// Select which color from the passed in [ColorScheme] to use as base for
  /// the [BottomNavigationBar]'s unselected items icon color.
  ///
  /// When undefined, if [backgroundSchemeColor] is
  /// using any of the surface colors, the default on pair used will be
  /// [SchemeColor.onSurfaceVariant], instead of [SchemeColor.onSurface]
  /// that is the typical contrast color for surface colors.
  /// This is to make the unselected labels and icons look more muted.
  ///
  /// If other [backgroundSchemeColor] colors are used,
  /// while this value is undefined, their default contrasting onColor will
  /// be used. If the [backgroundSchemeColor] is also
  /// undefined, then in Material-3 this defaults to
  /// [SchemeColor.onSurfaceVariant] and in Material-2 to
  /// [SchemeColor.onSurface].
  ///
  /// Flutter SDK defaults to [ThemeData.unselectedWidgetColor] which is
  /// [Colors.black54] in light mode and [Colors.white70] in dark.
  final SchemeColor? unselectedIconSchemeColor,

  // TODO(rydmike): Commented as part of deprecation of blendTextTheme.
  // An alternative unselected item color.
  //
  // It is used as fallback if [unselectedIconSchemeColor] is not specified,
  // before its normal default fallbacks.
  //
  // The color is typically used to provide the color created by blended or
  // tinted text theme, when it is being used by FlexColorScheme as an
  // `onSurfaceVariant` equivalent style, but a bit more primary tinted.
  //
  // FlexColorScheme passes in its `onSurfaceVariantBlendedTextStyle` when
  // a blended TextTheme is being used.
  // final Color? altUnselectedColor,

  /// If true, the unselected icon in the [BottomNavigationBar] use a more
  /// muted color version of the color defined by
  /// [bottomNavigationBarUnselectedIconSchemeColor].
  ///
  /// The muting is unselected color with
  /// blendAlpha(unselected color, [kUnselectedBackgroundPrimaryAlphaBlend])
  /// and withAlpha([kUnselectedAlphaBlend]).
  ///
  /// If undefined, defaults to true in Material-2 and to false in Material-3.
  ///
  /// When true, this is visually similar to the default styling used in
  /// Material-2, but it is on purpose not an exact match, it is bit more
  /// color expressive.
  final bool? mutedUnselectedIcon,

  /// Select which color from the theme's [ColorScheme] to use as background
  /// color for the [BottomNavigationBar].
  ///
  /// If undefined, defaults to [SchemeColor.surface].
  ///
  /// Flutter defaults to [ThemeData.canvasColor] from the [Material] widgets
  /// default color. Typically this is same as [ColorScheme.surface], or it
  /// should and will be, since [ColorScheme.background] is deprecated.
  final SchemeColor? backgroundSchemeColor,

  /// BottomNavigationBar background opacity.
  ///
  /// If undefined, defaults to 1, fully opaque.
  final double? opacity,

  /// [BottomNavigationBar] container elevation.
  ///
  /// If not defined, defaults to component theme defaults to
  /// [kBottomNavigationBarElevation] = 3.
  final double? elevation,

  /// Whether the labels are shown for the selected
  /// [BottomNavigationBarItem].
  final bool? showSelectedLabels,

  /// Whether the labels are shown for the unselected
  /// [BottomNavigationBarItem]s.
  final bool? showUnselectedLabels,

  /// Defines the layout and behavior of a [BottomNavigationBar].
  ///
  /// With [BottomNavigationBarType.fixed] the items have fixed width.
  /// With [BottomNavigationBarType.shifting], the location and size of the
  /// items animate and labels fade in when they are tapped.
  ///
  /// If undefined, defaults to Flutter SDK default. Where
  /// If type is provided, it is returned. Next, if the bottom navigation bar
  /// theme provides a type, it is used. Finally, the default behavior will be
  /// [BottomNavigationBarType.fixed] for 3 or fewer items, and
  /// [BottomNavigationBarType.shifting] is used for 4+ items.
  final BottomNavigationBarType? type,

  /// The arrangement of the bar's [items] when the enclosing
  /// [MediaQueryData.orientation] is [Orientation.landscape].
  ///
  /// The following alternatives are supported:
  ///
  /// * [BottomNavigationBarLandscapeLayout.spread] - the items are
  ///   evenly spaced and spread out across the available width. Each
  ///   item's label and icon are arranged in a column.
  /// * [BottomNavigationBarLandscapeLayout.centered] - the items are
  ///   evenly spaced in a row but only consume as much width as they
  ///   would in portrait orientation. The row of items is centered within
  ///   the available width. Each item's label and icon are arranged
  ///   in a column.
  /// * [BottomNavigationBarLandscapeLayout.linear] - the items are
  ///   evenly spaced and each item's icon and label are lined up in a
  ///   row instead of a column.
  ///
  /// Defaults to [BottomNavigationBarLandscapeLayout.spread] via
  /// Widget's default un-themed behavior.
  final BottomNavigationBarLandscapeLayout? landscapeLayout,

  /// The icon color alpha blend value for unselected items, used on icon when
  /// [mutedUnselectedIcon] is true and on label when
  /// [mutedUnselectedLabel] is true.
  ///
  /// Defaults to [kUnselectedBackgroundPrimaryAlphaBlend], which is
  /// 0x66 = 102 = 40%.
  ///
  /// This setting is not exposed via [FlexSubThemesData], but can be if
  /// needed later.
  final int unselectedAlphaBlend = kUnselectedBackgroundPrimaryAlphaBlend,

  /// The icon alpha value for unselected item, used on icon when
  /// [mutedUnselectedIcon] is true and on label when
  /// [mutedUnselectedLabel] is true.
  ///
  /// Defaults to [kUnselectedAlphaBlend], which is
  /// 0xA5 = 165 = 65%
  ///
  /// This setting is not exposed via [FlexSubThemesData], but can be if
  /// needed later.
  final int unselectedAlpha = kUnselectedAlphaBlend,

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

  /// Set to true to use Flutter SDK defaults for [BottomNavigationBar]
  /// theme when its color, size and text style properties are undefined,
  /// instead of using [FlexColorScheme]'s own defaults.
  ///
  /// Recommend keeping it **false** for a more color harmonized component
  /// theme starting point. This flag may be helpful if you want to create
  /// custom sub-themes starting from less opinionated settings.
  ///
  /// When all required properties are undefined and flag is false or true,
  /// the effective default styles for undefined inputs become:
  ///
  /// ```text
  ///                    FCS defaults   Flutter defaults
  /// useFlutterDefaults false          true
  /// - background       background     background
  /// - selected icon    primary        light: theme primary, dark: secondary
  /// - Selected label   primary        light: theme primary, dark: secondary
  /// - unselected icon  onSurface      light: black54, dark: white70
  /// - unSelected label onSurface      light: black54, dark: white70
  /// ```
  /// FCS further applies both an alpha blend and slight opacity to
  /// unselected icon and unselected label, but only if
  /// [FlexSubThemesData.bottomNavigationBarMutedUnselectedIcon] and
  /// [FlexSubThemesData.bottomNavigationBarMutedUnselectedLabel] are true,
  /// respectively, this also applies to undefined color inputs.
  ///
  /// When muted unselected options are true, the difference to Flutter
  /// default for unselected items is subtle, FCS has a bit more contrast.
  @Deprecated(
    'The `useFlutterDefaults` is deprecated, it no longer has any '
    'function and will be removed in v9. FlexColorScheme in M3 mode '
    'defaults to using mostly Flutter defaults styles. '
    'For other configurations modify the theme as desired. '
    'In M2 mode FCS will continue to use its own opinionated defaults for '
    'as long as M2 exists.',
  )
  final bool? useFlutterDefaults,
}) {
  final bool useM3 = useMaterial3 ?? true;

  // Background color, when using normal default, falls back to surface
  final Color backgroundColor = (opacity ?? 1.0) != 1.0 &&
          backgroundSchemeColor != SchemeColor.transparent
      ? FlexSubThemes.schemeColor(
          backgroundSchemeColor ?? SchemeColor.surface,
          colorScheme,
        ).withValues(alpha: opacity ?? 1.0)
      : FlexSubThemes.schemeColor(
          backgroundSchemeColor ?? SchemeColor.surface,
          colorScheme,
        );

  // Use onSurfaceVariant as contrast for all unselected on surface colors !!
  final Color onVariantBackGroundColorFallback = FlexSubThemes.schemeColorPair(
    backgroundSchemeColor ?? SchemeColor.surfaceContainerLow,
    colorScheme,
    useOnSurfaceVariant: useM3,
  );

  // Get text color, defaults to primary.
  final Color labelColor = FlexSubThemes.schemeColor(
    selectedLabelSchemeColor ?? SchemeColor.primary,
    colorScheme,
  );

  // Get unselected label color, defaults to onSurfaceVariant.
  final Color unselectedLabelColor = unselectedLabelSchemeColor == null
      ? onVariantBackGroundColorFallback
      : FlexSubThemes.schemeColor(unselectedLabelSchemeColor, colorScheme);

  // Get selected text style, defaults to TextStyle(), we can use it since
  // size and color are applied to is separately.
  final TextStyle textStyle = labelTextStyle ?? const TextStyle();

  // Get effective text sizes.
  final double labelSize = selectedLabelSize ?? textStyle.fontSize ?? 14;
  // If not specified, unselected is label size, use 2dp smaller than
  // selected, but always at least 8dp.
  final double effectiveUnselectedLabelSize =
      unselectedLabelSize ?? math.max(labelSize - 2, 8);

  // Get icon color, defaults to primary.
  final Color iconColor = FlexSubThemes.schemeColor(
    selectedIconSchemeColor ?? SchemeColor.primary,
    colorScheme,
  );

  // Get unselected icon color, defaults to onSurfaceVariant.
  final Color unselectedIconColor = unselectedIconSchemeColor == null
      ? onVariantBackGroundColorFallback
      : FlexSubThemes.schemeColor(unselectedIconSchemeColor, colorScheme);

  // Get effective icons sizes.
  final double iconSize = selectedIconSize ?? 24;
  final double effectiveUnselectedIconSize = unselectedIconSize ?? iconSize;

  return BottomNavigationBarThemeData(
    backgroundColor: backgroundColor,
    elevation: elevation ?? kBottomNavigationBarElevation,
    unselectedIconTheme: IconThemeData(
      size: effectiveUnselectedIconSize,
      opacity: 1,
      color: (mutedUnselectedIcon ?? !useM3)
          ? unselectedIconColor
              .blendAlpha(unselectedIconColor, unselectedAlphaBlend)
              .withAlpha(unselectedAlpha)
          : unselectedIconColor,
    ),
    selectedIconTheme: IconThemeData(
      size: iconSize,
      opacity: 1,
      color: iconColor,
    ),
    selectedItemColor: labelColor,
    unselectedItemColor: (mutedUnselectedLabel ?? !useM3)
        ? unselectedLabelColor
            .blendAlpha(unselectedLabelColor, unselectedAlphaBlend)
            .withAlpha(unselectedAlpha)
        : unselectedLabelColor,
    unselectedLabelStyle: textStyle.copyWith(
      fontSize: effectiveUnselectedLabelSize,
      color: (mutedUnselectedLabel ?? !useM3)
          ? unselectedLabelColor
              .blendAlpha(unselectedLabelColor, unselectedAlphaBlend)
              .withAlpha(unselectedAlpha)
          : unselectedLabelColor,
    ),
    selectedLabelStyle: textStyle.copyWith(
      fontSize: labelSize,
      color: labelColor,
    ),
    showSelectedLabels: showSelectedLabels,
    showUnselectedLabels: showUnselectedLabels,
    type: type,
    landscapeLayout: landscapeLayout,
  );
}
