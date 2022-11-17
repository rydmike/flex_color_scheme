import 'package:flutter/foundation.dart';

// ignore_for_file: comment_references

/// Immutable data class that configures if and how [FlexColorScheme] uses
/// key colors to populate the Material 3 [ColorScheme] it creates and uses
/// to generate its [ThemeData] object.
///
/// For more information on Material 3 color system and usage of key colors
/// to generate tonal palettes and tones, see:
/// https://m3.material.io/styles/color/the-color-system/key-colors-tones
///
/// A key based [ColorScheme] will be generated if a [FlexKeyColors]
/// instance is passed to [FlexColorScheme.light] or [FlexColorScheme.dark]
/// parameter [keyColorSetup] with [useKeyColors] set to true, in its
/// [FlexKeyColors] configuration input.
///
/// By default [keyColorSetup] is null and key colors are not used. To activate
/// the feature pass you can in a default [FlexKeyColors] instance,
/// its [useKeyColors] defaults to true.
///
/// The default constructor creates a setup that creates
/// a seeded generated [ColorScheme] for the active [FlexColorScheme] using its
/// current primary color as key in a [ColorScheme.fromSeed]
/// If the default setup is suitable, no further configuration is required.
/// You can however further customize its behavior by adjusting the properties
/// in [FlexKeyColors].
///
/// Flutter standard [ColorScheme] only offers color scheme creation from one
/// single input color using [ColorScheme.fromSeed]. With [FlexColorScheme]
/// you can use its effective color value for primary, secondary and tertiary
/// colors to generate the seeded [TonalPalette] for primary, secondary and
/// tertiary colors in the [ColorScheme], by using these as input colors.
/// To do so also set properties [useSecondary] and [useTertiary] to true.
/// You will then get tonal palette's for secondary and tertiary colors that
/// depend on these key colors and not on only the primary color.
///
/// If you use factory [FlexColorScheme.light] and [FlexColorScheme.scheme], to
/// use a built in color [scheme] set, then the primary, secondary and tertiary
/// colors for the associated [FlexScheme] enum will be used as key colors for
/// those color categories in the resulting [ColorScheme].
///
/// When using [FlexColorScheme.dark] and [FlexColorScheme.scheme], the same
/// colors from the light theme color definitions will be used as key color
/// inputs to generate the tonal palettes for dark mode ColorScheme. This is
/// because the light and dark theme mode colors should use
/// the same [TonalPalette], and only use different in M3 guide standardized
/// tones from the same [TonalPalette]. Hence the same base color is used to
/// generate the tonal palette for both light and dark theme to adhere to this
/// design principle.
///
/// If you use [FlexColorScheme.colors] in the factories light and dark, or
/// direct color property inputs, or a custom [FlexColorScheme.colorScheme] as
/// input, and combine them with key color usage via the [useKeyColors] flag,
/// then it is possible to use different key color inputs for light and dark
/// mode, as the provided effective colors are used as direct inputs to the
/// seeding.
/// It is then up to you, the designer to create harmonious designs. If you want
/// to get the Material 3 intended design when using custom [FlexColorScheme]
/// based key color inputs, then use the same color value as input
/// for primary, secondary and tertiary colors for both dark and light mode
/// [FlexColorScheme] based themes, when making themes with [useKeyColors]
/// enabled.
///
/// The neutral tonal palette and its variant are used as inputs to
/// [ColorScheme] colors in the same way as in [ColorScheme.fromSeed] and are
/// produced with a slight hint of [primary] key color in them using same
/// algorithm as [ColorScheme.fromSeed] too. This color branding is a bit
/// equivalent to using primary color alpha surface blends, or so called primary
/// color branding in [FlexColorScheme]. The surface mode and blend levels can
/// even be combined with M3 based key color branding, for a bit different and
/// stronger effects from key color generated themes too.
///
/// To completely customize how the tonal palettes for the seed generated
/// [ColorScheme] are produced from key colors, and which tones from the
/// generated tonal palettes are used by which color in the [ColorScheme],
/// please see [FlexTones]. With [FlexTones] you can completely customize
/// the tonal palette generation and tone usage in produced [ColorScheme].
@immutable
class FlexKeyColors with Diagnosticable {
  /// Used to configure how key colors are used when generating a key color
  /// seeded [ColorScheme] for FlexColorScheme,
  ///
  /// Use [useKeyColors] to enable it (enabled by default), and [useSecondary]
  /// and [useTertiary] to define if secondary and tertiary colors in
  /// active FlexColorScheme should be to seed the generated [ColorScheme].
  ///
  /// The defaults in the unnamed constructor creates a setup that is
  /// equivalent to using [ColorScheme.fromSeed] with primary color as key.
  ///
  /// Primary color is always used as a key for the seed generate tonal palettes
  /// when seed generated [ColorScheme] is used in FlexColorScheme.
  ///
  /// You can also use the secondary and tertiary colors as key to generate
  /// their tonal palettes, this is not possible with Flutter SDK's
  /// [ColorScheme.from] Material Design 3 based constructor.
  ///
  /// The property [useKeyColors] will if set to false disable using seed
  /// generated [ColorScheme], even if you pass a [FlexKeyColors] instance to
  /// the [keyColors] parameter in [FlexColorScheme.light] or
  /// [FlexColorScheme.dark] factories. The property is true by default, it
  /// exists mainly for debugging and to enable easier construction of
  /// configurable toggles to enable and disable using seed generated
  /// FlexColorSchemes, while still passing in a configuration object with
  /// other properties set, that have no effect if [useKeyColors] is false.
  const FlexKeyColors({
    this.useKeyColors = true,
    this.useSecondary = false,
    this.useTertiary = false,
    this.keepPrimary = false,
    this.keepSecondary = false,
    this.keepTertiary = false,
    this.keepPrimaryContainer = false,
    this.keepSecondaryContainer = false,
    this.keepTertiaryContainer = false,
  });

  /// Turn on using Material 3 key color based [TonalPalette] colors for the
  /// resulting [ColorScheme] produced by [FlexColorScheme.toScheme] that is
  /// also consumed by [FlexColorScheme.toTheme] when it generates its
  /// [ThemeData] object.
  ///
  /// The [FlexColorScheme.primary] will be used as key color for all
  /// [TonalPalette]s that in Material 3 design use primary color as its key
  /// color to generate a tonal palette. This includes all the primary tones, as
  /// well as neutral and neutral variant tones, used by all surfaces, shadows
  /// and background colors.
  ///
  /// Defaults to true.
  final bool useKeyColors;

  /// Use effective [FlexColorScheme.secondary] color as key generation
  /// input color for all [ColorScheme] secondary colors.
  ///
  /// If set to false, the [FlexColorScheme.primary] will be used as key color
  /// input for secondaries as well, using same algorithm as in
  /// [ColorScheme.fromSeed], thus the secondary colors will be same as if we
  /// would have used it with the [FlexColorScheme.primary] color as input.
  ///
  /// Defaults to false.
  final bool useSecondary;

  /// Use effective [FlexColorScheme.tertiary] color as key generation
  /// input color for all [ColorScheme] secondary colors.
  ///
  /// If set to false, the [FlexColorScheme.primary] will be used as key color
  /// input for secondaries as well, using same algorithm as in
  /// [ColorScheme.fromSeed], thus the tertiary colors will be same as if we
  /// would have used it with the [FlexColorScheme.primary] color as input.
  ///
  /// Defaults to false.
  final bool useTertiary;

  /// When using [useKeyColors], set [keepPrimary] to true, to keep the
  /// resulting [ColorScheme.primary] color as defined by effective
  /// [FlexColorScheme.primary] input key color, while still letting all other
  /// colors derived from input primary key to be based on colors
  /// seeded from it.
  ///
  /// This feature is useful if you want to lock the resulting
  /// [ColorScheme.primary] to an exact given color value, but still use this
  /// color as branding key for all other color values derived from primary
  /// key color. Typically you would use this when the primary color must
  /// match a given established brand color, typically in light theme mode where
  /// it can be used since the color is often designed to be printed on white
  /// paper.
  ///
  /// When you use the primary color as input as key based color input for a
  /// tonal palette, the [TonalPalette] and from key based ColorScheme
  /// algorithm will typically not not return this exact color as the
  /// [ColorScheme.primary] color.
  /// Seed colors are used more as a way to "set the tone" for the desired
  /// theme, the exact same input color value will seldom become the actual
  /// [ColorScheme.primary] color. With [keepPrimary] set to true you can
  /// however enforce that.
  ///
  /// Defaults to false.
  final bool keepPrimary;

  /// When using [useKeyColors], set [keepSecondary] to true, to keep the
  /// resulting [ColorScheme.secondary] color as defined by effective
  /// [FlexColorScheme.secondary] input key color, while still letting all
  /// other colors derived from input primary key to be based on colors
  /// seeded from it.
  ///
  /// This feature is useful if you want to lock the resulting
  /// [ColorScheme.secondary] to an exact given color value, but still use this
  /// color as branding key for all other color values derived from secondary
  /// key color. Typically you would use this when the secondary color must
  /// match a given established brand color, typically in light theme mode where
  /// it can be used since the color is often designed to be printed on white
  /// paper.
  ///
  /// When you use the secondary color as input as key based color input for a
  /// tonal palette, the [TonalPalette] and from key based ColorScheme
  /// algorithm will typically not not return this exact color as the
  /// [ColorScheme.secondary] color.
  /// Seed colors are used more as a way to "set the tone" for the desired
  /// theme, the exact same input color value will seldom become the actual
  /// [ColorScheme.secondary] color. With [keepSecondary] set to true you can
  /// however enforce that.
  ///
  /// Defaults to false.
  final bool keepSecondary;

  /// When using [useKeyColors], set [keepTertiary] to true, to keep the
  /// resulting [ColorScheme.tertiary] color as defined by effective
  /// [FlexColorScheme.tertiary] input key color, while still letting all other
  /// colors derived from input primary key to be based on colors
  /// seeded from it.
  ///
  /// This feature is useful if you want to lock the resulting
  /// [ColorScheme.tertiary] to an exact given color value, but still use this
  /// color as branding key for all other color values derived from tertiary
  /// key color. Typically you would use this when the tertiary color, must
  /// match a given established brand color, typically in light theme mode where
  /// it can be used since the color is often designed to be printed on white
  /// paper.
  ///
  /// When you use the tertiary color as input as key based color input for a
  /// tonal palette, the [TonalPalette] and from key based ColorScheme
  /// algorithm will typically not not return this exact color as the
  /// [ColorScheme.tertiary] color.
  /// Seed colors are used more as a way to "set the tone" for the desired
  /// theme, the exact same input color value will seldom become the actual
  /// [ColorScheme.tertiary] color. With [keepTertiary] set to true you can
  /// however enforce that.
  ///
  /// Defaults to false.
  final bool keepTertiary;

  /// When using [useKeyColors], set [keepPrimaryContainer] to true,
  /// to keep the resulting [ColorScheme.primaryContainer] color as defined by
  /// effective [FlexColorScheme.primaryContainer] input key color, while
  /// still letting all other colors derived from input primary key to be
  /// based on colors seeded from it.
  ///
  /// This feature is useful if you want to lock the resulting
  /// [ColorScheme.primaryContainer] to an exact given color value, while using
  /// primary color as input for all other color values derived from
  /// primary key color. Normally when you key colors from primary, it
  /// will override the [ColorScheme.primaryContainer] value with a color value
  /// from the primary color generated tonal palette.
  ///
  /// With [keepPrimaryContainer] set to true, it will keep the effective value
  /// it has in your [FlexColorScheme].
  ///
  /// Defaults to false.
  final bool keepPrimaryContainer;

  /// When using [useKeyColors], set [keepSecondaryContainer] to true,
  /// to keep the resulting [ColorScheme.secondaryContainer] color as defined by
  /// effective [FlexColorScheme.secondaryContainer] input key color, while
  /// still letting all other colors derived from input secondary key to be
  /// based on colors seeded from it.
  ///
  /// This feature is useful if you want to lock the resulting
  /// [ColorScheme.secondaryContainer] to an exact given color value, while
  /// using secondary color as input for all other color values derived from
  /// secondary key color. Normally when you key colors from secondary, it
  /// will override the [ColorScheme.secondaryContainer] value with a color
  /// value from the secondary color generated tonal palette.
  ///
  /// With [keepSecondaryContainer] set to true, it will keep the effective
  /// value it has in your [FlexColorScheme].
  ///
  /// Defaults to false.
  final bool keepSecondaryContainer;

  /// When using [useKeyColors], set [keepTertiaryContainer] to true,
  /// to keep the resulting [ColorScheme.tertiaryContainer] color as defined by
  /// effective [FlexColorScheme.tertiaryContainer] input key color, while
  /// still letting all other colors derived from input tertiary key to be
  /// based on colors seeded from it.
  ///
  /// This feature is useful if you want to lock the resulting
  /// [ColorScheme.tertiaryContainer] to an exact given color value, while using
  /// tertiary color as input for all other color values derived from
  /// tertiary key color. Normally when you key colors from tertiary, it
  /// will override the [ColorScheme.tertiaryContainer] value with a color value
  /// from the tertiary color generated tonal palette.
  ///
  /// With [keepTertiaryContainer] set to true, it will keep the effective value
  /// it has in your [FlexColorScheme].
  ///
  /// Defaults to false.
  final bool keepTertiaryContainer;

  /// Copy the object with one or more provided properties changed.
  FlexKeyColors copyWith({
    final bool? useKeyColors,
    final bool? useSecondary,
    final bool? useTertiary,
    final bool? keepPrimary,
    final bool? keepSecondary,
    final bool? keepTertiary,
    final bool? keepPrimaryContainer,
    final bool? keepSecondaryContainer,
    final bool? keepTertiaryContainer,
  }) {
    return FlexKeyColors(
      useKeyColors: useKeyColors ?? this.useKeyColors,
      useSecondary: useSecondary ?? this.useSecondary,
      useTertiary: useTertiary ?? this.useTertiary,
      keepPrimary: keepPrimary ?? this.keepPrimary,
      keepSecondary: keepSecondary ?? this.keepSecondary,
      keepTertiary: keepTertiary ?? this.keepTertiary,
      keepPrimaryContainer: keepPrimaryContainer ?? this.keepPrimaryContainer,
      keepSecondaryContainer:
          keepSecondaryContainer ?? this.keepSecondaryContainer,
      keepTertiaryContainer:
          keepTertiaryContainer ?? this.keepTertiaryContainer,
    );
  }

  /// Override the equality operator.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is FlexKeyColors &&
        other.useKeyColors == useKeyColors &&
        other.useSecondary == useSecondary &&
        other.useTertiary == useTertiary &&
        other.keepPrimary == keepPrimary &&
        other.keepSecondary == keepSecondary &&
        other.keepTertiary == keepTertiary &&
        other.keepPrimaryContainer == keepPrimaryContainer &&
        other.keepSecondaryContainer == keepSecondaryContainer &&
        other.keepTertiaryContainer == keepTertiaryContainer;
  }

  /// Override for hashcode, dart.ui Jenkins based.
  @override
  int get hashCode => Object.hash(
        useKeyColors,
        useSecondary,
        useTertiary,
        keepPrimary,
        keepSecondary,
        keepTertiary,
        keepPrimaryContainer,
        keepSecondaryContainer,
        keepTertiaryContainer,
      );

  /// Flutter debug properties override, includes toString.
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('useKeyColors', useKeyColors));
    properties.add(DiagnosticsProperty<bool>('useSecondary', useSecondary));
    properties.add(DiagnosticsProperty<bool>('useTertiary', useTertiary));
    properties.add(DiagnosticsProperty<bool>('keepPrimary', keepPrimary));
    properties.add(DiagnosticsProperty<bool>('keepSecondary', keepSecondary));
    properties.add(DiagnosticsProperty<bool>('keepTertiary', keepTertiary));
    properties.add(DiagnosticsProperty<bool>(
        'keepPrimaryContainer', keepPrimaryContainer));
    properties.add(DiagnosticsProperty<bool>(
        'keepSecondaryContainer', keepSecondaryContainer));
    properties.add(DiagnosticsProperty<bool>(
        'keepTertiaryContainer', keepTertiaryContainer));
  }
}
