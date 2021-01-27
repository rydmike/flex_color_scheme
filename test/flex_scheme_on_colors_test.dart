import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

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
    // Start with null tests
    test(
        'FSOC1.00a: GIVEN a FlexSchemeOnColors with nulls '
        'EXPECT throws null assertion error.', () {
      expect(
          () => FlexSchemeOnColors(
                onPrimary: null,
                onSecondary: Colors.white,
                onSurface: Colors.white,
                onBackground: Colors.white,
                onError: Colors.white,
              ),
          throwsAssertionError);
    });
    test(
        'FSOC1.00b: GIVEN a FlexSchemeOnColors with nulls '
        'EXPECT throws null assertion error.', () {
      expect(
          () => FlexSchemeOnColors(
                onPrimary: Colors.white,
                onSecondary: null,
                onSurface: Colors.white,
                onBackground: Colors.white,
                onError: Colors.white,
              ),
          throwsAssertionError);
    });
    test(
        'FSOC1.00c: GIVEN a FlexSchemeOnColors with nulls '
        'EXPECT throws null assertion error.', () {
      expect(
          () => FlexSchemeOnColors(
                onPrimary: Colors.white,
                onSecondary: Colors.white,
                onSurface: null,
                onBackground: Colors.white,
                onError: Colors.white,
              ),
          throwsAssertionError);
    });
    test(
        'FSOC1.00d: GIVEN a FlexSchemeOnColors with nulls '
        'EXPECT throws null assertion error.', () {
      expect(
          () => FlexSchemeOnColors(
                onPrimary: Colors.white,
                onSecondary: Colors.white,
                onSurface: Colors.white,
                onBackground: null,
                onError: Colors.white,
              ),
          throwsAssertionError);
    });
    test(
        'FSOC1.00e: GIVEN a FlexSchemeOnColors with nulls '
        'EXPECT throws null assertion error.', () {
      expect(
          () => FlexSchemeOnColors(
                onPrimary: Colors.white,
                onSecondary: Colors.white,
                onSurface: Colors.white,
                onBackground: Colors.white,
                onError: null,
              ),
          throwsAssertionError);
    });
    test(
        'FSOC1.00f: GIVEN a FlexSchemeOnColors.from with nulls '
        'EXPECT throws null assertion error.', () {
      expect(
          () => FlexSchemeOnColors.from(
                primary: null,
                secondary: Colors.white,
                surface: Colors.white,
                background: Colors.white,
                error: Colors.white,
              ),
          throwsAssertionError);
    });
    test(
        'FSOC1.00g: GIVEN a FlexSchemeOnColors.from with nulls '
        'EXPECT throws null assertion error.', () {
      expect(
          () => FlexSchemeOnColors.from(
                primary: Colors.white,
                secondary: null,
                surface: Colors.white,
                background: Colors.white,
                error: Colors.white,
              ),
          throwsAssertionError);
    });
    test(
        'FSOC1.00h: GIVEN a FlexSchemeOnColors.from with nulls '
        'EXPECT throws null assertion error.', () {
      expect(
          () => FlexSchemeOnColors.from(
                primary: Colors.white,
                secondary: Colors.white,
                surface: null,
                background: Colors.white,
                error: Colors.white,
              ),
          throwsAssertionError);
    });
    test(
        'FSOC1.00i: GIVEN a FlexSchemeOnColors.from with nulls '
        'EXPECT throws null assertion error.', () {
      expect(
          () => FlexSchemeOnColors.from(
                primary: Colors.white,
                secondary: Colors.white,
                surface: Colors.white,
                background: null,
                error: Colors.white,
              ),
          throwsAssertionError);
    });
    test(
        'FSOC1.00j: GIVEN a FlexSchemeOnColors.from with nulls '
        'EXPECT throws null assertion error.', () {
      expect(
          () => FlexSchemeOnColors.from(
                primary: Colors.white,
                secondary: Colors.white,
                surface: Colors.white,
                background: Colors.white,
                error: null,
              ),
          throwsAssertionError);
    });
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
    final FlexSchemeOnColors m5 = FlexSchemeOnColors.from(
      primary: FlexColor.materialLightPrimary,
      secondary: FlexColor.materialLightSecondary,
      surface: FlexColor.materialLightSurface,
      background: FlexColor.materialLightBackground,
      error: FlexColor.materialLightError,
    );
    final FlexSchemeOnColors m6 = FlexSchemeOnColors.from(
      primary: FlexColor.materialLightPrimary,
      secondary: FlexColor.materialLightSecondary,
      surface: FlexColor.materialLightSurface,
      background: FlexColor.materialLightBackground,
      error: FlexColor.materialLightError,
      onPrimary: const Color(0xFF121212),
      onSecondary: const Color(0xFFEEEEEE),
      onSurface: const Color(0xFFCCCCCC),
      onBackground: const Color(0xFFDDDDDD),
      onError: const Color(0xFFAAAAAA),
    );

    // Identity and quality tests
    test(
        'FSOC1.01a: GIVEN the same FlexSchemeOnColor object '
        'EXPECT them to have identity', () {
      expect(m1, equals(m1));
    });
    test(
        'FSOC1.01b: GIVEN two identical FlexSchemeOnColors objects '
        'EXPECT them to have equality', () {
      expect(m1, equals(m2));
    });
    test(
        'FSOC1.01c: GIVEN two identical FlexSchemeOnColors objects '
        'EXPECT them to have equality with operator', () {
      expect(m1 == m2, true);
    });
    test(
        'FSOC1.02a: GIVEN none identical FlexSchemeOnColors objects '
        'EXPECT them to be unequal', () {
      expect(m1, isNot(m3));
    });
    test(
        'FSOC1.02b: GIVEN none identical FlexSchemeOnColors objects '
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
    test(
        'FSOC1.04: GIVEN a FlexSchemeOnColors created from default Material '
        'light surface colors EXPECT correctly computed "onColors".', () {
      expect(
        m5,
        const FlexSchemeOnColors(
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onSurface: Colors.black,
          onBackground: Colors.black,
          onError: Colors.white,
        ),
      );
    });
    test(
        'FSOC1.05: GIVEN a FlexSchemeOnColors created from default Material '
        'surface colors with OnColors specified EXPECT provided onColors to '
        'be used.', () {
      expect(
        m6,
        const FlexSchemeOnColors(
          onPrimary: Color(0xFF121212),
          onSecondary: Color(0xFFEEEEEE),
          onSurface: Color(0xFFCCCCCC),
          onBackground: Color(0xFFDDDDDD),
          onError: Color(0xFFAAAAAA),
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
      expect(m1.toString(), equalsIgnoringHashCodes(
          // ignore: lines_longer_than_80_chars
          'FlexSchemeOnColors#00000(onPrimary: Color(0xffffffff), onSecondary: Color(0xffffffff), onSurface: Color(0xff000000), onBackground: Color(0xff000000), onError: Color(0xffffffff))'));
    });
    test(
        'FSOC1.07: Test toStringShort implemented via debugFillProperties '
        'EXPECT exact short printout string.', () {
      expect(m1.toStringShort(),
          equalsIgnoringHashCodes('FlexSchemeOnColors#00000'));
    });
    test('FSOC1.08a: Test hashCode has value.', () {
      expect(m1.hashCode, isNotNull);
    });
    // This happens to always equal now in tests, if it start failing, test
    // 08c is actually enough.
    test('FSOC1.08b: Test hashCode exact value.', () {
      expect(m1.hashCode, 440932933);
    });
    test('FSOC1.08c: Test hashCode copyWith has same exact value.', () {
      expect(m1.hashCode, equals(m1.copyWith().hashCode));
    });
  });
}
