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
  // 0. ThemeService      - Abstract interface base class, contains defaults
  //                        values and shared storage key value strings.
  // 1. ThemeServiceMem   - Only keeps settings in memory.
  // 2. ThemeServicePrefs - Persist settings locally using SharedPreferences.
  // 3. ThemeServiceHive  - Persist settings locally using Hive.
  //
  // Here we use Shared Preferences. The examples are all built using same
  // "example" app. If we use SharedPreferences in more than one of the apps
  // they would use the same storage container and share the settings when you
  // build them locally. By using Hive for the other example, we can change
  // the storage container name for each example. This also demonstrates how
  // swap used persistence implementation.
  final ThemeService themeService = ThemeServicePrefs();
  await themeService.init();
  final ThemeController themeController = ThemeController(themeService);

  // Load the the preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await themeController.loadAll();

  // Run the app and pass in the ThemeController. The app listens to the
  // ThemeController for changes, then passes it further down to the HomePage.
  // The ThemeController controls all the myriad of Theme settings used
  // in the demo application and also persists settings with injected
  // ThemeService.
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
                    // Keep scaffold plain white in all blend modes.
                    lightIsWhite: themeController.lightIsWhite,
                    // Opt in/out of using the new sub v4 sub themes.
                    useSubThemes: themeController.useSubThemes,
                    // Modify these const values in the AppData class.
                    visualDensity: AppData.visualDensity,
                    // The platform can be toggled in the app, but not saved.
                    platform: themeController.platform,
                    // primaryTextTheme: AppData.textTheme,
                    // Add some some options to modify the sub-themes, there
                    // are more controls, here we use:
                    subThemesData: FlexSubThemesData(
                      // Opt-in out of ne M3 text theme.
                      useTextTheme: themeController.useTextTheme,
                      // Slider to adjust themed border radius on widgets with
                      // an adjustable corner rounding, this one is darn handy.
                      // If null, it defaults to Material3 (You) design
                      // guide values, as far as they are given in the new
                      // guide: https://m3.material.io/
                      defaultRadius: themeController.useDefaultRadius
                          ? null
                          : themeController.cornerRadius,
                      // Set to false to keep using M2 style FAB and ignore
                      // M3 typ default and global radius on the FAB, it remains
                      // circular or stadium shaped in extended mode.
                      fabUseShape: themeController.fabUseShape,
                      // Want color themed hover, focus, highlight and splash?
                      // Keep this one on.
                      interactionEffects: themeController.themedEffects,
                      // Themed opacity of bottom navigation bar.
                      bottomNavigationBarOpacity:
                          themeController.bottomNavigationBarOpacity,
                      // Elevation of bottom navigation bar.
                      bottomNavigationBarElevation:
                          themeController.bottomNavigationBarElevation,
                      // Text input field uses a themed fill color.
                      inputDecoratorIsFilled:
                          themeController.inputDecoratorIsFilled,
                      // Do you like underline or outline border type?
                      // We we could add some new styles in a future update.
                      inputDecoratorBorderType:
                          themeController.inputDecoratorIsOutlinedBorder,
                      // Only want a border when the text input has focus
                      // or error, set this to false. By default it always
                      // has a border of selected style.
                      inputDecoratorUnfocusedHasBorder:
                          themeController.inputDecoratorUnfocusedHasBorder,
                      // True gives a very light hint of primary color also to
                      // onColors for onSurface, onBackground and onError.
                      // It is on by default, the chosen effect is very subtle
                      // even at highest blend levels. On by default.
                      blendOnColors: themeController.blendLightOnColors,
                      // By default sub themes mode also opts-in for using
                      // colored text for the themed text, like Material3/You.
                      // These colors will likely change a bit later releases
                      // when we get Material3 support in Flutter.
                      // This already works very well tough. If you plan to
                      // put text on surfaces that are not primary color tinted
                      // or primary colored, then you may need to turn this
                      // off, or make custom text themes for those surfaces.
                      // Material3 has containers with matching text color
                      // tints, can't do that yet with only Themes in Flutter.
                      blendTextTheme: themeController.blendLightTextTheme,
                      // Set some opacity on popup menu, just to show a
                      // setting not available via themeController in the demo.
                      popupMenuOpacity: 0.96,
                    ),
                  )
                // Here we are NOT using FlexThemeData. We use the default
                // ThemeData.from method, just to see the differences.
                : ThemeData.from(
                    textTheme: ThemeData(
                      brightness: Brightness.light,
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
                      platform: themeController.platform,
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
                    platform: themeController.platform,
                    subThemesData: FlexSubThemesData(
                      useTextTheme: themeController.useTextTheme,
                      defaultRadius: themeController.useDefaultRadius
                          ? null
                          : themeController.cornerRadius,
                      fabUseShape: themeController.fabUseShape,
                      interactionEffects: themeController.themedEffects,
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
                      popupMenuOpacity: 0.95,
                    ),
                  )
                // Here we are NOT using FlexThemeData. We use the default
                // ThemeData.from method, to see the differences.
                : ThemeData.from(
                    textTheme: ThemeData(
                      brightness: Brightness.dark,
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
                      platform: themeController.platform,
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
