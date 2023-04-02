import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  //****************************************************************************
  // FlexSubThemes.schemeColor static function unit tests.
  //****************************************************************************
  const Color primary = Color(0xFF2765CE);
  const Color onPrimary = Color(0xFFD6D2D2);
  const Color primaryContainer = Color(0xFF5A83C6);
  const Color onPrimaryContainer = Color(0xFFE0E9F4);
  const Color secondary = Color(0xFFDF813E);
  const Color onSecondary = Color(0xFF5A3112);
  const Color secondaryContainer = Color(0xFFDF813E);
  const Color onSecondaryContainer = Color(0xFF301D0F);
  const Color tertiary = Color(0xFF390A73);
  const Color onTertiary = Color(0xFFD0BEEA);
  const Color tertiaryContainer = Color(0xFF583F6A);
  const Color onTertiaryContainer = Color(0xFFCFBEE3);
  const Color error = Color(0xFFAC0808);
  const Color onError = Color(0xFFE2CFCF);
  const Color errorContainer = Color(0xFFD68888);
  const Color onErrorContainer = Color(0xFF422626);
  const Color background = Color(0xFFE4E5E9);
  const Color onBackground = Color(0xFF2B2B2D);
  const Color surface = Color(0xFFD0D7F2);
  const Color onSurface = Color(0xFF26282D);
  const Color surfaceVariant = Color(0xFFB9C4F1);
  const Color onSurfaceVariant = Color(0xFF22252D);
  const Color outline = Color(0xFF020F34);
  const Color outlineVariant = Color(0xFF0D5937);
  const Color shadow = Color(0xFF060B20);
  const Color scrim = Color(0xFF071331);
  const Color inverseSurface = Color(0xFFBCCBED);
  const Color onInverseSurface = Color(0xFF2A303C);
  const Color inversePrimary = Color(0xFF333333);
  const Color surfaceTint = Color(0xFF4976C0);

  const ColorScheme scheme = ColorScheme.light(
    primary: primary,
    onPrimary: onPrimary,
    primaryContainer: primaryContainer,
    onPrimaryContainer: onPrimaryContainer,
    secondary: secondary,
    onSecondary: onSecondary,
    secondaryContainer: secondaryContainer,
    onSecondaryContainer: onSecondaryContainer,
    tertiary: tertiary,
    onTertiary: onTertiary,
    tertiaryContainer: tertiaryContainer,
    onTertiaryContainer: onTertiaryContainer,
    error: error,
    onError: onError,
    errorContainer: errorContainer,
    onErrorContainer: onErrorContainer,
    background: background,
    onBackground: onBackground,
    surface: surface,
    onSurface: onSurface,
    surfaceVariant: surfaceVariant,
    onSurfaceVariant: onSurfaceVariant,
    outline: outline,
    outlineVariant: outlineVariant,
    shadow: shadow,
    scrim: scrim,
    inverseSurface: inverseSurface,
    onInverseSurface: onInverseSurface,
    inversePrimary: inversePrimary,
    surfaceTint: surfaceTint,
  );

  group('FST.sC: FlexSubThemes.schemeColor WITH ColorScheme ', () {
    test(
        'FST.sC-01: GIVEN SchemeColor.primary '
        'EXPECT primary color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.primary, scheme),
          equals(primary));
    });
    test(
        'FST.sC-02: GIVEN SchemeColor.onPrimary '
        'EXPECT onPrimary color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.onPrimary, scheme),
          equals(onPrimary));
    });
    test(
        'FST.sC-03: GIVEN SchemeColor.primaryContainer '
        'EXPECT primaryContainer color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.primaryContainer, scheme),
          equals(primaryContainer));
    });

    test(
        'FST.sC-04: GIVEN SchemeColor.onPrimaryContainer '
        'EXPECT onPrimaryContainer color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.onPrimaryContainer, scheme),
          equals(onPrimaryContainer));
    });

    test(
        'FST.sC-05: GIVEN SchemeColor.secondary '
        'EXPECT secondary color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.secondary, scheme),
          equals(secondary));
    });
    test(
        'FST.sC-06: GIVEN SchemeColor.onSecondary '
        'EXPECT onSecondary color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.onSecondary, scheme),
          equals(onSecondary));
    });
    test(
        'FST.sC-07: GIVEN SchemeColor.secondaryContainer '
        'EXPECT secondaryContainer color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.secondaryContainer, scheme),
          equals(secondaryContainer));
    });
    test(
        'FST.sC-08: GIVEN SchemeColor.onSecondaryContainer '
        'EXPECT onSecondaryContainer color to be returned', () {
      expect(
          FlexSubThemes.schemeColor(SchemeColor.onSecondaryContainer, scheme),
          equals(onSecondaryContainer));
    });
    test(
        'FST.sC-09: GIVEN SchemeColor.tertiary '
        'EXPECT tertiary color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.tertiary, scheme),
          equals(tertiary));
    });
    test(
        'FST.sC-10: GIVEN SchemeColor.onTertiary '
        'EXPECT onTertiary color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.onTertiary, scheme),
          equals(onTertiary));
    });
    test(
        'FST.sC-11: GIVEN SchemeColor.tertiaryContainer '
        'EXPECT tertiaryContainer color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.tertiaryContainer, scheme),
          equals(tertiaryContainer));
    });
    test(
        'FST.sC-12: GIVEN SchemeColor.onTertiaryContainer '
        'EXPECT onTertiaryContainer color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.onTertiaryContainer, scheme),
          equals(onTertiaryContainer));
    });
    test(
        'FST.sC-13: GIVEN SchemeColor.error '
        'EXPECT error color to be returned', () {
      expect(
          FlexSubThemes.schemeColor(SchemeColor.error, scheme), equals(error));
    });
    test(
        'FST.sC-14: GIVEN SchemeColor.onError '
        'EXPECT onError color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.onError, scheme),
          equals(onError));
    });
    test(
        'FST.sC-15: GIVEN SchemeColor.errorContainer '
        'EXPECT errorContainer color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.errorContainer, scheme),
          equals(errorContainer));
    });
    test(
        'FST.sC-16: GIVEN SchemeColor.onErrorContainer '
        'EXPECT onErrorContainer color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.onErrorContainer, scheme),
          equals(onErrorContainer));
    });
    test(
        'FST.sC-17: GIVEN SchemeColor.background '
        'EXPECT background color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.background, scheme),
          equals(background));
    });
    test(
        'FST.sC-18: GIVEN SchemeColor.onBackground '
        'EXPECT onBackground color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.onBackground, scheme),
          equals(onBackground));
    });
    test(
        'FST.sC-19: GIVEN SchemeColor.surface '
        'EXPECT surface color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.surface, scheme),
          equals(surface));
    });
    test(
        'FST.sC-20: GIVEN SchemeColor.onSurface '
        'EXPECT onSurface color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.onSurface, scheme),
          equals(onSurface));
    });
    test(
        'FST.sC-21: GIVEN SchemeColor.surfaceVariant '
        'EXPECT surfaceVariant color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.surfaceVariant, scheme),
          equals(surfaceVariant));
    });
    test(
        'FST.sC-22: GIVEN SchemeColor.onSurfaceVariant '
        'EXPECT onSurfaceVariant color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.onSurfaceVariant, scheme),
          equals(onSurfaceVariant));
    });
    test(
        'FST.sC-23: GIVEN SchemeColor.outline '
        'EXPECT outline color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.outline, scheme),
          equals(outline));
    });
    test(
        'FST.sC-24: GIVEN SchemeColor.outlineVariant '
        'EXPECT outlineVariant color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.outlineVariant, scheme),
          equals(outlineVariant));
    });
    test(
        'FST.sC-25: GIVEN SchemeColor.shadow '
        'EXPECT shadow color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.shadow, scheme),
          equals(shadow));
    });
    test(
        'FST.sC-26: GIVEN SchemeColor.scrim '
        'EXPECT scrim color to be returned', () {
      expect(
          FlexSubThemes.schemeColor(SchemeColor.scrim, scheme), equals(scrim));
    });
    test(
        'FST.sC-27: GIVEN SchemeColor.inverseSurface '
        'EXPECT inverseSurface color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.inverseSurface, scheme),
          equals(inverseSurface));
    });
    test(
        'FST.sC-28: GIVEN SchemeColor.onInverseSurface '
        'EXPECT onInverseSurface color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.onInverseSurface, scheme),
          equals(onInverseSurface));
    });
    test(
        'FST.sC-29: GIVEN SchemeColor.inversePrimary '
        'EXPECT inversePrimary color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.inversePrimary, scheme),
          equals(inversePrimary));
    });
    test(
        'FST.sC-30: GIVEN SchemeColor.surfaceTint '
        'EXPECT surfaceTint color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.surfaceTint, scheme),
          equals(surfaceTint));
    });
  });

  //****************************************************************************
  // FlexSubThemes.schemeColorPair static function unit tests.
  //****************************************************************************
  group('FST.sCP: FlexSubThemes.schemeColorPair WITH ColorScheme ', () {
    test(
        'FST.sCP-01: GIVEN SchemeColor.primary '
        'EXPECT onPrimary color to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.primary, scheme),
          equals(onPrimary));
    });
    test(
        'FST.sCP-02: GIVEN SchemeColor.onPrimary '
        'EXPECT primary color to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.onPrimary, scheme),
          equals(primary));
    });
    test(
        'FST.sCP-03: GIVEN SchemeColor.primaryContainer '
        'EXPECT onPrimaryContainer color to be returned', () {
      expect(
          FlexSubThemes.schemeColorPair(SchemeColor.primaryContainer, scheme),
          equals(onPrimaryContainer));
    });
    test(
        'FST.sCP-04: GIVEN SchemeColor.onPrimaryContainer '
        'EXPECT primaryContainer color to be returned', () {
      expect(
          FlexSubThemes.schemeColorPair(SchemeColor.onPrimaryContainer, scheme),
          equals(primaryContainer));
    });
    test(
        'FST.sCP-05: GIVEN SchemeColor.secondary '
        'EXPECT onSecondary color to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.secondary, scheme),
          equals(onSecondary));
    });
    test(
        'FST.sCP-06: GIVEN SchemeColor.onSecondary '
        'EXPECT secondary color to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.onSecondary, scheme),
          equals(secondary));
    });
    test(
        'FST.sCP-07: GIVEN SchemeColor.secondaryContainer '
        'EXPECT onSecondaryContainer color to be returned', () {
      expect(
          FlexSubThemes.schemeColorPair(SchemeColor.secondaryContainer, scheme),
          equals(onSecondaryContainer));
    });
    test(
        'FST.sCP-08: GIVEN SchemeColor.onSecondaryContainer '
        'EXPECT secondaryContainer color to be returned', () {
      expect(
          FlexSubThemes.schemeColorPair(
              SchemeColor.onSecondaryContainer, scheme),
          equals(secondaryContainer));
    });
    test(
        'FST.sCP-09: GIVEN SchemeColor.tertiary '
        'EXPECT onTertiary color to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.tertiary, scheme),
          equals(onTertiary));
    });
    test(
        'FST.sCP-10: GIVEN SchemeColor.onTertiary '
        'EXPECT tertiary color to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.onTertiary, scheme),
          equals(tertiary));
    });
    test(
        'FST.sCP-11: GIVEN SchemeColor.tertiaryContainer '
        'EXPECT onTertiaryContainer color to be returned', () {
      expect(
          FlexSubThemes.schemeColorPair(SchemeColor.tertiaryContainer, scheme),
          equals(onTertiaryContainer));
    });
    test(
        'FST.sCP-12: GIVEN SchemeColor.onTertiaryContainer '
        'EXPECT tertiaryContainer color to be returned', () {
      expect(
          FlexSubThemes.schemeColorPair(
              SchemeColor.onTertiaryContainer, scheme),
          equals(tertiaryContainer));
    });
    test(
        'FST.sCP-13: GIVEN SchemeColor.error '
        'EXPECT onError color to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.error, scheme),
          equals(onError));
    });
    test(
        'FST.sCP-14: GIVEN SchemeColor.onError '
        'EXPECT error color to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.onError, scheme),
          equals(error));
    });
    test(
        'FST.sCP-15: GIVEN SchemeColor.errorContainer '
        'EXPECT onErrorContainer color to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.errorContainer, scheme),
          equals(onErrorContainer));
    });
    test(
        'FST.sCP-16: GIVEN SchemeColor.onErrorContainer '
        'EXPECT errorContainer color to be returned', () {
      expect(
          FlexSubThemes.schemeColorPair(SchemeColor.onErrorContainer, scheme),
          equals(errorContainer));
    });
    test(
        'FST.sCP-17: GIVEN SchemeColor.background '
        'EXPECT onBackground color to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.background, scheme),
          equals(onBackground));
    });
    test(
        'FST.sCP-18: GIVEN SchemeColor.onBackground '
        'EXPECT background color to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.onBackground, scheme),
          equals(background));
    });
    test(
        'FST.sCP-19: GIVEN SchemeColor.surface '
        'EXPECT onSurface color to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.surface, scheme),
          equals(onSurface));
    });
    test(
        'FST.sCP-20: GIVEN SchemeColor.onSurface '
        'EXPECT surface color to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.onSurface, scheme),
          equals(surface));
    });
    test(
        'FST.sCP-21: GIVEN SchemeColor.surfaceVariant '
        'EXPECT onSurfaceVariant color to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.surfaceVariant, scheme),
          equals(onSurfaceVariant));
    });
    test(
        'FST.sCP-22: GIVEN SchemeColor.onSurfaceVariant '
        'EXPECT surfaceVariant color to be returned', () {
      expect(
          FlexSubThemes.schemeColorPair(SchemeColor.onSurfaceVariant, scheme),
          equals(surfaceVariant));
    });
    test(
        'FST.sCP-23: GIVEN SchemeColor.outline '
        'EXPECT background color to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.outline, scheme),
          equals(background));
    });
    test(
        'FST.sCP-24: GIVEN SchemeColor.outlineVariant '
        'EXPECT onBackground color to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.outlineVariant, scheme),
          equals(onBackground));
    });
    test(
        'FST.sCP-25: GIVEN SchemeColor.shadow '
        'EXPECT outline color to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.shadow, scheme),
          equals(outline));
    });
    test(
        'FST.sCP-26: GIVEN SchemeColor.scrim '
        'EXPECT outline color to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.scrim, scheme),
          equals(outline));
    });
    test(
        'FST.sCP-27: GIVEN SchemeColor.inverseSurface '
        'EXPECT onInverseSurface color to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.inverseSurface, scheme),
          equals(onInverseSurface));
    });
    test(
        'FST.sCP-28: GIVEN SchemeColor.onInverseSurface '
        'EXPECT inverseSurface color to be returned', () {
      expect(
          FlexSubThemes.schemeColorPair(SchemeColor.onInverseSurface, scheme),
          equals(inverseSurface));
    });
    test(
        'FST.sCP-29: GIVEN SchemeColor.inversePrimary '
        'EXPECT onSurface color to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.inversePrimary, scheme),
          equals(onSurface));
    });
    test(
        'FST.sCP-30: GIVEN SchemeColor.surfaceTint '
        'EXPECT primary color to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.surfaceTint, scheme),
          equals(onPrimary));
    });
  });
}
