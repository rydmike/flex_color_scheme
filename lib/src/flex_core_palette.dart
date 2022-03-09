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
  /// Create a [CorePalette] from a fixed-size list of ARGB color ints
  /// representing concatenated tonal palettes.
  ///
  /// Inverse of [asList].
  ///
  /// This is the only interface into the parent class. It would have
  /// been cleaner if parent also had normal unnamed constructor with setters
  /// for final properties, but it does not. The default constructor is private
  /// and using class initializer lists. Clearly the super class is not intended
  /// to be very extension friendly.
  FlexCorePalette.fromList(List<int> colors) : super.fromList(colors);

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

// TODO(rydmike): Decide if we use CorePalette inherited version or own class?
// Using above extended version for now.
//
// This entire commented private _CorePalette class can be used to create a
// custom version of CorePalette with the needed [fromSeeds] factory that is
// a bit more efficient than the extended version above, thanks to reduced
// interface overhead. Keeping the code around below if it is needed for
// efficiency later. Some more ramblings below.
//
// The conversion of [TonalPalette]es to a list of ints and having super
// create the CorePalette from this list, has unneeded extra overhead.
// It would be a bit more efficient to make own implementation
// of this simple mid-layer that has the needed constructors directly.
// Keeping both versions as small private classes around so I can later
// benchmark and see if it makes a difference. Perhaps it does not matter,
// in that case extending the parent [CorePalette] is a bit prettier.
// This interface feels a bit like using a FFI.
//
// The [CorePalette] in Material Color Utilities is just a convenience
// wrapper for the needed [TonalPalette]s, that are used by an additional
// upper layer called [Scheme] that [ColorScheme.fromSeed] uses to create
// a [ColorScheme] from a seed color. To make a [ColorScheme.fromSeeds]
// versions of it, we need to make a slightly modified version of it anyway.
// The usage of [CorePalette.of] is hard coded into the upper layer, so we
// cannot plug-in our extended version of it anyway.
//
// Perhaps it would be better to use our modified version of [CorePalette]
// instead and name it [FlexCorePalette], but then it does not share parent
// with  [CorePalette], which might be useful, or it might not, it is just
// color utility class, so perhaps not so important.
//
// /// An intermediate concept between the key color for a UI theme, and a full
// /// color scheme. 5 tonal palettes are generated + fixed error palette.
// ///
// /// This is a modification of package:material_color_utilities [CorePalette]
// /// to provide capability to create the M3 ColorScheme needed tonal palettes
// /// from 3 different ARGB seed colors, where 2 are optional, instead of just
// /// one as provided via package version [CorePalette.of] and here also
// /// via [_CorePalette.of].
// ///
// /// This version has an unnamed constructor for the five main final
// /// [TonalPalette] properties. Exposes the original version's private
// /// constructor as [_CorePalette.fromHueChroma] that is used by
// /// [_CorePalette.of]. It then also adds a [_CorePalette.fromSeeds] to create
// /// the [TonalPalette]s for [primary], [secondary] and [tertiary] from
// /// optional ARGB seed colors also for secondary and tertiary [TonalPalette],
// /// instead of tying them down to same seed ARGB colors as used for
// /// primary color.
// @immutable
// class _CorePalette {
//   /// Default constructor.
//   _CorePalette({
//     required this.primary,
//     required this.secondary,
//     required this.tertiary,
//     required this.neutral,
//     required this.neutralVariant,
//   });
//
//   /// The number of generated tonal palettes.
//   static const int size = 5;
//
//   /// TonalPalette for primary colors.
//   final TonalPalette primary;
//
//   /// TonalPalette for secondary colors.
//   final TonalPalette secondary;
//
//   /// TonalPalette for tertiary colors.
//   final TonalPalette tertiary;
//
//   /// TonalPalette for neutral colors. Typically hues of primary.
//   final TonalPalette neutral;
//
//   /// TonalPalette for neutralVariant colors. Typically hues of primary.
//   final TonalPalette neutralVariant;
//
//   /// TonalPalette for error colors. Fixed to given Hue and Chroma.
//   final TonalPalette error = TonalPalette.of(25, 84);
//
//   /// Create a [_CorePalette] from a source ARGB color.
//   static _CorePalette of(int argb) {
//     final Cam16 cam = Cam16.fromInt(argb);
//     return _CorePalette.fromHueChroma(cam.hue, cam.chroma);
//   }
//
//   /// Create a CorePalette from Hue and Chrome.
//   _CorePalette.fromHueChroma(double hue, double chroma)
//       : primary = TonalPalette.of(hue, math.max(48, chroma)),
//         secondary = TonalPalette.of(hue, 16),
//         tertiary = TonalPalette.of(hue + 60, 24),
//         neutral = TonalPalette.of(hue, 4),
//         neutralVariant = TonalPalette.of(hue, 8);
//
//   /// Create a [_CorePalette] from one to three seed colors.
//   ///
//   /// If only [argbPrimary] is provided, it the same as using the
//   /// [_CorePalette.of] static that returns an instance of
//   /// [_CorePalette] created from a single ARGB seed color.
//   ///
//   /// When using optional [argbSecondary] and [argbTertiary] the same max
//   /// chroma of 48 limitation is placed on them as on primary [TonalPalette]
//   /// when using [_CorePalette.of]. If [argbSecondary] or [argbTertiary] are
//   /// not provided the [TonalPalette] creation for them falls back to same
//   /// values as used for the corresponding palette when using
//   /// [_CorePalette.of].
//   factory _CorePalette.fromSeeds({
//     /// Integer ARGB value of seed color used for primary tonal palette.
//     ///
//     /// By default a minimum of Cam16 chroma 48 is used to ensure a bright
//     /// palette. If chroma of the provided color is higher than 48, it is
//     /// used. A chroma value can also be specified via [primaryChroma],
//     /// if it, then the passed chroma value is used.
//     required int primary,
//
//     /// Integer ARGB value of seed color used for secondary tonal palette.
//     /// If not provided, the palette is based on [primary] with Cam16 chroma
//     /// at 16.
//     ///
//     /// A chroma value can also be specified via [secondaryChroma].
//     int? secondary,
//
//     /// Integer ARGB value of seed color used for tertiary tonal palette.
//     /// Cam16 chroma is capped at 48 if provided. If not provided, the
//     /// palette is based on [primary] with Cam16 hue+60 and chroma at 24.
//     ///
//     /// A chroma value can also be specified via [tertiaryChroma].
//     int? tertiary,
//
//     /// Cam16 chroma value to use for primary colors [TonalPalette}
//     /// generation.
//     ///
//     /// If null, the chroma value from the used primary seed key color is
//     /// used, if it is larger than [primaryMinChroma].
//     ///
//     /// Flutter SDK [ColorScheme.fromSeed] uses "null", with a
//     /// [primaryMinChroma] set to 48, so the chroma from the key color is
//     /// used when above 48, but never lower than 48. This keeps primary
//     /// color at the used tonal values
//     /// reasonably vivid and usable regardless of uses primary key color.
//     ///
//     /// To use chroma value from the primary key color, pass in null and keep
//     /// min chroma below  desired threshold for required colorfulness.
//     final double? primaryChroma,
//
//     /// The minimum used chroma value.
//     ///
//     /// If chroma in provided primary key color is below this value, or if a
//     /// fixed [primaryChroma] is provided that is lower than
//     /// [primaryMinChroma] then the [primaryMinChroma] value is used.
//     ///
//     /// Defaults to 48.
//     ///
//     /// Flutter SDK uses 48 via a hard coded value and design.
//     final double primaryMinChroma = 48,
//
//     /// Cam16 chroma value to use for secondary colors [TonalPalette}
//     /// generation.
//     ///
//     /// If null, the chroma value from the used secondary seed key color is
//     /// used, if it is larger than [secondaryMinChroma].
//     ///
//     /// Flutter SDK [ColorScheme.fromSeed] uses [secondaryChroma] hard coded
//     /// and locked to 16.
//     ///
//     /// Defaults to 16.
//     ///
//     /// The default produces quite soft and muted tones as secondary tonal
//     /// palette at the mid-point tones of the palette.
//     ///
//     /// To use chroma value from the primary key color, pass in null and keep
//     /// min chroma below  desired threshold for required colorfulness.
//     final double? secondaryChroma = 16,
//
//     /// The minimum used chroma value.
//     ///
//     /// If chroma in provided secondary key color is below this value, or if
//     /// a fixed [secondaryChroma] is provided that is lower than
//     /// [secondaryMinChroma] then the [secondaryMinChroma] value is used.
//     ///
//     /// Defaults to 0.
//     ///
//     /// Flutter SDK only uses [secondaryChroma] hard coded to 16, and has no
//     /// concept of minimum level for secondary tonal palettes as its value is
//     /// always locked to 16.
//     final double secondaryMinChroma = 0,
//
//     /// Cam16 chroma value to use for tertiary colors [TonalPalette}
//     /// generation.
//     ///
//     /// If null, the chroma value from the used tertiary seed key color is
//     /// used, if it is larger than [tertiaryMinChroma].
//     ///
//     /// Flutter SDK [ColorScheme.fromSeed] uses [tertiaryChroma] hard coded
//     /// and locked to 24.
//     ///
//     /// Defaults to 24.
//     ///
//     /// The default produces soft and muted tones as tertiary tonal palette
//     /// at the mid-point tones of the palette, that are bit less muted than
//     /// the default secondary tonal palette.
//     ///
//     /// To use chroma value from the primary key color, pass in null and keep
//     /// min chroma below  desired threshold for required colorfulness.
//     final double? tertiaryChroma = 24,
//
//     /// The minimum used chroma value.
//     ///
//     /// If chroma in provided tertiary key color is below this value, or if a
//     /// fixed [tertiaryChroma] is provided that is lower than
//     /// [tertiaryMinChroma] then the [tertiaryMinChroma] value is used.
//     ///
//     /// Defaults to 0.
//     ///
//     /// Flutter SDK only uses [tertiaryChroma] hard coded to 24, and has no
//     /// concept of minimum level for tertiary tonal palettes as its value is
//     /// always locked to 24.
//     final double tertiaryMinChroma = 0,
//
// /// Cam16 chroma value to use for neutral colors [TonalPalette} generation.
// ///
// /// Always uses chroma from the primary key color, but you can vary the
// /// amount of chroma from primary key color that is used to generate
// /// the tonal palette
// ///
// /// Flutter SDK [ColorScheme.fromSeed] uses [neutralChroma] hard coded
// /// and locked to 4.
// ///
// /// Defaults to 4.
// final double neutralChroma = 4,
//
// /// Cam16 chroma value to use for neutralVariant colors
// /// [TonalPalette} generation.
// ///
// /// Always uses chroma from the primary key color, but you can vary the
// /// amount of chroma from primary key color that is used to generate
// /// the tonal palette
// ///
// /// Flutter SDK [ColorScheme.fromSeed] uses [neutralVariantChroma] hard
// /// coded and locked to 8.
// ///
// /// Defaults to 8.
//
// final double neutralVariantChroma = 8,
//   }) {
//     // Primary TonalPalette calculation.
//     //
//     // Key color is required, we can use it.
//     final Cam16 camPrimary = Cam16.fromInt(primary);
//     // If a fixed chroma was given we use it instead of chroma in primary.
//     final double effectivePrimaryChroma = primaryChroma ?? camPrimary.chroma;
//     // We use the effectiveChroma, but only if it is over the min level.
//     final TonalPalette tonalPrimary = TonalPalette.of(
//         camPrimary.hue, math.max(primaryMinChroma, effectivePrimaryChroma));
//
//     // Secondary TonalPalette calculation.
//     //
//     // Provided key color may be null, then we use primary as key color.
//     final Cam16 camSecondary =
//         secondary == null ? camPrimary : Cam16.fromInt(secondary);
//     // If a fixed chroma value was given we will use it.
//     final double effectiveSecondaryChroma =
//         secondaryChroma ?? camSecondary.chroma;
//     // We use the effectiveChroma, but only if it is over the min level.
//     final TonalPalette tonalSecondary = TonalPalette.of(camSecondary.hue,
//         math.max(secondaryMinChroma, effectiveSecondaryChroma));
//
//     // Tertiary TonalPalette calculation.
//     //
//     // Provided key color may be null, then we use primary as key color.
//     final Cam16 camTertiary =
//         tertiary == null ? camPrimary : Cam16.fromInt(tertiary);
//     // If a fixed chroma value was given we will use it.
//     final double effectiveTertiaryChroma = tertiaryChroma ??
//     camTertiary.chroma;
//     // If we had no tertiary keyColor, we won't use primary key's hue
//     // directly, we add 60 to it, this is the M3 way to shift hue from a
//     // single key. We could also below write camTertiary su to above
//     // fallback, but this felt making the intent more explicitly clear.
//     final double effectiveTertiaryHue =
//         tertiary == null ? camPrimary.hue + 60 : camTertiary.hue;
//     // We use the effective hue and the effectiveChroma, but chroma
//     // only if it is over the min level.
//     final TonalPalette tonalTertiary = TonalPalette.of(effectiveTertiaryHue,
//         math.max(tertiaryMinChroma, effectiveTertiaryChroma));
//
//     // Neutral TonalPalettes are made from primary, with a bit of its chroma
//     final TonalPalette tonalNeutral =
//         TonalPalette.of(camPrimary.hue, neutralChroma);
//     final TonalPalette tonalNeutralVariant =
//         TonalPalette.of(camPrimary.hue, neutralVariantChroma);
//     // The TonalPalette for error color is hard coded into parent class.
//     // It is added automatically to created [CorePalette] as:
//     // final TonalPalette error = TonalPalette.of(25, 84);
//     // when it is created using super .fromList.
//
//     return _CorePalette(
//       primary: tonalPrimary,
//       secondary: tonalSecondary,
//       tertiary: tonalTertiary,
//       neutral: tonalNeutral,
//       neutralVariant: tonalNeutralVariant,
//     );
//   }
//
//   /// Create a [_CorePalette] from a fixed-size list of ARGB color ints
//   /// representing concatenated tonal palettes.
//   ///
//   /// Inverse of [asList].
//   _CorePalette.fromList(List<int> colors)
//       : assert(
//             colors.length == size * TonalPalette.commonSize,
//             'Incorrect size.'),
//         primary = TonalPalette.fromList(
//             _getPartition(colors, 0, TonalPalette.commonSize)),
//         secondary = TonalPalette.fromList(
//             _getPartition(colors, 1, TonalPalette.commonSize)),
//         tertiary = TonalPalette.fromList(
//             _getPartition(colors, 2, TonalPalette.commonSize)),
//         neutral = TonalPalette.fromList(
//             _getPartition(colors, 3, TonalPalette.commonSize)),
//         neutralVariant = TonalPalette.fromList(
//             _getPartition(colors, 4, TonalPalette.commonSize));
//
//   /// Returns a list of ARGB color [int]s from concatenated tonal palettes.
//   ///
//   /// Inverse of [FlexCorePalette.fromList].
//   List<int> asList() => <int>[
//         ...primary.asList,
//         ...secondary.asList,
//         ...tertiary.asList,
//         ...neutral.asList,
//         ...neutralVariant.asList,
//       ];
//
//   @override
//   bool operator ==(Object other) =>
//       other is _CorePalette &&
//       primary == other.primary &&
//       secondary == other.secondary &&
//       tertiary == other.tertiary &&
//       neutral == other.neutral &&
//       neutralVariant == other.neutralVariant &&
//       error == other.error;
//
//   @override
//   int get hashCode => Object.hash(
//         primary,
//         secondary,
//         tertiary,
//         neutral,
//         neutralVariant,
//         error,
//       );
//
//   @override
//   String toString() {
//     return 'primary: $primary\n'
//         'secondary: $secondary\n'
//         'tertiary: $tertiary\n'
//         'neutral: $neutral\n'
//         'neutralVariant: $neutralVariant\n'
//         'error: $error\n';
//   }
//
//   // Returns a partition from a list.
//   //
//   // For example, given a list with 2 partitions of size 3.
//   // range = [1, 2, 3, 4, 5, 6];
//   //
//   // range.getPartition(0, 3) // [1, 2, 3]
//   // range.getPartition(1, 3) // [4, 5, 6]
//   static List<int> _getPartition(
//       List<int> list, int partitionNumber, int partitionSize) {
//     return list.sublist(
//       partitionNumber * partitionSize,
//       (partitionNumber + 1) * partitionSize,
//     );
//   }
// }
