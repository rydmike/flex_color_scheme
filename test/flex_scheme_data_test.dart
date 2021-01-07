import 'package:flutter_test/flutter_test.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

void main() {
  //****************************************************************************
  // FlexSchemeData unit tests.
  //
  // Basic object tests, equality, none equal.
  //****************************************************************************
  group('FSD1: WITH FlexSchemeData ', () {
    // m1, is the FlexSchemeData with Material standard scheme.
    const FlexSchemeData m1 = FlexSchemeData(
      name: FlexColor.materialName,
      description: FlexColor.materialDescription,
      light: FlexSchemeColor(
        primary: FlexColor.materialLightPrimary,
        primaryVariant: FlexColor.materialLightPrimaryVariant,
        secondary: FlexColor.materialLightSecondary,
        secondaryVariant: FlexColor.materialLightSecondaryVariant,
        appBarColor: FlexColor.materialLightSecondaryVariant,
        error: FlexColor.materialLightError,
      ),
      dark: FlexSchemeColor(
        primary: FlexColor.materialDarkPrimary,
        primaryVariant: FlexColor.materialDarkPrimaryVariant,
        secondary: FlexColor.materialDarkSecondary,
        secondaryVariant: FlexColor.materialDarkSecondaryVariant,
        appBarColor: FlexColor.materialDarkSecondaryVariant,
        error: FlexColor.materialDarkError,
      ),
    );
    // m2, has same definition as m2.
    const FlexSchemeData m2 = FlexSchemeData(
      name: FlexColor.materialName,
      description: FlexColor.materialDescription,
      light: FlexSchemeColor(
        primary: FlexColor.materialLightPrimary,
        primaryVariant: FlexColor.materialLightPrimaryVariant,
        secondary: FlexColor.materialLightSecondary,
        secondaryVariant: FlexColor.materialLightSecondaryVariant,
        appBarColor: FlexColor.materialLightSecondaryVariant,
        error: FlexColor.materialLightError,
      ),
      dark: FlexSchemeColor(
        primary: FlexColor.materialDarkPrimary,
        primaryVariant: FlexColor.materialDarkPrimaryVariant,
        secondary: FlexColor.materialDarkSecondary,
        secondaryVariant: FlexColor.materialDarkSecondaryVariant,
        appBarColor: FlexColor.materialDarkSecondaryVariant,
        error: FlexColor.materialDarkError,
      ),
    );
    const FlexSchemeData m3 = FlexSchemeData(
      name: FlexColor.materialHcName, // Different from m1 and m2!
      description: FlexColor.materialDescription,
      light: FlexSchemeColor(
        primary: FlexColor.materialLightPrimary,
        primaryVariant: FlexColor.materialLightPrimaryVariant,
        secondary: FlexColor.materialLightSecondary,
        secondaryVariant: FlexColor.materialLightSecondaryVariant,
        appBarColor: FlexColor.materialLightSecondaryVariant,
        error: FlexColor.materialLightError,
      ),
      dark: FlexSchemeColor(
        primary: FlexColor.materialDarkPrimary,
        primaryVariant: FlexColor.materialDarkPrimaryVariant,
        secondary: FlexColor.materialDarkSecondary,
        secondaryVariant: FlexColor.materialDarkSecondaryVariant,
        appBarColor: FlexColor.materialDarkSecondaryVariant,
        error: FlexColor.materialDarkError,
      ),
    );
    test(
        'FSD1.01a: GIVEN two identical FlexSchemeData objects '
        'EXPECT them to have equality', () {
      expect(m1, m2);
    });
    test(
        'FSD1.01b: GIVEN two identical FlexSchemeData objects '
        'EXPECT them to have equality with operator', () {
      expect(m1 == m2, true);
    });
    test(
        'FSD1.02a: GIVEN none identical FlexSchemeData objects '
        'EXPECT them to be unequal', () {
      expect(m1, isNot(m3));
    });
    test(
        'FSD1.02b: GIVEN none identical FlexSchemeData objects '
        'EXPECT them to be unequal with operator', () {
      expect(m1 != m3, true);
    });
    //**************************************************************************
    // FlexSchemeData unit tests.
    //
    // Key Material color scheme retrieval from maps and list.
    //**************************************************************************
    test(
        'FSD1.03: GIVEN FlexSchemeData object with default Material scheme '
        'EXPECT to find it in FlexColor.schemes[FlexScheme.material]', () {
      expect(FlexColor.schemes[FlexScheme.material], m1);
    });
    test(
        'FSD1.04: GIVEN FlexSchemeData object with default Material scheme '
        'EXPECT to find it in '
        'FlexColor.schemesWithCustom[FlexScheme.material]', () {
      expect(FlexColor.schemesWithCustom[FlexScheme.material], m1);
    });
    test(
        'FSD1.05: GIVEN FlexSchemeData object with default Material scheme '
        'EXPECT to find it in FlexColor.schemesList[0]', () {
      expect(FlexColor.schemesList[0], m1);
    });

    //**************************************************************************
    // FlexSchemeData unit tests.
    //
    // Key Material high contrast color scheme retrieval from maps and list.
    //**************************************************************************
    const FlexSchemeData mHc = FlexSchemeData(
      name: FlexColor.materialHcName,
      description: FlexColor.materialHcDescription,
      light: FlexSchemeColor(
        primary: FlexColor.materialLightPrimaryHc,
        primaryVariant: FlexColor.materialLightPrimaryVariantHc,
        secondary: FlexColor.materialLightSecondaryHc,
        secondaryVariant: FlexColor.materialLightSecondaryVariantHc,
        appBarColor: FlexColor.materialLightSecondaryVariantHc,
        error: FlexColor.materialLightErrorHc,
      ),
      dark: FlexSchemeColor(
        primary: FlexColor.materialDarkPrimaryHc,
        primaryVariant: FlexColor.materialDarkPrimaryVariantHc,
        secondary: FlexColor.materialDarkSecondaryHc,
        secondaryVariant: FlexColor.materialDarkSecondaryVariantHc,
        appBarColor: FlexColor.materialDarkSecondaryVariantHc,
        error: FlexColor.materialDarkErrorHc,
      ),
    );
    test(
        'FSD1.06: GIVEN FlexSchemeData object with default Material Hc scheme '
        'EXPECT to find it in FlexColor.schemes[FlexScheme.materialHc]', () {
      expect(FlexColor.schemes[FlexScheme.materialHc], mHc);
    });
    test(
        'FSD1.07: GIVEN FlexSchemeData object with default Material Hc scheme '
        'EXPECT to find it in '
        'FlexColor.schemesWithCustom[FlexScheme.materialHc]', () {
      expect(FlexColor.schemesWithCustom[FlexScheme.materialHc], mHc);
    });
    test(
        'FSD1.08: GIVEN FlexSchemeData object with default Material Hc scheme '
        'EXPECT to find it in FlexColor.schemesList[1]', () {
      expect(FlexColor.schemesList[1], mHc);
    });
    //**************************************************************************
    // FlexSchemeData unit tests.
    //
    // Basic copyWith test.
    //**************************************************************************
    test(
        'FSD1.09: GIVEN a FlexSchemeData object EXPECT it to be equal to '
        'an unequal object when made equal with copyWith.', () {
      expect(
        mHc.copyWith(
          name: FlexColor.materialName,
          description: FlexColor.materialDescription,
          light: const FlexSchemeColor(
            primary: FlexColor.materialLightPrimary,
            primaryVariant: FlexColor.materialLightPrimaryVariant,
            secondary: FlexColor.materialLightSecondary,
            secondaryVariant: FlexColor.materialLightSecondaryVariant,
            appBarColor: FlexColor.materialLightSecondaryVariant,
            error: FlexColor.materialLightError,
          ),
          dark: const FlexSchemeColor(
            primary: FlexColor.materialDarkPrimary,
            primaryVariant: FlexColor.materialDarkPrimaryVariant,
            secondary: FlexColor.materialDarkSecondary,
            secondaryVariant: FlexColor.materialDarkSecondaryVariant,
            appBarColor: FlexColor.materialDarkSecondaryVariant,
            error: FlexColor.materialDarkError,
          ),
        ),
        m1,
      );
    });
    test(
        'FSD1.10: Test toString implemented via debugFillProperties '
        'EXPECT working data print.', () {
      expect(m1.toString().length, greaterThan(15));
    });
    test(
        'FSD1.11: Test toStringShort implemented via debugFillProperties '
        'EXPECT working data print.', () {
      expect(m1.toStringShort().length, greaterThan(10));
    });
    test('FSD1.12: Test hashCode.', () {
      expect(m1.hashCode, isNotNull);
    });
  });
}
