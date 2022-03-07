// ignore_for_file: lines_longer_than_80_chars
import 'package:flex_color_scheme/flex_color_scheme.dart';

import '../../shared/const/app_color.dart';
import '../../shared/const/app_data.dart';
import '../../shared/controllers/theme_controller.dart';

// A function that returns the FlexColorScheme Dart and Flutter setup
// code for the theme held by ThemeController.
String generateThemeDartCode(ThemeController controller) {
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
  final String defRadius = controller.useDefaultRadius
      ? ''
      : '    defaultRadius: ${controller.cornerRadius},\n';
  final String navBarColorCode = controller.navBarSelectedSchemeColor == null
      ? ''
      : '    bottomNavigationBarSchemeColor: ${controller.navBarSelectedSchemeColor},\n'
          '    navigationBarIconSchemeColor: ${controller.navBarSelectedSchemeColor},\n'
          '    navigationBarTextSchemeColor: ${controller.navBarSelectedSchemeColor},\n';
  final String navBarBackgroundSchemeColorCode = controller
              .navBarBackgroundSchemeColor ==
          null
      ? ''
      : '    bottomNavigationBarBackgroundSchemeColor: ${controller.navBarBackgroundSchemeColor},\n'
          '    navigationBarBackgroundSchemeColor: ${controller.navBarBackgroundSchemeColor},\n';
  final String navBarHighLightCode = controller.navBarHighlight == null
      ? ''
      : '    navigationBarHighlightSchemeColor: ${controller.navBarHighlight},\n';
  final String tabBarIndicatorCode = controller.tabBarIndicator == null
      ? ''
      : '    tabBarIndicatorSchemeColor: ${controller.tabBarIndicator},\n';
  final String chipSchemeColorCode = controller.chipSchemeColor == null
      ? ''
      : '    chipSchemeColor: ${controller.chipSchemeColor},\n';
  final String inputDecoratorSchemeColorCode = controller
              .inputDecoratorSchemeColor ==
          null
      ? ''
      : '    inputDecoratorSchemeColor: ${controller.inputDecoratorSchemeColor},\n';
  final String textButtonSchemeColorCode =
      controller.textButtonSchemeColor == null
          ? ''
          : '    textButtonSchemeColor: ${controller.textButtonSchemeColor},\n';
  final String elevatedButtonSchemeColorCode = controller
              .elevatedButtonSchemeColor ==
          null
      ? ''
      : '    elevatedButtonSchemeColor: ${controller.elevatedButtonSchemeColor},\n';
  final String outlinedButtonSchemeColorCode = controller
              .outlinedButtonSchemeColor ==
          null
      ? ''
      : '    outlinedButtonSchemeColor: ${controller.outlinedButtonSchemeColor},\n';
  final String materialButtonSchemeColorCode = controller
              .materialButtonSchemeColor ==
          null
      ? ''
      : '    materialButtonSchemeColor: ${controller.materialButtonSchemeColor},\n';
  final String toggleButtonsSchemeColorCode = controller
              .toggleButtonsSchemeColor ==
          null
      ? ''
      : '    toggleButtonsSchemeColor: ${controller.toggleButtonsSchemeColor},\n';
  final String switchSchemeColorCode = controller.switchSchemeColor == null
      ? ''
      : '    switchSchemeColor: ${controller.switchSchemeColor},\n';
  final String checkboxSchemeColorCode = controller.checkboxSchemeColor == null
      ? ''
      : '    checkboxSchemeColor: ${controller.checkboxSchemeColor},\n';
  final String radioSchemeColorCode = controller.radioSchemeColor == null
      ? ''
      : '    radioSchemeColor: ${controller.radioSchemeColor},\n';
  final String dialogBackgroundSchemeColorCode = controller
              .dialogBackgroundSchemeColor ==
          null
      ? ''
      : '    dialogBackgroundSchemeColor: ${controller.dialogBackgroundSchemeColor},\n';
  final String tabBarItemSchemeColorCode =
      controller.tabBarItemSchemeColor == null
          ? ''
          : '    tabBarItemSchemeColor: ${controller.tabBarItemSchemeColor},\n';
  final String appBarBackgroundSchemeColorCode = controller
              .appBarBackgroundSchemeColor ==
          null
      ? ''
      : '    appBarBackgroundSchemeColor: ${controller.appBarBackgroundSchemeColor},\n';

  final String fabSchemeColorCode = controller.fabSchemeColor == null
      ? ''
      : '    fabSchemeColor: ${controller.fabSchemeColor},\n';

  final String lightSubThemeCode = controller.useSubThemes
      ? '  subThemesData: const FlexSubThemesData(\n'
          '    useTextTheme: ${controller.useTextTheme},\n'
          '$defRadius'
          '    fabUseShape: ${controller.fabUseShape},\n'
          '$fabSchemeColorCode'
          '    interactionEffects: ${controller.interactionEffects},\n'
          '    unselectedToggleIsColored: ${controller.unselectedIsColored},\n'
          '$tabBarIndicatorCode'
          '$chipSchemeColorCode'
          '$textButtonSchemeColorCode'
          '$elevatedButtonSchemeColorCode'
          '$outlinedButtonSchemeColorCode'
          '$materialButtonSchemeColorCode'
          '$toggleButtonsSchemeColorCode'
          '$switchSchemeColorCode'
          '$checkboxSchemeColorCode'
          '$radioSchemeColorCode'
          '$dialogBackgroundSchemeColorCode'
          '$tabBarItemSchemeColorCode'
          '$appBarBackgroundSchemeColorCode'
          '    bottomNavigationBarElevation: ${controller.bottomNavigationBarElevation},\n'
          '    bottomNavigationBarOpacity: ${controller.bottomNavigationBarOpacity},\n'
          '    navigationBarOpacity: ${controller.bottomNavigationBarOpacity},\n'
          '$navBarColorCode'
          '$navBarBackgroundSchemeColorCode'
          '$navBarHighLightCode'
          '    navigationBarMutedUnselectedText: ${controller.navBarMuteUnselected},\n'
          '    navigationBarMutedUnselectedIcon: ${controller.navBarMuteUnselected},\n'
          '    inputDecoratorIsFilled: ${controller.inputDecoratorIsFilled},\n'
          '    inputDecoratorBorderType: ${controller.inputDecoratorBorderType},\n'
          '    inputDecoratorUnfocusedHasBorder: ${controller.inputDecoratorUnfocusedHasBorder},\n'
          '$inputDecoratorSchemeColorCode'
          '    blendOnLevel: ${controller.blendOnLevel},\n'
          '    blendOnColors: ${controller.blendLightOnColors},\n'
          '    blendTextTheme: ${controller.blendLightTextTheme},\n'
          '    popupMenuOpacity: ${AppData.popupMenuOpacity},\n'
          '  ),\n'
      : '';
  final String darkSubThemeCode = controller.useSubThemes
      ? '  subThemesData: const FlexSubThemesData(\n'
          '    useTextTheme: ${controller.useTextTheme},\n'
          '$defRadius'
          '    fabUseShape: ${controller.fabUseShape},\n'
          '$fabSchemeColorCode'
          '    interactionEffects: ${controller.interactionEffects},\n'
          '    unselectedToggleIsColored: ${controller.unselectedIsColored},\n'
          '$tabBarIndicatorCode'
          '$chipSchemeColorCode'
          '$textButtonSchemeColorCode'
          '$elevatedButtonSchemeColorCode'
          '$outlinedButtonSchemeColorCode'
          '$materialButtonSchemeColorCode'
          '$toggleButtonsSchemeColorCode'
          '$switchSchemeColorCode'
          '$checkboxSchemeColorCode'
          '$radioSchemeColorCode'
          '$dialogBackgroundSchemeColorCode'
          '$tabBarItemSchemeColorCode'
          '$appBarBackgroundSchemeColorCode'
          '    bottomNavigationBarElevation: ${controller.bottomNavigationBarElevation},\n'
          '    bottomNavigationBarOpacity: ${controller.bottomNavigationBarOpacity},\n'
          '    navigationBarOpacity: ${controller.bottomNavigationBarOpacity},\n'
          '$navBarColorCode'
          '$navBarBackgroundSchemeColorCode'
          '$navBarHighLightCode'
          '    navigationBarMutedUnselectedText: ${controller.navBarMuteUnselected},\n'
          '    navigationBarMutedUnselectedIcon: ${controller.navBarMuteUnselected},\n'
          '    inputDecoratorIsFilled: ${controller.inputDecoratorIsFilled},\n'
          '    inputDecoratorBorderType: ${controller.inputDecoratorBorderType},\n'
          '    inputDecoratorUnfocusedHasBorder: ${controller.inputDecoratorUnfocusedHasBorder},\n'
          '$inputDecoratorSchemeColorCode'
          '    blendOnLevel: ${controller.blendOnLevelDark},\n'
          '    blendOnColors: ${controller.blendDarkOnColors},\n'
          '    blendTextTheme: ${controller.blendDarkTextTheme},\n'
          '    popupMenuOpacity: ${AppData.popupMenuOpacity},\n'
          '  ),\n'
      : '';
  final String useKeyColors = controller.useKeyColors
      ? '  keyColors: const FlexKeyColors(\n'
          '    useKeyColors: ${controller.useKeyColors},\n'
          '    useSecondary: ${controller.useSecondary},\n'
          '    useTertiary: ${controller.useTertiary},\n'
          '    keepPrimary: ${controller.keepPrimary},\n'
          '    keepSecondary: ${controller.keepSecondary},\n'
          '    keepTertiary: ${controller.keepTertiary},\n'
          '    keepPrimaryContainer: ${controller.keepPrimaryContainer},\n'
          '    keepSecondaryContainer: ${controller.keepSecondaryContainer},\n'
          '    keepTertiaryContainer: ${controller.keepTertiaryContainer},\n'
          '  ),\n'
      : '';
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
      flexTonesLight = '  tones: FlexTones.highContrast(Brightness.light),\n';
      flexTonesDark = '  tones: FlexTones.highContrast(Brightness.dark),\n';
    }
  }
  final String code = 'theme: FlexThemeData.light(\n'
      '$lightScheme'
      '  surfaceMode: ${controller.surfaceMode},\n'
      '  blendLevel: ${controller.blendLevel},\n'
      '  usedColors: ${controller.usedColors},\n'
      '  appBarStyle: ${controller.lightAppBarStyle},\n'
      '  appBarOpacity: ${controller.appBarOpacity},\n'
      '  appBarElevation: ${controller.appBarElevation},\n'
      '  transparentStatusBar: ${controller.transparentStatusBar},\n'
      '  tabBarStyle: ${controller.tabBarStyle},\n'
      '  tooltipsMatchBackground: ${controller.tooltipsMatchBackground},\n'
      '  swapColors: ${controller.swapLightColors},\n'
      '  lightIsWhite: ${controller.lightIsWhite},\n'
      '  visualDensity: FlexColorScheme.comfortablePlatformDensity,\n'
      '  useMaterial3: ${controller.useMaterial3},\n'
      '$useKeyColors'
      '$flexTonesLight'
      '  useSubThemes: ${controller.useSubThemes},\n'
      '$lightSubThemeCode'
      '  // To use the playground font, add GoogleFonts package and uncomment:\n'
      '  // fontFamily: GoogleFonts.notoSans().fontFamily,\n'
      '),\n'
      'darkTheme: FlexThemeData.dark(\n'
      '$darkScheme'
      '  surfaceMode: ${controller.surfaceMode},\n'
      '  blendLevel: ${controller.blendLevelDark},\n'
      '  usedColors: ${controller.usedColors},\n'
      '  appBarStyle: ${controller.darkAppBarStyle},\n'
      '  appBarOpacity: ${controller.appBarOpacity},\n'
      '  appBarElevation: ${controller.appBarElevation},\n'
      '  transparentStatusBar: ${controller.transparentStatusBar},\n'
      '  tabBarStyle: ${controller.tabBarStyle},\n'
      '  tooltipsMatchBackground: ${controller.tooltipsMatchBackground},\n'
      '  swapColors: ${controller.swapDarkColors},\n'
      '  darkIsTrueBlack: ${controller.darkIsTrueBlack},\n'
      '  visualDensity: FlexColorScheme.comfortablePlatformDensity,\n'
      '  useMaterial3: ${controller.useMaterial3},\n'
      '$useKeyColors'
      '$flexTonesDark'
      '  useSubThemes: ${controller.useSubThemes},\n'
      '$darkSubThemeCode'
      '  // To use the playground font, add GoogleFonts package and uncomment:\n'
      '  // fontFamily: GoogleFonts.notoSans().fontFamily,\n'
      '),\n'
      '// If you do not have a themeMode switch, uncomment this line\n'
      '// to let the device system mode control the theme mode:\n'
      '// themeMode: ThemeMode.system,\n';
  return code;
}
