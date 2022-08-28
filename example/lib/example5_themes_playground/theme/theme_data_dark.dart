import 'package:flutter/material.dart';

import '../../shared/const/app_data.dart';
import '../../shared/controllers/theme_controller.dart';
import 'code_theme.dart';
import 'flex_theme_dark.dart';

// ignore_for_file: comment_references

/// Return a Flutter SDK standard created [ThemeData] object,
/// using the [ColorScheme] colors created by the current configuration
/// in our [FlexColorScheme] object as configured by the [ThemeController].
///
/// Here we do NOT use FlexColorScheme to make the theme. We use the SDK
/// ThemeData factory to make the theme instead. This is used in the demo
/// so you can toggle FlexColorScheme on/off and see the differences.
///
/// We use active [ColorScheme] by grabbing it from active FlexColorScheme
/// using its toScheme method. Which gives us a standard ColorScheme that we
/// can use with ThemeData to create the ThemeData from the exact same
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
ThemeData themeDataDark(ThemeController controller) {
  // Workaround for issue https://github.com/flutter/flutter/issues/103864.
  // TODO(rydmike): Remove when fix for issue #10386 has landed in stable.
  final Typography alwaysM3Typography =
      Typography.material2021(platform: controller.platform);
  final TextTheme? fakeM2TypographyTextTheme =
      controller.useMaterial3 ? null : AppData.m2TextTheme;
  final ColorScheme colorScheme =
      flexColorSchemeDark(controller, Colors.black).toScheme;
  final TextTheme? fakeM2TypographyPrimTextTheme =
      controller.useMaterial3 ? null : AppData.m2TextTheme;
  final bool primaryIsDark =
      ThemeData.estimateBrightnessForColor(colorScheme.primary) ==
          Brightness.dark;
  final TextTheme defPrimaryText =
      primaryIsDark ? alwaysM3Typography.white : alwaysM3Typography.black;
  final TextTheme effectivePrimaryTextTheme =
      defPrimaryText.merge(fakeM2TypographyPrimTextTheme);
  // End of fix for workaround for issue #10386

  return ThemeData(
    brightness: Brightness.dark,
    fontFamily: controller.useAppFont ? AppData.font : null,
    // TODO(rydmike): Remove when fix for issue #10386 has landed in stable.
    // Workaround for issue: https://github.com/flutter/flutter/issues/103864.
    textTheme: fakeM2TypographyTextTheme,
    // TODO(rydmike): Remove when fix for issue #10386 has landed in stable.
    // Workaround for issue: https://github.com/flutter/flutter/issues/103864.
    primaryTextTheme: effectivePrimaryTextTheme,
    // The ColorScheme we get here is the same one you can also generate
    // Copy/paste code for in the ThemesPlayground UI, and it represent the
    // effective scheme in the Playground app.
    colorScheme: colorScheme,
    // To our ThemeData we also apply the visual density, typography, selected
    // platform and useMaterial3 flag, that we used in FlexColorScheme created
    // ThemeData. We do this so created themes will be using the same features.
    visualDensity: AppData.visualDensity,
    platform: controller.platform,
    // The Flutter SDK new `useMaterial3` flag that is available in the UI,
    // still does very little in Flutter 2.10.x, but in later versions we can
    // use it to see what it changes.
    useMaterial3: controller.useMaterial3,
    // TODO(rydmike): Remove when fix for issue #10386 has landed in stable.
    // Workaround for issue: https://github.com/flutter/flutter/issues/103864.
    typography: alwaysM3Typography,
    // Typography used before workaround needed.
    // typography: Typography.material2018(platform: controller.platform),
    // Add a custom theme extension with light mode code highlight colors.
    extensions: <ThemeExtension<dynamic>>{
      CodeTheme.harmonized(colorScheme.surfaceTint, Brightness.dark),
    },
  );
}
