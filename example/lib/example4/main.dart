import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../shared/const/app_color.dart';
import '../shared/const/app_data.dart';
import '../shared/controllers/theme_controller.dart';
import '../shared/services/theme_service.dart';
import '../shared/services/theme_service_hive.dart';
import '../shared/utils/app_scroll_behavior.dart';
import 'home_page.dart';

// -----------------------------------------------------------------------------
// EXAMPLE 4 - All Themes
//
// This example shows how to use all the built in color schemes in
// FlexColorScheme to define themes from them and how to define your own
// custom scheme colors and use them together with the predefined ones.
//
// We now moved the color definitions to a separate color class called AppColor,
// in its own file '/const/app_color.dart'. It includes the color definitions
// we made in example 3, and adds two more custom schemes.
//
// The 2nd scheme is created by just defining primary color for dark and light
// scheme. The 3rd one we create by computing it from the light theme.
// Primary color alpha blended background and surface colors is used.
//
// The color value definition and list of all built in FlexSchemeData plus our
// custom definitions, are tucked into static list called schemes in AppColor.
//
// The Google font Noto Sans is used to show how to use custom fonts.
//
// A theme showcase widget shows the theme with several common Material widgets.
//
// A ThemeService and ThemeController is used to manage our
// theme settings. This follows the example architecture you get when you
// create a Flutter template application architecture with:
//
// flutter create -t skeleton my_flutter_app
//
// The theme controller is used to change the theme mode, to toggle
// opting in and out of FlexColorScheme's opinionated sub-themes, and to
// change the index value of the used colors from the list of FlexSchemeData
// in AppColor.schemes.
// -----------------------------------------------------------------------------

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Use a ThemeController, which glues our theme settings to Flutter Widgets.
  //
  // The controller uses an abstract ThemeService interface to get and save the
  // settings. There are 3 implementations available to choose from:
  //
  // 0. ThemeService      - Abstract interface base class, contains defaults
  //                        values and shared storage key value strings.
  // 1. ThemeServiceMem   - Only keeps settings in memory.
  // 2. ThemeServicePrefs - Persist settings locally using SharedPreferences.
  // 3. ThemeServiceHive  - Persist settings locally using Hive.
  //
  // Here we use Hive. The examples are all built using same
  // "example" app. If we use SharedPreferences in more than one of the apps
  // they would use the same storage container and share the settings when you
  // build them locally. By using Hive for most examples, we can change
  // the storage container name for each example. In these demos the
  // SharedPreferences service is only used for example 5, but you can swap in
  // the Hive based one for it as well.
  // This also demonstrates how swap used persistence implementation.

  // The ThemeServiceHive constructor requires a box name, the others do not.
  // The box name is just a file name for the file that stores the settings.
  final ThemeService themeService = ThemeServiceHive('flex_scheme_box_4');
  await themeService.init();
  final ThemeController themeController = ThemeController(themeService);
  // Load the the preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await themeController.loadAll();

  // Run the app and pass in the ThemeController. The app listens to the
  // ThemeController for changes, then passes it further down to the HomePage.
  runApp(DemoApp(themeController: themeController));
}

class DemoApp extends StatelessWidget {
  const DemoApp({Key? key, required this.themeController}) : super(key: key);
  final ThemeController themeController;

  @override
  Widget build(BuildContext context) {
    // Whenever the user updates theme settings, the MaterialApp is rebuilt.
    return AnimatedBuilder(
      animation: themeController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          scrollBehavior: AppScrollBehavior(),
          title: 'All Themes',
          // Define the light theme for the app, using current scheme index.
          theme: FlexThemeData.light(
            // We moved the definition of the list of color schemes to use into
            // a separate static class and list. We use the theme controller
            // to change the index of a used color scheme from the list.
            colors: AppColor.schemes[themeController.schemeIndex].light,
            // Here we use another surface blend mode, where the scaffold
            // background gets a strong blend. This type is commonly used
            // on web/desktop when you wrap content on the scaffold in a
            // card that has a lighter background.
            surfaceMode: FlexSurfaceMode.highScaffoldLowSurfaces,
            // Our content is not all wrapped in cards in this demo, so
            // we keep the blend level fairly low for good contrast.
            blendLevel: 5,
            appBarElevation: 0.5,
            useSubThemes: themeController.useSubThemes,
            // In this example we use the values for visual density and font
            // from a single static source, so we can change it easily there.
            visualDensity: AppData.visualDensity,
            fontFamily: AppData.font,
          ),
          // We do the exact same definition for the dark theme, but using
          // FlexThemeData.dark() and the dark FlexSchemeColors in our
          // AppColor.schemes list instead.
          darkTheme: FlexThemeData.dark(
            colors: AppColor.schemes[themeController.schemeIndex].dark,
            surfaceMode: FlexSurfaceMode.highScaffoldLowSurfaces,
            // We go with a slightly stronger blend in dark mode. It is worth
            // noticing, that in light mode, the alpha value used for the blends
            // is the blend level value, but in dark mode it is 2x this value.
            // Visually they match fairly well, but it depends on how saturated
            // your dark mode primary color is.
            blendLevel: 7,
            appBarElevation: 0.5,
            useSubThemes: themeController.useSubThemes,
            visualDensity: AppData.visualDensity,
            fontFamily: AppData.font,
          ),
          // Use the dark or light theme based on controller setting.
          themeMode: themeController.themeMode,
          // Here we only pass the theme controller to the HomePage.
          home: HomePage(controller: themeController),
        );
      },
    );
  }
}
