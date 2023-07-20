import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shared/controllers/theme_controller.dart';
import '../shared/services/theme_service.dart';
import '../shared/services/theme_service_prefs.dart';
import 'home_page.dart';

// -----------------------------------------------------------------------------
// EXAMPLE 3 - Four Themes
//
// This example shows how to use three built in color schemes and a custom
// scheme, as selectable FlexColorScheme based theme options in an
// application. The example also uses primary color surface alpha blends.
//
// The Google font Noto Sans is used to show how to use custom fonts.
//
// In this example we use a ThemeService and ThemeController to manage our
// theme settings. This follows the example architecture you get when you
// create a Flutter template application architecture with:
//
// flutter create -t skeleton my_flutter_app
//
// The theme controller is used to change the theme mode, to toggle
// opting in and out of FlexColorScheme's opinionated sub-themes, and to
// change the enum value of the used FlexScheme that creates a new theme
// with the enum related color scheme.
//
// You can try this app as a web app at:
// https://rydmike.com/flexcolorscheme/fourthemes-v7-2
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
  // Here we use Shared Preferences. The examples are all built using same
  // "example" app. If we use SharedPreferences in more than one of the apps
  // they would use the same storage container and share the settings when you
  // build them locally. By using Hive for most examples, we can change
  // the storage container name for each example. In these demos the
  // SharedPreferences service is only used for this example, but you can swap
  // in the Hive based one here as well if you want to try it.
  // This also demonstrates how swap used persistence implementation.
  //
  // NOTE:
  // Earlier we used Hive here and SharedPrefs only for example 5. We switched
  // 3 and 5 for shared prefs example. Hive is faster and example 5 needs the
  // performance more than this example. The slower speed for shared prefs was
  // noticeable in Windows desktop builds when changing custom theme color
  // with the wheel picker for primary color.
  final ThemeService themeService = ThemeServicePrefs();
  // To swap to Hive use this instead:
  // final ThemeService themeService =
  //   ThemeServiceHive('flex_color_scheme_v5_box_3');
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

// Create a custom FlexSchemeData with name, description and a light and dark
// FlexSchemeColors. Same example colors as those used in example 2.
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
    // Whenever the theme controller notifies the listenable in the
    // ListenableBuilder, the MaterialApp is rebuilt.
    return ListenableBuilder(
      listenable: themeController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Four Themes',
          // Select used light theme for the app by using the ThemeController
          // usedScheme, that contains the value of currently selected
          // FlexScheme enum. If it is the custom scheme, we use the above
          // custom scheme colors, if it is any other scheme, we get the
          // corresponding colors from the FlexColor.schemes map using the
          // enum value as key.
          theme: FlexThemeData.light(
            useMaterial3: themeController.useMaterial3,
            colors: themeController.usedScheme == FlexScheme.custom
                ? _myFlexScheme.light
                : FlexColor.schemes[themeController.usedScheme]!.light,
            // We use a surface color mode where Material surfaces use
            // more primary color branding than background, and scaffold uses
            // even less.
            surfaceMode: FlexSurfaceMode.highSurfaceLowScaffold,
            // We set the blend level strength to 10.
            blendLevel: 10,
            appBarElevation: 0.5,
            // Opt-in/out on using the additional opinionated
            // component sub-themes. You ca also use property `subThemesData`
            // to pass in a `FlexSubThemesData()` data object that contains a
            // large number of easy to use configuration parameters that you
            // can use for quick styling of the sub-themes per component.
            subThemesData:
                themeController.useSubThemes ? const FlexSubThemesData() : null,
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
            // generated ColorScheme from the used color.
            keyColors: FlexKeyColors(
              useKeyColors: themeController.useKeyColors,
              useSecondary: themeController.useSecondary,
              useTertiary: themeController.useTertiary,
            ),
            // Here we use a FlexColorScheme helper comfortablePlatformDensity.
            // It returns comfortable density on desktops, instead of compact,
            // like the `VisualDensity.adaptivePlatformDensity` does, it is
            // good compromise for desktop, especially if they have touch
            // screens since it keeps buttons and touch targets larger, but
            // not as large as on hand held devices.
            visualDensity: FlexColorScheme.comfortablePlatformDensity,
            fontFamily: GoogleFonts.notoSans().fontFamily,
            // We use the nicer Material 3 Typography in both M2 and M3 mode.
            typography: Typography.material2021(
              platform: defaultTargetPlatform,
            ),
          ),
          // We make an equivalent definition for the dark theme, but using
          // FlexThemeData.dark() and the dark FlexSchemeColors instead.
          darkTheme: FlexThemeData.dark(
            useMaterial3: themeController.useMaterial3,
            colors: themeController.usedScheme == FlexScheme.custom
                ? _myFlexScheme.dark
                : FlexColor.schemes[themeController.usedScheme]!.dark,
            // We don't have to use the same surface mode in dark mode, for an
            // interesting effect here we use a mode where scaffold background
            // color gets a much higher blend value than surface and background.
            surfaceMode: FlexSurfaceMode.highScaffoldLowSurfaces,
            // You don't have to use same blend level or mode in light
            // and dark mode, here we use a lower value in dark mode, that
            // goes better together with the highScaffoldLowSurfaces mode.
            blendLevel: 12,
            appBarElevation: 1,
            subThemesData:
                themeController.useSubThemes ? const FlexSubThemesData() : null,
            keyColors: FlexKeyColors(
              useKeyColors: themeController.useKeyColors,
              useSecondary: themeController.useSecondary,
              useTertiary: themeController.useTertiary,
            ),
            visualDensity: FlexColorScheme.comfortablePlatformDensity,
            fontFamily: GoogleFonts.notoSans().fontFamily,
            // We use the nicer Material 3 Typography in both M2 and M3 mode.
            typography: Typography.material2021(
              platform: defaultTargetPlatform,
            ),
          ),
          // Use the dark or light theme, based on controller setting.
          themeMode: themeController.themeMode,
          // This simple example app has only one page.
          home: HomePage(
            // Pass in the FlexSchemeData we used for the active theme. Not
            // really needed to use FlexColorScheme, but we will use it to
            // show the active theme's name, descriptions and colors in the
            // example. We also use it for the theme mode switch that shows the
            // theme's colors in the different theme modes.
            flexSchemeData: themeController.usedScheme == FlexScheme.custom
                ? _myFlexScheme
                : FlexColor.schemes[themeController.usedScheme]!,
            // Pass in the theme controller to the home page.
            controller: themeController,
          ),
        );
      },
    );
  }
}
