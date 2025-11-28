import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: deprecated_member_use_from_same_package, for tests.

void main() {
  group('WITH: FlexSubThemes.listTileTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes listTileTheme tests
    // -------------------------------------------------------------------------
    test(
        'ListTile FST17.1: GIVEN a default FlexSubTheme.listTileTheme() '
        'ListTileThemeData with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      final ListTileThemeData listTheme = FlexSubThemes.listTileTheme(
        colorScheme: colorScheme,
      );
      expect(
        listTheme,
        equals(ListTileThemeData(selectedColor: colorScheme.primary)),
      );
    });
    test(
        'ListTile FST17.2: GIVEN a custom FlexSubTheme.listTileTheme() '
        'ListTileThemeData with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      final ListTileThemeData listTheme = FlexSubThemes.listTileTheme(
        colorScheme: colorScheme,
        selectedSchemeColor: SchemeColor.tertiary,
        iconSchemeColor: SchemeColor.primaryFixed,
        textSchemeColor: SchemeColor.secondary,
        tileSchemeColor: SchemeColor.surfaceContainer,
        selectedTileSchemeColor: SchemeColor.surfaceContainerHighest,
        contentPadding: const EdgeInsets.all(10),
        horizontalTitleGap: 16,
        minVerticalPadding: 5,
        style: ListTileStyle.drawer,
        titleAlignment: ListTileTitleAlignment.center,
      );
      expect(
        listTheme,
        equals(
          ListTileThemeData(
            selectedColor: colorScheme.tertiary,
            iconColor: colorScheme.primaryFixed,
            textColor: colorScheme.secondary,
            tileColor: colorScheme.surfaceContainer,
            selectedTileColor: colorScheme.surfaceContainerHighest,
            contentPadding: const EdgeInsets.all(10),
            horizontalTitleGap: 16,
            minVerticalPadding: 5,
            style: ListTileStyle.drawer,
            titleAlignment: ListTileTitleAlignment.center,
          ),
        ),
      );
    });
  });
}
