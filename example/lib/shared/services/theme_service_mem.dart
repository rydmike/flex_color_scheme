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
/// implementation that uses package shared_preferences package to persists the
/// values or the [ThemeServiceHive] that uses the hive packages to accomplish
/// the same thing. You could also make an implementation that stores settings
/// on a web server, e.g. with the http package.
class ThemeServiceMem implements ThemeService {
  /// Loads the ThemeMode from local or remote storage.
  @override
  Future<ThemeMode> themeMode() async => ThemeMode.system;

  /// Persists the ThemeMode to mem in examples 2, 3, 4 and 5.
  @override
  Future<void> saveThemeMode(ThemeMode value) async {}

  /// Loads the use sub themes setting from mem in examples 2, 3, 4 and 5.
  @override
  Future<bool> useSubThemes() async => true;

  /// Persists the use sub themes setting to mem in examples 2, 3, 4 and 5.
  @override
  Future<void> saveUseSubThemes(bool value) async {}

  /// Loads the used scheme setting from mem in example 3.
  @override
  Future<FlexScheme> usedScheme() async => FlexScheme.hippieBlue;

  /// Persists the used scheme setting to mem in example 3.
  @override
  Future<void> saveUsedScheme(FlexScheme value) async {}

  /// Loads used scheme index setting from mem in examples 4 and 5.
  ///
  /// Defaults to 6, brand blues.
  @override
  Future<int> schemeIndex() async => 6;

  /// Persists the used scheme setting to mem in examples 4 and 5.
  @override
  Future<void> saveSchemeIndex(int value) async {}

  /// Loads used themed effects setting in example 5.
  @override
  Future<bool> themedEffects() async => true;

  /// Persists used themed effects setting in example 5.
  @override
  Future<void> saveThemedEffects(bool value) async {}

  /// Loads used corner radius setting in example 5.
  @override
  Future<double> cornerRadius() async => 16;

  /// Persists the used corner radius setting in example 5.
  @override
  Future<void> saveCornerRadius(double value) async {}

  /// Loads used inputDecoratorIsFilled setting in example 5.
  @override
  Future<bool> inputDecoratorIsFilled() async => true;

  /// Persists used inputDecoratorIsFilled setting in example 5.
  @override
  Future<void> saveInputDecoratorIsFilled(bool value) async {}

  /// Loads used inputDecoratorIsOutlinedBorder setting in example 5.
  @override
  Future<bool> inputDecoratorIsOutlinedBorder() async => true;

  /// Persists used inputDecoratorIsOutlinedBorder setting in example 5.
  @override
  Future<void> saveInputDecoratorIsOutlinedBorder(bool value) async {}

  /// Loads used inputDecoratorUnfocusedHasBorder setting in example 5.
  @override
  Future<bool> inputDecoratorUnfocusedHasBorder() async => true;

  /// Persists used inputDecoratorUnfocusedHasBorder setting in example 5.
  @override
  Future<void> saveInputDecoratorUnfocusedHasBorder(bool value) async {}

  /// Loads used surface mode setting in example 5.
  @override
  Future<FlexSurfaceMode> surfaceMode() async => FlexSurfaceMode.lowScaffold;

  /// Persists the used surface mode setting in example 5.
  @override
  Future<void> saveSurfaceMode(FlexSurfaceMode value) async {}

  /// Loads used surface blend level setting in example 5.
  ///
  /// Defaults to [FlexBlendLevel.five].
  @override
  Future<FlexBlendLevel> blendLevel() async => FlexBlendLevel.five;

  /// Persists the used surface blend level setting in example 5.
  @override
  Future<void> saveBlendLevel(FlexBlendLevel value) async {}

  /// Loads used app bar style for light theme setting in example 5.
  @override
  Future<FlexAppBarStyle> lightAppBarStyle() async => FlexAppBarStyle.primary;

  /// Persists the used app bar style for light theme setting in example 5.
  @override
  Future<void> saveLightAppBarStyle(FlexAppBarStyle value) async {}

  /// Loads used app bar style for dark theme setting in example 5.
  @override
  Future<FlexAppBarStyle> darkAppBarStyle() async => FlexAppBarStyle.background;

  /// Persists the used app bar style for dark theme setting in example 5.
  @override
  Future<void> saveDarkAppBarStyle(FlexAppBarStyle value) async {}

  /// Loads used app bar opacity setting in example 5.
  ///
  /// Defaults to 0.96, just a nice default effect for the example.
  @override
  Future<double> appBarOpacity() async => 0.96;

  /// Persists the used app bar opacity setting in example 5.
  @override
  Future<void> saveAppBarOpacity(double value) async {}

  /// Loads used app bar elevation setting in example 5.
  ///
  /// Defaults to 0.5, just a hint of elevation, gives us a bottom border for
  /// free on light backgrounds.
  @override
  Future<double> appBarElevation() async => 0.5;

  /// Persists the used app bar elevation setting in example 5.
  @override
  Future<void> saveAppBarElevation(double value) async {}

  /// Loads used status bar transparency setting in example 5.
  @override
  Future<bool> transparentStatusBar() async => true;

  /// Persists used status bar transparency setting in example 5.
  @override
  Future<void> saveTransparentStatusBar(bool value) async {}

  /// Loads used tab bar style setting in example 5.
  @override
  Future<FlexTabBarStyle> tabBarStyle() async => FlexTabBarStyle.forAppBar;

  /// Persists used tab bar style setting in example 5.
  @override
  Future<void> saveTabBarStyle(FlexTabBarStyle value) async {}

  /// Loads used bottom navigation bar opacity setting in example 5.
  ///
  /// Defaults to 0.96, just a nice default effect for the example.
  @override
  Future<double> bottomNavigationBarOpacity() async => 0.96;

  /// Persists the used app bar opacity setting in example 5.
  @override
  Future<void> saveBottomNavigationBarOpacity(double value) async {}

  /// Loads used tooltip style setting in example 5.
  @override
  Future<bool> tooltipsMatchBackground() async => false;

  /// Persists used tooltip style setting in example 5.
  @override
  Future<void> saveTooltipsMatchBackground(bool value) async {}

  /// Loads swap primary/secondary colors in light mode, in example 5.
  @override
  Future<bool> swapLightColors() async => false;

  /// Persists swap primary/secondary colors in light mode, in example 5.
  @override
  Future<void> saveSwapLightColors(bool value) async {}

  /// Loads swap primary/secondary colors in dark mode, in example 5.
  @override
  Future<bool> swapDarkColors() async => false;

  /// Persists swap primary/secondary colors in dark mode, in example 5.
  @override
  Future<void> saveSwapDarkColors(bool value) async {}

  /// Loads dark uses true black setting in dark mode, in example 5.
  @override
  Future<bool> darkIsTrueBlack() async => false;

  /// Persists dark uses true black setting in dark mode, in example 5.
  @override
  Future<void> saveDarkIsTrueBlack(bool value) async {}

  /// Loads use computed dark mode setting, in example 5.
  @override
  Future<bool> useToDarkMethod() async => false;

  /// Persists use computed dark mode setting, in example 5.
  @override
  Future<void> saveUseToDarkMethod(bool value) async {}

  /// Loads use computed dark mode level setting, in example 5.
  @override
  Future<int> darkMethodLevel() async => 35;

  /// Persists use computed dark mode level setting, in example 5.
  @override
  Future<void> saveDarkMethodLevel(int value) async {}

  /// Loads setting that turns ON/OFF FlexColorScheme theme, in example 5.
  @override
  Future<bool> useFlexColorScheme() async => true;

  /// Persists setting that turns ON/OFF FlexColorScheme theme, in example 5.
  @override
  Future<void> saveUseFlexColorScheme(bool value) async {}
}
