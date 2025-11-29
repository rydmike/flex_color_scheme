part of '../flex_sub_themes.dart';

/// An opinionated [NavigationRailThemeData] with simpler API.
///
/// The navigation rail can use opinionated color choices from the passed
/// [colorScheme] to style the navigation rail.
///
/// This sub-theme uses a style that prefers single use config parameters over
/// the ones that combines many styling options into TextStyle and icon
/// sub-theme properties. This is simpler to use when you want to just
/// modify a single property like size and rest is fine. This is done of
/// course at the expense that the sub-theme instead has a lot of properties.
///
/// [FlexColorScheme] uses this sub theme based on a large number of
/// properties in [FlexSubThemesData] to make custom default styled sub-theme
/// that matches its other themes.
///
/// You can also use the sub-theme helper as an alternative API for creating
/// a custom sub-theme for [NavigationRailThemeData].
/// It can also set an [opacity] on the background color, although the use
/// case for it is not as common as on bottom navigation bars.
NavigationRailThemeData _navigationRailTheme({
  /// Typically the same [ColorScheme] that is also use for your [ThemeData].
  required final ColorScheme colorScheme,

  /// Optional text style for the [NavigationRail] labels.
  ///
  /// The size and colors defined in any of the text size and color properties
  /// are applied as overrides on this text style.
  final TextStyle? labelTextStyle,

  /// The size of the text label on selected [NavigationRail] item.
  ///
  /// If defined, it overrides the font size on effective label TextStyle
  /// on selected item.
  ///
  /// If not defined, defaults to 12.
  ///
  /// This is the same size as default labelMedium in the text theme.
  /// FCS uses this for both M2 and M3 mode. Flutter SDK uses 12 in M3 and
  /// 16 in M23 from its bodyLarge text theme.
  final double? selectedLabelSize,

  /// The size of the text label on unselected [NavigationRail] items.
  ///
  /// If defined, it overrides the font size on effective label TextStyle
  /// on selected item.
  ///
  /// If not defined, defaults to 12.
  ///
  /// This is the same size as default labelMedium in the text theme.
  /// FCS uses this for both M2 and M3 mode. Flutter SDK uses 12 in M3 and
  /// 16 in M23 from its bodyLarge text theme.
  final double? unselectedLabelSize,

  /// Select which color from the theme's [ColorScheme] to use for
  /// the [NavigationRail]'s selected label text color.
  ///
  /// When undefined, if [backgroundSchemeColor] is defined, its
  /// contrasting on color will be used, if it is also undefined
  /// [SchemeColor.onSurface] will be used.
  ///
  /// Flutter M2 default is primary, M3 default is onSurface.
  final SchemeColor? selectedLabelSchemeColor,

  /// Select which color from the theme's [ColorScheme] to use for
  /// the [NavigationRails]'s unselected label text color.
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
  /// Flutter Material-2 default is onSurface with opacity 0.64,
  /// In Flutter version 3.38 and earlier, the Material-3 default is also
  /// onSurface. This is a spec BUG in Flutter's Material-3 defaults, it should
  /// be onSurfaceVariant based on M3 specification
  /// https://m3.material.io/components/navigation-rail/specs
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

  /// If true, the unselected label in the [NavigationRail] use a more
  /// muted color version of the color defined by
  /// [unselectedLabelSchemeColor].
  ///
  /// The "muting" is done by using unselected [unselectedLabelSchemeColor]
  /// color and applying:
  ///
  /// .blendAlpha(unselected color, [kUnselectedBackgroundPrimaryAlphaBlend])
  ///
  /// on on it
  ///
  /// .withAlpha([kUnselectedAlphaBlend]).
  ///
  /// If undefined, defaults to false.
  final bool? mutedUnselectedLabel,

  /// The size of the icon on selected [NavigationRail] item.
  ///
  /// If undefined, it defaults to 24.
  ///
  /// Flutter M2 and M3 defaults are 24.
  final double? selectedIconSize,

  /// The size of the icon on unselected [NavigationRail] items.
  ///
  /// If undefined, defaults to [selectedIconSize].
  final double? unselectedIconSize,

  /// Select which color from the theme's [ColorScheme] to use for
  /// the [NavigationRail]'s selected item icon color.
  ///
  /// If undefined, and [indicatorSchemeColor] is also
  /// undefined, then defaults to [SchemeColor.onSecondaryContainer].
  /// If undefined, but [indicatorSchemeColor] is defined, then
  /// it defaults to the contrast onColor pair of the indicator color
  /// [indicatorSchemeColor]
  ///
  /// Flutter Material-2 default is primary, Material-3 default is
  /// onSecondaryContainer.
  final SchemeColor? selectedIconSchemeColor,

  /// Select which color from the passed in [ColorScheme] to use for
  /// the [NavigationRail]'s unselected items icon color.
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
  /// Flutter's Material-2 default is onSurface and in Material-3 it is
  /// onSurfaceVariant.
  final SchemeColor? unselectedIconSchemeColor,

  /// If true, the unselected icon in the [NavigationRail] use a more muted
  /// color version of the color defined by [unselectedIconSchemeColor].
  ///
  /// The "muting" is done by using unselected [unselectedIconSchemeColor]
  /// color and applying:
  ///
  /// .blendAlpha(unselected color, [kUnselectedBackgroundPrimaryAlphaBlend])
  ///
  /// on on it
  ///
  /// .withAlpha([kUnselectedAlphaBlend]).
  ///
  /// If undefined, defaults to false.
  final bool? mutedUnselectedIcon,

  /// Whether or not the selected [NavigationRail] item should include a
  /// [NavigationIndicator].
  ///
  /// If `true`, adds a rounded [NavigationIndicator] behind the selected
  /// destination's icon.
  ///
  /// Defaults to true.
  ///
  /// In Flutter defaults, the default is true in M3 and false in M2.
  final bool? useIndicator,

  /// Select which color from the theme [ColorScheme] to use as base for
  /// the selected [NavigationRails]'s highlighted item.
  ///
  /// If undefined, defaults to [SchemeColor.secondaryContainer].
  ///
  /// Flutter defaults to secondary in M2 and to secondaryContainer in M3.
  final SchemeColor? indicatorSchemeColor,

  /// Select which color from the theme's [ColorScheme] to use as background
  /// color for the [NavigationRail].
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// If undefined, defaults to [SchemeColor.surface].
  final SchemeColor? backgroundSchemeColor,

  /// NavigationRail background opacity.
  ///
  /// If undefined, defaults to 1, fully opaque.
  final double? opacity,

  /// [NavigationRail] elevation.
  ///
  /// If undefined, defaults to [kNavigationRailElevation] = 0.
  ///
  /// Elevation 0 is default for Flutter SDK in both M2 and M3 mode as well.
  final double? elevation,

  /// Defines the layout and behavior of the labels for the
  /// un-extended [NavigationRail].
  ///
  /// The type are:
  ///
  /// * [NavigationRailLabelType.none] labels on rail items are never shown.
  /// * [NavigationRailLabelType.selected] label is only shown on selected
  ///   rail item.
  /// * [NavigationRailLabelType.all] label is shown on all rail items.
  ///
  /// When a navigation rail is [extended], the labels are always shown.
  ///
  /// If null, then the default behavior is [NavigationRailLabelType.none].
  final NavigationRailLabelType? labelType,

  /// The vertical alignment for the group of [destinations] within the
  /// [NavigationRail].
  ///
  /// The [NavigationRailDestination]s are grouped together with the
  /// [trailing] widget, between the [leading] widget and the bottom
  /// of the rail.
  ///
  /// The value must be between -1.0 and 1.0.
  ///
  /// If [groupAlignment] is -1.0, then the items are aligned to the top. If
  /// [groupAlignment] is 0.0, then the items are aligned to the center. If
  /// [groupAlignment] is 1.0, then the items are aligned to the bottom.
  ///
  /// The default is -1.0.
  final double? groupAlignment,

  /// The alpha value used on selection color of the selection indicator on
  /// the [NavigationRail].
  ///
  /// I undefined, defaults to [kNavigationBarIndicatorAlpha],
  /// which is 0x3D = 61 = 24%.
  ///
  /// The default is the same value as Widget SDK default behavior uses on its
  /// used secondary color on its indicator color on the [NavigationBar],
  /// here we use same value on the [NavigationRail].
  /// needed later.
  final int? indicatorAlpha,

  /// Border radius of the selection indicator on the [NavigationBar].
  ///
  /// In M2 mode and when rail is extended, the indicator is always circular.
  ///
  /// If not defined, defaults to [StadiumBorder].
  ///
  /// FCS default, follows the Material M3 guide:
  /// https://m3.material.io/components/navigation-rail/specs.
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

  /// Overrides the default value of [NavigationRail]'s minimum width when it
  /// is not extended.
  ///
  /// If not defined, defaults to M3 spec default value 80 dp.
  ///
  /// Flutter SDK uses 72 in M2 mode and 80 dp in M3 mode.
  final double? minWidth,

  /// Overrides the default value of [NavigationRail]'s minimum width when it
  /// is extended.
  ///
  /// If not defined, defaults to M3 spec default value 256 dp.
  ///
  /// Flutter M2 and M3 use 256 dp as default.
  final double? minExtendedWidth,

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
    'component theme and is deprecated. It will be removed in v9.',
  )
  final bool? useMaterial3,

  /// Set to true to use Flutter SDK defaults for [NavigationRail]
  /// theme when its properties are undefined (null) instead of using
  /// [FlexColorScheme]'s own defaults.
  ///
  /// Recommend keeping it **false** for a more color harmonized component
  /// theme starting point. This flag may be helpful if you want to create
  /// custom sub-themes starting from less opinionated settings.
  ///
  /// Differences when flag is false versus true are:
  ///
  /// ```text
  ///                    FCS defaults    M2 defaults      useMaterial3:true
  /// useFlutterDefaults false           true             true
  /// results in:
  ///
  /// - background       background      surface          surface
  /// - indicator        primary op24%   secondary op24%  secondaryContainer
  /// - selected icon    primary         primary          onSecondaryContainer
  /// - unselected icon  onSurface       onSurface op64%  onSurfaceVariant
  /// - selected label   primary         primary          onSurface
  /// - unSelected label onSurface       onSurface op64%  onSurface
  /// - TextTheme        labelMedium     bodyText1        labelMedium
  /// ```
  /// FCS further applies both an alpha blend and slight opacity to
  /// unselected icon and unselected label, but only if
  /// [FlexSubThemesData.navigationRailMutedUnselectedIcon] and
  /// are [FlexSubThemesData.navigationRailMutedUnselectedLabel] true
  /// respectively, this also applies to undefined color inputs.
  ///
  /// If you want a style that is consistent by default across
  /// [BottomNavigationBar], [NavigationBar] and [NavigationRail],
  /// prefer keeping this setting false.
  ///
  /// Defaults to null.
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
  // Background color, falls back to surface.
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

  // Effective indicator color.
  final Color effectiveIndicatorColor = FlexSubThemes.schemeColor(
    indicatorSchemeColor ?? SchemeColor.secondaryContainer,
    colorScheme,
  ).withAlpha(indicatorAlpha ?? 0xFF);

  // Property order here as in NavigationRailThemeData
  return NavigationRailThemeData(
    backgroundColor: backgroundColor,
    elevation: elevation ?? kNavigationRailElevation,
    unselectedLabelTextStyle: textStyle.copyWith(
      fontSize: effectiveUnselectedLabelSize,
      color: (mutedUnselectedLabel ?? false)
          ? unselectedLabelColor
              .blendAlpha(unselectedLabelColor, unselectedAlphaBlend)
              .withAlpha(unselectedAlpha)
          : unselectedLabelColor,
    ),
    selectedLabelTextStyle: textStyle.copyWith(
      fontSize: labelSize,
      color: labelColor,
    ),
    unselectedIconTheme: IconThemeData(
      size: effectiveUnselectedIconSize,
      opacity: 1,
      color: (mutedUnselectedIcon ?? false)
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
    groupAlignment: groupAlignment,
    labelType: labelType,
    minWidth: minWidth,
    minExtendedWidth: minExtendedWidth,
    useIndicator: useIndicator ?? true,
    indicatorColor: effectiveIndicatorColor,
    indicatorShape: indicatorRadius == null
        ? null
        : RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(indicatorRadius),
            ),
          ),
  );
}
