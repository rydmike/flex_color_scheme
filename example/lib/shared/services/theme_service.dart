import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

/// Abstract interface for the ThemeService used to read and save theme
/// properties.
///
/// Also holds the key values used to persist the data and the default values
/// for each property.
abstract class ThemeService {
  /// ThemeService implementations may override this method to perform needed
  /// initialization and setup work.
  Future<void> init();

  /// Key used to read and save the themeMode value.
  static const String keyThemeMode = 'themeMode';

  /// Default value for the themeMode, also used to reset settings.
  static const ThemeMode defaultThemeMode = ThemeMode.system;

  /// Loads the ThemeMode in examples 2, 3, 4 and 5.
  Future<ThemeMode> themeMode();

  /// Persists the ThemeMode in examples 2, 3, 4 and 5.
  Future<void> saveThemeMode(ThemeMode value);

  /// Key used to read and save the useSubThemes value.
  static const String keyUseSubThemes = 'useSubThemes';

  /// Default value for the useSubThemes, also used to reset settings.
  static const bool defaultUseSubThemes = true;

  /// Loads the use sub themes setting in examples 2, 3, 4 and 5.
  Future<bool> useSubThemes();

  /// Persists the use sub themes setting in examples 2, 3, 4 and 5.
  Future<void> saveUseSubThemes(bool value);

  /// Key used to read and save the useTextTheme value.
  static const String keyUseTextTheme = 'useTextTheme';

  /// Default value for the useSubThemes, also used to reset settings.
  static const bool defaultUseTextTheme = true;

  /// Loads the useTextTheme setting in example 5.
  Future<bool> useTextTheme();

  /// Persists the useTextTheme setting in example 5.
  Future<void> saveUseTextTheme(bool value);

  /// Key used to read and save the usedScheme value.
  static const String keyUsedScheme = 'usedScheme';

  /// Default value for the usedScheme, also used to reset settings.
  static const FlexScheme defaultUsedScheme = FlexScheme.hippieBlue;

  /// Loads the used scheme setting, in example 3.
  Future<FlexScheme> usedScheme();

  /// Persists the used scheme setting, in example 3.
  Future<void> saveUsedScheme(FlexScheme value);

  /// Key used to read and save the schemeIndex value.
  static const String keySchemeIndex = 'schemeIndex';

  /// Default value for the schemeIndex, also used to reset settings.
  /// Defaults to 35, in examples 4 & 5 where this is used it will make
  /// the default theme based on the [FlexColor.blueWhale] color scheme.
  static const int defaultSchemeIndex = 35;

  /// Loads used scheme index setting, in examples 4 and 5.
  Future<int> schemeIndex();

  /// Persists the used scheme setting, in examples 4 and 5.
  Future<void> saveSchemeIndex(int value);

  /// Key used to read and save the interactionEffects value.
  static const String keyInteractionEffects = 'interactionEffects';

  /// Default value for the interactionEffects, also used to reset settings.
  static const bool defaultInteractionEffects = true;

  /// Loads used themed effects setting in example 5.
  Future<bool> interactionEffects();

  /// Persists used themed effects setting in example 5.
  Future<void> saveInteractionEffects(bool value);

  /// Key used to read and save the useDefaultRadius value.
  static const String keyUseDefaultRadius = 'useDefaultRadius';

  /// Default value for the useDefaultRadius, also used to reset settings.
  static const bool defaultUseDefaultRadius = true;

  /// Loads used useDefaultRadius setting in example 5.
  Future<bool> useDefaultRadius();

  /// Persists the useDefaultRadius setting in example 5.
  Future<void> saveUseDefaultRadius(bool value);

  /// Key used to read and save the cornerRadius value.
  static const String keyCornerRadius = 'cornerRadius';

  /// Default value for the cornerRadius, also used to reset settings.
  static const double defaultCornerRadius = 16;

  /// Loads used corner radius setting in example 5.
  Future<double> cornerRadius();

  /// Persists the used corner radius setting in example 5.
  Future<void> saveCornerRadius(double value);

  /// Key used to read and save the inputDecoratorIsFilled value.
  static const String keyInputDecoratorIsFilled = 'inputDecoratorIsFilled';

  /// Default value for the inputDecoratorIsFilled, also used to reset settings.
  static const bool defaultInputDecoratorIsFilled = true;

  /// Loads used inputDecoratorIsFilled setting in example 5.
  Future<bool> inputDecoratorIsFilled();

  /// Persists used inputDecoratorIsFilled setting in example 5.
  Future<void> saveInputDecoratorIsFilled(bool value);

  /// Key used to read and save the inputDecoratorBorderType value.
  static const String keyInputDecoratorBorderType = 'inputDecoratorBorderType';

  /// Default value for the inputDecoratorBorderType, also to reset settings.
  static const FlexInputBorderType defaultInputDecoratorBorderType =
      FlexInputBorderType.outline;

  /// Loads used inputDecoratorBorderType setting in example 5.
  Future<FlexInputBorderType> inputDecoratorBorderType();

  /// Persists used inputDecoratorBorderType setting in example 5.
  Future<void> saveInputDecoratorBorderType(FlexInputBorderType value);

  /// Key used to read and save the inputDecoratorUnfocusedHasBorder value.
  static const String keyInputDecoratorUnfocusedHasBorder =
      'inputDecoratorUnfocusedHasBorder';

  /// Default value for the inputDecoratorUnfocusedHasBorder, reset settings.
  static const bool defaultInputDecoratorUnfocusedHasBorder = true;

  /// Loads used inputDecoratorUnfocusedHasBorder setting in example 5.
  Future<bool> inputDecoratorUnfocusedHasBorder();

  /// Persists used inputDecoratorUnfocusedHasBorder setting in example 5.
  Future<void> saveInputDecoratorUnfocusedHasBorder(bool value);

  /// Key used to read and save the inputDecoratorSchemeColor value.
  static const String keyInputDecoratorSchemeColor =
      'inputDecoratorSchemeColor';

  /// Default value for the inputDecoratorSchemeColor, reset settings.
  ///
  /// We use NULL as default, on nullable settings.
  static const SchemeColor? defaultInputDecoratorSchemeColor = null;

  /// Loads used inputDecoratorSchemeColor setting in example 5.
  Future<SchemeColor?> inputDecoratorSchemeColor();

  /// Persists used inputDecoratorSchemeColor setting in example 5.
  Future<void> saveInputDecoratorSchemeColor(SchemeColor? value);

  /// Key used to read and save the chipSchemeColor value.
  static const String keyChipSchemeColor = 'chipSchemeColor';

  /// Default value for the chipSchemeColor, also used to reset settings.
  ///
  /// We use NULL as default, on nullable settings.
  static const SchemeColor? defaultChipSchemeColor = null;

  /// Loads used chipSchemeColor setting in example 5.
  Future<SchemeColor?> chipSchemeColor();

  /// Persists used chipSchemeColor setting in example 5.
  Future<void> saveChipSchemeColor(SchemeColor? value);

  /// Key used to read and save the surfaceMode value.
  static const String keySurfaceMode = 'surfaceMode';

  /// Default value for the surfaceMode, also used to reset settings.
  static const FlexSurfaceMode defaultSurfaceMode =
      FlexSurfaceMode.highScaffoldLowSurface;

  /// Loads used surface mode setting in example 5.
  Future<FlexSurfaceMode> surfaceMode();

  /// Persists the used surface mode setting in example 5.
  Future<void> saveSurfaceMode(FlexSurfaceMode value);

  /// Key used to read and save the blendLevel value.
  static const String keyBlendLevel = 'blendLevel';

  /// Default value for the blendLevel, also used to reset settings.
  ///
  /// Defaults to 18.
  static const int defaultBlendLevel = 18;

  /// Loads used surface blend level setting in example 5.
  Future<int> blendLevel();

  /// Persists the used surface blend level setting in example 5.
  Future<void> saveBlendLevel(int value);

  /// Key used to read and save the blendLevelDark value.
  static const String keyBlendLevelDark = 'blendLevelDark';

  /// Default value for the blendLevelDark, also used to reset settings.
  ///
  /// Defaults to 18.
  static const int defaultBlendLevelDark = 18;

  /// Loads used surface blend level dark setting in example 5.
  Future<int> blendLevelDark();

  /// Persists the used surface blend level dark setting in example 5.
  Future<void> saveBlendLevelDark(int value);

  /// Key used to read and save the onBlendLevel value.
  static const String keyOnBlendLevel = 'blendOnLevel';

  /// Default value for the onBlendLevel, also used to reset settings.
  ///
  /// Defaults to 40.
  static const int defaultBlendOnLevel = 40;

  /// Loads used blendOnLevel setting in example 5.
  Future<int> blendOnLevel();

  /// Persists the used surface on blend level setting in example 5.
  Future<void> saveBlendOnLevel(int value);

  /// Key used to read and save the blendOnLevelDark value.
  static const String keyBlendOnLevelDark = 'blendOnLevelDark';

  /// Default value for the blendOnLevelDark, also used to reset settings.
  ///
  /// Defaults to 30.
  static const int defaultBlendOnLevelDark = 30;

  /// Loads used blendOnLevelDark setting in example 5.
  Future<int> blendOnLevelDark();

  /// Persists the used saveBlendOnLevelDark setting in example 5.
  Future<void> saveBlendOnLevelDark(int value);

  /// Key used to read and save the usedColors value.
  static const String keyUsedColors = 'usedColors';

  /// Default value for the usedColorsLevel, also used to reset settings.
  ///
  /// Defaults to 6.
  static const int defaultUsedColors = 6;

  /// Loads used surface usedColors level setting in example 5.
  Future<int> usedColors();

  /// Persists the used surface usedColors level setting in example 5.
  Future<void> saveUsedColors(int value);

  /// Key used to read and save the lightAppBarStyle value.
  static const String keyLightAppBarStyle = 'lightAppBarStyle';

  /// Default value for the lightAppBarStyle, also used to reset settings.
  static const FlexAppBarStyle defaultLightAppBarStyle =
      FlexAppBarStyle.primary;

  /// Loads used app bar style for light theme setting in example 5.
  Future<FlexAppBarStyle> lightAppBarStyle();

  /// Persists the used app bar style for light theme setting in example 5.
  Future<void> saveLightAppBarStyle(FlexAppBarStyle value);

  /// Key used to read and save the darkAppBarStyle value.
  static const String keyDarkAppBarStyle = 'darkAppBarStyle';

  /// Default value for the darkAppBarStyle, also used to reset settings.
  static const FlexAppBarStyle defaultDarkAppBarStyle =
      FlexAppBarStyle.background;

  /// Loads used app bar style for dark theme setting in example 5.
  Future<FlexAppBarStyle> darkAppBarStyle();

  /// Persists the used app bar style for dark theme setting in example 5.
  Future<void> saveDarkAppBarStyle(FlexAppBarStyle value);

  /// Key used to read and save the appBarOpacity value.
  static const String keyAppBarOpacity = 'appBarOpacity';

  /// Default value for the appBarOpacity, also used to reset settings.
  static const double defaultAppBarOpacity = 0.95;

  /// Loads used app bar opacity setting in example 5.
  Future<double> appBarOpacity();

  /// Persists the used app bar opacity setting in example 5.
  Future<void> saveAppBarOpacity(double value);

  /// Key used to read and save the appBarElevation value.
  static const String keyAppBarElevation = 'appBarElevation';

  /// Default value for the appBarElevation, also used to reset settings.
  static const double defaultAppBarElevation = 0;

  /// Loads used app bar elevation setting in example 5.
  Future<double> appBarElevation();

  /// Persists the used app bar elevation setting in example 5.
  Future<void> saveAppBarElevation(double value);

  /// Key used to read and save the transparentStatusBar value.
  static const String keyTransparentStatusBar = 'transparentStatusBar';

  /// Default value for the transparentStatusBar, also used to reset settings.
  static const bool defaultTransparentStatusBar = true;

  /// Loads used status bar transparency setting in example 5.
  Future<bool> transparentStatusBar();

  /// Persists used status bar transparency setting in example 5.
  Future<void> saveTransparentStatusBar(bool value);

  /// Key used to read and save the tabBarStyle value.
  static const String keyTabBarStyle = 'tabBarStyle';

  /// Default value for the tabBarStyle, also used to reset settings.
  static const FlexTabBarStyle defaultTabBarStyle = FlexTabBarStyle.forAppBar;

  /// Loads used tab bar style setting in example 5.
  Future<FlexTabBarStyle> tabBarStyle();

  /// Persists used tab bar style setting in example 5.
  Future<void> saveTabBarStyle(FlexTabBarStyle value);

  /// Key used to read and save the tabBarIndicator value.
  static const String keyTabBarIndicator = 'tabBarIndicator';

  /// Default value for the tabBarIndicator, also used to reset settings.
  ///
  /// We use NULL as default, on nullable settings.
  static const SchemeColor? defaultTabBarIndicator = null;

  /// Loads used tabBarIndicator setting in example 5.
  Future<SchemeColor?> tabBarIndicator();

  /// Persists used tabBarIndicator setting in example 5.
  Future<void> saveTabBarIndicator(SchemeColor? value);

  /// Key used to read and save the bottomNavigationBarOpacity value.
  static const String keyBottomNavigationBarOpacity =
      'bottomNavigationBarOpacity';

  /// Default value for the bottomNavigationBarOpacity, also to reset settings.
  static const double defaultBottomNavigationBarOpacity = 0.95;

  /// Loads used bottom navigation bar opacity setting in example 5.
  Future<double> bottomNavigationBarOpacity();

  /// Persists the used app bar opacity setting in example 5.
  Future<void> saveBottomNavigationBarOpacity(double value);

  /// Key used to read and save the bottomNavigationBarElevation value.
  static const String keyBottomNavigationBarElevation =
      'bottomNavigationBarElevation';

  /// Default value for the bottomNavigationBarElevation, also reset settings.
  static const double defaultBottomNavigationBarElevation = 0;

  /// Loads used bottom navigation bar elevation setting in example 5.
  Future<double> bottomNavigationBarElevation();

  /// Persists the used app bar elevation setting in example 5.
  Future<void> saveBottomNavigationBarElevation(double value);

  /// Key used to read and save the navBarStyle value.
  static const String keyNavBarStyle = 'navBarStyle';

  /// Default value for the navBarStyle, also used to reset settings.
  static const FlexSystemNavBarStyle defaultNavBarStyle =
      FlexSystemNavBarStyle.background;

  /// Loads used navBarStyle setting in example 5.
  Future<FlexSystemNavBarStyle> navBarStyle();

  /// Persists used navBarStyle setting in example 5.
  Future<void> saveNavBarStyle(FlexSystemNavBarStyle value);

  /// Key used to read and save the navBarScheme value.
  static const String keyNavBarScheme = 'navBarScheme';

  /// Default value for the navBarScheme, also used to reset settings.
  ///
  /// We use NULL as default, on nullable settings.
  static const SchemeColor? defaultNavBarScheme = null;

  /// Loads used navBarScheme setting in example 5.
  Future<SchemeColor?> navBarScheme();

  /// Persists used navBarScheme setting in example 5.
  Future<void> saveNavBarScheme(SchemeColor? value);

  /// Key used to read and save the navBarHighlight value.
  static const String keyNavBarHighlight = 'navBarHighlight';

  /// Default value for the navBarHighlight, also used to reset settings.
  ///
  /// We use NULL as default, on nullable settings.
  static const SchemeColor? defaultNavBarHighlight = null;

  /// Loads used navBarHighlight setting in example 5.
  Future<SchemeColor?> navBarHighlight();

  /// Persists used navBarHighlight setting in example 5.
  Future<void> saveNavBarHighlight(SchemeColor? value);

  /// Key used to read and save the navBarMuteUnselected value.
  static const String keyNavBarMuteUnselected = 'navBarMuteUnselected';

  /// Default value for the navBarMuteUnselected, also used to reset settings.
  static const bool defaultNavBarMuteUnselected = true;

  /// Loads used navBarMuteUnselected setting in example 5.
  Future<bool> navBarMuteUnselected();

  /// Persists the navBarMuteUnselected setting in example 5.
  Future<void> saveNavBarMuteUnselected(bool value);

  /// Key used to read and save the useNavDivider value.
  static const String keyUseNavDivider = 'useNavDivider';

  /// Default value for the useNavDivider, also to reset settings.
  static const bool defaultUseNavDivider = false;

  /// Loads used useNavDivider setting in example 5.
  Future<bool> useNavDivider();

  /// Persists useNavDivider setting in example 5.
  Future<void> saveUseNavDivider(bool value);

  /// Key used to read and save the tooltipsMatchBackground value.
  static const String keyTooltipsMatchBackground = 'tooltipsMatchBackground';

  /// Default value for the tooltipsMatchBackground, also to reset settings.
  static const bool defaultTooltipsMatchBackground = true;

  /// Loads used tooltip style setting in example 5.
  Future<bool> tooltipsMatchBackground();

  /// Persists used tooltip style setting in example 5.
  Future<void> saveTooltipsMatchBackground(bool value);

  /// Key used to read and save the swapLightColors value.
  static const String keySwapLightColors = 'swapLightColors';

  /// Default value for the swapLightColors, also to reset settings.
  static const bool defaultSwapLightColors = false;

  /// Loads swap primary/secondary colors in light mode, in example 5.
  Future<bool> swapLightColors();

  /// Persists swap primary/secondary colors in light mode, in example 5.
  Future<void> saveSwapLightColors(bool value);

  /// Key used to read and save the swapDarkColors value.
  static const String keySwapDarkColors = 'swapDarkColors';

  /// Default value for the swapDarkColors, also to reset settings.
  static const bool defaultSwapDarkColors = false;

  /// Loads swap primary/secondary colors in dark mode, in example 5.
  Future<bool> swapDarkColors();

  /// Persists swap primary/secondary colors in dark mode, in example 5.
  Future<void> saveSwapDarkColors(bool value);

  /// Key used to read and save the lightIsWhite value.
  static const String keyLightIsWhite = 'lightIsWhite';

  /// Default value for the lightIsWhite, also to reset settings.
  static const bool defaultLightIsWhite = false;

  /// Loads lightIsWhite setting, in example 5.
  Future<bool> lightIsWhite();

  /// Persists lightIsWhite setting, in example 5.
  Future<void> saveLightIsWhite(bool value);

  /// Key used to read and save the darkIsTrueBlack value.
  static const String keyDarkIsTrueBlack = 'darkIsTrueBlack';

  /// Default value for the darkIsTrueBlack, also to reset settings.
  static const bool defaultDarkIsTrueBlack = false;

  /// Loads dark uses true black setting in dark mode, in example 5.
  Future<bool> darkIsTrueBlack();

  /// Persists dark uses true black setting in dark mode, in example 5.
  Future<void> saveDarkIsTrueBlack(bool value);

  /// Key used to read and save the useToDarkMethod value.
  static const String keyUseToDarkMethod = 'useToDarkMethod';

  /// Default value for the useToDarkMethod, also to reset settings.
  static const bool defaultUseToDarkMethod = false;

  /// Loads use computed dark mode setting, in example 5.
  Future<bool> useToDarkMethod();

  /// Persists use computed dark mode setting, in example 5.
  Future<void> saveUseToDarkMethod(bool value);

  /// Key used to read and save the darkMethodLevel value.
  static const String keyDarkMethodLevel = 'darkMethodLevel';

  /// Default value for the darkMethodLevel, also used to reset settings.
  ///
  /// Defaults to 35.
  static const int defaultDarkMethodLevel = 35;

  /// Loads use computed dark mode level setting, in example 5.
  Future<int> darkMethodLevel();

  /// Persists use computed dark mode level setting, in example 5.
  Future<void> saveDarkMethodLevel(int value);

  /// Key used to read and save the useFlexColorScheme value.
  static const String keyUseFlexColorScheme = 'useFlexColorScheme';

  /// Default value for the useFlexColorScheme, also to reset settings.
  static const bool defaultUseFlexColorScheme = true;

  /// Loads setting that turns ON/OFF FlexColorScheme theme, in example 5.
  Future<bool> useFlexColorScheme();

  /// Persists setting that turns ON/OFF FlexColorScheme theme, in example 5.
  Future<void> saveUseFlexColorScheme(bool value);

  /// Key used to read and save the blendLightOnColors value.
  static const String keyBlendLightOnColors = 'blendLightOnColors';

  /// Default value for the blendLightOnColors, also to reset settings.
  static const bool defaultBlendLightOnColors = false;

  /// Loads setting that blends light colors, in example 5.
  Future<bool> blendLightOnColors();

  /// Persists setting that blends light colors, in example 5.
  Future<void> saveBlendLightOnColors(bool value);

  /// Key used to read and save the blendDarkOnColors value.
  static const String keyBlendDarkOnColors = 'blendDarkOnColors';

  /// Default value for the blendDarkOnColors, also to reset settings.
  static const bool defaultBlendDarkOnColors = true;

  /// Loads setting that blends dark colors, in example 5.
  Future<bool> blendDarkOnColors();

  /// Persists setting that blends dark colors, in example 5.
  Future<void> saveBlendDarkOnColors(bool value);

  /// Key used to read and save the blendLightTextTheme value.
  static const String keyBlendLightTextTheme = 'blendLightTextTheme';

  /// Default value for the blendLightTextTheme, also to reset settings.
  static const bool defaultBlendLightTextTheme = true;

  /// Loads setting that blends light text theme, in example 5.
  Future<bool> blendLightTextTheme();

  /// Persists setting that blends light text theme, in example 5.
  Future<void> saveBlendLightTextTheme(bool value);

  /// Key used to read and save the blendDarkTextTheme value.
  static const String keyBlendDarkTextTheme = 'blendDarkTextTheme';

  /// Default value for the blendDarkTextTheme, also to reset settings.
  static const bool defaultBlendDarkTextTheme = true;

  /// Loads setting that blends dark text theme, in example 5.
  Future<bool> blendDarkTextTheme();

  /// Persists setting that blends dark text theme, in example 5.
  Future<void> saveBlendDarkTextTheme(bool value);

  /// Key used to read and save the fabUseShape value.
  static const String keyFabUseShape = 'fabUseShape';

  /// Default value for the fabUseShape, also to reset settings.
  static const bool defaultFabUseShape = true;

  /// Loads setting for fabUseShape, in example 5.
  Future<bool> fabUseShape();

  /// Persists setting for fabUseShape, in example 5.
  Future<void> saveFabUseShape(bool value);

  /// Key used to read and save the primaryLight color value.
  static const String keyPrimaryLight = 'primaryLight';

  /// Default value for the primaryLight color, also to reset settings.
  static const Color defaultPrimaryLight = FlexColor.materialLightPrimary;

  /// Loads setting for primaryLight color, in example 5.
  Future<Color> primaryLight();

  /// Persists setting for primaryLight color, in example 5.
  Future<void> savePrimaryLight(Color value);

  /// Key used to read and save the primaryContainerLight color value.
  static const String keyPrimaryContainerLight = 'primaryContainerLight';

  /// Default value for the primaryLight color, also to reset settings.
  static const Color defaultPrimaryContainerLight =
      FlexColor.materialLightPrimaryContainer;

  /// Loads setting for primaryContainerLight color, in example 5.
  Future<Color> primaryContainerLight();

  /// Persists setting for primaryContainerLight color, in example 5.
  Future<void> savePrimaryContainerLight(Color value);

  /// Key used to read and save the secondaryLight color value.
  static const String keySecondaryLight = 'secondaryLight';

  /// Default value for the secondaryLight color, also to reset settings.
  static const Color defaultSecondaryLight = FlexColor.materialLightSecondary;

  /// Loads setting for secondaryLight color, in example 5.
  Future<Color> secondaryLight();

  /// Persists setting for secondaryLight color, in example 5.
  Future<void> saveSecondaryLight(Color value);

  /// Key used to read and save the secondaryContainerLight color value.
  static const String keySecondaryContainerLight = 'secondaryContainerLight';

  /// Default value for the secondaryLight color, also to reset settings.
  static const Color defaultSecondaryContainerLight =
      FlexColor.materialLightTertiary;

  /// Loads setting for secondaryContainerLight color, in example 5.
  Future<Color> secondaryContainerLight();

  /// Persists setting for secondaryContainerLight color, in example 5.
  Future<void> saveSecondaryContainerLight(Color value);

  /// Key used to read and save the tertiaryLight color value.
  static const String keyTertiaryLight = 'tertiaryLight';

  /// Default value for the tertiaryLight color, also to reset settings.
  static const Color defaultTertiaryLight = FlexColor.materialLightTertiary;

  /// Loads setting for tertiaryLight color, in example 5.
  Future<Color> tertiaryLight();

  /// Persists setting for tertiaryLight color, in example 5.
  Future<void> saveTertiaryLight(Color value);

  /// Key used to read and save the tertiaryContainerLight color value.
  static const String keyTertiaryContainerLight = 'tertiaryContainerLight';

  /// Default value for the tertiaryLight color, also to reset settings.
  static const Color defaultTertiaryContainerLight =
      FlexColor.materialLightTertiary;

  /// Loads setting for tertiaryContainerLight color, in example 5.
  Future<Color> tertiaryContainerLight();

  /// Persists setting for tertiaryContainerLight color, in example 5.
  Future<void> saveTertiaryContainerLight(Color value);

  /// Key used to read and save the primaryDark color value.
  static const String keyPrimaryDark = 'primaryDark';

  /// Default value for the primaryDark color, also to reset settings.
  static const Color defaultPrimaryDark = FlexColor.materialDarkPrimary;

  /// Loads setting for primaryDark color, in example 5.
  Future<Color> primaryDark();

  /// Persists setting for primaryDark color, in example 5.
  Future<void> savePrimaryDark(Color value);

  /// Key used to read and save the primaryContainerDark color value.
  static const String keyPrimaryContainerDark = 'primaryContainerDark';

  /// Default value for the primaryDark color, also to reset settings.
  static const Color defaultPrimaryContainerDark =
      FlexColor.materialDarkPrimaryContainer;

  /// Loads setting for primaryContainerDark color, in example 5.
  Future<Color> primaryContainerDark();

  /// Persists setting for primaryContainerDark color, in example 5.
  Future<void> savePrimaryContainerDark(Color value);

  /// Key used to read and save the secondaryDark color value.
  static const String keySecondaryDark = 'secondaryDark';

  /// Default value for the secondaryDark color, also to reset settings.
  static const Color defaultSecondaryDark = FlexColor.materialDarkSecondary;

  /// Loads setting for secondaryDark color, in example 5.
  Future<Color> secondaryDark();

  /// Persists setting for secondaryDark color, in example 5.
  Future<void> saveSecondaryDark(Color value);

  /// Key used to read and save the secondaryContainerDark color value.
  static const String keySecondaryContainerDark = 'secondaryContainerDark';

  /// Default value for the secondaryDark color, also to reset settings.
  static const Color defaultSecondaryContainerDark =
      FlexColor.materialDarkTertiary;

  /// Loads setting for secondaryContainerDark color, in example 5.
  Future<Color> secondaryContainerDark();

  /// Persists setting for secondaryContainerDark color, in example 5.
  Future<void> saveSecondaryContainerDark(Color value);

  /// Key used to read and save the tertiaryDark color value.
  static const String keyTertiaryDark = 'tertiaryDark';

  /// Default value for the tertiaryDark color, also to reset settings.
  static const Color defaultTertiaryDark = FlexColor.materialDarkTertiary;

  /// Loads setting for tertiaryDark color, in example 5.
  Future<Color> tertiaryDark();

  /// Persists setting for tertiaryDark color, in example 5.
  Future<void> saveTertiaryDark(Color value);

  /// Key used to read and save the tertiaryContainerDark color value.
  static const String keyTertiaryContainerDark = 'tertiaryContainerDark';

  /// Default value for the tertiaryDark color, also to reset settings.
  static const Color defaultTertiaryContainerDark =
      FlexColor.materialDarkTertiary;

  /// Loads setting for tertiaryContainerDark color, in example 5.
  Future<Color> tertiaryContainerDark();

  /// Persists setting for tertiaryContainerDark color, in example 5.
  Future<void> saveTertiaryContainerDark(Color value);

  // ********* Version 5 new config options

  /// Key used to read and save the useMaterial3 value.
  static const String keyUseMaterial3 = 'useMaterial3';

  /// Default value for the useMaterial3, also to reset settings.
  static const bool defaultUseMaterial3 = false;

  /// Loads used useMaterial3 setting in example 5.
  Future<bool> useMaterial3();

  /// Persists useMaterial3 setting in example 5.
  Future<void> saveUseMaterial3(bool value);

  // ---------

  /// Key used to read and save the useKeyColors value.
  static const String keyUseKeyColors = 'useKeyColors';

  /// Default value for the useKeyColors, also to reset settings.
  static const bool defaultUseKeyColors = false;

  /// Loads used useKeyColors setting in example 5.
  Future<bool> useKeyColors();

  /// Persists useKeyColors setting in example 5.
  Future<void> saveUseKeyColors(bool value);

  // ---------

  /// Key used to read and save the useSecondary value.
  static const String keyUseSecondary = 'useSecondary';

  /// Default value for the useSecondary, also to reset settings.
  static const bool defaultUseSecondary = true;

  /// Loads used useSecondary setting in example 5.
  Future<bool> useSecondary();

  /// Persists useSecondary setting in example 5.
  Future<void> saveUseSecondary(bool value);

  // ---------

  /// Key used to read and save the useTertiary value.
  static const String keyUseTertiary = 'useTertiary';

  /// Default value for the useTertiary, also to reset settings.
  static const bool defaultUseTertiary = true;

  /// Loads used useTertiary setting in example 5.
  Future<bool> useTertiary();

  /// Persists useTertiary setting in example 5.
  Future<void> saveUseTertiary(bool value);

  // ---------

  /// Key used to read and save the keepPrimary value.
  static const String keyKeepPrimary = 'keepPrimary';

  /// Default value for the keepPrimary, also to reset settings.
  static const bool defaultKeepPrimary = false;

  /// Loads used keepPrimary setting in example 5.
  Future<bool> keepPrimary();

  /// Persists keepPrimary setting in example 5.
  Future<void> saveKeepPrimary(bool value);

  // ---------

  /// Key used to read and save the keepSecondary value.
  static const String keyKeepSecondary = 'keepSecondary';

  /// Default value for the keepSecondary, also to reset settings.
  static const bool defaultKeepSecondary = false;

  /// Loads used keepSecondary setting in example 5.
  Future<bool> keepSecondary();

  /// Persists keepSecondary setting in example 5.
  Future<void> saveKeepSecondary(bool value);

  // ---------

  /// Key used to read and save the keepTertiary value.
  static const String keyKeepTertiary = 'keepTertiary';

  /// Default value for the keepTertiary, also to reset settings.
  static const bool defaultKeepTertiary = false;

  /// Loads used keepTertiary setting in example 5.
  Future<bool> keepTertiary();

  /// Persists keepTertiary setting in example 5.
  Future<void> saveKeepTertiary(bool value);

  // ---------

  /// Key used to read and save the keepPrimaryContainer value.
  static const String keyKeepPrimaryContainer = 'keepPrimaryContainer';

  /// Default value for the keepPrimaryContainer, also to reset settings.
  static const bool defaultKeepPrimaryContainer = false;

  /// Loads used keepPrimaryContainer setting in example 5.
  Future<bool> keepPrimaryContainer();

  /// Persists keepPrimaryContainer setting in example 5.
  Future<void> saveKeepPrimaryContainer(bool value);

  // ---------

  /// Key used to read and save the keepSecondaryContainer value.
  static const String keyKeepSecondaryContainer = 'keepSecondaryContainer';

  /// Default value for the keepSecondaryContainer, also to reset settings.
  static const bool defaultKeepSecondaryContainer = false;

  /// Loads used keepSecondaryContainer setting in example 5.
  Future<bool> keepSecondaryContainer();

  /// Persists keepSecondaryContainer setting in example 5.
  Future<void> saveKeepSecondaryContainer(bool value);

  // ---------

  /// Key used to read and save the keepTertiaryContainer value.
  static const String keyKeepTertiaryContainer = 'keepTertiaryContainer';

  /// Default value for the keepTertiaryContainer, also to reset settings.
  static const bool defaultKeepTertiaryContainer = false;

  /// Loads used keepTertiaryContainer setting in example 5.
  Future<bool> keepTertiaryContainer();

  /// Persists keepTertiaryContainer setting in example 5.
  Future<void> saveKeepTertiaryContainer(bool value);

  // ---------

  /// Key used to read and save the textButtonSchemeColor value.
  static const String keyTextButtonSchemeColor = 'textButtonSchemeColor';

  /// Default value for the textButtonSchemeColor, also used to reset settings.
  ///
  /// We use NULL as default, on nullable settings.
  static const SchemeColor? defaultTextButtonSchemeColor = null;

  /// Loads used textButtonSchemeColor setting.
  Future<SchemeColor?> textButtonSchemeColor();

  /// Persists used textButtonSchemeColor setting.
  Future<void> saveTextButtonSchemeColor(SchemeColor? value);

  // ---------

  /// Key used to read and save the elevatedButtonSchemeColor value.
  static const String keyElevatedButtonSchemeColor =
      'elevatedButtonSchemeColor';

  /// Default value for the elevatedButtonSchemeColor, also used to
  /// reset settings.
  ///
  /// We use NULL as default, on nullable settings.
  static const SchemeColor? defaultElevatedButtonSchemeColor = null;

  /// Loads used elevatedButtonSchemeColor setting.
  Future<SchemeColor?> elevatedButtonSchemeColor();

  /// Persists used elevatedButtonSchemeColor setting.
  Future<void> saveElevatedButtonSchemeColor(SchemeColor? value);

  // ---------

  /// Key used to read and save the outlinedButtonSchemeColor value.
  static const String keyOutlinedButtonSchemeColor =
      'outlinedButtonSchemeColor';

  /// Default value for the outlinedButtonSchemeColor, also used to
  /// reset settings.
  ///
  /// We use NULL as default, on nullable settings.
  static const SchemeColor? defaultOutlinedButtonSchemeColor = null;

  /// Loads used outlinedButtonSchemeColor setting.
  Future<SchemeColor?> outlinedButtonSchemeColor();

  /// Persists used outlinedButtonSchemeColor setting.
  Future<void> saveOutlinedButtonSchemeColor(SchemeColor? value);

  // ---------

  /// Key used to read and save the materialButtonSchemeColor value.
  static const String keyMaterialButtonSchemeColor =
      'materialButtonSchemeColor';

  /// Default value for the materialButtonSchemeColor, also used to
  /// reset settings.
  ///
  /// We use NULL as default, on nullable settings.
  static const SchemeColor? defaultMaterialButtonSchemeColor = null;

  /// Loads used materialButtonSchemeColor setting.
  Future<SchemeColor?> materialButtonSchemeColor();

  /// Persists used materialButtonSchemeColor setting.
  Future<void> saveMaterialButtonSchemeColor(SchemeColor? value);

  // ---------

  /// Key used to read and save the toggleButtonsSchemeColor value.
  static const String keyToggleButtonsSchemeColor = 'toggleButtonsSchemeColor';

  /// Default value for the toggleButtonsSchemeColor, also used to
  /// reset settings.
  ///
  /// We use NULL as default, on nullable settings.
  static const SchemeColor? defaultToggleButtonsSchemeColor = null;

  /// Loads used toggleButtonsSchemeColor setting.
  Future<SchemeColor?> toggleButtonsSchemeColor();

  /// Persists used toggleButtonsSchemeColor setting.
  Future<void> saveToggleButtonsSchemeColor(SchemeColor? value);

  // ---------

  /// Key used to read and save the switchSchemeColor value.
  static const String keySwitchSchemeColor = 'switchSchemeColor';

  /// Default value for the switchSchemeColor, also used to reset settings.
  ///
  /// We use NULL as default, on nullable settings.
  static const SchemeColor? defaultSwitchSchemeColor = null;

  /// Loads used switchSchemeColor setting.
  Future<SchemeColor?> switchSchemeColor();

  /// Persists used switchSchemeColor setting.
  Future<void> saveSwitchSchemeColor(SchemeColor? value);

  // ---------

  /// Key used to read and save the checkboxSchemeColor value.
  static const String keyCheckboxSchemeColor = 'checkboxSchemeColor';

  /// Default value for the checkboxSchemeColor, also used to reset settings.
  ///
  /// We use NULL as default, on nullable settings.
  static const SchemeColor? defaultCheckboxSchemeColor = null;

  /// Loads used checkboxSchemeColor setting.
  Future<SchemeColor?> checkboxSchemeColor();

  /// Persists used checkboxSchemeColor setting.
  Future<void> saveCheckboxSchemeColor(SchemeColor? value);

  // ---------

  /// Key used to read and save the radioSchemeColor value.
  static const String keyRadioSchemeColor = 'radioSchemeColor';

  /// Default value for the radioSchemeColor, also used to reset settings.
  ///
  /// We use NULL as default, on nullable settings.
  static const SchemeColor? defaultRadioSchemeColor = null;

  /// Loads used radioSchemeColor setting.
  Future<SchemeColor?> radioSchemeColor();

  /// Persists used radioSchemeColor setting.
  Future<void> saveRadioSchemeColor(SchemeColor? value);

  // ---------

  /// Key used to read and save the dialogBackgroundSchemeColor value.
  static const String keyDialogBackgroundSchemeColor =
      'dialogBackgroundSchemeColor';

  /// Default value for the dialogBackgroundSchemeColor, also used to
  /// reset settings.
  ///
  /// We use NULL as default, on nullable settings.
  static const SchemeColor? defaultDialogBackgroundSchemeColor = null;

  /// Loads used dialogBackgroundSchemeColor setting.
  Future<SchemeColor?> dialogBackgroundSchemeColor();

  /// Persists used dialogBackgroundSchemeColor setting.
  Future<void> saveDialogBackgroundSchemeColor(SchemeColor? value);

  // ---------

  /// Key used to read and save the tabBarItemSchemeColor value.
  static const String keyTabBarItemSchemeColor = 'tabBarItemSchemeColor';

  /// Default value for the tabBarItemSchemeColor, also used to reset settings.
  ///
  /// We use NULL as default, on nullable settings.
  static const SchemeColor? defaultTabBarItemSchemeColor = null;

  /// Loads used tabBarItemSchemeColor setting.
  Future<SchemeColor?> tabBarItemSchemeColor();

  /// Persists used tabBarItemSchemeColor setting.
  Future<void> saveTabBarItemSchemeColor(SchemeColor? value);

  // ---------

  /// Key used to read and save the appBarBackgroundSchemeColor value.
  static const String keyAppBarBackgroundSchemeColor =
      'appBarBackgroundSchemeColor';

  /// Default value for the appBarBackgroundSchemeColor, also used to
  /// reset settings.
  ///
  /// We use NULL as default, on nullable settings.
  static const SchemeColor? defaultAppBarBackgroundSchemeColor = null;

  /// Loads used appBarBackgroundSchemeColor setting.
  Future<SchemeColor?> appBarBackgroundSchemeColor();

  /// Persists used appBarBackgroundSchemeColor setting.
  Future<void> saveAppBarBackgroundSchemeColor(SchemeColor? value);

  // ---------

  /// Key used to read and save the fabSchemeColor value.
  static const String keyFabSchemeColor = 'fabSchemeColor';

  /// Default value for the fabSchemeColor, also used to reset settings.
  ///
  /// We use NULL as default, on nullable settings.
  static const SchemeColor? defaultFabSchemeColor = null;

  /// Loads used fabSchemeColor setting.
  Future<SchemeColor?> fabSchemeColor();

  /// Persists used fabSchemeColor setting.
  Future<void> saveFabSchemeColor(SchemeColor? value);

  // ---------

  /// Key used to read and save the navBarBackgroundSchemeColor value.
  static const String keyNavBarBackgroundSchemeColor =
      'navBarBackgroundSchemeColor';

  /// Default value for the navBarBackgroundSchemeColor, also used to
  /// reset settings.
  ///
  /// We use NULL as default, on nullable settings.
  static const SchemeColor? defaultNavBarBackgroundSchemeColor = null;

  /// Loads used navBarBackgroundSchemeColor setting.
  Future<SchemeColor?> navBarBackgroundSchemeColor();

  /// Persists used navBarBackgroundSchemeColor setting.
  Future<void> saveNavBarBackgroundSchemeColor(SchemeColor? value);

  // ---------

  /// Key used to read and save the unselectedIsColored value.
  static const String keyUnselectedIsColored = 'unselectedIsColored';

  /// Default value for the unselectedIsColored, also to reset settings.
  static const bool defaultUnselectedIsColored = true;

  /// Loads used unselectedIsColored setting in example 5.
  Future<bool> unselectedIsColored();

  /// Persists unselectedIsColored setting in example 5.
  Future<void> saveUnselectedIsColored(bool value);

  // ---------

  /// Key used to read and save the usedFlexTonesSetup value.
  ///
  /// It is used to select different pre-made FlexTones configurations used
  /// to configure how the seeded [ColorScheme]s behave.
  static const String keyUsedFlexTonesSetup = 'usedFlexTonesSetup';

  /// Default value for the usedFlexTonesSetupLevel, also used to reset
  /// settings.
  ///
  /// Defaults to 1 - Flutter SDK default confi
  static const int defaultUsedFlexTonesSetup = 1;

  /// Loads used surface usedFlexTonesSetup level setting in example 5.
  Future<int> usedFlexTonesSetup();

  /// Persists the used surface usedFlexTonesSetup level setting in example 5.
  Future<void> saveUsedFlexTonesSetup(int value);
}
