import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'theme_service.dart';
// ignore_for_file: comment_references

/// A [ThemeService] implementation that stores and retrieves theme settings
/// locally using the package Shared Preferences:
/// https://pub.dev/packages/shared_preferences
///
/// This service on purpose demonstrates persisting each theme setting value as
/// its own string key and value pair. With this amount of values,
/// bundling them all up in a data class and persisting them all as one big
/// serialized JSON string, with just one settings key, would be more
/// convenient. On the other hand, this is probably more resource
/// efficient and gives us faster saves of persisted slider values, that can
/// be dragged quickly in the UI. Writing this setup for this many properties is
/// a bit error prone, even if it is simple and very mechanical.
///
/// Normally your would probably not have this many settings properties you
/// want to persist locally (or remotely), in that case this approach is also
/// the simpler and more convenient one. In this particular case though, well
/// maybe not with this amount of props.
class ThemeServicePrefs implements ThemeService {
  // Hold an instance to the SharedPreferences store, must be initialized
  // by the init call before accessing the stored data.
  late final SharedPreferences _prefs;

  /// ThemeServicePrefs initialization.
  ///
  /// Must be called before using it.
  ///
  /// Just get the shared preference instance with its static getter.
  /// We keep the handle to it in the instance so we do not need to get it
  /// more than once during the lifetime of this app.
  ///
  /// The application only actually loads settings once when it starts, after
  /// that settings are in kept in memory and saved when changed, but
  /// never read back before app is started again.
  @override
  Future<void> init() async {
    // Get the SharedPreferences instance and assign it to our instance.
    _prefs = await SharedPreferences.getInstance();
  }

  /// Loads the ThemeMode from local storage.
  @override
  Future<ThemeMode> themeMode() async {
    try {
      final int value = _prefs.getInt(ThemeService.keyThemeMode) ??
          ThemeService.defaultThemeMode.index;
      return ThemeMode.values[value];
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultThemeMode;
    }
  }

  /// Persists the ThemeMode used in examples 2, 3, 4 and 5.
  @override
  Future<void> saveThemeMode(ThemeMode value) async {
    // We store enums as their int index value. This breaks if enum definitions
    // are changed in any other way than adding more enums to the end.
    try {
      await _prefs.setInt(ThemeService.keyThemeMode, value.index);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads the use sub themes setting used in examples 2, 3, 4 and 5.
  @override
  Future<bool> useSubThemes() async {
    try {
      final bool value = _prefs.getBool(ThemeService.keyUseSubThemes) ??
          ThemeService.defaultUseSubThemes;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultUseSubThemes;
    }
  }

  /// Persists the use sub themes setting used in examples 2, 3, 4 and 5.
  @override
  Future<void> saveUseSubThemes(bool value) async {
    try {
      await _prefs.setBool(ThemeService.keyUseSubThemes, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads the useTextTheme setting in example 5.
  @override
  Future<bool> useTextTheme() async {
    try {
      final bool value = _prefs.getBool(ThemeService.keyUseTextTheme) ??
          ThemeService.defaultUseTextTheme;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultUseTextTheme;
    }
  }

  /// Persists the useTextTheme setting in example 5.
  @override
  Future<void> saveUseTextTheme(bool value) async {
    try {
      await _prefs.setBool(ThemeService.keyUseTextTheme, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads the used scheme setting used in example 3.
  @override
  Future<FlexScheme> usedScheme() async {
    try {
      final int value = _prefs.getInt(ThemeService.keyUsedScheme) ??
          ThemeService.defaultUsedScheme.index;
      return FlexScheme.values[value];
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultUsedScheme;
    }
  }

  /// Persists the used scheme setting used in example 3.
  @override
  Future<void> saveUsedScheme(FlexScheme value) async {
    try {
      await _prefs.setInt(ThemeService.keyUsedScheme, value.index);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used scheme index setting used in examples 4 and 5.
  @override
  Future<int> schemeIndex() async {
    try {
      final int value = _prefs.getInt(ThemeService.keySchemeIndex) ??
          ThemeService.defaultSchemeIndex;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultSchemeIndex;
    }
  }

  /// Persists the used scheme setting used in examples 4 and 5.
  @override
  Future<void> saveSchemeIndex(int value) async {
    try {
      await _prefs.setInt(ThemeService.keySchemeIndex, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used themed effects setting in example 5.
  @override
  Future<bool> interactionEffects() async {
    try {
      final bool value = _prefs.getBool(ThemeService.keyInteractionEffects) ??
          ThemeService.defaultInteractionEffects;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultInteractionEffects;
    }
  }

  /// Persists used themed effects setting in example 5.
  @override
  Future<void> saveInteractionEffects(bool value) async {
    try {
      await _prefs.setBool(ThemeService.keyInteractionEffects, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used useDefaultRadius setting in example 5.
  @override
  Future<bool> useDefaultRadius() async {
    try {
      final bool value = _prefs.getBool(ThemeService.keyUseDefaultRadius) ??
          ThemeService.defaultUseDefaultRadius;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultUseDefaultRadius;
    }
  }

  /// Persists the useDefaultRadius setting in example 5.
  @override
  Future<void> saveUseDefaultRadius(bool value) async {
    try {
      await _prefs.setBool(ThemeService.keyUseDefaultRadius, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used corner radius setting in example 5.
  @override
  Future<double> cornerRadius() async {
    try {
      final double value = _prefs.getDouble(ThemeService.keyCornerRadius) ??
          ThemeService.defaultCornerRadius;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultCornerRadius;
    }
  }

  /// Persists the used corner radius setting in example 5.
  @override
  Future<void> saveCornerRadius(double value) async {
    try {
      await _prefs.setDouble(ThemeService.keyCornerRadius, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used inputDecoratorIsFilled setting in example 5.
  @override
  Future<bool> inputDecoratorIsFilled() async {
    try {
      final bool value =
          _prefs.getBool(ThemeService.keyInputDecoratorIsFilled) ??
              ThemeService.defaultInputDecoratorIsFilled;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultInputDecoratorIsFilled;
    }
  }

  /// Persists used inputDecoratorIsFilled setting in example 5.
  @override
  Future<void> saveInputDecoratorIsFilled(bool value) async {
    try {
      await _prefs.setBool(ThemeService.keyInputDecoratorIsFilled, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used inputDecoratorBorderType setting in example 5.
  @override
  Future<FlexInputBorderType> inputDecoratorBorderType() async {
    try {
      final int value =
          _prefs.getInt(ThemeService.keyInputDecoratorBorderType) ??
              ThemeService.defaultInputDecoratorBorderType.index;
      return FlexInputBorderType.values[value];
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultInputDecoratorBorderType;
    }
  }

  /// Persists used inputDecoratorBorderType setting in example 5.
  @override
  Future<void> saveInputDecoratorBorderType(FlexInputBorderType value) async {
    try {
      await _prefs.setInt(
          ThemeService.keyInputDecoratorBorderType, value.index);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used inputDecoratorUnfocusedHasBorder setting in example 5.
  @override
  Future<bool> inputDecoratorUnfocusedHasBorder() async {
    try {
      final bool value =
          _prefs.getBool(ThemeService.keyInputDecoratorUnfocusedHasBorder) ??
              ThemeService.defaultInputDecoratorUnfocusedHasBorder;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultInputDecoratorUnfocusedHasBorder;
    }
  }

  /// Persists used inputDecoratorUnfocusedHasBorder setting in example 5.
  @override
  Future<void> saveInputDecoratorUnfocusedHasBorder(bool value) async {
    try {
      await _prefs.setBool(
          ThemeService.keyInputDecoratorUnfocusedHasBorder, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used surface mode setting in example 5.
  @override
  Future<FlexSurfaceMode> surfaceMode() async {
    try {
      final int value = _prefs.getInt(ThemeService.keySurfaceMode) ??
          ThemeService.defaultSurfaceMode.index;
      return FlexSurfaceMode.values[value];
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultSurfaceMode;
    }
  }

  /// Persists the used surface mode setting in example 5.
  @override
  Future<void> saveSurfaceMode(FlexSurfaceMode value) async {
    try {
      await _prefs.setInt(ThemeService.keySurfaceMode, value.index);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used surface blend level setting in example 5.

  @override
  Future<int> blendLevel() async {
    try {
      final int value = _prefs.getInt(ThemeService.keyBlendLevel) ??
          ThemeService.defaultBlendLevel;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultBlendLevel;
    }
  }

  /// Persists the used surface blend level setting in example 5.
  @override
  Future<void> saveBlendLevel(int value) async {
    try {
      await _prefs.setInt(ThemeService.keyBlendLevel, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used app bar style for light theme setting in example 5.
  @override
  Future<FlexAppBarStyle> lightAppBarStyle() async {
    try {
      final int value = _prefs.getInt(ThemeService.keyLightAppBarStyle) ??
          ThemeService.defaultLightAppBarStyle.index;
      return FlexAppBarStyle.values[value];
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultLightAppBarStyle;
    }
  }

  /// Persists the used app bar style for light theme setting in example 5.
  @override
  Future<void> saveLightAppBarStyle(FlexAppBarStyle value) async {
    try {
      await _prefs.setInt(ThemeService.keyLightAppBarStyle, value.index);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used app bar style for dark theme setting in example 5.
  @override
  Future<FlexAppBarStyle> darkAppBarStyle() async {
    try {
      final int value = _prefs.getInt(ThemeService.keyDarkAppBarStyle) ??
          ThemeService.defaultDarkAppBarStyle.index;
      return FlexAppBarStyle.values[value];
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultDarkAppBarStyle;
    }
  }

  /// Persists the used app bar style for dark theme setting in example 5.
  @override
  Future<void> saveDarkAppBarStyle(FlexAppBarStyle value) async {
    try {
      await _prefs.setInt(ThemeService.keyDarkAppBarStyle, value.index);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used app bar opacity setting in example 5.
  @override
  Future<double> appBarOpacity() async {
    try {
      final double value = _prefs.getDouble(ThemeService.keyAppBarOpacity) ??
          ThemeService.defaultAppBarOpacity;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultAppBarOpacity;
    }
  }

  /// Persists the used app bar opacity setting in example 5.
  @override
  Future<void> saveAppBarOpacity(double value) async {
    try {
      await _prefs.setDouble(ThemeService.keyAppBarOpacity, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used app bar elevation setting in example 5.
  @override
  Future<double> appBarElevation() async {
    try {
      final double value = _prefs.getDouble(ThemeService.keyAppBarElevation) ??
          ThemeService.defaultAppBarElevation;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultAppBarElevation;
    }
  }

  /// Persists the used app bar elevation setting in example 5.
  @override
  Future<void> saveAppBarElevation(double value) async {
    try {
      await _prefs.setDouble(ThemeService.keyAppBarElevation, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used status bar transparency setting in example 5.
  @override
  Future<bool> transparentStatusBar() async {
    try {
      final bool value = _prefs.getBool(ThemeService.keyTransparentStatusBar) ??
          ThemeService.defaultTransparentStatusBar;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultTransparentStatusBar;
    }
  }

  /// Persists used status bar transparency setting in example 5.
  @override
  Future<void> saveTransparentStatusBar(bool value) async {
    try {
      await _prefs.setBool(ThemeService.keyTransparentStatusBar, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used tab bar style setting in example 5.
  @override
  Future<FlexTabBarStyle> tabBarStyle() async {
    try {
      final int value = _prefs.getInt(ThemeService.keyTabBarStyle) ??
          ThemeService.defaultTabBarStyle.index;
      return FlexTabBarStyle.values[value];
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultTabBarStyle;
    }
  }

  /// Persists used tab bar style setting in example 5.
  @override
  Future<void> saveTabBarStyle(FlexTabBarStyle value) async {
    try {
      await _prefs.setInt(ThemeService.keyTabBarStyle, value.index);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used bottom navigation bar opacity setting in example 5.
  @override
  Future<double> bottomNavigationBarOpacity() async {
    try {
      final double value =
          _prefs.getDouble(ThemeService.keyBottomNavigationBarOpacity) ??
              ThemeService.defaultBottomNavigationBarOpacity;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultBottomNavigationBarOpacity;
    }
  }

  /// Persists the used app bar opacity setting in example 5.
  @override
  Future<void> saveBottomNavigationBarOpacity(double value) async {
    try {
      await _prefs.setDouble(ThemeService.keyBottomNavigationBarOpacity, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used bottom navigation bar elevation setting in example 5.
  @override
  Future<double> bottomNavigationBarElevation() async {
    try {
      final double value =
          _prefs.getDouble(ThemeService.keyBottomNavigationBarElevation) ??
              ThemeService.defaultBottomNavigationBarElevation;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultBottomNavigationBarElevation;
    }
  }

  /// Persists the used app bar elevation setting in example 5.
  @override
  Future<void> saveBottomNavigationBarElevation(double value) async {
    try {
      await _prefs.setDouble(
          ThemeService.keyBottomNavigationBarElevation, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used navBarStyle setting in example 5.
  @override
  Future<FlexSystemNavBarStyle> navBarStyle() async {
    try {
      final int value = _prefs.getInt(ThemeService.keyNavBarStyle) ??
          ThemeService.defaultNavBarStyle.index;
      return FlexSystemNavBarStyle.values[value];
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultNavBarStyle;
    }
  }

  /// Persists used navBarStyle setting in example 5.
  @override
  Future<void> saveNavBarStyle(FlexSystemNavBarStyle value) async {
    try {
      await _prefs.setInt(ThemeService.keyNavBarStyle, value.index);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used useNavDivider setting in example 5.
  @override
  Future<bool> useNavDivider() async {
    try {
      final bool value = _prefs.getBool(ThemeService.keyUseNavDivider) ??
          ThemeService.defaultUseNavDivider;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultUseNavDivider;
    }
  }

  /// Persists useNavDivider setting in example 5.
  @override
  Future<void> saveUseNavDivider(bool value) async {
    try {
      await _prefs.setBool(ThemeService.keyUseNavDivider, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used tooltip style setting in example 5.
  @override
  Future<bool> tooltipsMatchBackground() async {
    try {
      final bool value =
          _prefs.getBool(ThemeService.keyTooltipsMatchBackground) ??
              ThemeService.defaultTooltipsMatchBackground;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultTooltipsMatchBackground;
    }
  }

  /// Persists used tooltip style setting in example 5.
  @override
  Future<void> saveTooltipsMatchBackground(bool value) async {
    try {
      await _prefs.setBool(ThemeService.keyTooltipsMatchBackground, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads swap primary/secondary colors in light mode, in example 5.
  @override
  Future<bool> swapLightColors() async {
    try {
      final bool value = _prefs.getBool(ThemeService.keySwapLightColors) ??
          ThemeService.defaultSwapLightColors;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultSwapLightColors;
    }
  }

  /// Persists swap primary/secondary colors in light mode, in example 5.
  @override
  Future<void> saveSwapLightColors(bool value) async {
    try {
      await _prefs.setBool(ThemeService.keySwapLightColors, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads swap primary/secondary colors in dark mode, in example 5.
  @override
  Future<bool> swapDarkColors() async {
    try {
      final bool value = _prefs.getBool(ThemeService.keySwapDarkColors) ??
          ThemeService.defaultSwapDarkColors;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultSwapDarkColors;
    }
  }

  /// Persists swap primary/secondary colors in dark mode, in example 5.
  @override
  Future<void> saveSwapDarkColors(bool value) async {
    try {
      await _prefs.setBool(ThemeService.keySwapDarkColors, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads lightIsWhite setting, in example 5.
  @override
  Future<bool> lightIsWhite() async {
    try {
      final bool value = _prefs.getBool(ThemeService.keyLightIsWhite) ??
          ThemeService.defaultLightIsWhite;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultLightIsWhite;
    }
  }

  /// Persists lightIsWhite setting, in example 5.
  @override
  Future<void> saveLightIsWhite(bool value) async {
    try {
      await _prefs.setBool(ThemeService.keyLightIsWhite, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads dark uses true black setting in dark mode, in example 5.
  @override
  Future<bool> darkIsTrueBlack() async {
    try {
      final bool value = _prefs.getBool(ThemeService.keyDarkIsTrueBlack) ??
          ThemeService.defaultDarkIsTrueBlack;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultDarkIsTrueBlack;
    }
  }

  /// Persists dark uses true black setting in dark mode, in example 5.
  @override
  Future<void> saveDarkIsTrueBlack(bool value) async {
    try {
      await _prefs.setBool(ThemeService.keyDarkIsTrueBlack, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads use computed dark mode setting, in example 5.
  @override
  Future<bool> useToDarkMethod() async {
    try {
      final bool value = _prefs.getBool(ThemeService.keyUseToDarkMethod) ??
          ThemeService.defaultUseToDarkMethod;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultUseToDarkMethod;
    }
  }

  /// Persists use computed dark mode setting, in example 5.
  @override
  Future<void> saveUseToDarkMethod(bool value) async {
    try {
      await _prefs.setBool(ThemeService.keyUseToDarkMethod, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads use computed dark mode level setting, in example 5.
  @override
  Future<int> darkMethodLevel() async {
    try {
      final int value = _prefs.getInt(ThemeService.keyDarkMethodLevel) ??
          ThemeService.defaultDarkMethodLevel;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultDarkMethodLevel;
    }
  }

  /// Persists use computed dark mode level setting, in example 5.
  @override
  Future<void> saveDarkMethodLevel(int value) async {
    try {
      await _prefs.setInt(ThemeService.keyDarkMethodLevel, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads setting that turns ON/OFF FlexColorScheme theme, in example 5.
  @override
  Future<bool> useFlexColorScheme() async {
    try {
      final bool value = _prefs.getBool(ThemeService.keyUseFlexColorScheme) ??
          ThemeService.defaultUseFlexColorScheme;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultUseFlexColorScheme;
    }
  }

  /// Persists setting that turns ON/OFF FlexColorScheme theme, in example 5.
  @override
  Future<void> saveUseFlexColorScheme(bool value) async {
    try {
      await _prefs.setBool(ThemeService.keyUseFlexColorScheme, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads setting that blends light colors, in example 5.
  @override
  Future<bool> blendLightOnColors() async {
    try {
      final bool value = _prefs.getBool(ThemeService.keyBlendLightOnColors) ??
          ThemeService.defaultBlendLightOnColors;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultBlendLightOnColors;
    }
  }

  /// Persists setting that blends light colors, in example 5.
  @override
  Future<void> saveBlendLightOnColors(bool value) async {
    try {
      await _prefs.setBool(ThemeService.keyBlendLightOnColors, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads setting that blends dark colors, in example 5.
  @override
  Future<bool> blendDarkOnColors() async {
    try {
      final bool value = _prefs.getBool(ThemeService.keyBlendDarkOnColors) ??
          ThemeService.defaultBlendDarkOnColors;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultBlendDarkOnColors;
    }
  }

  /// Persists setting that blends dark colors, in example 5.
  @override
  Future<void> saveBlendDarkOnColors(bool value) async {
    try {
      await _prefs.setBool(ThemeService.keyBlendDarkOnColors, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads setting that blends light text theme, in example 5.
  @override
  Future<bool> blendLightTextTheme() async {
    try {
      final bool value = _prefs.getBool(ThemeService.keyBlendLightTextTheme) ??
          ThemeService.defaultBlendLightTextTheme;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultBlendLightTextTheme;
    }
  }

  /// Persists setting that blends light text theme, in example 5.
  @override
  Future<void> saveBlendLightTextTheme(bool value) async {
    try {
      await _prefs.setBool(ThemeService.keyBlendLightTextTheme, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads setting that blends dark text theme, in example 5.
  @override
  Future<bool> blendDarkTextTheme() async {
    try {
      final bool value = _prefs.getBool(ThemeService.keyBlendDarkTextTheme) ??
          ThemeService.defaultBlendDarkTextTheme;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultBlendDarkTextTheme;
    }
  }

  /// Persists setting that blends dark text theme, in example 5.
  @override
  Future<void> saveBlendDarkTextTheme(bool value) async {
    try {
      await _prefs.setBool(ThemeService.keyBlendDarkTextTheme, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads setting for fabUseShape, in example 5.
  @override
  Future<bool> fabUseShape() async {
    try {
      final bool value = _prefs.getBool(ThemeService.keyFabUseShape) ??
          ThemeService.defaultFabUseShape;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultFabUseShape;
    }
  }

  /// Persists setting for fabUseShape, in example 5.
  @override
  Future<void> saveFabUseShape(bool value) async {
    try {
      await _prefs.setBool(ThemeService.keyFabUseShape, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads setting for primaryLight color, in example 5.
  @override
  Future<Color> primaryLight() async {
    try {
      final Color value = Color(_prefs.getInt(ThemeService.keyPrimaryLight) ??
          ThemeService.defaultPrimaryLight.value);
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultPrimaryLight;
    }
  }

  /// Persists setting for primaryLight color, in example 5.
  @override
  Future<void> savePrimaryLight(Color value) async {
    try {
      await _prefs.setInt(ThemeService.keyPrimaryLight, value.value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads setting for primaryVariantLight color, in example 5.
  @override
  Future<Color> primaryVariantLight() async {
    try {
      final Color value = Color(
          _prefs.getInt(ThemeService.keyPrimaryVariantLight) ??
              ThemeService.defaultPrimaryVariantLight.value);
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultPrimaryVariantLight;
    }
  }

  /// Persists setting for primaryVariantLight color, in example 5.
  @override
  Future<void> savePrimaryVariantLight(Color value) async {
    try {
      await _prefs.setInt(ThemeService.keyPrimaryVariantLight, value.value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads setting for secondaryLight color, in example 5.
  @override
  Future<Color> secondaryLight() async {
    try {
      final Color value = Color(_prefs.getInt(ThemeService.keySecondaryLight) ??
          ThemeService.defaultSecondaryLight.value);
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultSecondaryLight;
    }
  }

  /// Persists setting for secondaryLight color, in example 5.
  @override
  Future<void> saveSecondaryLight(Color value) async {
    try {
      await _prefs.setInt(ThemeService.keySecondaryLight, value.value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads setting for secondaryVariantLight color, in example 5.
  @override
  Future<Color> secondaryVariantLight() async {
    try {
      final Color value = Color(
          _prefs.getInt(ThemeService.keySecondaryVariantLight) ??
              ThemeService.defaultSecondaryVariantLight.value);
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultSecondaryVariantLight;
    }
  }

  /// Persists setting for secondaryVariantLight color, in example 5.
  @override
  Future<void> saveSecondaryVariantLight(Color value) async {
    try {
      await _prefs.setInt(ThemeService.keySecondaryVariantLight, value.value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads setting for primaryDark color, in example 5.
  @override
  Future<Color> primaryDark() async {
    try {
      final Color value = Color(_prefs.getInt(ThemeService.keyPrimaryDark) ??
          ThemeService.defaultPrimaryDark.value);
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultPrimaryDark;
    }
  }

  /// Persists setting for primaryDark color, in example 5.
  @override
  Future<void> savePrimaryDark(Color value) async {
    try {
      await _prefs.setInt(ThemeService.keyPrimaryDark, value.value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads setting for primaryVariantDark color, in example 5.
  @override
  Future<Color> primaryVariantDark() async {
    try {
      final Color value = Color(
          _prefs.getInt(ThemeService.keyPrimaryVariantDark) ??
              ThemeService.defaultPrimaryVariantDark.value);
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultPrimaryVariantDark;
    }
  }

  /// Persists setting for primaryVariantDark color, in example 5.
  @override
  Future<void> savePrimaryVariantDark(Color value) async {
    try {
      await _prefs.setInt(ThemeService.keyPrimaryVariantDark, value.value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads setting for secondaryDark color, in example 5.
  @override
  Future<Color> secondaryDark() async {
    try {
      final Color value = Color(_prefs.getInt(ThemeService.keySecondaryDark) ??
          ThemeService.defaultSecondaryDark.value);
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultSecondaryDark;
    }
  }

  /// Persists setting for secondaryDark color, in example 5.
  @override
  Future<void> saveSecondaryDark(Color value) async {
    try {
      await _prefs.setInt(ThemeService.keySecondaryDark, value.value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads setting for secondaryVariantDark color, in example 5.
  @override
  Future<Color> secondaryVariantDark() async {
    try {
      final Color value = Color(
          _prefs.getInt(ThemeService.keySecondaryVariantDark) ??
              ThemeService.defaultSecondaryVariantDark.value);
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultSecondaryVariantDark;
    }
  }

  /// Persists setting for secondaryVariantDark color, in example 5.
  @override
  Future<void> saveSecondaryVariantDark(Color value) async {
    try {
      await _prefs.setInt(ThemeService.keySecondaryVariantDark, value.value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
