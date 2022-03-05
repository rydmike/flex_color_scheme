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
// a static class as AppColor.schemesCustom.
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
// in AppColor.schemesCustom and many other options.
//
// You can try this app as a web app at:
// https://rydmike.com/flexcolorscheme/themesplayground-v5
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
  // SharedPreferences service is only used for example 3, but you can swap in
  // the Hive based one for it as well.

  // The ThemeServiceHive constructor requires a box name, the others do not.
  // The box name is just a file name for the file that stores the settings.
  final ThemeService themeService = ThemeServiceHive('flex_scheme_box_5');
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
          // Using a built-in scheme or one of the custom colors in the demo?
          final bool useBuiltIn = themeController.schemeIndex > 2 &&
              themeController.schemeIndex < AppColor.schemesCustom.length - 1;
          // Get the enum index of scheme
          final int flexScheme = themeController.schemeIndex - 3;

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            scrollBehavior: AppScrollBehavior(),
            title: 'Themes Playground',
            theme: themeController.useFlexColorScheme
                ? FlexThemeData.light(
                    // dialogBackground: const Color(0xFFD69090),
                    // appBarBackground: const Color(0xFFAC52C3),
                    // Use controller to get current scheme colors, use custom
                    // color param only if we use an index where we have custom
                    // colors in use.
                    colors: !useBuiltIn
                        ? AppColor.scheme(themeController).light
                        : null,
                    // Otherwise use built-in scheme based property. We could
                    // use only the colors property, but then we do no see the
                    // correct keyColor behavior in dark mode, with built-in.
                    // Also a good test of that factory works as designed.
                    // The source code gen also uses this logic.
                    scheme: useBuiltIn ? FlexScheme.values[flexScheme] : null,
                    // Used number of colors
                    usedColors: themeController.usedColors,
                    // Use controller to select surface mode
                    surfaceMode: themeController.surfaceMode,
                    // Integer used to control the level of primary color
                    // surface blends applied to surfaces and backgrounds.
                    blendLevel: themeController.blendLevel,
                    // Enum used to select what AppBar style we use.
                    appBarStyle: themeController.lightAppBarStyle,
                    // Set background opacity on app bar.
                    appBarOpacity: themeController.appBarOpacity,
                    // Used to modify the themed AppBar elevation.
                    appBarElevation: themeController.appBarElevation,
                    // Used to control if we use one or two toned status bar.
                    transparentStatusBar: themeController.transparentStatusBar,
                    // Enum used to select what TabBar style we use.
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
                    // Swap primary and secondary colors.
                    swapColors: themeController.swapLightColors,
                    // Keep scaffold plain white in all blend modes.
                    lightIsWhite: themeController.lightIsWhite,
                    // Modify the value in the AppData class to change it.
                    visualDensity: AppData.visualDensity,
                    // Custom font, modify in AppData class to change it.
                    fontFamily: AppData.font,
                    // The platform can be toggled in the app, but not saved.
                    platform: themeController.platform,
                    // Use key color based M3 ColorScheme.
                    keyColors: FlexKeyColor(
                      useKeyColors: themeController.useKeyColors,
                      useSecondary: themeController.useSecondary,
                      useTertiary: themeController.useTertiary,
                      keepPrimary: themeController.keepPrimary,
                      keepSecondary: themeController.keepSecondary,
                      keepTertiary: themeController.keepTertiary,
                      keepPrimaryContainer:
                          themeController.keepPrimaryContainer,
                      keepSecondaryContainer:
                          themeController.keepSecondaryContainer,
                      keepTertiaryContainer:
                          themeController.keepTertiaryContainer,
                    ),

                    // Use predefined [FlexTones] setups for the generated
                    // [TonalPalette] and it's usage in [ColorScheme] config.
                    // You can make your custom [FlexTones] object right here
                    // and apps it it, this just uses an int value to select
                    // between a few preconfigured ones.
                    tones: AppColor.flexTonesConfig(
                        Brightness.light, themeController.usedFlexToneSetup),
                    // Opt-in/out of using Flutter SDK Material3 based theming
                    // features. In Flutter SDK 2.10.1 and earlier it has no
                    // effect, but it will later and then we can use this toggle
                    // with FlexColorScheme too, and in this demo we can see its
                    // impact easily.
                    useMaterial3: themeController.useMaterial3,
                    // Opt in/out of using opinionated sub-themes.
                    useSubThemes: themeController.useSubThemes,
                    // Options used to modify the sub-themes, there are more
                    // properties than this, but here we use:
                    subThemesData: FlexSubThemesData(
                      // Opt in/out of the Material 3 style matched TextTheme.
                      useTextTheme: themeController.useTextTheme,
                      // Value to adjust themed border radius on widgets with
                      // an adjustable corner rounding, this one is very handy.
                      // If null, it defaults to Material3 (You) design
                      // guide values, when available: https://m3.material.io/
                      // If you give it value, "all" Flutter built-in widgets
                      // supporting border radius will use the give radius.
                      defaultRadius: themeController.useDefaultRadius
                          ? null
                          : themeController.cornerRadius,
                      // Set to false to keep using M2 style FAB and ignore
                      // M3 type default and global radius on the FAB, it thus
                      // remains circular or stadium shaped in extended mode.
                      fabUseShape: themeController.fabUseShape,
                      // FAB color
                      fabSchemeColor: themeController.fabSchemeColor,
                      // Want color themed disable hover, focus, highlight and
                      // splash colors? Then keep this one on.
                      interactionEffects: themeController.interactionEffects,
                      // Style of unselected switch/checkbox/radio.
                      unselectedToggleIsColored:
                          themeController.unselectedIsColored,
                      // ColorScheme used on various widgets.
                      tabBarIndicatorSchemeColor:
                          themeController.tabBarIndicator,
                      chipSchemeColor: themeController.chipSchemeColor,
                      textButtonSchemeColor:
                          themeController.textButtonSchemeColor,
                      elevatedButtonSchemeColor:
                          themeController.elevatedButtonSchemeColor,
                      outlinedButtonSchemeColor:
                          themeController.outlinedButtonSchemeColor,
                      materialButtonSchemeColor:
                          themeController.materialButtonSchemeColor,
                      toggleButtonsSchemeColor:
                          themeController.toggleButtonsSchemeColor,
                      switchSchemeColor: themeController.switchSchemeColor,
                      checkboxSchemeColor: themeController.checkboxSchemeColor,
                      radioSchemeColor: themeController.radioSchemeColor,
                      dialogBackgroundSchemeColor:
                          themeController.dialogBackgroundSchemeColor,
                      tabBarItemSchemeColor:
                          themeController.tabBarItemSchemeColor,
                      appBarBackgroundSchemeColor:
                          themeController.appBarBackgroundSchemeColor,
                      // Text input field uses a themed fill color.
                      inputDecoratorIsFilled:
                          themeController.inputDecoratorIsFilled,
                      // Do you like underline or outline border type?
                      // (Might add some new styles in a future update)
                      inputDecoratorBorderType:
                          themeController.inputDecoratorBorderType,
                      // Only want a border when the text input has focus
                      // or error, then set this to false. By default it always
                      // has a border of selected style, but thinner.
                      inputDecoratorUnfocusedHasBorder:
                          themeController.inputDecoratorUnfocusedHasBorder,
                      // Base ColorScheme used by TextField InputDecorator.
                      inputDecoratorSchemeColor:
                          themeController.inputDecoratorSchemeColor,
                      // Blend level for on colors for on colors, primary
                      // secondary and tertiary and their containers.
                      blendOnLevel: themeController.blendOnLevel,
                      // Use blend level values also with main on colors, not
                      // only with container and on surfaces.
                      blendOnColors: themeController.blendLightOnColors,
                      // By default sub themes mode also opts in on using
                      // colored text for the themed text, like Material3 uses.
                      // These colors will likely change a bit in later releases
                      // when we get Material3 support in Flutter.
                      // This already works well enough tough. If you plan to
                      // put text on surfaces that are not primary color tinted
                      // or primary colored, then you may need to turn this
                      // off, or make custom text themes for those surfaces.
                      // Material3 has containers with matching text color
                      // tints. Can't do that yet with only Themes in Flutter.
                      blendTextTheme: themeController.blendLightTextTheme,
                      // Set some opacity on popup menu, just to show a
                      // setting not available via themeController in the demo.
                      popupMenuOpacity: 0.96,
                      //
                      // BottomNavigationBar settings
                      // Shares input with BottomNavigationBar.
                      //
                      // Elevation of BottomNavigationBar.
                      bottomNavigationBarElevation:
                          themeController.bottomNavigationBarElevation,
                      // Themed opacity of bottom navigation bar.
                      bottomNavigationBarOpacity:
                          themeController.bottomNavigationBarOpacity,
                      //
                      // Colors.
                      bottomNavigationBarBackgroundSchemeColor:
                          themeController.navBarBackgroundSchemeColor,
                      bottomNavigationBarSchemeColor:
                          themeController.navBarScheme,
                      //
                      // NavigationBar settings
                      // Shares input with BottomNavigationBar.
                      //
                      // Themed opacity of NavigationBar
                      navigationBarOpacity:
                          themeController.bottomNavigationBarOpacity,
                      // Colors
                      navigationBarBackgroundSchemeColor:
                          themeController.navBarBackgroundSchemeColor,
                      navigationBarIconSchemeColor:
                          themeController.navBarScheme,
                      navigationBarTextSchemeColor:
                          themeController.navBarScheme,
                      // The item highlight color of the M3 Navbar.
                      navigationBarHighlightSchemeColor:
                          themeController.navBarHighlight,
                      // Mute unselected icon and text color on NavigationBar.
                      navigationBarMutedUnselectedText:
                          themeController.navBarMuteUnselected,
                      navigationBarMutedUnselectedIcon:
                          themeController.navBarMuteUnselected,
                      //
                      // NavigationRail settings
                      //
                      // Shares controller inputs with navigation bars in
                      // this demo.
                      //
                      // Elevation of BottomNavigationBar.
                      navigationRailElevation:
                          themeController.bottomNavigationBarElevation,
                      // Themed opacity of bottom navigation bar.
                      navigationRailOpacity:
                          themeController.bottomNavigationBarOpacity,
                      // Colors.
                      navigationRailBackgroundSchemeColor:
                          themeController.navBarBackgroundSchemeColor,
                      navigationRailIconSchemeColor:
                          themeController.navBarScheme,
                      navigationRailTextSchemeColor:
                          themeController.navBarScheme,
                      navigationRailIndicatorSchemeColor:
                          themeController.navBarHighlight,
                      // Do we have an indicator or not
                      navigationRailUseIndicator: themeController.useIndicator,
                      // Mute unselected icon and text color on NavigationBar.
                      navigationRailMutedUnselectedText:
                          themeController.navBarMuteUnselected,
                      navigationRailMutedUnselectedIcon:
                          themeController.navBarMuteUnselected,
                    ),
                  )
                // Here we do NOT use FlexThemeData. We use the SDK
                // ThemeData.from factory to make the theme instead.
                // Toggle to see the differences.
                // We use active [ColorScheme] by grabbing it from
                // FlexColorScheme using its toScheme method. Which gives us
                // a standard ColorScheme that we can use with ThemeData.from
                // to create the ThemeData from same colors. The color scheme
                // it creates also contains the blends, but since ColorScheme
                // only contains surface and background colors and is missing
                // Scaffold and dialog color, it cannot provide those colors.
                //
                // The normal use case for FlexColorScheme.toScheme would be
                // that you define FlexColorScheme with the
                // FlexColorScheme.light and dark factories, instead of
                // FlexThemeData.light/dark, then you extract their ColorSchemes
                // and pass it along, or just some colors from it,
                // to custom sub-theme methods, so they can use the same scheme
                // colors when needed, many does need them. Then you create
                // the theme from your FlexColorScheme with toTheme, as before
                // version V4, and to the result apply the custom sub-themes
                // with copyWith on the resulting ThemeData, using the same
                // same ColorScheme or colors from it, as you ThemeData is
                // created with.
                : ThemeData.from(
                    textTheme: ThemeData(
                      brightness: Brightness.light,
                    ).textTheme,
                    colorScheme: FlexColorScheme.light(
                      colors: AppColor.scheme(themeController).light,
                      surfaceMode: themeController.surfaceMode,
                      blendLevel: themeController.blendLevel,
                      swapColors: themeController.swapLightColors,
                      lightIsWhite: themeController.lightIsWhite,
                    ).toScheme,
                  ).copyWith(
                    visualDensity: AppData.visualDensity,
                    typography: Typography.material2018(
                      platform: themeController.platform,
                    ),
                    platform: themeController.platform,
                  ),
            // We do the exact same definition for the dark theme, but using
            // FlexThemeData.dark() and the dark FlexSchemeColors and we add
            // use the darkIsTrueBlack option instead of the in light mode less
            // useful lightIsWhite option.
            darkTheme: themeController.useFlexColorScheme
                ? FlexThemeData.dark(
                    // Use controller to get current scheme colors, use custom
                    // color param only if we use an index where we have custom
                    // colors in use.
                    colors: !useBuiltIn || themeController.useToDarkMethod
                        ? AppColor.scheme(themeController).dark
                        : null,
                    // Otherwise use built-in scheme based property. We could
                    // use only the colors property, but then we do no see the
                    // correct keyColor behavior in dark mode, with built-in.
                    // Also a good test of that factory works as designed.
                    // The source code gen also uses this logic.
                    scheme: useBuiltIn && !themeController.useToDarkMethod
                        ? FlexScheme.values[flexScheme]
                        : null,
                    // Used number of colors
                    usedColors: themeController.usedColors,
                    // Use key color based M3 ColorScheme.
                    keyColors: FlexKeyColor(
                      useKeyColors: themeController.useKeyColors,
                      useSecondary: themeController.useSecondary,
                      useTertiary: themeController.useTertiary,
                      keepPrimary: themeController.keepPrimary,
                      keepSecondary: themeController.keepSecondary,
                      keepTertiary: themeController.keepTertiary,
                      keepPrimaryContainer:
                          themeController.keepPrimaryContainer,
                      keepSecondaryContainer:
                          themeController.keepSecondaryContainer,
                      keepTertiaryContainer:
                          themeController.keepTertiaryContainer,
                    ),
                    // Dark custom tones configs.
                    tones: AppColor.flexTonesConfig(
                        Brightness.dark, themeController.usedFlexToneSetup),
                    // For reduced complexity in this demo, we use the same
                    // control value for surface mode selection and blend level
                    // for light and dark mode. They can as shown in earlier
                    // examples be different and in light and dark mode, you
                    // can mix and match whatever fits your design goals.
                    surfaceMode: themeController.surfaceMode,
                    blendLevel: themeController.blendLevelDark,
                    appBarStyle: themeController.darkAppBarStyle,
                    appBarOpacity: themeController.appBarOpacity,
                    appBarElevation: themeController.appBarElevation,
                    transparentStatusBar: themeController.transparentStatusBar,
                    tabBarStyle: themeController.tabBarStyle,
                    tooltipsMatchBackground:
                        themeController.tooltipsMatchBackground,
                    swapColors: themeController.swapDarkColors,
                    darkIsTrueBlack: themeController.darkIsTrueBlack,
                    visualDensity: AppData.visualDensity,
                    fontFamily: AppData.font,
                    platform: themeController.platform,
                    useMaterial3: themeController.useMaterial3,
                    useSubThemes: themeController.useSubThemes,
                    subThemesData: FlexSubThemesData(
                      useTextTheme: themeController.useTextTheme,
                      defaultRadius: themeController.useDefaultRadius
                          ? null
                          : themeController.cornerRadius,
                      fabUseShape: themeController.fabUseShape,
                      fabSchemeColor: themeController.fabSchemeColor,
                      interactionEffects: themeController.interactionEffects,
                      unselectedToggleIsColored:
                          themeController.unselectedIsColored,
                      tabBarIndicatorSchemeColor:
                          themeController.tabBarIndicator,
                      chipSchemeColor: themeController.chipSchemeColor,
                      textButtonSchemeColor:
                          themeController.textButtonSchemeColor,
                      elevatedButtonSchemeColor:
                          themeController.elevatedButtonSchemeColor,
                      outlinedButtonSchemeColor:
                          themeController.outlinedButtonSchemeColor,
                      materialButtonSchemeColor:
                          themeController.materialButtonSchemeColor,
                      toggleButtonsSchemeColor:
                          themeController.toggleButtonsSchemeColor,
                      switchSchemeColor: themeController.switchSchemeColor,
                      checkboxSchemeColor: themeController.checkboxSchemeColor,
                      radioSchemeColor: themeController.radioSchemeColor,
                      dialogBackgroundSchemeColor:
                          themeController.dialogBackgroundSchemeColor,
                      tabBarItemSchemeColor:
                          themeController.tabBarItemSchemeColor,
                      appBarBackgroundSchemeColor:
                          themeController.appBarBackgroundSchemeColor,
                      inputDecoratorIsFilled:
                          themeController.inputDecoratorIsFilled,
                      inputDecoratorBorderType:
                          themeController.inputDecoratorBorderType,
                      inputDecoratorUnfocusedHasBorder:
                          themeController.inputDecoratorUnfocusedHasBorder,
                      inputDecoratorSchemeColor:
                          themeController.inputDecoratorSchemeColor,
                      blendOnLevel: themeController.blendOnLevelDark,
                      blendOnColors: themeController.blendDarkOnColors,
                      blendTextTheme: themeController.blendDarkTextTheme,
                      popupMenuOpacity: 0.95,
                      // BottomNavigationBar settings
                      bottomNavigationBarElevation:
                          themeController.bottomNavigationBarElevation,
                      bottomNavigationBarOpacity:
                          themeController.bottomNavigationBarOpacity,
                      bottomNavigationBarBackgroundSchemeColor:
                          themeController.navBarBackgroundSchemeColor,
                      bottomNavigationBarSchemeColor:
                          themeController.navBarScheme,
                      // NavigationBar settings
                      navigationBarOpacity:
                          themeController.bottomNavigationBarOpacity,
                      navigationBarBackgroundSchemeColor:
                          themeController.navBarBackgroundSchemeColor,
                      navigationBarIconSchemeColor:
                          themeController.navBarScheme,
                      navigationBarTextSchemeColor:
                          themeController.navBarScheme,
                      // The item highlight color of the M3 Navbar.
                      navigationBarHighlightSchemeColor:
                          themeController.navBarHighlight,
                      // Mute unselected icon and text color on NavigationBar.
                      navigationBarMutedUnselectedText:
                          themeController.navBarMuteUnselected,
                      navigationBarMutedUnselectedIcon:
                          themeController.navBarMuteUnselected,
                      // NavigationRail settings
                      navigationRailElevation:
                          themeController.bottomNavigationBarElevation,
                      navigationRailOpacity:
                          themeController.bottomNavigationBarOpacity,
                      navigationRailBackgroundSchemeColor:
                          themeController.navBarBackgroundSchemeColor,
                      navigationRailIconSchemeColor:
                          themeController.navBarScheme,
                      navigationRailTextSchemeColor:
                          themeController.navBarScheme,
                      navigationRailIndicatorSchemeColor:
                          themeController.navBarHighlight,
                      navigationRailUseIndicator: themeController.useIndicator,
                      navigationRailMutedUnselectedText:
                          themeController.navBarMuteUnselected,
                      navigationRailMutedUnselectedIcon:
                          themeController.navBarMuteUnselected,
                    ),
                  )
                // Here we are NOT using FlexThemeData. We use the default
                // ThemeData.from method, to see the differences.
                : ThemeData.from(
                    textTheme: ThemeData(
                      brightness: Brightness.dark,
                    ).textTheme,
                    colorScheme: FlexColorScheme.dark(
                      colors: AppColor.scheme(themeController).dark,
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
                    platform: themeController.platform,
                  ),
            // Use the dark or light theme based on controller setting.
            themeMode: themeController.themeMode,
            // Here we only pass the theme controller to the HomePage.
            home: HomePage(controller: themeController),
          );
        });
  }
}
