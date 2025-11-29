part of '../flex_sub_themes.dart';

/// An opinionated [TabBarThemeData] theme.
///
/// Contrary to the other opinionated static [FlexSubThemes] sub-theme
/// function, this one is only a sub-set of the original and does not do or
/// contain any feature shortcuts.
///
/// The [FlexColorScheme.toTheme] needs some of the properties, like fore-
/// and background colors used here, for other component theme definitions as
/// well and has already computed them once, so they are reused here.
TabBarThemeData _tabBarTheme({
  /// Typically the same [ColorScheme] that is also used for your [ThemeData].
  required final ColorScheme colorScheme,

  /// Overrides the default value for [TabBar.labelStyle].
  final TextStyle? labelStyle,

  /// Overrides the default value for [TabBar.labelColor].
  final Color? labelColor,

  /// Overrides the default value for [TabBar.unselectedLabelColor].
  final Color? unselectedLabelColor,

  /// Overrides the default value for [TabBar.indicatorSize].
  final TabBarIndicatorSize? indicatorSize,

  /// The thickness of the underline border indicator on the [TabBar].
  ///
  /// If not defined, defaults to 2 in M2 and to 3 in M3.
  final double? indicatorWeight,

  // TODO(rydmike): Open issue about using TabAlignment. Theme variant issue.
  /// Overrides the default value for [TabBar.tabAlignment].
  ///
  /// In M3 the default is [TabAlignment.startOffset] if [TabBar] property
  /// [isScrollable] is true, if false the default is [TabAlignment.fill].
  ///
  /// In M2 the default is [TabAlignment.start] if [TabBar] property
  /// [isScrollable] is true, if false the default is [TabAlignment.fill].
  ///
  /// **NOTE:**
  ///
  /// [TabAlignment.start] and [TabAlignment.startOffset] are only usable
  /// when widget sets [TabBar.isScrollable] to true. If used when
  /// [TabBar.isScrollable] is false, the [TabBar] will throw an exception
  /// error.
  ///
  /// Likewise [TabAlignment.fill] is only usable when widgets sets
  /// [TabBar.isScrollable] to false. If used when [TabBar.isScrollable] is
  /// true, the [TabBar] will throw an exception error.
  ///
  /// Only universal theming option usable in a theme, other than widget
  /// default behavior is [TabAlignment.center]. This is not a good
  /// design setup. We need to be able to specify the themed alignment
  /// for both scrollable and non-scrollable [TabBar]s so we can style them
  /// with different alignments. That do not throw for the used [TabBar]
  /// variant.
  final TabAlignment? tabAlignment,

  /// Specifies the animation behavior of the tab indicator in a [TabBar].
  ///
  /// If not defined, the tab indicator will animate linearly if
  /// the [indicatorSize] is [TabBarIndicatorSize.tab], otherwise it will
  /// animate with an elastic effect if the [indicatorSize] is
  /// [TabBarIndicatorSize.label].
  final TabIndicatorAnimation? indicatorAnimation,

  /// The top left and right corner radius of the underline border
  /// indicator on the [TabBar].
  ///
  /// If not defined, defaults to 0 in M2 and to 3 in M3.
  final double? indicatorTopRadius,

  /// Overrides the default value for [TabBar.indicatorColor].
  final Color? indicatorColor,

  /// Overrides the default value for [TabBar.unselectedLabelStyle].
  final TextStyle? unselectedLabelStyle,

  /// The color of the divider.
  ///
  /// If null and [useMaterial3] is true, [TabBarThemeData.dividerColor]
  /// color is used. If that is null and [useMaterial3] is true,
  /// [ColorScheme.outlineVariant] will be used,
  /// otherwise divider will not be drawn.
  final Color? dividerColor,

  /// Defines if the theme uses tinted interaction effects.
  ///
  /// If undefined, defaults to false.
  final bool? useTintedInteraction,

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
  final bool tintInteract = useTintedInteraction ?? false;
  final double weight = indicatorWeight ?? (useM3 ? 3 : 2);
  final double radius = indicatorTopRadius ?? (useM3 ? 3 : 0);

  final Decoration indicator = UnderlineTabIndicator(
    borderRadius: useM3 || indicatorWeight != null
        ? BorderRadius.only(
            topLeft: Radius.circular(radius),
            topRight: Radius.circular(radius),
          )
        : null,
    borderSide: BorderSide(
      width: weight,
      color: indicatorColor ??
          (useM3 ? colorScheme.primary : colorScheme.onSurface),
    ),
  );

  final Color overlayBase =
      labelColor ?? (useM3 ? colorScheme.primary : colorScheme.onPrimary);

  // Only make a custom overlay when we have settings that require it.
  final bool useCustomOverlay = tintInteract ||
      (useM3 && labelColor != colorScheme.primary && labelColor != null) ||
      (!useM3 && labelColor != colorScheme.onPrimary && labelColor != null);

  return TabBarThemeData(
    labelStyle: labelStyle,
    labelColor: labelColor,
    unselectedLabelStyle: unselectedLabelStyle,
    unselectedLabelColor: unselectedLabelColor,
    //
    indicatorSize: indicatorSize,
    indicatorAnimation: indicatorAnimation,
    indicatorColor: indicatorColor,
    indicator: (indicatorWeight != null || indicatorTopRadius != null)
        ? indicator
        : null,
    tabAlignment: tabAlignment,
    dividerColor: dividerColor,
    //
    overlayColor: useCustomOverlay
        ? WidgetStateProperty.resolveWith((Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              if (states.contains(WidgetState.hovered)) {
                return overlayBase.withAlpha(kAlphaHovered);
              }
              if (states.contains(WidgetState.focused)) {
                return overlayBase.withAlpha(kAlphaFocused);
              }
              if (states.contains(WidgetState.pressed)) {
                return overlayBase.withAlpha(kAlphaPressed);
              }
              return null;
            }
            if (states.contains(WidgetState.hovered)) {
              if (tintInteract) return overlayBase.withAlpha(kAlphaHovered);
              return colorScheme.onSurface.withAlpha(kAlphaHovered);
            }
            if (states.contains(WidgetState.focused)) {
              if (tintInteract) return overlayBase.withAlpha(kAlphaFocused);
              return colorScheme.onSurface.withAlpha(kAlphaFocused);
            }
            if (states.contains(WidgetState.pressed)) {
              if (tintInteract) return overlayBase.withAlpha(kAlphaPressed);
              return overlayBase.withAlpha(kAlphaPressed);
            }
            return null;
          })
        : null,
  );
}
