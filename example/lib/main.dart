import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'shared/const/app_data.dart';
import 'shared/widgets/app/responsive_scaffold.dart';
import 'shared/widgets/app/show_sub_pages.dart';
import 'shared/widgets/universal/page_body.dart';
import 'shared/widgets/universal/show_theme_colors.dart';
import 'shared/widgets/universal/theme_mode_switch.dart';
import 'shared/widgets/universal/theme_showcase.dart';

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
// you can experiment with and use as a quick starter template to start using
// FlexColorScheme to make beautiful Flutter themes for your applications.
// It is also a code and comment based quick guide for devs that don't read
// long documentation.
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
// the step-by-step tutorial that uses examples 1 to 5 to explain and
// demonstrate the features with increasing complexity. Example 5 represents
// the full bonanza where pretty much everything can be changed dynamically
// while running the app.

// For our custom color scheme we define primary and secondary colors,
// but no variant or other colors.
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
  // color, but not a secondaryVariant color, the secondary variant will get
  // derived from the secondary color, instead of from the primary color.
  secondary: const Color(0xFFFF7B00),
);

// These are custom defined matching dark mode colors. Further below we show
// how to compute them based on the light color scheme. You can swap them in the
// code example further below and compare the result of these manually defined
// matching dark mode colors, to the ones computed via the "lazy" designer
// matching dark colors.
final FlexSchemeColor _schemeDark = FlexSchemeColor.from(
  primary: const Color(0xFF6B8BC3),
  secondary: const Color(0xffff7155),
);

// To use a pre-defined color scheme, don't assign any FlexSchemeColor to
// `colors` instead, just pick a FlexScheme and assign it to the `scheme`.
// Try eg the new "Blue Whale" color scheme.
const FlexScheme _scheme = FlexScheme.blueWhale;

// To make it easy to toggle between using the above custom colors, or the
// selected predefined scheme in this example, set _useScheme to true to use the
// selected predefined scheme above, set it to false to use the custom colors.
const bool _useScheme = false;

// A quick setting for the themed app bar elevation, it defaults to 0.
// A very low, like 0.5 is pretty nice too, since it gives an underline effect
// visible with e.g. white or light colored app bars.
const double _appBarElevation = 0.5;

// There is setting to put an opacity value on the app bar. If used, we can see
// content scroll behind it, if we extend the Scaffold behind the AppBar.
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
const bool _computeDarkTheme = true;

// When you use _computeDarkTheme, use this desaturation % level to calculate
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

// Use a GoogleFonts font as default font for your theme. Not used by default
// in the demo setup, but you can uncomment _fontFamily further below to use it.
// ignore: unused_element
late String? _fontFamily = GoogleFonts.notoSans().fontFamily;

// Define a custom text theme for the app. Here we have decided that
// Headline1..3 are too big to be useful for us, so we make them a bit smaller
// and that overline is a bit too small and have weird letter spacing.
const TextTheme _textTheme = TextTheme(
  headline1: TextStyle(fontSize: 57),
  headline2: TextStyle(fontSize: 45),
  headline3: TextStyle(fontSize: 36),
  overline: TextStyle(fontSize: 11, letterSpacing: 0.5),
);

// FlexColorScheme before version 4 used the `surfaceStyle` property to
// define the surface color blend mode. If you are migrating from an earlier
// version, no worries it still works as before, but we won't be using it in
// this example anymore.
// When you define a value for the new `surfaceMode` property used below,
// it will also override any defined `surfaceStyle`.
// It is recommended to use this method to make alpha blended surfaces
// starting with version 4.
// The mode `scaffoldSurfaceBackground` is similar to all the previous
// `surfaceStyle` settings, but its blend level is set separately in finer and
// more increments via `blendLevel`. Additionally there are several new surface
// blend mode strategies in version 4, instead of just one.
const FlexSurfaceMode _surfaceMode = FlexSurfaceMode.highBackgroundLowScaffold;

// The alpha blend level strength can be defined separately from the
// SurfaceMode strategy, and has 40 alpha blend level strengths.
const int _blendLevel = 15;

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
// It comes with Material You like rounded defaults, but you can adjust
// its configuration via simple parameters in a passed in configuration class
// called FlexSubThemesData.
// Here are some some configuration examples:
const FlexSubThemesData _subThemesData = FlexSubThemesData(
  // Opt in for themed hover, focus, highlight and splash effects.
  // New buttons use primary themed effects by default, this setting makes
  // the general ThemeData hover, focus, highlight and splash match that.
  // True by default when opting in on sub themes, but you can turn it off.
  interactionEffects: true,

  // When it is null = undefined, the sub themes will use their default style
  // behavior that aims to follow new Material 3 (M3) standard for all widget
  // corner roundings. Current Flutter SDK corner radius is 4, as defined by
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

  // Use the Material 3 like text theme. Defaults to true.
  useTextTheme: true,

  // Select input decorator type, only SDK options outline and underline
  // supported no, but custom ones may be added later.
  inputDecoratorBorderType: FlexInputBorderType.outline,
  // For a primary color tinted background on the input decorator set to true.
  inputDecoratorIsFilled: true,
  // If you do not want any underline/outline on the input decorator when it is
  // not in focus, then set this to false.
  inputDecoratorUnfocusedHasBorder: true,
  // Select the ColorScheme color used for input decoration border.
  // Primary is default so no need to set that, used here as placeholder to
  // enable easy selection of other options.
  inputDecoratorSchemeColor: SchemeColor.primary,

  // Select the ColorScheme color used by Chips as their base color
  // Primary is default so no need to set that, used here as placeholder to
  // enable easy selection of other options.
  chipSchemeColor: SchemeColor.primary,

  // Elevations have easy override values as well.
  elevatedButtonElevation: 1,
  // Widgets that use outline borders can be easily adjusted via these
  // properties, they affect the outline input decorator, outlined button and
  // toggle buttons.
  thickBorderWidth: 2, // Default is 2.0.
  thinBorderWidth: 1.5, // Default is 1.5.

  // Select the ColorScheme color used for selected TabBar indicator.
  // Defaults to same color as selected tab if not defined.
  // tabBarIndicatorSchemeColor: SchemeColor.secondary,

  // Select the ColorScheme color used for selected bottom navigation bar item.
  // Primary is default so no need to set that, used here as placeholder to
  // enable easy selection of other options.
  bottomNavigationBarSchemeColor: SchemeColor.primary,

  // Select the ColorScheme color used for bottom navigation bar background.
  // Background is default so no need to set that, provided here as placeholder
  // to enable easy selection of other options.
  bottomNavigationBarBackgroundSchemeColor: SchemeColor.background,

  // Define if the M3 NavigationBar should be styled to match FlexColorScheme
  // opinionated defaults as a starting point before additional properties are
  // defined. If false, the starting point is the default M3 style for the
  // widget. The default value is true, using the opinionated values
  // as a starting point.
  navigationBarIsStyled: true,

  // Below are some of the quick override properties that you can use on the
  // M3 based NavigationBar. They are commented out, so remove comments to
  // try them. They come into effect regardless of if [navigationBarIsStyled] is
  // true or false, unless otherwise mentioned in the comments and docs.

  // Select the ColorScheme color used for M3 based [NavigationBar] icons.
  // navigationBarIconSchemeColor: SchemeColor.primary,

  // Select the ColorScheme color used for M3 based [NavigationBar] label text.
  // navigationBarTextSchemeColor: SchemeColor.onSurface,

  // Select the ColorScheme base color used to highlight selected item.
  // navigationBarHighlightSchemeColor: SchemeColor.primaryVariant,

  // Select the ColorScheme color used for navigation bar background.
  // navigationBarBackgroundSchemeColor: SchemeColor.background,

  // When set to true [NavigationBar] unselected icons use a more muted version
  // of the color defined by [navigationBarIconSchemeColor].
  // If [navigationBarIsStyled] is false, you also have to assign a value to
  // [navigationBarIconSchemeColor] or [navigationBarSelectedIconSize] or
  // [navigationBarUnselectedIconSize] so the none standard IconTheme
  // must be created that can be muted. If none of those properties are defined
  // the widget default behavior for icon style is used, and unselected
  // icon cannot be muted since all properties are null.
  //
  // navigationBarMutedUnselectedIcon: true,

  // When set to true [NavigationBar] unselected text use a more muted version
  // of the color defined by [navigationBarTextSchemeColor].
  // If [navigationBarIsStyled] is false, you also have to assign a value to
  // [navigationBarTextSchemeColor] or [navigationBarSelectedLabelSize] or
  // [navigationBarUnselectedLabelSize] so the none standard TextStyle
  // must be created that can be muted, if none of those properties are defined
  // the widget default behavior for label text style is used and unselected
  // text cannot be muted.
  //
  // navigationBarMutedUnselectedText: true,

  // Set size of labels.
  //
  // navigationBarSelectedLabelSize: 12,
  // navigationBarUnselectedLabelSize: 10,

  // Set the size of icons icons.
  //
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
        // We just use the _useScheme bool toggle here from above, only for easy
        // switching via code params so you can try options handily.
        colors: _useScheme ? null : _schemeLight,
        scheme: _scheme,
        swapColors: _swapColors, // If true, swap primary and secondaries.
        // For an optional white look set lightIsWhite to true.
        // This is the counterpart to darkIsTrueBlack mode in dark theme mode,
        // which is much more useful than this feature.
        lightIsWhite: false,

        // If you provide a color value to a direct color property, the color
        // value will override anything specified via the other properties.
        // The priority from lowest to highest order is:
        // 1. scheme 2. colors 3. Individual color values. Normally you would
        // make a custom scheme using the colors property, but if you want to
        // override just one or two colors in a pre-existing scheme, this can
        // be handy way to do it. Uncomment a color property below on
        // the light theme to try it:

        // primary: FlexColor.indigo.light.primary,
        // primaryVariant: FlexColor.greenLightPrimaryVariant,
        // secondary: FlexColor.indigo.light.secondary,
        // secondaryVariant: FlexColor.indigo.light.secondaryVariant,
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
        appBarStyle: FlexAppBarStyle.primary,
        appBarElevation: _appBarElevation,
        appBarOpacity: _appBarOpacity,
        transparentStatusBar: _transparentStatusBar,
        tabBarStyle: _tabBarForAppBar,
        surfaceMode: _surfaceMode,
        blendLevel: _blendLevel,
        tooltipsMatchBackground: _tooltipsMatchBackground,
        // You can try another font too, not set by default in the demo.
        // Prefer using fully defined TextThemes when using fonts, rather than
        // just setting the fontFamily name, even with GoogleFonts. For
        // quick tests this is fine too, but if the same font style is good
        // as it is, for all the styles in the TextTheme just the fontFamily
        // works well too.
        // fontFamily: _fontFamily,
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
        // You may often want a different style on the AppBar in dark and light
        // theme mode, therefore it was not set via a shared value value
        // above in this template.
        appBarStyle: FlexAppBarStyle.background,
        appBarElevation: _appBarElevation,
        appBarOpacity: _appBarOpacity,
        transparentStatusBar: _transparentStatusBar,
        tabBarStyle: _tabBarForAppBar,
        surfaceMode: _surfaceMode,
        blendLevel: _blendLevel,
        tooltipsMatchBackground: _tooltipsMatchBackground,
        // fontFamily: _fontFamily,
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

// The content of HomePage below is not so relevant for using FlexColorScheme
// based application theming. The critical parts are in the MaterialApp
// theme definitions above. The HomePage contains UI to visually show what
// the defined example looks like in an application and with common Widgets.
//
// The AnnotatedRegion using FlexColorScheme.themedSystemNavigationBar demo
// is however relevant if you want to see something cool on Android.
//
// The contents below does make it handy to see what your theme looks
// like, and the purpose of this demo app is to show that. You can use this
// example app to experiment with your own themes in code and see the results
// via this HomePage.
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
    // We are on phone width media, based on our definition in this app.
    final bool isPhone = media.size.width < AppData.phoneBreakpoint;

    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final TextStyle headline4 = textTheme.headline4!;
    // In dark mode?
    final bool isDark = theme.brightness == Brightness.dark;

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
        title: Text(AppData.title(context)),
        menuTitle: const Text(AppData.appName),
        // Make Rail width larger when using it on tablet or desktop.
        railWidth: isPhone ? 52 : 66,
        breakpointShowFullMenu: AppData.desktopBreakpoint,
        extendBodyBehindAppBar: true,
        extendBody: true,
        onSelect: (int index) {
          if (index == 7) {
            if (isDark) {
              widget.onThemeModeChanged(ThemeMode.light);
            } else {
              widget.onThemeModeChanged(ThemeMode.dark);
            }
          }
        },
        body: PageBody(
          controller: scrollController,
          constraints: const BoxConstraints(maxWidth: AppData.maxBodyWidth),
          child: ListView(
            controller: scrollController,
            padding: EdgeInsets.fromLTRB(
                margins, topPadding, margins, bottomPadding),
            children: <Widget>[
              const Text('This is FlexColorScheme V4 developers hot reload '
                  'playground. It has property values that you can modify and '
                  'hot reload the app to try different options and features.'),
              const SizedBox(height: 8),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Theme mode'),
                subtitle: Text('Mode '
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
              // Active theme color indicators.
              const ShowThemeColors(),
              const SizedBox(height: 8),
              const ShowSubPages(),
              const Divider(),
              Text('Theme Showcase', style: headline4),
              const SizedBox(height: 8),
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
