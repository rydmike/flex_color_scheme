import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

void main() {
  //****************************************************************************
  // FlexColorScheme unit tests.
  //
  // Basic object tests, equality, none equal, copyWith.
  //
  // Additionally testing of the .defaultError and .toDark() methods.
  //****************************************************************************
  group('FSC1: WITH FlexSchemeColor ', () {
    // m1 = Basic flex scheme color with null accentColor.
    const FlexSchemeColor m1 = FlexSchemeColor(
      primary: FlexColor.materialLightPrimary,
      primaryVariant: FlexColor.materialLightPrimaryVariant,
      secondary: FlexColor.materialLightSecondary,
      secondaryVariant: FlexColor.materialLightSecondaryVariant,
      appBarColor: FlexColor.materialLightSecondaryVariant,
      error: FlexColor.materialLightError,
    );
    // m2, same definition as m1.
    const FlexSchemeColor m2 = FlexSchemeColor(
      primary: FlexColor.materialLightPrimary,
      primaryVariant: FlexColor.materialLightPrimaryVariant,
      secondary: FlexColor.materialLightSecondary,
      secondaryVariant: FlexColor.materialLightSecondaryVariant,
      appBarColor: FlexColor.materialLightSecondaryVariant,
      error: FlexColor.materialLightError,
    );
    // m3, different values than m1 and m2.
    const FlexSchemeColor m3 = FlexSchemeColor(
      primary: FlexColor.materialDarkPrimary,
      primaryVariant: FlexColor.materialDarkPrimaryVariant,
      secondary: FlexColor.materialDarkSecondary,
      secondaryVariant: FlexColor.materialDarkSecondaryVariant,
      appBarColor: FlexColor.materialDarkSecondaryVariant,
      error: FlexColor.materialDarkError,
    );
    // mFull, as m1 but with accentColor not null.
    const FlexSchemeColor mFull = FlexSchemeColor(
      primary: FlexColor.materialLightPrimary,
      primaryVariant: FlexColor.materialLightPrimaryVariant,
      secondary: FlexColor.materialLightSecondary,
      secondaryVariant: FlexColor.materialLightSecondaryVariant,
      appBarColor: FlexColor.materialLightSecondaryVariant,
      accentColor: FlexColor.materialLightPrimary,
      error: FlexColor.materialLightError,
    );
    // mFrom, create from just a primary color.
    final FlexSchemeColor mFrom = FlexSchemeColor.from(
      primary: FlexColor.materialLightPrimary,
    );
    test(
        'FSC1.01a: GIVEN two identical FlexSchemeColor objects '
        'EXPECT them to have equality', () {
      expect(m1, m2);
    });
    test(
        'FSC1.01b: GIVEN two identical FlexSchemeColor objects '
        'EXPECT them to have equality with operator', () {
      expect(m1 == m2, true);
    });
    test(
        'FSC1.02a: GIVEN none identical FlexSchemeColor objects '
        'EXPECT them to be unequal', () {
      expect(m1, isNot(m3));
    });
    test(
        'FSC1.02b: GIVEN none identical FlexSchemeColor objects '
        'EXPECT them to be unequal with operator', () {
      expect(m1 != m3, true);
    });
    test(
        'FSC1.03: GIVEN a FlexSchemeColor object EXPECT it to be equal to '
        'an unequal object when made equal with copyWith.', () {
      expect(
        m3.copyWith(
          primary: FlexColor.materialLightPrimary,
          primaryVariant: FlexColor.materialLightPrimaryVariant,
          secondary: FlexColor.materialLightSecondary,
          secondaryVariant: FlexColor.materialLightSecondaryVariant,
          appBarColor: FlexColor.materialLightSecondaryVariant,
          accentColor: FlexColor.materialLightPrimary,
          error: FlexColor.materialLightError,
        ),
        mFull,
      );
    });
    test(
        'FSC1.03: GIVEN a FlexSchemeColor object EXPECT it to be unchanged '
        'after an empty copyWith().', () {
      expect(m3.copyWith(), m3);
    });
    test(
        'FSC1.04: GIVEN FlexSchemeColor.from Material default light primary '
        'color EXPECT it to be equal to manually created version with same '
        'reference colors.', () {
      expect(
          mFrom,
          const FlexSchemeColor(
            primary: FlexColor.materialLightPrimary,
            primaryVariant: Color(0xff4d00bb),
            secondary: Color(0xff5800d5),
            secondaryVariant: Color(0xff4500a7),
            appBarColor: Color(0xff4500a7),
            accentColor: Color(0xff6200ee),
          ));
    });
    test(
        'FSC1.05: GIVEN a FlexSchemeColor with none null colors EXPECT '
        'its default toDark() to be equal to result from toDark(35).', () {
      expect(
          mFull.toDark(),
          // ignore: avoid_redundant_argument_values
          mFull.toDark(35));
    });
    test(
        'FSC1.06: GIVEN a FlexSchemeColor object with one null value  '
        'EXPECT its toDark() to be equal to result from toDark(35).', () {
      expect(
          m1.toDark(),
          // ignore: avoid_redundant_argument_values
          m1.toDark(35));
    });
    test(
        'FSC1.07: GIVEN a FlexSchemeColor with non null colors EXPECT its '
        'toDark(0) to be equal to original object', () {
      expect(mFull, mFull.toDark(0));
    });
    test(
        'FSC1.08: GIVEN a FlexSchemeColor with non null colors EXPECT its '
        'toDark(100) to be equal to FlexSchemeColor object with all '
        'white colors.', () {
      expect(
          mFull.toDark(100),
          mFull.copyWith(
            primary: Colors.white,
            primaryVariant: Colors.white,
            secondary: Colors.white,
            secondaryVariant: Colors.white,
            appBarColor: Colors.white,
            accentColor: Colors.white,
            error: Colors.white,
          ));
    });
    test(
        'FSC1.09: GIVEN a FlexSchemeColor with none null '
        'error color EXPECT its ".defaultError.toDark()" to be null.', () {
      expect(m1.defaultError.toDark().error, null);
    });
    test(
        'FSC1.10: GIVEN a FlexSchemeColor Material light based colors  '
        'EXPECT its toDark(40) error Color to be equal to '
        'FlexColor.materialDarkError.', () {
      // Note: This just works because it is how the Material design team
      // specified and computed the dark error color from their chosen light
      // error color used in the design guide. At the same time it verifies
      // that the here used "white blend" method is the one referred to in the
      // design guide.
      expect(m1.toDark(40).error, FlexColor.materialDarkError);
    });

    test(
        'FSC1.11: Test toString implemented via debugFillProperties '
        'EXPECT working data print.', () {
      expect(m1.toString().length, greaterThan(15));
    });
    test(
        'FSC1.12: Test toStringShort implemented via debugFillProperties '
        'EXPECT working data print.', () {
      expect(m1.toStringShort().length, greaterThan(10));
    });
    test('FSC1.13: Test hashCode.', () {
      expect(m1.hashCode, isNotNull);
    });
  });
}
