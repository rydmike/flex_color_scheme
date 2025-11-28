import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: deprecated_member_use_from_same_package, for tests.

void main() {
  group('WITH: FlexSubThemes.menuTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes menuTheme tests
    // -------------------------------------------------------------------------
    test(
        'MenuAnchor FST20.1: GIVEN a FlexSubTheme.menuTheme() '
        'EXPECT equal to MenuThemeData() with same values.', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      final MenuThemeData menuDefault = FlexSubThemes.menuTheme(
        colorScheme: colorScheme,
      );
      expect(menuDefault, equals(const MenuThemeData()));
      //
      MenuThemeData menu = FlexSubThemes.menuTheme(
        colorScheme: colorScheme,
        radius: 11,
      );
      expect(menu.style!.elevation?.resolve(<WidgetState>{}), equals(null));
      expect(
        menu.style!.backgroundColor?.resolve(<WidgetState>{}),
        equals(null),
      );
      expect(menu.style!.padding?.resolve(<WidgetState>{}), equals(null));
      expect(
        menu.style!.surfaceTintColor?.resolve(<WidgetState>{}),
        equals(null),
      );
      expect(
        menu.style!.shape!.resolve(<WidgetState>{}),
        equals(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(11)),
          ),
        ),
      );
      menu = FlexSubThemes.menuTheme(
        colorScheme: colorScheme,
        elevation: 3,
        opacity: 0.8,
        surfaceTintColor: colorScheme.tertiary,
        padding: const EdgeInsets.all(7),
      );
      expect(menu.style!.elevation?.resolve(<WidgetState>{}), equals(3));
      expect(
        menu.style!.backgroundColor?.resolve(<WidgetState>{}),
        equals(colorScheme.surfaceContainer.withValues(alpha: 0.8)),
      );
      expect(
        menu.style!.padding?.resolve(<WidgetState>{}),
        equals(const EdgeInsets.all(7)),
      );
      expect(
        menu.style!.surfaceTintColor?.resolve(<WidgetState>{}),
        equals(colorScheme.tertiary),
      );
      expect(menu.style!.shape?.resolve(<WidgetState>{}), equals(null));
      menu = FlexSubThemes.menuTheme(
        colorScheme: colorScheme,
        backgroundSchemeColor: SchemeColor.surfaceContainer,
      );
      expect(
        menu.style!.backgroundColor?.resolve(<WidgetState>{}),
        equals(colorScheme.surfaceContainer),
      );
      menu = FlexSubThemes.menuTheme(
        colorScheme: colorScheme,
        backgroundSchemeColor: SchemeColor.secondaryContainer,
        opacity: 0.9,
      );
      expect(
        menu.style!.backgroundColor?.resolve(<WidgetState>{}),
        equals(colorScheme.secondaryContainer.withValues(alpha: 0.9)),
      );
    });
  });
}
