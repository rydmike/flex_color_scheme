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
        primaryLightRef: FlexColor.materialLightPrimary,
        secondary: FlexColor.materialLightSecondary,
        secondaryContainer: FlexColor.materialLightSecondaryContainer,
        secondaryLightRef: FlexColor.materialLightSecondary,
        tertiary: FlexColor.materialLightTertiary,
        tertiaryContainer: FlexColor.materialLightTertiaryContainer,
        tertiaryLightRef: FlexColor.materialLightTertiary,
        appBarColor: FlexColor.materialLightTertiary,
        error: FlexColor.materialLightError,
        swapOnMaterial3: true,
      ),
      dark: FlexSchemeColor(
        primary: FlexColor.materialDarkPrimary,
        primaryContainer: FlexColor.materialDarkPrimaryContainer,
        primaryLightRef: FlexColor.materialLightPrimary,
        secondary: FlexColor.materialDarkSecondary,
        secondaryContainer: FlexColor.materialDarkSecondaryContainer,
        secondaryLightRef: FlexColor.materialLightSecondary,
        tertiary: FlexColor.materialDarkTertiary,
        tertiaryContainer: FlexColor.materialDarkTertiaryContainer,
        tertiaryLightRef: FlexColor.materialLightTertiary,
        appBarColor: FlexColor.materialDarkTertiary,
        error: FlexColor.materialDarkError,
        swapOnMaterial3: true,
      ),
    );
    // m2, has same definition as m1.
    const FlexSchemeData m2 = FlexSchemeData(
      name: FlexColor.materialName,
      description: FlexColor.materialDescription,
      light: FlexSchemeColor(
        primary: FlexColor.materialLightPrimary,
        primaryContainer: FlexColor.materialLightPrimaryContainer,
        primaryLightRef: FlexColor.materialLightPrimary,
        secondary: FlexColor.materialLightSecondary,
        secondaryContainer: FlexColor.materialLightSecondaryContainer,
        secondaryLightRef: FlexColor.materialLightSecondary,
        tertiary: FlexColor.materialLightTertiary,
        tertiaryContainer: FlexColor.materialLightTertiaryContainer,
        tertiaryLightRef: FlexColor.materialLightTertiary,
        appBarColor: FlexColor.materialLightTertiary,
        error: FlexColor.materialLightError,
        swapOnMaterial3: true,
      ),
      dark: FlexSchemeColor(
        primary: FlexColor.materialDarkPrimary,
        primaryContainer: FlexColor.materialDarkPrimaryContainer,
        primaryLightRef: FlexColor.materialLightPrimary,
        secondary: FlexColor.materialDarkSecondary,
        secondaryContainer: FlexColor.materialDarkSecondaryContainer,
        secondaryLightRef: FlexColor.materialLightSecondary,
        tertiary: FlexColor.materialDarkTertiary,
        tertiaryContainer: FlexColor.materialDarkTertiaryContainer,
        tertiaryLightRef: FlexColor.materialLightTertiary,
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
        primaryLightRef: FlexColor.materialLightPrimary,
        secondary: FlexColor.materialLightSecondary,
        secondaryContainer: FlexColor.materialLightSecondaryContainer,
        secondaryLightRef: FlexColor.materialLightSecondary,
        tertiary: FlexColor.materialLightTertiary,
        tertiaryContainer: FlexColor.materialLightTertiaryContainer,
        tertiaryLightRef: FlexColor.materialLightTertiary,
        appBarColor: FlexColor.materialLightTertiary,
        error: FlexColor.materialLightError,
      ),
      dark: FlexSchemeColor(
        primary: FlexColor.materialDarkPrimary,
        primaryContainer: FlexColor.materialDarkPrimaryContainer,
        primaryLightRef: FlexColor.materialLightPrimary,
        secondary: FlexColor.materialDarkSecondary,
        secondaryContainer: FlexColor.materialDarkSecondaryContainer,
        secondaryLightRef: FlexColor.materialLightSecondary,
        tertiary: FlexColor.materialDarkTertiary,
        tertiaryContainer: FlexColor.materialDarkTertiaryContainer,
        tertiaryLightRef: FlexColor.materialLightTertiary,
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
        primaryLightRef: FlexColor.materialLightPrimaryHc,
        secondary: FlexColor.materialLightSecondaryHc,
        secondaryContainer: FlexColor.materialLightSecondaryContainerHc,
        secondaryLightRef: FlexColor.materialLightSecondaryHc,
        tertiary: FlexColor.materialLightTertiaryHc,
        tertiaryContainer: FlexColor.materialLightTertiaryContainerHc,
        tertiaryLightRef: FlexColor.materialLightTertiaryHc,
        appBarColor: FlexColor.materialLightTertiaryHc,
        error: FlexColor.materialLightErrorHc,
        swapOnMaterial3: true,
      ),
      dark: FlexSchemeColor(
        primary: FlexColor.materialDarkPrimaryHc,
        primaryContainer: FlexColor.materialDarkPrimaryContainerHc,
        primaryLightRef: FlexColor.materialLightPrimaryHc,
        secondary: FlexColor.materialDarkSecondaryHc,
        secondaryContainer: FlexColor.materialDarkSecondaryContainerHc,
        secondaryLightRef: FlexColor.materialLightSecondaryHc,
        tertiaryContainer: FlexColor.materialDarkTertiaryContainerHc,
        tertiaryLightRef: FlexColor.materialLightTertiaryHc,
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
            primaryLightRef: FlexColor.materialLightPrimary,
            secondary: FlexColor.materialLightSecondary,
            secondaryContainer: FlexColor.materialLightSecondaryContainer,
            secondaryLightRef: FlexColor.materialLightSecondary,
            tertiary: FlexColor.materialLightTertiary,
            tertiaryContainer: FlexColor.materialLightTertiaryContainer,
            tertiaryLightRef: FlexColor.materialLightTertiary,
            appBarColor: FlexColor.materialLightTertiary,
            error: FlexColor.materialLightError,
            swapOnMaterial3: true,
          ),
          dark: const FlexSchemeColor(
            primary: FlexColor.materialDarkPrimary,
            primaryContainer: FlexColor.materialDarkPrimaryContainer,
            primaryLightRef: FlexColor.materialLightPrimary,
            secondary: FlexColor.materialDarkSecondary,
            secondaryContainer: FlexColor.materialDarkSecondaryContainer,
            secondaryLightRef: FlexColor.materialLightSecondary,
            tertiary: FlexColor.materialDarkTertiary,
            tertiaryContainer: FlexColor.materialDarkTertiaryContainer,
            tertiaryLightRef: FlexColor.materialLightTertiary,
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
              // ignore: lines_longer_than_80_chars, for this test.
              'FlexSchemeData#bac4d(name: "Material 2 default", description: "Default Material 2 color theme, used in the design guide", light: FlexSchemeColor#9f525(primary: Color(alpha: 1.0000, red: 0.3843, green: 0.0000, blue: 0.9333, colorSpace: ColorSpace.sRGB), primaryContainer: Color(alpha: 1.0000, red: 0.7333, green: 0.5255, blue: 0.9882, colorSpace: ColorSpace.sRGB), primaryLightRef: Color(alpha: 1.0000, red: 0.3843, green: 0.0000, blue: 0.9333, colorSpace: ColorSpace.sRGB), secondary: Color(alpha: 1.0000, red: 0.0118, green: 0.8549, blue: 0.7765, colorSpace: ColorSpace.sRGB), secondaryContainer: Color(alpha: 1.0000, red: 0.8078, green: 0.9804, blue: 0.9725, colorSpace: ColorSpace.sRGB), secondaryLightRef: Color(alpha: 1.0000, red: 0.0118, green: 0.8549, blue: 0.7765, colorSpace: ColorSpace.sRGB), tertiary: Color(alpha: 1.0000, red: 0.0039, green: 0.5294, blue: 0.5255, colorSpace: ColorSpace.sRGB), tertiaryContainer: Color(alpha: 1.0000, red: 0.6431, green: 0.9451, blue: 0.9373, colorSpace: ColorSpace.sRGB), tertiaryLightRef: Color(alpha: 1.0000, red: 0.0039, green: 0.5294, blue: 0.5255, colorSpace: ColorSpace.sRGB), appBarColor: Color(alpha: 1.0000, red: 0.0039, green: 0.5294, blue: 0.5255, colorSpace: ColorSpace.sRGB), error: Color(alpha: 1.0000, red: 0.6902, green: 0.0000, blue: 0.1255, colorSpace: ColorSpace.sRGB), errorContainer: null, swapOnMaterial3: true), dark: FlexSchemeColor#f2690(primary: Color(alpha: 1.0000, red: 0.7333, green: 0.5255, blue: 0.9882, colorSpace: ColorSpace.sRGB), primaryContainer: Color(alpha: 1.0000, red: 0.3843, green: 0.0000, blue: 0.9333, colorSpace: ColorSpace.sRGB), primaryLightRef: Color(alpha: 1.0000, red: 0.3843, green: 0.0000, blue: 0.9333, colorSpace: ColorSpace.sRGB), secondary: Color(alpha: 1.0000, red: 0.0118, green: 0.8549, blue: 0.7765, colorSpace: ColorSpace.sRGB), secondaryContainer: Color(alpha: 1.0000, red: 0.0000, green: 0.3137, blue: 0.2784, colorSpace: ColorSpace.sRGB), secondaryLightRef: Color(alpha: 1.0000, red: 0.0118, green: 0.8549, blue: 0.7765, colorSpace: ColorSpace.sRGB), tertiary: Color(alpha: 1.0000, red: 0.0118, green: 0.8549, blue: 0.7765, colorSpace: ColorSpace.sRGB), tertiaryContainer: Color(alpha: 1.0000, red: 0.0000, green: 0.2431, blue: 0.2431, colorSpace: ColorSpace.sRGB), tertiaryLightRef: Color(alpha: 1.0000, red: 0.0039, green: 0.5294, blue: 0.5255, colorSpace: ColorSpace.sRGB), appBarColor: Color(alpha: 1.0000, red: 0.0118, green: 0.8549, blue: 0.7765, colorSpace: ColorSpace.sRGB), error: Color(alpha: 1.0000, red: 0.8118, green: 0.4000, blue: 0.4745, colorSpace: ColorSpace.sRGB), errorContainer: null, swapOnMaterial3: true))'));
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
