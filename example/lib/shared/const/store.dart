import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../model/adaptive_response.dart';
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
sealed class Store {
  // GENERAL SETTINGS.
  // ThemeMode, use FlexColorScheme and sub-themes, current scheme, view, etc.
  // ===========================================================================

  // Key used to read and save the themeMode value.
  static const String keyThemeMode = 'themeMode';
  // Default value for the themeMode, also used to reset settings.
  static const ThemeMode defaultThemeMode = ThemeMode.system;

  // Key used to read and save the used VisualDensity value.
  static const String keyVisualDensity = 'visualDensity';
  // Default value for the used VisualDensity, also to reset settings.
  static const VisualDensityEnum defaultVisualDensity =
      VisualDensityEnum.comfortablePlatform;

  // Key used to read and save the TapTargetSize value.
  static const String keyTapTargetSize = 'tapTargetSize';
  // Default value for the TapTargetSize, also to reset settings.
  static const MaterialTapTargetSize? defaultTapTargetSize = null;

  // Key used to read and save the useFlexColorScheme value.
  static const String keyUseFlexColorScheme = 'useFlexColorScheme';
  // Default value for the useFlexColorScheme, also to reset settings.
  static const bool defaultUseFlexColorScheme = true;

  // Key used to read and save the useSubThemes value.
  static const String keyUseSubThemes = 'useSubThemes';
  // Default value for the useSubThemes, also used to reset settings.
  static const bool defaultUseSubThemes = true;

  // Key used to read and save the generateCodeForOwnFile value.
  static const String keyGenerateCodeForOwnFile = 'generateCodeForOwnFile';
  // Default value for the generateCodeForOwnFile, also used to reset settings.
  static const bool defaultGenerateCodeForFile = true;

  // Key used to read and save the applyThemeToAllCupertino value.
  //
  // This setting is used to by the Playground to define:
  //
  // `cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true)`
  //
  // It makes the theme apply to all Cupertino widgets, including the
  // `CupertinoSwitch`.
  static const String keyApplyThemeToAllCupertino = 'applyThemeToAllCupertino';
  // Default value for the applyThemeToAllCupertino, also to reset settings.
  static const bool defaultApplyThemeToAllCupertino = true;

  // Key used to read and save the adaptiveRemoveElevationTintLight value.
  static const String keyAdaptiveRemoveElevationTintLight =
      'adaptiveRemoveElevationTintLight';
  // Default value for the adaptiveRemoveElevationTintLight,
  // also to reset settings.
  // We use NULL as default, on nullable settings.
  static const AdaptiveResponse? defaultAdaptiveRemoveElevationTintLight = null;

  // Key used to read and save the adaptiveElevationShadowsBackLight value.
  static const String keyAdaptiveElevationShadowsBackLight =
      'adaptiveElevationShadowsBackLight';
  // Default value for the adaptiveElevationShadowsBackLight,
  // also to reset settings.
  // We use NULL as default, on nullable settings.
  static const AdaptiveResponse? defaultAdaptiveElevationShadowsBackLight =
      null;

  // Key used to read and save the adaptiveAppBarScrollUnderOffLight value.
  static const String keyAdaptiveAppBarScrollUnderOffLight =
      'adaptiveAppBarScrollUnderOffLight';
  // Default value for the adaptiveAppBarScrollUnderOffLight,
  // also to reset settings.
  // We use NULL as default, on nullable settings.
  static const AdaptiveResponse? defaultAdaptiveAppBarScrollUnderOffLight =
      null;

  // Key used to read and save the adaptiveRemoveElevationTintDark value.
  static const String keyAdaptiveRemoveElevationTintDark =
      'adaptiveRemoveElevationTintDark';
  // Default value for the adaptiveRemoveElevationTintDark,
  // also to reset settings.
  // We use NULL as default, on nullable settings.
  static const AdaptiveResponse? defaultAdaptiveRemoveElevationTintDark = null;

  // Key used to read and save the adaptiveElevationShadowsBackDark value.
  static const String keyAdaptiveElevationShadowsBackDark =
      'adaptiveElevationShadowsBackDark';
  // Default value for the adaptiveElevationShadowsBackDark,
  // also to reset settings.
  // We use NULL as default, on nullable settings.
  static const AdaptiveResponse? defaultAdaptiveElevationShadowsBackDark = null;

  // Key used to read and save the adaptiveAppBarScrollUnderOffDark value.
  static const String keyAdaptiveAppBarScrollUnderOffDark =
      'adaptiveAppBarScrollUnderOffDark';
  // Default value for the adaptiveAppBarScrollUnderOffDark,
  // also to reset settings.
  // We use NULL as default, on nullable settings.
  static const AdaptiveResponse? defaultAdaptiveAppBarScrollUnderOffDark = null;

  // Key used to read and save the adaptiveRadius value.
  static const String keyAdaptiveRadius = 'adaptiveRadius';
  // Default value for the adaptiveRadius, also to reset settings.
  // We use NULL as default, on nullable settings.
  static const AdaptiveResponse? defaultAdaptiveRadius = null;

  // Key used to read and save the adaptiveSplashType value.
  static const String keyAdaptiveSplash = 'adaptiveSplash';
  // Default value for the adaptiveSplashType, also to reset settings.
  // We use NULL as default, on nullable settings.
  static const AdaptiveResponse? defaultAdaptiveSplash = null;

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

  // Key used to read and save the topicIndexStartSide value.
  static const String keyTopicIndexStartSide = 'topicIndexStartSide';
  // Default value for the topicIndexStartSide.
  static const int defaultTopicIndexStartSide = 0;

  // Key used to read and save the topicIndexEndSide value.
  static const String keyTopicIndexEndSide = 'topicIndexEndSide';
  // Default value for the topicIndexEndSide.
  static const int defaultTopicIndexEndSide = 2;

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

  // Key used to read and save the simulatorViewZoom value.
  static const String keySimulatorViewZoom = 'simulatorViewZoom';
  // Default value for the simulatorViewZoom, also used to reset settings.
  static const double defaultSimulatorViewZoom = 1000;

  // Key used to read and save the showSchemeInputColors value.
  static const String keyShowSchemeInputColors = 'showSchemeInputColors';
  // Default value for the showSchemeInputColors, also used to reset settings.
  static const bool defaultShowSchemeInputColors = false;

  // Key used to read and save the useMaterial3Typography value.
  static const String keyUseMaterial3Typography = 'useMaterial3Typography';
  // Default value for the useMaterial3Typography, also used to reset settings.
  //
  // The controller uses a nullable bool with different defaults in
  // M2 and M3 mode if it is set to null. The API uses null as default for this
  // property and it can be set to null, false or true in Playground.
  //
  // As of version 8 Playground now also defaults to null and makes M2 and
  // M3 mode use their respective mode typography by default. If you still make
  // an M2 app, prefer using M3 typography and set it true, like the
  // Playground did before, since it is much nicer than M2 Typography.
  static const bool? defaultUseMaterial3Typography = null;

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
  // Defaults 40, in examples 4 & 5 where this is used it will make
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

  // Key used to read and save the scaffoldBackgroundLightBaseColor value.
  static const String keyScaffoldBackgroundLightBaseColor =
      'scaffoldBackgroundLightBaseColor';
  // Default value for the scaffoldBackgroundLightBaseColor, also used to
  // reset settings.
  static const FlexScaffoldBaseColor? defaultScaffoldBackgroundLightBaseColor =
      null;

  // Key used to read and save the scaffoldBackgroundDarkBaseColor value.
  static const String keyScaffoldBackgroundDarkBaseColor =
      'scaffoldBackgroundDarkBaseColor';
  // Default value for the scaffoldBackgroundDarkBaseColor, also used to
  // reset settings.
  static const FlexScaffoldBaseColor? defaultScaffoldBackgroundDarkBaseColor =
      null;

  // Key used to read and save the scaffoldBackgroundLightSchemeColor value.
  static const String keyScaffoldBackgroundLightSchemeColor =
      'scaffoldBackgroundLightSchemeColor';
  // Default value for the scaffoldBackgroundLightSchemeColor, also used to
  // reset settings.
  static const SchemeColor? defaultScaffoldBackgroundLightSchemeColor = null;

  // Key used to read and save the scaffoldBackgroundDarkSchemeColor value.
  static const String keyScaffoldBackgroundDarkSchemeColor =
      'scaffoldBackgroundDarkSchemeColor';
  // Default value for the scaffoldBackgroundDarkSchemeColor, also used to
  // reset settings.
  static const SchemeColor? defaultScaffoldBackgroundDarkSchemeColor = null;

  // Key used to read and save the surfaceModeLight value.
  static const String keySurfaceModeLight = 'surfaceModeLight';
  // Default value for the surfaceModeLight, also used to reset settings.
  static const FlexSurfaceMode defaultSurfaceModeLight = FlexSurfaceMode.level;

  // Key used to read and save the surfaceModeDark value.
  static const String keySurfaceModeDark = 'surfaceModeDark';
  // Default value for the surfaceModeDark, also used to reset settings.
  static const FlexSurfaceMode defaultSurfaceModeDark = FlexSurfaceMode.level;

  // Key used to read and save the blendLevelLight value.
  static const String keyBlendLevelLight = 'blendLevelLight';
  // Default value for the blendLevelLight, also used to reset settings.
  // Defaults to 0.
  static const int defaultBlendLevelLight = 0;

  // Key used to read and save the blendLevelDark value.
  static const String keyBlendLevelDark = 'blendLevelDark';
  // Default value for the blendLevelDark, also used to reset settings.
  // Defaults to 0.
  static const int defaultBlendLevelDark = 0;

  // Key used to read and save the onBlendLevelLight value.
  static const String keyBlendOnLevelLight = 'blendOnLevelLight';
  // Default value for the onBlendLevelLight, also used to reset settings.
  // Defaults to 10.
  static const int defaultBlendOnLevelLight = 0;

  // Key used to read and save the blendOnLevelDark value.
  static const String keyBlendOnLevelDark = 'blendOnLevelDark';
  // Default value for the blendOnLevelDark, also used to reset settings.
  // Defaults to 20.
  static const int defaultBlendOnLevelDark = 0;

  // Key used to read and save the usedColors value.
  static const String keyUsedColors = 'usedColors';
  // Default value for the usedColorsLevel, also used to reset settings.
  // Defaults to 6.
  static const int defaultUsedColors = 6;

  // Key used to swap legacy M2 secondary and tertiary colors in M3 mode.
  static const String keySwapLegacyColorsInM3 = 'swapLegacyColorsInM3';
  // Default value for the swapLegacyColorsInM3, also to reset settings.
  static const bool defaultSwapLegacyColorsInM3 = false;

  // Key used to read and save the swapPrimaryAndSecondaryLightColors value.
  static const String keySwapPrimaryAndSecondaryLightColors =
      'swapPrimaryAndSecondaryLightColors';
  // Default value for the swapPrimaryAndSecondaryLightColors,
  // also to reset settings.
  static const bool defaultSwapPrimaryAndSecondaryLightColors = false;

  // Key used to read and save the swapPrimaryAndSecondaryDarkColors value.
  static const String keySwapPrimaryAndSecondaryDarkColors =
      'swapPrimaryAndSecondaryDarkColors';
  // Default value for the swapPrimaryAndSecondaryDarkColors,
  // also to reset settings.
  static const bool defaultSwapPrimaryAndSecondaryDarkColors = false;

  // Key used to read and save the scaffoldLightIsWhite value.
  static const String keyScaffoldLightIsWhite = 'scaffoldLightIsWhite';
  // Default value for the scaffoldLightIsWhite, also to reset settings.
  static const bool defaultLightIsWhite = false;

  // Key used to read and save the scaffoldDarkIsTrueBlack value.
  static const String keyScaffoldDarkIsTrueBlack = 'scaffoldDarkIsTrueBlack';
  // Default value for the scaffoldDarkIsTrueBlack, also to reset settings.
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

  // Key used to read and save the toDarkMethodLevel value.
  static const String keyToDarkMethodLevel = 'toDarkMethodLevel';
  // Default value for the toDarkMethodLevel, also used to reset settings.
  // Defaults to 10.
  static const int defaultToDarkMethodLevel = 10;

  // Key used to read and save the blendLightOnColors value.
  static const String keyBlendLightOnColors = 'blendLightOnColors';
  // Default value for the blendLightOnColors, also to reset settings.
  static const bool defaultBlendLightOnColors = false;

  // Key used to read and save the blendDarkOnColors value.
  static const String keyBlendDarkOnColors = 'blendDarkOnColors';
  // Default value for the blendDarkOnColors, also to reset settings.
  static const bool defaultBlendDarkOnColors = true;

  // TODO(rydmike): Commented as part of blendTextTheme deprecation.
  // // Key used to read and save the blendLightTextTheme value.
  // static const String keyBlendLightTextTheme = 'blendLightTextTheme';
  // // Default value for the blendLightTextTheme, also to reset settings.
  // static const bool defaultBlendLightTextTheme = false;
  //
  // // Key used to read and save the blendDarkTextTheme value.
  // static const String keyBlendDarkTextTheme = 'blendDarkTextTheme';
  // // Default value for the blendDarkTextTheme, also to reset settings.
  // static const bool defaultBlendDarkTextTheme = false;

  // Material 3 and Seed ColorScheme SETTINGS.
  // ===========================================================================

  // Key used to read and save the useMaterial3 value.
  static const String keyUseMaterial3 = 'useMaterial3';
  // Default value for the useMaterial3, also to reset settings.
  static const bool defaultUseMaterial3 = true;

  // Key used to read and save the fixedColorStyle value.
  static const String keyFixedColorStyle = 'fixedColorStyle';
  // Default value for the fixedColorStyle, also to reset settings.
  static const FlexFixedColorStyle? defaultFixedColorStyle = null;

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

  // Key used to read and save the useError value.
  static const String keyUseError = 'useError';
  // Default value for the useError, also to reset settings.
  static const bool defaultUseError = false;

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

  // Key used to read and save the keepError value.
  static const String keyKeepError = 'keepError';
  // Default value for the keepError, also to reset settings.
  static const bool defaultKeepError = false;

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

  // Key used to read and save the keepErrorContainer value.
  static const String keyKeepErrorContainer = 'keepErrorContainer';
  // Default value for the keepErrorContainer, also to reset settings.
  static const bool defaultKeepErrorContainer = false;

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

  // Key used to read and save the keepDarkError value.
  static const String keyKeepDarkError = 'keepDarkError';
  // Default value for the keepDarkError, also to reset settings.
  static const bool defaultKeepDarkError = false;

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

  // Key used to read and save the keepDarkErrorContainer value.
  static const String keyKeepDarkErrorContainer = 'keepDarkErrorContainer';
  // Default value for the keepDarkErrorContainer, also to reset settings.
  static const bool defaultKeepDarkErrorContainer = false;

  // Key used to read and save the usedFlexToneSetup value.
  // It is used to select different pre-made FlexTones configurations used
  // to configure how the seeded [ColorScheme]s behave.
  static const String keyUsedFlexToneSetup = 'usedFlexToneSetup';
  // Default value for the usedFlexToneSetupLevel, also used to reset
  // settings.
  // Defaults to 0 - Flutter SDK default configuration
  static const int defaultUsedFlexToneSetup = 0;

  // Key used to read and save the useM3ErrorColor value.
  static const String keyUseM3ErrorColors = 'useM3ErrorColors';
  // Default value for the useM3ErrorColor, also to reset settings.
  static const bool defaultUseM3ErrorColors = false;

  // Key used to read and save the useMonoSurfacesLight value.
  static const String keyUseMonoSurfacesLight = 'useMonoSurfacesLight';
  // Default value for the useMonoSurfacesLight, also to reset settings.
  static const bool defaultUseMonoSurfacesLight = false;

  // Key used to read and save the useMonoSurfacesDark value.
  static const String keyUseMonoSurfacesDark = 'useMonoSurfacesDark';
  // Default value for the useMonoSurfacesDark, also to reset settings.
  static const bool defaultUseMonoSurfacesDark = false;

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

  // Key used to read and save the higherContrastFixed value.
  static const String keyHigherContrastFixed = 'higherContrastFixed';
  // Default value for the higherContrastFixed, also to reset settings.
  static const bool defaultHigherContrastFixed = false;

  // Key used to read and save the expressiveOnContainer value.
  static const String keyExpressiveOnContainer = 'expressiveOnContainer';
  // Default value for the expressiveOnContainer, also to reset settings.
  static const bool defaultExpressiveOnContainer = false;

  // Key used to read and save the useLegacyMonochromeSeedBehavior value.
  static const String keyUseLegacyMonochromeSeedBehavior =
      'useLegacyMonochromeSeedBehavior';
  // Default value for useLegacyMonochromeSeedBehavior, also to reset settings.
  static const bool defaultUseLegacyMonochromeSeedBehavior = false;

  // Key used to read and save the dynamicContrastLevel value.
  static const String keyDynamicContrastLevel = 'dynamicContrastLevel';
  // Default value for the expressiveOnContainer, also to reset settings.
  static const double defaultDynamicContrastLevel = 0;

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

  // Key used to read and save the inputDecoratorIsDense value.
  static const String keyInputDecoratorIsDense = 'inputDecoratorIsDense';
  // Default value for the inputDecoratorIsDense, also used to reset settings.
  static const bool defaultInputDecoratorIsDense = false;

  // Key used to read and save the inputDecoratorPaddingStart value.
  static const String keyInputDecoratorPaddingStart =
      'inputDecoratorPaddingStart';
  // Default value for the inputDecoratorPaddingStart, also reset settings.
  static const double? defaultInputDecoratorPaddingStart = null;

  // Key used to read and save the inputDecoratorPaddingEnd value.
  static const String keyInputDecoratorPaddingEnd = 'inputDecoratorPaddingEnd';
  // Default value for the inputDecoratorPaddingEnd, also reset settings.
  static const double? defaultInputDecoratorPaddingEnd = null;

  // Key used to read and save the inputDecoratorPaddingTop value.
  static const String keyInputDecoratorPaddingTop = 'inputDecoratorPaddingTop';
  // Default value for the inputDecoratorPaddingTop, also reset settings.
  static const double? defaultInputDecoratorPaddingTop = null;

  // Key used to read and save the inputDecoratorPaddingBottom value.
  static const String keyInputDecoratorPaddingBottom =
      'inputDecoratorPaddingBottom';
  // Default value for the inputDecoratorPaddingBottom, also reset settings.
  static const double? defaultInputDecoratorPaddingBottom = null;

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

  // Key used to read and save the inputDecoratorBorderRadiusAdaptive value.
  static const String keyInputDecoratorBorderRadiusAdaptive =
      'inputDecoratorBorderRadiusAdaptive';
  // Default value for the inputDecoratorBorderRadiusAdaptive,
  // also to reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultInputDecoratorBorderRadiusAdaptive = null;

  // Key used to read and save the adaptiveResponseInputDecoratorRadius value.
  static const String keyAdaptiveResponseInputDecoratorRadius =
      'adaptiveResponseInputDecoratorRadius';
  // Default value for the adaptiveResponseInputDecoratorRadius, also to
  // reset settings.
  // We use NULL as default, on nullable settings.
  static const AdaptiveResponse? defaultAdaptiveResponseInputDecoratorRadius =
      null;

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
  static const bool defaultInputDecoratorUnfocusedBorderIsColored = false;

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

  // Key used to read and save the inputDecoratorPrefixIconLightSchemeColor
  // value.
  static const String keyInputDecoratorPrefixIconLightSchemeColor =
      'inputDecoratorPrefixIconSchemeColor';
  // Default value for the inputDecoratorPrefixIconLightSchemeColor,
  // reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultInputDecoratorPrefixIconLightSchemeColor =
      null;

  // Key used to read and save the inputDecoratorSuffixIconSchemeColor value.
  static const String keyInputDecoratorSuffixIconLightSchemeColor =
      'inputDecoratorSuffixIconSchemeColor';
  // Default value for the inputDecoratorSuffixIconSchemeColor, reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultInputDecoratorSuffixIconLightSchemeColor =
      null;

  // Key used to read and save inputDecoratorPrefixIconDarkSchemeColor value.
  static const String keyInputDecoratorPrefixIconDarkSchemeColor =
      'inputDecoratorPrefixIconDarkSchemeColor';
  // Default for the inputDecoratorPrefixIconDarkSchemeColor, reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultInputDecoratorPrefixIconDarkSchemeColor =
      null;

  // Key used to read and save inputDecoratorSuffixIconDarkSchemeColor value.
  static const String keyInputDecoratorSuffixIconDarkSchemeColor =
      'inputDecoratorSuffixIconDarkSchemeColor';
  // Default for the inputDecoratorSuffixIconDarkSchemeColor, reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultInputDecoratorSuffixIconDarkSchemeColor =
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

  // ListTile SETTINGS.
  // ===========================================================================

  // Key used to read and save the listTileSelectedSchemeColor value.
  static const String keyListTileSelectedSchemeColor =
      'listTileSelectedSchemeColor';
  // Default value for the listTileSelectedSchemeColor, also reset settings.
  static const SchemeColor? defaultListTileSelectedSchemeColor = null;

  // Key used to read and save the listTileIconSchemeColor value.
  static const String keyListTileIconSchemeColor = 'listTileIconSchemeColor';
  // Default value for the listTileIconSchemeColor, also reset settings.
  static const SchemeColor? defaultListTileIconSchemeColor = null;

  // Key used to read and save the listTileTextSchemeColor value.
  static const String keyListTileTextSchemeColor = 'listTileTextSchemeColor';
  // Default value for the listTileTextSchemeColor, also reset settings.
  static const SchemeColor? defaultListTileTextSchemeColor = null;

  // Key used to read and save the listTileTileSchemeColor value.
  static const String keyListTileTileSchemeColor = 'listTileTileSchemeColor';
  // Default value for the listTileTileSchemeColor, also reset settings.
  static const SchemeColor? defaultListTileTileSchemeColor = null;

  // Key used to read and save the listTileSelectedTileSchemeColor value.
  static const String keyListTileSelectedTileSchemeColor =
      'listTileSelectedTileSchemeColor';
  // Default value for the listTileSelectedTileSchemeColor, also reset settings.
  static const SchemeColor? defaultListTileSelectedTileSchemeColor = null;

  // Key used to read and save the listTilePaddingStart value.
  static const String keyListTilePaddingStart = 'listTilePaddingStart';
  // Default value for the listTilePaddingStart, also reset settings.
  static const double? defaultListTilePaddingStart = null;

  // Key used to read and save the listTilePaddingEnd value.
  static const String keyListTilePaddingEnd = 'listTilePaddingEnd';
  // Default value for the listTilePaddingEnd, also reset settings.
  static const double? defaultListTilePaddingEnd = null;

  // Key used to read and save the listTilePaddingTop value.
  static const String keyListTilePaddingTop = 'listTilePaddingTop';
  // Default value for the listTilePaddingTop, also reset settings.
  static const double? defaultListTilePaddingTop = null;

  // Key used to read and save the listTilePaddingBottom value.
  static const String keyListTilePaddingBottom = 'listTilePaddingBottom';
  // Default value for the listTilePaddingBottom, also reset settings.
  static const double? defaultListTilePaddingBottom = null;

  // Key used to read and save the listTileHorizontalTitleGap value.
  static const String keyListTileHorizontalTitleGap =
      'listTileHorizontalTitleGap';
  // Default value for the listTileHorizontalTitleGap, also to reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultListTileHorizontalTitleGap = null;

  // Key used to read and save the listTileMinVerticalPadding, value.
  static const String keyListTileMinVerticalPadding =
      'listTileMinVerticalPadding';
  // Default value for the listTileMinVerticalPadding, also to reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultListTileMinVerticalPadding = null;

  // Key used to read and save the listTileStyle value.
  static const String keyListTileStyle = 'listTileStyle';
  // Default value for the listTileStyle, also to reset settings.
  // We use NULL as default, this nullable setting.
  static const ListTileStyle? defaultListTileStyle = null;

  // Key used to read and save the listTileTitleAlignment value.
  static const String keyListTileTitleAlignment = 'listTileTitleAlignment';
  // Default value for the listTileTitleAlignment, also to reset settings.
  // We use NULL as default, this nullable setting.
  static const ListTileTitleAlignment? defaultListTileTitleAlignment = null;

  // Key used to read and save the listTileControlAffinity value.
  static const String keyListTileControlAffinity = 'listTileControlAffinity';
  // Default value for the listTileControlAffinity, also to reset settings.
  // We use NULL as default, this nullable setting.
  static const ListTileControlAffinity? defaultListTileControlAffinity = null;

  // AppBar SETTINGS.
  // ===========================================================================

  // Key used to read and save the appBarStyleLight value.
  static const String keyAppBarStyleLight = 'appBarStyleLight';
  // Default value for the appBarStyleLight, also used to reset settings.
  static const FlexAppBarStyle? defaultAppBarStyleLight = null;
  // FlexAppBarStyle.primary;

  // Key used to read and save the appBarStyleDark value.
  static const String keyAppBarStyleDark = 'appBarStyleDark';
  // Default value for the appBarStyleDark, also used to reset settings.
  static const FlexAppBarStyle? defaultAppBarStyleDark = null;
  // FlexAppBarStyle.background;

  // Key used to read and save the appBarOpacityLight value.
  static const String keyAppBarOpacityLight = 'appBarOpacityLight';
  // Default value for the appBarOpacityLight, also used to reset settings.
  static const double? defaultAppBarOpacityLight = null;

  // Key used to read and save the appBarOpacityDark value.
  static const String keyAppBarOpacityDark = 'appBarOpacityDark';
  // Default value for the appBarOpacityDark, also used to reset settings.
  static const double? defaultAppBarOpacityDark = null;

  // Key used to read and save the appBarElevationLight value.
  static const String keyAppBarElevationLight = 'appBarElevationLight';
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

  // Key used to read and save the transparentStatusBar value.
  static const String keyAppBarTransparentStatusBar =
      'appBarTransparentStatusBar';
  // Default value for the transparentStatusBar, also used to reset settings.
  static const bool defaultAppBarTransparentStatusBar = true;

  // Key used to read and save the appBarCenterTitle value.
  static const String keyAppBarCenterTitle = 'appBarCenterTitle';
  // Default value for the appBarCenterTitle, also used to reset settings.
  static const bool? defaultAppBarCenterTitle = null;

  // Key used to read and save the appBarBackgroundSchemeColorLight value.
  static const String keyAppBarBackgroundSchemeColorLight =
      'appBarBackgroundSchemeColorLight';
  // Default value for the appBarBackgroundSchemeColorLight, also used to
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

  // Key used to read and save the appBarForegroundSchemeColorLight value.
  static const String keyAppBarForegroundSchemeColorLight =
      'appBarForegroundSchemeColorLight';
  // Default value for the appBarForegroundSchemeColor, also used to
  // reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultAppBarForegroundSchemeColorLight = null;

  // Key used to read and save the appBarForegroundSchemeColorDark value.
  static const String keyAppBarForegroundSchemeColorDark =
      'appBarForegroundSchemeColorDark';
  // Default value for the appBarForegroundSchemeColorDark, also used to
  // reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultAppBarForegroundSchemeColorDark = null;

  // Key used to read and save the appBarIconSchemeColorLight value.
  static const String keyAppBarIconSchemeColorLight =
      'appBarIconSchemeColorLight';
  // Default value for the appBarIconSchemeColorLight, also used to
  // reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultAppBarIconSchemeColorLight = null;

  // Key used to read and save the appBarIconSchemeColorDark value.
  static const String keyAppBarIconSchemeColorDark =
      'appBarIconSchemeColorDark';
  // Default value for the appBarIconSchemeColorDark, also used to
  // reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultAppBarIconSchemeColorDark = null;

  // Key used to read and save the appBarActionsIconSchemeColorLight value.
  static const String keyAppBarActionsIconSchemeColorLight =
      'appBarActionsIconSchemeColorLight';
  // Default value for the appBarActionsIconSchemeColorLight, also used to
  // reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultAppBarActionsIconSchemeColorLight = null;

  // Key used to read and save the appBarActionsIconSchemeColorDark value.
  static const String keyAppBarActionsIconSchemeColorDark =
      'appBarActionsIconSchemeColorDark';
  // Default value for the appBarActionsIconSchemeColorDark, also used to
  // reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultAppBarActionsIconSchemeColorDark = null;

  // BottomAppBar SETTINGS.
  // ===========================================================================

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

  // Key used to read and save the bottomAppBarSchemeColorLight value.
  static const String keyBottomAppBarSchemeColorLight =
      'bottomAppBarSchemeColorLight';
  // Default value for the bottomAppBarSchemeColorLight, also used to reset
  // settings. We use NULL as default, on nullable settings.
  static const SchemeColor? defaultBottomAppBarSchemeColorLight = null;

  // Key used to read and save the bottomAppBarSchemeColorDark value.
  static const String keyBottomAppBarSchemeColorDark =
      'bottomAppBarSchemeColorDark';
  // Default value for the bottomAppBarSchemeColorDark, also used to reset
  // settings. We use NULL as default, on nullable settings.
  static const SchemeColor? defaultBottomAppBarSchemeColorDark = null;

  // Key used to read and save the bottomAppBarHeight value.
  static const String keyBottomAppBarHeight = 'bottomAppBarHeight';
  // Default value for the bottomAppBarHeight, also used to reset settings.
  static const double? defaultBottomAppBarHeight = null;

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

  // Key used to read and save the tabBarItemSchemeColorLight value.
  static const String keyTabBarItemSchemeColorLight =
      'tabBarItemSchemeColorLight';
  // Default value for the tabBarItemSchemeColorLight,
  // also used to reset settings.
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

  // Key used to read and save the tabBarTabAlignment value.
  static const String keyTabBarTabAlignment = 'tabBarTabAlignment';
  // Default value for the tabBarTabAlignment, also to reset settings.
  // We use NULL as default, this nullable setting.
  static const TabAlignment? defaultTabBarTabAlignment = null;

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

  // Key used to read and save the systemNavBarStyle value.
  static const String keySystemNavBarStyle = 'systemNavBarStyle';
  // Default value for the systemNavBarStyle, also used to reset settings.
  static const FlexSystemNavBarStyle defaultSystemNavBarStyle =
      FlexSystemNavBarStyle.background;

  // Key used to read and save the systemNavBarOpacity value.
  static const String keySystemNavBarOpacity = 'systemNavBarOpacity';
  // Default value for the systemNavBarOpacity, also used to reset settings.
  static const double defaultSysBarOpacity = 1.0;

  // Key used to read and save the useSystemNavBarDivider value.
  static const String keyUseSystemNavBarDivider = 'useSystemNavBarDivider';
  // Default value for the useNavDivider, also to reset settings.
  static const bool defaultUseSystemNavBarDivider = false;

  // BottomNavigationBar SETTINGS.
  // ===========================================================================

  // Key used to read and save the bottomNavigationBarBackgroundSchemeColor
  // value.
  static const String keyBottomNavigationBarBackgroundSchemeColor =
      'bottomNavigationBarBackgroundSchemeColor';
  // Default value for the bottomNavigationBarBackgroundSchemeColor, also used
  // to reset settings.
  static const SchemeColor? defaultBottomNavigationBarBackgroundSchemeColor =
      null;

  // Key used to read and save the bottomNavigationBarOpacity value.
  static const String keyBottomNavigationBarOpacity =
      'bottomNavigationBarOpacity';
  // Default value for the bottomNavigationBarOpacity, also to reset settings.
  static const double? defaultBottomNavigationBarOpacity = null;

  // Key used to read and save the bottomNavigationBarElevation value.
  static const String keyBottomNavigationBarElevation =
      'bottomNavigationBarElevation';
  // Default value for the bottomNavigationBarElevation, also reset settings.
  static const double? defaultBottomNavigationBarElevation = null;

  // Key used to read and save the bottomNavigationBarSelectedItemSchemeColor.
  static const String keyBottomNavigationBarSelectedItemSchemeColor =
      'bottomNavigationBarSelectedItemSchemeColor';
  // Default value for the bottomNavigationBarSelectedItemSchemeColor.
  static const SchemeColor? defaultBottomNavigationBarSelectedItemSchemeColor =
      null;

  // Key used to read and save the bottomNavigationBarUnselectedItemSchemeColor.
  static const String keyBottomNavigationBarUnselectedItemSchemeColor =
      'bottomNavigationBarUnselectedItemSchemeColor';
  // Default bottomNavigationBarUnselectedItemSchemeColor.
  static const SchemeColor? defaultBottomNavBarUnselectedSchemeColor = null;

  // Key used to read and save the bottomNavigationBarMuteUnselectedItem value.
  static const String keyBottomNavigationBarMuteUnselectedItem =
      'bottomNavigationBarMuteUnselectedItem';
  // Default value for the bottomNavigationBarMuteUnselectedItem,
  // also to reset settings.
  static const bool? defaultBottomNavigationBarMuteUnselectedItem = null;

  // Key used to read and save the bottomNavigationBarShowSelectedLabels value.
  static const String keyBottomNavigationBarShowSelectedLabels =
      'bottomNavigationBarShowSelectedLabels';
  // Default value for the bottomNavigationBarShowSelectedLabels,
  // also to reset settings.
  static const bool defaultBottomNavigationBarShowSelectedLabels = true;

  // Key used to read and save the bottomNavigationBarShowUnselectedLabels value
  static const String keyBottomNavigationBarShowUnselectedLabels =
      'bottomNavigationBarShowUnselectedLabels';
  // Default value for bottomNavigationBarShowUnselectedLabels.
  static const bool defaultBottomNavigationBarShowUnselectedLabels = true;

  // Key used to read and save the bottomNavigationBarSelectedLabelSize value.
  static const String keyBottomNavigationBarSelectedLabelSize =
      'bottomNavigationBarSelectedLabelSize';
  // Default value for the bottomNavigationBarSelectedLabelSize,
  // also to reset settings.
  static const double? defaultBottomNavigationBarSelectedLabelSize = null;

  // Key used to read and save the bottomNavigationBarUnselectedLabelSize value.
  static const String keyBottomNavigationBarUnselectedLabelSize =
      'bottomNavigationBarUnselectedLabelSize';
  // Default value for the bottomNavigationBarUnselectedLabelSize,
  // also to reset settings.
  static const double? defaultBottomNavigationBarUnselectedLabelSize = null;

  // Key used to read and save the bottomNavigationBarSelectedIconSize value.
  static const String keyBottomNavigationBarSelectedIconSize =
      'bottomNavigationBarSelectedIconSize';
  // Default value for the bottomNavigationBarSelectedIconSize,
  // also to reset settings.
  static const double? defaultBottomNavigationBarSelectedIconSize = null;

  // Key used to read and save the bottomNavigationBarUnselectedIconSize value.
  static const String keyBottomNavigationBarUnselectedIconSize =
      'bottomNavigationBarUnselectedIconSize';
  // Default value for the bottomNavigationBarUnselectedIconSize,
  // also to reset settings.
  static const double? defaultBottomNavigationBarUnselectedIconSize = null;

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

  // SearchView and SearchBar SETTINGS.
  // ===========================================================================

  // Key used to read and save the searchBackgroundSchemeColor value.
  static const String keySearchBackgroundSchemeColor =
      'searchBackgroundSchemeColor';
  // Default value for the searchBackgroundSchemeColor,
  // also used to reset settings.
  static const SchemeColor? defaultSearchBackgroundSchemeColor = null;

  // Key used to read and save the searchElevation value.
  static const String keySearchElevation = 'searchElevation';
  // Default value for the searchElevation, also reset settings.
  static const double? defaultSearchElevation = null;

  // Key used to read and save the searchRadius value.
  static const String keySearchRadius = 'searchRadius';
  // Default value for the searchRadius, also reset settings.
  static const double? defaultSearchRadius = null;

  // Key used to read and save the searchViewHeaderHeight value.
  static const String keySearchViewHeaderHeight = 'searchViewHeaderHeight';
  // Default value for the searchViewHeaderHeight, also reset settings.
  static const double? defaultSearchViewHeaderHeight = null;

  // Key used to read and save the searchUseGlobalShape value.
  static const String keySearchUseGlobalShape = 'searchUseGlobalShape';
  // Default value for the searchUseGlobalShape, also to reset settings.
  static const bool defaultSearchUseGlobalShape = false;

  // Key used to read and save the searchIsFullScreen value.
  static const String keySearchIsFullScreen = 'searchIsFullScreen';
  // Default value for the searchIsFullScreen, also to reset settings.
  static const bool defaultSearchIsFullScreen = false;

  // NavigationBar SETTINGS.
  // ===========================================================================

  // Key used to read and save the navigationBarBackgroundSchemeColor value.
  static const String keyNavigationBarBackgroundSchemeColor =
      'navigationBarBackgroundSchemeColor';
  // Default value for the navigationBarBackgroundSchemeColor, also used to
  // reset settings.
  static const SchemeColor? defaultNavigationBarBackgroundSchemeColor = null;

  // Key used to read and save the navigationBarOpacity value.
  static const String keyNavigationBarOpacity = 'navigationBarOpacity';
  // Default value for the navigationBarOpacity, also to reset settings.
  static const double? defaultNavigationBarOpacity = null;

  // Key used to read and save the navigationBarElevation value.
  static const String keyNavigationBarElevation = 'navigationBarElevation';
  // Default value for the navigationBarElevation, also reset settings.
  static const double? defaultNavigationBarElevation = null;

  // Key used to read and save the navigationBarHeight value.
  static const String keyNavigationBarHeight = 'navigationBarHeight';
  // Default value for the navigationBarHeight, also reset settings.
  static const double? defaultNavigationBarHeight = null;

  // Key used to read and save the navigationBarSelectedIconSchemeColor
  // icon value.
  static const String keyNavigationBarSelectedIconSchemeColor =
      'navigationBarSelectedIconSchemeColor';
  // Default value for the navigationBarSelectedIconSchemeColor.
  static const SchemeColor? defaultNavigationBarSelectedIconSchemeColor = null;

  // Key used to read and save the navigationBarSelectedLabelSchemeColor
  // icon value.
  static const String keyNavigationBarSelectedLabelSchemeColor =
      'navigationBarSelectedLabelSchemeColor';
  // Default value for the navigationBarSelectedLabelSchemeColor.
  static const SchemeColor? defaultNavigationBarSelectedLabelSchemeColor = null;

  // Key used to read and save the navigationBarUnselectedItemSchemeColor value.
  static const String keyNavigationBarUnselectedItemSchemeColor =
      'navigationBarUnselectedItemSchemeColor';
  // Default navigationBarUnselectedItemSchemeColor.
  static const SchemeColor? defaultNavigationBarUnselectedSchemeColor = null;

  // Key used to read and save the navigationBarMuteUnselectedItem value.
  static const String keyNavigationBarMuteUnselectedItem =
      'navigationBarMuteUnselectedItem';
  // Default value for the navigationBarMuteUnselectedItem,
  // also used to reset settings.
  static const bool defaultNavigationBarMuteUnselected = false;

  // Key used to read and save the navigationBarIndicatorSchemeColor value.
  static const String keyNavigationBarIndicatorSchemeColor =
      'navigationBarIndicatorSchemeColor';
  // Default value for the navigationBarIndicatorSchemeColor, also used to reset
  // settings. We use NULL as default, on nullable settings.
  static const SchemeColor? defaultNavigationBarIndicatorSchemeColor = null;

  // Key used to read and save the navigationBarIndicatorOpacity value.
  static const String keyNavigationBarIndicatorOpacity =
      'navigationBarIndicatorOpacity';
  // Default value for the navigationBarIndicatorOpacity,
  // also to reset settings.
  static const double? defaultNavigationBarIndicatorOpacity = null;

  // Key used to read and save the navigationBarIndicatorBorderRadius value.
  static const String keyNavigationBarIndicatorBorderRadius =
      'navigationBarIndicatorBorderRadius';
  // Default value for the navigationBarIndicatorBorderRadius,
  // also to reset settings.
  static const double? defaultNavigationBarIndicatorBorderRadius = null;

  // Key used to read and save the navigationBarLabelBehavior value.
  static const String keyNavigationBarLabelBehavior =
      'navigationBarLabelBehavior';
  // Default value for the navigationBarLabelBehavior, also used to
  // reset settings.
  static const NavigationDestinationLabelBehavior
      defaultNavigationBarLabelBehavior =
      NavigationDestinationLabelBehavior.alwaysShow;

  // Key used to read and save the adaptiveRemoveNavigationBarTintLight value.
  static const String keyAdaptiveRemoveNavigationBarTintLight =
      'adaptiveRemoveNavigationBarTintLight';
  // Default value for the adaptiveRemoveNavigationBarTintLight,
  // also to reset settings.
  // We use NULL as default, on nullable settings.
  static const AdaptiveResponse? defaultAdaptiveRemoveNavigationBarTintLight =
      null;

  // Key used to read and save the adaptiveRemoveNavigationBarTintDark value.
  static const String keyAdaptiveRemoveNavigationBarTintDark =
      'adaptiveRemoveNavigationBarTintDark';
  // Default value for the adaptiveRemoveNavigationBarTintDark,
  // also to reset settings.
  // We use NULL as default, on nullable settings.
  static const AdaptiveResponse? defaultAdaptiveRemoveNavigationBarTintDark =
      null;

  // Key used to read and save the navigationBarSelectedLabelSize value.
  static const String keyNavigationBarSelectedLabelSize =
      'navigationBarSelectedLabelSize';
  // Default value for the navigationBarSelectedLabelSize,
  // also to reset settings.
  static const double? defaultNavigationBarSelectedLabelSize = null;

  // Key used to read and save the navigationBarUnselectedLabelSize value.
  static const String keyNavigationBarUnselectedLabelSize =
      'navigationBarUnselectedLabelSize';
  // Default value for the navigationBarUnselectedLabelSize,
  // also to reset settings.
  static const double? defaultNavigationBarUnselectedLabelSize = null;

  // Key used to read and save the navigationBarSelectedIconSize value.
  static const String keyNavigationBarSelectedIconSize =
      'navigationBarSelectedIconSize';
  // Default value for the navigationBarSelectedIconSize,
  // also to reset settings.
  static const double? defaultNavigationBarSelectedIconSize = null;

  // Key used to read and save the navigationBarUnselectedIconSize value.
  static const String keyNavigationBarUnselectedIconSize =
      'navigationBarUnselectedIconSize';
  // Default value for the navigationBarUnselectedIconSize,
  // also to reset settings.
  static const double? defaultNavigationBarUnselectedIconSize = null;

  // NavigationRail SETTINGS.
  // ===========================================================================

  // Key used to read and save the navigationRailBackgroundSchemeColor value.
  static const String keyNavigationRailBackgroundSchemeColor =
      'navigationRailBackgroundSchemeColor';
  // Default value for the navigationRailBackgroundSchemeColor, also used to
  // reset settings.
  static const SchemeColor? defaultNavigationRailBackgroundSchemeColor = null;

  // Key used to read and save the navigationRailOpacity value.
  static const String keyNavigationRailOpacity = 'navigationRailOpacity';
  // Default value for the navigationRailOpacity, also to reset settings.
  static const double? defaultNavigationRailOpacity = null;

  // Key used to read and save the navigationRailElevation value.
  static const String keyNavigationRailElevation = 'navigationRailElevation';
  // Default value for the navigationRailElevation, also reset settings.
  static const double? defaultNavigationRailElevation = null;

  // Key used to read and save the navigationRailSelectedIconSchemeColor value.
  static const String keyNavigationRailSelectedIconSchemeColor =
      'navigationRailSelectedIconSchemeColor';
  // Default value for the navigationRailSelectedIconSchemeColor.
  static const SchemeColor? defaultNavigationRailSelectedIconSchemeColor = null;

  // Key used to read and save the navigationRailSelectedLabelSchemeColor value.
  static const String keyNavigationRailSelectedLabelSchemeColor =
      'navigationRailSelectedLabelSchemeColor';
  // Default value for the navigationRailSelectedLabelSchemeColor.
  static const SchemeColor? defaultNavigationRailSelectedLabelSchemeColor =
      null;

  // Key used to read and save the navigationRailUnselectedItemSchemeColor
  // value.
  static const String keyNavigationRailUnselectedItemSchemeColor =
      'navigationRailUnselectedItemSchemeColor';
  // Default navigationRailUnselectedItemSchemeColor.
  static const SchemeColor? defaultNavigationRailUnselectedItemSchemeColor =
      null;

  // Key used to read and save the navigationRailMuteUnselectedItem value.
  static const String keyNavigationRailMuteUnselectedItem =
      'navigationRailMuteUnselectedItem';
  // Default value for the navigationRailMuteUnselectedItem,
  // also used to reset settings.
  static const bool defaultNavigationRailMuteUnselectedItem = false;

  // Key used to read and save the navigationRailLabelType value.
  static const String keyNavigationRailLabelType = 'navigationRailLabelType';
  // Default value for the navigationRailLabelType, also used to
  // reset settings.
  static const NavigationRailLabelType defaultNavigationRailLabelType =
      NavigationRailLabelType.all;

  // Key used to read and save the navigationRailUseIndicator value.
  static const String keyNavigationRailUseIndicator =
      'navigationRailUseIndicator';
  // Default value for the navigationRailUseIndicator, also to reset settings.
  static const bool defaultNavigationRailUseIndicator = true;

  // Key used to read and save the navigationRailIndicatorSchemeColor value.
  static const String keyNavigationRailIndicatorSchemeColor =
      'navigationRailIndicatorSchemeColor';
  // Default value for the navigationRailIndicatorSchemeColor, also used
  // to reset settings. We use NULL as default, on nullable settings.
  static const SchemeColor? defaultNavigationRailIndicatorSchemeColor = null;

  // Key used to read and save the navigationRailIndicatorOpacity value.
  static const String keyNavigationRailIndicatorOpacity =
      'navigationRailIndicatorOpacity';
  // Default value for the navigationRailIndicatorOpacity, also reset settings.
  static const double? defaultNavigationRailIndicatorOpacity = null;

  // Key used to read and save the navigationRailIndicatorBorderRadius value.
  static const String keyNavigationRailIndicatorBorderRadius =
      'navigationRailIndicatorBorderRadius';
  // Default value for the navigationRailIndicatorBorderRadius,
  // also to reset settings.
  static const double? defaultNavigationRailIndicatorBorderRadius = null;

  // Key used to read and save the navigationRailSelectedLabelSize value.
  static const String keyNavigationRailSelectedLabelSize =
      'navigationRailSelectedLabelSize';
  // Default value for the navigationRailSelectedLabelSize,
  // also to reset settings.
  static const double? defaultNavigationRailSelectedLabelSize = null;

  // Key used to read and save the navigationRailUnselectedLabelSize value.
  static const String keyNavigationRailUnselectedLabelSize =
      'navigationRailUnselectedLabelSize';
  // Default value for the navigationRailUnselectedLabelSize,
  // also to reset settings.
  static const double? defaultNavigationRailUnselectedLabelSize = null;

  // Key used to read and save the navigationRailSelectedIconSize value.
  static const String keyNavigationRailSelectedIconSize =
      'navigationRailSelectedIconSize';
  // Default value for the navigationRailSelectedIconSize,
  // also to reset settings.
  static const double? defaultNavigationRailSelectedIconSize = null;

  // Key used to read and save the navigationRailUnselectedIconSize value.
  static const String keyNavigationRailUnselectedIconSize =
      'navigationRailUnselectedIconSize';
  // Default value for the navigationRailUnselectedIconSize,
  // also to reset settings.
  static const double? defaultNavigationRailUnselectedIconSize = null;

  // Key used to read and save the navigationRailGroupAlignment value.
  static const String keyNavigationRailGroupAlignment =
      'navigationRailGroupAlignment';
  // Default value for the navigationRailGroupAlignment,
  // also to reset settings.
  static const double? defaultNavigationRailGroupAlignment = null;

  // Key used to read and save the navigationRailMinWidth value.
  static const String keyNavigationRailMinWidth = 'navigationRailMinWidth';
  // Default value for the navigationRailMinWidth,
  // also to reset settings.
  static const double? defaultNavigationRailMinWidth = null;

  // Key used to read and save the navigationRailMinExtendedWidth value.
  static const String keyNavigationRailMinExtendedWidth =
      'navigationRailMinExtendedWidth';
  // Default value for the navigationRailMinExtendedWidth,
  // also to reset settings.
  static const double? defaultNavigationRailMinExtendedWidth = null;

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

  // Key used to read and save toggleButtonsSelectedForegroundSchemeColor value.
  static const String keyToggleButtonsSelectedForegroundSchemeColor =
      'toggleButtonsSelectedForegroundSchemeColor';
  // Default value for the toggleButtonsSelectedForegroundSchemeColor,
  // also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultToggleButtonsSelectedForegroundSchemeColor =
      null;

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

  // Key used to read and save the
  // segmentedButtonSelectedForegroundSchemeColor value.
  static const String keySegmentedButtonSelectedForegroundSchemeColor =
      'segmentedButtonSelectedForegroundSchemeColor';
  // Default value for the segmentedButtonSelectedForegroundSchemeColor,
  // also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor?
      defaultSegmentedButtonSelectedForegroundSchemeColor = null;

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

  // Key used to read and save the switchAdaptiveCupertinoLike value.
  static const String keySwitchAdaptiveCupertinoLike =
      'switchAdaptiveCupertinoLike';
  // Default value for the switchThumbFixedSize, also used to reset settings.
  static const AdaptiveResponse? defaultSwitchAdaptiveCupertinoLike = null;

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

  // Key used to read and save the floatingActionButtonUseShape value.
  static const String keyFloatingActionButtonUseShape =
      'floatingActionButtonUseShape';
  // Default value for the floatingActionButtonUseShape,
  // also to reset settings.
  static const bool defaultFloatingActionButtonUseShape = false;

  // Key used to read and save the floatingActionButtonUseShape value.
  static const String keyFloatingActionButtonAlwaysCircular =
      'floatingActionButtonAlwaysCircular';
  // Default value for the floatingActionButtonUseShape,
  // also to reset settings.
  static const bool defaultFloatingActionButtonAlwaysCircular = false;

  // Key used to read and save the floatingActionButtonBorderRadius value.
  static const String keyFloatingActionButtonBorderRadius =
      'floatingActionButtonBorderRadius';
  // Default value for the floatingActionButtonBorderRadius,
  // also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultFloatingActionButtonBorderRadius = null;

  // Key used to read and save the floatingActionButtonSchemeColor value.
  static const String keyFloatingActionButtonSchemeColor =
      'floatingActionButtonSchemeColor';
  // Default value for the floatingActionButtonSchemeColor, also used
  // to reset settings. We use NULL as default, on nullable settings.
  static const SchemeColor? defaultFloatingActionButtonSchemeColor = null;

  // Key used to read and save the floatingActionButtonForegroundSchemeColor
  // value.
  static const String keyFloatingActionButtonForegroundSchemeColor =
      'floatingActionButtonForegroundSchemeColor';
  // Default value for the floatingActionButtonForegroundSchemeColor,
  // also to reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultFloatingActionButtonForegroundSchemeColor =
      null;

  // Key used to read and save the chipSchemeColor value.
  static const String keyChipSchemeColor = 'chipSchemeColor';
  // Default value for the chipSchemeColor, also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultChipSchemeColor = null;

  // Key used to read and save the chipSelectedSchemeColor value.
  static const String keyChipSelectedSchemeColor = 'chipSelectedSchemeColor';
  // Default value for the chipSelectedSchemeColor,
  // also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultChipSelectedSchemeColor = null;

  // Key used to read and save the chipSecondarySelectedSchemeColor value.
  static const String keyChipSecondarySelectedSchemeColor =
      'chipSecondarySelectedSchemeColor';
  // Default value for the chipSecondarySelectedSchemeColor, also used to reset
  // settings. We use NULL as default, on nullable settings.
  static const SchemeColor? defaultChipSecondarySelectedSchemeColor = null;

  // Key used to read and save the chipDeleteIconSchemeColor value.
  static const String keyChipDeleteIconSchemeColor =
      'chipDeleteIconSchemeColor';
  // Default value for the chipDeleteIconSchemeColor, also to reset settings.
  // We use NULL as default, on nullable settings.
  static const SchemeColor? defaultChipDeleteIconSchemeColor = null;

  // Key used to read and save the chipBlendColors value.
  static const String keyChipBlendColors = 'chipBlendColors';
  // Default value for the chipBlendColors, also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const bool? defaultChipBlendColors = null;

  // Key used to read and save the chipBorderRadius value.
  static const String keyChipBorderRadius = 'chipBorderRadius';
  // Default value for the chipBorderRadius, also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultChipBorderRadius = null;

  // Key used to read and save the chipFontSize value.
  static const String keyChipFontSize = 'chipFontSize';
  // Default value for the chipFontSize, also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultChipFontSize = null;

  // Key used to read and save the chipIconSize value.
  static const String keyChipIconSize = 'chipIconSize';
  // Default value for the chipIconSize, also used to reset settings.
  // We use NULL as default, on nullable settings.
  static const double? defaultChipIconSize = null;

  // Key used to read and save the chipPaddingStart value.
  static const String keyChipPaddingStart = 'chipPaddingStart';
  // Default value for the chipPaddingStart, also reset settings.
  static const double? defaultChipPaddingStart = null;

  // Key used to read and save the chipPaddingEnd value.
  static const String keyChipPaddingEnd = 'chipPaddingEnd';
  // Default value for the chipPaddingEnd, also reset settings.
  static const double? defaultChipPaddingEnd = null;

  // Key used to read and save the chipPaddingTop value.
  static const String keyChipPaddingTop = 'chipPaddingTop';
  // Default value for the chipPaddingTop, also reset settings.
  static const double? defaultChipPaddingTop = null;

  // Key used to read and save the chipPaddingBottom value.
  static const String keyChipPaddingBottom = 'chipPaddingBottom';
  // Default value for the chipPaddingBottom, also reset settings.
  static const double? defaultChipPaddingBottom = null;

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
  static const double? defaultPopupMenuOpacity = null;

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

  // Key used to read and save the dialogBackgroundLightSchemeColor value.
  static const String keyDialogBackgroundLightSchemeColor =
      'dialogBackgroundLightSchemeColor';
  // Default value for the dialogBackgroundLightSchemeColor, also used to
  // reset settings.
  static const SchemeColor? defaultDialogBackgroundLightSchemeColor = null;

  // Key used to read and save the dialogBackgroundDarkSchemeColor value.
  static const String keyDialogBackgroundDarkSchemeColor =
      'dialogBackgroundDarkSchemeColor';
  // Default value for the dialogBackgroundDarkSchemeColor, also used to
  // reset settings.
  static const SchemeColor? defaultDialogBackgroundDarkSchemeColor = null;

  // Key used to read and save the datePickerHeaderBackgroundSchemeColor value.
  static const String keyDatePickerHeaderBackgroundSchemeColor =
      'datePickerHeaderBackgroundSchemeColor';
  // Default value for the datePickerHeaderBackgroundSchemeColor, also used to
  // reset settings.
  static const SchemeColor? defaultDatePickerHeaderBackgroundSchemeColor = null;

  // Key used to read and save the datePickerHeaderForegroundSchemeColor value.
  static const String keyDatePickerHeaderForegroundSchemeColor =
      'datePickerHeaderForegroundSchemeColor';
  // Default value for the datePickerHeaderForegroundSchemeColor, also used to
  // reset settings.
  static const SchemeColor? defaultDatePickerHeaderForegroundSchemeColor = null;

  // Key used to read and save the datePickerDividerSchemeColor value.
  static const String keyDatePickerDividerSchemeColor =
      'datePickerDividerSchemeColor';
  // Default value for the datePickerDividerSchemeColor, also used to
  // reset settings.
  static const SchemeColor? defaultDatePickerDividerSchemeColor = null;

  // Key used to read and save the useInputDecoratorThemeInDialogs value.
  static const String keyUseInputDecoratorThemeInDialogs =
      'useInputDecoratorThemeInDialogs';
  // Default value for the useInputDecoratorThemeInDialogs, also
  // used to reset settings.
  static const bool defaultUseInputDecoratorThemeInDialogs = false;

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

  // Key used to read and save the adaptiveResponseDialogRadius value.
  static const String keyAdaptiveResponseDialogRadius =
      'adaptiveResponseDialogRadius';
  // Default value for the adaptiveResponseDialogRadius, also to reset settings.
  // We use NULL as default, on nullable settings.
  static const AdaptiveResponse? defaultAdaptiveResponseDialogRadius = null;

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
  static const double? defaultTooltipOpacity = null;

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

  // Key used to read and save the customUsesDarkColorsForSeed value.
  static const String keyCustomUsesDarkColorsForSeed =
      'customUsesDarkColorsForSeed';
  // Default value for the customUsesDarkColorsForSeed, also
  // used to reset settings.
  static const bool defaultCustomUsesDarkColorsForSeed = false;

  // Key used to read and save the customPrimaryLight color value.
  static const String keyCustomPrimaryLight = 'customPrimaryLight';
  // Default value for the customPrimaryLight color, also to reset settings.
  static const Color defaultCustomPrimaryLight = AppColor.customPrimaryLight;

  // Key used to read and save the customPrimaryLightRef color value.
  static const String keyCustomPrimaryLightRef = 'customPrimaryLightRef';
  // Default value for the customPrimaryLightRef color, also to reset settings.
  static const Color defaultCustomPrimaryLightRef = AppColor.customPrimaryLight;

  // Key used to read and save the customPrimaryContainerLight color value.
  static const String keyCustomPrimaryContainerLight =
      'customPrimaryContainerLight';
  // Default value for the customPrimaryContainerLight color,
  // also to reset settings.
  static const Color defaultCustomPrimaryContainerLight =
      AppColor.customPrimaryContainerLight;

  // Key used to read and save the customSecondaryLight color value.
  static const String keyCustomSecondaryLight = 'customSecondaryLight';
  // Default value for the customSecondaryLight color, also to reset settings.
  static const Color defaultCustomSecondaryLight =
      AppColor.customSecondaryLight;

  // Key used to read and save the customSecondaryLightRef color value.
  static const String keyCustomSecondaryLightRef = 'customSecondaryLightRef';
  // Default value for the customSecondaryLightRef color,
  // also to reset settings.
  static const Color defaultCustomSecondaryLightRef =
      AppColor.customSecondaryLight;

  // Key used to read and save the customSecondaryContainerLight color value.
  static const String keyCustomSecondaryContainerLight =
      'customSecondaryContainerLight';
  // Default value for the customSecondaryContainerLight color,
  // also to reset settings.
  static const Color defaultCustomSecondaryContainerLight =
      AppColor.customSecondaryContainerLight;

  // Key used to read and save the customTertiaryLight color value.
  static const String keyCustomTertiaryLight = 'customTertiaryLight';
  // Default value for the customTertiaryLight color, also to reset settings.
  static const Color defaultCustomTertiaryLight = AppColor.customTertiaryLight;

  // Key used to read and save the customTertiaryLightRef color value.
  static const String keyCustomTertiaryLightRef = 'customTertiaryLightRef';
  // Default value for the customTertiaryLightRef color, also to reset settings.
  static const Color defaultCustomTertiaryLightRef =
      AppColor.customTertiaryLight;

  // Key used to read and save the tertiaryContainerLight color value.
  static const String keyCustomTertiaryContainerLight =
      'customTertiaryContainerLight';
  // Default value for the tertiaryContainerLight color, also to reset settings.
  static const Color defaultCustomTertiaryContainerLight =
      AppColor.customTertiaryContainerLight;

  // Key used to read and save the customErrorLight color value.
  static const String keyCustomErrorLight = 'customErrorLight';
  // Default value for the customErrorLight color, also to reset settings.
  static const Color defaultCustomErrorLight = FlexColor.material3LightError;

  // Key used to read and save the customErrorContainerLight color value.
  static const String keyCustomErrorContainerLight =
      'customErrorContainerLight';
  // Default value for the customErrorContainerLight color,
  // also to reset settings.
  static const Color defaultCustomErrorContainerLight =
      FlexColor.material3LightErrorContainer;

  // Key used to read and save the customPrimaryDark color value.
  static const String keyCustomPrimaryDark = 'customPrimaryDark';
  // Default value for the customPrimaryDark color, also to reset settings.
  static const Color defaultCustomPrimaryDark = AppColor.customPrimaryDark;

  // Key used to read and save the customPrimaryDarkRef color value.
  static const String keyCustomPrimaryDarkRef = 'customPrimaryDarkRef';
  // Default value for the customPrimaryDarkRef color, also to reset settings.
  static const Color defaultCustomPrimaryDarkRef = AppColor.customPrimaryLight;

  // Key used to read and save the customPrimaryContainerDark color value.
  static const String keyCustomPrimaryContainerDark =
      'customPrimaryContainerDark';
  // Default value for the customPrimaryContainerDark color,
  // also to reset settings.
  static const Color defaultCustomPrimaryContainerDark =
      AppColor.customPrimaryContainerDark;

  // Key used to read and save the customSecondaryDark color value.
  static const String keyCustomSecondaryDark = 'customSecondaryDark';
  // Default value for the customSecondaryDark color, also to reset settings.
  static const Color defaultCustomSecondaryDark = AppColor.customSecondaryDark;

  // Key used to read and save the customSecondaryDarkRef color value.
  static const String keyCustomSecondaryDarkRef = 'customSecondaryDarkRef';
  // Default value for the customSecondaryDarkRef color, also to reset settings.
  static const Color defaultCustomSecondaryDarkRef =
      AppColor.customSecondaryLight;

  // Key used to read and save the customSecondaryContainerDark color value.
  static const String keyCustomSecondaryContainerDark =
      'customSecondaryContainerDark';
  // Default value for the customSecondaryContainerDark color,
  // also to reset settings.
  static const Color defaultCustomSecondaryContainerDark =
      AppColor.customSecondaryContainerDark;

  // Key used to read and save the customTertiaryDark color value.
  static const String keyCustomTertiaryDark = 'customTertiaryDark';
  // Default value for the customTertiaryDark color, also to reset settings.
  static const Color defaultCustomTertiaryDark = AppColor.customTertiaryDark;

  // Key used to read and save the customTertiaryDarkRef color value.
  static const String keyCustomTertiaryDarkRef = 'customTertiaryDarkRef';
  // Default value for the customTertiaryDarkRef color, also to reset settings.
  static const Color defaultCustomTertiaryDarkRef =
      AppColor.customTertiaryLight;

  // Key used to read and save the customTertiaryContainerDark color value.
  static const String keyCustomTertiaryContainerDark =
      'customTertiaryContainerDark';
  // Default value for the customTertiaryContainerDark color,
  // also to reset settings.
  static const Color defaultCustomTertiaryContainerDark =
      AppColor.customTertiaryContainerDark;

  // Key used to read and save the customErrorDark color value.
  static const String keyCustomErrorDark = 'customErrorDark';
  // Default value for the customErrorDark color, also to reset settings.
  static const Color defaultCustomErrorDark = FlexColor.material3DarkError;

  // Key used to read and save the customErrorContainerDark color value.
  static const String keyCustomErrorContainerDark = 'customErrorContainerDark';
  // Default value for the customErrorContainerDark color,
  // also to reset settings.
  static const Color defaultCustomErrorContainerDark =
      FlexColor.material3DarkErrorContainer;

  // A list of all storage keys used in the app.
  // See Python script list_keys.py that can be used to generate this list.
  static const List<String> storageKeys = <String>[
    keyThemeMode,
    keyVisualDensity,
    keyTapTargetSize,
    keyUseFlexColorScheme,
    keyUseSubThemes,
    keyGenerateCodeForOwnFile,
    keyApplyThemeToAllCupertino,
    keyAdaptiveRemoveElevationTintLight,
    keyAdaptiveElevationShadowsBackLight,
    keyAdaptiveAppBarScrollUnderOffLight,
    keyAdaptiveRemoveElevationTintDark,
    keyAdaptiveElevationShadowsBackDark,
    keyAdaptiveAppBarScrollUnderOffDark,
    keyAdaptiveRadius,
    keyAdaptiveSplash,
    keySplashType,
    keySplashTypeAdaptive,
    keyCompactMode,
    keyVerticalMode,
    keyConfirmPremade,
    keyTopicIndexStartSide,
    keyTopicIndexEndSide,
    keySimulatorDeviceIndex,
    keySimulatorAppIndex,
    keySimulatorComponentsIndex,
    keySimulatorViewZoom,
    keyShowSchemeInputColors,
    keyUseMaterial3Typography,
    keyUseM2StyleDividerInM3,
    keyUseAppFont,
    keyUsedScheme,
    keySchemeIndex,
    keyInteractionEffects,
    keyTintedDisabledControls,
    keyDefaultRadius,
    keyDefaultRadiusAdaptive,
    keyThinBorderWidth,
    keyThickBorderWidth,
    keyTooltipsMatchBackground,
    keyScaffoldBackgroundLightBaseColor,
    keyScaffoldBackgroundDarkBaseColor,
    keyScaffoldBackgroundLightSchemeColor,
    keyScaffoldBackgroundDarkSchemeColor,
    keySurfaceModeLight,
    keySurfaceModeDark,
    keyBlendLevelLight,
    keyBlendLevelDark,
    keyBlendOnLevelLight,
    keyBlendOnLevelDark,
    keyUsedColors,
    keySwapLegacyColorsInM3,
    keySwapPrimaryAndSecondaryLightColors,
    keySwapPrimaryAndSecondaryDarkColors,
    keyScaffoldLightIsWhite,
    keyScaffoldDarkIsTrueBlack,
    keyUseToDarkMethod,
    keyToDarkSwapPrimaryAndContainer,
    keyToDarkMethodLevel,
    keyBlendLightOnColors,
    keyBlendDarkOnColors,
    keyUseMaterial3,
    keyFixedColorStyle,
    keyUseKeyColors,
    keyUseSecondary,
    keyUseTertiary,
    keyUseError,
    keyKeepPrimary,
    keyKeepSecondary,
    keyKeepTertiary,
    keyKeepError,
    keyKeepPrimaryContainer,
    keyKeepSecondaryContainer,
    keyKeepTertiaryContainer,
    keyKeepErrorContainer,
    keyKeepDarkPrimary,
    keyKeepDarkSecondary,
    keyKeepDarkTertiary,
    keyKeepDarkError,
    keyKeepDarkPrimaryContainer,
    keyKeepDarkSecondaryContainer,
    keyKeepDarkTertiaryContainer,
    keyKeepDarkErrorContainer,
    keyUsedFlexToneSetup,
    keyUseM3ErrorColors,
    keyUseMonoSurfacesLight,
    keyUseMonoSurfacesDark,
    keyOnMainsUseBWLight,
    keyOnMainsUseBWDark,
    keyOnSurfacesUseBWLight,
    keyOnSurfacesUseBWDark,
    keySurfacesUseBWLight,
    keySurfacesUseBWDark,
    keyHigherContrastFixed,
    keyExpressiveOnContainer,
    keyUseLegacyMonochromeSeedBehavior,
    keyDynamicContrastLevel,
    keyInputDecoratorSchemeColorLight,
    keyInputDecoratorSchemeColorDark,
    keyInputDecoratorBorderSchemeColorLight,
    keyInputDecoratorBorderSchemeColorDark,
    keyInputDecoratorIsFilled,
    keyInputDecoratorIsDense,
    keyInputDecoratorPaddingStart,
    keyInputDecoratorPaddingEnd,
    keyInputDecoratorPaddingTop,
    keyInputDecoratorPaddingBottom,
    keyInputDecoratorBackgroundAlphaLight,
    keyInputDecoratorBackgroundAlphaDark,
    keyInputDecoratorBorderType,
    keyInputDecoratorBorderRadius,
    keyInputDecoratorBorderRadiusAdaptive,
    keyAdaptiveResponseInputDecoratorRadius,
    keyInputDecoratorUnfocusedHasBorder,
    keyInputDecoratorFocusedHasBorder,
    keyInputDecoratorUnfocusedBorderIsColored,
    keyInputDecoratorBorderWidth,
    keyInputDecoratorFocusedBorderWidth,
    keyInputDecoratorPrefixIconLightSchemeColor,
    keyInputDecoratorSuffixIconLightSchemeColor,
    keyInputDecoratorPrefixIconDarkSchemeColor,
    keyInputDecoratorSuffixIconDarkSchemeColor,
    keyInputCursorLightSchemeColor,
    keyInputSelectionLightSchemeColor,
    keyInputSelectionLightOpacity,
    keyInputSelectionHandleLightSchemeColor,
    keyInputCursorDarkSchemeColor,
    keyInputSelectionDarkSchemeColor,
    keyInputSelectionDarkOpacity,
    keyInputSelectionHandleDarkSchemeColor,
    keyListTileSelectedSchemeColor,
    keyListTileIconSchemeColor,
    keyListTileTextSchemeColor,
    keyListTileTileSchemeColor,
    keyListTileSelectedTileSchemeColor,
    keyListTilePaddingStart,
    keyListTilePaddingEnd,
    keyListTilePaddingTop,
    keyListTilePaddingBottom,
    keyListTileHorizontalTitleGap,
    keyListTileMinVerticalPadding,
    keyListTileStyle,
    keyListTileTitleAlignment,
    keyListTileControlAffinity,
    keyAppBarStyleLight,
    keyAppBarStyleDark,
    keyAppBarOpacityLight,
    keyAppBarOpacityDark,
    keyAppBarElevationLight,
    keyAppBarElevationDark,
    keyAppBarScrolledUnderElevationLight,
    keyAppBarScrolledUnderElevationDark,
    keyAppBarTransparentStatusBar,
    keyAppBarCenterTitle,
    keyAppBarBackgroundSchemeColorLight,
    keyAppBarBackgroundSchemeColorDark,
    keyAppBarForegroundSchemeColorLight,
    keyAppBarForegroundSchemeColorDark,
    keyAppBarIconSchemeColorLight,
    keyAppBarIconSchemeColorDark,
    keyAppBarActionsIconSchemeColorLight,
    keyAppBarActionsIconSchemeColorDark,
    keyBottomAppBarElevationLight,
    keyBottomAppBarElevationDark,
    keyBottomAppBarSchemeColorLight,
    keyBottomAppBarSchemeColorDark,
    keyBottomAppBarHeight,
    keyTabBarStyle,
    keyTabBarIndicatorLight,
    keyTabBarIndicatorDark,
    keyTabBarItemSchemeColorLight,
    keyTabBarItemSchemeColorDark,
    keyTabBarUnselectedItemSchemeColorLight,
    keyTabBarUnselectedItemSchemeColorDark,
    keyTabBarUnselectedItemOpacityLight,
    keyTabBarUnselectedItemOpacityDark,
    keyTabBarIndicatorSize,
    keyTabBarIndicatorWeight,
    keyTabBarIndicatorTopRadius,
    keyTabBarDividerColor,
    keyTabBarTabAlignment,
    keyDrawerBorderRadius,
    keyDrawerElevation,
    keyDrawerBackgroundSchemeColor,
    keyDrawerWidth,
    keyDrawerIndicatorWidth,
    keyDrawerIndicatorBorderRadius,
    keyDrawerIndicatorSchemeColor,
    keyDrawerIndicatorOpacity,
    keyDrawerSelectedItemSchemeColor,
    keyDrawerUnselectedItemSchemeColor,
    keyBottomSheetSchemeColor,
    keyBottomSheetModalSchemeColor,
    keyBottomSheetElevation,
    keyBottomSheetModalElevation,
    keyBottomSheetBorderRadius,
    keySystemNavBarStyle,
    keySystemNavBarOpacity,
    keyUseSystemNavBarDivider,
    keyBottomNavigationBarBackgroundSchemeColor,
    keyBottomNavigationBarOpacity,
    keyBottomNavigationBarElevation,
    keyBottomNavigationBarSelectedItemSchemeColor,
    keyBottomNavigationBarUnselectedItemSchemeColor,
    keyBottomNavigationBarMuteUnselectedItem,
    keyBottomNavigationBarShowSelectedLabels,
    keyBottomNavigationBarShowUnselectedLabels,
    keyBottomNavigationBarSelectedLabelSize,
    keyBottomNavigationBarUnselectedLabelSize,
    keyBottomNavigationBarSelectedIconSize,
    keyBottomNavigationBarUnselectedIconSize,
    keyMenuRadius,
    keyMenuElevation,
    keyMenuOpacity,
    keyMenuPaddingStart,
    keyMenuPaddingEnd,
    keyMenuPaddingTop,
    keyMenuPaddingBottom,
    keyMenuSchemeColor,
    keyMenuBarBackgroundSchemeColor,
    keyMenuBarRadius,
    keyMenuBarElevation,
    keyMenuBarShadowColor,
    keyMenuItemBackgroundSchemeColor,
    keyMenuItemForegroundSchemeColor,
    keyMenuIndicatorBackgroundSchemeColor,
    keyMenuIndicatorForegroundSchemeColor,
    keyMenuIndicatorRadius,
    keySearchBackgroundSchemeColor,
    keySearchElevation,
    keySearchRadius,
    keySearchViewHeaderHeight,
    keySearchUseGlobalShape,
    keySearchIsFullScreen,
    keyNavigationBarBackgroundSchemeColor,
    keyNavigationBarOpacity,
    keyNavigationBarElevation,
    keyNavigationBarHeight,
    keyNavigationBarSelectedIconSchemeColor,
    keyNavigationBarSelectedLabelSchemeColor,
    keyNavigationBarUnselectedItemSchemeColor,
    keyNavigationBarMuteUnselectedItem,
    keyNavigationBarIndicatorSchemeColor,
    keyNavigationBarIndicatorOpacity,
    keyNavigationBarIndicatorBorderRadius,
    keyNavigationBarLabelBehavior,
    keyAdaptiveRemoveNavigationBarTintLight,
    keyAdaptiveRemoveNavigationBarTintDark,
    keyNavigationBarSelectedLabelSize,
    keyNavigationBarUnselectedLabelSize,
    keyNavigationBarSelectedIconSize,
    keyNavigationBarUnselectedIconSize,
    keyNavigationRailBackgroundSchemeColor,
    keyNavigationRailOpacity,
    keyNavigationRailElevation,
    keyNavigationRailSelectedIconSchemeColor,
    keyNavigationRailSelectedLabelSchemeColor,
    keyNavigationRailUnselectedItemSchemeColor,
    keyNavigationRailMuteUnselectedItem,
    keyNavigationRailLabelType,
    keyNavigationRailUseIndicator,
    keyNavigationRailIndicatorSchemeColor,
    keyNavigationRailIndicatorOpacity,
    keyNavigationRailIndicatorBorderRadius,
    keyNavigationRailSelectedLabelSize,
    keyNavigationRailUnselectedLabelSize,
    keyNavigationRailSelectedIconSize,
    keyNavigationRailUnselectedIconSize,
    keyNavigationRailGroupAlignment,
    keyNavigationRailMinWidth,
    keyNavigationRailMinExtendedWidth,
    keyTextButtonSchemeColor,
    keyTextButtonBorderRadius,
    keyFilledButtonSchemeColor,
    keyFilledButtonBorderRadius,
    keyElevatedButtonSchemeColor,
    keyElevatedButtonSecondarySchemeColor,
    keyElevatedButtonBorderRadius,
    keyOutlinedButtonSchemeColor,
    keyOutlinedButtonOutlineSchemeColor,
    keyOutlinedButtonBorderRadius,
    keyOutlinedButtonBorderWidth,
    keyOutlinedButtonPressedBorderWidth,
    keyToggleButtonsSchemeColor,
    keyToggleButtonsSelectedForegroundSchemeColor,
    keyToggleButtonsUnselectedSchemeColor,
    keyToggleButtonsBorderSchemeColor,
    keyToggleButtonsBorderRadius,
    keyToggleButtonsBorderWidth,
    keySegmentedButtonSchemeColor,
    keySegmentedButtonSelectedForegroundSchemeColor,
    keySegmentedButtonUnselectedSchemeColor,
    keySegmentedButtonUnselectedForegroundSchemeColor,
    keySegmentedButtonBorderSchemeColor,
    keySegmentedButtonBorderRadius,
    keySegmentedButtonBorderWidth,
    keyUnselectedToggleIsColored,
    keySwitchSchemeColor,
    keySwitchThumbSchemeColor,
    keySwitchThumbFixedSize,
    keySwitchAdaptiveCupertinoLike,
    keyCheckboxSchemeColor,
    keyRadioSchemeColor,
    keySliderBaseSchemeColor,
    keySliderIndicatorSchemeColor,
    keySliderValueTinted,
    keySliderValueIndicatorType,
    keySliderShowValueIndicator,
    keySliderTrackHeight,
    keyFloatingActionButtonUseShape,
    keyFloatingActionButtonAlwaysCircular,
    keyFloatingActionButtonBorderRadius,
    keyFloatingActionButtonSchemeColor,
    keyFloatingActionButtonForegroundSchemeColor,
    keyChipSchemeColor,
    keyChipSelectedSchemeColor,
    keyChipSecondarySelectedSchemeColor,
    keyChipDeleteIconSchemeColor,
    keyChipBlendColors,
    keyChipBorderRadius,
    keyChipFontSize,
    keyChipIconSize,
    keyChipPaddingStart,
    keyChipPaddingEnd,
    keyChipPaddingTop,
    keyChipPaddingBottom,
    keySnackBarBorderRadius,
    keySnackBarElevation,
    keySnackBarSchemeColor,
    keySnackBarActionSchemeColor,
    keyPopupMenuSchemeColor,
    keyPopupMenuOpacity,
    keyPopupMenuBorderRadius,
    keyPopupMenuElevation,
    keyAlignedDropdown,
    keyCardBorderRadius,
    keyDialogBackgroundLightSchemeColor,
    keyDialogBackgroundDarkSchemeColor,
    keyDatePickerHeaderBackgroundSchemeColor,
    keyDatePickerHeaderForegroundSchemeColor,
    keyDatePickerDividerSchemeColor,
    keyUseInputDecoratorThemeInDialogs,
    keyDialogBorderRadius,
    keyDialogBorderRadiusAdaptive,
    keyAdaptiveResponseDialogRadius,
    keyTimePickerDialogBorderRadius,
    keyDatePickerDialogBorderRadius,
    keyTimePickerElementRadius,
    keyDialogElevation,
    keyTooltipRadius,
    keyTooltipWaitDuration,
    keyTooltipShowDuration,
    keyTooltipSchemeColor,
    keyTooltipOpacity,
    keySurfaceTintLight,
    keySurfaceTintLightSchemeColor,
    keySurfaceTintDark,
    keySurfaceTintDarkSchemeColor,
    keyCustomUsesDarkColorsForSeed,
    keyCustomPrimaryLight,
    keyCustomPrimaryLightRef,
    keyCustomPrimaryContainerLight,
    keyCustomSecondaryLight,
    keyCustomSecondaryLightRef,
    keyCustomSecondaryContainerLight,
    keyCustomTertiaryLight,
    keyCustomTertiaryLightRef,
    keyCustomTertiaryContainerLight,
    keyCustomErrorLight,
    keyCustomErrorContainerLight,
    keyCustomPrimaryDark,
    keyCustomPrimaryDarkRef,
    keyCustomPrimaryContainerDark,
    keyCustomSecondaryDark,
    keyCustomSecondaryDarkRef,
    keyCustomSecondaryContainerDark,
    keyCustomTertiaryDark,
    keyCustomTertiaryDarkRef,
    keyCustomTertiaryContainerDark,
    keyCustomErrorDark,
    keyCustomErrorContainerDark,
  ];
}
