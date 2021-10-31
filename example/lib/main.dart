import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'shared/all_shared_imports.dart';

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
// The purpose is to provide any easy to use in-code based playground that
// you can experiment with and use as quick starter template to start using
// FlexColorScheme to make beautiful Flutter themes for your applications.
// It is also a code and comment based quick guide for devs that don't read
// long documentation.
//
// This setup is convenient since you can edit the values for both the light
// and dark theme mode via shared property values on observer the changes
// in the built via hot reload.
// In a real app you might tuck away your color definitions and FlexColorScheme
// settings in a static class with const and final values and static functions
// as required. The other tutorials show one possible example of this as well.
//
// To learn more about using FlexColorScheme, it is recommended to go through
// the step-by-step tutorial that uses examples 1 to 5 to explain and
// demonstrate the features with increasing complexity. Example 5 represents
// the full bonanza where pretty much everything can be changed dynamically
// while running the app.

// For our custom color scheme we define primary and secondary colors,
// but no variant or other colors.
final FlexSchemeColor _schemeLight = FlexSchemeColor.from(
  primary: const Color(0xFF3B5997),
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
  // color, but not a secondaryVariant color, the secondary variant will get
  // derived from the secondary color, instead of from the primary color.
  secondary: const Color(0xFFFB8123),
);

// These are custom defined matching dark mode colors. Further below we show
// how to compute them based on the light color scheme. You can swap them in the
// code example further below and compare the result of these manually defined
// matching dark mode colors, to the ones computed via the "lazy" designer
// matching dark colors.
final FlexSchemeColor _schemeDark = FlexSchemeColor.from(
  primary: const Color(0xFF8B9DC3),
  secondary: const Color(0xFFFCB075),
);

// To use a pre-defined color scheme, don't assign any FlexSchemeColor to
// `colors` instead, just pick a FlexScheme and assign it to the `scheme`.
const FlexScheme _scheme = FlexScheme.blueWhale;

// A quick setting for the themed app bar elevation, it defaults to 0.
// A very low, like 0.5 is pretty nice too, since it gives an underline effect
// visible with e.g. white or light app bars.
const double _appBarElevation = 0.5;

// There is quick setting to put an opacity value on the app bar, so we can
// see content scroll behind it fi we extend the scaffold behind it.
const double _appBarOpacity = 0.93;

// To make it easy to toggle between using the custom colors, or the selected
// predefined scheme in this example, set use scheme below to true, to use the
// selected predefined scheme above, chnage to false to use the custom colors.
const bool _useScheme = true;

// If you set _computeDarkTheme below to true the dark scheme will be computed
// both for the selected scheme and the custom colors, from the light scheme.
// There is a bit of logic hoops below to make it happen via these bool toggles.
//
// Going "toDark()" on your light FlexSchemeColor definition is just a quick
// way you can make a dark theme from a light color scheme definition, without
// figuring out usable color values yourself. Useful during development, when
// you test custom colors, but usually you probably want to hand tune your
// final custom dark color scheme colors to const values.
const bool _computeDarkTheme = true;

// When you use _computeDarkTheme, use this desaturation % level to calculate
// the dark scheme from the light scheme colors. The default is 35%, but values
// from 20% might work on less saturated light scheme colors. For more
// deep and colorful starting values, you can try 40%. Trivia: The default
// red dark error color in the Material design guide, is computed from the light
// theme error color value, by using 40% with the same algorithm used here.
const int _toDarkLevel = 30;

// To swap primaries and secondaries, set to true. With some color schemes
// interesting and even useful inverted themes can be obtained by only
// swapping the colors on your dark scheme.
const bool _swapColors = false;

// Use a GoogleFonts, font as default font for your theme, Noto Sans is nice.
final String? _fontFamily = GoogleFonts.notoSans().fontFamily;

// Define a custom text theme for the app. Here we have decided that
// Headline1 is too big to be useful for us, so we make it a bit smaller.
// We also think buttons should have a bit bigger text, tighter letter spacing,
// and that overline is a bit too small and have weird letter spacing,
// so we change them too.
const TextTheme _textTheme = TextTheme(
  headline1: TextStyle(
    fontSize: 70, // Defaults to 96 in Material2018 Typography.
  ),
  button: TextStyle(
    fontSize: 16, // Defaults to 14 in Material2018 Typography.
    letterSpacing: 0.9, // Defaults to 1.25 in Material2018 Typography.
  ),
  overline: TextStyle(
    fontSize: 11, // Defaults to 10 in Material2018 Typography.
    letterSpacing: 0.5, // Defaults to 1.5 in Material2018 Typography.
  ),
);

// FlexColorScheme before version 4.0.0 used the `surfaceStyle` property to
// define the surface color blend mode. If you are migrating from an earlier
// version, no worries it still works as before. But we won't be using it in
// this example anymore.
// When you define a value for the new `surfaceMode` property used below,
// it will also override any defined `surfaceStyle`.
// It is recommended to use this method to make alpha blended surfaces
// starting with version 4.
// The mode `scaffoldSurfaceBackground` equals all the previous `surfaceStyle`
// settings, but its blend level is set separately in finer and more increments
// via `blendLevel`. There are several new surface blend mode strategies in
// version 4.0.0, instead of just one as in previous versions.
const FlexSurfaceMode _surfaceMode = FlexSurfaceMode.lowScaffold;

// The alpha blend level strength can be defined separately from the
// SurfaceMode strategy, and has 40 alpha blend level strengths.
const int _blendLevel = 20;

// The `useSubThemes` sets weather you want to opt-in or not on additional
// opinionated sub-theming. By default FlexColorScheme as before does very
// little styling on widgets, other than a few important adjustments, described
// in detail in the readme. By using the sub-theme opt-in, it now also offers
// easy to use additional out-of the box opinionated styling of SDK UI Widgets.
const bool _useSubThemes = true;

// The opt-in opinionated sub-theming offers easy to use consistent corner
// radius rounding setting on all sub-themes and a ToggleButtons design that
// matches the normal buttons style and size.
// It comes with Material You like rounded defaults, but you can adjust
// its configuration via simple parameters in a passed in configuration class
// called FlexSubThemesData.
// Here are some some configuration examples:
const FlexSubThemesData _subThemesData = FlexSubThemesData(
  // Opt in for themed hover, focus, highlight and splash effects.
  // New buttons use primary themed effects by default, this setting makes
  // the general ThemeData hover, focus, highlight and splash match that.
  // True by default when opting in on sub themes, but you can turn it off.
  themedEffects: true,
  // Global corner radius. Default is 16, but make it whatever you like, even 0.
  // You can also override individual corner radius for each sub-theme to make
  // it different from the global `cornerRadius`.
  cornerRadius: 16,
  // Try eg. the one on the InputDecorator, commented below:
  // cornerRadiusInputDecoration: 8,
  // Select input decorator type, only SDK options outline and underline
  // supported no, but custom ones may be added later.
  inputDecoratorBorderType: FlexInputBorderType.underline,
  // For a primary color tinted background on the input decorator set to true.
  inputDecoratorIsFilled: true,
  // If you do not want any underline/outline on the input decorator when it is
  // not in focus, then set this to false.
  inputDecoratorUnfocusedHasBorder: true,
  // Elevations have easy override values as well.
  elevatedButtonElevation: 1,
  // Widgets that use outline borders can be easily adjusted via these
  // properties, they affect the outline input decorator, outlined button and
  // toggle buttons.
  thickBorderWidth: 2, // Default is 2.0.
  thinBorderWidth: 1.5, // Default is 1.5.
);

// If true, the top part of the Android AppBar has no scrim, it becomes
// one colored like on iOS.
const bool _transparentStatusBar = true;

// Usually the TabBar is used in an AppBar. This style themes it right for
// that, regardless of what FlexAppBarStyle you use for the `appBarStyle`.
// If you will use TabBar on scaffold or other background colors,
// use the style FlexTabBarStyle.forBackground.
const FlexTabBarStyle _tabBarForAppBar = FlexTabBarStyle.forAppBar;

// If true, tooltip background brightness is same as background brightness.
// False by default, which is inverted background brightness compared to theme.
// Setting this to true is more Windows desktop like.
const bool _tooltipsMatchBackground = true;

// The visual density setting defaults to same as SDK default value,
// VisualDensity.adaptivePlatformDensity. You can define a fixed one
// or try FlexColorScheme.comfortablePlatformDensity.
// The `comfortablePlatformDensity` is an alternative adaptive density to the
// default `adaptivePlatformDensity`. It makes the density `comfortable` on
// desktops, instead of `compact` as the `adaptivePlatformDensity` does.
// This is useful on desktop with touch screens, since it keeps tap targets
// a bit larger.
final VisualDensity _visualDensity = FlexColorScheme.comfortablePlatformDensity;

// This is just standard `platform` property in `ThemeData`, handy to have as
// a direct property, you can use it to test how things changes on different
// platforms without using `copyWith` on the resulting theme data.
final TargetPlatform _platform = defaultTargetPlatform;

class DemoApp extends StatefulWidget {
  const DemoApp({Key? key}) : super(key: key);

  @override
  State<DemoApp> createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  ThemeMode themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hot Reload Playground',
      // Define the light theme for the app, based on defined colors and
      // properties above.
      theme: FlexThemeData.light(
        // Want to use a built in scheme? Don't assign any value to colors.
        colors: _useScheme ? null : _schemeLight,
        scheme: _scheme,
        swapColors: _swapColors, // If true, swap primary and secondaries.

        // If you provide a color value to a direct color property, the color
        // value will override anything specified via the other properties.
        // The priority from lowest to highest order is:
        // 1. scheme 2. colors 3. Individual color values.
        // You can uncomment a color property below on the light theme
        // to try it:
        //
        // primary: FlexColor.indigo.light.primary,
        // primaryVariant: FlexColor.indigo.light.primaryVariant,
        // secondary: FlexColor.indigo.light.secondary,
        // secondaryVariant: FlexColor.indigo.light.secondaryVariant,
        // surface: FlexColor.lightSurface,
        // background: FlexColor.lightBackground,
        // scaffoldBackground: FlexColor.lightScaffoldBackground,
        // dialogBackground: FlexColor.lightSurface,
        // appBarBackground: FlexColor.indigo.light.primary,

        // The default style of AppBar in Flutter SDK light mode uses scheme
        // primary color as its background color.
        // The appBarStyle FlexAppBarStyle.primary, results in this too and is
        // the default in light mode. You can also choose other themed styles.
        // Here we use FlexAppBarStyle.background, that gets active color blend
        // from used surfaceMode or surfaceStyle, depending on which one is
        // being used.
        // You may often want a different style on the app bar in dark and light
        // theme mode, therefore it was not set via a shared value here.
        appBarStyle: FlexAppBarStyle.background,
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
        useSubThemes: _useSubThemes,
        subThemesData: _subThemesData,
        visualDensity: _visualDensity,
        platform: _platform,
      ),
      // Define the corresponding dark theme for the app.
      darkTheme: FlexThemeData.dark(
        // If you want to base the dark scheme on your light colors,
        // you can also compute it from the light theme's FlexSchemeColors.
        // Here we do so by setting _computeDarkTheme to true.
        // The FlexSchemeColors class has a toDark() method that can convert
        // a color scheme designed for a light theme, to corresponding colors
        // suitable for a dark theme. For the built in themes there is no
        // need to do so, they all have hand tuned dark scheme colors.
        // Regardless, below we anyway demonstrate how you can do that too.
        //
        // Normally you would not do wild things like this logic, this is just
        // here so you can toggle a few booleans above to try the options.
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
                : _computeDarkTheme
                    ? _schemeLight.toDark(_toDarkLevel)
                    // And finally, use the defined custom dark colors.
                    : _schemeDark,
        // To use a built-in scheme based on enum, don't assign colors above.
        scheme: _scheme,
        swapColors: _swapColors,
        // For an optional ink black dark mode, set darkIsTrueBlack to true.
        darkIsTrueBlack: false,

        // The SDK default style of the AppBar in dark mode uses a fixed dark
        // background color, defined via colorScheme.surface color. The
        // appBarStyle FlexAppBarStyle.material results in the same color value.
        // It is also the default if you do not define the style.
        // You can also use other themed styles. Here we use background, that
        // also gets active color blend from used SurfaceMode or SurfaceStyle.
        // You may often want a different style on the app bar in dark and light
        // theme mode, therefore it was not set via a shared value here.
        appBarStyle: FlexAppBarStyle.background,
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
        useSubThemes: _useSubThemes,
        subThemesData: _subThemesData,
        visualDensity: _visualDensity,
        platform: _platform,
      ),
      themeMode: themeMode,
      home: HomePage(
        themeMode: themeMode,
        onThemeModeChanged: (ThemeMode mode) {
          setState(() {
            themeMode = mode;
          });
        },
      ),
    );
  }
}

// The content of the HomePage below is not relevant for using FlexColorScheme
// based application theming. The critical parts are in the MaterialApp
// theme definitions above. The HomePage just contains UI to visually show what
// the defined example looks like in an application and with common Widgets.
class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.themeMode,
    required this.onThemeModeChanged,
  }) : super(key: key);

  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController scrollController;

  // The state for the system navbar style and divider usage is local as it is
  // is only used by the AnnotatedRegion.
  // Used to control system navbar style via an AnnotatedRegion.
  FlexSystemNavBarStyle systemNavBarStyle = FlexSystemNavBarStyle.background;
  // Used to control if we have a top divider on the system navigation bar.
  bool useSysNavDivider = false;

  @override
  void initState() {
    super.initState();
    scrollController =
        ScrollController(keepScrollOffset: true, initialScrollOffset: 0);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData media = MediaQuery.of(context);
    final double margins = AppData.responsiveInsets(media.size.width);
    final double topPadding = media.padding.top + kToolbarHeight + margins;
    final double bottomPadding = media.padding.bottom + margins;

    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final TextStyle headline4 = textTheme.headline4!;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      // FlexColorScheme contains a static helper that can be use to theme
      // the system navigation bar using an AnnotatedRegion. Without this
      // wrapper the system navigation bar in Android will not change
      // theme color as we change themes for the page. This is normal Flutter
      // behavior. By using an annotated region with the helper function
      // FlexColorScheme.themedSystemNavigationBar, we can make the
      // navigation bar follow desired background color and theme-mode.
      // This looks much better and as it should on Android devices.
      // It also supports system navbar with opacity or fully transparent
      // Android system navigation bar on Android SDK >= 29.
      value: FlexColorScheme.themedSystemNavigationBar(
        context,
        systemNavBarStyle: systemNavBarStyle,
        useDivider: useSysNavDivider,
      ),
      child: ResponsiveScaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: PageBody(
          controller: scrollController,
          constraints: const BoxConstraints(maxWidth: AppData.maxBodyWidth),
          child: ListView(
            controller: scrollController,
            padding: EdgeInsets.fromLTRB(
                margins, topPadding, margins, bottomPadding),
            children: <Widget>[
              Text('Theme', style: headline4),
              const Text('This example shows how you can use custom colors '
                  'with FlexColorScheme in light and dark mode, '
                  'just as defined values in a stateless app.\n\n'
                  'This example function as developers hot reload playground. '
                  'It has property placeholders for every feature, that '
                  'you can modify to try different FlexColorScheme features.'),
              const SizedBox(height: 8),
              ListTile(
                title: const Text('Theme mode'),
                subtitle: Text('Mode '
                    '${widget.themeMode.toString().dotTail}'),
                trailing: ThemeModeSwitch(
                  themeMode: widget.themeMode,
                  onChanged: widget.onThemeModeChanged,
                ),
                onTap: () {
                  if (Theme.of(context).brightness == Brightness.light) {
                    widget.onThemeModeChanged(ThemeMode.dark);
                  } else {
                    widget.onThemeModeChanged(ThemeMode.light);
                  }
                },
              ),
              const SizedBox(height: 8),
              // Active theme color indicators.
              Padding(
                padding: EdgeInsets.symmetric(horizontal: margins),
                child: const ShowThemeColors(),
              ),
              const SizedBox(height: 8),
              // Open a sub-page
              Card(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: const Text('Open a demo subpage'),
                      subtitle: const Text(
                        'The subpage will use the same '
                        'color scheme based theme automatically.',
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Subpage.show(context);
                      },
                    ),
                    const Divider(height: 1),
                    // Splash pages...
                    ListTile(
                      title: const Text('Splash page demo 1a'),
                      subtitle: const Text(
                        'No scrim and normal status icons.\n'
                        'Using themedSystemNavigationBar (noAppBar:true)',
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        SplashPageOne.show(context, false);
                      },
                    ),
                    ListTile(
                      title: const Text('Splash page demo 1b'),
                      subtitle: const Text(
                        'No scrim and inverted status icons.\n'
                        'Using themedSystemNavigationBar (noAppBar:true, '
                        'invertStatusIcons:true)',
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        SplashPageOne.show(context, true);
                      },
                    ),
                    ListTile(
                      title: const Text('Splash page demo 2'),
                      subtitle: const Text(
                        'No status icons or navigation bar.\n'
                        'Using setEnabledSystemUIOverlays([ ])',
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        SplashPageTwo.show(context, true);
                      },
                    ),
                  ],
                ),
              ),
              Text('Theme Showcase', style: headline4),
              const ThemeShowcase(),
            ],
          ),
        ),
      ),
      //     ),
      //   ],
      // ),
    );
  }
}
