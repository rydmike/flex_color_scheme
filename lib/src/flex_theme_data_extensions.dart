import 'package:flutter/material.dart';

import 'flex_color.dart';
import 'flex_color_scheme.dart';
import 'flex_scheme.dart';

/// Extensions on ThemeData to return a ThemeData object defined
/// by a FlexColorScheme and its toTheme method.
///
/// Provided extensions:
///
/// * FlexThemeData.light(), based on FlexColorScheme.light().toTheme
/// * FlexThemeData.dark(), based on FlexColorScheme.dark().toTheme
/// * FlexThemeData.raw(), based on FlexColorScheme().toTheme
///
/// The goal is to eventually be able to provide these as static on extensions
/// on ThemeData so it would be possible to say:
///
/// * ThemeData.flexLight(), based on FlexColorScheme.light().toTheme
/// * ThemeData.flexDark(), based on FlexColorScheme.dark().toTheme
/// * ThemeData.flexRaw(), based on FlexColorScheme().toTheme
///
/// Unfortunately Dart does not yet support such extensions, see:
/// https://github.com/dart-lang/language/issues/723
///
/// Using these static extension with the Extension name does not yet add as
/// much familiarity as being able to use it on ThemeData directly would do.
/// It was anyway added as an option, hopefully pending delivery on above
/// mentioned issue will allow for the 2nd mentioned syntax as well some day.
///
/// Using FlexThemeData.light() is still a bit shorter
/// than FlexColorScheme.light().toTheme, and it may feel more familiar.
extension FlexThemeData on ThemeData {
  /// Return a ThemeData defined by factory FlexColorScheme().light object and
  /// its toTheme method.
  static ThemeData light({
    /// The [FlexSchemeColor] that we will create the light [FlexColorScheme]
    /// from.
    ///
    /// You can use predefined [FlexSchemeColor] values from
    /// [FlexColor.schemes] map or define your own colors with
    /// [FlexSchemeColor] or [FlexSchemeColor.from].
    ///
    /// For using built-in color schemed, the convenience shortcut to select
    /// it with the `scheme` property is recommended and leaving `colors`
    /// undefined. If both are specified the scheme colors defined by `colors`
    /// are used. If both are null then `scheme` defaults to
    /// [FlexScheme.material], thus defining the resulting scheme.
    FlexSchemeColor? colors,

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
    ///
    FlexScheme? scheme,

    /// Defines which surface style to use.
    ///
    /// Defaults to [FlexSurface.material] which results in Flutter
    /// standard [ColorScheme.light] surface colors, which follows the
    /// default color scheme in the Material Design
    /// guide for light theme found
    /// [here](https://material.io/design/color/the-color-system.html#color-theme-creation).
    ///
    /// If values for surface, background or scaffoldBackground are
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

    /// Select preferred style for the default TabBarTheme.
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
    FlexTabBarStyle tabBarStyle = FlexTabBarStyle.forAppBar,

    /// The themed elevation for the app bar.
    ///
    /// Default to 0. The 0 elevation is an iOs style
    /// influenced opinionated choice, but it can easily be adjusted for the
    /// theme with this property.
    double appBarElevation = 0,

    /// The themed elevation for the bottom app bar.
    ///
    /// If null, defaults to the value given to the `appBarElevation` elevation.
    double? bottomAppBarElevation,

    /// The background color for widgets like Card, BottomAppBar and Dialogs.
    ///
    /// If null, the color is determined by [FlexSurface] `surfaceStyle`.
    Color? surface,

    /// A color that typically appears behind scrollable content.
    ///
    /// The color is applied to ThemeData `canvasColor` and`backgroundColor`,
    /// it is used eg in menu drawer.
    ///
    /// If null, the color is determined by [FlexSurface] `surfaceStyle`.
    Color? background,

    /// The color of the scaffold background.
    ///
    /// If null, the color is determined by [FlexSurface] `surfaceStyle`.
    Color? scaffoldBackground,

    /// A color that is clearly legible when drawn on primary color.
    ///
    /// If null, the on color is derived from the brightness of the primary
    /// color, and will be be black if it is light and white if it is dark.
    Color? onPrimary,

    /// A color that is clearly legible when drawn on secondary color.
    ///
    /// If null, the on color is derived from the brightness of the secondary
    /// color, and will be be black if it is light and white if it is dark.
    Color? onSecondary,

    /// A color that is clearly legible when drawn on surface color.
    ///
    /// If null, the on color is derived from the brightness of the surface
    /// color, and will be be black if it is light and white if it is dark.
    Color? onSurface,

    /// A color that is clearly legible when drawn on background color, it is
    /// also used as on color for scaffoldBackground.
    ///
    /// If null, the on color is derived from the brightness of the background
    /// color, and will be be black if it is light and white if it is dark.
    Color? onBackground,

    /// A color that is clearly legible when drawn on error.
    ///
    /// If null, the on color is derived from the brightness of the error
    /// color, and will be be black if it is light and white if it is dark.
    Color? onError,

    /// If true, this will swap primary and variant colors with their
    /// secondary counter parts.
    ///
    /// This flag can be set to true, if you want to make a theme where
    /// your primary and secondary colors are swapped.
    ///
    /// This feature is useful if you want to do this with the pre-defined
    /// schemes. If you are explicitly defining all your theme colors you can
    /// of course define them as desired. Even if you do
    /// that, this feature will still swap whatever colors you defined
    /// for primary and secondary. You can offer these feature as an easy end
    /// user modifiable theme option if you like.
    bool swapColors = false,

    /// Tooltips background color will match the brightness of the theme's
    /// background color.
    ///
    /// By default Flutter's Material tooltips uses a theme where the tooltip
    /// background color brightness is inverted in relation to the overall
    /// theme's background color. FlexColorScheme allows you to use a single
    /// toggle to invert this. Light tooltips on light background is e.g. the
    /// default style on Windows Desktop. You can use this toggle to use this
    /// style, or as a means to create a platform adaptive
    /// tooltip style, where the Material/Flutter style is used on devices and
    /// Web, but the inverted scheme would be used on desktop platforms.
    ///
    /// Defaults to false, uses same background style as Material and Flutter.
    bool tooltipsMatchBackground = false,

    /// When set to `true`, it makes the status bar on Android the same color as
    /// the rest of the AppBar. Defaults to true.
    ///
    /// When true, the AppBar in Android mimics the look of one-toned AppBar's
    /// typically used on iOS. Set to `false`, to revert back and use
    /// Android's default two-toned look. If true the status bar area is
    /// actually also transparent so that if the app bar is also translucent,
    /// content that scrolls behind it, is also visible behind the status
    /// bar area.
    ///
    /// You may need to fully restart the app and even rebuild for changes to
    /// this setting to take effect on Android devices and emulators.
    bool transparentStatusBar = true,

    /// Same property as in [ThemeData] factory, it is just passed along to it.
    ///
    /// Included for convenience to avoid a copyWith if it needs to be changed.
    VisualDensity? visualDensity,

    /// Text with a color that contrasts with the card and canvas colors.
    TextTheme? textTheme,

    /// A text theme that contrasts with the primary color.
    TextTheme? primaryTextTheme,

    /// Same property as in [ThemeData] factory, it is just passed along to it.
    ///
    /// Included for convenience to avoid a copyWith if it needs to be changed.
    String? fontFamily,

    /// Same property as in [ThemeData] factory, it is just passed along to it.
    ///
    /// Included for convenience to avoid a copyWith if it needs to be changed.
    /// Defaults to `defaultTargetPlatform`.
    TargetPlatform? platform,

    /// Same property as in [ThemeData] factory.
    ///
    /// Included for convenience to avoid a copyWith if it needs to be changed.
    ///
    /// Default value deviates from the Flutter standard that uses the old
    /// [Typography.material2014], in favor of newer [Typography.material2018]
    /// as default typography if one is not provided.
    ///
    /// Never mix different [Typography] in light and dark theme mode. If you
    /// do, lerp between dark and light theme mode will fail due Flutter SDK
    /// not being able to handle the use case. If you use a default light or
    /// dark Flutter ThemeData() and a FlexColorScheme.toTheme() ThemeData for
    /// the other one, you must set either the default ThemeData to
    /// [Typography.material2018] OR the [FlexColorScheme.typography] to
    /// [Typography.material2014] to avoid this issue. It is not generally
    /// recommended to create you light and dark theme mode data with
    /// different methods. If you use FlexColorScheme, DO use it for both the
    /// light and dark theme mode.
    Typography? typography,
  }) {
    return FlexColorScheme.light(
      colors: colors,
      scheme: scheme,
      surfaceStyle: surfaceStyle,
      usedColors: usedColors,
      appBarStyle: appBarStyle,
      tabBarStyle: tabBarStyle,
      appBarElevation: appBarElevation,
      bottomAppBarElevation: bottomAppBarElevation,
      surface: surface,
      background: background,
      scaffoldBackground: scaffoldBackground,
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
    ).toTheme;
  }

  /// Return a ThemeData defined by factory FlexColorScheme().dark object and
  /// its toTheme method.
  static ThemeData dark({
    /// The [FlexSchemeColor] that we will create the dark [FlexColorScheme]
    /// from.
    ///
    /// You can use predefined [FlexSchemeColor] values from
    /// [FlexColor.schemes] map or define your own colors with
    /// [FlexSchemeColor] or [FlexSchemeColor.from].
    ///
    /// For using built-in color schemes, the convenience shortcut to select
    /// it with the `scheme` property is recommended and leaving `colors`
    /// undefined. If both are specified the scheme colors defined by `colors`
    /// are used. If both are null then `scheme` defaults to
    /// [FlexScheme.material], thus defining the resulting scheme.
    FlexSchemeColor? colors,

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
    FlexScheme? scheme,

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
    /// If values for surface, background or scaffoldBackground are
    /// provided, they are used instead of values that would be assigned based
    /// on the selected and provided [FlexSurface] style.
    FlexSurface surfaceStyle = FlexSurface.material,

    /// The app bar background theme style.
    ///
    /// Defaults to [FlexAppBarStyle.material] which produces the same results
    /// as a Flutter standard dark [ThemeData.from] by tying the app bar color
    /// to the surface color.
    FlexAppBarStyle appBarStyle = FlexAppBarStyle.material,

    /// Select preferred style for the default TabBarTheme.
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
    FlexTabBarStyle tabBarStyle = FlexTabBarStyle.forAppBar,

    /// The themed elevation for the app bar.
    ///
    /// Default to 0. The 0 elevation is an iOs style
    /// influenced opinionated choice, but it can easily be adjusted for the
    /// theme with this property.
    double appBarElevation = 0,

    /// The themed elevation for the bottom app bar.
    ///
    /// If null, defaults to the value given to the `appBarElevation` elevation.
    double? bottomAppBarElevation,

    /// The background color for widgets like Card, BottomAppBar and dialogs.
    ///
    /// If null, the color is determined by [FlexSurface] `surfaceStyle`.
    Color? surface,

    /// A color that typically appears behind scrollable content.
    ///
    /// The color is applied to ThemeData `canvasColor` and`backgroundColor`,
    /// it is used eg in menu drawer.
    ///
    /// If null, the color is determined by [FlexSurface] `surfaceStyle`.
    Color? background,

    /// The color of the scaffold background.
    ///
    /// If null the color is defined by [FlexSurface] `surfaceStyle`.
    Color? scaffoldBackground,

    /// A color that is clearly legible when drawn on primary color.
    ///
    /// If null, the on color is derived from the brightness of the primary
    /// color, and will be be black if it is light and white if it is dark.
    Color? onPrimary,

    /// A color that is clearly legible when drawn on secondary color.
    ///
    /// If null, the on color is derived from the brightness of the secondary
    /// color, and will be be black if it is light and white if it is dark.
    Color? onSecondary,

    /// A color that is clearly legible when drawn on surface color.
    ///
    /// If null, the on color is derived from the brightness of the surface
    /// color, and will be be black if it is light and white if it is dark.
    Color? onSurface,

    /// A color that is clearly legible when drawn on background color, it is
    /// also used as on color for scaffoldBackground.
    ///
    /// If null, the on color is derived from the brightness of the background
    /// color, and will be be black if it is light and white if it is dark.
    Color? onBackground,

    /// A color that is clearly legible when drawn on error.
    ///
    /// If null, the on color is derived from the brightness of the error
    /// color, and will be be black if it is light and white if it is dark.
    Color? onError,

    /// Makes the dark theme even darker.
    ///
    /// Mostly surfaces will become fully black, but surfaces may in
    /// primary blend modes still use a hint of surface color for a slight
    /// off black mode when primary blended surface are used.
    bool darkIsTrueBlack = false,

    /// If true, this will swap primary and variant colors with their
    /// secondary counter parts.
    ///
    /// This flag can be set to true, if you want to make a theme where
    /// your primary and secondary colors are swapped.
    ///
    /// This feature is useful if you want to do this with the pre-defined
    /// schemes or with computed dark themes from light theme. If you are
    /// explicitly defining all your theme colors you can of course define
    /// them as desired. Even if you do that, this feature will still swap
    /// whatever colors you defined for primary and secondary. You can offer
    /// this feature as an easy end user modifiable theme option.
    bool swapColors = false,

    /// Tooltips background color will match the brightness of the theme's
    /// background color.
    ///
    /// By default Flutter's Material tooltips uses a theme where the tooltip
    /// background color brightness is inverted in relation to the overall
    /// theme's background color. FlexColorScheme allows you to use a single
    /// toggle to invert this. Light tooltips on light background is e.g. the
    /// default style on Windows Desktop. You can use this toggle to use this
    /// style, or as a means to create a platform adaptive
    /// tooltip style, where the Material/Flutter style is used on devices and
    /// Web, but the inverted scheme would be used on desktop platforms.
    ///
    /// Defaults to false, uses same background style as Material and Flutter.
    bool tooltipsMatchBackground = false,

    /// When set to `true`, it makes the status bar on Android the same color as
    /// the rest of the AppBar. Defaults to true.
    ///
    /// When true, the AppBar in Android mimics the look of one-toned AppBar's
    /// typically used on iOS. Set to `false`, to revert back and use
    /// Android's default two-toned look. If true the status bar area is
    /// actually also transparent so that if the app bar is also translucent,
    /// content that scrolls behind it, is also visible behind the status
    /// bar area.
    ///
    /// You may need to fully restart the app and even rebuild for changes to
    /// this setting to take effect on Android devices and emulators.
    bool transparentStatusBar = true,

    /// Same property as in [ThemeData] factory, it is just passed along to it.
    ///
    /// Included for convenience to avoid a copyWith if it needs to be changed.
    VisualDensity? visualDensity,

    /// Text with a color that contrasts with the card and canvas colors.
    TextTheme? textTheme,

    /// A text theme that contrasts with the primary color.
    TextTheme? primaryTextTheme,

    /// Same property as in [ThemeData] factory, it is just passed along to it.
    ///
    /// Included for convenience to avoid a copyWith if it needs to be changed.
    String? fontFamily,

    /// Same property as in [ThemeData] factory, it is just passed along to it.
    ///
    /// Included for convenience to avoid a copyWith if it needs to be changed.
    /// Defaults to defaultTargetPlatform.
    TargetPlatform? platform,

    /// Same property as in [ThemeData] factory.
    ///
    /// Included for convenience to avoid a copyWith if it needs to be changed.
    /// Default value deviates from the Flutter standard that uses the old
    /// [Typography.material2014], in favor of newer [Typography.material2018]
    /// as default typography if one is not provided.
    ///
    /// Never mix different [Typography] in light and dark theme mode. If you
    /// do, lerp between dark and light theme mode will fail due Flutter SDK
    /// not being able to handle the use case. If you use a default light or
    /// dark Flutter ThemeData() and a FlexColorScheme.toTheme() ThemeData for
    /// the other one, you must set either the default ThemeData to
    /// [Typography.material2018] OR the [FlexColorScheme.typography] to
    /// [Typography.material2014] to avoid this issue. It is not generally
    /// recommended to create you light and dark theme mode data with
    /// different methods. If you use FlexColorScheme, DO use it for both the
    /// light and dark theme mode.
    Typography? typography,
  }) {
    return FlexColorScheme.dark(
      colors: colors,
      scheme: scheme,
      usedColors: usedColors,
      surfaceStyle: surfaceStyle,
      appBarStyle: appBarStyle,
      tabBarStyle: tabBarStyle,
      appBarElevation: appBarElevation,
      bottomAppBarElevation: bottomAppBarElevation,
      surface: surface,
      background: background,
      scaffoldBackground: scaffoldBackground,
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

    /// The background color for widgets like Card, BottomAppBar and Dialogs.
    ///
    /// If no value is given defaults to FlexColor.materialLightSurface if
    /// brightness is light and to FlexColor.materialDarkSurface if
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

    /// The color to use for input validation errors, e.g. for
    /// InputDecoration.errorText.
    ///
    /// If no value is given defaults to FlexColor.materialLightError if
    /// brightness is light and to FlexColor.materialDarkError if brightness
    /// is dark.
    final Color? error,

    /// The color of the scaffold background.
    ///
    /// This color cannot be controlled separately with Flutter's standard
    /// ColorScheme. FlexColorScheme brings back the possibility to specify
    /// it separately.
    ///
    /// If no color is given, it defaults to background.
    final Color? scaffoldBackground,

    /// Background color theme for the app bar.
    ///
    /// This color cannot be controlled separately with Flutter's standard
    /// ColorScheme class. FlexColorScheme enables you to specify an app bar
    /// color that is independent of the primary color in light theme and of
    /// dark theme's dark surface colored app bar.
    ///
    /// If no color is given it defaults to the Flutter standard color scheme
    /// based light and dark app bar theme colors.
    final Color? appBarBackground,

    /// A color that is clearly legible when drawn on primary.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// [primary] and [onPrimary] is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// If null, the on color is derived from the brightness of the [primary]
    /// color, and will be be black if it is light and white if it is dark.
    final Color? onPrimary,

    /// A color that is clearly legible when drawn on secondary.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// [secondary] and [onSecondary] is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// If null, the on color is derived from the brightness of the [secondary]
    /// color, and will be be black if it is light and white if it is dark.
    final Color? onSecondary,

    /// A color that is clearly legible when drawn on surface.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// [surface] and [onSurface] is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// If null, the on color is derived from the brightness of the [surface]
    /// color, and will be be black if it is light and white if it is dark.
    final Color? onSurface,

    /// A color that is clearly legible when drawn on background.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for
    /// background and onBackground is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// If null, the on color is derived from the brightness of the [background]
    /// color, and will be be black if it is light and white if it is dark.
    final Color? onBackground,

    /// A color that is clearly legible when drawn on error.
    ///
    /// To ensure that an app is accessible, a contrast ratio of 4.5:1 for error
    /// and onError is recommended. See
    /// <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.
    ///
    /// If null, the on color is derived from the brightness of the [error]
    /// color, and will be be black if it is light and white if it is dark.
    final Color? onError,

    /// Select preferred style for the default TabBarTheme.
    ///
    /// By default the TabBarTheme is made to fit with the style of the AppBar,
    /// via default value FlexTabBarStyle.forAppBar.
    ///
    /// When setting this to FlexTabBarStyle.forBackground, it will default
    /// to a theme that uses the color scheme and fits on background color,
    /// which typically also on works surface and scaffoldBackground color.
    /// This TabBarTheme style is useful if you primarily intended to use the
    /// TabBar in a Scaffold, Dialog, Drawer or Side panel on their background
    /// colors.
    final FlexTabBarStyle tabBarStyle = FlexTabBarStyle.forAppBar,

    /// The themed elevation for the app bar.
    ///
    /// Defaults to 0, cannot be null. The 0 elevation is an iOs style
    /// influenced opinionated choice, but it can easily be adjusted for the
    /// theme with this property.
    final double appBarElevation = 0,

    /// The themed elevation for the bottom app bar.
    ///
    /// Defaults to 0, cannot be null. The 0 default is so it matches the themed
    /// app bar elevation default, but it can easily be adjusted for the
    /// theme with this property.
    final double bottomAppBarElevation = 0,

    /// Tooltips background color will match the brightness of the theme's
    /// background color.
    ///
    /// By default Flutter's Material tooltips uses a theme where the tooltip
    /// background color brightness is inverted in relation to the overall
    /// theme's background color. FlexColorScheme allows you to use a single
    /// toggle to invert this. Light tooltips on light background is e.g. the
    /// default style on Windows Desktop. You can use this toggle to use this
    /// style, or as a means to create a platform adaptive
    /// tooltip style, where the Material/Flutter style is used on devices and
    /// Web, but the inverted scheme would be used on desktop platforms.
    ///
    /// Defaults to false, uses same background style as Material and Flutter.
    final bool tooltipsMatchBackground = false,

    /// When set to `true`, it makes the status bar on Android the same color as
    /// the rest of the AppBar. Defaults to true.
    ///
    /// When true, the AppBar in Android mimics the look of one-toned AppBar's
    /// typically used on iOS. Set to `false` to revert back and use
    /// Android's default two-toned look. If true the status bar area is
    /// actually also transparent, then if the app bar is also translucent,
    /// content that scrolls behind it is also visible behind the status
    /// bar area.
    ///
    /// You may need to fully restart the app and even rebuild for changes to
    /// this setting to take effect on Android devices and emulators.
    final bool transparentStatusBar = true,

    /// The density value for specifying the compactness of various UI
    /// components.
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
    /// inclusive, where
    /// negative values indicate a denser, more compact, UI, and positive values
    /// indicate a less dense, more expanded, UI. If a component doesn't support
    /// the value given, it will clamp to the nearest supported value.
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
    final VisualDensity? visualDensity,

    /// Text with a color that contrasts with the card and canvas colors.
    TextTheme? textTheme,

    /// A text theme that contrasts with the primary color.
    TextTheme? primaryTextTheme,

    /// Name of the font family to use as default for the theme.
    final String? fontFamily,

    /// The platform adaptive widgets should adapt to target and mechanics too.
    ///
    /// Defaults to the current platform, as exposed by defaultTargetPlatform.
    /// This should be used in order to style UI elements according to platform
    /// conventions.
    ///
    /// Widgets from the material library should use this getter (via Theme.of)
    /// to determine the current platform for the purpose of emulating the
    /// platform behavior (e.g. scrolling or haptic effects). Widgets and render
    /// objects at lower layers that try to emulate the underlying platform
    /// platform can depend on [defaultTargetPlatform] directly, or may require
    /// that the target platform be provided as an argument. The
    /// dart.io.Platform object should only be used directly when it's critical
    /// to actually know the current platform, without any overrides possible,
    /// for example, when a system API is about to be called.
    ///
    /// In a test environment, the platform returned is TargetPlatform.android
    /// regardless of the host platform. Android was chosen because the tests
    /// were originally written assuming Android-like behavior, and we added
    /// platform adaptations for other platforms later. Tests can check behavior
    /// for other platforms by setting the [platform] of the Theme explicitly to
    /// another TargetPlatform value, or by setting
    /// debugDefaultTargetPlatformOverride.
    final TargetPlatform? platform,

    /// The color and geometry TextTheme values used to configure
    /// ThemeData.textTheme and ThemeData.primaryTextTheme.
    ///
    /// Used default value deviates from the Flutter standard, that uses the old
    /// Typography.material2014. Here we use the newer Typography.material2018
    /// as default typography if one is not provided.
    ///
    /// Never mix different Typography in light and dark theme mode. If you
    /// do, lerp between dark and light theme mode will fail due Flutter SDK
    /// not being able to handle the use case. If you use a default light or
    /// dark Flutter ThemeData and a FlexColorScheme.toTheme() ThemeData for the
    /// other one, you must set either the default ThemeData to
    /// Typography.material2018 OR the FlexColorScheme.typography to
    /// Typography.material2014 to avoid this issue. It is not generally
    /// recommended to create you light and dark theme mode data with
    /// different methods. If you use FlexColorScheme, DO use it for both the
    /// light and dark theme mode.
    final Typography? typography,
  }) {
    return FlexColorScheme(
      brightness: brightness,
      primary: primary,
      primaryVariant: primaryVariant,
      secondary: secondary,
      secondaryVariant: secondaryVariant,
      surface: surface,
      background: background,
      error: error,
      scaffoldBackground: scaffoldBackground,
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
    ).toTheme;
  }
}
