import 'dart:ui';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

void main() {
  //****************************************************************************
  // FlexCorePalette unit tests.
  //
  // Basic object tests, equality, none equal.
  //****************************************************************************
  group('FCP1: WITH FlexCorePalette ', () {
    // m1, is tonal palettes using FlexCorePalette.fromSeeds with one color
    // and default parameters.
    final FlexCorePalette m1 = FlexCorePalette.fromSeeds(
      primary: const Color(0xFF6750A4).value,
    );
    // m2, makes tonal palette using CorePalette.of
    final CorePalette m2 = CorePalette.of(const Color(0xFF6750A4).value);
    // Do identity tests
    // debugPrint(m1.toString());
    test(
        'FCP1.01: GIVEN same FlexCorePalette.fromSeeds default and '
        'CorePalette.of using same input color '
        'EXPECT primary palette lists to be equal', () {
      expect(
        m1.primary.asList,
        equals(m2.primary.asList),
      );
    });
    test(
        'FCP1.02: GIVEN same FlexCorePalette.fromSeeds default and '
        'CorePalette.of using same input color '
        'EXPECT secondary palette lists to be equal', () {
      expect(
        m1.secondary.asList,
        equals(m2.secondary.asList),
      );
    });
    test(
        'FCP1.03: GIVEN same FlexCorePalette.fromSeeds default and '
        'CorePalette.of using same input color '
        'EXPECT tertiary palette lists to be equal', () {
      expect(
        m1.tertiary.asList,
        equals(m2.tertiary.asList),
      );
    });
    test(
        'FCP1.04: GIVEN same FlexCorePalette.fromSeeds default and '
        'CorePalette.of using same input color '
        'EXPECT error palette lists to be equal', () {
      expect(
        m1.error.asList,
        equals(m2.error.asList),
      );
    });
    test(
        'FCP1.05: GIVEN same FlexCorePalette.fromSeeds default and '
        'CorePalette.of using same input color '
        'EXPECT neutral palette lists to be equal', () {
      expect(
        m1.neutral.asList,
        equals(m2.neutral.asList),
      );
    });
    test(
        'FCP1.06: GIVEN same FlexCorePalette.fromSeeds default and '
        'CorePalette.of using same input color '
        'EXPECT neutralVariant palette lists to be equal', () {
      expect(
        m1.neutralVariant.asList,
        equals(m2.neutralVariant.asList),
      );
    });

    // Use 3 input values
    final FlexCorePalette m3 = FlexCorePalette.fromSeeds(
      primary: const Color(0xFF6750A4).value,
      secondary: const Color(0xFF625B71).value,
      tertiary: const Color(0xFF7D5260).value,
    );
    test(
        'FCP1.07: GIVEN FlexCorePalette.fromSeeds with 3 colors and defaults '
        'EXPECT a give result', () {
      expect(
        m3.asList(),
        <int>[
          4278190080,
          4280418397,
          4281867891,
          4283381643,
          4284960932,
          4286605759,
          4288316123,
          4290158072,
          4291869951,
          4293582335,
          4294372863,
          4294966270,
          4294967295,
          4278190080,
          4280162603,
          4281544001,
          4283057240,
          4284636017,
          4286280842,
          4287991204,
          4289767360,
          4291609564,
          4293451512,
          4294438399,
          4294966269,
          4294967295,
          4278190080,
          4281405469,
          4282983730,
          4284693320,
          4286403168,
          4288244345,
          4290020242,
          4291993005,
          4293900488,
          4294957284,
          4294962417,
          4294769916,
          4294967295,
          4278190080,
          4280032030,
          4281413683,
          4282926665,
          4284505442,
          4286150266,
          4287860628,
          4289637038,
          4291478986,
          4293321189,
          4294242292,
          4294966270,
          4294967295,
          4278190080,
          4280097314,
          4281478968,
          4282991951,
          4284570983,
          4286150015,
          4287926169,
          4289702324,
          4291478735,
          4293386476,
          4294307578,
          4294966270,
          4294967295
        ],
      );
    });

    // Use 3 input values and use chroma from secondary and tertiary
    final FlexCorePalette m4 = FlexCorePalette.fromSeeds(
      primary: const Color(0xFF6750A4).value,
      secondary: const Color(0xFF625B71).value,
      tertiary: const Color(0xFF7D5260).value,
      secondaryChroma: null,
      tertiaryChroma: null,
    );
    test(
        'FCP1.08: GIVEN FlexCorePalette.fromSeeds with 3 colors and using '
        'chroma from secondary and tertiary '
        'EXPECT a given result', () {
      expect(
        m4.asList(),
        <int>[
          4278190080,
          4280418397,
          4281867891,
          4283381643,
          4284960932,
          4286605759,
          4288316123,
          4290158072,
          4291869951,
          4293582335,
          4294372863,
          4294966270,
          4294967295,
          4278190080,
          4280162603,
          4281544001,
          4283057240,
          4284636017,
          4286280842,
          4287991204,
          4289767360,
          4291609564,
          4293451512,
          4294438399,
          4294966269,
          4294967295,
          4278190080,
          4281340189,
          4282983730,
          4284627784,
          4286403168,
          4288244345,
          4290020242,
          4291927725,
          4293834952,
          4294957284,
          4294962417,
          4294769916,
          4294967295,
          4278190080,
          4280032030,
          4281413683,
          4282926665,
          4284505442,
          4286150266,
          4287860628,
          4289637038,
          4291478986,
          4293321189,
          4294242292,
          4294966270,
          4294967295,
          4278190080,
          4280097314,
          4281478968,
          4282991951,
          4284570983,
          4286150015,
          4287926169,
          4289702324,
          4291478735,
          4293386476,
          4294307578,
          4294966270,
          4294967295
        ],
      );
    });
    //
  });
}
