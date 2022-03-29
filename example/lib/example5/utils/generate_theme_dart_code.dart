// ignore_for_file: lines_longer_than_80_chars
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../shared/const/app_color.dart';
import '../../shared/controllers/theme_controller.dart';

/// A function that returns the FlexColorScheme Dart and Flutter setup
/// code for the theme held by ThemeController.
///
/// The properties are in the order they are in the classes.
String generateThemeDartCode(ThemeController controller) {
  // If FlexColorsScheme is not in use, return a default M2 ColorScheme based
  // theme as a starting point suggestion.
  if (!controller.useFlexColorScheme) {
    return '''
  // FlexColorScheme is not in use!
  // Here is a default Material 2 starting point theme setup for you.
  //  
  theme: ThemeData.from(colorScheme: const ColorScheme.light()).copyWith(
    typography: Typography.material2018(platform: defaultTargetPlatform),
  ),
  darkTheme: ThemeData.from(colorScheme: const ColorScheme.dark()).copyWith(
    typography: Typography.material2018(platform: defaultTargetPlatform),
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
  //
  // We avoid adding any code when API default values are being used.
  final String surfaceModeLight = controller.blendLevel > 0 &&
          controller.surfaceModeLight != FlexSurfaceMode.highScaffoldLowSurfaces
      ? '  surfaceMode: ${controller.surfaceModeLight},\n'
      : '';
  final String surfaceModeDark = controller.blendLevel > 0 &&
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
  final String appBarStyleLight =
      controller.appBarStyleLight != FlexAppBarStyle.primary
          ? '  appBarStyle: ${controller.appBarStyleLight},\n'
          : '';
  final String appBarStyleDark =
      controller.appBarStyleDark != FlexAppBarStyle.material
          ? '  appBarStyle: ${controller.appBarStyleDark},\n'
          : '';
  final String appBarOpacityLight = controller.appBarOpacityLight != 1
      ? '  appBarOpacity: ${controller.appBarOpacityLight},\n'
      : '';
  final String appBarOpacityDark = controller.appBarOpacityDark != 1
      ? '  appBarOpacity: ${controller.appBarOpacityDark},\n'
      : '';
  final String transparentStatusBar = controller.transparentStatusBar
      ? ''
      : '  transparentStatusBar: ${controller.transparentStatusBar},\n';
  final String appBarElevationLight = controller.appBarElevationLight != 0
      ? '  appBarElevation: ${controller.appBarElevationLight},\n'
      : '';
  final String appBarElevationDark = controller.appBarElevationDark != 0
      ? '  appBarElevation: ${controller.appBarElevationDark},\n'
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
  final String useM3ErrorColors =
      controller.useM3ErrorColors && !controller.useKeyColors
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
  final String useFlutterDefaults = controller.useFlutterDefaults
      ? '    useFlutterDefaults: ${controller.useFlutterDefaults},\n'
      : '';
  final String defRadius = controller.cornerRadius != null
      ? '    defaultRadius: ${controller.cornerRadius},\n'
      : '';
  //
  // Material button sub themes border radius.
  final String textButtonBorderRadius =
      controller.textButtonBorderRadius != null
          ? '    textButtonRadius: ${controller.textButtonBorderRadius},\n'
          : '';
  final String elevatedButtonBorderRadius = controller
              .elevatedButtonBorderRadius !=
          null
      ? '    elevatedButtonRadius: ${controller.elevatedButtonBorderRadius},\n'
      : '';
  final String outlinedButtonBorderRadius = controller
              .outlinedButtonBorderRadius !=
          null
      ? '    outlinedButtonRadius: ${controller.outlinedButtonBorderRadius},\n'
      : '';
  final String toggleButtonsBorderRadius = controller
              .toggleButtonsBorderRadius !=
          null
      ? '    outlinedButtonRadius: ${controller.toggleButtonsBorderRadius},\n'
      : '';
  //
  // Material button sub themes scheme colors
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
  final String unselectedIsColored = controller.unselectedToggleIsColored
      ? '    unselectedToggleIsColored: ${controller.unselectedToggleIsColored},\n'
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
  final String inputDecoratorUnfocusedBorderIsColored = controller
          .inputDecoratorUnfocusedBorderIsColored
      ? ''
      : '    inputDecoratorUnfocusedBorderIsColored: ${controller.inputDecoratorUnfocusedBorderIsColored},\n';
  //
  // Fab and chip, snack, card, dialog, popup
  final String fabUseShape = controller.fabUseShape
      ? ''
      : '    fabUseShape: ${controller.fabUseShape},\n';
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
  final String cardBorderRadius = controller.cardBorderRadius != null
      ? '    cardRadius: ${controller.cardBorderRadius},\n'
      : '';
  final String popupMenuOpacity = controller.popupMenuOpacity != 1
      ? '    popupMenuOpacity: ${controller.popupMenuOpacity},\n'
      : '';
  final String dialogBackgroundSchemeColor = controller
              .dialogBackgroundSchemeColor !=
          null
      ? '    dialogBackgroundSchemeColor: ${controller.dialogBackgroundSchemeColor},\n'
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
  final String bottomNavigationBarSelectedLabelSchemeColor = controller
              .navBarSelectedSchemeColor !=
          null
      ? '    bottomNavigationBarSelectedLabelSchemeColor: ${controller.navBarSelectedSchemeColor},\n'
      : '';
  final String bottomNavigationBarUnselectedLabelSchemeColor = controller
              .navUnselectedSchemeColor !=
          null
      ? '    bottomNavigationBarUnselectedLabelSchemeColor: ${controller.navUnselectedSchemeColor},\n'
      : '';
  final String bottomNavigationBarMutedUnselectedLabel = controller
          .navBarMuteUnselected
      ? ''
      : '    bottomNavigationBarMutedUnselectedLabel: ${controller.navBarMuteUnselected},\n';
  final String bottomNavigationBarSelectedIconSchemeColor = controller
              .navBarSelectedSchemeColor !=
          null
      ? '    bottomNavigationBarSelectedIconSchemeColor: ${controller.navBarSelectedSchemeColor},\n'
      : '';
  final String bottomNavigationBarUnselectedIconSchemeColor = controller
              .navUnselectedSchemeColor !=
          null
      ? '    bottomNavigationBarUnselectedIconSchemeColor: ${controller.navUnselectedSchemeColor},\n'
      : '';
  final String bottomNavigationBarMutedUnselectedIcon = controller
          .navBarMuteUnselected
      ? ''
      : '    bottomNavigationBarMutedUnselectedIcon: ${controller.navBarMuteUnselected},\n';
  final String bottomNavigationBarBackgroundSchemeColor = controller
              .bottomNavBarBackgroundSchemeColor !=
          null
      ? '    bottomNavigationBarBackgroundSchemeColor: ${controller.bottomNavBarBackgroundSchemeColor},\n'
      : '';
  final String bottomNavigationBarOpacity = controller
                  .bottomNavigationBarOpacity !=
              1 &&
          controller.bottomNavBarBackgroundSchemeColor?.index != null
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
              .navBarSelectedSchemeColor !=
          null
      ? '    navigationBarSelectedLabelSchemeColor: ${controller.navBarSelectedSchemeColor},\n'
      : '';
  final String navigationBarUnselectedLabelSchemeColor = controller
              .navUnselectedSchemeColor !=
          null
      ? '    navigationBarUnselectedLabelSchemeColor: ${controller.navUnselectedSchemeColor},\n'
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
              .navUnselectedSchemeColor !=
          null
      ? '    navigationBarUnselectedIconSchemeColor: ${controller.navUnselectedSchemeColor},\n'
      : '';
  final String navigationBarMutedUnselectedIcon = controller
          .navBarMuteUnselected
      ? ''
      : '    navigationBarMutedUnselectedIcon: ${controller.navBarMuteUnselected},\n';
  final String navigationBarHighlightSchemeColor = controller
              .navBarIndicatorSchemeColor !=
          null
      ? '    navigationBarHighlightSchemeColor: ${controller.navBarIndicatorSchemeColor},\n'
      : '';
  final String navigationBarBackgroundSchemeColor = controller
              .navBarBackgroundSchemeColor !=
          null
      ? '    navigationBarBackgroundSchemeColor: ${controller.navBarBackgroundSchemeColor},\n'
      : '';
  final String navigationBarOpacity = controller.navBarOpacity != 1 &&
          controller.navBarBackgroundSchemeColor?.index != null
      ? '    navigationBarOpacity: ${controller.navBarOpacity},\n'
      : '';
  final String navigationBarLabelBehavior = controller.navBarLabelBehavior !=
          NavigationDestinationLabelBehavior.alwaysShow
      ? '    navigationBarLabelBehavior: ${controller.navBarLabelBehavior},\n'
      : '';
  //
  //
  final String navigationRailSelectedLabelSchemeColor = controller
              .navBarSelectedSchemeColor !=
          null
      ? '    navigationRailSelectedLabelSchemeColor: ${controller.navBarSelectedSchemeColor},\n'
      : '';
  final String navigationRailUnselectedLabelSchemeColor = controller
              .navUnselectedSchemeColor !=
          null
      ? '    navigationRailUnselectedLabelSchemeColor: ${controller.navUnselectedSchemeColor},\n'
      : '';
  final String navigationRailMutedUnselectedLabel = controller
          .navBarMuteUnselected
      ? ''
      : '    navigationRailMutedUnselectedLabel: ${controller.navBarMuteUnselected},\n';
  final String navigationRailSelectedIconSchemeColor = controller
              .navBarSelectedSchemeColor !=
          null
      ? '    navigationRailSelectedIconSchemeColor: ${controller.navBarSelectedSchemeColor},\n'
      : '';
  final String navigationRailUnselectedIconSchemeColor = controller
              .navUnselectedSchemeColor !=
          null
      ? '    navigationRailUnselectedIconSchemeColor: ${controller.navUnselectedSchemeColor},\n'
      : '';
  final String navigationRailMutedUnselectedIcon = controller
          .navBarMuteUnselected
      ? ''
      : '    navigationRailMutedUnselectedIcon: ${controller.navBarMuteUnselected},\n';
  final String navigationRailUseIndicator = controller.navRailUseIndicator
      ? ''
      : '    navigationRailUseIndicator: ${controller.navRailUseIndicator},\n';
  final String navigationRailIndicatorSchemeColor = controller
              .navRailIndicatorSchemeColor !=
          null
      ? '    navigationRailIndicatorSchemeColor: ${controller.navRailIndicatorSchemeColor},\n'
      : '';
  final String navigationRailBackgroundSchemeColor = controller
              .navRailBackgroundSchemeColor !=
          null
      ? '    navigationRailBackgroundSchemeColor: ${controller.navRailBackgroundSchemeColor},\n'
      : '';
  final String navigationRailOpacity = controller.navRailOpacity != 1 &&
          controller.navRailBackgroundSchemeColor?.index != null
      ? '    navigationRailOpacity: ${controller.navRailOpacity},\n'
      : '';
  final String navigationRailElevation = controller.navigationRailElevation != 0
      ? '    navigationRailElevation: ${controller.navigationRailElevation},\n'
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
          '$useFlutterDefaults'
          '$interactionEffects'
          '$blendOnLevelLight'
          '$blendLightOnColors'
          '$blendLightTextTheme'
          '$useTextTheme'
          '$defRadius'
          //
          '$textButtonBorderRadius'
          '$elevatedButtonBorderRadius'
          '$outlinedButtonBorderRadius'
          '$toggleButtonsBorderRadius'
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
          '$inputDecoratorUnfocusedBorderIsColored'
          //
          '$fabUseShape'
          '$fabSchemeColor'
          '$snackSchemeColor'
          '$chipSchemeColor'
          '$cardBorderRadius'

          //
          '$popupMenuOpacity'
          '$dialogBackgroundSchemeColor'
          '$appBarBackgroundSchemeColorLight'
          '$tabBarItemSchemeColorLight'
          '$tabBarIndicatorSchemeColorLight'
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
          '$useFlutterDefaults'
          '$interactionEffects'
          '$blendOnLevelDark'
          '$blendDarkOnColors'
          '$blendDarkTextTheme'
          '$useTextTheme'
          '$defRadius'
          //
          '$textButtonBorderRadius'
          '$elevatedButtonBorderRadius'
          '$outlinedButtonBorderRadius'
          '$toggleButtonsBorderRadius'
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
          '$inputDecoratorUnfocusedBorderIsColored'
          //
          '$fabUseShape'
          '$fabSchemeColor'
          '$snackSchemeColor'
          '$chipSchemeColor'
          '$cardBorderRadius'
          //
          '$popupMenuOpacity'
          '$dialogBackgroundSchemeColor'
          '$appBarBackgroundSchemeColorDark'
          '$tabBarItemSchemeColorDark'
          '$tabBarIndicatorSchemeColorDark'
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
  // Compose the final FlexThemeData code string, from all above fragments.
  //
  final String code = 'theme: FlexThemeData.light(\n'
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
      '$tooltipsMatchBackground'
      '$lightSubTheme'
      '$useKeyColorsLight'
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
      '$surfaceModeDark'
      '$blendLevelDark'
      '$appBarStyleDark'
      '$appBarOpacityDark'
      '$transparentStatusBar'
      '$appBarElevationDark'
      '$tabBarStyle'
      '$darkIsTrueBlack'
      '$swapDarkColors'
      '$tooltipsMatchBackground'
      '$darkSubTheme'
      '$useKeyColorsDark'
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
