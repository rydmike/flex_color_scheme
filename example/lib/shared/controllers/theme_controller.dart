import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../services/theme_service.dart';

/// Enum to indicate which palette we are suing.
/// Used to which TonalPalette a hovered color belongs to.
enum TonalPalettes {
  primary,
  secondary,
  tertiary,
  error,
  neutral,
  neutralVariant,
}

/// The ThemeController is used by many Widgets that users can interact with.
/// Widgets can read user theme settings, set user theme settings and listen
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
    _isLargeGridView = await _themeService.isLargeGridView();
    _useTextTheme = await _themeService.useTextTheme();
    _usedScheme = await _themeService.usedScheme();
    _schemeIndex = await _themeService.schemeIndex();
    _viewIndex = await _themeService.viewIndex();
    _interactionEffects = await _themeService.interactionEffects();
    _cornerRadius = await _themeService.cornerRadius();
    _inputDecoratorIsFilled = await _themeService.inputDecoratorIsFilled();
    _inputDecoratorBorderType = await _themeService.inputDecoratorBorderType();
    _inputDecoratorUnfocusedHasBorder =
        await _themeService.inputDecoratorUnfocusedHasBorder();
    _inputDecoratorSchemeColor =
        await _themeService.inputDecoratorSchemeColor();
    _chipSchemeColor = await _themeService.chipSchemeColor();
    _surfaceMode = await _themeService.surfaceMode();
    _blendLevel = await _themeService.blendLevel();
    _blendLevelDark = await _themeService.blendLevelDark();
    _blendOnLevel = await _themeService.blendOnLevel();
    _blendOnLevelDark = await _themeService.blendOnLevelDark();
    _usedColors = await _themeService.usedColors();
    _lightAppBarStyle = await _themeService.lightAppBarStyle();
    _darkAppBarStyle = await _themeService.darkAppBarStyle();
    _appBarOpacity = await _themeService.appBarOpacity();
    _popupMenuOpacity = await _themeService.popupMenuOpacity();
    _appBarElevation = await _themeService.appBarElevation();
    _navBarStyle = await _themeService.navBarStyle();
    _navBarSelectedSchemeColor = await _themeService.navSelectedSchemeColor();
    _navUnselectedSchemeColor = await _themeService.navUnselectedSchemeColor();
    _navBarHighlight = await _themeService.navBarHighlight();
    _navBarMuteUnselected = await _themeService.navBarMuteUnselected();
    _useNavDivider = await _themeService.useNavDivider();
    _transparentStatusBar = await _themeService.transparentStatusBar();
    _tabBarStyle = await _themeService.tabBarStyle();
    _tabBarIndicator = await _themeService.tabBarIndicator();
    _bottomNavigationBarOpacity =
        await _themeService.bottomNavigationBarOpacity();
    _bottomNavigationBarElevation =
        await _themeService.bottomNavigationBarElevation();
    _tooltipsMatchBackground = await _themeService.tooltipsMatchBackground();
    _swapLightColors = await _themeService.swapLightColors();
    _swapDarkColors = await _themeService.swapDarkColors();
    _lightIsWhite = await _themeService.lightIsWhite();
    _darkIsTrueBlack = await _themeService.darkIsTrueBlack();
    _useToDarkMethod = await _themeService.useToDarkMethod();
    _darkMethodLevel = await _themeService.darkMethodLevel();
    _useFlexColorScheme = await _themeService.useFlexColorScheme();
    _blendLightOnColors = await _themeService.blendLightOnColors();
    _blendDarkOnColors = await _themeService.blendDarkOnColors();
    _blendLightTextTheme = await _themeService.blendLightTextTheme();
    _blendDarkTextTheme = await _themeService.blendDarkTextTheme();
    _fabUseShape = await _themeService.fabUseShape();
    // Custom colors
    _primaryLight = await _themeService.primaryLight();
    _primaryContainerLight = await _themeService.primaryContainerLight();
    _secondaryLight = await _themeService.secondaryLight();
    _secondaryContainerLight = await _themeService.secondaryContainerLight();
    _tertiaryLight = await _themeService.tertiaryLight();
    _tertiaryContainerLight = await _themeService.tertiaryContainerLight();
    _primaryDark = await _themeService.primaryDark();
    _primaryContainerDark = await _themeService.primaryContainerDark();
    _secondaryDark = await _themeService.secondaryDark();
    _secondaryContainerDark = await _themeService.secondaryContainerDark();
    _tertiaryDark = await _themeService.tertiaryDark();
    _tertiaryContainerDark = await _themeService.tertiaryContainerDark();
    // New props for v5 in addition to above tertiary colors
    _useMaterial3 = await _themeService.useMaterial3();
    _useKeyColors = await _themeService.useKeyColors();
    _useSecondary = await _themeService.useSecondary();
    _useTertiary = await _themeService.useTertiary();
    _keepPrimary = await _themeService.keepPrimary();
    _keepSecondary = await _themeService.keepSecondary();
    _keepTertiary = await _themeService.keepTertiary();
    _keepPrimaryContainer = await _themeService.keepPrimaryContainer();
    _keepSecondaryContainer = await _themeService.keepSecondaryContainer();
    _keepTertiaryContainer = await _themeService.keepTertiaryContainer();
    _keepDarkPrimary = await _themeService.keepDarkPrimary();
    _keepDarkSecondary = await _themeService.keepDarkSecondary();
    _keepDarkTertiary = await _themeService.keepDarkTertiary();
    _keepDarkPrimaryContainer = await _themeService.keepDarkPrimaryContainer();
    _keepDarkSecondaryContainer =
        await _themeService.keepDarkSecondaryContainer();
    _keepDarkTertiaryContainer =
        await _themeService.keepDarkTertiaryContainer();
    // New props for v5, more theme scheme colors.
    _textButtonSchemeColor = await _themeService.textButtonSchemeColor();
    _elevatedButtonSchemeColor =
        await _themeService.elevatedButtonSchemeColor();
    _outlinedButtonSchemeColor =
        await _themeService.outlinedButtonSchemeColor();
    _materialButtonSchemeColor =
        await _themeService.materialButtonSchemeColor();
    _toggleButtonsSchemeColor = await _themeService.toggleButtonsSchemeColor();
    _switchSchemeColor = await _themeService.switchSchemeColor();
    _checkboxSchemeColor = await _themeService.checkboxSchemeColor();
    _radioSchemeColor = await _themeService.radioSchemeColor();
    _dialogBackgroundSchemeColor =
        await _themeService.dialogBackgroundSchemeColor();
    _tabBarItemSchemeColor = await _themeService.tabBarItemSchemeColor();
    _appBarBackgroundSchemeColor =
        await _themeService.appBarBackgroundSchemeColor();
    _fabSchemeColor = await _themeService.fabSchemeColor();
    _snackBarSchemeColor = await _themeService.snackBarSchemeColor();
    _navBarBackgroundSchemeColor =
        await _themeService.navBarBackgroundSchemeColor();
    _unselectedIsColored = await _themeService.unselectedIsColored();
    _usedFlexToneSetup = await _themeService.usedFlexToneSetup();
    _useIndicator = await _themeService.useIndicator();
    _useM3ErrorColors = await _themeService.useM3ErrorColors();
    _bottomNavShowSelectedLabels =
        await _themeService.bottomNavShowSelectedLabels();
    _bottomNavShowUnselectedLabels =
        await _themeService.bottomNavShowUnselectedLabels();
    _navBarLabelBehavior = await _themeService.navBarLabelBehavior();
    _navRailLabelType = await _themeService.navRailLabelType();
    _elevatedButtonBorderRadius =
        await _themeService.elevatedButtonBorderRadius();
    _outlinedButtonBorderRadius =
        await _themeService.outlinedButtonBorderRadius();
    _textButtonBorderRadius = await _themeService.textButtonBorderRadius();
    _toggleButtonsBorderRadius =
        await _themeService.toggleButtonsBorderRadius();
    _cardBorderRadius = await _themeService.cardBorderRadius();
    _sysBarOpacity = await _themeService.sysBarOpacity();
    // Not using the ThemeService just a local toggle for platform, resets
    // to actual default platform when settings are loaded.
    _platform = defaultTargetPlatform;

    notifyListeners();
  }

  /// Reset all values to default values and save as current settings.
  ///
  /// Calls setters with notify = false, and calls notifyListeners once
  /// after all values have been reset and persisted.
  Future<void> resetAllToDefaults() async {
    await setThemeMode(ThemeService.defaultThemeMode, false);
    await setUseSubThemes(ThemeService.defaultUseSubThemes, false);
    // TODO(rydmike): Remove this comment.
    // We are not going to reset view mode, we will keep what was used last,
    // it was annoying when it changed view mode when you reset the settings.
    //
    // await setAdvancedView(ThemeService.defaultAdvancedView, false);
    await setUseTextTheme(ThemeService.defaultUseTextTheme, false);
    await setUsedScheme(ThemeService.defaultUsedScheme, false);
    await setSchemeIndex(ThemeService.defaultSchemeIndex, false);
    // TODO(rydmike): Remove this comment.
    // Same with viewIndex, we want to keep that also when we reset to defaults.
    //
    //await setViewIndex(ThemeService.defaultViewIndex, false);
    await setInteractionEffects(ThemeService.defaultInteractionEffects, false);
    await setCornerRadius(ThemeService.defaultCornerRadius, false);
    await setInputDecoratorIsFilled(
        ThemeService.defaultInputDecoratorIsFilled, false);
    await setInputDecoratorBorderType(
        ThemeService.defaultInputDecoratorBorderType, false);
    await setInputDecoratorUnfocusedHasBorder(
        ThemeService.defaultInputDecoratorUnfocusedHasBorder, false);
    await setInputDecoratorSchemeColor(
        ThemeService.defaultInputDecoratorSchemeColor, false);
    await setChipSchemeColor(ThemeService.defaultChipSchemeColor, false);
    await setSurfaceMode(ThemeService.defaultSurfaceMode, false);

    await setBlendLevel(ThemeService.defaultBlendLevel, false);
    await setBlendLevelDark(ThemeService.defaultBlendLevelDark, false);
    await setBlendOnLevel(ThemeService.defaultBlendOnLevel, false);
    await setBlendOnLevelDark(ThemeService.defaultBlendOnLevelDark, false);
    await setUsedColors(ThemeService.defaultUsedColors, false);

    await setLightAppBarStyle(ThemeService.defaultLightAppBarStyle, false);
    await setDarkAppBarStyle(ThemeService.defaultDarkAppBarStyle, false);
    await setAppBarOpacity(ThemeService.defaultAppBarOpacity, false);
    await setPopupMenuOpacity(ThemeService.defaultPopupMenuOpacity, false);
    await setAppBarElevation(ThemeService.defaultAppBarElevation, false);
    await setTransparentStatusBar(
        ThemeService.defaultTransparentStatusBar, false);
    await setTabBarStyle(ThemeService.defaultTabBarStyle, false);
    await setTabBarIndicator(ThemeService.defaultTabBarIndicator, false);
    await setBottomNavigationBarOpacity(
        ThemeService.defaultBottomNavigationBarOpacity, false);
    await setBottomNavigationBarElevation(
        ThemeService.defaultBottomNavigationBarElevation, false);
    await setNavBarStyle(ThemeService.defaultNavBarStyle, false);
    await setNavBarSelectedSchemeColor(
        ThemeService.defaultNavSelectedSchemeColor, false);
    await setNavUnselectedSchemeColor(
        ThemeService.defaultNavUnselectedSchemeColor, false);
    await setNavBarHighlight(ThemeService.defaultNavBarHighlight, false);
    await setNavBarMuteUnselected(
        ThemeService.defaultNavBarMuteUnselected, false);
    await setUseNavDivider(ThemeService.defaultUseNavDivider, false);
    await setTooltipsMatchBackground(
        ThemeService.defaultTooltipsMatchBackground, false);
    await setSwapLightColors(ThemeService.defaultSwapLightColors, false);
    await setSwapDarkColors(ThemeService.defaultSwapDarkColors, false);
    await setLightIsWhite(ThemeService.defaultLightIsWhite, false);
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
    // Custom colors
    await setPrimaryLight(ThemeService.defaultPrimaryLight, false);
    await setPrimaryContainerLight(
        ThemeService.defaultPrimaryContainerLight, false);
    await setSecondaryLight(ThemeService.defaultSecondaryLight, false);
    await setSecondaryContainerLight(
        ThemeService.defaultSecondaryContainerLight, false);
    await setTertiaryLight(ThemeService.defaultTertiaryLight, false);
    await setTertiaryContainerLight(
        ThemeService.defaultTertiaryContainerLight, false);
    await setPrimaryDark(ThemeService.defaultPrimaryDark, false);
    await setPrimaryContainerDark(
        ThemeService.defaultPrimaryContainerDark, false);
    await setSecondaryDark(ThemeService.defaultSecondaryDark, false);
    await setSecondaryContainerDark(
        ThemeService.defaultSecondaryContainerDark, false);
    await setTertiaryDark(ThemeService.defaultTertiaryDark, false);
    await setTertiaryContainerDark(
        ThemeService.defaultTertiaryContainerDark, false);
    // New props for v5 in addition to above tertiary colors
    await setUseMaterial3(ThemeService.defaultUseMaterial3, false);
    await setUseKeyColors(ThemeService.defaultUseKeyColors, false);
    await setUseSecondary(ThemeService.defaultUseSecondary, false);
    await setUseTertiary(ThemeService.defaultUseTertiary, false);
    await setKeepPrimary(ThemeService.defaultKeepPrimary, false);
    await setKeepSecondary(ThemeService.defaultKeepSecondary, false);
    await setKeepTertiary(ThemeService.defaultKeepTertiary, false);
    await setKeepPrimaryContainer(
        ThemeService.defaultKeepPrimaryContainer, false);
    await setKeepSecondaryContainer(
        ThemeService.defaultKeepSecondaryContainer, false);
    await setKeepTertiaryContainer(
        ThemeService.defaultKeepTertiaryContainer, false);
    await setKeepDarkPrimary(ThemeService.defaultKeepDarkPrimary, false);
    await setKeepDarkSecondary(ThemeService.defaultKeepDarkSecondary, false);
    await setKeepDarkTertiary(ThemeService.defaultKeepDarkTertiary, false);
    await setKeepDarkPrimaryContainer(
        ThemeService.defaultKeepDarkPrimaryContainer, false);
    await setKeepDarkSecondaryContainer(
        ThemeService.defaultKeepDarkSecondaryContainer, false);
    await setKeepDarkTertiaryContainer(
        ThemeService.defaultKeepDarkTertiaryContainer, false);
    // More props for V5 custom scheme colors.
    await setTextButtonSchemeColor(
        ThemeService.defaultTextButtonSchemeColor, false);
    await setElevatedButtonSchemeColor(
        ThemeService.defaultElevatedButtonSchemeColor, false);
    await setOutlinedButtonSchemeColor(
        ThemeService.defaultOutlinedButtonSchemeColor, false);
    await setMaterialButtonSchemeColor(
        ThemeService.defaultMaterialButtonSchemeColor, false);
    await setToggleButtonsSchemeColor(
        ThemeService.defaultToggleButtonsSchemeColor, false);
    await setSwitchSchemeColor(ThemeService.defaultSwitchSchemeColor, false);
    await setCheckboxSchemeColor(
        ThemeService.defaultCheckboxSchemeColor, false);
    await setRadioSchemeColor(ThemeService.defaultRadioSchemeColor, false);
    await setDialogBackgroundSchemeColor(
        ThemeService.defaultDialogBackgroundSchemeColor, false);
    await setTabBarItemSchemeColor(
        ThemeService.defaultTabBarItemSchemeColor, false);
    await setAppBarBackgroundSchemeColor(
        ThemeService.defaultAppBarBackgroundSchemeColor, false);
    await setFabSchemeColor(ThemeService.defaultFabSchemeColor, false);
    await setSnackBarSchemeColor(
        ThemeService.defaultSnackBarSchemeColor, false);
    await setNavBarBackgroundSchemeColor(
        ThemeService.defaultNavBarBackgroundSchemeColor, false);
    await setUnselectedIsColored(
        ThemeService.defaultUnselectedIsColored, false);
    await setUsedFlexToneSetup(ThemeService.defaultUsedFlexToneSetup, false);
    await setUseIndicator(ThemeService.defaultUseIndicator, false);
    await setUseM3ErrorColors(ThemeService.defaultUseM3ErrorColors, false);
    await setBottomNavShowSelectedLabels(
        ThemeService.defaultBottomNavShowSelectedLabels, false);
    await setBottomNavShowUnselectedLabels(
        ThemeService.defaultBottomNavShowUnselectedLabels, false);
    await setNavBarLabelBehavior(
        ThemeService.defaultNavBarLabelBehavior, false);
    await setNavRailLabelType(ThemeService.defaultNavRailLabelType, false);
    //
    await setElevatedButtonBorderRadius(
        ThemeService.defaultElevatedButtonBorderRadius, false);
    await setOutlinedButtonBorderRadius(
        ThemeService.defaultOutlinedButtonBorderRadius, false);
    await setTextButtonBorderRadius(
        ThemeService.defaultTextButtonBorderRadius, false);
    await setToggleButtonsBorderRadius(
        ThemeService.defaultToggleButtonsBorderRadius, false);
    await setCardBorderRadius(ThemeService.defaultCardBorderRadius, false);
    await setSysBarOpacity(ThemeService.defaultSysBarOpacity, false);
    // Not using ThemeService, just a locally controlled switched.
    await setPlatform(defaultTargetPlatform, false);
    notifyListeners();
  }

  // Make all ThemeController properties private so they cannot be used
  // directly without also persisting the changes using the ThemeService,
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

  late bool _isLargeGridView;
  bool get isLargeGridView => _isLargeGridView;
  Future<void> setAdvancedView(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _isLargeGridView) return;
    _isLargeGridView = value;
    if (notify) notifyListeners();
    await _themeService.saveIsLargeGridView(value);
  }

  late int _viewIndex;
  int get viewIndex => _viewIndex;
  Future<void> setViewIndex(int? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _viewIndex) return;
    _viewIndex = value;
    notifyListeners();
    await _themeService.saveViewIndex(value);
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

  late int _blendLevelDark;
  int get blendLevelDark => _blendLevelDark;
  Future<void> setBlendLevelDark(int? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _blendLevelDark) return;
    _blendLevelDark = value;
    if (notify) notifyListeners();
    await _themeService.saveBlendLevelDark(value);
  }

  late int _blendOnLevel;
  int get blendOnLevel => _blendOnLevel;
  Future<void> setBlendOnLevel(int? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _blendOnLevel) return;
    _blendOnLevel = value;
    if (notify) notifyListeners();
    await _themeService.saveBlendOnLevel(value);
  }

  late int _blendOnLevelDark;
  int get blendOnLevelDark => _blendOnLevelDark;
  Future<void> setBlendOnLevelDark(int? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _blendOnLevelDark) return;
    _blendOnLevelDark = value;
    if (notify) notifyListeners();
    await _themeService.saveBlendOnLevelDark(value);
  }

  late int _usedColors;
  int get usedColors => _usedColors;
  Future<void> setUsedColors(int? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _usedColors) return;
    _usedColors = value;
    if (notify) notifyListeners();
    await _themeService.saveUsedColors(value);
  }

  late bool _interactionEffects;
  bool get interactionEffects => _interactionEffects;
  Future<void> setInteractionEffects(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _interactionEffects) return;
    _interactionEffects = value;
    if (notify) notifyListeners();
    await _themeService.saveInteractionEffects(value);
  }

  late double? _cornerRadius;
  double? get cornerRadius => _cornerRadius;
  Future<void> setCornerRadius(double? value, [bool notify = true]) async {
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
  FlexInputBorderType get inputDecoratorBorderType => _inputDecoratorBorderType;
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

  late SchemeColor? _inputDecoratorSchemeColor;
  SchemeColor? get inputDecoratorSchemeColor => _inputDecoratorSchemeColor;
  Future<void> setInputDecoratorSchemeColor(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _inputDecoratorSchemeColor) return;
    _inputDecoratorSchemeColor = value;
    if (notify) notifyListeners();
    await _themeService.saveInputDecoratorSchemeColor(value);
  }

  late SchemeColor? _chipSchemeColor;
  SchemeColor? get chipSchemeColor => _chipSchemeColor;
  Future<void> setChipSchemeColor(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _chipSchemeColor) return;
    _chipSchemeColor = value;
    if (notify) notifyListeners();
    await _themeService.saveChipSchemeColor(value);
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

  late double _popupMenuOpacity;
  double get popupMenuOpacity => _popupMenuOpacity;
  Future<void> setPopupMenuOpacity(double? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _popupMenuOpacity) return;
    _popupMenuOpacity = value;
    if (notify) notifyListeners();
    await _themeService.savePopupMenuOpacity(value);
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

  late SchemeColor? _tabBarIndicator;
  SchemeColor? get tabBarIndicator => _tabBarIndicator;
  Future<void> setTabBarIndicator(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _tabBarIndicator) return;
    _tabBarIndicator = value;
    if (notify) notifyListeners();
    await _themeService.saveTabBarIndicator(value);
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

  late FlexSystemNavBarStyle _navBarStyle;
  FlexSystemNavBarStyle get navBarStyle => _navBarStyle;
  Future<void> setNavBarStyle(FlexSystemNavBarStyle? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _navBarStyle) return;
    _navBarStyle = value;
    if (notify) notifyListeners();
    await _themeService.saveNavBarStyle(value);
  }

  late SchemeColor? _navBarSelectedSchemeColor;
  SchemeColor? get navBarSelectedSchemeColor => _navBarSelectedSchemeColor;
  Future<void> setNavBarSelectedSchemeColor(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _navBarSelectedSchemeColor) return;
    _navBarSelectedSchemeColor = value;
    if (notify) notifyListeners();
    await _themeService.saveNavSelectedSchemeColor(value);
  }

  late SchemeColor? _navBarHighlight;
  SchemeColor? get navBarHighlight => _navBarHighlight;
  Future<void> setNavBarHighlight(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _navBarHighlight) return;
    _navBarHighlight = value;
    if (notify) notifyListeners();
    await _themeService.saveNavBarHighlight(value);
  }

  late bool _navBarMuteUnselected;
  bool get navBarMuteUnselected => _navBarMuteUnselected;
  Future<void> setNavBarMuteUnselected(bool? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _navBarMuteUnselected) return;
    _navBarMuteUnselected = value;
    if (notify) notifyListeners();
    await _themeService.saveNavBarMuteUnselected(value);
  }

  late bool _useNavDivider;
  bool get useNavDivider => _useNavDivider;
  Future<void> setUseNavDivider(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _useNavDivider) return;
    _useNavDivider = value;
    if (notify) notifyListeners();
    await _themeService.saveUseNavDivider(value);
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

  late bool _lightIsWhite;
  bool get lightIsWhite => _lightIsWhite;
  Future<void> setLightIsWhite(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _lightIsWhite) return;
    _lightIsWhite = value;
    if (notify) notifyListeners();
    await _themeService.saveLightIsWhite(value);
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

  late Color _primaryLight;
  Color get primaryLight => _primaryLight;
  Future<void> setPrimaryLight(Color? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _primaryLight) return;
    _primaryLight = value;
    if (notify) notifyListeners();
    await _themeService.savePrimaryLight(value);
  }

  late Color _primaryContainerLight;
  Color get primaryContainerLight => _primaryContainerLight;
  Future<void> setPrimaryContainerLight(Color? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _primaryContainerLight) return;
    _primaryContainerLight = value;
    if (notify) notifyListeners();
    await _themeService.savePrimaryContainerLight(value);
  }

  late Color _secondaryLight;
  Color get secondaryLight => _secondaryLight;
  Future<void> setSecondaryLight(Color? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _secondaryLight) return;
    _secondaryLight = value;
    if (notify) notifyListeners();
    await _themeService.saveSecondaryLight(value);
  }

  late Color _secondaryContainerLight;
  Color get secondaryContainerLight => _secondaryContainerLight;
  Future<void> setSecondaryContainerLight(Color? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _secondaryContainerLight) return;
    _secondaryContainerLight = value;
    if (notify) notifyListeners();
    await _themeService.saveSecondaryContainerLight(value);
  }

  late Color _tertiaryLight;
  Color get tertiaryLight => _tertiaryLight;
  Future<void> setTertiaryLight(Color? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _tertiaryLight) return;
    _tertiaryLight = value;
    if (notify) notifyListeners();
    await _themeService.saveTertiaryLight(value);
  }

  late Color _tertiaryContainerLight;
  Color get tertiaryContainerLight => _tertiaryContainerLight;
  Future<void> setTertiaryContainerLight(Color? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _tertiaryContainerLight) return;
    _tertiaryContainerLight = value;
    if (notify) notifyListeners();
    await _themeService.saveTertiaryContainerLight(value);
  }

  late Color _primaryDark;
  Color get primaryDark => _primaryDark;
  Future<void> setPrimaryDark(Color? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _primaryDark) return;
    _primaryDark = value;
    if (notify) notifyListeners();
    await _themeService.savePrimaryDark(value);
  }

  late Color _primaryContainerDark;
  Color get primaryContainerDark => _primaryContainerDark;
  Future<void> setPrimaryContainerDark(Color? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _primaryContainerDark) return;
    _primaryContainerDark = value;
    if (notify) notifyListeners();
    await _themeService.savePrimaryContainerDark(value);
  }

  late Color _secondaryDark;
  Color get secondaryDark => _secondaryDark;
  Future<void> setSecondaryDark(Color? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _secondaryDark) return;
    _secondaryDark = value;
    if (notify) notifyListeners();
    await _themeService.saveSecondaryDark(value);
  }

  late Color _secondaryContainerDark;
  Color get secondaryContainerDark => _secondaryContainerDark;
  Future<void> setSecondaryContainerDark(Color? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _secondaryContainerDark) return;
    _secondaryContainerDark = value;
    if (notify) notifyListeners();
    await _themeService.saveSecondaryContainerDark(value);
  }

  late Color _tertiaryDark;
  Color get tertiaryDark => _tertiaryDark;
  Future<void> setTertiaryDark(Color? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _tertiaryDark) return;
    _tertiaryDark = value;
    if (notify) notifyListeners();
    await _themeService.saveTertiaryDark(value);
  }

  late Color _tertiaryContainerDark;
  Color get tertiaryContainerDark => _tertiaryContainerDark;
  Future<void> setTertiaryContainerDark(Color? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _tertiaryContainerDark) return;
    _tertiaryContainerDark = value;
    if (notify) notifyListeners();
    await _themeService.saveTertiaryContainerDark(value);
  }

  late SchemeColor? _textButtonSchemeColor;
  SchemeColor? get textButtonSchemeColor => _textButtonSchemeColor;
  Future<void> setTextButtonSchemeColor(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _textButtonSchemeColor) return;
    _textButtonSchemeColor = value;
    if (notify) notifyListeners();
    await _themeService.saveTextButtonSchemeColor(value);
  }

  late SchemeColor? _elevatedButtonSchemeColor;
  SchemeColor? get elevatedButtonSchemeColor => _elevatedButtonSchemeColor;
  Future<void> setElevatedButtonSchemeColor(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _elevatedButtonSchemeColor) return;
    _elevatedButtonSchemeColor = value;
    if (notify) notifyListeners();
    await _themeService.saveElevatedButtonSchemeColor(value);
  }

  late SchemeColor? _outlinedButtonSchemeColor;
  SchemeColor? get outlinedButtonSchemeColor => _outlinedButtonSchemeColor;
  Future<void> setOutlinedButtonSchemeColor(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _outlinedButtonSchemeColor) return;
    _outlinedButtonSchemeColor = value;
    if (notify) notifyListeners();
    await _themeService.saveOutlinedButtonSchemeColor(value);
  }

  late SchemeColor? _materialButtonSchemeColor;
  SchemeColor? get materialButtonSchemeColor => _materialButtonSchemeColor;
  Future<void> setMaterialButtonSchemeColor(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _materialButtonSchemeColor) return;
    _materialButtonSchemeColor = value;
    if (notify) notifyListeners();
    await _themeService.saveMaterialButtonSchemeColor(value);
  }

  late SchemeColor? _toggleButtonsSchemeColor;
  SchemeColor? get toggleButtonsSchemeColor => _toggleButtonsSchemeColor;
  Future<void> setToggleButtonsSchemeColor(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _toggleButtonsSchemeColor) return;
    _toggleButtonsSchemeColor = value;
    if (notify) notifyListeners();
    await _themeService.saveToggleButtonsSchemeColor(value);
  }

  late SchemeColor? _switchSchemeColor;
  SchemeColor? get switchSchemeColor => _switchSchemeColor;
  Future<void> setSwitchSchemeColor(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _switchSchemeColor) return;
    _switchSchemeColor = value;
    if (notify) notifyListeners();
    await _themeService.saveSwitchSchemeColor(value);
  }

  late SchemeColor? _checkboxSchemeColor;
  SchemeColor? get checkboxSchemeColor => _checkboxSchemeColor;
  Future<void> setCheckboxSchemeColor(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _checkboxSchemeColor) return;
    _checkboxSchemeColor = value;
    if (notify) notifyListeners();
    await _themeService.saveCheckboxSchemeColor(value);
  }

  late SchemeColor? _radioSchemeColor;
  SchemeColor? get radioSchemeColor => _radioSchemeColor;
  Future<void> setRadioSchemeColor(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _radioSchemeColor) return;
    _radioSchemeColor = value;
    if (notify) notifyListeners();
    await _themeService.saveRadioSchemeColor(value);
  }

  late SchemeColor? _dialogBackgroundSchemeColor;
  SchemeColor? get dialogBackgroundSchemeColor => _dialogBackgroundSchemeColor;
  Future<void> setDialogBackgroundSchemeColor(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _dialogBackgroundSchemeColor) return;
    _dialogBackgroundSchemeColor = value;
    if (notify) notifyListeners();
    await _themeService.saveDialogBackgroundSchemeColor(value);
  }

  late SchemeColor? _tabBarItemSchemeColor;
  SchemeColor? get tabBarItemSchemeColor => _tabBarItemSchemeColor;
  Future<void> setTabBarItemSchemeColor(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _tabBarItemSchemeColor) return;
    _tabBarItemSchemeColor = value;
    if (notify) notifyListeners();
    await _themeService.saveTabBarItemSchemeColor(value);
  }

  late SchemeColor? _appBarBackgroundSchemeColor;
  SchemeColor? get appBarBackgroundSchemeColor => _appBarBackgroundSchemeColor;
  Future<void> setAppBarBackgroundSchemeColor(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _appBarBackgroundSchemeColor) return;
    _appBarBackgroundSchemeColor = value;
    if (notify) notifyListeners();
    await _themeService.saveAppBarBackgroundSchemeColor(value);
  }

  late SchemeColor? _fabSchemeColor;
  SchemeColor? get fabSchemeColor => _fabSchemeColor;
  Future<void> setFabSchemeColor(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _fabSchemeColor) return;
    _fabSchemeColor = value;
    if (notify) notifyListeners();
    await _themeService.saveFabSchemeColor(value);
  }

  late SchemeColor? _snackBarSchemeColor;
  SchemeColor? get snackBarSchemeColor => _snackBarSchemeColor;
  Future<void> setSnackBarSchemeColor(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _snackBarSchemeColor) return;
    _snackBarSchemeColor = value;
    if (notify) notifyListeners();
    await _themeService.saveSnackBarSchemeColor(value);
  }

  late SchemeColor? _navBarBackgroundSchemeColor;
  SchemeColor? get navBarBackgroundSchemeColor => _navBarBackgroundSchemeColor;
  Future<void> setNavBarBackgroundSchemeColor(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _navBarBackgroundSchemeColor) return;
    _navBarBackgroundSchemeColor = value;
    if (notify) notifyListeners();
    await _themeService.saveNavBarBackgroundSchemeColor(value);
  }

  // Get custom scheme data based on currently defined scheme colors.
  FlexSchemeData get customScheme => FlexSchemeData(
        name: FlexColor.customName,
        description: FlexColor.customDescription,
        light: FlexSchemeColor(
          primary: primaryLight,
          primaryContainer: primaryContainerLight,
          secondary: secondaryLight,
          secondaryContainer: secondaryContainerLight,
          tertiary: tertiaryLight,
          tertiaryContainer: tertiaryContainerLight,
          appBarColor: secondaryContainerLight,
          error: FlexColor.materialLightError,
        ),
        dark: FlexSchemeColor(
          primary: primaryDark,
          primaryContainer: primaryContainerDark,
          secondary: secondaryDark,
          secondaryContainer: secondaryContainerDark,
          tertiary: tertiaryDark,
          tertiaryContainer: tertiaryContainerDark,
          appBarColor: secondaryContainerDark,
          error: FlexColor.materialDarkError,
        ),
      );

  // Set the custom scheme colors to the colors scheme FlexSchemeData.
  Future<void> setCustomScheme(FlexSchemeData scheme) async {
    // Don't notify listeners while setting new values for each value.
    await setPrimaryLight(scheme.light.primary, false);
    await setPrimaryContainerLight(scheme.light.primaryContainer, false);
    await setSecondaryLight(scheme.light.secondary, false);
    await setSecondaryContainerLight(scheme.light.secondaryContainer, false);
    await setTertiaryLight(scheme.light.tertiary, false);
    await setTertiaryContainerLight(scheme.light.tertiaryContainer, false);
    await setPrimaryDark(scheme.dark.primary, false);
    await setPrimaryContainerDark(scheme.dark.primaryContainer, false);
    await setSecondaryDark(scheme.dark.secondary, false);
    await setSecondaryContainerDark(scheme.dark.secondaryContainer, false);
    await setTertiaryDark(scheme.dark.tertiary, false);
    await setTertiaryContainerDark(scheme.dark.tertiaryContainer, false);
    // Notify listeners, after all individual values have been set.
    notifyListeners();
  }

  /// This is just a local controller prop for the Platform menu control.
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

  /// This is just a local controller prop for hovered color on Colorscheme.
  Color? _hoverColor;
  Color? get hoverColor => _hoverColor;
  Future<void> setHoverColor(Color? value, [bool notify = true]) async {
    if (value == _hoverColor) return;
    _hoverColor = value;
    if (notify) notifyListeners();
  }

  /// This is just a local controller prop for hovered palette on Colorscheme.
  TonalPalettes? _hoverTonalPalette;
  TonalPalettes? get hoverTonalPalette => _hoverTonalPalette;
  Future<void> setHoverTonalPalette(TonalPalettes? value,
      [bool notify = true]) async {
    if (value == _hoverTonalPalette) return;
    _hoverTonalPalette = value;
    if (notify) notifyListeners();
  }

  // Recently used colors, we keep the list of recently used colors in the
  // color picker for custom colors only during the session we don't persist.
  // It is of course possible to persist, but not needed in ths demo.
  List<Color> _recentColors = <Color>[];
  List<Color> get recentColors => _recentColors;
  // ignore: use_setters_to_change_properties
  void setRecentColors(final List<Color> colors) {
    _recentColors = colors;
  }

  // Version 5 new controllers

  late bool _useMaterial3;
  bool get useMaterial3 => _useMaterial3;
  Future<void> setUseMaterial3(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _useMaterial3) return;
    _useMaterial3 = value;
    if (notify) notifyListeners();
    await _themeService.saveUseMaterial3(value);
  }

  late bool _useKeyColors;
  bool get useKeyColors => _useKeyColors;
  Future<void> setUseKeyColors(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _useKeyColors) return;
    _useKeyColors = value;
    if (notify) notifyListeners();
    await _themeService.saveUseKeyColors(value);
  }

  late bool _useSecondary;
  bool get useSecondary => _useSecondary;
  Future<void> setUseSecondary(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _useSecondary) return;
    _useSecondary = value;
    if (notify) notifyListeners();
    await _themeService.saveUseSecondary(value);
  }

  late bool _useTertiary;
  bool get useTertiary => _useTertiary;
  Future<void> setUseTertiary(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _useTertiary) return;
    _useTertiary = value;
    if (notify) notifyListeners();
    await _themeService.saveUseTertiary(value);
  }

  late bool _keepPrimary;
  bool get keepPrimary => _keepPrimary;
  Future<void> setKeepPrimary(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _keepPrimary) return;
    _keepPrimary = value;
    if (notify) notifyListeners();
    await _themeService.saveKeepPrimary(value);
  }

  late bool _keepSecondary;
  bool get keepSecondary => _keepSecondary;
  Future<void> setKeepSecondary(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _keepSecondary) return;
    _keepSecondary = value;
    if (notify) notifyListeners();
    await _themeService.saveKeepSecondary(value);
  }

  late bool _keepTertiary;
  bool get keepTertiary => _keepTertiary;
  Future<void> setKeepTertiary(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _keepTertiary) return;
    _keepTertiary = value;
    if (notify) notifyListeners();
    await _themeService.saveKeepTertiary(value);
  }

  late bool _keepPrimaryContainer;
  bool get keepPrimaryContainer => _keepPrimaryContainer;
  Future<void> setKeepPrimaryContainer(bool? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _keepPrimaryContainer) return;
    _keepPrimaryContainer = value;
    if (notify) notifyListeners();
    await _themeService.saveKeepPrimaryContainer(value);
  }

  late bool _keepSecondaryContainer;
  bool get keepSecondaryContainer => _keepSecondaryContainer;
  Future<void> setKeepSecondaryContainer(bool? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _keepSecondaryContainer) return;
    _keepSecondaryContainer = value;
    if (notify) notifyListeners();
    await _themeService.saveKeepSecondaryContainer(value);
  }

  late bool _keepTertiaryContainer;
  bool get keepTertiaryContainer => _keepTertiaryContainer;
  Future<void> setKeepTertiaryContainer(bool? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _keepTertiaryContainer) return;
    _keepTertiaryContainer = value;
    if (notify) notifyListeners();
    await _themeService.saveKeepTertiaryContainer(value);
  }

  late bool _keepDarkPrimary;
  bool get keepDarkPrimary => _keepDarkPrimary;
  Future<void> setKeepDarkPrimary(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _keepDarkPrimary) return;
    _keepDarkPrimary = value;
    if (notify) notifyListeners();
    await _themeService.saveKeepDarkPrimary(value);
  }

  late bool _keepDarkSecondary;
  bool get keepDarkSecondary => _keepDarkSecondary;
  Future<void> setKeepDarkSecondary(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _keepDarkSecondary) return;
    _keepDarkSecondary = value;
    if (notify) notifyListeners();
    await _themeService.saveKeepDarkSecondary(value);
  }

  late bool _keepDarkTertiary;
  bool get keepDarkTertiary => _keepDarkTertiary;
  Future<void> setKeepDarkTertiary(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _keepDarkTertiary) return;
    _keepDarkTertiary = value;
    if (notify) notifyListeners();
    await _themeService.saveKeepDarkTertiary(value);
  }

  late bool _keepDarkPrimaryContainer;
  bool get keepDarkPrimaryContainer => _keepDarkPrimaryContainer;
  Future<void> setKeepDarkPrimaryContainer(bool? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _keepDarkPrimaryContainer) return;
    _keepDarkPrimaryContainer = value;
    if (notify) notifyListeners();
    await _themeService.saveKeepDarkPrimaryContainer(value);
  }

  late bool _keepDarkSecondaryContainer;
  bool get keepDarkSecondaryContainer => _keepDarkSecondaryContainer;
  Future<void> setKeepDarkSecondaryContainer(bool? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _keepDarkSecondaryContainer) return;
    _keepDarkSecondaryContainer = value;
    if (notify) notifyListeners();
    await _themeService.saveKeepDarkSecondaryContainer(value);
  }

  late bool _keepDarkTertiaryContainer;
  bool get keepDarkTertiaryContainer => _keepDarkTertiaryContainer;
  Future<void> setKeepDarkTertiaryContainer(bool? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _keepDarkTertiaryContainer) return;
    _keepDarkTertiaryContainer = value;
    if (notify) notifyListeners();
    await _themeService.saveKeepDarkTertiaryContainer(value);
  }

  late bool _unselectedIsColored;
  bool get unselectedIsColored => _unselectedIsColored;
  Future<void> setUnselectedIsColored(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _unselectedIsColored) return;
    _unselectedIsColored = value;
    if (notify) notifyListeners();
    await _themeService.saveUnselectedIsColored(value);
  }

  late int _usedFlexToneSetup;
  int get usedFlexToneSetup => _usedFlexToneSetup;
  Future<void> setUsedFlexToneSetup(int? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _usedFlexToneSetup) return;
    _usedFlexToneSetup = value;
    if (notify) notifyListeners();
    await _themeService.saveUsedFlexToneSetup(value);
  }

  late bool _useIndicator;
  bool get useIndicator => _useIndicator;
  Future<void> setUseIndicator(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _useIndicator) return;
    _useIndicator = value;
    if (notify) notifyListeners();
    await _themeService.saveUseIndicator(value);
  }

  late SchemeColor? _navUnselectedSchemeColor;
  SchemeColor? get navUnselectedSchemeColor => _navUnselectedSchemeColor;
  Future<void> setNavUnselectedSchemeColor(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _navUnselectedSchemeColor) return;
    _navUnselectedSchemeColor = value;
    if (notify) notifyListeners();
    await _themeService.saveNavUnselectedSchemeColor(value);
  }

  late bool _useM3ErrorColors;
  bool get useM3ErrorColors => _useM3ErrorColors;
  Future<void> setUseM3ErrorColors(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _useM3ErrorColors) return;
    _useM3ErrorColors = value;
    if (notify) notifyListeners();
    await _themeService.saveUseM3ErrorColors(value);
  }

  late bool _bottomNavShowSelectedLabels;
  bool get bottomNavShowSelectedLabels => _bottomNavShowSelectedLabels;
  Future<void> setBottomNavShowSelectedLabels(bool? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _bottomNavShowSelectedLabels) return;
    _bottomNavShowSelectedLabels = value;
    if (notify) notifyListeners();
    await _themeService.saveBottomNavShowSelectedLabels(value);
  }

  late bool _bottomNavShowUnselectedLabels;
  bool get bottomNavShowUnselectedLabels => _bottomNavShowUnselectedLabels;
  Future<void> setBottomNavShowUnselectedLabels(bool? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _bottomNavShowUnselectedLabels) return;
    _bottomNavShowUnselectedLabels = value;
    if (notify) notifyListeners();
    await _themeService.saveBottomNavShowUnselectedLabels(value);
  }

  late NavigationDestinationLabelBehavior _navBarLabelBehavior;
  NavigationDestinationLabelBehavior get navBarLabelBehavior =>
      _navBarLabelBehavior;
  Future<void> setNavBarLabelBehavior(NavigationDestinationLabelBehavior value,
      [bool notify = true]) async {
    if (value == _navBarLabelBehavior) return;
    _navBarLabelBehavior = value;
    if (notify) notifyListeners();
    await _themeService.saveNavBarLabelBehavior(value);
  }

  late NavigationRailLabelType _navRailLabelType;
  NavigationRailLabelType get navRailLabelType => _navRailLabelType;
  Future<void> setNavRailLabelType(NavigationRailLabelType value,
      [bool notify = true]) async {
    if (value == _navRailLabelType) return;
    _navRailLabelType = value;
    if (notify) notifyListeners();
    await _themeService.saveNavRailLabelType(value);
  }

  late double? _elevatedButtonBorderRadius;
  double? get elevatedButtonBorderRadius => _elevatedButtonBorderRadius;
  Future<void> setElevatedButtonBorderRadius(double? value,
      [bool notify = true]) async {
    if (value == _elevatedButtonBorderRadius) return;
    _elevatedButtonBorderRadius = value;
    if (notify) notifyListeners();
    await _themeService.saveElevatedButtonBorderRadius(value);
  }

  late double? _outlinedButtonBorderRadius;
  double? get outlinedButtonBorderRadius => _outlinedButtonBorderRadius;
  Future<void> setOutlinedButtonBorderRadius(double? value,
      [bool notify = true]) async {
    if (value == _outlinedButtonBorderRadius) return;
    _outlinedButtonBorderRadius = value;
    if (notify) notifyListeners();
    await _themeService.saveOutlinedButtonBorderRadius(value);
  }

  late double? _textButtonBorderRadius;
  double? get textButtonBorderRadius => _textButtonBorderRadius;
  Future<void> setTextButtonBorderRadius(double? value,
      [bool notify = true]) async {
    if (value == _textButtonBorderRadius) return;
    _textButtonBorderRadius = value;
    if (notify) notifyListeners();
    await _themeService.saveTextButtonBorderRadius(value);
  }

  late double? _toggleButtonsBorderRadius;
  double? get toggleButtonsBorderRadius => _toggleButtonsBorderRadius;
  Future<void> setToggleButtonsBorderRadius(double? value,
      [bool notify = true]) async {
    if (value == _toggleButtonsBorderRadius) return;
    _toggleButtonsBorderRadius = value;
    if (notify) notifyListeners();
    await _themeService.saveToggleButtonsBorderRadius(value);
  }

  late double? _cardBorderRadius;
  double? get cardBorderRadius => _cardBorderRadius;
  Future<void> setCardBorderRadius(double? value, [bool notify = true]) async {
    if (value == _cardBorderRadius) return;
    _cardBorderRadius = value;
    if (notify) notifyListeners();
    await _themeService.saveCardBorderRadius(value);
  }

  late double _sysBarOpacity;
  double get sysBarOpacity => _sysBarOpacity;
  Future<void> setSysBarOpacity(double? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _sysBarOpacity) return;
    _sysBarOpacity = value;
    if (notify) notifyListeners();
    await _themeService.saveSysBarOpacity(value);
  }
}
