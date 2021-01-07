import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

//****************************************************************************
// These simple FlexColor unit test just monitors that the used color values
// for the standard material color schemes included in the SDK, match the ones
// defined in FlexColor. If either changes in the future, the tests will fail.
//****************************************************************************

void main() {
  //****************************************************************************
  // FlexColor unit tests - Color verification 1.
  //
  // Verify FlexColor material light color constant values match SDK values.
  //****************************************************************************
  group('FC1: WITH FlexColor material light colors ', () {
    // ml, is a reference SDK ColorScheme.light.
    const ColorScheme ml = ColorScheme.light();
    test(
        'FC1.01: GIVEN FlexColor is materialLightPrimary '
        'EXPECT color is ColorScheme.light().primary', () {
      expect(FlexColor.materialLightPrimary, ml.primary);
    });
    test(
        'FC1.02: GIVEN FlexColor is materialLightPrimaryVariant '
        'EXPECT color is ColorScheme.light().primaryVariant', () {
      expect(FlexColor.materialLightPrimaryVariant, ml.primaryVariant);
    });
    test(
        'FC1.03: GIVEN FlexColor is materialLightSecondary '
        'EXPECT color is ColorScheme.light().primary', () {
      expect(FlexColor.materialLightSecondary, ml.secondary);
    });
    test(
        'FC1.04: GIVEN FlexColor is materialLightSecondaryVariant '
        'EXPECT color is ColorScheme.light().primaryVariant', () {
      expect(FlexColor.materialLightSecondaryVariant, ml.secondaryVariant);
    });
    test(
        'FC1.05: GIVEN FlexColor is materialLightSurface '
        'EXPECT color is ColorScheme.light().surface', () {
      expect(FlexColor.materialLightSurface, ml.surface);
    });
    test(
        'FC1.06: GIVEN FlexColor is materialLightBackground '
        'EXPECT color is ColorScheme.light().background', () {
      expect(FlexColor.materialLightBackground, ml.background);
    });
    test(
        'FC1.07: GIVEN FlexColor is materialLightError '
        'EXPECT color is ColorScheme.light().error', () {
      expect(FlexColor.materialLightError, ml.error);
    });
  });

  //****************************************************************************
  // FlexColor unit tests - Color verification 2
  //
  // Verify FlexColor material dark color constant values match SDK values.
  //****************************************************************************
  group('FC2: WITH FlexColor material dark colors ', () {
    // md, is a reference SDK ColorScheme.dark.
    const ColorScheme md = ColorScheme.dark();
    test(
        'FC2.01: GIVEN FlexColor is materialDarkPrimary '
        'EXPECT color is ColorScheme.dark().primary', () {
      expect(FlexColor.materialDarkPrimary, md.primary);
    });
    test(
        'FC2.02: GIVEN FlexColor is materialDarkPrimaryVariant '
        'EXPECT color is ColorScheme.dark().primaryVariant', () {
      expect(FlexColor.materialDarkPrimaryVariant, md.primaryVariant);
    });
    test(
        'FC2.03: GIVEN FlexColor is materialDarkSecondary '
        'EXPECT color is ColorScheme.dark().primary', () {
      expect(FlexColor.materialDarkSecondary, md.secondary);
    });
    test(
        'FC2.04: GIVEN FlexColor is materialDarkSecondaryVariant '
        'EXPECT color is ColorScheme.dark().primaryVariant', () {
      expect(FlexColor.materialDarkSecondaryVariant, md.secondaryVariant);
    });
    test(
        'FC2.05: GIVEN FlexColor is materialDarkSurface '
        'EXPECT color is ColorScheme.dark().surface', () {
      expect(FlexColor.materialDarkSurface, md.surface);
    });
    test(
        'FC2.06: GIVEN FlexColor is materialDarkBackground '
        'EXPECT color is ColorScheme.dark().background', () {
      expect(FlexColor.materialDarkBackground, md.background);
    });
    test(
        'FC2.07: GIVEN FlexColor is materialDarkError '
        'EXPECT color is ColorScheme.dark().error', () {
      expect(FlexColor.materialDarkError, md.error);
    });
  });

  //****************************************************************************
  // FlexColor unit tests - Color verification 3
  //
  // Verify FlexColor material light high-contrast color constant
  // values match SDK values.
  //****************************************************************************
  group('FC3: WITH FlexColor material light high-contrast colors ', () {
    // ml, is a reference SDK ColorScheme.highContrastLight.
    const ColorScheme ml = ColorScheme.highContrastLight();
    test(
        'FC3.01: GIVEN FlexColor is materialLightPrimaryHc '
        'EXPECT color is ColorScheme.highContrastLight().primary', () {
      expect(FlexColor.materialLightPrimaryHc, ml.primary);
    });
    test(
        'FC3.02: GIVEN FlexColor is materialLightPrimaryVariantHc '
        'EXPECT color is ColorScheme.highContrastLight().primaryVariant', () {
      expect(FlexColor.materialLightPrimaryVariantHc, ml.primaryVariant);
    });
    test(
        'FC3.03: GIVEN FlexColor is materialLightSecondaryHc '
        'EXPECT color is ColorScheme.highContrastLight().primary', () {
      expect(FlexColor.materialLightSecondaryHc, ml.secondary);
    });
    test(
        'FC3.04: GIVEN FlexColor is materialLightSecondaryVariantHc '
        'EXPECT color is ColorScheme.highContrastLight().primaryVariant', () {
      expect(FlexColor.materialLightSecondaryVariantHc, ml.secondaryVariant);
    });
    test(
        'FC3.05: GIVEN FlexColor is materialLightSurface '
        'EXPECT color is ColorScheme.highContrastLight().surface', () {
      expect(FlexColor.materialLightSurface, ml.surface);
    });
    test(
        'FC3.06: GIVEN FlexColor is materialLightBackgroundHc '
        'EXPECT color is ColorScheme.highContrastLight().background', () {
      expect(FlexColor.materialLightBackground, ml.background);
    });
    test(
        'FC3.07: GIVEN FlexColor is materialLightErrorHc '
        'EXPECT color is ColorScheme.highContrastLight().error', () {
      expect(FlexColor.materialLightErrorHc, ml.error);
    });
  });

  //****************************************************************************
  // FlexColor unit tests - Color verification 4
  //
  // Verify FlexColor material dark high-contrast color constant
  // values match SDK values.
  //****************************************************************************
  group('FC4: WITH FlexColor material dark high-contrast colors', () {
    // md, is a reference SDK ColorScheme.highContrastDark.
    const ColorScheme md = ColorScheme.highContrastDark();
    test(
        'FC4.01: GIVEN FlexColor is materialDarkPrimaryHc '
        'EXPECT color is ColorScheme.highContrastDark().primary', () {
      expect(FlexColor.materialDarkPrimaryHc, md.primary);
    });
    test(
        'FC4.02: GIVEN FlexColor is materialDarkPrimaryVariantHc '
        'EXPECT color is ColorScheme.highContrastDark().primaryVariant', () {
      expect(FlexColor.materialDarkPrimaryVariantHc, md.primaryVariant);
    });
    test(
        'FC4.03: GIVEN FlexColor is materialDarkSecondaryHc '
        'EXPECT color is ColorScheme.highContrastDark().primary', () {
      expect(FlexColor.materialDarkSecondaryHc, md.secondary);
    });
    test(
        'FC4.04: GIVEN FlexColor is materialDarkSecondaryVariantHc '
        'EXPECT color is ColorScheme.highContrastDark().primaryVariant', () {
      expect(FlexColor.materialDarkSecondaryVariantHc, md.secondaryVariant);
    });
    test(
        'FC4.05: GIVEN FlexColor is materialDarkSurface '
        'EXPECT color is ColorScheme.highContrastDark().surface', () {
      expect(FlexColor.materialDarkSurface, md.surface);
    });
    test(
        'FC4.06: GIVEN FlexColor is materialDarkBackground '
        'EXPECT  color is ColorScheme.highContrastDark().background', () {
      expect(FlexColor.materialDarkBackground, md.background);
    });
    test(
        'FC4.07: GIVEN FlexColor is materialDarkErrorHc '
        'EXPECT color is ColorScheme.highContrastDark().error', () {
      expect(FlexColor.materialDarkErrorHc, md.error);
    });
  });

  //****************************************************************************
  // FlexColor unit tests - Test More colors?
  //
  // The other color definitions are native to the library and will not be
  // changed. Those FlexColor color values are NOT tested. Well at least
  // for now, maybe some day I add tests for all the constants to report if
  // they are changed, but currently it does not add a lot of value.
  //
  // If they are, or need to be changed it is visible in the repo and will be
  // reported as a breaking change.
  //****************************************************************************
}
