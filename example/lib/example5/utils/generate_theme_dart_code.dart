// ignore_for_file: lines_longer_than_80_chars
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../shared/const/app_color.dart';
import '../../shared/const/app_data.dart';
import '../../shared/controllers/theme_controller.dart';

/// A function that returns the FlexColorScheme Dart and Flutter setup
/// code for the theme held by ThemeController.
///
/// The properties are in the order they are in the classes.
String generateThemeDartCode(ThemeController controller) {
  //
  // Code for main theme setup, the effective colors setup.
  //
  final FlexSchemeData scheme = AppColor.scheme(controller);
  // Get the enum index of scheme
  final int flexScheme = controller.schemeIndex - 3;
  // Using a built-in scheme or one of the custom colors in the demo?
  final bool useBuiltIn = controller.schemeIndex > 2 &&
      controller.schemeIndex < AppColor.schemesCustom.length - 1;
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

  if (controller.useToDarkMethod) {
    darkScheme = '  colors: const FlexSchemeColor(\n'
        '    primary: ${scheme.light.primary},\n'
        '    primaryContainer: ${scheme.light.primaryContainer},\n'
        '    secondary: ${scheme.light.secondary},\n'
        '    secondaryContainer: ${scheme.light.secondaryContainer},\n'
        '    tertiary: ${scheme.light.tertiary},\n'
        '    tertiaryContainer: ${scheme.light.tertiaryContainer},\n'
        '    appBarColor: ${scheme.light.appBarColor},\n'
        '    error: ${scheme.light.error},\n'
        '  ).defaultError.toDark(${controller.darkMethodLevel}, true),\n';
  }
  //
  // Code for main theme setup, the other properties 'FlexColorScheme.light' and
  // 'FlexColorScheme.dark' factories direct parameters.
  final String surfaceMode = controller.blendLevel > 0
      ? '  surfaceMode: ${controller.surfaceMode},\n'
      : '';
  final String blendLevel = controller.blendLevel > 0
      ? '  blendLevel: ${controller.blendLevel},\n'
      : '';
  final String usedColors = controller.usedColors != 6
      ? '  usedColors: ${controller.usedColors},\n'
      : '';
  final String lightAppBarStyle =
      controller.lightAppBarStyle != FlexAppBarStyle.primary
          ? '  appBarStyle: ${controller.lightAppBarStyle},\n'
          : '';
  final String darkAppBarStyle =
      controller.darkAppBarStyle != FlexAppBarStyle.material
          ? '  appBarStyle: ${controller.darkAppBarStyle},\n'
          : '';
  final String appBarOpacity = controller.appBarOpacity != 1
      ? '  appBarOpacity: ${controller.appBarOpacity},\n'
      : '';
  final String transparentStatusBar = controller.transparentStatusBar
      ? ''
      : '  transparentStatusBar: ${controller.transparentStatusBar},\n';
  final String appBarElevation = controller.appBarElevation != 0
      ? '  appBarElevation: ${controller.appBarElevation},\n'
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
  final String swapLightColors = controller.swapLightColors
      ? '  swapColors: ${controller.swapLightColors},\n'
      : '';
  final String swapDarkColors = controller.swapDarkColors
      ? '  swapColors: ${controller.swapDarkColors},\n'
      : '';
  final String tooltipsMatchBackground = controller.tooltipsMatchBackground
      ? '  tooltipsMatchBackground: ${controller.tooltipsMatchBackground},\n'
      : '';
  final String useSubThemes = controller.useSubThemes
      ? '  useSubThemes: ${controller.useSubThemes},\n'
      : '';
  final String useM3ErrorColors = controller.useM3ErrorColors
      ? '  useMaterial3ErrorColors: ${controller.useM3ErrorColors},\n'
      : '';
  final String useMaterial3 = controller.useMaterial3
      ? '  useMaterial3: ${controller.useMaterial3},\n'
      : '';
  //
  // Code for FlexSubThemesData
  //
  final String interactionEffects = controller.interactionEffects
      ? ''
      : '    interactionEffects: ${controller.interactionEffects},\n';
  final String blendOnLevelLight = controller.blendOnLevel > 0
      ? '    blendOnLevel: ${controller.blendOnLevel},\n'
      : '';
  final String blendOnLevelDark = controller.blendOnLevelDark > 0
      ? '    blendOnLevel: ${controller.blendOnLevelDark},\n'
      : '';
  final String blendLightOnColors = controller.blendLightOnColors
      ? ''
      : '    blendOnColors: ${controller.blendLightOnColors},\n';
  final String blendDarkOnColors = controller.blendDarkOnColors
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
  final String defRadius = controller.useDefaultRadius
      ? ''
      : '    defaultRadius: ${controller.cornerRadius},\n';
  //
  // Material button sub themes.
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
  final String outlinedButtonSchemeColor = controller
                  .outlinedButtonSchemeColor ==
              SchemeColor.primary ||
          controller.outlinedButtonSchemeColor == null
      ? ''
      : '    outlinedButtonSchemeColor: ${controller.outlinedButtonSchemeColor},\n';
  final String materialButtonSchemeColor = controller
                  .materialButtonSchemeColor ==
              SchemeColor.primary ||
          controller.materialButtonSchemeColor == null
      ? ''
      : '    materialButtonSchemeColor: ${controller.materialButtonSchemeColor},\n';
  final String toggleButtonsSchemeColor = controller.toggleButtonsSchemeColor ==
              SchemeColor.primary ||
          controller.toggleButtonsSchemeColor == null
      ? ''
      : '    toggleButtonsSchemeColor: ${controller.toggleButtonsSchemeColor},\n';
  //
  // Toggleable sub themes.
  final String switchSchemeColor =
      controller.switchSchemeColor == SchemeColor.secondary ||
              controller.switchSchemeColor == null
          ? ''
          : '    switchSchemeColor: ${controller.switchSchemeColor},\n';
  final String checkboxSchemeColor =
      controller.checkboxSchemeColor == SchemeColor.secondary ||
              controller.checkboxSchemeColor == null
          ? ''
          : '    checkboxSchemeColor: ${controller.checkboxSchemeColor},\n';
  final String radioSchemeColor =
      controller.radioSchemeColor == SchemeColor.secondary ||
              controller.radioSchemeColor == null
          ? ''
          : '    radioSchemeColor: ${controller.radioSchemeColor},\n';
  final String unselectedIsColored = controller.unselectedIsColored
      ? '    unselectedToggleIsColored: ${controller.unselectedIsColored},\n'
      : '';
  //
  // Input decorator
  final String inputDecoratorSchemeColor = controller
                  .inputDecoratorSchemeColor ==
              SchemeColor.primary ||
          controller.inputDecoratorSchemeColor == null
      ? ''
      : '    inputDecoratorSchemeColor: ${controller.inputDecoratorSchemeColor},\n';
  final String inputDecoratorIsFilled = controller.inputDecoratorIsFilled
      ? ''
      : '    inputDecoratorIsFilled: ${controller.inputDecoratorIsFilled},\n';
  final String inputDecoratorBorderType = controller.inputDecoratorBorderType ==
          FlexInputBorderType.outline
      ? ''
      : '    inputDecoratorBorderType: ${controller.inputDecoratorBorderType},\n';
  final String inputDecoratorUnfocusedHasBorder = controller
          .inputDecoratorUnfocusedHasBorder
      ? ''
      : '    inputDecoratorUnfocusedHasBorder: ${controller.inputDecoratorUnfocusedHasBorder},\n';
  //
  // Fab and chip
  final String fabUseShape = controller.fabUseShape
      ? ''
      : '    fabUseShape: ${controller.fabUseShape},\n';
  final String fabSchemeColor =
      controller.fabSchemeColor == SchemeColor.secondary ||
              controller.fabSchemeColor == null
          ? ''
          : '    fabSchemeColor: ${controller.fabSchemeColor},\n';
  final String chipSchemeColor =
      controller.chipSchemeColor == SchemeColor.primary ||
              controller.chipSchemeColor == null
          ? ''
          : '    chipSchemeColor: ${controller.chipSchemeColor},\n';
  final String dialogBackgroundSchemeColor = controller
              .dialogBackgroundSchemeColor ==
          SchemeColor.surface
      ? ''
      : '    dialogBackgroundSchemeColor: ${controller.dialogBackgroundSchemeColor},\n';
  final String appBarBackgroundSchemeColor = controller
              .appBarBackgroundSchemeColor ==
          null
      ? ''
      : '    appBarBackgroundSchemeColor: ${controller.appBarBackgroundSchemeColor},\n';
  final String tabBarItemSchemeColor = controller.tabBarItemSchemeColor == null
      ? ''
      : '    tabBarItemSchemeColor: ${controller.tabBarItemSchemeColor},\n';

  final String tabBarIndicatorSchemeColor = controller.tabBarIndicator == null
      ? ''
      : '    tabBarIndicatorSchemeColor: ${controller.tabBarIndicator},\n';
  //
  //
  final String bottomNavigationBarSelectedLabelSchemeColor = controller
              .navBarSelectedSchemeColor ==
          SchemeColor.primary
      ? ''
      : '    bottomNavigationBarSelectedLabelSchemeColor: ${controller.navBarSelectedSchemeColor},\n';
  final String bottomNavigationBarUnselectedLabelSchemeColor = controller
              .navUnselectedSchemeColor ==
          SchemeColor.onSurface
      ? ''
      : '    bottomNavigationBarUnselectedLabelSchemeColor: ${controller.navUnselectedSchemeColor},\n';
  final String bottomNavigationBarMutedUnselectedLabel = controller
          .navBarMuteUnselected
      ? ''
      : '    bottomNavigationBarMutedUnselectedLabel: ${controller.navBarMuteUnselected},\n';
  final String bottomNavigationBarSelectedIconSchemeColor = controller
              .navBarSelectedSchemeColor ==
          SchemeColor.primary
      ? ''
      : '    bottomNavigationBarSelectedIconSchemeColor: ${controller.navBarSelectedSchemeColor},\n';
  final String bottomNavigationBarUnselectedIconSchemeColor = controller
              .navUnselectedSchemeColor ==
          SchemeColor.onSurface
      ? ''
      : '    bottomNavigationBarUnselectedIconSchemeColor: ${controller.navUnselectedSchemeColor},\n';
  final String bottomNavigationBarMutedUnselectedIcon = controller
          .navBarMuteUnselected
      ? ''
      : '    bottomNavigationBarMutedUnselectedIcon: ${controller.navBarMuteUnselected},\n';
  final String bottomNavigationBarBackgroundSchemeColor = controller
              .navBarBackgroundSchemeColor ==
          SchemeColor.background
      ? ''
      : '    bottomNavigationBarBackgroundSchemeColor: ${controller.navBarBackgroundSchemeColor},\n';
  final String bottomNavigationBarOpacity = controller
              .bottomNavigationBarOpacity !=
          1
      ? '    bottomNavigationBarOpacity: ${controller.bottomNavigationBarOpacity},\n'
      : '';
  final String bottomNavigationBarElevation = controller
              .bottomNavigationBarElevation !=
          0
      ? '    bottomNavigationBarElevation: ${controller.bottomNavigationBarElevation},\n'
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
  //
  final String navigationBarSelectedLabelSchemeColor = controller
              .navBarSelectedSchemeColor ==
          SchemeColor.primary
      ? ''
      : '    navigationBarSelectedLabelSchemeColor: ${controller.navBarSelectedSchemeColor},\n';
  final String navigationBarUnselectedLabelSchemeColor = controller
              .navUnselectedSchemeColor ==
          SchemeColor.onSurface
      ? ''
      : '    navigationBarUnselectedLabelSchemeColor: ${controller.navUnselectedSchemeColor},\n';
  final String navigationBarMutedUnselectedLabel = controller
          .navBarMuteUnselected
      ? ''
      : '    navigationBarMutedUnselectedLabel: ${controller.navBarMuteUnselected},\n';
  final String navigationBarSelectedIconSchemeColor = controller
              .navBarSelectedSchemeColor ==
          SchemeColor.primary
      ? ''
      : '    navigationBarSelectedIconSchemeColor: ${controller.navBarSelectedSchemeColor},\n';
  final String navigationBarUnselectedIconSchemeColor = controller
              .navUnselectedSchemeColor ==
          SchemeColor.onSurface
      ? ''
      : '    navigationBarUnselectedIconSchemeColor: ${controller.navUnselectedSchemeColor},\n';
  final String navigationBarMutedUnselectedIcon = controller
          .navBarMuteUnselected
      ? ''
      : '    navigationBarMutedUnselectedIcon: ${controller.navBarMuteUnselected},\n';
  final String navigationBarHighlightSchemeColor = controller.navBarHighlight ==
          SchemeColor.primary
      ? ''
      : '    navigationBarHighlightSchemeColor: ${controller.navBarHighlight},\n';
  final String navigationBarBackgroundSchemeColor = controller
              .navBarBackgroundSchemeColor ==
          SchemeColor.background
      ? ''
      : '    navigationBarBackgroundSchemeColor: ${controller.navBarBackgroundSchemeColor},\n';
  final String navigationBarOpacity = controller.bottomNavigationBarOpacity != 1
      ? '    navigationBarOpacity: ${controller.bottomNavigationBarOpacity},\n'
      : '';
  final String navigationBarLabelBehavior = controller.navBarLabelBehavior !=
          NavigationDestinationLabelBehavior.alwaysShow
      ? '    navigationBarLabelBehavior: ${controller.navBarLabelBehavior},\n'
      : '';
  //
  //
  final String navigationRailSelectedLabelSchemeColor = controller
              .navBarSelectedSchemeColor ==
          SchemeColor.primary
      ? ''
      : '    navigationRailSelectedLabelSchemeColor: ${controller.navBarSelectedSchemeColor},\n';
  final String navigationRailUnselectedLabelSchemeColor = controller
              .navUnselectedSchemeColor ==
          SchemeColor.onSurface
      ? ''
      : '    navigationRailUnselectedLabelSchemeColor: ${controller.navUnselectedSchemeColor},\n';
  final String navigationRailMutedUnselectedLabel = controller
          .navBarMuteUnselected
      ? ''
      : '    navigationRailMutedUnselectedLabel: ${controller.navBarMuteUnselected},\n';
  final String navigationRailSelectedIconSchemeColor = controller
              .navBarSelectedSchemeColor ==
          SchemeColor.primary
      ? ''
      : '    navigationRailSelectedIconSchemeColor: ${controller.navBarSelectedSchemeColor},\n';
  final String navigationRailUnselectedIconSchemeColor = controller
              .navUnselectedSchemeColor ==
          SchemeColor.onSurface
      ? ''
      : '    navigationRailUnselectedIconSchemeColor: ${controller.navUnselectedSchemeColor},\n';
  final String navigationRailMutedUnselectedIcon = controller
          .navBarMuteUnselected
      ? ''
      : '    navigationRailMutedUnselectedIcon: ${controller.navBarMuteUnselected},\n';
  final String navigationRailUseIndicator = controller.useIndicator
      ? ''
      : '    navigationRailUseIndicator: ${controller.useIndicator},\n';
  final String navigationRailIndicatorSchemeColor = controller
              .navBarHighlight ==
          SchemeColor.primary
      ? ''
      : '    navigationRailIndicatorSchemeColor: ${controller.navBarHighlight},\n';
  final String navigationRailBackgroundSchemeColor = controller
              .navBarBackgroundSchemeColor ==
          SchemeColor.background
      ? ''
      : '    navigationRailBackgroundSchemeColor: ${controller.navBarBackgroundSchemeColor},\n';
  final String navigationRailOpacity = controller.bottomNavigationBarOpacity !=
          1
      ? '    navigationRailOpacity: ${controller.bottomNavigationBarOpacity},\n'
      : '';
  final String navigationRailElevation = controller
              .bottomNavigationBarElevation !=
          0
      ? '    navigationRailElevation: ${controller.bottomNavigationBarElevation},\n'
      : '';
  final String navigationRailLabelType =
      controller.navRailLabelType != NavigationRailLabelType.all
          ? '    navigationRailLabelType: ${controller.navRailLabelType},\n'
          : '';
  //
  // Compose the sub themes from above fragments.
  //
  final String lightSubTheme = controller.useSubThemes
      ? '  subThemesData: const FlexSubThemesData(\n'
          '$interactionEffects'
          '$blendOnLevelLight'
          '$blendLightOnColors'
          '$blendLightTextTheme'
          '$useTextTheme'
          '$defRadius'
          //
          '$textButtonSchemeColor'
          '$elevatedButtonSchemeColor'
          '$outlinedButtonSchemeColor'
          '$materialButtonSchemeColor'
          '$toggleButtonsSchemeColor'
          //
          '$switchSchemeColor'
          '$checkboxSchemeColor'
          '$radioSchemeColor'
          '$unselectedIsColored'
          //
          '$inputDecoratorSchemeColor'
          '$inputDecoratorIsFilled'
          '$inputDecoratorBorderType'
          '$inputDecoratorUnfocusedHasBorder'
          //
          '$fabUseShape'
          '$fabSchemeColor'
          '$chipSchemeColor'
          //
          '    popupMenuOpacity: ${AppData.popupMenuOpacity},\n'
          '$dialogBackgroundSchemeColor'
          '$appBarBackgroundSchemeColor'
          '$tabBarItemSchemeColor'
          '$tabBarIndicatorSchemeColor'
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
          '$navigationBarHighlightSchemeColor'
          '$navigationBarBackgroundSchemeColor'
          '$navigationBarOpacity'
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
          '$navigationRailBackgroundSchemeColor'
          '$navigationRailOpacity'
          '$navigationRailElevation'
          '$navigationRailLabelType'
          //
          '  ),\n'
      : '';
  final String darkSubTheme = controller.useSubThemes
      ? '  subThemesData: const FlexSubThemesData(\n'
          '$interactionEffects'
          '$blendOnLevelDark'
          '$blendDarkOnColors'
          '$blendDarkTextTheme'
          '$useTextTheme'
          '$defRadius'
          //
          '$textButtonSchemeColor'
          '$elevatedButtonSchemeColor'
          '$outlinedButtonSchemeColor'
          '$materialButtonSchemeColor'
          '$toggleButtonsSchemeColor'
          //
          '$switchSchemeColor'
          '$checkboxSchemeColor'
          '$radioSchemeColor'
          '$unselectedIsColored'
          //
          '$inputDecoratorSchemeColor'
          '$inputDecoratorIsFilled'
          '$inputDecoratorBorderType'
          '$inputDecoratorUnfocusedHasBorder'
          //
          '$fabUseShape'
          '$fabSchemeColor'
          '$chipSchemeColor'
          //
          '    popupMenuOpacity: ${AppData.popupMenuOpacity},\n'
          '$dialogBackgroundSchemeColor'
          '$appBarBackgroundSchemeColor'
          '$tabBarItemSchemeColor'
          '$tabBarIndicatorSchemeColor'
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
          '$navigationBarHighlightSchemeColor'
          '$navigationBarBackgroundSchemeColor'
          '$navigationBarOpacity'
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
          '$navigationRailBackgroundSchemeColor'
          '$navigationRailOpacity'
          '$navigationRailElevation'
          '$navigationRailLabelType'
          '  ),\n'
      : '';
  //
  // Define code for key color usage and tones.
  final String useSecondary = controller.useSecondary
      ? ''
      : '    useSecondary: ${controller.useSecondary},\n';
  final String useTertiary = controller.useTertiary
      ? ''
      : '    useTertiary: ${controller.useTertiary},\n';
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
  String useKeyColors = controller.useKeyColors
      ? '  keyColors: const FlexKeyColors(\n'
          // '    useKeyColors: ${controller.useKeyColors},\n'
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
  // Make a prettier version of the constructor if that is all we got.
  if (useKeyColors == '  keyColors: const FlexKeyColors(\n  ),\n') {
    useKeyColors = '  keyColors: const FlexKeyColors(),\n';
  }
  String flexTonesLight = '';
  String flexTonesDark = '';
  if (controller.useKeyColors) {
    if (controller.usedFlexToneSetup == 2) {
      flexTonesLight = '  tones: FlexTones.soft(Brightness.light),\n';
      flexTonesDark = '  tones: FlexTones.soft(Brightness.dark),\n';
    }
    if (controller.usedFlexToneSetup == 3) {
      flexTonesLight = '  tones: FlexTones.vivid(Brightness.light),\n';
      flexTonesDark = '  tones: FlexTones.vivid(Brightness.dark),\n';
    }
    if (controller.usedFlexToneSetup == 4) {
      flexTonesLight = '  tones: FlexTones.vividSurfaces(Brightness.light),\n';
      flexTonesDark = '  tones: FlexTones.vividSurfaces(Brightness.dark),\n';
    }
    if (controller.usedFlexToneSetup == 5) {
      flexTonesLight = '  tones: FlexTones.highContrast(Brightness.light),\n';
      flexTonesDark = '  tones: FlexTones.highContrast(Brightness.dark),\n';
    }
  }
  //
  // Compose the final FlexThemeData code string, from above fragments.
  //
  final String code = 'theme: FlexThemeData.light(\n'
      '$lightScheme'
      '$usedColors'
      '$surfaceMode'
      '$blendLevel'
      '$lightAppBarStyle'
      '$appBarOpacity'
      '$transparentStatusBar'
      '$appBarElevation'
      '$tabBarStyle'
      '$lightIsWhite'
      '$swapLightColors'
      '$tooltipsMatchBackground'
      '$useSubThemes'
      '$lightSubTheme'
      '$useKeyColors'
      '$useM3ErrorColors'
      '$flexTonesLight'
      '  visualDensity: FlexColorScheme.comfortablePlatformDensity,\n'
      '$useMaterial3'
      '  // To use the playground font, add GoogleFonts package and uncomment\n'
      '  // fontFamily: GoogleFonts.notoSans().fontFamily,\n'
      '),\n'
      'darkTheme: FlexThemeData.dark(\n'
      '$darkScheme'
      '$usedColors'
      '$surfaceMode'
      '$blendLevel'
      '$darkAppBarStyle'
      '$appBarOpacity'
      '$transparentStatusBar'
      '$appBarElevation'
      '$tabBarStyle'
      '$darkIsTrueBlack'
      '$swapDarkColors'
      '$tooltipsMatchBackground'
      '$useSubThemes'
      '$darkSubTheme'
      '$useKeyColors'
      '$useM3ErrorColors'
      '$flexTonesDark'
      '  visualDensity: FlexColorScheme.comfortablePlatformDensity,\n'
      '$useMaterial3'
      '  // To use the playground font, add GoogleFonts package and uncomment\n'
      '  // fontFamily: GoogleFonts.notoSans().fontFamily,\n'
      '),\n'
      '// If you do not have a themeMode switch, uncomment this line\n'
      '// to let the device system mode control the theme mode:\n'
      '// themeMode: ThemeMode.system,\n';
  return code;
}
