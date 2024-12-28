import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'flex_color.dart';
import 'flex_extensions.dart';

/// Immutable data class used to create "on" colors for displaying text
/// and icons on surface, background, error colors and the primary,
/// secondary and tertiary colors.
///
/// Normally the on colors are not provided manually, but computed by using the
/// [FlexSchemeOnColors.from] static function that uses the
/// [ThemeData.estimateBrightnessForColor] static function for each on color
/// and returns a [FlexSchemeOnColors] object with the appropriate colors.
///
/// In Material 2 design used in Flutter before version 2.10, the primaryVariant
/// and SecondaryVariant did not have their own onColor. This was
/// a limitation imposed by the Flutter SDK [ColorScheme] class and [ThemeData]
/// using it. It was assumed that the onColor for primary and secondary colors
/// will also work OK for their variants. This was usually correct if the
/// variant colors wre close in brightness to their none variant
/// versions. In Material 3 design, with updated [ColorScheme] in Flutter
/// starting with version 2.10, all main colors have their own onColor. Thus
/// in FlexColorScheme version 5.0.0 and later this challenge no longer exists.
///
/// Scaffold and dialog background colors that FlexColorScheme allows us to
/// define separately, do not have their own "on" color, it is assumed that they
/// are close in brightness to the background color, so they uses
/// the same on color as background.
@immutable
class FlexSchemeOnColors with Diagnosticable {
  /// Default constructor. In most situations the factory
  /// [FlexSchemeOnColors.from] is the preferred way to create the onColors.
  const FlexSchemeOnColors({
    required this.onPrimary,
    this.onPrimaryContainer,
    required this.onSecondary,
    this.onSecondaryContainer,
    this.onTertiary,
    this.onTertiaryContainer,
    required this.onSurface,
    this.onSurfaceVariant,
    this.onSurfaceDim,
    this.onSurfaceBright,
    this.onSurfaceContainerLowest,
    this.onSurfaceContainerLow,
    this.onSurfaceContainer,
    this.onSurfaceContainerHighest,
    this.onSurfaceContainerHigh,
    this.onInverseSurface,
    required this.onError,
    this.onErrorContainer,
    @Deprecated('This color was deprecated in FCS 8.0 because Flutter 3.22 '
        'deprecated the color. '
        'It no longer has any function in FCS v8 and will be removed in v9.')
    this.onBackground,
  });

  /// A color that is clearly legible when drawn on primary color.
  final Color onPrimary;

  /// A color that is clearly legible when drawn on primaryContainer color.
  final Color? onPrimaryContainer;

  /// A color that is clearly legible when drawn on secondary color.
  final Color onSecondary;

  /// A color that is clearly legible when drawn on secondaryContainer color.
  final Color? onSecondaryContainer;

  /// A color that is clearly legible when drawn on tertiary color.
  final Color? onTertiary;

  /// A color that is clearly legible when drawn on tertiaryContainer color.
  final Color? onTertiaryContainer;

  /// A color that is clearly legible when drawn on surface color.
  final Color onSurface;

  /// A color that is clearly legible when drawn on surfaceVariant color.
  final Color? onSurfaceVariant;

  /// A color that is clearly legible when drawn on surfaceDim color.
  final Color? onSurfaceDim;

  /// A color that is clearly legible when drawn on surfaceBright color.
  final Color? onSurfaceBright;

  /// A color that is clearly legible when drawn on surfaceContainerLowest
  /// color.
  final Color? onSurfaceContainerLowest;

  /// A color that is clearly legible when drawn on surfaceContainerLow color.
  final Color? onSurfaceContainerLow;

  /// A color that is clearly legible when drawn on surfaceContainer color.
  final Color? onSurfaceContainer;

  /// A color that is clearly legible when drawn on surfaceContainerHigh color.
  final Color? onSurfaceContainerHigh;

  /// A color that is clearly legible when drawn on surfaceContainerHighest
  /// color.
  final Color? onSurfaceContainerHighest;

  /// A color that is clearly legible when drawn on inverseSurface color.
  final Color? onInverseSurface;

  /// A color that is clearly legible when drawn on background color also used
  /// as on color for scaffold background color.
  @Deprecated('This color was deprecated in FCS 8.0 because Flutter 3.22 '
      'deprecated the color. '
      'It no longer has any function in FCS v8 and will be removed in v9.')
  final Color? onBackground;

  /// A color that is clearly legible when drawn on error color.
  final Color onError;

  /// A color that is clearly legible when drawn on error container color.
  final Color? onErrorContainer;

  /// Compute on colors for required primary, secondary, surface, background
  /// and error colors and returns a valid [FlexSchemeOnColors] with correct on
  /// colors for these colors.
  ///
  /// If an optional on color value is given as input, the value for that
  /// particular on color will be used instead of the computed on color value
  /// for the corresponding provided color.
  ///
  /// The factory can also alpha blend the onColor, with each color using an
  /// optionally provided alpha blend level, that defaults to 0.
  // ignore: sort_constructors_first
  factory FlexSchemeOnColors.from({
    bool? useMaterial3,
    required Color primary,
    Color? primaryContainer,
    required Color secondary,
    Color? secondaryContainer,
    Color? tertiary,
    Color? tertiaryContainer,
    required Color surface,
    Color? inverseSurface,
    Color? surfaceTint,
    required Color error,
    Color? errorContainer,
    Color? onPrimary,
    Color? onPrimaryContainer,
    Color? onSecondary,
    Color? onSecondaryContainer,
    Color? onTertiary,
    Color? onTertiaryContainer,
    Color? onSurface,
    Color? onSurfaceVariant,
    Color? onInverseSurface,
    Color? onError,
    Color? onErrorContainer,
    int primaryAlpha = 0,
    int primaryContainerAlpha = 0,
    int secondaryAlpha = 0,
    int secondaryContainerAlpha = 0,
    int tertiaryAlpha = 0,
    int tertiaryContainerAlpha = 0,
    int surfaceAlpha = 0,
    int inverseSurfaceAlpha = 0,
    int errorAlpha = 0,
    int errorContainerAlpha = 0,
    @Deprecated('This color was deprecated in FCS 8.0 because Flutter 3.22 '
        'deprecated the color. '
        'It no longer has any function in FCS v8 and will be removed in v9.')
    Color? background,
    @Deprecated('This color was deprecated in FCS 8.0 because Flutter 3.22 '
        'deprecated the color. '
        'It no longer has any function in FCS v8 and will be removed in v9.')
    Color? onBackground,
    @Deprecated('This property was deprecated in FCS 8.0 because Flutter 3.22 '
        'deprecated the related color. '
        'It no longer has any function in FCS v8 and will be removed in v9.')
    int backgroundAlpha = 0,
    @Deprecated('This color was deprecated in FCS 8.0 because Flutter 3.22 '
        'deprecated the color. '
        'It no longer has any function in FCS v8 and will be removed in v9.')
    Color? surfaceVariant,
    @Deprecated('This property was deprecated in FCS 8.0 because Flutter 3.22 '
        'deprecated the related color. '
        'It no longer has any function in FCS v8 and will be removed in v9.')
    int surfaceVariantAlpha = 0,
  }) {
    final bool useM3 = useMaterial3 ?? true;
    // Use optional surfaceTint, with fallback to primary.
    // Surface Tint is used onSurface, onSurfaceVariant and onInverseSurface
    final Color usedSurfaceTint = surfaceTint ?? primary;

    // Check brightness of primary, secondary, error, surface and background
    // colors, then calculate appropriate colors for their onColors, if an
    // "on" color was not passed in, otherwise we just use its given color.
    final Color usedOnPrimary = onPrimary ??
        (ThemeData.estimateBrightnessForColor(primary) == Brightness.dark
            ? Colors.white.blendAlpha(primary.brighten(20), primaryAlpha)
            : Colors.black.blendAlpha(primary.brighten(20), primaryAlpha));
    final Color? usedOnPrimaryContainer = onPrimaryContainer ??
        (primaryContainer == null
            ? null
            : (ThemeData.estimateBrightnessForColor(primaryContainer) ==
                    Brightness.dark
                ? Colors.white.blendAlpha(
                    primaryContainer.brighten(22), primaryContainerAlpha)
                : Colors.black.blendAlpha(
                    primaryContainer.brighten(8), primaryContainerAlpha)));

    final Color usedOnSecondary = onSecondary ??
        (ThemeData.estimateBrightnessForColor(secondary) == Brightness.dark
            ? Colors.white.blendAlpha(secondary.brighten(20), secondaryAlpha)
            : Colors.black.blendAlpha(secondary.brighten(20), secondaryAlpha));
    final Color? usedOnSecondaryContainer = onSecondaryContainer ??
        (secondaryContainer == null
            ? null
            : (ThemeData.estimateBrightnessForColor(secondaryContainer) ==
                    Brightness.dark
                ? Colors.white.blendAlpha(
                    secondaryContainer.brighten(22), secondaryContainerAlpha)
                : Colors.black.blendAlpha(
                    secondaryContainer.brighten(8), secondaryContainerAlpha)));
    final Color? usedOnTertiary = onTertiary ??
        (tertiary == null
            ? null
            : (ThemeData.estimateBrightnessForColor(tertiary) == Brightness.dark
                ? Colors.white.blendAlpha(tertiary.brighten(20), tertiaryAlpha)
                : Colors.black
                    .blendAlpha(tertiary.brighten(20), tertiaryAlpha)));
    final Color? usedOnTertiaryContainer = onTertiaryContainer ??
        (tertiaryContainer == null
            ? null
            : (ThemeData.estimateBrightnessForColor(tertiaryContainer) ==
                    Brightness.dark
                ? Colors.white.blendAlpha(
                    tertiaryContainer.brighten(22), tertiaryContainerAlpha)
                : Colors.black.blendAlpha(
                    tertiaryContainer.brighten(8), tertiaryContainerAlpha)));

    final Color usedOnSurface = onSurface ??
        (ThemeData.estimateBrightnessForColor(surface) == Brightness.dark
            ? useM3
                ? FlexColor.darkFlexOnSurface
                    .blendAlpha(usedSurfaceTint.darken(10), surfaceAlpha)
                : Colors.white
                    .blendAlpha(usedSurfaceTint.darken(10), surfaceAlpha)
            : useM3
                ? FlexColor.lightFlexOnSurface
                    .blendAlpha(usedSurfaceTint.lighten(24), surfaceAlpha)
                : Colors.black
                    .blendAlpha(usedSurfaceTint.lighten(24), surfaceAlpha));

    final Color usedOnSurfaceVariant = onSurfaceVariant ??
        (ThemeData.estimateBrightnessForColor(surface) == Brightness.dark
            ? useM3
                ? FlexColor.darkFlexOnSurfaceVariant
                    .blendAlpha(usedSurfaceTint.darken(10), surfaceAlpha)
                : Colors.white
                    .blendAlpha(usedSurfaceTint.darken(10), surfaceAlpha)
            : useM3
                ? FlexColor.lightFlexOnSurfaceVariant
                    .blendAlpha(usedSurfaceTint.lighten(24), surfaceAlpha)
                : Colors.black
                    .blendAlpha(usedSurfaceTint.lighten(24), surfaceAlpha));

    final Color invSurface = inverseSurface ??
        (ThemeData.estimateBrightnessForColor(surface) == Brightness.dark
            ? useM3
                ? FlexColor.darkFlexInverseSurface
                : FlexColor.materialLightSurface
            : useM3
                ? FlexColor.lightFlexInverseSurface
                : FlexColor.materialDarkSurface);

    final Color usedOnInverseSurface = onInverseSurface ??
        (ThemeData.estimateBrightnessForColor(invSurface) == Brightness.dark
            ? useM3
                ? FlexColor.lightFlexOnInverseSurface.blendAlpha(
                    usedSurfaceTint.lighten(24), inverseSurfaceAlpha)
                : FlexColor.materialLightSurface
                    .blendAlpha(invSurface, inverseSurfaceAlpha)
            : useM3
                ? FlexColor.darkFlexOnInverseSurface
                    .blendAlpha(usedSurfaceTint.darken(10), inverseSurfaceAlpha)
                : FlexColor.materialDarkSurface
                    .blendAlpha(invSurface, inverseSurfaceAlpha));

    final Color usedOnError = onError ??
        (estimateErrorBrightness(error) == Brightness.dark
            ? Colors.white.blendAlpha(error.brighten(20), errorAlpha)
            : Colors.black.blendAlpha(error.brighten(20), errorAlpha));

    final Color usedOnErrorContainer = onErrorContainer ??
        (estimateErrorBrightness(errorContainer ?? error) == Brightness.dark
            ? Colors.white.blendAlpha(
                errorContainer?.brighten(22) ?? error.brighten(20),
                errorContainerAlpha)
            : Colors.black.blendAlpha(
                errorContainer?.brighten(8) ?? error.brighten(20),
                errorContainerAlpha));

    return FlexSchemeOnColors(
      onPrimary: usedOnPrimary,
      onPrimaryContainer: usedOnPrimaryContainer,
      onSecondary: usedOnSecondary,
      onSecondaryContainer: usedOnSecondaryContainer,
      onTertiary: usedOnTertiary,
      onTertiaryContainer: usedOnTertiaryContainer,
      onSurface: usedOnSurface,
      onSurfaceVariant: usedOnSurfaceVariant,
      onInverseSurface: usedOnInverseSurface,
      onError: usedOnError,
      onErrorContainer: usedOnErrorContainer,
    );
  }

  /// Brightness estimation for error colors that includes fix to consider
  /// M2 spec for on M2 dark error color.
  static Brightness estimateErrorBrightness(Color color) {
    // The ThemeData.estimateBrightnessForColor returns dark on the M2
    // Material dark mode error colors, but M2 spec uses black onColor on it
    // so we should return light to get the correct on color for
    // materialDarkError.
    if (color == FlexColor.materialDarkError) return Brightness.light;
    if (color == FlexColor.materialDarkErrorHc) return Brightness.light;
    // Might as well do this as quick return too, estimateBrightnessForColor
    // returns same value for this color, but since we will be using this logic
    // for error colors we might as well use results for other hard coded color
    // values and not call ThemeData.estimateBrightnessForColor
    if (color == FlexColor.materialLightError) return Brightness.dark;
    if (color == FlexColor.materialLightErrorHc) return Brightness.dark;
    // For other error colors we estimate the brightness.
    return ThemeData.estimateBrightnessForColor(color);
  }

  /// Copy the object with one or more provided properties changed.
  FlexSchemeOnColors copyWith({
    Color? onPrimary,
    Color? onPrimaryContainer,
    Color? onSecondary,
    Color? onSecondaryContainer,
    Color? onTertiary,
    Color? onTertiaryContainer,
    Color? onSurface,
    Color? onSurfaceVariant,
    Color? onSurfaceDim,
    Color? onSurfaceBright,
    Color? onSurfaceContainerLowest,
    Color? onSurfaceContainerLow,
    Color? onSurfaceContainer,
    Color? onSurfaceContainerHigh,
    Color? onSurfaceContainerHighest,
    Color? onInverseSurface,
    Color? onError,
    Color? onErrorContainer,
    @Deprecated('This color was deprecated in FCS 8.0 because Flutter 3.22 '
        'deprecated the color. '
        'It no longer has any function in FCS v8 and will be removed in v9.')
    Color? onBackground,
  }) {
    return FlexSchemeOnColors(
      onPrimary: onPrimary ?? this.onPrimary,
      onPrimaryContainer: onPrimaryContainer ?? this.onPrimaryContainer,
      onSecondary: onSecondary ?? this.onSecondary,
      onSecondaryContainer: onSecondaryContainer ?? this.onSecondaryContainer,
      onTertiary: onTertiary ?? this.onTertiary,
      onTertiaryContainer: onTertiaryContainer ?? this.onTertiaryContainer,
      onSurface: onSurface ?? this.onSurface,
      onSurfaceVariant: onSurfaceVariant ?? this.onSurfaceVariant,
      onSurfaceDim: onSurfaceDim ?? this.onSurfaceDim,
      onSurfaceBright: onSurfaceBright ?? this.onSurfaceBright,
      onSurfaceContainerLowest:
          onSurfaceContainerLowest ?? this.onSurfaceContainerLowest,
      onSurfaceContainerLow:
          onSurfaceContainerLow ?? this.onSurfaceContainerLow,
      onSurfaceContainer: onSurfaceContainer ?? this.onSurfaceContainer,
      onSurfaceContainerHigh:
          onSurfaceContainerHigh ?? this.onSurfaceContainerHigh,
      onSurfaceContainerHighest:
          onSurfaceContainerHighest ?? this.onSurfaceContainerHighest,
      onInverseSurface: onInverseSurface ?? this.onInverseSurface,
      onError: onError ?? this.onError,
      onErrorContainer: onErrorContainer ?? this.onErrorContainer,
    );
  }

  /// Override the equality operator.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is FlexSchemeOnColors &&
        other.onPrimary == onPrimary &&
        other.onPrimaryContainer == onPrimaryContainer &&
        other.onSecondary == onSecondary &&
        other.onSecondaryContainer == onSecondaryContainer &&
        other.onTertiary == onTertiary &&
        other.onTertiaryContainer == onTertiaryContainer &&
        other.onSurface == onSurface &&
        other.onSurfaceVariant == onSurfaceVariant &&
        other.onSurfaceDim == onSurfaceDim &&
        other.onSurfaceBright == onSurfaceBright &&
        other.onSurfaceContainerLowest == onSurfaceContainerLowest &&
        other.onSurfaceContainerLow == onSurfaceContainerLow &&
        other.onSurfaceContainer == onSurfaceContainer &&
        other.onSurfaceContainerHigh == onSurfaceContainerHigh &&
        other.onSurfaceContainerHighest == onSurfaceContainerHighest &&
        other.onInverseSurface == onInverseSurface &&
        other.onError == onError &&
        other.onErrorContainer == onErrorContainer;
  }

  /// Override for hashcode. Using Darts object hash.
  @override
  int get hashCode => Object.hash(
        onPrimary,
        onPrimaryContainer,
        onSecondary,
        onSecondaryContainer,
        onTertiary,
        onTertiaryContainer,
        onSurface,
        onSurfaceVariant,
        onSurfaceDim,
        onSurfaceBright,
        onSurfaceContainerLowest,
        onSurfaceContainerLow,
        onSurfaceContainer,
        onSurfaceContainerHigh,
        onSurfaceContainerHighest,
        onInverseSurface,
        onError,
        onErrorContainer,
      );

  /// Flutter debug properties override, includes toString.
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('onPrimary', onPrimary));
    properties.add(ColorProperty('onPrimaryContainer', onPrimaryContainer));
    properties.add(ColorProperty('onSecondary', onSecondary));
    properties.add(ColorProperty('onSecondaryContainer', onSecondaryContainer));
    properties.add(ColorProperty('onTertiary', onTertiary));
    properties.add(ColorProperty('onTertiaryContainer', onTertiaryContainer));
    properties.add(ColorProperty('onSurface', onSurface));
    properties.add(ColorProperty('onSurfaceVariant', onSurfaceVariant));
    properties.add(ColorProperty('onSurfaceDim', onSurfaceDim));
    properties.add(ColorProperty('onSurfaceBright', onSurfaceBright));
    properties.add(
        ColorProperty('onSurfaceContainerLowest', onSurfaceContainerLowest));
    properties
        .add(ColorProperty('onSurfaceContainerLow', onSurfaceContainerLow));
    properties.add(ColorProperty('onSurfaceContainer', onSurfaceContainer));
    properties
        .add(ColorProperty('onSurfaceContainerHigh', onSurfaceContainerHigh));
    properties.add(
        ColorProperty('onSurfaceContainerHighest', onSurfaceContainerHighest));
    properties.add(ColorProperty('onInverseSurface', onInverseSurface));
    properties.add(ColorProperty('onError', onError));
    properties.add(ColorProperty('onErrorContainer', onErrorContainer));
  }
}
