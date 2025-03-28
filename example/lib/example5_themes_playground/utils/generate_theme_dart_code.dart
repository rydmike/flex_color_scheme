// ignore_for_file: lines_longer_than_80_chars
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../shared/const/app.dart';
import '../../shared/const/app_color.dart';
import '../../shared/controllers/theme_controller.dart';
import '../../shared/model/adaptive_response.dart';
import '../../shared/utils/color_string.dart';
import '../theme/theme_values.dart';

/// A function that returns the FlexColorScheme Dart and Flutter setup
/// code for the theme held by ThemeController.
///
/// The properties are typically in the order they are in the classes.
String generateThemeDartCode(ThemeController controller) {
  // If FlexColorsScheme is not in use, return a default M3/M2 ColorScheme based
  // theme as a starting point suggestion.
  if (!controller.useFlexColorScheme) {
    if (controller.useMaterial3) {
      return '''
  // FlexColorScheme is not in use!
  // Here is a default Material-3 starting point theme setup.
  theme: ThemeData(),
  darkTheme: ThemeData(
    brightness: Brightness.dark,
  ),
  themeMode: ThemeMode.system,''';
    } else {
      return '''
  // FlexColorScheme is not in use!
  // Here is a default Material-2 starting point theme setup.
  theme: ThemeData(
    useMaterial3: false,
    colorScheme: const ColorScheme.light(),
    Typography.material2018(platform: defaultTargetPlatform),
  ),
  darkTheme: ThemeData(
    useMaterial3: false,
    colorScheme: const ColorScheme.dark(),
    applyElevationOverlayColor: true,
    Typography.material2018(platform: defaultTargetPlatform),
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
  // Use the use customizable scheme.
  final bool useCustom = controller.schemeIndex == AppColor.schemes.length - 1;
  // Use one of the Playground FlexSchemeColor API examples.
  final bool useMyScheme1 = controller.schemeIndex == 0;
  final bool useMyScheme2 = controller.schemeIndex == 1;
  final bool useMyScheme3 = controller.schemeIndex == 2;

  // Define the light scheme.
  String lightScheme = '';
  if (useBuiltIn) {
    lightScheme =
        '    // Using FlexColorScheme built-in FlexScheme enum based colors\n'
        '    scheme: ${FlexScheme.values[flexScheme]},\n';
  }
  if (useMyScheme1) {
    lightScheme =
        '    // Playground built-in scheme made with FlexSchemeColor() API.\n'
        '    colors: const FlexSchemeColor(\n'
        '      primary: ${scheme.light.primary.toColorString()},\n'
        '      primaryContainer: ${scheme.light.primaryContainer.toColorString()},\n'
        '      secondary: ${scheme.light.secondary.toColorString()},\n'
        '      secondaryContainer: ${scheme.light.secondaryContainer.toColorString()},\n'
        '      tertiary: ${scheme.light.tertiary.toColorString()},\n'
        '      tertiaryContainer: ${scheme.light.tertiaryContainer.toColorString()},\n'
        '      appBarColor: ${scheme.light.appBarColor.toColorString()},\n'
        '      swapOnMaterial3: true,\n'
        '    ),\n';
  }
  if (useMyScheme2) {
    lightScheme =
        '    // Playground built-in scheme made with FlexSchemeColor.from() API.\n'
        '    colors: FlexSchemeColor.from(\n'
        '      primary: const ${scheme.light.primary.toColorString()},\n'
        '      brightness: Brightness.light,\n'
        '      swapOnMaterial3: true,\n'
        '    ),\n';
  }
  if (useMyScheme3) {
    lightScheme =
        '    // Playground built-in scheme made with FlexSchemeColor.from() API.\n'
        '    colors: FlexSchemeColor.from(\n'
        '      primary: const ${scheme.light.primary.toColorString()},\n'
        '      secondary: const ${scheme.light.secondary.toColorString()},\n'
        '      brightness: Brightness.light,\n'
        '      swapOnMaterial3: true,\n'
        '    ),\n';
  }
  if (useCustom) {
    lightScheme =
        '    // User defined custom colors made with FlexSchemeColor() API.\n'
        '    colors: const FlexSchemeColor(\n'
        '      primary: ${controller.customPrimaryLight.toColorString()},\n'
        '      primaryContainer: ${controller.customPrimaryContainerLight.toColorString()},\n'
        '      secondary: ${controller.customSecondaryLight.toColorString()},\n'
        '      secondaryContainer: ${controller.customSecondaryContainerLight.toColorString()},\n'
        '      tertiary: ${controller.customTertiaryLight.toColorString()},\n'
        '      tertiaryContainer: ${controller.customTertiaryContainerLight.toColorString()},\n'
        '      appBarColor: ${scheme.light.appBarColor.toColorString()},\n'
        '      error: ${controller.customErrorLight.toColorString()},\n'
        '      errorContainer: ${controller.customErrorContainerLight.toColorString()},\n'
        '    ),\n';
  }

  // Define the dark scheme.
  String darkScheme = '';
  if (useBuiltIn) {
    darkScheme =
        '    // Using FlexColorScheme built-in FlexScheme enum based colors.\n'
        '    scheme: ${FlexScheme.values[flexScheme]},\n';
  }
  if (useMyScheme1) {
    darkScheme =
        '    // Playground built-in scheme made with FlexSchemeColor() API.\n'
        '    colors: const FlexSchemeColor(\n'
        '      primary: ${scheme.dark.primary.toColorString()},\n'
        '      primaryContainer: ${scheme.dark.primaryContainer.toColorString()},\n'
        '      primaryLightRef: ${scheme.dark.primaryLightRef.toColorString()}, // The color of light mode primary\n'
        '      secondary: ${scheme.dark.secondary.toColorString()},\n'
        '      secondaryContainer: ${scheme.dark.secondaryContainer.toColorString()},\n'
        '      secondaryLightRef: ${scheme.dark.secondaryLightRef.toColorString()}, // The color of light mode secondary\n'
        '      tertiary: ${scheme.dark.tertiary.toColorString()},\n'
        '      tertiaryContainer: ${scheme.dark.tertiaryContainer.toColorString()},\n'
        '      tertiaryLightRef: ${scheme.dark.tertiaryLightRef.toColorString()}, // The color of light mode tertiary\n'
        '      appBarColor: ${scheme.dark.appBarColor.toColorString()},\n'
        '      swapOnMaterial3: true,\n'
        '    ),\n';
  }
  if (useMyScheme2) {
    darkScheme =
        '    // Playground built-in scheme made with FlexSchemeColor.from() API.\n'
        '    colors: FlexSchemeColor.from(\n'
        '      primary: const ${scheme.light.primary.toColorString()},\n'
        '      primaryLightRef: const ${scheme.light.primaryLightRef.toColorString()}, // The color of light mode primary\n'
        '      secondaryLightRef: const ${scheme.light.secondaryLightRef.toColorString()}, // The color of light mode secondary\n'
        '      tertiaryLightRef: const ${scheme.light.tertiaryLightRef.toColorString()}, // The color of light mode tertiary\n'
        '      brightness: Brightness.dark,\n'
        '      swapOnMaterial3: true,\n'
        '    ),\n';
  }
  if (useMyScheme3) {
    darkScheme =
        '    // Playground built-in scheme made with FlexSchemeColor.from() API\n'
        '    // The input FlexSchemeColor is identical to light mode, but uses\n'
        '    // default Error and toDark() methods to convert it to a dark theme.\n'
        '    colors: FlexSchemeColor.from(\n'
        '      primary: const ${scheme.light.primary.toColorString()},\n'
        '      secondary: const ${scheme.light.secondary.toColorString()},\n'
        '      brightness: Brightness.light,\n'
        '      swapOnMaterial3: true,\n'
        '    ).defaultError.toDark(30, true),\n';
  }
  if (useCustom) {
    darkScheme =
        '    // User defined custom colors made with FlexSchemeColor() API.\n'
        '    colors: const FlexSchemeColor(\n'
        '      primary: ${controller.customPrimaryDark.toColorString()},\n'
        '      primaryContainer: ${controller.customPrimaryContainerDark.toColorString()},\n'
        '      primaryLightRef: ${controller.customPrimaryDarkRef.toColorString()}, // The color of light mode primary\n'
        '      secondary: ${controller.customSecondaryDark.toColorString()},\n'
        '      secondaryContainer: ${controller.customSecondaryContainerDark.toColorString()},\n'
        '      secondaryLightRef: ${controller.customSecondaryDarkRef.toColorString()}, // The color of light mode secondary\n'
        '      tertiary: ${controller.customTertiaryDark.toColorString()},\n'
        '      tertiaryContainer: ${controller.customTertiaryContainerDark.toColorString()},\n'
        '      tertiaryLightRef: ${controller.customTertiaryDarkRef.toColorString()}, // The color of light mode tertiary\n'
        '      appBarColor: ${scheme.light.appBarColor.toColorString()},\n'
        '      error: ${controller.customErrorDark.toColorString()},\n'
        '      errorContainer: ${controller.customErrorContainerDark.toColorString()},\n'
        '    ),\n';
  }
  if (controller.useToDarkMethod && !useBuiltIn && !controller.useKeyColors) {
    // if (useCustom) {

    // Remove the last 3 chars from light scheme
    final String lightBase = lightScheme.substring(0, lightScheme.length - 7);
    darkScheme =
        '    // Computing from light scheme using defaultError and toDark() methods.\n'
        '$lightBase'
        '    ).defaultError.toDark(${controller.toDarkMethodLevel}, '
        '${controller.toDarkSwapPrimaryAndContainer}),\n';
    //   darkScheme = '    colors: const FlexSchemeColor(\n'
    //       '      primary: ${scheme.dark.primary.toColorString()},\n'
    //       '      primaryContainer: ${scheme.dark.primaryContainer.toColorString()},\n'
    //       '      primaryLightRef: ${scheme.light.primaryLightRef.toColorString()},\n'
    //       '      secondary: ${scheme.dark.secondary.toColorString()},\n'
    //       '      secondaryContainer: ${scheme.dark.secondaryContainer.toColorString()},\n'
    //       '      secondaryLightRef: ${scheme.light.secondaryLightRef.toColorString()},\n'
    //       '      tertiary: ${scheme.dark.tertiary.toColorString()},\n'
    //       '      tertiaryContainer: ${scheme.dark.tertiaryContainer.toColorString()},\n'
    //       '      tertiaryLightRef: ${scheme.light.tertiaryLightRef.toColorString()},\n'
    //       '      appBarColor: ${scheme.dark.appBarColor.toColorString()},\n'
    //       '      error: ${scheme.dark.error.toColorString()},\n'
    //       '      errorContainer: ${scheme.dark.errorContainer.toColorString()},\n'
    //       '    ).defaultError.toDark(${controller.toDarkMethodLevel}, ${controller.toDarkSwapPrimaryAndContainer}),\n';
    // } else {
    //   darkScheme = '    colors: const FlexSchemeColor(\n'
    //       '      primary: ${scheme.light.primary.toColorString()},\n'
    //       '      primaryContainer: ${scheme.light.primaryContainer.toColorString()},\n'
    //       '      primaryLightRef: ${scheme.light.primaryLightRef.toColorString()},\n'
    //       '      secondary: ${scheme.light.secondary.toColorString()},\n'
    //       '      secondaryContainer: ${scheme.light.secondaryContainer.toColorString()},\n'
    //       '      secondaryLightRef: ${scheme.light.secondaryLightRef.toColorString()},\n'
    //       '      tertiary: ${scheme.light.tertiary.toColorString()},\n'
    //       '      tertiaryContainer: ${scheme.light.tertiaryContainer.toColorString()},\n'
    //       '      tertiaryLightRef: ${scheme.light.tertiaryLightRef.toColorString()},\n'
    //       '      appBarColor: ${scheme.light.appBarColor.toColorString()},\n'
    //       '      error: ${scheme.light.error.toColorString()},\n'
    //       '      errorContainer: ${scheme.light.errorContainer.toColorString()},\n'
    //       '    ).defaultError.toDark(${controller.toDarkMethodLevel}, ${controller.toDarkSwapPrimaryAndContainer}),\n';
    // }
  }
  if (controller.useToDarkMethod && useBuiltIn && !controller.useKeyColors) {
    darkScheme =
        '    // Playground built-in light mode scheme is used and converted to\n'
        '    // a dark theme using defaultError and toDark() methods.\n'
        '    colors: FlexColor.schemes[${FlexScheme.values[flexScheme]}]!\n'
        '        .light.defaultError.toDark(${controller.toDarkMethodLevel}, '
        '${controller.toDarkSwapPrimaryAndContainer}),\n';
  }
  //
  // Code for main theme setup, the other properties 'FlexColorScheme.light' and
  // 'FlexColorScheme.dark' factories direct parameters.
  // We avoid adding any code when API default values are being used.
  //
  final String visualDensity = controller.visualDensity != null
      ? '    visualDensity: ${controller.visualDensity!.code},\n'
      : '';
  final String materialTapTargetSize = controller.tapTargetSize != null
      ? '    materialTapTargetSize: ${controller.tapTargetSize},\n'
      : '';
  final String surfaceModeLight = controller.blendLevelLight > 0 &&
          controller.surfaceModeLight != FlexSurfaceMode.highScaffoldLowSurfaces
      ? '    surfaceMode: ${controller.surfaceModeLight},\n'
      : '';
  final String surfaceModeDark = controller.blendLevelDark > 0 &&
          controller.surfaceModeDark != FlexSurfaceMode.highScaffoldLowSurfaces
      ? '    surfaceMode: ${controller.surfaceModeDark},\n'
      : '';
  final String blendLevel = controller.blendLevelLight > 0
      ? '    blendLevel: ${controller.blendLevelLight},\n'
      : '';
  final String fixedColorStyle =
      controller.fixedColorStyle != null && !controller.useKeyColors
          ? '    // None seed generated ColorScheme style of Fixed colors.\n'
              '    fixedColorStyle: ${controller.fixedColorStyle},\n'
          : '';
  final String usedColors = controller.usedColors != 6
      ? '    usedColors: ${controller.usedColors},\n'
      : '';
  final String blendLevelDark = controller.blendLevelDark > 0
      ? '    blendLevel: ${controller.blendLevelDark},\n'
      : '';
  final String appBarStyleLight = controller.appBarStyleLight == null ||
          (controller.useMaterial3 &&
              controller.appBarBackgroundSchemeColorLight != null)
      ? ''
      : '    appBarStyle: ${controller.appBarStyleLight},\n';
  final String appBarStyleDark = controller.appBarStyleDark == null ||
          (controller.useMaterial3 &&
              controller.appBarBackgroundSchemeColorDark != null)
      ? ''
      : '    appBarStyle: ${controller.appBarStyleDark},\n';
  final String appBarOpacityLight = controller.appBarOpacityLight != null &&
          controller.appBarOpacityLight != 1
      ? '    appBarOpacity: ${controller.appBarOpacityLight!.toStringAsFixed(2)},\n'
      : '';
  final String appBarOpacityDark = controller.appBarOpacityDark != null &&
          controller.appBarOpacityDark != 1
      ? '    appBarOpacity: ${controller.appBarOpacityDark!.toStringAsFixed(2)},\n'
      : '';
  final String transparentStatusBar = controller.appBarTransparentStatusBar
      ? ''
      : '    transparentStatusBar: ${controller.appBarTransparentStatusBar},\n';
  final String appBarElevationLight = controller.appBarElevationLight != 0 &&
          controller.appBarElevationLight != null
      ? '    appBarElevation: ${controller.appBarElevationLight!.toStringAsFixed(1)},\n'
      : '';
  final String appBarElevationDark = controller.appBarElevationDark != 0 &&
          controller.appBarElevationDark != null
      ? '    appBarElevation: ${controller.appBarElevationDark!.toStringAsFixed(1)},\n'
      : '';
  final String bottomAppBarElevationLight = controller
              .bottomAppBarElevationLight !=
          null
      ? '    bottomAppBarElevation: ${controller.bottomAppBarElevationLight!.toStringAsFixed(1)},\n'
      : '';
  final String bottomAppBarElevationDark = controller
              .bottomAppBarElevationDark !=
          null
      ? '    bottomAppBarElevation: ${controller.bottomAppBarElevationDark!.toStringAsFixed(1)},\n'
      : '';
  final String tabBarStyle = controller.tabBarStyle == null ||
          (controller.tabBarStyle == FlexTabBarStyle.forAppBar &&
              !controller.useMaterial3) ||
          (controller.tabBarStyle == FlexTabBarStyle.flutterDefault &&
              controller.useMaterial3)
      ? ''
      : '    tabBarStyle: ${controller.tabBarStyle},\n';
  final String lightIsWhite = controller.scaffoldLightIsWhite
      ? '    lightIsWhite: ${controller.scaffoldLightIsWhite},\n'
      : '';
  final String darkIsTrueBlack = controller.scaffoldDarkIsTrueBlack
      ? '    darkIsTrueBlack: ${controller.scaffoldDarkIsTrueBlack},\n'
      : '';
  final String swapLegacyOnMaterial3 =
      controller.swapLegacyColorsInM3 && controller.useMaterial3
          ? '    swapLegacyOnMaterial3: ${controller.swapLegacyColorsInM3},\n'
          : '';
  final String swapLightColors = controller.swapPrimaryAndSecondaryLightColors
      ? '    swapColors: ${controller.swapPrimaryAndSecondaryLightColors},\n'
      : '';
  final String swapDarkColors = controller.swapPrimaryAndSecondaryDarkColors
      ? '    swapColors: ${controller.swapPrimaryAndSecondaryDarkColors},\n'
      : '';
  final String tooltipsMatchBackground = controller.tooltipsMatchBackground &&
          controller.tooltipSchemeColor == null
      ? '    tooltipsMatchBackground: ${controller.tooltipsMatchBackground},\n'
      : '';
  final String useM3ErrorColors =
      controller.useM3ErrorColors && !controller.useKeyColors
          ? '    useMaterial3ErrorColors: ${controller.useM3ErrorColors},\n'
          : '';
  final String tintLightColor = controller.surfaceTintLight != null
      ? '    surfaceTint: const ${controller.surfaceTintLight.toColorString()},\n'
      : '';
  final String tintDarkColor = controller.surfaceTintDark != null
      ? '    surfaceTint: const ${controller.surfaceTintDark.toColorString()},\n'
      : '';
  // Do we apply Cupertino to all components?
  final String applyToAllCupertino = controller.applyThemeToAllCupertino
      ? '    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),\n'
      : '';

  // Are we using Material3?
  final String useMaterial3 = controller.useMaterial3
      ? ''
      : '    useMaterial3: ${controller.useMaterial3},\n';
  //
  // Code for FlexSubThemesData setup.
  //
  final String interactionEffects = controller.interactionEffects
      ? '      interactionEffects: ${controller.interactionEffects},\n'
      : '';
  final String tintedDisabledControls = controller.tintedDisabledControls
      ? '      tintedDisabledControls: ${controller.tintedDisabledControls},\n'
      : '';
  final String blendOnLevelLight = controller.blendOnLevelLight > 0
      ? '      blendOnLevel: ${controller.blendOnLevelLight},\n'
      : '';
  final String blendOnLevelDark = controller.blendOnLevelDark > 0
      ? '      blendOnLevel: ${controller.blendOnLevelDark},\n'
      : '';
  final String blendLightOnColors = controller.blendLightOnColors
      ? '      blendOnColors: ${controller.blendLightOnColors},\n'
      : '';
  final String blendDarkOnColors = controller.blendDarkOnColors
      ? '      blendOnColors: ${controller.blendDarkOnColors},\n'
      : '';
  // TODO(rydmike): Commented as part of blendTextTheme deprecation.
  // final String blendLightTextTheme = controller.blendLightTextTheme
  //     ? '      blendTextTheme: ${controller.blendLightTextTheme},\n'
  //     : '';
  // final String blendDarkTextTheme = controller.blendDarkTextTheme
  //     ? '      blendTextTheme: ${controller.blendDarkTextTheme},\n'
  //     : '';
  final String useMaterial3Typography = controller.useMaterial3Typography !=
          null
      ? '      useMaterial3Typography: ${controller.useMaterial3Typography},\n'
      : '';
  final String useM2StyleDividerInM3 = controller.useM2StyleDividerInM3 &&
          controller.useMaterial3
      ? '      useM2StyleDividerInM3: ${controller.useM2StyleDividerInM3},\n'
      : '';

  final String scaffoldBackgroundLightSchemeColor = controller
              .scaffoldBackgroundLightSchemeColor !=
          null
      ? '      scaffoldBackgroundSchemeColor: ${controller.scaffoldBackgroundLightSchemeColor},\n'
      : '';
  final String scaffoldBackgroundDarkSchemeColor = controller
              .scaffoldBackgroundDarkSchemeColor !=
          null
      ? '      scaffoldBackgroundSchemeColor: ${controller.scaffoldBackgroundDarkSchemeColor},\n'
      : '';

  final String scaffoldBackgroundLightBaseColor = controller
              .scaffoldBackgroundLightBaseColor !=
          null
      ? '      scaffoldBackgroundBaseColor: ${controller.scaffoldBackgroundLightBaseColor},\n'
      : '';
  final String scaffoldBackgroundDarkBaseColor = controller
              .scaffoldBackgroundDarkBaseColor !=
          null
      ? '      scaffoldBackgroundBaseColor: ${controller.scaffoldBackgroundDarkBaseColor},\n'
      : '';

  // Adaptive themes.
  final String adaptiveRemoveElevationTintLight = controller
                  .adaptiveRemoveElevationTintLight !=
              null &&
          controller.adaptiveRemoveElevationTintLight != AdaptiveResponse.off &&
          controller.useMaterial3
      ? '      adaptiveRemoveElevationTint: ${controller.adaptiveRemoveElevationTintLight!.code},\n'
      : '';
  final String adaptiveElevationShadowsBackLight = controller
                  .adaptiveElevationShadowsBackLight !=
              null &&
          controller.adaptiveElevationShadowsBackLight !=
              AdaptiveResponse.off &&
          controller.useMaterial3
      ? '      adaptiveElevationShadowsBack: ${controller.adaptiveElevationShadowsBackLight!.code},\n'
      : '';
  final String adaptiveAppBarScrollUnderOffLight = controller
                  .adaptiveAppBarScrollUnderOffLight !=
              null &&
          controller.adaptiveAppBarScrollUnderOffLight !=
              AdaptiveResponse.off &&
          controller.useMaterial3
      ? '      adaptiveAppBarScrollUnderOff: ${controller.adaptiveAppBarScrollUnderOffLight!.code},\n'
      : '';
  final String adaptiveRemoveElevationTintDark = controller
                  .adaptiveRemoveElevationTintDark !=
              null &&
          controller.adaptiveRemoveElevationTintDark != AdaptiveResponse.off &&
          controller.useMaterial3
      ? '      adaptiveRemoveElevationTint: ${controller.adaptiveRemoveElevationTintDark!.code},\n'
      : '';
  final String adaptiveElevationShadowsBackDark = controller
                  .adaptiveElevationShadowsBackDark !=
              null &&
          controller.adaptiveElevationShadowsBackDark != AdaptiveResponse.off &&
          controller.useMaterial3
      ? '      adaptiveElevationShadowsBack: ${controller.adaptiveElevationShadowsBackDark!.code},\n'
      : '';
  final String adaptiveAppBarScrollUnderOffDark = controller
                  .adaptiveAppBarScrollUnderOffDark !=
              null &&
          controller.adaptiveAppBarScrollUnderOffDark != AdaptiveResponse.off &&
          controller.useMaterial3
      ? '      adaptiveAppBarScrollUnderOff: ${controller.adaptiveAppBarScrollUnderOffDark!.code},\n'
      : '';

  // Splash type settings
  final String adaptiveSplash = controller.adaptiveResponseSplash != null &&
          controller.adaptiveResponseSplash != AdaptiveResponse.off
      ? '      adaptiveSplash: ${controller.adaptiveResponseSplash!.code},\n'
      : '';
  final String splashType = controller.splashType != null
      ? '      splashType: ${controller.splashType!.code},\n'
      : '';
  final String splashTypeAdaptive = controller.splashTypeAdaptive != null
      ? '      splashTypeAdaptive: ${controller.splashTypeAdaptive!.code},\n'
      : '';

  // Default radius, its adaptive variant.
  final String defaultRadius = controller.defaultRadius != null
      ? '      defaultRadius: ${controller.defaultRadius!.toStringAsFixed(1)},\n'
      : '';
  final String adaptiveRadius = controller.adaptiveResponseRadius != null &&
          controller.adaptiveResponseRadius != AdaptiveResponse.off
      ? '      adaptiveRadius: ${controller.adaptiveResponseRadius!.code},\n'
      : '';
  final String defaultRadiusAdaptive = controller.defaultRadiusAdaptive !=
              null &&
          controller.adaptiveResponseRadius != null &&
          controller.adaptiveResponseRadius != AdaptiveResponse.off
      ? '      defaultRadiusAdaptive: ${controller.defaultRadiusAdaptive!.toStringAsFixed(1)},\n'
      : '';
  // Shape border widths
  final String thinBorderWidth = controller.thinBorderWidth != null
      ? '      thinBorderWidth: ${controller.thinBorderWidth!.toStringAsFixed(1)},\n'
      : '';
  final String thickBorderWidth = controller.thickBorderWidth != null
      ? '      thickBorderWidth: ${controller.thickBorderWidth!.toStringAsFixed(1)},\n'
      : '';
  //
  // Material bottom sheet.
  final String bottomSheetRadius = controller.bottomSheetBorderRadius != null
      ? '      bottomSheetRadius: ${controller.bottomSheetBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String bottomSheetElevation = controller.bottomSheetElevation != null
      ? '      bottomSheetElevation: ${controller.bottomSheetElevation!.toStringAsFixed(1)},\n'
      : '';
  final String bottomSheetModalElevation = controller
              .bottomSheetModalElevation !=
          null
      ? '      bottomSheetModalElevation: ${controller.bottomSheetModalElevation!.toStringAsFixed(1)},\n'
      : '';
  final String bottomSheetBackgroundColor = controller.bottomSheetSchemeColor !=
          null
      ? '      bottomSheetBackgroundColor: ${controller.bottomSheetSchemeColor},\n'
      : '';
  final String bottomSheetModalBackgroundColor = controller
              .bottomSheetSchemeColor !=
          null
      ? '      bottomSheetModalBackgroundColor: ${controller.bottomSheetModalSchemeColor},\n'
      : '';
  final String bottomSheetClipBehavior = controller.bottomSheetClipBehavior !=
          null
      ? '      bottomSheetClipBehavior: ${controller.bottomSheetClipBehavior},\n'
      : '';
  //
  // Material button sub themes border radius setup CODE.
  //
  final String textButtonBorderRadius = controller.textButtonBorderRadius !=
          null
      ? '      textButtonRadius: ${controller.textButtonBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String filledButtonBorderRadius = controller.filledButtonBorderRadius !=
          null
      ? '      filledButtonRadius: ${controller.filledButtonBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String elevatedButtonBorderRadius = controller
              .elevatedButtonBorderRadius !=
          null
      ? '      elevatedButtonRadius: ${controller.elevatedButtonBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String outlinedButtonBorderRadius = controller
              .outlinedButtonBorderRadius !=
          null
      ? '      outlinedButtonRadius: ${controller.outlinedButtonBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  //
  // Material buttons sub themes setup CODE.
  //
  final String textButtonSchemeColor = controller.textButtonSchemeColor ==
              SchemeColor.primary ||
          controller.textButtonSchemeColor == null
      ? ''
      : '      textButtonSchemeColor: ${controller.textButtonSchemeColor},\n';
  final String filledButtonSchemeColor = controller.filledButtonSchemeColor ==
              SchemeColor.primary ||
          controller.filledButtonSchemeColor == null
      ? ''
      : '      filledButtonSchemeColor: ${controller.filledButtonSchemeColor},\n';
  final String elevatedButtonSchemeColor = controller
                  .elevatedButtonSchemeColor ==
              SchemeColor.primary ||
          controller.elevatedButtonSchemeColor == null
      ? ''
      : '      elevatedButtonSchemeColor: ${controller.elevatedButtonSchemeColor},\n';
  final String elevatedButtonSecondarySchemeColor = controller
              .elevatedButtonSecondarySchemeColor ==
          null
      ? ''
      : '      elevatedButtonSecondarySchemeColor: ${controller.elevatedButtonSecondarySchemeColor},\n';
  final String outlinedButtonSchemeColor = controller
                  .outlinedButtonSchemeColor ==
              SchemeColor.primary ||
          controller.outlinedButtonSchemeColor == null
      ? ''
      : '      outlinedButtonSchemeColor: ${controller.outlinedButtonSchemeColor},\n';
  final String outlinedButtonOutlineSchemeColor = controller
              .outlinedButtonOutlineSchemeColor ==
          null
      ? ''
      : '      outlinedButtonOutlineSchemeColor: ${controller.outlinedButtonOutlineSchemeColor},\n';

  final String outlinedButtonBorderWidth = controller
              .outlinedButtonBorderWidth !=
          null
      ? '      outlinedButtonBorderWidth: ${controller.outlinedButtonBorderWidth!.toStringAsFixed(1)},\n'
      : '';
  final String outlinedButtonPressedBorderWidth = controller
              .outlinedButtonPressedBorderWidth !=
          null
      ? '      outlinedButtonPressedBorderWidth: ${controller.outlinedButtonPressedBorderWidth!.toStringAsFixed(1)},\n'
      : '';
  //
  // ToggleButtons sub themes setup CODE.
  //
  final String toggleButtonsSchemeColor = controller.toggleButtonsSchemeColor ==
          null
      ? ''
      : '      toggleButtonsSchemeColor: ${controller.toggleButtonsSchemeColor},\n';
  final String toggleButtonsSelectedForegroundSchemeColor = controller
              .toggleButtonsSelectedForegroundSchemeColor !=
          null
      ? '      toggleButtonsSelectedForegroundSchemeColor: ${controller.toggleButtonsSelectedForegroundSchemeColor},\n'
      : '';
  final String toggleButtonsUnselectedSchemeColor = controller
              .toggleButtonsUnselectedSchemeColor ==
          null
      ? ''
      : '      toggleButtonsUnselectedSchemeColor: ${controller.toggleButtonsUnselectedSchemeColor},\n';
  final String toggleButtonsBorderSchemeColor = controller
              .toggleButtonsBorderSchemeColor ==
          null
      ? ''
      : '      toggleButtonsBorderSchemeColor: ${controller.toggleButtonsBorderSchemeColor},\n';
  final String toggleButtonsBorderRadius = controller
              .toggleButtonsBorderRadius !=
          null
      ? '      toggleButtonsRadius: ${controller.toggleButtonsBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String toggleButtonsBorderWidth = controller.toggleButtonsBorderWidth !=
          null
      ? '      toggleButtonsBorderWidth: ${controller.toggleButtonsBorderWidth!.toStringAsFixed(1)},\n'
      : '';
  //
  // SegmentedButton sub themes setup CODE.
  //
  final String segmentedButtonSchemeColor = controller
              .segmentedButtonSchemeColor ==
          null
      ? ''
      : '      segmentedButtonSchemeColor: ${controller.segmentedButtonSchemeColor},\n';
  final String segmentedButtonSelectedForegroundSchemeColor = controller
              .segmentedButtonSelectedForegroundSchemeColor !=
          null
      ? '      segmentedButtonSelectedForegroundSchemeColor: ${controller.segmentedButtonSelectedForegroundSchemeColor},\n'
      : '';
  final String segmentedButtonUnselectedSchemeColor = controller
              .segmentedButtonUnselectedSchemeColor ==
          null
      ? ''
      : '      segmentedButtonUnselectedSchemeColor: ${controller.segmentedButtonUnselectedSchemeColor},\n';
  final String segmentedButtonUnselectedForegroundSchemeColor = controller
              .segmentedButtonUnselectedForegroundSchemeColor ==
          null
      ? ''
      : '      segmentedButtonUnselectedForegroundSchemeColor: ${controller.segmentedButtonUnselectedForegroundSchemeColor},\n';
  final String segmentedButtonBorderSchemeColor = controller
              .segmentedButtonBorderSchemeColor ==
          null
      ? ''
      : '      segmentedButtonBorderSchemeColor: ${controller.segmentedButtonBorderSchemeColor},\n';
  final String segmentedButtonBorderRadius = controller
              .segmentedButtonBorderRadius !=
          null
      ? '      segmentedButtonRadius: ${controller.segmentedButtonBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String segmentedButtonBorderWidth = controller
              .segmentedButtonBorderWidth !=
          null
      ? '      segmentedButtonBorderWidth: ${controller.segmentedButtonBorderWidth!.toStringAsFixed(1)},\n'
      : '';
  //
  // Switches, CheckBox and radio sub themes setup CODE.
  //
  final String switchSchemeColor = controller.switchSchemeColor == null
      ? ''
      : '      switchSchemeColor: ${controller.switchSchemeColor},\n';
  final String switchThumbSchemeColor = controller.switchThumbSchemeColor ==
          null
      ? ''
      : '      switchThumbSchemeColor: ${controller.switchThumbSchemeColor},\n';
  final String switchThumbFixedSize = controller.switchThumbFixedSize
      ? '      switchThumbFixedSize: ${controller.switchThumbFixedSize},\n'
      : '';

  final String switchAdaptiveCupertinoLike = controller
                  .switchAdaptiveCupertinoLike !=
              null &&
          controller.switchAdaptiveCupertinoLike != AdaptiveResponse.off &&
          controller.useMaterial3
      ? '      switchAdaptiveCupertinoLike: ${controller.switchAdaptiveCupertinoLike!.code},\n'
      : '';

  final String checkboxSchemeColor = controller.checkboxSchemeColor == null
      ? ''
      : '      checkboxSchemeColor: ${controller.checkboxSchemeColor},\n';
  final String radioSchemeColor = controller.radioSchemeColor == null
      ? ''
      : '      radioSchemeColor: ${controller.radioSchemeColor},\n';
  final String unselectedIsColored = controller.unselectedToggleIsColored
      ? '      unselectedToggleIsColored: ${controller.unselectedToggleIsColored},\n'
      : '';
  //
  // Slider sub themes setup CODE.
  //
  final String sliderBaseSchemeColor = controller.sliderBaseSchemeColor == null
      ? ''
      : '      sliderBaseSchemeColor: ${controller.sliderBaseSchemeColor},\n';
  final String sliderThumbSchemeColor = controller.sliderThumbSchemeColor ==
          null
      ? ''
      : '      sliderThumbSchemeColor: ${controller.sliderThumbSchemeColor},\n';
  final String sliderIndicatorSchemeColor = controller
              .sliderIndicatorSchemeColor ==
          null
      ? ''
      : '      sliderIndicatorSchemeColor: ${controller.sliderIndicatorSchemeColor},\n';
  final String sliderValueTinted = !controller.sliderValueTinted
      ? ''
      : '      sliderValueTinted: ${controller.sliderValueTinted},\n';
  final String sliderValueIndicatorType = controller.sliderValueIndicatorType ==
          null
      ? ''
      : '      sliderValueIndicatorType: ${controller.sliderValueIndicatorType},\n';
  final String sliderShowValueIndicator = controller.sliderShowValueIndicator ==
          null
      ? ''
      : '      sliderShowValueIndicator: ${controller.sliderShowValueIndicator},\n';
  final String sliderTrackHeight = controller.sliderTrackHeight == null
      ? ''
      : '      sliderTrackHeight: ${controller.sliderTrackHeight},\n';
  //
  // Input decorator setup CODE.
  //
  final String inputDecoratorSchemeColorLight = controller
              .inputDecoratorSchemeColorLight ==
          null
      ? ''
      : '      inputDecoratorSchemeColor: ${controller.inputDecoratorSchemeColorLight},\n';
  final String inputDecoratorSchemeColorDark = controller
              .inputDecoratorSchemeColorDark ==
          null
      ? ''
      : '      inputDecoratorSchemeColor: ${controller.inputDecoratorSchemeColorDark},\n';
  final String inputDecoratorBorderSchemeColorLight = controller
                  .inputDecoratorBorderSchemeColorLight ==
              null ||
          (!controller.inputDecoratorFocusedHasBorder &&
              (!controller.inputDecoratorUnfocusedHasBorder ||
                  !controller.inputDecoratorUnfocusedBorderIsColored))
      ? ''
      : '      inputDecoratorBorderSchemeColor: ${controller.inputDecoratorBorderSchemeColorLight},\n';
  final String inputDecoratorBorderSchemeColorDark = controller
                  .inputDecoratorBorderSchemeColorDark ==
              null ||
          (!controller.inputDecoratorFocusedHasBorder &&
              (!controller.inputDecoratorUnfocusedHasBorder ||
                  !controller.inputDecoratorUnfocusedBorderIsColored))
      ? ''
      : '      inputDecoratorBorderSchemeColor: ${controller.inputDecoratorBorderSchemeColorDark},\n';
  final String inputDecoratorIsFilled = controller.inputDecoratorIsFilled
      ? '      inputDecoratorIsFilled: ${controller.inputDecoratorIsFilled},\n'
      : '';

  final String inputDecoratorIsDense = controller.inputDecoratorIsDense
      ? '      inputDecoratorIsDense: ${controller.inputDecoratorIsDense},\n'
      : '';

  final String inputDecoratorContentPadding = controller
                  .inputDecoratorPaddingStart !=
              null ||
          controller.inputDecoratorPaddingEnd != null ||
          controller.inputDecoratorPaddingTop != null ||
          controller.inputDecoratorPaddingBottom != null
      ? '      inputDecoratorContentPadding: EdgeInsetsDirectional.fromSTEB('
          '${controller.inputDecoratorPaddingStart?.toStringAsFixed(0) ?? DecoratorDefault.start.padding(controller).toStringAsFixed(0)}, '
          '${controller.inputDecoratorPaddingTop?.toStringAsFixed(0) ?? DecoratorDefault.top.padding(controller).toStringAsFixed(0)}, '
          '${controller.inputDecoratorPaddingEnd?.toStringAsFixed(0) ?? DecoratorDefault.end.padding(controller).toStringAsFixed(0)}, '
          '${controller.inputDecoratorPaddingBottom?.toStringAsFixed(0) ?? DecoratorDefault.bottom.padding(controller).toStringAsFixed(0)}),\n'
      : '';

  final String inputDecoratorBackgroundAlphaLight = controller
              .inputDecoratorBackgroundAlphaLight ==
          null
      ? ''
      : '      inputDecoratorBackgroundAlpha: ${controller.inputDecoratorBackgroundAlphaLight},\n';
  final String inputDecoratorBackgroundAlphaDark = controller
              .inputDecoratorBackgroundAlphaDark ==
          null
      ? ''
      : '      inputDecoratorBackgroundAlpha: ${controller.inputDecoratorBackgroundAlphaDark},\n';
  final String inputDecoratorBorderType = controller.inputDecoratorBorderType ==
          FlexInputBorderType.outline
      ? '      inputDecoratorBorderType: ${controller.inputDecoratorBorderType},\n'
      : '';
  final String adaptiveInputDecoratorRadius = controller
                  .adaptiveResponseInputDecoratorRadius !=
              null &&
          controller.adaptiveResponseInputDecoratorRadius !=
              AdaptiveResponse.off
      ? '      adaptiveInputDecoratorRadius: ${controller.adaptiveResponseInputDecoratorRadius!.code},\n'
      : '';
  final String inputDecoratorRadius = controller.inputDecoratorBorderRadius !=
          null
      ? '      inputDecoratorRadius: ${controller.inputDecoratorBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String inputDecoratorRadiusAdaptive = controller
              .inputDecoratorBorderRadiusAdaptive !=
          null
      ? '      inputDecoratorRadiusAdaptive: ${controller.inputDecoratorBorderRadiusAdaptive!.toStringAsFixed(1)},\n'
      : '';
  final String inputDecoratorUnfocusedHasBorder = controller
          .inputDecoratorUnfocusedHasBorder
      ? ''
      : '      inputDecoratorUnfocusedHasBorder: ${controller.inputDecoratorUnfocusedHasBorder},\n';
  final String inputDecoratorFocusedHasBorder = controller
          .inputDecoratorFocusedHasBorder
      ? ''
      : '      inputDecoratorFocusedHasBorder: ${controller.inputDecoratorFocusedHasBorder},\n';
  final String inputDecoratorUnfocusedBorderIsColored = controller
              .inputDecoratorUnfocusedBorderIsColored &&
          controller.inputDecoratorUnfocusedHasBorder
      ? '      inputDecoratorUnfocusedBorderIsColored: ${controller.inputDecoratorUnfocusedBorderIsColored},\n'
      : '';
  final String inputDecoratorBorderWidth = controller
                  .inputDecoratorBorderWidth !=
              null &&
          controller.inputDecoratorUnfocusedHasBorder
      ? '      inputDecoratorBorderWidth: ${controller.inputDecoratorBorderWidth!.toStringAsFixed(1)},\n'
      : '';
  final String inputDecoratorFocusedBorderWidth = controller
                  .inputDecoratorFocusedBorderWidth !=
              null &&
          controller.inputDecoratorFocusedHasBorder
      ? '      inputDecoratorFocusedBorderWidth: ${controller.inputDecoratorFocusedBorderWidth!.toStringAsFixed(1)},\n'
      : '';
  final String inputDecoratorPrefixIconSchemeColor = controller
              .inputDecoratorPrefixIconLightSchemeColor ==
          null
      ? ''
      : '      inputDecoratorPrefixIconSchemeColor: ${controller.inputDecoratorPrefixIconLightSchemeColor},\n';
  final String inputDecoratorPrefixIconDarkSchemeColor = controller
              .inputDecoratorPrefixIconDarkSchemeColor ==
          null
      ? ''
      : '      inputDecoratorPrefixIconSchemeColor: ${controller.inputDecoratorPrefixIconDarkSchemeColor},\n';
  final String inputDecoratorSuffixIconSchemeColor = controller
              .inputDecoratorSuffixIconLightSchemeColor ==
          null
      ? ''
      : '      inputDecoratorSuffixIconSchemeColor: ${controller.inputDecoratorSuffixIconLightSchemeColor},\n';
  final String inputDecoratorSuffixIconDarkSchemeColor = controller
              .inputDecoratorSuffixIconDarkSchemeColor ==
          null
      ? ''
      : '      inputDecoratorSuffixIconSchemeColor: ${controller.inputDecoratorSuffixIconDarkSchemeColor},\n';
  //
  // Text selection setup CODE.
  //
  final String inputCursorLightSchemeColor = controller
              .inputCursorLightSchemeColor ==
          null
      ? ''
      : '      inputCursorSchemeColor: ${controller.inputCursorLightSchemeColor},\n';
  final String inputSelectionLightSchemeColor = controller
              .inputSelectionLightSchemeColor ==
          null
      ? ''
      : '      inputSelectionSchemeColor: ${controller.inputSelectionLightSchemeColor},\n';
  final String inputSelectionLightOpacity = controller
              .inputSelectionLightOpacity ==
          null
      ? ''
      : '      inputSelectionOpacity: ${controller.inputSelectionLightOpacity!.toStringAsFixed(2)},\n';
  final String inputSelectionHandleLightSchemeColor = controller
              .inputSelectionHandleLightSchemeColor ==
          null
      ? ''
      : '      inputSelectionHandleSchemeColor: ${controller.inputSelectionHandleLightSchemeColor},\n';
  //
  final String inputCursorDarkSchemeColor = controller
              .inputCursorDarkSchemeColor ==
          null
      ? ''
      : '      inputCursorSchemeColor: ${controller.inputCursorDarkSchemeColor},\n';
  final String inputSelectionDarkSchemeColor = controller
              .inputSelectionDarkSchemeColor ==
          null
      ? ''
      : '      inputSelectionSchemeColor: ${controller.inputSelectionDarkSchemeColor},\n';
  final String inputSelectionDarkOpacity = controller
              .inputSelectionDarkOpacity ==
          null
      ? ''
      : '      inputSelectionOpacity: ${controller.inputSelectionDarkOpacity!.toStringAsFixed(2)},\n';
  final String inputSelectionHandleDarkSchemeColor = controller
              .inputSelectionHandleDarkSchemeColor ==
          null
      ? ''
      : '      inputSelectionHandleSchemeColor: ${controller.inputSelectionHandleDarkSchemeColor},\n';

  //
  // ListTile setup CODE
  //
  final String listTileSelectedSchemeColor = controller
              .listTileSelectedSchemeColor !=
          null
      ? '      listTileSelectedSchemeColor: ${controller.listTileSelectedSchemeColor},\n'
      : '';
  final String listTileIconSchemeColor = controller.listTileIconSchemeColor !=
          null
      ? '      listTileIconSchemeColor: ${controller.listTileIconSchemeColor},\n'
      : '';
  final String listTileTextSchemeColor = controller.listTileTextSchemeColor !=
          null
      ? '      listTileTextSchemeColor: ${controller.listTileTextSchemeColor},\n'
      : '';
  final String listTileTileSchemeColor = controller.listTileTileSchemeColor !=
          null
      ? '      listTileTileSchemeColor: ${controller.listTileTileSchemeColor},\n'
      : '';
  final String listTileSelectedTileSchemeColor = controller
              .listTileSelectedTileSchemeColor !=
          null
      ? '      listTileSelectedTileSchemeColor: ${controller.listTileSelectedTileSchemeColor},\n'
      : '';
  final String listTileContentPadding = controller.listTilePaddingStart !=
              null ||
          controller.listTilePaddingTop != null ||
          controller.listTilePaddingEnd != null ||
          controller.listTilePaddingBottom != null
      ? '      listTileContentPadding: EdgeInsetsDirectional.fromSTEB('
          '${(controller.listTilePaddingStart ?? 16).toStringAsFixed(0)}, '
          '${(controller.listTilePaddingTop ?? 0).toStringAsFixed(0)}, '
          '${(controller.listTilePaddingEnd ?? (controller.useMaterial3 ? 24 : 16)).toStringAsFixed(0)}, '
          '${(controller.listTilePaddingBottom ?? 0).toStringAsFixed(0)}),\n'
      : '';

  final String listTileHorizontalTitleGap = controller
              .listTileHorizontalTitleGap !=
          null
      ? '      listTileHorizontalTitleGap: ${controller.listTileHorizontalTitleGap!.toStringAsFixed(1)},\n'
      : '';
  final String listTileMinVerticalPadding = controller
              .listTileMinVerticalPadding !=
          null
      ? '      listTileMinVerticalPadding: ${controller.listTileMinVerticalPadding!.toStringAsFixed(1)},\n'
      : '';

  final String listTileStyle = controller.listTileStyle != null
      ? '      listTileStyle: ${controller.listTileStyle},\n'
      : '';
  final String listTileTitleAlignment = controller.listTileTitleAlignment !=
          null
      ? '      listTileTitleAlignment: ${controller.listTileTitleAlignment},\n'
      : '';
  //
  // Fab and chip, snack, card, and popup setup CODE
  //
  final String fabUseShape = controller.floatingActionButtonUseShape
      ? '      fabUseShape: ${controller.floatingActionButtonUseShape},\n'
      : '';
  final String fabAlwaysCircular = controller.floatingActionButtonUseShape &&
          controller.floatingActionButtonAlwaysCircular
      ? '      fabAlwaysCircular: ${controller.floatingActionButtonAlwaysCircular},\n'
      : '';
  final String fabBorderRadius = controller.floatingActionButtonBorderRadius !=
              null &&
          controller.floatingActionButtonUseShape &&
          !controller.floatingActionButtonAlwaysCircular
      ? '      fabRadius: ${controller.floatingActionButtonBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String fabSchemeColor = controller.floatingActionButtonSchemeColor !=
          null
      ? '      fabSchemeColor: ${controller.floatingActionButtonSchemeColor},\n'
      : '';
  final String fabForegroundSchemeColor = controller
              .floatingActionButtonForegroundSchemeColor !=
          null
      ? '      fabForegroundSchemeColor: ${controller.floatingActionButtonForegroundSchemeColor},\n'
      : '';

  final String snackBarRadius = controller.snackBarBorderRadius != null
      ? '      snackBarRadius: ${controller.snackBarBorderRadius},\n'
      : '';
  final String snackBarElevation = controller.snackBarElevation != null
      ? '      snackBarElevation: ${controller.snackBarElevation},\n'
      : '';
  final String snackBarBackgroundSchemeColor = controller.snackBarSchemeColor !=
          null
      ? '      snackBarBackgroundSchemeColor: ${controller.snackBarSchemeColor},\n'
      : '';
  final String snackBarActionSchemeColor = controller
              .snackBarActionSchemeColor !=
          null
      ? '      snackBarActionSchemeColor: ${controller.snackBarActionSchemeColor},\n'
      : '';
  final String chipSchemeColor = controller.chipSchemeColor != null
      ? '      chipSchemeColor: ${controller.chipSchemeColor},\n'
      : '';
  final String chipSelectedSchemeColor = controller.chipSelectedSchemeColor !=
          null
      ? '      chipSelectedSchemeColor: ${controller.chipSelectedSchemeColor},\n'
      : '';
  final String chipSecondarySelectedSchemeColor = controller
              .chipSecondarySelectedSchemeColor !=
          null
      ? '      chipSecondarySelectedSchemeColor: ${controller.chipSecondarySelectedSchemeColor},\n'
      : '';
  final String chipDeleteIconSchemeColor = controller
              .chipDeleteIconSchemeColor !=
          null
      ? '      chipDeleteIconSchemeColor: ${controller.chipDeleteIconSchemeColor},\n'
      : '';
  final String chipBlendColors = controller.chipBlendColors != null
      ? '      chipBlendColors: ${controller.chipBlendColors},\n'
      : '';
  final String chipFontSize = controller.chipFontSize != null
      ? '      chipFontSize: ${controller.chipFontSize},\n'
      : '';
  final String chipIconSize = controller.chipIconSize != null
      ? '      chipIconSize: ${controller.chipIconSize},\n'
      : '';
  final String chipPadding = controller.chipPaddingStart != null ||
          controller.chipPaddingTop != null ||
          controller.chipPaddingEnd != null ||
          controller.chipPaddingBottom != null
      ? '      chipPadding: EdgeInsetsDirectional.fromSTEB('
          '${(controller.chipPaddingStart ?? (controller.useMaterial3 ? 8 : 4)).toStringAsFixed(0)}, '
          '${(controller.chipPaddingTop ?? (controller.useMaterial3 ? 8 : 4)).toStringAsFixed(0)}, '
          '${(controller.chipPaddingEnd ?? (controller.useMaterial3 ? 8 : 4)).toStringAsFixed(0)}, '
          '${(controller.chipPaddingBottom ?? (controller.useMaterial3 ? 8 : 4)).toStringAsFixed(0)}'
          '),\n'
      : '';

  final String chipBorderRadius = controller.chipBorderRadius != null
      ? '      chipRadius: ${controller.chipBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String cardBorderRadius = controller.cardBorderRadius != null
      ? '      cardRadius: ${controller.cardBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String popupMenuBorderRadius = controller.popupMenuBorderRadius != null
      ? '      popupMenuRadius: ${controller.popupMenuBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String popupMenuElevation = controller.popupMenuElevation != null
      ? '      popupMenuElevation: ${controller.popupMenuElevation!.toStringAsFixed(1)},\n'
      : '';
  final String popupMenuSchemeColor = controller.popupMenuSchemeColor != null
      ? '      popupMenuSchemeColor: ${controller.popupMenuSchemeColor},\n'
      : '';
  final String popupMenuOpacity = controller.popupMenuOpacity != 1 &&
          controller.popupMenuOpacity != null
      ? '      popupMenuOpacity: ${controller.popupMenuOpacity!.toStringAsFixed(2)},\n'
      : '';
  final String alignedDropdown = controller.alignedDropdown
      ? '      alignedDropdown: ${controller.alignedDropdown},\n'
      : '';
  //
  // Tooltip setup CODE
  //
  final String tooltipRadius = controller.tooltipRadius != null
      ? '      tooltipRadius: ${controller.tooltipRadius},\n'
      : '';
  final String tooltipWaitDuration = controller.tooltipWaitDuration != null
      ? '      tooltipWaitDuration: Duration(milliseconds: ${controller.tooltipWaitDuration}),\n'
      : '';
  final String tooltipShowDuration = controller.tooltipShowDuration != null
      ? '      tooltipShowDuration: Duration(milliseconds: ${controller.tooltipShowDuration}),\n'
      : '';
  final String tooltipSchemeColor = controller.tooltipSchemeColor != null
      ? '      tooltipSchemeColor: ${controller.tooltipSchemeColor},\n'
      : '';
  final String tooltipOpacity =
      controller.tooltipOpacity == 1.0 || controller.tooltipSchemeColor == null
          ? ''
          : '      tooltipOpacity: ${controller.tooltipOpacity},\n';
  //
  // Dialogs setup CODE
  //
  final String dialogBackgroundLightSchemeColor = controller
              .dialogBackgroundLightSchemeColor !=
          null
      ? '      dialogBackgroundSchemeColor: ${controller.dialogBackgroundLightSchemeColor},\n'
      : '';
  final String dialogBackgroundDarkSchemeColor = controller
              .dialogBackgroundDarkSchemeColor !=
          null
      ? '      dialogBackgroundSchemeColor: ${controller.dialogBackgroundDarkSchemeColor},\n'
      : '';
  final String useInputDecoratorThemeInDialogs = controller
          .useInputDecoratorThemeInDialogs
      ? '      useInputDecoratorThemeInDialogs: ${controller.useInputDecoratorThemeInDialogs},\n'
      : '';
  final String dialogRadius = controller.dialogBorderRadius != null
      ? '      dialogRadius: ${controller.dialogBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String adaptiveDialogRadius = controller.adaptiveResponseDialogRadius !=
              null &&
          controller.adaptiveResponseDialogRadius != AdaptiveResponse.off
      ? '      adaptiveDialogRadius: ${controller.adaptiveResponseDialogRadius!.code},\n'
      : '';
  final String dialogRadiusAdaptive = controller.dialogBorderRadiusAdaptive !=
              null &&
          controller.adaptiveResponseDialogRadius != null &&
          controller.adaptiveResponseDialogRadius != AdaptiveResponse.off
      ? '      dialogRadiusAdaptive: ${controller.dialogBorderRadiusAdaptive!.toStringAsFixed(1)},\n'
      : '';
  final String datePickerHeaderBackgroundSchemeColor = controller
              .datePickerHeaderBackgroundSchemeColor !=
          null
      ? '      datePickerHeaderBackgroundSchemeColor: ${controller.datePickerHeaderBackgroundSchemeColor},\n'
      : '';
  final String datePickerHeaderForegroundSchemeColor = controller
              .datePickerHeaderForegroundSchemeColor !=
          null
      ? '      datePickerHeaderForegroundSchemeColor: ${controller.datePickerHeaderForegroundSchemeColor},\n'
      : '';
  final String datePickerDividerSchemeColor = controller
              .datePickerDividerSchemeColor !=
          null
      ? '      datePickerDividerSchemeColor: ${controller.datePickerDividerSchemeColor},\n'
      : '';
  final String datePickerDialogRadius = controller
              .datePickerDialogBorderRadius !=
          null
      ? '      datePickerDialogRadius: ${controller.datePickerDialogBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String timePickerDialogRadius = controller
              .timePickerDialogBorderRadius !=
          null
      ? '      timePickerDialogRadius: ${controller.timePickerDialogBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String timePickerElementRadius = controller.timePickerElementRadius !=
          null
      ? '      timePickerElementRadius: ${controller.timePickerElementRadius!.toStringAsFixed(1)},\n'
      : '';
  final String dialogElevation = controller.dialogElevation != null
      ? '      dialogElevation: ${controller.dialogElevation!.toStringAsFixed(1)},\n'
      : '';
  //
  // AppBar setup CODE
  //
  final String appBarBackgroundSchemeColorLight = controller
              .appBarBackgroundSchemeColorLight !=
          null
      ? '      appBarBackgroundSchemeColor: ${controller.appBarBackgroundSchemeColorLight},\n'
      : '';
  final String appBarBackgroundSchemeColorDark = controller
              .appBarBackgroundSchemeColorDark !=
          null
      ? '      appBarBackgroundSchemeColor: ${controller.appBarBackgroundSchemeColorDark},\n'
      : '';
  final String appBarForegroundSchemeColorLight = controller
              .appBarForegroundSchemeColorLight !=
          null
      ? '      appBarForegroundSchemeColor: ${controller.appBarForegroundSchemeColorLight},\n'
      : '';
  final String appBarForegroundSchemeColorDark = controller
              .appBarForegroundSchemeColorDark !=
          null
      ? '      appBarForegroundSchemeColor: ${controller.appBarForegroundSchemeColorDark},\n'
      : '';

  final String appBarIconSchemeColorLight = controller
              .appBarIconSchemeColorLight !=
          null
      ? '      appBarIconSchemeColor: ${controller.appBarIconSchemeColorLight},\n'
      : '';
  final String appBarIconSchemeColorDark = controller
              .appBarIconSchemeColorDark !=
          null
      ? '      appBarIconSchemeColor: ${controller.appBarIconSchemeColorDark},\n'
      : '';
  final String appBarActionsIconSchemeColorLight = controller
              .appBarActionsIconSchemeColorLight !=
          null
      ? '      appBarActionsIconSchemeColor: ${controller.appBarActionsIconSchemeColorLight},\n'
      : '';
  final String appBarActionsIconSchemeColorDark = controller
              .appBarActionsIconSchemeColorDark !=
          null
      ? '      appBarActionsIconSchemeColor: ${controller.appBarActionsIconSchemeColorDark},\n'
      : '';

  final String appBarScrolledUnderElevationLight = controller
              .appBarScrolledUnderElevationLight !=
          null
      ? '      appBarScrolledUnderElevation: ${controller.appBarScrolledUnderElevationLight!.toStringAsFixed(1)},\n'
      : '';
  final String appBarScrolledUnderElevationDark = controller
              .appBarScrolledUnderElevationDark !=
          null
      ? '      appBarScrolledUnderElevation: ${controller.appBarScrolledUnderElevationDark!.toStringAsFixed(1)},\n'
      : '';
  final String appBarCenterTitle = controller.appBarCenterTitle != null
      ? '      appBarCenterTitle: ${controller.appBarCenterTitle},\n'
      : '';
  //
  // BottomAppBar setup CODE
  //
  final String bottomAppBarSchemeColorLight = controller
              .bottomAppBarSchemeColorLight !=
          null
      ? '      bottomAppBarSchemeColor: ${controller.bottomAppBarSchemeColorLight},\n'
      : '';
  final String bottomAppBarSchemeColorDark = controller
              .bottomAppBarSchemeColorDark !=
          null
      ? '      bottomAppBarSchemeColor: ${controller.bottomAppBarSchemeColorDark},\n'
      : '';
  final String bottomAppBarHeight = controller.bottomAppBarHeight != null
      ? '      bottomAppBarHeight: ${controller.bottomAppBarHeight},\n'
      : '';
  //
  // TabBar setup CODE
  //
  final String tabBarItemSchemeColorLight = controller
              .tabBarItemSchemeColorLight !=
          null
      ? '      tabBarItemSchemeColor: ${controller.tabBarItemSchemeColorLight},\n'
      : '';
  final String tabBarUnselectedItemSchemeColorLight = controller
                  .tabBarUnselectedItemSchemeColorLight !=
              null &&
          controller.tabBarItemSchemeColorLight != null
      ? '      tabBarUnselectedItemSchemeColor: ${controller.tabBarUnselectedItemSchemeColorLight},\n'
      : '';
  final String tabBarIndicatorSchemeColorLight = controller
              .tabBarIndicatorLight !=
          null
      ? '      tabBarIndicatorSchemeColor: ${controller.tabBarIndicatorLight},\n'
      : '';
  final String tabBarItemSchemeColorDark = controller
              .tabBarItemSchemeColorDark !=
          null
      ? '      tabBarItemSchemeColor: ${controller.tabBarItemSchemeColorDark},\n'
      : '';
  final String tabBarUnselectedItemSchemeColorDark = controller
                  .tabBarUnselectedItemSchemeColorDark !=
              null &&
          controller.tabBarItemSchemeColorDark != null
      ? '      tabBarUnselectedItemSchemeColor: ${controller.tabBarUnselectedItemSchemeColorDark},\n'
      : '';
  final String tabBarIndicatorSchemeColorDark = controller
              .tabBarIndicatorDark !=
          null
      ? '      tabBarIndicatorSchemeColor: ${controller.tabBarIndicatorDark},\n'
      : '';
  final String tabBarUnselectedItemOpacityLight = controller
              .tabBarUnselectedItemOpacityLight !=
          null
      ? '      tabBarUnselectedItemOpacity: ${controller.tabBarUnselectedItemOpacityLight!.toStringAsFixed(2)},\n'
      : '';
  final String tabBarUnselectedItemOpacityDark = controller
              .tabBarUnselectedItemOpacityDark !=
          null
      ? '      tabBarUnselectedItemOpacity: ${controller.tabBarUnselectedItemOpacityDark!.toStringAsFixed(2)},\n'
      : '';
  final String tabBarIndicatorSize = controller.tabBarIndicatorSize != null
      ? '      tabBarIndicatorSize: ${controller.tabBarIndicatorSize},\n'
      : '';
  final String tabBarIndicatorWeight = controller.tabBarIndicatorWeight != null
      ? '      tabBarIndicatorWeight: ${controller.tabBarIndicatorWeight},\n'
      : '';
  final String tabBarIndicatorTopRadius = controller.tabBarIndicatorTopRadius !=
          null
      ? '      tabBarIndicatorTopRadius: ${controller.tabBarIndicatorTopRadius},\n'
      : '';
  final String tabBarDividerColor = controller.tabBarDividerColor != null
      ? '      tabBarDividerColor: ${controller.tabBarDividerColor.toColorString()},\n'
      : '';
  final String tabBarTabAlignment = controller.tabBarTabAlignment != null
      ? '      tabBarTabAlignment: ${controller.tabBarTabAlignment},\n'
      : '';
  final String tabBarIndicatorAnimation = controller.tabBarIndicatorAnimation !=
          null
      ? '      tabBarIndicatorAnimation: ${controller.tabBarIndicatorAnimation},\n'
      : '';
  //
  // Drawers setup CODE
  //
  final String drawerBorderRadius = controller.drawerBorderRadius != null
      ? '      drawerRadius: ${controller.drawerBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String drawerElevation = controller.drawerElevation != null
      ? '      drawerElevation: ${controller.drawerElevation!.toStringAsFixed(1)},\n'
      : '';
  final String drawerBackgroundSchemeColor = controller
              .drawerBackgroundSchemeColor !=
          null
      ? '      drawerBackgroundSchemeColor: ${controller.drawerBackgroundSchemeColor},\n'
      : '';
  final String drawerWidth = controller.drawerWidth != null
      ? '      drawerWidth: ${controller.drawerWidth!.toStringAsFixed(1)},\n'
      : '';
  final String drawerIndicatorWidth = controller.drawerIndicatorWidth != null
      ? '      drawerIndicatorWidth: ${controller.drawerIndicatorWidth!.toStringAsFixed(1)},\n'
      : '';
  final String drawerIndicatorBorderRadius = controller
              .drawerIndicatorBorderRadius !=
          null
      ? '      drawerIndicatorRadius: ${controller.drawerIndicatorBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String drawerIndicatorSchemeColor = controller
              .drawerIndicatorSchemeColor !=
          null
      ? '      drawerIndicatorSchemeColor: ${controller.drawerIndicatorSchemeColor},\n'
      : '';
  final String drawerIndicatorOpacity = controller.drawerIndicatorOpacity !=
              null &&
          controller.drawerIndicatorOpacity != 1.0
      ? '      drawerIndicatorOpacity: ${controller.drawerIndicatorOpacity!.toStringAsFixed(1)},\n'
      : '';
  final String drawerSelectedItemSchemeColor = controller
              .drawerSelectedItemSchemeColor !=
          null
      ? '      drawerSelectedItemSchemeColor: ${controller.drawerSelectedItemSchemeColor},\n'
      : '';
  final String drawerUnselectedItemSchemeColor = controller
              .drawerUnselectedItemSchemeColor !=
          null
      ? '      drawerUnselectedItemSchemeColor: ${controller.drawerUnselectedItemSchemeColor},\n'
      : '';
  //
  // BottomNavigationBar setup CODE
  //
  final String bottomNavigationBarSelectedLabelSchemeColor = controller
              .bottomNavigationBarSelectedItemSchemeColor !=
          null
      ? '      bottomNavigationBarSelectedLabelSchemeColor: ${controller.bottomNavigationBarSelectedItemSchemeColor},\n'
      : '';
  final String bottomNavigationBarUnselectedLabelSchemeColor = controller
              .bottomNavigationBarUnselectedItemSchemeColor !=
          null
      ? '      bottomNavigationBarUnselectedLabelSchemeColor: ${controller.bottomNavigationBarUnselectedItemSchemeColor},\n'
      : '';
  final String bottomNavigationBarMutedUnselectedLabel = controller
              .bottomNavigationBarMuteUnselectedItem !=
          null
      ? '      bottomNavigationBarMutedUnselectedLabel: ${controller.bottomNavigationBarMuteUnselectedItem},\n'
      : '';
  final String bottomNavigationBarSelectedIconSchemeColor = controller
              .bottomNavigationBarSelectedItemSchemeColor !=
          null
      ? '      bottomNavigationBarSelectedIconSchemeColor: ${controller.bottomNavigationBarSelectedItemSchemeColor},\n'
      : '';
  final String bottomNavigationBarUnselectedIconSchemeColor = controller
              .bottomNavigationBarUnselectedItemSchemeColor !=
          null
      ? '      bottomNavigationBarUnselectedIconSchemeColor: ${controller.bottomNavigationBarUnselectedItemSchemeColor},\n'
      : '';
  final String bottomNavigationBarMutedUnselectedIcon = controller
              .bottomNavigationBarMuteUnselectedItem !=
          null
      ? '      bottomNavigationBarMutedUnselectedIcon: ${controller.bottomNavigationBarMuteUnselectedItem},\n'
      : '';
  final String bottomNavigationBarBackgroundSchemeColor = controller
              .bottomNavigationBarBackgroundSchemeColor !=
          null
      ? '      bottomNavigationBarBackgroundSchemeColor: ${controller.bottomNavigationBarBackgroundSchemeColor},\n'
      : '';
  final String bottomNavigationBarOpacity = controller
                  .bottomNavigationBarOpacity !=
              1 &&
          controller.bottomNavigationBarOpacity != null
      ? '      bottomNavigationBarOpacity: ${controller.bottomNavigationBarOpacity!.toStringAsFixed(2)},\n'
      : '';
  final String bottomNavigationBarElevation = controller
              .bottomNavigationBarElevation !=
          null
      ? '      bottomNavigationBarElevation: ${controller.bottomNavigationBarElevation!.toStringAsFixed(1)},\n'
      : '';
  final String bottomNavigationBarShowSelectedLabels = controller
          .bottomNavigationBarShowSelectedLabels
      ? ''
      : '      bottomNavigationBarShowSelectedLabels: ${controller.bottomNavigationBarShowSelectedLabels},\n';
  final String bottomNavigationBarShowUnselectedLabels = controller
          .bottomNavigationBarShowUnselectedLabels
      ? ''
      : '      bottomNavigationBarShowUnselectedLabels: ${controller.bottomNavigationBarShowUnselectedLabels},\n';
  final String bottomNavigationBarSelectedLabelSize = controller
              .bottomNavigationBarSelectedLabelSize !=
          null
      ? '      bottomNavigationBarSelectedLabelSize: ${controller.bottomNavigationBarSelectedLabelSize!.toStringAsFixed(0)},\n'
      : '';
  final String bottomNavigationBarUnselectedLabelSize = controller
              .bottomNavigationBarUnselectedLabelSize !=
          null
      ? '      bottomNavigationBarUnselectedLabelSize: ${controller.bottomNavigationBarUnselectedLabelSize!.toStringAsFixed(0)},\n'
      : '';
  final String bottomNavigationBarSelectedIconSize = controller
              .bottomNavigationBarSelectedIconSize !=
          null
      ? '      bottomNavigationBarSelectedIconSize: ${controller.bottomNavigationBarSelectedIconSize!.toStringAsFixed(0)},\n'
      : '';
  final String bottomNavigationBarUnselectedIconSize = controller
              .bottomNavigationBarUnselectedIconSize !=
          null
      ? '      bottomNavigationBarUnselectedIconSize: ${controller.bottomNavigationBarUnselectedIconSize!.toStringAsFixed(0)},\n'
      : '';
  //
  // Menu and MenuBar setup CODE
  //
  final String menuRadius = controller.menuRadius != null
      ? '      menuRadius: ${controller.menuRadius!.toStringAsFixed(1)},\n'
      : '';
  final String menuElevation = controller.menuElevation != null
      ? '      menuElevation: ${controller.menuElevation!.toStringAsFixed(1)},\n'
      : '';
  final String menuSchemeColor = controller.menuSchemeColor != null
      ? '      menuSchemeColor: ${controller.menuSchemeColor},\n'
      : '';
  final String menuOpacity = controller.menuOpacity != null &&
          controller.menuOpacity != 1
      ? '      menuOpacity: ${controller.menuOpacity!.toStringAsFixed(2)},\n'
      : '';
  final String menuPadding = controller.menuPaddingStart != null ||
          controller.menuPaddingEnd != null ||
          controller.menuPaddingTop != null ||
          controller.menuPaddingBottom != null
      ? '      menuPadding: EdgeInsetsDirectional.fromSTEB('
          '${controller.menuPaddingStart ?? 0}, '
          '${controller.menuPaddingTop ?? 0}, '
          '${controller.menuPaddingEnd ?? 0}, '
          '${controller.menuPaddingBottom ?? 0}),\n'
      : '';
  //
  final String menuBarBackgroundSchemeColor = controller
              .menuBarBackgroundSchemeColor !=
          null
      ? '      menuBarBackgroundSchemeColor: ${controller.menuBarBackgroundSchemeColor},\n'
      : '';
  final String menuBarRadius = controller.menuBarRadius != null
      ? '      menuBarRadius: ${controller.menuBarRadius!.toStringAsFixed(1)},\n'
      : '';
  final String menuBarElevation = controller.menuBarElevation != null
      ? '      menuBarElevation: ${controller.menuBarElevation!.toStringAsFixed(1)},\n'
      : '';
  final String menuBarShadowColor = controller.menuBarShadowColor != null
      ? '      menuBarShadowColor: ${controller.menuBarShadowColor.toColorString()},\n'
      : '';
  //
  final String menuItemBackgroundSchemeColor = controller
              .menuItemBackgroundSchemeColor !=
          null
      ? '      menuItemBackgroundSchemeColor: ${controller.menuItemBackgroundSchemeColor},\n'
      : '';
  final String menuItemForegroundSchemeColor = controller
              .menuItemForegroundSchemeColor !=
          null
      ? '      menuItemForegroundSchemeColor: ${controller.menuItemForegroundSchemeColor},\n'
      : '';
  final String menuIndicatorBackgroundSchemeColor = controller
              .menuIndicatorBackgroundSchemeColor !=
          null
      ? '      menuIndicatorBackgroundSchemeColor: ${controller.menuIndicatorBackgroundSchemeColor},\n'
      : '';
  final String menuIndicatorForegroundSchemeColor = controller
              .menuIndicatorForegroundSchemeColor !=
          null
      ? '      menuIndicatorForegroundSchemeColor: ${controller.menuIndicatorForegroundSchemeColor},\n'
      : '';
  final String menuIndicatorRadius = controller.menuIndicatorRadius != null
      ? '      menuIndicatorRadius: ${controller.menuIndicatorRadius!.toStringAsFixed(1)},\n'
      : '';
  //
  // SearchBar and SearchView setup CODE
  //
  final String searchBarBackgroundSchemeColor = controller
              .searchBackgroundSchemeColor !=
          null
      ? '      searchBarBackgroundSchemeColor: ${controller.searchBackgroundSchemeColor!},\n'
      : '';
  final String searchViewBackgroundSchemeColor = controller
              .searchBackgroundSchemeColor !=
          null
      ? '      searchViewBackgroundSchemeColor: ${controller.searchBackgroundSchemeColor!},\n'
      : '';
  final String searchBarElevation = controller.searchElevation != null
      ? '      searchBarElevation: ${controller.searchElevation!.toStringAsFixed(1)},\n'
      : '';
  final String searchViewElevation = controller.searchElevation != null
      ? '      searchViewElevation: ${controller.searchElevation!.toStringAsFixed(1)},\n'
      : '';
  final String searchBarRadius = controller.searchRadius != null
      ? '      searchBarRadius: ${controller.searchRadius!.toStringAsFixed(1)},\n'
      : '';
  final String searchViewRadius = controller.searchRadius != null
      ? '      searchViewRadius: ${controller.searchRadius!.toStringAsFixed(1)},\n'
      : '';
  final String searchViewHeaderHeight = controller.searchViewHeaderHeight !=
          null
      ? '      searchViewHeaderHeight: ${controller.searchViewHeaderHeight!.toStringAsFixed(1)},\n'
      : '';
  final String searchUseGlobalShape = controller.searchUseGlobalShape
      ? '      searchUseGlobalShape: ${controller.searchUseGlobalShape},\n'
      : '';
  //
  // NavigationBar setup CODE
  //
  final String navigationBarSelectedLabelSchemeColor = controller
              .navigationBarSelectedLabelSchemeColor !=
          null
      ? '      navigationBarSelectedLabelSchemeColor: ${controller.navigationBarSelectedLabelSchemeColor},\n'
      : '';
  final String navigationBarUnselectedLabelSchemeColor = controller
              .navigationBarUnselectedItemSchemeColor !=
          null
      ? '      navigationBarUnselectedLabelSchemeColor: ${controller.navigationBarUnselectedItemSchemeColor},\n'
      : '';
  final String navigationBarMutedUnselectedLabel = controller
          .navigationBarMuteUnselectedItem
      ? '      navigationBarMutedUnselectedLabel: ${controller.navigationBarMuteUnselectedItem},\n'
      : '';

  final String navigationBarSelectedIconSchemeColor = controller
              .navigationBarSelectedIconSchemeColor !=
          null
      ? '      navigationBarSelectedIconSchemeColor: ${controller.navigationBarSelectedIconSchemeColor},\n'
      : '';
  final String navigationBarUnselectedIconSchemeColor = controller
              .navigationBarUnselectedItemSchemeColor !=
          null
      ? '      navigationBarUnselectedIconSchemeColor: ${controller.navigationBarUnselectedItemSchemeColor},\n'
      : '';
  final String navigationBarMutedUnselectedIcon = controller
          .navigationBarMuteUnselectedItem
      ? '      navigationBarMutedUnselectedIcon: ${controller.navigationBarMuteUnselectedItem},\n'
      : '';

  final String navigationBarIndicatorSchemeColor = controller
              .navigationBarIndicatorSchemeColor !=
          null
      ? '      navigationBarIndicatorSchemeColor: ${controller.navigationBarIndicatorSchemeColor},\n'
      : '';
  final String navigationBarIndicatorOpacity = controller
                  .navigationBarIndicatorOpacity !=
              null &&
          controller.navigationBarIndicatorOpacity != 1.0
      ? '      navigationBarIndicatorOpacity: ${controller.navigationBarIndicatorOpacity!.toStringAsFixed(2)},\n'
      : '';
  final String navigationBarIndicatorRadius = controller
              .navigationBarIndicatorBorderRadius !=
          null
      ? '      navigationBarIndicatorRadius: ${controller.navigationBarIndicatorBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String navigationBarBackgroundSchemeColor = controller
              .navigationBarBackgroundSchemeColor !=
          null
      ? '      navigationBarBackgroundSchemeColor: ${controller.navigationBarBackgroundSchemeColor},\n'
      : '';
  final String navigationBarOpacity = controller.navigationBarOpacity != 1 &&
          controller.navigationBarOpacity != null
      ? '      navigationBarOpacity: ${controller.navigationBarOpacity!.toStringAsFixed(2)},\n'
      : '';
  final String navigationBarElevation = controller.navigationBarElevation !=
          null
      ? '      navigationBarElevation: ${controller.navigationBarElevation!.toStringAsFixed(1)},\n'
      : '';
  final String navigationBarHeight = controller.navigationBarHeight != null
      ? '      navigationBarHeight: ${controller.navigationBarHeight!.toStringAsFixed(1)},\n'
      : '';
  final String navigationBarLabelBehavior = controller
              .navigationBarLabelBehavior !=
          NavigationDestinationLabelBehavior.alwaysShow
      ? '      navigationBarLabelBehavior: ${controller.navigationBarLabelBehavior},\n'
      : '';
  final String navigationBarSelectedLabelSize = controller
              .navigationBarSelectedLabelSize !=
          null
      ? '      navigationBarSelectedLabelSize: ${controller.navigationBarSelectedLabelSize!.toStringAsFixed(0)},\n'
      : '';
  final String navigationBarUnselectedLabelSize = controller
              .navigationBarUnselectedLabelSize !=
          null
      ? '      navigationBarUnselectedLabelSize: ${controller.navigationBarUnselectedLabelSize!.toStringAsFixed(0)},\n'
      : '';
  final String navigationBarSelectedIconSize = controller
              .navigationBarSelectedIconSize !=
          null
      ? '      navigationBarSelectedIconSize: ${controller.navigationBarSelectedIconSize!.toStringAsFixed(0)},\n'
      : '';
  final String navigationBarUnselectedIconSize = controller
              .navigationBarUnselectedIconSize !=
          null
      ? '      navigationBarUnselectedIconSize: ${controller.navigationBarUnselectedIconSize!.toStringAsFixed(0)},\n'
      : '';
  final String adaptiveRemoveNavigationBarTintLight = controller
                  .adaptiveRemoveNavigationBarTintLight !=
              null &&
          controller.adaptiveRemoveNavigationBarTintLight !=
              AdaptiveResponse.off &&
          controller.useMaterial3
      ? '      adaptiveRemoveNavigationBarTint: ${controller.adaptiveRemoveNavigationBarTintLight!.code},\n'
      : '';
  final String adaptiveRemoveNavigationBarTintDark = controller
                  .adaptiveRemoveNavigationBarTintDark !=
              null &&
          controller.adaptiveRemoveNavigationBarTintDark !=
              AdaptiveResponse.off &&
          controller.useMaterial3
      ? '      adaptiveRemoveNavigationBarTint: ${controller.adaptiveRemoveNavigationBarTintDark!.code},\n'
      : '';
  //
  // NavigationRail setup CODE
  //
  final String navigationRailSelectedLabelSchemeColor = controller
              .navigationRailSelectedLabelSchemeColor !=
          null
      ? '      navigationRailSelectedLabelSchemeColor: ${controller.navigationRailSelectedLabelSchemeColor},\n'
      : '';
  final String navigationRailUnselectedLabelSchemeColor = controller
              .navigationRailUnselectedItemSchemeColor !=
          null
      ? '      navigationRailUnselectedLabelSchemeColor: ${controller.navigationRailUnselectedItemSchemeColor},\n'
      : '';
  final String navigationRailMutedUnselectedLabel = controller
          .navigationRailMuteUnselectedItem
      ? '      navigationRailMutedUnselectedLabel: ${controller.navigationRailMuteUnselectedItem},\n'
      : '';
  final String navigationRailSelectedIconSchemeColor = controller
              .navigationRailSelectedIconSchemeColor !=
          null
      ? '      navigationRailSelectedIconSchemeColor: ${controller.navigationRailSelectedIconSchemeColor},\n'
      : '';
  final String navigationRailUnselectedIconSchemeColor = controller
              .navigationRailUnselectedItemSchemeColor !=
          null
      ? '      navigationRailUnselectedIconSchemeColor: ${controller.navigationRailUnselectedItemSchemeColor},\n'
      : '';
  final String navigationRailMutedUnselectedIcon = controller
          .navigationRailMuteUnselectedItem
      ? '      navigationRailMutedUnselectedIcon: ${controller.navigationRailMuteUnselectedItem},\n'
      : '';
  final String navigationRailUseIndicator =
      '      navigationRailUseIndicator: ${controller.navigationRailUseIndicator},\n';
  final String navigationRailIndicatorSchemeColor = controller
                  .navigationRailIndicatorSchemeColor !=
              null &&
          controller.navigationRailUseIndicator
      ? '      navigationRailIndicatorSchemeColor: ${controller.navigationRailIndicatorSchemeColor},\n'
      : '';
  final String navigationRailIndicatorOpacity = controller
                  .navigationRailIndicatorOpacity !=
              null &&
          !(controller.navigationRailIndicatorSchemeColor == null &&
              controller.navigationRailUseIndicator)
      ? '      navigationRailIndicatorOpacity: ${controller.navigationRailIndicatorOpacity!.toStringAsFixed(2)},\n'
      : '';
  final String navigationRailIndicatorRadius = controller
              .navigationRailIndicatorBorderRadius !=
          null
      ? '      navigationRailIndicatorRadius: ${controller.navigationRailIndicatorBorderRadius!.toStringAsFixed(1)},\n'
      : '';
  final String navigationRailBackgroundSchemeColor = controller
              .navigationRailBackgroundSchemeColor !=
          null
      ? '      navigationRailBackgroundSchemeColor: ${controller.navigationRailBackgroundSchemeColor},\n'
      : '';
  final String navigationRailOpacity = controller.navigationRailOpacity != 1 &&
          controller.navigationRailOpacity != null
      ? '      navigationRailOpacity: ${controller.navigationRailOpacity!.toStringAsFixed(2)},\n'
      : '';
  final String navigationRailElevation = controller.navigationRailElevation !=
              null &&
          controller.navigationRailElevation != 0
      ? '      navigationRailElevation: ${controller.navigationRailElevation!.toStringAsFixed(1)},\n'
      : '';
  final String navigationRailLabelType = controller.navigationRailLabelType !=
          NavigationRailLabelType.none
      ? '      navigationRailLabelType: ${controller.navigationRailLabelType},\n'
      : '';
  final String navigationRailSelectedLabelSize = controller
              .navigationRailSelectedLabelSize !=
          null
      ? '      navigationRailSelectedLabelSize: ${controller.navigationRailSelectedLabelSize!.toStringAsFixed(0)},\n'
      : '';
  final String navigationRailUnselectedLabelSize = controller
              .navigationRailUnselectedLabelSize !=
          null
      ? '      navigationRailUnselectedLabelSize: ${controller.navigationRailUnselectedLabelSize!.toStringAsFixed(0)},\n'
      : '';
  final String navigationRailSelectedIconSize = controller
              .navigationRailSelectedIconSize !=
          null
      ? '      navigationRailSelectedIconSize: ${controller.navigationRailSelectedIconSize!.toStringAsFixed(0)},\n'
      : '';
  final String navigationRailUnselectedIconSize = controller
              .navigationRailUnselectedIconSize !=
          null
      ? '      navigationRailUnselectedIconSize: ${controller.navigationRailUnselectedIconSize!.toStringAsFixed(0)},\n'
      : '';
  final String navigationRailGroupAlignment = controller
                  .navigationRailGroupAlignment !=
              null &&
          controller.navigationRailGroupAlignment != -1.0
      ? '      navigationRailGroupAlignment: ${controller.navigationRailGroupAlignment!.toStringAsFixed(2)},\n'
      : '';
  final String navigationRailMinWidth = controller.navigationRailMinWidth !=
          null
      ? '      navigationRailMinWidth: ${controller.navigationRailMinWidth!.toStringAsFixed(0)},\n'
      : '';
  final String navigationRailMinExtendedWidth = controller
              .navigationRailMinExtendedWidth !=
          null
      ? '      navigationRailMinExtendedWidth: ${controller.navigationRailMinExtendedWidth!.toStringAsFixed(0)},\n'
      : '';
  //
  // Compose the sub themes from above fragments.
  // Order attempts to be in same order as they appear in the large
  // FlexSubThemesData class.
  String lightSubTheme = controller.useSubThemes
      ? '    subThemesData: const FlexSubThemesData(\n'
          '$interactionEffects'
          '$tintedDisabledControls'
          '$blendOnLevelLight'
          '$blendLightOnColors'
          '$scaffoldBackgroundLightBaseColor'
          '$scaffoldBackgroundLightSchemeColor'
          //
          // TODO(rydmike): Commented as part of blendTextTheme deprecation.
          // '$blendLightTextTheme'
          '$useMaterial3Typography'
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
          '$adaptiveRadius'
          '$adaptiveDialogRadius'
          '$adaptiveInputDecoratorRadius'
          //
          '$defaultRadius'
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
          '$toggleButtonsSelectedForegroundSchemeColor'
          '$toggleButtonsUnselectedSchemeColor'
          '$toggleButtonsBorderSchemeColor'
          '$toggleButtonsBorderWidth'
          //
          '$segmentedButtonBorderRadius'
          '$segmentedButtonSchemeColor'
          '$segmentedButtonSelectedForegroundSchemeColor'
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
          '$sliderThumbSchemeColor'
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
          '$inputDecoratorRadius'
          '$inputDecoratorRadiusAdaptive'
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
          '$listTileSelectedSchemeColor'
          '$listTileIconSchemeColor'
          '$listTileTextSchemeColor'
          '$listTileTileSchemeColor'
          '$listTileSelectedTileSchemeColor'
          '$listTileContentPadding'
          '$listTileHorizontalTitleGap'
          '$listTileMinVerticalPadding'
          '$listTileStyle'
          '$listTileTitleAlignment'
          //
          '$fabUseShape'
          '$fabAlwaysCircular'
          '$fabBorderRadius'
          '$fabSchemeColor'
          '$fabForegroundSchemeColor'
          //
          '$chipSchemeColor'
          '$chipSelectedSchemeColor'
          '$chipSecondarySelectedSchemeColor'
          '$chipDeleteIconSchemeColor'
          '$chipBlendColors'
          '$chipBorderRadius'
          '$chipFontSize'
          '$chipIconSize'
          '$chipPadding'
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
          '$dialogRadius'
          '$dialogRadiusAdaptive'
          '$useInputDecoratorThemeInDialogs'
          //
          '$timePickerDialogRadius'
          '$timePickerElementRadius'
          //
          '$datePickerDialogRadius'
          '$datePickerHeaderBackgroundSchemeColor'
          '$datePickerHeaderForegroundSchemeColor'
          '$datePickerDividerSchemeColor'
          //
          '$snackBarRadius'
          '$snackBarElevation'
          '$snackBarBackgroundSchemeColor'
          '$snackBarActionSchemeColor'
          //
          '$appBarBackgroundSchemeColorLight'
          '$appBarForegroundSchemeColorLight'
          '$appBarIconSchemeColorLight'
          '$appBarActionsIconSchemeColorLight'
          '$appBarScrolledUnderElevationLight'
          '$appBarCenterTitle'
          //
          '$bottomAppBarSchemeColorLight'
          '$bottomAppBarHeight'
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
          '$tabBarIndicatorAnimation'
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
          '$bottomSheetClipBehavior'
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
          '$bottomNavigationBarSelectedLabelSize'
          '$bottomNavigationBarUnselectedLabelSize'
          '$bottomNavigationBarSelectedIconSize'
          '$bottomNavigationBarUnselectedIconSize'
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
          '$searchBarBackgroundSchemeColor'
          '$searchViewBackgroundSchemeColor'
          '$searchBarElevation'
          '$searchViewElevation'
          '$searchBarRadius'
          '$searchViewRadius'
          '$searchViewHeaderHeight'
          '$searchUseGlobalShape'
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
          '$navigationBarSelectedLabelSize'
          '$navigationBarUnselectedLabelSize'
          '$navigationBarSelectedIconSize'
          '$navigationBarUnselectedIconSize'
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
          '$navigationRailSelectedLabelSize'
          '$navigationRailUnselectedLabelSize'
          '$navigationRailSelectedIconSize'
          '$navigationRailUnselectedIconSize'
          '$navigationRailGroupAlignment'
          '$navigationRailMinWidth'
          '$navigationRailMinExtendedWidth'
          //
          '    ),\n'
      : '';
  String darkSubTheme = controller.useSubThemes
      ? '    subThemesData: const FlexSubThemesData(\n'
          '$interactionEffects'
          '$tintedDisabledControls'
          '$blendOnLevelDark'
          '$blendDarkOnColors'
          '$scaffoldBackgroundDarkBaseColor'
          '$scaffoldBackgroundDarkSchemeColor'
          //
          // TODO(rydmike): Commented as part of blendTextTheme deprecation.
          // '$blendDarkTextTheme'
          '$useMaterial3Typography'
          '$useM2StyleDividerInM3'
          //
          '$adaptiveSplash'
          '$splashType'
          '$splashTypeAdaptive'
          //
          '$adaptiveRemoveElevationTintDark'
          '$adaptiveElevationShadowsBackDark'
          '$adaptiveAppBarScrollUnderOffDark'
          '$adaptiveRadius'
          '$adaptiveDialogRadius'
          '$adaptiveInputDecoratorRadius'
          //
          '$defaultRadius'
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
          '$toggleButtonsSelectedForegroundSchemeColor'
          '$toggleButtonsUnselectedSchemeColor'
          '$toggleButtonsBorderSchemeColor'
          '$toggleButtonsBorderWidth'
          //
          '$segmentedButtonBorderRadius'
          '$segmentedButtonSchemeColor'
          '$segmentedButtonSelectedForegroundSchemeColor'
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
          '$sliderThumbSchemeColor'
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
          '$inputDecoratorRadius'
          '$inputDecoratorRadiusAdaptive'
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
          '$listTileSelectedSchemeColor'
          '$listTileIconSchemeColor'
          '$listTileTextSchemeColor'
          '$listTileTileSchemeColor'
          '$listTileSelectedTileSchemeColor'
          '$listTileContentPadding'
          '$listTileHorizontalTitleGap'
          '$listTileMinVerticalPadding'
          '$listTileStyle'
          '$listTileTitleAlignment'
          //
          '$fabUseShape'
          '$fabAlwaysCircular'
          '$fabBorderRadius'
          '$fabSchemeColor'
          '$fabForegroundSchemeColor'
          //
          '$chipSchemeColor'
          '$chipSelectedSchemeColor'
          '$chipSecondarySelectedSchemeColor'
          '$chipDeleteIconSchemeColor'
          '$chipBlendColors'
          '$chipBorderRadius'
          '$chipFontSize'
          '$chipIconSize'
          '$chipPadding'
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
          '$dialogRadius'
          '$dialogRadiusAdaptive'
          '$useInputDecoratorThemeInDialogs'
          //
          '$timePickerDialogRadius'
          '$timePickerElementRadius'
          //
          '$datePickerDialogRadius'
          '$datePickerHeaderBackgroundSchemeColor'
          '$datePickerHeaderForegroundSchemeColor'
          '$datePickerDividerSchemeColor'
          //
          '$snackBarRadius'
          '$snackBarElevation'
          '$snackBarBackgroundSchemeColor'
          '$snackBarActionSchemeColor'
          //
          '$appBarBackgroundSchemeColorDark'
          '$appBarForegroundSchemeColorDark'
          '$appBarIconSchemeColorDark'
          '$appBarActionsIconSchemeColorDark'
          '$appBarScrolledUnderElevationDark'
          '$appBarCenterTitle'
          //
          '$bottomAppBarSchemeColorDark'
          '$bottomAppBarHeight'
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
          '$tabBarIndicatorAnimation'
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
          '$bottomSheetClipBehavior'
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
          '$bottomNavigationBarSelectedLabelSize'
          '$bottomNavigationBarUnselectedLabelSize'
          '$bottomNavigationBarSelectedIconSize'
          '$bottomNavigationBarUnselectedIconSize'
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
          '$searchBarBackgroundSchemeColor'
          '$searchViewBackgroundSchemeColor'
          '$searchBarElevation'
          '$searchViewElevation'
          '$searchBarRadius'
          '$searchViewRadius'
          '$searchViewHeaderHeight'
          '$searchUseGlobalShape'
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
          '$navigationBarSelectedLabelSize'
          '$navigationBarUnselectedLabelSize'
          '$navigationBarSelectedIconSize'
          '$navigationBarUnselectedIconSize'
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
          '$navigationRailSelectedLabelSize'
          '$navigationRailUnselectedLabelSize'
          '$navigationRailSelectedIconSize'
          '$navigationRailUnselectedIconSize'
          '$navigationRailGroupAlignment'
          '$navigationRailMinWidth'
          '$navigationRailMinExtendedWidth'
          '    ),\n'
      : '';
  // Make a prettier version of the constructor if we have default one.
  if (lightSubTheme == '    subThemesData: const FlexSubThemesData(\n  ),\n') {
    lightSubTheme = '    subThemesData: const FlexSubThemesData(),\n';
  }
  if (darkSubTheme == '    subThemesData: const FlexSubThemesData(\n  ),\n') {
    darkSubTheme = '    subThemesData: const FlexSubThemesData(),\n';
  }
  if (lightSubTheme != '') {
    lightSubTheme = '    // Component theme configurations for light mode.\n'
        '$lightSubTheme';
  }
  if (darkSubTheme != '') {
    darkSubTheme = '    // Component theme configurations for dark mode.\n'
        '$darkSubTheme';
  }

  //
  // Define code for key color usage and tones.
  final String useSecondary = controller.useSecondary
      ? '      useSecondary: ${controller.useSecondary},\n'
      : '';
  final String useTertiary = controller.useTertiary
      ? '      useTertiary: ${controller.useTertiary},\n'
      : '';
  final String useError =
      controller.useError ? '      useError: ${controller.useError},\n' : '';
  final String keepPrimary = controller.keepPrimary
      ? '      keepPrimary: ${controller.keepPrimary},\n'
      : '';
  final String keepSecondary = controller.keepSecondary
      ? '      keepSecondary: ${controller.keepSecondary},\n'
      : '';
  final String keepTertiary = controller.keepTertiary
      ? '      keepTertiary: ${controller.keepTertiary},\n'
      : '';
  final String keepError =
      controller.keepError ? '      keepError: ${controller.keepError},\n' : '';
  final String keepPrimaryContainer = controller.keepPrimaryContainer
      ? '      keepPrimaryContainer: ${controller.keepPrimaryContainer},\n'
      : '';
  final String keepSecondaryContainer = controller.keepSecondaryContainer
      ? '      keepSecondaryContainer: ${controller.keepSecondaryContainer},\n'
      : '';
  final String keepTertiaryContainer = controller.keepTertiaryContainer
      ? '      keepTertiaryContainer: ${controller.keepTertiaryContainer},\n'
      : '';
  final String keepErrorContainer = controller.keepErrorContainer
      ? '      keepErrorContainer: ${controller.keepErrorContainer},\n'
      : '';
  final String keepDarkPrimary = controller.keepDarkPrimary
      ? '      keepPrimary: ${controller.keepDarkPrimary},\n'
      : '';
  final String keepDarkSecondary = controller.keepDarkSecondary
      ? '      keepSecondary: ${controller.keepDarkSecondary},\n'
      : '';
  final String keepDarkTertiary = controller.keepDarkTertiary
      ? '      keepTertiary: ${controller.keepDarkTertiary},\n'
      : '';
  final String keepDarkError = controller.keepDarkError
      ? '      keepError: ${controller.keepDarkError},\n'
      : '';
  final String keepDarkPrimaryContainer = controller.keepDarkPrimaryContainer
      ? '      keepPrimaryContainer: ${controller.keepDarkPrimaryContainer},\n'
      : '';
  final String keepDarkSecondaryContainer = controller
          .keepDarkSecondaryContainer
      ? '      keepSecondaryContainer: ${controller.keepDarkSecondaryContainer},\n'
      : '';
  final String keepDarkTertiaryContainer = controller.keepDarkTertiaryContainer
      ? '      keepTertiaryContainer: ${controller.keepDarkTertiaryContainer},\n'
      : '';
  final String keepDarkErrorContainer = controller.keepDarkErrorContainer
      ? '      keepErrorContainer: ${controller.keepDarkErrorContainer},\n'
      : '';

  final String contrastLevel = controller.dynamicContrastLevel != 0 &&
          FlexSchemeVariant.values[controller.usedFlexToneSetup].isFlutterScheme
      ? '      contrastLevel: ${controller.dynamicContrastLevel},\n'
      : '';

  final String useExpressiveOnContainerColors = controller.expressiveOnContainer
      ? '      useExpressiveOnContainerColors: ${controller.expressiveOnContainer},\n'
      : '';

  final String useLegacyMonochromeSeedBehavior = controller
          .useLegacyMonochromeSeedBehavior
      ? '      useLegacyMonochromeSeedBehavior: ${controller.useLegacyMonochromeSeedBehavior},\n'
      : '';

  String useKeyColorsLight = controller.useKeyColors
      ? '    keyColors: const FlexKeyColors(\n'
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
          '$useExpressiveOnContainerColors'
          '$useLegacyMonochromeSeedBehavior'
          '    ),\n'
      : '';
  String useKeyColorsDark = controller.useKeyColors
      ? '    keyColors: const FlexKeyColors(\n'
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
          '$useLegacyMonochromeSeedBehavior'
          '    ),\n'
      : '';
  // Make a prettier version of the constructor if that is all we got.
  if (useKeyColorsLight == '    keyColors: const FlexKeyColors(\n  ),\n') {
    useKeyColorsLight = '    keyColors: const FlexKeyColors(),\n';
  }
  if (useKeyColorsDark == '    keyColors: const FlexKeyColors(\n  ),\n') {
    useKeyColorsDark = '    keyColors: const FlexKeyColors(),\n';
  }
  // Add comment line for seed generation if we have key colors.
  if (useKeyColorsLight != '') {
    useKeyColorsLight =
        '    // ColorScheme seed generation configuration for light mode.\n'
        '$useKeyColorsLight';
  }
  if (useKeyColorsDark != '') {
    useKeyColorsDark =
        '    // ColorScheme seed configuration setup for dark mode.\n'
        '$useKeyColorsDark';
  }
  //
  // Codegen for Flex Tones and Variants.
  //
  String flexTonesLight = '';
  String flexTonesDark = '';
  if (controller.useKeyColors) {
    final String variantType =
        FlexSchemeVariant.values[controller.usedFlexToneSetup].isFlutterScheme
            ? '    variant: '
            : '    tones: ';
    final String variantTypeTonesLight =
        FlexSchemeVariant.values[controller.usedFlexToneSetup].isFlutterScheme
            ? ''
            : '\n        .tones(Brightness.light)';
    final String variantTypeTonesDark =
        FlexSchemeVariant.values[controller.usedFlexToneSetup].isFlutterScheme
            ? ''
            : '\n        .tones(Brightness.dark)';

    if (controller.usedFlexToneSetup > 0) {
      flexTonesLight = '${variantType}FlexSchemeVariant.'
          '${FlexSchemeVariant.values[controller.usedFlexToneSetup].name}'
          '$variantTypeTonesLight';
      flexTonesDark = '${variantType}FlexSchemeVariant.'
          '${FlexSchemeVariant.values[controller.usedFlexToneSetup].name}'
          '$variantTypeTonesDark';
    }

    final String higherContrastFixed = controller.higherContrastFixed
        ? '\n        .higherContrastFixed()'
        : '';
    final String monochromeSurfacesLight = controller.useMonoSurfacesLight
        ? '\n        .monochromeSurfaces()'
        : '';
    final String onMainsUseBWLight =
        controller.onMainsUseBWLight ? '\n        .onMainsUseBW()' : '';
    final String onSurfacesUseBWLight =
        controller.onSurfacesUseBWLight ? '\n        .onSurfacesUseBW()' : '';
    final String surfacesUseBWLight =
        controller.surfacesUseBWLight ? '\n        .surfacesUseBW()' : '';

    final String monochromeSurfacesDark =
        controller.useMonoSurfacesDark ? '\n        .monochromeSurfaces()' : '';
    final String onMainsUseBWDark =
        controller.onMainsUseBWDark ? '\n        .onMainsUseBW()' : '';
    final String onSurfacesUseBWDark =
        controller.onSurfacesUseBWDark ? '\n        .onSurfacesUseBW()' : '';
    final String surfacesUseBWDark =
        controller.surfacesUseBWDark ? '\n        .surfacesUseBW()' : '';

    if (!FlexSchemeVariant
        .values[controller.usedFlexToneSetup].isFlutterScheme) {
      flexTonesLight = '$flexTonesLight$higherContrastFixed'
          '$monochromeSurfacesLight$onMainsUseBWLight$onSurfacesUseBWLight'
          '$surfacesUseBWLight';
      flexTonesDark = '$flexTonesDark$higherContrastFixed'
          '$monochromeSurfacesDark$onMainsUseBWDark$onSurfacesUseBWDark'
          '$surfacesUseBWDark';
    }
    if (flexTonesLight != '') flexTonesLight = '$flexTonesLight,\n';
    if (flexTonesDark != '') flexTonesDark = '$flexTonesDark,\n';
  }

  // Make section comment strings only if its sections members are not empty.
  final String colorModifiersConcatLight = '$usedColors'
      '$useM3ErrorColors'
      '$swapLegacyOnMaterial3'
      '$swapLightColors';
  final String headerColorModifiersLight =
      colorModifiersConcatLight == '' ? '' : '    // Input color modifiers.\n';

  final String colorModifiersConcatDark = '$usedColors'
      '$useM3ErrorColors'
      '$swapLegacyOnMaterial3'
      '$swapDarkColors';
  final String headerColorModifiersDark =
      colorModifiersConcatDark == '' ? '' : '    // Input color modifiers.\n';

  final String surfaceColorAdjustmentsLight = '$surfaceModeLight'
      '$blendLevel'
      '$tintLightColor'
      '$lightIsWhite';
  final String headerSurfaceColorAdjustmentsLight =
      surfaceColorAdjustmentsLight == ''
          ? ''
          : '    // Surface color adjustments.\n';

  final String surfaceColorAdjustmentsDark = '$surfaceModeDark'
      '$blendLevelDark'
      '$tintDarkColor'
      '$darkIsTrueBlack';
  final String headerSurfaceColorAdjustmentsDark =
      surfaceColorAdjustmentsDark == ''
          ? ''
          : '    // Surface color adjustments.\n';

  final String conveniencePropsLight = '$appBarStyleLight'
      '$appBarOpacityLight'
      '$transparentStatusBar'
      '$appBarElevationLight'
      '$tabBarStyle'
      '$bottomAppBarElevationLight'
      '$tooltipsMatchBackground';
  final String headerConveniencePropsLight = conveniencePropsLight == ''
      ? ''
      : '    // Convenience direct styling properties.\n';

  final String conveniencePropsDark = '$appBarStyleDark'
      '$appBarOpacityDark'
      '$transparentStatusBar'
      '$appBarElevationDark'
      '$tabBarStyle'
      '$bottomAppBarElevationDark'
      '$tooltipsMatchBackground';
  final String headerConveniencePropsDark = conveniencePropsDark == ''
      ? ''
      : '    // Convenience direct styling properties.\n';

  final String directThemeDataPropsLight = '$visualDensity'
      '$materialTapTargetSize'
      '$applyToAllCupertino'
      '$useMaterial3';
  final String headerDirectThemeDataPropsLight = directThemeDataPropsLight == ''
      ? ''
      : '    // Direct ThemeData properties.\n';

  final String directThemeDataPropsDark = '$visualDensity'
      '$materialTapTargetSize'
      '$applyToAllCupertino'
      '$useMaterial3';
  final String headerDirectThemeDataPropsDark = directThemeDataPropsDark == ''
      ? ''
      : '    // Direct ThemeData properties.\n';

  //
  // Compose the final FlexThemeData code string, from all above fragments.
  //
  final String code =
      "import 'package:flex_color_scheme/flex_color_scheme.dart';\n"
      "import 'package:flutter/cupertino.dart';\n"
      "import 'package:flutter/material.dart';\n"
      '/// The [AppTheme] defines light and dark themes for the app.\n'
      '///\n'
      '/// Theme setup for FlexColorScheme package v${App.versionMajor}.\n'
      '/// Use same major flex_color_scheme package version. If you use a\n'
      '/// lower minor version, some properties may not be supported.\n'
      '/// In that case, remove them after copying this theme to your\n'
      '/// app or upgrade the package to version ${App.version}.\n'
      '///\n'
      '/// Use it in a [MaterialApp] like this:\n'
      '///\n'
      '/// MaterialApp(\n'
      '///   theme: AppTheme.light,\n'
      '///   darkTheme: AppTheme.dark,\n'
      '/// );\n'
      'abstract final class AppTheme {\n'
      '  // The FlexColorScheme defined light mode ThemeData.\n'
      '  static ThemeData light = FlexThemeData.light(\n'
      '$lightScheme'
      '$headerColorModifiersLight' // Input color modifiers
      '$usedColors'
      '$useM3ErrorColors'
      '$swapLegacyOnMaterial3'
      '$swapLightColors'
      '$fixedColorStyle'
      '$headerSurfaceColorAdjustmentsLight' // Surface color adjustments
      '$surfaceModeLight'
      '$blendLevel'
      '$tintLightColor'
      '$lightIsWhite'
      '$headerConveniencePropsLight' // Convenience direct styling properties
      '$appBarStyleLight'
      '$appBarOpacityLight'
      '$transparentStatusBar'
      '$appBarElevationLight'
      '$tabBarStyle'
      '$bottomAppBarElevationLight'
      '$tooltipsMatchBackground'
      '$lightSubTheme'
      '$useKeyColorsLight'
      '$flexTonesLight'
      '$headerDirectThemeDataPropsLight' // Direct ThemeData properties
      '$visualDensity'
      '$materialTapTargetSize'
      '$applyToAllCupertino'
      '$useMaterial3'
      '  );\n'
      '\n'
      '  // The FlexColorScheme defined dark mode ThemeData.\n'
      '  static ThemeData dark = FlexThemeData.dark(\n'
      '$darkScheme'
      '$headerColorModifiersDark' // Input color modifiers
      '$usedColors'
      '$useM3ErrorColors'
      '$swapLegacyOnMaterial3'
      '$swapDarkColors'
      '$fixedColorStyle'
      '$headerSurfaceColorAdjustmentsDark' // Surface color adjustments
      '$surfaceModeDark'
      '$blendLevelDark'
      '$tintDarkColor'
      '$darkIsTrueBlack'
      '$headerConveniencePropsDark' // Convenience direct styling properties
      '$appBarStyleDark'
      '$appBarOpacityDark'
      '$transparentStatusBar'
      '$appBarElevationDark'
      '$bottomAppBarElevationDark'
      '$tabBarStyle'
      '$tooltipsMatchBackground'
      '$darkSubTheme'
      '$useKeyColorsDark'
      '$flexTonesDark'
      '$headerDirectThemeDataPropsDark' // Direct ThemeData properties
      '$visualDensity'
      '$materialTapTargetSize'
      '$applyToAllCupertino'
      '$useMaterial3'
      '  );\n'
      '}\n';
  return code;
}
