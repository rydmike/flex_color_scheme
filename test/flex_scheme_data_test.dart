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
        'FSD1.01: GIVEN two identical FlexSchemeData objects '
        'EXPECT them to have equality', () {
      expect(m1, m2);
    });
    test(
        'FSD1.02: GIVEN none identical FlexSchemeData objects '
        'EXPECT them to be unequal', () {
      expect(m1, isNot(m3));
    });
    //**************************************************************************
    // FlexSchemeData unit tests.
    //
    // Key Material color scheme retrieval from maps and list.
    //**************************************************************************
    test(
        'FSD1.03: GIVEN FlexSchemeData object with default Material scheme '
        'EXPECT to find it in FlexColor.schemes[FlexScheme.material]', () {
      expect(m1, FlexColor.schemes[FlexScheme.material]);
    });
    test(
        'FSD1.04: GIVEN FlexSchemeData object with default Material scheme '
        'EXPECT to find it in '
        'FlexColor.schemesWithCustom[FlexScheme.material]', () {
      expect(m1, FlexColor.schemesWithCustom[FlexScheme.material]);
    });
    test(
        'FSD1.05: GIVEN FlexSchemeData object with default Material scheme '
        'EXPECT to find it in FlexColor.schemesList[0]', () {
      expect(m1, FlexColor.schemesList[0]);
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
      expect(mHc, FlexColor.schemes[FlexScheme.materialHc]);
    });
    test(
        'FSD1.07: GIVEN FlexSchemeData object with default Material Hc scheme '
        'EXPECT to find it in '
        'FlexColor.schemesWithCustom[FlexScheme.materialHc]', () {
      expect(mHc, FlexColor.schemesWithCustom[FlexScheme.materialHc]);
    });
    test(
        'FSD1.08: GIVEN FlexSchemeData object with default Material Hc scheme '
        'EXPECT to find it in FlexColor.schemesList[1]', () {
      expect(mHc, FlexColor.schemesList[1]);
    });
    //**************************************************************************
    // FlexSchemeData unit tests.
    //
    // Basic copyWith test.
    //**************************************************************************
    test(
        'FSD1.09: GIVEN a FlexSchemeData object EXPECT it to be equal to '
        'an unequal object made equal with copyWith.', () {
      expect(
          m1,
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
          ));
    });
  });
}
