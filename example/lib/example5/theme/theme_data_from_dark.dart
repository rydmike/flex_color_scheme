import 'package:flutter/material.dart';

import '../../shared/const/app_data.dart';
import '../../shared/controllers/theme_controller.dart';
import 'flex_theme_dark.dart';

// ignore_for_file: comment_references

/// Return a Flutter SDK standard [ThemeData.from] created [ThemeData] object,
/// using the [ColorScheme] colors created by the current configuration
/// in our [FlexColorScheme] object as configured by the [ThemeController].
///
/// Here we do NOT use FlexColorScheme to make the theme. We use the SDK
/// ThemeData.from factory to make the theme instead. This is used in the demo
/// so you can toggle FlexColorScheme on/off and see the differences.
///
/// We use active [ColorScheme] by grabbing it from active FlexColorScheme
/// using its toScheme method. Which gives us a standard ColorScheme that we
/// can use with ThemeData.from to create the ThemeData from the exact same
/// colors. The [ColorScheme] it creates also contains the blends, M3 seeded
/// color etc, but since [ColorScheme], only contains surface and background
/// colors and is missing [FlexColorScheme] custom Scaffold and dialog color,
/// it cannot provide those colors.
///
/// NOTE:
/// The normal use case for FlexColorScheme.toScheme would be that you define
/// FlexColorScheme with the FlexColorScheme.light and dark factories, instead
/// of FlexThemeData.light/dark, then you extract their ColorSchemes, like here,
/// and pass it along, or just some colors from it, to custom sub-theme methods,
/// so they can use the same scheme colors when needed, many sub-themes need
/// them. Then you create the theme from your FlexColorScheme with toTheme,
/// and to the result apply the custom sub-themes with copyWith on the resulting
/// ThemeData, using the same same ColorScheme or colors from it, as your
/// ThemeData is created with, thus using the same colors in your custom
/// sub-themes.
ThemeData themeDataFromDark(ThemeController controller) {
  return ThemeData.from(
    textTheme: ThemeData(
      brightness: Brightness.dark,
      fontFamily: controller.useAppFont ? AppData.font : null,
    ).textTheme,
    // The ColorScheme we get here is the same one you can also generate
    // Copy/paste code for in the ThemesPlayground UI, and it represent the
    // effective scheme in the Playground app.
    colorScheme: flexColorSchemeDark(controller).toScheme,
  ).copyWith(
    // To our ThemeData we also apply the visual density, typography, selected
    // platform and useMaterial3 flag, that we used in FlexColorScheme created
    // ThemeData. We do this so created themes will be using the same features.
    visualDensity: AppData.visualDensity,
    typography: Typography.material2018(platform: controller.platform),
    platform: controller.platform,
    // The Flutter SDK new `useMaterial3` flag that is available in the UI,
    // still does very little in Flutter 2.10.x, but in later versions we can
    // use it to see what it changes.
    useMaterial3: controller.useMaterial3,
  );
}
