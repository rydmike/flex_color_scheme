part of '../flex_sub_themes.dart';

/// An opinionated [NavigationDrawerThemeData] theme with simpler API.
///
/// Can set [indicatorWidth], [indicatorRadius], [backgroundSchemeColor] and
/// [indicatorSchemeColor] plus its opacity [indicatorOpacity] and colors
/// for selected and unselected items [selectedItemSchemeColor],
/// [unselectedItemSchemeColor].
NavigationDrawerThemeData _navigationDrawerTheme({
  /// Typically the same [ColorScheme] that is also used for your [ThemeData].
  required final ColorScheme colorScheme,

  /// Defines which [Theme] based [ColorScheme] based background color
  /// of [NavigationDrawer].
  ///
  /// If it is not defined, FCS uses [surfaceContainerLow] color as default in
  /// both M2 and M3 mode
  ///
  /// Flutter SDK default uses [surfaceContainerLow] color as default in M3,
  /// and [ThemeData.canvasColor] in M2.
  final SchemeColor? backgroundSchemeColor,

  /// Defines the width of [NavigationDrawer]'s indicator.
  ///
  /// If not defined, defaults to 336dp
  /// via Flutter SDK defaults for M3/M2. The 336dp width values is derived
  /// from the M3 padding spec of 12dp around both sides of the M3 drawers
  /// default width of 360dp.
  final double? indicatorWidth,

  /// Border radius of the selection indicator on the [NavigationDrawer].
  ///
  /// If not defined, defaults to [StadiumBorder].
  ///
  /// FCS default, follows the Material M3 guide:
  /// https://m3.material.io/components/navigation-drawer/specs
  final double? indicatorRadius,

  /// The TextStyle of the labels.
  ///
  /// You would pass in Theme.of(context).textTheme.labelLarge
  /// for correct M3 style.
  final TextStyle? textStyle,

  /// Defines which [Theme] based [ColorScheme] based color [NavigationDrawer]
  /// uses as as its background color on the selection indicator.
  ///
  /// If undefined, defaults to [SchemeColor.secondaryContainer].
  final SchemeColor? indicatorSchemeColor,

  /// The opacity of the used indicator.
  ///
  /// Defaults to 1, fully opaque if not defined.
  final double? indicatorOpacity,

  /// Defines which [Theme] based [ColorScheme] based color [NavigationDrawer]
  /// uses as as its selected item color.
  ///
  /// If undefined, defaults to correct contrast color pair
  /// for [indicatorSchemeColor].
  final SchemeColor? selectedItemSchemeColor,

  /// Defines which [Theme] based [ColorScheme] based color [NavigationDrawer]
  /// uses as as its unselected item color.
  ///
  /// If undefined, defaults to correct contrast color pair for
  /// [backgroundSchemeColor].
  final SchemeColor? unselectedItemSchemeColor,

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

  /// Overrides the default value of [NavigationDrawer.shadowColor].
  final Color? shadowColor,

  /// Overrides the default value of [NavigationDrawer.surfaceTintColor].
  final Color? surfaceTintColor,
}) {
  // TODO(rydmike): Drawer indicator tint effect, not supported in Flutter yet
  // See issue: https://github.com/flutter/flutter/issues/123507
  // final bool tintInteract = useTintedInteraction ?? true;

  // Get selected background color, defaults to surface.
  final Color backgroundColor = FlexSubThemes.schemeColor(
    backgroundSchemeColor ?? SchemeColor.surfaceContainerLow,
    colorScheme,
  );

  // Use onSurfaceVariant as contrast for all surface colors !!
  final Color onBackGroundColorFallback = FlexSubThemes.schemeColorPair(
    backgroundSchemeColor ?? SchemeColor.surfaceContainerLow,
    colorScheme,
    useOnSurfaceVariant: true,
  );

  final Color onBackgroundColor = unselectedItemSchemeColor != null
      ? FlexSubThemes.schemeColor(unselectedItemSchemeColor, colorScheme)
      : onBackGroundColorFallback;

  // Selected indicator color
  final Color indicatorColor = FlexSubThemes.schemeColor(
    indicatorSchemeColor ?? SchemeColor.secondaryContainer,
    colorScheme,
  );
  final Color onIndicatorColorFallback = FlexSubThemes.schemeColorPair(
    indicatorSchemeColor ?? SchemeColor.secondaryContainer,
    colorScheme,
  );
  final Color onIndicatorColor = selectedItemSchemeColor != null
      ? FlexSubThemes.schemeColor(selectedItemSchemeColor, colorScheme)
      : onIndicatorColorFallback;

  // Indicator size based on provided width
  final Size indicatorSize = Size(indicatorWidth ?? 336, 56);

  // TextStyle
  final TextStyle style = textStyle ?? const TextStyle();

  // TODO(rydmike): Removed interaction tint, not supported in Flutter yet.
  // See issue: https://github.com/flutter/flutter/issues/123507
  //
  // // Using these tinted overlay variables in all themes for ease of
  // // reasoning and duplication.
  // final Color overlay = backgroundColor;
  // final Color tint = indicatorColor;
  // final double factor =
  // FlexSubThemes._tintAlphaFactor(tint, colorScheme.brightness, true);

  // TODO(rydmike): Would need something like this for tinted indicator.
  // See issue: https://github.com/flutter/flutter/issues/123507
  //  This does not work due to limitations in Flutter SDK implementation.
  //  All we can get is ThemeData based themed hover, press, focus
  //  Report this limitation!

  // Color? indicatorStateColor() =>
  //     WidgetStateColor.resolveWith((Set<WidgetState> states) {
  //       if (states.contains(WidgetState.selected)) {
  //         if (states.contains(WidgetState.pressed)) {
  //           if (tintInteract) return FlexSubThemes.tintedPressed(overlay,
  //           tint, factor);
  //           return indicatorColor.withAlpha(kAlphaPressed);
  //         }
  //         if (states.contains(WidgetState.hovered)) {
  //           if (tintInteract) return FlexSubThemes.tintedHovered(overlay,
  //           tint, factor);
  //           return indicatorColor.withAlpha(kAlphaHovered);
  //         }
  //         if (states.contains(WidgetState.focused)) {
  //           if (tintInteract) return FlexSubThemes.tintedFocused(overlay,
  //           tint, factor);
  //           return indicatorColor.withAlpha(kAlphaFocused);
  //         }
  //         return indicatorColor;
  //       }
  //
  //       if (states.contains(WidgetState.hovered)) {
  //         if (tintInteract) return FlexSubThemes.tintedPressed(overlay,
  //         tint, factor);
  //         return colorScheme.primary.withAlpha(kAlphaPressed);
  //       }
  //       if (states.contains(WidgetState.hovered)) {
  //         if (tintInteract) return FlexSubThemes.tintedHovered(overlay,
  //         tint, factor);
  //         return colorScheme.onSurface.withAlpha(kAlphaHovered);
  //       }
  //       if (states.contains(WidgetState.focused)) {
  //         if (tintInteract) return FlexSubThemes.tintedHovered(overlay,
  //         tint, factor);
  //         return colorScheme.primary.withAlpha(kAlphaHovered);
  //       }
  //       return Colors.transparent;
  //     });

  return NavigationDrawerThemeData(
    backgroundColor: backgroundColor,
    indicatorColor: indicatorColor.withValues(alpha: indicatorOpacity ?? 1.0),
    indicatorSize: indicatorSize,
    surfaceTintColor: surfaceTintColor,
    shadowColor: shadowColor,
    indicatorShape: indicatorRadius == null
        ? null
        : RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(indicatorRadius),
            ),
          ),
    labelTextStyle: WidgetStateProperty.resolveWith((
      Set<WidgetState> states,
    ) {
      return style.apply(
        color: states.contains(WidgetState.selected)
            ? onIndicatorColor
            : onBackgroundColor,
      );
    }),
    iconTheme: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      return IconThemeData(
        size: 24.0,
        color: states.contains(WidgetState.selected)
            ? onIndicatorColor
            : onBackgroundColor,
      );
    }),
  );
}
