import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

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
          // ignore: avoid_redundant_argument_values
          brightness: Brightness.light,
          surfaceStyle: FlexSurface.medium,
          // ignore: avoid_redundant_argument_values
          primary: null,
        ),
        FlexSchemeSurfaceColors.from(
          // ignore: avoid_redundant_argument_values
          brightness: Brightness.light,
          surfaceStyle: FlexSurface.medium,
          // ignore: avoid_redundant_argument_values
          primary: FlexColor.materialLightPrimary,
        ),
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
          // ignore: avoid_redundant_argument_values
          primary: null,
        ),
        FlexSchemeSurfaceColors.from(
          brightness: Brightness.dark,
          surfaceStyle: FlexSurface.heavy,
          // ignore: avoid_redundant_argument_values
          primary: FlexColor.materialDarkPrimary,
        ),
      );
    });
    test(
        'FCS1.00h: GIVEN a FlexSchemeSurfaceColors.from dark with null primary '
        'when surface style is none blend surface '
        'EXPECT OK and equals to self from copyWith', () {
      expect(
          FlexSchemeSurfaceColors.from(
            brightness: Brightness.dark,
            // ignore: avoid_redundant_argument_values
            surfaceStyle: FlexSurface.material,
            // ignore: avoid_redundant_argument_values
            primary: null,
          ),
          FlexSchemeSurfaceColors.from(
            brightness: Brightness.dark,
            // ignore: avoid_redundant_argument_values
            surfaceStyle: FlexSurface.material,
            // ignore: avoid_redundant_argument_values
            primary: null,
          ).copyWith());
    });
    test(
        'FCS1.00i: GIVEN a FlexSchemeSurfaceColors.from light with null '
        'primary when surface style is none blend surface '
        'EXPECT OK and equals to self from copyWith', () {
      expect(
          FlexSchemeSurfaceColors.from(
            // ignore: avoid_redundant_argument_values
            brightness: Brightness.light,
            surfaceStyle: FlexSurface.custom,
            // ignore: avoid_redundant_argument_values
            primary: null,
          ),
          FlexSchemeSurfaceColors.from(
            // ignore: avoid_redundant_argument_values
            brightness: Brightness.light,
            surfaceStyle: FlexSurface.custom,
            // ignore: avoid_redundant_argument_values
            primary: null,
          ).copyWith());
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
        const FlexSchemeSurfaceColors(
          surface: FlexColor.materialLightSurface,
          background: FlexColor.materialLightBackground,
          scaffoldBackground: FlexColor.materialLightScaffoldBackground,
          dialogBackground: FlexColor.materialLightSurface,
        ),
      );
    });
    test(
        'FSSC1.05: GIVEN a light FlexSchemeSurfaceColors.from default values '
        'created object EXPECT equality when made with assumed defaults.', () {
      expect(
        FlexSchemeSurfaceColors.from(),
        FlexSchemeSurfaceColors.from(
          // ignore: avoid_redundant_argument_values
          brightness: Brightness.light,
          // ignore: avoid_redundant_argument_values
          surfaceStyle: FlexSurface.material,
          // ignore: avoid_redundant_argument_values
          primary: FlexColor.materialLightPrimary,
        ),
      );
    });
    test(
        'FSSC1.06: GIVEN a dark FlexSchemeSurfaceColors.from created object '
        'EXPECT equality when made by matching dark defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.from(brightness: Brightness.dark),
        const FlexSchemeSurfaceColors(
          surface: FlexColor.materialDarkSurface,
          background: FlexColor.materialDarkBackground,
          scaffoldBackground: FlexColor.materialDarkScaffoldBackground,
          dialogBackground: FlexColor.materialDarkSurface,
        ),
      );
    });
    test(
        'FSSC1.08: GIVEN a light FlexSchemeSurfaceColors.from light branding '
        'EXPECT equality with defined colors and same blend.', () {
      expect(
        FlexSchemeSurfaceColors.from(
          surfaceStyle: FlexSurface.light,
        ),
        FlexSchemeSurfaceColors(
          surface:
              FlexColor.lightSurface.blend(FlexColor.materialLightPrimary, 0),
          background: FlexColor.lightBackground
              .blend(FlexColor.materialLightPrimary, 2),
          scaffoldBackground: FlexColor.lightScaffoldBackground
              .blend(FlexColor.materialLightPrimary, 0),
          dialogBackground:
              FlexColor.lightSurface.blend(FlexColor.materialLightPrimary, 0),
        ),
      );
    });

    test(
        'FSSC1.09: GIVEN a light FlexSchemeSurfaceColors.from medium branding '
        'EXPECT equality with defined colors and same blend.', () {
      expect(
        FlexSchemeSurfaceColors.from(
          surfaceStyle: FlexSurface.medium,
        ),
        FlexSchemeSurfaceColors(
          surface:
              FlexColor.lightSurface.blend(FlexColor.materialLightPrimary, 1),
          background: FlexColor.lightBackground
              .blend(FlexColor.materialLightPrimary, 4),
          scaffoldBackground: FlexColor.lightScaffoldBackground
              .blend(FlexColor.materialLightPrimary, 0),
          dialogBackground:
              FlexColor.lightSurface.blend(FlexColor.materialLightPrimary, 1),
        ),
      );
    });

    test(
        'FSSC1.10: GIVEN a light FlexSchemeSurfaceColors.from strong branding '
        'EXPECT equality with defined colors and same blend.', () {
      expect(
        FlexSchemeSurfaceColors.from(
          surfaceStyle: FlexSurface.strong,
        ),
        FlexSchemeSurfaceColors(
          surface:
              FlexColor.lightSurface.blend(FlexColor.materialLightPrimary, 2),
          background: FlexColor.lightBackground
              .blend(FlexColor.materialLightPrimary, 6),
          scaffoldBackground: FlexColor.lightScaffoldBackground
              .blend(FlexColor.materialLightPrimary, 0),
          dialogBackground:
              FlexColor.lightSurface.blend(FlexColor.materialLightPrimary, 2),
        ),
      );
    });

    test(
        'FSSC1.11: GIVEN a light FlexSchemeSurfaceColors.from heavy branding '
        'EXPECT equality with defined colors and same blend.', () {
      expect(
        FlexSchemeSurfaceColors.from(
          surfaceStyle: FlexSurface.heavy,
        ),
        FlexSchemeSurfaceColors(
          surface:
              FlexColor.lightSurface.blend(FlexColor.materialLightPrimary, 3),
          background: FlexColor.lightBackground
              .blend(FlexColor.materialLightPrimary, 8),
          scaffoldBackground: FlexColor.lightScaffoldBackground
              .blend(FlexColor.materialLightPrimary, 1),
          dialogBackground:
              FlexColor.lightSurface.blend(FlexColor.materialLightPrimary, 3),
        ),
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
        FlexSchemeSurfaceColors(
          surface:
              FlexColor.darkSurface.blend(FlexColor.materialDarkPrimary, 2),
          background:
              FlexColor.darkBackground.blend(FlexColor.materialDarkPrimary, 5),
          scaffoldBackground: FlexColor.darkScaffoldBackground
              .blend(FlexColor.materialDarkPrimary, 0),
          dialogBackground:
              FlexColor.darkSurface.blend(FlexColor.materialDarkPrimary, 2),
        ),
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
        FlexSchemeSurfaceColors(
          surface:
              FlexColor.darkSurface.blend(FlexColor.materialDarkPrimary, 4),
          background:
              FlexColor.darkBackground.blend(FlexColor.materialDarkPrimary, 8),
          scaffoldBackground: FlexColor.darkScaffoldBackground
              .blend(FlexColor.materialDarkPrimary, 0),
          dialogBackground:
              FlexColor.darkSurface.blend(FlexColor.materialDarkPrimary, 4),
        ),
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
        FlexSchemeSurfaceColors(
          surface:
              FlexColor.darkSurface.blend(FlexColor.materialDarkPrimary, 6),
          background:
              FlexColor.darkBackground.blend(FlexColor.materialDarkPrimary, 11),
          scaffoldBackground: FlexColor.darkScaffoldBackground
              .blend(FlexColor.materialDarkPrimary, 0),
          dialogBackground:
              FlexColor.darkSurface.blend(FlexColor.materialDarkPrimary, 6),
        ),
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
        FlexSchemeSurfaceColors(
          surface:
              FlexColor.darkSurface.blend(FlexColor.materialDarkPrimary, 8),
          background:
              FlexColor.darkBackground.blend(FlexColor.materialDarkPrimary, 14),
          scaffoldBackground: FlexColor.darkScaffoldBackground
              .blend(FlexColor.materialDarkPrimary, 2),
          dialogBackground:
              FlexColor.darkSurface.blend(FlexColor.materialDarkPrimary, 8),
        ),
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
      expect(m1.toString(), equalsIgnoringHashCodes(
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

    test(
        'FSSC1.16: GIVEN a light FlexSchemeSurfaceColors.blend created object '
        'EXPECT equality when made by matching light defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(),
        const FlexSchemeSurfaceColors(
          surface: FlexColor.materialLightSurface,
          background: FlexColor.materialLightBackground,
          scaffoldBackground: FlexColor.materialLightScaffoldBackground,
          dialogBackground: FlexColor.materialLightSurface,
        ),
      );
    });
    test(
        'FSSC1.17: GIVEN a light FlexSchemeSurfaceColors.blend( '
        'brightness: Brightness.dark) created object '
        'EXPECT equality when made by matching dark defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.blend(brightness: Brightness.dark),
        const FlexSchemeSurfaceColors(
          surface: FlexColor.materialDarkSurface,
          background: FlexColor.materialDarkBackground,
          scaffoldBackground: FlexColor.materialDarkScaffoldBackground,
          dialogBackground: FlexColor.materialDarkSurface,
        ),
      );
    });
    // TODO(rydmike): More validation tests for FlexSchemeSurfaceColors.blend
  });
}
