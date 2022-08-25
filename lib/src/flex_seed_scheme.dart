import 'package:flutter/material.dart';
import 'package:meta/meta.dart' show internal;

import 'flex_core_palette.dart';
import 'flex_tones.dart';

// ignore_for_file: comment_references

/// This class is the same concept as Flutter's [ColorScheme] class.
///
/// It is used used to generate a scheme based on a modified version of
/// [CorePalette] found in package material_color_utilities. It is a simple
/// modification of [Scheme] found in same "material_color_utilities" package.
///
/// It uses two changes that makes it more flexible:
///
/// 1) Three seed colors instead of just one.
///
/// Instead of [CorePalette] it uses inherited version called [FlexCorePalette]
/// that enables using 1, 2 or 3 seed colors for more degrees
/// of freedom in seeded ColorScheme, using defined seed colors for
/// primary, secondary and tertiary colors. The extended [FlexCorePalette]
/// version also allows for adjusting chroma usage and levels that are
/// hard coded into M3 design [CorePalette].
///
/// 2) Configurable tone to ColorScheme mapping.
///
/// Which tones to use for what color in the [ColorScheme] is not hard coded
/// like it is in material_color_utilities [Scheme] class. It also
/// accepts an optional [FlexTones] class that can be used to configure
/// all the tone mapping from [FlexTonalPalette] to [ColorScheme], including
/// passing all the extra min chroma and fixed level parameters it should
/// use when it makes the [FlexCorePalette].
///
/// Keeping this helper class internal for now in [FlexColorScheme] package,
/// if there ever is a request for making it available directly via the library,
/// post an issue and we will consider it.
@internal
class FlexSeedScheme {
  /// The color displayed most frequently across your app.
  final int primary;

  /// A color that's clearly legible when drawn on [primary].
  final int onPrimary;

  /// A color used for elements needing less emphasis than [primary].
  final int primaryContainer;

  /// A color that's clearly legible when drawn on [primaryContainer].
  final int onPrimaryContainer;

  /// An accent color used for less prominent components in the UI, such as
  /// filter chips, while expanding the opportunity for color expression.
  final int secondary;

  /// A color that's clearly legible when drawn on [secondary].
  final int onSecondary;

  /// A color used for elements needing less emphasis than [secondary].
  final int secondaryContainer;

  /// A color that's clearly legible when drawn on [secondaryContainer].
  final int onSecondaryContainer;

  /// A color used as a contrasting accent that can balance [primary]
  /// and [secondary] colors or bring heightened attention to an element,
  /// such as an input field.
  final int tertiary;

  /// A color that's clearly legible when drawn on [tertiary].
  final int onTertiary;

  /// A color used for elements needing less emphasis than [tertiary].
  final int tertiaryContainer;

  /// A color that's clearly legible when drawn on [tertiaryContainer].
  final int onTertiaryContainer;

  /// The color to use for input validation errors, e.g. for
  /// [InputDecoration.errorText].
  final int error;

  /// A color that's clearly legible when drawn on [error].
  final int onError;

  /// A color used for error elements needing less emphasis than [error].
  final int errorContainer;

  /// A color that's clearly legible when drawn on [errorContainer].
  final int onErrorContainer;

  /// A color that typically appears behind scrollable content.
  final int background;

  /// A color that's clearly legible when drawn on [background].
  final int onBackground;

  /// The background color for widgets like [Card].
  final int surface;

  /// A color that's clearly legible when drawn on [surface].
  final int onSurface;

  /// A color variant of [surface] that can be used for differentiation against
  /// a component using [surface].
  final int surfaceVariant;

  /// A color that's clearly legible when drawn on [surfaceVariant].
  final int onSurfaceVariant;

  /// A utility color that creates boundaries and emphasis to improve usability.
  final int outline;

  /// A utility color that creates boundaries for decorative elements when a
  /// 3:1 contrast isn’t required, such as for dividers or decorative elements.
  final int outlineVariant;

  /// A color use to paint the drop shadows of elevated components.
  final int shadow;

  /// A color use to paint the scrim around of modal components.
  final int scrim;

  /// A surface color used for displaying the reverse of what’s seen in the
  /// surrounding UI, for example in a SnackBar to bring attention to
  /// an alert.
  final int inverseSurface;

  /// A color that's clearly legible when drawn on [inverseSurface].
  final int onInverseSurface;

  /// An accent color used for displaying a highlight color on [inverseSurface]
  /// backgrounds, like button text in a SnackBar.
  final int inversePrimary;

  /// A color used as an overlay on a surface color to indicate a component's
  /// elevation.
  final int surfaceTint;

  /// Private constructor requiring all int color values.
  ///
  /// A [FlexSeedScheme] cannot be created externally. It is only used
  /// internally to create a seeded [ColorScheme] via its static method
  /// [FlexSeedScheme.fromSeeds] from one, two or three seed
  /// colors, and with customizable [FlexTones] tone mapping to [ColorScheme].
  const FlexSeedScheme._({
    required this.primary,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.onInverseSurface,
    required this.inversePrimary,
    required this.surfaceTint,
  });

  /// Factory that creates a [FlexSeedScheme] based on seed keys and FlexTones
  /// tones mapping.
  ///
  /// A [FlexSeedScheme] cannot be created externally. It is only used
  /// internally to create a seeded [ColorScheme] via its static method
  /// [FlexSeedScheme.fromSeeds] from one, two or three seed
  /// colors, and with customizable [FlexTones] tone mapping to [ColorScheme].
  factory FlexSeedScheme._tones({
    required int primaryKey,
    int? secondaryKey,
    int? tertiaryKey,
    required FlexTones tones,
  }) {
    final FlexCorePalette core = FlexCorePalette.fromSeeds(
      primary: primaryKey,
      secondary: secondaryKey,
      tertiary: tertiaryKey,
      primaryChroma: tones.primaryChroma,
      primaryMinChroma: tones.primaryMinChroma,
      secondaryChroma: tones.secondaryChroma,
      secondaryMinChroma: tones.secondaryMinChroma,
      tertiaryChroma: tones.tertiaryChroma,
      tertiaryMinChroma: tones.tertiaryMinChroma,
      neutralChroma: tones.neutralChroma,
      neutralVariantChroma: tones.neutralVariantChroma,
    );
    return FlexSeedScheme._(
      primary: core.primary.get(tones.primaryTone),
      onPrimary: core.primary.get(tones.onPrimaryTone),
      primaryContainer: core.primary.get(tones.primaryContainerTone),
      onPrimaryContainer: core.primary.get(tones.onPrimaryContainerTone),
      secondary: core.secondary.get(tones.secondaryTone),
      onSecondary: core.secondary.get(tones.onSecondaryTone),
      secondaryContainer: core.secondary.get(tones.secondaryContainerTone),
      onSecondaryContainer: core.secondary.get(tones.onSecondaryContainerTone),
      tertiary: core.tertiary.get(tones.tertiaryTone),
      onTertiary: core.tertiary.get(tones.onTertiaryTone),
      tertiaryContainer: core.tertiary.get(tones.tertiaryContainerTone),
      onTertiaryContainer: core.tertiary.get(tones.onTertiaryContainerTone),
      error: core.error.get(tones.errorTone),
      onError: core.error.get(tones.onErrorTone),
      errorContainer: core.error.get(tones.errorContainerTone),
      onErrorContainer: core.error.get(tones.onErrorContainerTone),
      background: core.neutral.get(tones.backgroundTone),
      onBackground: core.neutral.get(tones.onBackgroundTone),
      surface: core.neutral.get(tones.surfaceTone),
      onSurface: core.neutral.get(tones.onSurfaceTone),
      surfaceVariant: core.neutralVariant.get(tones.surfaceVariantTone),
      onSurfaceVariant: core.neutralVariant.get(tones.onSurfaceVariantTone),
      outline: core.neutralVariant.get(tones.outlineTone),
      outlineVariant: core.neutralVariant.get(tones.outlineVariantTone),
      shadow: core.neutral.get(tones.shadowTone),
      scrim: core.neutral.get(tones.scrimTone),
      inverseSurface: core.neutral.get(tones.inverseSurfaceTone),
      onInverseSurface: core.neutral.get(tones.onInverseSurfaceTone),
      inversePrimary: core.primary.get(tones.inversePrimaryTone),
      surfaceTint: core.primary.get(tones.surfaceTintTone),
    );
  }
}

/// Extension on [ColorScheme] to provide a more flexible alternative to
/// Flutter's Material 3 [ColorScheme.fromSeed].
///
/// Use this extension to make a seeded [ColorScheme] using separate key colors
/// for primary, secondary and tertiary colors in [ColorScheme].
///
/// By providing a [FlexTones] you can override customize tone mapping from
/// tonal palettes to [ColorScheme] color and key color chroma usage per key
/// color for the tonal palette creation.
extension SeedColorScheme on ColorScheme {
  /// Returns a [ColorScheme] from seed keys [primaryKey], [secondaryKey] and
  /// [tertiaryKey] colors. Use [FlexTones] configuration to customize mapping
  /// from tonal palettes to [ColorScheme] color and key color chroma usage per
  /// key color for the tonal palette creation.
  ///
  /// Any seed produced [ColorScheme] color can be overridden by providing it a
  /// given [Color] pre-assigned value.
  static ColorScheme fromSeeds({
    Brightness brightness = Brightness.light,
    required Color primaryKey,
    Color? secondaryKey,
    Color? tertiaryKey,
    FlexTones? tones,
    Color? primary,
    Color? onPrimary,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? secondary,
    Color? onSecondary,
    Color? secondaryContainer,
    Color? onSecondaryContainer,
    Color? tertiary,
    Color? onTertiary,
    Color? tertiaryContainer,
    Color? onTertiaryContainer,
    Color? error,
    Color? onError,
    Color? errorContainer,
    Color? onErrorContainer,
    Color? background,
    Color? onBackground,
    Color? surface,
    Color? onSurface,
    Color? surfaceVariant,
    Color? onSurfaceVariant,
    Color? outline,
    Color? outlineVariant,
    Color? shadow,
    Color? scrim,
    Color? inverseSurface,
    Color? onInverseSurface,
    Color? inversePrimary,
    Color? surfaceTint,
  }) {
    final FlexSeedScheme scheme = brightness == Brightness.light
        ? FlexSeedScheme._tones(
            primaryKey: primaryKey.value,
            secondaryKey: secondaryKey?.value,
            tertiaryKey: tertiaryKey?.value,
            tones: tones ?? FlexTones.material(Brightness.light),
          )
        : FlexSeedScheme._tones(
            primaryKey: primaryKey.value,
            secondaryKey: secondaryKey?.value,
            tertiaryKey: tertiaryKey?.value,
            tones: tones ?? FlexTones.material(Brightness.dark),
          );
    return ColorScheme(
      primary: primary ?? Color(scheme.primary),
      onPrimary: onPrimary ?? Color(scheme.onPrimary),
      primaryContainer: primaryContainer ?? Color(scheme.primaryContainer),
      onPrimaryContainer:
          onPrimaryContainer ?? Color(scheme.onPrimaryContainer),
      secondary: secondary ?? Color(scheme.secondary),
      onSecondary: onSecondary ?? Color(scheme.onSecondary),
      secondaryContainer:
          secondaryContainer ?? Color(scheme.secondaryContainer),
      onSecondaryContainer:
          onSecondaryContainer ?? Color(scheme.onSecondaryContainer),
      tertiary: tertiary ?? Color(scheme.tertiary),
      onTertiary: onTertiary ?? Color(scheme.onTertiary),
      tertiaryContainer: tertiaryContainer ?? Color(scheme.tertiaryContainer),
      onTertiaryContainer:
          onTertiaryContainer ?? Color(scheme.onTertiaryContainer),
      error: error ?? Color(scheme.error),
      onError: onError ?? Color(scheme.onError),
      errorContainer: errorContainer ?? Color(scheme.errorContainer),
      onErrorContainer: onErrorContainer ?? Color(scheme.onErrorContainer),
      background: background ?? Color(scheme.background),
      onBackground: onBackground ?? Color(scheme.onBackground),
      surface: surface ?? Color(scheme.surface),
      onSurface: onSurface ?? Color(scheme.onSurface),
      surfaceVariant: surfaceVariant ?? Color(scheme.surfaceVariant),
      onSurfaceVariant: onSurfaceVariant ?? Color(scheme.onSurfaceVariant),
      outline: outline ?? Color(scheme.outline),
      outlineVariant: outlineVariant ?? Color(scheme.outlineVariant),
      shadow: shadow ?? Color(scheme.shadow),
      scrim: scrim ?? Color(scheme.scrim),
      inverseSurface: inverseSurface ?? Color(scheme.inverseSurface),
      onInverseSurface: onInverseSurface ?? Color(scheme.onInverseSurface),
      inversePrimary: inversePrimary ?? Color(scheme.inversePrimary),
      surfaceTint: surfaceTint ?? Color(scheme.primary),
      brightness: brightness,
    );
  }
}
