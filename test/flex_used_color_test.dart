import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  //****************************************************************************
  // FlexSubThemes.usedColor static function unit tests.
  //****************************************************************************
  group('FST.UC: WITH usedColor ', () {
    const ColorScheme scheme = ColorScheme.light(
      primary: FlexColor.materialLightPrimary,
      primaryVariant: FlexColor.materialLightPrimaryVariant,
      secondary: FlexColor.materialLightSecondary,
      secondaryVariant: FlexColor.materialLightSecondaryVariant,
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
        'FST.UC-01: GIVEN FlexUsedColor.primary '
        'EXPECT primary color to be returned', () {
      expect(FlexSubThemes.usedColor(FlexUsedColor.primary, scheme),
          equals(FlexColor.materialLightPrimary));
    });
    test(
        'FST.UC-02: GIVEN FlexUsedColor.onPrimary '
        'EXPECT onPrimary color to be returned', () {
      expect(FlexSubThemes.usedColor(FlexUsedColor.onPrimary, scheme),
          equals(const Color(0xFF121212)));
    });
    test(
        'FST.UC-03: GIVEN FlexUsedColor.primaryVariant '
        'EXPECT primaryVariant color to be returned', () {
      expect(FlexSubThemes.usedColor(FlexUsedColor.primaryVariant, scheme),
          equals(FlexColor.materialLightPrimaryVariant));
    });
    test(
        'FST.UC-04: GIVEN FlexUsedColor.secondary '
        'EXPECT secondary color to be returned', () {
      expect(FlexSubThemes.usedColor(FlexUsedColor.secondary, scheme),
          equals(FlexColor.materialLightSecondary));
    });
    test(
        'FST.UC-05: GIVEN FlexUsedColor.onSecondary '
        'EXPECT onSecondary color to be returned', () {
      expect(FlexSubThemes.usedColor(FlexUsedColor.onSecondary, scheme),
          equals(const Color(0xFFEEEEEE)));
    });
    test(
        'FST.UC-06: GIVEN FlexUsedColor.secondaryVariant '
        'EXPECT secondaryVariant color to be returned', () {
      expect(FlexSubThemes.usedColor(FlexUsedColor.secondaryVariant, scheme),
          equals(FlexColor.materialLightSecondaryVariant));
    });
    test(
        'FST.UC-07: GIVEN FlexUsedColor.surface '
        'EXPECT surface color to be returned', () {
      expect(FlexSubThemes.usedColor(FlexUsedColor.surface, scheme),
          equals(FlexColor.materialLightSurface));
    });
    test(
        'FST.UC-08: GIVEN FlexUsedColor.onSurface '
        'EXPECT onSurface color to be returned', () {
      expect(FlexSubThemes.usedColor(FlexUsedColor.onSurface, scheme),
          equals(const Color(0xFFCCCCCC)));
    });
    test(
        'FST.UC-09: GIVEN FlexUsedColor.background '
        'EXPECT background color to be returned', () {
      expect(FlexSubThemes.usedColor(FlexUsedColor.background, scheme),
          equals(FlexColor.materialLightBackground));
    });
    test(
        'FST.UC-10: GIVEN FlexUsedColor.onBackground '
        'EXPECT onBackground color to be returned', () {
      expect(FlexSubThemes.usedColor(FlexUsedColor.onBackground, scheme),
          equals(const Color(0xFFDDDDDD)));
    });
    test(
        'FST.UC-11: GIVEN FlexUsedColor.error '
        'EXPECT error color to be returned', () {
      expect(FlexSubThemes.usedColor(FlexUsedColor.error, scheme),
          equals(FlexColor.materialLightError));
    });
    test(
        'FST.UC-12: GIVEN FlexUsedColor.onError '
        'EXPECT onError color to be returned', () {
      expect(FlexSubThemes.usedColor(FlexUsedColor.onError, scheme),
          equals(const Color(0xFFAAAAAA)));
    });
  });
}
