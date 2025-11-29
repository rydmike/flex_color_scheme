import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: deprecated_member_use_from_same_package, for tests.

void main() {
  group('WITH: FlexSubThemes.bottomNavigationBar ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes BottomNavigationBar tests
    // -------------------------------------------------------------------------
    test(
        'BottomNavigationBar FST3.1 flutter-default-light: GIVEN a LIGHT '
        'default '
        'FlexSubTheme.bottomNavigationBar() with FlutterDefault '
        'EXPECT equal to BottomNavigationBarThemeData() version '
        'with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      expect(
        FlexSubThemes.bottomNavigationBarTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ),
        equals(
          const BottomNavigationBarThemeData(
            backgroundColor: Color(0xfff8faf0),
            elevation: 3.0,
            selectedIconTheme: IconThemeData(
              size: 24.0,
              color: Color(0xff446732),
              opacity: 1.0,
            ),
            unselectedIconTheme: IconThemeData(
              size: 24.0,
              color: Color(0xa5191d16),
              opacity: 1.0,
            ),
            selectedItemColor: Color(0xff446732),
            unselectedItemColor: Color(0xa5191d16),
            selectedLabelStyle: TextStyle(
              inherit: true,
              color: Color(0xff446732),
              fontSize: 14.0,
            ),
            unselectedLabelStyle: TextStyle(
              inherit: true,
              color: Color(0xa5191d16),
              fontSize: 12.0,
            ),
          ),
        ),
      );
    });
    test(
        'BottomNavigationBar FST3.2 flutter-default-dark: GIVEN a DARK '
        'default '
        'FlexSubTheme.bottomNavigationBar() with FlutterDefault '
        'EXPECT equal to BottomNavigationBarThemeData() version '
        'with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.dark,
      );
      expect(
        FlexSubThemes.bottomNavigationBarTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
        ),
        equals(
          const BottomNavigationBarThemeData(
            backgroundColor: Color(0xff11140e),
            elevation: 3.0,
            selectedIconTheme: IconThemeData(
              size: 24.0,
              color: Color(0xffaad291),
              opacity: 1.0,
            ),
            unselectedIconTheme: IconThemeData(
              size: 24.0,
              color: Color(0xffc3c8bb),
              opacity: 1.0,
            ),
            selectedItemColor: Color(0xffaad291),
            unselectedItemColor: Color(0xffc3c8bb),
            selectedLabelStyle: TextStyle(
              inherit: true,
              color: Color(0xffaad291),
              fontSize: 14.0,
            ),
            unselectedLabelStyle: TextStyle(
              inherit: true,
              color: Color(0xffc3c8bb),
              fontSize: 12.0,
            ),
          ),
        ),
      );
    });
    test(
        'BottomNavigationBar FST3.3 fcs-default-light: GIVEN a default LIGHT '
        'FlexSubTheme.bottomNavigationBar() with FCS default '
        'EXPECT equal to BottomNavigationBarThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.bottomNavigationBarTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ),
        equals(
          const BottomNavigationBarThemeData(
            elevation: 3.0,
            backgroundColor: Colors.white,
            selectedIconTheme: IconThemeData(
              color: Color(0xff6200ee),
              opacity: 1.0,
              size: 24.0,
            ),
            unselectedIconTheme: IconThemeData(
              color: Color(0xa5000000),
              opacity: 1.0,
              size: 24.0,
            ),
            selectedItemColor: Color(0xff6200ee),
            unselectedItemColor: Color(0xa5000000),
            selectedLabelStyle: TextStyle(
              inherit: true,
              color: Color(0xff6200ee),
              fontSize: 14.0,
            ),
            unselectedLabelStyle: TextStyle(
              inherit: true,
              color: Color(0xa5000000),
              fontSize: 12.0,
            ),
          ),
        ),
      );
    });
    test(
        'BottomNavigationBar FST3.4 fcs-default-dark: GIVEN a default DARK '
        'FlexSubTheme.bottomNavigationBar() with FCS default '
        'EXPECT equal to BottomNavigationBarThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.dark();
      expect(
        FlexSubThemes.bottomNavigationBarTheme(
          colorScheme: colorScheme,
          elevation: 2,
          useMaterial3: false,
        ),
        equals(
          const BottomNavigationBarThemeData(
            elevation: 2,
            backgroundColor: Color(0xff121212),
            selectedIconTheme: IconThemeData(
              color: Color(0xffbb86fc),
              opacity: 1.0,
              size: 24.0,
            ),
            unselectedIconTheme: IconThemeData(
              color: Color(0xa5ffffff),
              opacity: 1.0,
              size: 24.0,
            ),
            selectedItemColor: Color(0xffbb86fc),
            unselectedItemColor: Color(0xa5ffffff),
            selectedLabelStyle: TextStyle(
              inherit: true,
              color: Color(0xffbb86fc),
              fontSize: 14.0,
            ),
            unselectedLabelStyle: TextStyle(
              inherit: true,
              color: Color(0xa5ffffff),
              fontSize: 12.0,
            ),
          ),
        ),
      );
    });
    test(
        'BottomNavigationBar FST3.5 custom: GIVEN a custom '
        'FlexSubTheme.bottomNavigationBar() '
        'EXPECT equal to BottomNavigationBarThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.dark();
      expect(
        FlexSubThemes.bottomNavigationBarTheme(
          colorScheme: colorScheme,
          selectedLabelSchemeColor: SchemeColor.secondary,
          selectedIconSchemeColor: SchemeColor.secondaryContainer,
          unselectedLabelSchemeColor: SchemeColor.onSurface,
          unselectedIconSchemeColor: SchemeColor.tertiary,
          backgroundSchemeColor: SchemeColor.surface,
          mutedUnselectedIcon: true,
          mutedUnselectedLabel: true,
          elevation: 1,
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          opacity: 0.5,
          unselectedAlphaBlend: 0xFA,
          unselectedAlpha: 0x45,
          selectedIconSize: 31,
          unselectedIconSize: 27,
        ),
        equals(
          BottomNavigationBarThemeData(
            elevation: 1,
            backgroundColor: colorScheme.surface.withValues(alpha: 0.5),
            landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
            selectedItemColor: colorScheme.secondary,
            selectedIconTheme: IconThemeData(
              color: colorScheme.secondaryContainer,
              size: 31,
              opacity: 1,
            ),
            selectedLabelStyle: TextStyle(
              color: colorScheme.secondary,
              fontSize: 14,
            ),
            unselectedLabelStyle: TextStyle(
              color: colorScheme.onSurface
                  .blendAlpha(colorScheme.onSurface, 0xFA)
                  .withAlpha(0x45),
              fontSize: 12,
            ),
            unselectedItemColor: colorScheme.onSurface
                .blendAlpha(colorScheme.onSurface, 0xFA)
                .withAlpha(0x45),
            unselectedIconTheme: IconThemeData(
              color: colorScheme.tertiary
                  .blendAlpha(colorScheme.tertiary, 0xFA)
                  .withAlpha(0x45),
              size: 27,
              opacity: 1,
            ),
          ),
        ),
      );
    });
    test(
        'BottomNavigationBar FST3.6: Given a deprecated bottomNavigationBar '
        'EXPECT bottomNavigationBarTheme', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      expect(
        FlexSubThemes.bottomNavigationBarTheme(colorScheme: colorScheme),
        equals(FlexSubThemes.bottomNavigationBar(colorScheme: colorScheme)),
      );
    });
  });
}
