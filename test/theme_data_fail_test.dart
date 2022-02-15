import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // These tests are really for the Flutter SDK gap in the
  // ElevationOverlay.applyOverlay function. See issue:
  // https://github.com/flutter/flutter/issues/90353
  // For more information. Tests are added here to cover the usage gap to
  // see if it might change one day.

  group('Test ThemeData Equality', () {
    final ThemeData themeA = ThemeData.from(
      colorScheme: const ColorScheme.dark(),
    ).copyWith(
        focusColor: Colors.black.withOpacity(0.3),
        hoverColor: Colors.black.withOpacity(0.5));
    final ThemeData themeB = ThemeData.from(
      colorScheme: const ColorScheme.dark(),
    ).copyWith(
        focusColor: Colors.black.withOpacity(0.3),
        hoverColor: Colors.black.withOpacity(0.5));
    test('Expect equal ThemeData to have toString equality', () {
      expect(
        themeA.toString(),
        equalsIgnoringHashCodes(themeB.toString()),
      );
    });
    test('Expect equal ThemeData to be equal', () {
      expect(
        themeA,
        equals(themeB),
      );
    });
  });
}
