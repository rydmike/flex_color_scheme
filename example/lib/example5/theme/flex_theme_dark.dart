import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../shared/const/app_color.dart';
import '../../shared/const/app_data.dart';
import '../../shared/controllers/theme_controller.dart';

/// This function calls [flexColorSchemeDark] and uses
/// [FlexColorScheme.toTheme] to return the [ThemeData] object represented by
/// the returned [FlexColorScheme] setup.
///
/// We do it this way and not directly, or by setting it all up with the
/// convenience extension helper [FlexThemeData.dark], because when we create
/// a standard Flutter SDK theme with [ThemeData.from] a [ColorScheme] factory,
/// we will use the same [flexColorSchemeDark] dark function to return
/// the [ColorScheme] it represents with its [FlexColorScheme.toScheme] method.
///
/// The [ThemeData.from] a [ColorScheme] will be used to demonstrate difference
/// using the exact same [ColorScheme], but using just default [ThemeData] with
/// no [FlexColorScheme] theming applied.
///
ThemeData flexThemeDark(ThemeController controller) =>
    flexColorSchemeDark(controller).toTheme;

/// Create the FlexColorScheme object represented by our current
/// [ThemeController] configuration.
///
/// This setup may seem complex, but all the controller does is represent
/// configuration values selected in the UI that are input to a large number
/// of properties in [FlexColorScheme], so we can dynamically produce the
/// configured theme.
///
/// Normally you would probably only have a few properties offered as possible
/// features the user can change. Since this is a feature demo of almost
/// everything [FlexColorScheme] it is a bit wild.
///
/// This function returns the Dark theme mode data that we us in the
/// ThemesPlayground app.
///
/// The function only contains tutorial comments on topics not covered in the
/// almost identical `flexColorSchemeLight` function. Please see it for
/// more tutorial comments.
FlexColorScheme flexColorSchemeDark(ThemeController controller) {
  final bool useBuiltIn = controller.schemeIndex > 2 &&
      controller.schemeIndex < AppColor.schemesCustom.length - 1;
  final int flexScheme = controller.schemeIndex - 3;

  return FlexColorScheme.dark(
    colors: !useBuiltIn || controller.useToDarkMethod
        ? AppColor.scheme(controller).dark
        : null,
    scheme: useBuiltIn && !controller.useToDarkMethod
        ? FlexScheme.values[flexScheme]
        : null,
    usedColors: controller.usedColors,
    // For reduced complexity in this demo, we use the same
    // control value for surface mode selection and blend level
    // for light and dark mode. They can as shown in earlier
    // examples be different and in light and dark mode, you
    // can mix and match whatever fits your design goals.
    surfaceMode: controller.surfaceMode,
    blendLevel: controller.blendLevelDark,
    appBarStyle: controller.darkAppBarStyle,
    appBarOpacity: controller.appBarOpacity,
    transparentStatusBar: controller.transparentStatusBar,
    appBarElevation: controller.appBarElevation,
    tabBarStyle: controller.tabBarStyle,
    darkIsTrueBlack: controller.darkIsTrueBlack,
    swapColors: controller.swapDarkColors,
    tooltipsMatchBackground: controller.tooltipsMatchBackground,
    //
    useSubThemes: controller.useSubThemes,
    subThemesData: FlexSubThemesData(
      interactionEffects: controller.interactionEffects,
      blendOnLevel: controller.blendOnLevelDark,
      blendOnColors: controller.blendDarkOnColors,
      blendTextTheme: controller.blendDarkTextTheme,
      useTextTheme: controller.useTextTheme,
      defaultRadius:
          controller.useDefaultRadius ? null : controller.cornerRadius,
      //
      textButtonSchemeColor: controller.textButtonSchemeColor,
      elevatedButtonSchemeColor: controller.elevatedButtonSchemeColor,
      outlinedButtonSchemeColor: controller.outlinedButtonSchemeColor,
      materialButtonSchemeColor: controller.materialButtonSchemeColor,
      toggleButtonsSchemeColor: controller.toggleButtonsSchemeColor,
      switchSchemeColor: controller.switchSchemeColor,
      checkboxSchemeColor: controller.checkboxSchemeColor,
      radioSchemeColor: controller.radioSchemeColor,
      unselectedToggleIsColored: controller.unselectedIsColored,
      //
      inputDecoratorSchemeColor: controller.inputDecoratorSchemeColor,
      inputDecoratorIsFilled: controller.inputDecoratorIsFilled,
      inputDecoratorBorderType: controller.inputDecoratorBorderType,
      inputDecoratorUnfocusedHasBorder:
          controller.inputDecoratorUnfocusedHasBorder,
      //
      fabUseShape: controller.fabUseShape,
      fabSchemeColor: controller.fabSchemeColor,
      chipSchemeColor: controller.chipSchemeColor,
      popupMenuOpacity: 0.95,
      //
      dialogBackgroundSchemeColor: controller.dialogBackgroundSchemeColor,
      appBarBackgroundSchemeColor: controller.appBarBackgroundSchemeColor,
      tabBarItemSchemeColor: controller.tabBarItemSchemeColor,
      tabBarIndicatorSchemeColor: controller.tabBarIndicator,
      // BottomNavigationBar settings
      bottomNavigationBarSelectedLabelSchemeColor:
          controller.navBarSelectedSchemeColor,
      bottomNavigationBarUnselectedLabelSchemeColor:
          controller.navUnselectedSchemeColor,
      bottomNavigationBarMutedUnselectedLabel: controller.navBarMuteUnselected,
      bottomNavigationBarSelectedIconSchemeColor:
          controller.navBarSelectedSchemeColor,
      bottomNavigationBarUnselectedIconSchemeColor:
          controller.navUnselectedSchemeColor,
      bottomNavigationBarMutedUnselectedIcon: controller.navBarMuteUnselected,
      bottomNavigationBarBackgroundSchemeColor:
          controller.navBarBackgroundSchemeColor,
      bottomNavigationBarOpacity: controller.bottomNavigationBarOpacity,
      bottomNavigationBarElevation: controller.bottomNavigationBarElevation,
      bottomNavigationBarShowSelectedLabels:
          controller.bottomNavShowSelectedLabels,
      bottomNavigationBarShowUnselectedLabels:
          controller.bottomNavShowUnselectedLabels,
      // NavigationBar settings
      navigationBarSelectedLabelSchemeColor:
          controller.navBarSelectedSchemeColor,
      navigationBarUnselectedLabelSchemeColor:
          controller.navUnselectedSchemeColor,
      navigationBarMutedUnselectedLabel: controller.navBarMuteUnselected,
      navigationBarSelectedIconSchemeColor:
          controller.navBarSelectedSchemeColor,
      navigationBarUnselectedIconSchemeColor:
          controller.navUnselectedSchemeColor,
      navigationBarMutedUnselectedIcon: controller.navBarMuteUnselected,
      navigationBarHighlightSchemeColor: controller.navBarHighlight,
      navigationBarBackgroundSchemeColor:
          controller.navBarBackgroundSchemeColor,
      navigationBarOpacity: controller.bottomNavigationBarOpacity,
      navigationBarLabelBehavior: controller.navBarLabelBehavior,
      // NavigationRail settings
      navigationRailSelectedLabelSchemeColor:
          controller.navBarSelectedSchemeColor,
      navigationRailUnselectedLabelSchemeColor:
          controller.navUnselectedSchemeColor,
      navigationRailMutedUnselectedLabel: controller.navBarMuteUnselected,
      navigationRailSelectedIconSchemeColor:
          controller.navBarSelectedSchemeColor,
      navigationRailUnselectedIconSchemeColor:
          controller.navUnselectedSchemeColor,
      navigationRailMutedUnselectedIcon: controller.navBarMuteUnselected,
      navigationRailUseIndicator: controller.useIndicator,
      navigationRailIndicatorSchemeColor: controller.navBarHighlight,
      navigationRailBackgroundSchemeColor:
          controller.navBarBackgroundSchemeColor,
      navigationRailOpacity: controller.bottomNavigationBarOpacity,
      navigationRailElevation: controller.bottomNavigationBarElevation,
      navigationRailLabelType: controller.navRailLabelType,
    ),
    //
    // Advanced color properties for seed generated ColorScheme's
    // Use key color based M3 ColorScheme.
    keyColors: FlexKeyColors(
      useKeyColors: controller.useKeyColors,
      useSecondary: controller.useSecondary,
      useTertiary: controller.useTertiary,
      keepPrimary: controller.keepPrimary,
      keepSecondary: controller.keepSecondary,
      keepTertiary: controller.keepTertiary,
      keepPrimaryContainer: controller.keepPrimaryContainer,
      keepSecondaryContainer: controller.keepSecondaryContainer,
      keepTertiaryContainer: controller.keepTertiaryContainer,
    ),
    useMaterial3ErrorColors: controller.useM3ErrorColors,
    tones:
        AppColor.flexTonesConfig(Brightness.dark, controller.usedFlexToneSetup),
    //
    // ThemeData properties passed along directly to ThemeData.
    visualDensity: AppData.visualDensity,
    fontFamily: AppData.font,
    platform: controller.platform,
    useMaterial3: controller.useMaterial3,
  );
}
