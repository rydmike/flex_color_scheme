import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../all_shared_imports.dart';

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

// Create a custom flex color scheme for a light theme.
const FlexSchemeColor myScheme1Light = FlexSchemeColor(
  primary: Color(0xFF4E0028),
  primaryVariant: Color(0xFF320019),
  secondary: Color(0xFF003419),
  secondaryVariant: Color(0xFF002411),
  // The built in color schemes use their secondary variant color as their
  // custom app bar color, it could of course be any color, but for consistency
  // we will do the same in this custom FlexSchemeColor.
  appBarColor: Color(0xFF002411),
);
// Create a corresponding custom flex color scheme for a dark theme.
const FlexSchemeColor myScheme1Dark = FlexSchemeColor(
  primary: Color(0xFF9E7389),
  primaryVariant: Color(0xFF775C69),
  secondary: Color(0xFF738F81),
  secondaryVariant: Color(0xFF5C7267),
  // Again we use same secondaryVariant color as optional custom app bar color.
  appBarColor: Color(0xFF5C7267),
);

// You can build a scheme the long way, by specifying all the required hand
// picked scheme colors, like above. You can also build color schemes from a
// single primary color. With the [.from] factory, then the only required color
// is the primary color, the other colors will be computed. You can optionally
// also provide the primaryVariant, secondary and secondaryVariant colors with
// the factory, but any color that is not provided will always be computed for
// the full set of required colors in a FlexSchemeColor.
//
// In this example we create our 2nd scheme from just a primary color
// for the light and dark schemes. The custom app bar color will in this case
// also receive the same color value as the one that is computed for
// secondaryVariant color.
final FlexSchemeColor myScheme2Light =
    FlexSchemeColor.from(primary: const Color(0xFF4C4E06));
final FlexSchemeColor myScheme2Dark =
    FlexSchemeColor.from(primary: const Color(0xFF9D9E76));

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
    name: 'Custom purple',
    description: 'Purple theme created from custom defined colors.',
    // Flex scheme data holds separate defined color schemes for its light and
    // matching dark theme color. Dark theme colors need to be much less
    // saturated than light theme. Using the same colors in light and dark
    // theme modes does not look nice.
    light: myScheme1Light,
    dark: myScheme1Dark,
  ),
  // Do the same for our second custom scheme.
  FlexSchemeData(
    name: 'Custom olive green',
    description: 'Olive green theme created from custom primary color.',
    light: myScheme2Light,
    dark: myScheme2Dark,
  ),
];

class DemoApp extends StatefulWidget {
  const DemoApp({Key key}) : super(key: key);

  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  // Used to select if we use the dark or light theme.
  ThemeMode themeMode;

  // Used to select which FlexSchemeData we use in our list of schemes.
  int themeIndex;

  // Enum used to select what app bar style we use.
  FlexAppBarStyle flexAppBarStyle;

  // Enum used to control the level of primary color surface branding applied
  // to surfaces and backgrounds.
  FlexSurface flexSurface;

  // If true, tooltip theme background will be light in light theme, and dark
  // in dark themes. The Flutter and Material default and standard is the other
  // way, tooltip background color is inverted compared to app background.
  // Set to true, to mimic e.g. the look of Windows desktop tooltips. You
  // could tie this to the active platform and have different style of tooltips
  // on different platforms.
  bool tooltipsMatchBackground;

  // Allow toggling between normal dark mode and true black dark mode.
  bool darkIsTrueBlack;

  // Use the toTheme method to create Themes from [FlexColorScheme]. This
  // is the preferred method when using [FlexColorScheme]. In this demo
  // you can use a toggle to see what a FlexColorScheme looks like if you just
  // return its color scheme and use [ThemeData.from] to instead create your
  // theme.
  bool useToThemeMethod;

  @override
  void initState() {
    themeMode = ThemeMode.light;
    themeIndex = 21; // Start with the last index, the custom olive green one.
    flexAppBarStyle = FlexAppBarStyle.primary;
    flexSurface = FlexSurface.medium;
    tooltipsMatchBackground = false;
    darkIsTrueBlack = false;
    useToThemeMethod = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlexColorScheme',
      // Define the light theme for the app, using current theme index, selected
      // surface style and app bar style. With the built in 20 themes and the
      // custom ones we defined above, we can use 22 different app themes via
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
              tooltipsMatchBackground: tooltipsMatchBackground,
            ).toTheme
          : ThemeData.from(
              colorScheme: FlexColorScheme.light(
                colors: myFlexSchemes[themeIndex].light,
                surfaceStyle: flexSurface,
                appBarStyle: flexAppBarStyle,
                tooltipsMatchBackground: tooltipsMatchBackground,
              ).toScheme,
            ).copyWith(
              typography: Typography.material2018(
                platform: defaultTargetPlatform,
              ),
            ),
      // We do the exact same definition for the dark theme, but using
      // FlexColorScheme.dark factory and the dark FlexSchemeColor and we add
      // the true black option as well.
      //
      // In dark mode we can see many gaps in the resulting ThemeData when
      // using the standard ThemeData.from factory to create the theme.
      darkTheme: useToThemeMethod
          ? FlexColorScheme.dark(
              colors: myFlexSchemes[themeIndex].dark,
              surfaceStyle: flexSurface,
              appBarStyle: flexAppBarStyle,
              tooltipsMatchBackground: tooltipsMatchBackground,
              darkIsTrueBlack: darkIsTrueBlack,
            ).toTheme
          : ThemeData.from(
              colorScheme: FlexColorScheme.dark(
                colors: myFlexSchemes[themeIndex].dark,
                surfaceStyle: flexSurface,
                appBarStyle: flexAppBarStyle,
                tooltipsMatchBackground: tooltipsMatchBackground,
                darkIsTrueBlack: darkIsTrueBlack,
              ).toScheme,
            ).copyWith(
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
        // We pass in the active app bar style.
        appBarStyle: flexAppBarStyle,
        // And select a new app bar style.
        onAppBarStyleChanged: (FlexAppBarStyle style) {
          setState(() {
            flexAppBarStyle = style;
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
        flexSchemeData: myFlexSchemes[themeIndex],
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
    Key key,
    @required this.themeMode,
    @required this.onThemeModeChanged,
    @required this.schemeIndex,
    @required this.onSchemeChanged,
    @required this.appBarStyle,
    @required this.onAppBarStyleChanged,
    @required this.themeSurface,
    @required this.onThemeSurfaceChanged,
    @required this.tooltipsMatchBackground,
    @required this.onTooltipsMatchBackgroundChanged,
    @required this.darkIsTrueBlack,
    @required this.onDarkIsTrueBlackChanged,
    @required this.useToTheme,
    @required this.onUseToThemeChanged,
    @required this.flexSchemeData,
  }) : super(key: key);
  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;
  final int schemeIndex;
  final ValueChanged<int> onSchemeChanged;
  final FlexAppBarStyle appBarStyle;
  final ValueChanged<FlexAppBarStyle> onAppBarStyleChanged;
  final FlexSurface themeSurface;
  final ValueChanged<FlexSurface> onThemeSurfaceChanged;
  final bool tooltipsMatchBackground;
  final ValueChanged<bool> onTooltipsMatchBackgroundChanged;
  final bool darkIsTrueBlack;
  final ValueChanged<bool> onDarkIsTrueBlackChanged;
  final bool useToTheme;
  final ValueChanged<bool> onUseToThemeChanged;
  final FlexSchemeData flexSchemeData;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // The reason for example 5 using a stateful widget is that it holds the
  // state of the dummy side menu/rail locally. All state concerning the
  // application theme are in this example also held by the stateful material
  // app and values are passed in and changed via ValueChanged callbacks.
  double currentSidePanelWidth;
  bool isSidePanelExpanded;
  bool showSidePanel;

  @override
  void initState() {
    currentSidePanelWidth = AppConst.expandWidth;
    isSidePanelExpanded = true;
    showSidePanel = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData media = MediaQuery.of(context);
    final double topPadding = media.padding.top;
    final double bottomPadding = media.padding.bottom;
    final bool menuAvailable = media.size.width > 650;
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final TextTheme textTheme = theme.textTheme;
    final TextStyle headline4 = textTheme.headline4;
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
          // Wait, what is \u{00AD} below?? It is Unicode char code for an
          // invisible soft hyphen. It can be used to guide text layout where
          // it can break a word to the next line, if it has to. On small phones
          // or a desktop build where you can make the UI really narrow in
          // Flutter, you can observe this for the 'background' word below.
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

    return Row(
      children: <Widget>[
        // Contains the demo menu and side rail.
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppConst.expandWidth),
          child: Material(
            elevation: 0,
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
              title: const Text('FlexColorScheme Example 5'),
              actions: const <Widget>[AboutIconButton()],
              elevation: 0,
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
                      appBarColor.withOpacity(0.8),
                    ],
                  ),
                ),
                child: null,
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
                    'several common Material widgets.',
                  ),
                  // A 3-way theme mode toggle switch.
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: AppConst.edgePadding),
                    child: FlexThemeModeSwitch(
                      themeMode: widget.themeMode,
                      onThemeModeChanged: widget.onThemeModeChanged,
                      flexSchemeData: widget.flexSchemeData,
                    ),
                  ),
                  const Divider(),
                  // Set dark mode to use true black!
                  SwitchListTile.adaptive(
                    title: const Text('Dark mode uses true black'),
                    subtitle: const Text(
                      'Keep OFF for normal dark mode.',
                    ),
                    value: widget.darkIsTrueBlack,
                    onChanged: widget.onDarkIsTrueBlackChanged,
                  ),
                  // Popup menu button to select color scheme.
                  PopupMenuButton<int>(
                    padding: const EdgeInsets.all(0),
                    onSelected: widget.onSchemeChanged,
                    itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
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
                    padding:
                        EdgeInsets.symmetric(horizontal: AppConst.edgePadding),
                    child: ShowThemeColors(),
                  ),
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
                    borderColor:
                        isLight ? colorScheme.primary : theme.primaryColorLight,
                    selectedColor:
                        isLight ? colorScheme.primary : theme.primaryColorLight,
                    unselectedColor: theme.cardColor,
                  ),
                  const SizedBox(height: 8),
                  const ListTile(
                    title: Text('App bar theme'),
                    subtitle: Text(
                      'Material design uses a primary '
                      'colored app bar in light mode and a background '
                      'colored one in dark mode. With FlexColorScheme '
                      'you can use different defaults for the app bar and '
                      'select if it should use primary, surface or '
                      'custom colors. The predefined schemes use their '
                      'secondary variant color as the custom color for the '
                      'app bar theme, but it could be any color.',
                    ),
                  ),
                  const SizedBox(height: 4),
                  // AppBar style
                  CupertinoSegmentedControl<FlexAppBarStyle>(
                    children: themeAppBar,
                    groupValue: widget.appBarStyle,
                    onValueChanged: widget.onAppBarStyleChanged,
                    borderColor:
                        isLight ? colorScheme.primary : theme.primaryColorLight,
                    selectedColor:
                        isLight ? colorScheme.primary : theme.primaryColorLight,
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
                        'Keep OFF to use Material default inverted '
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
                      'Make the theme with FlexColorScheme toTheme method',
                    ),
                    subtitle: const Text(
                      'Turn OFF to make the theme using the standard '
                      'ThemeData from color scheme method. '
                      'NOT RECOMMENDED, but in this example you can '
                      'try it to see the differences.',
                    ),
                    value: widget.useToTheme,
                    onChanged: widget.onUseToThemeChanged,
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
                  const Divider(),
                  // A Card GridView with responsive column amount. This is
                  // just here to put some content on the page to stress it
                  // a bit during resizing and scaling and just for show
                  // in this demo.
                  Text('Cards in a Grid', style: headline4),
                  const Text('These cards are only included to provide '
                      'more demo content on the responsive main page.'),
                  const CardsGrid(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
