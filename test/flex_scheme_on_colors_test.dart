import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  //****************************************************************************
  // FlexSchemeOnColors unit tests.
  //
  // Basic object tests, equality, none equal, copyWith. Factory creation
  // same result as matching one with default constructor.
  // Also test that using FlexSchemeOnColors.from with onColor overrides
  // produces onColors using the override colors.
  //****************************************************************************
  group('FSOC1: WITH FlexSchemeOnColors ', () {
    // m1 = Typical light surface with saturated primary
    const FlexSchemeOnColors m1 = FlexSchemeOnColors(
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.black,
      onBackground: Colors.black,
      onError: Colors.white,
    );
    // m2, same definition as m1.
    const FlexSchemeOnColors m2 = FlexSchemeOnColors(
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.black,
      onBackground: Colors.black,
      onError: Colors.white,
    );
    // m3, one different values than m1 and m2.
    const FlexSchemeOnColors m3 = FlexSchemeOnColors(
      onPrimary: Colors.black, // Different from m1 and m2.
      onSecondary: Colors.white,
      onSurface: Colors.black,
      onBackground: Colors.black,
      onError: Colors.white,
    );
    // m4, all values different from m1 and m2.
    const FlexSchemeOnColors m4 = FlexSchemeOnColors(
      onPrimary: Colors.black,
      onSecondary: Colors.black,
      onSurface: Colors.white,
      onBackground: Colors.white,
      onError: Colors.black,
    );
    // Identity and quality tests
    test(
        'FSOC1.01a: GIVEN the same FlexSchemeOnColor object '
        'EXPECT them to be equal', () {
      expect(m1, equals(m1));
    });
    test(
        'FSOC1.01b: GIVEN the same FlexSchemeOnColor object '
        'EXPECT them to have identity', () {
      expect(identical(m1, m1), true);
    });
    test(
        'FSOC1.01c: GIVEN two equal FlexSchemeOnColors objects '
        'EXPECT them to be equal', () {
      expect(m1, equals(m2));
    });
    test(
        'FSOC1.01d: GIVEN two equal FlexSchemeOnColors objects '
        'EXPECT them to have identity', () {
      expect(identical(m1, m2), true);
    });
    test(
        'FSOC1.01e: GIVEN two equal FlexSchemeOnColors objects '
        'EXPECT them to have equality with operator', () {
      expect(m1 == m2, true);
    });
    test(
        'FSOC1.02a: GIVEN none equal FlexSchemeOnColors objects '
        'EXPECT them to be unequal', () {
      expect(m1, isNot(m3));
    });
    test(
        'FSOC1.02b: GIVEN none equal FlexSchemeOnColors objects '
        'EXPECT them to be unequal with operator', () {
      expect(m1 != m3, true);
    });
    test(
        'FSOC1.03a: GIVEN a FlexSchemeOnColors object EXPECT it to be '
        'equal to an unequal object when made equal with copyWith.', () {
      expect(
        m4.copyWith(
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.black,
          onBackground: Colors.black,
          onError: Colors.white,
        ),
        m1,
      );
    });
    test(
        'FSOC1.03b: GIVEN a FlexSchemeOnColors object EXPECT it to be '
        'unchanged after and empty copyWith.', () {
      expect(m4.copyWith(), m4);
    });

    final FlexSchemeOnColors m5 = FlexSchemeOnColors.from(
      primary: FlexColor.materialLightPrimary,
      secondary: FlexColor.materialLightSecondary,
      surface: FlexColor.materialLightSurface,
      background: FlexColor.materialLightBackground,
      error: FlexColor.materialLightError,
    );
    test(
        'FSOC1.04: GIVEN a FlexSchemeOnColors created from default Material '
        'light surface colors EXPECT correctly computed "onColors".', () {
      expect(
        m5,
        const FlexSchemeOnColors(
          onPrimary: Color(0xffffffff),
          onPrimaryContainer: null,
          onSecondary: Color(0xff000000),
          onSecondaryContainer: null,
          onTertiary: null,
          onTertiaryContainer: null,
          onSurface: Color(0xff000000),
          onSurfaceVariant: Color(0xff000000),
          onInverseSurface: Color(0xffffffff),
          onBackground: Color(0xff000000),
          onError: Color(0xffffffff),
          onErrorContainer: Color(0xffffffff),
        ),
      );
    });

    test(
        'FSOC1.04-all: GIVEN a FlexSchemeOnColors created from default '
        'Material light ALL colors '
        'EXPECT correctly computed "onColors".', () {
      expect(
        FlexSchemeOnColors.from(
          primary: FlexColor.materialLightPrimary,
          primaryContainer: FlexColor.materialLightPrimaryContainer,
          secondary: FlexColor.materialLightSecondary,
          secondaryContainer: FlexColor.materialLightSecondaryContainer,
          tertiary: FlexColor.materialLightTertiary,
          tertiaryContainer: FlexColor.materialLightTertiaryContainer,
          surface: FlexColor.materialLightSurface,
          surfaceVariant: FlexColor.materialLightSurface,
          inverseSurface: FlexColor.materialDarkSurface,
          background: FlexColor.materialLightBackground,
          error: FlexColor.materialLightError,
          errorContainer: FlexColor.materialLightError,
        ),
        const FlexSchemeOnColors(
          onPrimary: Color(0xffffffff),
          onPrimaryContainer: Color(0xff000000),
          onSecondary: Color(0xff000000),
          onSecondaryContainer: Color(0xff000000),
          onTertiary: Color(0xffffffff),
          onTertiaryContainer: Color(0xff000000),
          onSurface: Color(0xff000000),
          onSurfaceVariant: Color(0xff000000),
          onInverseSurface: Color(0xffffffff),
          onBackground: Color(0xff000000),
          onError: Color(0xffffffff),
          onErrorContainer: Color(0xffffffff),
        ),
      );
    });

    final FlexSchemeOnColors m6 = FlexSchemeOnColors.from(
      primary: FlexColor.materialLightPrimary,
      primaryContainer: FlexColor.materialLightPrimaryContainer,
      secondary: FlexColor.materialLightSecondary,
      secondaryContainer: FlexColor.materialLightSecondaryContainer,
      tertiary: FlexColor.materialLightTertiary,
      tertiaryContainer: FlexColor.materialLightTertiaryContainer,
      surface: FlexColor.materialLightSurface,
      surfaceVariant: FlexColor.materialLightSurface,
      inverseSurface: FlexColor.materialDarkSurface,
      background: FlexColor.materialLightBackground,
      error: FlexColor.materialLightError,
      errorContainer: FlexColor.materialLightError,
      onPrimary: const Color(0xFF121212),
      onPrimaryContainer: const Color(0xFF135212),
      onSecondary: const Color(0xFFE72EEE),
      onSecondaryContainer: const Color(0xFF2EE6EE),
      onTertiary: const Color(0xFF2EEE5E),
      onTertiaryContainer: const Color(0xFF8EE6E4),
      onSurface: const Color(0xFFCACCBC),
      onSurfaceVariant: const Color(0xFFFC38CC),
      onInverseSurface: const Color(0xFF6CC9CC),
      onBackground: const Color(0xFFDD77DD),
      onError: const Color(0xFFAA888A),
      onErrorContainer: const Color(0xFFAA346A),
    );

    test(
        'FSOC1.05a: GIVEN a FlexSchemeOnColors created from default Material '
        'surface colors with OnColors specified EXPECT provided onColors to '
        'be used.', () {
      expect(
        m6,
        const FlexSchemeOnColors(
          onPrimary: Color(0xFF121212),
          onPrimaryContainer: Color(0xFF135212),
          onSecondary: Color(0xFFE72EEE),
          onSecondaryContainer: Color(0xFF2EE6EE),
          onTertiary: Color(0xFF2EEE5E),
          onTertiaryContainer: Color(0xFF8EE6E4),
          onSurface: Color(0xFFCACCBC),
          onSurfaceVariant: Color(0xFFFC38CC),
          onInverseSurface: Color(0xFF6CC9CC),
          onBackground: Color(0xFFDD77DD),
          onError: Color(0xFFAA888A),
          onErrorContainer: Color(0xFFAA346A),
        ),
      );
    });

    final FlexSchemeOnColors m6b = FlexSchemeOnColors.from(
      primary: FlexColor.materialLightPrimary,
      primaryContainer: FlexColor.materialLightPrimary,
      secondary: FlexColor.materialLightSecondary,
      secondaryContainer: FlexColor.materialLightSecondary,
      tertiary: FlexColor.materialLightTertiary,
      tertiaryContainer: FlexColor.materialLightTertiary,
      surface: FlexColor.materialLightSurface,
      background: FlexColor.materialLightBackground,
      error: FlexColor.materialLightError,
      errorContainer: FlexColor.materialLightError,
      onPrimary: const Color(0xFF121212),
      onPrimaryContainer: const Color(0xFF132423),
      onSecondary: const Color(0xFFEEEEEE),
      onSecondaryContainer: const Color(0xFF888888),
      onTertiary: const Color(0xFFE45EEE),
      onTertiaryContainer: const Color(0xFF887788),
      onSurface: const Color(0xFFCCCCCC),
      onBackground: const Color(0xFFDDDDDD),
      onError: const Color(0xFFAAAAAA),
      onErrorContainer: const Color(0xFFAA346A),
    );

    test(
        'FSOC1.05b: GIVEN a FlexSchemeOnColors created from default Material '
        'surface colors with OnColors specified EXPECT provided onColors.', () {
      expect(
        m6b,
        const FlexSchemeOnColors(
          onPrimary: Color(0xff121212),
          onPrimaryContainer: Color(0xff132423),
          onSecondary: Color(0xffeeeeee),
          onSecondaryContainer: Color(0xff888888),
          onTertiary: Color(0xffe45eee),
          onTertiaryContainer: Color(0xff887788),
          onSurface: Color(0xffcccccc),
          onSurfaceVariant: Color(0xff000000),
          onInverseSurface: Color(0xffffffff),
          onBackground: Color(0xffdddddd),
          onError: Color(0xffaaaaaa),
          onErrorContainer: Color(0xFFAA346A),
        ),
      );
    });

    final FlexSchemeOnColors m7 = FlexSchemeOnColors.from(
      primary: FlexColor.materialLightPrimary,
      primaryContainer: FlexColor.materialLightPrimary,
      secondary: FlexColor.materialLightSecondary,
      secondaryContainer: FlexColor.materialLightSecondary,
      tertiary: FlexColor.materialLightTertiary,
      tertiaryContainer: FlexColor.materialLightTertiaryContainer,
      surface: FlexColor.materialLightSurface,
      surfaceVariant: FlexColor.materialLightSurface,
      inverseSurface: FlexColor.materialDarkSurface,
      background: FlexColor.materialLightBackground,
      error: FlexColor.materialLightError,
      errorContainer: FlexColor.materialLightError,
    );

    test(
        'FSOC1.05c: GIVEN a FlexSchemeOnColors created from default Material '
        'EXPECT correct contrast onColors.', () {
      expect(
        m7,
        const FlexSchemeOnColors(
          onPrimary: Color(0xffffffff),
          onPrimaryContainer: Color(0xffffffff),
          onSecondary: Color(0xff000000),
          onSecondaryContainer: Color(0xff000000),
          onTertiary: Color(0xffffffff),
          onTertiaryContainer: Color(0xff000000),
          onSurface: Color(0xff000000),
          onSurfaceVariant: Color(0xff000000),
          onInverseSurface: Color(0xffffffff),
          onBackground: Color(0xff000000),
          onError: Color(0xffffffff),
          onErrorContainer: Color(0xffffffff),
        ),
      );
    });

    final FlexSchemeOnColors m7a = FlexSchemeOnColors.from(
      primary: FlexColor.materialLightPrimary,
      primaryContainer: const Color(0xff000000),
      secondary: FlexColor.materialLightSecondary,
      secondaryContainer: const Color(0xffffffff),
      tertiary: const Color(0xff390303),
      tertiaryContainer: FlexColor.materialLightSecondary,
      surface: FlexColor.materialLightSurface,
      surfaceVariant: FlexColor.materialLightSurface,
      inverseSurface: FlexColor.materialDarkSurface,
      background: FlexColor.materialLightBackground,
      error: const Color(0xffedb4b4),
      errorContainer: const Color(0xff812424),
    );

    test(
        'FSOC1.05d: GIVEN a FlexSchemeOnColors created from given colors '
        'EXPECT correct contrast onColors.', () {
      expect(
        m7a,
        const FlexSchemeOnColors(
          onPrimary: Color(0xffffffff),
          onPrimaryContainer: Color(0xffffffff),
          onSecondary: Color(0xff000000),
          onSecondaryContainer: Color(0xff000000),
          onTertiary: Color(0xffffffff),
          onTertiaryContainer: Color(0xff000000),
          onSurface: Color(0xff000000),
          onSurfaceVariant: Color(0xff000000),
          onInverseSurface: Color(0xffffffff),
          onBackground: Color(0xff000000),
          onError: Color(0xff000000),
          onErrorContainer: Color(0xffffffff),
        ),
      );
    });

    //**************************************************************************
    // FlexSchemeOnColors unit tests.
    //
    // toString and hashcode.
    //**************************************************************************

    test(
        'FSOC1.06: Test toString implemented via debugFillProperties '
        'EXPECT exact print string.', () {
      expect(
          m7a.toString(),
          //
          equalsIgnoringHashCodes(
              // ignore: lines_longer_than_80_chars
              'FlexSchemeOnColors#00000(onPrimary: Color(0xffffffff), onPrimaryContainer: Color(0xffffffff), onSecondary: Color(0xff000000), onSecondaryContainer: Color(0xff000000), onTertiary: Color(0xffffffff), onTertiaryContainer: Color(0xff000000), onSurface: Color(0xff000000), onSurfaceVariant: Color(0xff000000), onInverseSurface: Color(0xffffffff), onBackground: Color(0xff000000), onError: Color(0xff000000), onErrorContainer: Color(0xffffffff))'));
    });
    test(
        'FSOC1.07: Test toStringShort implemented via debugFillProperties '
        'EXPECT exact short printout string.', () {
      expect(m7a.toStringShort(),
          equalsIgnoringHashCodes('FlexSchemeOnColors#00000'));
    });
    test('FSOC1.08a: Test hashCode has value.', () {
      expect(m7a.hashCode, isNotNull);
    });
    test('FSOC1.08b Test hashCode copyWith has same exact value.', () {
      expect(m7a.hashCode, equals(m7a.copyWith().hashCode));
    });
  });
}
