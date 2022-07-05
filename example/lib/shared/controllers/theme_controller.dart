import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../const/store.dart';
import '../services/theme_service.dart';

/// Enum to indicate which palette we are using.
///
/// Used to show which TonalPalette a hovered color belongs to.
/// Tucking this ChangeNotifier into the ThemeController is not really kosher
/// it should be in its own Provider/Riverpod or Inherited widget.
///
enum TonalPalettes {
  primary,
  secondary,
  tertiary,
  error,
  neutral,
  neutralVariant,
}

/// The ThemeController is used by many Widgets that users can interact with.
///
/// Widgets can read user theme settings, set user theme settings and listen
/// to user's theme changes.
///
/// The controller glues data Services to Flutter Widgets. The ThemeController
/// uses the ThemeService to save and load theme settings.
///
/// This setup on purpose demonstrates persisting each theme setting value
/// as its own string key and value pair. With this amount of values,
/// bundling them all up in a data class and persisting them all as one big
/// serialized JSON string, with just one settings key, would be more
/// convenient. On the other hand, this is probably more file resource
/// efficient and gives us faster saves of persisted slider values, that can
/// be dragged quickly in the UI. Writing this setup for this many properties is
/// a bit tedious, even if it is simple and very mechanical.
///
/// Normally you would probably not have this many settings properties you
/// want to persist locally (or remotely), in that case this approach is also
/// the simpler and more convenient one. In this particular case though, well
/// maybe not with this amount of props.
//
// ignore:prefer_mixin
class ThemeController with ChangeNotifier {
  ThemeController(this._themeService);

  // Make the ThemeService private so it cannot be used directly.
  final ThemeService _themeService;

  /// Load all ThemeController settings from the ThemeService. It may load from
  /// app coded defaults, a local database or the internet. The controller only
  /// knows it can load all the setting default values from the service.
  Future<void> loadAll() async {
    //
    // GENERAL SETTINGS.
    // ThemeMode, use FlexColorScheme and sub-themes, current scheme, view, etc.
    _themeMode =
        await _themeService.load(Store.keyThemeMode, Store.defaultThemeMode);
    _useFlexColorScheme = await _themeService.load(
        Store.keyUseFlexColorScheme, Store.defaultUseFlexColorScheme);
    _useSubThemes = await _themeService.load(
        Store.keyUseSubThemes, Store.defaultUseSubThemes);
    _useFlutterDefaults = await _themeService.load(
        Store.keyUseFlutterDefaults, Store.defaultUseFlutterDefaults);
    _isLargeGridView = await _themeService.load(
        Store.keyIsLargeGridView, Store.defaultIsLargeGridView);
    _viewIndex =
        await _themeService.load(Store.keyViewIndex, Store.defaultViewIndex);
    _useTextTheme = await _themeService.load(
        Store.keyUseTextTheme, Store.defaultUseTextTheme);
    _useAppFont =
        await _themeService.load(Store.keyUseAppFont, Store.defaultUseAppFont);
    _usedScheme =
        await _themeService.load(Store.keyUsedScheme, Store.defaultUsedScheme);
    _schemeIndex = await _themeService.load(
        Store.keySchemeIndex, Store.defaultSchemeIndex);
    _interactionEffects = await _themeService.load(
        Store.keyInteractionEffects, Store.defaultInteractionEffects);
    _defaultRadius = await _themeService.load(
      Store.keyDefaultRadius,
      Store.defaultDefaultRadius,
    );
    _tooltipsMatchBackground = await _themeService.load(
        Store.keyTooltipsMatchBackground, Store.defaultTooltipsMatchBackground);
    //
    // Surface and blend SETTINGS.
    _surfaceModeLight = await _themeService.load(
        Store.keySurfaceModeLight, Store.defaultSurfaceModeLight);
    _surfaceModeDark = await _themeService.load(
        Store.keySurfaceModeDark, Store.defaultSurfaceModeDark);
    _blendLevel =
        await _themeService.load(Store.keyBlendLevel, Store.defaultBlendLevel);
    _blendLevelDark = await _themeService.load(
        Store.keyBlendLevelDark, Store.defaultBlendLevelDark);
    _blendOnLevel = await _themeService.load(
        Store.keyOnBlendLevel, Store.defaultBlendOnLevel);
    _blendOnLevelDark = await _themeService.load(
        Store.keyBlendOnLevelDark, Store.defaultBlendOnLevelDark);
    _usedColors =
        await _themeService.load(Store.keyUsedColors, Store.defaultUsedColors);
    _swapLightColors = await _themeService.load(
        Store.keySwapLightColors, Store.defaultSwapLightColors);
    _swapDarkColors = await _themeService.load(
        Store.keySwapDarkColors, Store.defaultSwapDarkColors);
    _lightIsWhite = await _themeService.load(
        Store.keyLightIsWhite, Store.defaultLightIsWhite);
    _darkIsTrueBlack = await _themeService.load(
        Store.keyDarkIsTrueBlack, Store.defaultDarkIsTrueBlack);
    _useDarkColorsForSeed = await _themeService.load(
        Store.keyUseDarkColorsForSeed, Store.defaultUseDarkColorsForSeed);
    _useToDarkMethod = await _themeService.load(
        Store.keyUseToDarkMethod, Store.defaultUseToDarkMethod);
    _toDarkSwapPrimaryAndContainer = await _themeService.load(
        Store.keyToDarkSwapPrimaryAndContainer,
        Store.defaultToDarkSwapPrimaryAndContainer);
    _darkMethodLevel = await _themeService.load(
        Store.keyDarkMethodLevel, Store.defaultDarkMethodLevel);
    _blendLightOnColors = await _themeService.load(
        Store.keyBlendLightOnColors, Store.defaultBlendLightOnColors);
    _blendDarkOnColors = await _themeService.load(
        Store.keyBlendDarkOnColors, Store.defaultBlendDarkOnColors);
    _blendLightTextTheme = await _themeService.load(
        Store.keyBlendLightTextTheme, Store.defaultBlendLightTextTheme);
    _blendDarkTextTheme = await _themeService.load(
        Store.keyBlendDarkTextTheme, Store.defaultBlendDarkTextTheme);
    //
    // Material 3 and Seed ColorScheme SETTINGS.
    _useMaterial3 = await _themeService.load(
        Store.keyUseMaterial3, Store.defaultUseMaterial3);
    _useKeyColors = await _themeService.load(
        Store.keyUseKeyColors, Store.defaultUseKeyColors);
    _useSecondary = await _themeService.load(
        Store.keyUseSecondary, Store.defaultUseSecondary);
    _useTertiary = await _themeService.load(
        Store.keyUseTertiary, Store.defaultUseTertiary);
    _keepPrimary = await _themeService.load(
        Store.keyKeepPrimary, Store.defaultKeepPrimary);
    _keepSecondary = await _themeService.load(
        Store.keyKeepSecondary, Store.defaultKeepSecondary);
    _keepTertiary = await _themeService.load(
        Store.keyKeepTertiary, Store.defaultKeepTertiary);
    _keepPrimaryContainer = await _themeService.load(
        Store.keyKeepPrimaryContainer, Store.defaultKeepPrimaryContainer);
    _keepSecondaryContainer = await _themeService.load(
        Store.keyKeepSecondaryContainer, Store.defaultKeepSecondaryContainer);
    _keepTertiaryContainer = await _themeService.load(
        Store.keyKeepTertiaryContainer, Store.defaultKeepTertiaryContainer);
    _keepDarkPrimary = await _themeService.load(
        Store.keyKeepDarkPrimary, Store.defaultKeepDarkPrimary);
    _keepDarkSecondary = await _themeService.load(
        Store.keyKeepDarkSecondary, Store.defaultKeepDarkSecondary);
    _keepDarkTertiary = await _themeService.load(
        Store.keyKeepDarkTertiary, Store.defaultKeepDarkTertiary);
    _keepDarkPrimaryContainer = await _themeService.load(
        Store.keyKeepDarkPrimaryContainer,
        Store.defaultKeepDarkPrimaryContainer);
    _keepDarkSecondaryContainer = await _themeService.load(
        Store.keyKeepDarkSecondaryContainer,
        Store.defaultKeepDarkSecondaryContainer);
    _keepDarkTertiaryContainer = await _themeService.load(
        Store.keyKeepDarkTertiaryContainer,
        Store.defaultKeepDarkTertiaryContainer);
    _usedFlexToneSetup = await _themeService.load(
        Store.keyUsedFlexToneSetup, Store.defaultUsedFlexToneSetup);
    _useM3ErrorColors = await _themeService.load(
        Store.keyUseM3ErrorColors, Store.defaultUseM3ErrorColors);
    //
    // InputDecorator SETTINGS.
    _inputDecoratorSchemeColorLight = await _themeService.load(
        Store.keyInputDecoratorSchemeColorLight,
        Store.defaultInputDecoratorSchemeColorLight);
    _inputDecoratorSchemeColorDark = await _themeService.load(
        Store.keyInputDecoratorSchemeColorDark,
        Store.defaultInputDecoratorSchemeColorDark);
    _inputDecoratorIsFilled = await _themeService.load(
        Store.keyInputDecoratorIsFilled, Store.defaultInputDecoratorIsFilled);
    _inputDecoratorBorderType = await _themeService.load(
        Store.keyInputDecoratorBorderType,
        Store.defaultInputDecoratorBorderType);
    _inputDecoratorBorderRadius = await _themeService.load(
        Store.keyInputDecoratorBorderRadius,
        Store.defaultInputDecoratorBorderRadius);
    _inputDecoratorUnfocusedHasBorder = await _themeService.load(
        Store.keyInputDecoratorUnfocusedHasBorder,
        Store.defaultInputDecoratorUnfocusedHasBorder);
    _inputDecoratorUnfocusedBorderIsColored = await _themeService.load(
        Store.keyInputDecoratorUnfocusedBorderIsColored,
        Store.defaultInputDecoratorUnfocusedBorderIsColored);
    //
    // AppBar SETTINGS.
    _appBarStyleLight = await _themeService.load(
        Store.keyAppBarStyleLight, Store.defaultAppBarStyleLight);
    _appBarStyleDark = await _themeService.load(
        Store.keyAppBarStyleDark, Store.defaultAppBarStyleDark);
    _appBarOpacityLight = await _themeService.load(
        Store.keyAppBarOpacityLight, Store.defaultAppBarOpacityLight);
    _appBarOpacityDark = await _themeService.load(
        Store.keyAppBarOpacityDark, Store.defaultAppBarOpacityDark);
    _appBarElevationLight = await _themeService.load(
        Store.keyAppBarElevationLight, Store.defaultAppBarElevationLight);
    _appBarElevationDark = await _themeService.load(
        Store.keyAppBarElevationDark, Store.defaultAppBarElevationDark);
    _transparentStatusBar = await _themeService.load(
        Store.keyTransparentStatusBar, Store.defaultTransparentStatusBar);
    _appBarBackgroundSchemeColorLight = await _themeService.load(
        Store.keyAppBarBackgroundSchemeColorLight,
        Store.defaultAppBarBackgroundSchemeColorLight);
    _appBarBackgroundSchemeColorDark = await _themeService.load(
        Store.keyAppBarBackgroundSchemeColorDark,
        Store.defaultAppBarBackgroundSchemeColorDark);
    //
    // TabBar SETTINGS.
    _tabBarStyle = await _themeService.load(
        Store.keyTabBarStyle, Store.defaultTabBarStyle);
    _tabBarIndicatorLight = await _themeService.load(
        Store.keyTabBarIndicatorLight, Store.defaultTabBarIndicatorLight);
    _tabBarIndicatorDark = await _themeService.load(
        Store.keyTabBarIndicatorDark, Store.defaultTabBarIndicatorDark);
    _tabBarItemSchemeColorLight = await _themeService.load(
        Store.keyTabBarItemSchemeColorLight,
        Store.defaultTabBarItemSchemeColorLight);
    _tabBarItemSchemeColorDark = await _themeService.load(
        Store.keyTabBarItemSchemeColorDark,
        Store.defaultTabBarItemSchemeColorDark);
    //
    // BottomSheet SETTINGS.
    _bottomSheetBorderRadius = await _themeService.load(
        Store.keyBottomSheetBorderRadius, Store.defaultBottomSheetBorderRadius);
    //
    // Android System Navigator bar SETTINGS.
    _sysNavBarStyle = await _themeService.load(
        Store.keySysNavBarStyle, Store.defaultSysNavBarStyle);
    _sysNavBarOpacity = await _themeService.load(
        Store.keySysNavBarOpacity, Store.defaultSysBarOpacity);
    _useSysNavDivider = await _themeService.load(
        Store.keyUseSysNavDivider, Store.defaultUseSysNavDivider);
    //
    // BottomNavigationBar SETTINGS.
    _bottomNavBarBackgroundSchemeColor = await _themeService.load(
        Store.keyBottomNavBarBackgroundSchemeColor,
        Store.defaultBottomNavBarBackgroundSchemeColor);
    _bottomNavigationBarOpacity = await _themeService.load(
        Store.keyBottomNavigationBarOpacity,
        Store.defaultBottomNavigationBarOpacity);
    _bottomNavigationBarElevation = await _themeService.load(
        Store.keyBottomNavigationBarElevation,
        Store.defaultBottomNavigationBarElevation);
    _bottomNavBarSelectedSchemeColor = await _themeService.load(
        Store.keyBottomNavBarSelectedItemSchemeColor,
        Store.defaultBottomNavBarSelectedItemSchemeColor);
    _bottomNavBarUnselectedSchemeColor = await _themeService.load(
        Store.keyBottomNavBarUnselectedSchemeColor,
        Store.defaultBottomNavBarUnselectedSchemeColor);
    _bottomNavBarMuteUnselected = await _themeService.load(
        Store.keyBottomNavBarMuteUnselected,
        Store.defaultBottomNavBarMuteUnselected);
    _bottomNavShowSelectedLabels = await _themeService.load(
        Store.keyBottomNavShowSelectedLabels,
        Store.defaultBottomNavShowSelectedLabels);
    _bottomNavShowUnselectedLabels = await _themeService.load(
        Store.keyBottomNavShowUnselectedLabels,
        Store.defaultBottomNavShowUnselectedLabels);
    //
    // NavigationBar SETTINGS.
    _navBarBackgroundSchemeColor = await _themeService.load(
        Store.keyNavBarBackgroundSchemeColor,
        Store.defaultNavBarBackgroundSchemeColor);
    _navBarOpacity = await _themeService.load(
        Store.keyNavBarOpacity, Store.defaultNavBarOpacity);
    _navBarHeight = await _themeService.load(
        Store.keyNavBarHeight, Store.defaultNavBarHeight);
    _navBarSelectedSchemeColor = await _themeService.load(
        Store.keyNavBarSelectedItemSchemeColor,
        Store.defaultNavBarSelectedItemSchemeColor);
    _navBarUnselectedSchemeColor = await _themeService.load(
        Store.keyNavBarUnselectedSchemeColor,
        Store.defaultNavBarUnselectedSchemeColor);
    _navBarMuteUnselected = await _themeService.load(
        Store.keyNavBarMuteUnselected, Store.defaultNavBarMuteUnselected);
    _navBarIndicatorSchemeColor = await _themeService.load(
        Store.keyNavBarIndicatorSchemeColor,
        Store.defaultNavBarIndicatorSchemeColor);
    _navBarIndicatorOpacity = await _themeService.load(
        Store.keyNavBarIndicatorOpacity, Store.defaultNavBarIndicatorOpacity);
    _navBarLabelBehavior = await _themeService.load(
        Store.keyNavBarLabelBehavior, Store.defaultNavBarLabelBehavior);
    //
    // NavigationRail SETTINGS.
    _navRailBackgroundSchemeColor = await _themeService.load(
        Store.keyNavRailBackgroundSchemeColor,
        Store.defaultNavRailBackgroundSchemeColor);
    _navRailOpacity = await _themeService.load(
        Store.keyNavRailOpacity, Store.defaultNavRailOpacity);
    _navigationRailElevation = await _themeService.load(
        Store.keyNavigationRailElevation, Store.defaultNavigationRailElevation);
    _navRailSelectedSchemeColor = await _themeService.load(
        Store.keyNavRailSelectedItemSchemeColor,
        Store.defaultNavRailSelectedItemSchemeColor);
    _navRailUnselectedSchemeColor = await _themeService.load(
        Store.keyNavRailUnselectedSchemeColor,
        Store.defaultNavRailUnselectedSchemeColor);
    _navRailMuteUnselected = await _themeService.load(
        Store.keyNavRailMuteUnselected, Store.defaultNavRailMuteUnselected);
    _navRailLabelType = await _themeService.load(
        Store.keyNavRailLabelType, Store.defaultNavRailLabelType);
    _navRailUseIndicator = await _themeService.load(
        Store.keyNavRailUseIndicator, Store.defaultNavRailUseIndicator);
    _navRailIndicatorSchemeColor = await _themeService.load(
        Store.keyNavRailIndicatorSchemeColor,
        Store.defaultNavRailIndicatorSchemeColor);
    _navRailIndicatorOpacity = await _themeService.load(
        Store.keyNavRailIndicatorOpacity, Store.defaultNavRailIndicatorOpacity);
    //
    // Button SETTINGS.
    _textButtonSchemeColor = await _themeService.load(
        Store.keyTextButtonSchemeColor, Store.defaultTextButtonSchemeColor);
    _textButtonBorderRadius = await _themeService.load(
        Store.keyTextButtonBorderRadius, Store.defaultTextButtonBorderRadius);
    _elevatedButtonSchemeColor = await _themeService.load(
        Store.keyElevatedButtonSchemeColor,
        Store.defaultElevatedButtonSchemeColor);
    _elevatedButtonBorderRadius = await _themeService.load(
        Store.keyElevatedButtonBorderRadius,
        Store.defaultElevatedButtonBorderRadius);
    _outlinedButtonSchemeColor = await _themeService.load(
        Store.keyOutlinedButtonSchemeColor,
        Store.defaultOutlinedButtonSchemeColor);
    _outlinedButtonBorderRadius = await _themeService.load(
        Store.keyOutlinedButtonBorderRadius,
        Store.defaultOutlinedButtonBorderRadius);
    _toggleButtonsSchemeColor = await _themeService.load(
        Store.keyToggleButtonsSchemeColor,
        Store.defaultToggleButtonsSchemeColor);
    _toggleButtonsBorderRadius = await _themeService.load(
        Store.keyToggleButtonsBorderRadius,
        Store.defaultToggleButtonsBorderRadius);
    //
    // Toggleable SETTINGS.
    _unselectedToggleIsColored = await _themeService.load(
        Store.keyUnselectedToggleIsColored,
        Store.defaultUnselectedToggleIsColored);
    _switchSchemeColor = await _themeService.load(
        Store.keySwitchSchemeColor, Store.defaultSwitchSchemeColor);
    _checkboxSchemeColor = await _themeService.load(
        Store.keyCheckboxSchemeColor, Store.defaultCheckboxSchemeColor);
    _radioSchemeColor = await _themeService.load(
        Store.keyRadioSchemeColor, Store.defaultRadioSchemeColor);
    //
    // Fab, Chip, SnackBar, Popup, Card nad Dialog SETTINGS.
    _fabUseShape = await _themeService.load(
        Store.keyFabUseShape, Store.defaultFabUseShape);
    _fabBorderRadius = await _themeService.load(
        Store.keyFabBorderRadius, Store.defaultFabBorderRadius);
    _fabSchemeColor = await _themeService.load(
        Store.keyFabSchemeColor, Store.defaultFabSchemeColor);
    _chipSchemeColor = await _themeService.load(
        Store.keyChipSchemeColor, Store.defaultChipSchemeColor);
    _chipBorderRadius = await _themeService.load(
        Store.keyChipBorderRadius, Store.defaultChipBorderRadius);
    _snackBarSchemeColor = await _themeService.load(
        Store.keySnackBarSchemeColor, Store.defaultSnackBarSchemeColor);
    _popupMenuOpacity = await _themeService.load(
        Store.keyPopupMenuOpacity, Store.defaultPopupMenuOpacity);
    _popupMenuBorderRadius = await _themeService.load(
        Store.keyPopupMenuBorderRadius, Store.defaultPopupMenuBorderRadius);
    _cardBorderRadius = await _themeService.load(
        Store.keyCardBorderRadius, Store.defaultCardBorderRadius);
    _dialogBackgroundSchemeColor = await _themeService.load(
        Store.keyDialogBackgroundSchemeColor,
        Store.defaultDialogBackgroundSchemeColor);
    _dialogBorderRadius = await _themeService.load(
        Store.keyDialogBorderRadius, Store.defaultDialogBorderRadius);
    //
    // Custom surface tint color SETTINGS.
    _surfaceTintLight = await _themeService.load(
        Store.keySurfaceTintLight, Store.defaultSurfaceTintLight);
    _surfaceTintDark = await _themeService.load(
        Store.keySurfaceTintDark, Store.defaultSurfaceTintDark);
    //
    // Custom color SETTINGS.
    _primaryLight = await _themeService.load(
        Store.keyPrimaryLight, Store.defaultPrimaryLight);
    _primaryContainerLight = await _themeService.load(
        Store.keyPrimaryContainerLight, Store.defaultPrimaryContainerLight);
    _secondaryLight = await _themeService.load(
        Store.keySecondaryLight, Store.defaultSecondaryLight);
    _secondaryContainerLight = await _themeService.load(
        Store.keySecondaryContainerLight, Store.defaultSecondaryContainerLight);
    _tertiaryLight = await _themeService.load(
        Store.keyTertiaryLight, Store.defaultTertiaryLight);
    _tertiaryContainerLight = await _themeService.load(
        Store.keyTertiaryContainerLight, Store.defaultTertiaryContainerLight);
    _primaryDark = await _themeService.load(
        Store.keyPrimaryDark, Store.defaultPrimaryDark);
    _primaryContainerDark = await _themeService.load(
        Store.keyPrimaryContainerDark, Store.defaultPrimaryContainerDark);
    _secondaryDark = await _themeService.load(
        Store.keySecondaryDark, Store.defaultSecondaryDark);
    _secondaryContainerDark = await _themeService.load(
        Store.keySecondaryContainerDark, Store.defaultSecondaryContainerDark);
    _tertiaryDark = await _themeService.load(
        Store.keyTertiaryDark, Store.defaultTertiaryDark);
    _tertiaryContainerDark = await _themeService.load(
        Store.keyTertiaryContainerDark, Store.defaultTertiaryContainerDark);

    // Not persisted, locally controlled popup selection for ThemeService,
    // resets to actual used platform when settings are reset or app loaded.
    _platform = defaultTargetPlatform;

    notifyListeners();
  }

  /// Reset all values to default values and save as current settings.
  ///
  /// Calls setters with notify = false, and calls notifyListeners once
  /// after all values have been reset and persisted.
  ///
  /// The reset to default actually, sets and persist all property values that
  /// deviates from its defined default value. Only values that actually
  /// deviate from their default value are changed. The property setters manage
  /// this. They are all set with no notification and notifyListeners() is
  /// only called once, after all updates have been made.
  ///
  /// Does not reset the custom colors to their default, only theme settings.
  /// We keep the custom colors at their specified values even if theme settings
  /// are reset. There is a separate function to reset the custom colors.
  Future<void> resetAllToDefaults() async {
    //
    // GENERAL SETTINGS.
    // ThemeMode, use FlexColorScheme and sub-themes, current scheme, view, etc.
    await setThemeMode(Store.defaultThemeMode, false);
    await setUseFlexColorScheme(Store.defaultUseFlexColorScheme, false);
    await setUseSubThemes(Store.defaultUseSubThemes, false);
    await setUseFlutterDefaults(Store.defaultUseFlutterDefaults, false);
    // The IsLargeGridView and ViewIndex settings are never reset to default in
    // a reset, we always keep the current screen and panel on page/panel view.
    await setUseTextTheme(Store.defaultUseTextTheme, false);
    await setUseAppFont(Store.defaultUseAppFont, false);
    await setUsedScheme(Store.defaultUsedScheme, false);
    await setSchemeIndex(Store.defaultSchemeIndex, false);
    await setInteractionEffects(Store.defaultInteractionEffects, false);
    await setDefaultRadius(Store.defaultDefaultRadius, false);
    await setTooltipsMatchBackground(
        Store.defaultTooltipsMatchBackground, false);
    //
    // Surface and blend SETTINGS.
    await setSurfaceModeLight(Store.defaultSurfaceModeLight, false);
    await setSurfaceModeDark(Store.defaultSurfaceModeDark, false);
    await setBlendLevel(Store.defaultBlendLevel, false);
    await setBlendLevelDark(Store.defaultBlendLevelDark, false);
    await setBlendOnLevel(Store.defaultBlendOnLevel, false);
    await setBlendOnLevelDark(Store.defaultBlendOnLevelDark, false);
    await setUsedColors(Store.defaultUsedColors, false);
    await setSwapLightColors(Store.defaultSwapLightColors, false);
    await setSwapDarkColors(Store.defaultSwapDarkColors, false);
    await setLightIsWhite(Store.defaultLightIsWhite, false);
    await setDarkIsTrueBlack(Store.defaultDarkIsTrueBlack, false);
    await setUseDarkColorsForSeed(Store.defaultUseDarkColorsForSeed, false);
    await setUseToDarkMethod(Store.defaultUseToDarkMethod, false);
    await setToDarkSwapPrimaryAndContainer(
        Store.defaultToDarkSwapPrimaryAndContainer, false);
    await setDarkMethodLevel(Store.defaultDarkMethodLevel, false);
    await setBlendLightOnColors(Store.defaultBlendLightOnColors, false);
    await setBlendDarkOnColors(Store.defaultBlendDarkOnColors, false);
    await setBlendLightTextTheme(Store.defaultBlendLightTextTheme, false);
    await setBlendDarkTextTheme(Store.defaultBlendDarkTextTheme, false);
    //
    // Material 3 and Seed ColorScheme SETTINGS.
    await setUseMaterial3(Store.defaultUseMaterial3, false);
    await setUseKeyColors(Store.defaultUseKeyColors, false);
    await setUseSecondary(Store.defaultUseSecondary, false);
    await setUseTertiary(Store.defaultUseTertiary, false);
    await setKeepPrimary(Store.defaultKeepPrimary, false);
    await setKeepSecondary(Store.defaultKeepSecondary, false);
    await setKeepTertiary(Store.defaultKeepTertiary, false);
    await setKeepPrimaryContainer(Store.defaultKeepPrimaryContainer, false);
    await setKeepSecondaryContainer(Store.defaultKeepSecondaryContainer, false);
    await setKeepTertiaryContainer(Store.defaultKeepTertiaryContainer, false);
    await setKeepDarkPrimary(Store.defaultKeepDarkPrimary, false);
    await setKeepDarkSecondary(Store.defaultKeepDarkSecondary, false);
    await setKeepDarkTertiary(Store.defaultKeepDarkTertiary, false);
    await setKeepDarkPrimaryContainer(
        Store.defaultKeepDarkPrimaryContainer, false);
    await setKeepDarkSecondaryContainer(
        Store.defaultKeepDarkSecondaryContainer, false);
    await setKeepDarkTertiaryContainer(
        Store.defaultKeepDarkTertiaryContainer, false);
    await setUsedFlexToneSetup(Store.defaultUsedFlexToneSetup, false);
    await setUseM3ErrorColors(Store.defaultUseM3ErrorColors, false);
    //
    // InputDecorator SETTINGS.
    await setInputDecoratorSchemeColorLight(
        Store.defaultInputDecoratorSchemeColorLight, false);
    await setInputDecoratorSchemeColorDark(
        Store.defaultInputDecoratorSchemeColorDark, false);
    await setInputDecoratorIsFilled(Store.defaultInputDecoratorIsFilled, false);
    await setInputDecoratorBorderType(
        Store.defaultInputDecoratorBorderType, false);
    await setInputDecoratorBorderRadius(
        Store.defaultInputDecoratorBorderRadius, false);
    await setInputDecoratorUnfocusedHasBorder(
        Store.defaultInputDecoratorUnfocusedHasBorder, false);
    await setInputDecoratorUnfocusedBorderIsColored(
        Store.defaultInputDecoratorUnfocusedBorderIsColored, false);
    //
    // AppBar SETTINGS.
    await setAppBarStyleLight(Store.defaultAppBarStyleLight, false);
    await setAppBarStyleDark(Store.defaultAppBarStyleDark, false);
    await setAppBarOpacityLight(Store.defaultAppBarOpacityLight, false);
    await setAppBarOpacityDark(Store.defaultAppBarOpacityDark, false);
    await setAppBarElevationLight(Store.defaultAppBarElevationLight, false);
    await setAppBarElevationDark(Store.defaultAppBarElevationDark, false);
    await setTransparentStatusBar(Store.defaultTransparentStatusBar, false);
    await setAppBarBackgroundSchemeColorLight(
        Store.defaultAppBarBackgroundSchemeColorLight, false);
    await setAppBarBackgroundSchemeColorDark(
        Store.defaultAppBarBackgroundSchemeColorDark, false);
    //
    // TabBar SETTINGS.
    await setTabBarStyle(Store.defaultTabBarStyle, false);
    await setTabBarIndicatorLight(Store.defaultTabBarIndicatorLight, false);
    await setTabBarIndicatorDark(Store.defaultTabBarIndicatorDark, false);
    await setTabBarItemSchemeColorLight(
        Store.defaultTabBarItemSchemeColorLight, false);
    await setTabBarItemSchemeColorDark(
        Store.defaultTabBarItemSchemeColorDark, false);
    //
    // BottomSheet SETTINGS.
    await setBottomSheetBorderRadius(
        Store.defaultBottomSheetBorderRadius, false);
    //
    // Android System Navigator bar SETTINGS.
    await setSysNavBarStyle(Store.defaultSysNavBarStyle, false);
    await setSysBarOpacity(Store.defaultSysBarOpacity, false);
    await setUseSysNavDivider(Store.defaultUseSysNavDivider, false);
    //
    // BottomNavigationBar SETTINGS.
    await setBottomNavBarBackgroundSchemeColor(
        Store.defaultBottomNavBarBackgroundSchemeColor, false);
    await setBottomNavigationBarOpacity(
        Store.defaultBottomNavigationBarOpacity, false);
    await setBottomNavigationBarElevation(
        Store.defaultBottomNavigationBarElevation, false);
    await setBottomNavBarSelectedSchemeColor(
        Store.defaultBottomNavBarSelectedItemSchemeColor, false);
    await setBottomNavBarUnselectedSchemeColor(
        Store.defaultBottomNavBarUnselectedSchemeColor, false);
    await setBottomNavBarMuteUnselected(
        Store.defaultBottomNavBarMuteUnselected, false);
    await setBottomNavShowSelectedLabels(
        Store.defaultBottomNavShowSelectedLabels, false);
    await setBottomNavShowUnselectedLabels(
        Store.defaultBottomNavShowUnselectedLabels, false);
    //
    // NavigationBar SETTINGS.
    await setNavBarBackgroundSchemeColor(
        Store.defaultNavBarBackgroundSchemeColor, false);
    await setNavBarOpacity(Store.defaultNavBarOpacity, false);
    await setNavBarHeight(Store.defaultNavBarHeight, false);
    await setNavBarSelectedSchemeColor(
        Store.defaultNavBarSelectedItemSchemeColor, false);
    await setNavBarUnselectedSchemeColor(
        Store.defaultNavBarUnselectedSchemeColor, false);
    await setNavBarMuteUnselected(Store.defaultNavBarMuteUnselected, false);
    await setNavBarIndicatorSchemeColor(
        Store.defaultNavBarIndicatorSchemeColor, false);
    await setNavBarIndicatorOpacity(Store.defaultNavBarIndicatorOpacity, false);
    await setNavBarLabelBehavior(Store.defaultNavBarLabelBehavior, false);
    //
    // NavigationRail SETTINGS.
    await setNavRailBackgroundSchemeColor(
        Store.defaultNavRailBackgroundSchemeColor, false);
    await setNavRailOpacity(Store.defaultNavRailOpacity, false);
    await setNavigationRailElevation(
        Store.defaultNavigationRailElevation, false);
    await setNavRailSelectedSchemeColor(
        Store.defaultNavRailSelectedItemSchemeColor, false);
    await setNavRailUnselectedSchemeColor(
        Store.defaultNavRailUnselectedSchemeColor, false);
    await setNavRailMuteUnselected(Store.defaultNavRailMuteUnselected, false);
    await setNavRailLabelType(Store.defaultNavRailLabelType, false);
    await setNavRailUseIndicator(Store.defaultNavRailUseIndicator, false);
    await setNavRailIndicatorSchemeColor(
        Store.defaultNavRailIndicatorSchemeColor, false);
    await setNavRailIndicatorOpacity(
        Store.defaultNavRailIndicatorOpacity, false);
    //
    // Button SETTINGS.
    await setTextButtonSchemeColor(Store.defaultTextButtonSchemeColor, false);
    await setTextButtonBorderRadius(Store.defaultTextButtonBorderRadius, false);
    await setElevatedButtonSchemeColor(
        Store.defaultElevatedButtonSchemeColor, false);
    await setElevatedButtonBorderRadius(
        Store.defaultElevatedButtonBorderRadius, false);
    await setOutlinedButtonSchemeColor(
        Store.defaultOutlinedButtonSchemeColor, false);
    await setOutlinedButtonBorderRadius(
        Store.defaultOutlinedButtonBorderRadius, false);
    await setToggleButtonsSchemeColor(
        Store.defaultToggleButtonsSchemeColor, false);
    await setToggleButtonsBorderRadius(
        Store.defaultToggleButtonsBorderRadius, false);
    //
    // Toggleable SETTINGS.
    await setUnselectedToggleIsColored(
        Store.defaultUnselectedToggleIsColored, false);
    await setSwitchSchemeColor(Store.defaultSwitchSchemeColor, false);
    await setCheckboxSchemeColor(Store.defaultCheckboxSchemeColor, false);
    await setRadioSchemeColor(Store.defaultRadioSchemeColor, false);
    //
    // Fab, Chip, SnackBar, Popup, Card nad Dialog SETTINGS.
    await setFabUseShape(Store.defaultFabUseShape, false);
    await setFabBorderRadius(Store.defaultFabBorderRadius, false);
    await setFabSchemeColor(Store.defaultFabSchemeColor, false);
    await setChipSchemeColor(Store.defaultChipSchemeColor, false);
    await setChipBorderRadius(Store.defaultChipBorderRadius, false);
    await setSnackBarSchemeColor(Store.defaultSnackBarSchemeColor, false);
    await setPopupMenuOpacity(Store.defaultPopupMenuOpacity, false);
    await setPopupMenuBorderRadius(Store.defaultPopupMenuBorderRadius, false);
    await setCardBorderRadius(Store.defaultCardBorderRadius, false);
    await setDialogBackgroundSchemeColor(
        Store.defaultDialogBackgroundSchemeColor, false);
    await setDialogBorderRadius(Store.defaultDialogBorderRadius, false);
    //
    // Surface tint colors.
    await setSurfaceTintLight(Store.defaultSurfaceTintLight, false);
    await setSurfaceTintDark(Store.defaultSurfaceTintDark, false);
    //
    // Not persisted, locally controlled popup selection for ThemeService,
    // resets to actual used platform when settings are reset or app loaded.
    await setPlatform(defaultTargetPlatform, false);
    notifyListeners();
  }

  /// Reset the custom color values to their default values.
  ///
  /// Calls setters with notify = false, and calls notifyListeners once
  /// after all values have been reset and persisted.
  ///
  /// The reset to default actually, sets and persist all property values that
  /// deviates from its defined default value. Only values that actually
  /// deviate from their default value are changed. The property setters manage
  /// this. They are all set with not notification and notifyListeners() is
  /// only called once, weh all updates have been made.
  Future<void> resetCustomColorsToDefaults() async {
    await setPrimaryLight(Store.defaultPrimaryLight, false);
    await setPrimaryContainerLight(Store.defaultPrimaryContainerLight, false);
    await setSecondaryLight(Store.defaultSecondaryLight, false);
    await setSecondaryContainerLight(
        Store.defaultSecondaryContainerLight, false);
    await setTertiaryLight(Store.defaultTertiaryLight, false);
    await setTertiaryContainerLight(Store.defaultTertiaryContainerLight, false);
    await setPrimaryDark(Store.defaultPrimaryDark, false);
    await setPrimaryContainerDark(Store.defaultPrimaryContainerDark, false);
    await setSecondaryDark(Store.defaultSecondaryDark, false);
    await setSecondaryContainerDark(Store.defaultSecondaryContainerDark, false);
    await setTertiaryDark(Store.defaultTertiaryDark, false);
    await setTertiaryContainerDark(Store.defaultTertiaryContainerDark, false);
    notifyListeners();
  }

  // GENERAL SETTINGS.
  // ThemeMode, use FlexColorScheme and sub-themes, current scheme, view, etc.
  // ===========================================================================

  // Make all ThemeController properties private so they cannot be used
  // directly without also persisting the changes using the ThemeService,
  // by making a setter and getter for each property.

  // Private value, getter and setter for the ThemeMode
  late ThemeMode _themeMode;
  // Getter for the current ThemeMode.
  ThemeMode get themeMode => _themeMode;
  // Set and persist new ThemeMode value.
  Future<void> setThemeMode(ThemeMode? value, [bool notify = true]) async {
    // No work if null value passed.
    if (value == null) return;
    // Do not perform any work if new and old value are identical.
    if (value == _themeMode) return;
    // Otherwise, assign new value to private property.
    _themeMode = value;
    // Inform all listeners a change has occurred, if notify flag is true.
    if (notify) notifyListeners();
    // Persist the change to whatever storage is used with the ThemeService.
    await _themeService.save(Store.keyThemeMode, value);
  }

  // Repeat above pattern for all other theme settings. The properties will
  // not be further explained, property names correspond to equivalent
  // FlexColorScheme properties.
  late bool _useFlexColorScheme;
  bool get useFlexColorScheme => _useFlexColorScheme;
  Future<void> setUseFlexColorScheme(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _useFlexColorScheme) return;
    _useFlexColorScheme = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyUseFlexColorScheme, value);
  }

  late bool _useSubThemes;
  bool get useSubThemes => _useSubThemes;
  Future<void> setUseSubThemes(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _useSubThemes) return;
    _useSubThemes = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyUseSubThemes, value);
  }

  late bool _useFlutterDefaults;
  bool get useFlutterDefaults => _useFlutterDefaults;
  Future<void> setUseFlutterDefaults(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _useFlutterDefaults) return;
    _useFlutterDefaults = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyUseFlutterDefaults, value);
  }

  late bool _isLargeGridView;
  bool get isLargeGridView => _isLargeGridView;
  Future<void> setAdvancedView(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _isLargeGridView) return;
    _isLargeGridView = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyIsLargeGridView, value);
  }

  late int _viewIndex;
  int get viewIndex => _viewIndex;
  Future<void> setViewIndex(int? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _viewIndex) return;
    _viewIndex = value;
    notifyListeners();
    await _themeService.save(Store.keyViewIndex, value);
  }

  late bool _useTextTheme;
  bool get useTextTheme => _useTextTheme;
  Future<void> setUseTextTheme(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _useTextTheme) return;
    _useTextTheme = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyUseTextTheme, value);
  }

  late bool _useAppFont;
  bool get useAppFont => _useAppFont;
  Future<void> setUseAppFont(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _useAppFont) return;
    _useAppFont = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyUseAppFont, value);
  }

  late FlexScheme _usedScheme;
  FlexScheme get usedScheme => _usedScheme;
  Future<void> setUsedScheme(FlexScheme? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _usedScheme) return;
    _usedScheme = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyUsedScheme, value);
  }

  late int _schemeIndex;
  int get schemeIndex => _schemeIndex;
  Future<void> setSchemeIndex(int? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _schemeIndex) return;
    _schemeIndex = value;
    notifyListeners();
    await _themeService.save(Store.keySchemeIndex, value);
  }

  late bool _interactionEffects;
  bool get interactionEffects => _interactionEffects;
  Future<void> setInteractionEffects(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _interactionEffects) return;
    _interactionEffects = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyInteractionEffects, value);
  }

  late double? _defaultRadius;
  double? get defaultRadius => _defaultRadius;
  Future<void> setDefaultRadius(double? value, [bool notify = true]) async {
    if (value == _defaultRadius) return;
    _defaultRadius = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyDefaultRadius, value);
  }

  late bool _tooltipsMatchBackground;
  bool get tooltipsMatchBackground => _tooltipsMatchBackground;
  Future<void> setTooltipsMatchBackground(bool? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _tooltipsMatchBackground) return;
    _tooltipsMatchBackground = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyTooltipsMatchBackground, value);
  }

  // Surface and blend SETTINGS.
  // ===========================================================================

  late FlexSurfaceMode _surfaceModeLight;
  FlexSurfaceMode get surfaceModeLight => _surfaceModeLight;
  Future<void> setSurfaceModeLight(FlexSurfaceMode? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _surfaceModeLight) return;
    _surfaceModeLight = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keySurfaceModeLight, value);
  }

  late FlexSurfaceMode _surfaceModeDark;
  FlexSurfaceMode get surfaceModeDark => _surfaceModeDark;
  Future<void> setSurfaceModeDark(FlexSurfaceMode? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _surfaceModeDark) return;
    _surfaceModeDark = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keySurfaceModeDark, value);
  }

  late int _blendLevel;
  int get blendLevel => _blendLevel;
  Future<void> setBlendLevel(int? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _blendLevel) return;
    _blendLevel = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyBlendLevel, value);
  }

  late int _blendLevelDark;
  int get blendLevelDark => _blendLevelDark;
  Future<void> setBlendLevelDark(int? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _blendLevelDark) return;
    _blendLevelDark = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyBlendLevelDark, value);
  }

  late int _blendOnLevel;
  int get blendOnLevel => _blendOnLevel;
  Future<void> setBlendOnLevel(int? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _blendOnLevel) return;
    _blendOnLevel = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyOnBlendLevel, value);
  }

  late int _blendOnLevelDark;
  int get blendOnLevelDark => _blendOnLevelDark;
  Future<void> setBlendOnLevelDark(int? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _blendOnLevelDark) return;
    _blendOnLevelDark = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyBlendOnLevelDark, value);
  }

  late int _usedColors;
  int get usedColors => _usedColors;
  Future<void> setUsedColors(int? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _usedColors) return;
    _usedColors = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyUsedColors, value);
  }

  late bool _swapLightColors;
  bool get swapLightColors => _swapLightColors;
  Future<void> setSwapLightColors(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _swapLightColors) return;
    _swapLightColors = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keySwapLightColors, value);
  }

  late bool _swapDarkColors;
  bool get swapDarkColors => _swapDarkColors;
  Future<void> setSwapDarkColors(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _swapDarkColors) return;
    _swapDarkColors = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keySwapDarkColors, value);
  }

  late bool _lightIsWhite;
  bool get lightIsWhite => _lightIsWhite;
  Future<void> setLightIsWhite(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _lightIsWhite) return;
    _lightIsWhite = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyLightIsWhite, value);
  }

  late bool _darkIsTrueBlack;
  bool get darkIsTrueBlack => _darkIsTrueBlack;
  Future<void> setDarkIsTrueBlack(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _darkIsTrueBlack) return;
    _darkIsTrueBlack = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyDarkIsTrueBlack, value);
  }

  late bool _useDarkColorsForSeed;
  bool get useDarkColorsForSeed => _useDarkColorsForSeed;
  Future<void> setUseDarkColorsForSeed(bool? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _useDarkColorsForSeed) return;
    _useDarkColorsForSeed = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyUseDarkColorsForSeed, value);
  }

  late bool _useToDarkMethod;
  bool get useToDarkMethod => _useToDarkMethod;
  Future<void> setUseToDarkMethod(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _useToDarkMethod) return;
    _useToDarkMethod = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyUseToDarkMethod, value);
  }

  late bool _toDarkSwapPrimaryAndContainer;
  bool get toDarkSwapPrimaryAndContainer => _toDarkSwapPrimaryAndContainer;
  Future<void> setToDarkSwapPrimaryAndContainer(bool? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _toDarkSwapPrimaryAndContainer) return;
    _toDarkSwapPrimaryAndContainer = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyToDarkSwapPrimaryAndContainer, value);
  }

  late int _darkMethodLevel;
  int get darkMethodLevel => _darkMethodLevel;
  Future<void> setDarkMethodLevel(int? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _darkMethodLevel) return;
    _darkMethodLevel = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyDarkMethodLevel, value);
  }

  // On color blending ON/OFF
  late bool _blendLightOnColors;
  bool get blendLightOnColors => _blendLightOnColors;
  Future<void> setBlendLightOnColors(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _blendLightOnColors) return;
    _blendLightOnColors = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyBlendLightOnColors, value);
  }

  late bool _blendDarkOnColors;
  bool get blendDarkOnColors => _blendDarkOnColors;
  Future<void> setBlendDarkOnColors(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _blendDarkOnColors) return;
    _blendDarkOnColors = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyBlendDarkOnColors, value);
  }

  // TextThem blending ON/OFF
  late bool _blendLightTextTheme;
  bool get blendLightTextTheme => _blendLightTextTheme;
  Future<void> setBlendLightTextTheme(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _blendLightTextTheme) return;
    _blendLightTextTheme = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyBlendLightTextTheme, value);
  }

  late bool _blendDarkTextTheme;
  bool get blendDarkTextTheme => _blendDarkTextTheme;
  Future<void> setBlendDarkTextTheme(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _blendDarkTextTheme) return;
    _blendDarkTextTheme = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyBlendDarkTextTheme, value);
  }

  // Material 3 and Seed ColorScheme SETTINGS.
  // ===========================================================================

  late bool _useMaterial3;
  bool get useMaterial3 => _useMaterial3;
  Future<void> setUseMaterial3(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _useMaterial3) return;
    _useMaterial3 = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyUseMaterial3, value);
  }

  late bool _useKeyColors;
  bool get useKeyColors => _useKeyColors;
  Future<void> setUseKeyColors(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _useKeyColors) return;
    _useKeyColors = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyUseKeyColors, value);
  }

  late bool _useSecondary;
  bool get useSecondary => _useSecondary;
  Future<void> setUseSecondary(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _useSecondary) return;
    _useSecondary = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyUseSecondary, value);
  }

  late bool _useTertiary;
  bool get useTertiary => _useTertiary;
  Future<void> setUseTertiary(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _useTertiary) return;
    _useTertiary = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyUseTertiary, value);
  }

  late bool _keepPrimary;
  bool get keepPrimary => _keepPrimary;
  Future<void> setKeepPrimary(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _keepPrimary) return;
    _keepPrimary = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyKeepPrimary, value);
  }

  late bool _keepSecondary;
  bool get keepSecondary => _keepSecondary;
  Future<void> setKeepSecondary(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _keepSecondary) return;
    _keepSecondary = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyKeepSecondary, value);
  }

  late bool _keepTertiary;
  bool get keepTertiary => _keepTertiary;
  Future<void> setKeepTertiary(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _keepTertiary) return;
    _keepTertiary = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyKeepTertiary, value);
  }

  late bool _keepPrimaryContainer;
  bool get keepPrimaryContainer => _keepPrimaryContainer;
  Future<void> setKeepPrimaryContainer(bool? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _keepPrimaryContainer) return;
    _keepPrimaryContainer = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyKeepPrimaryContainer, value);
  }

  late bool _keepSecondaryContainer;
  bool get keepSecondaryContainer => _keepSecondaryContainer;
  Future<void> setKeepSecondaryContainer(bool? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _keepSecondaryContainer) return;
    _keepSecondaryContainer = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyKeepSecondaryContainer, value);
  }

  late bool _keepTertiaryContainer;
  bool get keepTertiaryContainer => _keepTertiaryContainer;
  Future<void> setKeepTertiaryContainer(bool? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _keepTertiaryContainer) return;
    _keepTertiaryContainer = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyKeepTertiaryContainer, value);
  }

  late bool _keepDarkPrimary;
  bool get keepDarkPrimary => _keepDarkPrimary;
  Future<void> setKeepDarkPrimary(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _keepDarkPrimary) return;
    _keepDarkPrimary = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyKeepDarkPrimary, value);
  }

  late bool _keepDarkSecondary;
  bool get keepDarkSecondary => _keepDarkSecondary;
  Future<void> setKeepDarkSecondary(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _keepDarkSecondary) return;
    _keepDarkSecondary = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyKeepDarkSecondary, value);
  }

  late bool _keepDarkTertiary;
  bool get keepDarkTertiary => _keepDarkTertiary;
  Future<void> setKeepDarkTertiary(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _keepDarkTertiary) return;
    _keepDarkTertiary = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyKeepDarkTertiary, value);
  }

  late bool _keepDarkPrimaryContainer;
  bool get keepDarkPrimaryContainer => _keepDarkPrimaryContainer;
  Future<void> setKeepDarkPrimaryContainer(bool? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _keepDarkPrimaryContainer) return;
    _keepDarkPrimaryContainer = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyKeepDarkPrimaryContainer, value);
  }

  late bool _keepDarkSecondaryContainer;
  bool get keepDarkSecondaryContainer => _keepDarkSecondaryContainer;
  Future<void> setKeepDarkSecondaryContainer(bool? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _keepDarkSecondaryContainer) return;
    _keepDarkSecondaryContainer = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyKeepDarkSecondaryContainer, value);
  }

  late bool _keepDarkTertiaryContainer;
  bool get keepDarkTertiaryContainer => _keepDarkTertiaryContainer;
  Future<void> setKeepDarkTertiaryContainer(bool? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _keepDarkTertiaryContainer) return;
    _keepDarkTertiaryContainer = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyKeepDarkTertiaryContainer, value);
  }

  late int _usedFlexToneSetup;
  int get usedFlexToneSetup => _usedFlexToneSetup;
  Future<void> setUsedFlexToneSetup(int? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _usedFlexToneSetup) return;
    _usedFlexToneSetup = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyUsedFlexToneSetup, value);
  }

  late bool _useM3ErrorColors;
  bool get useM3ErrorColors => _useM3ErrorColors;
  Future<void> setUseM3ErrorColors(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _useM3ErrorColors) return;
    _useM3ErrorColors = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyUseM3ErrorColors, value);
  }

  // InputDecorator SETTINGS.
  // ===========================================================================

  late SchemeColor? _inputDecoratorSchemeColorLight;
  SchemeColor? get inputDecoratorSchemeColorLight =>
      _inputDecoratorSchemeColorLight;
  Future<void> setInputDecoratorSchemeColorLight(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _inputDecoratorSchemeColorLight) return;
    _inputDecoratorSchemeColorLight = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyInputDecoratorSchemeColorLight, value);
  }

  late SchemeColor? _inputDecoratorSchemeColorDark;
  SchemeColor? get inputDecoratorSchemeColorDark =>
      _inputDecoratorSchemeColorDark;
  Future<void> setInputDecoratorSchemeColorDark(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _inputDecoratorSchemeColorDark) return;
    _inputDecoratorSchemeColorDark = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyInputDecoratorSchemeColorDark, value);
  }

  late bool _inputDecoratorIsFilled;
  bool get inputDecoratorIsFilled => _inputDecoratorIsFilled;
  Future<void> setInputDecoratorIsFilled(bool? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _inputDecoratorIsFilled) return;
    _inputDecoratorIsFilled = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyInputDecoratorIsFilled, value);
  }

  late FlexInputBorderType _inputDecoratorBorderType;
  FlexInputBorderType get inputDecoratorBorderType => _inputDecoratorBorderType;
  Future<void> setInputDecoratorBorderType(FlexInputBorderType? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _inputDecoratorBorderType) return;
    _inputDecoratorBorderType = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyInputDecoratorBorderType, value);
  }

  late double? _inputDecoratorBorderRadius;
  double? get inputDecoratorBorderRadius => _inputDecoratorBorderRadius;
  Future<void> setInputDecoratorBorderRadius(double? value,
      [bool notify = true]) async {
    if (value == _inputDecoratorBorderRadius) return;
    _inputDecoratorBorderRadius = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyInputDecoratorBorderRadius, value);
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
    await _themeService.save(Store.keyInputDecoratorUnfocusedHasBorder, value);
  }

  late bool _inputDecoratorUnfocusedBorderIsColored;
  bool get inputDecoratorUnfocusedBorderIsColored =>
      _inputDecoratorUnfocusedBorderIsColored;
  Future<void> setInputDecoratorUnfocusedBorderIsColored(bool? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _inputDecoratorUnfocusedBorderIsColored) return;
    _inputDecoratorUnfocusedBorderIsColored = value;
    if (notify) notifyListeners();
    await _themeService.save(
        Store.keyInputDecoratorUnfocusedBorderIsColored, value);
  }

  // AppBar SETTINGS.
  // ===========================================================================

  late FlexAppBarStyle _appBarStyleLight;
  FlexAppBarStyle get appBarStyleLight => _appBarStyleLight;
  Future<void> setAppBarStyleLight(FlexAppBarStyle? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _appBarStyleLight) return;
    _appBarStyleLight = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyAppBarStyleLight, value);
  }

  late FlexAppBarStyle _appBarStyleDark;
  FlexAppBarStyle get appBarStyleDark => _appBarStyleDark;
  Future<void> setAppBarStyleDark(FlexAppBarStyle? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _appBarStyleDark) return;
    _appBarStyleDark = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyAppBarStyleDark, value);
  }

  late double _appBarOpacityLight;
  double get appBarOpacityLight => _appBarOpacityLight;
  Future<void> setAppBarOpacityLight(double? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _appBarOpacityLight) return;
    _appBarOpacityLight = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyAppBarOpacityLight, value);
  }

  late double _appBarOpacityDark;
  double get appBarOpacityDark => _appBarOpacityDark;
  Future<void> setAppBarOpacityDark(double? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _appBarOpacityDark) return;
    _appBarOpacityDark = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyAppBarOpacityDark, value);
  }

  late double _appBarElevationLight;
  double get appBarElevationLight => _appBarElevationLight;
  Future<void> setAppBarElevationLight(double? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _appBarElevationLight) return;
    _appBarElevationLight = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyAppBarElevationLight, value);
  }

  late double _appBarElevationDark;
  double get appBarElevationDark => _appBarElevationDark;
  Future<void> setAppBarElevationDark(double? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _appBarElevationDark) return;
    _appBarElevationDark = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyAppBarElevationDark, value);
  }

  late bool _transparentStatusBar;
  bool get transparentStatusBar => _transparentStatusBar;
  Future<void> setTransparentStatusBar(bool? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _transparentStatusBar) return;
    _transparentStatusBar = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyTransparentStatusBar, value);
  }

  late SchemeColor? _appBarBackgroundSchemeColorLight;
  SchemeColor? get appBarBackgroundSchemeColorLight =>
      _appBarBackgroundSchemeColorLight;
  Future<void> setAppBarBackgroundSchemeColorLight(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _appBarBackgroundSchemeColorLight) return;
    _appBarBackgroundSchemeColorLight = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyAppBarBackgroundSchemeColorLight, value);
  }

  late SchemeColor? _appBarBackgroundSchemeColorDark;
  SchemeColor? get appBarBackgroundSchemeColorDark =>
      _appBarBackgroundSchemeColorDark;
  Future<void> setAppBarBackgroundSchemeColorDark(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _appBarBackgroundSchemeColorDark) return;
    _appBarBackgroundSchemeColorDark = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyAppBarBackgroundSchemeColorDark, value);
  }

  // TabBar SETTINGS.
  // ===========================================================================

  late FlexTabBarStyle _tabBarStyle;
  FlexTabBarStyle get tabBarStyle => _tabBarStyle;
  Future<void> setTabBarStyle(FlexTabBarStyle? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _tabBarStyle) return;
    _tabBarStyle = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyTabBarStyle, value);
  }

  late SchemeColor? _tabBarIndicatorLight;
  SchemeColor? get tabBarIndicatorLight => _tabBarIndicatorLight;
  Future<void> setTabBarIndicatorLight(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _tabBarIndicatorLight) return;
    _tabBarIndicatorLight = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyTabBarIndicatorLight, value);
  }

  late SchemeColor? _tabBarIndicatorDark;
  SchemeColor? get tabBarIndicatorDark => _tabBarIndicatorDark;
  Future<void> setTabBarIndicatorDark(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _tabBarIndicatorDark) return;
    _tabBarIndicatorDark = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyTabBarIndicatorDark, value);
  }

  late SchemeColor? _tabBarItemSchemeColorLight;
  SchemeColor? get tabBarItemSchemeColorLight => _tabBarItemSchemeColorLight;
  Future<void> setTabBarItemSchemeColorLight(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _tabBarItemSchemeColorLight) return;
    _tabBarItemSchemeColorLight = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyTabBarItemSchemeColorLight, value);
  }

  late SchemeColor? _tabBarItemSchemeColorDark;
  SchemeColor? get tabBarItemSchemeColorDark => _tabBarItemSchemeColorDark;
  Future<void> setTabBarItemSchemeColorDark(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _tabBarItemSchemeColorDark) return;
    _tabBarItemSchemeColorDark = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyTabBarItemSchemeColorDark, value);
  }

  //
  // BottomSheet SETTINGS.

  late double? _bottomSheetBorderRadius;
  double? get bottomSheetBorderRadius => _bottomSheetBorderRadius;
  Future<void> setBottomSheetBorderRadius(double? value,
      [bool notify = true]) async {
    if (value == _bottomSheetBorderRadius) return;
    _bottomSheetBorderRadius = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyBottomSheetBorderRadius, value);
  }

  // Android System Navigator bar SETTINGS.
  // ===========================================================================

  late FlexSystemNavBarStyle _sysNavBarStyle;
  FlexSystemNavBarStyle get sysNavBarStyle => _sysNavBarStyle;
  Future<void> setSysNavBarStyle(FlexSystemNavBarStyle? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _sysNavBarStyle) return;
    _sysNavBarStyle = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keySysNavBarStyle, value);
  }

  late double _sysNavBarOpacity;
  double get sysNavBarOpacity => _sysNavBarOpacity;
  Future<void> setSysBarOpacity(double? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _sysNavBarOpacity) return;
    _sysNavBarOpacity = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keySysNavBarOpacity, value);
  }

  late bool _useSysNavDivider;
  bool get useSysNavDivider => _useSysNavDivider;
  Future<void> setUseSysNavDivider(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _useSysNavDivider) return;
    _useSysNavDivider = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyUseSysNavDivider, value);
  }

  // BottomNavigationBar SETTINGS.
  // ===========================================================================

  late SchemeColor? _bottomNavBarBackgroundSchemeColor;
  SchemeColor? get bottomNavBarBackgroundSchemeColor =>
      _bottomNavBarBackgroundSchemeColor;
  Future<void> setBottomNavBarBackgroundSchemeColor(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _bottomNavBarBackgroundSchemeColor) return;
    _bottomNavBarBackgroundSchemeColor = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyBottomNavBarBackgroundSchemeColor, value);
  }

  late double _bottomNavigationBarOpacity;
  double get bottomNavigationBarOpacity => _bottomNavigationBarOpacity;
  Future<void> setBottomNavigationBarOpacity(double? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _bottomNavigationBarOpacity) return;
    _bottomNavigationBarOpacity = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyBottomNavigationBarOpacity, value);
  }

  late double _bottomNavigationBarElevation;
  double get bottomNavigationBarElevation => _bottomNavigationBarElevation;
  Future<void> setBottomNavigationBarElevation(double? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _bottomNavigationBarElevation) return;
    _bottomNavigationBarElevation = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyBottomNavigationBarElevation, value);
  }

  late SchemeColor? _bottomNavBarSelectedSchemeColor;
  SchemeColor? get bottomNavBarSelectedSchemeColor =>
      _bottomNavBarSelectedSchemeColor;
  Future<void> setBottomNavBarSelectedSchemeColor(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _bottomNavBarSelectedSchemeColor) return;
    _bottomNavBarSelectedSchemeColor = value;
    if (notify) notifyListeners();
    await _themeService.save(
        Store.keyBottomNavBarSelectedItemSchemeColor, value);
  }

  late SchemeColor? _bottomNavBarUnselectedSchemeColor;
  SchemeColor? get bottomNavBarUnselectedSchemeColor =>
      _bottomNavBarUnselectedSchemeColor;
  Future<void> setBottomNavBarUnselectedSchemeColor(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _bottomNavBarUnselectedSchemeColor) return;
    _bottomNavBarUnselectedSchemeColor = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyBottomNavBarUnselectedSchemeColor, value);
  }

  late bool _bottomNavBarMuteUnselected;
  bool get bottomNavBarMuteUnselected => _bottomNavBarMuteUnselected;
  Future<void> setBottomNavBarMuteUnselected(bool? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _bottomNavBarMuteUnselected) return;
    _bottomNavBarMuteUnselected = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyBottomNavBarMuteUnselected, value);
  }

  late bool _bottomNavShowSelectedLabels;
  bool get bottomNavShowSelectedLabels => _bottomNavShowSelectedLabels;
  Future<void> setBottomNavShowSelectedLabels(bool? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _bottomNavShowSelectedLabels) return;
    _bottomNavShowSelectedLabels = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyBottomNavShowSelectedLabels, value);
  }

  late bool _bottomNavShowUnselectedLabels;
  bool get bottomNavShowUnselectedLabels => _bottomNavShowUnselectedLabels;
  Future<void> setBottomNavShowUnselectedLabels(bool? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _bottomNavShowUnselectedLabels) return;
    _bottomNavShowUnselectedLabels = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyBottomNavShowUnselectedLabels, value);
  }

  // NavigationBar SETTINGS.
  // ===========================================================================

  late SchemeColor? _navBarBackgroundSchemeColor;
  SchemeColor? get navBarBackgroundSchemeColor => _navBarBackgroundSchemeColor;
  Future<void> setNavBarBackgroundSchemeColor(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _navBarBackgroundSchemeColor) return;
    _navBarBackgroundSchemeColor = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyNavBarBackgroundSchemeColor, value);
  }

  late double _navBarOpacity;
  double get navBarOpacity => _navBarOpacity;
  Future<void> setNavBarOpacity(double? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _navBarOpacity) return;
    _navBarOpacity = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyNavBarOpacity, value);
  }

  late double? _navBarHeight;
  double? get navBarHeight => _navBarHeight;
  Future<void> setNavBarHeight(double? value, [bool notify = true]) async {
    if (value == _navBarHeight) return;
    _navBarHeight = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyNavBarHeight, value);
  }

  late SchemeColor? _navBarSelectedSchemeColor;
  SchemeColor? get navBarSelectedSchemeColor => _navBarSelectedSchemeColor;
  Future<void> setNavBarSelectedSchemeColor(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _navBarSelectedSchemeColor) return;
    _navBarSelectedSchemeColor = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyNavBarSelectedItemSchemeColor, value);
  }

  late SchemeColor? _navBarUnselectedSchemeColor;
  SchemeColor? get navBarUnselectedSchemeColor => _navBarUnselectedSchemeColor;
  Future<void> setNavBarUnselectedSchemeColor(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _navBarUnselectedSchemeColor) return;
    _navBarUnselectedSchemeColor = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyNavBarUnselectedSchemeColor, value);
  }

  late bool _navBarMuteUnselected;
  bool get navBarMuteUnselected => _navBarMuteUnselected;
  Future<void> setNavBarMuteUnselected(bool? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _navBarMuteUnselected) return;
    _navBarMuteUnselected = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyNavBarMuteUnselected, value);
  }

  late SchemeColor? _navBarIndicatorSchemeColor;
  SchemeColor? get navBarIndicatorSchemeColor => _navBarIndicatorSchemeColor;
  Future<void> setNavBarIndicatorSchemeColor(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _navBarIndicatorSchemeColor) return;
    _navBarIndicatorSchemeColor = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyNavBarIndicatorSchemeColor, value);
  }

  late double? _navBarIndicatorOpacity;
  double? get navBarIndicatorOpacity => _navBarIndicatorOpacity;
  Future<void> setNavBarIndicatorOpacity(double? value,
      [bool notify = true]) async {
    if (value == _navBarIndicatorOpacity) return;
    _navBarIndicatorOpacity = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyNavBarIndicatorOpacity, value);
  }

  late NavigationDestinationLabelBehavior _navBarLabelBehavior;
  NavigationDestinationLabelBehavior get navBarLabelBehavior =>
      _navBarLabelBehavior;
  Future<void> setNavBarLabelBehavior(NavigationDestinationLabelBehavior value,
      [bool notify = true]) async {
    if (value == _navBarLabelBehavior) return;
    _navBarLabelBehavior = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyNavBarLabelBehavior, value);
  }

  // NavigationRail SETTINGS.
  // ===========================================================================

  late SchemeColor? _navRailBackgroundSchemeColor;
  SchemeColor? get navRailBackgroundSchemeColor =>
      _navRailBackgroundSchemeColor;
  Future<void> setNavRailBackgroundSchemeColor(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _navRailBackgroundSchemeColor) return;
    _navRailBackgroundSchemeColor = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyNavRailBackgroundSchemeColor, value);
  }

  late double _navRailOpacity;
  double get navRailOpacity => _navRailOpacity;
  Future<void> setNavRailOpacity(double? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _navRailOpacity) return;
    _navRailOpacity = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyNavRailOpacity, value);
  }

  late double _navigationRailElevation;
  double get navigationRailElevation => _navigationRailElevation;
  Future<void> setNavigationRailElevation(double? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _navigationRailElevation) return;
    _navigationRailElevation = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyNavigationRailElevation, value);
  }

  late SchemeColor? _navRailSelectedSchemeColor;
  SchemeColor? get navRailSelectedSchemeColor => _navRailSelectedSchemeColor;
  Future<void> setNavRailSelectedSchemeColor(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _navRailSelectedSchemeColor) return;
    _navRailSelectedSchemeColor = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyNavRailSelectedItemSchemeColor, value);
  }

  late SchemeColor? _navRailUnselectedSchemeColor;
  SchemeColor? get navRailUnselectedSchemeColor =>
      _navRailUnselectedSchemeColor;
  Future<void> setNavRailUnselectedSchemeColor(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _navRailUnselectedSchemeColor) return;
    _navRailUnselectedSchemeColor = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyNavRailUnselectedSchemeColor, value);
  }

  late bool _navRailMuteUnselected;
  bool get navRailMuteUnselected => _navRailMuteUnselected;
  Future<void> setNavRailMuteUnselected(bool? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _navRailMuteUnselected) return;
    _navRailMuteUnselected = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyNavRailMuteUnselected, value);
  }

  late NavigationRailLabelType _navRailLabelType;
  NavigationRailLabelType get navRailLabelType => _navRailLabelType;
  Future<void> setNavRailLabelType(NavigationRailLabelType value,
      [bool notify = true]) async {
    if (value == _navRailLabelType) return;
    _navRailLabelType = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyNavRailLabelType, value);
  }

  late bool _navRailUseIndicator;
  bool get navRailUseIndicator => _navRailUseIndicator;
  Future<void> setNavRailUseIndicator(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _navRailUseIndicator) return;
    _navRailUseIndicator = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyNavRailUseIndicator, value);
  }

  late SchemeColor? _navRailIndicatorSchemeColor;
  SchemeColor? get navRailIndicatorSchemeColor => _navRailIndicatorSchemeColor;
  Future<void> setNavRailIndicatorSchemeColor(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _navRailIndicatorSchemeColor) return;
    _navRailIndicatorSchemeColor = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyNavRailIndicatorSchemeColor, value);
  }

  late double? _navRailIndicatorOpacity;
  double? get navRailIndicatorOpacity => _navRailIndicatorOpacity;
  Future<void> setNavRailIndicatorOpacity(double? value,
      [bool notify = true]) async {
    if (value == _navRailIndicatorOpacity) return;
    _navRailIndicatorOpacity = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyNavRailIndicatorOpacity, value);
  }

  // Button SETTINGS.
  // ===========================================================================

  late SchemeColor? _textButtonSchemeColor;
  SchemeColor? get textButtonSchemeColor => _textButtonSchemeColor;
  Future<void> setTextButtonSchemeColor(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _textButtonSchemeColor) return;
    _textButtonSchemeColor = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyTextButtonSchemeColor, value);
  }

  late double? _textButtonBorderRadius;
  double? get textButtonBorderRadius => _textButtonBorderRadius;
  Future<void> setTextButtonBorderRadius(double? value,
      [bool notify = true]) async {
    if (value == _textButtonBorderRadius) return;
    _textButtonBorderRadius = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyTextButtonBorderRadius, value);
  }

  late SchemeColor? _elevatedButtonSchemeColor;
  SchemeColor? get elevatedButtonSchemeColor => _elevatedButtonSchemeColor;
  Future<void> setElevatedButtonSchemeColor(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _elevatedButtonSchemeColor) return;
    _elevatedButtonSchemeColor = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyElevatedButtonSchemeColor, value);
  }

  late double? _elevatedButtonBorderRadius;
  double? get elevatedButtonBorderRadius => _elevatedButtonBorderRadius;
  Future<void> setElevatedButtonBorderRadius(double? value,
      [bool notify = true]) async {
    if (value == _elevatedButtonBorderRadius) return;
    _elevatedButtonBorderRadius = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyElevatedButtonBorderRadius, value);
  }

  late SchemeColor? _outlinedButtonSchemeColor;
  SchemeColor? get outlinedButtonSchemeColor => _outlinedButtonSchemeColor;
  Future<void> setOutlinedButtonSchemeColor(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _outlinedButtonSchemeColor) return;
    _outlinedButtonSchemeColor = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyOutlinedButtonSchemeColor, value);
  }

  late double? _outlinedButtonBorderRadius;
  double? get outlinedButtonBorderRadius => _outlinedButtonBorderRadius;
  Future<void> setOutlinedButtonBorderRadius(double? value,
      [bool notify = true]) async {
    if (value == _outlinedButtonBorderRadius) return;
    _outlinedButtonBorderRadius = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyOutlinedButtonBorderRadius, value);
  }

  late SchemeColor? _toggleButtonsSchemeColor;
  SchemeColor? get toggleButtonsSchemeColor => _toggleButtonsSchemeColor;
  Future<void> setToggleButtonsSchemeColor(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _toggleButtonsSchemeColor) return;
    _toggleButtonsSchemeColor = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyToggleButtonsSchemeColor, value);
  }

  late double? _toggleButtonsBorderRadius;
  double? get toggleButtonsBorderRadius => _toggleButtonsBorderRadius;
  Future<void> setToggleButtonsBorderRadius(double? value,
      [bool notify = true]) async {
    if (value == _toggleButtonsBorderRadius) return;
    _toggleButtonsBorderRadius = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyToggleButtonsBorderRadius, value);
  }

  // Toggleable SETTINGS.
  // ===========================================================================

  late bool _unselectedToggleIsColored;
  bool get unselectedToggleIsColored => _unselectedToggleIsColored;
  Future<void> setUnselectedToggleIsColored(bool? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _unselectedToggleIsColored) return;
    _unselectedToggleIsColored = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyUnselectedToggleIsColored, value);
  }

  late SchemeColor? _switchSchemeColor;
  SchemeColor? get switchSchemeColor => _switchSchemeColor;
  Future<void> setSwitchSchemeColor(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _switchSchemeColor) return;
    _switchSchemeColor = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keySwitchSchemeColor, value);
  }

  late SchemeColor? _checkboxSchemeColor;
  SchemeColor? get checkboxSchemeColor => _checkboxSchemeColor;
  Future<void> setCheckboxSchemeColor(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _checkboxSchemeColor) return;
    _checkboxSchemeColor = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyCheckboxSchemeColor, value);
  }

  late SchemeColor? _radioSchemeColor;
  SchemeColor? get radioSchemeColor => _radioSchemeColor;
  Future<void> setRadioSchemeColor(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _radioSchemeColor) return;
    _radioSchemeColor = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyRadioSchemeColor, value);
  }

  // Fab, Chip, SnackBar, Popup, Card nad Dialog SETTINGS.
  // ===========================================================================

  late bool _fabUseShape;
  bool get fabUseShape => _fabUseShape;
  Future<void> setFabUseShape(bool? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _fabUseShape) return;
    _fabUseShape = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyFabUseShape, value);
  }

  late double? _fabBorderRadius;
  double? get fabBorderRadius => _fabBorderRadius;
  Future<void> setFabBorderRadius(double? value, [bool notify = true]) async {
    if (value == _fabBorderRadius) return;
    _fabBorderRadius = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyFabBorderRadius, value);
  }

  late SchemeColor? _fabSchemeColor;
  SchemeColor? get fabSchemeColor => _fabSchemeColor;
  Future<void> setFabSchemeColor(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _fabSchemeColor) return;
    _fabSchemeColor = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyFabSchemeColor, value);
  }

  late SchemeColor? _chipSchemeColor;
  SchemeColor? get chipSchemeColor => _chipSchemeColor;
  Future<void> setChipSchemeColor(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _chipSchemeColor) return;
    _chipSchemeColor = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyChipSchemeColor, value);
  }

  late double? _chipBorderRadius;
  double? get chipBorderRadius => _chipBorderRadius;
  Future<void> setChipBorderRadius(double? value, [bool notify = true]) async {
    if (value == _chipBorderRadius) return;
    _chipBorderRadius = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyChipBorderRadius, value);
  }

  late SchemeColor? _snackBarSchemeColor;
  SchemeColor? get snackBarSchemeColor => _snackBarSchemeColor;
  Future<void> setSnackBarSchemeColor(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _snackBarSchemeColor) return;
    _snackBarSchemeColor = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keySnackBarSchemeColor, value);
  }

  late double _popupMenuOpacity;
  double get popupMenuOpacity => _popupMenuOpacity;
  Future<void> setPopupMenuOpacity(double? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _popupMenuOpacity) return;
    _popupMenuOpacity = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyPopupMenuOpacity, value);
  }

  late double? _popupMenuBorderRadius;
  double? get popupMenuBorderRadius => _popupMenuBorderRadius;
  Future<void> setPopupMenuBorderRadius(double? value,
      [bool notify = true]) async {
    if (value == _popupMenuBorderRadius) return;
    _popupMenuBorderRadius = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyPopupMenuBorderRadius, value);
  }

  late double? _cardBorderRadius;
  double? get cardBorderRadius => _cardBorderRadius;
  Future<void> setCardBorderRadius(double? value, [bool notify = true]) async {
    if (value == _cardBorderRadius) return;
    _cardBorderRadius = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyCardBorderRadius, value);
  }

  late SchemeColor? _dialogBackgroundSchemeColor;
  SchemeColor? get dialogBackgroundSchemeColor => _dialogBackgroundSchemeColor;
  Future<void> setDialogBackgroundSchemeColor(SchemeColor? value,
      [bool notify = true]) async {
    if (value == _dialogBackgroundSchemeColor) return;
    _dialogBackgroundSchemeColor = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyDialogBackgroundSchemeColor, value);
  }

  late double? _dialogBorderRadius;
  double? get dialogBorderRadius => _dialogBorderRadius;
  Future<void> setDialogBorderRadius(double? value,
      [bool notify = true]) async {
    if (value == _dialogBorderRadius) return;
    _dialogBorderRadius = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyDialogBorderRadius, value);
  }

  // Custom surface tint color SETTINGS.
  // ===========================================================================

  late Color? _surfaceTintLight;
  Color? get surfaceTintLight => _surfaceTintLight;
  Future<void> setSurfaceTintLight(Color? value, [bool notify = true]) async {
    if (value == _surfaceTintLight) return;
    _surfaceTintLight = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keySurfaceTintLight, value);
  }

  late Color? _surfaceTintDark;
  Color? get surfaceTintDark => _surfaceTintDark;
  Future<void> setSurfaceTintDark(Color? value, [bool notify = true]) async {
    if (value == _surfaceTintDark) return;
    _surfaceTintDark = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keySurfaceTintDark, value);
  }

  // Custom color SETTINGS.
  // ===========================================================================

  late Color _primaryLight;
  Color get primaryLight => _primaryLight;
  Future<void> setPrimaryLight(Color? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _primaryLight) return;
    _primaryLight = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyPrimaryLight, value);
  }

  late Color _primaryContainerLight;
  Color get primaryContainerLight => _primaryContainerLight;
  Future<void> setPrimaryContainerLight(Color? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _primaryContainerLight) return;
    _primaryContainerLight = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyPrimaryContainerLight, value);
  }

  late Color _secondaryLight;
  Color get secondaryLight => _secondaryLight;
  Future<void> setSecondaryLight(Color? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _secondaryLight) return;
    _secondaryLight = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keySecondaryLight, value);
  }

  late Color _secondaryContainerLight;
  Color get secondaryContainerLight => _secondaryContainerLight;
  Future<void> setSecondaryContainerLight(Color? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _secondaryContainerLight) return;
    _secondaryContainerLight = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keySecondaryContainerLight, value);
  }

  late Color _tertiaryLight;
  Color get tertiaryLight => _tertiaryLight;
  Future<void> setTertiaryLight(Color? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _tertiaryLight) return;
    _tertiaryLight = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyTertiaryLight, value);
  }

  late Color _tertiaryContainerLight;
  Color get tertiaryContainerLight => _tertiaryContainerLight;
  Future<void> setTertiaryContainerLight(Color? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _tertiaryContainerLight) return;
    _tertiaryContainerLight = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyTertiaryContainerLight, value);
  }

  late Color _primaryDark;
  Color get primaryDark => _primaryDark;
  Future<void> setPrimaryDark(Color? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _primaryDark) return;
    _primaryDark = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyPrimaryDark, value);
  }

  late Color _primaryContainerDark;
  Color get primaryContainerDark => _primaryContainerDark;
  Future<void> setPrimaryContainerDark(Color? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _primaryContainerDark) return;
    _primaryContainerDark = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyPrimaryContainerDark, value);
  }

  late Color _secondaryDark;
  Color get secondaryDark => _secondaryDark;
  Future<void> setSecondaryDark(Color? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _secondaryDark) return;
    _secondaryDark = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keySecondaryDark, value);
  }

  late Color _secondaryContainerDark;
  Color get secondaryContainerDark => _secondaryContainerDark;
  Future<void> setSecondaryContainerDark(Color? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _secondaryContainerDark) return;
    _secondaryContainerDark = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keySecondaryContainerDark, value);
  }

  late Color _tertiaryDark;
  Color get tertiaryDark => _tertiaryDark;
  Future<void> setTertiaryDark(Color? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _tertiaryDark) return;
    _tertiaryDark = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyTertiaryDark, value);
  }

  late Color _tertiaryContainerDark;
  Color get tertiaryContainerDark => _tertiaryContainerDark;
  Future<void> setTertiaryContainerDark(Color? value,
      [bool notify = true]) async {
    if (value == null) return;
    if (value == _tertiaryContainerDark) return;
    _tertiaryContainerDark = value;
    if (notify) notifyListeners();
    await _themeService.save(Store.keyTertiaryContainerDark, value);
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

  // This is just a controller prop for the Platform menu control.
  // It is used as input to the theme, but never persisted so it always
  // defaults to the actual target platform when starting the app.
  // Being able to toggle it during demos and development is a handy feature.
  //
  // This is OK to be in ThemeController, if this is changed, the entire app
  // theme must update too, and yes it is a part of ThemeData.
  late TargetPlatform _platform;
  TargetPlatform get platform => _platform;
  Future<void> setPlatform(TargetPlatform? value, [bool notify = true]) async {
    if (value == null) return;
    if (value == _platform) return;
    _platform = value;
    if (notify) notifyListeners();
  }

  // Recently used colors, we keep the list of recently used colors in the
  // color picker for custom colors only during the session we don't persist.
  // It is of course possible to persist, but not needed in this demo.
  //
  // This is OK to be in ThemeController, these colors change as we change
  // custom colors for the theme, that needs to update the entire app anyway.
  List<Color> _recentColors = <Color>[];
  List<Color> get recentColors => _recentColors;
  // ignore: use_setters_to_change_properties
  void setRecentColors(final List<Color> colors) {
    _recentColors = colors;
  }

  // Helper ChangeNotifiers tucked into ThemeController because I'm lazy.
  // ===========================================================================
  // TODO(rydmike): Future app version, consider own inherited widget.

  // This is just a controller prop for hovered color on Colorscheme.
  Color? _hoverColor;
  Color? get hoverColor => _hoverColor;
  Future<void> setHoverColor(Color? value, [bool notify = true]) async {
    if (value == _hoverColor) return;
    _hoverColor = value;
    if (notify) notifyListeners();
  }

  // This is just a controller prop for hovered palette on Colorscheme.
  TonalPalettes? _hoverTonalPalette;
  TonalPalettes? get hoverTonalPalette => _hoverTonalPalette;
  Future<void> setHoverTonalPalette(TonalPalettes? value,
      [bool notify = true]) async {
    if (value == _hoverTonalPalette) return;
    _hoverTonalPalette = value;
    if (notify) notifyListeners();
  }
}
