import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  //****************************************************************************
  // FlexSubThemes.schemeColor static function unit tests.
  //****************************************************************************
  group('FST.sC: FlexSubThemes.schemeColor WITH ColorScheme ', () {
    const ColorScheme scheme = ColorScheme.light(
      primary: FlexColor.materialLightPrimary,
      primaryContainer: FlexColor.materialLightPrimaryContainer,
      secondary: FlexColor.materialLightSecondary,
      secondaryContainer: FlexColor.materialLightSecondaryVariant,
      surface: FlexColor.materialLightSurface,
      background: FlexColor.materialLightBackground,
      error: FlexColor.materialLightError,
      onPrimary: Color(0xFF121212),
      onSecondary: Color(0xFFEEEEEE),
      onSurface: Color(0xFFCCCCCC),
      onBackground: Color(0xFFDDDDDD),
      onError: Color(0xFFAAAAAA),
    );

    test(
        'FST.sC-01: GIVEN SchemeColor.primary '
        'EXPECT primary color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.primary, scheme),
          equals(FlexColor.materialLightPrimary));
    });
    test(
        'FST.sC-02: GIVEN SchemeColor.onPrimary '
        'EXPECT onPrimary color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.onPrimary, scheme),
          equals(const Color(0xFF121212)));
    });
    test(
        'FST.sC-03: GIVEN SchemeColor.primaryVariant '
        'EXPECT primaryVariant color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.primaryVariant, scheme),
          equals(FlexColor.materialLightPrimaryContainer));
    });
    test(
        'FST.sC-04: GIVEN SchemeColor.secondary '
        'EXPECT secondary color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.secondary, scheme),
          equals(FlexColor.materialLightSecondary));
    });
    test(
        'FST.sC-05: GIVEN SchemeColor.onSecondary '
        'EXPECT onSecondary color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.onSecondary, scheme),
          equals(const Color(0xFFEEEEEE)));
    });
    test(
        'FST.sC-06: GIVEN SchemeColor.secondaryVariant '
        'EXPECT secondaryVariant color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.secondaryVariant, scheme),
          equals(FlexColor.materialLightSecondaryVariant));
    });
    test(
        'FST.sC-07: GIVEN SchemeColor.surface '
        'EXPECT surface color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.surface, scheme),
          equals(FlexColor.materialLightSurface));
    });
    test(
        'FST.sC-08: GIVEN SchemeColor.onSurface '
        'EXPECT onSurface color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.onSurface, scheme),
          equals(const Color(0xFFCCCCCC)));
    });
    test(
        'FST.sC-09: GIVEN SchemeColor.background '
        'EXPECT background color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.background, scheme),
          equals(FlexColor.materialLightBackground));
    });
    test(
        'FST.sC-10: GIVEN SchemeColor.onBackground '
        'EXPECT onBackground color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.onBackground, scheme),
          equals(const Color(0xFFDDDDDD)));
    });
    test(
        'FST.sC-11: GIVEN SchemeColor.error '
        'EXPECT error color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.error, scheme),
          equals(FlexColor.materialLightError));
    });
    test(
        'FST.sC-12: GIVEN SchemeColor.onError '
        'EXPECT onError color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.onError, scheme),
          equals(const Color(0xFFAAAAAA)));
    });
  });

  //****************************************************************************
  // FlexSubThemes.schemeColorPair static function unit tests.
  //****************************************************************************
  group('FST.sCP: FlexSubThemes.schemeColorPair WITH ColorScheme ', () {
    const ColorScheme scheme = ColorScheme.light(
      primary: FlexColor.materialLightPrimary,
      primaryContainer: FlexColor.materialLightPrimaryContainer,
      secondary: FlexColor.materialLightSecondary,
      secondaryContainer: FlexColor.materialLightSecondaryVariant,
      surface: FlexColor.materialLightSurface,
      background: FlexColor.materialLightBackground,
      error: FlexColor.materialLightError,
      onPrimary: Color(0xFF121212),
      onSecondary: Color(0xFFEEEEEE),
      onSurface: Color(0xFFCCCCCC),
      onBackground: Color(0xFFDDDDDD),
      onError: Color(0xFFAAAAAA),
    );

    test(
        'FST.sCP-01: GIVEN SchemeColor.primary '
        'EXPECT onPrimary color to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.primary, scheme),
          equals(const Color(0xFF121212)));
    });
    test(
        'FST.sCP-02: GIVEN SchemeColor.onPrimary '
        'EXPECT primary color to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.onPrimary, scheme),
          equals(FlexColor.materialLightPrimary));
    });
    test(
        'FST.sCP-03: GIVEN SchemeColor.primaryVariant '
        'EXPECT onPrimary color to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.primaryVariant, scheme),
          equals(const Color(0xFF121212)));
    });
    test(
        'FST.sCP-04: GIVEN SchemeColor.secondary '
        'EXPECT onSecondary color to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.secondary, scheme),
          equals(const Color(0xFFEEEEEE)));
    });
    test(
        'FST.sCP-05: GIVEN SchemeColor.onSecondary '
        'EXPECT secondary color to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.onSecondary, scheme),
          equals(FlexColor.materialLightSecondary));
    });
    test(
        'FST.sCP-06: GIVEN SchemeColor.secondaryVariant '
        'EXPECT onSecondary color to be returned', () {
      expect(
          FlexSubThemes.schemeColorPair(SchemeColor.secondaryVariant, scheme),
          equals(const Color(0xFFEEEEEE)));
    });
    test(
        'FST.sCP-07: GIVEN SchemeColor.surface '
        'EXPECT onSurface color to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.surface, scheme),
          equals(const Color(0xFFCCCCCC)));
    });
    test(
        'FST.sCP-08: GIVEN SchemeColor.onSurface '
        'EXPECT surface color to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.onSurface, scheme),
          equals(FlexColor.materialLightSurface));
    });
    test(
        'FST.sCP-09: GIVEN SchemeColor.background '
        'EXPECT onBackground color to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.background, scheme),
          equals(const Color(0xFFDDDDDD)));
    });
    test(
        'FST.sCP-10: GIVEN SchemeColor.onBackground '
        'EXPECT background color to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.onBackground, scheme),
          equals(FlexColor.materialLightBackground));
    });
    test(
        'FST.sCP-11: GIVEN SchemeColor.error '
        'EXPECT onError color to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.error, scheme),
          equals(const Color(0xFFAAAAAA)));
    });
    test(
        'FST.sCP-12: GIVEN SchemeColor.onError '
        'EXPECT error color to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.onError, scheme),
          equals(FlexColor.materialLightError));
    });
  });
}
