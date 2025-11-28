import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: deprecated_member_use_from_same_package, for tests.

void main() {
  group('WITH: FlexSubThemes.snackBarTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes SnackBar tests
    // -------------------------------------------------------------------------
    test(
        'SnackBar FST28.1: GIVEN a default FlexSubTheme.snackBarTheme '
        'EXPECT equal to SnackBarThemeData() version '
        'with same values', () {
      expect(
        FlexSubThemes.snackBarTheme().toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          SnackBarThemeData(
            elevation: 4,
            actionTextColor: Colors.grey[500],
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'SnackBar FST28.2 background-based-a: GIVEN a '
        'FlexSubTheme.snackBarTheme with '
        'colorScheme, but with backgroundSchemeColor and backgroundColor '
        'EXPECT equal to SnackBarThemeData with backgroundColor', () {
      expect(
        FlexSubThemes.snackBarTheme(
          elevation: 10,
          colorScheme: null,
          backgroundColor: const Color(0xFF343476),
          backgroundSchemeColor: SchemeColor.tertiary,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          SnackBarThemeData(
            backgroundColor: const Color(0xFF343476),
            elevation: 10,
            contentTextStyle: ThemeData().textTheme.titleMedium!.copyWith(
                  color: Colors.white,
                ),
            actionTextColor: Colors.white.withAlpha(0xDD),
            disabledActionTextColor: Colors.white.withAlpha(0x11),
            closeIconColor: Colors.white.withAlpha(0xAA),
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'SnackBar FST28.3 background-based-b: GIVEN a '
        'FlexSubTheme.snackBarTheme with '
        'no colorScheme, no backgroundSchemeColor, but with backgroundColor '
        'EXPECT equal to SnackBarThemeData with backgroundColor', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.snackBarTheme(
          elevation: 5,
          colorScheme: colorScheme,
          backgroundColor: const Color(0xFFBBC2D5),
          backgroundSchemeColor: null,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          SnackBarThemeData(
            backgroundColor: const Color(0xFFBBC2D5),
            elevation: 5,
            contentTextStyle: ThemeData().textTheme.titleMedium!.copyWith(
                  color: Colors.black,
                ),
            actionTextColor: colorScheme.inversePrimary,
            disabledActionTextColor: colorScheme.inversePrimary.withAlpha(0x11),
            closeIconColor: Colors.black.withAlpha(0xAA),
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'SnackBar FST28.4 scheme-based: GIVEN a '
        'FlexSubTheme.snackBarTheme with '
        'colorScheme, backgroundSchemeColor and backgroundColor '
        'EXPECT equal to SnackBarThemeData with scheme color.', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.snackBarTheme(
          elevation: 0,
          colorScheme: colorScheme,
          backgroundColor: const Color(0xFF763370),
          backgroundSchemeColor: SchemeColor.error,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          SnackBarThemeData(
            backgroundColor: colorScheme.error,
            elevation: 0,
            contentTextStyle: ThemeData().textTheme.titleMedium!.copyWith(
                  color: colorScheme.onError,
                ),
            actionTextColor: colorScheme.inversePrimary,
            disabledActionTextColor: colorScheme.inversePrimary.withAlpha(0x11),
            closeIconColor: colorScheme.onError.withAlpha(0xAA),
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'SnackBar FST28.5 scheme-based: GIVEN a '
        'FlexSubTheme.snackBarTheme with '
        'colorScheme, backgroundSchemeColor and backgroundColor and '
        'actionTextSchemeColor'
        'EXPECT equal to SnackBarThemeData with scheme colors.', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.snackBarTheme(
          elevation: 0,
          colorScheme: colorScheme,
          backgroundColor: const Color(0xFF763370),
          backgroundSchemeColor: SchemeColor.error,
          actionTextSchemeColor: SchemeColor.tertiary,
          radius: 7,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          SnackBarThemeData(
            backgroundColor: colorScheme.error,
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(7)),
            ),
            contentTextStyle: ThemeData().textTheme.titleMedium!.copyWith(
                  color: colorScheme.onError,
                ),
            actionTextColor: colorScheme.tertiary,
            disabledActionTextColor: colorScheme.tertiary.withAlpha(0x11),
            closeIconColor: colorScheme.onError.withAlpha(0xAA),
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'SnackBar FST28.6 scheme-based: GIVEN a '
        'FlexSubTheme.snackBarTheme with '
        'colorScheme, backgroundSchemeColor and backgroundColor and '
        'actionTextSchemeColor and content '
        'EXPECT equal to SnackBarThemeData with scheme colors.', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.snackBarTheme(
          elevation: 0,
          colorScheme: colorScheme,
          backgroundColor: const Color(0xFF763370),
          backgroundSchemeColor: SchemeColor.error,
          actionTextSchemeColor: SchemeColor.tertiary,
          contentTextStyle: const TextStyle(fontSize: 14, color: Colors.red),
          radius: 7,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          SnackBarThemeData(
            backgroundColor: colorScheme.error,
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(7)),
            ),
            contentTextStyle: TextStyle(
              fontSize: 14,
              color: colorScheme.onError,
            ),
            actionTextColor: colorScheme.tertiary,
            disabledActionTextColor: colorScheme.tertiary.withAlpha(0x11),
            closeIconColor: colorScheme.onError.withAlpha(0xAA),
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
  });
}
