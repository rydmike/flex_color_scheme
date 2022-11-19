// ignore_for_file: lines_longer_than_80_chars
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../shared/const/app_color.dart';
import '../../shared/const/app_data.dart';
import '../../shared/controllers/theme_controller.dart';

/// A function that returns the FlexColorScheme Dart and Flutter setup
/// code for the theme held by ThemeController.
///
/// The properties are typically in the order they are in the classes.
String generateThemeDartCode(ThemeController controller) {
  // If FlexColorsScheme is not in use, return a default M2 ColorScheme based
  // theme as a starting point suggestion.
  if (!controller.useFlexColorScheme) {
    return '''
  // FlexColorScheme is not in use!
  // Here is a default Material 2 starting point theme setup for you.
  //
  theme: ThemeData.from(colorScheme: const ColorScheme.light()).copyWith(
    typography: Typography.material2021(platform: defaultTargetPlatform),
  ),
  darkTheme: ThemeData.from(colorScheme: const ColorScheme.dark()).copyWith(
    typography: Typography.material2021(platform: defaultTargetPlatform),
  ),
  themeMode: ThemeMode.system,''';
  }
  // Code for main theme setup, the effective colors setup.
  final FlexSchemeData scheme = AppColor.scheme(controller);
  // Get the enum index of scheme
  final int flexScheme = controller.schemeIndex - 3;
  // Using a built-in scheme or one of the custom colors in the demo?
  final bool useBuiltIn = controller.schemeIndex > 2 &&
      controller.schemeIndex < AppColor.schemes.length - 1;
  final String lightScheme = useBuiltIn
      ? '  scheme: ${FlexScheme.values[flexScheme]},\n'
      : '  colors: const FlexSchemeColor(\n'
          '    primary: ${scheme.light.primary},\n'
          '    primaryContainer: ${scheme.light.primaryContainer},\n'
          '    secondary: ${scheme.light.secondary},\n'
          '    secondaryContainer: ${scheme.light.secondaryContainer},\n'
          '    tertiary: ${scheme.light.tertiary},\n'
          '    tertiaryContainer: ${scheme.light.tertiaryContainer},\n'
          '    appBarColor: ${scheme.light.appBarColor},\n'
          '    error: ${scheme.light.error},\n'
          '  ),\n';
  String darkScheme = useBuiltIn
      ? '  scheme: ${FlexScheme.values[flexScheme]},\n'
      : '  colors: const FlexSchemeColor(\n'
          '    primary: ${scheme.dark.primary},\n'
          '    primaryContainer: ${scheme.dark.primaryContainer},\n'
          '    secondary: ${scheme.dark.secondary},\n'
          '    secondaryContainer: ${scheme.dark.secondaryContainer},\n'
          '    tertiary: ${scheme.dark.tertiary},\n'
          '    tertiaryContainer: ${scheme.dark.tertiaryContainer},\n'
          '    appBarColor: ${scheme.dark.appBarColor},\n'
          '    error: ${scheme.dark.error},\n'
          '  ),\n';
  if (controller.useToDarkMethod && !useBuiltIn && !controller.useKeyColors) {
    darkScheme = '  colors: const FlexSchemeColor(\n'
        '    primary: ${scheme.light.primary},\n'
        '    primaryContainer: ${scheme.light.primaryContainer},\n'
        '    secondary: ${scheme.light.secondary},\n'
        '    secondaryContainer: ${scheme.light.secondaryContainer},\n'
        '    tertiary: ${scheme.light.tertiary},\n'
        '    tertiaryContainer: ${scheme.light.tertiaryContainer},\n'
        '    appBarColor: ${scheme.light.appBarColor},\n'
        '    error: ${scheme.light.error},\n'
        '  ).defaultError.toDark(${controller.darkMethodLevel}, ${controller.toDarkSwapPrimaryAndContainer}),\n';
  }
  if (controller.useToDarkMethod && useBuiltIn && !controller.useKeyColors) {
    darkScheme =
        '  colors: FlexColor.schemes[${FlexScheme.values[flexScheme]}]!\n'
        '      .light.defaultError.toDark(${controller.darkMethodLevel}, ${controller.toDarkSwapPrimaryAndContainer}),\n';
  }
  //
  // Code for main theme setup, the other properties 'FlexColorScheme.light' and
  // 'FlexColorScheme.dark' factories direct parameters.
  // We avoid adding any code when API default values are being used.
  //
  final String surfaceModeLight = controller.blendLevel > 0 &&
          controller.surfaceModeLight != FlexSurfaceMode.highScaffoldLowSurfaces
      ? '  surfaceMode: ${controller.surfaceModeLight},\n'
      : '';
  final String surfaceModeDark = controller.blendLevelDark > 0 &&
          controller.surfaceModeDark != FlexSurfaceMode.highScaffoldLowSurfaces
      ? '  surfaceMode: ${controller.surfaceModeDark},\n'
      : '';
  final String blendLevel = controller.blendLevel > 0
      ? '  blendLevel: ${controller.blendLevel},\n'
      : '';
  final String usedColors = controller.usedColors != 6
      ? '  usedColors: ${controller.usedColors},\n'
      : '';
  final String blendLevelDark = controller.blendLevelDark > 0
      ? '  blendLevel: ${controller.blendLevelDark},\n'
      : '';
  final String appBarStyleLight = controller.appBarStyleLight == null ||
          (controller.useMaterial3 &&
              controller.appBarBackgroundSchemeColorLight != null)
      ? ''
      : '  appBarStyle: ${controller.appBarStyleLight},\n';
  final String appBarStyleDark = controller.appBarStyleDark == null ||
          (controller.useMaterial3 &&
              controller.appBarBackgroundSchemeColorDark != null)
      ? ''
      : '  appBarStyle: ${controller.appBarStyleDark},\n';
  final String appBarOpacityLight = controller.appBarOpacityLight != 1
      ? '  appBarOpacity: ${controller.appBarOpacityLight.toStringAsFixed(2)},\n'
      : '';
  final String appBarOpacityDark = controller.appBarOpacityDark != 1
      ? '  appBarOpacity: ${controller.appBarOpacityDark.toStringAsFixed(2)},\n'
      : '';
  final String transparentStatusBar = controller.transparentStatusBar
      ? ''
      : '  transparentStatusBar: ${controller.transparentStatusBar},\n';
  final String appBarElevationLight = controller.appBarElevationLight != 0
      ? '  appBarElevation: ${controller.appBarElevationLight.toStringAsFixed(1)},\n'
      : '';
  final String appBarElevationDark = controller.appBarElevationDark != 0
      ? '  appBarElevation: ${controller.appBarElevationDark.toStringAsFixed(1)},\n'
      : '';
  final String tabBarStyle = controller.tabBarStyle != FlexTabBarStyle.forAppBar
      ? '  tabBarStyle: ${controller.tabBarStyle},\n'
      : '';
  final String lightIsWhite = controller.lightIsWhite
      ? '  lightIsWhite: ${controller.lightIsWhite},\n'
      : '';
  final String darkIsTrueBlack = controller.darkIsTrueBlack
      ? '  darkIsTrueBlack: ${controller.darkIsTrueBlack},\n'
      : '';
  final String swapLegacyOnMaterial3 =
      controller.swapLegacyColors && controller.useMaterial3
          ? '  swapLegacyOnMaterial3: ${controller.swapLegacyColors},\n'
          : '';
  final String swapLightColors = controller.swapLightColors
      ? '  swapColors: ${controller.swapLightColors},\n'
      : '';
  final String swapDarkColors = controller.swapDarkColors
      ? '  swapColors: ${controller.swapDarkColors},\n'
      : '';
  final String tooltipsMatchBackground = controller.tooltipsMatchBackground &&
          controller.tooltipSchemeColor == null
      ? '  tooltipsMatchBackground: ${controller.tooltipsMatchBackground},\n'
      : '';
  final String useM3ErrorColors =
      controller.useM3ErrorColors && !controller.useKeyColors
          ? '  useMaterial3ErrorColors: ${controller.useM3ErrorColors},\n'
          : '';
  final String useMaterial3 = controller.useMaterial3
      ? '  useMaterial3: ${controller.useMaterial3},\n'
      : '';
  final String tintLightColor = controller.surfaceTintLight != null
      ? '  surfaceTint: ${controller.surfaceTintLight},\n'
      : '';
  final String tintDarkColor = controller.surfaceTintDark != null
      ? '  surfaceTint: ${controller.surfaceTintDark},\n'
      : '';
  //
  // Code for FlexSubThemesData setup.
  //
  final String interactionEffects = controller.interactionEffects
      ? ''
      : '    interactionEffects: ${controller.interactionEffects},\n';
  final String blendOnLevelLight =
      controller.blendOnLevel > 0 && !controller.useKeyColors
          ? '    blendOnLevel: ${controller.blendOnLevel},\n'
          : '';
  final String blendOnLevelDark =
      controller.blendOnLevelDark > 0 && !controller.useKeyColors
          ? '    blendOnLevel: ${controller.blendOnLevelDark},\n'
          : '';
  final String blendLightOnColors =
      controller.blendLightOnColors || controller.useKeyColors
          ? ''
          : '    blendOnColors: ${controller.blendLightOnColors},\n';
  final String blendDarkOnColors =
      controller.blendDarkOnColors || controller.useKeyColors
          ? ''
          : '    blendOnColors: ${controller.blendDarkOnColors},\n';
  final String blendLightTextTheme = controller.blendLightTextTheme
      ? ''
      : '    blendTextTheme: ${controller.blendLightTextTheme},\n';
  final String blendDarkTextTheme = controller.blendDarkTextTheme
      ? ''
      : '    blendTextTheme: ${controller.blendDarkTextTheme},\n';
  final String useTextTheme = controller.useTextTheme
      ? ''
      : '    useTextTheme: ${controller.useTextTheme},\n';
  final String useFlutterDefaults = controller.useFlutterDefaults
      ? '    useFlutterDefaults: ${controller.useFlutterDefaults},\n'
      : '';
  final String defRadius = controller.defaultRadius != null
      ? '    defaultRadius: ${controller.defaultRadius!.toStringAsFixed(1)},\n'
      : '';
  final String thinBorderWidth = controller.thinBorderWidth != null
      ? '    thinBorderWidth: ${controller.thinBorderWidth!.toStringAsFixed(1)},\n'
      : '';
  final String thickBorderWidth = controller.thickBorderWidth != null
      ? '    thickBorderWidth: ${controller.thickBorderWidth!.toStringAsFixed(1)},\n'
      : '';
  //
  // Material bottom sheet.
  final String bottomSheetRadius = controller.bottomSheetBorderRadius != null
      ? '    bottomSheetRadius: ${controller.bottomSheetBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String bottomSheetElevation = controller.bottomSheetElevation != null
      ? '    bottomSheetElevation: ${controller.bottomSheetElevation!.toStringAsFixed(1)},\n'
      : '';
  final String bottomSheetModalElevation = controller.bottomSheetElevation !=
          null
      ? '    bottomSheetModalElevation: ${controller.bottomSheetElevation!.toStringAsFixed(1)},\n'
      : '';
  final String bottomSheetBackgroundColor = controller.bottomSheetSchemeColor !=
          null
      ? '    bottomSheetBackgroundColor: ${controller.bottomSheetSchemeColor},\n'
      : '';
  final String bottomSheetModalBackgroundColor = controller
              .bottomSheetSchemeColor !=
          null
      ? '    bottomSheetModalBackgroundColor: ${controller.bottomSheetSchemeColor},\n'
      : '';
  //
  // Material button sub themes border radius setup CODE.
  //
  final String textButtonBorderRadius = controller.textButtonBorderRadius !=
          null
      ? '    textButtonRadius: ${controller.textButtonBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String elevatedButtonBorderRadius = controller
              .elevatedButtonBorderRadius !=
          null
      ? '    elevatedButtonRadius: ${controller.elevatedButtonBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String outlinedButtonBorderRadius = controller
              .outlinedButtonBorderRadius !=
          null
      ? '    outlinedButtonRadius: ${controller.outlinedButtonBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String toggleButtonsBorderRadius = controller
              .toggleButtonsBorderRadius !=
          null
      ? '    toggleButtonsRadius: ${controller.toggleButtonsBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  //
  // Material button sub themes scheme colors setup CODE.
  //
  final String textButtonSchemeColor =
      controller.textButtonSchemeColor == SchemeColor.primary ||
              controller.textButtonSchemeColor == null
          ? ''
          : '    textButtonSchemeColor: ${controller.textButtonSchemeColor},\n';
  final String elevatedButtonSchemeColor = controller
                  .elevatedButtonSchemeColor ==
              SchemeColor.primary ||
          controller.elevatedButtonSchemeColor == null
      ? ''
      : '    elevatedButtonSchemeColor: ${controller.elevatedButtonSchemeColor},\n';
  final String elevatedButtonSecondarySchemeColor = controller
              .elevatedButtonSecondarySchemeColor ==
          null
      ? ''
      : '    elevatedButtonSecondarySchemeColor: ${controller.elevatedButtonSecondarySchemeColor},\n';
  final String outlinedButtonSchemeColor = controller
                  .outlinedButtonSchemeColor ==
              SchemeColor.primary ||
          controller.outlinedButtonSchemeColor == null
      ? ''
      : '    outlinedButtonSchemeColor: ${controller.outlinedButtonSchemeColor},\n';
  final String outlinedButtonOutlineSchemeColor = controller
              .outlinedButtonOutlineSchemeColor ==
          null
      ? ''
      : '    outlinedButtonOutlineSchemeColor: ${controller.outlinedButtonOutlineSchemeColor},\n';

  final String outlinedButtonBorderWidth = controller
              .outlinedButtonBorderWidth !=
          null
      ? '    outlinedButtonBorderWidth: ${controller.outlinedButtonBorderWidth!.toStringAsFixed(1)},\n'
      : '';
  final String outlinedButtonPressedBorderWidth = controller
              .outlinedButtonPressedBorderWidth !=
          null
      ? '    outlinedButtonPressedBorderWidth: ${controller.outlinedButtonPressedBorderWidth!.toStringAsFixed(1)},\n'
      : '';
  final String toggleButtonsSchemeColor = controller.toggleButtonsSchemeColor ==
              SchemeColor.primary ||
          controller.toggleButtonsSchemeColor == null
      ? ''
      : '    toggleButtonsSchemeColor: ${controller.toggleButtonsSchemeColor},\n';
  final String toggleButtonsBorderWidth = controller.toggleButtonsBorderWidth !=
          null
      ? '    toggleButtonsBorderWidth: ${controller.toggleButtonsBorderWidth!.toStringAsFixed(1)},\n'
      : '';
  //
  // Switches, CheckBox and radio sub themes setup CODE.
  //
  final String switchSchemeColor = controller.switchSchemeColor == null
      ? ''
      : '    switchSchemeColor: ${controller.switchSchemeColor},\n';
  final String switchThumbSchemeColor = controller.switchThumbSchemeColor ==
          null
      ? ''
      : '    switchThumbSchemeColor: ${controller.switchThumbSchemeColor},\n';
  final String checkboxSchemeColor = controller.checkboxSchemeColor == null
      ? ''
      : '    checkboxSchemeColor: ${controller.checkboxSchemeColor},\n';
  final String radioSchemeColor = controller.radioSchemeColor == null
      ? ''
      : '    radioSchemeColor: ${controller.radioSchemeColor},\n';
  final String unselectedIsColored = controller.unselectedToggleIsColored
      ? '    unselectedToggleIsColored: ${controller.unselectedToggleIsColored},\n'
      : '';
  //
  // Slider sub themes setup CODE.
  //
  final String sliderBaseSchemeColor = controller.sliderBaseSchemeColor == null
      ? ''
      : '    sliderBaseSchemeColor: ${controller.sliderBaseSchemeColor},\n';
  final String sliderValueTinted = controller.sliderValueTinted == false
      ? ''
      : '    sliderValueTinted: ${controller.sliderValueTinted},\n';
  final String sliderTrackHeight = controller.sliderTrackHeight == null
      ? ''
      : '    sliderTrackHeight: ${controller.sliderTrackHeight},\n';
  //
  // Input decorator setup CODE.
  //
  final String inputDecoratorSchemeColorLight = controller
                  .inputDecoratorSchemeColorLight ==
              SchemeColor.primary ||
          controller.inputDecoratorSchemeColorLight == null
      ? ''
      : '    inputDecoratorSchemeColor: ${controller.inputDecoratorSchemeColorLight},\n';
  final String inputDecoratorSchemeColorDark = controller
                  .inputDecoratorSchemeColorDark ==
              SchemeColor.primary ||
          controller.inputDecoratorSchemeColorDark == null
      ? ''
      : '    inputDecoratorSchemeColor: ${controller.inputDecoratorSchemeColorDark},\n';
  final String inputDecoratorIsFilled = controller.inputDecoratorIsFilled
      ? ''
      : '    inputDecoratorIsFilled: ${controller.inputDecoratorIsFilled},\n';
  final String inputDecoratorBorderType = controller.inputDecoratorBorderType ==
          FlexInputBorderType.outline
      ? ''
      : '    inputDecoratorBorderType: ${controller.inputDecoratorBorderType},\n';
  final String inputDecoratorBorderRadius = controller
              .inputDecoratorBorderRadius !=
          null
      ? '    inputDecoratorRadius: ${controller.inputDecoratorBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String inputDecoratorUnfocusedHasBorder = controller
          .inputDecoratorUnfocusedHasBorder
      ? ''
      : '    inputDecoratorUnfocusedHasBorder: ${controller.inputDecoratorUnfocusedHasBorder},\n';
  final String inputDecoratorUnfocusedBorderIsColored = controller
              .inputDecoratorUnfocusedBorderIsColored ||
          !controller.inputDecoratorUnfocusedHasBorder
      ? ''
      : '    inputDecoratorUnfocusedBorderIsColored: ${controller.inputDecoratorUnfocusedBorderIsColored},\n';
  final String inputDecoratorBorderWidth = controller
              .inputDecoratorBorderWidth !=
          null
      ? '    inputDecoratorBorderWidth: ${controller.inputDecoratorBorderWidth!.toStringAsFixed(1)},\n'
      : '';
  final String inputDecoratorFocusedBorderWidth = controller
              .inputDecoratorFocusedBorderWidth !=
          null
      ? '    inputDecoratorFocusedBorderWidth: ${controller.inputDecoratorFocusedBorderWidth!.toStringAsFixed(1)},\n'
      : '';
  //
  // Fab and chip, snack, card, and popup setup CODE
  //
  final String fabUseShape = controller.fabUseShape
      ? '    fabUseShape: ${controller.fabUseShape},\n'
      : '';
  final String fabAlwaysCircular =
      controller.fabUseShape && controller.fabAlwaysCircular
          ? '    fabAlwaysCircular: ${controller.fabAlwaysCircular},\n'
          : '';
  final String fabBorderRadius = controller.fabBorderRadius != null &&
          controller.fabUseShape &&
          !controller.fabAlwaysCircular
      ? '    fabRadius: ${controller.fabBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String fabSchemeColor =
      controller.fabSchemeColor == SchemeColor.secondary ||
              controller.fabSchemeColor == null
          ? ''
          : '    fabSchemeColor: ${controller.fabSchemeColor},\n';
  final String snackSchemeColor = controller.snackBarSchemeColor != null
      ? '    snackBarBackgroundSchemeColor: ${controller.snackBarSchemeColor},\n'
      : '';
  final String chipSchemeColor = controller.chipSchemeColor != null
      ? '    chipSchemeColor: ${controller.chipSchemeColor},\n'
      : '';
  final String chipSelectedSchemeColor = controller.chipSelectedSchemeColor !=
          null
      ? '    chipSelectedSchemeColor: ${controller.chipSelectedSchemeColor},\n'
      : '';
  final String chipDeleteIconSchemeColor = controller
              .chipDeleteIconSchemeColor !=
          null
      ? '    chipDeleteIconSchemeColor: ${controller.chipDeleteIconSchemeColor},\n'
      : '';
  final String chipBorderRadius = controller.chipBorderRadius != null
      ? '    chipRadius: ${controller.chipBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String cardBorderRadius = controller.cardBorderRadius != null
      ? '    cardRadius: ${controller.cardBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String popupMenuBorderRadius = controller.popupMenuBorderRadius != null
      ? '    popupMenuRadius: ${controller.popupMenuBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String popupMenuElevation = controller.popupMenuElevation != null
      ? '    popupMenuElevation: ${controller.popupMenuElevation!.toStringAsFixed(1)},\n'
      : '';
  final String popupMenuSchemeColor = controller.popupMenuSchemeColor != null
      ? '    popupMenuSchemeColor: ${controller.popupMenuSchemeColor},\n'
      : '';
  final String popupMenuOpacity = controller.popupMenuOpacity != 1
      ? '    popupMenuOpacity: ${controller.popupMenuOpacity.toStringAsFixed(2)},\n'
      : '';
  //
  // Tooltip setup CODE
  //
  final String tooltipRadius = controller.tooltipRadius != null
      ? '    tooltipRadius: ${controller.tooltipRadius},\n'
      : '';
  final String tooltipWaitDuration = controller.tooltipWaitDuration != null
      ? '    tooltipWaitDuration: Duration(milliseconds: ${controller.tooltipWaitDuration}),\n'
      : '';
  final String tooltipShowDuration = controller.tooltipShowDuration != null
      ? '    tooltipShowDuration: Duration(milliseconds: ${controller.tooltipShowDuration}),\n'
      : '';
  final String tooltipSchemeColor = controller.tooltipSchemeColor != null
      ? '    tooltipSchemeColor: ${controller.tooltipSchemeColor},\n'
      : '';
  final String tooltipOpacity =
      controller.tooltipOpacity == 1.0 || controller.tooltipSchemeColor == null
          ? ''
          : '    tooltipOpacity: ${controller.tooltipOpacity},\n';
  //
  // Dialog, AppBar and TabBar setup CODE
  //
  final String dialogBackgroundSchemeColor = controller
              .dialogBackgroundSchemeColor !=
          null
      ? '    dialogBackgroundSchemeColor: ${controller.dialogBackgroundSchemeColor},\n'
      : '';
  final String dialogBorderRadius = controller.dialogBorderRadius != null
      ? '    dialogRadius: ${controller.dialogBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String timePickerDialogRadius = controller.dialogBorderRadius != null
      ? '    timePickerDialogRadius: ${controller.dialogBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String dialogElevation = controller.dialogElevation != null
      ? '    dialogElevation: ${controller.dialogElevation!.toStringAsFixed(1)},\n'
      : '';
  final String appBarBackgroundSchemeColorLight = controller
              .appBarBackgroundSchemeColorLight !=
          null
      ? '    appBarBackgroundSchemeColor: ${controller.appBarBackgroundSchemeColorLight},\n'
      : '';
  final String appBarBackgroundSchemeColorDark = controller
              .appBarBackgroundSchemeColorDark !=
          null
      ? '    appBarBackgroundSchemeColor: ${controller.appBarBackgroundSchemeColorDark},\n'
      : '';
  final String tabBarItemSchemeColorLight = controller
              .tabBarItemSchemeColorLight !=
          null
      ? '    tabBarItemSchemeColor: ${controller.tabBarItemSchemeColorLight},\n'
      : '';
  final String tabBarIndicatorSchemeColorLight = controller
              .tabBarIndicatorLight !=
          null
      ? '    tabBarIndicatorSchemeColor: ${controller.tabBarIndicatorLight},\n'
      : '';
  final String tabBarItemSchemeColorDark = controller
              .tabBarItemSchemeColorDark !=
          null
      ? '    tabBarItemSchemeColor: ${controller.tabBarItemSchemeColorDark},\n'
      : '';
  final String tabBarIndicatorSchemeColorDark = controller
              .tabBarIndicatorDark !=
          null
      ? '    tabBarIndicatorSchemeColor: ${controller.tabBarIndicatorDark},\n'
      : '';
  //
  // BottomNavigationBar setup CODE
  //
  final String bottomNavigationBarSelectedLabelSchemeColor = controller
              .bottomNavBarSelectedSchemeColor !=
          null
      ? '    bottomNavigationBarSelectedLabelSchemeColor: ${controller.bottomNavBarSelectedSchemeColor},\n'
      : '';
  final String bottomNavigationBarUnselectedLabelSchemeColor = controller
              .bottomNavBarUnselectedSchemeColor !=
          null
      ? '    bottomNavigationBarUnselectedLabelSchemeColor: ${controller.bottomNavBarUnselectedSchemeColor},\n'
      : '';
  final String bottomNavigationBarMutedUnselectedLabel = controller
              .bottomNavBarMuteUnselected ||
          (controller.useFlutterDefaults &&
              controller.bottomNavBarSelectedSchemeColor == null &&
              controller.bottomNavBarUnselectedSchemeColor == null)
      ? ''
      : '    bottomNavigationBarMutedUnselectedLabel: ${controller.bottomNavBarMuteUnselected},\n';
  final String bottomNavigationBarSelectedIconSchemeColor = controller
              .bottomNavBarSelectedSchemeColor !=
          null
      ? '    bottomNavigationBarSelectedIconSchemeColor: ${controller.bottomNavBarSelectedSchemeColor},\n'
      : '';
  final String bottomNavigationBarUnselectedIconSchemeColor = controller
              .bottomNavBarUnselectedSchemeColor !=
          null
      ? '    bottomNavigationBarUnselectedIconSchemeColor: ${controller.bottomNavBarUnselectedSchemeColor},\n'
      : '';
  final String bottomNavigationBarMutedUnselectedIcon = controller
              .bottomNavBarMuteUnselected ||
          (controller.useFlutterDefaults &&
              controller.bottomNavBarSelectedSchemeColor == null &&
              controller.bottomNavBarUnselectedSchemeColor == null)
      ? ''
      : '    bottomNavigationBarMutedUnselectedIcon: ${controller.bottomNavBarMuteUnselected},\n';
  final String bottomNavigationBarBackgroundSchemeColor = controller
              .bottomNavBarBackgroundSchemeColor !=
          null
      ? '    bottomNavigationBarBackgroundSchemeColor: ${controller.bottomNavBarBackgroundSchemeColor},\n'
      : '';
  final String bottomNavigationBarOpacity = controller
                  .bottomNavigationBarOpacity !=
              1 &&
          !(controller.bottomNavBarBackgroundSchemeColor == null &&
              controller.useFlutterDefaults)
      ? '    bottomNavigationBarOpacity: ${controller.bottomNavigationBarOpacity.toStringAsFixed(2)},\n'
      : '';
  final String bottomNavigationBarElevation = controller
              .bottomNavigationBarElevation !=
          0
      ? '    bottomNavigationBarElevation: ${controller.bottomNavigationBarElevation.toStringAsFixed(1)},\n'
      : '';
  final String bottomNavigationBarShowSelectedLabels = controller
          .bottomNavShowSelectedLabels
      ? ''
      : '    bottomNavigationBarShowSelectedLabels: ${controller.bottomNavShowSelectedLabels},\n';
  final String bottomNavigationBarShowUnselectedLabels = controller
          .bottomNavShowUnselectedLabels
      ? ''
      : '    bottomNavigationBarShowUnselectedLabels: ${controller.bottomNavShowUnselectedLabels},\n';
  //
  // NavigationBar setup CODE
  //
  final String navigationBarSelectedLabelSchemeColor = controller
              .navBarSelectedSchemeColor !=
          null
      ? '    navigationBarSelectedLabelSchemeColor: ${controller.navBarSelectedSchemeColor},\n'
      : '';
  final String navigationBarUnselectedLabelSchemeColor = controller
              .navBarUnselectedSchemeColor !=
          null
      ? '    navigationBarUnselectedLabelSchemeColor: ${controller.navBarUnselectedSchemeColor},\n'
      : '';
  final String navigationBarMutedUnselectedLabel = controller
          .navBarMuteUnselected
      ? ''
      : '    navigationBarMutedUnselectedLabel: ${controller.navBarMuteUnselected},\n';
  final String navigationBarSelectedIconSchemeColor = controller
              .navBarSelectedSchemeColor !=
          null
      ? '    navigationBarSelectedIconSchemeColor: ${controller.navBarSelectedSchemeColor},\n'
      : '';
  final String navigationBarUnselectedIconSchemeColor = controller
              .navBarUnselectedSchemeColor !=
          null
      ? '    navigationBarUnselectedIconSchemeColor: ${controller.navBarUnselectedSchemeColor},\n'
      : '';
  final String navigationBarMutedUnselectedIcon = controller
          .navBarMuteUnselected
      ? ''
      : '    navigationBarMutedUnselectedIcon: ${controller.navBarMuteUnselected},\n';
  final String navigationBarIndicatorSchemeColor = controller
              .navBarIndicatorSchemeColor !=
          null
      ? '    navigationBarIndicatorSchemeColor: ${controller.navBarIndicatorSchemeColor},\n'
      : '';
  final String navigationBarIndicatorOpacity = controller
                  .navBarIndicatorOpacity !=
              null &&
          !(controller.navBarIndicatorSchemeColor == null &&
              controller.useFlutterDefaults)
      ? '    navigationBarIndicatorOpacity: ${controller.navBarIndicatorOpacity!.toStringAsFixed(2)},\n'
      : '';
  final String navigationBarBackgroundSchemeColor = controller
              .navBarBackgroundSchemeColor !=
          null
      ? '    navigationBarBackgroundSchemeColor: ${controller.navBarBackgroundSchemeColor},\n'
      : '';
  final String navigationBarOpacity = controller.navBarOpacity != 1 &&
          !(controller.navBarBackgroundSchemeColor == null &&
              controller.useFlutterDefaults)
      ? '    navigationBarOpacity: ${controller.navBarOpacity.toStringAsFixed(2)},\n'
      : '';
  final String navigationBarHeight = controller.navBarHeight != null
      ? '    navigationBarHeight: ${controller.navBarHeight!.toStringAsFixed(1)},\n'
      : '';
  final String navigationBarLabelBehavior = controller.navBarLabelBehavior !=
          NavigationDestinationLabelBehavior.alwaysShow
      ? '    navigationBarLabelBehavior: ${controller.navBarLabelBehavior},\n'
      : '';
  //
  // NavigationRail setup CODE
  //
  final String navigationRailSelectedLabelSchemeColor = controller
              .navRailSelectedSchemeColor !=
          null
      ? '    navigationRailSelectedLabelSchemeColor: ${controller.navRailSelectedSchemeColor},\n'
      : '';
  final String navigationRailUnselectedLabelSchemeColor = controller
              .navRailUnselectedSchemeColor !=
          null
      ? '    navigationRailUnselectedLabelSchemeColor: ${controller.navRailUnselectedSchemeColor},\n'
      : '';
  final String navigationRailMutedUnselectedLabel = controller
              .navRailMuteUnselected ||
          (controller.useFlutterDefaults &&
              controller.navRailSelectedSchemeColor == null &&
              controller.navRailUnselectedSchemeColor == null)
      ? ''
      : '    navigationRailMutedUnselectedLabel: ${controller.navRailMuteUnselected},\n';
  final String navigationRailSelectedIconSchemeColor = controller
              .navRailSelectedSchemeColor !=
          null
      ? '    navigationRailSelectedIconSchemeColor: ${controller.navRailSelectedSchemeColor},\n'
      : '';
  final String navigationRailUnselectedIconSchemeColor = controller
              .navRailUnselectedSchemeColor !=
          null
      ? '    navigationRailUnselectedIconSchemeColor: ${controller.navRailUnselectedSchemeColor},\n'
      : '';
  final String navigationRailMutedUnselectedIcon = controller
              .navRailMuteUnselected ||
          (controller.useFlutterDefaults &&
              controller.navRailSelectedSchemeColor == null &&
              controller.navRailUnselectedSchemeColor == null)
      ? ''
      : '    navigationRailMutedUnselectedIcon: ${controller.navRailMuteUnselected},\n';
  final String navigationRailUseIndicator = controller.navRailUseIndicator
      ? ''
      : '    navigationRailUseIndicator: ${controller.navRailUseIndicator},\n';
  final String navigationRailIndicatorSchemeColor = controller
                  .navRailIndicatorSchemeColor !=
              null &&
          controller.navRailUseIndicator
      ? '    navigationRailIndicatorSchemeColor: ${controller.navRailIndicatorSchemeColor},\n'
      : '';
  final String navigationRailIndicatorOpacity = controller
                  .navRailIndicatorOpacity !=
              null &&
          !(controller.navRailIndicatorSchemeColor == null &&
              controller.navRailUseIndicator &&
              controller.useFlutterDefaults)
      ? '    navigationRailIndicatorOpacity: ${controller.navRailIndicatorOpacity!.toStringAsFixed(2)},\n'
      : '';
  final String navigationRailBackgroundSchemeColor = controller
              .navRailBackgroundSchemeColor !=
          null
      ? '    navigationRailBackgroundSchemeColor: ${controller.navRailBackgroundSchemeColor},\n'
      : '';
  final String navigationRailOpacity = controller.navRailOpacity != 1 &&
          !(controller.navRailBackgroundSchemeColor == null &&
              controller.useFlutterDefaults)
      ? '    navigationRailOpacity: ${controller.navRailOpacity.toStringAsFixed(2)},\n'
      : '';
  final String navigationRailElevation = controller.navigationRailElevation != 0
      ? '    navigationRailElevation: ${controller.navigationRailElevation.toStringAsFixed(1)},\n'
      : '';
  final String navigationRailLabelType =
      controller.navRailLabelType != NavigationRailLabelType.all
          ? '    navigationRailLabelType: ${controller.navRailLabelType},\n'
          : '';
  //
  // Compose the sub themes from above fragments.
  // Order attempts to be in same order as they appear in the large
  // FlexSubThemesData class.
  String lightSubTheme = controller.useSubThemes
      ? '  subThemesData: const FlexSubThemesData(\n'
          '$interactionEffects'
          '$blendOnLevelLight'
          '$blendLightOnColors'
          '$useFlutterDefaults'
          //
          '$blendLightTextTheme'
          '$useTextTheme'
          //
          '$thinBorderWidth'
          '$thickBorderWidth'
          //
          '$defRadius'
          //
          '$textButtonBorderRadius'
          '$textButtonSchemeColor'
          //
          '$elevatedButtonBorderRadius'
          '$elevatedButtonSchemeColor'
          '$elevatedButtonSecondarySchemeColor'
          //
          '$outlinedButtonBorderRadius'
          '$outlinedButtonSchemeColor'
          '$outlinedButtonOutlineSchemeColor'
          '$outlinedButtonBorderWidth'
          '$outlinedButtonPressedBorderWidth'
          //
          '$toggleButtonsBorderRadius'
          '$toggleButtonsSchemeColor'
          '$toggleButtonsBorderWidth'
          //
          '$switchSchemeColor'
          '$switchThumbSchemeColor'
          '$checkboxSchemeColor'
          '$radioSchemeColor'
          '$unselectedIsColored'
          //
          '$sliderBaseSchemeColor'
          '$sliderValueTinted'
          '$sliderTrackHeight'
          //
          '$inputDecoratorSchemeColorLight'
          '$inputDecoratorIsFilled'
          '$inputDecoratorBorderType'
          '$inputDecoratorBorderRadius'
          '$inputDecoratorUnfocusedHasBorder'
          '$inputDecoratorUnfocusedBorderIsColored'
          '$inputDecoratorBorderWidth'
          '$inputDecoratorFocusedBorderWidth'
          //
          '$fabUseShape'
          '$fabAlwaysCircular'
          '$fabBorderRadius'
          '$fabSchemeColor'
          //
          '$chipSchemeColor'
          '$chipSelectedSchemeColor'
          '$chipDeleteIconSchemeColor'
          '$chipBorderRadius'
          //
          '$cardBorderRadius'
          //
          '$popupMenuBorderRadius'
          '$popupMenuElevation'
          '$popupMenuSchemeColor'
          '$popupMenuOpacity'
          //
          '$tooltipRadius'
          '$tooltipWaitDuration'
          '$tooltipShowDuration'
          '$tooltipSchemeColor'
          '$tooltipOpacity'
          //
          '$dialogBackgroundSchemeColor'
          '$dialogBorderRadius'
          '$timePickerDialogRadius'
          '$dialogElevation'
          //
          '$snackSchemeColor'
          //
          '$appBarBackgroundSchemeColorLight'
          //
          '$tabBarItemSchemeColorLight'
          '$tabBarIndicatorSchemeColorLight'
          //
          '$bottomSheetBackgroundColor'
          '$bottomSheetModalBackgroundColor'
          '$bottomSheetRadius'
          '$bottomSheetElevation'
          '$bottomSheetModalElevation'
          //
          '$bottomNavigationBarSelectedLabelSchemeColor'
          '$bottomNavigationBarUnselectedLabelSchemeColor'
          '$bottomNavigationBarMutedUnselectedLabel'
          '$bottomNavigationBarSelectedIconSchemeColor'
          '$bottomNavigationBarUnselectedIconSchemeColor'
          '$bottomNavigationBarMutedUnselectedIcon'
          '$bottomNavigationBarBackgroundSchemeColor'
          '$bottomNavigationBarOpacity'
          '$bottomNavigationBarElevation'
          '$bottomNavigationBarShowSelectedLabels'
          '$bottomNavigationBarShowUnselectedLabels'
          //
          '$navigationBarSelectedLabelSchemeColor'
          '$navigationBarUnselectedLabelSchemeColor'
          '$navigationBarMutedUnselectedLabel'
          '$navigationBarSelectedIconSchemeColor'
          '$navigationBarUnselectedIconSchemeColor'
          '$navigationBarMutedUnselectedIcon'
          '$navigationBarIndicatorSchemeColor'
          '$navigationBarIndicatorOpacity'
          '$navigationBarBackgroundSchemeColor'
          '$navigationBarOpacity'
          '$navigationBarHeight'
          '$navigationBarLabelBehavior'
          //
          '$navigationRailSelectedLabelSchemeColor'
          '$navigationRailUnselectedLabelSchemeColor'
          '$navigationRailMutedUnselectedLabel'
          '$navigationRailSelectedIconSchemeColor'
          '$navigationRailUnselectedIconSchemeColor'
          '$navigationRailMutedUnselectedIcon'
          '$navigationRailUseIndicator'
          '$navigationRailIndicatorSchemeColor'
          '$navigationRailIndicatorOpacity'
          '$navigationRailBackgroundSchemeColor'
          '$navigationRailOpacity'
          '$navigationRailElevation'
          '$navigationRailLabelType'
          //
          '  ),\n'
      : '';
  String darkSubTheme = controller.useSubThemes
      ? '  subThemesData: const FlexSubThemesData(\n'
          '$interactionEffects'
          '$blendOnLevelDark'
          '$blendDarkOnColors'
          '$useFlutterDefaults'
          //
          '$blendDarkTextTheme'
          '$useTextTheme'
          //
          '$defRadius'
          //
          '$thinBorderWidth'
          '$thickBorderWidth'
          //
          '$textButtonBorderRadius'
          '$textButtonSchemeColor'
          //
          '$elevatedButtonBorderRadius'
          '$elevatedButtonSchemeColor'
          '$elevatedButtonSecondarySchemeColor'
          //
          '$outlinedButtonBorderRadius'
          '$outlinedButtonSchemeColor'
          '$outlinedButtonOutlineSchemeColor'
          '$outlinedButtonBorderWidth'
          '$outlinedButtonPressedBorderWidth'
          //
          '$toggleButtonsBorderRadius'
          '$toggleButtonsSchemeColor'
          '$toggleButtonsBorderWidth'
          //
          '$switchSchemeColor'
          '$switchThumbSchemeColor'
          '$checkboxSchemeColor'
          '$radioSchemeColor'
          '$unselectedIsColored'
          //
          '$sliderBaseSchemeColor'
          '$sliderValueTinted'
          '$sliderTrackHeight'
          //
          '$inputDecoratorSchemeColorDark'
          '$inputDecoratorIsFilled'
          '$inputDecoratorBorderType'
          '$inputDecoratorBorderRadius'
          '$inputDecoratorUnfocusedHasBorder'
          '$inputDecoratorUnfocusedBorderIsColored'
          '$inputDecoratorBorderWidth'
          '$inputDecoratorFocusedBorderWidth'
          //
          '$fabUseShape'
          '$fabAlwaysCircular'
          '$fabBorderRadius'
          '$fabSchemeColor'
          //
          '$chipSchemeColor'
          '$chipSelectedSchemeColor'
          '$chipDeleteIconSchemeColor'
          '$chipBorderRadius'
          //
          '$cardBorderRadius'
          //
          '$popupMenuBorderRadius'
          '$popupMenuElevation'
          '$popupMenuSchemeColor'
          '$popupMenuOpacity'
          //
          '$tooltipRadius'
          '$tooltipWaitDuration'
          '$tooltipShowDuration'
          '$tooltipSchemeColor'
          '$tooltipOpacity'
          //
          '$dialogBackgroundSchemeColor'
          '$dialogBorderRadius'
          '$timePickerDialogRadius'
          '$dialogElevation'
          //
          '$snackSchemeColor'
          //
          '$appBarBackgroundSchemeColorDark'
          //
          '$tabBarItemSchemeColorDark'
          '$tabBarIndicatorSchemeColorDark'
          //
          '$bottomSheetBackgroundColor'
          '$bottomSheetModalBackgroundColor'
          '$bottomSheetRadius'
          '$bottomSheetElevation'
          '$bottomSheetModalElevation'
          //
          '$bottomNavigationBarSelectedLabelSchemeColor'
          '$bottomNavigationBarUnselectedLabelSchemeColor'
          '$bottomNavigationBarMutedUnselectedLabel'
          '$bottomNavigationBarSelectedIconSchemeColor'
          '$bottomNavigationBarUnselectedIconSchemeColor'
          '$bottomNavigationBarMutedUnselectedIcon'
          '$bottomNavigationBarBackgroundSchemeColor'
          '$bottomNavigationBarOpacity'
          '$bottomNavigationBarElevation'
          '$bottomNavigationBarShowSelectedLabels'
          '$bottomNavigationBarShowUnselectedLabels'
          //
          '$navigationBarSelectedLabelSchemeColor'
          '$navigationBarUnselectedLabelSchemeColor'
          '$navigationBarMutedUnselectedLabel'
          '$navigationBarSelectedIconSchemeColor'
          '$navigationBarUnselectedIconSchemeColor'
          '$navigationBarMutedUnselectedIcon'
          '$navigationBarIndicatorSchemeColor'
          '$navigationBarIndicatorOpacity'
          '$navigationBarBackgroundSchemeColor'
          '$navigationBarOpacity'
          '$navigationBarHeight'
          '$navigationBarLabelBehavior'
          //
          '$navigationRailSelectedLabelSchemeColor'
          '$navigationRailUnselectedLabelSchemeColor'
          '$navigationRailMutedUnselectedLabel'
          '$navigationRailSelectedIconSchemeColor'
          '$navigationRailUnselectedIconSchemeColor'
          '$navigationRailMutedUnselectedIcon'
          '$navigationRailUseIndicator'
          '$navigationRailIndicatorSchemeColor'
          '$navigationRailIndicatorOpacity'
          '$navigationRailBackgroundSchemeColor'
          '$navigationRailOpacity'
          '$navigationRailElevation'
          '$navigationRailLabelType'
          '  ),\n'
      : '';
  // Make a prettier version of the constructor if we have default one.
  if (lightSubTheme == '  subThemesData: const FlexSubThemesData(\n  ),\n') {
    lightSubTheme = '  subThemesData: const FlexSubThemesData(),\n';
  }
  if (darkSubTheme == '  subThemesData: const FlexSubThemesData(\n  ),\n') {
    darkSubTheme = '  subThemesData: const FlexSubThemesData(),\n';
  }
  //
  // Define code for key color usage and tones.
  final String useSecondary = controller.useSecondary
      ? '    useSecondary: ${controller.useSecondary},\n'
      : '';
  final String useTertiary = controller.useTertiary
      ? '    useTertiary: ${controller.useTertiary},\n'
      : '';
  final String keepPrimary = controller.keepPrimary
      ? '    keepPrimary: ${controller.keepPrimary},\n'
      : '';
  final String keepSecondary = controller.keepSecondary
      ? '    keepSecondary: ${controller.keepSecondary},\n'
      : '';
  final String keepTertiary = controller.keepTertiary
      ? '    keepTertiary: ${controller.keepTertiary},\n'
      : '';
  final String keepPrimaryContainer = controller.keepPrimaryContainer
      ? '    keepPrimaryContainer: ${controller.keepPrimaryContainer},\n'
      : '';
  final String keepSecondaryContainer = controller.keepSecondaryContainer
      ? '    keepSecondaryContainer: ${controller.keepSecondaryContainer},\n'
      : '';
  final String keepTertiaryContainer = controller.keepTertiaryContainer
      ? '    keepTertiaryContainer: ${controller.keepTertiaryContainer},\n'
      : '';
  final String keepDarkPrimary = controller.keepDarkPrimary
      ? '    keepPrimary: ${controller.keepDarkPrimary},\n'
      : '';
  final String keepDarkSecondary = controller.keepDarkSecondary
      ? '    keepSecondary: ${controller.keepDarkSecondary},\n'
      : '';
  final String keepDarkTertiary = controller.keepDarkTertiary
      ? '    keepTertiary: ${controller.keepDarkTertiary},\n'
      : '';
  final String keepDarkPrimaryContainer = controller.keepDarkPrimaryContainer
      ? '    keepPrimaryContainer: ${controller.keepDarkPrimaryContainer},\n'
      : '';
  final String keepDarkSecondaryContainer = controller
          .keepDarkSecondaryContainer
      ? '    keepSecondaryContainer: ${controller.keepDarkSecondaryContainer},\n'
      : '';
  final String keepDarkTertiaryContainer = controller.keepDarkTertiaryContainer
      ? '    keepTertiaryContainer: ${controller.keepDarkTertiaryContainer},\n'
      : '';

  String useKeyColorsLight = controller.useKeyColors
      ? '  keyColors: const FlexKeyColors(\n'
          '$useSecondary'
          '$useTertiary'
          '$keepPrimary'
          '$keepSecondary'
          '$keepTertiary'
          '$keepPrimaryContainer'
          '$keepSecondaryContainer'
          '$keepTertiaryContainer'
          '  ),\n'
      : '';
  String useKeyColorsDark = controller.useKeyColors
      ? '  keyColors: const FlexKeyColors(\n'
          '$useSecondary'
          '$useTertiary'
          '$keepDarkPrimary'
          '$keepDarkSecondary'
          '$keepDarkTertiary'
          '$keepDarkPrimaryContainer'
          '$keepDarkSecondaryContainer'
          '$keepDarkTertiaryContainer'
          '  ),\n'
      : '';
  // Make a prettier version of the constructor if that is all we got.
  if (useKeyColorsLight == '  keyColors: const FlexKeyColors(\n  ),\n') {
    useKeyColorsLight = '  keyColors: const FlexKeyColors(),\n';
  }
  if (useKeyColorsDark == '  keyColors: const FlexKeyColors(\n  ),\n') {
    useKeyColorsDark = '  keyColors: const FlexKeyColors(),\n';
  }
  String flexTonesLight = '';
  String flexTonesDark = '';
  if (controller.useKeyColors) {
    if (controller.usedFlexToneSetup == 1 &&
        (controller.onMainsUseBWLight || controller.onSurfacesUseBWLight)) {
      flexTonesLight = '  tones: FlexTones.material(Brightness.light)';
    }
    if (controller.usedFlexToneSetup == 1 &&
        (controller.onMainsUseBWDark || controller.onSurfacesUseBWDark)) {
      flexTonesDark = '  tones: FlexTones.material(Brightness.dark)';
    }
    if (controller.usedFlexToneSetup == 2) {
      flexTonesLight = '  tones: FlexTones.soft(Brightness.light)';
      flexTonesDark = '  tones: FlexTones.soft(Brightness.dark)';
    }
    if (controller.usedFlexToneSetup == 3) {
      flexTonesLight = '  tones: FlexTones.vivid(Brightness.light)';
      flexTonesDark = '  tones: FlexTones.vivid(Brightness.dark)';
    }
    if (controller.usedFlexToneSetup == 4) {
      flexTonesLight = '  tones: FlexTones.vividSurfaces(Brightness.light)';
      flexTonesDark = '  tones: FlexTones.vividSurfaces(Brightness.dark)';
    }
    if (controller.usedFlexToneSetup == 5) {
      flexTonesLight = '  tones: FlexTones.highContrast(Brightness.light)';
      flexTonesDark = '  tones: FlexTones.highContrast(Brightness.dark)';
    }
    if (controller.usedFlexToneSetup == 6) {
      flexTonesLight = '  tones: FlexTones.ultraContrast(Brightness.light)';
      flexTonesDark = '  tones: FlexTones.ultraContrast(Brightness.dark)';
    }
    if (controller.usedFlexToneSetup == 7) {
      flexTonesLight = '  tones: FlexTones.jolly(Brightness.light)';
      flexTonesDark = '  tones: FlexTones.jolly(Brightness.dark)';
    }
    if (controller.usedFlexToneSetup == 8) {
      flexTonesLight = '  tones: FlexTones.vividBackground(Brightness.light)';
      flexTonesDark = '  tones: FlexTones.vividBackground(Brightness.dark)';
    }
    if (controller.usedFlexToneSetup == 9) {
      flexTonesLight = '  tones: FlexTones.oneHue(Brightness.light)';
      flexTonesDark = '  tones: FlexTones.oneHue(Brightness.dark)';
    }
    final String onMainsUseBWLight =
        controller.onMainsUseBWLight ? '.onMainsUseBW()' : '';
    final String onSurfacesUseBWLight =
        controller.onSurfacesUseBWLight ? '.onSurfacesUseBW()' : '';
    final String onMainsUseBWDark =
        controller.onMainsUseBWDark ? '.onMainsUseBW()' : '';
    final String onSurfacesUseBWDark =
        controller.onSurfacesUseBWDark ? '.onSurfacesUseBW()' : '';
    flexTonesLight = '$flexTonesLight$onMainsUseBWLight$onSurfacesUseBWLight';
    flexTonesDark = '$flexTonesDark$onMainsUseBWDark$onSurfacesUseBWDark';
    if (controller.onMainsUseBWLight ||
        controller.onSurfacesUseBWLight ||
        controller.usedFlexToneSetup != 1) {
      flexTonesLight = '$flexTonesLight,\n';
    }
    if (controller.onMainsUseBWDark ||
        controller.onSurfacesUseBWDark ||
        controller.usedFlexToneSetup != 1) {
      flexTonesDark = '$flexTonesDark,\n';
    }
  }

  //
  // Compose the final FlexThemeData code string, from all above fragments.
  //
  final String code = '// This theme was made for FlexColorScheme version '
      '${AppData.packageVersion}. Make sure\n'
      '// you use same or higher version, but still same major version. If\n'
      '// you use a lower version, some properties may not be supported. In\n'
      '// that case you can also remove them after copying the theme to '
      'your app.\n'
      'theme: FlexThemeData.light(\n'
      '$lightScheme'
      '$usedColors'
      '$surfaceModeLight'
      '$blendLevel'
      '$appBarStyleLight'
      '$appBarOpacityLight'
      '$transparentStatusBar'
      '$appBarElevationLight'
      '$tabBarStyle'
      '$lightIsWhite'
      '$swapLightColors'
      '$tintLightColor'
      '$tooltipsMatchBackground'
      '$lightSubTheme'
      '$useKeyColorsLight'
      '$useM3ErrorColors'
      '$flexTonesLight'
      '  visualDensity: FlexColorScheme.comfortablePlatformDensity,\n'
      '$useMaterial3'
      '$swapLegacyOnMaterial3'
      '  // To use the playground font, add GoogleFonts package and uncomment\n'
      '  // fontFamily: GoogleFonts.notoSans().fontFamily,\n'
      '),\n'
      'darkTheme: FlexThemeData.dark(\n'
      '$darkScheme'
      '$usedColors'
      '$surfaceModeDark'
      '$blendLevelDark'
      '$appBarStyleDark'
      '$appBarOpacityDark'
      '$transparentStatusBar'
      '$appBarElevationDark'
      '$tabBarStyle'
      '$darkIsTrueBlack'
      '$swapDarkColors'
      '$tintDarkColor'
      '$tooltipsMatchBackground'
      '$darkSubTheme'
      '$useKeyColorsDark'
      '$useM3ErrorColors'
      '$flexTonesDark'
      '  visualDensity: FlexColorScheme.comfortablePlatformDensity,\n'
      '$useMaterial3'
      '$swapLegacyOnMaterial3'
      '  // To use the Playground font, add GoogleFonts package and uncomment\n'
      '  // fontFamily: GoogleFonts.notoSans().fontFamily,\n'
      '),\n'
      '// If you do not have a themeMode switch, uncomment this line\n'
      '// to let the device system mode control the theme mode:\n'
      '// themeMode: ThemeMode.system,\n';
  return code;
}
