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
      surfaceVariant: FlexColor.materialLightSurface,
      inverseSurface: FlexColor.materialDarkSurface,
      background: FlexColor.materialLightBackground,
      scaffoldBackground: FlexColor.materialLightScaffoldBackground,
      dialogBackground: FlexColor.materialLightSurface,
    );
    // m2, same definition as m1.
    const FlexSchemeSurfaceColors m2 = FlexSchemeSurfaceColors(
      surface: FlexColor.materialLightSurface,
      surfaceVariant: FlexColor.materialLightSurface,
      inverseSurface: FlexColor.materialDarkSurface,
      background: FlexColor.materialLightBackground,
      scaffoldBackground: FlexColor.materialLightScaffoldBackground,
      dialogBackground: FlexColor.materialLightSurface,
    );
    // m3, one different values than m1 and m2.
    const FlexSchemeSurfaceColors m3 = FlexSchemeSurfaceColors(
      surface: FlexColor.materialLightSurface,
      surfaceVariant: FlexColor.materialLightSurface,
      inverseSurface: FlexColor.materialDarkSurface,
      background: FlexColor.lightBackground, // Different from m1 and m2.
      scaffoldBackground: FlexColor.materialLightScaffoldBackground,
      dialogBackground: FlexColor.materialLightSurface,
    );
    // m4, all values different from m1 and m2.
    const FlexSchemeSurfaceColors m4 = FlexSchemeSurfaceColors(
      surface: Color(0xFFEEEEEE),
      surfaceVariant: Color(0xFFEBBEEE),
      inverseSurface: Color(0xFFEEAAEE),
      background: Color(0xFFCCCCCC),
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
          surfaceVariant: FlexColor.materialLightSurface,
          inverseSurface: FlexColor.materialDarkSurface,
          background: FlexColor.materialLightBackground,
          scaffoldBackground: FlexColor.materialLightScaffoldBackground,
          dialogBackground: FlexColor.materialLightSurface,
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
              'FlexSchemeSurfaceColors#00000(surface: Color(0xffffffff), surfaceVariant: Color(0xffffffff), inverseSurface: Color(0xff121212), background: Color(0xffffffff), scaffoldBackground: Color(0xffffffff), dialogBackground: Color(0xffffffff))'));
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
        'FSSC1.16a: GIVEN a light FlexSchemeSurfaceColors.blend created object '
        'EXPECT equality with Material 2 light surface colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialLightSurface,
          surfaceVariant: FlexColor.lightSurfaceVariant,
          inverseSurface: FlexColor.materialDarkSurface,
          background: FlexColor.materialLightBackground,
          scaffoldBackground: FlexColor.materialLightScaffoldBackground,
          dialogBackground: FlexColor.materialLightSurface,
        )),
      );
    });
    test(
        'FSSC1.16b: GIVEN a light FlexSchemeSurfaceColors.blend( '
        'brightness: Brightness.light) created object and '
        'EXPECT equality with Material 2 light surface colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          blendLevel: 0,
          brightness: Brightness.light,
          surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialLightSurface,
          surfaceVariant: FlexColor.lightSurfaceVariant,
          inverseSurface: FlexColor.materialDarkSurface,
          background: FlexColor.materialLightBackground,
          scaffoldBackground: FlexColor.materialLightScaffoldBackground,
          dialogBackground: FlexColor.materialLightSurface,
        )),
      );
    });
    test(
        'FSSC1.17a: GIVEN a light FlexSchemeSurfaceColors.blend( '
        'brightness: Brightness.dark) created object '
        'EXPECT equality with Material 2 light surface colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(brightness: Brightness.dark),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialDarkSurface,
          surfaceVariant: FlexColor.darkSurfaceVariant,
          inverseSurface: FlexColor.materialLightSurface,
          background: FlexColor.materialDarkBackground,
          scaffoldBackground: FlexColor.materialDarkScaffoldBackground,
          dialogBackground: FlexColor.materialDarkSurface,
        )),
      );
    });
    test(
        'FSSC1.17a: GIVEN a light FlexSchemeSurfaceColors.blend( '
        'brightness: Brightness.dark) created object and '
        'with assigned default values '
        'EXPECT equality with Material 2 light surface colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.dark,
          blendLevel: 0,
          surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialDarkSurface,
          surfaceVariant: FlexColor.darkSurfaceVariant,
          inverseSurface: FlexColor.materialLightSurface,
          background: FlexColor.materialDarkBackground,
          scaffoldBackground: FlexColor.materialDarkScaffoldBackground,
          dialogBackground: FlexColor.materialDarkSurface,
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
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialLightSurface,
          surfaceVariant: FlexColor.lightSurfaceVariant,
          inverseSurface: FlexColor.materialDarkSurface,
          background: FlexColor.materialLightBackground,
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
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialLightSurface,
          surfaceVariant: FlexColor.lightSurfaceVariant,
          inverseSurface: FlexColor.materialDarkSurface,
          background: FlexColor.materialLightBackground,
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
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialLightSurface,
          surfaceVariant: FlexColor.lightSurfaceVariant,
          inverseSurface: FlexColor.materialDarkSurface,
          background: FlexColor.materialLightBackground,
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
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialLightSurface,
          surfaceVariant: FlexColor.lightSurfaceVariant,
          inverseSurface: FlexColor.materialDarkSurface,
          background: FlexColor.materialLightBackground,
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
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialLightSurface,
          surfaceVariant: FlexColor.lightSurfaceVariant,
          inverseSurface: FlexColor.materialDarkSurface,
          background: FlexColor.materialLightBackground,
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
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialLightSurface,
          surfaceVariant: FlexColor.lightSurfaceVariant,
          inverseSurface: FlexColor.materialDarkSurface,
          background: FlexColor.materialLightBackground,
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
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialLightSurface,
          surfaceVariant: FlexColor.lightSurfaceVariant,
          inverseSurface: FlexColor.materialDarkSurface,
          background: FlexColor.materialLightBackground,
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
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialLightSurface,
          surfaceVariant: FlexColor.lightSurfaceVariant,
          inverseSurface: FlexColor.materialDarkSurface,
          background: FlexColor.materialLightBackground,
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
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialDarkSurface,
          surfaceVariant: FlexColor.darkSurfaceVariant,
          inverseSurface: FlexColor.materialLightSurface,
          background: FlexColor.materialDarkBackground,
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
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialDarkSurface,
          surfaceVariant: FlexColor.darkSurfaceVariant,
          inverseSurface: FlexColor.materialLightSurface,
          background: FlexColor.materialDarkBackground,
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
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialDarkSurface,
          surfaceVariant: FlexColor.darkSurfaceVariant,
          inverseSurface: FlexColor.materialLightSurface,
          background: FlexColor.materialDarkBackground,
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
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialDarkSurface,
          surfaceVariant: FlexColor.darkSurfaceVariant,
          inverseSurface: FlexColor.materialLightSurface,
          background: FlexColor.materialDarkBackground,
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
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialDarkSurface,
          surfaceVariant: FlexColor.darkSurfaceVariant,
          inverseSurface: FlexColor.materialLightSurface,
          background: FlexColor.materialDarkBackground,
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
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialDarkSurface,
          surfaceVariant: FlexColor.darkSurfaceVariant,
          inverseSurface: FlexColor.materialLightSurface,
          background: FlexColor.materialDarkBackground,
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
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialDarkSurface,
          surfaceVariant: FlexColor.darkSurfaceVariant,
          inverseSurface: FlexColor.materialLightSurface,
          background: FlexColor.materialDarkBackground,
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
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialDarkSurface,
          surfaceVariant: FlexColor.darkSurfaceVariant,
          inverseSurface: FlexColor.materialLightSurface,
          background: FlexColor.materialDarkBackground,
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
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: Color(0xffece1fd),
          surfaceVariant: Color(0xffd5c4ee),
          inverseSurface: Color(0xff1a0f2b),
          background: Color(0xfff0e9fb),
          scaffoldBackground: Color(0xfff8f5fe),
          dialogBackground: Color(0xffece1fd),
        )),
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
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: Color(0xfff2ebfd),
          surfaceVariant: Color(0xffd8c8ee),
          inverseSurface: Color(0xff170f22),
          background: Color(0xffeadffb),
          scaffoldBackground: Color(0xffdac3fb),
          dialogBackground: Color(0xfff2ebfd),
        )),
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
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: Color(0xfff8f5fe),
          surfaceVariant: Color(0xffe3dbee),
          inverseSurface: Color(0xff141019),
          background: Color(0xfff2ebfd),
          scaffoldBackground: Color(0xffdac3fb),
          dialogBackground: Color(0xfff8f5fe),
        )),
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
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: Color(0xfff2ebfd),
          surfaceVariant: Color(0xffd8c8ee),
          inverseSurface: Color(0xff170f22),
          background: Color(0xfff2ebfd),
          scaffoldBackground: Color(0xfff2ebfd),
          dialogBackground: Color(0xfff2ebfd),
        )),
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
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: Color(0xfff2ebfd),
          surfaceVariant: Color(0xffd8c8ee),
          inverseSurface: Color(0xff170f22),
          background: Color(0xfff2ebfd),
          scaffoldBackground: Color(0xfff8f5fe),
          dialogBackground: Color(0xfff2ebfd),
        )),
      );
    });
    test(
        'FSSC1.37: GIVEN a light FlexSchemeSurfaceColors.blend created object '
        'with surface mode levelSurfacesLowScaffoldVariantDialog and level 20 '
        'EXPECT equality when made by matching light defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.light,
          blendLevel: 20,
          surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffoldVariantDialog,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: Color(0xfff2ebfd),
          surfaceVariant: Color(0xffd8c8ee),
          inverseSurface: Color(0xff170f22),
          background: Color(0xfff2ebfd),
          scaffoldBackground: Color(0xfff8f5fe),
          dialogBackground: Color(0xffebf5f5),
        )),
      );
    });
    test(
        'FSSC1.38: GIVEN a light FlexSchemeSurfaceColors.blend created object '
        'with surface mode highScaffoldLowSurfaces and level 20 '
        'EXPECT equality when made by matching light defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.light,
          blendLevel: 20,
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurfaces,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: Color(0xfff6f3fc),
          surfaceVariant: Color(0xffe3dbee),
          inverseSurface: Color(0xff130f18),
          background: Color(0xfff6f3fc),
          scaffoldBackground: Color(0xffd8c1f9),
          dialogBackground: Color(0xfff6f3fc),
        )),
      );
    });
    test(
        'FSSC1.39: GIVEN a light FlexSchemeSurfaceColors.blend created object '
        'with surface mode highScaffoldLowSurfacesVariantDialog and level 20 '
        'EXPECT equality when made by matching light defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.light,
          blendLevel: 20,
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: Color(0xfff6f3fc),
          surfaceVariant: Color(0xffe3dbee),
          inverseSurface: Color(0xff130f18),
          background: Color(0xfff6f3fc),
          scaffoldBackground: Color(0xffd8c1f9),
          dialogBackground: Color(0xfff3f8f8),
        )),
      );
    });

    // 20-level Blend level test for DARK mode.

    test(
        'FSSC1.40: GIVEN a dark FlexSchemeSurfaceColors.blend created object '
        'with surface mode highSurfaceLowScaffold and level 20 '
        'EXPECT equality when made by matching dark defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.dark,
          blendLevel: 20,
          surfaceMode: FlexSurfaceMode.highSurfaceLowScaffold,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: Color(0xff251e2c),
          surfaceVariant: Color(0xff4a4055),
          inverseSurface: Color(0xfff7f0fe),
          background: Color(0xff1d1922),
          scaffoldBackground: Color(0xff18161b),
          dialogBackground: Color(0xff251e2c),
        )),
      );
    });
    test(
        'FSSC1.41: GIVEN a dark FlexSchemeSurfaceColors.blend created object '
        'with surface mode highScaffoldLevelSurface and level 20 '
        'EXPECT equality when made by matching dark defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.dark,
          blendLevel: 20,
          surfaceMode: FlexSurfaceMode.highScaffoldLevelSurface,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: Color(0xff1e1a23),
          surfaceVariant: Color(0xff473f51),
          inverseSurface: Color(0xfff9f5fe),
          background: Color(0xff241d2b),
          scaffoldBackground: Color(0xff392d49),
          dialogBackground: Color(0xff1e1a23),
        )),
      );
    });
    test(
        'FSSC1.42: GIVEN a dark FlexSchemeSurfaceColors.blend created object '
        'with surface mode highScaffoldLowSurface and level 20 '
        'EXPECT equality when made by matching dark defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.dark,
          blendLevel: 20,
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: Color(0xff17151a),
          surfaceVariant: Color(0xff3c3841),
          inverseSurface: Color(0xfffcfafe),
          background: Color(0xff1e1a23),
          scaffoldBackground: Color(0xff392c48),
          dialogBackground: Color(0xff17151a),
        )),
      );
    });
    test(
        'FSSC1.43: GIVEN a dark FlexSchemeSurfaceColors.blend created object '
        'with surface mode level and level 20 '
        'EXPECT equality when made by matching dark defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.dark,
          blendLevel: 20,
          surfaceMode: FlexSurfaceMode.level,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: Color(0xff1e1a23),
          surfaceVariant: Color(0xff473f51),
          inverseSurface: Color(0xfff9f5fe),
          background: Color(0xff1e1a23),
          scaffoldBackground: Color(0xff1e1a23),
          dialogBackground: Color(0xff1e1a23),
        )),
      );
    });
    test(
        'FSSC1.44: GIVEN a dark FlexSchemeSurfaceColors.blend created object '
        'with surface mode levelSurfacesLowScaffold and level 20 '
        'EXPECT equality when made by matching dark defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.dark,
          blendLevel: 20,
          surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: Color(0xff1e1a23),
          surfaceVariant: Color(0xff473f51),
          inverseSurface: Color(0xfff9f5fe),
          background: Color(0xff1e1a23),
          scaffoldBackground: Color(0xff17151a),
          dialogBackground: Color(0xff1e1a23),
        )),
      );
    });
    test(
        'FSSC1.45: GIVEN a dark FlexSchemeSurfaceColors.blend created object '
        'with surface mode levelSurfacesLowScaffoldVariantDialog and level 20 '
        'EXPECT equality when made by matching dark defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.dark,
          blendLevel: 20,
          surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffoldVariantDialog,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: Color(0xff1e1a23),
          surfaceVariant: Color(0xff473f51),
          inverseSurface: Color(0xfff9f5fe),
          background: Color(0xff1e1a23),
          scaffoldBackground: Color(0xff17151a),
          dialogBackground: Color(0xff0f201f),
        )),
      );
    });
    test(
        'FSSC1.46: GIVEN a dark FlexSchemeSurfaceColors.blend created object '
        'with surface mode highScaffoldLowSurfaces and level 20 '
        'EXPECT equality when made by matching dark defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.dark,
          blendLevel: 20,
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurfaces,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: Color(0xff161419),
          surfaceVariant: Color(0xff3c3841),
          inverseSurface: Color(0xfffaf8fc),
          background: Color(0xff161419),
          scaffoldBackground: Color(0xff382b47),
          dialogBackground: Color(0xff161419),
        )),
      );
    });
    test(
        'FSSC1.47: GIVEN a dark FlexSchemeSurfaceColors.blend created object '
        'with surface mode highScaffoldLowSurfacesVariantDialog and level 20 '
        'EXPECT equality when made by matching dark defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.dark,
          blendLevel: 20,
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: Color(0xff161419),
          surfaceVariant: Color(0xff3c3841),
          inverseSurface: Color(0xfffaf8fc),
          background: Color(0xff161419),
          scaffoldBackground: Color(0xff382b47),
          dialogBackground: Color(0xff0f1717),
        )),
      );
    });

    //
  });
}
