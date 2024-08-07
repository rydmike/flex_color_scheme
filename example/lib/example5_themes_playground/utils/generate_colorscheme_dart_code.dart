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
// Light and dark ColorSchemes made by FlexColorScheme v${App.packageVersion}.
// These ColorScheme objects require Flutter 3.7 or later.
const ColorScheme flexSchemeLight = ColorScheme(
  brightness: ${lightScheme.brightness},
  primary: ${lightScheme.primary},
  onPrimary: ${lightScheme.onPrimary},
  primaryContainer: ${lightScheme.primaryContainer},
  onPrimaryContainer: ${lightScheme.onPrimaryContainer},
  secondary: ${lightScheme.secondary},
  onSecondary: ${lightScheme.onSecondary},
  secondaryContainer: ${lightScheme.secondaryContainer},
  onSecondaryContainer: ${lightScheme.onSecondaryContainer},
  tertiary: ${lightScheme.tertiary},
  onTertiary: ${lightScheme.onTertiary},
  tertiaryContainer: ${lightScheme.tertiaryContainer},
  onTertiaryContainer: ${lightScheme.onTertiaryContainer},
  error: ${lightScheme.error},
  onError: ${lightScheme.onError},
  errorContainer: ${lightScheme.errorContainer},
  onErrorContainer: ${lightScheme.onErrorContainer},
  surface: ${lightScheme.surface},
  onSurface: ${lightScheme.onSurface},
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

const ColorScheme flexSchemeDark = ColorScheme(
  brightness: ${darkScheme.brightness},
  primary: ${darkScheme.primary},
  onPrimary: ${darkScheme.onPrimary},
  primaryContainer: ${darkScheme.primaryContainer},
  onPrimaryContainer: ${darkScheme.onPrimaryContainer},
  secondary: ${darkScheme.secondary},
  onSecondary: ${darkScheme.onSecondary},
  secondaryContainer: ${darkScheme.secondaryContainer},
  onSecondaryContainer: ${darkScheme.onSecondaryContainer},
  tertiary: ${darkScheme.tertiary},
  onTertiary: ${darkScheme.onTertiary},
  tertiaryContainer: ${darkScheme.tertiaryContainer},
  onTertiaryContainer: ${darkScheme.onTertiaryContainer},
  error: ${darkScheme.error},
  onError: ${darkScheme.onError},
  errorContainer: ${darkScheme.errorContainer},
  onErrorContainer: ${darkScheme.onErrorContainer},
  surface: ${darkScheme.surface},
  onSurface: ${darkScheme.onSurface},
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
