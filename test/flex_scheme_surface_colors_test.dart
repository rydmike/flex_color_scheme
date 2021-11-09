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
    test(
        'FCS1.00f: GIVEN a FlexSchemeSurfaceColors.from light with null '
        'primary when surface style is blend surface '
        'EXPECT OK and same as if primary: materialLightPrimary used.', () {
      expect(
        FlexSchemeSurfaceColors.from(
          brightness: Brightness.light,
          surfaceStyle: FlexSurface.medium,
          primary: null,
        ),
        equals(FlexSchemeSurfaceColors.from(
          brightness: Brightness.light,
          surfaceStyle: FlexSurface.medium,
          primary: FlexColor.materialLightPrimary,
        )),
      );
    });
    test(
        'FCS1.00g: GIVEN a FlexSchemeSurfaceColors.from dark with null '
        'primary when surface style is blend surface '
        'EXPECT OK and same as if primary: materialDarkPrimary used.', () {
      expect(
        FlexSchemeSurfaceColors.from(
          brightness: Brightness.dark,
          surfaceStyle: FlexSurface.heavy,
          primary: null,
        ),
        equals(FlexSchemeSurfaceColors.from(
          brightness: Brightness.dark,
          surfaceStyle: FlexSurface.heavy,
          primary: FlexColor.materialDarkPrimary,
        )),
      );
    });
    test(
        'FCS1.00h: GIVEN a FlexSchemeSurfaceColors.from dark with null primary '
        'when surface style is none blend surface '
        'EXPECT OK and equals to self from copyWith', () {
      expect(
          FlexSchemeSurfaceColors.from(
            brightness: Brightness.dark,
            surfaceStyle: FlexSurface.material,
            primary: null,
          ),
          equals(FlexSchemeSurfaceColors.from(
            brightness: Brightness.dark,
            surfaceStyle: FlexSurface.material,
            primary: null,
          ).copyWith()));
    });
    test(
        'FCS1.00i: GIVEN a FlexSchemeSurfaceColors.from light with null '
        'primary when surface style is none blend surface '
        'EXPECT OK and equals to self from copyWith', () {
      expect(
          FlexSchemeSurfaceColors.from(
            brightness: Brightness.light,
            surfaceStyle: FlexSurface.custom,
            primary: null,
          ),
          equals(FlexSchemeSurfaceColors.from(
            brightness: Brightness.light,
            surfaceStyle: FlexSurface.custom,
            primary: null,
          ).copyWith()));
    });
    // m1 = Default material light theme surface colors.
    const FlexSchemeSurfaceColors m1 = FlexSchemeSurfaceColors(
      surface: FlexColor.materialLightSurface,
      background: FlexColor.materialLightBackground,
      scaffoldBackground: FlexColor.materialLightScaffoldBackground,
      dialogBackground: FlexColor.materialLightSurface,
    );
    // m2, same definition as m1.
    const FlexSchemeSurfaceColors m2 = FlexSchemeSurfaceColors(
      surface: FlexColor.materialLightSurface,
      background: FlexColor.materialLightBackground,
      scaffoldBackground: FlexColor.materialLightScaffoldBackground,
      dialogBackground: FlexColor.materialLightSurface,
    );
    // m3, one different values than m1 and m2.
    const FlexSchemeSurfaceColors m3 = FlexSchemeSurfaceColors(
      surface: FlexColor.materialLightSurface,
      background: FlexColor.lightBackground, // Different from m1 and m2.
      scaffoldBackground: FlexColor.materialLightScaffoldBackground,
      dialogBackground: FlexColor.materialLightSurface,
    );
    // m4, all values different from m1 and m2.
    const FlexSchemeSurfaceColors m4 = FlexSchemeSurfaceColors(
      surface: Color(0xFFEEEEEE),
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
    // TEST FlexSchemeSurfaceColors.from
    //**************************************************************************

    test(
        'FSSC1.04: GIVEN a light FlexSchemeSurfaceColors.from created object '
        'EXPECT equality when made by matching light defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.from(),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialLightSurface,
          background: FlexColor.materialLightBackground,
          scaffoldBackground: FlexColor.materialLightScaffoldBackground,
          dialogBackground: FlexColor.materialLightSurface,
        )),
      );
    });
    test(
        'FSSC1.05: GIVEN a light FlexSchemeSurfaceColors.from default values '
        'created object EXPECT equality when made with assumed defaults.', () {
      expect(
        FlexSchemeSurfaceColors.from(),
        equals(FlexSchemeSurfaceColors.from(
          brightness: Brightness.light,
          surfaceStyle: FlexSurface.material,
          primary: FlexColor.materialLightPrimary,
        )),
      );
    });
    test(
        'FSSC1.06: GIVEN a dark FlexSchemeSurfaceColors.from created object '
        'EXPECT equality when made by matching dark defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.from(brightness: Brightness.dark),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialDarkSurface,
          background: FlexColor.materialDarkBackground,
          scaffoldBackground: FlexColor.materialDarkScaffoldBackground,
          dialogBackground: FlexColor.materialDarkSurface,
        )),
      );
    });
    test(
        'FSSC1.08: GIVEN a light FlexSchemeSurfaceColors.from light branding '
        'EXPECT equality with defined colors and same blend.', () {
      expect(
        FlexSchemeSurfaceColors.from(
          surfaceStyle: FlexSurface.light,
        ),
        equals(FlexSchemeSurfaceColors(
          surface:
              FlexColor.lightSurface.blend(FlexColor.materialLightPrimary, 0),
          background: FlexColor.lightBackground
              .blend(FlexColor.materialLightPrimary, 2),
          scaffoldBackground: FlexColor.lightScaffoldBackground
              .blend(FlexColor.materialLightPrimary, 0),
          dialogBackground:
              FlexColor.lightSurface.blend(FlexColor.materialLightPrimary, 0),
        )),
      );
    });

    test(
        'FSSC1.09: GIVEN a light FlexSchemeSurfaceColors.from medium branding '
        'EXPECT equality with defined colors and same blend.', () {
      expect(
        FlexSchemeSurfaceColors.from(
          surfaceStyle: FlexSurface.medium,
        ),
        equals(FlexSchemeSurfaceColors(
          surface:
              FlexColor.lightSurface.blend(FlexColor.materialLightPrimary, 1),
          background: FlexColor.lightBackground
              .blend(FlexColor.materialLightPrimary, 4),
          scaffoldBackground: FlexColor.lightScaffoldBackground
              .blend(FlexColor.materialLightPrimary, 0),
          dialogBackground:
              FlexColor.lightSurface.blend(FlexColor.materialLightPrimary, 1),
        )),
      );
    });

    test(
        'FSSC1.10: GIVEN a light FlexSchemeSurfaceColors.from strong branding '
        'EXPECT equality with defined colors and same blend.', () {
      expect(
        FlexSchemeSurfaceColors.from(
          surfaceStyle: FlexSurface.strong,
        ),
        equals(FlexSchemeSurfaceColors(
          surface:
              FlexColor.lightSurface.blend(FlexColor.materialLightPrimary, 2),
          background: FlexColor.lightBackground
              .blend(FlexColor.materialLightPrimary, 6),
          scaffoldBackground: FlexColor.lightScaffoldBackground
              .blend(FlexColor.materialLightPrimary, 0),
          dialogBackground:
              FlexColor.lightSurface.blend(FlexColor.materialLightPrimary, 2),
        )),
      );
    });

    test(
        'FSSC1.11: GIVEN a light FlexSchemeSurfaceColors.from heavy branding '
        'EXPECT equality with defined colors and same blend.', () {
      expect(
        FlexSchemeSurfaceColors.from(
          surfaceStyle: FlexSurface.heavy,
        ),
        equals(FlexSchemeSurfaceColors(
          surface:
              FlexColor.lightSurface.blend(FlexColor.materialLightPrimary, 3),
          background: FlexColor.lightBackground
              .blend(FlexColor.materialLightPrimary, 8),
          scaffoldBackground: FlexColor.lightScaffoldBackground
              .blend(FlexColor.materialLightPrimary, 1),
          dialogBackground:
              FlexColor.lightSurface.blend(FlexColor.materialLightPrimary, 3),
        )),
      );
    });
    test(
        'FSSC1.12: GIVEN a dark FlexSchemeSurfaceColors.from light branding '
        'EXPECT equality with defined colors and same blend.', () {
      expect(
        FlexSchemeSurfaceColors.from(
          brightness: Brightness.dark,
          surfaceStyle: FlexSurface.light,
          primary: FlexColor.materialDarkPrimary,
        ),
        equals(FlexSchemeSurfaceColors(
          surface:
              FlexColor.darkSurface.blend(FlexColor.materialDarkPrimary, 2),
          background:
              FlexColor.darkBackground.blend(FlexColor.materialDarkPrimary, 5),
          scaffoldBackground: FlexColor.darkScaffoldBackground
              .blend(FlexColor.materialDarkPrimary, 0),
          dialogBackground:
              FlexColor.darkSurface.blend(FlexColor.materialDarkPrimary, 2),
        )),
      );
    });

    test(
        'FSSC1.13: GIVEN a dark FlexSchemeSurfaceColors.from medium branding '
        'EXPECT equality with defined colors and same blend.', () {
      expect(
        FlexSchemeSurfaceColors.from(
          brightness: Brightness.dark,
          surfaceStyle: FlexSurface.medium,
          primary: FlexColor.materialDarkPrimary,
        ),
        equals(FlexSchemeSurfaceColors(
          surface:
              FlexColor.darkSurface.blend(FlexColor.materialDarkPrimary, 4),
          background:
              FlexColor.darkBackground.blend(FlexColor.materialDarkPrimary, 8),
          scaffoldBackground: FlexColor.darkScaffoldBackground
              .blend(FlexColor.materialDarkPrimary, 0),
          dialogBackground:
              FlexColor.darkSurface.blend(FlexColor.materialDarkPrimary, 4),
        )),
      );
    });

    test(
        'FSSC1.14: GIVEN a dark FlexSchemeSurfaceColors.from strong branding '
        'EXPECT equality with defined colors and same blend.', () {
      expect(
        FlexSchemeSurfaceColors.from(
          brightness: Brightness.dark,
          surfaceStyle: FlexSurface.strong,
          primary: FlexColor.materialDarkPrimary,
        ),
        equals(FlexSchemeSurfaceColors(
          surface:
              FlexColor.darkSurface.blend(FlexColor.materialDarkPrimary, 6),
          background:
              FlexColor.darkBackground.blend(FlexColor.materialDarkPrimary, 11),
          scaffoldBackground: FlexColor.darkScaffoldBackground
              .blend(FlexColor.materialDarkPrimary, 0),
          dialogBackground:
              FlexColor.darkSurface.blend(FlexColor.materialDarkPrimary, 6),
        )),
      );
    });

    test(
        'FSSC1.15: GIVEN a dark FlexSchemeSurfaceColors.from heavy branding '
        'EXPECT equality with defined colors and same blend.', () {
      expect(
        FlexSchemeSurfaceColors.from(
          brightness: Brightness.dark,
          surfaceStyle: FlexSurface.heavy,
          primary: FlexColor.materialDarkPrimary,
        ),
        equals(FlexSchemeSurfaceColors(
          surface:
              FlexColor.darkSurface.blend(FlexColor.materialDarkPrimary, 8),
          background:
              FlexColor.darkBackground.blend(FlexColor.materialDarkPrimary, 14),
          scaffoldBackground: FlexColor.darkScaffoldBackground
              .blend(FlexColor.materialDarkPrimary, 2),
          dialogBackground:
              FlexColor.darkSurface.blend(FlexColor.materialDarkPrimary, 8),
        )),
      );
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
              'FlexSchemeSurfaceColors#00000(surface: Color(0xffffffff), background: Color(0xffffffff), scaffoldBackground: Color(0xffffffff), dialogBackground: Color(0xffffffff))'));
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
    // This happens to always equal now in tests, if it start failing, test
    // 18c is actually enough.
    test('FSSC1.18b: Test hashCode exact value.', () {
      expect(m1.hashCode, 301748450);
    });
    test('FSSC1.18c: Test hashCode copyWith has same exact value.', () {
      expect(m1.hashCode, equals(m1.copyWith().hashCode));
    });

    //**************************************************************************
    // TEST FlexSchemeSurfaceColors.blend
    //**************************************************************************

    // Default value tests ...
    test(
        'FSSC1.16a: GIVEN a light FlexSchemeSurfaceColors.blend created object '
        'EXPECT equality when made by matching light defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialLightSurface,
          background: FlexColor.materialLightBackground,
          scaffoldBackground: FlexColor.materialLightScaffoldBackground,
          dialogBackground: FlexColor.materialLightSurface,
        )),
      );
    });
    test(
        'FSSC1.16b: GIVEN a light FlexSchemeSurfaceColors.blend created object '
        'with assigned default values '
        'EXPECT equality when made by matching light colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          blendLevel: 0,
          brightness: Brightness.light,
          surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialLightSurface,
          background: FlexColor.materialLightBackground,
          scaffoldBackground: FlexColor.materialLightScaffoldBackground,
          dialogBackground: FlexColor.materialLightSurface,
        )),
      );
    });
    test(
        'FSSC1.17a: GIVEN a light FlexSchemeSurfaceColors.blend( '
        'brightness: Brightness.dark) created object '
        'EXPECT equality when made by matching dark defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(brightness: Brightness.dark),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialDarkSurface,
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
        'EXPECT equality when made by matching dark defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.dark,
          blendLevel: 0,
          surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialDarkSurface,
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
        'EXPECT equality when made by matching light defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.light,
          blendLevel: 0,
          surfaceMode: FlexSurfaceMode.highSurfaceLowScaffold,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialLightSurface,
          background: FlexColor.materialLightBackground,
          scaffoldBackground: FlexColor.materialLightScaffoldBackground,
          dialogBackground: FlexColor.materialLightSurface,
        )),
      );
    });
    test(
        'FSSC1.19: GIVEN a light FlexSchemeSurfaceColors.blend created object '
        'with surface mode veryHighScaffoldLevelSurface and level 0 '
        'EXPECT equality when made by matching light defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.light,
          blendLevel: 0,
          surfaceMode: FlexSurfaceMode.highScaffoldLevelSurface,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialLightSurface,
          background: FlexColor.materialLightBackground,
          scaffoldBackground: FlexColor.materialLightScaffoldBackground,
          dialogBackground: FlexColor.materialLightSurface,
        )),
      );
    });
    test(
        'FSSC1.19b: GIVEN a light FlexSchemeSurfaceColors.blend created object '
        'with surface mode highScaffoldLowSurface and level 0 '
        'EXPECT equality when made by matching light defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.light,
          blendLevel: 0,
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.lightSurface,
          background: FlexColor.lightSurface,
          scaffoldBackground: FlexColor.lightSurface,
          dialogBackground: FlexColor.lightSurface,
        )),
      );
    });
    test(
        'FSSC1.20: GIVEN a light FlexSchemeSurfaceColors.blend created object '
        'with surface mode flat and level 0 '
        'EXPECT equality when made by matching light defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.light,
          blendLevel: 0,
          surfaceMode: FlexSurfaceMode.level,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.lightSurface,
          background: FlexColor.lightSurface,
          scaffoldBackground: FlexColor.lightSurface,
          dialogBackground: FlexColor.lightSurface,
        )),
      );
    });
    test(
        'FSSC1.21: GIVEN a light FlexSchemeSurfaceColors.blend created object '
        'with surface mode lowScaffold and level 0 '
        'EXPECT equality when made by matching light defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.light,
          blendLevel: 0,
          surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.lightSurface,
          background: FlexColor.lightSurface,
          scaffoldBackground: FlexColor.lightSurface,
          dialogBackground: FlexColor.lightSurface,
        )),
      );
    });
    test(
        'FSSC1.22: GIVEN a light FlexSchemeSurfaceColors.blend created object '
        'with surface mode lowScaffoldVariantDialog and level 0 '
        'EXPECT equality when made by matching light defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.light,
          blendLevel: 0,
          surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffoldVariantDialog,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.lightSurface,
          background: FlexColor.lightSurface,
          scaffoldBackground: FlexColor.lightSurface,
          dialogBackground: FlexColor.lightSurface,
        )),
      );
    });
    test(
        'FSSC1.23: GIVEN a light FlexSchemeSurfaceColors.blend created object '
        'with surface mode veryHighScaffold and level 0 '
        'EXPECT equality when made by matching light defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.light,
          blendLevel: 0,
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurfaces,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.lightBackground,
          background: FlexColor.lightBackground,
          scaffoldBackground: FlexColor.lightBackground,
          dialogBackground: FlexColor.lightBackground,
        )),
      );
    });
    test(
        'FSSC1.24: GIVEN a light FlexSchemeSurfaceColors.blend created object '
        'with surface mode veryHighScaffoldVariantDialog and level 0 '
        'EXPECT equality when made by matching light defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.light,
          blendLevel: 0,
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.lightBackground,
          background: FlexColor.lightBackground,
          scaffoldBackground: FlexColor.lightBackground,
          dialogBackground: FlexColor.lightBackground,
        )),
      );
    });

    // ZERO Blend level test for DARK mode.

    test(
        'FSSC1.25: GIVEN a dark FlexSchemeSurfaceColors.blend created object '
        'with surface mode highSurfaceLowScaffold and level 0 '
        'EXPECT equality when made by matching dark defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.dark,
          blendLevel: 0,
          surfaceMode: FlexSurfaceMode.highSurfaceLowScaffold,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialDarkSurface,
          background: FlexColor.materialDarkBackground,
          scaffoldBackground: FlexColor.materialDarkScaffoldBackground,
          dialogBackground: FlexColor.materialDarkSurface,
        )),
      );
    });
    test(
        'FSSC1.26: GIVEN a dark FlexSchemeSurfaceColors.blend created object '
        'with surface mode veryHighScaffoldLevelSurface and level 0 '
        'EXPECT equality when made by matching dark defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.dark,
          blendLevel: 0,
          surfaceMode: FlexSurfaceMode.highScaffoldLevelSurface,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.materialDarkSurface,
          background: FlexColor.materialDarkBackground,
          scaffoldBackground: FlexColor.materialDarkScaffoldBackground,
          dialogBackground: FlexColor.materialDarkSurface,
        )),
      );
    });
    test(
        'FSSC1.26b: GIVEN a dark FlexSchemeSurfaceColors.blend created object '
        'with surface mode highScaffoldLowSurface and level 0 '
        'EXPECT equality when made by matching dark defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.dark,
          blendLevel: 0,
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.darkSurface,
          background: FlexColor.darkSurface,
          scaffoldBackground: FlexColor.darkSurface,
          dialogBackground: FlexColor.darkSurface,
        )),
      );
    });
    test(
        'FSSC1.27: GIVEN a dark FlexSchemeSurfaceColors.blend created object '
        'with surface mode flat and level 0 '
        'EXPECT equality when made by matching dark defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.dark,
          blendLevel: 0,
          surfaceMode: FlexSurfaceMode.level,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.darkSurface,
          background: FlexColor.darkSurface,
          scaffoldBackground: FlexColor.darkSurface,
          dialogBackground: FlexColor.darkSurface,
        )),
      );
    });
    test(
        'FSSC1.28: GIVEN a dark FlexSchemeSurfaceColors.blend created object '
        'with surface mode lowScaffold and level 0 '
        'EXPECT equality when made by matching dark defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.dark,
          blendLevel: 0,
          surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.darkSurface,
          background: FlexColor.darkSurface,
          scaffoldBackground: FlexColor.darkSurface,
          dialogBackground: FlexColor.darkSurface,
        )),
      );
    });
    test(
        'FSSC1.29: GIVEN a dark FlexSchemeSurfaceColors.blend created object '
        'with surface mode lowScaffoldVariantDialog and level 0 '
        'EXPECT equality when made by matching dark defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.dark,
          blendLevel: 0,
          surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffoldVariantDialog,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.darkSurface,
          background: FlexColor.darkSurface,
          scaffoldBackground: FlexColor.darkSurface,
          dialogBackground: FlexColor.darkSurface,
        )),
      );
    });
    test(
        'FSSC1.30: GIVEN a dark FlexSchemeSurfaceColors.blend created object '
        'with surface mode veryHighScaffold and level 0 '
        'EXPECT equality when made by matching dark defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.dark,
          blendLevel: 0,
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurfaces,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.darkBackground,
          background: FlexColor.darkBackground,
          scaffoldBackground: FlexColor.darkBackground,
          dialogBackground: FlexColor.darkBackground,
        )),
      );
    });
    test(
        'FSSC1.31: GIVEN a dark FlexSchemeSurfaceColors.blend created object '
        'with surface mode veryHighScaffoldVariantDialog and level 0 '
        'EXPECT equality when made by matching dark defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.dark,
          blendLevel: 0,
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: FlexColor.darkBackground,
          background: FlexColor.darkBackground,
          scaffoldBackground: FlexColor.darkBackground,
          dialogBackground: FlexColor.darkBackground,
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
          background: Color(0xfff0e9fb),
          scaffoldBackground: Color(0xfff8f5fe),
          dialogBackground: Color(0xffece1fd),
        )),
      );
    });
    test(
        'FSSC1.33: GIVEN a light FlexSchemeSurfaceColors.blend created object '
        'with surface mode veryHighScaffoldLevelSurface and level 20 '
        'EXPECT equality when made by matching light defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.light,
          blendLevel: 20,
          surfaceMode: FlexSurfaceMode.highScaffoldLevelSurface,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: Color(0xfff2ebfd),
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
          background: Color(0xfff2ebfd),
          scaffoldBackground: Color(0xffdac3fb),
          dialogBackground: Color(0xfff8f5fe),
        )),
      );
    });
    test(
        'FSSC1.35: GIVEN a light FlexSchemeSurfaceColors.blend created object '
        'with surface mode flat and level 20 '
        'EXPECT equality when made by matching light defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.light,
          blendLevel: 20,
          surfaceMode: FlexSurfaceMode.level,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: Color(0xfff2ebfd),
          background: Color(0xfff2ebfd),
          scaffoldBackground: Color(0xfff2ebfd),
          dialogBackground: Color(0xfff2ebfd),
        )),
      );
    });
    test(
        'FSSC1.36: GIVEN a light FlexSchemeSurfaceColors.blend created object '
        'with surface mode lowScaffold and level 20 '
        'EXPECT equality when made by matching light defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.light,
          blendLevel: 20,
          surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: Color(0xfff2ebfd),
          background: Color(0xfff2ebfd),
          scaffoldBackground: Color(0xfff8f5fe),
          dialogBackground: Color(0xfff2ebfd),
        )),
      );
    });
    test(
        'FSSC1.37: GIVEN a light FlexSchemeSurfaceColors.blend created object '
        'with surface mode lowScaffoldVariantDialog and level 20 '
        'EXPECT equality when made by matching light defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.light,
          blendLevel: 20,
          surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffoldVariantDialog,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: Color(0xfff2ebfd),
          background: Color(0xfff2ebfd),
          scaffoldBackground: Color(0xfff8f5fe),
          dialogBackground: Color(0xffebf5f5),
        )),
      );
    });
    test(
        'FSSC1.38: GIVEN a light FlexSchemeSurfaceColors.blend created object '
        'with surface mode veryHighScaffold and level 20 '
        'EXPECT equality when made by matching light defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.light,
          blendLevel: 20,
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurfaces,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: Color(0xfff6f3fc),
          background: Color(0xfff6f3fc),
          scaffoldBackground: Color(0xffd8c1f9),
          dialogBackground: Color(0xfff6f3fc),
        )),
      );
    });
    test(
        'FSSC1.39: GIVEN a light FlexSchemeSurfaceColors.blend created object '
        'with surface mode veryHighScaffoldVariantDialog and level 20 '
        'EXPECT equality when made by matching light defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.light,
          blendLevel: 20,
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: Color(0xfff6f3fc),
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
          surface: Color(0xff392c48),
          background: Color(0xff2a2235),
          scaffoldBackground: Color(0xff1f1b24),
          dialogBackground: Color(0xff392c48),
        )),
      );
    });
    test(
        'FSSC1.41: GIVEN a dark FlexSchemeSurfaceColors.blend created object '
        'with surface mode veryHighScaffoldLevelSurface and level 20 '
        'EXPECT equality when made by matching dark defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.dark,
          blendLevel: 20,
          surfaceMode: FlexSurfaceMode.highScaffoldLevelSurface,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: Color(0xff2b2335),
          background: Color(0xff382b47),
          scaffoldBackground: Color(0xff614880),
          dialogBackground: Color(0xff2b2335),
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
          surface: Color(0xff1e1a23),
          background: Color(0xff2b2335),
          scaffoldBackground: Color(0xff61487f),
          dialogBackground: Color(0xff1e1a23),
        )),
      );
    });
    test(
        'FSSC1.43: GIVEN a dark FlexSchemeSurfaceColors.blend created object '
        'with surface mode flat and level 20 '
        'EXPECT equality when made by matching dark defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.dark,
          blendLevel: 20,
          surfaceMode: FlexSurfaceMode.level,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: Color(0xff2b2335),
          background: Color(0xff2b2335),
          scaffoldBackground: Color(0xff2b2335),
          dialogBackground: Color(0xff2b2335),
        )),
      );
    });
    test(
        'FSSC1.44: GIVEN a dark FlexSchemeSurfaceColors.blend created object '
        'with surface mode lowScaffold and level 20 '
        'EXPECT equality when made by matching dark defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.dark,
          blendLevel: 20,
          surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: Color(0xff2b2335),
          background: Color(0xff2b2335),
          scaffoldBackground: Color(0xff1e1a23),
          dialogBackground: Color(0xff2b2335),
        )),
      );
    });
    test(
        'FSSC1.45: GIVEN a dark FlexSchemeSurfaceColors.blend created object '
        'with surface mode lowScaffoldVariantDialog and level 20 '
        'EXPECT equality when made by matching dark defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.dark,
          blendLevel: 20,
          surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffoldVariantDialog,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: Color(0xff2b2335),
          background: Color(0xff2b2335),
          scaffoldBackground: Color(0xff1e1a23),
          dialogBackground: Color(0xff0e302d),
        )),
      );
    });
    test(
        'FSSC1.46: GIVEN a dark FlexSchemeSurfaceColors.blend created object '
        'with surface mode veryHighScaffold and level 20 '
        'EXPECT equality when made by matching dark defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.dark,
          blendLevel: 20,
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurfaces,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: Color(0xff1d1922),
          background: Color(0xff1d1922),
          scaffoldBackground: Color(0xff60477f),
          dialogBackground: Color(0xff1d1922),
        )),
      );
    });
    test(
        'FSSC1.47: GIVEN a dark FlexSchemeSurfaceColors.blend created object '
        'with surface mode veryHighScaffoldVariantDialog and level 20 '
        'EXPECT equality when made by matching dark defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(
          brightness: Brightness.dark,
          blendLevel: 20,
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog,
        ),
        equals(const FlexSchemeSurfaceColors(
          surface: Color(0xff1d1922),
          background: Color(0xff1d1922),
          scaffoldBackground: Color(0xff60477f),
          dialogBackground: Color(0xff0e1f1e),
        )),
      );
    });

    //
  });
}
