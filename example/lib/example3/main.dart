import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../all_shared_imports.dart';

// -----------------------------------------------------------------------------
// EXAMPLE 3)
//
// This example shows how you can use three built in color schemes and
// a custom scheme as selectable FlexColorScheme based theme options in an
// application. The example also uses strong branded surface colors.
// A theme showcase widget shows the theme with several common Material widgets.
// -----------------------------------------------------------------------------

void main() => runApp(const DemoApp());

// Create a custom FlexSchemeData scheme with name, description and a light
// and dark FlexSchemeColor.
const FlexSchemeData customFlexScheme = FlexSchemeData(
  name: 'Custom purple',
  description: 'Purple theme created from custom defined colors.',
  light: FlexSchemeColor(
    primary: Color(0xFF4E0028),
    primaryVariant: Color(0xFF320019),
    secondary: Color(0xFF003419),
    secondaryVariant: Color(0xFF002411),
  ),
  dark: FlexSchemeColor(
    primary: Color(0xFF9E7389),
    primaryVariant: Color(0xFF775C69),
    secondary: Color(0xFF738F81),
    secondaryVariant: Color(0xFF5C7267),
  ),
);

class DemoApp extends StatefulWidget {
  const DemoApp({Key key}) : super(key: key);

  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  // Used to select if we use the dark or light theme.
  ThemeMode themeMode;
  // Used to select which FlexSchemeData we use.
  FlexScheme flexScheme;

  @override
  void initState() {
    themeMode = ThemeMode.light;
    flexScheme = FlexScheme.hippieBlue;
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
        colors: flexScheme == FlexScheme.custom
            ? customFlexScheme.light
            : FlexColor.schemesWithCustom[flexScheme].light,
        surfaceStyle: FlexSurface.strong,
      ).toTheme,
      // We do the exact same definition for the dark theme, but using
      // FlexColorScheme.dark factory and the dark FlexSchemeColor instead.
      darkTheme: FlexColorScheme.dark(
        colors: flexScheme == FlexScheme.custom
            ? customFlexScheme.dark
            : FlexColor.schemesWithCustom[flexScheme].dark,
        surfaceStyle: FlexSurface.strong,
      ).toTheme,
      // Use the above dark or light theme based on active themeMode.
      themeMode: themeMode,
      // This simple example app has only one page
      home: HomePage(
        // We pass it the current theme mode.
        themeMode: themeMode,
        // On the home page we toggle theme mode between light and dark.
        onThemeModeChanged: (ThemeMode mode) {
          setState(() {
            themeMode = mode;
          });
        },
        // We can pass it the enum value of the active scheme.
        flexScheme: flexScheme,
        // We can select a new scheme and get its enum value back.
        onFlexSchemeChanged: (FlexScheme selectedScheme) {
          setState(() {
            flexScheme = selectedScheme;
          });
        },
        // Pass in the FlexSchemeData we used for the active theme. Not really
        // needed to use FlexColorScheme, but we will use it to show the
        // active theme's name, descriptions and colors in the demo.
        // We also use it for the theme mode switch that shows the theme's
        // color's in the different theme modes.
        flexSchemeData: flexScheme == FlexScheme.custom
            ? customFlexScheme
            : FlexColor.schemesWithCustom[flexScheme],
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
    @required this.flexScheme,
    @required this.onFlexSchemeChanged,
    @required this.flexSchemeData,
  }) : super(key: key);
  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;
  final FlexScheme flexScheme;
  final ValueChanged<FlexScheme> onFlexSchemeChanged;
  final FlexSchemeData flexSchemeData;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final TextTheme textTheme = theme.textTheme;
    final TextStyle headline4 = textTheme.headline4;
    final bool isLight = Theme.of(context).brightness == Brightness.light;

    // FlexSurface enum to widget map, used in a CupertinoSegment control.
    const Map<FlexScheme, Widget> schemeOptions = <FlexScheme, Widget>{
      FlexScheme.hippieBlue: Padding(
        padding: EdgeInsets.all(6),
        child: Text(
          'Hippie\nblue',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 11),
        ),
      ),
      FlexScheme.money: Padding(
        padding: EdgeInsets.all(6),
        child: Text(
          'Green\nmoney',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 11),
        ),
      ),
      FlexScheme.redWine: Padding(
        padding: EdgeInsets.all(6),
        child: Text(
          'Red red\nwine',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 11),
        ),
      ),
      FlexScheme.custom: Padding(
        padding: EdgeInsets.all(6),
        child: Text(
          'Custom\npurple',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 11),
        ),
      ),
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('FlexColorScheme Example 3'),
        actions: const <Widget>[AboutIconButton()],
        elevation: 0,
      ),
      body: PageBody(
        child: ListView(
          padding: const EdgeInsets.all(AppConst.edgePadding),
          children: <Widget>[
            Text('Theme', style: headline4),
            const Text(
              'This example shows how you can use three built in '
              'color schemes and a custom scheme as selectable '
              'FlexColorScheme based theme options in an application. '
              'The example also uses strong branded surface colors. '
              'A theme showcase widget shows the theme with several '
              'common Material widgets.',
            ),
            // A 3-way theme mode toggle switch.
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: AppConst.edgePadding),
              child: FlexThemeModeSwitch(
                themeMode: themeMode,
                onThemeModeChanged: onThemeModeChanged,
                flexSchemeData: flexSchemeData,
              ),
            ),
            const Divider(),
            const SizedBox(height: 8),
            CupertinoSegmentedControl<FlexScheme>(
              children: schemeOptions,
              groupValue: flexScheme,
              onValueChanged: onFlexSchemeChanged,
              borderColor:
                  isLight ? colorScheme.primary : theme.primaryColorLight,
              selectedColor:
                  isLight ? colorScheme.primary : theme.primaryColorLight,
              unselectedColor: theme.cardColor,
            ),
            // Show theme name and description.
            ListTile(
              title: Text('${flexSchemeData.name} theme'),
              subtitle: Text(flexSchemeData.description),
            ),
            // Show all key active theme colors.
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: AppConst.edgePadding),
              child: ShowThemeColors(),
            ),
            const Divider(),
            Text('Theme Showcase', style: headline4),
            const ThemeShowcase(),
          ],
        ),
      ),
    );
  }
}
