import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flex_color_scheme/src/flex_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WITH: FlexSubThemes.cardTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes Card tests
    // -------------------------------------------------------------------------
    test(
        'Card FST6.1: GIVEN a default FlexSubTheme.cardTheme() '
        'EXPECT equal to CardTheme() version with same values', () {
      expect(
        FlexSubThemes.cardTheme(),
        equals(const CardThemeData(clipBehavior: Clip.antiAlias)),
      );
    });
    test(
        'Card FST6.2 custom: GIVEN a custom FlexSubTheme.cardTheme() '
        'EXPECT equal to CardTheme() version with same values', () {
      expect(
        FlexSubThemes.cardTheme(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 2,
          radius: 1,
        ),
        equals(
          const CardThemeData(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(1)),
            ),
          ),
        ),
      );
    });
    test(
        'Card FST6.3 m2-default-radius: GIVEN useMaterial3 is false and no '
        'radius defined EXPECT shape with default M2 radius', () {
      final CardThemeData theme = FlexSubThemes.cardTheme(useMaterial3: false);
      expect(
        theme.shape,
        equals(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(kCardRadius)),
          ),
        ),
      );
      expect(theme.clipBehavior, equals(Clip.antiAlias));
    });
    test(
        'Card FST6.4 background and tint: GIVEN a background scheme color, '
        'shadow and surface tint EXPECT CardThemeData using provided values',
        () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
      );
      expect(
        FlexSubThemes.cardTheme(
          colorScheme: colorScheme,
          backgroundSchemeColor: SchemeColor.surfaceContainerHigh,
          surfaceTintColor: const Color(0xFF123456),
          shadowColor: const Color(0xFF654321),
          elevation: 4,
        ),
        equals(
          CardThemeData(
            color: colorScheme.surfaceContainerHigh,
            elevation: 4,
            shadowColor: const Color(0xFF654321),
            surfaceTintColor: const Color(0xFF123456),
            clipBehavior: Clip.antiAlias,
          ),
        ),
      );
    });
    test(
        'Card FST6.5 border default width: GIVEN border scheme color and '
        'custom radius EXPECT shape with default border width', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
      );
      final CardThemeData theme = FlexSubThemes.cardTheme(
        colorScheme: colorScheme,
        borderSchemeColor: SchemeColor.outline,
        radius: 8,
      );
      final RoundedRectangleBorder shape =
          theme.shape! as RoundedRectangleBorder;
      expect(
        shape.borderRadius,
        equals(const BorderRadius.all(Radius.circular(8))),
      );
      expect(shape.side.width, equals(1.0));
      expect(shape.side.color, equals(colorScheme.outline));
    });
    test(
        'Card FST6.6 border custom width: GIVEN border color and custom width '
        'with default radius EXPECT shape using provided width and color', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
      );
      final CardThemeData theme = FlexSubThemes.cardTheme(
        colorScheme: colorScheme,
        borderSchemeColor: SchemeColor.primary,
        borderWidth: 2.5,
      );
      final RoundedRectangleBorder shape =
          theme.shape! as RoundedRectangleBorder;
      expect(
        shape.borderRadius,
        equals(
          const BorderRadius.all(Radius.circular(kCardRadius)),
        ),
      );
      expect(shape.side.width, equals(2.5));
      expect(shape.side.color, equals(colorScheme.primary));
    });
  });
}
