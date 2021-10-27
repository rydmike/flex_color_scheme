import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

/// Interface for ThemeService used to read and save theme properties.
abstract class ThemeService {
  /// Key used to read and save the themeMode value.
  static const String kThemeMode = 'themeMode';

  /// Loads the ThemeMode in examples 2, 3, 4 and 5.
  Future<ThemeMode> themeMode();

  /// Persists the ThemeMode in examples 2, 3, 4 and 5.
  Future<void> saveThemeMode(ThemeMode value);

  /// Loads the use sub themes setting in examples 2, 3, 4 and 5.
  Future<bool> useSubThemes();

  /// Persists the use sub themes setting in examples 2, 3, 4 and 5.
  Future<void> saveUseSubThemes(bool value);

  /// Loads the used scheme setting, in example 3.
  Future<FlexScheme> usedScheme();

  /// Persists the used scheme setting, in example 3.
  Future<void> saveUsedScheme(FlexScheme value);

  /// Loads used scheme index setting, in examples 4 and 5.
  Future<int> schemeIndex();

  /// Persists the used scheme setting, in examples 4 and 5.
  Future<void> saveSchemeIndex(int value);

  /// Loads used themed effects setting in example 5.
  Future<bool> themedEffects();

  /// Persists used themed effects setting in example 5.
  Future<void> saveThemedEffects(bool value);

  /// Loads used corner radius setting in example 5.
  Future<double> cornerRadius();

  /// Persists the used corner radius setting in example 5.
  Future<void> saveCornerRadius(double value);

  /// Loads used inputDecoratorIsFilled setting in example 5.
  Future<bool> inputDecoratorIsFilled();

  /// Persists used inputDecoratorIsFilled setting in example 5.
  Future<void> saveInputDecoratorIsFilled(bool value);

  /// Loads used inputDecoratorIsOutlinedBorder setting in example 5.
  Future<bool> inputDecoratorIsOutlinedBorder();

  /// Persists used inputDecoratorIsOutlinedBorder setting in example 5.
  Future<void> saveInputDecoratorIsOutlinedBorder(bool value);

  /// Loads used inputDecoratorUnfocusedHasBorder setting in example 5.
  Future<bool> inputDecoratorUnfocusedHasBorder();

  /// Persists used inputDecoratorUnfocusedHasBorder setting in example 5.
  Future<void> saveInputDecoratorUnfocusedHasBorder(bool value);

  /// Loads used surface mode setting in example 5.
  Future<FlexSurfaceMode> surfaceMode();

  /// Persists the used surface mode setting in example 5.
  Future<void> saveSurfaceMode(FlexSurfaceMode value);

  /// Loads used surface blend level setting in example 5.
  Future<int> blendLevel();

  /// Persists the used surface blend level setting in example 5.
  Future<void> saveBlendLevel(int value);

  /// Loads used app bar style for light theme setting in example 5.
  Future<FlexAppBarStyle> lightAppBarStyle();

  /// Persists the used app bar style for light theme setting in example 5.
  Future<void> saveLightAppBarStyle(FlexAppBarStyle value);

  /// Loads used app bar style for dark theme setting in example 5.
  Future<FlexAppBarStyle> darkAppBarStyle();

  /// Persists the used app bar style for dark theme setting in example 5.
  Future<void> saveDarkAppBarStyle(FlexAppBarStyle value);

  /// Loads used app bar opacity setting in example 5.
  Future<double> appBarOpacity();

  /// Persists the used app bar opacity setting in example 5.
  Future<void> saveAppBarOpacity(double value);

  /// Loads used app bar elevation setting in example 5.
  Future<double> appBarElevation();

  /// Persists the used app bar elevation setting in example 5.
  Future<void> saveAppBarElevation(double value);

  /// Loads used status bar transparency setting in example 5.
  Future<bool> transparentStatusBar();

  /// Persists used status bar transparency setting in example 5.
  Future<void> saveTransparentStatusBar(bool value);

  /// Loads used tab bar style setting in example 5.
  Future<FlexTabBarStyle> tabBarStyle();

  /// Persists used tab bar style setting in example 5.
  Future<void> saveTabBarStyle(FlexTabBarStyle value);

  /// Loads used bottom navigation bar opacity setting in example 5.
  Future<double> bottomNavigationBarOpacity();

  /// Persists the used app bar opacity setting in example 5.
  Future<void> saveBottomNavigationBarOpacity(double value);

  /// Loads used tooltip style setting in example 5.
  Future<bool> tooltipsMatchBackground();

  /// Persists used tooltip style setting in example 5.
  Future<void> saveTooltipsMatchBackground(bool value);

  /// Loads swap primary/secondary colors in light mode, in example 5.
  Future<bool> swapLightColors();

  /// Persists swap primary/secondary colors in light mode, in example 5.
  Future<void> saveSwapLightColors(bool value);

  /// Loads swap primary/secondary colors in dark mode, in example 5.
  Future<bool> swapDarkColors();

  /// Persists swap primary/secondary colors in dark mode, in example 5.
  Future<void> saveSwapDarkColors(bool value);

  /// Loads dark uses true black setting in dark mode, in example 5.
  Future<bool> darkIsTrueBlack();

  /// Persists dark uses true black setting in dark mode, in example 5.
  Future<void> saveDarkIsTrueBlack(bool value);

  /// Loads use computed dark mode setting, in example 5.
  Future<bool> useToDarkMethod();

  /// Persists use computed dark mode setting, in example 5.
  Future<void> saveUseToDarkMethod(bool value);

  /// Loads use computed dark mode level setting, in example 5.
  Future<int> darkMethodLevel();

  /// Persists use computed dark mode level setting, in example 5.
  Future<void> saveDarkMethodLevel(int value);

  /// Loads setting that turns ON/OFF FlexColorScheme theme, in example 5.
  Future<bool> useFlexColorScheme();

  /// Persists setting that turns ON/OFF FlexColorScheme theme, in example 5.
  Future<void> saveUseFlexColorScheme(bool value);
}
