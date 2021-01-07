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
  // changed. If they are, or need to be changed it is visible in the repo and
  // will be reported as a breaking change.
  //
  // These FlexColor color values are still only partially.... more coming...
  //****************************************************************************
  group('FC5: WITH FlexColor test color definitions are as specified', () {
    test('FC5 colors', () {
      expect(FlexColor.materialLightSurface, const Color(0xFFFFFFFF));
    });
    test('FC5 colors', () {
      expect(FlexColor.materialLightBackground, const Color(0xFFFFFFFF));
    });
    test('FC5 colors', () {
      expect(
          FlexColor.materialLightScaffoldBackground, const Color(0xFFFFFFFF));
    });
    test('FC5 colors', () {
      expect(FlexColor.materialDarkBackground, const Color(0xFF121212));
    });
    test('FC5 colors', () {
      expect(FlexColor.materialDarkScaffoldBackground, const Color(0xFF121212));
    });
    test('FC5 colors', () {
      expect(FlexColor.lightSurface, const Color(0xFFFFFFFF));
    });
    test('FC5 colors', () {
      expect(FlexColor.lightBackground, const Color(0xFFFDFDFD));
    });
    test('FC5 colors', () {
      expect(FlexColor.lightScaffoldBackground, const Color(0xFFFFFFFF));
    });
    test('FC5 colors', () {
      expect(FlexColor.darkSurface, const Color(0xFF111111));
    });
    test('FC5 colors', () {
      expect(FlexColor.darkBackground, const Color(0xFF101010));
    });
    test('FC5 colors', () {
      expect(FlexColor.darkScaffoldBackground, const Color(0xFF121212));
    });
    test('FC5 colors', () {
      expect(FlexColor.materialLightError, const Color(0xFFB00020));
    });
    test('FC5 colors', () {
      expect(FlexColor.materialDarkError, const Color(0xFFCF6679));
    });
    test('FC5 colors', () {
      expect(FlexColor.materialLightErrorHc, const Color(0xff790000));
    });
    test('FC5 colors', () {
      expect(FlexColor.materialDarkErrorHc, const Color(0xff9b374d));
    });
    test('FC5 colors', () {
      expect(FlexColor.materialName, 'Material default');
    });
    test('FC5 colors', () {
      expect(FlexColor.materialDescription,
          'Default Material color theme, used in the design guide.');
    });
    test('FC5 colors', () {
      expect(FlexColor.materialLightPrimary, const Color(0xff6200ee));
    });
    test('FC5 colors', () {
      expect(FlexColor.materialLightPrimaryVariant, const Color(0xff3700b3));
    });
    test('FC5 colors', () {
      expect(FlexColor.materialLightSecondary, const Color(0xff03dac6));
    });
    test('FC5 colors', () {
      expect(FlexColor.materialLightSecondaryVariant, const Color(0xff018786));
    });
    test('FC5 colors', () {
      expect(FlexColor.materialDarkPrimary, const Color(0xffbb86fc));
    });
    test('FC5 colors', () {
      expect(FlexColor.materialDarkPrimaryVariant, const Color(0xff3700B3));
    });
    test('FC5 colors', () {
      expect(FlexColor.materialDarkSecondary, const Color(0xff03dac6));
    });
    test('FC5 colors', () {
      expect(FlexColor.materialDarkSecondaryVariant, const Color(0xff03dac6));
    });
    test('FC5 colors', () {
      expect(FlexColor.materialHcName, 'Material high contrast');
    });
    test('FC5 colors', () {
      expect(FlexColor.materialHcDescription,
          'High contrast Material design guide theme.');
    });
    test('FC5 colors', () {
      expect(FlexColor.materialLightPrimaryHc, const Color(0xff0000ba));
    });
    test('FC5 colors', () {
      expect(FlexColor.materialLightPrimaryVariantHc, const Color(0xff000088));
    });
    test('FC5 colors', () {
      expect(FlexColor.materialLightSecondaryHc, const Color(0xff66fff9));
    });

    test('FC5 colors', () {
      expect(
          FlexColor.materialLightSecondaryVariantHc, const Color(0xff018786));
    });
    test('FC5 colors', () {
      expect(FlexColor.materialDarkPrimaryHc, const Color(0xffefb7ff));
    });
    test('FC5 colors', () {
      expect(FlexColor.materialDarkPrimaryVariantHc, const Color(0xffbe9eff));
    });
    test('FC5 colors', () {
      expect(FlexColor.materialDarkSecondaryHc, const Color(0xff66fff9));
    });
    test('FC5 colors', () {
      expect(FlexColor.materialDarkSecondaryVariantHc, const Color(0xff66fff9));
    });
    test('FC5 colors', () {
      expect(FlexColor.blueName, 'Blue delight');
    });
    test('FC5 colors', () {
      expect(FlexColor.blueDescription,
          'Blue color theme, based on Material blue and light blue colors.');
    });
    test('FC5 colors', () {
      expect(FlexColor.blueLightPrimary, const Color(0xFF1565C0));
    });
    test('FC5 colors', () {
      expect(FlexColor.blueLightPrimaryVariant, const Color(0xFF0D47A1));
    });
    test('FC5 colors', () {
      expect(FlexColor.blueLightSecondary, const Color(0xFF039BE5));
    });
    test('FC5 colors', () {
      expect(FlexColor.blueLightSecondaryVariant, const Color(0xFF0277BD));
    });
    test('FC5 colors', () {
      expect(FlexColor.blueDarkPrimary, const Color(0xFF90CAF9));
    });
    test('FC5 colors', () {
      expect(FlexColor.blueDarkPrimaryVariant, const Color(0xFF64B5F6));
    });
    test('FC5 colors', () {
      expect(FlexColor.blueDarkSecondary, const Color(0xFF81D4FA));
    });
    test('FC5 colors', () {
      expect(FlexColor.blueDarkSecondaryVariant, const Color(0xFFE1F5FE));
    });
    test('FC5 colors', () {
      expect(FlexColor.indigoName, 'Indigo nights');
    });
    test('FC5 colors', () {
      expect(
          FlexColor.indigoDescription,
          'Indigo color theme, based on Material indigo and deep '
          'purple colors.');
    });
    test('FC5 colors', () {
      expect(FlexColor.indigoLightPrimary, const Color(0xFF303F9F));
    });
    test('FC5 colors', () {
      expect(FlexColor.indigoLightPrimaryVariant, const Color(0xFF1A237E));
    });
    test('FC5 colors', () {
      expect(FlexColor.indigoLightSecondary, const Color(0xFF512DA8));
    });
    test('FC5 colors', () {
      expect(FlexColor.indigoLightSecondaryVariant, const Color(0xFF311B92));
    });
    test('FC5 colors', () {
      expect(FlexColor.indigoDarkPrimary, const Color(0xFF7986CB));
    });
    test('FC5 colors', () {
      expect(FlexColor.indigoDarkPrimaryVariant, const Color(0xFF5C6BC0));
    });
    test('FC5 colors', () {
      expect(FlexColor.indigoDarkSecondary, const Color(0xFF9575CD));
    });
    test('FC5 colors', () {
      expect(FlexColor.indigoDarkSecondaryVariant, const Color(0xFF7E57C2));
    });
    test('FC5 colors', () {
      expect(FlexColor.hippieBlueName, 'Hippie blue');
    });
    test('FC5 colors', () {
      expect(FlexColor.hippieBlueDescription,
          'Hippie blue with surfie green and chock coral pink theme.');
    });
    test('FC5 colors', () {
      expect(FlexColor.hippieBlueLightPrimary, const Color(0xFF4C9BBA));
    });
    test('FC5 colors', () {
      expect(FlexColor.hippieBlueLightPrimaryVariant, const Color(0xFF078282));
    });
    test('FC5 colors', () {
      expect(FlexColor.hippieBlueLightSecondary, const Color(0xFFFF4F58));
    });
    test('FC5 colors', () {
      expect(
          FlexColor.hippieBlueLightSecondaryVariant, const Color(0xFFBF4A50));
    });
    test('FC5 colors', () {
      expect(FlexColor.hippieBlueDarkPrimary, const Color(0xFF669DB3));
    });
    test('FC5 colors', () {
      expect(FlexColor.hippieBlueDarkPrimaryVariant, const Color(0xFF208E8E));
    });
    test('FC5 colors', () {
      expect(FlexColor.hippieBlueDarkSecondary, const Color(0xFFFC6E75));
    });
    test('FC5 colors', () {
      expect(FlexColor.hippieBlueDarkSecondaryVariant, const Color(0xFFF75F67));
    });

    test('FC5 colors', () {
      expect(FlexColor.aquaBlueName, 'Aqua blue');
    });
    test('FC5 colors', () {
      expect(FlexColor.aquaBlueDescription, 'Aqua tropical ocean blue theme.');
    });
    test('FC5 colors', () {
      expect(FlexColor.aquaBlueLightPrimary, const Color(0xFF35A0CB));
    });
    test('FC5 colors', () {
      expect(FlexColor.aquaBlueLightPrimaryVariant, const Color(0xFF45B4D2));
    });
    test('FC5 colors', () {
      expect(FlexColor.aquaBlueLightSecondary, const Color(0xFF89D1C8));
    });
    test('FC5 colors', () {
      expect(FlexColor.aquaBlueLightSecondaryVariant, const Color(0xFF61D4D4));
    });
    test('FC5 colors', () {
      expect(FlexColor.aquaBlueDarkPrimary, const Color(0xFF5DB3D5));
    });
    test('FC5 colors', () {
      expect(FlexColor.aquaBlueDarkPrimaryVariant, const Color(0xFF71D3ED));
    });
    test('FC5 colors', () {
      expect(FlexColor.aquaBlueDarkSecondary, const Color(0xFFA1E9DF));
    });
    test('FC5 colors', () {
      expect(FlexColor.aquaBlueDarkSecondaryVariant, const Color(0xFFA0E5E5));
    });
  });
}
