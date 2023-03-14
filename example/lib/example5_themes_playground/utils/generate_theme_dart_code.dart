// ignore_for_file: lines_longer_than_80_chars
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../shared/const/adaptive_theme.dart';
import '../../shared/const/app.dart';
import '../../shared/const/app_color.dart';
import '../../shared/controllers/theme_controller.dart';

/// A function that returns the FlexColorScheme Dart and Flutter setup
/// code for the theme held by ThemeController.
///
/// The properties are typically in the order they are in the classes.
String generateThemeDartCode(ThemeController controller) {
  // Are we using Typography 2021 or 2018?
  String usedTypography = controller.useTextTheme
      ? '  typography: Typography.material2021(platform: defaultTargetPlatform),'
      : '  typography: Typography.material2018(platform: defaultTargetPlatform),';

  // If FlexColorsScheme is not in use, return a default M3/M2 ColorScheme based
  // theme as a starting point suggestion.
  if (!controller.useFlexColorScheme) {
    if (controller.useMaterial3) {
      usedTypography = '\n  $usedTypography';
      // M3 mode defaults to 2021 style, no need to specify it.
      if (controller.useTextTheme && controller.useMaterial3) {
        usedTypography = '';
      }
      return '''
  // FlexColorScheme is not in use!
  // Here is a default Material 3 starting point theme setup for you.
  //
  theme: ThemeData(    
    useMaterial3: true,$usedTypography 
  ),
  darkTheme: ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,$usedTypography    
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
  // Typography code segment usage and style fix.
  usedTypography = '$usedTypography\n';
  // M3 mode defaults to 2021 style, no need to specify it when using M3.
  if (controller.useTextTheme && controller.useMaterial3) {
    usedTypography = '';
  }
  // M2 mode defaults to 2018 style, no need to specify it when using M2.
  if (!controller.useTextTheme && !controller.useMaterial3) {
    usedTypography = '';
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
  final String appBarOpacityLight = controller.appBarOpacityLight != 1
      ? '  appBarOpacity: ${controller.appBarOpacityLight.toStringAsFixed(2)},\n'
      : '';
  final String appBarOpacityDark = controller.appBarOpacityDark != 1
      ? '  appBarOpacity: ${controller.appBarOpacityDark.toStringAsFixed(2)},\n'
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
  // Are we using Material3?
  final String useMaterial3 = controller.useMaterial3
      ? '  useMaterial3: ${controller.useMaterial3},\n'
      : '';
  //
  // Code for FlexSubThemesData setup.
  //
  final String interactionEffects = controller.interactionEffects
      ? ''
      : '    interactionEffects: ${controller.interactionEffects},\n';
  final String tintedDisabledControls = controller.tintedDisabledControls
      ? ''
      : '    tintedDisabledControls: ${controller.tintedDisabledControls},\n';
  final String blendOnLevelLight =
      controller.blendOnLevel > 0 && !controller.useKeyColors
          ? '    blendOnLevel: ${controller.blendOnLevel},\n'
          : '';
  final String blendOnLevelDark =
      controller.blendOnLevelDark > 0 && !controller.useKeyColors
          ? '    blendOnLevel: ${controller.blendOnLevelDark},\n'
          : '';
  final String blendLightOnColors =
      controller.blendLightOnColors || controller.useKeyColors
          ? ''
          : '    blendOnColors: ${controller.blendLightOnColors},\n';
  final String blendDarkOnColors =
      controller.blendDarkOnColors || controller.useKeyColors
          ? ''
          : '    blendOnColors: ${controller.blendDarkOnColors},\n';
  final String blendLightTextTheme = controller.blendLightTextTheme
      ? '    blendTextTheme: ${controller.blendLightTextTheme},\n'
      : '';
  final String blendDarkTextTheme = controller.blendDarkTextTheme
      ? '    blendTextTheme: ${controller.blendDarkTextTheme},\n'
      : '';
  final String useTextTheme = controller.useTextTheme
      ? ''
      : '    useTextTheme: ${controller.useTextTheme},\n';
  final String useM2StyleDividerInM3 =
      controller.useM2StyleDividerInM3 && controller.useMaterial3
          ? '    useM2StyleDividerInM3: ${controller.useM2StyleDividerInM3},\n'
          : '';
  final String useFlutterDefaults = controller.useFlutterDefaults
      ? '    useFlutterDefaults: ${controller.useFlutterDefaults},\n'
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

  // Default radius, it adaptive variant and border widths.
  final String defaultRadius = controller.defaultRadius != null
      ? '    defaultRadius: ${controller.defaultRadius!.toStringAsFixed(1)},\n'
      : '';
  final String defaultRadiusAdaptive = controller.defaultRadiusAdaptive !=
              null &&
          controller.adaptiveRadius != null &&
          controller.adaptiveRadius != AdaptiveTheme.off
      ? '    defaultRadiusAdaptive: ${controller.defaultRadiusAdaptive!.toStringAsFixed(1)},\n'
      : '';
  final String adaptiveRadius = controller.adaptiveRadius != null &&
          controller.adaptiveRadius != AdaptiveTheme.off
      ? '    adaptiveRadius: ${controller.adaptiveRadius!.code},\n'
      : '';
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
  final String sliderValueTinted = controller.sliderValueTinted == false
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
      ? ''
      : '    inputDecoratorIsFilled: ${controller.inputDecoratorIsFilled},\n';
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
      ? ''
      : '    inputDecoratorBorderType: ${controller.inputDecoratorBorderType},\n';
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
              .inputDecoratorUnfocusedBorderIsColored ||
          !controller.inputDecoratorUnfocusedHasBorder
      ? ''
      : '    inputDecoratorUnfocusedBorderIsColored: ${controller.inputDecoratorUnfocusedBorderIsColored},\n';
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
  final String fabSchemeColor =
      controller.fabSchemeColor == SchemeColor.secondary ||
              controller.fabSchemeColor == null
          ? ''
          : '    fabSchemeColor: ${controller.fabSchemeColor},\n';
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
  final String popupMenuOpacity = controller.popupMenuOpacity != 1
      ? '    popupMenuOpacity: ${controller.popupMenuOpacity.toStringAsFixed(2)},\n'
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
  final String dialogBackgroundSchemeColor = controller
              .dialogBackgroundSchemeColor !=
          null
      ? '    dialogBackgroundSchemeColor: ${controller.dialogBackgroundSchemeColor},\n'
      : '';
  final String dialogBorderRadius = controller.dialogBorderRadius != null
      ? '    dialogRadius: ${controller.dialogBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String timePickerDialogRadius = controller.dialogBorderRadius != null
      ? '    timePickerDialogRadius: ${controller.dialogBorderRadius!.toStringAsFixed(1)},\n'
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
  //
  // BottomAppBar setup CODE
  //
  final String bottomAppBarSchemeColor = controller.bottomAppBarSchemeColor !=
          null
      ? '    bottomAppBarSchemeColor: ${controller.bottomAppBarSchemeColor},\n'
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
              .bottomNavBarMuteUnselected ||
          (controller.useFlutterDefaults &&
              controller.bottomNavBarSelectedSchemeColor == null &&
              controller.bottomNavBarUnselectedSchemeColor == null)
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
              .bottomNavBarMuteUnselected ||
          (controller.useFlutterDefaults &&
              controller.bottomNavBarSelectedSchemeColor == null &&
              controller.bottomNavBarUnselectedSchemeColor == null)
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
          !(controller.bottomNavBarBackgroundSchemeColor == null &&
              controller.useFlutterDefaults)
      ? '    bottomNavigationBarOpacity: ${controller.bottomNavigationBarOpacity.toStringAsFixed(2)},\n'
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
      ? ''
      : '    navigationBarMutedUnselectedLabel: ${controller.navBarMuteUnselected},\n';
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
      ? ''
      : '    navigationBarMutedUnselectedIcon: ${controller.navBarMuteUnselected},\n';
  final String navigationBarIndicatorSchemeColor = controller
              .navBarIndicatorSchemeColor !=
          null
      ? '    navigationBarIndicatorSchemeColor: ${controller.navBarIndicatorSchemeColor},\n'
      : '';
  final String navigationBarIndicatorOpacity = controller
                  .navBarIndicatorOpacity !=
              null &&
          !(controller.navBarIndicatorSchemeColor == null &&
              controller.useFlutterDefaults)
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
          !(controller.navBarBackgroundSchemeColor == null &&
              controller.useFlutterDefaults)
      ? '    navigationBarOpacity: ${controller.navBarOpacity.toStringAsFixed(2)},\n'
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
              .navRailMuteUnselected ||
          (controller.useFlutterDefaults &&
              controller.navRailSelectedIconSchemeColor == null &&
              controller.navRailUnselectedSchemeColor == null)
      ? ''
      : '    navigationRailMutedUnselectedLabel: ${controller.navRailMuteUnselected},\n';
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
              .navRailMuteUnselected ||
          (controller.useFlutterDefaults &&
              controller.navRailSelectedIconSchemeColor == null &&
              controller.navRailUnselectedSchemeColor == null)
      ? ''
      : '    navigationRailMutedUnselectedIcon: ${controller.navRailMuteUnselected},\n';
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
              controller.navRailUseIndicator &&
              controller.useFlutterDefaults)
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
          !(controller.navRailBackgroundSchemeColor == null &&
              controller.useFlutterDefaults)
      ? '    navigationRailOpacity: ${controller.navRailOpacity.toStringAsFixed(2)},\n'
      : '';
  final String navigationRailElevation = controller.navRailElevation != null &&
          controller.navRailElevation != 0
      ? '    navigationRailElevation: ${controller.navRailElevation!.toStringAsFixed(1)},\n'
      : '';
  final String navigationRailLabelType =
      controller.navRailLabelType != NavigationRailLabelType.all
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
          '$useFlutterDefaults'
          //
          '$blendLightTextTheme'
          '$useTextTheme'
          '$useM2StyleDividerInM3'
          //
          '$thinBorderWidth'
          '$thickBorderWidth'
          //
          '$adaptiveRemoveElevationTintLight'
          '$adaptiveElevationShadowsBackLight'
          '$adaptiveAppBarScrollUnderOffLight'
          //
          '$defaultRadius'
          '$defaultRadiusAdaptive'
          '$adaptiveRadius'
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
          //
          '$fabUseShape'
          '$fabAlwaysCircular'
          '$fabBorderRadius'
          '$fabSchemeColor'
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
          //
          '$tooltipRadius'
          '$tooltipWaitDuration'
          '$tooltipShowDuration'
          '$tooltipSchemeColor'
          '$tooltipOpacity'
          //
          '$dialogBackgroundSchemeColor'
          '$dialogBorderRadius'
          '$timePickerDialogRadius'
          '$timePickerElementRadius'
          '$dialogElevation'
          //
          '$snackBarRadius'
          '$snackBarElevation'
          '$snackBarBackgroundSchemeColor'
          '$snackBarActionSchemeColor'
          //
          '$appBarBackgroundSchemeColorLight'
          '$appBarScrolledUnderElevationLight'
          //
          '$bottomAppBarSchemeColor'
          //
          '$tabBarItemSchemeColorLight'
          '$tabBarUnselectedItemSchemeColorLight'
          '$tabBarUnselectedItemOpacityLight'
          '$tabBarIndicatorSchemeColorLight'
          '$tabBarIndicatorSize'
          '$tabBarIndicatorWeight'
          '$tabBarIndicatorTopRadius'
          '$tabBarDividerColor'
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
          '$useFlutterDefaults'
          //
          '$blendDarkTextTheme'
          '$useTextTheme'
          '$useM2StyleDividerInM3'
          //
          '$adaptiveRemoveElevationTintDark'
          '$adaptiveElevationShadowsBackDark'
          '$adaptiveAppBarScrollUnderOffDark'
          //
          '$defaultRadius'
          '$defaultRadiusAdaptive'
          '$adaptiveRadius'
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
          //
          '$fabUseShape'
          '$fabAlwaysCircular'
          '$fabBorderRadius'
          '$fabSchemeColor'
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
          //
          '$tooltipRadius'
          '$tooltipWaitDuration'
          '$tooltipShowDuration'
          '$tooltipSchemeColor'
          '$tooltipOpacity'
          //
          '$dialogBackgroundSchemeColor'
          '$dialogBorderRadius'
          '$timePickerDialogRadius'
          '$timePickerElementRadius'
          '$dialogElevation'
          //
          '$snackBarRadius'
          '$snackBarElevation'
          '$snackBarBackgroundSchemeColor'
          '$snackBarActionSchemeColor'
          //
          '$appBarBackgroundSchemeColorDark'
          '$appBarScrolledUnderElevationDark'
          //
          '$bottomAppBarSchemeColor'
          //
          '$tabBarItemSchemeColorDark'
          '$tabBarUnselectedItemSchemeColorDark'
          '$tabBarUnselectedItemOpacityDark'
          '$tabBarIndicatorSchemeColorDark'
          '$tabBarIndicatorSize'
          '$tabBarIndicatorWeight'
          '$tabBarIndicatorTopRadius'
          '$tabBarDividerColor'
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
  final String keepPrimary = controller.keepPrimary
      ? '    keepPrimary: ${controller.keepPrimary},\n'
      : '';
  final String keepSecondary = controller.keepSecondary
      ? '    keepSecondary: ${controller.keepSecondary},\n'
      : '';
  final String keepTertiary = controller.keepTertiary
      ? '    keepTertiary: ${controller.keepTertiary},\n'
      : '';
  final String keepPrimaryContainer = controller.keepPrimaryContainer
      ? '    keepPrimaryContainer: ${controller.keepPrimaryContainer},\n'
      : '';
  final String keepSecondaryContainer = controller.keepSecondaryContainer
      ? '    keepSecondaryContainer: ${controller.keepSecondaryContainer},\n'
      : '';
  final String keepTertiaryContainer = controller.keepTertiaryContainer
      ? '    keepTertiaryContainer: ${controller.keepTertiaryContainer},\n'
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

  String useKeyColorsLight = controller.useKeyColors
      ? '  keyColors: const FlexKeyColors(\n'
          '$useSecondary'
          '$useTertiary'
          '$keepPrimary'
          '$keepSecondary'
          '$keepTertiary'
          '$keepPrimaryContainer'
          '$keepSecondaryContainer'
          '$keepTertiaryContainer'
          '  ),\n'
      : '';
  String useKeyColorsDark = controller.useKeyColors
      ? '  keyColors: const FlexKeyColors(\n'
          '$useSecondary'
          '$useTertiary'
          '$keepDarkPrimary'
          '$keepDarkSecondary'
          '$keepDarkTertiary'
          '$keepDarkPrimaryContainer'
          '$keepDarkSecondaryContainer'
          '$keepDarkTertiaryContainer'
          '  ),\n'
      : '';
  // Make a prettier version of the constructor if that is all we got.
  if (useKeyColorsLight == '  keyColors: const FlexKeyColors(\n  ),\n') {
    useKeyColorsLight = '  keyColors: const FlexKeyColors(),\n';
  }
  if (useKeyColorsDark == '  keyColors: const FlexKeyColors(\n  ),\n') {
    useKeyColorsDark = '  keyColors: const FlexKeyColors(),\n';
  }
  String flexTonesLight = '';
  String flexTonesDark = '';
  if (controller.useKeyColors) {
    if (controller.usedFlexToneSetup == 1 &&
        (controller.onMainsUseBWLight || controller.onSurfacesUseBWLight)) {
      flexTonesLight = '  tones: FlexTones.material(Brightness.light)';
    }
    if (controller.usedFlexToneSetup == 1 &&
        (controller.onMainsUseBWDark || controller.onSurfacesUseBWDark)) {
      flexTonesDark = '  tones: FlexTones.material(Brightness.dark)';
    }
    if (controller.usedFlexToneSetup == 2) {
      flexTonesLight = '  tones: FlexTones.soft(Brightness.light)';
      flexTonesDark = '  tones: FlexTones.soft(Brightness.dark)';
    }
    if (controller.usedFlexToneSetup == 3) {
      flexTonesLight = '  tones: FlexTones.vivid(Brightness.light)';
      flexTonesDark = '  tones: FlexTones.vivid(Brightness.dark)';
    }
    if (controller.usedFlexToneSetup == 4) {
      flexTonesLight = '  tones: FlexTones.vividSurfaces(Brightness.light)';
      flexTonesDark = '  tones: FlexTones.vividSurfaces(Brightness.dark)';
    }
    if (controller.usedFlexToneSetup == 5) {
      flexTonesLight = '  tones: FlexTones.highContrast(Brightness.light)';
      flexTonesDark = '  tones: FlexTones.highContrast(Brightness.dark)';
    }
    if (controller.usedFlexToneSetup == 6) {
      flexTonesLight = '  tones: FlexTones.ultraContrast(Brightness.light)';
      flexTonesDark = '  tones: FlexTones.ultraContrast(Brightness.dark)';
    }
    if (controller.usedFlexToneSetup == 7) {
      flexTonesLight = '  tones: FlexTones.jolly(Brightness.light)';
      flexTonesDark = '  tones: FlexTones.jolly(Brightness.dark)';
    }
    if (controller.usedFlexToneSetup == 8) {
      flexTonesLight = '  tones: FlexTones.vividBackground(Brightness.light)';
      flexTonesDark = '  tones: FlexTones.vividBackground(Brightness.dark)';
    }
    if (controller.usedFlexToneSetup == 9) {
      flexTonesLight = '  tones: FlexTones.oneHue(Brightness.light)';
      flexTonesDark = '  tones: FlexTones.oneHue(Brightness.dark)';
    }
    final String onMainsUseBWLight =
        controller.onMainsUseBWLight ? '.onMainsUseBW()' : '';
    final String onSurfacesUseBWLight =
        controller.onSurfacesUseBWLight ? '.onSurfacesUseBW()' : '';
    final String onMainsUseBWDark =
        controller.onMainsUseBWDark ? '.onMainsUseBW()' : '';
    final String onSurfacesUseBWDark =
        controller.onSurfacesUseBWDark ? '.onSurfacesUseBW()' : '';
    flexTonesLight = '$flexTonesLight$onMainsUseBWLight$onSurfacesUseBWLight';
    flexTonesDark = '$flexTonesDark$onMainsUseBWDark$onSurfacesUseBWDark';
    if (controller.onMainsUseBWLight ||
        controller.onSurfacesUseBWLight ||
        controller.usedFlexToneSetup != 1) {
      flexTonesLight = '$flexTonesLight,\n';
    }
    if (controller.onMainsUseBWDark ||
        controller.onSurfacesUseBWDark ||
        controller.usedFlexToneSetup != 1) {
      flexTonesDark = '$flexTonesDark,\n';
    }
  }

  //
  // Compose the final FlexThemeData code string, from all above fragments.
  //
  final String code = '// Made for FlexColorScheme version '
      '${App.packageVersion}. Make sure you\n'
      '// use same or higher package version, but still same major version.\n'
      '// If you use a lower version, some properties may not be supported.\n'
      '// In that case remove them after copying this theme to your app.\n'
      'theme: FlexThemeData.light(\n'
      '$lightScheme'
      '$usedColors'
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
      '  visualDensity: FlexColorScheme.comfortablePlatformDensity,\n'
      '$usedTypography'
      '$useMaterial3'
      '$swapLegacyOnMaterial3'
      '  // To use the playground font, add GoogleFonts package and uncomment\n'
      '  // fontFamily: GoogleFonts.notoSans().fontFamily,\n'
      '),\n'
      'darkTheme: FlexThemeData.dark(\n'
      '$darkScheme'
      '$usedColors'
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
      '  visualDensity: FlexColorScheme.comfortablePlatformDensity,\n'
      '$usedTypography'
      '$useMaterial3'
      '$swapLegacyOnMaterial3'
      '  // To use the Playground font, add GoogleFonts package and uncomment\n'
      '  // fontFamily: GoogleFonts.notoSans().fontFamily,\n'
      '),\n'
      '// If you do not have a themeMode switch, uncomment this line\n'
      '// to let the device system mode control the theme mode:\n'
      '// themeMode: ThemeMode.system,\n';
  return code;
}
