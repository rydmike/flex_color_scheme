import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shared/all_shared_imports.dart';
import 'home_page.dart';

// -----------------------------------------------------------------------------
// EXAMPLE 1)
//
// This example shows how to use a selected predefined color scheme in
// FlexColorScheme to define light and dark themes using the scheme
// and then switch between the light and dark mode.
//
// It also uses the Google font Noto Sans to show how to use custom fonts.
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
    // Select the predefined FlexScheme color scheme to use. Modify the
    // used FlexScheme enum value below to try other pre-made color schemes.
    const FlexScheme usedFlexScheme = FlexScheme.mandyRed;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: AppScrollBehavior(),
      title: 'Example 1) Use Predefined Theme',
      // Use a predefined FlexThemeData.light() theme for the light theme.
      theme: FlexThemeData.light(
        scheme: usedFlexScheme,
        // Use very subtly themed app bar elevation in light mode.
        appBarElevation: 1,
        // Comfortable density on desktops, devices use default.
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        // We use GoogleFonts NotoSans instead of platform defaults.
        fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
      // Same definition for the dark theme, using FlexThemeData.dark().
      darkTheme: FlexThemeData.dark(
        scheme: usedFlexScheme,
        // Use stronger app bar elevation in dark mode.
        appBarElevation: 4,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
      // Use the above dark or light theme based on active themeMode.
      themeMode: themeMode,
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
        // colors in the different theme modes.
        flexSchemeData: FlexColor.schemes[usedFlexScheme]!,
      ),
    );
  }
}
