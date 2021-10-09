import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shared/all_shared_imports.dart';

// -----------------------------------------------------------------------------
// EXAMPLE 2)
//
// This example shows how you can define your own FlexSchemeData and create a
// FlexColorScheme based theme from it.
//
// We also use the Google font Noto Sans for the app.
//
// A theme showcase widget shows the theme with several common Material widgets.
// -----------------------------------------------------------------------------

void main() => runApp(const DemoApp());

// Create a custom FlexSchemeData scheme with name, description and a light
// and dark FlexSchemeColor.
//
// You can also just create a FlexSchemeColor for light and dark theme,
// without the name and description, but in this example we will also use
// use the name and description to describe created themes.
//
// These example custom colors are fairly close to the built-in color scheme
// 'Barossa'. If you like them, you can probably use it instead. It is not
// exactly the same though. The 'Barossa' variant is tuned a bit differently.
// The 'Barossa' theme was introduced in version 1.4.1, and was inspired
// and based on this example.
const FlexSchemeData _myFlexScheme = FlexSchemeData(
  name: 'Toledo purple',
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
  const DemoApp({Key? key}) : super(key: key);

  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  // Used to select if we use the dark or light theme.
  ThemeMode themeMode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sample 2) Use Custom Theme',
      // Use the custom light scheme to define FlexThemeData.light().
      theme: FlexThemeData.light(
        // You could also have stored the light scheme in a
        // FlexSchemeColor and used that, but we will use it also on the
        // HomePage for the switch widget and to display its name, where we
        // pass it as a FlexSchemeData object that contains both the light
        // and dark scheme and its name and description.
        colors: _myFlexScheme.light,
        // Here we use comfortable adaptive platform density on desktops instead
        // compact, devices will still use their default density.
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
      // Same definitions for the dark theme, but with FlexThemeData.dark().
      darkTheme: FlexThemeData.dark(
        colors: _myFlexScheme.dark,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
      // Use the above dark or light theme based on active themeMode.
      themeMode: themeMode,
      // This simple example app has only one page.
      home: HomePage(
        // We pass it the current theme mode.
        themeMode: themeMode,
        // On the home page we toggle theme mode between light and dark and
        // get the result back in this callback function.
        onThemeModeChanged: (ThemeMode mode) {
          setState(() {
            themeMode = mode;
          });
        },
        // Pass in the FlexSchemeData we used for the active theme. Not really
        // needed to use FlexColorScheme, but we will use it to show the
        // active theme's name, descriptions and colors in the demo.
        // We also use it for the theme mode switch that shows the theme's
        // color's in the different theme modes.
        flexSchemeData: _myFlexScheme,
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
    Key? key,
    required this.themeMode,
    required this.onThemeModeChanged,
    required this.flexSchemeData,
  }) : super(key: key);
  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;
  final FlexSchemeData flexSchemeData;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final TextStyle headline4 = textTheme.headline4!;

    return Scaffold(
      appBar: AppBar(
        title: Text(App.title(context)),
        actions: const <Widget>[AboutIconButton()],
      ),
      body: PageBody(
        constraints: const BoxConstraints(maxWidth: App.maxBodyWidth),
        child: ListView(
          padding: const EdgeInsets.all(App.edgePadding),
          children: <Widget>[
            Text('Theme', style: headline4),
            const Text(
              'This example shows how you can define your own '
              'FlexSchemeData and create a FlexColorScheme based theme '
              'from it. '
              'A theme showcase widget shows the theme with several '
              'common Material widgets.',
            ),
            // A 3-way theme mode toggle switch.
            Padding(
              padding: const EdgeInsets.symmetric(vertical: App.edgePadding),
              child: FlexThemeModeSwitch(
                themeMode: themeMode,
                onThemeModeChanged: onThemeModeChanged,
                flexSchemeData: flexSchemeData,
              ),
            ),
            const Divider(),
            // Show theme name and description.
            ListTile(
              title: Text('${flexSchemeData.name} theme'),
              subtitle: Text(flexSchemeData.description),
            ),
            // Show all key active theme colors.
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: App.edgePadding),
              child: ShowThemeColors(),
            ),
            const Divider(),
            Text('Theme Showcase', style: headline4),
            const ThemeShowcase(),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
