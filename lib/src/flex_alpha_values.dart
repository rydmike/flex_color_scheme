import 'package:meta/meta.dart' show immutable, internal;

import 'flex_surface_mode.dart';

// ignore_for_file: comment_references

/// Internal class used to hold alpha values for a given [FlexSurfaceMode]
/// blend mode and blend level.
///
/// The alpha values are used in the alpha blend calculation for each
/// equivalently named [ColorScheme] color.
///
/// Normally only used via factory [FlexAlphaValues.getAlphas], a helper used
/// to create the setup needed to compute the alpha blend values for used
///  [FlexSurfaceMode] blend mode and blend level.
@immutable
@internal
class FlexAlphaValues {
  /// Default constructor to set alpha blend values for different colors in
  /// a Flutter ColorScheme.
  ///
  /// FlexAlphaValues are normally only made via its factor
  /// [FlexAlphaValues.getAlphas].
  const FlexAlphaValues({
    this.primaryAlpha = 0,
    this.primaryContainerAlpha = 0,
    this.secondaryAlpha = 0,
    this.secondaryContainerAlpha = 0,
    this.tertiaryAlpha = 0,
    this.tertiaryContainerAlpha = 0,
    this.errorAlpha = 0,
    this.errorContainerAlpha = 0,
    this.surfaceAlpha = 0,
    this.surfaceVariantAlpha = 0,
    this.inverseSurfaceAlpha = 0,
    this.dialogAlpha = 0,
    this.backgroundAlpha = 0,
    this.scaffoldAlpha = 0,
  });

  /// Alpha blend value for primary color.
  final int primaryAlpha;

  /// Alpha blend value for primaryContainer color.
  final int primaryContainerAlpha;

  /// Alpha blend value for secondary color.
  final int secondaryAlpha;

  /// Alpha blend value for secondaryContainer color.
  final int secondaryContainerAlpha;

  /// Alpha blend value for tertiary color.
  final int tertiaryAlpha;

  /// Alpha blend value for tertiaryContainer color.
  final int tertiaryContainerAlpha;

  /// Alpha blend value for error color.
  final int errorAlpha;

  /// Alpha blend value for error container color.
  final int errorContainerAlpha;

  /// Alpha blend value for surface color.
  final int surfaceAlpha;

  /// Alpha blend value for surfaceVariant color.
  final int surfaceVariantAlpha;

  /// Alpha blend value for inverseSurface color.
  final int inverseSurfaceAlpha;

  /// Alpha blend value for dialog color.
  final int dialogAlpha;

  /// Alpha blend value for background color.
  final int backgroundAlpha;

  /// Alpha blend value for scaffold background color.
  final int scaffoldAlpha;

  /// Factory used to get alpha values for a given blend level and blend mode
  /// and brightness.
  factory FlexAlphaValues.getAlphas(
      final FlexSurfaceMode mode, final int blendLevel) {
    switch (mode) {
      case FlexSurfaceMode.level:
      case FlexSurfaceMode.custom:
        // Result: Background (1x) Surface (1x) Scaffold (1x),
        // surfaceVariant (Surface*2)
        return FlexAlphaValues(
          primaryAlpha: blendLevel,
          primaryContainerAlpha: blendLevel * 2,
          secondaryAlpha: blendLevel,
          secondaryContainerAlpha: blendLevel * 2,
          tertiaryAlpha: blendLevel,
          tertiaryContainerAlpha: blendLevel * 2,
          errorAlpha: blendLevel,
          errorContainerAlpha: blendLevel * 2,
          surfaceAlpha: blendLevel,
          surfaceVariantAlpha: blendLevel * 2,
          inverseSurfaceAlpha: blendLevel,
          dialogAlpha: blendLevel,
          backgroundAlpha: blendLevel,
          scaffoldAlpha: blendLevel,
        );
      // Result: Background (3/2x) Surface & (1x) Scaffold (1/2x).
      // surfaceVariant (Surface*2)
      case FlexSurfaceMode.highBackgroundLowScaffold:
        return FlexAlphaValues(
          primaryAlpha: blendLevel,
          primaryContainerAlpha: blendLevel * 2,
          secondaryAlpha: blendLevel,
          secondaryContainerAlpha: blendLevel * 2,
          tertiaryAlpha: blendLevel,
          tertiaryContainerAlpha: blendLevel * 2,
          errorAlpha: blendLevel,
          errorContainerAlpha: blendLevel * 2,
          surfaceAlpha: blendLevel,
          surfaceVariantAlpha: blendLevel * 2,
          inverseSurfaceAlpha: blendLevel,
          dialogAlpha: blendLevel,
          backgroundAlpha: blendLevel * 3 ~/ 2,
          scaffoldAlpha: blendLevel ~/ 2,
        );
      // Result: Surface (3/2x) Background (1x) Scaffold (1/2x).
      // surfaceVariant (Surface*3/2)
      case FlexSurfaceMode.highSurfaceLowScaffold:
        return FlexAlphaValues(
          primaryAlpha: blendLevel,
          primaryContainerAlpha: blendLevel * 2,
          secondaryAlpha: blendLevel,
          secondaryContainerAlpha: blendLevel * 2,
          tertiaryAlpha: blendLevel,
          tertiaryContainerAlpha: blendLevel * 2,
          errorAlpha: blendLevel,
          errorContainerAlpha: blendLevel * 2,
          surfaceAlpha: blendLevel * 3 ~/ 2,
          surfaceVariantAlpha: blendLevel * 3 ~/ 2 * 3 ~/ 2,
          inverseSurfaceAlpha: blendLevel * 3 ~/ 2,
          dialogAlpha: blendLevel * 3 ~/ 2,
          backgroundAlpha: blendLevel,
          scaffoldAlpha: blendLevel ~/ 2,
        );
      // Result: Scaffold (3x) Background (1x) Surface (1/2x).
      // surfaceVariant (Surface*2)
      case FlexSurfaceMode.highScaffoldLowSurface:
        return FlexAlphaValues(
          primaryAlpha: blendLevel,
          primaryContainerAlpha: blendLevel * 2,
          secondaryAlpha: blendLevel,
          secondaryContainerAlpha: blendLevel * 2,
          tertiaryAlpha: blendLevel,
          tertiaryContainerAlpha: blendLevel * 2,
          errorAlpha: blendLevel,
          errorContainerAlpha: blendLevel * 2,
          surfaceAlpha: blendLevel ~/ 2,
          surfaceVariantAlpha: blendLevel ~/ 2 * 2,
          inverseSurfaceAlpha: blendLevel ~/ 2,
          dialogAlpha: blendLevel ~/ 2,
          backgroundAlpha: blendLevel,
          scaffoldAlpha: blendLevel * 3,
        );
      // Result: Scaffold (3x) background (3/2x) surface (1x).
      // surfaceVariant (Surface*2)
      case FlexSurfaceMode.highScaffoldLevelSurface:
        return FlexAlphaValues(
          primaryAlpha: blendLevel,
          primaryContainerAlpha: blendLevel * 2,
          secondaryAlpha: blendLevel,
          secondaryContainerAlpha: blendLevel * 2,
          tertiaryAlpha: blendLevel,
          tertiaryContainerAlpha: blendLevel * 2,
          errorAlpha: blendLevel,
          errorContainerAlpha: blendLevel * 2,
          surfaceAlpha: blendLevel,
          surfaceVariantAlpha: blendLevel * 2,
          inverseSurfaceAlpha: blendLevel,
          dialogAlpha: blendLevel,
          backgroundAlpha: blendLevel * 3 ~/ 2,
          scaffoldAlpha: blendLevel * 3,
        );
      // Result: (1x) Surface and Background (1x) Scaffold (1/2x).
      // surfaceVariant (Surface*2)
      case FlexSurfaceMode.levelSurfacesLowScaffold:
      case FlexSurfaceMode.levelSurfacesLowScaffoldVariantDialog:
        return FlexAlphaValues(
          primaryAlpha: blendLevel,
          primaryContainerAlpha: blendLevel * 2,
          secondaryAlpha: blendLevel,
          secondaryContainerAlpha: blendLevel * 2,
          tertiaryAlpha: blendLevel,
          tertiaryContainerAlpha: blendLevel * 2,
          errorAlpha: blendLevel,
          errorContainerAlpha: blendLevel * 2,
          surfaceAlpha: blendLevel,
          surfaceVariantAlpha: blendLevel * 2,
          inverseSurfaceAlpha: blendLevel,
          dialogAlpha: blendLevel,
          backgroundAlpha: blendLevel,
          scaffoldAlpha: blendLevel ~/ 2,
        );
      // Result: Scaffold (3x) Surface and background (1/2x).
      // surfaceVariant (Surface*2)
      case FlexSurfaceMode.highScaffoldLowSurfaces:
      case FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog:
        return FlexAlphaValues(
          primaryAlpha: blendLevel,
          primaryContainerAlpha: blendLevel * 2,
          secondaryAlpha: blendLevel,
          secondaryContainerAlpha: blendLevel * 2,
          tertiaryAlpha: blendLevel,
          tertiaryContainerAlpha: blendLevel * 2,
          errorAlpha: blendLevel,
          errorContainerAlpha: blendLevel * 2,
          surfaceAlpha: blendLevel ~/ 2,
          surfaceVariantAlpha: blendLevel ~/ 2 * 2,
          inverseSurfaceAlpha: blendLevel ~/ 2,
          dialogAlpha: blendLevel ~/ 2,
          backgroundAlpha: blendLevel ~/ 2,
          scaffoldAlpha: blendLevel * 3,
        );
    }
  }
}
