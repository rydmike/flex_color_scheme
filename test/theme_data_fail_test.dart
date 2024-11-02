import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // These tests are really for the Flutter SDK gap in the
  // ElevationOverlay.applyOverlay function. See issue:
  // https://github.com/flutter/flutter/issues/90353
  // For more information. Tests are added here to cover the usage gap to
  // see if it might change one day.

  group('ThemeData Equality Check basics', () {
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
    test('Same ThemeData() empty factory is equal', () {
      final ThemeData td1 = ThemeData();
      final ThemeData td2 = ThemeData();
      expect(td1, equals(td2));
    });
  });
  group('ThemeData equality checks, component themes', () {
    test('Same ThemeData with AppBar elevation theme is equal', () {
      final ThemeData td1 = ThemeData(
        appBarTheme: const AppBarTheme(elevation: 0),
      );
      final ThemeData td2 = ThemeData(
        appBarTheme: const AppBarTheme(elevation: 0),
      );
      expect(td1, equals(td2));
    });
    // TODO(rydmike): This test is failing equality test, but it should not.
    //  This will be fixed when Flutter stops usings callback for WidgetState
    //  properties. This test is here to monitor that and will fail when
    //  Flutter has moved to this new feature:
    //  Related issue: https://github.com/flutter/flutter/issues/89127
    //  And new feature PR: https://github.com/flutter/flutter/pull/154695
    test('Same ThemeData with TextButtonThemeData styleFrom theme is NOT equal',
        () {
      final ThemeData td1 = ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(elevation: 1),
        ),
      );
      final ThemeData td2 = ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(elevation: 1),
        ),
      );
      expect(td1, isNot(td2));
    });
  });
}
