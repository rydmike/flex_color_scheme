import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shared/controllers/theme_controller.dart';
import '../shared/services/theme_service.dart';
// import '../shared/services/theme_service_hive.dart';
import '../shared/services/theme_service_mem.dart';
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
//
// You can try this app as a web app at:
// https://rydmike.com/flexcolorscheme/customtheme-v7-2
// -----------------------------------------------------------------------------

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Use a ThemeController, which glues our theme settings to Flutter Widgets.
  //
  // The controller uses an abstract ThemeService interface to get and save the
  // settings. There are 3 implementations available to choose from:
  //
  // 0. ThemeService      - Abstract interface base class.
  // 1. ThemeServiceMem   - Only keeps settings in memory.
  // 2. ThemeServicePrefs - Persist settings locally using SharedPreferences.
  // 3. ThemeServiceHive  - Persist settings locally using Hive.
  //
  // In this example we just use memory storage no persistence.
  // The examples are all built using same "example" app. If we use
  // SharedPreferences in more than one of the apps
  // they would use the same storage container and share the settings when you
  // build them locally. By using Hive for most examples, we can change
  // the storage container name for each example. In these demos the
  // SharedPreferences service is only used for example 3. You can swap in
  // the Hive based one here as well, if you want to try it and save settings
  // for this simple example as well.
  // This also demonstrates how swap used persistence implementation.
  final ThemeService themeService = ThemeServiceMem();
  // To swap to hive use this instead:
  // final ThemeService themeService =
  //   ThemeServiceHive('flex_color_scheme_v5_box_2');
  // Initialize the theme service.
  await themeService.init();
  // Create a ThemeController that uses the ThemeService.
  final ThemeController themeController = ThemeController(themeService);
  // Load all the preferred theme settings, while the app is loading, before
  // MaterialApp is created. This prevents a sudden theme change when the app
  // is first displayed.
  await themeController.loadAll();
  // Run the app and pass in the ThemeController. The app listens to the
  // ThemeController for changes.
  runApp(DemoApp(themeController: themeController));
}

// Create a custom FlexSchemeData scheme with name, description and a light
// and dark FlexSchemeColor.
// You can also just create a FlexSchemeColor for light and dark theme,
// without the name and description, but in this example we will use
// the name and description to also describe created themes.
//
// Here we use local const values for our color palette definitions, you may
// want to bundle your custom color values in a class as static const values.
// In later examples 4 and 5 we do so.
//
// These colors were was just some colors I chose on a whim, but dang this
// theme actually looks pretty good! :)
const FlexSchemeData _myFlexScheme = FlexSchemeData(
  name: 'Midnight blue',
  description: 'Midnight blue theme, custom definition of all colors',
  light: FlexSchemeColor(
    primary: Color(0xFF00296B),
    primaryContainer: Color(0xFFA0C2ED),
    secondary: Color(0xFFD26900),
    secondaryContainer: Color(0xFFFFD270),
    tertiary: Color(0xFF5C5C95),
    tertiaryContainer: Color(0xFFC8DBF8),
  ),
  dark: FlexSchemeColor(
    primary: Color(0xFFB1CFF5),
    primaryContainer: Color(0xFF3873BA),
    secondary: Color(0xFFFFD270),
    secondaryContainer: Color(0xFFD26900),
    tertiary: Color(0xFFC9CBFC),
    tertiaryContainer: Color(0xFF535393),
  ),
);

class DemoApp extends StatelessWidget {
  const DemoApp({super.key, required this.themeController});
  final ThemeController themeController;

  @override
  Widget build(BuildContext context) {
    // Glue the ThemeController to the MaterialApp.
    // The ListenableBuilder Widget listens to the ThemeController for changes.
    // Whenever the user updates theme settings, the MaterialApp is rebuilt.
    // It rebuilds the entire app when any value in the themeController is
    // changed, but that is fine, since all property changes in it are of
    // the nature that the entire App UI needs to be redrawn, so this approach
    // works well for this use case.
    return ListenableBuilder(
        listenable: themeController,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Custom Theme',
            // Define FlexThemeData.light() theme using above custom colors.
            theme: FlexThemeData.light(
              useMaterial3: themeController.useMaterial3,
              // We could have stored the light scheme in a FlexSchemeColor
              // and used it for the colors, but we will use both the light and
              // dark colors also on the HomePage for the theme switch widget
              // and to display its name, where we pass it as a FlexSchemeData
              // object that contains both the light and dark scheme and its
              // name and description.
              colors: _myFlexScheme.light,
              // Opt in/out on FlexColorScheme sub-themes with theme controller.
              subThemesData: themeController.useSubThemes
                  ? const FlexSubThemesData()
                  : null,
              // Use very low elevation light theme mode. On light colored
              // AppBars this show up as a nice thin underline effect.
              appBarElevation: 0.5,
              // Here we want the large default visual density on all platforms.
              // Like Flutter SDK it default to
              // VisualDensity.adaptivePlatformDensity, which uses standard on
              // devices, but compact on desktops, compact is very compact,
              // maybe even a bit too compact
              visualDensity: VisualDensity.standard,
              // You can add a font via just a fontFamily from e.g. GoogleFonts.
              // For better results, prefer defining complete TextThemes,
              // using a font and its different styles, potentially even
              // more then one font, and then assign the TextTheme to the
              // textTheme and primaryTextTheme in FlexThemeData. This is
              // just how you would use it with ThemeData too.
              fontFamily: GoogleFonts.notoSans().fontFamily,
              // We use the nicer Material 3 Typography in both M2 and M3 mode.
              typography: Typography.material2021(
                platform: defaultTargetPlatform,
              ),
            ),
            // Same setup for the dark theme, but using FlexThemeData.dark().
            darkTheme: FlexThemeData.dark(
              useMaterial3: themeController.useMaterial3,
              colors: _myFlexScheme.dark,
              subThemesData: themeController.useSubThemes
                  ? const FlexSubThemesData()
                  : null,
              appBarElevation: 1,
              visualDensity: VisualDensity.standard,
              fontFamily: GoogleFonts.notoSans().fontFamily,
              // We use the nicer Material 3 Typography in both M2 and M3 mode.
              typography: Typography.material2021(
                platform: defaultTargetPlatform,
              ),
            ),
            // Use the dark or light theme, based on theme controller setting.
            themeMode: themeController.themeMode,
            home: HomePage(
              // Pass in the FlexSchemeData we used for the active theme. Not
              // needed to use FlexColorScheme, but we use it to
              // show the active theme's name, description and colors in the
              // demo. It is also used by the theme mode switch that shows the
              // theme's colors in the different theme modes.
              flexSchemeData: _myFlexScheme,
              // Pass in the theme controller to the home page.
              controller: themeController,
            ),
          );
        });
  }
}
