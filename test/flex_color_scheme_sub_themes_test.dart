import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: avoid_redundant_argument_values

void main() {
  //****************************************************************************
  // FlexColorScheme unit tests for using FlexColorScheme with sub-themes.
  // Used to verify that sub-themes are created as expected.
  //****************************************************************************
  group('FCS8: WITH FlexColorScheme ', () {
    debugDefaultTargetPlatformOverride = null;
    //
    // Test that sub-theme props implemented in toTheme work as intended.
    // Most sub-themes are tested via sub-theme unit tests.
    test(
        'FCS8.001-light: GIVEN a FlexColorScheme.light with sub themes '
        'and sub-theme with props coded in toTheme '
        'EXPECT sub-theme using the requested props, with onSurface '
        'text theme blends.', () {
      final FlexColorScheme fcs = FlexColorScheme.light(
        scheme: FlexScheme.redWine,
        surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
        blendLevel: 40,
        subThemesData: const FlexSubThemesData(
          appBarBackgroundSchemeColor: SchemeColor.secondaryContainer,
          tabBarIndicatorSchemeColor: SchemeColor.inversePrimary,
          tabBarItemSchemeColor: SchemeColor.onSurfaceVariant,
          blendTextTheme: true,
          blendOnColors: true,
          blendOnLevel: 40,
        ),
      );
      final ColorScheme fcsScheme = fcs.toScheme;
      expect(
        fcs.toTheme.appBarTheme.backgroundColor,
        equals(fcs.toTheme.colorScheme.secondaryContainer),
      );
      expect(
        fcs.toTheme.indicatorColor,
        equals(fcs.toTheme.colorScheme.inversePrimary),
      );
      expect(
        fcs.toTheme.tabBarTheme.labelColor,
        equals(fcs.toTheme.colorScheme.onSurfaceVariant),
      );
      // We get onSurface as blend color for blended TextTheme in light mode.
      expect(
        fcsScheme.onBackground.red > fcsScheme.onSurface.red,
        equals(true),
      );
    });
    test(
        'FCS8.001-dark: GIVEN a FlexColorScheme.dark with sub themes '
        'and sub-theme with props coded in toTheme '
        'EXPECT sub-theme using the requested props, with onSurface '
        'text theme blends.', () {
      final FlexColorScheme fcs = FlexColorScheme.dark(
        scheme: FlexScheme.redWine,
        surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
        blendLevel: 40,
        subThemesData: const FlexSubThemesData(
          appBarBackgroundSchemeColor: SchemeColor.secondaryContainer,
          tabBarIndicatorSchemeColor: SchemeColor.inversePrimary,
          tabBarItemSchemeColor: SchemeColor.onSurfaceVariant,
          blendTextTheme: true,
          blendOnColors: true,
          blendOnLevel: 40,
        ),
      );
      final ColorScheme fcsScheme = fcs.toScheme;
      expect(
        fcs.toTheme.appBarTheme.backgroundColor,
        equals(fcs.toTheme.colorScheme.secondaryContainer),
      );
      expect(
        fcs.toTheme.indicatorColor,
        equals(fcs.toTheme.colorScheme.inversePrimary),
      );
      expect(
        fcs.toTheme.tabBarTheme.labelColor,
        equals(fcs.toTheme.colorScheme.onSurfaceVariant),
      );
      // We get onSurface as blend color for blended TextTheme in dark mode.
      expect(
        fcsScheme.onBackground.red < fcsScheme.onSurface.red,
        equals(true),
      );
    });
    test(
        'FCS8.002-light: GIVEN a FlexColorScheme.light with sub themes '
        'and sub-theme with props coded in toTheme '
        'EXPECT sub-theme using the requested props, with onBackground '
        'text theme blends.', () {
      final FlexColorScheme fcs = FlexColorScheme.light(
        scheme: FlexScheme.red,
        surfaceMode: FlexSurfaceMode.highSurfaceLowScaffold,
        blendLevel: 40,
        subThemesData: const FlexSubThemesData(
          appBarBackgroundSchemeColor: SchemeColor.secondaryContainer,
          tabBarIndicatorSchemeColor: SchemeColor.inversePrimary,
          tabBarItemSchemeColor: SchemeColor.onSurfaceVariant,
          blendTextTheme: true,
          blendOnColors: true,
          blendOnLevel: 40,
        ),
      );
      final ColorScheme fcsScheme = fcs.toScheme;
      expect(
        fcs.toTheme.appBarTheme.backgroundColor,
        equals(fcs.toTheme.colorScheme.secondaryContainer),
      );
      expect(
        fcs.toTheme.indicatorColor,
        equals(fcs.toTheme.colorScheme.inversePrimary),
      );
      expect(
        fcs.toTheme.tabBarTheme.labelColor,
        equals(fcs.toTheme.colorScheme.onSurfaceVariant),
      );
      // We get onSurface as blend color for blended TextTheme
      expect(
        fcsScheme.onBackground.red <= fcsScheme.onSurface.red,
        equals(true),
      );
    });
    test(
        'FCS8.003-dark: GIVEN a FlexColorScheme.dark with sub themes '
        'and sub-theme with props coded in toTheme '
        'EXPECT sub-theme using the requested props, with onBackground '
        'text theme blends.', () {
      final FlexColorScheme fcs = FlexColorScheme.dark(
        scheme: FlexScheme.red,
        surfaceMode: FlexSurfaceMode.highSurfaceLowScaffold,
        blendLevel: 40,
        subThemesData: const FlexSubThemesData(
          appBarBackgroundSchemeColor: SchemeColor.secondaryContainer,
          tabBarIndicatorSchemeColor: SchemeColor.inversePrimary,
          tabBarItemSchemeColor: SchemeColor.onSurfaceVariant,
          blendTextTheme: true,
          blendOnColors: true,
          blendOnLevel: 40,
        ),
      );
      final ColorScheme fcsScheme = fcs.toScheme;
      expect(
        fcs.toTheme.appBarTheme.backgroundColor,
        equals(fcs.toTheme.colorScheme.secondaryContainer),
      );
      expect(
        fcs.toTheme.indicatorColor,
        equals(fcs.toTheme.colorScheme.inversePrimary),
      );
      expect(
        fcs.toTheme.tabBarTheme.labelColor,
        equals(fcs.toTheme.colorScheme.onSurfaceVariant),
      );
      // We get onSurface as blend color for blended TextTheme
      expect(
        fcsScheme.onBackground.red >= fcsScheme.onSurface.red,
        equals(true),
      );
    });
    test(
        'FCS8.004-light-a: GIVEN a FlexColorScheme raw with sub themes '
        'and AppBar scheme '
        'EXPECT sub-theme with given AppBar scheme color.', () {
      final FlexColorScheme fcs = FlexColorScheme(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4D31D7),
          brightness: Brightness.light,
        ),
        subThemesData: const FlexSubThemesData(
          appBarBackgroundSchemeColor: SchemeColor.secondary,
          blendTextTheme: true,
          blendOnColors: true,
          blendOnLevel: 25,
        ),
      );
      expect(
        fcs.toTheme.appBarTheme.backgroundColor,
        equals(fcs.toTheme.colorScheme.secondary),
      );
    });
    test(
        'FCS8.004-light-b: GIVEN a FlexColorScheme raw with sub themes '
        'and AppBar scheme with override '
        'EXPECT sub-theme with given AppBar override color.', () {
      final FlexColorScheme fcs = FlexColorScheme(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4D31D7),
          brightness: Brightness.light,
        ),
        appBarBackground: const Color(0xFF3DA3C2),
        subThemesData: const FlexSubThemesData(
          appBarBackgroundSchemeColor: SchemeColor.secondary,
          blendTextTheme: true,
          blendOnColors: true,
          blendOnLevel: 25,
        ),
      );
      expect(
        fcs.toTheme.appBarTheme.backgroundColor,
        equals(const Color(0xFF3DA3C2)),
      );
    });
    test(
        'FCS8.005-dark-a: GIVEN a FlexColorScheme raw with sub themes '
        'and AppBar scheme '
        'EXPECT sub-theme with given AppBar scheme color ', () {
      final FlexColorScheme fcs = FlexColorScheme(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4D31D7),
          brightness: Brightness.dark,
        ),
        subThemesData: const FlexSubThemesData(
          appBarBackgroundSchemeColor: SchemeColor.tertiary,
          blendTextTheme: true,
          blendOnColors: true,
          blendOnLevel: 25,
        ),
      );
      expect(
        fcs.toTheme.appBarTheme.backgroundColor,
        equals(fcs.toTheme.colorScheme.tertiary),
      );
    });
    test(
        'FCS8.005-dark-b: GIVEN a FlexColorScheme raw with sub themes '
        'and AppBar scheme with override '
        'EXPECT sub-theme with given AppBar override color ', () {
      final FlexColorScheme fcs = FlexColorScheme(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4D31D7),
          brightness: Brightness.dark,
        ),
        appBarBackground: const Color(0xFF30454C),
        subThemesData: const FlexSubThemesData(
          appBarBackgroundSchemeColor: SchemeColor.tertiary,
          blendTextTheme: true,
          blendOnColors: true,
          blendOnLevel: 25,
        ),
      );
      final ColorScheme fcsScheme = fcs.toScheme;
      expect(
        fcs.toTheme.appBarTheme.backgroundColor,
        equals(const Color(0xFF30454C)),
      );
    });
    test(
        'FCS8.006-light-a: GIVEN a FlexColorScheme.light with sub themes '
        'and custom navigation bar and rail indicator color and '
        'opacity '
        'EXPECT sub-themes with given properties. ', () {
      final FlexColorScheme fcs = FlexColorScheme.light(
        scheme: FlexScheme.flutterDash,
        blendLevel: 20,
        subThemesData: const FlexSubThemesData(
          navigationRailIndicatorOpacity: 0.5,
          navigationRailIndicatorSchemeColor: SchemeColor.onTertiary,
          navigationBarIndicatorOpacity: 0.8,
          navigationBarIndicatorSchemeColor: SchemeColor.primaryContainer,
          blendTextTheme: true,
          blendOnColors: true,
          blendOnLevel: 25,
        ),
      );
      final ColorScheme fcsScheme = fcs.toScheme;
      final ThemeData fcsTheme = fcs.toTheme;
      expect(
        fcsTheme.navigationRailTheme.indicatorColor,
        equals(fcsScheme.onTertiary.withOpacity(0.5)),
      );
      expect(
        fcsTheme.navigationBarTheme.indicatorColor,
        equals(fcsScheme.primaryContainer.withOpacity(0.8)),
      );
    });
  });
}
