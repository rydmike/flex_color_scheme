part of '../flex_sub_themes.dart';

/// An opinionated [IconButtonThemeData].
///
/// Current only used to set tinted interaction and disable style on
/// [IconButtonThemeData] when these feature are opted in on in FCS.
IconButtonThemeData _iconButtonTheme({
  /// Typically the same `ColorScheme` that is also used for your `ThemeData`.
  required final ColorScheme colorScheme,

  /// Defines if the theme uses tinted interaction effects.
  ///
  /// If undefined, defaults to false.
  final bool? useTintedInteraction,

  /// Defines if the theme uses tinted disabled color.
  ///
  /// If undefined, defaults to false.
  final bool? useTintedDisable,
}) {
  final bool tintInteract = useTintedInteraction ?? false;
  final bool tintDisable = useTintedDisable ?? false;

  // Due to issue:
  // https://github.com/flutter/flutter/pull/121884#issuecomment-1458505977
  // Only supports default colors for now, the colors below are only used
  // for default color matching tinted ink effects.

  // Get right foreground on color for background, defaults to primary.
  final Color foreground =
      FlexSubThemes.schemeColor(SchemeColor.primary, colorScheme);
  // Get background color, defaults to onPrimary.
  final Color background =
      FlexSubThemes.schemeColorPair(SchemeColor.primary, colorScheme);

  // Using these tinted overlay variable in all themes for ease of
  // reasoning and duplication.
  final Color overlay = background;
  final Color tint = foreground;
  final double factor =
      FlexSubThemes._tintAlphaFactor(tint, colorScheme.brightness, false);

  // TODO(rydmike): Conditional tintInteract and tintDisabled due to issue.
  // See https://github.com/flutter/flutter/issues/123829
  return tintInteract || tintDisable
      ? IconButtonThemeData(
          style: ButtonStyle(
            // TODO(rydmike): Add tinted disable support when doable in SDK.
            // Due to above mentioned issue backgroundColor cannot be added
            // yet without destroying the different styles.
            // backgroundColor:
            //  WidgetStateProperty.resolveWith((Set<WidgetState> states) {
            //   if (states.contains(WidgetState.disabled)) {
            //     if (tintDisable) {
            //       return FlexSubThemes.tintedDisable(colorScheme.onSurface,
            //       tint).withAlpha(kAlphaVeryLowDisabled);
            //     }
            //     if (states.contains(WidgetState.selected)) {
            //       return colorScheme.onSurface.withValues(alpha: 0.12);
            //     }
            //     return Colors.transparent;
            //   }
            //   if (states.contains(WidgetState.selected)) {
            //     return colorScheme.inverseSurface;
            //   }
            //   return Colors.transparent;
            // }),
            foregroundColor: WidgetStateProperty.resolveWith((
              Set<WidgetState> states,
            ) {
              // We can do a tinted foreground color when requested, since it
              // is the same for all variants by default as well.
              if (states.contains(WidgetState.disabled)) {
                if (tintDisable) {
                  return FlexSubThemes.tintedDisable(
                      colorScheme.onSurface, tint);
                }
                // return colorScheme.onSurface.withValues(alpha: 0.38);
              }
              // if (states.contains(WidgetState.selected)) {
              //   return colorScheme.onInverseSurface;
              // }
              // return colorScheme.onSurfaceVariant;
              return null; // Gets us default for foregroundColor
            }),
            overlayColor: tintInteract
                ? WidgetStateProperty.resolveWith<Color>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.selected)) {
                      if (states.contains(WidgetState.pressed)) {
                        if (tintInteract) {
                          return FlexSubThemes.tintedPressed(
                              overlay, tint, factor);
                        }
                        // TODO(rydmike): Add option when Flutter issue fixed.
                        // return
                        // colorScheme.onSurface.withAlpha(kAlphaPressed);
                      }
                      if (states.contains(WidgetState.hovered)) {
                        if (tintInteract) {
                          return FlexSubThemes.tintedHovered(
                              overlay, tint, factor);
                        }
                        // TODO(rydmike): Add option when Flutter issue fixed.
                        // return foreground.withAlpha(kAlphaHovered);
                      }
                      if (states.contains(WidgetState.focused)) {
                        if (tintInteract) {
                          return FlexSubThemes.tintedFocused(
                              overlay, tint, factor);
                        }
                        // TODO(rydmike): Add option when Flutter issue fixed.
                        // return foreground.withAlpha(kAlphaFocused);
                      }
                      return Colors.transparent;
                    }
                    if (states.contains(WidgetState.pressed)) {
                      if (tintInteract) {
                        return FlexSubThemes.tintedPressed(
                            overlay, tint, factor);
                      }
                      // TODO(rydmike): Add option when Flutter issue fixed.
                      // return foreground.withAlpha(kAlphaPressed);
                    }
                    if (states.contains(WidgetState.hovered)) {
                      if (tintInteract) {
                        return FlexSubThemes.tintedHovered(
                            overlay, tint, factor);
                      }
                      // TODO(rydmike): Add option when Flutter issue fixed.
                      //return colorScheme.onSurface.withAlpha(kAlphaHovered);
                    }
                    if (states.contains(WidgetState.focused)) {
                      if (tintInteract) {
                        return FlexSubThemes.tintedFocused(
                            overlay, tint, factor);
                      }
                      // TODO(rydmike): Add option when Flutter issue fixed.
                      //return colorScheme.onSurface.withAlpha(kAlphaFocused);
                    }
                    return Colors.transparent;
                  })
                : null, // Gets us default for overlayColor.
          ),
        )
      : const IconButtonThemeData();
}
