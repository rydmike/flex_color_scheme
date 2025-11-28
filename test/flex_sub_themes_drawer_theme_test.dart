import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flex_color_scheme/src/flex_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: deprecated_member_use_from_same_package, for tests.

void main() {
  group('WITH: FlexSubThemes.drawerTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes drawerTheme tests
    // -------------------------------------------------------------------------
    test(
        'Drawer FST10.1: GIVEN a FlexSubTheme.drawerTheme() '
        'EXPECT equal to DrawerThemeData with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      );
      expect(
        FlexSubThemes.drawerTheme(colorScheme: colorScheme, useMaterial3: true),
        equals(
          DrawerThemeData(backgroundColor: colorScheme.surfaceContainerLow),
        ),
      );
      expect(
        FlexSubThemes.drawerTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
          radius: 8,
        ),
        equals(
          DrawerThemeData(
            backgroundColor: colorScheme.surfaceContainerLow,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.horizontal(
                end: Radius.circular(8),
              ),
            ),
            endShape: const RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.horizontal(
                start: Radius.circular(8),
              ),
            ),
          ),
        ),
      );
      expect(
        FlexSubThemes.drawerTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ),
        equals(
          DrawerThemeData(
            backgroundColor: colorScheme.surfaceContainerLow,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.horizontal(
                end: Radius.circular(kDrawerRadius),
              ),
            ),
            endShape: const RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.horizontal(
                start: Radius.circular(kDrawerRadius),
              ),
            ),
          ),
        ),
      );
      expect(
        FlexSubThemes.drawerTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
          radius: 7,
        ),
        equals(
          DrawerThemeData(
            backgroundColor: colorScheme.surfaceContainerLow,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.horizontal(
                end: Radius.circular(7),
              ),
            ),
            endShape: const RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.horizontal(
                start: Radius.circular(7),
              ),
            ),
          ),
        ),
      );
    });
  });
}
