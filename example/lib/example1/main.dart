import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shared/all_shared_imports.dart';

// -----------------------------------------------------------------------------
// EXAMPLE 1)
//
// This example shows how you can use a selected predefined color scheme in
// FlexColorScheme to define light and dark themes using the scheme
// and then switch between the light and dark mode.
//
// We also use the Google font Noto Sans for the app.
//
// A theme showcase widget shows the theme with several common Material widgets.
// -----------------------------------------------------------------------------

void main() => runApp(const DemoApp());

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
    // Select the predefined FlexScheme to use. Feel free to modify the used
    // FlexScheme enum value below to try other built-in color schemes.
    const FlexScheme usedFlexScheme = FlexScheme.mandyRed;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sample 1) Use Predefined Theme',
      // Use a predefined FlexThemeData.light() theme for the app.
      theme: FlexThemeData.light(
        scheme: usedFlexScheme,
        // Use comfortable on desktops instead of compact, devices use default.
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        // We use GoogleFonts NotoSans instead of platform defaults.
        fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
      // Same definition for the dark theme, using FlexThemeData.dark().
      darkTheme: FlexThemeData.dark(
        scheme: usedFlexScheme,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
      // Use the above dark or light theme based on active themeMode.
      themeMode: themeMode,
      // This simple example app has only one page.
      home: HomePage(
        // We pass it the current theme mode.
        themeMode: themeMode,
        // On the home page we can toggle theme mode between light and dark.
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
        flexSchemeData: FlexColor.schemes[usedFlexScheme]!,
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
              'This example shows how you can use a selected '
              'predefined color scheme in FlexColorScheme to define '
              'light and dark themes using the scheme and switch between '
              'the light and dark mode. '
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
          ],
        ),
      ),
    );
  }
}
