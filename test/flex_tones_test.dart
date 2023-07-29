import 'dart:ui';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // TODO(rydmike): Consider removing maybe not needed FlexSeedScheme tests.
  // The FlexSeedScheme tests are a legacy in FlexColorScheme from before when
  // the feature had not been moved to its own package.
  //****************************************************************************
  // FlexTones unit tests.
  //
  // Basic object tests, equality, none equal.
  //****************************************************************************
  group('FTO1: WITH FlexTones ', () {
    // m1, is the baseline for FlexTones tests
    const FlexTones m1 = FlexTones(
      primaryTone: 40,
      onPrimaryTone: 100,
      primaryContainerTone: 90,
      onPrimaryContainerTone: 10,
      secondaryTone: 40,
      onSecondaryTone: 100,
      secondaryContainerTone: 90,
      onSecondaryContainerTone: 10,
      tertiaryTone: 40,
      onTertiaryTone: 100,
      tertiaryContainerTone: 90,
      onTertiaryContainerTone: 10,
      errorTone: 40,
      onErrorTone: 100,
      errorContainerTone: 90,
      onErrorContainerTone: 10,
      backgroundTone: 99,
      onBackgroundTone: 10,
      surfaceTone: 99,
      onSurfaceTone: 10,
      surfaceVariantTone: 90,
      onSurfaceVariantTone: 30,
      outlineTone: 50,
      outlineVariantTone: 80,
      shadowTone: 0,
      scrimTone: 0,
      inverseSurfaceTone: 20,
      onInverseSurfaceTone: 95,
      inversePrimaryTone: 80,
      surfaceTintTone: 40,
      primaryChroma: null,
      primaryMinChroma: null,
      secondaryChroma: null,
      secondaryMinChroma: null,
      tertiaryChroma: null,
      tertiaryMinChroma: null,
      tertiaryHueRotation: null,
      errorChroma: null,
      errorMinChroma: null,
      neutralChroma: 4,
      neutralMinChroma: null,
      neutralVariantChroma: 8,
      neutralVariantMinChroma: null,
    );
    // m2, has same definition as m1, but via default values
    const FlexTones m2 = FlexTones.light();
    // m3, has same definition as m1, but one value is different.
    const FlexTones m3 = FlexTones.light(surfaceTintTone: 80);
    // m4, has all values different from m1
    const FlexTones m4 = FlexTones.dark();
    // Do identity tests
    test(
        'FTO1.01a: GIVEN same FlexTones objects '
        'EXPECT them to be equal', () {
      expect(m1, equals(m1));
    });
    test(
        'FTO1.01b: GIVEN same FlexTones objects '
        'EXPECT them to have identity', () {
      expect(identical(m1, m1), true);
    });
    test(
        'FTO1.01c: GIVEN two equal FlexTones objects '
        'EXPECT them to have equality', () {
      expect(m1, equals(m2));
    });
    test(
        'FTO1.01d: GIVEN two equal FlexTones objects '
        'EXPECT them to have identity', () {
      expect(identical(m1, m2), true);
    });
    test(
        'FTO1.01c: GIVEN two equal FlexTones objects '
        'EXPECT them to have equality with operator', () {
      expect(m1 == m2, true);
    });
    test(
        'FTO1.02a: GIVEN none equal FlexTones objects '
        'EXPECT them to be unequal', () {
      expect(m1, isNot(m3));
    });
    test(
        'FTO1.02b: GIVEN none equal FlexTones objects '
        'EXPECT them to be unequal with operator', () {
      expect(m1 != m3, true);
    });
    //**************************************************************************
    // FlexTones unit tests.
    //
    // Test .copyWith, full and null..
    //**************************************************************************
    test(
        'FTO1.09a: GIVEN a FlexTones object EXPECT it to be equal to '
        'an unequal object when made equal with copyWith.', () {
      expect(
        m3.copyWith(
          surfaceTintTone: 40,
        ),
        equals(m1),
      );
    });
    test(
        'FTO1.09b: GIVEN a FlexTones object EXPECT it to be unchanged '
        'after and empty copyWith.', () {
      expect(
        m1.copyWith(),
        equals(m1),
      );
    });
    test(
        'FTO1.09c: GIVEN a FlexTones with all different values '
        'EXPECT equal to an unequal one when made equal with copyWith.', () {
      expect(
        m4.copyWith(
          primaryTone: 40,
          onPrimaryTone: 100,
          primaryContainerTone: 90,
          onPrimaryContainerTone: 10,
          secondaryTone: 40,
          onSecondaryTone: 100,
          secondaryContainerTone: 90,
          onSecondaryContainerTone: 10,
          tertiaryTone: 40,
          onTertiaryTone: 100,
          tertiaryContainerTone: 90,
          onTertiaryContainerTone: 10,
          errorTone: 40,
          onErrorTone: 100,
          errorContainerTone: 90,
          onErrorContainerTone: 10,
          backgroundTone: 99,
          onBackgroundTone: 10,
          surfaceTone: 99,
          onSurfaceTone: 10,
          surfaceVariantTone: 90,
          onSurfaceVariantTone: 30,
          outlineTone: 50,
          outlineVariantTone: 80,
          shadowTone: 0,
          scrimTone: 0,
          inverseSurfaceTone: 20,
          onInverseSurfaceTone: 95,
          inversePrimaryTone: 80,
          surfaceTintTone: 40,
          primaryChroma: null,
          primaryMinChroma: null,
          secondaryChroma: null,
          secondaryMinChroma: null,
          tertiaryChroma: null,
          tertiaryMinChroma: null,
          errorChroma: null,
          errorMinChroma: null,
          neutralChroma: 4,
          neutralMinChroma: null,
          neutralVariantChroma: 8,
          neutralVariantMinChroma: null,
        ),
        equals(m1),
      );
    });

    //**************************************************************************
    // FlexTones unit tests.
    //
    // toString and hashcode.
    //**************************************************************************

    test(
        'FTO1.10: Test toString implemented via debugFillProperties '
        'EXPECT exact print string value.', () {
      expect(
          m1.toString(),
          //
          equalsIgnoringHashCodes(
              // ignore: lines_longer_than_80_chars
              'FlexTones#00000(primaryTone: 40, onPrimaryTone: 100, primaryContainerTone: 90, onPrimaryContainerTone: 10, secondaryTone: 40, onSecondaryTone: 100, secondaryContainerTone: 90, onSecondaryContainerTone: 10, tertiaryTone: 40, onTertiaryTone: 100, tertiaryContainerTone: 90, onTertiaryContainerTone: 10, errorTone: 40, errorContainerTone: 90, onErrorContainerTone: 10, backgroundTone: 99, onBackgroundTone: 10, surfaceTone: 99, onSurfaceTone: 10, surfaceVariantTone: 90, onSurfaceVariantTone: 30, outlineTone: 50, outlineVariantTone: 80, shadowTone: 0, scrimTone: 0, inverseSurfaceTone: 20, onInverseSurfaceTone: 95, inversePrimaryTone: 80, surfaceTintTone: 40, primaryChroma: null, primaryMinChroma: null, secondaryChroma: null, secondaryMinChroma: null, tertiaryChroma: null, tertiaryHueRotation: null, tertiaryMinChroma: null, errorChroma: null, errorMinChroma: null, neutralChroma: 4.0, neutralMinChroma: null, neutralVariantChroma: 8.0, neutralVariantMinChroma: null, paletteType: common)'));
    });
    test(
        'FTO1.11: Test toStringShort implemented via debugFillProperties '
        'EXPECT exact short printout.', () {
      expect(m1.toStringShort(), equalsIgnoringHashCodes('FlexTones#00000'));
    });
    test('FTO1.12: Test hashCode has value.', () {
      expect(m1.hashCode, isNotNull);
    });
    test('FTO1.14: Test hashCode copyWith has same exact value.', () {
      expect(m1.hashCode, equals(m1.copyWith().hashCode));
    });

    //**************************************************************************
    // FlexTones unit tests.
    //
    // Test that all built in FlexTones definitions are as they were defined
    // originally. Main purposes just to check that nobody fiddled with the
    // definition values, without also changing tests and knowingly doing a
    // a breaking change.
    //**************************************************************************

    test('FTO1.015: Verify FlexTones.light definition. ', () {
      expect(
        const FlexTones.light(),
        equals(
          const FlexTones(
            primaryTone: 40,
            onPrimaryTone: 100,
            primaryContainerTone: 90,
            onPrimaryContainerTone: 10,
            secondaryTone: 40,
            onSecondaryTone: 100,
            secondaryContainerTone: 90,
            onSecondaryContainerTone: 10,
            tertiaryTone: 40,
            onTertiaryTone: 100,
            tertiaryContainerTone: 90,
            onTertiaryContainerTone: 10,
            errorTone: 40,
            onErrorTone: 100,
            errorContainerTone: 90,
            onErrorContainerTone: 10,
            backgroundTone: 99,
            onBackgroundTone: 10,
            surfaceTone: 99,
            onSurfaceTone: 10,
            surfaceVariantTone: 90,
            onSurfaceVariantTone: 30,
            outlineTone: 50,
            outlineVariantTone: 80,
            shadowTone: 0,
            scrimTone: 0,
            inverseSurfaceTone: 20,
            onInverseSurfaceTone: 95,
            inversePrimaryTone: 80,
            surfaceTintTone: 40,
            primaryChroma: null,
            primaryMinChroma: null,
            secondaryChroma: null,
            secondaryMinChroma: null,
            tertiaryChroma: null,
            tertiaryMinChroma: null,
            tertiaryHueRotation: null,
            errorChroma: null,
            errorMinChroma: null,
            neutralChroma: 4,
            neutralMinChroma: null,
            neutralVariantChroma: 8,
            neutralVariantMinChroma: null,
          ),
        ),
      );
    });
    test('FTO1.016: Verify FlexTones.dark definition. ', () {
      expect(
        const FlexTones.dark(),
        equals(
          const FlexTones(
            primaryTone: 80,
            onPrimaryTone: 20,
            primaryContainerTone: 30,
            onPrimaryContainerTone: 90,
            secondaryTone: 80,
            onSecondaryTone: 20,
            secondaryContainerTone: 30,
            onSecondaryContainerTone: 90,
            tertiaryTone: 80,
            onTertiaryTone: 20,
            tertiaryContainerTone: 30,
            onTertiaryContainerTone: 90,
            errorTone: 80,
            onErrorTone: 20,
            errorContainerTone: 30,
            onErrorContainerTone: 80,
            backgroundTone: 10,
            onBackgroundTone: 90,
            surfaceTone: 10,
            onSurfaceTone: 90,
            surfaceVariantTone: 30,
            onSurfaceVariantTone: 80,
            outlineTone: 60,
            outlineVariantTone: 30,
            shadowTone: 0,
            scrimTone: 0,
            inverseSurfaceTone: 90,
            onInverseSurfaceTone: 20,
            inversePrimaryTone: 40,
            surfaceTintTone: 80,
            primaryChroma: null,
            primaryMinChroma: null,
            secondaryChroma: null,
            secondaryMinChroma: null,
            tertiaryChroma: null,
            tertiaryMinChroma: null,
            tertiaryHueRotation: null,
            errorChroma: null,
            errorMinChroma: null,
            neutralChroma: 4,
            neutralMinChroma: null,
            neutralVariantChroma: 8,
            neutralVariantMinChroma: null,
          ),
        ),
      );
    });
    test('FTO1.017: Verify FlexTones.material(Brightness.light).', () {
      expect(
        FlexTones.material(Brightness.light),
        equals(const FlexTones.light(
          secondaryChroma: 16,
          tertiaryChroma: 24,
        )),
      );
    });
    test('FTO1.018: Verify FlexTones.material(Brightness.dark).', () {
      expect(
        FlexTones.material(Brightness.dark),
        equals(const FlexTones.dark(
          secondaryChroma: 16,
          tertiaryChroma: 24,
        )),
      );
    });
    test('FTO1.019: Verify FlexTones.soft(Brightness.light).', () {
      expect(
        FlexTones.soft(Brightness.light),
        equals(
          const FlexTones.light(
            primaryChroma: 30,
            primaryMinChroma: 0,
            secondaryChroma: 14,
            tertiaryChroma: 20,
          ),
        ),
      );
    });
    test('FTO1.020: Verify FlexTones.soft(Brightness.dark).', () {
      expect(
        FlexTones.soft(Brightness.dark),
        equals(
          const FlexTones.dark(
            primaryChroma: 30,
            primaryMinChroma: 0,
            secondaryChroma: 14,
            tertiaryChroma: 20,
          ),
        ),
      );
    });
    test('FTO1.021: Verify FlexTones.vivid(Brightness.light).', () {
      expect(
        FlexTones.vivid(Brightness.light),
        equals(
          const FlexTones.light(
            primaryTone: 30,
            surfaceTintTone: 30,
            surfaceTone: 98,
            primaryMinChroma: 50,
          ),
        ),
      );
    });
    test('FTO1.022: Verify FlexTones.vivid(Brightness.dark).', () {
      expect(
        FlexTones.vivid(Brightness.dark),
        equals(
          const FlexTones.dark(
            onPrimaryTone: 10,
            primaryContainerTone: 20,
            backgroundTone: 5,
            primaryMinChroma: 50,
          ),
        ),
      );
    });
    test('FTO1.023: Verify FlexTones.vividSurfaces(Brightness.light).', () {
      expect(
        FlexTones.vividSurfaces(Brightness.light),
        equals(
          const FlexTones.light(
            primaryTone: 30,
            onPrimaryTone: 98,
            onSecondaryTone: 98,
            onTertiaryTone: 98,
            onErrorTone: 98,
            surfaceTone: 95,
            onSurfaceVariantTone: 20,
            inverseSurfaceTone: 30,
            backgroundTone: 98,
            surfaceTintTone: 30,
            //
            primaryMinChroma: 50,
            neutralChroma: 5,
            neutralVariantChroma: 10,
          ),
        ),
      );
    });
    test('FTO1.023b: Verify FlexTones.vividSurfaces(Brightness.light).', () {
      expect(
        FlexTones.vividBackground(Brightness.light),
        equals(
          const FlexTones.light(
            primaryTone: 30,
            onPrimaryTone: 98,
            onSecondaryTone: 98,
            onTertiaryTone: 98,
            onErrorTone: 98,
            surfaceTone: 98,
            onSurfaceVariantTone: 20,
            inverseSurfaceTone: 30,
            backgroundTone: 95,
            surfaceTintTone: 30,
            //
            primaryMinChroma: 50,
            neutralChroma: 5,
            neutralVariantChroma: 10,
          ),
        ),
      );
    });
    test('FTO1.024b: Verify FlexTones.vividSurfaces(Brightness.dark).', () {
      expect(
        FlexTones.vividBackground(Brightness.dark),
        equals(
          const FlexTones.dark(
            onPrimaryTone: 10,
            onSecondaryTone: 10,
            onTertiaryTone: 10,
            primaryContainerTone: 20,
            backgroundTone: 20,
            onSurfaceVariantTone: 95,
            inverseSurfaceTone: 95,
            //
            primaryMinChroma: 50,
            neutralChroma: 5,
            neutralVariantChroma: 10,
          ),
        ),
      );
    });
    test('FTO1.024: Verify FlexTones.vividSurfaces(Brightness.dark).', () {
      expect(
        FlexTones.vividSurfaces(Brightness.dark),
        equals(
          const FlexTones.dark(
            onPrimaryTone: 10,
            onSecondaryTone: 10,
            onTertiaryTone: 10,
            primaryContainerTone: 20,
            surfaceTone: 20,
            onSurfaceVariantTone: 95,
            inverseSurfaceTone: 95,
            //
            primaryMinChroma: 50,
            neutralChroma: 5,
            neutralVariantChroma: 10,
          ),
        ),
      );
    });
    test('FTO1.025: Verify FlexTones.highContrast(Brightness.light).', () {
      expect(
        FlexTones.highContrast(Brightness.light),
        equals(
          const FlexTones.light(
            primaryTone: 30,
            secondaryTone: 40,
            tertiaryTone: 30,
            errorTone: 40,
            primaryContainerTone: 90,
            secondaryContainerTone: 90,
            tertiaryContainerTone: 95,
            errorContainerTone: 95,
            surfaceTintTone: 30,
            primaryChroma: null,
            secondaryChroma: null,
            tertiaryChroma: null,
            primaryMinChroma: 65,
            secondaryMinChroma: 55,
            tertiaryMinChroma: 55,
          ),
        ),
      );
    });
    test('FTO1.026: Verify FlexTones.highContrast(Brightness.dark).', () {
      expect(
        FlexTones.highContrast(Brightness.dark),
        equals(
          const FlexTones.dark(
            primaryTone: 80,
            secondaryTone: 80,
            tertiaryTone: 80,
            errorTone: 80,
            onPrimaryTone: 10,
            onSecondaryTone: 10,
            onTertiaryTone: 10,
            onErrorTone: 10,
            primaryContainerTone: 20,
            secondaryContainerTone: 20,
            tertiaryContainerTone: 20,
            errorContainerTone: 20,
            onErrorContainerTone: 90,
            surfaceTintTone: 80,
            primaryChroma: null,
            secondaryChroma: null,
            tertiaryChroma: null,
            primaryMinChroma: 65,
            secondaryMinChroma: 55,
            tertiaryMinChroma: 55,
          ),
        ),
      );
    });
    test('FTO1.027: Verify FlexTones.ultraContrast(Brightness.light).', () {
      expect(
        FlexTones.ultraContrast(Brightness.light),
        equals(
          const FlexTones.light(
            primaryTone: 20,
            tertiaryTone: 30,
            onBackgroundTone: 0,
            onSurfaceTone: 0,
            primaryContainerTone: 90,
            secondaryContainerTone: 90,
            tertiaryContainerTone: 95,
            errorContainerTone: 95,
            onPrimaryContainerTone: 5,
            onSecondaryContainerTone: 5,
            onTertiaryContainerTone: 5,
            onErrorContainerTone: 5,
            surfaceVariantTone: 95,
            onSurfaceVariantTone: 10,
            onInverseSurfaceTone: 99,
            inversePrimaryTone: 90,
            outlineTone: 40,
            outlineVariantTone: 70,
            surfaceTintTone: 30,
            //
            primaryMinChroma: 60,
            secondaryMinChroma: 70,
            tertiaryMinChroma: 65,
            neutralChroma: 3,
            neutralVariantChroma: 6,
          ),
        ),
      );
    });
    test('FTO1.028: Verify FlexTones.ultraContrast(Brightness.dark).', () {
      expect(
        FlexTones.ultraContrast(Brightness.dark),
        equals(
          const FlexTones.dark(
            primaryTone: 90,
            secondaryTone: 95,
            tertiaryTone: 95,
            onPrimaryTone: 5,
            onSecondaryTone: 5,
            onTertiaryTone: 5,
            onErrorTone: 5,
            onPrimaryContainerTone: 98,
            onSecondaryContainerTone: 98,
            onTertiaryContainerTone: 98,
            onErrorContainerTone: 98,
            //
            surfaceTone: 5,
            backgroundTone: 5,
            onBackgroundTone: 99,
            onSurfaceTone: 99,
            surfaceVariantTone: 20,
            onSurfaceVariantTone: 95,
            onInverseSurfaceTone: 10,
            outlineTone: 80,
            outlineVariantTone: 50,
            surfaceTintTone: 95,
            //
            primaryMinChroma: 60,
            secondaryMinChroma: 70,
            tertiaryMinChroma: 65,
            neutralChroma: 3,
            neutralVariantChroma: 6,
          ),
        ),
      );
    });
    test('FTO1.029: Verify FlexTones.jolly(Brightness.light).', () {
      expect(
        FlexTones.jolly(Brightness.light),
        equals(
          const FlexTones.light(
            primaryTone: 30,
            secondaryTone: 50,
            onPrimaryTone: 99,
            onSecondaryTone: 99,
            onTertiaryTone: 99,
            onErrorTone: 99,
            secondaryContainerTone: 95,
            surfaceTintTone: 30,
            primaryChroma: null,
            secondaryChroma: null,
            tertiaryChroma: 40,
            primaryMinChroma: 55,
            secondaryMinChroma: 40,
            neutralChroma: 6,
            neutralVariantChroma: 10,
          ),
        ),
      );
    });
    test('FTO1.030: Verify FlexTones.jolly(Brightness.dark).', () {
      expect(
        FlexTones.jolly(Brightness.dark),
        equals(
          const FlexTones.dark(
            primaryTone: 80,
            secondaryTone: 90,
            secondaryContainerTone: 20,
            onPrimaryTone: 10,
            onSecondaryTone: 10,
            onTertiaryTone: 10,
            onErrorTone: 10,
            surfaceTintTone: 80,
            primaryChroma: null,
            secondaryChroma: null,
            tertiaryChroma: 40,
            primaryMinChroma: 55,
            secondaryMinChroma: 40,
            neutralChroma: 6,
            neutralVariantChroma: 10,
          ),
        ),
      );
    });
    test('FTO1.031: Verify FlexTones.oneHue(Brightness.light).', () {
      expect(
        FlexTones.oneHue(Brightness.light),
        equals(
          const FlexTones.light(
            secondaryContainerTone: 95,
            tertiaryTone: 30,
            tertiaryContainerTone: 80,
            //
            primaryMinChroma: 55,
            secondaryChroma: 26,
            tertiaryChroma: 36,
            tertiaryHueRotation: 0,
          ),
        ),
      );
    });
    test('FTO1.030: Verify FlexTones.oneHue(Brightness.dark).', () {
      expect(
        FlexTones.oneHue(Brightness.dark),
        equals(
          const FlexTones.dark(
            tertiaryTone: 90,
            tertiaryContainerTone: 40,
            onTertiaryContainerTone: 95,
            //
            primaryMinChroma: 55,
            secondaryChroma: 26,
            tertiaryChroma: 36,
            tertiaryHueRotation: 0,
          ),
        ),
      );
    });
    //
    test('FTO1.031: Verify FlexTones.candyPop(Brightness.light).', () {
      expect(
        FlexTones.candyPop(Brightness.light),
        equals(
          const FlexTones.light(
            primaryTone: 40,
            primaryContainerTone: 80,
            onPrimaryContainerTone: 4,
            secondaryTone: 60,
            secondaryContainerTone: 92,
            onSecondaryContainerTone: 10,
            tertiaryTone: 50,
            tertiaryContainerTone: 95,
            onTertiaryContainerTone: 6,
            //
            backgroundTone: 100,
            onBackgroundTone: 6,
            surfaceTone: 100,
            onSurfaceTone: 6,
            surfaceVariantTone: 92,
            onSurfaceVariantTone: 10,
            onInverseSurfaceTone: 98,
            inversePrimaryTone: 90,
            outlineTone: 30,
            outlineVariantTone: 70,
            surfaceTintTone: 30,
            //
            primaryMinChroma: 60,
            secondaryMinChroma: 44,
            tertiaryMinChroma: 50,
            neutralChroma: 2,
            neutralVariantChroma: 4,
            paletteType: FlexPaletteType.extended,
          ),
        ),
      );
    });
    test('FTO1.032: Verify FlexTones.candyPop(Brightness.dark).', () {
      expect(
        FlexTones.candyPop(Brightness.dark),
        equals(
          const FlexTones.dark(
            primaryTone: 80,
            onPrimaryTone: 12,
            primaryContainerTone: 40,
            onPrimaryContainerTone: 97,
            secondaryTone: 70,
            onSecondaryTone: 4,
            secondaryContainerTone: 50,
            onSecondaryContainerTone: 96,
            tertiaryTone: 87,
            onTertiaryTone: 5,
            onTertiaryContainerTone: 92,
            onErrorTone: 6,
            onErrorContainerTone: 95,
            //
            backgroundTone: 6,
            onBackgroundTone: 95,
            surfaceTone: 6,
            onSurfaceTone: 95,
            surfaceVariantTone: 20,
            onSurfaceVariantTone: 90,
            onInverseSurfaceTone: 10,
            outlineTone: 60,
            outlineVariantTone: 40,
            surfaceTintTone: 95,
            //
            primaryMinChroma: 60,
            secondaryMinChroma: 44,
            tertiaryMinChroma: 50,
            neutralChroma: 2,
            neutralVariantChroma: 4,
            paletteType: FlexPaletteType.extended,
          ),
        ),
      );
    });
    //
    test('FTO1.033: Verify FlexTones.oneHue(Brightness.light).', () {
      expect(
        FlexTones.chroma(Brightness.light),
        equals(
          const FlexTones.light(
            primaryTone: 40,
            primaryContainerTone: 80,
            onPrimaryContainerTone: 4,
            secondaryTone: 60,
            secondaryContainerTone: 92,
            onSecondaryContainerTone: 10,
            tertiaryTone: 50,
            tertiaryContainerTone: 95,
            onTertiaryContainerTone: 6,
            //
            backgroundTone: 98,
            onBackgroundTone: 6,
            surfaceTone: 98,
            onSurfaceTone: 6,
            surfaceVariantTone: 92,
            onSurfaceVariantTone: 10,
            onInverseSurfaceTone: 98,
            inversePrimaryTone: 90,
            outlineTone: 30,
            outlineVariantTone: 70,
            surfaceTintTone: 30,
            //
            primaryMinChroma: 0,
            secondaryMinChroma: 0,
            tertiaryMinChroma: 0,
            neutralChroma: 2,
            neutralVariantChroma: 4,
            paletteType: FlexPaletteType.extended,
          ),
        ),
      );
    });
    test('FTO1.034: Verify FlexTones.oneHue(Brightness.dark).', () {
      expect(
        FlexTones.chroma(Brightness.dark),
        equals(
          const FlexTones.dark(
            primaryTone: 80,
            onPrimaryTone: 12,
            primaryContainerTone: 40,
            onPrimaryContainerTone: 97,
            secondaryTone: 70,
            onSecondaryTone: 4,
            secondaryContainerTone: 50,
            onSecondaryContainerTone: 96,
            tertiaryTone: 87,
            onTertiaryTone: 5,
            onTertiaryContainerTone: 92,
            onErrorTone: 6,
            onErrorContainerTone: 95,
            //
            backgroundTone: 6,
            onBackgroundTone: 95,
            surfaceTone: 6,
            onSurfaceTone: 95,
            surfaceVariantTone: 20,
            onSurfaceVariantTone: 90,
            onInverseSurfaceTone: 10,
            outlineTone: 60,
            outlineVariantTone: 40,
            surfaceTintTone: 95,
            //
            primaryMinChroma: 0,
            secondaryMinChroma: 0,
            tertiaryMinChroma: 0,
            neutralChroma: 3,
            neutralVariantChroma: 6,
            paletteType: FlexPaletteType.extended,
          ),
        ),
      );
    });
    //
  });
}
