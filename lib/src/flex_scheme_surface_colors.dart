import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'flex_alpha_values.dart';
import 'flex_color.dart';
import 'flex_extensions.dart';
import 'flex_scheme_color.dart';
import 'flex_surface_mode.dart';

// ignore_for_file: comment_references

/// Immutable data class used to make the six different surface colors in a
/// [FlexColorScheme].
///
/// [FlexSchemeSurfaceColors] is used primarily via the
/// [FlexSchemeSurfaceColors.blend] factory. Before version 4.0 the
/// [FlexSchemeSurfaceColors.from] factory was used.
///
/// Included colors are [surface] and [inverseSurface] plus
/// plus blended surface colors
/// for [scaffoldBackground] and [dialogBackground], which are not a part
/// of Flutter's standard [ColorScheme].
///
/// This class, and its factory are only used by the
/// [FlexColorScheme.light] and [FlexColorScheme.dark] factories. You normally
/// do not have to use it, unless you are making a customized version
/// of [FlexColorScheme] or similar feature, or if you want to, you can use it
/// for getting surface colors for a standard [ColorScheme].
@immutable
class FlexSchemeSurfaceColors with Diagnosticable {
  /// Default constructor. [FlexSchemeSurfaceColors] is usually created with
  /// the [FlexSchemeSurfaceColors.from] factory.
  const FlexSchemeSurfaceColors({
    required this.surface,
    Color? surfaceDim,
    Color? surfaceBright,
    Color? surfaceContainerLowest,
    Color? surfaceContainerLow,
    Color? surfaceContainer,
    Color? surfaceContainerHigh,
    Color? surfaceContainerHighest,
    Color? inverseSurface,
    required this.scaffoldBackground,
    required this.dialogBackground,
    @Deprecated('This color was deprecated in FCS 8.0 because Flutter 3.22 '
        'deprecated the color, it has no function and should not be used.')
    this.surfaceVariant,
    @Deprecated('This color was deprecated in FCS 8.0 because Flutter 3.22 '
        'deprecated the color, it has no function and should not be used.')
    this.background,
  })  : _surfaceDim = surfaceDim,
        _surfaceBright = surfaceBright,
        _surfaceContainerLowest = surfaceContainerLowest,
        _surfaceContainerLow = surfaceContainerLow,
        _surfaceContainer = surfaceContainer,
        _surfaceContainerHigh = surfaceContainerHigh,
        _surfaceContainerHighest = surfaceContainerHighest,
        _inverseSurface = inverseSurface;

  /// The background color for widgets like [Card] and [Dialog].
  ///
  /// The default background color of [Material] of type card.
  final Color surface;

  /// A color variant of [surface] that can be used for differentiation
  /// against a component using [surface]. Local variable with initializer used
  /// in order to not break past const interface, with past required props.
  final Color? _surfaceDim;

  /// A color variant of [surface] that can be used for differentiation against
  /// a component using [surface]. Defaults to [surface] as fallback.
  Color get surfaceDim => _surfaceDim ?? surface;

  /// A color variant of [surface] that can be used for differentiation
  /// against a component using [surface]. Local variable with initializer used
  /// in order to not break past const interface, with past required props.
  final Color? _surfaceBright;

  /// A color variant of [surface] that can be used for differentiation against
  /// a component using [surface]. Defaults to [surface] as fallback.
  Color get surfaceBright => _surfaceBright ?? surface;

  /// A color variant of [surface] that can be used for differentiation
  /// against a component using [surface]. Local variable with initializer used
  /// in order to not break past const interface, with past required props.
  final Color? _surfaceContainerLowest;

  /// A color variant of [surface] that can be used for differentiation against
  /// a component using [surface]. Defaults to [surface] as fallback.
  Color get surfaceContainerLowest => _surfaceContainerLowest ?? surface;

  /// A color variant of [surface] that can be used for differentiation
  /// against a component using [surface]. Local variable with initializer used
  /// in order to not break past const interface, with past required props.
  final Color? _surfaceContainerLow;

  /// A color variant of [surface] that can be used for differentiation against
  /// a component using [surface]. Defaults to [surface] as fallback.
  Color get surfaceContainerLow => _surfaceContainerLow ?? surface;

  /// A color variant of [surface] that can be used for differentiation
  /// against a component using [surface]. Local variable with initializer used
  /// in order to not break past const interface, with past required props.
  final Color? _surfaceContainer;

  /// A color variant of [surface] that can be used for differentiation against
  /// a component using [surface]. Defaults to [surface] as fallback.
  Color get surfaceContainer => _surfaceContainer ?? surface;

  /// A color variant of [surface] that can be used for differentiation
  /// against a component using [surface]. Local variable with initializer used
  /// in order to not break past const interface, with past required props.
  final Color? _surfaceContainerHigh;

  /// A color variant of [surface] that can be used for differentiation against
  /// a component using [surface]. Defaults to [surface] as fallback.
  Color get surfaceContainerHigh => _surfaceContainerHigh ?? surface;

  /// A color variant of [surface] that can be used for differentiation
  /// against a component using [surface]. Local variable with initializer used
  /// in order to not break past const interface, with past required props.
  final Color? _surfaceContainerHighest;

  /// A color variant of [surface] that can be used for differentiation against
  /// a component using [surface]. Defaults to [surface] as fallback.
  Color get surfaceContainerHighest => _surfaceContainerHighest ?? surface;

  /// A surface color used for displaying the reverse of what’s seen in the
  /// surrounding UI, for example in a SnackBar to bring attention to
  /// an alert. Local variable with initializer used in order to not break
  /// past const interface, with past required props.
  final Color? _inverseSurface;

  /// A surface color used for displaying the reverse of what’s seen in the
  /// surrounding UI, for example in a SnackBar to bring attention to
  /// an alert.  Defaults to [surface] as fallback.
  Color get inverseSurface => _inverseSurface ?? surface;

  /// The color of dialog background.
  ///
  /// Typically same as the surface color.
  final Color dialogBackground;

  /// The color of the [Scaffold] background.
  final Color scaffoldBackground;

  /// A color variant of [surface] that can be used for differentiation against
  /// a component using [surface]. Defaults to [surface] as fallback.
  @Deprecated('This color was deprecated in FCS 8.0 because Flutter 3.22 '
      'deprecated the color, it has no function and should not be used.')
  final Color? surfaceVariant;

  /// A color that typically appears behind scrollable content.
  ///
  /// The default background color of [Material] of type canvas.
  @Deprecated('This color was deprecated in FCS 8.0 because Flutter 3.22 '
      'deprecated the color, it has no function and should not be used.')
  final Color? background;

  /// Create nuanced surface colors using pre-defined behavior via enum
  /// [FlexSurfaceMode] property `surfaceMode` or make totally custom color
  /// blended surfaces.
  ///
  /// This kind of surface branding is based on the Material guide found
  /// under "Accessibility and contrast"
  /// https://material.io/design/color/dark-theme.html#properties
  /// for branded surfaces.
  ///
  /// The [brightness] controls if we are creating surface colors for light or
  /// dark surfaces.
  ///
  /// To get elevation overlay color in dark themes on all surfaces used by
  /// [Material], use a [FlexSurfaceMode] `surfaceMode` that start with
  /// `equal` in its name.
  /// Other modes will only use elevation overlay if their background happens to
  /// be equal to resulting colorScheme.surface color. For more information
  /// see issue: https://github.com/flutter/flutter/issues/90353
  ///
  /// The surface colors returned by this factory can also be used to make
  /// branded surface colors for Flutter's standard [ColorScheme], it does
  /// not have to be used exclusively by [FlexColorScheme].
  factory FlexSchemeSurfaceColors.blend({
    /// Controls if we create surface colors for light or dark surfaces.
    final Brightness brightness = Brightness.light,

    /// The used surface mode to create different surface color blends.
    ///
    /// Defaults to highBackground.
    final FlexSurfaceMode surfaceMode =
        FlexSurfaceMode.highBackgroundLowScaffold,

    /// The the blend level strength used for the mode.
    final int blendLevel = 0,

    /// An int divisor for surfaceVariant used to reduce its blend strength.
    ///
    /// Used when seedSchemes are used to lessen the blend on surfaceVariant
    /// so it does not get too much, since it already has a strong start blend.
    /// FlexColorScheme passes in 2, to half the blend value when seeded schemes
    /// are used.
    final int surfaceVariantBlendDivide = 1,

    /// The colors used to blend into surfaces when using `surfaceMode` mode
    /// based styles and modes.
    ///
    /// If null, default material light or dark scheme colors will be used as
    /// fallback, depending on if we are making light or dark surfaces.
    ///
    /// If a blend color for a surface is provided in `blendColors`, that color
    /// color always overrides used color from `schemeColor` selected based on
    /// `surfaceMode`.
    FlexSchemeColor? schemeColors,

    /// Custom colors to be blended into each surface color.
    ///
    /// If provided, these colors will be blended into each equivalent surface
    /// color.
    ///
    /// If it is null, then `schemeColors.primary` will be assigned to all
    /// surfaces.
    FlexSchemeSurfaceColors? blendColors,

    /// The surface colors that we will mix the blend colors into.
    ///
    /// If null, then Material default surface colors will be used for all
    /// surfaces, that we then mix in the `blendColors` into, unless the
    /// `surfaceMode` defines surface starting colors otherwise.
    FlexSchemeSurfaceColors? surfaceColors,
  }) {
    assert(
        blendLevel >= 0 && blendLevel <= 40,
        'Only blend levels from 0 to 40 '
        'are allowed. Very high alpha blend levels may not produce results '
        'that are visually very appealing or useful.');
    int usedBlendLevel = blendLevel;
    // If above happens in none debug mode, use 0, no blends.
    if (blendLevel < 0 || blendLevel > 40) usedBlendLevel = 0;

    final bool isLight = brightness == Brightness.light;

    // We get scheme default blend in colors via brightness and Material
    // default colors for the theme mode, if it was not provided. It is
    // typically provided when making branded surfaces, but Material default
    // colors are used as fallback colors.
    final FlexSchemeColor scheme = schemeColors ??
        (isLight ? FlexColor.material.light : FlexColor.material.dark);
    // The color that should be blended into each surface, defaults to primary
    // color for all surfaces.
    FlexSchemeSurfaceColors blendColor = blendColors ??
        FlexSchemeSurfaceColors(
          surface: scheme.primary,
          surfaceDim: scheme.primary,
          surfaceBright: scheme.primary,
          surfaceContainerLowest: scheme.primary,
          surfaceContainerLow: scheme.primary,
          surfaceContainer: scheme.primary,
          surfaceContainerHigh: scheme.primary,
          surfaceContainerHighest: scheme.primary,
          inverseSurface: scheme.primary,
          dialogBackground: scheme.primary,
          scaffoldBackground: scheme.primary,
        );
    // Set dialog blend colors to secondary variant color for modes using it.
    if (surfaceMode == FlexSurfaceMode.levelSurfacesLowScaffoldVariantDialog ||
        surfaceMode == FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog) {
      blendColor = blendColor.copyWith(dialogBackground: scheme.tertiary);
    }
    // We get surface starting default colors via brightness and Material
    // default colors if it was not provided. It is normally provided when
    // making branded surfaces, but Material default colors are used as
    // fallback colors.
    FlexSchemeSurfaceColors surface = surfaceColors ??
        (isLight
            ? const FlexSchemeSurfaceColors(
                surface: FlexColor.materialLightSurface,
                surfaceDim: FlexColor.lightM3SurfaceDim,
                surfaceBright: FlexColor.lightM3SurfaceBright,
                surfaceContainerLowest: FlexColor.lightM3SurfaceContainerLowest,
                surfaceContainerLow: FlexColor.lightM3SurfaceContainerLow,
                surfaceContainer: FlexColor.lightM3SurfaceContainer,
                surfaceContainerHigh: FlexColor.lightM3SurfaceContainerHigh,
                surfaceContainerHighest:
                    FlexColor.lightM3SurfaceContainerHighest,
                inverseSurface: FlexColor.materialDarkSurface,
                scaffoldBackground: FlexColor.materialLightScaffoldBackground,
                dialogBackground: FlexColor.lightM3SurfaceContainerHigh,
              )
            : const FlexSchemeSurfaceColors(
                surface: FlexColor.materialDarkSurface,
                surfaceDim: FlexColor.darkM3SurfaceDim,
                surfaceBright: FlexColor.darkM3SurfaceBright,
                surfaceContainerLowest: FlexColor.darkM3SurfaceContainerLowest,
                surfaceContainerLow: FlexColor.darkM3SurfaceContainerLow,
                surfaceContainer: FlexColor.darkM3SurfaceContainer,
                surfaceContainerHigh: FlexColor.darkM3SurfaceContainerHigh,
                surfaceContainerHighest:
                    FlexColor.darkM3SurfaceContainerHighest,
                inverseSurface: FlexColor.materialLightSurface,
                scaffoldBackground: FlexColor.materialDarkScaffoldBackground,
                dialogBackground: FlexColor.darkM3SurfaceContainerHigh,
              ));
    // Below, when blendLevel is zero, we use Material default surfaces. We do
    // that for all cases so that blend level 0 matches Material 2 default
    // on level 0 for all surfaces modes, for higher than 0 the modes use
    // different starting points for their surfaces that may be darker than
    // Material 2 in dark mode, and a bit off white in white mode.
    // Doing so improves the color blends.
    //
    // If using `highBackgroundLowScaffold` or `highSurfaceLowScaffold` or
    // `highScaffoldLevelSurface` and `_blendLevel` we use the same mix of
    // starting surfaces as used in versions before 4.0 when using
    // `surfaceStyle` based surfaces and no blends via `FlexSurface.material`.
    if (surfaceMode == FlexSurfaceMode.highBackgroundLowScaffold ||
        surfaceMode == FlexSurfaceMode.highSurfaceLowScaffold ||
        surfaceMode == FlexSurfaceMode.highScaffoldLevelSurface) {
      if (usedBlendLevel == 0) {
        if (isLight) {
          surface = surfaceColors ??
              const FlexSchemeSurfaceColors(
                surface: FlexColor.materialLightSurface,
                surfaceDim: FlexColor.lightM3SurfaceDim,
                surfaceBright: FlexColor.lightM3SurfaceBright,
                surfaceContainerLowest: FlexColor.lightM3SurfaceContainerLowest,
                surfaceContainerLow: FlexColor.lightM3SurfaceContainerLow,
                surfaceContainer: FlexColor.lightM3SurfaceContainer,
                surfaceContainerHigh: FlexColor.lightM3SurfaceContainerHigh,
                surfaceContainerHighest:
                    FlexColor.lightM3SurfaceContainerHighest,
                inverseSurface: FlexColor.materialDarkSurface,
                scaffoldBackground: FlexColor.materialLightScaffoldBackground,
                dialogBackground: FlexColor.lightM3SurfaceContainerHigh,
              );
        } else {
          surface = surfaceColors ??
              const FlexSchemeSurfaceColors(
                surface: FlexColor.materialDarkSurface,
                surfaceDim: FlexColor.darkM3SurfaceDim,
                surfaceBright: FlexColor.darkM3SurfaceBright,
                surfaceContainerLowest: FlexColor.darkM3SurfaceContainerLowest,
                surfaceContainerLow: FlexColor.darkM3SurfaceContainerLow,
                surfaceContainer: FlexColor.darkM3SurfaceContainer,
                surfaceContainerHigh: FlexColor.darkM3SurfaceContainerHigh,
                surfaceContainerHighest:
                    FlexColor.darkM3SurfaceContainerHighest,
                inverseSurface: FlexColor.materialLightSurface,
                scaffoldBackground: FlexColor.materialDarkScaffoldBackground,
                dialogBackground: FlexColor.darkM3SurfaceContainerHigh,
              );
        }
      } else {
        // For `blendLevel` > 0 we use the surface color defined by [FlexColor]
        // surfaces. They differ slightly
        // from Material starting colors to provide better blend effects.
        // White is slightly off-white for background and in dark mode
        // surface is slightly darker and background even darker, while
        // scaffold background matches the Material design background.
        if (isLight) {
          surface = surfaceColors ??
              const FlexSchemeSurfaceColors(
                surface: FlexColor.lightSurface,
                surfaceDim: FlexColor.lightM3SurfaceDim,
                surfaceBright: FlexColor.lightM3SurfaceBright,
                surfaceContainerLowest: FlexColor.lightM3SurfaceContainerLowest,
                surfaceContainerLow: FlexColor.lightM3SurfaceContainerLow,
                surfaceContainer: FlexColor.lightM3SurfaceContainer,
                surfaceContainerHigh: FlexColor.lightM3SurfaceContainerHigh,
                surfaceContainerHighest:
                    FlexColor.lightM3SurfaceContainerHighest,
                inverseSurface: FlexColor.darkSurface,
                scaffoldBackground: FlexColor.lightScaffoldBackground,
                dialogBackground: FlexColor.lightM3SurfaceContainerHigh,
              );
        } else {
          surface = surfaceColors ??
              const FlexSchemeSurfaceColors(
                surface: FlexColor.darkSurface,
                surfaceDim: FlexColor.darkM3SurfaceDim,
                surfaceBright: FlexColor.darkM3SurfaceBright,
                surfaceContainerLowest: FlexColor.darkM3SurfaceContainerLowest,
                surfaceContainerLow: FlexColor.darkM3SurfaceContainerLow,
                surfaceContainer: FlexColor.darkM3SurfaceContainer,
                surfaceContainerHigh: FlexColor.darkM3SurfaceContainerHigh,
                surfaceContainerHighest:
                    FlexColor.darkM3SurfaceContainerHighest,
                inverseSurface: FlexColor.lightSurface,
                scaffoldBackground: FlexColor.darkScaffoldBackground,
                dialogBackground: FlexColor.darkM3SurfaceContainerHigh,
              );
        }
      }
    }
    // In these modes we use FlexColor default surface color on all surfaces,
    // when blend level is > 0.
    if (surfaceMode == FlexSurfaceMode.level ||
        surfaceMode == FlexSurfaceMode.highScaffoldLowSurface ||
        surfaceMode == FlexSurfaceMode.levelSurfacesLowScaffold ||
        surfaceMode == FlexSurfaceMode.levelSurfacesLowScaffoldVariantDialog) {
      if (usedBlendLevel == 0) {
        if (isLight) {
          surface = surfaceColors ??
              const FlexSchemeSurfaceColors(
                surface: FlexColor.materialLightSurface,
                surfaceDim: FlexColor.lightM3SurfaceDim,
                surfaceBright: FlexColor.lightM3SurfaceBright,
                surfaceContainerLowest: FlexColor.lightM3SurfaceContainerLowest,
                surfaceContainerLow: FlexColor.lightM3SurfaceContainerLow,
                surfaceContainer: FlexColor.lightM3SurfaceContainer,
                surfaceContainerHigh: FlexColor.lightM3SurfaceContainerHigh,
                surfaceContainerHighest:
                    FlexColor.lightM3SurfaceContainerHighest,
                inverseSurface: FlexColor.materialDarkSurface,
                scaffoldBackground: FlexColor.materialLightScaffoldBackground,
                dialogBackground: FlexColor.lightM3SurfaceContainerHigh,
              );
        } else {
          surface = surfaceColors ??
              const FlexSchemeSurfaceColors(
                surface: FlexColor.materialDarkSurface,
                // surfaceVariant: FlexColor.darkSurfaceVariant,
                surfaceDim: FlexColor.darkM3SurfaceDim,
                surfaceBright: FlexColor.darkM3SurfaceBright,
                surfaceContainerLowest: FlexColor.darkM3SurfaceContainerLowest,
                surfaceContainerLow: FlexColor.darkM3SurfaceContainerLow,
                surfaceContainer: FlexColor.darkM3SurfaceContainer,
                surfaceContainerHigh: FlexColor.darkM3SurfaceContainerHigh,
                surfaceContainerHighest:
                    FlexColor.darkM3SurfaceContainerHighest,
                inverseSurface: FlexColor.materialLightSurface,
                scaffoldBackground: FlexColor.materialDarkScaffoldBackground,
                dialogBackground: FlexColor.darkM3SurfaceContainerHigh,
              );
        }
      } else {
        if (isLight) {
          surface = surfaceColors ??
              const FlexSchemeSurfaceColors(
                surface: FlexColor.lightSurface,
                surfaceDim: FlexColor.lightM3SurfaceDim,
                surfaceBright: FlexColor.lightM3SurfaceBright,
                surfaceContainerLowest: FlexColor.lightM3SurfaceContainerLowest,
                surfaceContainerLow: FlexColor.lightM3SurfaceContainerLow,
                surfaceContainer: FlexColor.lightM3SurfaceContainer,
                surfaceContainerHigh: FlexColor.lightM3SurfaceContainerHigh,
                surfaceContainerHighest:
                    FlexColor.lightM3SurfaceContainerHighest,
                inverseSurface: FlexColor.darkSurface,
                scaffoldBackground: FlexColor.lightSurface,
                dialogBackground: FlexColor.lightM3SurfaceContainerHigh,
              );
        } else {
          surface = surfaceColors ??
              const FlexSchemeSurfaceColors(
                surface: FlexColor.darkSurface,
                surfaceDim: FlexColor.darkM3SurfaceDim,
                surfaceBright: FlexColor.darkM3SurfaceBright,
                surfaceContainerLowest: FlexColor.darkM3SurfaceContainerLowest,
                surfaceContainerLow: FlexColor.darkM3SurfaceContainerLow,
                surfaceContainer: FlexColor.darkM3SurfaceContainer,
                surfaceContainerHigh: FlexColor.darkM3SurfaceContainerHigh,
                surfaceContainerHighest:
                    FlexColor.darkM3SurfaceContainerHighest,
                inverseSurface: FlexColor.lightSurface,
                scaffoldBackground: FlexColor.darkSurface,
                dialogBackground: FlexColor.darkM3SurfaceContainerHigh,
              );
        }
      }
    }
    // In mode `highScaffoldLowSurfaces` and
    // `highScaffoldLowSurfacesVariantDialog`, we use FlexColor
    // default background color on all surfaces. The FlexColor background color
    // is slightly darker in dark mode and a bit off white in light mode,
    // as compared to FlexColor.lightSurface and dark surface.
    if (surfaceMode == FlexSurfaceMode.highScaffoldLowSurfaces ||
        surfaceMode == FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog) {
      if (usedBlendLevel == 0) {
        if (isLight) {
          surface = surfaceColors ??
              const FlexSchemeSurfaceColors(
                surface: FlexColor.materialLightSurface,
                surfaceDim: FlexColor.lightM3SurfaceDim,
                surfaceBright: FlexColor.lightM3SurfaceBright,
                surfaceContainerLowest: FlexColor.lightM3SurfaceContainerLowest,
                surfaceContainerLow: FlexColor.lightM3SurfaceContainerLow,
                surfaceContainer: FlexColor.lightM3SurfaceContainer,
                surfaceContainerHigh: FlexColor.lightM3SurfaceContainerHigh,
                surfaceContainerHighest:
                    FlexColor.lightM3SurfaceContainerHighest,
                inverseSurface: FlexColor.materialDarkSurface,
                scaffoldBackground: FlexColor.materialLightScaffoldBackground,
                dialogBackground: FlexColor.lightM3SurfaceContainerHigh,
              );
        } else {
          surface = surfaceColors ??
              const FlexSchemeSurfaceColors(
                surface: FlexColor.materialDarkSurface,
                surfaceDim: FlexColor.darkM3SurfaceDim,
                surfaceBright: FlexColor.darkM3SurfaceBright,
                surfaceContainerLowest: FlexColor.darkM3SurfaceContainerLowest,
                surfaceContainerLow: FlexColor.darkM3SurfaceContainerLow,
                surfaceContainer: FlexColor.darkM3SurfaceContainer,
                surfaceContainerHigh: FlexColor.darkM3SurfaceContainerHigh,
                surfaceContainerHighest:
                    FlexColor.darkM3SurfaceContainerHighest,
                inverseSurface: FlexColor.materialLightSurface,
                scaffoldBackground: FlexColor.materialDarkScaffoldBackground,
                dialogBackground: FlexColor.darkM3SurfaceContainerHigh,
              );
        }
      } else {
        if (isLight) {
          surface = surfaceColors ??
              const FlexSchemeSurfaceColors(
                surface: FlexColor.lightBackground,
                // surfaceVariant: FlexColor.lightSurfaceVariant,
                surfaceDim: FlexColor.lightM3SurfaceDim,
                surfaceBright: FlexColor.lightM3SurfaceBright,
                surfaceContainerLowest: FlexColor.lightM3SurfaceContainerLowest,
                surfaceContainerLow: FlexColor.lightM3SurfaceContainerLow,
                surfaceContainer: FlexColor.lightM3SurfaceContainer,
                surfaceContainerHigh: FlexColor.lightM3SurfaceContainerHigh,
                surfaceContainerHighest:
                    FlexColor.lightM3SurfaceContainerHighest,
                inverseSurface: FlexColor.darkBackground,
                scaffoldBackground: FlexColor.lightBackground,
                dialogBackground: FlexColor.lightM3SurfaceContainerHigh,
              );
        } else {
          surface = surfaceColors ??
              const FlexSchemeSurfaceColors(
                surface: FlexColor.darkBackground,
                surfaceDim: FlexColor.darkM3SurfaceDim,
                surfaceBright: FlexColor.darkM3SurfaceBright,
                surfaceContainerLowest: FlexColor.darkM3SurfaceContainerLowest,
                surfaceContainerLow: FlexColor.darkM3SurfaceContainerLow,
                surfaceContainer: FlexColor.darkM3SurfaceContainer,
                surfaceContainerHigh: FlexColor.darkM3SurfaceContainerHigh,
                surfaceContainerHighest:
                    FlexColor.darkM3SurfaceContainerHighest,
                inverseSurface: FlexColor.lightBackground,
                scaffoldBackground: FlexColor.darkBackground,
                dialogBackground: FlexColor.darkM3SurfaceContainerHigh,
              );
        }
      }
    }

    /// Get alpha blend values corresponding to used mode, level and brightness.
    final FlexAlphaValues alphaValue =
        FlexAlphaValues.getAlphas(surfaceMode, usedBlendLevel);
    // Return the computed and resulting surface colors.
    return FlexSchemeSurfaceColors(
      surface: surface.surface
          .blendAlpha(blendColor.surface, alphaValue.surfaceAlpha),
      surfaceDim: surface.surfaceDim.blendAlpha(blendColor.surfaceDim,
          alphaValue.surfaceVariantAlpha ~/ surfaceVariantBlendDivide),
      surfaceBright: surface.surfaceBright.blendAlpha(blendColor.surfaceBright,
          alphaValue.surfaceVariantAlpha ~/ surfaceVariantBlendDivide),
      surfaceContainerLowest: surface.surfaceContainerLowest.blendAlpha(
          blendColor.surfaceContainerLowest,
          alphaValue.surfaceVariantAlpha ~/ surfaceVariantBlendDivide),
      surfaceContainerLow: surface.surfaceContainerLow.blendAlpha(
          blendColor.surfaceContainerLow,
          alphaValue.surfaceVariantAlpha ~/ surfaceVariantBlendDivide),
      surfaceContainer: surface.surfaceContainer.blendAlpha(
          blendColor.surfaceContainer,
          alphaValue.surfaceVariantAlpha ~/ surfaceVariantBlendDivide),
      surfaceContainerHigh: surface.surfaceContainerHigh.blendAlpha(
          blendColor.surfaceContainerHigh,
          alphaValue.surfaceVariantAlpha ~/ surfaceVariantBlendDivide),
      surfaceContainerHighest: surface.surfaceContainerHighest.blendAlpha(
          blendColor.surfaceContainerHighest,
          alphaValue.surfaceVariantAlpha ~/ surfaceVariantBlendDivide),
      inverseSurface: surface.inverseSurface.blendAlpha(
          blendColor.inverseSurface, alphaValue.inverseSurfaceAlpha),
      dialogBackground: surface.dialogBackground
          .blendAlpha(blendColor.dialogBackground, alphaValue.dialogAlpha),
      scaffoldBackground: surface.scaffoldBackground
          .blendAlpha(blendColor.scaffoldBackground, alphaValue.scaffoldAlpha),
    );
  }

  /// Copy the object with one or more provided properties changed.
  FlexSchemeSurfaceColors copyWith({
    Color? surface,
    Color? surfaceDim,
    Color? surfaceBright,
    Color? surfaceContainerLowest,
    Color? surfaceContainerLow,
    Color? surfaceContainer,
    Color? surfaceContainerHigh,
    Color? surfaceContainerHighest,
    Color? inverseSurface,
    Color? scaffoldBackground,
    Color? dialogBackground,
    @Deprecated('This color was deprecated in FCS 8.0 because Flutter 3.22 '
        'deprecated the color, it has no function and should not be used.')
    Color? surfaceVariant,
    @Deprecated('This color was deprecated in FCS 8.0 because Flutter 3.22 '
        'deprecated the color, it has no function and should not be used.')
    Color? background,
  }) {
    return FlexSchemeSurfaceColors(
      surface: surface ?? this.surface,
      surfaceDim: surfaceDim ?? this.surfaceDim,
      surfaceBright: surfaceBright ?? this.surfaceBright,
      surfaceContainerLowest:
          surfaceContainerLowest ?? this.surfaceContainerLowest,
      surfaceContainerLow: surfaceContainerLow ?? this.surfaceContainerLow,
      surfaceContainer: surfaceContainer ?? this.surfaceContainer,
      surfaceContainerHigh: surfaceContainerHigh ?? this.surfaceContainerHigh,
      surfaceContainerHighest:
          surfaceContainerHighest ?? this.surfaceContainerHighest,
      inverseSurface: inverseSurface ?? this.inverseSurface,
      scaffoldBackground: scaffoldBackground ?? this.scaffoldBackground,
      dialogBackground: dialogBackground ?? this.dialogBackground,
    );
  }

  /// Override the equality operator.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is FlexSchemeSurfaceColors &&
        other.surface == surface &&
        other.surfaceDim == surfaceDim &&
        other.surfaceBright == surfaceBright &&
        other.surfaceContainerLowest == surfaceContainerLowest &&
        other.surfaceContainerLow == surfaceContainerLow &&
        other.surfaceContainer == surfaceContainer &&
        other.surfaceContainerHigh == surfaceContainerHigh &&
        other.surfaceContainerHighest == surfaceContainerHighest &&
        other.inverseSurface == inverseSurface &&
        other.scaffoldBackground == scaffoldBackground &&
        other.dialogBackground == dialogBackground;
  }

  /// Override for hashcode, dart.ui Jenkins based.
  @override
  int get hashCode => Object.hash(
        surface,
        surfaceDim,
        surfaceBright,
        surfaceContainerLowest,
        surfaceContainerLow,
        surfaceContainer,
        surfaceContainerHigh,
        surfaceContainerHighest,
        inverseSurface,
        scaffoldBackground,
        dialogBackground,
      );

  /// Flutter debug properties override, includes toString.
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('surface', surface));
    properties.add(ColorProperty('surfaceDim', surfaceDim));
    properties.add(ColorProperty('surfaceBright', surfaceBright));
    properties
        .add(ColorProperty('surfaceContainerLowest', surfaceContainerLowest));
    properties.add(ColorProperty('surfaceContainerLow', surfaceContainerLow));
    properties.add(ColorProperty('surfaceContainer', surfaceContainer));
    properties.add(ColorProperty('surfaceContainerHigh', surfaceContainerHigh));
    properties
        .add(ColorProperty('surfaceContainerHighest', surfaceContainerHighest));
    properties.add(ColorProperty('inverseSurface', inverseSurface));
    properties.add(ColorProperty('scaffoldBackground', scaffoldBackground));
    properties.add(ColorProperty('dialogBackground', dialogBackground));
  }
}
