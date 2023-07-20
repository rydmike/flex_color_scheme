import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../shared/const/app.dart';
import '../shared/const/app_color.dart';
import '../shared/controllers/theme_controller.dart';
import '../shared/services/theme_service.dart';
import '../shared/services/theme_service_hive.dart';
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
//
// You can try this app as a web app at:
// https://rydmike.com/flexcolorscheme/allthemes-v7-2
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
  // Here we use Hive. The examples are all built using same
  // "example" app. If we use SharedPreferences in more than one of the apps
  // they would use the same storage container and share the settings when you
  // build them locally. By using Hive for most examples, we can change
  // the storage container name for each example. In these demos the
  // SharedPreferences service is only used for example 3, but you can swap in
  // the Hive based one for it as well.

  // The ThemeServiceHive constructor requires a box name, the others do not.
  // The box name is just a file name for the file that stores the settings.
  final ThemeService themeService =
      ThemeServiceHive('flex_color_scheme_v5_box_4');
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

class DemoApp extends StatelessWidget {
  const DemoApp({super.key, required this.themeController});
  final ThemeController themeController;

  @override
  Widget build(BuildContext context) {
    // Whenever the theme controller notifies the listenable in the
    // ListenableBuilder, the MaterialApp is rebuilt.
    return ListenableBuilder(
      listenable: themeController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'All Themes',
          // Define the light theme for the app, using current scheme index.
          theme: FlexThemeData.light(
            useMaterial3: themeController.useMaterial3,
            // We moved the definition of the list of color schemes to use into
            // a separate static class and list. We use the theme controller
            // to change the index of used color scheme from the list.
            colors: AppColor.customSchemes[themeController.schemeIndex].light,
            // Here we use another surface blend mode, where the scaffold
            // background gets a strong blend. This type is commonly used
            // on web/desktop when you wrap content on the scaffold in a
            // card that has a lighter background.
            surfaceMode: FlexSurfaceMode.highScaffoldLowSurfaces,
            // Our content is not all wrapped in cards in this demo, so
            // we keep the blend level fairly low for good contrast.
            blendLevel: 2,
            appBarElevation: 0.5,
            // Opt-in/out on using the additional opinionated
            // component sub-themes. You can use property `subThemesData`
            // to pass in a `FlexSubThemesData()` data object that contains a
            // large number of easy to use configuration parameters that you
            // can use for quick styling of the sub-themes per component.
            subThemesData: themeController.useSubThemes
                // Below we show one example for configuring the component
                // sub-themes. In example 5 we will use almost all of them.
                ? FlexSubThemesData(
                    // Value to adjust themed border radius on widgets with
                    // an adjustable corner rounding, this one is very handy.
                    // If null, it defaults to Material3 (You) design
                    // guide values, when available: https://m3.material.io/
                    // If you give it value, "all" Flutter built-in widgets
                    // supporting border radius will use the give radius.
                    defaultRadius: themeController.defaultRadius,
                  )
                : null,
            // Passing in `FlexKeyColors()` to `keyColors` activates Material 3
            // key color seed based schemes. The primary color in your
            // active theme is always used as main "primary" key for the
            // generated color scheme when it is activated. This is the same
            // as using the Flutter SDK `ColorScheme.fromSeed()` and passing it
            // the primary color.
            // Flutter SDK only makes seed ColorSchemes where the entire scheme
            // is generated from only one color. In FlexColorScheme, you
            // can also use the secondary and tertiary colors, as input keys to
            // seeds their colors.
            // Please note that the key color is used as seed to generate a
            // Material 3 Tonal Palette, and the colors, or tones from the same
            // palette, is used as input to colors in the ColorScheme in both
            // dark and light color scheme. The key color itself is seldom
            // included as a color in the generated ColorScheme. This can be
            // problematic if you want to use that specific color in your
            // custom scheme for branding purposes. The `FlexKeyColors`
            // configuration data class contains additional properties where you
            // can instruct it to keep a color defined in FlexColorScheme at
            // its defined input value. Set e.g. `keepPrimary: true` to ensure
            // that the actual primary color you used to seed your color scheme,
            // is also used as the primary color in the otherwise seed
            // generated ColorScheme from the used color. This is used below.
            keyColors: FlexKeyColors(
              useKeyColors: themeController.useKeyColors,
              useSecondary: themeController.useSecondary,
              useTertiary: themeController.useTertiary,
              keepPrimary: themeController.keepPrimary,
              keepSecondary: themeController.keepSecondary,
              keepTertiary: themeController.keepTertiary,
            ),
            // In this example we use the values for visual density and font
            // from a single static source, so we can change it easily there.
            visualDensity: App.visualDensity,
            fontFamily: App.font,
            // We use the nicer Material 3 Typography in both M2 and M3 mode.
            typography: Typography.material2021(
              platform: defaultTargetPlatform,
            ),
          ),
          // We do the exact same definition for the dark theme, but using
          // FlexThemeData.dark() and the dark FlexSchemeColors in our
          // AppColor.schemes list instead.
          darkTheme: FlexThemeData.dark(
            useMaterial3: themeController.useMaterial3,
            colors: AppColor.customSchemes[themeController.schemeIndex].dark,
            surfaceMode: FlexSurfaceMode.highScaffoldLowSurfaces,
            // We go with a slightly stronger blend in dark mode.
            blendLevel: 7,
            appBarElevation: 0.5,
            keyColors: FlexKeyColors(
              useKeyColors: themeController.useKeyColors,
              useSecondary: themeController.useSecondary,
              useTertiary: themeController.useTertiary,
              keepPrimary: themeController.keepDarkPrimary,
              keepSecondary: themeController.keepDarkSecondary,
              keepTertiary: themeController.keepDarkTertiary,
            ),
            subThemesData: themeController.useSubThemes
                ? FlexSubThemesData(
                    defaultRadius: themeController.defaultRadius,
                  )
                : null,
            visualDensity: App.visualDensity,
            fontFamily: App.font,
            // We use the nicer Material 3 Typography in both M2 and M3 mode.
            typography: Typography.material2021(
              platform: defaultTargetPlatform,
            ),
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
