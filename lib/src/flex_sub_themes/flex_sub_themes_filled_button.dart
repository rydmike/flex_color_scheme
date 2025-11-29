part of '../flex_sub_themes.dart';

/// An opinionated [FilledButtonThemeData] theme.
///
/// Requires a [ColorScheme], the color scheme would
/// typically be equal the color scheme also used to define the color scheme
/// for your app theme.
///
/// The adjustable button corner [radius] defaults to Stadium in M3, and FCS
/// uses 20 in M2, where SDK M2 defaults to 4.
FilledButtonThemeData _filledButtonTheme({
  /// Typically the same `ColorScheme` that is also used for your `ThemeData`.
  required final ColorScheme colorScheme,

  /// Selects which color from the passed in colorScheme to use as the
  /// background  color for the filled button.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// The foreground color automatically uses the contrast complementary color
  /// from the SchemeColor.
  ///
  /// If not defined, [colorScheme.primary] will be used.
  final SchemeColor? backgroundSchemeColor,

  /// If not defined, defaults to Stadium border based on
  /// https://m3.material.io/components/buttons/specs
  final double? radius,

  /// Padding for the button theme.
  ///
  /// Defaults to null and uses `styleFrom` constructors default padding.
  ///
  /// M3 has more horizontal padding 24dp, but the tighter default padding
  /// in M2 that is 16dp looks fine as well when using stadium borders
  /// as in M3.
  ///
  /// If null and [useMaterial3] is true in the context, the correct M3
  /// button theme default computed button padding for M3 will be used.
  final EdgeInsetsGeometry? padding,

  /// Minimum button size.
  ///
  /// If null, defaults to [kButtonMinSize] (`const Size(40.0, 40.0)`) when
  /// [useMaterial3] is false and to `const Size(64.0, 40.0)` when
  /// [useMaterial3] is true, via M3 built in defaults.
  final Size? minButtonSize,

  /// The style for the button's [Text] widget descendants.
  ///
  /// The color of the [textStyle] is typically not used directly, the
  /// [foregroundColor] is used instead.
  final WidgetStateProperty<TextStyle?>? textStyle,

  /// Defines if the theme uses tinted interaction effects.
  ///
  /// If undefined, defaults to false.
  final bool? useTintedInteraction,

  /// Defines if the theme uses tinted disabled color.
  ///
  /// If undefined, defaults to false.
  final bool? useTintedDisable,

  /// Creates the [InkWell] splash factory, which defines the appearance of
  /// "ink" splashes that occur in response to taps.
  ///
  /// In M2 mode FlexColorScheme passes in the effective splashFactory
  /// from splashFactory override value or the result from
  /// [FlexSubThemesData] adaptive splash settings. In M3 mode it is kept
  /// null and the default comes via ThemeData.splashFactory, that is has
  /// also defined.
  final InteractiveInkFeatureFactory? splashFactory,

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
  final bool tintDisable = useTintedDisable ?? false;

  // Get background color, defaults to primary.
  final Color background = FlexSubThemes.schemeColor(
    backgroundSchemeColor ?? SchemeColor.primary,
    colorScheme,
  );

  // Get right foreground on color for background, defaults to onPrimary.
  final Color foreground = FlexSubThemes.schemeColorPair(
    backgroundSchemeColor ?? SchemeColor.primary,
    colorScheme,
  );

  // Using these tinted overlay variable in all themes for ease of
  // reasoning and duplication.
  final Color overlay = foreground;
  final Color tint = background;
  final double factor =
      FlexSubThemes._tintAlphaFactor(tint, colorScheme.brightness);

  WidgetStateProperty<Color?>? backgroundColor;
  WidgetStateProperty<Color?>? foregroundColor;
  WidgetStateProperty<Color?>? overlayColor;

  // TODO(rydmike): Monitor FilledButton no variants theming issue.
  // We only define theme props if we have some settings the default
  // widget behavior does not do.
  // We Should do this:
  // if (baseSchemeColor != null || tintInteract || tintDisable) {
  // But due to the theming issue
  // https://github.com/flutter/flutter/issues/118063
  // we only apply the tintInteract and tintDisable if we have a custom
  // color that anyway kills their separate designs.
  if (backgroundSchemeColor != null) {
    backgroundColor = WidgetStateProperty.resolveWith((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.disabled)) {
        if (tintDisable) {
          return FlexSubThemes.tintedDisable(
            colorScheme.onSurface,
            background,
          ).withAlpha(kAlphaVeryLowDisabled);
        }
        return colorScheme.onSurface.withAlpha(kAlphaVeryLowDisabled);
      }
      return background;
    });
    foregroundColor = WidgetStateProperty.resolveWith((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.disabled)) {
        if (tintDisable) {
          return FlexSubThemes.tintedDisable(colorScheme.onSurface, background);
        }
        return colorScheme.onSurface.withAlpha(kAlphaDisabled);
      }
      return foreground;
    });
  } else {
    // We can in fact do tinted disabled TonalButtons, since they have the
    // same style.
    if (tintDisable) {
      backgroundColor = WidgetStateProperty.resolveWith((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.disabled)) {
          if (tintDisable) {
            return FlexSubThemes.tintedDisable(
              colorScheme.onSurface,
              background,
            ).withAlpha(kAlphaVeryLowDisabled);
          }
        }
        return null; // We get default backgroundColor.
      });
      foregroundColor = WidgetStateProperty.resolveWith((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.disabled)) {
          if (tintDisable) {
            return FlexSubThemes.tintedDisable(
                colorScheme.onSurface, background);
          }
        }
        return null; // We get default foregroundColor.
      });
    }
  }
  // TODO(rydmike): Monitor FilledButton no variants theming issue.
  // Temp if, so we get pure default style when tint interact is false, avoids
  // destroying, the correct overlay for default button when we have different
  // tonal and normal filled button. Added as workaround for issue:
  // https://github.com/flutter/flutter/issues/118063
  if (tintInteract) {
    overlayColor = WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.hovered)) {
        if (tintInteract) {
          return FlexSubThemes.tintedHovered(overlay, tint, factor);
        }
        // TODO(rydmike): Temp comment, can't be reached due temp if above.
        // return foreground.withAlpha(kAlphaHovered);
      }
      if (states.contains(WidgetState.focused)) {
        if (tintInteract) {
          return FlexSubThemes.tintedFocused(overlay, tint, factor);
        }
        // TODO(rydmike): Temp comment, can't be reached due temp if above.
        // return foreground.withAlpha(kAlphaFocused);
      }
      if (states.contains(WidgetState.pressed)) {
        if (tintInteract) {
          return FlexSubThemes.tintedPressed(overlay, tint, factor);
        }
        // TODO(rydmike): Temp comment, can't be reached due temp if above.
        // return foreground.withAlpha(kAlphaPressed);
      }
      return null; // We get default overlayColor.
    });
  }

  return FilledButtonThemeData(
    style: ButtonStyle(
      splashFactory: splashFactory,
      textStyle: textStyle,
      foregroundColor: foregroundColor,
      iconColor: foregroundColor,
      backgroundColor: backgroundColor,
      overlayColor: overlayColor,
      minimumSize: ButtonStyleButton.allOrNull<Size>(
        minButtonSize ?? (useM3 ? null : kButtonMinSize),
      ),
      padding: ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(padding),
      shape: radius == null && useM3
          ? null
          : ButtonStyleButton.allOrNull<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(radius ?? kButtonRadius),
                ),
              ),
            ),
    ),
  );
  // }
}
