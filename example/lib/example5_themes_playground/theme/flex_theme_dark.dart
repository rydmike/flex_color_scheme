import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../shared/const/app.dart';
import '../../shared/const/app_color.dart';
import '../../shared/controllers/theme_controller.dart';
import '../../shared/model/flex_tones_enum.dart';
import '../../shared/model/visual_density_enum.dart';
import 'code_theme.dart';
import 'topic_theme.dart';

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
  // our custom theme extension colors with it.
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
  return flexColorSchemeDark(controller, source).toTheme.copyWith(
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
///
/// The function below only contains tutorial comments on topics not covered in
/// the almost identical `flexColorSchemeLight` function. Please see it for
/// more tutorial comments.
FlexColorScheme flexColorSchemeDark(ThemeController controller, Color source) {
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
    bottomAppBarElevation: controller.bottomAppBarElevationDark,
    tabBarStyle: controller.tabBarStyle,
    darkIsTrueBlack: controller.darkIsTrueBlack,
    swapLegacyOnMaterial3: controller.swapLegacyColors,
    swapColors: controller.swapDarkColors,
    tooltipsMatchBackground: controller.tooltipsMatchBackground,
    //
    subThemesData: controller.useSubThemes
        ? FlexSubThemesData(
            // Overall effect settings.
            interactionEffects: controller.interactionEffects,
            tintedDisabledControls: controller.tintedDisabledControls,
            blendOnLevel: controller.blendOnLevelDark,
            blendOnColors: controller.blendDarkOnColors,
            useFlutterDefaults: controller.useFlutterDefaults,
            // Platform adaptive theming feature settings.
            adaptiveRemoveElevationTint: controller
                .adaptiveRemoveElevationTintDark
                ?.setting(controller.fakeIsWeb),
            adaptiveElevationShadowsBack: controller
                .adaptiveElevationShadowsBackDark
                ?.setting(controller.fakeIsWeb),
            adaptiveAppBarScrollUnderOff: controller
                .adaptiveAppBarScrollUnderOffDark
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
            // Text theme settings.
            blendTextTheme: controller.blendDarkTextTheme,
            useTextTheme: controller.useTextTheme,
            // Divider settings
            useM2StyleDividerInM3: controller.useM2StyleDividerInM3,
            // Outline default thickness settings.
            thinBorderWidth: controller.thinBorderWidth,
            thickBorderWidth: controller.thickBorderWidth,
            // Default radius for all widgets, if not null.
            defaultRadius: controller.defaultRadius,
            defaultRadiusAdaptive: controller.defaultRadiusAdaptive,
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
            unselectedToggleIsColored: controller.unselectedToggleIsColored,
            // Slider settings.
            sliderBaseSchemeColor: controller.sliderBaseSchemeColor,
            sliderIndicatorSchemeColor: controller.sliderIndicatorSchemeColor,
            sliderValueTinted: controller.sliderValueTinted,
            sliderValueIndicatorType: controller.sliderValueIndicatorType,
            sliderShowValueIndicator: controller.sliderShowValueIndicator,
            sliderTrackHeight: controller.sliderTrackHeight,
            // Input decoration (TextField) settings.
            inputDecoratorSchemeColor: controller.inputDecoratorSchemeColorDark,
            inputDecoratorBorderSchemeColor:
                controller.inputDecoratorBorderSchemeColorDark,
            inputDecoratorIsFilled: controller.inputDecoratorIsFilled,
            inputDecoratorBorderType: controller.inputDecoratorBorderType,
            inputDecoratorRadius: controller.inputDecoratorBorderRadius,
            inputDecoratorUnfocusedHasBorder:
                controller.inputDecoratorUnfocusedHasBorder,
            inputDecoratorBackgroundAlpha:
                controller.inputDecoratorBackgroundAlphaDark,
            inputDecoratorFocusedHasBorder:
                controller.inputDecoratorFocusedHasBorder,
            inputDecoratorUnfocusedBorderIsColored:
                controller.inputDecoratorUnfocusedBorderIsColored,
            inputDecoratorBorderWidth: controller.inputDecoratorBorderWidth,
            inputDecoratorFocusedBorderWidth:
                controller.inputDecoratorFocusedBorderWidth,
            inputDecoratorPrefixIconSchemeColor:
                controller.inputDecoratorPrefixIconDarkSchemeColor,
            // TextSelection settings
            inputCursorSchemeColor: controller.inputCursorDarkSchemeColor,
            inputSelectionSchemeColor: controller.inputSelectionDarkSchemeColor,
            inputSelectionOpacity: controller.inputSelectionDarkOpacity,
            inputSelectionHandleSchemeColor:
                controller.inputSelectionHandleDarkSchemeColor,
            // FAB settings.
            fabRadius: controller.fabBorderRadius,
            fabUseShape: controller.fabUseShape,
            fabAlwaysCircular: controller.fabAlwaysCircular,
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
            // SnackBar settings.
            snackBarRadius: controller.snackBarBorderRadius,
            snackBarElevation: controller.snackBarElevation,
            snackBarBackgroundSchemeColor: controller.snackBarSchemeColor,
            snackBarActionSchemeColor: controller.snackBarActionSchemeColor,
            // AppBar settings.
            appBarBackgroundSchemeColor:
                controller.appBarBackgroundSchemeColorDark,
            appBarScrolledUnderElevation:
                controller.appBarScrolledUnderElevationDark,
            // BottomAppBarSettings.
            bottomAppBarSchemeColor: controller.bottomAppBarSchemeColor,
            // TabBar settings.
            tabBarItemSchemeColor: controller.tabBarItemSchemeColorDark,
            tabBarUnselectedItemSchemeColor:
                controller.tabBarUnselectedItemSchemeColorDark,
            tabBarUnselectedItemOpacity:
                controller.tabBarUnselectedItemOpacityDark,
            tabBarIndicatorSchemeColor: controller.tabBarIndicatorDark,
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
            bottomSheetBackgroundColor: controller.bottomSheetSchemeColor,
            bottomSheetModalBackgroundColor:
                controller.bottomSheetModalSchemeColor,
            bottomSheetRadius: controller.bottomSheetBorderRadius,
            bottomSheetElevation: controller.bottomSheetElevation,
            bottomSheetModalElevation: controller.bottomSheetModalElevation,
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
                .adaptiveRemoveNavigationBarTintDark
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
    tones: FlexTonesEnum.values[controller.usedFlexToneSetup]
        .tones(Brightness.dark)
        .onMainsUseBW(controller.onMainsUseBWDark)
        .onSurfacesUseBW(controller.onSurfacesUseBWDark)
        .surfacesUseBW(controller.surfacesUseBWDark),
    // Use custom surface tint color.
    surfaceTint: controller.surfaceTintDark,
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
    // dark mode topic colors.
    extensions: <ThemeExtension<dynamic>>{
      CodeTheme.harmonized(source, Brightness.dark),
      TopicTheme.harmonized(source, Brightness.dark),
    },
  );
}
