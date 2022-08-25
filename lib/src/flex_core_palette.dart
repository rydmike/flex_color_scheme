import 'dart:math' as math;

import 'package:material_color_utilities/material_color_utilities.dart';
import 'package:meta/meta.dart' show immutable;

// ignore_for_file: comment_references

// Background of why having custom versions of CorePalette and TonalPalette.
//
// The FlexCorePalette and FlexTonalPalette below are used to create a custom
// version of material_color_utilities CorePalette and TonalPalette.
// FlexCorePalette has the needed [fromSeeds] factory that is a bit more
// efficient than a version that extends CorePalette, thanks to reduced
// interface overhead. Some more ramblings below.
//
// The conversion of [TonalPalette]es to a list of ints and having super
// create the CorePalette from this list, has unneeded extra overhead.
// It would be a bit more efficient to make an own implementation
// of this simple mid-layer that has the needed constructors directly.
// Keeping this version around as a small private classes so I can later
// benchmark and see if it makes a difference. Perhaps it does not matter,
// in that case extending the parent [CorePalette] is a bit prettier.
// But its interface feels a bit like using FFI.
//
// The [CorePalette] in Material Color Utilities is just a convenience
// wrapper for the needed [TonalPalette]s, that are used by an additional
// upper layer called [Scheme] that [ColorScheme.fromSeed] uses to create
// a [ColorScheme] from a seed color. To make a [ColorScheme.fromSeeds]
// versions of it, we need to make a slightly modified version of it anyway.
// The usage of [CorePalette.of] is hard coded into the upper layer, so we
// cannot plug-in our extended version of it anyway.
//
// It seems better to use a custom modified version of [CorePalette]
// instead and name it [FlexCorePalette]. It does not share parent
// with [CorePalette], but it is not needed, it is just color utility class.
//
// Regarding the custom version of TonalPalette, named FlexTonalPalette, there
// was just no convenient way to add the desired tones 5 and 98 to it without
// making our own version of it.

/// An intermediate concept between the key color for a UI theme, and a full
/// color scheme. Five tonal palettes are generated, plus fixed error palette.
///
/// This is a modification of package:material_color_utilities [CorePalette]
/// to provide capability to create the M3 ColorScheme needed tonal palettes
/// from 3 different ARGB seed colors, where 2 are optional, instead of just
/// one as provided via package version [CorePalette.of] and here also
/// via [FlexCorePalette.of].
///
/// This version has an unnamed constructor for the five main final
/// [FlexTonalPalette] properties. Exposes the original version's private
/// constructor as [FlaxCorePalette.fromHueChroma] that is used by
/// [FlexCorePalette.of]. It then also adds a [FlexCorePalette.fromSeeds] to
/// create the [FlexTonalPalette]s for [primary], [secondary] and [tertiary]
/// from optional ARGB seed colors also for secondary and tertiary
/// [FlexTonalPalette], instead of tying them down to same seed ARGB colors as
/// used for primary color.
@immutable
class FlexCorePalette {
  /// Default constructor.
  FlexCorePalette({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.neutral,
    required this.neutralVariant,
  });

  /// The number of generated tonal palettes.
  static const int size = 5;

  /// TonalPalette for primary colors.
  final FlexTonalPalette primary;

  /// TonalPalette for secondary colors.
  final FlexTonalPalette secondary;

  /// TonalPalette for tertiary colors.
  final FlexTonalPalette tertiary;

  /// TonalPalette for neutral colors. Typically hues of primary.
  final FlexTonalPalette neutral;

  /// TonalPalette for neutralVariant colors. Typically hues of primary.
  final FlexTonalPalette neutralVariant;

  /// TonalPalette for error colors. Fixed to given Hue and Chroma.
  final FlexTonalPalette error = FlexTonalPalette.of(25, 84);

  /// Create a [FlexCorePalette] from a source ARGB color.
  static FlexCorePalette of(int argb) {
    final Cam16 cam = Cam16.fromInt(argb);
    return FlexCorePalette.fromHueChroma(cam.hue, cam.chroma);
  }

  /// Create a standard M3 CorePalette from Hue and Chrome.
  FlexCorePalette.fromHueChroma(double hue, double chroma)
      : primary = FlexTonalPalette.of(hue, math.max(48, chroma)),
        secondary = FlexTonalPalette.of(hue, 16),
        tertiary = FlexTonalPalette.of(hue + 60, 24),
        neutral = FlexTonalPalette.of(hue, 4),
        neutralVariant = FlexTonalPalette.of(hue, 8);

  /// Create a [FlexCorePalette] from one to three seed colors.
  ///
  /// If only [argbPrimary] is provided, it the same as using the
  /// [FlexCorePalette.of] static that returns an instance of
  /// [FlexCorePalette] created from a single ARGB seed color.
  ///
  /// When using optional [argbSecondary] and [argbTertiary] the same max
  /// chroma of 48 limitation is placed on them as on primary [FlexTonalPalette]
  /// when using [FlexCorePalette.of]. If [argbSecondary] or [argbTertiary] are
  /// not provided the [FlexTonalPalette] creation for them falls back to same
  /// values as used for the corresponding palette when using
  /// [FlexCorePalette.of].
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
    /// Defaults to null, set to 16 for M3 standard result.
    ///
    /// The default produces quite soft and muted tones as secondary tonal
    /// palette at the mid-point tones of the palette.
    ///
    /// To use chroma value from the primary key color, pass in null and keep
    /// min chroma below  desired threshold for required colorfulness.
    final double? secondaryChroma,

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
    /// Defaults to null, set to 24 for M3 standard result.
    ///
    /// The default produces soft and muted tones as tertiary tonal palette
    /// at the mid-point tones of the palette, that are bit less muted than
    /// the default secondary tonal palette.
    ///
    /// To use chroma value from the primary key color, pass in null and keep
    /// min chroma below desired threshold for required colorfulness.
    final double? tertiaryChroma,

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
    final FlexTonalPalette tonalPrimary = FlexTonalPalette.of(
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
    final FlexTonalPalette tonalSecondary = FlexTonalPalette.of(
        camSecondary.hue,
        math.max(secondaryMinChroma, effectiveSecondaryChroma));

    // Tertiary TonalPalette calculation.
    //
    // Provided key color may be null, then we use primary as key color.
    final Cam16 camTertiary =
        tertiary == null ? camPrimary : Cam16.fromInt(tertiary);
    // If a fixed chroma value was given we will use it.
    final double effectiveTertiaryChroma = tertiaryChroma ?? camTertiary.chroma;
    // If we had no tertiary keyColor, we won't use primary key's hue
    // directly, we add 60 to it, this is the M3 way to shift hue from a
    // single key. We could also below write camTertiary su to above
    // fallback, but this felt making the intent more explicitly clear.
    final double effectiveTertiaryHue =
        tertiary == null ? camPrimary.hue + 60 : camTertiary.hue;
    // We use the effective hue and the effectiveChroma, but chroma
    // only if it is over the min level.
    final FlexTonalPalette tonalTertiary = FlexTonalPalette.of(
        effectiveTertiaryHue,
        math.max(tertiaryMinChroma, effectiveTertiaryChroma));

    // Neutral TonalPalettes are made from primary, with a bit of its chroma
    final FlexTonalPalette tonalNeutral =
        FlexTonalPalette.of(camPrimary.hue, neutralChroma);
    final FlexTonalPalette tonalNeutralVariant =
        FlexTonalPalette.of(camPrimary.hue, neutralVariantChroma);
    // The TonalPalette for error color is hard coded into parent class.
    // It is added automatically to created [CorePalette] as:
    // final TonalPalette error = TonalPalette.of(25, 84);
    // when it is created using super .fromList.

    return FlexCorePalette(
      primary: tonalPrimary,
      secondary: tonalSecondary,
      tertiary: tonalTertiary,
      neutral: tonalNeutral,
      neutralVariant: tonalNeutralVariant,
    );
  }

  /// Create a [FlexCorePalette] from a fixed-size list of ARGB color ints
  /// representing concatenated tonal palettes.
  ///
  /// Inverse of [asList].
  FlexCorePalette.fromList(List<int> colors)
      : assert(colors.length == size * FlexTonalPalette._commonSize,
            'Incorrect size.'),
        primary = FlexTonalPalette.fromList(
            _getPartition(colors, 0, FlexTonalPalette._commonSize)),
        secondary = FlexTonalPalette.fromList(
            _getPartition(colors, 1, FlexTonalPalette._commonSize)),
        tertiary = FlexTonalPalette.fromList(
            _getPartition(colors, 2, FlexTonalPalette._commonSize)),
        neutral = FlexTonalPalette.fromList(
            _getPartition(colors, 3, FlexTonalPalette._commonSize)),
        neutralVariant = FlexTonalPalette.fromList(
            _getPartition(colors, 4, FlexTonalPalette._commonSize));

  /// Returns a list of ARGB color [int]s from concatenated tonal palettes.
  ///
  /// Inverse of [FlexCorePalette.fromList].
  List<int> asList() => <int>[
        ...primary.asList,
        ...secondary.asList,
        ...tertiary.asList,
        ...neutral.asList,
        ...neutralVariant.asList,
      ];

  /// Override the equality operator.
  @override
  bool operator ==(Object other) =>
      other is FlexCorePalette &&
      primary == other.primary &&
      secondary == other.secondary &&
      tertiary == other.tertiary &&
      neutral == other.neutral &&
      neutralVariant == other.neutralVariant &&
      error == other.error;

  /// Override for hashcode, dart.ui Jenkins based.
  @override
  int get hashCode => Object.hashAll(<Object?>[
        primary,
        secondary,
        tertiary,
        neutral,
        neutralVariant,
        error,
      ]);

  /// Override toString.
  @override
  String toString() {
    return 'primary: $primary\n'
        'secondary: $secondary\n'
        'tertiary: $tertiary\n'
        'neutral: $neutral\n'
        'neutralVariant: $neutralVariant\n'
        'error: $error\n';
  }

  // Returns a partition from a list.
  //
  // For example, given a list with 2 partitions of size 3.
  // range = [1, 2, 3, 4, 5, 6];
  //
  // range.getPartition(0, 3) // [1, 2, 3]
  // range.getPartition(1, 3) // [4, 5, 6]
  static List<int> _getPartition(
      List<int> list, int partitionNumber, int partitionSize) {
    return list.sublist(
      partitionNumber * partitionSize,
      (partitionNumber + 1) * partitionSize,
    );
  }
}

/// A convenience class for retrieving colors that are constant in hue and
/// chroma, but vary in tone.
///
/// This is a modification of package:material_color_utilities [TonalPalette]
/// to be able to add the tone 98 that the Web based utility has, as well as
/// an additional custom tone 5.
///
/// This class can be instantiated in two ways:
/// 1. [of] From hue and chroma. (preferred)
/// 2. [fromList] From a fixed-size ([FlexTonalPalette._commonSize]) list of
/// int representing ARBG colors. Correctness (constant hue and chroma) of the
/// input is not enforced. [get] will only return the input colors,
/// corresponding to [commonTones].
@immutable
class FlexTonalPalette {
  /// Commonly-used tone values.
  static const List<int> commonTones = <int>[
    0,
    5,
    10,
    20,
    30,
    40,
    50,
    60,
    70,
    80,
    90,
    95,
    98,
    99,
    100,
  ];

  static final int _commonSize = commonTones.length;

  final double? _hue;
  final double? _chroma;
  final Map<int, int> _cache;

  FlexTonalPalette._fromHueAndChroma(double hue, double chroma)
      : _cache = <int, int>{},
        _hue = hue,
        _chroma = chroma;

  const FlexTonalPalette._fromCache(Map<int, int> cache)
      : _cache = cache,
        _hue = null,
        _chroma = null;

  /// Create colors using [hue] and [chroma].
  static FlexTonalPalette of(double hue, double chroma) {
    return FlexTonalPalette._fromHueAndChroma(hue, chroma);
  }

  /// Create colors from a fixed-size list of ARGB color ints.
  ///
  /// Inverse of [FlexTonalPalette.asList].
  static FlexTonalPalette fromList(List<int> colors) {
    assert(colors.length == _commonSize, 'Length must be $_commonSize');
    Map<int, int> cache;
    cache = <int, int>{};
    commonTones.asMap().forEach(
        (int index, int toneValue) => cache[toneValue] = colors[index]);
    return FlexTonalPalette._fromCache(cache);
  }

  /// Returns a fixed-size list of ARGB color ints for common tone values.
  ///
  /// Inverse of [fromList].
  List<int> get asList => commonTones.map(get).toList();

  /// Returns the ARGB representation of an HCT color.
  ///
  /// If the class was instantiated from [_hue] and [_chroma], will return the
  /// color with corresponding [tone].
  /// If the class was instantiated from a fixed-size list of color ints, [tone]
  /// must be in [commonTones].
  int get(int tone) {
    if (_hue == null || _chroma == null) {
      if (!_cache.containsKey(tone)) {
        throw ArgumentError.value(
          tone,
          'tone',
          'When a FlexTonalPalette is created with fromList, tone must be '
              'one of $commonTones',
        );
      } else {
        return _cache[tone]!;
      }
    }
    final double chroma = (tone >= 90.0) ? math.min(_chroma!, 40.0) : _chroma!;
    return _cache.putIfAbsent(
        tone, () => Hct.from(_hue!, chroma, tone.toDouble()).toInt());
  }

  @override
  bool operator ==(Object other) {
    if (other is FlexTonalPalette) {
      if (_hue != null && _chroma != null) {
        return _hue == other._hue && _chroma == other._chroma;
      } else {
        return _cache.values.toSet().containsAll(other._cache.values);
      }
    }
    return false;
  }

  @override
  int get hashCode =>
      Object.hash(_hue, _chroma) ^ Object.hashAll(_cache.values);

  @override
  String toString() {
    if (_hue != null && _chroma != null) {
      return 'FlexTonalPalette.of($_hue, $_chroma)';
    } else {
      return 'FlexTonalPalette.fromList($_cache)';
    }
  }
}
