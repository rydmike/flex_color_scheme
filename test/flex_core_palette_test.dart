import 'dart:ui';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  //
  //****************************************************************************
  // FlexTonalPalette unit tests.
  //****************************************************************************
  group('FTP1: WITH FlexTonalPalette ', () {
    test(
        'FTP1.U00: GIVEN the value of commonSize '
        'EXPECT it to be equal to commonTones.length', () {
      expect(
        FlexTonalPalette.commonSize,
        equals(FlexTonalPalette.commonTones.length),
      );
    });

    // m1, is tonal palettes using FlexTonalPalette.
    final FlexTonalPalette m1 = FlexTonalPalette.of(40, 55);
    final FlexTonalPalette m2 = FlexTonalPalette.of(40, 55);
    // m3, is tonal palettes using TonalPalette.
    final TonalPalette m3 = TonalPalette.of(40, 55);
    // m4, is tonal palette from list
    final FlexTonalPalette m4 = FlexTonalPalette.fromList(const <int>[
      4278190080,
      4280616704,
      4281798144,
      4284095488,
      4286524160,
      4288692500,
      4290795563,
      4292964674,
      4294937692,
      4294948249,
      4294958030,
      4294962663,
      4294965494,
      4294966271,
      4294967295,
    ]);
    // m5, is tonal palette from list, same as m4
    final FlexTonalPalette m5 = FlexTonalPalette.fromList(const <int>[
      4278190080,
      4280616704,
      4281798144,
      4284095488,
      4286524160,
      4288692500,
      4290795563,
      4292964674,
      4294937692,
      4294948249,
      4294958030,
      4294962663,
      4294965494,
      4294966271,
      4294967295,
    ]);

    test(
        'FTP1.U01a: GIVEN to identical FlexTonalPalette.of '
        'EXPECT them to be equal', () {
      expect(
        m1,
        equals(m2),
      );
    });
    test(
        'FTP1.U01b: GIVEN two identical FlexTonalPalette.of '
        'EXPECT them to have identity', () {
      expect(identical(m1, m1), true);
    });
    test(
        'FTP1.U01c: GIVEN to identical FlexTonalPalette.of '
        'EXPECT them to have equality with operator', () {
      expect(m1 == m2, true);
    });
    test('FTP1.U01d: Test lexTonalPalette.of hashCode has value.', () {
      expect(m1.hashCode, isNotNull);
    });
    test(
        'FTP1.U02a: GIVEN to identical FlexTonalPalette.fromList '
        'EXPECT them to be equal', () {
      expect(
        m4,
        equals(m5),
      );
    });
    test(
        'FTP1.U02b: GIVEN two identical FlexTonalPalette.fromList '
        'EXPECT them to have identity', () {
      expect(identical(m4, m4), true);
    });
    test(
        'FTP1.U02c: GIVEN to identical FlexTonalPalette.fromList '
        'EXPECT them to have equality with operator', () {
      expect(m4 == m5, true);
    });
    test('FTP1.U02d: Test lexTonalPalette.fromList hashCode has value.', () {
      expect(m4.hashCode, isNotNull);
    });
    test(
        'FTP1.U03: GIVEN to identical FlexTonalPalette '
        'EXPECT their asList to be equal', () {
      expect(
        m1.asList,
        equals(m2.asList),
      );
    });
    test(
        'FTP1.U04: GIVEN a FlexTonalPalette.of(40.0, 55.0) '
        'EXPECT its toString to be "FlexTonalPalette.of(40.0, 55.0)"', () {
      expect(
        m1.toString(),
        equals('FlexTonalPalette.of(40.0, 55.0, FlexPaletteType.common)'),
      );
    });
    test(
        'FTP1.U05: GIVEN same FlexTonalPalette.of and '
        'TonalPalette.of using same input color '
        'EXPECT palette lists to be equal without tone 5 and 98', () {
      // If we remove the tones 5 and 98 that MaterialColorUtilities
      // CorePalette.of does not include, our custom tones list should be equal.
      final List<int> m1List = m1.asList;
      final List<int> m1No5and98List = <int>[];
      for (int i = 0; i <= FlexTonalPalette.commonTones.length - 1; i++) {
        if (FlexTonalPalette.commonTones[i] != 5 &&
            FlexTonalPalette.commonTones[i] != 98) {
          m1No5and98List.add(m1List[i]);
        }
      }
      expect(
        m1No5and98List,
        equals(m3.asList),
      );
    });
    test(
        'FTP1.U06: GIVEN to FlexTonalPalette fromList '
        'EXPECT it to be equal to same created with FlexTonalPalette.of', () {
      expect(
        m1,
        equals(m4),
      );
    });
    test(
        'FCP1.U07: GIVEN a FlexTonalPalette.fromList '
        'EXPECT its toString to be "FlexTonalPalette.fromList(...)"', () {
      // ignore: lines_longer_than_80_chars
      expect(
        m4.toString(),
        equals(
            // ignore: lines_longer_than_80_chars
            'FlexTonalPalette.fromList({0: 4278190080, 5: 4280616704, 10: 4281798144, 20: 4284095488, 30: 4286524160, 40: 4288692500, 50: 4290795563, 60: 4292964674, 70: 4294937692, 80: 4294948249, 90: 4294958030, 95: 4294962663, 98: 4294965494, 99: 4294966271, 100: 4294967295}, FlexPaletteType.common)'),
      );
    });
    test(
        'FTP1.U08: GIVEN same FlexTonalPalette.of '
        'EXPECT each of its tones to match output asList via get', () {
      const List<int> m1List = <int>[
        4278190080,
        4280616704,
        4281798144,
        4284095488,
        4286524160,
        4288692500,
        4290795563,
        4292964674,
        4294937692,
        4294948249,
        4294958030,
        4294962663,
        4294965494,
        4294966271,
        4294967295,
      ];
      for (int i = 0; i <= FlexTonalPalette.commonTones.length - 1; i++) {
        expect(
          m1.get(FlexTonalPalette.commonTones[i]),
          equals(m1List[i]),
        );
      }
    });
    test(
        'FTP1.U09: GIVEN same FlexTonalPalette.fromList '
        'EXPECT each of its tones to match output asList via get', () {
      const List<int> m5List = <int>[
        4278190080,
        4280616704,
        4281798144,
        4284095488,
        4286524160,
        4288692500,
        4290795563,
        4292964674,
        4294937692,
        4294948249,
        4294958030,
        4294962663,
        4294965494,
        4294966271,
        4294967295,
      ];
      for (int i = 0; i <= FlexTonalPalette.commonTones.length - 1; i++) {
        expect(
          m5.get(FlexTonalPalette.commonTones[i]),
          equals(m5List[i]),
        );
      }
    });
    test(
        'FTP1.U10: GIVEN a FlexTonalPalette.fromList '
        'EXPECT accessing none existing to tone to throw argument error', () {
      expect(
        () => m5.get(7),
        throwsArgumentError,
      );
    });
  });
  //
  //****************************************************************************
  // FlexCorePalette unit tests.
  //****************************************************************************
  group('FCP1: WITH FlexCorePalette ', () {
    // m1, is tonal palettes using FlexCorePalette.fromSeeds with one color
    // and M3 based defaults.
    final FlexCorePalette m1 = FlexCorePalette.fromSeeds(
      primary: const Color(0xFF6750A4).value,
      secondaryChroma: 16,
      tertiaryChroma: 24,
    );
    // m2, makes tonal palette using CorePalette.of
    final CorePalette m2 = CorePalette.of(const Color(0xFF6750A4).value);
    // Do identity tests
    test(
        'FCP1.01: GIVEN same FlexCorePalette.fromSeeds default and '
        'CorePalette.of using same input color '
        'EXPECT primary palette lists to be equal', () {
      // If we remove the tones 5 and 98 that MaterialColorUtilities
      // CorePalette.of does not include, our custom tones list should be equal.
      final List<int> m1List = m1.primary.asList;
      final List<int> m1No5and98List = <int>[];
      for (int i = 0; i <= FlexTonalPalette.commonTones.length - 1; i++) {
        if (FlexTonalPalette.commonTones[i] != 5 &&
            FlexTonalPalette.commonTones[i] != 98) {
          m1No5and98List.add(m1List[i]);
        }
      }
      expect(
        m1No5and98List,
        equals(m2.primary.asList),
      );
    });
    test(
        'FCP1.02: GIVEN same FlexCorePalette.fromSeeds default and '
        'CorePalette.of using same input color '
        'EXPECT secondary palette lists to be equal', () {
      // If we remove the tones 5 and 98 that MaterialColorUtilities
      // CorePalette.of does not include, our custom tones list should be equal.
      final List<int> m1List = m1.secondary.asList;
      final List<int> m1No5and98List = <int>[];
      for (int i = 0; i <= FlexTonalPalette.commonTones.length - 1; i++) {
        if (FlexTonalPalette.commonTones[i] != 5 &&
            FlexTonalPalette.commonTones[i] != 98) {
          m1No5and98List.add(m1List[i]);
        }
      }
      expect(
        m1No5and98List,
        equals(m2.secondary.asList),
      );
    });
    test(
        'FCP1.03: GIVEN same FlexCorePalette.fromSeeds default and '
        'CorePalette.of using same input color '
        'EXPECT tertiary palette lists to be equal', () {
      // If we remove the tones 5 and 98 that MaterialColorUtilities
      // CorePalette.of does not include, our custom tones list should be equal.
      final List<int> m1List = m1.tertiary.asList;
      final List<int> m1No5and98List = <int>[];
      for (int i = 0; i <= FlexTonalPalette.commonTones.length - 1; i++) {
        if (FlexTonalPalette.commonTones[i] != 5 &&
            FlexTonalPalette.commonTones[i] != 98) {
          m1No5and98List.add(m1List[i]);
        }
      }
      expect(
        m1No5and98List,
        equals(m2.tertiary.asList),
      );
    });
    test(
        'FCP1.04: GIVEN same FlexCorePalette.fromSeeds default and '
        'CorePalette.of using same input color '
        'EXPECT error palette lists to be equal', () {
      // If we remove the tones 5 and 98 that MaterialColorUtilities
      // CorePalette.of does not include, our custom tones list should be equal.
      final List<int> m1List = m1.error.asList;
      final List<int> m1No5and98List = <int>[];
      for (int i = 0; i <= FlexTonalPalette.commonTones.length - 1; i++) {
        if (FlexTonalPalette.commonTones[i] != 5 &&
            FlexTonalPalette.commonTones[i] != 98) {
          m1No5and98List.add(m1List[i]);
        }
      }
      expect(
        m1No5and98List,
        equals(m2.error.asList),
      );
    });
    test(
        'FCP1.05: GIVEN same FlexCorePalette.fromSeeds default and '
        'CorePalette.of using same input color '
        'EXPECT neutral palette lists to be equal', () {
      // If we remove the tones 5 and 98 that MaterialColorUtilities
      // CorePalette.of does not include, our custom tones list should be equal.
      final List<int> m1List = m1.neutral.asList;
      final List<int> m1No5and98List = <int>[];
      for (int i = 0; i <= FlexTonalPalette.commonTones.length - 1; i++) {
        if (FlexTonalPalette.commonTones[i] != 5 &&
            FlexTonalPalette.commonTones[i] != 98) {
          m1No5and98List.add(m1List[i]);
        }
      }
      expect(
        m1No5and98List,
        equals(m2.neutral.asList),
      );
    });
    test(
        'FCP1.06: GIVEN same FlexCorePalette.fromSeeds default and '
        'CorePalette.of using same input color '
        'EXPECT neutralVariant palette lists to be equal', () {
      // If we remove the tones 5 and 98 that MaterialColorUtilities
      // CorePalette.of does not include, our custom tones list should be equal.
      final List<int> m1List = m1.neutralVariant.asList;
      final List<int> m1No5and98List = <int>[];
      for (int i = 0; i <= FlexTonalPalette.commonTones.length - 1; i++) {
        if (FlexTonalPalette.commonTones[i] != 5 &&
            FlexTonalPalette.commonTones[i] != 98) {
          m1No5and98List.add(m1List[i]);
        }
      }
      expect(
        m1No5and98List,
        equals(m2.neutralVariant.asList),
      );
    });

    // Use 3 input values
    final FlexCorePalette m3 = FlexCorePalette.fromSeeds(
      primary: const Color(0xFF6750A4).value,
      secondary: const Color(0xFF625B71).value,
      tertiary: const Color(0xFF7D5260).value,
      secondaryChroma: 16,
      tertiaryChroma: 24,
    );
    test(
        'FCP1.07: GIVEN FlexCorePalette.fromSeeds with 3 colors and defaults '
        'EXPECT a given list result', () {
      expect(m3.asList(), <int>[
        4278190080,
        4279631937,
        4280418397,
        4281867890,
        4283381642,
        4284960932,
        4286605759,
        4288316379,
        4290158072,
        4291804415,
        4293516799,
        4294373119,
        4294834175,
        4294966271,
        4294967295,
        4278190080,
        4279438880,
        4280162603,
        4281544001,
        4283057240,
        4284636016,
        4286280842,
        4287991204,
        4289767359,
        4291609307,
        4293451512,
        4294372863,
        4294899711,
        4294966271,
        4294967295,
        4278190080,
        4280550930,
        4281405469,
        4283049266,
        4284693320,
        4286468704,
        4288244345,
        4290085778,
        4291993005,
        4293900488,
        4294957539,
        4294962416,
        4294965496,
        4294966271,
        4294967295,
        4278190080,
        4279373844,
        4280032030,
        4281413683,
        4282926666,
        4284505442,
        4286150266,
        4287860628,
        4289637038,
        4291478986,
        4293321190,
        4294242292,
        4294834429,
        4294966271,
        4294967295,
        4278190080,
        4279373847,
        4280097314,
        4281478968,
        4282991950,
        4284570982,
        4286215551,
        4287926169,
        4289702324,
        4291478735,
        4293386475,
        4294307578,
        4294834175,
        4294966271,
        4294967295,
        4278190080,
        4281139201,
        4282449922,
        4285071365,
        4287823882,
        4290386458,
        4292753200,
        4294923337,
        4294936957,
        4294948011,
        4294957782,
        4294962666,
        4294965495,
        4294966271,
        4294967295,
      ]);
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
          4279631937,
          4280418397,
          4281867890,
          4283381642,
          4284960932,
          4286605759,
          4288316379,
          4290158072,
          4291804415,
          4293516799,
          4294373119,
          4294834175,
          4294966271,
          4294967295,
          4278190080,
          4279438880,
          4280162603,
          4281544001,
          4283056984,
          4284636017,
          4286280586,
          4287991205,
          4289767360,
          4291609308,
          4293451513,
          4294372863,
          4294899711,
          4294966271,
          4294967295,
          4278190080,
          4280550930,
          4281405725,
          4282983730,
          4284693320,
          4286403168,
          4288178809,
          4290020242,
          4291927469,
          4293834952,
          4294957539,
          4294962416,
          4294965496,
          4294966271,
          4294967295,
          4278190080,
          4279373844,
          4280032030,
          4281413683,
          4282926666,
          4284505442,
          4286150266,
          4287860628,
          4289637038,
          4291478986,
          4293321190,
          4294242292,
          4294834429,
          4294966271,
          4294967295,
          4278190080,
          4279373847,
          4280097314,
          4281478968,
          4282991950,
          4284570982,
          4286215551,
          4287926169,
          4289702324,
          4291478735,
          4293386475,
          4294307578,
          4294834175,
          4294966271,
          4294967295,
          4278190080,
          4281139201,
          4282449922,
          4285071365,
          4287823882,
          4290386458,
          4292753200,
          4294923337,
          4294936957,
          4294948011,
          4294957782,
          4294962666,
          4294965495,
          4294966271,
          4294967295,
        ],
      );
    });
    // m5, is tonal palettes using FlexCorePalette.fromSeeds with one color
    // and default parameters, equal to m1.
    final FlexCorePalette m5 = FlexCorePalette.fromSeeds(
      primary: const Color(0xFF6750A4).value,
      secondaryChroma: 16,
      tertiaryChroma: 24,
    );
    test(
        'FCP1.U01a: GIVEN two identical FlexCorePalette '
        'EXPECT them to be equal', () {
      expect(
        m1,
        equals(m5),
      );
    });
    test(
        'FCP1.U01b: GIVEN two identical FlexCorePalette '
        'EXPECT them to have identity', () {
      expect(identical(m1, m1), true);
    });
    test(
        'FCP1.U01c: GIVEN to identical FlexCorePalette '
        'EXPECT them to have equality with operator', () {
      expect(m1 == m5, true);
    });
    test('FCP1.U01c: Test hashCode has value.', () {
      expect(m1.hashCode, isNotNull);
    });
    test(
        'FCP1.U02: GIVEN to identical FlexCorePalette '
        'EXPECT their asList to be equal', () {
      expect(
        m1.asList(),
        equals(m5.asList()),
      );
    });
    test(
        'FCP1.U03: GIVEN to identical FlexCorePalette '
        'EXPECT their toString to be equal', () {
      expect(
        m1.toString(),
        equals(m5.toString()),
      );
    });
    test(
        'FCP1.U05: GIVEN FlexCorePalette.of() '
        'EXPECT it to be equal to same FlexCorePalette.fromSeed() ', () {
      expect(
        m1,
        equals(FlexCorePalette.of(const Color(0xFF6750A4).value)),
      );
    });
    test(
        'FCP1.U06: GIVEN FlexCorePalette.of() '
        'EXPECT it to be equal to same FlexCorePalette.fromHueChroma() ', () {
      expect(
        FlexCorePalette.fromHueChroma(40, 82),
        equals(
          FlexCorePalette(
            primary: FlexTonalPalette.of(40.0, 82.0),
            secondary: FlexTonalPalette.of(40.0, 16.0),
            tertiary: FlexTonalPalette.of(100.0, 24.0),
            neutral: FlexTonalPalette.of(40.0, 4.0),
            neutralVariant: FlexTonalPalette.of(40.0, 8.0),
          ),
        ),
      );
    });
    test(
        'FCP1.U07: GIVEN a FlexCorePalette from a List '
        'EXPECT it to be equal to one created from same seed Based one', () {
      expect(
        m3,
        equals(FlexCorePalette.fromList(const <int>[
          4278190080,
          4279631937,
          4280418397,
          4281867890,
          4283381642,
          4284960932,
          4286605759,
          4288316379,
          4290158072,
          4291804415,
          4293516799,
          4294373119,
          4294834175,
          4294966271,
          4294967295,
          4278190080,
          4279438880,
          4280162603,
          4281544001,
          4283057240,
          4284636016,
          4286280842,
          4287991204,
          4289767359,
          4291609307,
          4293451512,
          4294372863,
          4294899711,
          4294966271,
          4294967295,
          4278190080,
          4280550930,
          4281405469,
          4283049266,
          4284693320,
          4286468704,
          4288244345,
          4290085778,
          4291993005,
          4293900488,
          4294957539,
          4294962416,
          4294965496,
          4294966271,
          4294967295,
          4278190080,
          4279373844,
          4280032030,
          4281413683,
          4282926666,
          4284505442,
          4286150266,
          4287860628,
          4289637038,
          4291478986,
          4293321190,
          4294242292,
          4294834429,
          4294966271,
          4294967295,
          4278190080,
          4279373847,
          4280097314,
          4281478968,
          4282991950,
          4284570982,
          4286215551,
          4287926169,
          4289702324,
          4291478735,
          4293386475,
          4294307578,
          4294834175,
          4294966271,
          4294967295,
          4278190080,
          4281139201,
          4282449922,
          4285071365,
          4287823882,
          4290386458,
          4292753200,
          4294923337,
          4294936957,
          4294948011,
          4294957782,
          4294962666,
          4294965495,
          4294966271,
          4294967295,
        ])),
      );
    });
    //
  });
}
