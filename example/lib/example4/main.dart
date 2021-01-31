import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../all_shared_imports.dart';
import '../shared/subpage.dart';

// -----------------------------------------------------------------------------
// EXAMPLE 4)
//
// This example shows how you can use all the built in color schemes in
// FlexColorScheme to define themes from them and how you can define your own
// custom scheme colors and use them together with the predefined ones.
// It can give you an idea of how you can create your own complete custom list
// of themes if you do not want to use any of the predefined ones.
//
// We keep the custom color scheme we made in example 3 and add two more custom,
// for a total of 23 usable themes that we can select from.
// The 2nd scheme we create by just defining primary color for dark and light
// scheme. The 3rd one we create by computing it from the light theme.
// The example also uses medium strength branded background and surface colors.
// A theme showcase widget shows the theme with several common Material widgets.
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
// picked scheme colors, like above, or can also build schemes from a
// single primary color. With the [.from] factory, then the only required color
// is the primary color, the other colors will be computed. You can optionally
// also provide the primaryVariant, secondary and secondaryVariant colors with
// the factory, but any color that is not provided will always be computed for
// the full set of required colors in a FlexSchemeColor.

// In this example we create our 2nd scheme from just a primary color
// for the light and dark schemes. The custom app bar color will in this case
// also receive the same color value as the one that is computed for
// secondaryVariant color, this is the default with the [from] factory.
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
    // FlexSchemeData holds separate defined color schemes for light and
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
  const DemoApp({Key key}) : super(key: key);

  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  // Used to select if we use the dark or light theme.
  ThemeMode themeMode = ThemeMode.light;
  // Used to select which FlexSchemeData we use.
  int themeIndex = 6; // Start with index 6, the brand blue colors.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlexColorScheme',
      // Define the light theme for the app, using current theme index and
      // medium branded surfaces. Then use the .toTheme method to create and
      // return a slightly opinionated theme using these properties.
      theme: FlexColorScheme.light(
        colors: myFlexSchemes[themeIndex].light,
        surfaceStyle: FlexSurface.medium,
        // Use comfortable on desktops instead of compact, devices as default.
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        fontFamily: AppFonts.mainFont,
      ).toTheme,
      // We do the exact same definition for the dark theme, but using
      // FlexColorScheme.dark factory and the dark FlexSchemeColor instead.
      darkTheme: FlexColorScheme.dark(
        colors: myFlexSchemes[themeIndex].dark,
        surfaceStyle: FlexSurface.medium,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        fontFamily: AppFonts.mainFont,
      ).toTheme,
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
        // We can pass it the index of the active theme.
        schemeIndex: themeIndex,
        // We can select a new theme and get its index back.
        onSchemeChanged: (int index) {
          setState(() {
            themeIndex = index;
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
class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
    @required this.themeMode,
    @required this.onThemeModeChanged,
    @required this.schemeIndex,
    @required this.onSchemeChanged,
    @required this.flexSchemeData,
  }) : super(key: key);
  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;
  final int schemeIndex;
  final ValueChanged<int> onSchemeChanged;
  final FlexSchemeData flexSchemeData;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final TextTheme textTheme = theme.textTheme;
    final TextStyle headline4 = textTheme.headline4;
    final bool isLight = Theme.of(context).brightness == Brightness.light;

    return Row(
      children: <Widget>[
        const SizedBox(width: 0.01),
        Expanded(
          // Wrapping the Scaffold in a Row, with an almost zero width SizedBox
          // before the Scaffold that is in an Expanded widget so it fills the
          // available screen, causes the PopupMenu to open up right aligned on
          // its ListTile child used as its activation button. Without this, it
          // is always left aligned on the ListTile and would require a
          // computed offset. This trick or maybe a bit of a hack, does it
          // automatically. No idea why, just something I noticed by accident.
          child: Scaffold(
            appBar: AppBar(
              title: const Text('FlexColorScheme Example 4'),
              actions: const <Widget>[AboutIconButton()],
            ),
            body: PageBody(
              child: ListView(
                padding: const EdgeInsets.all(AppConst.edgePadding),
                children: <Widget>[
                  Text('Theme', style: headline4),
                  const Text(
                    'This example shows how you can use all the built in '
                    'color schemes in FlexColorScheme, add 3 custom schemes to '
                    'it and how to interactively select which scheme is used '
                    'to define the active theme.\n\n'
                    'The example also uses medium strength branded '
                    'background and surface colors. '
                    'A theme showcase widget shows the theme with several '
                    'common Material widgets.',
                  ),
                  // A 3-way theme mode toggle switch.
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: AppConst.edgePadding),
                    child: FlexThemeModeSwitch(
                      themeMode: themeMode,
                      onThemeModeChanged: onThemeModeChanged,
                      flexSchemeData: flexSchemeData,
                    ),
                  ),
                  const Divider(),
                  // Popup menu button to select color scheme.
                  PopupMenuButton<int>(
                    padding: const EdgeInsets.all(0),
                    onSelected: onSchemeChanged,
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
                      title: Text('${myFlexSchemes[schemeIndex].name} theme'),
                      subtitle: Text(myFlexSchemes[schemeIndex].description),
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
                  const SizedBox(height: 8),
                  // Open a sub-page
                  ListTile(
                    title: const Text('Open a demo subpage'),
                    subtitle: const Text(
                      'The subpage will use the same '
                      'color scheme based theme automatically.',
                    ),
                    trailing: const Icon(Icons.chevron_right, size: 34),
                    onTap: () {
                      Subpage.show(context);
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
    );
  }
}
