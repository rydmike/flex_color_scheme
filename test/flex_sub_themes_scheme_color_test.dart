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
  const Color primaryFixed = Color(0xFF5477AF);
  const Color onPrimaryFixed = Color(0xFFCACED7);
  const Color primaryFixedDim = Color(0xFF445777);
  const Color onPrimaryFixedVariant = Color(0xFFBFD6DC);

  const Color secondary = Color(0xFFDF813E);
  const Color onSecondary = Color(0xFF5A3112);
  const Color secondaryContainer = Color(0xFFDF813E);
  const Color onSecondaryContainer = Color(0xFF301D0F);
  const Color secondaryFixed = Color(0xFFC9753C);
  const Color onSecondaryFixed = Color(0xFF332114);
  const Color secondaryFixedDim = Color(0xFF603617);
  const Color onSecondaryFixedVariant = Color(0xFFAB8161);

  const Color tertiary = Color(0xFF390A73);
  const Color onTertiary = Color(0xFFD0BEEA);
  const Color tertiaryContainer = Color(0xFF583F6A);
  const Color onTertiaryContainer = Color(0xFFCFBEE3);
  const Color tertiaryFixed = Color(0xFF602F9F);
  const Color onTertiaryFixed = Color(0xFFA693C0);
  const Color tertiaryFixedDim = Color(0xFF5D3A86);
  const Color onTertiaryFixedVariant = Color(0xFF504462);

  const Color error = Color(0xFFAC0808);
  const Color onError = Color(0xFFE2CFCF);
  const Color errorContainer = Color(0xFFD68888);
  const Color onErrorContainer = Color(0xFF422626);
  const Color surface = Color(0xFFD0D7F2);
  const Color surfaceDim = Color(0xFF9DA3B6);
  const Color surfaceBright = Color(0xFFF0F2FA);
  const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  const Color surfaceContainerLow = Color(0xFFDDE0EE);
  const Color surfaceContainer = Color(0xFFA9B2D5);
  const Color surfaceContainerHigh = Color(0xFF9299B2);
  const Color surfaceContainerHighest = Color(0xFF858CA8);
  const Color onSurface = Color(0xFF26282D);
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
    primaryFixed: primaryFixed,
    onPrimaryFixed: onPrimaryFixed,
    primaryFixedDim: primaryFixedDim,
    onPrimaryFixedVariant: onPrimaryFixedVariant,
    //
    secondary: secondary,
    onSecondary: onSecondary,
    secondaryContainer: secondaryContainer,
    onSecondaryContainer: onSecondaryContainer,
    secondaryFixed: secondaryFixed,
    onSecondaryFixed: onSecondaryFixed,
    secondaryFixedDim: secondaryFixedDim,
    onSecondaryFixedVariant: onSecondaryFixedVariant,
    //
    tertiary: tertiary,
    onTertiary: onTertiary,
    tertiaryContainer: tertiaryContainer,
    onTertiaryContainer: onTertiaryContainer,
    tertiaryFixed: tertiaryFixed,
    onTertiaryFixed: onTertiaryFixed,
    tertiaryFixedDim: tertiaryFixedDim,
    onTertiaryFixedVariant: onTertiaryFixedVariant,
    //
    error: error,
    onError: onError,
    errorContainer: errorContainer,
    onErrorContainer: onErrorContainer,
    //
    surface: surface,
    surfaceDim: surfaceDim,
    surfaceBright: surfaceBright,
    surfaceContainerLowest: surfaceContainerLowest,
    surfaceContainerLow: surfaceContainerLow,
    surfaceContainer: surfaceContainer,
    surfaceContainerHigh: surfaceContainerHigh,
    surfaceContainerHighest: surfaceContainerHighest,
    onSurface: onSurface,
    onSurfaceVariant: onSurfaceVariant,
    //
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
        'FST.sC-04-1: GIVEN SchemeColor.primaryFixed '
        'EXPECT primaryFixed color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.primaryFixed, scheme),
          equals(primaryFixed));
    });
    test(
        'FST.sC-04-2: GIVEN SchemeColor.onPrimaryFixed '
        'EXPECT onPrimaryFixed color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.onPrimaryFixed, scheme),
          equals(onPrimaryFixed));
    });

    test(
        'FST.sC-04-3: GIVEN SchemeColor.primaryFixedDim '
        'EXPECT primaryFixedDim color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.primaryFixedDim, scheme),
          equals(primaryFixedDim));
    });
    test(
        'FST.sC-04-4: GIVEN SchemeColor.onPrimaryFixedVariant '
        'EXPECT onPrimaryFixedVariant color to be returned', () {
      expect(
          FlexSubThemes.schemeColor(SchemeColor.onPrimaryFixedVariant, scheme),
          equals(onPrimaryFixedVariant));
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
        'FST.sC-08-1: GIVEN SchemeColor.secondaryFixed '
        'EXPECT secondaryFixed color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.secondaryFixed, scheme),
          equals(secondaryFixed));
    });
    test(
        'FST.sC-08-2: GIVEN SchemeColor.onSecondaryFixed '
        'EXPECT onSecondaryFixed color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.onSecondaryFixed, scheme),
          equals(onSecondaryFixed));
    });
    test(
        'FST.sC-08-3: GIVEN SchemeColor.secondaryFixedDim '
        'EXPECT secondaryFixedDim color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.secondaryFixedDim, scheme),
          equals(secondaryFixedDim));
    });
    test(
        'FST.sC-08-4: GIVEN SchemeColor.onSecondaryFixedVariant '
        'EXPECT onSecondaryFixedVariant color to be returned', () {
      expect(
          FlexSubThemes.schemeColor(
              SchemeColor.onSecondaryFixedVariant, scheme),
          equals(onSecondaryFixedVariant));
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
        'FST.sC-12-1: GIVEN SchemeColor.tertiaryFixed '
        'EXPECT tertiaryFixed color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.tertiaryFixed, scheme),
          equals(tertiaryFixed));
    });
    test(
        'FST.sC-12-2: GIVEN SchemeColor.onTertiaryFixed '
        'EXPECT onTertiaryFixed color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.onTertiaryFixed, scheme),
          equals(onTertiaryFixed));
    });
    test(
        'FST.sC-12-3: GIVEN SchemeColor.tertiaryFixedDim '
        'EXPECT tertiaryFixedDim color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.tertiaryFixedDim, scheme),
          equals(tertiaryFixedDim));
    });
    test(
        'FST.sC-12-4: GIVEN SchemeColor.onTertiaryFixedVariant '
        'EXPECT onTertiaryFixedVariant color to be returned', () {
      expect(
          FlexSubThemes.schemeColor(SchemeColor.onTertiaryFixedVariant, scheme),
          equals(onTertiaryFixedVariant));
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
        'FST.sC-19: GIVEN SchemeColor.surface '
        'EXPECT surface color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.surface, scheme),
          equals(surface));
    });
    test(
        'FST.sC-19-1: GIVEN SchemeColor.surfaceDim '
        'EXPECT surfaceDim color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.surfaceDim, scheme),
          equals(surfaceDim));
    });
    test(
        'FST.sC-19-2: GIVEN SchemeColor.surfaceBright '
        'EXPECT surfaceBright color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.surfaceBright, scheme),
          equals(surfaceBright));
    });
    test(
        'FST.sC-19-3: GIVEN SchemeColor.surfaceContainerLowest '
        'EXPECT surfaceContainerLowest color to be returned', () {
      expect(
          FlexSubThemes.schemeColor(SchemeColor.surfaceContainerLowest, scheme),
          equals(surfaceContainerLowest));
    });
    test(
        'FST.sC-19-4: GIVEN SchemeColor.surfaceContainerLow '
        'EXPECT surfaceContainerLow color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.surfaceContainerLow, scheme),
          equals(surfaceContainerLow));
    });
    test(
        'FST.sC-19-5: GIVEN SchemeColor.surfaceContainer '
        'EXPECT surfaceContainer color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.surfaceContainer, scheme),
          equals(surfaceContainer));
    });
    test(
        'FST.sC-19-6: GIVEN SchemeColor.surfaceContainerHigh '
        'EXPECT surfaceContainerHigh color to be returned', () {
      expect(
          FlexSubThemes.schemeColor(SchemeColor.surfaceContainerHigh, scheme),
          equals(surfaceContainerHigh));
    });
    test(
        'FST.sC-19-6: GIVEN SchemeColor.surfaceContainerHighest '
        'EXPECT surfaceContainerHighest color to be returned', () {
      expect(
          FlexSubThemes.schemeColor(
              SchemeColor.surfaceContainerHighest, scheme),
          equals(surfaceContainerHighest));
    });
    test(
        'FST.sC-20: GIVEN SchemeColor.onSurface '
        'EXPECT onSurface color to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.onSurface, scheme),
          equals(onSurface));
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
    test(
        'FST.sC-31: GIVEN SchemeColor.black '
        'EXPECT Colors.black to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.black, scheme),
          equals(Colors.black));
    });
    test(
        'FST.sC-32: GIVEN SchemeColor.white '
        'EXPECT Colors.white to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.white, scheme),
          equals(Colors.white));
    });
    test(
        'FST.sC-33: GIVEN SchemeColor.transparent '
        'EXPECT Colors.transparent to be returned', () {
      expect(FlexSubThemes.schemeColor(SchemeColor.transparent, scheme),
          equals(Colors.transparent));
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
        'FST.sCP-04-1: GIVEN SchemeColor.primaryFixed '
        'EXPECT onPrimaryFixed color to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.primaryFixed, scheme),
          equals(onPrimaryFixed));
    });
    test(
        'FST.sCP-04-2: GIVEN SchemeColor.onPrimaryFixed '
        'EXPECT primaryFixed color to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.onPrimaryFixed, scheme),
          equals(primaryFixed));
    });
    test(
        'FST.sCP-04-3: GIVEN SchemeColor.primaryFixedDim '
        'EXPECT onPrimaryFixedVariant color to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.primaryFixedDim, scheme),
          equals(onPrimaryFixedVariant));
    });
    test(
        'FST.sCP-04-4: GIVEN SchemeColor.onPrimaryFixedVariant '
        'EXPECT primaryFixedDim color to be returned', () {
      expect(
          FlexSubThemes.schemeColorPair(
              SchemeColor.onPrimaryFixedVariant, scheme),
          equals(primaryFixedDim));
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
        'FST.sCP-08-1: GIVEN SchemeColor.secondaryFixed '
        'EXPECT onSecondaryFixed color to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.secondaryFixed, scheme),
          equals(onSecondaryFixed));
    });
    test(
        'FST.sCP-08-2: GIVEN SchemeColor.onSecondaryFixed '
        'EXPECT secondaryFixed color to be returned', () {
      expect(
          FlexSubThemes.schemeColorPair(SchemeColor.onSecondaryFixed, scheme),
          equals(secondaryFixed));
    });
    test(
        'FST.sCP-08-3: GIVEN SchemeColor.secondaryFixedDim '
        'EXPECT onSecondaryFixedVariant color to be returned', () {
      expect(
          FlexSubThemes.schemeColorPair(SchemeColor.secondaryFixedDim, scheme),
          equals(onSecondaryFixedVariant));
    });
    test(
        'FST.sCP-08-4: GIVEN SchemeColor.onSecondaryFixedVariant '
        'EXPECT secondaryFixedDim color to be returned', () {
      expect(
          FlexSubThemes.schemeColorPair(
              SchemeColor.onSecondaryFixedVariant, scheme),
          equals(secondaryFixedDim));
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
        'FST.sCP-12-1: GIVEN SchemeColor.tertiaryFixed '
        'EXPECT onTertiaryFixed color to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.tertiaryFixed, scheme),
          equals(onTertiaryFixed));
    });
    test(
        'FST.sCP-12-2: GIVEN SchemeColor.onTertiaryFixed '
        'EXPECT tertiaryFixed color to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.onTertiaryFixed, scheme),
          equals(tertiaryFixed));
    });
    test(
        'FST.sCP-12-3: GIVEN SchemeColor.tertiaryFixedDim '
        'EXPECT onTertiaryFixedVariant color to be returned', () {
      expect(
          FlexSubThemes.schemeColorPair(SchemeColor.tertiaryFixedDim, scheme),
          equals(onTertiaryFixedVariant));
    });
    test(
        'FST.sCP-12-4: GIVEN SchemeColor.onTertiaryFixedVariant '
        'EXPECT tertiaryFixedDim color to be returned', () {
      expect(
          FlexSubThemes.schemeColorPair(
              SchemeColor.onTertiaryFixedVariant, scheme),
          equals(tertiaryFixedDim));
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
        'FST.sCP-19-1: GIVEN SchemeColor.surface '
        'EXPECT onSurface color to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.surface, scheme),
          equals(onSurface));
    });
    test(
        'FST.sCP-19-2: GIVEN SchemeColor.surfaceDim '
        'EXPECT onSurface color to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.surfaceDim, scheme),
          equals(onSurface));
    });
    test(
        'FST.sCP-19-3: GIVEN SchemeColor.surfaceBright '
        'EXPECT onSurface color to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.surfaceBright, scheme),
          equals(onSurface));
    });
    test(
        'FST.sCP-19-4: GIVEN SchemeColor.surfaceContainerLowest '
        'EXPECT onSurface color to be returned', () {
      expect(
          FlexSubThemes.schemeColorPair(
              SchemeColor.surfaceContainerLowest, scheme),
          equals(onSurface));
    });
    test(
        'FST.sCP-19-5: GIVEN SchemeColor.surfaceContainerLow '
        'EXPECT onSurface color to be returned', () {
      expect(
          FlexSubThemes.schemeColorPair(
              SchemeColor.surfaceContainerLow, scheme),
          equals(onSurface));
    });
    test(
        'FST.sCP-19-6: GIVEN SchemeColor.surfaceContainer '
        'EXPECT onSurface color to be returned', () {
      expect(
          FlexSubThemes.schemeColorPair(SchemeColor.surfaceContainer, scheme),
          equals(onSurface));
    });
    test(
        'FST.sCP-19-7: GIVEN SchemeColor.surfaceContainerHigh '
        'EXPECT onSurface color to be returned', () {
      expect(
          FlexSubThemes.schemeColorPair(
              SchemeColor.surfaceContainerHigh, scheme),
          equals(onSurface));
    });
    test(
        'FST.sCP-19-8: GIVEN SchemeColor.surfaceContainerHighest '
        'EXPECT onSurface color to be returned', () {
      expect(
          FlexSubThemes.schemeColorPair(
              SchemeColor.surfaceContainerHighest, scheme),
          equals(onSurface));
    });
    test(
        'FST.sCP-19-9: GIVEN SchemeColor.transparent '
        'EXPECT onSurface color to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.transparent, scheme),
          equals(onSurface));
    });
    test(
        'FST.sCP-19-1v: GIVEN SchemeColor.surface '
        'EXPECT onSurfaceVariant color to be returned', () {
      expect(
          FlexSubThemes.schemeColorPair(SchemeColor.surface, scheme,
              useOnSurfaceVariant: true),
          equals(onSurfaceVariant));
    });
    test(
        'FST.sCP-19-2v: GIVEN SchemeColor.surfaceDim '
        'EXPECT onSurfaceVariant color to be returned', () {
      expect(
          FlexSubThemes.schemeColorPair(SchemeColor.surfaceDim, scheme,
              useOnSurfaceVariant: true),
          equals(onSurfaceVariant));
    });
    test(
        'FST.sCP-19-3v: GIVEN SchemeColor.surfaceBright '
        'EXPECT onSurfaceVariant color to be returned', () {
      expect(
          FlexSubThemes.schemeColorPair(SchemeColor.surfaceBright, scheme,
              useOnSurfaceVariant: true),
          equals(onSurfaceVariant));
    });
    test(
        'FST.sCP-19-4v: GIVEN SchemeColor.surfaceContainerLowest '
        'EXPECT onSurfaceVariant color to be returned', () {
      expect(
          FlexSubThemes.schemeColorPair(
              SchemeColor.surfaceContainerLowest, scheme,
              useOnSurfaceVariant: true),
          equals(onSurfaceVariant));
    });
    test(
        'FST.sCP-19-5v: GIVEN SchemeColor.surfaceContainerLow '
        'EXPECT onSurfaceVariant color to be returned', () {
      expect(
          FlexSubThemes.schemeColorPair(SchemeColor.surfaceContainerLow, scheme,
              useOnSurfaceVariant: true),
          equals(onSurfaceVariant));
    });
    test(
        'FST.sCP-19-6v: GIVEN SchemeColor.surfaceContainer '
        'EXPECT onSurfaceVariant color to be returned', () {
      expect(
          FlexSubThemes.schemeColorPair(SchemeColor.surfaceContainer, scheme,
              useOnSurfaceVariant: true),
          equals(onSurfaceVariant));
    });
    test(
        'FST.sCP-19-7v: GIVEN SchemeColor.surfaceContainerHigh '
        'EXPECT onSurfaceVariant color to be returned', () {
      expect(
          FlexSubThemes.schemeColorPair(
              SchemeColor.surfaceContainerHigh, scheme,
              useOnSurfaceVariant: true),
          equals(onSurfaceVariant));
    });
    test(
        'FST.sCP-19-8v: GIVEN SchemeColor.surfaceContainerHighest '
        'EXPECT onSurfaceVariant color to be returned', () {
      expect(
          FlexSubThemes.schemeColorPair(
              SchemeColor.surfaceContainerHighest, scheme,
              useOnSurfaceVariant: true),
          equals(onSurfaceVariant));
    });
    test(
        'FST.sCP-19-9v: GIVEN SchemeColor.transparent '
        'EXPECT onSurfaceVariant color to be returned', () {
      expect(
          FlexSubThemes.schemeColorPair(SchemeColor.transparent, scheme,
              useOnSurfaceVariant: true),
          equals(onSurfaceVariant));
    });
    test(
        'FST.sCP-20: GIVEN SchemeColor.onSurface '
        'EXPECT surface color to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.onSurface, scheme),
          equals(surface));
    });
    test(
        'FST.sCP-22: GIVEN SchemeColor.onSurfaceVariant '
        'EXPECT surface color to be returned', () {
      expect(
          FlexSubThemes.schemeColorPair(SchemeColor.onSurfaceVariant, scheme),
          equals(surfaceContainerLowest));
    });
    test(
        'FST.sCP-23: GIVEN SchemeColor.outline '
        'EXPECT surface color to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.outline, scheme),
          equals(surface));
    });
    test(
        'FST.sCP-24: GIVEN SchemeColor.outlineVariant '
        'EXPECT onSurface color to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.outlineVariant, scheme),
          equals(onSurface));
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
    test(
        'FST.sCP-31: GIVEN SchemeColor.black '
        'EXPECT Color.white to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.black, scheme),
          equals(Colors.white));
    });
    test(
        'FST.sCP-32: GIVEN SchemeColor.white '
        'EXPECT Colors.black to be returned', () {
      expect(FlexSubThemes.schemeColorPair(SchemeColor.white, scheme),
          equals(Colors.black));
    });
  });
}
