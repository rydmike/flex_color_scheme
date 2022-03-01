import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import 'theme_service.dart';
// ignore_for_file: comment_references

/// A service that stores and retrieves theme settings from memory only.
///
/// This class does not persist user settings, it only returns start default
/// values. The runtime in memory storage is actually handled by the theme
/// controller.
///
/// To actually persist the settings locally, use the [ThemeServicePrefs]
/// implementation that uses the shared_preferences package to persists the
/// values, or the [ThemeServiceHive] that uses the hive package to accomplish
/// the same thing. You could also make an implementation that stores settings
/// on a web server, e.g. with the http package.
///
/// The ThemeController that this is service is used with, keeps all latest
/// setting values in memory itself, so this memory implementation
/// does not really do anything when calling save for each property,
/// they are all just no-op.
///
/// Loading values from it just returns the default value for each settings
/// property.
class ThemeServiceMem implements ThemeService {
  /// ThemeServiceMem implementations needs no init, it is just a no op.
  @override
  Future<void> init() async {}

  /// Loads the ThemeMode from local or remote storage.
  @override
  Future<ThemeMode> themeMode() async => ThemeService.defaultThemeMode;

  /// Persists the ThemeMode to mem in examples 2, 3, 4 and 5.
  @override
  Future<void> saveThemeMode(ThemeMode value) async {}

  /// Loads the use sub themes setting from mem in examples 2, 3, 4 and 5.
  @override
  Future<bool> useSubThemes() async => ThemeService.defaultUseSubThemes;

  /// Persists the use sub themes setting to mem in examples 2, 3, 4 and 5.
  @override
  Future<void> saveUseSubThemes(bool value) async {}

  /// Loads the useTextTheme setting in example 5.
  @override
  Future<bool> useTextTheme() async => ThemeService.defaultUseTextTheme;

  /// Persists the useTextTheme setting in example 5.
  @override
  Future<void> saveUseTextTheme(bool value) async {}

  /// Loads the used scheme setting from mem in example 3.
  @override
  Future<FlexScheme> usedScheme() async => ThemeService.defaultUsedScheme;

  /// Persists the used scheme setting to mem in example 3.
  @override
  Future<void> saveUsedScheme(FlexScheme value) async {}

  /// Loads used scheme index setting from mem in examples 4 and 5.
  @override
  Future<int> schemeIndex() async => ThemeService.defaultSchemeIndex;

  /// Persists the used scheme setting to mem in examples 4 and 5.
  @override
  Future<void> saveSchemeIndex(int value) async {}

  /// Loads used themed effects setting in example 5.
  @override
  Future<bool> interactionEffects() async =>
      ThemeService.defaultInteractionEffects;

  /// Persists used themed effects setting in example 5.
  @override
  Future<void> saveInteractionEffects(bool value) async {}

  /// Loads used useDefaultRadius setting in example 5.
  @override
  Future<bool> useDefaultRadius() async => ThemeService.defaultUseDefaultRadius;

  /// Persists the useDefaultRadius setting in example 5.
  @override
  Future<void> saveUseDefaultRadius(bool value) async {}

  /// Loads used corner radius setting in example 5.
  @override
  Future<double> cornerRadius() async => ThemeService.defaultCornerRadius;

  /// Persists the used corner radius setting in example 5.
  @override
  Future<void> saveCornerRadius(double value) async {}

  /// Loads used inputDecoratorIsFilled setting in example 5.
  @override
  Future<bool> inputDecoratorIsFilled() async =>
      ThemeService.defaultInputDecoratorIsFilled;

  /// Persists used inputDecoratorIsFilled setting in example 5.
  @override
  Future<void> saveInputDecoratorIsFilled(bool value) async {}

  /// Loads used inputDecoratorBorderType setting in example 5.
  @override
  Future<FlexInputBorderType> inputDecoratorBorderType() async =>
      ThemeService.defaultInputDecoratorBorderType;

  /// Persists used inputDecoratorBorderType setting in example 5.
  @override
  Future<void> saveInputDecoratorBorderType(FlexInputBorderType value) async {}

  /// Loads used inputDecoratorUnfocusedHasBorder setting in example 5.
  @override
  Future<bool> inputDecoratorUnfocusedHasBorder() async =>
      ThemeService.defaultInputDecoratorUnfocusedHasBorder;

  /// Persists used inputDecoratorUnfocusedHasBorder setting in example 5.
  @override
  Future<void> saveInputDecoratorUnfocusedHasBorder(bool value) async {}

  /// Loads used inputDecoratorSchemeColor setting in example 5.
  @override
  Future<SchemeColor?> inputDecoratorSchemeColor() async =>
      ThemeService.defaultInputDecoratorSchemeColor;

  /// Persists used inputDecoratorSchemeColor setting in example 5.
  @override
  Future<void> saveInputDecoratorSchemeColor(SchemeColor? value) async {}

  /// Loads used chipSchemeColor setting in example 5.
  @override
  Future<SchemeColor?> chipSchemeColor() async =>
      ThemeService.defaultChipSchemeColor;

  /// Persists used chipSchemeColor setting in example 5.
  @override
  Future<void> saveChipSchemeColor(SchemeColor? value) async {}

  /// Loads used surface mode setting in example 5.
  @override
  Future<FlexSurfaceMode> surfaceMode() async =>
      ThemeService.defaultSurfaceMode;

  /// Persists the used surface mode setting in example 5.
  @override
  Future<void> saveSurfaceMode(FlexSurfaceMode value) async {}

  /// Loads used surface blend level setting in example 5.
  @override
  Future<int> blendLevel() async => ThemeService.defaultBlendLevel;

  /// Persists the used surface blend level setting in example 5.
  @override
  Future<void> saveBlendLevel(int value) async {}

  /// Loads used surface blend level dark setting in example 5.
  @override
  Future<int> blendLevelDark() async => ThemeService.defaultBlendLevelDark;

  /// Persists the used surface blend level dark setting in example 5.
  @override
  Future<void> saveBlendLevelDark(int value) async {}

  /// Loads used onBlend level setting in example 5.
  @override
  Future<int> blendOnLevel() async => ThemeService.defaultBlendOnLevel;

  /// Persists the onBlend level setting in example 5.
  @override
  Future<void> saveBlendOnLevel(int value) async {}

  /// Loads used onBlend level dark setting in example 5.
  @override
  Future<int> blendOnLevelDark() async => ThemeService.defaultBlendOnLevelDark;

  /// Persists the used onBlend level dark setting in example 5.
  @override
  Future<void> saveBlendOnLevelDark(int value) async {}

  /// Loads used usedColors setting in example 5.
  @override
  Future<int> usedColors() async => ThemeService.defaultUsedColors;

  /// Persists the usedColors setting in example 5.
  @override
  Future<void> saveUsedColors(int value) async {}

  /// Loads used app bar style for light theme setting in example 5.
  @override
  Future<FlexAppBarStyle> lightAppBarStyle() async =>
      ThemeService.defaultLightAppBarStyle;

  /// Persists the used app bar style for light theme setting in example 5.
  @override
  Future<void> saveLightAppBarStyle(FlexAppBarStyle value) async {}

  /// Loads used app bar style for dark theme setting in example 5.
  @override
  Future<FlexAppBarStyle> darkAppBarStyle() async =>
      ThemeService.defaultDarkAppBarStyle;

  /// Persists the used app bar style for dark theme setting in example 5.
  @override
  Future<void> saveDarkAppBarStyle(FlexAppBarStyle value) async {}

  /// Loads used app bar opacity setting in example 5.
  @override
  Future<double> appBarOpacity() async => ThemeService.defaultAppBarOpacity;

  /// Persists the used app bar opacity setting in example 5.
  @override
  Future<void> saveAppBarOpacity(double value) async {}

  /// Loads used app bar elevation setting in example 5.
  @override
  Future<double> appBarElevation() async => ThemeService.defaultAppBarElevation;

  /// Persists the used app bar elevation setting in example 5.
  @override
  Future<void> saveAppBarElevation(double value) async {}

  /// Loads used status bar transparency setting in example 5.
  @override
  Future<bool> transparentStatusBar() async =>
      ThemeService.defaultTransparentStatusBar;

  /// Persists used status bar transparency setting in example 5.
  @override
  Future<void> saveTransparentStatusBar(bool value) async {}

  /// Loads used tab bar style setting in example 5.
  @override
  Future<FlexTabBarStyle> tabBarStyle() async =>
      ThemeService.defaultTabBarStyle;

  /// Persists used tab bar style setting in example 5.
  @override
  Future<void> saveTabBarStyle(FlexTabBarStyle value) async {}

  /// Loads used tabBarIndicator setting in example 5.
  @override
  Future<SchemeColor?> tabBarIndicator() async =>
      ThemeService.defaultTabBarIndicator;

  /// Persists used tabBarIndicator setting in example 5.
  @override
  Future<void> saveTabBarIndicator(SchemeColor? value) async {}

  /// Loads used bottom navigation bar opacity setting in example 5.
  @override
  Future<double> bottomNavigationBarOpacity() async =>
      ThemeService.defaultBottomNavigationBarOpacity;

  /// Persists the used app bar opacity setting in example 5.
  @override
  Future<void> saveBottomNavigationBarOpacity(double value) async {}

  /// Loads used bottom navigation bar elevation setting in example 5.
  @override
  Future<double> bottomNavigationBarElevation() async =>
      ThemeService.defaultBottomNavigationBarElevation;

  /// Persists the used app bar elevation setting in example 5.
  @override
  Future<void> saveBottomNavigationBarElevation(double value) async {}

  /// Loads used navBarStyle setting in example 5.
  @override
  Future<FlexSystemNavBarStyle> navBarStyle() async =>
      ThemeService.defaultNavBarStyle;

  /// Persists used navBarStyle setting in example 5.
  @override
  Future<void> saveNavBarStyle(FlexSystemNavBarStyle value) async {}

  /// Loads used navBarScheme setting in example 5.
  @override
  Future<SchemeColor?> navBarScheme() async => ThemeService.defaultNavBarScheme;

  /// Persists used navBarScheme setting in example 5.
  @override
  Future<void> saveNavBarScheme(SchemeColor? value) async {}

  /// Loads used navBarHighlight setting in example 5.
  @override
  Future<SchemeColor?> navBarHighlight() async =>
      ThemeService.defaultNavBarHighlight;

  /// Persists used navBarHighlight setting in example 5.
  @override
  Future<void> saveNavBarHighlight(SchemeColor? value) async {}

  /// Loads used navBarMuteUnselected setting in example 5.
  @override
  Future<bool> navBarMuteUnselected() async =>
      ThemeService.defaultNavBarMuteUnselected;

  /// Persists the navBarMuteUnselected setting in example 5.
  @override
  Future<void> saveNavBarMuteUnselected(bool value) async {}

  /// Loads used useNavDivider setting in example 5.
  @override
  Future<bool> useNavDivider() async => ThemeService.defaultUseNavDivider;

  /// Persists useNavDivider setting in example 5.
  @override
  Future<void> saveUseNavDivider(bool value) async {}

  /// Loads used tooltip style setting in example 5.
  @override
  Future<bool> tooltipsMatchBackground() async =>
      ThemeService.defaultTooltipsMatchBackground;

  /// Persists used tooltip style setting in example 5.
  @override
  Future<void> saveTooltipsMatchBackground(bool value) async {}

  /// Loads swap primary/secondary colors in light mode, in example 5.
  @override
  Future<bool> swapLightColors() async => ThemeService.defaultSwapLightColors;

  /// Persists swap primary/secondary colors in light mode, in example 5.
  @override
  Future<void> saveSwapLightColors(bool value) async {}

  /// Loads swap primary/secondary colors in dark mode, in example 5.
  @override
  Future<bool> swapDarkColors() async => ThemeService.defaultSwapDarkColors;

  /// Persists swap primary/secondary colors in dark mode, in example 5.
  @override
  Future<void> saveSwapDarkColors(bool value) async {}

  /// Loads lightIsWhite setting, in example 5.
  @override
  Future<bool> lightIsWhite() async => ThemeService.defaultLightIsWhite;

  /// Persists lightIsWhite setting, in example 5.
  @override
  Future<void> saveLightIsWhite(bool value) async {}

  /// Loads dark uses true black setting in dark mode, in example 5.
  @override
  Future<bool> darkIsTrueBlack() async => ThemeService.defaultDarkIsTrueBlack;

  /// Persists dark uses true black setting in dark mode, in example 5.
  @override
  Future<void> saveDarkIsTrueBlack(bool value) async {}

  /// Loads use computed dark mode setting, in example 5.
  @override
  Future<bool> useToDarkMethod() async => ThemeService.defaultUseToDarkMethod;

  /// Persists use computed dark mode setting, in example 5.
  @override
  Future<void> saveUseToDarkMethod(bool value) async {}

  /// Loads use computed dark mode level setting, in example 5.
  @override
  Future<int> darkMethodLevel() async => ThemeService.defaultDarkMethodLevel;

  /// Persists use computed dark mode level setting, in example 5.
  @override
  Future<void> saveDarkMethodLevel(int value) async {}

  /// Loads setting that turns ON/OFF FlexColorScheme theme, in example 5.
  @override
  Future<bool> useFlexColorScheme() async =>
      ThemeService.defaultUseFlexColorScheme;

  /// Persists setting that turns ON/OFF FlexColorScheme theme, in example 5.
  @override
  Future<void> saveUseFlexColorScheme(bool value) async {}

  /// Loads setting that blends light colors, in example 5.
  @override
  Future<bool> blendLightOnColors() async =>
      ThemeService.defaultBlendLightOnColors;

  /// Persists setting that blends light colors, in example 5.
  @override
  Future<void> saveBlendLightOnColors(bool value) async {}

  /// Loads setting that blends dark colors, in example 5.
  @override
  Future<bool> blendDarkOnColors() async =>
      ThemeService.defaultBlendDarkOnColors;

  /// Persists setting that blends dark colors, in example 5.
  @override
  Future<void> saveBlendDarkOnColors(bool value) async {}

  /// Loads setting that blends light text theme, in example 5.
  @override
  Future<bool> blendLightTextTheme() async =>
      ThemeService.defaultBlendLightTextTheme;

  /// Persists setting that blends light text theme, in example 5.
  @override
  Future<void> saveBlendLightTextTheme(bool value) async {}

  /// Loads setting that blends dark text theme, in example 5.
  @override
  Future<bool> blendDarkTextTheme() async =>
      ThemeService.defaultBlendDarkTextTheme;

  /// Persists setting that blends dark text theme, in example 5.
  @override
  Future<void> saveBlendDarkTextTheme(bool value) async {}

  /// Loads setting for fabUseShape, in example 5.
  @override
  Future<bool> fabUseShape() async => ThemeService.defaultFabUseShape;

  /// Persists setting for fabUseShape, in example 5.
  @override
  Future<void> saveFabUseShape(bool value) async {}

  /// Loads setting for primaryLight color, in example 5.
  @override
  Future<Color> primaryLight() async => ThemeService.defaultPrimaryLight;

  /// Persists setting for primaryLight color, in example 5.
  @override
  Future<void> savePrimaryLight(Color value) async {}

  /// Loads setting for primaryContainerLight color, in example 5.
  @override
  Future<Color> primaryContainerLight() async =>
      ThemeService.defaultPrimaryContainerLight;

  /// Persists setting for primaryContainerLight color, in example 5.
  @override
  Future<void> savePrimaryContainerLight(Color value) async {}

  /// Loads setting for secondaryLight color, in example 5.
  @override
  Future<Color> secondaryLight() async => ThemeService.defaultSecondaryLight;

  /// Persists setting for secondaryLight color, in example 5.
  @override
  Future<void> saveSecondaryLight(Color value) async {}

  /// Loads setting for secondaryContainerLight color, in example 5.
  @override
  Future<Color> secondaryContainerLight() async =>
      ThemeService.defaultSecondaryContainerLight;

  /// Persists setting for secondaryContainerLight color, in example 5.
  @override
  Future<void> saveSecondaryContainerLight(Color value) async {}

  /// Loads setting for tertiaryLight color, in example 5.
  @override
  Future<Color> tertiaryLight() async => ThemeService.defaultTertiaryLight;

  /// Persists setting for tertiaryLight color, in example 5.
  @override
  Future<void> saveTertiaryLight(Color value) async {}

  /// Loads setting for tertiaryContainerLight color, in example 5.
  @override
  Future<Color> tertiaryContainerLight() async =>
      ThemeService.defaultTertiaryContainerLight;

  /// Persists setting for tertiaryContainerLight color, in example 5.
  @override
  Future<void> saveTertiaryContainerLight(Color value) async {}

  /// Loads setting for primaryDark color, in example 5.
  @override
  Future<Color> primaryDark() async => ThemeService.defaultPrimaryDark;

  /// Persists setting for primaryDark color, in example 5.
  @override
  Future<void> savePrimaryDark(Color value) async {}

  /// Loads setting for primaryContainerDark color, in example 5.
  @override
  Future<Color> primaryContainerDark() async =>
      ThemeService.defaultPrimaryContainerDark;

  /// Persists setting for primaryContainerDark color, in example 5.
  @override
  Future<void> savePrimaryContainerDark(Color value) async {}

  /// Loads setting for secondaryDark color, in example 5.
  @override
  Future<Color> secondaryDark() async => ThemeService.defaultSecondaryDark;

  /// Persists setting for secondaryDark color, in example 5.
  @override
  Future<void> saveSecondaryDark(Color value) async {}

  /// Loads setting for secondaryContainerDark color, in example 5.
  @override
  Future<Color> secondaryContainerDark() async =>
      ThemeService.defaultSecondaryContainerDark;

  /// Persists setting for secondaryContainerDark color, in example 5.
  @override
  Future<void> saveSecondaryContainerDark(Color value) async {}

  /// Loads setting for tertiaryDark color, in example 5.
  @override
  Future<Color> tertiaryDark() async => ThemeService.defaultTertiaryDark;

  /// Persists setting for tertiaryDark color, in example 5.
  @override
  Future<void> saveTertiaryDark(Color value) async {}

  /// Loads setting for tertiaryContainerDark color, in example 5.
  @override
  Future<Color> tertiaryContainerDark() async =>
      ThemeService.defaultTertiaryContainerDark;

  /// Persists setting for tertiaryContainerDark color, in example 5.
  @override
  Future<void> saveTertiaryContainerDark(Color value) async {}

  // ********* Version 5 new config options

  /// Loads used useMaterial3 setting in example 5.
  @override
  Future<bool> useMaterial3() async => ThemeService.defaultUseMaterial3;

  /// Persists useMaterial3 setting in example 5.
  @override
  Future<void> saveUseMaterial3(bool value) async {}

  //----

  /// Loads used useKeyColors setting in example 5.
  @override
  Future<bool> useKeyColors() async => ThemeService.defaultUseKeyColors;

  /// Persists useKeyColors setting in example 5.
  @override
  Future<void> saveUseKeyColors(bool value) async {}

  //----

  /// Loads used useSecondary setting in example 5.
  @override
  Future<bool> useSecondary() async => ThemeService.defaultUseSecondary;

  /// Persists useSecondary setting in example 5.
  @override
  Future<void> saveUseSecondary(bool value) async {}

  //----

  /// Loads used useTertiary setting in example 5.
  @override
  Future<bool> useTertiary() async => ThemeService.defaultUseTertiary;

  /// Persists useTertiary setting in example 5.
  @override
  Future<void> saveUseTertiary(bool value) async {}

  //----

  /// Loads used keepPrimary setting in example 5.
  @override
  Future<bool> keepPrimary() async => ThemeService.defaultKeepPrimary;

  /// Persists keepPrimary setting in example 5.
  @override
  Future<void> saveKeepPrimary(bool value) async {}

  //----

  /// Loads used keepSecondary setting in example 5.
  @override
  Future<bool> keepSecondary() async => ThemeService.defaultKeepSecondary;

  /// Persists keepSecondary setting in example 5.
  @override
  Future<void> saveKeepSecondary(bool value) async {}

  //----

  /// Loads used keepTertiary setting in example 5.
  @override
  Future<bool> keepTertiary() async => ThemeService.defaultKeepTertiary;

  /// Persists keepTertiary setting in example 5.
  @override
  Future<void> saveKeepTertiary(bool value) async {}

  //----

  /// Loads used keepNavDivider setting in example 5.
  @override
  Future<bool> keepPrimaryContainer() async =>
      ThemeService.defaultKeepPrimaryContainer;

  /// Persists keepPrimaryContainer setting in example 5.
  @override
  Future<void> saveKeepPrimaryContainer(bool value) async {}

  //----

  /// Loads used keepSecondaryContainer setting in example 5.
  @override
  Future<bool> keepSecondaryContainer() async =>
      ThemeService.defaultKeepSecondaryContainer;

  /// Persists keepSecondaryContainer setting in example 5.
  @override
  Future<void> saveKeepSecondaryContainer(bool value) async {}

  //----

  /// Loads used keepTertiaryContainer setting in example 5.
  @override
  Future<bool> keepTertiaryContainer() async =>
      ThemeService.defaultKeepTertiaryContainer;

  /// Persists keepTertiaryContainer setting in example 5.
  @override
  Future<void> saveKeepTertiaryContainer(bool value) async {}

  //----

  /// Loads used textButtonSchemeColor setting.
  @override
  Future<SchemeColor?> textButtonSchemeColor() async =>
      ThemeService.defaultTextButtonSchemeColor;

  /// Persists used textButtonSchemeColor setting.
  @override
  Future<void> saveTextButtonSchemeColor(SchemeColor? value) async {}

  //----

  /// Loads used elevatedButtonSchemeColor setting.
  @override
  Future<SchemeColor?> elevatedButtonSchemeColor() async =>
      ThemeService.defaultElevatedButtonSchemeColor;

  /// Persists used elevatedButtonSchemeColor setting.
  @override
  Future<void> saveElevatedButtonSchemeColor(SchemeColor? value) async {}

  //----

  /// Loads used outlinedButtonSchemeColor setting.
  @override
  Future<SchemeColor?> outlinedButtonSchemeColor() async =>
      ThemeService.defaultOutlinedButtonSchemeColor;

  /// Persists used outlinedButtonSchemeColor setting.
  @override
  Future<void> saveOutlinedButtonSchemeColor(SchemeColor? value) async {}

  //----

  /// Loads used materialButtonSchemeColor setting.
  @override
  Future<SchemeColor?> materialButtonSchemeColor() async =>
      ThemeService.defaultMaterialButtonSchemeColor;

  /// Persists used materialButtonSchemeColor setting.
  @override
  Future<void> saveMaterialButtonSchemeColor(SchemeColor? value) async {}

  //----

  /// Loads used toggleButtonsSchemeColor setting.
  @override
  Future<SchemeColor?> toggleButtonsSchemeColor() async =>
      ThemeService.defaultToggleButtonsSchemeColor;

  /// Persists used toggleButtonsSchemeColor setting.
  @override
  Future<void> saveToggleButtonsSchemeColor(SchemeColor? value) async {}

  //----

  /// Loads used switchSchemeColor setting.
  @override
  Future<SchemeColor?> switchSchemeColor() async =>
      ThemeService.defaultSwitchSchemeColor;

  /// Persists used switchSchemeColor setting.
  @override
  Future<void> saveSwitchSchemeColor(SchemeColor? value) async {}

  //----

  /// Loads used checkboxSchemeColor setting.
  @override
  Future<SchemeColor?> checkboxSchemeColor() async =>
      ThemeService.defaultCheckboxSchemeColor;

  /// Persists used checkboxSchemeColor setting.
  @override
  Future<void> saveCheckboxSchemeColor(SchemeColor? value) async {}

  //----

  /// Loads used radioSchemeColor setting.
  @override
  Future<SchemeColor?> radioSchemeColor() async =>
      ThemeService.defaultRadioSchemeColor;

  /// Persists used radioSchemeColor setting.
  @override
  Future<void> saveRadioSchemeColor(SchemeColor? value) async {}

  //----

  /// Loads used dialogBackgroundSchemeColor setting.
  @override
  Future<SchemeColor?> dialogBackgroundSchemeColor() async =>
      ThemeService.defaultDialogBackgroundSchemeColor;

  /// Persists used dialogBackgroundSchemeColor setting.
  @override
  Future<void> saveDialogBackgroundSchemeColor(SchemeColor? value) async {}

  //----

  /// Loads used tabBarItemSchemeColor setting.
  @override
  Future<SchemeColor?> tabBarItemSchemeColor() async =>
      ThemeService.defaultTabBarItemSchemeColor;

  /// Persists used tabBarItemSchemeColor setting.
  @override
  Future<void> saveTabBarItemSchemeColor(SchemeColor? value) async {}

  //----

  /// Loads used appBarBackgroundSchemeColor setting.
  @override
  Future<SchemeColor?> appBarBackgroundSchemeColor() async =>
      ThemeService.defaultAppBarBackgroundSchemeColor;

  /// Persists used appBarBackgroundSchemeColor setting.
  @override
  Future<void> saveAppBarBackgroundSchemeColor(SchemeColor? value) async {}

  //----

  /// Loads used fabSchemeColor setting.
  @override
  Future<SchemeColor?> fabSchemeColor() async =>
      ThemeService.defaultFabSchemeColor;

  /// Persists used fabSchemeColor setting.
  @override
  Future<void> saveFabSchemeColor(SchemeColor? value) async {}

  //----

  /// Loads used navBarBackgroundSchemeColor setting.
  @override
  Future<SchemeColor?> navBarBackgroundSchemeColor() async =>
      ThemeService.defaultNavBarBackgroundSchemeColor;

  /// Persists used navBarBackgroundSchemeColor setting.
  @override
  Future<void> saveNavBarBackgroundSchemeColor(SchemeColor? value) async {}

  //----

  /// Loads used unselectedIsColored setting in example 5.
  @override
  Future<bool> unselectedIsColored() async =>
      ThemeService.defaultUnselectedIsColored;

  /// Persists unselectedIsColored setting in example 5.
  @override
  Future<void> saveUnselectedIsColored(bool value) async {}
}
