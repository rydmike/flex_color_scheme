import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flutter/material.dart';

import 'flex_color_scheme.dart';
import 'flex_key_color.dart';
import 'flex_scheme.dart';
import 'flex_scheme_color.dart';
import 'flex_sub_themes_data.dart';
import 'flex_surface_mode.dart';

// ignore_for_file: comment_references

/// A convenience extension on [ThemeData] to define a
/// [FlexColorScheme] object and return the [ThemeData] object defined by
/// its instance, using its [FlexColorScheme.toTheme] method in one go.
///
/// Provided convenience extensions are:
///
/// * FlexThemeData.light(), based on FlexColorScheme.light().toTheme
/// * FlexThemeData.dark(), based on FlexColorScheme.dark().toTheme
///
/// Using [FlexThemeData.light] is a bit shorter than
/// `FlexColorScheme.light().toTheme`, and it may feel more familiar since
/// you get a [ThemeData] object directly that you can use just like any
/// other ThemeData object produced by Flutter SDK built in ThemeData factory
/// constructors.
///
/// For advanced theming, when constructing elaborate themes where sub themes
/// need access to the [ColorScheme] as defined by your [FlexColorScheme].
/// Consider using [FlexColorScheme], then get the [ColorScheme] it defines
/// with [FlexColorScheme.toScheme] and use
/// colors from this scheme or the entire [ColorScheme] in you sub-themes,
/// that you then apply with [ThemeData.copyWith] to the
/// [ThemeData] given by [FlexColorScheme.toTheme]. You can of course do
/// this with these extensions too, but in that case you will need to store
/// the theme in an intermediate [ThemeData] object.
///
/// It would be nice if it was possible to also provide these as static
/// extensions on ThemeData, in away that would enable a syntax like this:
///
/// * ThemeData.flexLight(), *based on FlexColorScheme.light().toTheme*
/// * ThemeData.flexDark(), *based on FlexColorScheme.dark().toTheme*
///
/// However, Dart does not yet support such extensions, see:
/// https://github.com/dart-lang/language/issues/723
extension FlexThemeData on ThemeData {
  /// Returns a [ThemeData] object defined by factory [FlexColorScheme.light]
  /// and its [FlexColorScheme.toTheme] method.
  static ThemeData light({
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
    /// If you opt in on using sub themes with and have set
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
    /// When using this extension, this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] [colors] property or when using pre-defined color
    /// scheme based [FlexScheme] and its [scheme] property, including any
    /// used blend logic. If a [colorScheme] was provided with this
    /// corresponding color defined, this color property will override the
    /// same color in it as well.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the extensions factory behavior.
    final Color? onPrimary,

    /// A color that's clearly legible when drawn on [primaryContainer].
    ///
    /// To ensure that an app is accessible, a contrast ratio between
    /// [primaryContainer] and [onPrimaryContainer] of at least 4.5:1
    /// is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// When using this extension, this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] [colors] property or when using pre-defined color
    /// scheme based [FlexScheme] and its [scheme] property, including any
    /// used blend logic. If a [colorScheme] was provided with this
    /// corresponding color defined, this color property will override the
    /// same color in it as well.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the extensions factory behavior.
    final Color? onPrimaryContainer,

    /// A color that is clearly legible when drawn on [secondary] color.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// [secondary] and [onSecondary] is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// When using this extension, this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] [colors] property or when using pre-defined color
    /// scheme based [FlexScheme] and its [scheme] property, including any
    /// used blend logic. If a [colorScheme] was provided with this
    /// corresponding color defined, this color property will override the
    /// same color in it as well.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the extensions factory behavior.
    final Color? onSecondary,

    /// A color that's clearly legible when drawn on [secondaryContainer].
    ///
    /// To ensure that an app is accessible, a contrast ratio between
    /// [secondaryContainer] and [onSecondaryContainer] of at least 4.5:1
    /// is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// When using this extension, this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] [colors] property or when using pre-defined color
    /// scheme based [FlexScheme] and its [scheme] property, including any
    /// used blend logic. If a [colorScheme] was provided with this
    /// corresponding color defined, this color property will override the
    /// same color in it as well.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the extensions factory behavior.
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
    /// When using this extension, this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] [colors] property or when using pre-defined color
    /// scheme based [FlexScheme] and its [scheme] property, including any
    /// used blend logic. If a [colorScheme] was provided with this
    /// corresponding color defined, this color property will override the
    /// same color in it as well.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the extensions factory behavior.
    final Color? onSurface,

    /// A color that is clearly legible when drawn on [background] color.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// [background] and [onBackground] is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// When using this extension, this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] [colors] property or when using pre-defined color
    /// scheme based [FlexScheme] and its [scheme] property, including any
    /// used blend logic. If a [colorScheme] was provided with this
    /// corresponding color defined, this color property will override the
    /// same color in it as well.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the extensions factory behavior.
    final Color? onBackground,

    /// A color that is clearly legible when drawn on [error] color.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// [error] and [onError] is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// When using this extension, this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] [colors] property or when using pre-defined color
    /// scheme based [FlexScheme] and its [scheme] property, including any
    /// used blend logic. If a [colorScheme] was provided with this
    /// corresponding color defined, this color property will override the
    /// same color in it as well.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the extensions factory behavior.
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
    /// * [TextSelectionThemeData] for [TextField] via
    ///   [FlexSubThemes.textSelectionTheme].
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
    /// If null [FlexTones.light] will be used, resulting in a default
    /// Material Design 3 based usage of tones and CAM16 chroma for the
    /// seed generated light [ColorScheme].
    ///
    /// By default a `FlexTones` configuration `FlexTones.material` that
    /// matches what Flutter SDK does with `ColorScheme.fromSeed` is used.
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
    /// on mobile platforms, [MaterialTapTargetSize.shrinkWrap] on desktop
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

    /// Defines the appearance of ink splashes produces by [InkWell]
    /// and [InkResponse].
    ///
    /// Providing a [splashFactory] value will override the default one created
    /// by [ThemeData], it will also override any splash settings in
    /// [subThemesData].
    ///
    /// See also:
    ///
    ///  * [InkSplash.splashFactory], which defines the default splash.
    ///  * [InkRipple.splashFactory], which defines a splash that spreads out
    ///    more aggressively than the default.
    ///  * [InkSparkle.splashFactory], which defines a more aggressive and
    ///    organic splash with sparkle effects.
    final InteractiveInkFeatureFactory? splashFactory,

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
  }) =>
      FlexColorScheme.light(
        colors: colors,
        scheme: scheme,
        colorScheme: colorScheme,
        usedColors: usedColors,
        surfaceMode: surfaceMode,
        blendLevel: blendLevel,
        appBarStyle: appBarStyle,
        appBarOpacity: appBarOpacity,
        transparentStatusBar: transparentStatusBar,
        appBarElevation: appBarElevation,
        bottomAppBarElevation: bottomAppBarElevation,
        tabBarStyle: tabBarStyle,
        primary: primary,
        primaryContainer: primaryContainer,
        secondary: secondary,
        secondaryContainer: secondaryContainer,
        tertiary: tertiary,
        tertiaryContainer: tertiaryContainer,
        error: error,
        surface: surface,
        background: background,
        scaffoldBackground: scaffoldBackground,
        dialogBackground: dialogBackground,
        appBarBackground: appBarBackground,
        onPrimary: onPrimary,
        onPrimaryContainer: onPrimaryContainer,
        onSecondary: onSecondary,
        onSecondaryContainer: onSecondaryContainer,
        onTertiary: onTertiary,
        onTertiaryContainer: onTertiaryContainer,
        onSurface: onSurface,
        onBackground: onBackground,
        onError: onError,
        surfaceTint: surfaceTint,
        lightIsWhite: lightIsWhite,
        swapColors: swapColors,
        tooltipsMatchBackground: tooltipsMatchBackground,
        subThemesData: subThemesData,
        keyColors: keyColors,
        useMaterial3ErrorColors: useMaterial3ErrorColors,
        tones: tones,
        visualDensity: visualDensity,
        textTheme: textTheme,
        primaryTextTheme: primaryTextTheme,
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        package: package,
        materialTapTargetSize: materialTapTargetSize,
        pageTransitionsTheme: pageTransitionsTheme,
        splashFactory: splashFactory,
        platform: platform,
        typography: typography,
        applyElevationOverlayColor: applyElevationOverlayColor,
        useMaterial3: useMaterial3,
        swapLegacyOnMaterial3: swapLegacyOnMaterial3,
        extensions: extensions,
      ).toTheme;

  /// Returns a [ThemeData] object defined by factory [FlexColorScheme.dark]
  /// and its [FlexColorScheme.toTheme] method.
  static ThemeData dark({
    /// The [FlexSchemeColor] that we will create the dark [FlexColorScheme]
    /// from.
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
    /// [colorScheme] is always ignored and set to [Brightness.dark] since this
    /// is the dark theme mode factory. Make sure the colors used in your color
    /// scheme are intended for a dark theme.
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
    /// If you opt in on using sub themes with and have set
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
    /// both via the defaults for the respective theme mode
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
    /// When using this extension, this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] [colors] property or when using pre-defined color
    /// scheme based [FlexScheme] and its [scheme] property, including any
    /// used blend logic. If a [colorScheme] was provided with this
    /// corresponding color defined, this color property will override the
    /// same color in it as well.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the extensions factory behavior.
    final Color? onPrimary,

    /// A color that's clearly legible when drawn on [primaryContainer].
    ///
    /// To ensure that an app is accessible, a contrast ratio between
    /// [primaryContainer] and [onPrimaryContainer] of at least 4.5:1
    /// is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// When using this extension, this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] [colors] property or when using pre-defined color
    /// scheme based [FlexScheme] and its [scheme] property, including any
    /// used blend logic. If a [colorScheme] was provided with this
    /// corresponding color defined, this color property will override the
    /// same color in it as well.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the extensions factory behavior.
    final Color? onPrimaryContainer,

    /// A color that is clearly legible when drawn on [secondary] color.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// [secondary] and [onSecondary] is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// When using this extension, this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] [colors] property or when using pre-defined color
    /// scheme based [FlexScheme] and its [scheme] property, including any
    /// used blend logic. If a [colorScheme] was provided with this
    /// corresponding color defined, this color property will override the
    /// same color in it as well.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the extensions factory behavior.
    final Color? onSecondary,

    /// A color that's clearly legible when drawn on [secondaryContainer].
    ///
    /// To ensure that an app is accessible, a contrast ratio between
    /// [secondaryContainer] and [onSecondaryContainer] of at least 4.5:1
    /// is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// When using this extension, this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] [colors] property or when using pre-defined color
    /// scheme based [FlexScheme] and its [scheme] property, including any
    /// used blend logic. If a [colorScheme] was provided with this
    /// corresponding color defined, this color property will override the
    /// same color in it as well.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the extensions factory behavior.
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
    /// When using this extension, this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] [colors] property or when using pre-defined color
    /// scheme based [FlexScheme] and its [scheme] property, including any
    /// used blend logic. If a [colorScheme] was provided with this
    /// corresponding color defined, this color property will override the
    /// same color in it as well.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the extensions factory behavior.
    final Color? onSurface,

    /// A color that is clearly legible when drawn on [background] color.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// [background] and [onBackground] is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// When using this extension, this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] [colors] property or when using pre-defined color
    /// scheme based [FlexScheme] and its [scheme] property, including any
    /// used blend logic. If a [colorScheme] was provided with this
    /// corresponding color defined, this color property will override the
    /// same color in it as well.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the extensions factory behavior.
    final Color? onBackground,

    /// A color that is clearly legible when drawn on [error] color.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// [error] and [onError] is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// When using this extension, this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] [colors] property or when using pre-defined color
    /// scheme based [FlexScheme] and its [scheme] property, including any
    /// used blend logic. If a [colorScheme] was provided with this
    /// corresponding color defined, this color property will override the
    /// same color in it as well.
    ///
    /// You can use this property for convenience if you want to override the
    /// color that this scheme color gets via the extensions factory behavior.
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
    /// * [TextSelectionThemeData] for [TextField] via
    ///   [FlexSubThemes.textSelectionTheme].
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
    /// on mobile platforms, [MaterialTapTargetSize.shrinkWrap] on desktop
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

    /// Defines the appearance of ink splashes produces by [InkWell]
    /// and [InkResponse].
    ///
    /// Providing a [splashFactory] value will override the default one created
    /// by [ThemeData], it will also override any splash settings in
    /// [subThemesData].
    ///
    /// See also:
    ///
    ///  * [InkSplash.splashFactory], which defines the default splash.
    ///  * [InkRipple.splashFactory], which defines a splash that spreads out
    ///    more aggressively than the default.
    ///  * [InkSparkle.splashFactory], which defines a more aggressive and
    ///    organic splash with sparkle effects.
    final InteractiveInkFeatureFactory? splashFactory,

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
  }) =>
      FlexColorScheme.dark(
        colorScheme: colorScheme,
        colors: colors,
        scheme: scheme,
        usedColors: usedColors,
        surfaceMode: surfaceMode,
        blendLevel: blendLevel,
        appBarStyle: appBarStyle,
        appBarOpacity: appBarOpacity,
        transparentStatusBar: transparentStatusBar,
        appBarElevation: appBarElevation,
        bottomAppBarElevation: bottomAppBarElevation,
        tabBarStyle: tabBarStyle,
        primary: primary,
        primaryContainer: primaryContainer,
        secondary: secondary,
        secondaryContainer: secondaryContainer,
        tertiary: tertiary,
        tertiaryContainer: tertiaryContainer,
        error: error,
        surface: surface,
        background: background,
        scaffoldBackground: scaffoldBackground,
        dialogBackground: dialogBackground,
        appBarBackground: appBarBackground,
        onPrimary: onPrimary,
        onPrimaryContainer: onPrimaryContainer,
        onSecondary: onSecondary,
        onSecondaryContainer: onSecondaryContainer,
        onTertiary: onTertiary,
        onTertiaryContainer: onTertiaryContainer,
        onSurface: onSurface,
        onBackground: onBackground,
        onError: onError,
        surfaceTint: surfaceTint,
        darkIsTrueBlack: darkIsTrueBlack,
        swapColors: swapColors,
        tooltipsMatchBackground: tooltipsMatchBackground,
        subThemesData: subThemesData,
        keyColors: keyColors,
        useMaterial3ErrorColors: useMaterial3ErrorColors,
        tones: tones,
        visualDensity: visualDensity,
        textTheme: textTheme,
        primaryTextTheme: primaryTextTheme,
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        package: package,
        materialTapTargetSize: materialTapTargetSize,
        pageTransitionsTheme: pageTransitionsTheme,
        splashFactory: splashFactory,
        platform: platform,
        typography: typography,
        applyElevationOverlayColor: applyElevationOverlayColor,
        useMaterial3: useMaterial3,
        swapLegacyOnMaterial3: swapLegacyOnMaterial3,
        extensions: extensions,
      ).toTheme;
}
