import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WITH: FlexSubThemes.dialogTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes Dialog tests
    // -------------------------------------------------------------------------
    test(
        'Dialog FST9.1: GIVEN a default FlexSubTheme.dialogTheme() '
        'EXPECT equal to DialogTheme() version with same values', () {
      expect(
        FlexSubThemes.dialogTheme(),
        equals(
          const DialogThemeData(
            elevation: 6,
            actionsPadding: EdgeInsets.only(
              left: 24.0,
              right: 24.0,
              bottom: 24.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(28)),
            ),
          ),
        ),
      );
    });
    test(
        'Dialog FST9.2 background-based-a: GIVEN a FlexSubTheme.dialogTheme '
        'with no '
        'colorScheme, but with backgroundSchemeColor and backgroundColor '
        'EXPECT equal to DialogTheme with backgroundColor', () {
      expect(
        FlexSubThemes.dialogTheme(
          colorScheme: null,
          backgroundColor: const Color(0xFF343476),
          backgroundSchemeColor: SchemeColor.tertiary,
        ),
        equals(
          const DialogThemeData(
            backgroundColor: Color(0xFF343476),
            elevation: 6,
            actionsPadding: EdgeInsets.only(
              left: 24.0,
              right: 24.0,
              bottom: 24.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(28)),
            ),
          ),
        ),
      );
    });
    test(
        'Dialog FST9.3 background-based-b: GIVEN a FlexSubTheme.dialogTheme '
        'with no backgroundSchemeColor and backgroundColor '
        'EXPECT equal to DialogTheme with backgroundColor', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.dialogTheme(
          colorScheme: colorScheme,
          backgroundColor: const Color(0xFFDDDDDD),
          backgroundSchemeColor: null,
        ),
        equals(
          const DialogThemeData(
            backgroundColor: Color(0xFFDDDDDD),
            elevation: 6,
            actionsPadding: EdgeInsets.only(
              left: 24.0,
              right: 24.0,
              bottom: 24.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(28)),
            ),
          ),
        ),
      );
    });
    test(
        'Dialog FST9.4 scheme-based: GIVEN a FlexSubTheme.dialogTheme '
        'with backgroundSchemeColor and no backgroundColor '
        'EXPECT equal to DialogTheme with backgroundSchemeColor', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.dialogTheme(
          colorScheme: colorScheme,
          backgroundColor: null,
          backgroundSchemeColor: SchemeColor.tertiary,
        ),
        equals(
          DialogThemeData(
            backgroundColor: colorScheme.tertiary,
            actionsPadding: const EdgeInsets.only(
              left: 24.0,
              right: 24.0,
              bottom: 24.0,
            ),
            elevation: 6,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(28)),
            ),
          ),
        ),
      );
    });
    test(
        'Dialog FST9.5 custom: GIVEN a custom FlexSubTheme.dialogTheme() '
        'EXPECT equal to DialogTheme() version with same values', () {
      expect(
        FlexSubThemes.dialogTheme(
          elevation: 10,
          radius: 6,
          actionsPadding: const EdgeInsets.only(
            left: 12.0,
            right: 6.0,
            bottom: 20.0,
          ),
        ),
        equals(
          const DialogThemeData(
            elevation: 10,
            actionsPadding: EdgeInsets.only(
              left: 12.0,
              right: 6.0,
              bottom: 20.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
          ),
        ),
      );
    });
  });
}
