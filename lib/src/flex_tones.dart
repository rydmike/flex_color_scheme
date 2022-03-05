import 'dart:ui';

import 'package:flutter/foundation.dart';

// ignore_for_file: comment_references

/// Configuration data class that defines which tone to use for each
/// [TonalPalette] to extract the used color by each [ColorScheme] color.
///
/// It is also possible to define how Cam16 chroma is used and limited when
/// generating the tonal palette.
///
/// When [TonalPalette]s are generated from key color(s) and used to define
/// a [ColorScheme], it is recommended to use the same key colors and
/// [FlexTone] setup for both the light and dark theme. By doing so the
/// same [TonalPalette] is used to assign suitable tones from the same
/// [TonalPalette] bu using different tones.
///
/// When you use [FlexColorScheme.dark] and its built in schemes via [scheme]
/// enum property, it automatically uses the light mode [primary],
/// [secondary] and [tertiary] color definitions as seed keys for their
/// respective tonal palette generation. Thus creating identical [TonalPalettes]
/// for dark mode as for light mode and using the tones based and chroma setup
/// from provided or default [FlexTone].
///
/// If you make custom color schemes using [FlexColorScheme] it is up to you
/// to define what colors you use when you use key colors to seed
/// [ColorScheme]s.
///
/// The used default [FlexTone.light] and [FlexTone.dark] match the definition
/// Flutter SDK uses for its Material Design 3 based seed generated tones.
/// In Flutter it has corded values. You have to go to lower APIs and open them
/// up a bit to offer the possibilities and flexibility FlexColorScheme
/// provides.
@immutable
class FlexTone with Diagnosticable {
  /// Default constructor requiring all properties.
  ///
  /// Prefer using [FlexTone.light] or [FlexTone.dark].
  const FlexTone({
    required this.primaryTone,
    required this.onPrimaryTone,
    required this.primaryContainerTone,
    required this.onPrimaryContainerTone,
    required this.secondaryTone,
    required this.onSecondaryTone,
    required this.secondaryContainerTone,
    required this.onSecondaryContainerTone,
    required this.tertiaryTone,
    required this.onTertiaryTone,
    required this.tertiaryContainerTone,
    required this.onTertiaryContainerTone,
    required this.errorTone,
    required this.onErrorTone,
    required this.errorContainerTone,
    required this.onErrorContainerTone,
    required this.backgroundTone,
    required this.onBackgroundTone,
    required this.surfaceTone,
    required this.onSurfaceTone,
    required this.surfaceVariantTone,
    required this.onSurfaceVariantTone,
    required this.outlineTone,
    required this.shadowTone,
    required this.inverseSurfaceTone,
    required this.onInverseSurfaceTone,
    required this.inversePrimaryTone,
    this.primaryChroma,
    required this.primaryMinChroma,
    this.secondaryChroma,
    required this.secondaryMinChroma,
    this.tertiaryChroma,
    required this.tertiaryMinChroma,
  });

  /// Create a M3 standard light tonal palette tones extraction and
  /// CAM16 chroma setup.
  ///
  /// This setup will if only one seed color is used, produce the same result
  /// with [FlexColorPalette] as [Scheme.light] using [ColorPalette.of] as
  /// used by Flutter SDK does.
  const FlexTone.light({
    this.primaryTone = 40,
    this.onPrimaryTone = 100,
    this.primaryContainerTone = 90,
    this.onPrimaryContainerTone = 10,
    this.secondaryTone = 40,
    this.onSecondaryTone = 100,
    this.secondaryContainerTone = 90,
    this.onSecondaryContainerTone = 10,
    this.tertiaryTone = 40,
    this.onTertiaryTone = 100,
    this.tertiaryContainerTone = 90,
    this.onTertiaryContainerTone = 10,
    this.errorTone = 40,
    this.onErrorTone = 100,
    this.errorContainerTone = 90,
    this.onErrorContainerTone = 10,
    this.backgroundTone = 99,
    this.onBackgroundTone = 10,
    this.surfaceTone = 99,
    this.onSurfaceTone = 10,
    this.surfaceVariantTone = 90,
    this.onSurfaceVariantTone = 30,
    this.outlineTone = 50,
    this.shadowTone = 0,
    this.inverseSurfaceTone = 20,
    this.onInverseSurfaceTone = 95,
    this.inversePrimaryTone = 80,
    this.primaryChroma, // Defaults to null, chroma in key color is used.
    this.primaryMinChroma = 48,
    this.secondaryChroma = 16,
    this.secondaryMinChroma = 0,
    this.tertiaryChroma = 24,
    this.tertiaryMinChroma = 0,
  });

  /// Create a M3 standard dark tonal palette tones extraction and
  /// CAM16 chroma setup.
  ///
  /// This setup will if only one seed color is used, produce the same result
  /// with [FlexColorPalette] as [Scheme.dark] using [ColorPalette.of] as
  /// used by Flutter SDK does.
  const FlexTone.dark({
    this.primaryTone = 80,
    this.onPrimaryTone = 20,
    this.primaryContainerTone = 30,
    this.onPrimaryContainerTone = 90,
    this.secondaryTone = 80,
    this.onSecondaryTone = 20,
    this.secondaryContainerTone = 30,
    this.onSecondaryContainerTone = 90,
    this.tertiaryTone = 80,
    this.onTertiaryTone = 20,
    this.tertiaryContainerTone = 30,
    this.onTertiaryContainerTone = 90,
    this.errorTone = 80,
    this.onErrorTone = 20,
    this.errorContainerTone = 30,
    this.onErrorContainerTone = 80,
    this.backgroundTone = 10,
    this.onBackgroundTone = 90,
    this.surfaceTone = 10,
    this.onSurfaceTone = 90,
    this.surfaceVariantTone = 30,
    this.onSurfaceVariantTone = 80,
    this.outlineTone = 60,
    this.shadowTone = 0,
    this.inverseSurfaceTone = 90,
    this.onInverseSurfaceTone = 20,
    this.inversePrimaryTone = 40,
    this.primaryChroma, // Defaults to null, chroma in key color is used.
    this.primaryMinChroma = 48,
    this.secondaryChroma = 16,
    this.secondaryMinChroma = 0,
    this.tertiaryChroma = 24,
    this.tertiaryMinChroma = 0,
  });

  /// Alternative static constructor with brightness as input to create
  /// a tonal palette extraction setup matching the Material Design 3 setup.
  static FlexTone material(Brightness brightness) =>
      brightness == Brightness.light
          ? const FlexTone.light()
          : const FlexTone.dark();

  /// Creates a tonal palette extraction setup that results in M3 like
  /// ColorsSchemes with softer colors than Material 3 defaults.
  ///
  /// Primary chroma is 30, secondary 14 and tertiary 20. Tones are same as
  /// in Material 3 default setup.
  static FlexTone soft(Brightness brightness) => brightness == Brightness.light
      ? const FlexTone.light(
          primaryChroma: 30,
          primaryMinChroma: 0,
          secondaryChroma: 14,
          tertiaryChroma: 20,
        )
      : const FlexTone.dark(
          primaryChroma: 30,
          primaryMinChroma: 0,
          secondaryChroma: 14,
          tertiaryChroma: 20,
        );

  /// Creates a tonal palette extraction setup that results in M3 like
  /// ColorsSchemes with more vivid colors.
  ///
  /// Primary tone is one tone darker than in Material 3 standard setup in light
  /// mode. As in M3 default, primary uses its own chroma, but with a minimum
  /// value of 50. Secondary and tertiary key colors use their own chroma
  /// with no min limits, making the secondary and tertiary mid tones closer
  /// to their used key colors.
  static FlexTone vivid(Brightness brightness) => brightness == Brightness.light
      ? const FlexTone.light(
          primaryTone: 30,
          primaryChroma: null,
          secondaryChroma: null,
          tertiaryChroma: null,
          primaryMinChroma: 50,
        )
      : const FlexTone.dark(
          onPrimaryTone: 10,
          primaryContainerTone: 20,
          onErrorContainerTone: 90,
          primaryChroma: null,
          secondaryChroma: null,
          tertiaryChroma: null,
          primaryMinChroma: 50);

  /// Creates a tonal palette extraction setup that results in M3 like
  /// ColorsSchemes with high contrast between color versus its on-color and
  /// main color, versus its container color.
  ///
  /// Primary, Secondary and tertiary key colors use their own chroma, but
  /// with minimum limit of 65 on primary and 55 on secondary and tertiary.
  ///
  /// Used tones are also modified from M3 defaults for increased contrast.
  ///
  /// This tonal configuration can be used to turn any M3 theme into one
  /// that may be more accessibility since it offers increased contrast.
  /// You could apply a variant of the active theme with this tonal map to
  /// the high contrast theme data, thus providing increased contrast, but in
  /// the spirit of the original theme. It may still be useful to also
  /// provide purposefully designed optional extremely high contrast
  /// themes as options for the high contrast accessibility themes.
  static FlexTone highContrast(Brightness brightness) =>
      brightness == Brightness.light
          ? const FlexTone.light(
              primaryTone: 30,
              secondaryTone: 30,
              tertiaryTone: 30,
              errorTone: 30,
              primaryContainerTone: 95,
              secondaryContainerTone: 95,
              tertiaryContainerTone: 95,
              errorContainerTone: 95,
              primaryChroma: null,
              secondaryChroma: null,
              tertiaryChroma: null,
              primaryMinChroma: 65,
              secondaryMinChroma: 55,
              tertiaryMinChroma: 55,
            )
          : const FlexTone.dark(
              primaryTone: 80,
              secondaryTone: 80,
              tertiaryTone: 80,
              errorTone: 80,
              onPrimaryTone: 10,
              onSecondaryTone: 10,
              onTertiaryTone: 10,
              onErrorTone: 10,
              primaryContainerTone: 20,
              secondaryContainerTone: 20,
              tertiaryContainerTone: 20,
              errorContainerTone: 20,
              onErrorContainerTone: 90,
              primaryChroma: null,
              secondaryChroma: null,
              tertiaryChroma: null,
              primaryMinChroma: 65,
              secondaryMinChroma: 55,
              tertiaryMinChroma: 55,
            );

  /// Tone used for [ColorScheme.primary] from primary [TonalPalette].
  final int primaryTone;

  /// Tone used for [ColorScheme.onPrimary] from primary [TonalPalette].
  final int onPrimaryTone;

  /// Tone used for [ColorScheme.primaryContainer] from primary [TonalPalette].
  final int primaryContainerTone;

  /// Tone used for [ColorScheme.onPrimaryContainer] from primary
  /// [TonalPalette].
  final int onPrimaryContainerTone;

  /// Tone used for [ColorScheme.secondary] from secondary [TonalPalette].
  final int secondaryTone;

  /// Tone used for [ColorScheme.onSecondary] from secondary [TonalPalette].
  final int onSecondaryTone;

  /// Tone used for [ColorScheme.secondaryContainer] from secondary
  /// [TonalPalette].
  final int secondaryContainerTone;

  /// Tone used for [ColorScheme.onSecondaryContainer] from secondary
  /// [TonalPalette].
  final int onSecondaryContainerTone;

  /// Tone used for [ColorScheme.tertiary] from tertiary [TonalPalette].
  final int tertiaryTone;

  /// Tone used for [ColorScheme.onTertiary] from tertiary [TonalPalette].
  final int onTertiaryTone;

  /// Tone used for [ColorScheme.tertiaryContainer] from tertiary
  /// [TonalPalette].
  final int tertiaryContainerTone;

  /// Tone used for [ColorScheme.onTertiaryContainer] from tertiary
  /// [TonalPalette].
  final int onTertiaryContainerTone;

  /// Tone used for [ColorScheme.error] from error [TonalPalette].
  final int errorTone;

  /// Tone used for [ColorScheme.onError] from error [TonalPalette].
  final int onErrorTone;

  /// Tone used for [ColorScheme.errorContainer] from error [TonalPalette].
  final int errorContainerTone;

  /// Tone used for [ColorScheme.onErrorContainer] from error [TonalPalette].
  final int onErrorContainerTone;

  /// Tone used for [ColorScheme.background] from neutral [TonalPalette].
  final int backgroundTone;

  /// Tone used for [ColorScheme.onBackground] from neutral [TonalPalette].
  final int onBackgroundTone;

  /// Tone used for [ColorScheme.surface] from neutral [TonalPalette].
  final int surfaceTone;

  /// Tone used for [ColorScheme.onSurface] from neutral [TonalPalette].
  final int onSurfaceTone;

  /// Tone used for [ColorScheme.surfaceVariant] from neutralVariant
  /// [TonalPalette].
  final int surfaceVariantTone;

  /// Tone used for [ColorScheme.onSurfaceVariant] from neutralVariant
  /// [TonalPalette].
  final int onSurfaceVariantTone;

  /// Tone used for [ColorScheme.outline] from neutralVariant [TonalPalette].
  final int outlineTone;

  /// Tone used for [ColorScheme.shadow] from neutral [TonalPalette].
  final int shadowTone;

  /// Tone used for [ColorScheme.inverseSurface] from neutral [TonalPalette].
  final int inverseSurfaceTone;

  /// Tone used for [ColorScheme.onInverseSurface] from neutral [TonalPalette].
  final int onInverseSurfaceTone;

  /// Tone used for [ColorScheme.inversePrimary] from primary [TonalPalette].
  final int inversePrimaryTone;

  /// Cam16 chroma value to use for primary colors [TonalPalette} generation.
  ///
  /// If null, the chroma value from the used primary seed key color is used,
  /// if it is larger than [primaryMinChroma].
  ///
  /// Flutter SDK [ColorScheme.fromSeed] uses "null", with a [primaryMinChroma]
  /// set to 48, so the chroma from the key color is used when above 48, but
  /// never lower than 48. This keeps primary color at the used tonal values
  /// reasonably vivid and usable regardless of uses primary key color.
  ///
  /// To use chroma value from the primary key color, pass in null and keep
  /// min chroma below  desired threshold for required colorfulness.
  final double? primaryChroma;

  /// The minimum used chroma value.
  ///
  /// If chroma in provided primary key color is below this value, or if a
  /// fixed [primaryChroma] is provided that is lower than [primaryMinChroma]
  /// then the [primaryMinChroma] value is used.
  ///
  /// Defaults to 48.
  ///
  /// Flutter SDK uses 48 via a hard coded value and design.
  final double primaryMinChroma;

  /// Cam16 chroma value to use for secondary colors [TonalPalette} generation.
  ///
  /// If null, the chroma value from the used secondary seed key color is used,
  /// if it is larger than [secondaryMinChroma].
  ///
  /// Flutter SDK [ColorScheme.fromSeed] uses [secondaryChroma] hard coded
  /// and locked to 16.
  ///
  /// Defaults to 16.
  ///
  /// The default produces quite soft and muted tones as secondary tonal palette
  /// at the mid-point tones of the palette.
  ///
  /// To use chroma value from the primary key color, pass in null and keep
  /// min chroma below  desired threshold for required colorfulness.
  final double? secondaryChroma;

  /// The minimum used chroma value.
  ///
  /// If chroma in provided secondary key color is below this value, or if a
  /// fixed [secondaryChroma] is provided that is lower than
  /// [secondaryMinChroma] then the [secondaryMinChroma] value is used.
  ///
  /// Defaults to 0.
  ///
  /// Flutter SDK only uses [secondaryChroma] hard coded to 16, and has no
  /// concept of minimum level for secondary tonal palettes as its value is
  /// always locked to 16.
  final double secondaryMinChroma;

  /// Cam16 chroma value to use for tertiary colors [TonalPalette} generation.
  ///
  /// If null, the chroma value from the used tertiary seed key color is used,
  /// if it is larger than [tertiaryMinChroma].
  ///
  /// Flutter SDK [ColorScheme.fromSeed] uses [tertiaryChroma] hard coded
  /// and locked to 24.
  ///
  /// Defaults to 24.
  ///
  /// The default produces soft and muted tones as tertiary tonal palette
  /// at the mid-point tones of the palette, that are bit less muted than
  /// the default secondary tonal palette.
  ///
  /// To use chroma value from the primary key color, pass in null and keep
  /// min chroma below  desired threshold for required colorfulness.
  final double? tertiaryChroma;

  /// The minimum used chroma value.
  ///
  /// If chroma in provided tertiary key color is below this value, or if a
  /// fixed [tertiaryChroma] is provided that is lower than
  /// [tertiaryMinChroma] then the [tertiaryMinChroma] value is used.
  ///
  /// Defaults to 0.
  ///
  /// Flutter SDK only uses [tertiaryChroma] hard coded to 24, and has no
  /// concept of minimum level for tertiary tonal palettes as its value is
  /// always locked to 24.
  final double tertiaryMinChroma;

  /// Copy the object with one or more provided properties changed.
  FlexTone copyWith({
    int? primaryTone,
    int? onPrimaryTone,
    int? primaryContainerTone,
    int? onPrimaryContainerTone,
    int? secondaryTone,
    int? onSecondaryTone,
    int? secondaryContainerTone,
    int? onSecondaryContainerTone,
    int? tertiaryTone,
    int? onTertiaryTone,
    int? tertiaryContainerTone,
    int? onTertiaryContainerTone,
    int? errorTone,
    int? onErrorTone,
    int? errorContainerTone,
    int? onErrorContainerTone,
    int? backgroundTone,
    int? onBackgroundTone,
    int? surfaceTone,
    int? onSurfaceTone,
    int? surfaceVariantTone,
    int? onSurfaceVariantTone,
    int? outlineTone,
    int? shadowTone,
    int? inverseSurfaceTone,
    int? onInverseSurfaceTone,
    int? inversePrimaryTone,
    double? primaryChroma,
    double? primaryMinChroma,
    double? secondaryChroma,
    double? secondaryMinChroma,
    double? tertiaryChroma,
    double? tertiaryMinChroma,
  }) {
    return FlexTone(
      primaryTone: primaryTone ?? this.primaryTone,
      onPrimaryTone: onPrimaryTone ?? this.onPrimaryTone,
      primaryContainerTone: primaryContainerTone ?? this.primaryContainerTone,
      onPrimaryContainerTone:
          onPrimaryContainerTone ?? this.onPrimaryContainerTone,
      secondaryTone: secondaryTone ?? this.secondaryTone,
      onSecondaryTone: onSecondaryTone ?? this.onSecondaryTone,
      secondaryContainerTone:
          secondaryContainerTone ?? this.secondaryContainerTone,
      onSecondaryContainerTone:
          onSecondaryContainerTone ?? this.onSecondaryContainerTone,
      tertiaryTone: tertiaryTone ?? this.tertiaryTone,
      onTertiaryTone: onTertiaryTone ?? this.onTertiaryTone,
      tertiaryContainerTone:
          tertiaryContainerTone ?? this.tertiaryContainerTone,
      onTertiaryContainerTone:
          onTertiaryContainerTone ?? this.onTertiaryContainerTone,
      errorTone: errorTone ?? this.errorTone,
      onErrorTone: onErrorTone ?? this.onErrorTone,
      errorContainerTone: errorContainerTone ?? this.errorContainerTone,
      onErrorContainerTone: onErrorContainerTone ?? this.onErrorContainerTone,
      backgroundTone: backgroundTone ?? this.backgroundTone,
      onBackgroundTone: onBackgroundTone ?? this.onBackgroundTone,
      surfaceTone: surfaceTone ?? this.surfaceTone,
      onSurfaceTone: onSurfaceTone ?? this.onSurfaceTone,
      surfaceVariantTone: surfaceVariantTone ?? this.surfaceVariantTone,
      onSurfaceVariantTone: onSurfaceVariantTone ?? this.onSurfaceVariantTone,
      outlineTone: outlineTone ?? this.outlineTone,
      shadowTone: shadowTone ?? this.shadowTone,
      inverseSurfaceTone: inverseSurfaceTone ?? this.inverseSurfaceTone,
      onInverseSurfaceTone: onInverseSurfaceTone ?? this.onInverseSurfaceTone,
      inversePrimaryTone: inversePrimaryTone ?? this.inversePrimaryTone,
      primaryChroma: primaryChroma ?? this.primaryChroma,
      primaryMinChroma: primaryMinChroma ?? this.primaryMinChroma,
      secondaryChroma: secondaryChroma ?? this.secondaryChroma,
      secondaryMinChroma: secondaryMinChroma ?? this.secondaryMinChroma,
      tertiaryChroma: tertiaryChroma ?? this.tertiaryChroma,
      tertiaryMinChroma: tertiaryMinChroma ?? this.tertiaryMinChroma,
    );
  }

  /// Override for equality operator.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is FlexTone &&
        other.primaryTone == primaryTone &&
        other.onPrimaryTone == onPrimaryTone &&
        other.primaryContainerTone == primaryContainerTone &&
        other.onPrimaryContainerTone == onPrimaryContainerTone &&
        other.secondaryTone == secondaryTone &&
        other.onSecondaryTone == onSecondaryTone &&
        other.secondaryContainerTone == secondaryContainerTone &&
        other.onSecondaryContainerTone == onSecondaryContainerTone &&
        other.tertiaryTone == tertiaryTone &&
        other.onTertiaryTone == onTertiaryTone &&
        other.tertiaryContainerTone == tertiaryContainerTone &&
        other.onTertiaryContainerTone == onTertiaryContainerTone &&
        other.errorTone == errorTone &&
        other.onErrorTone == onErrorTone &&
        other.errorContainerTone == errorContainerTone &&
        other.onErrorContainerTone == onErrorContainerTone &&
        other.backgroundTone == backgroundTone &&
        other.onBackgroundTone == onBackgroundTone &&
        other.surfaceTone == surfaceTone &&
        other.onSurfaceTone == onSurfaceTone &&
        other.surfaceVariantTone == surfaceVariantTone &&
        other.onSurfaceVariantTone == onSurfaceVariantTone &&
        other.outlineTone == outlineTone &&
        other.shadowTone == shadowTone &&
        other.inverseSurfaceTone == inverseSurfaceTone &&
        other.onInverseSurfaceTone == onInverseSurfaceTone &&
        other.inversePrimaryTone == inversePrimaryTone &&
        other.primaryChroma == primaryChroma &&
        other.primaryMinChroma == primaryMinChroma &&
        other.secondaryChroma == secondaryChroma &&
        other.secondaryMinChroma == secondaryMinChroma &&
        other.tertiaryChroma == tertiaryChroma &&
        other.tertiaryMinChroma == tertiaryMinChroma;
  }

  /// Override for hashcode, dart.ui Jenkins based.
  @override
  int get hashCode {
    return hashList(<Object?>[
      primaryTone,
      onPrimaryTone,
      primaryContainerTone,
      onPrimaryContainerTone,
      secondaryTone,
      onSecondaryTone,
      secondaryContainerTone,
      onSecondaryContainerTone,
      tertiaryTone,
      onTertiaryTone,
      tertiaryContainerTone,
      onTertiaryContainerTone,
      errorTone,
      onErrorTone,
      errorContainerTone,
      onErrorContainerTone,
      backgroundTone,
      onBackgroundTone,
      surfaceTone,
      onSurfaceTone,
      surfaceVariantTone,
      onSurfaceVariantTone,
      outlineTone,
      shadowTone,
      inverseSurfaceTone,
      onInverseSurfaceTone,
      inversePrimaryTone,
      primaryChroma,
      primaryMinChroma,
      secondaryChroma,
      secondaryMinChroma,
      tertiaryChroma,
      tertiaryMinChroma,
    ]);
  }

  /// Override Flutter foundation debugFillProperties, also makes toString.
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<int>('primaryTone', primaryTone));
    properties.add(DiagnosticsProperty<int>('onPrimaryTone', onPrimaryTone));
    properties.add(
        DiagnosticsProperty<int>('primaryContainerTone', primaryContainerTone));
    properties.add(DiagnosticsProperty<int>(
        'onPrimaryContainerTone', onPrimaryContainerTone));
    properties.add(DiagnosticsProperty<int>('secondaryTone', secondaryTone));
    properties
        .add(DiagnosticsProperty<int>('onSecondaryTone', onSecondaryTone));
    properties.add(DiagnosticsProperty<int>(
        'secondaryContainerTone', secondaryContainerTone));
    properties.add(DiagnosticsProperty<int>(
        'onSecondaryContainerTone', onSecondaryContainerTone));
    properties.add(DiagnosticsProperty<int>('tertiaryTone', tertiaryTone));
    properties.add(DiagnosticsProperty<int>('onTertiaryTone', onTertiaryTone));
    properties.add(DiagnosticsProperty<int>(
        'tertiaryContainerTone', tertiaryContainerTone));
    properties.add(DiagnosticsProperty<int>(
        'onTertiaryContainerTone', onTertiaryContainerTone));
    properties.add(DiagnosticsProperty<int>('errorTone', errorTone));
    properties.add(
        DiagnosticsProperty<int>('errorContainerTone', errorContainerTone));
    properties.add(
        DiagnosticsProperty<int>('onErrorContainerTone', onErrorContainerTone));
    properties.add(DiagnosticsProperty<int>('backgroundTone', backgroundTone));
    properties
        .add(DiagnosticsProperty<int>('onBackgroundTone', onBackgroundTone));
    properties.add(DiagnosticsProperty<int>('surfaceTone', surfaceTone));
    properties.add(DiagnosticsProperty<int>('onSurfaceTone', onSurfaceTone));
    properties.add(
        DiagnosticsProperty<int>('surfaceVariantTone', surfaceVariantTone));
    properties.add(
        DiagnosticsProperty<int>('onSurfaceVariantTone', onSurfaceVariantTone));
    properties.add(DiagnosticsProperty<int>('outlineTone', outlineTone));
    properties.add(DiagnosticsProperty<int>('shadowTone', shadowTone));
    properties.add(
        DiagnosticsProperty<int>('inverseSurfaceTone', inverseSurfaceTone));
    properties.add(
        DiagnosticsProperty<int>('onInverseSurfaceTone', onInverseSurfaceTone));
    properties.add(
        DiagnosticsProperty<int>('inversePrimaryTone', inversePrimaryTone));
    properties.add(DiagnosticsProperty<double>('primaryChroma', primaryChroma));
    properties
        .add(DiagnosticsProperty<double>('primaryMinChroma', primaryMinChroma));
    properties
        .add(DiagnosticsProperty<double>('secondaryChroma', secondaryChroma));
    properties.add(
        DiagnosticsProperty<double>('secondaryMinChroma', secondaryMinChroma));
    properties
        .add(DiagnosticsProperty<double>('tertiaryChroma', tertiaryChroma));
    properties.add(
        DiagnosticsProperty<double>('tertiaryMinChroma', tertiaryMinChroma));
  }
}
