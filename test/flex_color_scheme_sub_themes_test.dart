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
        'FCS8.002-dark: GIVEN a FlexColorScheme.dark with sub themes '
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
    //
    // TODO(rydmike): Consider adding more tests that verify the sub-themes.
    //   Meaning that do do them like above to see we get expected themes.
    //   The sub-themes test do test them already, but it could be useful to
    //   to verify they are picked up and applied as expected via the
    //   configured FlexSubThemesData in subThemesData correctly as well.
  });
}
