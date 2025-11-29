part of '../flex_sub_themes.dart';

/// An opinionated [SwitchThemeData] theme.
///
/// Requires a [ColorScheme] in [colorScheme]. The color scheme would
/// typically be equal the color scheme also used to define the color scheme
/// for your app theme.
///
/// The splashRadius is not used by FlexColorScheme sub-themes.
SwitchThemeData _switchTheme({
  /// Typically the same `ColorScheme` that is also used for your `ThemeData`.
  required final ColorScheme colorScheme,

  /// Selects which color from the passed in colorScheme to use as the main
  /// color for the switch.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// If not defined, [colorScheme.primary] will be used. This is more in-line
  /// with M3 design, but applied to M2 switch. The M3 color design
  /// specification for the secondary color, is a poor choice for toggles and
  /// switches, if such colors are used in M2 mode, primary color works
  /// better.
  final SchemeColor? baseSchemeColor,

  /// Selects which color from the passed in colorScheme to use as the thumb
  /// color for the switch.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// If not defined, [colorScheme.primary] will be used in M2 mode.
  /// This is more in-line
  /// with M3 design, but applied to M2 switch. The M3 color design
  /// specification for the secondary color, is a poor choice for toggles and
  /// switches, if such colors are used in M2 mode, primary color works
  /// better.
  ///
  /// If not defined, defaults to:
  ///
  /// - If useMaterial3 is false [baseSchemeColor].
  /// - If useMaterial3 is true [SchemeColor.primaryContainer].
  final SchemeColor? thumbSchemeColor,

  /// Set to true to keep the [Switch] thumb size fixed.
  ///
  /// When true the [Switch] thumb size does not change from small size when
  /// OFF, to a larger size when ON. This makes the Material-3 Switch even
  /// more similar to the iOS style Switch.
  ///
  /// This setting only applies to the Material-3 mode, it has no effect in
  /// Material-2 mode.
  ///
  /// If undefined, defaults to false.
  final bool? thumbFixedSize,

  /// The splash radius of the circular Material ink response.
  ///
  /// If null, default via SDK defaults to [kRadialReactionRadius] = 20.
  final double? splashRadius,

  /// Defines if unselected [Switch] is also themed to be [baseSchemeColor].
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

  /// Defines if the theme uses Cupertino style switch.
  ///
  /// This option only works when [useMaterial3] is true. If it is false
  /// the setting has no impact.
  ///
  /// When used the Switch will be styled like a CupertinoSwitch, but with
  /// the colors defined by [baseSchemeColor]. The themed Switch is not
  /// an exact match for the CupertinoSwitch, but as close as you can
  /// get with the Material Switch theming features.
  ///
  /// If undefined, defaults to false.
  final bool? useCupertinoStyle,

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

  // Currently only supporting normal contrast color for the mock
  // adaptive Material themed like iOS Switch. We would need a context
  // passed in to get hih contrast and elevated to resolve those colors.
  const CupertinoDynamicColor cup = CupertinoColors.secondarySystemFill;

  // Get colorScheme brightness.
  final bool isLight = colorScheme.brightness == Brightness.light;
  // Get selected base color, and its pair, defaults to primary and onPrimary.
  final Color baseColor = FlexSubThemes.schemeColor(
    baseSchemeColor ?? SchemeColor.primary,
    colorScheme,
  );

  final Color onBaseColor = FlexSubThemes.schemeColorPair(
    baseSchemeColor ?? SchemeColor.primary,
    colorScheme,
  );

  final bool unselectedColored = unselectedIsColored ?? false;
  final bool tintInteract = useTintedInteraction ?? false;
  final bool tintDisable = useTintedDisable ?? false;

  // Using these tinted overlay variable in all themes for ease of
  // reasoning and duplication.
  final Color overlay = colorScheme.surface;
  final Color tint = baseColor;
  final double factor =
      FlexSubThemes._tintAlphaFactor(tint, colorScheme.brightness, true);

  // Get selected thumb color, and its pair, defaults to
  // M2: primary and onPrimary.
  // M3: primaryContainer and onPrimaryContainer
  final Color thumbColor = FlexSubThemes.schemeColor(
    thumbSchemeColor ??
        (useM3
            ? SchemeColor.primaryContainer
            : baseSchemeColor ?? SchemeColor.primary),
    colorScheme,
  );

  // Material-2 mode theming.
  if (!useM3) {
    return SwitchThemeData(
      splashRadius: splashRadius,
      thumbColor: WidgetStateProperty.resolveWith<Color>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.disabled)) {
          if (states.contains(WidgetState.selected)) {
            if (tintDisable) {
              return FlexSubThemes.tintedDisable(
                  colorScheme.onSurface, baseColor);
            }
            return isLight ? Colors.grey.shade400 : Colors.grey.shade800;
          }
          if (tintDisable) {
            return FlexSubThemes.tintedDisable(
              colorScheme.onSurface,
              baseColor,
            ).withAlpha(kAlphaLowDisabled);
          }
          return isLight ? Colors.grey.shade400 : Colors.grey.shade800;
        }
        if (states.contains(WidgetState.selected)) {
          return thumbColor;
        }
        return isLight ? Colors.grey.shade50 : Colors.grey.shade400;
      }),
      trackColor: WidgetStateProperty.resolveWith<Color>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.disabled)) {
          if (tintDisable) {
            return FlexSubThemes.tintedDisable(
              colorScheme.onSurface,
              baseColor,
            ).withAlpha(kAlphaVeryLowDisabled);
          }
          return isLight ? Colors.black12 : Colors.white10;
        }
        if (states.contains(WidgetState.selected)) {
          return baseColor.withAlpha(
            isLight ? kAlphaM2SwitchTrackLight : kAlphaM2SwitchTrackDark,
          );
        }
        // Custom themed color on track when not selected
        if (unselectedColored) {
          return baseColor.withAlpha(
            isLight
                ? kAlphaM2SwitchUnselectTrackLight
                : kAlphaM2SwitchUnselectTrackDark,
          );
        }
        // This is SDK default, yes that value is hard coded in SDK too.
        return isLight ? kSwitchM2LightTrackColor : Colors.white30;
      }),
      overlayColor: WidgetStateProperty.resolveWith((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.selected)) {
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
            return baseColor.withAlpha(kAlphaHovered);
          }
          if (states.contains(WidgetState.focused)) {
            if (tintInteract) {
              return FlexSubThemes.tintedFocused(overlay, tint, factor);
            }
            return baseColor.withAlpha(kAlphaFocused);
          }
          return null;
        }
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
          return colorScheme.onSurface.withAlpha(kAlphaHovered);
        }
        if (states.contains(WidgetState.focused)) {
          if (tintInteract) {
            return FlexSubThemes.tintedFocused(overlay, tint, factor);
          }
          return colorScheme.onSurface.withAlpha(kAlphaFocused);
        }
        return null;
      }),
    );
  }
  // Material-3 mode theming.
  else {
    // Use a Cupertino style themed Material-3 Switch.
    if (useCupertinoStyle ?? false) {
      return SwitchThemeData(
        mouseCursor: WidgetStateProperty.resolveWith((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.disabled)) {
            return SystemMouseCursors.basic;
          }
          return kIsWeb ? SystemMouseCursors.click : SystemMouseCursors.basic;
        }),

        thumbIcon: WidgetStateProperty.resolveWith<Icon?>((
          Set<WidgetState> states,
        ) {
          return const Icon(Icons.minimize, color: Colors.transparent);
        }),
        trackOutlineColor: WidgetStateProperty.resolveWith((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.focused)) {
            // This color grabbed from adaptive CupertinoSwitch focused state.
            return HSLColor.fromColor(
              baseColor.withValues(alpha: 0.80),
            ).withLightness(0.69).withSaturation(0.835).toColor();
          }
          return Colors.transparent;
        }),
        // The actual CupertinoSwitch has ring outside the track, this
        // ring is inside the track, but it is a color and style match.
        trackColor: WidgetStateProperty.resolveWith((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.disabled)) {
            if (states.contains(WidgetState.selected)) {
              return baseColor.withValues(alpha: 0.5);
            }
            return isLight
                // Actual CupertinoSwitch wraps with Opacity(0.5) layer, this
                // cannot be done here. This is picked to match the look.
                ? cup.color.withValues(alpha: 0.07)
                : cup.darkColor.withValues(alpha: 0.16);
          }
          if (states.contains(WidgetState.selected)) {
            return baseColor;
          }
          return isLight ? cup.color : cup.darkColor;
        }),
        thumbColor: WidgetStateProperty.resolveWith((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.disabled)) {
            return Colors.white.withValues(alpha: 0.5);
          }
          return Colors.white;
        }),
        overlayColor: WidgetStateProperty.resolveWith((
          Set<WidgetState> states,
        ) {
          return Colors.transparent;
        }),
        // This is the width of the focused Cupertino outline ring, but
        // on an actual CupertinoSwitch it is outside the track and there
        // is special code to handle it the CupertinoSwitch case, we cannot
        // do that with a Theme on Material-3 Switch case, but it is style
        // wise a good match.
        trackOutlineWidth: WidgetStateProperty.resolveWith((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.focused)) {
            return 3.5;
          }
          return 0;
        }),
        splashRadius: 0,
      );
    } else {
      // Use a generally themed Material-3 style Switch
      return SwitchThemeData(
        splashRadius: splashRadius,
        thumbIcon: thumbFixedSize ?? false
            ? WidgetStateProperty.resolveWith<Icon?>((
                Set<WidgetState> states,
              ) {
                return const Icon(
                  Icons.minimize,
                  color: Colors.transparent,
                );
              })
            : null,
        thumbColor: WidgetStateProperty.resolveWith((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.disabled)) {
            if (states.contains(WidgetState.selected)) {
              return colorScheme.surface;
            }
            if (tintDisable) {
              return FlexSubThemes.tintedDisable(
                  colorScheme.onSurface, baseColor);
            }
            return colorScheme.onSurface.withAlpha(kAlphaDisabled);
          }
          if (states.contains(WidgetState.selected)) {
            if (states.contains(WidgetState.pressed)) {
              return thumbColor;
            }
            if (states.contains(WidgetState.hovered)) {
              return thumbColor;
            }
            if (states.contains(WidgetState.focused)) {
              return thumbColor;
            }
            return onBaseColor;
          }
          if (states.contains(WidgetState.pressed)) {
            return colorScheme.onSurfaceVariant;
          }
          if (states.contains(WidgetState.hovered)) {
            return colorScheme.onSurfaceVariant;
          }
          if (states.contains(WidgetState.focused)) {
            return colorScheme.onSurfaceVariant;
          }
          return colorScheme.outline;
        }),
        trackColor: WidgetStateProperty.resolveWith((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.disabled)) {
            if (states.contains(WidgetState.selected)) {
              if (tintDisable) {
                return FlexSubThemes.tintedDisable(
                    colorScheme.onSurface, baseColor);
              }
              return colorScheme.onSurface.withAlpha(kAlphaVeryLowDisabled);
            }
            return colorScheme.surfaceContainerHighest.withAlpha(
              kAlphaVeryLowDisabled,
            );
          }
          if (states.contains(WidgetState.selected)) {
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
          if (states.contains(WidgetState.pressed)) {
            return unselectedColored
                ? baseColor.withAlpha(
                    isLight
                        ? kAlphaM3SwitchUnselectTrackLight
                        : kAlphaM3SwitchUnselectTrackDark,
                  )
                : colorScheme.surfaceContainerHighest;
          }
          if (states.contains(WidgetState.hovered)) {
            return unselectedColored
                ? baseColor.withAlpha(
                    isLight
                        ? kAlphaM3SwitchUnselectTrackLight
                        : kAlphaM3SwitchUnselectTrackDark,
                  )
                : colorScheme.surfaceContainerHighest;
          }
          if (states.contains(WidgetState.focused)) {
            return unselectedColored
                ? baseColor.withAlpha(
                    isLight
                        ? kAlphaM3SwitchUnselectTrackLight
                        : kAlphaM3SwitchUnselectTrackDark,
                  )
                : colorScheme.surfaceContainerHighest;
          }
          return unselectedColored
              ? baseColor.withAlpha(
                  isLight
                      ? kAlphaM3SwitchUnselectTrackLight
                      : kAlphaM3SwitchUnselectTrackDark,
                )
              : colorScheme.surfaceContainerHighest;
        }),
        trackOutlineColor: WidgetStateProperty.resolveWith((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.selected)) {
            return Colors.transparent;
          }
          if (states.contains(WidgetState.disabled)) {
            if (tintDisable) {
              return FlexSubThemes.tintedDisable(
                  colorScheme.onSurface, baseColor);
            }
            return colorScheme.onSurface.withAlpha(kAlphaVeryLowDisabled);
          }
          return colorScheme.outline;
        }),
        overlayColor: WidgetStateProperty.resolveWith((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.selected)) {
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
              return baseColor.withAlpha(kAlphaHovered);
            }
            if (states.contains(WidgetState.focused)) {
              if (tintInteract) {
                return FlexSubThemes.tintedFocused(overlay, tint, factor);
              }
              return baseColor.withAlpha(kAlphaFocused);
            }
            return null;
          }
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
            return colorScheme.onSurface.withAlpha(kAlphaHovered);
          }
          if (states.contains(WidgetState.focused)) {
            if (tintInteract) {
              return FlexSubThemes.tintedFocused(overlay, tint, factor);
            }
            return colorScheme.onSurface.withAlpha(kAlphaFocused);
          }
          return null;
        }),
      );
    }
  }
}
