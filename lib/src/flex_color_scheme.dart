import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'flex_color.dart';
import 'flex_constants.dart';
import 'flex_extensions.dart';
import 'flex_scheme.dart';

/// Enum for using predefined surface branding strengths in [FlexColorScheme]
/// based themes.
///
/// This enum was used in FlexColorScheme versions before 4.0.0. It
/// has not yet been deprecated, but may be so in future version.
/// It is recommended to migrate to using the enum [FlexSurfaceMode]
/// parameter `surfaceMode` instead that replaces `surfaceStyle` and
/// offers more surface color configuration options and choices.
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

/// Enum for using predefined surface branding modes surface and background
/// colors in Flutter with [FlexColorScheme] based themes.
///
/// The mode [scaffoldSurfaceBackground] is closest to the style used in
/// [FlexColorScheme] before version 4.0.0 via the to be deprecated
/// [FlexSurface] enum property `surfaceStyle` in [FlexColorScheme].
enum FlexSurfaceMode {
  /// Increasing blend strengths in order scaffold, surface, background.
  ///
  /// The blend strength increases on surfaces in this order:
  /// * Scaffold background (0.25x)-> surface & dialogs (1x)-> background (2x)
  ///
  /// Theme primary color is used as blend color.
  ///
  /// This style can be used to approximate the one that is produced when using
  /// `surfaceStyle` property in FlexColorScheme.light and FlexColorScheme.dark.
  ///
  /// In combination with the blend strengths it approximates the same
  /// style where surface color has the lowest blend of primary color,
  /// background gets about double its blend and scaffold background color only
  /// gets any primary color blend in last style when using [FlexSurface.heavy].
  scaffoldSurfaceBackground,

  /// Increasing blend strengths in listed order, scaffoldm background, surface.
  ///
  /// The blend strength increases on surfaces in this order:
  /// * Scaffold background (0.25x)-> background (1x)-> surface & dialogs (2x)
  ///
  /// Theme primary color is used as blend color.
  ///
  /// This style can be used to approximate the one that is produced when using
  /// `surfaceStyle` property in FlexColorScheme.light and FlexColorScheme.dark.
  ///
  /// In combination with the blend strengths it approximates the same
  /// style where surface color has the lowest blend of primary color,
  /// background gets about double its blend and scaffold background color only
  /// gets any primary color blend in last style when using [FlexSurface.heavy].
  scaffoldBackgroundSurface,

  /// All surfaces have same alpha blend strength including scaffold background.
  ///
  /// The blend strength definition:
  /// * Scaffold background, surface, dialogs, background: (1x)
  ///
  /// If you want to get elevation overlay color in dark themes on all surfaces
  /// used by [Material] then use one of the modes that start with equal.
  /// Other modes will only use elevation overlay if their background happen to
  /// be equal to resulting colorScheme.surface color. For more information
  /// see issue: https://github.com/flutter/flutter/issues/90353
  equalAll,

  /// All surfaces have same alpha blend strength, but scaffold background is
  /// like classic, only at very high [FlexBlendLevel] does it get any blends.
  ///
  /// The blend strength definition:
  /// * Surface, dialogs, background (1x), scaffoldBackground (0.25x)
  ///
  /// Theme primary color is used as blend color.
  ///
  /// If you want to get elevation overlay color in dark themes on all surfaces
  /// used by [Material] then use one of the modes that start with `equal` in
  /// their name.
  /// Other modes will only use elevation overlay if their background happens to
  /// be equal to resulting colorScheme.surface color. For more information
  /// see issue: https://github.com/flutter/flutter/issues/90353
  equalSurfacesLowScaffold,

  /// All surfaces have same alpha blend strength, but scaffold background gets
  /// very high blends of the blend color.
  ///
  /// The blend strength definition:
  /// * Surface, dialogs, background (1x), scaffoldBackground (3x)
  ///
  /// Theme primary color is used as blend color.
  ///
  /// If you want to get elevation overlay color in dark themes on all surfaces
  /// used by [Material] then use one of the modes that start with `equal` in
  /// their name.
  /// Other modes will only use elevation overlay if their background happens to
  /// be equal to resulting colorScheme.surface color. For more information
  /// see issue: https://github.com/flutter/flutter/issues/90353
  equalSurfacesHighScaffold,

  /// All surfaces have same alpha blend strength, but scaffold background is
  /// like classic, only at very high [FlexBlendLevel] does it get any blends.
  ///
  /// The blend strength definition:
  /// * Surface, dialogs, background (1x), scaffoldBackground (0.25x)
  ///
  /// Theme primary color is used as blend color, but dialog background uses
  /// theme secondary as its blend color.
  ///
  /// If you want to get elevation overlay color in dark themes on all surfaces
  /// used by [Material] then use one of the modes that start with `equal` in
  /// their name.
  /// Other modes will only use elevation overlay if their background happens to
  /// be equal to resulting colorScheme.surface color. For more information
  /// see issue: https://github.com/flutter/flutter/issues/90353
  equalSurfacesLowScaffoldSecDialog,

  /// All surfaces have same alpha blend strength, but scaffold background gets
  /// very high blends of the blend color.
  ///
  /// The blend strength definition:
  /// * Surface, dialogs, background (1x), scaffoldBackground (3x)
  ///
  /// Theme primary color is used as blend color, but dialog background uses
  /// theme secondary as its blend color.
  ///
  /// If you want to get elevation overlay color in dark themes on all surfaces
  /// used by [Material] then use one of the modes that start with `equal` in
  /// their name.
  /// Other modes will only use elevation overlay if their background happens to
  /// be equal to resulting colorScheme.surface color. For more information
  /// see issue: https://github.com/flutter/flutter/issues/90353
  equalSurfacesHighScaffoldSecDialog,

  /// Use your own custom surface and background blend style.
  ///
  /// If you set this option and use the [FlexSchemeSurfaceColors.blend]
  /// constructor to make custom surface colors, the passed in `surfaceColors`
  /// property will be used as base surface for each surface color property.
  custom,
}

/// Enum describing the blend level strength of the blend color into the
/// surface color.
enum FlexBlendLevel {
  /// No blend color in the surface color.
  none,

  /// Level one: Alpha 0x01 in light mode and 0x02 in dark mode.
  one,

  /// Level two: Alpha 0x02 in light mode and 0x04 in dark mode.
  two,

  /// Level three: Alpha 0x05 in light mode and 0x0A in dark mode.
  three,

  /// Level four: Alpha 0x07 in light mode and 0x0E in dark mode.
  four,

  /// Level five: Alpha 0x0A in light mode and 0x14 in dark mode.
  five,

  /// Level six: Alpha 0x0C in light mode and 0x18 in dark mode.
  six,

  /// Level seven: Alpha 0x0F in light mode and 0x1E in dark mode.
  seven,

  /// Level eight: Alpha 0x11 in light mode and 0x22 in dark mode.
  eight,

  /// Level nine: Alpha 0x14 in light mode and 0x28 in dark mode.
  nine,

  /// Level ten: Alpha 0x16 in light mode and 0x2C in dark mode.
  ten,

  /// Level eleven: Alpha 0x19 in light mode and 0x32 in dark mode.
  eleven,

  /// Level twelve: Alpha 0x1C in light mode and 0x38 in dark mode.
  twelve,

  /// Level thirteen: Alpha 0x1E in light mode and 0x3C in dark mode.
  thirteen,

  /// Level fourteen: Alpha 0x21 in light mode and 0x42 in dark mode.
  fourteen,

  /// Level fifteen: Alpha 0x23 in light mode and 0x46 in dark mode.
  fifteen,
}

/// Map with blend level enum values to alpha blend value.
const Map<FlexBlendLevel, int> _kBlendToAlpha = <FlexBlendLevel, int>{
  FlexBlendLevel.none: 0x00,
  FlexBlendLevel.one: 0x01,
  FlexBlendLevel.two: 0x02,
  FlexBlendLevel.three: 0x05,
  FlexBlendLevel.four: 0x07,
  FlexBlendLevel.five: 0x0A,
  FlexBlendLevel.six: 0x0C,
  FlexBlendLevel.seven: 0x0F,
  FlexBlendLevel.eight: 0x11,
  FlexBlendLevel.nine: 0x14,
  FlexBlendLevel.ten: 0x16,
  FlexBlendLevel.eleven: 0x19,
  FlexBlendLevel.twelve: 0x1C,
  FlexBlendLevel.thirteen: 0x1E,
  FlexBlendLevel.fourteen: 0x21,
  FlexBlendLevel.fifteen: 0x23,
};

/// Light to dark mode alpha blend increase is 2x.
const int _lightToDarkFactor = 2;

/// Enum to select the used AppBarTheme style in [FlexColorScheme] based themes
/// when using its `light` and `dark` factories.
enum FlexAppBarStyle {
  /// Use the scheme primary color as app bar themed background color.
  ///
  /// This is the default for light themes.
  primary,

  /// Use Material surface color as app bar themed background color.
  ///
  /// This is the default for dark schemes.
  ///
  /// For a dark scheme this choice will result in a near black app bar. If this
  /// setting is used in a light scheme, it will result in a white app bar, as
  /// the standard Material surface color for light scheme is white.
  material,

  /// Use active surface color as app bar themed background color, including
  /// any primary blend it may have.
  surface,

  /// Use active background color as app bar themed background color, including
  /// any primary blend it may have.
  background,

  /// Use the color defined by the separate [FlexColorScheme.appBarBackground]
  /// color, as the themed app bar background color.
  ///
  /// The built in schemes use the same color as the one assigned to
  /// [FlexSchemeColor.secondaryVariant] as the color assigned to
  /// [FlexSchemeColor.appBarColor]. Custom schemes can assign any color
  /// to their [FlexSchemeColor.appBarColor] color. It does not have to be
  /// a part of the colors that are a part of standard [ColorScheme].
  ///
  /// When using the [custom] style option, the color assigned in
  /// [FlexSchemeColor.appBarColor] in the [FlexSchemeColor] passed to the
  /// factories [FlexColorScheme.light] or [FlexColorScheme.dark] `colors`
  /// property, will be used as the value for
  /// [FlexColorScheme.appBarBackground] when  the factory creates the
  /// [FlexColorScheme] object. If there is no custom color definition
  /// in factory `colors` in the used [FlexSchemeColor] passed to it, then
  /// the primary color will be used by the light factory and surface color will
  /// be used by the dark factory for the [FlexColorScheme.appBarBackground]
  /// color, thus defaulting to standard Flutter SDK app bar behaviour when
  /// the color for the [custom] choice is not defined and the [custom] option
  /// is passed to the factories.
  custom,
}

/// Enum used to define the [SystemUiOverlayStyle] for the system navigation
/// bar. Can be used with the [FlexColorScheme.themedSystemNavigationBar]
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

  /// An experimental feature. The goal is to make the system
  /// navigation bar fully transparent, showing the background, while navigation
  /// buttons float over the background. This feature only works if it is also
  /// configured in the Android embedder and on SDK 30 or higher.
  /// More information in this example: https://github.com/rydmike/sysnavbar
  transparent,
}

/// Enum to select TabBarTheme preference in [FlexColorScheme] based themes.
enum FlexTabBarStyle {
  /// Themed to fit with active FlexAppBarStyle and AppBarTheme.
  ///
  /// Indicator is white, text and icons follow on AppBar background color.
  forAppBar,

  /// Themed to fit with current background color.
  ///
  /// Indicator is primary color, text and icons fit on background colors.
  forBackground,
}

/// Make beautiful Flutter themes from built-in color schemes or custom color
/// colors and return them as Flutter [ThemeData] with the [toTheme] method.
///
/// Flutter's [ThemeData.from] is a good starting point for [ColorScheme] based
/// themes. It has a some gaps leaving a few properties in the theme
/// to their defaults from the standard [ThemeData] factory constructor, those
/// default values will end up not matching the used [ColorScheme], especially
/// in dark mode themes.
///
/// [FlexColorScheme] fixes the gaps and makes it easy to create complete
/// themes using the color scheme concept. [FlexColorScheme] does not rely
/// on [ThemeData.from] a [ColorScheme] for its implementation, it uses the
/// [ThemeData] factory directly under the hood to create the [ThemeData] object
/// from [FlexColorScheme] and a [ColorScheme] that is used to return a
/// slightly opinionated theme with the [toTheme] getter.
///
/// It can be tedious to define nice color scheme directly with the class
/// default constructor. [FlexColorScheme] is primarily intended to be used
/// with its two factory constructors [FlexColorScheme.light] and
/// [FlexColorScheme.dark], that can create nice schemes using defaults and
/// computed color values. With the light and dark factories you can create
/// beautiful toned themes from just one single color and it provides properties
/// that allows you to create themes with color branded surfaces automatically.
/// You can still customize all aspects with the factories as well, but you
/// usually don't have to.
///
/// [FlexColorScheme] makes it easier to make a theme where the app bar
/// theme background color is not tied to primary color in light theme mode or
/// to surface color in dark theme mode.
///
/// Additionally [FlexColorScheme] makes it easy to optionally create themes
/// that use color branded surfaces, that blend in a varying degree of the
/// color into surfaces and backgrounds. Branded surface are described in the
/// Material design guide, but Flutter offers no out of the box help to
/// make such themes. With [FlexColorScheme] you can use a varying degree of
/// surface and background branding level for any theme you make, both in light
/// and dark themes.
///
/// A [FlexColorScheme] can also adjust the [TabBarTheme] to fit with the
/// active [AppBar] background or to be themed to always fit on
/// background/surface colors, if its primary usage will be in e.g. a [Scaffold]
/// body, or [Material] surface or canvas.
///
/// You can also quickly adjust things like the scrim on the app bar in Android
/// with [transparentStatusBar] and tooltip style with
/// [tooltipsMatchBackground].
@immutable
class FlexColorScheme with Diagnosticable {
  /// Default constructor that requires [brightness] and color scheme color
  /// properties in order to make a fully defined color scheme for
  /// a [ThemeData] object.
  ///
  /// For more convenient usage of [FlexColorScheme] consider using its two
  /// factory two factory constructors [FlexColorScheme.light] and
  /// [FlexColorScheme.dark] that can create schemes using defaults and
  /// computed color values, with custom overrides as needed.
  ///
  /// The two factories also contain additional properties that can be used to
  /// create color branded surfaces, toggle the [AppBarTheme] between a few
  /// styles and to make dark themes that use true black backgrounds and
  /// surfaces.
  const FlexColorScheme({
    required final this.brightness,
    required final this.primary,
    required final this.primaryVariant,
    required final this.secondary,
    required final this.secondaryVariant,
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
  })  : assert(appBarElevation >= 0.0, 'AppBar elevation must be >= 0.'),
        assert(bottomAppBarElevation >= 0.0,
            'Bottom AppBar elevation must be >= 0.');

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
  /// In Flutter SDK the [primaryVariant] color is only used by [SnackBar]
  /// button color in dark theme mode as a part of predefined widget behavior.
  /// If you provide a custom [SnackBarThemeData] where you define
  /// [SnackBarThemeData.actionTextColor] to [primary] or [secondary], this
  /// color property becomes a good property to use if you need a custom color
  /// for custom widgets accessible via your application's ThemeData, that is
  /// not used as default color by any built-in widgets.
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
  /// In Flutter SDK the [secondaryVariant] color is not used by in any
  /// built-in widgets default themes or predefined widget behavior.
  /// It is an excellent property to use if you need a custom color for
  /// custom widgets accessible via your application's ThemeData, that is
  /// not used as default color by any built-in widgets.
  ///
  /// The color value is required and cannot be null.
  final Color secondaryVariant;

  /// The color to use for input validation errors, e.g. for
  /// [InputDecoration.errorText].
  ///
  /// If no value is given defaults to [FlexColor.materialLightError] if
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
  /// If no value is given, it defaults to [FlexColor.materialLightSurface] if
  /// brightness is light and to [FlexColor.materialDarkSurface] if
  /// brightness is dark.
  final Color? surface;

  /// A color that typically appears behind scrollable content.
  ///
  /// The color is applied to [ThemeData.canvasColor] and
  /// [ThemeData.backgroundColor], it is used eg by menu [Drawer] and by all
  /// [Material] of type [MaterialType.canvas].
  ///
  /// If no value is given, it defaults to [FlexColor.materialLightBackground]
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

  /// Text with a color that contrasts with the card and canvas colors.
  final TextTheme? textTheme;

  /// A text theme that contrasts with the primary color.
  final TextTheme? primaryTextTheme;

  /// Name of the font family to use as default for the theme.
  final String? fontFamily;

  /// The platform adaptive widgets should adapt to target and mechanics too.
  ///
  /// Same property as in [ThemeData] factory. Included for convenience to
  /// avoid a copyWith change it.
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
  final Typography? typography;

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
  /// color. This when using [FlexColorScheme.dark] use a [FlexSurfaceMode]
  /// that starts with `equal`. That said, if using heavy color branding,
  /// some surfaces may not need any overlay color, so the
  /// lack of it might not be an issue with other modes in such themes.
  /// For more information about this limitation see Flutter SDK issue:
  /// https://github.com/flutter/flutter/issues/90353
  final bool applyElevationOverlayColor;

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
  /// a [FlexScheme] `scheme` value would be provided to use a pre-defined color
  /// scheme or alternatively the [FlexSchemeColor] `colors` property would be
  /// used to define custom scheme colors. That can be created with just one
  /// color property by using the factory [FlexSchemeColor.from], more
  /// detailed color schemes can also be created with the factory.
  ///
  /// The factory contains a large number of other properties that can be used
  /// to create beautiful themes by just adjusting a few behavior properties.
  factory FlexColorScheme.light({
    //
    /// The `FlexSchemeColor` that we will create the light `FlexColorScheme`
    /// from.
    ///
    /// You can use predefined [FlexSchemeColor] values from [FlexColor] or
    /// [FlexColor.schemes] map or define your own colors with
    /// [FlexSchemeColor] or [FlexSchemeColor.from].
    ///
    /// For using built-in color schemed, the convenience shortcut to select
    /// it with the `scheme` property is recommended and leaving `colors`
    /// undefined. If both are specified the scheme colors defined by `colors`
    /// are used. If both are null then `scheme` defaults to
    /// [FlexScheme.material], thus defining the resulting scheme.
    final FlexSchemeColor? colors,

    /// A shortcut to use one of the built-in color schemes defined by
    /// enum `FlexScheme`.
    ///
    /// Just give it one of the enum values to use the scheme, like eg.
    /// [FlexScheme.mandyRed].
    ///
    /// To create custom color schemes use the `colors` property. If both
    /// `colors`and `scheme` are specified, the scheme defined by
    /// `colors` is used. If both are null, then `scheme` defaults to
    /// [FlexScheme.material], thus defining the resulting scheme.
    final FlexScheme? scheme,

    /// The number of the four main scheme colors to be used of the ones
    /// passed in via the required colors [FlexSchemeColor] property.
    ///
    /// This is a convenience property that allows you to vary which colors to
    /// use of the primary, secondary and variant colors included in `colors` in
    /// `FlexSchemeColor` The integer number corresponds to using:
    /// 1 = Only the primary color
    /// 2 = Primary + Secondary colors
    /// 3 = Primary + Primary variant + Secondary colors
    /// 4 = Primary + Primary variant + Secondary + Secondary variant colors
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

    /// Blends theme colors into surfaces and backgrounds. Consider using
    /// `surfaceStyle` instead.
    ///
    /// This property was used in FlexColorScheme before v4.0.0, it
    /// has not yet been deprecated, but may be so in future version.
    /// It is available for backwards compatibility.
    /// It is recommended to migrate to use `surfaceMode` instead, that replaces
    /// `surfaceStyle` and offers more surface color configuration options
    /// and choices.
    ///
    /// Defaults to [FlexSurface.material] which results in Flutter
    /// standard [ColorScheme.light] surface colors, which follows the
    /// default color scheme in the Material Design guide for light theme found
    /// [here](https://material.io/design/color/the-color-system.html#color-theme-creation).
    ///
    /// If values for the properties [surface], [background],
    /// [dialogBackground] or [scaffoldBackground] are given,
    /// they are used instead of values that would be assigned based
    /// on used [FlexSurfaceMode] via `surfaceMode` or [FlexSurface] in
    /// this `surfaceStyle`.
    final FlexSurface surfaceStyle = FlexSurface.material,

    /// Blends theme colors into surfaces and backgrounds.
    ///
    /// Prefer using `surfaceMode` over `surfaceStyle`, when making themes
    /// with color branded surface.
    ///
    /// If defined, used mode overrides the older `surfaceStyle`
    /// property setting. Prefer using `surfaceMode` over `surfaceStyle`,
    /// it offers more color branded surface modes and separate control over
    /// the used branding level via the separate `blendLevel` property.
    ///
    /// The mode [FlexSurfaceMode.scaffoldSurfaceBackground] is closest to the
    /// style used in [FlexColorScheme] before version 4.0.0 via the to be
    /// deprecated [FlexSurface] enum property `surfaceStyle` in
    /// [FlexColorScheme]. By adjusting `blendLevel` property and using this
    /// style, you can find a similar style when using
    /// [FlexSurfaceMode.scaffoldSurfaceBackground].
    ///
    /// In light theme mode:
    /// * [FlexSurface.material] : [FlexBlendLevel.none]
    /// * [FlexSurface.light] : [FlexBlendLevel.two]
    /// * [FlexSurface.medium] : [FlexBlendLevel.three]
    /// * [FlexSurface.strong] : [FlexBlendLevel.four]
    /// * [FlexSurface.heavy] : [FlexBlendLevel.five]
    ///
    /// If values for the properties `surface`, `background`,
    /// `dialogBackground` or `scaffoldBackground` are given in the constructor,
    /// they are used instead of values that would be assigned based
    /// on used [FlexSurfaceMode] via `surfaceMode` or [FlexSurface] in
    /// this `surfaceStyle`.
    final FlexSurfaceMode? surfaceMode,

    /// When `surfaceMode` is used, this defines the blend level strength used
    /// by the surface mode.
    ///
    /// Defaults to `FlexBlendLevel.three`.
    final FlexBlendLevel blendLevel = FlexBlendLevel.three,

    /// Style used to define the themed color of the [AppBar] background color.
    ///
    /// Defaults to [FlexAppBarStyle.primary] which produces the same results
    /// as a Flutter standard light [ThemeData.from] by tying the app bar color
    /// to the primary color.
    final FlexAppBarStyle appBarStyle = FlexAppBarStyle.primary,

    /// Select preferred themed style for the `TabBarTheme`
    ///
    /// By default the `TabBarTheme` is made to fit with the style of the
    /// [AppBar], via default value [FlexTabBarStyle.forAppBar].
    ///
    /// When setting this to [FlexTabBarStyle.forBackground], it will default
    /// to a theme that uses the color scheme and fits on background color,
    /// which typically also on works surface and scaffoldBackground color.
    /// This TabBarTheme style is useful if you primarily intended to use the
    /// TabBar in a Scaffold, Dialog, Drawer or Side panel on their background
    /// colors.
    final FlexTabBarStyle tabBarStyle = FlexTabBarStyle.forAppBar,

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

    /// The color displayed most frequently across your app’s screens and
    /// components.
    ///
    /// When using the factory this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] `colors` or for this color defined when using a
    /// pre-defined color scheme based on [FlexScheme] `scheme` property.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the factory behavior.
    /// The override color is however included and affected by factory
    /// properties `usedColors` and `swapColors` and included in their behavior.
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
    /// not used as default color by any built-in widgets.
    ///
    /// When using the factory this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] `colors` or for this color defined when using a
    /// pre-defined color scheme based on [FlexScheme] `scheme` property.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the factory behavior.
    /// The override color is however included and affected by factory
    /// properties `usedColors` and `swapColors` and included in their behavior.
    ///
    /// Defaults to null.
    final Color? primaryVariant,

    /// An accent color that, when used sparingly, calls attention to parts
    /// of your app.
    ///
    /// When using the factory this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] `colors` or for this color defined when using a
    /// pre-defined color scheme based on [FlexScheme] `scheme` property.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the factory behavior.
    /// The override color is however included and affected by factory
    /// properties `usedColors` and `swapColors` and included in their behavior.
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
    /// [FlexSchemeColor] `colors` or for this color defined when using a
    /// pre-defined color scheme based on [FlexScheme] `scheme` property.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the factory behavior.
    /// The override color is however included and affected by factory
    /// properties `usedColors` and `swapColors` and included in their behavior.
    ///
    /// Defaults to null.
    final Color? secondaryVariant,

    /// The surface (background) color for widgets like [Card] and
    /// [BottomAppBar].
    ///
    /// The color is applied to [ThemeData.cardColor] and
    /// [ColorScheme.surface] in [ThemeData.colorScheme], it is also used
    /// by all [Material] of type [MaterialType.card].
    ///
    /// When using the factory this is an override color for the color that
    /// would be used based on mode defined by property
    /// `surfaceMode` [FlexSurfaceMode] enum or `surfaceStyle` enum
    /// [FlexSurface].
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
    /// `surfaceMode` [FlexSurfaceMode] enum or `surfaceStyle` enum
    /// [FlexSurface].
    ///
    /// Defaults to null.
    final Color? background,

    /// The color of the [Scaffold] background.
    ///
    /// The color is applied to [ThemeData.scaffoldBackgroundColor].
    ///
    /// When using the factory this is an override color for the color that
    /// would be used based on mode defined by property
    /// `surfaceMode` [FlexSurfaceMode] enum or `surfaceStyle` enum
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
    /// `surfaceMode` [FlexSurfaceMode] enum or `surfaceStyle` enum
    /// [FlexSurface].
    ///
    /// Defaults to null.
    final Color? dialogBackground,

    /// Background theme color for the [AppBar].
    ///
    /// When using the factory this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] `colors` or for this color defined when using a
    /// pre-defined color scheme based on [FlexScheme] `scheme` property and
    /// the [FlexAppBarStyle] `appBarStyle` property.
    final Color? appBarBackground,

    /// A color that is clearly legible when drawn on [primary] color.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// [primary] and [onPrimary] is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// If null, the on color is derived from the brightness of the [primary]
    /// color, and will be be black if it is light and white if it is dark.
    final Color? onPrimary,

    /// A color that is clearly legible when drawn on [secondary] color.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// [secondary] and [onSecondary] is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// If null, the on color is derived from the brightness of the [secondary]
    /// color, and will be be black if it is light and white if it is dark.
    final Color? onSecondary,

    /// A color that is clearly legible when drawn on [surface] color.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// [surface] and [onSurface] is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// If null, the on color is derived from the brightness of the [surface]
    /// color, and will be be black if it is light and white if it is dark.
    final Color? onSurface,

    /// A color that is clearly legible when drawn on [background] color.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// [background] and [onBackground] is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// If null, the on color is derived from the brightness of the [background]
    /// color, and will be be black if it is light and white if it is dark.
    final Color? onBackground,

    /// A color that is clearly legible when drawn on [error] color.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// [error] and [onError] is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// If null, the on color is derived from the brightness of the [error]
    /// color, and will be be black if it is light and white if it is dark.
    final Color? onError,

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
  }) {
    // LIGHT: Check valid inputs
    assert(usedColors >= 1 && usedColors <= 4, 'usedColors must be 1 to 4');
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
    // If the passed in property values are not null, we will override colors
    // properties with them, this gets us also correct effective and swap
    // behavior on directly passed in property values.
    final FlexSchemeColor _copyColors = _colors.copyWith(
      primary: primary,
      primaryVariant: primaryVariant,
      secondary: secondary,
      secondaryVariant: secondaryVariant,
    );
    // Effective FlexSchemeColor depends on colors, usedColors and swapColors.
    final FlexSchemeColor _effectiveColors = FlexSchemeColor.effective(
        _copyColors, usedColors,
        swapColors: swapColors);

    // If [surfaceStyle] is [FlexSurface.custom] then the returned
    // _surfaceSchemeColors will be same as [FlexSurface.material], to get a
    // different result surface colors must be been passed in to
    // FlexColorScheme.light. It is up to the implementation using
    // [FlexSurface.custom] to do so. The returned _surfaceSchemeColors
    // will NEVER be null, it always has colors.
    //
    // If surfaceMode is not null we use the never blend mode and level via
    // factory FlexSchemeSurfaceColors.flexBlend otherwise we use the one
    // defined by factory FlexSchemeSurfaceColors.from.
    final FlexSchemeSurfaceColors _surfaceSchemeColors = surfaceMode != null
        ? FlexSchemeSurfaceColors.blend(
            brightness: Brightness.light,
            surfaceMode: surfaceMode,
            blendLevel: blendLevel,
            schemeColors: _effectiveColors,
          )
        : FlexSchemeSurfaceColors.from(
            brightness: Brightness.light,
            surfaceStyle: surfaceStyle,
            primary: _effectiveColors.primary,
          );

    // For the on colors we pass in the primary, secondary and surface colors to
    // calculate onColors for. If some onColors were passed in, we give
    // that value to it, if it was not null it will be used instead of the
    // calculated on color.
    final FlexSchemeOnColors _onColors = FlexSchemeOnColors.from(
      primary: _effectiveColors.primary,
      secondary: _effectiveColors.secondary,
      surface: surface ?? _surfaceSchemeColors.surface,
      background: background ?? _surfaceSchemeColors.background,
      error: _effectiveColors.error ?? FlexColor.materialLightError,
      onPrimary: onPrimary,
      onSecondary: onSecondary,
      onSurface: onSurface,
      onBackground: onBackground,
      onError: onError,
    );

    // Get the effective app bar color based on the style
    Color? _effectiveAppBarColor;
    switch (appBarStyle) {
      case FlexAppBarStyle.primary:
        _effectiveAppBarColor = _effectiveColors.primary;
        break;
      case FlexAppBarStyle.material:
        _effectiveAppBarColor = FlexColor.materialLightSurface;
        break;
      case FlexAppBarStyle.background:
        _effectiveAppBarColor = background ?? _surfaceSchemeColors.background;
        break;
      case FlexAppBarStyle.surface:
        _effectiveAppBarColor = surface ?? _surfaceSchemeColors.surface;
        break;
      case FlexAppBarStyle.custom:
        _effectiveAppBarColor =
            _effectiveColors.appBarColor ?? _effectiveColors.primary;
        break;
    }
    return FlexColorScheme(
      brightness: Brightness.light,
      // Primary color for the application
      primary: _effectiveColors.primary,
      // The primary variant should generally be a bit darker color than
      // primary, preferably of a color like it or darker hue of primary.
      // If no value was provided we use a hue that is 10% darker.
      primaryVariant: _effectiveColors.primaryVariant,
      // The secondary color for the application. If you do not want
      // to use it set it to the same color as primary. For a subtle
      // one color based theme you can use a hue of the primary.
      // We use one that is 5% darker than primary, if not given.
      secondary: _effectiveColors.secondary,
      // The secondary variant should generally be a bit darker color than
      // secondary, preferably of a color like it or darker hue of secondary.
      // We use any provided value, if none darken the secondary and if no
      // secondary was provided we darken the primary 15%.
      secondaryVariant: _effectiveColors.secondaryVariant,
      // Surface is used e.g. by Card and bottom appbar.
      surface: surface ?? _surfaceSchemeColors.surface,
      // Background is used e.g. by drawer and bottom nav bar.
      background: background ?? _surfaceSchemeColors.background,
      // Color of the scaffold background.
      scaffoldBackground:
          scaffoldBackground ?? _surfaceSchemeColors.scaffoldBackground,
      // Color of dialog background elements, a passed in dialogBackground
      // color will override the factory style, if provided.
      dialogBackground:
          dialogBackground ?? _surfaceSchemeColors.dialogBackground,
      // Set app bar background to effective background color, but a passed
      // in appBarBackground will override it if provided.
      appBarBackground: appBarBackground ?? _effectiveAppBarColor,
      // Effective error color and null fallback.
      error: _effectiveColors.error ?? FlexColor.materialLightError,
      onPrimary: _onColors.onPrimary,
      onSecondary: _onColors.onSecondary,
      onSurface: _onColors.onSurface,
      onBackground: _onColors.onBackground,
      onError: _onColors.onError,
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
  /// a [FlexScheme] `scheme` value would be provided to use a pre-defined color
  /// scheme or alternatively the [FlexSchemeColor] `colors` property would be
  /// used to define custom scheme colors. That can be created with just one
  /// color property by using the factory [FlexSchemeColor.from], more
  /// detailed color schemes can also be crated with the factory.
  ///
  /// The factory contains a large number of other properties that can be used
  /// to create beautiful themes by just adjusting a few behavior properties.
  factory FlexColorScheme.dark({
    //
    /// The [FlexSchemeColor] that we will create the dark [FlexColorScheme]
    /// from.
    ///
    /// You can use predefined [FlexSchemeColor] values from [FlexColor] or
    /// [FlexColor.schemes] map or define your own colors with
    /// [FlexSchemeColor] or [FlexSchemeColor.from].
    ///
    /// For using built-in color schemes, the convenience shortcut to select
    /// it with the `scheme` property is recommended and leaving `colors`
    /// undefined. If both are specified the scheme colors defined by `colors`
    /// are used. If both are null then `scheme` defaults to
    /// [FlexScheme.material], thus defining the resulting scheme.
    final FlexSchemeColor? colors,

    /// A shortcut to use one of the built-in color schemes defined by
    /// enum [FlexScheme].
    ///
    /// Just give it one of the enum values to use the scheme, like eg.
    /// [FlexScheme.mandyRed].
    ///
    /// To create custom color schemes use the `colors` property. If both
    /// `colors`and `scheme` are specified, the scheme defined by
    /// `colors` is used. If both are null, then `scheme` defaults to
    /// [FlexScheme.material], thus defining the resulting scheme.
    final FlexScheme? scheme,

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
    final int usedColors = 4,

    /// Blends theme colors into surfaces and backgrounds. Consider using
    /// `surfaceStyle` instead.
    ///
    /// This property was used in FlexColorScheme before v4.0.0, it
    /// has not yet been deprecated, but may be so in future version.
    /// It is available for backwards compatibility.
    /// It is recommended to migrate to use `surfaceMode` instead, that replaces
    /// `surfaceStyle` and offers more surface color configuration options
    /// and choices.
    ///
    /// Defaults to [FlexSurface.material] which results in Flutter
    /// standard [ColorScheme.dark] surface colors, which follows the
    /// default color scheme in the Material Design
    /// guide for dark theme found here:
    /// https://material.io/design/color/dark-theme.html#ui-application
    ///
    /// If values for the properties [surface], [background],
    /// [dialogBackground] or [scaffoldBackground] are given,
    /// they are used instead of values that would be assigned based
    /// on used [FlexSurfaceMode] via `surfaceMode` or [FlexSurface] in
    /// this `surfaceStyle`.
    final FlexSurface surfaceStyle = FlexSurface.material,

    /// Blends theme colors into surfaces and backgrounds.
    ///
    /// Prefer using `surfaceMode` over `surfaceStyle`, when making themes
    /// with color branded surface.
    ///
    /// If defined, used mode overrides the older `surfaceStyle`
    /// property setting. Prefer using `surfaceMode` over `surfaceStyle`,
    /// it offers more color branded surface modes and separate control over
    /// the used branding level via the separate `blendLevel` property.
    ///
    /// The mode [FlexSurfaceMode.scaffoldSurfaceBackground] is closest to the
    /// style used in [FlexColorScheme] before version 4.0.0 via the to be
    /// deprecated [FlexSurface] enum property `surfaceStyle` in
    /// [FlexColorScheme]. By adjusting `blendLevel` property and using this
    /// style, you can find a similar style. These is not always a
    /// complete match when using [FlexSurfaceMode.scaffoldSurfaceBackground].
    ///
    /// In dark theme mode:
    /// * [FlexSurface.material] : [FlexBlendLevel.none]
    /// * [FlexSurface.light] : [FlexBlendLevel.two]
    /// * [FlexSurface.medium] : [FlexBlendLevel.three]
    /// * [FlexSurface.strong] : [FlexBlendLevel.four]
    /// * [FlexSurface.heavy] : The exact value is between [FlexBlendLevel.five]
    ///   and [FlexBlendLevel.four] and cannot be represented exactly, we
    ///   recommend using [FlexBlendLevel.five].
    ///
    /// If values for the properties `surface`, `background`,
    /// `dialogBackground` or `scaffoldBackground` are given in the constructor,
    /// they are used instead of values that would be assigned based
    /// on used [FlexSurfaceMode] via `surfaceMode` or [FlexSurface] in
    /// this `surfaceStyle`.
    final FlexSurfaceMode? surfaceMode,

    /// When `surfaceMode` is used, this defines the blend level strength used
    /// by the surface mode.
    ///
    /// Defaults to FlexBlendLevel.three,
    final FlexBlendLevel blendLevel = FlexBlendLevel.three,

    /// Style used to define the themed color of the [AppBar] background color.
    ///
    /// Defaults to [FlexAppBarStyle.material] which produces the same results
    /// as a Flutter standard dark [ThemeData.from] by tying the app bar color
    /// to the surface color.
    final FlexAppBarStyle appBarStyle = FlexAppBarStyle.material,

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

    /// The color displayed most frequently across your app’s screens and
    /// components.
    ///
    /// When using the factory this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] `colors` or for this color defined when using a
    /// pre-defined color scheme based on [FlexScheme] `scheme` property.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the factory behavior.
    /// The override color is however included and affected by factory
    /// properties `usedColors` and `swapColors` and included in their behavior.
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
    /// not used as default color by any built-in widgets.
    ///
    /// When using the factory this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] `colors` or for this color defined when using a
    /// pre-defined color scheme based on [FlexScheme] `scheme` property.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the factory behavior.
    /// The override color is however included and affected by factory
    /// properties `usedColors` and `swapColors` and included in their behavior.
    ///
    /// Defaults to null.
    final Color? primaryVariant,

    /// An accent color that, when used sparingly, calls attention to parts
    /// of your app.
    ///
    /// When using the factory this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] `colors` or for this color defined when using a
    /// pre-defined color scheme based on [FlexScheme] `scheme` property.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the factory behavior.
    /// The override color is however included and affected by factory
    /// properties `usedColors` and `swapColors` and included in their behavior.
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
    /// [FlexSchemeColor] `colors` or for this color defined when using a
    /// pre-defined color scheme based on [FlexScheme] `scheme` property.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the factory behavior.
    /// The override color is however included and affected by factory
    /// properties `usedColors` and `swapColors` and included in their behavior.
    ///
    /// Defaults to null.
    final Color? secondaryVariant,

    /// The surface (background) color for widgets like [Card] and
    /// [BottomAppBar].
    ///
    /// The color is applied to [ThemeData.cardColor] and
    /// [ColorScheme.surface] in [ThemeData.colorScheme], it is also used
    /// by all [Material] of type [MaterialType.card].
    ///
    /// When using the factory this is an override color for the color that
    /// would be used based on mode defined by property
    /// `surfaceMode` [FlexSurfaceMode] enum or `surfaceStyle` enum
    /// [FlexSurface].
    /// In dark mode this override color is also affected by the
    /// `darkIsTrueBlack` property.
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
    /// `surfaceMode` [FlexSurfaceMode] enum or `surfaceStyle` enum
    /// [FlexSurface].
    /// In dark mode this override color is also affected by the
    /// `darkIsTrueBlack` property.
    ///
    /// Defaults to null.
    final Color? background,

    /// The color of the [Scaffold] background.
    ///
    /// The color is applied to [ThemeData.scaffoldBackgroundColor].
    ///
    /// When using the factory this is an override color for the color that
    /// would be used based on mode defined by property
    /// `surfaceMode` [FlexSurfaceMode] enum or `surfaceStyle` enum
    /// [FlexSurface].
    /// In dark mode this override color is also affected by the
    /// `darkIsTrueBlack` property.
    ///
    /// Defaults to null.
    final Color? scaffoldBackground,

    /// The background color of Dialog elements.
    ///
    /// When using the factory this is an override color for the color that
    /// would be used based on mode defined by property
    /// `surfaceMode` [FlexSurfaceMode] enum or `surfaceStyle` enum
    /// [FlexSurface].
    /// In dark mode this override color is also affected by the
    /// `darkIsTrueBlack` property.
    ///
    /// Defaults to null.
    final Color? dialogBackground,

    /// Background theme color for the [AppBar].
    ///
    /// When using the factory this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] `colors` or for this color defined when using a
    /// pre-defined color scheme based on [FlexScheme] `scheme` property and
    /// the [FlexAppBarStyle] `appBarStyle` property.
    final Color? appBarBackground,

    /// A color that is clearly legible when drawn on [primary] color.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// [primary] and [onPrimary] is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// If null, the on color is derived from the brightness of the [primary]
    /// color, and will be be black if it is light and white if it is dark.
    final Color? onPrimary,

    /// A color that is clearly legible when drawn on [secondary] color.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// [secondary] and [onSecondary] is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// If null, the on color is derived from the brightness of the [secondary]
    /// color, and will be be black if it is light and white if it is dark.
    final Color? onSecondary,

    /// A color that is clearly legible when drawn on [surface] color.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// [surface] and [onSurface] is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// If null, the on color is derived from the brightness of the [surface]
    /// color, and will be be black if it is light and white if it is dark.
    final Color? onSurface,

    /// A color that is clearly legible when drawn on [background] color.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// [background] and [onBackground] is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// If null, the on color is derived from the brightness of the [background]
    /// color, and will be be black if it is light and white if it is dark.
    final Color? onBackground,

    /// A color that is clearly legible when drawn on [error] color.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// [error] and [onError] is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// If null, the on color is derived from the brightness of the [error]
    /// color, and will be be black if it is light and white if it is dark.
    final Color? onError,

    /// Makes the dark theme even darker.
    ///
    /// Scaffold background will become fully black, and other surfaces also
    /// get considerably darker and if only using low blend levels they may
    /// become fully black too.
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
  }) {
    // DARK: Check valid inputs
    assert(usedColors >= 1 && usedColors <= 4, 'usedColors must be 1 to 4.');
    assert(appBarElevation >= 0.0, 'AppBar elevation must be >= 0.');
    assert(bottomAppBarElevation == null || bottomAppBarElevation >= 0.0,
        'Bottom AppBar elevation must be null or must be >= 0.');
    // If bottomAppBarElevation is null, fallback to appBarElevation.
    final double _bottomAppBarElevation =
        bottomAppBarElevation ?? appBarElevation;

    // Fallback value for scheme is default material scheme.
    final FlexScheme _scheme = scheme ?? FlexScheme.material;
    // If colors was null, we used the scheme based value.
    final FlexSchemeColor _colors =
        colors ?? FlexColor.schemesWithCustom[_scheme]!.dark;
    // If the passed in property values are not null, we will override colors
    // properties with them, this gets us also correct effective and swap
    // behavior on directly passed in property values.
    final FlexSchemeColor _copyColors = _colors.copyWith(
      primary: primary,
      primaryVariant: primaryVariant,
      secondary: secondary,
      secondaryVariant: secondaryVariant,
    );
    // Effective FlexSchemeColor depends on colors, usedColors and swapColors.
    final FlexSchemeColor _effectiveColors = FlexSchemeColor.effective(
      _copyColors,
      usedColors,
      swapColors: swapColors,
    );

    // If [surfaceStyle] is [FlexSurface.custom] then the returned
    // _surfaceSchemeColors will be same as [FlexSurface.material], to get a
    // different result surface colors must be been passed in to
    // FlexColorScheme.light. It is up to the implementation using
    // [FlexSurface.custom] to do so. The returned _surfaceSchemeColors
    // will NEVER be null, it always has colors.
    //
    // If surfaceMode is not null we use the never blend mode and level via
    // factory FlexSchemeSurfaceColors.flexBlend otherwise we use the one
    // defined by factory FlexSchemeSurfaceColors.from.
    final FlexSchemeSurfaceColors _surfaceSchemeColors = surfaceMode != null
        ? FlexSchemeSurfaceColors.blend(
            brightness: Brightness.dark,
            surfaceMode: surfaceMode,
            blendLevel: blendLevel,
            schemeColors: _effectiveColors,
          )
        : FlexSchemeSurfaceColors.from(
            brightness: Brightness.dark,
            surfaceStyle: surfaceStyle,
            primary: _effectiveColors.primary,
          );

    // For the on colors we pass in the primary, secondary and surface colors to
    // calculate onColors for. If some onColors were passed in, we give
    // that value to it, if it was not null it will be used instead of the
    // calculated on color.
    final FlexSchemeOnColors _onColors = FlexSchemeOnColors.from(
      primary: _effectiveColors.primary,
      secondary: _effectiveColors.secondary,
      surface: surface ?? _surfaceSchemeColors.surface,
      background: background ?? _surfaceSchemeColors.background,
      error: _effectiveColors.error ?? FlexColor.materialDarkError,
      onPrimary: onPrimary,
      onSecondary: onSecondary,
      onSurface: onSurface,
      onBackground: onBackground,
      onError: onError,
    );

    // Determine effective surface color.
    // Surface is used e.g. by Card and bottom appbar.
    // If true black, we make a darker than normal surface. If not
    // true black, we use provided surface color, or computed one.
    Color _effectiveSurfaceColor;
    if (darkIsTrueBlack) {
      _effectiveSurfaceColor =
          surface?.darken(8) ?? _surfaceSchemeColors.surface.darken(8);
    } else {
      _effectiveSurfaceColor = surface ?? _surfaceSchemeColors.surface;
    }

    // Determine effective background color.
    // Used e.g. by drawer, nav rail, side menu and bottom bar.
    // If true black, we use darker then normal background. If not true black,
    // we use provided background color, or computed one.
    Color _effectiveBackgroundColor;
    if (darkIsTrueBlack) {
      _effectiveBackgroundColor =
          background?.darken(8) ?? _surfaceSchemeColors.background.darken(8);
    } else {
      _effectiveBackgroundColor = background ?? _surfaceSchemeColors.background;
    }

    // Determine effective dialog background color.
    // If true black, we use darker then normal. If not true black,
    // we use dialog provided background color, or computed one.
    // The provided dialog background color overrides factory surface behavior,
    // but is impacted by true black mode.
    Color _effectiveDialogBackground;
    if (darkIsTrueBlack) {
      _effectiveDialogBackground = dialogBackground?.darken(8) ??
          _surfaceSchemeColors.dialogBackground.darken(8);
    } else {
      _effectiveDialogBackground =
          dialogBackground ?? _surfaceSchemeColors.dialogBackground;
    }

    // Get the effective app bar color based on the style
    Color? _effectiveAppBarColor;
    switch (appBarStyle) {
      case FlexAppBarStyle.primary:
        _effectiveAppBarColor = _effectiveColors.primary;
        break;
      case FlexAppBarStyle.material:
        _effectiveAppBarColor = darkIsTrueBlack
            ? const Color(0xFF000000)
            : FlexColor.materialDarkSurface;
        break;
      case FlexAppBarStyle.background:
        _effectiveAppBarColor = _effectiveBackgroundColor;
        break;
      case FlexAppBarStyle.surface:
        _effectiveAppBarColor = _effectiveSurfaceColor;
        break;
      case FlexAppBarStyle.custom:
        _effectiveAppBarColor = _effectiveColors.appBarColor ??
            (darkIsTrueBlack
                ? const Color(0xFF000000)
                : FlexColor.materialDarkSurface);
        break;
    }
    return FlexColorScheme(
      brightness: Brightness.dark,
      // Primary color for the application.
      primary: _effectiveColors.primary,
      // The primary variant should generally be a bit darker color than
      // primary, preferably of a color like it or darker hue of primary.
      // If no value was provided we make a hue that is 10% darker.
      primaryVariant: _effectiveColors.primaryVariant,
      // The secondary color for the application. If you do not want
      // to use it set it to the same color as primary. For a subtle
      // one color based theme you can use a hue of the primary.
      // This creates one that is 5% darker than primary, if not given.
      secondary: _effectiveColors.secondary,
      // The secondary variant should generally be a bit darker color than
      // secondary, preferably of a color like it or darker hue of secondary.
      // We us any provided value, if none darken the secondary and if no
      // secondary was provided we darken the primary 15%
      secondaryVariant: _effectiveColors.secondaryVariant,
      // Surface is used e.g. by Card and bottom appbar and in this
      // implementation also by dialogs.
      surface: _effectiveSurfaceColor,
      // Used e.g. by drawer, nav rail, side menu and bottom bar.
      background: _effectiveBackgroundColor,
      // If darkIsTrueBlack is set, we use black as default scaffold background,
      // otherwise provided values are used, if null then the default is 8%
      // of Primary color on dark grey #121212.
      // Fallback from theme, to custom value to material default const.
      scaffoldBackground: darkIsTrueBlack
          ? const Color(0xFF000000)
          : scaffoldBackground ?? _surfaceSchemeColors.scaffoldBackground,
      // Color of dialog background elements.
      dialogBackground: _effectiveDialogBackground,
      // Set app bar background to effective background color.
      appBarBackground: appBarBackground ?? _effectiveAppBarColor,
      // Effective error color and null fallback.
      error: _effectiveColors.error ?? FlexColor.materialDarkError,
      onPrimary: _onColors.onPrimary,
      onSecondary: _onColors.onSecondary,
      onSurface: _onColors.onSurface,
      onBackground: _onColors.onBackground,
      onError: _onColors.onError,
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
    );
  }

  //****************************************************************************
  //
  // STATIC HELPER FUNCTIONS
  //
  //  * comfortablePlatformDensity
  //  * themedSystemNavigationBar
  //  * createPrimarySwatch
  //
  //****************************************************************************

  /// Returns a [VisualDensity] that is adaptive to `comfortable` instead
  /// of to the default `compact`, based on active [defaultTargetPlatform].
  ///
  /// For desktop platforms, this returns [VisualDensity.comfortable], and
  /// for other platforms, it returns the default [VisualDensity].
  /// This is a variant of the [VisualDensity.adaptivePlatformDensity] that
  /// returns [VisualDensity.compact] for the desktop platforms. If this seems
  /// too dense and you prefer `comfortable` on desktop and still like the even
  /// less dense default on on devices, then use this platform dependent
  /// [VisualDensity] function as `visualDensity` for your theme.
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
  /// styles you should use [SystemUiOverlayStyle] directly.
  ///
  /// By default when calling [themedSystemNavigationBar] with context, it
  /// creates a [SystemUiOverlayStyle] where the system navigator bar uses
  /// current theme's ´colorScheme.background´ as its background color and
  /// icon colors that match this background, without any divider.
  ///
  /// The background color can be modified with [systemNavBarStyle] that
  /// can use: system, surface, background, scaffoldBackground or transparent
  /// options as background color options, it defaults to background.
  /// See [FlexSystemNavBarStyle] for more info.
  ///
  /// In standard Flutter themes, the surface, background, scaffoldBackground
  /// and in light theme, even system are all the same color. For such themes
  /// this convenience toggle does not make so much sense. However, if you use
  /// FlexColorScheme and its primary color surface branding, these colors are
  /// not the same, this toggle then offer a convenient way to switch the
  /// background color of your system navigation bar in a way that matches
  /// your theme's surface branded background color and to easily choose which
  /// one to use easily.
  ///
  /// An optional divider on the navigation bar, which is only
  /// respected on Android P (= Pie = API 28 = Android 9) or higher, can be
  /// turned by setting [useDivider] to true. This produces a divider on top of
  /// the system navigation bar that in light theme uses color 0xFF2C2C2C and
  /// in dark mode and 0xFFDDDDDD in light mode.
  ///
  /// Be aware that once you have enabled the divider by setting it to true that
  /// there is not any convenient way to get rid of it. You can set the value
  /// to false, but that will just make the divider same color as your current
  /// nav bar background color to make it invisible, it is still there.
  ///
  /// You can modify the default color of the divider with the optional
  /// [systemNavigationBarDividerColor]. The call to set and use the divider
  /// color is only made once a none null value has been given to [useDivider].
  /// Android does not use any provided alpha value on the color of the
  /// divider color and calling it with null again will not remove it. Unless
  /// you are working with experimental transparent system navigation bars. If
  /// you are, then transparency or alpha channel on the divider also works.
  ///
  /// Use and support for the [opacity] value on the system navigation bar
  /// is EXPERIMENTAL, it ONLY works on Android API 30 (=Android 11) or higher.
  /// For more information and a complete example of how it can be used,
  /// please see: https://github.com/rydmike/sysnavbar
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
    final bool? useDivider,

    /// Opacity value for the system navigation bar.
    ///
    /// The opacity value is applied to the provided `systemNavigationBarColor`
    /// or if is null, to the color determined by `systemNavBarStyle`.
    ///
    /// Defaults to 1, fully opaque.
    ///
    /// Use and support for this opacity value is EXPERIMENTAL, it ONLY
    /// works on Android API 30 (=Android 11) or higher. For more information
    /// and complete example of how it can be used, please see:
    /// https://github.com/rydmike/sysnavbar
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
    // Opacity validity checks and enforcement, we ignore the parameter
    // re-assignment lint rule.
    double _opacity = opacity;
    // ignore: parameter_assignments
    if (_opacity < 0) _opacity = 0;
    // ignore: parameter_assignments
    if (_opacity > 1) _opacity = 1;

    // If systemNavigationBarColor is null, we assign nullContextBackground
    // to it, that may also be null. This is done for backwards compatibility.
    final Color? _systemNavigationBarColor =
        systemNavigationBarColor ?? nullContextBackground;

    // If the systemNavBarStyle is FlexSystemNavBarStyle.transparent we will
    // override opacity to 0.01.
    if (systemNavBarStyle == FlexSystemNavBarStyle.transparent) {
      _opacity = 0.01; // ignore: parameter_assignments
    }
    // If context was null, use nullContextBrightness as brightness value.
    final bool isDark = context != null
        ? Theme.of(context).brightness == Brightness.dark
        : nullContextBrightness == Brightness.dark;

    // Get the defined effective background color for the used style.
    final Color _flexBackground = (context != null)
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
    // If it is not given, we use above _flexBackground.
    final Color background = _systemNavigationBarColor ?? _flexBackground;

    // A divider will be applied if `useDivider` is true and it will
    // use provided `systemNavigationBarDividerColor` if a value was given
    // or fallback to suitable theme mode default divider colors if no
    // color was given.
    //
    // The used default system navigation bar divider colors below were tuned
    // to fit well with most color schemes and possible surface branding.
    // Using the theme divider color does not work, as Android system calls do
    // not use the alpha channel value in the passed color. Default divider
    // theme color uses alpha, using it here does not look good at all as the
    // alpha channel value is not used. If you are working with enabled
    // transparent system navigation bar on Android API 30 or higher, then
    // opacity on the divider also works as expected.
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
    // Worth noticing is also the the opacity does not really have any effect on
    // divider color in most versions of Android. We apply it here anyway
    // because if you are experimenting with transparent system navigation bar
    // on Android API30 or higher it does work. It would be nice if it worked
    // on lower version and without adjusting the Android embedder, then we
    // could use Flutter default Divider theme color as its color.
    Color? dividerColor;

    if (useDivider == null) {
      // The dividerColor is already null from declaration above with no value,
      // but being explicit that in this case this is the case where we want a
      // null color value for the divider as well in order to not include it
      // in the `SystemUiOverlayStyle`.
      dividerColor = null;
    } else if (useDivider && systemNavigationBarDividerColor == null) {
      // We should have a divider, but have no given color, use defaults.
      dividerColor = isDark
          ? const Color(0xFF2C2C2C).withOpacity(_opacity)
          : const Color(0xFFDDDDDD).withOpacity(_opacity);
    } else if (useDivider && systemNavigationBarDividerColor != null) {
      // We should have a divider, with a given color.
      dividerColor = systemNavigationBarDividerColor.withOpacity(_opacity);
    } else {
      // If this is reached, then useDivider is false and we must define its
      // color to whatever color the background is, in order to hide it as well
      // as possible.
      dividerColor = background.withOpacity(_opacity);
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
  /// with your own theme modifications by using the `copyWith` method on the
  /// resulting theme.
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
  ///  * The `dialogBackgroundColor` uses the `ColorScheme.surface` color
  ///    instead of the `ColorScheme.background`. The `background` color needed
  ///    the strongest branding when branding is used, but this did not look
  ///    so good on dialogs, so its color choice was changed to `surface`
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
  ///   the selected item. Flutter defaults to secondary color. Primary color
  ///   is a design used on iOS by default for the bottom navigation bar. We
  ///   agree and think it looks better as the default choice for apps.
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
    // A convenience bool to check if this theme is for light or dark mode
    final bool _isDark = brightness == Brightness.dark;

    // A convenience bool to check if primary color is light or dark.
    // final bool _primaryIsDark =
    //     ThemeData.estimateBrightnessForColor(primary) == Brightness.dark;

    // Create a TextTheme that is appropriate for the light/dark mode
    // final TextTheme _textTheme =
    //     (_isDark ? ThemeData.dark() : ThemeData.light()).textTheme;

    // Use passed in target platform or the default one.
    final TargetPlatform _platform = platform ?? defaultTargetPlatform;

    // With Typography we deviate from the Flutter standard that uses the
    // old Typography.material2014 in favor of the newer Typography.material2018
    // as default, if one is not provided.
    // TODO(rydmike): Remove when it is new default, still 2014 in Flutter 2.5!
    final Typography _typography =
        typography ?? Typography.material2018(platform: _platform);

    // We need the text theme locally for some custom themes, so we must
    // form it fully with same process that ThemeData() factory uses.
    // The PrimaryTextTheme is not used in custom sub-themes, so we will just
    // pass it along to ThemeData() factory used to make the ThemeData, it
    // can handle the primaryTextTheme.
    TextTheme defaultTextTheme =
        _isDark ? _typography.white : _typography.black;
    if (fontFamily != null) {
      defaultTextTheme = defaultTextTheme.apply(fontFamily: fontFamily);
    }
    final TextTheme _textTheme = defaultTextTheme.merge(textTheme);

    // Check brightness of primary, secondary, error, surface and background
    // colors, and then calculate appropriate colors for their onColors, if an
    // "on" color was not passed in.
    final FlexSchemeOnColors _onColors = FlexSchemeOnColors.from(
      primary: primary,
      secondary: secondary,
      surface: surface ??
          (_isDark
              ? FlexColor.materialDarkSurface
              : FlexColor.materialLightSurface),
      background: background ??
          (_isDark
              ? FlexColor.materialDarkBackground
              : FlexColor.materialLightBackground),
      error: error ??
          (_isDark
              ? FlexColor.materialDarkError
              : FlexColor.materialLightError),
      onPrimary: onPrimary,
      onSecondary: onSecondary,
      onSurface: onSurface,
      onBackground: onBackground,
      onError: onError,
    );
    // Define a standard Flutter ColorScheme from the provided brightness and
    // provided/computed/default colors.
    final ColorScheme _colorScheme = ColorScheme(
      primary: primary,
      primaryVariant: primaryVariant,
      secondary: secondary,
      secondaryVariant: secondaryVariant,
      surface: surface ??
          (_isDark
              ? FlexColor.materialDarkSurface
              : FlexColor.materialLightSurface),
      background: background ??
          (_isDark
              ? FlexColor.materialDarkBackground
              : FlexColor.materialLightBackground),
      error: error ??
          (_isDark
              ? FlexColor.materialDarkError
              : FlexColor.materialLightError),
      onBackground: _onColors.onBackground,
      onSurface: _onColors.onSurface,
      onError: _onColors.onError,
      onPrimary: _onColors.onPrimary,
      onSecondary: _onColors.onSecondary,
      brightness: brightness,
    );

    // When working with color scheme based colors, there is no longer a
    // Material primary swatch that we can use to create some of the old
    // Theme colors from, that are still needed by some standard Widgets.
    // To be able to make these colors we compute a complete material like
    // color swatch from the provided primary color,
    // using the primary color as its middle [500] index color.
    final MaterialColor _primarySwatch =
        createPrimarySwatch(_colorScheme.primary);
    // We now have a swatch of the primary color provided via a color scheme,
    // we can use it do define some of the traditional theme colors in a way
    // that relates to the color scheme primary color, like ThemeData factory
    // does when you create a theme from a swatch. This gives us some missing
    // critical primary shades to work with.
    final Color? _primaryColorDark =
        _isDark ? _primarySwatch[700] : _primarySwatch[800];
    final Color? _primaryColorLight = _primarySwatch[100];
    final Color? _secondaryHeaderColor = _primarySwatch[50];

    // We need some logic for the appBarColor. If a custom color for the
    // app bar was passed in, we use that, if not we use the surface color in
    // dark mode and primary color in light mode, the latter part is the same
    // logic the standard Flutter ThemeData.from(colorScheme) factory uses.
    final Color _effectiveAppBarColor = appBarBackground ??
        (_isDark ? _colorScheme.surface : _colorScheme.primary);
    // Calculate brightness for the app bar from the resulting effective color.
    final Brightness _appBarBrightness =
        ThemeData.estimateBrightnessForColor(_effectiveAppBarColor);

    // The Flutter standard selected tab and indicator color is onSurface in
    // dark mode and onPrimary in light mode, which is designed to fit an AppBar
    // colored TabBar. We keep this default when FlexTabBarStyle.forAppBar style
    // is used, with a minor modification. If AppBar is "light", then we use
    // black87, not black, so its like the textTheme on AppBar.
    // If the FlexTabBarStyle.forBackground style was used, the selected
    // color is always color scheme primary color, which will work on surface,
    // background and scaffold background colors.
    Color _effectiveTabColor() {
      if (tabBarStyle == FlexTabBarStyle.forBackground) {
        return _colorScheme.primary;
      } else {
        // We use default style for usage in an AppBar, or some other case.
        if (_appBarBrightness == Brightness.light) {
          return Colors.black87; // Match AppBar texTheme style on light.
        } else {
          return Colors.white;
        }
      }
    }

    // Calculate the selected tab bar color and store it in a local variable.
    final Color _selectedTabColor = _effectiveTabColor();

    // The unselected TabBar color when [FlexTabBarStyle.forBackground] style
    // is used, is always the onSurface color with 60% opacity. This is also
    // the color if the AppBar background color brightness is light AND its
    // color is white, surface or background colored.
    // Otherwise when the style [FlexTabBarStyle.forAppBar] is used, the
    // unselectedTabColor is the selected tab color with 70% opacity. This
    // opacity value is the same  as Flutter default for the default theme
    // that is also designed for AppBar usage.
    //
    // This condition is not so pretty, but I preferred it as an
    // expression. Since it only has two outcomes, I thought it was
    // still reasonable to write it like this, instead of via a function like
    // the effectiveTabColor, that has 3 outcomes. If it needs more logic
    // later, I will rewrite it as a function with logic.
    final Color _unselectedTabColor =
        (tabBarStyle == FlexTabBarStyle.forBackground ||
                (_appBarBrightness == Brightness.light &&
                    (_effectiveAppBarColor == Colors.white ||
                        _effectiveAppBarColor == _colorScheme.surface ||
                        _effectiveAppBarColor == _colorScheme.background)))
            ? _onColors.onSurface.withOpacity(0.6)
            : _selectedTabColor.withOpacity(0.7);

    // The current default theme for Material themed Tooltips are poor design
    // choices for desktop https://material.io/components/tooltips#specs.
    // See issue: https://github.com/flutter/flutter/issues/71429
    // The font size of 10 dp is just too small for desktops with pixel density
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
        case TargetPlatform.iOS:
        case TargetPlatform.android:
        case TargetPlatform.fuchsia: // coverage:ignore-line
          return 14;
      }
    }

    // This padding on tooltips fixes that the default tooltip does not work
    // well if two row tooltips are used.
    EdgeInsets _tooltipPadding() {
      switch (_platform) {
        case TargetPlatform.macOS:
        case TargetPlatform.linux:
        case TargetPlatform.windows:
          return const EdgeInsets.fromLTRB(8, 3, 8, 4);
        case TargetPlatform.iOS:
        case TargetPlatform.android:
        case TargetPlatform.fuchsia: // coverage:ignore-line
          return const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
      }
    }

    // Same as in ThemeData.from, but defined for reuse access in sub-themes.
    final Color _dividerColor = _colorScheme.onSurface.withOpacity(0.12);
    // Same as in ThemeData, but defined here for reuse in custom sub-themes.
    final Color _disabledColor = _isDark ? Colors.white38 : Colors.black38;
    final Color _hintColor =
        _isDark ? Colors.white60 : Colors.black.withOpacity(0.6);

    // Make and return the ThemeData object defined by the FlexColorScheme
    // properties and the designed slightly opinionated theme design choices
    // over default Flutter Material theme implementation.
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
      textTheme: _textTheme,
      primaryTextTheme: primaryTextTheme,
      // Pass along custom typography and platform logic.
      typography: _typography,
      platform: _platform,
      // Most definitions below are very close to the ones used by the Flutter
      // factory ThemeData.from for creating a theme from a color scheme and
      // text theme. Any modifications to it are explained.
      brightness: _colorScheme.brightness,
      primaryColor: _colorScheme.primary,
      primaryColorBrightness:
          ThemeData.estimateBrightnessForColor(_colorScheme.primary),
      canvasColor: _colorScheme.background,

      // Flutter standard for scaffoldBackgroundColor is colorScheme.background.
      // Here it is replaced with a separate color for the scaffold background,
      // so we can use a configuration with a separate scaffold background
      // color from scheme background and surface, if so desired. Flutter's
      // standard ThemeData.from a ColorScheme cannot do this. The good old
      // ThemeData factory can of course, but color scheme based themes in
      // Flutter cannot specify it separately. We need to be able to do so
      // in order to make elegantly primary color branded themes.
      scaffoldBackgroundColor: scaffoldBackground ?? _colorScheme.background,
      // Card, divider and background colors are same as in ThemeData.from.
      cardColor: _colorScheme.surface,
      dividerColor: _dividerColor,
      backgroundColor: _colorScheme.background,
      // Same as in ThemeData factory, but defined via final value in build for
      // easy reuse access in sub-themes further below.
      disabledColor: _disabledColor,
      hintColor: _hintColor,
      // Flutter standard dialogBackgroundColor for color scheme based themes
      // uses colorScheme.background.
      // The FlexColorScheme.from() factory constructor passed in a dialog
      // background color that is same as surface color or even other tinted
      // surfaces.
      // If using surface blends that are no equal for all Material surface
      // backgrounds colors. Use dialogs with background color that equals theme
      // colorScheme.surface to ensure it gets elevation overlay color applied
      // in dark mode. See issue:
      // https://github.com/flutter/flutter/issues/90353
      dialogBackgroundColor: dialogBackground ?? _colorScheme.background,

      // Define errorColor via color scheme error color.
      errorColor: _colorScheme.error,

      // Use the calculated _selectedTabColor as indicatorColor.
      indicatorColor: _selectedTabColor,

      // Elevation overlay on dark material elevation is used on dark themes
      // on surfaces when so requested, applyElevationOverlayColor defaults
      // to true in FlexColorScheme themes, but you can turn it off.
      // Flutter ThemeData.from ColorScheme based
      // themes also uses this by default, but older ThemeData factories do not.
      applyElevationOverlayColor: _isDark && applyElevationOverlayColor,

      // Pass the from FlexColorScheme defined colorScheme to ThemeData
      // colorScheme. Newer standard Flutter sub themes use the colorScheme
      // for their theming and all sub themes will eventually be converted to
      // be based on the defined color scheme colors. FlexColorScheme passes
      // the scheme it has created to the colorScheme property in ThemeData.
      // More info here: https://flutter.dev/go/material-theme-system-updates
      colorScheme: _colorScheme,

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
      // Some of the gaps will probably be solved when Flutter's theme
      // migration progresses. This package will monitor the development and
      // remove no longer needed corrections or remove totally deprecated
      // ThemeData properties when it is appropriate and timely to do so.
      // ----------------------------------------------------------------------

      // This color is important, if it is not set we get a teal color for it
      // in dark mode, and not actually the secondary color that we want for
      // our color scheme based theme. The Flutter color scheme based theme
      // does not include this, in our opinion for correct application of the
      // color scheme based theme, it should really do the same as below.
      // See issue: https://github.com/flutter/flutter/issues/65782
      toggleableActiveColor: _colorScheme.secondary,

      // The primary dark color no longer exists in ColorScheme themes, but
      // it still needs to be set to match the ColorScheme theme, otherwise we
      // get a default dark blue theme color for it coming from default
      // primarySwatch. This will not look good if your theme uses any primary
      // color that is not a blue hue. To fix this we use the [700] value from
      // the calculated primary swatch for dark mode and [800] for light mode.
      // See issue: https://github.com/flutter/flutter/issues/65782
      primaryColorDark: _primaryColorDark,

      // The light primary color no longer exists in ColorScheme themes, but it
      // still needs to be set to match the ColorScheme theme, otherwise we
      // get a default blue color for it coming from the default primarySwatch.
      // We use the [100] value from the calculated primary swatch.
      // See issue: https://github.com/flutter/flutter/issues/65782
      primaryColorLight: _primaryColorLight,

      // Define a secondary header color, not sure what uses it, but we should
      // give it a color that will work with ColorScheme based themes. If it is
      // not set, it gets a super light [50] hue of the primary color from
      // default theme.light factory. We use the [50] value from the
      // calculated primary swatch instead.
      // See issue: https://github.com/flutter/flutter/issues/65782
      secondaryHeaderColor: _secondaryHeaderColor,

      // The app bar theme allows us to use a custom colored appbar theme
      // in both light and dark themes that is not dependent on theme primary
      // or surface color, and still gets a correct working text and icon theme.
      // In the versions prior to Flutter 2.0.0 doing this was difficult, as
      // presented in https://github.com/flutter/flutter/issues/50606 doing
      // this was a bit tricky. A new feature in Flutter 2.0.0 implemented via:
      // https://github.com/flutter/flutter/pull/71184 makes this easy and
      // better. The FlexColorScheme implementation below has been changed to
      // use this new AppBarTheme feature from version 2.0.0-nullsafety.2
      appBarTheme: AppBarTheme(
        // Use the defined appbar color for the theme
        backgroundColor: _effectiveAppBarColor,
        foregroundColor:
            _appBarBrightness == Brightness.dark ? Colors.white : Colors.black,
        // Define appropriate brightness on the icon themes
        iconTheme: _appBarBrightness == Brightness.dark
            ? const IconThemeData(color: Colors.white)
            : const IconThemeData(color: Colors.black87),
        actionsIconTheme: _appBarBrightness == Brightness.dark
            ? const IconThemeData(color: Colors.white)
            : const IconThemeData(color: Colors.black87),
        elevation: appBarElevation,
        systemOverlayStyle: SystemUiOverlayStyle(
          // AppBar overlay style.
          statusBarColor: transparentStatusBar
              ? Colors.transparent
              // This is the actual scrim color used by Android by default,
              // here we just re-apply if false or if it had been removed
              // earlier, using `null` does not restore we need the actual used
              // scrim by Android to restore if it has been removed earlier.
              : const Color(0x40000000),
          statusBarBrightness: _appBarBrightness,
          statusBarIconBrightness: _appBarBrightness == Brightness.dark
              ? Brightness.light
              : Brightness.dark,

          // The systemNavigationBarColor used by default AppBar in SDK:
          systemNavigationBarColor: const Color(0xFF000000),
          // Would be nice if this worked instead of above, but it does not:
          // systemNavigationBarColor: _isDark ? Colors.black : Colors.white;,

          // The systemNavigationBarIconBrightness used by the AppBar in SDK:
          systemNavigationBarIconBrightness: Brightness.dark,
          // TODO(rydmike): Test this again, maybe leave it in there anyway?
          // Would be nice if this worked instead of above, but it does not:
          // systemNavigationBarIconBrightness:
          //     _isDark ? Brightness.light : Brightness.dark,

          // The systemNavigationBarDividerColor used by default AppBar in SDK:
          systemNavigationBarDividerColor: null,
        ),
      ),

      // The bottom app bar uses color scheme background color to match the
      // background color of the drawer, bottom navigation bar, possible side
      // menu and system navigation bar on android (if theming of it is used).
      // This is a slight change from the ColorScheme default that uses
      // surface color.
      bottomAppBarColor: _colorScheme.background,
      bottomAppBarTheme: BottomAppBarTheme(
        color: _colorScheme.background,
        elevation: bottomAppBarElevation,
      ),

      // ----------------------------------------------------------------------
      // The additions below are theme customizations that differs from the
      // defaults Flutter provides out of the box. They go nicely together with
      // the rest of the theme settings used by FlexColorScheme based themes.
      // The choices are of course opinionated and you can define own values
      // that override them with copyWith, just as you would on the default
      // ThemeData factory.
      // ----------------------------------------------------------------------
      // In TextSelectionThemeData, the standard for selectionColor is
      // colorScheme.primary with opacity value 0.4 for dark and 0.12 light
      // mode. Here we use primary with 0.5 for dark mode and 0.3 for light
      // mode. The standard selectionHandleColor is colorScheme.primary,
      // here we use the slightly darker shade primaryColorDark instead.
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: _isDark
            ? _colorScheme.primary.withOpacity(0.50)
            : _colorScheme.primary.withOpacity(0.30),
        selectionHandleColor: _primaryColorDark,
      ),
      // Input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: _isDark
            ? _colorScheme.primary.withOpacity(0.06)
            : _colorScheme.primary.withOpacity(0.035),
      ),

      // NOTE: Since the old buttons have been deprecated in Flutter 2.0.0
      // they are no longer presented or used in the code in FlexColorScheme.
      // The button color was deprecated in Flutter 2.5, but the old theme
      // still exists, so we keep still keep it defined as before in
      // FlexColorScheme, until it becomes deprecated too.
      //
      // The button theming below makes the old buttons almost
      // look like the defaults for the new ElevatedButton, TextButton and
      // OutlinedButton. These were defaults I used previously for the old
      // buttons. With these themes as defaults for the old buttons,
      // transitioning to the new buttons goes almost un-noticed.
      // There is no custom theming for the new buttons applied as they look
      // pretty good out of the box. But the old ones did not, the next two
      // theme settings fixes that.
      //
      // When the deprecated button color was set to primary, and we also define
      // the [ButtonThemeData] so that we get correct onSurface colors for the
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
        colorScheme: _colorScheme,
        textTheme: ButtonTextTheme.primary,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: const EdgeInsets.symmetric(horizontal: 16),
      ),

      // The default chip theme in Flutter does not work correctly with dark
      // themes. See issue: https://github.com/flutter/flutter/issues/65663
      // The chip theme below fixes it by using the colorScheme.primary color.
      chipTheme: ChipThemeData.fromDefaults(
        secondaryColor: _colorScheme.primary,
        brightness: _colorScheme.brightness,
        labelStyle: _textTheme.bodyText1!,
      ),

      // Define the TabBar theme that will fit nicely in an AppBar
      // (default) or on background color for use eg in a Scaffold, the choice
      // depends on tabBarStyle `FlexTabBarStyle`, that defaults to
      // `FlexTabBarStyle.forAppBar`.
      tabBarTheme: TabBarTheme(
        indicatorSize: TabBarIndicatorSize.tab,
        labelStyle: const TextTheme().button,
        labelColor: _selectedTabColor,
        unselectedLabelColor: _unselectedTabColor,
      ),

      // Opinionated theming for the bottom navigation bar.
      // It uses primary color for the selected item. Flutter default uses
      // secondary color. Primary color is also "iOS" style for the bottom nav.
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedIconTheme: IconThemeData(
          color: _colorScheme.primary,
        ),
        selectedItemColor: _colorScheme.primary,
      ),

      // Opinionated theming of Tooltips, as stated previously above, the
      // default theme for Material themed Tooltips are poor design choices
      // https://material.io/components/tooltips#specs.
      // The theming below is an opinionated nicer design with an option
      // to also invert the tooltip background color.
      // See issue: https://github.com/flutter/flutter/issues/71429
      tooltipTheme: TooltipThemeData(
        // We do not use the min height, the custom padding handles it instead.
        padding: _tooltipPadding(),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        textStyle: _textTheme.bodyText2!.copyWith(
          inherit: false,
          color: tooltipsMatchBackground
              ? _isDark
                  ? Colors.white
                  : Colors.black
              : _isDark
                  ? Colors.black
                  : Colors.white,
          fontSize: _tooltipFontSize(),
        ),
        decoration: tooltipsMatchBackground
            ? BoxDecoration(
                color:
                    _isDark ? const Color(0xED444444) : const Color(0xF0FCFCFC),
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                border: Border.all(color: _dividerColor),
              )
            : null,
      ),
    );
  }

  /// Returns the [ColorScheme] object defined by [FlexColorScheme] properties.
  ///
  /// After you have defined your scheme with [FlexColorScheme] or one of its
  /// recommended factories [FlexColorScheme.light], [FlexColorScheme.dark],
  /// you can use the [toScheme] method to get the resulting standard Flutter
  /// [ColorScheme] object defined by your [FlexColorScheme] definition.
  ///
  /// While you can use use this returned color scheme in a standard
  /// [ThemeData.from] color scheme based theme factory to create a theme from
  /// [FlexColorScheme], this is **NOT** the recommended way to make a
  /// fully [FlexColorScheme] based theme. Normally you want to use use
  /// [FlexColorScheme.toTheme] to make your ThemeData when using
  /// FlexColorScheme.
  ///
  /// If you use [ThemeData.from] and the [ColorScheme] returned by
  /// [FlexColorScheme.toScheme] this will result in a theme that is based on
  /// the color scheme defined in [FlexColorScheme], including the surface and
  /// background color branding, and true black for dark mode, if those were
  /// used in its creation via the light and dark factories. **However**, the
  /// big difference will be that the Flutter's [ThemeData.from] theme creation
  /// from this scheme will not include any of the theme fixes, included
  /// in [FlexColorScheme.toTheme] method.
  /// The AppBar theme options will also not be available and scaffoldBackground
  /// will be equal to background, which does not look so good if heavy
  /// branding was used on surfaces.
  ColorScheme get toScheme {
    // A convenience bool to check if this theme is for light or dark mode
    final bool isDark = brightness == Brightness.dark;

    // Check brightness of primary, secondary, error, surface and background
    // colors, and then calculate appropriate colors for their onColors, if an
    // "on" color was not passed in.
    final FlexSchemeOnColors onColors = FlexSchemeOnColors.from(
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

  /// Copy the object with one or more provided properties changed.
  FlexColorScheme copyWith({
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
  }) {
    return FlexColorScheme(
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
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is FlexColorScheme &&
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
        other.applyElevationOverlayColor == applyElevationOverlayColor;
  }

  // The Jenkins list hashCode algorithm used by e.g. ThemeData in Flutter SDK.
  // Comment it and uncomment the other standard one with ^ (bitwise XOR),
  // to switch and test the difference.  Using this one for now, I wonder why
  // this one is used generally in Flutter SDK over the bitwise XOR variant?
  // Is this better? Why? How? Investigate!
  @override
  int get hashCode {
    final List<Object?> values = <Object?>[
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
    ];
    return hashList(values);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
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
  }
}

/// Immutable data class used to make the three different surface colors in a
/// [FlexColorScheme].
///
/// [FlexSchemeSurfaceColors] is used primarily via the
/// [FlexSchemeSurfaceColors.from] factory that returns
/// [FlexSchemeSurfaceColors] object with defined surface
/// colors based on enum property [FlexSurface] and [Brightness]. Included
/// colors are [surface] and [background],
/// plus an own surface color for [scaffoldBackground], which is not a part of
/// Flutter's standard [ColorScheme].
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

  /// Creates nuanced surface colors using pre-defined behavior via enum
  /// property `surfaceMode` or make totally custom blended surfaces.
  ///
  /// [FlexSchemeSurfaceColors] was in versions older than 4.0 created with
  /// the [FlexSchemeSurfaceColors.from] factory, version 4.0 and later
  /// recommends using the [FlexSchemeSurfaceColors.blend] factory for even
  /// more nuanced surface branding options.
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
  factory FlexSchemeSurfaceColors.blend({
    /// Controls if we create surface colors for light or dark surfaces.
    final Brightness brightness = Brightness.light,

    /// The used surface mode to create different surface color blends.
    final FlexSurfaceMode surfaceMode =
        FlexSurfaceMode.scaffoldSurfaceBackground,

    /// The the blend level strength used for the mode.
    final FlexBlendLevel blendLevel = FlexBlendLevel.none,

    /// The colors we can use to blend into surfaces.
    ///
    /// If null, default material light or dark scheme colors will be used,
    /// depending on if we are making light or dark surfaces.
    FlexSchemeColor? schemeColors,

    /// The colors to be blended into each surface color.
    ///
    /// If not null, these colors will be blended into each surface color.
    /// If it is null, then `schemeColors.primary` will be assigned to all
    /// surfaces, the `surfaceMode` may override this and assign other
    /// `schemeColors` to some of the surfaces.
    FlexSchemeSurfaceColors? blendColors,

    /// The surface colors that we will mix the blend colors into.
    ///
    /// If null, then Material default surface colors will be used for all
    /// surfaces, that we then mix in the `blendColors` into, unless the
    /// `mode` defines surface starting colors otherwise. Usually the mode
    /// defines and overwrites `surfaceColors` with its own mode based
    /// starting surface colors for each surface. To ensure that the
    /// passed in `surfaceColors` are kept use the mode [FlexSurfaceMode.custom]
    /// to construct surface colors with custom base surface colors.
    FlexSchemeSurfaceColors? surfaceColors,
  }) {
    // Are we making surface colors for a light theme?
    final bool _light = brightness == Brightness.light;

    // We get scheme default blend in colors via brightness and Material
    // default colors for the theme mode, if it was not provided. It is
    // normally provided when making branded surfaces, but Material default
    // colors are used as fallback colors.
    final FlexSchemeColor _scheme = schemeColors ??
        (_light ? FlexColor.material.light : FlexColor.material.dark);

    // The color that should be blended into each surface, defaults to primary
    // color for all surfaces.
    FlexSchemeSurfaceColors _blendColor = blendColors ??
        FlexSchemeSurfaceColors(
          surface: _scheme.primary,
          dialogBackground: _scheme.primary,
          background: _scheme.primary,
          scaffoldBackground: _scheme.primary,
        );

    // Set dialog blend colors to secondary color for modes that use that.
    if (surfaceMode == FlexSurfaceMode.equalSurfacesLowScaffoldSecDialog ||
        surfaceMode == FlexSurfaceMode.equalSurfacesHighScaffoldSecDialog) {
      _blendColor = _blendColor.copyWith(dialogBackground: _scheme.secondary);
    }

    // We get surface starting default colors via brightness and Material
    // default colors if it was not provided. It is normally provided when
    // making branded surfaces, but Material default colors are used as
    // fallback colors.
    FlexSchemeSurfaceColors _surface = surfaceColors ??
        (_light
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

    // If legacy `scaffoldSurfaceBackground` and no blend level, we use Material
    // default surfaces. scaffoldBackgroundSurface
    if (surfaceMode == FlexSurfaceMode.scaffoldSurfaceBackground ||
        surfaceMode == FlexSurfaceMode.scaffoldBackgroundSurface) {
      if (blendLevel == FlexBlendLevel.none) {
        if (_light) {
          _surface = const FlexSchemeSurfaceColors(
            surface: FlexColor.materialLightSurface,
            background: FlexColor.materialLightBackground,
            scaffoldBackground: FlexColor.materialLightScaffoldBackground,
            dialogBackground: FlexColor.materialLightSurface,
          );
        } else {
          _surface = const FlexSchemeSurfaceColors(
            surface: FlexColor.materialDarkSurface,
            background: FlexColor.materialDarkBackground,
            scaffoldBackground: FlexColor.materialDarkScaffoldBackground,
            dialogBackground: FlexColor.materialDarkSurface,
          );
        }
      } else {
        // For other `blendLevel` values than `FlexBlendLevel.none` we use the
        // surface color defined by [FlexColor] surfaces, they differ slightly
        // from Material starting colors to provide better blend effects.
        // White is slightly off-white for background and in dark mode
        // surface is slightly darken and background even darker, while
        // scaffold background matches the Material design background.
        if (_light) {
          _surface = const FlexSchemeSurfaceColors(
            surface: FlexColor.lightSurface,
            background: FlexColor.lightBackground,
            scaffoldBackground: FlexColor.lightScaffoldBackground,
            dialogBackground: FlexColor.lightSurface,
          );
        } else {
          _surface = const FlexSchemeSurfaceColors(
            surface: FlexColor.darkSurface,
            background: FlexColor.darkBackground,
            scaffoldBackground: FlexColor.darkScaffoldBackground,
            dialogBackground: FlexColor.darkSurface,
          );
        }
      }
    }

    // The default blend values for [FlexSurfaceMode.scaffoldSurfaceBackground]
    // and starting point value for other modes.
    //
    // Light and dark mode blend factor, dark mode uses less saturated colors
    // and requires stronger blend percentage, we use 2x via _lightToDarkFactor.
    final int _modeFactor = _light ? 1 : _lightToDarkFactor;
    // The base alpha value for mixing our blend color into each surface.
    int _surfaceMix = _kBlendToAlpha[blendLevel]! * _modeFactor;
    // Dialog default to surface blend level.
    int _dialogMix = _surfaceMix;
    // Background defaults to 2x surface blend.
    int _backgroundMix = _surfaceMix * 2;
    // Scaffold background defaults to 1/4 of surface mix.
    int _scaffoldMix = _surfaceMix ~/ 4;

    // In mode `scaffoldBackgroundSurface`, change order of background and
    // surface/dialog blend strengths compared to default and legacy
    // `scaffoldSurfaceBackground` mode.
    if (surfaceMode == FlexSurfaceMode.scaffoldBackgroundSurface) {
      // The percentage of each color we should mix into each surface is equal
      // to surface mix for all surface
      _backgroundMix = _surfaceMix;
      _surfaceMix = _surfaceMix * 2;
      _dialogMix = _surfaceMix;
    }

    // In mode equalAll, we use FlexColor default surface color on all surfaces.
    if (surfaceMode == FlexSurfaceMode.equalAll) {
      if (_light) {
        _surface = const FlexSchemeSurfaceColors(
          surface: FlexColor.lightSurface,
          background: FlexColor.lightSurface,
          scaffoldBackground: FlexColor.lightSurface,
          dialogBackground: FlexColor.lightSurface,
        );
      } else {
        _surface = const FlexSchemeSurfaceColors(
          surface: FlexColor.darkSurface,
          background: FlexColor.darkSurface,
          scaffoldBackground: FlexColor.darkSurface,
          dialogBackground: FlexColor.darkSurface,
        );
      }
      // The percentage of each color we should mix into each surface is equal
      // to surface mix for all surface
      _dialogMix = _surfaceMix;
      _backgroundMix = _surfaceMix;
      _scaffoldMix = _surfaceMix;
    }

    // In mode equalSurfacesLowScaffold, we use FlexColor default
    // surface color on all surfaces.
    if (surfaceMode == FlexSurfaceMode.equalSurfacesLowScaffold ||
        surfaceMode == FlexSurfaceMode.equalSurfacesLowScaffoldSecDialog) {
      if (_light) {
        _surface = const FlexSchemeSurfaceColors(
          surface: FlexColor.lightSurface,
          background: FlexColor.lightSurface,
          scaffoldBackground: FlexColor.lightSurface,
          dialogBackground: FlexColor.lightSurface,
        );
      } else {
        _surface = const FlexSchemeSurfaceColors(
          surface: FlexColor.darkSurface,
          background: FlexColor.darkSurface,
          scaffoldBackground: FlexColor.darkSurface,
          dialogBackground: FlexColor.darkSurface,
        );
      }
      // The alpha of each color we should mix into each surface.
      _dialogMix = _surfaceMix;
      _backgroundMix = _surfaceMix;
      // Scaffold mix is 1/4 of the other surfaces.
      _scaffoldMix = _surfaceMix ~/ 4;
    }

    // In mode equalSurfacesLowScaffold, we use FlexColor default
    // background color on all surfaces. The FlexColor background color is
    // slightly darker and whiter (white) than FlexColor surface, we can
    // does blend in more of the blend color into the high blend value
    // for scaffold background, without it becoming to tinted with the
    // blend color.
    if (surfaceMode == FlexSurfaceMode.equalSurfacesHighScaffold ||
        surfaceMode == FlexSurfaceMode.equalSurfacesHighScaffoldSecDialog) {
      if (_light) {
        _surface = const FlexSchemeSurfaceColors(
          surface: FlexColor.lightBackground,
          background: FlexColor.lightBackground,
          scaffoldBackground: FlexColor.lightBackground,
          dialogBackground: FlexColor.lightBackground,
        );
      } else {
        _surface = const FlexSchemeSurfaceColors(
          surface: FlexColor.darkBackground,
          background: FlexColor.darkBackground,
          scaffoldBackground: FlexColor.darkBackground,
          dialogBackground: FlexColor.darkBackground,
        );
      }
      // The alpha of each color we should mix into each surface.
      _dialogMix = _surfaceMix;
      _backgroundMix = _surfaceMix;
      // Scaffold mix is 2.5x of the other surfaces.
      _scaffoldMix = (_surfaceMix * 2.5).toInt();
    }

    // Return the computed and resulting surface colors.
    return FlexSchemeSurfaceColors(
      surface: _surface.surface.blendAlpha(_blendColor.surface, _surfaceMix),
      dialogBackground: _surface.dialogBackground
          .blendAlpha(_blendColor.dialogBackground, _dialogMix),
      background: _surface.background
          .blendAlpha(_blendColor.background, _backgroundMix),
      scaffoldBackground: _surface.scaffoldBackground
          .blendAlpha(_blendColor.scaffoldBackground, _scaffoldMix),
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
  }) {
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
