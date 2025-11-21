part of '../flex_sub_themes.dart';

/// An opinionated [FloatingActionButtonThemeData] with custom border radius.
///
/// The border radius defaults to [kFabRadius] = 16, the new M3 default.
/// https://m3.material.io/components/floating-action-button/specs for the
/// standard sized FAB.
///
/// By setting [useShape] to false, it is possible to opt out of all
/// shape theming on FABs and keep their defaults, while still eg.
/// keeping M3 defaults on other widgets or changing their border radius
/// with the shared global value.
///
/// You may want to continue to keep the FAB circular and extended FAB stadium
/// (pill) shaped as before, despite otherwise using a rounder or M3 design.
/// The circular M2 FAB goes well with those designs too and is more familiar.
FloatingActionButtonThemeData _floatingActionButtonTheme({
  /// Typically the same `ColorScheme` that is also used for your `ThemeData`.
  required final ColorScheme colorScheme,

  /// Select which color from the passed in [colorScheme] parameter to use as
  /// the floating action button background color.
  ///
  /// If not defined, then if [useMaterial3] `colorScheme.secondary` will
  /// be. If [useMaterial3] is true, then `colorScheme.primaryContainer`
  /// will be used.
  ///
  /// The foreground color automatically uses the selected background
  /// color's contrast color pair in the passed in [colorScheme] property.
  final SchemeColor? backgroundSchemeColor,

  /// Select which color from the passed in [colorScheme] parameter to use as
  /// the floating action button foreground color.
  ///
  /// If not defined, effective default is the complement color to used
  /// [backgroundSchemeColor].
  final SchemeColor? foregroundSchemeColor,

  /// Corner radius of the [FloatingActionButton].
  ///
  /// If not defined, defaults to [kFabRadius] 16dp,
  /// based on M3 Specification
  /// https://m3.material.io/components/floating-action-button/specs
  final double? radius,

  /// Set to false to not apply any Shape theming to the FAB.
  ///
  /// If set to false, the Shape property will be kept null, regardless
  /// of what border radius was given, also via `alwaysCircular` property.
  /// This results in that the FAB theme data, will use and implement its
  /// Flutter SDK default shape behavior. Other properties are still used.
  ///
  /// Default to true.
  final bool useShape = true,

  /// Set to true to always use circular and stadium shapes on the FAB.
  ///
  /// If set to true, it overrides `radius` and shape is always circular
  /// or stadium shaped.
  ///
  /// Implementation is via `StadiumBorder` to be able
  /// to support the extended FAB as well. It looks same with Stadium on
  /// the circular cases as the actual Circular FAB using ones in M2, but
  /// implementation is different since we cannot use different themed
  /// shapes for different types of FAB, like the hard coded default
  /// none themed behavior does. See issue
  /// [#107946](https://github.com/flutter/flutter/issues/107946) for
  /// more information.
  ///
  /// Has no impact if `useShape` is false.
  ///
  /// Defaults to false.
  final bool alwaysCircular = false,

  /// The text style for an extended [FloatingActionButton]'s label.
  final TextStyle? extendedTextStyle,

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
  final Color? background = backgroundSchemeColor == null
      ? null
      : FlexSubThemes.schemeColor(backgroundSchemeColor, colorScheme);
  final Color? foreground =
      backgroundSchemeColor == null && foregroundSchemeColor == null
          ? null
          : foregroundSchemeColor != null
              ? FlexSubThemes.schemeColor(foregroundSchemeColor, colorScheme)
              : FlexSubThemes.schemeColorPair(
                  backgroundSchemeColor ??
                      (useM3
                          ? SchemeColor.onPrimaryContainer
                          : SchemeColor.onSecondary),
                  colorScheme,
                );

  final Color overlay = foreground ??
      (useM3 ? colorScheme.onPrimaryContainer : colorScheme.onSecondary);
  final Color tint = background ??
      (useM3 ? colorScheme.primaryContainer : colorScheme.secondary);

  final double factor =
      FlexSubThemes._tintAlphaFactor(tint, colorScheme.brightness);

  return FloatingActionButtonThemeData(
    extendedTextStyle: extendedTextStyle,
    foregroundColor: foreground,
    backgroundColor: background,
    splashColor:
        tintInteract ? FlexSubThemes.tintedSplash(overlay, tint, factor) : null,
    focusColor: tintInteract
        ? FlexSubThemes.tintedFocused(overlay, tint, factor)
        : null,
    hoverColor: tintInteract
        ? FlexSubThemes.tintedHovered(overlay, tint, factor)
        : null,
    shape: useShape
        ? alwaysCircular
            ? const StadiumBorder()
            : RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(radius ?? kFabRadius),
                ),
              )
        : null,
  );
}
