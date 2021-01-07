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
    test(
        'FSOC1.01a: GIVEN two identical FlexSchemeOnColors objects '
        'EXPECT them to have equality', () {
      expect(m1, m2);
    });
    test(
        'FSOC1.01b: GIVEN two identical FlexSchemeOnColors objects '
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
    test(
        'FSOC1.06: Test toString implemented via debugFillProperties '
        'EXPECT working data print.', () {
      expect(
          m1.toString(),
          // ignore: lines_longer_than_80_chars
          'FlexSchemeOnColors#81a45(onPrimary: Color(0xffffffff), onSecondary: Color(0xffffffff), onSurface: Color(0xff000000), onBackground: Color(0xff000000), onError: Color(0xffffffff))');
    });
    test(
        'FSOC1.07: Test toStringShort implemented via debugFillProperties '
        'EXPECT working data print.', () {
      expect(m1.toStringShort(), 'FlexSchemeOnColors#81a45');
    });
    test('FSOC1.08: Test hashCode.', () {
      expect(m1.hashCode, 440932933);
    });
  });
}
