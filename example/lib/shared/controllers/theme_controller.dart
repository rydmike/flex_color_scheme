import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../services/theme_service.dart';

/// The ThemeController is used by many Widgets that users can interact with.
/// Widgets can read user theme settings, save user theme settings and listen
/// to user's theme changes.
///
/// The controller glues data Services to Flutter Widgets. The ThemeController
/// uses the ThemeService to save and load theme settings.
///
// ignore:prefer_mixin
class ThemeController with ChangeNotifier {
  ThemeController(this._themeService);

  // Make the ThemeService private so it cannot be used directly.
  final ThemeService _themeService;

  /// Load all ThemeController settings from the ThemeService. It may load from
  /// app defaults, a local database or the internet. The controller only knows
  /// it can load all the settings from the service.
  Future<void> loadAll() async {
    _themeMode = await _themeService.themeMode();
    _useSubThemes = await _themeService.useSubThemes();
    _useTextTheme = await _themeService.useTextTheme();
    _usedScheme = await _themeService.usedScheme();
    _schemeIndex = await _themeService.schemeIndex();
    _themedEffects = await _themeService.interactionEffects();
    _useDefaultRadius = await _themeService.useDefaultRadius();
    _cornerRadius = await _themeService.cornerRadius();
    _inputDecoratorIsFilled = await _themeService.inputDecoratorIsFilled();
    _inputDecoratorBorderType = await _themeService.inputDecoratorBorderType();
    _inputDecoratorUnfocusedHasBorder =
        await _themeService.inputDecoratorUnfocusedHasBorder();
    _surfaceMode = await _themeService.surfaceMode();
    _blendLevel = await _themeService.blendLevel();
    _lightAppBarStyle = await _themeService.lightAppBarStyle();
    _darkAppBarStyle = await _themeService.darkAppBarStyle();
    _appBarOpacity = await _themeService.appBarOpacity();
    _appBarElevation = await _themeService.appBarElevation();
    _transparentStatusBar = await _themeService.transparentStatusBar();
    _tabBarStyle = await _themeService.tabBarStyle();
    _bottomNavigationBarOpacity =
        await _themeService.bottomNavigationBarOpacity();
    _bottomNavigationBarElevation =
        await _themeService.bottomNavigationBarElevation();
    _tooltipsMatchBackground = await _themeService.tooltipsMatchBackground();
    _swapLightColors = await _themeService.swapLightColors();
    _swapDarkColors = await _themeService.swapDarkColors();
    _darkIsTrueBlack = await _themeService.darkIsTrueBlack();
    _useToDarkMethod = await _themeService.useToDarkMethod();
    _darkMethodLevel = await _themeService.darkMethodLevel();
    _useFlexColorScheme = await _themeService.useFlexColorScheme();

    _blendLightOnColors = await _themeService.blendLightOnColors();
    _blendDarkOnColors = await _themeService.blendDarkOnColors();
    _blendLightTextTheme = await _themeService.blendLightTextTheme();
    _blendDarkTextTheme = await _themeService.blendDarkTextTheme();
    _fabUseShape = await _themeService.fabUseShape();

    // Not using the ThemeService just a local toggle for platform, resets
    // to actual default platform when settings are loaded.
    _platform = defaultTargetPlatform;

    notifyListeners();
  }

  /// Reset all values to default and save as current settings.
  ///
  /// Calls setters with notify = false, and just calls notifyListeners, once
  /// after all values have been reset and persisted.
  Future<void> resetAllToDefaults() async {
    await setThemeMode(ThemeService.defaultThemeMode, false);
    await setUseSubThemes(ThemeService.defaultUseSubThemes, false);
    await setUseTextTheme(ThemeService.defaultUseTextTheme, false);
    await setUsedScheme(ThemeService.defaultUsedScheme, false);
    await setSchemeIndex(ThemeService.defaultSchemeIndex, false);
    await setInteractionEffects(ThemeService.defaultInteractionEffects, false);
    await setUseDefaultRadius(ThemeService.defaultUseDefaultRadius, false);
    await setCornerRadius(ThemeService.defaultCornerRadius, false);
    await setInputDecoratorIsFilled(
        ThemeService.defaultInputDecoratorIsFilled, false);
    await setInputDecoratorBorderType(
        ThemeService.defaultInputDecoratorBorderType, false);
    await setInputDecoratorUnfocusedHasBorder(
        ThemeService.defaultInputDecoratorUnfocusedHasBorder, false);
    await setSurfaceMode(ThemeService.defaultSurfaceMode, false);
    await setBlendLevel(ThemeService.defaultBlendLevel, false);
    await setLightAppBarStyle(ThemeService.defaultLightAppBarStyle, false);
    await setDarkAppBarStyle(ThemeService.defaultDarkAppBarStyle, false);
    await setAppBarOpacity(ThemeService.defaultAppBarOpacity, false);
    await setAppBarElevation(ThemeService.defaultAppBarElevation, false);
    await setTransparentStatusBar(
        ThemeService.defaultTransparentStatusBar, false);
    await setTabBarStyle(ThemeService.defaultTabBarStyle, false);
    await setBottomNavigationBarOpacity(
        ThemeService.defaultBottomNavigationBarOpacity, false);
    await setBottomNavigationBarElevation(
        ThemeService.defaultBottomNavigationBarElevation, false);
    await setTooltipsMatchBackground(
        ThemeService.defaultTooltipsMatchBackground, false);
    await setSwapLightColors(ThemeService.defaultSwapLightColors, false);
    await setSwapDarkColors(ThemeService.defaultSwapDarkColors, false);
    await setDarkIsTrueBlack(ThemeService.defaultDarkIsTrueBlack, false);
    await setUseToDarkMethod(ThemeService.defaultUseToDarkMethod, false);
    await setDarkMethodLevel(ThemeService.defaultDarkMethodLevel, false);
    await setUseFlexColorScheme(ThemeService.defaultUseFlexColorScheme, false);

    await setBlendLightOnColors(ThemeService.defaultBlendLightOnColors, false);
    await setBlendDarkOnColors(ThemeService.defaultBlendDarkOnColors, false);
    await setBlendLightTextTheme(
        ThemeService.defaultBlendLightTextTheme, false);
    await setBlendDarkTextTheme(ThemeService.defaultBlendDarkTextTheme, false);
    await setFabUseShape(ThemeService.defaultFabUseShape, false);

    // Not using ThemeService, just a locally controlled toggle
    await setPlatform(defaultTargetPlatform, false);

    notifyListeners();
  }

  // Make all ThemeController properties private so they cannot be saved
  // directly without also persisting the changes with the ThemeService,
  // by making a setter and getter for each property.

  // Private value, getter and setter for the ThemeMode
  late ThemeMode _themeMode;

  /// Getter for the current ThemeMode.
  ThemeMode get themeMode => _themeMode;

  /// Set and persist new ThemeMode value.
  Future<void> setThemeMode(ThemeMode? value, [bool notify = true]) async {
    // No work if null value passed.
    if (value == null) return;
    // Do not perform any work if new and old value are identical.
    if (value == _themeMode) return;
    // Otherwise, assign new value to private property.
    _themeMode = value;
    // Inform all listeners a change has occurred, if notify flag true.
    if (notify) notifyListeners();
    // Persist the change to whatever storage is used with the ThemeService.
    await _themeService.saveThemeMode(value);
  }

  // Repeat above pattern for all other theme settings. The properties will
  // not be further explained, property names correspond to equivalent
  // FlexColorScheme properties.
  late bool _useSubThemes;
  bool get useSubThemes => _useSubThemes;
  Future<void> setUseSubThemes(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _useSubThemes) return;
    _useSubThemes = value;
    if (notify) notifyListeners();
    await _themeService.saveUseSubThemes(value);
  }

  late bool _useTextTheme;
  bool get useTextTheme => _useTextTheme;
  Future<void> setUseTextTheme(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _useTextTheme) return;
    _useTextTheme = value;
    if (notify) notifyListeners();
    await _themeService.saveUseTextTheme(value);
  }

  late FlexScheme _usedScheme;
  FlexScheme get usedScheme => _usedScheme;
  Future<void> setUsedScheme(FlexScheme? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _usedScheme) return;
    _usedScheme = value;
    if (notify) notifyListeners();
    await _themeService.saveUsedScheme(value);
  }

  late int _schemeIndex;
  int get schemeIndex => _schemeIndex;
  Future<void> setSchemeIndex(int? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _schemeIndex) return;
    _schemeIndex = value;
    notifyListeners();
    await _themeService.saveSchemeIndex(value);
  }

  late FlexSurfaceMode _surfaceMode;
  FlexSurfaceMode get surfaceMode => _surfaceMode;
  Future<void> setSurfaceMode(FlexSurfaceMode? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _surfaceMode) return;
    _surfaceMode = value;
    if (notify) notifyListeners();
    await _themeService.saveSurfaceMode(value);
  }

  late int _blendLevel;
  int get blendLevel => _blendLevel;
  Future<void> setBlendLevel(int? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _blendLevel) return;
    _blendLevel = value;
    if (notify) notifyListeners();
    await _themeService.saveBlendLevel(value);
  }

  late bool _themedEffects;
  bool get themedEffects => _themedEffects;
  Future<void> setInteractionEffects(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _themedEffects) return;
    _themedEffects = value;
    if (notify) notifyListeners();
    await _themeService.saveInteractionEffects(value);
  }

  late bool _useDefaultRadius;
  bool get useDefaultRadius => _useDefaultRadius;
  Future<void> setUseDefaultRadius(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _useDefaultRadius) return;
    _useDefaultRadius = value;
    if (notify) notifyListeners();
    await _themeService.saveUseDefaultRadius(value);
  }

  late double _cornerRadius;
  double get cornerRadius => _cornerRadius;
  Future<void> setCornerRadius(double? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _cornerRadius) return;
    _cornerRadius = value;
    if (notify) notifyListeners();
    await _themeService.saveCornerRadius(value);
  }

  late bool _inputDecoratorIsFilled;
  bool get inputDecoratorIsFilled => _inputDecoratorIsFilled;
  Future<void> setInputDecoratorIsFilled(bool? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _inputDecoratorIsFilled) return;
    _inputDecoratorIsFilled = value;
    if (notify) notifyListeners();
    await _themeService.saveInputDecoratorIsFilled(value);
  }

  late FlexInputBorderType _inputDecoratorBorderType;
  FlexInputBorderType get inputDecoratorIsOutlinedBorder =>
      _inputDecoratorBorderType;
  Future<void> setInputDecoratorBorderType(FlexInputBorderType? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _inputDecoratorBorderType) return;
    _inputDecoratorBorderType = value;
    if (notify) notifyListeners();
    await _themeService.saveInputDecoratorBorderType(value);
  }

  late bool _inputDecoratorUnfocusedHasBorder;
  bool get inputDecoratorUnfocusedHasBorder =>
      _inputDecoratorUnfocusedHasBorder;
  Future<void> setInputDecoratorUnfocusedHasBorder(bool? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _inputDecoratorUnfocusedHasBorder) return;
    _inputDecoratorUnfocusedHasBorder = value;
    if (notify) notifyListeners();
    await _themeService.saveInputDecoratorUnfocusedHasBorder(value);
  }

  late FlexAppBarStyle _lightAppBarStyle;
  FlexAppBarStyle get lightAppBarStyle => _lightAppBarStyle;
  Future<void> setLightAppBarStyle(FlexAppBarStyle? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _lightAppBarStyle) return;
    _lightAppBarStyle = value;
    if (notify) notifyListeners();
    await _themeService.saveLightAppBarStyle(value);
  }

  late FlexAppBarStyle _darkAppBarStyle;
  FlexAppBarStyle get darkAppBarStyle => _darkAppBarStyle;
  Future<void> setDarkAppBarStyle(FlexAppBarStyle? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _darkAppBarStyle) return;
    _darkAppBarStyle = value;
    if (notify) notifyListeners();
    await _themeService.saveDarkAppBarStyle(value);
  }

  late double _appBarOpacity;
  double get appBarOpacity => _appBarOpacity;
  Future<void> setAppBarOpacity(double? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _appBarOpacity) return;
    _appBarOpacity = value;
    if (notify) notifyListeners();
    await _themeService.saveAppBarOpacity(value);
  }

  late double _appBarElevation;
  double get appBarElevation => _appBarElevation;
  Future<void> setAppBarElevation(double? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _appBarElevation) return;
    _appBarElevation = value;
    if (notify) notifyListeners();
    await _themeService.saveAppBarElevation(value);
  }

  late bool _transparentStatusBar;
  bool get transparentStatusBar => _transparentStatusBar;
  Future<void> setTransparentStatusBar(bool? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _transparentStatusBar) return;
    _transparentStatusBar = value;
    if (notify) notifyListeners();
    await _themeService.saveTransparentStatusBar(value);
  }

  late FlexTabBarStyle _tabBarStyle;
  FlexTabBarStyle get tabBarStyle => _tabBarStyle;
  Future<void> setTabBarStyle(FlexTabBarStyle? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _tabBarStyle) return;
    _tabBarStyle = value;
    if (notify) notifyListeners();
    await _themeService.saveTabBarStyle(value);
  }

  late double _bottomNavigationBarOpacity;
  double get bottomNavigationBarOpacity => _bottomNavigationBarOpacity;
  Future<void> setBottomNavigationBarOpacity(double? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _bottomNavigationBarOpacity) return;
    _bottomNavigationBarOpacity = value;
    if (notify) notifyListeners();
    await _themeService.saveBottomNavigationBarOpacity(value);
  }

  late double _bottomNavigationBarElevation;
  double get bottomNavigationBarElevation => _bottomNavigationBarElevation;
  Future<void> setBottomNavigationBarElevation(double? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _bottomNavigationBarElevation) return;
    _bottomNavigationBarElevation = value;
    if (notify) notifyListeners();
    await _themeService.saveBottomNavigationBarElevation(value);
  }

  late bool _tooltipsMatchBackground;
  bool get tooltipsMatchBackground => _tooltipsMatchBackground;
  Future<void> setTooltipsMatchBackground(bool? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _tooltipsMatchBackground) return;
    _tooltipsMatchBackground = value;
    if (notify) notifyListeners();
    await _themeService.saveTooltipsMatchBackground(value);
  }

  late bool _swapLightColors;
  bool get swapLightColors => _swapLightColors;
  Future<void> setSwapLightColors(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _swapLightColors) return;
    _swapLightColors = value;
    if (notify) notifyListeners();
    await _themeService.saveSwapLightColors(value);
  }

  late bool _swapDarkColors;
  bool get swapDarkColors => _swapDarkColors;
  Future<void> setSwapDarkColors(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _swapDarkColors) return;
    _swapDarkColors = value;
    if (notify) notifyListeners();
    await _themeService.saveSwapDarkColors(value);
  }

  late bool _darkIsTrueBlack;
  bool get darkIsTrueBlack => _darkIsTrueBlack;
  Future<void> setDarkIsTrueBlack(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _darkIsTrueBlack) return;
    _darkIsTrueBlack = value;
    if (notify) notifyListeners();
    await _themeService.saveDarkIsTrueBlack(value);
  }

  late bool _useToDarkMethod;
  bool get useToDarkMethod => _useToDarkMethod;
  Future<void> setUseToDarkMethod(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _useToDarkMethod) return;
    _useToDarkMethod = value;
    if (notify) notifyListeners();
    await _themeService.saveUseToDarkMethod(value);
  }

  late int _darkMethodLevel;
  int get darkMethodLevel => _darkMethodLevel;
  Future<void> setDarkMethodLevel(int? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _darkMethodLevel) return;
    _darkMethodLevel = value;
    if (notify) notifyListeners();
    await _themeService.saveDarkMethodLevel(value);
  }

  // This is not a FlexColorScheme property, it is a feature used to turn
  // ON/OFF the usage of FlexColorScheme
  late bool _useFlexColorScheme;
  bool get useFlexColorScheme => _useFlexColorScheme;
  Future<void> setUseFlexColorScheme(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _useFlexColorScheme) return;
    _useFlexColorScheme = value;
    if (notify) notifyListeners();
    await _themeService.saveUseFlexColorScheme(value);
  }

  // On color blending ON/OFF
  late bool _blendLightOnColors;
  bool get blendLightOnColors => _blendLightOnColors;
  Future<void> setBlendLightOnColors(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _blendLightOnColors) return;
    _blendLightOnColors = value;
    if (notify) notifyListeners();
    await _themeService.saveBlendLightOnColors(value);
  }

  late bool _blendDarkOnColors;
  bool get blendDarkOnColors => _blendDarkOnColors;
  Future<void> setBlendDarkOnColors(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _blendDarkOnColors) return;
    _blendDarkOnColors = value;
    if (notify) notifyListeners();
    await _themeService.saveBlendDarkOnColors(value);
  }

  // TextThem blending ON/OFF
  late bool _blendLightTextTheme;
  bool get blendLightTextTheme => _blendLightTextTheme;
  Future<void> setBlendLightTextTheme(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _blendLightTextTheme) return;
    _blendLightTextTheme = value;
    if (notify) notifyListeners();
    await _themeService.saveBlendLightTextTheme(value);
  }

  late bool _blendDarkTextTheme;
  bool get blendDarkTextTheme => _blendDarkTextTheme;
  Future<void> setBlendDarkTextTheme(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _blendDarkTextTheme) return;
    _blendDarkTextTheme = value;
    if (notify) notifyListeners();
    await _themeService.saveBlendDarkTextTheme(value);
  }

  late bool _fabUseShape;
  bool get fabUseShape => _fabUseShape;
  Future<void> setFabUseShape(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _fabUseShape) return;
    _fabUseShape = value;
    if (notify) notifyListeners();
    await _themeService.saveFabUseShape(value);
  }

  /// This is just a local controller properties for the Platform menu control.
  /// It is used as input to the theme, but never persisted so it always
  /// defaults to the actual target platform when starting the app.
  /// Being able to toggle it during demos and development is a handy feature.
  late TargetPlatform _platform;
  TargetPlatform get platform => _platform;
  Future<void> setPlatform(TargetPlatform? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _platform) return;
    _platform = value;
    if (notify) notifyListeners();
  }
}
