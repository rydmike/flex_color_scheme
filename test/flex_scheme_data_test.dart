import 'package:flutter_test/flutter_test.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

void main() {
  //****************************************************************************
  // FlexSchemeData unit tests.
  //
  // Basic object tests, equality, none equal.
  //****************************************************************************
  group('FSD1: WITH FlexSchemeData ', () {
    // const FlexSchemeColor col = FlexSchemeColor(
    //   primary: FlexColor.materialLightPrimary,
    //   primaryVariant: FlexColor.materialLightPrimaryVariant,
    //   secondary: FlexColor.materialLightSecondary,
    //   secondaryVariant: FlexColor.materialLightSecondaryVariant,
    //   appBarColor: FlexColor.materialLightSecondaryVariant,
    //   error: FlexColor.materialLightError,
    // );
    // start with null tests.
    // test(
    //     'FSC1.00a: GIVEN a FlexSchemeData with nulls '
    //     'EXPECT throws null assertion error.', () {
    //   expect(
    //       () => FlexSchemeData(
    //           name: null, description: 'Desc', light: col, dark: col),
    //       throwsAssertionError);
    // });
    // test(
    //     'FSC1.00a: GIVEN a FlexSchemeData with nulls '
    //     'EXPECT throws null assertion error.', () {
    //   expect(
    //       () => FlexSchemeData(
    //           name: 'Name', description: null, light: col, dark: col),
    //       throwsAssertionError);
    // });
    // test(
    //     'FSC1.00a: GIVEN a FlexSchemeData with nulls '
    //     'EXPECT throws null assertion error.', () {
    //   expect(
    //       () => FlexSchemeData(
    //           name: 'Name', description: 'Desc', light: null, dark: col),
    //       throwsAssertionError);
    // });
    // test(
    //     'FSC1.00a: GIVEN a FlexSchemeData with nulls '
    //     'EXPECT throws null assertion error.', () {
    //   expect(
    //       () => FlexSchemeData(
    //           name: 'Name', description: 'Desc', light: col, dark: null),
    //       throwsAssertionError);
    // });
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

    // Do identity tests
    test(
        'FSD1.01a: GIVEN same FlexSchemeData objects '
        'EXPECT them to have identity', () {
      expect(m1, equals(m1));
    });
    test(
        'FSD1.01b: GIVEN two identical FlexSchemeData objects '
        'EXPECT them to have equality', () {
      expect(m1, equals(m2));
    });
    test(
        'FSD1.01c: GIVEN two identical FlexSchemeData objects '
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
    // Test .copyWith, full and null..
    //**************************************************************************
    test(
        'FSD1.09a: GIVEN a FlexSchemeData object EXPECT it to be equal to '
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
        'FSD1.09b: GIVEN a FlexSchemeData object EXPECT it to be unchanged '
        'after and empty copyWith.', () {
      expect(mHc.copyWith(), mHc);
    });

    //**************************************************************************
    // FlexSchemeData unit tests.
    //
    // toString and hashcode.
    //**************************************************************************

    test(
        'FSD1.11: Test toString implemented via debugFillProperties '
        'EXPECT exact print string value.', () {
      expect(m1.toString(), equalsIgnoringHashCodes(
          // ignore: lines_longer_than_80_chars
          'FlexSchemeData#00000(name: "Material default", description: "Default Material color theme, used in the design guide.", light: FlexSchemeColor#1b048(primary: Color(0xff6200ee), primaryVariant: Color(0xff3700b3), secondary: Color(0xff03dac6), secondaryVariant: Color(0xff018786), appBarColor: Color(0xff018786), accentColor: null, error: Color(0xffb00020)), dark: FlexSchemeColor#74195(primary: Color(0xffbb86fc), primaryVariant: Color(0xff3700b3), secondary: Color(0xff03dac6), secondaryVariant: Color(0xff03dac6), appBarColor: Color(0xff03dac6), accentColor: null, error: Color(0xffcf6679)))'));
    });
    test(
        'FSD1.12: Test toStringShort implemented via debugFillProperties '
        'EXPECT exact short printout.', () {
      expect(
          m1.toStringShort(), equalsIgnoringHashCodes('FlexSchemeData#00000'));
    });
    test('FSD1.13a: Test hashCode has value.', () {
      expect(m1.hashCode, isNotNull);
    });
    // This happens to always equal now in tests, if it start failing, test
    // 13c is actually enough.
    test('FSD1.13b: Test hashCode exact value.', () {
      expect(m1.hashCode, 411011308);
    });
    test('FSD1.13c: Test hashCode copyWith has same exact value.', () {
      expect(m1.hashCode, equals(m1.copyWith().hashCode));
    });
  });
}
