import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'flex_color.dart';
import 'flex_constants.dart';
import 'flex_extensions.dart';

// ignore_for_file: comment_references

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
    required final this.primary,
    Color? primaryContainer,
    required final this.secondary,
    Color? secondaryContainer,
    Color? tertiary,
    Color? tertiaryContainer,
    final this.appBarColor,
    final this.error,
    final this.errorContainer,
    @Deprecated('Use primaryContainer instead. '
        'In FlexSchemeColor old primaryContainer built-in colors were moved to '
        'the primaryContainer color since their design fitted that role best. '
        'This property was deprecated after FlexColorScheme v4.2.0.')
        Color? primaryVariant,
    @Deprecated(
        'Use secondaryContainer, tertiary or tertiaryContainer instead. '
        'In FlexSchemeColor old secondaryVariant built-in colors were moved to '
        'the tertiary color since their design fitted that role best. '
        'This property was deprecated after FlexColorScheme v4.2.0.')
        Color? secondaryVariant,
  })  : _primaryContainer = primaryContainer,
        _secondaryContainer = secondaryContainer,
        _tertiary = tertiary,
        _tertiaryContainer = tertiaryContainer,
        _primaryVariant = primaryVariant,
        _secondaryVariant = secondaryVariant;

  /// The color displayed most frequently across your application's screens
  /// and components.
  final Color primary;

  // A private color used for elements needing less emphasis than [primary],
  // set via constructor init list.
  final Color? _primaryContainer;

  /// A color used for elements needing less emphasis than [primary].
  Color get primaryContainer => _primaryContainer ?? _primaryVariant ?? primary;

  /// An accent color that, when used sparingly, calls attention to parts
  /// of your app.
  final Color secondary;

  // A private color used for elements needing less emphasis than [secondary],
  // set via constructor initializer.
  final Color? _secondaryContainer;

  //  It is only used to keep the old mapping during dev to get old color on
  //  it in example app before we have defined it.
  /// A color used for elements needing less emphasis than [secondary].
  Color get secondaryContainer =>
      _secondaryContainer ?? _secondaryVariant ?? secondary;

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

  // A private darker version of primary color, set via constructor init list.
  // Used to support deprecated value as null with past defaults as fallback.
  final Color? _primaryVariant;

  /// A darker version of the primary color.
  ///
  /// In Flutter SDK before v 2.10 the `primaryVariant` color is only used
  /// by [SnackBar] button color in dark theme mode as a part of predefined
  /// widget behavior.
  /// If you provide a custom [SnackBarThemeData] where you define
  /// [SnackBarThemeData.actionTextColor] to [primary] or [secondary], this
  /// color property becomes a good property to use if you need a custom color
  /// for custom widgets accessible via your application's ThemeData, that is
  /// not used as default color by any built-in widgets.
  @Deprecated('Use primaryContainer instead. '
      'In FlexSchemeColor the new primaryContainer use old primaryVariant '
      'as fallback if un-assigned in custom FlexSchemeColor schemes. '
      'An old value for it in a custom scheme, may however not be a perfect '
      'for primaryContainer in Material 3 color design. '
      'This property was deprecated after FlexColorScheme v4.2.0.')
  Color get primaryVariant => _primaryVariant ?? _primaryContainer ?? primary;

  // A private color, typically a darker version of the secondary color, set via
  // constructor initializer. Used to support deprecated value as null with
  // past defaults as fallback.
  final Color? _secondaryVariant;

  /// Typically a darker version of the secondary color.
  ///
  /// In Flutter SDK the `secondaryVariant` color is not used by in any
  /// built-in widgets default themes or predefined widget behavior.
  /// It is an excellent property to use if you need a custom color for
  /// custom widgets accessible via your application's ThemeData, that is
  /// not used as default color by any built-in widgets.
  @Deprecated('Use secondaryContainer, tertiary or tertiaryContainer instead. '
      'In FlexSchemeColor old secondaryVariant built-in colors were moved to '
      'the tertiary color since their design fitted that role best. '
      'If you in custom old FlexSchemeColor scheme use secondaryVariant and '
      'have not assigned a value to the new property secondaryContainer, it '
      'will fallback via secondaryVariant to create similar looking scheme '
      'as before by using the old secondaryVariant on new secondaryContainer. '
      'Be aware though that it may not be a perfect fit for the design intent '
      'of the new secondaryContainer color property. '
      'This property was deprecated after FlexColorScheme v4.2.0.')
  Color get secondaryVariant => _secondaryVariant ?? _tertiary ?? secondary;

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
  factory FlexSchemeColor.from({
    required Color primary,
    Color? primaryContainer,
    Color? secondary,
    Color? secondaryContainer,
    Color? tertiary,
    Color? tertiaryContainer,
    Color? appBarColor,
    Color? error,
    Color? errorContainer,
    Brightness? brightness,
    @Deprecated('Use primaryContainer instead. '
        'In FlexSchemeColor the new primaryContainer use old primaryVariant '
        'as fallback if un-assigned in custom FlexSchemeColor schemes. '
        'An old value for it in a custom scheme, may however not be a perfect '
        'fit for primaryContainer in Material 3 color design. '
        'This property was deprecated after FlexColorScheme v4.2.0.')
        Color? primaryVariant,
    @Deprecated(
        'Use secondaryContainer, tertiary or tertiaryContainer instead. '
        'In FlexSchemeColor old secondaryVariant built-in colors were moved to '
        'the tertiary color since their design fitted that role best. '
        'If you in custom old FlexSchemeColor scheme use secondaryVariant and '
        'have not assigned a value to the new property secondaryContainer, it '
        'will fallback via secondaryVariant to create similar looking scheme '
        'as before by using the old secondaryVariant on new '
        'secondaryContainer. Be aware though that it may not be a perfect fit '
        'for the design intent of the new secondaryContainer color property. '
        'This property was deprecated after FlexColorScheme v4.2.0.')
        Color? secondaryVariant,
  }) {
    if (brightness == Brightness.light) {
      return FlexSchemeColor(
        primary: primary,
        primaryContainer: primaryContainer ?? primary.blend(Colors.white, 60),
        secondary: secondary ?? primary.darken().brighten(20),
        secondaryContainer: secondaryContainer ??
            secondary?.blend(Colors.white, 60) ??
            primary.darken().brighten(20).blend(Colors.white, 60),
        tertiary: tertiary ?? primary.brighten(15),
        tertiaryContainer: tertiaryContainer ??
            tertiary?.blend(Colors.white, 80) ??
            primary.brighten(15).lighten(20).blend(Colors.white, 60),
        appBarColor: appBarColor ??
            tertiary ??
            secondaryVariant ??
            primary.brighten(15).lighten(20).blend(Colors.white, 60),
        error: error ?? FlexColor.materialLightError,
        errorContainer: errorContainer ??
            FlexColor.lightErrorContainer(
                error ?? FlexColor.materialLightError),
      );
    } else if (brightness == Brightness.dark) {
      return FlexSchemeColor(
        primary: primary,
        primaryContainer: primaryContainer ?? primary.blend(Colors.black, 60),
        secondary: secondary ?? primary.darken().brighten(20),
        secondaryContainer: secondaryContainer ??
            secondary?.blend(Colors.black, 60) ??
            primary.darken().brighten(20).blend(Colors.black, 40),
        tertiary: tertiary ?? primary.brighten(15),
        tertiaryContainer: tertiaryContainer ??
            tertiary?.blend(Colors.black, 80) ??
            primary.brighten(15).darken(20).blend(Colors.black, 30),
        appBarColor: appBarColor ??
            tertiary ??
            secondaryVariant ??
            primary.brighten(15).darken(20).blend(Colors.black, 30),
        error: error ?? FlexColor.materialDarkError,
        errorContainer: errorContainer ??
            FlexColor.darkErrorContainer(error ?? FlexColor.materialDarkError),
      );
    } else {
      return FlexSchemeColor(
        primary: primary,
        primaryContainer: primaryContainer ??
            primaryVariant ??
            primary.darken(kDarkenPrimaryContainer),
        secondary: secondary ?? primary.darken(kDarkenSecondary),
        secondaryContainer: secondaryContainer ??
            secondary?.darken(kDarkenSecondaryContainerFromSecondary) ??
            primary.darken(kDarkenSecondaryContainer),
        tertiary: tertiary ??
            secondaryVariant ??
            primary.lighten(kDarkenPrimaryContainer),
        tertiaryContainer: tertiaryContainer ??
            tertiary?.lighten(kDarkenSecondaryContainer) ??
            primary
                .brighten(kDarkenSecondary * 2)
                .lighten(kDarkenSecondaryContainer),
        appBarColor: appBarColor ??
            tertiary ??
            secondaryVariant ??
            secondary?.lighten(kDarkenPrimaryContainer) ??
            primary.lighten(kDarkenPrimaryContainer),
        error: error,
        errorContainer: errorContainer,
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
    final bool swapColors = false,
    final Brightness? brightness,
  }) {
    assert(usedColors >= 1 && usedColors <= 6, 'usedColors must be 1 to 6.');

    // In the swap, tertiary is kept where it is, nothing to swap with.
    final FlexSchemeColor effectiveColors = swapColors
        ? colors.copyWith(
            primary: colors.secondary,
            primaryContainer: colors.secondaryContainer,
            secondary: colors.primary,
            secondaryContainer: colors.primaryContainer,
            primaryVariant: colors.secondaryVariant,
            secondaryVariant: colors.primaryVariant,
          )
        : colors;

    if (brightness == Brightness.light) {
      return effectiveColors.copyWith(
        primary: effectiveColors.primary,
        primaryContainer: usedColors > 2
            ? effectiveColors.primaryContainer
            : effectiveColors.primary.blend(Colors.white, 60),
        secondary: usedColors > 1
            ? effectiveColors.secondary
            : effectiveColors.primary.darken().brighten(20),
        secondaryContainer: usedColors > 3
            ? effectiveColors.secondaryContainer
            : usedColors > 1
                ? effectiveColors.secondary.blend(Colors.white, 60)
                : effectiveColors.primary
                    .darken()
                    .brighten(20)
                    .blend(Colors.white, 60),
        tertiary: usedColors > 4
            ? effectiveColors.tertiary
            : effectiveColors.primary.brighten(15),
        tertiaryContainer: usedColors > 5
            ? effectiveColors.tertiaryContainer
            : usedColors > 4
                ? effectiveColors.tertiary.blend(Colors.white, 80)
                : effectiveColors.primary
                    .brighten(15)
                    .lighten(20)
                    .blend(Colors.white, 60),
        // Computed default for the deprecated ColorScheme colors are kept as
        // in versions before version 5.
        primaryVariant: usedColors > 2
            ? effectiveColors.primaryVariant
            : effectiveColors.primary.darken(kDarkenPrimaryContainer),
        secondaryVariant: usedColors > 3
            ? effectiveColors.secondaryVariant
            : usedColors > 1
                ? effectiveColors.secondary
                    .darken(kDarkenSecondaryContainerFromSecondary)
                : effectiveColors.primary.darken(kDarkenSecondaryContainer),
        appBarColor: colors.appBarColor,
        error: colors.error ?? FlexColor.materialLightError,
        errorContainer: colors.errorContainer ??
            FlexColor.lightErrorContainer(
                colors.error ?? FlexColor.materialLightError),
      );
    } else if (brightness == Brightness.dark) {
      return effectiveColors.copyWith(
        primary: effectiveColors.primary,
        primaryContainer: usedColors > 2
            ? effectiveColors.primaryContainer
            : effectiveColors.primary.blend(Colors.black, 60),
        secondary: usedColors > 1
            ? effectiveColors.secondary
            : effectiveColors.primary.darken().brighten(20),
        secondaryContainer: usedColors > 3
            ? effectiveColors.secondaryContainer
            : usedColors > 1
                ? effectiveColors.secondary.blend(Colors.black, 60)
                : effectiveColors.primary
                    .darken()
                    .brighten(20)
                    .blend(Colors.black, 40),
        tertiary: usedColors > 4
            ? effectiveColors.tertiary
            : effectiveColors.primary.brighten(15),
        tertiaryContainer: usedColors > 5
            ? effectiveColors.tertiaryContainer
            : usedColors > 4
                ? effectiveColors.tertiary.blend(Colors.black, 80)
                : effectiveColors.primary
                    .brighten(15)
                    .darken(20)
                    .blend(Colors.black, 30),
        // Computed default for the deprecated ColorScheme colors are kept as
        // in versions before version 5.
        primaryVariant: usedColors > 2
            ? effectiveColors.primaryVariant
            : effectiveColors.primary.darken(kDarkenPrimaryContainer),
        secondaryVariant: usedColors > 3
            ? effectiveColors.secondaryVariant
            : usedColors > 1
                ? effectiveColors.secondary
                    .darken(kDarkenSecondaryContainerFromSecondary)
                : effectiveColors.primary.darken(kDarkenSecondaryContainer),
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
        primaryContainer: usedColors > 2
            ? effectiveColors.primaryContainer
            : effectiveColors.primary.darken(kDarkenPrimaryContainer),
        secondary: usedColors > 1
            ? effectiveColors.secondary
            : effectiveColors.primary.darken(kDarkenSecondary),
        secondaryContainer: usedColors > 3
            ? effectiveColors.secondaryContainer
            : usedColors > 1
                ? effectiveColors.secondary
                    .darken(kDarkenSecondaryContainerFromSecondary)
                : effectiveColors.primary.darken(kDarkenSecondaryContainer),
        tertiary: usedColors > 4
            ? effectiveColors.tertiary
            : effectiveColors.primary.lighten(kDarkenPrimaryContainer),
        tertiaryContainer: usedColors > 5
            ? effectiveColors.tertiaryContainer
            : usedColors > 4
                ? effectiveColors.tertiary.lighten(kDarkenSecondaryContainer)
                : effectiveColors.primary
                    .brighten(kDarkenSecondary * 2)
                    .lighten(kDarkenSecondaryContainer),
        primaryVariant: usedColors > 2
            ? effectiveColors.primaryVariant
            : effectiveColors.primary.darken(kDarkenPrimaryContainer),
        secondaryVariant: usedColors > 3
            ? effectiveColors.secondaryVariant
            : usedColors > 1
                ? effectiveColors.secondary
                    .darken(kDarkenSecondaryContainerFromSecondary)
                : effectiveColors.primary.darken(kDarkenSecondaryContainer),
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
  /// In a Material 3 dark theme, the primary should be lighter than dark
  /// container. Set [swapColors] to true, to use the main color as container
  /// color and container as main color, when computing the theme with toDark.
  FlexSchemeColor toDark([int whiteBlend = 35, bool swapColors = false]) {
    if (swapColors) {
      return FlexSchemeColor.from(
        primary: primaryContainer.blend(Colors.white, whiteBlend),
        primaryContainer: primary.blend(Colors.white, whiteBlend),
        secondary: secondaryContainer.blend(Colors.white, whiteBlend),
        secondaryContainer: secondary.blend(Colors.white, whiteBlend),
        tertiary: tertiaryContainer.blend(Colors.white, whiteBlend),
        tertiaryContainer: tertiary.blend(Colors.white, whiteBlend),
        appBarColor: appBarColor?.blend(Colors.white, whiteBlend),
        error: error?.blend(Colors.white, whiteBlend),
        errorContainer: errorContainer?.blend(Colors.white, whiteBlend),
      );
    } else {
      return FlexSchemeColor.from(
        primary: primary.blend(Colors.white, whiteBlend),
        primaryContainer: primaryContainer.blend(Colors.white, whiteBlend),
        secondary: secondary.blend(Colors.white, whiteBlend),
        secondaryContainer: secondaryContainer.blend(Colors.white, whiteBlend),
        tertiary: tertiary.blend(Colors.white, whiteBlend),
        tertiaryContainer: tertiaryContainer.blend(Colors.white, whiteBlend),
        appBarColor: appBarColor?.blend(Colors.white, whiteBlend),
        error: error?.blend(Colors.white, whiteBlend),
        errorContainer: errorContainer?.blend(Colors.white, whiteBlend),
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
      secondary: secondary,
      secondaryContainer: secondaryContainer,
      tertiary: tertiary,
      tertiaryContainer: tertiaryContainer,
      appBarColor: appBarColor,
    );
  }

  /// Copy the object with one or more provided properties changed.
  FlexSchemeColor copyWith({
    final Color? primary,
    final Color? primaryContainer,
    final Color? secondary,
    final Color? secondaryContainer,
    final Color? tertiary,
    final Color? tertiaryContainer,
    final Color? appBarColor,
    final Color? error,
    final Color? errorContainer,
    @Deprecated('Use primary or primaryContainer instead. '
        'This feature was deprecated after v4.2.0.')
        Color? primaryVariant,
    @Deprecated('Use secondary or secondaryContainer instead. '
        'This feature was deprecated after v4.2.0.')
        Color? secondaryVariant,
  }) {
    return FlexSchemeColor(
      primary: primary ?? this.primary,
      primaryContainer: primaryContainer ?? this.primaryContainer,
      secondary: secondary ?? this.secondary,
      secondaryContainer: secondaryContainer ?? this.secondaryContainer,
      tertiary: tertiary ?? this.tertiary,
      tertiaryContainer: tertiaryContainer ?? this.tertiaryContainer,
      appBarColor: appBarColor ?? this.appBarColor,
      error: error ?? this.error,
      errorContainer: errorContainer ?? this.errorContainer,
      primaryVariant: primaryVariant ?? this.primaryVariant,
      secondaryVariant: secondaryVariant ?? this.secondaryVariant,
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
        other.secondary == secondary &&
        other.secondaryContainer == secondaryContainer &&
        other.tertiary == tertiary &&
        other.tertiaryContainer == tertiaryContainer &&
        other.appBarColor == appBarColor &&
        other.error == error &&
        other.errorContainer == errorContainer &&
        other.primaryVariant == primaryVariant &&
        other.secondaryVariant == secondaryVariant;
  }

  /// Override for hashcode, dart.ui Jenkins based.
  @override
  int get hashCode => hashValues(
        primary,
        primaryContainer,
        secondary,
        secondaryContainer,
        tertiary,
        tertiaryContainer,
        appBarColor,
        error,
        errorContainer,
        primaryVariant,
        secondaryVariant,
      );

  /// Flutter debug properties override, includes toString.
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('primary', primary));
    properties.add(ColorProperty('primaryContainer', primaryContainer));
    properties.add(ColorProperty('secondary', secondary));
    properties.add(ColorProperty('secondaryContainer', secondaryContainer));
    properties.add(ColorProperty('tertiary', tertiary));
    properties.add(ColorProperty('tertiaryContainer', tertiaryContainer));
    properties.add(ColorProperty('appBarColor', appBarColor));
    properties.add(ColorProperty('error', error));
    properties.add(ColorProperty('errorContainer', errorContainer));
    properties.add(ColorProperty('primaryVariant', primaryVariant));
    properties.add(ColorProperty('secondaryVariant', secondaryVariant));
  }
}
