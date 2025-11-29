import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WITH: FlexSubThemes.searchViewTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes searchViewTheme tests
    // -------------------------------------------------------------------------
    test(
        'SearchView FST25SV.1: GIVEN a default FlexSubTheme.searchViewTheme() '
        'SearchViewThemeData with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      final SearchViewThemeData listTheme = FlexSubThemes.searchViewTheme(
        colorScheme: colorScheme,
      );
      expect(
        listTheme,
        equals(
          SearchViewThemeData(
            backgroundColor: colorScheme.surfaceContainerHigh,
          ),
        ),
      );
    });
    test(
        'SearchView FST25SV.2: GIVEN a custom FlexSubTheme.searchViewTheme() '
        'SearchViewThemeData with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      final SearchViewThemeData searchTheme = FlexSubThemes.searchViewTheme(
        colorScheme: colorScheme,
        backgroundSchemeColor: SchemeColor.surfaceContainer,
        elevation: 4,
        radius: 10,
        headerHeight: 50,
        dividerColor: colorScheme.onSurface,
        constraints: const BoxConstraints(minWidth: 400.0, minHeight: 500.0),
      );
      expect(
        searchTheme,
        equals(
          SearchViewThemeData(
            backgroundColor: colorScheme.surfaceContainer,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            headerHeight: 50,
            elevation: 4,
            dividerColor: colorScheme.onSurface,
            constraints: const BoxConstraints(
              minWidth: 400.0,
              minHeight: 500.0,
            ),
          ),
        ),
      );
    });
  });
}
