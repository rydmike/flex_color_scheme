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

  /// Loads setting for primaryVariantLight color, in example 5.
  @override
  Future<Color> primaryVariantLight() async =>
      ThemeService.defaultPrimaryVariantLight;

  /// Persists setting for primaryVariantLight color, in example 5.
  @override
  Future<void> savePrimaryVariantLight(Color value) async {}

  /// Loads setting for secondaryLight color, in example 5.
  @override
  Future<Color> secondaryLight() async => ThemeService.defaultSecondaryLight;

  /// Persists setting for secondaryLight color, in example 5.
  @override
  Future<void> saveSecondaryLight(Color value) async {}

  /// Loads setting for secondaryVariantLight color, in example 5.
  @override
  Future<Color> secondaryVariantLight() async =>
      ThemeService.defaultSecondaryVariantLight;

  /// Persists setting for secondaryVariantLight color, in example 5.
  @override
  Future<void> saveSecondaryVariantLight(Color value) async {}

  /// Loads setting for primaryDark color, in example 5.
  @override
  Future<Color> primaryDark() async => ThemeService.defaultPrimaryDark;

  /// Persists setting for primaryDark color, in example 5.
  @override
  Future<void> savePrimaryDark(Color value) async {}

  /// Loads setting for primaryVariantDark color, in example 5.
  @override
  Future<Color> primaryVariantDark() async =>
      ThemeService.defaultPrimaryVariantDark;

  /// Persists setting for primaryVariantDark color, in example 5.
  @override
  Future<void> savePrimaryVariantDark(Color value) async {}

  /// Loads setting for secondaryDark color, in example 5.
  @override
  Future<Color> secondaryDark() async => ThemeService.defaultSecondaryDark;

  /// Persists setting for secondaryDark color, in example 5.
  @override
  Future<void> saveSecondaryDark(Color value) async {}

  /// Loads setting for secondaryVariantDark color, in example 5.
  @override
  Future<Color> secondaryVariantDark() async =>
      ThemeService.defaultSecondaryVariantDark;

  /// Persists setting for secondaryVariantDark color, in example 5.
  @override
  Future<void> saveSecondaryVariantDark(Color value) async {}
}
