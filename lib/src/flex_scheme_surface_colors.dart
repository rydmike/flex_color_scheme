import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'flex_alpha_values.dart';
import 'flex_color.dart' show FlexColor;
import 'flex_color_scheme.dart' show FlexColorScheme;
import 'flex_color_scheme.dart' show FlexScaffoldBaseColor;
import 'flex_extensions.dart';
import 'flex_scheme_color.dart' show FlexSchemeColor;
import 'flex_surface_mode.dart' show FlexSurfaceMode;

/// Immutable data class used to make the six different surface colors in a
/// [FlexColorScheme].
///
/// [FlexSchemeSurfaceColors] is used primarily via the
/// [FlexSchemeSurfaceColors.blend] factory.
///
/// Included colors are [surface] and [inverseSurface] plus
/// plus blended surface colors
/// for [scaffoldBackground] and [dialogBackground], which are not a part
/// of Flutter's standard [ColorScheme].
///
/// This class, and its factory are only used by the
/// [FlexColorScheme.light] and [FlexColorScheme.dark] factories. You normally
/// do not have to use it, unless you are making a customized version
/// of [FlexColorScheme] or similar feature, or if you want to, you can use it
/// for getting surface colors for a standard [ColorScheme].
@immutable
class FlexSchemeSurfaceColors with Diagnosticable {
  /// Default constructor. [FlexSchemeSurfaceColors] is usually created with
  /// the [FlexSchemeSurfaceColors.blend] factory.
  const FlexSchemeSurfaceColors({
    required this.surface,
    Color? surfaceDim,
    Color? surfaceBright,
    Color? surfaceContainerLowest,
    Color? surfaceContainerLow,
    Color? surfaceContainer,
    Color? surfaceContainerHigh,
    Color? surfaceContainerHighest,
    Color? inverseSurface,
    required this.scaffoldBackground,
    required this.dialogBackground,
    @Deprecated('This color was deprecated in FCS 8.0 because Flutter 3.22 '
        'deprecated the color. '
        'It no longer has any function in FCS v8 and will be removed in v9.')
    this.surfaceVariant,
    @Deprecated('This color was deprecated in FCS 8.0 because Flutter 3.22 '
        'deprecated the color. '
        'It no longer has any function in FCS v8 and will be removed in v9.')
    this.background,
  })  : _surfaceDim = surfaceDim,
        _surfaceBright = surfaceBright,
        _surfaceContainerLowest = surfaceContainerLowest,
        _surfaceContainerLow = surfaceContainerLow,
        _surfaceContainer = surfaceContainer,
        _surfaceContainerHigh = surfaceContainerHigh,
        _surfaceContainerHighest = surfaceContainerHighest,
        _inverseSurface = inverseSurface;

  /// The background color for widgets like [Card] and [Dialog].
  ///
  /// The default background color of [Material] of type card.
  final Color surface;

  /// A color variant of [surface] that can be used for differentiation
  /// against a component using [surface]. Local variable with initializer used
  /// in order to not break past const interface, with past required props.
  final Color? _surfaceDim;

  /// A color variant of [surface] that can be used for differentiation against
  /// a component using [surface]. Defaults to [surface] as fallback.
  Color get surfaceDim => _surfaceDim ?? surface;

  /// A color variant of [surface] that can be used for differentiation
  /// against a component using [surface]. Local variable with initializer used
  /// in order to not break past const interface, with past required props.
  final Color? _surfaceBright;

  /// A color variant of [surface] that can be used for differentiation against
  /// a component using [surface]. Defaults to [surface] as fallback.
  Color get surfaceBright => _surfaceBright ?? surface;

  /// A color variant of [surface] that can be used for differentiation
  /// against a component using [surface]. Local variable with initializer used
  /// in order to not break past const interface, with past required props.
  final Color? _surfaceContainerLowest;

  /// A color variant of [surface] that can be used for differentiation against
  /// a component using [surface]. Defaults to [surface] as fallback.
  Color get surfaceContainerLowest => _surfaceContainerLowest ?? surface;

  /// A color variant of [surface] that can be used for differentiation
  /// against a component using [surface]. Local variable with initializer used
  /// in order to not break past const interface, with past required props.
  final Color? _surfaceContainerLow;

  /// A color variant of [surface] that can be used for differentiation against
  /// a component using [surface]. Defaults to [surface] as fallback.
  Color get surfaceContainerLow => _surfaceContainerLow ?? surface;

  /// A color variant of [surface] that can be used for differentiation
  /// against a component using [surface]. Local variable with initializer used
  /// in order to not break past const interface, with past required props.
  final Color? _surfaceContainer;

  /// A color variant of [surface] that can be used for differentiation against
  /// a component using [surface]. Defaults to [surface] as fallback.
  Color get surfaceContainer => _surfaceContainer ?? surface;

  /// A color variant of [surface] that can be used for differentiation
  /// against a component using [surface]. Local variable with initializer used
  /// in order to not break past const interface, with past required props.
  final Color? _surfaceContainerHigh;

  /// A color variant of [surface] that can be used for differentiation against
  /// a component using [surface]. Defaults to [surface] as fallback.
  Color get surfaceContainerHigh => _surfaceContainerHigh ?? surface;

  /// A color variant of [surface] that can be used for differentiation
  /// against a component using [surface]. Local variable with initializer used
  /// in order to not break past const interface, with past required props.
  final Color? _surfaceContainerHighest;

  /// A color variant of [surface] that can be used for differentiation against
  /// a component using [surface]. Defaults to [surface] as fallback.
  Color get surfaceContainerHighest => _surfaceContainerHighest ?? surface;

  /// A surface color used for displaying the reverse of what’s seen in the
  /// surrounding UI, for example in a SnackBar to bring attention to
  /// an alert. Local variable with initializer used in order to not break
  /// past const interface, with past required props.
  final Color? _inverseSurface;

  /// A surface color used for displaying the reverse of what’s seen in the
  /// surrounding UI, for example in a SnackBar to bring attention to
  /// an alert.  Defaults to [surface] as fallback.
  Color get inverseSurface => _inverseSurface ?? surface;

  /// The color of dialog background.
  ///
  /// Typically same as the surface color.
  final Color dialogBackground;

  /// The color of the [Scaffold] background.
  final Color scaffoldBackground;

  /// A color variant of [surface] that can be used for differentiation against
  /// a component using [surface]. Defaults to [surface] as fallback.
  @Deprecated('This color was deprecated in FCS 8.0 because Flutter 3.22 '
      'deprecated the color. '
      'It no longer has any function in FCS v8 and will be removed in v9.')
  final Color? surfaceVariant;

  /// A color that typically appears behind scrollable content.
  ///
  /// The default background color of [Material] of type canvas.
  @Deprecated('This color was deprecated in FCS 8.0 because Flutter 3.22 '
      'deprecated the color. '
      'It no longer has any function in FCS v8 and will be removed in v9.')
  final Color? background;

  /// Create nuanced surface colors using pre-defined behavior via enum
  /// [FlexSurfaceMode] property `surfaceMode` or make totally custom color
  /// blended surfaces.
  ///
  /// This kind of surface branding is based on the Material-2 guide found
  /// under "Accessibility and contrast"
  /// https://material.io/design/color/dark-theme.html#properties
  /// for branded surfaces.
  ///
  /// The [brightness] controls if we are creating surface colors for light or
  /// dark surfaces.
  ///
  /// The surface colors returned by this factory can also be used to make
  /// branded surface colors for Flutter's standard [ColorScheme], it does
  /// not have to be used exclusively by [FlexColorScheme].
  // ignore: sort_constructors_first
  factory FlexSchemeSurfaceColors.blend({
    /// Controls if we create surface colors for light or dark surfaces.
    final Brightness brightness = Brightness.light,

    /// The used surface mode to create different surface color blends.
    ///
    /// Defaults to highBackground.
    final FlexSurfaceMode surfaceMode =
        FlexSurfaceMode.highBackgroundLowScaffold,

    /// The the blend level strength used for the mode.
    final int blendLevel = 0,

    /// An int divisor used to reduce blend strength.
    ///
    /// This was used as a divisor for surfaceVariant color in versions
    /// before V8, but since surfaceVariant color is removed it is no longer
    /// used internally. The default value 1 is always used. Might deprecate
    /// this property later.
    final int surfaceVariantBlendDivide = 1,

    /// The colors used to blend into surfaces when using `surfaceMode` mode
    /// based styles and modes.
    ///
    /// If null, default material light or dark scheme colors will be used as
    /// fallback, depending on if we are making light or dark surfaces.
    ///
    /// If a blend color for a surface is provided in `blendColors`, that color
    /// color always overrides used color from `schemeColor` selected based on
    /// `surfaceMode`.
    final FlexSchemeColor? schemeColors,

    /// Custom colors to be blended into each surface color.
    ///
    /// If provided, these colors will be blended into each equivalent surface
    /// color.
    ///
    /// If it is null, then `schemeColors.primary` will be assigned to all
    /// surfaces.
    final FlexSchemeSurfaceColors? blendColors,

    /// The surface colors that we will mix the blend colors into.
    ///
    /// If null, then Material default surface colors will be used for all
    /// surfaces, that we then mix in the `blendColors` into, unless the
    /// `surfaceMode` defines surface starting colors otherwise.
    final FlexSchemeSurfaceColors? surfaceColors,

    /// The base color for the scaffold background.
    final FlexScaffoldBaseColor? scaffoldBaseColor,

    /// Flag indicating if surface default starting colors are for
    /// Material-3 or legacy Material-2.
    final bool useMaterial3 = true,
  }) {
    assert(
        blendLevel >= 0 && blendLevel <= 40,
        'Only blend levels from 0 to 40 '
        'are allowed. Very high alpha blend levels may not produce results '
        'that are visually very appealing or useful.');
    int usedBlendLevel = blendLevel;
    // If above happens in none debug mode, use 0, no blends.
    if (blendLevel < 0 || blendLevel > 40) usedBlendLevel = 0;

    final bool isLight = brightness == Brightness.light;

    // We get scheme default blend in colors via brightness and Material
    // default colors for the theme mode, if it was not provided. It is
    // typically provided when making branded surfaces, but Material default
    // colors are used as fallback colors.
    final FlexSchemeColor scheme = schemeColors ??
        (isLight ? FlexColor.material.light : FlexColor.material.dark);
    // The scaffold base Color, if null use default.
    final FlexScaffoldBaseColor scaffoldBase = scaffoldBaseColor ??
        (useMaterial3
            ? FlexScaffoldBaseColor.surfaceContainerLowest
            : FlexScaffoldBaseColor.surface);

    // The color that should be blended into each surface, defaults to primary
    // color for all surfaces.
    FlexSchemeSurfaceColors blendColor = blendColors ??
        FlexSchemeSurfaceColors(
          surface: scheme.primary,
          surfaceDim: scheme.primary,
          surfaceBright: scheme.primary,
          surfaceContainerLowest: scheme.primary,
          surfaceContainerLow: scheme.primary,
          surfaceContainer: scheme.primary,
          surfaceContainerHigh: scheme.primary,
          surfaceContainerHighest: scheme.primary,
          inverseSurface: scheme.primary,
          dialogBackground: scheme.primary,
          scaffoldBackground: scheme.primary,
        );
    // Set dialog blend colors to secondary variant color for modes using it.
    if (surfaceMode == FlexSurfaceMode.levelSurfacesLowScaffoldVariantDialog ||
        surfaceMode == FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog) {
      blendColor = blendColor.copyWith(dialogBackground: scheme.tertiary);
    }
    // We get surface starting default colors via brightness and Material
    // default colors if it was not provided. It is normally provided when
    // making branded surfaces, but Material default colors are used as
    // fallback colors.
    final FlexSchemeSurfaceColors surface = surfaceColors ??
        (isLight
            ? FlexSchemeSurfaceColors(
                surface: useMaterial3
                    ? FlexColor.lightFlexSurface
                    : FlexColor.materialLightSurface,
                surfaceDim: FlexColor.lightFlexSurfaceDim,
                surfaceBright: FlexColor.lightFlexSurfaceBright,
                surfaceContainerLowest:
                    FlexColor.lightFlexSurfaceContainerLowest,
                surfaceContainerLow: FlexColor.lightFlexSurfaceContainerLow,
                surfaceContainer: FlexColor.lightFlexSurfaceContainer,
                surfaceContainerHigh: FlexColor.lightFlexSurfaceContainerHigh,
                surfaceContainerHighest:
                    FlexColor.lightFlexSurfaceContainerHighest,
                inverseSurface: useMaterial3
                    ? FlexColor.lightFlexInverseSurface
                    : FlexColor.materialDarkSurface,
                scaffoldBackground: scaffoldBase.color(
                  null,
                  brightness: brightness,
                  useMaterial3: useMaterial3,
                ),
                dialogBackground: useMaterial3
                    ? FlexColor.lightFlexSurfaceContainerHigh
                    : FlexColor.materialLightSurface,
              )
            : FlexSchemeSurfaceColors(
                surface: useMaterial3
                    ? FlexColor.darkFlexSurface
                    : FlexColor.materialDarkSurface,
                surfaceDim: FlexColor.darkFlexSurfaceDim,
                surfaceBright: FlexColor.darkFlexSurfaceBright,
                surfaceContainerLowest:
                    FlexColor.darkFlexSurfaceContainerLowest,
                surfaceContainerLow: FlexColor.darkFlexSurfaceContainerLow,
                surfaceContainer: FlexColor.darkFlexSurfaceContainer,
                surfaceContainerHigh: FlexColor.darkFlexSurfaceContainerHigh,
                surfaceContainerHighest:
                    FlexColor.darkFlexSurfaceContainerHighest,
                inverseSurface: useMaterial3
                    ? FlexColor.darkFlexInverseSurface
                    : FlexColor.materialLightSurface,
                scaffoldBackground: scaffoldBase.color(
                  null,
                  brightness: brightness,
                  useMaterial3: useMaterial3,
                ),
                dialogBackground: useMaterial3
                    ? FlexColor.darkFlexSurfaceContainerHigh
                    : FlexColor.materialDarkSurface,
              ));

    /// Get alpha blend values corresponding to used mode, level and brightness.
    final FlexAlphaValues alphaValue =
        FlexAlphaValues.getAlphas(surfaceMode, usedBlendLevel);
    // Return the computed and resulting surface colors.
    return FlexSchemeSurfaceColors(
      surface: surface.surface.blendAlpha(blendColor.surface,
          alphaValue.surfaceAlpha ~/ surfaceVariantBlendDivide),
      surfaceDim: surface.surfaceDim.blendAlpha(blendColor.surfaceDim,
          alphaValue.surfaceAlpha ~/ surfaceVariantBlendDivide),
      surfaceBright: surface.surfaceBright.blendAlpha(blendColor.surfaceBright,
          alphaValue.surfaceAlpha ~/ surfaceVariantBlendDivide),
      surfaceContainerLowest: surface.surfaceContainerLowest.blendAlpha(
          blendColor.surfaceContainerLowest,
          alphaValue.surfaceAlpha ~/ surfaceVariantBlendDivide),
      surfaceContainerLow: surface.surfaceContainerLow.blendAlpha(
          blendColor.surfaceContainerLow,
          alphaValue.surfaceAlpha ~/ surfaceVariantBlendDivide),
      surfaceContainer: surface.surfaceContainer.blendAlpha(
          blendColor.surfaceContainer,
          alphaValue.surfaceAlpha ~/ surfaceVariantBlendDivide),
      surfaceContainerHigh: surface.surfaceContainerHigh.blendAlpha(
          blendColor.surfaceContainerHigh,
          alphaValue.surfaceAlpha ~/ surfaceVariantBlendDivide),
      surfaceContainerHighest: surface.surfaceContainerHighest.blendAlpha(
          blendColor.surfaceContainerHighest,
          alphaValue.surfaceAlpha ~/ surfaceVariantBlendDivide),
      inverseSurface: surface.inverseSurface.blendAlpha(
          blendColor.inverseSurface,
          alphaValue.inverseSurfaceAlpha ~/ surfaceVariantBlendDivide),
      scaffoldBackground: surface.scaffoldBackground.blendAlpha(
          blendColor.scaffoldBackground,
          alphaValue.scaffoldAlpha ~/ surfaceVariantBlendDivide),
      dialogBackground: surface.dialogBackground.blendAlpha(
          blendColor.dialogBackground,
          alphaValue.dialogAlpha ~/ surfaceVariantBlendDivide),
    );
  }

  /// Copy the object with one or more provided properties changed.
  FlexSchemeSurfaceColors copyWith({
    Color? surface,
    Color? surfaceDim,
    Color? surfaceBright,
    Color? surfaceContainerLowest,
    Color? surfaceContainerLow,
    Color? surfaceContainer,
    Color? surfaceContainerHigh,
    Color? surfaceContainerHighest,
    Color? inverseSurface,
    Color? scaffoldBackground,
    Color? dialogBackground,
    @Deprecated('This color was deprecated in FCS 8.0 because Flutter 3.22 '
        'deprecated the color. '
        'It no longer has any function in FCS v8 and will be removed in v9.')
    Color? surfaceVariant,
    @Deprecated('This color was deprecated in FCS 8.0 because Flutter 3.22 '
        'deprecated the color. '
        'It no longer has any function in FCS v8 and will be removed in v9.')
    Color? background,
  }) {
    return FlexSchemeSurfaceColors(
      surface: surface ?? this.surface,
      surfaceDim: surfaceDim ?? this.surfaceDim,
      surfaceBright: surfaceBright ?? this.surfaceBright,
      surfaceContainerLowest:
          surfaceContainerLowest ?? this.surfaceContainerLowest,
      surfaceContainerLow: surfaceContainerLow ?? this.surfaceContainerLow,
      surfaceContainer: surfaceContainer ?? this.surfaceContainer,
      surfaceContainerHigh: surfaceContainerHigh ?? this.surfaceContainerHigh,
      surfaceContainerHighest:
          surfaceContainerHighest ?? this.surfaceContainerHighest,
      inverseSurface: inverseSurface ?? this.inverseSurface,
      scaffoldBackground: scaffoldBackground ?? this.scaffoldBackground,
      dialogBackground: dialogBackground ?? this.dialogBackground,
    );
  }

  /// Override the equality operator.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is FlexSchemeSurfaceColors &&
        other.surface == surface &&
        other.surfaceDim == surfaceDim &&
        other.surfaceBright == surfaceBright &&
        other.surfaceContainerLowest == surfaceContainerLowest &&
        other.surfaceContainerLow == surfaceContainerLow &&
        other.surfaceContainer == surfaceContainer &&
        other.surfaceContainerHigh == surfaceContainerHigh &&
        other.surfaceContainerHighest == surfaceContainerHighest &&
        other.inverseSurface == inverseSurface &&
        other.scaffoldBackground == scaffoldBackground &&
        other.dialogBackground == dialogBackground;
  }

  /// Override for hashcode, dart.ui Jenkins based.
  @override
  int get hashCode => Object.hash(
        surface,
        surfaceDim,
        surfaceBright,
        surfaceContainerLowest,
        surfaceContainerLow,
        surfaceContainer,
        surfaceContainerHigh,
        surfaceContainerHighest,
        inverseSurface,
        scaffoldBackground,
        dialogBackground,
      );

  /// Flutter debug properties override, includes toString.
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('surface', surface));
    properties.add(ColorProperty('surfaceDim', surfaceDim));
    properties.add(ColorProperty('surfaceBright', surfaceBright));
    properties
        .add(ColorProperty('surfaceContainerLowest', surfaceContainerLowest));
    properties.add(ColorProperty('surfaceContainerLow', surfaceContainerLow));
    properties.add(ColorProperty('surfaceContainer', surfaceContainer));
    properties.add(ColorProperty('surfaceContainerHigh', surfaceContainerHigh));
    properties
        .add(ColorProperty('surfaceContainerHighest', surfaceContainerHighest));
    properties.add(ColorProperty('inverseSurface', inverseSurface));
    properties.add(ColorProperty('scaffoldBackground', scaffoldBackground));
    properties.add(ColorProperty('dialogBackground', dialogBackground));
  }
}
