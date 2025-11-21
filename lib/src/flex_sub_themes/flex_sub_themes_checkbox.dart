part of '../flex_sub_themes.dart';

/// An opinionated [CheckboxThemeData] theme.
///
/// Requires a [ColorScheme] in [colorScheme]. The color scheme would
/// typically be equal the color scheme also used to define the color scheme
/// for your app theme.
///
/// The splashRadius is not used by FlexColorScheme sub-themes.
CheckboxThemeData _checkboxTheme({
  /// Typically the same `ColorScheme` that is also used for your `ThemeData`.
  required final ColorScheme colorScheme,

  /// Selects which color from the passed in colorScheme to use as the main
  /// color for the checkbox.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// If not defined, [colorScheme.primary] will be used. This is more in-line
  /// with M3 design, but applied to M2 switch. The M3 color design
  /// specification for the secondary color, is a poor choice for toggles and
  /// switches, primary color works better.
  final SchemeColor? baseSchemeColor,

  /// The splash radius of the circular Material ink response.
  ///
  /// Defaults to kRadialReactionRadius = 20.
  final double? splashRadius,

  /// Defines if unselected [Checkbox] is also themed to be [baseSchemeColor].
  ///
  /// If false, it is grey like in Flutter SDK.
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
  final bool isBaseColor = unselectedIsColored ?? false;
  final bool tintInteract = useTintedInteraction ?? false;
  final bool tintDisable = useTintedDisable ?? false;
  // Get selected color, defaults to primary.
  final SchemeColor baseScheme = baseSchemeColor ?? SchemeColor.primary;
  final Color baseColor = FlexSubThemes.schemeColor(baseScheme, colorScheme);
  final Color onBaseColor =
      FlexSubThemes.schemeColorPair(baseScheme, colorScheme);
  final bool isLight = colorScheme.brightness == Brightness.light;

  // Using these tinted overlay variable in all themes for ease of
  // reasoning and duplication.
  final Color overlay = colorScheme.surface;
  final Color tint = baseColor;
  final double factor =
      FlexSubThemes._tintAlphaFactor(tint, colorScheme.brightness, true);

  return CheckboxThemeData(
    splashRadius: splashRadius,
    side: WidgetStateBorderSide.resolveWith((Set<WidgetState> states) {
      if (useM3) {
        if (states.contains(WidgetState.disabled)) {
          if (states.contains(WidgetState.selected)) {
            return const BorderSide(width: 2.0, color: Colors.transparent);
          }
          if (tintDisable) {
            return BorderSide(
              width: 2.0,
              color:
                  FlexSubThemes.tintedDisable(colorScheme.onSurface, baseColor),
            );
          }
          return BorderSide(
            width: 2.0,
            color: colorScheme.onSurface.withAlpha(kAlphaDisabled),
          );
        }

        if (states.contains(WidgetState.selected)) {
          return const BorderSide(width: 0.0, color: Colors.transparent);
        }
        if (states.contains(WidgetState.error)) {
          return BorderSide(width: 2.0, color: colorScheme.error);
        }
        if (states.contains(WidgetState.pressed)) {
          if (isBaseColor) return BorderSide(width: 2.0, color: baseColor);
          return BorderSide(width: 2.0, color: colorScheme.onSurface);
        }
        if (states.contains(WidgetState.hovered)) {
          if (isBaseColor) return BorderSide(width: 2.0, color: baseColor);
          return BorderSide(width: 2.0, color: colorScheme.onSurface);
        }
        if (states.contains(WidgetState.focused)) {
          if (isBaseColor) return BorderSide(width: 2.0, color: baseColor);
          return BorderSide(width: 2.0, color: colorScheme.onSurface);
        }
        if (isBaseColor) return BorderSide(width: 2.0, color: baseColor);
        return BorderSide(width: 2.0, color: colorScheme.onSurfaceVariant);
      }
      // M2 version
      else {
        if (states.contains(WidgetState.disabled)) {
          if (states.contains(WidgetState.selected)) {
            return const BorderSide(width: 2.0, color: Colors.transparent);
          }
          if (tintDisable) {
            return BorderSide(
              width: 2.0,
              color:
                  FlexSubThemes.tintedDisable(colorScheme.onSurface, baseColor),
            );
          }
          return BorderSide(
            width: 2.0,
            color: colorScheme.onSurface.withAlpha(kAlphaDisabled),
          );
        }
        if (states.contains(WidgetState.selected)) {
          return const BorderSide(width: 2.0, color: Colors.transparent);
        }
        if (isBaseColor) return BorderSide(width: 2.0, color: baseColor);
        // This is M2 SDK default.
        return BorderSide(
          width: 2.0,
          color: isLight ? Colors.black54 : Colors.white70,
        );
      }
    }),
    fillColor: WidgetStateProperty.resolveWith<Color>((
      Set<WidgetState> states,
    ) {
      if (useM3) {
        if (states.contains(WidgetState.disabled)) {
          if (states.contains(WidgetState.selected)) {
            if (tintDisable) {
              return FlexSubThemes.tintedDisable(
                  colorScheme.onSurface, baseColor);
            }
            return colorScheme.onSurface.withAlpha(kAlphaDisabled);
          }
          return Colors.transparent;
        }
        if (states.contains(WidgetState.selected)) {
          if (states.contains(WidgetState.error)) {
            return colorScheme.error;
          }
          return baseColor;
        }
        return Colors.transparent;
      }
      // M2 version
      else {
        if (states.contains(WidgetState.disabled)) {
          if (states.contains(WidgetState.selected)) {
            if (tintDisable) {
              return FlexSubThemes.tintedDisable(
                  colorScheme.onSurface, baseColor);
            }
            return isLight ? Colors.grey.shade400 : Colors.grey.shade800;
          }
          return Colors.transparent;
        }
        if (states.contains(WidgetState.selected)) {
          return baseColor;
        }
        return Colors.transparent;
      }
    }),
    checkColor: WidgetStateProperty.resolveWith<Color>((
      Set<WidgetState> states,
    ) {
      if (useM3) {
        if (states.contains(WidgetState.disabled)) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.surface;
          }
          return Colors.transparent;
        }
        if (states.contains(WidgetState.selected)) {
          if (states.contains(WidgetState.error)) {
            return colorScheme.onError;
          }
          return onBaseColor;
        }
        return Colors.transparent;
      }
      // M2 version
      else {
        if (states.contains(WidgetState.disabled)) {
          return isLight ? Colors.grey.shade200 : Colors.grey.shade900;
        }
        if (states.contains(WidgetState.selected)) {
          return onBaseColor;
        }
        return isLight ? Colors.grey.shade50 : Colors.grey.shade400;
      }
    }),
    overlayColor: WidgetStateProperty<Color>.fromMap(
      <WidgetStatesConstraint, Color>{
        if (useM3)
          WidgetState.error & WidgetState.pressed:
              colorScheme.error.withAlpha(kAlphaPressed),
        if (useM3)
          WidgetState.error & WidgetState.hovered:
              colorScheme.error.withAlpha(kAlphaHovered),
        if (useM3)
          WidgetState.error & WidgetState.focused:
              colorScheme.error.withAlpha(kAlphaFocused),
        WidgetState.selected & WidgetState.pressed: tintInteract
            ? FlexSubThemes.tintedPressed(overlay, tint, factor)
            : colorScheme.onSurface.withAlpha(kAlphaPressed),
        WidgetState.selected & WidgetState.hovered: tintInteract
            ? FlexSubThemes.tintedHovered(overlay, tint, factor)
            : baseColor.withAlpha(kAlphaHovered),
        WidgetState.selected & WidgetState.focused: tintInteract
            ? FlexSubThemes.tintedFocused(overlay, tint, factor)
            : baseColor.withAlpha(kAlphaFocused),
        WidgetState.pressed: tintInteract
            ? FlexSubThemes.tintedPressed(overlay, tint, factor)
            : baseColor.withAlpha(kAlphaPressed),
        WidgetState.hovered: tintInteract
            ? FlexSubThemes.tintedHovered(overlay, tint, factor)
            : colorScheme.onSurface.withAlpha(kAlphaHovered),
        WidgetState.focused: tintInteract
            ? FlexSubThemes.tintedFocused(overlay, tint, factor)
            : colorScheme.onSurface.withAlpha(kAlphaFocused),
        WidgetState.any: Colors.transparent,
      },
    ),
  );
}
