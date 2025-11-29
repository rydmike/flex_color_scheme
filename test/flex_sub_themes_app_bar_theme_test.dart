import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WITH: FlexSubThemes.appBarTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes appBarTheme tests
    // -------------------------------------------------------------------------
    //
    // The AppBar theme is for now only pass through to the normal
    // Flutter AppBar theme. All the logic and complexity is included in
    // FlexColorScheme.toTheme factory and included in its tests. No need
    // to test it here, but included as a stub for potential future additions.
    test(
        'AppBar FST1.1: GIVEN a default FlexSubTheme.appBarTheme() '
        'EXPECT equal to AppBarTheme with shape RoundedRectangleBorder()', () {
      expect(
        FlexSubThemes.appBarTheme(),
        equals(const AppBarThemeData(shape: RoundedRectangleBorder())),
      );
    });
  });
}
