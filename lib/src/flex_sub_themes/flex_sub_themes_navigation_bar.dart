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
///
/// ## [colorScheme]
///
/// Typically the same [ColorScheme] that is also use for your [ThemeData].
///
/// ## [labelTextStyle]
///
/// Optional text style for the [NavigationBar] labels.
///
/// The size and colors defined in any of the text size and color properties
/// are applied as overrides on the text style.
///
/// ## [selectedLabelSize]
///
/// The size of the text label on selected [NavigationBar] item.
///
/// If defined, it overrides the font size on effective label TextStyle
/// on selected item, 12 is used as fallback if needed.
///
/// ## [unselectedLabelSize]
///
/// The size of the text label on unselected [NavigationBar] items.
///
/// If defined, it overrides the font size on effective label TextStyle
/// on unselected items, 12 is used as fallback if needed.
///
/// ## [selectedLabelSchemeColor]
///
/// Select which color from the passed in [ColorScheme] to use for
/// the [NavigationBar]'s label text color.
///
/// When undefined, if [backgroundSchemeColor] is defined, its
/// contrasting on color will be used, if it is also undefined
/// [SchemeColor.onSurface] will be used.
///
/// Flutter is default is onSurface.
///
/// ## [unselectedLabelSchemeColor]
///
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
///
/// ## [mutedUnselectedLabel]
///
/// If true, the unselected label in the [NavigationBar] use a more
/// muted color version of the color defined by
/// [unselectedLabelSchemeColor].
///
/// The muting is unselected color with
/// blendAlpha(unselected color, [kUnselectedBackgroundPrimaryAlphaBlend])
/// and withAlpha([kUnselectedAlphaBlend]).
///
/// If undefined, defaults to false.
///
/// ## [selectedIconSize]
///
/// The size of the icon on selected [NavigationBar] item.
///
/// If undefined, defaults to 24.
///
/// ## [unselectedIconSize]
///
/// The size of the icons on unselected [NavigationBar] items.
///
/// If null, defaults to [selectedIconSize].
///
/// ## [selectedIconSchemeColor]
///
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
///
/// ## [unselectedIconSchemeColor]
///
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
///
/// ## [mutedUnselectedIcon]
///
/// If true, the unselected icon in the [NavigationBar] use a more muted
/// color version of the color defined by [unselectedIconSchemeColor].
///
/// The muting is unselected color with
/// blendAlpha(unselected color, [kUnselectedBackgroundPrimaryAlphaBlend])
/// and withAlpha([kUnselectedAlphaBlend]).
///
/// If undefined, defaults to false.
///
/// ## [indicatorSchemeColor]
///
/// Select which color from the theme [ColorScheme] to use as base for
/// the [NavigationBar]'s selected item indicator.
///
/// If undefined, defaults to [SchemeColor.secondaryContainer].
///
/// Flutter SDK defaults to secondaryContainer in M3 mode and to
/// secondary in M2 mode with opacity 24%.
///
/// ## [backgroundSchemeColor]
///
/// Select which color from the theme's [ColorScheme] to use as background
/// color for the [NavigationBar].
///
/// If undefined, defaults to [SchemeColor.surfaceContainer]
///
/// Flutter SDK defaults to surfaceContainer in M3 and in M2 mode to
/// surface color, with a color overlay using onSurface at
/// fixed elevation 3.
///
/// ## [opacity]
///
/// NavigationBar background opacity.
///
/// If undefined, defaults to 1, fully opaque.
///
/// ## [elevation]
///
/// NavigationBar elevation.
///
/// If undefined, defaults to default in M3 mode which is 3 and in
/// M2 mode 0.
///
/// In M2 mode it defaults [kBottomNavigationBarElevation] = 3.
///
/// ## [surfaceTintColor]
///
/// Overrides the default value of [NavigationBar.surfaceTintColor].
///
/// ## [shadowColor]
///
/// Overrides the default value of [NavigationBar.shadowColor].
///
/// ## [height]
///
/// Height of the container for the Material 3 [NavigationBar].
///
/// If undefined defaults to M3 spec 80dp.
///
/// ## [labelBehavior]
///
/// Specifies when each [NavigationDestination]'s label should appear.
///
/// This is used to determine the behavior of NavigationBar's destinations.
///
/// If null, theme behavior defaults to
/// [NavigationDestinationLabelBehavior.alwaysShow] via Flutter SDK default.
///
/// ## [indicatorAlpha]
///
/// The alpha value used on selection color of the selection indicator on
/// the [NavigationBar].
///
/// If not defined, defaults to is 0xFF, or opacity 1.
///
/// Flutter SDK uses 24% in M2 and 100% in M3,
///
/// ## [indicatorRadius]
///
/// Border radius of the selection indicator on the [NavigationBar].
///
/// If not defined, defaults to [StadiumBorder].
///
/// FCS default, follows the Material M3 guide:
/// https://m3.material.io/components/navigation-bar/specs
///
/// ## [unselectedAlphaBlend]
///
/// The icon color alpha blend value for unselected items, used on icon when
/// [mutedUnselectedIcon] is true and on label when
/// [mutedUnselectedLabel] is true.
///
/// Defaults to [kUnselectedBackgroundPrimaryAlphaBlend], which is
/// 0x66 = 102 = 40%.
///
/// This setting is not exposed via [FlexSubThemesData], but can be if
/// needed later.
///
/// ## [unselectedAlpha]
///
/// The icon alpha value for unselected item, used on icon when
/// [mutedUnselectedIcon] is true and on label when
/// [mutedUnselectedLabel] is true.
///
/// Defaults to [kUnselectedAlphaBlend], which is
/// 0xA5 = 165 = 65%
///
/// This setting is not exposed via [FlexSubThemesData], but can be if
/// needed later.
NavigationBarThemeData _navigationBarTheme({
  /// Typically the same `ColorScheme` that is also use for your `ThemeData`.
  required ColorScheme colorScheme,

  /// Optional text style for the `NavigationBar` labels.
  TextStyle? labelTextStyle,

  /// The size of the text label on selected `NavigationBar` item.
  double? selectedLabelSize,

  /// The size of the text label on unselected `NavigationBar` items.
  double? unselectedLabelSize,

  /// Select which color from the passed in `ColorScheme` to use for
  /// the `NavigationBar`'s label text color.
  SchemeColor? selectedLabelSchemeColor,

  /// Select which color from the theme's `ColorScheme` to for
  /// the `NavigationBar`'s unselected label text color.
  SchemeColor? unselectedLabelSchemeColor,

  /// If true, the unselected label in the `NavigationBar` use a more
  /// muted color version of the color defined by
  /// `unselectedLabelSchemeColor`.
  bool? mutedUnselectedLabel,

  /// The size of the icon on selected `NavigationBar` item.
  ///
  /// If undefined, defaults to 24.
  double? selectedIconSize,

  /// The size of the icons on unselected `NavigationBar` items.
  ///
  /// If null, defaults to `selectedIconSize`.
  double? unselectedIconSize,

  /// Select which color from the theme's `ColorScheme` to use for
  /// the `NavigationBar`'s selected item icon color.
  SchemeColor? selectedIconSchemeColor,

  /// Select which color from the theme's `ColorScheme` to use for
  /// the `NavigationBar`'s unselected item icon color.
  SchemeColor? unselectedIconSchemeColor,

  /// If true, the unselected icon in the `NavigationBar` use a more muted
  /// color version of the color defined by `unselectedIconSchemeColor`.
  bool? mutedUnselectedIcon,

  /// Select which color from the theme `ColorScheme` to use as base for
  /// the `NavigationBar`'s selected item indicator.
  ///
  /// If undefined, defaults to `SchemeColor.secondaryContainer`.
  SchemeColor? indicatorSchemeColor,

  /// Select which color from the theme's `ColorScheme` to use as background
  /// color for the `NavigationBar`.
  ///
  /// If undefined, defaults to `SchemeColor.surfaceContainer`
  SchemeColor? backgroundSchemeColor,

  /// NavigationBar background opacity.
  ///
  /// If undefined, defaults to 1, fully opaque.
  double? opacity,

  /// NavigationBar elevation.
  ///
  /// If undefined, defaults to default in M3 mode which is 3 and in
  /// M2 mode 0.
  double? elevation,

  /// Overrides the default value of `NavigationBar.surfaceTintColor`.
  Color? surfaceTintColor,

  /// Overrides the default value of `NavigationBar.shadowColor`.
  Color? shadowColor,

  /// Height of the container for the Material 3 `NavigationBar`.
  ///
  /// If undefined defaults to M3 spec 80dp.
  double? height,

  /// Specifies when each `NavigationDestination`'s label should appear.
  NavigationDestinationLabelBehavior? labelBehavior,

  /// The alpha value used on selection color of the selection indicator on
  /// the `NavigationBar`.
  ///
  /// If not defined, defaults to is 0xFF, or opacity 1.
  int? indicatorAlpha,

  /// Border radius of the selection indicator on the `NavigationBar`.
  ///
  /// If not defined, defaults to `StadiumBorder`.
  double? indicatorRadius,

  /// The icon color alpha blend value for unselected items, used on icon when
  /// `mutedUnselectedIcon` is true and on label when
  /// `mutedUnselectedLabel` is true.
  ///
  /// Defaults to `kUnselectedBackgroundPrimaryAlphaBlend`, which is
  /// 0x66 = 102 = 40%.
  int unselectedAlphaBlend = kUnselectedBackgroundPrimaryAlphaBlend,

  /// The icon alpha value for unselected item, used on icon when
  /// `mutedUnselectedIcon` is true and on label when
  /// `mutedUnselectedLabel` is true.
  ///
  /// Defaults to `kUnselectedAlphaBlend`, which is
  /// 0xA5 = 165 = 65%
  int unselectedAlpha = kUnselectedAlphaBlend,
}) {
  // Background color, when using normal default, falls back to
  // surfaceContainer.
  final Color backgroundColor = (opacity ?? 1.0) != 1.0 && backgroundSchemeColor != SchemeColor.transparent
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
            ? unselectedLabelColor.blendAlpha(unselectedLabelColor, unselectedAlphaBlend).withAlpha(unselectedAlpha)
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
            ? unselectedIconColor.blendAlpha(unselectedIconColor, unselectedAlphaBlend).withAlpha(unselectedAlpha)
            : unselectedIconColor,
      );
    }),
    labelBehavior: labelBehavior,
  );
}
