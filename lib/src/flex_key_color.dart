import 'package:flex_seed_scheme/flex_seed_scheme.dart'; // For comment refs.
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'flex_color_scheme.dart' show FlexColorScheme; // For comment refs.
import 'flex_scheme.dart' show FlexScheme;
import 'flex_theme_data_extensions.dart' show FlexThemeData; // For comment refs

/// Immutable data class that configures if and how [FlexColorScheme] uses
/// key colors to populate the Material-3 [ColorScheme] it creates and uses
/// to generate its [ThemeData] object.
///
/// For more information on Material-3 color system and usage of key colors
/// to generate tonal palettes and tones, see:
/// https://m3.material.io/styles/color/the-color-system/key-colors-tones
///
/// When using [FlexColorScheme] a seed generated [ColorScheme] will be made if
/// a [FlexKeyColors] instance is passed to [FlexColorScheme.light] or
/// [FlexColorScheme.dark] parameter `keyColors` with
/// [FlexKeyColors.useKeyColors] set to true.
///
/// By default `keyColors` is null and key colors are not used. To activate
/// the feature pass you can in a default [FlexKeyColors] instance,
/// its [useKeyColors] defaults to true.
///
/// The default constructor creates a setup that creates
/// a seeded generated [ColorScheme] for the active [FlexColorScheme] using its
/// current primary color as key in a [ColorScheme.fromSeed] equivalent.
/// If the default [ColorScheme.fromSeed] result is suitable, no further
/// configuration is required. You can however further customize its behavior
/// by adjusting the properties/ in [FlexKeyColors].
///
/// Flutter standard [ColorScheme] only offers color scheme creation from one
/// single input color using [ColorScheme.fromSeed]. With [FlexColorScheme]
/// you can use its effective color value for primary, secondary, tertiary and
/// error colors to generate the seeded [TonalPalette] for primary, secondary,
/// tertiary and error colors in the [ColorScheme], by using wn key seed input
/// colors for them.
/// To do so also set properties [useSecondary] and [useTertiary] to true.
/// You will then get tonal palette's for secondary and tertiary colors that
/// depend on these key colors and not on only the primary color.
///
/// If you use factory [FlexColorScheme.light] and parameter `scheme`, to
/// use a built-in color scheme set, then the primary, secondary and tertiary
/// colors for the associated [FlexScheme] enum will be used as key colors for
/// those color categories in the resulting [ColorScheme].
///
/// When using [FlexColorScheme.dark] and parameter `scheme`, the same
/// colors from the light theme color definitions will be used as key color
/// inputs to generate the tonal palettes for dark mode ColorScheme. This is
/// because the light and dark theme mode colors should use
/// the same [TonalPalette], and only use different in M3 guide standardized
/// tones from the same [TonalPalette]. Hence, the same base color is used to
/// generate the tonal palette for both light and dark theme to adhere to this
/// design principle.
///
/// If you use parameter `colors` in the factories light and dark, or
/// direct color property inputs, or a custom [FlexColorScheme.colorScheme] as
/// input, and combine them with key color usage via the [useKeyColors] flag,
/// then it is possible to use different key color inputs for light and dark
/// mode, as the provided effective colors are used as direct inputs to the
/// seeding.
///
/// It is then up to you, the designer to create harmonious designs. If you want
/// to get the Material-3 intended design when using custom [FlexColorScheme]
/// based key color inputs, then use the same key color values as input
/// for primary, secondary and tertiary colors for both dark and light mode
/// [FlexColorScheme] based themes, when making themes with [useKeyColors]
/// enabled. Typically this means providing the same color values for
/// [keyPrimary], [keySecondary] and [keyTertiary] in both light and dark
/// mode [FlexColorScheme] instances when passing in a [FlexKeyColors] instance.
///
/// The neutral tonal palette and its variant are used as inputs to
/// [ColorScheme] colors in the same way as in [ColorScheme.fromSeed] and are
/// produced with a slight hint of [keyPrimary] key color in them using same
/// algorithm as [ColorScheme.fromSeed] too. This color branding is a bit
/// equivalent to using primary color alpha surface color blends, or so called
/// primary color branding in [FlexColorScheme]. The surface mode and blend
/// levels can even be combined with Material-3 based seed generated color
/// schemes, for a bit different and stronger effects from key color generated
/// themes too.
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
  /// Use [useKeyColors] to enable it (enabled by default), and [useSecondary],
  /// [useTertiary] and [useError] to define if secondary and tertiary colors in
  /// active [FlexColorScheme] should be used to seed the
  /// generated [ColorScheme].
  ///
  /// The defaults in the unnamed constructor creates a setup that is
  /// equivalent to using [ColorScheme.fromSeed] with primary color as key.
  ///
  /// Primary color is always used as a key for the seed generate tonal palettes
  /// when seed generated [ColorScheme] is used in FlexColorScheme.
  ///
  /// You can also use the secondary, tertiary and error colors as key to
  /// generate their tonal palettes, this is not possible with Flutter SDK's
  /// [ColorScheme.fromSeed] Material-3 design based constructor.
  ///
  /// The property [useKeyColors] will if set to false disable using seed
  /// generated [ColorScheme], even if you pass a [FlexKeyColors] instance to
  /// the `keyColors? parameter in [FlexColorScheme.light] or
  /// [FlexColorScheme.dark] factories. The property is true by default, it
  /// exists mainly for debugging and to enable easier construction of
  /// configurable toggles to enable and disable using seed generated
  /// FlexColorSchemes, while still passing in a configuration object with
  /// other properties set, that have no effect if [useKeyColors] is false.
  const FlexKeyColors({
    this.useKeyColors = true,
    //
    this.keyPrimary,
    this.keepPrimary = false,
    this.keepPrimaryContainer = false,
    //
    this.keySecondary,
    this.useSecondary = false,
    this.keepSecondary = false,
    this.keepSecondaryContainer = false,
    //
    this.keyTertiary,
    this.useTertiary = false,
    this.keepTertiary = false,
    this.keepTertiaryContainer = false,
    //
    this.keyError,
    this.useError = false,
    this.keepError = false,
    this.keepErrorContainer = false,
    //
    this.contrastLevel = 0.0,
    this.useExpressiveOnContainerColors,
    this.useLegacyMonochromeSeedBehavior,
  });

  /// Use a seed generated [ColorScheme] based on key colors.
  ///
  /// Turn on using Material-3 based key color seed generated based
  /// [TonalPalette] colors, used by the resulting [ColorScheme] produced
  /// by [FlexColorScheme.toScheme], that is also consumed by
  /// [FlexColorScheme.toTheme] when it generates its [ThemeData] object.
  ///
  /// By default, the effective [FlexColorScheme.primary] will be used as key
  /// color for all [TonalPalette]s that in Material-3 design use a single
  /// primary color as its key color to generate all tonal palettes.
  /// This includes all the primary tones, as well as neutral and neutral
  /// variant tones, used by all surface colors.
  ///
  /// Defaults to true.
  final bool useKeyColors;

  /// The key color to use as color for the seed generated primary tonal
  /// palette and potentially entire [ColorScheme] if other key colors are
  /// not used.
  ///
  /// If undefined, effective [FlexColorScheme.primary] will be used as key
  /// primary for the seed generated [ColorScheme].
  final Color? keyPrimary;

  /// Lock primary color to key color.
  ///
  /// Set [keepPrimary] to true, to make the resulting [ColorScheme.primary]
  /// color use the input primary key color as its resulting primary color.
  ///
  /// If a [keyPrimary] is defined, it will be used as the input key color.
  /// If it is null, the effective [FlexColorScheme.primary] will be used as
  /// input key color.
  ///
  /// This feature is useful if you want to lock the resulting
  /// [ColorScheme.primary] to an exact given color value, and also use this
  /// color as branding key for all other color values derived from primary
  /// key color. Typically you would use this when the primary color must
  /// match a given established brand color, often in light theme mode where
  /// it can be used, since the color is often designed to be printed on white
  /// paper.
  ///
  /// When you use seed generated [ColorScheme] the seed key will typically
  /// not be included in the resulting [ColorScheme] color. The seed key
  /// colors are used more as a way to "set the tone" for the desired color
  /// theme, the exact same input color value will seldom become the actual
  /// [ColorScheme.primary] color. With [keepPrimary] set to true you can
  /// enforce that is.
  ///
  /// Defaults to false.
  final bool keepPrimary;

  /// Lock primary container color to key color.
  ///
  /// Set [keepPrimaryContainer] to true, to keep the resulting
  /// [ColorScheme.primaryContainer] color as defined by
  /// effective [FlexColorScheme.primaryContainer] input key color, while
  /// still letting all other colors derived from input primary key be
  /// based on colors seeded from it.
  ///
  /// This feature is useful if you want to lock the resulting
  /// [ColorScheme.primaryContainer] to an exact given color value, while using
  /// primary color as input for all other color values derived from the
  /// primary key color. Normally when you seed colors from primary, it
  /// will override the [ColorScheme.primaryContainer] value with a color value
  /// from the primary color generated tonal palette.
  ///
  /// With [keepPrimaryContainer] set to true, it will keep the effective value
  /// it has in your [FlexColorScheme].
  ///
  /// Defaults to false.
  final bool keepPrimaryContainer;

  /// The key color to use as color for the seed generated secondary tonal
  /// palette in the seed generated [ColorScheme].
  ///
  /// If undefined, effective [FlexColorScheme.secondary] will be used as
  /// key color for the seed generated [ColorScheme].
  final Color? keySecondary;

  /// Enable using own key color for the secondary tonal palette in the seed
  /// generated [ColorScheme].
  ///
  /// When enabled, if [keySecondary] is defined, it is used as input key color,
  /// otherwise effective [FlexColorScheme.secondary] color is used as input key
  /// color for all generated [ColorScheme] secondary colors.
  ///
  /// Defaults to false.
  final bool useSecondary;

  /// Lock secondary color to key color.
  ///
  /// Set [keepSecondary] to true, to make the resulting [ColorScheme.secondary]
  /// color use the input primary key color as its resulting secondary color.
  ///
  /// If a [keySecondary] is defined, it will be used as the input key color.
  /// If it is null, effective [FlexColorScheme.secondary] will be used as
  /// input key color.
  ///
  /// This feature is useful if you want to lock the resulting
  /// [ColorScheme.secondary] to an exact given color value, and also use this
  /// color as branding key for all other color values derived from secondary
  /// key color. Typically you would use this when the secondary color must
  /// match a given established brand color, often in light theme mode where
  /// it can be used, since the color is often designed to be printed on white
  /// paper.
  ///
  /// When you use seed generated [ColorScheme] the seed key will typically
  /// not be included in the resulting [ColorScheme] color. The seed key
  /// colors are used more as a way to "set the tone" for the desired color
  /// theme, the exact same input color value will seldom become the actual
  /// [ColorScheme.secondary] color. With [keepSecondary] set to true you can
  /// enforce that is.
  ///
  /// Defaults to false.
  final bool keepSecondary;

  /// Lock secondary container color to key color.
  ///
  /// Set [keepSecondaryContainer] to true, to keep the resulting
  /// [ColorScheme.secondaryContainer] color as defined by
  /// effective [FlexColorScheme.secondaryContainer] input key color, while
  /// still letting all other colors derived from input secondary key be
  /// based on colors seeded from it.
  ///
  /// This feature is useful if you want to lock the resulting
  /// [ColorScheme.secondaryContainer] to an exact given color value, while
  /// using secondary color as input for all other color values derived from the
  /// secondary key color. Normally when you seed colors from secondary, it
  /// will override the [ColorScheme.secondaryContainer] value with a color
  /// value from the secondary color generated tonal palette.
  ///
  /// With [keepSecondaryContainer] set to true, it will keep the effective
  /// value it has in your [FlexColorScheme].
  ///
  /// Defaults to false.
  final bool keepSecondaryContainer;

  /// The key color to use as color for the seed generated tertiary tonal
  /// palette in the seed generated [ColorScheme].
  ///
  /// If undefined, effective [FlexColorScheme.tertiary] will be used as
  /// key color for the seed generated [ColorScheme].
  final Color? keyTertiary;

  /// Enable using own key color for the tertiary tonal palette in the seed
  /// generated [ColorScheme].
  ///
  /// When enabled, if [keyTertiary] is defined, it is used as input key color,
  /// otherwise effective [FlexColorScheme.tertiary] color is used as input key
  /// color for all generated [ColorScheme] tertiary colors.
  ///
  /// Defaults to false.
  final bool useTertiary;

  /// Lock tertiary color to key color.
  ///
  /// Set [keepTertiary] to true, to make the resulting [ColorScheme.tertiary]
  /// color use the input primary key color as its resulting tertiary color.
  ///
  /// If a [keyTertiary] is defined, it will be used as the input key color.
  /// If it is null, effective [FlexColorScheme.tertiary] will be used as
  /// input key color.
  ///
  /// This feature is useful if you want to lock the resulting
  /// [ColorScheme.tertiary] to an exact given color value, and also use this
  /// color as branding key for all other color values derived from tertiary
  /// key color. Typically you would use this when the tertiary color must
  /// match a given established brand color, often in light theme mode where
  /// it can be used, since the color is often designed to be printed on white
  /// paper.
  ///
  /// When you use seed generated [ColorScheme] the seed key will typically
  /// not be included in the resulting [ColorScheme] color. The seed key
  /// colors are used more as a way to "set the tone" for the desired color
  /// theme, the exact same input color value will seldom become the actual
  /// [ColorScheme.tertiary] color. With [keepTertiary] set to true you can
  /// enforce that is.
  ///
  /// Defaults to false.
  final bool keepTertiary;

  /// Lock tertiary container color to key color.
  ///
  /// Set [keepTertiaryContainer] to true, to keep the resulting
  /// [ColorScheme.tertiaryContainer] color as defined by
  /// effective [FlexColorScheme.tertiaryContainer] input key color, while
  /// still letting all other colors derived from input tertiary key be
  /// based on colors seeded from it.
  ///
  /// This feature is useful if you want to lock the resulting
  /// [ColorScheme.tertiaryContainer] to an exact given color value, while using
  /// tertiary color as input for all other color values derived from the
  /// tertiary key color. Normally when you seed colors from tertiary, it
  /// will override the [ColorScheme.tertiaryContainer] value with a color value
  /// from the tertiary color generated tonal palette.
  ///
  /// With [keepTertiaryContainer] set to true, it will keep the effective value
  /// it has in your [FlexColorScheme].
  ///
  /// Defaults to false.
  final bool keepTertiaryContainer;

  /// The key color to use as color for the seed generated error tonal
  /// palette in the seed generated [ColorScheme].
  ///
  /// If undefined, effective [FlexColorScheme.error] will be used as
  /// key color for the seed generated [ColorScheme].
  final Color? keyError;

  /// Enable using own key color for the error tonal palette in the seed
  /// generated [ColorScheme].
  ///
  /// When enabled, if [keyError] is defined, it is used as input key color,
  /// otherwise effective [FlexColorScheme.error] color is used as input key
  /// color for all generated [ColorScheme] error colors.
  ///
  /// If set to false, the current default error color strategy will be used.
  /// Typically this is using the default Material-3 error colors.
  ///
  /// Defaults to false.
  final bool useError;

  /// Lock error color to key color.
  ///
  /// Set [keepError] to true, to make the resulting [ColorScheme.error]
  /// color use the input primary key color as its resulting error color.
  ///
  /// If a [keyError] is defined, it will be used as the input key color.
  /// If it is null, effective [FlexColorScheme.error] will be used as
  /// input key color.
  ///
  /// This feature is useful if you want to lock the resulting
  /// [ColorScheme.error] to an exact given color value, and also use this
  /// color as branding key for all other color values derived from error
  /// key color. Typically you would use this when the error color must
  /// match a given established brand color, often in light theme mode where
  /// it can be used, since the color is often designed to be printed on white
  /// paper.
  ///
  /// When you use seed generated [ColorScheme] the seed key will typically
  /// not be included in the resulting [ColorScheme] color. The seed key
  /// colors are used more as a way to "set the tone" for the desired color
  /// theme, the exact same input color value will seldom become the actual
  /// [ColorScheme.error] color. With [keepError] set to true you can
  /// enforce that is.
  ///
  /// Defaults to false.
  final bool keepError;

  /// Lock error container color to key color.
  ///
  /// Set [keepErrorContainer] to true, to keep the resulting
  /// [ColorScheme.errorContainer] color as defined by
  /// effective [FlexColorScheme.errorContainer] input key color, while
  /// still letting all other colors derived from input error key be
  /// based on colors seeded from it.
  ///
  /// This feature is useful if you want to lock the resulting
  /// [ColorScheme.errorContainer] to an exact given color value, while using
  /// error color as input for all other color values derived from the
  /// error key color. Normally when you seed colors from error, it
  /// will override the [ColorScheme.errorContainer] value with a color value
  /// from the error color generated tonal palette.
  ///
  /// With [keepErrorContainer] set to true, it will keep the effective value
  /// it has in your [FlexColorScheme].
  ///
  /// Defaults to false.
  final bool keepErrorContainer;

  /// The [contrastLevel] parameter indicates the contrast level between color
  /// pairs, such as [ColorScheme.primary] and [ColorScheme.onPrimary].
  /// The value 0.0 is the default
  /// (normal) contrast; -1.0 is the lowest; 1.0 is the highest.
  /// From Material Design guideline, the normal, medium and high contrast
  /// options correspond to 0.0, 0.5 and 1.0 respectively.
  ///
  /// The [contrastLevel] property is only used when seed generating a
  /// [ColorScheme] based on [SeedColorScheme.fromSeeds] when a scheme `variant`
  /// in a [FlexColorScheme.light] or [FlexColorScheme.dark] or in the
  /// extensions [FlexThemeData.light] or [FlexThemeData.dark] are used where
  /// its [FlexSchemeVariant.isFlutterScheme] is set to true. This corresponds
  /// to all the [DynamicSchemeVariant]s in Flutter SDK.
  ///
  /// This [contrastLevel] is the same as the Flutter [contrastLevel] property
  /// available in [ColorScheme.fromSeed].
  ///
  /// When using `tones` based seed generated schemes or a `variant` where its
  /// [FlexSchemeVariant.isFlutterScheme] is set to false, the [contrastLevel]
  /// value is ignored.
  ///
  /// With `tones` based schemes, the contrast level can instead be set as
  /// desired using custom [FlexTones] configurations. There are two
  /// predefined higher contrast level tone mappings available as
  /// [FlexTones.highContrast] and [FlexTones.ultraContrast], you can use them
  /// as they are or as examples on how to create your own custom high
  /// contrast tone mappings.
  final double contrastLevel;

  /// Use expressive on container colors for light mode.
  ///
  /// The [useExpressiveOnContainerColors] is used to make the light theme
  /// mode [ColorScheme] colors [ColorScheme.onPrimaryContainer],
  /// [ColorScheme.onSecondaryContainer], [ColorScheme.onTertiaryContainer]
  /// and [ColorScheme.onErrorContainer] more color expressive.
  ///
  /// This comes at the cost of their contrast level and accessibility.
  ///
  /// The value has no impact on dark mode [ColorScheme] colors. Expressive
  /// onColors for container colors have always been used in dark mode in
  /// Material-3 design and they have good contrast and accessibility.
  ///
  /// Setting the [useExpressiveOnContainerColors] to `true` will make the
  /// onContainer colors of all scheme variants and [FlexTones] based schemes
  /// use the new expressive tone, if the currently used tone is 10. If a scheme
  /// already uses an intentionally customized tone, the new expressive tone
  /// will not be used for those tones, even when this settings is true.
  ///
  /// Schemes that contain such on container tones are:
  /// - Fidelity
  /// - Monochrome
  /// - Content
  /// - Ultra Contrast
  /// - Candy pop
  /// - Chroma
  ///
  /// Defaults to `false` if undefined.
  ///
  /// The Material design spec for the tones used by the colors
  /// [ColorScheme.onPrimaryContainer], [ColorScheme.onSecondaryContainer],
  /// [ColorScheme.onTertiaryContainer] and [ColorScheme.onErrorContainer] have
  /// changed from tone **10** to **30** for **LIGHT**
  /// theme mode. It also sets the min `ContrastCurve` from
  /// ContrastCurve(4.5, 7.0, 11.0, 21.0) to
  /// ContrastCurve(3.0, 4.5, 7.0, 11.0), making min contrast for normal
  /// contrast 4.5 instead of past 7.0.
  ///
  /// The expressive light container tone is not yet used in the Flutter SDK
  /// (Mar 22, 2025), but it is in the Material-3 design spec and also in
  /// MCU v0.12.0. This is a breaking change in MCU 0.12.0 compared to 0.11.1
  /// used in Flutter 3.24 and it will change the light mode color schemes
  /// produced by all DynamicColor based Material color schemes.
  ///
  /// When this change lands in stable Flutter, it will be made
  /// `true` by default in FCS too when undefined. You you will still be able
  /// to opt out of using it, by setting it `false`. Flutter SDK and MCU will
  /// not contain such an opt-out feature. This
  ///
  /// The new **on** color tones for containers in light mode make them more
  /// color expressive, but they also reduce their contrast level and
  /// accessibility. We recommend keeping them at the higher contrast level,
  /// by setting [useExpressiveOnContainerColors] to `false`. With it set to
  /// `false`, you will also keep this preference when Flutter SDK
  /// defaults to using the expressive tones.
  final bool? useExpressiveOnContainerColors;

  /// Set this to `true` to use the legacy behavior for monochrome seed colors.
  ///
  /// With Flutter SDK and also FCS versions before 8.0.0, using a monochrome
  /// seed color or white color, resulted in a tonal palette with cyan color
  /// tones. Whereas a black seed color resulted in red like color tones. This
  /// is not very intuitive and not really expected or desired when using
  /// monochrome seed colors.
  ///
  /// In version 8.0.0 and later of FCS any monochrome RGB input value will
  /// result in the creation of a greyscale tonal palette for the palette
  /// using the monochrome seed color. An RGB monochrome value is one
  /// where Red, Green and Blue values are all equal.
  ///
  /// If you require the old style seed result for monochrome seed colors,
  /// set [useLegacyMonochromeSeedBehavior] to `true.
  ///
  /// Defaults to `false`.
  ///
  /// Under the hood this setting is passed to `respectMonochromeSeed` in
  /// `SeedColorScheme.fromSeeds` in FlexSeedScheme's internal MCU fork, and
  /// setting it to ![useLegacyMonochromeSeedBehavior]. In FSS this feature is
  /// opt-in and recommended to be used. Here, in FCS this setting is opt-out
  /// if not desired and it is strongly recommended to use the new behavior.
  ///
  /// **NOTE:**
  ///
  /// When using `useLegacyMonochromeSeedBehavior` with
  /// `DynamicSchemeVariant` variants `fidelity` or `content`, for some
  /// monochrome input colors they produce `primaryContainer` and
  /// `onPrimaryContainer` as well as `tertiaryContainer` and
  /// `onTertiaryContainer` color pairs, with low contrast. Consider using
  /// some other scheme variants with monochrome seed colors. All others work
  /// well with any monochrome seed color. This is just how the MCU
  /// `DynamicScheme`s `SchemeContent` and `SchemeFidelity` are defined in MCU.
  /// They also produce fairly low contrast for these color pairs with very
  /// dark seed colors. This behavior with MCU's `SchemeContent` and
  /// `SchemeFidelity` could be fixed in FlexSeedScheme's internal MCU fork,
  /// but we want to keep the result of these schemes consistent with MCU.
  final bool? useLegacyMonochromeSeedBehavior;

  /// Copy the object with one or more provided properties changed.
  FlexKeyColors copyWith({
    final bool? useKeyColors,
    //
    final Color? keyPrimary,
    final bool? keepPrimary,
    final bool? keepPrimaryContainer,
    //
    final Color? keySecondary,
    final bool? useSecondary,
    final bool? keepSecondary,
    final bool? keepSecondaryContainer,
    //
    final Color? keyTertiary,
    final bool? useTertiary,
    final bool? keepTertiary,
    final bool? keepTertiaryContainer,
    //
    final Color? keyError,
    final bool? useError,
    final bool? keepError,
    final bool? keepErrorContainer,
    //
    final double? contrastLevel,
    final bool? useExpressiveOnContainerColors,
    final bool? useLegacyMonochromeSeedBehavior,
  }) {
    return FlexKeyColors(
      useKeyColors: useKeyColors ?? this.useKeyColors,
      //
      keyPrimary: keyPrimary ?? this.keyPrimary,
      keepPrimary: keepPrimary ?? this.keepPrimary,
      keepPrimaryContainer: keepPrimaryContainer ?? this.keepPrimaryContainer,
      //
      keySecondary: keySecondary ?? this.keySecondary,
      useSecondary: useSecondary ?? this.useSecondary,
      keepSecondary: keepSecondary ?? this.keepSecondary,
      keepSecondaryContainer:
          keepSecondaryContainer ?? this.keepSecondaryContainer,
      //
      keyTertiary: keyTertiary ?? this.keyTertiary,
      useTertiary: useTertiary ?? this.useTertiary,
      keepTertiary: keepTertiary ?? this.keepTertiary,
      keepTertiaryContainer:
          keepTertiaryContainer ?? this.keepTertiaryContainer,
      //
      keyError: keyError ?? this.keyError,
      useError: useError ?? this.useError,
      keepError: keepError ?? this.keepError,
      keepErrorContainer: keepErrorContainer ?? this.keepErrorContainer,
      //
      contrastLevel: contrastLevel ?? this.contrastLevel,
      useExpressiveOnContainerColors:
          useExpressiveOnContainerColors ?? this.useExpressiveOnContainerColors,
      useLegacyMonochromeSeedBehavior: useLegacyMonochromeSeedBehavior ??
          this.useLegacyMonochromeSeedBehavior,
      //
    );
  }

  /// Override the equality operator.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is FlexKeyColors &&
        other.useKeyColors == useKeyColors &&
        //
        other.keyPrimary == keyPrimary &&
        other.keepPrimary == keepPrimary &&
        other.keepPrimaryContainer == keepPrimaryContainer &&
        //
        other.keySecondary == keySecondary &&
        other.useSecondary == useSecondary &&
        other.keepSecondary == keepSecondary &&
        other.keepSecondaryContainer == keepSecondaryContainer &&
        //
        other.keyTertiary == keyTertiary &&
        other.useTertiary == useTertiary &&
        other.keepTertiary == keepTertiary &&
        other.keepTertiaryContainer == keepTertiaryContainer &&
        //
        other.keyError == keyError &&
        other.useError == useError &&
        other.keepError == keepError &&
        other.keepErrorContainer == keepErrorContainer &&
        //
        other.contrastLevel == contrastLevel &&
        other.useExpressiveOnContainerColors ==
            useExpressiveOnContainerColors &&
        other.useLegacyMonochromeSeedBehavior ==
            useLegacyMonochromeSeedBehavior;
  }

  /// Override for hashcode, dart.ui Jenkins based.
  @override
  int get hashCode => Object.hash(
        useKeyColors,
        //
        keyPrimary,
        keepPrimary,
        keepPrimaryContainer,
        //
        keySecondary,
        useSecondary,
        keepSecondary,
        keepSecondaryContainer,
        //
        keyTertiary,
        useTertiary,
        keepTertiary,
        keepTertiaryContainer,
        //
        keyError,
        useError,
        keepError,
        keepErrorContainer,
        //
        contrastLevel,
        useExpressiveOnContainerColors,
        useLegacyMonochromeSeedBehavior,
      );

  /// Flutter debug properties override, includes toString.
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('useKeyColors', useKeyColors));
    //
    properties.add(ColorProperty('keyPrimary', keyPrimary));
    properties.add(DiagnosticsProperty<bool>('keepPrimary', keepPrimary));
    properties.add(DiagnosticsProperty<bool>(
        'keepPrimaryContainer', keepPrimaryContainer));
    //
    properties.add(ColorProperty('keySecondary', keySecondary));
    properties.add(DiagnosticsProperty<bool>('useSecondary', useSecondary));
    properties.add(DiagnosticsProperty<bool>('keepSecondary', keepSecondary));
    properties.add(DiagnosticsProperty<bool>(
        'keepSecondaryContainer', keepSecondaryContainer));
    //
    properties.add(ColorProperty('keyTertiary', keyPrimary));
    properties.add(DiagnosticsProperty<bool>('keyTertiary', useTertiary));
    properties.add(DiagnosticsProperty<bool>('keepTertiary', keepTertiary));
    properties.add(DiagnosticsProperty<bool>(
        'keepTertiaryContainer', keepTertiaryContainer));
    //
    properties.add(ColorProperty('keyError', keyPrimary));
    properties.add(DiagnosticsProperty<bool>('keyError', useError));
    properties.add(DiagnosticsProperty<bool>('keepError', keepError));
    properties.add(
        DiagnosticsProperty<bool>('keepErrorContainer', keepErrorContainer));
    //
    properties.add(DiagnosticsProperty<double>('contrastLevel', contrastLevel));
    properties.add(DiagnosticsProperty<bool>(
        'useExpressiveOnContainerColors', useExpressiveOnContainerColors));
    properties.add(DiagnosticsProperty<bool>(
        'useLegacyMonochromeSeedBehavior', useLegacyMonochromeSeedBehavior));
  }
}
