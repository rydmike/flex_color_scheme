import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../shared/utils/app_scroll_behavior.dart';
import 'home_page.dart';

// -----------------------------------------------------------------------------
// EXAMPLE 1 - Basic Theme Usage
//
// This example shows how to use a selected predefined color scheme in
// FlexColorScheme, to define light and dark themes using the scheme,
// and then how to switch between the light and dark mode.
//
// You can try this app as a web app at:
// https://rydmike.com/flexcolorscheme/basictheme-v5
// -----------------------------------------------------------------------------
void main() => runApp(const DemoApp());

class DemoApp extends StatefulWidget {
  const DemoApp({super.key});

  @override
  State<DemoApp> createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  // Used to select if we use the dark or light theme, start with system mode.
  ThemeMode themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    // Select the predefined FlexScheme color scheme to use. Modify the
    // used FlexScheme enum value below to try other pre-made color schemes.
    const FlexScheme usedScheme = FlexScheme.mandyRed;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: const AppScrollBehavior(),
      title: 'Basic Theme Usage',
      // Use a predefined FlexThemeData.light() theme for the light theme.
      theme: FlexThemeData.light(
        scheme: usedScheme,
        // Use very subtly themed app bar elevation in light mode.
        appBarElevation: 0.5,
        // Use predefined M3 typography while this issue is in effect:
        // https://github.com/flutter/flutter/issues/103864
        typography: Typography.material2021(
          platform: defaultTargetPlatform,
        ),
      ),
      // Same definition for the dark theme, but using FlexThemeData.dark().
      darkTheme: FlexThemeData.dark(
        scheme: usedScheme,
        // Use a bit more themed elevated app bar in dark mode.
        appBarElevation: 2,
        // Use predefined M3 typography while this issue is in effect:
        // https://github.com/flutter/flutter/issues/103864
        typography: Typography.material2021(
          platform: defaultTargetPlatform,
        ),
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
        // Pass in the FlexSchemeData we used for the active theme. Not
        // needed to use FlexColorScheme, but we use it to
        // show the active theme's name, description and colors in the
        // demo. It is also used by the theme mode switch that shows the
        // theme's colors in the different theme modes.
        flexSchemeData: FlexColor.schemes[usedScheme]!,
      ),
    );
  }
}
