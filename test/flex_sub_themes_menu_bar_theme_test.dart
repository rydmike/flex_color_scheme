import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: deprecated_member_use_from_same_package, for tests.

void main() {
  group('WITH: FlexSubThemes.menuBarTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes menuBarTheme tests
    // -------------------------------------------------------------------------
    test(
        'MenuBar FST18.1: GIVEN a FlexSubTheme.menuBarTheme() '
        'MenuBarThemeData with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      final MenuBarThemeData menuDefault = FlexSubThemes.menuBarTheme(
        colorScheme: colorScheme,
      );
      expect(menuDefault, equals(const MenuBarThemeData()));
      //
      MenuBarThemeData menu = FlexSubThemes.menuBarTheme(
        colorScheme: colorScheme,
        radius: 5,
      );
      expect(
        menu.style!.backgroundColor?.resolve(<WidgetState>{}),
        equals(null),
      );
      expect(
        menu.style!.surfaceTintColor?.resolve(<WidgetState>{}),
        equals(null),
      );
      expect(menu.style!.shadowColor?.resolve(<WidgetState>{}), equals(null));
      expect(menu.style!.elevation?.resolve(<WidgetState>{}), equals(null));
      expect(
        menu.style!.shape!.resolve(<WidgetState>{}),
        equals(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
      );
      menu = FlexSubThemes.menuBarTheme(
        colorScheme: colorScheme,
        backgroundSchemeColor: SchemeColor.surfaceContainer,
        surfaceTintColor: colorScheme.tertiary,
        shadowColor: colorScheme.onSurface,
        elevation: 8,
      );
      expect(
        menu.style!.backgroundColor?.resolve(<WidgetState>{}),
        equals(colorScheme.surfaceContainer),
      );
      expect(
        menu.style!.surfaceTintColor?.resolve(<WidgetState>{}),
        equals(colorScheme.tertiary),
      );
      expect(
        menu.style!.shadowColor?.resolve(<WidgetState>{}),
        equals(colorScheme.onSurface),
      );
      expect(menu.style!.elevation?.resolve(<WidgetState>{}), equals(8));
      expect(menu.style!.shape?.resolve(<WidgetState>{}), equals(null));
    });
  });
}
