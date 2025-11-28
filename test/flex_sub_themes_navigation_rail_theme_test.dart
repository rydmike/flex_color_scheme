import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: deprecated_member_use_from_same_package, for tests.

void main() {
  group('WITH: FlexSubThemes.navigationRailTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes NavigationRail tests
    // -------------------------------------------------------------------------
    test(
        'NavigationRail FST22.2 light-flutter default: GIVEN a default '
        'FlexSubTheme.navigationRailTheme() that uses Flutter defaults '
        'EXPECT equal to NavigationRailThemeData() version '
        'with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
      );
      expect(
        FlexSubThemes.navigationRailTheme(colorScheme: colorScheme),
        equals(
          NavigationRailThemeData(
            backgroundColor: colorScheme.surface,
            elevation: 0,
            selectedLabelTextStyle: TextStyle(
              fontSize: 12,
              color: colorScheme.onSurface,
            ),
            unselectedLabelTextStyle: TextStyle(
              fontSize: 12,
              color: colorScheme.onSurfaceVariant,
            ),
            selectedIconTheme: IconThemeData(
              size: 24,
              opacity: 1,
              color: colorScheme.onSecondaryContainer,
            ),
            unselectedIconTheme: IconThemeData(
              size: 24,
              opacity: 1,
              color: colorScheme.onSurfaceVariant,
            ),
            indicatorColor: colorScheme.secondaryContainer,
            useIndicator: true,
          ),
        ),
      );
    });
    test(
        'NavigationRail FST22.3 dark-flutter default: GIVEN a default '
        'FlexSubTheme.navigationRailTheme() that uses Flutter defaults '
        'EXPECT equal to NavigationRailThemeData() version '
        'with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.dark,
      );
      expect(
        FlexSubThemes.navigationRailTheme(colorScheme: colorScheme),
        equals(
          NavigationRailThemeData(
            backgroundColor: colorScheme.surface,
            elevation: 0,
            selectedLabelTextStyle: TextStyle(
              fontSize: 12,
              color: colorScheme.onSurface,
            ),
            unselectedLabelTextStyle: TextStyle(
              fontSize: 12,
              color: colorScheme.onSurfaceVariant,
            ),
            selectedIconTheme: IconThemeData(
              size: 24,
              opacity: 1,
              color: colorScheme.onSecondaryContainer,
            ),
            unselectedIconTheme: IconThemeData(
              size: 24,
              opacity: 1,
              color: colorScheme.onSurfaceVariant,
            ),
            indicatorColor: colorScheme.secondaryContainer,
            useIndicator: true,
          ),
        ),
      );
    });
    test(
        'NavigationRail FST22.4 light-flutter default: GIVEN a default '
        'FlexSubTheme.navigationRailTheme() with opacity '
        'EXPECT equal to NavigationRailThemeData() version '
        'with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
      );
      expect(
        FlexSubThemes.navigationRailTheme(
          colorScheme: colorScheme,
          opacity: 0.5,
          useIndicator: false,
        ),
        equals(
          NavigationRailThemeData(
            backgroundColor: colorScheme.surface.withValues(alpha: 0.5),
            elevation: 0,
            selectedLabelTextStyle: TextStyle(
              fontSize: 12,
              color: colorScheme.onSurface,
            ),
            unselectedLabelTextStyle: TextStyle(
              fontSize: 12,
              color: colorScheme.onSurfaceVariant,
            ),
            selectedIconTheme: IconThemeData(
              size: 24,
              opacity: 1,
              color: colorScheme.onSecondaryContainer,
            ),
            unselectedIconTheme: IconThemeData(
              size: 24,
              opacity: 1,
              color: colorScheme.onSurfaceVariant,
            ),
            indicatorColor: colorScheme.secondaryContainer,
            useIndicator: false,
          ),
        ),
      );
    });
    test(
        'NavigationRail FST22.5 dark-flutter default: GIVEN a default '
        'FlexSubTheme.navigationRailTheme() that NOT use Flutter defaults '
        'EXPECT equal to NavigationRailThemeData() version '
        'with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.dark,
      );
      expect(
        FlexSubThemes.navigationRailTheme(
          colorScheme: colorScheme,
          opacity: 0.8,
          useIndicator: false,
        ),
        equals(
          NavigationRailThemeData(
            backgroundColor: colorScheme.surface.withValues(alpha: 0.8),
            elevation: 0,
            selectedLabelTextStyle: TextStyle(
              fontSize: 12,
              color: colorScheme.onSurface,
            ),
            unselectedLabelTextStyle: TextStyle(
              fontSize: 12,
              color: colorScheme.onSurfaceVariant,
            ),
            selectedIconTheme: IconThemeData(
              size: 24,
              opacity: 1,
              color: colorScheme.onSecondaryContainer,
            ),
            unselectedIconTheme: IconThemeData(
              size: 24,
              opacity: 1,
              color: colorScheme.onSurfaceVariant,
            ),
            indicatorColor: colorScheme.secondaryContainer,
            useIndicator: false,
          ),
        ),
      );
    });
    test(
        'NavigationRail FST22.6 custom: GIVEN a custom '
        'FlexSubTheme.navigationRailTheme() '
        'EXPECT equal to NavigationRailThemeData() version '
        'with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.dark,
      );
      expect(
        FlexSubThemes.navigationRailTheme(
          colorScheme: colorScheme,
          selectedLabelSchemeColor: SchemeColor.secondary,
          selectedIconSchemeColor: SchemeColor.secondaryContainer,
          unselectedLabelSchemeColor: SchemeColor.onSurface,
          unselectedIconSchemeColor: SchemeColor.tertiary,
          backgroundSchemeColor: SchemeColor.surface,
          mutedUnselectedIcon: true,
          mutedUnselectedLabel: true,
          elevation: 1,
          opacity: 0.5,
          unselectedAlphaBlend: 0xFA,
          unselectedAlpha: 0x45,
          labelType: NavigationRailLabelType.all,
          groupAlignment: 0,
          indicatorRadius: 13,
        ),
        equals(
          NavigationRailThemeData(
            elevation: 1,
            backgroundColor: colorScheme.surface.withValues(alpha: 0.5),
            selectedIconTheme: IconThemeData(
              color: colorScheme.secondaryContainer,
              size: 24,
              opacity: 1,
            ),
            selectedLabelTextStyle: TextStyle(
              color: colorScheme.secondary,
              fontSize: 12,
            ),
            unselectedLabelTextStyle: TextStyle(
              color: colorScheme.onSurface
                  .blendAlpha(colorScheme.onSurface, 0xFA)
                  .withAlpha(0x45),
              fontSize: 12,
            ),
            unselectedIconTheme: IconThemeData(
              color: colorScheme.tertiary
                  .blendAlpha(colorScheme.tertiary, 0xFA)
                  .withAlpha(0x45),
              size: 24,
              opacity: 1,
            ),
            useIndicator: true,
            indicatorShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(13)),
            ),
            indicatorColor: colorScheme.secondaryContainer,
            labelType: NavigationRailLabelType.all,
            groupAlignment: 0,
          ),
        ),
      );
    });
    test(
        'NavigationRail FST22.7 custom: GIVEN a custom '
        'FlexSubTheme.navigationRailTheme() '
        'EXPECT equal to NavigationRailThemeData() version '
        'with same values Icons Size test', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.dark,
      );
      expect(
        FlexSubThemes.navigationRailTheme(
          colorScheme: colorScheme,
          selectedLabelSchemeColor: SchemeColor.secondary,
          selectedIconSchemeColor: SchemeColor.secondaryContainer,
          unselectedLabelSchemeColor: SchemeColor.onSurface,
          unselectedIconSchemeColor: SchemeColor.tertiary,
          backgroundSchemeColor: SchemeColor.surface,
          mutedUnselectedIcon: true,
          mutedUnselectedLabel: true,
          unselectedIconSize: 30,
          selectedIconSize: 32,
          indicatorSchemeColor: SchemeColor.primaryFixed,
          elevation: 1,
          opacity: 0.5,
          unselectedAlphaBlend: 0xFA,
          unselectedAlpha: 0x45,
          labelType: NavigationRailLabelType.all,
          groupAlignment: 0,
        ),
        equals(
          NavigationRailThemeData(
            elevation: 1,
            backgroundColor: colorScheme.surface.withValues(alpha: 0.5),
            selectedIconTheme: IconThemeData(
              color: colorScheme.secondaryContainer,
              size: 32,
              opacity: 1,
            ),
            selectedLabelTextStyle: TextStyle(
              color: colorScheme.secondary,
              fontSize: 12,
            ),
            unselectedLabelTextStyle: TextStyle(
              color: colorScheme.onSurface
                  .blendAlpha(colorScheme.onSurface, 0xFA)
                  .withAlpha(0x45),
              fontSize: 12,
            ),
            unselectedIconTheme: IconThemeData(
              color: colorScheme.tertiary
                  .blendAlpha(colorScheme.tertiary, 0xFA)
                  .withAlpha(0x45),
              size: 30,
              opacity: 1,
            ),
            useIndicator: true,
            indicatorColor: colorScheme.primaryFixed,
            labelType: NavigationRailLabelType.all,
            groupAlignment: 0,
          ),
        ),
      );
    });
  });
}
