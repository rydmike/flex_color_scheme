import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../shared/const/app.dart';
import '../../shared/const/app_color.dart';
import '../../shared/controllers/theme_controller.dart';
import '../../shared/model/flex_tones_enum.dart';
import '../../shared/model/visual_density_enum.dart';
import 'code_theme.dart';
import 'topic_theme.dart';

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
  return flexColorSchemeLight(controller, source).toTheme.copyWith(
        // TODO(rydmike): Remove Drawer workaround when Flutter SDK has a fix.
        // This is a fix to avoid the Flutter Drawer width bug,
        // https://github.com/flutter/flutter/issues/123507 and overflow bug
        // https://github.com/flutter/flutter/issues/123380
        // when it animates via zero width in null default to widget default.
        drawerTheme: controller.useSubThemes
            ? null
            : DrawerThemeData(width: controller.useMaterial3 ? 360 : 304),
      );
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
    // Used to modify the themed AppBar and BottomAppBar elevation.
    appBarElevation: controller.appBarElevationLight,
    bottomAppBarElevation: controller.bottomAppBarElevationLight,
    // Enum used to select what TabBar style we use.
    tabBarStyle: controller.tabBarStyle,
    // Keep scaffold plain white in all blend modes.
    lightIsWhite: controller.lightIsWhite,
    // Swap M2 legacy colors when using M3, if there is a benefit.
    swapLegacyOnMaterial3: controller.swapLegacyColors,
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
            // Tinted disabled controls.
            tintedDisabledControls: controller.tintedDisabledControls,
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
            // Typography, as it is called in Flutter SDK.
            useTextTheme: controller.useTextTheme,
            // Divider settings
            useM2StyleDividerInM3: controller.useM2StyleDividerInM3,
            // Outline thickness theming
            thinBorderWidth: controller.thinBorderWidth,
            thickBorderWidth: controller.thickBorderWidth,
            // Prefer Flutter SDK null default behavior for navigator themes,
            // when possible.
            useFlutterDefaults: controller.useFlutterDefaults,
            // Platform adaptive theming feature settings.
            adaptiveRemoveElevationTint: controller
                .adaptiveRemoveElevationTintLight
                ?.setting(controller.fakeIsWeb),
            adaptiveElevationShadowsBack: controller
                .adaptiveElevationShadowsBackLight
                ?.setting(controller.fakeIsWeb),
            adaptiveAppBarScrollUnderOff: controller
                .adaptiveAppBarScrollUnderOffLight
                ?.setting(controller.fakeIsWeb),
            adaptiveRadius:
                controller.adaptiveRadius?.setting(controller.fakeIsWeb),
            adaptiveSplash:
                controller.adaptiveSplash?.setting(controller.fakeIsWeb),
            //
            splashType: controller.splashType
                ?.setting(controller.fakeIsWeb, controller.useMaterial3),
            splashTypeAdaptive: controller.splashTypeAdaptive
                ?.setting(controller.fakeIsWeb, controller.useMaterial3),
            //
            // Value to adjust themed border radius on widgets with
            // an adjustable corner rounding, this one is very handy.
            // If null, it defaults to Material 3 design guide
            // values, when available: https://m3.material.io/
            // If you give it value, "all" Flutter built-in widgets
            // supporting border radius will use the give radius.
            defaultRadius: controller.defaultRadius,
            defaultRadiusAdaptive: controller.defaultRadiusAdaptive,
            // Border radius can be customized per widget too, it overrides
            // M3 default and global default setting.
            //
            // TextButton settings.
            textButtonRadius: controller.textButtonBorderRadius,
            textButtonSchemeColor: controller.textButtonSchemeColor,
            // FilledButton settings.
            filledButtonRadius: controller.filledButtonBorderRadius,
            filledButtonSchemeColor: controller.filledButtonSchemeColor,
            // ElevatedButton settings.
            elevatedButtonRadius: controller.elevatedButtonBorderRadius,
            elevatedButtonSchemeColor: controller.elevatedButtonSchemeColor,
            elevatedButtonSecondarySchemeColor:
                controller.elevatedButtonSecondarySchemeColor,
            // OutlineButton settings.
            outlinedButtonRadius: controller.outlinedButtonBorderRadius,
            outlinedButtonSchemeColor: controller.outlinedButtonSchemeColor,
            outlinedButtonOutlineSchemeColor:
                controller.outlinedButtonOutlineSchemeColor,
            outlinedButtonBorderWidth: controller.outlinedButtonBorderWidth,
            outlinedButtonPressedBorderWidth:
                controller.outlinedButtonPressedBorderWidth,
            // ToggleButtons settings.
            toggleButtonsRadius: controller.toggleButtonsBorderRadius,
            toggleButtonsSchemeColor: controller.toggleButtonsSchemeColor,
            toggleButtonsUnselectedSchemeColor:
                controller.toggleButtonsUnselectedSchemeColor,
            toggleButtonsBorderSchemeColor:
                controller.toggleButtonsBorderSchemeColor,
            toggleButtonsBorderWidth: controller.toggleButtonsBorderWidth,
            // SegmentedButtons settings.
            segmentedButtonRadius: controller.segmentedButtonBorderRadius,
            segmentedButtonSchemeColor: controller.segmentedButtonSchemeColor,
            segmentedButtonUnselectedSchemeColor:
                controller.segmentedButtonUnselectedSchemeColor,
            segmentedButtonUnselectedForegroundSchemeColor:
                controller.segmentedButtonUnselectedForegroundSchemeColor,
            segmentedButtonBorderSchemeColor:
                controller.segmentedButtonBorderSchemeColor,
            segmentedButtonBorderWidth: controller.segmentedButtonBorderWidth,
            //
            // Switch, CheckBox, Radio (toggles) settings.
            switchSchemeColor: controller.switchSchemeColor,
            switchThumbSchemeColor: controller.switchThumbSchemeColor,
            switchThumbFixedSize: controller.switchThumbFixedSize,
            checkboxSchemeColor: controller.checkboxSchemeColor,
            radioSchemeColor: controller.radioSchemeColor,
            // Style of unselected switch/checkbox/radio.
            unselectedToggleIsColored: controller.unselectedToggleIsColored,
            // Slider settings.
            sliderBaseSchemeColor: controller.sliderBaseSchemeColor,
            sliderIndicatorSchemeColor: controller.sliderIndicatorSchemeColor,
            sliderValueTinted: controller.sliderValueTinted,
            sliderValueIndicatorType: controller.sliderValueIndicatorType,
            sliderShowValueIndicator: controller.sliderShowValueIndicator,
            sliderTrackHeight: controller.sliderTrackHeight,
            // Input decoration (TextField) settings.
            // Base ColorScheme used by TextField InputDecorator.
            inputDecoratorSchemeColor:
                controller.inputDecoratorSchemeColorLight,
            inputDecoratorBorderSchemeColor:
                controller.inputDecoratorBorderSchemeColorLight,
            // Text input field uses a themed fill color.
            inputDecoratorIsFilled: controller.inputDecoratorIsFilled,
            inputDecoratorBackgroundAlpha:
                controller.inputDecoratorBackgroundAlphaLight,
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
            inputDecoratorFocusedHasBorder:
                controller.inputDecoratorFocusedHasBorder,
            inputDecoratorBorderWidth: controller.inputDecoratorBorderWidth,
            inputDecoratorFocusedBorderWidth:
                controller.inputDecoratorFocusedBorderWidth,
            inputDecoratorPrefixIconSchemeColor:
                controller.inputDecoratorPrefixIconSchemeColor,
            // TextSelection settings
            inputCursorSchemeColor: controller.inputCursorLightSchemeColor,
            inputSelectionSchemeColor:
                controller.inputSelectionLightSchemeColor,
            inputSelectionOpacity: controller.inputSelectionLightOpacity,
            inputSelectionHandleSchemeColor:
                controller.inputSelectionHandleLightSchemeColor,
            // FAB settings.
            //
            // Set to false to keep using M2 style FAB and ignore
            // M3 type default and global radius on the FAB, it thus
            // remains circular or stadium shaped in extended mode.
            fabUseShape: controller.fabUseShape,
            fabAlwaysCircular: controller.fabAlwaysCircular,
            fabRadius: controller.fabBorderRadius,
            fabSchemeColor: controller.fabSchemeColor,
            // Chip settings.
            chipSchemeColor: controller.chipSchemeColor,
            chipSelectedSchemeColor: controller.chipSelectedSchemeColor,
            chipDeleteIconSchemeColor: controller.chipDeleteIconSchemeColor,
            chipRadius: controller.chipBorderRadius,
            // Card settings.
            cardRadius: controller.cardBorderRadius,
            // PopupMenuButton settings.
            popupMenuRadius: controller.popupMenuBorderRadius,
            popupMenuElevation: controller.popupMenuElevation,
            popupMenuSchemeColor: controller.popupMenuSchemeColor,
            popupMenuOpacity: controller.popupMenuOpacity,
            // DropdownButton settings.
            alignedDropdown: controller.alignedDropdown,
            // Tooltip
            tooltipRadius: controller.tooltipRadius,
            tooltipWaitDuration: controller.tooltipWaitDuration == null
                ? null
                : Duration(milliseconds: controller.tooltipWaitDuration!),
            tooltipShowDuration: controller.tooltipShowDuration == null
                ? null
                : Duration(milliseconds: controller.tooltipShowDuration!),
            tooltipSchemeColor: controller.tooltipSchemeColor,
            tooltipOpacity: controller.tooltipOpacity,
            //
            // Dialog settings.
            dialogBackgroundSchemeColor: controller.dialogBackgroundSchemeColor,
            dialogRadius: controller.dialogBorderRadius,
            adaptiveDialogRadius:
                controller.adaptiveDialogRadius?.setting(controller.fakeIsWeb),
            dialogRadiusAdaptive: controller.dialogBorderRadiusAdaptive,
            datePickerDialogRadius: controller.datePickerDialogBorderRadius,
            timePickerDialogRadius: controller.timePickerDialogBorderRadius,
            useInputDecoratorThemeInDialogs:
                controller.useInputDecoratorThemeInDialogs,
            datePickerHeaderBackgroundSchemeColor:
                controller.datePickerHeaderBackgroundSchemeColor,
            //
            timePickerElementRadius: controller.timePickerElementRadius,
            dialogElevation: controller.dialogElevation,
            // SnackBar settings.
            snackBarRadius: controller.snackBarBorderRadius,
            snackBarElevation: controller.snackBarElevation,
            snackBarBackgroundSchemeColor: controller.snackBarSchemeColor,
            snackBarActionSchemeColor: controller.snackBarActionSchemeColor,
            // AppBar settings.
            appBarBackgroundSchemeColor:
                controller.appBarBackgroundSchemeColorLight,
            appBarScrolledUnderElevation:
                controller.appBarScrolledUnderElevationLight,
            // BottomAppBarSettings.
            bottomAppBarSchemeColor: controller.bottomAppBarSchemeColor,
            // TabBar settings.
            tabBarItemSchemeColor: controller.tabBarItemSchemeColorLight,
            tabBarUnselectedItemSchemeColor:
                controller.tabBarUnselectedItemSchemeColorLight,
            tabBarUnselectedItemOpacity:
                controller.tabBarUnselectedItemOpacityLight,
            tabBarIndicatorSchemeColor: controller.tabBarIndicatorLight,
            tabBarIndicatorSize: controller.tabBarIndicatorSize,
            tabBarIndicatorWeight: controller.tabBarIndicatorWeight,
            tabBarIndicatorTopRadius: controller.tabBarIndicatorTopRadius,
            tabBarDividerColor: controller.tabBarDividerColor,
            // Drawer Settings.
            drawerRadius: controller.drawerBorderRadius,
            drawerElevation: controller.drawerElevation,
            drawerBackgroundSchemeColor: controller.drawerBackgroundSchemeColor,
            drawerWidth: controller.drawerWidth,
            drawerIndicatorWidth: controller.drawerIndicatorWidth,
            drawerIndicatorRadius: controller.drawerIndicatorBorderRadius,
            drawerIndicatorSchemeColor: controller.drawerIndicatorSchemeColor,
            drawerIndicatorOpacity: controller.drawerIndicatorOpacity,
            drawerSelectedItemSchemeColor:
                controller.drawerSelectedItemSchemeColor,
            drawerUnselectedItemSchemeColor:
                controller.drawerUnselectedItemSchemeColor,
            // BottomSheet settings.
            bottomSheetElevation: controller.bottomSheetElevation,
            bottomSheetModalElevation: controller.bottomSheetModalElevation,
            bottomSheetBackgroundColor: controller.bottomSheetSchemeColor,
            bottomSheetModalBackgroundColor:
                controller.bottomSheetModalSchemeColor,
            bottomSheetRadius: controller.bottomSheetBorderRadius,
            // BottomNavigationBar settings.
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
            // Menu, MenuBar and MenuButton settings.
            menuRadius: controller.menuRadius,
            menuElevation: controller.menuElevation,
            menuSchemeColor: controller.menuSchemeColor,
            menuOpacity: controller.menuOpacity,
            menuPadding: EdgeInsetsDirectional.fromSTEB(
              controller.menuPaddingStart ?? 0,
              controller.menuPaddingTop ?? 0,
              controller.menuPaddingEnd ?? 0,
              controller.menuPaddingBottom ?? 0,
            ),
            //
            menuBarBackgroundSchemeColor:
                controller.menuBarBackgroundSchemeColor,
            menuBarRadius: controller.menuBarRadius,
            menuBarElevation: controller.menuBarElevation,
            menuBarShadowColor: controller.menuBarShadowColor,
            //
            menuItemBackgroundSchemeColor:
                controller.menuItemBackgroundSchemeColor,
            menuItemForegroundSchemeColor:
                controller.menuItemForegroundSchemeColor,
            menuIndicatorBackgroundSchemeColor:
                controller.menuIndicatorBackgroundSchemeColor,
            menuIndicatorForegroundSchemeColor:
                controller.menuIndicatorForegroundSchemeColor,
            menuIndicatorRadius: controller.menuIndicatorRadius,
            // NavigationBar settings.
            navigationBarSelectedLabelSchemeColor:
                controller.navBarSelectedLabelSchemeColor,
            navigationBarUnselectedLabelSchemeColor:
                controller.navBarUnselectedSchemeColor,
            navigationBarMutedUnselectedLabel: controller.navBarMuteUnselected,
            navigationBarSelectedIconSchemeColor:
                controller.navBarSelectedIconSchemeColor,
            navigationBarUnselectedIconSchemeColor:
                controller.navBarUnselectedSchemeColor,
            navigationBarMutedUnselectedIcon: controller.navBarMuteUnselected,
            navigationBarIndicatorSchemeColor:
                controller.navBarIndicatorSchemeColor,
            navigationBarIndicatorOpacity: controller.navBarIndicatorOpacity,
            navigationBarIndicatorRadius:
                controller.navBarIndicatorBorderRadius,
            navigationBarBackgroundSchemeColor:
                controller.navBarBackgroundSchemeColor,
            navigationBarOpacity: controller.navBarOpacity,
            navigationBarElevation: controller.navBarElevation,
            navigationBarHeight: controller.navBarHeight,
            navigationBarLabelBehavior: controller.navBarLabelBehavior,
            adaptiveRemoveNavigationBarTint: controller
                .adaptiveRemoveNavigationBarTintLight
                ?.setting(controller.fakeIsWeb),
            // NavigationRail settings.
            navigationRailSelectedLabelSchemeColor:
                controller.navRailSelectedLabelSchemeColor,
            navigationRailUnselectedLabelSchemeColor:
                controller.navRailUnselectedSchemeColor,
            navigationRailMutedUnselectedLabel:
                controller.navRailMuteUnselected,
            navigationRailSelectedIconSchemeColor:
                controller.navRailSelectedIconSchemeColor,
            navigationRailUnselectedIconSchemeColor:
                controller.navRailUnselectedSchemeColor,
            navigationRailMutedUnselectedIcon: controller.navRailMuteUnselected,
            navigationRailUseIndicator: controller.navRailUseIndicator,
            navigationRailIndicatorSchemeColor:
                controller.navRailIndicatorSchemeColor,
            navigationRailIndicatorOpacity: controller.navRailIndicatorOpacity,
            navigationRailIndicatorRadius:
                controller.navRailIndicatorBorderRadius,
            navigationRailBackgroundSchemeColor:
                controller.navRailBackgroundSchemeColor,
            navigationRailOpacity: controller.navRailOpacity,
            navigationRailElevation: controller.navRailElevation,
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
    tones: FlexTonesEnum.values[controller.usedFlexToneSetup]
        .tones(Brightness.light)
        .onMainsUseBW(controller.onMainsUseBWLight)
        .onSurfacesUseBW(controller.onSurfacesUseBWLight)
        .surfacesUseBW(controller.surfacesUseBWLight),
    // Use custom surface tint color.
    surfaceTint: controller.surfaceTintLight,
    //
    // Get the active app visual density. We use a none null fallback for the
    // null default of VisualDensity.adaptivePlatformDensity based on
    // VisualDensityEnum.platform.setting where we can use the Playground
    // active mock platform for the fake default as well.
    visualDensity: controller.usedVisualDensity?.setting(controller.platform) ??
        VisualDensityEnum.platform.setting(controller.platform),
    //
    // Custom font, modify in App class to change it.
    // For demonstration purposes the custom font is defined via Google fonts
    // both as its fontFamily name and its TextTheme. In the playground we pass
    // the textTheme to fontFamily and the textTheme to both textTheme and
    // primaryTextTheme. You can remove either the fontFamily or the
    // textTheme/primaryTextTheme usage and it will still work fine.
    // FlexColorScheme will also sort out the right text theme contrasts for
    // light and dark themes and for the primaryTextTheme to always have right
    // contrast for whatever primary color is used. FlexColorScheme also retains
    // the correct opacities on text style if M2 Typography is used, and removes
    // it from style when M3 Typography is used, when using GoogleFonts.
    fontFamily: controller.useAppFont ? App.font : null,
    textTheme: controller.useAppFont ? App.textTheme : null,
    primaryTextTheme: controller.useAppFont ? App.textTheme : null,
    //
    // To test the manual splashFactory override set e.g.
    // splashFactory: NoSplash.splashFactory,
    //
    // To test manual typography override use this:
    // typography: Typography.material2021(platform: controller.platform),
    // Or the one below, the selection will correctly override the via
    // sub themes "useTextTheme" value.
    // typography: Typography.material2018(platform: controller.platform),
    //
    // The platform can be toggled in the app, but not saved.
    platform: controller.platform,
    useMaterial3: controller.useMaterial3,
    // Add a custom theme extension with light mode code highlight colors and
    // light mode topic colors.
    extensions: <ThemeExtension<dynamic>>{
      CodeTheme.harmonized(source, Brightness.light),
      TopicTheme.harmonized(source, Brightness.light),
    },
  );
}
