import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shared/all_shared_imports.dart';
import 'home_page.dart';

// -----------------------------------------------------------------------------
// EXAMPLE 2 - Custom Theme
//
// This example shows how to define your own FlexSchemeData, using
// FlexSchemeColor and create a FlexColorScheme based theme from it.
//
// It uses the Google font Noto Sans to show how to use custom fonts.
//
// In this example we use a ThemeService and ThemeController to manage our
// theme settings. This follows the example architecture you get when you
// create a Flutter template application architecture with:
//
// flutter create -t skeleton my_flutter_app
//
// The theme controller is used to change the theme mode and to toggle
// opting in and out of FlexColorScheme's opinionated sub-themes.
// -----------------------------------------------------------------------------

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Use a ThemeController, which glues our theme settings to Flutter Widgets.
  final ThemeController themeController = ThemeController(ThemeServiceMem());

  // Load the preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await themeController.loadAll();

  // Run the app and pass in the ThemeController. The app listens to the
  // ThemeController for changes, then passes it further down to the HomePage.
  runApp(DemoApp(themeController: themeController));
}

// Create a custom FlexSchemeData scheme with name, description and a light
// and dark FlexSchemeColor.
// You can also just create a FlexSchemeColor for light and dark theme,
// without the name and description, but in this example we will use
// the name and description to describe created themes.
//
// The example custom colors here are fairly close to the built-in color scheme
// 'Barossa'. If you like them, you can probably use it instead. It is not
// exactly the same though. The 'Barossa' variant is tuned a bit differently.
// The 'Barossa' theme was introduced in version 1.4.1, and was inspired
// and based on this example.
//
// Here we use local const values for our color palette definitions, you may
// want to bundle your custom color values in a class as static const values.
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

class DemoApp extends StatelessWidget {
  const DemoApp({Key? key, required this.themeController}) : super(key: key);
  final ThemeController themeController;

  @override
  Widget build(BuildContext context) {
    // Glue the ThemeController to the MaterialApp.
    // The AnimatedBuilder Widget listens to the ThemeController for changes.
    // Whenever the user updates theme settings, the MaterialApp is rebuilt.
    return AnimatedBuilder(
        animation: themeController,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            scrollBehavior: AppScrollBehavior(),
            title: 'Custom Theme',
            // Define FlexThemeData.light() theme using custom colors.
            theme: FlexThemeData.light(
              // You could have stored the light scheme in a FlexSchemeColor
              // and used it for the colors, but we will use both the light and
              // dark colors also on the HomePage for the theme switch widget
              // and to display its name, where we pass it as a FlexSchemeData
              // object that contains both the light and dark scheme and its
              // name and description.
              colors: _myFlexScheme.light,
              // Toggle using FlexColorScheme sub-themes, via theme controller.
              useSubThemes: themeController.useSubThemes,
              appBarElevation: 1,
              visualDensity: FlexColorScheme.comfortablePlatformDensity,
              fontFamily: GoogleFonts.notoSans().fontFamily,
            ),
            // Same setup for the dark theme, but with FlexThemeData.dark().
            darkTheme: FlexThemeData.dark(
              colors: _myFlexScheme.dark,
              useSubThemes: themeController.useSubThemes,
              appBarElevation: 4,
              visualDensity: FlexColorScheme.comfortablePlatformDensity,
              fontFamily: GoogleFonts.notoSans().fontFamily,
            ),
            // Use the dark or light theme based on controller setting.
            themeMode: themeController.themeMode,
            home: HomePage(
              // Pass in the FlexSchemeData we used for the active theme. Not
              // really needed to use FlexColorScheme, but we will use it to
              // show the active theme's name, description and colors in the
              // demo. It is also used for the theme mode switch that shows the
              // theme's colors in the different theme modes.
              flexSchemeData: _myFlexScheme,
              // Pass in the theme controller to the home page.
              controller: themeController,
            ),
          );
        });
  }
}
