import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'helpers/tint_alpha_factor.dart';

// ignore_for_file: deprecated_member_use_from_same_package, for tests.

void main() {
  group('WITH: FlexSubThemes.floatingActionButtonTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes FloatingActionButton tests
    // -------------------------------------------------------------------------
    test(
        'FAB FST14.1: GIVEN a default '
        'FlexSubTheme.floatingActionButtonTheme() '
        'EXPECT equal to FloatingActionButtonThemeData() version '
        'with same values', () {
      expect(
        FlexSubThemes.floatingActionButtonTheme(
          colorScheme: const ColorScheme.light(),
        ),
        equals(
          const FloatingActionButtonThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
          ),
        ),
      );
    });
    test(
        'FST14.2: GIVEN a custom FlexSubTheme.floatingActionButtonTheme() '
        'EXPECT equal to FloatingActionButtonThemeData() version '
        'with same values', () {
      expect(
        FlexSubThemes.floatingActionButtonTheme(
          colorScheme: const ColorScheme.light(),
          radius: 30,
        ),
        equals(
          const FloatingActionButtonThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
          ),
        ),
      );
    });
    test(
        'FAB FST14.3: GIVEN a circular '
        'FlexSubTheme.floatingActionButtonTheme() '
        'EXPECT equal to FloatingActionButtonThemeData() version '
        'with same Shape', () {
      expect(
        FlexSubThemes.floatingActionButtonTheme(
          colorScheme: const ColorScheme.light(),
          radius: 30,
          alwaysCircular: true,
        ),
        equals(const FloatingActionButtonThemeData(shape: StadiumBorder())),
      );
    });
    test(
        'FAB FST14.4: GIVEN a custom FlexSubTheme.floatingActionButtonTheme() '
        'EXPECT equal to FloatingActionButtonThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.floatingActionButtonTheme(
          colorScheme: colorScheme,
          radius: 30,
          backgroundSchemeColor: SchemeColor.primaryContainer,
        ),
        equals(
          FloatingActionButtonThemeData(
            backgroundColor: colorScheme.primaryContainer,
            foregroundColor: colorScheme.onPrimaryContainer,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
          ),
        ),
      );
    });
    test(
        'FAB FST14.5: GIVEN a custom FlexSubTheme.floatingActionButtonTheme() '
        'EXPECT equal to FloatingActionButtonThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.floatingActionButtonTheme(
          colorScheme: colorScheme,
          radius: 32,
        ),
        equals(
          const FloatingActionButtonThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32)),
            ),
          ),
        ),
      );
    });
    test(
        'FAB FST14.6: GIVEN a null shape '
        'FlexSubTheme.floatingActionButtonTheme() '
        'EXPECT equal to FloatingActionButtonThemeData() version '
        'with default shape values and colors', () {
      const ColorScheme colorScheme = ColorScheme.dark();
      expect(
        FlexSubThemes.floatingActionButtonTheme(
          colorScheme: colorScheme,
          backgroundSchemeColor: SchemeColor.secondary,
          radius: 32,
          useShape: false,
        ),
        equals(
          FloatingActionButtonThemeData(
            backgroundColor: colorScheme.secondary,
            foregroundColor: colorScheme.onSecondary,
          ),
        ),
      );
    });
    test(
        'FST14.7: GIVEN a null shape FlexSubTheme.floatingActionButtonTheme() '
        'EXPECT equal to FloatingActionButtonThemeData() version '
        'with default shape values and colors', () {
      const ColorScheme colorScheme = ColorScheme.dark();
      expect(
        FlexSubThemes.floatingActionButtonTheme(
          colorScheme: colorScheme,
          backgroundSchemeColor: SchemeColor.secondary,
          radius: 32,
          useShape: true,
          alwaysCircular: true,
        ),
        equals(
          FloatingActionButtonThemeData(
            backgroundColor: colorScheme.secondary,
            foregroundColor: colorScheme.onSecondary,
            shape: const StadiumBorder(),
          ),
        ),
      );
    });
    test(
        'FAB FST14.8: GIVEN a custom FlexSubTheme.floatingActionButtonTheme() '
        'EXPECT equal to FloatingActionButtonThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.floatingActionButtonTheme(
          colorScheme: colorScheme,
          backgroundSchemeColor: SchemeColor.onPrimary,
          radius: 32,
        ),
        equals(
          FloatingActionButtonThemeData(
            backgroundColor: colorScheme.onPrimary,
            foregroundColor: colorScheme.primary,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32)),
            ),
          ),
        ),
      );
    });
    test(
        'FAB FST14.9: GIVEN a custom FlexSubTheme.floatingActionButtonTheme() '
        'EXPECT equal to FloatingActionButtonThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();

      final Color overlay = colorScheme.secondary;
      final Color tint = colorScheme.onPrimary;
      final double factor = tintAlphaFactor(tint, colorScheme.brightness);
      expect(
        FlexSubThemes.floatingActionButtonTheme(
          colorScheme: colorScheme,
          backgroundSchemeColor: SchemeColor.onPrimary,
          foregroundSchemeColor: SchemeColor.secondary,
          radius: 24,
          useTintedInteraction: true,
        ),
        equals(
          FloatingActionButtonThemeData(
            backgroundColor: colorScheme.onPrimary,
            foregroundColor: colorScheme.secondary,
            focusColor: FlexSubThemes.tintedFocused(overlay, tint, factor),
            hoverColor: FlexSubThemes.tintedHovered(overlay, tint, factor),
            splashColor: FlexSubThemes.tintedSplash(overlay, tint, factor),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(24)),
            ),
          ),
        ),
      );
    });
  });
}
