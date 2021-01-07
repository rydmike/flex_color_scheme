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
    test(
        'FSC1.01: GIVEN two identical FlexSchemeColor objects '
        'EXPECT them to have equality', () {
      expect(m1, m2);
    });
    test(
        'FSC1.02: GIVEN none identical FlexSchemeColor objects '
        'EXPECT them to be unequal', () {
      expect(m1, isNot(m3));
    });
    test(
        'FSC1.03: GIVEN a FlexSchemeColor object EXPECT it to be equal to '
        'an unequal object made equal with copyWith.', () {
      expect(
          mFull,
          m3.copyWith(
            primary: FlexColor.materialLightPrimary,
            primaryVariant: FlexColor.materialLightPrimaryVariant,
            secondary: FlexColor.materialLightSecondary,
            secondaryVariant: FlexColor.materialLightSecondaryVariant,
            appBarColor: FlexColor.materialLightSecondaryVariant,
            accentColor: FlexColor.materialLightPrimary,
            error: FlexColor.materialLightError,
          ));
    });
    test(
        'FSC1.04: GIVEN a FlexSchemeColor with none null colors EXPECT '
        'its default toDark() to be equal to result from toDark(35).', () {
      expect(
          mFull.toDark(),
          // ignore: avoid_redundant_argument_values
          mFull.toDark(35));
    });
    test(
        'FSC1.05: GIVEN a FlexSchemeColor object with one null value  '
        'EXPECT its toDark() to be equal to result from toDark(35).', () {
      expect(
          m1.toDark(),
          // ignore: avoid_redundant_argument_values
          m1.toDark(35));
    });
    test(
        'FSC1.06: GIVEN a FlexSchemeColor with non null colors EXPECT its '
        'toDark(0) to be equal to original object', () {
      expect(mFull, mFull.toDark(0));
    });
    test(
        'FSC1.07: GIVEN a FlexSchemeColor with non null colors EXPECT its '
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
        'FSC1.08: GIVEN a FlexSchemeColor with none null '
        'error color EXPECT its ".defaultError.toDark()" to be null.', () {
      expect(m1.defaultError.toDark().error, null);
    });
    test(
        'FSC1.09: GIVEN a FlexSchemeColor Material light based colors  '
        'EXPECT its toDark(40) error Color to be equal to '
        'FlexColor.materialDarkError.', () {
      // Note: This just works because it is how the Material design team
      // specified and computed the dark error color from their chosen light
      // error color used in the design guide. At the same time it verifies
      // that the here used "white blend" method is the one referred to in the
      // design guide.
      expect(m1.toDark(40).error, FlexColor.materialDarkError);
    });
  });
}
