// ignore_for_file: lines_longer_than_80_chars
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../shared/const/app.dart';
import '../../shared/const/app_color.dart';
import '../../shared/controllers/theme_controller.dart';
import '../../shared/model/adaptive_theme.dart';

/// A function that returns the FlexColorScheme Dart and Flutter setup
/// code for the theme held by ThemeController.
///
/// The properties are typically in the order they are in the classes.
String generateThemeDartCode(ThemeController controller) {
  // If FlexColorsScheme is not in use, return a default M3/M2 ColorScheme based
  // theme as a starting point suggestion.
  if (!controller.useFlexColorScheme) {
    // Are we using Typography 2021 or 2018? M3 defaults to Typo2021 so no need
    // specify it, but M2 default to even older typ2014 if not specifying 2018.
    final String usedTypography = controller.useMaterial3
        ? ''
        : '  typography: Typography.material2018(platform: defaultTargetPlatform),';
    if (controller.useMaterial3) {
      return '''
  // FlexColorScheme is not in use!
  // Here is a default Material-3 starting point theme setup for you.
  //
  theme: ThemeData(    
    useMaterial3: true,
  $usedTypography 
  ),
  darkTheme: ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
  $usedTypography    
  ),
  themeMode: ThemeMode.system,''';
    } else {
      return '''
  // FlexColorScheme is not in use!
  // Here is a default Material 2 starting point theme setup for you.
  //
  theme: ThemeData(
    colorScheme: const ColorScheme.light(),    
  $usedTypography
  ),
  darkTheme: ThemeData(    
    colorScheme: const ColorScheme.dark(),
    applyElevationOverlayColor: true,
  $usedTypography  
  ),
  themeMode: ThemeMode.system,''';
    }
  }

  // Code for main theme setup, the effective colors setup.
  final FlexSchemeData scheme = AppColor.scheme(controller);
  // Get the enum index of scheme
  final int flexScheme = controller.schemeIndex - 3;
  // Using a built-in scheme or one of the custom colors in the demo?
  final bool useBuiltIn = controller.schemeIndex > 2 &&
      controller.schemeIndex < AppColor.schemes.length - 1;
  final String lightScheme = useBuiltIn
      ? '  scheme: ${FlexScheme.values[flexScheme]},\n'
      : '  colors: const FlexSchemeColor(\n'
          '    primary: ${scheme.light.primary},\n'
          '    primaryContainer: ${scheme.light.primaryContainer},\n'
          '    secondary: ${scheme.light.secondary},\n'
          '    secondaryContainer: ${scheme.light.secondaryContainer},\n'
          '    tertiary: ${scheme.light.tertiary},\n'
          '    tertiaryContainer: ${scheme.light.tertiaryContainer},\n'
          '    appBarColor: ${scheme.light.appBarColor},\n'
          '    error: ${scheme.light.error},\n'
          '    errorContainer: ${scheme.light.errorContainer},\n'
          '  ),\n';
  String darkScheme = useBuiltIn
      ? '  scheme: ${FlexScheme.values[flexScheme]},\n'
      : '  colors: const FlexSchemeColor(\n'
          '    primary: ${scheme.dark.primary},\n'
          '    primaryContainer: ${scheme.dark.primaryContainer},\n'
          '    secondary: ${scheme.dark.secondary},\n'
          '    secondaryContainer: ${scheme.dark.secondaryContainer},\n'
          '    tertiary: ${scheme.dark.tertiary},\n'
          '    tertiaryContainer: ${scheme.dark.tertiaryContainer},\n'
          '    appBarColor: ${scheme.dark.appBarColor},\n'
          '    error: ${scheme.dark.error},\n'
          '    errorContainer: ${scheme.dark.errorContainer},\n'
          '  ),\n';
  if (controller.useToDarkMethod && !useBuiltIn && !controller.useKeyColors) {
    darkScheme = '  colors: const FlexSchemeColor(\n'
        '    primary: ${scheme.light.primary},\n'
        '    primaryContainer: ${scheme.light.primaryContainer},\n'
        '    secondary: ${scheme.light.secondary},\n'
        '    secondaryContainer: ${scheme.light.secondaryContainer},\n'
        '    tertiary: ${scheme.light.tertiary},\n'
        '    tertiaryContainer: ${scheme.light.tertiaryContainer},\n'
        '    appBarColor: ${scheme.light.appBarColor},\n'
        '    error: ${scheme.light.error},\n'
        '    errorContainer: ${scheme.light.errorContainer},\n'
        '  ).defaultError.toDark(${controller.darkMethodLevel}, ${controller.toDarkSwapPrimaryAndContainer}),\n';
  }
  if (controller.useToDarkMethod && useBuiltIn && !controller.useKeyColors) {
    darkScheme =
        '  colors: FlexColor.schemes[${FlexScheme.values[flexScheme]}]!\n'
        '      .light.defaultError.toDark(${controller.darkMethodLevel}, ${controller.toDarkSwapPrimaryAndContainer}),\n';
  }
  //
  // Code for main theme setup, the other properties 'FlexColorScheme.light' and
  // 'FlexColorScheme.dark' factories direct parameters.
  // We avoid adding any code when API default values are being used.
  //
  final String visualDensity = controller.usedVisualDensity != null
      ? '  visualDensity: ${controller.usedVisualDensity!.code},\n'
      : '';
  final String surfaceModeLight = controller.blendLevel > 0 &&
          controller.surfaceModeLight != FlexSurfaceMode.highScaffoldLowSurfaces
      ? '  surfaceMode: ${controller.surfaceModeLight},\n'
      : '';
  final String surfaceModeDark = controller.blendLevelDark > 0 &&
          controller.surfaceModeDark != FlexSurfaceMode.highScaffoldLowSurfaces
      ? '  surfaceMode: ${controller.surfaceModeDark},\n'
      : '';
  final String blendLevel = controller.blendLevel > 0
      ? '  blendLevel: ${controller.blendLevel},\n'
      : '';
  final String fixedColorStyle =
      controller.fixedColorStyle != null && !controller.useKeyColors
          ? '  fixedColorStyle: ${controller.fixedColorStyle},\n'
          : '';
  final String usedColors = controller.usedColors != 6
      ? '  usedColors: ${controller.usedColors},\n'
      : '';
  final String blendLevelDark = controller.blendLevelDark > 0
      ? '  blendLevel: ${controller.blendLevelDark},\n'
      : '';
  final String appBarStyleLight = controller.appBarStyleLight == null ||
          (controller.useMaterial3 &&
              controller.appBarBackgroundSchemeColorLight != null)
      ? ''
      : '  appBarStyle: ${controller.appBarStyleLight},\n';
  final String appBarStyleDark = controller.appBarStyleDark == null ||
          (controller.useMaterial3 &&
              controller.appBarBackgroundSchemeColorDark != null)
      ? ''
      : '  appBarStyle: ${controller.appBarStyleDark},\n';
  final String appBarOpacityLight = controller.appBarOpacityLight != null &&
          controller.appBarOpacityLight != 1
      ? '  appBarOpacity: ${controller.appBarOpacityLight!.toStringAsFixed(2)},\n'
      : '';
  final String appBarOpacityDark = controller.appBarOpacityDark != null &&
          controller.appBarOpacityDark != 1
      ? '  appBarOpacity: ${controller.appBarOpacityDark!.toStringAsFixed(2)},\n'
      : '';
  final String transparentStatusBar = controller.transparentStatusBar
      ? ''
      : '  transparentStatusBar: ${controller.transparentStatusBar},\n';
  final String appBarElevationLight = controller.appBarElevationLight != 0 &&
          controller.appBarElevationLight != null
      ? '  appBarElevation: ${controller.appBarElevationLight!.toStringAsFixed(1)},\n'
      : '';
  final String appBarElevationDark = controller.appBarElevationDark != 0 &&
          controller.appBarElevationDark != null
      ? '  appBarElevation: ${controller.appBarElevationDark!.toStringAsFixed(1)},\n'
      : '';
  final String bottomAppBarElevationLight = controller
              .bottomAppBarElevationLight !=
          null
      ? '  bottomAppBarElevation: ${controller.bottomAppBarElevationLight!.toStringAsFixed(1)},\n'
      : '';
  final String bottomAppBarElevationDark = controller
              .bottomAppBarElevationDark !=
          null
      ? '  bottomAppBarElevation: ${controller.bottomAppBarElevationDark!.toStringAsFixed(1)},\n'
      : '';
  final String tabBarStyle = controller.tabBarStyle == null ||
          (controller.tabBarStyle == FlexTabBarStyle.forAppBar &&
              !controller.useMaterial3) ||
          (controller.tabBarStyle == FlexTabBarStyle.flutterDefault &&
              controller.useMaterial3)
      ? ''
      : '  tabBarStyle: ${controller.tabBarStyle},\n';
  final String lightIsWhite = controller.lightIsWhite
      ? '  lightIsWhite: ${controller.lightIsWhite},\n'
      : '';
  final String darkIsTrueBlack = controller.darkIsTrueBlack
      ? '  darkIsTrueBlack: ${controller.darkIsTrueBlack},\n'
      : '';
  final String swapLegacyOnMaterial3 =
      controller.swapLegacyColors && controller.useMaterial3
          ? '  swapLegacyOnMaterial3: ${controller.swapLegacyColors},\n'
          : '';
  final String swapLightColors = controller.swapLightColors
      ? '  swapColors: ${controller.swapLightColors},\n'
      : '';
  final String swapDarkColors = controller.swapDarkColors
      ? '  swapColors: ${controller.swapDarkColors},\n'
      : '';
  final String tooltipsMatchBackground = controller.tooltipsMatchBackground &&
          controller.tooltipSchemeColor == null
      ? '  tooltipsMatchBackground: ${controller.tooltipsMatchBackground},\n'
      : '';
  final String useM3ErrorColors =
      controller.useM3ErrorColors && !controller.useKeyColors
          ? '  useMaterial3ErrorColors: ${controller.useM3ErrorColors},\n'
          : '';
  final String tintLightColor = controller.surfaceTintLight != null
      ? '  surfaceTint: const ${controller.surfaceTintLight},\n'
      : '';
  final String tintDarkColor = controller.surfaceTintDark != null
      ? '  surfaceTint: const ${controller.surfaceTintDark},\n'
      : '';
  // Do we apply Cupertino to all components?
  final String applyToAllCupertino = controller.applyThemeToAllCupertino
      ? '  cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),\n'
      : '';

  // Are we using Material3?
  final String useMaterial3 = controller.useMaterial3
      ? ''
      : '  useMaterial3: ${controller.useMaterial3},\n';
  //
  // Code for FlexSubThemesData setup.
  //
  final String interactionEffects = controller.interactionEffects
      ? '    interactionEffects: ${controller.interactionEffects},\n'
      : '';
  final String tintedDisabledControls = controller.tintedDisabledControls
      ? '    tintedDisabledControls: ${controller.tintedDisabledControls},\n'
      : '';
  final String blendOnLevelLight = controller.blendOnLevel > 0
      ? '    blendOnLevel: ${controller.blendOnLevel},\n'
      : '';
  final String blendOnLevelDark = controller.blendOnLevelDark > 0
      ? '    blendOnLevel: ${controller.blendOnLevelDark},\n'
      : '';
  final String blendLightOnColors = controller.blendLightOnColors
      ? '    blendOnColors: ${controller.blendLightOnColors},\n'
      : '';
  final String blendDarkOnColors = controller.blendDarkOnColors
      ? '    blendOnColors: ${controller.blendDarkOnColors},\n'
      : '';
  final String blendLightTextTheme = controller.blendLightTextTheme
      ? '    blendTextTheme: ${controller.blendLightTextTheme},\n'
      : '';
  final String blendDarkTextTheme = controller.blendDarkTextTheme
      ? '    blendTextTheme: ${controller.blendDarkTextTheme},\n'
      : '';
  final String useTextTheme = controller.useTextTheme == null
      ? ''
      : '    useTextTheme: ${controller.useTextTheme},\n';
  final String useM2StyleDividerInM3 =
      controller.useM2StyleDividerInM3 && controller.useMaterial3
          ? '    useM2StyleDividerInM3: ${controller.useM2StyleDividerInM3},\n'
          : '';

  final String scaffoldBackgroundLightSchemeColor = controller
              .scaffoldBackgroundLightSchemeColor !=
          null
      ? '    scaffoldBackgroundSchemeColor: ${controller.scaffoldBackgroundLightSchemeColor},\n'
      : '';
  final String scaffoldBackgroundDarkSchemeColor = controller
              .scaffoldBackgroundDarkSchemeColor !=
          null
      ? '    scaffoldBackgroundSchemeColor: ${controller.scaffoldBackgroundDarkSchemeColor},\n'
      : '';

  // Adaptive themes.
  final String adaptiveRemoveElevationTintLight = controller
                  .adaptiveRemoveElevationTintLight !=
              null &&
          controller.adaptiveRemoveElevationTintLight != AdaptiveTheme.off &&
          controller.useMaterial3
      ? '    adaptiveRemoveElevationTint: ${controller.adaptiveRemoveElevationTintLight!.code},\n'
      : '';
  final String adaptiveElevationShadowsBackLight = controller
                  .adaptiveElevationShadowsBackLight !=
              null &&
          controller.adaptiveElevationShadowsBackLight != AdaptiveTheme.off &&
          controller.useMaterial3
      ? '    adaptiveElevationShadowsBack: ${controller.adaptiveElevationShadowsBackLight!.code},\n'
      : '';
  final String adaptiveAppBarScrollUnderOffLight = controller
                  .adaptiveAppBarScrollUnderOffLight !=
              null &&
          controller.adaptiveAppBarScrollUnderOffLight != AdaptiveTheme.off &&
          controller.useMaterial3
      ? '    adaptiveAppBarScrollUnderOff: ${controller.adaptiveAppBarScrollUnderOffLight!.code},\n'
      : '';
  final String adaptiveRemoveElevationTintDark = controller
                  .adaptiveRemoveElevationTintDark !=
              null &&
          controller.adaptiveRemoveElevationTintDark != AdaptiveTheme.off &&
          controller.useMaterial3
      ? '    adaptiveRemoveElevationTint: ${controller.adaptiveRemoveElevationTintDark!.code},\n'
      : '';
  final String adaptiveElevationShadowsBackDark = controller
                  .adaptiveElevationShadowsBackDark !=
              null &&
          controller.adaptiveElevationShadowsBackDark != AdaptiveTheme.off &&
          controller.useMaterial3
      ? '    adaptiveElevationShadowsBack: ${controller.adaptiveElevationShadowsBackDark!.code},\n'
      : '';
  final String adaptiveAppBarScrollUnderOffDark = controller
                  .adaptiveAppBarScrollUnderOffDark !=
              null &&
          controller.adaptiveAppBarScrollUnderOffDark != AdaptiveTheme.off &&
          controller.useMaterial3
      ? '    adaptiveAppBarScrollUnderOff: ${controller.adaptiveAppBarScrollUnderOffDark!.code},\n'
      : '';

  // Splash type settings
  final String adaptiveSplash = controller.adaptiveSplash != null &&
          controller.adaptiveSplash != AdaptiveTheme.off
      ? '    adaptiveSplash: ${controller.adaptiveSplash!.code},\n'
      : '';
  final String splashType = controller.splashType != null
      ? '    splashType: ${controller.splashType!.code},\n'
      : '';
  final String splashTypeAdaptive = controller.splashTypeAdaptive != null
      ? '    splashTypeAdaptive: ${controller.splashTypeAdaptive!.code},\n'
      : '';

  // Default radius, its adaptive variant.
  final String defaultRadius = controller.defaultRadius != null
      ? '    defaultRadius: ${controller.defaultRadius!.toStringAsFixed(1)},\n'
      : '';
  final String adaptiveRadius = controller.adaptiveRadius != null &&
          controller.adaptiveRadius != AdaptiveTheme.off
      ? '    adaptiveRadius: ${controller.adaptiveRadius!.code},\n'
      : '';
  final String defaultRadiusAdaptive = controller.defaultRadiusAdaptive !=
              null &&
          controller.adaptiveRadius != null &&
          controller.adaptiveRadius != AdaptiveTheme.off
      ? '    defaultRadiusAdaptive: ${controller.defaultRadiusAdaptive!.toStringAsFixed(1)},\n'
      : '';
  // Shape border widths
  final String thinBorderWidth = controller.thinBorderWidth != null
      ? '    thinBorderWidth: ${controller.thinBorderWidth!.toStringAsFixed(1)},\n'
      : '';
  final String thickBorderWidth = controller.thickBorderWidth != null
      ? '    thickBorderWidth: ${controller.thickBorderWidth!.toStringAsFixed(1)},\n'
      : '';
  //
  // Material bottom sheet.
  final String bottomSheetRadius = controller.bottomSheetBorderRadius != null
      ? '    bottomSheetRadius: ${controller.bottomSheetBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String bottomSheetElevation = controller.bottomSheetElevation != null
      ? '    bottomSheetElevation: ${controller.bottomSheetElevation!.toStringAsFixed(1)},\n'
      : '';
  final String bottomSheetModalElevation = controller
              .bottomSheetModalElevation !=
          null
      ? '    bottomSheetModalElevation: ${controller.bottomSheetModalElevation!.toStringAsFixed(1)},\n'
      : '';
  final String bottomSheetBackgroundColor = controller.bottomSheetSchemeColor !=
          null
      ? '    bottomSheetBackgroundColor: ${controller.bottomSheetSchemeColor},\n'
      : '';
  final String bottomSheetModalBackgroundColor = controller
              .bottomSheetSchemeColor !=
          null
      ? '    bottomSheetModalBackgroundColor: ${controller.bottomSheetModalSchemeColor},\n'
      : '';
  //
  // Material button sub themes border radius setup CODE.
  //
  final String textButtonBorderRadius = controller.textButtonBorderRadius !=
          null
      ? '    textButtonRadius: ${controller.textButtonBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String filledButtonBorderRadius = controller.filledButtonBorderRadius !=
          null
      ? '    filledButtonRadius: ${controller.filledButtonBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String elevatedButtonBorderRadius = controller
              .elevatedButtonBorderRadius !=
          null
      ? '    elevatedButtonRadius: ${controller.elevatedButtonBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String outlinedButtonBorderRadius = controller
              .outlinedButtonBorderRadius !=
          null
      ? '    outlinedButtonRadius: ${controller.outlinedButtonBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  //
  // Material buttons sub themes setup CODE.
  //
  final String textButtonSchemeColor =
      controller.textButtonSchemeColor == SchemeColor.primary ||
              controller.textButtonSchemeColor == null
          ? ''
          : '    textButtonSchemeColor: ${controller.textButtonSchemeColor},\n';
  final String filledButtonSchemeColor = controller.filledButtonSchemeColor ==
              SchemeColor.primary ||
          controller.filledButtonSchemeColor == null
      ? ''
      : '    filledButtonSchemeColor: ${controller.filledButtonSchemeColor},\n';
  final String elevatedButtonSchemeColor = controller
                  .elevatedButtonSchemeColor ==
              SchemeColor.primary ||
          controller.elevatedButtonSchemeColor == null
      ? ''
      : '    elevatedButtonSchemeColor: ${controller.elevatedButtonSchemeColor},\n';
  final String elevatedButtonSecondarySchemeColor = controller
              .elevatedButtonSecondarySchemeColor ==
          null
      ? ''
      : '    elevatedButtonSecondarySchemeColor: ${controller.elevatedButtonSecondarySchemeColor},\n';
  final String outlinedButtonSchemeColor = controller
                  .outlinedButtonSchemeColor ==
              SchemeColor.primary ||
          controller.outlinedButtonSchemeColor == null
      ? ''
      : '    outlinedButtonSchemeColor: ${controller.outlinedButtonSchemeColor},\n';
  final String outlinedButtonOutlineSchemeColor = controller
              .outlinedButtonOutlineSchemeColor ==
          null
      ? ''
      : '    outlinedButtonOutlineSchemeColor: ${controller.outlinedButtonOutlineSchemeColor},\n';

  final String outlinedButtonBorderWidth = controller
              .outlinedButtonBorderWidth !=
          null
      ? '    outlinedButtonBorderWidth: ${controller.outlinedButtonBorderWidth!.toStringAsFixed(1)},\n'
      : '';
  final String outlinedButtonPressedBorderWidth = controller
              .outlinedButtonPressedBorderWidth !=
          null
      ? '    outlinedButtonPressedBorderWidth: ${controller.outlinedButtonPressedBorderWidth!.toStringAsFixed(1)},\n'
      : '';
  //
  // ToggleButtons sub themes setup CODE.
  //
  final String toggleButtonsSchemeColor = controller.toggleButtonsSchemeColor ==
          null
      ? ''
      : '    toggleButtonsSchemeColor: ${controller.toggleButtonsSchemeColor},\n';
  final String toggleButtonsUnselectedSchemeColor = controller
              .toggleButtonsUnselectedSchemeColor ==
          null
      ? ''
      : '    toggleButtonsUnselectedSchemeColor: ${controller.toggleButtonsUnselectedSchemeColor},\n';
  final String toggleButtonsBorderSchemeColor = controller
              .toggleButtonsBorderSchemeColor ==
          null
      ? ''
      : '    toggleButtonsBorderSchemeColor: ${controller.toggleButtonsBorderSchemeColor},\n';
  final String toggleButtonsBorderRadius = controller
              .toggleButtonsBorderRadius !=
          null
      ? '    toggleButtonsRadius: ${controller.toggleButtonsBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String toggleButtonsBorderWidth = controller.toggleButtonsBorderWidth !=
          null
      ? '    toggleButtonsBorderWidth: ${controller.toggleButtonsBorderWidth!.toStringAsFixed(1)},\n'
      : '';
  //
  // SegmentedButton sub themes setup CODE.
  //
  final String segmentedButtonSchemeColor = controller
              .segmentedButtonSchemeColor ==
          null
      ? ''
      : '    segmentedButtonSchemeColor: ${controller.segmentedButtonSchemeColor},\n';
  final String segmentedButtonUnselectedSchemeColor = controller
              .segmentedButtonUnselectedSchemeColor ==
          null
      ? ''
      : '    segmentedButtonUnselectedSchemeColor: ${controller.segmentedButtonUnselectedSchemeColor},\n';
  final String segmentedButtonUnselectedForegroundSchemeColor = controller
              .segmentedButtonUnselectedForegroundSchemeColor ==
          null
      ? ''
      : '    segmentedButtonUnselectedForegroundSchemeColor: ${controller.segmentedButtonUnselectedForegroundSchemeColor},\n';
  final String segmentedButtonBorderSchemeColor = controller
              .segmentedButtonBorderSchemeColor ==
          null
      ? ''
      : '    segmentedButtonBorderSchemeColor: ${controller.segmentedButtonBorderSchemeColor},\n';
  final String segmentedButtonBorderRadius = controller
              .segmentedButtonBorderRadius !=
          null
      ? '    segmentedButtonRadius: ${controller.segmentedButtonBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String segmentedButtonBorderWidth = controller
              .segmentedButtonBorderWidth !=
          null
      ? '    segmentedButtonBorderWidth: ${controller.segmentedButtonBorderWidth!.toStringAsFixed(1)},\n'
      : '';
  //
  // Switches, CheckBox and radio sub themes setup CODE.
  //
  final String switchSchemeColor = controller.switchSchemeColor == null
      ? ''
      : '    switchSchemeColor: ${controller.switchSchemeColor},\n';
  final String switchThumbSchemeColor = controller.switchThumbSchemeColor ==
          null
      ? ''
      : '    switchThumbSchemeColor: ${controller.switchThumbSchemeColor},\n';
  final String switchThumbFixedSize = controller.switchThumbFixedSize
      ? '    switchThumbFixedSize: ${controller.switchThumbFixedSize},\n'
      : '';

  final String switchAdaptiveCupertinoLike = controller
                  .switchAdaptiveCupertinoLike !=
              null &&
          controller.switchAdaptiveCupertinoLike != AdaptiveTheme.off &&
          controller.useMaterial3
      ? '    switchAdaptiveCupertinoLike: ${controller.switchAdaptiveCupertinoLike!.code},\n'
      : '';

  final String checkboxSchemeColor = controller.checkboxSchemeColor == null
      ? ''
      : '    checkboxSchemeColor: ${controller.checkboxSchemeColor},\n';
  final String radioSchemeColor = controller.radioSchemeColor == null
      ? ''
      : '    radioSchemeColor: ${controller.radioSchemeColor},\n';
  final String unselectedIsColored = controller.unselectedToggleIsColored
      ? '    unselectedToggleIsColored: ${controller.unselectedToggleIsColored},\n'
      : '';
  //
  // Slider sub themes setup CODE.
  //
  final String sliderBaseSchemeColor = controller.sliderBaseSchemeColor == null
      ? ''
      : '    sliderBaseSchemeColor: ${controller.sliderBaseSchemeColor},\n';
  final String sliderIndicatorSchemeColor = controller
              .sliderIndicatorSchemeColor ==
          null
      ? ''
      : '    sliderIndicatorSchemeColor: ${controller.sliderIndicatorSchemeColor},\n';
  final String sliderValueTinted = !controller.sliderValueTinted
      ? ''
      : '    sliderValueTinted: ${controller.sliderValueTinted},\n';
  final String sliderValueIndicatorType = controller.sliderValueIndicatorType ==
          null
      ? ''
      : '    sliderValueIndicatorType: ${controller.sliderValueIndicatorType},\n';
  final String sliderShowValueIndicator = controller.sliderShowValueIndicator ==
          null
      ? ''
      : '    sliderShowValueIndicator: ${controller.sliderShowValueIndicator},\n';
  final String sliderTrackHeight = controller.sliderTrackHeight == null
      ? ''
      : '    sliderTrackHeight: ${controller.sliderTrackHeight},\n';
  //
  // Input decorator setup CODE.
  //
  final String inputDecoratorSchemeColorLight = controller
              .inputDecoratorSchemeColorLight ==
          null
      ? ''
      : '    inputDecoratorSchemeColor: ${controller.inputDecoratorSchemeColorLight},\n';
  final String inputDecoratorSchemeColorDark = controller
              .inputDecoratorSchemeColorDark ==
          null
      ? ''
      : '    inputDecoratorSchemeColor: ${controller.inputDecoratorSchemeColorDark},\n';
  final String inputDecoratorBorderSchemeColorLight = controller
                  .inputDecoratorBorderSchemeColorLight ==
              null ||
          (!controller.inputDecoratorFocusedHasBorder &&
              (!controller.inputDecoratorUnfocusedHasBorder ||
                  !controller.inputDecoratorUnfocusedBorderIsColored))
      ? ''
      : '    inputDecoratorBorderSchemeColor: ${controller.inputDecoratorBorderSchemeColorLight},\n';
  final String inputDecoratorBorderSchemeColorDark = controller
                  .inputDecoratorBorderSchemeColorDark ==
              null ||
          (!controller.inputDecoratorFocusedHasBorder &&
              (!controller.inputDecoratorUnfocusedHasBorder ||
                  !controller.inputDecoratorUnfocusedBorderIsColored))
      ? ''
      : '    inputDecoratorBorderSchemeColor: ${controller.inputDecoratorBorderSchemeColorDark},\n';
  final String inputDecoratorIsFilled = controller.inputDecoratorIsFilled
      ? '    inputDecoratorIsFilled: ${controller.inputDecoratorIsFilled},\n'
      : '';

  final String inputDecoratorIsDense = controller.inputDecoratorIsDense
      ? '    inputDecoratorIsDense: ${controller.inputDecoratorIsDense},\n'
      : '';

  final String inputDecoratorContentPadding =
      controller.inputDecoratorPaddingStart != null ||
              controller.inputDecoratorPaddingEnd != null ||
              controller.inputDecoratorPaddingTop != null ||
              controller.inputDecoratorPaddingBottom != null
          ? '    inputDecoratorContentPadding: EdgeInsetsDirectional.fromSTEB('
              '${controller.inputDecoratorPaddingStart ?? 0}, '
              '${controller.inputDecoratorPaddingTop ?? 0}, '
              '${controller.inputDecoratorPaddingEnd ?? 0}, '
              '${controller.inputDecoratorPaddingBottom ?? 0}),\n'
          : '';

  final String inputDecoratorBackgroundAlphaLight = controller
              .inputDecoratorBackgroundAlphaLight ==
          null
      ? ''
      : '    inputDecoratorBackgroundAlpha: ${controller.inputDecoratorBackgroundAlphaLight},\n';
  final String inputDecoratorBackgroundAlphaDark = controller
              .inputDecoratorBackgroundAlphaDark ==
          null
      ? ''
      : '    inputDecoratorBackgroundAlpha: ${controller.inputDecoratorBackgroundAlphaDark},\n';
  final String inputDecoratorBorderType = controller.inputDecoratorBorderType ==
          FlexInputBorderType.outline
      ? '    inputDecoratorBorderType: ${controller.inputDecoratorBorderType},\n'
      : '';
  final String inputDecoratorBorderRadius = controller
              .inputDecoratorBorderRadius !=
          null
      ? '    inputDecoratorRadius: ${controller.inputDecoratorBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String inputDecoratorUnfocusedHasBorder = controller
          .inputDecoratorUnfocusedHasBorder
      ? ''
      : '    inputDecoratorUnfocusedHasBorder: ${controller.inputDecoratorUnfocusedHasBorder},\n';
  final String inputDecoratorFocusedHasBorder = controller
          .inputDecoratorFocusedHasBorder
      ? ''
      : '    inputDecoratorFocusedHasBorder: ${controller.inputDecoratorFocusedHasBorder},\n';
  final String inputDecoratorUnfocusedBorderIsColored = controller
              .inputDecoratorUnfocusedBorderIsColored &&
          controller.inputDecoratorUnfocusedHasBorder
      ? '    inputDecoratorUnfocusedBorderIsColored: ${controller.inputDecoratorUnfocusedBorderIsColored},\n'
      : '';
  final String inputDecoratorBorderWidth = controller
                  .inputDecoratorBorderWidth !=
              null &&
          controller.inputDecoratorUnfocusedHasBorder
      ? '    inputDecoratorBorderWidth: ${controller.inputDecoratorBorderWidth!.toStringAsFixed(1)},\n'
      : '';
  final String inputDecoratorFocusedBorderWidth = controller
                  .inputDecoratorFocusedBorderWidth !=
              null &&
          controller.inputDecoratorFocusedHasBorder
      ? '    inputDecoratorFocusedBorderWidth: ${controller.inputDecoratorFocusedBorderWidth!.toStringAsFixed(1)},\n'
      : '';
  final String inputDecoratorPrefixIconSchemeColor = controller
              .inputDecoratorPrefixIconSchemeColor ==
          null
      ? ''
      : '    inputDecoratorPrefixIconSchemeColor: ${controller.inputDecoratorPrefixIconSchemeColor},\n';
  final String inputDecoratorPrefixIconDarkSchemeColor = controller
              .inputDecoratorPrefixIconDarkSchemeColor ==
          null
      ? ''
      : '    inputDecoratorPrefixIconSchemeColor: ${controller.inputDecoratorPrefixIconDarkSchemeColor},\n';
  final String inputDecoratorSuffixIconSchemeColor = controller
              .inputDecoratorSuffixIconSchemeColor ==
          null
      ? ''
      : '    inputDecoratorSuffixIconSchemeColor: ${controller.inputDecoratorSuffixIconSchemeColor},\n';
  final String inputDecoratorSuffixIconDarkSchemeColor = controller
              .inputDecoratorSuffixIconDarkSchemeColor ==
          null
      ? ''
      : '    inputDecoratorSuffixIconSchemeColor: ${controller.inputDecoratorSuffixIconDarkSchemeColor},\n';
  //
  // Text selection setup CODE.
  //
  final String inputCursorLightSchemeColor = controller
              .inputCursorLightSchemeColor ==
          null
      ? ''
      : '    inputCursorSchemeColor: ${controller.inputCursorLightSchemeColor},\n';
  final String inputSelectionLightSchemeColor = controller
              .inputSelectionLightSchemeColor ==
          null
      ? ''
      : '    inputSelectionSchemeColor: ${controller.inputSelectionLightSchemeColor},\n';
  final String inputSelectionLightOpacity = controller
              .inputSelectionLightOpacity ==
          null
      ? ''
      : '    inputSelectionOpacity: ${controller.inputSelectionLightOpacity!.toStringAsFixed(2)},\n';
  final String inputSelectionHandleLightSchemeColor = controller
              .inputSelectionHandleLightSchemeColor ==
          null
      ? ''
      : '    inputSelectionHandleSchemeColor: ${controller.inputSelectionHandleLightSchemeColor},\n';
  //
  final String inputCursorDarkSchemeColor = controller
              .inputCursorDarkSchemeColor ==
          null
      ? ''
      : '    inputCursorSchemeColor: ${controller.inputCursorDarkSchemeColor},\n';
  final String inputSelectionDarkSchemeColor = controller
              .inputSelectionDarkSchemeColor ==
          null
      ? ''
      : '    inputSelectionSchemeColor: ${controller.inputSelectionDarkSchemeColor},\n';
  final String inputSelectionDarkOpacity = controller
              .inputSelectionDarkOpacity ==
          null
      ? ''
      : '    inputSelectionOpacity: ${controller.inputSelectionDarkOpacity!.toStringAsFixed(2)},\n';
  final String inputSelectionHandleDarkSchemeColor = controller
              .inputSelectionHandleDarkSchemeColor ==
          null
      ? ''
      : '    inputSelectionHandleSchemeColor: ${controller.inputSelectionHandleDarkSchemeColor},\n';

  //
  // Fab and chip, snack, card, and popup setup CODE
  //
  final String fabUseShape = controller.fabUseShape
      ? '    fabUseShape: ${controller.fabUseShape},\n'
      : '';
  final String fabAlwaysCircular =
      controller.fabUseShape && controller.fabAlwaysCircular
          ? '    fabAlwaysCircular: ${controller.fabAlwaysCircular},\n'
          : '';
  final String fabBorderRadius = controller.fabBorderRadius != null &&
          controller.fabUseShape &&
          !controller.fabAlwaysCircular
      ? '    fabRadius: ${controller.fabBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String fabSchemeColor = controller.fabSchemeColor != null
      ? '    fabSchemeColor: ${controller.fabSchemeColor},\n'
      : '';
  final String fabForegroundSchemeColor = controller.fabForegroundSchemeColor !=
          null
      ? '    fabForegroundSchemeColor: ${controller.fabForegroundSchemeColor},\n'
      : '';

  final String snackBarRadius = controller.snackBarBorderRadius != null
      ? '    snackBarRadius: ${controller.snackBarBorderRadius},\n'
      : '';
  final String snackBarElevation = controller.snackBarElevation != null
      ? '    snackBarElevation: ${controller.snackBarElevation},\n'
      : '';
  final String snackBarBackgroundSchemeColor = controller.snackBarSchemeColor !=
          null
      ? '    snackBarBackgroundSchemeColor: ${controller.snackBarSchemeColor},\n'
      : '';
  final String snackBarActionSchemeColor = controller
              .snackBarActionSchemeColor !=
          null
      ? '    snackBarActionSchemeColor: ${controller.snackBarActionSchemeColor},\n'
      : '';
  final String chipSchemeColor = controller.chipSchemeColor != null
      ? '    chipSchemeColor: ${controller.chipSchemeColor},\n'
      : '';
  final String chipSelectedSchemeColor = controller.chipSelectedSchemeColor !=
          null
      ? '    chipSelectedSchemeColor: ${controller.chipSelectedSchemeColor},\n'
      : '';
  final String chipDeleteIconSchemeColor = controller
              .chipDeleteIconSchemeColor !=
          null
      ? '    chipDeleteIconSchemeColor: ${controller.chipDeleteIconSchemeColor},\n'
      : '';
  final String chipBorderRadius = controller.chipBorderRadius != null
      ? '    chipRadius: ${controller.chipBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String cardBorderRadius = controller.cardBorderRadius != null
      ? '    cardRadius: ${controller.cardBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String popupMenuBorderRadius = controller.popupMenuBorderRadius != null
      ? '    popupMenuRadius: ${controller.popupMenuBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String popupMenuElevation = controller.popupMenuElevation != null
      ? '    popupMenuElevation: ${controller.popupMenuElevation!.toStringAsFixed(1)},\n'
      : '';
  final String popupMenuSchemeColor = controller.popupMenuSchemeColor != null
      ? '    popupMenuSchemeColor: ${controller.popupMenuSchemeColor},\n'
      : '';
  final String popupMenuOpacity = controller.popupMenuOpacity != 1 &&
          controller.popupMenuOpacity != null
      ? '    popupMenuOpacity: ${controller.popupMenuOpacity!.toStringAsFixed(2)},\n'
      : '';
  final String alignedDropdown = controller.alignedDropdown
      ? '    alignedDropdown: ${controller.alignedDropdown},\n'
      : '';
  //
  // Tooltip setup CODE
  //
  final String tooltipRadius = controller.tooltipRadius != null
      ? '    tooltipRadius: ${controller.tooltipRadius},\n'
      : '';
  final String tooltipWaitDuration = controller.tooltipWaitDuration != null
      ? '    tooltipWaitDuration: Duration(milliseconds: ${controller.tooltipWaitDuration}),\n'
      : '';
  final String tooltipShowDuration = controller.tooltipShowDuration != null
      ? '    tooltipShowDuration: Duration(milliseconds: ${controller.tooltipShowDuration}),\n'
      : '';
  final String tooltipSchemeColor = controller.tooltipSchemeColor != null
      ? '    tooltipSchemeColor: ${controller.tooltipSchemeColor},\n'
      : '';
  final String tooltipOpacity =
      controller.tooltipOpacity == 1.0 || controller.tooltipSchemeColor == null
          ? ''
          : '    tooltipOpacity: ${controller.tooltipOpacity},\n';
  //
  // Dialogs setup CODE
  //
  final String dialogBackgroundLightSchemeColor = controller
              .dialogBackgroundLightSchemeColor !=
          null
      ? '    dialogBackgroundSchemeColor: ${controller.dialogBackgroundLightSchemeColor},\n'
      : '';
  final String dialogBackgroundDarkSchemeColor = controller
              .dialogBackgroundDarkSchemeColor !=
          null
      ? '    dialogBackgroundSchemeColor: ${controller.dialogBackgroundDarkSchemeColor},\n'
      : '';
  final String useInputDecoratorThemeInDialogs = controller
          .useInputDecoratorThemeInDialogs
      ? '    useInputDecoratorThemeInDialogs: ${controller.useInputDecoratorThemeInDialogs},\n'
      : '';
  final String dialogBorderRadius = controller.dialogBorderRadius != null
      ? '    dialogRadius: ${controller.dialogBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String adaptiveDialogRadius = controller.adaptiveDialogRadius != null &&
          controller.adaptiveDialogRadius != AdaptiveTheme.off
      ? '    adaptiveDialogRadius: ${controller.adaptiveDialogRadius!.code},\n'
      : '';
  final String dialogRadiusAdaptive = controller.dialogBorderRadiusAdaptive !=
              null &&
          controller.adaptiveDialogRadius != null &&
          controller.adaptiveDialogRadius != AdaptiveTheme.off
      ? '    dialogRadiusAdaptive: ${controller.dialogBorderRadiusAdaptive!.toStringAsFixed(1)},\n'
      : '';
  final String datePickerHeaderBackgroundSchemeColor = controller
              .datePickerHeaderBackgroundSchemeColor !=
          null
      ? '    datePickerHeaderBackgroundSchemeColor: ${controller.datePickerHeaderBackgroundSchemeColor},\n'
      : '';
  final String datePickerDividerSchemeColor = controller
              .datePickerDividerSchemeColor !=
          null
      ? '    datePickerDividerSchemeColor: ${controller.datePickerDividerSchemeColor},\n'
      : '';
  final String datePickerDialogRadius = controller
              .datePickerDialogBorderRadius !=
          null
      ? '    datePickerDialogRadius: ${controller.datePickerDialogBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String timePickerDialogRadius = controller
              .timePickerDialogBorderRadius !=
          null
      ? '    timePickerDialogRadius: ${controller.timePickerDialogBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String timePickerElementRadius = controller.timePickerElementRadius !=
          null
      ? '    timePickerElementRadius: ${controller.timePickerElementRadius!.toStringAsFixed(1)},\n'
      : '';
  final String dialogElevation = controller.dialogElevation != null
      ? '    dialogElevation: ${controller.dialogElevation!.toStringAsFixed(1)},\n'
      : '';
  //
  // AppBar setup CODE
  //
  final String appBarBackgroundSchemeColorLight = controller
              .appBarBackgroundSchemeColorLight !=
          null
      ? '    appBarBackgroundSchemeColor: ${controller.appBarBackgroundSchemeColorLight},\n'
      : '';
  final String appBarBackgroundSchemeColorDark = controller
              .appBarBackgroundSchemeColorDark !=
          null
      ? '    appBarBackgroundSchemeColor: ${controller.appBarBackgroundSchemeColorDark},\n'
      : '';
  final String appBarForegroundSchemeColorLight = controller
              .appBarForegroundSchemeColorLight !=
          null
      ? '    appBarForegroundSchemeColor: ${controller.appBarForegroundSchemeColorLight},\n'
      : '';
  final String appBarForegroundSchemeColorDark = controller
              .appBarForegroundSchemeColorDark !=
          null
      ? '    appBarForegroundSchemeColor: ${controller.appBarForegroundSchemeColorDark},\n'
      : '';
  final String appBarScrolledUnderElevationLight = controller
              .appBarScrolledUnderElevationLight !=
          null
      ? '    appBarScrolledUnderElevation: ${controller.appBarScrolledUnderElevationLight!.toStringAsFixed(1)},\n'
      : '';
  final String appBarScrolledUnderElevationDark = controller
              .appBarScrolledUnderElevationDark !=
          null
      ? '    appBarScrolledUnderElevation: ${controller.appBarScrolledUnderElevationDark!.toStringAsFixed(1)},\n'
      : '';
  final String appBarCenterTitle = controller.appBarCenterTitle != null
      ? '    appBarCenterTitle: ${controller.appBarCenterTitle},\n'
      : '';
  //
  // BottomAppBar setup CODE
  //
  final String bottomAppBarSchemeColorLight = controller
              .bottomAppBarSchemeColorLight !=
          null
      ? '    bottomAppBarSchemeColor: ${controller.bottomAppBarSchemeColorLight},\n'
      : '';
  final String bottomAppBarSchemeColorDark = controller
              .bottomAppBarSchemeColorDark !=
          null
      ? '    bottomAppBarSchemeColor: ${controller.bottomAppBarSchemeColorDark},\n'
      : '';
  //
  // TabBar setup CODE
  //
  final String tabBarItemSchemeColorLight = controller
              .tabBarItemSchemeColorLight !=
          null
      ? '    tabBarItemSchemeColor: ${controller.tabBarItemSchemeColorLight},\n'
      : '';
  final String tabBarUnselectedItemSchemeColorLight = controller
                  .tabBarUnselectedItemSchemeColorLight !=
              null &&
          controller.tabBarItemSchemeColorLight != null
      ? '    tabBarUnselectedItemSchemeColor: ${controller.tabBarUnselectedItemSchemeColorLight},\n'
      : '';
  final String tabBarIndicatorSchemeColorLight = controller
              .tabBarIndicatorLight !=
          null
      ? '    tabBarIndicatorSchemeColor: ${controller.tabBarIndicatorLight},\n'
      : '';
  final String tabBarItemSchemeColorDark = controller
              .tabBarItemSchemeColorDark !=
          null
      ? '    tabBarItemSchemeColor: ${controller.tabBarItemSchemeColorDark},\n'
      : '';
  final String tabBarUnselectedItemSchemeColorDark = controller
                  .tabBarUnselectedItemSchemeColorDark !=
              null &&
          controller.tabBarItemSchemeColorDark != null
      ? '    tabBarUnselectedItemSchemeColor: ${controller.tabBarUnselectedItemSchemeColorDark},\n'
      : '';
  final String tabBarIndicatorSchemeColorDark = controller
              .tabBarIndicatorDark !=
          null
      ? '    tabBarIndicatorSchemeColor: ${controller.tabBarIndicatorDark},\n'
      : '';
  final String tabBarUnselectedItemOpacityLight = controller
              .tabBarUnselectedItemOpacityLight !=
          null
      ? '    tabBarUnselectedItemOpacity: ${controller.tabBarUnselectedItemOpacityLight!.toStringAsFixed(2)},\n'
      : '';
  final String tabBarUnselectedItemOpacityDark = controller
              .tabBarUnselectedItemOpacityDark !=
          null
      ? '    tabBarUnselectedItemOpacity: ${controller.tabBarUnselectedItemOpacityDark!.toStringAsFixed(2)},\n'
      : '';
  final String tabBarIndicatorSize = controller.tabBarIndicatorSize != null
      ? '    tabBarIndicatorSize: ${controller.tabBarIndicatorSize},\n'
      : '';
  final String tabBarIndicatorWeight = controller.tabBarIndicatorWeight != null
      ? '    tabBarIndicatorWeight: ${controller.tabBarIndicatorWeight},\n'
      : '';
  final String tabBarIndicatorTopRadius = controller.tabBarIndicatorTopRadius !=
          null
      ? '    tabBarIndicatorTopRadius: ${controller.tabBarIndicatorTopRadius},\n'
      : '';
  final String tabBarDividerColor = controller.tabBarDividerColor != null
      ? '    tabBarDividerColor: ${controller.tabBarDividerColor},\n'
      : '';
  final String tabBarTabAlignment = controller.tabBarTabAlignment != null
      ? '    tabBarTabAlignment: ${controller.tabBarTabAlignment},\n'
      : '';
  //
  // Drawers setup CODE
  //
  final String drawerBorderRadius = controller.drawerBorderRadius != null
      ? '    drawerRadius: ${controller.drawerBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String drawerElevation = controller.drawerElevation != null
      ? '    drawerElevation: ${controller.drawerElevation!.toStringAsFixed(1)},\n'
      : '';
  final String drawerBackgroundSchemeColor = controller
              .drawerBackgroundSchemeColor !=
          null
      ? '    drawerBackgroundSchemeColor: ${controller.drawerBackgroundSchemeColor},\n'
      : '';
  final String drawerWidth = controller.drawerWidth != null
      ? '    drawerWidth: ${controller.drawerWidth!.toStringAsFixed(1)},\n'
      : '';
  final String drawerIndicatorWidth = controller.drawerIndicatorWidth != null
      ? '    drawerIndicatorWidth: ${controller.drawerIndicatorWidth!.toStringAsFixed(1)},\n'
      : '';
  final String drawerIndicatorBorderRadius = controller
              .drawerIndicatorBorderRadius !=
          null
      ? '    drawerIndicatorRadius: ${controller.drawerIndicatorBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String drawerIndicatorSchemeColor = controller
              .drawerIndicatorSchemeColor !=
          null
      ? '    drawerIndicatorSchemeColor: ${controller.drawerIndicatorSchemeColor},\n'
      : '';
  final String drawerIndicatorOpacity = controller.drawerIndicatorOpacity !=
              null &&
          controller.drawerIndicatorOpacity != 1.0
      ? '    drawerIndicatorOpacity: ${controller.drawerIndicatorOpacity!.toStringAsFixed(1)},\n'
      : '';
  final String drawerSelectedItemSchemeColor = controller
              .drawerSelectedItemSchemeColor !=
          null
      ? '    drawerSelectedItemSchemeColor: ${controller.drawerSelectedItemSchemeColor},\n'
      : '';
  final String drawerUnselectedItemSchemeColor = controller
              .drawerUnselectedItemSchemeColor !=
          null
      ? '    drawerUnselectedItemSchemeColor: ${controller.drawerUnselectedItemSchemeColor},\n'
      : '';
  //
  // BottomNavigationBar setup CODE
  //
  final String bottomNavigationBarSelectedLabelSchemeColor = controller
              .bottomNavBarSelectedSchemeColor !=
          null
      ? '    bottomNavigationBarSelectedLabelSchemeColor: ${controller.bottomNavBarSelectedSchemeColor},\n'
      : '';
  final String bottomNavigationBarUnselectedLabelSchemeColor = controller
              .bottomNavBarUnselectedSchemeColor !=
          null
      ? '    bottomNavigationBarUnselectedLabelSchemeColor: ${controller.bottomNavBarUnselectedSchemeColor},\n'
      : '';
  final String bottomNavigationBarMutedUnselectedLabel = controller
          .bottomNavBarMuteUnselected
      ? ''
      : '    bottomNavigationBarMutedUnselectedLabel: ${controller.bottomNavBarMuteUnselected},\n';
  final String bottomNavigationBarSelectedIconSchemeColor = controller
              .bottomNavBarSelectedSchemeColor !=
          null
      ? '    bottomNavigationBarSelectedIconSchemeColor: ${controller.bottomNavBarSelectedSchemeColor},\n'
      : '';
  final String bottomNavigationBarUnselectedIconSchemeColor = controller
              .bottomNavBarUnselectedSchemeColor !=
          null
      ? '    bottomNavigationBarUnselectedIconSchemeColor: ${controller.bottomNavBarUnselectedSchemeColor},\n'
      : '';
  final String bottomNavigationBarMutedUnselectedIcon = controller
          .bottomNavBarMuteUnselected
      ? ''
      : '    bottomNavigationBarMutedUnselectedIcon: ${controller.bottomNavBarMuteUnselected},\n';
  final String bottomNavigationBarBackgroundSchemeColor = controller
              .bottomNavBarBackgroundSchemeColor !=
          null
      ? '    bottomNavigationBarBackgroundSchemeColor: ${controller.bottomNavBarBackgroundSchemeColor},\n'
      : '';
  final String bottomNavigationBarOpacity = controller
                  .bottomNavigationBarOpacity !=
              1 &&
          controller.bottomNavigationBarOpacity != null
      ? '    bottomNavigationBarOpacity: ${controller.bottomNavigationBarOpacity!.toStringAsFixed(2)},\n'
      : '';
  final String bottomNavigationBarElevation = controller
                  .bottomNavigationBarElevation !=
              null &&
          controller.bottomNavigationBarElevation != 0
      ? '    bottomNavigationBarElevation: ${controller.bottomNavigationBarElevation!.toStringAsFixed(1)},\n'
      : '';
  final String bottomNavigationBarShowSelectedLabels = controller
          .bottomNavShowSelectedLabels
      ? ''
      : '    bottomNavigationBarShowSelectedLabels: ${controller.bottomNavShowSelectedLabels},\n';
  final String bottomNavigationBarShowUnselectedLabels = controller
          .bottomNavShowUnselectedLabels
      ? ''
      : '    bottomNavigationBarShowUnselectedLabels: ${controller.bottomNavShowUnselectedLabels},\n';
  //
  // Menu and MenuBar setup CODE
  //
  final String menuRadius = controller.menuRadius != null
      ? '    menuRadius: ${controller.menuRadius!.toStringAsFixed(1)},\n'
      : '';
  final String menuElevation = controller.menuElevation != null
      ? '    menuElevation: ${controller.menuElevation!.toStringAsFixed(1)},\n'
      : '';
  final String menuSchemeColor = controller.menuSchemeColor != null
      ? '    menuSchemeColor: ${controller.menuSchemeColor},\n'
      : '';
  final String menuOpacity =
      controller.menuOpacity != null && controller.menuOpacity != 1
          ? '    menuOpacity: ${controller.menuOpacity!.toStringAsFixed(2)},\n'
          : '';
  final String menuPadding = controller.menuPaddingStart != null ||
          controller.menuPaddingEnd != null ||
          controller.menuPaddingTop != null ||
          controller.menuPaddingBottom != null
      ? '    menuPadding: EdgeInsetsDirectional.fromSTEB('
          '${controller.menuPaddingStart ?? 0}, '
          '${controller.menuPaddingTop ?? 0}, '
          '${controller.menuPaddingEnd ?? 0}, '
          '${controller.menuPaddingBottom ?? 0}),\n'
      : '';
  //
  final String menuBarBackgroundSchemeColor = controller
              .menuBarBackgroundSchemeColor !=
          null
      ? '    menuBarBackgroundSchemeColor: ${controller.menuBarBackgroundSchemeColor},\n'
      : '';
  final String menuBarRadius = controller.menuBarRadius != null
      ? '    menuBarRadius: ${controller.menuBarRadius!.toStringAsFixed(1)},\n'
      : '';
  final String menuBarElevation = controller.menuBarElevation != null
      ? '    menuBarElevation: ${controller.menuBarElevation!.toStringAsFixed(1)},\n'
      : '';
  final String menuBarShadowColor = controller.menuBarShadowColor != null
      ? '    menuBarShadowColor: ${controller.menuBarShadowColor},\n'
      : '';
  //
  final String menuItemBackgroundSchemeColor = controller
              .menuItemBackgroundSchemeColor !=
          null
      ? '    menuItemBackgroundSchemeColor: ${controller.menuItemBackgroundSchemeColor},\n'
      : '';
  final String menuItemForegroundSchemeColor = controller
              .menuItemForegroundSchemeColor !=
          null
      ? '    menuItemForegroundSchemeColor: ${controller.menuItemForegroundSchemeColor},\n'
      : '';
  final String menuIndicatorBackgroundSchemeColor = controller
              .menuIndicatorBackgroundSchemeColor !=
          null
      ? '    menuIndicatorBackgroundSchemeColor: ${controller.menuIndicatorBackgroundSchemeColor},\n'
      : '';
  final String menuIndicatorForegroundSchemeColor = controller
              .menuIndicatorForegroundSchemeColor !=
          null
      ? '    menuIndicatorForegroundSchemeColor: ${controller.menuIndicatorForegroundSchemeColor},\n'
      : '';
  final String menuIndicatorRadius = controller.menuIndicatorRadius != null
      ? '    menuIndicatorRadius: ${controller.menuIndicatorRadius!.toStringAsFixed(1)},\n'
      : '';
  //
  // NavigationBar setup CODE
  //
  final String navigationBarSelectedLabelSchemeColor = controller
              .navBarSelectedLabelSchemeColor !=
          null
      ? '    navigationBarSelectedLabelSchemeColor: ${controller.navBarSelectedLabelSchemeColor},\n'
      : '';
  final String navigationBarUnselectedLabelSchemeColor = controller
              .navBarUnselectedSchemeColor !=
          null
      ? '    navigationBarUnselectedLabelSchemeColor: ${controller.navBarUnselectedSchemeColor},\n'
      : '';
  final String navigationBarMutedUnselectedLabel = controller
          .navBarMuteUnselected
      ? '    navigationBarMutedUnselectedLabel: ${controller.navBarMuteUnselected},\n'
      : '';

  final String navigationBarSelectedIconSchemeColor = controller
              .navBarSelectedIconSchemeColor !=
          null
      ? '    navigationBarSelectedIconSchemeColor: ${controller.navBarSelectedIconSchemeColor},\n'
      : '';
  final String navigationBarUnselectedIconSchemeColor = controller
              .navBarUnselectedSchemeColor !=
          null
      ? '    navigationBarUnselectedIconSchemeColor: ${controller.navBarUnselectedSchemeColor},\n'
      : '';
  final String navigationBarMutedUnselectedIcon = controller
          .navBarMuteUnselected
      ? '    navigationBarMutedUnselectedIcon: ${controller.navBarMuteUnselected},\n'
      : '';

  final String navigationBarIndicatorSchemeColor = controller
              .navBarIndicatorSchemeColor !=
          null
      ? '    navigationBarIndicatorSchemeColor: ${controller.navBarIndicatorSchemeColor},\n'
      : '';
  final String navigationBarIndicatorOpacity = controller
                  .navBarIndicatorOpacity !=
              null &&
          controller.navBarIndicatorOpacity != 1.0
      ? '    navigationBarIndicatorOpacity: ${controller.navBarIndicatorOpacity!.toStringAsFixed(2)},\n'
      : '';
  final String navigationBarIndicatorRadius = controller
              .navBarIndicatorBorderRadius !=
          null
      ? '    navigationBarIndicatorRadius: ${controller.navBarIndicatorBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String navigationBarBackgroundSchemeColor = controller
              .navBarBackgroundSchemeColor !=
          null
      ? '    navigationBarBackgroundSchemeColor: ${controller.navBarBackgroundSchemeColor},\n'
      : '';
  final String navigationBarOpacity = controller.navBarOpacity != 1 &&
          controller.navBarOpacity != null
      ? '    navigationBarOpacity: ${controller.navBarOpacity!.toStringAsFixed(2)},\n'
      : '';
  final String navigationBarElevation = controller.navBarElevation != null
      ? '    navigationBarElevation: ${controller.navBarElevation!.toStringAsFixed(1)},\n'
      : '';
  final String navigationBarHeight = controller.navBarHeight != null
      ? '    navigationBarHeight: ${controller.navBarHeight!.toStringAsFixed(1)},\n'
      : '';
  final String navigationBarLabelBehavior = controller.navBarLabelBehavior !=
          NavigationDestinationLabelBehavior.alwaysShow
      ? '    navigationBarLabelBehavior: ${controller.navBarLabelBehavior},\n'
      : '';
  final String adaptiveRemoveNavigationBarTintLight = controller
                  .adaptiveRemoveNavigationBarTintLight !=
              null &&
          controller.adaptiveRemoveNavigationBarTintLight !=
              AdaptiveTheme.off &&
          controller.useMaterial3
      ? '    adaptiveRemoveNavigationBarTint: ${controller.adaptiveRemoveNavigationBarTintLight!.code},\n'
      : '';
  final String adaptiveRemoveNavigationBarTintDark = controller
                  .adaptiveRemoveNavigationBarTintDark !=
              null &&
          controller.adaptiveRemoveNavigationBarTintDark != AdaptiveTheme.off &&
          controller.useMaterial3
      ? '    adaptiveRemoveNavigationBarTint: ${controller.adaptiveRemoveNavigationBarTintDark!.code},\n'
      : '';
  //
  // NavigationRail setup CODE
  //
  final String navigationRailSelectedLabelSchemeColor = controller
              .navRailSelectedLabelSchemeColor !=
          null
      ? '    navigationRailSelectedLabelSchemeColor: ${controller.navRailSelectedLabelSchemeColor},\n'
      : '';
  final String navigationRailUnselectedLabelSchemeColor = controller
              .navRailUnselectedSchemeColor !=
          null
      ? '    navigationRailUnselectedLabelSchemeColor: ${controller.navRailUnselectedSchemeColor},\n'
      : '';
  final String navigationRailMutedUnselectedLabel = controller
          .navRailMuteUnselected
      ? '    navigationRailMutedUnselectedLabel: ${controller.navRailMuteUnselected},\n'
      : '';
  final String navigationRailSelectedIconSchemeColor = controller
              .navRailSelectedIconSchemeColor !=
          null
      ? '    navigationRailSelectedIconSchemeColor: ${controller.navRailSelectedIconSchemeColor},\n'
      : '';
  final String navigationRailUnselectedIconSchemeColor = controller
              .navRailUnselectedSchemeColor !=
          null
      ? '    navigationRailUnselectedIconSchemeColor: ${controller.navRailUnselectedSchemeColor},\n'
      : '';
  final String navigationRailMutedUnselectedIcon = controller
          .navRailMuteUnselected
      ? '    navigationRailMutedUnselectedIcon: ${controller.navRailMuteUnselected},\n'
      : '';
  final String navigationRailUseIndicator = controller.navRailUseIndicator
      ? ''
      : '    navigationRailUseIndicator: ${controller.navRailUseIndicator},\n';
  final String navigationRailIndicatorSchemeColor = controller
                  .navRailIndicatorSchemeColor !=
              null &&
          controller.navRailUseIndicator
      ? '    navigationRailIndicatorSchemeColor: ${controller.navRailIndicatorSchemeColor},\n'
      : '';
  final String navigationRailIndicatorOpacity = controller
                  .navRailIndicatorOpacity !=
              null &&
          !(controller.navRailIndicatorSchemeColor == null &&
              controller.navRailUseIndicator)
      ? '    navigationRailIndicatorOpacity: ${controller.navRailIndicatorOpacity!.toStringAsFixed(2)},\n'
      : '';
  final String navigationRailIndicatorRadius = controller
              .navRailIndicatorBorderRadius !=
          null
      ? '    navigationRailIndicatorRadius: ${controller.navRailIndicatorBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String navigationRailBackgroundSchemeColor = controller
              .navRailBackgroundSchemeColor !=
          null
      ? '    navigationRailBackgroundSchemeColor: ${controller.navRailBackgroundSchemeColor},\n'
      : '';
  final String navigationRailOpacity = controller.navRailOpacity != 1 &&
          controller.navRailOpacity != null
      ? '    navigationRailOpacity: ${controller.navRailOpacity!.toStringAsFixed(2)},\n'
      : '';
  final String navigationRailElevation = controller.navRailElevation != null &&
          controller.navRailElevation != 0
      ? '    navigationRailElevation: ${controller.navRailElevation!.toStringAsFixed(1)},\n'
      : '';
  final String navigationRailLabelType =
      controller.navRailLabelType != NavigationRailLabelType.none
          ? '    navigationRailLabelType: ${controller.navRailLabelType},\n'
          : '';
  //
  // Compose the sub themes from above fragments.
  // Order attempts to be in same order as they appear in the large
  // FlexSubThemesData class.
  String lightSubTheme = controller.useSubThemes
      ? '  subThemesData: const FlexSubThemesData(\n'
          '$interactionEffects'
          '$tintedDisabledControls'
          '$blendOnLevelLight'
          '$blendLightOnColors'
          '$scaffoldBackgroundLightSchemeColor'
          //
          '$blendLightTextTheme'
          '$useTextTheme'
          '$useM2StyleDividerInM3'
          //
          '$thinBorderWidth'
          '$thickBorderWidth'
          //
          '$adaptiveSplash'
          '$splashType'
          '$splashTypeAdaptive'
          //
          '$adaptiveRemoveElevationTintLight'
          '$adaptiveElevationShadowsBackLight'
          '$adaptiveAppBarScrollUnderOffLight'
          //
          '$defaultRadius'
          '$adaptiveRadius'
          '$defaultRadiusAdaptive'
          //
          '$textButtonBorderRadius'
          '$textButtonSchemeColor'
          //
          '$filledButtonBorderRadius'
          '$filledButtonSchemeColor'
          //
          '$elevatedButtonBorderRadius'
          '$elevatedButtonSchemeColor'
          '$elevatedButtonSecondarySchemeColor'
          //
          '$outlinedButtonBorderRadius'
          '$outlinedButtonSchemeColor'
          '$outlinedButtonOutlineSchemeColor'
          '$outlinedButtonBorderWidth'
          '$outlinedButtonPressedBorderWidth'
          //
          '$toggleButtonsBorderRadius'
          '$toggleButtonsSchemeColor'
          '$toggleButtonsUnselectedSchemeColor'
          '$toggleButtonsBorderSchemeColor'
          '$toggleButtonsBorderWidth'
          //
          '$segmentedButtonBorderRadius'
          '$segmentedButtonSchemeColor'
          '$segmentedButtonUnselectedSchemeColor'
          '$segmentedButtonUnselectedForegroundSchemeColor'
          '$segmentedButtonBorderSchemeColor'
          '$segmentedButtonBorderWidth'
          //
          '$switchSchemeColor'
          '$switchThumbSchemeColor'
          '$switchThumbFixedSize'
          '$switchAdaptiveCupertinoLike'
          //
          '$checkboxSchemeColor'
          '$radioSchemeColor'
          '$unselectedIsColored'
          //
          '$sliderBaseSchemeColor'
          '$sliderIndicatorSchemeColor'
          '$sliderValueTinted'
          '$sliderValueIndicatorType'
          '$sliderShowValueIndicator'
          '$sliderTrackHeight'
          //
          '$inputDecoratorSchemeColorLight'
          '$inputDecoratorIsFilled'
          '$inputDecoratorIsDense'
          '$inputDecoratorContentPadding'
          '$inputDecoratorBackgroundAlphaLight'
          '$inputDecoratorBorderSchemeColorLight'
          '$inputDecoratorBorderType'
          '$inputDecoratorBorderRadius'
          '$inputDecoratorUnfocusedHasBorder'
          '$inputDecoratorUnfocusedBorderIsColored'
          '$inputDecoratorBorderWidth'
          '$inputDecoratorFocusedHasBorder'
          '$inputDecoratorFocusedBorderWidth'
          '$inputDecoratorPrefixIconSchemeColor'
          '$inputDecoratorSuffixIconSchemeColor'
          //
          '$inputCursorLightSchemeColor'
          '$inputSelectionLightSchemeColor'
          '$inputSelectionLightOpacity'
          '$inputSelectionHandleLightSchemeColor'
          //
          '$fabUseShape'
          '$fabAlwaysCircular'
          '$fabBorderRadius'
          '$fabSchemeColor'
          '$fabForegroundSchemeColor'
          //
          '$chipSchemeColor'
          '$chipSelectedSchemeColor'
          '$chipDeleteIconSchemeColor'
          '$chipBorderRadius'
          //
          '$cardBorderRadius'
          //
          '$popupMenuBorderRadius'
          '$popupMenuElevation'
          '$popupMenuSchemeColor'
          '$popupMenuOpacity'
          '$alignedDropdown'
          //
          '$tooltipRadius'
          '$tooltipWaitDuration'
          '$tooltipShowDuration'
          '$tooltipSchemeColor'
          '$tooltipOpacity'
          //
          '$dialogBackgroundLightSchemeColor'
          '$dialogElevation'
          '$dialogBorderRadius'
          '$adaptiveDialogRadius'
          '$dialogRadiusAdaptive'
          '$useInputDecoratorThemeInDialogs'
          //
          '$timePickerDialogRadius'
          '$timePickerElementRadius'
          //
          '$datePickerDialogRadius'
          '$datePickerHeaderBackgroundSchemeColor'
          '$datePickerDividerSchemeColor'
          //
          '$snackBarRadius'
          '$snackBarElevation'
          '$snackBarBackgroundSchemeColor'
          '$snackBarActionSchemeColor'
          //
          '$appBarBackgroundSchemeColorLight'
          '$appBarForegroundSchemeColorLight'
          '$appBarScrolledUnderElevationLight'
          '$appBarCenterTitle'
          //
          '$bottomAppBarSchemeColorLight'
          //
          '$tabBarItemSchemeColorLight'
          '$tabBarUnselectedItemSchemeColorLight'
          '$tabBarUnselectedItemOpacityLight'
          '$tabBarIndicatorSchemeColorLight'
          '$tabBarIndicatorSize'
          '$tabBarIndicatorWeight'
          '$tabBarIndicatorTopRadius'
          '$tabBarDividerColor'
          '$tabBarTabAlignment'
          //
          '$drawerBorderRadius'
          '$drawerElevation'
          '$drawerBackgroundSchemeColor'
          '$drawerWidth'
          '$drawerIndicatorWidth'
          '$drawerIndicatorBorderRadius'
          '$drawerIndicatorSchemeColor'
          '$drawerIndicatorOpacity'
          '$drawerSelectedItemSchemeColor'
          '$drawerUnselectedItemSchemeColor'
          //
          '$bottomSheetBackgroundColor'
          '$bottomSheetModalBackgroundColor'
          '$bottomSheetRadius'
          '$bottomSheetElevation'
          '$bottomSheetModalElevation'
          //
          '$bottomNavigationBarSelectedLabelSchemeColor'
          '$bottomNavigationBarUnselectedLabelSchemeColor'
          '$bottomNavigationBarMutedUnselectedLabel'
          '$bottomNavigationBarSelectedIconSchemeColor'
          '$bottomNavigationBarUnselectedIconSchemeColor'
          '$bottomNavigationBarMutedUnselectedIcon'
          '$bottomNavigationBarBackgroundSchemeColor'
          '$bottomNavigationBarOpacity'
          '$bottomNavigationBarElevation'
          '$bottomNavigationBarShowSelectedLabels'
          '$bottomNavigationBarShowUnselectedLabels'
          //
          '$menuRadius'
          '$menuElevation'
          '$menuSchemeColor'
          '$menuOpacity'
          '$menuPadding'
          //
          '$menuBarBackgroundSchemeColor'
          '$menuBarRadius'
          '$menuBarElevation'
          '$menuBarShadowColor'
          //
          '$menuItemBackgroundSchemeColor'
          '$menuItemForegroundSchemeColor'
          '$menuIndicatorBackgroundSchemeColor'
          '$menuIndicatorForegroundSchemeColor'
          '$menuIndicatorRadius'
          //
          '$navigationBarSelectedLabelSchemeColor'
          '$navigationBarUnselectedLabelSchemeColor'
          '$navigationBarMutedUnselectedLabel'
          '$navigationBarSelectedIconSchemeColor'
          '$navigationBarUnselectedIconSchemeColor'
          '$navigationBarMutedUnselectedIcon'
          '$navigationBarIndicatorSchemeColor'
          '$navigationBarIndicatorOpacity'
          '$navigationBarIndicatorRadius'
          '$navigationBarBackgroundSchemeColor'
          '$navigationBarOpacity'
          '$navigationBarElevation'
          '$navigationBarHeight'
          '$navigationBarLabelBehavior'
          '$adaptiveRemoveNavigationBarTintLight'
          //
          '$navigationRailSelectedLabelSchemeColor'
          '$navigationRailUnselectedLabelSchemeColor'
          '$navigationRailMutedUnselectedLabel'
          '$navigationRailSelectedIconSchemeColor'
          '$navigationRailUnselectedIconSchemeColor'
          '$navigationRailMutedUnselectedIcon'
          '$navigationRailUseIndicator'
          '$navigationRailIndicatorSchemeColor'
          '$navigationRailIndicatorOpacity'
          '$navigationRailIndicatorRadius'
          '$navigationRailBackgroundSchemeColor'
          '$navigationRailOpacity'
          '$navigationRailElevation'
          '$navigationRailLabelType'
          //
          '  ),\n'
      : '';
  String darkSubTheme = controller.useSubThemes
      ? '  subThemesData: const FlexSubThemesData(\n'
          '$interactionEffects'
          '$tintedDisabledControls'
          '$blendOnLevelDark'
          '$blendDarkOnColors'
          '$scaffoldBackgroundDarkSchemeColor'
          //
          '$blendDarkTextTheme'
          '$useTextTheme'
          '$useM2StyleDividerInM3'
          //
          '$adaptiveSplash'
          '$splashType'
          '$splashTypeAdaptive'
          //
          '$adaptiveRemoveElevationTintDark'
          '$adaptiveElevationShadowsBackDark'
          '$adaptiveAppBarScrollUnderOffDark'
          //
          '$defaultRadius'
          '$adaptiveRadius'
          '$defaultRadiusAdaptive'
          //
          '$thinBorderWidth'
          '$thickBorderWidth'
          //
          '$textButtonBorderRadius'
          '$textButtonSchemeColor'
          //
          '$filledButtonBorderRadius'
          '$filledButtonSchemeColor'
          //
          '$elevatedButtonBorderRadius'
          '$elevatedButtonSchemeColor'
          '$elevatedButtonSecondarySchemeColor'
          //
          '$outlinedButtonBorderRadius'
          '$outlinedButtonSchemeColor'
          '$outlinedButtonOutlineSchemeColor'
          '$outlinedButtonBorderWidth'
          '$outlinedButtonPressedBorderWidth'
          //
          '$toggleButtonsBorderRadius'
          '$toggleButtonsSchemeColor'
          '$toggleButtonsUnselectedSchemeColor'
          '$toggleButtonsBorderSchemeColor'
          '$toggleButtonsBorderWidth'
          //
          '$segmentedButtonBorderRadius'
          '$segmentedButtonSchemeColor'
          '$segmentedButtonUnselectedSchemeColor'
          '$segmentedButtonUnselectedForegroundSchemeColor'
          '$segmentedButtonBorderSchemeColor'
          '$segmentedButtonBorderWidth'
          //
          '$switchSchemeColor'
          '$switchThumbSchemeColor'
          '$switchThumbFixedSize'
          '$switchAdaptiveCupertinoLike'
          //
          '$checkboxSchemeColor'
          '$radioSchemeColor'
          '$unselectedIsColored'
          //
          '$sliderBaseSchemeColor'
          '$sliderIndicatorSchemeColor'
          '$sliderValueTinted'
          '$sliderValueIndicatorType'
          '$sliderShowValueIndicator'
          '$sliderTrackHeight'
          //
          '$inputDecoratorSchemeColorDark'
          '$inputDecoratorIsFilled'
          '$inputDecoratorIsDense'
          '$inputDecoratorContentPadding'
          '$inputDecoratorBackgroundAlphaDark'
          '$inputDecoratorBorderSchemeColorDark'
          '$inputDecoratorBorderType'
          '$inputDecoratorBorderRadius'
          '$inputDecoratorUnfocusedHasBorder'
          '$inputDecoratorUnfocusedBorderIsColored'
          '$inputDecoratorBorderWidth'
          '$inputDecoratorFocusedHasBorder'
          '$inputDecoratorFocusedBorderWidth'
          '$inputDecoratorPrefixIconDarkSchemeColor'
          '$inputDecoratorSuffixIconDarkSchemeColor'
          //
          '$inputCursorDarkSchemeColor'
          '$inputSelectionDarkSchemeColor'
          '$inputSelectionDarkOpacity'
          '$inputSelectionHandleDarkSchemeColor'
          //
          '$fabUseShape'
          '$fabAlwaysCircular'
          '$fabBorderRadius'
          '$fabSchemeColor'
          '$fabForegroundSchemeColor'
          //
          '$chipSchemeColor'
          '$chipSelectedSchemeColor'
          '$chipDeleteIconSchemeColor'
          '$chipBorderRadius'
          //
          '$cardBorderRadius'
          //
          '$popupMenuBorderRadius'
          '$popupMenuElevation'
          '$popupMenuSchemeColor'
          '$popupMenuOpacity'
          '$alignedDropdown'
          //
          '$tooltipRadius'
          '$tooltipWaitDuration'
          '$tooltipShowDuration'
          '$tooltipSchemeColor'
          '$tooltipOpacity'
          //
          '$dialogBackgroundDarkSchemeColor'
          '$dialogElevation'
          '$dialogBorderRadius'
          '$adaptiveDialogRadius'
          '$dialogRadiusAdaptive'
          '$useInputDecoratorThemeInDialogs'
          //
          '$timePickerDialogRadius'
          '$timePickerElementRadius'
          //
          '$datePickerDialogRadius'
          '$datePickerHeaderBackgroundSchemeColor'
          '$datePickerDividerSchemeColor'
          //
          '$snackBarRadius'
          '$snackBarElevation'
          '$snackBarBackgroundSchemeColor'
          '$snackBarActionSchemeColor'
          //
          '$appBarBackgroundSchemeColorDark'
          '$appBarForegroundSchemeColorDark'
          '$appBarScrolledUnderElevationDark'
          '$appBarCenterTitle'
          //
          '$bottomAppBarSchemeColorDark'
          //
          '$tabBarItemSchemeColorDark'
          '$tabBarUnselectedItemSchemeColorDark'
          '$tabBarUnselectedItemOpacityDark'
          '$tabBarIndicatorSchemeColorDark'
          '$tabBarIndicatorSize'
          '$tabBarIndicatorWeight'
          '$tabBarIndicatorTopRadius'
          '$tabBarDividerColor'
          '$tabBarTabAlignment'
          //
          '$drawerBorderRadius'
          '$drawerElevation'
          '$drawerBackgroundSchemeColor'
          '$drawerWidth'
          '$drawerIndicatorWidth'
          '$drawerIndicatorBorderRadius'
          '$drawerIndicatorSchemeColor'
          '$drawerIndicatorOpacity'
          '$drawerSelectedItemSchemeColor'
          '$drawerUnselectedItemSchemeColor'
          //
          '$bottomSheetBackgroundColor'
          '$bottomSheetModalBackgroundColor'
          '$bottomSheetRadius'
          '$bottomSheetElevation'
          '$bottomSheetModalElevation'
          //
          '$bottomNavigationBarSelectedLabelSchemeColor'
          '$bottomNavigationBarUnselectedLabelSchemeColor'
          '$bottomNavigationBarMutedUnselectedLabel'
          '$bottomNavigationBarSelectedIconSchemeColor'
          '$bottomNavigationBarUnselectedIconSchemeColor'
          '$bottomNavigationBarMutedUnselectedIcon'
          '$bottomNavigationBarBackgroundSchemeColor'
          '$bottomNavigationBarOpacity'
          '$bottomNavigationBarElevation'
          '$bottomNavigationBarShowSelectedLabels'
          '$bottomNavigationBarShowUnselectedLabels'
          //
          '$menuRadius'
          '$menuElevation'
          '$menuSchemeColor'
          '$menuOpacity'
          '$menuPadding'
          //
          '$menuBarBackgroundSchemeColor'
          '$menuBarRadius'
          '$menuBarElevation'
          '$menuBarShadowColor'
          //
          '$menuItemBackgroundSchemeColor'
          '$menuItemForegroundSchemeColor'
          '$menuIndicatorBackgroundSchemeColor'
          '$menuIndicatorForegroundSchemeColor'
          '$menuIndicatorRadius'
          //
          '$navigationBarSelectedLabelSchemeColor'
          '$navigationBarUnselectedLabelSchemeColor'
          '$navigationBarMutedUnselectedLabel'
          '$navigationBarSelectedIconSchemeColor'
          '$navigationBarUnselectedIconSchemeColor'
          '$navigationBarMutedUnselectedIcon'
          '$navigationBarIndicatorSchemeColor'
          '$navigationBarIndicatorOpacity'
          '$navigationBarIndicatorRadius'
          '$navigationBarBackgroundSchemeColor'
          '$navigationBarOpacity'
          '$navigationBarElevation'
          '$navigationBarHeight'
          '$navigationBarLabelBehavior'
          '$adaptiveRemoveNavigationBarTintDark'
          //
          '$navigationRailSelectedLabelSchemeColor'
          '$navigationRailUnselectedLabelSchemeColor'
          '$navigationRailMutedUnselectedLabel'
          '$navigationRailSelectedIconSchemeColor'
          '$navigationRailUnselectedIconSchemeColor'
          '$navigationRailMutedUnselectedIcon'
          '$navigationRailUseIndicator'
          '$navigationRailIndicatorSchemeColor'
          '$navigationRailIndicatorOpacity'
          '$navigationRailIndicatorRadius'
          '$navigationRailBackgroundSchemeColor'
          '$navigationRailOpacity'
          '$navigationRailElevation'
          '$navigationRailLabelType'
          '  ),\n'
      : '';
  // Make a prettier version of the constructor if we have default one.
  if (lightSubTheme == '  subThemesData: const FlexSubThemesData(\n  ),\n') {
    lightSubTheme = '  subThemesData: const FlexSubThemesData(),\n';
  }
  if (darkSubTheme == '  subThemesData: const FlexSubThemesData(\n  ),\n') {
    darkSubTheme = '  subThemesData: const FlexSubThemesData(),\n';
  }
  //
  // Define code for key color usage and tones.
  final String useSecondary = controller.useSecondary
      ? '    useSecondary: ${controller.useSecondary},\n'
      : '';
  final String useTertiary = controller.useTertiary
      ? '    useTertiary: ${controller.useTertiary},\n'
      : '';
  final String useError =
      controller.useError ? '    useError: ${controller.useError},\n' : '';
  final String keepPrimary = controller.keepPrimary
      ? '    keepPrimary: ${controller.keepPrimary},\n'
      : '';
  final String keepSecondary = controller.keepSecondary
      ? '    keepSecondary: ${controller.keepSecondary},\n'
      : '';
  final String keepTertiary = controller.keepTertiary
      ? '    keepTertiary: ${controller.keepTertiary},\n'
      : '';
  final String keepError =
      controller.keepError ? '    keepError: ${controller.keepError},\n' : '';
  final String keepPrimaryContainer = controller.keepPrimaryContainer
      ? '    keepPrimaryContainer: ${controller.keepPrimaryContainer},\n'
      : '';
  final String keepSecondaryContainer = controller.keepSecondaryContainer
      ? '    keepSecondaryContainer: ${controller.keepSecondaryContainer},\n'
      : '';
  final String keepTertiaryContainer = controller.keepTertiaryContainer
      ? '    keepTertiaryContainer: ${controller.keepTertiaryContainer},\n'
      : '';
  final String keepErrorContainer = controller.keepErrorContainer
      ? '    keepErrorContainer: ${controller.keepErrorContainer},\n'
      : '';
  final String keepDarkPrimary = controller.keepDarkPrimary
      ? '    keepPrimary: ${controller.keepDarkPrimary},\n'
      : '';
  final String keepDarkSecondary = controller.keepDarkSecondary
      ? '    keepSecondary: ${controller.keepDarkSecondary},\n'
      : '';
  final String keepDarkTertiary = controller.keepDarkTertiary
      ? '    keepTertiary: ${controller.keepDarkTertiary},\n'
      : '';
  final String keepDarkError = controller.keepDarkError
      ? '    keepError: ${controller.keepDarkError},\n'
      : '';
  final String keepDarkPrimaryContainer = controller.keepDarkPrimaryContainer
      ? '    keepPrimaryContainer: ${controller.keepDarkPrimaryContainer},\n'
      : '';
  final String keepDarkSecondaryContainer = controller
          .keepDarkSecondaryContainer
      ? '    keepSecondaryContainer: ${controller.keepDarkSecondaryContainer},\n'
      : '';
  final String keepDarkTertiaryContainer = controller.keepDarkTertiaryContainer
      ? '    keepTertiaryContainer: ${controller.keepDarkTertiaryContainer},\n'
      : '';
  final String keepDarkErrorContainer = controller.keepDarkErrorContainer
      ? '    keepErrorContainer: ${controller.keepDarkErrorContainer},\n'
      : '';

  final String contrastLevel = controller.dynamicContrastLevel != 0 &&
          FlexSchemeVariant.values[controller.usedFlexToneSetup].isFlutterScheme
      ? '    contrastLevel: ${controller.dynamicContrastLevel},\n'
      : '';

  String useKeyColorsLight = controller.useKeyColors
      ? '  keyColors: const FlexKeyColors(\n'
          '$useSecondary'
          '$useTertiary'
          '$useError'
          '$keepPrimary'
          '$keepSecondary'
          '$keepTertiary'
          '$keepError'
          '$keepPrimaryContainer'
          '$keepSecondaryContainer'
          '$keepTertiaryContainer'
          '$keepErrorContainer'
          '$contrastLevel'
          '  ),\n'
      : '';
  String useKeyColorsDark = controller.useKeyColors
      ? '  keyColors: const FlexKeyColors(\n'
          '$useSecondary'
          '$useTertiary'
          '$useError'
          '$keepDarkPrimary'
          '$keepDarkSecondary'
          '$keepDarkTertiary'
          '$keepDarkError'
          '$keepDarkPrimaryContainer'
          '$keepDarkSecondaryContainer'
          '$keepDarkTertiaryContainer'
          '$keepDarkErrorContainer'
          '$contrastLevel'
          '  ),\n'
      : '';
  // Make a prettier version of the constructor if that is all we got.
  if (useKeyColorsLight == '  keyColors: const FlexKeyColors(\n  ),\n') {
    useKeyColorsLight = '  keyColors: const FlexKeyColors(),\n';
  }
  if (useKeyColorsDark == '  keyColors: const FlexKeyColors(\n  ),\n') {
    useKeyColorsDark = '  keyColors: const FlexKeyColors(),\n';
  }
  //
  // Codegen for Flex Tones and Variants.
  //
  String flexTonesLight = '';
  String flexTonesDark = '';
  if (controller.useKeyColors) {
    final String variantType =
        FlexSchemeVariant.values[controller.usedFlexToneSetup].isFlutterScheme
            ? '  variant: '
            : '  tones: ';
    final String variantTypeTonesLight =
        FlexSchemeVariant.values[controller.usedFlexToneSetup].isFlutterScheme
            ? ''
            : '.tones(Brightness.light)';
    final String variantTypeTonesDark =
        FlexSchemeVariant.values[controller.usedFlexToneSetup].isFlutterScheme
            ? ''
            : '.tones(Brightness.dark)';

    if (controller.usedFlexToneSetup > 0) {
      flexTonesLight = '${variantType}FlexSchemeVariant.'
          '${FlexSchemeVariant.values[controller.usedFlexToneSetup].name}'
          '$variantTypeTonesLight';
      flexTonesDark = '${variantType}FlexSchemeVariant.'
          '${FlexSchemeVariant.values[controller.usedFlexToneSetup].name}'
          '$variantTypeTonesDark';
    }

    final String monochromeSurfacesLight =
        controller.useMonoSurfacesLight ? '\n    .monochromeSurfaces()' : '';
    final String onMainsUseBWLight =
        controller.onMainsUseBWLight ? '\n    .onMainsUseBW()' : '';
    final String onSurfacesUseBWLight =
        controller.onSurfacesUseBWLight ? '\n    .onSurfacesUseBW()' : '';
    final String surfacesUseBWLight =
        controller.surfacesUseBWLight ? '\n    .surfacesUseBW()' : '';

    final String monochromeSurfacesDark =
        controller.useMonoSurfacesDark ? '\n    .monochromeSurfaces()' : '';
    final String onMainsUseBWDark =
        controller.onMainsUseBWDark ? '\n    .onMainsUseBW()' : '';
    final String onSurfacesUseBWDark =
        controller.onSurfacesUseBWDark ? '\n    .onSurfacesUseBW()' : '';
    final String surfacesUseBWDark =
        controller.surfacesUseBWDark ? '\n    .surfacesUseBW()' : '';

    if (!FlexSchemeVariant
        .values[controller.usedFlexToneSetup].isFlutterScheme) {
      flexTonesLight =
          '$flexTonesLight$monochromeSurfacesLight$onMainsUseBWLight$onSurfacesUseBWLight'
          '$surfacesUseBWLight';
      flexTonesDark =
          '$flexTonesDark$monochromeSurfacesDark$onMainsUseBWDark$onSurfacesUseBWDark'
          '$surfacesUseBWDark';
      if (controller.useMonoSurfacesLight ||
          controller.onMainsUseBWLight ||
          controller.onSurfacesUseBWLight ||
          controller.surfacesUseBWLight) {
        flexTonesLight = '$flexTonesLight,';
      }
      if (controller.useMonoSurfacesDark ||
          controller.onMainsUseBWDark ||
          controller.onSurfacesUseBWDark ||
          controller.surfacesUseBWDark) {
        flexTonesDark = '$flexTonesDark,';
      }
    }
    if (flexTonesLight != '') flexTonesLight = '$flexTonesLight\n';
    if (flexTonesDark != '') flexTonesDark = '$flexTonesDark\n';
  }

  //
  // Compose the final FlexThemeData code string, from all above fragments.
  //
  final String code = '// Theme setup for FlexColorScheme package v'
      '${App.versionMajor}.\n'
      '// Use same major flex_color_scheme package version. If you use a lower minor\n'
      '// version, some properties may not be supported. In that case, remove them\n'
      '// after copying this theme to your app or upgrade package to '
      'version ${App.version}.\n'
      'theme: FlexThemeData.light(\n'
      '$lightScheme'
      '$usedColors'
      '$fixedColorStyle'
      '$surfaceModeLight'
      '$blendLevel'
      '$appBarStyleLight'
      '$appBarOpacityLight'
      '$transparentStatusBar'
      '$appBarElevationLight'
      '$bottomAppBarElevationLight'
      '$tabBarStyle'
      '$lightIsWhite'
      '$swapLightColors'
      '$tintLightColor'
      '$tooltipsMatchBackground'
      '$lightSubTheme'
      '$useKeyColorsLight'
      '$useM3ErrorColors'
      '$flexTonesLight'
      '$visualDensity'
      '$applyToAllCupertino'
      '$useMaterial3'
      '$swapLegacyOnMaterial3'
      '),\n'
      'darkTheme: FlexThemeData.dark(\n'
      '$darkScheme'
      '$usedColors'
      '$fixedColorStyle'
      '$surfaceModeDark'
      '$blendLevelDark'
      '$appBarStyleDark'
      '$appBarOpacityDark'
      '$transparentStatusBar'
      '$appBarElevationDark'
      '$bottomAppBarElevationDark'
      '$tabBarStyle'
      '$darkIsTrueBlack'
      '$swapDarkColors'
      '$tintDarkColor'
      '$tooltipsMatchBackground'
      '$darkSubTheme'
      '$useKeyColorsDark'
      '$useM3ErrorColors'
      '$flexTonesDark'
      '$visualDensity'
      '$applyToAllCupertino'
      '$useMaterial3'
      '$swapLegacyOnMaterial3'
      '),\n'
      '// Uncomment to use device mode or add your own theme mode toggle.\n'
      '// themeMode: ThemeMode.system,\n';
  return code;
}
