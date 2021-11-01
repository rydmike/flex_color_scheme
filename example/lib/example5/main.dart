import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../shared/all_shared_imports.dart';
import 'home_page.dart';

// -----------------------------------------------------------------------------
// EXAMPLE 5 - Themes Playground
//
// This example shows how you can use all the built in color schemes in
// FlexColorScheme to define themes from them and how you can define your own
// custom scheme colors and use them together with the predefined ones.
//
// The example also shows how you can use the surface branding feature and
// how to use the custom app bar theme features of FlexColorScheme. The usage
// of the true black theme feature for dark themes is also demonstrated.
// Using the optional Windows desktop like tooltip theme is also shown.
//
// A toggle that allows us to compare the result of custom defined dark schemes
// its computed versions is also available. To further demonstrate the
// difference between FlexThemeData and just Flutter SDK ThemeData.from, a
// toggle to try both is available for comparison purposes.
//
// The example includes a dummy responsive side menu and rail to give a visual
// presentation of what applications that have larger visible surfaces using
// the surface branding looks like.
//
// The color value definition and list of FlexSchemeData is tucked into
// a static class as AppColor.schemes.
//
// The Google font Noto Sans is used to show how to use custom fonts.
//
// A ThemeService and ThemeController is used to manage the theme settings.
// This follows the example architecture you get when you
// create a Flutter template application architecture with:
//
// flutter create -t skeleton my_flutter_app
//
// The theme controller is used to change the theme mode, to toggle
// opting in and out of FlexColorScheme's opinionated sub-themes, and to
// change the index value of the used colors from the list of FlexSchemeData
// in AppColor.schemes and many other options.
// -----------------------------------------------------------------------------

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Use a ThemeController, which glues our theme settings to Flutter Widgets.
  //
  // The controller uses an abstract ThemeService interface to get and save the
  // settings. There are 3 implementations available to choose from:
  //
  // 1. ThemeServiceMem - Only keeps settings in memory.
  // 2. ThemeServicePrefs - Persist settings locally using SharedPreferences.
  // 3. ThemeServiceHive - Persist settings locally using Hive.
  //
  // Here we use Hive. These examples are all built using same "example" app
  // build file. If we use SharedPreferences all examples would use the same
  // storage container and share the settings when you build them. By
  // using Hive we can change the storage container name for each example.
  final ThemeController themeController = ThemeController(ThemeServiceMem());

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
            title: 'Themes Playground',
            theme: themeController.useFlexColorScheme
                ? FlexThemeData.light(
                    // Use controller to select color scheme from our list.
                    colors: AppColor.schemes[themeController.schemeIndex].light,
                    // Use controller to select surface mode
                    surfaceMode: themeController.surfaceMode,
                    // Enum used to control the level of primary color surface
                    // branding applied to surfaces and backgrounds.
                    blendLevel: themeController.blendLevel,
                    // Enum used to select what app bar style we use.
                    appBarStyle: themeController.lightAppBarStyle,
                    // Set background opacity on app bar.
                    appBarOpacity: themeController.appBarOpacity,
                    // Used to modify the themed app bar elevation.
                    appBarElevation: themeController.appBarElevation,
                    // Used to control if we use one or two toned status bar.
                    transparentStatusBar: themeController.transparentStatusBar,
                    // Enum used to select what tab bar style we use.
                    tabBarStyle: themeController.tabBarStyle,
                    // If true, tooltip theme background will be light in light
                    // theme, and dark in dark themes. The Flutter and Material
                    // default and standard is the other way, tooltip background
                    // color is inverted compared to app background.
                    // Set to true, to mimic e.g. the look of Windows desktop
                    // tooltips. You could tie this to the active platform and
                    // have different style of tooltips on different platforms.
                    tooltipsMatchBackground:
                        themeController.tooltipsMatchBackground,
                    // Swap primary and secondary colors
                    swapColors: themeController.swapLightColors,
                    useSubThemes: themeController.useSubThemes,
                    visualDensity: AppData.visualDensity,
                    fontFamily: AppData.font,
                    textTheme: AppData.textTheme,
                    primaryTextTheme: AppData.textTheme,
                    // Add some quick and easy options for sub-themes.
                    subThemesData: FlexSubThemesData(
                      cornerRadius: themeController.cornerRadius,
                      themedEffects: themeController.themedEffects,
                      bottomNavigationBarOpacity:
                          themeController.bottomNavigationBarOpacity,
                      bottomNavigationBarElevation:
                          themeController.bottomNavigationBarElevation,
                      inputDecoratorIsFilled:
                          themeController.inputDecoratorIsFilled,
                      inputDecoratorBorderType:
                          themeController.inputDecoratorIsOutlinedBorder,
                      inputDecoratorUnfocusedHasBorder:
                          themeController.inputDecoratorUnfocusedHasBorder,
                      blendOnColors: themeController.blendLightOnColors,
                      blendTextTheme: themeController.blendLightTextTheme,
                    ),
                  )
                // Here we are NOT using FlexThemeData. We use the default
                // ThemeData.from method, to see the differences.
                : ThemeData.from(
                    textTheme: ThemeData(
                      brightness: Brightness.light,
                      fontFamily: AppData.font,
                      textTheme: AppData.textTheme,
                      primaryTextTheme: AppData.textTheme,
                    ).textTheme,
                    colorScheme: FlexColorScheme.light(
                      colors:
                          AppColor.schemes[themeController.schemeIndex].light,
                      surfaceMode: themeController.surfaceMode,
                      blendLevel: themeController.blendLevel,
                      swapColors: themeController.swapLightColors,
                    ).toScheme,
                  ).copyWith(
                    visualDensity: AppData.visualDensity,
                    typography: Typography.material2018(
                      platform: defaultTargetPlatform,
                    ),
                  ),
            // We do the exact same definition for the dark theme, but using
            // FlexThemeData.dark() and the dark FlexSchemeColors and we add
            // the true black option as well and the feature to demonstrate
            // the usage of computed dark schemes.
            //
            // The level of white blend percentage used when computing dark
            // scheme colors from the light scheme colors with the toDark method
            // is determined by `darkMethodLevel`.
            darkTheme: themeController.useFlexColorScheme
                ? FlexThemeData.dark(
                    colors: themeController.useToDarkMethod
                        ? AppColor.schemes[themeController.schemeIndex].light
                            .defaultError
                            .toDark(themeController.darkMethodLevel)
                        : AppColor.schemes[themeController.schemeIndex].dark,
                    surfaceMode: themeController.surfaceMode,
                    blendLevel: themeController.blendLevel,
                    appBarStyle: themeController.darkAppBarStyle,
                    appBarOpacity: themeController.appBarOpacity,
                    appBarElevation: themeController.appBarElevation,
                    transparentStatusBar: themeController.transparentStatusBar,
                    tabBarStyle: themeController.tabBarStyle,
                    tooltipsMatchBackground:
                        themeController.tooltipsMatchBackground,
                    swapColors: themeController.swapDarkColors,
                    darkIsTrueBlack: themeController.darkIsTrueBlack,
                    useSubThemes: themeController.useSubThemes,
                    visualDensity: AppData.visualDensity,
                    fontFamily: AppData.font,
                    textTheme: AppData.textTheme,
                    primaryTextTheme: AppData.textTheme,
                    subThemesData: FlexSubThemesData(
                      cornerRadius: themeController.cornerRadius,
                      themedEffects: themeController.themedEffects,
                      bottomNavigationBarOpacity:
                          themeController.bottomNavigationBarOpacity,
                      bottomNavigationBarElevation:
                          themeController.bottomNavigationBarElevation,
                      inputDecoratorIsFilled:
                          themeController.inputDecoratorIsFilled,
                      inputDecoratorBorderType:
                          themeController.inputDecoratorIsOutlinedBorder,
                      inputDecoratorUnfocusedHasBorder:
                          themeController.inputDecoratorUnfocusedHasBorder,
                      blendOnColors: themeController.blendDarkOnColors,
                      blendTextTheme: themeController.blendDarkTextTheme,
                    ),
                  )
                // Here we are NOT using FlexThemeData. We use the default
                // ThemeData.from method, to see the differences.
                : ThemeData.from(
                    textTheme: ThemeData(
                      brightness: Brightness.dark,
                      fontFamily: AppData.font,
                      textTheme: AppData.textTheme,
                      primaryTextTheme: AppData.textTheme,
                    ).textTheme,
                    colorScheme: FlexColorScheme.dark(
                      colors: themeController.useToDarkMethod
                          ? AppColor.schemes[themeController.schemeIndex].light
                              .defaultError
                              .toDark(themeController.darkMethodLevel)
                          : AppColor.schemes[themeController.schemeIndex].dark,
                      surfaceMode: themeController.surfaceMode,
                      blendLevel: themeController.blendLevel,
                      swapColors: themeController.swapDarkColors,
                      darkIsTrueBlack: themeController.darkIsTrueBlack,
                    ).toScheme,
                  ).copyWith(
                    visualDensity: AppData.visualDensity,
                    typography: Typography.material2018(
                      platform: defaultTargetPlatform,
                    ),
                  ),
            // Use the dark or light theme based on controller setting.
            themeMode: themeController.themeMode,
            // Here we only pass the theme controller to the HomePage.
            home: HomePage(controller: themeController),
          );
        });
  }
}
