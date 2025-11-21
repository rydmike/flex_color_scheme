part of '../flex_sub_themes.dart';

/// An opinionated [RadioThemeData] theme.
///
/// Requires a [ColorScheme] in [colorScheme]. The color scheme would
/// typically be equal the color scheme also used to define the color scheme
/// for your app theme.
///
/// The splashRadius is not used by FlexColorScheme sub-themes.
RadioThemeData _radioTheme({
  /// Typically the same `ColorScheme` that is also used for your `ThemeData`.
  required final ColorScheme colorScheme,

  /// Selects which color from the passed in colorScheme to use as the main
  /// color for the radio button.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// If not defined, [colorScheme.primary] will be used. This is more in-line
  /// with M3 design, but applied to M2 Radio. The M3 color design
  /// specification for the secondary color, is a poor choice for toggles and
  /// switches, primary color works better.
  final SchemeColor? baseSchemeColor,

  /// The splash radius of the circular Material ink response.
  ///
  /// Defaults to kRadialReactionRadius = 20.
  final double? splashRadius,

  /// Defines if unselected [Radio] is also themed to be [baseSchemeColor].
  ///
  /// If false, it is grey like in Flutter SDK. Defaults to true.
  ///
  /// If undefined, defaults to false.
  final bool? unselectedIsColored,

  /// Defines if the theme uses tinted interaction effects.
  ///
  /// If undefined, defaults to false.
  final bool? useTintedInteraction,

  /// Defines if the theme uses tinted disabled color.
  ///
  /// If undefined, defaults to false.
  final bool? useTintedDisable,

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
  final bool unselectedColored = unselectedIsColored ?? false;
  final bool tintInteract = useTintedInteraction ?? false;
  final bool tintDisable = useTintedDisable ?? false;

  // Get selected color, defaults to primary.
  final Color baseColor = FlexSubThemes.schemeColor(
    baseSchemeColor ?? SchemeColor.primary,
    colorScheme,
  );
  final bool isLight = colorScheme.brightness == Brightness.light;

  // Using these tinted overlay variable in all themes for ease of
  // reasoning and duplication.
  final Color overlay = colorScheme.surface;
  final Color tint = baseColor;
  final double factor =
      FlexSubThemes._tintAlphaFactor(tint, colorScheme.brightness, true);

  return RadioThemeData(
    splashRadius: splashRadius,
    fillColor: WidgetStateProperty.resolveWith<Color>((
      Set<WidgetState> states,
    ) {
      if (useM3) {
        if (states.contains(WidgetState.selected)) {
          if (states.contains(WidgetState.disabled)) {
            if (tintDisable) {
              return FlexSubThemes.tintedDisable(
                  colorScheme.onSurface, baseColor);
            }
            return colorScheme.onSurface.withAlpha(kAlphaDisabled);
          }
          if (states.contains(WidgetState.pressed)) {
            return baseColor;
          }
          if (states.contains(WidgetState.hovered)) {
            return baseColor;
          }
          if (states.contains(WidgetState.focused)) {
            return baseColor;
          }
          return baseColor;
        }
        if (states.contains(WidgetState.disabled)) {
          if (tintDisable) {
            return FlexSubThemes.tintedDisable(
                colorScheme.onSurface, baseColor);
          }
          return colorScheme.onSurface.withAlpha(kAlphaDisabled);
        }
        if (states.contains(WidgetState.pressed)) {
          if (unselectedColored) return baseColor.withAlpha(kAlphaUnselect);
          return colorScheme.onSurface;
        }
        if (states.contains(WidgetState.hovered)) {
          if (unselectedColored) return baseColor.withAlpha(kAlphaUnselect);
          return colorScheme.onSurface;
        }
        if (states.contains(WidgetState.focused)) {
          if (unselectedColored) return baseColor.withAlpha(kAlphaUnselect);
          return colorScheme.onSurface;
        }
        if (unselectedColored) return baseColor.withAlpha(kAlphaUnselect);
        return colorScheme.onSurfaceVariant;
      } else {
        if (states.contains(WidgetState.disabled)) {
          if (tintDisable) {
            return FlexSubThemes.tintedDisable(
                colorScheme.onSurface, baseColor);
          }
          return isLight ? Colors.grey.shade400 : Colors.grey.shade800;
        }
        if (states.contains(WidgetState.selected)) {
          return baseColor;
        }
        if (unselectedColored) {
          return baseColor.withAlpha(kAlphaUnselect);
        }
        // This is SDK default.
        return isLight ? Colors.black54 : Colors.white70;
      }
    }),
    overlayColor: WidgetStateProperty.resolveWith<Color>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.selected)) {
        if (states.contains(WidgetState.pressed)) {
          if (tintInteract) {
            return FlexSubThemes.tintedPressed(overlay, tint, factor);
          }
          return colorScheme.onSurface.withAlpha(kAlphaPressed);
        }
        if (states.contains(WidgetState.hovered)) {
          if (tintInteract) {
            return FlexSubThemes.tintedHovered(overlay, tint, factor);
          }
          return baseColor.withAlpha(kAlphaHovered);
        }
        if (states.contains(WidgetState.focused)) {
          if (tintInteract) {
            return FlexSubThemes.tintedFocused(overlay, tint, factor);
          }
          return baseColor.withAlpha(kAlphaFocused);
        }
        return Colors.transparent;
      }
      if (states.contains(WidgetState.pressed)) {
        if (tintInteract) {
          return FlexSubThemes.tintedPressed(overlay, tint, factor);
        }
        return baseColor.withAlpha(kAlphaPressed);
      }
      if (states.contains(WidgetState.hovered)) {
        if (tintInteract) {
          return FlexSubThemes.tintedHovered(overlay, tint, factor);
        }
        return colorScheme.onSurface.withAlpha(kAlphaHovered);
      }
      if (states.contains(WidgetState.focused)) {
        if (tintInteract) {
          return FlexSubThemes.tintedFocused(overlay, tint, factor);
        }
        return colorScheme.onSurface.withAlpha(kAlphaFocused);
      }
      return Colors.transparent;
    }),
  );
}
