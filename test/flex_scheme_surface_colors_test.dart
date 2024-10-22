import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: avoid_redundant_argument_values
void main() {
  //****************************************************************************
  // FlexSchemeSurfaceColors unit tests.
  //
  // Basic object tests, equality, none equal, copyWith. Factory creation
  // same result as matching one with default constructor.
  //
  // Test usage of deprecated `themeSurface` property.
  //
  // Test that branded surfaces enums produces the expected results and have not
  // not changed from original definitions.
  //****************************************************************************
  group('FSSC1: WITH FlexSchemeSurfaceColors ', () {
    // m1 = Default material light theme surface colors.
    const FlexSchemeSurfaceColors m1 = FlexSchemeSurfaceColors(
      surface: FlexColor.materialLightSurface,
      inverseSurface: FlexColor.materialDarkSurface,
      scaffoldBackground: FlexColor.materialLightScaffoldBackground,
      dialogBackground: FlexColor.lightFlexSurfaceContainer,
    );
    // m2, same definition as m1.
    const FlexSchemeSurfaceColors m2 = FlexSchemeSurfaceColors(
      surface: FlexColor.materialLightSurface,
      inverseSurface: FlexColor.materialDarkSurface,
      scaffoldBackground: FlexColor.materialLightScaffoldBackground,
      dialogBackground: FlexColor.lightFlexSurfaceContainer,
    );
    // m3, one different values than m1 and m2.
    const FlexSchemeSurfaceColors m3 = FlexSchemeSurfaceColors(
      surface: FlexColor.materialLightSurface,
      inverseSurface: FlexColor.materialLightSurface, // Diff here
      scaffoldBackground: FlexColor.materialLightScaffoldBackground,
      dialogBackground: FlexColor.lightFlexSurfaceContainer,
    );
    // m4, all values different from m1 and m2.
    const FlexSchemeSurfaceColors m4 = FlexSchemeSurfaceColors(
      surface: Color(0xFFEEEEEE),
      inverseSurface: Color(0xFFEEAAEE),
      scaffoldBackground: Color(0xFFAAAAAA),
      dialogBackground: Color(0xFFBBBBBB),
    );

    // Identity and equality tests
    test(
        'FSSC1.01a: GIVEN the same FlexSchemeSurfaceColor object '
        'EXPECT them to be equal', () {
      expect(m1, equals(m1));
    });
    test(
        'FSSC1.01b: GIVEN the same FlexSchemeSurfaceColor object '
        'EXPECT them to have identity', () {
      expect(identical(m1, m1), true);
    });
    test(
        'FSSC1.01c: GIVEN two equal FlexSchemeSurfaceColors objects '
        'EXPECT them to have equality', () {
      expect(m1, equals(m2));
    });
    test(
        'FSSC1.01d: GIVEN two equal FlexSchemeSurfaceColors objects '
        'EXPECT them to have identity', () {
      expect(identical(m1, m2), true);
    });
    test(
        'FSSC1.01e: GIVEN two equal FlexSchemeSurfaceColors objects '
        'EXPECT them to have equality with operator', () {
      expect(m1 == m2, true);
    });
    test(
        'FSSC1.02a: GIVEN none equal FlexSchemeSurfaceColors objects '
        'EXPECT them to be unequal', () {
      expect(m1, isNot(m3));
    });
    test(
        'FSSC1.02b: GIVEN none equal FlexSchemeSurfaceColors objects '
        'EXPECT them to be unequal with operator', () {
      expect(m1 != m3, true);
    });
    test(
        'FSSC1.03a: GIVEN a FlexSchemeSurfaceColors object EXPECT it to be '
        'equal to an unequal object when made equal with copyWith.', () {
      expect(
        m4.copyWith(
          surface: FlexColor.materialLightSurface,
          surfaceDim: FlexColor.materialLightSurface,
          surfaceBright: FlexColor.materialLightSurface,
          surfaceContainerLowest: FlexColor.materialLightSurface,
          surfaceContainerLow: FlexColor.materialLightSurface,
          surfaceContainer: FlexColor.materialLightSurface,
          surfaceContainerHigh: FlexColor.materialLightSurface,
          surfaceContainerHighest: FlexColor.materialLightSurface,
          inverseSurface: FlexColor.materialDarkSurface,
          scaffoldBackground: FlexColor.materialLightScaffoldBackground,
          dialogBackground: FlexColor.lightFlexSurfaceContainer,
        ),
        m1,
      );
    });
    test(
        'FSSC1.03b: GIVEN a FlexSchemeSurfaceColors object EXPECT it to be '
        'unchanged after and empty copyWith.', () {
      expect(m4.copyWith(), m4);
    });

    //**************************************************************************
    // FlexSchemeSurfaceColors unit tests.
    //
    // toString and hashcode.
    //**************************************************************************

    test(
        'FSSC1.16: Test toString implemented via debugFillProperties '
        'EXPECT exact print string', () {
      expect(
          m1.toString(),
          //
          equalsIgnoringHashCodes(
              // ignore: lines_longer_than_80_chars
              'FlexSchemeSurfaceColors#00000(surface: Color(0xffffffff), surfaceDim: Color(0xffffffff), surfaceBright: Color(0xffffffff), surfaceContainerLowest: Color(0xffffffff), surfaceContainerLow: Color(0xffffffff), surfaceContainer: Color(0xffffffff), surfaceContainerHigh: Color(0xffffffff), surfaceContainerHighest: Color(0xffffffff), inverseSurface: Color(0xff121212), scaffoldBackground: Color(0xffffffff), dialogBackground: Color(0xfff3f3f3))'));
    });

    test(
        'FSSC1.17: Test toStringShort implemented via debugFillProperties '
        'EXPECT exact short printout string', () {
      expect(m1.toStringShort(),
          equalsIgnoringHashCodes('FlexSchemeSurfaceColors#00000'));
    });
    test('FSSC1.18a: Test hashCode has value.', () {
      expect(m1.hashCode, isNotNull);
    });
    test('FSSC1.18b: Test hashCode copyWith has same exact value.', () {
      expect(m1.hashCode, equals(m1.copyWith().hashCode));
    });

    //**************************************************************************
    // TEST FlexSchemeSurfaceColors.blend
    //**************************************************************************

    // Default value tests ...
    test(
        'FSSC1.16aM2: GIVEN a light FlexSchemeSurfaceColors.blend created '
        'object '
        'EXPECT equality with Material 2 light surface colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(useMaterial3: false),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialLightSurface,
          surfaceDim: FlexColor.lightFlexSurfaceDim,
          surfaceBright: FlexColor.lightFlexSurfaceBright,
          surfaceContainerLowest: FlexColor.lightFlexSurfaceContainerLowest,
          surfaceContainerLow: FlexColor.lightFlexSurfaceContainerLow,
          surfaceContainer: FlexColor.lightFlexSurfaceContainer,
          surfaceContainerHigh: FlexColor.lightFlexSurfaceContainerHigh,
          surfaceContainerHighest: FlexColor.lightFlexSurfaceContainerHighest,
          inverseSurface: FlexColor.materialDarkSurface,
          scaffoldBackground: FlexColor.materialLightScaffoldBackground,
          dialogBackground: FlexColor.materialLightSurface,
        )),
      );
    });
    test(
        'FSSC1.16aM3: GIVEN a light FlexSchemeSurfaceColors.blend '
        'created object '
        'EXPECT equality with Material 2 light surface colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(useMaterial3: true),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.lightFlexSurface,
          surfaceDim: FlexColor.lightFlexSurfaceDim,
          surfaceBright: FlexColor.lightFlexSurfaceBright,
          surfaceContainerLowest: FlexColor.lightFlexSurfaceContainerLowest,
          surfaceContainerLow: FlexColor.lightFlexSurfaceContainerLow,
          surfaceContainer: FlexColor.lightFlexSurfaceContainer,
          surfaceContainerHigh: FlexColor.lightFlexSurfaceContainerHigh,
          surfaceContainerHighest: FlexColor.lightFlexSurfaceContainerHighest,
          inverseSurface: FlexColor.lightFlexInverseSurface,
          scaffoldBackground: FlexColor.lightFlexSurfaceContainerLowest,
          dialogBackground: FlexColor.lightFlexSurfaceContainerHigh,
        )),
      );
    });
    test(
        'FSSC1.16bM2: GIVEN a light FlexSchemeSurfaceColors.blend( '
        'brightness: Brightness.light) created object and '
        'EXPECT equality with Material 2 light surface colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          blendLevel: 0,
          brightness: Brightness.light,
          surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
          useMaterial3: false,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialLightSurface,
          surfaceDim: FlexColor.lightFlexSurfaceDim,
          surfaceBright: FlexColor.lightFlexSurfaceBright,
          surfaceContainerLowest: FlexColor.lightFlexSurfaceContainerLowest,
          surfaceContainerLow: FlexColor.lightFlexSurfaceContainerLow,
          surfaceContainer: FlexColor.lightFlexSurfaceContainer,
          surfaceContainerHigh: FlexColor.lightFlexSurfaceContainerHigh,
          surfaceContainerHighest: FlexColor.lightFlexSurfaceContainerHighest,
          inverseSurface: FlexColor.materialDarkSurface,
          scaffoldBackground: FlexColor.materialLightScaffoldBackground,
          dialogBackground: FlexColor.materialLightSurface,
        )),
      );
    });
    test(
        'FSSC1.16bM3: GIVEN a light FlexSchemeSurfaceColors.blend( '
        'brightness: Brightness.light) created object and '
        'EXPECT equality with Material 3 light surface colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          blendLevel: 0,
          brightness: Brightness.light,
          surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
          useMaterial3: true,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.lightFlexSurface,
          surfaceDim: FlexColor.lightFlexSurfaceDim,
          surfaceBright: FlexColor.lightFlexSurfaceBright,
          surfaceContainerLowest: FlexColor.lightFlexSurfaceContainerLowest,
          surfaceContainerLow: FlexColor.lightFlexSurfaceContainerLow,
          surfaceContainer: FlexColor.lightFlexSurfaceContainer,
          surfaceContainerHigh: FlexColor.lightFlexSurfaceContainerHigh,
          surfaceContainerHighest: FlexColor.lightFlexSurfaceContainerHighest,
          inverseSurface: FlexColor.lightFlexInverseSurface,
          scaffoldBackground: FlexColor.lightFlexSurfaceContainerLowest,
          dialogBackground: FlexColor.lightFlexSurfaceContainerHigh,
        )),
      );
    });
    test(
        'FSSC1.17aM2: GIVEN a dark FlexSchemeSurfaceColors.blend( '
        'brightness: Brightness.dark) created object '
        'EXPECT equality with Material 2 dark surface colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.dark,
          useMaterial3: false,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialDarkSurface,
          surfaceDim: FlexColor.darkFlexSurfaceDim,
          surfaceBright: FlexColor.darkFlexSurfaceBright,
          surfaceContainerLowest: FlexColor.darkFlexSurfaceContainerLowest,
          surfaceContainerLow: FlexColor.darkFlexSurfaceContainerLow,
          surfaceContainer: FlexColor.darkFlexSurfaceContainer,
          surfaceContainerHigh: FlexColor.darkFlexSurfaceContainerHigh,
          surfaceContainerHighest: FlexColor.darkFlexSurfaceContainerHighest,
          inverseSurface: FlexColor.materialLightSurface,
          scaffoldBackground: FlexColor.materialDarkScaffoldBackground,
          dialogBackground: FlexColor.materialDarkSurface,
        )),
      );
    });
    test(
        'FSSC1.17bM2: GIVEN a dark FlexSchemeSurfaceColors.blend( '
        'brightness: Brightness.dark) created object and '
        'with assigned default values '
        'EXPECT equality with Material-2 dark surface colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.dark,
          blendLevel: 0,
          surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
          useMaterial3: false,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialDarkSurface,
          surfaceDim: FlexColor.darkFlexSurfaceDim,
          surfaceBright: FlexColor.darkFlexSurfaceBright,
          surfaceContainerLowest: FlexColor.darkFlexSurfaceContainerLowest,
          surfaceContainerLow: FlexColor.darkFlexSurfaceContainerLow,
          surfaceContainer: FlexColor.darkFlexSurfaceContainer,
          surfaceContainerHigh: FlexColor.darkFlexSurfaceContainerHigh,
          surfaceContainerHighest: FlexColor.darkFlexSurfaceContainerHighest,
          inverseSurface: FlexColor.materialLightSurface,
          scaffoldBackground: FlexColor.materialDarkScaffoldBackground,
          dialogBackground: FlexColor.materialDarkSurface,
        )),
      );
    });
    test(
        'FSSC1.17bM3: GIVEN a dark FlexSchemeSurfaceColors.blend( '
        'brightness: Brightness.dark) created object and '
        'with assigned default values '
        'EXPECT equality with Material-3 dark surface colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.dark,
          blendLevel: 0,
          surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
          useMaterial3: true,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.darkFlexSurface,
          surfaceDim: FlexColor.darkFlexSurfaceDim,
          surfaceBright: FlexColor.darkFlexSurfaceBright,
          surfaceContainerLowest: FlexColor.darkFlexSurfaceContainerLowest,
          surfaceContainerLow: FlexColor.darkFlexSurfaceContainerLow,
          surfaceContainer: FlexColor.darkFlexSurfaceContainer,
          surfaceContainerHigh: FlexColor.darkFlexSurfaceContainerHigh,
          surfaceContainerHighest: FlexColor.darkFlexSurfaceContainerHighest,
          inverseSurface: FlexColor.darkFlexInverseSurface,
          scaffoldBackground: FlexColor.darkFlexSurfaceContainerLowest,
          dialogBackground: FlexColor.darkFlexSurfaceContainerHigh,
        )),
      );
    });

    // ZERO Blend level test for LIGHT mode.

    test(
        'FSSC1.18: GIVEN a light FlexSchemeSurfaceColors.blend created object '
        'with surface mode highSurfaceLowScaffold and level 0 '
        'EXPECT equality with Material 2 light surface colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.light,
          blendLevel: 0,
          surfaceMode: FlexSurfaceMode.highSurfaceLowScaffold,
          useMaterial3: false,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialLightSurface,
          surfaceDim: FlexColor.lightFlexSurfaceDim,
          surfaceBright: FlexColor.lightFlexSurfaceBright,
          surfaceContainerLowest: FlexColor.lightFlexSurfaceContainerLowest,
          surfaceContainerLow: FlexColor.lightFlexSurfaceContainerLow,
          surfaceContainer: FlexColor.lightFlexSurfaceContainer,
          surfaceContainerHigh: FlexColor.lightFlexSurfaceContainerHigh,
          surfaceContainerHighest: FlexColor.lightFlexSurfaceContainerHighest,
          inverseSurface: FlexColor.materialDarkSurface,
          scaffoldBackground: FlexColor.materialLightScaffoldBackground,
          dialogBackground: FlexColor.materialLightSurface,
        )),
      );
    });
    test(
        'FSSC1.19: GIVEN a light FlexSchemeSurfaceColors.blend created object '
        'with surface mode highScaffoldLevelSurface and level 0 '
        'EXPECT equality with Material 2 light surface colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.light,
          blendLevel: 0,
          surfaceMode: FlexSurfaceMode.highScaffoldLevelSurface,
          useMaterial3: false,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialLightSurface,
          surfaceDim: FlexColor.lightFlexSurfaceDim,
          surfaceBright: FlexColor.lightFlexSurfaceBright,
          surfaceContainerLowest: FlexColor.lightFlexSurfaceContainerLowest,
          surfaceContainerLow: FlexColor.lightFlexSurfaceContainerLow,
          surfaceContainer: FlexColor.lightFlexSurfaceContainer,
          surfaceContainerHigh: FlexColor.lightFlexSurfaceContainerHigh,
          surfaceContainerHighest: FlexColor.lightFlexSurfaceContainerHighest,
          inverseSurface: FlexColor.materialDarkSurface,
          scaffoldBackground: FlexColor.materialLightScaffoldBackground,
          dialogBackground: FlexColor.materialLightSurface,
        )),
      );
    });
    test(
        'FSSC1.19b: GIVEN a light FlexSchemeSurfaceColors.blend created object '
        'with surface mode highScaffoldLowSurface and level 0 '
        'EXPECT equality with Material 2 light surface colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.light,
          blendLevel: 0,
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
          useMaterial3: false,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialLightSurface,
          surfaceDim: FlexColor.lightFlexSurfaceDim,
          surfaceBright: FlexColor.lightFlexSurfaceBright,
          surfaceContainerLowest: FlexColor.lightFlexSurfaceContainerLowest,
          surfaceContainerLow: FlexColor.lightFlexSurfaceContainerLow,
          surfaceContainer: FlexColor.lightFlexSurfaceContainer,
          surfaceContainerHigh: FlexColor.lightFlexSurfaceContainerHigh,
          surfaceContainerHighest: FlexColor.lightFlexSurfaceContainerHighest,
          inverseSurface: FlexColor.materialDarkSurface,
          scaffoldBackground: FlexColor.materialLightScaffoldBackground,
          dialogBackground: FlexColor.materialLightSurface,
        )),
      );
    });
    test(
        'FSSC1.20: GIVEN a light FlexSchemeSurfaceColors.blend created object '
        'with surface mode level and level 0 '
        'EXPECT equality with Material 2 light surface colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.light,
          blendLevel: 0,
          surfaceMode: FlexSurfaceMode.level,
          useMaterial3: false,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialLightSurface,
          surfaceDim: FlexColor.lightFlexSurfaceDim,
          surfaceBright: FlexColor.lightFlexSurfaceBright,
          surfaceContainerLowest: FlexColor.lightFlexSurfaceContainerLowest,
          surfaceContainerLow: FlexColor.lightFlexSurfaceContainerLow,
          surfaceContainer: FlexColor.lightFlexSurfaceContainer,
          surfaceContainerHigh: FlexColor.lightFlexSurfaceContainerHigh,
          surfaceContainerHighest: FlexColor.lightFlexSurfaceContainerHighest,
          inverseSurface: FlexColor.materialDarkSurface,
          scaffoldBackground: FlexColor.materialLightScaffoldBackground,
          dialogBackground: FlexColor.materialLightSurface,
        )),
      );
    });
    test(
        'FSSC1.21: GIVEN a light FlexSchemeSurfaceColors.blend created object '
        'with surface mode levelSurfacesLowScaffold and level 0 '
        'EXPECT equality with Material 2 light surface colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.light,
          blendLevel: 0,
          surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
          useMaterial3: false,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialLightSurface,
          surfaceDim: FlexColor.lightFlexSurfaceDim,
          surfaceBright: FlexColor.lightFlexSurfaceBright,
          surfaceContainerLowest: FlexColor.lightFlexSurfaceContainerLowest,
          surfaceContainerLow: FlexColor.lightFlexSurfaceContainerLow,
          surfaceContainer: FlexColor.lightFlexSurfaceContainer,
          surfaceContainerHigh: FlexColor.lightFlexSurfaceContainerHigh,
          surfaceContainerHighest: FlexColor.lightFlexSurfaceContainerHighest,
          inverseSurface: FlexColor.materialDarkSurface,
          scaffoldBackground: FlexColor.materialLightScaffoldBackground,
          dialogBackground: FlexColor.materialLightSurface,
        )),
      );
    });
    test(
        'FSSC1.22: GIVEN a light FlexSchemeSurfaceColors.blend created object '
        'with surface mode levelSurfacesLowScaffoldVariantDialog and level 0 '
        'EXPECT equality with Material 2 light surface colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.light,
          blendLevel: 0,
          surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffoldVariantDialog,
          useMaterial3: false,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialLightSurface,
          surfaceDim: FlexColor.lightFlexSurfaceDim,
          surfaceBright: FlexColor.lightFlexSurfaceBright,
          surfaceContainerLowest: FlexColor.lightFlexSurfaceContainerLowest,
          surfaceContainerLow: FlexColor.lightFlexSurfaceContainerLow,
          surfaceContainer: FlexColor.lightFlexSurfaceContainer,
          surfaceContainerHigh: FlexColor.lightFlexSurfaceContainerHigh,
          surfaceContainerHighest: FlexColor.lightFlexSurfaceContainerHighest,
          inverseSurface: FlexColor.materialDarkSurface,
          scaffoldBackground: FlexColor.materialLightScaffoldBackground,
          dialogBackground: FlexColor.materialLightSurface,
        )),
      );
    });
    test(
        'FSSC1.23: GIVEN a light FlexSchemeSurfaceColors.blend created object '
        'with surface mode highScaffoldLowSurfaces and level 0 '
        'EXPECT equality with Material 2 light surface colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.light,
          blendLevel: 0,
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurfaces,
          useMaterial3: false,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialLightSurface,
          surfaceDim: FlexColor.lightFlexSurfaceDim,
          surfaceBright: FlexColor.lightFlexSurfaceBright,
          surfaceContainerLowest: FlexColor.lightFlexSurfaceContainerLowest,
          surfaceContainerLow: FlexColor.lightFlexSurfaceContainerLow,
          surfaceContainer: FlexColor.lightFlexSurfaceContainer,
          surfaceContainerHigh: FlexColor.lightFlexSurfaceContainerHigh,
          surfaceContainerHighest: FlexColor.lightFlexSurfaceContainerHighest,
          inverseSurface: FlexColor.materialDarkSurface,
          scaffoldBackground: FlexColor.materialLightScaffoldBackground,
          dialogBackground: FlexColor.materialLightSurface,
        )),
      );
    });
    test(
        'FSSC1.24: GIVEN a light FlexSchemeSurfaceColors.blend created object '
        'with surface mode highScaffoldLowSurfacesVariantDialog and level 0 '
        'EXPECT equality with Material 2 light surface colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.light,
          blendLevel: 0,
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog,
          useMaterial3: false,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialLightSurface,
          surfaceDim: FlexColor.lightFlexSurfaceDim,
          surfaceBright: FlexColor.lightFlexSurfaceBright,
          surfaceContainerLowest: FlexColor.lightFlexSurfaceContainerLowest,
          surfaceContainerLow: FlexColor.lightFlexSurfaceContainerLow,
          surfaceContainer: FlexColor.lightFlexSurfaceContainer,
          surfaceContainerHigh: FlexColor.lightFlexSurfaceContainerHigh,
          surfaceContainerHighest: FlexColor.lightFlexSurfaceContainerHighest,
          inverseSurface: FlexColor.materialDarkSurface,
          scaffoldBackground: FlexColor.materialLightScaffoldBackground,
          dialogBackground: FlexColor.materialLightSurface,
        )),
      );
    });

    // ZERO Blend level test for DARK mode.

    test(
        'FSSC1.25: GIVEN a dark FlexSchemeSurfaceColors.blend created object '
        'with surface mode highSurfaceLowScaffold and level 0 '
        'EXPECT equality with Material 2 dark surface colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.dark,
          blendLevel: 0,
          surfaceMode: FlexSurfaceMode.highSurfaceLowScaffold,
          useMaterial3: false,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialDarkSurface,
          surfaceDim: FlexColor.darkFlexSurfaceDim,
          surfaceBright: FlexColor.darkFlexSurfaceBright,
          surfaceContainerLowest: FlexColor.darkFlexSurfaceContainerLowest,
          surfaceContainerLow: FlexColor.darkFlexSurfaceContainerLow,
          surfaceContainer: FlexColor.darkFlexSurfaceContainer,
          surfaceContainerHigh: FlexColor.darkFlexSurfaceContainerHigh,
          surfaceContainerHighest: FlexColor.darkFlexSurfaceContainerHighest,
          inverseSurface: FlexColor.materialLightSurface,
          scaffoldBackground: FlexColor.materialDarkScaffoldBackground,
          dialogBackground: FlexColor.materialDarkSurface,
        )),
      );
    });
    test(
        'FSSC1.26: GIVEN a dark FlexSchemeSurfaceColors.blend created object '
        'with surface mode highScaffoldLevelSurface and level 0 '
        'EXPECT equality with Material 2 dark surface colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.dark,
          blendLevel: 0,
          surfaceMode: FlexSurfaceMode.highScaffoldLevelSurface,
          useMaterial3: false,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialDarkSurface,
          surfaceDim: FlexColor.darkFlexSurfaceDim,
          surfaceBright: FlexColor.darkFlexSurfaceBright,
          surfaceContainerLowest: FlexColor.darkFlexSurfaceContainerLowest,
          surfaceContainerLow: FlexColor.darkFlexSurfaceContainerLow,
          surfaceContainer: FlexColor.darkFlexSurfaceContainer,
          surfaceContainerHigh: FlexColor.darkFlexSurfaceContainerHigh,
          surfaceContainerHighest: FlexColor.darkFlexSurfaceContainerHighest,
          inverseSurface: FlexColor.materialLightSurface,
          scaffoldBackground: FlexColor.materialDarkScaffoldBackground,
          dialogBackground: FlexColor.materialDarkSurface,
        )),
      );
    });
    test(
        'FSSC1.26b: GIVEN a dark FlexSchemeSurfaceColors.blend created object '
        'with surface mode highScaffoldLowSurface and level 0 '
        'EXPECT equality with Material 2 dark surface colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.dark,
          blendLevel: 0,
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
          useMaterial3: false,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialDarkSurface,
          surfaceDim: FlexColor.darkFlexSurfaceDim,
          surfaceBright: FlexColor.darkFlexSurfaceBright,
          surfaceContainerLowest: FlexColor.darkFlexSurfaceContainerLowest,
          surfaceContainerLow: FlexColor.darkFlexSurfaceContainerLow,
          surfaceContainer: FlexColor.darkFlexSurfaceContainer,
          surfaceContainerHigh: FlexColor.darkFlexSurfaceContainerHigh,
          surfaceContainerHighest: FlexColor.darkFlexSurfaceContainerHighest,
          inverseSurface: FlexColor.materialLightSurface,
          scaffoldBackground: FlexColor.materialDarkScaffoldBackground,
          dialogBackground: FlexColor.materialDarkSurface,
        )),
      );
    });
    test(
        'FSSC1.27: GIVEN a dark FlexSchemeSurfaceColors.blend created object '
        'with surface mode level and level 0 '
        'EXPECT equality with Material 2 dark surface colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.dark,
          blendLevel: 0,
          surfaceMode: FlexSurfaceMode.level,
          useMaterial3: false,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialDarkSurface,
          surfaceDim: FlexColor.darkFlexSurfaceDim,
          surfaceBright: FlexColor.darkFlexSurfaceBright,
          surfaceContainerLowest: FlexColor.darkFlexSurfaceContainerLowest,
          surfaceContainerLow: FlexColor.darkFlexSurfaceContainerLow,
          surfaceContainer: FlexColor.darkFlexSurfaceContainer,
          surfaceContainerHigh: FlexColor.darkFlexSurfaceContainerHigh,
          surfaceContainerHighest: FlexColor.darkFlexSurfaceContainerHighest,
          inverseSurface: FlexColor.materialLightSurface,
          scaffoldBackground: FlexColor.materialDarkScaffoldBackground,
          dialogBackground: FlexColor.materialDarkSurface,
        )),
      );
    });
    test(
        'FSSC1.28: GIVEN a dark FlexSchemeSurfaceColors.blend created object '
        'with surface mode levelSurfacesLowScaffold and level 0 '
        'EXPECT equality with Material 2 dark surface colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.dark,
          blendLevel: 0,
          surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
          useMaterial3: false,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialDarkSurface,
          surfaceDim: FlexColor.darkFlexSurfaceDim,
          surfaceBright: FlexColor.darkFlexSurfaceBright,
          surfaceContainerLowest: FlexColor.darkFlexSurfaceContainerLowest,
          surfaceContainerLow: FlexColor.darkFlexSurfaceContainerLow,
          surfaceContainer: FlexColor.darkFlexSurfaceContainer,
          surfaceContainerHigh: FlexColor.darkFlexSurfaceContainerHigh,
          surfaceContainerHighest: FlexColor.darkFlexSurfaceContainerHighest,
          inverseSurface: FlexColor.materialLightSurface,
          scaffoldBackground: FlexColor.materialDarkScaffoldBackground,
          dialogBackground: FlexColor.materialDarkSurface,
        )),
      );
    });
    test(
        'FSSC1.29: GIVEN a dark FlexSchemeSurfaceColors.blend created object '
        'with surface mode levelSurfacesLowScaffoldVariantDialog and level 0 '
        'EXPECT equality with Material 2 dark surface colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.dark,
          blendLevel: 0,
          surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffoldVariantDialog,
          useMaterial3: false,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialDarkSurface,
          surfaceDim: FlexColor.darkFlexSurfaceDim,
          surfaceBright: FlexColor.darkFlexSurfaceBright,
          surfaceContainerLowest: FlexColor.darkFlexSurfaceContainerLowest,
          surfaceContainerLow: FlexColor.darkFlexSurfaceContainerLow,
          surfaceContainer: FlexColor.darkFlexSurfaceContainer,
          surfaceContainerHigh: FlexColor.darkFlexSurfaceContainerHigh,
          surfaceContainerHighest: FlexColor.darkFlexSurfaceContainerHighest,
          inverseSurface: FlexColor.materialLightSurface,
          scaffoldBackground: FlexColor.materialDarkScaffoldBackground,
          dialogBackground: FlexColor.materialDarkSurface,
        )),
      );
    });
    test(
        'FSSC1.30: GIVEN a dark FlexSchemeSurfaceColors.blend created object '
        'with surface mode highScaffoldLowSurfaces and level 0 '
        'EXPECT equality with Material 2 dark surface colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.dark,
          blendLevel: 0,
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurfaces,
          useMaterial3: false,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialDarkSurface,
          surfaceDim: FlexColor.darkFlexSurfaceDim,
          surfaceBright: FlexColor.darkFlexSurfaceBright,
          surfaceContainerLowest: FlexColor.darkFlexSurfaceContainerLowest,
          surfaceContainerLow: FlexColor.darkFlexSurfaceContainerLow,
          surfaceContainer: FlexColor.darkFlexSurfaceContainer,
          surfaceContainerHigh: FlexColor.darkFlexSurfaceContainerHigh,
          surfaceContainerHighest: FlexColor.darkFlexSurfaceContainerHighest,
          inverseSurface: FlexColor.materialLightSurface,
          scaffoldBackground: FlexColor.materialDarkScaffoldBackground,
          dialogBackground: FlexColor.materialDarkSurface,
        )),
      );
    });
    test(
        'FSSC1.31: GIVEN a dark FlexSchemeSurfaceColors.blend created object '
        'with surface mode highScaffoldLowSurfacesVariantDialog and level 0 '
        'EXPECT equality with Material 2 dark surface colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.dark,
          blendLevel: 0,
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog,
          useMaterial3: false,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialDarkSurface,
          surfaceDim: FlexColor.darkFlexSurfaceDim,
          surfaceBright: FlexColor.darkFlexSurfaceBright,
          surfaceContainerLowest: FlexColor.darkFlexSurfaceContainerLowest,
          surfaceContainerLow: FlexColor.darkFlexSurfaceContainerLow,
          surfaceContainer: FlexColor.darkFlexSurfaceContainer,
          surfaceContainerHigh: FlexColor.darkFlexSurfaceContainerHigh,
          surfaceContainerHighest: FlexColor.darkFlexSurfaceContainerHighest,
          inverseSurface: FlexColor.materialLightSurface,
          scaffoldBackground: FlexColor.materialDarkScaffoldBackground,
          dialogBackground: FlexColor.materialDarkSurface,
        )),
      );
    });

    // 20-level Blend level test for LIGHT mode.

    test(
        'FSSC1.32: GIVEN a light FlexSchemeSurfaceColors.blend created object '
        'with surface mode highSurfaceLowScaffold and level 20 '
        'EXPECT equality when made by matching light defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.light,
          blendLevel: 20,
          surfaceMode: FlexSurfaceMode.highSurfaceLowScaffold,
          useMaterial3: false,
        ),
        equals(
          const FlexSchemeSurfaceColors(
            surface: Color(0xffece1fd),
            surfaceDim: Color(0xffd1c5e1),
            surfaceBright: Color(0xffeadffb),
            surfaceContainerLowest: Color(0xffece1fd),
            surfaceContainerLow: Color(0xffe6daf6),
            surfaceContainer: Color(0xffe1d6f2),
            surfaceContainerHigh: Color(0xffdcd1ed),
            surfaceContainerHighest: Color(0xffd7cbe7),
            inverseSurface: Color(0xff1b0f2b),
            scaffoldBackground: Color(0xfff8f5fe),
            dialogBackground: Color(0xffece1fd),
          ),
        ),
      );
    });
    test(
        'FSSC1.33: GIVEN a light FlexSchemeSurfaceColors.blend created object '
        'with surface mode highScaffoldLevelSurface and level 20 '
        'EXPECT equality when made by matching light defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.light,
          blendLevel: 20,
          surfaceMode: FlexSurfaceMode.highScaffoldLevelSurface,
          useMaterial3: false,
        ),
        equals(
          const FlexSchemeSurfaceColors(
            surface: Color(0xfff2ebfd),
            surfaceDim: Color(0xffd6cee1),
            surfaceBright: Color(0xfff0e9fb),
            surfaceContainerLowest: Color(0xfff2ebfd),
            surfaceContainerLow: Color(0xffece4f7),
            surfaceContainer: Color(0xffe7dff2),
            surfaceContainerHigh: Color(0xffe2daed),
            surfaceContainerHighest: Color(0xffdcd4e7),
            inverseSurface: Color(0xff181023),
            scaffoldBackground: Color(0xffdac3fb),
            dialogBackground: Color(0xfff2ebfd),
          ),
        ),
      );
    });
    test(
        'FSSC1.34: GIVEN a light FlexSchemeSurfaceColors.blend created object '
        'with surface mode highScaffoldLowSurface and level 20 '
        'EXPECT equality when made by matching light defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.light,
          blendLevel: 20,
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
          useMaterial3: false,
        ),
        equals(
          const FlexSchemeSurfaceColors(
            surface: Color(0xfff8f5fe),
            surfaceDim: Color(0xffdbd7e0),
            surfaceBright: Color(0xfff6f3fc),
            surfaceContainerLowest: Color(0xfff8f5fe),
            surfaceContainerLow: Color(0xfff2eef7),
            surfaceContainer: Color(0xffede9f2),
            surfaceContainerHigh: Color(0xffe7e3ed),
            surfaceContainerHighest: Color(0xffe1dde7),
            inverseSurface: Color(0xff15111a),
            scaffoldBackground: Color(0xffdac3fb),
            dialogBackground: Color(0xfff8f5fe),
          ),
        ),
      );
    });
    test(
        'FSSC1.35: GIVEN a light FlexSchemeSurfaceColors.blend created object '
        'with surface mode level and level 20 '
        'EXPECT equality when made by matching light defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.light,
          blendLevel: 20,
          surfaceMode: FlexSurfaceMode.level,
          useMaterial3: false,
        ),
        equals(
          const FlexSchemeSurfaceColors(
            surface: Color(0xfff2ebfd),
            surfaceDim: Color(0xffd6cee1),
            surfaceBright: Color(0xfff0e9fb),
            surfaceContainerLowest: Color(0xfff2ebfd),
            surfaceContainerLow: Color(0xffece4f7),
            surfaceContainer: Color(0xffe7dff2),
            surfaceContainerHigh: Color(0xffe2daed),
            surfaceContainerHighest: Color(0xffdcd4e7),
            inverseSurface: Color(0xff181023),
            scaffoldBackground: Color(0xfff2ebfd),
            dialogBackground: Color(0xfff2ebfd),
          ),
        ),
      );
    });
    test(
        'FSSC1.36: GIVEN a light FlexSchemeSurfaceColors.blend created object '
        'with surface mode levelSurfacesLowScaffold and level 20 '
        'EXPECT equality when made by matching light defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.light,
          blendLevel: 20,
          surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
          useMaterial3: false,
        ),
        equals(
          const FlexSchemeSurfaceColors(
            surface: Color(0xfff2ebfd),
            surfaceDim: Color(0xffd6cee1),
            surfaceBright: Color(0xfff0e9fb),
            surfaceContainerLowest: Color(0xfff2ebfd),
            surfaceContainerLow: Color(0xffece4f7),
            surfaceContainer: Color(0xffe7dff2),
            surfaceContainerHigh: Color(0xffe2daed),
            surfaceContainerHighest: Color(0xffdcd4e7),
            inverseSurface: Color(0xff181023),
            scaffoldBackground: Color(0xfff8f5fe),
            dialogBackground: Color(0xfff2ebfd),
          ),
        ),
      );
    });
    test(
        'FSSC1.37M2: GIVEN a light FlexSchemeSurfaceColors.blend '
        'created object '
        'with surface mode levelSurfacesLowScaffoldVariantDialog and level 20 '
        'EXPECT equality when made by matching light defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.light,
          blendLevel: 20,
          surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffoldVariantDialog,
          useMaterial3: false,
        ),
        equals(
          const FlexSchemeSurfaceColors(
            surface: Color(0xfff2ebfd),
            surfaceDim: Color(0xffd6cee1),
            surfaceBright: Color(0xfff0e9fb),
            surfaceContainerLowest: Color(0xfff2ebfd),
            surfaceContainerLow: Color(0xffece4f7),
            surfaceContainer: Color(0xffe7dff2),
            surfaceContainerHigh: Color(0xffe2daed),
            surfaceContainerHighest: Color(0xffdcd4e7),
            inverseSurface: Color(0xff181023),
            scaffoldBackground: Color(0xfff8f5fe),
            dialogBackground: Color(0xffebf5f5),
          ),
        ),
      );
    });
    test(
        'FSSC1.37M3: GIVEN a light FlexSchemeSurfaceColors.blend created '
        'with surface mode levelSurfacesLowScaffoldVariantDialog and level 10 '
        'EXPECT equality when made by matching light defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.light,
          blendLevel: 10,
          surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffoldVariantDialog,
          useMaterial3: true,
        ),
        equals(
          const FlexSchemeSurfaceColors(
            surface: Color(0xfff5f2fb),
            surfaceDim: Color(0xffdbd7e0),
            surfaceBright: Color(0xfff6f3fc),
            surfaceContainerLowest: Color(0xfff8f5fe),
            surfaceContainerLow: Color(0xfff2eef7),
            surfaceContainer: Color(0xffede9f2),
            surfaceContainerHigh: Color(0xffe7e3ed),
            surfaceContainerHighest: Color(0xffe1dde7),
            inverseSurface: Color(0xff2c2831),
            scaffoldBackground: Color(0xfffbfafe),
            dialogBackground: Color(0xffe3e9e8),
          ),
        ),
      );
    });
    test(
        'FSSC1.38M2: GIVEN a light FlexSchemeSurfaceColors.blend created '
        'with surface mode highScaffoldLowSurfaces and level 20 '
        'EXPECT equality when made by matching light defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.light,
          blendLevel: 20,
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurfaces,
          useMaterial3: false,
        ),
        equals(
          const FlexSchemeSurfaceColors(
            surface: Color(0xfff8f5fe),
            surfaceDim: Color(0xffdbd7e0),
            surfaceBright: Color(0xfff6f3fc),
            surfaceContainerLowest: Color(0xfff8f5fe),
            surfaceContainerLow: Color(0xfff2eef7),
            surfaceContainer: Color(0xffede9f2),
            surfaceContainerHigh: Color(0xffe7e3ed),
            surfaceContainerHighest: Color(0xffe1dde7),
            inverseSurface: Color(0xff15111a),
            scaffoldBackground: Color(0xffdac3fb),
            dialogBackground: Color(0xfff8f5fe),
          ),
        ),
      );
    });
    test(
        'FSSC1.38M3: GIVEN a light FlexSchemeSurfaceColors.blend created '
        'with surface mode highScaffoldLowSurfaces and level 10 '
        'EXPECT equality when made by matching light defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.light,
          blendLevel: 10,
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurfaces,
          useMaterial3: true,
        ),
        equals(
          const FlexSchemeSurfaceColors(
            surface: Color(0xfff8f7fb),
            surfaceDim: Color(0xffdddbe0),
            surfaceBright: Color(0xfff9f8fc),
            surfaceContainerLowest: Color(0xfffbfafe),
            surfaceContainerLow: Color(0xfff5f3f7),
            surfaceContainer: Color(0xfff0eef2),
            surfaceContainerHigh: Color(0xffeae8ed),
            surfaceContainerHighest: Color(0xffe4e2e7),
            inverseSurface: Color(0xff2b292d),
            scaffoldBackground: Color(0xffece1fd),
            dialogBackground: Color(0xffeae8ed),
          ),
        ),
      );
    });
    test(
        'FSSC1.39M2: GIVEN a light FlexSchemeSurfaceColors.blend created '
        'with surface mode highScaffoldLowSurfacesVariantDialog and level 20 '
        'EXPECT equality when made by matching light defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.light,
          blendLevel: 20,
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog,
          useMaterial3: false,
        ),
        equals(
          const FlexSchemeSurfaceColors(
            surface: Color(0xfff8f5fe),
            surfaceDim: Color(0xffdbd7e0),
            surfaceBright: Color(0xfff6f3fc),
            surfaceContainerLowest: Color(0xfff8f5fe),
            surfaceContainerLow: Color(0xfff2eef7),
            surfaceContainer: Color(0xffede9f2),
            surfaceContainerHigh: Color(0xffe7e3ed),
            surfaceContainerHighest: Color(0xffe1dde7),
            inverseSurface: Color(0xff15111a),
            scaffoldBackground: Color(0xffdac3fb),
            dialogBackground: Color(0xfff5fafa),
          ),
        ),
      );
    });
    test(
        'FSSC1.39M3: GIVEN a light FlexSchemeSurfaceColors.blend created '
        'with surface mode highScaffoldLowSurfacesVariantDialog and level 15 '
        'EXPECT equality when made by matching light defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.light,
          blendLevel: 15,
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog,
          useMaterial3: true,
        ),
        equals(
          const FlexSchemeSurfaceColors(
            surface: Color(0xfff7f5fb),
            surfaceDim: Color(0xffdcd9e0),
            surfaceBright: Color(0xfff8f6fc),
            surfaceContainerLowest: Color(0xfffaf8fe),
            surfaceContainerLow: Color(0xfff3f1f7),
            surfaceContainer: Color(0xffefecf2),
            surfaceContainerHigh: Color(0xffe9e6ed),
            surfaceContainerHighest: Color(0xffe3e0e7),
            inverseSurface: Color(0xff2b282f),
            scaffoldBackground: Color(0xffe3d2fc),
            dialogBackground: Color(0xffe6eaea),
          ),
        ),
      );
    });

    // 20-level Blend level test for DARK mode.

    test(
        'FSSC1.40M2: GIVEN a dark FlexSchemeSurfaceColors.blend created object '
        'with surface mode highSurfaceLowScaffold and level 20 '
        'EXPECT equality when made by matching dark defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.dark,
          blendLevel: 20,
          surfaceMode: FlexSurfaceMode.highSurfaceLowScaffold,
          useMaterial3: false,
        ),
        equals(
          const FlexSchemeSurfaceColors(
            surface: Color(0xff251f2d),
            surfaceDim: Color(0xff1b1522),
            surfaceBright: Color(0xff3c3644),
            surfaceContainerLowest: Color(0xff16101e),
            surfaceContainerLow: Color(0xff221c2a),
            surfaceContainer: Color(0xff282230),
            surfaceContainerHigh: Color(0xff2f2937),
            surfaceContainerHighest: Color(0xff393340),
            inverseSurface: Color(0xfff7f0fe),
            scaffoldBackground: Color(0xff18161b),
            dialogBackground: Color(0xff251f2d),
          ),
        ),
      );
    });
    test(
        'FSSC1.41M2: GIVEN a dark FlexSchemeSurfaceColors.blend created object '
        'with surface mode highScaffoldLevelSurface and level 20 '
        'EXPECT equality when made by matching dark defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.dark,
          blendLevel: 20,
          surfaceMode: FlexSurfaceMode.highScaffoldLevelSurface,
          useMaterial3: false,
        ),
        equals(
          const FlexSchemeSurfaceColors(
            surface: Color(0xff1f1b24),
            surfaceDim: Color(0xff141019),
            surfaceBright: Color(0xff37333c),
            surfaceContainerLowest: Color(0xff0f0b14),
            surfaceContainerLow: Color(0xff1b1720),
            surfaceContainer: Color(0xff221d27),
            surfaceContainerHigh: Color(0xff29252e),
            surfaceContainerHighest: Color(0xff332f38),
            inverseSurface: Color(0xfff9f5fe),
            scaffoldBackground: Color(0xff392d49),
            dialogBackground: Color(0xff1f1b24),
          ),
        ),
      );
    });
    test(
        'FSSC1.42M2: GIVEN a dark FlexSchemeSurfaceColors.blend created object '
        'with surface mode highScaffoldLowSurface and level 20 '
        'EXPECT equality when made by matching dark defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.dark,
          blendLevel: 20,
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
          useMaterial3: false,
        ),
        equals(
          const FlexSchemeSurfaceColors(
            surface: Color(0xff18161b),
            surfaceDim: Color(0xff0d0b0f),
            surfaceBright: Color(0xff312f34),
            surfaceContainerLowest: Color(0xff08060a),
            surfaceContainerLow: Color(0xff141217),
            surfaceContainer: Color(0xff1b191e),
            surfaceContainerHigh: Color(0xff232125),
            surfaceContainerHighest: Color(0xff2d2b30),
            inverseSurface: Color(0xfffcfafe),
            scaffoldBackground: Color(0xff392d49),
            dialogBackground: Color(0xff18161b),
          ),
        ),
      );
    });
    test(
        'FSSC1.43M2: GIVEN a dark FlexSchemeSurfaceColors.blend created object '
        'with surface mode level and level 20 '
        'EXPECT equality when made by matching dark defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.dark,
          blendLevel: 20,
          surfaceMode: FlexSurfaceMode.level,
          useMaterial3: false,
        ),
        equals(
          const FlexSchemeSurfaceColors(
            surface: Color(0xff1f1b24),
            surfaceDim: Color(0xff141019),
            surfaceBright: Color(0xff37333c),
            surfaceContainerLowest: Color(0xff0f0b14),
            surfaceContainerLow: Color(0xff1b1720),
            surfaceContainer: Color(0xff221d27),
            surfaceContainerHigh: Color(0xff29252e),
            surfaceContainerHighest: Color(0xff332f38),
            inverseSurface: Color(0xfff9f5fe),
            scaffoldBackground: Color(0xff1f1b24),
            dialogBackground: Color(0xff1f1b24),
          ),
        ),
      );
    });
    test(
        'FSSC1.44M2: GIVEN a dark FlexSchemeSurfaceColors.blend created object '
        'with surface mode levelSurfacesLowScaffold and level 20 '
        'EXPECT equality when made by matching dark defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.dark,
          blendLevel: 20,
          surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
          useMaterial3: false,
        ),
        equals(
          const FlexSchemeSurfaceColors(
            surface: Color(0xff1f1b24),
            surfaceDim: Color(0xff141019),
            surfaceBright: Color(0xff37333c),
            surfaceContainerLowest: Color(0xff0f0b14),
            surfaceContainerLow: Color(0xff1b1720),
            surfaceContainer: Color(0xff221d27),
            surfaceContainerHigh: Color(0xff29252e),
            surfaceContainerHighest: Color(0xff332f38),
            inverseSurface: Color(0xfff9f5fe),
            scaffoldBackground: Color(0xff18161b),
            dialogBackground: Color(0xff1f1b24),
          ),
        ),
      );
    });
    test(
        'FSSC1.45M2: GIVEN a dark FlexSchemeSurfaceColors.blend created object '
        'with surface mode levelSurfacesLowScaffoldVariantDialog and level 20 '
        'EXPECT equality when made by matching dark defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.dark,
          blendLevel: 20,
          surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffoldVariantDialog,
          useMaterial3: false,
        ),
        equals(
          const FlexSchemeSurfaceColors(
            surface: Color(0xff1f1b24),
            surfaceDim: Color(0xff141019),
            surfaceBright: Color(0xff37333c),
            surfaceContainerLowest: Color(0xff0f0b14),
            surfaceContainerLow: Color(0xff1b1720),
            surfaceContainer: Color(0xff221d27),
            surfaceContainerHigh: Color(0xff29252e),
            surfaceContainerHighest: Color(0xff332f38),
            inverseSurface: Color(0xfff9f5fe),
            scaffoldBackground: Color(0xff18161b),
            dialogBackground: Color(0xff102120),
          ),
        ),
      );
    });
    test(
        'FSSC1.46M2: GIVEN a dark FlexSchemeSurfaceColors.blend created object '
        'with surface mode highScaffoldLowSurfaces and level 20 '
        'EXPECT equality when made by matching dark defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.dark,
          blendLevel: 20,
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurfaces,
          useMaterial3: false,
        ),
        equals(
          const FlexSchemeSurfaceColors(
            surface: Color(0xff18161b),
            surfaceDim: Color(0xff0d0b0f),
            surfaceBright: Color(0xff312f34),
            surfaceContainerLowest: Color(0xff08060a),
            surfaceContainerLow: Color(0xff141217),
            surfaceContainer: Color(0xff1b191e),
            surfaceContainerHigh: Color(0xff232125),
            surfaceContainerHighest: Color(0xff2d2b30),
            inverseSurface: Color(0xfffcfafe),
            scaffoldBackground: Color(0xff392d49),
            dialogBackground: Color(0xff18161b),
          ),
        ),
      );
    });
    test(
        'FSSC1.47M2: GIVEN a dark FlexSchemeSurfaceColors.blend created object '
        'with surface mode highScaffoldLowSurfacesVariantDialog and level 20 '
        'EXPECT equality when made by matching dark defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.dark,
          blendLevel: 20,
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog,
          useMaterial3: false,
        ),
        equals(
          const FlexSchemeSurfaceColors(
            surface: Color(0xff18161b),
            surfaceDim: Color(0xff0d0b0f),
            surfaceBright: Color(0xff312f34),
            surfaceContainerLowest: Color(0xff08060a),
            surfaceContainerLow: Color(0xff141217),
            surfaceContainer: Color(0xff1b191e),
            surfaceContainerHigh: Color(0xff232125),
            surfaceContainerHighest: Color(0xff2d2b30),
            inverseSurface: Color(0xfffcfafe),
            scaffoldBackground: Color(0xff392d49),
            dialogBackground: Color(0xff111919),
          ),
        ),
      );
    });
    //
  });
}
