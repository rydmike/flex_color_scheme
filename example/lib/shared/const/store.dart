import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import 'app_color.dart';

// A simple const class for holding storage keys and default value for each
// stored key-value pair.
//
// These constants are used by the ThemeController, that uses them
// with the ThemeService to store its values using a defined string
// and a default value for each setting.
//
// We could do the default values as map from the String key too, but imo it
// just adds extra complexity, forces us to use a type cast on the map content.
// Yes it saves us from defining a const for the default vales, but I think
// that is a simpler and more type safe way.
class Store {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  Store._();

  // GENERAL SETTINGS.
  // ThemeMode, use FlexColorScheme and sub-themes, current scheme, view, etc.
  // ===========================================================================

  // Key used to read and save the themeMode value.
  static const String keyThemeMode = 'themeMode';
  // Default value for the themeMode, also used to reset settings.
  static const ThemeMode defaultThemeMode = ThemeMode.system;

  // Key used to read and save the useFlexColorScheme value.
  static const String keyUseFlexColorScheme = 'useFlexColorScheme';
  // Default value for the useFlexColorScheme, also to reset settings.
  static const bool defaultUseFlexColorScheme = true;

  // Key used to read and save the useSubThemes value.
  static const String keyUseSubThemes = 'useSubThemes';
  // Default value for the useSubThemes, also used to reset settings.
  static const bool defaultUseSubThemes = true;

  // Key used to read and save the useFlutterDefaults  value.
  static const String keyUseFlutterDefaults = 'useFlutterDefaults';
  // Default value for the useFlutterDefaults, also to reset settings.
  static const bool defaultUseFlutterDefaults = false;

  // Key used to read and save the isLargeGridView value.
  static const String keyIsLargeGridView = 'isLargeGridView';
  // Default value for the isLargeGridView, also used to reset settings.
  static const bool defaultIsLargeGridView = false;

  // Key used to read and save the viewIndex value.
  static const String keyViewIndex = 'viewIndex';
  // Default value for the viewIndex, also used to reset settings.
  static const int defaultViewIndex = 0;

  // Key used to read and save the useTextTheme value.
  static const String keyUseTextTheme = 'useTextTheme';
  // Default value for the useSubThemes, also used to reset settings.
  static const bool defaultUseTextTheme = true;

  // Key used to read and save the useAppFont value.
  static const String keyUseAppFont = 'useAppFont';
  // Default value for the useAppFont, also used to reset settings.
  static const bool defaultUseAppFont = true;

  // Key used to read and save the usedScheme value.
  static const String keyUsedScheme = 'usedScheme';
  // Default value for the usedScheme, also used to reset settings.
  static const FlexScheme defaultUsedScheme = FlexScheme.hippieBlue;

  // Key used to read and save the schemeIndex value.
  static const String keySchemeIndex = 'schemeIndex';
  // Default value for the schemeIndex, also used to reset settings.
  // Defaults to 35, in examples 4 & 5 where this is used it will make
  // the default theme based on the [FlexColor.flutterDash] color scheme.
  static const int defaultSchemeIndex = 39;

  // Key used to read and save the interactionEffects value.
  static const String keyInteractionEffects = 'interactionEffects';
  // Default value for the interactionEffects, also used to reset settings.
  static const bool defaultInteractionEffects = true;

  // Key used to read and save the defaultRadius value.
  static const String keyDefaultRadius = 'defaultRadius';
  // Default value for the defaultRadius, also used to reset settings.
  static const double? defaultDefaultRadius = null;

  // Key used to read and save the tooltipsMatchBackground value.
  static const String keyTooltipsMatchBackground = 'tooltipsMatchBackground';
  // Default value for the tooltipsMatchBackground, also to reset settings.
  static const bool defaultTooltipsMatchBackground = false;

  // Surface and blend SETTINGS.
  // ===========================================================================

  // Key used to read and save the surfaceModeLight value.
  static const String keySurfaceModeLight = 'surfaceModeLight';
  // Default value for the surfaceModeLight, also used to reset settings.
  static const FlexSurfaceMode defaultSurfaceModeLight =
      FlexSurfaceMode.highScaffoldLowSurface;

  // Key used to read and save the surfaceModeDark value.
  static const String keySurfaceModeDark = 'surfaceModeDark';
  // Default value for the surfaceModeDark, also used to reset settings.
  static const FlexSurfaceMode defaultSurfaceModeDark =
      FlexSurfaceMode.highScaffoldLowSurface;

  // Key used to read and save the blendLevel value.
  static const String keyBlendLevel = 'blendLevel';
  // Default value for the blendLevel, also used to reset settings.
  // Defaults to 20.
  static const int defaultBlendLevel = 20;

  // Key used to read and save the blendLevelDark value.
  static const String keyBlendLevelDark = 'blendLevelDark';
  // Default value for the blendLevelDark, also used to reset settings.
  // Defaults to 15.
  static const int defaultBlendLevelDark = 15;

  // Key used to read and save the onBlendLevel value.
  static const String keyOnBlendLevel = 'blendOnLevel';
  // Default value for the onBlendLevel, also used to reset settings.
  // Defaults to 20.
  static const int defaultBlendOnLevel = 20;

  // Key used to read and save the blendOnLevelDark value.
  static const String keyBlendOnLevelDark = 'blendOnLevelDark';
  // Default value for the blendOnLevelDark, also used to reset settings.
  // Defaults to 30.
  static const int defaultBlendOnLevelDark = 30;

  // Key used to read and save the usedColors value.
  static const String keyUsedColors = 'usedColors';
  // Default value for the usedColorsLevel, also used to reset settings.
  // Defaults to 6.
  static const int defaultUsedColors = 6;

  // Key used to read and save the swapLightColors value.
  static const String keySwapLightColors = 'swapLightColors';
  // Default value for the swapLightColors, also to reset settings.
  static const bool defaultSwapLightColors = false;

  // Key used to read and save the swapDarkColors value.
  static const String keySwapDarkColors = 'swapDarkColors';
  // Default value for the swapDarkColors, also to reset settings.
  static const bool defaultSwapDarkColors = false;

  // Key used to read and save the lightIsWhite value.
  static const String keyLightIsWhite = 'lightIsWhite';
  // Default value for the lightIsWhite, also to reset settings.
  static const bool defaultLightIsWhite = false;

  // Key used to read and save the darkIsTrueBlack value.
  static const String keyDarkIsTrueBlack = 'darkIsTrueBlack';
  // Default value for the darkIsTrueBlack, also to reset settings.
  static const bool defaultDarkIsTrueBlack = false;

  // Key used to read and save the useDarkColorsForSeed value.
  static const String keyUseDarkColorsForSeed = 'useDarkColorsForSeed';
  // Default value for the useCustomDarkColorsForSeed, also to reset settings.
  static const bool defaultUseDarkColorsForSeed = false;

  // Key used to read and save the useToDarkMethod value.
  static const String keyUseToDarkMethod = 'useToDarkMethod';
  // Default value for the useToDarkMethod, also to reset settings.
  static const bool defaultUseToDarkMethod = false;

  // Key used to read and save the toDarkSwapPrimaryAndContainer value.
  static const String keyToDarkSwapPrimaryAndContainer =
      'toDarkSwapPrimaryAndContainer';
  // Default value for the useToDarkMethod, also to reset settings.
  static const bool defaultToDarkSwapPrimaryAndContainer = true;

  // Key used to read and save the darkMethodLevel value.
  static const String keyDarkMethodLevel = 'darkMethodLevel';
  // Default value for the darkMethodLevel, also used to reset settings.
  // Defaults to 10.
  static const int defaultDarkMethodLevel = 10;

  // Key used to read and save the blendLightOnColors value.
  static const String keyBlendLightOnColors = 'blendLightOnColors';
  // Default value for the blendLightOnColors, also to reset settings.
  static const bool defaultBlendLightOnColors = false;

  // Key used to read and save the blendDarkOnColors value.
  static const String keyBlendDarkOnColors = 'blendDarkOnColors';
  // Default value for the blendDarkOnColors, also to reset settings.
  static const bool defaultBlendDarkOnColors = true;

  // Key used to read and save the blendLightTextTheme value.
  static const String keyBlendLightTextTheme = 'blendLightTextTheme';
  // Default value for the blendLightTextTheme, also to reset settings.
  static const bool defaultBlendLightTextTheme = true;

  // Key used to read and save the blendDarkTextTheme value.
  static const String keyBlendDarkTextTheme = 'blendDarkTextTheme';
  // Default value for the blendDarkTextTheme, also to reset settings.
  static const bool defaultBlendDarkTextTheme = true;

  // Material 3 and Seed ColorScheme SETTINGS.
  // ===========================================================================

  // Key used to read and save the useMaterial3 value.
  static const String keyUseMaterial3 = 'useMaterial3';
  // Default value for the useMaterial3, also to reset settings.
  static const bool defaultUseMaterial3 = true;

  // Key used to read and save the useKeyColors value.
  static const String keyUseKeyColors = 'useKeyColors';
  // Default value for the useKeyColors, also to reset settings.
  static const bool defaultUseKeyColors = false;

  // Key used to read and save the useSecondary value.
  static const String keyUseSecondary = 'useSecondary';
  // Default value for the useSecondary, also to reset settings.
  static const bool defaultUseSecondary = false;

  // Key used to read and save the useTertiary value.
  static const String keyUseTertiary = 'useTertiary';
  // Default value for the useTertiary, also to reset settings.
  static const bool defaultUseTertiary = false;

  // Key used to read and save the keepPrimary value.
  static const String keyKeepPrimary = 'keepPrimary';
  // Default value for the keepPrimary, also to reset settings.
  static const bool defaultKeepPrimary = false;

  // Key used to read and save the keepSecondary value.
  static const String keyKeepSecondary = 'keepSecondary';
  // Default value for the keepSecondary, also to reset settings.
  static const bool defaultKeepSecondary = false;

  // Key used to read and save the keepTertiary value.
  static const String keyKeepTertiary = 'keepTertiary';
  // Default value for the keepTertiary, also to reset settings.
  static const bool defaultKeepTertiary = false;

  // Key used to read and save the keepPrimaryContainer value.
  static const String keyKeepPrimaryContainer = 'keepPrimaryContainer';
  // Default value for the keepPrimaryContainer, also to reset settings.
  static const bool defaultKeepPrimaryContainer = false;

  // Key used to read and save the keepSecondaryContainer value.
  static const String keyKeepSecondaryContainer = 'keepSecondaryContainer';
  // Default value for the keepSecondaryContainer, also to reset settings.
  static const bool defaultKeepSecondaryContainer = false;

  // Key used to read and save the keepTertiaryContainer value.
  static const String keyKeepTertiaryContainer = 'keepTertiaryContainer';
  // Default value for the keepTertiaryContainer, also to reset settings.
  static const bool defaultKeepTertiaryContainer = false;

  // Key used to read and save the keepDarkPrimary value.
  static const String keyKeepDarkPrimary = 'keepDarkPrimary';
  // Default value for the keepDarkPrimary, also to reset settings.
  static const bool defaultKeepDarkPrimary = false;

  // Key used to read and save the keepDarkSecondary value.
  static const String keyKeepDarkSecondary = 'keepDarkSecondary';
  // Default value for the keepDarkSecondary, also to reset settings.
  static const bool defaultKeepDarkSecondary = false;

  // Key used to read and save the keepDarkTertiary value.
  static const String keyKeepDarkTertiary = 'keepDarkTertiary';
  // Default value for the keepDarkTertiary, also to reset settings.
  static const bool defaultKeepDarkTertiary = false;

  // Key used to read and save the keepDarkPrimaryContainer value.
  static const String keyKeepDarkPrimaryContainer = 'keepDarkPrimaryContainer';
  // Default value for the keepDarkPrimaryContainer, also to reset settings.
  static const bool defaultKeepDarkPrimaryContainer = false;

  // Key used to read and save the keepDarkSecondaryContainer value.
  static const String keyKeepDarkSecondaryContainer =
      'keepDarkSecondaryContainer';
  // Default value for the keepDarkSecondaryContainer, also to reset settings.
  static const bool defaultKeepDarkSecondaryContainer = false;

  // Key used to read and save the keepDarkTertiaryContainer value.
  static const String keyKeepDarkTertiaryContainer =
      'keepDarkTertiaryContainer';
  // Default value for the keepDarkTertiaryContainer, also to reset settings.
  static const bool defaultKeepDarkTertiaryContainer = false;

  // Key used to read and save the usedFlexToneSetup value.
  // It is used to select different pre-made FlexTones configurations used
  // to configure how the seeded [ColorScheme]s behave.
  static const String keyUsedFlexToneSetup = 'usedFlexToneSetup';
  // Default value for the usedFlexToneSetupLevel, also used to reset
  // settings.
  // Defaults to 1 - Flutter SDK default configuration
  static const int defaultUsedFlexToneSetup = 1;

  // Key used to read and save the useM3ErrorColor value.
  static const String keyUseM3ErrorColors = 'useM3ErrorColors';
  // Default value for the useM3ErrorColor, also to reset settings.
  static const bool defaultUseM3ErrorColors = false;

  // InputDecorator SETTINGS.
  // ===========================================================================

  // Key used to read and save the inputDecoratorSchemeColorLight value.
  static const String keyInputDecoratorSchemeColorLight =
      'inputDecoratorSchemeColorLight';
  // Default value for the inputDecoratorSchemeColorLight, reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultInputDecoratorSchemeColorLight = null;

  // Key used to read and save the inputDecoratorSchemeColorDark value.
  static const String keyInputDecoratorSchemeColorDark =
      'inputDecoratorSchemeColorDark';
  // Default value for the inputDecoratorSchemeColorDark, reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultInputDecoratorSchemeColorDark = null;

  // Key used to read and save the inputDecoratorIsFilled value.
  static const String keyInputDecoratorIsFilled = 'inputDecoratorIsFilled';
  // Default value for the inputDecoratorIsFilled, also used to reset settings.
  static const bool defaultInputDecoratorIsFilled = true;

  // Key used to read and save the inputDecoratorBorderType value.
  static const String keyInputDecoratorBorderType = 'inputDecoratorBorderType';
  // Default value for the inputDecoratorBorderType, also to reset settings.
  static const FlexInputBorderType defaultInputDecoratorBorderType =
      FlexInputBorderType.outline;

  // Key used to read and save the inputDecoratorBorderRadius value.
  static const String keyInputDecoratorBorderRadius =
      'inputDecoratorBorderRadius';
  // Default value for the inputDecoratorBorderRadius, also to reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultInputDecoratorBorderRadius = null;

  // Key used to read and save the inputDecoratorUnfocusedHasBorder value.
  static const String keyInputDecoratorUnfocusedHasBorder =
      'inputDecoratorUnfocusedHasBorder';
  // Default value for the inputDecoratorUnfocusedHasBorder, reset settings.
  static const bool defaultInputDecoratorUnfocusedHasBorder = true;

  // Key used to read and save the inputDecoratorUnfocusedBorderIsColored value.
  static const String keyInputDecoratorUnfocusedBorderIsColored =
      'inputDecoratorUnfocusedBorderIsColored';
  // Default value for the inputDecoratorUnfocusedBorderIsColored, also used to
  // reset settings.
  static const bool defaultInputDecoratorUnfocusedBorderIsColored = true;

  // AppBar SETTINGS.
  // ===========================================================================

  // Key used to read and save the appBarStyleLight value.
  static const String keyAppBarStyleLight = 'lightAppBarStyle';
  // Default value for the appBarStyleLight, also used to reset settings.
  static const FlexAppBarStyle defaultAppBarStyleLight =
      FlexAppBarStyle.primary;

  // Key used to read and save the appBarStyleDark value.
  static const String keyAppBarStyleDark = 'darkAppBarStyle';
  // Default value for the appBarStyleDark, also used to reset settings.
  static const FlexAppBarStyle defaultAppBarStyleDark =
      FlexAppBarStyle.background;

  // Key used to read and save the appBarOpacityLight value.
  static const String keyAppBarOpacityLight = 'appBarOpacity';
  // Default value for the appBarOpacityLight, also used to reset settings.
  static const double defaultAppBarOpacityLight = 0.95;

  // Key used to read and save the appBarOpacityDark value.
  static const String keyAppBarOpacityDark = 'appBarOpacityDark';
  // Default value for the appBarOpacityDark, also used to reset settings.
  static const double defaultAppBarOpacityDark = 0.9;

  // Key used to read and save the appBarElevation value.
  static const String keyAppBarElevationLight = 'appBarElevation';
  // Default value for the appBarElevation, also used to reset settings.
  static const double defaultAppBarElevationLight = 0.0;

  // Key used to read and save the appBarElevationDark value.
  static const String keyAppBarElevationDark = 'appBarElevationDark';
  // Default value for the appBarElevationDark, also used to reset settings.
  static const double defaultAppBarElevationDark = 0.0;

  // Key used to read and save the transparentStatusBar value.
  static const String keyTransparentStatusBar = 'transparentStatusBar';
  // Default value for the transparentStatusBar, also used to reset settings.
  static const bool defaultTransparentStatusBar = true;

  // Key used to read and save the appBarBackgroundSchemeColor value.
  static const String keyAppBarBackgroundSchemeColorLight =
      'appBarBackgroundSchemeColor';
  // Default value for the appBarBackgroundSchemeColor, also used to
  // reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultAppBarBackgroundSchemeColorLight = null;

  // Key used to read and save the appBarBackgroundSchemeColorDark value.
  static const String keyAppBarBackgroundSchemeColorDark =
      'appBarBackgroundSchemeColorDark';
  // Default value for the appBarBackgroundSchemeColorDark, also used to
  // reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultAppBarBackgroundSchemeColorDark = null;

  // TabBar SETTINGS.
  // ===========================================================================

  // Key used to read and save the tabBarStyle value.
  static const String keyTabBarStyle = 'tabBarStyle';
  // Default value for the tabBarStyle, also used to reset settings.
  static const FlexTabBarStyle defaultTabBarStyle = FlexTabBarStyle.forAppBar;

  // Key used to read and save the tabBarIndicatorLight value.
  static const String keyTabBarIndicatorLight = 'tabBarIndicatorLight';
  // Default value for the tabBarIndicatorLight, also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultTabBarIndicatorLight = null;

  // Key used to read and save the tabBarIndicatorDark value.
  static const String keyTabBarIndicatorDark = 'tabBarIndicatorDark';
  // Default value for the tabBarIndicatorDark, also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultTabBarIndicatorDark = null;

  // Key used to read and save the tabBarItemSchemeColor value.
  static const String keyTabBarItemSchemeColorLight =
      'tabBarItemSchemeColorLight';
  // Default value for the tabBarItemSchemeColor, also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultTabBarItemSchemeColorLight = null;

  // Key used to read and save the tabBarItemSchemeColorDark value.
  static const String keyTabBarItemSchemeColorDark =
      'tabBarItemSchemeColorDark';
  // Default value for the tabBarItemSchemeColorDark, also to reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultTabBarItemSchemeColorDark = null;

  // BottomSheet SETTINGS.
  // ===========================================================================

  // Key used to read and save the bottomSheetBorderRadius value.
  static const String keyBottomSheetBorderRadius = 'bottomSheetBorderRadius';
  // Default value for the bottomSheetBorderRadius, also to reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultBottomSheetBorderRadius = null;

  // Android System Navigator bar SETTINGS.
  // ===========================================================================

  // Key used to read and save the navBarStyle value.
  static const String keySysNavBarStyle = 'sysNavBarStyle';
  // Default value for the navBarStyle, also used to reset settings.
  static const FlexSystemNavBarStyle defaultSysNavBarStyle =
      FlexSystemNavBarStyle.background;

  // Key used to read and save the sysBarOpacity value.
  static const String keySysNavBarOpacity = 'sysSysNavBarOpacity';
  // Default value for the sysBarOpacity, also used to reset settings.
  static const double defaultSysBarOpacity = 1.0;

  // Key used to read and save the useNavDivider value.
  static const String keyUseSysNavDivider = 'useSysNavDivider';
  // Default value for the useNavDivider, also to reset settings.
  static const bool defaultUseSysNavDivider = false;

  // BottomNavigationBar SETTINGS.
  // ===========================================================================

  // Key used to read and save the bottomNavBarBackgroundSchemeColor value.
  static const String keyBottomNavBarBackgroundSchemeColor =
      'bottomNavBarBackgroundSchemeColor';
  // Default value for the bottomNavBarBackgroundSchemeColor, also used to
  // reset settings.
  static const SchemeColor? defaultBottomNavBarBackgroundSchemeColor = null;

  // Key used to read and save the bottomNavigationBarOpacity value.
  static const String keyBottomNavigationBarOpacity =
      'bottomNavigationBarOpacity';
  // Default value for the bottomNavigationBarOpacity, also to reset settings.
  static const double defaultBottomNavigationBarOpacity = 1.0;

  // Key used to read and save the bottomNavigationBarElevation value.
  static const String keyBottomNavigationBarElevation =
      'bottomNavigationBarElevation';
  // Default value for the bottomNavigationBarElevation, also reset settings.
  static const double defaultBottomNavigationBarElevation = 0;

  // Key used to read and save the bottomNavBarSelectedItemSchemeColor value.
  static const String keyBottomNavBarSelectedItemSchemeColor =
      'bottomNavBarSelectedItemSchemeColor';
  // Default value for the bottomNavBarSelectedItemSchemeColor.
  static const SchemeColor? defaultBottomNavBarSelectedItemSchemeColor = null;

  // Key used to read and save the bottomNavBarUnselectedItemSchemeColor value.
  static const String keyBottomNavBarUnselectedSchemeColor =
      'bottomNavBarUnselectedItemSchemeColor';
  // Default bottomNavBarUnselectedItemSchemeColor.
  static const SchemeColor? defaultBottomNavBarUnselectedSchemeColor = null;

  // Key used to read and save the bottomNavBarMuteUnselected value.
  static const String keyBottomNavBarMuteUnselected =
      'bottomNavBarMuteUnselected';
  // Default value for the bottomNavBarMuteUnselected, also to reset settings.
  static const bool defaultBottomNavBarMuteUnselected = true;

  // Key used to read and save the bottomNavShowSelectedLabels value.
  static const String keyBottomNavShowSelectedLabels =
      'bottomNavShowSelectedLabels';
  // Default value for the bottomNavShowSelectedLabels, also to reset settings.
  static const bool defaultBottomNavShowSelectedLabels = true;

  // Key used to read and save the bottomNavShowUnselectedLabels value.
  static const String keyBottomNavShowUnselectedLabels =
      'bottomNavShowUnselectedLabels';
  // Default value for bottomNavShowUnselectedLabels, also to reset settings.
  static const bool defaultBottomNavShowUnselectedLabels = true;

  // NavigationBar SETTINGS.
  // ===========================================================================

  // Key used to read and save the navBarBackgroundSchemeColor value.
  static const String keyNavBarBackgroundSchemeColor =
      'navBarBackgroundSchemeColor';
  // Default value for the navBarBackgroundSchemeColor, also used to
  // reset settings.
  static const SchemeColor? defaultNavBarBackgroundSchemeColor = null;

  // Key used to read and save the navBarOpacity value.
  static const String keyNavBarOpacity = 'navBarOpacity';
  // Default value for the navBarOpacity, also to reset settings.
  static const double defaultNavBarOpacity = 1.0;

  // Key used to read and save the navBarHeight value.
  static const String keyNavBarHeight = 'navBarHeight';
  // Default value for the navBarHeight, also reset settings.
  static const double? defaultNavBarHeight = null;

  // Key used to read and save the navBarSelectedItemSchemeColor value.
  static const String keyNavBarSelectedItemSchemeColor =
      'navBarSelectedItemSchemeColor';
  // Default value for the navBarSelectedItemSchemeColor.
  static const SchemeColor? defaultNavBarSelectedItemSchemeColor = null;

  // Key used to read and save the navBarUnselectedItemSchemeColor value.
  static const String keyNavBarUnselectedSchemeColor =
      'navBarUnselectedItemSchemeColor';
  // Default navBarUnselectedItemSchemeColor.
  static const SchemeColor? defaultNavBarUnselectedSchemeColor = null;

  // Key used to read and save the navBarMuteUnselected value.
  static const String keyNavBarMuteUnselected = 'navBarMuteUnselected';
  // Default value for the navBarMuteUnselected, also used to reset settings.
  static const bool defaultNavBarMuteUnselected = true;

  // Key used to read and save the navBarIndicatorSchemeColor value.
  static const String keyNavBarIndicatorSchemeColor =
      'navBarIndicatorSchemeColor';
  // Default value for the navBarIndicatorSchemeColor, also used to reset
  // settings. We use NULL as default, on nullable settings.
  static const SchemeColor? defaultNavBarIndicatorSchemeColor = null;

  // Key used to read and save the navBarIndicatorOpacity value.
  static const String keyNavBarIndicatorOpacity = 'navBarIndicatorOpacity';
  // Default value for the navBarIndicatorOpacity, also to reset settings.
  static const double? defaultNavBarIndicatorOpacity = null;

  // Key used to read and save the navBarLabelBehavior value.
  static const String keyNavBarLabelBehavior = 'navBarLabelBehavior';
  // Default value for the navBarLabelBehavior, also used to
  // reset settings.
  static const NavigationDestinationLabelBehavior defaultNavBarLabelBehavior =
      NavigationDestinationLabelBehavior.alwaysShow;

  // NavigationRail SETTINGS.
  // ===========================================================================

  // Key used to read and save the navRailBackgroundSchemeColor value.
  static const String keyNavRailBackgroundSchemeColor =
      'navRailBackgroundSchemeColor';
  // Default value for the navRailBackgroundSchemeColor, also used to
  // reset settings.
  static const SchemeColor? defaultNavRailBackgroundSchemeColor = null;

  // Key used to read and save the navigationRailOpacity value.
  static const String keyNavRailOpacity = 'navRailOpacity';
  // Default value for the navigationRailOpacity, also to reset settings.
  static const double defaultNavRailOpacity = 1.0;

  // Key used to read and save the navigationRailElevation value.
  static const String keyNavigationRailElevation = 'navigationRailElevation';
  // Default value for the navigationRailElevation, also reset settings.
  static const double defaultNavigationRailElevation = 0;

  // Key used to read and save the navRailSelectedItemSchemeColor value.
  static const String keyNavRailSelectedItemSchemeColor =
      'navRailSelectedItemSchemeColor';
  // Default value for the navRailSelectedItemSchemeColor.
  static const SchemeColor? defaultNavRailSelectedItemSchemeColor = null;

  // Key used to read and save the navRailUnselectedItemSchemeColor value.
  static const String keyNavRailUnselectedSchemeColor =
      'navRailUnselectedItemSchemeColor';
  // Default navRailUnselectedItemSchemeColor.
  static const SchemeColor? defaultNavRailUnselectedSchemeColor = null;

  // Key used to read and save the navRailMuteUnselected value.
  static const String keyNavRailMuteUnselected = 'navRailMuteUnselected';
  // Default value for the navRailMuteUnselected, also used to reset settings.
  static const bool defaultNavRailMuteUnselected = true;

  // Key used to read and save the navRailLabelType value.
  static const String keyNavRailLabelType = 'navRailLabelType';
  // Default value for the navRailLabelType, also used to
  // reset settings.
  static const NavigationRailLabelType defaultNavRailLabelType =
      NavigationRailLabelType.all;

  // Key used to read and save the navRailUseIndicator value.
  static const String keyNavRailUseIndicator = 'navRailUseIndicator';
  // Default value for the navRailUseIndicator, also to reset settings.
  static const bool defaultNavRailUseIndicator = true;

  // Key used to read and save the navRailIndicatorSchemeColor value.
  static const String keyNavRailIndicatorSchemeColor =
      'navRailIndicatorSchemeColor';
  // Default value for the navRailIndicatorSchemeColor, also used to reset
  // settings. We use NULL as default, on nullable settings.
  static const SchemeColor? defaultNavRailIndicatorSchemeColor = null;

  // Key used to read and save the navigationRailIndicatorOpacity value.
  static const String keyNavRailIndicatorOpacity = 'navRailIndicatorOpacity';
  // Default value for the navigationRailIndicatorOpacity, also reset settings.
  static const double? defaultNavRailIndicatorOpacity = null;

  // Button SETTINGS.
  // ===========================================================================

  // Key used to read and save the textButtonSchemeColor value.
  static const String keyTextButtonSchemeColor = 'textButtonSchemeColor';
  // Default value for the textButtonSchemeColor, also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultTextButtonSchemeColor = null;

  // Key used to read and save the textButtonBorderRadius value.
  static const String keyTextButtonBorderRadius = 'textButtonBorderRadius';
  // Default value for the textButtonBorderRadius, also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultTextButtonBorderRadius = null;

  // Key used to read and save the elevatedButtonSchemeColor value.
  static const String keyElevatedButtonSchemeColor =
      'elevatedButtonSchemeColor';
  // Default value for the elevatedButtonSchemeColor, also used to
  // reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultElevatedButtonSchemeColor = null;

  // Key used to read and save the elevatedButtonBorderRadius value.
  static const String keyElevatedButtonBorderRadius =
      'elevatedButtonBorderRadius';
  // Default value for the elevatedButtonBorderRadius, also used to
  // reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultElevatedButtonBorderRadius = null;

  // Key used to read and save the outlinedButtonSchemeColor value.
  static const String keyOutlinedButtonSchemeColor =
      'outlinedButtonSchemeColor';
  // Default value for the outlinedButtonSchemeColor, also used to
  // reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultOutlinedButtonSchemeColor = null;

  // Key used to read and save the outlinedButtonBorderRadius value.
  static const String keyOutlinedButtonBorderRadius =
      'outlinedButtonBorderRadius';
  // Default value for the outlinedButtonBorderRadius, also used to
  // reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultOutlinedButtonBorderRadius = null;

  // Key used to read and save the toggleButtonsSchemeColor value.
  static const String keyToggleButtonsSchemeColor = 'toggleButtonsSchemeColor';
  // Default value for the toggleButtonsSchemeColor, also used to
  // reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultToggleButtonsSchemeColor = null;

  // Key used to read and save the toggleButtonsBorderRadius value.
  static const String keyToggleButtonsBorderRadius =
      'toggleButtonsBorderRadius';
  // Default value for the toggleButtonsBorderRadius, also used to
  // reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultToggleButtonsBorderRadius = null;

  // Toggleable SETTINGS.
  // ===========================================================================

  // Key used to read and save the unselectedToggleIsColored value.
  static const String keyUnselectedToggleIsColored =
      'unselectedToggleIsColored';
  // Default value for the unselectedToggleIsColored, also to reset settings.
  static const bool defaultUnselectedToggleIsColored = false;

  // Key used to read and save the switchSchemeColor value.
  static const String keySwitchSchemeColor = 'switchSchemeColor';
  // Default value for the switchSchemeColor, also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultSwitchSchemeColor = null;

  // Key used to read and save the checkboxSchemeColor value.
  static const String keyCheckboxSchemeColor = 'checkboxSchemeColor';
  // Default value for the checkboxSchemeColor, also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultCheckboxSchemeColor = null;

  // Key used to read and save the radioSchemeColor value.
  static const String keyRadioSchemeColor = 'radioSchemeColor';
  // Default value for the radioSchemeColor, also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultRadioSchemeColor = null;

  // Fab, Chip, SnackBar, Popup, Card nad Dialog SETTINGS.
  // ===========================================================================

  // Key used to read and save the fabUseShape value.
  static const String keyFabUseShape = 'fabUseShape';
  // Default value for the fabUseShape, also to reset settings.
  static const bool defaultFabUseShape = true;

  // Key used to read and save the fabBorderRadius value.
  static const String keyFabBorderRadius = 'fabBorderRadius';
  // Default value for the fabBorderRadius, also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultFabBorderRadius = null;

  // Key used to read and save the fabSchemeColor value.
  static const String keyFabSchemeColor = 'fabSchemeColor';
  // Default value for the fabSchemeColor, also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultFabSchemeColor = null;

  // Key used to read and save the chipSchemeColor value.
  static const String keyChipSchemeColor = 'chipSchemeColor';
  // Default value for the chipSchemeColor, also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultChipSchemeColor = null;

  // Key used to read and save the chipBorderRadius value.
  static const String keyChipBorderRadius = 'chipBorderRadius';
  // Default value for the chipBorderRadius, also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultChipBorderRadius = null;

  // Key used to read and save the snackBarSchemeColor value.
  static const String keySnackBarSchemeColor = 'snackBarSchemeColor';
  // Default value for the snackBarSchemeColor, also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultSnackBarSchemeColor = null;

  // Key used to read and save the popupMenuOpacity value.
  static const String keyPopupMenuOpacity = 'popupMenuOpacity';
  // Default value for the popupMenuOpacity, also used to reset settings.
  static const double defaultPopupMenuOpacity = 1;

  // Key used to read and save the popupMenuBorderRadius value.
  static const String keyPopupMenuBorderRadius = 'popupMenuBorderRadius';
  // Default value for the popupMenuBorderRadius, also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultPopupMenuBorderRadius = null;

  // Key used to read and save the cardBorderRadius value.
  static const String keyCardBorderRadius = 'cardBorderRadius';
  // Default value for the cardBorderRadius, also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultCardBorderRadius = null;

  // Key used to read and save the dialogBackgroundSchemeColor value.
  static const String keyDialogBackgroundSchemeColor =
      'dialogBackgroundSchemeColor';
  // Default value for the dialogBackgroundSchemeColor, also used to
  // reset settings.
  static const SchemeColor? defaultDialogBackgroundSchemeColor = null;

  // Key used to read and save the dialogBorderRadius value.
  static const String keyDialogBorderRadius = 'dialogBorderRadius';
  // Default value for the dialogBorderRadius, also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultDialogBorderRadius = null;

  // Custom color SETTINGS.
  // ===========================================================================

  // Key used to read and save the primaryLight color value.
  static const String keyPrimaryLight = 'primaryLight';
  // Default value for the primaryLight color, also to reset settings.
  static const Color defaultPrimaryLight = AppColor.customPrimaryLight;

  // Key used to read and save the primaryContainerLight color value.
  static const String keyPrimaryContainerLight = 'primaryContainerLight';
  // Default value for the primaryLight color, also to reset settings.
  static const Color defaultPrimaryContainerLight =
      AppColor.customPrimaryContainerLight;

  // Key used to read and save the secondaryLight color value.
  static const String keySecondaryLight = 'secondaryLight';
  // Default value for the secondaryLight color, also to reset settings.
  static const Color defaultSecondaryLight = AppColor.customSecondaryLight;

  // Key used to read and save the secondaryContainerLight color value.
  static const String keySecondaryContainerLight = 'secondaryContainerLight';
  // Default value for the secondaryLight color, also to reset settings.
  static const Color defaultSecondaryContainerLight =
      AppColor.customSecondaryContainerLight;

  // Key used to read and save the tertiaryLight color value.
  static const String keyTertiaryLight = 'tertiaryLight';
  // Default value for the tertiaryLight color, also to reset settings.
  static const Color defaultTertiaryLight = AppColor.customTertiaryLight;

  // Key used to read and save the tertiaryContainerLight color value.
  static const String keyTertiaryContainerLight = 'tertiaryContainerLight';
  // Default value for the tertiaryLight color, also to reset settings.
  static const Color defaultTertiaryContainerLight =
      AppColor.customTertiaryContainerLight;

  // Key used to read and save the primaryDark color value.
  static const String keyPrimaryDark = 'primaryDark';
  // Default value for the primaryDark color, also to reset settings.
  static const Color defaultPrimaryDark = AppColor.customPrimaryDark;

  // Key used to read and save the primaryContainerDark color value.
  static const String keyPrimaryContainerDark = 'primaryContainerDark';
  // Default value for the primaryDark color, also to reset settings.
  static const Color defaultPrimaryContainerDark =
      AppColor.customPrimaryContainerDark;

  // Key used to read and save the secondaryDark color value.
  static const String keySecondaryDark = 'secondaryDark';
  // Default value for the secondaryDark color, also to reset settings.
  static const Color defaultSecondaryDark = AppColor.customSecondaryDark;

  // Key used to read and save the secondaryContainerDark color value.
  static const String keySecondaryContainerDark = 'secondaryContainerDark';
  // Default value for the secondaryDark color, also to reset settings.
  static const Color defaultSecondaryContainerDark =
      AppColor.customSecondaryContainerDark;

  // Key used to read and save the tertiaryDark color value.
  static const String keyTertiaryDark = 'tertiaryDark';
  // Default value for the tertiaryDark color, also to reset settings.
  static const Color defaultTertiaryDark = AppColor.customTertiaryDark;

  // Key used to read and save the tertiaryContainerDark color value.
  static const String keyTertiaryContainerDark = 'tertiaryContainerDark';
  // Default value for the tertiaryDark color, also to reset settings.
  static const Color defaultTertiaryContainerDark =
      AppColor.customTertiaryContainerDark;

  // Not yet implemented SETTINGS.
  // ===========================================================================

}
