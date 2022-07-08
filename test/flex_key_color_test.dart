import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  //****************************************************************************
  // FlexKeyColorSetup unit tests.
  //
  // Basic object tests, equality, none equal.
  //****************************************************************************
  group('FKCS1: WITH FlexKeyColorSetup ', () {
    // m1, is the FlexKeyColorSetup with Material standard scheme.
    const FlexKeyColors m1 = FlexKeyColors(
      useKeyColors: true,
      useSecondary: false,
      useTertiary: false,
      keepPrimary: false,
      keepSecondary: false,
      keepTertiary: false,
      keepPrimaryContainer: false,
      keepSecondaryContainer: false,
      keepTertiaryContainer: false,
    );
    // m2, has same definition as m1, but via default values
    const FlexKeyColors m2 = FlexKeyColors();
    // m3, has same definition as m1, but one value is different.
    const FlexKeyColors m3 = FlexKeyColors(
      useKeyColors: false, // <- different value
      useSecondary: false,
      useTertiary: false,
      keepPrimary: false,
      keepSecondary: false,
      keepTertiary: false,
      keepPrimaryContainer: false,
      keepSecondaryContainer: false,
      keepTertiaryContainer: false,
    );
    // m4, has all values different from m1
    const FlexKeyColors m4 = FlexKeyColors(
      useKeyColors: false,
      useSecondary: true,
      useTertiary: true,
      keepPrimary: true,
      keepSecondary: true,
      keepTertiary: true,
      keepPrimaryContainer: true,
      keepSecondaryContainer: true,
      keepTertiaryContainer: true,
    );
    // Do identity tests
    test(
        'FKCS1.01a: GIVEN same FlexKeyColorSetup objects '
        'EXPECT them to be equal', () {
      expect(m1, equals(m1));
    });
    test(
        'FKCS1.01b: GIVEN same FlexKeyColorSetup objects '
        'EXPECT them to have identity', () {
      expect(identical(m1, m1), true);
    });
    test(
        'FKCS1.01c: GIVEN two equal FlexKeyColorSetup objects '
        'EXPECT them to have equality', () {
      expect(m1, equals(m2));
    });
    test(
        'FKCS1.01d: GIVEN two equal FlexKeyColorSetup objects '
        'EXPECT them to have identity', () {
      expect(identical(m1, m2), true);
    });
    test(
        'FKCS1.01c: GIVEN two equal FlexKeyColorSetup objects '
        'EXPECT them to have equality with operator', () {
      expect(m1 == m2, true);
    });
    test(
        'FKCS1.02a: GIVEN none equal FlexKeyColorSetup objects '
        'EXPECT them to be unequal', () {
      expect(m1, isNot(m3));
    });
    test(
        'FKCS1.02b: GIVEN none equal FlexKeyColorSetup objects '
        'EXPECT them to be unequal with operator', () {
      expect(m1 != m3, true);
    });
    //**************************************************************************
    // FlexKeyColorSetup unit tests.
    //
    // Test .copyWith, full and null..
    //**************************************************************************
    test(
        'FKCS1.09a: GIVEN a FlexKeyColorSetup object EXPECT it to be equal to '
        'an unequal object when made equal with copyWith.', () {
      expect(
        m3.copyWith(
          useKeyColors: true,
        ),
        equals(m1),
      );
    });
    test(
        'FKCS1.09b: GIVEN a FlexKeyColorSetup object EXPECT it to be unchanged '
        'after and empty copyWith.', () {
      expect(
        m1.copyWith(),
        equals(m1),
      );
    });
    test(
        'FKCS1.09c: GIVEN a FlexKeyColorSetup with all different values '
        'EXPECT equal to an unequal one when made equal with copyWith.', () {
      expect(
        m4.copyWith(
          useKeyColors: true,
          useSecondary: false,
          useTertiary: false,
          keepPrimary: false,
          keepSecondary: false,
          keepTertiary: false,
          keepPrimaryContainer: false,
          keepSecondaryContainer: false,
          keepTertiaryContainer: false,
        ),
        equals(m1),
      );
    });

    //**************************************************************************
    // FlexKeyColorSetup unit tests.
    //
    // toString and hashcode.
    //**************************************************************************

    test(
        'FKCS1.10: Test toString implemented via debugFillProperties '
        'EXPECT exact print string value.', () {
      expect(
          m1.toString(),
          //
          equalsIgnoringHashCodes(
              // ignore: lines_longer_than_80_chars
              'FlexKeyColors#00000(useKeyColors: true, useSecondary: false, useTertiary: false, keepPrimary: false, keepSecondary: false, keepTertiary: false, keepPrimaryContainer: false, keepSecondaryContainer: false, keepTertiaryContainer: false)'));
    });
    test(
        'FKCS1.11: Test toStringShort implemented via debugFillProperties '
        'EXPECT exact short printout.', () {
      expect(
          m1.toStringShort(), equalsIgnoringHashCodes('FlexKeyColors#00000'));
    });
    test('FKCS1.12: Test hashCode has value.', () {
      expect(m1.hashCode, isNotNull);
    });
    test('FKCS1.13: Test hashCode copyWith has same exact value.', () {
      expect(m1.hashCode, equals(m1.copyWith().hashCode));
    });
  });
}
