import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: deprecated_member_use_from_same_package, for tests.

void main() {
  group('WITH: FlexSubThemes.tooltipTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes Tooltip tests
    // -------------------------------------------------------------------------
    test(
        'Tooltip FST35.1 light: GIVEN a light default '
        'FlexSubTheme.tooltipTheme() '
        'EXPECT equal to TooltipThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.tooltipTheme(colorScheme: colorScheme).toString(),
        equalsIgnoringHashCodes(
          TooltipThemeData(
            textStyle: ThemeData(
              brightness: Brightness.light,
            ).textTheme.bodyMedium!.copyWith(color: colorScheme.surface),
            decoration: BoxDecoration(
              color: colorScheme.onSurface,
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              border: Border.all(color: Colors.transparent),
            ),
          ).toString(),
        ),
      );
    });
    test(
        'Tooltip FST35.2 light: GIVEN a light custom '
        'FlexSubTheme.tooltipTheme() '
        'EXPECT equal to TooltipThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.tooltipTheme(
          colorScheme: colorScheme,
          foregroundColor: const Color(0xFFB5DEC2),
          backgroundColor: const Color(0xFF032F11),
          borderColor: const Color(0x88CCCCCC),
          borderRadius: 9,
          backgroundAlpha: 0xDD,
          textStyle:
              ThemeData(brightness: Brightness.light).textTheme.bodyLarge,
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(12),
          waitDuration: const Duration(seconds: 1),
          showDuration: const Duration(milliseconds: 2500),
        ).toString(),
        equalsIgnoringHashCodes(
          TooltipThemeData(
            textStyle: ThemeData(
              brightness: Brightness.light,
            ).textTheme.bodyLarge!.copyWith(color: const Color(0xFFB5DEC2)),
            decoration: BoxDecoration(
              color: const Color(0xDD032F11),
              borderRadius: const BorderRadius.all(Radius.circular(9)),
              border: Border.all(color: const Color(0x88CCCCCC)),
            ),
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(12),
            waitDuration: const Duration(seconds: 1),
            showDuration: const Duration(milliseconds: 2500),
          ).toString(),
        ),
      );
    });
    test(
        'Tooltip FST34.3 light: GIVEN a light custom '
        'FlexSubTheme.tooltipTheme() '
        'EXPECT equal to TooltipThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.tooltipTheme(
          colorScheme: colorScheme,
          backgroundSchemeColor: SchemeColor.tertiary,
          foregroundColor: const Color(0xFFB5DEC2),
          backgroundColor: const Color(0xFF032F11),
          borderColor: const Color(0x88CCCCCC),
          borderRadius: 9,
          backgroundAlpha: 0xDD,
          textStyle:
              ThemeData(brightness: Brightness.light).textTheme.bodyLarge,
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(12),
          waitDuration: const Duration(seconds: 1),
          showDuration: const Duration(milliseconds: 2500),
        ).toString(),
        equalsIgnoringHashCodes(
          TooltipThemeData(
            textStyle: ThemeData(
              brightness: Brightness.light,
            ).textTheme.bodyLarge!.copyWith(color: colorScheme.onTertiary),
            decoration: BoxDecoration(
              color: colorScheme.tertiary.withAlpha(0xDD),
              borderRadius: const BorderRadius.all(Radius.circular(9)),
              border: Border.all(color: const Color(0x88CCCCCC)),
            ),
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(12),
            waitDuration: const Duration(seconds: 1),
            showDuration: const Duration(milliseconds: 2500),
          ).toString(),
        ),
      );
    });
  });
}
