import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../shared/const/app_color.dart';
import '../../shared/const/app_data.dart';
import '../../shared/const/flex_tone.dart';
import '../../shared/controllers/theme_controller.dart';
import 'code_theme.dart';

/// This function calls [flexColorSchemeLight] and uses
/// [FlexColorScheme.toTheme] to return the [ThemeData] object represented by
/// the returned [FlexColorScheme] setup.
///
/// We do it this way and not directly, or by setting it all up with the
/// convenience extension helper [FlexThemeData.light], because when we create
/// a standard Flutter SDK theme with [ThemeData.from] a [ColorScheme] factory,
/// we will use the same [flexColorSchemeLight] light function to return
/// the [ColorScheme] it represents with its [FlexColorScheme.toScheme] method.
///
/// The [ThemeData.from] a [ColorScheme] will be used to demonstrate difference
/// using the exact same [ColorScheme], but using just default [ThemeData] with
/// no [FlexColorScheme] theming applied.
ThemeData flexThemeLight(ThemeController controller) {
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
      flexColorSchemeLight(controller, Colors.black).toScheme.surfaceTint;
  // Now we can use a function that takes our ThemeController and source color,
  // which is the effective primary color, the get the effective ThemeData.
  return flexColorSchemeLight(controller, source).toTheme;
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
FlexColorScheme flexColorSchemeLight(ThemeController controller, Color source) {
  // Using a built-in scheme or one of the custom colors in the demo?
  final bool useBuiltIn = controller.schemeIndex > 2 &&
      controller.schemeIndex < AppColor.schemes.length - 1;
  // Get the enum index of scheme
  final int flexScheme = controller.schemeIndex - 3;

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

  return FlexColorScheme.light(
    // Use controller to get current scheme colors, use custom "colors"
    // property only if we use an index where we have custom colors in use.
    colors: !useBuiltIn ? AppColor.scheme(controller).light : null,
    // Otherwise use built-in scheme based property. We could
    // use only the colors property, but then we do no see the
    // correct keyColor behavior in dark mode, with built-in.
    // Also a good test of that factory works as designed.
    // The source code gen also uses this logic.
    scheme: useBuiltIn ? FlexScheme.values[flexScheme] : null,
    // Used number of colors from the selected input FlexColorScheme based theme
    usedColors: controller.usedColors,
    // Use controller to select surface mode
    surfaceMode: controller.surfaceModeLight,
    // Integer used to control the level of primary color
    // surface blends applied to surfaces and backgrounds.
    blendLevel: controller.blendLevel,
    // Enum used to select what AppBar style we use.
    appBarStyle: controller.appBarStyleLight,
    // Set background opacity on app bar.
    appBarOpacity: controller.appBarOpacityLight,
    // Used to control if we use one or two toned status bar.
    transparentStatusBar: controller.transparentStatusBar,
    // Used to modify the themed AppBar elevation.
    appBarElevation: controller.appBarElevationLight,
    // Enum used to select what TabBar style we use.
    tabBarStyle: controller.tabBarStyle,
    // Keep scaffold plain white in all blend modes.
    lightIsWhite: controller.lightIsWhite,
    // Swap primary and secondary colors.
    swapColors: controller.swapLightColors,
    // If true, tooltip theme background will be light in light
    // theme, and dark in dark themes. The Flutter and Material
    // default and standard is the other way, tooltip background
    // color is inverted compared to app background.
    // Set to true, to mimic e.g. the look of Windows desktop
    // tooltips. You could tie this to the active platform and
    // have different style of tooltips on different platforms.
    tooltipsMatchBackground: controller.tooltipsMatchBackground,
    //
    // Opt in/out of using opinionated sub-themes.
    subThemesData: controller.useSubThemes
        ?
        // Options used to modify the sub-themes, there are more
        // properties than this, but here we use:
        FlexSubThemesData(
            // Want color themed disable hover, focus, highlight and
            // splash colors? Then keep this one on.
            interactionEffects: controller.interactionEffects,
            // Blend level for on colors for on colors, primary
            // secondary and tertiary and their containers.
            blendOnLevel: controller.blendOnLevel,
            // Use blend level values also with main on colors, not
            // only with container and on surfaces.
            blendOnColors: controller.blendLightOnColors,
            // By default sub themes mode also opts in on using colored text for
            // the themed text. If you plan to put text on surfaces that are not
            // primary color tinted or primary colored, then you may need to
            // turn this off, or make custom text themes for those surfaces.
            // Material3 has containers with matching on colors too, they work
            // great for contrast colored text, do use them too.
            blendTextTheme: controller.blendLightTextTheme,
            // Opt in/out of the Material 3 style matched TextTheme geometry, or
            // Typography, as it is called in Flutter SDK. The M3 Typography is
            // not yet natively available in Flutter SDK 2.10.3 or earlier,
            // this offers it as a way to use it already now.
            useTextTheme: controller.useTextTheme,
            // Outline thickness theming
            thinBorderWidth: controller.thinBorderWidth,
            thickBorderWidth: controller.thickBorderWidth,
            // Prefer Flutter SDK null default behavior for sub-themes, when
            // possible.
            useFlutterDefaults: controller.useFlutterDefaults,
            // Value to adjust themed border radius on widgets with
            // an adjustable corner rounding, this one is very handy.
            // If null, it defaults to Material3 (You) design
            // guide values, when available: https://m3.material.io/
            // If you give it value, "all" Flutter built-in widgets
            // supporting border radius will use the give radius.
            defaultRadius: controller.defaultRadius,
            // Border radius can be customized per widget too, here are
            // examples, it overrides M3 default and global default setting.
            bottomSheetRadius: controller.bottomSheetBorderRadius,
            elevatedButtonRadius: controller.elevatedButtonBorderRadius,
            outlinedButtonRadius: controller.outlinedButtonBorderRadius,
            textButtonRadius: controller.textButtonBorderRadius,
            toggleButtonsRadius: controller.toggleButtonsBorderRadius,
            // SchemeColor based ColorScheme color used on buttons & toggles.
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
            // Style of unselected switch/checkbox/radio.
            unselectedToggleIsColored: controller.unselectedToggleIsColored,
            //
            // Base ColorScheme used by TextField InputDecorator.
            inputDecoratorSchemeColor:
                controller.inputDecoratorSchemeColorLight,
            // Text input field uses a themed fill color.
            inputDecoratorIsFilled: controller.inputDecoratorIsFilled,
            // Underline or outline border type?
            inputDecoratorBorderType: controller.inputDecoratorBorderType,
            inputDecoratorRadius: controller.inputDecoratorBorderRadius,
            // Only want a border when the text input has focus
            // or error, then set this to false. By default it always
            // has a border of selected style, but thinner.
            inputDecoratorUnfocusedHasBorder:
                controller.inputDecoratorUnfocusedHasBorder,
            // Want to use uncolored border/underline when unfocused,
            // set this to false
            inputDecoratorUnfocusedBorderIsColored:
                controller.inputDecoratorUnfocusedBorderIsColored,
            // Set to false to keep using M2 style FAB and ignore
            // M3 type default and global radius on the FAB, it thus
            // remains circular or stadium shaped in extended mode.
            fabUseShape: controller.fabUseShape,
            fabRadius: controller.fabBorderRadius,
            fabSchemeColor: controller.fabSchemeColor,
            snackBarBackgroundSchemeColor: controller.snackBarSchemeColor,
            chipSchemeColor: controller.chipSchemeColor,
            chipRadius: controller.chipBorderRadius,
            cardRadius: controller.cardBorderRadius,
            popupMenuOpacity: controller.popupMenuOpacity,
            popupMenuRadius: controller.popupMenuBorderRadius,
            // ColorScheme used on various widgets.
            dialogBackgroundSchemeColor: controller.dialogBackgroundSchemeColor,
            dialogRadius: controller.dialogBorderRadius,
            timePickerDialogRadius: controller.dialogBorderRadius,
            appBarBackgroundSchemeColor:
                controller.appBarBackgroundSchemeColorLight,
            tabBarItemSchemeColor: controller.tabBarItemSchemeColorLight,
            tabBarIndicatorSchemeColor: controller.tabBarIndicatorLight,
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
    //
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
    // Use Material3 error colors with Material2 themes.
    useMaterial3ErrorColors: controller.useM3ErrorColors,
    // Use predefined [FlexTones] setups for the generated
    // [TonalPalette] and it's usage in [ColorScheme] config.
    // You can make your custom [FlexTones] object right here
    // and apps it it, this just uses an int value to select
    // between a few pre-configured ones.
    tones:
        FlexTone.values[controller.usedFlexToneSetup].tones(Brightness.light),
    // Use custom surface tint color.
    surfaceTint: controller.surfaceTintLight,
    //
    // ThemeData properties passed along directly to ThemeData.
    //
    // Modify the value in the AppData class to change it.
    visualDensity: AppData.visualDensity,
    // Custom font, modify in AppData class to change it.
    fontFamily: controller.useAppFont ? AppData.font : null,
    // The platform can be toggled in the app, but not saved.
    platform: controller.platform,
    // Opt-in/out of using Flutter SDK Material3 based theming
    // features. In Flutter SDK 2.10 and earlier it has almost no
    // effect, but it will later and then we can use this toggle
    // with FlexColorScheme too, and in this demo we can see its
    // impact easily.
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
      CodeTheme.harmonized(source, Brightness.light),
    },
  );
}
