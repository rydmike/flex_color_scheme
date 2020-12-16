import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

import 'flex_color.dart';
import 'flex_extensions.dart';

/// The percentage amount the primary variant color is darkened from the
/// primary color when primary variant color is not given.
const int kDarkenPrimaryVariant = 10;

/// The percentage amount the secondary color is darkened from the
/// primary color when secondary color is not given.
const int kDarkenSecondary = 5;

/// The percentage amount the secondary variant color is darkened from the
/// secondary color, when secondary variant color is not given, but the
/// secondary color is given.
const int kDarkenSecondaryVariantFromSecondary = 10;

/// The percentage amount the secondary variant color is darkened from the
/// primary color, when secondary variant color and secondary color are not
/// given.
const int kDarkenSecondaryVariant = 14;

// Primary Color blend percentage values for light theme.
const int _kLightBlendSurfaceLight = 0;
const int _kLightBlendSurfaceMedium = 1;
const int _kLightBlendSurfaceStrong = 2;
const int _kLightBlendSurfaceHeavy = 3;

const int _kLightBlendBackgroundLight = 2;
const int _kLightBlendBackgroundMedium = 4;
const int _kLightBlendBackgroundStrong = 6;
const int _kLightBlendBackgroundHeavy = 8;

const int _kLightBlendScaffoldHeavy = 1;

// Primary Color blend percentage values for dark theme.
const int _kDarkBlendSurfaceLight = 2;
const int _kDarkBlendSurfaceMedium = 4;
const int _kDarkBlendSurfaceStrong = 6;
const int _kDarkBlendSurfaceHeavy = 8;

const int _kDarkBlendBackgroundLight = 5;
const int _kDarkBlendBackgroundMedium = 8;
const int _kDarkBlendBackgroundStrong = 11;
const int _kDarkBlendBackgroundHeavy = 14;

const int _kDarkBlendScaffoldHeavy = 2;

/// Enum for using pre-defined surface types in [FlexColorScheme] based themes.
enum FlexSurface {
  /// Use Material design default light and dark surface and background colors.
  material,

  /// Use a light blend of primary color in surface and background colors.
  light,

  /// Use a medium blend of primary color in surface and background colors.
  medium,

  /// Use a strong blend of primary color in surface and background colors.
  strong,

  /// Use a heavy blend of primary color in surface and background colors.
  heavy,

  /// Use your own custom surface surface and background colors.
  custom,
}

/// Enum to select the used app bar style in [FlexColorScheme] based themes.
enum FlexAppBarStyle {
  /// Use the theme primary color as app bar background theme color.
  ///
  /// This is the default for light themes.
  primary,

  /// Use the material surface color, just as in a [ThemeData.from] theme, the
  /// surface color is used as background color for the app bar theme.
  /// The is the default for dark themes.
  ///
  /// For a dark theme this choice will result in a near black app bar. If this
  /// setting is used in a light theme, it will result in a white app bar as
  /// the standard material surface color for light theme is white.
  material,

  /// Uses active surface color as app bar background theme color, including
  /// any primary blend it may have.
  surface,

  /// Use active background color as app bar background theme color, including
  /// any primary blend it may have.
  background,

  /// Use the color defined by the separate [FlexColorScheme.appBarBackground]
  /// color. The built in themes use the [FlexColorScheme.secondaryVariant]
  /// color as the color assigned to [FlexColorScheme.appBarBackground]. Custom
  /// themes can assign any color to their `appBarBackground` color.
  custom,
}

/// Used to build Flutter [ThemeData] objects, based on Flutter [ColorScheme]
/// concept. This implementation uses an enhanced and opinionated version of
/// creating [ThemeData] using the [ColorScheme] idea.
///
/// Flutter's [ThemeData.from] is a good starting point for [ColorScheme] based
/// themes. Currently it has a some gaps leaving a few properties in the theme
/// to their defaults from the standard [Theme] factory constructor, those
/// default values will end up not matching the used [ColorScheme], especially
/// in dark mode themes.
///
/// The [FlexColorScheme] fixes the gaps and makes it easy to create complete
/// themes using the ColorScheme concept. [FlexColorScheme] does not rely
/// on [ThemeData.from] a [ColorScheme] for its implementation, it uses the
/// [Theme] factory directly under the hood to create the [ThemeData] object
/// from [FlexColorScheme] and a [ColorScheme] that it uses to return a custom
/// slightly opinionated theme with the [toTheme] method.
///
/// [FlexColorScheme] also makes it easier to make a theme where the app bar
/// theme background color is not tied to primary color in light theme mode or
/// to surface color in dark theme mode.
///
/// Additionally [FlexColorScheme] makes it easy to optionally create themes
/// that use so called branded surfaces, that blend in a varying degree of the
/// primary color into surfaces amd backgrounds using four pre-defined tuned
/// levels of blend strength. Branded surface are also described in the
/// Material design guide but Flutter offers no out of the box help to
/// make such themes. With [FlexColorScheme] you can use a varying degree of
/// surface and background branding level for any theme you make, both in light
/// and dark themes.
@immutable
class FlexColorScheme {
  /// Default constructor that requires its key color properties in
  /// order to make a purposefully designed theme.
  ///
  /// It can be tedious to define nice themes directly with this default
  /// constructor. [FlexColorScheme] is primarily intended to be used with its
  /// two factory constructors [FlexColorScheme.light] and
  /// [FlexColorScheme.dark] that can create nice themes using defaults plus
  /// computed color values, from only a defined primary color, if so desired.
  ///
  /// The factories also contain additional properties that can be used to
  /// create branded surface colors, toggle the app bar theme between a few
  /// styles and to make dark themes that uses true black background and
  /// surfaces.
  const FlexColorScheme({
    @required this.brightness,
    @required this.primary,
    @required this.primaryVariant,
    @required this.secondary,
    @required this.secondaryVariant,
    this.surface,
    this.background,
    this.error,
    this.scaffoldBackground,
    this.appBarBackground,
    this.onPrimary,
    this.onSecondary,
    this.onSurface,
    this.onBackground,
    this.onError,
    this.tooltipsMatchBackground = false,
    this.visualDensity,
    this.fontFamily,
    this.platform,
    this.typography,
  })  : assert(brightness != null, 'Brightness may not be null.'),
        assert(primary != null, 'Primary color may not be null.'),
        assert(
            primaryVariant != null, 'Primary variant color may not be null.'),
        assert(secondary != null, 'Secondary color may not be null.'),
        assert(secondaryVariant != null,
            'Secondary variant color may not be null.'),
        assert(tooltipsMatchBackground != null,
            'Tooltips match background color may not be null.');

  /// Creates a light [FlexColorScheme] based on the given [FlexSchemeColor].
  ///
  /// The only required property is [FlexSchemeColor], which can be
  /// created with just one color property using the factory
  /// [FlexSchemeColor.from], more detailed color themes can also be defined.
  factory FlexColorScheme.light({
    /// The [FlexSchemeColor] that we will create the light [FlexColorScheme]
    /// from. You can use predefined [FlexSchemeColor] from
    /// [FlexColor.schemesWithCustom] or define your own colors with
    /// [FlexSchemeColor] or [FlexSchemeColor.from].
    @required FlexSchemeColor colors,

    /// Defines which surface style to use.
    ///
    /// Defaults to [FlexSurface.material] which results in Flutter
    /// standard [ColorScheme.light] surface colors, which follows the
    /// default color scheme in the Material Design
    /// guide for light theme found here:
    /// https://material.io/design/color/the-color-system.html#color-theme-creation
    ///
    /// If values for [surface], [background] ot [scaffoldBackground] are
    /// provided, they are used instead of values that would be assigned based
    /// on the selected and provided [FlexSurface] style.
    FlexSurface surfaceStyle = FlexSurface.material,

    /// The number of the four main scheme colors to be used of the ones
    /// passed in via the required colors [FlexSchemeColor] property.
    ///
    /// This is a convenience property that allows you to vary which colors to
    /// use of the primary, secondary and variant colors included in `colors` in
    /// [FlexSchemeColor]. The integer number corresponds to using:
    /// 1 = Only the primary color
    /// 2 = Primary + Secondary colors
    /// 3 = Primary + Primary variant + Secondary colors
    /// 4 = Primary + Primary variant + Secondary + Secondary variant colors
    /// By default the value is 4 and all main scheme colors in
    /// [FlexSchemeColor] are used.
    ///
    /// When the value is 1, the result is the same as if we would have
    /// created the colors with [FlexSchemeColor.from] by only giving it the
    /// required primary color. With 2, it is equivalent to as if we would have
    /// given it only the primary and secondary colors, and so on.
    /// This property makes it possible to simulate and change the resulting
    /// [FlexColorScheme] to as if you would have specified 1, 2, 3 or 4 of
    /// the colors. If your used [FlexColorScheme] `colors` was actually created
    /// with [FlexSchemeColor.from] with only the primary color defined, then
    /// changing the value from 4 to 3, 2 or 1, will all produce the same
    /// effective scheme as the computed values will be the same as the
    /// [FlexSchemeColor.from] is using to compute any main missing scheme
    /// color values.
    int usedColors = 4,

    /// The app bar background theme style.
    ///
    /// Defaults to [FlexAppBarStyle.primary] which produces the same results
    /// as a Flutter standard light [ThemeData.from] by tying the app bar color
    /// to the primary color.
    FlexAppBarStyle appBarStyle = FlexAppBarStyle.primary,

    /// The background color for widgets like Card, BottomAppBar and Dialogs.
    ///
    /// If null, the color is determined by [FlexSurface] flexSurface.
    Color surface,

    /// A color that typically appears behind scrollable content.
    ///
    /// The color is applied to ThemeData `canvasColor` and`backgroundColor`,
    /// it is used eg in menu drawer.
    ///
    /// If null, the color is determined by [FlexSurface] flexSurface.
    Color background,

    /// The color of the scaffold background.
    ///
    /// If null, the color is determined by [FlexSurface] flexSurface.
    Color scaffoldBackground,

    /// A color that is clearly legible when drawn on [primary] color.
    ///
    /// If null, the on color is derived from the brightness of the [primary]
    /// color, and will be be black if it is light and white if it is dark.
    Color onPrimary,

    /// A color that's clearly legible when drawn on [secondary] color.
    ///
    /// If null, the on color is derived from the brightness of the [secondary]
    /// color, and will be be black if it is light and white if it is dark.
    Color onSecondary,

    /// A color that's clearly legible when drawn on [surface] color.
    ///
    /// If null, the on color is derived from the brightness of the [surface]
    /// color, and will be be black if it is light and white if it is dark.
    Color onSurface,

    /// A color that's clearly legible when drawn on [background] color, it is
    /// also used as on color for [scaffoldBackground].
    ///
    /// If null, the on color is derived from the brightness of the [background]
    /// color, and will be be black if it is light and white if it is dark.
    Color onBackground,

    /// A color that's clearly legible when drawn on [error].
    ///
    /// If null, the on color is derived from the brightness of the [error]
    /// color, and will be be black if it is light and white if it is dark.
    Color onError,

    /// Tooltips background color will match the brightness of the theme's
    /// background color.
    ///
    /// By default Flutter's Material tooltips uses a theme where the tooltip's
    /// background color's brightness is inverted in relation to the overall
    /// theme's background color. FlexColorScheme allows you to use a single
    /// toggle to invert this. Light tooltips on light background is eg the
    /// default style on Windows Desktop. You can use this toggle to simply just
    /// prefer and use this style, or as a means to create a platform adaptive
    /// tooltip style, where the Material/Flutter style is used on devices and
    /// Web, but the inverted scheme would be used on desktop platforms.
    ///
    /// Defaults to false, uses same background style as Material and Flutter.
    bool tooltipsMatchBackground = false,

    /// Same property as in [ThemeData] factory, it is just passed along to it.
    ///
    /// Included for convenience to avoid a copyWith if it needs to be changed.
    VisualDensity visualDensity,

    /// Same property as in [ThemeData] factory, it is just passed along to it.
    ///
    /// Included for convenience to avoid a copyWith if it needs to be changed.
    String fontFamily,

    /// Same property as in [ThemeData] factory, it is just passed along to it.
    ///
    /// Included for convenience to avoid a copyWith if it needs to be changed.
    /// Defaults to [defaultTargetPlatform].
    TargetPlatform platform,

    /// Same property as in [ThemeData] factory.
    ///
    /// Included for convenience to avoid a copyWith if it needs to be changed.
    ///
    /// Default value deviates from the Flutter standard that uses the old
    /// [Typography.material2014], in favor of newer [Typography.material2018]
    /// as default typography if one is not provided.
    Typography typography,
  }) {
    // Check valid inputs
    assert(colors != null, 'Colors cannot be null');
    assert(surfaceStyle != null, 'themeSurface cannot be null');
    assert(usedColors != null, 'usedColors cannot be null');
    assert(usedColors >= 1 && usedColors <= 4, 'usedColors must be 1 to 4');
    assert(appBarStyle != null, 'appBarStyle cannot be null');
    assert(tooltipsMatchBackground != null,
        'tooltipsMatchBackground cannot be null');
    // Just in case null is passed in release mode, we use fallback values.
    colors ??= FlexColor.schemesWithCustom[FlexScheme.material].light;
    surfaceStyle ??= FlexSurface.material;
    usedColors ??= 4;
    appBarStyle ??= FlexAppBarStyle.primary;

    // Make effective colors using 1...4 of the passed in theme colors via
    // the [usedColors] property.
    final FlexSchemeColor effectiveColors = FlexSchemeColor(
      primary: colors.primary,
      primaryVariant: usedColors > 2
          ? colors.primaryVariant
          // ignore: avoid_redundant_argument_values
          : colors.primary.darken(kDarkenPrimaryVariant),
      secondary: usedColors > 1
          ? colors.secondary
          : colors.primary.darken(kDarkenSecondary),
      secondaryVariant: usedColors > 3
          ? colors.secondaryVariant
          : usedColors > 1
              // ignore: avoid_redundant_argument_values
              ? colors.secondary.darken(kDarkenSecondaryVariantFromSecondary)
              : colors.primary.darken(kDarkenSecondaryVariant),
      appBarColor: colors.appBarColor,
      error: colors.error,
    );

    // If themeSurface is [ThemeSurface.custom] then the returned surfaceTheme
    // will be null and surface colors must have been passed in to
    // FlexColorScheme.light, if they were not, then Material default colors
    // will be used as fallback further below.
    final SchemeSurfaceColors surfaceTheme = SchemeSurfaceColors.from(
      // ignore: avoid_redundant_argument_values
      brightness: Brightness.light,
      themeSurface: surfaceStyle,
      primary: effectiveColors.primary,
    );

    // For the on colors we pass in the palette and surface colors to
    // calculate onColors for. If some onColors were passed in we give
    // that value to it, if it was not null it will be used instead of the
    // calculated on color.
    final SchemeOnColors onColorsTheme = SchemeOnColors.from(
      primary: effectiveColors.primary,
      secondary: effectiveColors.secondary,
      surface:
          surface ?? surfaceTheme.surface ?? FlexColor.materialLightSurface,
      background: background ??
          surfaceTheme.background ??
          FlexColor.materialLightBackground,
      error: effectiveColors.error ?? FlexColor.materialLightError,
      onPrimary: onPrimary,
      onSecondary: onSecondary,
      onSurface: onSurface,
      onBackground: onBackground,
      onError: onError,
    );

    // Get the effective app bar color based on the style
    Color effectiveAppBarColor;
    switch (appBarStyle) {
      case FlexAppBarStyle.primary:
        effectiveAppBarColor = effectiveColors.primary;
        break;
      case FlexAppBarStyle.material:
        effectiveAppBarColor = FlexColor.materialLightSurface;
        break;
      case FlexAppBarStyle.background:
        effectiveAppBarColor = background ??
            surfaceTheme.background ??
            FlexColor.materialLightBackground;
        break;
      case FlexAppBarStyle.surface:
        effectiveAppBarColor =
            surface ?? surfaceTheme.surface ?? FlexColor.materialLightSurface;
        break;
      case FlexAppBarStyle.custom:
        effectiveAppBarColor =
            effectiveColors.appBarColor ?? effectiveColors.primary;
        break;
    }

    // Return a FlexColorScheme based on above factory, we use
    // fallbacks in the constructor too, they are required for the custom
    // settings if some provided values were null.
    return FlexColorScheme(
      // Primary color for the application
      primary: effectiveColors.primary,
      // The primary variant should generally be a bit darker color than
      // primary, preferably of a color like it or darker hue of primary.
      // If no value was provided we make a hue that is 10% darker.
      primaryVariant: effectiveColors.primaryVariant,
      // The secondary color for the application. If you do not want
      // to use it set it to the same color as primary. For a subtle
      // one color based theme you can use a hue of the primary.
      // This creates one that is 5% darker than primary, if not given.
      secondary: effectiveColors.secondary,
      // The secondary variant should generally be a bit darker color than
      // secondary, preferably of a color like it or darker hue of secondary.
      // We use any provided value, if none darken the secondary and if no
      // secondary was provided we darken the primary 15%
      secondaryVariant: effectiveColors.secondaryVariant,
      // Surface is used e.g. by Card and bottom appbar and in this
      // implementation also by dialogs.
      surface:
          surface ?? surfaceTheme.surface ?? FlexColor.materialLightSurface,
      // Background is used e.g. by drawer and bottom bar.
      background: background ??
          surfaceTheme.background ??
          FlexColor.materialLightBackground,
      scaffoldBackground: scaffoldBackground ??
          surfaceTheme.scaffoldBackground ??
          FlexColor.materialLightScaffoldBackground,
      // Set app bar background to effective background color.
      appBarBackground: effectiveAppBarColor,

      // Effective error color and null fallback.
      error: effectiveColors.error ?? FlexColor.materialLightError,
      // The "on" colors will get defaults later by [toTheme] getter if they do
      // not have values here, so we do not need to check them here.
      onPrimary: onColorsTheme.onPrimary,
      onSecondary: onColorsTheme.onSecondary,
      onSurface: onColorsTheme.onSurface,
      onBackground: onColorsTheme.onBackground,
      onError: onColorsTheme.onError,
      // This is light theme factory, so brightness is always light
      brightness: Brightness.light,
      tooltipsMatchBackground: tooltipsMatchBackground,
      // Visual density, fontFamily, platform and typography values are just
      // passed along as were along to FlexColorScheme and from there to
      // the [toTheme] method factory.
      // They are a convenience inclusion here to avoid an extra Theme
      // copyWith after making a Theme with [FlexColorScheme.toTheme].
      visualDensity: visualDensity,
      fontFamily: fontFamily,
      platform: platform,
      typography: typography,
    );
  }

  /// Creates a dark [FlexColorScheme] based on the given [FlexSchemeColor].
  ///
  /// The only required property is [FlexSchemeColor], which can be
  /// created with just one color property using the factory
  /// [FlexSchemeColor.from], more detailed color themes can also be defined.
  factory FlexColorScheme.dark({
    /// The [FlexSchemeColor] that we will create the light [FlexColorScheme]
    /// from. You can use predefined [FlexSchemeColor] from
    /// [FlexColor.schemesWithCustom] or define your own colors with
    /// [FlexSchemeColor] or [FlexSchemeColor.from].
    @required FlexSchemeColor colors,

    /// The number of the four main scheme colors to be used of the ones
    /// passed in via the required colors [FlexSchemeColor] property.
    ///
    /// This is a convenience property that allows you to vary which colors to
    /// use of the primary, secondary and variant colors included in `colors` in
    /// [FlexSchemeColor]. The integer number corresponds to using:
    /// 1 = Only the primary color
    /// 2 = Primary + Secondary colors
    /// 3 = Primary + Primary variant + Secondary colors
    /// 4 = Primary + Primary variant + Secondary + Secondary variant colors
    /// By default the value is 4 and all main scheme colors in
    /// [FlexSchemeColor] are used.
    ///
    /// When the value is 1, the result is the same as if we would have
    /// created the colors with [FlexSchemeColor.from] by only giving it the
    /// required primary color. With 2, it is equivalent to as if we would have
    /// given it only the primary and secondary colors, and so on.
    /// This property makes it possible to simulate and change the resulting
    /// [FlexColorScheme] to as if you would have specified 1, 2, 3 or 4 of
    /// the colors. If your used [FlexColorScheme] `colors` was actually created
    /// with [FlexSchemeColor.from] with only the primary color defined, then
    /// changing the value from 4 to 3, 2 or 1, will all produce the same
    /// effective scheme as the computed values will be the same as the
    /// [FlexSchemeColor.from] is using to compute any main missing scheme
    /// color values.
    int usedColors = 4,

    /// Defines which surface style to use.
    ///
    /// Defaults to [FlexSurface.material] which results in Flutter
    /// standard [ColorScheme.dark] surface colors, which follows the
    /// default color scheme in the Material Design
    /// guide for dark theme found here:
    /// https://material.io/design/color/dark-theme.html#ui-application
    ///
    /// If values for [surface], [background] ot [scaffoldBackground] are
    /// provided, they are used instead of values that would be assigned based
    /// on the selected and provided [FlexSurface] style.
    FlexSurface surfaceStyle = FlexSurface.material,

    /// The app bar background theme style.
    ///
    /// Defaults to [FlexAppBarStyle.material] which produces the same results
    /// as a Flutter standard dark [ThemeData.from] by tying the app bar color
    /// to the surface color.
    FlexAppBarStyle appBarStyle = FlexAppBarStyle.material,

    /// The background color for widgets like Card, BottomAppBar and dialogs.
    ///
    /// If null, the color is determined by [FlexSurface] flexSurface.
    Color surface,

    /// A color that typically appears behind scrollable content.
    ///
    /// The color is applied to ThemeData `canvasColor` and`backgroundColor`,
    /// it is used eg in menu drawer.
    ///
    /// If null, the color is determined by [FlexSurface] flexSurface.
    Color background,

    /// The color of the scaffold background.
    ///
    /// If null the color is defined by [FlexSurface] flexSurface.
    Color scaffoldBackground,

    /// A color that is clearly legible when drawn on [primary] color.
    ///
    /// If null, the on color is derived from the brightness of the [primary]
    /// color, and will be be black if it is light and white if it is dark.
    Color onPrimary,

    /// A color that's clearly legible when drawn on [secondary] color.
    ///
    /// If null, the on color is derived from the brightness of the [secondary]
    /// color, and will be be black if it is light and white if it is dark.
    Color onSecondary,

    /// A color that's clearly legible when drawn on [surface] color.
    ///
    /// If null, the on color is derived from the brightness of the [surface]
    /// color, and will be be black if it is light and white if it is dark.
    Color onSurface,

    /// A color that's clearly legible when drawn on [background] color, it is
    /// also used as on color for [scaffoldBackground].
    ///
    /// If null, the on color is derived from the brightness of the [background]
    /// color, and will be be black if it is light and white if it is dark.
    Color onBackground,

    /// A color that's clearly legible when drawn on [error].
    ///
    /// If null, the on color is derived from the brightness of the [error]
    /// color, and will be be black if it is light and white if it is dark.
    Color onError,

    /// Makes the dark theme even darker.
    ///
    /// Mostly surfaces will become fully black, but surfaces may in
    /// primary blend modes still use a hint of surface color for a slight
    /// off black mode when primary blended surface are used.
    bool darkIsTrueBlack = false,

    /// Tooltips background color will match the brightness of the theme's
    /// background color.
    ///
    /// By default Flutter's Material tooltips uses a theme where the tooltip's
    /// background color's brightness is inverted in relation to the overall
    /// theme's background color. FlexColorScheme allows you to use a single
    /// toggle to invert this. Light tooltips on light background is eg the
    /// default style on Windows Desktop. You can use this toggle to simply just
    /// prefer and use this style, or as a means to create a platform adaptive
    /// tooltip style, where the Material/Flutter style is used on devices and
    /// Web, but the inverted scheme would be used on desktop platforms.
    ///
    /// Defaults to false, uses same background style as Material and Flutter.
    bool tooltipsMatchBackground = false,

    /// Same property as in [ThemeData] factory, it is just passed along to it.
    ///
    /// Included for convenience to avoid a copyWith if it needs to be changed.
    VisualDensity visualDensity,

    /// Same property as in [ThemeData] factory, it is just passed along to it.
    ///
    /// Included for convenience to avoid a copyWith if it needs to be changed.
    String fontFamily,

    /// Same property as in [ThemeData] factory, it is just passed along to it.
    ///
    /// Included for convenience to avoid a copyWith if it needs to be changed.
    /// Defaults to [defaultTargetPlatform].
    TargetPlatform platform,

    /// Same property as in [ThemeData] factory.
    ///
    /// Included for convenience to avoid a copyWith if it needs to be changed.
    /// Default value deviates from the Flutter standard that uses the old
    /// [Typography.material2014], in favor of newer [Typography.material2018]
    /// as default typography if one is not provided.
    Typography typography,
  }) {
    // Check valid inputs
    assert(colors != null, 'colors may not be null.');
    assert(surfaceStyle != null, 'themeSurface may not be null.');
    assert(usedColors != null, 'usedColors may not be null.');
    assert(
        usedColors >= 1 && usedColors <= 4,
        'usedColors must be from '
        '1 to 4.');
    assert(appBarStyle != null, 'appBarStyle may not be null.');
    assert(darkIsTrueBlack != null, 'darkIsTrueBlack color may not be null.');
    assert(tooltipsMatchBackground != null,
        'tooltipsMatchBackground cannot be null');

    // Just in case null is passed in release mode, we use fallback values.
    colors ??= FlexColor.schemesWithCustom[FlexScheme.material].dark;
    surfaceStyle ??= FlexSurface.material;
    usedColors ??= 4;
    appBarStyle ??= FlexAppBarStyle.surface;
    darkIsTrueBlack ??= false;

    // Make effective colors using 1...4 of the passed in theme colors via
    // the [usedColors] value.
    final FlexSchemeColor effectiveColors = FlexSchemeColor(
      primary: colors.primary ?? FlexColor.materialLightPrimary,
      primaryVariant: usedColors > 2
          ? colors.primaryVariant
          // ignore: avoid_redundant_argument_values
          : colors.primary.darken(kDarkenPrimaryVariant),
      secondary: usedColors > 1
          ? colors.secondary
          : colors.primary.darken(kDarkenSecondary),
      secondaryVariant: usedColors > 3
          ? colors.secondaryVariant
          : usedColors > 1
              // ignore: avoid_redundant_argument_values
              ? colors.secondary.darken(kDarkenSecondaryVariantFromSecondary)
              : colors.primary.darken(kDarkenSecondaryVariant),
      appBarColor: colors.appBarColor,
      error: colors.error,
    );

    // If themeSurface is [ThemeSurface.custom] then the returned surfaceTheme
    // will be null and surface colors must have been passed in to
    // FlexColorScheme.light, if they were not, then Material default colors
    // will be used as fallback further below.
    final SchemeSurfaceColors surfaceTheme = SchemeSurfaceColors.from(
      brightness: Brightness.dark,
      themeSurface: surfaceStyle,
      primary: effectiveColors.primary,
    );

    // For the on colors we pass in the palette and surface colors to
    // calculate onColors for. If some onColors were passed in we give
    // that value to it, if it was not null it will be used instead of the
    // calculated on color.
    final SchemeOnColors onColorsTheme = SchemeOnColors.from(
      primary: effectiveColors.primary,
      secondary: effectiveColors.secondary,
      surface: surface ?? surfaceTheme.surface ?? FlexColor.materialDarkSurface,
      background: background ??
          surfaceTheme.background ??
          FlexColor.materialDarkBackground,
      error: effectiveColors.error ?? FlexColor.materialDarkError,
      onPrimary: onPrimary,
      onSecondary: onSecondary,
      onSurface: onSurface,
      onBackground: onBackground,
      onError: onError,
    );

    // Determine effective surface color.
    // Surface is used e.g. by Card and bottom appbar and in this
    // implementation also by dialogs.
    // If true black, we make a darker than normal surface. If not
    // true black, we use provided surface color.
    // Fallback from theme, to custom value to material default const.
    Color effectiveSurfaceColor;
    if (darkIsTrueBlack) {
      effectiveSurfaceColor = surface?.darken(6) ??
          surfaceTheme.surface?.darken(6) ??
          const Color(0xFF000000).blend(
              effectiveColors.primary ?? FlexColor.materialDarkPrimary, 6);
    } else {
      effectiveSurfaceColor = surface ??
          surfaceTheme.surface ??
          FlexColor.materialDarkSurface.blend(
              effectiveColors.primary ?? FlexColor.materialDarkPrimary, 5);
    }

    // Determine effective background color.
    // Used e.g. by drawer, nav rail, side menu and bottom bar.
    // If true black, we use darker then normal background. If not true black,
    // we use provided background color
    // Fallback from theme, to custom value to material default const.
    Color effectiveBackgroundColor;
    if (darkIsTrueBlack) {
      effectiveBackgroundColor = background?.darken(8) ??
          surfaceTheme.background?.darken(8) ??
          const Color(0xFF000000).blend(
              effectiveColors.primary ?? FlexColor.materialDarkPrimary, 8);
    } else {
      effectiveBackgroundColor = background ??
          surfaceTheme.background ??
          FlexColor.materialDarkBackground.blend(
              effectiveColors.primary ?? FlexColor.materialDarkPrimary, 6);
    }

    // Get the effective app bar color based on the style
    Color effectiveAppBarColor;
    switch (appBarStyle) {
      case FlexAppBarStyle.primary:
        effectiveAppBarColor = effectiveColors.primary;
        break;
      case FlexAppBarStyle.material:
        effectiveAppBarColor = darkIsTrueBlack
            ? const Color(0xFF000000)
            : FlexColor.materialDarkBackground;
        break;
      case FlexAppBarStyle.background:
        effectiveAppBarColor = effectiveBackgroundColor;
        break;
      case FlexAppBarStyle.surface:
        effectiveAppBarColor = effectiveSurfaceColor;
        break;
      case FlexAppBarStyle.custom:
        effectiveAppBarColor = effectiveColors.appBarColor ??
            (darkIsTrueBlack
                ? const Color(0xFF000000)
                : FlexColor.materialDarkBackground);
        break;
    }

    // Return a FlexColorScheme based on above factory, we use
    // fallbacks in the constructor too, they are required for the custom
    // settings if some provided values were null.
    return FlexColorScheme(
      // Primary color for the application
      primary: effectiveColors.primary,
      // The primary variant should generally be a bit darker color than
      // primary, preferably of a color like it or darker hue of primary.
      // If no value was provided we make a hue that is 10% darker.
      primaryVariant: effectiveColors.primaryVariant,
      // The secondary color for the application. If you do not want
      // to use it set it to the same color as primary. For a subtle
      // one color based theme you can use a hue of the primary.
      // This creates one that is 5% darker than primary, if not given.
      secondary: effectiveColors.secondary,
      // The secondary variant should generally be a bit darker color than
      // secondary, preferably of a color like it or darker hue of secondary.
      // We us any provided value, if none darken the secondary and if no
      // secondary was provided we darken the primary 15%
      secondaryVariant: effectiveColors.secondaryVariant,
      // Surface is used e.g. by Card and bottom appbar and in this
      // implementation also by dialogs.
      surface: effectiveSurfaceColor,
      // Used e.g. by drawer, nav rail, side menu and bottom bar.
      background: effectiveBackgroundColor,
      // If darkIsTrueBlack is set, we use black as default scaffold background,
      // otherwise provided values are used, if null then the default is 8%
      // of Primary color on dark grey #121212.
      // Fallback from theme, to custom value to material default const.
      scaffoldBackground: darkIsTrueBlack
          ? const Color(0xFF000000)
          : scaffoldBackground ??
              surfaceTheme.scaffoldBackground ??
              FlexColor.materialDarkScaffoldBackground.blend(
                  effectiveColors.primary ??
                      colors.primary ??
                      FlexColor.materialDarkPrimary,
                  8),
      // Set app bar background to effective background color.
      appBarBackground: effectiveAppBarColor,

      // Effective error color and null fallback.
      error: effectiveColors.error ?? FlexColor.materialDarkError,
      // The "on" colors will get defaults later by [toTheme] getter if they do
      // not have values here, so we do not need to check them here.
      onPrimary: onColorsTheme.onPrimary,
      onSecondary: onColorsTheme.onSecondary,
      onSurface: onColorsTheme.onSurface,
      onBackground: onColorsTheme.onBackground,
      onError: onColorsTheme.onError,
      // This is dark theme factory, so brightness is always dark
      brightness: Brightness.dark,
      tooltipsMatchBackground: tooltipsMatchBackground,
      // Visual density, fontFamily, platform and typography values are just
      // passed as is along to FlexColorScheme and from there to Theme factory.
      // They are just included as a way to include them also when needed
      // in FlexColorScheme based themes.
      visualDensity: visualDensity,
      fontFamily: fontFamily,
      platform: platform,
      typography: typography,
    );
  }

  /// The overall brightness of this color scheme.
  ///
  /// The brightness value is required and cannot be null.
  final Brightness brightness;

  /// The color displayed most frequently across your app’s screens and
  /// components.
  ///
  /// The color value is required and cannot be null.
  final Color primary;

  /// A darker version of the primary color.
  ///
  /// The color value is required and cannot be null.
  final Color primaryVariant;

  /// An accent color that, when used sparingly, calls attention to parts
  /// of your app.
  ///
  /// The color value is required and cannot be null.
  final Color secondary;

  /// A darker version of the secondary color.
  ///
  /// The color value is required and cannot be null.
  final Color secondaryVariant;

  /// The background color for widgets like Card, BottomAppBar and Dialogs.
  ///
  /// If no value is given defaults to [FlexColor.materialLightSurface] if
  /// brightness is light and to [FlexColor.materialDarkSurface] if
  /// brightness is dark.
  final Color surface;

  /// A color that typically appears behind scrollable content.
  ///
  /// The color is applied to ThemeData `canvasColor` and`backgroundColor`,
  /// it is used eg in menu drawer.
  ///
  /// If no value is given defaults to [FlexColor.materialLightBackground] if
  /// brightness is light and to [FlexColor.materialDarkBackground] if
  /// brightness is dark.
  final Color background;

  /// The color to use for input validation errors, e.g. for
  /// [InputDecoration.errorText].
  ///
  /// If no value is given defaults to [FlexColor.materialLightError] if
  /// brightness is light and to [FlexColor.materialDarkError] if brightness
  /// is dark.
  final Color error;

  /// The color of the scaffold background.
  ///
  /// This color cannot be controlled separately with Flutter's standard
  /// ColorScheme. FlexColorScheme brings back the possibility to specify
  /// it separately.
  ///
  /// If no color is given, it defaults to [background].
  final Color scaffoldBackground;

  /// Background color theme for the app bar.
  ///
  /// This color cannot be controlled separately with Flutter's standard
  /// ColorScheme class. FlexColorScheme enables you to specify an app bar color
  /// that is independent of the primary color in light theme and of dark
  /// theme's dark surface colored app bar.
  ///
  /// If no color is given it defaults to the Flutter standard color scheme
  /// based light and dark app bar theme colors.
  final Color appBarBackground;

  /// A color that's clearly legible when drawn on [primary].
  ///
  /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
  /// [primary] and [onPrimary] is recommended. See
  /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
  ///
  /// If null, the on color is derived from the brightness of the [primary]
  /// color, and will be be black if it is light and white if it is dark.
  final Color onPrimary;

  /// A color that's clearly legible when drawn on [secondary].
  ///
  /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
  /// [secondary] and [onSecondary] is recommended. See
  /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
  ///
  /// If null, the on color is derived from the brightness of the [secondary]
  /// color, and will be be black if it is light and white if it is dark.
  final Color onSecondary;

  /// A color that's clearly legible when drawn on [surface].
  ///
  /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
  /// [surface] and [onSurface] is recommended. See
  /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
  ///
  /// If null, the on color is derived from the brightness of the [surface]
  /// color, and will be be black if it is light and white if it is dark.
  final Color onSurface;

  /// A color that's clearly legible when drawn on [background].
  ///
  /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
  /// [background] and [onBackground] is recommended. See
  /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
  ///
  /// If null, the on color is derived from the brightness of the [background]
  /// color, and will be be black if it is light and white if it is dark.
  final Color onBackground;

  /// A color that's clearly legible when drawn on [error].
  ///
  /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for [error]
  /// and [onError] is recommended. See
  /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
  ///
  /// If null, the on color is derived from the brightness of the [error]
  /// color, and will be be black if it is light and white if it is dark.
  final Color onError;

  /// Tooltips background color will match the brightness of the theme's
  /// background color.
  ///
  /// By default Flutter's Material tooltips uses a theme where the tooltip's
  /// background color's brightness is inverted in relation to the overall
  /// theme's background color. FlexColorScheme allows you to use a single
  /// toggle to invert this. Light tooltips on light background is eg the
  /// default style on Windows Desktop. You can use this toggle to simply just
  /// prefer and use this style, or as a means to create a platform adaptive
  /// tooltip style, where the Material/Flutter style is used on devices and
  /// Web, but the inverted scheme would be used on desktop platforms.
  ///
  /// Defaults to false, uses same background style as Material and Flutter.
  final bool tooltipsMatchBackground;

  /// The density value for specifying the compactness of various UI components.
  ///
  /// Density, in the context of a UI, is the vertical and horizontal
  /// "compactness" of the elements in the UI. It is unit less, since it means
  /// different things to different UI elements. For buttons, it affects the
  /// spacing around the centered label of the button. For lists, it affects the
  /// distance between baselines of entries in the list.
  ///
  /// Typically, density values are integral, but any value in range may be
  /// used. The range includes values from [VisualDensity.minimumDensity] (which
  /// is -4), to [VisualDensity.maximumDensity] (which is 4), inclusive, where
  /// negative values indicate a denser, more compact, UI, and positive values
  /// indicate a less dense, more expanded, UI. If a component doesn't support
  /// the value given, it will clamp to the nearest supported value.
  ///
  /// The default for visual densities is zero for both vertical and horizontal
  /// densities, which corresponds to the default visual density of components
  /// in the Material Design specification.
  ///
  /// As a rule of thumb, a change of 1 or -1 in density corresponds to 4
  /// logical pixels. However, this is not a strict relationship since
  /// components interpret the density values appropriately for their needs.
  ///
  /// A larger value translates to a spacing increase (less dense), and a
  /// smaller value translates to a spacing decrease (more dense).
  final VisualDensity visualDensity;

  /// Name of the font family to use as default for the theme.
  final String fontFamily;

  /// The platform adaptive widgets should adapt to target and mechanics too.
  ///
  /// Defaults to the current platform, as exposed by [defaultTargetPlatform].
  /// This should be used in order to style UI elements according to platform
  /// conventions.
  ///
  /// Widgets from the material library should use this getter (via [Theme.of])
  /// to determine the current platform for the purpose of emulating the
  /// platform behavior (e.g. scrolling or haptic effects). Widgets and render
  /// objects at lower layers that try to emulate the underlying platform
  /// platform can depend on [defaultTargetPlatform] directly, or may require
  /// that the target platform be provided as an argument. The
  /// [dart.io.Platform] object should only be used directly when it's critical
  /// to actually know the current platform, without any overrides possible (for
  /// example, when a system API is about to be called).
  ///
  /// In a test environment, the platform returned is [TargetPlatform.android]
  /// regardless of the host platform. (Android was chosen because the tests
  /// were originally written assuming Android-like behavior, and we added
  /// platform adaptations for other platforms later). Tests can check behavior
  /// for other platforms by setting the [platform] of the [Theme] explicitly to
  /// another [TargetPlatform] value, or by setting
  /// [debugDefaultTargetPlatformOverride].

  final TargetPlatform platform;

  /// The color and geometry [TextTheme] values used to configure
  /// [ThemeData.textTheme], [ThemeData.primaryTextTheme] and
  /// [ThemeData.accentTextTheme].
  ///
  /// Default value deviates from the Flutter standard that uses the old
  /// [Typography.material2014], here we use the newer [Typography.material2018]
  /// as default typography if one is not provided.
  final Typography typography;

  /// Returns the [ThemeData] object defined by [FlexColorScheme] properties
  /// and its theme logic.
  ///
  /// After you have defined your scheme with [FlexColorScheme] or one of its
  /// factories [FlexColorScheme.light], [FlexColorScheme.dark], call
  /// the [toTheme] method to get the resulting [ThemeData] object defined by
  /// your [FlexColorScheme] definition.
  ///
  /// The returned [ThemeData] contains some opinionated modifications and dark
  /// theme corrections, compared to what you get if you would just use the
  /// standard [ThemeData.from] a [ColorScheme]. You can always override these
  /// with your own theme modifications by using the `copyWith` method on the
  /// resulting theme.
  ///
  /// The differences from the standard [ThemeData.from] factory are:
  ///
  /// * Tooltip fonts are larger on desktops, 12dp instead of 10dp and use a
  ///   slight margin to support multiline tooltips.
  ///   See issue: https://github.com/flutter/flutter/issues/71429
  /// * `ScaffoldBackground` has its color own property in [FlexColorScheme] and
  ///   can if so desired differ from the [ColorScheme] background color. In the
  ///   branding implementation the `scaffoldBackground` typically gets no
  ///   primary branding applied, only in the heavy choice is there a small
  ///   amount of it. Whereas, `background` in the scheme receives the most
  ///   color branding of the surface colors. Which fits well for where the
  ///   `background`color is used by material in Widgets.
  /// * The `dialogBackgroundColor` uses the [ColorScheme.surface] color instead
  ///   of the [ColorScheme.background] because the `background` color gets the
  ///   strongest branding when branding is used. This did not look so good on
  ///   dialogs, so its color choice was changed to `surface`instead, that gets
  ///   very light branding applied. With standard default Material surface
  ///   colors the `background` and `surface` colors are the same so there is
  ///   no difference in that case.
  /// * The `indicatorColor`uses color scheme `primary` instead of the default
  ///   that is `onSurface` in dark mode and `onPrimary` in light mode.
  ///   This is just an opinionated choice.
  /// * For `toggleableActiveColor` the color scheme `secondary` color is used.
  ///   The Flutter default just uses the default [ThemeData] colors and
  ///   not the actual colors you define in your color scheme you create your
  ///   theme from. This is probably a not yet corrected oversight.
  ///   See issue: https://github.com/flutter/flutter/issues/65782.
  /// * Flutter themes created with [ThemeData.from] does not define any color
  ///   scheme related color for the `primaryColorDark` color, this method does.
  ///   See issue: https://github.com/flutter/flutter/issues/65782.
  ///   [ThemeData.from] leaves this color at [ThemeData] factory default that
  ///   will not match your scheme. Widgets seldom use this color so the issue
  ///   is rarely seen.
  /// * Flutter themes created with [ThemeData.from] does not define any color
  ///   scheme based color for the `primaryColorLight` color, this method does.
  ///   See issue: https://github.com/flutter/flutter/issues/65782.
  ///   [ThemeData.from] leaves this color at [ThemeData] factory default that
  ///   will not match your scheme. Widgets seldom use this color so the issue
  ///   is rarely seen.
  /// * Flutter themes created with [ThemeData.from] does not define any color
  ///   scheme based color for the `secondaryHeaderColor` color, this method
  ///   does. See issue: https://github.com/flutter/flutter/issues/65782.
  ///   [ThemeData.from] leaves this color at [ThemeData] factory default that
  ///   will not match your scheme. Widgets seldom use this color so the issue
  ///   is rarely seen.
  /// * Background color for [AppBarTheme] can use a custom colored appbar theme
  ///   in both light and dark themes that is not dependent on theme primary
  ///   or surface color. This functionality needs a custom text theme to be
  ///   possible to implement without a context. This method does however not
  ///   give correct localized typography. A new feature implemented via:
  ///   https://github.com/flutter/flutter/pull/71184 will also enables this
  ///   kind app bar theme and keep the correct typography localization. This
  ///   new feature is (as of 13.12.2020) not yet available on stable channel.
  ///   The new feature can also not be enabled via Themes only, one must also
  ///   opt in on an AppBar level, making it difficult to adopt the feature.
  ///   A proposal to introduce opt in on app bar theme has been submitted see:
  ///   https://github.com/flutter/flutter/issues/72206.
  ///   When the feature and the proposal lands in stable, or only the feature
  ///   but so that app bars no longer default to old theme, the implementation
  ///   currently used will be changed to use the new AppBarTheme features.
  /// * The [AppBarTheme] elevation defaults to 0.
  /// * Like standard from color scheme theme's, the `bottomAppBarColor` also
  ///   uses scheme `surface` color. Additionally this color is also applied to
  ///   [BottomAppBarTheme], that also gets default elevation 0.
  /// * A major deviation from [ThemeData.from] color scheme based theme's is
  ///   that [ThemeData.accentColor] is set color scheme primary and not to
  ///   variant. Reason is to get an easy for borders on [TextField.decoration]
  ///   to use theme based primary color also in dark mode and not variaant
  ///   color. There may be a bug in the way [InputDecorationTheme] gets used
  ///   by the [InputDecorator]. We were unable to define a theme that would
  ///   work correctly for such a setup without resorting to making accentColor
  ///   equal to [ThemeData.primaryColor]. This definition has less of an impact
  ///   visually to any built widgets. We other existing theme definitions we
  ///   saw no other widget that seemed to use the accentColor. Since FAB and
  ///   toggles have their own theme and colors, that still uses the normal and
  ///   expected colorScheme.variant color, despite this change.
  /// * The fairly recent [TextSelectionThemeData] is slightly modified. The
  ///   default for `cursorColor` is `colorScheme.primary`, we use the same here
  ///   and for now also set it the deprecated [ThemeData.cursorColor] property.
  ///   The default `selectionHandleColor` is colorScheme.primary, we use a
  ///   slightly darker shade custom shade `primaryColorDark` instead and
  ///   do the same for the deprecated [ThemeData.textSelectionHandleColor]. The
  ///   standard for `selectionColor` is `colorScheme.primary` with opacity
  ///   value 0.4 for dark and 0.12 for light mode, we use primary with 0.5 and
  ///   for dark mode and 0.3 for light mode. We apply the same defaults to
  ///   the deprecated propert [ThemeData.textSelectionColor]. The depracated
  ///   values use the same theme as the one via the [TextSelectionThemeData]
  ///   that replaces the old properties. The values for the old properties
  ///   will be removed when tey are fully deprecated on stable channel or
  ///   potentially already when they become incompatible with beta channel.
  ///   The design choices on text selection theme are made so that they will
  ///   match and wok well together with the [InputDecorationTheme].
  /// * A predefined slightly opinionated [InputDecorationTheme] is used. It
  ///   set ´filled`to `true` and fill color to colorscheme primary color with
  ///   opacity 0.035 in light mode and opacity 0.06 in dark mode. The other
  ///   key theme change is done via modification of the [ThemeData.accentColor]
  ///   described earlier above. Since the theme does not define a `border`
  ///   property TextFields in app can still easily use both the default
  ///   underline style outline style by specifying the default
  ///   ´const OutlineInputBorder()` for the border property. If you don't
  ///   want the fill style or the primary color borders in dark mode you can
  ///   override them back with copyWith.
  /// * Theming applied to [ThemeData.buttonColor] using colorScheme primary and
  ///   the entire colorScheme passed to old button's [ButtonThemeData] plus the
  ///   setting of `textTheme`to [ButtonTextTheme.primary], padding and tap
  ///   target size, makes the old buttons almost match the default design and
  ///   look of their corresponding newer buttons. So [RaisedButton] looks
  ///   very similar to [ElevatedButton], [OutlineButton] to [OutlinedButton]
  ///   and [FlatButton] to [TextButton]. There are some differences in margins,
  ///   and looks, especially in dark mode. But they are close enough, this is a
  ///   button style we used before the introduction of the new buttons with
  ///   their defaults, it just happened to be very close as the design was
  ///   based on how things looked in the design guide prior to Flutter
  ///   releasing the new buttons. The newer buttons are still nicer when it
  ///   comes to their interactions and all the theming options they provide,
  ///   but they are tedious to theme. If you want to make custom styled
  ///   buttons we recommend using the newer buttons instead of the old ones,
  ///   as they offer more customization possibilities.
  /// * The default theme for Chips contains a design bug that makes the
  ///   selected ChoiceChip() widget looks disabled in dark mode, regardless if
  ///   created with ThemeData factor or ThemeData.from the default dark
  ///   color scheme. See issue: https://github.com/flutter/flutter/issues/65663
  ///   The used chip theme modification fixes the issue.
  /// * The [FloatingActionButtonThemeData] is set as follows:
  ///   ```dart
  ///   FloatingActionButtonThemeData(
  ///        backgroundColor: colorScheme.secondary,
  ///        foregroundColor: colorScheme.onSecondary),
  ///   ```
  ///   In order to ensure the same FAB style that was the default in ThemeData
  ///   factory via `accentIconTheme` in the past. If it is not defined we
  ///   get a deprecated warning like this:
  ///   Warning: The support for configuring the foreground color of
  ///   FloatingActionButtons using ThemeData.accentIconTheme has been
  ///   deprecated. Please use ThemeData.floatingActionButtonTheme instead.
  ///   See https://flutter.dev/go/remove-fab-accent-theme-dependency.
  ///   This feature was deprecated after v1.13.2.
  /// * For [TabBarTheme] a default design that fits with surface color is
  ///   used, instead of one that fits with the app bar color. Including this
  ///   in the theme design is still being evaluated. It might be removed in the
  ///   final release in preference for guidance on how to theme it like this
  ///   when so needed.
  /// * The [BottomNavigationBarThemeData] uses color scheme primary color for
  ///   the selected item. Flutter default uses secondary color. Primary color
  ///   is the design commonly used on iOS for the bottom navigation bar. We
  ///   agree and think it looks better as the default choice in app.
  /// * Default tooltip theming in Flutter is currently a bit flawed on desktop
  ///   and web using very small 10dp font.
  ///   See issue: https://github.com/flutter/flutter/issues/71429
  ///   The default theming also does not handle multiline tooltips very well.
  ///   The used [TooltipThemeData] theme design corrects both issues. It uses
  ///   12dp font on desktop and web instead of 10dp and some padding over
  ///   height constraint o ensure multiline tooltips look nice too.
  ///   [FlexColorScheme] also includes a new property [tooltipsMatchBackground]
  ///   that can be toggled to not used Flutter's Material default theme mode
  ///   inverted background. Tooltips using light background in light theme
  ///   and dark in dark, are commonly used on Windows desktop platform. You
  ///   can tie the extra property to used platform to make an automatic
  ///   platform adaptation of the tooltip style, or give users a preference
  ///   toggle if you like.
  /// * We like same color on the app bar and status bar with in Android, like
  ///   on iOS it is cleaner. We would also like transparent navigation bar in
  ///   Android to be transparent. The first design is included and works, but
  ///   controlling the navigation bar seems to be tricky. See
  ///   related issue(s): https://github.com/flutter/flutter/issues/69999.
  ///   This pre-release still contains some experiments with these styles by
  ///   using [SystemChrome.setSystemUIOverlayStyle] in the toTheme method. We
  ///   will probably remove it in the first official release version, in favor
  ///   of setting these design elsewhere and via other means in our apps.
  ThemeData get toTheme {
    // A convenience bool to check if this theme is for light or dark mode
    final bool isDark = brightness == Brightness.dark;
    // Create a TextTheme that is appropriate for the light/dark mode
    final TextTheme textTheme =
        (isDark ? ThemeData.dark() : ThemeData.light()).textTheme;
    // Check brightness of primary, secondary, error, surface and background
    // colors, and then calculate appropriate colors for their onColors, if an
    // "on" color was not passed in.
    final SchemeOnColors onColors = SchemeOnColors.from(
      primary: primary,
      secondary: secondary,
      surface: surface ??
          (isDark
              ? FlexColor.materialDarkSurface
              : FlexColor.materialLightSurface),
      background: background ??
          (isDark
              ? FlexColor.materialDarkBackground
              : FlexColor.materialLightBackground),
      error: error ??
          (isDark ? FlexColor.materialDarkError : FlexColor.materialLightError),
      onPrimary: onPrimary,
      onSecondary: onSecondary,
      onSurface: onSurface,
      onBackground: onBackground,
      onError: onError,
    );
    // Define a standard Flutter ColorScheme from the provided brightness and
    // text theme we defined, plus the provided colors.
    final ColorScheme colorScheme = ColorScheme(
      primary: primary,
      primaryVariant: primaryVariant,
      secondary: secondary,
      secondaryVariant: secondaryVariant,
      surface: surface ??
          (isDark
              ? FlexColor.materialDarkSurface
              : FlexColor.materialLightSurface),
      background: background ??
          (isDark
              ? FlexColor.materialDarkBackground
              : FlexColor.materialLightBackground),
      error: error ??
          (isDark ? FlexColor.materialDarkError : FlexColor.materialLightError),
      onBackground: onColors.onBackground,
      onSurface: onColors.onSurface,
      onError: onColors.onError,
      onPrimary: onColors.onPrimary,
      onSecondary: onColors.onSecondary,
      brightness: brightness,
    );

    // When working with color scheme based colors, there is no longer a
    // Material primary swatch that we can use to create some of the old
    // Theme colors from that are needed. To be able to do so we make
    // a complete material color swatch from the provided primary color,
    // using the primary color as its middle [500] index color.
    final MaterialColor primarySwatch =
        createPrimarySwatch(colorScheme.primary);
    // We now have a swatch of the primary color provided via a color scheme,
    // we can use it do define some of the traditional theme colors in a way
    // that relates to the color scheme primary color, like ThemeData factory
    // does when you create a theme from a swatch. This gives us some missing
    // critical primary shades to work with.
    final Color primaryColorDark =
        isDark ? primarySwatch[700] : primarySwatch[800];
    final Color primaryColorLight = primarySwatch[100];
    final Color secondaryHeaderColor = primarySwatch[50];

    // We need some logic for the appBarColor. If a custom color for the
    // app bar was passed in, we use that, if not we use the surface color in
    // dark mode and primary color in light mode, this per the same logic as
    // the standard Flutter ThemeData.from color scheme factory uses.
    final Color effectiveAppBarColor = appBarBackground ??
        (isDark ? colorScheme.surface : colorScheme.primary);
    // Calculate the brightness for the app bar based on the effective color.
    final Brightness appBarBrightness =
        ThemeData.estimateBrightnessForColor(effectiveAppBarColor);

    // Use passed in target platform or the default one.
    final TargetPlatform _platform = platform ?? defaultTargetPlatform;

    // With Typography we deviate from the Flutter standard that uses the
    // old Typography.material2014 in favor of the newer Typography.material2018
    // as default, if one is not provided.
    final Typography _typography =
        typography ?? Typography.material2018(platform: _platform);

    // The current default theme for Material themed Tooltips are poor design
    // choices for desktop  https://material.io/components/tooltips#specs.
    // See issue: https://github.com/flutter/flutter/issues/71429
    // The font size of 10dp is just too small for desktops with pixel density
    // 1.0 also the dark tooltips on light theme and light tooltips on dark
    // themes seem more reminiscent of bootstrap Web theme and does not fit so
    // well on desktop, windows native for example uses light tooltips on light
    // themes. This default theme for tooltips uses that design choice and also
    // makes desktop and hence Web tooltips a bit larger as well, by using
    // 12dp font size instead of the too small 10 dp.
    double _tooltipFontSize() {
      switch (_platform) {
        case TargetPlatform.macOS:
        case TargetPlatform.linux:
        case TargetPlatform.windows:
          return 12;
        default:
          return 14;
      }
    }

    EdgeInsets _tooltipPadding() {
      switch (_platform) {
        case TargetPlatform.macOS:
        case TargetPlatform.linux:
        case TargetPlatform.windows:
          return const EdgeInsets.fromLTRB(8, 3, 8, 4);
        default:
          return const EdgeInsets.symmetric(horizontal: 16, vertical: 12);
      }
    }

    // Same as in ThemeData.from, but defined for reuse access in sub-themes.
    final Color dividerColor = colorScheme.onSurface.withOpacity(0.12);
    // Same as in ThemeData, but defined for reuse in custom sub-themes.
    final Color disabledColor = isDark ? Colors.white38 : Colors.black38;
    final Color hintColor =
        isDark ? Colors.white60 : Colors.black.withOpacity(0.6);

    // Make a ThemeData object defined by the FlexColorScheme properties and
    // the designed slightly opinionated theme design choices over default
    // Flutter Material theme implementation.
    final ThemeData theme = ThemeData(
      // These properties we just pass along these to the standard ThemeData
      // factory. They are included in FlexColorScheme so we do not have to
      // apply them via ThemeData copyWith separately for cases when we want
      // to use them in a FlexColorSchemes, which might often be the case. Some
      // of the values may be null and get defaults via the ThemeData() factory.
      fontFamily: fontFamily,
      visualDensity: visualDensity,
      typography: _typography,
      platform: _platform,
      // Most definitions below are very close to the ones used by the Flutter
      // factory ThemeData.from for creating a theme from a color scheme and
      // text theme, modifications to it are mentioned further below.
      brightness: colorScheme.brightness,
      primaryColor: colorScheme.primary,
      primaryColorBrightness:
          ThemeData.estimateBrightnessForColor(colorScheme.primary),
      canvasColor: colorScheme.background,

      // A theming difference to the norm, is that accentColor is set to
      // colorScheme.primary and not colorScheme.variant. Reason is to get an
      // easy way for borders on TextField decoration to use primary color
      // in dark themes and not accentColor. There may be a bug in the way
      // InputDecorationTheme gets used by the InputDecorator. We were unable
      // to define a theme that would work correctly. This definition works
      // around the problem and achieves the goal. There were no other widgets
      // that seemed to use the accentColor. FAB and toggles use their own theme
      // and colors, that still use the expected colorScheme.variant color
      // despite this change. The only observed impact from this theme change
      // was in fact the desired change on TextField design.
      accentColor: colorScheme.primary,
      accentColorBrightness:
          ThemeData.estimateBrightnessForColor(colorScheme.primary),

      // Flutter standard for scaffoldBackgroundColor is colorScheme.background.
      // Here it is replaced with a separate color for the scaffold background,
      // so we can use a configuration with a separate scaffold background
      // color from scheme background and surface, if so desired. Flutter's
      // standard ThemeData.from a ColorScheme cannot do this. The good old
      // ThemeData factory can of course, but color scheme based themes in
      // flutter cannot specify it separately. We need to be able to do so
      // in order to make elegantly primary color branded themes.
      scaffoldBackgroundColor: scaffoldBackground ?? colorScheme.background,
      // Card, divider and background colors are same as in ThemeData.from.
      cardColor: colorScheme.surface,
      dividerColor: dividerColor,
      backgroundColor: colorScheme.background,
      // Same as in ThemeData factory, but defined via final value in build for
      // potential reuse access in sub-themes further below as well.
      disabledColor: disabledColor,
      hintColor: hintColor,
      // Flutter standard dialogBackgroundColor for color scheme based themes
      // uses colorScheme.background.
      // We use surface color instead of background for the dialog background.
      // In Flutter ColorScheme .dark and .light, they are the same, but
      // background color affects things like drawer, bottom bar and we
      // like them slightly darker than surface, and when using primary blended
      // background, we want it to be a stronger blend than surface, but this
      // does not fit so well on dialogs, so we use colorScheme.surface for
      // dialog background instead. This modification keeps the dialog color
      // as expected for standard default surfaces, but also works well when
      // using a slightly darker or stronger branded color for background.
      dialogBackgroundColor: colorScheme.surface,

      // Define errorColor via color scheme error color.
      errorColor: colorScheme.error,

      // Replaced Flutter standard indicator color with colorScheme.primary.
      // The default is onSurface in dark mode and onPrimary in light mode,
      // which is designed to fit an app bar colored tab bar. Since we made
      // use the tab bar on surface colors, we want the indicator to be
      // primary colored both in dark and light mode.
      indicatorColor: colorScheme.primary,

      // Elevation overlay on dark material elevation is used on dark themes
      // on surfaces by default. Flutter ThemeData.from color scheme based
      // themes also uses this by default, but ThemeData factory does not.
      applyElevationOverlayColor: isDark,

      // Pass the from FlexColorScheme defined colorScheme to ThemeData
      // colorScheme. Newer standard Flutter sub themes use the colorScheme
      // for their theming and all sub themes will eventually be converted to
      // be based on the defined color scheme colors. FlexColorScheme passes
      // scheme it has created to the colorScheme property in ThemeData.
      // More info here: https://flutter.dev/go/material-theme-system-updates
      colorScheme: colorScheme,

      // ----------------------------------------------------------------------
      // The theme settings below are corrective additions to the Flutter
      // standard Theme.from(colorScheme) factory. They are needed because it
      // omits some definitions that will not be aligned with the ColorScheme
      // theme, if they are not added to it manually.
      // This as per the state in master channel December 15.2020.
      // This document again relates to the on going transition:
      // https://flutter.dev/go/material-theme-system-updates
      // This issue explains and demos some of the current gaps:
      // https://github.com/flutter/flutter/issues/65782
      // Some of th gaps will probably be solved eventually when Flutter's theme
      // migration progresses. This package will monitor the development and
      // remove no longer needed corrections or remove totally deprecated
      // ThemeData properties when it is appropriate and timely to do so.
      // ----------------------------------------------------------------------

      // This color is important, if it is not set we get a teal color for it
      // in dark mode, and not actually the secondary color that we want for
      // our color scheme based theme. The Flutter color scheme based theme
      // does not include this, in our opinion correct application of the color
      // scheme based theme, it should really do the same as below.
      // See issue: https://github.com/flutter/flutter/issues/65782
      toggleableActiveColor: colorScheme.secondary,

      // The primary dark color no longer exists in ColorScheme themes, but
      // it still needs to be set to match the ColorScheme theme, otherwise we
      // get a default dark blue theme color for it coming from default
      // primarySwatch. This will not look good if your theme uses any primary
      // color that is not a blue hue. To fix this we use the [700] value from
      // the calculated primary swatch for dark mode and [800] for light mode.
      // See issue: https://github.com/flutter/flutter/issues/65782
      primaryColorDark: primaryColorDark,

      // The light primary color no longer exists in ColorScheme themes, but it
      // still needs to be set to match the ColorScheme theme, otherwise we
      // get a default blue color for it coming from the default primarySwatch.
      // We use the [100] value from the calculated primary swatch.
      // See issue: https://github.com/flutter/flutter/issues/65782
      primaryColorLight: primaryColorLight,

      // Define a secondary header color, not sure what uses it, but we should
      // give it a color that will work with ColorScheme based themes. If it is
      // not set, it gets a super light [50] hue of the primary color from
      // default theme.light factory. We use the [50] value from the
      // calculated primary swatch instead.
      // See issue: https://github.com/flutter/flutter/issues/65782
      secondaryHeaderColor: secondaryHeaderColor,

      // This app bar theme will allow us to use a custom colored appbar theme
      // in both light and dark themes that is not dependent on theme primary
      // or surface color, and still gets a correct working text and icon theme.
      // As presented in https://github.com/flutter/flutter/issues/50606 doing
      // this is a bit tricky and any added new TextTheme here will break
      // default appbar styles. The solution below for now give us the needed
      // typography for a color themed AppBar. It does however not give correct
      // localized typography. A new feature implemented via:
      // https://github.com/flutter/flutter/pull/71184 also enables this kind
      // app bar themes and keep the correct typography localization. This new
      // feature is (as of 13.12.2020) not yet available on stable channel.
      // The new feature can also not be enabled via Themes only, one must also
      // opt in an AppBar level, making it difficult to adopt the feature.
      // I wrote a proposal to introduce opt in on theme level too:
      // https://github.com/flutter/flutter/issues/72206
      // When the feature and the proposal lands in stable, or only the feature
      // but so that app bars no longer default to old theme, the implementation
      // below will be changed to use the new AppBarTheme features.
      // TODO Change implementation to new AppBarTheme when it lands in stable.
      appBarTheme: AppBarTheme(
        textTheme: appBarBrightness == Brightness.light
            ? _typography.black.merge(Typography.englishLike2018)
            : _typography.white.merge(Typography.englishLike2018),
        // Use the defined appbar color for the theme
        color: effectiveAppBarColor,
        // Set appbar brightness based on the appbar color
        brightness: appBarBrightness,
        // Define appropriate brightness on the icon themes
        iconTheme: appBarBrightness == Brightness.dark
            ? const IconThemeData(color: Colors.white)
            : const IconThemeData(color: Colors.black87),
        actionsIconTheme: appBarBrightness == Brightness.dark
            ? const IconThemeData(color: Colors.white)
            : const IconThemeData(color: Colors.black87),
        // Opinionated, adjust Theme with a copyWith for elevation if needed.
        elevation: 0,
      ),

      // The bottom app bar often hold a tab bar and it is kept as surface
      // colored, which is also the standard in ThemeData.from(ColorScheme).
      bottomAppBarColor: colorScheme.surface,
      bottomAppBarTheme: BottomAppBarTheme(
        color: colorScheme.surface,
        elevation: 0,
      ),

      // ----------------------------------------------------------------------
      // The additions below are theme customizations that differs from the
      // defaults Flutter provides out of the box. They go nicely together with
      // the rest of the theme settings used by FlexColorScheme based themes.
      // The choices are of course opinionated and you can define own values
      // that override them with copyWith, just as you would on the default
      // ThemeData factory.
      // ----------------------------------------------------------------------
      fixTextFieldOutlineLabel: true,
      // TODO Remove these 3 deprecated values when removed from stable channel.
      // When using TextSelectionThemeData, the standard for cursorColor is
      // colorScheme.primary, we use the same here for its ThemeData property
      // that otherwise have another value.
      cursorColor: colorScheme.primary,
      // When using TextSelectionThemeData, the standard for selectionColor
      // is colorScheme.primary with opacity value 0.4 for dark and 0.12 light
      // mode, we use primary with 0.5 for dark mode and 0.3 for light mode.
      textSelectionColor: isDark
          ? colorScheme.primary.withOpacity(0.50)
          : colorScheme.primary.withOpacity(0.30),
      // When using TextSelectionThemeData, standard selectionHandleColor is
      // colorScheme.primary, we use slightly darker shade primaryColorDark
      // instead and do the same for ThemeData textSelectionHandleColor.
      textSelectionHandleColor: primaryColorDark,
      // This text selection theme will eventually totally replace the
      // above deprecated properties, currently we set equivalent properties
      // to same values to make legacy properties same as the one in the newer
      // [TextSelectionThemeData] sub-theme.
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: colorScheme.primary,
        selectionColor: isDark
            ? colorScheme.primary.withOpacity(0.50)
            : colorScheme.primary.withOpacity(0.30),
        selectionHandleColor: primaryColorDark,
      ),
      // Input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: isDark
            ? colorScheme.primary.withOpacity(0.06)
            : colorScheme.primary.withOpacity(0.035),
        // The commented style experiments below were part of a test to theme
        // the InputDecorationTheme further. But it was not possible to make it
        // work as desired. Keeping it here as a reminder to make an issue
        // report of it. The accentColor workaround mentioned earlier above
        // produced an acceptable workaround with nice desired outcome.
        // TODO Remove the commented code below when issue has been submitted.
        // hintStyle: textTheme.caption.copyWith(color: hintColor),
        // errorStyle: textTheme.caption.copyWith(color: colorScheme.error),
        // labelStyle: textTheme.subtitle1.copyWith(color: colorScheme.primary),
        // helperStyle: textTheme.subtitle1.copyWith(color: hintColor),
        // border: OutlineInputBorder(
        //     borderSide: BorderSide(color: colorScheme.primary)),
        // focusedBorder: OutlineInputBorder(
        //     borderSide: BorderSide(width: 1.5, color: colorScheme.primary)),
        // enabledBorder: OutlineInputBorder(
        //     borderSide: BorderSide(width: 0.9, color: primarySwatch[100])),
        // disabledBorder: OutlineInputBorder(
        //     borderSide: BorderSide(width: 0.5, color: disabledColor)),
        // errorBorder: OutlineInputBorder(
        //     borderSide: BorderSide(width: 0.9, color: colorScheme.error)),
        // focusedErrorBorder: OutlineInputBorder(
        //     borderSide: BorderSide(width: 2, color: colorScheme.error)),
      ),

      // The button color and button theming below almost makes the old buttons
      // look like the defaults for the new ElevatedButton, TextButton and
      // OutlinedButton. These were defaults I used previously for the old
      // buttons. With these themes as defaults for the old buttons,
      // transitioning to the new buttons goes almost un-noticed.
      // There is no custom theming for the new buttons applied as they look
      // pretty good out of the box. But the old ones did not, the next two
      // theme settings fixes that.
      //
      // Set buttonColor to colorScheme.primary and not to grey. Similar to
      // to the Material design for the newer buttons.
      buttonColor: colorScheme.primary,
      // When the button color is set to primary, we also need to define the
      // [ButtonThemeData] so that we get correct onSurface colors for the
      // buttons. This buttonColor and buttonTheme setup, makes the older
      // Flutter Material buttons [RaisedButton], [OutlineButton] and
      // [FlatButton] very similar in style to the default color scheme based
      // style used for the newer Material buttons [ElevatedButton],
      // [OutlinedButton] and [TextButton]. There are some differences in margin
      // and outline color and the elevation behavior on the raised button.
      // But they are close enough, this is a button style I was using before
      // the introduction of the new buttons and their defaults, it just happens
      // to be very close as I had based it loosely on how things looked in the
      // design guide prior to Flutter releasing the new buttons. The newer
      // buttons are still nicer when it come to their interactions and all the
      // theming options they provide, but they are tedious to theme. If you
      // want to make custom styled buttons I recommend using the newer buttons
      // instead of the old ones as they offer more customization possibilities.
      buttonTheme: ButtonThemeData(
        colorScheme: colorScheme,
        textTheme: ButtonTextTheme.primary,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: const EdgeInsets.symmetric(horizontal: 16),
      ),

      // The default chip theme in Flutter does not work correctly with dark
      // themes. See issue: https://github.com/flutter/flutter/issues/65663
      // The chip theme below fixes it by using the colorScheme.primary color.
      chipTheme: ChipThemeData.fromDefaults(
        secondaryColor: colorScheme.primary,
        brightness: colorScheme.brightness,
        labelStyle: textTheme.bodyText1,
      ),

      // We have to separately specify the foreground color in FABs to be the
      // accentColor or ColorScheme secondary color, at least if we expect it
      // to match accentIconTheme as before. Otherwise we get a deprecated
      // warning like this:
      //
      // * Warning: The support for configuring the foreground color of
      //   FloatingActionButtons using ThemeData.accentIconTheme has been
      //   deprecated. Please use ThemeData.floatingActionButtonTheme instead.
      //   See https://flutter.dev/go/remove-fab-accent-theme-dependency.
      //   This feature was deprecated after v1.13.2.
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.secondary,
        foregroundColor: colorScheme.onSecondary,
      ),

      // Opinionated theming for the tab bar.
      // This theme is designed to work on surface color instead of the app bar
      // color. A common usage of this is when it is not used with the app
      // bar's color, but it as part of the body of a scaffold at the top of
      // the body. It can of course be used like this in an app bar as well, it
      // will work nicely with the bottom app bar theme used as default in this
      // theme too.
      // If you need a tab bar that will be placed on a bottom app bar that
      // is the same color as the app bar you will need to create another theme
      // for that use case or modify this theme with copyWith to override it.
      tabBarTheme: TabBarTheme(
        indicatorSize: TabBarIndicatorSize.tab,
        labelStyle: const TextTheme().button,
        labelColor: colorScheme.primary,
        unselectedLabelColor: onColors.onSurface.withOpacity(0.6),
      ),

      // Opinionated theming for the bottom navigation bar.
      // It uses primary color for the selected item. Flutter default uses
      // secondary color.
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedIconTheme: IconThemeData(
          color: colorScheme.primary,
        ),
        selectedItemColor: colorScheme.primary,
      ),

      // Opinionated theming of Tooltips, as stated previously above, the
      // default theme for Material themed Tooltips are poor design choices
      // https://material.io/components/tooltips#specs.
      // The theming below is an opinionated other nicer design with an option
      // to also invert the tooltip background color.
      // See issue: https://github.com/flutter/flutter/issues/71429
      tooltipTheme: TooltipThemeData(
        // We do not use the min height, the custom padding handles it instead.
        padding: _tooltipPadding(),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        textStyle: textTheme.bodyText2.copyWith(
          inherit: false,
          color: tooltipsMatchBackground
              ? isDark
                  ? Colors.white
                  : Colors.black
              : isDark
                  ? Colors.black
                  : Colors.white,
          fontSize: _tooltipFontSize(),
        ),
        decoration: tooltipsMatchBackground
            ? BoxDecoration(
                color: isDark
                    ? Colors.grey[900].withOpacity(0.93)
                    : Colors.white.withOpacity(0.94),
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                border: Border.all(
                    color: isDark ? Colors.grey[600] : Colors.grey[900]),
              )
            : null,
      ),
    );

    // On Android devices this [setSystemUIOverlayStyle] call will make
    // the AppBar one-colored like on iOS, which looks better (opinionated).
    // It would be nice if we could make the system navigation button area
    // on Android transparent, but it does not work if we set
    // systemNavigationBarColor to a transparent color. The best we can do to
    // make sure it looks nice with the theme is to set it to background color.
    // Does not seem to work well on most Android versions I tried it on.
    // There is a plugin called `flutter_statusbarcolor` available that can
    // do this a bit better. Still no available tool that can make the
    // navigation bar background transparent and keep translucent navigation
    // buttons. It is doable on some android versions but requires modifying
    // Android config files, not doable as far as I have seen from Flutter only.
    // Related issue(s): https://github.com/flutter/flutter/issues/69999.
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        // The top of the screen
        statusBarColor: Colors.transparent,
        // statusBarBrightness: Brightness.dark,
        // statusBarIconBrightness: Brightness.dark,
        // The bottom of the screen
        systemNavigationBarColor: colorScheme.background, //Colors.transparent,

        // systemNavigationBarIconBrightness: Brightness.light,
        // I also tried this divider, but it did not seem to work
        // need to test on a real and older Android device as well.
        // systemNavigationBarDividerColor:
        //     colorScheme.onSurface.withOpacity(0.12),
      ),
    );

    // if (isDark) {
    //   SystemChrome.setSystemUIOverlayStyle(
    //     const SystemUiOverlayStyle(
    //       // The top of the screen
    //       statusBarColor: Colors.transparent,
    //       statusBarBrightness: Brightness.dark,
    //       statusBarIconBrightness: Brightness.dark,
    //       // The bottom of the screen
    //       // systemNavigationBarColor: colorScheme.background,
    //       // systemNavigationBarIconBrightness: Brightness.light,
    //       // I also tried this divider, but it did not seem to work
    //       // need to test on a real and older Android device as well.
    //       // systemNavigationBarDividerColor:
    //       //     colorScheme.onSurface.withOpacity(0.12),
    //     ),
    //   );
    // } else {
    //   SystemChrome.setSystemUIOverlayStyle(
    //     const SystemUiOverlayStyle(
    //       // The top of the screen
    //       statusBarColor: Colors.transparent,
    //       statusBarBrightness: Brightness.light,
    //       statusBarIconBrightness: Brightness.light,
    //       // The bottom of the screen
    //       // systemNavigationBarColor: colorScheme.background,
    //       // systemNavigationBarIconBrightness: Brightness.dark,
    //       // systemNavigationBarDividerColor:
    //       //     colorScheme.onSurface.withOpacity(0.12),
    //     ),
    //   );
    // }

    // Return the resulting ThemeData object that a MaterialApp can use.
    return theme;
  }

  /// Returns the [ColorScheme] object defined by [FlexColorScheme] properties.
  ///
  /// After you have defined your theme with [FlexColorScheme] or one of its
  /// recommended factories [FlexColorScheme.light], [FlexColorScheme.dark], use
  /// the [toScheme] method to get the resulting [ColorScheme] object defined
  /// by your [FlexColorScheme] definition.
  ///
  /// You can use then use this returned color scheme in a standard
  /// [ThemeData.from] color scheme based theme factory to create a theme from
  /// the [FlexColorScheme]. This will result in a theme that is based on the
  /// color scheme defined in [FlexColorScheme], including the surface and
  /// background color branding, and true black for dark mode, if those were
  /// used in its creation via the light and dark factories. The main difference
  /// will be that the Flutter's [ThemeData.from] theme creation from this
  /// scheme will not include any of the theme fixes, but then again also none
  /// of the opinionated styles, used in [FlexColorScheme.toTheme] method.
  ///
  /// Example 5 in the package examples includes a toggle to create the active
  /// color scheme from the [FlexColorScheme.toTheme] or with [ThemeData.from]
  /// by using the [ColorScheme] returned by this method.
  ColorScheme get toScheme {
    // A convenience bool to check if this theme is for light or dark mode
    final bool isDark = brightness == Brightness.dark;

    // Check brightness of primary, secondary, error, surface and background
    // colors, and then calculate appropriate colors for their onColors, if an
    // "on" color was not passed in.
    final SchemeOnColors onColors = SchemeOnColors.from(
      primary: primary,
      secondary: secondary,
      surface: surface ??
          (isDark
              ? FlexColor.materialDarkSurface
              : FlexColor.materialLightSurface),
      background: background ??
          (isDark
              ? FlexColor.materialDarkBackground
              : FlexColor.materialLightBackground),
      error: error ??
          (isDark ? FlexColor.materialDarkError : FlexColor.materialLightError),
      onPrimary: onPrimary,
      onSecondary: onSecondary,
      onSurface: onSurface,
      onBackground: onBackground,
      onError: onError,
    );

    return ColorScheme(
      primary: primary,
      primaryVariant: primaryVariant,
      secondary: secondary,
      secondaryVariant: secondaryVariant,
      surface: surface ??
          (isDark
              ? FlexColor.materialDarkSurface
              : FlexColor.materialLightSurface),
      background: background ??
          (isDark
              ? FlexColor.materialDarkBackground
              : FlexColor.materialLightBackground),
      error: error ??
          (isDark ? FlexColor.materialDarkError : FlexColor.materialLightError),
      onBackground: onColors.onBackground,
      onSurface: onColors.onSurface,
      onError: onColors.onError,
      onPrimary: onColors.onPrimary,
      onSecondary: onColors.onSecondary,
      brightness: brightness,
    );
  }

  /// Create a primary color Material swatch from a given color value.
  ///
  /// The provided color value is used as the Material swatch default color 500
  /// in the returned swatch, with lighter hues for lower indexes and darker
  /// shades for higher index values.
  ///
  /// If you give this function a standard Material color index 500 value,
  /// eg `Colors.red[500]` it will not return the same swatch as `Colors.red`.
  /// This function is an approximation and gives an automated way of creating
  /// a material like primary swatch.
  static MaterialColor createPrimarySwatch(Color color) {
    final List<double> strengths = <double>[
      0.05,
      0.1,
      0.2,
      0.3,
      0.4,
      0.5,
      0.6,
      0.7,
      0.8,
      0.9,
    ];
    final Map<int, Color> swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;
    for (final double strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}

/// Immutable data class used to hold the three different surface colors in a
/// [FlexColorScheme].
///
/// [SchemeSurfaceColors] is used primarily via the[SchemeSurfaceColors.from]
/// factory that returns [SchemeSurfaceColors] object with defined surface
/// colors based on enum property [FlexSurface] and [Brightness]. Included
/// colors are surface and background,
/// plus an own surface color for scaffoldBackground, which is not a part of
/// Flutter's standard [ColorScheme].
@immutable
class SchemeSurfaceColors {
  /// Default constructor.
  const SchemeSurfaceColors({
    @required this.surface,
    @required this.background,
    @required this.scaffoldBackground,
  });

  /// Returns the surface colors from provided [Brightness] and [FlexSurface].
  /// If [FlexSurface] is light,medium, heavy or strong, then the [primary]
  /// color is also a required parameter.
  ///
  /// The [FlexSurface] enum is used to represent surface color schemes.
  /// [FlexSurface.material] is the surface colors scheme presented
  /// in Material design guide here for light theme:
  /// https://material.io/design/color/the-color-system.html#color-theme-creation
  /// and here for dark theme under "The dark theme baseline palette":
  /// https://material.io/design/color/dark-theme.html#ui-application
  ///
  /// The [FlexSurface.light], [FlexSurface.medium], [FlexSurface.strong]
  /// and [FlexSurface.heavy] blends in an increasing amount of the theme
  /// primary color into the surface, background and scaffold background colors
  /// colors for a branded or primary color tones surfaces look.
  ///
  /// The percentage of blend values for each strength are separate for surface
  /// background and scaffold background. Scaffold background is only receiving
  /// a slight blend heavy mode. Surface receives a lower percentage blend than
  /// background used by scrolling surfaces. The value are also different for
  /// light and dark themes as light themes require less of the typically more
  /// saturated primary color. Dark themes must use a slightly desaturated
  /// primary color so the blend percentage values for dark surfaces must be
  /// higher.
  ///
  /// This kind of surface branding is based on this Material guide found
  /// under "Accessibility and contrast"
  /// https://material.io/design/color/dark-theme.html#properties
  /// for branded surfaces.
  ///
  /// The surface colors returned by this factory can also be used to make
  /// branded surface colors for Flutter's standard [ColorScheme], it does
  /// not have to be used exclusively by [FlexColorScheme].
  factory SchemeSurfaceColors.from({
    /// The light or dark theme brightness setting we will create surface for.
    Brightness brightness = Brightness.light,

    /// The type of theme surfaces colors we create.
    FlexSurface themeSurface = FlexSurface.material,

    /// Primary color to blend into surface colors when ThemeSurface light,
    /// medium, strong and heavy are used. For a Material or custom surface
    /// it is not required. Defaults to [FlexColor.materialLightPrimary].
    Color primary = FlexColor.materialLightPrimary,
  }) {
    assert(brightness != null, 'Brightness may not be null.');
    assert(themeSurface != null, 'ThemeSurface may not be null.');
    assert(
        (themeSurface != FlexSurface.material ||
                themeSurface != FlexSurface.custom) &&
            primary != null,
        'When themeSurface is something else than material or custom, primary '
        'color may not be null.');

    Color surface;
    Color background;
    Color scaffoldBackground;

    // If for some reason null got passed for primary color and we need it
    // below, we give it the default material primary color for the given
    // brightness as a fallback.
    final Color _primary = primary ??
        (brightness == Brightness.light
            ? FlexColor.materialLightPrimary
            : FlexColor.materialDarkPrimary);

    switch (brightness ?? Brightness.light) {
      case Brightness.light:
        {
          switch (themeSurface ?? FlexSurface.material) {
            case FlexSurface.material:
              {
                surface = FlexColor.materialLightSurface;
                background = FlexColor.materialLightBackground;
                scaffoldBackground = FlexColor.materialLightScaffoldBackground;
              }
              break;
            case FlexSurface.light:
              {
                surface = FlexColor.lightSurface
                    .blend(_primary, _kLightBlendSurfaceLight);
                background = FlexColor.lightBackground
                    .blend(_primary, _kLightBlendBackgroundLight);
                scaffoldBackground = FlexColor.lightScaffoldBackground;
              }
              break;
            case FlexSurface.medium:
              {
                surface = FlexColor.lightSurface
                    .blend(_primary, _kLightBlendSurfaceMedium);
                background = FlexColor.lightBackground
                    .blend(_primary, _kLightBlendBackgroundMedium);
                scaffoldBackground = FlexColor.lightScaffoldBackground;
              }
              break;
            case FlexSurface.strong:
              {
                surface = FlexColor.lightSurface
                    .blend(_primary, _kLightBlendSurfaceStrong);
                background = FlexColor.lightBackground
                    .blend(_primary, _kLightBlendBackgroundStrong);
                scaffoldBackground = FlexColor.lightScaffoldBackground;
              }
              break;
            case FlexSurface.heavy:
              {
                surface = FlexColor.lightSurface
                    .blend(_primary, _kLightBlendSurfaceHeavy);
                background = FlexColor.lightBackground
                    .blend(_primary, _kLightBlendBackgroundHeavy);
                scaffoldBackground = FlexColor.lightScaffoldBackground
                    .blend(_primary, _kLightBlendScaffoldHeavy);
              }
              break;
            case FlexSurface.custom:
              {
                // Custom surface theme returns same surface as standard
                // material surface. If surface colors are not overridden by
                // providing none null custom surface colors values to the
                // FlexColorScheme, the results is the same as material.
                surface = FlexColor.materialLightSurface;
                background = FlexColor.materialLightBackground;
                scaffoldBackground = FlexColor.materialLightScaffoldBackground;
              }
              break;
          }
        }
        break;
      case Brightness.dark:
        {
          switch (themeSurface ?? FlexSurface.material) {
            case FlexSurface.material:
              {
                surface = FlexColor.materialDarkSurface;
                background = FlexColor.materialDarkBackground;
                scaffoldBackground = FlexColor.materialDarkScaffoldBackground;
              }
              break;
            case FlexSurface.light:
              {
                surface = FlexColor.darkSurface
                    .blend(_primary, _kDarkBlendSurfaceLight);
                background = FlexColor.darkBackground
                    .blend(_primary, _kDarkBlendBackgroundLight);
                scaffoldBackground = FlexColor.darkScaffoldBackground;
              }
              break;
            case FlexSurface.medium:
              {
                surface = FlexColor.darkSurface
                    .blend(_primary, _kDarkBlendSurfaceMedium);
                background = FlexColor.darkBackground
                    .blend(_primary, _kDarkBlendBackgroundMedium);
                scaffoldBackground = FlexColor.darkScaffoldBackground;
              }
              break;
            case FlexSurface.strong:
              {
                surface = FlexColor.darkSurface
                    .blend(_primary, _kDarkBlendSurfaceStrong);
                background = FlexColor.darkBackground
                    .blend(_primary, _kDarkBlendBackgroundStrong);
                scaffoldBackground = FlexColor.darkScaffoldBackground;
              }
              break;
            case FlexSurface.heavy:
              {
                surface = FlexColor.darkSurface
                    .blend(_primary, _kDarkBlendSurfaceHeavy);
                background = FlexColor.darkBackground
                    .blend(_primary, _kDarkBlendBackgroundHeavy);
                scaffoldBackground = FlexColor.darkScaffoldBackground
                    .blend(_primary, _kDarkBlendScaffoldHeavy);
              }
              break;
            case FlexSurface.custom:
              {
                // Custom surface theme returns same surface as standard
                // material surface. If surface colors are not overridden by
                // providing none null custom surface colors values to the
                // FlexColorScheme, the results is the same as material.
                surface = FlexColor.materialDarkSurface;
                background = FlexColor.materialDarkBackground;
                scaffoldBackground = FlexColor.materialDarkScaffoldBackground;
              }
              break;
          }
        }
        break;
    }

    return SchemeSurfaceColors(
      surface: surface,
      background: background,
      scaffoldBackground: scaffoldBackground,
    );
  }

  /// The background color for widgets like [Card].
  final Color surface;

  /// A color that typically appears behind scrollable content.
  final Color background;

  /// The color of the scaffold background.
  final Color scaffoldBackground;
}

/// Immutable data class used to hold the "on" colors for displaying text
/// and icons on the surface, background, error colors and the primary and
/// secondary colors.
///
/// Normally the on colors are not provided manually but computed by using the
/// [SchemeOnColors.from] static function that uses the
/// [ThemeData.estimateBrightnessForColor] static function for each on color
/// and returns a [SchemeOnColors] object with the appropriate colors.
///
/// PrimaryVariant and SecondaryVariant do not have their own onColor. This is
/// a limitation imposed by the Flutter SDK [ColorScheme] class and [ThemeData]
/// using it. It is assumed that the onColor for primary and secondary colors
/// will work also work OK for their variants. This is usually correct if the
/// variant colors are close in brightness to the none variant
/// version. Scaffold background color that FlexColorScheme allows us to define
/// separately also does not have its own on color, it is assumed that it is
/// close in brightness to the background color s it uses the same on color
/// as background.
@immutable
class SchemeOnColors {
  /// Default constructor.
  const SchemeOnColors({
    this.onPrimary,
    this.onSecondary,
    this.onSurface,
    this.onBackground,
    this.onError,
  });

  /// Compute on colors for required primary, secondary, surface, background
  /// and error colors and returns a valid [SchemeOnColors] with correct on
  /// colors for these colors.
  ///
  /// If an optional on color value is given as input, the value for that
  /// particular on color will be used instead of the computed on color value
  /// for the corresponding provided color.
  factory SchemeOnColors.from({
    @required Color primary,
    @required Color secondary,
    @required Color surface,
    @required Color background,
    @required Color error,
    Color onPrimary,
    Color onSecondary,
    Color onSurface,
    Color onBackground,
    Color onError,
  }) {
    // Our reference colors that we compute on colors for cannot be null
    assert(primary != null, 'Primary color may not be null.');
    assert(secondary != null, 'Secondary color may not be null.');
    assert(surface != null, 'Surface color may not be null.');
    assert(background != null, 'Background color may not be null.');
    assert(error != null, 'Error color may not be null.');

    // Check brightness of primary, secondary, error, surface and background
    // colors, then calculate appropriate colors for their onColors, if an
    // "on" color was not passed in, otherwise we just use its given color.
    final Color _onPrimary = onPrimary ??
        (ThemeData.estimateBrightnessForColor(primary) == Brightness.dark
            ? Colors.white
            : Colors.black);
    final Color _onSecondary = onSecondary ??
        (ThemeData.estimateBrightnessForColor(secondary) == Brightness.dark
            ? Colors.white
            : Colors.black);
    final Color _onError = onError ??
        (ThemeData.estimateBrightnessForColor(error) == Brightness.dark
            ? Colors.white
            : Colors.black);

    final Color _onSurface = onSurface ??
        (ThemeData.estimateBrightnessForColor(surface) == Brightness.dark
            ? Colors.white
            : Colors.black);

    final Color _onBackground = onBackground ??
        (ThemeData.estimateBrightnessForColor(background) == Brightness.dark
            ? Colors.white
            : Colors.black);

    return SchemeOnColors(
      onPrimary: _onPrimary,
      onSecondary: _onSecondary,
      onSurface: _onSurface,
      onBackground: _onBackground,
      onError: _onError,
    );
  }

  /// A color that's clearly legible when drawn on primary color.
  final Color onPrimary;

  /// A color that's clearly legible when drawn on secondary color.
  final Color onSecondary;

  /// A color that's clearly legible when drawn on surface color.
  final Color onSurface;

  /// A color that's clearly legible when drawn on background color also used
  /// as on color for scaffold background color.
  final Color onBackground;

  /// A color that's clearly legible when drawn on error color.
  final Color onError;
}
