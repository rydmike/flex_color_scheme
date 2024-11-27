import 'package:flutter/material.dart';

import '../../shared/const/app.dart';
import '../../shared/controllers/theme_controller.dart';
import '../../shared/utils/color_string.dart';
import '../theme/flex_theme_dark.dart';
import '../theme/flex_theme_light.dart';

/// Function that returns the current light and dark ColorScheme as
/// a Dart Flutter code String.
String generateColorSchemeDartCode(
  ThemeController controller,
) {
  final ColorScheme lightScheme =
      flexColorSchemeLight(controller, Colors.black).toScheme;

  final ColorScheme darkScheme =
      flexColorSchemeDark(controller, Colors.black).toScheme;

  final String code = '''
/// Light [ColorScheme] made with FlexColorScheme v${App.version}.
/// Requires Flutter 3.22.0 or later.
const ColorScheme lightColorScheme = ColorScheme(
  brightness: ${lightScheme.brightness},
  primary: ${lightScheme.primary.toColorString()},
  onPrimary: ${lightScheme.onPrimary.toColorString()},
  primaryContainer: ${lightScheme.primaryContainer.toColorString()},
  onPrimaryContainer: ${lightScheme.onPrimaryContainer.toColorString()},
  primaryFixed: ${lightScheme.primaryFixed.toColorString()},
  primaryFixedDim: ${lightScheme.primaryFixedDim.toColorString()},
  onPrimaryFixed: ${lightScheme.onPrimaryFixed.toColorString()},
  onPrimaryFixedVariant: ${lightScheme.onPrimaryFixedVariant.toColorString()},
  secondary: ${lightScheme.secondary.toColorString()},
  onSecondary: ${lightScheme.onSecondary.toColorString()},
  secondaryContainer: ${lightScheme.secondaryContainer.toColorString()},
  onSecondaryContainer: ${lightScheme.onSecondaryContainer.toColorString()},
  secondaryFixed: ${lightScheme.secondaryFixed.toColorString()},
  secondaryFixedDim: ${lightScheme.secondaryFixedDim.toColorString()},
  onSecondaryFixed: ${lightScheme.onSecondaryFixed.toColorString()},
  onSecondaryFixedVariant: ${lightScheme.onSecondaryFixedVariant.toColorString()},
  tertiary: ${lightScheme.tertiary.toColorString()},
  onTertiary: ${lightScheme.onTertiary.toColorString()},
  tertiaryContainer: ${lightScheme.tertiaryContainer.toColorString()},
  onTertiaryContainer: ${lightScheme.onTertiaryContainer.toColorString()},
  tertiaryFixed: ${lightScheme.tertiaryFixed.toColorString()},
  tertiaryFixedDim: ${lightScheme.tertiaryFixedDim.toColorString()},
  onTertiaryFixed: ${lightScheme.onTertiaryFixed.toColorString()},
  onTertiaryFixedVariant: ${lightScheme.onTertiaryFixedVariant.toColorString()},
  error: ${lightScheme.error.toColorString()},
  onError: ${lightScheme.onError.toColorString()},
  errorContainer: ${lightScheme.errorContainer.toColorString()},
  onErrorContainer: ${lightScheme.onErrorContainer.toColorString()},
  surface: ${lightScheme.surface.toColorString()},
  onSurface: ${lightScheme.onSurface.toColorString()},
  surfaceDim: ${lightScheme.surfaceDim.toColorString()},
  surfaceBright: ${lightScheme.surfaceBright.toColorString()},
  surfaceContainerLowest: ${lightScheme.surfaceContainerLowest.toColorString()},
  surfaceContainerLow: ${lightScheme.surfaceContainerLow.toColorString()},
  surfaceContainer: ${lightScheme.surfaceContainer.toColorString()},
  surfaceContainerHigh: ${lightScheme.surfaceContainerHigh.toColorString()},
  surfaceContainerHighest: ${lightScheme.surfaceContainerHighest.toColorString()},
  onSurfaceVariant: ${lightScheme.onSurfaceVariant.toColorString()},
  outline: ${lightScheme.outline.toColorString()},
  outlineVariant: ${lightScheme.outlineVariant.toColorString()},
  shadow: ${lightScheme.shadow.toColorString()},
  scrim: ${lightScheme.scrim.toColorString()},
  inverseSurface: ${lightScheme.inverseSurface.toColorString()},
  onInverseSurface: ${lightScheme.onInverseSurface.toColorString()},
  inversePrimary: ${lightScheme.inversePrimary.toColorString()},
  surfaceTint: ${lightScheme.surfaceTint.toColorString()},
);

/// Dark [ColorScheme] made with FlexColorScheme v${App.version}.
/// Requires Flutter 3.22.0 or later.
const ColorScheme darkColorScheme = ColorScheme(
  brightness: ${darkScheme.brightness},
  primary: ${darkScheme.primary.toColorString()},
  onPrimary: ${darkScheme.onPrimary.toColorString()},
  primaryContainer: ${darkScheme.primaryContainer.toColorString()},
  onPrimaryContainer: ${darkScheme.onPrimaryContainer.toColorString()},
  primaryFixed: ${darkScheme.primaryFixed.toColorString()},
  primaryFixedDim: ${darkScheme.primaryFixedDim.toColorString()},
  onPrimaryFixed: ${darkScheme.onPrimaryFixed.toColorString()},
  onPrimaryFixedVariant: ${darkScheme.onPrimaryFixedVariant.toColorString()},
  secondary: ${darkScheme.secondary.toColorString()},
  onSecondary: ${darkScheme.onSecondary.toColorString()},
  secondaryContainer: ${darkScheme.secondaryContainer.toColorString()},
  onSecondaryContainer: ${darkScheme.onSecondaryContainer.toColorString()},
  secondaryFixed: ${darkScheme.secondaryFixed.toColorString()},
  secondaryFixedDim: ${darkScheme.secondaryFixedDim.toColorString()},
  onSecondaryFixed: ${darkScheme.onSecondaryFixed.toColorString()},
  onSecondaryFixedVariant: ${darkScheme.onSecondaryFixedVariant.toColorString()},
  tertiary: ${darkScheme.tertiary.toColorString()},
  onTertiary: ${darkScheme.onTertiary.toColorString()},
  tertiaryContainer: ${darkScheme.tertiaryContainer.toColorString()},
  onTertiaryContainer: ${darkScheme.onTertiaryContainer.toColorString()},
  tertiaryFixed: ${darkScheme.tertiaryFixed.toColorString()},
  tertiaryFixedDim: ${darkScheme.tertiaryFixedDim.toColorString()},
  onTertiaryFixed: ${darkScheme.onTertiaryFixed.toColorString()},
  onTertiaryFixedVariant: ${darkScheme.onTertiaryFixedVariant.toColorString()},
  error: ${darkScheme.error.toColorString()},
  onError: ${darkScheme.onError.toColorString()},
  errorContainer: ${darkScheme.errorContainer.toColorString()},
  onErrorContainer: ${darkScheme.onErrorContainer.toColorString()},
  surface: ${darkScheme.surface.toColorString()},
  onSurface: ${darkScheme.onSurface.toColorString()},
  surfaceDim: ${darkScheme.surfaceDim.toColorString()},
  surfaceBright: ${darkScheme.surfaceBright.toColorString()},
  surfaceContainerLowest: ${darkScheme.surfaceContainerLowest.toColorString()},
  surfaceContainerLow: ${darkScheme.surfaceContainerLow.toColorString()},
  surfaceContainer: ${darkScheme.surfaceContainer.toColorString()},
  surfaceContainerHigh: ${darkScheme.surfaceContainerHigh.toColorString()},
  surfaceContainerHighest: ${darkScheme.surfaceContainerHighest.toColorString()},
  onSurfaceVariant: ${darkScheme.onSurfaceVariant.toColorString()},
  outline: ${darkScheme.outline.toColorString()},
  outlineVariant: ${darkScheme.outlineVariant.toColorString()},
  shadow: ${darkScheme.shadow.toColorString()},
  scrim: ${darkScheme.scrim.toColorString()},
  inverseSurface: ${darkScheme.inverseSurface.toColorString()},
  onInverseSurface: ${darkScheme.onInverseSurface.toColorString()},
  inversePrimary: ${darkScheme.inversePrimary.toColorString()},
  surfaceTint: ${darkScheme.surfaceTint.toColorString()},
);
''';
  return code;
}
