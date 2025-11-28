import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: deprecated_member_use_from_same_package, for tests.

void main() {
  group('WITH: FlexSubThemes.navigationDrawerTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes navigationDrawerTheme tests
    // -------------------------------------------------------------------------
    test(
        'NavigationDrawer FST22.1: GIVEN a FlexSubTheme.navigationDrawerTheme '
        'EXPECT equal to NavigationDrawerThemeData with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      NavigationDrawerThemeData m = FlexSubThemes.navigationDrawerTheme(
        colorScheme: colorScheme,
      );
      expect(m.backgroundColor, equals(colorScheme.surfaceContainerLow));
      expect(m.indicatorColor, equals(colorScheme.secondaryContainer));
      expect(m.indicatorSize, equals(const Size(336, 56)));
      expect(
        m.labelTextStyle!.resolve(<WidgetState>{WidgetState.selected})?.color,
        equals(colorScheme.onSecondaryContainer),
      );
      expect(
        m.labelTextStyle!.resolve(<WidgetState>{})?.color,
        equals(colorScheme.onSurfaceVariant),
      );
      expect(
        m.iconTheme!.resolve(<WidgetState>{WidgetState.selected})?.color,
        equals(colorScheme.onSecondaryContainer),
      );
      expect(
        m.iconTheme!.resolve(<WidgetState>{})?.color,
        equals(colorScheme.onSurfaceVariant),
      );
      m = FlexSubThemes.navigationDrawerTheme(
        colorScheme: colorScheme,
        backgroundSchemeColor: SchemeColor.secondaryContainer,
        indicatorSchemeColor: SchemeColor.primary,
        selectedItemSchemeColor: SchemeColor.secondaryContainer,
        unselectedItemSchemeColor: SchemeColor.onTertiaryContainer,
        surfaceTintColor: colorScheme.tertiary,
        shadowColor: Colors.red,
        indicatorOpacity: 0.95,
        indicatorRadius: 8,
        indicatorWidth: 304,
      );
      expect(m.backgroundColor, equals(colorScheme.secondaryContainer));
      expect(m.surfaceTintColor, equals(colorScheme.tertiary));
      expect(m.shadowColor, equals(Colors.red));
      expect(
        m.indicatorColor,
        equals(colorScheme.primary.withValues(alpha: 0.95)),
      );
      expect(m.indicatorSize, equals(const Size(304, 56)));
      expect(
        m.labelTextStyle!.resolve(<WidgetState>{WidgetState.selected})?.color,
        equals(colorScheme.secondaryContainer),
      );
      expect(
        m.labelTextStyle!.resolve(<WidgetState>{})?.color,
        equals(colorScheme.onTertiaryContainer),
      );
      expect(
        m.iconTheme!.resolve(<WidgetState>{WidgetState.selected})?.color,
        equals(colorScheme.secondaryContainer),
      );
      expect(
        m.iconTheme!.resolve(<WidgetState>{})?.color,
        equals(colorScheme.onTertiaryContainer),
      );
      expect(
        m.indicatorShape,
        equals(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
      );
    });
  });
}
