import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/const/app.dart';
import '../../shared/const/app_color.dart';
import '../../shared/controllers/theme_controller.dart';
import '../../shared/model/visual_density_enum.dart';
import 'code_theme.dart';
import 'theme_values.dart';
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
  // Using a built-in scheme or one of the custom colors in the demo?
  final bool useBuiltIn = controller.schemeIndex > 2 &&
      controller.schemeIndex < AppColor.schemes.length - 1;
  // Get the enum index of scheme
  final int flexScheme = controller.schemeIndex - 3;
  // If we use the useToDarkMethod, we should not use the scheme, but instead
  // use the colors property so we can create a dark theme from the light one.
  final bool useScheme = useBuiltIn && !controller.useToDarkMethod;

  return FlexColorScheme.dark(
    // Use scheme based config, when we are using a built-in `FlexScheme`
    // based schemes.
    scheme: useScheme ? FlexScheme.values[flexScheme] : null,
    // Switch to using `FlexSchemeColor` when using 3 first custom schemes or
    // the last one that is customizable.
    colors: !useScheme ? AppColor.scheme(controller).dark : null,

    // TODO(rydmike): DEBUGGING: Remove
    // primary: Colors.blue,
    // primaryLightRef: Colors.blue,
    // secondary: Colors.pink[200],
    // secondaryLightRef: Colors.pink,
    // tertiary: Colors.orange[200],
    // tertiaryLightRef: Colors.orange,

    // Used number of colors from the selected input FlexColorScheme based theme
    usedColors: controller.usedColors,
    surfaceMode: controller.surfaceModeDark,
    fixedColorStyle: controller.fixedColorStyle,
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
            // Want color themed disable hover, focus, highlight and
            // splash colors? Then keep this one on.
            interactionEffects: controller.interactionEffects,
            // Tinted disabled controls.
            tintedDisabledControls: controller.tintedDisabledControls,
            // Blend level for on colors for on colors, primary
            // secondary and tertiary and their containers.
            blendOnLevel: controller.blendOnLevelDark,
            // Use blend level values also with main on colors, not
            // only with container and on surfaces.
            blendOnColors: controller.blendDarkOnColors,
            // Custom Scaffold background color.
            scaffoldBackgroundBaseColor:
                controller.scaffoldBackgroundDarkBaseColor,
            scaffoldBackgroundSchemeColor:
                controller.scaffoldBackgroundDarkSchemeColor,
            // TODO(rydmike): Commented as part of blendTextTheme deprecation.
            // blendTextTheme: controller.blendDarkTextTheme,
            // Used typography.
            useMaterial3Typography: controller.useMaterial3Typography,
            // Divider settings
            useM2StyleDividerInM3: controller.useM2StyleDividerInM3,
            // Outline default thickness settings.
            thinBorderWidth: controller.thinBorderWidth,
            thickBorderWidth: controller.thickBorderWidth,
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
            adaptiveRadius: controller.adaptiveResponseRadius
                ?.setting(controller.fakeIsWeb),
            adaptiveSplash: controller.adaptiveResponseSplash
                ?.setting(controller.fakeIsWeb),
            adaptiveDialogRadius: controller.adaptiveResponseDialogRadius
                ?.setting(controller.fakeIsWeb),
            adaptiveInputDecoratorRadius: controller
                .adaptiveResponseInputDecoratorRadius
                ?.setting(controller.fakeIsWeb),
            //
            splashType: controller.splashType
                ?.setting(controller.fakeIsWeb, controller.useMaterial3),
            splashTypeAdaptive: controller.splashTypeAdaptive
                ?.setting(controller.fakeIsWeb, controller.useMaterial3),
            // Value to adjust themed border radius on widgets with
            // an adjustable corner rounding, this one is very handy.
            // If null, it defaults to Material 3 design guide
            // values, when available: https://m3.material.io/
            // If you give it value, "all" Flutter built-in widgets
            // supporting border radius will use the give radius.
            // Border radius can be customized per widget too, it overrides
            // the M3 default and global default setting.
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
            toggleButtonsSelectedForegroundSchemeColor:
                controller.toggleButtonsSelectedForegroundSchemeColor,
            toggleButtonsUnselectedSchemeColor:
                controller.toggleButtonsUnselectedSchemeColor,
            toggleButtonsBorderSchemeColor:
                controller.toggleButtonsBorderSchemeColor,
            toggleButtonsBorderWidth: controller.toggleButtonsBorderWidth,
            // SegmentedButtons settings.
            segmentedButtonRadius: controller.segmentedButtonBorderRadius,
            segmentedButtonSchemeColor: controller.segmentedButtonSchemeColor,
            segmentedButtonSelectedForegroundSchemeColor:
                controller.segmentedButtonSelectedForegroundSchemeColor,
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
            switchAdaptiveCupertinoLike: controller.switchAdaptiveCupertinoLike
                ?.setting(controller.fakeIsWeb),
            //
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
            inputDecoratorSchemeColor: controller.inputDecoratorSchemeColorDark,
            inputDecoratorBorderSchemeColor:
                controller.inputDecoratorBorderSchemeColorDark,
            inputDecoratorIsFilled: controller.inputDecoratorIsFilled,
            //
            inputDecoratorIsDense: controller.inputDecoratorIsDense,
            inputDecoratorContentPadding:
                controller.inputDecoratorPaddingStart != null ||
                        controller.inputDecoratorPaddingTop != null ||
                        controller.inputDecoratorPaddingEnd != null ||
                        controller.inputDecoratorPaddingBottom != null
                    ? EdgeInsetsDirectional.fromSTEB(
                        controller.inputDecoratorPaddingStart ??
                            DecoratorDefault.start.padding(controller),
                        controller.inputDecoratorPaddingTop ??
                            DecoratorDefault.top.padding(controller),
                        controller.inputDecoratorPaddingEnd ??
                            DecoratorDefault.end.padding(controller),
                        controller.inputDecoratorPaddingBottom ??
                            DecoratorDefault.bottom.padding(controller),
                      )
                    : null,
            //
            inputDecoratorBackgroundAlpha:
                controller.inputDecoratorBackgroundAlphaDark,
            // Underline or outline border type?
            inputDecoratorBorderType: controller.inputDecoratorBorderType,
            inputDecoratorRadius: controller.inputDecoratorBorderRadius,
            inputDecoratorRadiusAdaptive:
                controller.inputDecoratorBorderRadiusAdaptive,
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
                controller.inputDecoratorPrefixIconDarkSchemeColor,
            inputDecoratorSuffixIconSchemeColor:
                controller.inputDecoratorSuffixIconDarkSchemeColor,
            // TextSelection settings
            inputCursorSchemeColor: controller.inputCursorDarkSchemeColor,
            inputSelectionSchemeColor: controller.inputSelectionDarkSchemeColor,
            inputSelectionOpacity: controller.inputSelectionDarkOpacity,
            inputSelectionHandleSchemeColor:
                controller.inputSelectionHandleDarkSchemeColor,
            // ListTile settings.
            listTileSelectedSchemeColor: controller.listTileSelectedSchemeColor,
            listTileIconSchemeColor: controller.listTileIconSchemeColor,
            listTileTextSchemeColor: controller.listTileTextSchemeColor,
            listTileTileSchemeColor: controller.listTileTileSchemeColor,
            listTileSelectedTileSchemeColor:
                controller.listTileSelectedTileSchemeColor,
            listTileContentPadding: controller.listTilePaddingStart != null ||
                    controller.listTilePaddingTop != null ||
                    controller.listTilePaddingEnd != null ||
                    controller.listTilePaddingBottom != null
                ? EdgeInsetsDirectional.fromSTEB(
                    controller.listTilePaddingStart ?? 16,
                    controller.listTilePaddingTop ?? 0,
                    controller.listTilePaddingEnd ??
                        (controller.useMaterial3 ? 24 : 16),
                    controller.listTilePaddingBottom ?? 0,
                  )
                : null,
            listTileHorizontalTitleGap: controller.listTileHorizontalTitleGap,
            listTileMinVerticalPadding: controller.listTileMinVerticalPadding,
            listTileStyle: controller.listTileStyle,
            listTileTitleAlignment: controller.listTileTitleAlignment,
            // FAB settings.
            // Set to false to keep using M2 style FAB and ignore
            // M3 type default and global radius on the FAB, it thus
            // remains circular or stadium shaped in extended mode.
            fabRadius: controller.fabBorderRadius,
            fabUseShape: controller.fabUseShape,
            fabAlwaysCircular: controller.fabAlwaysCircular,
            fabSchemeColor: controller.fabSchemeColor,
            fabForegroundSchemeColor: controller.fabForegroundSchemeColor,
            // Chip settings.
            chipSchemeColor: controller.chipSchemeColor,
            chipSelectedSchemeColor: controller.chipSelectedSchemeColor,
            chipSecondarySelectedSchemeColor:
                controller.chipSecondarySelectedSchemeColor,
            chipDeleteIconSchemeColor: controller.chipDeleteIconSchemeColor,
            chipBlendColors: controller.chipBlendColors,
            chipRadius: controller.chipBorderRadius,
            chipFontSize: controller.chipFontSize,
            chipIconSize: controller.chipIconSize,
            chipPadding: controller.chipPaddingStart != null ||
                    controller.chipPaddingTop != null ||
                    controller.chipPaddingEnd != null ||
                    controller.chipPaddingBottom != null
                ? EdgeInsetsDirectional.fromSTEB(
                    controller.chipPaddingStart ??
                        (controller.useMaterial3 ? 8 : 4),
                    controller.chipPaddingTop ??
                        (controller.useMaterial3 ? 8 : 4),
                    controller.chipPaddingEnd ??
                        (controller.useMaterial3 ? 8 : 4),
                    controller.chipPaddingBottom ??
                        (controller.useMaterial3 ? 8 : 4),
                  )
                : null,
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
            // General Dialog settings.
            dialogRadius: controller.dialogBorderRadius,
            dialogRadiusAdaptive: controller.dialogBorderRadiusAdaptive,
            dialogBackgroundSchemeColor:
                controller.dialogBackgroundDarkSchemeColor,
            dialogElevation: controller.dialogElevation,
            // Dialog input decorator for TimePicker and DatePicker.
            useInputDecoratorThemeInDialogs:
                controller.useInputDecoratorThemeInDialogs,
            // Dialog DatePicker settings.
            datePickerDialogRadius: controller.datePickerDialogBorderRadius,
            datePickerHeaderBackgroundSchemeColor:
                controller.datePickerHeaderBackgroundSchemeColor,
            datePickerHeaderForegroundSchemeColor:
                controller.datePickerHeaderForegroundSchemeColor,
            datePickerDividerSchemeColor:
                controller.datePickerDividerSchemeColor,
            // Dialog TimePicker settings.
            timePickerDialogRadius: controller.timePickerDialogBorderRadius,
            timePickerElementRadius: controller.timePickerElementRadius,
            // SnackBar settings.
            snackBarRadius: controller.snackBarBorderRadius,
            snackBarElevation: controller.snackBarElevation,
            snackBarBackgroundSchemeColor: controller.snackBarSchemeColor,
            snackBarActionSchemeColor: controller.snackBarActionSchemeColor,
            // AppBar settings.
            appBarBackgroundSchemeColor:
                controller.appBarBackgroundSchemeColorDark,
            appBarForegroundSchemeColor:
                controller.appBarForegroundSchemeColorDark,
            appBarIconSchemeColor: controller.appBarIconSchemeColorDark,
            appBarActionsIconSchemeColor:
                controller.appBarActionsIconSchemeColorDark,
            appBarScrolledUnderElevation:
                controller.appBarScrolledUnderElevationDark,
            appBarCenterTitle: controller.appBarCenterTitle,
            // BottomAppBarSettings.
            bottomAppBarSchemeColor: controller.bottomAppBarSchemeColorDark,
            bottomAppBarHeight: controller.bottomAppBarHeight,
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
            tabBarTabAlignment: controller.tabBarTabAlignment,
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
            bottomNavigationBarSelectedLabelSize:
                controller.bottomNavigationBarSelectedLabelSize,
            bottomNavigationBarUnselectedLabelSize:
                controller.bottomNavigationBarUnselectedLabelSize,
            bottomNavigationBarSelectedIconSize:
                controller.bottomNavigationBarSelectedIconSize,
            bottomNavigationBarUnselectedIconSize:
                controller.bottomNavigationBarUnselectedIconSize,
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
            // MenuBar Settings
            menuBarBackgroundSchemeColor:
                controller.menuBarBackgroundSchemeColor,
            menuBarRadius: controller.menuBarRadius,
            menuBarElevation: controller.menuBarElevation,
            menuBarShadowColor: controller.menuBarShadowColor,
            // MenuItem Settings
            menuItemBackgroundSchemeColor:
                controller.menuItemBackgroundSchemeColor,
            menuItemForegroundSchemeColor:
                controller.menuItemForegroundSchemeColor,
            menuIndicatorBackgroundSchemeColor:
                controller.menuIndicatorBackgroundSchemeColor,
            menuIndicatorForegroundSchemeColor:
                controller.menuIndicatorForegroundSchemeColor,
            menuIndicatorRadius: controller.menuIndicatorRadius,
            // SearchView and SearchBar settings.
            searchBarBackgroundSchemeColor:
                controller.searchBackgroundSchemeColor,
            searchViewBackgroundSchemeColor:
                controller.searchBackgroundSchemeColor,
            searchBarElevation: controller.searchElevation,
            searchViewElevation: controller.searchElevation,
            searchBarRadius: controller.searchRadius,
            searchViewRadius: controller.searchRadius,
            searchViewHeaderHeight: controller.searchViewHeaderHeight,
            searchUseGlobalShape: controller.searchUseGlobalShape,
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
            navigationBarSelectedLabelSize:
                controller.navigationBarSelectedLabelSize,
            navigationBarUnselectedLabelSize:
                controller.navigationBarUnselectedLabelSize,
            navigationBarSelectedIconSize:
                controller.navigationBarSelectedIconSize,
            navigationBarUnselectedIconSize:
                controller.navigationBarUnselectedIconSize,
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
            navigationRailSelectedLabelSize:
                controller.navigationRailSelectedLabelSize,
            navigationRailUnselectedLabelSize:
                controller.navigationRailUnselectedLabelSize,
            navigationRailSelectedIconSize:
                controller.navigationRailSelectedIconSize,
            navigationRailUnselectedIconSize:
                controller.navigationRailUnselectedIconSize,
            // Do not pass null to Playground even if it is, this is done to
            // avoid the alignment jumping down 0 and back to -1 when moving
            // from nul to minus one and theme lerps from 0 to -1.
            navigationRailGroupAlignment:
                controller.navigationRailGroupAlignment ?? -1,
            navigationRailMinWidth: controller.navigationRailMinWidth,
            navigationRailMinExtendedWidth:
                controller.navigationRailMinExtendedWidth,
          )
        : null,
    //
    // Advanced color properties for seed generated ColorScheme's
    // Use key color based M3 ColorScheme.
    keyColors: FlexKeyColors(
      useKeyColors: controller.useKeyColors,
      keepPrimary: controller.keepDarkPrimary,
      keepPrimaryContainer: controller.keepDarkPrimaryContainer,
      //
      useSecondary: controller.useSecondary,
      keepSecondary: controller.keepDarkSecondary,
      keepSecondaryContainer: controller.keepDarkSecondaryContainer,
      //
      useTertiary: controller.useTertiary,
      keepTertiary: controller.keepDarkTertiary,
      keepTertiaryContainer: controller.keepDarkTertiaryContainer,
      //
      useError: controller.useError,
      keepError: controller.keepDarkError,
      keepErrorContainer: controller.keepDarkErrorContainer,
      //
      contrastLevel: controller.dynamicContrastLevel,
      useLegacyMonochromeSeedBehavior:
          controller.useLegacyMonochromeSeedBehavior,
    ),
    useMaterial3ErrorColors: controller.useM3ErrorColors,
    tones:
        FlexSchemeVariant.values[controller.usedFlexToneSetup].isFlutterScheme
            ? null
            : FlexSchemeVariant.values[controller.usedFlexToneSetup]
                .tones(Brightness.dark)
                .higherContrastFixed(controller.higherContrastFixed)
                .monochromeSurfaces(controller.useMonoSurfacesDark)
                .onMainsUseBW(controller.onMainsUseBWDark)
                .onSurfacesUseBW(controller.onSurfacesUseBWDark)
                .surfacesUseBW(controller.surfacesUseBWDark),
    // Use MCU variant based scheme instead
    variant:
        FlexSchemeVariant.values[controller.usedFlexToneSetup].isFlutterScheme
            ? FlexSchemeVariant.values[controller.usedFlexToneSetup]
            : null,
    // Use custom surface tint color.
    surfaceTint: controller.surfaceTintDark,
    //
    // Get the active app visual density. We use a none null fallback for the
    // null default of VisualDensity.adaptivePlatformDensity based on
    // VisualDensityEnum.platform.setting where we can use the Playground
    // active mock platform for the fake default as well.
    visualDensity: controller.usedVisualDensity?.setting(controller.platform) ??
        VisualDensityEnum.platform.setting(controller.platform),
    // Use tap target size setting.
    materialTapTargetSize: controller.tapTargetSize,
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
    // Apply theme's ColorScheme to all cupertino based widgets.
    cupertinoOverrideTheme: controller.applyThemeToAllCupertino
        ? const CupertinoThemeData(applyThemeToAll: true)
        : null,
    // Use M3 based theme, or M2 based theme.
    useMaterial3: controller.useMaterial3,
    // Add a custom theme extension with light mode code highlight colors and
    // dark mode topic colors.
    extensions: <ThemeExtension<dynamic>>{
      CodeTheme.harmonized(source, Brightness.dark),
      TopicTheme.harmonized(source, Brightness.dark),
    },
  );
}
