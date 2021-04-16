import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../all_shared_imports.dart';
import '../shared/subpage.dart';

// -----------------------------------------------------------------------------
// EXAMPLE 5)
//
// This example shows how you can use all the built in color schemes in
// FlexColorScheme to define themes from them and how you can define your own
// custom scheme colors and use them together with the predefined ones.
// It can give you an idea of how you can create your own complete custom list
// of themes if you do not want to use any of the predefined ones.
//
// The example also shows how you can use the surface branding feature and
// how to use the custom app bar theme features of FlexColorScheme. The usage
// of the true black theme feature for dark themes is also demonstrated.
// Using the optional Windows desktop like tooltip theme is also shown.
//
// A toggle that allows us to compare the result of custom defined dark schemes
// to the lazy computed versions is also available. To further demonstrate the
// difference between FlexColorScheme.toTheme and ThemeData.from an option
// to try both is presented for comparison purposes.
//
// The example includes a dummy responsive side menu and rail to give a visual
// presentation of what applications that have larger visible surfaces using the
// surface branding look like.
//
// A theme showcase widget shows the theme with several common Material widgets.
//
// ---
// For simplicity this example just creates a few const and final instances
// of the needed objects and list. In a real app, you may want to use a Provider
// or equivalent package(s) to provide the objects where needed in your app.
// -----------------------------------------------------------------------------

void main() => runApp(const DemoApp());

// Create a custom flex scheme color for a light theme.
const FlexSchemeColor myScheme1Light = FlexSchemeColor(
  primary: Color(0xFF4E0028),
  primaryVariant: Color(0xFF320019),
  secondary: Color(0xFF003419),
  secondaryVariant: Color(0xFF002411),
  // The built in schemes use their secondary variant color as their
  // custom app bar color, it could of course be any color, but for consistency
  // we will do the same in this custom FlexSchemeColor.
  appBarColor: Color(0xFF002411),
);
// Create a corresponding custom flex scheme color for a dark theme.
const FlexSchemeColor myScheme1Dark = FlexSchemeColor(
  primary: Color(0xFF9E7389),
  primaryVariant: Color(0xFF775C69),
  secondary: Color(0xFF738F81),
  secondaryVariant: Color(0xFF5C7267),
  // Again we use same secondaryVariant color as optional custom app bar color.
  appBarColor: Color(0xFF5C7267),
);

// You can build a scheme the long way, by specifying all the required hand
// picked scheme colors, like above, or you can build schemes from a
// single primary color. With the [.from] factory, then the only required color
// is the primary color, the other colors will be computed. You can optionally
// also provide the primaryVariant, secondary and secondaryVariant colors with
// the factory, but any color that is not provided will always be computed for
// the full set of required colors in a FlexSchemeColor.

// In this example we create our 2nd scheme from just a primary color
// for the light and dark schemes. The custom app bar color will in this case
// also receive the same color value as the one that is computed for
// secondaryVariant color, this is the default in the [from] factory.
final FlexSchemeColor myScheme2Light =
    FlexSchemeColor.from(primary: const Color(0xFF4C4E06));
final FlexSchemeColor myScheme2Dark =
    FlexSchemeColor.from(primary: const Color(0xFF9D9E76));

// For our 3rd custom scheme we will define primary and secondary colors, but no
// variant colors, we will not make any dark scheme definitions either.
final FlexSchemeColor myScheme3Light = FlexSchemeColor.from(
  primary: const Color(0xFF993200),
  secondary: const Color(0xFF1B5C62),
);

// Create a list with all color schemes we will use, starting with all
// the built-in ones and then adding our custom ones at the end.
final List<FlexSchemeData> myFlexSchemes = <FlexSchemeData>[
  // Use the built in FlexColor schemes, but exclude the placeholder for custom
  // scheme, a selection that would typically be used to compose a theme
  // interactively in the app using a color picker, we won't be doing that in
  // this example.
  ...FlexColor.schemesList,
  // Then add our first custom FlexSchemeData to the list, we give it a name
  // and description too.
  const FlexSchemeData(
    name: 'Toledo purple',
    description: 'Purple theme, created from full custom defined color scheme.',
    // Flex scheme data holds separate defined color schemes for light and
    // matching dark theme colors. Dark theme colors need to be much less
    // saturated than light theme. Using the same colors in light and dark
    // theme modes does not look nice.
    light: myScheme1Light,
    dark: myScheme1Dark,
  ),
  // Do the same for our second custom scheme.
  FlexSchemeData(
    name: 'Olive green',
    description:
        'Olive green theme, created from primary light and dark colors.',
    light: myScheme2Light,
    dark: myScheme2Dark,
  ),
  // We also do the same for our 3rd custom scheme, BUT we create its matching
  // dark colors, from the light FlexSchemeColor with the toDark method.
  FlexSchemeData(
    name: 'Oregon orange',
    description: 'Custom orange and blue theme, from only light scheme colors.',
    light: myScheme3Light,
    // We create the dark desaturated colors from the light scheme.
    dark: myScheme3Light.toDark(),
  ),
];

class DemoApp extends StatefulWidget {
  const DemoApp({Key? key}) : super(key: key);

  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  // Used to select if we use the dark or light theme.
  ThemeMode themeMode = ThemeMode.light;

  // Used to select which FlexSchemeData we use in our list of schemes.
  int themeIndex = 7; // Start with deep blue sea.

  // Enum used to control the level of primary color surface branding applied
  // to surfaces and backgrounds.
  FlexSurface flexSurface = FlexSurface.medium;

  // Enum used to select what app bar style we use.
  FlexAppBarStyle flexAppBarStyle = FlexAppBarStyle.primary;

  // Used to modify the themed app bar elevation.
  double appBarElevation = 0;

  // Used to control if we use one or two toned status bar.
  bool transparentStatusBar = false;

  // Enum used to select what tab bar style we use.
  FlexTabBarStyle flexTabBarStyle = FlexTabBarStyle.forAppBar;

  // If true, tooltip theme background will be light in light theme, and dark
  // in dark themes. The Flutter and Material default and standard is the other
  // way, tooltip background color is inverted compared to app background.
  // Set to true, to mimic e.g. the look of Windows desktop tooltips. You
  // could tie this to the active platform and have different style of tooltips
  // on different platforms.
  bool tooltipsMatchBackground = false;

  // Allow toggling between normal dark mode and true black dark mode.
  bool darkIsTrueBlack = false;

  // Allow toggling between using the actual defined dark color scheme or try
  // how it would look if we had not defined the dark colors, but had been lazy
  // and just created the dark scheme from the light scheme with the toDark()
  // method.
  bool useToDarkMethod = false;

  // The 'level' of white blend percentage used when computing dark scheme
  // colors from the light scheme colors with the toDark method.
  int level = 35;

  // Use the toTheme method to create Themes from [FlexColorScheme]. This
  // is the preferred method when using [FlexColorScheme]. In this demo
  // you can use a toggle to see what a FlexColorScheme looks like if you just
  // return its color scheme and use [ThemeData.from] to instead create your
  // theme.
  bool useToThemeMethod = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlexColorScheme',
      // Define the light theme for the app, using current theme index, selected
      // surface style and app bar style. With the built in 20 themes and the
      // custom ones we defined above, we can use 23 different app themes via
      // the definition below, times the surface styles and app bar variants.
      // The factory FlexColorScheme.light is used to define a FlexColorScheme
      // for a light theme, from the light FlexSchemeColor plus some other theme
      // factory properties, like the surface and app bar style used in
      // this example as well as the tooltip and true black setting for the dark
      // theme.
      // Lastly the method .toTheme is used to create the slightly opinionated
      // theme from the defined color scheme.
      //
      // In this example we also demonstrate how to create the same theme with
      // the standard from color scheme ThemeData factory. The surface style
      // works, but will not be applied as elegantly, but it works fairly OK up
      // to medium blend. The app bar style has no effect here, nor the tooltip
      // style. We also have to make sure we use the same typography as the one
      // used in FlexColorScheme, otherwise the animated theme will show an
      // assertion error as it cannot animate between different typography or
      // null default typography in the theme data.
      //
      // When toggling between the standard ThemeData.from and the
      // FlexColorScheme.toTheme we can observe the differences and also see
      // some of the colors the standard method does not fully adjust to match
      // the used color scheme.
      theme: useToThemeMethod
          ? FlexColorScheme.light(
              colors: myFlexSchemes[themeIndex].light,
              surfaceStyle: flexSurface,
              appBarStyle: flexAppBarStyle,
              appBarElevation: appBarElevation,
              transparentStatusBar: transparentStatusBar,
              tabBarStyle: flexTabBarStyle,
              tooltipsMatchBackground: tooltipsMatchBackground,
              visualDensity: FlexColorScheme.comfortablePlatformDensity,
              fontFamily: AppFonts.mainFont,
            ).toTheme
          // The default ThemeData.from method as an option, for demo and
          // comparison purposes. It will not not be fully color scheme colored,
          // nor will it look as nice and balanced when color branding is used.
          : ThemeData.from(
              textTheme: ThemeData(
                brightness: Brightness.light,
                fontFamily: AppFonts.mainFont,
              ).textTheme,
              colorScheme: FlexColorScheme.light(
                colors: myFlexSchemes[themeIndex].light,
                surfaceStyle: flexSurface,
                appBarStyle: flexAppBarStyle,
                appBarElevation: appBarElevation,
                transparentStatusBar: transparentStatusBar,
                tabBarStyle: flexTabBarStyle,
                tooltipsMatchBackground: tooltipsMatchBackground,
                visualDensity: FlexColorScheme.comfortablePlatformDensity,
                fontFamily: AppFonts.mainFont,
              ).toScheme,
            ).copyWith(
              visualDensity: FlexColorScheme.comfortablePlatformDensity,
              typography: Typography.material2018(
                platform: defaultTargetPlatform,
              ),
            ),
      // We do the exact same definition for the dark theme, but using
      // FlexColorScheme.dark factory and the dark FlexSchemeColor and we add
      // the true black option as well and the feature to demonstrate
      // the usage of computed dark schemes.
      darkTheme: useToThemeMethod
          ? FlexColorScheme.dark(
              colors: useToDarkMethod
                  ? myFlexSchemes[themeIndex].light.defaultError.toDark(level)
                  : myFlexSchemes[themeIndex].dark,
              surfaceStyle: flexSurface,
              appBarStyle: flexAppBarStyle,
              appBarElevation: appBarElevation,
              transparentStatusBar: transparentStatusBar,
              tabBarStyle: flexTabBarStyle,
              tooltipsMatchBackground: tooltipsMatchBackground,
              darkIsTrueBlack: darkIsTrueBlack,
              visualDensity: FlexColorScheme.comfortablePlatformDensity,
              fontFamily: AppFonts.mainFont,
            ).toTheme
          : ThemeData.from(
              textTheme: ThemeData(
                brightness: Brightness.dark,
                fontFamily: AppFonts.mainFont,
              ).textTheme,
              colorScheme: FlexColorScheme.dark(
                colors: useToDarkMethod
                    ? myFlexSchemes[themeIndex].light.defaultError.toDark(level)
                    : myFlexSchemes[themeIndex].dark,
                surfaceStyle: flexSurface,
                appBarStyle: flexAppBarStyle,
                appBarElevation: appBarElevation,
                transparentStatusBar: transparentStatusBar,
                tabBarStyle: flexTabBarStyle,
                tooltipsMatchBackground: tooltipsMatchBackground,
                darkIsTrueBlack: darkIsTrueBlack,
                visualDensity: FlexColorScheme.comfortablePlatformDensity,
                fontFamily: AppFonts.mainFont,
              ).toScheme,
            ).copyWith(
              visualDensity: FlexColorScheme.comfortablePlatformDensity,
              typography: Typography.material2018(
                platform: defaultTargetPlatform,
              ),
            ),
      // Use the above dark or light theme based on active themeMode.
      themeMode: themeMode,
      // This simple example app has only one page.
      home: HomePage(
        // We pass it the current theme mode.
        themeMode: themeMode,
        // On the home page we toggle theme mode between light and dark.
        onThemeModeChanged: (ThemeMode mode) {
          setState(() {
            themeMode = mode;
          });
        },
        // We pass it the index of the active theme.
        schemeIndex: themeIndex,
        // We can select a new theme and get its index back.
        onSchemeChanged: (int index) {
          setState(() {
            themeIndex = index;
          });
        },
        // We pass in the current surface and background style.
        themeSurface: flexSurface,
        // And select a new surface and background style.
        onThemeSurfaceChanged: (FlexSurface surface) {
          setState(() {
            flexSurface = surface;
          });
        },
        // We pass in the active app bar style.
        appBarStyle: flexAppBarStyle,
        // And select a new app bar style.
        onAppBarStyleChanged: (FlexAppBarStyle style) {
          setState(() {
            flexAppBarStyle = style;
          });
        },
        // We pass in the active status bar transparency.
        transparentStatusBar: transparentStatusBar,
        // And select a new transparency.
        onTransparentStatusBarChanged: (bool value) {
          setState(() {
            transparentStatusBar = value;
          });
        },
        // We pass in the current app bar elevation level
        appBarElevation: appBarElevation,
        // And use the new white elevation value.
        onAppBarElevationChanged: (double value) {
          setState(() {
            appBarElevation = value;
          });
        },
        // We pass in the active tab bar style.
        tabBarStyle: flexTabBarStyle,
        // And select a new tab bar style.
        onTabBarStyleChanged: (FlexTabBarStyle style) {
          setState(() {
            flexTabBarStyle = style;
          });
        },
        // We pass in the current tooltip style.
        tooltipsMatchBackground: tooltipsMatchBackground,
        // And toggle the tooltip style.
        onTooltipsMatchBackgroundChanged: (bool value) {
          setState(() {
            tooltipsMatchBackground = value;
          });
        },
        // We pass in the current true black value.
        darkIsTrueBlack: darkIsTrueBlack,
        // And toggle the dark mode's true black value.
        onDarkIsTrueBlackChanged: (bool value) {
          setState(() {
            darkIsTrueBlack = value;
          });
        },
        // We pass in the current dark scheme creation method
        useToDark: useToDarkMethod,
        // And toggle the dark scheme creation method.
        onUseToDarkChanged: (bool value) {
          setState(() {
            useToDarkMethod = value;
          });
        },
        // We pass in the current dark scheme level
        whiteBlend: level,
        // And use the new white blend level value.
        onWhiteBlendChanged: (int value) {
          setState(() {
            level = value;
          });
        },
        // We pass in the current theme creation method
        useToTheme: useToThemeMethod,
        // And toggle the theme creation method.
        onUseToThemeChanged: (bool value) {
          setState(() {
            useToThemeMethod = value;
          });
        },
        // Pass in the FlexSchemeData we used for the active theme. Not really
        // needed to use FlexColorScheme, but we will use it to show the
        // active theme's name, descriptions and colors in the demo.
        // We also use it for the theme mode switch that shows the theme's
        // color's in the different theme modes.
        // We use copyWith to modify the dark scheme to the colors we get from
        // toggling the switch for computed dark colors or the actual defined
        // dark colors.
        flexSchemeData: myFlexSchemes[themeIndex].copyWith(
            dark: useToDarkMethod
                ? myFlexSchemes[themeIndex].light.defaultError.toDark(level)
                : myFlexSchemes[themeIndex].dark),
      ),
    );
  }
}

// The content of the HomePage below is not relevant for using FlexColorScheme
// based application theming. The critical parts are in the above MaterialApp
// theme definitions. The HomePage just contains UI to visually show what the
// defined example looks like in an application and with commonly used Widgets.
class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.themeMode,
    required this.onThemeModeChanged,
    required this.schemeIndex,
    required this.onSchemeChanged,
    required this.themeSurface,
    required this.onThemeSurfaceChanged,
    required this.appBarStyle,
    required this.onAppBarStyleChanged,
    required this.transparentStatusBar,
    required this.onTransparentStatusBarChanged,
    required this.appBarElevation,
    required this.onAppBarElevationChanged,
    required this.tabBarStyle,
    required this.onTabBarStyleChanged,
    required this.tooltipsMatchBackground,
    required this.onTooltipsMatchBackgroundChanged,
    required this.darkIsTrueBlack,
    required this.onDarkIsTrueBlackChanged,
    required this.useToDark,
    required this.onUseToDarkChanged,
    required this.whiteBlend,
    required this.onWhiteBlendChanged,
    required this.useToTheme,
    required this.onUseToThemeChanged,
    required this.flexSchemeData,
  }) : super(key: key);
  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;
  final int schemeIndex;
  final ValueChanged<int> onSchemeChanged;
  final FlexSurface themeSurface;
  final ValueChanged<FlexSurface> onThemeSurfaceChanged;
  final FlexAppBarStyle appBarStyle;
  final ValueChanged<FlexAppBarStyle> onAppBarStyleChanged;
  final bool transparentStatusBar;
  final ValueChanged<bool> onTransparentStatusBarChanged;
  final double appBarElevation;
  final ValueChanged<double> onAppBarElevationChanged;
  final FlexTabBarStyle tabBarStyle;
  final ValueChanged<FlexTabBarStyle> onTabBarStyleChanged;
  final bool tooltipsMatchBackground;
  final ValueChanged<bool> onTooltipsMatchBackgroundChanged;
  final bool darkIsTrueBlack;
  final ValueChanged<bool> onDarkIsTrueBlackChanged;
  final bool useToDark;
  final ValueChanged<bool> onUseToDarkChanged;
  final int whiteBlend;
  final ValueChanged<int> onWhiteBlendChanged;
  final bool useToTheme;
  final ValueChanged<bool> onUseToThemeChanged;
  final FlexSchemeData flexSchemeData;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // The reason for example 5 using a stateful widget is that it holds the
  // state of the dummy side menu/rail locally. All state concerning the
  // application theme are in this example also held by the stateful MaterialApp
  // widget, and values are passed in and changed via ValueChanged callbacks.
  double currentSidePanelWidth = AppConst.expandWidth;
  bool isSidePanelExpanded = true;
  bool showSidePanel = true;
  // The state for the system navbar style and divider usage is local as it is
  // is only used by the AnnotatedRegion, not by FlexColorScheme.toTheme.
  // Used to control system navbar style via an AnnotatedRegion.
  FlexSystemNavBarStyle systemNavBarStyle = FlexSystemNavBarStyle.background;
  // Used to control if we have a top divider on the system navigation bar.
  bool useSysNavDivider = false;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData media = MediaQuery.of(context);
    final double topPadding = media.padding.top;
    final double bottomPadding = media.padding.bottom;
    final bool menuAvailable = media.size.width > 650;
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final TextTheme textTheme = theme.textTheme;
    final TextStyle headline4 = textTheme.headline4!;
    final Color appBarColor = theme.appBarTheme.color ?? theme.primaryColor;
    final bool isLight = Theme.of(context).brightness == Brightness.light;

    // Give the width of the side panel some automatic adaptive behavior and
    // make it rail sized when there is not enough room for a menu, even if
    // menu size is requested.
    if (!menuAvailable && showSidePanel) {
      currentSidePanelWidth = AppConst.shrinkWidth;
    }
    if (menuAvailable && showSidePanel && !isSidePanelExpanded) {
      currentSidePanelWidth = AppConst.shrinkWidth;
    }
    if (menuAvailable && showSidePanel && isSidePanelExpanded) {
      currentSidePanelWidth = AppConst.expandWidth;
    }

    // FlexSurface enum to widget map, used in a CupertinoSegment control.
    const Map<FlexSurface, Widget> themeSurface = <FlexSurface, Widget>{
      FlexSurface.material: Padding(
        padding: EdgeInsets.all(5),
        child: Text(
          'Default\ndesign',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 11),
        ),
      ),
      FlexSurface.light: Padding(
        padding: EdgeInsets.all(5),
        child: Text(
          'Light\nprimary',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 11),
        ),
      ),
      FlexSurface.medium: Padding(
        padding: EdgeInsets.all(5),
        child: Text(
          'Medium\nprimary',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 11),
        ),
      ),
      FlexSurface.strong: Padding(
        padding: EdgeInsets.all(5),
        child: Text(
          'Strong\nprimary',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 11),
        ),
      ),
      FlexSurface.heavy: Padding(
        padding: EdgeInsets.all(5),
        child: Text(
          'Heavy\nprimary',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 11),
        ),
      ),
    };

    // FlexAppBarStyle enum to widget map, used in a CupertinoSegment control.
    const Map<FlexAppBarStyle, Widget> themeAppBar = <FlexAppBarStyle, Widget>{
      FlexAppBarStyle.primary: Padding(
        padding: EdgeInsets.all(5),
        child: Text(
          'Primary\ncolor',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 11),
        ),
      ),
      FlexAppBarStyle.material: Padding(
        padding: EdgeInsets.all(5),
        child: Text(
          // Wait, what is \u{00AD} below?? It is Unicode char-code for an
          // invisible soft hyphen. It can be used to guide text layout where
          // it can break a word to the next line, if it has to. On small phones
          // or a desktop builds where you can make the UI really narrow in
          // Flutter, you can observe this with the 'background' word below.
          'Default\nback\u{00AD}ground',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 11),
        ),
      ),
      FlexAppBarStyle.surface: Padding(
        padding: EdgeInsets.all(5),
        child: Text(
          'Branded\nsurface',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 11),
        ),
      ),
      FlexAppBarStyle.background: Padding(
        padding: EdgeInsets.all(5),
        child: Text(
          'Branded\nback\u{00AD}ground',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 11),
        ),
      ),
      FlexAppBarStyle.custom: Padding(
        padding: EdgeInsets.all(5),
        child: Text(
          'Custom\ncolor',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 11),
        ),
      ),
    };

    // FlexSystemNavBarStyle enum to widget map, used in a CupertinoSegment.
    const Map<FlexSystemNavBarStyle, Widget> systemNavBar =
        <FlexSystemNavBarStyle, Widget>{
      FlexSystemNavBarStyle.system: Padding(
        padding: EdgeInsets.all(5),
        child: Text(
          'System',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 11),
        ),
      ),
      FlexSystemNavBarStyle.surface: Padding(
        padding: EdgeInsets.all(5),
        child: Text(
          'Surface',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 11),
        ),
      ),
      FlexSystemNavBarStyle.background: Padding(
        padding: EdgeInsets.all(5),
        child: Text(
          'Back\u{00AD}ground',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 11),
        ),
      ),
      FlexSystemNavBarStyle.scaffoldBackground: Padding(
        padding: EdgeInsets.all(5),
        child: Text(
          'Scaffold\nback\u{00AD}ground',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 11),
        ),
      ),
      FlexSystemNavBarStyle.transparent: Padding(
        padding: EdgeInsets.all(5),
        child: Text(
          'Trans\u{00AD}parent',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 11),
        ),
      ),
    };

    // FlexTabBarStyle enum to widget map, used in a CupertinoSegment control.
    const Map<FlexTabBarStyle, Widget> themeTabBar = <FlexTabBarStyle, Widget>{
      FlexTabBarStyle.forAppBar: Padding(
        padding: EdgeInsets.all(5),
        child: Text(
          'TabBar used\nin AppBar',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 11),
        ),
      ),
      FlexTabBarStyle.forBackground: Padding(
        padding: EdgeInsets.all(5),
        child: Text(
          'TabBar used\non background',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 11),
        ),
      ),
    };

    return AnnotatedRegion<SystemUiOverlayStyle>(
      // FlexColorScheme contains a helper that can be use to theme
      // the system navigation bar using an AnnotatedRegion. Without this
      // page wrapper the system navigation bar in Android will not change
      // theme color as we change themes for the page. This is a
      // Flutter "feature", but with this annotated region we can have the
      // navigation bar follow desired background color and theme-mode,
      // which looks nicer and more as it should on an Android device.
      value: FlexColorScheme.themedSystemNavigationBar(
        context,
        systemNavBarStyle: systemNavBarStyle,
        useDivider: useSysNavDivider,
      ),
      child: Row(
        children: <Widget>[
          // Contains the demo menu and side rail.
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: AppConst.expandWidth),
            child: Material(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: currentSidePanelWidth,
                child: SideMenu(
                  isVisible: showSidePanel,
                  menuWidth: AppConst.expandWidth,
                ),
              ),
            ),
          ),
          // The actual page content is a normal Scaffold.
          Expanded(
            child: Scaffold(
              // For scrolling behind the app bar
              extendBodyBehindAppBar: true,
              // For scrolling behind the bottom nav bar, if there would be one.
              extendBody: true,
              appBar: AppBar(
                // title: const Text('FlexColorScheme Example 5'),
                title: const Text('FlexColorScheme Example 5'),
                actions: const <Widget>[AboutIconButton()],
                backgroundColor: Colors.transparent,
                // Gradient partially transparent AppBar, just because it looks
                // nice and we can see content scroll behind it.
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Theme.of(context).dividerColor),
                    ),
                    gradient: LinearGradient(
                      begin: AlignmentDirectional.centerStart,
                      end: AlignmentDirectional.centerEnd,
                      colors: <Color>[
                        appBarColor,
                        appBarColor.withOpacity(0.85),
                      ],
                    ),
                  ),
                ),
              ),
              body: PageBody(
                child: ListView(
                  padding: EdgeInsets.fromLTRB(
                    AppConst.edgePadding,
                    topPadding + kToolbarHeight + AppConst.edgePadding,
                    AppConst.edgePadding,
                    AppConst.edgePadding + bottomPadding,
                  ),
                  children: <Widget>[
                    Text('Theme', style: headline4),
                    const Text(
                      'This example shows how you can use all the built in '
                      'color schemes in FlexColorScheme to define themes '
                      'from them and how you can make your own custom '
                      'scheme colors and use them together with the '
                      'predefined ones.\n\n'
                      'The example also shows how to use the surface '
                      'branding feature and the app bar theme '
                      'options in FlexColorScheme. The usage of the '
                      'true black option for dark themes is also '
                      'demonstrated.\n\n'
                      'The example includes a dummy responsive side menu and '
                      'rail to give a visual example of what applications '
                      'that have larger visible surfaces using surface '
                      'branding may look like. '
                      'A theme showcase widget shows the active theme with '
                      'several common Material widgets.\n',
                    ),
                    Text('${widget.flexSchemeData.name} theme',
                        style: textTheme.headline5),
                    // A 3-way theme mode toggle switch.
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: AppConst.edgePadding),
                      child: FlexThemeModeSwitch(
                        themeMode: widget.themeMode,
                        onThemeModeChanged: widget.onThemeModeChanged,
                        flexSchemeData: widget.flexSchemeData,
                        // Style the selected theme mode's label
                        selectedLabelStyle: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                    const Divider(),

                    // Popup menu button to select color scheme.
                    PopupMenuButton<int>(
                      padding: EdgeInsets.zero,
                      onSelected: widget.onSchemeChanged,
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuItem<int>>[
                        for (int i = 0; i < myFlexSchemes.length; i++)
                          PopupMenuItem<int>(
                            value: i,
                            child: ListTile(
                              leading: Icon(Icons.lens,
                                  color: isLight
                                      ? myFlexSchemes[i].light.primary
                                      : myFlexSchemes[i].dark.primary,
                                  size: 35),
                              title: Text(myFlexSchemes[i].name),
                            ),
                          )
                      ],
                      child: ListTile(
                        title: Text('${widget.flexSchemeData.name} theme'),
                        subtitle: Text(widget.flexSchemeData.description),
                        trailing: Icon(
                          Icons.lens,
                          color: colorScheme.primary,
                          size: 40,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Active theme color indicators.
                    const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppConst.edgePadding),
                      child: ShowThemeColors(),
                    ),
                    const SizedBox(height: 8),
                    // Open a sub-page
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
                    const Divider(),
                    // const SizedBox(height: 8),
                    SwitchListTile.adaptive(
                      title: const Text('Compute dark theme'),
                      subtitle: const Text(
                        'From the light scheme, instead '
                        'of using a dark scheme.',
                      ),
                      value: widget.useToDark,
                      onChanged: widget.onUseToDarkChanged,
                    ),
                    // White blend slider in a ListTile.
                    ListTile(
                      title: Slider.adaptive(
                        max: 100,
                        divisions: 100,
                        label: widget.whiteBlend.toString(),
                        value: widget.whiteBlend.toDouble(),
                        onChanged: (double value) {
                          widget.onWhiteBlendChanged(value.floor().toInt());
                        },
                      ),
                      trailing: Padding(
                        padding: const EdgeInsetsDirectional.only(end: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              'LEVEL',
                              style: Theme.of(context).textTheme.caption,
                            ),
                            Text(
                              '${widget.whiteBlend} %',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Set dark mode to use true black!
                    SwitchListTile.adaptive(
                      title: const Text('Dark mode uses true black'),
                      subtitle: const Text(
                        'Keep OFF for normal dark mode.',
                      ),
                      value: widget.darkIsTrueBlack,
                      onChanged: widget.onDarkIsTrueBlackChanged,
                    ),
                    // Set to make dark scheme lazily for light theme

                    // Surface style selector.
                    const SizedBox(height: 8),
                    const ListTile(
                      title: Text('Branded surface and background'),
                      subtitle: Text(
                        'Default Material design uses white and dark surface '
                        'colors. With the light, medium, heavy '
                        'and strong branding, you can blend primary '
                        'color into surface and background colors with '
                        'increasing strength.',
                      ),
                    ),
                    const SizedBox(height: 4),
                    CupertinoSegmentedControl<FlexSurface>(
                      children: themeSurface,
                      groupValue: widget.themeSurface,
                      onValueChanged: widget.onThemeSurfaceChanged,
                      borderColor: isLight
                          ? colorScheme.primary
                          : theme.primaryColorLight,
                      selectedColor: isLight
                          ? colorScheme.primary
                          : theme.primaryColorLight,
                      unselectedColor: theme.cardColor,
                    ),
                    const SizedBox(height: 8),
                    const ListTile(
                      title: Text('App bar theme'),
                      subtitle: Text(
                        'Flutter ColorScheme themes have a primary '
                        'colored app bar in light mode, and a background '
                        'colored one in dark mode. With FlexColorScheme '
                        'you can choose if it should be primary, background, '
                        'surface or a custom color. The predefined schemes '
                        'use their secondary variant color as the custom '
                        'color for the app bar theme, but it can be any color.',
                      ),
                    ),
                    const SizedBox(height: 4),
                    // AppBar style
                    CupertinoSegmentedControl<FlexAppBarStyle>(
                      children: themeAppBar,
                      groupValue: widget.appBarStyle,
                      onValueChanged: widget.onAppBarStyleChanged,
                      borderColor: isLight
                          ? colorScheme.primary
                          : theme.primaryColorLight,
                      selectedColor: isLight
                          ? colorScheme.primary
                          : theme.primaryColorLight,
                      unselectedColor: theme.cardColor,
                    ),
                    const SizedBox(height: 8),
                    // Theme creation method.
                    SwitchListTile.adaptive(
                      title: const Text(
                        'One toned AppBar with transparent status bar',
                      ),
                      subtitle: const Text(
                        'If ON there is no scrim on the status bar. '
                        'Turn OFF for normal two toned AppBar on Android.',
                      ),
                      value: widget.transparentStatusBar,
                      onChanged: widget.onTransparentStatusBarChanged,
                    ),
                    // AppBar elevation value in a ListTile.
                    ListTile(
                      title: const Text('App bar themed elevation'),
                      subtitle: Slider.adaptive(
                        max: 30,
                        divisions: 30,
                        label: widget.appBarElevation.floor().toString(),
                        value: widget.appBarElevation.roundToDouble(),
                        onChanged: widget.onAppBarElevationChanged,
                      ),
                      trailing: Text(
                        '${widget.appBarElevation.floor()}',
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const ListTile(
                      title: Text('System navigation bar style'),
                      subtitle: Text(
                        'Styled with annotated region. '
                        'System is white in light theme and black in dark. '
                        'Others use their respective theme '
                        'color. Transparent show background with system '
                        'navigation buttons on background.\n',
                      ),
                    ),
                    // AppBar style
                    CupertinoSegmentedControl<FlexSystemNavBarStyle>(
                      children: systemNavBar,
                      groupValue: systemNavBarStyle,
                      onValueChanged: (FlexSystemNavBarStyle value) {
                        setState(() {
                          systemNavBarStyle = value;
                        });
                      },
                      borderColor: isLight
                          ? colorScheme.primary
                          : theme.primaryColorLight,
                      selectedColor: isLight
                          ? colorScheme.primary
                          : theme.primaryColorLight,
                      unselectedColor: theme.cardColor,
                    ),
                    // System navbar has divider or not?
                    SwitchListTile.adaptive(
                      title: const Text(
                        'System navbar has divider',
                      ),
                      value: useSysNavDivider,
                      onChanged: (bool value) {
                        setState(() {
                          useSysNavDivider = value;
                        });
                      },
                    ),
                    const ListTile(
                      title: Text('Tab bar theme'),
                      subtitle: Text(
                        'Choose the style that fit best with where '
                        'you primarily intend to use the TabBar.',
                      ),
                    ),
                    const SizedBox(height: 4),
                    // AppBar style
                    CupertinoSegmentedControl<FlexTabBarStyle>(
                      children: themeTabBar,
                      groupValue: widget.tabBarStyle,
                      onValueChanged: widget.onTabBarStyleChanged,
                      borderColor: isLight
                          ? colorScheme.primary
                          : theme.primaryColorLight,
                      selectedColor: isLight
                          ? colorScheme.primary
                          : theme.primaryColorLight,
                      unselectedColor: theme.cardColor,
                    ),
                    const SizedBox(height: 8),
                    // Tooltip theme style.
                    Tooltip(
                      message: 'A tooltip, on the tooltip style toggle',
                      child: SwitchListTile.adaptive(
                        title: const Text(
                          'Tooltips are light on light, and dark on dark',
                        ),
                        subtitle: const Text(
                          "Keep OFF to use Material's default inverted "
                          'background style.',
                        ),
                        value: widget.tooltipsMatchBackground,
                        onChanged: widget.onTooltipsMatchBackgroundChanged,
                      ),
                    ),
                    const Divider(),
                    // Theme creation method.
                    SwitchListTile.adaptive(
                      title: const Text(
                        'Theme with FlexColorScheme.toTheme',
                      ),
                      subtitle: const Text(
                        'Turn OFF to make the theme with the '
                        'ThemeData.from factory.\n'
                        'NOT recommended, but try it in this demo '
                        'to see the differences.',
                      ),
                      value: widget.useToTheme,
                      onChanged: widget.onUseToThemeChanged,
                    ),
                    const Divider(),
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
                        'Using setEnabledSystemUIOverlays([])',
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        SplashPageTwo.show(context, true);
                      },
                    ),
                    const Divider(),
                    Text('Menu', style: headline4),
                    const Text(
                      'The menu is a just a demo to make a larger '
                      'area that uses the primary branded background color.',
                    ),
                    SwitchListTile.adaptive(
                      title: const Text('Turn ON to show the menu'),
                      subtitle: const Text('Turn OFF to hide the menu.'),
                      value: showSidePanel,
                      onChanged: (bool value) {
                        setState(() {
                          showSidePanel = value;
                          if (showSidePanel) {
                            if (isSidePanelExpanded) {
                              currentSidePanelWidth = AppConst.expandWidth;
                            } else {
                              currentSidePanelWidth = AppConst.shrinkWidth;
                            }
                          } else {
                            currentSidePanelWidth = 0.01;
                          }
                        });
                      },
                    ),
                    SwitchListTile.adaptive(
                      title: const Text('Turn ON for full sized menu'),
                      subtitle: const Text(
                        'Turn OFF for a rail sized menu. '
                        'The full size menu will only be shown when '
                        'screen width is above 650 dp and this toggle is ON.',
                      ),
                      value: isSidePanelExpanded,
                      onChanged: (bool value) {
                        setState(() {
                          isSidePanelExpanded = value;
                          if (showSidePanel) {
                            if (isSidePanelExpanded) {
                              currentSidePanelWidth = AppConst.expandWidth;
                            } else {
                              currentSidePanelWidth = AppConst.shrinkWidth;
                            }
                          } else {
                            currentSidePanelWidth = 0.01;
                          }
                        });
                      },
                    ),
                    const Divider(),
                    Text('Theme Showcase', style: headline4),
                    const ThemeShowcase(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
