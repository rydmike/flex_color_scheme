// google_fonts still returns package:flutter/material.dart TextTheme.
// ignore: migrate_design_widgets
import 'package:flutter/material.dart' as fm show TextTheme;
import 'package:material_ui/material_ui.dart';

// TODO(rydmike): Remove this adapter when google_fonts uses material_ui.
// Last checked google_fonts 8.2.1, which still uses
// package:flutter/material.dart.

/// Copies a Google Fonts [TextTheme] into a `material_ui` [TextTheme].
///
/// `google_fonts` still types [TextTheme] against
/// `package:flutter/material.dart`, which is a different class than
/// `package:material_ui`'s [TextTheme]. [TextStyle] is shared, so copying
/// the styles is type-safe.
TextTheme textThemeFromGoogleFonts(fm.TextTheme theme) {
  return TextTheme(
    displayLarge: theme.displayLarge,
    displayMedium: theme.displayMedium,
    displaySmall: theme.displaySmall,
    headlineLarge: theme.headlineLarge,
    headlineMedium: theme.headlineMedium,
    headlineSmall: theme.headlineSmall,
    titleLarge: theme.titleLarge,
    titleMedium: theme.titleMedium,
    titleSmall: theme.titleSmall,
    bodyLarge: theme.bodyLarge,
    bodyMedium: theme.bodyMedium,
    bodySmall: theme.bodySmall,
    labelLarge: theme.labelLarge,
    labelMedium: theme.labelMedium,
    labelSmall: theme.labelSmall,
  );
}
