import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WITH: FlexSubThemes.bottomAppBarTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes bottomAppBarTheme tests
    // -------------------------------------------------------------------------
    test(
        'BottomAppBar FST2.1: GIVEN a FlexSubTheme.bottomAppBarTheme() '
        'EXPECT equal to BottomAppBarTheme() with same config', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.dark,
      );
      expect(
        FlexSubThemes.bottomAppBarTheme(
          colorScheme: colorScheme,
          backgroundSchemeColor: SchemeColor.surfaceContainer,
        ),
        equals(BottomAppBarThemeData(color: colorScheme.surfaceContainer)),
      );
    });
    test(
        'BottomAppBar FST2.2: GIVEN a FlexSubTheme.bottomAppBarTheme() M3 '
        'EXPECT equal to BottomAppBarTheme() with same config', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.dark,
      );
      expect(
        FlexSubThemes.bottomAppBarTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
        ),
        equals(const BottomAppBarThemeData()),
      );
    });
  });
}
