import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WITH: FlexSubThemes.dropdownMenuTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes dropdownMenuTheme tests
    // -------------------------------------------------------------------------
    //
    // The major part of the theme for the DropdownMenu is done via the
    // InputDecoratorTheme and via the MenuTheme. This is mostly here to
    // provide a stub for future individual theming of the the container
    // for the DropdownMenu.
    test(
        'DropdownMenu 11.1: GIVEN a FlexSubTheme.dropdownMenuTheme() '
        'EXPECT equal to DropdownMenuThemeData with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      );
      expect(
        FlexSubThemes.dropdownMenuTheme(colorScheme: colorScheme),
        equals(
          const DropdownMenuThemeData(
            menuStyle: MenuStyle(
              maximumSize: WidgetStatePropertyAll<Size>(Size.infinite),
            ),
          ),
        ),
      );
      const DropdownMenuThemeData m = DropdownMenuThemeData(
        menuStyle: MenuStyle(
          surfaceTintColor: WidgetStatePropertyAll<Color>(Colors.transparent),
        ),
      );
      expect(
        m.menuStyle!.surfaceTintColor!.resolve(<WidgetState>{}),
        equals(Colors.transparent),
      );
      final DropdownMenuThemeData m2 = DropdownMenuThemeData(
        menuStyle: MenuStyle(
          surfaceTintColor: WidgetStatePropertyAll<Color>(
            colorScheme.surfaceContainer,
          ),
        ),
      );
      expect(
        m2.menuStyle!.surfaceTintColor!.resolve(<WidgetState>{}),
        equals(colorScheme.surfaceContainer),
      );
    });
  });
}
