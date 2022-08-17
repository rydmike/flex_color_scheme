import 'dart:math' as math;

import 'package:material_color_utilities/material_color_utilities.dart';

// ignore_for_file: comment_references

/// An intermediate concept between the key color for a UI theme, and a full
/// color scheme. Totally 5 tonal palettes are generated, plus a fixed error
/// palette.
///
/// This extends the Google Material team's [CorePalette] with the capability
/// to create the M3 ColorScheme needed palettes from 3 different ARGB seed
/// colors, instead of just one, as provided via [CorePalette.of].
class FlexCorePalette extends CorePalette {
  /// Create a [CorePalette] from a fixed-size list of ARGB color integers
  /// representing concatenated tonal palettes.
  ///
  /// Inverse of [asList].
  ///
  /// This is the only interface into the parent class. It would have
  /// been cleaner if parent also had normal unnamed constructor with setters
  /// for final properties, but it does not. The default constructor is private
  /// and using class initializer lists. Clearly the super class is not intended
  /// to be very extension friendly.
  FlexCorePalette.fromList(super.colors) : super.fromList();

  /// Create a [FlexCorePalette] from one to three seed colors.
  ///
  /// If only [primary] is provided, this is the same as using the super
  /// [CorePalette.of] static, that returns an instance of [CorePalette]
  /// created from a single ARGB seed color.
  ///
  /// When using optional [secondary] and [tertiary] parameters, the
  /// same chroma is used as in Flutter SDK [ColorScheme.fromSeed] when it
  /// uses [CorePalette.of], but they can optionally use their own hue value.
  /// If [secondary] or [tertiary] are not provided, the [TonalPalette]
  /// creation for them falls back to same values as used for the
  /// corresponding palette when using [CorePalette.of].
  factory FlexCorePalette.fromSeeds({
    /// Integer ARGB value of seed color used for primary tonal palette.
    ///
    /// By default a minimum of Cam16 chroma 48 is used to ensure a bright
    /// palette. If chroma of the provided color is higher than 48, it is
    /// used. A chroma value can also be specified via [primaryChroma],
    /// if it, then the passed chroma value is used.
    required int primary,

    /// Integer ARGB value of seed color used for secondary tonal palette.
    /// If not provided, the palette is based on [primary] with Cam16 chroma
    /// at 16.
    ///
    /// A chroma value can also be specified via [secondaryChroma].
    int? secondary,

    /// Integer ARGB value of seed color used for tertiary tonal palette.
    /// Cam16 chroma is capped at 48 if provided. If not provided, the palette
    /// is based on [primary] with Cam16 hue+60 and chroma at 24.
    ///
    /// A chroma value can also be specified via [tertiaryChroma].
    int? tertiary,

    /// Cam16 chroma value to use for primary colors [TonalPalette} generation.
    ///
    /// If null, the chroma value from the used primary seed key color is used,
    /// if it is larger than [primaryMinChroma].
    ///
    /// Flutter SDK [ColorScheme.fromSeed] uses "null", with a
    /// [primaryMinChroma] set to 48, so the chroma from the key color is used
    /// when above 48, but never lower than 48. This keeps primary color at the
    /// used tonal values reasonably vivid and usable regardless of uses primary
    /// key color.
    ///
    /// To use chroma value from the primary key color, pass in null and keep
    /// min chroma below  desired threshold for required colorfulness.
    final double? primaryChroma,

    /// The minimum used chroma value.
    ///
    /// If chroma in provided primary key color is below this value, or if a
    /// fixed [primaryChroma] is provided that is lower than [primaryMinChroma]
    /// then the [primaryMinChroma] value is used.
    ///
    /// Defaults to 48.
    ///
    /// Flutter SDK uses 48 via a hard coded value and design.
    final double primaryMinChroma = 48,

    /// Cam16 chroma value to use for secondary colors [TonalPalette}
    /// generation.
    ///
    /// If null, the chroma value from the used secondary seed key color is
    /// used, if it is larger than [secondaryMinChroma].
    ///
    /// Flutter SDK [ColorScheme.fromSeed] uses [secondaryChroma] hard coded
    /// and locked to 16.
    ///
    /// Defaults to 16.
    ///
    /// The default produces quite soft and muted tones as secondary tonal
    /// palette at the mid-point tones of the palette.
    ///
    /// To use chroma value from the primary key color, pass in null and keep
    /// min chroma below  desired threshold for required colorfulness.
    final double? secondaryChroma = 16,

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
    final double secondaryMinChroma = 0,

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
    final double? tertiaryChroma = 24,

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
    final double tertiaryMinChroma = 0,

    /// Cam16 chroma value to use for neutral colors [TonalPalette} generation.
    ///
    /// Always uses chroma from the primary key color, but you can vary the
    /// amount of chroma from primary key color that is used to generate
    /// the tonal palette
    ///
    /// Flutter SDK [ColorScheme.fromSeed] uses [neutralChroma] hard coded
    /// and locked to 4.
    ///
    /// Defaults to 4.
    final double neutralChroma = 4,

    /// Cam16 chroma value to use for neutralVariant colors
    /// [TonalPalette} generation.
    ///
    /// Always uses chroma from the primary key color, but you can vary the
    /// amount of chroma from primary key color that is used to generate
    /// the tonal palette
    ///
    /// Flutter SDK [ColorScheme.fromSeed] uses [neutralVariantChroma] hard
    /// coded and locked to 8.
    ///
    /// Defaults to 8.
    final double neutralVariantChroma = 8,
  }) {
    // Primary TonalPalette calculation.
    //
    // Key color is required, we can use it.
    final Cam16 camPrimary = Cam16.fromInt(primary);
    // If a fixed chroma was given we use it instead of chroma in primary.
    final double effectivePrimaryChroma = primaryChroma ?? camPrimary.chroma;
    // We use the effectiveChroma, but only if it is over the min level.
    final TonalPalette tonalPrimary = TonalPalette.of(
        camPrimary.hue, math.max(primaryMinChroma, effectivePrimaryChroma));

    // Secondary TonalPalette calculation.
    //
    // Provided key color may be null, then we use primary as key color.
    final Cam16 camSecondary =
        secondary == null ? camPrimary : Cam16.fromInt(secondary);
    // If a fixed chroma value was given we will use it.
    final double effectiveSecondaryChroma =
        secondaryChroma ?? camSecondary.chroma;
    // We use the effectiveChroma, but only if it is over the min level.
    final TonalPalette tonalSecondary = TonalPalette.of(camSecondary.hue,
        math.max(secondaryMinChroma, effectiveSecondaryChroma));

    // Tertiary TonalPalette calculation.
    //
    // Provided key color may be null, then we use primary as key color.
    final Cam16 camTertiary =
        tertiary == null ? camPrimary : Cam16.fromInt(tertiary);
    // If a fixed chroma value was given we will use it.
    final double effectiveTertiaryChroma = tertiaryChroma ?? camTertiary.chroma;
    // If we had no tertiary keyColor, we won't use primary key's hue directly,
    // we add 60 to it, this is the M3 way to shift hue from a single key.
    // We could also below write camTertiary su to above fallback, but this
    // felt making the intent more explicitly clear,
    final double effectiveTertiaryHue =
        tertiary == null ? camPrimary.hue + 60 : camTertiary.hue;
    // We use the effective hue and the effectiveChroma, but chroma only if it
    // is over the min level.
    final TonalPalette tonalTertiary = TonalPalette.of(effectiveTertiaryHue,
        math.max(tertiaryMinChroma, effectiveTertiaryChroma));

    // Neutral TonalPalettes are made from primary, with a bit of its chroma
    final TonalPalette tonalNeutral =
        TonalPalette.of(camPrimary.hue, neutralChroma);
    final TonalPalette tonalNeutralVariant =
        TonalPalette.of(camPrimary.hue, neutralVariantChroma);
    // The TonalPalette for error color is hard coded into parent class.
    // It is added automatically to created [CorePalette] as:
    // final TonalPalette error = TonalPalette.of(25, 84);
    // when it is created using super .fromList.

    // Dump all colors for the tonal palettes into an integer list. This is
    // the only interface into parent class to create the instance. Feels
    // like it is made as an FFI interface, works but odd in a pure Dart class.
    final List<int> tonalPalettes = <int>[
      ...tonalPrimary.asList,
      ...tonalSecondary.asList,
      ...tonalTertiary.asList,
      ...tonalNeutral.asList,
      ...tonalNeutralVariant.asList,
    ];
    return FlexCorePalette.fromList(tonalPalettes);
  }
}
