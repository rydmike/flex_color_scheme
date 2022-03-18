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

  // -------

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

  // -------

  /// Loads the advancedView setting used in examples 5.
  @override
  Future<bool> advancedView() async {
    try {
      final bool value = _prefs.getBool(ThemeService.keyAdvancedView) ??
          ThemeService.defaultAdvancedView;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultAdvancedView;
    }
  }

  /// Persists the saveAdvancedView setting used in examples 5.
  @override
  Future<void> saveAdvancedView(bool value) async {
    try {
      await _prefs.setBool(ThemeService.keyAdvancedView, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // -------

  /// Loads used viewIndex setting used in example 5.
  @override
  Future<int> viewIndex() async {
    try {
      final int value = _prefs.getInt(ThemeService.keyViewIndex) ??
          ThemeService.defaultViewIndex;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultViewIndex;
    }
  }

  /// Persists the used viewIndex setting used in examples 5.
  @override
  Future<void> saveViewIndex(int value) async {
    try {
      await _prefs.setInt(ThemeService.keyViewIndex, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // -------

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

  /// Loads used corner radius setting in example 5.
  ///
  /// Nullable, Negative value treated as null.
  @override
  Future<double?> cornerRadius() async {
    try {
      final double value =
          _prefs.getDouble(ThemeService.keyCornerRadius) ?? -1.0;
      if (value < 0.0) {
        return null;
      } else {
        return value;
      }
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultCornerRadius;
    }
  }

  /// Persists the used corner radius setting in example 5.
  ///
  /// Nullable, null stored as -1.0.
  @override
  Future<void> saveCornerRadius(double? value) async {
    try {
      await _prefs.setDouble(ThemeService.keyCornerRadius, value ?? -1.0);
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

  /// Loads used inputDecoratorSchemeColor setting in example 5.
  ///
  /// Nullable, out of range read enum index returned as null.
  @override
  Future<SchemeColor?> inputDecoratorSchemeColor() async {
    try {
      final int value =
          _prefs.getInt(ThemeService.keyInputDecoratorSchemeColor) ??
              ThemeService.defaultInputDecoratorSchemeColor?.index ??
              -1;
      if (value < 0 || value >= SchemeColor.values.length) {
        return null;
      } else {
        return SchemeColor.values[value];
      }
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultInputDecoratorSchemeColor;
    }
  }

  /// Persists used inputDecoratorSchemeColor setting in example 5.
  ///
  /// Nullable, null stored as -1.
  @override
  Future<void> saveInputDecoratorSchemeColor(SchemeColor? value) async {
    try {
      await _prefs.setInt(
          ThemeService.keyInputDecoratorSchemeColor, value?.index ?? -1);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used chipSchemeColor setting in example 5.
  ///
  /// Nullable, out of range read enum index returned as null.
  @override
  Future<SchemeColor?> chipSchemeColor() async {
    try {
      final int value = _prefs.getInt(ThemeService.keyChipSchemeColor) ??
          ThemeService.defaultChipSchemeColor?.index ??
          -1;
      if (value < 0 || value >= SchemeColor.values.length) {
        return null;
      } else {
        return SchemeColor.values[value];
      }
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultChipSchemeColor;
    }
  }

  /// Persists used chipSchemeColor setting in example 5.
  ///
  /// Nullable, null stored as -1.
  @override
  Future<void> saveChipSchemeColor(SchemeColor? value) async {
    try {
      await _prefs.setInt(ThemeService.keyChipSchemeColor, value?.index ?? -1);
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

  /// Loads used surface blend level dark setting in example 5.
  @override
  Future<int> blendLevelDark() async {
    try {
      final int value = _prefs.getInt(ThemeService.keyBlendLevelDark) ??
          ThemeService.defaultBlendLevelDark;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultBlendLevelDark;
    }
  }

  /// Persists the used surface blend level dark setting in example 5.
  @override
  Future<void> saveBlendLevelDark(int value) async {
    try {
      await _prefs.setInt(ThemeService.keyBlendLevelDark, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used onBlend level setting in example 5.
  @override
  Future<int> blendOnLevel() async {
    try {
      final int value = _prefs.getInt(ThemeService.keyOnBlendLevel) ??
          ThemeService.defaultBlendOnLevel;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultBlendOnLevel;
    }
  }

  /// Persists the used onBlend level setting in example 5.
  @override
  Future<void> saveBlendOnLevel(int value) async {
    try {
      await _prefs.setInt(ThemeService.keyOnBlendLevel, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used Blend On level dark setting in example 5.
  @override
  Future<int> blendOnLevelDark() async {
    try {
      final int value = _prefs.getInt(ThemeService.keyBlendOnLevelDark) ??
          ThemeService.defaultBlendOnLevelDark;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultBlendOnLevelDark;
    }
  }

  /// Persists the blend On level setting in example 5.
  @override
  Future<void> saveBlendOnLevelDark(int value) async {
    try {
      await _prefs.setInt(ThemeService.keyBlendOnLevelDark, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads usedColors setting in example 5.
  @override
  Future<int> usedColors() async {
    try {
      final int value = _prefs.getInt(ThemeService.keyUsedColors) ??
          ThemeService.defaultUsedColors;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultUsedColors;
    }
  }

  /// Persists the used surface blend level setting in example 5.
  @override
  Future<void> saveUsedColors(int value) async {
    try {
      await _prefs.setInt(ThemeService.keyUsedColors, value);
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

  /// Loads used popup menu opacity setting in example 5.
  @override
  Future<double> popupMenuOpacity() async {
    try {
      final double value = _prefs.getDouble(ThemeService.keyPopupMenuOpacity) ??
          ThemeService.defaultPopupMenuOpacity;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultPopupMenuOpacity;
    }
  }

  /// Persists the used popup menu opacity setting in example 5.
  @override
  Future<void> savePopupMenuOpacity(double value) async {
    try {
      await _prefs.setDouble(ThemeService.keyPopupMenuOpacity, value);
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

  /// Loads used navBarHighlight setting in example 5.
  ///
  /// Nullable, out of range read enum index returned as null.
  @override
  Future<SchemeColor?> navBarHighlight() async {
    try {
      final int value = _prefs.getInt(ThemeService.keyNavBarHighlight) ??
          ThemeService.defaultNavBarHighlight.index;
      if (value < 0 || value >= SchemeColor.values.length) {
        return null;
      } else {
        return SchemeColor.values[value];
      }
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultNavBarHighlight;
    }
  }

  /// Persists used navBarHighlight setting in example 5.
  ///
  /// Nullable, null stored as -1.
  @override
  Future<void> saveNavBarHighlight(SchemeColor? value) async {
    try {
      await _prefs.setInt(ThemeService.keyNavBarHighlight, value?.index ?? -1);
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

  /// Loads used navBarScheme setting in example 5.
  ///
  /// Nullable, out of range read enum index returned as null.
  @override
  Future<SchemeColor?> navSelectedSchemeColor() async {
    try {
      final int value = _prefs.getInt(ThemeService.keyNavSelectedSchemeColor) ??
          ThemeService.defaultNavSelectedSchemeColor.index;
      if (value < 0 || value >= SchemeColor.values.length) {
        return null;
      } else {
        return SchemeColor.values[value];
      }
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultNavSelectedSchemeColor;
    }
  }

  /// Persists used navBarScheme setting in example 5.
  ///
  /// Nullable, null stored as -1.
  @override
  Future<void> saveNavSelectedSchemeColor(SchemeColor? value) async {
    try {
      await _prefs.setInt(
          ThemeService.keyNavSelectedSchemeColor, value?.index ?? -1);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used tabBarIndicator setting in example 5.
  ///
  /// Nullable, out of range read enum index returned as null.
  @override
  Future<SchemeColor?> tabBarIndicator() async {
    try {
      final int value = _prefs.getInt(ThemeService.keyTabBarIndicator) ??
          ThemeService.defaultTabBarIndicator?.index ??
          -1;
      if (value < 0 || value >= SchemeColor.values.length) {
        return null;
      } else {
        return SchemeColor.values[value];
      }
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultTabBarIndicator;
    }
  }

  /// Persists used tabBarIndicator setting in example 5.
  ///
  /// Nullable, null stored as -1.
  @override
  Future<void> saveTabBarIndicator(SchemeColor? value) async {
    try {
      await _prefs.setInt(ThemeService.keyTabBarIndicator, value?.index ?? -1);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used navBarMuteUnselected setting in example 5.
  @override
  Future<bool> navBarMuteUnselected() async {
    try {
      final bool value = _prefs.getBool(ThemeService.keyNavBarMuteUnselected) ??
          ThemeService.defaultNavBarMuteUnselected;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultNavBarMuteUnselected;
    }
  }

  /// Persists navBarMuteUnselected setting in example 5.
  @override
  Future<void> saveNavBarMuteUnselected(bool value) async {
    try {
      await _prefs.setBool(ThemeService.keyNavBarMuteUnselected, value);
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

  /// Loads setting for primaryContainerLight color, in example 5.
  @override
  Future<Color> primaryContainerLight() async {
    try {
      final Color value = Color(
          _prefs.getInt(ThemeService.keyPrimaryContainerLight) ??
              ThemeService.defaultPrimaryContainerLight.value);
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultPrimaryContainerLight;
    }
  }

  /// Persists setting for primaryContainerLight color, in example 5.
  @override
  Future<void> savePrimaryContainerLight(Color value) async {
    try {
      await _prefs.setInt(ThemeService.keyPrimaryContainerLight, value.value);
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

  /// Loads setting for secondaryContainerLight color, in example 5.
  @override
  Future<Color> secondaryContainerLight() async {
    try {
      final Color value = Color(
          _prefs.getInt(ThemeService.keySecondaryContainerLight) ??
              ThemeService.defaultSecondaryContainerLight.value);
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultSecondaryContainerLight;
    }
  }

  /// Persists setting for secondaryContainerLight color, in example 5.
  @override
  Future<void> saveSecondaryContainerLight(Color value) async {
    try {
      await _prefs.setInt(ThemeService.keySecondaryContainerLight, value.value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads setting for tertiaryLight color, in example 5.
  @override
  Future<Color> tertiaryLight() async {
    try {
      final Color value = Color(_prefs.getInt(ThemeService.keyTertiaryLight) ??
          ThemeService.defaultTertiaryLight.value);
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultTertiaryLight;
    }
  }

  /// Persists setting for tertiaryLight color, in example 5.
  @override
  Future<void> saveTertiaryLight(Color value) async {
    try {
      await _prefs.setInt(ThemeService.keyTertiaryLight, value.value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads setting for tertiaryContainerLight color, in example 5.
  @override
  Future<Color> tertiaryContainerLight() async {
    try {
      final Color value = Color(
          _prefs.getInt(ThemeService.keyTertiaryContainerLight) ??
              ThemeService.defaultTertiaryContainerLight.value);
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultTertiaryContainerLight;
    }
  }

  /// Persists setting for tertiaryContainerLight color, in example 5.
  @override
  Future<void> saveTertiaryContainerLight(Color value) async {
    try {
      await _prefs.setInt(ThemeService.keyTertiaryContainerLight, value.value);
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

  /// Loads setting for primaryContainerDark color, in example 5.
  @override
  Future<Color> primaryContainerDark() async {
    try {
      final Color value = Color(
          _prefs.getInt(ThemeService.keyPrimaryContainerDark) ??
              ThemeService.defaultPrimaryContainerDark.value);
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultPrimaryContainerDark;
    }
  }

  /// Persists setting for primaryContainerDark color, in example 5.
  @override
  Future<void> savePrimaryContainerDark(Color value) async {
    try {
      await _prefs.setInt(ThemeService.keyPrimaryContainerDark, value.value);
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

  /// Loads setting for secondaryContainerDark color, in example 5.
  @override
  Future<Color> secondaryContainerDark() async {
    try {
      final Color value = Color(
          _prefs.getInt(ThemeService.keySecondaryContainerDark) ??
              ThemeService.defaultSecondaryContainerDark.value);
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultSecondaryContainerDark;
    }
  }

  /// Persists setting for secondaryContainerDark color, in example 5.
  @override
  Future<void> saveSecondaryContainerDark(Color value) async {
    try {
      await _prefs.setInt(ThemeService.keySecondaryContainerDark, value.value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads setting for tertiaryDark color, in example 5.
  @override
  Future<Color> tertiaryDark() async {
    try {
      final Color value = Color(_prefs.getInt(ThemeService.keyTertiaryDark) ??
          ThemeService.defaultTertiaryDark.value);
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultTertiaryDark;
    }
  }

  /// Persists setting for tertiaryDark color, in example 5.
  @override
  Future<void> saveTertiaryDark(Color value) async {
    try {
      await _prefs.setInt(ThemeService.keyTertiaryDark, value.value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads setting for tertiaryContainerDark color, in example 5.
  @override
  Future<Color> tertiaryContainerDark() async {
    try {
      final Color value = Color(
          _prefs.getInt(ThemeService.keyTertiaryContainerDark) ??
              ThemeService.defaultTertiaryContainerDark.value);
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultTertiaryContainerDark;
    }
  }

  /// Persists setting for tertiaryContainerDark color, in example 5.
  @override
  Future<void> saveTertiaryContainerDark(Color value) async {
    try {
      await _prefs.setInt(ThemeService.keyTertiaryContainerDark, value.value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // ********* Version 5 new config options

  // ----

  /// Loads used useMaterial3 setting in example 5.
  @override
  Future<bool> useMaterial3() async {
    try {
      final bool value = _prefs.getBool(ThemeService.keyUseMaterial3) ??
          ThemeService.defaultUseMaterial3;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultUseMaterial3;
    }
  }

  /// Persists useMaterial3 setting in example 5.
  @override
  Future<void> saveUseMaterial3(bool value) async {
    try {
      await _prefs.setBool(ThemeService.keyUseMaterial3, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // ----

  /// Loads used useKeyColors setting in example 5.
  @override
  Future<bool> useKeyColors() async {
    try {
      final bool value = _prefs.getBool(ThemeService.keyUseKeyColors) ??
          ThemeService.defaultUseKeyColors;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultUseKeyColors;
    }
  }

  /// Persists useKeyColors setting in example 5.
  @override
  Future<void> saveUseKeyColors(bool value) async {
    try {
      await _prefs.setBool(ThemeService.keyUseKeyColors, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // ----

  /// Loads used useSecondary setting in example 5.
  @override
  Future<bool> useSecondary() async {
    try {
      final bool value = _prefs.getBool(ThemeService.keyUseSecondary) ??
          ThemeService.defaultUseSecondary;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultUseSecondary;
    }
  }

  /// Persists useSecondary setting in example 5.
  @override
  Future<void> saveUseSecondary(bool value) async {
    try {
      await _prefs.setBool(ThemeService.keyUseSecondary, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // ----

  /// Loads used useTertiary setting in example 5.
  @override
  Future<bool> useTertiary() async {
    try {
      final bool value = _prefs.getBool(ThemeService.keyUseTertiary) ??
          ThemeService.defaultUseTertiary;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultUseTertiary;
    }
  }

  /// Persists useTertiary setting in example 5.
  @override
  Future<void> saveUseTertiary(bool value) async {
    try {
      await _prefs.setBool(ThemeService.keyUseTertiary, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // ----

  /// Loads used keepPrimary setting in example 5.
  @override
  Future<bool> keepPrimary() async {
    try {
      final bool value = _prefs.getBool(ThemeService.keyKeepPrimary) ??
          ThemeService.defaultKeepPrimary;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultKeepPrimary;
    }
  }

  /// Persists keepPrimary setting in example 5.
  @override
  Future<void> saveKeepPrimary(bool value) async {
    try {
      await _prefs.setBool(ThemeService.keyKeepPrimary, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // ----

  /// Loads used keepSecondary setting in example 5.
  @override
  Future<bool> keepSecondary() async {
    try {
      final bool value = _prefs.getBool(ThemeService.keyKeepSecondary) ??
          ThemeService.defaultKeepSecondary;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultKeepSecondary;
    }
  }

  /// Persists keepSecondary setting in example 5.
  @override
  Future<void> saveKeepSecondary(bool value) async {
    try {
      await _prefs.setBool(ThemeService.keyKeepSecondary, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // ----

  /// Loads used keepTertiary setting in example 5.
  @override
  Future<bool> keepTertiary() async {
    try {
      final bool value = _prefs.getBool(ThemeService.keyKeepTertiary) ??
          ThemeService.defaultKeepTertiary;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultKeepTertiary;
    }
  }

  /// Persists keepTertiary setting in example 5.
  @override
  Future<void> saveKeepTertiary(bool value) async {
    try {
      await _prefs.setBool(ThemeService.keyKeepTertiary, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // ----

  /// Loads used keepPrimaryContainer setting in example 5.
  @override
  Future<bool> keepPrimaryContainer() async {
    try {
      final bool value = _prefs.getBool(ThemeService.keyKeepPrimaryContainer) ??
          ThemeService.defaultKeepPrimaryContainer;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultKeepPrimaryContainer;
    }
  }

  /// Persists keepPrimaryContainer setting in example 5.
  @override
  Future<void> saveKeepPrimaryContainer(bool value) async {
    try {
      await _prefs.setBool(ThemeService.keyKeepPrimaryContainer, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // ----

  /// Loads used keepSecondaryContainer setting in example 5.
  @override
  Future<bool> keepSecondaryContainer() async {
    try {
      final bool value =
          _prefs.getBool(ThemeService.keyKeepSecondaryContainer) ??
              ThemeService.defaultKeepSecondaryContainer;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultKeepSecondaryContainer;
    }
  }

  /// Persists keepSecondaryContainer setting in example 5.
  @override
  Future<void> saveKeepSecondaryContainer(bool value) async {
    try {
      await _prefs.setBool(ThemeService.keyKeepSecondaryContainer, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // ----

  /// Loads used keepTertiaryContainer setting in example 5.
  @override
  Future<bool> keepTertiaryContainer() async {
    try {
      final bool value =
          _prefs.getBool(ThemeService.keyKeepTertiaryContainer) ??
              ThemeService.defaultKeepTertiaryContainer;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultKeepTertiaryContainer;
    }
  }

  /// Persists keepTertiaryContainer setting in example 5.
  @override
  Future<void> saveKeepTertiaryContainer(bool value) async {
    try {
      await _prefs.setBool(ThemeService.keyKeepTertiaryContainer, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // ----

  /// Loads used keepDarkPrimary setting in example 5.
  @override
  Future<bool> keepDarkPrimary() async {
    try {
      final bool value = _prefs.getBool(ThemeService.keyKeepDarkPrimary) ??
          ThemeService.defaultKeepDarkPrimary;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultKeepDarkPrimary;
    }
  }

  /// Persists keepDarkPrimary setting in example 5.
  @override
  Future<void> saveKeepDarkPrimary(bool value) async {
    try {
      await _prefs.setBool(ThemeService.keyKeepDarkPrimary, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // ----

  /// Loads used keepDarkSecondary setting in example 5.
  @override
  Future<bool> keepDarkSecondary() async {
    try {
      final bool value = _prefs.getBool(ThemeService.keyKeepDarkSecondary) ??
          ThemeService.defaultKeepDarkSecondary;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultKeepDarkSecondary;
    }
  }

  /// Persists keepDarkSecondary setting in example 5.
  @override
  Future<void> saveKeepDarkSecondary(bool value) async {
    try {
      await _prefs.setBool(ThemeService.keyKeepDarkSecondary, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // ----

  /// Loads used keepDarkTertiary setting in example 5.
  @override
  Future<bool> keepDarkTertiary() async {
    try {
      final bool value = _prefs.getBool(ThemeService.keyKeepDarkTertiary) ??
          ThemeService.defaultKeepDarkTertiary;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultKeepDarkTertiary;
    }
  }

  /// Persists keepDarkTertiary setting in example 5.
  @override
  Future<void> saveKeepDarkTertiary(bool value) async {
    try {
      await _prefs.setBool(ThemeService.keyKeepDarkTertiary, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // ----

  /// Loads used keepDarkPrimaryContainer setting in example 5.
  @override
  Future<bool> keepDarkPrimaryContainer() async {
    try {
      final bool value =
          _prefs.getBool(ThemeService.keyKeepDarkPrimaryContainer) ??
              ThemeService.defaultKeepDarkPrimaryContainer;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultKeepDarkPrimaryContainer;
    }
  }

  /// Persists keepDarkPrimaryContainer setting in example 5.
  @override
  Future<void> saveKeepDarkPrimaryContainer(bool value) async {
    try {
      await _prefs.setBool(ThemeService.keyKeepDarkPrimaryContainer, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // ----

  /// Loads used keepDarkSecondaryContainer setting in example 5.
  @override
  Future<bool> keepDarkSecondaryContainer() async {
    try {
      final bool value =
          _prefs.getBool(ThemeService.keyKeepDarkSecondaryContainer) ??
              ThemeService.defaultKeepDarkSecondaryContainer;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultKeepDarkSecondaryContainer;
    }
  }

  /// Persists keepDarkSecondaryContainer setting in example 5.
  @override
  Future<void> saveKeepDarkSecondaryContainer(bool value) async {
    try {
      await _prefs.setBool(ThemeService.keyKeepDarkSecondaryContainer, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // ----

  /// Loads used keepDarkTertiaryContainer setting in example 5.
  @override
  Future<bool> keepDarkTertiaryContainer() async {
    try {
      final bool value =
          _prefs.getBool(ThemeService.keyKeepDarkTertiaryContainer) ??
              ThemeService.defaultKeepDarkTertiaryContainer;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultKeepDarkTertiaryContainer;
    }
  }

  /// Persists keepDarkTertiaryContainer setting in example 5.
  @override
  Future<void> saveKeepDarkTertiaryContainer(bool value) async {
    try {
      await _prefs.setBool(ThemeService.keyKeepDarkTertiaryContainer, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // ----

  /// Loads used textButtonSchemeColor setting..
  ///
  /// Nullable, out of range read enum index returned as null.
  @override
  Future<SchemeColor?> textButtonSchemeColor() async {
    try {
      final int value = _prefs.getInt(ThemeService.keyTextButtonSchemeColor) ??
          ThemeService.defaultTextButtonSchemeColor?.index ??
          -1;
      if (value < 0 || value >= SchemeColor.values.length) {
        return null;
      } else {
        return SchemeColor.values[value];
      }
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultTextButtonSchemeColor;
    }
  }

  /// Persists used textButtonSchemeColor setting.
  ///
  /// Nullable, null stored as -1.
  @override
  Future<void> saveTextButtonSchemeColor(SchemeColor? value) async {
    try {
      await _prefs.setInt(
          ThemeService.keyTextButtonSchemeColor, value?.index ?? -1);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // ----

  /// Loads used elevatedButtonSchemeColor setting..
  ///
  /// Nullable, out of range read enum index returned as null.
  @override
  Future<SchemeColor?> elevatedButtonSchemeColor() async {
    try {
      final int value =
          _prefs.getInt(ThemeService.keyElevatedButtonSchemeColor) ??
              ThemeService.defaultElevatedButtonSchemeColor?.index ??
              -1;
      if (value < 0 || value >= SchemeColor.values.length) {
        return null;
      } else {
        return SchemeColor.values[value];
      }
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultElevatedButtonSchemeColor;
    }
  }

  /// Persists used elevatedButtonSchemeColor setting.
  ///
  /// Nullable, null stored as -1.
  @override
  Future<void> saveElevatedButtonSchemeColor(SchemeColor? value) async {
    try {
      await _prefs.setInt(
          ThemeService.keyElevatedButtonSchemeColor, value?.index ?? -1);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // ----

  /// Loads used outlinedButtonSchemeColor setting..
  ///
  /// Nullable, out of range read enum index returned as null.
  @override
  Future<SchemeColor?> outlinedButtonSchemeColor() async {
    try {
      final int value =
          _prefs.getInt(ThemeService.keyOutlinedButtonSchemeColor) ??
              ThemeService.defaultOutlinedButtonSchemeColor?.index ??
              -1;
      if (value < 0 || value >= SchemeColor.values.length) {
        return null;
      } else {
        return SchemeColor.values[value];
      }
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultOutlinedButtonSchemeColor;
    }
  }

  /// Persists used outlinedButtonSchemeColor setting.
  ///
  /// Nullable, null stored as -1.
  @override
  Future<void> saveOutlinedButtonSchemeColor(SchemeColor? value) async {
    try {
      await _prefs.setInt(
          ThemeService.keyOutlinedButtonSchemeColor, value?.index ?? -1);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // ----

  /// Loads used materialButtonSchemeColor setting..
  ///
  /// Nullable, out of range read enum index returned as null.
  @override
  Future<SchemeColor?> materialButtonSchemeColor() async {
    try {
      final int value =
          _prefs.getInt(ThemeService.keyMaterialButtonSchemeColor) ??
              ThemeService.defaultMaterialButtonSchemeColor?.index ??
              -1;
      if (value < 0 || value >= SchemeColor.values.length) {
        return null;
      } else {
        return SchemeColor.values[value];
      }
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultMaterialButtonSchemeColor;
    }
  }

  /// Persists used materialButtonSchemeColor setting.
  ///
  /// Nullable, null stored as -1.
  @override
  Future<void> saveMaterialButtonSchemeColor(SchemeColor? value) async {
    try {
      await _prefs.setInt(
          ThemeService.keyMaterialButtonSchemeColor, value?.index ?? -1);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // ----

  /// Loads used toggleButtonsSchemeColor setting..
  ///
  /// Nullable, out of range read enum index returned as null.
  @override
  Future<SchemeColor?> toggleButtonsSchemeColor() async {
    try {
      final int value =
          _prefs.getInt(ThemeService.keyToggleButtonsSchemeColor) ??
              ThemeService.defaultToggleButtonsSchemeColor?.index ??
              -1;
      if (value < 0 || value >= SchemeColor.values.length) {
        return null;
      } else {
        return SchemeColor.values[value];
      }
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultToggleButtonsSchemeColor;
    }
  }

  /// Persists used toggleButtonsSchemeColor setting.
  ///
  /// Nullable, null stored as -1.
  @override
  Future<void> saveToggleButtonsSchemeColor(SchemeColor? value) async {
    try {
      await _prefs.setInt(
          ThemeService.keyToggleButtonsSchemeColor, value?.index ?? -1);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // ----

  /// Loads used switchSchemeColor setting..
  ///
  /// Nullable, out of range read enum index returned as null.
  @override
  Future<SchemeColor?> switchSchemeColor() async {
    try {
      final int value = _prefs.getInt(ThemeService.keySwitchSchemeColor) ??
          ThemeService.defaultSwitchSchemeColor?.index ??
          -1;
      if (value < 0 || value >= SchemeColor.values.length) {
        return null;
      } else {
        return SchemeColor.values[value];
      }
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultSwitchSchemeColor;
    }
  }

  /// Persists used switchSchemeColor setting.
  ///
  /// Nullable, null stored as -1.
  @override
  Future<void> saveSwitchSchemeColor(SchemeColor? value) async {
    try {
      await _prefs.setInt(
          ThemeService.keySwitchSchemeColor, value?.index ?? -1);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // ----

  /// Loads used checkboxSchemeColor setting..
  ///
  /// Nullable, out of range read enum index returned as null.
  @override
  Future<SchemeColor?> checkboxSchemeColor() async {
    try {
      final int value = _prefs.getInt(ThemeService.keyCheckboxSchemeColor) ??
          ThemeService.defaultCheckboxSchemeColor?.index ??
          -1;
      if (value < 0 || value >= SchemeColor.values.length) {
        return null;
      } else {
        return SchemeColor.values[value];
      }
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultCheckboxSchemeColor;
    }
  }

  /// Persists used checkboxSchemeColor setting.
  ///
  /// Nullable, null stored as -1.
  @override
  Future<void> saveCheckboxSchemeColor(SchemeColor? value) async {
    try {
      await _prefs.setInt(
          ThemeService.keyCheckboxSchemeColor, value?.index ?? -1);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // ----

  /// Loads used radioSchemeColor setting..
  ///
  /// Nullable, out of range read enum index returned as null.
  @override
  Future<SchemeColor?> radioSchemeColor() async {
    try {
      final int value = _prefs.getInt(ThemeService.keyRadioSchemeColor) ??
          ThemeService.defaultRadioSchemeColor?.index ??
          -1;
      if (value < 0 || value >= SchemeColor.values.length) {
        return null;
      } else {
        return SchemeColor.values[value];
      }
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultRadioSchemeColor;
    }
  }

  /// Persists used radioSchemeColor setting.
  ///
  /// Nullable, null stored as -1.
  @override
  Future<void> saveRadioSchemeColor(SchemeColor? value) async {
    try {
      await _prefs.setInt(ThemeService.keyRadioSchemeColor, value?.index ?? -1);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // ----

  /// Loads used dialogBackgroundSchemeColor setting..
  ///
  /// Nullable, out of range read enum index returned as null.
  @override
  Future<SchemeColor?> dialogBackgroundSchemeColor() async {
    try {
      final int value =
          _prefs.getInt(ThemeService.keyDialogBackgroundSchemeColor) ??
              ThemeService.defaultDialogBackgroundSchemeColor.index;
      if (value < 0 || value >= SchemeColor.values.length) {
        return null;
      } else {
        return SchemeColor.values[value];
      }
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultDialogBackgroundSchemeColor;
    }
  }

  /// Persists used dialogBackgroundSchemeColor setting.
  ///
  /// Nullable, null stored as -1.
  @override
  Future<void> saveDialogBackgroundSchemeColor(SchemeColor? value) async {
    try {
      await _prefs.setInt(
          ThemeService.keyDialogBackgroundSchemeColor, value?.index ?? -1);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // ----

  /// Loads used tabBarItemSchemeColor setting..
  ///
  /// Nullable, out of range read enum index returned as null.
  @override
  Future<SchemeColor?> tabBarItemSchemeColor() async {
    try {
      final int value = _prefs.getInt(ThemeService.keyTabBarItemSchemeColor) ??
          ThemeService.defaultTabBarItemSchemeColor?.index ??
          -1;
      if (value < 0 || value >= SchemeColor.values.length) {
        return null;
      } else {
        return SchemeColor.values[value];
      }
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultTabBarItemSchemeColor;
    }
  }

  /// Persists used tabBarItemSchemeColor setting.
  ///
  /// Nullable, null stored as -1.
  @override
  Future<void> saveTabBarItemSchemeColor(SchemeColor? value) async {
    try {
      await _prefs.setInt(
          ThemeService.keyTabBarItemSchemeColor, value?.index ?? -1);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // ----

  /// Loads used appBarBackgroundSchemeColor setting..
  ///
  /// Nullable, out of range read enum index returned as null.
  @override
  Future<SchemeColor?> appBarBackgroundSchemeColor() async {
    try {
      final int value =
          _prefs.getInt(ThemeService.keyAppBarBackgroundSchemeColor) ??
              ThemeService.defaultAppBarBackgroundSchemeColor?.index ??
              -1;
      if (value < 0 || value >= SchemeColor.values.length) {
        return null;
      } else {
        return SchemeColor.values[value];
      }
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultAppBarBackgroundSchemeColor;
    }
  }

  /// Persists used appBarBackgroundSchemeColor setting.
  ///
  /// Nullable, null stored as -1.
  @override
  Future<void> saveAppBarBackgroundSchemeColor(SchemeColor? value) async {
    try {
      await _prefs.setInt(
          ThemeService.keyAppBarBackgroundSchemeColor, value?.index ?? -1);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // ----

  /// Loads used fabSchemeColor setting..
  ///
  /// Nullable, out of range read enum index returned as null.
  @override
  Future<SchemeColor?> fabSchemeColor() async {
    try {
      final int value = _prefs.getInt(ThemeService.keyFabSchemeColor) ??
          ThemeService.defaultFabSchemeColor?.index ??
          -1;
      if (value < 0 || value >= SchemeColor.values.length) {
        return null;
      } else {
        return SchemeColor.values[value];
      }
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultFabSchemeColor;
    }
  }

  /// Persists used fabSchemeColor setting.
  ///
  /// Nullable, null stored as -1.
  @override
  Future<void> saveFabSchemeColor(SchemeColor? value) async {
    try {
      await _prefs.setInt(ThemeService.keyFabSchemeColor, value?.index ?? -1);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // ----

  /// Loads used snackBarSchemeColor setting..
  ///
  /// Nullable, out of range read enum index returned as null.
  @override
  Future<SchemeColor?> snackBarSchemeColor() async {
    try {
      final int value = _prefs.getInt(ThemeService.keySnackBarSchemeColor) ??
          ThemeService.defaultSnackBarSchemeColor?.index ??
          -1;
      if (value < 0 || value >= SchemeColor.values.length) {
        return null;
      } else {
        return SchemeColor.values[value];
      }
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultSnackBarSchemeColor;
    }
  }

  /// Persists used snackBarSchemeColor setting.
  ///
  /// Nullable, null stored as -1.
  @override
  Future<void> saveSnackBarSchemeColor(SchemeColor? value) async {
    try {
      await _prefs.setInt(
          ThemeService.keySnackBarSchemeColor, value?.index ?? -1);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // ----

  /// Loads used navBarBackgroundSchemeColor setting..
  ///
  /// Nullable, out of range read enum index returned as null.
  @override
  Future<SchemeColor?> navBarBackgroundSchemeColor() async {
    try {
      final int value =
          _prefs.getInt(ThemeService.keyNavBarBackgroundSchemeColor) ??
              ThemeService.defaultNavBarBackgroundSchemeColor.index;
      if (value < 0 || value >= SchemeColor.values.length) {
        return null;
      } else {
        return SchemeColor.values[value];
      }
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultNavBarBackgroundSchemeColor;
    }
  }

  /// Persists used navBarBackgroundSchemeColor setting.
  ///
  /// Nullable, null stored as -1.
  @override
  Future<void> saveNavBarBackgroundSchemeColor(SchemeColor? value) async {
    try {
      await _prefs.setInt(
          ThemeService.keyNavBarBackgroundSchemeColor, value?.index ?? -1);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // ----

  /// Loads used unselectedIsColored setting in example 5.
  @override
  Future<bool> unselectedIsColored() async {
    try {
      final bool value = _prefs.getBool(ThemeService.keyUnselectedIsColored) ??
          ThemeService.defaultUnselectedIsColored;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultUnselectedIsColored;
    }
  }

  /// Persists unselectedIsColored setting in example 5.
  @override
  Future<void> saveUnselectedIsColored(bool value) async {
    try {
      await _prefs.setBool(ThemeService.keyUnselectedIsColored, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // ----

  /// Loads usedFlexToneSetup setting in example 5.
  @override
  Future<int> usedFlexToneSetup() async {
    try {
      final int value = _prefs.getInt(ThemeService.keyUsedFlexToneSetup) ??
          ThemeService.defaultUsedFlexToneSetup;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultUsedFlexToneSetup;
    }
  }

  /// Persists the usedFlexToneSetup setting in example 5.
  @override
  Future<void> saveUsedFlexToneSetup(int value) async {
    try {
      await _prefs.setInt(ThemeService.keyUsedFlexToneSetup, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used useIndicator setting in example 5.
  @override
  Future<bool> useIndicator() async {
    try {
      final bool value = _prefs.getBool(ThemeService.keyUseIndicator) ??
          ThemeService.defaultUseIndicator;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultUseIndicator;
    }
  }

  /// Persists useIndicator setting in example 5.
  @override
  Future<void> saveUseIndicator(bool value) async {
    try {
      await _prefs.setBool(ThemeService.keyUseIndicator, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // ----

  /// Loads used navUnselectedSchemeColor setting..
  ///
  /// Nullable, out of range read enum index returned as null.
  @override
  Future<SchemeColor?> navUnselectedSchemeColor() async {
    try {
      final int value =
          _prefs.getInt(ThemeService.keyNavUnselectedSchemeColor) ??
              ThemeService.defaultNavUnselectedSchemeColor.index;
      if (value < 0 || value >= SchemeColor.values.length) {
        return null;
      } else {
        return SchemeColor.values[value];
      }
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultNavUnselectedSchemeColor;
    }
  }

  /// Persists used navUnselectedSchemeColor setting.
  ///
  /// Nullable, null stored as -1.
  @override
  Future<void> saveNavUnselectedSchemeColor(SchemeColor? value) async {
    try {
      await _prefs.setInt(
          ThemeService.keyNavUnselectedSchemeColor, value?.index ?? -1);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // ----

  /// Loads used useM3ErrorColor setting in example 5.
  @override
  Future<bool> useM3ErrorColors() async {
    try {
      final bool value = _prefs.getBool(ThemeService.keyUseM3ErrorColors) ??
          ThemeService.defaultUseM3ErrorColors;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultUseM3ErrorColors;
    }
  }

  /// Persists useM3ErrorColor setting in example 5.
  @override
  Future<void> saveUseM3ErrorColors(bool value) async {
    try {
      await _prefs.setBool(ThemeService.keyUseM3ErrorColors, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // ----

  /// Loads used useM3ErrorColor setting in example 5.
  @override
  Future<bool> bottomNavShowSelectedLabels() async {
    try {
      final bool value =
          _prefs.getBool(ThemeService.keyBottomNavShowSelectedLabels) ??
              ThemeService.defaultBottomNavShowSelectedLabels;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultBottomNavShowSelectedLabels;
    }
  }

  /// Persists useM3ErrorColor setting in example 5.
  @override
  Future<void> saveBottomNavShowSelectedLabels(bool value) async {
    try {
      await _prefs.setBool(ThemeService.keyBottomNavShowSelectedLabels, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // ----

  /// Loads used useM3ErrorColor setting in example 5.
  @override
  Future<bool> bottomNavShowUnselectedLabels() async {
    try {
      final bool value =
          _prefs.getBool(ThemeService.keyBottomNavShowUnselectedLabels) ??
              ThemeService.defaultBottomNavShowUnselectedLabels;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultBottomNavShowUnselectedLabels;
    }
  }

  /// Persists useM3ErrorColor setting in example 5.
  @override
  Future<void> saveBottomNavShowUnselectedLabels(bool value) async {
    try {
      await _prefs.setBool(
          ThemeService.keyBottomNavShowUnselectedLabels, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // ----

  /// Loads used navBarLabelBehavior setting.
  @override
  Future<NavigationDestinationLabelBehavior> navBarLabelBehavior() async {
    try {
      final int value = _prefs.getInt(ThemeService.keyNavBarLabelBehavior) ??
          ThemeService.defaultNavBarLabelBehavior.index;
      return NavigationDestinationLabelBehavior.values[value];
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultNavBarLabelBehavior;
    }
  }

  /// Persists used navBarLabelBehavior setting.
  @override
  Future<void> saveNavBarLabelBehavior(
      NavigationDestinationLabelBehavior value) async {
    try {
      await _prefs.setInt(ThemeService.keyNavBarLabelBehavior, value.index);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // ----

  /// Loads used navRailLabelType setting.
  @override
  Future<NavigationRailLabelType> navRailLabelType() async {
    try {
      final int value = _prefs.getInt(ThemeService.keyNavRailLabelType) ??
          ThemeService.defaultNavRailLabelType.index;
      return NavigationRailLabelType.values[value];
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultNavRailLabelType;
    }
  }

  /// Persists used navRailLabelType setting.
  @override
  Future<void> saveNavRailLabelType(NavigationRailLabelType value) async {
    try {
      await _prefs.setInt(ThemeService.keyNavRailLabelType, value.index);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // ----

  /// Loads used elevatedButtonBorderRadius setting.
  ///
  /// Nullable, Negative value treated as null.
  @override
  Future<double?> elevatedButtonBorderRadius() async {
    try {
      final double value =
          _prefs.getDouble(ThemeService.keyElevatedButtonBorderRadius) ?? -1.0;
      if (value < 0.0) {
        return null;
      } else {
        return value;
      }
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultElevatedButtonBorderRadius;
    }
  }

  /// Persists used elevatedButtonBorderRadius setting.
  ///
  /// Nullable, null stored as -1.0.
  @override
  Future<void> saveElevatedButtonBorderRadius(double? value) async {
    try {
      await _prefs.setDouble(
          ThemeService.keyElevatedButtonBorderRadius, value ?? -1.0);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // ----

  /// Loads used outlinedButtonBorderRadius setting.
  ///
  /// Nullable, Negative value treated as null.
  @override
  Future<double?> outlinedButtonBorderRadius() async {
    try {
      final double value =
          _prefs.getDouble(ThemeService.keyOutlinedButtonBorderRadius) ?? -1.0;
      if (value < 0.0) {
        return null;
      } else {
        return value;
      }
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultOutlinedButtonBorderRadius;
    }
  }

  /// Persists used outlinedButtonBorderRadius setting.
  ///
  /// Nullable, null stored as -1.0.
  @override
  Future<void> saveOutlinedButtonBorderRadius(double? value) async {
    try {
      await _prefs.setDouble(
          ThemeService.keyOutlinedButtonBorderRadius, value ?? -1.0);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // ----

  /// Loads used textButtonBorderRadius setting.
  ///
  /// Nullable, Negative value treated as null.
  @override
  Future<double?> textButtonBorderRadius() async {
    try {
      final double value =
          _prefs.getDouble(ThemeService.keyTextButtonBorderRadius) ?? -1.0;
      if (value < 0.0) {
        return null;
      } else {
        return value;
      }
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultTextButtonBorderRadius;
    }
  }

  /// Persists used textButtonBorderRadius setting.
  ///
  /// Nullable, null stored as -1.0.
  @override
  Future<void> saveTextButtonBorderRadius(double? value) async {
    try {
      await _prefs.setDouble(
          ThemeService.keyTextButtonBorderRadius, value ?? -1.0);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // ----

  /// Loads used toggleButtonsBorderRadius setting.
  ///
  /// Nullable, Negative value treated as null.
  @override
  Future<double?> toggleButtonsBorderRadius() async {
    try {
      final double value =
          _prefs.getDouble(ThemeService.keyToggleButtonsBorderRadius) ?? -1.0;
      if (value < 0.0) {
        return null;
      } else {
        return value;
      }
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultToggleButtonsBorderRadius;
    }
  }

  /// Persists used toggleButtonsBorderRadius setting.
  ///
  /// Nullable, null stored as -1.0.
  @override
  Future<void> saveToggleButtonsBorderRadius(double? value) async {
    try {
      await _prefs.setDouble(
          ThemeService.keyToggleButtonsBorderRadius, value ?? -1.0);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // ----

  /// Loads used cardBorderRadius setting.
  ///
  /// Nullable, Negative value treated as null.
  @override
  Future<double?> cardBorderRadius() async {
    try {
      final double value =
          _prefs.getDouble(ThemeService.keyCardBorderRadius) ?? -1.0;
      if (value < 0.0) {
        return null;
      } else {
        return value;
      }
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultCardBorderRadius;
    }
  }

  /// Persists used cardBorderRadius setting.
  ///
  /// Nullable, null stored as -1.0.
  @override
  Future<void> saveCardBorderRadius(double? value) async {
    try {
      await _prefs.setDouble(ThemeService.keyCardBorderRadius, value ?? -1.0);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // ----

  /// Loads used app bar opacity setting in example 5.
  @override
  Future<double> sysBarOpacity() async {
    try {
      final double value = _prefs.getDouble(ThemeService.keySysBarOpacity) ??
          ThemeService.defaultSysBarOpacity;
      return value;
    } catch (e) {
      debugPrint(e.toString());
      return ThemeService.defaultSysBarOpacity;
    }
  }

  /// Persists the used app bar opacity setting in example 5.
  @override
  Future<void> saveSysBarOpacity(double value) async {
    try {
      await _prefs.setDouble(ThemeService.keySysBarOpacity, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
