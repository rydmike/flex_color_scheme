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
/// Included colors are [surface], [surfaceVariant], [inverseSurface] and
/// [background], plus blended surface colors
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
    Color? surfaceVariant,
    Color? inverseSurface,
    required this.dialogBackground,
    required this.background,
    required this.scaffoldBackground,
  })  : _surfaceVariant = surfaceVariant,
        _inverseSurface = inverseSurface;

  /// The background color for widgets like [Card] and [Dialog].
  ///
  /// The default background color of [Material] of type card.
  final Color surface;

  /// A color variant of [surface] that can be used for differentiation
  /// against a component using [surface]. Local variable with initializer used
  /// in order to not break past const interface, with past required props.
  final Color? _surfaceVariant;

  /// A color variant of [surface] that can be used for differentiation against
  /// a component using [surface]. Defaults to [surface] as fallback.
  Color get surfaceVariant => _surfaceVariant ?? surface;

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

  /// A color that typically appears behind scrollable content.
  ///
  /// The default background color of [Material] of type canvas.
  final Color background;

  /// The color of the [Scaffold] background.
  final Color scaffoldBackground;

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
          surfaceVariant: scheme.primary,
          inverseSurface: scheme.primary,
          dialogBackground: scheme.primary,
          background: scheme.primary,
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
                surfaceVariant: FlexColor.lightSurfaceVariant,
                inverseSurface: FlexColor.materialDarkSurface,
                background: FlexColor.materialLightBackground,
                scaffoldBackground: FlexColor.materialLightScaffoldBackground,
                dialogBackground: FlexColor.materialLightSurface,
              )
            : const FlexSchemeSurfaceColors(
                surface: FlexColor.materialDarkSurface,
                surfaceVariant: FlexColor.darkSurfaceVariant,
                inverseSurface: FlexColor.materialLightSurface,
                background: FlexColor.materialDarkBackground,
                scaffoldBackground: FlexColor.materialDarkScaffoldBackground,
                dialogBackground: FlexColor.materialDarkSurface,
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
                surfaceVariant: FlexColor.lightSurfaceVariant,
                inverseSurface: FlexColor.materialDarkSurface,
                background: FlexColor.materialLightBackground,
                scaffoldBackground: FlexColor.materialLightScaffoldBackground,
                dialogBackground: FlexColor.materialLightSurface,
              );
        } else {
          surface = surfaceColors ??
              const FlexSchemeSurfaceColors(
                surface: FlexColor.materialDarkSurface,
                surfaceVariant: FlexColor.darkSurfaceVariant,
                inverseSurface: FlexColor.materialLightSurface,
                background: FlexColor.materialDarkBackground,
                scaffoldBackground: FlexColor.materialDarkScaffoldBackground,
                dialogBackground: FlexColor.materialDarkSurface,
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
                surfaceVariant: FlexColor.lightSurfaceVariant,
                inverseSurface: FlexColor.darkSurface,
                background: FlexColor.lightBackground,
                scaffoldBackground: FlexColor.lightScaffoldBackground,
                dialogBackground: FlexColor.lightSurface,
              );
        } else {
          surface = surfaceColors ??
              const FlexSchemeSurfaceColors(
                surface: FlexColor.darkSurface,
                surfaceVariant: FlexColor.darkSurfaceVariant,
                inverseSurface: FlexColor.lightSurface,
                background: FlexColor.darkBackground,
                scaffoldBackground: FlexColor.darkScaffoldBackground,
                dialogBackground: FlexColor.darkSurface,
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
                surfaceVariant: FlexColor.lightSurfaceVariant,
                inverseSurface: FlexColor.materialDarkSurface,
                background: FlexColor.materialLightBackground,
                scaffoldBackground: FlexColor.materialLightScaffoldBackground,
                dialogBackground: FlexColor.materialLightSurface,
              );
        } else {
          surface = surfaceColors ??
              const FlexSchemeSurfaceColors(
                surface: FlexColor.materialDarkSurface,
                surfaceVariant: FlexColor.darkSurfaceVariant,
                inverseSurface: FlexColor.materialLightSurface,
                background: FlexColor.materialDarkBackground,
                scaffoldBackground: FlexColor.materialDarkScaffoldBackground,
                dialogBackground: FlexColor.materialDarkSurface,
              );
        }
      } else {
        if (isLight) {
          surface = surfaceColors ??
              const FlexSchemeSurfaceColors(
                surface: FlexColor.lightSurface,
                surfaceVariant: FlexColor.lightSurfaceVariant,
                inverseSurface: FlexColor.darkSurface,
                background: FlexColor.lightSurface,
                scaffoldBackground: FlexColor.lightSurface,
                dialogBackground: FlexColor.lightSurface,
              );
        } else {
          surface = surfaceColors ??
              const FlexSchemeSurfaceColors(
                surface: FlexColor.darkSurface,
                surfaceVariant: FlexColor.darkSurfaceVariant,
                inverseSurface: FlexColor.lightSurface,
                background: FlexColor.darkSurface,
                scaffoldBackground: FlexColor.darkSurface,
                dialogBackground: FlexColor.darkSurface,
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
                surfaceVariant: FlexColor.lightSurfaceVariant,
                inverseSurface: FlexColor.materialDarkSurface,
                background: FlexColor.materialLightBackground,
                scaffoldBackground: FlexColor.materialLightScaffoldBackground,
                dialogBackground: FlexColor.materialLightSurface,
              );
        } else {
          surface = surfaceColors ??
              const FlexSchemeSurfaceColors(
                surface: FlexColor.materialDarkSurface,
                surfaceVariant: FlexColor.darkSurfaceVariant,
                inverseSurface: FlexColor.materialLightSurface,
                background: FlexColor.materialDarkBackground,
                scaffoldBackground: FlexColor.materialDarkScaffoldBackground,
                dialogBackground: FlexColor.materialDarkSurface,
              );
        }
      } else {
        if (isLight) {
          surface = surfaceColors ??
              const FlexSchemeSurfaceColors(
                surface: FlexColor.lightBackground,
                surfaceVariant: FlexColor.lightSurfaceVariant,
                inverseSurface: FlexColor.darkBackground,
                background: FlexColor.lightBackground,
                scaffoldBackground: FlexColor.lightBackground,
                dialogBackground: FlexColor.lightBackground,
              );
        } else {
          surface = surfaceColors ??
              const FlexSchemeSurfaceColors(
                surface: FlexColor.darkBackground,
                surfaceVariant: FlexColor.darkSurfaceVariant,
                inverseSurface: FlexColor.lightBackground,
                background: FlexColor.darkBackground,
                scaffoldBackground: FlexColor.darkBackground,
                dialogBackground: FlexColor.darkBackground,
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
      surfaceVariant: surface.surfaceVariant.blendAlpha(
          blendColor.surfaceVariant,
          alphaValue.surfaceVariantAlpha ~/ surfaceVariantBlendDivide),
      inverseSurface: surface.inverseSurface.blendAlpha(
          blendColor.inverseSurface, alphaValue.inverseSurfaceAlpha),
      dialogBackground: surface.dialogBackground
          .blendAlpha(blendColor.dialogBackground, alphaValue.dialogAlpha),
      background: surface.background
          .blendAlpha(blendColor.background, alphaValue.backgroundAlpha),
      scaffoldBackground: surface.scaffoldBackground
          .blendAlpha(blendColor.scaffoldBackground, alphaValue.scaffoldAlpha),
    );
  }

  /// Copy the object with one or more provided properties changed.
  FlexSchemeSurfaceColors copyWith({
    Color? surface,
    Color? surfaceVariant,
    Color? inverseSurface,
    Color? background,
    Color? scaffoldBackground,
    Color? dialogBackground,
  }) {
    return FlexSchemeSurfaceColors(
      surface: surface ?? this.surface,
      surfaceVariant: surfaceVariant ?? this.surfaceVariant,
      inverseSurface: inverseSurface ?? this.inverseSurface,
      background: background ?? this.background,
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
        other.surfaceVariant == surfaceVariant &&
        other.inverseSurface == inverseSurface &&
        other.background == background &&
        other.scaffoldBackground == scaffoldBackground &&
        other.dialogBackground == dialogBackground;
  }

  /// Override for hashcode, dart.ui Jenkins based.
  @override
  int get hashCode => Object.hash(
        surface,
        surfaceVariant,
        inverseSurface,
        background,
        scaffoldBackground,
        dialogBackground,
      );

  /// Flutter debug properties override, includes toString.
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('surface', surface));
    properties.add(ColorProperty('surfaceVariant', surfaceVariant));
    properties.add(ColorProperty('inverseSurface', inverseSurface));
    properties.add(ColorProperty('background', background));
    properties.add(ColorProperty('scaffoldBackground', scaffoldBackground));
    properties.add(ColorProperty('dialogBackground', dialogBackground));
  }
}
