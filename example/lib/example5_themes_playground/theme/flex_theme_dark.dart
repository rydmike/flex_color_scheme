import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../shared/const/app_color.dart';
import '../../shared/const/app_data.dart';
import '../../shared/const/flex_tone.dart';
import '../../shared/controllers/theme_controller.dart';
import 'code_theme.dart';

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
ThemeData flexThemeDark(ThemeController controller) {
  // Get the effective theme primary color, so we can use it as source color to
  // harmonize the CodeTheme extension colors towards it. Which is done by using
  // the M3 package MaterialColorUtilities function Blend.harmonize. At this
  // point the source color does not matter.
  //
  // Here it is worth pointing out this creates an extra FlexColorScheme that we
  // never use to make our ThemeData, we only use it to get its identical
  // effective ColorScheme and then grab the effective primary color. We then
  // proceed to make an almost identical FlexColorScheme, but with the effective
  // primary color we got as its color, and use it as source color to harmonize
  // our out custom theme extension colors with it.
  //
  // The way the M3 seed based color algorithm and the harmonize color functions
  // work. We could actually use our ThemeController `controller` here and get
  // the effective input color via it. Then use that as source color for
  // the harmonization. In tests this produced same harmonization results as
  // when using the actual effective tint color created when also using it
  // as a seed to make the effective ColorScheme.
  // However, in dark mode, when not using seeds, but generating dark mode
  // colors from light mode primary color, with or without swap primary and
  // container colors on, by using `toDark` to compute the dark mode tint
  // color from the light mode primary input color. The harmonization results
  // diverge a bit from the harmonization result based on actual effective dark
  // mode tint color and using the in the controller accessible input color
  // as source color. This way by getting the actual effective ColorScheme is
  // simpler and guaranteed to always produce the right M3 intended color
  // harmonization towards the effective surface tint color. Regardless of what
  // settings and config we have used in the Themes Playground to define and
  // make our surface tint color, even custom one is adjusted for.
  final Color source =
      flexColorSchemeDark(controller, Colors.black).toScheme.surfaceTint;
  // Now we can use a function that takes our ThemeController and source color,
  // which is the effective primary color, the get the effective ThemeData.
  return flexColorSchemeDark(controller, source).toTheme;
}

/// Create the FlexColorScheme object represented by our current
/// [ThemeController] value [controller] configuration and [source] color.
///
/// The [source] color is used to color adjust all the custom code highlight
/// theme colors added via ThemeData extension [CodeTheme], towards the
/// [source] color.
///
/// This setup may seem complex, but all the controller does is represent
/// configuration values selected in the UI that are input to a large number
/// of properties in [FlexColorScheme], so we can dynamically produce the
/// configured theme.
///
/// Normally you would probably only have a few properties offered as possible
/// features the user can change. Since this is a feature demo of almost
/// everything [FlexColorScheme] can do, it is a bit wild.
///
/// The function below only contains tutorial comments on topics not covered in
/// the almost identical `flexColorSchemeLight` function. Please see it for
/// more tutorial comments.
FlexColorScheme flexColorSchemeDark(ThemeController controller, Color source) {
  final bool useBuiltIn = controller.schemeIndex > 2 &&
      controller.schemeIndex < AppColor.schemes.length - 1;
  final int flexScheme = controller.schemeIndex - 3;
  final bool useScheme = useBuiltIn && !controller.useToDarkMethod;

  // TODO(rydmike): Remove when fix for issue #10386 has landed in stable.
  // Workaround for issue https://github.com/flutter/flutter/issues/103864.
  final bool useFakeTypo2018 =
      (controller.useSubThemes && !controller.useTextTheme) ||
          (!controller.useSubThemes && !controller.useMaterial3);
  final TextTheme? fakeM2TypographyTextTheme =
      useFakeTypo2018 ? AppData.m2TextTheme : null;
  final Typography alwaysM3Typography =
      Typography.material2021(platform: controller.platform);
  // End of fix variables for issue #10386

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
            thinBorderWidth: controller.thinBorderWidth,
            thickBorderWidth: controller.thickBorderWidth,
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
            elevatedButtonSecondarySchemeColor:
                controller.elevatedButtonSecondarySchemeColor,
            outlinedButtonSchemeColor: controller.outlinedButtonSchemeColor,
            outlinedButtonOutlineSchemeColor:
                controller.outlinedButtonOutlineSchemeColor,
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
    tones: FlexTone.values[controller.usedFlexToneSetup].tones(Brightness.dark),
    // Use custom surface tint color.
    surfaceTint: controller.surfaceTintDark,
    //
    // ThemeData properties passed along directly to ThemeData.
    visualDensity: AppData.visualDensity,
    fontFamily: controller.useAppFont ? AppData.font : null,
    platform: controller.platform,
    useMaterial3: controller.useMaterial3,
    // Workaround for issue: https://github.com/flutter/flutter/issues/103864.
    // TODO(rydmike): Remove when fix for issue #10386 has landed in stable.
    typography: alwaysM3Typography,
    // Workaround for issue: https://github.com/flutter/flutter/issues/103864.
    // TODO(rydmike): Remove when fix for issue #10386 has landed in stable.
    textTheme: fakeM2TypographyTextTheme,
    primaryTextTheme: fakeM2TypographyTextTheme,
    // Add a custom theme extension with light mode code highlight colors.
    extensions: <ThemeExtension<dynamic>>{
      CodeTheme.harmonized(source, Brightness.dark),
    },
  );
}
