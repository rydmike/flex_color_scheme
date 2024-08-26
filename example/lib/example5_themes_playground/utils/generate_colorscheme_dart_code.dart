import 'package:flutter/material.dart';

import '../../shared/const/app.dart';
import '../../shared/controllers/theme_controller.dart';
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
  primary: ${lightScheme.primary},
  onPrimary: ${lightScheme.onPrimary},
  primaryContainer: ${lightScheme.primaryContainer},
  onPrimaryContainer: ${lightScheme.onPrimaryContainer},
  primaryFixed: ${lightScheme.primaryFixed},
  primaryFixedDim: ${lightScheme.primaryFixedDim},
  onPrimaryFixed: ${lightScheme.onPrimaryFixed},
  onPrimaryFixedVariant: ${lightScheme.onPrimaryFixedVariant},
  secondary: ${lightScheme.secondary},
  onSecondary: ${lightScheme.onSecondary},
  secondaryContainer: ${lightScheme.secondaryContainer},
  onSecondaryContainer: ${lightScheme.onSecondaryContainer},
  secondaryFixed: ${lightScheme.secondaryFixed},
  secondaryFixedDim: ${lightScheme.secondaryFixedDim},
  onSecondaryFixed: ${lightScheme.onSecondaryFixed},
  onSecondaryFixedVariant: ${lightScheme.onSecondaryFixedVariant},
  tertiary: ${lightScheme.tertiary},
  onTertiary: ${lightScheme.onTertiary},
  tertiaryContainer: ${lightScheme.tertiaryContainer},
  onTertiaryContainer: ${lightScheme.onTertiaryContainer},
  tertiaryFixed: ${lightScheme.tertiaryFixed},
  tertiaryFixedDim: ${lightScheme.tertiaryFixedDim},
  onTertiaryFixed: ${lightScheme.onTertiaryFixed},
  onTertiaryFixedVariant: ${lightScheme.onTertiaryFixedVariant},
  error: ${lightScheme.error},
  onError: ${lightScheme.onError},
  errorContainer: ${lightScheme.errorContainer},
  onErrorContainer: ${lightScheme.onErrorContainer},
  surface: ${lightScheme.surface},
  onSurface: ${lightScheme.onSurface},
  surfaceDim: ${lightScheme.surfaceDim},
  surfaceBright: ${lightScheme.surfaceBright},
  surfaceContainerLowest: ${lightScheme.surfaceContainerLowest},
  surfaceContainerLow: ${lightScheme.surfaceContainerLow},
  surfaceContainer: ${lightScheme.surfaceContainer},
  surfaceContainerHigh: ${lightScheme.surfaceContainerHigh},
  surfaceContainerHighest: ${lightScheme.surfaceContainerHighest},
  onSurfaceVariant: ${lightScheme.onSurfaceVariant},
  outline: ${lightScheme.outline},
  outlineVariant: ${lightScheme.outlineVariant},
  shadow: ${lightScheme.shadow},
  scrim: ${lightScheme.scrim},
  inverseSurface: ${lightScheme.inverseSurface},
  onInverseSurface: ${lightScheme.onInverseSurface},
  inversePrimary: ${lightScheme.inversePrimary},
  surfaceTint: ${lightScheme.surfaceTint},
);

/// Dark [ColorScheme] made with FlexColorScheme v${App.version}.
/// Requires Flutter 3.22.0 or later.
const ColorScheme darkColorScheme = ColorScheme(
  brightness: ${darkScheme.brightness},
  primary: ${darkScheme.primary},
  onPrimary: ${darkScheme.onPrimary},
  primaryContainer: ${darkScheme.primaryContainer},
  onPrimaryContainer: ${darkScheme.onPrimaryContainer},
  primaryFixed: ${darkScheme.primaryFixed},
  primaryFixedDim: ${darkScheme.primaryFixedDim},
  onPrimaryFixed: ${darkScheme.onPrimaryFixed},
  onPrimaryFixedVariant: ${darkScheme.onPrimaryFixedVariant},
  secondary: ${darkScheme.secondary},
  onSecondary: ${darkScheme.onSecondary},
  secondaryContainer: ${darkScheme.secondaryContainer},
  onSecondaryContainer: ${darkScheme.onSecondaryContainer},
  secondaryFixed: ${darkScheme.secondaryFixed},
  secondaryFixedDim: ${darkScheme.secondaryFixedDim},
  onSecondaryFixed: ${darkScheme.onSecondaryFixed},
  onSecondaryFixedVariant: ${darkScheme.onSecondaryFixedVariant},
  tertiary: ${darkScheme.tertiary},
  onTertiary: ${darkScheme.onTertiary},
  tertiaryContainer: ${darkScheme.tertiaryContainer},
  onTertiaryContainer: ${darkScheme.onTertiaryContainer},
  tertiaryFixed: ${darkScheme.tertiaryFixed},
  tertiaryFixedDim: ${darkScheme.tertiaryFixedDim},
  onTertiaryFixed: ${darkScheme.onTertiaryFixed},
  onTertiaryFixedVariant: ${darkScheme.onTertiaryFixedVariant},
  error: ${darkScheme.error},
  onError: ${darkScheme.onError},
  errorContainer: ${darkScheme.errorContainer},
  onErrorContainer: ${darkScheme.onErrorContainer},
  surface: ${darkScheme.surface},
  onSurface: ${darkScheme.onSurface},
  surfaceDim: ${darkScheme.surfaceDim},
  surfaceBright: ${darkScheme.surfaceBright},
  surfaceContainerLowest: ${darkScheme.surfaceContainerLowest},
  surfaceContainerLow: ${darkScheme.surfaceContainerLow},
  surfaceContainer: ${darkScheme.surfaceContainer},
  surfaceContainerHigh: ${darkScheme.surfaceContainerHigh},
  surfaceContainerHighest: ${darkScheme.surfaceContainerHighest},
  onSurfaceVariant: ${darkScheme.onSurfaceVariant},
  outline: ${darkScheme.outline},
  outlineVariant: ${darkScheme.outlineVariant},
  shadow: ${darkScheme.shadow},
  scrim: ${darkScheme.scrim},
  inverseSurface: ${darkScheme.inverseSurface},
  onInverseSurface: ${darkScheme.onInverseSurface},
  inversePrimary: ${darkScheme.inversePrimary},
  surfaceTint: ${darkScheme.surfaceTint},
);
''';
  return code;
}
