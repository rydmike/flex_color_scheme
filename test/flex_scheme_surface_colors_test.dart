import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

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
      background: FlexColor.materialLightBackground,
      scaffoldBackground: FlexColor.materialLightScaffoldBackground,
    );
    // m2, same definition as m1.
    const FlexSchemeSurfaceColors m2 = FlexSchemeSurfaceColors(
      surface: FlexColor.materialLightSurface,
      background: FlexColor.materialLightBackground,
      scaffoldBackground: FlexColor.materialLightScaffoldBackground,
    );
    // m3, one different values than m1 and m2.
    const FlexSchemeSurfaceColors m3 = FlexSchemeSurfaceColors(
      surface: FlexColor.materialLightSurface,
      background: FlexColor.lightBackground, // Different from m1 and m2.
      scaffoldBackground: FlexColor.materialLightScaffoldBackground,
    );
    // m4, all values different from m1 and m2.
    const FlexSchemeSurfaceColors m4 = FlexSchemeSurfaceColors(
      surface: Color(0xFFEEEEEE),
      background: Color(0xFFCCCCCC),
      scaffoldBackground: Color(0xFFAAAAAA),
    );
    test(
        'FSSC1.01a: GIVEN two identical FlexSchemeSurfaceColors objects '
        'EXPECT them to have equality', () {
      expect(m1, m2);
    });
    test(
        'FSSC1.01b: GIVEN two identical FlexSchemeSurfaceColors objects '
        'EXPECT them to have equality with operator', () {
      expect(m1 == m2, true);
    });
    test(
        'FSSC1.02a: GIVEN none identical FlexSchemeSurfaceColors objects '
        'EXPECT them to be unequal', () {
      expect(m1, isNot(m3));
    });
    test(
        'FSSC1.02b: GIVEN none identical FlexSchemeSurfaceColors objects '
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
        ),
        m1,
      );
    });
    test(
        'FSSC1.03b: GIVEN a FlexSchemeSurfaceColors object EXPECT it to be '
        'unchanged after and empty copyWith.', () {
      expect(m4.copyWith(), m4);
    });
    test(
        'FSSC1.04: GIVEN a light FlexSchemeSurfaceColors.from created object '
        'EXPECT equality when made by matching light defined colors.', () {
      expect(
        FlexSchemeSurfaceColors.from(),
        const FlexSchemeSurfaceColors(
          surface: FlexColor.materialLightSurface,
          background: FlexColor.materialLightBackground,
          scaffoldBackground: FlexColor.materialLightScaffoldBackground,
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
        ),
      );
    });
    test(
        'FSSC1.07: GIVEN a FlexSchemeSurfaceColors.from created object '
        'and deprecated "themeSurface" EXPECT it to prevail '
        'over new "surfaceStyle".', () {
      expect(
        FlexSchemeSurfaceColors.from(
          surfaceStyle: FlexSurface.heavy,
          themeSurface: FlexSurface.material,
        ),
        const FlexSchemeSurfaceColors(
          surface: FlexColor.materialLightSurface,
          background: FlexColor.materialLightBackground,
          scaffoldBackground: FlexColor.materialLightScaffoldBackground,
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
        ),
      );
    });
    test(
        'FSSC1.16: Test toString implemented via debugFillProperties '
        'EXPECT working data print.', () {
      expect(
          m1.toString(),
          // ignore: lines_longer_than_80_chars
          'FlexSchemeSurfaceColors#4228a(surface: Color(0xffffffff), background: Color(0xffffffff), scaffoldBackground: Color(0xffffffff))');
    });
    test(
        'FSSC1.17: Test toStringShort implemented via debugFillProperties '
        'EXPECT working data print.', () {
      expect(m1.toStringShort(), 'FlexSchemeSurfaceColors#4228a');
    });
    test('FSSC1.18: Test hashCode.', () {
      expect(m1.hashCode, 107225738);
    });
  });
}
