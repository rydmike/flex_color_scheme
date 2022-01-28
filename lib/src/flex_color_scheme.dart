import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'flex_color.dart';
import 'flex_constants.dart';
import 'flex_extensions.dart';
import 'flex_scheme.dart';
import 'flex_sub_themes.dart';
import 'flex_sub_themes_data.dart';

// ignore_for_file: comment_references

/// Enum for using predefined surface branding strengths in [FlexColorScheme]
/// based themes.
///
/// This enum was used in [FlexColorScheme] versions before 4.0.0 in factory
/// constructors [FlexColorScheme.light] and [FlexColorScheme.dark].
///
/// The properties using this enum are deprecated since version 4.2.0.
/// Migrate to using the enum [FlexSurfaceMode]
/// parameter `surfaceMode` instead, that replaces `surfaceStyle` and
/// offers more surface color blend modes and levels.
enum FlexSurface {
  /// Use Material design default light and dark surface and background colors.
  ///
  /// In light theme this is Colors.white and in dark theme it is
  /// Color(0xFF121212) for Theme colorsScheme.surface, colorScheme.background
  /// and all other background colors in ThemeData() used by Material.
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
  ///
  /// If you set this option you can use it as a mode to indicate in your
  /// theme definition logic that you will provide the surface colors
  /// separately.
  custom,
}

/// Enum for using predefined surface blend modes for surface and background
/// colors in [FlexColorScheme] based themes.
///
/// The mode [highBackgroundLowScaffold] is the closest equivalent to the style
/// used in [FlexColorScheme] before version 4 via the to be deprecated
/// [FlexSurface] enum property [surfaceStyle] in [FlexColorScheme.light] and
/// [FlexColorScheme.dark] factories.
enum FlexSurfaceMode {
  /// All surfaces have same alpha blend level including scaffold background.
  ///
  /// The blend level is at equal strength as set by blendLevel,
  /// the blend strength mix definition is:
  ///
  /// * Scaffold background, surface, dialogs, background: (1x)
  ///
  /// This mode results in elevation overlay color on [Material] type
  /// [MaterialType.card], [MaterialType.canvas] and [MaterialType.circle]
  /// themed background color in dark theme mode.
  ///
  /// In surface modes that use different blend strengths and blend color,
  /// that differs from the value used for colorScheme.surface,
  /// those [Material] surfaces will not get
  /// elevation overlay color in dark mode, even if set to on. For more
  /// information see issue: https://github.com/flutter/flutter/issues/90353
  level,

  /// Decreasing blend level in order background, surface, scaffold.
  ///
  /// The blend level decreases on surfaces in this order:
  ///
  /// * Background (3/2x)
  /// * Surface & dialogs (1x)
  /// * Scaffold (1/2x)
  ///
  /// Theme colorScheme.primary color is used as blend color on all surfaces.
  ///
  /// In combination with the blend level [FlexColorScheme.blendLevel], it
  /// results in a style where scaffold background has a much lower blend
  /// strength, 1/3x of blend level value and remains mostly unbranded at
  /// low blend levels. Surface uses the blend level value, and
  /// background gets 3/2x the blend level value.
  ///
  /// The mode [FlexSurfaceMode.highBackgroundLowScaffold] can be used to
  /// replace the style that is produced when using
  /// [FlexColorScheme.surfaceStyle] enum property [FlexSurface] in
  /// [FlexColorScheme.light] and [FlexColorScheme.dark]. The mode
  /// [FlexSurfaceMode.highBackgroundLowScaffold] uses the same design concept
  /// as the only style offered by [FlexSurface] in
  /// [FlexColorScheme.surfaceStyle] in use before version 4.
  ///
  /// By adjusting the [FlexColorScheme.blendLevel] property and using this
  /// style, you can find a similar visual effect when using
  /// [FlexSurfaceMode.highBackgroundLowScaffold] with the following values when
  /// matching match most prominent blended [ColorScheme.background] color.
  ///
  /// In light theme mode:
  ///
  /// * [FlexSurface.material] 0% : blendLevel = 0
  /// * [FlexSurface.light]    2% : blendLevel = 3...4
  /// * [FlexSurface.medium]   4% : blendLevel = 7
  /// * [FlexSurface.strong]   6% : blendLevel = 10
  /// * [FlexSurface.heavy]    8% : blendLevel = 13...14
  ///
  /// In dark theme mode:
  ///
  /// * [FlexSurface.material] 0% : blendLevel = 0
  /// * [FlexSurface.light]    5% : blendLevel = 8
  /// * [FlexSurface.medium]   8% : blendLevel = 13...14
  /// * [FlexSurface.strong]  11% : blendLevel = 19
  /// * [FlexSurface.heavy]   14% : blendLevel = 23
  ///
  /// Since there is not the same relationship between background and
  /// surface, when using the older [FlexSurface] based style, that uses
  /// individually tuned relationships. The old and new designs do never
  /// align exactly at any blendLevel. The above values produce visually
  /// similar results for the most prominent background color blend.
  ///
  /// To get elevation overlay color in dark themes on all surfaces used by
  /// [Material], use one of the modes where background and dialog color equals
  /// the blend strength on surface color, like [level],
  /// [levelSurfacesLowScaffold], [highScaffoldLowSurfaces] and
  /// [highScaffoldLowSurfaces]. Other modes will only use
  /// elevation overlay if their background happens to be equal to resulting
  /// colorScheme.surface color. For more information
  /// see issue: https://github.com/flutter/flutter/issues/90353
  ///
  /// When using very strong surface branding in dark mode, having an overlay
  /// elevation color in dark mode is less critical, since the elevation
  /// becomes partially visible via shadows and the surface may even have
  /// another color tint if using e.g. [levelSurfacesLowScaffoldVariantDialog]
  /// or [highScaffoldLowSurfacesVariantDialog].
  highBackgroundLowScaffold,

  /// Decreasing blend level in order surface, background, scaffold.
  ///
  /// The blend level decreases on surfaces in this order:
  ///
  /// * Surface & dialogs (3/2x)
  /// * Background (1x)
  /// * Scaffold (1/2x)
  ///
  /// Theme colorScheme.primary color is used as blend color on all surfaces.
  ///
  /// To get elevation overlay color in dark themes on all surfaces used by
  /// [Material], use one of the modes where background and dialog color equals
  /// the blend strength on surface color, like [level],
  /// [levelSurfacesLowScaffold], [highScaffoldLowSurfaces] and
  /// [highScaffoldLowSurfaces]. Other modes will only use
  /// elevation overlay if their background happens to be equal to resulting
  /// colorScheme.surface color. For more information
  /// see issue: https://github.com/flutter/flutter/issues/90353
  ///
  /// When using very strong surface branding in dark mode, having an overlay
  /// elevation color in dark mode is less critical, since the elevation
  /// becomes partially visible via shadows and the surface may even have
  /// another color tint if using e.g. [levelSurfacesLowScaffoldVariantDialog]
  /// or [highScaffoldLowSurfacesVariantDialog].
  highSurfaceLowScaffold,

  /// Decreasing blend level in order scaffold, background, surface.
  ///
  /// The blend level decreases on surfaces in this order:
  ///
  /// * Scaffold (3x)
  /// * Background (1x)
  /// * Surface & dialogs (1/2x)
  ///
  /// Theme colorScheme.primary color is used as blend color on all surfaces.
  ///
  /// To get elevation overlay color in dark themes on all surfaces used by
  /// [Material], use one of the modes where background and dialog color equals
  /// the blend strength on surface color, like [level],
  /// [levelSurfacesLowScaffold], [highScaffoldLowSurfaces] and
  /// [highScaffoldLowSurfaces]. Other modes will only use
  /// elevation overlay if their background happens to be equal to resulting
  /// colorScheme.surface color. For more information
  /// see issue: https://github.com/flutter/flutter/issues/90353
  ///
  /// When using very strong surface branding in dark mode, having an overlay
  /// elevation color in dark mode is less critical, since the elevation
  /// becomes partially visible via shadows and the surface may even have
  /// another color tint if using e.g. [levelSurfacesLowScaffoldVariantDialog]
  /// or [highScaffoldLowSurfacesVariantDialog].
  highScaffoldLowSurface,

  /// Decreasing blend level in order scaffold, background, surface.
  ///
  /// The blend level decreases on surfaces in this order:
  ///
  /// * Scaffold (3x)
  /// * Background (3/2x)
  /// * Surface (1x)
  ///
  /// Theme colorScheme.primary color is used as blend color on all surfaces.
  ///
  /// To get elevation overlay color in dark themes on all surfaces used by
  /// [Material], use one of the modes where background and dialog color equals
  /// the blend strength on surface color, like [level],
  /// [levelSurfacesLowScaffold], [highScaffoldLowSurfaces] and
  /// [highScaffoldLowSurfaces]. Other modes will only use
  /// elevation overlay if their background happens to be equal to resulting
  /// colorScheme.surface color. For more information
  /// see issue: https://github.com/flutter/flutter/issues/90353
  ///
  /// When using very strong surface branding in dark mode, having an overlay
  /// elevation color in dark mode is less critical, since the elevation
  /// becomes partially visible via shadows and the surface may even have
  /// another color tint if using e.g. [levelSurfacesLowScaffoldVariantDialog]
  /// or [highScaffoldLowSurfacesVariantDialog].
  highScaffoldLevelSurface,

  /// Decreasing blend level in order background & surface, scaffold.
  ///
  /// The blend level decreases on surfaces in this order:
  ///
  /// * Surface & background (1x)
  /// * Scaffold (1/2x)
  ///
  /// Theme colorScheme.primary color is used as blend color.
  ///
  /// This mode results in elevation overlay color on [Material] type
  /// [MaterialType.card], [MaterialType.canvas] and [MaterialType.circle]
  /// themed background color in dark theme mode. In surface modes that
  /// use different blend strengths and blend color, that differs from the value
  /// used for colorScheme.surface, those [Material] surfaces will not get
  /// elevation overlay color in dark mode, even if set to on. For more
  /// information see issue: https://github.com/flutter/flutter/issues/90353
  levelSurfacesLowScaffold,

  /// Decreasing blend level in order scaffold, background & surface.
  ///
  /// The blend level decreases on surfaces in this order:
  ///
  /// * Scaffold (3x)
  /// * Surface & background (1/2x)
  ///
  /// Theme colorScheme.primary color is used as blend color.
  ///
  /// This mode results in elevation overlay color on [Material] type
  /// [MaterialType.card], [MaterialType.canvas] and [MaterialType.circle]
  /// themed background color in dark theme mode. In surface modes that
  /// use different blend strengths and blend color, that differs from the value
  /// used for colorScheme.surface, those [Material] surfaces will not get
  /// elevation overlay color in dark mode, even if set to on. For more
  /// information see issue: https://github.com/flutter/flutter/issues/90353
  highScaffoldLowSurfaces,

  /// Decreasing blend level in order background & surface, scaffold.
  ///
  /// The blend level decreases on surfaces in this order:
  ///
  /// * Surface, background, dialogs (1x)
  /// * Scaffold (1/2x)
  ///
  /// Theme colorScheme.primary color is used as blend color, but dialog
  /// background color uses theme colorScheme.secondaryVariant as its
  /// blend color.
  ///
  /// This modes results in elevation overlay color on all Material types and
  /// background colors in dark theme mode, except dialogs that do NOT get any
  /// elevation overlay color. This happens because Dialogs use the
  /// colorScheme.secondaryVariant color for their blend color which typically
  /// differs from the primary color used on surface color.
  ///
  /// To get elevation overlay color in dark themes on all surfaces used by
  /// [Material], use one of the modes where background and dialog color equals
  /// the blend strength on surface color, like [level],
  /// [levelSurfacesLowScaffold], [highScaffoldLowSurfaces] and
  /// [highScaffoldLowSurfaces]. Other modes will only use elevation overlay
  /// if their background happens to be equal to resulting
  /// colorScheme.surface color. For more information
  /// see issue: https://github.com/flutter/flutter/issues/90353
  ///
  /// The color scheme secondary variant color is a good place in theme colors
  /// to store a custom color you may want to use for special elements on custom
  /// widgets in your application. The secondary variant color is not used
  /// by default by any widget in Flutter SDK, so it can be assigned a color
  /// without affecting any default color behaviour of SDK widgets. If you do so
  /// and want to get some funky dialog blends using this color, you can use
  /// this surface mode.
  levelSurfacesLowScaffoldVariantDialog,

  /// Decreasing blend level in order scaffold, background & surface.
  ///
  /// The blend level decreases on surfaces in this order:
  ///
  /// * Scaffold (3x)
  /// * Surface, background, dialogs (1/2x)
  ///
  /// Theme colorScheme.primary color is used as blend color, but dialog
  /// background uses theme colorScheme.secondaryVariant as its blend color.
  ///
  /// This modes results in elevation overlay color on all Material types and
  /// background colors in dark theme mode, except dialogs that do NOT get any
  /// elevation overlay color. This happens because Dialogs use the
  /// colorScheme.secondaryVariant color for their blend color which typically
  /// differs from the primary color used on surface color.
  ///
  /// To get elevation overlay color in dark themes on all surfaces used by
  /// [Material], use one of the modes where background and dialog color equals
  /// the blend strength on surface color, like [level],
  /// [levelSurfacesLowScaffold], [highScaffoldLowSurfaces] and
  /// [highScaffoldLowSurfaces]. Other modes will only use
  /// elevation overlay if their background happens to be equal to resulting
  /// colorScheme.surface color. For more information
  /// see issue: https://github.com/flutter/flutter/issues/90353
  ///
  /// The color scheme secondary variant color is a good place in theme colors
  /// to store a custom color you may want to use for special elements on custom
  /// widgets in your application. The secondary variant color is not used
  /// by default by any widget in Flutter SDK, so it can be assigned a color
  /// without affecting any default color behaviour of SDK widgets. If you do so
  /// and want to get some funky dialog blends using this color, you can use
  /// this surface mode.
  highScaffoldLowSurfacesVariantDialog,

  /// Use your own custom surface and background blend style.
  ///
  /// Use this option and use the [FlexSchemeSurfaceColors.blend] constructor
  /// to make your custom surface colors using the applied blend levels.
  custom,
}

/// Enum to select the used AppBarTheme style in [FlexColorScheme] based themes
/// when using its `light` and `dark` factories.
enum FlexAppBarStyle {
  /// Use the scheme primary color as the AppBar's themed background color.
  ///
  /// This is the default for light themes.
  primary,

  /// Use Material surface color as the AppBar's themed background color.
  ///
  /// This is the default for dark schemes.
  ///
  /// For a dark scheme this choice will result in a near black app bar. If this
  /// setting is used in a light scheme, it will result in a white app bar, as
  /// the standard Material surface color for light scheme is white.
  material,

  /// Use scheme surface color as the the AppBar's themed background color,
  /// including any blend color it may have.
  surface,

  /// Use scheme background color as the the AppBar's themed background color,
  /// including any blend color it may have.
  background,

  /// Use a custom [AppBar] background color as its themed background color.
  ///
  /// If you provide a color value to [FlexColorScheme.appBarBackground]
  /// color directly, it will be used as the themed [AppBar] background color.
  ///
  /// If it is not defined, then the [appBarColor] defined in passed in
  /// [FlexSchemeColor] property [colors] is used when using the
  /// factories [FlexColorScheme.light] and [FlexColorScheme.dark], as the
  /// custom color for the [AppBar] theme.
  ///
  /// The built-in color schemes have the same color value that is assigned to
  /// [FlexSchemeColor.secondaryVariant] also assigned to
  /// [FlexSchemeColor.appBarColor], so with them, the custom choice always
  /// results in the [FlexSchemeColor.secondaryVariant] color, which is same
  /// as output [ColorScheme.secondaryVariant], being used as the [AppBar] color
  /// when using the [custom] choice with them.
  ///
  /// FlexColorSchemes using custom [FlexSchemeColor] can assign any color
  /// to their [FlexSchemeColor.appBarColor] color. It does not have to be
  /// a part of the colors that exist in the standard [ColorScheme].
  ///
  /// If there is no custom color definition in above paths when using the
  /// [custom] style, the [AppBar] color will be same as with [material] choice.
  custom,
}

/// Enum used to define the [SystemUiOverlayStyle] for the system navigation
/// bar.
///
/// Used with the [FlexColorScheme.themedSystemNavigationBar]
/// helper to select the background style of system navigation bar when using
/// the helper in an [AnnotatedRegion] to style the system navigation bar.
enum FlexSystemNavBarStyle {
  /// Standard Android system style, white in light theme and black in
  /// dark theme.
  system,

  /// The system navigation bar will be the same color as active theme
  /// colorScheme.surface color. If your FlexColorScheme definition is set to
  /// use primary branded surface and background colors, the same primary
  /// color blend that the surface color has received will be used.
  surface,

  /// The system navigation bar will be the same color as active theme
  /// colorScheme.background color. If your FlexColorScheme definition is set
  /// to use primary branded surface and background colors, the same primary
  /// color blend that the background color has received will be used.
  background,

  /// The system navigation bar will be the same color as active theme
  /// scaffoldBackground color. If your FlexColorScheme definition is set
  /// to use primary branded surface and background colors, the same primary
  /// color blend that the scaffoldBackground color has received will be used.
  scaffoldBackground,

  /// Make the system navigation bar fully transparent, showing the background,
  /// while navigation buttons float over the background.
  /// For this to work Android SDK has to be >= 29.
  ///
  /// The fully transparent system navigation bar works well when there is a
  /// bottom navigation bar with some opacity, you can then share the same
  /// background as it has with the system navigation bar, using same color
  /// and opacity as on the bottom navigation bar, creating one shared surface
  /// with same color and opacity on bottom navigation bar and the system
  /// navigation bar. The package readme includes on example of this.
  transparent,
}

/// Enum to select [TabBarTheme] preference in [FlexColorScheme] based themes.
enum FlexTabBarStyle {
  /// Themed to fit with active [FlexAppBarStyle] and [AppBarTheme].
  ///
  /// Indicator, text and icons contrast well with AppBar background color,
  /// regardless of chosen [FlexAppBarStyle].
  ///
  /// This is the default style for FlexColorScheme based themes and typically
  /// the style you want.
  forAppBar,

  /// Themed to fit with current background and surface colors.
  ///
  /// Indicator, text and icons contrast with background and surface colors
  /// via primary color.
  ///
  /// If you intend to use your TabBar's only on surfaces, like Scaffold
  /// or in cards using default theme background color, then use this style.
  /// If you use an AppBar theme that is surface colored in both light and dark
  /// theme, then this style will also work well when the TabBar is used
  /// in the AppBar, as well as on surfaces.
  forBackground,

  /// Make a [TabBarTheme] sub-theme that equals the style you get with
  /// ThemeData.from constructor and Widget default values in Flutter SDK.
  ///
  /// This works well with default primary colored AppBar's in light
  /// theme and dark surface colored AppBars or other dark surfaces in dark
  /// theme. It does not work with all app bar styles supported by
  /// [FlexColorScheme], prefer using [forAppBar] for that.
  flutterDefault,

  /// An experimental [TabBarTheme] mode that works on both primary and
  /// background colors.
  ///
  /// This theme is more low contrast than the themes explicitly designed
  /// for their target surface. Use with caution, with some combinations
  /// the style may have poor contrast and look disabled.
  ///
  /// WARNING: This feature is experimental and its resulting style
  /// might be modified to improve it in future versions. Changes to the
  /// produced style will not be considered breaking, only as a fix.
  ///
  /// Prefer using [forAppBar] or [forBackground] depending on where you
  /// primarily intend to use your tab bars.
  universal,
}

/// Make beautiful Flutter themes using pre-designed color schemes or custom
/// colors. Get the resulting [ThemeData] with the [toTheme] method.
///
/// Flutter's [ThemeData.from] is a good starting point for [ColorScheme] based
/// themes. It has a some gaps leaving some properties in the theme
/// to their defaults from the standard [ThemeData] factory constructor, those
/// default values will end up not matching the used [ColorScheme], especially
/// in dark mode themes. [FlexColorScheme] fixes these gaps and makes it much
/// easier to create themes using the color scheme concept.
///
/// You can create the theme using a standard [ColorScheme], but you can also
/// create a theme by just providing a few selected color values, or
/// no color values at all and get defaults. If you provide both a [ColorScheme]
/// and some individual property values that also exist in a [ColorScheme], the
/// individual property values will override the corresponding ones in your
/// [ColorScheme].
///
/// [FlexColorScheme] does not rely on [ThemeData.from] a [ColorScheme] for
/// its implementation. It uses the [ThemeData] factory directly to create the
/// [ThemeData] object from its [FlexColorScheme] data, that is then returned
/// with the [FlexColorScheme.toTheme] getter.
///
/// A more opinionated theme and style can be returned by setting
/// [FlexColorScheme.useSubThemes] to true.
///
/// By default the sub themes take inspiration from the Material 3 (M3) Design
/// guide [specification](https://m3.material.io) and uses its values as
/// defaults when it is possible to do so in Flutter
/// SDK theming, within its current Material 2 (M2) design limitations.
///
/// The sub-themes can configured further by passing a custom
/// [FlexSubThemesData] to [FlexColorScheme.subThemesData]. The main sub theme
/// feature is an easy way to adjust the default corner radius on
/// all sub themes for widgets that supports it. The design is also a bit more
/// flat and features primary tinted hover, focus, highlight and splash colors.
///
/// It can be verbose to define nice color scheme directly with the class
/// default constructor. [FlexColorScheme] is primarily intended to be used
/// with its two factory constructors [FlexColorScheme.light] and
/// [FlexColorScheme.dark], that create nice schemes using defaults and
/// computed color values. The light and dark schemes also give you easy access
/// to many predefined color schemes that you can use and easily modify.
///
/// With the light and dark factories you can also create
/// beautiful toned themes from just a single color. The light and dark
/// factories also provide properties that enables you to create themes with
/// primary color alpha blended surfaces automatically. You can customize all
/// properties with the factories as well, but you usually you don't have to.
///
/// [FlexColorScheme] makes it easy to create themes that use color branded
/// surfaces (backgrounds), that use alpha blend, to mix in a varying degree
/// of a color, typically the primary color, into surfaces and backgrounds.
/// Branded surface are described in the Material design guide, but Flutter
/// offers no out of the box help to make such themes. With [FlexColorScheme]
/// you can use a varying degree of surface and background branding levels for
/// any theme you make, both in light and dark mode.
///
/// [FlexColorScheme] makes it easier to make a theme where the [AppBar]
/// themed background color is not tied to primary color in light theme mode or
/// to surface color in dark theme mode, and it can also follow the branded
/// scheme surface or background color.
///
/// [FlexColorScheme] can also adjust the [TabBarTheme] to fit with the
/// active [AppBar] background or to be themed to always fit on
/// background/surface colors, if its primary usage will be in e.g. a [Scaffold]
/// body, or [Material] surface or canvas.
///
/// You can also quickly adjust things like the scrim on the app bar in Android
/// with [transparentStatusBar] and tooltip style with
/// [tooltipsMatchBackground].
@immutable
class FlexColorScheme with Diagnosticable {
  /// Default constructor that requires [brightness] and four main color scheme
  /// color properties in order to make a fully defined color scheme for
  /// a [ThemeData] object.
  ///
  /// For more convenient usage of [FlexColorScheme] consider using its two
  /// factory constructors [FlexColorScheme.light] and [FlexColorScheme.dark],
  /// that can create schemes using defaults and computed color values, with
  /// custom overrides as needed.
  ///
  /// The two factories also contain additional properties that can be used to
  /// create color branded surfaces, toggle the [AppBarTheme] between a few
  /// styles, and to make dark themes that use true black backgrounds and
  /// surfaces.
  const FlexColorScheme({
    final this.colorScheme,
    final this.brightness,
    final this.primary,
    final this.primaryVariant,
    final this.secondary,
    final this.secondaryVariant,
    final this.error,
    final this.surface,
    final this.background,
    final this.scaffoldBackground,
    final this.dialogBackground,
    final this.appBarBackground,
    final this.onPrimary,
    final this.onSecondary,
    final this.onSurface,
    final this.onBackground,
    final this.onError,
    final this.tabBarStyle = FlexTabBarStyle.forAppBar,
    final this.appBarElevation = 0,
    final this.bottomAppBarElevation = 0,
    final this.tooltipsMatchBackground = false,
    final this.transparentStatusBar = true,
    final this.visualDensity,
    final this.textTheme,
    final this.primaryTextTheme,
    final this.fontFamily,
    final this.platform,
    final this.typography,
    final this.applyElevationOverlayColor = true,
    final this.useSubThemes = false,
    final this.subThemesData,
  })  : assert(appBarElevation >= 0.0, 'AppBar elevation must be >= 0.'),
        assert(bottomAppBarElevation >= 0.0,
            'Bottom AppBar elevation must be >= 0.');

  /// The overall [ColorScheme] based colors for the theme.
  ///
  /// This property provides a new way to define custom colors for
  /// [FlexColorScheme] and is available from version 4.2.0. It is useful if
  /// you already have a custom [ColorScheme] based color definition that
  /// you want to use with FlexColorScheme theming and its sub-theming
  /// capabilities. This will become particularly useful when using Material 3
  /// based design and its seed generated color schemes.
  ///
  /// If you provide both a [ColorScheme] and some individual direct property
  /// values that also exist in a [ColorScheme], the individual property values
  /// will override the corresponding ones in your [ColorScheme].
  ///
  /// If you do not define a color scheme, the individual color value properties
  /// and their defaults are used to define your effective color scheme.
  ///
  /// The [FlexColorScheme]'s effective [ColorScheme] can be returned with
  /// [toScheme]. This will always get you a complete color scheme, including
  /// calculated and derived color values, which is particularly useful when
  /// using the [FlexColorScheme.light] and [FlexColorScheme.dark] factories
  /// to compute color scheme branded surface colors for you. The effective
  /// [ColorScheme] for your theme is often needed if you want to create custom
  /// sub-themes that should use the colors from the scheme using none default
  /// color assignments from the color scheme.
  final ColorScheme? colorScheme;

  /// The overall brightness of this color scheme.
  ///
  /// The [Brightness.light] denotes a theme for light theme mode and
  /// [Brightness.dark] a dark theme mode. The colors you define should match
  /// the used [brightness] value in order for the theme to make visual sense.
  ///
  /// If not defined, and if there is no [colorScheme] defined, it defaults
  /// to [Brightness.light].
  final Brightness? brightness;

  /// The color displayed most frequently across your application’s screens and
  /// components.
  ///
  /// If not defined and if there is no [colorScheme] defined, and [brightness]
  /// is [Brightness.light] it defaults to [FlexColor.materialLightPrimary].
  /// If not defined and if there is no [colorScheme] defined, and [brightness]
  /// is [Brightness.dark] it defaults to [FlexColor.materialDarkPrimary].
  final Color? primary;

  /// A darker version of the primary color.
  ///
  /// In Flutter SDK the [primaryVariant] color is only used by [SnackBar]
  /// button color in dark theme mode as a part of predefined widget behavior.
  /// If you provide a custom [SnackBarThemeData] where you define
  /// [SnackBarThemeData.actionTextColor] to [primary] or [secondary], this
  /// color property becomes a good property to use if you need a custom color
  /// for custom widgets accessible via your application's ThemeData, that is
  /// not used as default color by any other built-in widgets. This applies
  /// to Flutter 2.8.1 and earlier versions.
  ///
  /// The property is being deprecated in Flutter SDK and will be replaced
  /// by a new property called primaryContainer. It is deprecated from
  /// master v2.6.0-0.0.pre, but has not yet reached stable (2.8.1).
  /// See https://github.com/flutter/flutter/issues/89852.
  ///
  /// If not defined, and if there is no [colorScheme] defined, it will be
  /// computed from [primary] color.
  final Color? primaryVariant;

  /// An accent color that, when used sparingly, calls attention to parts
  /// of your application.
  ///
  /// If not defined, and if there is no [colorScheme] defined, it will be
  /// computed from [primary] color.
  final Color? secondary;

  /// A darker version of the secondary color.
  ///
  /// In Flutter SDK the [secondaryVariant] color is not used by in any
  /// built-in widgets default themes or predefined widget behavior.
  /// It is an excellent property to use if you need a custom color for
  /// custom widgets accessible via your application's ThemeData, and that is
  /// not used as default color by any built-in widgets. So you are
  /// Flutter 2.5.2 and earlier version free to set it to whatever color you
  /// need and not affect any built-in widgets theme based colors.
  ///
  /// The property is being deprecated in Flutter SDK and will be replaced
  /// by a new property called secondaryContainer. It is deprecated from
  /// master v2.6.0-0.0.pre, but has not yet reached stable (2.8.1).
  /// See https://github.com/flutter/flutter/issues/89852.
  ///
  /// If not defined, and if there is no [colorScheme] defined, it will be
  /// computed from [secondary] color, and if it
  /// is not defined either then from [primary] color.
  final Color? secondaryVariant;

  /// The color to use for input validation errors, e.g. for
  /// [InputDecoration.errorText].
  ///
  /// If no value is given, and if there is no [colorScheme] defined, it
  /// defaults to [FlexColor.materialLightError] if
  /// brightness is light and to [FlexColor.materialDarkError] if brightness
  /// is dark.
  final Color? error;

  /// The surface (background) color for widgets like [Card] and
  /// [BottomAppBar].
  ///
  /// The color is applied to [ThemeData.cardColor] and
  /// [ColorScheme.surface] in [ThemeData.colorScheme], it is also used
  /// by all [Material] of type [MaterialType.card].
  ///
  /// If no value is given, and if there is no [colorScheme] defined, it
  /// defaults to [FlexColor.materialLightSurface] if
  /// brightness is light and to [FlexColor.materialDarkSurface] if
  /// brightness is dark.
  final Color? surface;

  /// A color that typically appears behind scrollable content.
  ///
  /// The color is applied to [ThemeData.canvasColor] and
  /// [ThemeData.backgroundColor], it is used eg by menu [Drawer] and by all
  /// [Material] of type [MaterialType.canvas].
  ///
  /// If no value is given, and if there is no [colorScheme] defined, it
  /// defaults to [FlexColor.materialLightBackground]
  /// if brightness is light and to [FlexColor.materialDarkBackground] if
  /// brightness is dark.
  final Color? background;

  /// The color of the [Scaffold] background.
  ///
  /// The color is applied to [ThemeData.scaffoldBackgroundColor].
  ///
  /// This color cannot be controlled separately with Flutter's standard
  /// [ColorScheme] based themes. FlexColorScheme brings back the possibility
  /// to specify it directly when using color scheme based themes.
  ///
  /// If no color is given, it defaults to [background].
  final Color? scaffoldBackground;

  /// The background color of [Dialog] elements.
  ///
  /// The color is applied to [ThemeData.dialogBackgroundColor].
  ///
  /// If no value is given, it defaults to [surface].
  final Color? dialogBackground;

  /// Background theme color for the [AppBar].
  ///
  /// This theme color cannot be controlled separately with Flutter's standard
  /// [ThemeData.from] a [ColorScheme]. FlexColorScheme enables you to specify
  /// an app bar theme color that is independent of the primary color in light
  /// theme and in dark mode of the dark theme's dark surface color.
  ///
  /// If no color is given it defaults to the Flutter standard color scheme
  /// based light and dark app bar theme colors.
  final Color? appBarBackground;

  /// A color that is clearly legible when drawn on [primary] color.
  ///
  /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
  /// [primary] and [onPrimary] is recommended. See
  /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
  ///
  /// If null, the on color is derived from the brightness of the [primary]
  /// color, and will be be black if it is light and white if it is dark.
  final Color? onPrimary;

  /// A color that is clearly legible when drawn on [secondary] color.
  ///
  /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
  /// [secondary] and [onSecondary] is recommended. See
  /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
  ///
  /// If null, the on color is derived from the brightness of the [secondary]
  /// color, and will be be black if it is light and white if it is dark.
  final Color? onSecondary;

  /// A color that is clearly legible when drawn on [surface] color.
  ///
  /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
  /// [surface] and [onSurface] is recommended. See
  /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
  ///
  /// If null, the on color is derived from the brightness of the [surface]
  /// color, and will be be black if it is light and white if it is dark.
  final Color? onSurface;

  /// A color that is clearly legible when drawn on [background] color.
  ///
  /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
  /// [background] and [onBackground] is recommended. See
  /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
  ///
  /// If null, the on color is derived from the brightness of the [background]
  /// color, and will be be black if it is light and white if it is dark.
  final Color? onBackground;

  /// A color that is clearly legible when drawn on [error] color.
  ///
  /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for [error]
  /// and [onError] is recommended. See
  /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
  ///
  /// If null, the on color is derived from the brightness of the [error]
  /// color, and will be be black if it is light and white if it is dark.
  final Color? onError;

  /// Select preferred style for the default [TabBarTheme].
  ///
  /// By default the TabBarTheme is made to fit with the style of the AppBar,
  /// via default value [FlexTabBarStyle.forAppBar].
  ///
  /// When setting this to [FlexTabBarStyle.forBackground], it will default
  /// to a theme that uses the color scheme and fits on background color,
  /// which typically also on works surface and scaffoldBackground color.
  /// This TabBarTheme style is useful if you primarily intended to use the
  /// TabBar in a Scaffold, Dialog, Drawer or Side panel on their background
  /// colors.
  final FlexTabBarStyle tabBarStyle;

  /// The themed elevation for the [AppBar].
  ///
  /// Defaults to 0, cannot be null.
  ///
  /// The 0 elevation is an iOs style
  /// influenced opinionated choice, but it can easily be adjusted for the
  /// theme with this property.
  final double appBarElevation;

  /// The themed elevation for the bottom app bar.
  ///
  /// Defaults to 0, cannot be null.
  ///
  /// The 0 default is so it matches the themed app bar elevation default,
  /// but it can easily be adjusted for the theme with this property.
  final double bottomAppBarElevation;

  /// When `true`, tooltip background color will match the brightness of the
  /// theme's background color.
  ///
  /// By default Flutter's Material tooltips use a theme where the tooltip
  /// background color brightness is inverted in relation to the overall
  /// theme's background color.
  ///
  /// FlexColorScheme allows you to use a single
  /// toggle to invert this. Light tooltips on light background is e.g. the
  /// default style on Windows Desktop. You can use this toggle to use this
  /// style, or as a means to create a platform adaptive
  /// tooltip style, where the Material/Flutter style is used on devices and
  /// Web, but the inverted scheme is used on desktop platforms.
  ///
  /// Defaults to false, and uses same background style as Material Design guide
  /// and Flutter.
  ///
  /// Regardless of value used on this property, the tooltip theme created by
  /// [FlexColorScheme] does however deviate a bit from the Flutter default
  /// theme, it has slightly larger font for improved legibility on web and
  /// desktop with device pixel ratio 1.0 and also use a padding style also
  /// suitable for multiline tooltips.
  final bool tooltipsMatchBackground;

  /// When `true`, the status bar on Android will be the same color as
  /// the rest of the AppBar.
  ///
  /// Defaults to true.
  ///
  /// When true, the AppBar in Android mimics the look of one-toned AppBar's
  /// typically used on iOS. Set it to `false` to revert back and use
  /// Android's default two-toned look. If true the status bar area is
  /// actually also transparent, then if the app bar is also translucent,
  /// content that scrolls behind it is also visible behind the status
  /// bar area.
  final bool transparentStatusBar;

  /// The density value for specifying the compactness of various UI components.
  ///
  /// Consider using [FlexColorScheme.comfortablePlatformDensity],
  /// it is similar to [VisualDensity.adaptivePlatformDensity], but the
  /// density for desktop and Web is less dense in order to offer a bit larger
  /// touch friendly surfaces, but not quite as large as small touch devices.
  ///
  /// This is the same property as in [ThemeData] factory, it is just
  /// passed along to it. Included for convenience to avoid a copyWith if
  /// to change it.
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
  ///
  /// Defaults to [VisualDensity.adaptivePlatformDensity].
  final VisualDensity? visualDensity;

  /// Text with a color that contrasts with background, surface, card and
  /// canvas colors.
  final TextTheme? textTheme;

  /// A text theme that contrasts with the primary color.
  final TextTheme? primaryTextTheme;

  /// Name of the font family to use as default for the theme.
  final String? fontFamily;

  /// The platform adaptive widgets should adapt to target and mechanics too.
  ///
  /// Same property as in [ThemeData] factory. Included for convenience to
  /// avoid a copyWith to change it.
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
  final TargetPlatform? platform;

  /// The color and geometry [TextTheme] values used to configure [textTheme].
  ///
  /// Same property as in [ThemeData] factory. Included for convenience to
  /// avoid a copyWith to change it.
  ///
  /// Included for convenience to avoid a copyWith if it needs to be changed.
  /// Default value deviates from the Flutter standard that uses the old
  /// [Typography.material2014], in favor of newer [Typography.material2018]
  /// as default typography if one is not provided.
  ///
  /// Never mix different [Typography] in light and dark theme mode. If you
  /// do, lerp between dark and light theme mode will fail due Flutter SDK
  /// not being able to handle the use case. See issue:
  /// https://github.com/flutter/flutter/issues/89947
  ///
  /// If you use a default light or
  /// dark Flutter ThemeData() and a FlexColorScheme.toTheme() ThemeData for
  /// the other mode, you must set either the default ThemeData to
  /// [Typography.material2018] OR the [FlexColorScheme.typography] to
  /// [Typography.material2014] to avoid this issue. It is not generally
  /// recommended to create your light and dark theme data with
  /// different methods. If you use FlexColorScheme, DO use it for both the
  /// light and dark theme mode.
  final Typography? typography;

  /// Apply a semi-transparent overlay color on Material surfaces to indicate
  /// elevation for dark themes.
  ///
  /// Same property as in [ThemeData] factory. Included for convenience to
  /// avoid a copyWith to change it.
  ///
  /// In FlexColorScheme it defaults to true. In Flutter [ThemeData.from] it
  /// also default to true, but in [ThemeData] factory it defaults to false.
  ///
  /// Material drop shadows can be difficult to see in a dark theme, so the
  /// elevation of a surface should be portrayed with an "overlay" in addition
  /// to the shadow. As the elevation of the component increases, the
  /// overlay increases in opacity. The [applyElevationOverlayColor] turns the
  /// application of this overlay on or off for dark themes.
  ///
  /// If true and [brightness] is [Brightness.dark], a
  /// semi-transparent version of [ColorScheme.onSurface] will be
  /// applied on top of [Material] widgets that have a [ColorScheme.surface]
  /// color. The level of transparency is based on [Material.elevation] as
  /// per the Material Dark theme specification.
  ///
  /// If false the surface color will be used unmodified.
  ///
  /// Defaults to false in order to maintain backwards compatibility with
  /// apps that were built before the Material Dark theme specification
  /// was published. New apps should set this to true for any themes
  /// where [brightness] is [Brightness.dark].
  ///
  /// See also:
  ///
  ///  * [Material.elevation], which effects the level of transparency of the
  ///    overlay color.
  ///  * [ElevationOverlay.applyOverlay], which is used by [Material] to apply
  ///    the overlay color to its surface color.
  ///  * <https://material.io/design/color/dark-theme.html>, which specifies how
  ///    the overlay should be applied.
  ///
  /// Known limitations:
  ///
  /// Because of how the overlay color application is implemented in Flutter
  /// SDK, you will only get overlay color applied in dark mode when this value
  /// is true, if the [Material] surface color being elevated is equal to
  /// [ThemeData.colorScheme] and its [ColorScheme.surface] color property.
  ///
  /// Thus when using color branded surfaces, if you want all [Material]
  /// surfaces in your theme to get an overlay color in dark mode, you must for
  /// dark themes only use background colors that are equal to the surface
  /// color. Thus when using [FlexColorScheme.dark], use a [FlexSurfaceMode]
  /// that starts with `equal`. That said, if you use heavy color branding,
  /// some surfaces may not need any overlay color, so the
  /// lack of it might not be an issue with other modes in such themes.
  /// For more information about this limitation, see Flutter SDK issue:
  /// https://github.com/flutter/flutter/issues/90353
  final bool applyElevationOverlayColor;

  /// Set to true to opt in on using additional opinionated widget sub themes.
  ///
  /// By default [FlexThemeData.light], [FlexThemeData.dark] and
  /// [FlexColorScheme.toTheme], tries to do as
  /// little as they need to just provide a consistent color schemed theme.
  ///
  /// By opting in with [useSubThemes] set to true you get an opinionated set of
  /// widget sub themes applied. They can be conveniently customized via the
  /// [subThemesData] property, that holds quick and easy sub theme
  /// configuration values in the data class [FlexSubThemesData].
  ///
  /// Opinionated sub themes are provided for:
  ///
  /// * [TextButton]
  /// * [ElevatedButton]
  /// * [OutlinedButton]
  /// * Older buttons using [ButtonThemeData]
  /// * [ToggleButtons]
  /// * [InputDecoration]
  /// * [FloatingActionButton]
  /// * [Chip]
  /// * [Card]
  /// * [PopupMenuButton]
  /// * [Dialog]
  /// * [TimePickerDialog]
  /// * [SnackBar]
  /// * [BottomSheet]
  /// * [BottomNavigationBar]
  /// * [NavigationBar]
  ///
  /// * The [ButtonThemeData] still provides matching themed styling
  ///   for the deprecated legacy buttons if they are used. Please consider
  ///   phasing them out though, as the are deprecated and may soon be
  ///   removed from the SDK.
  ///
  /// The sub themes are a convenient way to opt-in on customized corner
  /// radius on Widgets using above themes. By opting in you can set corner
  /// radius for all above Widgets to same corner radius in one go. There are
  /// also properties to override the global default for each widget to set
  /// different rounding per widget if so desired.
  ///
  /// By default each widgets corner radius and some other styling take
  /// inspiration from the Material 3 (M3) Specification https://m3.material.io/
  /// and uses its values as defaults when it is possible to do so in Flutter
  /// SDK theming within its current Material 2 (M2) design limitations.
  ///
  /// Defaults to false.
  final bool useSubThemes;

  /// Optional configuration parameters for the opt-in widget sub-themes.
  ///
  /// If you opt-in to use the opinionated sub theming offered by
  /// [FlexColorScheme] you can also configure them by passing in a
  /// [FlexSubThemesData] that allows you to modify their style and behavior.
  ///
  /// The primary purpose of the opinionated sub themes is to make it easy
  /// to add themed corner radius to all Widgets that support it, and to
  /// provide a consistent look on all buttons, including [ToggleButtons].
  ///
  /// The default values is also a way to give your Material 2 themed based
  /// application a look that to large extents follows the Material3 (M3) guide.
  ///
  /// Defaults to null, resulting in a default [FlexSubThemesData] being used
  /// when [useSubThemes] is set to true.
  final FlexSubThemesData? subThemesData;

  //****************************************************************************
  //
  // LIGHT COLOR SCHEME AND THEME DEFINITIONS
  //
  // Factory FlexColorScheme.light
  //
  //****************************************************************************

  /// Creates a [FlexColorScheme] for light theme mode.
  ///
  /// The factory has no required [FlexSchemeColor] properties, but typically
  /// a [FlexScheme] enum [scheme] value would be provided to use a pre-defined
  /// color scheme.
  ///
  /// As a second alternative the [FlexSchemeColor] class [colors] property
  /// can be used to define custom scheme colors, that can be created with just
  /// one color property by using the factory [FlexSchemeColor.from].
  ///
  /// As a third option you can provide a complete [ColorScheme] in
  /// [colorScheme] and the custom colors for the theme will be based on that
  /// scheme. Since this is the light theme factory the brightness value in used
  /// [colorScheme] is ignored and resulting effective theme and color scheme
  /// will always be light. Make sure you use colors in your color scheme that
  /// are actually colors for a light theme.
  ///
  /// The factory can produce blended surface colors, and also has other
  /// parameters that may impact the effective color scheme used by final theme,
  /// even when a [colorScheme] are provided. The [FlexColorScheme.toScheme]
  /// will give you the effective color scheme that will also be used
  /// when producing [ThemeData] from [FlexColorScheme] and its factories
  /// with [FlexColorScheme.toTheme].
  ///
  /// The factory contains a large number of other properties that can be used
  /// to create beautiful themes by just adjusting a few behavior properties.
  factory FlexColorScheme.light({
    /// The [FlexSchemeColor] that will be used to create the light
    /// [FlexColorScheme].
    ///
    /// You can use predefined [FlexSchemeColor] values from [FlexColor] or
    /// [FlexColor.schemes] map or define your own colors with
    /// [FlexSchemeColor] or [FlexSchemeColor.from].
    ///
    /// For using built-in color schemes, the convenience shortcut to select
    /// it with the [scheme] property is recommended and leaving [colors]
    /// undefined. If both are specified the scheme colors defined by [colors]
    /// are used. If both are null then [scheme] defaults to
    /// [FlexScheme.material], thus defining the resulting scheme.
    final FlexSchemeColor? colors,

    /// Use one of the built-in color schemes defined by enum [FlexScheme].
    ///
    /// Give it one of the enum values to use the scheme, like eg.
    /// [FlexScheme.mandyRed].
    ///
    /// To create custom color schemes use the [colors] property. If both
    /// [colors] and [scheme] are specified, the scheme defined by
    /// [colors] is used. If both are null, then [scheme] defaults to
    /// [FlexScheme.material].
    final FlexScheme? scheme,

    /// The overall [ColorScheme] based colors for the theme.
    ///
    /// This property provides a new way to define custom colors for
    /// [FlexColorScheme] and is available from version 4.2.0. It is useful if
    /// you already have a custom [ColorScheme] based color definition that
    /// you want to use with FlexColorScheme theming and its sub-theming
    /// capabilities. This will become particularly useful when using Material 3
    /// based design and its seed generated color schemes.
    ///
    /// If you provide both a [ColorScheme] and some individual direct property
    /// values that also exist in a [ColorScheme], the individual property
    /// values will override the corresponding ones in your [ColorScheme].
    ///
    /// If you do not define a [colorScheme], the used colors will be determined
    /// by the [colors] and [scheme] properties. However, when a [colorScheme]
    /// is defined it takes precedence. The [brightness] in the provided
    /// [colorScheme] is always ignored and set to [Brightness.light] since this
    /// is the light theme mode factory. Make sure the colors used in your color
    /// scheme are intended for a light theme.
    ///
    /// If you define a [surfaceMode] and set [blendLevel] > 0, then [surface]
    /// and [background] colors in the provided [colorScheme] will be overridden
    /// by the computed color branded surfaces. If your [colorScheme] already
    /// contains branded surface colors, then keep [blendLevel] = 0 to continue
    /// using them.
    ///
    /// If you use [lightIsWhite] factory feature, it will also override your
    /// [colorScheme] based [surface] and [background] properties and make them
    /// 8% lighter.
    ///
    /// If you opt in on using sub themes with [useSubThemes] and have set
    /// [subThemesData.blendOnColors] to true and have defined [surfaceMode]
    /// and set [blendLevel] > 0, then the effective color scheme based on
    /// colors onPrimary, onSecondary, onError, onSurface and onBackground will
    /// be changed accordingly too.
    ///
    /// The [colorScheme] colors are also included and affected by factory
    /// properties [usedColors] and [swapColors] and included in their behavior.
    ///
    /// The [FlexColorScheme]'s effective [ColorScheme] can be returned with
    /// [toScheme]. This will always get you a complete color scheme, including
    /// calculated and derived color values, which is particularly useful when
    /// using the [FlexColorScheme.light] and [FlexColorScheme.dark] factories
    /// to compute color scheme branded surface colors for you. The effective
    /// [ColorScheme] for your theme is often needed if you want to create
    /// custom sub-themes that should use the colors from the scheme using none
    /// default color assignments from the color scheme.
    final ColorScheme? colorScheme,

    /// The number of the four main scheme colors to be used of the ones
    /// passed in via the required colors [FlexSchemeColor] property.
    ///
    /// This is a convenience property that allows you to vary which colors to
    /// use of the primary, secondary and variant colors included in `colors` in
    /// `FlexSchemeColor` The integer number corresponds to using:
    ///
    /// 1 = Only the primary color
    /// 2 = Primary + Secondary colors
    /// 3 = Primary + Primary variant + Secondary colors
    /// 4 = Primary + Primary variant + Secondary + Secondary variant colors
    ///
    /// By default the value is 4 and all main scheme colors in
    /// `FlexSchemeColor` are used.
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
    final int usedColors = 4,

    /// Blends theme colors into surfaces and backgrounds. Deprecated use
    /// [surfaceMode] in combination with [blendLevel] instead.
    ///
    /// This property was used in FlexColorScheme before v4.0.0.
    /// It is is still available for backwards compatibility.
    /// Use [surfaceMode] and [blendLevel] instead, that replace [surfaceStyle]
    /// and offers more surface color configuration options and choices.
    ///
    /// Defaults to [FlexSurface.material] which results in Flutter
    /// standard [ColorScheme.light] surface colors, which follows the
    /// default color scheme in the Material Design guide for light theme found
    /// [here](https://material.io/design/color/the-color-system.html#color-theme-creation).
    ///
    /// If values for the properties [surface], [background],
    /// [dialogBackground] or [scaffoldBackground] are given,
    /// they are used instead of values that would be assigned based
    /// on used [FlexSurfaceMode] in [surfaceMode] or used [FlexSurface] in
    /// this [surfaceStyle].
    @Deprecated('Deprecated in v4.2.0, use surfaceMode and blendLevel instead.')
        final FlexSurface surfaceStyle = FlexSurface.material,

    /// Blends theme colors into surfaces and backgrounds.
    ///
    /// If defined, used mode overrides the older [surfaceStyle]
    /// property setting. Prefer using [surfaceMode] over [surfaceStyle],
    /// it offers more color branded surface modes and separate control over
    /// the used branding level via the separate [blendLevel] property.
    ///
    /// The mode [FlexSurfaceMode.highBackgroundLowScaffold] can be used to
    /// replace the style that is produced when using
    /// [FlexColorScheme.surfaceStyle] enum property [FlexSurface] in
    /// [FlexColorScheme.light] and [FlexColorScheme.dark]. The mode
    /// [FlexSurfaceMode.highBackgroundLowScaffold] uses the same design concept
    /// as the only style offered by [FlexSurface] in
    /// [FlexColorScheme.surfaceStyle] in use before version 4.
    ///
    /// By adjusting the [FlexColorScheme.blendLevel] property and using this
    /// style, you can find a similar visual effect when using
    /// [FlexSurfaceMode.highBackgroundLowScaffold] with the following values
    /// when matching match most prominent blended [ColorScheme.background]
    /// color.
    ///
    /// In light theme mode:
    ///
    /// * [FlexSurface.material] 0% : blendLevel = 0
    /// * [FlexSurface.light]    2% : blendLevel = 3...4
    /// * [FlexSurface.medium]   4% : blendLevel = 7
    /// * [FlexSurface.strong]   6% : blendLevel = 10
    /// * [FlexSurface.heavy]    8% : blendLevel = 13...14
    ///
    /// In dark theme mode:
    ///
    /// * [FlexSurface.material] 0% : blendLevel = 0
    /// * [FlexSurface.light]    5% : blendLevel = 8
    /// * [FlexSurface.medium]   8% : blendLevel = 13...14
    /// * [FlexSurface.strong]  11% : blendLevel = 19
    /// * [FlexSurface.heavy]   14% : blendLevel = 23
    ///
    /// Since there it is not the same relationship between background and
    /// surface, when using the older [FlexSurface] based style, that uses
    /// individually tuned relationships. The old and new designs do never
    /// align exactly at any blendLevel. The above values produce visually
    /// similar results for the most prominent background color blend.
    ///
    /// To get elevation overlay color in dark themes on all surfaces used by
    /// [Material], use one of the modes where background and dialog color
    /// equals the blend strength on surface color, like [level],
    /// [levelSurfacesLowScaffold], [highScaffoldLowSurfaces] and
    /// [highScaffoldLowSurfaces]. Other modes will only use
    /// elevation overlay if their background happens to be equal to resulting
    /// colorScheme.surface color. For more information
    /// see issue: https://github.com/flutter/flutter/issues/90353
    ///
    /// When using very strong surface branding in dark mode, having an overlay
    /// elevation color in dark mode is less critical, since the elevation
    /// becomes partially visible via shadows and the surface may even have
    /// another color tint if using e.g. [levelSurfacesLowScaffoldVariantDialog]
    /// or [highScaffoldLowSurfacesVariantDialog].
    ///
    /// If values for the properties [surface], [background],
    /// [dialogBackground] or [scaffoldBackground] are given,
    /// they are used instead of values that would be assigned based
    /// on used [FlexSurfaceMode] via [surfaceMode] or [FlexSurface] in
    /// this [surfaceMode].
    final FlexSurfaceMode? surfaceMode,

    /// When [surfaceMode] is defined, this sets the blend level strength used
    /// by the surface mode.
    ///
    /// The blend level is the integer decimal value of the alpha value
    /// used in the alpha blend function. It mixes one color with another
    /// by using alpha opacity value in the color of a surface put on top of
    /// another surface with opaque color and returns the result as one opaque
    /// color.
    ///
    /// Defaults to 0.
    final int blendLevel = 0,

    /// Style used to define the themed color of the AppBar background color.
    ///
    /// Defaults to [FlexAppBarStyle.primary] which produces the same results
    /// as a Flutter standard light [ThemeData.from] by tying the app bar color
    /// to the primary color.
    final FlexAppBarStyle appBarStyle = FlexAppBarStyle.primary,

    /// Themed app bar opacity.
    ///
    /// The opacity is applied to resulting app bar background color determined
    /// by [appBarStyle]. It is also used on tab bars in the app bar. Typically
    /// you would apply an opacity of 0.85 to 0.95 when using the [Scaffold]
    /// property [extendBodyBehindAppBar] set to true, in order to partially
    /// show scrolling content behind the app bar.
    ///
    /// Defaults to 1, fully opaque, no transparency. Must be from 0 to 1.
    final double appBarOpacity = 1,

    /// The themed elevation for the app bar.
    ///
    /// Default to 0. The 0 elevation is an iOs style
    /// influenced opinionated choice, but it can easily be adjusted for the
    /// theme with this property.
    final double appBarElevation = 0,

    /// The themed elevation for the bottom app bar.
    ///
    /// If null, defaults to the value given to the `appBarElevation` elevation.
    final double? bottomAppBarElevation,

    /// Select preferred themed style for the [TabBarTheme].
    ///
    /// By default the [TabBarTheme] is made to fit with the style of the
    /// [AppBar], via default value [FlexTabBarStyle.forAppBar].
    ///
    /// When setting this to [FlexTabBarStyle.forBackground], it will default
    /// to a theme that uses the color scheme and fits on background color,
    /// which typically also on works surface and scaffoldBackground color.
    /// This TabBarTheme style is useful if you primarily intended to use the
    /// TabBar in a Scaffold, Dialog, Drawer or Side panel on their background
    /// colors.
    final FlexTabBarStyle tabBarStyle = FlexTabBarStyle.forAppBar,

    /// The color displayed most frequently across your app’s screens and
    /// components.
    ///
    /// When using the factory this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] [colors] or for this color defined when using a
    /// pre-defined color scheme based on [FlexScheme] [scheme] property, or
    /// if a [colorScheme] was provided it will override the same color in it
    /// as well.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the factory behavior.
    ///
    /// This override color is included and affected by factory
    /// properties [usedColors] and [swapColors] and included in their behavior.
    ///
    /// Defaults to null.
    final Color? primary,

    /// A darker version of the primary color.
    ///
    /// In Flutter SDK the [primaryVariant] color is only used by [SnackBar]
    /// button color in dark theme mode as a part of predefined widget behavior.
    /// If you provide a custom [SnackBarThemeData] where you define
    /// [SnackBarThemeData.actionTextColor] to [primary] or [secondary], this
    /// color property becomes a good property to use if you need a custom color
    /// for custom widgets accessible via your application's ThemeData, that is
    /// not used as default color by any other built-in widgets. This applies
    /// to Flutter 2.8.1 and earlier versions.
    ///
    /// The property is being deprecated in Flutter SDK and will be replaced
    /// by a new property called primaryContainer. It is deprecated from
    /// master v2.6.0-0.0.pre, but has not yet reached stable (2.8.1).
    /// See https://github.com/flutter/flutter/issues/89852.
    ///
    /// When using the factory this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] [colors] or for this color defined when using a
    /// pre-defined color scheme based on [FlexScheme] [scheme] property, or
    /// if a [colorScheme] was provided it will override the same color in it
    /// as well.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the factory behavior.
    ///
    /// The override color is included and affected by factory
    /// properties [usedColors] and [swapColors] and included in their behavior.
    ///
    /// Defaults to null.
    final Color? primaryVariant,

    /// An accent color that, when used sparingly, calls attention to parts
    /// of your app.
    ///
    /// When using the factory this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] [colors] or for this color defined when using a
    /// pre-defined color scheme based on [FlexScheme] [scheme] property, or
    /// if a [colorScheme] was provided it will override the same color in it
    /// as well.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the factory behavior.
    ///
    /// The override color is included and affected by factory properties
    /// [usedColors] and [swapColors] and included in their behavior.
    ///
    /// Defaults to null.
    final Color? secondary,

    /// A darker version of the secondary color.
    ///
    /// In Flutter SDK the [secondaryVariant] color is not used by in any
    /// built-in widgets default themes or predefined widget behavior.
    /// It is an excellent property to use if you need a custom color for
    /// custom widgets accessible via your application's ThemeData, that is
    /// not used as default color by any built-in widgets.
    ///
    /// When using the factory this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] [colors] or for this color defined when using a
    /// pre-defined color scheme based on [FlexScheme] [scheme] property, or
    /// if a [colorScheme] was provided it will override the same color in it
    /// as well.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the factory behavior.
    ///
    /// The override color is included and affected by factory properties
    /// [usedColors] and [swapColors] and included in their behavior.
    ///
    /// Defaults to null.
    final Color? secondaryVariant,

    /// The color to use for input validation errors, e.g. for
    /// [InputDecoration.errorText].
    ///
    /// When using the factory this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] [colors] or for this color defined when using a
    /// pre-defined color scheme based on [FlexScheme] [scheme] property, or
    /// if a [colorScheme] was provided it will override the same color in it
    /// as well.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the factory behavior.
    final Color? error,

    /// The surface (background) color for widgets like [Card] and
    /// [BottomAppBar].
    ///
    /// The color is applied to [ThemeData.cardColor] and
    /// [ColorScheme.surface] in [ThemeData.colorScheme], it is also used
    /// by all [Material] of type [MaterialType.card].
    ///
    /// When using the factory this is an override color for the color that
    /// would be used based on mode defined by property
    /// [surfaceMode] [FlexSurfaceMode] enum or [surfaceStyle] enum
    /// [FlexSurface], or if a [colorScheme] was provided it will override the
    /// same color in it as well.
    ///
    /// Defaults to null.
    final Color? surface,

    /// A color that typically appears behind scrollable content.
    ///
    /// The color is applied to [ThemeData.canvasColor] and
    /// [ThemeData.backgroundColor], it is used eg by menu [Drawer] and by all
    /// [Material] of type [MaterialType.canvas].
    ///
    /// When using the factory this is an override color for the color that
    /// would be used based on mode defined by property
    /// [surfaceMode] [FlexSurfaceMode] enum or [surfaceStyle] enum
    /// [FlexSurface], or if a [colorScheme] was provided it will override the
    /// same color in it as well.
    ///
    /// Defaults to null.
    final Color? background,

    /// The color of the [Scaffold] background.
    ///
    /// The color is applied to [ThemeData.scaffoldBackgroundColor].
    ///
    /// When using the factory this is an override color for the color that
    /// would be used based on mode defined by property
    /// [surfaceMode] [FlexSurfaceMode] enum or [surfaceStyle] enum
    /// [FlexSurface].
    ///
    /// Defaults to null.
    final Color? scaffoldBackground,

    /// The background color of [Dialog] elements.
    ///
    /// The color is applied to [ThemeData.dialogBackgroundColor].
    ///
    /// When using the factory this is an override color for the color that
    /// would be used based on mode defined by property
    /// [surfaceMode] [FlexSurfaceMode] enum or [surfaceStyle] enum
    /// [FlexSurface].
    ///
    /// Defaults to null.
    final Color? dialogBackground,

    /// Background theme color for the [AppBar].
    ///
    /// When using the factory this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] [colors] or for this color defined when using a
    /// pre-defined color scheme based on [FlexScheme] `scheme` property and
    /// the [FlexAppBarStyle] [appBarStyle] property.
    final Color? appBarBackground,

    /// A color that is clearly legible when drawn on [primary] color.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// [primary] and [onPrimary] is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// If null, the on color is derived from the brightness of the [primary]
    /// color, and will be be black if it is light and white if it is dark.
    /// If a [colorScheme] is provided and this color is provided, it will
    /// override the corresponding color in the color scheme.
    final Color? onPrimary,

    /// A color that is clearly legible when drawn on [secondary] color.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// [secondary] and [onSecondary] is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// If null, the on color is derived from the brightness of the [secondary]
    /// color, and will be be black if it is light and white if it is dark.
    /// If a [colorScheme] is provided and this color is provided, it will
    /// override the corresponding color in the color scheme.
    final Color? onSecondary,

    /// A color that is clearly legible when drawn on [surface] color.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// [surface] and [onSurface] is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// If null, the on color is derived from the brightness of the [surface]
    /// color, and will be be black if it is light and white if it is dark.
    /// If a [colorScheme] is provided and this color is provided, it will
    /// override the corresponding color in the color scheme.
    final Color? onSurface,

    /// A color that is clearly legible when drawn on [background] color.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// [background] and [onBackground] is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// If null, the on color is derived from the brightness of the [background]
    /// color, and will be be black if it is light and white if it is dark.
    /// If a [colorScheme] is provided and this color is provided, it will
    /// override the corresponding color in the color scheme.
    final Color? onBackground,

    /// A color that is clearly legible when drawn on [error] color.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// [error] and [onError] is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// If null, the on color is derived from the brightness of the [error]
    /// color, and will be be black if it is light and white if it is dark.
    /// If a [colorScheme] is provided and this color is provided, it will
    /// override the corresponding color in the color scheme.
    final Color? onError,

    /// Makes the light theme backgrounds lighter or even white.
    ///
    /// Scaffold background will become white, and other surfaces also get
    /// lighter (8%), if using low blend levels they may become fully white too.
    final bool lightIsWhite = false,

    /// When true, the primary and primaryVariant colors will be swapped with
    /// their secondary counter parts.
    ///
    /// Set this flag to true if you want to make a theme where
    /// your primary and secondary colors are swapped, compared to how they
    /// are defined in the passed in color properties or used pre-defined
    /// color scheme.
    ///
    /// This is useful if you want to do this with the pre-defined
    /// schemes. If you are explicitly defining all your theme colors you can
    /// of course define them in any desired config. Even if you do
    /// that, this feature will still swap whatever colors you defined
    /// for primary and secondary. You can offer this feature as an easy end
    /// user modifiable theme option if you like. One usage possibility is to
    /// set `swapColors` to true only for the dark modem and use your color
    /// scheme the other way around only in dark mode.
    final bool swapColors = false,

    /// When `true`, tooltip background color will match the brightness of the
    /// theme's background color.
    ///
    /// By default Flutter's Material tooltips use a theme where the tooltip
    /// background color brightness is inverted in relation to the overall
    /// theme's background color.
    ///
    /// FlexColorScheme allows you to use a single
    /// toggle to invert this. Light tooltips on light background is e.g. the
    /// default style on Windows Desktop. You can use this toggle to use this
    /// style, or as a means to create a platform adaptive
    /// tooltip style, where the Material/Flutter style is used on devices and
    /// Web, but the inverted scheme is used on desktop platforms.
    ///
    /// Defaults to false, and uses same background style as Material Design
    /// guide and Flutter.
    ///
    /// Regardless of value used on this property, the tooltip theme created by
    /// [FlexColorScheme] does however deviate a bit from the Flutter default
    /// theme, it has slightly larger font for improved legibility on web and
    /// desktop with device pixel ratio 1.0 and also use a padding style also
    /// suitable for multiline tooltips.
    final bool tooltipsMatchBackground = false,

    /// When set to `true`, it makes the status bar on Android the same color as
    /// the rest of the AppBar.
    ///
    /// Defaults to true.
    ///
    /// When true, the AppBar in Android mimics the look of one-toned AppBar's
    /// typically used on iOS. Set to `false`, to revert back and use
    /// Android's default two-toned look. If true the status bar area is
    /// actually also transparent so that if the app bar is also translucent,
    /// content that scrolls behind it, is also visible behind the status
    /// bar area.
    final bool transparentStatusBar = true,

    /// The density value for specifying the compactness of various UI
    /// components.
    ///
    /// Consider using [FlexColorScheme.comfortablePlatformDensity],
    /// it is similar to [VisualDensity.adaptivePlatformDensity], but the
    /// density for desktop and Web is less dense in order to offer a bit larger
    /// touch friendly surfaces, but not quite as large as small touch devices.
    ///
    /// This is the same property as in [ThemeData] factory, it is just
    /// passed along to it. Included for convenience to avoid a copyWith if
    /// to change it.
    ///
    /// Density, in the context of a UI, is the vertical and horizontal
    /// "compactness" of the elements in the UI. It is unit less, since it means
    /// different things to different UI elements. For buttons, it affects the
    /// spacing around the centered label of the button. For lists, it affects
    /// the distance between baselines of entries in the list.
    ///
    /// Typically, density values are integral, but any value in range may be
    /// used. The range includes values from [VisualDensity.minimumDensity]
    /// (which is -4), to [VisualDensity.maximumDensity] (which is 4),
    /// inclusive, where negative values indicate a denser, more compact, UI,
    /// and positive values indicate a less dense, more expanded, UI. If a
    /// component doesn't support the value given, it will clamp to the nearest
    /// supported value.
    ///
    /// The default for visual densities is zero for both vertical and
    /// horizontal densities, which corresponds to the default visual density of
    /// components in the Material Design specification.
    ///
    /// As a rule of thumb, a change of 1 or -1 in density corresponds to 4
    /// logical pixels. However, this is not a strict relationship since
    /// components interpret the density values appropriately for their needs.
    ///
    /// A larger value translates to a spacing increase (less dense), and a
    /// smaller value translates to a spacing decrease (more dense).
    ///
    /// Defaults to [VisualDensity.adaptivePlatformDensity].
    final VisualDensity? visualDensity,

    /// Text with a color that contrasts with the card and canvas colors.
    final TextTheme? textTheme,

    /// A text theme that contrasts with the primary color.
    final TextTheme? primaryTextTheme,

    /// Same property as in [ThemeData] factory, it is just passed along to it.
    ///
    /// Included for convenience to avoid a copyWith if it needs to be changed.
    final String? fontFamily,

    /// The platform adaptive widgets should adapt to target and mechanics too.
    ///
    /// Same property as in [ThemeData] factory. Included for convenience to
    /// avoid a copyWith change it.
    ///
    /// Defaults to the current platform, as exposed by [defaultTargetPlatform].
    /// This should be used in order to style UI elements according to platform
    /// conventions.
    ///
    /// Widgets from the material library should use this getter (via
    /// [Theme.of]) to determine the current platform for the purpose of
    /// emulating the platform behavior (e.g. scrolling or haptic effects).
    /// Widgets and render objects at lower layers that try to emulate the
    /// underlying platform platform can depend on [defaultTargetPlatform]
    /// directly, or may require that the target platform be provided as an
    /// argument. The `dart.io.Platform` object should only be used directly
    /// when it's critical to actually know the current platform, without
    /// any overrides possible, e.g. when a system API is about to be called.
    ///
    /// In a test environment, the platform returned is [TargetPlatform.android]
    /// regardless of the host platform. (Android was chosen because the tests
    /// were originally written assuming Android-like behavior, and we added
    /// platform adaptations for other platforms later). Tests can check
    /// behavior for other platforms by setting the [platform] of the [Theme]
    /// explicitly to another [TargetPlatform] value, or by setting
    /// [debugDefaultTargetPlatformOverride].
    final TargetPlatform? platform,

    /// The color and geometry [TextTheme] values use to configure [textTheme].
    ///
    /// Same property as in [ThemeData] factory. Included for convenience to
    /// avoid a copyWith change it.
    ///
    /// Included for convenience to avoid a copyWith if it needs to be changed.
    /// Default value deviates from the Flutter standard that uses the old
    /// [Typography.material2014], in favor of newer [Typography.material2018]
    /// as default typography if one is not provided.
    ///
    /// Never mix different [Typography] in light and dark theme mode. If you
    /// do, lerp between dark and light theme mode will fail due Flutter SDK
    /// not being able to handle the use case. See issue:
    /// https://github.com/flutter/flutter/issues/89947
    ///
    /// If you use a default light or
    /// dark Flutter ThemeData() and a FlexColorScheme.toTheme() ThemeData for
    /// the other mode, you must set either the default ThemeData to
    /// [Typography.material2018] OR the [FlexColorScheme.typography] to
    /// [Typography.material2014] to avoid this issue. It is not generally
    /// recommended to create your light and dark theme data with
    /// different methods. If you use FlexColorScheme, DO use it for both the
    /// light and dark theme mode.
    final Typography? typography,

    /// Apply a semi-transparent overlay color on Material surfaces to indicate
    /// elevation for dark themes.
    ///
    /// Same property as in [ThemeData] factory. Included for convenience to
    /// avoid a copyWith change it.
    ///
    /// In FlexColorScheme it defaults to true. In Flutter [ThemeData.from] it
    /// also default to true, but in [ThemeData] factory it defaults to false.
    ///
    /// Material drop shadows can be difficult to see in a dark theme, so the
    /// elevation of a surface should be portrayed with an "overlay" in addition
    /// to the shadow. As the elevation of the component increases, the
    /// overlay increases in opacity. The [applyElevationOverlayColor] turns the
    /// application of this overlay on or off for dark themes.
    ///
    /// If true and [brightness] is [Brightness.dark], a
    /// semi-transparent version of [ColorScheme.onSurface] will be
    /// applied on top of [Material] widgets that have a [ColorScheme.surface]
    /// color. The level of transparency is based on [Material.elevation] as
    /// per the Material Dark theme specification.
    ///
    /// If false the surface color will be used unmodified.
    ///
    /// Defaults to false in order to maintain backwards compatibility with
    /// apps that were built before the Material Dark theme specification
    /// was published. New apps should set this to true for any themes
    /// where [brightness] is [Brightness.dark].
    ///
    /// See also:
    ///
    ///  * [Material.elevation], which effects the level of transparency of the
    ///    overlay color.
    ///  * [ElevationOverlay.applyOverlay], which is used by [Material] to apply
    ///    the overlay color to its surface color.
    ///  * <https://material.io/design/color/dark-theme.html>, which specifies
    ///    how the overlay should be applied.
    ///
    /// Known limitations:
    ///
    /// Because of how the overlay color application is implemented in Flutter
    /// SDK, you will only get overlay color applied in dark mode when this
    /// value  is true, if the [Material] surface color being elevated is equal
    /// to [ThemeData.colorScheme] and its [ColorScheme.surface] color property.
    ///
    /// Thus when using color branded surfaces, if you want all [Material]
    /// surfaces in your theme to get an overlay color in dark mode, you must
    /// for dark themes only use background colors that are equal to the surface
    /// color. This when using [FlexColorScheme.dark] use a [FlexSurfaceMode]
    /// that starts with `equal`. That said, if using heavy color branding,
    /// some surfaces may not need any overlay color, so the
    /// lack of it might not be an issue with other modes in such themes.
    /// For more information about this limitation see Flutter SDK issue:
    /// https://github.com/flutter/flutter/issues/90353
    final bool applyElevationOverlayColor = true,

    /// Set to true to opt-in on using additional opinionated widget sub themes.
    ///
    /// By default [FlexThemeData.light], [FlexThemeData.dark] and
    /// [FlexColorScheme.toTheme], tries to do as
    /// little as they need to just provide a consistent color schemed theme.
    ///
    /// By opting in with [useSubThemes] set to true you get an opinionated set
    /// of widget sub themes applied. They can be conveniently customized via
    /// the [subThemesData] property, that holds quick and easy sub theme
    /// configuration values in the data class [FlexSubThemesData].
    ///
    /// Opinionated sub themes are provided for:
    ///
    /// * [TextButton]
    /// * [ElevatedButton]
    /// * [OutlinedButton]
    /// * Older buttons using [ButtonThemeData]
    /// * [ToggleButtons]
    /// * [InputDecoration]
    /// * [FloatingActionButton]
    /// * [Chip]
    /// * [Card]
    /// * [PopupMenuButton]
    /// * [Dialog]
    /// * [TimePickerDialog]
    /// * [SnackBar]
    /// * [BottomSheet]
    /// * [BottomNavigationBar]
    ///
    /// * The custom [ButtonTextTheme] even still provides matching styling to
    ///   for the deprecated legacy buttons if they are used.
    ///
    /// The sub themes are a convenient way to opt-in on customized corner
    /// radius on Widgets using above themes. By opting in you can set corner
    /// radius for all above Widgets to same corner radius in one go. There are
    /// also properties to override the global default for each widget to set
    /// different rounding per widget if so desired.
    ///
    /// By default each widgets corner radius and some other styling take
    /// inspiration from the Material 3 (M3) Specification
    /// https://m3.material.io/ and uses its values as defaults when it is
    /// possible to do so in Flutter SDK theming within its current
    /// Material 2 (M2) design limitations.
    ///
    /// Defaults to false.
    final bool useSubThemes = false,

    /// Optional configuration parameters for the opt in sub-themes.
    ///
    /// If you opt-in to use the opinionated sub-theming offered by
    /// [FlexColorScheme] you can also configure them by passing
    /// in a [FlexSubThemesData] that allows you to modify them.
    ///
    /// The primary purpose of the opinionated sub-themes is to make it easy
    /// to add themed corner radius to all Widgets that support it, and to
    /// provide a consistent look on all buttons, including [ToggleButtons].
    ///
    /// Defaults to null, resulting in a default [FlexSubThemesData] being used
    /// when [useSubThemes] is set to true.
    final FlexSubThemesData? subThemesData,
  }) {
    // LIGHT: Check valid inputs
    assert(usedColors >= 1 && usedColors <= 4, 'usedColors must be 1 to 4');
    assert(appBarOpacity >= 0 && appBarOpacity <= 1,
        'appBarOpacity must be 0 to 1');
    assert(
      blendLevel >= 0 && blendLevel <= 40,
      'Only blend levels from 0 to 40 are allowed. Very high alpha values may '
      'not produce results that are visually very appealing or useful.',
    );
    assert(appBarElevation >= 0.0, 'AppBar elevation must be >= 0.');
    assert(bottomAppBarElevation == null || bottomAppBarElevation >= 0.0,
        'Bottom AppBar elevation must be null or must be >= 0.');

    // If bottomAppBarElevation was null, fallback to appBarElevation.
    final double _bottomAppBarElevation =
        bottomAppBarElevation ?? appBarElevation;

    // Fallback value for scheme is default material scheme.
    final FlexScheme _scheme = scheme ?? FlexScheme.material;
    // If colors was null, we used the scheme based value.
    final FlexSchemeColor _colors =
        colors ?? FlexColor.schemesWithCustom[_scheme]!.light;
    // If the passed in property values are not null, or there was a colorScheme
    // provided, we will override the colors properties with them, this gets
    // us also correct effective and swap behavior on directly passed in
    // property values or colorScheme based colors.
    final FlexSchemeColor withPassedColors = _colors.copyWith(
      primary: primary ?? colorScheme?.primary,
      primaryVariant: primaryVariant ?? colorScheme?.primaryVariant,
      secondary: secondary ?? colorScheme?.secondary,
      secondaryVariant: secondaryVariant ?? colorScheme?.secondaryVariant,
      error: error ?? colorScheme?.error,
    );
    // Effective FlexSchemeColor depends on colors, usedColors and swapColors.
    final FlexSchemeColor effectiveColors = FlexSchemeColor.effective(
        withPassedColors, usedColors,
        swapColors: swapColors);

    // If [surfaceStyle] is [FlexSurface.custom] then the returned
    // surfaceSchemeColors will be same as [FlexSurface.material], to get a
    // different result surface colors must be been passed in to
    // FlexColorScheme.light. It is up to the implementation using
    // [FlexSurface.custom] to do so. The returned surfaceSchemeColors
    // will never be null, it always has colors.
    //
    // If surfaceMode is not null we use the never blend mode and level via
    // factory FlexSchemeSurfaceColors.flexBlend otherwise we use the one
    // defined by factory FlexSchemeSurfaceColors.from.
    final FlexSchemeSurfaceColors surfaceSchemeColors = surfaceMode != null
        ? FlexSchemeSurfaceColors.blend(
            brightness: Brightness.light,
            surfaceMode: surfaceMode,
            blendLevel: blendLevel,
            schemeColors: effectiveColors,
          )
        : FlexSchemeSurfaceColors.from(
            brightness: Brightness.light,
            surfaceStyle: surfaceStyle,
            primary: effectiveColors.primary,
          );

    // Use passed in sub-theme config data, or a default one, if none given.
    final FlexSubThemesData subTheme =
        subThemesData ?? const FlexSubThemesData();

    // Get alpha blend values corresponding to used mode, level and brightness,
    // if using surfaceMode, opted in to use sub themes and in them opted
    // in to also blend the on colors.
    final _AlphaValues _blend =
        surfaceMode != null && useSubThemes && subTheme.blendOnColors
            ? _AlphaValues.getAlphas(surfaceMode, blendLevel, Brightness.light)
            : const _AlphaValues();

    // Determine the input surface and background colors.
    // The logic is that if they were passed via properties, those colors
    // are used, if not then colorScheme based colors are used, if they
    // were provided and we are not using blended surface and surface mode,
    // if we are, then we use the computed surfaces.
    // The final fallback is always the computed surface
    final bool _overrideScheme = blendLevel > 0 && surfaceMode != null;
    final Color _inputSurface = surface ??
        (_overrideScheme
            ? surfaceSchemeColors.surface
            : colorScheme?.surface) ??
        surfaceSchemeColors.surface;
    final Color _inputBackground = background ??
        (_overrideScheme
            ? surfaceSchemeColors.background
            : colorScheme?.background) ??
        surfaceSchemeColors.background;

    // For the on colors we pass in the primary, secondary and surface colors to
    // calculate onColors for. If some onColors were passed in, we give
    // that value to it, if it was not null it will be used instead of the
    // calculated on color.
    const int divN = 3; // Tuned for less blend of color into its onColor.
    final FlexSchemeOnColors onColors = FlexSchemeOnColors.from(
      primary: effectiveColors.primary,
      secondary: effectiveColors.secondary,
      surface: _inputSurface,
      background: _inputBackground,
      error: effectiveColors.error ?? FlexColor.materialLightError,
      onPrimary: onPrimary ?? colorScheme?.onPrimary,
      onSecondary: onSecondary ?? colorScheme?.onSecondary,
      onSurface: onSurface ?? colorScheme?.onSurface,
      onBackground: onBackground ?? colorScheme?.onBackground,
      onError: onError ?? colorScheme?.onError,
      primaryAlpha: _blend.primaryAlpha * 2 ~/ divN,
      secondaryAlpha: _blend.secondaryAlpha * 2 ~/ divN,
      surfaceAlpha: _blend.surfaceAlpha * 2 ~/ divN,
      backgroundAlpha: _blend.backgroundAlpha * 2 ~/ divN,
      errorAlpha: _blend.errorAlpha * 2 ~/ divN,
    );

    // Determine effective surface color.
    // Surface is used e.g. by Card and bottom appbar.
    // If light is white, we make a lighter than normal surface. If not
    // light is white, we use provided surface color, or computed one.
    final Color effectiveSurfaceColor =
        lightIsWhite ? _inputSurface.lighten(8) : _inputSurface;

    // Determine effective background color.
    // Used e.g. by drawer, nav rail, side menu and bottom bar.
    // If light is white, we make a lighter than normal background. If not
    // light is white, we use provided background color, or computed one.
    final Color effectiveBackgroundColor =
        lightIsWhite ? _inputBackground.lighten(8) : _inputBackground;

    // Determine effective dialog background color.
    // If light is white, we use lighter than normal. If not,
    // we use dialog provided background color, or computed one.
    // The provided dialog background color overrides factory surface behavior,
    // but is impacted by true black mode for a darker effect.
    final Color effectiveDialogBackground = lightIsWhite
        ? dialogBackground?.lighten(8) ??
            surfaceSchemeColors.dialogBackground.lighten(8)
        : dialogBackground ?? surfaceSchemeColors.dialogBackground;

    // Get the effective app bar color based on the style and opacity.
    Color? effectiveAppBarColor;
    switch (appBarStyle) {
      case FlexAppBarStyle.primary:
        effectiveAppBarColor = effectiveColors.primary;
        break;
      case FlexAppBarStyle.material:
        effectiveAppBarColor = FlexColor.materialLightSurface;
        break;
      case FlexAppBarStyle.background:
        effectiveAppBarColor = effectiveBackgroundColor;
        break;
      case FlexAppBarStyle.surface:
        effectiveAppBarColor = effectiveSurfaceColor;
        break;
      case FlexAppBarStyle.custom:
        effectiveAppBarColor =
            effectiveColors.appBarColor ?? effectiveColors.primary;
        break;
    }
    effectiveAppBarColor =
        appBarBackground ?? effectiveAppBarColor.withOpacity(appBarOpacity);

    return FlexColorScheme(
      // We pass along the original colorScheme too, but mostly its properties
      // will not be used as they have been used and potentially redefined by
      // the factory and are defined via other properties in the constructor.
      // Passing it along will however let us keep property values it may
      // have that we are not dealing with in FlexColorScheme when it returns
      // its [ColorScheme].
      colorScheme: colorScheme,
      // This is the light theme factory so we always set brightness to light.
      brightness: Brightness.light,
      // Primary color for the application
      primary: effectiveColors.primary,
      // The primary variant should generally be a bit darker color than
      // primary, preferably of a color like it or darker hue of primary.
      // If no value was provided we use a hue that is 10% darker.
      primaryVariant: effectiveColors.primaryVariant,
      // The secondary color for the application. If you do not want
      // to use it set it to the same color as primary. For a subtle
      // one color based theme you can use a hue of the primary.
      // We use one that is 5% darker than primary, if not given.
      secondary: effectiveColors.secondary,
      // The secondary variant should generally be a bit darker color than
      // secondary, preferably of a color like it or darker hue of secondary.
      // We use any provided value, if none darken the secondary and if no
      // secondary was provided we darken the primary 15%.
      secondaryVariant: effectiveColors.secondaryVariant,
      // Surface is used e.g. by Card and bottom appbar.
      surface: effectiveSurfaceColor,
      // Background is used e.g. by drawer and bottom nav bar.
      background: effectiveBackgroundColor,
      // Color of the scaffold background.
      scaffoldBackground: scaffoldBackground ??
          (lightIsWhite
              ? Colors.white
              : surfaceSchemeColors.scaffoldBackground),
      // Color of dialog background elements, a passed in dialogBackground
      // color will override the factory style, if provided.
      dialogBackground: effectiveDialogBackground,
      // Set app bar background to effective background color, but a passed
      // in appBarBackground will override it if provided.
      appBarBackground: effectiveAppBarColor,
      // Effective error color and null fallback.
      error: effectiveColors.error ?? FlexColor.materialLightError,
      onPrimary: onColors.onPrimary,
      onSecondary: onColors.onSecondary,
      onSurface: onColors.onSurface,
      onBackground: onColors.onBackground,
      onError: onColors.onError,
      tabBarStyle: tabBarStyle,
      appBarElevation: appBarElevation,
      bottomAppBarElevation: _bottomAppBarElevation,
      tooltipsMatchBackground: tooltipsMatchBackground,
      transparentStatusBar: transparentStatusBar,
      visualDensity: visualDensity,
      textTheme: textTheme,
      primaryTextTheme: primaryTextTheme,
      fontFamily: fontFamily,
      platform: platform,
      typography: typography,
      applyElevationOverlayColor: applyElevationOverlayColor,
      useSubThemes: useSubThemes,
      subThemesData: subThemesData,
    );
  }

  //****************************************************************************
  //
  // DARK COLOR SCHEME AND THEME DEFINITIONS
  //
  // Factory FlexColorScheme.dark
  //
  //****************************************************************************

  /// Creates a [FlexColorScheme] for dark theme mode.
  ///
  /// The factory has no required [FlexSchemeColor] properties, but typically
  /// a [FlexScheme] enum [scheme] value would be provided to use a pre-defined
  /// color scheme.
  ///
  /// As a second alternative the [FlexSchemeColor] class [colors] property
  /// can be used to define custom scheme colors, that can be created with just
  /// one color property by using the factory [FlexSchemeColor.from].
  ///
  /// As a third option you can provide a complete [ColorScheme] in
  /// [colorScheme] and the custom colors for the theme will be based on that
  /// scheme. Since this is the light theme factory the brightness value in used
  /// [colorScheme] is ignored and resulting effective theme and color scheme
  /// will always be light. Make sure you use colors in your color scheme that
  /// are actually colors for a light theme.
  ///
  /// The factory can produce blended surface colors, and also has other
  /// parameters that may impact the effective color scheme used by final theme,
  /// even when a [colorScheme] are provided. The [FlexColorScheme.toScheme]
  /// will give you the effective color scheme that will also be used
  /// when producing [ThemeData] from [FlexColorScheme] and its factories
  /// with [FlexColorScheme.toTheme].
  ///
  /// The factory contains a large number of other properties that can be used
  /// to create beautiful themes by just adjusting a few behavior properties.
  factory FlexColorScheme.dark({
    /// The [FlexSchemeColor] used to create the dark [FlexColorScheme] from.
    ///
    /// You can use predefined [FlexSchemeColor] values from [FlexColor] or
    /// [FlexColor.schemes] map or define your own colors with
    /// [FlexSchemeColor] or [FlexSchemeColor.from].
    ///
    /// For using built-in color schemes, the convenience shortcut to select
    /// it with the [scheme] property is recommended and leaving [colors]
    /// undefined. If both are specified the scheme colors defined by [colors]
    /// are used. If both are null then [scheme] defaults to
    /// [FlexScheme.material], thus defining the resulting scheme.
    final FlexSchemeColor? colors,

    /// Use one of the built-in color schemes defined by enum [FlexScheme].
    ///
    /// Give it one of the enum values to use the scheme, like eg.
    /// [FlexScheme.mandyRed].
    ///
    /// To create custom color schemes use the [colors] property. If both
    /// [colors] and [scheme] are specified, the scheme defined by
    /// [colors] is used. If both are null, then [scheme] defaults to
    /// [FlexScheme.material].
    final FlexScheme? scheme,

    /// The overall [ColorScheme] based colors for the theme.
    ///
    /// This property provides a new way to define custom colors for
    /// [FlexColorScheme] and is available from version 4.2.0. It is useful if
    /// you already have a custom [ColorScheme] based color definition that
    /// you want to use with FlexColorScheme theming and its sub-theming
    /// capabilities. This will become particularly useful when using Material 3
    /// based design and its seed generated color schemes.
    ///
    /// If you provide both a [ColorScheme] and some individual direct property
    /// values that also exist in a [ColorScheme], the individual property
    /// values will override the corresponding ones in your [ColorScheme].
    ///
    /// If you do not define a [colorScheme], the used colors will be determined
    /// by the [colors] and [scheme] properties. However, when a [colorScheme]
    /// is defined it takes precedence. The [brightness] in the provided
    /// [colorScheme] is always ignored and set to [Brightness.light] since this
    /// is the light theme mode factory. Make sure the colors used in your color
    /// scheme are intended for a light theme.
    ///
    /// If you define a [surfaceMode] and set [blendLevel] > 0, then [surface]
    /// and [background] colors in the provided [colorScheme] will be overridden
    /// by the computed color branded surfaces. If your [colorScheme] already
    /// contains branded surface colors, then keep [blendLevel] = 0 to continue
    /// using them.
    ///
    /// If you use [lightIsWhite] factory feature, it will also override your
    /// [colorScheme] based [surface] and [background] properties and make them
    /// 8% lighter.
    ///
    /// If you opt in on using sub themes with [useSubThemes] and have set
    /// [subThemesData.blendOnColors] to true and have defined [surfaceMode]
    /// and set [blendLevel] > 0, then the effective color scheme based on
    /// colors onPrimary, onSecondary, onError, onSurface and onBackground will
    /// be changed accordingly too.
    ///
    /// The [colorScheme] colors are also included and affected by factory
    /// properties [usedColors] and [swapColors] and included in their behavior.
    ///
    /// The [FlexColorScheme]'s effective [ColorScheme] can be returned with
    /// [toScheme]. This will always get you a complete color scheme, including
    /// calculated and derived color values, which is particularly useful when
    /// using the [FlexColorScheme.light] and [FlexColorScheme.dark] factories
    /// to compute color scheme branded surface colors for you. The effective
    /// [ColorScheme] for your theme is often needed if you want to create
    /// custom sub-themes that should use the colors from the scheme using none
    /// default color assignments from the color scheme.
    final ColorScheme? colorScheme,

    /// The number of the four main scheme colors to be used of the ones
    /// passed in via the required colors [FlexSchemeColor] property.
    ///
    /// This is a convenience property that allows you to vary which colors to
    /// use of the primary, secondary and variant colors included in `colors` in
    /// [FlexSchemeColor]. The integer number corresponds to using:
    ///
    /// 1 = Only the primary color
    /// 2 = Primary + Secondary colors
    /// 3 = Primary + Primary variant + Secondary colors
    /// 4 = Primary + Primary variant + Secondary + Secondary variant colors
    ///
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
    final int usedColors = 4,

    /// Blends theme colors into surfaces and backgrounds. Deprecated use
    /// [surfaceMode] in combination with [blendLevel] instead.
    ///
    /// This property was used in FlexColorScheme before v4.0.0.
    /// It is is still available for backwards compatibility.
    /// Use [surfaceMode] and [blendLevel] instead, that replace [surfaceStyle]
    /// and offers more surface color configuration options and choices.
    ///
    /// Defaults to [FlexSurface.material] which results in Flutter
    /// standard [ColorScheme.light] surface colors, which follows the
    /// default color scheme in the Material Design guide for light theme found
    /// [here](https://material.io/design/color/the-color-system.html#color-theme-creation).
    ///
    /// If values for the properties [surface], [background],
    /// [dialogBackground] or [scaffoldBackground] are given,
    /// they are used instead of values that would be assigned based
    /// on used [FlexSurfaceMode] in [surfaceMode] or used [FlexSurface] in
    /// this [surfaceStyle].
    @Deprecated('Deprecated in v4.2.0, use surfaceMode and blendLevel instead.')
        final FlexSurface surfaceStyle = FlexSurface.material,

    /// Blends theme colors into surfaces and backgrounds.
    ///
    /// If defined, used mode overrides the older [surfaceStyle]
    /// property setting. Prefer using [surfaceMode] over [surfaceStyle],
    /// it offers more color branded surface modes and separate control over
    /// the used branding level via the separate [blendLevel] property.
    ///
    /// The mode [FlexSurfaceMode.highBackgroundLowScaffold] can be used to
    /// replace the style that is produced when using
    /// [FlexColorScheme.surfaceStyle] enum property [FlexSurface] in
    /// [FlexColorScheme.light] and [FlexColorScheme.dark]. The mode
    /// [FlexSurfaceMode.highBackgroundLowScaffold] uses the same design concept
    /// as the only style offered by [FlexSurface] in
    /// [FlexColorScheme.surfaceStyle] in use before version 4.
    ///
    /// By adjusting the [FlexColorScheme.blendLevel] property and using this
    /// style, you can find a similar visual effect when using
    /// [FlexSurfaceMode.highBackgroundLowScaffold] with the following values
    /// when matching match most prominent blended [ColorScheme.background]
    /// color.
    ///
    /// In light theme mode:
    ///
    /// * [FlexSurface.material] 0% : blendLevel = 0
    /// * [FlexSurface.light]    2% : blendLevel = 3...4
    /// * [FlexSurface.medium]   4% : blendLevel = 7
    /// * [FlexSurface.strong]   6% : blendLevel = 10
    /// * [FlexSurface.heavy]    8% : blendLevel = 13...14
    ///
    /// In dark theme mode:
    ///
    /// * [FlexSurface.material] 0% : blendLevel = 0
    /// * [FlexSurface.light]    5% : blendLevel = 8
    /// * [FlexSurface.medium]   8% : blendLevel = 13...14
    /// * [FlexSurface.strong]  11% : blendLevel = 19
    /// * [FlexSurface.heavy]   14% : blendLevel = 23
    ///
    /// Since there it is not the same relationship between background and
    /// surface, when using the older [FlexSurface] based style, that uses
    /// individually tuned relationships. The old and new designs do never
    /// align exactly at any blendLevel. The above values produce visually
    /// similar results for the most prominent background color blend.
    ///
    /// To get elevation overlay color in dark themes on all surfaces used by
    /// [Material], use one of the modes where background and dialog color
    /// equals the blend strength on surface color, like [level],
    /// [levelSurfacesLowScaffold], [highScaffoldLowSurfaces] and
    /// [highScaffoldLowSurfaces]. Other modes will only use
    /// elevation overlay if their background happens to be equal to resulting
    /// colorScheme.surface color. For more information
    /// see issue: https://github.com/flutter/flutter/issues/90353
    ///
    /// When using very strong surface branding in dark mode, having an overlay
    /// elevation color in dark mode is less critical, since the elevation
    /// becomes partially visible via shadows and the surface may even have
    /// another color tint if using e.g. [levelSurfacesLowScaffoldVariantDialog]
    /// or [highScaffoldLowSurfacesVariantDialog].
    ///
    /// If values for the properties [surface], [background],
    /// [dialogBackground] or [scaffoldBackground] are given,
    /// they are used instead of values that would be assigned based
    /// on used [FlexSurfaceMode] via [surfaceMode] or [FlexSurface] in
    /// this [surfaceMode].
    final FlexSurfaceMode? surfaceMode,

    /// When [surfaceMode] is defined, this sets the blend level strength used
    /// by the surface mode.
    ///
    /// The blend level is the integer decimal value of the alpha value
    /// used in the alpha blend function. It mixes one color with another
    /// by using alpha opacity value in the color of a surface put on top of
    /// another surface with opaque color and returns the result as one opaque
    /// color.
    ///
    /// Defaults to 0.
    final int blendLevel = 0,

    /// Style used to define the themed color of the [AppBar] background color.
    ///
    /// Defaults to [FlexAppBarStyle.material] which produces the same results
    /// as a Flutter standard dark [ThemeData.from] by tying the app bar color
    /// to the surface color.
    final FlexAppBarStyle appBarStyle = FlexAppBarStyle.material,

    /// Themed app bar opacity.
    ///
    /// The opacity is applied to resulting app bar background color determined
    /// by [appBarStyle]. It is also used on tab bars in the app bar. Typically
    /// you would apply an opacity of 0.85 to 0.95 when using the [Scaffold]
    /// property [extendBodyBehindAppBar] set to true, in order to partially
    /// show scrolling content behind the app bar.
    ///
    /// Defaults to 1, fully opaque, no transparency. Must be from 0 to 1.
    final double appBarOpacity = 1,

    /// The themed elevation for the app bar.
    ///
    /// Default to 0. The 0 elevation is an iOs style
    /// influenced opinionated choice, but it can easily be adjusted for the
    /// theme with this property.
    final double appBarElevation = 0,

    /// The themed elevation for the bottom app bar.
    ///
    /// If null, defaults to the value given to the `appBarElevation` elevation.
    final double? bottomAppBarElevation,

    /// Select preferred themed style for the [TabBarTheme].
    ///
    /// By default the [TabBarTheme] is made to fit with the style of the
    /// [AppBar], via default value [FlexTabBarStyle.forAppBar].
    ///
    /// When setting this to [FlexTabBarStyle.forBackground], it will default
    /// to a theme that uses the color scheme and fits on background color,
    /// which typically also on works surface and scaffoldBackground color.
    /// This TabBarTheme style is useful if you primarily intended to use the
    /// TabBar in a Scaffold, Dialog, Drawer or Side panel on their background
    /// colors.
    final FlexTabBarStyle tabBarStyle = FlexTabBarStyle.forAppBar,

    /// The color displayed most frequently across your app’s screens and
    /// components.
    ///
    /// When using the factory this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] [colors] or for this color defined when using a
    /// pre-defined color scheme based on [FlexScheme] [scheme] property, or
    /// if a [colorScheme] was provided it will override the same color in it
    /// as well.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the factory behavior.
    ///
    /// This override color is included and affected by factory
    /// properties [usedColors] and [swapColors] and included in their behavior.
    ///
    /// Defaults to null.
    final Color? primary,

    /// A darker version of the primary color.
    ///
    /// In Flutter SDK the [primaryVariant] color is only used by [SnackBar]
    /// button color in dark theme mode as a part of predefined widget behavior.
    /// If you provide a custom [SnackBarThemeData] where you define
    /// [SnackBarThemeData.actionTextColor] to [primary] or [secondary], this
    /// color property becomes a good property to use if you need a custom color
    /// for custom widgets accessible via your application's ThemeData, that is
    /// not used as default color by any other built-in widgets. This applies
    /// to Flutter 2.8.1 and earlier versions.
    ///
    /// The property is being deprecated in Flutter SDK and will be replaced
    /// by a new property called primaryContainer. It is deprecated from
    /// master v2.6.0-0.0.pre, but has not yet reached stable (2.8.1).
    /// See https://github.com/flutter/flutter/issues/89852.
    ///
    /// When using the factory this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] [colors] or for this color defined when using a
    /// pre-defined color scheme based on [FlexScheme] [scheme] property, or
    /// if a [colorScheme] was provided it will override the same color in it
    /// as well.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the factory behavior.
    ///
    /// The override color is included and affected by factory
    /// properties [usedColors] and [swapColors] and included in their behavior.
    ///
    /// Defaults to null.
    final Color? primaryVariant,

    /// An accent color that, when used sparingly, calls attention to parts
    /// of your app.
    ///
    /// When using the factory this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] [colors] or for this color defined when using a
    /// pre-defined color scheme based on [FlexScheme] [scheme] property, or
    /// if a [colorScheme] was provided it will override the same color in it
    /// as well.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the factory behavior.
    ///
    /// The override color is included and affected by factory properties
    /// [usedColors] and [swapColors] and included in their behavior.
    ///
    /// Defaults to null.
    final Color? secondary,

    /// A darker version of the secondary color.
    ///
    /// In Flutter SDK the [secondaryVariant] color is not used by in any
    /// built-in widgets default themes or predefined widget behavior.
    /// It is an excellent property to use if you need a custom color for
    /// custom widgets accessible via your application's ThemeData, that is
    /// not used as default color by any built-in widgets.
    ///
    /// When using the factory this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] [colors] or for this color defined when using a
    /// pre-defined color scheme based on [FlexScheme] [scheme] property, or
    /// if a [colorScheme] was provided it will override the same color in it
    /// as well.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the factory behavior.
    ///
    /// The override color is included and affected by factory properties
    /// [usedColors] and [swapColors] and included in their behavior.
    ///
    /// Defaults to null.
    final Color? secondaryVariant,

    /// The color to use for input validation errors, e.g. for
    /// [InputDecoration.errorText].
    ///
    /// When using the factory this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] [colors] or for this color defined when using a
    /// pre-defined color scheme based on [FlexScheme] [scheme] property, or
    /// if a [colorScheme] was provided it will override the same color in it
    /// as well.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the factory behavior.
    final Color? error,

    /// The surface (background) color for widgets like [Card] and
    /// [BottomAppBar].
    ///
    /// The color is applied to [ThemeData.cardColor] and
    /// [ColorScheme.surface] in [ThemeData.colorScheme], it is also used
    /// by all [Material] of type [MaterialType.card].
    ///
    /// When using the factory this is an override color for the color that
    /// would be used based on mode defined by property
    /// [surfaceMode] [FlexSurfaceMode] enum or [surfaceStyle] enum
    /// [FlexSurface], or if a [colorScheme] was provided it will override the
    /// same color in it as well.
    ///
    /// Defaults to null.
    final Color? surface,

    /// A color that typically appears behind scrollable content.
    ///
    /// The color is applied to [ThemeData.canvasColor] and
    /// [ThemeData.backgroundColor], it is used eg by menu [Drawer] and by all
    /// [Material] of type [MaterialType.canvas].
    ///
    /// When using the factory this is an override color for the color that
    /// would be used based on mode defined by property
    /// [surfaceMode] [FlexSurfaceMode] enum or [surfaceStyle] enum
    /// [FlexSurface], or if a [colorScheme] was provided it will override the
    /// same color in it as well.
    ///
    /// Defaults to null.
    final Color? background,

    /// The color of the [Scaffold] background.
    ///
    /// The color is applied to [ThemeData.scaffoldBackgroundColor].
    ///
    /// When using the factory this is an override color for the color that
    /// would be used based on mode defined by property
    /// [surfaceMode] [FlexSurfaceMode] enum or [surfaceStyle] enum
    /// [FlexSurface].
    ///
    /// Defaults to null.
    final Color? scaffoldBackground,

    /// The background color of Dialog elements.
    ///
    /// When using the factory this is an override color for the color that
    /// would be used based on mode defined by property
    /// [surfaceMode] [FlexSurfaceMode] enum or [surfaceStyle] enum
    /// [FlexSurface].
    ///
    /// Defaults to null.
    final Color? dialogBackground,

    /// Background theme color for the [AppBar].
    ///
    /// When using the factory this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] [colors] or for this color defined when using a
    /// pre-defined color scheme based on [FlexScheme] [scheme] property and
    /// the [FlexAppBarStyle] [appBarStyle] property.
    final Color? appBarBackground,

    /// A color that is clearly legible when drawn on [primary] color.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// [primary] and [onPrimary] is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// If null, the on color is derived from the brightness of the [primary]
    /// color, and will be be black if it is light and white if it is dark.
    /// If a [colorScheme] is provided and this color is provided, it will
    /// override the corresponding color in the color scheme.
    final Color? onPrimary,

    /// A color that is clearly legible when drawn on [secondary] color.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// [secondary] and [onSecondary] is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// If null, the on color is derived from the brightness of the [secondary]
    /// color, and will be be black if it is light and white if it is dark.
    /// If a [colorScheme] is provided and this color is provided, it will
    /// override the corresponding color in the color scheme.
    final Color? onSecondary,

    /// A color that is clearly legible when drawn on [surface] color.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// [surface] and [onSurface] is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// If null, the on color is derived from the brightness of the [surface]
    /// color, and will be be black if it is light and white if it is dark.
    /// If a [colorScheme] is provided and this color is provided, it will
    /// override the corresponding color in the color scheme.
    final Color? onSurface,

    /// A color that is clearly legible when drawn on [background] color.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// [background] and [onBackground] is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// If null, the on color is derived from the brightness of the [background]
    /// color, and will be be black if it is light and white if it is dark.
    /// If a [colorScheme] is provided and this color is provided, it will
    /// override the corresponding color in the color scheme.
    final Color? onBackground,

    /// A color that is clearly legible when drawn on [error] color.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// [error] and [onError] is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// If null, the on color is derived from the brightness of the [error]
    /// color, and will be be black if it is light and white if it is dark.
    /// If a [colorScheme] is provided and this color is provided, it will
    /// override the corresponding color in the color scheme.
    final Color? onError,

    /// Makes the dark theme backgrounds darker or even black.
    ///
    /// Scaffold background will become fully black, and other surfaces also get
    /// darker (8%), if using low blend levels they may become fully black too.
    final bool darkIsTrueBlack = false,

    /// When true, the primary and primaryVariant colors will be swapped with
    /// their secondary counter parts.
    ///
    /// Set this flag to true if you want to make a theme where
    /// your primary and secondary colors are swapped, compared to how they
    /// are defined in the passed in color properties or used pre-defined
    /// color scheme.
    ///
    /// This is useful if you want to do this with the pre-defined
    /// schemes. If you are explicitly defining all your theme colors you can
    /// of course define them in any desired config. Even if you do
    /// that, this feature will still swap whatever colors you defined
    /// for primary and secondary. You can offer this feature as an easy end
    /// user modifiable theme option if you like. One usage possibility is to
    /// set `swapColors` to true only for the dark modem and use your color
    /// scheme the other way around only in dark mode.
    final bool swapColors = false,

    /// When true, tooltip background color will match the brightness of the
    /// theme's background color.
    ///
    /// By default Flutter's Material tooltips use a theme where the tooltip
    /// background color brightness is inverted in relation to the overall
    /// theme's background color.
    ///
    /// FlexColorScheme allows you to use a single
    /// toggle to invert this. Light tooltips on light background is e.g. the
    /// default style on Windows Desktop. You can use this toggle to use this
    /// style, or as a means to create a platform adaptive
    /// tooltip style, where the Material/Flutter style is used on devices and
    /// Web, but the inverted scheme is used on desktop platforms.
    ///
    /// Defaults to false, and uses same background style as Material Design
    /// guide and Flutter.
    ///
    /// Regardless of value used on this property, the tooltip theme created by
    /// [FlexColorScheme] does however deviate a bit from the Flutter default
    /// theme, it has slightly larger font for improved legibility on web and
    /// desktop with device pixel ratio 1.0 and also use a padding style also
    /// suitable for multiline tooltips.
    final bool tooltipsMatchBackground = false,

    /// When set to true, it makes the status bar on Android the same color as
    /// the rest of the AppBar.
    ///
    /// Defaults to true.
    ///
    /// When true, the AppBar in Android mimics the look of one-toned AppBar's
    /// typically used on iOS. Set to `false`, to revert back and use
    /// Android's default two-toned look. If true the status bar area is
    /// actually also transparent so that if the app bar is also translucent,
    /// content that scrolls behind it, is also visible behind the status
    /// bar area.
    final bool transparentStatusBar = true,

    /// The density value for specifying the compactness of various UI
    /// components.
    ///
    /// Consider using [FlexColorScheme.comfortablePlatformDensity],
    /// it is similar to [VisualDensity.adaptivePlatformDensity], but the
    /// density for desktop and Web is less dense in order to offer a bit larger
    /// touch friendly surfaces, but not quite as large as small touch devices.
    ///
    /// This is the same property as in [ThemeData] factory, it is just
    /// passed along to it. Included for convenience to avoid a copyWith if
    /// to change it.
    ///
    /// Density, in the context of a UI, is the vertical and horizontal
    /// "compactness" of the elements in the UI. It is unit less, since it means
    /// different things to different UI elements. For buttons, it affects the
    /// spacing around the centered label of the button. For lists, it affects
    /// the distance between baselines of entries in the list.
    ///
    /// Typically, density values are integral, but any value in range may be
    /// used. The range includes values from [VisualDensity.minimumDensity]
    /// (which is -4), to [VisualDensity.maximumDensity] (which is 4),
    /// inclusive, where negative values indicate a denser, more compact, UI,
    /// and positive values indicate a less dense, more expanded, UI. If a
    /// component doesn't support the value given, it will clamp to the nearest
    /// supported value.
    ///
    /// The default for visual densities is zero for both vertical and
    /// horizontal densities, which corresponds to the default visual density of
    /// components in the Material Design specification.
    ///
    /// As a rule of thumb, a change of 1 or -1 in density corresponds to 4
    /// logical pixels. However, this is not a strict relationship since
    /// components interpret the density values appropriately for their needs.
    ///
    /// A larger value translates to a spacing increase (less dense), and a
    /// smaller value translates to a spacing decrease (more dense).
    ///
    /// Defaults to [VisualDensity.adaptivePlatformDensity].
    final VisualDensity? visualDensity,

    /// Text with a color that contrasts with the card and canvas colors.
    final TextTheme? textTheme,

    /// A text theme that contrasts with the primary color.
    final TextTheme? primaryTextTheme,

    /// Same property as in [ThemeData] factory, it is just passed along to it.
    ///
    /// Included for convenience to avoid a copyWith if it needs to be changed.
    final String? fontFamily,

    /// The platform adaptive widgets should adapt to target and mechanics too.
    ///
    /// Same property as in [ThemeData] factory. Included for convenience to
    /// avoid a copyWith change it.
    ///
    /// Defaults to the current platform, as exposed by [defaultTargetPlatform].
    /// This should be used in order to style UI elements according to platform
    /// conventions.
    ///
    /// Widgets from the material library should use this getter (via
    /// [Theme.of]) to determine the current platform for the purpose of
    /// emulating the platform behavior (e.g. scrolling or haptic effects).
    /// Widgets and render objects at lower layers that try to emulate the
    /// underlying platform platform can depend on [defaultTargetPlatform]
    /// directly, or may require that the target platform be provided as an
    /// argument. The `dart.io.Platform` object should only be used directly
    /// when it's critical to actually know the current platform, without any
    /// overrides possible, e.g. when a system API is about to be called.
    ///
    /// In a test environment, the platform returned is [TargetPlatform.android]
    /// regardless of the host platform. (Android was chosen because the tests
    /// were originally written assuming Android-like behavior, and we added
    /// platform adaptations for other platforms later). Tests can check
    /// behavior for other platforms by setting the [platform] of the [Theme]
    /// explicitly to another [TargetPlatform] value, or by setting
    /// [debugDefaultTargetPlatformOverride].
    final TargetPlatform? platform,

    /// The color and geometry [TextTheme] values use to configure [textTheme].
    ///
    /// Same property as in [ThemeData] factory. Included for convenience to
    /// avoid a copyWith change it.
    ///
    /// Included for convenience to avoid a copyWith if it needs to be changed.
    /// Default value deviates from the Flutter standard that uses the old
    /// [Typography.material2014], in favor of newer [Typography.material2018]
    /// as default typography if one is not provided.
    ///
    /// Never mix different [Typography] in light and dark theme mode. If you
    /// do, lerp between dark and light theme mode will fail due Flutter SDK
    /// not being able to handle the use case. See issue:
    /// https://github.com/flutter/flutter/issues/89947
    ///
    /// If you use a default light or
    /// dark Flutter ThemeData() and a FlexColorScheme.toTheme() ThemeData for
    /// the other mode, you must set either the default ThemeData to
    /// [Typography.material2018] OR the [FlexColorScheme.typography] to
    /// [Typography.material2014] to avoid this issue. It is not generally
    /// recommended to create your light and dark theme data with
    /// different methods. If you use FlexColorScheme, DO use it for both the
    /// light and dark theme mode.
    final Typography? typography,

    /// Apply a semi-transparent overlay color on Material surfaces to indicate
    /// elevation for dark themes.
    ///
    /// Same property as in [ThemeData] factory. Included for convenience to
    /// avoid a copyWith change it.
    ///
    /// In FlexColorScheme it defaults to true. In Flutter [ThemeData.from] it
    /// also default to true, but in [ThemeData] factory it defaults to false.
    ///
    /// Material drop shadows can be difficult to see in a dark theme, so the
    /// elevation of a surface should be portrayed with an "overlay" in addition
    /// to the shadow. As the elevation of the component increases, the
    /// overlay increases in opacity. The [applyElevationOverlayColor] turns the
    /// application of this overlay on or off for dark themes.
    ///
    /// If true and [brightness] is [Brightness.dark], a
    /// semi-transparent version of [ColorScheme.onSurface] will be
    /// applied on top of [Material] widgets that have a [ColorScheme.surface]
    /// color. The level of transparency is based on [Material.elevation] as
    /// per the Material Dark theme specification.
    ///
    /// If false the surface color will be used unmodified.
    ///
    /// Defaults to false in order to maintain backwards compatibility with
    /// apps that were built before the Material Dark theme specification
    /// was published. New apps should set this to true for any themes
    /// where [brightness] is [Brightness.dark].
    ///
    /// See also:
    ///
    ///  * [Material.elevation], which effects the level of transparency of the
    ///    overlay color.
    ///  * [ElevationOverlay.applyOverlay], which is used by [Material] to apply
    ///    the overlay color to its surface color.
    ///  * <https://material.io/design/color/dark-theme.html>, which specifies
    ///    how the overlay should be applied.
    ///
    /// Known limitations:
    ///
    /// Because of how the overlay color application is implemented in Flutter
    /// SDK, you will only get overlay color applied in dark mode when this
    /// value  is true, if the [Material] surface color being elevated is equal
    /// to [ThemeData.colorScheme] and its [ColorScheme.surface] color property.
    ///
    /// Thus when using color branded surfaces, if you want all [Material]
    /// surfaces in your theme to get an overlay color in dark mode, you must
    /// for dark themes only use background colors that are equal to the surface
    /// color. This when using [FlexColorScheme.dark] use a [FlexSurfaceMode]
    /// that starts with `equal`. That said, if using heavy color branding,
    /// some surfaces may not need any overlay color, so the
    /// lack of it might not be an issue with other modes in such themes.
    /// For more information about this limitation see Flutter SDK issue:
    /// https://github.com/flutter/flutter/issues/90353
    final bool applyElevationOverlayColor = true,

    /// Set to true to opt-in on using additional opinionated widget sub themes.
    ///
    /// By default [FlexThemeData.light], [FlexThemeData.dark] and
    /// [FlexColorScheme.toTheme], tries to do as
    /// little as they need to just provide a consistent color schemed theme.
    ///
    /// By opting in with [useSubThemes] set to true you get an opinionated set
    /// of widget sub themes applied. They can be conveniently customized via
    /// the [subThemesData] property, that holds quick and easy sub theme
    /// configuration values in the data class [FlexSubThemesData].
    ///
    /// Opinionated sub themes are provided for:
    ///
    /// * [TextButton]
    /// * [ElevatedButton]
    /// * [OutlinedButton]
    /// * Older buttons using [ButtonThemeData]
    /// * [ToggleButtons]
    /// * [InputDecoration]
    /// * [FloatingActionButton]
    /// * [Chip]
    /// * [Card]
    /// * [PopupMenuButton]
    /// * [Dialog]
    /// * [TimePickerDialog]
    /// * [SnackBar]
    /// * [BottomSheet]
    /// * [BottomNavigationBar]
    ///
    /// * The custom [ButtonTextTheme] even still provides matching styling to
    ///   for the deprecated legacy buttons if they are used.
    ///
    /// The sub themes are a convenient way to opt-in on customized corner
    /// radius on Widgets using above themes. By opting in you can set corner
    /// radius for all above Widgets to same corner radius in one go. There are
    /// also properties to override the global default for each widget to set
    /// different rounding per widget if so desired.
    ///
    /// By default each widgets corner radius and some other styling take
    /// inspiration from the Material 3 (M3) Specification
    /// https://m3.material.io/ and uses its values as defaults when it is
    /// possible to do so in Flutter SDK theming within its current
    /// Material 2 (M2) design limitations.
    ///
    /// Defaults to false.
    final bool useSubThemes = false,

    /// Optional configuration parameters for the opt in sub-themes.
    ///
    /// If you opt-in to use the opinionated sub-theming offered by
    /// [FlexColorScheme] you can also configure them by passing
    /// in a [FlexSubThemesData] that allows you to modify them.
    ///
    /// The primary purpose of the opinionated sub-themes is to make it easy
    /// to add themed corner radius to all Widgets that support it, and to
    /// provide a consistent look on all buttons, including [ToggleButtons].
    ///
    /// Defaults to null, resulting in a default [FlexSubThemesData] being used
    /// when [useSubThemes] is set to true.
    final FlexSubThemesData? subThemesData,
  }) {
    // DARK: Check valid inputs
    assert(usedColors >= 1 && usedColors <= 4, 'usedColors must be 1 to 4.');
    assert(appBarOpacity >= 0 && appBarOpacity <= 1,
        'appBarOpacity must be 0 to 1');
    assert(
      blendLevel >= 0 && blendLevel <= 40,
      'Only blend levels from 0 to 40 are allowed. Very high alpha values may '
      'not produce results that are visually very appealing or useful.',
    );
    assert(appBarElevation >= 0.0, 'AppBar elevation must be >= 0.');
    assert(bottomAppBarElevation == null || bottomAppBarElevation >= 0.0,
        'Bottom AppBar elevation must be null or must be >= 0.');
    // If bottomAppBarElevation is null, fallback to appBarElevation.
    final double effectiveBottomAppBarElevation =
        bottomAppBarElevation ?? appBarElevation;

    // Fallback value for scheme is default material scheme.
    final FlexScheme _scheme = scheme ?? FlexScheme.material;
    // If colors was null, we used the scheme based value.
    final FlexSchemeColor _colors =
        colors ?? FlexColor.schemesWithCustom[_scheme]!.dark;
    // If the passed in property values are not null, or there was a colorScheme
    // provided, we will override the colors properties with them, this gets
    // us also correct effective and swap behavior on directly passed in
    // property values or colorScheme based colors.
    final FlexSchemeColor withPassedColors = _colors.copyWith(
      primary: primary ?? colorScheme?.primary,
      primaryVariant: primaryVariant ?? colorScheme?.primaryVariant,
      secondary: secondary ?? colorScheme?.secondary,
      secondaryVariant: secondaryVariant ?? colorScheme?.secondaryVariant,
      error: error ?? colorScheme?.error,
    );
    // Effective FlexSchemeColor depends on colors, usedColors and swapColors.
    final FlexSchemeColor effectiveColors = FlexSchemeColor.effective(
      withPassedColors,
      usedColors,
      swapColors: swapColors,
    );

    // If [surfaceStyle] is [FlexSurface.custom] then the returned
    // surfaceSchemeColors will be same as [FlexSurface.material], to get a
    // different result surface colors must be passed in to
    // FlexColorScheme.dark. It is up to the implementation using
    // [FlexSurface.custom] to do so. The returned surfaceSchemeColors
    // will never be null, it always has colors.
    //
    // If surfaceMode is not null, we use the never blend mode and level via
    // factory FlexSchemeSurfaceColors.flexBlend, otherwise we use the one
    // defined by factory FlexSchemeSurfaceColors.from used before version 4.
    final FlexSchemeSurfaceColors surfaceSchemeColors = surfaceMode != null
        ? FlexSchemeSurfaceColors.blend(
            brightness: Brightness.dark,
            surfaceMode: surfaceMode,
            blendLevel: blendLevel,
            schemeColors: effectiveColors,
          )
        : FlexSchemeSurfaceColors.from(
            brightness: Brightness.dark,
            surfaceStyle: surfaceStyle,
            primary: effectiveColors.primary,
          );

    // Use passed in sub-theme config data, or a default one, if none given.
    final FlexSubThemesData subTheme =
        subThemesData ?? const FlexSubThemesData();

    // Get alpha blend values corresponding to used mode, level and brightness,
    // if using surfaceMode, opted in to use sub themes and in theme opted
    // in to also blend the on colors.
    final _AlphaValues _blend =
        surfaceMode != null && useSubThemes && subTheme.blendOnColors
            ? _AlphaValues.getAlphas(surfaceMode, blendLevel, Brightness.dark)
            : const _AlphaValues();

    // Determine the input surface and background colors.
    // The logic is that if they were passed via properties, those colors
    // are used, if not then colorScheme based colors are used, if they
    // were provided and we are not using blended surface and surface mode,
    // if we are, then we use the computed surfaces.
    // The final fallback is always the computed surface
    final bool _overrideScheme = blendLevel > 0 && surfaceMode != null;
    final Color _inputSurface = surface ??
        (_overrideScheme
            ? surfaceSchemeColors.surface
            : colorScheme?.surface) ??
        surfaceSchemeColors.surface;
    final Color _inputBackground = background ??
        (_overrideScheme
            ? surfaceSchemeColors.background
            : colorScheme?.background) ??
        surfaceSchemeColors.background;

    // For the on colors we pass in the primary, secondary and surface colors to
    // calculate onColors for. If some onColors were passed in, we give
    // that value to it, if it was not null it will be used instead of the
    // calculated onColor.
    const int divN = 3; // Tuned for less blend of color into its onColor.
    final FlexSchemeOnColors onColors = FlexSchemeOnColors.from(
      primary: effectiveColors.primary,
      secondary: effectiveColors.secondary,
      surface: _inputSurface,
      background: _inputBackground,
      error: effectiveColors.error ?? FlexColor.materialDarkError,
      onPrimary: onPrimary ?? colorScheme?.onPrimary,
      onSecondary: onSecondary ?? colorScheme?.onSecondary,
      onSurface: onSurface ?? colorScheme?.onSurface,
      onBackground: onBackground ?? colorScheme?.onBackground,
      onError: onError ?? colorScheme?.onError,
      primaryAlpha: _blend.primaryAlpha * 2 ~/ divN,
      secondaryAlpha: _blend.secondaryAlpha * 2 ~/ divN,
      surfaceAlpha: _blend.surfaceAlpha * 2 ~/ divN,
      backgroundAlpha: _blend.backgroundAlpha * 2 ~/ divN,
      errorAlpha: _blend.errorAlpha * 2 ~/ divN,
    );

    // Determine effective surface color.
    // Surface is used e.g. by Card and bottom appbar.
    // If true black, we make a darker than normal surface. If not
    // true black, we use provided surface color, or computed one.
    final Color effectiveSurfaceColor =
        darkIsTrueBlack ? _inputSurface.darken(8) : _inputSurface;

    // Determine effective background color.
    // Used e.g. by drawer, nav rail, side menu and bottom bar.
    // If true black, we use darker then normal background. If not true black,
    // we use provided background color, or computed one.
    final Color effectiveBackgroundColor =
        darkIsTrueBlack ? _inputBackground.darken(8) : _inputBackground;

    // Determine effective dialog background color.
    // If true black, we use darker than normal. If not true black,
    // we use dialog provided background color, or computed one.
    // The provided dialog background color overrides factory surface behavior,
    // but is impacted by true black mode for a darker effect.
    final Color effectiveDialogBackground = darkIsTrueBlack
        ? dialogBackground?.darken(8) ??
            surfaceSchemeColors.dialogBackground.darken(8)
        : dialogBackground ?? surfaceSchemeColors.dialogBackground;

    // Get the effective app bar color based on the style and opacity.
    Color? effectiveAppBarColor;
    switch (appBarStyle) {
      case FlexAppBarStyle.primary:
        effectiveAppBarColor = effectiveColors.primary;
        break;
      case FlexAppBarStyle.material:
        effectiveAppBarColor =
            darkIsTrueBlack ? Colors.black : FlexColor.materialDarkSurface;
        break;
      case FlexAppBarStyle.background:
        effectiveAppBarColor = effectiveBackgroundColor;
        break;
      case FlexAppBarStyle.surface:
        effectiveAppBarColor = effectiveSurfaceColor;
        break;
      case FlexAppBarStyle.custom:
        effectiveAppBarColor = effectiveColors.appBarColor ??
            (darkIsTrueBlack ? Colors.black : FlexColor.materialDarkSurface);
        break;
    }
    effectiveAppBarColor =
        appBarBackground ?? effectiveAppBarColor.withOpacity(appBarOpacity);

    return FlexColorScheme(
      // We pass along the original colorScheme too, but mostly its properties
      // will not be used as they have been used and potentially redefined by
      // the factory and are defined via other properties in the constructor.
      // Passing it along will however let us keep property values it may
      // have that we are not dealing with in FlexColorScheme when it returns
      // its [ColorScheme].
      colorScheme: colorScheme,
      // This is the dark theme factory so we always set brightness to dark.
      brightness: Brightness.dark,
      // Primary color for the application.
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
      // otherwise provided value or if null effective scheme background.
      scaffoldBackground: scaffoldBackground ??
          (darkIsTrueBlack
              ? Colors.black
              : surfaceSchemeColors.scaffoldBackground),
      // Color of dialog background elements.
      dialogBackground: effectiveDialogBackground,
      // Set app bar background to effective background color.
      appBarBackground: effectiveAppBarColor,
      // Effective error color and fallback.
      error: effectiveColors.error ?? FlexColor.materialDarkError,
      onPrimary: onColors.onPrimary,
      onSecondary: onColors.onSecondary,
      onSurface: onColors.onSurface,
      onBackground: onColors.onBackground,
      onError: onColors.onError,
      tabBarStyle: tabBarStyle,
      appBarElevation: appBarElevation,
      bottomAppBarElevation: effectiveBottomAppBarElevation,
      tooltipsMatchBackground: tooltipsMatchBackground,
      transparentStatusBar: transparentStatusBar,
      visualDensity: visualDensity,
      textTheme: textTheme,
      primaryTextTheme: primaryTextTheme,
      fontFamily: fontFamily,
      platform: platform,
      typography: typography,
      applyElevationOverlayColor: applyElevationOverlayColor,
      useSubThemes: useSubThemes,
      subThemesData: subThemesData,
    );
  }

  //****************************************************************************
  //
  // STATIC HELPER FUNCTIONS AND CONSTANTS
  //
  //  * flexTextTheme - M3 like text theme, font size wise.
  //  * comfortablePlatformDensity
  //  * themedSystemNavigationBar
  //  * createPrimarySwatch
  //
  //****************************************************************************

  /// A Material 3 (M3) like and inspired [TextTheme] for Material 2 (M2).
  ///
  /// This is used by the sub themes opt-in toggle to by default make the
  /// TextTheme match Material 3 phone size text theme. This is done as far as
  /// it can easily be defined within the constraint of Flutter SDK and its set
  /// of Material 1 and Material 2 typography.
  ///
  /// https://m3.material.io/styles/typography/overview
  /// Also see:
  /// https://github.com/flutter/flutter/issues/89853
  ///
  /// This default [m3TextTheme] when opting in on sub themes, can also be
  /// turned off by setting [FlexSubThemesData.useTextTheme] to false.
  /// This reverts the text theme back M2 2018 Typography
  ///
  /// The mapping of M3 styles to M2 styles were made based on this:
  /// https://github.com/flutter/flutter/issues/89853
  /// M3 has more text styles than those that can be represented by the
  /// M2 [TextTheme], those are excluded.
  static const TextTheme m3TextTheme = TextTheme(
    // M3 Display Large. In Material2018 Typography: 96, w300, -1.5
    headline1: TextStyle(
      fontSize: 57,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
    ),
    // M3 Display Medium. In Material2018 Typography: 60, w300, -0.5
    headline2: TextStyle(
      fontSize: 45,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
    ),
    // M3 Display Small. In Material2018 Typography: 48, w400, 0
    headline3: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
    ),
    // M3 Headline Medium. In Material2018 Typography: 34, w400, 0.25
    headline4: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
    ),
    // M3 Headline Small. In Material2018 Typography: 24, w400, 0
    headline5: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
    ),
    // M3 Title Large. In Material2018 Typography: 20, w500, 0.15
    headline6: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
    ),
    // M3 Title Medium. In Material2018 Typography: 16, w400, 0.15
    subtitle1: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
    ),
    // M3 Title Small. In Material2018 Typography: 14, w500, 0.1
    subtitle2: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
    ),
    // M3 Body Large. In Material2018 Typography: 16, w400, 0.5
    bodyText1: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      // M3 Guide says 0.15: https://m3.material.io/styles/typography/tokens
      // Table here said 0.5: https://github.com/flutter/flutter/issues/89853
      // Went with M3 Guide value, reported discrepancy.
      letterSpacing: 0.15,
    ),
    // M3 Body Medium. In Material2018 Typography: 14, w400, 0.25
    bodyText2: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
    // M3 Body Small. In Material2018 Typography: 12, w400, 0.4
    caption: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
    ),
    // M3 Label Large. In Material2018 Typography: 14, w500, 1.25
    button: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
    ),
    // M3 Label Small. In Material2018 Typography: 10, w400, 1.5
    overline: TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
    ),
  );

  /// Returns a [VisualDensity] that is [defaultTargetPlatform] adaptive to
  /// [VisualDensity.comfortable] instead of to [VisualDensity.compact].
  ///
  /// For desktop platforms, this returns [VisualDensity.comfortable], and
  /// for other platforms, it returns the default [VisualDensity.standard].
  ///
  /// This is a variant of the [VisualDensity.adaptivePlatformDensity] that
  /// returns [VisualDensity.compact] for desktop platforms.
  ///
  /// The comfortable visual density is useful on desktop and desktop web
  /// laptops that have touch screens as it keeps touch targets a bit larger
  /// than when using compact.
  static VisualDensity get comfortablePlatformDensity {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
      case TargetPlatform.iOS:
      case TargetPlatform.fuchsia:
        break;
      case TargetPlatform.linux:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        return VisualDensity.comfortable;
    }
    return VisualDensity.standard;
  }

  /// Returns a [SystemUiOverlayStyle] that by default has a system navigation
  /// bar style that matches the current theme.
  ///
  /// For its default behavior it requires a build context with access to the
  /// inherited theme. This static function is a convenience wrapper for making
  /// a [SystemUiOverlayStyle] that follows current theme. For very customized
  /// styles consider using [SystemUiOverlayStyle] directly.
  ///
  /// By default when calling [themedSystemNavigationBar] with context, it
  /// creates a [SystemUiOverlayStyle] where the system navigator bar uses
  /// current theme's ´colorScheme.background´ as its background color and
  /// icon colors that match this background, without any divider.
  ///
  /// The background color can be modified with [systemNavBarStyle] that
  /// can use: system, surface, background, scaffoldBackground or transparent
  /// options as background color options. It defaults to background.
  /// See [FlexSystemNavBarStyle] for more info.
  ///
  /// In standard Flutter themes, the surface, background, scaffoldBackground
  /// and in light theme, even system are all the same color. For such themes
  /// this convenience property does not make so much sense. However, if you use
  /// FlexColorScheme and its primary color surface branding, these colors are
  /// not the same. This then offers a convenient way to switch the
  /// background color of your system navigation bar in a way that matches
  /// your theme's surface branded background color and to choose which one
  /// to use.
  ///
  /// The always sets `systemNavigationBarContrastEnforced: false` to try to
  /// avoid the system scrim on Android version where it is supported. This
  /// is done because the selected background color is the scrim itself when
  /// used with the opacity parameter and we never want an extra scrim. If we
  /// set opacity very low and loose contrast due to that, it is because it is
  /// our intent.
  ///
  /// An optional divider on the navigation bar, which is only
  /// respected on Android P (= Pie = API 28 = Android 9) or higher, can be
  /// turned on by setting [useDivider] to true. This produces a divider on top
  /// of the system navigation bar that in light theme mode uses color
  /// 0xFF2C2C2C and in dark mode and 0xFFDDDDDD.
  ///
  /// You can modify the default color of the divider with the optional
  /// [systemNavigationBarDividerColor]. The call to set and use the divider
  /// color is only made once a none null value has been given to [useDivider].
  /// Android SDK < 29 does not respect provided alpha value on the color of
  /// the divider color, and calling it with null again will not remove it.
  ///
  /// Be aware that once you have enabled the divider by setting it to true that
  /// there is no convenient way to get rid of it. You can set the value
  /// to false, but that will just make the divider same color as your current
  /// nav bar background color to make it invisible, it is still there, but
  /// still this implementation trick works well.
  ///
  /// Use and support for the [opacity] value on the system navigation bar
  /// is now supported starting from Flutter 2.5. This PR once it lands in
  /// stable will also for more predictable and consistent behavior limit its
  /// functionality to SDK >= 29: https://github.com/flutter/engine/pull/28616
  ///
  /// By default [themedSystemNavigationBar] does not set any system overlay
  /// for the status bar. In Flutter SDK the top status bar has its own built in
  /// [SystemUiOverlayStyle] as a part of [AppBar] and [AppBarTheme].
  /// [FlexColorScheme] also manages the [SystemUiOverlayStyle] for the status
  /// bar via it. However, if your screen has no [AppBar] you can use the
  /// property [noAppBar] and [invertStatusIcons] to affect the look of the
  /// status icons when there is no [AppBar] present on the page, this is
  /// useful e.g. for splash and intro screens.
  static SystemUiOverlayStyle themedSystemNavigationBar(
    BuildContext? context, {

    /// Use a divider line on the top edge of the system navigation bar.
    ///
    /// Defaults to null. Keeping it null, by omission or passing null, always
    /// omits the call to set any divider color in the created
    /// [SystemUiOverlayStyle].
    ///
    /// The divider on the navigation bar, is only respected on Android P
    /// (= Pie = API 28 = Android 9) or higher.
    ///
    /// Activating the divider also introduces a system overlay scrim on the
    /// system navigation bar. It becomes visible at high opacity values, but
    /// it removed when opacity is 0. This happens despite that we always set
    /// `systemNavigationBarContrastEnforced: false` in the call.
    final bool? useDivider,

    /// Opacity value for the system navigation bar.
    ///
    /// The opacity value is applied to the provided `systemNavigationBarColor`
    /// or if is null, to the color determined by `systemNavBarStyle`.
    ///
    /// Defaults to 1, fully opaque.
    ///
    /// This feature is now supported starting from Flutter 2.5.
    /// Be aware that it only works on Android SDK >= 29. There may even
    /// may be some issues on Android SDK < 29 until this PR lands in stable:
    /// https://github.com/flutter/engine/pull/28616
    ///
    /// This issue is a good source for more information on current state
    /// of transparent navigation bars in Flutter on Android:
    /// https://github.com/flutter/flutter/issues/90098
    final double opacity = 1,

    /// Set this to true if you do not use a Material AppBar and want
    /// a uniform background where the status bar's icon region is.
    ///
    /// This would typically be true on pages like splash screens and intro
    /// screens that don't use an AppBar. The Material AppBar uses its own
    /// `SystemUiOverlayStyle` so don't use this with an AppBar, set the style
    /// on the AppBar theme instead. However, if you don't have an [AppBar] this
    /// is a convenient way of to remove the system icons scrim for a more
    /// clean look on Android.
    final bool noAppBar = false,

    /// Set to true to invert top status bar icons like, battery, network,
    /// wifi icons etc. in relation to their normal theme brightness related
    /// color.
    ///
    /// Defaults to false.
    ///
    /// This setting works well together with the `noAppBar` flag to make an
    /// even cleaner looking splash screen by making the
    /// top status bar icons less visible or even invisible.
    ///
    /// On a white background the status icons will be invisible, and if a
    /// fully black background is used in dark mode, they will be invisible
    /// in dark mode too. This can be used to create clean screen with no
    /// app bar and no status icons.
    ///
    /// For no status bar and and system navigation bar, you can also try using:
    /// `SystemChrome.setEnabledSystemUIOverlays(<SystemUiOverlay>[]);` to
    /// remove the top status bar and bottom navigation bar completely. When
    /// using that method there are however issues with them showing up again
    /// on navigation and when keyboard becomes visible, or app is restored
    /// from being in the background while using another app. You
    /// also have to manage putting the overlays back yourself manually with
    /// `SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values)` when
    /// moving away from the screen that had removed them. Using an
    /// `AnnotatedRegion` with `themedSystemNavigationBar` and both `noAppBar`
    /// and `invertStatusIcons` set to true, you can avoid these issues. You are
    /// however limited to using background white, in light mode and black in
    /// dark mode, if you want the status bar to be totally invisible and
    /// navigation bar to blend in with the background completely.
    final bool invertStatusIcons = false,

    /// The [FlexSystemNavBarStyle] used to determine the background color
    /// for the system navigation bar. Used when systemNavigationBarColor
    /// is null and context is not null, so theme colors corresponding to it
    /// can be used for the background color.
    ///
    /// Defaults to [FlexSystemNavBarStyle.background].
    final FlexSystemNavBarStyle systemNavBarStyle =
        FlexSystemNavBarStyle.background,

    /// Background color of the system navigation bar. If null the theme of
    /// context `colorScheme.background` will be used as background color.
    ///
    /// The point with this static helper is to give you a background color
    /// themed system navigation bar automatically. If you for some reason
    /// want a different color you can still override it this property.
    ///
    /// If `context` is null, `nullContextBrightness` will be used as brightness
    /// value and it will determine if the background is white (for
    /// Brightness.light) or black (for Brightness.dark) if this property is
    /// also null. The null context is mostly used for simple unit testing
    /// with no context, but can also be used to make a `SystemUiOverlayStyle`
    /// with this helper without having a context.
    final Color? systemNavigationBarColor,

    /// Optional color for the system navigation bar divider. A divider will
    /// only be present if `useDivider` is true and in this color if a
    /// value was given to it.
    ///
    /// If a color is not given the `Color(0xFF2C2C2C)` will be used in
    /// dark mode and the color `Color(0xFFDDDDDD)` will be used in light mode,
    /// as the divider color for the system navigation bar.
    ///
    /// The divider on the navigation bar, is only respected on Android P
    /// (= Pie = API 28 = Android 9) or higher.
    final Color? systemNavigationBarDividerColor,

    /// Brightness used if context is null, mostly used for simple unit testing,
    /// with no context present. However, it can also be used to make a
    /// `SystemUiOverlayStyle` without having a context.
    ///
    /// Defaults to Brightness.light.
    final Brightness nullContextBrightness = Brightness.light,

    /// Deprecated property, use systemNavigationBarColor instead.
    @Deprecated('This property is deprecated use systemNavigationBarColor '
        'instead. Deprecated in v2.0.0.')
        Color? nullContextBackground,
  }) {
    double _opacity = opacity;
    if (_opacity < 0) _opacity = 0;
    if (_opacity > 1) _opacity = 1;

    // If systemNavigationBarColor is null, we assign nullContextBackground
    // to it, that may also be null. This is done for backwards compatibility.
    final Color? _systemNavigationBarColor =
        systemNavigationBarColor ?? nullContextBackground;

    // If the systemNavBarStyle is FlexSystemNavBarStyle.transparent we will
    // override opacity to 0.01.
    if (systemNavBarStyle == FlexSystemNavBarStyle.transparent) {
      _opacity = 0.01;
    }
    // If context was null, use nullContextBrightness as brightness value.
    final bool isDark = context != null
        ? Theme.of(context).brightness == Brightness.dark
        : nullContextBrightness == Brightness.dark;

    // Get the defined effective background color for the used style.
    // This is not pretty, but wanted a final for the background.
    final Color flexBackground = (context != null)
        ? systemNavBarStyle == FlexSystemNavBarStyle.system
            ? (isDark ? Colors.black : Colors.white)
            : systemNavBarStyle == FlexSystemNavBarStyle.background
                ? Theme.of(context).colorScheme.background
                : systemNavBarStyle == FlexSystemNavBarStyle.surface
                    ? Theme.of(context).colorScheme.surface
                    : systemNavBarStyle ==
                            FlexSystemNavBarStyle.scaffoldBackground
                        ? Theme.of(context).scaffoldBackgroundColor
                        : Theme.of(context).scaffoldBackgroundColor
        : (isDark ? Colors.black : Colors.white);

    // If a systemNavigationBarColor color is given, it will always be used,
    // If it is not given, we use above flexBackground.
    final Color background = _systemNavigationBarColor ?? flexBackground;

    // A divider will be applied if `useDivider` is true and it will
    // use provided `systemNavigationBarDividerColor` if a value was given
    // or fallback to suitable theme mode default divider colors if no
    // color was given.
    //
    // The logic below is intended to keep the `dividerColor` used in the
    // [SystemUiOverlayStyle] as null as long as `useDivider` is null. As soon
    // as it is not, it will set a Divider color, also with `false` value. With
    // false it will be set to resulting background color in order to hide the
    // divider by making it background colored. This is a way to remove
    // the divider if it has been enabled earlier, since you cannot remove it
    // with a null color value after it has been enabled with any known
    // `SystemUiOverlayStyle` and `SystemChrome` call. The false value then
    // provide means to at least hide it again, but it will still be there.
    //
    // Worth noticing is also that the opacity does not have any effect on
    // divider color in SDK<29 of Android. We apply some opacity anyway because
    // if you are using transparent system navigation bar on Android API30 or
    // higher it does, work and it looks nicer when it has some transparency
    // if the navbar is also transparent.
    Color? dividerColor;

    // If we have opacity on the navbar, we should have some on the divider too
    // when we have a divider, we use some, but not a lot, we do want to keep
    // visible and not fade a way with background opacity, since a divider was
    // requested.
    final double dividerOpacity = _opacity < 1 ? 0.8 : 1;

    if (useDivider == null) {
      // The dividerColor is already null from declaration above with no value,
      // but being explicit that in this case this is the case where we want a
      // null color value for the divider as well in order to not include it
      // in the `SystemUiOverlayStyle`.
      dividerColor = null;
    } else if (useDivider && systemNavigationBarDividerColor == null) {
      // We should have a divider, but have no given color, use defaults.
      dividerColor = isDark
          ? const Color(0xFF2C2C2C).withOpacity(dividerOpacity)
          : const Color(0xFFDDDDDD).withOpacity(dividerOpacity);
    } else if (useDivider && systemNavigationBarDividerColor != null) {
      // We should have a divider, with a given color.
      dividerColor =
          systemNavigationBarDividerColor.withOpacity(dividerOpacity);
    } else {
      // If this branch is reached, then useDivider is false and we must define
      // its color to whatever color the background is, in order to hide it
      // as well as possible.
      dividerColor = background.withOpacity(_opacity);
    }
    // If opacity is specified, we need to enable SystemUiMode.edgeToEdge to
    // be able to see content scrolling behind the transparent bar. We only do
    // so when we have any opacity specified.
    // TODO(rydmike): Follow-up on edgeToEdge issue and adjust if needed.
    //   This is a gold mine: https://github.com/flutter/flutter/issues/90098
    if (_opacity < 1) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    }
    return SystemUiOverlayStyle(
      // The top status bar settings.
      // If no params are set that indicates we on purpose want to adjust it
      // because there is no `AppBar`, we must pass null to avoid changing any
      // of its values controlled by the `AppBar` and its theme.
      statusBarColor: noAppBar ? Colors.transparent : null,
      statusBarBrightness:
          noAppBar ? (isDark ? Brightness.dark : Brightness.light) : null,
      statusBarIconBrightness: noAppBar
          ? invertStatusIcons
              ? (isDark ? Brightness.dark : Brightness.light)
              : (isDark ? Brightness.light : Brightness.dark)
          : null,
      // The bottom navigation bar settings.
      systemNavigationBarContrastEnforced: false,
      systemNavigationBarColor: background.withOpacity(_opacity),
      systemNavigationBarDividerColor: dividerColor,
      systemNavigationBarIconBrightness:
          isDark ? Brightness.light : Brightness.dark,
    );
  }

  // TODO(rydmike): Consider the FlexColorPicker approach to find MaterialColor.
  // If the passed in color is from any MaterialColor swatch, the solution
  // used in FlexColorPicker could be used to find it and for such a case
  // instead return the actual related MaterialColor swatch.
  // Introducing it now for existing schemes would be breaking changes for the
  // colors they get for primaryColorDark, primaryColoLight and
  // secondaryHeaderColor. It could however be introduced as an optional toggle
  // for schemes when using a color from any MaterialColor swatch. This way
  // these rarely used supporting colors would get and use actual colors from
  // the corresponding MaterialColor swatch and not computed
  // approximations, in cases where a Material Swatch is used as the
  // 'primary' scheme color. For cases when the primary scheme color is not a
  // MaterialSwatch color, the toggle would have no impact, the colors would
  // be computed same way as now.

  // TODO(rydmike): Find the algorithm that produces the Material Colors.
  // Having access to the actual algorithm that produces the Material color
  // swatches would be even better than the above approach.
  // Not bothering with it now, wait and see what Material 3 brings to
  // Flutter. Also have an idea on how to approach it with alpha blends that
  // I think will produce nicer looking swatches than the algorithm below.

  /// Create a primary Material color swatch from a given [color].
  ///
  /// The provided [color] is used as the Material swatch default color 500
  /// in the returned swatch, with lighter hues for lower indexes and darker
  /// shades for higher index values.
  ///
  /// If you give this function a standard Material color index 500 value,
  /// eg `Colors.red[500]` it will not return the same swatch as `Colors.red`.
  /// This function is an approximation and gives an automated way of creating
  /// a Material like primary swatch.
  static MaterialColor createPrimarySwatch(final Color? color) {
    // Null default fallback is default material primary light color.
    final Color _color = color ?? FlexColor.materialLightPrimary;
    const List<double> strengths = <double> //
        [0.05, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9];
    final Map<int, Color> swatch = <int, Color>{};
    final int r = _color.red;
    final int g = _color.green;
    final int b = _color.blue;
    for (final double strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(_color.value, swatch);
  }

  //****************************************************************************
  //
  // MAKE THE THEME
  //
  // Getter: toTheme
  //
  //****************************************************************************

  /// Returns the [ThemeData] object defined by [FlexColorScheme] properties
  /// and its theming logic.
  ///
  /// After you have defined your scheme with [FlexColorScheme] or one of its
  /// factories [FlexColorScheme.light], [FlexColorScheme.dark], use
  /// [toTheme] to get the resulting [ThemeData] object defined by
  /// your [FlexColorScheme] definition.
  ///
  /// The returned [ThemeData] contains some opinionated modifications and dark
  /// theme corrections, compared to what you get if you would just use the
  /// standard [ThemeData.from] a [ColorScheme]. You can always override these
  /// with your own theme modifications by using the [ThemeData.copyWith]
  /// method on the resulting theme.
  ///
  /// The differences from the standard [ThemeData.from] factory are:
  ///
  ///  * `ScaffoldBackground` has its own color property in `FlexColorScheme`
  ///    and can if so desired differ from the `ColorScheme.background`
  ///    color. In the branding implementation, the `scaffoldBackground`
  ///    typically gets no primary branding applied, only in the heavy choice
  ///    is there a small amount. Whereas `background` in a FlexColorScheme
  ///    receives the most color branding of the surface colors. This fits
  ///    well for where the `background` color is used on Material in Widgets,
  ///    but it does not go so well together with `scaffoldBackground`, which
  ///    is the reason why it has its own color value in this implementation.
  ///
  ///  * The default `dialogBackgroundColor` uses the `ColorScheme.surface`
  ///    color instead of the `ColorScheme.background`. The `background` color
  ///    needed the strongest branding when branding is used, but this did not
  ///    look so good on dialogs, so its color choice was changed to `surface`
  ///    instead, that gets lighter branding in FlexColorScheme when it is
  ///    used. With standard Material surface colors the `background` and
  ///    `surface` colors are the same, so there is no difference when using
  ///    the default background and surface colors.
  ///
  ///  * The `indicatorColor` is same as effectiveTabColor which uses a
  ///    function with logic to determine its color bases on if a TabBarTheme
  ///    was selected that should work on current app bar background color,
  ///    or on surface/background colors.
  ///
  ///  * For `toggleableActiveColor` the `ColorScheme.secondary` color is used.
  ///    The Flutter default just uses the default `ThemeData` colors and
  ///    not the actual colors you define in the `ColorScheme` you create your
  ///    theme from. Perhaps an oversight in Flutter?
  ///    See issue: https:///github.com/flutter/flutter/issues/65782.
  ///
  ///  * Flutter themes created with `ThemeData.from` does not define any color
  ///    scheme related color for the `primaryColorDark` color, this method
  ///    does.  See issue: https:///github.com/flutter/flutter/issues/65782.
  ///    The `ThemeData.from` leaves this color at `ThemeData` factory default,
  ///    this may not match your scheme. Widgets seldom use this color, so the
  ///    issue is rarely seen.
  ///
  ///  * Flutter themes created with `ThemeData.from` does not define any color
  ///    scheme based color for the `primaryColorLight` color, this method does.
  ///    See issue: https:///github.com/flutter/flutter/issues/65782.
  ///    The `ThemeData.from` leaves this color at `ThemeData` factory default
  ///    this may not match your scheme. Widgets seldom use this color, so the
  ///    issue is rarely seen.
  ///
  ///  * Flutter themes created with `ThemeData.from` does not define any color
  ///    scheme based color for the `secondaryHeaderColor` color, this method
  ///    does. See issue: https:///github.com/flutter/flutter/issues/65782.
  ///    `ThemeData.from` leaves this color at `ThemeData` factory default this
  ///    may not match your scheme. Widgets seldom use this color, so the issue
  ///    is rarely seen.
  ///
  ///  * Background color for `AppBarTheme` can use a custom color theme
  ///    in both light and dark themes, that is not dependent on theme
  ///    primary or surface color.
  ///    In the versions prior to Flutter 2.0.0 doing this was difficult to do.
  ///    As presented in https://github.com/flutter/flutter/issues/50606
  ///    A new feature in Flutter 2.0.0 implemented via:
  ///    https://github.com/flutter/flutter/pull/71184 makes this easy and
  ///    better. FlexColorScheme's implementation has been changed to use this
  ///    new AppBarTheme feature starting with version 2.0.0-nullsafety.2.
  ///
  ///  * The `AppBarTheme` elevation defaults to 0, an iOs style influenced
  ///    opinionated choice. It can easily be adjusted directly in the
  ///    `FlexColorScheme` definition with property value `appBarElevation`
  ///    without creating a sub theme or using `copyWith`.
  ///    For the main less used constructor of `FlexColorScheme` it is required
  ///    and cannot be null. The `FlexColorScheme` `light` and `dark` factories
  ///    can be null but it will default to 0 if null.
  ///
  ///  * The `bottomAppBarColor` uses color scheme background color to match the
  ///    background color of the drawer, bottom navigation bar, possible side
  ///    menu and system navigation bar on android (if theming of it is used).
  ///    This is a slight change from the ColorScheme default that uses
  ///    surface color.
  ///
  ///  * The `BottomAppBarTheme` elevation defaults to `appBarElevation` or 0 if
  ///    it is null, an iOs style influenced opinionated choice. It can easily
  ///    be adjusted directly in the `FlexColorScheme` definition with property
  ///    value `bottomAppBarElevation` without creating a sub theme or
  ///    using `copyWith`.
  ///
  ///  * In `TextSelectionThemeData`, the standard for `selectionColor` is
  ///    `colorScheme.primary` with opacity value `0.4` for dark-mode and `0.12`
  ///    for light mode. Here primary with `0.5` for dark-mode and `0.3` for
  ///    light mode is used. The standard for `selectionHandleColor` is
  ///    `colorScheme.primary`, here we use the slightly darker shade
  ///    `primaryColorDark` instead, which does not have a proper color
  ///    scheme color value in Flutter standard `ColorScheme` based themes.
  ///
  ///  * A predefined slightly opinionated [InputDecorationTheme] is used. It
  ///    sets `filled` to `true` and fill color to color scheme primary color
  ///    with opacity `0.035` in light mode and opacity `0.06` in dark-mode.
  ///
  ///  * The property `fixTextFieldOutlineLabel` is set to `true` by default,
  ///    it looks better. The only reason why it is not the default in Flutter,
  ///    is for default backwards legacy design compatibility.
  ///
  ///  * For [ThemeData.buttonTheme] the entire color scheme is passed to its
  ///    `colorScheme` property and it uses `textTheme` set to
  ///    `ButtonTextTheme.primary`, plus minor changes to padding and tap target
  ///    size. These modifications make the old buttons almost match the
  ///    default design and look of their corresponding newer buttons.
  ///    Thus the `RaisedButton` looks very similar to `ElevatedButton`,
  ///    `OutlineButton` to `OutlinedButton` and `FlatButton` to `TextButton`.
  ///    There are some differences in margins and looks, especially in
  ///    dark-mode, but they are very similar.
  ///
  ///  * The default theme for Chips contain a design bug that makes the
  ///    selected `ChoiceChip()` widget look disabled in dark-mode, regardless
  ///    if was created with `ThemeData` or `ThemeData.from` factory.
  ///    See issue: https:///github.com/flutter/flutter/issues/65663
  ///    The [ChipThemeData] modification used here fixes the issue.
  ///
  /// * For [TabBarTheme], the Flutter standard selected tab and indicator
  ///   color is onSurface in dark mode and on Primary in light mode, which is
  ///   designed to fit an AppBar colored TabBar. This is kept, and the default
  ///   via [FlexTabBarStyle.forAppBar] style, with a minor modification. If
  ///   AppBar is "light", then black87 is used, not black, it is the same as
  ///   the textTheme on AppBar in light app bar brightness.
  ///   If the [FlexTabBarStyle.forBackground] style was used, the
  ///   selected  color is always color scheme primary color, which works well
  ///   on surface, background and scaffold background colors.
  ///
  ///   The unselected TabBar color when [FlexTabBarStyle.forBackground] style
  ///   is used, is always the onSurface color with 60% opacity. This is also
  ///   the color if the AppBar background color brightness is light AND its
  ///   color is white, surface or background colored.
  ///   Otherwise when the style [FlexTabBarStyle.forAppBar] is used, the
  ///   unselected tab bar color is the selected tab color with 70% opacity.
  ///   This opacity value is the same  as Flutter default for the default
  ///   theme that is also designed for AppBar usage.
  ///
  /// * The [BottomNavigationBarThemeData] uses color scheme primary color for
  ///   the selected item in both light and dark theme. Flutter SDK defaults
  ///   to secondary color in dark mode. Using only primary color
  ///   is a design used on iOS by default for the bottom navigation bar. We
  ///   agree and think it looks better as the default choice for apps also
  ///   in dark mode.
  ///
  /// * Default tooltip theme in Flutter is currently a bit flawed on desktop
  ///   and web, because it defaults to using a very small font (10 dp).
  ///   See issue: https:///github.com/flutter/flutter/issues/71429
  ///
  ///   The default theming also does not handle multiline tooltips very well.
  ///   The here used [TooltipThemeData] theme design corrects both these
  ///   issues. It uses 12 dp font on desktop and web instead of 10 dp,
  ///   and some padding instead of a height constraint to ensure that
  ///   multiline tooltips look nice too.
  ///
  ///   FlexColorScheme also includes a new boolean property
  ///   [tooltipsMatchBackground], that can be toggled to not used Flutter's
  ///   Material default that has a theme mode
  ///   inverted background. Tooltips using light background in light theme
  ///   and dark in dark, are commonly used on the Windows desktop platform.
  ///   You can tie the extra property to used platform to make an automatic
  ///   platform adaptation of the tooltip style if you like, or give users
  ///   a preference toggle the tooltip style to their liking.
  ///
  /// * The property [transparentStatusBar] is set to true by default and
  ///   used to make to the AppBar one-toned on Android device like on iOS.
  ///   Set it to `false` to restore default Android design.
  ///
  ///   > It would be nice if we could also make the system navigation button
  ///   > area on Android transparent via a theme, but it does not work.
  ///   > The style is doable, but requires modifying Android config files, not
  ///   > possible from Flutter only (as per current information).
  ///   > Related issue: https:///github.com/flutter/flutter/issues/69999.
  ///   >
  ///   > FlexColorScheme offers a static helper [themedSystemNavigationBar]
  ///   > that allows us to easily create an annotated region for the system
  ///   > navigation bar that uses the active color scheme and theme mode to
  ///   > make it at least use a correctly colored theme colored background
  ///   > for the active theme.
  ///   > See example 5 for a demo on how to use this.
  ThemeData get toTheme {
    // Use passed in sub-theme config data or a default one if none given.
    final FlexSubThemesData subTheme =
        subThemesData ?? const FlexSubThemesData();

    // Get the effective standard Flutter ColorScheme from the provided
    // brightness and provided or computed or default colors.
    final ColorScheme colorScheme = toScheme;

    // A convenience bool to check if this theme is for light or dark mode
    final bool isDark = colorScheme.brightness == Brightness.dark;

    // Use passed in target platform, else actual host platform.
    final TargetPlatform effectivePlatform = platform ?? defaultTargetPlatform;

    // TODO(rydmike): Remove when default in Flutter, still 2014 in Flutter 2.5.
    // Used Typography deviates from the Flutter standard that _still_ uses the
    // old Typography.material2014 in favor of the newer Typography.material2018
    // as default, if one is not provided, we want the Material 2 correct 2018
    // version to be the default.
    final Typography effectiveTypography =
        typography ?? Typography.material2018(platform: effectivePlatform);

    // We need the text themes locally for the theming, so we must form them
    // fully using the same process that the ThemeData() factory uses.
    TextTheme defTextTheme =
        isDark ? effectiveTypography.white : effectiveTypography.black;

    final bool primaryIsDark =
        ThemeData.estimateBrightnessForColor(colorScheme.primary) ==
            Brightness.dark;
    TextTheme defPrimaryTextTheme =
        primaryIsDark ? effectiveTypography.white : effectiveTypography.black;

    if (fontFamily != null) {
      // ThemeData uses this to apply a font from fontFamily. It works OK, but
      // it resets all typography and it uses regular style and weight
      // for all styles in the text theme. Consider defining the text theme
      // explicitly via textTheme and primaryTextTheme with the custom
      // font applied, at least if you want to use custom fonts and keep the
      // standard  typography, or supply your own complete typography with your
      // custom text theme.
      defTextTheme = defTextTheme.apply(fontFamily: fontFamily);
      defPrimaryTextTheme = defPrimaryTextTheme.apply(fontFamily: fontFamily);
    }

    // TODO(rydmike): Use SDK Material3 and new Flutter APIs when available.
    // TODO(rydmike): Use SDK Material3 TextTheme when available.
    // We are using sub themes and blend colors on text themes. If surfaces and
    // background are not set to use blends, the effect will be slightly
    // different, a bit less colorful, but only very marginally.
    if (useSubThemes && subTheme.blendTextTheme) {
      // Use the on color for surface or background that gives us better
      // contrast. Finding the right one by comparing red values seemed
      // to work well enough.
      final Color _onColor = isDark
          ? (colorScheme.onBackground.red < colorScheme.onSurface.red)
              ? colorScheme.onSurface
              : colorScheme.onBackground
          : (colorScheme.onBackground.red > colorScheme.onSurface.red)
              ? colorScheme.onSurface
              : colorScheme.onBackground;

      // Calculate colors for the different TextStyles, these are just best
      // approximations, color blend strength is a bit inline with opacities on
      // the 2018 typography, but that might not match what is used for color
      // strength on colored text in Material 3. I could not find definitions
      // for that in the Material 3 guide yet. They might also be just flat
      // one color tone for all sizes. That would be simpler, but event that
      // color is not know yet.
      final Color _head = isDark
          ? _onColor.blend(colorScheme.primary, 40)
          : _onColor.blend(colorScheme.primary, 50);
      final Color _medium = isDark
          ? _onColor.blend(colorScheme.primary, 22)
          : _onColor.blend(colorScheme.primary, 40);
      final Color _small = isDark
          ? _onColor.blend(colorScheme.primary, 20)
          : _onColor.blend(colorScheme.primary, 30);
      // Apply the computed colors. Most fonts have no opacity when using this
      // type of styling, they are computed with a color matching their
      // background. This does not work so well if you need to put text on
      // a completely different colored container than the background color.
      // Which is why this feature can be opted out of.
      // M3 has separate colored text for different colored containers.
      // Can't match that with M2 themes.
      defTextTheme = defTextTheme.copyWith(
        headline1: defTextTheme.headline1!.copyWith(color: _head),
        headline2: defTextTheme.headline2!.copyWith(color: _head),
        headline3: defTextTheme.headline3!.copyWith(color: _head),
        headline4: defTextTheme.headline4!.copyWith(color: _head),
        headline5: defTextTheme.headline5!.copyWith(color: _medium),
        headline6: defTextTheme.headline6!.copyWith(color: _medium),
        subtitle1: defTextTheme.subtitle1!.copyWith(color: _medium),
        subtitle2: defTextTheme.subtitle2!.copyWith(color: _small),
        bodyText1: defTextTheme.bodyText1!.copyWith(color: _medium),
        bodyText2: defTextTheme.bodyText2!.copyWith(color: _medium),
        button: defTextTheme.button!.copyWith(color: _medium),
        // Caption in English2018 has heading level opacity in Material2.
        // I noticed it still needs some, eg ListTile uses the color from
        // caption, with its opacity, to make the subtitles more muted, this
        // is an important design effect that we get automatically if we give
        // it some opacity, just not going to give it as much since we also
        // have colors and it is imo a bit too low contrast in M2.
        caption: defTextTheme.caption!
            .copyWith(color: _medium.withAlpha(isDark ? 0xCC : 0xBF)), //80,75%
        overline: defTextTheme.overline!.copyWith(color: _small),
      );
      // Equivalent color blend calculations for primary text theme.
      final Color _headP = primaryIsDark
          ? colorScheme.onPrimary.blend(colorScheme.primary, 16)
          : colorScheme.onPrimary.blend(colorScheme.primary, 10);
      final Color _mediumP = primaryIsDark
          ? colorScheme.onPrimary.blend(colorScheme.primary, 8)
          : colorScheme.onPrimary.blend(colorScheme.primary, 5);
      final Color _smallP = primaryIsDark
          ? colorScheme.onPrimary.blend(colorScheme.primary, 7)
          : colorScheme.onPrimary.blend(colorScheme.primary, 4);
      defPrimaryTextTheme = defPrimaryTextTheme.copyWith(
        headline1: defPrimaryTextTheme.headline1!.copyWith(color: _headP),
        headline2: defPrimaryTextTheme.headline2!.copyWith(color: _headP),
        headline3: defPrimaryTextTheme.headline3!.copyWith(color: _headP),
        headline4: defPrimaryTextTheme.headline4!.copyWith(color: _headP),
        headline5: defPrimaryTextTheme.headline5!.copyWith(color: _mediumP),
        headline6: defPrimaryTextTheme.headline6!.copyWith(color: _mediumP),
        subtitle1: defPrimaryTextTheme.subtitle1!.copyWith(color: _mediumP),
        subtitle2: defPrimaryTextTheme.subtitle2!.copyWith(color: _smallP),
        bodyText1: defPrimaryTextTheme.bodyText1!.copyWith(color: _mediumP),
        bodyText2: defPrimaryTextTheme.bodyText2!.copyWith(color: _mediumP),
        button: defPrimaryTextTheme.button!.copyWith(color: _mediumP),
        caption: defPrimaryTextTheme.caption!.copyWith(
            color: _mediumP.withAlpha(primaryIsDark ? 0xD8 : 0xCC)), //85,70%)
        overline: defPrimaryTextTheme.overline!.copyWith(color: _smallP),
      );
    }
    // Use M3 text theme when sub themes enabled, and M3 text themes opt-in.
    if (useSubThemes && subTheme.useTextTheme) {
      defTextTheme = defTextTheme.merge(m3TextTheme);
      defPrimaryTextTheme = defPrimaryTextTheme.merge(m3TextTheme);
    }
    // Make our final complete TextTheme, by also merging in the two TextThemes
    // passed in via the constructor, adding any custom text theme definitions.
    final TextTheme effectiveTextTheme = defTextTheme.merge(textTheme);
    final TextTheme effectivePrimaryTextTheme =
        defPrimaryTextTheme.merge(primaryTextTheme);

    // When working with color scheme based colors, there is no longer a
    // Material primary swatch that we can use to create some of the old
    // Theme colors from. Those colors are still needed by some Flutter Widgets.
    // To be able to make these colors we compute a complete material like
    // color swatch from the provided primary color, using the primary color
    // as the MaterialColor's mid [500] index color.
    final MaterialColor primarySwatch =
        createPrimarySwatch(colorScheme.primary);
    // We now have a swatch of the primary color provided via a color scheme,
    // we can use it to define some of the traditional theme colors in a way
    // that relates to the color scheme's primary color, like ThemeData factory
    // does when you create a theme from a swatch. This gives us some missing
    // critical shades of the primary color to work with.
    final Color primaryColorDark =
        isDark ? primarySwatch[700]! : primarySwatch[800]!;
    final Color primaryColorLight = primarySwatch[100]!;
    final Color secondaryHeaderColor = primarySwatch[50]!;

    // AppBar background color: If a custom color for the AppBar was
    // passed in, we use that. If not, we use the surface color in dark mode and
    // primary color in light mode. Which is the same logic that the
    // Flutter SDK ThemeData.from factory sets the AppBar background color to,
    // but via a convoluted ThemeData.primaryColor modification, causing
    // primaryColor to be almost black in dark mode, which is weird, but since
    // it was only used in the AppBar in the past, it kind of works, but now it
    // still lingers there being almost black and not primary colored, which
    // makes no sense at all. It will eventually be cleaned away when
    // `primaryColor` is deprecated though.
    final Color effectiveAppBarColor = appBarBackground ??
        (isDark ? colorScheme.surface : colorScheme.primary);
    final Brightness appBarBrightness =
        ThemeData.estimateBrightnessForColor(effectiveAppBarColor);
    Color appBarForeground =
        appBarBrightness == Brightness.dark ? Colors.white : Colors.black;
    // Icons are slightly transparent in light mode! This follows SDK standard.
    Color appBarIconColor =
        appBarBrightness == Brightness.dark ? Colors.white : Colors.black87;
    // If we are using subThemes, use blend for foreground color.
    if (useSubThemes && subTheme.blendTextTheme) {
      if (appBarBrightness == Brightness.dark) {
        appBarForeground =
            FlexColor.lightSurface.blend(effectiveAppBarColor, 12);
      } else {
        appBarForeground =
            FlexColor.darkSurface.blend(effectiveAppBarColor, 12);
      }
      appBarIconColor = appBarForeground;
    }
    // Selected TabBar color is based on FlexTabBarStyle tabBarStyle.
    // The `flutterDefault` sets values corresponding to SDK Default behavior,
    // it can be used, but is not as useful as the `forAppBar` version which
    // is the default here.
    Color selectedTabColor() {
      switch (tabBarStyle) {
        case FlexTabBarStyle.flutterDefault:
          return isDark ? Colors.white : colorScheme.onPrimary;
        case FlexTabBarStyle.forBackground:
          return colorScheme.primary;
        case FlexTabBarStyle.forAppBar:
          return appBarBrightness == Brightness.light
              ? Colors.black87
              : Colors.white;
        case FlexTabBarStyle.universal:
          return isDark
              ? colorScheme.primary.blendAlpha(Colors.white, 0xE6) // 90%
              : colorScheme.primary.blendAlpha(Colors.white, 0xB2); // 50%
      }
    }

    // Unselected TabBar color is based on FexTabBarStyle tabBarStyle.
    // The `flutterDefault` sets values corresponding to SDK Default behavior.
    Color unselectedTabColor() {
      switch (tabBarStyle) {
        case FlexTabBarStyle.flutterDefault:
          return selectedTabColor().withAlpha(0xB2); // 70%
        case FlexTabBarStyle.forBackground:
          return useSubThemes
              ? colorScheme.onSurface
                  .blendAlpha(colorScheme.primary,
                      kUnselectedBackgroundPrimaryAlphaBlend)
                  .withAlpha(kUnselectedAlphaBlend)
              : colorScheme.onSurface.withAlpha(0x99); // 60%
        case FlexTabBarStyle.forAppBar:
          return (appBarBrightness == Brightness.light &&
                  (effectiveAppBarColor == Colors.white ||
                      effectiveAppBarColor == colorScheme.surface ||
                      effectiveAppBarColor == colorScheme.background))
              ? colorScheme.onSurface.withAlpha(0x99) // 60%
              : selectedTabColor().withAlpha(0xB2); // 70% alpha
        case FlexTabBarStyle.universal:
          return isDark
              ? colorScheme.primary
                  .blendAlpha(Colors.white, 0xE6) // 90%
                  .withAlpha(0xB2) // 70% alpha
              : colorScheme.primary
                  .blendAlpha(Colors.white, 0x7F)
                  .withAlpha(0x7F); // 50%a
      }
    }

    // The current default theme for Material themed Tooltips are not ideal
    // choices for desktop https://material.io/components/tooltips#specs.
    // See issue: https://github.com/flutter/flutter/issues/71429
    // The font size of 10 dp is too small for desktops with pixel density
    // 1.0 so here we use 12 dp on desktop/Web and 14 dp on devices.
    double tooltipFontSize() {
      switch (effectivePlatform) {
        case TargetPlatform.macOS:
        case TargetPlatform.linux:
        case TargetPlatform.windows:
          return 12;
        case TargetPlatform.iOS:
        case TargetPlatform.fuchsia:
        case TargetPlatform.android:
          return 14;
      }
    }

    // This padding on tooltips fixes that default tooltips do not work well if
    // multi-row tooltips are used with the default fixed sized behavior.
    EdgeInsets tooltipPadding() {
      switch (effectivePlatform) {
        case TargetPlatform.macOS:
        case TargetPlatform.linux:
        case TargetPlatform.windows:
          return const EdgeInsets.fromLTRB(8, 3, 8, 4);
        case TargetPlatform.iOS:
        case TargetPlatform.fuchsia:
        case TargetPlatform.android:
          return const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
      }
    }

    // Same as in ThemeData.from, but defined for use in the tooltip sub-theme.
    // If our onSurface is primary tinted it has an effect on this divider too.
    final Color dividerColor = colorScheme.onSurface.withAlpha(0x1E); // 12%

    // Make the effective input decoration theme, by using FCS v4 sub themes
    // if opted in, otherwise use pre-v4 version as before. This decoration
    // theme is also passed into the TimePickerTheme, so we get the same
    // style used there too.
    final InputDecorationTheme effectiveInputDecorationTheme = useSubThemes
        ? FlexSubThemes.inputDecorationTheme(
            colorScheme: colorScheme,
            baseSchemeColor: subTheme.inputDecoratorSchemeColor,
            radius: subTheme.inputDecorationRadius ??
                subTheme.defaultRadius ??
                kButtonRadius,
            borderType: subTheme.inputDecoratorBorderType,
            filled: subTheme.inputDecoratorIsFilled,
            fillColor: subTheme.inputDecoratorFillColor,
            focusedBorderWidth: subTheme.thickBorderWidth,
            unfocusedBorderWidth: subTheme.thinBorderWidth,
            unfocusedHasBorder: subTheme.inputDecoratorUnfocusedHasBorder,
          )
        // Default one is also a bit opinionated, this is the default from
        // all previous versions before version 4.0.0.
        : InputDecorationTheme(
            // Extend filled property to previous always filled ones, defaults
            // to filled as before, but can now also be unfilled even if not
            // opted in on sub themes, by setting the property for it
            // FlexSubThemesData.
            filled: subTheme.inputDecoratorIsFilled,
            fillColor: isDark
                ? colorScheme.primary.withAlpha(0x0F) // 6%
                : colorScheme.primary.withAlpha(0x09), // 3.5%
          );

    // Use themed interaction effects on hover, focus, highlight and splash?
    final bool themedEffects = useSubThemes && subTheme.interactionEffects;

    // Return the ThemeData object defined by the FlexColorScheme
    // properties and the designed opinionated theme design choices.
    return ThemeData(
      // These properties we just pass along these to the standard ThemeData
      // factory. They are included in FlexColorScheme so we do not have to
      // apply them via ThemeData copyWith separately for cases when we want
      // to use them in a FlexColorSchemes, which might often be the case. Some
      // of the values may be null and get defaults via the ThemeData() factory.
      fontFamily: fontFamily,
      visualDensity: visualDensity,
      // TextTheme properties use the same logic as in ThemeData, allowing us
      // to optionally define them. AccentTextTheme is omitted since it has
      // been deprecated in Flutter 2.5.0.
      textTheme: effectiveTextTheme,
      primaryTextTheme: effectivePrimaryTextTheme,
      // Pass along custom typography and platform.
      typography: effectiveTypography,
      platform: effectivePlatform,
      // Most definitions below are very close to the ones used by the Flutter
      // factory ThemeData.from() for creating a theme from a color scheme and
      // text theme.
      brightness: colorScheme.brightness,
      primaryColor: colorScheme.primary,
      primaryColorBrightness:
          ThemeData.estimateBrightnessForColor(colorScheme.primary),
      canvasColor: colorScheme.background,

      // Flutter standard for scaffoldBackgroundColor is colorScheme.background.
      // Here it is replaced with a separate color for the scaffold background,
      // so we can use a configuration with a separate scaffold background
      // color from scheme background and surface. Flutter's ThemeData.from
      // a ColorScheme cannot do this. The good old ThemeData factory can of
      // course, but color scheme based themes in Flutter cannot specify it
      // separately. We need to be able to do so/ in order to make elegantly
      // nuanced primary color branded themes.
      scaffoldBackgroundColor: scaffoldBackground ?? colorScheme.background,
      // Card, divider and background colors are same as in ThemeData.from.
      cardColor: colorScheme.surface,
      dividerColor: dividerColor,
      backgroundColor: colorScheme.background,
      // Disabled color uses a different style when using themed interaction
      // effects, if not opted in same as before v4.0.0, use ThemeData default.
      disabledColor: themedEffects
          ? colorScheme.primary
              .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
              .withAlpha(kDisabledBackgroundAlpha)
          : isDark
              ? Colors.white38
              : Colors.black38,

      // Same as ThemeData SDK.
      // hintColor is used only by DropdownButton and InputDecorator in SDK.
      hintColor: isDark ? Colors.white60 : Colors.black.withAlpha(0x99), // 60%

      // Special theming on hover, focus, highlight and splash, if opting in on
      // themedEffects, otherwise use ThemeData defaults by passing in null
      // and letting it assign its values.
      hoverColor: themedEffects
          ? colorScheme.primary
              .blendAlpha(Colors.white, kHoverAlphaBlend)
              .withAlpha(kHoverAlpha)
          : null,
      focusColor: themedEffects
          ? colorScheme.primary
              .blendAlpha(Colors.white, kFocusAlphaBlend)
              .withAlpha(kFocusAlpha)
          : null,
      highlightColor: themedEffects
          ? colorScheme.primary
              .blendAlpha(Colors.white, kHighlightAlphaBlend)
              .withAlpha(kHighlightAlpha)
          : null,
      splashColor: themedEffects
          ? colorScheme.primary
              .blendAlpha(Colors.white, kSplashAlphaBlend)
              .withAlpha(kSplashAlpha)
          : null,

      // Flutter standard dialogBackgroundColor for color scheme based themes
      // uses colorScheme.background.
      // The FlexColorScheme.from() factory constructor uses passed in dialog
      // background color that is same as surface color if not defined, but
      // may also be any other other color.
      // If using surface blends that are not equal for all Material surface
      // backgrounds colors. There will be no elevation overlay color in dark
      // mode, even if so configured.
      // Use dialogs with background color that equals theme
      // colorScheme.surface to ensure it gets elevation overlay color applied
      // in dark mode. See issue:
      // https://github.com/flutter/flutter/issues/90353
      // The dialogBackgroundColor in ThemeData is going to be deprecated.
      dialogBackgroundColor: dialogBackground ?? colorScheme.background,

      // Define errorColor via color scheme error color.
      errorColor: colorScheme.error,

      // Use TabBar style dependent function for selected Tab as indicatorColor
      // if no color scheme selection for it is made.
      indicatorColor: subTheme.tabBarIndicatorSchemeColor == null
          ? selectedTabColor()
          : FlexSubThemes.schemeColor(
              subTheme.tabBarIndicatorSchemeColor!, colorScheme),

      // Elevation overlay on dark material elevation is used on dark themes
      // on surfaces when so requested, applyElevationOverlayColor defaults
      // to true in FlexColorScheme themes, but you can turn it off.
      // Flutter ThemeData.from ColorScheme based
      // themes also uses this by default, but older ThemeData factories do not.
      applyElevationOverlayColor: isDark && applyElevationOverlayColor,

      // Pass the from FlexColorScheme defined colorScheme to ThemeData
      // colorScheme. Newer standard Flutter sub themes use the colorScheme
      // for their theming and all sub themes will eventually be converted to
      // be based on the defined color scheme colors. FlexColorScheme passes
      // the scheme it has created to the colorScheme property in ThemeData.
      // More info here: https://flutter.dev/go/material-theme-system-updates
      colorScheme: colorScheme,

      // ----------------------------------------------------------------------
      // The theme settings below are corrective additions to the Flutter
      // standard Theme.from(colorScheme) factory. They are needed because it
      // omits some definitions that will not be aligned with the ColorScheme
      // theme if they are not added to it manually.
      // This as per the state in master channel December 15, 2020.
      // This document again relates to the on going transition:
      // https://flutter.dev/go/material-theme-system-updates
      // This issue explains and demos some of the current gaps:
      // https://github.com/flutter/flutter/issues/65782
      // Some of the gaps will probably be solved as Flutter's theme
      // migration progresses. We monitor the development and will remove no
      // longer needed corrections or remove totally deprecated
      // ThemeData properties when it is appropriate and timely to do so.
      // ----------------------------------------------------------------------

      // This color is important, if it is not set we get a teal color for it
      // in dark mode, and not actually the secondary color that we want for
      // our color scheme based theme. The Flutter color scheme based theme
      // does not include this, in our opinion for correct application of the
      // color scheme based theme, it should really do the same as below.
      // See issue: https://github.com/flutter/flutter/issues/65782
      toggleableActiveColor: colorScheme.secondary,

      // The primary dark color no longer exists in ColorScheme themes, but
      // it still needs to be set to match the ColorScheme theme, otherwise we
      // get a default dark blue theme color for it coming from default
      // primarySwatch. This will not look good if your theme uses any primary
      // color that is not a blue hue. To fix this we use the [700] value from
      // the calculated primary swatch for dark mode and [800] for light mode.
      // This property is used by `CircleAvatar` and `Slider`.
      // See issue: https://github.com/flutter/flutter/issues/65782
      primaryColorDark: primaryColorDark,

      // The light primary color no longer exists in ColorScheme themes, but it
      // still needs to be set to match the ColorScheme theme, otherwise we
      // get a default blue color for it coming from the default primarySwatch.
      // We use the [100] value from the calculated primary swatch.
      // This property is used by `CircleAvatar` and `Slider`.
      // See issue: https://github.com/flutter/flutter/issues/65782
      primaryColorLight: primaryColorLight,

      // Define a secondary header color, this property is only used in Flutter
      // SDK by `PaginatedDataTable`. It gets a super light [50] hue of the
      // primary color from default theme.light factory. Here we use the [50]
      // value from the calculated primary swatch.
      // See issue: https://github.com/flutter/flutter/issues/65782
      secondaryHeaderColor: secondaryHeaderColor,

      // The app bar theme allows us to use a custom colored appbar theme
      // in both light and dark themes that is not dependent on theme primary
      // or surface color, and still gets a correct working text and icon theme.
      // In the versions prior to Flutter 2.0.0 doing this was very difficult,
      // as presented in https://github.com/flutter/flutter/issues/50606 doing
      // this was a tricky. A new feature in Flutter 2.0.0 implemented via:
      // https://github.com/flutter/flutter/pull/71184 makes this setup easy.
      // The FlexColorScheme implementation below has been changed to
      // use these new AppBarTheme features in version 2.0.0.
      appBarTheme: AppBarTheme(
        backgroundColor: effectiveAppBarColor,
        foregroundColor: appBarForeground,
        iconTheme: IconThemeData(color: appBarIconColor),
        actionsIconTheme: IconThemeData(color: appBarIconColor),
        elevation: appBarElevation,
        systemOverlayStyle: SystemUiOverlayStyle(
          // AppBar overlay style.
          statusBarColor: transparentStatusBar
              ? Colors.transparent
              // This is the actual scrim color used by Android by default,
              // here we just re-apply if false or if it had been removed
              // earlier, using `null` does not restore it, we need to re-apply
              // the used scrim color by Android to restore if it has been
              // removed earlier.
              : const Color(0x40000000),
          statusBarBrightness: appBarBrightness,
          statusBarIconBrightness: appBarBrightness == Brightness.dark
              ? Brightness.light
              : Brightness.dark,
          // The systemNavigationBarColor used by default AppBar in SDK:
          systemNavigationBarColor: const Color(0xFF000000),
          // Would be nice if this worked instead of above, but it does not:
          // systemNavigationBarColor: isDark ? Colors.black : Colors.white;,
          //
          // The systemNavigationBarIconBrightness used by the AppBar in SDK:
          systemNavigationBarIconBrightness: Brightness.dark,
          // Would be nice if this worked instead of above, but it does not:
          // systemNavigationBarIconBrightness:
          //     isDark ? Brightness.light : Brightness.dark,
          //
          // The systemNavigationBarDividerColor used by default AppBar in SDK:
          systemNavigationBarDividerColor: null,
        ),
      ),

      // The bottom app bar uses color scheme background color to match the
      // background color of the drawer, bottom navigation bar, possible side
      // menu and system navigation bar on android (if theming of it is used).
      // This is a slight change from the ColorScheme default that uses
      // surface color.
      bottomAppBarColor: colorScheme.background,
      bottomAppBarTheme: BottomAppBarTheme(
        color: colorScheme.background,
        elevation: bottomAppBarElevation,
      ),

      // In TextSelectionThemeData, the standard for selectionColor is
      // colorScheme.primary with opacity value 0.4 for dark and 0.12 light
      // mode. Here we use primary with 0.5 for dark mode and 0.3 for light
      // mode. The standard selectionHandleColor is colorScheme.primary,
      // here we use the slightly darker shade primaryColorDark instead.
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: isDark
            ? colorScheme.primary.withAlpha(0xB2) // 50%
            : colorScheme.primary.withAlpha(0x4C), // 30%
        selectionHandleColor: primaryColorDark,
      ),

      // Define the TabBar theme that will fit nicely in an AppBar
      // (default) or on background color for use eg in a Scaffold, the choice
      // depends on tabBarStyle `FlexTabBarStyle`, that defaults to
      // `FlexTabBarStyle.forAppBar`. Using different theme styles for intended
      // target usage avoids this challenge:
      // https://github.com/flutter/flutter/pull/68171#pullrequestreview-517753917
      // That still has some issue related to it, is using default is used, we
      // pass in `null` and let ThemeData use default sub-theme for TabBarTheme.
      tabBarTheme: TabBarTheme(
        indicatorSize: TabBarIndicatorSize.tab,
        labelStyle: effectiveTextTheme.bodyText1,
        labelColor: selectedTabColor(),
        unselectedLabelStyle: effectiveTextTheme.bodyText1,
        unselectedLabelColor: unselectedTabColor(),
      ),

      // Set colors for for icons in opted in sub themes.
      iconTheme: useSubThemes
          ? IconThemeData(color: effectiveTextTheme.headline6!.color)
          : null,
      primaryIconTheme: useSubThemes
          ? IconThemeData(color: effectivePrimaryTextTheme.headline6!.color)
          : null,

      // Opinionated theming of Tooltips, the default theme for Material
      // themed Tooltips are not ideal design choices on desktop and web
      // https://material.io/components/tooltips#specs.
      // The theming below is an opinionated alternative design, with an option
      // to also invert the tooltip background color.
      // See issue: https://github.com/flutter/flutter/issues/71429
      tooltipTheme: TooltipThemeData(
        // Do not use the min height, the custom padding handles it instead.
        padding: tooltipPadding(),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        textStyle: effectiveTextTheme.bodyText2!.copyWith(
          inherit: false,
          color: tooltipsMatchBackground
              ? isDark
                  ? Colors.white
                  : Colors.black
              : isDark
                  ? Colors.black
                  : Colors.white,
          fontSize: tooltipFontSize(),
        ),
        decoration: useSubThemes
            // Opted in on sub-themes, we make a more fitting tooltip too.
            ? tooltipsMatchBackground
                ? BoxDecoration(
                    color: isDark
                        ? FlexColor.darkSurface
                            .blendAlpha(colorScheme.primary, 0x28) // 16%
                            .withAlpha(0xF2) // 95%
                        : FlexColor.lightSurface
                            .blendAlpha(colorScheme.primary, 0x0A) // 4%
                            .withAlpha(0xF2), // 95%
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    border: Border.all(color: dividerColor),
                  )
                : BoxDecoration(
                    color: isDark
                        ? FlexColor.lightSurface
                            .blendAlpha(colorScheme.primary, 0x63) // 39%
                            .withAlpha(0xF2) // 95%
                        : FlexColor.darkSurface
                            .blendAlpha(colorScheme.primary, 0x72) // 45%
                            .withAlpha(0xF2), // 95%
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    border: Border.all(color: dividerColor),
                  )
            // Not opted in on sub themes, use the before v4 style.
            : tooltipsMatchBackground
                ? BoxDecoration(
                    color: isDark
                        ? const Color(0xED444444)
                        : const Color(0xF0FCFCFC),
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    border: Border.all(color: dividerColor),
                  )
                : null,
      ),

      textButtonTheme: useSubThemes
          ? FlexSubThemes.textButtonTheme(
              colorScheme: colorScheme,
              radius: subTheme.textButtonRadius ?? subTheme.defaultRadius,
              padding: subTheme.buttonPadding,
              minButtonSize: subTheme.buttonMinSize,
            )
          : null,
      elevatedButtonTheme: useSubThemes
          ? FlexSubThemes.elevatedButtonTheme(
              colorScheme: colorScheme,
              radius: subTheme.elevatedButtonRadius ?? subTheme.defaultRadius,
              elevation: subTheme.elevatedButtonElevation,
              padding: subTheme.buttonPadding,
              minButtonSize: subTheme.buttonMinSize,
            )
          : null,
      outlinedButtonTheme: useSubThemes
          ? FlexSubThemes.outlinedButtonTheme(
              colorScheme: colorScheme,
              radius: subTheme.outlinedButtonRadius ?? subTheme.defaultRadius,
              pressedOutlineWidth: subTheme.thickBorderWidth,
              outlineWidth: subTheme.thinBorderWidth,
              padding: subTheme.buttonPadding,
              minButtonSize: subTheme.buttonMinSize,
            )
          : null,
      // Since the old buttons have been deprecated in Flutter 2.0.0
      // they are no longer presented or used in the code in FlexColorScheme.
      // The button theming below still makes the old buttons almost
      // look like the defaults for the new ElevatedButton, TextButton and
      // OutlinedButton.
      // This buttonTheme setup, makes the old legacy Material buttons
      // [RaisedButton], [OutlineButton] and [FlatButton] very similar in
      // style to the default color scheme based style used for the
      // newer Material buttons [ElevatedButton], [OutlinedButton] and
      // [TextButton]. There are some differences in margin
      // and outline color and the elevation behavior on the raised button.
      // A useSubThemes was added in version 4.0.0 to also there still support
      // the old buttons. Be aware that the theme will be removed from
      // FlexColorScheme when it becomes deprecated in Flutter SDK or the
      // buttons that already are deprecated, and that use this ButtonThemeData
      // are completely removed.
      buttonTheme: useSubThemes
          ? FlexSubThemes.buttonTheme(
              colorScheme: colorScheme,
              radius: subTheme.textButtonRadius ?? subTheme.defaultRadius,
              padding: subTheme.buttonPadding,
              minButtonSize: subTheme.buttonMinSize,
            )
          : ButtonThemeData(
              colorScheme: colorScheme,
              textTheme: ButtonTextTheme.primary,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: const EdgeInsets.symmetric(horizontal: 16),
            ),
      // Toggle buttons have limited theming capability and cannot match new
      // buttons fully, this is an approximation.
      toggleButtonsTheme: useSubThemes
          ? FlexSubThemes.toggleButtonsTheme(
              colorScheme: colorScheme,
              borderWidth: subTheme.thinBorderWidth,
              radius: subTheme.toggleButtonsRadius ?? subTheme.defaultRadius,
              minButtonSize: subTheme.buttonMinSize,
              visualDensity: visualDensity,
            )
          : null,
      // Input decorator theme.
      inputDecorationTheme: effectiveInputDecorationTheme,
      // FAB, floating action button theme.
      floatingActionButtonTheme: useSubThemes
          ? FlexSubThemes.floatingActionButtonTheme(
              colorScheme: colorScheme,
              backgroundSchemeColor: subTheme.fabSchemeColor,
              radius: subTheme.dialogRadius ?? subTheme.defaultRadius,
              useShape: subTheme.fabUseShape,
            )
          : null,
      // The default chip theme in Flutter does not work correctly with dark
      // themes. See issue: https://github.com/flutter/flutter/issues/65663
      // The chip theme below fixes it by using the colorScheme.primary color.
      chipTheme: useSubThemes
          ? FlexSubThemes.chipTheme(
              colorScheme: colorScheme,
              baseSchemeColor: subTheme.chipSchemeColor,
              labelStyle: effectiveTextTheme.button!,
              radius: subTheme.chipRadius ?? subTheme.defaultRadius,
            )
          : ChipThemeData.fromDefaults(
              secondaryColor: colorScheme.primary,
              brightness: colorScheme.brightness,
              labelStyle: effectiveTextTheme.bodyText1!,
            ),
      cardTheme: useSubThemes
          ? FlexSubThemes.cardTheme(
              radius: subTheme.cardRadius ?? subTheme.defaultRadius,
              elevation: subTheme.cardElevation,
            )
          : null,
      popupMenuTheme: useSubThemes
          ? FlexSubThemes.popupMenuTheme(
              radius: subTheme.popupMenuRadius ??
                  ((subTheme.defaultRadius ?? 16) > 10
                      ? 10
                      : subTheme.defaultRadius),
              elevation: subTheme.popupMenuElevation,
              color: subTheme.popupMenuOpacity == null
                  ? null
                  : colorScheme.surface.withOpacity(subTheme.popupMenuOpacity!),
            )
          : null,
      dialogTheme: useSubThemes
          ? FlexSubThemes.dialogTheme(
              radius: subTheme.dialogRadius ?? subTheme.defaultRadius,
              elevation: subTheme.dialogElevation,
              backgroundColor: dialogBackground ?? colorScheme.background,
            )
          : null,
      timePickerTheme: useSubThemes
          ? FlexSubThemes.timePickerTheme(
              backgroundColor: dialogBackground ?? colorScheme.background,
              radius: subTheme.timePickerDialogRadius ?? subTheme.defaultRadius,
              elementRadius: subTheme.cardRadius ?? subTheme.defaultRadius,
              inputDecorationTheme: effectiveInputDecorationTheme)
          : null,
      snackBarTheme: useSubThemes
          ? FlexSubThemes.snackBarTheme(
              elevation: subTheme.snackBarElevation,
              backgroundColor: isDark
                  ? colorScheme.onSurface
                      .blendAlpha(colorScheme.primary, 0x63) // 39%
                      .withAlpha(0xF2) // 95%
                  : colorScheme.onSurface
                      .blendAlpha(colorScheme.primary, 0x72) // 45%
                      .withAlpha(0xED) // 93%
              )
          : null,
      bottomSheetTheme: useSubThemes
          ? FlexSubThemes.bottomSheetTheme(
              radius: subTheme.bottomSheetRadius ?? subTheme.defaultRadius,
              elevation: subTheme.bottomSheetElevation,
              modalElevation: subTheme.bottomSheetModalElevation,
            )
          : null,
      // Opinionated default theming for the bottom navigation bar: Use primary
      // color for selected item. Flutter defaults to using secondary color in
      // dark mode, we want primary in dark mode too, like it is in light
      // mode. Primary color is an iOS influenced style for the bottom nav.
      // Above was default in version < 4, version 4 can also use sub-theme.
      bottomNavigationBarTheme: useSubThemes
          ? FlexSubThemes.bottomNavigationBar(
              colorScheme: colorScheme,
              baseSchemeColor: subTheme.bottomNavigationBarSchemeColor,
              backgroundSchemeColor:
                  subTheme.bottomNavigationBarBackgroundSchemeColor,
              elevation: subTheme.bottomNavigationBarElevation,
              opacity: subTheme.bottomNavigationBarOpacity,
              unselectedAlphaBlend: kUnselectedBackgroundPrimaryAlphaBlend,
              unselectedAlpha: kUnselectedAlphaBlend,
            )
          : BottomNavigationBarThemeData(
              selectedIconTheme: IconThemeData(
                color: colorScheme.primary,
              ),
              selectedItemColor: colorScheme.primary,
            ),
      // Opinionated sub theme for Material 3 based Navigation Bar
      navigationBarTheme: useSubThemes
          ? FlexSubThemes.navigationBarTheme(
              colorScheme: colorScheme,
              labelTextStyle: subTheme.navigationBarIsStyled
                  ? effectiveTextTheme.overline
                  : null,
              selectedLabelSize: subTheme.navigationBarSelectedLabelSize,
              unselectedLabelSize: subTheme.navigationBarUnselectedLabelSize,
              textSchemeColor: subTheme.navigationBarTextSchemeColor ??
                  (subTheme.navigationBarIsStyled ? SchemeColor.primary : null),
              mutedUnselectedText: subTheme.navigationBarMutedUnselectedText ??
                  subTheme.navigationBarIsStyled,
              selectedIconSize: subTheme.navigationBarSelectedIconSize,
              unselectedIconSize: subTheme.navigationBarUnselectedIconSize,
              iconSchemeColor: subTheme.navigationBarIconSchemeColor ??
                  (subTheme.navigationBarIsStyled ? SchemeColor.primary : null),
              mutedUnselectedIcon: subTheme.navigationBarMutedUnselectedIcon ??
                  subTheme.navigationBarIsStyled,
              highlightSchemeColor: subTheme
                      .navigationBarHighlightSchemeColor ??
                  (subTheme.navigationBarIsStyled ? SchemeColor.primary : null),
              indicatorAlpha: kNavigationBarIndicatorAlpha,
              backgroundSchemeColor:
                  subTheme.navigationBarBackgroundSchemeColor ??
                      (subTheme.navigationBarIsStyled
                          ? SchemeColor.background
                          : null),
              opacity: subTheme.navigationBarOpacity,
              height: subTheme.navigationBarHeight ??
                  (subTheme.navigationBarIsStyled
                      ? kNavigationBarHeight
                      : null),
              labelBehavior: subTheme.navigationBarLabelBehavior,
              unselectedAlphaBlend: kUnselectedBackgroundPrimaryAlphaBlend,
              unselectedAlpha: kUnselectedAlphaBlend,
            )
          : null,
    );
  }

  /// Returns the effective [ColorScheme] defined by your [FlexColorScheme].
  ///
  /// After you have defined your scheme with [FlexColorScheme] or one of its
  /// recommended factories [FlexColorScheme.light], [FlexColorScheme.dark],
  /// you can use the [toScheme] method to get the effective standard Flutter
  /// [ColorScheme] object defined by your [FlexColorScheme] definition.
  ///
  /// While you can use use this returned color scheme in a standard
  /// [ThemeData.from] color scheme based theme factory to create a theme from
  /// [FlexColorScheme], this is **NOT** the recommended way to make a
  /// fully [FlexColorScheme] based theme. Normally you want to use
  /// [FlexColorScheme.toTheme] to make your ThemeData when using
  /// FlexColorScheme.
  ///
  /// The main usage of this method is to get the effective resulting
  /// [ColorScheme] from [FlexColorScheme) and use it when making sub-themes
  /// that need access to the resulting color definitions so you can use
  /// them in custom sub-themes to use the same color scheme for their
  /// definitions. This is e.g. needed on custom hover, ink and splash effects.
  ///
  /// If you use [ThemeData.from] and the [ColorScheme] returned by
  /// [FlexColorScheme.toScheme] to create tour theme, this will work and
  /// result in a theme that is based on
  /// the color scheme defined in [FlexColorScheme], including the surface and
  /// background color branding, and e.g. true black for dark mode, if those
  /// were used in its creation via the light and dark factories. **The** big
  /// difference will be that Flutter's [ThemeData.from] theme creation
  /// from this scheme will not include any of the theme fixes, included
  /// in the [FlexColorScheme.toTheme] method. The AppBar theme options
  /// will also not be available and scaffoldBackground
  /// will be equal to background, which might not be the design you intended.
  ///
  /// The sub-theming is of course also not available, unless you apply them
  /// all with `copyWith` to the produced ThemeData.
  ColorScheme get toScheme {
    // Get effective brightness.
    final Brightness _brightness =
        brightness ?? colorScheme?.brightness ?? Brightness.light;
    final bool isDark = _brightness == Brightness.dark;

    // Get effective primary color.
    final Color _primary = primary ??
        colorScheme?.primary ??
        (isDark
            ? FlexColor.materialDarkPrimary
            : FlexColor.materialLightPrimary);

    // Calculate default fallback colors from primary color.
    final FlexSchemeColor _fallbacks = FlexSchemeColor.from(
      primary: _primary,
      primaryVariant: primaryVariant,
      secondary: secondary,
      secondaryVariant: secondaryVariant,
    );

    // Determine effective main colors
    final Color _primaryVariant = primaryVariant ??
        colorScheme?.primaryVariant ??
        _fallbacks.primaryVariant;
    final Color _secondary =
        secondary ?? colorScheme?.secondary ?? _fallbacks.secondary;
    final Color _secondaryVariant = secondaryVariant ??
        colorScheme?.secondaryVariant ??
        _fallbacks.secondaryVariant;

    // Determine effective surface, background and error colors.
    final Color _surface = surface ??
        colorScheme?.surface ??
        (isDark
            ? FlexColor.materialDarkSurface
            : FlexColor.materialLightSurface);
    final Color _background = background ??
        colorScheme?.background ??
        (isDark
            ? FlexColor.materialDarkBackground
            : FlexColor.materialLightBackground);
    final Color _error = error ??
        colorScheme?.error ??
        (isDark ? FlexColor.materialDarkError : FlexColor.materialLightError);

    // Checks brightness of primary, secondary, error, surface and background
    // colors, and returns appropriate colors for their onColors, if an
    // onColor for it was was not passed in or no colorScheme with them given.
    final FlexSchemeOnColors onColors = FlexSchemeOnColors.from(
      primary: _primary,
      secondary: _secondary,
      surface: _surface,
      background: _background,
      error: _error,
      onPrimary: onPrimary ?? colorScheme?.onPrimary,
      onSecondary: onSecondary ?? colorScheme?.onSecondary,
      onSurface: onSurface ?? colorScheme?.onSurface,
      onBackground: onBackground ?? colorScheme?.onBackground,
      onError: onError ?? colorScheme?.onError,
    );

    // Return the [ColorScheme] as a copyWith on original passed in colorScheme
    // if one was passed in, with all the new effective properties. This will
    // keep new M3 properties intact (on master channel) that we are not yet
    // dealing with. If there was no colorScheme passed in, we create one
    // with the effective properties.
    return colorScheme?.copyWith(
          primary: _primary,
          primaryVariant: _primaryVariant,
          secondary: _secondary,
          secondaryVariant: _secondaryVariant,
          surface: _surface,
          background: _background,
          error: _error,
          onPrimary: onColors.onPrimary,
          onSecondary: onColors.onSecondary,
          onSurface: onColors.onSurface,
          onBackground: onColors.onBackground,
          onError: onColors.onError,
          brightness: _brightness,
        ) ??
        ColorScheme(
          primary: _primary,
          primaryVariant: _primaryVariant,
          secondary: _secondary,
          secondaryVariant: _secondaryVariant,
          surface: _surface,
          background: _background,
          error: _error,
          onPrimary: onColors.onPrimary,
          onSecondary: onColors.onSecondary,
          onSurface: onColors.onSurface,
          onBackground: onColors.onBackground,
          onError: onColors.onError,
          brightness: _brightness,
        );
  }

  /// Copy the object with one or more provided properties changed.
  FlexColorScheme copyWith({
    ColorScheme? colorScheme,
    Brightness? brightness,
    Color? primary,
    Color? primaryVariant,
    Color? secondary,
    Color? secondaryVariant,
    Color? surface,
    Color? background,
    Color? error,
    Color? scaffoldBackground,
    Color? dialogBackground,
    Color? appBarBackground,
    Color? onPrimary,
    Color? onSecondary,
    Color? onSurface,
    Color? onBackground,
    Color? onError,
    FlexTabBarStyle? tabBarStyle,
    double? appBarElevation,
    double? bottomAppBarElevation,
    bool? tooltipsMatchBackground,
    bool? transparentStatusBar,
    VisualDensity? visualDensity,
    TextTheme? textTheme,
    TextTheme? primaryTextTheme,
    String? fontFamily,
    TargetPlatform? platform,
    Typography? typography,
    bool? applyElevationOverlayColor,
    bool? useSubThemes,
    FlexSubThemesData? subThemesData,
  }) {
    return FlexColorScheme(
      colorScheme: colorScheme ?? this.colorScheme,
      brightness: brightness ?? this.brightness,
      primary: primary ?? this.primary,
      primaryVariant: primaryVariant ?? this.primaryVariant,
      secondary: secondary ?? this.secondary,
      secondaryVariant: secondaryVariant ?? this.secondaryVariant,
      surface: surface ?? this.surface,
      background: background ?? this.background,
      error: error ?? this.error,
      scaffoldBackground: scaffoldBackground ?? this.scaffoldBackground,
      appBarBackground: appBarBackground ?? this.appBarBackground,
      dialogBackground: dialogBackground ?? this.dialogBackground,
      onPrimary: onPrimary ?? this.onPrimary,
      onSecondary: onSecondary ?? this.onSecondary,
      onSurface: onSurface ?? this.onSurface,
      onBackground: onBackground ?? this.onBackground,
      onError: onError ?? this.onError,
      tabBarStyle: tabBarStyle ?? this.tabBarStyle,
      appBarElevation: appBarElevation ?? this.appBarElevation,
      bottomAppBarElevation:
          bottomAppBarElevation ?? this.bottomAppBarElevation,
      tooltipsMatchBackground:
          tooltipsMatchBackground ?? this.tooltipsMatchBackground,
      transparentStatusBar: transparentStatusBar ?? this.transparentStatusBar,
      visualDensity: visualDensity ?? this.visualDensity,
      textTheme: textTheme ?? this.textTheme,
      primaryTextTheme: primaryTextTheme ?? this.primaryTextTheme,
      fontFamily: fontFamily ?? this.fontFamily,
      platform: platform ?? this.platform,
      typography: typography ?? this.typography,
      applyElevationOverlayColor:
          applyElevationOverlayColor ?? this.applyElevationOverlayColor,
      useSubThemes: useSubThemes ?? this.useSubThemes,
      subThemesData: subThemesData ?? this.subThemesData,
    );
  }

  /// Equality operator override for the FlexColorScheme object.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is FlexColorScheme &&
        other.colorScheme == colorScheme &&
        other.brightness == brightness &&
        other.primary == primary &&
        other.primaryVariant == primaryVariant &&
        other.secondary == secondary &&
        other.secondaryVariant == secondaryVariant &&
        other.surface == surface &&
        other.background == background &&
        other.error == error &&
        other.scaffoldBackground == scaffoldBackground &&
        other.appBarBackground == appBarBackground &&
        other.dialogBackground == dialogBackground &&
        other.onPrimary == onPrimary &&
        other.onSecondary == onSecondary &&
        other.onSurface == onSurface &&
        other.onBackground == onBackground &&
        other.onError == onError &&
        other.tabBarStyle == tabBarStyle &&
        other.appBarElevation == appBarElevation &&
        other.bottomAppBarElevation == bottomAppBarElevation &&
        other.tooltipsMatchBackground == tooltipsMatchBackground &&
        other.transparentStatusBar == transparentStatusBar &&
        other.visualDensity == visualDensity &&
        other.textTheme == textTheme &&
        other.primaryTextTheme == primaryTextTheme &&
        other.fontFamily == fontFamily &&
        other.platform == platform &&
        other.typography == typography &&
        other.applyElevationOverlayColor == applyElevationOverlayColor &&
        other.useSubThemes == useSubThemes &&
        other.subThemesData == subThemesData;
  }

  /// Hashcode override for the FlexColorScheme object.
  ///
  /// Using Jenkins list hashCode algorithm used by ThemeData in Flutter SDK.
  @override
  int get hashCode {
    final List<Object?> values = <Object?>[
      colorScheme,
      brightness,
      primary,
      primaryVariant,
      secondary,
      secondaryVariant,
      surface,
      background,
      error,
      scaffoldBackground,
      appBarBackground,
      dialogBackground,
      onPrimary,
      onSecondary,
      onSurface,
      onBackground,
      onError,
      tabBarStyle,
      appBarElevation,
      bottomAppBarElevation,
      tooltipsMatchBackground,
      transparentStatusBar,
      visualDensity,
      textTheme,
      primaryTextTheme,
      fontFamily,
      platform,
      typography,
      applyElevationOverlayColor,
      useSubThemes,
      subThemesData,
    ];
    return hashList(values);
  }

  /// Flutter debug properties override for FlexColorScheme object.
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<ColorScheme>('colorScheme', colorScheme));
    properties.add(EnumProperty<Brightness>('brightness', brightness));
    properties.add(ColorProperty('primary', primary));
    properties.add(ColorProperty('primaryVariant', primaryVariant));
    properties.add(ColorProperty('secondary', secondary));
    properties.add(ColorProperty('secondaryVariant', secondaryVariant));
    properties.add(ColorProperty('surface', surface));
    properties.add(ColorProperty('background', background));
    properties.add(ColorProperty('error', error));
    properties.add(ColorProperty('scaffoldBackground', scaffoldBackground));
    properties.add(ColorProperty('appBarBackground', appBarBackground));
    properties.add(ColorProperty('dialogBackground', dialogBackground));
    properties.add(ColorProperty('onPrimary', onPrimary));
    properties.add(ColorProperty('onSecondary', onSecondary));
    properties.add(ColorProperty('onSurface', onSurface));
    properties.add(ColorProperty('onBackground', onBackground));
    properties.add(ColorProperty('onError', onError));
    properties.add(EnumProperty<FlexTabBarStyle>('tabBarStyle', tabBarStyle));
    properties
        .add(DiagnosticsProperty<double>('appBarElevation', appBarElevation));
    properties.add(DiagnosticsProperty<double>(
        'bottomAppBarElevation', bottomAppBarElevation));
    properties.add(DiagnosticsProperty<bool>(
        'tooltipsMatchBackground', tooltipsMatchBackground));
    properties.add(DiagnosticsProperty<bool>(
        'transparentStatusBar', transparentStatusBar));
    properties.add(EnumProperty<VisualDensity>('visualDensity', visualDensity));
    properties.add(DiagnosticsProperty<TextTheme>('textTheme', textTheme));
    properties.add(
        DiagnosticsProperty<TextTheme>('primaryTextTheme', primaryTextTheme));
    properties.add(DiagnosticsProperty<String>('fontFamily', fontFamily));
    properties.add(EnumProperty<TargetPlatform>('platform', platform));
    properties.add(DiagnosticsProperty<Typography>('typography', typography));
    properties.add(DiagnosticsProperty<bool>(
        'applyElevationOverlayColor', applyElevationOverlayColor));
    properties.add(DiagnosticsProperty<bool>('useSubThemes', useSubThemes));
    properties.add(
        DiagnosticsProperty<FlexSubThemesData>('subThemesData', subThemesData));
  }
}

/// Immutable data class used to make the four different surface colors in a
/// [FlexColorScheme].
///
/// [FlexSchemeSurfaceColors] is used primarily via the
/// [FlexSchemeSurfaceColors.blend] factory. Before version 4.0 the
/// [FlexSchemeSurfaceColors.from] factory was used.
///
/// Included colors are [surface] and [background], plus blended surface colors
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
  /// the [FlexSchemeSurfaceColors.from] factory.
  const FlexSchemeSurfaceColors({
    required this.surface,
    required this.dialogBackground,
    required this.background,
    required this.scaffoldBackground,
  });

  /// The background color for widgets like [Card] and [Dialog].
  ///
  /// The default background color of [Material] of type card.
  final Color surface;

  /// The color of dialog background.
  ///
  /// Typically same as the surface color.
  final Color dialogBackground;

  /// A color that typically appears behind scrollable content.
  ///
  /// The default background color of [Material] of type canvas.
  final Color background;

  /// The color of the [Scaffold] background.
  final Color scaffoldBackground;

  /// Create nuanced surface colors using pre-defined behavior via enum
  /// [FlexSurfaceMode] property `surfaceMode` or make totally custom color
  /// blended surfaces.
  ///
  /// [FlexSchemeSurfaceColors] were in versions before 4.0 created with
  /// the [FlexSchemeSurfaceColors.from] factory. Version 4.0 and later
  /// recommends using the [FlexSchemeSurfaceColors.blend] factory for even
  /// more nuanced surface color branding options and control.
  ///
  /// This kind of surface branding is based on the Material guide found
  /// under "Accessibility and contrast"
  /// https://material.io/design/color/dark-theme.html#properties
  /// for branded surfaces.
  ///
  /// The [brightness] controls if we are creating surface colors for light or
  /// dark surfaces.
  ///
  /// To get elevation overlay color in dark themes on all surfaces used by
  /// [Material], use a [FlexSurfaceMode] `surfaceMode` that start with
  /// `equal` in its name.
  /// Other modes will only use elevation overlay if their background happens to
  /// be equal to resulting colorScheme.surface color. For more information
  /// see issue: https://github.com/flutter/flutter/issues/90353
  ///
  /// The surface colors returned by this factory can also be used to make
  /// branded surface colors for Flutter's standard [ColorScheme], it does
  /// not have to be used exclusively by [FlexColorScheme].
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

    /// The colors used to blend into surfaces when using `surfaceMode` mode
    /// based styles and modes.
    ///
    /// If null, default material light or dark scheme colors will be used as
    /// fallback, depending on if we are making light or dark surfaces.
    ///
    /// If a blend color for a surface is provided in `blendColors`, that color
    /// color always overrides used color from `schemeColor` selected based on
    /// `surfaceMode`.
    FlexSchemeColor? schemeColors,

    /// Custom colors to be blended into each surface color.
    ///
    /// If provided, these colors will be blended into each equivalent surface
    /// color.
    ///
    /// If it is null, then `schemeColors.primary` will be assigned to all
    /// surfaces. The used `surfaceMode` does in some modes override this and
    /// also uses other color from `schemeColors` to be blended into some
    /// surfaces.
    FlexSchemeSurfaceColors? blendColors,

    /// The surface colors that we will mix the blend colors into.
    ///
    /// If null, then Material default surface colors will be used for all
    /// surfaces, that we then mix in the `blendColors` into, unless the
    /// `surfaceMode` defines surface starting colors otherwise.
    ///
    /// In some modes the `surfaceMode` defines and overwrites `surfaceColors`
    /// with its own mode based starting surface colors for each surface.
    /// To ensure that the passed in `surfaceColors` are kept when using
    /// custom surface colors, use the mode [FlexSurfaceMode.custom]
    /// to construct surface colors with custom base surface colors.
    FlexSchemeSurfaceColors? surfaceColors,
  }) {
    assert(
        blendLevel >= 0 && blendLevel <= 40,
        'Only blend levels from 0 to 40 '
        'are allowed. Very high alpha blend levels may not produce results '
        'that are visually very appealing or useful.');
    int _blendLevel = blendLevel;
    // If above happens in none debug mode, use 0, no blends.
    if (blendLevel < 0 || blendLevel > 40) _blendLevel = 0;

    final bool isLight = brightness == Brightness.light;

    // We get scheme default blend in colors via brightness and Material
    // default colors for the theme mode, if it was not provided. It is
    // typically provided when making branded surfaces, but Material default
    // colors are used as fallback colors.
    final FlexSchemeColor scheme = schemeColors ??
        (isLight ? FlexColor.material.light : FlexColor.material.dark);
    // The color that should be blended into each surface, defaults to primary
    // color for all surfaces.
    FlexSchemeSurfaceColors blendColor = blendColors ??
        FlexSchemeSurfaceColors(
          surface: scheme.primary,
          dialogBackground: scheme.primary,
          background: scheme.primary,
          scaffoldBackground: scheme.primary,
        );
    // Set dialog blend colors to secondary variant color for modes using it.
    if (surfaceMode == FlexSurfaceMode.levelSurfacesLowScaffoldVariantDialog ||
        surfaceMode == FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog) {
      blendColor =
          blendColor.copyWith(dialogBackground: scheme.secondaryVariant);
    }
    // We get surface starting default colors via brightness and Material
    // default colors if it was not provided. It is normally provided when
    // making branded surfaces, but Material default colors are used as
    // fallback colors.
    FlexSchemeSurfaceColors surface = surfaceColors ??
        (isLight
            ? const FlexSchemeSurfaceColors(
                surface: FlexColor.materialLightSurface,
                background: FlexColor.materialLightBackground,
                scaffoldBackground: FlexColor.materialLightScaffoldBackground,
                dialogBackground: FlexColor.materialLightSurface,
              )
            : const FlexSchemeSurfaceColors(
                surface: FlexColor.materialDarkSurface,
                background: FlexColor.materialDarkBackground,
                scaffoldBackground: FlexColor.materialDarkScaffoldBackground,
                dialogBackground: FlexColor.materialDarkSurface,
              ));
    // If using `highBackgroundLowScaffold` or `highSurfaceLowScaffold` or
    // `highScaffoldLevelSurface` and `_blendLevel` is zero,
    // we use Material default surfaces.
    // This is the same style as used in versions before 4.0 when using
    // `surfaceStyle` based surfaces and no blends via `FlexSurface.material`.
    if (surfaceMode == FlexSurfaceMode.highBackgroundLowScaffold ||
        surfaceMode == FlexSurfaceMode.highSurfaceLowScaffold ||
        surfaceMode == FlexSurfaceMode.highScaffoldLevelSurface) {
      if (_blendLevel == 0) {
        if (isLight) {
          surface = const FlexSchemeSurfaceColors(
            surface: FlexColor.materialLightSurface,
            background: FlexColor.materialLightBackground,
            scaffoldBackground: FlexColor.materialLightScaffoldBackground,
            dialogBackground: FlexColor.materialLightSurface,
          );
        } else {
          surface = const FlexSchemeSurfaceColors(
            surface: FlexColor.materialDarkSurface,
            background: FlexColor.materialDarkBackground,
            scaffoldBackground: FlexColor.materialDarkScaffoldBackground,
            dialogBackground: FlexColor.materialDarkSurface,
          );
        }
      } else {
        // For other `_blendLevel` values than `0` we use the
        // surface color defined by [FlexColor] surfaces. They differ slightly
        // from Material starting colors to provide better blend effects.
        // White is slightly off-white for background and in dark mode
        // surface is slightly darker and background even darker, while
        // scaffold background matches the Material design background.
        if (isLight) {
          surface = const FlexSchemeSurfaceColors(
            surface: FlexColor.lightSurface,
            background: FlexColor.lightBackground,
            scaffoldBackground: FlexColor.lightScaffoldBackground,
            dialogBackground: FlexColor.lightSurface,
          );
        } else {
          surface = const FlexSchemeSurfaceColors(
            surface: FlexColor.darkSurface,
            background: FlexColor.darkBackground,
            scaffoldBackground: FlexColor.darkScaffoldBackground,
            dialogBackground: FlexColor.darkSurface,
          );
        }
      }
    }
    // In these modes we use FlexColor default surface color on all surfaces.
    if (surfaceMode == FlexSurfaceMode.level ||
        surfaceMode == FlexSurfaceMode.highScaffoldLowSurface ||
        surfaceMode == FlexSurfaceMode.levelSurfacesLowScaffold ||
        surfaceMode == FlexSurfaceMode.levelSurfacesLowScaffoldVariantDialog) {
      if (isLight) {
        surface = const FlexSchemeSurfaceColors(
          surface: FlexColor.lightSurface,
          background: FlexColor.lightSurface,
          scaffoldBackground: FlexColor.lightSurface,
          dialogBackground: FlexColor.lightSurface,
        );
      } else {
        surface = const FlexSchemeSurfaceColors(
          surface: FlexColor.darkSurface,
          background: FlexColor.darkSurface,
          scaffoldBackground: FlexColor.darkSurface,
          dialogBackground: FlexColor.darkSurface,
        );
      }
    }
    // In mode `highScaffoldLowSurfaces` and
    // `highScaffoldLowSurfacesVariantDialog`, we use FlexColor
    // default background color on all surfaces. The FlexColor background color
    // is slightly darker in dark mode and a bit off white in light mode,
    // as compared to FlexColor.lightSurface and dark surface.
    if (surfaceMode == FlexSurfaceMode.highScaffoldLowSurfaces ||
        surfaceMode == FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog) {
      if (isLight) {
        surface = const FlexSchemeSurfaceColors(
          surface: FlexColor.lightBackground,
          background: FlexColor.lightBackground,
          scaffoldBackground: FlexColor.lightBackground,
          dialogBackground: FlexColor.lightBackground,
        );
      } else {
        surface = const FlexSchemeSurfaceColors(
          surface: FlexColor.darkBackground,
          background: FlexColor.darkBackground,
          scaffoldBackground: FlexColor.darkBackground,
          dialogBackground: FlexColor.darkBackground,
        );
      }
    }
    // Get alpha blend values corresponding to used mode, level and brightness.
    final _AlphaValues _blend =
        _AlphaValues.getAlphas(surfaceMode, _blendLevel, brightness);
    // Return the computed and resulting surface colors.
    return FlexSchemeSurfaceColors(
      surface:
          surface.surface.blendAlpha(blendColor.surface, _blend.surfaceAlpha),
      dialogBackground: surface.dialogBackground
          .blendAlpha(blendColor.dialogBackground, _blend.dialogAlpha),
      background: surface.background
          .blendAlpha(blendColor.background, _blend.backgroundAlpha),
      scaffoldBackground: surface.scaffoldBackground
          .blendAlpha(blendColor.scaffoldBackground, _blend.scaffoldAlpha),
    );
  }

  /// Returns the surface colors for given [brightness] and [surfaceStyle]
  /// values.
  ///
  /// The [FlexSurface] enum is used to represent surface color schemes.
  /// [FlexSurface.material] is the surface colors scheme presented
  /// in Material design guide here for light theme:
  /// https://material.io/design/color/the-color-system.html#color-theme-creation
  /// and here for dark theme under "The dark theme baseline palette":
  /// https://material.io/design/color/dark-theme.html#ui-application
  ///
  /// The [FlexSurface.light], [FlexSurface.medium], [FlexSurface.strong]
  /// and [FlexSurface.heavy] blends in an increasing amount of the provided
  /// [primary] color into the surface, background and scaffold background
  /// colors, for a primary color branded look on these background colors.
  ///
  /// The [primary] color is not used for for Material or custom surface style.
  /// If [primary] is not provided it defaults to
  /// [FlexColor.materialLightPrimary] if brightness is light, and
  /// otherwise defaults to [FlexColor.materialDarkPrimary]. When creating
  /// surface colors that fits a given scheme, the scheme's primary color
  /// should be passed to [primary].
  ///
  /// The percentage of blend values for each strength are separate for
  /// [surface], [background] and [scaffoldBackground]. Scaffold background
  /// only gets a slight blend in heavy mode. Surface and dialog receive a lower
  /// percentage blend than background. The blend values are also different for
  /// light and dark themes, as light themes require less of the typically more
  /// saturated primary color. Dark themes must use a slightly de-saturated
  /// primary color, so the blend percentage values for dark surfaces must be
  /// higher.
  ///
  /// This kind of surface branding is based on the Material guide found
  /// under "Accessibility and contrast"
  /// https://material.io/design/color/dark-theme.html#properties
  /// for branded surfaces.
  ///
  /// The [brightness] controls if we create surface colors for light or
  /// dark surfaces.
  ///
  /// The surface colors returned by this factory can also be used to make
  /// branded surface colors for Flutter's standard [ColorScheme], it does
  /// not have to be used exclusively by [FlexColorScheme].
  ///
  /// This factory only gives elevation overlay color in dark mode on Material
  /// with surface color, and dialogs that uses the same color value.
  /// To get elevation overlay color in dark themes on all surfaces used by
  /// [Material], use factory FlexSchemeSurfaceColors.blend and one of the
  /// modes that start with `equal` in its name.
  /// Other modes will only use elevation overlay if their background happens to
  /// be equal to resulting colorScheme.surface color. For more information
  /// see issue: https://github.com/flutter/flutter/issues/90353
  factory FlexSchemeSurfaceColors.from({
    /// Controls if we create surface colors for light or dark surfaces.
    Brightness brightness = Brightness.light,

    /// The style of the used surfaces colors.
    FlexSurface surfaceStyle = FlexSurface.material,

    /// Primary color to blend into surface colors when ThemeSurface light,
    /// medium, strong and heavy are used. Is not used for and not required
    /// for Material or custom surface style.
    ///
    /// Defaults to [FlexColor.materialLightPrimary] if brightness is light,
    /// otherwise defaults to [FlexColor.materialDarkPrimary].
    Color? primary,
  }) {
    // Primary color gets default via brightness and Material default colors
    // if it was not provided, should be provided when making branded surfaces.
    primary ??= brightness == Brightness.light
        ? FlexColor.materialLightPrimary
        : FlexColor.materialDarkPrimary;

    switch (brightness) {
      case Brightness.light:
        {
          switch (surfaceStyle) {
            case FlexSurface.material:
              return const FlexSchemeSurfaceColors(
                surface: FlexColor.materialLightSurface,
                background: FlexColor.materialLightBackground,
                scaffoldBackground: FlexColor.materialLightScaffoldBackground,
                dialogBackground: FlexColor.materialLightSurface,
              );
            case FlexSurface.light:
              return FlexSchemeSurfaceColors(
                  surface: FlexColor.lightSurface
                      .blend(primary, kLightBlendSurfaceLight),
                  background: FlexColor.lightBackground
                      .blend(primary, kLightBlendBackgroundLight),
                  scaffoldBackground: FlexColor.lightScaffoldBackground,
                  dialogBackground: FlexColor.lightSurface);
            case FlexSurface.medium:
              return FlexSchemeSurfaceColors(
                surface: FlexColor.lightSurface
                    .blend(primary, kLightBlendSurfaceMedium),
                background: FlexColor.lightBackground
                    .blend(primary, kLightBlendBackgroundMedium),
                scaffoldBackground: FlexColor.lightScaffoldBackground,
                dialogBackground: FlexColor.lightSurface
                    .blend(primary, kLightBlendSurfaceMedium),
              );
            case FlexSurface.strong:
              return FlexSchemeSurfaceColors(
                surface: FlexColor.lightSurface
                    .blend(primary, kLightBlendSurfaceStrong),
                background: FlexColor.lightBackground
                    .blend(primary, kLightBlendBackgroundStrong),
                scaffoldBackground: FlexColor.lightScaffoldBackground,
                dialogBackground: FlexColor.lightSurface
                    .blend(primary, kLightBlendSurfaceStrong),
              );
            case FlexSurface.heavy:
              return FlexSchemeSurfaceColors(
                surface: FlexColor.lightSurface
                    .blend(primary, kLightBlendSurfaceHeavy),
                background: FlexColor.lightBackground
                    .blend(primary, kLightBlendBackgroundHeavy),
                scaffoldBackground: FlexColor.lightScaffoldBackground
                    .blend(primary, kLightBlendScaffoldHeavy),
                dialogBackground: FlexColor.lightSurface
                    .blend(primary, kLightBlendSurfaceHeavy),
              );
            case FlexSurface.custom:
              // Custom surface theme returns same surface as standard
              // material surface. If surface colors are not overridden by
              // providing none null custom surface colors values to the
              // FlexColorScheme, the results is the same as material.
              return const FlexSchemeSurfaceColors(
                surface: FlexColor.materialLightSurface,
                background: FlexColor.materialLightBackground,
                scaffoldBackground: FlexColor.materialLightScaffoldBackground,
                dialogBackground: FlexColor.materialLightSurface,
              );
          }
        }
      // break;
      case Brightness.dark:
        {
          switch (surfaceStyle) {
            case FlexSurface.material:
              return const FlexSchemeSurfaceColors(
                surface: FlexColor.materialDarkSurface,
                background: FlexColor.materialDarkBackground,
                scaffoldBackground: FlexColor.materialDarkScaffoldBackground,
                dialogBackground: FlexColor.materialDarkSurface,
              );
            case FlexSurface.light:
              return FlexSchemeSurfaceColors(
                surface: FlexColor.darkSurface
                    .blend(primary, kDarkBlendSurfaceLight),
                background: FlexColor.darkBackground
                    .blend(primary, kDarkBlendBackgroundLight),
                scaffoldBackground: FlexColor.darkScaffoldBackground,
                dialogBackground: FlexColor.darkSurface
                    .blend(primary, kDarkBlendSurfaceLight),
              );
            case FlexSurface.medium:
              return FlexSchemeSurfaceColors(
                surface: FlexColor.darkSurface
                    .blend(primary, kDarkBlendSurfaceMedium),
                background: FlexColor.darkBackground
                    .blend(primary, kDarkBlendBackgroundMedium),
                scaffoldBackground: FlexColor.darkScaffoldBackground,
                dialogBackground: FlexColor.darkSurface
                    .blend(primary, kDarkBlendSurfaceMedium),
              );
            case FlexSurface.strong:
              return FlexSchemeSurfaceColors(
                surface: FlexColor.darkSurface
                    .blend(primary, kDarkBlendSurfaceStrong),
                background: FlexColor.darkBackground
                    .blend(primary, kDarkBlendBackgroundStrong),
                scaffoldBackground: FlexColor.darkScaffoldBackground,
                dialogBackground: FlexColor.darkSurface
                    .blend(primary, kDarkBlendSurfaceStrong),
              );
            case FlexSurface.heavy:
              return FlexSchemeSurfaceColors(
                surface: FlexColor.darkSurface
                    .blend(primary, kDarkBlendSurfaceHeavy),
                background: FlexColor.darkBackground
                    .blend(primary, kDarkBlendBackgroundHeavy),
                scaffoldBackground: FlexColor.darkScaffoldBackground
                    .blend(primary, kDarkBlendScaffoldHeavy),
                dialogBackground: FlexColor.darkSurface
                    .blend(primary, kDarkBlendSurfaceHeavy),
              );
            case FlexSurface.custom:
              // Custom surface theme returns same surface colors as standard
              // material surface.
              // It is up to the implementation of creating the scheme
              // to decide what to do when surfaceStyle [FlexSurface.custom]
              // is used. If the case is not handled, the custom style
              // will just result in the same style as [FlexSurface.material].
              return const FlexSchemeSurfaceColors(
                surface: FlexColor.materialDarkSurface,
                background: FlexColor.materialDarkBackground,
                scaffoldBackground: FlexColor.materialDarkScaffoldBackground,
                dialogBackground: FlexColor.materialDarkSurface,
              );
          }
        }
    }
  }

  /// Copy the object with one or more provided properties changed.
  FlexSchemeSurfaceColors copyWith({
    Color? surface,
    Color? background,
    Color? scaffoldBackground,
    Color? dialogBackground,
  }) {
    return FlexSchemeSurfaceColors(
      surface: surface ?? this.surface,
      background: background ?? this.background,
      scaffoldBackground: scaffoldBackground ?? this.scaffoldBackground,
      dialogBackground: dialogBackground ?? this.dialogBackground,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('surface', surface));
    properties.add(ColorProperty('background', background));
    properties.add(ColorProperty('scaffoldBackground', scaffoldBackground));
    properties.add(ColorProperty('dialogBackground', dialogBackground));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is FlexSchemeSurfaceColors &&
        other.surface == surface &&
        other.background == background &&
        other.scaffoldBackground == scaffoldBackground &&
        other.dialogBackground == dialogBackground;
  }

  @override
  int get hashCode {
    return hashValues(
      surface,
      background,
      scaffoldBackground,
      dialogBackground,
    );
  }
}

/// Immutable data class used to create "on" colors for displaying text
/// and icons on the surface, background, error colors and the primary and
/// secondary colors.
///
/// Normally the on colors are not provided manually but computed by using the
/// [FlexSchemeOnColors.from] static function that uses the
/// [ThemeData.estimateBrightnessForColor] static function for each on color
/// and returns a [FlexSchemeOnColors] object with the appropriate colors.
///
/// PrimaryVariant and SecondaryVariant do not have their own onColor. This is
/// a limitation imposed by the Flutter SDK [ColorScheme] class and [ThemeData]
/// using it. It is assumed that the onColor for primary and secondary colors
/// will also work OK for their variants. This is usually correct if the
/// variant colors are close in brightness to their none variant
/// versions. Scaffold background color that FlexColorScheme allows us to define
/// separately, also does not have its own "on" color, it is assumed that it is
/// close in brightness to the background color, so it uses the same "on" color
/// as background.
@immutable
class FlexSchemeOnColors with Diagnosticable {
  /// Default constructor. In most situations the factory
  /// [FlexSchemeOnColors.from] is the preferred way to create the onColors.
  const FlexSchemeOnColors({
    required this.onPrimary,
    required this.onSecondary,
    required this.onSurface,
    required this.onBackground,
    required this.onError,
  });

  /// A color that is clearly legible when drawn on primary color.
  final Color onPrimary;

  /// A color that is clearly legible when drawn on secondary color.
  final Color onSecondary;

  /// A color that is clearly legible when drawn on surface color.
  final Color onSurface;

  /// A color that is clearly legible when drawn on background color also used
  /// as on color for scaffold background color.
  final Color onBackground;

  /// A color that is clearly legible when drawn on error color.
  final Color onError;

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
  factory FlexSchemeOnColors.from({
    required Color primary,
    required Color secondary,
    required Color surface,
    required Color background,
    required Color error,
    Color? onPrimary,
    Color? onSecondary,
    Color? onSurface,
    Color? onBackground,
    Color? onError,
    int primaryAlpha = 0,
    int secondaryAlpha = 0,
    int surfaceAlpha = 0,
    int backgroundAlpha = 0,
    int errorAlpha = 0,
  }) {
    // Check brightness of primary, secondary, error, surface and background
    // colors, then calculate appropriate colors for their onColors, if an
    // "on" color was not passed in, otherwise we just use its given color.
    final Color _onPrimary = onPrimary ??
        (ThemeData.estimateBrightnessForColor(primary) == Brightness.dark
            ? Colors.white.blendAlpha(primary, primaryAlpha)
            : Colors.black.blendAlpha(primary, primaryAlpha));
    final Color _onSecondary = onSecondary ??
        (ThemeData.estimateBrightnessForColor(secondary) == Brightness.dark
            ? Colors.white.blendAlpha(secondary, secondaryAlpha)
            : Colors.black.blendAlpha(secondary, secondaryAlpha));
    final Color _onSurface = onSurface ??
        (ThemeData.estimateBrightnessForColor(surface) == Brightness.dark
            ? Colors.white.blendAlpha(surface, surfaceAlpha)
            : Colors.black.blendAlpha(surface, surfaceAlpha));
    final Color _onBackground = onBackground ??
        (ThemeData.estimateBrightnessForColor(background) == Brightness.dark
            ? Colors.white.blendAlpha(background, backgroundAlpha)
            : Colors.black.blendAlpha(background, backgroundAlpha));
    final Color _onError = onError ??
        (ThemeData.estimateBrightnessForColor(error) == Brightness.dark
            ? Colors.white.blendAlpha(error, errorAlpha)
            : Colors.black.blendAlpha(error, errorAlpha));

    return FlexSchemeOnColors(
      onPrimary: _onPrimary,
      onSecondary: _onSecondary,
      onSurface: _onSurface,
      onBackground: _onBackground,
      onError: _onError,
    );
  }

  /// Copy the object with one or more provided properties changed.
  FlexSchemeOnColors copyWith({
    Color? onPrimary,
    Color? onSecondary,
    Color? onSurface,
    Color? onBackground,
    Color? onError,
  }) {
    return FlexSchemeOnColors(
      onPrimary: onPrimary ?? this.onPrimary,
      onSecondary: onSecondary ?? this.onSecondary,
      onSurface: onSurface ?? this.onSurface,
      onBackground: onBackground ?? this.onBackground,
      onError: onError ?? this.onError,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is FlexSchemeOnColors &&
        other.onPrimary == onPrimary &&
        other.onSecondary == onSecondary &&
        other.onSurface == onSurface &&
        other.onBackground == onBackground &&
        other.onError == onError;
  }

  @override
  int get hashCode {
    return hashValues(
      onPrimary,
      onSecondary,
      onSurface,
      onBackground,
      onError,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('onPrimary', onPrimary));
    properties.add(ColorProperty('onSecondary', onSecondary));
    properties.add(ColorProperty('onSurface', onSurface));
    properties.add(ColorProperty('onBackground', onBackground));
    properties.add(ColorProperty('onError', onError));
  }
}

// Private class to hold alpha values for a given FlexSurfaceMode blend mode
// and blend level and static helper to compute the alpha blend values.
@immutable
class _AlphaValues {
  const _AlphaValues({
    this.primaryAlpha = 0,
    this.secondaryAlpha = 0,
    this.errorAlpha = 0,
    this.surfaceAlpha = 0,
    this.dialogAlpha = 0,
    this.backgroundAlpha = 0,
    this.scaffoldAlpha = 0,
  });

  /// Alpha blend value for primary color.
  final int primaryAlpha;

  /// Alpha blend value for primary color.
  final int secondaryAlpha;

  /// as on color for scaffold background color.
  final int errorAlpha;

  /// Alpha blend value for primary color.
  final int surfaceAlpha;

  /// Alpha blend value for primary color.
  final int dialogAlpha;

  /// Alpha blend value for primary color.
  final int backgroundAlpha;

  /// Alpha blend value for primary color.
  final int scaffoldAlpha;

  // Returns alpha values for a given blend level and blend mode and brightness.
  static _AlphaValues getAlphas(
    final FlexSurfaceMode mode,
    final int blendLevel,
    final Brightness brightness,
  ) {
    switch (mode) {
      case FlexSurfaceMode.level:
      case FlexSurfaceMode.custom:
        // Result: Background (1x) Surface (1x) Scaffold (1x).
        return _AlphaValues(
          primaryAlpha: blendLevel,
          secondaryAlpha: blendLevel,
          errorAlpha: blendLevel,
          surfaceAlpha: blendLevel,
          dialogAlpha: blendLevel,
          backgroundAlpha: blendLevel,
          scaffoldAlpha: blendLevel,
        );
      // Result: Background (3/2x) Surface & (1x) Scaffold (1/2x).
      case FlexSurfaceMode.highBackgroundLowScaffold:
        return _AlphaValues(
          primaryAlpha: blendLevel,
          secondaryAlpha: blendLevel,
          errorAlpha: blendLevel,
          surfaceAlpha: blendLevel,
          dialogAlpha: blendLevel,
          backgroundAlpha: blendLevel * 3 ~/ 2,
          scaffoldAlpha: blendLevel ~/ 2,
        );
      // Result: Surface (3/2x) Background (1x) Scaffold (1/2x).
      case FlexSurfaceMode.highSurfaceLowScaffold:
        return _AlphaValues(
          primaryAlpha: blendLevel,
          secondaryAlpha: blendLevel,
          errorAlpha: blendLevel,
          surfaceAlpha: blendLevel * 3 ~/ 2,
          dialogAlpha: blendLevel * 3 ~/ 2,
          backgroundAlpha: blendLevel,
          scaffoldAlpha: blendLevel ~/ 2,
        );
      // Result: Scaffold (3x) Background (1x) Surface (1/2x).
      case FlexSurfaceMode.highScaffoldLowSurface:
        return _AlphaValues(
          primaryAlpha: blendLevel,
          secondaryAlpha: blendLevel,
          errorAlpha: blendLevel,
          surfaceAlpha: blendLevel ~/ 2,
          dialogAlpha: blendLevel ~/ 2,
          backgroundAlpha: blendLevel,
          scaffoldAlpha: blendLevel * 3,
        );
      // Result: Scaffold (3x) background (3/2x) surface (1x).
      case FlexSurfaceMode.highScaffoldLevelSurface:
        return _AlphaValues(
          primaryAlpha: blendLevel,
          secondaryAlpha: blendLevel,
          errorAlpha: blendLevel,
          surfaceAlpha: blendLevel,
          dialogAlpha: blendLevel,
          backgroundAlpha: blendLevel * 3 ~/ 2,
          scaffoldAlpha: blendLevel * 3,
        );
      // Result: (1x) Surface and Background (1x) Scaffold (1/2x).
      case FlexSurfaceMode.levelSurfacesLowScaffold:
      case FlexSurfaceMode.levelSurfacesLowScaffoldVariantDialog:
        return _AlphaValues(
          primaryAlpha: blendLevel,
          secondaryAlpha: blendLevel,
          errorAlpha: blendLevel,
          surfaceAlpha: blendLevel,
          dialogAlpha: blendLevel,
          backgroundAlpha: blendLevel,
          scaffoldAlpha: blendLevel ~/ 2,
        );
      // Result: Scaffold (3x) Surface and background (1/2x).
      case FlexSurfaceMode.highScaffoldLowSurfaces:
      case FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog:
        return _AlphaValues(
          primaryAlpha: blendLevel,
          secondaryAlpha: blendLevel,
          errorAlpha: blendLevel,
          surfaceAlpha: blendLevel ~/ 2,
          dialogAlpha: blendLevel ~/ 2,
          backgroundAlpha: blendLevel ~/ 2,
          scaffoldAlpha: blendLevel * 3,
        );
    }
  }
}
