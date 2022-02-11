// ignore_for_file: comment_references

import 'package:flutter/material.dart';

import 'flex_color.dart';
import 'flex_color_scheme.dart';
import 'flex_scheme.dart';
import 'flex_sub_themes_data.dart';

/// A convenience extension on [ThemeData] to define a
/// [FlexColorScheme] object and return the [ThemeData] object defined by
/// its instance, using its [FlexColorScheme.toTheme] method in one go.
///
/// Provided convenience extensions are:
///
/// * FlexThemeData.light(), based on FlexColorScheme.light().toTheme
/// * FlexThemeData.dark(), based on FlexColorScheme.dark().toTheme
///
/// The goal is to be able to provide these as static extensions
/// on ThemeData, so it would be possible to say:
///
/// * ThemeData.flexLight(), based on FlexColorScheme.light().toTheme
/// * ThemeData.flexDark(), based on FlexColorScheme.dark().toTheme
///
/// Dart does not yet support such extensions, see:
/// https://github.com/dart-lang/language/issues/723
///
/// Using e.g. [FlexThemeData.light] is a bit shorter than
/// [FlexColorScheme.light]`.toTheme`, and it may feel more familiar since
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
    /// The property is deprecated in Flutter SDK and was replaced
    /// by a new property called [primaryContainer]. It is deprecated from
    /// master v2.6.0-0.0.pre, and in stable (2.10.0).
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
    @Deprecated('Replaced with `primaryContainer`, after version 4.2.0, '
        'due to deprecation in Flutter master from 2.10.0')
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

    /// A darker version of the secondary color.
    ///
    /// In Flutter SDK the [secondaryVariant] color is not used by in any
    /// built-in widgets default themes or predefined widget behavior.
    /// It is an excellent property to use if you need a custom color for
    /// custom widgets accessible via your application's ThemeData, and that is
    /// not used as default color by any built-in widgets. So you are in
    /// Flutter 2.8.1 and earlier version free to set it to whatever color you
    /// need and not affect any built-in widgets theme based colors.
    ///
    /// The property is deprecated in Flutter SDK and was replaced
    /// by a new property called [secondaryContainer]. It is deprecated from
    /// master v2.6.0-0.0.pre, and in stable (2.10.0).
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
    /// The override color is included and affected by factory properties
    /// [usedColors] and [swapColors] and included in their behavior.
    ///
    /// Defaults to null.
    @Deprecated('Replaced with `secondaryContainer`, after version 4.2.0, '
        'due to deprecation in Flutter master from 2.10.0')
        final Color? secondaryVariant,

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
    /// pre-defined color scheme based on [FlexScheme] `scheme` property and
    /// the [FlexAppBarStyle] [appBarStyle] property.
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

    /// Makes the light theme backgrounds lighter or even white.
    ///
    /// Scaffold background will become white, and other surfaces also get
    /// lighter (8%), if using low blend levels they may become fully white too.
    final bool lightIsWhite = false,

    /// When true, the primary and primaryContainer colors will be swapped with
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
    /// Defaults to the current platform, as exposed by `defaultTargetPlatform`
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

    /// Optional configuration parameters for the opt-in sub-themes.
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

    /// A temporary flag used to opt-in to new Material 3 features.
    ///
    /// If true, then components that have been migrated to Material 3 will
    /// start using new colors, typography and other features of Material 3.
    /// If false, they will use the Material 2 look and feel.
    ///
    /// Currently no components have been migrated to support Material 3.
    /// As they are updated to include Material 3 support this documentation
    /// will be modified to indicate exactly what widgets this flag will affect.
    ///
    /// During the migration to Material 3, turning this on may yield
    /// inconsistent look and feel in your app. Some components will be migrated
    /// before others and typography changes will be coming in stages.
    ///
    /// [useMaterial3] defaults to false. After all the migrated components
    /// have landed on stable, we will change this to be true by default. After
    /// that change has landed on stable, we will deprecate this flag and remove
    /// all uses of it. Everything will use the Material 3 look and feel at
    /// that point.
    ///
    /// See also:
    ///
    ///   * [Material Design 3](https://m3.material.io/).
    final bool useMaterial3 = false,
  }) {
    return FlexColorScheme.light(
      colors: colors,
      scheme: scheme,
      colorScheme: colorScheme,
      usedColors: usedColors,
      surfaceMode: surfaceMode,
      blendLevel: blendLevel,
      appBarStyle: appBarStyle,
      appBarOpacity: appBarOpacity,
      appBarElevation: appBarElevation,
      bottomAppBarElevation: bottomAppBarElevation,
      tabBarStyle: tabBarStyle,
      primary: primary,
      primaryContainer: primaryContainer ?? primaryVariant,
      secondary: secondary,
      secondaryContainer: secondaryContainer ?? secondaryVariant,
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
      lightIsWhite: lightIsWhite,
      swapColors: swapColors,
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
      useMaterial3: useMaterial3,
    ).toTheme;
  }

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
    /// The property is deprecated in Flutter SDK and was replaced
    /// by a new property called [primaryContainer]. It is deprecated from
    /// master v2.6.0-0.0.pre, and in stable (2.10.0).
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
    @Deprecated('Replaced with `primaryContainer`, after version 4.2.0, '
        'due to deprecation in Flutter master from 2.10.0')
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

    /// A darker version of the secondary color.
    ///
    /// In Flutter SDK the [secondaryVariant] color is not used by in any
    /// built-in widgets default themes or predefined widget behavior.
    /// It is an excellent property to use if you need a custom color for
    /// custom widgets accessible via your application's ThemeData, and that is
    /// not used as default color by any built-in widgets. So you are in
    /// Flutter 2.8.1 and earlier version free to set it to whatever color you
    /// need and not affect any built-in widgets theme based colors.
    ///
    /// The property is deprecated in Flutter SDK and was replaced
    /// by a new property called [secondaryContainer]. It is deprecated from
    /// master v2.6.0-0.0.pre, and in stable (2.10.0).
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
    /// The override color is included and affected by factory properties
    /// [usedColors] and [swapColors] and included in their behavior.
    ///
    /// Defaults to null.
    @Deprecated('Replaced with `secondaryContainer`, after version 4.2.0, '
        'due to deprecation in Flutter master from 2.10.0')
        final Color? secondaryVariant,

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

    /// Makes the dark theme backgrounds darker or even black.
    ///
    /// Scaffold background will become fully black, and other surfaces also get
    /// darker (8%), if using low blend levels they may become fully black too.
    final bool darkIsTrueBlack = false,

    /// When true, the primary and primaryContainer colors will be swapped with
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
    /// Defaults to the current platform, as exposed by `defaultTargetPlatform`
    /// This should be used in order to style UI elements according to platform
    /// conventions.
    ///
    /// Widgets from the material library should use this getter (via
    /// [Theme.of]) to determine the current platform for the purpose of
    /// emulating the platform behavior (e.g. scrolling or haptic effects).
    /// Widgets and render objects at lower layers that try to emulate the
    /// underlying platform platform can depend on `defaultTargetPlatform`
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

    /// Optional configuration parameters for the opt-in sub-themes.
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

    /// A temporary flag used to opt-in to new Material 3 features.
    ///
    /// If true, then components that have been migrated to Material 3 will
    /// start using new colors, typography and other features of Material 3.
    /// If false, they will use the Material 2 look and feel.
    ///
    /// Currently no components have been migrated to support Material 3.
    /// As they are updated to include Material 3 support this documentation
    /// will be modified to indicate exactly what widgets this flag will affect.
    ///
    /// During the migration to Material 3, turning this on may yield
    /// inconsistent look and feel in your app. Some components will be migrated
    /// before others and typography changes will be coming in stages.
    ///
    /// [useMaterial3] defaults to false. After all the migrated components
    /// have landed on stable, we will change this to be true by default. After
    /// that change has landed on stable, we will deprecate this flag and remove
    /// all uses of it. Everything will use the Material 3 look and feel at
    /// that point.
    ///
    /// See also:
    ///
    ///   * [Material Design 3](https://m3.material.io/).
    final bool useMaterial3 = false,
  }) {
    return FlexColorScheme.dark(
      colorScheme: colorScheme,
      colors: colors,
      scheme: scheme,
      usedColors: usedColors,
      surfaceMode: surfaceMode,
      blendLevel: blendLevel,
      appBarStyle: appBarStyle,
      appBarOpacity: appBarOpacity,
      appBarElevation: appBarElevation,
      bottomAppBarElevation: bottomAppBarElevation,
      tabBarStyle: tabBarStyle,
      primary: primary,
      primaryContainer: primaryContainer ?? primaryVariant,
      secondary: secondary,
      secondaryContainer: secondaryContainer ?? secondaryVariant,
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
      darkIsTrueBlack: darkIsTrueBlack,
      swapColors: swapColors,
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
      useMaterial3: useMaterial3,
    ).toTheme;
  }
}
