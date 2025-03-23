import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../flex_color_scheme.dart' show FlexSchemeData; // For comment refs.
import 'flex_color.dart';
import 'flex_color_scheme.dart' show FlexColorScheme;
import 'flex_constants.dart';
import 'flex_extensions.dart';

/// Immutable color data class for the main scheme colors used in a
/// FlexColorScheme based color scheme and theming engine.
///
/// The default constructor requires the main color properties. To make a
/// [FlexSchemeColor] from a minimum of just the primary color, use the factory
/// [FlexSchemeColor.from] which only requires the primary color to make
/// a complete color set, but can use the other colors as optional values.
///
/// The [FlexSchemeColor] is a set of main colors, or a palette used to define
/// a color scheme for a theme. See also [FlexSchemeData] that defines
/// a name and description for a pair of matched light and dark
/// [FlexSchemeColor] classes, used to make a color scheme pair, that is
/// then used to make light and dark [ThemeData], typically toggled
/// by [ThemeMode].
@immutable
class FlexSchemeColor with Diagnosticable {
  /// Default constructor, that requires the main four colors.
  ///
  /// Consider using the [FlexSchemeColor.from] factory
  /// constructor for more flexibility and less required values based on
  /// using computed defaults for missing, but required values in a complete
  /// [FlexSchemeColor].
  ///
  /// If you are defining all four required color values, then prefer using this
  /// default constructor as it can be const.
  ///
  /// The appBarColor and error colors are not required, if they
  /// are null, they will be provided by defaults in theme creation later.
  const FlexSchemeColor({
    required this.primary,
    Color? primaryContainer,
    this.primaryLightRef,
    required this.secondary,
    Color? secondaryContainer,
    this.secondaryLightRef,
    Color? tertiary,
    Color? tertiaryContainer,
    this.tertiaryLightRef,
    this.appBarColor,
    this.error,
    this.errorContainer,
    this.swapOnMaterial3 = false,
  })  : _primaryContainer = primaryContainer,
        _secondaryContainer = secondaryContainer,
        _tertiary = tertiary,
        _tertiaryContainer = tertiaryContainer;

  /// The color displayed most frequently across your application's screens
  /// and components.
  final Color primary;

  // A private color used for elements needing less emphasis than [primary],
  // set via constructor init list.
  final Color? _primaryContainer;

  /// A color used for elements needing less emphasis than [primary].
  Color get primaryContainer => _primaryContainer ?? primary;

  /// A reference to the primary color used in a light theme mode
  /// [FlexSchemeColor].
  ///
  /// This color typically only needs to be provided in a [FlexSchemeColor] used
  /// for dark mode colors. The [primaryLightRef] color value should be the same
  /// color as the [primary] color in the light mode [FlexSchemeColor].
  /// If you intend to use the [toDark] to compute dark mode colors from a light
  /// mode [FlexSchemeColor], you should also define the [primaryLightRef]
  /// color in order to keep the **fixed** colors identical in light and
  /// dark mode, when using the [toDark] method.
  ///
  /// In dark mode color schemes this reference color is used so that
  /// [SeedColorScheme.fromSeeds] can compute the same colors in dark mode,
  /// as in light mode, for the [ColorScheme] colors [ColorScheme.primaryFixed],
  /// [ColorScheme.onPrimaryFixed], [ColorScheme.primaryFixedDim] and
  /// [ColorScheme.onPrimaryFixedVariant].
  ///
  /// This color does not need to be provided in a [FlexSchemeColor] used for
  /// light mode colors, as it is not used in light mode.
  ///
  /// If this color is not provided in a dark mode [FlexSchemeColor], the fixed
  /// and fixedDim colors will be computed from the [primary] color. Typically
  /// this [primary] is not the same color as in light mode, so the fixed dark
  /// colors will then not match the fixed light mode colors. The design intent
  /// of the fixed colors is that they should be identical in light and dark
  /// mode. If you want this, you must provide the same color as in the light
  /// mode [FlexSchemeColor.primary] for this color.
  final Color? primaryLightRef;

  /// A support color to primary, with less emphasis than primary, often of
  /// same hue as primary, but does not have to be.
  final Color secondary;

  // A private color used for elements needing less emphasis than [secondary],
  // set via constructor initializer.
  final Color? _secondaryContainer;

  /// A color used for elements needing less emphasis than [secondary].
  Color get secondaryContainer => _secondaryContainer ?? secondary;

  /// A reference to the secondary color used in a light theme mode
  /// [FlexSchemeColor].
  ///
  /// This color typically only needs to be provided in a [FlexSchemeColor] used
  /// for dark mode colors. The [secondaryLightRef] color value should be the
  /// same color as the [secondary] color in the light mode [FlexSchemeColor].
  /// If you intend to use the [toDark] to compute dark mode colors from a light
  /// mode [FlexSchemeColor], you should also define the [secondaryLightRef]
  /// color in order to keep the **fixed** colors identical in light and
  /// dark mode, when using the [toDark] method.
  ///
  /// In dark mode color schemes this reference color is used so that
  /// [SeedColorScheme.fromSeeds] can compute the same colors in dark mode,
  /// as in light mode, for the [ColorScheme] colors [ColorScheme.primaryFixed],
  /// [ColorScheme.onPrimaryFixed], [ColorScheme.primaryFixedDim] and
  /// [ColorScheme.onPrimaryFixedVariant].
  ///
  /// This color does not need to be provided in a [FlexSchemeColor] used for
  /// light mode colors, as it is not used in light mode.
  ///
  /// If this color is not provided in a dark mode [FlexSchemeColor], the fixed
  /// and fixedDim colors will be computed from the [secondary] color. Typically
  /// this [secondary] is not the same color as in light mode, so the fixed dark
  /// colors will then not match the fixed light mode colors. The design intent
  /// of the fixed colors is that they should be identical in light and dark
  /// mode. If you want this, you must provide the same color as in the light
  /// mode [FlexSchemeColor.secondary] for this color.
  final Color? secondaryLightRef;

  // A private color used as a contrasting accent that can balance [primary]
  // and [secondary] colors or bring heightened attention to an element,
  // such as an input field, set via constructor initializer.
  final Color? _tertiary;

  /// A color used as a contrasting accent that can balance [primary]
  /// and [secondary] colors or bring heightened attention to an element,
  /// such as an input field.
  Color get tertiary => _tertiary ?? secondary;

  // A private color used for elements needing less emphasis than [tertiary],
  // set via constructor initializer.
  final Color? _tertiaryContainer;

  /// A private color used for elements needing less emphasis than [tertiary],
  Color get tertiaryContainer => _tertiaryContainer ?? _tertiary ?? secondary;

  /// A reference to the tertiary color used in a light theme mode
  /// [FlexSchemeColor].
  ///
  /// This color typically only needs to be provided in a [FlexSchemeColor] used
  /// for dark mode colors. The [tertiaryLightRef] color value should be the
  /// same color as the [tertiary] color in the light mode [FlexSchemeColor].
  /// If you intend to use the [toDark] to compute dark mode colors from a light
  /// mode [FlexSchemeColor], you should also define the [tertiaryLightRef]
  /// color in order to keep the **fixed** colors identical in light and
  /// dark mode, when using the [toDark] method.
  ///
  /// In dark mode color schemes this reference color is used so that
  /// [SeedColorScheme.fromSeeds] can compute the same colors in dark mode,
  /// as in light mode, for the [ColorScheme] colors [ColorScheme.primaryFixed],
  /// [ColorScheme.onPrimaryFixed], [ColorScheme.primaryFixedDim] and
  /// [ColorScheme.onPrimaryFixedVariant].
  ///
  /// This color does not need to be provided in a [FlexSchemeColor] used for
  /// light mode colors, as it is not used in light mode.
  ///
  /// If this color is not provided in a dark mode [FlexSchemeColor], the fixed
  /// and fixedDim colors will be computed from the [tertiary] color. Typically
  /// this [tertiary] is not the same color as in light mode, so the fixed dark
  /// colors will then not match the fixed light mode colors. The design intent
  /// of the fixed colors is that they should be identical in light and dark
  /// mode. If you want this, you must provide the same color as in the light
  /// mode [FlexSchemeColor.tertiary] for this color.
  final Color? tertiaryLightRef;

  /// The color of the app bar.
  ///
  /// In light mode an app bar's theme color will in standard Material themes
  /// default to primary color and to surface color in dark mode.
  /// [FlexSchemeColor] allows you to define a color for the app bar theme
  /// that differs from this default.
  final Color? appBarColor;

  /// The color to use for input validation errors, e.g. for
  /// [InputDecoration.errorText].
  final Color? error;

  /// A color used for error elements needing less emphasis than [error].
  final Color? errorContainer;

  /// When using Material3 color system, this [FlexSchemeColor] should prefer
  /// to swap secondary and tertiary colors.
  ///
  /// Set this flag to true, if this [FlexSchemeColor]'s has a design
  /// that if Material 3 color system is used, will benefit
  /// if the secondary and tertiary colors, including their containers, are
  /// swapped.
  ///
  /// Many legacy FlexColorScheme color schemes were designed for M2 and have
  /// this flag set to true. If this flag is false (default) it may mean
  /// that its [FlexSchemeColor] was designed for M3 or that it won't benefit
  /// from swapping secondary and tertiary colors.
  ///
  /// This property does not cause swapping of any color information, it is only
  /// metadata that provides information that such swapping is beneficial when
  /// using the Material 3 color system for this particular [FlexSchemeColor].
  ///
  /// Using seed generated color scheme with the built-in [FlexSchemeColor]
  /// colors is another way to make them suitable for the M3 Color system.
  /// However, in some cases the secondary color in their design may not be
  /// in-line with M3 color system design intent, especially if you use seeded
  /// color schemes that also use chroma from the secondary color to make tonal
  /// palettes for it. However, in many of the legacy FlexSchemeColor color
  /// designs, this can be fixed if we swap the secondary and tertiary colors.
  /// Such [FlexSchemeColor] has since FlexColorScheme version 6.1.0 been
  /// configured with its [swapOnMaterial3] property set to true.
  /// All others have it set to false.
  ///
  /// To actually make such [FlexSchemeColor] automatically swap secondary and
  /// tertiary colors when [FlexColorScheme.useMaterial3] is set to true,
  /// which it is by default, set the [FlexColorScheme.light] and
  /// [FlexColorScheme.light] parameter `swapLegacyOnMaterial3`to true.
  /// It defaults to false for backwards compatibility, but it is recommended
  /// to turn it on when using Material-3 color system. If you use seeded
  /// color schemes with Material-2, the [FlexColorScheme.useMaterial3] flag is
  /// false, it may be preferable to keep [swapOnMaterial3] false.
  ///
  /// The Themes Playground app defaults to setting this value to true, but
  /// allows you to turn it off.
  ///
  /// Defaults to false.
  final bool swapOnMaterial3;

  /// Make a [FlexSchemeColor] from just one primary color or possible also
  /// from a more complete color scheme set. This is a convenience factory that
  /// can create nice toned color schemes based on only the primary color.
  ///
  /// If brightness is null, this function works as in versions before v5, with
  /// respect to the colors properties that existed in FlexSchemeColor then.
  /// When brightness is dark or light, it has new logic more suitable for
  /// the M3 ColorScheme color definitions, for light or dark theme.
  ///
  /// With brightness set it also creates error colors for [error] and
  /// [errorContainer] using past M2 standard error
  /// [FlexColor.materialLightError] or [FlexColor.materialDarkError]
  /// or as input value for [error] if not provided and computes
  /// [errorContainer]. If either value is passed in they are used as given.
  // ignore: sort_constructors_first
  factory FlexSchemeColor.from({
    required Color primary,
    Color? primaryContainer,
    Color? primaryLightRef,
    Color? secondary,
    Color? secondaryContainer,
    Color? secondaryLightRef,
    Color? tertiary,
    Color? tertiaryContainer,
    Color? tertiaryLightRef,
    Color? appBarColor,
    Color? error,
    Color? errorContainer,
    Brightness? brightness,
    bool swapOnMaterial3 = false,
  }) {
    if (brightness == Brightness.light) {
      return FlexSchemeColor(
        primary: primary,
        primaryContainer:
            primaryContainer ?? primary.lighten(20).blend(Colors.white, 60),
        primaryLightRef: primaryLightRef ?? primary,
        secondary: secondary ?? primary.darken().brighten(20),
        secondaryContainer: secondaryContainer ??
            secondary?.brighten(14).blend(Colors.white, 50) ??
            primary.darken().brighten(20).blend(Colors.white, 60),
        secondaryLightRef:
            secondaryLightRef ?? secondary ?? primary.darken().brighten(20),
        tertiary: tertiary ?? primary.brighten(15),
        tertiaryContainer: tertiaryContainer ??
            tertiary?.brighten(18).blend(Colors.white, 50) ??
            primary.brighten(15).lighten(20).blend(Colors.white, 60),
        tertiaryLightRef: tertiaryLightRef ?? tertiary ?? primary.brighten(15),
        appBarColor: appBarColor ??
            tertiary ??
            primary.brighten(15).lighten(20).blend(Colors.white, 60),
        error: error ?? FlexColor.materialLightError,
        errorContainer: errorContainer ??
            FlexColor.lightErrorContainer(
                error ?? FlexColor.materialLightError),
        swapOnMaterial3: swapOnMaterial3,
      );
    } else if (brightness == Brightness.dark) {
      return FlexSchemeColor(
        primary: primary,
        primaryContainer:
            primaryContainer ?? primary.darken(5).blend(Colors.black, 55),
        primaryLightRef: primaryLightRef ?? primary,
        secondary: secondary ?? primary.darken().brighten(20),
        secondaryContainer: secondaryContainer ??
            secondary?.darken(25).blend(Colors.black, 50) ??
            primary.darken().brighten(20).blend(Colors.black, 40),
        secondaryLightRef:
            secondaryLightRef ?? secondary ?? primary.darken().brighten(20),
        tertiary: tertiary ?? primary.brighten(15),
        tertiaryContainer: tertiaryContainer ??
            tertiary?.darken(15).blend(Colors.black, 60) ??
            primary.brighten(15).darken(20).blend(Colors.black, 30),
        tertiaryLightRef: tertiaryLightRef ?? tertiary ?? primary.brighten(15),
        appBarColor: appBarColor ??
            tertiary ??
            primary.brighten(15).darken(20).blend(Colors.black, 30),
        error: error ?? FlexColor.materialDarkError,
        errorContainer: errorContainer ??
            FlexColor.darkErrorContainer(error ?? FlexColor.materialDarkError),
        swapOnMaterial3: swapOnMaterial3,
      );
    } else {
      // Legacy support for FCS earlier than v5, where brightness was not used.
      return FlexSchemeColor(
        primary: primary,
        primaryContainer:
            primaryContainer ?? primary.darken(kDarkenPrimaryContainer),
        primaryLightRef: primaryLightRef ?? primary,
        secondary: secondary ?? primary.darken(kDarkenSecondary),
        secondaryContainer: secondaryContainer ??
            secondary?.darken(kDarkenSecondaryContainerFromSecondary) ??
            primary.darken(kDarkenSecondaryContainer),
        secondaryLightRef:
            secondaryLightRef ?? secondary ?? primary.darken(kDarkenSecondary),
        tertiary: tertiary ?? primary.lighten(kDarkenPrimaryContainer),
        tertiaryContainer: tertiaryContainer ??
            tertiary?.lighten(kDarkenSecondaryContainer) ??
            primary
                .brighten(kDarkenSecondary * 2)
                .lighten(kDarkenSecondaryContainer),
        tertiaryLightRef: tertiaryLightRef ??
            tertiary ??
            primary.lighten(kDarkenPrimaryContainer),
        appBarColor: appBarColor ??
            tertiary ??
            secondary?.lighten(kDarkenPrimaryContainer) ??
            primary.lighten(kDarkenPrimaryContainer),
        error: error,
        errorContainer: errorContainer,
        swapOnMaterial3: swapOnMaterial3,
      );
    }
  }

  /// Make effective [FlexSchemeColor] colors using 1 to 6 of the passed in
  /// [colors] based on the [usedColors] property.
  ///
  /// The [usedColors] value corresponds to:
  ///
  /// * 1: Use only [primary] color in [colors], and compute [primaryContainer],
  ///   [secondary], [secondaryContainer], [tertiary] and [tertiaryContainer]
  ///   for returned [FlexSchemeColor].
  /// * 2: Use [primary] and [secondary] in [colors] and compute
  ///   [primaryContainer] and [secondaryContainer], [tertiary] and
  ///   [tertiaryContainer] for returned [FlexSchemeColor].
  /// * 3: Use [primary], [secondary] and [primaryContainer] in [colors] and
  ///   compute [secondaryContainer], [tertiary] and
  ///   [tertiaryContainer] for returned [FlexSchemeColor].
  /// * 4: Use [primary], [secondary], [primaryContainer] and
  ///   [secondaryContainer] in [colors] and compute [tertiary] and
  ///   [tertiaryContainer] for returned [FlexSchemeColor].
  /// * 5: Use [primary], [secondary], [primaryContainer], [secondaryContainer]
  ///   and [tertiary] in [colors] and compute [tertiaryContainer] for returned
  ///   [FlexSchemeColor].
  /// * 6: Use all 6 [colors] in passed in FlexColorsScheme as they are.
  /// * 7: Use [primary], [secondary] and [tertiary] in [colors] and compute
  ///   [primaryContainer], [secondaryContainer] and [tertiaryContainer]
  ///   for returned [FlexSchemeColor].
  ///
  /// If [swapColors] is true, [primary] and [secondary], as well as
  /// [primaryContainer] and [secondaryContainer] are swapped, before being
  /// usage limited by [usedColors].
  ///
  /// If brightness is null, this function works as in versions before v5, with
  /// respect to the colors properties that existed in FlexSchemeColor then.
  /// When brightness is dark or light, it has new logic more suitable for
  /// the M3 ColorScheme color definitions.
  ///
  /// With brightness set it also creates error colors for [error] and
  /// [errorContainer] using past M2 standard error
  /// [FlexColor.materialLightError] or [FlexColor.materialDarkError]
  /// or as input value for [error] if not provided and computes
  /// [errorContainer]. If either value is passed in they are used as given.
  /// If the passed in [colors] have none null [error] or [errorContainer],
  /// they are kept.
  static FlexSchemeColor effective(
    final FlexSchemeColor colors,
    final int usedColors, {
    final bool swapLegacy = false,
    final bool swapColors = false,
    final Brightness? brightness,
  }) {
    assert(usedColors >= 1 && usedColors <= 7, 'usedColors must be 1 to 7.');

    // Swap legacy M2 designed secondary and tertiary colors.
    final FlexSchemeColor swapLegacyColors = swapLegacy
        ? colors.copyWith(
            secondary: colors.tertiary,
            secondaryContainer: colors.tertiaryContainer,
            secondaryLightRef: colors.tertiaryLightRef,
            tertiary: colors.secondary,
            tertiaryContainer: colors.secondaryContainer,
            tertiaryLightRef: colors.secondaryLightRef,
          )
        : colors;

    // Swap primary and secondary colors, using legacy fixColors.
    final FlexSchemeColor effectiveColors = swapColors
        ? swapLegacyColors.copyWith(
            primary: swapLegacyColors.secondary,
            primaryContainer: swapLegacyColors.secondaryContainer,
            primaryLightRef: swapLegacyColors.secondaryLightRef,
            secondary: swapLegacyColors.primary,
            secondaryContainer: swapLegacyColors.primaryContainer,
            secondaryLightRef: swapLegacyColors.primaryLightRef,
          )
        : swapLegacyColors;

    if (brightness == Brightness.light) {
      return effectiveColors.copyWith(
        primary: effectiveColors.primary,
        primaryLightRef: effectiveColors.primaryLightRef,
        primaryContainer: (usedColors > 2 && usedColors != 7)
            ? effectiveColors.primaryContainer
            : effectiveColors.primary.lighten(20).blend(Colors.white, 60),
        secondary: (usedColors > 1 || usedColors == 7)
            ? effectiveColors.secondary
            : effectiveColors.primary.darken().brighten(20),
        secondaryLightRef: (usedColors > 1 || usedColors == 7)
            ? effectiveColors.secondaryLightRef
            : (effectiveColors.primaryLightRef ?? effectiveColors.primary)
                .darken()
                .brighten(20),
        secondaryContainer: (usedColors > 3 && usedColors != 7)
            ? effectiveColors.secondaryContainer
            : usedColors > 1
                ? effectiveColors.secondary.brighten(14).blend(Colors.white, 50)
                : effectiveColors.primary
                    .darken()
                    .brighten(20)
                    .blend(Colors.white, 60),
        tertiary: (usedColors > 4 || usedColors == 7)
            ? effectiveColors.tertiary
            : effectiveColors.primary.brighten(15),
        tertiaryLightRef: (usedColors > 4 || usedColors == 7)
            ? effectiveColors.tertiaryLightRef
            : (effectiveColors.primaryLightRef ?? effectiveColors.primary)
                .brighten(15),
        tertiaryContainer: (usedColors > 5 && usedColors != 7)
            ? effectiveColors.tertiaryContainer
            : usedColors > 4
                ? effectiveColors.tertiary.brighten(18).blend(Colors.white, 50)
                : effectiveColors.primary
                    .brighten(15)
                    .lighten(20)
                    .blend(Colors.white, 60),
        appBarColor: colors.appBarColor,
        error: colors.error ?? FlexColor.materialLightError,
        errorContainer: colors.errorContainer ??
            FlexColor.lightErrorContainer(
                colors.error ?? FlexColor.materialLightError),
      );
    } else if (brightness == Brightness.dark) {
      return effectiveColors.copyWith(
        primary: effectiveColors.primary,
        primaryLightRef: effectiveColors.primaryLightRef,
        primaryContainer: (usedColors > 2 && usedColors != 7)
            ? effectiveColors.primaryContainer
            : effectiveColors.primary.darken(5).blend(Colors.black, 55),
        secondary: (usedColors > 1 || usedColors == 7)
            ? effectiveColors.secondary
            : effectiveColors.primary.darken().brighten(20),
        secondaryLightRef: (usedColors > 1 || usedColors == 7)
            ? effectiveColors.secondaryLightRef
            : (effectiveColors.primaryLightRef ?? effectiveColors.primary)
                .darken()
                .brighten(20),
        secondaryContainer: (usedColors > 3 && usedColors != 7)
            ? effectiveColors.secondaryContainer
            : usedColors > 1
                ? effectiveColors.secondary.darken(25).blend(Colors.black, 50)
                : effectiveColors.primary
                    .darken()
                    .brighten(20)
                    .blend(Colors.black, 40),
        tertiary: (usedColors > 4 || usedColors == 7)
            ? effectiveColors.tertiary
            : effectiveColors.primary.brighten(15),
        tertiaryLightRef: (usedColors > 4 || usedColors == 7)
            ? effectiveColors.tertiaryLightRef
            : (effectiveColors.primaryLightRef ?? effectiveColors.primary)
                .brighten(15),
        tertiaryContainer: (usedColors > 5 && usedColors != 7)
            ? effectiveColors.tertiaryContainer
            : usedColors > 4
                ? effectiveColors.tertiary.darken(15).blend(Colors.black, 60)
                : effectiveColors.primary
                    .brighten(15)
                    .darken(20)
                    .blend(Colors.black, 30),
        appBarColor: colors.appBarColor,
        error: colors.error ?? FlexColor.materialDarkError,
        errorContainer: colors.errorContainer ??
            FlexColor.darkErrorContainer(
                colors.error ?? FlexColor.materialDarkError),
      );
    } else {
      // Return effective colors as computed in versions before 4, we do thus
      // not break version 4 API.
      return effectiveColors.copyWith(
        primary: effectiveColors.primary,
        primaryLightRef: effectiveColors.primaryLightRef,
        primaryContainer: (usedColors > 2 && usedColors != 7)
            ? effectiveColors.primaryContainer
            : effectiveColors.primary.darken(kDarkenPrimaryContainer),
        secondary: (usedColors > 1 || usedColors == 7)
            ? effectiveColors.secondary
            : effectiveColors.primary.darken(kDarkenSecondary),
        secondaryLightRef: (usedColors > 1 || usedColors == 7)
            ? effectiveColors.secondaryLightRef
            : (effectiveColors.primaryLightRef ?? effectiveColors.primary)
                .darken(kDarkenSecondary),
        secondaryContainer: (usedColors > 3 && usedColors != 7)
            ? effectiveColors.secondaryContainer
            : usedColors > 1
                ? effectiveColors.secondary
                    .darken(kDarkenSecondaryContainerFromSecondary)
                : effectiveColors.primary.darken(kDarkenSecondaryContainer),
        tertiary: (usedColors > 4 || usedColors == 7)
            ? effectiveColors.tertiary
            : effectiveColors.primary.lighten(kDarkenPrimaryContainer),
        tertiaryLightRef: (usedColors > 4 || usedColors == 7)
            ? effectiveColors.tertiaryLightRef
            : (effectiveColors.primaryLightRef ?? effectiveColors.primary)
                .lighten(kDarkenPrimaryContainer),
        tertiaryContainer: (usedColors > 5 && usedColors != 7)
            ? effectiveColors.tertiaryContainer
            : usedColors > 4
                ? effectiveColors.tertiary.lighten(kDarkenSecondaryContainer)
                : effectiveColors.primary
                    .brighten(kDarkenSecondary * 2)
                    .lighten(kDarkenSecondaryContainer),
        appBarColor: colors.appBarColor,
        error: colors.error,
        errorContainer: colors.errorContainer,
      );
    }
  }

  /// Returns a new [FlexSchemeColor] instance based on this one that is
  /// suitable for dark mode.
  ///
  /// Assumes that the colors this FlexColorScheme is made for are for a light
  /// theme, it does not check that current colors actually are so.
  ///
  /// Calculates less saturated colors of any colors defined for this
  /// [FlexSchemeColor] colors, by blending any none null values with white
  /// using given alpha [whiteBlend] percentage.
  ///
  /// The default [whiteBlend] is 35%, this is normally a suitable value.
  /// For more saturated primary color try 40%, which is also used in the
  /// Material design guide to convert the default red error color for
  /// light mode to dark mode. For primary light mode color with low saturation,
  /// a white blend of 20...30% often also produces nice results.
  ///
  /// In a Material-3 dark theme, the primary should be lighter than dark
  /// container. Set [swapColors] to true, to use the main color as container
  /// color and container as main color, when computing the theme with toDark.
  /// When using a light theme scheme that adheres to the Material-3 color
  /// roles, this swap may often be a good first approach to getting a decent
  /// dark version of the light scheme. You can often even keep [whiteBlend]
  /// at 0%, or close to it, when [swapColors] is true.
  FlexSchemeColor toDark([int whiteBlend = 35, bool swapColors = false]) {
    if (swapColors) {
      return FlexSchemeColor.from(
        primary: primaryContainer.blend(Colors.white, whiteBlend),
        primaryContainer: primary.blend(Colors.white, whiteBlend),
        primaryLightRef: primaryLightRef,
        secondary: secondaryContainer.blend(Colors.white, whiteBlend),
        secondaryContainer: secondary.blend(Colors.white, whiteBlend),
        secondaryLightRef: secondaryLightRef,
        tertiary: tertiaryContainer.blend(Colors.white, whiteBlend),
        tertiaryContainer: tertiary.blend(Colors.white, whiteBlend),
        tertiaryLightRef: tertiaryLightRef,
        appBarColor: appBarColor?.blend(Colors.white, whiteBlend),
        error: error?.blend(Colors.white, whiteBlend),
        errorContainer: errorContainer?.blend(Colors.white, whiteBlend),
        swapOnMaterial3: swapOnMaterial3,
      );
    } else {
      return FlexSchemeColor.from(
        primary: primary.blend(Colors.white, whiteBlend),
        primaryContainer: primaryContainer.blend(Colors.white, whiteBlend),
        primaryLightRef: primaryLightRef,
        secondary: secondary.blend(Colors.white, whiteBlend),
        secondaryContainer: secondaryContainer.blend(Colors.white, whiteBlend),
        secondaryLightRef: secondaryLightRef,
        tertiary: tertiary.blend(Colors.white, whiteBlend),
        tertiaryContainer: tertiaryContainer.blend(Colors.white, whiteBlend),
        tertiaryLightRef: tertiaryLightRef,
        appBarColor: appBarColor?.blend(Colors.white, whiteBlend),
        error: error?.blend(Colors.white, whiteBlend),
        errorContainer: errorContainer?.blend(Colors.white, whiteBlend),
        swapOnMaterial3: swapOnMaterial3,
      );
    }
  }

  /// Return a copy of this [FlexSchemeColor] that will when used, result in a
  /// theme that use the Material 3 Guide's default [error] and [errorContainer]
  /// colors.
  ///
  /// The [error] and [errorContainer] colors are left out (null) when an
  /// instance is created. This results in a copy where the error colors
  /// are null, this again will result in that a theme created from the scheme
  /// will use the Material 3 design guide's default and standard error color.
  /// It deviates a bot from the Material 2 guide value and also includes
  /// defaults for the [errorContainer] values.
  ///
  /// This function is useful if we want to create a dark scheme
  /// from a light scheme that already specifies the light scheme's error color,
  /// but we do not want a dark scheme where the light error colors are used by
  /// [toDark] to compute error colors for the dark scheme, instead we prefer
  /// to use use the Material default dark mode error color.
  ///
  /// This is demonstrated in example 5) where the [toDark] method is used, but
  /// we do not want use the already defined built-in light schemes' error
  /// colors for the computed dark schemes' error colors.
  ///
  /// Generally if you make your own schemes and are satisfied with the Material
  /// default error colors, you can omit defining them for the light scheme
  /// too. In that case it will remain null and get its default value, and
  /// likewise for the dark scheme. Example 5, the three custom schemes
  /// uses this setup.
  ///
  /// If you in example 5 remove the [defaultError] before the [toDark],
  /// you will notice that dark scheme's from the built-in schemes get
  /// a dark scheme where the error color changes when you use the
  /// "Compute dark theme" feature and the white blend "level" slider.
  /// Whereas, the custom example schemes that had no error color specified
  /// for their light scheme, still get the fixed default dark error color,
  /// as when we used this [defaultError] feature.
  FlexSchemeColor get defaultError {
    return FlexSchemeColor(
      primary: primary,
      primaryContainer: primaryContainer,
      primaryLightRef: primaryLightRef,
      secondary: secondary,
      secondaryContainer: secondaryContainer,
      secondaryLightRef: secondaryLightRef,
      tertiary: tertiary,
      tertiaryContainer: tertiaryContainer,
      tertiaryLightRef: tertiaryLightRef,
      appBarColor: appBarColor,
      swapOnMaterial3: swapOnMaterial3,
    );
  }

  /// Copy the object with one or more provided properties changed.
  FlexSchemeColor copyWith({
    final Color? primary,
    final Color? primaryContainer,
    final Color? primaryLightRef,
    final Color? secondary,
    final Color? secondaryContainer,
    final Color? secondaryLightRef,
    final Color? tertiary,
    final Color? tertiaryContainer,
    final Color? tertiaryLightRef,
    final Color? appBarColor,
    final Color? error,
    final Color? errorContainer,
    final bool? swapOnMaterial3,
  }) {
    return FlexSchemeColor(
      primary: primary ?? this.primary,
      primaryContainer: primaryContainer ?? this.primaryContainer,
      primaryLightRef: primaryLightRef ?? this.primaryLightRef,
      secondary: secondary ?? this.secondary,
      secondaryContainer: secondaryContainer ?? this.secondaryContainer,
      secondaryLightRef: secondaryLightRef ?? this.secondaryLightRef,
      tertiary: tertiary ?? this.tertiary,
      tertiaryContainer: tertiaryContainer ?? this.tertiaryContainer,
      tertiaryLightRef: tertiaryLightRef ?? this.tertiaryLightRef,
      appBarColor: appBarColor ?? this.appBarColor,
      error: error ?? this.error,
      errorContainer: errorContainer ?? this.errorContainer,
      swapOnMaterial3: swapOnMaterial3 ?? this.swapOnMaterial3,
    );
  }

  /// Override the equality operator.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is FlexSchemeColor &&
        other.primary == primary &&
        other.primaryContainer == primaryContainer &&
        other.primaryLightRef == primaryLightRef &&
        other.secondary == secondary &&
        other.secondaryContainer == secondaryContainer &&
        other.secondaryLightRef == secondaryLightRef &&
        other.tertiary == tertiary &&
        other.tertiaryContainer == tertiaryContainer &&
        other.tertiaryLightRef == tertiaryLightRef &&
        other.appBarColor == appBarColor &&
        other.error == error &&
        other.errorContainer == errorContainer &&
        other.swapOnMaterial3 == swapOnMaterial3;
  }

  /// Override for hashcode, dart.ui Jenkins based.
  @override
  int get hashCode => Object.hash(
        primary,
        primaryContainer,
        primaryLightRef,
        secondary,
        secondaryContainer,
        secondaryLightRef,
        tertiary,
        tertiaryContainer,
        tertiaryLightRef,
        appBarColor,
        error,
        errorContainer,
        swapOnMaterial3,
      );

  /// Flutter debug properties override, includes toString.
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('primary', primary));
    properties.add(ColorProperty('primaryContainer', primaryContainer));
    properties.add(ColorProperty('primaryLightRef', primaryLightRef));
    properties.add(ColorProperty('secondary', secondary));
    properties.add(ColorProperty('secondaryContainer', secondaryContainer));
    properties.add(ColorProperty('secondaryLightRef', secondaryLightRef));
    properties.add(ColorProperty('tertiary', tertiary));
    properties.add(ColorProperty('tertiaryContainer', tertiaryContainer));
    properties.add(ColorProperty('tertiaryLightRef', tertiaryLightRef));
    properties.add(ColorProperty('appBarColor', appBarColor));
    properties.add(ColorProperty('error', error));
    properties.add(ColorProperty('errorContainer', errorContainer));
    properties
        .add(DiagnosticsProperty<bool>('swapOnMaterial3', swapOnMaterial3));
  }
}
