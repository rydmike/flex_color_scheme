import 'package:flutter/material.dart';

import 'flex_color.dart';
import 'flex_color_scheme.dart';
import 'flex_scheme.dart';
import 'flex_sub_themes_data.dart';

/// Convenience extensions on ThemeData to return a ThemeData object defined
/// by [FlexColorScheme.toTheme] method.
///
/// Provided convenience extensions are:
///
/// * FlexThemeData.light(), based on FlexColorScheme.light().toTheme
/// * FlexThemeData.dark(), based on FlexColorScheme.dark().toTheme
/// * FlexThemeData.raw(), based on FlexColorScheme().toTheme
///
/// The goal is to eventually be able to provide these as static extensions
/// on ThemeData, so it would be possible to say:
///
/// * ThemeData.flexLight(), based on FlexColorScheme.light().toTheme
/// * ThemeData.flexDark(), based on FlexColorScheme.dark().toTheme
/// * ThemeData.flexRaw(), based on FlexColorScheme().toTheme
///
/// Dart does not yet support such extensions, see:
/// https://github.com/dart-lang/language/issues/723
///
/// Using these static extension with the Extension name does not yet add as
/// much familiarity as being able to use it on ThemeData directly would do.
/// It was anyway added as an option, hopefully pending delivery on above
/// mentioned issue will allow for the 2nd mentioned syntax as well some day.
///
/// Using FlexThemeData.light() is still a bit shorter
/// than FlexColorScheme.light().toTheme, and it may feel more familiar.
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
  /// and its `toTheme` method.
  static ThemeData light({
    /// The [FlexSchemeColor] that we will create the light [FlexColorScheme]
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
    /// standard [ColorScheme.light] surface colors, which follows the
    /// default color scheme in the Material Design guide for light theme found
    /// [here](https://material.io/design/color/the-color-system.html#color-theme-creation).
    ///
    /// If values for the properties `surface`, `background`,
    /// `dialogBackground` or `scaffoldBackground` are given,
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
    /// The mode [FlexSurfaceMode.highBackground] can be used to replace the
    /// style that is produced when using [FlexColorScheme.surfaceStyle] enum
    /// property [FlexSurface] in [FlexColorScheme.light] and
    /// [FlexColorScheme.dark]. The mode [FlexSurfaceMode.highBackground] uses
    /// the same design concept as the only style offered by [FlexSurface] in
    /// [FlexColorScheme.surfaceStyle] before version 4.0.0.
    ///
    /// By adjusting the [FlexColorScheme.blendLevel] property and using this
    /// style, you can find a similar visual effect when using
    /// [FlexSurfaceMode.highBackground] with the following values when matching
    /// match most prominent blended [ColorScheme.background] color.
    ///
    /// In light theme mode:
    /// * [FlexSurface.material] 0% : blendLevel = 0
    /// * [FlexSurface.light]    2% : blendLevel = 2..3
    /// * [FlexSurface.medium]   4% : blendLevel = 5
    /// * [FlexSurface.strong]   6% : blendLevel = 7..8
    /// * [FlexSurface.heavy]    8% : blendLevel = 10
    ///
    /// In dark theme mode:
    /// * [FlexSurface.material] 0% : blendLevel = 0
    /// * [FlexSurface.light]    5% : blendLevel = 3
    /// * [FlexSurface.medium]   8% : blendLevel = 5
    /// * [FlexSurface.strong]  11% : blendLevel = 7
    /// * [FlexSurface.heavy]   14% : blendLevel = 8..9
    ///
    /// Since there is not an exact 2:1 relationship between background and
    /// surface, when using the older [FlexSurface] based style, nor is
    /// scaffoldBackground : surface always a 1 : 4 relationship. The old and
    /// new designs do never align exactly at any blendLevel, but the above
    /// values produce visually very close results.
    ///
    /// To get elevation overlay color in dark themes on all surfaces used by
    /// [Material], use one of the modes where background and dialog color
    /// equals the blend strength on surface color, like [flat], [lowScaffold],
    /// [highScaffold], [highScaffold]. Other modes will only use elevation
    /// overlay if their background happens to be equal to resulting
    /// colorScheme.surface color. For more information
    /// see issue: https://github.com/flutter/flutter/issues/90353
    ///
    /// When using very strong surface branding in dark mode, having an overlay
    /// elevation color in dark mode is less critical, since the elevation
    /// becomes partially visible via shadows and the surface may even have
    /// another color tint if using e.g. [lowScaffoldVariantDialog] or
    /// [highScaffoldVariantDialog].
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
    /// In light mode the blend level value equals the alpha value in the
    /// alpha blends for the surfaces, in dark mode, 2x the blend value
    /// is used for alpha.
    ///
    /// Defaults to 10.
    final int blendLevel = 10,

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
    /// In Flutter SDK the `primaryVariant` color is only used by [SnackBar]
    /// button color in dark theme mode as a part of predefined widget behavior.
    /// If you provide a custom [SnackBarThemeData] where you define
    /// [SnackBarThemeData.actionTextColor] to `primary` or `secondary`, this
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
    /// In Flutter SDK the `secondaryVariant` color is not used by in any
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

    /// The color to use for input validation errors, e.g. for
    /// [InputDecoration.errorText].
    ///
    /// If no value is given defaults to [FlexColor.materialLightError] if
    /// brightness is light and to [FlexColor.materialDarkError] if brightness
    /// is dark.
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

    /// A color that is clearly legible when drawn on `primary` color.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// `primary` and `onPrimary` is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// If null, the on color is derived from the brightness of the `primary`
    /// color, and will be be black if it is light and white if it is dark.
    final Color? onPrimary,

    /// A color that is clearly legible when drawn on `secondary` color.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// `secondary` and `onSecondary` is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// If null, the on color is derived from the brightness of the `secondary`
    /// color, and will be be black if it is light and white if it is dark.
    final Color? onSecondary,

    /// A color that is clearly legible when drawn on `surface` color.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// `surface` and `onSurface` is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// If null, the on color is derived from the brightness of the `surface`
    /// color, and will be be black if it is light and white if it is dark.
    final Color? onSurface,

    /// A color that is clearly legible when drawn on `background` color.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// `background` and `onBackground` is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// If null, the on color is derived from the brightness of the `background`
    /// color, and will be be black if it is light and white if it is dark.
    final Color? onBackground,

    /// A color that is clearly legible when drawn on `error` color.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// `error` and `onError` is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// If null, the on color is derived from the brightness of the `error`
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
    /// argument. The [dart.io.Platform] object should only be used directly
    /// when it's critical to actually know the current platform, without any
    /// overrides possible, e.g. when a system API is about to be called.
    ///
    /// In a test environment, the platform returned is [TargetPlatform.android]
    /// regardless of the host platform. (Android was chosen because the tests
    /// were originally written assuming Android-like behavior, and we added
    /// platform adaptations for other platforms later). Tests can check
    /// behavior for other platforms by setting the [platform] of the
    /// [Theme] explicitly to another [TargetPlatform] value, or by setting
    /// `debugDefaultTargetPlatformOverride`.
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

    /// Set to true to opt in on using additional opinionated widget sub-themes.
    ///
    /// By default [FlexThemeData.light] and [FlexColorScheme.toTheme],
    /// tries to do as little as they need to just provide a consistent color
    /// schemed theme.
    ///
    /// By opting in via [subThemesData] you get an opinionated set of widget
    /// sub-themes applied. They can be conveniently customized via the
    /// [subThemesData] property, that holds quick and easy sub-theme
    /// configuration values in the data class [FlexSubThemesData].
    ///
    /// Opinionated sub-themes are provided for:
    /// * [BottomSheet]
    /// * [BottomNavigationBar]
    /// * [Card]
    /// * [Dialog]
    /// * [PopupMenuButton]
    /// * [TimePickerDialog]
    /// * [InputDecoration]
    /// * [ElevatedButton]
    /// * [OutlinedButton]
    /// * [TextButton]
    /// * [ToggleButtons]
    /// * A custom [ButtonTextTheme] still provides matching styling to support
    ///   the deprecated legacy buttons if they are used.
    ///
    /// The sub-themes are e.g. a convenient way to opt-in on customized corner
    /// radius on Widgets using above themes. By opting in you can set corner
    /// radius for all above Widgets to same corner radius in one go.
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
  }) {
    return FlexColorScheme.light(
      colors: colors,
      scheme: scheme,
      usedColors: usedColors,
      surfaceStyle: surfaceStyle,
      surfaceMode: surfaceMode,
      blendLevel: blendLevel,
      appBarStyle: appBarStyle,
      appBarOpacity: appBarOpacity,
      appBarElevation: appBarElevation,
      bottomAppBarElevation: bottomAppBarElevation,
      tabBarStyle: tabBarStyle,
      primary: primary,
      primaryVariant: primaryVariant,
      secondary: secondary,
      secondaryVariant: secondaryVariant,
      error: error,
      surface: surface,
      background: background,
      scaffoldBackground: scaffoldBackground,
      dialogBackground: dialogBackground,
      appBarBackground: appBarBackground,
      onPrimary: onPrimary,
      onSecondary: onSecondary,
      onSurface: onSurface,
      onBackground: onBackground,
      onError: onError,
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
    ).toTheme;
  }

  /// Return a ThemeData defined by factory FlexColorScheme().dark object and
  /// its toTheme method.
  static ThemeData dark({
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
    /// If values for the properties `surface`, `background`,
    /// `dialogBackground` or `scaffoldBackground` are given,
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
    /// The mode [FlexSurfaceMode.highBackground] can be used to replace the
    /// style that is produced when using [FlexColorScheme.surfaceStyle] enum
    /// property [FlexSurface] in [FlexColorScheme.light] and
    /// [FlexColorScheme.dark]. The mode [FlexSurfaceMode.highBackground] uses
    /// the same design concept as the only style offered by [FlexSurface] in
    /// [FlexColorScheme.surfaceStyle] before version 4.0.0.
    ///
    /// By adjusting the [FlexColorScheme.blendLevel] property and using this
    /// style, you can find a similar visual effect when using
    /// [FlexSurfaceMode.highBackground] with the following values when matching
    /// match most prominent blended [ColorScheme.background] color.
    ///
    /// In light theme mode:
    /// * [FlexSurface.material] 0% : blendLevel = 0
    /// * [FlexSurface.light]    2% : blendLevel = 2..3
    /// * [FlexSurface.medium]   4% : blendLevel = 5
    /// * [FlexSurface.strong]   6% : blendLevel = 7..8
    /// * [FlexSurface.heavy]    8% : blendLevel = 10
    ///
    /// In dark theme mode:
    /// * [FlexSurface.material] 0% : blendLevel = 0
    /// * [FlexSurface.light]    5% : blendLevel = 3
    /// * [FlexSurface.medium]   8% : blendLevel = 5
    /// * [FlexSurface.strong]  11% : blendLevel = 7
    /// * [FlexSurface.heavy]   14% : blendLevel = 8..9
    ///
    /// Since there is not an exact 2:1 relationship between background and
    /// surface, when using the older [FlexSurface] based style, nor is
    /// scaffoldBackground : surface always a 1 : 4 relationship. The old and
    /// new designs do never align exactly at any blendLevel, but the above
    /// values produce visually very close results.
    ///
    /// To get elevation overlay color in dark themes on all surfaces used by
    /// [Material], use one of the modes where background and dialog color
    /// equals the blend strength on surface color, like [flat], [lowScaffold],
    /// [highScaffold], [highScaffold]. Other modes will only use elevation
    /// overlay if their background happens to be equal to resulting
    /// colorScheme.surface color. For more information
    /// see issue: https://github.com/flutter/flutter/issues/90353
    ///
    /// When using very strong surface branding in dark mode, having an overlay
    /// elevation color in dark mode is less critical, since the elevation
    /// becomes partially visible via shadows and the surface may even have
    /// another color tint if using e.g. [lowScaffoldVariantDialog] or
    /// [highScaffoldVariantDialog].
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
    /// In light mode the blend level value equals the alpha value in the
    /// alpha blends for the surfaces, in dark mode, 2x the blend value
    /// is used for alpha.
    ///
    /// Defaults to 10.
    final int blendLevel = 10,

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
    /// In Flutter SDK the `primaryVariant` color is only used by [SnackBar]
    /// button color in dark theme mode as a part of predefined widget behavior.
    /// If you provide a custom [SnackBarThemeData] where you define
    /// [SnackBarThemeData.actionTextColor] to `primary` or `secondary`, this
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
    /// In Flutter SDK the `secondaryVariant` color is not used by in any
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

    /// The color to use for input validation errors, e.g. for
    /// [InputDecoration.errorText].
    ///
    /// If no value is given defaults to [FlexColor.materialLightError] if
    /// brightness is light and to [FlexColor.materialDarkError] if brightness
    /// is dark.
    final Color? error,

    /// The surface (background) color for widgets like [Card] and
    /// [BottomAppBar].
    ///
    /// The color is applied to [ThemeData.cardColor] and
    /// [ColorScheme.surface] in [ThemeData.colorScheme], it is also used
    /// by all [Material] of type [MaterialType.card].
    ///
    /// If null, the color is determined by mode defined by property
    /// `surfaceMode` [FlexSurfaceMode] enum or `surfaceStyle` enum
    /// [FlexSurface].
    final Color? surface,

    /// A color that typically appears behind scrollable content.
    ///
    /// The color is applied to [ThemeData.canvasColor] and
    /// [ThemeData.backgroundColor], it is used eg by menu [Drawer] and by all
    /// [Material] of type [MaterialType.canvas].
    ///
    /// If null, the color is determined by mode defined by property
    /// `surfaceMode` [FlexSurfaceMode] enum or `surfaceStyle` enum
    /// [FlexSurface].
    final Color? background,

    /// The color of the [Scaffold] background.
    ///
    /// The color is applied to [ThemeData.scaffoldBackgroundColor].
    ///
    /// If null, the color is determined by mode defined by property
    /// `surfaceMode` [FlexSurfaceMode] enum or `surfaceStyle` enum
    /// [FlexSurface].
    final Color? scaffoldBackground,

    /// The background color of Dialog elements.
    ///
    /// If null, the color is determined by mode defined by property
    /// `surfaceMode` [FlexSurfaceMode] enum or `surfaceStyle` enum
    /// [FlexSurface].
    final Color? dialogBackground,

    /// Background theme color for the [AppBar].
    ///
    /// When using the factory this is an override color for the color that
    /// would be used based on the corresponding color property defined in
    /// [FlexSchemeColor] `colors` or for this color defined when using a
    /// pre-defined color scheme based on [FlexScheme] `scheme` property and
    /// the [FlexAppBarStyle] `appBarStyle` property.
    final Color? appBarBackground,

    /// A color that is clearly legible when drawn on `primary` color.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// `primary` and `onPrimary` is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// If null, the on color is derived from the brightness of the `primary`
    /// color, and will be be black if it is light and white if it is dark.
    final Color? onPrimary,

    /// A color that is clearly legible when drawn on `secondary` color.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// `secondary` and `onSecondary` is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// If null, the on color is derived from the brightness of the `secondary`
    /// color, and will be be black if it is light and white if it is dark.
    final Color? onSecondary,

    /// A color that is clearly legible when drawn on `surface` color.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// `surface` and `onSurface` is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// If null, the on color is derived from the brightness of the `surface`
    /// color, and will be be black if it is light and white if it is dark.
    final Color? onSurface,

    /// A color that is clearly legible when drawn on `background` color.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// `background` and `onBackground` is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// If null, the on color is derived from the brightness of the `background`
    /// color, and will be be black if it is light and white if it is dark.
    final Color? onBackground,

    /// A color that is clearly legible when drawn on `error` color.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// `error` and `onError` is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// If null, the on color is derived from the brightness of the `error`
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
    /// `debugDefaultTargetPlatformOverride`.
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

    /// Set to true to opt in on using additional opinionated widget sub-themes.
    ///
    /// By default [FlexThemeData.dark] and [FlexColorScheme.toTheme],
    /// tries to do as little as they need to just provide a consistent color
    /// schemed theme.
    /// By opting in via [useSubThemes] you get an opinionated set of widget
    /// sub-themes applied. They can be conveniently customized via the
    /// [subThemesData] property, that holds quick and easy sub-theme
    /// configuration values in the data class [FlexSubThemesData].
    ///
    /// Opinionated sub-themes are provided for:
    /// * [BottomSheet]
    /// * [BottomNavigationBar]
    /// * [Card]
    /// * [Dialog]
    /// * [PopupMenuButton]
    /// * [TimePickerDialog]
    /// * [InputDecoration]
    /// * [ElevatedButton]
    /// * [OutlinedButton]
    /// * [TextButton]
    /// * [ToggleButtons]
    /// * A custom [ButtonTextTheme] still provides matching styling to support
    ///   the deprecated legacy buttons if they are used.
    ///
    /// The sub-themes are e.g. a convenient way to opt-in on customized corner
    /// radius on Widgets using above themes. By opting in you can set corner
    /// radius for all above Widgets to same corner radius in one go.
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
  }) {
    return FlexColorScheme.dark(
      colors: colors,
      scheme: scheme,
      usedColors: usedColors,
      surfaceStyle: surfaceStyle,
      surfaceMode: surfaceMode,
      blendLevel: blendLevel,
      appBarStyle: appBarStyle,
      appBarOpacity: appBarOpacity,
      appBarElevation: appBarElevation,
      bottomAppBarElevation: bottomAppBarElevation,
      tabBarStyle: tabBarStyle,
      primary: primary,
      primaryVariant: primaryVariant,
      secondary: secondary,
      secondaryVariant: secondaryVariant,
      error: error,
      surface: surface,
      background: background,
      scaffoldBackground: scaffoldBackground,
      dialogBackground: dialogBackground,
      appBarBackground: appBarBackground,
      onPrimary: onPrimary,
      onSecondary: onSecondary,
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
    ).toTheme;
  }

  /// Return a ThemeData defined by raw FlexColorScheme() object and its
  /// toTheme method.
  static ThemeData raw({
    /// The overall brightness of this color scheme.
    ///
    /// The brightness value is required and cannot be null.
    required final Brightness brightness,

    /// The color displayed most frequently across your app’s screens and
    /// components.
    ///
    /// The color value is required and cannot be null.
    required final Color primary,

    /// A darker version of the primary color.
    ///
    /// The color value is required and cannot be null.
    required final Color primaryVariant,

    /// An accent color that, when used sparingly, calls attention to parts
    /// of your app.
    ///
    /// The color value is required and cannot be null.
    required final Color secondary,

    /// A darker version of the secondary color.
    ///
    /// The color value is required and cannot be null.
    required final Color secondaryVariant,

    /// The color to use for input validation errors, e.g. for
    /// [InputDecoration.errorText].
    ///
    /// If no value is given defaults to [FlexColor.materialLightError] if
    /// brightness is light and to [FlexColor.materialDarkError] if brightness
    /// is dark.
    final Color? error,

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
    final Color? surface,

    /// A color that typically appears behind scrollable content.
    ///
    /// The color is applied to ThemeData `canvasColor` and`backgroundColor`,
    /// it is used eg in menu drawer.
    ///
    /// If no value is given defaults to FlexColor.materialLightBackground if
    /// brightness is light and to FlexColor.materialDarkBackground if
    /// brightness is dark.
    final Color? background,

    /// The color of the [Scaffold] background.
    ///
    /// The color is applied to [ThemeData.scaffoldBackgroundColor].
    ///
    /// This color cannot be controlled separately with Flutter's standard
    /// [ColorScheme] based themes. FlexColorScheme brings back the possibility
    /// to specify it directly when using color scheme based themes.
    ///
    /// If no color is given, it defaults to [background].
    final Color? scaffoldBackground,

    /// The background color of [Dialog] elements.
    ///
    /// The color is applied to [ThemeData.dialogBackgroundColor].
    ///
    /// If no value is given, it defaults to [surface].
    final Color? dialogBackground,

    /// Background theme color for the [AppBar].
    ///
    /// This theme color cannot be controlled separately with Flutter's standard
    /// [ThemeData.from] a [ColorScheme]. FlexColorScheme enables you to specify
    /// an app bar theme color that is independent of the primary color in light
    /// theme and in dark mode of the dark theme's dark surface color.
    ///
    /// If no color is given it defaults to the Flutter standard color scheme
    /// based light and dark app bar theme colors.
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
    final FlexTabBarStyle tabBarStyle = FlexTabBarStyle.forAppBar,

    /// The themed elevation for the [AppBar].
    ///
    /// Defaults to 0, cannot be null.
    ///
    /// The 0 elevation is an iOs style
    /// influenced opinionated choice, but it can easily be adjusted for the
    /// theme with this property.
    final double appBarElevation = 0,

    /// The themed elevation for the bottom app bar.
    ///
    /// Defaults to 0, cannot be null.
    ///
    /// The 0 default is so it matches the themed app bar elevation default,
    /// but it can easily be adjusted for the theme with this property.
    final double bottomAppBarElevation = 0,

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
    TextTheme? textTheme,

    /// A text theme that contrasts with the primary color.
    TextTheme? primaryTextTheme,

    /// Name of the font family to use as default for the theme.
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
    ///  * <https://material.io/design/color/dark-theme.html>, which specifies how
    ///    the overlay should be applied.
    ///
    /// Known limitations:
    ///
    /// Because of how the overlay color application is implemented in Flutter
    /// SDK, you will only get overlay color applied in dark mode when this
    /// value is true, if the [Material] surface color being elevated is equal
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
    bool applyElevationOverlayColor = true,

    /// Set to true to opt in on using additional opinionated widget sub-themes.
    ///
    /// By default [FlexThemeData.raw] and [FlexColorScheme.toTheme],
    /// tries to do as little as they need to just provide a consistent color
    /// schemed theme.
    /// By opting in via [useSubThemes] you get an opinionated set of widget
    /// sub-themes applied. They can be conveniently customized via the
    /// [subThemesData] property, that holds quick and easy sub-theme
    /// configuration values in the data class [FlexSubThemesData].
    ///
    /// Opinionated sub-themes are provided for:
    /// * [BottomSheet]
    /// * [BottomNavigationBar]
    /// * [Card]
    /// * [Dialog]
    /// * [PopupMenuButton]
    /// * [TimePickerDialog]
    /// * [InputDecoration]
    /// * [ElevatedButton]
    /// * [OutlinedButton]
    /// * [TextButton]
    /// * [ToggleButtons]
    /// * A custom [ButtonTextTheme] still provides matching styling to support
    ///   the deprecated legacy buttons if they are used.
    ///
    /// The sub-themes are e.g. a convenient way to opt-in on customized corner
    /// radius on Widgets using above themes. By opting in you can set corner
    /// radius for all above Widgets to same corner radius in one go.
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
  }) {
    return FlexColorScheme(
      brightness: brightness,
      primary: primary,
      primaryVariant: primaryVariant,
      secondary: secondary,
      secondaryVariant: secondaryVariant,
      error: error,
      surface: surface,
      background: background,
      scaffoldBackground: scaffoldBackground,
      dialogBackground: dialogBackground,
      appBarBackground: appBarBackground,
      onPrimary: onPrimary,
      onSecondary: onSecondary,
      onSurface: onSurface,
      onBackground: onBackground,
      onError: onError,
      tabBarStyle: tabBarStyle,
      appBarElevation: appBarElevation,
      bottomAppBarElevation: bottomAppBarElevation,
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
    ).toTheme;
  }
}
