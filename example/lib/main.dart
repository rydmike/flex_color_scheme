import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'shared/const/app.dart';
import 'shared/widgets/app/responsive_scaffold.dart';
import 'shared/widgets/app/show_color_scheme_colors.dart';
import 'shared/widgets/app/show_sub_pages.dart';
import 'shared/widgets/app/show_sub_theme_colors.dart';
import 'shared/widgets/app/show_theme_data_colors.dart';
import 'shared/widgets/universal/page_body.dart';
import 'shared/widgets/universal/showcase_material.dart';
import 'shared/widgets/universal/theme_mode_switch.dart';

/// DEFAULT EXAMPLE - Hot Reload Playground
///
/// This example shows how you can define custom colors, use [FlexColorScheme]
/// to theme your app with them, or use a predefined theme.
///
/// It offers a playground you can use to experiment with all its
/// theming properties and optional opinionated sub-theming.
///
/// It also demonstrates how to use a [GoogleFonts] based font as the default
/// font for your app theme, and how to customize the used [TextTheme].
///
/// To learn more about how to use [FlexColorScheme] and all its features,
/// please go through the five tutorial examples in the readme documentation.
void main() => runApp(const DemoApp());

// This default example contains a long list of const and final property values
// that are just passed in to the corresponding properties in
// FlexThemeData.light() and FlexThemeData.dark() convenience extension on
// ThemeData to FlexColorScheme.light().toTheme and
// FlexColorScheme.dark().toTheme.
//
// The purpose is to provide an easy to use in-code based playground that
// you can experiment with and use as a quick starter template to start using
// FlexColorScheme to make beautiful Flutter themes for your applications.
// It is also a code and comment based quick guide for developers that
// don't read long documentation.
//
// This setup is convenient since you can edit the values for both the light
// and dark theme mode via shared property values and observe the changes
// in the built app using hot reload.
//
// In a real app you might tuck away your color definitions and FlexColorScheme
// settings in a static class with const and final values, and static functions
// as required. The other tutorials show examples of this as well.
//
// To learn more about using FlexColorScheme, it is recommended to go through
// the step-by-step tutorial that uses examples 1 to 5 that explain and
// demonstrate the features with increasing complexity. Example 5 represents
// the full bonanza where pretty much everything can be changed dynamically
// while running the app. It doubles as the web online Themes Playground app
// that can also generate FlexColorScheme setup code for the theme you have
// configured. Using it and studying the setup code it generates is another
// quick way to learn about the different APIs and features it provides.

// For our custom color scheme we define primary and secondary colors,
// but no container or other colors.
final FlexSchemeColor _schemeLight = FlexSchemeColor.from(
  primary: const Color(0xFF00296B),
  // If you do not want to define secondary, primaryVariant and
  // secondaryVariant, error and appBar colors you do not have to,
  // they will get defined automatically when using the FlexSchemeColor.from()
  // factory. When using FlexSchemeColor.from() you only have to define the
  // primary color, anything not defined will get derived automatically from
  // the primary color and you get a theme that is based just on shades of
  // the provided primary color.
  //
  // With the default constructor FlexSchemeColor() you have to define
  // all 4 main color properties required for a complete color scheme. If you
  // do define them all, then prefer using it, since it can be const.
  //
  // Here we define a secondary color, but if you don't it will get a
  // default shade based on the primary color. When you do define a secondary
  // color, but not a secondaryVariant color, the secondary container will get
  // derived from the secondary color, instead of from the primary color.
  secondary: const Color(0xFFFF7B00),
  // New in version 5.
  // Specifying a brightness value computes missing colors based on given colors
  // using a strategy that is compatible with Material3 based ColorScheme
  // introduced in Flutter SDK in version 2.10.0. If you don't specify a
  // brightness value, you still get all needed colors computed, but the used
  // strategy for missing colors is more inline with the usage as it was
  // in Material 2 design. The new M3 colors primary.container and
  // secondary.container receives the color values that would have been given to
  // deprecated colors primary.variant and secondary.variant, the color values
  // are OK for using them as variant colors in an M2 based app, but the values
  // are not ideal for an M3 design. For better M3 results, prefer giving also
  // the brightness you are targeting.
  brightness: Brightness.light,
);

// These are custom defined matching dark mode colors. Further below we show
// how to compute them based on the light color scheme. You can swap them in the
// code example further below and compare the result of these manually defined
// matching dark mode colors, to the ones computed via the "lazy" designer
// matching dark colors.
final FlexSchemeColor _schemeDark = FlexSchemeColor.from(
  primary: const Color(0xFF6B8BC3),
  secondary: const Color(0xffff7155),
  brightness: Brightness.dark,
);

// To use a pre-defined color scheme, don't assign any FlexSchemeColor to
// `colors` instead, just pick a FlexScheme enum based value and assign it
// to the `scheme`. Try eg the new "flutterDash" color scheme, based on colors
// found in the 4k wallpaper Google shared before the Flutter 2.10.0 release.
const FlexScheme _scheme = FlexScheme.flutterDash;

// To make it easy to toggle between using the above custom colors, or the
// selected predefined scheme in this example, set _useScheme to true to use the
// selected predefined scheme above, set it to false to use the custom colors
// defined earlier above.
const bool _useScheme = true;

// A quick setting for the themed app bar elevation, it defaults to 0.
// A very low, like 0.5 is pretty nice too, since it gives an underline effect
// visible with e.g. white or light colored app bars.
const double _appBarElevation = 0.5;

// There is setting to put an opacity value on the app bar. If used, we can see
// content scroll behind it, if we also extend the Scaffold behind the AppBar.
const double _appBarOpacity = 0.94;

// If you set _computeDarkTheme below to true, the dark scheme will be computed
// both for the selected scheme and the custom colors, from the light scheme.
// There is a bit of logic hoops below to make it happen via this bool toggle.
//
// Going "toDark()" on your light FlexSchemeColor definition is just a quick
// way you can make a dark scheme from a light color scheme definition, without
// figuring out usable color values yourself. This is useful during development,
// when you test custom colors. For production and final colors you probably
// want to fine tune your custom dark color scheme colors and use const values.
const bool _computeDarkTheme = false;

// When you use _computeDarkTheme, use this de-saturation % level to calculate
// the dark scheme from the light scheme colors. The default is 35%, but values
// from 20% might work on less saturated light scheme colors. For more
// deep and colorful starting values, you can try 40%. Trivia: The default
// red dark error color in the Material design guide, is computed from the light
// theme error color value, by using 40% with the same algorithm used here.
const int _toDarkLevel = 30;

// To swap primary and secondary colors, set to true. With some color schemes
// interesting and even useful inverted primary-secondary themes can be obtained
// by only swapping the colors on your dark scheme. Some schemes where even
// designed with this usage in mind, but not all look so well when using it.
const bool _swapColors = false;

// The `usedColors` is a convenience property that allows you to vary which
// colors to use of the primary, secondary and variant colors included in
// `colors` in `FlexSchemeColor`, or the `FlexSchemeColor` the enum based
// selection specifies. The integer number corresponds to using:
//
// * 1 = Only the primary color
// * 2 = Primary & Secondary colors
// * 3 = Primary + container & Secondary colors
// * 4 = Primary + container & Secondary + container
// * 5 = Primary + container & Secondary + container & tertiary colors
// * 6 = Primary + container & Secondary + container & tertiary + container
// * 7 = PST, Primary, Secondary and Tertiary, containers computed.
//
// This can be a quick way to try what you theme looks like when using less
// source colors and just different shades of the same color, that are still
// correctly tuned for their ColorScheme color values.
//
// The values default to 6, so that any color values that are defined are always
// used as defined and given.
const int _usedColors = 6;

// New in version 5: Key color seed based theming.
//
// If you want to use Material 3 based seed generated color schemes, using
// the current FlexColorScheme's colors as input to the seed generation. You
// can do so by passing in just a default `FlexKeyColors()` object to the
// `keyColors` property in FlexColorScheme.light and .dark factories.
//
// FlexKeyColors can be also configured, if its `useKeyColors` is false it is
// no being used, likewise it is not if the property `keyColors` is null.
//
// The default constructor `FlexKeyColors()` has the properties `useKeyColors`,
// `useSecondary` and `useTertiary` defaulting to true. This means the primary,
// secondary and tertiary colors from your active FlexColorScheme's colors will
// all be used as key colors to generate the theme's ColorScheme.
//
// The primary color is always using useKeyColors is true, but using secondary
// and tertiary colors to generate the ColorScheme are optional.
// They are on by default in the default constructor, to omit them set any
// of them to false.
//
// Flutter SDK `ColorScheme.fromSeed` only accepts a/ single color,
// the main/primary color as a seed color for the Material 3 ColorScheme
// it generates from a seed color. If you set both `useSecondary`
// and `useTertiary` to false, the result is the same as if you would have
// provided the current primary color value from the active FlexColorScheme
// to `ColorScheme.fromSeed` to generate the theme used `ColorScheme`.
// When you also use secondary and tertiary colors as input to generate the
// ColorScheme, their color values are based on them, instead of being sourced
// in fixed manner from the single primary color. This makes the generated
// ColorScheme follow the colors in your specified keys to a larger degree
// than Flutter SDK `ColorScheme.fromSeed` does.
//
// When you use seeded ColorSchemes, the key color used as seed color as primary
// color, secondary and tertiary usually do not end up in the resulting
// ColorScheme. This can be problematic when your spec calls for a specific
// specific e.g. brand color for certain color properties.
//
// With FlexColorscheme you can, for e.g. branding or other purposes, decide to
// keep one or more of the defined color values in your FlexColorScheme at its
// defined color value, despite otherwise using seeded color values to produce
// the resulting `ColorScheme`from them. There is a `keep` toggle in
// `FlexKeyColors` for all the six main colors in a `ColorScheme`, you can
// set any of them to true, to keep the color in question it has as input
// in your FlexColorScheme.
const FlexKeyColors _keyColors = FlexKeyColors(
  useKeyColors: false, // <-- set to true enable M3 seeded ColorScheme.
  useSecondary: true,
  useTertiary: true,
  keepPrimary: false, // <-- Keep defined value, do not use the seeded result.
  keepPrimaryContainer: false,
  keepSecondary: false,
  keepSecondaryContainer: false,
  keepTertiary: false,
  keepTertiaryContainer: false,
);

// New in version 5: Custom configuration for seed color calculations.
//
// Not only does FlexColorScheme enable using more than one seed color, you
// can also completely customize the tone mapping and CAM16 chroma limits
// imposed on used seed generation algorithm.
//
// When using Material 3 design and key colors, it generates 6 different tonal
// palettes `TonalPalette` for the colors in a M3 ColorScheme:
//
// * Primary tonal palette
// * Secondary tonal palette
// * Tertiary tonal palette
// * Error tonal palette
// * Neutral tonal palette
// * Neutral variant tonal palette
//
// Each palette contains 13 colors starting from black and ending in white, with
// different "tones" in-between of the color used for the palette.
// ColorScheme.from generates all the palettes from a single input color, and
// a hard coded value for the error palettes. FlexColorScheme allows you to as
// seen also specify the input colors for secondary and tertiary tonal palette.
// The neutral palettes are also generated from the input primary color, but
// with very little chroma of it left it, a bit more in the variant palette.
// this is a bit like the surface alpha blend that FlexColorScheme has
// been using since its first version.
//
// The algorithm used by ColorScheme.from also lock chroma for secondary and
// tertiary to a given value, and primary is min 48, after tha it uses
// chroma from the provided color. When tonal palettes have been created, it
// uses fixed tones (indexes) from relevant tonal palette and assigns them
// to given color properties in the ColorScheme. It is also worth noticing
// to you should use the same key color for both dark and light theme mode.
// the algorithm uses the same tonal palette for light and dark modes, but
// different tones from same palette.
//
// FlexColorScheme opens up this algorithm and logic and enables you to
// modify the color seed logic and behavior. The used algorithm is really
// fascinating, and the M3 usage of it is fine too. But maybe you want to it
// produce colors that are even more earthy and softer than M3, that is pretty
// soft already. Maybe your want more vivid tones, more in classic M2 style, or
// perhaps you need to seed schemes with much higher contrast for accessibility
// reasons. With FlexColorScheme you can. You do this by making a custom
// FlexTones data class to configure how the seeding engine maps palette colors
// the ColorScheme and how it uses chroma values in the key colors.
//
// The `FlexTones` has a `FlexTones.light` and `FlexTones.dark` factory, that
// are used for respective theme mode when using key colors in FlexColorScheme
// by default.
//
// The `FlexTones.light` factory by default provides the same chroma limits and
// tone mappings as used by:
// `ColorScheme.fromSeed(seedColor: color, brightness: Brightness.light)`
//
// Likewise the `FlexTones.dark` corresponds to same chroma limits and tone
// mappings as used by:
// `ColorScheme.fromSeed(seedColor: color, brightness: Brightness.dark)`.
//
// However, with the factories you can customize which tone each ColorScheme
// color properties uses as its color from its corresponding tonal palette.
// You can also change if primary, secondary and tertiary colors use the
// chroma in their key color value, if it should have a at least a given
// minimum chroma value, and after that use the key color's chroma value,
// or if it should be locked to a given chroma value.
//
// There is also a static that returns a default FlexTones.light and
// FlexTones.dark, when you pass it a brightness, called FlexTones.material,
// to indicate that it is using the default Material 3 specification.
//
// There are few more pre-made static configurations, for example:
//
// * FlexTones.soft
// * FlexTones.vivid
// * FlexTones.highContrast
//
// You can swap in them in below to try slightly different styles on generated
// seeded ColorScheme. The `FlexTones.vivid` for example, keeps the chroma as is
// in key colors for secondary and tertiary, and will thus produce a seeded
// ColorScheme that is closer to the provided key/seed colors, than the Flutter
// SDK M3 spec version does.
final FlexTones _flexTonesLight = FlexTones.material(Brightness.light);
final FlexTones _flexTonesDark = FlexTones.material(Brightness.dark);

// Use a GoogleFonts font as default font for your theme.
final String? _fontFamily = GoogleFonts.notoSans().fontFamily;

// Define a custom text theme for the app. Here we have decided that
// display fonts are too big to be useful for us, so we make them a bit smaller
// and that labelSmall is a bit too small and has weird letter spacing, so we
// make it bigger and change its letter spacing.
const TextTheme _textTheme = TextTheme(
  displayMedium: TextStyle(fontSize: 41),
  displaySmall: TextStyle(fontSize: 36),
  labelSmall: TextStyle(fontSize: 11, letterSpacing: 0.5),
);

// FlexColorScheme before version 4 used a `surfaceStyle` property to
// define the surface color blend mode. Version 4, deprecated `surfaceStyle`
// and introduced `surfaceMode` and `blendLevel`. In version 5 the old
// `surfaceStyle` has been removed, thus in version 5 you have to change to
// using `surfaceMode` and `blendLevel` if you have not done so already.
//
// The `surfaceMode` takes `FlexSurfaceMode` that is used to select the used
// strategy for blending primary color into different surface colors.
const FlexSurfaceMode _surfaceMode = FlexSurfaceMode.highBackgroundLowScaffold;

// The alpha blend level strength can be defined separately from the
// SurfaceMode strategy, and has 40 alpha blend level strengths.
const int _blendLevel = 20;

// The `useSubThemes` sets weather you want to opt-in or not on additional
// opinionated sub-theming. By default FlexColorScheme as before does very
// little styling on widgets, other than a few important adjustments, described
// in detail in the readme. By using the sub-theme opt-in, it now also offers
// easy to use additional out-of the box opinionated styling of SDK UI Widgets.
// One key feature is the rounded corners on Widgets that support it.
const bool _useSubThemes = true;

// The opt-in opinionated sub-theming offers easy to use consistent corner
// radius rounding setting on all sub-themes and a ToggleButtons design that
// matches the normal buttons style and size.
// It comes with Material 3 like rounded defaults, but you can adjust
// its configuration via simple parameters in a passed in configuration class
// called FlexSubThemesData.
//
// Here are some some configuration examples:
const FlexSubThemesData _subThemesData = FlexSubThemesData(
  // Opt in for themed hover, focus, highlight and splash effects.
  // New buttons use primary themed effects by default, this setting makes
  // the general ThemeData hover, focus, highlight and splash match that.
  // True by default when opting in on sub themes, but you can turn it off.
  interactionEffects: true,

  // When it is null = undefined, the sub themes will use their default style
  // behavior that aims to follow new Material 3 (M3) standard for all widget
  // corner radius. Current Flutter SDK corner radius is 4, as defined by
  // the Material 2 design guide. M3 uses much higher corner radius, and it
  // varies by widget type.
  //
  // When you set [defaultRadius] to a value, it will override these defaults
  // with this global default. You can still set and lock each individual
  // border radius back for these widget sub themes to some specific value, or
  // to its Material3 standard, which is mentioned in each theme as the used
  // default when its value is null.
  //
  // Set global corner radius. Default is null, resulting in M3 styles, but make
  // it whatever you like, even 0 for a hip to be square style.
  defaultRadius: null,
  // You can also override individual corner radius for each sub-theme to make
  // it different from the global `cornerRadius`. Here eg. the bottom sheet
  // radius is defined to always be 24:
  bottomSheetRadius: 24,

  // Use the Material3 text theme and typography. Defaults to null.
  // When null, the correct M2/M3 TextTheme and Typography for respective mode
  // is used. If true, M3 style is enforced, if false, M2 mode is enforced.
  useTextTheme: true,

  // Select input decorator type, only SDK options outline and underline
  // supported no, but custom ones may be added later.
  inputDecoratorBorderType: FlexInputBorderType.outline,
  // For a primary color tinted background on the input decorator set to true.
  inputDecoratorIsFilled: true,
  // If you do not want any underline/outline on the input decorator when it is
  // not in focus, then set this to false.
  inputDecoratorUnfocusedHasBorder: false,
  // Select the ColorScheme color used for input decoration border.
  // Primary is default so no need to set that, used here as placeholder to
  // enable easy selection of other options.
  inputDecoratorSchemeColor: SchemeColor.primary,
  // Set some alpha channel opacity value input decorator.
  inputDecoratorBackgroundAlpha: 20,

  // Some FAB (Floating Action Button) settings.
  //
  // // If fabUseShape is false, no shape will be added to FAB theme, it will get
  // // whatever default shape the widget default behavior applies.
  // //
  // fabUseShape: false,
  // //
  // // Select the ColorScheme color used by FABs as their base/background color
  // // Secondary is default so no need to set that, used here as placeholder to
  // // enable easy selection of other options.
  // //
  // fabSchemeColor: SchemeColor.secondaryContainer,

  // Select the ColorScheme color used by Chips as their base color
  // Primary is default so no need to set that, used here as placeholder to
  // enable easy selection of other options.
  chipSchemeColor: SchemeColor.primary,

  // Elevations have easy override values as well.
  elevatedButtonElevation: 1,
  // Widgets that use outline borders can be easily adjusted via these
  // properties, they affect the outline input decorator, outlined button and
  // toggle buttons.
  thickBorderWidth: 1.5, // Default is 2.0.
  thinBorderWidth: 1, // Default is 1.0.

  // Select the ColorScheme color used for selected TabBar indicator.
  // Defaults to same color as selected tab if not defined.
  // tabBarIndicatorSchemeColor: SchemeColor.secondary,

  // Select the ColorScheme color used for selected bottom navigation bar item.
  // Primary is default so no need to set that, used here as placeholder to
  // enable easy selection of other options.
  bottomNavigationBarSelectedLabelSchemeColor: SchemeColor.primary,

  // Select the ColorScheme color used for bottom navigation bar background.
  // Background is default so no need to set that, provided here as placeholder
  // to enable easy selection of other options.
  bottomNavigationBarBackgroundSchemeColor: SchemeColor.background,

  // Below are some example quick override properties that you can use on the
  // M3 based NavigationBar. The section is double commented out, so it its
  // easy to uncomment to try them all.
  //
  // // SchemeColor based color for [NavigationBar]'s selected item icon.
  // // navigationBarSelectedIconSchemeColor: SchemeColor.tertiary,
  // // SchemeColor based color for [NavigationBar]'s selected item label.
  // navigationBarSelectedLabelSchemeColor: SchemeColor.tertiary,
  // // SchemeColor based color for [NavigationBar]'s unselected item icons.
  // navigationBarUnselectedIconSchemeColor: SchemeColor.onSurface,
  // // SchemeColor based color for [NavigationBar]'s unselected item icons.
  // navigationBarUnselectedLabelSchemeColor: SchemeColor.onSurface,
  // // SchemeColor based color for [NavigationBar]'s selected item highlight.
  // navigationBarIndicatorSchemeColor: SchemeColor.tertiaryContainer,
  // // If you use suitable M3 designed container color for the indicator, it
  // // does not need any opacity.
  // navigationBarIndicatorOpacity: 1,
  // // Select the ColorScheme color used for [NavigationBar]'s background.
  // navigationBarBackgroundSchemeColor: SchemeColor.background,
  // // When set to true [NavigationBar] unselected icons use a more muted
  // // version of color defined by [navigationBarUnselectedIconSchemeColor].
  // navigationBarMutedUnselectedIcon: true,
  // // When set to true [NavigationBar] unselected labels use a more muted
  // // version of color defined by [navigationBarUnselectedLabelSchemeColor].
  // navigationBarMutedUnselectedLabel: true,
  // // Set size of labels.
  // navigationBarSelectedLabelSize: 12,
  // navigationBarUnselectedLabelSize: 10,
  // // Set the size of icons icons.
  // navigationBarSelectedIconSize: 26,
  // navigationBarUnselectedIconSize: 22,
);

// If true, the top part of the Android AppBar has no scrim, it then becomes
// one colored like on iOS.
const bool _transparentStatusBar = true;

// Usually the TabBar is used in an AppBar. This style themes it right for
// that, regardless of what FlexAppBarStyle you use for the `appBarStyle`.
// If you will use the TabBar on Scaffold or other background colors, then
// use the style FlexTabBarStyle.forBackground.
const FlexTabBarStyle _tabBarForAppBar = FlexTabBarStyle.forAppBar;

// If true, tooltip background brightness is same as background brightness.
// False by default, which is inverted background brightness compared to theme.
// Setting this to true is more Windows desktop like.
const bool _tooltipsMatchBackground = true;

// The visual density setting defaults to same as SDK default value,
// which is `VisualDensity.adaptivePlatformDensity`. You can define a fixed one
// or try `FlexColorScheme.comfortablePlatformDensity`.
// The `comfortablePlatformDensity` is an alternative adaptive density to the
// default `adaptivePlatformDensity`. It makes the density `comfortable` on
// desktops, instead of `compact` as the `adaptivePlatformDensity` does.
// This is useful on desktop with touch screens, since it keeps tap targets
// a bit larger but not as large as `standard` intended for phones and tablets.
final VisualDensity _visualDensity = FlexColorScheme.comfortablePlatformDensity;

// This is just standard `platform` property in `ThemeData`, handy to have as
// a direct property, you can use it to test how things changes on different
// platforms without using `copyWith` on the resulting theme data.
final TargetPlatform _platform = defaultTargetPlatform;

/// A theme Extension example with a single custom brand color property.
///
/// You can add as many colors and other theme properties as you need, and
/// you can add multiple different ThemeExtension sub classes as well.
class BrandTheme extends ThemeExtension<BrandTheme> {
  const BrandTheme({
    this.brandColor,
  });
  final Color? brandColor;

  // You must override the copyWith method.
  @override
  BrandTheme copyWith({
    Color? brandColor,
  }) =>
      BrandTheme(
        brandColor: brandColor ?? this.brandColor,
      );

  // You must override the lerp method.
  @override
  BrandTheme lerp(ThemeExtension<BrandTheme>? other, double t) {
    if (other is! BrandTheme) {
      return this;
    }
    return BrandTheme(
      brandColor: Color.lerp(brandColor, other.brandColor, t),
    );
  }
}

// Custom const theme with our brand color in light mode.
const BrandTheme lightBrandTheme = BrandTheme(
  brandColor: Color.fromARGB(255, 8, 79, 71),
);

// Custom const theme with our brand color in dark mode.
const BrandTheme darkBrandTheme = BrandTheme(
  brandColor: Color.fromARGB(255, 167, 227, 218),
);

class DemoApp extends StatefulWidget {
  const DemoApp({super.key});

  @override
  State<DemoApp> createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  ThemeMode themeMode = ThemeMode.system;
  bool useMaterial3 = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hot Reload Playground',
      // Define the light theme for the app, based on defined colors and
      // properties above.
      theme: FlexThemeData.light(
        // Use local state to toggle usage of Material 3.
        useMaterial3: useMaterial3,
        // Want to use a built in scheme? Don't assign any value to colors.
        // We just use the _useScheme bool toggle here from above, only for easy
        // switching via code params so you can try options handily.
        colors: _useScheme ? null : _schemeLight,
        scheme: _scheme,
        swapColors: _swapColors, // If true, swap primary and secondaries.
        usedColors: _usedColors,

        // For an optional white look set lightIsWhite to true.
        // This is the counterpart to darkIsTrueBlack mode in dark theme mode,
        // which is much more useful than this feature.
        lightIsWhite: false,

        // If you want to use an existing fully specified `ColorScheme` that
        // your designer or you yourself made, you can do so too. This is
        // useful e.g. if you want the use FlexColorScheme for its component
        // sub-theming with an existing `ColorScheme`. To use a`ColorScheme`
        // object as color sources for your `FlexColorscheme` just pass it to
        // the `colorScheme` property. The `surfaceMode` and `blendLevel` will
        // still adjust surface and background colors on surfaces in passed
        // `ColorScheme` if they are used. This can be demonstrated here with
        // the default Flutter M2 based light ColorScheme set, if uncommented
        // below.

        // colorScheme: const ColorScheme.light(),

        // If you provide a color value to a direct color property, the color
        // value will override anything specified via the other properties.
        // The order from lowest to highest color property priority, to
        // determine effective colors are:
        // 1. scheme 2. colors 3. colorScheme 4. individual color values.
        // Normally you would make a custom scheme using the colors property,
        // but if you want to override just one or two colors in a pre-existing
        // scheme, this can be handy way to do it.
        // Uncomment a color property below on the light theme to try it:

        // primary: FlexColor.indigo.light.primary,
        // primaryContainer: FlexColor.greenLightPrimaryContainer,
        // secondary: FlexColor.indigo.light.secondary,
        // secondaryContainer: FlexColor.indigo.light.secondaryContainer,
        // surface: FlexColor.lightSurface,
        // background: FlexColor.lightBackground,
        // error: FlexColor.materialLightErrorHc,
        // scaffoldBackground: FlexColor.lightScaffoldBackground,
        // dialogBackground: FlexColor.lightSurface,
        // appBarBackground: FlexColor.barossaLightPrimary,

        // The default style of AppBar in Flutter SDK light mode uses scheme
        // primary color as its background color. The appBarStyle
        // FlexAppBarStyle.primary, results in this too, and is the default in
        // light mode. You can also choose other themed styles. Like
        // FlexAppBarStyle.background, that gets active color blend from used
        // surfaceMode or surfaceStyle, depending on which one is being used.
        // You may often want a different style on the app bar in dark and
        // light theme mode, therefore it was not set via a shared value
        // above in this template.
        appBarStyle: null, // Try different style, e.g.FlexAppBarStyle.primary,
        appBarElevation: _appBarElevation,
        appBarOpacity: _appBarOpacity,
        transparentStatusBar: _transparentStatusBar,
        tabBarStyle: _tabBarForAppBar,
        surfaceMode: _surfaceMode,
        blendLevel: _blendLevel,
        tooltipsMatchBackground: _tooltipsMatchBackground,
        // You can try another font too.
        // Prefer using fully defined TextThemes when using fonts, rather than
        // just setting the fontFamily name, even with GoogleFonts. For
        // quick tests this is fine if the same font style is good
        // as is for all the styles in the TextTheme, then just the fontFamily
        // works well too.
        fontFamily: _fontFamily,
        textTheme: _textTheme,
        primaryTextTheme: _textTheme,
        keyColors: _keyColors,
        tones: _flexTonesLight,
        subThemesData: _useSubThemes ? _subThemesData : null,
        visualDensity: _visualDensity,
        platform: _platform,
        // Add all our custom theme extensions, in this case we only have one.
        extensions: <ThemeExtension<dynamic>>{
          lightBrandTheme,
        },
      ),

      // Define the corresponding dark theme for the app.
      darkTheme: FlexThemeData.dark(
        // Use local state to toggle usage of Material 3.
        useMaterial3: useMaterial3,
        // If you want to base the dark scheme on your light colors,
        // you can also compute it from the light theme's FlexSchemeColors.
        // Here you can do so by setting _computeDarkTheme above to true.
        // The FlexSchemeColors class has a toDark() method that can convert
        // a color scheme designed for a light theme, to corresponding colors
        // suitable for a dark theme. For the built in themes there is no
        // need to do so, they all have hand tuned dark scheme colors.
        // Regardless, below we anyway demonstrate how you can do that too.
        //
        // Normally you would not do things like this complicated logic, you
        // would just use the colors or scheme property based on what you want.
        // This logic is just here so you can toggle the two booleans earlier
        // above to try the options without commenting any code.
        colors: (_useScheme && _computeDarkTheme)
            // If we use predefined schemes and want to compute a dark
            // theme from its light colors, we can grab the light scheme colors
            // for _schemes from the FlexColor.schemes map and use toDark(),
            // that takes a white blend saturation %, where 0 is same colors as
            // the input light scheme colors, and 100% makes it white.
            ? FlexColor.schemes[_scheme]!.light.toDark(_toDarkLevel)
            // If we use a predefined scheme, then pass, null so we get
            // selected _scheme via the scheme property.
            : _useScheme
                ? null
                // If we compute a scheme from our custom data, then use the
                // toDark() method on our custom light FlexSchemeColor data.
                // New in version 5:
                // For better dark mapping of the light color
                // based values, set parameter swapColor to true in toDark.
                : _computeDarkTheme
                    ? _schemeLight.toDark(_toDarkLevel, true)
                    // And finally, use the defined custom dark colors.
                    : _schemeDark,
        // To use a built-in scheme based on enum, don't assign colors above.
        scheme: _scheme,
        swapColors: _swapColors,
        usedColors: _usedColors,
        // For an optional ink black dark mode, set darkIsTrueBlack to true.
        darkIsTrueBlack: false,
        //
        // The SDK default style of the AppBar in dark mode uses a fixed dark
        // background color, defined via colorScheme.surface color. The
        // appBarStyle FlexAppBarStyle.material results in the same color value.
        // It is also the default if you do not define the style.
        // You can also use other themed styles. Here we use background, that
        // also gets active color blend from used SurfaceMode or SurfaceStyle.
        // You may often want a different style on the AppBar in dark and light
        // theme mode, therefore it was not set via a shared value value
        // above in this template.
        appBarStyle: null, // Try styles like: FlexAppBarStyle.background,
        appBarElevation: _appBarElevation,
        appBarOpacity: _appBarOpacity,
        transparentStatusBar: _transparentStatusBar,
        tabBarStyle: _tabBarForAppBar,
        surfaceMode: _surfaceMode,
        blendLevel: _blendLevel,
        tooltipsMatchBackground: _tooltipsMatchBackground,
        fontFamily: _fontFamily,
        textTheme: _textTheme,
        primaryTextTheme: _textTheme,
        keyColors: _keyColors,
        tones: _flexTonesDark,
        subThemesData: _useSubThemes ? _subThemesData : null,
        visualDensity: _visualDensity,
        platform: _platform,
        // Add all our custom theme extensions, in this case we only have one.
        extensions: <ThemeExtension<dynamic>>{
          darkBrandTheme,
        },
      ),
      themeMode: themeMode,
      home: HomePage(
        themeMode: themeMode,
        onThemeModeChanged: (ThemeMode mode) {
          setState(() {
            themeMode = mode;
          });
        },
        useMaterial3: useMaterial3,
        onMaterial3Changed: (bool value) {
          setState(() {
            useMaterial3 = value;
          });
        },
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// Home Page for the Default Example - Hot Reload Playground
// -----------------------------------------------------------------------------
//
// The content of HomePage below is not so relevant for using FlexColorScheme
// based application theming. The critical parts are in the MaterialApp
// theme definitions above. The HomePage contains UI to visually show what
// the defined example looks like in an application and with common Widgets.
//
// The AnnotatedRegion using FlexColorScheme.themedSystemNavigationBar demo
// is however relevant if you want to change the style of the system
// navigation bar on Android.
//
// The contents below makes it easy to see what your theme looks
// like, and the purpose of this demo app is to show that. You can use this
// example app to experiment with your own themes in code and see the results
// via this HomePage.
class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.themeMode,
    required this.onThemeModeChanged,
    required this.useMaterial3,
    required this.onMaterial3Changed,
  });

  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;
  final bool useMaterial3;
  final ValueChanged<bool> onMaterial3Changed;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ScrollController scrollController;
  // Enabled state of each menuItem.
  late List<bool> menuItemsEnabled;
  // Active state of each menuItem.
  late List<ResponsiveMenuItemIconState> menuItemsIconState;

  @override
  void initState() {
    super.initState();
    scrollController =
        ScrollController(keepScrollOffset: true, initialScrollOffset: 0);
    // Set enabled menu items.
    menuItemsEnabled =
        List<bool>.generate(App.menuItems.length, (int i) => false);
    menuItemsEnabled[0] = true;
    menuItemsEnabled[1] = true;
    // Set menu icons states to initial states, some are a loaded from
    // persisted values via the theme controller.
    menuItemsIconState = List<ResponsiveMenuItemIconState>.generate(
        App.menuItems.length, (int i) => ResponsiveMenuItemIconState.primary);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    menuItemsIconState[0] = isLight
        ? ResponsiveMenuItemIconState.primary
        : ResponsiveMenuItemIconState.secondary;
    menuItemsIconState[1] = theme.useMaterial3
        ? ResponsiveMenuItemIconState.primary
        : ResponsiveMenuItemIconState.secondary;
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size mediaSize = MediaQuery.sizeOf(context);
    final EdgeInsets mediaPadding = MediaQuery.paddingOf(context);
    final double margins = App.responsiveInsets(mediaSize.width);
    final double topPadding = mediaPadding.top + kToolbarHeight + margins;
    final double bottomPadding = mediaPadding.bottom + margins;
    final bool isPhone = mediaSize.width < App.phoneWidthBreakpoint ||
        mediaSize.height < App.phoneHeightBreakpoint;
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final TextStyle headlineMedium = textTheme.headlineSmall!;
    final bool isDark = theme.brightness == Brightness.dark;

    // Get our custom brand color from the BrandTheme extension, with a
    // fallback to primary color.
    final Color brandColor =
        theme.extension<BrandTheme>()!.brandColor ?? theme.colorScheme.primary;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      // FlexColorScheme contains a static helper that can be use to theme
      // the system navigation bar using an AnnotatedRegion. Without this
      // wrapper the system navigation bar in Android will not change
      // theme color as we change themes for the page. This is normal Flutter
      // behavior. By using an annotated region with the helper function
      // FlexColorScheme.themedSystemNavigationBar, we can make the
      // navigation bar follow desired background color and theme mode.
      // This looks much better and as it should on Android devices.
      // It also supports system navbar with opacity or fully transparent
      // Android system navigation bar on Android SDK >= 29.
      value: FlexColorScheme.themedSystemNavigationBar(
        context,
        // On Android SDK >= 29, try changing this to transparent, then on the
        // sub page demo with a bottom navigation bar and some opacity set
        // further below in [opacity].
        // You then get one homogeneously slightly transparent area, shared
        // with the bottom navigation bar and system navigation bar.
        systemNavBarStyle: FlexSystemNavBarStyle.background,
        // You can use a top divider on the navigation bar, but it does
        // add an extra scrim, which becomes visible when using bars with
        // opacity or fully transparent.
        useDivider: false,
        // You can set opacity on the Android system navigation bar, this will
        // result in content being visible behind it if Scaffold uses
        // extendBody.
        opacity: 0.60,
      ),
      child: ResponsiveScaffold(
        title: Text(App.title(context)),
        menuTitle: const Text(App.packageName),
        menuLeadingTitle: Text(
          App.title(context),
          style:
              theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold),
        ),
        menuLeadingSubtitle: const Text('Version ${App.versionMajor}'),
        menuLeadingAvatarLabel: 'FCS',
        menuItems: App.menuItems,
        menuItemsEnabled: menuItemsEnabled,
        menuItemsIconState: menuItemsIconState,
        railWidth: isPhone ? 52 : 66,
        breakpointShowFullMenu: App.desktopWidthBreakpoint,
        extendBodyBehindAppBar: true,
        extendBody: true,
        onSelect: (int index) {
          if (index == 0) {
            if (isDark) {
              widget.onThemeModeChanged(ThemeMode.light);
            } else {
              widget.onThemeModeChanged(ThemeMode.dark);
            }
          }
          if (index == 1) {
            if (widget.useMaterial3) {
              widget.onMaterial3Changed(false);
            } else {
              widget.onMaterial3Changed(true);
            }
          }
        },
        body: PageBody(
          controller: scrollController,
          constraints: const BoxConstraints(maxWidth: App.maxBodyWidth),
          child: ListView(
            controller: scrollController,
            padding: EdgeInsets.fromLTRB(
                margins, topPadding, margins, bottomPadding),
            children: <Widget>[
              Text('Theme Extension Colored Header',
                  style: headlineMedium.copyWith(color: brandColor)),
              const Text(
                'This is FlexColorScheme developers Hot Reload '
                'Playground. It has property values that you can modify and '
                'hot reload the app to try different options and features.',
              ),
              const SizedBox(height: 8),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Theme mode'),
                subtitle: Text('Theme '
                    '${widget.themeMode.toString().dotTail}'),
                trailing: ThemeModeSwitch(
                  themeMode: widget.themeMode,
                  onChanged: widget.onThemeModeChanged,
                ),
                onTap: () {
                  if (isDark) {
                    widget.onThemeModeChanged(ThemeMode.light);
                  } else {
                    widget.onThemeModeChanged(ThemeMode.dark);
                  }
                },
              ),
              const SizedBox(height: 8),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Use Material 3'),
                value: widget.useMaterial3,
                onChanged: (bool value) {
                  widget.onMaterial3Changed(value);
                },
              ),
              const SizedBox(height: 8),
              const ShowColorSchemeColors(),
              const SizedBox(height: 8),
              const ShowThemeDataColors(),
              const SizedBox(height: 8),
              const ShowSubThemeColors(),
              const SizedBox(height: 8),
              const ShowSubPages(),
              const Divider(),
              Text('Theme Showcase', style: headlineMedium),
              const SizedBox(height: 8),
              const ShowcaseMaterial(),
            ],
          ),
        ),
      ),
    );
  }
}
