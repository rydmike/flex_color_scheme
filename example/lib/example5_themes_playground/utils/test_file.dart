import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

/// The [AppTheme] defines light and dark themes for the app
///
/// Use in MaterialApp like this:
///
/// ```dart
/// MaterialApp(
///  theme: AppTheme.light,
///  darkTheme: AppTheme.dark,
///  themeMode: ThemeMode.system,
/// ```
sealed class AppTheme {
  // The defined light theme.
  static ThemeData light = FlexThemeData.light(scheme: FlexScheme.material);
  // The defined dark theme.
  static ThemeData dark = FlexThemeData.dark(scheme: FlexScheme.material);
}
