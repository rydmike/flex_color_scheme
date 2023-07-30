import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../model/adaptive_theme.dart';
import '../model/splash_type_enum.dart';
import '../model/visual_density_enum.dart';
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

  // Key used to read and save the usedVisualDensity value.
  static const String keyUsedVisualDensity = 'usedVisualDensity';
  // Default value for the usedVisualDensity, also to reset settings.
  static const VisualDensityEnum defaultUsedVisualDensity =
      VisualDensityEnum.comfortablePlatform;

  // Key used to read and save the useFlexColorScheme value.
  static const String keyUseFlexColorScheme = 'useFlexColorScheme';
  // Default value for the useFlexColorScheme, also to reset settings.
  static const bool defaultUseFlexColorScheme = true;

  // Key used to read and save the useSubThemes value.
  static const String keyUseSubThemes = 'useSubThemes';
  // Default value for the useSubThemes, also used to reset settings.
  static const bool defaultUseSubThemes = true;

  // Key used to read and save the useFlutterDefaults value.
  static const String keyUseFlutterDefaults = 'useFlutterDefaults';
  // Default value for the useFlutterDefaults, also to reset settings.
  static const bool defaultUseFlutterDefaults = false;

  // Key used to read and save the adaptiveRemoveElevationTintLight value.
  static const String keyAdaptiveRemoveElevationTintLight =
      'adaptiveRemoveElevationTintLight';
  // Default value for the adaptiveRemoveElevationTintLight,
  // also to reset settings.
  // We use NULL as default, on nullable settings.
  static const AdaptiveTheme? defaultAdaptiveRemoveElevationTintLight = null;

  // Key used to read and save the adaptiveElevationShadowsBackLight value.
  static const String keyAdaptiveElevationShadowsBackLight =
      'adaptiveElevationShadowsBackLight';
  // Default value for the adaptiveElevationShadowsBackLight,
  // also to reset settings.
  // We use NULL as default, on nullable settings.
  static const AdaptiveTheme? defaultAdaptiveElevationShadowsBackLight = null;

  // Key used to read and save the adaptiveAppBarScrollUnderOffLight value.
  static const String keyAdaptiveAppBarScrollUnderOffLight =
      'adaptiveAppBarScrollUnderOffLight';
  // Default value for the adaptiveAppBarScrollUnderOffLight,
  // also to reset settings.
  // We use NULL as default, on nullable settings.
  static const AdaptiveTheme? defaultAdaptiveAppBarScrollUnderOffLight = null;

  // Key used to read and save the adaptiveRemoveElevationTintDark value.
  static const String keyAdaptiveRemoveElevationTintDark =
      'adaptiveRemoveElevationTintDark';
  // Default value for the adaptiveRemoveElevationTintDark,
  // also to reset settings.
  // We use NULL as default, on nullable settings.
  static const AdaptiveTheme? defaultAdaptiveRemoveElevationTintDark = null;

  // Key used to read and save the adaptiveElevationShadowsBackDark value.
  static const String keyAdaptiveElevationShadowsBackDark =
      'adaptiveElevationShadowsBackDark';
  // Default value for the adaptiveElevationShadowsBackDark,
  // also to reset settings.
  // We use NULL as default, on nullable settings.
  static const AdaptiveTheme? defaultAdaptiveElevationShadowsBackDark = null;

  // Key used to read and save the adaptiveAppBarScrollUnderOffDark value.
  static const String keyAdaptiveAppBarScrollUnderOffDark =
      'adaptiveAppBarScrollUnderOffDark';
  // Default value for the adaptiveAppBarScrollUnderOffDark,
  // also to reset settings.
  // We use NULL as default, on nullable settings.
  static const AdaptiveTheme? defaultAdaptiveAppBarScrollUnderOffDark = null;

  // Key used to read and save the adaptiveRadius value.
  static const String keyAdaptiveRadius = 'adaptiveRadius';
  // Default value for the adaptiveRadius, also to reset settings.
  // We use NULL as default, on nullable settings.
  static const AdaptiveTheme? defaultAdaptiveRadius = null;

  // Key used to read and save the adaptiveSplashType value.
  static const String keyAdaptiveSplash = 'adaptiveSplash';
  // Default value for the adaptiveSplashType, also to reset settings.
  // We use NULL as default, on nullable settings.
  static const AdaptiveTheme? defaultAdaptiveSplash = null;

  // Key used to read and save the splashType value.
  static const String keySplashType = 'splashType';
  // Default value for the splashType, also to reset settings.
  // We use NULL as default, on nullable settings.
  static const SplashTypeEnum? defaultSplashType = null;

  // Key used to read and save the splashTypeAdaptive value.
  static const String keySplashTypeAdaptive = 'splashTypeAdaptive';
  // Default value for the splashTypeAdaptive, also to reset settings.
  // We use NULL as default, on nullable settings.
  static const SplashTypeEnum? defaultSplashTypeAdaptive = null;

  // Key used to read and save the isLargeGridView value.
  static const String keyIsLargeGridView = 'isLargeGridView';
  // Default value for the isLargeGridView, also used to reset settings.
  static const bool defaultIsLargeGridView = false;

  // Key used to read and save the compactMode value.
  static const String keyCompactMode = 'compactMode';
  // Default value for the compactMode, also used to reset settings.
  static const bool defaultCompactMode = true;

  // Key used to read and save the verticalMode value.
  static const String keyVerticalMode = 'verticalMode';
  // Default value for the verticalMode, also used to reset settings.
  static const bool defaultVerticalMode = true;

  // Key used to read and save the confirmPremade value.
  static const String keyConfirmPremade = 'confirmPremade';
  // Default value for the confirmPremade, also used to reset settings.
  static const bool defaultConfirmPremade = true;

  // Key used to read and save the viewIndex value.
  static const String keyViewIndex = 'viewIndex';
  // Default value for the viewIndex.
  static const int defaultViewIndex = 0;

  // Key used to read and save the sideViewIndex value.
  static const String keySideViewIndex = 'sideViewIndex';
  // Default value for the sideViewIndex.
  static const int defaultSideViewIndex = 2;

  // Key used to read and save the simulatorDeviceIndex value.
  static const String keySimulatorDeviceIndex = 'simulatorDeviceIndex';
  // Default value for the simulatorDeviceIndex, also used to reset settings.
  static const int defaultSimulatorDeviceIndex = 0;

  // Key used to read and save the simulatorAppIndex value.
  static const String keySimulatorAppIndex = 'simulatorAppIndex';
  // Default value for the simulatorAppIndex, also used to reset settings.
  static const int defaultSimulatorAppIndex = 0;

  // Key used to read and save the simulatorComponentsIndex value.
  static const String keySimulatorComponentsIndex = 'simulatorComponentsIndex';
  // Default value for the simulatorComponentsIndex, also to reset settings.
  static const int defaultSimulatorComponentsIndex = 0;

  // Key used to read and save the deviceSize value.
  static const String keyDeviceSize = 'deviceSize';
  // Default value for the deviceSize, also used to reset settings.
  static const double defaultDeviceSize = 1000;

  // Key used to read and save the showSchemeInput value.
  static const String keyShowSchemeInput = 'showSchemeInput';
  // Default value for the showSchemeInput, also used to reset settings.
  static const bool defaultShowSchemeInput = false;

  // Key used to read and save the useTextTheme value.
  static const String keyUseTextTheme = 'useTextTheme';
  // Default value for the useSubThemes, also used to reset settings.
  // The controller uses a nullable bool with different defaults in
  // M2 and M3 mode if it is set to null. The API use null as default for this
  // property and it can be set to null in Playground, but playground is
  // a bit opinionated and defaults to always uing M3 typography since it is
  // much much better than M2.
  static const bool defaultUseTextTheme = true;

  // Key used to read and save the useM2StyleDividerInM3 value.
  static const String keyUseM2StyleDividerInM3 = 'useM2StyleDividerInM3';
  // Default value for the useM2StyleDividerInM3, also used to reset settings.
  static const bool defaultUseM2StyleDividerInM3 = true;

  // Key used to read and save the useAppFont value.
  static const String keyUseAppFont = 'useAppFont';
  // Default value for the useAppFont, also used to reset settings.
  static const bool defaultUseAppFont = true;

  // Key used to read and save the usedScheme value.
  static const String keyUsedScheme = 'usedScheme';
  // Default value for the usedScheme, also used to reset settings.
  static const FlexScheme defaultUsedScheme = FlexScheme.materialBaseline;

  // Key used to read and save the schemeIndex value.
  static const String keySchemeIndex = 'schemeIndex';
  // Default value for the schemeIndex, also used to reset settings.
  // Defaults to 35, in examples 4 & 5 where this is used it will make
  // the default theme based on the [FlexColor.materialBaseline] color scheme.
  static const int defaultSchemeIndex = 40;

  // Key used to read and save the interactionEffects value.
  static const String keyInteractionEffects = 'interactionEffects';
  // Default value for the interactionEffects, also used to reset settings.
  static const bool defaultInteractionEffects = true;

  // Key used to read and save the tintedDisabledControls value.
  static const String keyTintedDisabledControls = 'tintedDisabledControls';
  // Default value for the tintedDisabledControls, also used to reset settings.
  static const bool defaultTintedDisabledControls = true;

  // Key used to read and save the defaultRadius value.
  static const String keyDefaultRadius = 'defaultRadius';
  // Default value for the defaultRadius, also used to reset settings.
  static const double? defaultDefaultRadius = null;

  // Key used to read and save the defaultRadiusAdaptive value.
  static const String keyDefaultRadiusAdaptive = 'defaultRadiusAdaptive';
  // Default value for the defaultRadiusAdaptive, also used to reset settings.
  static const double? defaultDefaultRadiusAdaptive = null;

  // Key used to read and save the thinBorderWidth value.
  static const String keyThinBorderWidth = 'thinBorderWidth';
  // Default value for the thinBorderWidth, also used to reset settings.
  static const double? defaultThinBorderWidth = null;

  // Key used to read and save the thickBorderWidth value.
  static const String keyThickBorderWidth = 'thickBorderWidth';
  // Default value for the thickBorderWidth, also used to reset settings.
  static const double? defaultThickBorderWidth = null;

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
      FlexSurfaceMode.levelSurfacesLowScaffold;

  // Key used to read and save the surfaceModeDark value.
  static const String keySurfaceModeDark = 'surfaceModeDark';
  // Default value for the surfaceModeDark, also used to reset settings.
  static const FlexSurfaceMode defaultSurfaceModeDark =
      FlexSurfaceMode.levelSurfacesLowScaffold;

  // Key used to read and save the blendLevel value.
  static const String keyBlendLevel = 'blendLevel';
  // Default value for the blendLevel, also used to reset settings.
  // Defaults to 7.
  static const int defaultBlendLevel = 7;

  // Key used to read and save the blendLevelDark value.
  static const String keyBlendLevelDark = 'blendLevelDark';
  // Default value for the blendLevelDark, also used to reset settings.
  // Defaults to 13.
  static const int defaultBlendLevelDark = 13;

  // Key used to read and save the onBlendLevel value.
  static const String keyOnBlendLevel = 'blendOnLevel';
  // Default value for the onBlendLevel, also used to reset settings.
  // Defaults to 10.
  static const int defaultBlendOnLevel = 10;

  // Key used to read and save the blendOnLevelDark value.
  static const String keyBlendOnLevelDark = 'blendOnLevelDark';
  // Default value for the blendOnLevelDark, also used to reset settings.
  // Defaults to 20.
  static const int defaultBlendOnLevelDark = 20;

  // Key used to read and save the usedColors value.
  static const String keyUsedColors = 'usedColors';
  // Default value for the usedColorsLevel, also used to reset settings.
  // Defaults to 6.
  static const int defaultUsedColors = 6;

  // Key used to swap legacy M2 secondary and tertiary colors.
  static const String keySwapLegacyColors = 'swapLegacyColors';
  // Default value for the swapLegacyColors, also to reset settings.
  static const bool defaultSwapLegacyColors = true;

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
  static const bool defaultBlendLightTextTheme = false;

  // Key used to read and save the blendDarkTextTheme value.
  static const String keyBlendDarkTextTheme = 'blendDarkTextTheme';
  // Default value for the blendDarkTextTheme, also to reset settings.
  static const bool defaultBlendDarkTextTheme = false;

  // Material 3 and Seed ColorScheme SETTINGS.
  // ===========================================================================

  // Key used to read and save the useMaterial3 value.
  static const String keyUseMaterial3 = 'useMaterial3';
  // Default value for the useMaterial3, also to reset settings.
  static const bool defaultUseMaterial3 = true;

  // Key used to read and save the paletteType value.
  static const String keyPaletteType = 'paletteType';
  // Default value for the paletteType, also to reset settings.
  static const FlexPaletteType defaultPaletteType = FlexPaletteType.common;

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

  // TODO(rydmike): Tech debt, refactor usedFlexToneSetup to use FlexTonesEnum.
  // See for example keyAdaptiveRemoveElevationTintLight and AdaptiveTheme.

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

  // Key used to read and save the onMainsUseBWLight value.
  static const String keyOnMainsUseBWLight = 'onMainsUseBWLight';
  // Default value for the onMainsUseBWLight, also to reset settings.
  static const bool defaultOnMainsUseBWLight = false;

  // Key used to read and save the onMainsUseBWDark value.
  static const String keyOnMainsUseBWDark = 'onMainsUseBWDark';
  // Default value for the onMainsUseBWDark, also to reset settings.
  static const bool defaultOnMainsUseBWDark = false;

  // Key used to read and save the onSurfacesUseBWLight value.
  static const String keyOnSurfacesUseBWLight = 'onSurfacesUseBWLight';
  // Default value for the onSurfacesUseBWLight, also to reset settings.
  static const bool defaultOnSurfacesUseBWLight = false;

  // Key used to read and save the onSurfacesUseBWDark value.
  static const String keyOnSurfacesUseBWDark = 'onSurfacesUseBWDark';
  // Default value for the onSurfacesUseBWDark, also to reset settings.
  static const bool defaultOnSurfacesUseBWDark = false;

  // Key used to read and save the surfacesUseBWLight value.
  static const String keySurfacesUseBWLight = 'surfacesUseBWLight';
  // Default value for the surfacesUseBWLight, also to reset settings.
  static const bool defaultSurfacesUseBWLight = false;

  // Key used to read and save the onSurfacesUseBWDark value.
  static const String keySurfacesUseBWDark = 'surfacesUseBWDark';
  // Default value for the onSurfacesUseBWDark, also to reset settings.
  static const bool defaultSurfacesUseBWDark = false;

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

  // Key used to read and save the inputDecoratorBorderSchemeColorLight value.
  static const String keyInputDecoratorBorderSchemeColorLight =
      'inputDecoratorBorderSchemeColorLight';
  // Default value for the inputDecoratorBorderSchemeColorLight, reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultInputDecoratorBorderSchemeColorLight = null;

  // Key used to read and save the inputDecoratorBorderSchemeColorDark value.
  static const String keyInputDecoratorBorderSchemeColorDark =
      'inputDecoratorBorderSchemeColorDark';
  // Default value for the inputDecoratorBorderSchemeColorDark, reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultInputDecoratorBorderSchemeColorDark = null;

  // Key used to read and save the inputDecoratorIsFilled value.
  static const String keyInputDecoratorIsFilled = 'inputDecoratorIsFilled';
  // Default value for the inputDecoratorIsFilled, also used to reset settings.
  static const bool defaultInputDecoratorIsFilled = true;

  // Key used to read and save the inputDecoratorBackgroundAlphaLight value.
  static const String keyInputDecoratorBackgroundAlphaLight =
      'inputDecoratorBackgroundAlphaLight';
  // Default value for the inputDecoratorBackgroundAlphaLight,
  // and to reset settings.
  static const int? defaultInputDecoratorBackgroundAlphaLight = null;

  // Key used to read and save the inputDecoratorBackgroundAlphaDark value.
  static const String keyInputDecoratorBackgroundAlphaDark =
      'inputDecoratorBackgroundAlphaDark';
  // Default value for the inputDecoratorBackgroundAlphaDark,
  // and to reset settings.
  static const int? defaultInputDecoratorBackgroundAlphaDark = null;

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

  // Key used to read and save the inputDecoratorFocusedHasBorder value.
  static const String keyInputDecoratorFocusedHasBorder =
      'inputDecoratorFocusedHasBorder';
  // Default value for the inputDecoratorUnfocusedHasBorder, reset settings.
  static const bool defaultInputDecoratorFocusedHasBorder = true;

  // Key used to read and save the inputDecoratorUnfocusedBorderIsColored value.
  static const String keyInputDecoratorUnfocusedBorderIsColored =
      'inputDecoratorUnfocusedBorderIsColored';
  // Default value for the inputDecoratorUnfocusedBorderIsColored, also used to
  // reset settings.
  static const bool defaultInputDecoratorUnfocusedBorderIsColored = true;

  // Key used to read and save the inputDecoratorBorderWidth value.
  static const String keyInputDecoratorBorderWidth =
      'inputDecoratorBorderWidth';
  // Default value for the inputDecoratorBorderWidth, also to reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultInputDecoratorBorderWidth = null;

  // Key used to read and save the inputDecoratorFocusedBorderWidth value.
  static const String keyInputDecoratorFocusedBorderWidth =
      'inputDecoratorFocusedBorderWidth';
  // Default value for the inputDecoratorFocusedBorderWidth, to reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultInputDecoratorFocusedBorderWidth = null;

  // Key used to read and save the inputDecoratorPrefixIconSchemeColor value.
  static const String keyInputDecoratorPrefixIconSchemeColor =
      'inputDecoratorPrefixIconSchemeColor';
  // Default value for the inputDecoratorPrefixIconSchemeColor, reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultInputDecoratorPrefixIconSchemeColor = null;

  // Key used to read and save inputDecoratorPrefixIconDarkSchemeColor value.
  static const String keyInputDecoratorPrefixIconDarkSchemeColor =
      'inputDecoratorPrefixIconDarkSchemeColor';
  // Default for the inputDecoratorPrefixIconDarkSchemeColor, reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultInputDecoratorPrefixIconDarkSchemeColor =
      null;

  // TextSelection SETTINGS.
  // ===========================================================================

  // Key used to read and save the inputCursorLightSchemeColor value.
  static const String keyInputCursorLightSchemeColor =
      'inputCursorLightSchemeColor';
  // Default value for the inputCursorLightSchemeColor, reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultInputCursorLightSchemeColor = null;

  // Key used to read and save the inputSelectionLightSchemeColor value.
  static const String keyInputSelectionLightSchemeColor =
      'inputSelectionLightSchemeColor';
  // Default value for the inputSelectionLightSchemeColor, reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultInputSelectionLightSchemeColor = null;

  // Key used to read and save the inputSelectionLightOpacity value.
  static const String keyInputSelectionLightOpacity =
      'inputSelectionLightOpacity';
  // Default value for the inputSelectionLightOpacity, to reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultInputSelectionLightOpacity = null;

  // Key used to read and save the inputSelectionHandleLightSchemeColor value.
  static const String keyInputSelectionHandleLightSchemeColor =
      'inputSelectionHandleLightSchemeColor';
  // Default value for the inputSelectionHandleLightSchemeColor, reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultInputSelectionHandleLightSchemeColor = null;

  // Key used to read and save the inputCursorDarkSchemeColor value.
  static const String keyInputCursorDarkSchemeColor =
      'inputCursorDarkSchemeColor';
  // Default value for the inputCursorDarkSchemeColor, reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultInputCursorDarkSchemeColor = null;

  // Key used to read and save the inputSelectionDarkSchemeColor value.
  static const String keyInputSelectionDarkSchemeColor =
      'inputSelectionDarkSchemeColor';
  // Default value for the inputSelectionDarkSchemeColor, reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultInputSelectionDarkSchemeColor = null;

  // Key used to read and save the inputSelectionDarkOpacity value.
  static const String keyInputSelectionDarkOpacity =
      'inputSelectionDarkOpacity';
  // Default value for the inputSelectionDarkOpacity, to reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultInputSelectionDarkOpacity = null;

  // Key used to read and save the inputSelectionHandleDarkSchemeColor value.
  static const String keyInputSelectionHandleDarkSchemeColor =
      'inputSelectionHandleDarkSchemeColor';
  // Default value for the inputSelectionHandleDarkSchemeColor, reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultInputSelectionHandleDarkSchemeColor = null;

  // AppBar SETTINGS.
  // ===========================================================================

  // Key used to read and save the appBarStyleLight value.
  static const String keyAppBarStyleLight = 'lightAppBarStyle';
  // Default value for the appBarStyleLight, also used to reset settings.
  static const FlexAppBarStyle? defaultAppBarStyleLight = null;
  // FlexAppBarStyle.primary;

  // Key used to read and save the appBarStyleDark value.
  static const String keyAppBarStyleDark = 'darkAppBarStyle';
  // Default value for the appBarStyleDark, also used to reset settings.
  static const FlexAppBarStyle? defaultAppBarStyleDark = null;
  // FlexAppBarStyle.background;

  // Key used to read and save the appBarOpacityLight value.
  static const String keyAppBarOpacityLight = 'appBarOpacity';
  // Default value for the appBarOpacityLight, also used to reset settings.
  static const double defaultAppBarOpacityLight = 1.0;

  // Key used to read and save the appBarOpacityDark value.
  static const String keyAppBarOpacityDark = 'appBarOpacityDark';
  // Default value for the appBarOpacityDark, also used to reset settings.
  static const double defaultAppBarOpacityDark = 1.0;

  // Key used to read and save the appBarElevationLight value.
  static const String keyAppBarElevationLight = 'appBarElevation';
  // Default value for the appBarElevation, also used to reset settings.
  static const double? defaultAppBarElevationLight = null;

  // Key used to read and save the appBarElevationDark value.
  static const String keyAppBarElevationDark = 'appBarElevationDark';
  // Default value for the appBarElevationDark, also used to reset settings.
  static const double? defaultAppBarElevationDark = null;

  // Key used to read and save the appBarScrolledUnderElevationLight value.
  static const String keyAppBarScrolledUnderElevationLight =
      'appBarScrolledUnderElevationLight';
  // Default value for the appBarScrolledUnderElevation, used to reset settings.
  static const double? defaultAppBarScrolledUnderElevationLight = null;

  // Key used to read and save the appBarScrolledUnderElevationDark value.
  static const String keyAppBarScrolledUnderElevationDark =
      'appBarScrolledUnderElevationDark';
  // Default value for the appBarScrolledUnderElevationDark, reset settings.
  static const double? defaultAppBarScrolledUnderElevationDark = null;

  // Key used to read and save the bottomAppBarElevation value.
  static const String keyBottomAppBarElevationLight =
      'bottomAppBarElevationLight';
  // Default value for the bottomAppBarElevation, also used to reset settings.
  static const double? defaultBottomAppBarElevationLight = null;

  // Key used to read and save the bottomAppBarElevationDark value.
  static const String keyBottomAppBarElevationDark =
      'bottomAppBarElevationDark';
  // Default value for the bottomAppBarElevationDark, also to reset settings.
  static const double? defaultBottomAppBarElevationDark = null;

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

  // BottomAppBar SETTINGS.
  // ===========================================================================

  // Key used to read and save the bottomAppBarSchemeColor value.
  static const String keyBottomAppBarSchemeColor = 'bottomAppBarSchemeColor';
  // Default value for the bottomAppBarSchemeColor, also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultBottomAppBarSchemeColor = null;

  // TabBar SETTINGS.
  // ===========================================================================

  // Key used to read and save the tabBarStyle value.
  static const String keyTabBarStyle = 'tabBarStyle';
  // Default value for the tabBarStyle, also used to reset settings.
  static const FlexTabBarStyle? defaultTabBarStyle = null;

  // Key used to read and save the tabBarIndicatorLight value.
  static const String keyTabBarIndicatorLight = 'tabBarIndicatorLight';
  // Default value for the tabBarIndicatorLight, also used to reset settings.
  // We use NULL as default, on this nullable setting.
  static const SchemeColor? defaultTabBarIndicatorLight = null;

  // Key used to read and save the tabBarIndicatorDark value.
  static const String keyTabBarIndicatorDark = 'tabBarIndicatorDark';
  // Default value for the tabBarIndicatorDark, also used to reset settings.
  // We use NULL as default, on this nullable setting.
  static const SchemeColor? defaultTabBarIndicatorDark = null;

  // Key used to read and save the tabBarItemSchemeColor value.
  static const String keyTabBarItemSchemeColorLight =
      'tabBarItemSchemeColorLight';
  // Default value for the tabBarItemSchemeColor, also used to reset settings.
  // We use NULL as default, on this nullable setting.
  static const SchemeColor? defaultTabBarItemSchemeColorLight = null;

  // Key used to read and save the tabBarItemSchemeColorDark value.
  static const String keyTabBarItemSchemeColorDark =
      'tabBarItemSchemeColorDark';
  // Default value for the tabBarItemSchemeColorDark, also to reset settings.
  // We use NULL as default, this nullable setting.
  static const SchemeColor? defaultTabBarItemSchemeColorDark = null;

  // Key used to read and save the tabBarUnselectedItemSchemeColor value.
  static const String keyTabBarUnselectedItemSchemeColorLight =
      'tabBarUnselectedItemSchemeColorLight';
  // Default value for the tabBarUnselectedItemSchemeColor,
  // also used to reset settings.
  // We use NULL as default, on this nullable setting.
  static const SchemeColor? defaultTabBarUnselectedItemSchemeColorLight = null;

  // Key used to read and save the tabBarUnselectedItemSchemeColorDark value.
  static const String keyTabBarUnselectedItemSchemeColorDark =
      'tabBarUnselectedItemSchemeColorDark';
  // Default value for the tabBarUnselectedItemSchemeColorDark,
  // also to reset settings.
  // We use NULL as default, this nullable setting.
  static const SchemeColor? defaultTabBarUnselectedItemSchemeColorDark = null;

  // Key used to read and save the tabBarUnselectedItemOpacityLight value.
  static const String keyTabBarUnselectedItemOpacityLight =
      'tabBarUnselectedItemOpacityLight';
  // Default value for the tabBarUnselectedItemOpacityLight, to reset settings.
  // We use NULL as default, this nullable setting.
  static const double? defaultTabBarUnselectedItemOpacityLight = null;

  // Key used to read and save the tabBarUnselectedItemOpacityDark value.
  static const String keyTabBarUnselectedItemOpacityDark =
      'tabBarUnselectedItemOpacityDark';
  // Default value for the tabBarUnselectedItemOpacityDark, to reset settings.
  // We use NULL as default, this nullable setting.
  static const double? defaultTabBarUnselectedItemOpacityDark = null;

  // Key used to read and save the tabBarIndicatorSize value.
  static const String keyTabBarIndicatorSize = 'tabBarIndicatorSize';
  // Default value for the tabBarIndicatorSize, also to reset settings.
  // We use NULL as default, this nullable setting.
  static const TabBarIndicatorSize? defaultTabBarIndicatorSize = null;

  // Key used to read and save the tabBarIndicatorWeight value.
  static const String keyTabBarIndicatorWeight = 'tabBarIndicatorWeight';
  // Default value for the tabBarIndicatorWeight, also used to reset settings.
  // We use NULL as default, on this nullable setting.
  static const double? defaultTabBarIndicatorWeight = null;

  // Key used to read and save the tabBarIndicatorTopRadius value.
  static const String keyTabBarIndicatorTopRadius = 'tabBarIndicatorTopRadius';
  // Default value for the tabBarIndicatorTopRadius, also to reset settings.
  // We use NULL as default, on this nullable setting.
  static const double? defaultTabBarIndicatorTopRadius = null;

  // Key used to read and save the tabBarDividerColor value.
  static const String keyTabBarDividerColor = 'tabBarDividerColor';
  // Default value for the tabBarDividerColor, also used to reset settings.
  // We use NULL as default, on this nullable setting.
  static const Color? defaultTabBarDividerColor = null;

  // Drawer SETTINGS.
  // ===========================================================================

  // Key used to read and save the drawerBorderRadius value.
  static const String keyDrawerBorderRadius = 'drawerBorderRadius';
  // Default value for the drawerBorderRadius, also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultDrawerBorderRadius = null;

  // Key used to read and save the drawerElevation value.
  static const String keyDrawerElevation = 'drawerElevation';
  // Default value for the drawerElevation, also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultDrawerElevation = null;

  // Key used to read and save the drawerBackgroundSchemeColor value.
  static const String keyDrawerBackgroundSchemeColor =
      'drawerBackgroundSchemeColor';
  // Default value for the drawerBackgroundSchemeColor, also used to
  // reset settings.
  static const SchemeColor? defaultDrawerBackgroundSchemeColor = null;

  // Key used to read and save the drawerWidth value.
  static const String keyDrawerWidth = 'drawerWidth';
  // Default value for the drawerWidth, also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultDrawerWidth = null;

  // Key used to read and save the drawerIndicatorWidth value.
  static const String keyDrawerIndicatorWidth = 'drawerIndicatorWidth';
  // Default value for the drawerIndicatorWidth, also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultDrawerIndicatorWidth = null;

  // Key used to read and save the drawerIndicatorBorderRadius value.
  static const String keyDrawerIndicatorBorderRadius =
      'drawerIndicatorBorderRadius';
  // Default value for the drawerIndicatorBorderRadius, also used to
  // reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultDrawerIndicatorBorderRadius = null;

  // Key used to read and save the drawerIndicatorSchemeColor value.
  static const String keyDrawerIndicatorSchemeColor =
      'drawerIndicatorSchemeColor';
  // Default value for the drawerIndicatorSchemeColor, also used to
  // reset settings.
  static const SchemeColor? defaultDrawerIndicatorSchemeColor = null;

  // Key used to read and save the drawerIndicatorOpacity value.
  static const String keyDrawerIndicatorOpacity = 'drawerIndicatorOpacity';
  // Default value for the drawerIndicatorOpacity, also to reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultDrawerIndicatorOpacity = null;

  // Key used to read and save the drawerSelectedItemSchemeColor value.
  static const String keyDrawerSelectedItemSchemeColor =
      'drawerSelectedItemSchemeColor';
  // Default value for the drawerSelectedItemSchemeColor, also used to
  // reset settings.
  static const SchemeColor? defaultDrawerSelectedItemSchemeColor = null;

  // Key used to read and save the drawerUnselectedItemSchemeColor value.
  static const String keyDrawerUnselectedItemSchemeColor =
      'drawerUnselectedItemSchemeColor';
  // Default value for the drawerUnselectedItemSchemeColor, also used to
  // reset settings.
  static const SchemeColor? defaultDrawerUnselectedItemSchemeColor = null;

  // BottomSheet SETTINGS.
  // ===========================================================================

  // Key used to read and save the bottomSheetSchemeColor value.
  static const String keyBottomSheetSchemeColor = 'bottomSheetSchemeColor';
  // Default value for the bottomSheetSchemeColor, also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultBottomSheetSchemeColor = null;

  // Key used to read and save the bottomSheetModalSchemeColor value.
  static const String keyBottomSheetModalSchemeColor =
      'bottomSheetModalSchemeColor';
  // Default value for the bottomSheetModalSchemeColor, also used to reset
  // settings. We use NULL as default, on nullable settings.
  static const SchemeColor? defaultBottomSheetModalSchemeColor = null;

  // Key used to read and save the bottomSheetElevation value.
  static const String keyBottomSheetElevation = 'bottomSheetElevation';
  // Default value for the bottomSheetElevation, also to reset settings.
  // We use NULL as default, on this nullable setting.
  static const double? defaultBottomSheetElevation = null;

  // Key used to read and save the bottomSheetModalElevation value.
  static const String keyBottomSheetModalElevation =
      'bottomSheetModalElevation';
  // Default value for the bottomSheetModalElevation, also to reset settings.
  // We use NULL as default, on this nullable setting.
  static const double? defaultBottomSheetModalElevation = null;

  // Key used to read and save the bottomSheetBorderRadius value.
  static const String keyBottomSheetBorderRadius = 'bottomSheetBorderRadius';
  // Default value for the bottomSheetBorderRadius, also to reset settings.
  // We use NULL as default, on this nullable setting.
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
  static const double? defaultBottomNavigationBarElevation = null;

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

  // Menu, MenuBar and MenuButton SETTINGS.
  // ===========================================================================

  // Key used to read and save the menuRadius value.
  static const String keyMenuRadius = 'menuRadius';
  // Default value for the menuRadius, also reset settings.
  static const double? defaultMenuRadius = null;

  // Key used to read and save the menuElevation value.
  static const String keyMenuElevation = 'menuElevation';
  // Default value for the menuElevation, also reset settings.
  static const double? defaultMenuElevation = null;

  // Key used to read and save the menuOpacity value.
  static const String keyMenuOpacity = 'menuOpacity';
  // Default value for the menuOpacity, also reset settings.
  static const double? defaultMenuOpacity = null;

  // Key used to read and save the menuPaddingStart value.
  static const String keyMenuPaddingStart = 'menuPaddingStart';
  // Default value for the menuPaddingStart, also reset settings.
  static const double? defaultMenuPaddingStart = null;

  // Key used to read and save the menuPaddingEnd value.
  static const String keyMenuPaddingEnd = 'menuPaddingEnd';
  // Default value for the menuPaddingEnd, also reset settings.
  static const double? defaultMenuPaddingEnd = null;

  // Key used to read and save the menuPaddingTop value.
  static const String keyMenuPaddingTop = 'menuPaddingTop';
  // Default value for the menuPaddingTop, also reset settings.
  static const double? defaultMenuPaddingTop = null;

  // Key used to read and save the menuPaddingBottom value.
  static const String keyMenuPaddingBottom = 'menuPaddingBottom';
  // Default value for the menuPaddingBottom, also reset settings.
  static const double? defaultMenuPaddingBottom = null;

  // Key used to read and save the menuSchemeColor value.
  static const String keyMenuSchemeColor = 'menuSchemeColor';
  // Default value for the menuSchemeColor, also used to reset settings.
  static const SchemeColor? defaultMenuSchemeColor = null;

  // Key used to read and save the menuBarBackgroundSchemeColor value.
  static const String keyMenuBarBackgroundSchemeColor =
      'menuBarBackgroundSchemeColor';
  // Default value for the menuBarBackgroundSchemeColor,
  // also used to reset settings.
  static const SchemeColor? defaultMenuBarBackgroundSchemeColor = null;

  // Key used to read and save the menuBarRadius value.
  static const String keyMenuBarRadius = 'menuBarRadius';
  // Default value for the menuBarRadius, also reset settings.
  static const double? defaultMenuBarRadius = null;

  // Key used to read and save the menuBarElevation value.
  static const String keyMenuBarElevation = 'menuBarElevation';
  // Default value for the menuBarElevation, also reset settings.
  static const double? defaultMenuBarElevation = null;

  // Key used to read and save the menuBarShadowColor color value.
  static const String keyMenuBarShadowColor = 'menuBarShadowColor';
  // Default value for the menuBarShadowColor color, also to reset settings.
  // We use NULL as default, on nullable settings.
  static const Color? defaultMenuBarShadowColor = null;

  // Key used to read and save the menuItemBackgroundSchemeColor value.
  static const String keyMenuItemBackgroundSchemeColor =
      'menuItemBackgroundSchemeColor';
  // Default value for the menuItemBackgroundSchemeColor,
  // also used to reset settings.
  static const SchemeColor? defaultMenuItemBackgroundSchemeColor = null;

  // Key used to read and save the menuItemForegroundSchemeColor value.
  static const String keyMenuItemForegroundSchemeColor =
      'menuItemForegroundSchemeColor';
  // Default value for the menuItemForegroundSchemeColor,
  // also used to reset settings.
  static const SchemeColor? defaultMenuItemForegroundSchemeColor = null;

  // Key used to read and save the menuIndicatorBackgroundSchemeColor value.
  static const String keyMenuIndicatorBackgroundSchemeColor =
      'menuIndicatorBackgroundSchemeColor';
  // Default value for the menuIndicatorBackgroundSchemeColor,
  // also used to reset settings.
  static const SchemeColor? defaultMenuIndicatorBackgroundSchemeColor = null;

  // Key used to read and save the menuIndicatorForegroundSchemeColor value.
  static const String keyMenuIndicatorForegroundSchemeColor =
      'menuIndicatorForegroundSchemeColor';
  // Default value for the menuIndicatorForegroundSchemeColor,
  // also used to reset settings.
  static const SchemeColor? defaultMenuIndicatorForegroundSchemeColor = null;

  // Key used to read and save the menuIndicatorRadius value.
  static const String keyMenuIndicatorRadius = 'menuIndicatorRadius';
  // Default value for the menuIndicatorRadius, also reset settings.
  static const double? defaultMenuIndicatorRadius = null;

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

  // Key used to read and save the navigationBarElevation value.
  static const String keyNavBarElevation = 'navigationBarElevation';
  // Default value for the navigationBarElevation, also reset settings.
  static const double? defaultNavigationBarElevation = null;

  // Key used to read and save the navBarHeight value.
  static const String keyNavBarHeight = 'navBarHeight';
  // Default value for the navBarHeight, also reset settings.
  static const double? defaultNavBarHeight = null;

  // Key used to read and save the navBarSelectedIconSchemeColor icon value.
  static const String keyNavBarSelectedIconSchemeColor =
      'navBarSelectedItemSchemeColor';
  // Default value for the navBarSelectedIconSchemeColor.
  static const SchemeColor? defaultNavBarSelectedIconSchemeColor = null;

  // Key used to read and save the navBarSelectedLabelSchemeColor icon value.
  static const String keyNavBarSelectedLabelSchemeColor =
      'navBarSelectedLabelSchemeColor';
  // Default value for the navBarSelectedItemSchemeColor.
  static const SchemeColor? defaultNavBarSelectedLabelSchemeColor = null;

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

  // Key used to read and save the navBarIndicatorBorderRadius value.
  static const String keyNavBarIndicatorBorderRadius =
      'navBarIndicatorBorderRadius';
  // Default value for the navBarIndicatorBorderRadius, also to reset settings.
  static const double? defaultNavBarIndicatorBorderRadius = null;

  // Key used to read and save the navBarLabelBehavior value.
  static const String keyNavBarLabelBehavior = 'navBarLabelBehavior';
  // Default value for the navBarLabelBehavior, also used to
  // reset settings.
  static const NavigationDestinationLabelBehavior defaultNavBarLabelBehavior =
      NavigationDestinationLabelBehavior.alwaysShow;

  // Key used to read and save the adaptiveRemoveNavigationBarTintLight value.
  static const String keyAdaptiveRemoveNavigationBarTintLight =
      'adaptiveRemoveNavigationBarTintLight';
  // Default value for the adaptiveRemoveNavigationBarTintLight,
  // also to reset settings.
  // We use NULL as default, on nullable settings.
  static const AdaptiveTheme? defaultAdaptiveRemoveNavigationBarTintLight =
      null;

  // Key used to read and save the adaptiveRemoveNavigationBarTintDark value.
  static const String keyAdaptiveRemoveNavigationBarTintDark =
      'adaptiveRemoveNavigationBarTintDark';
  // Default value for the adaptiveRemoveNavigationBarTintDark,
  // also to reset settings.
  // We use NULL as default, on nullable settings.
  static const AdaptiveTheme? defaultAdaptiveRemoveNavigationBarTintDark = null;

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
  static const String keyNavRailElevation = 'navigationRailElevation';
  // Default value for the navigationRailElevation, also reset settings.
  static const double? defaultNavRailElevation = null;

  // Key used to read and save the navRailSelectedIconSchemeColor value.
  static const String keyNavRailSelectedIconSchemeColor =
      'navRailSelectedItemSchemeColor';
  // Default value for the navRailSelectedIconSchemeColor.
  static const SchemeColor? defaultNavRailSelectedIconSchemeColor = null;

  // Key used to read and save the navRailSelectedLabelSchemeColor value.
  static const String keyNavRailSelectedLabelSchemeColor =
      'navRailSelectedLabelSchemeColor';
  // Default value for the navRailSelectedLabelSchemeColor.
  static const SchemeColor? defaultNavRailSelectedLabelSchemeColor = null;

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

  // Key used to read and save the navRailIndicatorBorderRadius value.
  static const String keyNavRailIndicatorBorderRadius =
      'navRailIndicatorBorderRadius';
  // Default value for the navRailIndicatorBorderRadius, also to reset settings.
  static const double? defaultNavRailIndicatorBorderRadius = null;

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

  // Key used to read and save the filledButtonSchemeColor value.
  static const String keyFilledButtonSchemeColor = 'filledButtonSchemeColor';
  // Default value for the filledButtonSchemeColor, also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultFilledButtonSchemeColor = null;

  // Key used to read and save the filledButtonBorderRadius value.
  static const String keyFilledButtonBorderRadius = 'filledButtonBorderRadius';
  // Default value for the filledButtonBorderRadius, used to reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultFilledButtonBorderRadius = null;

  // Key used to read and save the elevatedButtonSchemeColor value.
  static const String keyElevatedButtonSchemeColor =
      'elevatedButtonSchemeColor';
  // Default value for the elevatedButtonSchemeColor, also used to
  // reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultElevatedButtonSchemeColor = null;

  // Key used to read and save the elevatedButtonSecondarySchemeColor value.
  static const String keyElevatedButtonSecondarySchemeColor =
      'elevatedButtonSecondarySchemeColor';
  // Default value for the elevatedButtonSecondarySchemeColor, also used to
  // reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultElevatedButtonSecondarySchemeColor = null;

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

  // Key used to read and save the outlinedButtonOutlineSchemeColor value.
  static const String keyOutlinedButtonOutlineSchemeColor =
      'outlinedButtonOutlineSchemeColor';
  // Default value for the outlinedButtonOutlineSchemeColor, also used to
  // reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultOutlinedButtonOutlineSchemeColor = null;

  // Key used to read and save the outlinedButtonBorderRadius value.
  static const String keyOutlinedButtonBorderRadius =
      'outlinedButtonBorderRadius';
  // Default value for the outlinedButtonBorderRadius, also used to
  // reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultOutlinedButtonBorderRadius = null;

  // Key used to read and save the outlinedButtonBorderWidth value.
  static const String keyOutlinedButtonBorderWidth =
      'outlinedButtonBorderWidth';
  // Default value for the outlinedButtonBorderWidth, also used to
  // reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultOutlinedButtonBorderWidth = null;

  // Key used to read and save the outlinedButtonPressedBorderWidth value.
  static const String keyOutlinedButtonPressedBorderWidth =
      'outlinedButtonPressedBorderWidth';
  // Default value for the outlinedButtonPressedBorderWidth, also used to
  // reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultOutlinedButtonPressedBorderWidth = null;

  // ToggleButtons SETTINGS.
  // ===========================================================================

  // Key used to read and save the toggleButtonsSchemeColor value.
  static const String keyToggleButtonsSchemeColor = 'toggleButtonsSchemeColor';
  // Default value for the toggleButtonsSchemeColor, also used to
  // reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultToggleButtonsSchemeColor = null;

  // Key used to read and save the toggleButtonsUnselectedSchemeColor value.
  static const String keyToggleButtonsUnselectedSchemeColor =
      'toggleButtonsUnselectedSchemeColor';
  // Default value for the toggleButtonsUnselectedSchemeColor, also used to
  // reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultToggleButtonsUnselectedSchemeColor = null;

  // Key used to read and save the toggleButtonsBorderSchemeColor value.
  static const String keyToggleButtonsBorderSchemeColor =
      'toggleButtonsBorderSchemeColor';
  // Default value for the toggleButtonsBorderSchemeColor, also used to
  // reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultToggleButtonsBorderSchemeColor = null;

  // Key used to read and save the toggleButtonsBorderRadius value.
  static const String keyToggleButtonsBorderRadius =
      'toggleButtonsBorderRadius';
  // Default value for the toggleButtonsBorderRadius, also used to
  // reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultToggleButtonsBorderRadius = null;

  // Key used to read and save the toggleButtonsBorderWidth value.
  static const String keyToggleButtonsBorderWidth = 'toggleButtonsBorderWidth';
  // Default value for the toggleButtonsBorderWidth, also used to
  // reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultToggleButtonsBorderWidth = null;

  // SegmentedButton SETTINGS.
  // ===========================================================================

  // Key used to read and save the segmentedButtonSchemeColor value.
  static const String keySegmentedButtonSchemeColor =
      'segmentedButtonSchemeColor';
  // Default value for the segmentedButtonSchemeColor, also used to
  // reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultSegmentedButtonSchemeColor = null;

  // Key used to read and save the segmentedButtonUnselectedSchemeColor value.
  static const String keySegmentedButtonUnselectedSchemeColor =
      'segmentedButtonUnselectedSchemeColor';
  // Default value for the segmentedButtonUnselectedSchemeColor, also used to
  // reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultSegmentedButtonUnselectedSchemeColor = null;

  // Key used to read and save the
  // segmentedButtonUnselectedForegroundSchemeColor value.
  static const String keySegmentedButtonUnselectedForegroundSchemeColor =
      'segmentedButtonUnselectedForegroundSchemeColor';
  // Default value for the segmentedButtonUnselectedForegroundSchemeColor,
  // also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor?
      defaultSegmentedButtonUnselectedForegroundSchemeColor = null;

  // Key used to read and save the segmentedButtonBorderSchemeColor value.
  static const String keySegmentedButtonBorderSchemeColor =
      'segmentedButtonBorderSchemeColor';
  // Default value for the segmentedButtonBorderSchemeColor, also used to
  // reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultSegmentedButtonBorderSchemeColor = null;

  // Key used to read and save the segmentedButtonBorderRadius value.
  static const String keySegmentedButtonBorderRadius =
      'segmentedButtonBorderRadius';
  // Default value for the segmentedButtonBorderRadius, also used to
  // reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultSegmentedButtonBorderRadius = null;

  // Key used to read and save the segmentedButtonBorderWidth value.
  static const String keySegmentedButtonBorderWidth =
      'segmentedButtonBorderWidth';
  // Default value for the segmentedButtonBorderWidth, also used to
  // reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultSegmentedButtonBorderWidth = null;

  // Switch, CheckBox and Radio SETTINGS.
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

  // Key used to read and save the switchThumbSchemeColor value.
  static const String keySwitchThumbSchemeColor = 'switchThumbSchemeColor';
  // Default value for the switchThumbSchemeColor, also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultSwitchThumbSchemeColor = null;

  // Key used to read and save the switchThumbFixedSize value.
  static const String keySwitchThumbFixedSize = 'switchThumbFixedSize';
  // Default value for the switchThumbFixedSize, also used to reset settings.
  static const bool defaultSwitchThumbFixedSize = false;

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

  // Slider SETTINGS.
  // ===========================================================================

  // Key used to read and save the sliderBaseSchemeColor value.
  static const String keySliderBaseSchemeColor = 'sliderBaseSchemeColor';
  // Default value for the sliderBaseSchemeColor, also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultSliderBaseSchemeColor = null;

  // Key used to read and save the sliderIndicatorSchemeColor value.
  static const String keySliderIndicatorSchemeColor =
      'sliderIndicatorSchemeColor';
  // Default value for the sliderIndicatorSchemeColor, used to reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultSliderIndicatorSchemeColor = null;

  // Key used to read and save the sliderValueTinted value.
  static const String keySliderValueTinted = 'sliderValueTinted';
  // Default value for the sliderValueTinted, also to reset settings.
  static const bool defaultSliderValueTinted = false;

  // Key used to read and save the sliderValueIndicatorType value.
  static const String keySliderValueIndicatorType = 'sliderValueIndicatorType';
  // Default value for the sliderValueIndicatorType, used to reset settings.
  // We use NULL as default, on nullable settings.
  static const FlexSliderIndicatorType? defaultSliderValueIndicatorType = null;

  // Key used to read and save the sliderShowValueIndicator value.
  static const String keySliderShowValueIndicator = 'sliderShowValueIndicator';
  // Default value for the sliderShowValueIndicator, used to reset settings.
  // We use NULL as default, on nullable settings.
  static const ShowValueIndicator? defaultSliderShowValueIndicator = null;

  // Key used to read and save the sliderTrackHeight value.
  static const String keySliderTrackHeight = 'sliderTrackHeight';
  // Default value for the sliderTrackHeight, also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultSliderTrackHeight = null;

  // Fab, Chip SnackBar, Popup, Dropdown, Card and Dialog SETTINGS.
  // ===========================================================================

  // Key used to read and save the fabUseShape value.
  static const String keyFabUseShape = 'fabUseShape';
  // Default value for the fabUseShape, also to reset settings.
  static const bool defaultFabUseShape = false;

  // Key used to read and save the fabUseShape value.
  static const String keyFabAlwaysCircular = 'fabAlwaysCircular';
  // Default value for the fabUseShape, also to reset settings.
  static const bool defaultFabAlwaysCircular = false;

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

  // Key used to read and save the chipSelectedSchemeColor value.
  static const String keyChipSelectedSchemeColor = 'chipSelectedSchemeColor';
  // Default value for the chipSelectedSchemeColor, also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultChipSelectedSchemeColor = null;

  // Key used to read and save the chipDeleteIconSchemeColor value.
  static const String keyChipDeleteIconSchemeColor =
      'chipDeleteIconSchemeColor';
  // Default value for the chipDeleteIconSchemeColor, also to reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultChipDeleteIconSchemeColor = null;

  // Key used to read and save the chipBorderRadius value.
  static const String keyChipBorderRadius = 'chipBorderRadius';
  // Default value for the chipBorderRadius, also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultChipBorderRadius = null;

  // Key used to read and save the snackBarBorderRadius value.
  static const String keySnackBarBorderRadius = 'snackBarBorderRadius';
  // Default value for the snackBarBorderRadius, also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultSnackBarBorderRadius = null;

  // Key used to read and save the snackBarElevation value.
  static const String keySnackBarElevation = 'snackBarElevation';
  // Default value for the snackBarElevation, also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultSnackBarElevation = null;

  // Key used to read and save the snackBarSchemeColor value.
  static const String keySnackBarSchemeColor = 'snackBarSchemeColor';
  // Default value for the snackBarSchemeColor, also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultSnackBarSchemeColor = null;

  // Key used to read and save the snackBarActionSchemeColor value.
  static const String keySnackBarActionSchemeColor =
      'snackBarBackgroundSchemeColor';
  // Default value for the snackBarActionSchemeColor, also to reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultSnackBarActionSchemeColor = null;

  // Key used to read and save the popupMenuSchemeColor value.
  static const String keyPopupMenuSchemeColor = 'popupMenuSchemeColor';
  // Default value for the popupMenuSchemeColor, also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultPopupMenuSchemeColor = null;

  // Key used to read and save the popupMenuOpacity value.
  static const String keyPopupMenuOpacity = 'popupMenuOpacity';
  // Default value for the popupMenuOpacity, also used to reset settings.
  static const double defaultPopupMenuOpacity = 1;

  // Key used to read and save the popupMenuBorderRadius value.
  static const String keyPopupMenuBorderRadius = 'popupMenuBorderRadius';
  // Default value for the popupMenuBorderRadius, also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultPopupMenuBorderRadius = null;

  // Key used to read and save the popupMenuElevation value.
  static const String keyPopupMenuElevation = 'popupMenuElevation';
  // Default value for the popupMenuElevation, also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultPopupMenuElevation = null;

  // Key used to read and save the alignedDropdown value.
  static const String keyAlignedDropdown = 'alignedDropdown';
  // Default value for the alignedDropdown, also to reset settings.
  static const bool defaultAlignedDropdown = true;

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

  // Key used to read and save the datePickerHeaderBackgroundSchemeColor value.
  static const String keyDatePickerHeaderBackgroundSchemeColor =
      'datePickerHeaderBackgroundSchemeColor';
  // Default value for the datePickerHeaderBackgroundSchemeColor, also used to
  // reset settings.
  static const SchemeColor? defaultDatePickerHeaderBackgroundSchemeColor = null;

  // Key used to read and save the useInputDecoratorThemeInDialogs value.
  static const String keyUseInputDecoratorThemeInDialogs =
      'useInputDecoratorThemeInDialogs';
  // Default value for the useInputDecoratorThemeInDialogs, also
  // used to reset settings.
  static const bool defaultUseInputDecoratorThemeInDialogs = true;

  // Key used to read and save the adaptiveDialogRadius value.
  static const String keyAdaptiveDialogRadius = 'adaptiveDialogRadius';
  // Default value for the adaptiveDialogRadius, also to reset settings.
  // We use NULL as default, on nullable settings.
  static const AdaptiveTheme? defaultAdaptiveDialogRadius = null;

  // Key used to read and save the dialogBorderRadius value.
  static const String keyDialogBorderRadius = 'dialogBorderRadius';
  // Default value for the dialogBorderRadius, also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultDialogBorderRadius = null;

  // Key used to read and save the dialogBorderRadiusAdaptive value.
  static const String keyDialogBorderRadiusAdaptive =
      'dialogBorderRadiusAdaptive';
  // Default value for the dialogBorderRadiusAdaptive, also to reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultDialogBorderRadiusAdaptive = null;

  // Key used to read and save the timePickerDialogBorderRadius value.
  static const String keyTimePickerDialogBorderRadius =
      'timePickerDialogBorderRadius';
  // Default value for the timePickerDialogBorderRadius, also to reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultTimePickerDialogBorderRadius = null;

  // Key used to read and save the datePickerDialogBorderRadius value.
  static const String keyDatePickerDialogBorderRadius =
      'datePickerDialogBorderRadius';
  // Default value for the datePickerDialogBorderRadius, also to reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultDatePickerDialogBorderRadius = null;

  // Key used to read and save the timePickerElementRadius value.
  static const String keyTimePickerElementRadius = 'timePickerElementRadius';
  // Default value for the timePickerElementRadius, also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultTimePickerElementRadius = null;

  // Key used to read and save the dialogElevation value.
  static const String keyDialogElevation = 'dialogElevation';
  // Default value for the dialogElevation, also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultDialogElevation = null;

  // Tooltip SETTINGS.
  // ===========================================================================

  // Key used to read and save the tooltipRadius value.
  static const String keyTooltipRadius = 'tooltipRadius';
  // Default value for the tooltipRadius, also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultTooltipRadius = null;

  // Key used to read and save the tooltipWaitDuration value.
  static const String keyTooltipWaitDuration = 'tooltipWaitDuration';
  // Default value for the tooltipWaitDuration, also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const int? defaultTooltipWaitDuration = null;

  // Key used to read and save the tooltipShowDuration value.
  static const String keyTooltipShowDuration = 'tooltipShowDuration';
  // Default value for the tooltipShowDuration, also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const int? defaultTooltipShowDuration = null;

  // Key used to read and save the tooltipSchemeColor value.
  static const String keyTooltipSchemeColor = 'tooltipSchemeColor';
  // Default value for the tooltipSchemeColor, also used to
  // reset settings.
  static const SchemeColor? defaultTooltipSchemeColor = null;

  // Key used to read and save the tooltipOpacity value.
  static const String keyTooltipOpacity = 'tooltipOpacity';
  // Default value for the tooltipOpacity, also used to reset settings.
  static const double defaultTooltipOpacity = 1.0;

  // Custom surface tint color SETTINGS.
  // ===========================================================================

  // Key used to read and save the surfaceTintLight color value.
  static const String keySurfaceTintLight = 'surfaceTintLight';
  // Default value for the surfaceTintLight color, also to reset settings.
  // We use NULL as default, on nullable settings.
  static const Color? defaultSurfaceTintLight = null;

  // Key used to read and save the surfaceTintLightSchemeColor value.
  static const String keySurfaceTintLightSchemeColor =
      'surfaceTintLightSchemeColor';
  // Default value for the surfaceTintLightSchemeColor, also used to
  // reset settings. We use NULL as default, on nullable settings.
  static const SchemeColor? defaultSurfaceTintLightSchemeColor = null;

  // Key used to read and save the surfaceTintDark color value.
  static const String keySurfaceTintDark = 'surfaceTintDark';
  // Default value for the surfaceTintDark color, also to reset settings.
  // We use NULL as default, on nullable settings.
  static const Color? defaultSurfaceTintDark = null;

  // Key used to read and save the surfaceTintDarkSchemeColor value.
  static const String keySurfaceTintDarkSchemeColor =
      'surfaceTintDarkSchemeColor';
  // Default value for the surfaceTintDarkSchemeColor, also used to
  // reset settings. We use NULL as default, on nullable settings.
  static const SchemeColor? defaultSurfaceTintDarkSchemeColor = null;

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
}
