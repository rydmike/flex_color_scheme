import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter_test/flutter_test.dart';

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
        primaryContainer: FlexColor.materialLightPrimaryContainer,
        secondary: FlexColor.materialLightSecondary,
        secondaryContainer: FlexColor.materialLightSecondaryContainer,
        tertiary: FlexColor.materialLightTertiary,
        tertiaryContainer: FlexColor.materialLightTertiaryContainer,
        appBarColor: FlexColor.materialLightTertiary,
        error: FlexColor.materialLightError,
        swapOnMaterial3: true,
      ),
      dark: FlexSchemeColor(
        primary: FlexColor.materialDarkPrimary,
        primaryContainer: FlexColor.materialDarkPrimaryContainer,
        secondary: FlexColor.materialDarkSecondary,
        secondaryContainer: FlexColor.materialDarkSecondaryContainer,
        tertiary: FlexColor.materialDarkTertiary,
        tertiaryContainer: FlexColor.materialDarkTertiaryContainer,
        appBarColor: FlexColor.materialDarkTertiary,
        error: FlexColor.materialDarkError,
        swapOnMaterial3: true,
      ),
    );
    // m2, has same definition as m2.
    const FlexSchemeData m2 = FlexSchemeData(
      name: FlexColor.materialName,
      description: FlexColor.materialDescription,
      light: FlexSchemeColor(
        primary: FlexColor.materialLightPrimary,
        primaryContainer: FlexColor.materialLightPrimaryContainer,
        secondary: FlexColor.materialLightSecondary,
        secondaryContainer: FlexColor.materialLightSecondaryContainer,
        tertiary: FlexColor.materialLightTertiary,
        tertiaryContainer: FlexColor.materialLightTertiaryContainer,
        appBarColor: FlexColor.materialLightTertiary,
        error: FlexColor.materialLightError,
        swapOnMaterial3: true,
      ),
      dark: FlexSchemeColor(
        primary: FlexColor.materialDarkPrimary,
        primaryContainer: FlexColor.materialDarkPrimaryContainer,
        secondary: FlexColor.materialDarkSecondary,
        secondaryContainer: FlexColor.materialDarkSecondaryContainer,
        tertiary: FlexColor.materialDarkTertiary,
        tertiaryContainer: FlexColor.materialDarkTertiaryContainer,
        appBarColor: FlexColor.materialDarkTertiary,
        error: FlexColor.materialDarkError,
        swapOnMaterial3: true,
      ),
    );
    const FlexSchemeData m3 = FlexSchemeData(
      name: FlexColor.materialHcName, // <-- Different from m1 and m2!
      description: FlexColor.materialDescription,
      light: FlexSchemeColor(
        primary: FlexColor.materialLightPrimary,
        primaryContainer: FlexColor.materialLightPrimaryContainer,
        secondary: FlexColor.materialLightSecondary,
        secondaryContainer: FlexColor.materialLightSecondaryContainer,
        tertiary: FlexColor.materialLightTertiary,
        tertiaryContainer: FlexColor.materialLightTertiaryContainer,
        appBarColor: FlexColor.materialLightTertiary,
        error: FlexColor.materialLightError,
      ),
      dark: FlexSchemeColor(
        primary: FlexColor.materialDarkPrimary,
        primaryContainer: FlexColor.materialDarkPrimaryContainer,
        secondary: FlexColor.materialDarkSecondary,
        secondaryContainer: FlexColor.materialDarkSecondaryContainer,
        tertiary: FlexColor.materialDarkTertiary,
        tertiaryContainer: FlexColor.materialDarkTertiaryContainer,
        appBarColor: FlexColor.materialDarkTertiary,
        error: FlexColor.materialDarkError,
      ),
    );

    // Do identity tests
    test(
        'FSD1.01a: GIVEN same FlexSchemeData objects '
        'EXPECT them to be equal', () {
      expect(m1, equals(m1));
    });
    test(
        'FSD1.01b: GIVEN same FlexSchemeData objects '
        'EXPECT them to have identity', () {
      expect(identical(m1, m1), true);
    });
    test(
        'FSD1.01c: GIVEN two equal FlexSchemeData objects '
        'EXPECT them to have equality', () {
      expect(m1, equals(m2));
    });
    test(
        'FSD1.01d: GIVEN two equal FlexSchemeData objects '
        'EXPECT them to have identity', () {
      expect(identical(m1, m2), true);
    });
    test(
        'FSD1.01c: GIVEN two equal FlexSchemeData objects '
        'EXPECT them to have equality with operator', () {
      expect(m1 == m2, true);
    });
    test(
        'FSD1.02a: GIVEN none equal FlexSchemeData objects '
        'EXPECT them to be unequal', () {
      expect(m1, isNot(m3));
    });
    test(
        'FSD1.02b: GIVEN none equal FlexSchemeData objects '
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
        primaryContainer: FlexColor.materialLightPrimaryContainerHc,
        secondary: FlexColor.materialLightSecondaryHc,
        secondaryContainer: FlexColor.materialLightSecondaryContainerHc,
        tertiary: FlexColor.materialLightTertiaryHc,
        tertiaryContainer: FlexColor.materialLightTertiaryContainerHc,
        appBarColor: FlexColor.materialLightTertiaryHc,
        error: FlexColor.materialLightErrorHc,
        swapOnMaterial3: true,
      ),
      dark: FlexSchemeColor(
        primary: FlexColor.materialDarkPrimaryHc,
        primaryContainer: FlexColor.materialDarkPrimaryContainerHc,
        secondary: FlexColor.materialDarkSecondaryHc,
        secondaryContainer: FlexColor.materialDarkSecondaryContainerHc,
        tertiary: FlexColor.materialDarkTertiaryHc,
        tertiaryContainer: FlexColor.materialDarkTertiaryContainerHc,
        appBarColor: FlexColor.materialDarkTertiaryHc,
        error: FlexColor.materialDarkErrorHc,
        swapOnMaterial3: true,
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
            primaryContainer: FlexColor.materialLightPrimaryContainer,
            secondary: FlexColor.materialLightSecondary,
            secondaryContainer: FlexColor.materialLightSecondaryContainer,
            tertiary: FlexColor.materialLightTertiary,
            tertiaryContainer: FlexColor.materialLightTertiaryContainer,
            appBarColor: FlexColor.materialLightTertiary,
            error: FlexColor.materialLightError,
            swapOnMaterial3: true,
          ),
          dark: const FlexSchemeColor(
            primary: FlexColor.materialDarkPrimary,
            primaryContainer: FlexColor.materialDarkPrimaryContainer,
            secondary: FlexColor.materialDarkSecondary,
            secondaryContainer: FlexColor.materialDarkSecondaryContainer,
            tertiary: FlexColor.materialDarkTertiary,
            tertiaryContainer: FlexColor.materialDarkTertiaryContainer,
            appBarColor: FlexColor.materialDarkTertiary,
            error: FlexColor.materialDarkError,
            swapOnMaterial3: true,
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
      expect(
          m1.toString(),
          //
          equalsIgnoringHashCodes(
              // ignore: lines_longer_than_80_chars
              'FlexSchemeData#00000(name: "Material default", description: "Default Material 2 color theme, used in the design guide", light: FlexSchemeColor#00000(primary: Color(0xff6200ee), primaryContainer: Color(0xffbb86fc), secondary: Color(0xff03dac6), secondaryContainer: Color(0xffcefaf8), tertiary: Color(0xff018786), tertiaryContainer: Color(0xffa4f1ef), appBarColor: Color(0xff018786), error: Color(0xffb00020), errorContainer: null, swapOnMaterial3: true), dark: FlexSchemeColor#00000(primary: Color(0xffbb86fc), primaryContainer: Color(0xff6200ee), secondary: Color(0xff03dac6), secondaryContainer: Color(0xff005047), tertiary: Color(0xff03dac6), tertiaryContainer: Color(0xff003e3e), appBarColor: Color(0xff03dac6), error: Color(0xffcf6679), errorContainer: null, swapOnMaterial3: true))'));
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
    test('FSD1.13b: Test hashCode copyWith has same exact value.', () {
      expect(m1.hashCode, equals(m1.copyWith().hashCode));
    });
  });
}
