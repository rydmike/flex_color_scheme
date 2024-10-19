import 'dart:async';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../const/store.dart';
import '../model/adaptive_response.dart';
import '../model/splash_type_enum.dart';
import '../model/visual_density_enum.dart';
import '../services/theme_service.dart';

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
    _usedVisualDensity = await _themeService.load(
        Store.keyUsedVisualDensity, Store.defaultUsedVisualDensity);
    _tapTargetSize = await _themeService.load(
        Store.keyTapTargetSize, Store.defaultTapTargetSize);
    _useFlexColorScheme = await _themeService.load(
        Store.keyUseFlexColorScheme, Store.defaultUseFlexColorScheme);
    _useSubThemes = await _themeService.load(
        Store.keyUseSubThemes, Store.defaultUseSubThemes);
    _codeForFile = await _themeService.load(
        Store.keyCodeForFile, Store.defaultCodeForFile);
    _applyThemeToAllCupertino = await _themeService.load(
        Store.keyApplyThemeToAllCupertino,
        Store.defaultApplyThemeToAllCupertino);
    //
    _adaptiveRemoveElevationTintLight = await _themeService.load(
        Store.keyAdaptiveRemoveElevationTintLight,
        Store.defaultAdaptiveRemoveElevationTintLight);
    _adaptiveElevationShadowsBackLight = await _themeService.load(
        Store.keyAdaptiveElevationShadowsBackLight,
        Store.defaultAdaptiveElevationShadowsBackLight);
    _adaptiveAppBarScrollUnderOffLight = await _themeService.load(
        Store.keyAdaptiveAppBarScrollUnderOffLight,
        Store.defaultAdaptiveAppBarScrollUnderOffLight);
    _adaptiveRemoveElevationTintDark = await _themeService.load(
        Store.keyAdaptiveRemoveElevationTintDark,
        Store.defaultAdaptiveRemoveElevationTintDark);
    _adaptiveElevationShadowsBackDark = await _themeService.load(
        Store.keyAdaptiveElevationShadowsBackDark,
        Store.defaultAdaptiveElevationShadowsBackDark);
    _adaptiveAppBarScrollUnderOffDark = await _themeService.load(
        Store.keyAdaptiveAppBarScrollUnderOffDark,
        Store.defaultAdaptiveAppBarScrollUnderOffDark);
    _adaptiveResponseRadius = await _themeService.load(
        Store.keyAdaptiveRadius, Store.defaultAdaptiveRadius);
    //
    _adaptiveResponseSplash = await _themeService.load(
        Store.keyAdaptiveSplash, Store.defaultAdaptiveSplash);
    _splashType =
        await _themeService.load(Store.keySplashType, Store.defaultSplashType);
    _splashTypeAdaptive = await _themeService.load(
        Store.keySplashTypeAdaptive, Store.defaultSplashTypeAdaptive);
    //
    _compactMode = await _themeService.load(
        Store.keyCompactMode, Store.defaultCompactMode);
    _verticalMode = await _themeService.load(
        Store.keyVerticalMode, Store.defaultVerticalMode);
    _confirmPremade = await _themeService.load(
        Store.keyConfirmPremade, Store.defaultConfirmPremade);
    _viewIndex =
        await _themeService.load(Store.keyViewIndex, Store.defaultViewIndex);
    _sideViewIndex = await _themeService.load(
        Store.keySideViewIndex, Store.defaultSideViewIndex);
    _simulatorDeviceIndex = await _themeService.load(
        Store.keySimulatorDeviceIndex, Store.defaultSimulatorDeviceIndex);
    _simulatorAppIndex = await _themeService.load(
        Store.keySimulatorAppIndex, Store.defaultSimulatorAppIndex);
    _simulatorComponentsIndex = await _themeService.load(
        Store.keySimulatorComponentsIndex,
        Store.defaultSimulatorComponentsIndex);
    _deviceSize =
        await _themeService.load(Store.keyDeviceSize, Store.defaultDeviceSize);
    _showSchemeInput = await _themeService.load(
        Store.keyShowSchemeInput, Store.defaultShowSchemeInput);
    //
    _useMaterial3Typography = await _themeService.load(
        Store.keyUseMaterial3Typography, Store.defaultUseMaterial3Typography);
    _useM2StyleDividerInM3 = await _themeService.load(
        Store.keyUseM2StyleDividerInM3, Store.defaultUseM2StyleDividerInM3);
    _useAppFont =
        await _themeService.load(Store.keyUseAppFont, Store.defaultUseAppFont);
    _usedScheme =
        await _themeService.load(Store.keyUsedScheme, Store.defaultUsedScheme);
    _schemeIndex = await _themeService.load(
        Store.keySchemeIndex, Store.defaultSchemeIndex);
    _interactionEffects = await _themeService.load(
        Store.keyInteractionEffects, Store.defaultInteractionEffects);
    _tintedDisabledControls = await _themeService.load(
        Store.keyTintedDisabledControls, Store.defaultTintedDisabledControls);
    _defaultRadius = await _themeService.load(
        Store.keyDefaultRadius, Store.defaultDefaultRadius);
    _defaultRadiusAdaptive = await _themeService.load(
        Store.keyDefaultRadiusAdaptive, Store.defaultDefaultRadiusAdaptive);
    _thinBorderWidth = await _themeService.load(
      Store.keyThinBorderWidth,
      Store.defaultThinBorderWidth,
    );
    _thickBorderWidth = await _themeService.load(
      Store.keyThickBorderWidth,
      Store.defaultThickBorderWidth,
    );
    _tooltipsMatchBackground = await _themeService.load(
        Store.keyTooltipsMatchBackground, Store.defaultTooltipsMatchBackground);
    //
    // Surface and blend SETTINGS.
    _scaffoldBackgroundLightBaseColor = await _themeService.load(
        Store.keyScaffoldBackgroundLightBaseColor,
        Store.defaultScaffoldBackgroundLightBaseColor);
    _scaffoldBackgroundDarkBaseColor = await _themeService.load(
        Store.keyScaffoldBackgroundDarkBaseColor,
        Store.defaultScaffoldBackgroundDarkBaseColor);
    _scaffoldBackgroundLightSchemeColor = await _themeService.load(
        Store.keyScaffoldBackgroundLightSchemeColor,
        Store.defaultScaffoldBackgroundLightSchemeColor);
    _scaffoldBackgroundDarkSchemeColor = await _themeService.load(
        Store.keyScaffoldBackgroundDarkSchemeColor,
        Store.defaultScaffoldBackgroundDarkSchemeColor);
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
    _swapLegacyColors = await _themeService.load(
        Store.keySwapLegacyColors, Store.defaultSwapLegacyColors);
    _swapLightColors = await _themeService.load(
        Store.keySwapLightColors, Store.defaultSwapLightColors);
    _swapDarkColors = await _themeService.load(
        Store.keySwapDarkColors, Store.defaultSwapDarkColors);
    _lightIsWhite = await _themeService.load(
        Store.keyLightIsWhite, Store.defaultLightIsWhite);
    _darkIsTrueBlack = await _themeService.load(
        Store.keyDarkIsTrueBlack, Store.defaultDarkIsTrueBlack);
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
    // TODO(rydmike): Commented as part of blendTextTheme deprecation.
    // _blendLightTextTheme = await _themeService.load(
    //     Store.keyBlendLightTextTheme, Store.defaultBlendLightTextTheme);
    // _blendDarkTextTheme = await _themeService.load(
    //     Store.keyBlendDarkTextTheme, Store.defaultBlendDarkTextTheme);
    //
    // Material 3 and Seed ColorScheme SETTINGS.
    _useMaterial3 = await _themeService.load(
        Store.keyUseMaterial3, Store.defaultUseMaterial3);
    _fixedColorStyle = await _themeService.load(
        Store.keyFixedColorStyle, Store.defaultFixedColorStyle);
    _useKeyColors = await _themeService.load(
        Store.keyUseKeyColors, Store.defaultUseKeyColors);
    _useSecondary = await _themeService.load(
        Store.keyUseSecondary, Store.defaultUseSecondary);
    _useTertiary = await _themeService.load(
        Store.keyUseTertiary, Store.defaultUseTertiary);
    _useError =
        await _themeService.load(Store.keyUseError, Store.defaultUseError);
    _keepPrimary = await _themeService.load(
        Store.keyKeepPrimary, Store.defaultKeepPrimary);
    _keepSecondary = await _themeService.load(
        Store.keyKeepSecondary, Store.defaultKeepSecondary);
    _keepTertiary = await _themeService.load(
        Store.keyKeepTertiary, Store.defaultKeepTertiary);
    _keepError =
        await _themeService.load(Store.keyKeepError, Store.defaultKeepError);
    _keepPrimaryContainer = await _themeService.load(
        Store.keyKeepPrimaryContainer, Store.defaultKeepPrimaryContainer);
    _keepSecondaryContainer = await _themeService.load(
        Store.keyKeepSecondaryContainer, Store.defaultKeepSecondaryContainer);
    _keepTertiaryContainer = await _themeService.load(
        Store.keyKeepTertiaryContainer, Store.defaultKeepTertiaryContainer);
    _keepErrorContainer = await _themeService.load(
        Store.keyKeepErrorContainer, Store.defaultKeepErrorContainer);
    _keepDarkPrimary = await _themeService.load(
        Store.keyKeepDarkPrimary, Store.defaultKeepDarkPrimary);
    _keepDarkSecondary = await _themeService.load(
        Store.keyKeepDarkSecondary, Store.defaultKeepDarkSecondary);
    _keepDarkTertiary = await _themeService.load(
        Store.keyKeepDarkTertiary, Store.defaultKeepDarkTertiary);
    _keepDarkError = await _themeService.load(
        Store.keyKeepDarkError, Store.defaultKeepDarkError);
    _keepDarkPrimaryContainer = await _themeService.load(
        Store.keyKeepDarkPrimaryContainer,
        Store.defaultKeepDarkPrimaryContainer);
    _keepDarkSecondaryContainer = await _themeService.load(
        Store.keyKeepDarkSecondaryContainer,
        Store.defaultKeepDarkSecondaryContainer);
    _keepDarkTertiaryContainer = await _themeService.load(
        Store.keyKeepDarkTertiaryContainer,
        Store.defaultKeepDarkTertiaryContainer);
    _keepDarkErrorContainer = await _themeService.load(
        Store.keyKeepDarkErrorContainer, Store.defaultKeepDarkErrorContainer);
    _usedFlexToneSetup = await _themeService.load(
        Store.keyUsedFlexToneSetup, Store.defaultUsedFlexToneSetup);
    _useM3ErrorColors = await _themeService.load(
        Store.keyUseM3ErrorColors, Store.defaultUseM3ErrorColors);
    //
    _useMonoSurfacesLight = await _themeService.load(
        Store.keyUseMonoSurfacesLight, Store.defaultUseMonoSurfacesLight);
    _useMonoSurfacesDark = await _themeService.load(
        Store.keyUseMonoSurfacesDark, Store.defaultUseMonoSurfacesDark);
    _onMainsUseBWLight = await _themeService.load(
        Store.keyOnMainsUseBWLight, Store.defaultOnMainsUseBWLight);
    _onMainsUseBWDark = await _themeService.load(
        Store.keyOnMainsUseBWDark, Store.defaultOnMainsUseBWDark);
    _onSurfacesUseBWLight = await _themeService.load(
        Store.keyOnSurfacesUseBWLight, Store.defaultOnSurfacesUseBWLight);
    _onSurfacesUseBWDark = await _themeService.load(
        Store.keyOnSurfacesUseBWDark, Store.defaultOnSurfacesUseBWDark);
    _surfacesUseBWLight = await _themeService.load(
        Store.keySurfacesUseBWLight, Store.defaultSurfacesUseBWLight);
    _surfacesUseBWDark = await _themeService.load(
        Store.keySurfacesUseBWDark, Store.defaultSurfacesUseBWDark);
    _higherContrastFixed = await _themeService.load(
        Store.keyHigherContrastFixed, Store.defaultHigherContrastFixed);
    _expressiveOnContainer = await _themeService.load(
        Store.keyExpressiveOnContainer, Store.defaultExpressiveOnContainer);
    _useLegacyMonochromeSeedBehavior = await _themeService.load(
        Store.keyUseLegacyMonochromeSeedBehavior,
        Store.defaultUseLegacyMonochromeSeedBehavior);
    _dynamicContrastLevel = await _themeService.load(
        Store.keyDynamicContrastLevel, Store.defaultDynamicContrastLevel);
    //
    // InputDecorator SETTINGS.
    _inputDecoratorSchemeColorLight = await _themeService.load(
        Store.keyInputDecoratorSchemeColorLight,
        Store.defaultInputDecoratorSchemeColorLight);
    _inputDecoratorSchemeColorDark = await _themeService.load(
        Store.keyInputDecoratorSchemeColorDark,
        Store.defaultInputDecoratorSchemeColorDark);
    _inputDecoratorBorderSchemeColorLight = await _themeService.load(
        Store.keyInputDecoratorBorderSchemeColorLight,
        Store.defaultInputDecoratorBorderSchemeColorLight);
    _inputDecoratorBorderSchemeColorDark = await _themeService.load(
        Store.keyInputDecoratorBorderSchemeColorDark,
        Store.defaultInputDecoratorBorderSchemeColorDark);
    //
    _inputDecoratorIsFilled = await _themeService.load(
        Store.keyInputDecoratorIsFilled, Store.defaultInputDecoratorIsFilled);
    _inputDecoratorIsDense = await _themeService.load(
        Store.keyInputDecoratorIsDense, Store.defaultInputDecoratorIsDense);
    //
    _inputDecoratorPaddingStart = await _themeService.load(
        Store.keyInputDecoratorPaddingStart,
        Store.defaultInputDecoratorPaddingStart);
    _inputDecoratorPaddingEnd = await _themeService.load(
        Store.keyInputDecoratorPaddingEnd,
        Store.defaultInputDecoratorPaddingEnd);
    _inputDecoratorPaddingTop = await _themeService.load(
        Store.keyInputDecoratorPaddingTop,
        Store.defaultInputDecoratorPaddingTop);
    _inputDecoratorPaddingBottom = await _themeService.load(
        Store.keyInputDecoratorPaddingBottom,
        Store.defaultInputDecoratorPaddingBottom);
    //
    _inputDecoratorBackgroundAlphaLight = await _themeService.load(
        Store.keyInputDecoratorBackgroundAlphaLight,
        Store.defaultInputDecoratorBackgroundAlphaLight);
    _inputDecoratorBackgroundAlphaDark = await _themeService.load(
        Store.keyInputDecoratorBackgroundAlphaDark,
        Store.defaultInputDecoratorBackgroundAlphaDark);
    _inputDecoratorBorderType = await _themeService.load(
        Store.keyInputDecoratorBorderType,
        Store.defaultInputDecoratorBorderType);
    _inputDecoratorBorderRadius = await _themeService.load(
        Store.keyInputDecoratorBorderRadius,
        Store.defaultInputDecoratorBorderRadius);
    _inputDecoratorBorderRadiusAdaptive = await _themeService.load(
        Store.keyInputDecoratorBorderRadiusAdaptive,
        Store.defaultInputDecoratorBorderRadius);
    _adaptiveResponseInputDecoratorRadius = await _themeService.load(
        Store.keyAdaptiveResponseInputDecoratorRadius,
        Store.defaultAdaptiveResponseInputDecoratorRadius);
    _inputDecoratorUnfocusedHasBorder = await _themeService.load(
        Store.keyInputDecoratorUnfocusedHasBorder,
        Store.defaultInputDecoratorUnfocusedHasBorder);
    _inputDecoratorFocusedHasBorder = await _themeService.load(
        Store.keyInputDecoratorFocusedHasBorder,
        Store.defaultInputDecoratorFocusedHasBorder);
    _inputDecoratorUnfocusedBorderIsColored = await _themeService.load(
        Store.keyInputDecoratorUnfocusedBorderIsColored,
        Store.defaultInputDecoratorUnfocusedBorderIsColored);
    _inputDecoratorBorderWidth = await _themeService.load(
        Store.keyInputDecoratorBorderWidth,
        Store.defaultInputDecoratorBorderWidth);
    _inputDecoratorFocusedBorderWidth = await _themeService.load(
        Store.keyInputDecoratorFocusedBorderWidth,
        Store.defaultInputDecoratorFocusedBorderWidth);
    _inputDecoratorPrefixIconSchemeColor = await _themeService.load(
        Store.keyInputDecoratorPrefixIconSchemeColor,
        Store.defaultInputDecoratorPrefixIconSchemeColor);
    _inputDecoratorPrefixIconDarkSchemeColor = await _themeService.load(
        Store.keyInputDecoratorPrefixIconDarkSchemeColor,
        Store.defaultInputDecoratorPrefixIconDarkSchemeColor);
    _inputDecoratorSuffixIconSchemeColor = await _themeService.load(
        Store.keyInputDecoratorSuffixIconSchemeColor,
        Store.defaultInputDecoratorSuffixIconSchemeColor);
    _inputDecoratorSuffixIconDarkSchemeColor = await _themeService.load(
        Store.keyInputDecoratorSuffixIconDarkSchemeColor,
        Store.defaultInputDecoratorSuffixIconDarkSchemeColor);
    //
    // TextSelection SETTINGS.
    _inputCursorLightSchemeColor = await _themeService.load(
        Store.keyInputCursorLightSchemeColor,
        Store.defaultInputCursorLightSchemeColor);
    _inputSelectionLightSchemeColor = await _themeService.load(
        Store.keyInputSelectionLightSchemeColor,
        Store.defaultInputSelectionLightSchemeColor);
    _inputSelectionLightOpacity = await _themeService.load(
        Store.keyInputSelectionLightOpacity,
        Store.defaultInputSelectionLightOpacity);
    _inputSelectionHandleLightSchemeColor = await _themeService.load(
        Store.keyInputSelectionHandleLightSchemeColor,
        Store.defaultInputSelectionHandleLightSchemeColor);
    //
    _inputCursorDarkSchemeColor = await _themeService.load(
        Store.keyInputCursorDarkSchemeColor,
        Store.defaultInputCursorDarkSchemeColor);
    _inputSelectionDarkSchemeColor = await _themeService.load(
        Store.keyInputSelectionDarkSchemeColor,
        Store.defaultInputSelectionDarkSchemeColor);
    _inputSelectionDarkOpacity = await _themeService.load(
        Store.keyInputSelectionDarkOpacity,
        Store.defaultInputSelectionDarkOpacity);
    _inputSelectionHandleDarkSchemeColor = await _themeService.load(
        Store.keyInputSelectionHandleDarkSchemeColor,
        Store.defaultInputSelectionHandleDarkSchemeColor);
    //
    // ListTile SETTINGS.
    //
    _listTileSelectedSchemeColor = await _themeService.load(
        Store.keyListTileSelectedSchemeColor,
        Store.defaultListTileSelectedSchemeColor);
    _listTileIconSchemeColor = await _themeService.load(
        Store.keyListTileIconSchemeColor, Store.defaultListTileIconSchemeColor);
    _listTileTextSchemeColor = await _themeService.load(
        Store.keyListTileTextSchemeColor, Store.defaultListTileTextSchemeColor);
    _listTileTileSchemeColor = await _themeService.load(
        Store.keyListTileTileSchemeColor, Store.defaultListTileTileSchemeColor);
    _listTileSelectedTileSchemeColor = await _themeService.load(
        Store.keyListTileSelectedTileSchemeColor,
        Store.defaultListTileSelectedTileSchemeColor);
    _listTilePaddingStart = await _themeService.load(
        Store.keyListTilePaddingStart, Store.defaultListTilePaddingStart);
    _listTilePaddingEnd = await _themeService.load(
        Store.keyListTilePaddingEnd, Store.defaultListTilePaddingEnd);
    _listTilePaddingTop = await _themeService.load(
        Store.keyListTilePaddingTop, Store.defaultListTilePaddingTop);
    _listTilePaddingBottom = await _themeService.load(
        Store.keyListTilePaddingBottom, Store.defaultListTilePaddingBottom);
    _listTileHorizontalTitleGap = await _themeService.load(
        Store.keyListTileHorizontalTitleGap,
        Store.defaultListTileHorizontalTitleGap);
    _listTileMinVerticalPadding = await _themeService.load(
        Store.keyListTileMinVerticalPadding,
        Store.defaultListTileMinVerticalPadding);
    _listTileStyle = await _themeService.load(
        Store.keyListTileStyle, Store.defaultListTileStyle);
    _listTileTitleAlignment = await _themeService.load(
        Store.keyListTileTitleAlignment, Store.defaultListTileTitleAlignment);
    _listTileControlAffinity = await _themeService.load(
        Store.keyListTileControlAffinity, Store.defaultListTileControlAffinity);
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
    _appBarScrolledUnderElevationLight = await _themeService.load(
        Store.keyAppBarScrolledUnderElevationLight,
        Store.defaultAppBarScrolledUnderElevationLight);
    _appBarScrolledUnderElevationDark = await _themeService.load(
        Store.keyAppBarScrolledUnderElevationDark,
        Store.defaultAppBarScrolledUnderElevationDark);
    _transparentStatusBar = await _themeService.load(
        Store.keyTransparentStatusBar, Store.defaultTransparentStatusBar);
    _appBarCenterTitle = await _themeService.load(
        Store.keyAppBarCenterTitle, Store.defaultAppBarCenterTitle);

    _appBarBackgroundSchemeColorLight = await _themeService.load(
        Store.keyAppBarBackgroundSchemeColorLight,
        Store.defaultAppBarBackgroundSchemeColorLight);
    _appBarBackgroundSchemeColorDark = await _themeService.load(
        Store.keyAppBarBackgroundSchemeColorDark,
        Store.defaultAppBarBackgroundSchemeColorDark);

    _appBarForegroundSchemeColorLight = await _themeService.load(
        Store.keyAppBarForegroundSchemeColorLight,
        Store.defaultAppBarForegroundSchemeColorLight);
    _appBarForegroundSchemeColorDark = await _themeService.load(
        Store.keyAppBarForegroundSchemeColorDark,
        Store.defaultAppBarForegroundSchemeColorDark);

    _appBarIconSchemeColorLight = await _themeService.load(
        Store.keyAppBarIconSchemeColorLight,
        Store.defaultAppBarIconSchemeColorLight);
    _appBarIconSchemeColorDark = await _themeService.load(
        Store.keyAppBarIconSchemeColorDark,
        Store.defaultAppBarIconSchemeColorDark);
    _appBarActionsIconSchemeColorLight = await _themeService.load(
        Store.keyAppBarActionsIconSchemeColorLight,
        Store.defaultAppBarActionsIconSchemeColorLight);
    _appBarActionsIconSchemeColorDark = await _themeService.load(
        Store.keyAppBarActionsIconSchemeColorDark,
        Store.defaultAppBarActionsIconSchemeColorDark);
    //
    // BottomAppBar SETTINGS.
    _bottomAppBarElevationLight = await _themeService.load(
        Store.keyBottomAppBarElevationLight,
        Store.defaultBottomAppBarElevationLight);
    _bottomAppBarElevationDark = await _themeService.load(
        Store.keyBottomAppBarElevationDark,
        Store.defaultBottomAppBarElevationDark);

    _bottomAppBarSchemeColorLight = await _themeService.load(
        Store.keyBottomAppBarSchemeColorLight,
        Store.defaultBottomAppBarSchemeColorLight);
    _bottomAppBarSchemeColorDark = await _themeService.load(
        Store.keyBottomAppBarSchemeColorDark,
        Store.defaultBottomAppBarSchemeColorDark);
    _bottomAppBarHeight = await _themeService.load(
        Store.keyBottomAppBarHeight, Store.defaultBottomAppBarHeight);
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
    _tabBarUnselectedItemSchemeColorLight = await _themeService.load(
        Store.keyTabBarUnselectedItemSchemeColorLight,
        Store.defaultTabBarUnselectedItemSchemeColorLight);
    _tabBarUnselectedItemSchemeColorDark = await _themeService.load(
        Store.keyTabBarUnselectedItemSchemeColorDark,
        Store.defaultTabBarUnselectedItemSchemeColorDark);
    _tabBarUnselectedItemOpacityLight = await _themeService.load(
        Store.keyTabBarUnselectedItemOpacityLight,
        Store.defaultTabBarUnselectedItemOpacityLight);
    _tabBarUnselectedItemOpacityDark = await _themeService.load(
        Store.keyTabBarUnselectedItemOpacityDark,
        Store.defaultTabBarUnselectedItemOpacityDark);
    _tabBarIndicatorSize = await _themeService.load(
        Store.keyTabBarIndicatorSize, Store.defaultTabBarIndicatorSize);
    _tabBarIndicatorWeight = await _themeService.load(
        Store.keyTabBarIndicatorWeight, Store.defaultTabBarIndicatorWeight);
    _tabBarIndicatorTopRadius = await _themeService.load(
        Store.keyTabBarIndicatorTopRadius,
        Store.defaultTabBarIndicatorTopRadius);
    _tabBarDividerColor = await _themeService.load(
        Store.keyTabBarDividerColor, Store.defaultTabBarDividerColor);
    _tabBarTabAlignment = await _themeService.load(
        Store.keyTabBarTabAlignment, Store.defaultTabBarTabAlignment);
    //
    // Drawer SETTINGS.
    _drawerBorderRadius = await _themeService.load(
        Store.keyDrawerBorderRadius, Store.defaultDrawerBorderRadius);
    _drawerElevation = await _themeService.load(
        Store.keyDrawerElevation, Store.defaultDrawerElevation);
    _drawerBackgroundSchemeColor = await _themeService.load(
        Store.keyDrawerBackgroundSchemeColor,
        Store.defaultDrawerBackgroundSchemeColor);
    _drawerWidth = await _themeService.load(
        Store.keyDrawerWidth, Store.defaultDrawerWidth);
    _drawerIndicatorWidth = await _themeService.load(
        Store.keyDrawerIndicatorWidth, Store.defaultDrawerIndicatorWidth);
    _drawerIndicatorBorderRadius = await _themeService.load(
        Store.keyDrawerIndicatorBorderRadius,
        Store.defaultDrawerIndicatorBorderRadius);
    _drawerIndicatorSchemeColor = await _themeService.load(
        Store.keyDrawerIndicatorSchemeColor,
        Store.defaultDrawerIndicatorSchemeColor);
    _drawerIndicatorOpacity = await _themeService.load(
        Store.keyDrawerIndicatorOpacity, Store.defaultDrawerIndicatorOpacity);
    _drawerSelectedItemSchemeColor = await _themeService.load(
        Store.keyDrawerSelectedItemSchemeColor,
        Store.defaultDrawerSelectedItemSchemeColor);
    _drawerUnselectedItemSchemeColor = await _themeService.load(
        Store.keyDrawerUnselectedItemSchemeColor,
        Store.defaultDrawerUnselectedItemSchemeColor);
    //
    // BottomSheet SETTINGS.
    _bottomSheetSchemeColor = await _themeService.load(
        Store.keyBottomSheetSchemeColor, Store.defaultBottomSheetSchemeColor);
    _bottomSheetElevation = await _themeService.load(
        Store.keyBottomSheetElevation, Store.defaultBottomSheetElevation);
    _bottomSheetModalSchemeColor = await _themeService.load(
        Store.keyBottomSheetModalSchemeColor,
        Store.defaultBottomSheetModalSchemeColor);
    _bottomSheetModalElevation = await _themeService.load(
        Store.keyBottomSheetModalElevation,
        Store.defaultBottomSheetModalElevation);
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
    _bottomNavigationBarSelectedLabelSize = await _themeService.load(
        Store.keyBottomNavigationBarSelectedLabelSize,
        Store.defaultBottomNavigationBarSelectedLabelSize);
    _bottomNavigationBarUnselectedLabelSize = await _themeService.load(
        Store.keyBottomNavigationBarUnselectedLabelSize,
        Store.defaultBottomNavigationBarUnselectedLabelSize);
    _bottomNavigationBarSelectedIconSize = await _themeService.load(
        Store.keyBottomNavigationBarSelectedIconSize,
        Store.defaultBottomNavigationBarSelectedIconSize);
    _bottomNavigationBarUnselectedIconSize = await _themeService.load(
        Store.keyBottomNavigationBarUnselectedIconSize,
        Store.defaultBottomNavigationBarUnselectedIconSize);
    //
    // Menu, MenuBar and MenuButton SETTINGS.
    _menuRadius =
        await _themeService.load(Store.keyMenuRadius, Store.defaultMenuRadius);
    _menuElevation = await _themeService.load(
        Store.keyMenuElevation, Store.defaultMenuElevation);
    _menuOpacity = await _themeService.load(
        Store.keyMenuOpacity, Store.defaultMenuOpacity);
    _menuPaddingStart = await _themeService.load(
        Store.keyMenuPaddingStart, Store.defaultMenuPaddingStart);
    _menuPaddingEnd = await _themeService.load(
        Store.keyMenuPaddingEnd, Store.defaultMenuPaddingEnd);
    _menuPaddingTop = await _themeService.load(
        Store.keyMenuPaddingTop, Store.defaultMenuPaddingTop);
    _menuPaddingBottom = await _themeService.load(
        Store.keyMenuPaddingBottom, Store.defaultMenuPaddingBottom);
    _menuSchemeColor = await _themeService.load(
        Store.keyMenuSchemeColor, Store.defaultMenuSchemeColor);
    //
    _menuBarBackgroundSchemeColor = await _themeService.load(
        Store.keyMenuBarBackgroundSchemeColor,
        Store.defaultMenuBarBackgroundSchemeColor);
    _menuBarRadius = await _themeService.load(
        Store.keyMenuBarRadius, Store.defaultMenuBarRadius);
    _menuBarElevation = await _themeService.load(
        Store.keyMenuBarElevation, Store.defaultMenuBarElevation);
    _menuBarShadowColor = await _themeService.load(
        Store.keyMenuBarShadowColor, Store.defaultMenuBarShadowColor);
    //
    _menuItemBackgroundSchemeColor = await _themeService.load(
        Store.keyMenuItemBackgroundSchemeColor,
        Store.defaultMenuItemBackgroundSchemeColor);
    _menuItemForegroundSchemeColor = await _themeService.load(
        Store.keyMenuItemForegroundSchemeColor,
        Store.defaultMenuItemForegroundSchemeColor);
    _menuIndicatorBackgroundSchemeColor = await _themeService.load(
        Store.keyMenuIndicatorBackgroundSchemeColor,
        Store.defaultMenuIndicatorBackgroundSchemeColor);
    _menuIndicatorForegroundSchemeColor = await _themeService.load(
        Store.keyMenuIndicatorForegroundSchemeColor,
        Store.defaultMenuIndicatorForegroundSchemeColor);
    _menuIndicatorRadius = await _themeService.load(
        Store.keyMenuIndicatorRadius, Store.defaultMenuIndicatorRadius);
    //
    // SearchView and SearchBar SETTINGS.
    _searchBackgroundSchemeColor = await _themeService.load(
        Store.keySearchBackgroundSchemeColor,
        Store.defaultSearchBackgroundSchemeColor);
    _searchElevation = await _themeService.load(
        Store.keySearchElevation, Store.defaultSearchElevation);
    _searchRadius = await _themeService.load(
        Store.keySearchRadius, Store.defaultSearchRadius);
    _searchViewHeaderHeight = await _themeService.load(
        Store.keySearchViewHeaderHeight, Store.defaultSearchViewHeaderHeight);
    _searchUseGlobalShape = await _themeService.load(
        Store.keySearchUseGlobalShape, Store.defaultSearchUseGlobalShape);
    _searchIsFullScreen = await _themeService.load(
        Store.keySearchIsFullScreen, Store.defaultSearchIsFullScreen);
    //
    // NavigationBar SETTINGS.
    _navBarBackgroundSchemeColor = await _themeService.load(
        Store.keyNavBarBackgroundSchemeColor,
        Store.defaultNavBarBackgroundSchemeColor);
    _navBarOpacity = await _themeService.load(
        Store.keyNavBarOpacity, Store.defaultNavBarOpacity);
    _navBarOpacity = null;
    _navBarElevation = await _themeService.load(
        Store.keyNavBarElevation, Store.defaultNavigationBarElevation);
    _navBarHeight = await _themeService.load(
        Store.keyNavBarHeight, Store.defaultNavBarHeight);
    _navBarSelectedIconSchemeColor = await _themeService.load(
        Store.keyNavBarSelectedIconSchemeColor,
        Store.defaultNavBarSelectedIconSchemeColor);
    _navBarSelectedLabelSchemeColor = await _themeService.load(
        Store.keyNavBarSelectedLabelSchemeColor,
        Store.defaultNavBarSelectedLabelSchemeColor);
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
    _navBarIndicatorBorderRadius = await _themeService.load(
        Store.keyNavBarIndicatorBorderRadius,
        Store.defaultNavBarIndicatorBorderRadius);
    _navBarLabelBehavior = await _themeService.load(
        Store.keyNavBarLabelBehavior, Store.defaultNavBarLabelBehavior);
    _adaptiveRemoveNavigationBarTintLight = await _themeService.load(
        Store.keyAdaptiveRemoveNavigationBarTintLight,
        Store.defaultAdaptiveRemoveNavigationBarTintLight);
    _adaptiveRemoveNavigationBarTintDark = await _themeService.load(
        Store.keyAdaptiveRemoveNavigationBarTintDark,
        Store.defaultAdaptiveRemoveNavigationBarTintDark);
    _navigationBarSelectedLabelSize = await _themeService.load(
        Store.keyNavigationBarSelectedLabelSize,
        Store.defaultNavigationBarSelectedLabelSize);
    _navigationBarUnselectedLabelSize = await _themeService.load(
        Store.keyNavigationBarUnselectedLabelSize,
        Store.defaultNavigationBarUnselectedLabelSize);
    _navigationBarSelectedIconSize = await _themeService.load(
        Store.keyNavigationBarSelectedIconSize,
        Store.defaultNavigationBarSelectedIconSize);
    _navigationBarUnselectedIconSize = await _themeService.load(
        Store.keyNavigationBarUnselectedIconSize,
        Store.defaultNavigationBarUnselectedIconSize);
    //
    // NavigationRail SETTINGS.
    _navRailBackgroundSchemeColor = await _themeService.load(
        Store.keyNavRailBackgroundSchemeColor,
        Store.defaultNavRailBackgroundSchemeColor);
    _navRailOpacity = await _themeService.load(
        Store.keyNavRailOpacity, Store.defaultNavRailOpacity);
    _navRailElevation = await _themeService.load(
        Store.keyNavRailElevation, Store.defaultNavRailElevation);
    _navRailSelectedIconSchemeColor = await _themeService.load(
        Store.keyNavRailSelectedIconSchemeColor,
        Store.defaultNavRailSelectedIconSchemeColor);
    _navRailSelectedLabelSchemeColor = await _themeService.load(
        Store.keyNavRailSelectedLabelSchemeColor,
        Store.defaultNavRailSelectedLabelSchemeColor);
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
    _navRailIndicatorBorderRadius = await _themeService.load(
        Store.keyNavRailIndicatorBorderRadius,
        Store.defaultNavRailIndicatorBorderRadius);
    _navigationRailSelectedLabelSize = await _themeService.load(
        Store.keyNavigationRailSelectedLabelSize,
        Store.defaultNavigationRailSelectedLabelSize);
    _navigationRailUnselectedLabelSize = await _themeService.load(
        Store.keyNavigationRailUnselectedLabelSize,
        Store.defaultNavigationRailUnselectedLabelSize);
    _navigationRailSelectedIconSize = await _themeService.load(
        Store.keyNavigationRailSelectedIconSize,
        Store.defaultNavigationRailSelectedIconSize);
    _navigationRailUnselectedIconSize = await _themeService.load(
        Store.keyNavigationRailUnselectedIconSize,
        Store.defaultNavigationRailUnselectedIconSize);
    _navigationRailGroupAlignment = await _themeService.load(
        Store.keyNavigationRailGroupAlignment,
        Store.defaultNavigationRailGroupAlignment);
    _navigationRailMinWidth = await _themeService.load(
        Store.keyNavigationRailMinWidth, Store.defaultNavigationRailMinWidth);
    _navigationRailMinExtendedWidth = await _themeService.load(
        Store.keyNavigationRailMinExtendedWidth,
        Store.defaultNavigationRailMinExtendedWidth);
    //
    // Button SETTINGS.
    _textButtonSchemeColor = await _themeService.load(
        Store.keyTextButtonSchemeColor, Store.defaultTextButtonSchemeColor);
    _textButtonBorderRadius = await _themeService.load(
        Store.keyTextButtonBorderRadius, Store.defaultTextButtonBorderRadius);
    //
    _filledButtonSchemeColor = await _themeService.load(
        Store.keyFilledButtonSchemeColor, Store.defaultFilledButtonSchemeColor);
    _filledButtonBorderRadius = await _themeService.load(
        Store.keyFilledButtonBorderRadius,
        Store.defaultFilledButtonBorderRadius);
    //
    _elevatedButtonSchemeColor = await _themeService.load(
        Store.keyElevatedButtonSchemeColor,
        Store.defaultElevatedButtonSchemeColor);
    _elevatedButtonSecondarySchemeColor = await _themeService.load(
        Store.keyElevatedButtonSecondarySchemeColor,
        Store.defaultElevatedButtonSecondarySchemeColor);
    _elevatedButtonBorderRadius = await _themeService.load(
        Store.keyElevatedButtonBorderRadius,
        Store.defaultElevatedButtonBorderRadius);
    //
    _outlinedButtonSchemeColor = await _themeService.load(
        Store.keyOutlinedButtonSchemeColor,
        Store.defaultOutlinedButtonSchemeColor);
    _outlinedButtonOutlineSchemeColor = await _themeService.load(
        Store.keyOutlinedButtonOutlineSchemeColor,
        Store.defaultOutlinedButtonOutlineSchemeColor);
    _outlinedButtonBorderRadius = await _themeService.load(
        Store.keyOutlinedButtonBorderRadius,
        Store.defaultOutlinedButtonBorderRadius);
    _outlinedButtonBorderWidth = await _themeService.load(
        Store.keyOutlinedButtonBorderWidth,
        Store.defaultOutlinedButtonBorderWidth);
    _outlinedButtonPressedBorderWidth = await _themeService.load(
        Store.keyOutlinedButtonPressedBorderWidth,
        Store.defaultOutlinedButtonPressedBorderWidth);
    //
    _toggleButtonsSchemeColor = await _themeService.load(
        Store.keyToggleButtonsSchemeColor,
        Store.defaultToggleButtonsSchemeColor);
    _toggleButtonsSelectedForegroundSchemeColor = await _themeService.load(
        Store.keyToggleButtonsSelectedForegroundSchemeColor,
        Store.defaultToggleButtonsSelectedForegroundSchemeColor);
    _toggleButtonsUnselectedSchemeColor = await _themeService.load(
        Store.keyToggleButtonsUnselectedSchemeColor,
        Store.defaultToggleButtonsUnselectedSchemeColor);
    _toggleButtonsBorderSchemeColor = await _themeService.load(
        Store.keyToggleButtonsBorderSchemeColor,
        Store.defaultToggleButtonsBorderSchemeColor);
    _toggleButtonsBorderRadius = await _themeService.load(
        Store.keyToggleButtonsBorderRadius,
        Store.defaultToggleButtonsBorderRadius);
    _toggleButtonsBorderWidth = await _themeService.load(
        Store.keyToggleButtonsBorderWidth,
        Store.defaultToggleButtonsBorderWidth);
    //
    _segmentedButtonSchemeColor = await _themeService.load(
        Store.keySegmentedButtonSchemeColor,
        Store.defaultSegmentedButtonSchemeColor);
    _segmentedButtonSelectedForegroundSchemeColor = await _themeService.load(
        Store.keySegmentedButtonSelectedForegroundSchemeColor,
        Store.defaultSegmentedButtonSelectedForegroundSchemeColor);
    _segmentedButtonUnselectedSchemeColor = await _themeService.load(
        Store.keySegmentedButtonUnselectedSchemeColor,
        Store.defaultSegmentedButtonUnselectedSchemeColor);
    _segmentedButtonUnselectedForegroundSchemeColor = await _themeService.load(
        Store.keySegmentedButtonUnselectedForegroundSchemeColor,
        Store.defaultSegmentedButtonUnselectedForegroundSchemeColor);
    _segmentedButtonBorderSchemeColor = await _themeService.load(
        Store.keySegmentedButtonBorderSchemeColor,
        Store.defaultSegmentedButtonBorderSchemeColor);
    _segmentedButtonBorderRadius = await _themeService.load(
        Store.keySegmentedButtonBorderRadius,
        Store.defaultSegmentedButtonBorderRadius);
    _segmentedButtonBorderWidth = await _themeService.load(
        Store.keySegmentedButtonBorderWidth,
        Store.defaultSegmentedButtonBorderWidth);
    //
    // Switch, CheckBox and Radio SETTINGS.
    _unselectedToggleIsColored = await _themeService.load(
        Store.keyUnselectedToggleIsColored,
        Store.defaultUnselectedToggleIsColored);
    _switchSchemeColor = await _themeService.load(
        Store.keySwitchSchemeColor, Store.defaultSwitchSchemeColor);
    _switchThumbSchemeColor = await _themeService.load(
        Store.keySwitchThumbSchemeColor, Store.defaultSwitchThumbSchemeColor);
    _switchThumbFixedSize = await _themeService.load(
        Store.keySwitchThumbFixedSize, Store.defaultSwitchThumbFixedSize);
    _switchAdaptiveCupertinoLike = await _themeService.load(
        Store.keySwitchAdaptiveCupertinoLike,
        Store.defaultSwitchAdaptiveCupertinoLike);
    //
    _checkboxSchemeColor = await _themeService.load(
        Store.keyCheckboxSchemeColor, Store.defaultCheckboxSchemeColor);
    _radioSchemeColor = await _themeService.load(
        Store.keySliderBaseSchemeColor, Store.defaultRadioSchemeColor);
    //
    // Slider SETTINGS.
    _sliderBaseSchemeColor = await _themeService.load(
        Store.keySliderBaseSchemeColor, Store.defaultSliderBaseSchemeColor);
    _sliderIndicatorSchemeColor = await _themeService.load(
        Store.keySliderIndicatorSchemeColor,
        Store.defaultSliderIndicatorSchemeColor);
    _sliderValueTinted = await _themeService.load(
        Store.keySliderValueTinted, Store.defaultSliderValueTinted);
    _sliderValueIndicatorType = await _themeService.load(
        Store.keySliderValueIndicatorType,
        Store.defaultSliderValueIndicatorType);
    _sliderShowValueIndicator = await _themeService.load(
        Store.keySliderShowValueIndicator,
        Store.defaultSliderShowValueIndicator);
    _sliderTrackHeight = await _themeService.load(
        Store.keySliderTrackHeight, Store.defaultSliderTrackHeight);
    //
    // Fab SETTINGS.
    _fabUseShape = await _themeService.load(
        Store.keyFabUseShape, Store.defaultFabUseShape);
    _fabAlwaysCircular = await _themeService.load(
        Store.keyFabAlwaysCircular, Store.defaultFabAlwaysCircular);
    _fabBorderRadius = await _themeService.load(
        Store.keyFabBorderRadius, Store.defaultFabBorderRadius);
    _fabSchemeColor = await _themeService.load(
        Store.keyFabSchemeColor, Store.defaultFabSchemeColor);
    _fabForegroundSchemeColor = await _themeService.load(
        Store.keyFabForegroundSchemeColor,
        Store.defaultFabForegroundSchemeColor);
    //
    // Chip Settings
    _chipSchemeColor = await _themeService.load(
        Store.keyChipSchemeColor, Store.defaultChipSchemeColor);
    _chipSelectedSchemeColor = await _themeService.load(
        Store.keyChipSelectedSchemeColor, Store.defaultChipSelectedSchemeColor);
    _chipSecondarySelectedSchemeColor = await _themeService.load(
        Store.keyChipSecondarySelectedSchemeColor,
        Store.defaultChipSecondarySelectedSchemeColor);
    _chipDeleteIconSchemeColor = await _themeService.load(
        Store.keyChipDeleteIconSchemeColor,
        Store.defaultChipDeleteIconSchemeColor);
    _chipBlendColors = await _themeService.load(
        Store.keyChipBlendColors, Store.defaultChipBlendColors);
    _chipBorderRadius = await _themeService.load(
        Store.keyChipBorderRadius, Store.defaultChipBorderRadius);
    _chipFontSize = await _themeService.load(
        Store.keyChipFontSize, Store.defaultChipFontSize);
    _chipIconSize = await _themeService.load(
        Store.keyChipIconSize, Store.defaultChipIconSize);
    _chipPaddingStart = await _themeService.load(
        Store.keyChipPaddingStart, Store.defaultChipPaddingStart);
    _chipPaddingEnd = await _themeService.load(
        Store.keyChipPaddingEnd, Store.defaultChipPaddingEnd);
    _chipPaddingTop = await _themeService.load(
        Store.keyChipPaddingTop, Store.defaultChipPaddingTop);
    _chipPaddingBottom = await _themeService.load(
        Store.keyChipPaddingBottom, Store.defaultChipPaddingBottom);
    //
    // SnackBar SETTINGS.
    _snackBarElevation = await _themeService.load(
        Store.keySnackBarElevation, Store.defaultSnackBarElevation);
    _snackBarBorderRadius = await _themeService.load(
        Store.keySnackBarBorderRadius, Store.defaultSnackBarBorderRadius);
    _snackBarSchemeColor = await _themeService.load(
        Store.keySnackBarSchemeColor, Store.defaultSnackBarSchemeColor);
    _snackBarActionSchemeColor = await _themeService.load(
        Store.keySnackBarActionSchemeColor,
        Store.defaultSnackBarActionSchemeColor);
    //
    // PopupMenuButton SETTINGS.
    _popupMenuSchemeColor = await _themeService.load(
        Store.keyPopupMenuSchemeColor, Store.defaultPopupMenuSchemeColor);
    _popupMenuOpacity = await _themeService.load(
        Store.keyPopupMenuOpacity, Store.defaultPopupMenuOpacity);
    _popupMenuBorderRadius = await _themeService.load(
        Store.keyPopupMenuBorderRadius, Store.defaultPopupMenuBorderRadius);
    _popupMenuElevation = await _themeService.load(
        Store.keyPopupMenuElevation, Store.defaultPopupMenuElevation);
    //
    // DropdownButton SETTING
    _alignedDropdown = await _themeService.load(
        Store.keyAlignedDropdown, Store.defaultAlignedDropdown);
    //
    // Card SETTINGS.
    _cardBorderRadius = await _themeService.load(
        Store.keyCardBorderRadius, Store.defaultCardBorderRadius);
    //
    // Dialog SETTINGS.
    _dialogBackgroundLightSchemeColor = await _themeService.load(
        Store.keyDialogBackgroundLightSchemeColor,
        Store.defaultDialogBackgroundLightSchemeColor);
    _dialogBackgroundDarkSchemeColor = await _themeService.load(
        Store.keyDialogBackgroundDarkSchemeColor,
        Store.defaultDialogBackgroundDarkSchemeColor);
    _datePickerHeaderBackgroundSchemeColor = await _themeService.load(
        Store.keyDatePickerHeaderBackgroundSchemeColor,
        Store.defaultDatePickerHeaderBackgroundSchemeColor);
    _datePickerHeaderForegroundSchemeColor = await _themeService.load(
        Store.keyDatePickerHeaderForegroundSchemeColor,
        Store.defaultDatePickerHeaderForegroundSchemeColor);
    _datePickerDividerSchemeColor = await _themeService.load(
        Store.keyDatePickerDividerSchemeColor,
        Store.defaultDatePickerDividerSchemeColor);
    //
    _useInputDecoratorThemeInDialogs = await _themeService.load(
        Store.keyUseInputDecoratorThemeInDialogs,
        Store.defaultUseInputDecoratorThemeInDialogs);
    _adaptiveResponseDialogRadius = await _themeService.load(
        Store.keyAdaptiveResponseDialogRadius,
        Store.defaultAdaptiveResponseDialogRadius);
    _dialogBorderRadius = await _themeService.load(
        Store.keyDialogBorderRadius, Store.defaultDialogBorderRadius);
    _dialogBorderRadiusAdaptive = await _themeService.load(
        Store.keyDialogBorderRadiusAdaptive,
        Store.defaultDialogBorderRadiusAdaptive);
    _timePickerDialogBorderRadius = await _themeService.load(
        Store.keyTimePickerDialogBorderRadius,
        Store.defaultTimePickerDialogBorderRadius);
    _datePickerDialogBorderRadius = await _themeService.load(
        Store.keyDatePickerDialogBorderRadius,
        Store.defaultDatePickerDialogBorderRadius);
    _timePickerElementRadius = await _themeService.load(
        Store.keyTimePickerElementRadius, Store.defaultTimePickerElementRadius);
    _dialogElevation = await _themeService.load(
        Store.keyDialogElevation, Store.defaultDialogElevation);
    //
    // Tooltip SETTINGS.
    _tooltipRadius = await _themeService.load(
        Store.keyTooltipRadius, Store.defaultTooltipRadius);
    _tooltipWaitDuration = await _themeService.load(
        Store.keyTooltipWaitDuration, Store.defaultTooltipWaitDuration);
    _tooltipShowDuration = await _themeService.load(
        Store.keyTooltipShowDuration, Store.defaultTooltipShowDuration);
    _tooltipSchemeColor = await _themeService.load(
        Store.keyTooltipSchemeColor, Store.defaultTooltipSchemeColor);
    _tooltipOpacity = await _themeService.load(
        Store.keyTooltipOpacity, Store.defaultTooltipOpacity);
    //
    // Custom surface tint color SETTINGS.
    _surfaceTintLight = await _themeService.load(
        Store.keySurfaceTintLight, Store.defaultSurfaceTintLight);
    _surfaceTintDark = await _themeService.load(
        Store.keySurfaceTintDark, Store.defaultSurfaceTintDark);
    //
    // Custom color SETTINGS.
    _customUsesDarkColorsForSeed = await _themeService.load(
        Store.keyCustomUsesDarkColorsForSeed,
        Store.defaultCustomUsesDarkColorsForSeed);
    _primaryLight = await _themeService.load(
        Store.keyPrimaryLight, Store.defaultPrimaryLight);
    _primaryLightRef = await _themeService.load(
        Store.keyPrimaryLightRef, Store.defaultPrimaryLightRef);
    _primaryContainerLight = await _themeService.load(
        Store.keyPrimaryContainerLight, Store.defaultPrimaryContainerLight);
    _secondaryLight = await _themeService.load(
        Store.keySecondaryLight, Store.defaultSecondaryLight);
    _secondaryLightRef = await _themeService.load(
        Store.keySecondaryLightRef, Store.defaultSecondaryLightRef);
    _secondaryContainerLight = await _themeService.load(
        Store.keySecondaryContainerLight, Store.defaultSecondaryContainerLight);
    _tertiaryLight = await _themeService.load(
        Store.keyTertiaryLight, Store.defaultTertiaryLight);
    _tertiaryLightRef = await _themeService.load(
        Store.keyTertiaryLightRef, Store.defaultTertiaryLightRef);
    _tertiaryContainerLight = await _themeService.load(
        Store.keyTertiaryContainerLight, Store.defaultTertiaryContainerLight);
    _errorLight =
        await _themeService.load(Store.keyErrorLight, Store.defaultErrorLight);
    _errorContainerLight = await _themeService.load(
        Store.keyErrorContainerLight, Store.defaultErrorContainerLight);
    _primaryDark = await _themeService.load(
        Store.keyPrimaryDark, Store.defaultPrimaryDark);
    _primaryDarkRef = await _themeService.load(
        Store.keyPrimaryDarkRef, Store.defaultPrimaryDarkRef);
    _primaryContainerDark = await _themeService.load(
        Store.keyPrimaryContainerDark, Store.defaultPrimaryContainerDark);
    _secondaryDark = await _themeService.load(
        Store.keySecondaryDark, Store.defaultSecondaryDark);
    _secondaryDarkRef = await _themeService.load(
        Store.keySecondaryDarkRef, Store.defaultSecondaryDarkRef);
    _secondaryContainerDark = await _themeService.load(
        Store.keySecondaryContainerDark, Store.defaultSecondaryContainerDark);
    _tertiaryDark = await _themeService.load(
        Store.keyTertiaryDark, Store.defaultTertiaryDark);
    _tertiaryDarkRef = await _themeService.load(
        Store.keyTertiaryDarkRef, Store.defaultTertiaryDarkRef);
    _tertiaryContainerDark = await _themeService.load(
        Store.keyTertiaryContainerDark, Store.defaultTertiaryContainerDark);
    _errorDark =
        await _themeService.load(Store.keyErrorDark, Store.defaultErrorDark);
    _errorContainerDark = await _themeService.load(
        Store.keyErrorContainerDark, Store.defaultErrorContainerDark);

    // Not persisted, locally controlled popup selection for ThemeService,
    // resets to actual used platform when settings are reset or app loaded.
    _platform = null;
    _fakeIsWeb = null;

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
  Future<void> resetAllToDefaults({
    /// If false, theme mode & scheme index are not reset.
    bool resetMode = true,
    // If false, notifyListeners is not called.
    bool doNotify = true,
  }) async {
    //
    // GENERAL SETTINGS.
    // ThemeMode, use FlexColorScheme and sub-themes, current scheme, view, etc.
    if (resetMode) setThemeMode(Store.defaultThemeMode, false);
    setUsedVisualDensity(Store.defaultUsedVisualDensity, false);
    setTapTargetSize(Store.defaultTapTargetSize, false);
    setUseFlexColorScheme(Store.defaultUseFlexColorScheme, false);
    setUseSubThemes(Store.defaultUseSubThemes, false);
    setApplyThemeToAllCupertino(Store.defaultApplyThemeToAllCupertino, false);
    //
    setAdaptiveRemoveElevationTintLight(
        Store.defaultAdaptiveRemoveElevationTintLight, false);
    setAdaptiveElevationShadowsBackLight(
        Store.defaultAdaptiveElevationShadowsBackLight, false);
    setAdaptiveAppBarScrollUnderOffLight(
        Store.defaultAdaptiveAppBarScrollUnderOffLight, false);
    setAdaptiveRemoveElevationTintDark(
        Store.defaultAdaptiveRemoveElevationTintDark, false);
    setAdaptiveElevationShadowsBackDark(
        Store.defaultAdaptiveElevationShadowsBackDark, false);
    setAdaptiveAppBarScrollUnderOffDark(
        Store.defaultAdaptiveAppBarScrollUnderOffDark, false);
    setAdaptiveResponseRadius(Store.defaultAdaptiveRadius, false);
    //
    setAdaptiveResponseSplash(Store.defaultAdaptiveSplash, false);
    setSplashType(Store.defaultSplashType, false);
    setSplashTypeAdaptive(Store.defaultSplashTypeAdaptive, false);
    //
    // The IsLargeGridView and ViewIndex settings are never reset to default in
    // a reset, we always keep the current screen and panel on page/panel view.
    setUseMaterial3Typography(Store.defaultUseMaterial3Typography, false);
    setUseM2StyleDividerInM3(Store.defaultUseM2StyleDividerInM3, false);
    setUseAppFont(Store.defaultUseAppFont, false);
    setUsedScheme(Store.defaultUsedScheme, false);
    setCustomUsesDarkColorsForSeed(
        Store.defaultCustomUsesDarkColorsForSeed, false);

    if (resetMode) setSchemeIndex(Store.defaultSchemeIndex, false);
    setInteractionEffects(Store.defaultInteractionEffects, false);
    setTintedDisabledControls(Store.defaultTintedDisabledControls, false);
    //
    setDefaultRadius(Store.defaultDefaultRadius, false);
    setDefaultRadiusAdaptive(Store.defaultDefaultRadiusAdaptive, false);
    setThinBorderWidth(Store.defaultThinBorderWidth, false);
    setThickBorderWidth(Store.defaultThickBorderWidth, false);
    setTooltipsMatchBackground(Store.defaultTooltipsMatchBackground, false);
    //
    // Surface and blend SETTINGS.
    setScaffoldBackgroundLightBaseColor(
        Store.defaultScaffoldBackgroundLightBaseColor, false);
    setScaffoldBackgroundDarkBaseColor(
        Store.defaultScaffoldBackgroundDarkBaseColor, false);
    setScaffoldBackgroundLightSchemeColor(
        Store.defaultScaffoldBackgroundLightSchemeColor, false);
    setScaffoldBackgroundDarkSchemeColor(
        Store.defaultScaffoldBackgroundDarkSchemeColor, false);
    setSurfaceModeLight(Store.defaultSurfaceModeLight, false);
    setSurfaceModeDark(Store.defaultSurfaceModeDark, false);
    setBlendLevel(Store.defaultBlendLevel, false);
    setBlendLevelDark(Store.defaultBlendLevelDark, false);
    setBlendOnLevel(Store.defaultBlendOnLevel, false);
    setBlendOnLevelDark(Store.defaultBlendOnLevelDark, false);
    setUsedColors(Store.defaultUsedColors, false);
    setSwapLegacyColors(Store.defaultSwapLegacyColors, false);
    setSwapLightColors(Store.defaultSwapLightColors, false);
    setSwapDarkColors(Store.defaultSwapDarkColors, false);
    setLightIsWhite(Store.defaultLightIsWhite, false);
    setDarkIsTrueBlack(Store.defaultDarkIsTrueBlack, false);
    setUseToDarkMethod(Store.defaultUseToDarkMethod, false);
    setToDarkSwapPrimaryAndContainer(
        Store.defaultToDarkSwapPrimaryAndContainer, false);
    setDarkMethodLevel(Store.defaultDarkMethodLevel, false);
    setBlendLightOnColors(Store.defaultBlendLightOnColors, false);
    setBlendDarkOnColors(Store.defaultBlendDarkOnColors, false);
    // TODO(rydmike): Commented as part of blendTextTheme deprecation.
    // setBlendLightTextTheme(Store.defaultBlendLightTextTheme, false);
    // setBlendDarkTextTheme(Store.defaultBlendDarkTextTheme, false);
    //
    // Material 3 and Seed ColorScheme SETTINGS.
    setUseMaterial3(Store.defaultUseMaterial3, false);
    setFixedColorStyle(Store.defaultFixedColorStyle, false);
    setUseKeyColors(Store.defaultUseKeyColors, false);
    setUseSecondary(Store.defaultUseSecondary, false);
    setUseTertiary(Store.defaultUseTertiary, false);
    setUseError(Store.defaultUseError, false);
    setKeepPrimary(Store.defaultKeepPrimary, false);
    setKeepSecondary(Store.defaultKeepSecondary, false);
    setKeepTertiary(Store.defaultKeepTertiary, false);
    setKeepError(Store.defaultKeepError, false);
    setKeepPrimaryContainer(Store.defaultKeepPrimaryContainer, false);
    setKeepSecondaryContainer(Store.defaultKeepSecondaryContainer, false);
    setKeepTertiaryContainer(Store.defaultKeepTertiaryContainer, false);
    setKeepErrorContainer(Store.defaultKeepErrorContainer, false);
    setKeepDarkPrimary(Store.defaultKeepDarkPrimary, false);
    setKeepDarkSecondary(Store.defaultKeepDarkSecondary, false);
    setKeepDarkTertiary(Store.defaultKeepDarkTertiary, false);
    setKeepDarkError(Store.defaultKeepDarkError, false);
    setKeepDarkPrimaryContainer(Store.defaultKeepDarkPrimaryContainer, false);
    setKeepDarkSecondaryContainer(
        Store.defaultKeepDarkSecondaryContainer, false);
    setKeepDarkTertiaryContainer(Store.defaultKeepDarkTertiaryContainer, false);
    setKeepDarkErrorContainer(Store.defaultKeepDarkErrorContainer, false);
    setUsedFlexToneSetup(Store.defaultUsedFlexToneSetup, false);
    setUseM3ErrorColors(Store.defaultUseM3ErrorColors, false);
    //
    setUseMonoSurfacesLight(Store.defaultUseMonoSurfacesLight, false);
    setUseMonoSurfacesDark(Store.defaultUseMonoSurfacesDark, false);
    setOnMainsUseBWLight(Store.defaultOnMainsUseBWLight, false);
    setOnMainsUseBWDark(Store.defaultOnMainsUseBWDark, false);
    setOnSurfacesUseBWLight(Store.defaultOnSurfacesUseBWLight, false);
    setOnSurfacesUseBWDark(Store.defaultOnSurfacesUseBWDark, false);
    setSurfacesUseBWLight(Store.defaultSurfacesUseBWLight, false);
    setSurfacesUseBWDark(Store.defaultSurfacesUseBWDark, false);
    //
    setHigherContrastFixed(Store.defaultHigherContrastFixed, false);
    setExpressiveOnContainer(Store.defaultExpressiveOnContainer, false);
    setUseLegacyMonochromeSeedBehavior(
        Store.defaultUseLegacyMonochromeSeedBehavior, false);
    setDynamicContrastLevel(Store.defaultDynamicContrastLevel, false);
    //
    // InputDecorator SETTINGS.
    await setTextFieldToDefaults(false);
    //
    // ListTile SETTINGS.
    setListTileSelectedSchemeColor(
        Store.defaultListTileSelectedSchemeColor, false);
    setListTileIconSchemeColor(Store.defaultListTileIconSchemeColor, false);
    setListTileTextSchemeColor(Store.defaultListTileTextSchemeColor, false);
    setListTileTileSchemeColor(Store.defaultListTileTileSchemeColor, false);
    setListTileSelectedTileSchemeColor(
        Store.defaultListTileSelectedTileSchemeColor, false);
    setListTilePaddingStart(Store.defaultListTilePaddingStart, false);
    setListTilePaddingEnd(Store.defaultListTilePaddingEnd, false);
    setListTilePaddingTop(Store.defaultListTilePaddingTop, false);
    setListTilePaddingBottom(Store.defaultListTilePaddingBottom, false);
    setListTileHorizontalTitleGap(
        Store.defaultListTileHorizontalTitleGap, false);
    setListTileMinVerticalPadding(
        Store.defaultListTileMinVerticalPadding, false);
    setListTileStyle(Store.defaultListTileStyle, false);
    setListTileTitleAlignment(Store.defaultListTileTitleAlignment, false);
    setListTileControlAffinity(Store.defaultListTileControlAffinity, false);
    //
    // AppBar SETTINGS.
    setAppBarStyleLight(Store.defaultAppBarStyleLight, false);
    setAppBarStyleDark(Store.defaultAppBarStyleDark, false);
    setAppBarOpacityLight(Store.defaultAppBarOpacityLight, false);
    setAppBarOpacityDark(Store.defaultAppBarOpacityDark, false);
    setAppBarElevationLight(Store.defaultAppBarElevationLight, false);
    setAppBarElevationDark(Store.defaultAppBarElevationDark, false);
    setAppBarScrolledUnderElevationLight(
        Store.defaultAppBarScrolledUnderElevationLight, false);
    setAppBarScrolledUnderElevationDark(
        Store.defaultAppBarScrolledUnderElevationDark, false);
    setTransparentStatusBar(Store.defaultTransparentStatusBar, false);
    setAppBarCenterTitle(Store.defaultAppBarCenterTitle, false);
    setAppBarBackgroundSchemeColorLight(
        Store.defaultAppBarBackgroundSchemeColorLight, false);
    setAppBarBackgroundSchemeColorDark(
        Store.defaultAppBarBackgroundSchemeColorDark, false);
    setAppBarForegroundSchemeColorLight(
        Store.defaultAppBarForegroundSchemeColorLight, false);
    setAppBarForegroundSchemeColorDark(
        Store.defaultAppBarForegroundSchemeColorDark, false);
    setAppBarIconSchemeColorLight(
        Store.defaultAppBarIconSchemeColorLight, false);
    setAppBarIconSchemeColorDark(Store.defaultAppBarIconSchemeColorDark, false);
    setAppBarActionsIconSchemeColorLight(
        Store.defaultAppBarActionsIconSchemeColorLight, false);
    setAppBarActionsIconSchemeColorDark(
        Store.defaultAppBarActionsIconSchemeColorDark, false);
    //
    // BottomAppBar SETTINGS.
    setBottomAppBarElevationLight(
        Store.defaultBottomAppBarElevationLight, false);
    setBottomAppBarElevationDark(Store.defaultBottomAppBarElevationDark, false);
    setBottomAppBarSchemeColorLight(
        Store.defaultBottomAppBarSchemeColorLight, false);
    setBottomAppBarSchemeColorDark(
        Store.defaultBottomAppBarSchemeColorDark, false);
    setBottomAppBarHeight(Store.defaultBottomAppBarHeight, false);
    //
    // TabBar SETTINGS.
    setTabBarStyle(Store.defaultTabBarStyle, false);
    setTabBarIndicatorLight(Store.defaultTabBarIndicatorLight, false);
    setTabBarIndicatorDark(Store.defaultTabBarIndicatorDark, false);
    setTabBarItemSchemeColorLight(
        Store.defaultTabBarItemSchemeColorLight, false);
    setTabBarItemSchemeColorDark(Store.defaultTabBarItemSchemeColorDark, false);
    setTabBarUnselectedItemSchemeColorLight(
        Store.defaultTabBarUnselectedItemSchemeColorLight, false);
    setTabBarUnselectedItemSchemeColorDark(
        Store.defaultTabBarUnselectedItemSchemeColorDark, false);
    setTabBarUnselectedItemOpacityLight(
        Store.defaultTabBarUnselectedItemOpacityLight, false);
    setTabBarUnselectedItemOpacityDark(
        Store.defaultTabBarUnselectedItemOpacityDark, false);
    setTabBarIndicatorSize(Store.defaultTabBarIndicatorSize, false);
    setTabBarIndicatorWeight(Store.defaultTabBarIndicatorWeight, false);
    setTabBarIndicatorTopRadius(Store.defaultTabBarIndicatorTopRadius, false);
    setTabBarDividerColor(Store.defaultTabBarDividerColor, false);
    setTabBarTabAlignment(Store.defaultTabBarTabAlignment, false);
    //
    // Drawer SETTINGS.
    setDrawerBorderRadius(Store.defaultDrawerBorderRadius, false);
    setDrawerElevation(Store.defaultDrawerElevation, false);
    setDrawerBackgroundSchemeColor(
        Store.defaultDrawerBackgroundSchemeColor, false);
    setDrawerWidth(Store.defaultDrawerWidth, false);
    setDrawerIndicatorWidth(Store.defaultDrawerIndicatorWidth, false);
    setDrawerIndicatorBorderRadius(
        Store.defaultDrawerIndicatorBorderRadius, false);
    setDrawerIndicatorSchemeColor(
        Store.defaultDrawerIndicatorSchemeColor, false);
    setDrawerIndicatorOpacity(Store.defaultDrawerIndicatorOpacity, false);
    setDrawerSelectedItemSchemeColor(
        Store.defaultDrawerSelectedItemSchemeColor, false);
    setDrawerUnselectedItemSchemeColor(
        Store.defaultDrawerUnselectedItemSchemeColor, false);
    //
    // BottomSheet SETTINGS.
    setBottomSheetSchemeColor(Store.defaultBottomSheetSchemeColor, false);
    setBottomSheetElevation(Store.defaultBottomSheetElevation, false);
    setBottomSheetModalSchemeColor(
        Store.defaultBottomSheetModalSchemeColor, false);
    setBottomSheetModalElevation(Store.defaultBottomSheetModalElevation, false);
    setBottomSheetBorderRadius(Store.defaultBottomSheetBorderRadius, false);
    //
    // Android System Navigator bar SETTINGS.
    setSysNavBarStyle(Store.defaultSysNavBarStyle, false);
    setSysBarOpacity(Store.defaultSysBarOpacity, false);
    setUseSysNavDivider(Store.defaultUseSysNavDivider, false);
    //
    // BottomNavigationBar SETTINGS.
    setBottomNavBarBackgroundSchemeColor(
        Store.defaultBottomNavBarBackgroundSchemeColor, false);
    setBottomNavigationBarOpacity(
        Store.defaultBottomNavigationBarOpacity, false);
    setBottomNavigationBarElevation(
        Store.defaultBottomNavigationBarElevation, false);
    setBottomNavBarSelectedSchemeColor(
        Store.defaultBottomNavBarSelectedItemSchemeColor, false);
    setBottomNavBarUnselectedSchemeColor(
        Store.defaultBottomNavBarUnselectedSchemeColor, false);
    setBottomNavBarMuteUnselected(
        Store.defaultBottomNavBarMuteUnselected, false);
    setBottomNavShowSelectedLabels(
        Store.defaultBottomNavShowSelectedLabels, false);
    setBottomNavShowUnselectedLabels(
        Store.defaultBottomNavShowUnselectedLabels, false);
    setBottomNavigationBarSelectedLabelSize(
        Store.defaultBottomNavigationBarSelectedLabelSize, false);
    setBottomNavigationBarUnselectedLabelSize(
        Store.defaultBottomNavigationBarUnselectedLabelSize, false);
    setBottomNavigationBarSelectedIconSize(
        Store.defaultBottomNavigationBarSelectedIconSize, false);
    setBottomNavigationBarUnselectedIconSize(
        Store.defaultBottomNavigationBarUnselectedIconSize, false);
    //
    // Menu, MenuBar and MenuButton SETTINGS.
    setMenuRadius(Store.defaultMenuRadius, false);
    setMenuElevation(Store.defaultMenuElevation, false);
    setMenuOpacity(Store.defaultMenuOpacity, false);
    setMenuPaddingStart(Store.defaultMenuPaddingStart, false);
    setMenuPaddingEnd(Store.defaultMenuPaddingEnd, false);
    setMenuPaddingTop(Store.defaultMenuPaddingTop, false);
    setMenuPaddingBottom(Store.defaultMenuPaddingBottom, false);
    setMenuSchemeColor(Store.defaultMenuSchemeColor, false);
    //
    setMenuBarBackgroundSchemeColor(
        Store.defaultMenuBarBackgroundSchemeColor, false);
    setMenuBarRadius(Store.defaultMenuBarRadius, false);
    setMenuBarElevation(Store.defaultMenuBarElevation, false);
    setMenuBarShadowColor(Store.defaultMenuBarShadowColor, false);
    //
    setMenuItemBackgroundSchemeColor(
        Store.defaultMenuItemBackgroundSchemeColor, false);
    setMenuItemForegroundSchemeColor(
        Store.defaultMenuItemForegroundSchemeColor, false);
    setMenuIndicatorBackgroundSchemeColor(
        Store.defaultMenuIndicatorBackgroundSchemeColor, false);
    setMenuIndicatorForegroundSchemeColor(
        Store.defaultMenuIndicatorForegroundSchemeColor, false);
    setMenuIndicatorRadius(Store.defaultMenuIndicatorRadius, false);
    //
    // SearchView and SearchBar SETTINGS.
    setSearchBackgroundSchemeColor(
        Store.defaultSearchBackgroundSchemeColor, false);
    setSearchElevation(Store.defaultSearchElevation, false);
    setSearchRadius(Store.defaultSearchRadius, false);
    setSearchViewHeaderHeight(Store.defaultSearchViewHeaderHeight, false);
    setSearchUseGlobalShape(Store.defaultSearchUseGlobalShape, false);
    setSearchIsFullScreen(Store.defaultSearchUseGlobalShape, false);
    //
    // NavigationBar SETTINGS.
    setNavBarBackgroundSchemeColor(
        Store.defaultNavBarBackgroundSchemeColor, false);
    setNavBarOpacity(Store.defaultNavBarOpacity, false);
    setNavBarElevation(Store.defaultNavigationBarElevation, false);
    setNavBarHeight(Store.defaultNavBarHeight, false);
    setNavBarSelectedIconSchemeColor(
        Store.defaultNavBarSelectedIconSchemeColor, false);
    setNavBarSelectedLabelSchemeColor(
        Store.defaultNavBarSelectedLabelSchemeColor, false);
    setNavBarUnselectedSchemeColor(
        Store.defaultNavBarUnselectedSchemeColor, false);
    setNavBarMuteUnselected(Store.defaultNavBarMuteUnselected, false);
    setNavBarIndicatorSchemeColor(
        Store.defaultNavBarIndicatorSchemeColor, false);
    setNavBarIndicatorOpacity(Store.defaultNavBarIndicatorOpacity, false);
    setNavBarIndicatorBorderRadius(
        Store.defaultNavBarIndicatorBorderRadius, false);
    setNavBarLabelBehavior(Store.defaultNavBarLabelBehavior, false);
    setAdaptiveRemoveNavigationBarTintLight(
        Store.defaultAdaptiveRemoveNavigationBarTintLight, false);
    setAdaptiveRemoveNavigationBarTintDark(
        Store.defaultAdaptiveRemoveNavigationBarTintDark, false);
    setNavigationBarSelectedLabelSize(
        Store.defaultNavigationBarSelectedLabelSize, false);
    setNavigationBarUnselectedLabelSize(
        Store.defaultNavigationBarUnselectedLabelSize, false);
    setNavigationBarSelectedIconSize(
        Store.defaultNavigationBarSelectedIconSize, false);
    setNavigationBarUnselectedIconSize(
        Store.defaultNavigationBarUnselectedIconSize, false);
    //
    // NavigationRail SETTINGS.
    setNavRailBackgroundSchemeColor(
        Store.defaultNavRailBackgroundSchemeColor, false);
    setNavRailOpacity(Store.defaultNavRailOpacity, false);
    setNavRailElevation(Store.defaultNavRailElevation, false);
    setNavRailSelectedIconSchemeColor(
        Store.defaultNavRailSelectedIconSchemeColor, false);
    setNavRailSelectedLabelSchemeColor(
        Store.defaultNavRailSelectedLabelSchemeColor, false);
    setNavRailUnselectedSchemeColor(
        Store.defaultNavRailUnselectedSchemeColor, false);
    setNavRailMuteUnselected(Store.defaultNavRailMuteUnselected, false);
    setNavRailLabelType(Store.defaultNavRailLabelType, false);
    setNavRailUseIndicator(Store.defaultNavRailUseIndicator, false);
    setNavRailIndicatorSchemeColor(
        Store.defaultNavRailIndicatorSchemeColor, false);
    setNavRailIndicatorOpacity(Store.defaultNavRailIndicatorOpacity, false);
    setNavRailIndicatorBorderRadius(
        Store.defaultNavRailIndicatorBorderRadius, false);
    setNavigationRailSelectedLabelSize(
        Store.defaultNavigationRailSelectedLabelSize, false);
    setNavigationRailUnselectedLabelSize(
        Store.defaultNavigationRailUnselectedLabelSize, false);
    setNavigationRailSelectedIconSize(
        Store.defaultNavigationRailSelectedIconSize, false);
    setNavigationRailUnselectedIconSize(
        Store.defaultNavigationRailUnselectedIconSize, false);
    setNavigationRailGroupAlignment(
        Store.defaultNavigationRailGroupAlignment, false);
    setNavigationRailMinWidth(Store.defaultNavigationRailMinWidth, false);
    setNavigationRailMinExtendedWidth(
        Store.defaultNavigationRailMinExtendedWidth, false);
    //
    // Button SETTINGS.
    setTextButtonSchemeColor(Store.defaultTextButtonSchemeColor, false);
    setTextButtonBorderRadius(Store.defaultTextButtonBorderRadius, false);
    //
    setFilledButtonSchemeColor(Store.defaultFilledButtonSchemeColor, false);
    setFilledButtonBorderRadius(Store.defaultFilledButtonBorderRadius, false);
    //
    setElevatedButtonSchemeColor(Store.defaultElevatedButtonSchemeColor, false);
    setElevatedButtonSecondarySchemeColor(
        Store.defaultElevatedButtonSecondarySchemeColor, false);
    setElevatedButtonBorderRadius(
        Store.defaultElevatedButtonBorderRadius, false);
    //
    setOutlinedButtonSchemeColor(Store.defaultOutlinedButtonSchemeColor, false);
    setOutlinedButtonOutlineSchemeColor(
        Store.defaultOutlinedButtonOutlineSchemeColor, false);
    setOutlinedButtonBorderRadius(
        Store.defaultOutlinedButtonBorderRadius, false);
    setOutlinedButtonBorderWidth(Store.defaultOutlinedButtonBorderWidth, false);
    setOutlinedButtonPressedBorderWidth(
        Store.defaultOutlinedButtonPressedBorderWidth, false);
    //
    setToggleButtonsSchemeColor(Store.defaultToggleButtonsSchemeColor, false);
    setToggleButtonsSelectedForegroundSchemeColor(
        Store.defaultToggleButtonsSelectedForegroundSchemeColor, false);
    setToggleButtonsUnselectedSchemeColor(
        Store.defaultToggleButtonsUnselectedSchemeColor, false);
    setToggleButtonsBorderSchemeColor(
        Store.defaultToggleButtonsBorderSchemeColor, false);
    setToggleButtonsBorderRadius(Store.defaultToggleButtonsBorderRadius, false);
    setToggleButtonsBorderWidth(Store.defaultToggleButtonsBorderWidth, false);
    //
    setSegmentedButtonSchemeColor(
        Store.defaultSegmentedButtonSchemeColor, false);
    setSegmentedButtonSelectedForegroundSchemeColor(
        Store.defaultSegmentedButtonSelectedForegroundSchemeColor, false);
    setSegmentedButtonUnselectedSchemeColor(
        Store.defaultSegmentedButtonUnselectedSchemeColor, false);
    setSegmentedButtonUnselectedForegroundSchemeColor(
        Store.defaultSegmentedButtonUnselectedForegroundSchemeColor, false);
    setSegmentedButtonBorderSchemeColor(
        Store.defaultSegmentedButtonBorderSchemeColor, false);
    setSegmentedButtonBorderRadius(
        Store.defaultSegmentedButtonBorderRadius, false);
    setSegmentedButtonBorderWidth(
        Store.defaultSegmentedButtonBorderWidth, false);
    //
    // Switch, CheckBox and Radio SETTINGS.
    setUnselectedToggleIsColored(Store.defaultUnselectedToggleIsColored, false);
    setSwitchSchemeColor(Store.defaultSwitchSchemeColor, false);
    setSwitchThumbSchemeColor(Store.defaultSwitchThumbSchemeColor, false);
    setSwitchThumbFixedSize(Store.defaultSwitchThumbFixedSize, false);
    setSwitchAdaptiveCupertinoLike(
        Store.defaultSwitchAdaptiveCupertinoLike, false);
    //
    setCheckboxSchemeColor(Store.defaultCheckboxSchemeColor, false);
    setRadioSchemeColor(Store.defaultRadioSchemeColor, false);
    //
    // Slider SETTINGS.
    setSliderBaseSchemeColor(Store.defaultSliderBaseSchemeColor, false);
    setSliderIndicatorSchemeColor(
        Store.defaultSliderIndicatorSchemeColor, false);
    setSliderValueTinted(Store.defaultSliderValueTinted, false);
    setSliderValueIndicatorType(Store.defaultSliderValueIndicatorType, false);
    setSliderShowValueIndicator(Store.defaultSliderShowValueIndicator, false);
    setSliderTrackHeight(Store.defaultSliderTrackHeight, false);
    //
    // Fab SETTINGS.
    setFabUseShape(Store.defaultFabUseShape, false);
    setFabAlwaysCircular(Store.defaultFabAlwaysCircular, false);
    setFabBorderRadius(Store.defaultFabBorderRadius, false);
    setFabSchemeColor(Store.defaultFabSchemeColor, false);
    setFabForegroundSchemeColor(Store.defaultFabForegroundSchemeColor, false);
    //
    // Chip SETTINGS.
    setChipSchemeColor(Store.defaultChipSchemeColor, false);
    setChipSelectedSchemeColor(Store.defaultChipSelectedSchemeColor, false);
    setChipSecondarySelectedSchemeColor(
        Store.defaultChipSecondarySelectedSchemeColor, false);
    setChipDeleteIconSchemeColor(Store.defaultChipDeleteIconSchemeColor, false);
    setChipBorderRadius(Store.defaultChipBorderRadius, false);
    setChipBlendColors(Store.defaultChipBlendColors, false);
    setChipFontSize(Store.defaultChipFontSize, false);
    setChipIconSize(Store.defaultChipIconSize, false);
    setChipPaddingStart(Store.defaultChipPaddingStart, false);
    setChipPaddingEnd(Store.defaultChipPaddingEnd, false);
    setChipPaddingTop(Store.defaultChipPaddingTop, false);
    setChipPaddingBottom(Store.defaultChipPaddingBottom, false);
    //
    // SnackBar SETTINGS.
    setSnackBarElevation(Store.defaultSnackBarElevation, false);
    setSnackBarBorderRadius(Store.defaultSnackBarBorderRadius, false);
    setSnackBarSchemeColor(Store.defaultSnackBarSchemeColor, false);
    setSnackBarActionSchemeColor(Store.defaultSnackBarActionSchemeColor, false);
    //
    // PopupMenuButton SETTINGS.
    setPopupMenuSchemeColor(Store.defaultPopupMenuSchemeColor, false);
    setPopupMenuOpacity(Store.defaultPopupMenuOpacity, false);
    setPopupMenuBorderRadius(Store.defaultPopupMenuBorderRadius, false);
    setPopupMenuElevation(Store.defaultPopupMenuElevation, false);
    //
    // DropdownButton SETTINGS
    setAlignedDropdown(Store.defaultAlignedDropdown, false);
    //
    // Card SETTINGS.
    setCardBorderRadius(Store.defaultCardBorderRadius, false);
    //
    // Dialog SETTINGS.
    setDialogBackgroundLightSchemeColor(
        Store.defaultDialogBackgroundLightSchemeColor, false);
    setDialogBackgroundDarkSchemeColor(
        Store.defaultDialogBackgroundDarkSchemeColor, false);
    setDatePickerHeaderBackgroundSchemeColor(
        Store.defaultDatePickerHeaderBackgroundSchemeColor, false);
    setDatePickerHeaderForegroundSchemeColor(
        Store.defaultDatePickerHeaderForegroundSchemeColor, false);
    setDatePickerDividerSchemeColor(
        Store.defaultDatePickerDividerSchemeColor, false);
    //
    setUseInputDecoratorThemeInDialogs(
        Store.defaultUseInputDecoratorThemeInDialogs, false);
    setAdaptiveResponseDialogRadius(
        Store.defaultAdaptiveResponseDialogRadius, false);
    setDialogBorderRadius(Store.defaultDialogBorderRadius, false);
    setDialogBorderRadiusAdaptive(
        Store.defaultDialogBorderRadiusAdaptive, false);
    setTimePickerDialogBorderRadius(
        Store.defaultTimePickerDialogBorderRadius, false);
    setDatePickerDialogBorderRadius(
        Store.defaultDatePickerDialogBorderRadius, false);
    setTimePickerElementRadius(Store.defaultTimePickerElementRadius, false);
    setDialogElevation(Store.defaultDialogElevation, false);
    //
    // Tooltip SETTINGS.
    setTooltipRadius(Store.defaultTooltipRadius, false);
    setTooltipWaitDuration(Store.defaultTooltipWaitDuration, false);
    setTooltipShowDuration(Store.defaultTooltipShowDuration, false);
    setTooltipSchemeColor(Store.defaultTooltipSchemeColor, false);
    setTooltipOpacity(Store.defaultTooltipOpacity, false);
    //
    // Surface tint colors.
    setSurfaceTintLight(Store.defaultSurfaceTintLight, false);
    setSurfaceTintDark(Store.defaultSurfaceTintDark, false);
    //
    // Not persisted, locally controlled popup selection for ThemeService,
    // resets to actual used platform when settings are reset or app loaded.
    setPlatform(null, false);
    setFakeIsWeb(null, false);

    // Only notify at end, if asked to do so, to do so is default.
    if (doNotify) notifyListeners();
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
    setPrimaryLight(Store.defaultPrimaryLight, false);
    setPrimaryLightRef(Store.defaultPrimaryLightRef, false);
    setPrimaryContainerLight(Store.defaultPrimaryContainerLight, false);
    setSecondaryLight(Store.defaultSecondaryLight, false);
    setSecondaryLightRef(Store.defaultSecondaryLightRef, false);
    setSecondaryContainerLight(Store.defaultSecondaryContainerLight, false);
    setTertiaryLight(Store.defaultTertiaryLight, false);
    setTertiaryLightRef(Store.defaultTertiaryLightRef, false);
    setTertiaryContainerLight(Store.defaultTertiaryContainerLight, false);
    setErrorLight(Store.defaultErrorLight, false);
    setErrorContainerLight(Store.defaultErrorContainerLight, false);
    setPrimaryDark(Store.defaultPrimaryDark, false);
    setPrimaryDarkRef(Store.defaultPrimaryDarkRef, false);
    setPrimaryContainerDark(Store.defaultPrimaryContainerDark, false);
    setSecondaryDark(Store.defaultSecondaryDark, false);
    setSecondaryDarkRef(Store.defaultSecondaryDarkRef, false);
    setSecondaryContainerDark(Store.defaultSecondaryContainerDark, false);
    setTertiaryDark(Store.defaultTertiaryDark, false);
    setTertiaryDarkRef(Store.defaultTertiaryDarkRef, false);
    setTertiaryContainerDark(Store.defaultTertiaryContainerDark, false);
    setErrorDark(Store.defaultErrorDark, false);
    setErrorContainerDark(Store.defaultErrorContainerDark, false);
    notifyListeners();
  }

  /// Set TextField values to Flutter M3 defaults.
  Future<void> setTextFieldToM3([bool doNotify = true]) async {
    // Start with setting everything to defaults, without notify
    await setTextFieldToDefaults(false);

    // Only the border type is different from Playground defaults in M3 mode.
    setInputDecoratorBorderType(FlexInputBorderType.underline, false);

    // Only notify at end, if asked to do so, to do so is default.
    if (doNotify) notifyListeners();
  }

  /// Set TextField values to Playground Outlined.
  Future<void> setTextFieldToPlaygroundOutlined([bool doNotify = true]) async {
    // Start with setting everything to defaults, without notify
    await setTextFieldToDefaults(false);
    // Overall color
    setInputDecoratorSchemeColorLight(SchemeColor.primary, false);
    setInputDecoratorSchemeColorDark(SchemeColor.primary, false);
    setInputDecoratorBackgroundAlphaLight(7, false);
    setInputDecoratorBackgroundAlphaDark(40, false);
    setInputDecoratorIsFilled(true, false);
    // Border and radius
    setInputDecoratorBorderType(FlexInputBorderType.outline, false);
    setInputDecoratorBorderSchemeColorLight(SchemeColor.primary, false);
    setInputDecoratorBorderSchemeColorDark(SchemeColor.primary, false);
    setInputDecoratorBorderRadius(8, false);
    setInputDecoratorUnfocusedHasBorder(true, false);
    setInputDecoratorUnfocusedBorderIsColored(true, false);
    setInputDecoratorBorderWidth(1, false);
    setInputDecoratorFocusedBorderWidth(2.0, false);
    // Icon colors
    setInputDecoratorPrefixIconSchemeColor(
        SchemeColor.onPrimaryFixedVariant, false);
    setInputDecoratorPrefixIconDarkSchemeColor(SchemeColor.primaryFixed, false);
    setInputDecoratorSuffixIconSchemeColor(SchemeColor.primary, false);
    setInputDecoratorSuffixIconDarkSchemeColor(SchemeColor.primary, false);
    // Custom padding
    setInputDecoratorPaddingTop(16, false);
    setInputDecoratorPaddingBottom(12, false);
    // Only notify at end, if asked to do so, to do so is default.
    if (doNotify) notifyListeners();
  }

  /// Set TextField values to Playground Focused Dense no focused outlined.
  Future<void> setTextFieldToPlaygroundDense([bool doNotify = true]) async {
    // Start with setting everything to defaults, without notify
    await setTextFieldToDefaults(false);
    // Overall color
    setInputDecoratorSchemeColorLight(SchemeColor.primary, false);
    setInputDecoratorSchemeColorDark(SchemeColor.primary, false);
    setInputDecoratorBackgroundAlphaLight(14, false);
    setInputDecoratorBackgroundAlphaDark(45, false);
    setInputDecoratorIsFilled(true, false);
    // Border and radius
    setInputDecoratorBorderType(FlexInputBorderType.outline, false);
    setInputDecoratorBorderSchemeColorLight(SchemeColor.primary, false);
    setInputDecoratorBorderSchemeColorDark(SchemeColor.primary, false);
    setInputDecoratorBorderRadius(10, false);
    setInputDecoratorUnfocusedHasBorder(false, false);
    setInputDecoratorFocusedBorderWidth(1.0, false);
    // Icon colors
    setInputDecoratorPrefixIconSchemeColor(
        SchemeColor.onPrimaryFixedVariant, false);
    setInputDecoratorPrefixIconDarkSchemeColor(SchemeColor.primaryFixed, false);
    // A dense text field
    setInputDecoratorIsDense(true, false);
    // Only notify at end, if asked to do so, to do so is default.
    if (doNotify) notifyListeners();
  }

  /// Set TextField values to FlexColorScheme defaults.
  Future<void> setTextFieldToDefaults([bool doNotify = true]) async {
    // Using the same order as widgets are on screen to make easier to
    // see we got them all.

    // Background and opacity
    setInputDecoratorIsFilled(Store.defaultInputDecoratorIsFilled, false);
    setInputDecoratorSchemeColorLight(
        Store.defaultInputDecoratorSchemeColorLight, false);
    setInputDecoratorSchemeColorDark(
        Store.defaultInputDecoratorSchemeColorDark, false);
    setInputDecoratorBackgroundAlphaLight(
        Store.defaultInputDecoratorBackgroundAlphaLight, false);
    setInputDecoratorBackgroundAlphaDark(
        Store.defaultInputDecoratorBackgroundAlphaDark, false);
    // Border type and radius
    setInputDecoratorBorderType(Store.defaultInputDecoratorBorderType, false);
    setAdaptiveResponseInputDecoratorRadius(
        Store.defaultAdaptiveResponseInputDecoratorRadius, false);
    setInputDecoratorBorderRadius(
        Store.defaultInputDecoratorBorderRadius, false);
    setInputDecoratorBorderRadiusAdaptive(
        Store.defaultInputDecoratorBorderRadiusAdaptive, false);
    // Border color and focused border usage
    setInputDecoratorBorderSchemeColorLight(
        Store.defaultInputDecoratorBorderSchemeColorLight, false);
    setInputDecoratorBorderSchemeColorDark(
        Store.defaultInputDecoratorBorderSchemeColorDark, false);
    setInputDecoratorUnfocusedBorderIsColored(
        Store.defaultInputDecoratorUnfocusedBorderIsColored, false);
    setInputDecoratorUnfocusedHasBorder(
        Store.defaultInputDecoratorUnfocusedHasBorder, false);
    setInputDecoratorBorderWidth(Store.defaultInputDecoratorBorderWidth, false);
    setInputDecoratorFocusedHasBorder(
        Store.defaultInputDecoratorFocusedHasBorder, false);
    setInputDecoratorFocusedBorderWidth(
        Store.defaultInputDecoratorFocusedBorderWidth, false);
    // Prefix and suffix icon colors
    setInputDecoratorPrefixIconSchemeColor(
        Store.defaultInputDecoratorPrefixIconSchemeColor, false);
    setInputDecoratorPrefixIconDarkSchemeColor(
        Store.defaultInputDecoratorPrefixIconDarkSchemeColor, false);
    setInputDecoratorSuffixIconSchemeColor(
        Store.defaultInputDecoratorSuffixIconSchemeColor, false);
    setInputDecoratorSuffixIconDarkSchemeColor(
        Store.defaultInputDecoratorSuffixIconDarkSchemeColor, false);
    // Dense and padding
    setInputDecoratorIsDense(Store.defaultInputDecoratorIsDense, false);
    setInputDecoratorPaddingStart(
        Store.defaultInputDecoratorPaddingStart, false);
    setInputDecoratorPaddingEnd(Store.defaultInputDecoratorPaddingEnd, false);
    setInputDecoratorPaddingTop(Store.defaultInputDecoratorPaddingTop, false);
    setInputDecoratorPaddingBottom(
        Store.defaultInputDecoratorPaddingBottom, false);
    //
    // TextSelection SETTINGS.
    setInputCursorLightSchemeColor(
        Store.defaultInputCursorLightSchemeColor, false);
    setInputCursorDarkSchemeColor(
        Store.defaultInputCursorDarkSchemeColor, false);
    setInputSelectionHandleLightSchemeColor(
        Store.defaultInputSelectionHandleLightSchemeColor, false);
    setInputSelectionHandleDarkSchemeColor(
        Store.defaultInputSelectionHandleDarkSchemeColor, false);
    setInputSelectionLightSchemeColor(
        Store.defaultInputSelectionLightSchemeColor, false);
    setInputSelectionDarkSchemeColor(
        Store.defaultInputSelectionDarkSchemeColor, false);
    setInputSelectionLightOpacity(
        Store.defaultInputSelectionLightOpacity, false);
    setInputSelectionDarkOpacity(Store.defaultInputSelectionDarkOpacity, false);
    //
    // Only notify at end, if asked to do so, to do so is default.
    if (doNotify) notifyListeners();
  }

  /// Set Playground settings and FCS theme to selected premade config.
  Future<void> setToPremade({int settingsId = 0}) async {
    //
    // 0) Playground defaults.
    //
    // First reset all settings to defaults so we start with a clean slate.
    // But we do not change theme mode, we keep it. Also we will not notify
    // any listeners yet, we do that when all settings have been set.
    //
    // If there is no matching settings ID, settings are just rest to defaults.
    await resetAllToDefaults(resetMode: false, doNotify: false);

    // 1) Material 3 default.
    if (settingsId == 1) {
      // Blend mode and levels.
      setBlendLevel(0, false);
      setBlendLevelDark(0, false);
      setBlendOnLevel(0, false);
      setBlendOnLevelDark(0, false);
      // Seed generation - Basic M3 default.
      setUseKeyColors(true, false);
      // Effects: M2 Divider, interaction effects, tinted disable.
      setUseM2StyleDividerInM3(false, false);
      setInteractionEffects(false, false);
      setTintedDisabledControls(false, false);
      // Set SnackBar to M3.
      setSnackBarSchemeColor(SchemeColor.inverseSurface, false);
      setSnackBarElevation(6, false);
      // Set TextField to M3
      await setTextFieldToM3(false);
      // Set tooltip to M3 like
      setTooltipRadius(4, false);
      setTooltipOpacity(0.9, false);
      // Not entirely correct color with defaults, but best we can do with
      // ColorScheme based colors. Most likely this is what it should be in M3,
      // but Flutter does not implement it yet, it still uses M2 defaults in M3.
      setTooltipSchemeColor(SchemeColor.inverseSurface, false);
    }
    // 2) Primary navigators.
    else if (settingsId == 2) {
      // Legacy swap OFF.
      setSwapLegacyColors(false, false);
      // Set blend modes and levels.
      setSurfaceModeLight(FlexSurfaceMode.highBackgroundLowScaffold, false);
      setSurfaceModeDark(FlexSurfaceMode.highBackgroundLowScaffold, false);
      setBlendLevel(2, false);
      setBlendLevelDark(8, false);
      setBlendLightOnColors(false, false);
      setBlendDarkOnColors(true, false);
      setBlendOnLevel(10, false);
      setBlendOnLevelDark(8, false);
      // Seed generation - Turn it OFF.
      setUseKeyColors(false, false);
      // Effects: M2 Divider, interaction effects, tinted disable.
      setUseM2StyleDividerInM3(true, false);
      setInteractionEffects(true, false);
      setTintedDisabledControls(true, false);
      // Text theme blends: ON light, ON dark
      // TODO(rydmike): Commented as part of blendTextTheme deprecation.
      // setBlendLightTextTheme(true, false);
      // setBlendDarkTextTheme(true, false);
      // OutlinedButton settings
      setOutlinedButtonOutlineSchemeColor(SchemeColor.primary, false);
      setOutlinedButtonPressedBorderWidth(2, false);
      // ToggleButtons settings
      setToggleButtonsBorderSchemeColor(SchemeColor.primary, false);
      // SegmentedButton settings
      setSegmentedButtonSchemeColor(SchemeColor.primary, false);
      setSegmentedButtonBorderSchemeColor(SchemeColor.primary, false);
      // Set toggles colored
      setUnselectedToggleIsColored(true, false);
      // Slider Settings
      setSliderValueTinted(true, false);
      // Set TextField Settings via InputDecorator
      setInputDecoratorSchemeColorLight(SchemeColor.primary, false);
      setInputDecoratorSchemeColorDark(SchemeColor.primary, false);
      setInputDecoratorBackgroundAlphaLight(21, false);
      setInputDecoratorBackgroundAlphaDark(43, false);
      setInputDecoratorPrefixIconSchemeColor(SchemeColor.primary, false);
      setInputDecoratorBorderRadius(12, false);
      setInputDecoratorUnfocusedHasBorder(false, false);
      // Menus and Popup
      setPopupMenuBorderRadius(6, false);
      setPopupMenuElevation(8, false);
      setMenuRadius(6, false);
      setMenuElevation(8, false);
      setMenuBarRadius(0, false);
      setMenuBarElevation(1, false);
      // Drawer settings
      setDrawerIndicatorSchemeColor(SchemeColor.primary, false);
      // BottomNavigationBar
      setBottomNavBarMuteUnselected(false, false);
      // NavigationBar settings
      setNavBarMuteUnselected(false, false);
      setNavBarSelectedIconSchemeColor(SchemeColor.onPrimary, false);
      setNavBarSelectedLabelSchemeColor(SchemeColor.primary, false);
      setNavBarIndicatorSchemeColor(SchemeColor.primary, false);
      setNavBarIndicatorOpacity(1.0, false);
      // NavigationRail settings
      setNavRailMuteUnselected(false, false);
      setNavRailSelectedIconSchemeColor(SchemeColor.onPrimary, false);
      setNavRailSelectedLabelSchemeColor(SchemeColor.primary, false);
      setNavRailIndicatorSchemeColor(SchemeColor.primary, false);
      setNavRailIndicatorOpacity(1.0, false);
    }
    // 3) Fabulous 12.
    else if (settingsId == 3) {
      // The default radius to 12 for all.
      setDefaultRadius(12, false);
      // Legacy swap OFF.
      setSwapLegacyColors(false, false);
      // Set blend modes and levels.
      setSurfaceModeLight(FlexSurfaceMode.highScaffoldLowSurface, false);
      setSurfaceModeDark(FlexSurfaceMode.highScaffoldLowSurface, false);
      setBlendLevel(1, false);
      setBlendLevelDark(2, false);
      setBlendOnLevel(8, false);
      setBlendOnLevelDark(10, false);
      // Seed generation - Turn it ON, use all 3 main seeds. Vivid algo.
      setUseKeyColors(true, false);
      setUseSecondary(true, false);
      setUseTertiary(true, false);
      setKeepPrimary(true, false);
      setUsedFlexToneSetup(16, false); // <== Jolly config.
      // Effects: M2 Divider, interaction effects, tinted disable.
      setUseM2StyleDividerInM3(true, false);
      setInteractionEffects(true, false);
      setTintedDisabledControls(true, false);
      // Text theme blends
      // TODO(rydmike): Commented as part of blendTextTheme deprecation.
      // setBlendLightTextTheme(false, false);
      // setBlendDarkTextTheme(true, false);
      // Elevated button
      setElevatedButtonSchemeColor(SchemeColor.onPrimaryContainer, false);
      setElevatedButtonSecondarySchemeColor(
          SchemeColor.primaryContainer, false);
      // OutlinedButton settings
      setOutlinedButtonOutlineSchemeColor(SchemeColor.primary, false);
      // ToggleButtons settings
      setToggleButtonsBorderSchemeColor(SchemeColor.primary, false);
      // SegmentedButton settings
      setSegmentedButtonSchemeColor(SchemeColor.primary, false);
      setSegmentedButtonBorderSchemeColor(SchemeColor.primary, false);
      // Set toggles colored
      setUnselectedToggleIsColored(true, false);
      // Slider Settings
      setSliderValueTinted(true, false);
      // Set TextField Settings via InputDecorator
      setInputDecoratorSchemeColorLight(SchemeColor.primary, false);
      setInputDecoratorSchemeColorDark(SchemeColor.primary, false);
      setInputDecoratorBackgroundAlphaLight(31, false);
      setInputDecoratorBackgroundAlphaDark(43, false);
      setInputDecoratorPrefixIconSchemeColor(SchemeColor.primary, false);
      setInputDecoratorPrefixIconDarkSchemeColor(SchemeColor.primary, false);
      setInputDecoratorUnfocusedHasBorder(false, false);
      setInputDecoratorFocusedBorderWidth(1.0, false);
      // FAB settings
      setFabUseShape(true, false);
      setFabAlwaysCircular(true, false);
      setFabSchemeColor(SchemeColor.tertiary, false);
      // Menus and Popup
      setPopupMenuBorderRadius(8, false);
      setPopupMenuElevation(3, false);
      setMenuRadius(8, false);
      setMenuElevation(3, false);
      setMenuBarRadius(0, false);
      setMenuBarElevation(2, false);
      setMenuBarShadowColor(Colors.transparent, false);
      // Drawer settings
      setDrawerIndicatorSchemeColor(SchemeColor.primary, false);
      setDrawerIndicatorBorderRadius(12, false);
      // BottomNavigationBar
      setBottomNavBarMuteUnselected(false, false);
      // NavigationBar settings
      setNavBarMuteUnselected(false, false);
      setNavBarSelectedIconSchemeColor(SchemeColor.onPrimary, false);
      setNavBarSelectedLabelSchemeColor(SchemeColor.primary, false);
      setNavBarIndicatorSchemeColor(SchemeColor.primary, false);
      setNavBarIndicatorOpacity(1.0, false);
      setNavBarIndicatorBorderRadius(12, false);
      // NavigationRail settings
      setNavRailMuteUnselected(false, false);
      setNavRailBackgroundSchemeColor(SchemeColor.surface);
      setNavRailSelectedIconSchemeColor(SchemeColor.onPrimary, false);
      setNavRailSelectedLabelSchemeColor(SchemeColor.primary, false);
      setNavRailIndicatorSchemeColor(SchemeColor.primary, false);
      setNavRailIndicatorOpacity(1.0, false);
      setNavRailIndicatorBorderRadius(12, false);
      // SearchBar
      setSearchUseGlobalShape(true, false);
      setSearchElevation(1, false);
    }
    // 4) Material 3 does M2
    else if (settingsId == 4) {
      // The default radius to 12 for all.
      setDefaultRadius(4, false);
      // No legacy swap, this is M2 emulation.
      setSwapLegacyColors(false, false);
      // Set blend modes and levels.
      setBlendLightOnColors(false, false);
      setBlendDarkOnColors(false, false);
      setBlendLevel(0, false);
      setBlendLevelDark(0, false);
      setBlendOnLevel(0, false);
      setBlendOnLevelDark(0, false);
      // Elevation tint and shadows, we keep it in dark mode.
      setAdaptiveElevationShadowsBackLight(AdaptiveResponse.all, false);
      setAdaptiveAppBarScrollUnderOffLight(AdaptiveResponse.all, false);
      setAdaptiveElevationShadowsBackDark(AdaptiveResponse.all, false);
      setAdaptiveAppBarScrollUnderOffDark(AdaptiveResponse.all, false);
      // Effects: M2 Divider, interaction effects, tinted disable.
      setUseM2StyleDividerInM3(true, false);
      setInteractionEffects(false, false);
      setTintedDisabledControls(false, false);
      // TODO(rydmike): Commented as part of blendTextTheme deprecation.
      // Text theme blends
      // setBlendLightTextTheme(false, false);
      // setBlendDarkTextTheme(false, false);
      // AppBar settings
      setAppBarStyleLight(FlexAppBarStyle.primary, false);
      setAppBarStyleDark(FlexAppBarStyle.material, false);
      setAppBarElevationLight(4, false);
      setAppBarElevationDark(4, false);
      setAppBarScrolledUnderElevationLight(4.0, false);
      setAppBarScrolledUnderElevationDark(4.0, false);
      setBottomAppBarElevationLight(8, false);
      setBottomAppBarElevationDark(8, false);
      // TabBar
      setTabBarStyle(FlexTabBarStyle.forAppBar, false);
      setTabBarDividerColor(Colors.transparent, false);
      setTabBarIndicatorSize(TabBarIndicatorSize.tab, false);
      setTabBarIndicatorWeight(2, false);
      setTabBarIndicatorTopRadius(0, false);
      // Elevated button - Make look like it used to in M2.
      setElevatedButtonSchemeColor(SchemeColor.onPrimary, false);
      setElevatedButtonSecondarySchemeColor(SchemeColor.primary, false);
      // Set TextField Settings via InputDecorator
      setInputDecoratorSchemeColorLight(SchemeColor.onSurface, false);
      setInputDecoratorSchemeColorDark(SchemeColor.onSurface, false);
      setInputDecoratorBackgroundAlphaLight(13, false);
      setInputDecoratorBackgroundAlphaDark(20, false);
      setInputDecoratorBorderSchemeColorLight(SchemeColor.primary, false);
      setInputDecoratorBorderSchemeColorDark(SchemeColor.primary, false);
      setInputDecoratorUnfocusedBorderIsColored(false, false);
      // FAB settings
      setFabUseShape(true, false);
      setFabAlwaysCircular(true, false);
      // With real M3 schemes this looks bad, but it is M2 color mapping.
      setFabSchemeColor(SchemeColor.secondary, false);
      // Chip settings
      setChipSchemeColor(SchemeColor.primary, false);
      setChipBorderRadius(20, false);
      // Menus and Popup
      setPopupMenuElevation(8, false);
      setMenuElevation(8, false);
      setMenuBarRadius(0, false);
      setMenuBarElevation(1, false);
      // Tooltips
      setTooltipRadius(4, false);
      // Dialog settings
      setDialogElevation(24, false);
      setDatePickerHeaderBackgroundSchemeColor(SchemeColor.primary, false);
      // Set SnackBar to M2/M3 style.
      setSnackBarSchemeColor(SchemeColor.inverseSurface, false);
      // Drawer settings
      setDrawerElevation(16, false);
      setDrawerWidth(304, false);
      // BottomSheet
      setBottomSheetElevation(10, false);
      setBottomSheetModalElevation(20, false);
      // BottomNavigationBar
      setBottomNavigationBarElevation(8, false);
      setBottomNavBarSelectedSchemeColor(SchemeColor.primary, false);
      setBottomNavBarMuteUnselected(true, false);
      // NavigationBar settings
      setNavBarIndicatorSchemeColor(SchemeColor.secondary, false);
      setNavBarBackgroundSchemeColor(SchemeColor.surfaceContainer, false);
      setNavBarSelectedIconSchemeColor(SchemeColor.onSurface, false);
      setNavBarSelectedLabelSchemeColor(SchemeColor.onSurface, false);
      setNavBarUnselectedSchemeColor(SchemeColor.onSurface, false);
      setNavBarElevation(0, false);
      setNavBarMuteUnselected(true, false);
      // NavigationRail settings
      setNavRailSelectedIconSchemeColor(SchemeColor.onSurface, false);
      setNavRailSelectedLabelSchemeColor(SchemeColor.onSurface, false);
      setNavRailUnselectedSchemeColor(SchemeColor.onSurface, false);
      setNavRailIndicatorSchemeColor(SchemeColor.secondary, false);
      setNavRailMuteUnselected(true, false);
      // ListTile
      setListTileMinVerticalPadding(4, false);
      setListTilePaddingEnd(16, false);
    }
    // 5) High contrast
    else if (settingsId == 5) {
      // Legacy swap
      setSwapLegacyColors(true, false);
      // Set blend modes and levels.
      setSurfaceModeLight(FlexSurfaceMode.highScaffoldLowSurface, false);
      setSurfaceModeDark(FlexSurfaceMode.highScaffoldLowSurface, false);
      setBlendLevel(22, false);
      setBlendLevelDark(18, false);
      setLightIsWhite(true, false);
      setDarkIsTrueBlack(true, false);
      // Seed generation - Turn it ON, use all 3 main seeds. Vivid algo.
      setUseKeyColors(true, false);
      setUseSecondary(true, false);
      setUseTertiary(true, false);
      setUsedFlexToneSetup(15, false); // <== Ultra contrast.
      setKeepPrimary(true, false);
      setKeepSecondary(true, false);
      setKeepTertiary(true, false);
      setOnMainsUseBWLight(true, false);
      setOnMainsUseBWDark(false, false);
      setOnSurfacesUseBWLight(true, false);
      setOnSurfacesUseBWDark(false, false);
      setUseMonoSurfacesLight(true, false);
      setUseMonoSurfacesDark(true, false);
      // Effects: M2 Divider, interaction effects, tinted disable.
      setUseM2StyleDividerInM3(true, false);
      setInteractionEffects(true, false);
      setTintedDisabledControls(true, false);
      // TODO(rydmike): Commented as part of blendTextTheme deprecation.
      // Text theme blends
      // setBlendLightTextTheme(false, false);
      // setBlendDarkTextTheme(false, false);
      // AppBar settings
      setAppBarStyleLight(FlexAppBarStyle.background, false);
      setAppBarStyleDark(FlexAppBarStyle.background, false);
      setBottomAppBarElevationLight(1, false);
      setBottomAppBarElevationDark(2, false);
      // Set TextField Settings via InputDecorator
      setInputDecoratorSchemeColorLight(SchemeColor.primary, false);
      setInputDecoratorSchemeColorDark(SchemeColor.primary, false);
      setInputDecoratorBackgroundAlphaLight(21, false);
      setInputDecoratorBackgroundAlphaDark(43, false);
      setInputDecoratorPrefixIconSchemeColor(SchemeColor.primary, false);
      setInputDecoratorPrefixIconDarkSchemeColor(SchemeColor.primary, false);
      setInputDecoratorBorderRadius(8, false);
      setInputDecoratorUnfocusedHasBorder(false, false);
      // FAB settings
      setFabSchemeColor(SchemeColor.tertiary, false);
      // Elevated button
      setElevatedButtonSchemeColor(SchemeColor.onPrimaryContainer, false);
      setElevatedButtonSecondarySchemeColor(
          SchemeColor.primaryContainer, false);
      // SegmentedButton settings
      setSegmentedButtonSchemeColor(SchemeColor.primary, false);
      // Menus and Popup
      setPopupMenuBorderRadius(6, false);
      setPopupMenuElevation(4, false);
      setMenuRadius(6, false);
      setMenuElevation(4, false);
      setMenuBarRadius(0, false);
      setMenuBarElevation(1, false);
      // Dialogs
      setDialogElevation(3, false);
      setDialogBorderRadius(20, false);
      // SnackBar
      setSnackBarSchemeColor(SchemeColor.inverseSurface, false);
      // BottomSheet
      setBottomSheetElevation(2, false);
      setBottomSheetModalElevation(3, false);
      setBottomSheetBorderRadius(20, false);
      // Drawer settings
      setDrawerIndicatorSchemeColor(SchemeColor.primary, false);
      // BottomNavigationBar
      setBottomNavBarMuteUnselected(false, false);
      setBottomNavBarBackgroundSchemeColor(SchemeColor.surfaceContainer, false);
      // NavigationBar settings
      setNavBarBackgroundSchemeColor(SchemeColor.surface, false);
      setNavBarMuteUnselected(false, false);
      setNavBarSelectedIconSchemeColor(SchemeColor.surface, false);
      setNavBarSelectedLabelSchemeColor(SchemeColor.primary, false);
      setNavBarElevation(1, false);
      setNavBarIndicatorSchemeColor(SchemeColor.primary, false);
      setNavBarIndicatorOpacity(1.0, false);
      // NavigationRail settings
      setNavRailMuteUnselected(false, false);
      setNavRailSelectedIconSchemeColor(SchemeColor.surface, false);
      setNavRailSelectedLabelSchemeColor(SchemeColor.primary, false);
      setNavRailIndicatorSchemeColor(SchemeColor.primary, false);
      setNavRailIndicatorOpacity(1.0, false);
      // SearchBar
      setSearchUseGlobalShape(true, false);
      setSearchElevation(3, false);
    }
    // 6) One hue
    else if (settingsId == 6) {
      // Legacy swap
      setSwapLegacyColors(false, false);
      setUsedColors(1, false);
      // Set blend modes and levels.
      setSurfaceModeLight(FlexSurfaceMode.highBackgroundLowScaffold, false);
      setSurfaceModeDark(FlexSurfaceMode.highBackgroundLowScaffold, false);
      setBlendLevel(1, false);
      setBlendLevelDark(4, false);
      setBlendOnLevel(10, false);
      setBlendOnLevelDark(10, false);
      // Seed generation - Turn it ON, use all 3 main seeds. Vivid algo.
      setUseKeyColors(true, false);
      setUseSecondary(true, false);
      setUseTertiary(true, false);
      setUsedFlexToneSetup(18, false); // <-- One hue
      setKeepPrimary(true, false);
      // Effects: M2 Divider, interaction effects, tinted disable.
      setUseM2StyleDividerInM3(true, false);
      setInteractionEffects(true, false);
      setTintedDisabledControls(true, false);
      // TODO(rydmike): Commented as part of blendTextTheme deprecation.
      // Text theme blends
      // setBlendLightTextTheme(false, false);
      // setBlendDarkTextTheme(true, false);
      // AppBar settings
      setAppBarStyleLight(FlexAppBarStyle.background, false);
      setAppBarStyleDark(FlexAppBarStyle.background, false);
      // Set TextField Settings via InputDecorator
      setInputDecoratorSchemeColorLight(SchemeColor.primary, false);
      setInputDecoratorSchemeColorDark(SchemeColor.primary, false);
      setInputDecoratorBackgroundAlphaLight(21, false);
      setInputDecoratorBackgroundAlphaDark(43, false);
      setInputDecoratorPrefixIconSchemeColor(SchemeColor.primary, false);
      setInputDecoratorPrefixIconDarkSchemeColor(SchemeColor.primary, false);
      setInputDecoratorBorderRadius(8, false);
      setInputDecoratorUnfocusedHasBorder(false, false);
      // Elevated button
      setElevatedButtonSchemeColor(SchemeColor.onPrimaryContainer, false);
      setElevatedButtonSecondarySchemeColor(
          SchemeColor.primaryContainer, false);
      // SegmentedButton settings
      setSegmentedButtonSchemeColor(SchemeColor.primary, false);
      // Menus and Popup
      setPopupMenuBorderRadius(6, false);
      setPopupMenuElevation(4, false);
      setMenuRadius(6, false);
      setMenuElevation(4, false);
      setMenuBarRadius(0, false);
      setMenuBarElevation(1, false);
      // Dialogs
      setDialogElevation(3, false);
      setDialogBorderRadius(20, false);
      // Drawer settings
      setDrawerIndicatorSchemeColor(SchemeColor.primary, false);
      // BottomNavigationBar
      setBottomNavBarMuteUnselected(false, false);
      // NavigationBar settings
      setNavBarBackgroundSchemeColor(SchemeColor.surfaceContainer, false);
      setNavBarMuteUnselected(false, false);
      setNavBarSelectedIconSchemeColor(SchemeColor.onPrimary, false);
      setNavBarSelectedLabelSchemeColor(SchemeColor.primary, false);
      setNavBarElevation(0, false);
      // setNavBarUnselectedSchemeColor(SchemeColor.primary, false);
      setNavBarIndicatorSchemeColor(SchemeColor.primary, false);
      setNavBarIndicatorOpacity(1.0, false);
      // NavigationRail settings
      setNavRailMuteUnselected(false, false);
      setNavRailSelectedIconSchemeColor(SchemeColor.onPrimary, false);
      setNavRailSelectedLabelSchemeColor(SchemeColor.primary, false);
      setNavRailIndicatorSchemeColor(SchemeColor.primary, false);
      setNavRailIndicatorOpacity(1.0, false);
      // SearchBar
      setSearchUseGlobalShape(true, false);
      setSearchElevation(2, false);
    }
    // 7) Platform adaptive.
    else if (settingsId == 7) {
      // The default radius to default for standard and 10 for adaptive.
      setDefaultRadius(null, false);
      setDefaultRadiusAdaptive(10, false);
      setAdaptiveResponseRadius(
          AdaptiveResponse.excludeWebAndroidFuchsia, false);
      // Legacy swap OFF.
      setSwapLegacyColors(false, false);
      // Set blend modes and levels.
      setSurfaceModeLight(FlexSurfaceMode.highBackgroundLowScaffold, false);
      setSurfaceModeDark(FlexSurfaceMode.highBackgroundLowScaffold, false);
      setBlendLevel(1, false);
      setBlendLevelDark(2, false);
      setBlendOnLevel(6, false);
      setBlendOnLevelDark(8, false);
      // Seed generation - Turn it OFF, use all 3 main seeds is set ON.
      setUseKeyColors(false, false);
      setUseSecondary(true, false);
      setUseTertiary(true, false);
      setKeepPrimary(true, false);
      setUsedFlexToneSetup(19, false); // <-- Candy pop scheme.
      // Effects: M2 Divider, interaction effects, tinted disable.
      setUseM2StyleDividerInM3(true, false);
      setInteractionEffects(true, false);
      setTintedDisabledControls(true, false);
      // Elevation tint and shadows, we keep elevation tint in dark mode, it
      // is very useful there. We also add elevation shadows back in dark
      // mode on all platforms, they are barely visible there anyway but
      // may help with contrast a bit.
      setAdaptiveElevationShadowsBackLight(
          AdaptiveResponse.excludeWebAndroidFuchsia, false);
      setAdaptiveAppBarScrollUnderOffLight(
          AdaptiveResponse.excludeWebAndroidFuchsia, false);
      setAdaptiveElevationShadowsBackDark(AdaptiveResponse.all, false);
      setAdaptiveAppBarScrollUnderOffDark(
          AdaptiveResponse.excludeWebAndroidFuchsia, false);
      // TODO(rydmike): Commented as part of blendTextTheme deprecation.
      // Text theme blends
      // setBlendLightTextTheme(false, false);
      // setBlendDarkTextTheme(false, false);
      // AppBar settings
      setAppBarStyleLight(FlexAppBarStyle.background, false);
      setAppBarStyleDark(FlexAppBarStyle.background, false);
      setAppBarElevationLight(0, false);
      setAppBarElevationDark(0, false);
      setAppBarScrolledUnderElevationLight(1, false);
      setAppBarScrolledUnderElevationDark(3, false);
      setBottomAppBarElevationLight(2, false);
      setBottomAppBarElevationDark(2, false);
      // Elevated button
      setElevatedButtonSchemeColor(SchemeColor.onPrimaryContainer, false);
      setElevatedButtonSecondarySchemeColor(
          SchemeColor.primaryContainer, false);
      // OutlinedButton settings
      setOutlinedButtonOutlineSchemeColor(SchemeColor.primary, false);
      // ToggleButtons settings
      setToggleButtonsBorderSchemeColor(SchemeColor.primary, false);
      // SegmentedButton settings
      setSegmentedButtonSchemeColor(SchemeColor.primary, false);
      setSegmentedButtonBorderSchemeColor(SchemeColor.primary, false);
      // Set toggles colored
      setUnselectedToggleIsColored(true, false);
      // Slider Settings
      setSliderValueTinted(true, false);
      // Set TextField Settings via InputDecorator
      setInputDecoratorSchemeColorLight(SchemeColor.primary, false);
      setInputDecoratorSchemeColorDark(SchemeColor.primary, false);
      setInputDecoratorBackgroundAlphaLight(19, false);
      setInputDecoratorBackgroundAlphaDark(22, false);
      setInputDecoratorPrefixIconSchemeColor(SchemeColor.primary, false);
      setInputDecoratorPrefixIconDarkSchemeColor(SchemeColor.primary, false);
      setInputDecoratorUnfocusedHasBorder(false, false);
      setInputDecoratorFocusedBorderWidth(1.0, false);
      // FAB settings
      setFabUseShape(true, false);
      setFabAlwaysCircular(true, false);
      setFabSchemeColor(SchemeColor.tertiary, false);
      // Menus and Popup
      setPopupMenuBorderRadius(6, false);
      setPopupMenuElevation(3, false);
      setMenuRadius(6, false);
      setMenuElevation(3, false);
      setMenuBarRadius(0, false);
      setMenuBarElevation(1, false);
      setMenuBarShadowColor(Colors.transparent, false);
      // Drawer settings
      setDrawerElevation(1, false);
      setDrawerIndicatorSchemeColor(SchemeColor.primary, false);
      // BottomSheet
      setBottomSheetBorderRadius(18, false);
      setBottomSheetElevation(2, false);
      setBottomSheetModalElevation(4, false);
      // Card
      setCardBorderRadius(14, false);
      // Dialogs
      setDialogBorderRadius(18, false);
      // BottomNavigationBar
      setBottomNavBarMuteUnselected(false, false);
      // NavigationBar settings
      setNavBarElevation(1, false);
      setNavBarMuteUnselected(false, false);
      setNavBarSelectedIconSchemeColor(SchemeColor.onPrimary, false);
      setNavBarSelectedLabelSchemeColor(SchemeColor.primary, false);
      setNavBarIndicatorSchemeColor(SchemeColor.primary, false);
      setNavBarIndicatorOpacity(1.0, false);
      // NavigationRail settings
      setNavRailElevation(0, false);
      setNavRailMuteUnselected(false, false);
      setNavRailBackgroundSchemeColor(SchemeColor.surface);
      setNavRailSelectedIconSchemeColor(SchemeColor.onPrimary, false);
      setNavRailSelectedLabelSchemeColor(SchemeColor.primary, false);
      setNavRailIndicatorSchemeColor(SchemeColor.primary, false);
      setNavRailIndicatorOpacity(1.0, false);
      // SearchBar
      setSearchUseGlobalShape(true, false);
      setSearchElevation(4, false);
    }
    // 8) Colorful Scaffold.
    else if (settingsId == 8) {
      // Legacy swap ON.
      setSwapLegacyColors(true, false);
      // Set blend modes and levels.
      setSurfaceModeLight(FlexSurfaceMode.highScaffoldLowSurface, false);
      setSurfaceModeDark(FlexSurfaceMode.highScaffoldLowSurface, false);
      setBlendLevel(20, false);
      setBlendLevelDark(30, false);
      setBlendLightOnColors(true, false);
      setBlendDarkOnColors(true, false);
      setBlendOnLevel(20, false);
      setBlendOnLevelDark(40, false);
      // Seed generation - Turn it ON, use prim and tertiary light, prim dark.
      setUseKeyColors(true, false);
      setUseSecondary(false, false);
      setUseTertiary(true, false);
      setUsedFlexToneSetup(20, false); // <-- Chroma scheme.
      setKeepPrimary(true, false);
      setKeepTertiary(true, false);
      setKeepDarkPrimary(true, true);
      // Border widths
      setThickBorderWidth(2, false);
      // Effects: M2 Divider, interaction effects, tinted disable.
      setUseM2StyleDividerInM3(true, false);
      setInteractionEffects(true, false);
      setTintedDisabledControls(true, false);
      // TODO(rydmike): Commented as part of blendTextTheme deprecation.
      // Text theme blends: ON light, ON dark
      // setBlendLightTextTheme(true, false);
      // setBlendDarkTextTheme(true, false);
      // AppBar settings
      setAppBarStyleLight(FlexAppBarStyle.background, false);
      setAppBarStyleDark(FlexAppBarStyle.background, false);
      setAppBarScrolledUnderElevationLight(8, false);
      setBottomAppBarElevationLight(1, false);
      setBottomAppBarElevationDark(2, false);
      // Elevated button
      setElevatedButtonSchemeColor(SchemeColor.onPrimaryContainer, false);
      setElevatedButtonSecondarySchemeColor(
          SchemeColor.primaryContainer, false);
      // OutlinedButton settings
      setOutlinedButtonOutlineSchemeColor(SchemeColor.primary, false);
      // ToggleButtons settings
      setToggleButtonsBorderSchemeColor(SchemeColor.primary, false);
      // SegmentedButton settings
      setSegmentedButtonSchemeColor(SchemeColor.primary, false);
      setSegmentedButtonBorderSchemeColor(SchemeColor.primary, false);
      // Set Chip
      setChipBorderRadius(10, false);
      // Set toggles colored
      setUnselectedToggleIsColored(true, false);
      // Slider Settings
      setSliderValueTinted(true, false);
      // Set TextField Settings via InputDecorator
      setInputDecoratorSchemeColorLight(SchemeColor.primary, false);
      setInputDecoratorSchemeColorDark(SchemeColor.primary, false);
      setInputDecoratorBackgroundAlphaLight(15, false);
      setInputDecoratorBackgroundAlphaDark(22, false);
      setInputDecoratorPrefixIconSchemeColor(SchemeColor.primary, false);
      setInputDecoratorBorderRadius(10, false);
      // Menus and Popup
      setPopupMenuBorderRadius(6, false);
      setPopupMenuElevation(6, false);
      setMenuRadius(6, false);
      setMenuElevation(6, false);
      setMenuBarRadius(0, false);
      setMenuBarElevation(1, false);
      // Drawer settings
      setDrawerIndicatorSchemeColor(SchemeColor.primary, false);
      setDrawerWidth(280, false);
      // BottomNavigationBar
      setBottomNavBarMuteUnselected(false, false);
      // NavigationBar settings
      setNavBarMuteUnselected(false, false);
      setNavBarSelectedIconSchemeColor(SchemeColor.onPrimary, false);
      setNavBarSelectedLabelSchemeColor(SchemeColor.primary, false);
      setNavBarIndicatorSchemeColor(SchemeColor.primary, false);
      setNavBarIndicatorOpacity(1.0, false);
      setNavBarElevation(2, false);
      setNavBarHeight(70, false);
      // NavigationRail settings
      setNavRailMuteUnselected(false, false);
      setNavRailSelectedIconSchemeColor(SchemeColor.onPrimary, false);
      setNavRailSelectedLabelSchemeColor(SchemeColor.primary, false);
      setNavRailIndicatorSchemeColor(SchemeColor.primary, false);
      setNavRailIndicatorOpacity(1.0, false);
      // SearchBar
      setSearchUseGlobalShape(true, false);
      setSearchElevation(1, false);
    }
    // 9) Computed theme
    else if (settingsId == 9) {
      // Legacy swap
      setSwapLegacyColors(false, false);
      setUsedColors(7, false); // Use primary, secondary and Tertiary
      // Set blend modes and levels.
      setSurfaceModeLight(FlexSurfaceMode.highScaffoldLowSurface, false);
      setSurfaceModeDark(FlexSurfaceMode.highScaffoldLowSurface, false);
      setBlendLevel(4, false);
      setBlendLevelDark(10, false);
      setBlendLightOnColors(false, false);
      setBlendDarkOnColors(true, false);
      setBlendOnLevel(10, false);
      setBlendOnLevelDark(20, false);
      // Set computed dark theme
      setUseToDarkMethod(true, false);
      setToDarkSwapPrimaryAndContainer(false, false);
      setDarkMethodLevel(40, false);
      setUseM3ErrorColors(true, true);
      // Effects: M2 Divider, interaction effects, tinted disable.
      setUseM2StyleDividerInM3(true, false);
      setInteractionEffects(true, false);
      setTintedDisabledControls(true, false);
      // Border widths
      setThickBorderWidth(2, false);
      // Effects: M2 Divider, interaction effects, tinted disable.
      setUseM2StyleDividerInM3(true, false);
      setInteractionEffects(true, false);
      setTintedDisabledControls(true, false);
      // TODO(rydmike): Commented as part of blendTextTheme deprecation.
      // Text theme blends: ON light, ON dark
      // setBlendLightTextTheme(true, false);
      // setBlendDarkTextTheme(true, false);
      // AppBar settings
      setAppBarStyleLight(FlexAppBarStyle.background, false);
      setAppBarStyleDark(FlexAppBarStyle.background, false);
      setAppBarScrolledUnderElevationLight(8, false);
      setBottomAppBarElevationLight(1, false);
      setBottomAppBarElevationDark(2, false);
      // Elevated button
      setElevatedButtonSchemeColor(SchemeColor.onPrimaryContainer, false);
      setElevatedButtonSecondarySchemeColor(
          SchemeColor.primaryContainer, false);
      // Set TextField Settings via InputDecorator
      setInputDecoratorBorderRadius(8, false);
      setInputDecoratorSchemeColorLight(SchemeColor.primary, false);
      setInputDecoratorSchemeColorDark(SchemeColor.primary, false);
      setInputDecoratorBackgroundAlphaLight(12, false);
      setInputDecoratorBackgroundAlphaDark(48, false);
      setInputDecoratorPrefixIconSchemeColor(SchemeColor.primary, false);
      setInputDecoratorPrefixIconDarkSchemeColor(SchemeColor.primary, false);
      setInputDecoratorUnfocusedHasBorder(false, false);
      // Drawer settings
      setDrawerWidth(290, false);
      setDrawerElevation(1, false);
      // BottomNavigationBar
      setBottomNavBarMuteUnselected(false, false);
      setBottomNavBarSelectedSchemeColor(SchemeColor.secondary, false);
      // NavigationBar settings
      setNavBarSelectedIconSchemeColor(SchemeColor.onSecondaryContainer, false);
      setNavBarSelectedLabelSchemeColor(
          SchemeColor.onSecondaryContainer, false);
      setNavBarIndicatorSchemeColor(SchemeColor.secondaryContainer, false);
      setNavBarIndicatorOpacity(1.0, false);
      setNavBarElevation(1, false);
      setNavBarHeight(72, false);
      // NavigationRail settings
      setNavRailSelectedIconSchemeColor(
          SchemeColor.onSecondaryContainer, false);
      setNavRailSelectedLabelSchemeColor(
          SchemeColor.onSecondaryContainer, false);
      setNavRailIndicatorSchemeColor(SchemeColor.secondaryContainer, false);
      setNavRailIndicatorOpacity(1.0, false);
      // SearchBar
      setSearchUseGlobalShape(true, false);
      setSearchElevation(1, false);
    }
    // All settings have been modified, now notify listeners.
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
  void setThemeMode(ThemeMode? value, [bool notify = true]) {
    // No work if null value passed.
    if (value == null) return;
    // Do not perform any work if new and old value are identical.
    if (value == _themeMode) return;
    // Otherwise, assign new value to private property.
    _themeMode = value;
    // Inform all listeners a change has occurred, if notify flag is true.
    if (notify) notifyListeners();
    // Persist the change to whatever storage is used with the ThemeService.
    unawaited(_themeService.save(Store.keyThemeMode, value));
  }

  // Repeat above pattern for all other theme settings. The properties will
  // not be further explained, property names correspond to equivalent
  // FlexColorScheme properties.
  late VisualDensityEnum? _usedVisualDensity;
  VisualDensityEnum? get usedVisualDensity => _usedVisualDensity;
  void setUsedVisualDensity(VisualDensityEnum? value, [bool notify = true]) {
    if (value == _usedVisualDensity) return;
    _usedVisualDensity = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyUsedVisualDensity, value));
  }

  late MaterialTapTargetSize? _tapTargetSize;
  MaterialTapTargetSize? get tapTargetSize => _tapTargetSize;
  void setTapTargetSize(MaterialTapTargetSize? value, [bool notify = true]) {
    if (value == _tapTargetSize) return;
    _tapTargetSize = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTapTargetSize, value));
  }

  late bool _useFlexColorScheme;
  bool get useFlexColorScheme => _useFlexColorScheme;
  void setUseFlexColorScheme(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _useFlexColorScheme) return;
    _useFlexColorScheme = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyUseFlexColorScheme, value));
  }

  late bool _useSubThemes;
  bool get useSubThemes => _useSubThemes;
  void setUseSubThemes(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _useSubThemes) return;
    _useSubThemes = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyUseSubThemes, value));
  }

  late bool _codeForFile;
  bool get codeForFile => _codeForFile;
  void setCodeForFile(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _codeForFile) return;
    _codeForFile = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyCodeForFile, value));
  }

  late bool _applyThemeToAllCupertino;
  bool get applyThemeToAllCupertino => _applyThemeToAllCupertino;
  void setApplyThemeToAllCupertino(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _applyThemeToAllCupertino) return;
    _applyThemeToAllCupertino = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyApplyThemeToAllCupertino, value));
  }

  late AdaptiveResponse? _adaptiveRemoveElevationTintLight;
  AdaptiveResponse? get adaptiveRemoveElevationTintLight =>
      _adaptiveRemoveElevationTintLight;
  void setAdaptiveRemoveElevationTintLight(AdaptiveResponse? value,
      [bool notify = true]) {
    if (value == _adaptiveRemoveElevationTintLight) return;
    _adaptiveRemoveElevationTintLight = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyAdaptiveRemoveElevationTintLight, value));
  }

  late AdaptiveResponse? _adaptiveElevationShadowsBackLight;
  AdaptiveResponse? get adaptiveElevationShadowsBackLight =>
      _adaptiveElevationShadowsBackLight;
  void setAdaptiveElevationShadowsBackLight(AdaptiveResponse? value,
      [bool notify = true]) {
    if (value == _adaptiveElevationShadowsBackLight) return;
    _adaptiveElevationShadowsBackLight = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyAdaptiveElevationShadowsBackLight, value));
  }

  late AdaptiveResponse? _adaptiveAppBarScrollUnderOffLight;
  AdaptiveResponse? get adaptiveAppBarScrollUnderOffLight =>
      _adaptiveAppBarScrollUnderOffLight;
  void setAdaptiveAppBarScrollUnderOffLight(AdaptiveResponse? value,
      [bool notify = true]) {
    if (value == _adaptiveAppBarScrollUnderOffLight) return;
    _adaptiveAppBarScrollUnderOffLight = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyAdaptiveAppBarScrollUnderOffLight, value));
  }

  late AdaptiveResponse? _adaptiveRemoveElevationTintDark;
  AdaptiveResponse? get adaptiveRemoveElevationTintDark =>
      _adaptiveRemoveElevationTintDark;
  void setAdaptiveRemoveElevationTintDark(AdaptiveResponse? value,
      [bool notify = true]) {
    if (value == _adaptiveRemoveElevationTintDark) return;
    _adaptiveRemoveElevationTintDark = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyAdaptiveRemoveElevationTintDark, value));
  }

  late AdaptiveResponse? _adaptiveElevationShadowsBackDark;
  AdaptiveResponse? get adaptiveElevationShadowsBackDark =>
      _adaptiveElevationShadowsBackDark;
  void setAdaptiveElevationShadowsBackDark(AdaptiveResponse? value,
      [bool notify = true]) {
    if (value == _adaptiveElevationShadowsBackDark) return;
    _adaptiveElevationShadowsBackDark = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyAdaptiveElevationShadowsBackDark, value));
  }

  late AdaptiveResponse? _adaptiveAppBarScrollUnderOffDark;
  AdaptiveResponse? get adaptiveAppBarScrollUnderOffDark =>
      _adaptiveAppBarScrollUnderOffDark;
  void setAdaptiveAppBarScrollUnderOffDark(AdaptiveResponse? value,
      [bool notify = true]) {
    if (value == _adaptiveAppBarScrollUnderOffDark) return;
    _adaptiveAppBarScrollUnderOffDark = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyAdaptiveAppBarScrollUnderOffDark, value));
  }

  late AdaptiveResponse? _adaptiveResponseRadius;
  AdaptiveResponse? get adaptiveResponseRadius => _adaptiveResponseRadius;
  void setAdaptiveResponseRadius(AdaptiveResponse? value,
      [bool notify = true]) {
    if (value == _adaptiveResponseRadius) return;
    _adaptiveResponseRadius = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyAdaptiveRadius, value));
  }

  late AdaptiveResponse? _adaptiveResponseSplash;
  AdaptiveResponse? get adaptiveResponseSplash => _adaptiveResponseSplash;
  void setAdaptiveResponseSplash(AdaptiveResponse? value,
      [bool notify = true]) {
    if (value == _adaptiveResponseSplash) return;
    _adaptiveResponseSplash = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyAdaptiveSplash, value));
  }

  late SplashTypeEnum? _splashType;
  SplashTypeEnum? get splashType => _splashType;
  void setSplashType(SplashTypeEnum? value, [bool notify = true]) {
    if (value == _splashType) return;
    _splashType = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySplashType, value));
  }

  late SplashTypeEnum? _splashTypeAdaptive;
  SplashTypeEnum? get splashTypeAdaptive => _splashTypeAdaptive;
  void setSplashTypeAdaptive(SplashTypeEnum? value, [bool notify = true]) {
    if (value == _splashTypeAdaptive) return;
    _splashTypeAdaptive = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySplashTypeAdaptive, value));
  }

  late bool _compactMode;
  bool get compactMode => _compactMode;
  void setCompactMode(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _compactMode) return;
    _compactMode = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyCompactMode, value));
  }

  late bool _verticalMode;
  bool get verticalMode => _verticalMode;
  void setVerticalMode(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _verticalMode) return;
    _verticalMode = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyVerticalMode, value));
  }

  late bool _confirmPremade;
  bool get confirmPremade => _confirmPremade;
  void setConfirmPremade(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _confirmPremade) return;
    _confirmPremade = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyConfirmPremade, value));
  }

  late int _viewIndex;
  int get viewIndex => _viewIndex;
  void setViewIndex(int? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _viewIndex) return;
    _viewIndex = value;
    notifyListeners();
    unawaited(_themeService.save(Store.keyViewIndex, value));
  }

  late int _simulatorDeviceIndex;
  int get simulatorDeviceIndex => _simulatorDeviceIndex;
  void setSimulatorDeviceIndex(int? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _simulatorDeviceIndex) return;
    _simulatorDeviceIndex = value;
    notifyListeners();
    unawaited(_themeService.save(Store.keySimulatorDeviceIndex, value));
  }

  late int _simulatorAppIndex;
  int get simulatorAppIndex => _simulatorAppIndex;
  void setSimulatorAppIndex(int? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _simulatorAppIndex) return;
    _simulatorAppIndex = value;
    notifyListeners();
    unawaited(_themeService.save(Store.keySimulatorAppIndex, value));
  }

  late int _simulatorComponentsIndex;
  int get simulatorComponentsIndex => _simulatorComponentsIndex;
  void setSimulatorComponentsIndex(int? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _simulatorComponentsIndex) return;
    _simulatorComponentsIndex = value;
    notifyListeners();
    unawaited(_themeService.save(Store.keySimulatorComponentsIndex, value));
  }

  late int _sideViewIndex;
  int get sideViewIndex => _sideViewIndex;
  void setSideViewIndex(int? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _sideViewIndex) return;
    _sideViewIndex = value;
    notifyListeners();
    unawaited(_themeService.save(Store.keySideViewIndex, value));
  }

  late double _deviceSize;
  double get deviceSize => _deviceSize;
  void setDeviceSize(double? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _deviceSize) return;
    _deviceSize = value;
    notifyListeners();
    unawaited(_themeService.save(Store.keyDeviceSize, value));
  }

  late bool _showSchemeInput;
  bool get showSchemeInput => _showSchemeInput;
  void setShowSchemeInput(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _showSchemeInput) return;
    _showSchemeInput = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyShowSchemeInput, value));
  }

  late bool? _useMaterial3Typography;
  bool? get useMaterial3Typography => _useMaterial3Typography;
  void setUseMaterial3Typography(bool? value, [bool notify = true]) {
    if (value == _useMaterial3Typography) return;
    _useMaterial3Typography = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyUseMaterial3Typography, value));
  }

  late bool _useM2StyleDividerInM3;
  bool get useM2StyleDividerInM3 => _useM2StyleDividerInM3;
  void setUseM2StyleDividerInM3(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _useM2StyleDividerInM3) return;
    _useM2StyleDividerInM3 = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyUseM2StyleDividerInM3, value));
  }

  late bool _useAppFont;
  bool get useAppFont => _useAppFont;
  void setUseAppFont(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _useAppFont) return;
    _useAppFont = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyUseAppFont, value));
  }

  late FlexScheme _usedScheme;
  FlexScheme get usedScheme => _usedScheme;
  void setUsedScheme(FlexScheme? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _usedScheme) return;
    _usedScheme = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyUsedScheme, value));
  }

  late int _schemeIndex;
  int get schemeIndex => _schemeIndex;
  void setSchemeIndex(int? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _schemeIndex) return;
    _schemeIndex = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySchemeIndex, value));
  }

  late bool _interactionEffects;
  bool get interactionEffects => _interactionEffects;
  void setInteractionEffects(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _interactionEffects) return;
    _interactionEffects = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyInteractionEffects, value));
  }

  late bool _tintedDisabledControls;
  bool get tintedDisabledControls => _tintedDisabledControls;
  void setTintedDisabledControls(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _tintedDisabledControls) return;
    _tintedDisabledControls = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTintedDisabledControls, value));
  }

  late double? _defaultRadius;
  double? get defaultRadius => _defaultRadius;
  void setDefaultRadius(double? value, [bool notify = true]) {
    if (value == _defaultRadius) return;
    _defaultRadius = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyDefaultRadius, value));
  }

  late double? _defaultRadiusAdaptive;
  double? get defaultRadiusAdaptive => _defaultRadiusAdaptive;
  void setDefaultRadiusAdaptive(double? value, [bool notify = true]) {
    if (value == _defaultRadiusAdaptive) return;
    _defaultRadiusAdaptive = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyDefaultRadiusAdaptive, value));
  }

  late double? _thinBorderWidth;
  double? get thinBorderWidth => _thinBorderWidth;
  void setThinBorderWidth(double? value, [bool notify = true]) {
    if (value == _thinBorderWidth) return;
    _thinBorderWidth = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyThinBorderWidth, value));
  }

  late double? _thickBorderWidth;
  double? get thickBorderWidth => _thickBorderWidth;
  void setThickBorderWidth(double? value, [bool notify = true]) {
    if (value == _thickBorderWidth) return;
    _thickBorderWidth = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyThickBorderWidth, value));
  }

  late bool _tooltipsMatchBackground;
  bool get tooltipsMatchBackground => _tooltipsMatchBackground;
  void setTooltipsMatchBackground(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _tooltipsMatchBackground) return;
    _tooltipsMatchBackground = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTooltipsMatchBackground, value));
  }

  // Surface and blend SETTINGS.
  // ===========================================================================

  late FlexScaffoldBaseColor? _scaffoldBackgroundLightBaseColor;
  FlexScaffoldBaseColor? get scaffoldBackgroundLightBaseColor =>
      _scaffoldBackgroundLightBaseColor;
  void setScaffoldBackgroundLightBaseColor(FlexScaffoldBaseColor? value,
      [bool notify = true]) {
    if (value == _scaffoldBackgroundLightBaseColor) return;
    _scaffoldBackgroundLightBaseColor = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyScaffoldBackgroundLightBaseColor, value));
  }

  late FlexScaffoldBaseColor? _scaffoldBackgroundDarkBaseColor;
  FlexScaffoldBaseColor? get scaffoldBackgroundDarkBaseColor =>
      _scaffoldBackgroundDarkBaseColor;
  void setScaffoldBackgroundDarkBaseColor(FlexScaffoldBaseColor? value,
      [bool notify = true]) {
    if (value == _scaffoldBackgroundDarkBaseColor) return;
    _scaffoldBackgroundDarkBaseColor = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyScaffoldBackgroundDarkBaseColor, value));
  }

  late SchemeColor? _scaffoldBackgroundLightSchemeColor;
  SchemeColor? get scaffoldBackgroundLightSchemeColor =>
      _scaffoldBackgroundLightSchemeColor;
  void setScaffoldBackgroundLightSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _scaffoldBackgroundLightSchemeColor) return;
    _scaffoldBackgroundLightSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyScaffoldBackgroundLightSchemeColor, value));
  }

  late SchemeColor? _scaffoldBackgroundDarkSchemeColor;
  SchemeColor? get scaffoldBackgroundDarkSchemeColor =>
      _scaffoldBackgroundDarkSchemeColor;
  void setScaffoldBackgroundDarkSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _scaffoldBackgroundDarkSchemeColor) return;
    _scaffoldBackgroundDarkSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyScaffoldBackgroundDarkSchemeColor, value));
  }

  late FlexSurfaceMode _surfaceModeLight;
  FlexSurfaceMode get surfaceModeLight => _surfaceModeLight;
  void setSurfaceModeLight(FlexSurfaceMode? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _surfaceModeLight) return;
    _surfaceModeLight = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySurfaceModeLight, value));
  }

  late FlexSurfaceMode _surfaceModeDark;
  FlexSurfaceMode get surfaceModeDark => _surfaceModeDark;
  void setSurfaceModeDark(FlexSurfaceMode? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _surfaceModeDark) return;
    _surfaceModeDark = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySurfaceModeDark, value));
  }

  late int _blendLevel;
  int get blendLevel => _blendLevel;
  void setBlendLevel(int? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _blendLevel) return;
    _blendLevel = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyBlendLevel, value));
  }

  late int _blendLevelDark;
  int get blendLevelDark => _blendLevelDark;
  void setBlendLevelDark(int? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _blendLevelDark) return;
    _blendLevelDark = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyBlendLevelDark, value));
  }

  late int _blendOnLevel;
  int get blendOnLevel => _blendOnLevel;
  void setBlendOnLevel(int? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _blendOnLevel) return;
    _blendOnLevel = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyOnBlendLevel, value));
  }

  late int _blendOnLevelDark;
  int get blendOnLevelDark => _blendOnLevelDark;
  void setBlendOnLevelDark(int? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _blendOnLevelDark) return;
    _blendOnLevelDark = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyBlendOnLevelDark, value));
  }

  late int _usedColors;
  int get usedColors => _usedColors;
  void setUsedColors(int? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _usedColors) return;
    _usedColors = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyUsedColors, value));
  }

  late bool _swapLegacyColors;
  bool get swapLegacyColors => _swapLegacyColors;
  void setSwapLegacyColors(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _swapLegacyColors) return;
    _swapLegacyColors = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySwapLegacyColors, value));
  }

  late bool _swapLightColors;
  bool get swapLightColors => _swapLightColors;
  void setSwapLightColors(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _swapLightColors) return;
    _swapLightColors = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySwapLightColors, value));
  }

  late bool _swapDarkColors;
  bool get swapDarkColors => _swapDarkColors;
  void setSwapDarkColors(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _swapDarkColors) return;
    _swapDarkColors = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySwapDarkColors, value));
  }

  late bool _lightIsWhite;
  bool get lightIsWhite => _lightIsWhite;
  void setLightIsWhite(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _lightIsWhite) return;
    _lightIsWhite = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyLightIsWhite, value));
  }

  late bool _darkIsTrueBlack;
  bool get darkIsTrueBlack => _darkIsTrueBlack;
  void setDarkIsTrueBlack(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _darkIsTrueBlack) return;
    _darkIsTrueBlack = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyDarkIsTrueBlack, value));
  }

  late bool _useToDarkMethod;
  bool get useToDarkMethod => _useToDarkMethod;
  void setUseToDarkMethod(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _useToDarkMethod) return;
    _useToDarkMethod = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyUseToDarkMethod, value));
  }

  late bool _toDarkSwapPrimaryAndContainer;
  bool get toDarkSwapPrimaryAndContainer => _toDarkSwapPrimaryAndContainer;
  void setToDarkSwapPrimaryAndContainer(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _toDarkSwapPrimaryAndContainer) return;
    _toDarkSwapPrimaryAndContainer = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyToDarkSwapPrimaryAndContainer, value));
  }

  late int _darkMethodLevel;
  int get darkMethodLevel => _darkMethodLevel;
  void setDarkMethodLevel(int? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _darkMethodLevel) return;
    _darkMethodLevel = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyDarkMethodLevel, value));
  }

  // On color blending ON/OFF
  late bool _blendLightOnColors;
  bool get blendLightOnColors => _blendLightOnColors;
  void setBlendLightOnColors(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _blendLightOnColors) return;
    _blendLightOnColors = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyBlendLightOnColors, value));
  }

  late bool _blendDarkOnColors;
  bool get blendDarkOnColors => _blendDarkOnColors;
  void setBlendDarkOnColors(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _blendDarkOnColors) return;
    _blendDarkOnColors = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyBlendDarkOnColors, value));
  }

  // TODO(rydmike): Commented as part of blendTextTheme deprecation.
  // TextThem blending ON/OFF
  // late bool _blendLightTextTheme;
  // bool get blendLightTextTheme => _blendLightTextTheme;
  // void setBlendLightTextTheme(bool? value, [bool notify = true]) {
  //   if (value == null) return;
  //   if (value == _blendLightTextTheme) return;
  //   _blendLightTextTheme = value;
  //   if (notify) notifyListeners();
  //   unawaited(_themeService.save(Store.keyBlendLightTextTheme, value));
  // }
  //
  // late bool _blendDarkTextTheme;
  // bool get blendDarkTextTheme => _blendDarkTextTheme;
  // void setBlendDarkTextTheme(bool? value, [bool notify = true]) {
  //   if (value == null) return;
  //   if (value == _blendDarkTextTheme) return;
  //   _blendDarkTextTheme = value;
  //   if (notify) notifyListeners();
  //   unawaited(_themeService.save(Store.keyBlendDarkTextTheme, value));
  // }

  // Material 3 and Seed ColorScheme SETTINGS.
  // ===========================================================================

  late bool _useMaterial3;
  bool get useMaterial3 => _useMaterial3;
  void setUseMaterial3(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _useMaterial3) return;
    _useMaterial3 = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyUseMaterial3, value));
  }

  late FlexFixedColorStyle? _fixedColorStyle;
  FlexFixedColorStyle? get fixedColorStyle => _fixedColorStyle;
  void setFixedColorStyle(FlexFixedColorStyle? value, [bool notify = true]) {
    if (value == _fixedColorStyle) return;
    _fixedColorStyle = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyFixedColorStyle, value));
  }

  late bool _useKeyColors;
  bool get useKeyColors => _useKeyColors;
  void setUseKeyColors(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _useKeyColors) return;
    _useKeyColors = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyUseKeyColors, value));
  }

  late bool _useSecondary;
  bool get useSecondary => _useSecondary;
  void setUseSecondary(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _useSecondary) return;
    _useSecondary = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyUseSecondary, value));
  }

  late bool _useTertiary;
  bool get useTertiary => _useTertiary;
  void setUseTertiary(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _useTertiary) return;
    _useTertiary = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyUseTertiary, value));
  }

  late bool _useError;
  bool get useError => _useError;
  void setUseError(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _useError) return;
    _useError = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyUseError, value));
  }

  late bool _keepPrimary;
  bool get keepPrimary => _keepPrimary;
  void setKeepPrimary(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _keepPrimary) return;
    _keepPrimary = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyKeepPrimary, value));
  }

  late bool _keepSecondary;
  bool get keepSecondary => _keepSecondary;
  void setKeepSecondary(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _keepSecondary) return;
    _keepSecondary = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyKeepSecondary, value));
  }

  late bool _keepTertiary;
  bool get keepTertiary => _keepTertiary;
  void setKeepTertiary(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _keepTertiary) return;
    _keepTertiary = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyKeepTertiary, value));
  }

  late bool _keepError;
  bool get keepError => _keepError;
  void setKeepError(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _keepError) return;
    _keepError = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyKeepError, value));
  }

  late bool _keepPrimaryContainer;
  bool get keepPrimaryContainer => _keepPrimaryContainer;
  void setKeepPrimaryContainer(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _keepPrimaryContainer) return;
    _keepPrimaryContainer = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyKeepPrimaryContainer, value));
  }

  late bool _keepSecondaryContainer;
  bool get keepSecondaryContainer => _keepSecondaryContainer;
  void setKeepSecondaryContainer(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _keepSecondaryContainer) return;
    _keepSecondaryContainer = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyKeepSecondaryContainer, value));
  }

  late bool _keepTertiaryContainer;
  bool get keepTertiaryContainer => _keepTertiaryContainer;
  void setKeepTertiaryContainer(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _keepTertiaryContainer) return;
    _keepTertiaryContainer = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyKeepTertiaryContainer, value));
  }

  late bool _keepErrorContainer;
  bool get keepErrorContainer => _keepErrorContainer;
  void setKeepErrorContainer(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _keepErrorContainer) return;
    _keepErrorContainer = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyKeepErrorContainer, value));
  }

  late bool _keepDarkPrimary;
  bool get keepDarkPrimary => _keepDarkPrimary;
  void setKeepDarkPrimary(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _keepDarkPrimary) return;
    _keepDarkPrimary = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyKeepDarkPrimary, value));
  }

  late bool _keepDarkSecondary;
  bool get keepDarkSecondary => _keepDarkSecondary;
  void setKeepDarkSecondary(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _keepDarkSecondary) return;
    _keepDarkSecondary = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyKeepDarkSecondary, value));
  }

  late bool _keepDarkTertiary;
  bool get keepDarkTertiary => _keepDarkTertiary;
  void setKeepDarkTertiary(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _keepDarkTertiary) return;
    _keepDarkTertiary = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyKeepDarkTertiary, value));
  }

  late bool _keepDarkError;
  bool get keepDarkError => _keepDarkError;
  void setKeepDarkError(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _keepDarkError) return;
    _keepDarkError = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyKeepDarkError, value));
  }

  late bool _keepDarkPrimaryContainer;
  bool get keepDarkPrimaryContainer => _keepDarkPrimaryContainer;
  void setKeepDarkPrimaryContainer(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _keepDarkPrimaryContainer) return;
    _keepDarkPrimaryContainer = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyKeepDarkPrimaryContainer, value));
  }

  late bool _keepDarkSecondaryContainer;
  bool get keepDarkSecondaryContainer => _keepDarkSecondaryContainer;
  void setKeepDarkSecondaryContainer(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _keepDarkSecondaryContainer) return;
    _keepDarkSecondaryContainer = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyKeepDarkSecondaryContainer, value));
  }

  late bool _keepDarkTertiaryContainer;
  bool get keepDarkTertiaryContainer => _keepDarkTertiaryContainer;
  void setKeepDarkTertiaryContainer(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _keepDarkTertiaryContainer) return;
    _keepDarkTertiaryContainer = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyKeepDarkTertiaryContainer, value));
  }

  late bool _keepDarkErrorContainer;
  bool get keepDarkErrorContainer => _keepDarkErrorContainer;
  void setKeepDarkErrorContainer(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _keepDarkErrorContainer) return;
    _keepDarkErrorContainer = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyKeepDarkErrorContainer, value));
  }

  late int _usedFlexToneSetup;
  int get usedFlexToneSetup => _usedFlexToneSetup;
  void setUsedFlexToneSetup(int? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _usedFlexToneSetup) return;
    _usedFlexToneSetup = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyUsedFlexToneSetup, value));
  }

  late bool _useM3ErrorColors;
  bool get useM3ErrorColors => _useM3ErrorColors;
  void setUseM3ErrorColors(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _useM3ErrorColors) return;
    _useM3ErrorColors = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyUseM3ErrorColors, value));
  }

  late bool _useMonoSurfacesLight;
  bool get useMonoSurfacesLight => _useMonoSurfacesLight;
  void setUseMonoSurfacesLight(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _useMonoSurfacesLight) return;
    _useMonoSurfacesLight = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyUseMonoSurfacesLight, value));
  }

  late bool _useMonoSurfacesDark;
  bool get useMonoSurfacesDark => _useMonoSurfacesDark;
  void setUseMonoSurfacesDark(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _useMonoSurfacesDark) return;
    _useMonoSurfacesDark = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyUseMonoSurfacesDark, value));
  }

  late bool _onMainsUseBWLight;
  bool get onMainsUseBWLight => _onMainsUseBWLight;
  void setOnMainsUseBWLight(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _onMainsUseBWLight) return;
    _onMainsUseBWLight = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyOnMainsUseBWLight, value));
  }

  late bool _onMainsUseBWDark;
  bool get onMainsUseBWDark => _onMainsUseBWDark;
  void setOnMainsUseBWDark(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _onMainsUseBWDark) return;
    _onMainsUseBWDark = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyOnMainsUseBWDark, value));
  }

  late bool _onSurfacesUseBWLight;
  bool get onSurfacesUseBWLight => _onSurfacesUseBWLight;
  void setOnSurfacesUseBWLight(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _onSurfacesUseBWLight) return;
    _onSurfacesUseBWLight = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyOnSurfacesUseBWLight, value));
  }

  late bool _onSurfacesUseBWDark;
  bool get onSurfacesUseBWDark => _onSurfacesUseBWDark;
  void setOnSurfacesUseBWDark(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _onSurfacesUseBWDark) return;
    _onSurfacesUseBWDark = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyOnSurfacesUseBWDark, value));
  }

  late bool _surfacesUseBWLight;
  bool get surfacesUseBWLight => _surfacesUseBWLight;
  void setSurfacesUseBWLight(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _surfacesUseBWLight) return;
    _surfacesUseBWLight = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySurfacesUseBWLight, value));
  }

  late bool _surfacesUseBWDark;
  bool get surfacesUseBWDark => _surfacesUseBWDark;
  void setSurfacesUseBWDark(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _surfacesUseBWDark) return;
    _surfacesUseBWDark = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySurfacesUseBWDark, value));
  }

  late bool _higherContrastFixed;
  bool get higherContrastFixed => _higherContrastFixed;
  void setHigherContrastFixed(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _higherContrastFixed) return;
    _higherContrastFixed = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyHigherContrastFixed, value));
  }

  late bool _expressiveOnContainer;
  bool get expressiveOnContainer => _expressiveOnContainer;
  void setExpressiveOnContainer(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _expressiveOnContainer) return;
    _expressiveOnContainer = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyExpressiveOnContainer, value));
  }

  late bool _useLegacyMonochromeSeedBehavior;
  bool get useLegacyMonochromeSeedBehavior => _useLegacyMonochromeSeedBehavior;
  void setUseLegacyMonochromeSeedBehavior(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _useLegacyMonochromeSeedBehavior) return;
    _useLegacyMonochromeSeedBehavior = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyExpressiveOnContainer, value));
  }

  late double _dynamicContrastLevel;
  double get dynamicContrastLevel => _dynamicContrastLevel;
  void setDynamicContrastLevel(double? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _dynamicContrastLevel) return;
    _dynamicContrastLevel = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyDynamicContrastLevel, value));
  }

  // InputDecorator SETTINGS.
  // ===========================================================================

  late SchemeColor? _inputDecoratorSchemeColorLight;
  SchemeColor? get inputDecoratorSchemeColorLight =>
      _inputDecoratorSchemeColorLight;
  void setInputDecoratorSchemeColorLight(SchemeColor? value,
      [bool notify = true]) {
    if (value == _inputDecoratorSchemeColorLight) return;
    _inputDecoratorSchemeColorLight = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyInputDecoratorSchemeColorLight, value));
  }

  late SchemeColor? _inputDecoratorSchemeColorDark;
  SchemeColor? get inputDecoratorSchemeColorDark =>
      _inputDecoratorSchemeColorDark;
  void setInputDecoratorSchemeColorDark(SchemeColor? value,
      [bool notify = true]) {
    if (value == _inputDecoratorSchemeColorDark) return;
    _inputDecoratorSchemeColorDark = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyInputDecoratorSchemeColorDark, value));
  }

  late SchemeColor? _inputDecoratorBorderSchemeColorLight;
  SchemeColor? get inputDecoratorBorderSchemeColorLight =>
      _inputDecoratorBorderSchemeColorLight;
  void setInputDecoratorBorderSchemeColorLight(SchemeColor? value,
      [bool notify = true]) {
    if (value == _inputDecoratorBorderSchemeColorLight) return;
    _inputDecoratorBorderSchemeColorLight = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(
        Store.keyInputDecoratorBorderSchemeColorLight, value));
  }

  late SchemeColor? _inputDecoratorBorderSchemeColorDark;
  SchemeColor? get inputDecoratorBorderSchemeColorDark =>
      _inputDecoratorBorderSchemeColorDark;
  void setInputDecoratorBorderSchemeColorDark(SchemeColor? value,
      [bool notify = true]) {
    if (value == _inputDecoratorBorderSchemeColorDark) return;
    _inputDecoratorBorderSchemeColorDark = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(
        Store.keyInputDecoratorBorderSchemeColorDark, value));
  }

  late bool _inputDecoratorIsFilled;
  bool get inputDecoratorIsFilled => _inputDecoratorIsFilled;
  void setInputDecoratorIsFilled(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _inputDecoratorIsFilled) return;
    _inputDecoratorIsFilled = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyInputDecoratorIsFilled, value));
  }

  late bool _inputDecoratorIsDense;
  bool get inputDecoratorIsDense => _inputDecoratorIsDense;
  void setInputDecoratorIsDense(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _inputDecoratorIsDense) return;
    _inputDecoratorIsDense = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyInputDecoratorIsDense, value));
  }

  late double? _inputDecoratorPaddingStart;
  double? get inputDecoratorPaddingStart => _inputDecoratorPaddingStart;
  void setInputDecoratorPaddingStart(double? value, [bool notify = true]) {
    if (value == _inputDecoratorPaddingStart) return;
    _inputDecoratorPaddingStart = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyInputDecoratorPaddingStart, value));
  }

  late double? _inputDecoratorPaddingEnd;
  double? get inputDecoratorPaddingEnd => _inputDecoratorPaddingEnd;
  void setInputDecoratorPaddingEnd(double? value, [bool notify = true]) {
    if (value == _inputDecoratorPaddingEnd) return;
    _inputDecoratorPaddingEnd = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyInputDecoratorPaddingEnd, value));
  }

  late double? _inputDecoratorPaddingTop;
  double? get inputDecoratorPaddingTop => _inputDecoratorPaddingTop;
  void setInputDecoratorPaddingTop(double? value, [bool notify = true]) {
    if (value == _inputDecoratorPaddingTop) return;
    _inputDecoratorPaddingTop = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyInputDecoratorPaddingTop, value));
  }

  late double? _inputDecoratorPaddingBottom;
  double? get inputDecoratorPaddingBottom => _inputDecoratorPaddingBottom;
  void setInputDecoratorPaddingBottom(double? value, [bool notify = true]) {
    if (value == _inputDecoratorPaddingBottom) return;
    _inputDecoratorPaddingBottom = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyInputDecoratorPaddingBottom, value));
  }

  late int? _inputDecoratorBackgroundAlphaLight;
  int? get inputDecoratorBackgroundAlphaLight =>
      _inputDecoratorBackgroundAlphaLight;
  void setInputDecoratorBackgroundAlphaLight(int? value, [bool notify = true]) {
    if (value == _inputDecoratorBackgroundAlphaLight) return;
    _inputDecoratorBackgroundAlphaLight = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyInputDecoratorBackgroundAlphaLight, value));
  }

  late int? _inputDecoratorBackgroundAlphaDark;
  int? get inputDecoratorBackgroundAlphaDark =>
      _inputDecoratorBackgroundAlphaDark;
  void setInputDecoratorBackgroundAlphaDark(int? value, [bool notify = true]) {
    if (value == _inputDecoratorBackgroundAlphaDark) return;
    _inputDecoratorBackgroundAlphaDark = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyInputDecoratorBackgroundAlphaDark, value));
  }

  late FlexInputBorderType _inputDecoratorBorderType;
  FlexInputBorderType get inputDecoratorBorderType => _inputDecoratorBorderType;
  void setInputDecoratorBorderType(FlexInputBorderType? value,
      [bool notify = true]) {
    if (value == null) return;
    if (value == _inputDecoratorBorderType) return;
    _inputDecoratorBorderType = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyInputDecoratorBorderType, value));
  }

  late double? _inputDecoratorBorderRadius;
  double? get inputDecoratorBorderRadius => _inputDecoratorBorderRadius;
  void setInputDecoratorBorderRadius(double? value, [bool notify = true]) {
    if (value == _inputDecoratorBorderRadius) return;
    _inputDecoratorBorderRadius = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyInputDecoratorBorderRadius, value));
  }

  late double? _inputDecoratorBorderRadiusAdaptive;
  double? get inputDecoratorBorderRadiusAdaptive =>
      _inputDecoratorBorderRadiusAdaptive;
  void setInputDecoratorBorderRadiusAdaptive(double? value,
      [bool notify = true]) {
    if (value == _inputDecoratorBorderRadiusAdaptive) return;
    _inputDecoratorBorderRadiusAdaptive = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyInputDecoratorBorderRadiusAdaptive, value));
  }

  late AdaptiveResponse? _adaptiveResponseInputDecoratorRadius;
  AdaptiveResponse? get adaptiveResponseInputDecoratorRadius =>
      _adaptiveResponseInputDecoratorRadius;
  void setAdaptiveResponseInputDecoratorRadius(AdaptiveResponse? value,
      [bool notify = true]) {
    if (value == _adaptiveResponseInputDecoratorRadius) return;
    _adaptiveResponseInputDecoratorRadius = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(
        Store.keyAdaptiveResponseInputDecoratorRadius, value));
  }

  late bool _inputDecoratorUnfocusedHasBorder;
  bool get inputDecoratorUnfocusedHasBorder =>
      _inputDecoratorUnfocusedHasBorder;
  void setInputDecoratorUnfocusedHasBorder(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _inputDecoratorUnfocusedHasBorder) return;
    _inputDecoratorUnfocusedHasBorder = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyInputDecoratorUnfocusedHasBorder, value));
  }

  late bool _inputDecoratorFocusedHasBorder;
  bool get inputDecoratorFocusedHasBorder => _inputDecoratorFocusedHasBorder;
  void setInputDecoratorFocusedHasBorder(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _inputDecoratorFocusedHasBorder) return;
    _inputDecoratorFocusedHasBorder = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyInputDecoratorFocusedHasBorder, value));
  }

  late bool _inputDecoratorUnfocusedBorderIsColored;
  bool get inputDecoratorUnfocusedBorderIsColored =>
      _inputDecoratorUnfocusedBorderIsColored;
  void setInputDecoratorUnfocusedBorderIsColored(bool? value,
      [bool notify = true]) {
    if (value == null) return;
    if (value == _inputDecoratorUnfocusedBorderIsColored) return;
    _inputDecoratorUnfocusedBorderIsColored = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(
        Store.keyInputDecoratorUnfocusedBorderIsColored, value));
  }

  late double? _inputDecoratorBorderWidth;
  double? get inputDecoratorBorderWidth => _inputDecoratorBorderWidth;
  void setInputDecoratorBorderWidth(double? value, [bool notify = true]) {
    if (value == _inputDecoratorBorderWidth) return;
    _inputDecoratorBorderWidth = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyInputDecoratorBorderWidth, value));
  }

  late double? _inputDecoratorFocusedBorderWidth;
  double? get inputDecoratorFocusedBorderWidth =>
      _inputDecoratorFocusedBorderWidth;
  void setInputDecoratorFocusedBorderWidth(double? value,
      [bool notify = true]) {
    if (value == _inputDecoratorFocusedBorderWidth) return;
    _inputDecoratorFocusedBorderWidth = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyInputDecoratorFocusedBorderWidth, value));
  }

  late SchemeColor? _inputDecoratorPrefixIconSchemeColor;
  SchemeColor? get inputDecoratorPrefixIconSchemeColor =>
      _inputDecoratorPrefixIconSchemeColor;
  void setInputDecoratorPrefixIconSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _inputDecoratorPrefixIconSchemeColor) return;
    _inputDecoratorPrefixIconSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(
        Store.keyInputDecoratorPrefixIconSchemeColor, value));
  }

  late SchemeColor? _inputDecoratorPrefixIconDarkSchemeColor;
  SchemeColor? get inputDecoratorPrefixIconDarkSchemeColor =>
      _inputDecoratorPrefixIconDarkSchemeColor;
  void setInputDecoratorPrefixIconDarkSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _inputDecoratorPrefixIconDarkSchemeColor) return;
    _inputDecoratorPrefixIconDarkSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(
        Store.keyInputDecoratorPrefixIconDarkSchemeColor, value));
  }

  late SchemeColor? _inputDecoratorSuffixIconSchemeColor;
  SchemeColor? get inputDecoratorSuffixIconSchemeColor =>
      _inputDecoratorSuffixIconSchemeColor;
  void setInputDecoratorSuffixIconSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _inputDecoratorSuffixIconSchemeColor) return;
    _inputDecoratorSuffixIconSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(
        Store.keyInputDecoratorSuffixIconSchemeColor, value));
  }

  late SchemeColor? _inputDecoratorSuffixIconDarkSchemeColor;
  SchemeColor? get inputDecoratorSuffixIconDarkSchemeColor =>
      _inputDecoratorSuffixIconDarkSchemeColor;
  void setInputDecoratorSuffixIconDarkSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _inputDecoratorSuffixIconDarkSchemeColor) return;
    _inputDecoratorSuffixIconDarkSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(
        Store.keyInputDecoratorSuffixIconDarkSchemeColor, value));
  }

  // TextSelection SETTINGS.
  // ===========================================================================

  late SchemeColor? _inputCursorLightSchemeColor;
  SchemeColor? get inputCursorLightSchemeColor => _inputCursorLightSchemeColor;
  void setInputCursorLightSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _inputCursorLightSchemeColor) return;
    _inputCursorLightSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyInputCursorLightSchemeColor, value));
  }

  late SchemeColor? _inputSelectionLightSchemeColor;
  SchemeColor? get inputSelectionLightSchemeColor =>
      _inputSelectionLightSchemeColor;
  void setInputSelectionLightSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _inputSelectionLightSchemeColor) return;
    _inputSelectionLightSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyInputSelectionLightSchemeColor, value));
  }

  late double? _inputSelectionLightOpacity;
  double? get inputSelectionLightOpacity => _inputSelectionLightOpacity;
  void setInputSelectionLightOpacity(double? value, [bool notify = true]) {
    if (value == _inputSelectionLightOpacity) return;
    _inputSelectionLightOpacity = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyInputSelectionLightOpacity, value));
  }

  late SchemeColor? _inputSelectionHandleLightSchemeColor;
  SchemeColor? get inputSelectionHandleLightSchemeColor =>
      _inputSelectionHandleLightSchemeColor;
  void setInputSelectionHandleLightSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _inputSelectionHandleLightSchemeColor) return;
    _inputSelectionHandleLightSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(
        Store.keyInputSelectionHandleLightSchemeColor, value));
  }

  late SchemeColor? _inputCursorDarkSchemeColor;
  SchemeColor? get inputCursorDarkSchemeColor => _inputCursorDarkSchemeColor;
  void setInputCursorDarkSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _inputCursorDarkSchemeColor) return;
    _inputCursorDarkSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyInputCursorDarkSchemeColor, value));
  }

  late SchemeColor? _inputSelectionDarkSchemeColor;
  SchemeColor? get inputSelectionDarkSchemeColor =>
      _inputSelectionDarkSchemeColor;
  void setInputSelectionDarkSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _inputSelectionDarkSchemeColor) return;
    _inputSelectionDarkSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyInputSelectionDarkSchemeColor, value));
  }

  late double? _inputSelectionDarkOpacity;
  double? get inputSelectionDarkOpacity => _inputSelectionDarkOpacity;
  void setInputSelectionDarkOpacity(double? value, [bool notify = true]) {
    if (value == _inputSelectionDarkOpacity) return;
    _inputSelectionDarkOpacity = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyInputSelectionDarkOpacity, value));
  }

  late SchemeColor? _inputSelectionHandleDarkSchemeColor;
  SchemeColor? get inputSelectionHandleDarkSchemeColor =>
      _inputSelectionHandleDarkSchemeColor;
  void setInputSelectionHandleDarkSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _inputSelectionHandleDarkSchemeColor) return;
    _inputSelectionHandleDarkSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(
        Store.keyInputSelectionHandleDarkSchemeColor, value));
  }

  // ListTile SETTINGS.
  // ===========================================================================

  late SchemeColor? _listTileSelectedSchemeColor;
  SchemeColor? get listTileSelectedSchemeColor => _listTileSelectedSchemeColor;
  void setListTileSelectedSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _listTileSelectedSchemeColor) return;
    _listTileSelectedSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyListTileSelectedSchemeColor, value));
  }

  late SchemeColor? _listTileIconSchemeColor;
  SchemeColor? get listTileIconSchemeColor => _listTileIconSchemeColor;
  void setListTileIconSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _listTileIconSchemeColor) return;
    _listTileIconSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyListTileIconSchemeColor, value));
  }

  late SchemeColor? _listTileTextSchemeColor;
  SchemeColor? get listTileTextSchemeColor => _listTileTextSchemeColor;
  void setListTileTextSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _listTileTextSchemeColor) return;
    _listTileTextSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyListTileTextSchemeColor, value));
  }

  late SchemeColor? _listTileTileSchemeColor;
  SchemeColor? get listTileTileSchemeColor => _listTileTileSchemeColor;
  void setListTileTileSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _listTileTileSchemeColor) return;
    _listTileTileSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyListTileTileSchemeColor, value));
  }

  late SchemeColor? _listTileSelectedTileSchemeColor;
  SchemeColor? get listTileSelectedTileSchemeColor =>
      _listTileSelectedTileSchemeColor;
  void setListTileSelectedTileSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _listTileSelectedTileSchemeColor) return;
    _listTileSelectedTileSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyListTileSelectedTileSchemeColor, value));
  }

  late double? _listTilePaddingStart;
  double? get listTilePaddingStart => _listTilePaddingStart;
  void setListTilePaddingStart(double? value, [bool notify = true]) {
    if (value == _listTilePaddingStart) return;
    _listTilePaddingStart = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyListTilePaddingStart, value));
  }

  late double? _listTilePaddingEnd;
  double? get listTilePaddingEnd => _listTilePaddingEnd;
  void setListTilePaddingEnd(double? value, [bool notify = true]) {
    if (value == _listTilePaddingEnd) return;
    _listTilePaddingEnd = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyListTilePaddingEnd, value));
  }

  late double? _listTilePaddingTop;
  double? get listTilePaddingTop => _listTilePaddingTop;
  void setListTilePaddingTop(double? value, [bool notify = true]) {
    if (value == _listTilePaddingTop) return;
    _listTilePaddingTop = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyListTilePaddingTop, value));
  }

  late double? _listTilePaddingBottom;
  double? get listTilePaddingBottom => _listTilePaddingBottom;
  void setListTilePaddingBottom(double? value, [bool notify = true]) {
    if (value == _listTilePaddingBottom) return;
    _listTilePaddingBottom = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyListTilePaddingBottom, value));
  }

  late double? _listTileHorizontalTitleGap;
  double? get listTileHorizontalTitleGap => _listTileHorizontalTitleGap;
  void setListTileHorizontalTitleGap(double? value, [bool notify = true]) {
    if (value == _listTileHorizontalTitleGap) return;
    _listTileHorizontalTitleGap = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyListTileHorizontalTitleGap, value));
  }

  late double? _listTileMinVerticalPadding;
  double? get listTileMinVerticalPadding => _listTileMinVerticalPadding;
  void setListTileMinVerticalPadding(double? value, [bool notify = true]) {
    if (value == _listTileMinVerticalPadding) return;
    _listTileMinVerticalPadding = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyListTileMinVerticalPadding, value));
  }

  late ListTileStyle? _listTileStyle;
  ListTileStyle? get listTileStyle => _listTileStyle;
  void setListTileStyle(ListTileStyle? value, [bool notify = true]) {
    if (value == _listTileStyle) return;
    _listTileStyle = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyListTileStyle, value));
  }

  late ListTileTitleAlignment? _listTileTitleAlignment;
  ListTileTitleAlignment? get listTileTitleAlignment => _listTileTitleAlignment;
  void setListTileTitleAlignment(ListTileTitleAlignment? value,
      [bool notify = true]) {
    if (value == _listTileTitleAlignment) return;
    _listTileTitleAlignment = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyListTileTitleAlignment, value));
  }

  late ListTileControlAffinity? _listTileControlAffinity;
  ListTileControlAffinity? get listTileControlAffinity =>
      _listTileControlAffinity;
  void setListTileControlAffinity(ListTileControlAffinity? value,
      [bool notify = true]) {
    if (value == _listTileControlAffinity) return;
    _listTileControlAffinity = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyListTileControlAffinity, value));
  }

  // AppBar SETTINGS.
  // ===========================================================================

  late FlexAppBarStyle? _appBarStyleLight;
  FlexAppBarStyle? get appBarStyleLight => _appBarStyleLight;
  void setAppBarStyleLight(FlexAppBarStyle? value, [bool notify = true]) {
    // if (value == null) return;
    if (value == _appBarStyleLight) return;
    _appBarStyleLight = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyAppBarStyleLight, value));
  }

  late FlexAppBarStyle? _appBarStyleDark;
  FlexAppBarStyle? get appBarStyleDark => _appBarStyleDark;
  void setAppBarStyleDark(FlexAppBarStyle? value, [bool notify = true]) {
    // if (value == null) return;
    if (value == _appBarStyleDark) return;
    _appBarStyleDark = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyAppBarStyleDark, value));
  }

  late double? _appBarOpacityLight;
  double? get appBarOpacityLight => _appBarOpacityLight;
  void setAppBarOpacityLight(double? value, [bool notify = true]) {
    if (value == _appBarOpacityLight) return;
    _appBarOpacityLight = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyAppBarOpacityLight, value));
  }

  late double? _appBarOpacityDark;
  double? get appBarOpacityDark => _appBarOpacityDark;
  void setAppBarOpacityDark(double? value, [bool notify = true]) {
    if (value == _appBarOpacityDark) return;
    _appBarOpacityDark = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyAppBarOpacityDark, value));
  }

  late double? _appBarElevationLight;
  double? get appBarElevationLight => _appBarElevationLight;
  void setAppBarElevationLight(double? value, [bool notify = true]) {
    if (value == _appBarElevationLight) return;
    _appBarElevationLight = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyAppBarElevationLight, value));
  }

  late double? _appBarElevationDark;
  double? get appBarElevationDark => _appBarElevationDark;
  void setAppBarElevationDark(double? value, [bool notify = true]) {
    if (value == _appBarElevationDark) return;
    _appBarElevationDark = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyAppBarElevationDark, value));
  }

  late double? _appBarScrolledUnderElevationLight;
  double? get appBarScrolledUnderElevationLight =>
      _appBarScrolledUnderElevationLight;
  void setAppBarScrolledUnderElevationLight(double? value,
      [bool notify = true]) {
    if (value == _appBarScrolledUnderElevationLight) return;
    _appBarScrolledUnderElevationLight = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyAppBarScrolledUnderElevationLight, value));
  }

  late double? _appBarScrolledUnderElevationDark;
  double? get appBarScrolledUnderElevationDark =>
      _appBarScrolledUnderElevationDark;
  void setAppBarScrolledUnderElevationDark(double? value,
      [bool notify = true]) {
    if (value == _appBarScrolledUnderElevationDark) return;
    _appBarScrolledUnderElevationDark = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyAppBarScrolledUnderElevationDark, value));
  }

  late bool _transparentStatusBar;
  bool get transparentStatusBar => _transparentStatusBar;
  void setTransparentStatusBar(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _transparentStatusBar) return;
    _transparentStatusBar = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTransparentStatusBar, value));
  }

  late bool? _appBarCenterTitle;
  bool? get appBarCenterTitle => _appBarCenterTitle;
  void setAppBarCenterTitle(bool? value, [bool notify = true]) {
    if (value == _appBarCenterTitle) return;
    _appBarCenterTitle = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyAppBarCenterTitle, value));
  }

  late SchemeColor? _appBarBackgroundSchemeColorLight;
  SchemeColor? get appBarBackgroundSchemeColorLight =>
      _appBarBackgroundSchemeColorLight;
  void setAppBarBackgroundSchemeColorLight(SchemeColor? value,
      [bool notify = true]) {
    if (value == _appBarBackgroundSchemeColorLight) return;
    _appBarBackgroundSchemeColorLight = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyAppBarBackgroundSchemeColorLight, value));
  }

  late SchemeColor? _appBarBackgroundSchemeColorDark;
  SchemeColor? get appBarBackgroundSchemeColorDark =>
      _appBarBackgroundSchemeColorDark;
  void setAppBarBackgroundSchemeColorDark(SchemeColor? value,
      [bool notify = true]) {
    if (value == _appBarBackgroundSchemeColorDark) return;
    _appBarBackgroundSchemeColorDark = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyAppBarBackgroundSchemeColorDark, value));
  }

  late SchemeColor? _appBarForegroundSchemeColorLight;
  SchemeColor? get appBarForegroundSchemeColorLight =>
      _appBarForegroundSchemeColorLight;
  void setAppBarForegroundSchemeColorLight(SchemeColor? value,
      [bool notify = true]) {
    if (value == _appBarForegroundSchemeColorLight) return;
    _appBarForegroundSchemeColorLight = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyAppBarForegroundSchemeColorLight, value));
  }

  late SchemeColor? _appBarForegroundSchemeColorDark;
  SchemeColor? get appBarForegroundSchemeColorDark =>
      _appBarForegroundSchemeColorDark;
  void setAppBarForegroundSchemeColorDark(SchemeColor? value,
      [bool notify = true]) {
    if (value == _appBarForegroundSchemeColorDark) return;
    _appBarForegroundSchemeColorDark = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyAppBarForegroundSchemeColorDark, value));
  }

  late SchemeColor? _appBarIconSchemeColorLight;
  SchemeColor? get appBarIconSchemeColorLight => _appBarIconSchemeColorLight;
  void setAppBarIconSchemeColorLight(SchemeColor? value, [bool notify = true]) {
    if (value == _appBarIconSchemeColorLight) return;
    _appBarIconSchemeColorLight = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyAppBarIconSchemeColorLight, value));
  }

  late SchemeColor? _appBarIconSchemeColorDark;
  SchemeColor? get appBarIconSchemeColorDark => _appBarIconSchemeColorDark;
  void setAppBarIconSchemeColorDark(SchemeColor? value, [bool notify = true]) {
    if (value == _appBarIconSchemeColorDark) return;
    _appBarIconSchemeColorDark = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyAppBarIconSchemeColorDark, value));
  }

  late SchemeColor? _appBarActionsIconSchemeColorLight;
  SchemeColor? get appBarActionsIconSchemeColorLight =>
      _appBarActionsIconSchemeColorLight;
  void setAppBarActionsIconSchemeColorLight(SchemeColor? value,
      [bool notify = true]) {
    if (value == _appBarActionsIconSchemeColorLight) return;
    _appBarActionsIconSchemeColorLight = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyAppBarActionsIconSchemeColorLight, value));
  }

  late SchemeColor? _appBarActionsIconSchemeColorDark;
  SchemeColor? get appBarActionsIconSchemeColorDark =>
      _appBarActionsIconSchemeColorDark;
  void setAppBarActionsIconSchemeColorDark(SchemeColor? value,
      [bool notify = true]) {
    if (value == _appBarActionsIconSchemeColorDark) return;
    _appBarActionsIconSchemeColorDark = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyAppBarActionsIconSchemeColorDark, value));
  }

  // BottomAppBar SETTINGS.
  // ===========================================================================

  late double? _bottomAppBarElevationLight;
  double? get bottomAppBarElevationLight => _bottomAppBarElevationLight;
  void setBottomAppBarElevationLight(double? value, [bool notify = true]) {
    if (value == _bottomAppBarElevationLight) return;
    _bottomAppBarElevationLight = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyBottomAppBarElevationLight, value));
  }

  late double? _bottomAppBarElevationDark;
  double? get bottomAppBarElevationDark => _bottomAppBarElevationDark;
  void setBottomAppBarElevationDark(double? value, [bool notify = true]) {
    if (value == _bottomAppBarElevationDark) return;
    _bottomAppBarElevationDark = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyBottomAppBarElevationDark, value));
  }

  late SchemeColor? _bottomAppBarSchemeColorLight;
  SchemeColor? get bottomAppBarSchemeColorLight =>
      _bottomAppBarSchemeColorLight;
  void setBottomAppBarSchemeColorLight(SchemeColor? value,
      [bool notify = true]) {
    if (value == _bottomAppBarSchemeColorLight) return;
    _bottomAppBarSchemeColorLight = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyBottomAppBarSchemeColorLight, value));
  }

  late SchemeColor? _bottomAppBarSchemeColorDark;
  SchemeColor? get bottomAppBarSchemeColorDark => _bottomAppBarSchemeColorDark;
  void setBottomAppBarSchemeColorDark(SchemeColor? value,
      [bool notify = true]) {
    if (value == _bottomAppBarSchemeColorDark) return;
    _bottomAppBarSchemeColorDark = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyBottomAppBarSchemeColorDark, value));
  }

  late double? _bottomAppBarHeight;
  double? get bottomAppBarHeight => _bottomAppBarHeight;
  void setBottomAppBarHeight(double? value, [bool notify = true]) {
    if (value == _bottomAppBarHeight) return;
    _bottomAppBarHeight = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyBottomAppBarHeight, value));
  }

  // TabBar SETTINGS.
  // ===========================================================================

  late FlexTabBarStyle? _tabBarStyle;
  FlexTabBarStyle? get tabBarStyle => _tabBarStyle;
  void setTabBarStyle(FlexTabBarStyle? value, [bool notify = true]) {
    if (value == _tabBarStyle) return;
    _tabBarStyle = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTabBarStyle, value));
  }

  late SchemeColor? _tabBarIndicatorLight;
  SchemeColor? get tabBarIndicatorLight => _tabBarIndicatorLight;
  void setTabBarIndicatorLight(SchemeColor? value, [bool notify = true]) {
    if (value == _tabBarIndicatorLight) return;
    _tabBarIndicatorLight = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTabBarIndicatorLight, value));
  }

  late SchemeColor? _tabBarIndicatorDark;
  SchemeColor? get tabBarIndicatorDark => _tabBarIndicatorDark;
  void setTabBarIndicatorDark(SchemeColor? value, [bool notify = true]) {
    if (value == _tabBarIndicatorDark) return;
    _tabBarIndicatorDark = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTabBarIndicatorDark, value));
  }

  late SchemeColor? _tabBarItemSchemeColorLight;
  SchemeColor? get tabBarItemSchemeColorLight => _tabBarItemSchemeColorLight;
  void setTabBarItemSchemeColorLight(SchemeColor? value, [bool notify = true]) {
    if (value == _tabBarItemSchemeColorLight) return;
    _tabBarItemSchemeColorLight = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTabBarItemSchemeColorLight, value));
  }

  late SchemeColor? _tabBarItemSchemeColorDark;
  SchemeColor? get tabBarItemSchemeColorDark => _tabBarItemSchemeColorDark;
  void setTabBarItemSchemeColorDark(SchemeColor? value, [bool notify = true]) {
    if (value == _tabBarItemSchemeColorDark) return;
    _tabBarItemSchemeColorDark = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTabBarItemSchemeColorDark, value));
  }

  late SchemeColor? _tabBarUnselectedItemSchemeColorLight;
  SchemeColor? get tabBarUnselectedItemSchemeColorLight =>
      _tabBarUnselectedItemSchemeColorLight;
  void setTabBarUnselectedItemSchemeColorLight(SchemeColor? value,
      [bool notify = true]) {
    if (value == _tabBarUnselectedItemSchemeColorLight) return;
    _tabBarUnselectedItemSchemeColorLight = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(
        Store.keyTabBarUnselectedItemSchemeColorLight, value));
  }

  late SchemeColor? _tabBarUnselectedItemSchemeColorDark;
  SchemeColor? get tabBarUnselectedItemSchemeColorDark =>
      _tabBarUnselectedItemSchemeColorDark;
  void setTabBarUnselectedItemSchemeColorDark(SchemeColor? value,
      [bool notify = true]) {
    if (value == _tabBarUnselectedItemSchemeColorDark) return;
    _tabBarUnselectedItemSchemeColorDark = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(
        Store.keyTabBarUnselectedItemSchemeColorDark, value));
  }

  late double? _tabBarUnselectedItemOpacityLight;
  double? get tabBarUnselectedItemOpacityLight =>
      _tabBarUnselectedItemOpacityLight;
  void setTabBarUnselectedItemOpacityLight(double? value,
      [bool notify = true]) {
    if (value == _tabBarUnselectedItemOpacityLight) return;
    _tabBarUnselectedItemOpacityLight = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyTabBarUnselectedItemOpacityLight, value));
  }

  late double? _tabBarUnselectedItemOpacityDark;
  double? get tabBarUnselectedItemOpacityDark =>
      _tabBarUnselectedItemOpacityDark;
  void setTabBarUnselectedItemOpacityDark(double? value, [bool notify = true]) {
    if (value == _tabBarUnselectedItemOpacityDark) return;
    _tabBarUnselectedItemOpacityDark = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyTabBarUnselectedItemOpacityDark, value));
  }

  late TabBarIndicatorSize? _tabBarIndicatorSize;
  TabBarIndicatorSize? get tabBarIndicatorSize => _tabBarIndicatorSize;
  void setTabBarIndicatorSize(TabBarIndicatorSize? value,
      [bool notify = true]) {
    if (value == _tabBarIndicatorSize) return;
    _tabBarIndicatorSize = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTabBarIndicatorSize, value));
  }

  late double? _tabBarIndicatorWeight;
  double? get tabBarIndicatorWeight => _tabBarIndicatorWeight;
  void setTabBarIndicatorWeight(double? value, [bool notify = true]) {
    if (value == _tabBarIndicatorWeight) return;
    _tabBarIndicatorWeight = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTabBarIndicatorWeight, value));
  }

  late double? _tabBarIndicatorTopRadius;
  double? get tabBarIndicatorTopRadius => _tabBarIndicatorTopRadius;
  void setTabBarIndicatorTopRadius(double? value, [bool notify = true]) {
    if (value == _tabBarIndicatorTopRadius) return;
    _tabBarIndicatorTopRadius = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTabBarIndicatorTopRadius, value));
  }

  late Color? _tabBarDividerColor;
  Color? get tabBarDividerColor => _tabBarDividerColor;
  void setTabBarDividerColor(Color? value, [bool notify = true]) {
    if (value == _tabBarDividerColor) return;
    _tabBarDividerColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTabBarDividerColor, value));
  }

  late TabAlignment? _tabBarTabAlignment;
  TabAlignment? get tabBarTabAlignment => _tabBarTabAlignment;
  void setTabBarTabAlignment(TabAlignment? value, [bool notify = true]) {
    if (value == _tabBarTabAlignment) return;
    _tabBarTabAlignment = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTabBarTabAlignment, value));
  }

  // Drawer SETTINGS.
  // ===========================================================================

  late double? _drawerBorderRadius;
  double? get drawerBorderRadius => _drawerBorderRadius;
  void setDrawerBorderRadius(double? value, [bool notify = true]) {
    if (value == _drawerBorderRadius) return;
    _drawerBorderRadius = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyDrawerBorderRadius, value));
  }

  late double? _drawerElevation;
  double? get drawerElevation => _drawerElevation;
  void setDrawerElevation(double? value, [bool notify = true]) {
    if (value == _drawerElevation) return;
    _drawerElevation = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyDrawerElevation, value));
  }

  late SchemeColor? _drawerBackgroundSchemeColor;
  SchemeColor? get drawerBackgroundSchemeColor => _drawerBackgroundSchemeColor;
  void setDrawerBackgroundSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _drawerBackgroundSchemeColor) return;
    _drawerBackgroundSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyDrawerBackgroundSchemeColor, value));
  }

  late double? _drawerWidth;
  double? get drawerWidth => _drawerWidth;
  void setDrawerWidth(double? value, [bool notify = true]) {
    if (value == _drawerWidth) return;
    _drawerWidth = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyDrawerWidth, value));
  }

  late double? _drawerIndicatorWidth;
  double? get drawerIndicatorWidth => _drawerIndicatorWidth;
  void setDrawerIndicatorWidth(double? value, [bool notify = true]) {
    if (value == _drawerIndicatorWidth) return;
    _drawerIndicatorWidth = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyDrawerIndicatorWidth, value));
  }

  late double? _drawerIndicatorBorderRadius;
  double? get drawerIndicatorBorderRadius => _drawerIndicatorBorderRadius;
  void setDrawerIndicatorBorderRadius(double? value, [bool notify = true]) {
    if (value == _drawerIndicatorBorderRadius) return;
    _drawerIndicatorBorderRadius = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyDrawerIndicatorBorderRadius, value));
  }

  late SchemeColor? _drawerIndicatorSchemeColor;
  SchemeColor? get drawerIndicatorSchemeColor => _drawerIndicatorSchemeColor;
  void setDrawerIndicatorSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _drawerIndicatorSchemeColor) return;
    _drawerIndicatorSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyDrawerIndicatorSchemeColor, value));
  }

  late double? _drawerIndicatorOpacity;
  double? get drawerIndicatorOpacity => _drawerIndicatorOpacity;
  void setDrawerIndicatorOpacity(double? value, [bool notify = true]) {
    if (value == _drawerIndicatorOpacity) return;
    _drawerIndicatorOpacity = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyDrawerIndicatorOpacity, value));
  }

  late SchemeColor? _drawerSelectedItemSchemeColor;
  SchemeColor? get drawerSelectedItemSchemeColor =>
      _drawerSelectedItemSchemeColor;
  void setDrawerSelectedItemSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _drawerSelectedItemSchemeColor) return;
    _drawerSelectedItemSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyDrawerSelectedItemSchemeColor, value));
  }

  late SchemeColor? _drawerUnselectedItemSchemeColor;
  SchemeColor? get drawerUnselectedItemSchemeColor =>
      _drawerUnselectedItemSchemeColor;
  void setDrawerUnselectedItemSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _drawerUnselectedItemSchemeColor) return;
    _drawerUnselectedItemSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyDrawerUnselectedItemSchemeColor, value));
  }

  // BottomSheet SETTINGS.
  // ===========================================================================

  late SchemeColor? _bottomSheetSchemeColor;
  SchemeColor? get bottomSheetSchemeColor => _bottomSheetSchemeColor;
  void setBottomSheetSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _bottomSheetSchemeColor) return;
    _bottomSheetSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyBottomSheetSchemeColor, value));
  }

  late double? _bottomSheetElevation;
  double? get bottomSheetElevation => _bottomSheetElevation;
  void setBottomSheetElevation(double? value, [bool notify = true]) {
    if (value == _bottomSheetElevation) return;
    _bottomSheetElevation = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyBottomSheetElevation, value));
  }

  late SchemeColor? _bottomSheetModalSchemeColor;
  SchemeColor? get bottomSheetModalSchemeColor => _bottomSheetModalSchemeColor;
  void setBottomSheetModalSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _bottomSheetModalSchemeColor) return;
    _bottomSheetModalSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyBottomSheetModalSchemeColor, value));
  }

  late double? _bottomSheetModalElevation;
  double? get bottomSheetModalElevation => _bottomSheetModalElevation;
  void setBottomSheetModalElevation(double? value, [bool notify = true]) {
    if (value == _bottomSheetModalElevation) return;
    _bottomSheetModalElevation = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyBottomSheetModalElevation, value));
  }

  late double? _bottomSheetBorderRadius;
  double? get bottomSheetBorderRadius => _bottomSheetBorderRadius;
  void setBottomSheetBorderRadius(double? value, [bool notify = true]) {
    if (value == _bottomSheetBorderRadius) return;
    _bottomSheetBorderRadius = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyBottomSheetBorderRadius, value));
  }

  // Android System Navigator bar SETTINGS.
  // ===========================================================================

  late FlexSystemNavBarStyle _sysNavBarStyle;
  FlexSystemNavBarStyle get sysNavBarStyle => _sysNavBarStyle;
  void setSysNavBarStyle(FlexSystemNavBarStyle? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _sysNavBarStyle) return;
    _sysNavBarStyle = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySysNavBarStyle, value));
  }

  late double _sysNavBarOpacity;
  double get sysNavBarOpacity => _sysNavBarOpacity;
  void setSysBarOpacity(double? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _sysNavBarOpacity) return;
    _sysNavBarOpacity = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySysNavBarOpacity, value));
  }

  late bool _useSysNavDivider;
  bool get useSysNavDivider => _useSysNavDivider;
  void setUseSysNavDivider(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _useSysNavDivider) return;
    _useSysNavDivider = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyUseSysNavDivider, value));
  }

  // BottomNavigationBar SETTINGS.
  // ===========================================================================

  late SchemeColor? _bottomNavBarBackgroundSchemeColor;
  SchemeColor? get bottomNavBarBackgroundSchemeColor =>
      _bottomNavBarBackgroundSchemeColor;
  void setBottomNavBarBackgroundSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _bottomNavBarBackgroundSchemeColor) return;
    _bottomNavBarBackgroundSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyBottomNavBarBackgroundSchemeColor, value));
  }

  late double? _bottomNavigationBarOpacity;
  double? get bottomNavigationBarOpacity => _bottomNavigationBarOpacity;
  void setBottomNavigationBarOpacity(double? value, [bool notify = true]) {
    if (value == _bottomNavigationBarOpacity) return;
    _bottomNavigationBarOpacity = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyBottomNavigationBarOpacity, value));
  }

  late double? _bottomNavigationBarElevation;
  double? get bottomNavigationBarElevation => _bottomNavigationBarElevation;
  void setBottomNavigationBarElevation(double? value, [bool notify = true]) {
    if (value == _bottomNavigationBarElevation) return;
    _bottomNavigationBarElevation = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyBottomNavigationBarElevation, value));
  }

  late SchemeColor? _bottomNavBarSelectedSchemeColor;
  SchemeColor? get bottomNavBarSelectedSchemeColor =>
      _bottomNavBarSelectedSchemeColor;
  void setBottomNavBarSelectedSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _bottomNavBarSelectedSchemeColor) return;
    _bottomNavBarSelectedSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(
        Store.keyBottomNavBarSelectedItemSchemeColor, value));
  }

  late SchemeColor? _bottomNavBarUnselectedSchemeColor;
  SchemeColor? get bottomNavBarUnselectedSchemeColor =>
      _bottomNavBarUnselectedSchemeColor;
  void setBottomNavBarUnselectedSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _bottomNavBarUnselectedSchemeColor) return;
    _bottomNavBarUnselectedSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyBottomNavBarUnselectedSchemeColor, value));
  }

  late bool? _bottomNavBarMuteUnselected;
  bool? get bottomNavBarMuteUnselected => _bottomNavBarMuteUnselected;
  void setBottomNavBarMuteUnselected(bool? value, [bool notify = true]) {
    if (value == _bottomNavBarMuteUnselected) return;
    _bottomNavBarMuteUnselected = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyBottomNavBarMuteUnselected, value));
  }

  late bool _bottomNavShowSelectedLabels;
  bool get bottomNavShowSelectedLabels => _bottomNavShowSelectedLabels;
  void setBottomNavShowSelectedLabels(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _bottomNavShowSelectedLabels) return;
    _bottomNavShowSelectedLabels = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyBottomNavShowSelectedLabels, value));
  }

  late bool _bottomNavShowUnselectedLabels;
  bool get bottomNavShowUnselectedLabels => _bottomNavShowUnselectedLabels;
  void setBottomNavShowUnselectedLabels(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _bottomNavShowUnselectedLabels) return;
    _bottomNavShowUnselectedLabels = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyBottomNavShowUnselectedLabels, value));
  }

  late double? _bottomNavigationBarSelectedLabelSize;
  double? get bottomNavigationBarSelectedLabelSize =>
      _bottomNavigationBarSelectedLabelSize;
  void setBottomNavigationBarSelectedLabelSize(double? value,
      [bool notify = true]) {
    if (value == _bottomNavigationBarSelectedLabelSize) return;
    _bottomNavigationBarSelectedLabelSize = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(
        Store.keyBottomNavigationBarSelectedLabelSize, value));
  }

  late double? _bottomNavigationBarUnselectedLabelSize;
  double? get bottomNavigationBarUnselectedLabelSize =>
      _bottomNavigationBarUnselectedLabelSize;
  void setBottomNavigationBarUnselectedLabelSize(double? value,
      [bool notify = true]) {
    if (value == _bottomNavigationBarUnselectedLabelSize) return;
    _bottomNavigationBarUnselectedLabelSize = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(
        Store.keyBottomNavigationBarUnselectedLabelSize, value));
  }

  late double? _bottomNavigationBarSelectedIconSize;
  double? get bottomNavigationBarSelectedIconSize =>
      _bottomNavigationBarSelectedIconSize;
  void setBottomNavigationBarSelectedIconSize(double? value,
      [bool notify = true]) {
    if (value == _bottomNavigationBarSelectedIconSize) return;
    _bottomNavigationBarSelectedIconSize = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(
        Store.keyBottomNavigationBarSelectedIconSize, value));
  }

  late double? _bottomNavigationBarUnselectedIconSize;
  double? get bottomNavigationBarUnselectedIconSize =>
      _bottomNavigationBarUnselectedIconSize;
  void setBottomNavigationBarUnselectedIconSize(double? value,
      [bool notify = true]) {
    if (value == _bottomNavigationBarUnselectedIconSize) return;
    _bottomNavigationBarUnselectedIconSize = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(
        Store.keyBottomNavigationBarUnselectedIconSize, value));
  }

  // MenuBar and MenuButton SETTINGS.
  // ===========================================================================

  late double? _menuRadius;
  double? get menuRadius => _menuRadius;
  void setMenuRadius(double? value, [bool notify = true]) {
    if (value == _menuRadius) return;
    _menuRadius = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyMenuRadius, value));
  }

  late double? _menuElevation;
  double? get menuElevation => _menuElevation;
  void setMenuElevation(double? value, [bool notify = true]) {
    if (value == _menuElevation) return;
    _menuElevation = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyMenuElevation, value));
  }

  late double? _menuOpacity;
  double? get menuOpacity => _menuOpacity;
  void setMenuOpacity(double? value, [bool notify = true]) {
    if (value == _menuOpacity) return;
    _menuOpacity = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyMenuOpacity, value));
  }

  late double? _menuPaddingStart;
  double? get menuPaddingStart => _menuPaddingStart;
  void setMenuPaddingStart(double? value, [bool notify = true]) {
    if (value == _menuPaddingStart) return;
    _menuPaddingStart = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyMenuPaddingStart, value));
  }

  late double? _menuPaddingEnd;
  double? get menuPaddingEnd => _menuPaddingEnd;
  void setMenuPaddingEnd(double? value, [bool notify = true]) {
    if (value == _menuPaddingEnd) return;
    _menuPaddingEnd = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyMenuPaddingEnd, value));
  }

  late double? _menuPaddingTop;
  double? get menuPaddingTop => _menuPaddingTop;
  void setMenuPaddingTop(double? value, [bool notify = true]) {
    if (value == _menuPaddingTop) return;
    _menuPaddingTop = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyMenuPaddingTop, value));
  }

  late double? _menuPaddingBottom;
  double? get menuPaddingBottom => _menuPaddingBottom;
  void setMenuPaddingBottom(double? value, [bool notify = true]) {
    if (value == _menuPaddingBottom) return;
    _menuPaddingBottom = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyMenuPaddingBottom, value));
  }

  late SchemeColor? _menuSchemeColor;
  SchemeColor? get menuSchemeColor => _menuSchemeColor;
  void setMenuSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _menuSchemeColor) return;
    _menuSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyMenuSchemeColor, value));
  }

  late SchemeColor? _menuBarBackgroundSchemeColor;
  SchemeColor? get menuBarBackgroundSchemeColor =>
      _menuBarBackgroundSchemeColor;
  void setMenuBarBackgroundSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _menuBarBackgroundSchemeColor) return;
    _menuBarBackgroundSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyMenuBarBackgroundSchemeColor, value));
  }

  late double? _menuBarRadius;
  double? get menuBarRadius => _menuBarRadius;
  void setMenuBarRadius(double? value, [bool notify = true]) {
    if (value == _menuBarRadius) return;
    _menuBarRadius = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyMenuBarRadius, value));
  }

  late double? _menuBarElevation;
  double? get menuBarElevation => _menuBarElevation;
  void setMenuBarElevation(double? value, [bool notify = true]) {
    if (value == _menuBarElevation) return;
    _menuBarElevation = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyMenuBarElevation, value));
  }

  late Color? _menuBarShadowColor;
  Color? get menuBarShadowColor => _menuBarShadowColor;
  void setMenuBarShadowColor(Color? value, [bool notify = true]) {
    if (value == _menuBarShadowColor) return;
    _menuBarShadowColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyMenuBarShadowColor, value));
  }

  late SchemeColor? _menuItemBackgroundSchemeColor;
  SchemeColor? get menuItemBackgroundSchemeColor =>
      _menuItemBackgroundSchemeColor;
  void setMenuItemBackgroundSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _menuItemBackgroundSchemeColor) return;
    _menuItemBackgroundSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyMenuItemBackgroundSchemeColor, value));
  }

  late SchemeColor? _menuItemForegroundSchemeColor;
  SchemeColor? get menuItemForegroundSchemeColor =>
      _menuItemForegroundSchemeColor;
  void setMenuItemForegroundSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _menuItemForegroundSchemeColor) return;
    _menuItemForegroundSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyMenuItemForegroundSchemeColor, value));
  }

  late SchemeColor? _menuIndicatorBackgroundSchemeColor;
  SchemeColor? get menuIndicatorBackgroundSchemeColor =>
      _menuIndicatorBackgroundSchemeColor;
  void setMenuIndicatorBackgroundSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _menuIndicatorBackgroundSchemeColor) return;
    _menuIndicatorBackgroundSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyMenuIndicatorBackgroundSchemeColor, value));
  }

  late SchemeColor? _menuIndicatorForegroundSchemeColor;
  SchemeColor? get menuIndicatorForegroundSchemeColor =>
      _menuIndicatorForegroundSchemeColor;
  void setMenuIndicatorForegroundSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _menuIndicatorForegroundSchemeColor) return;
    _menuIndicatorForegroundSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyMenuIndicatorForegroundSchemeColor, value));
  }

  late double? _menuIndicatorRadius;
  double? get menuIndicatorRadius => _menuIndicatorRadius;
  void setMenuIndicatorRadius(double? value, [bool notify = true]) {
    if (value == _menuIndicatorRadius) return;
    _menuIndicatorRadius = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyMenuIndicatorRadius, value));
  }

  // SearchView and SearchBar SETTINGS.
  // ===========================================================================

  late SchemeColor? _searchBackgroundSchemeColor;
  SchemeColor? get searchBackgroundSchemeColor => _searchBackgroundSchemeColor;
  void setSearchBackgroundSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _searchBackgroundSchemeColor) return;
    _searchBackgroundSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySearchBackgroundSchemeColor, value));
  }

  late double? _searchElevation;
  double? get searchElevation => _searchElevation;
  void setSearchElevation(double? value, [bool notify = true]) {
    if (value == _searchElevation) return;
    _searchElevation = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySearchElevation, value));
  }

  late double? _searchRadius;
  double? get searchRadius => _searchRadius;
  void setSearchRadius(double? value, [bool notify = true]) {
    if (value == _searchRadius) return;
    _searchRadius = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySearchRadius, value));
  }

  late double? _searchViewHeaderHeight;
  double? get searchViewHeaderHeight => _searchViewHeaderHeight;
  void setSearchViewHeaderHeight(double? value, [bool notify = true]) {
    if (value == _searchViewHeaderHeight) return;
    _searchViewHeaderHeight = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySearchViewHeaderHeight, value));
  }

  late bool _searchUseGlobalShape;
  bool get searchUseGlobalShape => _searchUseGlobalShape;
  void setSearchUseGlobalShape(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _searchUseGlobalShape) return;
    _searchUseGlobalShape = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySearchUseGlobalShape, value));
  }

  late bool _searchIsFullScreen;
  bool get searchIsFullScreen => _searchIsFullScreen;
  void setSearchIsFullScreen(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _searchIsFullScreen) return;
    _searchIsFullScreen = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySearchIsFullScreen, value));
  }

  // NavigationBar SETTINGS.
  // ===========================================================================

  late SchemeColor? _navBarBackgroundSchemeColor;
  SchemeColor? get navBarBackgroundSchemeColor => _navBarBackgroundSchemeColor;
  void setNavBarBackgroundSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _navBarBackgroundSchemeColor) return;
    _navBarBackgroundSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyNavBarBackgroundSchemeColor, value));
  }

  late double? _navBarOpacity;
  double? get navBarOpacity => _navBarOpacity;
  void setNavBarOpacity(double? value, [bool notify = true]) {
    if (value == _navBarOpacity) return;
    _navBarOpacity = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyNavBarOpacity, value));
  }

  late double? _navBarElevation;
  double? get navBarElevation => _navBarElevation;
  void setNavBarElevation(double? value, [bool notify = true]) {
    if (value == _navBarElevation) return;
    _navBarElevation = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyNavBarElevation, value));
  }

  late double? _navBarHeight;
  double? get navBarHeight => _navBarHeight;
  void setNavBarHeight(double? value, [bool notify = true]) {
    if (value == _navBarHeight) return;
    _navBarHeight = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyNavBarHeight, value));
  }

  late SchemeColor? _navBarSelectedIconSchemeColor;
  SchemeColor? get navBarSelectedIconSchemeColor =>
      _navBarSelectedIconSchemeColor;
  void setNavBarSelectedIconSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _navBarSelectedIconSchemeColor) return;
    _navBarSelectedIconSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyNavBarSelectedIconSchemeColor, value));
  }

  late SchemeColor? _navBarSelectedLabelSchemeColor;
  SchemeColor? get navBarSelectedLabelSchemeColor =>
      _navBarSelectedLabelSchemeColor;
  void setNavBarSelectedLabelSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _navBarSelectedLabelSchemeColor) return;
    _navBarSelectedLabelSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyNavBarSelectedLabelSchemeColor, value));
  }

  late SchemeColor? _navBarUnselectedSchemeColor;
  SchemeColor? get navBarUnselectedSchemeColor => _navBarUnselectedSchemeColor;
  void setNavBarUnselectedSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _navBarUnselectedSchemeColor) return;
    _navBarUnselectedSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyNavBarUnselectedSchemeColor, value));
  }

  late bool _navBarMuteUnselected;
  bool get navBarMuteUnselected => _navBarMuteUnselected;
  void setNavBarMuteUnselected(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _navBarMuteUnselected) return;
    _navBarMuteUnselected = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyNavBarMuteUnselected, value));
  }

  late SchemeColor? _navBarIndicatorSchemeColor;
  SchemeColor? get navBarIndicatorSchemeColor => _navBarIndicatorSchemeColor;
  void setNavBarIndicatorSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _navBarIndicatorSchemeColor) return;
    _navBarIndicatorSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyNavBarIndicatorSchemeColor, value));
  }

  late double? _navBarIndicatorOpacity;
  double? get navBarIndicatorOpacity => _navBarIndicatorOpacity;
  void setNavBarIndicatorOpacity(double? value, [bool notify = true]) {
    if (value == _navBarIndicatorOpacity) return;
    _navBarIndicatorOpacity = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyNavBarIndicatorOpacity, value));
  }

  late double? _navBarIndicatorBorderRadius;
  double? get navBarIndicatorBorderRadius => _navBarIndicatorBorderRadius;
  void setNavBarIndicatorBorderRadius(double? value, [bool notify = true]) {
    if (value == _navBarIndicatorBorderRadius) return;
    _navBarIndicatorBorderRadius = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyNavBarIndicatorBorderRadius, value));
  }

  late NavigationDestinationLabelBehavior _navBarLabelBehavior;
  NavigationDestinationLabelBehavior get navBarLabelBehavior =>
      _navBarLabelBehavior;
  void setNavBarLabelBehavior(NavigationDestinationLabelBehavior value,
      [bool notify = true]) {
    if (value == _navBarLabelBehavior) return;
    _navBarLabelBehavior = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyNavBarLabelBehavior, value));
  }

  late AdaptiveResponse? _adaptiveRemoveNavigationBarTintLight;
  AdaptiveResponse? get adaptiveRemoveNavigationBarTintLight =>
      _adaptiveRemoveNavigationBarTintLight;
  void setAdaptiveRemoveNavigationBarTintLight(AdaptiveResponse? value,
      [bool notify = true]) {
    if (value == _adaptiveRemoveNavigationBarTintLight) return;
    _adaptiveRemoveNavigationBarTintLight = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(
        Store.keyAdaptiveRemoveNavigationBarTintLight, value));
  }

  late AdaptiveResponse? _adaptiveRemoveNavigationBarTintDark;
  AdaptiveResponse? get adaptiveRemoveNavigationBarTintDark =>
      _adaptiveRemoveNavigationBarTintDark;
  void setAdaptiveRemoveNavigationBarTintDark(AdaptiveResponse? value,
      [bool notify = true]) {
    if (value == _adaptiveRemoveNavigationBarTintDark) return;
    _adaptiveRemoveNavigationBarTintDark = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(
        Store.keyAdaptiveRemoveNavigationBarTintDark, value));
  }

  late double? _navigationBarSelectedLabelSize;
  double? get navigationBarSelectedLabelSize => _navigationBarSelectedLabelSize;
  void setNavigationBarSelectedLabelSize(double? value, [bool notify = true]) {
    if (value == _navigationBarSelectedLabelSize) return;
    _navigationBarSelectedLabelSize = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyNavigationBarSelectedLabelSize, value));
  }

  late double? _navigationBarUnselectedLabelSize;
  double? get navigationBarUnselectedLabelSize =>
      _navigationBarUnselectedLabelSize;
  void setNavigationBarUnselectedLabelSize(double? value,
      [bool notify = true]) {
    if (value == _navigationBarUnselectedLabelSize) return;
    _navigationBarUnselectedLabelSize = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyNavigationBarUnselectedLabelSize, value));
  }

  late double? _navigationBarSelectedIconSize;
  double? get navigationBarSelectedIconSize => _navigationBarSelectedIconSize;
  void setNavigationBarSelectedIconSize(double? value, [bool notify = true]) {
    if (value == _navigationBarSelectedIconSize) return;
    _navigationBarSelectedIconSize = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyNavigationBarSelectedIconSize, value));
  }

  late double? _navigationBarUnselectedIconSize;
  double? get navigationBarUnselectedIconSize =>
      _navigationBarUnselectedIconSize;
  void setNavigationBarUnselectedIconSize(double? value, [bool notify = true]) {
    if (value == _navigationBarUnselectedIconSize) return;
    _navigationBarUnselectedIconSize = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyNavigationBarUnselectedIconSize, value));
  }

  // NavigationRail SETTINGS.
  // ===========================================================================

  late SchemeColor? _navRailBackgroundSchemeColor;
  SchemeColor? get navRailBackgroundSchemeColor =>
      _navRailBackgroundSchemeColor;
  void setNavRailBackgroundSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _navRailBackgroundSchemeColor) return;
    _navRailBackgroundSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyNavRailBackgroundSchemeColor, value));
  }

  late double? _navRailOpacity;
  double? get navRailOpacity => _navRailOpacity;
  void setNavRailOpacity(double? value, [bool notify = true]) {
    if (value == _navRailOpacity) return;
    _navRailOpacity = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyNavRailOpacity, value));
  }

  late double? _navRailElevation;
  double? get navRailElevation => _navRailElevation;
  void setNavRailElevation(double? value, [bool notify = true]) {
    if (value == _navRailElevation) return;
    _navRailElevation = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyNavRailElevation, value));
  }

  late SchemeColor? _navRailSelectedIconSchemeColor;
  SchemeColor? get navRailSelectedIconSchemeColor =>
      _navRailSelectedIconSchemeColor;
  void setNavRailSelectedIconSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _navRailSelectedIconSchemeColor) return;
    _navRailSelectedIconSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyNavRailSelectedIconSchemeColor, value));
  }

  late SchemeColor? _navRailSelectedLabelSchemeColor;
  SchemeColor? get navRailSelectedLabelSchemeColor =>
      _navRailSelectedLabelSchemeColor;
  void setNavRailSelectedLabelSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _navRailSelectedLabelSchemeColor) return;
    _navRailSelectedLabelSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyNavRailSelectedLabelSchemeColor, value));
  }

  late SchemeColor? _navRailUnselectedSchemeColor;
  SchemeColor? get navRailUnselectedSchemeColor =>
      _navRailUnselectedSchemeColor;
  void setNavRailUnselectedSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _navRailUnselectedSchemeColor) return;
    _navRailUnselectedSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyNavRailUnselectedSchemeColor, value));
  }

  late bool _navRailMuteUnselected;
  bool get navRailMuteUnselected => _navRailMuteUnselected;
  void setNavRailMuteUnselected(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _navRailMuteUnselected) return;
    _navRailMuteUnselected = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyNavRailMuteUnselected, value));
  }

  late NavigationRailLabelType _navRailLabelType;
  NavigationRailLabelType get navRailLabelType => _navRailLabelType;
  void setNavRailLabelType(NavigationRailLabelType value,
      [bool notify = true]) {
    if (value == _navRailLabelType) return;
    _navRailLabelType = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyNavRailLabelType, value));
  }

  late bool _navRailUseIndicator;
  bool get navRailUseIndicator => _navRailUseIndicator;
  void setNavRailUseIndicator(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _navRailUseIndicator) return;
    _navRailUseIndicator = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyNavRailUseIndicator, value));
  }

  late SchemeColor? _navRailIndicatorSchemeColor;
  SchemeColor? get navRailIndicatorSchemeColor => _navRailIndicatorSchemeColor;
  void setNavRailIndicatorSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _navRailIndicatorSchemeColor) return;
    _navRailIndicatorSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyNavRailIndicatorSchemeColor, value));
  }

  late double? _navRailIndicatorOpacity;
  double? get navRailIndicatorOpacity => _navRailIndicatorOpacity;
  void setNavRailIndicatorOpacity(double? value, [bool notify = true]) {
    if (value == _navRailIndicatorOpacity) return;
    _navRailIndicatorOpacity = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyNavRailIndicatorOpacity, value));
  }

  late double? _navRailIndicatorBorderRadius;
  double? get navRailIndicatorBorderRadius => _navRailIndicatorBorderRadius;
  void setNavRailIndicatorBorderRadius(double? value, [bool notify = true]) {
    if (value == _navRailIndicatorBorderRadius) return;
    _navRailIndicatorBorderRadius = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyNavRailIndicatorBorderRadius, value));
  }

  late double? _navigationRailSelectedLabelSize;
  double? get navigationRailSelectedLabelSize =>
      _navigationRailSelectedLabelSize;
  void setNavigationRailSelectedLabelSize(double? value, [bool notify = true]) {
    if (value == _navigationRailSelectedLabelSize) return;
    _navigationRailSelectedLabelSize = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyNavigationRailSelectedLabelSize, value));
  }

  late double? _navigationRailUnselectedLabelSize;
  double? get navigationRailUnselectedLabelSize =>
      _navigationRailUnselectedLabelSize;
  void setNavigationRailUnselectedLabelSize(double? value,
      [bool notify = true]) {
    if (value == _navigationRailUnselectedLabelSize) return;
    _navigationRailUnselectedLabelSize = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyNavigationRailUnselectedLabelSize, value));
  }

  late double? _navigationRailSelectedIconSize;
  double? get navigationRailSelectedIconSize => _navigationRailSelectedIconSize;
  void setNavigationRailSelectedIconSize(double? value, [bool notify = true]) {
    if (value == _navigationRailSelectedIconSize) return;
    _navigationRailSelectedIconSize = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyNavigationRailSelectedIconSize, value));
  }

  late double? _navigationRailUnselectedIconSize;
  double? get navigationRailUnselectedIconSize =>
      _navigationRailUnselectedIconSize;
  void setNavigationRailUnselectedIconSize(double? value,
      [bool notify = true]) {
    if (value == _navigationRailUnselectedIconSize) return;
    _navigationRailUnselectedIconSize = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyNavigationRailUnselectedIconSize, value));
  }

  late double? _navigationRailGroupAlignment;
  double? get navigationRailGroupAlignment => _navigationRailGroupAlignment;
  void setNavigationRailGroupAlignment(double? value, [bool notify = true]) {
    if (value == _navigationRailGroupAlignment) return;
    _navigationRailGroupAlignment = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyNavigationRailGroupAlignment, value));
  }

  late double? _navigationRailMinWidth;
  double? get navigationRailMinWidth => _navigationRailMinWidth;
  void setNavigationRailMinWidth(double? value, [bool notify = true]) {
    if (value == _navigationRailMinWidth) return;
    _navigationRailMinWidth = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyNavigationRailMinWidth, value));
  }

  late double? _navigationRailMinExtendedWidth;
  double? get navigationRailMinExtendedWidth => _navigationRailMinExtendedWidth;
  void setNavigationRailMinExtendedWidth(double? value, [bool notify = true]) {
    if (value == _navigationRailMinExtendedWidth) return;
    _navigationRailMinExtendedWidth = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyNavigationRailMinExtendedWidth, value));
  }

  // Button SETTINGS.
  // ===========================================================================

  late SchemeColor? _textButtonSchemeColor;
  SchemeColor? get textButtonSchemeColor => _textButtonSchemeColor;
  void setTextButtonSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _textButtonSchemeColor) return;
    _textButtonSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTextButtonSchemeColor, value));
  }

  late double? _textButtonBorderRadius;
  double? get textButtonBorderRadius => _textButtonBorderRadius;
  void setTextButtonBorderRadius(double? value, [bool notify = true]) {
    if (value == _textButtonBorderRadius) return;
    _textButtonBorderRadius = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTextButtonBorderRadius, value));
  }

  late SchemeColor? _filledButtonSchemeColor;
  SchemeColor? get filledButtonSchemeColor => _filledButtonSchemeColor;
  void setFilledButtonSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _filledButtonSchemeColor) return;
    _filledButtonSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyFilledButtonSchemeColor, value));
  }

  late double? _filledButtonBorderRadius;
  double? get filledButtonBorderRadius => _filledButtonBorderRadius;
  void setFilledButtonBorderRadius(double? value, [bool notify = true]) {
    if (value == _filledButtonBorderRadius) return;
    _filledButtonBorderRadius = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyFilledButtonBorderRadius, value));
  }

  late SchemeColor? _elevatedButtonSchemeColor;
  SchemeColor? get elevatedButtonSchemeColor => _elevatedButtonSchemeColor;
  void setElevatedButtonSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _elevatedButtonSchemeColor) return;
    _elevatedButtonSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyElevatedButtonSchemeColor, value));
  }

  late SchemeColor? _elevatedButtonSecondarySchemeColor;
  SchemeColor? get elevatedButtonSecondarySchemeColor =>
      _elevatedButtonSecondarySchemeColor;
  void setElevatedButtonSecondarySchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _elevatedButtonSecondarySchemeColor) return;
    _elevatedButtonSecondarySchemeColor = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyElevatedButtonSecondarySchemeColor, value));
  }

  late double? _elevatedButtonBorderRadius;
  double? get elevatedButtonBorderRadius => _elevatedButtonBorderRadius;
  void setElevatedButtonBorderRadius(double? value, [bool notify = true]) {
    if (value == _elevatedButtonBorderRadius) return;
    _elevatedButtonBorderRadius = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyElevatedButtonBorderRadius, value));
  }

  late SchemeColor? _outlinedButtonSchemeColor;
  SchemeColor? get outlinedButtonSchemeColor => _outlinedButtonSchemeColor;
  void setOutlinedButtonSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _outlinedButtonSchemeColor) return;
    _outlinedButtonSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyOutlinedButtonSchemeColor, value));
  }

  late SchemeColor? _outlinedButtonOutlineSchemeColor;
  SchemeColor? get outlinedButtonOutlineSchemeColor =>
      _outlinedButtonOutlineSchemeColor;
  void setOutlinedButtonOutlineSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _outlinedButtonOutlineSchemeColor) return;
    _outlinedButtonOutlineSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyOutlinedButtonOutlineSchemeColor, value));
  }

  late double? _outlinedButtonBorderRadius;
  double? get outlinedButtonBorderRadius => _outlinedButtonBorderRadius;
  void setOutlinedButtonBorderRadius(double? value, [bool notify = true]) {
    if (value == _outlinedButtonBorderRadius) return;
    _outlinedButtonBorderRadius = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyOutlinedButtonBorderRadius, value));
  }

  late double? _outlinedButtonBorderWidth;
  double? get outlinedButtonBorderWidth => _outlinedButtonBorderWidth;
  void setOutlinedButtonBorderWidth(double? value, [bool notify = true]) {
    if (value == _outlinedButtonBorderWidth) return;
    _outlinedButtonBorderWidth = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyOutlinedButtonBorderWidth, value));
  }

  late double? _outlinedButtonPressedBorderWidth;
  double? get outlinedButtonPressedBorderWidth =>
      _outlinedButtonPressedBorderWidth;
  void setOutlinedButtonPressedBorderWidth(double? value,
      [bool notify = true]) {
    if (value == _outlinedButtonPressedBorderWidth) return;
    _outlinedButtonPressedBorderWidth = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyOutlinedButtonPressedBorderWidth, value));
  }

  // ToggleButtons SETTINGS.
  // ===========================================================================

  late SchemeColor? _toggleButtonsSchemeColor;
  SchemeColor? get toggleButtonsSchemeColor => _toggleButtonsSchemeColor;
  void setToggleButtonsSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _toggleButtonsSchemeColor) return;
    _toggleButtonsSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyToggleButtonsSchemeColor, value));
  }

  late SchemeColor? _toggleButtonsSelectedForegroundSchemeColor;
  SchemeColor? get toggleButtonsSelectedForegroundSchemeColor =>
      _toggleButtonsSelectedForegroundSchemeColor;
  void setToggleButtonsSelectedForegroundSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _toggleButtonsSelectedForegroundSchemeColor) return;
    _toggleButtonsSelectedForegroundSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(
        Store.keyToggleButtonsSelectedForegroundSchemeColor, value));
  }

  late SchemeColor? _toggleButtonsUnselectedSchemeColor;
  SchemeColor? get toggleButtonsUnselectedSchemeColor =>
      _toggleButtonsUnselectedSchemeColor;
  void setToggleButtonsUnselectedSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _toggleButtonsUnselectedSchemeColor) return;
    _toggleButtonsUnselectedSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyToggleButtonsUnselectedSchemeColor, value));
  }

  late SchemeColor? _toggleButtonsBorderSchemeColor;
  SchemeColor? get toggleButtonsBorderSchemeColor =>
      _toggleButtonsBorderSchemeColor;
  void setToggleButtonsBorderSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _toggleButtonsBorderSchemeColor) return;
    _toggleButtonsBorderSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyToggleButtonsBorderSchemeColor, value));
  }

  late double? _toggleButtonsBorderRadius;
  double? get toggleButtonsBorderRadius => _toggleButtonsBorderRadius;
  void setToggleButtonsBorderRadius(double? value, [bool notify = true]) {
    if (value == _toggleButtonsBorderRadius) return;
    _toggleButtonsBorderRadius = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyToggleButtonsBorderRadius, value));
  }

  late double? _toggleButtonsBorderWidth;
  double? get toggleButtonsBorderWidth => _toggleButtonsBorderWidth;
  void setToggleButtonsBorderWidth(double? value, [bool notify = true]) {
    if (value == _toggleButtonsBorderWidth) return;
    _toggleButtonsBorderWidth = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyToggleButtonsBorderWidth, value));
  }

  // SegmentedButton SETTINGS.
  // ===========================================================================

  late SchemeColor? _segmentedButtonSchemeColor;
  SchemeColor? get segmentedButtonSchemeColor => _segmentedButtonSchemeColor;
  void setSegmentedButtonSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _segmentedButtonSchemeColor) return;
    _segmentedButtonSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySegmentedButtonSchemeColor, value));
  }

  late SchemeColor? _segmentedButtonSelectedForegroundSchemeColor;
  SchemeColor? get segmentedButtonSelectedForegroundSchemeColor =>
      _segmentedButtonSelectedForegroundSchemeColor;
  void setSegmentedButtonSelectedForegroundSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _segmentedButtonSelectedForegroundSchemeColor) return;
    _segmentedButtonSelectedForegroundSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(
        Store.keySegmentedButtonSelectedForegroundSchemeColor, value));
  }

  late SchemeColor? _segmentedButtonUnselectedSchemeColor;
  SchemeColor? get segmentedButtonUnselectedSchemeColor =>
      _segmentedButtonUnselectedSchemeColor;
  void setSegmentedButtonUnselectedSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _segmentedButtonUnselectedSchemeColor) return;
    _segmentedButtonUnselectedSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(
        Store.keySegmentedButtonUnselectedSchemeColor, value));
  }

  late SchemeColor? _segmentedButtonUnselectedForegroundSchemeColor;
  SchemeColor? get segmentedButtonUnselectedForegroundSchemeColor =>
      _segmentedButtonUnselectedForegroundSchemeColor;
  void setSegmentedButtonUnselectedForegroundSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _segmentedButtonUnselectedForegroundSchemeColor) return;
    _segmentedButtonUnselectedForegroundSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(
        Store.keySegmentedButtonUnselectedForegroundSchemeColor, value));
  }

  late SchemeColor? _segmentedButtonBorderSchemeColor;
  SchemeColor? get segmentedButtonBorderSchemeColor =>
      _segmentedButtonBorderSchemeColor;
  void setSegmentedButtonBorderSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _segmentedButtonBorderSchemeColor) return;
    _segmentedButtonBorderSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keySegmentedButtonBorderSchemeColor, value));
  }

  late double? _segmentedButtonBorderRadius;
  double? get segmentedButtonBorderRadius => _segmentedButtonBorderRadius;
  void setSegmentedButtonBorderRadius(double? value, [bool notify = true]) {
    if (value == _segmentedButtonBorderRadius) return;
    _segmentedButtonBorderRadius = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySegmentedButtonBorderRadius, value));
  }

  late double? _segmentedButtonBorderWidth;
  double? get segmentedButtonBorderWidth => _segmentedButtonBorderWidth;
  void setSegmentedButtonBorderWidth(double? value, [bool notify = true]) {
    if (value == _segmentedButtonBorderWidth) return;
    _segmentedButtonBorderWidth = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySegmentedButtonBorderWidth, value));
  }

  // Switch, CheckBox and Radio SETTINGS.
  // ===========================================================================

  late bool _unselectedToggleIsColored;
  bool get unselectedToggleIsColored => _unselectedToggleIsColored;
  void setUnselectedToggleIsColored(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _unselectedToggleIsColored) return;
    _unselectedToggleIsColored = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyUnselectedToggleIsColored, value));
  }

  late SchemeColor? _switchSchemeColor;
  SchemeColor? get switchSchemeColor => _switchSchemeColor;
  void setSwitchSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _switchSchemeColor) return;
    _switchSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySwitchSchemeColor, value));
  }

  late SchemeColor? _switchThumbSchemeColor;
  SchemeColor? get switchThumbSchemeColor => _switchThumbSchemeColor;
  void setSwitchThumbSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _switchThumbSchemeColor) return;
    _switchThumbSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySwitchThumbSchemeColor, value));
  }

  late bool _switchThumbFixedSize;
  bool get switchThumbFixedSize => _switchThumbFixedSize;
  void setSwitchThumbFixedSize(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _switchThumbFixedSize) return;
    _switchThumbFixedSize = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySwitchThumbFixedSize, value));
  }

  late AdaptiveResponse? _switchAdaptiveCupertinoLike;
  AdaptiveResponse? get switchAdaptiveCupertinoLike =>
      _switchAdaptiveCupertinoLike;
  void setSwitchAdaptiveCupertinoLike(AdaptiveResponse? value,
      [bool notify = true]) {
    if (value == _switchAdaptiveCupertinoLike) return;
    _switchAdaptiveCupertinoLike = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySwitchAdaptiveCupertinoLike, value));
  }

  late SchemeColor? _checkboxSchemeColor;
  SchemeColor? get checkboxSchemeColor => _checkboxSchemeColor;
  void setCheckboxSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _checkboxSchemeColor) return;
    _checkboxSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyCheckboxSchemeColor, value));
  }

  late SchemeColor? _radioSchemeColor;
  SchemeColor? get radioSchemeColor => _radioSchemeColor;
  void setRadioSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _radioSchemeColor) return;
    _radioSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyRadioSchemeColor, value));
  }

  // Slider SETTINGS.
  // ===========================================================================

  late SchemeColor? _sliderBaseSchemeColor;
  SchemeColor? get sliderBaseSchemeColor => _sliderBaseSchemeColor;
  void setSliderBaseSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _sliderBaseSchemeColor) return;
    _sliderBaseSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySliderBaseSchemeColor, value));
  }

  late SchemeColor? _sliderIndicatorSchemeColor;
  SchemeColor? get sliderIndicatorSchemeColor => _sliderIndicatorSchemeColor;
  void setSliderIndicatorSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _sliderIndicatorSchemeColor) return;
    _sliderIndicatorSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySliderIndicatorSchemeColor, value));
  }

  late bool _sliderValueTinted;
  bool get sliderValueTinted => _sliderValueTinted;
  void setSliderValueTinted(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _sliderValueTinted) return;
    _sliderValueTinted = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySliderValueTinted, value));
  }

  late FlexSliderIndicatorType? _sliderValueIndicatorType;
  FlexSliderIndicatorType? get sliderValueIndicatorType =>
      _sliderValueIndicatorType;
  void setSliderValueIndicatorType(FlexSliderIndicatorType? value,
      [bool notify = true]) {
    if (value == _sliderValueIndicatorType) return;
    _sliderValueIndicatorType = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySliderValueIndicatorType, value));
  }

  late ShowValueIndicator? _sliderShowValueIndicator;
  ShowValueIndicator? get sliderShowValueIndicator => _sliderShowValueIndicator;
  void setSliderShowValueIndicator(ShowValueIndicator? value,
      [bool notify = true]) {
    if (value == _sliderShowValueIndicator) return;
    _sliderShowValueIndicator = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySliderShowValueIndicator, value));
  }

  late double? _sliderTrackHeight;
  double? get sliderTrackHeight => _sliderTrackHeight;
  void setSliderTrackHeight(double? value, [bool notify = true]) {
    if (value == _sliderTrackHeight) return;
    _sliderTrackHeight = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySliderTrackHeight, value));
  }

  // Fab SETTINGS.
  // ===========================================================================

  late bool _fabUseShape;
  bool get fabUseShape => _fabUseShape;
  void setFabUseShape(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _fabUseShape) return;
    _fabUseShape = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyFabUseShape, value));
  }

  late bool _fabAlwaysCircular;
  bool get fabAlwaysCircular => _fabAlwaysCircular;
  void setFabAlwaysCircular(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _fabAlwaysCircular) return;
    _fabAlwaysCircular = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyFabAlwaysCircular, value));
  }

  late double? _fabBorderRadius;
  double? get fabBorderRadius => _fabBorderRadius;
  void setFabBorderRadius(double? value, [bool notify = true]) {
    if (value == _fabBorderRadius) return;
    _fabBorderRadius = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyFabBorderRadius, value));
  }

  late SchemeColor? _fabSchemeColor;
  SchemeColor? get fabSchemeColor => _fabSchemeColor;
  void setFabSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _fabSchemeColor) return;
    _fabSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyFabSchemeColor, value));
  }

  late SchemeColor? _fabForegroundSchemeColor;
  SchemeColor? get fabForegroundSchemeColor => _fabForegroundSchemeColor;
  void setFabForegroundSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _fabForegroundSchemeColor) return;
    _fabForegroundSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyFabForegroundSchemeColor, value));
  }

  // Chip SETTINGS.
  // ===========================================================================

  late SchemeColor? _chipSchemeColor;
  SchemeColor? get chipSchemeColor => _chipSchemeColor;
  void setChipSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _chipSchemeColor) return;
    _chipSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyChipSchemeColor, value));
  }

  late SchemeColor? _chipSelectedSchemeColor;
  SchemeColor? get chipSelectedSchemeColor => _chipSelectedSchemeColor;
  void setChipSelectedSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _chipSelectedSchemeColor) return;
    _chipSelectedSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyChipSelectedSchemeColor, value));
  }

  late SchemeColor? _chipSecondarySelectedSchemeColor;
  SchemeColor? get chipSecondarySelectedSchemeColor =>
      _chipSecondarySelectedSchemeColor;
  void setChipSecondarySelectedSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _chipSecondarySelectedSchemeColor) return;
    _chipSecondarySelectedSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyChipSecondarySelectedSchemeColor, value));
  }

  late SchemeColor? _chipDeleteIconSchemeColor;
  SchemeColor? get chipDeleteIconSchemeColor => _chipDeleteIconSchemeColor;
  void setChipDeleteIconSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _chipDeleteIconSchemeColor) return;
    _chipDeleteIconSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyChipDeleteIconSchemeColor, value));
  }

  late bool? _chipBlendColors;
  bool? get chipBlendColors => _chipBlendColors;
  void setChipBlendColors(bool? value, [bool notify = true]) {
    if (value == _chipBlendColors) return;
    _chipBlendColors = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyChipBlendColors, value));
  }

  late double? _chipBorderRadius;
  double? get chipBorderRadius => _chipBorderRadius;
  void setChipBorderRadius(double? value, [bool notify = true]) {
    if (value == _chipBorderRadius) return;
    _chipBorderRadius = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyChipBorderRadius, value));
  }

  late double? _chipFontSize;
  double? get chipFontSize => _chipFontSize;
  void setChipFontSize(double? value, [bool notify = true]) {
    if (value == _chipFontSize) return;
    _chipFontSize = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyChipFontSize, value));
  }

  late double? _chipIconSize;
  double? get chipIconSize => _chipIconSize;
  void setChipIconSize(double? value, [bool notify = true]) {
    if (value == _chipIconSize) return;
    _chipIconSize = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyChipIconSize, value));
  }

  late double? _chipPaddingStart;
  double? get chipPaddingStart => _chipPaddingStart;
  void setChipPaddingStart(double? value, [bool notify = true]) {
    if (value == _chipPaddingStart) return;
    _chipPaddingStart = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyChipPaddingStart, value));
  }

  late double? _chipPaddingEnd;
  double? get chipPaddingEnd => _chipPaddingEnd;
  void setChipPaddingEnd(double? value, [bool notify = true]) {
    if (value == _chipPaddingEnd) return;
    _chipPaddingEnd = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyChipPaddingEnd, value));
  }

  late double? _chipPaddingTop;
  double? get chipPaddingTop => _chipPaddingTop;
  void setChipPaddingTop(double? value, [bool notify = true]) {
    if (value == _chipPaddingTop) return;
    _chipPaddingTop = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyChipPaddingTop, value));
  }

  late double? _chipPaddingBottom;
  double? get chipPaddingBottom => _chipPaddingBottom;
  void setChipPaddingBottom(double? value, [bool notify = true]) {
    if (value == _chipPaddingBottom) return;
    _chipPaddingBottom = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyChipPaddingBottom, value));
  }

  // SnackBar SETTINGS.
  // ===========================================================================

  late double? _snackBarElevation;
  double? get snackBarElevation => _snackBarElevation;
  void setSnackBarElevation(double? value, [bool notify = true]) {
    if (value == _snackBarElevation) return;
    _snackBarElevation = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySnackBarElevation, value));
  }

  late double? _snackBarBorderRadius;
  double? get snackBarBorderRadius => _snackBarBorderRadius;
  void setSnackBarBorderRadius(double? value, [bool notify = true]) {
    if (value == _snackBarBorderRadius) return;
    _snackBarBorderRadius = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySnackBarBorderRadius, value));
  }

  late SchemeColor? _snackBarSchemeColor;
  SchemeColor? get snackBarSchemeColor => _snackBarSchemeColor;
  void setSnackBarSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _snackBarSchemeColor) return;
    _snackBarSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySnackBarSchemeColor, value));
  }

  late SchemeColor? _snackBarActionSchemeColor;
  SchemeColor? get snackBarActionSchemeColor => _snackBarActionSchemeColor;
  void setSnackBarActionSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _snackBarActionSchemeColor) return;
    _snackBarActionSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySnackBarActionSchemeColor, value));
  }

  // PopupMenu, Dropdown and Card SETTINGS.
  // ===========================================================================

  late SchemeColor? _popupMenuSchemeColor;
  SchemeColor? get popupMenuSchemeColor => _popupMenuSchemeColor;
  void setPopupMenuSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _popupMenuSchemeColor) return;
    _popupMenuSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyPopupMenuSchemeColor, value));
  }

  late double? _popupMenuOpacity;
  double? get popupMenuOpacity => _popupMenuOpacity;
  void setPopupMenuOpacity(double? value, [bool notify = true]) {
    if (value == _popupMenuOpacity) return;
    _popupMenuOpacity = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyPopupMenuOpacity, value));
  }

  late double? _popupMenuBorderRadius;
  double? get popupMenuBorderRadius => _popupMenuBorderRadius;
  void setPopupMenuBorderRadius(double? value, [bool notify = true]) {
    if (value == _popupMenuBorderRadius) return;
    _popupMenuBorderRadius = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyPopupMenuBorderRadius, value));
  }

  late double? _popupMenuElevation;
  double? get popupMenuElevation => _popupMenuElevation;
  void setPopupMenuElevation(double? value, [bool notify = true]) {
    if (value == _popupMenuElevation) return;
    _popupMenuElevation = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyPopupMenuElevation, value));
  }

  late bool _alignedDropdown;
  bool get alignedDropdown => _alignedDropdown;
  void setAlignedDropdown(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _alignedDropdown) return;
    _alignedDropdown = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyAlignedDropdown, value));
  }

  late double? _cardBorderRadius;
  double? get cardBorderRadius => _cardBorderRadius;
  void setCardBorderRadius(double? value, [bool notify = true]) {
    if (value == _cardBorderRadius) return;
    _cardBorderRadius = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyCardBorderRadius, value));
  }

  // Dialog SETTINGS.
  // ===========================================================================

  late SchemeColor? _dialogBackgroundLightSchemeColor;
  SchemeColor? get dialogBackgroundLightSchemeColor =>
      _dialogBackgroundLightSchemeColor;
  void setDialogBackgroundLightSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _dialogBackgroundLightSchemeColor) return;
    _dialogBackgroundLightSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyDialogBackgroundLightSchemeColor, value));
  }

  late SchemeColor? _dialogBackgroundDarkSchemeColor;
  SchemeColor? get dialogBackgroundDarkSchemeColor =>
      _dialogBackgroundDarkSchemeColor;
  void setDialogBackgroundDarkSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _dialogBackgroundDarkSchemeColor) return;
    _dialogBackgroundDarkSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyDialogBackgroundDarkSchemeColor, value));
  }

  late SchemeColor? _datePickerHeaderBackgroundSchemeColor;
  SchemeColor? get datePickerHeaderBackgroundSchemeColor =>
      _datePickerHeaderBackgroundSchemeColor;
  void setDatePickerHeaderBackgroundSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _datePickerHeaderBackgroundSchemeColor) return;
    _datePickerHeaderBackgroundSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(
        Store.keyDatePickerHeaderBackgroundSchemeColor, value));
  }

  late SchemeColor? _datePickerHeaderForegroundSchemeColor;
  SchemeColor? get datePickerHeaderForegroundSchemeColor =>
      _datePickerHeaderForegroundSchemeColor;
  void setDatePickerHeaderForegroundSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _datePickerHeaderForegroundSchemeColor) return;
    _datePickerHeaderForegroundSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(
        Store.keyDatePickerHeaderForegroundSchemeColor, value));
  }

  late SchemeColor? _datePickerDividerSchemeColor;
  SchemeColor? get datePickerDividerSchemeColor =>
      _datePickerDividerSchemeColor;
  void setDatePickerDividerSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _datePickerDividerSchemeColor) return;
    _datePickerDividerSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyDatePickerDividerSchemeColor, value));
  }

  late bool _useInputDecoratorThemeInDialogs;
  bool get useInputDecoratorThemeInDialogs => _useInputDecoratorThemeInDialogs;
  void setUseInputDecoratorThemeInDialogs(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _useInputDecoratorThemeInDialogs) return;
    _useInputDecoratorThemeInDialogs = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyUseInputDecoratorThemeInDialogs, value));
  }

  late AdaptiveResponse? _adaptiveResponseDialogRadius;
  AdaptiveResponse? get adaptiveResponseDialogRadius =>
      _adaptiveResponseDialogRadius;
  void setAdaptiveResponseDialogRadius(AdaptiveResponse? value,
      [bool notify = true]) {
    if (value == _adaptiveResponseDialogRadius) return;
    _adaptiveResponseDialogRadius = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyAdaptiveResponseDialogRadius, value));
  }

  late double? _dialogBorderRadius;
  double? get dialogBorderRadius => _dialogBorderRadius;
  void setDialogBorderRadius(double? value, [bool notify = true]) {
    if (value == _dialogBorderRadius) return;
    _dialogBorderRadius = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyDialogBorderRadius, value));
  }

  late double? _dialogBorderRadiusAdaptive;
  double? get dialogBorderRadiusAdaptive => _dialogBorderRadiusAdaptive;
  void setDialogBorderRadiusAdaptive(double? value, [bool notify = true]) {
    if (value == _dialogBorderRadiusAdaptive) return;
    _dialogBorderRadiusAdaptive = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyDialogBorderRadiusAdaptive, value));
  }

  late double? _timePickerDialogBorderRadius;
  double? get timePickerDialogBorderRadius => _timePickerDialogBorderRadius;
  void setTimePickerDialogBorderRadius(double? value, [bool notify = true]) {
    if (value == _timePickerDialogBorderRadius) return;
    _timePickerDialogBorderRadius = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTimePickerDialogBorderRadius, value));
  }

  late double? _timePickerElementRadius;
  double? get timePickerElementRadius => _timePickerElementRadius;
  void setTimePickerElementRadius(double? value, [bool notify = true]) {
    if (value == _timePickerElementRadius) return;
    _timePickerElementRadius = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTimePickerElementRadius, value));
  }

  late double? _datePickerDialogBorderRadius;
  double? get datePickerDialogBorderRadius => _datePickerDialogBorderRadius;
  void setDatePickerDialogBorderRadius(double? value, [bool notify = true]) {
    if (value == _datePickerDialogBorderRadius) return;
    _datePickerDialogBorderRadius = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyDatePickerDialogBorderRadius, value));
  }

  late double? _dialogElevation;
  double? get dialogElevation => _dialogElevation;
  void setDialogElevation(double? value, [bool notify = true]) {
    if (value == _dialogElevation) return;
    _dialogElevation = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyDialogElevation, value));
  }

  // Tooltip SETTINGS.
  // ===========================================================================

  late double? _tooltipRadius;
  double? get tooltipRadius => _tooltipRadius;
  void setTooltipRadius(double? value, [bool notify = true]) {
    if (value == _tooltipRadius) return;
    _tooltipRadius = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTooltipRadius, value));
  }

  late int? _tooltipWaitDuration;
  int? get tooltipWaitDuration => _tooltipWaitDuration;
  void setTooltipWaitDuration(int? value, [bool notify = true]) {
    if (value == _tooltipWaitDuration) return;
    _tooltipWaitDuration = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTooltipWaitDuration, value));
  }

  late int? _tooltipShowDuration;
  int? get tooltipShowDuration => _tooltipShowDuration;
  void setTooltipShowDuration(int? value, [bool notify = true]) {
    if (value == _tooltipShowDuration) return;
    _tooltipShowDuration = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTooltipShowDuration, value));
  }

  late SchemeColor? _tooltipSchemeColor;
  SchemeColor? get tooltipSchemeColor => _tooltipSchemeColor;
  void setTooltipSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _tooltipSchemeColor) return;
    _tooltipSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTooltipSchemeColor, value));
  }

  late double? _tooltipOpacity;
  double? get tooltipOpacity => _tooltipOpacity;
  void setTooltipOpacity(double? value, [bool notify = true]) {
    if (value == _tooltipOpacity) return;
    _tooltipOpacity = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTooltipOpacity, value));
  }

  // Custom surface tint color SETTINGS.
  // ===========================================================================

  late Color? _surfaceTintLight;
  Color? get surfaceTintLight => _surfaceTintLight;
  void setSurfaceTintLight(Color? value, [bool notify = true]) {
    if (value == _surfaceTintLight) return;
    _surfaceTintLight = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySurfaceTintLight, value));
  }

  late Color? _surfaceTintDark;
  Color? get surfaceTintDark => _surfaceTintDark;
  void setSurfaceTintDark(Color? value, [bool notify = true]) {
    if (value == _surfaceTintDark) return;
    _surfaceTintDark = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySurfaceTintDark, value));
  }

  // Custom color SETTINGS.
  // ===========================================================================

  late bool _customUsesDarkColorsForSeed;
  bool get customUsesDarkColorsForSeed => _customUsesDarkColorsForSeed;
  void setCustomUsesDarkColorsForSeed(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _customUsesDarkColorsForSeed) return;
    _customUsesDarkColorsForSeed = value;
    if (_customUsesDarkColorsForSeed) {
      // setPrimaryLightRef(null, false);
      // setSecondaryLightRef(null, false);
      // setTertiaryLightRef(null, false);
      setPrimaryDarkRef(null, false);
      setSecondaryDarkRef(null, false);
      setTertiaryDarkRef(null, false);
    } else {
      // setPrimaryLightRef(primaryLight, false);
      // setSecondaryLightRef(secondaryLight, false);
      // setTertiaryLightRef(tertiaryLight, false);
      setPrimaryDarkRef(primaryLight, false);
      setSecondaryDarkRef(secondaryLight, false);
      setTertiaryDarkRef(tertiaryLight, false);
    }
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyCustomUsesDarkColorsForSeed, value));
  }

  late Color _primaryLight;
  Color get primaryLight => _primaryLight;
  void setPrimaryLight(Color? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _primaryLight) return;
    _primaryLight = value;
    setPrimaryLightRef(value, false);
    if (!customUsesDarkColorsForSeed) setPrimaryDarkRef(value, false);
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyPrimaryLight, value));
  }

  late Color? _primaryLightRef;
  Color? get primaryLightRef => _primaryLightRef;
  void setPrimaryLightRef(Color? value, [bool notify = true]) {
    if (value == _primaryLightRef) return;
    _primaryLightRef = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyPrimaryLightRef, value));
  }

  late Color _primaryContainerLight;
  Color get primaryContainerLight => _primaryContainerLight;
  void setPrimaryContainerLight(Color? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _primaryContainerLight) return;
    _primaryContainerLight = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyPrimaryContainerLight, value));
  }

  late Color _secondaryLight;
  Color get secondaryLight => _secondaryLight;
  void setSecondaryLight(Color? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _secondaryLight) return;
    _secondaryLight = value;
    setSecondaryLightRef(value, false);
    if (!customUsesDarkColorsForSeed) setSecondaryDarkRef(value, false);
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySecondaryLight, value));
  }

  late Color? _secondaryLightRef;
  Color? get secondaryLightRef => _secondaryLightRef;
  void setSecondaryLightRef(Color? value, [bool notify = true]) {
    if (value == _secondaryLightRef) return;
    _secondaryLightRef = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySecondaryLightRef, value));
  }

  late Color _secondaryContainerLight;
  Color get secondaryContainerLight => _secondaryContainerLight;
  void setSecondaryContainerLight(Color? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _secondaryContainerLight) return;
    _secondaryContainerLight = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySecondaryContainerLight, value));
  }

  late Color _tertiaryLight;
  Color get tertiaryLight => _tertiaryLight;
  void setTertiaryLight(Color? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _tertiaryLight) return;
    setTertiaryLightRef(value, false);
    if (!customUsesDarkColorsForSeed) setTertiaryDarkRef(value, false);
    _tertiaryLight = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTertiaryLight, value));
  }

  late Color? _tertiaryLightRef;
  Color? get tertiaryLightRef => _tertiaryLightRef;
  void setTertiaryLightRef(Color? value, [bool notify = true]) {
    if (value == _tertiaryLightRef) return;
    _tertiaryLightRef = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTertiaryLightRef, value));
  }

  late Color _tertiaryContainerLight;
  Color get tertiaryContainerLight => _tertiaryContainerLight;
  void setTertiaryContainerLight(Color? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _tertiaryContainerLight) return;
    _tertiaryContainerLight = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTertiaryContainerLight, value));
  }

  late Color _errorLight;
  Color get errorLight => _errorLight;
  void setErrorLight(Color? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _errorLight) return;
    _errorLight = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyErrorLight, value));
  }

  late Color _errorContainerLight;
  Color get errorContainerLight => _errorContainerLight;
  void setErrorContainerLight(Color? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _errorContainerLight) return;
    _errorContainerLight = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyErrorContainerLight, value));
  }

  late Color _primaryDark;
  Color get primaryDark => _primaryDark;
  void setPrimaryDark(Color? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _primaryDark) return;
    _primaryDark = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyPrimaryDark, value));
  }

  late Color? _primaryDarkRef;
  Color? get primaryDarkRef => _primaryDarkRef;
  void setPrimaryDarkRef(Color? value, [bool notify = true]) {
    if (value == _primaryDarkRef) return;
    _primaryDarkRef = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyPrimaryDarkRef, value));
  }

  late Color _primaryContainerDark;
  Color get primaryContainerDark => _primaryContainerDark;
  void setPrimaryContainerDark(Color? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _primaryContainerDark) return;
    _primaryContainerDark = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyPrimaryContainerDark, value));
  }

  late Color _secondaryDark;
  Color get secondaryDark => _secondaryDark;
  void setSecondaryDark(Color? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _secondaryDark) return;
    _secondaryDark = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySecondaryDark, value));
  }

  late Color? _secondaryDarkRef;
  Color? get secondaryDarkRef => _secondaryDarkRef;
  void setSecondaryDarkRef(Color? value, [bool notify = true]) {
    if (value == _secondaryDarkRef) return;
    _secondaryDarkRef = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySecondaryDarkRef, value));
  }

  late Color _secondaryContainerDark;
  Color get secondaryContainerDark => _secondaryContainerDark;
  void setSecondaryContainerDark(Color? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _secondaryContainerDark) return;
    _secondaryContainerDark = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySecondaryContainerDark, value));
  }

  late Color _tertiaryDark;
  Color get tertiaryDark => _tertiaryDark;
  void setTertiaryDark(Color? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _tertiaryDark) return;
    _tertiaryDark = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTertiaryDark, value));
  }

  late Color? _tertiaryDarkRef;
  Color? get tertiaryDarkRef => _tertiaryDarkRef;
  void setTertiaryDarkRef(Color? value, [bool notify = true]) {
    if (value == _tertiaryDarkRef) return;
    _tertiaryDarkRef = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTertiaryDarkRef, value));
  }

  late Color _tertiaryContainerDark;
  Color get tertiaryContainerDark => _tertiaryContainerDark;
  void setTertiaryContainerDark(Color? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _tertiaryContainerDark) return;
    _tertiaryContainerDark = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTertiaryContainerDark, value));
  }

  late Color _errorDark;
  Color get errorDark => _errorDark;
  void setErrorDark(Color? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _errorDark) return;
    _errorDark = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyErrorDark, value));
  }

  late Color _errorContainerDark;
  Color get errorContainerDark => _errorContainerDark;
  void setErrorContainerDark(Color? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _errorContainerDark) return;
    _errorContainerDark = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyErrorContainerDark, value));
  }

  // Get custom scheme data based on currently defined scheme colors.
  FlexSchemeData get customScheme => FlexSchemeData(
        name: FlexColor.customName,
        description: FlexColor.customDescription,
        light: FlexSchemeColor(
          primary: primaryLight,
          primaryContainer: primaryContainerLight,
          primaryLightRef: primaryLightRef,
          secondary: secondaryLight,
          secondaryContainer: secondaryContainerLight,
          secondaryLightRef: secondaryLightRef,
          tertiary: tertiaryLightRef,
          tertiaryContainer: tertiaryContainerLight,
          tertiaryLightRef: tertiaryLightRef,
          appBarColor: secondaryContainerLight,
          error: errorLight,
          errorContainer: errorContainerLight,
        ),
        dark: FlexSchemeColor(
          primary: primaryDark,
          primaryContainer: primaryContainerDark,
          primaryLightRef: primaryDarkRef,
          secondary: secondaryDark,
          secondaryContainer: secondaryContainerDark,
          secondaryLightRef: secondaryDarkRef,
          tertiary: tertiaryDark,
          tertiaryContainer: tertiaryContainerDark,
          tertiaryLightRef: tertiaryDarkRef,
          appBarColor: secondaryContainerDark,
          error: errorDark,
          errorContainer: errorContainerDark,
        ),
      );

  // Set the custom scheme colors to the colors scheme FlexSchemeData.
  void setCustomScheme(FlexSchemeData scheme) {
    // Don't notify listeners while setting new values for each value.
    setPrimaryLight(scheme.light.primary, false);
    setPrimaryLightRef(scheme.light.primaryLightRef, false);
    setPrimaryContainerLight(scheme.light.primaryContainer, false);
    //
    setSecondaryLight(scheme.light.secondary, false);
    setSecondaryLightRef(scheme.light.secondaryLightRef, false);
    setSecondaryContainerLight(scheme.light.secondaryContainer, false);
    //
    setTertiaryLight(scheme.light.tertiary, false);
    setTertiaryLightRef(scheme.light.tertiaryLightRef, false);
    setTertiaryContainerLight(scheme.light.tertiaryContainer, false);
    //
    setErrorLight(scheme.light.error, false);
    setErrorContainerLight(scheme.light.errorContainer, false);
    //
    setPrimaryDark(scheme.dark.primary, false);
    if (customUsesDarkColorsForSeed) {
      setPrimaryDarkRef(null, false);
    } else {
      setPrimaryDarkRef(scheme.light.primary, false);
    }
    setPrimaryContainerDark(scheme.dark.primaryContainer, false);
    setSecondaryDark(scheme.dark.secondary, false);
    if (customUsesDarkColorsForSeed) {
      setSecondaryDarkRef(null, false);
    } else {
      setSecondaryDarkRef(scheme.light.secondary, false);
    }
    setSecondaryContainerDark(scheme.dark.secondaryContainer, false);
    setTertiaryDark(scheme.dark.tertiary, false);
    if (customUsesDarkColorsForSeed) {
      setTertiaryDarkRef(null, false);
    } else {
      setTertiaryDarkRef(scheme.light.tertiary, false);
    }
    setTertiaryContainerDark(scheme.dark.tertiaryContainer, false);
    setErrorDark(scheme.dark.error, false);
    setErrorContainerDark(scheme.dark.errorContainer, false);
    // Notify listeners, after all individual values have been set.
    notifyListeners();
  }

  // Reset both fake target platform and fake web setting.
  void resetFakePlatform() {
    setFakeIsWeb(null, false);
    setPlatform(null, false);
    // Notify listeners, after all individual values have been set.
    notifyListeners();
  }

  /// A controller prop for the Platform menu control.
  ///
  /// It is used as input to the theme, but never persisted so it always
  /// defaults to the actual target platform when starting the app.
  /// Being able to toggle it during demos and development is a handy feature,
  /// to use to test platform adaptive theming features with.
  ///
  /// This is OK to be in ThemeController, if this is changed, the entire app
  /// theme must update too, and yes it is a part of ThemeData.
  late TargetPlatform? _platform;
  TargetPlatform? get platform => _platform;
  void setPlatform(TargetPlatform? value, [bool notify = true]) {
    if (value == _platform) return;
    _platform = value;
    if (notify) notifyListeners();
  }

  // Control for faking kIsWeb in-app to test platform adaptive web theme
  // settings. It is no persisted. This control only impacts the FCS
  // theming properties and will use mock web input to them instead of
  // actual kIsWeb.
  late bool? _fakeIsWeb;
  bool? get fakeIsWeb => _fakeIsWeb;
  void setFakeIsWeb(bool? value, [bool notify = true]) {
    if (value == _fakeIsWeb) return;
    _fakeIsWeb = value;
    if (notify) notifyListeners();
  }

  // Recently used colors, we keep the list of recently used colors in the
  // color picker for custom colors only during the session we don't persist it.
  // It is of course possible to persist, but not needed in this app.
  //
  // This is OK to be in ThemeController, these colors change as we change
  // custom colors for the theme, that needs to update the entire app anyway.
  List<Color> _recentColors = <Color>[];
  List<Color> get recentColors => _recentColors;
  // ignore: use_setters_to_change_properties
  void setRecentColors(final List<Color> colors) {
    _recentColors = colors;
  }

  /// Check if we can import/export the theme data
  bool canImportExportThemeData() {
    return _themeService.supportsExportImport;
  }

  /// Export saved theme settings from local data
  Map<String, dynamic> exportSavedThemeData() {
    return _themeService.getAll();
  }

  /// Import saved theme settings to local data
  Future<void> importSavedThemeData(Map<String, dynamic> data) {
    return _themeService.putAll(data);
  }
}
