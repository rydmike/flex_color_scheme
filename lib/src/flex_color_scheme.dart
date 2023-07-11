import 'dart:async';

import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'flex_adaptive.dart';
import 'flex_alpha_values.dart';
import 'flex_color.dart';
import 'flex_constants.dart';
import 'flex_extensions.dart';
import 'flex_key_color.dart';
import 'flex_scheme.dart';
import 'flex_scheme_color.dart';
import 'flex_scheme_on_colors.dart';
import 'flex_scheme_surface_colors.dart';
import 'flex_sub_themes.dart';
import 'flex_sub_themes_data.dart';
import 'flex_surface_mode.dart';
import 'flex_text_theme_color.dart';

// ignore_for_file: comment_references

/// Enum to select the used AppBarTheme style in [FlexColorScheme] based themes
/// when using its [FlexColorScheme.light] and [FlexColorScheme.dark] factories.
enum FlexAppBarStyle {
  /// Use the scheme primary color as the AppBar's themed background color.
  ///
  /// This is the default for light themes, when [ThemeData.useMaterial3] is
  /// false.
  primary,

  /// Use Material 2 default surface color as the AppBar's themed background
  /// color.
  ///
  /// This is the default for dark schemes, when [ThemeData.useMaterial3] is
  /// false.
  ///
  /// For a dark scheme this choice will result in a near black app bar with
  /// color value (#FF121212). If this setting is used in a light scheme, it
  /// will result in a white app bar, as the standard Material 2 surface color
  /// for light scheme is white.
  material,

  /// Use scheme surface color as the AppBar's themed background color,
  /// including any blend (surface tint) color it may have.
  ///
  /// This is the default for light and dark theme mode, when
  /// [ThemeData.useMaterial3] is true.
  surface,

  /// Use scheme background color as the AppBar's themed background color,
  /// including any blend (surface tint) color it may have.
  background,

  /// Use scaffold background color as the AppBar's themed background color,
  /// including any blend (surface tint) color it may have.
  scaffoldBackground,

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
  /// [FlexSchemeColor.tertiary] also assigned to
  /// [FlexSchemeColor.appBarColor]. With them, the custom choice always
  /// results in the [FlexSchemeColor.tertiary] color, which is same
  /// as output [ColorScheme.tertiary], being used as the [AppBar]
  /// color when using the [custom] choice with them.
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
/// easier to create consistent themes using the [ColorScheme] concept.
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
/// A more opinionated theme and style can be returned by passing in a default
/// [FlexSubThemesData] constructor to [subThemesData].
/// By default the sub-themes take inspiration from the Material 3 (M3) Design
/// guide [specification](https://m3.material.io) and uses many f its values as
/// defaults when it is possible to do so in Flutter
/// SDK theming, within any remaining Material 2 (M2) design limitations.
///
/// The component sub-themes can be configured further by configuring a large
/// amount of properties in [FlexSubThemesData] that is passed into
/// [FlexColorScheme.subThemesData]. A commonly used feature is
/// to adjust the default corner border radius on all sub-themes for widgets
/// that supports it. The opinionated design is also more flat and features
/// primary tinted hover, focus, highlight and splash colors, among other
/// things.
///
/// It can be verbose to define nice themes directly with the default
/// unnamed constructor. [FlexColorScheme] is primarily intended to be used
/// with its two factory constructors [FlexColorScheme.light] and
/// [FlexColorScheme.dark], that create nice themes using defaults and
/// computed color values. The light and dark factories also give you access
/// to many predefined color schemes that you can use and easily modify.
///
/// With the light and dark factories you can also create
/// beautiful toned themes from just a single color. Additionally
/// [FlexColorScheme] makes it easy to create themes that use color branded
/// surfaces (backgrounds), that use alpha blend to mix in a varying degree
/// of a color, typically the primary color, into surfaces and backgrounds.
///
/// Branded surface are described in the Material design guide, but Flutter
/// offers no out of the box help to make such themes. With [FlexColorScheme]
/// you can use a varying degree of surface and background branding levels for
/// any theme you make, both in light and dark mode. When you use Material 3
/// color system matching [ColorScheme] its surface colors also include a hint
/// of the primary color in surfaces and background. This is called surface tint
/// in the Material 3 design guide. The name may be different and the algorithm
/// to generate the colors is also much more refined, but the design idea is the
/// same. With the factory constructors [FlexColorScheme.light] and
/// [FlexColorScheme.dark] you can also use the Material 3 color system and
/// its tools to generate ColorScheme for it. The factories also provide
/// more advanced and flexible key color generated [ColorScheme]'s, than what
/// is offered in Flutter SDK via [ColorScheme.fromSeed].
///
/// [FlexColorScheme] makes it easy to adjust the [AppBar]'s themed background
/// also to surface, background and scaffold background colors that also
/// use the same tint as these themed colors.
///
/// [FlexColorScheme] can automatically adjust the [TabBarTheme] to fit with the
/// active [AppBar] background or to be themed to always fit on
/// background/surface colors, if its primary usage will be in e.g. a [Scaffold]
/// body, or [Material] surface or canvas.
///
/// You can also quickly adjust things like the scrim on the app bar in Android
/// with [transparentStatusBar] and a quick tooltip style adjustment with
/// [tooltipsMatchBackground].
@immutable
class FlexColorScheme with Diagnosticable {
  /// Default constructor with no required properties.
  ///
  /// Creates a a light theme by default using the M2 colors as its default
  /// theme.
  ///
  /// Typically you would define
  /// requires [brightness] and four main color scheme
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
  /// surfaces. As well as using [FlexKeyColors] and [FlexTones] to make and
  /// customize key color seed generated [ColorScheme]s.
  const FlexColorScheme({
    this.colorScheme,
    this.brightness,
    this.primary,
    this.primaryContainer,
    this.secondary,
    this.secondaryContainer,
    this.tertiary,
    this.tertiaryContainer,
    this.error,
    this.surface,
    this.background,
    this.scaffoldBackground,
    this.dialogBackground,
    this.appBarBackground,
    this.onPrimary,
    this.onPrimaryContainer,
    this.onSecondary,
    this.onSecondaryContainer,
    this.onTertiary,
    this.onTertiaryContainer,
    this.onSurface,
    this.onBackground,
    this.onError,
    this.surfaceTint,
    this.tabBarStyle,
    this.appBarElevation,
    this.bottomAppBarElevation,
    this.tooltipsMatchBackground = false,
    this.transparentStatusBar = true,
    this.visualDensity,
    this.textTheme,
    this.primaryTextTheme,
    this.fontFamily,
    this.fontFamilyFallback,
    this.package,
    this.materialTapTargetSize,
    this.pageTransitionsTheme,
    this.platform,
    this.typography,
    this.applyElevationOverlayColor = true,
    this.subThemesData,
    this.useMaterial3 = false,
    this.extensions,
  })  : assert(appBarElevation == null || appBarElevation >= 0.0,
            'AppBar elevation must be >= 0 or null.'),
        assert(bottomAppBarElevation == null || bottomAppBarElevation >= 0.0,
            'Bottom AppBar elevation must be >= 0 or null.');

  /// The overall [ColorScheme] based colors for the theme.
  ///
  /// This property provides an alternative way to define custom colors for
  /// [FlexColorScheme] and is available from version 4.2.0. It is useful if
  /// you already have a custom [ColorScheme] based color definition that
  /// you want to use with FlexColorScheme theming and its sub-theming
  /// capabilities, often used with Material 3 based design and its seed
  /// generated color schemes.
  ///
  /// The factories [FlexColorScheme.light] and [FlexColorScheme.dark] provide
  /// convenience factories for also generating M3 based seeded themes using
  /// the built-in [FlexSchemeColor] colors as seed color(s), or using custom
  /// color values you provide as seed colors.
  ///
  /// If you provide both a [ColorScheme] and some individual direct property
  /// values that also exist in a [ColorScheme], the direct property values
  /// will override the corresponding ones in your [ColorScheme].
  ///
  /// If you do not define a [colorScheme], the individual color value
  /// properties and their defaults are used to define your effective
  /// [FlexColorScheme] and its resulting [ColorScheme] and [ThemeData].
  ///
  /// The [FlexColorScheme]'s effective [ColorScheme] can be returned with
  /// [toScheme]. This will always get you a complete color scheme, including
  /// calculated and derived color values,. This can be used when using the
  /// [FlexColorScheme.light] and [FlexColorScheme.dark] factories to compute
  /// schemes with branded or tinted surface colors. The effective [ColorScheme]
  /// of your theme is often needed if you want to create component sub-themes
  /// that should use the colors from the scheme, with its color assignments
  /// computed from the input colors.
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

  /// A color used for elements needing less emphasis than [primary].
  ///
  /// If not defined, and if there is no [colorScheme] defined, the default
  /// result will be [primary] color.
  final Color? primaryContainer;

  /// An accent color that, when used sparingly, calls attention to parts
  /// of your application.
  ///
  /// If not defined, and if there is no [colorScheme] defined, the default
  /// result will be [primary] color.
  final Color? secondary;

  /// A color used for elements needing less emphasis than [secondary].
  ///
  /// If not defined, and if there is no [colorScheme] defined, it will default
  /// to [secondary] color, and if it is not defined either, then [primary].
  final Color? secondaryContainer;

  /// A color used as a contrasting accent that can balance [primary]
  /// and [secondary] colors or bring heightened attention to an element,
  /// such as an input field.
  ///
  /// If not defined, and if there is no [colorScheme] defined, it will default
  /// to [secondary] color, and if it is not defined either, then [primary].
  final Color? tertiary;

  /// A color used for elements needing less emphasis than [tertiary].
  ///
  /// If not defined, and if there is no [colorScheme] defined, it will default
  /// to [secondary] color, and if it is not defined either, then [primary].
  final Color? tertiaryContainer;

  /// The color to use for input validation errors, for example on
  /// [InputDecoration.errorText].
  ///
  /// If no value is given, and if there is no [colorScheme] defined, it
  /// defaults to [FlexColor.materialLightError] if brightness is light,
  /// and to [FlexColor.materialDarkError] if brightness is dark.
  final Color? error;

  /// The surface (background) color for widgets like [Card] and
  /// [BottomAppBar].
  ///
  /// The color is applied to [ThemeData.cardColor] and [ColorScheme.surface]
  /// in [ThemeData.colorScheme], it is also used by all [Material] of type
  /// [MaterialType.card].
  ///
  /// If no value is given, and if there is no [colorScheme] defined, it
  /// defaults to [FlexColor.materialLightSurface] if brightness is light,
  /// and to [FlexColor.materialDarkSurface] if brightness is dark.
  final Color? surface;

  /// A color that typically appears behind scrollable content.
  ///
  /// The color is applied to [ThemeData.canvasColor] and
  /// ThemeData.backgroundColor, it is used eg by menu [Drawer] and by all
  /// [Material] of type [MaterialType.canvas].
  ///
  /// If no value is given, and if there is no [colorScheme] defined, it
  /// defaults to [FlexColor.materialLightBackground] if brightness is light,
  /// and to [FlexColor.materialDarkBackground] if brightness is dark.
  final Color? background;

  /// The color of the [Scaffold] background.
  ///
  /// The color is applied to [ThemeData.scaffoldBackgroundColor].
  ///
  /// This color cannot be controlled separately with Flutter's standard
  /// [ColorScheme] only based themes. FlexColorScheme brings back the
  /// possibility to specify it directly when using color scheme based themes.
  ///
  /// If no color is given, it defaults to [background].
  final Color? scaffoldBackground;

  /// The background color of [Dialog] elements.
  ///
  /// The color is applied to [ThemeData.dialogBackgroundColor]. It cannot be
  /// controlled separately with only a [ThemeData.from] a color scheme.
  ///
  /// When using sub-themes, it is also applied to backgroundColor in
  /// dialog themes, but only if [subThemesData.dialogBackgroundSchemeColor]
  /// has not be defined in [subThemesData].
  ///
  /// * DatePickerThemeData
  /// * DialogTheme
  /// * TimePickerThemeData
  ///
  /// If no value is given, and no [subThemesData.dialogBackgroundSchemeColor]
  /// is defined, default color is [surface].
  final Color? dialogBackground;

  /// Background theme color for the [AppBar].
  ///
  /// This AppBar theme color cannot be controlled separately with only
  /// standard [ThemeData.from] a [ColorScheme]. [FlexColorScheme] enables you
  /// to specify an AppBar theme color that is independent of the primary color
  /// in light theme and in dark mode of the dark theme's dark surface color.
  ///
  /// When you use it, the correct text and icon contrast color is computed and
  /// set automatically based on provided color.
  ///
  /// This AppBar color will also override any scheme color based selection
  /// in active used sub-themes if you have selected one for the AppBar there.
  final Color? appBarBackground;

  /// A color that is clearly legible when drawn on [primary] color.
  ///
  /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
  /// [primary] and [onPrimary] is recommended. See
  /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
  ///
  /// If null, and if [colorScheme.onPrimary] is null, the color is derived
  /// from the brightness of the effective primary color, and will be be black
  /// if it is light and white if it is dark.
  final Color? onPrimary;

  /// A color that's clearly legible when drawn on [primaryContainer].
  ///
  /// To ensure that an app is accessible, a contrast ratio between
  /// [primaryContainer] and [onPrimaryContainer] of at least 4.5:1
  /// is recommended. See
  /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
  ///
  /// If null, and if [colorScheme.onPrimaryContainer] is null, the color
  /// will via [ColorScheme] default be equal to resulting color scheme
  /// [ColorScheme.onPrimary].
  final Color? onPrimaryContainer;

  /// A color that is clearly legible when drawn on [secondary] color.
  ///
  /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
  /// [secondary] and [onSecondary] is recommended. See
  /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
  ///
  /// If null, the on color is derived from the brightness of the [secondary]
  /// color, and will be be black if it is light and white if it is dark.
  final Color? onSecondary;

  /// A color that's clearly legible when drawn on [secondaryContainer].
  ///
  /// To ensure that an app is accessible, a contrast ratio between
  /// [secondaryContainer] and [onSecondaryContainer] of at least 4.5:1
  /// is recommended. See
  /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
  ///
  /// If null, and if [colorScheme.onSecondaryContainer] is null, the color
  /// will via [ColorScheme] default be equal to resulting color scheme
  /// [ColorScheme.onSecondary].
  final Color? onSecondaryContainer;

  /// A color that's clearly legible when drawn on [tertiary].
  ///
  /// To ensure that an app is accessible, a contrast ratio between
  /// [tertiary] and [onTertiary] of at least 4.5:1 is recommended. See
  /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
  ///
  /// If null, and if [colorScheme.onTertiary] is null, the color
  /// will via [ColorScheme] default be equal to resulting color scheme
  /// [ColorScheme.onSecondary].
  final Color? onTertiary;

  /// A color that's clearly legible when drawn on [tertiaryContainer].
  ///
  /// To ensure that an app is accessible, a contrast ratio between
  /// [tertiaryContainer] and [onTertiaryContainer] of at least 4.5:1 is
  /// recommended. See
  /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
  ///
  /// If null, and if [colorScheme.onTertiaryContainer] and [onTertiary) is
  /// null, the color will via [ColorScheme] default be equal to resulting
  /// color scheme [ColorScheme.onSecondary].
  final Color? onTertiaryContainer;

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

  /// A custom color used as an overlay on a surface color to indicate a
  /// component's elevation and surface color branding or tinting.
  ///
  /// If a [colorScheme] was provided where this corresponding color is
  /// defined, this color property will override the same color in it.
  ///
  /// This color is used by Material 3 for colored elevation, it is also used
  /// as the blend color for FlexColorScheme surface blends. Additionally
  /// this color is if provided used as key color for seeding
  /// the neutral color palettes, when seed generated color schemes are used.
  /// It is important that all these properties use the same color.
  ///
  /// Typically this color is not customized, most designs use the default
  /// where the theme primary color is used for slightly mixing it into the
  /// neutral background and surface colors, when seeding is used. As well as
  /// using it for the the elevation tint in Material 3, plus for the
  /// surface blends that can optionally be added with FlexColorScheme.
  ///
  /// If undefined, [primary] color is used.
  final Color? surfaceTint;

  /// Select preferred style for the default [TabBarTheme].
  ///
  /// By default the TabBarTheme is made to fit with the style of the AppBar.
  /// In M2 mode that is done by defaulting to using
  /// [FlexTabBarStyle.forAppBar] if not defined. In M3 mode it done by
  /// defaulting to using [FlexTabBarStyle.flutterDefault].
  ///
  /// When setting this to [FlexTabBarStyle.forBackground], it will default
  /// to a theme that uses the color scheme and fits on background color,
  /// which typically also on works surface and scaffoldBackground color.
  /// This TabBarTheme style is useful if you primarily intended to use the
  /// TabBar in a Scaffold, Dialog, Drawer or Side panel on their background
  /// colors.
  final FlexTabBarStyle? tabBarStyle;

  /// The themed elevation for the [AppBar].
  ///
  /// If not defined, defaults to 0 in M2 (FCS opinionated) and to 0 in (M3
  /// spec default).
  ///
  /// The FCS 0dp elevation in M2 is an iOS style influenced opinionated
  /// choice, it can easily be adjusted for the theme with this property.
  final double? appBarElevation;

  /// The themed elevation for the [BottomAppBar].
  ///
  /// If undefined (null), defaults to 3 in M3 mode and to 8 in M2 mode,
  /// both via the defaults for the respective theme mode from Flutter's
  /// default elevation behavior of [BottomAppBar].
  final double? bottomAppBarElevation;

  /// When set to true, tooltip background color will match the brightness of
  /// the theme's background color.
  ///
  /// By default Flutter's Material tooltips use a theme where the tooltip
  /// background color brightness is inverted in relation to the overall
  /// theme's background color.
  ///
  /// [FlexColorScheme] allows you to use a single toggle to invert this.
  /// Light tooltips on light background is e.g. the default style on
  /// Windows Desktop toggle. You can use this toggle to use this style,
  /// or use it as a means to create a platform adaptive tooltip style, where
  /// the Material and Flutter style is used on devices and Web, but the
  /// inverted scheme is used on e.g. Windows platform.
  ///
  /// Defaults to false, and uses same background style as Material Design
  /// guide and Flutter.
  ///
  /// Additional tooltip styles when NOT opting in on FlexColorScheme sub
  /// themes are:
  ///
  /// - tooltipsMatchBackground: false
  ///   - none
  ///
  /// - tooltipsMatchBackground: true
  ///   - light theme:
  ///     - background: Color(0xF0FCFCFC),
  ///     - text: black
  ///   - Dark theme:
  ///     - background: Color(0xED444444),
  ///     - text: white
  ///   - Border radius: 4 dp
  ///   - Border: Yes, dividerColor
  ///   - Desktop OS (macOS, Linux, Windows)
  ///     - Font size : 12 dp
  ///   - Mobile OS (iOS, Android, Fuchsia)
  ///     - Font size : 14 dp
  ///
  /// Additional styles when opting in on FlexColorScheme sub themes are:
  ///
  /// - Desktop OS (macOS, Linux, Windows)
  ///   - Font size : 12 dp
  /// - Mobile OS (iOS, Android, Fuchsia)
  ///   - Font size : 14 dp
  /// - Border radius: 8 dp
  /// - Border: Yes, dividerColor
  /// - tooltipsMatchBackground: false
  ///   - light theme:
  ///     - background: Color(0xFF111111).blendAlpha(primary, 45%) opacity 95%.
  ///     - text: white
  ///   - Dark theme:
  ///     - background: Color(0xFFFFFFFF).blendAlpha(primary, 39%) opacity 95%.
  ///     - text: black
  /// - tooltipsMatchBackground: true
  ///   - light theme:
  ///     - background:  Color(0xFFFFFFFF).blendAlpha(primary, 4%) opacity 95%.
  ///     - text: black
  ///   - Dark theme:
  ///     - background: Color(0xFF111111).blendAlpha(primary, 16%) opacity 95%.
  ///     - text: white
  ///
  /// When using additional theming via sub-themes properties, its
  /// properties will if used override background color, text color and
  /// background opacity as well as border radius.
  final bool tooltipsMatchBackground;

  /// When `true`, the status bar on Android will be the same color as
  /// the rest of the AppBar.
  ///
  /// Defaults to true.
  ///
  /// When true, the AppBar in Android mimics the look of one-toned AppBar's
  /// typically used on iOS. Set it to `false` to revert back and use
  /// Android's default two-toned look. If true the status bar area is also
  /// transparent, then if the app bar is also translucent, content that scrolls
  /// behind it is also visible behind the status bar area.
  final bool transparentStatusBar;

  /// The density value for specifying the compactness of various UI components.
  ///
  /// Consider using [FlexColorScheme.comfortablePlatformDensity].
  /// It is similar to [VisualDensity.adaptivePlatformDensity], but the
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
  ///
  /// If a default `TextTheme` from package GoogleFonts is passed.
  /// FlexColorScheme will detect this and make the color in the passed
  /// in `GoogleFonts` null for all its `TextStyle`s so that the correct
  /// color for M2/M3 mode and contrast for light/dark mode is used.
  final TextTheme? textTheme;

  /// A text theme that contrasts with the primary color.
  ///
  /// If a default `TextTheme` from package GoogleFonts is passed.
  /// FlexColorScheme will detect this and make the color in the passed
  /// in `GoogleFonts` null for all its `TextStyle`s so that the correct
  /// color for M2/M3 mode and contrast for primary color is used.
  final TextTheme? primaryTextTheme;

  /// Name of the font family to use as default font for the text theme in
  /// created theme.
  ///
  /// Same feature as in [ThemeData] factory. Used to apply the font family
  /// name to default text theme and primary text theme, also passed along
  /// to [ThemeData],
  final String? fontFamily;

  /// Name of the font families to use as fallback to main font family.
  ///
  /// Same feature as in [ThemeData] factory. Used to apply the font family
  /// fallback to default text theme and primary text theme, also passed
  /// along to [ThemeData],
  final List<String>? fontFamilyFallback;

  /// Name of the font package to use with font fallback.
  ///
  /// Same feature as in [ThemeData] factory. Used to apply the font package
  /// to default text theme and primary text theme, also passed along
  /// to [ThemeData],
  final String? package;

  /// Configures the hit test size of certain Material widgets.
  ///
  /// Defaults to a [platform]-appropriate size: [MaterialTapTargetSize.padded]
  /// on mobile platforms, [MaterialTapTargetSize.shrinkWrap] on desktop
  /// platforms.
  ///
  /// This is convenience pass through in FlexColorScheme to avoid a `copyWith`
  /// on `ThemeData` produced by FlexColorScheme.
  final MaterialTapTargetSize? materialTapTargetSize;

  /// Default [MaterialPageRoute] transitions per [TargetPlatform].
  ///
  /// [MaterialPageRoute.buildTransitions] delegates to a [platform] specific
  /// [PageTransitionsBuilder]. If a matching builder is not found, a builder
  /// whose platform is null is used.
  ///
  /// This is convenience pass through in FlexColorScheme to avoid a `copyWith`
  /// on `ThemeData` produced by FlexColorScheme.
  final PageTransitionsTheme? pageTransitionsTheme;

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
  /// Same property as in [ThemeData] factory.
  /// Included for convenience to avoid a copyWith if it needs to be changed.
  /// Default value deviates from the Flutter standard that uses the old
  /// [Typography.material2014], in favor of newer [Typography.material2018]
  /// as default typography if one is not provided.
  ///
  /// In M3 mode FCS default to [Typography.material2021] and in M2 mode to
  /// older [Typography.material2018], which is correct for M2. Please note
  /// that Flutter ThemeData defaults to even older Typography
  /// [Typography.material2014] when not using M3. This is done for legacy
  /// compatibility reasons, you should use 2018 with M2.
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
  /// [ThemeData.colorScheme] and its [ColorScheme.surface] color value.
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

  /// Activate using FlexColorScheme opinionated component sub-themes by
  /// passing in a default `FlexSubThemesData()`.
  ///
  /// To further configure the sub-themes, change the simple flat value
  /// properties as desired in `FlexSubThemesData()`.
  ///
  /// By default [FlexThemeData.light], [FlexThemeData.dark] and
  /// [FlexColorScheme.toTheme], do as little as they need to just
  /// provide a consistent Material 2 color schemed theme. The additions they
  /// do are described in [FlexColorScheme.toTheme].
  ///
  /// The original purpose of the opinionated sub-themes was to make it easy
  /// to add themed corner radius to all Widgets that support it, and to
  /// provide a consistent look on all buttons, including [ToggleButtons].
  ///
  /// Therefore the sub themes are a convenient way to opt-in on customized
  /// corner radius on Widgets using above themes. By opting in you can set
  /// corner radius for all covered Widgets to same corner radius in one go.
  /// There are also properties to override the global default for each widget
  /// to set different rounding per widget if so desired.
  ///
  /// By default, if a `defaultRadius` is not specified, each widgets corner
  /// radius and some other styling take inspiration from the Material 3 (M3)
  /// specification https://m3.material.io/ and uses its specifications as
  /// defaults when it is possible to do so in Flutter SDK theming, within
  /// its current Material 2 (M2) design limitations.
  ///
  /// Starting from version 5, by opting in via a default [subThemesData] you
  /// get an extensive set of widget component sub themes applied.
  /// They can be customized via the [subThemesData] property, that has
  /// quick and flat sub theme configuration values in the data class
  /// [FlexSubThemesData].
  ///
  /// Opinionated sub themes are provided for:
  ///
  /// * [AppBarTheme] for [AppBar] via [FlexSubThemes.appBarTheme].
  /// * [BottomAppBarTheme] for [BottomAppBar] via
  ///   [FlexSubThemes.bottomAppBarTheme].
  /// * [BottomNavigationBarThemeData] for [BottomNavigationBar] via
  ///   [FlexSubThemes.bottomNavigationBar].
  /// * [BottomSheetThemeData] for [BottomSheet] via
  ///   [FlexSubThemes.bottomSheetTheme].
  /// * [ButtonThemeData] for old deprecated buttons, via
  ///   [FlexSubThemes.buttonTheme].
  /// * [CardTheme] for [Card] via [FlexSubThemes.cardTheme].
  /// * [CheckboxThemeData] for [Checkbox] via [FlexSubThemes.checkboxTheme].
  /// * [ChipThemeData] for [Chip] via [FlexSubThemes.chipTheme].
  /// * [DatePickerThemeData] for [DatePicker] via
  ///   [FlexSubThemes.datePickerTheme].
  /// * [DialogTheme] for [Dialog] via [FlexSubThemes.dialogTheme].
  /// * [DrawerThemeData] for [Drawer] via [FlexSubThemes.drawerTheme].
  /// * [DropdownMenuThemeData] for [DropDownMenu] via
  ///   [FlexSubThemes.dropdownMenuTheme].
  /// * [ElevatedButtonThemeData] for [ElevatedButton] via
  ///   [FlexSubThemes.elevatedButtonTheme].
  /// * [FilledButtonThemeData] for [FilledButton] via
  ///   [FlexSubThemes.filledButtonTheme].
  /// * [FloatingActionButtonThemeData] for [FloatingActionButton] via
  ///   [FlexSubThemes.floatingActionButtonTheme].
  /// * [IconButtonThemeData] for [IconButton] via
  ///   [FlexSubThemes.iconButtonTheme].
  /// * [InputDecorationTheme] for [InputDecoration] via
  ///   [FlexSubThemes.inputDecorationTheme].
  /// * [MenuBarThemeData] for [MenuBar] via [FlexSubThemes.menuBarTheme].
  /// * [MenuButtonThemeData] for [MenuButton] via
  ///   [FlexSubThemes.menuButtonTheme].
  /// * [MenuThemeData] for [MenuBar], [MenuAnchor] and [DropDownMenu] via
  ///   [FlexSubThemes.menuTheme].
  /// * [ListTileThemeData] for [ListTile] via
  ///   [FlexSubThemes.listTileTheme].
  /// * [NavigationBarThemeData] for [NavigationBar] via
  ///   [FlexSubThemes.navigationBarTheme].
  /// * [NavigationDrawerThemeData] for [NavigationDrawer] via
  ///   [FlexSubThemes.navigationDrawerTheme].
  /// * [NavigationRailThemeData] for [NavigationRail] via
  ///   [FlexSubThemes.navigationRailTheme].
  /// * [OutlinedButtonThemeData] for [OutlinedButton] via
  ///   [FlexSubThemes.outlinedButtonTheme].
  /// * [PopupMenuThemeData] for [PopupMenuButton] via
  ///   [FlexSubThemes.popupMenuTheme].
  /// * [RadioThemeData] for [Radio] via [FlexSubThemes.radioTheme].
  /// * [SliderThemeData] for [Slider] via [FlexSubThemes.sliderTheme].
  /// * [SnackBarThemeData] for [SnackBar] via [FlexSubThemes.snackBarTheme].
  /// * [SwitchThemeData] for [Switch] via [FlexSubThemes.switchTheme].
  /// * [TabBarTheme] for [TabBar] via [FlexSubThemes.tabBarTheme].
  /// * [TextButtonThemeData] for [TextButton] via
  ///   [FlexSubThemes.textButtonTheme].
  /// * [TimePickerThemeData] for [TimePickerDialog] via
  ///   [FlexSubThemes.timePickerTheme].
  /// * [ToggleButtonsThemeData] for [ToggleButtons] via
  ///   [FlexSubThemes.toggleButtonsTheme].
  /// * [TooltipThemeData] for [Tooltip] via [FlexSubThemes.tooltipTheme].
  ///
  /// * The custom `ButtonThemeData` even still provides matching styling to
  ///   the deprecated legacy buttons if they are used.
  ///
  /// Defaults to null, resulting in FlexColorScheme not using any extra
  /// sub-theming in addition to those described in [FlexColorScheme.toTheme].
  final FlexSubThemesData? subThemesData;

  /// A temporary flag used to opt-in to new SDK Material 3 features.
  ///
  /// Flutter SDK [useMaterial3] documentation:
  /// --------------------------------------------------------
  /// If true, then widgets that have been migrated to Material 3 will
  /// use new colors, typography and other features of Material 3. If false,
  /// they will use the Material 2 look and feel.
  ///
  /// During the migration to Material 3, turning this on may yield
  /// inconsistent look and feel in your app as some widgets are migrated
  /// while others have yet to be.
  ///
  /// Defaults to false. When the Material 3 specification is complete
  /// and all widgets are migrated on stable, we will change this flag to be
  /// true by default. After that change has landed on stable, we will deprecate
  /// this flag and remove all uses of it. At that point, the `material` library
  /// will aim to only support Material 3.
  ///
  /// ## Defaults
  /// If a [ThemeData] is constructed with [useMaterial3] set to true, then
  /// some properties will get updated defaults. Please note that
  /// [ThemeData.copyWith] with [useMaterial3] set to true will
  /// not change any of these properties in the resulting [ThemeData].
  ///
  /// <style>table,td,th { border-collapse: collapse; padding: 0.45em; } td { border: 1px solid }</style>
  ///
  /// | Property        | M3 default                 | M2 default              |
  /// | :-------------- | :------------------------- | :---------------------- |
  /// | [colorScheme]   | M3 baseline scheme         | M2 baseline scheme |
  /// | [typography]  | [Typography.material2021]  | [Typography.material2014] |
  /// | [splashFactory] | [InkSparkle]* or [InkRipple] | [InkSplash]           |
  ///
  /// \* if the target platform is Android and the app is not
  /// running on the web, otherwise it will fallback to [InkRipple].
  ///
  /// If [brightness] is [Brightness.dark] then the default color scheme will
  /// be either the M3 baseline dark color scheme or the M2 baseline dark color
  /// scheme depending on [useMaterial3].
  ///
  /// ## Affected widgets
  ///
  /// This flag affects styles and components.
  ///
  /// ### Styles
  ///   * Color: [ColorScheme], [Material] (see table above)
  ///   * Shape: (see components below)
  ///   * Typography: [Typography] (see table above)
  ///
  /// ### Components
  ///   * Badges: [Badge]
  ///   * Bottom app bar: [BottomAppBar]
  ///   * Bottom sheets: [BottomSheet]
  ///   * Buttons
  ///     - Common buttons: [ElevatedButton], [FilledButton],
  ///       [OutlinedButton], [TextButton]
  ///     - FAB: [FloatingActionButton], [FloatingActionButton.extended]
  ///     - Icon buttons: [IconButton]
  ///     - Segmented buttons: [SegmentedButton]
  ///   * Cards: [Card]
  ///   * Checkbox: [Checkbox]
  ///   * Chips:
  ///     - [ActionChip] (used for Assist and Suggestion chips),
  ///     - [FilterChip], [ChoiceChip] (used for single selection filter chips),
  ///     - [InputChip]
  ///   * Dialogs: [Dialog], [AlertDialog]
  ///   * Divider: [Divider]
  ///   * Lists: [ListTile]
  ///   * Menus: [MenuBar], [DropdownMenu]
  ///   * Navigation bar: [NavigationBar] (replacing [BottomNavigationBar])
  ///   * Navigation drawer: [NavigationDrawer]
  ///   * Navigation rail: [NavigationRail]
  ///   * Progress indicators: [CircularProgressIndicator],
  ///     [LinearProgressIndicator]
  ///   * Radio button: [Radio]
  ///   * Snack bar: [SnackBar]
  ///   * Slider: [Slider]
  ///   * Switch: [Switch]
  ///   * Tabs: [TabBar]
  ///   * TextFields: [TextField] together with its [InputDecoration]
  ///   * Top app bar: [AppBar]
  ///
  /// In addition, this flag enables features introduced in Android 12.
  ///   * Stretch overscroll: [MaterialScrollBehavior]
  ///   * Ripple: `splashFactory` (see table above)
  ///
  /// See also:
  ///
  ///   * [Material 3 specification](https://m3.material.io/)
  final bool useMaterial3;

  /// Arbitrary additions to this theme.
  ///
  /// This is the same property as [extensions] in ThemeData, it is provided
  /// as a convenience pass-through to ThemeData.
  ///
  /// To define extensions, pass an [Iterable] containing one or more
  /// [ThemeExtension] subclasses to [ThemeData.new] or [copyWith].
  ///
  /// To obtain an extension, use ThemeData.of(context).extension.
  final Iterable<ThemeExtension<dynamic>>? extensions;

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
  ///
  /// To activate using opinionated sub themes that further refines the produced
  /// theme, pass in a default [FlexSubThemesData] to [subThemesData], or use
  /// short cut properties to setup additional features in the sub-themes.
  ///
  /// Material 3 guide introduces a new color system with key colors and tonal
  /// palettes, see
  /// https://m3.material.io/styles/color/the-color-system/key-colors-tones.
  ///
  /// You can opt-in on using this new M3 color system by creating your tonal
  /// theme colors using the effective [primary], [secondary] and [tertiary]
  /// colors in the factory, as key colors to create tonal palettes for
  /// these main Material 3 color palettes.
  /// Colors from these key color seed generated palettes will then be used as
  /// color tones for the produce [ColorScheme], as defined by the Material 3
  /// design guide. By studying the Flutter SDK [ColorScheme.from] factory you
  /// can see which color tone from what key color is used where.
  /// [FlexColorScheme] uses the same assignments for the tones to the
  /// generated [ColorScheme] when you opt in using Material 3 tonal palettes.
  ///
  /// The [FlexColorScheme] light and dark factory offer more control over the
  /// seed generation setup. With [ColorScheme.fromSeed] you can only generate
  /// the [ColorScheme] from one key color, the primary color. With
  /// [FlexColorScheme] factories  you can use separate key colors for
  /// [secondary] and [tertiary] from the [primary] color, to make their
  /// tonal palettes. The effective colors in your [FlexColorScheme] for these
  /// color properties are used as key color inputs when you provide a
  /// [FlexKeyColors] via [keyColors] and enable it by setting
  /// [FlexKeyColors.useKeyColors] to true, which it is in its default
  /// constructor, so to enable it you can just pass in a default
  /// FlexKeyColors() to [keyColors].
  ///
  /// By setting [FlexKeyColors.useSecondary] or
  /// [FlexKeyColors.useTertiary] to false, the corresponding effective colors
  /// in [FlexColorScheme] will not be used as keys for corresponding
  /// [TonalPalette]. If one is off, its tonal palette will instead be based on
  /// the primary color as key. If both are false, the [FlexColorScheme.light]
  /// seeding algorithm becomes the same as using [ColorScheme.from]. The
  /// primary color is always used as seed color when key color seeding is
  /// enabled with [FlexKeyColors.useKeyColors] set to true.
  ///
  /// You can also opt to keep selected effective main colors, primary,
  /// secondary, tertiary and their containers, in your [FlexColorScheme] as
  /// their effective color, even when you enable key color based
  /// seeded tonal palette based ColorScheme output. You do this by
  /// setting [FlexKeyColors.keepPrimary], [FlexKeyColors.keepSecondary] etc to
  /// true, for each color property where you want to keep its exact color value
  /// as defined, but otherwise may be OK with using key seeded color values.
  ///
  /// You can use this feature if you for example want to use an exact
  /// predefined primary brand color in light mode, but are OK with all other
  /// colors using tones derived from its Material 3 tonal palette.
  ///
  /// When you use key color based seeded theme generation, the used key inputs
  /// for primary, secondary and tertiary are only used to set and generate the
  /// tone of the palette used for each colors tonal palette. You will rarely
  /// see the same color on that actual, primary, secondary and tertiary color
  /// in the produced [ColorScheme], unless you lock them down with the "keep"
  /// properties.
  ///
  /// The same tonal palette should typically be used for both
  /// light and dark mode colors. Under the hood [FlexColorScheme] selects the
  /// right color tone from the tonal palette, which is different for light and
  /// dark mode. For a matched light and dark theme, you should use the same
  /// input key color. When you use [FlexColorScheme.light] and
  /// [FlexColorScheme.dark] and the [FlexScheme] enum based [scheme] property,
  /// to use a built-in color scheme, it automatically uses also its
  /// predefined light theme mode defined colors as the key colors for
  /// primary, secondary and tertiary in dark mode, to ensure that the produced
  /// [ColorScheme] is using same tonal palette, but only different tones from
  /// it  for light and dark mode.
  ///
  /// When you use [colors], [colorScheme] or direct override color properties
  /// [primary], [secondary] or [tertiary] in the factories, these effective
  /// colors are used directly as key color inputs. It is then up to
  /// you to decide and design if you use the same key color for tonal palette
  /// generation in light and dark mode.
  ///
  /// If you use [colorScheme] or pass in [primary], [secondary] or
  /// [tertiary], and enable using [keyColors] the generated scheme will first
  /// use color from passed in direct color properties [primary], [secondary]
  /// or [tertiary], as key colors, then the same ones from the passed in
  /// [colorScheme] when it generates the output [ColorScheme] using the active
  /// [FlexKeyColors] setup.
  ///
  /// The generated [ColorScheme]'s properties will override all color
  /// properties that were passed in  via a [colorScheme], except those locked
  /// via the `keep` properties in [FlexKeyColors].
  ///
  /// If you assign override colors via direct color properties for the main
  /// colors [primary], [secondary] or [tertiary] and their containers, they
  /// will also only override the generated resulting [ColorScheme] if the
  /// the `keep` properties are set in [FlexKeyColors]. Other color properties
  /// that exist as both direct color properties and as a color in the
  /// generated resulting [ColorScheme], will be overridden by the generated
  /// colors scheme colors.
  ///
  /// Normally if you provide an entire [colorScheme] to [FlexColorScheme] it
  /// is typically because you already have a scheme that you want to use as is,
  /// then don't enable [keyColors] or any blends. It is however possible to
  /// apply both blends to passed in [colorScheme] surfaces or to just use
  /// the [primary], [secondary] or [tertiary] colors in passed in [colorScheme]
  /// as [keyColors] to generate an entirely new [ColorScheme] from the passed
  /// in colors, using [primary], [secondary] or [tertiary] as keys.
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
    /// capabilities.
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
    /// If you define a [surfaceMode] and set [blendLevel] > 0, then [surface],
    /// [surfaceVariant], [background] and [inverseSurface] colors in the
    /// provided [colorScheme] will be overridden by the computed color branded
    /// surfaces. If your [colorScheme] already contains branded surface colors,
    /// then keep [blendLevel] = 0 to continue using them.
    ///
    /// If you use [lightIsWhite] factory feature, it will also override your
    /// [colorScheme] based mentioned color properties above and make them
    /// 5% lighter.
    ///
    /// If you opt in on using sub themes and have set
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

    /// The selection of the six main scheme colors to be used when creating
    /// effective [ColorScheme].
    ///
    /// This is a convenience property that allows you to vary which colors to
    /// use of the primary, secondary and tertiary colors and their container
    /// colors when FlexSchemeColor creates its effective [ColorScheme] from
    /// the input colors. The integer number corresponds to using:
    ///
    /// * 1 = Only the primary color
    /// * 2 = Primary & Secondary colors
    /// * 3 = Primary + container & Secondary colors
    /// * 4 = Primary + container & Secondary + container
    /// * 5 = Primary + container & Secondary + container & tertiary colors
    /// * 6 = Primary + container & Secondary + container & tertiary + container
    /// * 7 = Primary, Secondary and tertiary, container colors computed.
    ///
    /// By default the value is 6 and all main scheme colors in
    /// `FlexSchemeColor` are used.
    ///
    /// The integer value is not a very obvious property to use to configure
    /// this feature. Future version may improve it. However, with the Themes
    /// Playground you don't have to remember what number does what.
    ///
    /// When the value is 1, the result is the same as if we would have
    /// created the colors with [FlexSchemeColor.from] by only giving it the
    /// required primary color. With 2, it is equivalent to as if we would have
    /// given it only the primary and secondary colors, and so on.
    /// This property makes it possible to simulate and change the resulting
    /// [FlexColorScheme] to as if you would have specified 1, 2, 3 ... 7 of
    /// the color selection. If your used [FlexColorScheme] `colors` was
    /// actually created with [FlexSchemeColor.from] with only the primary
    /// color defined, then changing the value from 7 ... 3, 2 or 1, will
    /// all produce the same effective scheme as the computed values will be
    /// the same as the [FlexSchemeColor.from] is using to compute any main
    /// missing scheme color values.
    final int usedColors = 6,

    /// Blends theme colors into surfaces and backgrounds.
    ///
    /// If defined, used mode overrides the older [surfaceStyle]
    /// property setting. Prefer using [surfaceMode] over [surfaceStyle],
    /// it offers more color branded surface modes and separate control over
    /// the used branding level via the separate [blendLevel] property.
    ///
    /// The mode [FlexSurfaceMode.highBackgroundLowScaffold] can be used to
    /// replace the style that was produced when using old and removed
    /// `FlexColorScheme.surfaceStyle` enum property `FlexSurface` in
    /// [FlexColorScheme.light] and [FlexColorScheme.dark] before version 4.
    ///
    /// The mode [FlexSurfaceMode.highBackgroundLowScaffold] uses the same
    /// design concept as the only style offered via removed `FlexSurface`
    /// in `FlexColorScheme.surfaceStyle` that was in use before version 4,
    /// and deprecated in version 4.2 and removed in version 5.0.0.
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
    ///
    /// Defaults to using [FlexSurfaceMode.highScaffoldLowSurfaces] when
    /// [blendLevel] > 0.
    final FlexSurfaceMode? surfaceMode,

    /// Sets the blend level strength used by the surface mode.
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
    /// Defaults to null, which when [useMaterial3] is false results in
    /// [FlexAppBarStyle.primary] which produces the same results
    /// as a Flutter standard M2 light [ThemeData.from] by tying the app bar
    /// color to the primary color. If [useMaterial3] is true it defaults
    /// [FlexAppBarStyle.surface] which is the same as M3 default.
    final FlexAppBarStyle? appBarStyle,

    /// Themed [AppBar] opacity.
    ///
    /// The opacity is applied to the effective AppBar color, which may be from
    /// used [appBarStyle], that gets its color selection from used [scheme]
    /// or [colors]. Or that color may have been overridden by AppBar sub-theme
    /// and there selected [SchemeColor] based color.
    /// Lastly and with highest priority it may be from here directly supplied
    /// [appBarBackground] color.
    ///
    /// A useful opacity range is from 0.85 to 0.95 when using the [Scaffold]
    /// property [extendBodyBehindAppBar] set to true, to partially show
    /// scrolling content behind the app bar. To use more opacity, in a way
    /// that the AppBar does not become too transparent, you also need to blur
    /// the background to create a frosted glass effect. This cannot
    /// be made with only theming, you need a custom AppBar Widget for that.
    /// Frosted glass UI effect is thus beyond the scope of what
    /// FlexColorScheme can do alone as it only affects ThemeData.
    ///
    /// If null, defaults to 1, fully opaque, no transparency.
    /// If not null, must be from 0 to 1.
    final double? appBarOpacity,

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
    ///
    /// In standard Material 2 this would be false, FCS uses an opinionated
    /// style and sets it true. In Material 3 the style you get when setting
    /// this to true is used by default. In M3 mode FCS will thus not create
    /// an AppBar sub theme to adjust this,if it is true and it is not needed
    /// for any other direct AppBar impacting properties in FlexColorScheme
    /// constructor. In M2 mode an AppBar theme will always be created, also
    /// when not opting in on the actual sub-themes feature, this per its
    /// opinionated and legacy styling for M2 mode.
    final bool transparentStatusBar = true,

    /// The themed elevation for the [AppBar].
    ///
    /// If not defined, defaults to 0 in M2 (FCS opinionated) and to 0 in (M3
    /// spec default).
    ///
    /// The FCS 0dp elevation in M2 is an iOS style influenced opinionated
    /// choice, it can easily be adjusted for the theme with this property.
    final double? appBarElevation,

    /// The themed elevation for the [BottomAppBar].
    ///
    /// If undefined (null), defaults to 3 in M3 mode and to 8 in M2 mode,
    /// both via the defaults for the respective theme mode from Flutter's
    /// default elevation behavior of [BottomAppBar].
    final double? bottomAppBarElevation,

    /// Select preferred style for the default [TabBarTheme].
    ///
    /// By default the TabBarTheme is made to fit with the style of the AppBar.
    /// In M2 mode that is done by defaulting to using
    /// [FlexTabBarStyle.forAppBar] if not defined. In M3 mode it done by
    /// defaulting to using [FlexTabBarStyle.flutterDefault].
    ///
    /// When setting this to [FlexTabBarStyle.forBackground], it will default
    /// to a theme that uses the color scheme and fits on background color,
    /// which typically also on works surface and scaffoldBackground color.
    /// This TabBarTheme style is useful if you primarily intended to use the
    /// TabBar in a Scaffold, Dialog, Drawer or Side panel on their background
    /// colors.
    final FlexTabBarStyle? tabBarStyle,

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

    /// A color used for elements needing less emphasis than [primary].
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
    final Color? primaryContainer,

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

    /// A color used for elements needing less emphasis than [secondary].
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
    final Color? secondaryContainer,

    /// A color used as a contrasting accent that can balance [primary]
    /// and [secondary] colors or bring heightened attention to an element,
    /// such as an input field.
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
    final Color? tertiary,

    /// A color used for elements needing less emphasis than [tertiary].
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
    final Color? tertiaryContainer,

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
    /// The color is applied to [ThemeData.dialogBackgroundColor]. It cannot be
    /// controlled separately with only a [ThemeData.from] a color scheme.
    ///
    /// When using sub-themes, it is also applied to backgroundColor in
    /// dialog themes, but only if [subThemesData.dialogBackgroundSchemeColor]
    /// has not be defined in [subThemesData].
    ///
    /// * DatePickerThemeData
    /// * DialogTheme
    /// * TimePickerThemeData
    ///
    /// If no value is given, and no [subThemesData.dialogBackgroundSchemeColor]
    /// is defined, default color is [surface].
    final Color? dialogBackground,

    /// Background theme color for the [AppBar].
    ///
    /// When using the factory this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] [colors] or for this color defined when using a
    /// pre-defined color scheme based on [FlexScheme] `scheme` property and
    /// the [FlexAppBarStyle] [appBarStyle] property.
    ///
    /// Thus custom color will also override any scheme color based selection
    /// for the [AppBAr] in active used sub-themes.
    final Color? appBarBackground,

    /// A color that is clearly legible when drawn on [primary] color.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// [primary] and [onPrimary] is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// When using this factory, this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] [colors] property or when using pre-defined color
    /// scheme based [FlexScheme] and its [scheme] property, including any
    /// used blend logic. If a [colorScheme] was provided with this
    /// corresponding color defined, this color property will override the
    /// same color in it as well.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the factory behavior.
    final Color? onPrimary,

    /// A color that's clearly legible when drawn on [primaryContainer].
    ///
    /// To ensure that an app is accessible, a contrast ratio between
    /// [primaryContainer] and [onPrimaryContainer] of at least 4.5:1
    /// is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// When using this factory, this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] [colors] property or when using pre-defined color
    /// scheme based [FlexScheme] and its [scheme] property, including any
    /// used blend logic. If a [colorScheme] was provided with this
    /// corresponding color defined, this color property will override the
    /// same color in it as well.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the factory behavior.
    final Color? onPrimaryContainer,

    /// A color that is clearly legible when drawn on [secondary] color.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// [secondary] and [onSecondary] is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// When using this factory, this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] [colors] property or when using pre-defined color
    /// scheme based [FlexScheme] and its [scheme] property, including any
    /// used blend logic. If a [colorScheme] was provided with this
    /// corresponding color defined, this color property will override the
    /// same color in it as well.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the factory behavior.
    final Color? onSecondary,

    /// A color that's clearly legible when drawn on [secondaryContainer].
    ///
    /// To ensure that an app is accessible, a contrast ratio between
    /// [secondaryContainer] and [onSecondaryContainer] of at least 4.5:1
    /// is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// When using this factory, this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] [colors] property or when using pre-defined color
    /// scheme based [FlexScheme] and its [scheme] property, including any
    /// used blend logic. If a [colorScheme] was provided with this
    /// corresponding color defined, this color property will override the
    /// same color in it as well.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the factory behavior.
    final Color? onSecondaryContainer,

    /// A color that's clearly legible when drawn on [tertiary].
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// [secondary] and [onSecondary] is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// When using this factory, this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] [colors] property or when using pre-defined color
    /// scheme based [FlexScheme] and its [scheme] property, including any
    /// used blend logic. If a [colorScheme] was provided with this
    /// corresponding color defined, this color property will override the
    /// same color in it as well.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the factory behavior.
    final Color? onTertiary,

    /// A color that's clearly legible when drawn on [tertiaryContainer].
    ///
    /// To ensure that an app is accessible, a contrast ratio between
    /// [secondaryContainer] and [onSecondaryContainer] of at least 4.5:1
    /// is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// When using this factory, this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] [colors] property or when using pre-defined color
    /// scheme based [FlexScheme] and its [scheme] property, including any
    /// used blend logic. If a [colorScheme] was provided with this
    /// corresponding color defined, this color property will override the
    /// same color in it as well.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the factory behavior.
    final Color? onTertiaryContainer,

    /// A color that is clearly legible when drawn on [surface] color.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// [surface] and [onSurface] is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// When using this factory, this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] [colors] property or when using pre-defined color
    /// scheme based [FlexScheme] and its [scheme] property, including any
    /// used blend logic. If a [colorScheme] was provided with this
    /// corresponding color defined, this color property will override the
    /// same color in it as well.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the factory behavior.
    final Color? onSurface,

    /// A color that is clearly legible when drawn on [background] color.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// [background] and [onBackground] is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// When using this factory, this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] [colors] property or when using pre-defined color
    /// scheme based [FlexScheme] and its [scheme] property, including any
    /// used blend logic. If a [colorScheme] was provided with this
    /// corresponding color defined, this color property will override the
    /// same color in it as well.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the factory behavior.
    final Color? onBackground,

    /// A color that is clearly legible when drawn on [error] color.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// [error] and [onError] is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// When using this factory, this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] [colors] property or when using pre-defined color
    /// scheme based [FlexScheme] and its [scheme] property, including any
    /// used blend logic. If a [colorScheme] was provided with this
    /// corresponding color defined, this color property will override the
    /// same color in it as well.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the factory behavior.
    final Color? onError,

    /// A custom color used as an overlay on a surface color to indicate a
    /// component's elevation and surface color branding or tinting.
    ///
    /// If a [colorScheme] was provided where this corresponding color is
    /// defined, this color property will override the same color in it.
    ///
    /// This color is used by Material 3 for colored elevation, it is also used
    /// as the blend color for FlexColorScheme surface blends. Additionally
    /// this color is if provided used as key color for seeding
    /// the neutral color palettes, when seed generated color schemes are used.
    /// It is important that all these properties use the same color.
    ///
    /// Typically this color is not customized, most designs use the default
    /// where the theme primary color is used for slightly mixing it into the
    /// neutral background and surface colors, when seeding is used. As well as
    /// using it for the the elevation tint in Material 3, plus for the
    /// surface blends that can optionally be added with FlexColorScheme.
    ///
    /// If undefined, [primary] color is used.
    final Color? surfaceTint,

    /// Makes the light theme backgrounds lighter or even white.
    ///
    /// Scaffold background will become white, and other surfaces also get
    /// lighter (8%), if using low blend levels they may become fully white too.
    final bool lightIsWhite = false,

    /// When true, the primary and primaryContainer colors will be swapped with
    /// their secondary counterparts.
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

    /// When set to true, tooltip background color will match the brightness of
    /// the theme's background color.
    ///
    /// By default Flutter's Material tooltips use a theme where the tooltip
    /// background color brightness is inverted in relation to the overall
    /// theme's background color.
    ///
    /// [FlexColorScheme] allows you to use a single toggle to invert this.
    /// Light tooltips on light background is e.g. the default style on
    /// Windows Desktop toggle. You can use this toggle to use this style,
    /// or use it as a means to create a platform adaptive tooltip style, where
    /// the Material and Flutter style is used on devices and Web, but the
    /// inverted scheme is used on e.g. Windows platform.
    ///
    /// Defaults to false, and uses same background style as Material Design
    /// guide and Flutter.
    ///
    /// Additional tooltip styles when NOT opting in on FlexColorScheme sub
    /// themes are:
    ///
    /// - tooltipsMatchBackground: false
    ///   - none
    ///
    /// - tooltipsMatchBackground: true
    ///   - light theme:
    ///     - background: Color(0xF0FCFCFC),
    ///     - text: black
    ///   - Dark theme:
    ///     - background: Color(0xED444444),
    ///     - text: white
    ///   - Border radius: 4 dp
    ///   - Border: Yes, dividerColor
    ///   - Desktop OS (macOS, Linux, Windows)
    ///     - Font size : 12 dp
    ///   - Mobile OS (iOS, Android, Fuchsia)
    ///     - Font size : 14 dp
    ///
    /// Additional styles when opting in on FlexColorScheme sub themes are:
    ///
    /// - Desktop OS (macOS, Linux, Windows)
    ///   - Font size : 12 dp
    /// - Mobile OS (iOS, Android, Fuchsia)
    ///   - Font size : 14 dp
    /// - Border radius: 8 dp
    /// - Border: Yes, dividerColor
    /// - tooltipsMatchBackground: false
    ///   - light theme:
    ///     - background: Color(0xFF111111).blendAlpha(primary, 45%) opacity 95%
    ///     - text: white
    ///   - Dark theme:
    ///     - background: Color(0xFFFFFFFF).blendAlpha(primary, 39%) opacity 95%
    ///     - text: black
    /// - tooltipsMatchBackground: true
    ///   - light theme:
    ///     - background:  Color(0xFFFFFFFF).blendAlpha(primary, 4%) opacity 95%
    ///     - text: black
    ///   - Dark theme:
    ///     - background: Color(0xFF111111).blendAlpha(primary, 16%) opacity 95%
    ///     - text: white
    ///
    /// When using additional theming via sub-themes properties, its
    /// properties will if used override background color, text color and
    /// background opacity as well as border radius.
    final bool tooltipsMatchBackground = false,

    /// Activate using FlexColorScheme opinionated component sub-themes by
    /// passing in a default `FlexSubThemesData()`.
    ///
    /// To further configure the sub-themes, change the simple flat value
    /// properties as desired in `FlexSubThemesData()`.
    ///
    /// By default [FlexThemeData.light], [FlexThemeData.dark] and
    /// [FlexColorScheme.toTheme], do as little as they need to just
    /// provide a consistent Material 2 color schemed theme. The additions they
    /// do are described in [FlexColorScheme.toTheme].
    ///
    /// The original purpose of the opinionated sub-themes was to make it easy
    /// to add themed corner radius to all Widgets that support it, and to
    /// provide a consistent look on all buttons, including [ToggleButtons].
    ///
    /// Therefore the sub themes are a convenient way to opt-in on customized
    /// corner radius on Widgets using above themes. By opting in you can set
    /// corner radius for all covered Widgets to same corner radius in one go.
    /// There are also properties to override the global default for each widget
    /// to set different rounding per widget if so desired.
    ///
    /// By default, if a `defaultRadius` is not specified, each widgets corner
    /// radius and some other styling take inspiration from the Material 3 (M3)
    /// specification https://m3.material.io/ and uses its specifications as
    /// defaults when it is possible to do so in Flutter SDK theming when using
    /// Material2 mode and via defaults also in Material 3 mode.
    ///
    /// Starting from version 5, by opting in via a default [subThemesData] you
    /// get an extensive set of widget component sub themes applied.
    /// They can be customized via the [subThemesData] property, that has
    /// quick and flat sub theme configuration values in the data class
    /// [FlexSubThemesData].
    ///
    /// Customizable sub-themes are available for:
    ///
    /// * [AppBarTheme] for [AppBar] via [FlexSubThemes.appBarTheme].
    /// * [BottomAppBarTheme] for [BottomAppBar] via
    ///   [FlexSubThemes.bottomAppBarTheme].
    /// * [BottomNavigationBarThemeData] for [BottomNavigationBar] via
    ///   [FlexSubThemes.bottomNavigationBar].
    /// * [BottomSheetThemeData] for [BottomSheet] via
    ///   [FlexSubThemes.bottomSheetTheme].
    /// * [ButtonThemeData] for old deprecated buttons, via
    ///   [FlexSubThemes.buttonTheme].
    /// * [CardTheme] for [Card] via [FlexSubThemes.cardTheme].
    /// * [CheckboxThemeData] for [Checkbox] via [FlexSubThemes.checkboxTheme].
    /// * [ChipThemeData] for [Chip] via [FlexSubThemes.chipTheme].
    /// * [DatePickerThemeData] for [DatePicker] via
    ///   [FlexSubThemes.datePickerTheme].
    /// * [DialogTheme] for [Dialog] via [FlexSubThemes.dialogTheme].
    /// * [DrawerThemeData] for [Drawer] via [FlexSubThemes.drawerTheme].
    /// * [DropdownMenuThemeData] for [DropDownMenu] via
    ///   [FlexSubThemes.dropdownMenuTheme].
    /// * [ElevatedButtonThemeData] for [ElevatedButton] via
    ///   [FlexSubThemes.elevatedButtonTheme].
    /// * [FilledButtonThemeData] for [FilledButton] via
    ///   [FlexSubThemes.filledButtonTheme].
    /// * [FloatingActionButtonThemeData] for [FloatingActionButton] via
    ///   [FlexSubThemes.floatingActionButtonTheme].
    /// * [IconButtonThemeData] for [IconButton] via
    ///   [FlexSubThemes.iconButtonTheme].
    /// * [InputDecorationTheme] for [InputDecoration] via
    ///   [FlexSubThemes.inputDecorationTheme].
    /// * [MenuBarThemeData] for [MenuBar] via [FlexSubThemes.menuBarTheme].
    /// * [MenuButtonThemeData] for [MenuButton] via
    ///   [FlexSubThemes.menuButtonTheme].
    /// * [MenuThemeData] for [MenuBar], [MenuAnchor] and [DropDownMenu] via
    ///   [FlexSubThemes.menuTheme].
    /// * [ListTileThemeData] for [ListTile] via
    ///   [FlexSubThemes.listTileTheme].
    /// * [NavigationBarThemeData] for [NavigationBar] via
    ///   [FlexSubThemes.navigationBarTheme].
    /// * [NavigationDrawerThemeData] for [NavigationDrawer] via
    ///   [FlexSubThemes.navigationDrawerTheme].
    /// * [NavigationRailThemeData] for [NavigationRail] via
    ///   [FlexSubThemes.navigationRailTheme].
    /// * [OutlinedButtonThemeData] for [OutlinedButton] via
    ///   [FlexSubThemes.outlinedButtonTheme].
    /// * [PopupMenuThemeData] for [PopupMenuButton] via
    ///   [FlexSubThemes.popupMenuTheme].
    /// * [RadioThemeData] for [Radio] via [FlexSubThemes.radioTheme].
    /// * [SliderThemeData] for [Slider] via [FlexSubThemes.sliderTheme].
    /// * [SnackBarThemeData] for [SnackBar] via [FlexSubThemes.snackBarTheme].
    /// * [SwitchThemeData] for [Switch] via [FlexSubThemes.switchTheme].
    /// * [TabBarTheme] for [TabBar] via [FlexSubThemes.tabBarTheme].
    /// * [TextButtonThemeData] for [TextButton] via
    ///   [FlexSubThemes.textButtonTheme].
    /// * [TimePickerThemeData] for [TimePickerDialog] via
    ///   [FlexSubThemes.timePickerTheme].
    /// * [ToggleButtonsThemeData] for [ToggleButtons] via
    ///   [FlexSubThemes.toggleButtonsTheme].
    /// * [TooltipThemeData] for [Tooltip] via [FlexSubThemes.tooltipTheme].
    ///
    /// Defaults to null, resulting in FlexColorScheme not using any extra
    /// sub-theming in addition to those described in [FlexColorScheme.toTheme].
    final FlexSubThemesData? subThemesData,

    /// To use and activate Material 3 color system based [ColorScheme]
    /// defined via key colors for primary, secondary and tertiary colors and
    /// the [TonalPalette] generated by these key color values, pass
    /// in a [FlexKeyColors] to [keyColors].
    ///
    /// By default it is not defined (null), and a traditional manually
    /// configured color scheme will be created based on input property values
    /// or a passed in [colorScheme].
    ///
    /// If a [FlexKeyColors] instance is passed in, the key color seeding
    /// behavior depends on properties defined in the [FlexKeyColors]
    /// instance. The default constructor makes one where
    /// [FlexKyColors.useKeyColors] is true, it will automatically enable usage
    /// of the used light scheme's primary color as key color and to seed
    /// generated a color scheme. The result will by default be equal to using
    /// Flutter SDK `ColorScheme.fromSeed`. With `FlexKeyColors` you can also
    /// use `secondary` and `tertiary` colors as key colors. Currently Flutter
    /// SDK does not support this.
    ///
    /// For more information on Material 3 color system and usage of key colors
    /// to generate tonal palettes and tones, see:
    /// https://m3.material.io/styles/color/the-color-system/key-colors-tones
    final FlexKeyColors? keyColors,

    /// Set to true, to use the new Material 3 error colors.
    ///
    /// If [useMaterial3ErrorColors] is false, the generated [ColorScheme]
    /// and [ThemeData] will use Material 2 default error colors or
    /// error colors as defined by the built in color schemes. Thus using same
    /// error colors as in FlexColorScheme versions before version 5.
    ///
    /// If [useMaterial3ErrorColors] is true, the resulting [ColorScheme]
    /// and [ThemeData] will use the Material 3 design guide error colors.
    ///
    /// Key color seed generated [ColorScheme]s always use the Material 3
    /// design guide error colors, or error colors from its customized
    /// [TonalPalette] generation setup.
    final bool useMaterial3ErrorColors = false,

    /// A configuration class enabling complete customization of
    /// used chroma for [TonalPalette] generation for the used seed [keyColors],
    /// as well as changing which tone in the tonal palettes is used
    /// for which [ColorScheme] color.
    ///
    /// By default a `FlexTones` configuration `FlexTones.material` that
    /// matches what Flutter SDK does with `ColorScheme.fromSeed` is used.
    ///
    /// There are six other built-in definitions that you can use, they can also
    /// serve as an example of how you can make custom `FlexTones`
    /// configurations.
    final FlexTones? tones,

    /// The density value for specifying the compactness of various UI
    /// components.
    ///
    /// Consider using [FlexColorScheme.comfortablePlatformDensity],
    /// it is similar to [VisualDensity.adaptivePlatformDensity], but the
    /// density for desktop and Web is less dense in order to offer a bit larger
    /// touch friendly surfaces, but not quite as large as small touch devices.
    ///
    /// This is the same property as in [ThemeData] factory, it is just
    /// passed along to it. Included for convenience, to avoid a copyWith
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

    /// Text with a color that contrasts with background, surface, card and
    /// canvas colors.
    ///
    /// If a default `TextTheme` from package GoogleFonts is passed.
    /// FlexColorScheme will detect this and make the color in the passed
    /// in `GoogleFonts` null for all its `TextStyle`s so that the correct
    /// color for M2/M3 mode and contrast for light/dark mode is used.
    final TextTheme? textTheme,

    /// A text theme that contrasts with the primary color.
    ///
    /// If a default `TextTheme` from package GoogleFonts is passed.
    /// FlexColorScheme will detect this and make the color in the passed
    /// in `GoogleFonts` null for all its `TextStyle`s so that the correct
    /// color for M2/M3 mode and contrast for primary color is used.
    final TextTheme? primaryTextTheme,

    /// Name of the font family to use as default font for the text theme in
    /// created theme.
    ///
    /// Same feature as in [ThemeData] factory. Used to apply the font family
    /// name to default text theme and primary text theme, also passed along
    /// to [ThemeData],
    final String? fontFamily,

    /// Name of the font families to use as fallback to main font family.
    ///
    /// Same feature as in [ThemeData] factory. Used to apply the font family
    /// fallback to default text theme and primary text theme, also passed
    /// along to [ThemeData],
    final List<String>? fontFamilyFallback,

    /// Name of the font package to use with font fallback.
    ///
    /// Same feature as in [ThemeData] factory. Used to apply the font package
    /// to default text theme and primary text theme, also passed along
    /// to [ThemeData],
    final String? package,

    /// Configures the hit test size of certain Material widgets.
    ///
    /// Defaults to a [platform]-appropriate size: MaterialTapTargetSize.padded
    /// on mobile platforms, MaterialTapTargetSize.shrinkWrap on desktop
    /// platforms.
    final MaterialTapTargetSize? materialTapTargetSize,

    /// Default [MaterialPageRoute] transitions per [TargetPlatform].
    ///
    /// [MaterialPageRoute.buildTransitions] delegates to a [platform] specific
    /// [PageTransitionsBuilder]. If a matching builder is not found, a builder
    /// whose platform is null is used.
    ///
    /// This is convenience pass through in FlexColorScheme to avoid a
    /// `copyWith` on `ThemeData` produced by FlexColorScheme.
    final PageTransitionsTheme? pageTransitionsTheme,

    /// The platform adaptive widgets adapt to defined target and mechanics,
    /// like scrolling too.
    ///
    /// Same property as in [ThemeData] factory. Included for convenience to
    /// avoid a copyWith to change it.
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
    ///
    /// When developing applications you can use this property to dynamically
    /// in the application change the used platform and partially test and see
    /// how adaptive widgets and scroll looks and feels on other platforms.
    final TargetPlatform? platform,

    /// The color and geometry [TextTheme] values used to configure [textTheme].
    ///
    /// Same property as in [ThemeData] factory.
    /// Included for convenience to avoid a copyWith if it needs to be changed.
    /// Default value deviates from the Flutter standard that uses the old
    /// [Typography.material2014], in favor of newer [Typography.material2018]
    /// as default typography if one is not provided.
    ///
    /// In M3 mode FCS default to [Typography.material2021] and in M2 mode to
    /// older [Typography.material2018], which is correct for M2. Please note
    /// that Flutter ThemeData defaults to even older Typography
    /// [Typography.material2014] when not using M3. This is done for legacy
    /// compatibility reasons, you should use 2018 with M2.
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

    /// A temporary flag used to opt-in to new SDK Material 3 features.
    ///
    /// Flutter SDK [useMaterial3] documentation:
    /// --------------------------------------------------------
    /// If true, then widgets that have been migrated to Material 3 will
    /// use new colors, typography and other features of Material 3. If false,
    /// they will use the Material 2 look and feel.
    ///
    /// During the migration to Material 3, turning this on may yield
    /// inconsistent look and feel in your app as some widgets are migrated
    /// while others have yet to be.
    ///
    /// Defaults to false. When the Material 3 specification is complete
    /// and all widgets are migrated on stable, we will change this flag to be
    /// true by default. After that change has landed on stable, we will
    /// deprecate this flag and remove all uses of it. At that point, the
    /// `material` library will aim to only support Material 3.
    ///
    /// ## Defaults
    /// If a [ThemeData] is constructed with [useMaterial3] set to true, then
    /// some properties will get updated defaults. Please note that
    /// [ThemeData.copyWith] with [useMaterial3] set to true will
    /// not change any of these properties in the resulting [ThemeData].
    ///
    /// <style>table,td,th { border-collapse: collapse; padding: 0.45em; } td { border: 1px solid }</style>
    ///
    /// | Property        | M3 default                 | M2 default           |
    /// | :-------------- | :------------------------- | :------------------- |
    /// | [colorScheme]   | M3 baseline scheme         | M2 baseline scheme |
    /// | [typography]  | [Typography.material2021]| [Typography.material2014] |
    /// | [splashFactory] | [InkSparkle]* or [InkRipple] | [InkSplash]         |
    ///
    /// \* if the target platform is Android and the app is not
    /// running on the web, otherwise it will fallback to [InkRipple].
    ///
    /// If [brightness] is [Brightness.dark] then the default color scheme will
    /// be either the M3 baseline dark color scheme or the M2 baseline dark
    /// color scheme depending on [useMaterial3].
    ///
    /// ## Affected widgets
    ///
    /// This flag affects styles and components.
    ///
    /// ### Styles
    ///   * Color: [ColorScheme], [Material] (see table above)
    ///   * Shape: (see components below)
    ///   * Typography: [Typography] (see table above)
    ///
    /// ### Components
    ///   * Badges: [Badge]
    ///   * Bottom app bar: [BottomAppBar]
    ///   * Bottom sheets: [BottomSheet]
    ///   * Buttons
    ///     - Common buttons: [ElevatedButton], [FilledButton],
    ///       [OutlinedButton], [TextButton]
    ///     - FAB: [FloatingActionButton], [FloatingActionButton.extended]
    ///     - Icon buttons: [IconButton]
    ///     - Segmented buttons: [SegmentedButton]
    ///   * Cards: [Card]
    ///   * Checkbox: [Checkbox]
    ///   * Chips:
    ///     - [ActionChip] (used for Assist and Suggestion chips),
    ///     - [FilterChip], [ChoiceChip] (used for single select filter chips),
    ///     - [InputChip]
    ///   * Dialogs: [Dialog], [AlertDialog]
    ///   * Divider: [Divider]
    ///   * Lists: [ListTile]
    ///   * Menus: [MenuBar], [DropdownMenu]
    ///   * Navigation bar: [NavigationBar] (replacing [BottomNavigationBar])
    ///   * Navigation drawer: [NavigationDrawer]
    ///   * Navigation rail: [NavigationRail]
    ///   * Progress indicators: [CircularProgressIndicator],
    ///     [LinearProgressIndicator]
    ///   * Radio button: [Radio]
    ///   * Snack bar: [SnackBar]
    ///   * Slider: [Slider]
    ///   * Switch: [Switch]
    ///   * Tabs: [TabBar]
    ///   * TextFields: [TextField] together with its [InputDecoration]
    ///   * Top app bar: [AppBar]
    ///
    /// In addition, this flag enables features introduced in Android 12.
    ///   * Stretch overscroll: [MaterialScrollBehavior]
    ///   * Ripple: `splashFactory` (see table above)
    ///
    /// See also:
    ///
    ///   * [Material 3 specification](https://m3.material.io/)
    final bool useMaterial3 = false,

    /// Set to true to automatically swap secondary and tertiary colors, on
    /// built-in color schemes when [useMaterial3] is true, that benefit
    /// from it to better match the Material 3 color system design intent.
    ///
    /// Starting with FlexColorScheme version 6.1.0, built-in color schemes,
    /// defined via [FlexSchemeColor], have a flag [swapOnMaterial3]. When
    /// defined to be true, the scheme will benefit if the [secondary] and
    /// [tertiary] colors, including their containers, are swapped when using
    /// Material 3. Most FlexColorScheme color schemes were designed with
    /// M2 usage in mind, before M3 existed. They may often have their
    /// [swapOnMaterial3] set to true. If this flag is false, it may mean
    /// that its `FlexSchemeColor` was designed for M3 or that it won't
    /// benefit from swapping its secondary and tertiary colors. In the
    /// [Scheme Reference](https://docs.flexcolorscheme.com/scheme_reference),
    /// you can see which schemes have the flag defined to true.
    ///
    /// Using a seed-generated color scheme based on built-in FlexSchemeColor
    /// colors is another way to make them suitable for the M3 Color system.
    /// However, in some cases, the secondary color in their design may not
    /// be in-line with the M3 color system design intent, especially if you
    /// use the config that also uses the hue from the secondary color to
    /// make tonal palettes for it. In some legacy FlexSchemeColor color
    /// designs this can be fixed if we swap the secondary and tertiary colors.
    ///
    /// To make FlexSchemeColor designs color designs that benefit from it
    /// automatically swap secondary and tertiary colors when [useMaterial3]
    /// is set to true, set `swapLegacyOnMaterial3` to true. It defaults to
    /// false, for backward compatibility, but it is recommended to turn
    /// it on when using Material 3 and its color system. If you use
    /// seeded color schemes with Material 2, [useMaterial3] flag is false,
    /// then it may be preferable to keep [swapOnMaterial3] false for more
    /// prominent colors on secondaries.
    ///
    /// This color swap has higher priority than [swapColor], using it will
    /// always happen on the effective result of [swapLegacyOnMaterial3] and
    /// [useMaterial3], and value of [swapOnMaterial3] in currently used
    /// built-in scheme [FlexSchemeColor].
    ///
    /// If a custom [colorScheme] is passed in, or any of the direct color
    /// properties [secondary], [secondaryContainer], [tertiary] or
    /// [tertiaryContainer], then it is assumed a custom scheme or overrides,
    /// are being used and the [swapLegacyOnMaterial3] setting does nothing.
    ///
    /// The Themes Playground app defaults to setting [swapLegacyOnMaterial3]
    /// to ON (true), but allows you to turn it OFF.
    ///
    /// Defaults to false, for backwards compatibility, but prefer setting it
    /// to true if you also set [useMaterial3] to true.
    final bool swapLegacyOnMaterial3 = false,

    /// Arbitrary additions to this theme.
    ///
    /// This is the same property as [extensions] in ThemeData, it is provided
    /// as a convenience pass-through to ThemeData.
    ///
    /// To define extensions, pass an [Iterable] containing one or more
    /// [ThemeExtension] subclasses to [ThemeData.new] or [copyWith].
    ///
    /// To obtain an extension, use ThemeData.of(context).extension.
    final Iterable<ThemeExtension<dynamic>>? extensions,
  }) {
    // LIGHT: Check valid inputs
    assert(usedColors >= 1 && usedColors <= 7, 'usedColors must be 1 to 7');
    assert(appBarOpacity == null || appBarOpacity >= 0 && appBarOpacity <= 1,
        'appBarOpacity must be 0 to 1, or null');
    assert(
      blendLevel >= 0 && blendLevel <= 40,
      'Only blend levels from 0 to 40 are allowed. Very high alpha values may '
      'not produce results that are visually very appealing or useful.',
    );
    assert(appBarElevation == null || appBarElevation >= 0.0,
        'AppBar elevation must be >= 0 or null.');
    assert(bottomAppBarElevation == null || bottomAppBarElevation >= 0.0,
        'Bottom AppBar elevation must be null or must be >= 0.');
    // Use color seeding based on passed in keyColors or make one where
    // it is not used, if one was not defined, since we want that as default
    // behavior to match past default behavior.
    final FlexKeyColors seed =
        keyColors ?? const FlexKeyColors(useKeyColors: false);
    // Fallback value for scheme is default material scheme.
    final FlexScheme flexScheme = scheme ?? FlexScheme.material;
    // If colors was null, we used the scheme based value.
    final FlexSchemeColor flexColors =
        colors ?? FlexColor.schemesWithCustom[flexScheme]!.light;

    // If the passed in property values are not null, or there was a colorScheme
    // provided, we will override the colors properties with them. Doing it here
    // gets also correct effective and swap behavior on directly passed in
    // property values or colorScheme based colors too.
    final FlexSchemeColor withPassedColors = flexColors.copyWith(
      primary: primary ?? colorScheme?.primary,
      primaryContainer: primaryContainer ?? colorScheme?.primaryContainer,
      secondary: secondary ?? colorScheme?.secondary,
      secondaryContainer: secondaryContainer ?? colorScheme?.secondaryContainer,
      tertiary: tertiary ?? colorScheme?.tertiary,
      tertiaryContainer: tertiaryContainer ?? colorScheme?.tertiaryContainer,
      error: error ?? colorScheme?.error,
      errorContainer: colorScheme?.errorContainer,
    );
    // Swap legacy secondary and tertiary color if we use Material 3 and
    // we have swapping of legacy colors on and if the colors in used built-in
    // scheme has flag [swapOnMaterial3] set that tells it benefits from doing
    // this. Additionally we should only do this if we have not passed a custom
    // ColorScheme, nor secondary or tertiary colors directly.
    final bool swapLegacy = useMaterial3 &&
        swapLegacyOnMaterial3 &&
        flexColors.swapOnMaterial3 &&
        secondary == null &&
        secondaryContainer == null &&
        tertiary == null &&
        tertiaryContainer == null &&
        colorScheme == null;
    // First cut of effective FlexSchemeColor depends on colors, usedColors
    // and swapLegacy and swap. When we use Brightness.light, we also guarantee
    // that we have colors on effectiveColors.error and errorContainer, they
    // are guaranteed to no longer be null after this call.
    FlexSchemeColor effectiveColors = FlexSchemeColor.effective(
      withPassedColors,
      usedColors,
      swapLegacy: swapLegacy,
      swapColors: swapColors,
      brightness: Brightness.light,
    );
    // ColorScheme to hold our seeded scheme colors, it will be kept as null
    // if we do not use M3 key based seeded tonal palette ColorScheme.
    ColorScheme? seedScheme;
    // If keyColor seeds is active, apply seeded colors to effective colors.
    if (seed.useKeyColors) {
      // Create a complete ColorScheme from active and effective seed colors.
      seedScheme = SeedColorScheme.fromSeeds(
        brightness: Brightness.light,
        primaryKey: effectiveColors.primary,
        // If use secondary seed, use it with fromSeeds, otherwise undefined.
        secondaryKey: seed.useSecondary ? effectiveColors.secondary : null,
        // If use tertiary seed, use it with fromSeeds, otherwise undefined.
        tertiaryKey: seed.useTertiary ? effectiveColors.tertiary : null,
        // If a custom surface tint is used, use it also as key for neutral and
        // neutral variant tonal palette generation.
        neutralKey: surfaceTint,
        neutralVariantKey: surfaceTint,
        // Use provided tones configuration or default one.
        tones: tones,
        surfaceTint: surfaceTint,
      );
      // Update effective main colors to seed colors, keeping configured
      // effective main color values when so defined.
      effectiveColors = FlexSchemeColor(
        primary:
            seed.keepPrimary ? effectiveColors.primary : seedScheme.primary,
        primaryContainer: seed.keepPrimaryContainer
            ? effectiveColors.primaryContainer
            : seedScheme.primaryContainer,
        secondary: seed.keepSecondary
            ? effectiveColors.secondary
            : seedScheme.secondary,
        secondaryContainer: seed.keepSecondaryContainer
            ? effectiveColors.secondaryContainer
            : seedScheme.secondaryContainer,
        tertiary:
            seed.keepTertiary ? effectiveColors.tertiary : seedScheme.tertiary,
        tertiaryContainer: seed.keepTertiaryContainer
            ? effectiveColors.tertiaryContainer
            : seedScheme.tertiaryContainer,
        appBarColor: effectiveColors.appBarColor,
        error: seedScheme.error,
        errorContainer: seedScheme.errorContainer,
      );
    }
    // Get effective surfaceTint color, also used as blend color for surfaces.
    final Color blendColor =
        surfaceTint ?? colorScheme?.surfaceTint ?? effectiveColors.primary;
    // Compute surface blends, they are also be added to seeded surfaces.
    final FlexSchemeSurfaceColors surfaceSchemeColors =
        FlexSchemeSurfaceColors.blend(
      brightness: Brightness.light,
      surfaceMode: surfaceMode ?? FlexSurfaceMode.highScaffoldLowSurfaces,
      blendLevel: blendLevel,
      surfaceVariantBlendDivide: seed.useKeyColors ? 2 : 1,
      schemeColors: effectiveColors,
      blendColors: FlexSchemeSurfaceColors(
        surface: blendColor,
        surfaceVariant: blendColor,
        inverseSurface: blendColor,
        dialogBackground: blendColor,
        background: blendColor,
        scaffoldBackground: blendColor,
      ),
      surfaceColors: seed.useKeyColors
          // Using seed colors, starting surfaces are given by generated scheme.
          ? FlexSchemeSurfaceColors(
              surface: seedScheme!.surface,
              surfaceVariant: seedScheme.surfaceVariant,
              inverseSurface: seedScheme.inverseSurface,
              dialogBackground: seedScheme.surface,
              background: seedScheme.background,
              scaffoldBackground: seedScheme.background,
            )
          // Colorscheme surfaces are used as starting point for blended ones.
          : colorScheme != null
              ? FlexSchemeSurfaceColors(
                  surface: colorScheme.surface,
                  surfaceVariant: colorScheme.surfaceVariant,
                  inverseSurface: colorScheme.inverseSurface,
                  dialogBackground: colorScheme.surface,
                  background: colorScheme.background,
                  scaffoldBackground: colorScheme.background,
                )
              : null,
    );
    // Use sub-themes if a none null FlexSubThemesData was provided.
    final bool useSubThemes = subThemesData != null;
    // Use passed in sub-theme config data, or a default one, if none given.
    final FlexSubThemesData subTheme =
        subThemesData ?? const FlexSubThemesData();
    // Effective blend level for the onColors.
    int onBlendLevel = useSubThemes ? (subTheme.blendOnLevel ?? 0) : 0;
    assert(
        onBlendLevel >= 0 && onBlendLevel <= 40,
        'Only onBlendLevel:s from 0 to 40 '
        'are allowed. Very high alpha blend levels may not produce results '
        'that are visually very appealing or useful.');
    // If above happens in none debug mode, use 0, no blends.
    if (onBlendLevel < 0 || onBlendLevel > 40) onBlendLevel = 0;

    // Get alpha blend values for used mode, on blend level and brightness,
    // used for onContainers and onSurface and onBackground.
    final FlexAlphaValues alphaOnValue = useSubThemes
        ? FlexAlphaValues.getAlphas(
            surfaceMode ?? FlexSurfaceMode.highScaffoldLowSurfaces,
            onBlendLevel)
        : const FlexAlphaValues();
    // Get alpha blend values for used mode, on blend level and brightness,
    // used for onPrimary, onSecondary, onTertiary and onError.
    final FlexAlphaValues alphaOnMain = useSubThemes && subTheme.blendOnColors
        ? FlexAlphaValues.getAlphas(
            surfaceMode ?? FlexSurfaceMode.highScaffoldLowSurfaces,
            onBlendLevel)
        : const FlexAlphaValues();
    // Determine the input surface, surfaceVariant and background colors,
    // inputSurfaceVariant cannot be overridden via FlexColorScheme prop yet.
    // This is a preparation for adding it.
    // TODO(rydmike): Maybe add prop inputSurfaceVariant and inverseSurface.
    final Color inputSurface = surface ?? surfaceSchemeColors.surface;
    final Color inputSurfaceVariant = surfaceSchemeColors.surfaceVariant;
    final Color inputBackground = background ?? surfaceSchemeColors.background;

    final FlexSchemeOnColors onColors = FlexSchemeOnColors.from(
      primary: effectiveColors.primary,
      primaryContainer: effectiveColors.primaryContainer,
      secondary: effectiveColors.secondary,
      secondaryContainer: effectiveColors.secondaryContainer,
      tertiary: effectiveColors.tertiary,
      tertiaryContainer: effectiveColors.tertiaryContainer,
      surface: inputSurface,
      surfaceVariant: inputSurfaceVariant,
      inverseSurface: surfaceSchemeColors.inverseSurface,
      background: inputBackground,
      error: effectiveColors.error!,
      errorContainer: effectiveColors.errorContainer,
      onPrimary: onPrimary ??
          (seed.useKeyColors && seed.keepPrimary
              ? null
              : seedScheme?.onPrimary) ??
          colorScheme?.onPrimary,
      onPrimaryContainer: onPrimaryContainer ??
          (seed.useKeyColors && seed.keepPrimaryContainer
              ? null
              : seedScheme?.onPrimaryContainer) ??
          colorScheme?.onPrimaryContainer,
      onSecondary: onSecondary ??
          (seed.useKeyColors && seed.keepSecondary
              ? null
              : seedScheme?.onSecondary) ??
          colorScheme?.onSecondary,
      onSecondaryContainer: onSecondaryContainer ??
          (seed.useKeyColors && seed.keepSecondaryContainer
              ? null
              : seedScheme?.onSecondaryContainer) ??
          colorScheme?.onSecondaryContainer,
      onTertiary: onTertiary ??
          (seed.useKeyColors && seed.keepTertiary
              ? null
              : seedScheme?.onTertiary) ??
          colorScheme?.onTertiary,
      onTertiaryContainer: onTertiaryContainer ??
          (seed.useKeyColors && seed.keepTertiaryContainer
              ? null
              : seedScheme?.onTertiaryContainer) ??
          colorScheme?.onTertiaryContainer,
      onSurface: onSurface ?? seedScheme?.onSurface ?? colorScheme?.onSurface,
      onSurfaceVariant:
          seedScheme?.onSurfaceVariant ?? colorScheme?.onSurfaceVariant,
      onInverseSurface:
          seedScheme?.onInverseSurface ?? colorScheme?.onInverseSurface,
      onBackground:
          onBackground ?? seedScheme?.onBackground ?? colorScheme?.onBackground,
      onError: onError ?? seedScheme?.onError ?? colorScheme?.onError,
      onErrorContainer: seedScheme?.onError ?? colorScheme?.onErrorContainer,
      primaryAlpha: alphaOnMain.primaryAlpha,
      primaryContainerAlpha: alphaOnValue.primaryContainerAlpha,
      secondaryAlpha: alphaOnMain.secondaryAlpha,
      secondaryContainerAlpha: alphaOnValue.secondaryContainerAlpha,
      tertiaryAlpha: alphaOnMain.tertiaryAlpha,
      tertiaryContainerAlpha: alphaOnValue.tertiaryContainerAlpha,
      surfaceAlpha: alphaOnValue.surfaceAlpha,
      surfaceVariantAlpha: alphaOnValue.surfaceVariantAlpha,
      inverseSurfaceAlpha: alphaOnValue.inverseSurfaceAlpha,
      backgroundAlpha: alphaOnValue.backgroundAlpha,
      errorAlpha: alphaOnMain.errorAlpha,
      errorContainerAlpha: alphaOnValue.errorContainerAlpha,
    );
    // Determine effective surface color.
    // Surface is used e.g. by Card and bottom appbar.
    // If light is white, we make a lighter than normal surface. If not
    // light is white, we use provided surface color, or computed one.
    final Color effectiveSurfaceColor =
        lightIsWhite ? inputSurface.lighten(5) : inputSurface;
    final Color effectiveSurfaceVariantColor =
        lightIsWhite ? inputSurfaceVariant.lighten(5) : inputSurfaceVariant;
    final Color effectiveInverseSurfaceColor = lightIsWhite
        ? surfaceSchemeColors.inverseSurface.darken(5)
        : surfaceSchemeColors.inverseSurface;
    // Determine effective background color.
    // Used e.g. by drawer, nav rail, side menu and bottom bar.
    // If light is white, we make a lighter than normal background. If not
    // light is white, we use provided background color, or computed one.
    final Color effectiveBackgroundColor =
        lightIsWhite ? inputBackground.lighten(5) : inputBackground;

    // Determine the effective scaffold background color.
    final Color effectiveScaffoldColor = scaffoldBackground ??
        (lightIsWhite ? Colors.white : surfaceSchemeColors.scaffoldBackground);

    // Determine effective dialog background color.
    // If light is white, we use lighter than normal. If not,
    // we use dialog provided background color, or computed one.
    // The provided dialog background color overrides factory surface behavior,
    // but is impacted by plain white for a lighter effect.
    final Color effectiveDialogBackground = lightIsWhite
        ? dialogBackground?.lighten(5) ??
            surfaceSchemeColors.dialogBackground.lighten(5)
        : dialogBackground ?? surfaceSchemeColors.dialogBackground;

    // Compute the effective ColorScheme based on all selection options.
    final ColorScheme effectiveColorScheme = seedScheme?.copyWith(
          // We made a seeded color scheme, we use it as given but set
          // override values for props we have not handled via FCS direct
          // props further below. We don't adjust onColors for
          // surfaceVariant and inverseSurface on purpose.
          surfaceVariant: effectiveSurfaceVariantColor,
          inverseSurface: effectiveInverseSurfaceColor,
          surfaceTint: surfaceTint,
        ) ??
        // We had a colorScheme passed in, we use as passed in, but set
        // override values for props we do not handle via FCS direct
        // props further below.
        colorScheme?.copyWith(
          surfaceVariant: effectiveSurfaceVariantColor,
          onSurfaceVariant: onColors.onSurfaceVariant,
          inverseSurface: effectiveInverseSurfaceColor,
          onInverseSurface: onColors.onInverseSurface,
          surfaceTint: surfaceTint,
        ) ??
        // In order to avoid using a ColorScheme.light that sets
        // some opinionated defaults on deprecated members that we do not
        // want, we make a full one matching the target. Values that
        // exist as direct properties in FlexColorScheme, will actually
        // be used via them further below, but we need this ColorScheme
        // to provide the properties we are not handling via FCS
        // constructor. An alternative would be to add missing ColorScheme
        // properties to FlexColorScheme as direct override properties.
        // Might do so later.
        ColorScheme(
          brightness: Brightness.light,
          primary: effectiveColors.primary,
          onPrimary: onColors.onPrimary,
          primaryContainer: effectiveColors.primaryContainer,
          onPrimaryContainer: onColors.onPrimaryContainer,
          secondary: effectiveColors.secondary,
          onSecondary: onColors.onSecondary,
          secondaryContainer: effectiveColors.secondaryContainer,
          onSecondaryContainer: onColors.onSecondaryContainer,
          tertiary: effectiveColors.tertiary,
          onTertiary: onColors.onTertiary,
          tertiaryContainer: effectiveColors.tertiaryContainer,
          onTertiaryContainer: onColors.onTertiaryContainer,
          error: useMaterial3ErrorColors && !seed.useKeyColors
              ? FlexColor.material3LightError
              : effectiveColors.error!,
          onError: useMaterial3ErrorColors && !seed.useKeyColors
              ? FlexColor.material3LightOnError
              : onColors.onError,
          errorContainer: useMaterial3ErrorColors && !seed.useKeyColors
              ? FlexColor.material3LightErrorContainer
              : effectiveColors.errorContainer!,
          onErrorContainer: useMaterial3ErrorColors && !seed.useKeyColors
              ? FlexColor.material3LightOnErrorContainer
              : onColors.onErrorContainer,
          background: effectiveBackgroundColor,
          onBackground: onColors.onBackground,
          surface: effectiveSurfaceColor,
          onSurface: onColors.onSurface,
          surfaceVariant: effectiveSurfaceVariantColor,
          onSurfaceVariant: onColors.onSurfaceVariant,
          outline: _outlineColor(Brightness.light, onColors.onBackground, 45),
          outlineVariant:
              _outlineColor(Brightness.light, onColors.onBackground, 75),
          shadow: Colors.black,
          scrim: Colors.black,
          inverseSurface: effectiveInverseSurfaceColor,
          onInverseSurface: onColors.onInverseSurface,
          inversePrimary: _inversePrimary(
              Brightness.light, effectiveColors.primary, effectiveSurfaceColor),
          surfaceTint: surfaceTint ?? effectiveColors.primary,
        );

    // Determine the effective AppBar color:
    // - First priority, passed in color value.
    Color? effectiveAppBarColor = appBarBackground;
    // - Second priority, sub-theme based scheme color.
    effectiveAppBarColor ??=
        useSubThemes && subTheme.appBarBackgroundSchemeColor != null
            ? FlexSubThemes.schemeColor(
                subTheme.appBarBackgroundSchemeColor!, effectiveColorScheme)
            : null;
    // Third priority [appBarStyle] based.
    if (effectiveAppBarColor == null) {
      switch (appBarStyle) {
        case FlexAppBarStyle.primary:
          effectiveAppBarColor =
              effectiveColors.primary.withOpacity(appBarOpacity ?? 1.0);
        case FlexAppBarStyle.material:
          effectiveAppBarColor =
              FlexColor.materialLightSurface.withOpacity(appBarOpacity ?? 1.0);
        case FlexAppBarStyle.surface:
          effectiveAppBarColor =
              effectiveSurfaceColor.withOpacity(appBarOpacity ?? 1.0);
        case FlexAppBarStyle.background:
          effectiveAppBarColor =
              effectiveBackgroundColor.withOpacity(appBarOpacity ?? 1.0);
        case FlexAppBarStyle.scaffoldBackground:
          effectiveAppBarColor =
              effectiveScaffoldColor.withOpacity(appBarOpacity ?? 1.0);
        case FlexAppBarStyle.custom:
          effectiveAppBarColor =
              effectiveColors.appBarColor?.withOpacity(appBarOpacity ?? 1.0) ??
                  effectiveColors.primary.withOpacity(appBarOpacity ?? 1.0);
        case null:
          // Style was null, if Opacity used, apply to use M2/M3 mode default.
          if (appBarOpacity != null && appBarOpacity != 1.0) {
            effectiveAppBarColor = useMaterial3
                ? effectiveSurfaceColor.withOpacity(appBarOpacity)
                : effectiveColors.primary.withOpacity(appBarOpacity);
          }
      }
    }
    // The resulting effectiveAppBarColor may remain null if default values
    // are used, this used to avoid creating any AppBar theme in M3 mode if
    // using no sub-theme and only default FCS.light direct AppBar properties.

    return FlexColorScheme(
      colorScheme: effectiveColorScheme,
      // This is the light theme factory so we always set brightness to light.
      brightness: Brightness.light,
      // Primary colors for the application
      primary: effectiveColors.primary,
      primaryContainer: effectiveColors.primaryContainer,
      // The secondary colors for the application.
      secondary: effectiveColors.secondary,
      secondaryContainer: effectiveColors.secondaryContainer,
      // The tertiary colors for the application.
      tertiary: effectiveColors.tertiary,
      tertiaryContainer: effectiveColors.tertiaryContainer,
      // Surface is used e.g. by Card and bottom appbar.
      surface: effectiveSurfaceColor,
      // Background is used e.g. by drawer and bottom nav bar.
      background: effectiveBackgroundColor,
      // Color of the scaffold background.
      scaffoldBackground: effectiveScaffoldColor,
      // Color of dialog background elements, a passed in dialogBackground
      // color will override the factory style, if provided.
      dialogBackground: effectiveDialogBackground,
      // Set app bar background to effective background color.
      appBarBackground: effectiveAppBarColor,
      // Effective error color and null fallback.
      error: useMaterial3ErrorColors && !seed.useKeyColors
          ? FlexColor.material3LightError
          : effectiveColors.error ?? FlexColor.materialLightError,
      onPrimary: onColors.onPrimary,
      onPrimaryContainer: onColors.onPrimaryContainer,
      onSecondary: onColors.onSecondary,
      onSecondaryContainer: onColors.onSecondaryContainer,
      onTertiary: onColors.onTertiary,
      onTertiaryContainer: onColors.onTertiaryContainer,
      onSurface: onColors.onSurface,
      onBackground: onColors.onBackground,
      onError: useMaterial3ErrorColors && !seed.useKeyColors
          ? FlexColor.material3LightOnError
          : onColors.onError,
      surfaceTint: surfaceTint,
      tabBarStyle: tabBarStyle,
      appBarElevation: appBarElevation,
      bottomAppBarElevation: bottomAppBarElevation,
      tooltipsMatchBackground: tooltipsMatchBackground,
      transparentStatusBar: transparentStatusBar,
      visualDensity: visualDensity,
      textTheme: textTheme,
      primaryTextTheme: primaryTextTheme,
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
      package: package,
      materialTapTargetSize: materialTapTargetSize,
      pageTransitionsTheme: pageTransitionsTheme,
      platform: platform,
      typography: typography,
      applyElevationOverlayColor: applyElevationOverlayColor,
      subThemesData: subThemesData,
      useMaterial3: useMaterial3,
      extensions: extensions,
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
  ///
  /// To activate using opinionated sub themes that further refines the produced
  /// theme, pass in a [FlexSubThemesData] to [subThemesData], and define more
  /// shortcut properties to setup additional features in the sub-themes.
  ///
  /// Material 3 guide introduces a new color system with key colors and tonal
  /// palettes, see
  /// https://m3.material.io/styles/color/the-color-system/key-colors-tones.
  ///
  /// You can opt-in on using this new M3 color system by creating your tonal
  /// theme colors using the effective [primary], [secondary] and [tertiary]
  /// colors in the factory, as key colors to create tonal palettes for
  /// these main Material 3 color palettes.
  /// Colors from these key color seed generated palettes will then be used as
  /// color tones for the produce [ColorScheme], as defined by the Material 3
  /// design guide. By studying the Flutter SDK [ColorScheme.from] factory you
  /// can see which color tone from what key color is used where.
  /// [FlexColorScheme] uses the same assignments for the tones to the
  /// generated [ColorScheme] when you opt in using Material 3 tonal palettes.
  ///
  /// The [FlexColorScheme] light and dark factory offer more control over the
  /// seed generation setup. With [ColorScheme.fromSeed] you can only generate
  /// the [ColorScheme] from one key color, the primary color. With
  /// [FlexColorScheme] factories  you can use separate key colors for
  /// [secondary] and [tertiary] from the [primary] color, to make their
  /// tonal palettes. The effective colors in your [FlexColorScheme] for these
  /// color properties are used as key color inputs when you provide a
  /// [FlexKeyColors] via [keyColors] and enable it by setting
  /// [FlexKeyColors.useKeyColors] to true, which it is in its default
  /// constructor, so to enable it you can just pass in a default
  /// FlexKeyColors() to [keyColors].
  ///
  /// By setting [FlexKeyColors.useSecondary] or
  /// [FlexKeyColors.useTertiary] to false, the corresponding effective colors
  /// in [FlexColorScheme] will not be used as keys for corresponding
  /// [TonalPalette]. If one is off, its tonal palette will instead be based on
  /// the primary color as key. If both are false, the [FlexColorScheme.light]
  /// seeding algorithm becomes the same as using [ColorScheme.from]. The
  /// primary color is always used as seed color when key color seeding is
  /// enabled with [FlexKeyColors.useKeyColors] set to true.
  ///
  /// You can also opt to keep selected effective main colors, primary,
  /// secondary, tertiary and their containers, in your [FlexColorScheme] as
  /// their effective color, even when you enable key color based
  /// seeded tonal palette based ColorScheme output. You do this by
  /// setting [FlexKeyColors.keepPrimary], [FlexKeyColors.keepSecondary] etc to
  /// true, for each color property where you want to keep its exact color value
  /// as defined, but otherwise may be OK with using key seeded color values.
  ///
  /// You can use this feature if you for example want to use an exact
  /// predefined primary brand color in light mode, but are OK with all other
  /// colors using tones derived from its Material 3 tonal palette.
  ///
  /// When you use key color based seeded theme generation, the used key inputs
  /// for primary, secondary and tertiary are only used to set and generate the
  /// tone of the palette used for each colors tonal palette. You will rarely
  /// see the same color on that actual, primary, secondary and tertiary color
  /// in the produced [ColorScheme], unless you lock them down with the "keep"
  /// properties.
  ///
  /// The same tonal palette should typically be used for both
  /// light and dark mode colors. Under the hood [FlexColorScheme] selects the
  /// right color tone from the tonal palette, which is different for light and
  /// dark mode. For a matched light and dark theme, you should use the same
  /// input key color. When you use [FlexColorScheme.light] and
  /// [FlexColorScheme.dark] and the [FlexScheme] enum based [scheme] property,
  /// to use a built-in color scheme, it automatically uses also its
  /// predefined light theme mode defined colors as the key colors for
  /// primary, secondary and tertiary in dark mode, to ensure that the produced
  /// [ColorScheme] is using same tonal palette, but only different tones from
  /// it  for light and dark mode.
  ///
  /// When you use [colors], [colorScheme] or direct override color properties
  /// [primary], [secondary] or [tertiary] in the factories, these effective
  /// colors are used directly as key color inputs. It is then up to
  /// you to decide and design if you use the same key color for tonal palette
  /// generation in light and dark mode.
  ///
  /// If you use [colorScheme] or pass in [primary], [secondary] or
  /// [tertiary], and enable using [keyColors] the generated scheme will first
  /// use color from passed in direct color properties [primary], [secondary]
  /// or [tertiary], as key colors, then the same ones from the passed in
  /// [colorScheme] when it generates the output [ColorScheme] using the active
  /// [FlexKeyColors] setup.
  ///
  /// The generated [ColorScheme]'s properties will override all color
  /// properties that were passed in  via a [colorScheme], except those locked
  /// via the `keep` properties in [FlexKeyColors].
  ///
  /// If you assign override colors via direct color properties for the main
  /// colors [primary], [secondary] or [tertiary] and their containers, they
  /// will also only override the generated resulting [ColorScheme] if the
  /// the `keep` properties are set in [FlexKeyColors]. Other color properties
  /// that exist as both direct color properties and as a color in the
  /// generated resulting [ColorScheme], will be overridden by the generated
  /// colors scheme colors.
  ///
  /// Normally if you provide an entire [colorScheme] to [FlexColorScheme] it
  /// is typically because you already have a scheme that you want to use as is,
  /// then don't enable [keyColors] or any blends. It is however possible to
  /// apply both blends to passed in [colorScheme] surfaces or to just use
  /// the [primary], [secondary] or [tertiary] colors in passed in [colorScheme]
  /// as [keyColors] to generate an entirely new [ColorScheme] from the passed
  /// in colors, using [primary], [secondary] or [tertiary] as keys.
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
    /// capabilities.
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
    /// If you define a [surfaceMode] and set [blendLevel] > 0, then [surface],
    /// [surfaceVariant], [background] and [inverseSurface] colors in the
    /// provided [colorScheme] will be overridden by the computed color branded
    /// surfaces. If your [colorScheme] already contains branded surface colors,
    /// then keep [blendLevel] = 0 to continue using them.
    ///
    /// If you use [darkIsTrueBlack] factory feature, it will also override your
    /// [colorScheme] based mentioned color properties above and make them
    /// 5% darker.
    ///
    /// If you opt in on using sub themes and have set
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

    /// The selection of the six main scheme colors to be used when creating
    /// effective [ColorScheme].
    ///
    /// This is a convenience property that allows you to vary which colors to
    /// use of the primary, secondary and tertiary colors and their container
    /// colors when FlexSchemeColor creates its effective [ColorScheme] from
    /// the input colors. The integer number corresponds to using:
    ///
    /// * 1 = Only the primary color
    /// * 2 = Primary & Secondary colors
    /// * 3 = Primary + container & Secondary colors
    /// * 4 = Primary + container & Secondary + container
    /// * 5 = Primary + container & Secondary + container & tertiary colors
    /// * 6 = Primary + container & Secondary + container & tertiary + container
    /// * 7 = Primary, Secondary and tertiary, container colors computed.
    ///
    /// By default the value is 6 and all main scheme colors in
    /// `FlexSchemeColor` are used.
    ///
    /// The integer value is not a very obvious property to use to configure
    /// this feature. Future version may improve it. However with the Themes
    /// Playground you don't have to remember what number does what.
    ///
    /// When the value is 1, the result is the same as if we would have
    /// created the colors with [FlexSchemeColor.from] by only giving it the
    /// required primary color. With 2, it is equivalent to as if we would have
    /// given it only the primary and secondary colors, and so on.
    /// This property makes it possible to simulate and change the resulting
    /// [FlexColorScheme] to as if you would have specified 1, 2, 3 ... 7 of
    /// the color selection. If your used [FlexColorScheme] `colors` was
    /// actually created with [FlexSchemeColor.from] with only the primary
    /// color defined, then changing the value from 7 ... 3, 2 or 1, will
    /// all produce the same effective scheme as the computed values will be
    /// the same as the [FlexSchemeColor.from] is using to compute any main
    /// missing scheme color values.
    final int usedColors = 6,

    /// Blends theme colors into surfaces and backgrounds.
    ///
    /// If defined, used mode overrides the older [surfaceStyle]
    /// property setting. Prefer using [surfaceMode] over [surfaceStyle],
    /// it offers more color branded surface modes and separate control over
    /// the used branding level via the separate [blendLevel] property.
    ///
    /// The mode [FlexSurfaceMode.highBackgroundLowScaffold] can be used to
    /// replace the style that was produced when using old and removed
    /// `FlexColorScheme.surfaceStyle` enum property `FlexSurface` in
    /// [FlexColorScheme.light] and [FlexColorScheme.dark] before version 4.
    ///
    /// The mode [FlexSurfaceMode.highBackgroundLowScaffold] uses the same
    /// design concept as the only style offered via removed `FlexSurface`
    /// in `FlexColorScheme.surfaceStyle` that was in use before version 4,
    /// and deprecated in version 4.2 and removed in version 5.0.0.
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
    ///
    /// Defaults to using [FlexSurfaceMode.highScaffoldLowSurfaces] when
    /// [blendLevel] > 0.
    final FlexSurfaceMode? surfaceMode,

    /// Sets the blend level strength used by the surface mode.
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
    /// Defaults to null, which when [useMaterial3] is false results in
    /// [FlexAppBarStyle.material] which produces the same results
    /// as a Flutter standard M2 dark [ThemeData.from] by tying the app bar
    /// color to the M2 dark Material color. If [useMaterial3] is true it
    /// defaults [FlexAppBarStyle.surface] which is the same as M3 default.
    final FlexAppBarStyle? appBarStyle,

    /// Themed [AppBar] opacity.
    ///
    /// The opacity is applied to the effective AppBar color, which may be from
    /// used [appBarStyle], that gets its color selection from used [scheme]
    /// or [colors]. Or that color may have been overridden by AppBar sub-theme
    /// and there selected [SchemeColor] based color.
    /// Lastly and with highest priority it may be from here directly supplied
    /// [appBarBackground] color.
    ///
    /// A useful opacity range is from 0.85 to 0.95 when using the [Scaffold]
    /// property [extendBodyBehindAppBar] set to true, to partially show
    /// scrolling content behind the app bar. To use more opacity, in a way
    /// that the AppBar does not become too transparent, you also need to blur
    /// the background to create a frosted glass effect. This cannot
    /// be made with only theming, you need a custom AppBar Widget for that.
    /// Frosted glass UI effect is thus beyond the scope of what
    /// FlexColorScheme can do alone as it only affects ThemeData.
    ///
    /// If null, defaults to 1, fully opaque, no transparency.
    /// If not null, must be from 0 to 1.
    final double? appBarOpacity,

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
    ///
    /// In standard Material 2 this would be false, FCS uses an opinionated
    /// style and sets it true. In Material 3 the style you get when setting
    /// this to true is used by default. In M3 mode FCS will thus not create
    /// an AppBar sub theme to adjust this,if it is true and it is not needed
    /// for any other direct AppBar impacting properties in FlexColorScheme
    /// constructor. In M2 mode an AppBar theme will always be created, also
    /// when not opting in on the actual sub-themes feature, this per its
    /// opinionated and legacy styling for M2 mode.
    final bool transparentStatusBar = true,

    /// The themed elevation for the [AppBar].
    ///
    /// If not defined, defaults to 0 in M2 (FCS opinionated) and to 0 in (M3
    /// spec default).
    ///
    /// The FCS 0dp elevation in M2 is an iOS style influenced opinionated
    /// choice, it can easily be adjusted for the theme with this property.
    final double? appBarElevation,

    /// The themed elevation for the [BottomAppBar].
    ///
    /// If undefined (null), defaults to 3 in M3 mode and to 8 in M2 mode,
    /// both via the defaults for the respective theme mode from Flutter's
    /// default elevation behavior of [BottomAppBar].
    final double? bottomAppBarElevation,

    /// Select preferred style for the default [TabBarTheme].
    ///
    /// By default the TabBarTheme is made to fit with the style of the AppBar.
    /// In M2 mode that is done by defaulting to using
    /// [FlexTabBarStyle.forAppBar] if not defined. In M3 mode it done by
    /// defaulting to using [FlexTabBarStyle.flutterDefault].
    ///
    /// When setting this to [FlexTabBarStyle.forBackground], it will default
    /// to a theme that uses the color scheme and fits on background color,
    /// which typically also on works surface and scaffoldBackground color.
    /// This TabBarTheme style is useful if you primarily intended to use the
    /// TabBar in a Scaffold, Dialog, Drawer or Side panel on their background
    /// colors.
    final FlexTabBarStyle? tabBarStyle,

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

    /// A color used for elements needing less emphasis than [primary].
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
    final Color? primaryContainer,

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

    /// A color used for elements needing less emphasis than [secondary].
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
    final Color? secondaryContainer,

    /// A color used as a contrasting accent that can balance [primary]
    /// and [secondary] colors or bring heightened attention to an element,
    /// such as an input field.
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
    final Color? tertiary,

    /// A color used for elements needing less emphasis than [tertiary].
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
    final Color? tertiaryContainer,

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
    /// The color is applied to [ThemeData.dialogBackgroundColor]. It cannot be
    /// controlled separately with only a [ThemeData.from] a color scheme.
    ///
    /// When using sub-themes, it is also applied to backgroundColor in
    /// dialog themes, but only if [subThemesData.dialogBackgroundSchemeColor]
    /// has not be defined in [subThemesData].
    ///
    /// * DatePickerThemeData
    /// * DialogTheme
    /// * TimePickerThemeData
    ///
    /// If no value is given, and no [subThemesData.dialogBackgroundSchemeColor]
    /// is defined, default color is [surface].
    final Color? dialogBackground,

    /// Background theme color for the [AppBar].
    ///
    /// When using the factory this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] [colors] or for this color defined when using a
    /// pre-defined color scheme based on [FlexScheme] `scheme` property and
    /// the [FlexAppBarStyle] [appBarStyle] property.
    ///
    /// Thus custom color will also override any scheme color based selection
    /// for the [AppBAr] in active used sub-themes.
    final Color? appBarBackground,

    /// A color that is clearly legible when drawn on [primary] color.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// [primary] and [onPrimary] is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// When using this factory, this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] [colors] property or when using pre-defined color
    /// scheme based [FlexScheme] and its [scheme] property, including any
    /// used blend logic. If a [colorScheme] was provided with this
    /// corresponding color defined, this color property will override the
    /// same color in it as well.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the factory behavior.
    final Color? onPrimary,

    /// A color that's clearly legible when drawn on [primaryContainer.
    ///
    /// To ensure that an app is accessible, a contrast ratio between
    /// [primaryContainer] and [onPrimaryContainer] of at least 4.5:1
    /// is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// When using this factory, this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] [colors] property or when using pre-defined color
    /// scheme based [FlexScheme] and its [scheme] property, including any
    /// used blend logic. If a [colorScheme] was provided with this
    /// corresponding color defined, this color property will override the
    /// same color in it as well.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the factory behavior.
    final Color? onPrimaryContainer,

    /// A color that is clearly legible when drawn on [secondary] color.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// [secondary] and [onSecondary] is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// When using this factory, this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] [colors] property or when using pre-defined color
    /// scheme based [FlexScheme] and its [scheme] property, including any
    /// used blend logic. If a [colorScheme] was provided with this
    /// corresponding color defined, this color property will override the
    /// same color in it as well.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the factory behavior.
    final Color? onSecondary,

    /// A color that's clearly legible when drawn on [secondaryContainer].
    ///
    /// To ensure that an app is accessible, a contrast ratio between
    /// [secondaryContainer] and [onSecondaryContainer] of at least 4.5:1
    /// is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// When using this factory, this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] [colors] property or when using pre-defined color
    /// scheme based [FlexScheme] and its [scheme] property, including any
    /// used blend logic. If a [colorScheme] was provided with this
    /// corresponding color defined, this color property will override the
    /// same color in it as well.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the factory behavior.
    final Color? onSecondaryContainer,

    /// A color that's clearly legible when drawn on [tertiary].
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// [secondary] and [onSecondary] is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// When using this factory, this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] [colors] property or when using pre-defined color
    /// scheme based [FlexScheme] and its [scheme] property, including any
    /// used blend logic. If a [colorScheme] was provided with this
    /// corresponding color defined, this color property will override the
    /// same color in it as well.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the factory behavior.
    final Color? onTertiary,

    /// A color that's clearly legible when drawn on [tertiaryContainer].
    ///
    /// To ensure that an app is accessible, a contrast ratio between
    /// [secondaryContainer] and [onSecondaryContainer] of at least 4.5:1
    /// is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// When using this factory, this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] [colors] property or when using pre-defined color
    /// scheme based [FlexScheme] and its [scheme] property, including any
    /// used blend logic. If a [colorScheme] was provided with this
    /// corresponding color defined, this color property will override the
    /// same color in it as well.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the factory behavior.
    final Color? onTertiaryContainer,

    /// A color that is clearly legible when drawn on [surface] color.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// [surface] and [onSurface] is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// When using this factory, this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] [colors] property or when using pre-defined color
    /// scheme based [FlexScheme] and its [scheme] property, including any
    /// used blend logic. If a [colorScheme] was provided with this
    /// corresponding color defined, this color property will override the
    /// same color in it as well.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the factory behavior.
    final Color? onSurface,

    /// A color that is clearly legible when drawn on [background] color.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// [background] and [onBackground] is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// When using this factory, this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] [colors] property or when using pre-defined color
    /// scheme based [FlexScheme] and its [scheme] property, including any
    /// used blend logic. If a [colorScheme] was provided with this
    /// corresponding color defined, this color property will override the
    /// same color in it as well.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the factory behavior.
    final Color? onBackground,

    /// A color that is clearly legible when drawn on [error] color.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// [error] and [onError] is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// When using this factory, this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] [colors] property or when using pre-defined color
    /// scheme based [FlexScheme] and its [scheme] property, including any
    /// used blend logic. If a [colorScheme] was provided with this
    /// corresponding color defined, this color property will override the
    /// same color in it as well.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the factory behavior.
    final Color? onError,

    /// A custom color used as an overlay on a surface color to indicate a
    /// component's elevation and surface color branding or tinting.
    ///
    /// If a [colorScheme] was provided where this corresponding color is
    /// defined, this color property will override the same color in it.
    ///
    /// This color is used by Material 3 for colored elevation, it is also used
    /// as the blend color for FlexColorScheme surface blends. Additionally
    /// this color is if provided used as key color for seeding
    /// the neutral color palettes, when seed generated color schemes are used.
    /// It is important that all these properties use the same color.
    ///
    /// Typically this color is not customized, most designs use the default
    /// where the theme primary color is used for slightly mixing it into the
    /// neutral background and surface colors, when seeding is used. As well as
    /// using it for the the elevation tint in Material 3, plus for the
    /// surface blends that can optionally be added with FlexColorScheme.
    ///
    /// If undefined, [primary] color is used.
    final Color? surfaceTint,

    /// Makes the dark theme backgrounds darker or even black.
    ///
    /// Scaffold background will become fully black, and other surfaces also get
    /// darker (8%), if using low blend levels they may become fully black too.
    final bool darkIsTrueBlack = false,

    /// When true, the primary and primary container colors will be swapped with
    /// their secondary counterparts.
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

    /// When set to true, tooltip background color will match the brightness of
    /// the theme's background color.
    ///
    /// By default Flutter's Material tooltips use a theme where the tooltip
    /// background color brightness is inverted in relation to the overall
    /// theme's background color.
    ///
    /// [FlexColorScheme] allows you to use a single toggle to invert this.
    /// Light tooltips on light background is e.g. the default style on
    /// Windows Desktop toggle. You can use this toggle to use this style,
    /// or use it as a means to create a platform adaptive tooltip style, where
    /// the Material and Flutter style is used on devices and Web, but the
    /// inverted scheme is used on e.g. Windows platform.
    ///
    /// Defaults to false, and uses same background style as Material Design
    /// guide and Flutter.
    ///
    /// Additional tooltip styles when NOT opting in on FlexColorScheme sub
    /// themes are:
    ///
    /// - tooltipsMatchBackground: false
    ///   - none
    ///
    /// - tooltipsMatchBackground: true
    ///   - light theme:
    ///     - background: Color(0xF0FCFCFC),
    ///     - text: black
    ///   - Dark theme:
    ///     - background: Color(0xED444444),
    ///     - text: white
    ///   - Border radius: 4 dp
    ///   - Border: Yes, dividerColor
    ///   - Desktop OS (macOS, Linux, Windows)
    ///     - Font size : 12 dp
    ///   - Mobile OS (iOS, Android, Fuchsia)
    ///     - Font size : 14 dp
    ///
    /// Additional styles when opting in on FlexColorScheme sub themes are:
    ///
    /// - Desktop OS (macOS, Linux, Windows)
    ///   - Font size : 12 dp
    /// - Mobile OS (iOS, Android, Fuchsia)
    ///   - Font size : 14 dp
    /// - Border radius: 8 dp
    /// - Border: Yes, dividerColor
    /// - tooltipsMatchBackground: false
    ///   - light theme:
    ///     - background: Color(0xFF111111).blendAlpha(primary, 45%) opacity 95%
    ///     - text: white
    ///   - Dark theme:
    ///     - background: Color(0xFFFFFFFF).blendAlpha(primary, 39%) opacity 95%
    ///     - text: black
    /// - tooltipsMatchBackground: true
    ///   - light theme:
    ///     - background:  Color(0xFFFFFFFF).blendAlpha(primary, 4%) opacity 95%
    ///     - text: black
    ///   - Dark theme:
    ///     - background: Color(0xFF111111).blendAlpha(primary, 16%) opacity 95%
    ///     - text: white
    ///
    /// When using additional theming via sub-themes properties, its
    /// properties will if used override background color, text color and
    /// background opacity as well as border radius.
    final bool tooltipsMatchBackground = false,

    /// Activate using FlexColorScheme opinionated component sub-themes by
    /// passing in a default `FlexSubThemesData()`.
    ///
    /// To further configure the sub-themes, change the simple flat value
    /// properties as desired in `FlexSubThemesData()`.
    ///
    /// By default [FlexThemeData.light], [FlexThemeData.dark] and
    /// [FlexColorScheme.toTheme], do as little as they need to just
    /// provide a consistent Material 2 color schemed theme. The additions they
    /// do are described in [FlexColorScheme.toTheme].
    ///
    /// The original purpose of the opinionated sub-themes was to make it easy
    /// to add themed corner radius to all Widgets that support it, and to
    /// provide a consistent look on all buttons, including [ToggleButtons].
    ///
    /// Therefore the sub themes are a convenient way to opt-in on customized
    /// corner radius on Widgets using above themes. By opting in you can set
    /// corner radius for all covered Widgets to same corner radius in one go.
    /// There are also properties to override the global default for each widget
    /// to set different rounding per widget if so desired.
    ///
    /// By default, if a `defaultRadius` is not specified, each widgets corner
    /// radius and some other styling take inspiration from the Material 3 (M3)
    /// specification https://m3.material.io/ and uses its specifications as
    /// defaults when it is possible to do so in Flutter SDK theming when using
    /// Material2 mode and via defaults also in Material 3 mode.
    ///
    /// Starting from version 5, by opting in via a default [subThemesData] you
    /// get an extensive set of widget component sub themes applied.
    /// They can be customized via the [subThemesData] property, that has
    /// quick and flat sub theme configuration values in the data class
    /// [FlexSubThemesData].
    ///
    /// Customizable sub-themes are available for:
    ///
    /// * [AppBarTheme] for [AppBar] via [FlexSubThemes.appBarTheme].
    /// * [BottomAppBarTheme] for [BottomAppBar] via
    ///   [FlexSubThemes.bottomAppBarTheme].
    /// * [BottomNavigationBarThemeData] for [BottomNavigationBar] via
    ///   [FlexSubThemes.bottomNavigationBar].
    /// * [BottomSheetThemeData] for [BottomSheet] via
    ///   [FlexSubThemes.bottomSheetTheme].
    /// * [ButtonThemeData] for old deprecated buttons, via
    ///   [FlexSubThemes.buttonTheme].
    /// * [CardTheme] for [Card] via [FlexSubThemes.cardTheme].
    /// * [CheckboxThemeData] for [Checkbox] via [FlexSubThemes.checkboxTheme].
    /// * [ChipThemeData] for [Chip] via [FlexSubThemes.chipTheme].
    /// * [DatePickerThemeData] for [DatePicker] via
    ///   [FlexSubThemes.datePickerTheme].
    /// * [DialogTheme] for [Dialog] via [FlexSubThemes.dialogTheme].
    /// * [DrawerThemeData] for [Drawer] via [FlexSubThemes.drawerTheme].
    /// * [DropdownMenuThemeData] for [DropDownMenu] via
    ///   [FlexSubThemes.dropdownMenuTheme].
    /// * [ElevatedButtonThemeData] for [ElevatedButton] via
    ///   [FlexSubThemes.elevatedButtonTheme].
    /// * [FilledButtonThemeData] for [FilledButton] via
    ///   [FlexSubThemes.filledButtonTheme].
    /// * [FloatingActionButtonThemeData] for [FloatingActionButton] via
    ///   [FlexSubThemes.floatingActionButtonTheme].
    /// * [IconButtonThemeData] for [IconButton] via
    ///   [FlexSubThemes.iconButtonTheme].
    /// * [InputDecorationTheme] for [InputDecoration] via
    ///   [FlexSubThemes.inputDecorationTheme].
    /// * [MenuBarThemeData] for [MenuBar] via [FlexSubThemes.menuBarTheme].
    /// * [MenuButtonThemeData] for [MenuButton] via
    ///   [FlexSubThemes.menuButtonTheme].
    /// * [MenuThemeData] for [MenuBar], [MenuAnchor] and [DropDownMenu] via
    ///   [FlexSubThemes.menuTheme].
    /// * [ListTileThemeData] for [ListTile] via
    ///   [FlexSubThemes.listTileTheme].
    /// * [NavigationBarThemeData] for [NavigationBar] via
    ///   [FlexSubThemes.navigationBarTheme].
    /// * [NavigationDrawerThemeData] for [NavigationDrawer] via
    ///   [FlexSubThemes.navigationDrawerTheme].
    /// * [NavigationRailThemeData] for [NavigationRail] via
    ///   [FlexSubThemes.navigationRailTheme].
    /// * [OutlinedButtonThemeData] for [OutlinedButton] via
    ///   [FlexSubThemes.outlinedButtonTheme].
    /// * [PopupMenuThemeData] for [PopupMenuButton] via
    ///   [FlexSubThemes.popupMenuTheme].
    /// * [RadioThemeData] for [Radio] via [FlexSubThemes.radioTheme].
    /// * [SliderThemeData] for [Slider] via [FlexSubThemes.sliderTheme].
    /// * [SnackBarThemeData] for [SnackBar] via [FlexSubThemes.snackBarTheme].
    /// * [SwitchThemeData] for [Switch] via [FlexSubThemes.switchTheme].
    /// * [TabBarTheme] for [TabBar] via [FlexSubThemes.tabBarTheme].
    /// * [TextButtonThemeData] for [TextButton] via
    ///   [FlexSubThemes.textButtonTheme].
    /// * [TimePickerThemeData] for [TimePickerDialog] via
    ///   [FlexSubThemes.timePickerTheme].
    /// * [ToggleButtonsThemeData] for [ToggleButtons] via
    ///   [FlexSubThemes.toggleButtonsTheme].
    /// * [TooltipThemeData] for [Tooltip] via [FlexSubThemes.tooltipTheme].
    ///
    /// Defaults to null, resulting in FlexColorScheme not using any extra
    /// sub-theming in addition to those described in [FlexColorScheme.toTheme].
    final FlexSubThemesData? subThemesData,

    /// To use and activate Material 3 color system based [ColorScheme]
    /// defined via key colors for primary, secondary and tertiary colors and
    /// the [TonalPalette] generated by these key color values, pass
    /// in a [FlexKeyColors] to [keyColors].
    ///
    /// By default it is not defined (null), and a traditional manually
    /// configured color scheme will be created based on input property values
    /// or a passed in [colorScheme].
    ///
    /// If a [FlexKeyColors] instance is passed in, the key color seeding
    /// behavior depends on properties defined in the [FlexKeyColors]
    /// instance. The default constructor makes one where
    /// [FlexKyColors.useKeyColors] is true, it will automatically enable usage
    /// of the used light scheme's primary color as key color and to seed
    /// generated a color scheme. The result will by default be equal to using
    /// Flutter SDK `ColorScheme.fromSeed`. With `FlexKeyColors` you can also
    /// use `secondary` and `tertiary` colors as key colors. Currently Flutter
    /// SDK does not support this.
    ///
    /// For more information on Material 3 color system and usage of key colors
    /// to generate tonal palettes and tones, see:
    /// https://m3.material.io/styles/color/the-color-system/key-colors-tones
    final FlexKeyColors? keyColors,

    /// Set to true, to use the new Material 3 error colors.
    ///
    /// If [useMaterial3ErrorColors] is false, the generated [ColorScheme]
    /// and [ThemeData] will use Material 2 default error colors or
    /// error colors as defined by the built in color schemes. Thus using same
    /// error colors as in FlexColorScheme versions before version 5.
    ///
    /// If [useMaterial3ErrorColors] is true, the resulting [ColorScheme]
    /// and [ThemeData] will use the Material 3 design guide error colors.
    ///
    /// Key color seed generated [ColorScheme]s always use the Material 3
    /// design guide error colors, or error colors from its customized
    /// [TonalPalette] generation setup.
    final bool useMaterial3ErrorColors = false,

    /// A configuration class enabling complete customization of
    /// used chroma for [TonalPalette] generation for the used seed [keyColors],
    /// as well as changing which tone in the tonal palettes is used
    /// for which [ColorScheme] color.
    ///
    /// By default a `FlexTones` configuration `FlexTones.material` that
    /// matches what Flutter SDK does with `ColorScheme.fromSeed` is used.
    ///
    /// There are six other built-in definitions that you can use, they can also
    /// serve as an example of how you can make custom `FlexTones`
    /// configurations.
    final FlexTones? tones,

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

    /// Text with a color that contrasts with background, surface, card and
    /// canvas colors.
    ///
    /// If a default `TextTheme` from package GoogleFonts is passed.
    /// FlexColorScheme will detect this and make the color in the passed
    /// in `GoogleFonts` null for all its `TextStyle`s so that the correct
    /// color for M2/M3 mode and contrast for light/dark mode is used.
    final TextTheme? textTheme,

    /// A text theme that contrasts with the primary color.
    ///
    /// If a default `TextTheme` from package GoogleFonts is passed.
    /// FlexColorScheme will detect this and make the color in the passed
    /// in `GoogleFonts` null for all its `TextStyle`s so that the correct
    /// color for M2/M3 mode and contrast for primary color is used.
    final TextTheme? primaryTextTheme,

    /// Name of the font family to use as default font for the text theme in
    /// created theme.
    ///
    /// Same feature as in [ThemeData] factory. Used to apply the font family
    /// name to default text theme and primary text theme, also passed along
    /// to [ThemeData],
    final String? fontFamily,

    /// Name of the font families to use as fallback to main font family.
    ///
    /// Same feature as in [ThemeData] factory. Used to apply the font family
    /// fallback to default text theme and primary text theme, also passed
    /// along to [ThemeData],
    final List<String>? fontFamilyFallback,

    /// Name of the font package to use with font fallback.
    ///
    /// Same feature as in [ThemeData] factory. Used to apply the font package
    /// to default text theme and primary text theme, also passed along
    /// to [ThemeData],
    final String? package,

    /// Configures the hit test size of certain Material widgets.
    ///
    /// Defaults to a [platform]-appropriate size: MaterialTapTargetSize.padded
    /// on mobile platforms, MaterialTapTargetSize.shrinkWrap on desktop
    /// platforms.
    final MaterialTapTargetSize? materialTapTargetSize,

    /// Default [MaterialPageRoute] transitions per [TargetPlatform].
    ///
    /// [MaterialPageRoute.buildTransitions] delegates to a [platform] specific
    /// [PageTransitionsBuilder]. If a matching builder is not found, a builder
    /// whose platform is null is used.
    ///
    /// This is convenience pass through in FlexColorScheme to avoid a
    /// `copyWith` on `ThemeData` produced by FlexColorScheme.
    final PageTransitionsTheme? pageTransitionsTheme,

    /// The platform adaptive widgets adapt to defined target and mechanics,
    /// like scrolling too.
    ///
    /// Same property as in [ThemeData] factory. Included for convenience to
    /// avoid a copyWith to change it.
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
    ///
    /// When developing applications you can use this property to dynamically
    /// in the application change the used platform and partially test and see
    /// how adaptive widgets and scroll looks and feels on other platforms.
    final TargetPlatform? platform,

    /// The color and geometry [TextTheme] values used to configure [textTheme].
    ///
    /// Same property as in [ThemeData] factory.
    /// Included for convenience to avoid a copyWith if it needs to be changed.
    /// Default value deviates from the Flutter standard that uses the old
    /// [Typography.material2014], in favor of newer [Typography.material2018]
    /// as default typography if one is not provided.
    ///
    /// In M3 mode FCS default to [Typography.material2021] and in M2 mode to
    /// older [Typography.material2018], which is correct for M2. Please note
    /// that Flutter ThemeData defaults to even older Typography
    /// [Typography.material2014] when not using M3. This is done for legacy
    /// compatibility reasons, you should use 2018 with M2.
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

    /// A temporary flag used to opt-in to new SDK Material 3 features.
    ///
    /// Flutter SDK [useMaterial3] documentation:
    /// --------------------------------------------------------
    /// If true, then widgets that have been migrated to Material 3 will
    /// use new colors, typography and other features of Material 3. If false,
    /// they will use the Material 2 look and feel.
    ///
    /// During the migration to Material 3, turning this on may yield
    /// inconsistent look and feel in your app as some widgets are migrated
    /// while others have yet to be.
    ///
    /// Defaults to false. When the Material 3 specification is complete
    /// and all widgets are migrated on stable, we will change this flag to be
    /// true by default. After that change has landed on stable, we will
    /// deprecate this flag and remove all uses of it. At that point, the
    /// `material` library will aim to only support Material 3.
    ///
    /// ## Defaults
    /// If a [ThemeData] is constructed with [useMaterial3] set to true, then
    /// some properties will get updated defaults. Please note that
    /// [ThemeData.copyWith] with [useMaterial3] set to true will
    /// not change any of these properties in the resulting [ThemeData].
    ///
    /// <style>table,td,th { border-collapse: collapse; padding: 0.45em; } td { border: 1px solid }</style>
    ///
    /// | Property        | M3 default                 | M2 default           |
    /// | :-------------- | :------------------------- | :------------------- |
    /// | [colorScheme]   | M3 baseline scheme         | M2 baseline scheme |
    /// | [typography]  | [Typography.material2021]| [Typography.material2014] |
    /// | [splashFactory] | [InkSparkle]* or [InkRipple] | [InkSplash]         |
    ///
    /// \* if the target platform is Android and the app is not
    /// running on the web, otherwise it will fallback to [InkRipple].
    ///
    /// If [brightness] is [Brightness.dark] then the default color scheme will
    /// be either the M3 baseline dark color scheme or the M2 baseline dark
    /// color scheme depending on [useMaterial3].
    ///
    /// ## Affected widgets
    ///
    /// This flag affects styles and components.
    ///
    /// ### Styles
    ///   * Color: [ColorScheme], [Material] (see table above)
    ///   * Shape: (see components below)
    ///   * Typography: [Typography] (see table above)
    ///
    /// ### Components
    ///   * Badges: [Badge]
    ///   * Bottom app bar: [BottomAppBar]
    ///   * Bottom sheets: [BottomSheet]
    ///   * Buttons
    ///     - Common buttons: [ElevatedButton], [FilledButton],
    ///       [OutlinedButton], [TextButton]
    ///     - FAB: [FloatingActionButton], [FloatingActionButton.extended]
    ///     - Icon buttons: [IconButton]
    ///     - Segmented buttons: [SegmentedButton]
    ///   * Cards: [Card]
    ///   * Checkbox: [Checkbox]
    ///   * Chips:
    ///     - [ActionChip] (used for Assist and Suggestion chips),
    ///     - [FilterChip], [ChoiceChip] (used for single select filter chips),
    ///     - [InputChip]
    ///   * Dialogs: [Dialog], [AlertDialog]
    ///   * Divider: [Divider]
    ///   * Lists: [ListTile]
    ///   * Menus: [MenuBar], [DropdownMenu]
    ///   * Navigation bar: [NavigationBar] (replacing [BottomNavigationBar])
    ///   * Navigation drawer: [NavigationDrawer]
    ///   * Navigation rail: [NavigationRail]
    ///   * Progress indicators: [CircularProgressIndicator],
    ///     [LinearProgressIndicator]
    ///   * Radio button: [Radio]
    ///   * Snack bar: [SnackBar]
    ///   * Slider: [Slider]
    ///   * Switch: [Switch]
    ///   * Tabs: [TabBar]
    ///   * TextFields: [TextField] together with its [InputDecoration]
    ///   * Top app bar: [AppBar]
    ///
    /// In addition, this flag enables features introduced in Android 12.
    ///   * Stretch overscroll: [MaterialScrollBehavior]
    ///   * Ripple: `splashFactory` (see table above)
    ///
    /// See also:
    ///
    ///   * [Material 3 specification](https://m3.material.io/)
    final bool useMaterial3 = false,

    /// Set to true to automatically swap secondary and tertiary colors, on
    /// built-in color schemes when [useMaterial3] is true, that benefit
    /// from it to better match the Material 3 color system design intent.
    ///
    /// Starting with FlexColorScheme version 6.1.0, built-in color schemes,
    /// defined via [FlexSchemeColor], have a flag [swapOnMaterial3]. When
    /// defined to be true, the scheme will benefit if the [secondary] and
    /// [tertiary] colors, including their containers, are swapped when using
    /// Material 3. Most FlexColorScheme color schemes were designed with
    /// M2 usage in mind, before M3 existed. They may often have their
    /// [swapOnMaterial3] set to true. If this flag is false, it may mean
    /// that its `FlexSchemeColor` was designed for M3 or that it won't
    /// benefit from swapping its secondary and tertiary colors. In the
    /// [Scheme Reference](https://docs.flexcolorscheme.com/scheme_reference),
    /// you can see which schemes have the flag defined to true.
    ///
    /// Using a seed-generated color scheme based on built-in FlexSchemeColor
    /// colors is another way to make them suitable for the M3 Color system.
    /// However, in some cases, the secondary color in their design may not
    /// be in-line with the M3 color system design intent, especially if you
    /// use the config that also uses the hue from the secondary color to
    /// make tonal palettes for it. In some legacy FlexSchemeColor color
    /// designs this can be fixed if we swap the secondary and tertiary colors.
    ///
    /// To make FlexSchemeColor designs color designs that benefit from it
    /// automatically swap secondary and tertiary colors when [useMaterial3]
    /// is set to true, set `swapLegacyOnMaterial3` to true. It defaults to
    /// false, for backward compatibility, but it is recommended to turn
    /// it on when using Material 3 and its color system. If you use
    /// seeded color schemes with Material 2, [useMaterial3] flag is false,
    /// then it may be preferable to keep [swapOnMaterial3] false for more
    /// prominent colors on secondaries.
    ///
    /// This color swap has higher priority than [swapColor], using it will
    /// always happen on the effective result of [swapLegacyOnMaterial3] and
    /// [useMaterial3], and value of [swapOnMaterial3] in currently used
    /// built-in scheme [FlexSchemeColor].
    ///
    /// If a custom [colorScheme] is passed in, or any of the direct color
    /// properties [secondary], [secondaryContainer], [tertiary] or
    /// [tertiaryContainer], then it is assumed a custom scheme or overrides,
    /// are being used and the [swapLegacyOnMaterial3] setting does nothing.
    ///
    /// The Themes Playground app defaults to setting [swapLegacyOnMaterial3]
    /// to ON (true), but allows you to turn it OFF.
    ///
    /// Defaults to false, for backwards compatibility, but prefer setting it
    /// to true if you also set [useMaterial3] to true.
    final bool swapLegacyOnMaterial3 = false,

    /// Arbitrary additions to this theme.
    ///
    /// This is the same property as [extensions] in ThemeData, it is provided
    /// as a convenience pass-through to ThemeData.
    ///
    /// To define extensions, pass an [Iterable] containing one or more
    /// [ThemeExtension] subclasses to [ThemeData.new] or [copyWith].
    ///
    /// To obtain an extension, use ThemeData.of(context).extension.
    final Iterable<ThemeExtension<dynamic>>? extensions,
  }) {
    // DARK: Check valid inputs
    assert(usedColors >= 1 && usedColors <= 7, 'usedColors must be 1 to 7.');
    assert(appBarOpacity == null || appBarOpacity >= 0 && appBarOpacity <= 1,
        'appBarOpacity must be 0 to 1, or null');
    assert(
      blendLevel >= 0 && blendLevel <= 40,
      'Only blend levels from 0 to 40 are allowed. Very high alpha values may '
      'not produce results that are visually very appealing or useful.',
    );
    assert(appBarElevation == null || appBarElevation >= 0.0,
        'AppBar elevation must be >= 0 or null.');
    assert(bottomAppBarElevation == null || bottomAppBarElevation >= 0.0,
        'Bottom AppBar elevation must be null or must be >= 0.');
    // Use color seeding based on passed in keyColors or make one where
    // it is not used, if one was not defined, since we want that as default
    // behavior to match past default behavior.
    final FlexKeyColors seed =
        keyColors ?? const FlexKeyColors(useKeyColors: false);
    // Fallback value for scheme is default material scheme.
    final FlexScheme flexScheme = scheme ?? FlexScheme.material;
    // If colors was null, we used the scheme based value.
    final FlexSchemeColor flexColors =
        colors ?? FlexColor.schemesWithCustom[flexScheme]!.dark;

    // If the passed in property values are not null, or there was a colorScheme
    // provided, we will override the colors properties with them. Doing it here
    // gets also correct effective and swap behavior on directly passed in
    // property values or colorScheme based colors too.
    final FlexSchemeColor withPassedColors = flexColors.copyWith(
      primary: primary ?? colorScheme?.primary,
      primaryContainer: primaryContainer ?? colorScheme?.primaryContainer,
      secondary: secondary ?? colorScheme?.secondary,
      secondaryContainer: secondaryContainer ?? colorScheme?.secondaryContainer,
      tertiary: tertiary ?? colorScheme?.tertiary,
      tertiaryContainer: tertiaryContainer ?? colorScheme?.tertiaryContainer,
      error: error ?? colorScheme?.error,
      errorContainer: colorScheme?.errorContainer,
    );
    // Swap legacy secondary and tertiary color if we use Material 3 and
    // we have swapping of legacy colors on and if the colors in used built-in
    // scheme has flag [swapOnMaterial3] set that tells it benefits from doing
    // this. Additionally we should only do this if we have not passed a custom
    // ColorScheme, nor secondary or tertiary colors directly.
    final bool swapLegacy = useMaterial3 &&
        swapLegacyOnMaterial3 &&
        flexColors.swapOnMaterial3 &&
        secondary == null &&
        secondaryContainer == null &&
        tertiary == null &&
        tertiaryContainer == null &&
        colorScheme == null;
    // First cut of effective FlexSchemeColor depends on colors, usedColors
    // and swapLegacy and swap. When we use Brightness.dark, we also guarantee
    // that we have colors on effectiveColors.error and errorContainer, they
    // are guaranteed to no longer be null after this call.
    FlexSchemeColor effectiveColors = FlexSchemeColor.effective(
      withPassedColors,
      usedColors,
      swapLegacy: swapLegacy,
      swapColors: swapColors,
      brightness: Brightness.dark,
    );
    // ColorScheme to hold our seeded scheme colors, it will be kept as null
    // if we do not use M3 key based seeded tonal palette ColorScheme.
    ColorScheme? seedScheme;
    // If keyColor seeds is active, apply seeded colors to effective colors.
    if (seed.useKeyColors) {
      // Build effective input key seed colors as we built the normal colors.
      // We will need the scheme enum light color as input, for dark tonal when
      // we use seed with built in schemes in dark mode.
      final FlexSchemeColor flexKeyColors =
          colors ?? FlexColor.schemesWithCustom[flexScheme]!.light;
      // Get effective light color with same rules as the dark colors.
      final FlexSchemeColor withPassedColors = flexKeyColors.copyWith(
        primary: primary ?? colorScheme?.primary,
        primaryContainer: primaryContainer ?? colorScheme?.primaryContainer,
        secondary: secondary ?? colorScheme?.secondary,
        secondaryContainer:
            secondaryContainer ?? colorScheme?.secondaryContainer,
        tertiary: tertiary ?? colorScheme?.tertiary,
        tertiaryContainer: tertiaryContainer ?? colorScheme?.tertiaryContainer,
      );
      final FlexSchemeColor effectiveKeyColors = FlexSchemeColor.effective(
        withPassedColors,
        usedColors,
        swapLegacy: swapLegacy,
        swapColors: swapColors,
        brightness: Brightness.dark,
      );
      // Create a ColorScheme from active and effective seed key colors.
      seedScheme = SeedColorScheme.fromSeeds(
        brightness: Brightness.dark,
        primaryKey: effectiveKeyColors.primary,
        // If use secondary seed, use it with fromSeeds, otherwise undefined.
        secondaryKey: seed.useSecondary ? effectiveKeyColors.secondary : null,
        // If use tertiary seed, use it with fromSeeds, otherwise undefined.
        tertiaryKey: seed.useTertiary ? effectiveKeyColors.tertiary : null,
        // If a custom surface tint is used, use it also as key for neutral and
        // neutral variant tonal palette generation.
        neutralKey: surfaceTint,
        neutralVariantKey: surfaceTint,
        // Use provided tones configuration or the default one, which uses
        // defaults that can produce same results as Flutter SDK,
        // ColorScheme.fromSeed(color), when only primary color is used as key.
        tones: tones,
        surfaceTint: surfaceTint,
      );
      // Update effective main colors to seed colors, keeping configured
      // effective main color values when so defined. The main colors to keep
      // are the ones from the effective normal dark scheme, not the key colors.
      effectiveColors = FlexSchemeColor(
        primary:
            seed.keepPrimary ? effectiveColors.primary : seedScheme.primary,
        primaryContainer: seed.keepPrimaryContainer
            ? effectiveColors.primaryContainer
            : seedScheme.primaryContainer,
        secondary: seed.keepSecondary
            ? effectiveColors.secondary
            : seedScheme.secondary,
        secondaryContainer: seed.keepSecondaryContainer
            ? effectiveColors.secondaryContainer
            : seedScheme.secondaryContainer,
        tertiary:
            seed.keepTertiary ? effectiveColors.tertiary : seedScheme.tertiary,
        tertiaryContainer: seed.keepTertiaryContainer
            ? effectiveColors.tertiaryContainer
            : seedScheme.tertiaryContainer,
        appBarColor: effectiveColors.appBarColor,
        error: seedScheme.error,
        errorContainer: seedScheme.errorContainer,
      );
    }
    // Get effective surfaceTint color, also used as blend color for surfaces.
    final Color blendColor =
        surfaceTint ?? colorScheme?.surfaceTint ?? effectiveColors.primary;
    // Compute surface blends, they may also be added on seeded surfaces.
    final FlexSchemeSurfaceColors surfaceSchemeColors =
        FlexSchemeSurfaceColors.blend(
      brightness: Brightness.dark,
      surfaceMode: surfaceMode ?? FlexSurfaceMode.highScaffoldLowSurfaces,
      blendLevel: blendLevel,
      surfaceVariantBlendDivide: seed.useKeyColors ? 2 : 1,
      schemeColors: effectiveColors,
      blendColors: FlexSchemeSurfaceColors(
        surface: blendColor,
        surfaceVariant: blendColor,
        inverseSurface: blendColor,
        dialogBackground: blendColor,
        background: blendColor,
        scaffoldBackground: blendColor,
      ),
      surfaceColors: seed.useKeyColors
          // Using seed colors, starting surfaces are given by generated scheme.
          ? FlexSchemeSurfaceColors(
              surface: seedScheme!.surface,
              surfaceVariant: seedScheme.surfaceVariant,
              inverseSurface: seedScheme.inverseSurface,
              dialogBackground: seedScheme.surface,
              background: seedScheme.background,
              scaffoldBackground: seedScheme.background,
            )
          // Colorscheme surfaces are used as starting point for blended ones.
          : colorScheme != null
              ? FlexSchemeSurfaceColors(
                  surface: colorScheme.surface,
                  surfaceVariant: colorScheme.surfaceVariant,
                  inverseSurface: colorScheme.inverseSurface,
                  dialogBackground: colorScheme.surface,
                  background: colorScheme.background,
                  scaffoldBackground: colorScheme.background,
                )
              : null,
    );
    // Use subThemes if a none null FlexSubThemesData was passed in.
    final bool useSubThemes = subThemesData != null;
    // Use passed in sub-theme config data, or a default one, if none given.
    final FlexSubThemesData subTheme =
        subThemesData ?? const FlexSubThemesData();
    // Effective blend level for the onColors.
    int onBlendLevel = useSubThemes ? (subTheme.blendOnLevel ?? 0) : 0;
    assert(
        onBlendLevel >= 0 && onBlendLevel <= 40,
        'Only onBlendLevel:s from 0 to 40 '
        'are allowed. Very high alpha blend levels may not produce results '
        'that are visually very appealing or useful.');
    // If above happens in none debug mode, use 0, no blends.
    if (onBlendLevel < 0 || onBlendLevel > 40) onBlendLevel = 0;

    // Get alpha blend values for used mode, on blend level and brightness,
    // used for onContainers and onSurface and onBackground.
    final FlexAlphaValues alphaOnValue = useSubThemes
        ? FlexAlphaValues.getAlphas(
            surfaceMode ?? FlexSurfaceMode.highScaffoldLowSurfaces,
            onBlendLevel)
        : const FlexAlphaValues();
    // Get alpha blend values for used mode, on blend level and brightness,
    // used for onPrimary, onSecondary, onTertiary and onError.
    final FlexAlphaValues alphaOnMain = useSubThemes && subTheme.blendOnColors
        ? FlexAlphaValues.getAlphas(
            surfaceMode ?? FlexSurfaceMode.highScaffoldLowSurfaces,
            onBlendLevel)
        : const FlexAlphaValues();
    // Determine the input surface, surfaceVariant and background colors,
    // inputSurfaceVariant cannot be overridden via FlexColorScheme prop yet.
    // This is a preparation for adding it.
    // TODO(rydmike): Maybe add prop inputSurfaceVariant and inverseSurface.
    final Color inputSurface = surface ?? surfaceSchemeColors.surface;
    final Color inputSurfaceVariant = surfaceSchemeColors.surfaceVariant;
    final Color inputBackground = background ?? surfaceSchemeColors.background;

    final FlexSchemeOnColors onColors = FlexSchemeOnColors.from(
      primary: effectiveColors.primary,
      primaryContainer: effectiveColors.primaryContainer,
      secondary: effectiveColors.secondary,
      secondaryContainer: effectiveColors.secondaryContainer,
      tertiary: effectiveColors.tertiary,
      tertiaryContainer: effectiveColors.tertiaryContainer,
      surface: inputSurface,
      surfaceVariant: inputSurfaceVariant,
      inverseSurface: surfaceSchemeColors.inverseSurface,
      background: inputBackground,
      error: effectiveColors.error!,
      errorContainer: effectiveColors.errorContainer,
      onPrimary: onPrimary ??
          (seed.useKeyColors && seed.keepPrimary
              ? null
              : seedScheme?.onPrimary) ??
          colorScheme?.onPrimary,
      onPrimaryContainer: onPrimaryContainer ??
          (seed.useKeyColors && seed.keepPrimaryContainer
              ? null
              : seedScheme?.onPrimaryContainer) ??
          colorScheme?.onPrimaryContainer,
      onSecondary: onSecondary ??
          (seed.useKeyColors && seed.keepSecondary
              ? null
              : seedScheme?.onSecondary) ??
          colorScheme?.onSecondary,
      onSecondaryContainer: onSecondaryContainer ??
          (seed.useKeyColors && seed.keepSecondaryContainer
              ? null
              : seedScheme?.onSecondaryContainer) ??
          colorScheme?.onSecondaryContainer,
      onTertiary: onTertiary ??
          (seed.useKeyColors && seed.keepTertiary
              ? null
              : seedScheme?.onTertiary) ??
          colorScheme?.onTertiary,
      onTertiaryContainer: onTertiaryContainer ??
          (seed.useKeyColors && seed.keepTertiaryContainer
              ? null
              : seedScheme?.onTertiaryContainer) ??
          colorScheme?.onTertiaryContainer,
      onSurface: onSurface ?? seedScheme?.onSurface ?? colorScheme?.onSurface,
      onSurfaceVariant:
          seedScheme?.onSurfaceVariant ?? colorScheme?.onSurfaceVariant,
      onInverseSurface:
          seedScheme?.onInverseSurface ?? colorScheme?.onInverseSurface,
      onBackground:
          onBackground ?? seedScheme?.onBackground ?? colorScheme?.onBackground,
      onError: onError ?? seedScheme?.onError ?? colorScheme?.onError,
      onErrorContainer: seedScheme?.onError ?? colorScheme?.onErrorContainer,
      primaryAlpha: alphaOnMain.primaryAlpha,
      primaryContainerAlpha: alphaOnValue.primaryContainerAlpha,
      secondaryAlpha: alphaOnMain.secondaryAlpha,
      secondaryContainerAlpha: alphaOnValue.secondaryContainerAlpha,
      tertiaryAlpha: alphaOnMain.tertiaryAlpha,
      tertiaryContainerAlpha: alphaOnValue.tertiaryContainerAlpha,
      surfaceAlpha: alphaOnValue.surfaceAlpha,
      surfaceVariantAlpha: alphaOnValue.surfaceVariantAlpha,
      inverseSurfaceAlpha: alphaOnValue.inverseSurfaceAlpha,
      backgroundAlpha: alphaOnValue.backgroundAlpha,
      errorAlpha: alphaOnMain.errorAlpha,
      errorContainerAlpha: alphaOnValue.errorContainerAlpha,
    );
    // Determine effective surface color.
    // Surface is used e.g. by Card and bottom appbar.
    // If true black, we make a darker than normal surface. If not
    // true black, we use provided surface color, or computed one.
    final Color effectiveSurfaceColor =
        darkIsTrueBlack ? inputSurface.darken(5) : inputSurface;
    final Color effectiveSurfaceVariantColor =
        darkIsTrueBlack ? inputSurfaceVariant.darken(5) : inputSurfaceVariant;
    final Color effectiveInverseSurfaceColor = darkIsTrueBlack
        ? surfaceSchemeColors.inverseSurface.lighten(5)
        : surfaceSchemeColors.inverseSurface;
    // Determine effective background color.
    // Used e.g. by drawer, nav rail, side menu and bottom bar.
    // If true black, we use darker then normal background. If not true black,
    // we use provided background color, or computed one.
    final Color effectiveBackgroundColor =
        darkIsTrueBlack ? inputBackground.darken(5) : inputBackground;
    // Determine effective dialog background color.
    // If true black, we use darker than normal. If not true black,
    // we use dialog provided background color, or computed one.
    // The provided dialog background color overrides factory surface behavior,
    // but is impacted by true black mode for a darker effect.

    // If darkIsTrueBlack is set, we use black as default scaffold background,
    // otherwise provided value or if null effective scheme background.
    final Color effectiveScaffoldColor = scaffoldBackground ??
        (darkIsTrueBlack
            ? Colors.black
            : surfaceSchemeColors.scaffoldBackground);

    final Color effectiveDialogBackground = darkIsTrueBlack
        ? dialogBackground?.darken(5) ??
            surfaceSchemeColors.dialogBackground.darken(5)
        : dialogBackground ?? surfaceSchemeColors.dialogBackground;
    // Compute the effective ColorScheme based on all selection options.
    final ColorScheme effectiveColorScheme = seedScheme?.copyWith(
          // We made a seeded color scheme, we use it as given but set
          // override values for props we have not handled via FCS direct
          // props further below. We don't adjust onColors for
          // surfaceVariant and inverseSurface on purpose.
          surfaceVariant: effectiveSurfaceVariantColor,
          inverseSurface: effectiveInverseSurfaceColor,
          surfaceTint: surfaceTint,
        ) ??
        // We had a colorScheme passed in, we use as passed in, but set
        // override values for props we have not handled via FCS direct
        // props further below.
        colorScheme?.copyWith(
          surfaceVariant: effectiveSurfaceVariantColor,
          onSurfaceVariant: onColors.onSurfaceVariant,
          inverseSurface: effectiveInverseSurfaceColor,
          onInverseSurface: onColors.onInverseSurface,
          surfaceTint: surfaceTint,
        ) ??
        // In order to avoid using a ColorScheme.dark that sets
        // some opinionated defaults on deprecated members that we do not
        // want, we make a full one matching the target. Values that
        // exist as direct properties in FlexColorScheme, will actually
        // be used via them further below, but we need this ColorScheme
        // to provide the properties we are not handling via FCS
        // constructor. An alternative would be to add missing ColorScheme
        // properties to FlexColorScheme as direct override properties,
        // might do so later.
        ColorScheme(
          brightness: Brightness.dark,
          primary: effectiveColors.primary,
          onPrimary: onColors.onPrimary,
          primaryContainer: effectiveColors.primaryContainer,
          onPrimaryContainer: onColors.onPrimaryContainer,
          secondary: effectiveColors.secondary,
          onSecondary: onColors.onSecondary,
          secondaryContainer: effectiveColors.secondaryContainer,
          onSecondaryContainer: onColors.onSecondaryContainer,
          tertiary: effectiveColors.tertiary,
          onTertiary: onColors.onTertiary,
          tertiaryContainer: effectiveColors.tertiaryContainer,
          onTertiaryContainer: onColors.onTertiaryContainer,
          error: useMaterial3ErrorColors && !seed.useKeyColors
              ? FlexColor.material3DarkError
              : effectiveColors.error ?? FlexColor.materialDarkError,
          onError: useMaterial3ErrorColors && !seed.useKeyColors
              ? FlexColor.material3DarkOnError
              : onColors.onError,
          errorContainer: useMaterial3ErrorColors && !seed.useKeyColors
              ? FlexColor.material3DarkErrorContainer
              : effectiveColors.errorContainer!,
          onErrorContainer: useMaterial3ErrorColors && !seed.useKeyColors
              ? FlexColor.material3DarkOnErrorContainer
              : onColors.onErrorContainer,
          background: effectiveBackgroundColor,
          onBackground: onColors.onBackground,
          surface: effectiveSurfaceColor,
          onSurface: onColors.onSurface,
          surfaceVariant: effectiveSurfaceVariantColor,
          onSurfaceVariant: onColors.onSurfaceVariant,
          outline: _outlineColor(Brightness.dark, onColors.onBackground, 45),
          outlineVariant:
              _outlineColor(Brightness.dark, onColors.onBackground, 75),
          shadow: Colors.black,
          scrim: Colors.black,
          inverseSurface: effectiveInverseSurfaceColor,
          onInverseSurface: onColors.onInverseSurface,
          inversePrimary: _inversePrimary(
              Brightness.dark, effectiveColors.primary, effectiveSurfaceColor),
          surfaceTint: surfaceTint ?? effectiveColors.primary,
        );

    // Determine the effective AppBar color:
    // - First priority, passed in color value.
    Color? effectiveAppBarColor = appBarBackground;
    // - Second priority, sub-theme based scheme color.
    effectiveAppBarColor ??=
        useSubThemes && subTheme.appBarBackgroundSchemeColor != null
            ? FlexSubThemes.schemeColor(
                subTheme.appBarBackgroundSchemeColor!, effectiveColorScheme)
            : null;
    // Third priority [appBarStyle] based.
    if (effectiveAppBarColor == null) {
      switch (appBarStyle) {
        case FlexAppBarStyle.primary:
          effectiveAppBarColor =
              effectiveColors.primary.withOpacity(appBarOpacity ?? 1.0);
        case FlexAppBarStyle.material:
          effectiveAppBarColor =
              FlexColor.materialDarkSurface.withOpacity(appBarOpacity ?? 1.0);
        case FlexAppBarStyle.surface:
          effectiveAppBarColor =
              effectiveSurfaceColor.withOpacity(appBarOpacity ?? 1.0);
        case FlexAppBarStyle.background:
          effectiveAppBarColor =
              effectiveBackgroundColor.withOpacity(appBarOpacity ?? 1.0);
        case FlexAppBarStyle.scaffoldBackground:
          effectiveAppBarColor =
              effectiveScaffoldColor.withOpacity(appBarOpacity ?? 1.0);
        case FlexAppBarStyle.custom:
          effectiveAppBarColor =
              effectiveColors.appBarColor?.withOpacity(appBarOpacity ?? 1.0) ??
                  effectiveColors.primary.withOpacity(appBarOpacity ?? 1.0);
        case null:
          // Style was null, if Opacity used, apply to surface for M2 & M3 mode.
          if (appBarOpacity != null && appBarOpacity != 1.0) {
            effectiveAppBarColor =
                effectiveSurfaceColor.withOpacity(appBarOpacity);
          }
      }
    }
    // The resulting effectiveAppBarColor may remain null if default values
    // are used, this used to avoid creating any AppBar theme in M3 mode if
    // using no sub-theme and only default FCS.dark direct AppBar properties.

    return FlexColorScheme(
      colorScheme: effectiveColorScheme,
      // This is the dark theme factory so we always set brightness to dark.
      brightness: Brightness.dark,
      // Primary colors for the application
      primary: effectiveColors.primary,
      primaryContainer: effectiveColors.primaryContainer,
      // The secondary colors for the application.
      secondary: effectiveColors.secondary,
      secondaryContainer: effectiveColors.secondaryContainer,
      // Tertiary colors for the application.
      tertiary: effectiveColors.tertiary,
      tertiaryContainer: effectiveColors.tertiaryContainer,
      // Surface is used e.g. by Card and bottom appbar and in this
      // implementation also by dialogs.
      surface: effectiveSurfaceColor,
      // Used e.g. by drawer, nav rail, side menu and bottom bar.
      background: effectiveBackgroundColor,
      // If darkIsTrueBlack is set, we use black as default scaffold background,
      // otherwise provided value or if null effective scheme background.
      scaffoldBackground: effectiveScaffoldColor,
      // Color of dialog background elements, a passed in dialogBackground
      // color will override the factory style, if provided.
      dialogBackground: effectiveDialogBackground,
      // Set app bar background to effective background color, but a passed
      // in appBarBackground will override it if provided.
      appBarBackground: effectiveAppBarColor,
      // Effective error color and null fallback.
      error: useMaterial3ErrorColors && !seed.useKeyColors
          ? FlexColor.material3DarkError
          : effectiveColors.error ?? FlexColor.materialDarkError,
      onPrimary: onColors.onPrimary,
      onPrimaryContainer: onColors.onPrimaryContainer,
      onSecondary: onColors.onSecondary,
      onSecondaryContainer: onColors.onSecondaryContainer,
      onTertiary: onColors.onTertiary,
      onTertiaryContainer: onColors.onTertiaryContainer,
      onSurface: onColors.onSurface,
      onBackground: onColors.onBackground,
      onError: useMaterial3ErrorColors && !seed.useKeyColors
          ? FlexColor.material3DarkOnError
          : onColors.onError,
      surfaceTint: surfaceTint,
      tabBarStyle: tabBarStyle,
      appBarElevation: appBarElevation,
      bottomAppBarElevation: bottomAppBarElevation,
      tooltipsMatchBackground: tooltipsMatchBackground,
      transparentStatusBar: transparentStatusBar,
      visualDensity: visualDensity,
      textTheme: textTheme,
      primaryTextTheme: primaryTextTheme,
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
      package: package,
      materialTapTargetSize: materialTapTargetSize,
      pageTransitionsTheme: pageTransitionsTheme,
      platform: platform,
      typography: typography,
      applyElevationOverlayColor: applyElevationOverlayColor,
      subThemesData: subThemesData,
      useMaterial3: useMaterial3,
      extensions: extensions,
    );
  }

  //****************************************************************************
  //
  // STATIC HELPER FUNCTIONS AND CONSTANTS
  //
  //  * comfortablePlatformDensity
  //  * themedSystemNavigationBar
  //  * createPrimarySwatch
  //
  //****************************************************************************

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
  /// laptops that have touch screens, as it keeps touch targets a bit larger
  /// than when using compact.
  static VisualDensity get comfortablePlatformDensity =>
      defaultComfortablePlatformDensity(defaultTargetPlatform);

  /// Returns a [VisualDensity] that is adaptive based on the given [platform].
  ///
  /// For desktop platforms, this returns [VisualDensity.comfortable], and for
  /// other platforms, it returns a default [VisualDensity.standard].
  ///
  /// See also:
  ///
  /// * [comfortablePlatformDensity] which returns a [VisualDensity] that is
  ///   adaptive based on [defaultTargetPlatform].
  static VisualDensity defaultComfortablePlatformDensity(
      TargetPlatform platform) {
    switch (platform) {
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
  /// current theme's [ColorScheme.background] as its background color and
  /// icon colors that match this background, without any divider.
  ///
  /// The background color can be modified with [systemNavBarStyle] that
  /// can use: system, surface, background, scaffoldBackground or transparent
  /// options as background color options. It defaults to background.
  /// See [FlexSystemNavBarStyle] for more info.
  ///
  /// In default Flutter M2 themes, the surface, background, scaffoldBackground
  /// and in light theme, even system are all the same color. For such themes
  /// this convenience property does not make so much sense. However, if you use
  /// FlexColorScheme and its primary color surface blending, or M3 kye color
  /// seed generated ColorSchemes, these colors may not be the same. This
  /// offers a convenient way to switch the background color of your system
  /// navigation bar in a way that matches your theme's surface branded
  /// background color and to choose which one of them to use.
  ///
  /// This helper always sets [systemNavigationBarContrastEnforced] to false,
  /// to try to avoid the system scrim on Android version where it is supported.
  /// This is done because the selected background color is the scrim itself
  /// when used with the opacity parameter and we never want an extra scrim.
  /// If we set opacity very low and loose contrast due to that, it is because
  /// it is the usage intent.
  ///
  /// An optional divider on the navigation bar is also available.
  /// Based on Flutter SDK docs, the divider on the navigation bar, is only
  /// respected on Android P (= Pie = SDK API 28 = Android 9) or higher. The
  /// divider can be turned on by setting [useDivider] to true.
  /// This produces a divider on top of the system navigation bar that in
  /// light theme mode uses color 0xFF2C2C2C and in dark mode and 0xFFDDDDDD.
  ///
  /// You can modify the default color of the divider with the optional
  /// [systemNavigationBarDividerColor]. The call to set and use the divider
  /// color is only made once a none null or true value has been given to
  /// [useDivider].
  ///
  /// Android SDK < 29 does not respect provided alpha value on the color of
  /// the divider color, and calling it with null again will not remove it.
  ///
  /// Be aware that once you have enabled the divider by setting it to true that
  /// there is no convenient way to get rid of it. You can set the value
  /// to false, but that will just make the divider same color as your current
  /// nav bar background color to make it invisible, it is still there, but
  /// this implementation trick works well.
  ///
  /// Important: The divider is actually a layer behind the system navigation
  /// bar background, that is 1 dp higher. When using colors with opacity on
  /// the background and the divider, one have to consider the sum of the
  /// opacity for both colors to get the effective translucent color.
  ///
  /// Use and support for the [opacity] value on the system navigation bar
  /// is supported starting from Flutter 2.5.
  ///
  /// By default [themedSystemNavigationBar] does not set any system overlay
  /// for the status bar. In Flutter SDK the top status bar has its own built in
  /// [SystemUiOverlayStyle] as a part of [AppBar] and [AppBarTheme].
  ///
  /// [FlexColorScheme] also manages the [SystemUiOverlayStyle] for the status
  /// bar via it. However, if your screen has no [AppBar] you can use the
  /// property [noAppBar] and [invertStatusIcons] to affect the look of the
  /// status icons when there is no [AppBar] present on the page, this is
  /// useful e.g. for splash and intro screens.
  static SystemUiOverlayStyle themedSystemNavigationBar(
    BuildContext? context, {
    /// Use a divider line on the top edge of the system navigation bar.
    ///
    /// On Android 11 (SDK30) there was an issue when using the system
    /// divider, see: https://github.com/flutter/flutter/issues/100027
    /// This issue was found to be resolved on in tests onFlutter 3.7.7
    /// 15.3.2023. Keeping this references around to the issue in case some
    /// related issues appear. The system navigation bar on different Android
    /// versions is a complicated topic.
    ///
    /// Based on Flutter SDK docs, the divider on the navigation bar, is on
    /// respected on Android P (= Pie = SDK API 28 = Android 9) or higher. But
    /// based on our findings it does not work until Android 10 (SDK29 or
    /// higher.
    ///
    /// Important: The divider is actually a layer behind the system navigation
    /// bar background, that is 1dp higher. When using colors with opacity on
    /// the background and the divider, one have to consider the sum of the
    /// opacity for both colors to get the effective translucent color.
    ///
    /// Defaults to null.
    ///
    /// Keeping it null, by omission or passing null, always  omits the call
    /// to set any divider color in the created [SystemUiOverlayStyle].
    final bool? useDivider,

    /// Opacity value for the system navigation bar.
    ///
    /// The opacity value is applied to the provided `systemNavigationBarColor`
    /// or if it is null, to the color determined by `systemNavBarStyle`.
    ///
    /// Defaults to 1, fully opaque.
    ///
    /// This feature is supported starting from Flutter 2.5.
    /// Be aware that it only works on Android SDK >= 29. Earlier there were
    /// some issues on Android SDK < 29 before this PR landed in stable:
    /// https://github.com/flutter/engine/pull/28616
    ///
    /// This issue is a good source for more information on current state
    /// of transparent navigation bars in Flutter on Android:
    /// https://github.com/flutter/flutter/issues/90098.
    final double opacity = 1,

    /// Set this to true if you do not use a Material AppBar and want
    /// a uniform background where the status bar's icon region is.
    ///
    /// If your page does not have an [AppBar] you can also use this
    /// [AnnotatedRegion] helper to remove the top status bar scrim color
    /// on the top icon status bar, set [noAppBar] to true to do so.
    ///
    /// A typical use case would be pages like splash screens and intro
    /// screens that don't use an AppBar. The Material AppBar uses its own
    /// [SystemUiOverlayStyle] so don't use this with an AppBar, set the style
    /// on the AppBar or its theme instead. However, if you don't have an
    /// [AppBar] on screen, this is a convenient way of to remove the top
    /// system icon scrim for a more clean full screen look on Android.
    final bool noAppBar = false,

    /// Set to true to invert top status bar icons like, battery, network,
    /// wifi icons etc. in relation to their normal theme brightness related
    /// color.
    ///
    /// Defaults to false.
    ///
    /// This setting works well together with the [noAppBar] flag to make an
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
    /// Based on Flutter SDK docs, the divider on the navigation bar, is on
    /// respected on Android P (= Pie = SDK API 28 = Android 9) or higher. But
    /// based on our findings it does not work until Android 10 (SDK29 or
    /// higher.
    ///
    /// Important: The divider is actually a layer behind the system navigation
    /// bar background, that is 1dp higher. When using colors with opacity on
    /// the background and the divider, one have to consider the sum of the
    /// opacity for both colors to get the effective translucent color.
    final Color? systemNavigationBarDividerColor,

    /// Brightness used if context is null, mostly used for simple unit testing,
    /// with no context present. However, it can also be used to make a
    /// `SystemUiOverlayStyle` without having a context.
    ///
    /// Defaults to Brightness.light.
    final Brightness nullContextBrightness = Brightness.light,
  }) {
    double usedOpacity = opacity;
    if (usedOpacity < 0) usedOpacity = 0;
    if (usedOpacity > 1) usedOpacity = 1;
    // If the systemNavBarStyle is FlexSystemNavBarStyle.transparent
    // set opacity to fully transparent.
    if (systemNavBarStyle == FlexSystemNavBarStyle.transparent) {
      usedOpacity = 0.0;
    }
    // If opacity is specified, we need to enable SystemUiMode.edgeToEdge to
    // be able to see content scrolling behind the transparent bar. We only do
    // so when we have any opacity specified.
    if (usedOpacity < 1) {
      unawaited(SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge));
    }

    // If context was null, use nullContextBrightness as brightness value.
    final bool isDark = context != null
        ? Theme.of(context).brightness == Brightness.dark
        : nullContextBrightness == Brightness.dark;
    // Get the defined effective background color for the used style.
    // This is not pretty, but wanted a final for the flexBackground.
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
    final Color background = systemNavigationBarColor ?? flexBackground;

    // A divider will be applied if `useDivider` is true and it will
    // use provided `systemNavigationBarDividerColor` if a value was given,
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
    // higher it does work, and it looks nicer when it has some transparency
    // if the navbar is also transparent.
    Color? dividerColor;
    // If we have opacity on the navbar, we should have some on the divider too
    // when we have a divider, we use some, but not a lot, we do want to keep
    // visible and not fade away with background opacity, since a divider was
    // requested.
    final double dividerOpacity = usedOpacity < 1 ? 0.5 : 1;
    if (useDivider == null || !useDivider) {
      // To be able to take away the divider wi have to make it transparent.
      dividerColor = Colors.transparent;
    } else {
      // Requested a divider, but have no given color, use defaults.
      if (systemNavigationBarDividerColor == null) {
        dividerColor = isDark
            ? const Color(0xFF2C2C2C).withOpacity(dividerOpacity)
            : const Color(0xFFDDDDDD).withOpacity(dividerOpacity);
      } // We should have a divider, with a given color.
      else {
        dividerColor =
            systemNavigationBarDividerColor.withOpacity(dividerOpacity);
      }
    }

    // Determine effective AppBar background color, so we can compute
    // its brightness need for status icons. This was used earlier as
    // workarounds to https://github.com/flutter/flutter/issues/100027
    // It may no longer be needed.
    late Color appBarColor;
    if (context == null) {
      // This is for testing, we set it to same as navbar.
      appBarColor = background;
    } else {
      final ThemeData theme = Theme.of(context);
      final ColorScheme colorScheme = theme.colorScheme;
      final AppBarTheme appBarTheme = AppBarTheme.of(context);
      appBarColor = appBarTheme.backgroundColor ??
          (colorScheme.brightness == Brightness.dark
              ? colorScheme.surface
              : colorScheme.primary);
    }
    final Brightness appBarBrightness =
        ThemeData.estimateBrightnessForColor(appBarColor);

    // Making finals for each SystemUiOverlayStyle property, these were used
    // to modify the logic when needed to experiment with work around for:
    // https://github.com/flutter/flutter/issues/100027
    // The issue has now been solved and we could potentially remove some
    // of this, but keeping it place for now as everything finally worked
    // as intended on Android 9 to 13 in tests 15.3.20222 on Flutter 3.7.7.
    // Also it makes the returned SystemUiOverlayStyle call look very clean.
    final Color? statusBarColor = noAppBar ? Colors.transparent : null;
    final Brightness? statusBarBrightness =
        noAppBar ? (isDark ? Brightness.dark : Brightness.light) : null;
    final Brightness? statusBarIconBrightness = noAppBar
        ? invertStatusIcons
            ? (isDark ? Brightness.dark : Brightness.light)
            : (isDark ? Brightness.light : Brightness.dark)
        : invertStatusIcons
            ? appBarBrightness
            : null;
    final Color sysNavigationBarColor = background.withOpacity(usedOpacity);
    final Color sysNavigationBarDividerColor =
        invertStatusIcons ? Colors.transparent : dividerColor;
    final Brightness systemNavigationBarIconBrightness = invertStatusIcons
        ? (isDark ? Brightness.dark : Brightness.light)
        : (isDark ? Brightness.light : Brightness.dark);

    return SystemUiOverlayStyle(
      // The top status bar settings.
      systemStatusBarContrastEnforced: false,
      statusBarColor: statusBarColor,
      statusBarBrightness: statusBarBrightness,
      statusBarIconBrightness: statusBarIconBrightness,
      // The bottom navigation bar settings.
      systemNavigationBarContrastEnforced: false,
      systemNavigationBarColor: sysNavigationBarColor,
      // Divider setting.
      systemNavigationBarDividerColor: sysNavigationBarDividerColor,
      // Bottom system navigation bar icon or swipe bar navigator color.
      systemNavigationBarIconBrightness: systemNavigationBarIconBrightness,
    );
  }

  /// Create a primary Material color swatch from a given [color].
  ///
  /// This function is since version 5.0.0 no longer used by FlexColorScheme.
  /// In previous version it was used by [FlexColorScheme.toTheme] to provide
  /// [ColorScheme.primary] matching colors for [ThemeData.primaryColorLight],
  /// [ThemeData.primaryColorDark] and [ThemeData.secondaryHeaderColor].
  ///
  /// Since algorithm does not produce a correct [MaterialColor], it did not
  /// work so well if the provided color was not of roughly a mid point 500
  /// index equivalent. So it worked well for light theme mode, but not so well
  /// for dark theme mode themes were [ColorScheme.primary] is typically much
  /// lighter than then [MaterialColor] 500 index. FlexColorScheme moved to
  /// using alpha blends to provide primary color matching colors to
  /// above mentioned colors. Since the colors are very rarely used and on a
  /// deprecation path in Flutter SDK they are not so critical.
  ///
  /// Since this function is no longer need by this library, it may be
  /// deprecated and removed. Deprecation could e.g. happen in FlexColorScheme
  /// version 6, and removal in version 7.
  ///
  /// There reason why it is not deprecated already is because I would like to
  /// replace it with the correct Material 2 [MaterialColor] algorithm, which
  /// is not available in Dart.
  /// There are reversed engineered JS versions of the official Material Color
  /// algorithm made from the Material Guide web tools. If anybody has the
  /// energy to make a Dart version of it, that would be fabulous.
  /// SO discussion here:
  /// https://stackoverflow.com/questions/32942503/material-design-color-palette
  ///
  /// Starting points here:
  /// - https://github.com/mbitson/mcg/issues/19
  /// - Good candidate: https://github.com/eugeneford/material-palette-generator
  /// - https://github.com/edelstone/material-palette-generator
  ///
  /// Old documentation for using [createPrimarySwatch].
  ///
  /// The provided [color] is used as the Material swatch default color 500
  /// in the returned swatch, with lighter hues for lower indexes and darker
  /// shades for higher index values.
  ///
  /// If you give this function a standard Material color index 500 value,
  /// eg `Colors.red[500]` it will not return the same swatch as `Colors.red`.
  /// This function is an approximation and gives an automated way of creating
  /// a Material like primary swatch.
  ///
  /// The used algorithm is identical to the same named function
  /// found in ColorTools in FlexColorPicker at
  /// https://pub.dev/packages/flex_color_picker.
  static MaterialColor createPrimarySwatch(final Color? color) {
    // Null default fallback is default material primary light color.
    final Color usedColor = color ?? FlexColor.materialLightPrimary;
    const List<double> strengths = <double> //
        [0.05, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9];
    final Map<int, Color> swatch = <int, Color>{};
    final int r = usedColor.red;
    final int g = usedColor.green;
    final int b = usedColor.blue;
    for (final double strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    // The above gives a starting point, this tunes it a bit better, still far
    // from the real algorithm.
    swatch[50] = swatch[50]!.lighten(18);
    swatch[100] = swatch[100]!.lighten(16);
    swatch[200] = swatch[200]!.lighten(14);
    swatch[300] = swatch[300]!.lighten(10);
    swatch[400] = swatch[400]!.lighten(6);
    swatch[700] = swatch[700]!.darken(2);
    swatch[800] = swatch[800]!.darken(3);
    swatch[900] = swatch[900]!.darken(4);
    return MaterialColor(usedColor.value, swatch);
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
  /// * `ScaffoldBackgroundColor` has its own color property in FlexColorScheme
  ///   and can if so desired differ from the `ColorScheme.background` color.
  ///   When using primary color blended surfaces and backgrounds, it is
  ///   important to be able to vary the very prominent ScaffoldBackgroundColor
  ///   separately from other surfaces and backgrounds.
  ///
  /// * The `dialogBackgroundColor` in M2 uses the `ColorScheme.surface` color
  ///   instead of the default `ColorScheme.background`. In order to preserve
  ///   the `elevationOverlayColor` in dark mode when `ColorScheme.surface` and
  ///   `ColorScheme.background` differs due to different surface blends, the
  ///   `ColorScheme.surface` was used to ensure dialogs that are always
  ///   elevated gets the overlay color applied in dark theme mode. For more
  ///   info see:
  ///   [issue #90353](https://github.com/flutter/flutter/issues/90353).
  ///   In M3 `ColorScheme.surface` is used by the SDK as well.
  ///
  ///  * The `indicatorColor` is same as `effectiveTabColor` which uses a
  ///    function with logic to determine its color based on if a TabBarTheme
  ///    was selected that should work on current AppBar background color,
  ///    or on surface/background colors.
  ///
  ///  * Flutter themes created with `ThemeData.from` does not define any color
  ///    scheme related color for the `primaryColorDark` color, FCS does.
  ///    See issue: https:///github.com/flutter/flutter/issues/65782.
  ///    The `ThemeData.from` leaves this color at `ThemeData` factory default,
  ///    this may not match your scheme. Widgets seldom use this color, so the
  ///    issue is rarely seen.
  ///    This color property will be deprecated in Flutter, see issue
  ///    [91772](https://github.com/flutter/flutter/issues/91772).
  ///
  ///  * Flutter themes created with `ThemeData.from` does not define any color
  ///    scheme related color for the `primaryColorDark` color, FCS does.
  ///    See issue: https:///github.com/flutter/flutter/issues/65782.
  ///    The `ThemeData.from` leaves this color at `ThemeData` factory default
  ///    this may not match your scheme. Widgets seldom use this color, so the
  ///    issue is rarely seen.
  ///    This color property will be deprecated in Flutter, see issue
  ///    [91772](https://github.com/flutter/flutter/issues/91772).
  ///
  ///  * Flutter themes created with `ThemeData.from` does not define any color
  ///    scheme related color for the `primaryColorDark` color, FCS does.
  ///    See issue: https:///github.com/flutter/flutter/issues/65782.
  ///    `ThemeData.from` leaves this color at `ThemeData` factory default this
  ///    may not match your scheme. Widgets seldom use this color, so the issue
  ///    is rarely seen.
  ///    This color property will be deprecated in Flutter, see issue
  ///    [91772](https://github.com/flutter/flutter/issues/91772).
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
  ///  * The `AppBarTheme` M2 elevation defaults to 0, an iOs style influenced
  ///    opinionated choice. It can easily be adjusted directly in the
  ///    `FlexColorScheme` definition with property value `appBarElevation`
  ///    without creating a sub theme or using `copyWith`.
  ///
  ///  * The `bottomAppBarColor` uses color scheme background color to match the
  ///    background color of the drawer, bottom navigation bar, possible side
  ///    menu and system navigation bar on android (if theming of it is used).
  ///    This is a slight change from the ColorScheme default that uses
  ///    surface color.
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
  ///    dark-mode, but they are very similar. These legacy buttons are
  ///    deprecated in Flutter and some no longer exists. The `buttonTheme` is
  ///    also on a deprecation path and will be removed when it is.
  ///
  ///  * In older Flutter version, the default theme for Chips contained a
  ///    design bug that makes the selected `ChoiceChip()` widget look
  ///    disabled in dark-mode, regardless of if it was created with `ThemeData`
  ///    or `ThemeData.from` factory. See issue:
  ///    https:///github.com/flutter/flutter/issues/65663
  ///    The [ChipThemeData] modification originally used in core
  ///    FlexColorScheme fixed the issue. The issue has been resolved but
  ///    same [ChipThemeData] is still in use for backward style compatibility.
  ///
  /// * For [TabBarTheme], in M2 the Flutter standard selected tab and indicator
  ///   color is onSurface in dark mode and on Primary in light mode, which is
  ///   designed to fit an AppBar colored TabBar. This is kept, and the default
  ///   via [FlexTabBarStyle.forAppBar] style, with a minor modification. If
  ///   AppBar is "light", then black87 is used, not black, it is the same as
  ///   the textTheme on AppBar in light app bar brightness.
  ///   If the [FlexTabBarStyle.forBackground] style was used, the
  ///   selected  color is always color scheme primary color, which works well
  ///   on surface, background and scaffold background colors. When using M3
  ///   the [FlexTabBarStyle.flutterDefault] is used. producing a TabBar with
  ///   the default M3 design.
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
  /// * The [ListTileThemeData] is added to core defaults and it sets
  ///   [ListTileThemeData.tileColor] to [Colors.transparent] if
  ///   [ThemeData.useMaterial3] is true. This is done to avoid issue:
  ///   https://github.com/flutter/flutter/issues/117700. This extra M3 core
  ///   default theme fix may be removed when the issue is fixed.
  ///
  /// * The [BottomNavigationBarThemeData] uses color scheme primary color for
  ///   the selected item in both light and dark theme. Flutter SDK defaults
  ///   to secondary color in dark mode. Using only primary color
  ///   is a design used on iOS by default for the bottom navigation bar. We
  ///   agree and think it looks better as the default choice for apps also
  ///   in dark mode.
  ///
  /// * The [ToolTipThemeData] will when [tooltipsMatchBackground] is set to
  ///   true, make tooltip background color will match the brightness of
  ///   the theme's background color.
  ///
  /// By default Flutter's Material tooltips use a theme where the tooltip
  /// background color brightness is inverted in relation to the overall
  /// theme's background color.
  ///
  /// [FlexColorScheme] allows you to use a single toggle to invert this.
  /// Light tooltips on light background is e.g. the default style on
  /// Windows Desktop toggle. You can use this toggle to use this style,
  /// or use it as a means to create a platform adaptive tooltip style, where
  /// the Material and Flutter style is used on devices and Web, but the
  /// inverted scheme is used on e.g. Windows platform.
  ///
  /// Defaults to false, and uses same background style as Material Design
  /// guide and Flutter.
  ///
  /// Additional tooltip styles when NOT opting in on FlexColorScheme sub
  /// themes are:
  ///
  /// - tooltipsMatchBackground: false
  ///   - none
  ///
  /// - tooltipsMatchBackground: true
  ///   - light theme:
  ///     - background: Color(0xF0FCFCFC),
  ///     - text: black
  ///   - Dark theme:
  ///     - background: Color(0xED444444),
  ///     - text: white
  ///   - Border radius: 4 dp
  ///   - Border: Yes, dividerColor
  ///   - Desktop OS (macOS, Linux, Windows)
  ///     - Font size : 12 dp
  ///   - Mobile OS (iOS, Android, Fuchsia)
  ///     - Font size : 14 dp
  ///
  /// Additional styles when opting in on FlexColorScheme sub themes are:
  ///
  /// - Desktop OS (macOS, Linux, Windows)
  ///   - Font size : 12 dp
  /// - Mobile OS (iOS, Android, Fuchsia)
  ///   - Font size : 14 dp
  /// - Border radius: 8 dp
  /// - Border: Yes, dividerColor
  /// - tooltipsMatchBackground: false
  ///   - light theme:
  ///     - background: Color(0xFF111111).blendAlpha(primary, 45%) opacity 95%
  ///     - text: white
  ///   - Dark theme:
  ///     - background: Color(0xFFFFFFFF).blendAlpha(primary, 39%) opacity 95%
  ///     - text: black
  /// - tooltipsMatchBackground: true
  ///   - light theme:
  ///     - background:  Color(0xFFFFFFFF).blendAlpha(primary, 4%) opacity 95%
  ///     - text: black
  ///   - Dark theme:
  ///     - background: Color(0xFF111111).blendAlpha(primary, 16%) opacity 95%
  ///     - text: white
  ///
  /// When using additional theming via sub-themes properties, its
  /// properties will if used override background color, text color and
  /// background opacity as well as border radius.
  ///
  /// ---
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
    // Returns true if the color is dark, it needs light text for contrast.
    bool isColorDark(final Color color) =>
        ThemeData.estimateBrightnessForColor(color) == Brightness.dark;

    // On color used when a color property does not have a theme onColor.
    Color onColor(final Color color) =>
        isColorDark(color) ? Colors.white : Colors.black;

    // Use sub-themes if a none null FlexSubThemesData was passed in.
    final bool useSubThemes = subThemesData != null;
    // If we did not have any sub-theme data, we make one instead that cannot
    // be null. It makes the logic easier to deal with when we create
    // sub-themes, when it cannot be nullable.
    final FlexSubThemesData subTheme =
        subThemesData ?? const FlexSubThemesData();

    // Get the effective ColorScheme from the provided brightness and
    // provided or computed or default colors.
    final ColorScheme colorScheme = toScheme;

    // A convenience bool to check if this theme is for light or dark mode
    final bool isDark = colorScheme.brightness == Brightness.dark;

    // Use passed in target platform, else use actual host platform.
    final TargetPlatform effectivePlatform = platform ?? defaultTargetPlatform;

    // Remove elevation tint in M3?
    final FlexAdaptive subTint =
        subTheme.adaptiveRemoveElevationTint ?? const FlexAdaptive.off();
    final bool removeTint = useMaterial3 && subTint.adapt(effectivePlatform);

    // Use elevation shadow in M3?
    final FlexAdaptive subShadow =
        subTheme.adaptiveElevationShadowsBack ?? const FlexAdaptive.off();
    final bool useShadow = useMaterial3 && subShadow.adapt(effectivePlatform);

    // No AppBar scroll under elevation tint
    final FlexAdaptive scrollUnderOff =
        subTheme.adaptiveAppBarScrollUnderOff ?? const FlexAdaptive.off();
    final bool noScrollUnder =
        useMaterial3 && scrollUnderOff.adapt(effectivePlatform);

    // Use defaultRadiusAdaptive instead of defaultRadius?
    final FlexAdaptive adaptiveRadius =
        subTheme.adaptiveRadius ?? const FlexAdaptive.off();
    // Get the correct platform default radius.
    final double? platformRadius = adaptiveRadius.adapt(effectivePlatform)
        ? subTheme.defaultRadiusAdaptive
        : subTheme.defaultRadius;

    // Use adaptive dialog radius?
    final FlexAdaptive adaptiveDialogRadius =
        subTheme.adaptiveDialogRadius ?? const FlexAdaptive.off();
    // Get the correct adaptive dialog default radius.
    final double? platformDialogRadius =
        adaptiveDialogRadius.adapt(effectivePlatform)
            ? subTheme.dialogRadiusAdaptive
            : subTheme.dialogRadius;

    // Logic to determine the default Typography to use.
    //
    // Used Typography deviates from the Flutter standard that _still_ uses the
    // old Typography.material2014 in favor of the newer Typography.material2018
    // as default in M2, if one is not provided. We use the Material 2 correct
    // 2018 typography as the default when not using M3. If using M3 or
    // opting-in via sub-themes on using M3 TextTheme geometry, the new 2021
    // Typography is used that was released in Flutter 3.0.0.
    //
    // A little know thing Typography.material2021 factory also needs the used
    // M3 colorscheme for a correct style.
    Typography defaultTypography() {
      // ignore: use_if_null_to_convert_nulls_to_bools
      if (useSubThemes && subTheme.useTextTheme == true) {
        return Typography.material2021(
            platform: effectivePlatform, colorScheme: colorScheme);
      }
      if (useSubThemes && subTheme.useTextTheme == null && useMaterial3) {
        return Typography.material2021(
            platform: effectivePlatform, colorScheme: colorScheme);
      }
      if (!useSubThemes && useMaterial3) {
        return Typography.material2021(
            platform: effectivePlatform, colorScheme: colorScheme);
      }
      return Typography.material2018(platform: effectivePlatform);
    }

    final Typography effectiveTypography = typography ?? defaultTypography();
    // We need the text themes locally for the theming, so we must form them
    // fully using the same process that the ThemeData() factory uses.
    TextTheme defText =
        isDark ? effectiveTypography.white : effectiveTypography.black;
    final bool primaryIsDark = isColorDark(colorScheme.primary);
    TextTheme defPrimaryText =
        primaryIsDark ? effectiveTypography.white : effectiveTypography.black;

    // ThemeData uses this to apply a font from fontFamily, fontFamilyFallback
    // and package in this order to default text theme and primary text theme.
    // We excluded the accent text theme since it is deprecated, Flutter SDK
    // still applies font to it as well, not sure why it is kept around.
    // This all works OK, but it resets all typography and it uses regular style
    // and weight for all styles in the text theme. Consider defining the text
    // theme explicitly via textTheme and primaryTextTheme with the custom
    // font applied, at least if you want to use custom fonts and keep the
    // standard typography, or supply your own complete typography with your
    // custom text theme.
    if (fontFamily != null) {
      defText = defText.apply(fontFamily: fontFamily);
      defPrimaryText = defPrimaryText.apply(fontFamily: fontFamily);
    }
    if (fontFamilyFallback != null) {
      defText = defText.apply(fontFamilyFallback: fontFamilyFallback);
      defPrimaryText =
          defPrimaryText.apply(fontFamilyFallback: fontFamilyFallback);
    }
    if (package != null) {
      defText = defText.apply(package: package);
      defPrimaryText = defPrimaryText.apply(package: package);
    }

    // TextTheme is a default GoogleFonts TextTheme.
    //
    // Let's take a look at provided TextTheme, if it is a match for a
    // GoogleFont TextTheme, remove its default colors so we can make one with
    // correct M2/M3 defaults.
    TextTheme? pTextTheme = textTheme;
    if (pTextTheme != null) {
      final TextTheme gFontTextTheme = ThemeData.light().textTheme.apply(
        fontFamily: '',
        fontFamilyFallback: <String>[''],
      );
      final TextTheme passedTextTheme = pTextTheme.apply(
        fontFamily: '',
        fontFamilyFallback: <String>[''],
      );
      if (gFontTextTheme == passedTextTheme) {
        pTextTheme = TextThemeColor.nullFontColor(pTextTheme);
      }
    }
    // Make default TextThemes, by also merging in the two TextThemes
    // passed in via the constructor. The 2nd copyWith, ensures putting back
    // correct contrast color on any passed in text theme. FCS does not
    // require defining correct contrast colors for light/dark mode text theme,
    // nor for the primary color contrast text theme. It always fixes them
    // to be correct and also uses correct opacities on M2 typography, and
    // opaque ones on M3 typography, regardless of used M2/M3 mode.
    defText = defText.merge(pTextTheme);

    // TextTheme is a default GoogleFonts TextTheme.
    //
    // Let's take a look at provided TextTheme, if it is a match for a
    // GoogleFont TextTheme, remove its default colors so we can make one with
    // correct M2/M3 defaults.
    TextTheme? pPrimTextTheme = primaryTextTheme;
    if (pPrimTextTheme != null) {
      final TextTheme gFontTextTheme = ThemeData.light().textTheme.apply(
        fontFamily: '',
        fontFamilyFallback: <String>[''],
      );
      final TextTheme passedTextTheme = pPrimTextTheme.apply(
        fontFamily: '',
        fontFamilyFallback: <String>[''],
      );
      if (gFontTextTheme == passedTextTheme) {
        pPrimTextTheme = TextThemeColor.nullFontColor(pPrimTextTheme);
      }
    }
    // Equivalent text theme and color correct for primary TextTheme that will
    // always get correct contrast color to be used on primary color.
    defPrimaryText = defPrimaryText.merge(pPrimTextTheme);

    // We are using sub themes and blend colors on text themes. If surfaces and
    // background are not set to use blends, the effect will be slightly
    // different, a bit less colorful, but only very marginally.
    if (useSubThemes && subTheme.blendTextTheme) {
      // Calculate colors for the different TextStyles, color blend strength are
      // inline with opacities on the 2014/2018/2021 typographies.
      // For main text theme we are using surface tint instead of primary,
      // normally it defaults to primary, but if it is customized we should base
      // tinted text theme on it instead.
      Color blendText(Color? color, int blend, int alpha) {
        final Color baseColor = color ?? (isDark ? Colors.white : Colors.black);
        return baseColor.blend(colorScheme.surfaceTint, blend).withAlpha(alpha);
      }

      // The tinted text theme is based of white/black, but if a custom color
      // was provided, it is based of it and tinted with surfaceTint.
      final Color cDisplayLarge = isDark // SDK dark 70%, light 54%
          ? blendText(pTextTheme?.displayLarge?.color, kHiDarkTextBlend,
              kHiDarkTextAlpha) // 92%
          : blendText(pTextTheme?.displayLarge?.color, kHiLightTextBlend,
              kHiLightTextAlpha); // 85%
      final Color cDisplayMedium = isDark // SDK dark 70%, light 54%
          ? blendText(pTextTheme?.displayMedium?.color, kHiDarkTextBlend,
              kHiDarkTextAlpha) // 92%
          : blendText(pTextTheme?.displayMedium?.color, kHiLightTextBlend,
              kHiLightTextAlpha); // 85%
      final Color cDisplaySmall = isDark // SDK dark 70%, light 54%
          ? blendText(pTextTheme?.displaySmall?.color, kHiDarkTextBlend,
              kHiDarkTextAlpha) // 92%
          : blendText(pTextTheme?.displaySmall?.color, kHiLightTextBlend,
              kHiLightTextAlpha); // 85%
      //
      final Color cHeadlineLarge = isDark // SDK dark 70%, light 54%
          ? blendText(pTextTheme?.headlineLarge?.color, kHiDarkTextBlend,
              kHiDarkTextAlpha) // 92%
          : blendText(pTextTheme?.headlineLarge?.color, kHiLightTextBlend,
              kHiLightTextAlpha); // 85%
      final Color cHeadlineMedium = isDark // SDK dark 70%, light 54%
          ? blendText(pTextTheme?.headlineMedium?.color, kHiDarkTextBlend,
              kHiDarkTextAlpha) // 92%
          : blendText(pTextTheme?.headlineMedium?.color, kHiLightTextBlend,
              kHiLightTextAlpha); // 85%
      final Color cHeadlineSmall = isDark // SDK dark 70%, light 54%
          ? blendText(pTextTheme?.headlineSmall?.color, kMedDarkTextBlend,
              kMedDarkTextAlpha) // 100%
          : blendText(pTextTheme?.headlineSmall?.color, kMedLightTextBlend,
              kMedLightTextAlpha); // 96%
      //
      final Color cTitleLarge = isDark // SDK dark 70%, light 54%
          ? blendText(pTextTheme?.titleLarge?.color, kMedDarkTextBlend,
              kMedDarkTextAlpha) // 100%
          : blendText(pTextTheme?.titleLarge?.color, kMedLightTextBlend,
              kMedLightTextAlpha); // 96%
      final Color cTitleMedium = isDark // SDK dark 70%, light 54%
          ? blendText(pTextTheme?.titleMedium?.color, kMedDarkTextBlend,
              kMedDarkTextAlpha) // 100%
          : blendText(pTextTheme?.titleMedium?.color, kMedLightTextBlend,
              kMedLightTextAlpha); // 96%
      final Color cTitleSmall = isDark // SDK dark 70%, light 54%
          ? blendText(pTextTheme?.titleSmall?.color, kLoDarkTextBlend,
              kLoDarkTextAlpha) // 100%
          : blendText(pTextTheme?.titleSmall?.color, kLoLightTextBlend,
              kLoLightTextAlpha); // 100%
      //
      final Color cBodyLarge = isDark // SDK dark 70%, light 54%
          ? blendText(pTextTheme?.bodyLarge?.color, kMedDarkTextBlend,
              kMedDarkTextAlpha) // 100%
          : blendText(pTextTheme?.bodyLarge?.color, kMedLightTextBlend,
              kMedLightTextAlpha); // 96%
      final Color cBodyMedium = isDark // SDK dark 70%, light 54%
          ? blendText(pTextTheme?.bodyMedium?.color, kMedDarkTextBlend,
              kMedDarkTextAlpha) // 100%
          : blendText(pTextTheme?.bodyMedium?.color, kMedLightTextBlend,
              kMedLightTextAlpha); // 96%
      final Color cBodySmall = isDark // SDK dark 70%, light 54%
          ? blendText(pTextTheme?.bodySmall?.color, kHiDarkTextBlend,
              kHiDarkTextAlpha) // 92%
          : blendText(pTextTheme?.bodySmall?.color, kHiLightTextBlend,
              kHiLightTextAlpha); // 85%
      //
      final Color cLabelLarge = isDark // SDK dark 70%, light 54%
          ? blendText(pTextTheme?.labelLarge?.color, kMedDarkTextBlend,
              kMedDarkTextAlpha) // 100%
          : blendText(pTextTheme?.labelLarge?.color, kMedLightTextBlend,
              kMedLightTextAlpha); // 96%
      final Color cLabelMedium = isDark // SDK dark 70%, light 54%
          ? blendText(pTextTheme?.labelMedium?.color, kLoDarkTextBlend,
              kLoDarkTextAlpha) // 100%
          : blendText(pTextTheme?.labelMedium?.color, kLoLightTextBlend,
              kLoLightTextAlpha); // 100%
      final Color cLabelSmall = isDark // SDK dark 70%, light 54%
          ? blendText(pTextTheme?.labelSmall?.color, kLoDarkTextBlend,
              kLoDarkTextAlpha) // 100%
          : blendText(pTextTheme?.labelSmall?.color, kLoLightTextBlend,
              kLoLightTextAlpha); // 100%

      // Apply the computed colors. With this opt-in style, text gets a hint
      // of primary and less opacity than defaults. The primary tint may
      // not work so well if you need to put text on a completely different
      // colored container than the background color. Which is why this
      // feature can be opted out of.
      // M3 has separate on colors for all colorscheme colors that can also
      // be used for color matched text on each container color.
      // This slightly primary colored default text works very well for the
      // slight primary colored M3 "neutral" surface colors that by default have
      // a primary tint too.
      defText = defText.copyWith(
        // The textHiOpacity color style group.
        displayLarge: defText.displayLarge!.copyWith(color: cDisplayLarge),
        displayMedium: defText.displayMedium!.copyWith(color: cDisplayMedium),
        displaySmall: defText.displaySmall!.copyWith(color: cDisplaySmall),
        headlineLarge: defText.headlineLarge!.copyWith(color: cHeadlineLarge),
        headlineMedium:
            defText.headlineMedium!.copyWith(color: cHeadlineMedium),
        bodySmall: defText.bodySmall!.copyWith(color: cBodySmall),
        // The textMediumOpacity color style group.
        headlineSmall: defText.headlineSmall!.copyWith(color: cHeadlineSmall),
        titleLarge: defText.titleLarge!.copyWith(color: cTitleLarge),
        titleMedium: defText.titleMedium!.copyWith(color: cTitleMedium),
        bodyLarge: defText.bodyLarge!.copyWith(color: cBodyLarge),
        bodyMedium: defText.bodyMedium!.copyWith(color: cBodyMedium),
        labelLarge: defText.labelLarge!.copyWith(color: cLabelLarge),
        // The textNoOpacity color style group.
        titleSmall: defText.titleSmall!.copyWith(color: cTitleSmall),
        labelMedium: defText.labelMedium!.copyWith(color: cLabelMedium),
        labelSmall: defText.labelSmall!.copyWith(color: cLabelSmall),
      );

      // Calculate colors for the different TextStyles, color blend strength are
      // inline with opacities on the 2014/2018/2021 typographies.
      // For main text theme we are using surface tint instead of primary,
      // normally it defaults to primary, but if it is customized we should base
      // tinted text theme on it instead.
      Color blendPrimText(Color? color, int blend, int alpha) {
        final Color baseColor =
            color ?? (primaryIsDark ? Colors.white : Colors.black);
        return baseColor.blend(colorScheme.primary, blend).withAlpha(alpha);
      }

      // The tinted text theme is based of white/black, but if a custom color
      // was provided, it is based of it and tinted with surfaceTint.
      final Color cPrimDisplayLarge = primaryIsDark // SDK dark 70%, light 54%
          ? blendPrimText(pPrimTextTheme?.displayLarge?.color,
              kHiDarkPrimTextBlend, kHiDarkPrimTextAlpha) // 90%
          : blendPrimText(pPrimTextTheme?.displayLarge?.color,
              kHiLightPrimTextBlend, kHiLightPrimTextAlpha); // 85%
      final Color cPrimDisplayMedium = primaryIsDark // SDK dark 70%, light 54%
          ? blendPrimText(pPrimTextTheme?.displayMedium?.color,
              kHiDarkPrimTextBlend, kHiDarkPrimTextAlpha) // 90%
          : blendPrimText(pPrimTextTheme?.displayMedium?.color,
              kHiLightPrimTextBlend, kHiLightPrimTextAlpha); // 85%
      final Color cPrimDisplaySmall = primaryIsDark // SDK dark 70%, light 54%
          ? blendPrimText(pPrimTextTheme?.displaySmall?.color,
              kHiDarkPrimTextBlend, kHiDarkPrimTextAlpha) // 90%
          : blendPrimText(pPrimTextTheme?.displaySmall?.color,
              kHiLightPrimTextBlend, kHiLightPrimTextAlpha); // 85%
      //
      final Color cPrimHeadlineLarge = primaryIsDark // SDK dark 70%, light 54%
          ? blendPrimText(pPrimTextTheme?.headlineLarge?.color,
              kHiDarkPrimTextBlend, kHiDarkPrimTextAlpha) // 90%
          : blendPrimText(pPrimTextTheme?.headlineLarge?.color,
              kHiLightPrimTextBlend, kHiLightPrimTextAlpha); // 85%
      final Color cPrimHeadlineMedium = primaryIsDark // SDK dark 70%, light 54%
          ? blendPrimText(pPrimTextTheme?.headlineMedium?.color,
              kHiDarkPrimTextBlend, kHiDarkPrimTextAlpha) // 90%
          : blendPrimText(pPrimTextTheme?.headlineMedium?.color,
              kHiLightPrimTextBlend, kHiLightPrimTextAlpha); // 85%
      final Color cPrimHeadlineSmall = primaryIsDark // SDK dark 70%, light 54%
          ? blendPrimText(pPrimTextTheme?.headlineSmall?.color,
              kMedDarkPrimTextBlend, kMedDarkPrimTextAlpha) // 100%
          : blendPrimText(pPrimTextTheme?.headlineSmall?.color,
              kMedLightPrimTextBlend, kMedLightPrimTextAlpha); // 95%
      //
      final Color cPrimTitleLarge = primaryIsDark // SDK dark 70%, light 54%
          ? blendPrimText(pPrimTextTheme?.titleLarge?.color,
              kMedDarkPrimTextBlend, kMedDarkPrimTextAlpha) // 100%
          : blendPrimText(pPrimTextTheme?.titleLarge?.color,
              kMedLightPrimTextBlend, kMedLightPrimTextAlpha); // 95%
      final Color cPrimTitleMedium = primaryIsDark // SDK dark 70%, light 54%
          ? blendPrimText(pPrimTextTheme?.titleMedium?.color,
              kMedDarkPrimTextBlend, kMedDarkPrimTextAlpha) // 100%
          : blendPrimText(pPrimTextTheme?.titleMedium?.color,
              kMedLightPrimTextBlend, kMedLightPrimTextAlpha); // 95%
      final Color cPrimTitleSmall = primaryIsDark // SDK dark 70%, light 54%
          ? blendPrimText(pPrimTextTheme?.titleSmall?.color,
              kLoDarkPrimTextBlend, kLoDarkPrimTextAlpha) // 100%
          : blendPrimText(pPrimTextTheme?.titleSmall?.color,
              kLoLightPrimTextBlend, kLoLightPrimTextAlpha); // 100%
      //
      final Color cPrimBodyLarge = primaryIsDark // SDK dark 70%, light 54%
          ? blendPrimText(pPrimTextTheme?.bodyLarge?.color,
              kMedDarkPrimTextBlend, kMedDarkPrimTextAlpha) // 100%
          : blendPrimText(pPrimTextTheme?.bodyLarge?.color,
              kMedLightPrimTextBlend, kMedLightPrimTextAlpha); // 95%
      final Color cPrimBodyMedium = primaryIsDark // SDK dark 70%, light 54%
          ? blendPrimText(pPrimTextTheme?.bodyMedium?.color,
              kMedDarkPrimTextBlend, kMedDarkPrimTextAlpha) // 100%
          : blendPrimText(pPrimTextTheme?.bodyMedium?.color,
              kMedLightPrimTextBlend, kMedLightPrimTextAlpha); // 95%
      final Color cPrimBodySmall = primaryIsDark // SDK dark 70%, light 54%
          ? blendPrimText(pPrimTextTheme?.bodySmall?.color,
              kHiDarkPrimTextBlend, kHiDarkPrimTextAlpha) // 92%
          : blendPrimText(pPrimTextTheme?.bodySmall?.color,
              kHiLightPrimTextBlend, kHiLightPrimTextAlpha); // 85%
      //
      final Color cPrimLabelLarge = primaryIsDark // SDK dark 70%, light 54%
          ? blendPrimText(pPrimTextTheme?.labelLarge?.color,
              kMedDarkPrimTextBlend, kMedDarkPrimTextAlpha) // 100%
          : blendPrimText(pPrimTextTheme?.labelLarge?.color,
              kMedLightPrimTextBlend, kMedLightPrimTextAlpha); // 95%
      final Color cPrimLabelMedium = primaryIsDark // SDK dark 70%, light 54%
          ? blendPrimText(pPrimTextTheme?.labelMedium?.color,
              kLoDarkPrimTextBlend, kLoDarkPrimTextAlpha) // 100%
          : blendPrimText(pPrimTextTheme?.labelMedium?.color,
              kLoLightPrimTextBlend, kLoLightPrimTextAlpha); // 100%
      final Color cPrimLabelSmall = primaryIsDark // SDK dark 70%, light 54%
          ? blendPrimText(pPrimTextTheme?.labelSmall?.color,
              kLoDarkPrimTextBlend, kLoDarkPrimTextAlpha) // 100%
          : blendPrimText(pPrimTextTheme?.labelSmall?.color,
              kLoLightPrimTextBlend, kLoLightPrimTextAlpha); // 100%
      // Equivalent blend text styles for primary text theme.
      defPrimaryText = defPrimaryText.copyWith(
        // The primeHiOpacity color style group.
        displayLarge:
            defPrimaryText.displayLarge!.copyWith(color: cPrimDisplayLarge),
        displayMedium:
            defPrimaryText.displayMedium!.copyWith(color: cPrimDisplayMedium),
        displaySmall:
            defPrimaryText.displaySmall!.copyWith(color: cPrimDisplaySmall),
        headlineLarge:
            defPrimaryText.headlineLarge!.copyWith(color: cPrimHeadlineLarge),
        headlineMedium:
            defPrimaryText.headlineMedium!.copyWith(color: cPrimHeadlineMedium),
        bodySmall: defPrimaryText.bodySmall!.copyWith(color: cPrimBodySmall),
        // The primeMediumOpacity color style group.
        headlineSmall:
            defPrimaryText.headlineSmall!.copyWith(color: cPrimHeadlineSmall),
        titleLarge: defPrimaryText.titleLarge!.copyWith(color: cPrimTitleLarge),
        titleMedium:
            defPrimaryText.titleMedium!.copyWith(color: cPrimTitleMedium),
        bodyLarge: defPrimaryText.bodyLarge!.copyWith(color: cPrimBodyLarge),
        bodyMedium: defPrimaryText.bodyMedium!.copyWith(color: cPrimBodyMedium),
        labelLarge: defPrimaryText.labelLarge!.copyWith(color: cPrimLabelLarge),
        // The primeNoOpacity color style group.
        titleSmall: defPrimaryText.titleSmall!.copyWith(color: cPrimTitleSmall),
        labelMedium:
            defPrimaryText.labelMedium!.copyWith(color: cPrimLabelMedium),
        labelSmall: defPrimaryText.labelSmall!.copyWith(color: cPrimLabelSmall),
      );
    }
    // Assigning results to effective text themes. In older versions a merge
    // of original text themes were done here, but that is incorrect. It should
    // be earlier above, where it is now. In principle we could use the "def"
    // text themes further below in the code. But using the past final copies
    // for now to indicate nothing more can or should be done to them.
    final TextTheme effectiveTextTheme = defText;
    final TextTheme effectivePrimaryTextTheme = defPrimaryText;

    // Custom computed shades from primary color using alpha blends works well
    // for these rarely used colors that are on deprecation path in Flutter SDK.
    // https://github.com/flutter/flutter/issues/91772
    final Color primaryColorDark = isDark
        ? colorScheme.primary.blend(Colors.black, 45)
        : colorScheme.primary.blend(Colors.black, 40);
    final Color primaryColorLight = isDark
        ? colorScheme.primary.blend(Colors.white, 35)
        : colorScheme.primary.blend(Colors.white, 40);
    final Color secondaryHeaderColor = isDark
        ? colorScheme.primary.blend(Colors.black, 60)
        : colorScheme.primary.blend(Colors.white, 80);

    // AppBar background color:
    // - If a color is passed in, that is used first. If light/dark factory
    //   created a none default background or with transparency, this will
    //   be the case
    // - If we use sub-themes, with this raw constructor, we use its scheme
    //   based color.
    // - If neither was given and M2 we use the surface color in dark mode and
    //   primary color in light mode, the same logic that Flutter SDK
    //   ThemeData.from factory sets the AppBar background color in M2, in
    //   M3 we always use surface color.
    final Color effectiveAppBarBackgroundColor = appBarBackground ??
        (useSubThemes && subTheme.appBarBackgroundSchemeColor != null
            ? FlexSubThemes.schemeColor(
                subTheme.appBarBackgroundSchemeColor!, colorScheme)
            : useMaterial3
                ? colorScheme.surface
                : isDark
                    ? colorScheme.surface
                    : colorScheme.primary);
    final Brightness appBarBrightness =
        ThemeData.estimateBrightnessForColor(effectiveAppBarBackgroundColor);
    Color appBarForeground =
        appBarBrightness == Brightness.dark ? Colors.white : Colors.black;
    // Icons are slightly black  transparent in light mode! This per SDK.
    Color appBarIconColor =
        appBarBrightness == Brightness.dark ? Colors.white : Colors.black87;
    // If we are using subThemes and blend text, use it for the AppBar text too.
    if (useSubThemes && subTheme.blendTextTheme) {
      if (appBarBrightness == Brightness.dark) {
        appBarForeground =
            FlexColor.lightSurface.blend(effectiveAppBarBackgroundColor, 12);
      } else {
        appBarForeground =
            FlexColor.darkSurface.blend(effectiveAppBarBackgroundColor, 12);
      }
      appBarIconColor = appBarForeground;
    }

    // The FlexColorScheme AppBar's customizable system UI overlay style.
    // This refers to the top status bar on Android and iOS. Some features
    // only apply to Android. These settings have no effect on other platforms
    // than Android and iOS.
    final SystemUiOverlayStyle systemOverlayStyle = SystemUiOverlayStyle(
      systemStatusBarContrastEnforced: false,
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

      // TODO(rydmike): Monitor sys-nav AppBar systemOverlayStyle issue.
      // It would be useful if we could set system navbar properties too and not
      // only status bar properties. While it might be odd to do so, it
      // seems even more odd that a part of the SystemUiOverlayStyle has
      // no effect when used here.
      // See https://github.com/flutter/flutter/issues/104410
      // and https://github.com/flutter/flutter/issues/100027#issuecomment-1077697819
      // PR: https://github.com/flutter/flutter/pull/104827
      // The systemNavigationBarColor used by default AppBar in SDK is
      // always black, like so:
      // systemNavigationBarColor: const Color(0xFF000000),
      // If we try to set it to scheme background instead in AppBar theme, it
      // does not do anything, result will be black anyway.
      systemNavigationBarColor: colorScheme.background,
      // The systemNavigationBarIconBrightness used by the AppBar in SDK, is
      // always light, for the black background it get, like so:
      // systemNavigationBarIconBrightness: Brightness.light,
      // We try to match it to the color of our scheme background, but we
      // always get the light ones anyway, which is fine, as long as the
      // system navbar remains black anyway.
      systemNavigationBarIconBrightness:
          isDark ? Brightness.light : Brightness.dark,
      // Keeping the above system navbar changes, even if they up to at
      // least Flutter 2.10.3 did not do anything, maybe they start to
      // work one day, then we do not not need an AnnotatedRegion for it
      // anymore but can get it via AppBar theme, the way it should work.
      // The systemNavigationBarDividerColor used by default AppBar in SDK:
      systemNavigationBarDividerColor: null,
      systemNavigationBarContrastEnforced: false,
    );

    // Selected TabBar color is based on FlexTabBarStyle tabBarStyle.
    // The `flutterDefault` sets values corresponding to SDK Default behavior,
    // it can be used, but is not as useful as the `forAppBar` version which
    // is the default here.
    final FlexTabBarStyle effectiveTabBarStyle = tabBarStyle ??
        (useMaterial3
            ? FlexTabBarStyle.flutterDefault
            : FlexTabBarStyle.forAppBar);
    Color tabBarStyleColor() {
      switch (effectiveTabBarStyle) {
        case FlexTabBarStyle.flutterDefault:
          return useMaterial3
              ? colorScheme.primary
              : isDark
                  ? Colors.white
                  : colorScheme.onPrimary;
        case FlexTabBarStyle.forBackground:
          return colorScheme.primary;
        case FlexTabBarStyle.forAppBar:
          return appBarBrightness == Brightness.light
              ? Colors.black87
              : Colors.white;
        case FlexTabBarStyle.universal:
          // TODO(rydmike): Chore: Better FlexTabBarStyle.universal algo?
          //   Maybe try a contrasting color from tonal palettes? Might work if
          //   using seeded color scheme, but not necessarily otherwise.
          return isDark
              ? colorScheme.primary.blendAlpha(Colors.white, 0xE6) // 90%
              : colorScheme.primary.blendAlpha(Colors.white, 0xB2); // 50%
      }
    }

    // Unselected TabBar color is based on FexTabBarStyle tabBarStyle.
    // The `flutterDefault` sets values corresponding to SDK Default behavior.
    Color unselectedTabColor() {
      switch (effectiveTabBarStyle) {
        case FlexTabBarStyle.flutterDefault:
          return useMaterial3
              ? colorScheme.onSurface
              : tabBarStyleColor().withAlpha(0xB2); // 70%
        case FlexTabBarStyle.forBackground:
          return useSubThemes
              ? colorScheme.onSurface
                  .blendAlpha(colorScheme.primary,
                      kUnselectedBackgroundPrimaryAlphaBlend)
                  .withAlpha(kUnselectedAlphaBlend)
              : colorScheme.onSurface.withAlpha(0x99); // 60%
        case FlexTabBarStyle.forAppBar:
          return (appBarBrightness == Brightness.light &&
                  (effectiveAppBarBackgroundColor == Colors.white ||
                      effectiveAppBarBackgroundColor == colorScheme.surface ||
                      effectiveAppBarBackgroundColor == colorScheme.background))
              ? colorScheme.onSurface.withAlpha(0x99) // 60%
              : tabBarStyleColor().withAlpha(0xB2); // 70% alpha
        case FlexTabBarStyle.universal:
          return isDark
              ? colorScheme.primary
                  .blendAlpha(Colors.white, 0xE6) // 90%
                  .withAlpha(0xB2) // 70% alpha
              : colorScheme.primary
                  .blendAlpha(Colors.white, 0x7F)
                  .withAlpha(0x7F); // 50%
      }
    }

    // TabBar unselected alpha based opacity, effective value;
    final int tabBarUnselectedAlpha = Color.getAlphaFromOpacity(useMaterial3
        ? subTheme.tabBarUnselectedItemOpacity ?? 1
        : subTheme.tabBarUnselectedItemOpacity ?? 0.7);

    // Platform adjusting font size for tooltips.
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

    // Tooltip background defaults logic.
    Color? tooltipBackground() {
      if (useSubThemes && subTheme.tooltipSchemeColor != null) return null;
      if (useSubThemes && tooltipsMatchBackground) {
        if (isDark) {
          // 16% blend
          return FlexColor.darkSurface.blendAlpha(colorScheme.primary, 0x28);
        }
        // 4% blend
        return FlexColor.lightSurface.blendAlpha(colorScheme.primary, 0x0A);
      }
      if (useSubThemes && !tooltipsMatchBackground) {
        if (isDark) {
          // 39% blend
          return FlexColor.lightSurface.blendAlpha(colorScheme.primary, 0x63);
        }
        // 45% blend
        return FlexColor.darkSurface.blendAlpha(colorScheme.primary, 0x72);
      }
      if (!useSubThemes && tooltipsMatchBackground) {
        if (isDark) return const Color(0xFF444444);
        return const Color(0xFFFCFCFC);
      }
      return null;
    }

    // Tooltip foreground colors, defaults logic.
    Color? tooltipForeground() {
      if (useSubThemes && subTheme.tooltipSchemeColor != null) return null;
      if (tooltipsMatchBackground) {
        if (isDark) return Colors.white;
        return Colors.black;
      } else {
        if (isDark) return Colors.black;
        return Colors.white;
      }
    }

    // Tooltip opacity via alpha values, defaults logic.
    int? tooltipAlpha() {
      if (useSubThemes && subTheme.tooltipSchemeColor != null) {
        return Color.getAlphaFromOpacity(subTheme.tooltipOpacity ?? 1);
      }
      if (useSubThemes && tooltipsMatchBackground) {
        return 0xF2; // 95%
      }
      if (!useSubThemes && tooltipsMatchBackground) {
        if (isDark) return 0xED; // 93%
        return 0xF0; // 94%
      }
      return null;
    }

    // Tooltip border radius value;
    double? tooltipBorderRadius() {
      if (!useSubThemes) return 4; // Flutter SDK default
      return subTheme.tooltipRadius ?? kTooltipRadius; // FCS default
    }

    // FCS opinionated tinted semi transparent background color. Used as
    // background on SnackBar (default) and as an option on Slider value.
    Color tintedBackground({
      required Color background,
      required Color blend,
      required Brightness brightness,
    }) =>
        brightness == Brightness.dark
            ? background
                .blendAlpha(blend, 0x63) // 39%
                .withAlpha(0xF2) // 95%
            : background
                .blendAlpha(blend, 0x72) // 45%
                .withAlpha(0xED); // 93%

    // Effective and opinionated sliderValueIndicator color for themed Slider.
    final Color? sliderValueIndicator = subTheme.sliderValueTinted
        ? tintedBackground(
            background: colorScheme.onSurface,
            blend: FlexSubThemes.schemeColor(
                subTheme.sliderIndicatorSchemeColor ??
                    subTheme.sliderBaseSchemeColor ??
                    SchemeColor.primary,
                colorScheme),
            brightness: colorScheme.brightness)
        : subTheme.sliderIndicatorSchemeColor != null ||
                subTheme.sliderBaseSchemeColor != null
            ? FlexSubThemes.schemeColor(
                subTheme.sliderIndicatorSchemeColor ??
                    subTheme.sliderBaseSchemeColor ??
                    SchemeColor.primary,
                colorScheme)
            : null;
    final Color sliderValueStyleOnColor =
        onColor((sliderValueIndicator ?? colorScheme.primary).withAlpha(0xFF));
    final TextStyle? sliderValueStyle =
        subTheme.sliderIndicatorSchemeColor != null ||
                subTheme.sliderBaseSchemeColor != null
            ? effectiveTextTheme.labelMedium!
                .copyWith(color: sliderValueStyleOnColor)
            : null;

    // In M3 mode we use the new dividerColor colorScheme.outlineVariant,
    // unless useM2StyleDividerInM3 is set to true, if it is true
    // we use the M2 style also in M3.
    // If no sub theme usage and not M3 we use same style as in ThemeData.
    // The resulting Color is used by the old ThemeData.DividerColor and by
    // the newer DividerTheme. The tooltip theme also uses it for a discrete
    // outline border color.
    final Color dividerColor =
        (useMaterial3 && (useSubThemes && !subTheme.useM2StyleDividerInM3)) ||
                (useMaterial3 && !useSubThemes)
            ? colorScheme.outlineVariant
            : isDark
                ? const Color(0x1FFFFFFF) // White 12%
                : const Color(0x1F000000); // Black 12%

    // Use tinted interaction effects on hover, focus, highlight and splash?
    final bool tintedInteractions = useSubThemes && subTheme.interactionEffects;
    // Use tinted disabled color?
    final bool tintedDisabled = useSubThemes && subTheme.tintedDisabledControls;

    // Make the effective input decoration theme, by using FCS sub themes
    // if opted in, otherwise use pre v4 version as before. This decoration
    // theme is also passed into the TimePickerTheme, and DropdownMenu so we
    // get the same style used on them too.
    final InputDecorationTheme? effectiveInputDecorationTheme = useSubThemes
        // FCS V4 and later sub-theme based input decorator used.
        ? FlexSubThemes.inputDecorationTheme(
            colorScheme: colorScheme,
            baseSchemeColor: subTheme.inputDecoratorSchemeColor,
            borderSchemeColor: subTheme.inputDecoratorBorderSchemeColor,
            radius: subTheme.inputDecoratorRadius ?? platformRadius,
            borderType: subTheme.inputDecoratorBorderType,
            filled: subTheme.inputDecoratorIsFilled,
            fillColor: subTheme.inputDecoratorFillColor,
            backgroundAlpha: subTheme.inputDecoratorBackgroundAlpha,
            prefixIconSchemeColor: subTheme.inputDecoratorPrefixIconSchemeColor,
            focusedBorderWidth: subTheme.inputDecoratorFocusedBorderWidth ??
                subTheme.thickBorderWidth,
            focusedHasBorder: subTheme.inputDecoratorFocusedHasBorder,
            unfocusedBorderWidth:
                subTheme.inputDecoratorBorderWidth ?? subTheme.thinBorderWidth,
            unfocusedHasBorder: subTheme.inputDecoratorUnfocusedHasBorder,
            unfocusedBorderIsColored:
                subTheme.inputDecoratorUnfocusedBorderIsColored,
            tintedInteractions: tintedInteractions,
            tintedDisabled: tintedDisabled,
            useMaterial3: useMaterial3,
          )
        : useMaterial3
            // In M3 if not using sub themes, use default InputDecorationTheme.
            ? null
            // Default decorator in M2 is a bit opinionated, this is the legacy
            // FCS default one in all previous versions before version 4.0.0.
            // Kept for backwards defaults compatibility. Used when not using
            // opinionated component sub-themes in M2 mode.
            : InputDecorationTheme(
                filled: subTheme.inputDecoratorIsFilled,
                fillColor: isDark
                    ? colorScheme.primary.withAlpha(0x0F) // 6%
                    : colorScheme.primary.withAlpha(0x09), // 3.5%
              );

    // BottomSheet Colors and elevations.
    final Color bottomSheetColor = subTheme.bottomSheetBackgroundColor != null
        ? FlexSubThemes.schemeColor(
            subTheme.bottomSheetBackgroundColor!, colorScheme)
        : colorScheme.surface;
    final Color bottomSheetModalColor =
        subTheme.bottomSheetModalBackgroundColor != null
            ? FlexSubThemes.schemeColor(
                subTheme.bottomSheetModalBackgroundColor!, colorScheme)
            : colorScheme.surface;
    final double bottomSheetElevation = subTheme.bottomSheetElevation ??
        (useMaterial3 ? kBottomSheetElevation : kBottomSheetElevationM2);
    final double bottomSheetModalElevation =
        subTheme.bottomSheetModalElevation ??
            (useMaterial3
                ? kBottomSheetModalElevation
                : kBottomSheetModalElevationM2);

    // Popupmenu menu background Color and elevation.
    final double popupMenuElevation = subTheme.popupMenuElevation ??
        (useMaterial3 ? kPopupMenuM3Elevation : kPopupMenuM2Elevation);
    final Color? popupMenuBackgroundColor = subTheme.popupMenuOpacity == null
        ? subTheme.popupMenuSchemeColor == null
            ? null
            : FlexSubThemes.schemeColor(
                subTheme.popupMenuSchemeColor!,
                colorScheme,
              )
        : subTheme.popupMenuSchemeColor == null
            ? colorScheme.surface.withOpacity(subTheme.popupMenuOpacity!)
            : FlexSubThemes.schemeColor(
                subTheme.popupMenuSchemeColor!,
                colorScheme,
              ).withOpacity(subTheme.popupMenuOpacity!);

    // Return the ThemeData object defined by the FlexColorScheme
    // properties and the designed opinionated theme design choices.
    //
    // The used properties are sorted in the same order they are in
    // ThemeData factory. For sake of sanity, let's keep it that way.
    return ThemeData(
      // Some properties we just pass along to the standard ThemeData factory.
      // They are included in FlexColorScheme (FCS) so we do not have to
      // apply them via ThemeData copyWith separately for cases when we want
      // to use them in a FlexColorSchemes, which might often be the case. Some
      // of the values may be null and get defaults via the ThemeData() factory
      // som might pass along given value, which we may have used internally
      // in FlexColorScheme as well.
      //
      // Not all properties in ThemeData are included, if you need to modify
      // them, use copyWith on ThemeData returned by FCS.

      // GENERAL CONFIGURATION
      //
      // Elevation overlay on dark material elevation is used on dark themes
      // on surfaces when so requested in M2, applyElevationOverlayColor
      // defaults to true in FlexColorScheme themes, but you can turn it off.
      // Flutter ThemeData.from ColorScheme based themes also uses this by
      // default, but older ThemeData factories do not use it by default.
      // A correct Material 2 design should use it.
      applyElevationOverlayColor: isDark && applyElevationOverlayColor,
      extensions: extensions,
      // Input decoration theme.
      inputDecorationTheme: effectiveInputDecorationTheme,
      materialTapTargetSize: materialTapTargetSize,
      pageTransitionsTheme: pageTransitionsTheme,
      platform: effectivePlatform,
      useMaterial3: useMaterial3,
      visualDensity: visualDensity,

      // COLOR
      //
      // [colorScheme] is the preferred way to configure colors. The other color
      // properties (as well as primaryColorBrightness, and primarySwatch)
      // will gradually be phased out,
      // see https://github.com/flutter/flutter/issues/91772.
      //
      // Most color definitions below are very close to the ones used by the
      // Flutter factory ThemeData.from() for creating a theme from a
      // ColorScheme and TextTheme.
      brightness: colorScheme.brightness,
      // TODO(rydmike): Monitor Flutter SDK deprecation of canvasColor.
      canvasColor: colorScheme.background,
      // TODO(rydmike): Monitor Flutter SDK deprecation of cardColor.
      cardColor: colorScheme.surface,
      // Pass the from FlexColorScheme defined colorScheme to ThemeData
      // colorScheme. Newer standard Flutter sub-themes use the colorScheme
      // for their theming, and all sub themes will eventually be converted to
      // be based on the defined color scheme colors. FlexColorScheme passes
      // the scheme it has created to the colorScheme property in ThemeData.
      // More info here: https://flutter.dev/go/material-theme-system-updates
      colorScheme: colorScheme,
      // TODO(rydmike): Monitor Flutter SDK deprecation of dialogBackgroundColor
      // Flutter standard dialogBackgroundColor for color scheme based themes
      // uses colorScheme.background.
      // The FlexColorScheme.from() factory constructor uses passed in dialog
      // background color that is same as surface color if not defined, but
      // may also be any other other color.
      // If using surface blends that are not equal for all Material surface
      // backgrounds colors. There will be no elevation overlay color in dark
      // M2 mode, even if so configured.
      // Use dialogs with background color that equals theme
      // colorScheme.surface to ensure it gets elevation overlay color applied
      // in dark mode. See : https://github.com/flutter/flutter/issues/90353
      // The dialogBackgroundColor in ThemeData is going to be deprecated.
      dialogBackgroundColor: dialogBackground ?? colorScheme.surface,
      // TODO(rydmike): Monitor Flutter SDK deprecation of disabledColor.
      // Disabled color uses a different style when using tinted disabled.
      // effects, if not opted in same as before v4.0.0 = ThemeData default.
      disabledColor: tintedDisabled
          ? FlexSubThemes.tintedDisable(
              isDark ? Colors.white : Colors.black, colorScheme.primary)
          : null,
      // TODO(rydmike): Monitor Flutter SDK deprecation of dividerColor.
      dividerColor: dividerColor,

      // TODO(rydmike): Monitor Flutter SDK deprecation of interaction colors.
      // See: https://github.com/flutter/flutter/issues/91772
      // Special theming on hover, focus, highlight and splash, if opting in on
      // tintedInteractions, otherwise use ThemeData defaults by passing in null
      // and letting it assign its values.
      // TODO(rydmike): Monitor Flutter SDK deprecation of focusColor.
      focusColor: tintedInteractions
          ? FlexSubThemes.tintedFocused(
              isDark ? Colors.white : Colors.black, colorScheme.surfaceTint)
          : null,
      // TODO(rydmike): Monitor Flutter SDK deprecation of highlightColor.
      highlightColor: tintedInteractions
          ? FlexSubThemes.tintedHighlight(
              isDark ? Colors.white : Colors.black, colorScheme.surfaceTint)
          : null,
      // TODO(rydmike): Monitor Flutter SDK deprecation of hoverColor
      hoverColor: tintedInteractions
          ? FlexSubThemes.tintedHovered(
              isDark ? Colors.white : Colors.black, colorScheme.surfaceTint)
          : null,
      // TODO(rydmike): Monitor Flutter SDK deprecation of indicatorColor.
      // https://github.com/flutter/flutter/issues/91772#issuecomment-1198206279
      // Use TabBar style dependent function for selected Tab as indicatorColor,
      // if no SchemeColor color selection for it is made.
      indicatorColor: subTheme.tabBarIndicatorSchemeColor == null
          ? tabBarStyleColor()
          : FlexSubThemes.schemeColor(
              subTheme.tabBarIndicatorSchemeColor!, colorScheme),
      // TODO(rydmike): Monitor Flutter SDK deprecation of primaryColor.
      primaryColor: colorScheme.primary,
      // TODO(rydmike): Monitor Flutter SDK deprecation of primaryColorDark.
      // See: https://github.com/flutter/flutter/issues/91772
      // The primary dark color no longer exists in ColorScheme themes, but
      // it still needs to be set to match the ColorScheme theme, otherwise we
      // get a default dark blue theme color for it coming from default
      // primarySwatch. This will not look good if your theme uses any primary
      // color that is not a blue hue. To fix this we use the [700] value from
      // the calculated primary swatch for dark mode and [800] for light mode.
      // This property is used by `CircleAvatar` and `Slider`.
      // See issue: https://github.com/flutter/flutter/issues/65782
      primaryColorDark: primaryColorDark,
      // TODO(rydmike): Monitor Flutter SDK deprecation of primaryColorLight.
      // See: https://github.com/flutter/flutter/issues/91772
      // The light primary color no longer exists in ColorScheme themes, but it
      // still needs to be set to match the ColorScheme theme, otherwise we
      // get a default blue color for it coming from the default primarySwatch.
      // We use the [100] value from the calculated primary swatch.
      // This property is used by `CircleAvatar` and `Slider`.
      // See issue: https://github.com/flutter/flutter/issues/65782
      primaryColorLight: primaryColorLight,
      // TODO(rydmike): Monitor Flutter SDK deprecation of scaffoldBackground.
      // See: https://github.com/flutter/flutter/issues/91772
      // Flutter standard for scaffoldBackgroundColor is colorScheme.background.
      // Here it is replaced with a separate color for the scaffold background,
      // so we can use a configuration with a separate scaffold background
      // color from scheme background and surface. Flutter's ThemeData.from
      // a ColorScheme cannot do this. The good old ThemeData factory can of
      // course, but color scheme based themes in Flutter cannot specify it
      // separately alone. We want to do so in order to make elegantly nuanced
      // primary color branded themes.
      scaffoldBackgroundColor: scaffoldBackground ?? colorScheme.background,
      // TODO(rydmike): Monitor Flutter SDK deprecation of secondaryHeaderColor
      // See: https://github.com/flutter/flutter/issues/91772
      // Define a secondary header color, this property is only used in Flutter
      // SDK by `PaginatedDataTable`. It gets a super light [50] hue of the
      // primary color from default theme.light factory. Here we use the [50]
      // value from the calculated primary swatch.
      // See issue: https://github.com/flutter/flutter/issues/65782
      secondaryHeaderColor: secondaryHeaderColor,
      // TODO(rydmike): Monitor Flutter SDK deprecation of splashColor
      splashColor: tintedInteractions
          ? FlexSubThemes.tintedSplash(
              isDark ? Colors.white : Colors.black, colorScheme.surfaceTint)
          : null,

      // TYPOGRAPHY & ICONOGRAPHY
      //
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
      package: package,
      // TextTheme properties use the same logic as in ThemeData, allowing us
      // to optionally define them. AccentTextTheme is omitted since it has
      // been deprecated in Flutter 2.5.0.
      primaryTextTheme: effectivePrimaryTextTheme,
      textTheme: effectiveTextTheme,
      typography: effectiveTypography,

      // COMPONENT THEMES
      //
      // AppBar Theme.
      // Theme allows us to use a custom colored appbar theme
      // in both light and dark themes that is not dependent on ThemeData
      // `primaryColor` or surface color, and still gets correct working text
      // and icon theme. Historically, in versions prior to Flutter 2.0.0,
      // doing this was very difficult, as presented in
      // https://github.com/flutter/flutter/issues/50606.
      // A new feature in Flutter 2.0.0 implemented via:
      // https://github.com/flutter/flutter/pull/71184 made doing this easier.
      // FlexColorScheme has used the SDK supported way since it was launched.
      appBarTheme: useSubThemes
          ? FlexSubThemes.appBarTheme(
              colorScheme: colorScheme,
              centerTitle: subTheme.appBarCenterTitle,
              backgroundColor: effectiveAppBarBackgroundColor,
              foregroundColor: appBarForeground,
              elevation: appBarElevation ?? 0,
              scrolledUnderElevation: subTheme.appBarScrolledUnderElevation,
              iconTheme: IconThemeData(color: appBarIconColor),
              actionsIconTheme: IconThemeData(color: appBarIconColor),
              systemOverlayStyle: systemOverlayStyle,
              shadowColor: useShadow ? colorScheme.shadow : null,
              // Surface tint on AppBar is removed via the scroll under setting.
              surfaceTintColor: noScrollUnder ? Colors.transparent : null,
            )
          : useMaterial3
              ? (appBarElevation != null && appBarElevation != 0) ||
                      !transparentStatusBar ||
                      (appBarBackground != null)
                  ? FlexSubThemes.appBarTheme(
                      colorScheme: colorScheme,
                      backgroundColor: effectiveAppBarBackgroundColor,
                      foregroundColor: appBarForeground,
                      elevation: appBarElevation,
                      iconTheme: IconThemeData(color: appBarIconColor),
                      actionsIconTheme: IconThemeData(color: appBarIconColor),
                      systemOverlayStyle: systemOverlayStyle,
                    )
                  : null
              : FlexSubThemes.appBarTheme(
                  colorScheme: colorScheme,
                  backgroundColor: effectiveAppBarBackgroundColor,
                  foregroundColor: appBarForeground,
                  elevation: appBarElevation ?? 0,
                  iconTheme: IconThemeData(color: appBarIconColor),
                  actionsIconTheme: IconThemeData(color: appBarIconColor),
                  systemOverlayStyle: systemOverlayStyle,
                ),
      //
      // badgeTheme: NOT YET DEFINED BY FCS. USE: .copyWith
      //
      // bannerTheme:  NOT YET DEFINED BY FCS. USE: .copyWith
      //
      // BottomAppBar Theme.
      bottomAppBarTheme: useSubThemes
          ? FlexSubThemes.bottomAppBarTheme(
              colorScheme: colorScheme,
              backgroundSchemeColor: subTheme.bottomAppBarSchemeColor,
              elevation: bottomAppBarElevation,
              shadowColor: useShadow ? colorScheme.shadow : null,
              surfaceTintColor: removeTint ? Colors.transparent : null,
              useMaterial3: useMaterial3,
            )
          // When not using subThemes we will in M2 mode always get a
          // BottomAppBarTheme with at least background color defined to be
          // ColorScheme.surface, even if [bottomAppBarElevation] is null.
          // This is done to avoid issues with deprecation of
          // ThemeData.bottomAppBarColor that is still used in M2 mode defaults.
          // When using M3 mode and if [bottomAppBarElevation] is null, we
          // actually get a default [BottomAppBarTheme()] all null theme made by
          // FlexSubThemes.bottomAppBarTheme.
          : FlexSubThemes.bottomAppBarTheme(
              colorScheme: colorScheme,
              elevation: bottomAppBarElevation,
            ),
      //
      // BottomNavigationBar Theme.
      // Opinionated default theming for it:
      // Use primary for selected item. Flutter defaults to using secondary
      // color in  dark mode, we want primary in dark mode too, like it is in
      // light mode. Primary color is an iOS influenced style for the bottom
      // nav. The above is a description of default in version < 4, or now
      // when not using sub-themes. When we use sub-themes we can completely
      // customize its appearance as done below. The none sub-themes using
      // option further below if the past pre-version 4 default.
      bottomNavigationBarTheme: useSubThemes
          ? FlexSubThemes.bottomNavigationBar(
              colorScheme: colorScheme,
              labelTextStyle: subTheme.bottomNavigationBarLabelTextStyle ??
                  (subTheme.useFlutterDefaults
                      ? null
                      : effectiveTextTheme.bodyMedium),
              selectedLabelSize: subTheme.bottomNavigationBarSelectedLabelSize,
              unselectedLabelSize:
                  subTheme.bottomNavigationBarUnselectedLabelSize,
              selectedLabelSchemeColor:
                  subTheme.bottomNavigationBarSelectedLabelSchemeColor,
              unselectedLabelSchemeColor:
                  subTheme.bottomNavigationBarUnselectedLabelSchemeColor,
              mutedUnselectedLabel:
                  subTheme.bottomNavigationBarMutedUnselectedLabel,
              selectedIconSize: subTheme.bottomNavigationBarSelectedIconSize,
              unselectedIconSize:
                  subTheme.bottomNavigationBarUnselectedIconSize,
              selectedIconSchemeColor:
                  subTheme.bottomNavigationBarSelectedIconSchemeColor,
              unselectedIconSchemeColor:
                  subTheme.bottomNavigationBarUnselectedIconSchemeColor,
              mutedUnselectedIcon:
                  subTheme.bottomNavigationBarMutedUnselectedIcon,
              backgroundSchemeColor:
                  subTheme.bottomNavigationBarBackgroundSchemeColor,
              opacity: subTheme.bottomNavigationBarOpacity,
              elevation: subTheme.bottomNavigationBarElevation,
              type: subTheme.bottomNavigationBarType,
              showSelectedLabels:
                  subTheme.bottomNavigationBarShowSelectedLabels,
              showUnselectedLabels:
                  subTheme.bottomNavigationBarShowUnselectedLabels,
              landscapeLayout: subTheme.bottomNavigationBarLandscapeLayout,
              unselectedAlphaBlend: kUnselectedBackgroundPrimaryAlphaBlend,
              unselectedAlpha: kUnselectedAlphaBlend,
              useFlutterDefaults: subTheme.useFlutterDefaults,
            )
          : useMaterial3
              ? null
              // Opinionated FCS M2 legacy style sub-theme for
              // BottomNavigationBarThemeData that we get without
              // opting in on sub-themes. This is a nice fix for dark mode
              // BottomNavigationBar, but decided to not do it in M3 when not
              // opting in on sub-themes. If you opt-in, you get the "fix",
              // You are supposed to use the NavigationBar in M3 anyway.
              : BottomNavigationBarThemeData(
                  selectedIconTheme: IconThemeData(
                    color: colorScheme.primary,
                  ),
                  selectedItemColor: colorScheme.primary,
                ),
      //
      // BottomSheet Theme.
      bottomSheetTheme: useSubThemes
          ? FlexSubThemes.bottomSheetTheme(
              backgroundColor: bottomSheetColor,
              modalBackgroundColor: bottomSheetModalColor,
              elevation: bottomSheetElevation,
              modalElevation: bottomSheetModalElevation,
              radius: subTheme.bottomSheetRadius ?? platformRadius,
              shadowColor: useShadow ? colorScheme.shadow : null,
              surfaceTintColor: removeTint ? Colors.transparent : null,
            )
          : null,
      //
      // buttonBarTheme: NOT YET DEFINED BY FCS. USE: .copyWith
      //
      // Button Theme.
      // TODO(rydmike): Monitor Flutter SDK deprecation of buttonTheme.
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
      // A useSubThemes was added in version 4.0.0 to also still support
      // the old buttons.
      // The legacy buttons will be completely removed in Flutter.
      // The `ButtonThemeData` this helper uses will
      // however remain available after that for a while, because widgets
      // [ButtonBar] and [DropdownButton], plus [MaterialButton] (marked as
      // obsolete in SDK docs though) still use this theme. It is thus kept
      // around in FlexColorScheme package as long as it might have some use.
      // Be aware that the buttonTheme will be removed from
      // FlexColorScheme when/if ButtonThemeData becomes deprecated Flutter SDK.
      buttonTheme: useSubThemes
          ? FlexSubThemes.buttonTheme(
              colorScheme: colorScheme,
              baseSchemeColor: subTheme.materialButtonSchemeColor,
              radius: subTheme.textButtonRadius ?? platformRadius,
              padding: subTheme.buttonPadding,
              minButtonSize: subTheme.buttonMinSize,
            )
          : useMaterial3
              ? null
              // Opinionated FCS M2 legacy style sub-theme for ButtonThemeData,
              // that we get without opting in on sub-themes. In M3 mode you
              // get these fixes only when you opt-in on syb-themes. This
              // theme will should soon be deprecated in Flutter SDK.
              : ButtonThemeData(
                  colorScheme: colorScheme,
                  textTheme: ButtonTextTheme.primary,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                ),
      //
      // Card Theme.
      cardTheme: useSubThemes
          ? FlexSubThemes.cardTheme(
              radius: subTheme.cardRadius ?? platformRadius,
              elevation: subTheme.cardElevation,
              surfaceTintColor: removeTint ? Colors.transparent : null,
            )
          : null,
      //
      // Checkbox theme.
      checkboxTheme: useSubThemes
          ? FlexSubThemes.checkboxTheme(
              colorScheme: colorScheme,
              baseSchemeColor: subTheme.checkboxSchemeColor,
              unselectedIsColored: subTheme.unselectedToggleIsColored,
              useTintedInteraction: subTheme.interactionEffects,
              useTintedDisable: subTheme.tintedDisabledControls,
              useMaterial3: useMaterial3,
            )
          : null,
      //
      // Chip Theme.
      // TODO(rydmike): Monitor Chip theming improvements in Flutter SDK.
      // The default chip theme in Flutter does not work correctly with dark
      // themes. See issue: https://github.com/flutter/flutter/issues/65663
      // The chip theme below fixes it by using the colorScheme.primary color.
      // The option when useSubThemes is true uses even more elaborate theming
      // of chips. It is possible that there will be new Chips entirely for
      // Material 3. This theme brings the look closer to M3 look, but cannot
      // reach all the way.
      chipTheme: useSubThemes
          ? FlexSubThemes.chipTheme(
              colorScheme: colorScheme,
              baseSchemeColor: subTheme.chipSchemeColor,
              selectedSchemeColor: subTheme.chipSelectedSchemeColor,
              deleteIconSchemeColor: subTheme.chipDeleteIconSchemeColor,
              labelStyle: effectiveTextTheme.labelLarge!,
              radius: subTheme.chipRadius ?? platformRadius,
              surfaceTintColor: removeTint ? Colors.transparent : null,
              useTintedDisable: subTheme.tintedDisabledControls,
              useMaterial3: useMaterial3,
            )
          : useMaterial3
              ? null
              // Opinionated FCS M2 legacy style sub-theme for Chips,
              // that we get without opting in on sub-themes.
              : ChipThemeData.fromDefaults(
                  secondaryColor: colorScheme.primary,
                  brightness: colorScheme.brightness,
                  labelStyle: effectiveTextTheme.bodyLarge!,
                ),
      //
      // dataTableTheme: NOT YET DEFINED BY FCS. USE: .copyWith to modify.
      //
      // DatePicker theme
      datePickerTheme: useSubThemes
          ? FlexSubThemes.datePickerTheme(
              colorScheme: colorScheme,
              backgroundColor: dialogBackground,
              backgroundSchemeColor: subTheme.dialogBackgroundSchemeColor,
              headerBackgroundSchemeColor:
                  subTheme.datePickerHeaderBackgroundSchemeColor,
              elevation: subTheme.dialogElevation,
              radius: subTheme.datePickerDialogRadius ??
                  platformDialogRadius ??
                  platformRadius,
              shadowColor: useShadow ? colorScheme.shadow : null,
              surfaceTintColor: removeTint ? Colors.transparent : null,
            )
          : null,
      //
      // Dialog Theme.
      dialogTheme: useSubThemes
          ? FlexSubThemes.dialogTheme(
              backgroundColor: dialogBackground,
              colorScheme: colorScheme,
              backgroundSchemeColor: subTheme.dialogBackgroundSchemeColor,
              radius: platformDialogRadius ?? platformRadius,
              elevation: subTheme.dialogElevation,
              shadowColor: useShadow ? colorScheme.shadow : null,
              surfaceTintColor: removeTint ? Colors.transparent : null,
            )
          : null,
      //
      // Divider Theme.
      // Create a Divider theme only when sub themes is used and we want M2
      // style in M3. Otherwise we keep the theme as default, with null props.
      dividerTheme:
          useMaterial3 && (useSubThemes && subTheme.useM2StyleDividerInM3)
              ? DividerThemeData(color: dividerColor)
              : null,
      //
      // Drawer Theme.
      drawerTheme: useSubThemes
          ? FlexSubThemes.drawerTheme(
              colorScheme: colorScheme,
              backgroundSchemeColor: subTheme.drawerBackgroundSchemeColor,
              radius: subTheme.drawerRadius ?? platformRadius,
              width: subTheme.drawerWidth ??
                  (useMaterial3
                      ? kNavigationDrawerM3Width
                      : kNavigationDrawerM2Width),
              elevation: subTheme.drawerElevation,
              shadowColor: useShadow ? colorScheme.shadow : null,
              surfaceTintColor: removeTint ? Colors.transparent : null,
              useMaterial3: useMaterial3,
            )
          : null,
      //
      // DropDownMenu Theme.
      dropdownMenuTheme: useSubThemes
          ? FlexSubThemes.dropdownMenuTheme(
              colorScheme: colorScheme,
              textStyle: subTheme.dropdownMenuTextStyle,
              // Style match its InputDecoration to same as TextField.
              inputDecorationTheme: effectiveInputDecorationTheme,
              surfaceTintColor: removeTint ? Colors.transparent : null,
            )
          : null,
      //
      // ElevatedButton Theme.
      elevatedButtonTheme: useSubThemes
          ? FlexSubThemes.elevatedButtonTheme(
              colorScheme: colorScheme,
              baseSchemeColor: subTheme.elevatedButtonSchemeColor,
              onBaseSchemeColor: subTheme.elevatedButtonSecondarySchemeColor,
              radius: subTheme.elevatedButtonRadius ?? platformRadius,
              elevation: subTheme.elevatedButtonElevation,
              padding: subTheme.buttonPadding,
              minButtonSize: subTheme.buttonMinSize,
              textStyle: subTheme.elevatedButtonTextStyle,
              useTintedInteraction: subTheme.interactionEffects,
              useTintedDisable: subTheme.tintedDisabledControls,
              useMaterial3: useMaterial3,
            )
          : null,
      //
      // expansionTileTheme: NOT YET DEFINED BY FCS. USE: .copyWith to modify.
      //
      // FilledButton Theme.
      filledButtonTheme: useSubThemes
          ? FlexSubThemes.filledButtonTheme(
              colorScheme: colorScheme,
              backgroundSchemeColor: subTheme.filledButtonSchemeColor,
              radius: subTheme.filledButtonRadius ?? platformRadius,
              padding: subTheme.buttonPadding,
              minButtonSize: subTheme.buttonMinSize,
              textStyle: subTheme.filledButtonTextStyle,
              useTintedInteraction: subTheme.interactionEffects,
              useTintedDisable: subTheme.tintedDisabledControls,
              useMaterial3: useMaterial3,
            )
          : null,
      //
      // FAB, floating action button theme.
      floatingActionButtonTheme: useSubThemes
          ? FlexSubThemes.floatingActionButtonTheme(
              colorScheme: colorScheme,
              backgroundSchemeColor: subTheme.fabSchemeColor,
              radius: subTheme.fabRadius ?? platformRadius,
              useShape: subTheme.fabUseShape,
              alwaysCircular: subTheme.fabAlwaysCircular,
              useTintedInteraction: subTheme.interactionEffects,
              useMaterial3: useMaterial3,
            )
          : null,
      //
      // IconButton theme.
      //
      // TODO(rydmike): iconButtonTheme limited due Flutter SDK issue.
      // Supports new IconButton styles (filled, filledTonal, outlined)
      // with interaction effects. Tinted disable is only supported on the
      // foreground color supported due to issue:
      // https://github.com/flutter/flutter/issues/123829
      // No custom color theming of them supported due to this issue.
      iconButtonTheme: useSubThemes
          ? FlexSubThemes.iconButtonTheme(
              colorScheme: colorScheme,
              useTintedInteraction: subTheme.interactionEffects,
              useTintedDisable: subTheme.tintedDisabledControls,
            )
          : null,
      //
      // ListTileTheme: NOT YET DEFINED BY FCS. USE: .copyWith to modify.
      //
      // MenuBar theme, used by MenuBar.
      menuBarTheme: useSubThemes
          ? FlexSubThemes.menuBarTheme(
              colorScheme: colorScheme,
              backgroundSchemeColor: subTheme.menuBarBackgroundSchemeColor ??
                  subTheme.menuSchemeColor,
              surfaceTintColor: removeTint ? Colors.transparent : null,
              shadowColor: subTheme.menuBarShadowColor,
              radius: subTheme.menuBarRadius,
              elevation: subTheme.menuBarElevation,
            )
          : null,
      //
      // MenuButton theme, used by SubmenuButton and MenuItemButton.
      menuButtonTheme: useSubThemes
          ? FlexSubThemes.menuButtonTheme(
              colorScheme: colorScheme,
              menuBackgroundSchemeColor: subTheme.menuSchemeColor,
              backgroundSchemeColor: subTheme.menuItemBackgroundSchemeColor,
              foregroundSchemeColor: subTheme.menuItemForegroundSchemeColor,
              indicatorBackgroundSchemeColor:
                  subTheme.menuIndicatorBackgroundSchemeColor,
              indicatorForegroundSchemeColor:
                  subTheme.menuIndicatorForegroundSchemeColor,
              radius: subTheme.menuIndicatorRadius,
              useTintedInteraction: subTheme.interactionEffects,
              useTintedDisable: subTheme.tintedDisabledControls,
            )
          : null,
      //
      // Menu content theme.
      // Used by the menu container for MenuBar, MenuAnchor and DropDownMenu.
      menuTheme: useSubThemes
          ? FlexSubThemes.menuTheme(
              colorScheme: colorScheme,
              backgroundSchemeColor: subTheme.menuSchemeColor,
              opacity: subTheme.menuOpacity,
              radius: subTheme.menuRadius,
              elevation: subTheme.menuElevation,
              padding: subTheme.menuPadding,
              surfaceTintColor: removeTint ? Colors.transparent : null,
            )
          : null,
      //
      // NavigationBar Theme.
      navigationBarTheme: useSubThemes
          ? FlexSubThemes.navigationBarTheme(
              colorScheme: colorScheme,
              labelTextStyle: subTheme.navigationBarLabelTextStyle ??
                  (subTheme.useFlutterDefaults
                      ? null
                      : effectiveTextTheme.labelMedium),
              selectedLabelSize: subTheme.navigationBarSelectedLabelSize,
              unselectedLabelSize: subTheme.navigationBarUnselectedLabelSize,
              selectedLabelSchemeColor:
                  subTheme.navigationBarSelectedLabelSchemeColor,
              unselectedLabelSchemeColor:
                  subTheme.navigationBarUnselectedLabelSchemeColor,
              mutedUnselectedLabel: subTheme.navigationBarMutedUnselectedLabel,
              selectedIconSize: subTheme.navigationBarSelectedIconSize,
              unselectedIconSize: subTheme.navigationBarUnselectedIconSize,
              selectedIconSchemeColor:
                  subTheme.navigationBarSelectedIconSchemeColor,
              unselectedIconSchemeColor:
                  subTheme.navigationBarUnselectedIconSchemeColor,
              mutedUnselectedIcon: subTheme.navigationBarMutedUnselectedIcon,
              indicatorSchemeColor: subTheme.navigationBarIndicatorSchemeColor,
              backgroundSchemeColor:
                  subTheme.navigationBarBackgroundSchemeColor,
              opacity: subTheme.navigationBarOpacity,
              elevation: subTheme.navigationBarElevation,
              height: subTheme.navigationBarHeight,
              labelBehavior: subTheme.navigationBarLabelBehavior,
              indicatorRadius: subTheme.navigationBarIndicatorRadius,
              indicatorAlpha: subTheme.navigationBarIndicatorOpacity != null
                  ? Color.getAlphaFromOpacity(
                      subTheme.navigationBarIndicatorOpacity!)
                  : null,
              unselectedAlphaBlend: kUnselectedBackgroundPrimaryAlphaBlend,
              unselectedAlpha: kUnselectedAlphaBlend,
              useMaterial3: useMaterial3,
              useFlutterDefaults: subTheme.useFlutterDefaults,
              surfaceTintColor: removeTint ? Colors.transparent : null,
              shadowColor: useShadow ? colorScheme.shadow : null,
            )
          : null,
      //
      // NavigationDrawerTheme Theme.
      navigationDrawerTheme: useSubThemes
          ? FlexSubThemes.navigationDrawerTheme(
              colorScheme: colorScheme,
              backgroundSchemeColor: subTheme.drawerBackgroundSchemeColor,
              indicatorWidth: subTheme.drawerIndicatorWidth ??
                  ((subTheme.drawerWidth ??
                          (useMaterial3
                              ? kNavigationDrawerM3Width
                              : kNavigationDrawerM2Width)) -
                      2 * kNavigationDrawerIndicatorPadding),
              indicatorRadius: subTheme.drawerIndicatorRadius ?? platformRadius,
              indicatorSchemeColor: subTheme.drawerIndicatorSchemeColor,
              indicatorOpacity: subTheme.drawerIndicatorOpacity,
              selectedItemSchemeColor: subTheme.drawerSelectedItemSchemeColor,
              unselectedItemSchemeColor:
                  subTheme.drawerUnselectedItemSchemeColor,
              textStyle: effectiveTextTheme.bodyLarge,
              surfaceTintColor: removeTint ? Colors.transparent : null,
              shadowColor: useShadow ? colorScheme.shadow : null,
            )
          : null,
      //
      // NavigationRail Theme.
      navigationRailTheme: useSubThemes
          ? FlexSubThemes.navigationRailTheme(
              colorScheme: colorScheme,
              labelTextStyle: subTheme.navigationRailLabelTextStyle ??
                  (subTheme.useFlutterDefaults
                      ? null
                      : effectiveTextTheme.labelMedium),
              selectedLabelSize: subTheme.navigationRailSelectedLabelSize,
              unselectedLabelSize: subTheme.navigationRailUnselectedLabelSize,
              selectedLabelSchemeColor:
                  subTheme.navigationRailSelectedLabelSchemeColor,
              unselectedLabelSchemeColor:
                  subTheme.navigationRailUnselectedLabelSchemeColor,
              mutedUnselectedLabel: subTheme.navigationRailMutedUnselectedLabel,
              selectedIconSize: subTheme.navigationRailSelectedIconSize,
              unselectedIconSize: subTheme.navigationRailUnselectedIconSize,
              selectedIconSchemeColor:
                  subTheme.navigationRailSelectedIconSchemeColor,
              unselectedIconSchemeColor:
                  subTheme.navigationRailUnselectedIconSchemeColor,
              mutedUnselectedIcon: subTheme.navigationRailMutedUnselectedIcon,
              useIndicator: subTheme.navigationRailUseIndicator,
              indicatorSchemeColor: subTheme.navigationRailIndicatorSchemeColor,
              backgroundSchemeColor:
                  subTheme.navigationRailBackgroundSchemeColor,
              opacity: subTheme.navigationRailOpacity,
              elevation: subTheme.navigationRailElevation,
              labelType: subTheme.navigationRailLabelType,
              groupAlignment: subTheme.navigationRailGroupAlignment,
              indicatorAlpha: subTheme.navigationRailIndicatorOpacity != null
                  ? Color.getAlphaFromOpacity(
                      subTheme.navigationRailIndicatorOpacity!)
                  : null,
              indicatorRadius: subTheme.navigationRailIndicatorRadius,
              unselectedAlphaBlend: kUnselectedBackgroundPrimaryAlphaBlend,
              unselectedAlpha: kUnselectedAlphaBlend,
              useMaterial3: useMaterial3,
              useFlutterDefaults: subTheme.useFlutterDefaults,
            )
          : null,
      //
      // OutlinedButton Theme.
      outlinedButtonTheme: useSubThemes
          ? FlexSubThemes.outlinedButtonTheme(
              colorScheme: colorScheme,
              baseSchemeColor: subTheme.outlinedButtonSchemeColor,
              outlineSchemeColor: subTheme.outlinedButtonOutlineSchemeColor,
              radius: subTheme.outlinedButtonRadius ?? platformRadius,
              pressedOutlineWidth: subTheme.outlinedButtonPressedBorderWidth ??
                  subTheme.thickBorderWidth,
              outlineWidth: subTheme.outlinedButtonBorderWidth ??
                  subTheme.thinBorderWidth,
              padding: subTheme.buttonPadding,
              minButtonSize: subTheme.buttonMinSize,
              textStyle: subTheme.outlinedButtonTextStyle,
              useTintedInteraction: subTheme.interactionEffects,
              useTintedDisable: subTheme.tintedDisabledControls,
              useMaterial3: useMaterial3,
            )
          : null,
      //
      // PopupMenuButton Theme.
      popupMenuTheme: useSubThemes
          ? FlexSubThemes.popupMenuTheme(
              colorScheme: colorScheme,
              radius: subTheme.popupMenuRadius,
              elevation: popupMenuElevation,
              color: popupMenuBackgroundColor,
              backgroundSchemeColor: subTheme.popupMenuSchemeColor,
              surfaceTintColor: removeTint ? Colors.transparent : null,
            )
          : null,
      //
      // progressIndicatorTheme: NOT YET DEFINED BY FCS. USE: .copyWith
      //
      // Radio Theme.
      radioTheme: useSubThemes
          ? FlexSubThemes.radioTheme(
              colorScheme: colorScheme,
              baseSchemeColor: subTheme.radioSchemeColor,
              unselectedIsColored: subTheme.unselectedToggleIsColored,
              useTintedInteraction: subTheme.interactionEffects,
              useTintedDisable: subTheme.tintedDisabledControls,
              useMaterial3: useMaterial3,
            )
          : null,
      //
      // SegmentedButton Theme.
      segmentedButtonTheme: useSubThemes
          ? FlexSubThemes.segmentedButtonTheme(
              colorScheme: colorScheme,
              selectedSchemeColor: subTheme.segmentedButtonSchemeColor,
              unselectedSchemeColor:
                  subTheme.segmentedButtonUnselectedSchemeColor,
              unselectedForegroundSchemeColor:
                  subTheme.segmentedButtonUnselectedForegroundSchemeColor,
              borderSchemeColor: subTheme.segmentedButtonBorderSchemeColor,
              borderWidth: subTheme.segmentedButtonBorderWidth ??
                  subTheme.thinBorderWidth,
              radius: subTheme.segmentedButtonRadius ?? platformRadius,
              useTintedInteraction: subTheme.interactionEffects,
              useTintedDisable: subTheme.tintedDisabledControls,
              useMaterial3: useMaterial3,
            )
          : null,
      //
      // Slider theme.
      sliderTheme: useSubThemes
          ? FlexSubThemes.sliderTheme(
              colorScheme: colorScheme,
              baseSchemeColor: subTheme.sliderBaseSchemeColor,
              trackHeight: subTheme.sliderTrackHeight,
              valueIndicatorColor: sliderValueIndicator,
              valueIndicatorTextStyle: sliderValueStyle,
              valueIndicatorType: subTheme.sliderValueIndicatorType,
              showValueIndicator: subTheme.sliderShowValueIndicator,
              useTintedInteraction: subTheme.interactionEffects,
              useTintedDisable: subTheme.tintedDisabledControls,
              useMaterial3: useMaterial3,
            )
          : null,
      //
      // SnackBar Theme.
      snackBarTheme: useSubThemes
          ? FlexSubThemes.snackBarTheme(
              radius: subTheme.snackBarRadius,
              elevation: subTheme.snackBarElevation,
              colorScheme: colorScheme,
              backgroundSchemeColor: subTheme.snackBarBackgroundSchemeColor,
              actionTextSchemeColor: subTheme.snackBarActionSchemeColor,
              backgroundColor: tintedBackground(
                background: colorScheme.onSurface,
                blend: colorScheme.primary,
                brightness: colorScheme.brightness,
              ),
            )
          : null,
      //
      // Switch theme.
      switchTheme: useSubThemes
          ? FlexSubThemes.switchTheme(
              colorScheme: colorScheme,
              baseSchemeColor: subTheme.switchSchemeColor,
              thumbSchemeColor: subTheme.switchThumbSchemeColor,
              unselectedIsColored: subTheme.unselectedToggleIsColored,
              useTintedInteraction: subTheme.interactionEffects,
              useTintedDisable: subTheme.tintedDisabledControls,
              useMaterial3: useMaterial3,
            )
          : null,
      //
      // TabBar Theme.
      // Defines the TabBar theme that will fit nicely in an AppBar
      // (default) or on background color for use eg in a Scaffold, the choice
      // depends on tabBarStyle `FlexTabBarStyle`, that defaults to
      // `FlexTabBarStyle.forAppBar`. Using different theme styles for intended
      // target usage avoids this challenge:
      // https://github.com/flutter/flutter/pull/68171#pullrequestreview-517753917
      // That still has some issue related to it, is using default is used, we
      // pass in `null` and let ThemeData use default sub-theme for TabBarTheme.
      tabBarTheme: FlexSubThemes.tabBarTheme(
        colorScheme: colorScheme,
        indicatorColor: subTheme.tabBarIndicatorSchemeColor == null
            ? tabBarStyleColor()
            : FlexSubThemes.schemeColor(
                subTheme.tabBarIndicatorSchemeColor!, colorScheme),
        labelStyle: effectiveTextTheme.bodyLarge,
        labelColor: subTheme.tabBarItemSchemeColor == null
            ? tabBarStyleColor()
            : FlexSubThemes.schemeColor(
                subTheme.tabBarItemSchemeColor!, colorScheme),
        unselectedLabelStyle: effectiveTextTheme.bodyLarge,
        unselectedLabelColor: subTheme.tabBarItemSchemeColor == null
            ? unselectedTabColor()
            : subTheme.tabBarUnselectedItemSchemeColor == null
                ? useMaterial3
                    ? FlexSubThemes.schemeColor(
                            SchemeColor.onSurfaceVariant, colorScheme)
                        .withAlpha(tabBarUnselectedAlpha)
                    : FlexSubThemes.schemeColor(
                            subTheme.tabBarItemSchemeColor!, colorScheme)
                        .withAlpha(tabBarUnselectedAlpha)
                : FlexSubThemes.schemeColor(
                        subTheme.tabBarUnselectedItemSchemeColor!, colorScheme)
                    .withAlpha(tabBarUnselectedAlpha),
        indicatorSize: subTheme.tabBarIndicatorSize,
        indicatorWeight: subTheme.tabBarIndicatorWeight,
        indicatorTopRadius: subTheme.tabBarIndicatorTopRadius,
        dividerColor: subTheme.tabBarDividerColor,
        useTintedInteraction: subTheme.interactionEffects,
        useMaterial3: useMaterial3,
      ),
      //
      // TextButton Theme.
      textButtonTheme: useSubThemes
          ? FlexSubThemes.textButtonTheme(
              colorScheme: colorScheme,
              baseSchemeColor: subTheme.textButtonSchemeColor,
              radius: subTheme.textButtonRadius ?? platformRadius,
              padding: subTheme.buttonPadding,
              minButtonSize: subTheme.buttonMinSize,
              textStyle: subTheme.textButtonTextStyle,
              useTintedInteraction: subTheme.interactionEffects,
              useTintedDisable: subTheme.tintedDisabledControls,
              useMaterial3: useMaterial3,
            )
          : null,
      //
      // TextSelection Theme.
      // In TextSelectionThemeData, the standard for selectionColor is
      // colorScheme.primary with opacity value 0.4 for dark and 0.12 light
      // mode. Here we use primary with 0.5 for dark mode and 0.3 for light
      // mode. The standard selectionHandleColor is colorScheme.primary,
      // here we use the slightly darker shade primaryColorDark instead.
      textSelectionTheme: useSubThemes || !useMaterial3
          ? TextSelectionThemeData(
              selectionColor: isDark
                  ? colorScheme.primary.withAlpha(0xB2) // 50%
                  : colorScheme.primary.withAlpha(0x4C), // 30%
              selectionHandleColor: primaryColorDark,
            )
          // If we don't use sub themes and useMaterial3 we get no
          // opinionated style.
          : null,
      //
      // TimePicker Theme.
      timePickerTheme: useSubThemes
          ? FlexSubThemes.timePickerTheme(
              colorScheme: colorScheme,
              backgroundColor: dialogBackground,
              backgroundSchemeColor: subTheme.dialogBackgroundSchemeColor,
              elevation: subTheme.dialogElevation,
              radius: subTheme.timePickerDialogRadius ??
                  platformDialogRadius ??
                  platformRadius,
              elementRadius: subTheme.timePickerElementRadius,
              inputDecorationTheme: effectiveInputDecorationTheme,
              useInputDecoratorTheme: subTheme.useInputDecoratorThemeInDialogs,
              useMaterial3: useMaterial3,
            )
          : null,
      //
      // ToggleButtons Theme.
      toggleButtonsTheme: useSubThemes
          ? FlexSubThemes.toggleButtonsTheme(
              colorScheme: colorScheme,
              baseSchemeColor: subTheme.toggleButtonsSchemeColor,
              unselectedSchemeColor:
                  subTheme.toggleButtonsUnselectedSchemeColor,
              borderSchemeColor: subTheme.toggleButtonsBorderSchemeColor,
              borderWidth:
                  subTheme.toggleButtonsBorderWidth ?? subTheme.thinBorderWidth,
              radius: subTheme.toggleButtonsRadius ?? platformRadius,
              minButtonSize: subTheme.buttonMinSize,
              visualDensity: visualDensity,
              useTintedInteraction: subTheme.interactionEffects,
              useTintedDisable: subTheme.tintedDisabledControls,
              useMaterial3: useMaterial3,
            )
          : null,
      //
      // Tooltip theme
      // If we don't use subThemes and don't change tooltipsMatchBackground from
      // default, we get default un-opinionated styles.
      tooltipTheme: !useSubThemes && !tooltipsMatchBackground
          ? null
          : FlexSubThemes.tooltipTheme(
              colorScheme: colorScheme,
              backgroundSchemeColor: subTheme.tooltipSchemeColor,
              backgroundColor: tooltipBackground(),
              backgroundAlpha: tooltipAlpha(),
              foregroundColor: tooltipForeground(),
              textStyle: effectiveTextTheme.bodyMedium!.copyWith(
                fontSize: tooltipFontSize(),
              ),
              borderRadius: tooltipBorderRadius(),
              borderColor: dividerColor,
              waitDuration: subTheme.tooltipWaitDuration,
              showDuration: subTheme.tooltipShowDuration,
            ),
    );
  }

  /// Returns the effective [ColorScheme] defined by your [FlexColorScheme].
  ///
  /// After you have defined your Flex scheme with [FlexColorScheme] or one of
  /// its recommended factories [FlexColorScheme.light], [FlexColorScheme.dark],
  /// you can use the [toScheme] method to get the effective standard Flutter
  /// [ColorScheme] object defined by your [FlexColorScheme] definition.
  ///
  /// While you can use use this returned color scheme in a standard
  /// [ThemeData.from] color scheme based theme factory to create a theme from
  /// [FlexColorScheme], this is NOT the recommended way to make a
  /// fully [FlexColorScheme] based theme. Normally you want to use
  /// [FlexColorScheme.toTheme] to make your ThemeData when using
  /// FlexColorScheme. The [FlexColorScheme.toTheme] method uses
  /// [FlexColorScheme.toScheme] internally when it creates its [ThemeData]
  /// object as well. It does however also apply a number of additional
  /// theme properties, that you loose if you extract the [ColorScheme]
  /// with [toScheme] and use it in a [ThemeData.from] from factory.
  ///
  /// The main usage of this method is to get the effective resulting
  /// [ColorScheme] from [FlexColorScheme] and use it when making sub-themes
  /// that need access to the resulting color definitions, so you can use
  /// them in custom sub-themes in order to use the same color scheme for their
  /// definitions.
  ///
  /// If you use [ThemeData.from] and the [ColorScheme] returned by
  /// [FlexColorScheme.toScheme] to create your theme, this will work and
  /// result in a theme that is based on the color scheme defined in
  /// [FlexColorScheme], including the surface and
  /// background color branding, and e.g. true black for dark mode, if those
  /// were used in its creation via the light and dark factories. The big
  /// difference will be that Flutter's [ThemeData.from] theme creation
  /// from this scheme will not include any of the theme improvements included
  /// in the [FlexColorScheme.toTheme] method. The AppBar theme options
  /// will also not be available and scaffoldBackground
  /// will be equal to background, which might not be the design you intended.
  ///
  /// The sub-theming is of course also not available, unless you apply them
  /// all with `copyWith` to the produced ThemeData.
  ColorScheme get toScheme {
    // Get effective scheme brightness. Passed in as a property value, or from
    // passed in colorScheme, if neither given, light is default fallback.
    final Brightness usedBrightness =
        brightness ?? colorScheme?.brightness ?? Brightness.light;
    final bool isDark = usedBrightness == Brightness.dark;
    // Get effective primary color. Passed in a as property, if not, then maybe
    // from colorScheme, if neither given, fallback color is light or dark mode
    // Material 2 guide default light and dark primary color.
    final Color usedPrimary = primary ??
        colorScheme?.primary ??
        (isDark
            ? FlexColor.materialDarkPrimary
            : FlexColor.materialLightPrimary);

    // Get default fallback error color.
    final Color errorFallback =
        isDark ? FlexColor.materialDarkError : FlexColor.materialLightError;
    final Color errorContainerFallback = isDark
        ? FlexColor.darkErrorContainer(FlexColor.materialDarkError)
        : FlexColor.lightErrorContainer(FlexColor.materialLightError);

    // Determine effective primary, secondary and tertiary colors, depending
    // on passed in properties as highest priority, then colorScheme values.
    // Containers fall back via none container values, tertiary via secondary.
    // All falls back to primary, if nothing else is available before that.
    final FlexSchemeColor colors = FlexSchemeColor.from(
      primary: usedPrimary,
      primaryContainer:
          primaryContainer ?? colorScheme?.primaryContainer ?? usedPrimary,
      secondary: secondary ?? colorScheme?.secondary ?? usedPrimary,
      secondaryContainer: secondaryContainer ??
          colorScheme?.secondaryContainer ??
          secondary ??
          colorScheme?.secondary ??
          usedPrimary,
      tertiary: tertiary ??
          colorScheme?.tertiary ??
          secondary ??
          colorScheme?.secondary ??
          usedPrimary,
      tertiaryContainer: tertiaryContainer ??
          colorScheme?.tertiaryContainer ??
          tertiary ??
          colorScheme?.tertiary ??
          secondary ??
          colorScheme?.secondary ??
          usedPrimary,
      error: error ?? colorScheme?.error ?? errorFallback,
      errorContainer: colorScheme?.errorContainer ?? errorContainerFallback,
    );
    // Determine effective surface surface and background.
    final Color effectiveSurfaceColor = surface ??
        colorScheme?.surface ??
        (isDark
            ? FlexColor.materialDarkSurface
            : FlexColor.materialLightSurface);
    final Color effectiveSurfaceVariantColor = colorScheme?.surfaceVariant ??
        (isDark ? FlexColor.darkSurfaceVariant : FlexColor.lightSurfaceVariant);

    final Color effectiveInverseSurfaceColor = colorScheme?.inverseSurface ??
        (isDark
            ? FlexColor.materialLightSurface
            : FlexColor.materialDarkSurface);

    final Color effectiveBackgroundColor = background ??
        colorScheme?.background ??
        (isDark
            ? FlexColor.materialDarkBackground
            : FlexColor.materialLightBackground);

    // Check brightness of primary, secondary, error, surface and background
    // colors, and returns appropriate computed colors for their onColors if an
    // onColor for it was was not passed in, or no colorScheme with them were
    // passed in. If they were, the passed in direct values have highest
    // priority, then the values in a given colorScheme, and lastly a value
    // computed from its main color pair is used.
    final FlexSchemeOnColors onColors = FlexSchemeOnColors.from(
      primary: colors.primary,
      primaryContainer: colors.primaryContainer,
      secondary: colors.secondary,
      secondaryContainer: colors.secondaryContainer,
      tertiary: colors.tertiary,
      tertiaryContainer: colors.tertiaryContainer,
      surface: effectiveSurfaceColor,
      surfaceVariant: effectiveSurfaceVariantColor,
      inverseSurface: effectiveInverseSurfaceColor,
      background: effectiveBackgroundColor,
      error: colors.error ?? errorFallback,
      errorContainer: colors.errorContainer ?? errorContainerFallback,
      onPrimary: onPrimary ?? colorScheme?.onPrimary,
      onPrimaryContainer: onPrimaryContainer ?? colorScheme?.onPrimaryContainer,
      onSecondary: onSecondary ?? colorScheme?.onSecondary,
      onSecondaryContainer:
          onSecondaryContainer ?? colorScheme?.onSecondaryContainer,
      onTertiary: onTertiary ?? colorScheme?.onTertiary,
      onTertiaryContainer:
          onTertiaryContainer ?? colorScheme?.onTertiaryContainer,
      onSurface: onSurface ?? colorScheme?.onSurface,
      onSurfaceVariant: colorScheme?.onSurfaceVariant,
      onInverseSurface: colorScheme?.onInverseSurface,
      onBackground: onBackground ?? colorScheme?.onBackground,
      onError: onError ?? colorScheme?.onError,
      onErrorContainer: colorScheme?.onErrorContainer,
    );
    // Return the ColorScheme as a copyWith on original passed in colorScheme
    // if one was passed in, with all the effective properties overriding its
    // corresponding properties. This will keep color properties not included in
    // FlexColorScheme as direct properties as they were in any given
    // colorScheme, in the returned ColorScheme as well.
    // If there was no colorScheme passed in, we create one with the effective
    // override properties, plus FlexColorScheme ColorScheme defaults.
    //
    // The factories FlexColorScheme.light and FlexColorScheme.dark have their
    // own logic for making the ColorScheme and set a colorScheme as well as
    // all override properties to define their target ColorScheme when the
    // toScheme methods is called.
    //
    // The toScheme method is used internally by the toTheme method to get
    // the effective ColorScheme for the the defined FlexColorScheme instance.
    return colorScheme?.copyWith(
          brightness: usedBrightness,
          primary: colors.primary,
          onPrimary: onColors.onPrimary,
          primaryContainer: colors.primaryContainer,
          onPrimaryContainer: onColors.onPrimaryContainer,
          secondary: colors.secondary,
          onSecondary: onColors.onSecondary,
          secondaryContainer: colors.secondaryContainer,
          onSecondaryContainer: onColors.onSecondaryContainer,
          tertiary: colors.tertiary,
          onTertiary: onColors.onTertiary,
          tertiaryContainer: colors.tertiaryContainer,
          onTertiaryContainer: onColors.onTertiaryContainer,
          error: colors.error ?? errorFallback,
          onError: onColors.onError,
          errorContainer: colors.errorContainer ?? errorContainerFallback,
          onErrorContainer: onColors.onErrorContainer,
          background: effectiveBackgroundColor,
          onBackground: onColors.onBackground,
          surface: effectiveSurfaceColor,
          onSurface: onColors.onSurface,
          surfaceVariant: effectiveSurfaceVariantColor,
          onSurfaceVariant: onColors.onSurfaceVariant,
          outline: colorScheme?.outline,
          outlineVariant: colorScheme?.outlineVariant,
          shadow: colorScheme?.shadow,
          scrim: colorScheme?.scrim,
          inverseSurface: effectiveInverseSurfaceColor,
          onInverseSurface: onColors.onInverseSurface,
          inversePrimary: colorScheme?.inversePrimary,
          surfaceTint:
              surfaceTint ?? colorScheme?.surfaceTint ?? colors.primary,
        ) ??
        // No passed in ColorScheme, we create one with the effective
        // override properties, plus FlexColorScheme ColorScheme defaults.
        ColorScheme(
          brightness: usedBrightness,
          primary: usedPrimary,
          onPrimary: onColors.onPrimary,
          primaryContainer: colors.primaryContainer,
          onPrimaryContainer: onColors.onPrimaryContainer,
          secondary: colors.secondary,
          onSecondary: onColors.onSecondary,
          secondaryContainer: colors.secondaryContainer,
          onSecondaryContainer: onColors.onSecondaryContainer,
          tertiary: colors.tertiary,
          onTertiary: onColors.onTertiary,
          tertiaryContainer: colors.tertiaryContainer,
          onTertiaryContainer: onColors.onTertiaryContainer,
          error: colors.error ?? errorFallback,
          onError: onColors.onError,
          errorContainer: colors.errorContainer ?? errorContainerFallback,
          onErrorContainer: onColors.onErrorContainer,
          background: effectiveBackgroundColor,
          onBackground: onColors.onBackground,
          surface: effectiveSurfaceColor,
          onSurface: onColors.onSurface,
          surfaceVariant: effectiveSurfaceVariantColor,
          onSurfaceVariant: onColors.onSurfaceVariant,
          outline: _outlineColor(usedBrightness, onColors.onBackground, 45),
          outlineVariant:
              _outlineColor(usedBrightness, onColors.onBackground, 75),
          shadow: Colors.black,
          scrim: Colors.black,
          inverseSurface: effectiveInverseSurfaceColor,
          onInverseSurface: onColors.onInverseSurface,
          inversePrimary: _inversePrimary(
              usedBrightness, colors.primary, effectiveSurfaceColor),
          surfaceTint: surfaceTint ?? usedPrimary,
        );
  }

  /// FlexColorScheme default for inversePrimary color, when not using seeds.
  ///
  /// When using real M3 ColorScheme's that are seeded, this color is not used.
  ///
  /// Not the best algo in the world, but simple and works fairly well for light
  /// Brightness, but should be better for dark.
  static Color _inversePrimary(
      Brightness brightness, Color primary, Color surface) {
    if (brightness == Brightness.light) {
      return primary.brighten(40).lighten(10);
    } else {
      return primary.brighten(5).blendAlpha(surface, 0x99);
    }
  }

  /// FlexColorScheme default for outline color, when not using M3 seeds.
  static Color _outlineColor(
      Brightness brightness, Color onBackground, int amount) {
    if (brightness == Brightness.light) {
      return onBackground.lighten(amount);
    } else {
      return onBackground.darken(amount);
    }
  }

  /// Copy the object with one or more provided properties changed.
  FlexColorScheme copyWith({
    ColorScheme? colorScheme,
    Brightness? brightness,
    Color? primary,
    Color? primaryContainer,
    Color? secondary,
    Color? secondaryContainer,
    Color? tertiary,
    Color? tertiaryContainer,
    Color? error,
    Color? surface,
    Color? background,
    Color? scaffoldBackground,
    Color? dialogBackground,
    Color? appBarBackground,
    Color? onPrimary,
    Color? onPrimaryContainer,
    Color? onSecondary,
    Color? onSecondaryContainer,
    Color? onTertiary,
    Color? onTertiaryContainer,
    Color? onSurface,
    Color? onBackground,
    Color? onError,
    Color? surfaceTint,
    FlexTabBarStyle? tabBarStyle,
    double? appBarElevation,
    double? bottomAppBarElevation,
    bool? tooltipsMatchBackground,
    bool? transparentStatusBar,
    VisualDensity? visualDensity,
    TextTheme? textTheme,
    TextTheme? primaryTextTheme,
    String? fontFamily,
    List<String>? fontFamilyFallback,
    String? package,
    MaterialTapTargetSize? materialTapTargetSize,
    PageTransitionsTheme? pageTransitionsTheme,
    TargetPlatform? platform,
    Typography? typography,
    bool? applyElevationOverlayColor,
    FlexSubThemesData? subThemesData,
    bool? useMaterial3,
    Iterable<ThemeExtension<dynamic>>? extensions,
  }) {
    return FlexColorScheme(
      colorScheme: colorScheme ?? this.colorScheme,
      brightness: brightness ?? this.brightness,
      primary: primary ?? this.primary,
      primaryContainer: primaryContainer ?? this.primaryContainer,
      secondary: secondary ?? this.secondary,
      secondaryContainer: secondaryContainer ?? this.secondaryContainer,
      tertiary: tertiary ?? this.tertiary,
      tertiaryContainer: tertiaryContainer ?? this.tertiaryContainer,
      error: error ?? this.error,
      surface: surface ?? this.surface,
      background: background ?? this.background,
      scaffoldBackground: scaffoldBackground ?? this.scaffoldBackground,
      appBarBackground: appBarBackground ?? this.appBarBackground,
      dialogBackground: dialogBackground ?? this.dialogBackground,
      onPrimary: onPrimary ?? this.onPrimary,
      onPrimaryContainer: onPrimaryContainer ?? this.onPrimaryContainer,
      onSecondary: onSecondary ?? this.onSecondary,
      onSecondaryContainer: onSecondaryContainer ?? this.onSecondaryContainer,
      onTertiary: onTertiary ?? this.onTertiary,
      onTertiaryContainer: onTertiaryContainer ?? this.onTertiaryContainer,
      onSurface: onSurface ?? this.onSurface,
      onBackground: onBackground ?? this.onBackground,
      onError: onError ?? this.onError,
      surfaceTint: surfaceTint ?? this.surfaceTint,
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
      fontFamilyFallback: fontFamilyFallback ?? this.fontFamilyFallback,
      package: package ?? this.package,
      materialTapTargetSize:
          materialTapTargetSize ?? this.materialTapTargetSize,
      pageTransitionsTheme: pageTransitionsTheme ?? this.pageTransitionsTheme,
      platform: platform ?? this.platform,
      typography: typography ?? this.typography,
      applyElevationOverlayColor:
          applyElevationOverlayColor ?? this.applyElevationOverlayColor,
      subThemesData: subThemesData ?? this.subThemesData,
      useMaterial3: useMaterial3 ?? this.useMaterial3,
      extensions: extensions ?? this.extensions,
    );
  }

  /// Override the equality operator.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is FlexColorScheme &&
        other.colorScheme == colorScheme &&
        other.brightness == brightness &&
        other.primary == primary &&
        other.primaryContainer == primaryContainer &&
        other.secondary == secondary &&
        other.secondaryContainer == secondaryContainer &&
        other.tertiary == tertiary &&
        other.tertiaryContainer == tertiaryContainer &&
        other.error == error &&
        other.surface == surface &&
        other.background == background &&
        other.scaffoldBackground == scaffoldBackground &&
        other.dialogBackground == dialogBackground &&
        other.appBarBackground == appBarBackground &&
        other.onPrimary == onPrimary &&
        other.onPrimaryContainer == onPrimaryContainer &&
        other.onSecondary == onSecondary &&
        other.onSecondaryContainer == onSecondaryContainer &&
        other.onTertiary == onTertiary &&
        other.onTertiaryContainer == onTertiaryContainer &&
        other.onSurface == onSurface &&
        other.onBackground == onBackground &&
        other.onError == onError &&
        other.surfaceTint == surfaceTint &&
        other.tabBarStyle == tabBarStyle &&
        other.appBarElevation == appBarElevation &&
        other.bottomAppBarElevation == bottomAppBarElevation &&
        other.tooltipsMatchBackground == tooltipsMatchBackground &&
        other.transparentStatusBar == transparentStatusBar &&
        other.visualDensity == visualDensity &&
        other.textTheme == textTheme &&
        other.primaryTextTheme == primaryTextTheme &&
        other.materialTapTargetSize == materialTapTargetSize &&
        other.pageTransitionsTheme == pageTransitionsTheme &&
        other.fontFamily == fontFamily &&
        other.fontFamilyFallback == fontFamilyFallback &&
        other.package == package &&
        other.platform == platform &&
        other.typography == typography &&
        other.applyElevationOverlayColor == applyElevationOverlayColor &&
        other.subThemesData == subThemesData &&
        other.useMaterial3 == useMaterial3 &&
        other.extensions == extensions;
  }

  /// Override for hashcode, dart.ui Jenkins based.
  @override
  int get hashCode => Object.hashAll(<Object?>[
        colorScheme,
        brightness,
        primary,
        primaryContainer,
        secondary,
        secondaryContainer,
        tertiary,
        tertiaryContainer,
        error,
        surface,
        background,
        scaffoldBackground,
        dialogBackground,
        appBarBackground,
        onPrimary,
        onPrimaryContainer,
        onSecondary,
        onSecondaryContainer,
        onTertiary,
        onTertiaryContainer,
        onSurface,
        onBackground,
        onError,
        surfaceTint,
        tabBarStyle,
        appBarElevation,
        bottomAppBarElevation,
        tooltipsMatchBackground,
        transparentStatusBar,
        visualDensity,
        textTheme,
        primaryTextTheme,
        fontFamily,
        fontFamilyFallback,
        package,
        materialTapTargetSize,
        pageTransitionsTheme,
        platform,
        typography,
        applyElevationOverlayColor,
        subThemesData,
        useMaterial3,
        extensions,
      ]);

  /// Flutter debug properties override, includes toString.
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<ColorScheme>('colorScheme', colorScheme));
    properties.add(EnumProperty<Brightness>('brightness', brightness));
    properties.add(ColorProperty('primary', primary));
    properties.add(ColorProperty('primaryContainer', primaryContainer));
    properties.add(ColorProperty('secondary', secondary));
    properties.add(ColorProperty('secondaryContainer', secondaryContainer));
    properties.add(ColorProperty('tertiary', tertiary));
    properties.add(ColorProperty('tertiaryContainer', tertiaryContainer));
    properties.add(ColorProperty('error', error));
    properties.add(ColorProperty('surface', surface));
    properties.add(ColorProperty('background', background));
    properties.add(ColorProperty('scaffoldBackground', scaffoldBackground));
    properties.add(ColorProperty('appBarBackground', appBarBackground));
    properties.add(ColorProperty('dialogBackground', dialogBackground));
    properties.add(ColorProperty('onPrimary', onPrimary));
    properties.add(ColorProperty('onPrimaryContainer', onPrimaryContainer));
    properties.add(ColorProperty('onSecondary', onSecondary));
    properties.add(ColorProperty('onSecondaryContainer', onSecondaryContainer));
    properties.add(ColorProperty('onTertiary', onTertiary));
    properties.add(ColorProperty('onTertiaryContainer', onTertiaryContainer));
    properties.add(ColorProperty('onSurface', onSurface));
    properties.add(ColorProperty('onBackground', onBackground));
    properties.add(ColorProperty('onError', onError));
    properties.add(ColorProperty('surfaceTint', surfaceTint));
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
    properties.add(DiagnosticsProperty<List<String>>(
        'fontFamilyFallback', fontFamilyFallback));
    properties.add(DiagnosticsProperty<String>('package', package));
    properties.add(EnumProperty<MaterialTapTargetSize>(
        'materialTapTargetSize', materialTapTargetSize));
    properties.add(DiagnosticsProperty<PageTransitionsTheme>(
        'pageTransitionsTheme', pageTransitionsTheme));
    properties.add(EnumProperty<TargetPlatform>('platform', platform));
    properties.add(DiagnosticsProperty<Typography>('typography', typography));
    properties.add(DiagnosticsProperty<bool>(
        'applyElevationOverlayColor', applyElevationOverlayColor));
    properties.add(
        DiagnosticsProperty<FlexSubThemesData>('subThemesData', subThemesData));
    properties.add(DiagnosticsProperty<bool>('useMaterial3', useMaterial3));
    properties.add(
        IterableProperty<ThemeExtension<dynamic>>('extensions', extensions));
  }
}
