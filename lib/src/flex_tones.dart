import 'dart:ui';

import 'package:flutter/foundation.dart';

// ignore_for_file: comment_references

/// Configuration data class that defines which tone we should use for each
/// [TonalPalette] to extract the used color for each [ColorScheme] color.
///
/// and what color tones are used for each [ColorScheme] color.
@immutable
class FlexTones with Diagnosticable {
  /// Default constructor requiring all properties.
  ///
  /// Prefer using [FlexTones.light] or [FlexTones.dark].
  const FlexTones({
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
    this.secondaryChroma,
    this.tertiaryChroma,
  });

  // TODO(rydmike): Double check all tone values before release!

  /// Create a light tonal palette tone extraction and CAM16 chroma setup.
  const FlexTones.light({
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
    this.primaryChroma,
    this.secondaryChroma = 16,
    this.tertiaryChroma = 24,
  });

  /// Create a dark tonal palette tone extraction and CAM16 chroma setup.
  const FlexTones.dark({
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
    this.primaryChroma,
    this.secondaryChroma = 16,
    this.tertiaryChroma = 24,
  });

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

  /// The chroma value to use for primary TonalPalette.
  ///
  /// If null, the chroma value from [primary]] is used.
  /// Flutter SDK [ColorScheme.fromSeed] uses "null", i.e. the chroma value.
  final double? primaryChroma;

  /// The chroma value to use for secondary TonalPalette.
  ///
  /// If null, the chroma value from [secondary] used.
  /// Flutter SDK [ColorScheme.fromSeed] uses 16 as secondary chroma value.
  /// Uses fallback to 16, when a [secondary] color is not provided, but can
  /// be provided also when secondary is not provided, it then uses given
  /// chroma on provided primary color's hue.
  final double? secondaryChroma;

  /// The chroma value to use for tertiary TonalPalette.
  ///
  /// If null, the chroma value from [tertiary] is used.
  /// Flutter SDK [ColorScheme.fromSeed] uses 24 as tertiary chroma value.
  /// Uses fallback to 24, when a [tertiary] color is not provided, but can
  /// be provided also when secondary is not provided, it then uses given
  /// chroma on provided primary color's hue.
  final double? tertiaryChroma;

  /// Copy the object with one or more provided properties changed.
  FlexTones copyWith({
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
    double? secondaryChroma,
    double? tertiaryChroma,
  }) {
    return FlexTones(
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
      secondaryChroma: secondaryChroma ?? this.secondaryChroma,
      tertiaryChroma: tertiaryChroma ?? this.tertiaryChroma,
    );
  }

  /// Override for equality operator.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is FlexTones &&
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
        other.secondaryChroma == secondaryChroma &&
        other.tertiaryChroma == tertiaryChroma;
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
      secondaryChroma,
      tertiaryChroma,
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
        .add(DiagnosticsProperty<double>('secondaryChroma', secondaryChroma));
    properties
        .add(DiagnosticsProperty<double>('tertiaryChroma', tertiaryChroma));
  }
}
