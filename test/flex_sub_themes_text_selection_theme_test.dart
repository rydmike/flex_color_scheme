import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: deprecated_member_use_from_same_package, for tests.

void main() {
  group('WITH: FlexSubThemes.textSelectionTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes textSelectionTheme tests
    // -------------------------------------------------------------------------
    test(
        'TextSelection FST32.1: GIVEN a FlexSubTheme.textSelectionTheme() '
        'EXPECT equal to equivalent TextSelectionThemeData().', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      TextSelectionThemeData textSelection = FlexSubThemes.textSelectionTheme(
        colorScheme: colorScheme,
      );
      expect(
        textSelection,
        equals(
          TextSelectionThemeData(
            cursorColor: colorScheme.primary,
            selectionColor: colorScheme.primary.withValues(alpha: 0.4),
            selectionHandleColor: colorScheme.primary,
          ),
        ),
      );
      //
      textSelection = FlexSubThemes.textSelectionTheme(
        colorScheme: colorScheme,
        cursorSchemeColor: SchemeColor.tertiary,
        selectionSchemeColor: SchemeColor.secondary,
        selectionOpacity: 0.3,
        selectionHandleSchemeColor: SchemeColor.onPrimaryContainer,
      );
      expect(
        textSelection,
        equals(
          TextSelectionThemeData(
            cursorColor: colorScheme.tertiary,
            selectionColor: colorScheme.secondary.withValues(alpha: 0.3),
            selectionHandleColor: colorScheme.onPrimaryContainer,
          ),
        ),
      );
      textSelection = FlexSubThemes.textSelectionTheme(
        colorScheme: colorScheme,
        cursorSchemeColor: SchemeColor.tertiary,
        selectionSchemeColor: SchemeColor.secondary,
        selectionHandleSchemeColor: SchemeColor.onPrimaryContainer,
        selectionHandleCustomColor: const Color(0xFFEEDDCC),
      );
      expect(
        textSelection,
        equals(
          TextSelectionThemeData(
            cursorColor: colorScheme.tertiary,
            selectionColor: colorScheme.secondary.withValues(alpha: 0.4),
            selectionHandleColor: const Color(0xFFEEDDCC),
          ),
        ),
      );
    });
  });
}
