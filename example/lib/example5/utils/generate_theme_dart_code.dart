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
          '    appBarColor: ${scheme.dark.appBarColor},\n'
          '    error: ${scheme.dark.error},\n'
          '  ),\n';

  if (controller.useToDarkMethod) {
    darkScheme = '  colors: const FlexSchemeColor(\n'
        '    primary: ${scheme.light.primary},\n'
        '    primaryContainer: ${scheme.light.primaryContainer},\n'
        '    secondary: ${scheme.light.secondary},\n'
        '    secondaryContainer: ${scheme.light.secondaryContainer},\n'
        '    appBarColor: ${scheme.light.appBarColor},\n'
        '    error: ${scheme.light.error},\n'
        '  ).defaultError.toDark(${controller.darkMethodLevel}),\n';
  }
  final String defRadius = controller.useDefaultRadius
      ? ''
      : '    defaultRadius: ${controller.cornerRadius},\n';
  final String navBarColorCode = controller.navBarScheme == null
      ? ''
      : '    bottomNavigationBarSchemeColor: ${controller.navBarScheme},\n'
          '    navigationBarIconSchemeColor: ${controller.navBarScheme},\n'
          '    navigationBarTextSchemeColor: ${controller.navBarScheme},\n';
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
  final String lightSubThemeCode = controller.useSubThemes
      ? '  subThemesData: const FlexSubThemesData(\n'
          '    useTextTheme: ${controller.useTextTheme},\n'
          '$defRadius'
          '    fabUseShape: ${controller.fabUseShape},\n'
          '    interactionEffects: ${controller.interactionEffects},\n'
          '$tabBarIndicatorCode'
          '$chipSchemeColorCode'
          '    bottomNavigationBarElevation: ${controller.bottomNavigationBarElevation},\n'
          '    bottomNavigationBarOpacity: ${controller.bottomNavigationBarOpacity},\n'
          '    navigationBarOpacity: ${controller.bottomNavigationBarOpacity},\n'
          '$navBarColorCode'
          '$navBarHighLightCode'
          '    navigationBarMutedUnselectedText: ${controller.navBarMuteUnselected},\n'
          '    navigationBarMutedUnselectedIcon: ${controller.navBarMuteUnselected},\n'
          '    inputDecoratorIsFilled: ${controller.inputDecoratorIsFilled},\n'
          '    inputDecoratorBorderType: ${controller.inputDecoratorBorderType},\n'
          '    inputDecoratorUnfocusedHasBorder: ${controller.inputDecoratorUnfocusedHasBorder},\n'
          '$inputDecoratorSchemeColorCode'
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
          '    interactionEffects: ${controller.interactionEffects},\n'
          '$tabBarIndicatorCode'
          '$chipSchemeColorCode'
          '    bottomNavigationBarElevation: ${controller.bottomNavigationBarElevation},\n'
          '    bottomNavigationBarOpacity: ${controller.bottomNavigationBarOpacity},\n'
          '    navigationBarOpacity: ${controller.bottomNavigationBarOpacity},\n'
          '$navBarColorCode'
          '$navBarHighLightCode'
          '    navigationBarMutedUnselectedText: ${controller.navBarMuteUnselected},\n'
          '    navigationBarMutedUnselectedIcon: ${controller.navBarMuteUnselected},\n'
          '    inputDecoratorIsFilled: ${controller.inputDecoratorIsFilled},\n'
          '    inputDecoratorBorderType: ${controller.inputDecoratorBorderType},\n'
          '    inputDecoratorUnfocusedHasBorder: ${controller.inputDecoratorUnfocusedHasBorder},\n'
          '$inputDecoratorSchemeColorCode'
          '    blendOnColors: ${controller.blendDarkOnColors},\n'
          '    blendTextTheme: ${controller.blendDarkTextTheme},\n'
          '    popupMenuOpacity: ${AppData.popupMenuOpacity},\n'
          '  ),\n'
      : '';
  final String code = 'theme: FlexThemeData.light(\n'
      '$lightScheme'
      '  surfaceMode: ${controller.surfaceMode},\n'
      '  blendLevel: ${controller.blendLevel},\n'
      '  appBarStyle: ${controller.lightAppBarStyle},\n'
      '  appBarOpacity: ${controller.appBarOpacity},\n'
      '  appBarElevation: ${controller.appBarElevation},\n'
      '  transparentStatusBar: ${controller.transparentStatusBar},\n'
      '  tabBarStyle: ${controller.tabBarStyle},\n'
      '  tooltipsMatchBackground: ${controller.tooltipsMatchBackground},\n'
      '  swapColors: ${controller.swapLightColors},\n'
      '  lightIsWhite: ${controller.lightIsWhite},\n'
      '  useSubThemes: ${controller.useSubThemes},\n'
      '  visualDensity: FlexColorScheme.comfortablePlatformDensity,\n'
      '  // To use playground font, add GoogleFonts package and uncomment:\n'
      '  // fontFamily: GoogleFonts.notoSans().fontFamily,\n'
      '$lightSubThemeCode'
      '),\n'
      'darkTheme: FlexThemeData.dark(\n'
      '$darkScheme'
      '  surfaceMode: ${controller.surfaceMode},\n'
      '  blendLevel: ${controller.blendLevel},\n'
      '  appBarStyle: ${controller.darkAppBarStyle},\n'
      '  appBarOpacity: ${controller.appBarOpacity},\n'
      '  appBarElevation: ${controller.appBarElevation},\n'
      '  transparentStatusBar: ${controller.transparentStatusBar},\n'
      '  tabBarStyle: ${controller.tabBarStyle},\n'
      '  tooltipsMatchBackground: ${controller.tooltipsMatchBackground},\n'
      '  swapColors: ${controller.swapDarkColors},\n'
      '  darkIsTrueBlack: ${controller.darkIsTrueBlack},\n'
      '  useSubThemes: ${controller.useSubThemes},\n'
      '  visualDensity: FlexColorScheme.comfortablePlatformDensity,\n'
      '  // To use playground font, add GoogleFonts package and uncomment:\n'
      '  // fontFamily: GoogleFonts.notoSans().fontFamily,\n'
      '$darkSubThemeCode'
      '),\n'
      '// If you do not have a themeMode switch, uncomment this line\n'
      '// to let the device system mode control the theme mode:\n'
      '// themeMode: ThemeMode.system,\n';
  return code;
}
