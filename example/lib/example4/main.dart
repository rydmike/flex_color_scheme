import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../shared/constants.dart';
import '../shared/flex_theme_mode_switch.dart';
import '../shared/page_body.dart';
import '../shared/show_theme_colors.dart';
import '../shared/theme_showcase.dart';

void main() => runApp(const DemoApp());

// -----------------------------------------------------------------------------
// EXAMPLE 4)
//
// This example shows how you can use all the built in color schemes in
// FlexColorScheme to interactively select which one of the built in schemes is
// used to define the active theme.
// The example also uses medium strength branded background and surface colors.
// A theme showcase widget shows the theme with several common Material widgets.
// -----------------------------------------------------------------------------

class DemoApp extends StatefulWidget {
  const DemoApp({Key key}) : super(key: key);

  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  // Used to select if we use the dark or light theme.
  ThemeMode themeMode;
  // Used to select which FlexSchemeData we use.
  int themeIndex;

  @override
  void initState() {
    themeMode = ThemeMode.light;
    themeIndex = 6; // Start with index 6, should be the brand blue colors
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlexColorScheme',
      // Define the light theme for the app, using current theme index and
      // medium branded surfaces. Then use the .toTheme method to create and
      // return a slightly opinionated theme using these properties.
      theme: FlexColorScheme.light(
        colors: FlexColor.schemesList[themeIndex].light,
        surfaceStyle: FlexSurface.medium,
      ).toTheme,
      // We do the exact same definition for the dark theme, but using
      // FlexColorScheme.dark factory and the dark FlexSchemeColor instead.
      darkTheme: FlexColorScheme.dark(
        colors: FlexColor.schemesList[themeIndex].dark,
        surfaceStyle: FlexSurface.medium,
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
        // Pass in the FlexSchemeData we use for active theme. Not really
        // needed to use FlexColorScheme, but we will use it to show the
        // active theme's name, descriptions and colors in the demo.
        // We also use it for a custom theme mode switch that shows the theme's
        // color's in the different theme modes.
        flexSchemeData: FlexColor.schemesList[themeIndex],
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
              elevation: 0,
            ),
            body: PageBody(
              child: ListView(
                padding: const EdgeInsets.all(kEdgePadding),
                children: <Widget>[
                  Text('Theme', style: headline4),
                  const Text(
                    'This example shows how you can use all the built in '
                    'color schemes in FlexColorScheme to interactively '
                    'select which one of the built in schemes is used to '
                    'define the active theme.\n'
                    'The example also uses medium strength branded '
                    'background and surface colors. '
                    'A theme showcase widget shows the theme with several '
                    'common Material widgets.',
                  ),
                  // A 3-way theme mode toggle switch.
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: kEdgePadding),
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
                      for (int i = 0; i < FlexColor.schemesList.length; i++)
                        PopupMenuItem<int>(
                          value: i,
                          child: ListTile(
                            leading: Icon(Icons.lens,
                                color: isLight
                                    ? FlexColor.schemesList[i].light.primary
                                    : FlexColor.schemesList[i].dark.primary,
                                size: 35),
                            title: Text(FlexColor.schemesList[i].name),
                          ),
                        )
                    ],
                    child: ListTile(
                      title: Text(
                          '${FlexColor.schemesList[schemeIndex].name} theme'),
                      subtitle:
                          Text(FlexColor.schemesList[schemeIndex].description),
                      trailing: Icon(
                        Icons.lens,
                        color: colorScheme.primary,
                        size: 40,
                      ),
                    ),
                  ),
                  //
                  // Active theme color indicators.
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: kEdgePadding),
                    child: ShowThemeColors(),
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
