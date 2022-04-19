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
      controller.schemeIndex < AppColor.schemes.length - 1;
  final int flexScheme = controller.schemeIndex - 3;
  final bool useScheme = useBuiltIn && !controller.useToDarkMethod;

  return FlexColorScheme.dark(
    // Use scheme based config, when we are using a built-in `FlexScheme`
    // based schemes.
    scheme: useScheme ? FlexScheme.values[flexScheme] : null,
    // Switch to using `FlexSchemeColor` when using 3 first custom schemes or
    // the last one that is customizable.
    colors: !useScheme ? AppColor.scheme(controller).dark : null,
    usedColors: controller.usedColors,
    surfaceMode: controller.surfaceModeDark,
    blendLevel: controller.blendLevelDark,
    appBarStyle: controller.appBarStyleDark,
    appBarOpacity: controller.appBarOpacityDark,
    transparentStatusBar: controller.transparentStatusBar,
    appBarElevation: controller.appBarElevationDark,
    tabBarStyle: controller.tabBarStyle,
    darkIsTrueBlack: controller.darkIsTrueBlack,
    swapColors: controller.swapDarkColors,
    tooltipsMatchBackground: controller.tooltipsMatchBackground,
    //
    subThemesData: controller.useSubThemes
        ? FlexSubThemesData(
            interactionEffects: controller.interactionEffects,
            blendOnLevel: controller.blendOnLevelDark,
            blendOnColors: controller.blendDarkOnColors,
            blendTextTheme: controller.blendDarkTextTheme,
            useFlutterDefaults: controller.useFlutterDefaults,
            useTextTheme: controller.useTextTheme,
            //
            defaultRadius: controller.defaultRadius,
            bottomSheetRadius: controller.bottomSheetBorderRadius,
            textButtonRadius: controller.textButtonBorderRadius,
            elevatedButtonRadius: controller.elevatedButtonBorderRadius,
            outlinedButtonRadius: controller.outlinedButtonBorderRadius,
            toggleButtonsRadius: controller.toggleButtonsBorderRadius,
            //
            textButtonSchemeColor: controller.textButtonSchemeColor,
            elevatedButtonSchemeColor: controller.elevatedButtonSchemeColor,
            outlinedButtonSchemeColor: controller.outlinedButtonSchemeColor,
            toggleButtonsSchemeColor: controller.toggleButtonsSchemeColor,
            switchSchemeColor: controller.switchSchemeColor,
            checkboxSchemeColor: controller.checkboxSchemeColor,
            radioSchemeColor: controller.radioSchemeColor,
            unselectedToggleIsColored: controller.unselectedToggleIsColored,
            //
            inputDecoratorSchemeColor: controller.inputDecoratorSchemeColorDark,
            inputDecoratorIsFilled: controller.inputDecoratorIsFilled,
            inputDecoratorBorderType: controller.inputDecoratorBorderType,
            inputDecoratorRadius: controller.inputDecoratorBorderRadius,
            inputDecoratorUnfocusedHasBorder:
                controller.inputDecoratorUnfocusedHasBorder,
            inputDecoratorUnfocusedBorderIsColored:
                controller.inputDecoratorUnfocusedBorderIsColored,
            //
            fabUseShape: controller.fabUseShape,
            fabRadius: controller.fabBorderRadius,
            fabSchemeColor: controller.fabSchemeColor,
            snackBarBackgroundSchemeColor: controller.snackBarSchemeColor,
            chipSchemeColor: controller.chipSchemeColor,
            chipRadius: controller.chipBorderRadius,
            cardRadius: controller.cardBorderRadius,
            popupMenuOpacity: controller.popupMenuOpacity,
            popupMenuRadius: controller.popupMenuBorderRadius,
            //
            dialogBackgroundSchemeColor: controller.dialogBackgroundSchemeColor,
            dialogRadius: controller.dialogBorderRadius,
            timePickerDialogRadius: controller.dialogBorderRadius,
            appBarBackgroundSchemeColor:
                controller.appBarBackgroundSchemeColorDark,
            tabBarItemSchemeColor: controller.tabBarItemSchemeColorDark,
            tabBarIndicatorSchemeColor: controller.tabBarIndicatorDark,
            // BottomNavigationBar settings
            bottomNavigationBarSelectedLabelSchemeColor:
                controller.bottomNavBarSelectedSchemeColor,
            bottomNavigationBarUnselectedLabelSchemeColor:
                controller.bottomNavBarUnselectedSchemeColor,
            bottomNavigationBarMutedUnselectedLabel:
                controller.bottomNavBarMuteUnselected,
            bottomNavigationBarSelectedIconSchemeColor:
                controller.bottomNavBarSelectedSchemeColor,
            bottomNavigationBarUnselectedIconSchemeColor:
                controller.bottomNavBarUnselectedSchemeColor,
            bottomNavigationBarMutedUnselectedIcon:
                controller.bottomNavBarMuteUnselected,
            bottomNavigationBarBackgroundSchemeColor:
                controller.bottomNavBarBackgroundSchemeColor,
            bottomNavigationBarOpacity: controller.bottomNavigationBarOpacity,
            bottomNavigationBarElevation:
                controller.bottomNavigationBarElevation,
            bottomNavigationBarShowSelectedLabels:
                controller.bottomNavShowSelectedLabels,
            bottomNavigationBarShowUnselectedLabels:
                controller.bottomNavShowUnselectedLabels,
            // NavigationBar settings
            navigationBarSelectedLabelSchemeColor:
                controller.navBarSelectedSchemeColor,
            navigationBarUnselectedLabelSchemeColor:
                controller.navBarUnselectedSchemeColor,
            navigationBarMutedUnselectedLabel: controller.navBarMuteUnselected,
            navigationBarSelectedIconSchemeColor:
                controller.navBarSelectedSchemeColor,
            navigationBarUnselectedIconSchemeColor:
                controller.navBarUnselectedSchemeColor,
            navigationBarMutedUnselectedIcon: controller.navBarMuteUnselected,
            navigationBarIndicatorSchemeColor:
                controller.navBarIndicatorSchemeColor,
            navigationBarIndicatorOpacity: controller.navBarIndicatorOpacity,
            navigationBarBackgroundSchemeColor:
                controller.navBarBackgroundSchemeColor,
            navigationBarOpacity: controller.navBarOpacity,
            navigationBarHeight: controller.navBarHeight,
            navigationBarLabelBehavior: controller.navBarLabelBehavior,
            // NavigationRail settings
            navigationRailSelectedLabelSchemeColor:
                controller.navRailSelectedSchemeColor,
            navigationRailUnselectedLabelSchemeColor:
                controller.navRailUnselectedSchemeColor,
            navigationRailMutedUnselectedLabel:
                controller.navRailMuteUnselected,
            navigationRailSelectedIconSchemeColor:
                controller.navRailSelectedSchemeColor,
            navigationRailUnselectedIconSchemeColor:
                controller.navRailUnselectedSchemeColor,
            navigationRailMutedUnselectedIcon: controller.navRailMuteUnselected,
            navigationRailUseIndicator: controller.navRailUseIndicator,
            navigationRailIndicatorSchemeColor:
                controller.navRailIndicatorSchemeColor,
            navigationRailIndicatorOpacity: controller.navRailIndicatorOpacity,
            navigationRailBackgroundSchemeColor:
                controller.navRailBackgroundSchemeColor,
            navigationRailOpacity: controller.navRailOpacity,
            navigationRailElevation: controller.navigationRailElevation,
            navigationRailLabelType: controller.navRailLabelType,
          )
        : null,
    //
    // Advanced color properties for seed generated ColorScheme's
    // Use key color based M3 ColorScheme.
    keyColors: FlexKeyColors(
      useKeyColors: controller.useKeyColors,
      useSecondary: controller.useSecondary,
      useTertiary: controller.useTertiary,
      keepPrimary: controller.keepDarkPrimary,
      keepSecondary: controller.keepDarkSecondary,
      keepTertiary: controller.keepDarkTertiary,
      keepPrimaryContainer: controller.keepDarkPrimaryContainer,
      keepSecondaryContainer: controller.keepDarkSecondaryContainer,
      keepTertiaryContainer: controller.keepDarkTertiaryContainer,
    ),
    useMaterial3ErrorColors: controller.useM3ErrorColors,
    tones:
        AppColor.flexTonesConfig(Brightness.dark, controller.usedFlexToneSetup),
    //
    // ThemeData properties passed along directly to ThemeData.
    visualDensity: AppData.visualDensity,
    fontFamily: controller.useAppFont ? AppData.font : null,
    platform: controller.platform,
    useMaterial3: controller.useMaterial3,
  );
}
