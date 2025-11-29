part of '../flex_sub_themes.dart';

/// An opinionated [NavigationBarThemeData] with a flat API.
///
/// The navigation bar can use opinionated color choices from the passed
/// [colorScheme] to style the bottom navigation bar, it uses "quick"
/// settings not requiring usage of WidgetState property resolutions.
///
/// This sub-theme uses a style that prefers single use config parameters over
/// the ones that combines many styling options into sub-themes and
/// WidgetState properties. This is simpler to use when you want to just
/// modify a single property like size and rest is fine. This is done of
/// course at the expense that the sub-theme instead has a lot of properties.
///
/// [FlexColorScheme] uses this sub theme based on a large number of
/// properties in [FlexSubThemesData] to make custom default styled sub-theme
/// that matches its other themes, it can also use a config that uses the
/// M3 defaults as starting point. In both cases override values can
/// be applied as well.
///
/// You can also use the sub-theme helper as an alternative API for creating
/// a custom sub-theme for [NavigationBarThemeData], as thins one does not
/// need the complicated [WidgetStateProperty] which can be difficult to
/// use. It instead exposes properties for the usable states.
///
/// It can also set an [opacity] on the background color.
NavigationBarThemeData _navigationBarTheme({
  /// Typically the same [ColorScheme] that is also use for your [ThemeData].
  required final ColorScheme colorScheme,

  /// Optional text style for the [NavigationBar] labels.
  ///
  /// The size and colors defined in any of the text size and color properties
  /// are applied as overrides on the text style.
  final TextStyle? labelTextStyle,

  /// The size of the text label on selected [NavigationBar] item.
  ///
  /// If defined, it overrides the font size on effective label TextStyle
  /// on selected item, 12 is used as fallback if needed.
  final double? selectedLabelSize,

  /// The size of the text label on unselected [NavigationBar] items.
  ///
  /// If defined, it overrides the font size on effective label TextStyle
  /// on unselected items, 12 is used as fallback if needed.
  final double? unselectedLabelSize,

  /// Select which color from the passed in [ColorScheme] to use for
  /// the [NavigationBar]'s label text color.
  ///
  /// When undefined, if [backgroundSchemeColor] is defined, its
  /// contrasting on color will be used, if it is also undefined
  /// [SchemeColor.onSurface] will be used.
  ///
  /// Flutter is default is onSurface.
  final SchemeColor? selectedLabelSchemeColor,

  /// Select which color from the theme's [ColorScheme] to for
  /// the [NavigationBar]'s unselected label text color.
  ///
  /// When undefined, if [backgroundSchemeColor] is
  /// using any of the surface colors, the default on pair used will be
  /// [SchemeColor.onSurfaceVariant], instead of [SchemeColor.onSurface]
  /// that is the typical contrast color for surface colors.
  /// This is to make the unselected labels and icons look more muted.
  ///
  /// If other [backgroundSchemeColor] colors are used,
  /// while this value is undefined, their default contrasting onColor will
  /// be used. If the [backgroundSchemeColor] is also undefined,
  /// then this defaults to [SchemeColor.onSurfaceVariant].
  ///
  /// Flutter SDK defaults to [ColorScheme.onSurface] in M2 mode and
  /// [ColorScheme.onSurfaceVariant] in M3 mode.
  final SchemeColor? unselectedLabelSchemeColor,

  // TODO(rydmike): Commented as part of deprecation of blendTextTheme.
  //
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

  /// If true, the unselected label in the [NavigationBar] use a more
  /// muted color version of the color defined by
  /// [unselectedLabelSchemeColor].
  ///
  /// The muting is unselected color with
  /// blendAlpha(unselected color, [kUnselectedBackgroundPrimaryAlphaBlend])
  /// and withAlpha([kUnselectedAlphaBlend]).
  ///
  /// If undefined, defaults to false.
  final bool? mutedUnselectedLabel,

  /// The size of the icon on selected [NavigationBar] item.
  ///
  /// If undefined, defaults to 24.
  final double? selectedIconSize,

  /// The size of the icons on unselected [NavigationBar] items.
  ///
  /// If null, defaults to [selectedIconSize].
  final double? unselectedIconSize,

  /// Select which color from the theme's [ColorScheme] to use for
  /// the [NavigationBar]'s selected item icon color.
  ///
  /// If undefined, and [indicatorSchemeColor] is also
  /// undefined, then defaults to [SchemeColor.onSecondaryContainer].
  /// If undefined, but [indicatorSchemeColor] is defined, then
  /// it defaults to the contrast onColor pair of the indicator color
  /// [indicatorSchemeColor]
  ///
  /// Flutter SDK defaults to [ColorScheme.onSurface] in M2 mode and
  /// [ColorScheme.onSecondaryContainer] in M3.
  final SchemeColor? selectedIconSchemeColor,

  /// Select which color from the theme's [ColorScheme] to use for
  /// the [NavigationBar]'s unselected item icon color.
  ///
  /// When undefined, if [backgroundSchemeColor] is
  /// using any of the surface colors, the default on pair used will be
  /// [SchemeColor.onSurfaceVariant], instead of [SchemeColor.onSurface]
  /// that is the typical contrast color for surface colors.
  /// This is to make the unselected labels and icons look more muted.
  ///
  /// If other [backgroundSchemeColor] colors are used,
  /// while this value is undefined, their default contrasting onColor will
  /// be used. If the [backgroundSchemeColor] is also undefined,
  /// then this defaults to [SchemeColor.onSurfaceVariant].
  ///
  /// Flutter SDK defaults to [ColorScheme.onSurface] in M2 mode and to
  /// [ColorScheme.onSurfaceVariant] in M3 mode.
  final SchemeColor? unselectedIconSchemeColor,

  /// If true, the unselected icon in the [NavigationBar] use a more muted
  /// color version of the color defined by [unselectedIconSchemeColor].
  ///
  /// The muting is unselected color with
  /// blendAlpha(unselected color, [kUnselectedBackgroundPrimaryAlphaBlend])
  /// and withAlpha([kUnselectedAlphaBlend]).
  ///
  /// If undefined, defaults to false.
  final bool? mutedUnselectedIcon,

  /// Select which color from the theme [ColorScheme] to use as base for
  /// the [NavigationBar]'s selected item indicator.
  ///
  /// If undefined, defaults to [SchemeColor.secondaryContainer].
  ///
  /// Flutter SDK defaults to secondaryContainer in M3 mode and to
  /// secondary in M2 mode with opacity 24%.
  final SchemeColor? indicatorSchemeColor,

  /// Select which color from the theme's [ColorScheme] to use as background
  /// color for the [NavigationBar].
  ///
  /// If undefined, defaults to [SchemeColor.surfaceContainer]
  ///
  /// Flutter SDK defaults to surfaceContainer in M3 and in M2 mode to
  /// surface color, with a color overlay using onSurface at
  /// fixed elevation 3.
  final SchemeColor? backgroundSchemeColor,

  /// NavigationBar background opacity.
  ///
  /// If undefined, defaults to 1, fully opaque.
  final double? opacity,

  /// NavigationBar elevation.
  ///
  /// If undefined, defaults to default in M3 mode which is 3 and in
  /// M2 mode 0.
  ///
  /// In M2 mode it defaults [kBottomNavigationBarElevation] = 3.
  final double? elevation,

  /// Overrides the default value of [NavigationBar.surfaceTintColor].
  final Color? surfaceTintColor,

  /// Overrides the default value of [NavigationBar.shadowColor].
  final Color? shadowColor,

  /// Height of the container for the Material 3 [NavigationBar].
  ///
  /// If undefined defaults to M3 spec 80dp.
  final double? height,

  /// Specifies when each [NavigationDestination]'s label should appear.
  ///
  /// This is used to determine the behavior of NavigationBar's destinations.
  ///
  /// If null, theme behavior defaults to
  /// `NavigationDestinationLabelBehavior.alwaysShow` via Flutter SDK default.
  final NavigationDestinationLabelBehavior? labelBehavior,

  /// The alpha value used on selection color of the selection indicator on
  /// the [NavigationBar].
  ///
  /// If not defined, defaults to is 0xFF, or opacity 1.
  ///
  /// Flutter SDK uses 24% in M2 and 100% in M3,
  final int? indicatorAlpha,

  /// Border radius of the selection indicator on the [NavigationBar].
  ///
  /// If not defined, defaults to [StadiumBorder].
  ///
  /// FCS default, follows the Material M3 guide:
  /// https://m3.material.io/components/navigation-bar/specs
  final double? indicatorRadius,

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
  /// The M2/M3 SDK defaults will only be used for properties that are not
  /// defined, if defined they keep their defined values.
  ///
  /// If undefined, defaults to true.
  @Deprecated(
    'The useMaterial3 flag no longer has any function in this '
    'component theme and is deprecated here. It will be removed in v9',
  )
  final bool? useMaterial3,

  /// Set to true to use Flutter SDK defaults for [NavigationBar]
  /// theme when its properties are undefined (null), instead of using
  /// FlexColorScheme's own opinionated defaults.
  ///
  /// Recommend keeping it **false** for a more color harmonized component
  /// theme starting point. This flag can be helpful if you want to create
  /// custom sub-themes starting from less opinionated settings.
  ///
  /// When all required properties are undefined and flag is false or true,
  /// the effective default styles for undefined inputs become:
  ///
  /// ```text
  ///                    FCS defaults   M2 defaults       useMaterial3:true
  /// useFlutterDefaults false          true              true
  /// results in:
  ///
  /// - background       surfaceVariant surface with      surface with
  ///                                   onSurface overlay primary overlay
  ///                    elev 3         elev 0            elev 3
  /// - height           80             80                80
  /// - indicator        primary op24%  secondary op24%   secondaryContainer
  /// - selected icon    primary        onSurface         onSecondaryContainer
  /// - unselected icon  onSurface      onSurface         onSurfaceVariant
  /// - Selected label   primary        onSurface         onSurface
  /// - unSelected label onSurface      onSurface         onSurfaceVariant
  /// - TextTheme        labelMedium    overline          labelMedium
  /// ```
  /// FCS further applies both an alpha blend and slight opacity to
  /// unselected icon and unselected label, but only if
  /// [FlexSubThemesData.navigationBarMutedUnselectedIcon] and
  /// [FlexSubThemesData.navigationBarMutedUnselectedLabel] are true
  /// respectively, this also applies to undefined color inputs.
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
  // Background color, when using normal default, falls back to
  // surfaceContainer.
  final Color backgroundColor = (opacity ?? 1.0) != 1.0 &&
          backgroundSchemeColor != SchemeColor.transparent
      ? FlexSubThemes.schemeColor(
          backgroundSchemeColor ?? SchemeColor.surfaceContainer,
          colorScheme,
        ).withValues(alpha: opacity ?? 1.0)
      : FlexSubThemes.schemeColor(
          backgroundSchemeColor ?? SchemeColor.surfaceContainer,
          colorScheme,
        );

  // Use onSurface as contrast for all selected on surface label colors !!
  final Color onBackGroundColorFallback = FlexSubThemes.schemeColorPair(
    backgroundSchemeColor ?? SchemeColor.surface,
    colorScheme,
  );

  // Use onSurfaceVariant as contrast for all unselected on surface colors !!
  final Color onVariantBackGroundColorFallback = FlexSubThemes.schemeColorPair(
    backgroundSchemeColor ?? SchemeColor.surfaceContainerLow,
    colorScheme,
    useOnSurfaceVariant: true,
  );

  // Get text color, defaults to onSurface.
  final Color labelColor = selectedLabelSchemeColor == null
      ? onBackGroundColorFallback
      : FlexSubThemes.schemeColor(selectedLabelSchemeColor, colorScheme);

  // Get unselected label color, defaults to onSurfaceVariant.
  final Color unselectedLabelColor = unselectedLabelSchemeColor == null
      ? onVariantBackGroundColorFallback
      : FlexSubThemes.schemeColor(unselectedLabelSchemeColor, colorScheme);

  // Get text style, defaults to TextStyle(), we can use it since
  // size and color are applied to is separately.
  final TextStyle textStyle = labelTextStyle ?? const TextStyle();

  // Get effective text sizes.
  final double labelSize = selectedLabelSize ?? textStyle.fontSize ?? 12;
  final double effectiveUnselectedLabelSize = unselectedLabelSize ?? labelSize;

  // Use color pair for indicator, as contrast for selected icon color.
  final Color onIndicatorColorFallback = FlexSubThemes.schemeColorPair(
    indicatorSchemeColor ?? SchemeColor.secondaryContainer,
    colorScheme,
  );

  // Get icon color, defaults to onSecondaryContainer.
  final Color iconColor = selectedIconSchemeColor == null
      ? onIndicatorColorFallback
      : FlexSubThemes.schemeColor(selectedIconSchemeColor, colorScheme);

  // Get unselected icon color, defaults to onSurfaceVariant.
  final Color unselectedIconColor = unselectedIconSchemeColor == null
      ? onVariantBackGroundColorFallback
      : FlexSubThemes.schemeColor(unselectedIconSchemeColor, colorScheme);

  // Get effective icons sizes.
  final double iconSize = selectedIconSize ?? 24;
  final double effectiveUnselectedIconSize = unselectedIconSize ?? iconSize;

  // Indicator color, when using normal default, falls back to
  // secondaryContainer.
  final Color indicatorColor = FlexSubThemes.schemeColor(
    indicatorSchemeColor ?? SchemeColor.secondaryContainer,
    colorScheme,
  ).withAlpha(indicatorAlpha ?? 0xFF);

  return NavigationBarThemeData(
    height: height,
    elevation: elevation,
    backgroundColor: backgroundColor,
    surfaceTintColor: surfaceTintColor,
    shadowColor: shadowColor,
    indicatorColor: indicatorColor,
    indicatorShape: indicatorRadius == null
        ? null
        : RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(indicatorRadius)),
          ),
    labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.selected)) {
        return textStyle.copyWith(fontSize: labelSize, color: labelColor);
      }
      return textStyle.copyWith(
        fontSize: effectiveUnselectedLabelSize,
        color: (mutedUnselectedLabel ?? false)
            ? unselectedLabelColor
                .blendAlpha(unselectedLabelColor, unselectedAlphaBlend)
                .withAlpha(unselectedAlpha)
            : unselectedLabelColor,
      );
    }),
    iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.selected)) {
        return IconThemeData(size: iconSize, color: iconColor);
      }
      return IconThemeData(
        size: effectiveUnselectedIconSize,
        color: (mutedUnselectedIcon ?? false)
            ? unselectedIconColor
                .blendAlpha(unselectedIconColor, unselectedAlphaBlend)
                .withAlpha(unselectedAlpha)
            : unselectedIconColor,
      );
    }),
    labelBehavior: labelBehavior,
  );
}
