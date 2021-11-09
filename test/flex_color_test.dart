import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

//****************************************************************************
// These simple FlexColor unit test just monitors that the used color values
// for the standard material color schemes included in the SDK, match the ones
// defined in FlexColor. If either changes in the future, the tests will fail.
// They also ensure that we have not changed our own used scheme color values.
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
  // FlexColor unit tests - Test the color value definitions.
  //
  // This test that ALL the color values defined in the code, are as they were
  // originally defined.
  //
  // If we by accident happen to edit a color value these tests will detect
  // that. they (and some other tests too) will also detect if the some key
  // framework Material Design Guide colors have been modified.
  //
  // We can of course still change the definition of a used color definitions
  // in the predefined schemes, but such a change would need to ve very
  // deliberate and also update the tests. Basically the color should not be
  // changed. If they are, or need to be changed it is a breaking change.
  //
  //****************************************************************************
  group('FC5: WITH FlexColor test color definitions are as specified', () {
    test('FC5 colors materialLightSurface', () {
      expect(FlexColor.materialLightSurface, const Color(0xFFFFFFFF));
    });
    test('FC5 colors materialLightBackground', () {
      expect(FlexColor.materialLightBackground, const Color(0xFFFFFFFF));
    });
    test('FC5 colors materialLightScaffoldBackground', () {
      expect(
          FlexColor.materialLightScaffoldBackground, const Color(0xFFFFFFFF));
    });
    test('FC5 colors materialDarkBackground', () {
      expect(FlexColor.materialDarkBackground, const Color(0xFF121212));
    });
    test('FC5 colors materialDarkScaffoldBackground', () {
      expect(FlexColor.materialDarkScaffoldBackground, const Color(0xFF121212));
    });
    test('FC5 colors Flex lightSurface', () {
      expect(FlexColor.lightSurface, const Color(0xFFFFFFFF));
    });
    test('FC5 colors Flex lightBackground', () {
      expect(FlexColor.lightBackground, const Color(0xFFFDFDFD));
    });
    test('FC5 colors Flex lightScaffoldBackground', () {
      expect(FlexColor.lightScaffoldBackground, const Color(0xFFFFFFFF));
    });
    test('FC5 colors Flex darkSurface', () {
      expect(FlexColor.darkSurface, const Color(0xFF111111));
    });
    test('FC5 colors Flex darkBackground', () {
      expect(FlexColor.darkBackground, const Color(0xFF101010));
    });
    test('FC5 colors Flex darkScaffoldBackground', () {
      expect(FlexColor.darkScaffoldBackground, const Color(0xFF121212));
    });
    test('FC5 colors materialLightError', () {
      expect(FlexColor.materialLightError, const Color(0xFFB00020));
    });
    test('FC5 colors materialDarkError', () {
      expect(FlexColor.materialDarkError, const Color(0xFFCF6679));
    });
    test('FC5 colors materialLightErrorHc', () {
      expect(FlexColor.materialLightErrorHc, const Color(0xff790000));
    });
    test('FC5 colors materialDarkErrorHc', () {
      expect(FlexColor.materialDarkErrorHc, const Color(0xff9b374d));
    });
    test('FC5 colors Material default', () {
      expect(FlexColor.materialName, 'Material default');
    });
    test('FC5 colors Material default', () {
      expect(FlexColor.materialDescription,
          'Default Material color theme, used in the design guide');
    });
    test('FC5 colors Material default', () {
      expect(FlexColor.materialLightPrimary, const Color(0xff6200ee));
    });
    test('FC5 colors Material default', () {
      expect(FlexColor.materialLightPrimaryVariant, const Color(0xff3700b3));
    });
    test('FC5 colors Material default', () {
      expect(FlexColor.materialLightSecondary, const Color(0xff03dac6));
    });
    test('FC5 colors Material default', () {
      expect(FlexColor.materialLightSecondaryVariant, const Color(0xff018786));
    });
    test('FC5 colors Material default', () {
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
          'High contrast Material design guide theme');
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
          'Blue color theme, based on Material blue and light blue colors');
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
          'purple colors');
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
          'Hippie blue with surfie green and chock coral pink theme');
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
      expect(FlexColor.aquaBlueDescription, 'Aqua tropical ocean blue theme');
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

    test('FC5 colors', () {
      expect(FlexColor.brandBlueName, 'Brand blues');
    });
    test('FC5 colors', () {
      expect(FlexColor.brandBlueDescription,
          'Blue colors used in well known brand themes');
    });
    test('FC5 colors', () {
      expect(FlexColor.brandBlueLightPrimary, const Color(0xFF3B5998));
    });
    test('FC5 colors', () {
      expect(FlexColor.brandBlueLightPrimaryVariant, const Color(0xFF3F729B));
    });
    test('FC5 colors', () {
      expect(FlexColor.brandBlueLightSecondary, const Color(0xFF55ACEE));
    });
    test('FC5 colors', () {
      expect(FlexColor.brandBlueLightSecondaryVariant, const Color(0xFF4285F4));
    });
    test('FC5 colors', () {
      expect(FlexColor.brandBlueDarkPrimary, const Color(0xFF8B9DC3));
    });
    test('FC5 colors', () {
      expect(FlexColor.brandBlueDarkPrimaryVariant, const Color(0xFF799CB9));
    });
    test('FC5 colors', () {
      expect(FlexColor.brandBlueDarkSecondary, const Color(0xFFA0D1F5));
    });
    test('FC5 colors', () {
      expect(FlexColor.brandBlueDarkSecondaryVariant, const Color(0xFF88B2F8));
    });

    test('FC5 colors', () {
      expect(FlexColor.deepBlueName, 'Deep blue sea');
    });
    test('FC5 colors', () {
      expect(FlexColor.deepBlueDescription, 'Dark deep blue sea color theme');
    });
    test('FC5 colors', () {
      expect(FlexColor.deepBlueLightPrimary, const Color(0xFF223A5E));
    });
    test('FC5 colors', () {
      expect(FlexColor.deepBlueLightPrimaryVariant, const Color(0xFF1B2E4B));
    });
    test('FC5 colors', () {
      expect(FlexColor.deepBlueLightSecondary, const Color(0xFF144955));
    });
    test('FC5 colors', () {
      expect(FlexColor.deepBlueLightSecondaryVariant, const Color(0xFF208399));
    });
    test('FC5 colors', () {
      expect(FlexColor.deepBlueDarkPrimary, const Color(0xFF748BAC));
    });
    test('FC5 colors', () {
      expect(FlexColor.deepBlueDarkPrimaryVariant, const Color(0xFF7FA1D0));
    });
    test('FC5 colors', () {
      expect(FlexColor.deepBlueDarkSecondary, const Color(0xFF539EAF));
    });
    test('FC5 colors', () {
      expect(FlexColor.deepBlueDarkSecondaryVariant, const Color(0xFF219AB5));
    });

    test('FC5 colors', () {
      expect(FlexColor.sakuraName, 'Pink sakura');
    });
    test('FC5 colors', () {
      expect(
        FlexColor.sakuraDescription,
        'Pink color theme, based on sakura cherry blossom like colors',
      );
    });
    test('FC5 colors', () {
      expect(FlexColor.sakuraLightPrimary, const Color(0xFFCE5B78));
    });
    test('FC5 colors', () {
      expect(FlexColor.sakuraLightPrimaryVariant, const Color(0xffe4446c));
    });
    test('FC5 colors', () {
      expect(FlexColor.sakuraLightSecondary, const Color(0xFFfbae9d));
    });
    test('FC5 colors', () {
      expect(FlexColor.sakuraLightSecondaryVariant, const Color(0xFFF39682));
    });
    test('FC5 colors', () {
      expect(FlexColor.sakuraDarkPrimary, const Color(0xFFeec4d8));
    });
    test('FC5 colors', () {
      expect(FlexColor.sakuraDarkPrimaryVariant, const Color(0xFFe8b5ce));
    });
    test('FC5 colors', () {
      expect(FlexColor.sakuraDarkSecondary, const Color(0xFFF5D6C6));
    });
    test('FC5 colors', () {
      expect(FlexColor.sakuraDarkSecondaryVariant, const Color(0xFFf7e0d4));
    });

    test('FC5 colors', () {
      expect(FlexColor.mandyRedName, 'Oh Mandy red');
    });
    test('FC5 colors', () {
      expect(
        FlexColor.mandyRedDescription,
        'Mandy red and Viking blue inspired red theme',
      );
    });
    test('FC5 colors', () {
      expect(FlexColor.mandyRedLightPrimary, const Color(0xFFCD5758));
    });
    test('FC5 colors', () {
      expect(FlexColor.mandyRedLightPrimaryVariant, const Color(0xFFA23556));
    });
    test('FC5 colors', () {
      expect(FlexColor.mandyRedLightSecondary, const Color(0xFF57C8D3));
    });
    test('FC5 colors', () {
      expect(FlexColor.mandyRedLightSecondaryVariant, const Color(0xFF69B9CD));
    });
    test('FC5 colors', () {
      expect(FlexColor.mandyRedDarkPrimary, const Color(0xFFDA8585));
    });
    test('FC5 colors', () {
      expect(FlexColor.mandyRedDarkPrimaryVariant, const Color(0xFFAB4967));
    });
    test('FC5 colors', () {
      expect(FlexColor.mandyRedDarkSecondary, const Color(0xFF68CDD7));
    });
    test('FC5 colors', () {
      expect(FlexColor.mandyRedDarkSecondaryVariant, const Color(0xFF85C6D6));
    });

    test('FC5 colors', () {
      expect(FlexColor.redName, 'Red tornado');
    });
    test('FC5 colors', () {
      expect(
        FlexColor.redDescription,
        'Red color theme, based on Material red and pink colors',
      );
    });
    test('FC5 colors', () {
      expect(FlexColor.redLightPrimary, const Color(0xFFC62828));
    });
    test('FC5 colors', () {
      expect(FlexColor.redLightPrimaryVariant, const Color(0xFFB71C1C));
    });
    test('FC5 colors', () {
      expect(FlexColor.redLightSecondary, const Color(0xFFAD1457));
    });
    test('FC5 colors', () {
      expect(FlexColor.redLightSecondaryVariant, const Color(0xFF880E4F));
    });
    test('FC5 colors', () {
      expect(FlexColor.redDarkPrimary, const Color(0xFFEF9A9A));
    });
    test('FC5 colors', () {
      expect(FlexColor.redDarkPrimaryVariant, const Color(0xFFE57373));
    });
    test('FC5 colors', () {
      expect(FlexColor.redDarkSecondary, const Color(0xFFF48FB1));
    });
    test('FC5 colors', () {
      expect(FlexColor.redDarkSecondaryVariant, const Color(0xFFF06292));
    });

    test('FC5 colors', () {
      expect(FlexColor.redWineName, 'Red red wine');
    });
    test('FC5 colors', () {
      expect(
        FlexColor.redWineDescription,
        'Red color theme, based on red wine like colors',
      );
    });
    test('FC5 colors', () {
      expect(FlexColor.redWineLightPrimary, const Color(0xFF9B1B30));
    });
    test('FC5 colors', () {
      expect(FlexColor.redWineLightPrimaryVariant, const Color(0xFF6C1322));
    });
    test('FC5 colors', () {
      expect(FlexColor.redWineLightSecondary, const Color(0xFFA70043));
    });
    test('FC5 colors', () {
      expect(FlexColor.redWineLightSecondaryVariant, const Color(0xFFA4121C));
    });
    test('FC5 colors', () {
      expect(FlexColor.redWineDarkPrimary, const Color(0xFFE4677C));
    });
    test('FC5 colors', () {
      expect(FlexColor.redWineDarkPrimaryVariant, const Color(0xFFB25867));
    });
    test('FC5 colors', () {
      expect(FlexColor.redWineDarkSecondary, const Color(0xFFC87A98));
    });
    test('FC5 colors', () {
      expect(FlexColor.redWineDarkSecondaryVariant, const Color(0xFFBD545B));
    });

    test('FC5 colors', () {
      expect(FlexColor.purpleBrownName, 'Purple brown');
    });
    test('FC5 colors', () {
      expect(
        FlexColor.purpleBrownDescription,
        'Purple brown tinted aubergine and eggplant colored theme',
      );
    });
    test('FC5 colors', () {
      expect(FlexColor.purpleBrownLightPrimary, const Color(0xFF450A0F));
    });
    test('FC5 colors', () {
      expect(FlexColor.purpleBrownLightPrimaryVariant, const Color(0xFF682A2C));
    });
    test('FC5 colors', () {
      expect(FlexColor.purpleBrownLightSecondary, const Color(0xFF60234F));
    });
    test('FC5 colors', () {
      expect(
          FlexColor.purpleBrownLightSecondaryVariant, const Color(0xFF4A0635));
    });
    test('FC5 colors', () {
      expect(FlexColor.purpleBrownDarkPrimary, const Color(0xFFA98085));
    });
    test('FC5 colors', () {
      expect(FlexColor.purpleBrownDarkPrimaryVariant, const Color(0xFF73494A));
    });
    test('FC5 colors', () {
      expect(FlexColor.purpleBrownDarkSecondary, const Color(0xFF975384));
    });
    test('FC5 colors', () {
      expect(
          FlexColor.purpleBrownDarkSecondaryVariant, const Color(0xFF5F4C5A));
    });

    test('FC5 colors', () {
      expect(FlexColor.moneyName, 'Green money');
    });
    test('FC5 colors', () {
      expect(
        FlexColor.moneyDescription,
        'Green money and finance style color theme',
      );
    });
    test('FC5 colors', () {
      expect(FlexColor.moneyLightPrimary, const Color(0xFF264E36));
    });
    test('FC5 colors', () {
      expect(FlexColor.moneyLightPrimaryVariant, const Color(0xFF224430));
    });
    test('FC5 colors', () {
      expect(FlexColor.moneyLightSecondary, const Color(0xFF797b3a));
    });
    test('FC5 colors', () {
      expect(FlexColor.moneyLightSecondaryVariant, const Color(0xFF555729));
    });
    test('FC5 colors', () {
      expect(FlexColor.moneyDarkPrimary, const Color(0xFF7AB893));
    });
    test('FC5 colors', () {
      expect(FlexColor.moneyDarkPrimaryVariant, const Color(0xFF6AAF85));
    });
    test('FC5 colors', () {
      expect(FlexColor.moneyDarkSecondary, const Color(0xFFd5d6a8));
    });
    test('FC5 colors', () {
      expect(FlexColor.moneyDarkSecondaryVariant, const Color(0xFFbbbe74));
    });

    test('FC5 colors', () {
      expect(FlexColor.greenName, 'Green forest');
    });
    test('FC5 colors', () {
      expect(
        FlexColor.greenDescription,
        'Green color theme, based on Material green and cyan colors',
      );
    });
    test('FC5 colors', () {
      expect(FlexColor.greenLightPrimary, const Color(0xFF2E7D32));
    });
    test('FC5 colors', () {
      expect(FlexColor.greenLightPrimaryVariant, const Color(0xFF1B5E20));
    });
    test('FC5 colors', () {
      expect(FlexColor.greenLightSecondary, const Color(0xFF00695C));
    });
    test('FC5 colors', () {
      expect(FlexColor.greenLightSecondaryVariant, const Color(0xFF004D40));
    });
    test('FC5 colors', () {
      expect(FlexColor.greenDarkPrimary, const Color(0xFFA5D6A7));
    });
    test('FC5 colors', () {
      expect(FlexColor.greenDarkPrimaryVariant, const Color(0xFF81C784));
    });
    test('FC5 colors', () {
      expect(FlexColor.greenDarkSecondary, const Color(0xFF80CBC4));
    });
    test('FC5 colors', () {
      expect(FlexColor.greenDarkSecondaryVariant, const Color(0xFF4DB6AC));
    });

    test('FC5 colors', () {
      expect(FlexColor.jungleName, 'Green jungle');
    });
    test('FC5 colors', () {
      expect(
        FlexColor.jungleDescription,
        'Green jungle and rain forest color theme',
      );
    });
    test('FC5 colors', () {
      expect(FlexColor.jungleLightPrimary, const Color(0xFF004E15));
    });
    test('FC5 colors', () {
      expect(FlexColor.jungleLightPrimaryVariant, const Color(0xFF00411F));
    });
    test('FC5 colors', () {
      expect(FlexColor.jungleLightSecondary, const Color(0xFF007256));
    });
    test('FC5 colors', () {
      expect(FlexColor.jungleLightSecondaryVariant, const Color(0xFF295300));
    });
    test('FC5 colors', () {
      expect(FlexColor.jungleDarkPrimary, const Color(0xFF519E67));
    });
    test('FC5 colors', () {
      expect(FlexColor.jungleDarkPrimaryVariant, const Color(0xFF3F9368));
    });
    test('FC5 colors', () {
      expect(FlexColor.jungleDarkSecondary, const Color(0xFF479985));
    });
    test('FC5 colors', () {
      expect(FlexColor.jungleDarkSecondaryVariant, const Color(0xFF73A497));
    });

    test('FC5 colors', () {
      expect(FlexColor.greyLawName, 'Grey law');
    });
    test('FC5 colors', () {
      expect(
        FlexColor.greyLawDescription,
        'Material blue grey and ultra dark purple color theme, law firm style',
      );
    });
    test('FC5 colors', () {
      expect(FlexColor.greyLawLightPrimary, const Color(0xFF37474F));
    });
    test('FC5 colors', () {
      expect(FlexColor.greyLawLightPrimaryVariant, const Color(0xFF455A64));
    });
    test('FC5 colors', () {
      expect(FlexColor.greyLawLightSecondary, const Color(0xFF521D82));
    });
    test('FC5 colors', () {
      expect(FlexColor.greyLawLightSecondaryVariant, const Color(0xFF2C314F));
    });
    test('FC5 colors', () {
      expect(FlexColor.greyLawDarkPrimary, const Color(0xFF90A4AE));
    });
    test('FC5 colors', () {
      expect(FlexColor.greyLawDarkPrimaryVariant, const Color(0xFF78909C));
    });
    test('FC5 colors', () {
      expect(FlexColor.greyLawDarkSecondary, const Color(0xFF815AA3));
    });
    test('FC5 colors', () {
      expect(FlexColor.greyLawDarkSecondaryVariant, const Color(0xFF373D5C));
    });

    test('FC5 colors', () {
      expect(FlexColor.wasabiName, 'Willow and wasabi');
    });
    test('FC5 colors', () {
      expect(
        FlexColor.wasabiDescription,
        'Wild Willow and wasabi green with orchid purple inspired colors',
      );
    });
    test('FC5 colors', () {
      expect(FlexColor.wasabiLightPrimary, const Color(0xFF738625));
    });
    test('FC5 colors', () {
      expect(FlexColor.wasabiLightPrimaryVariant, const Color(0xFF586621));
    });
    test('FC5 colors', () {
      expect(FlexColor.wasabiLightSecondary, const Color(0xFF893789));
    });
    test('FC5 colors', () {
      expect(FlexColor.wasabiLightSecondaryVariant, const Color(0xFF5E3974));
    });
    test('FC5 colors', () {
      expect(FlexColor.wasabiDarkPrimary, const Color(0xFFC3CB77));
    });
    test('FC5 colors', () {
      expect(FlexColor.wasabiDarkPrimaryVariant, const Color(0xFFD7DFB2));
    });
    test('FC5 colors', () {
      expect(FlexColor.wasabiDarkSecondary, const Color(0xFFDF9ADF));
    });
    test('FC5 colors', () {
      expect(FlexColor.wasabiDarkSecondaryVariant, const Color(0xFFA664CD));
    });

    test('FC5 colors', () {
      expect(FlexColor.goldName, 'Gold sunset');
    });
    test('FC5 colors', () {
      expect(
        FlexColor.goldDescription,
        'Gold sunset color theme, based on orange like colors',
      );
    });
    test('FC5 colors', () {
      expect(FlexColor.goldLightPrimary, const Color(0xFFb86914));
    });
    test('FC5 colors', () {
      expect(FlexColor.goldLightPrimaryVariant, const Color(0xFFcf7617));
    });
    test('FC5 colors', () {
      expect(FlexColor.goldLightSecondary, const Color(0xFFEF6C00));
    });
    test('FC5 colors', () {
      expect(FlexColor.goldLightSecondaryVariant, const Color(0xFFb36832));
    });
    test('FC5 colors', () {
      expect(FlexColor.goldDarkPrimary, const Color(0xFFeda85e));
    });
    test('FC5 colors', () {
      expect(FlexColor.goldDarkPrimaryVariant, const Color(0xFFf2c18c));
    });
    test('FC5 colors', () {
      expect(FlexColor.goldDarkSecondary, const Color(0xFFd28f60));
    });
    test('FC5 colors', () {
      expect(FlexColor.goldDarkSecondaryVariant, const Color(0xFFddab88));
    });

    test('FC5 colors', () {
      expect(FlexColor.mangoName, 'Mango mojito');
    });
    test('FC5 colors', () {
      expect(
        FlexColor.mangoDescription,
        'Orange and green Mango mojito color theme',
      );
    });
    test('FC5 colors', () {
      expect(FlexColor.mangoLightPrimary, const Color(0xFFC78D20));
    });
    test('FC5 colors', () {
      expect(FlexColor.mangoLightPrimaryVariant, const Color(0xFFD2691E));
    });
    test('FC5 colors', () {
      expect(FlexColor.mangoLightSecondary, const Color(0xFF8D9440));
    });
    test('FC5 colors', () {
      expect(FlexColor.mangoLightSecondaryVariant, const Color(0xFF616247));
    });
    test('FC5 colors', () {
      expect(FlexColor.mangoDarkPrimary, const Color(0xFFDEB059));
    });
    test('FC5 colors', () {
      expect(FlexColor.mangoDarkPrimaryVariant, const Color(0xFFDB874B));
    });
    test('FC5 colors', () {
      expect(FlexColor.mangoDarkSecondary, const Color(0xFFAFB479));
    });
    test('FC5 colors', () {
      expect(FlexColor.mangoDarkSecondaryVariant, const Color(0xFF81816C));
    });

    test('FC5 colors', () {
      expect(FlexColor.amberName, 'Amber blue');
    });
    test('FC5 colors', () {
      expect(
        FlexColor.amberDescription,
        'Amber blaze and blue color theme, based on '
        'Material amber and blue accent colors',
      );
    });
    test('FC5 colors', () {
      expect(FlexColor.amberLightPrimary, const Color(0xFFE65100));
    });
    test('FC5 colors', () {
      expect(FlexColor.amberLightPrimaryVariant, const Color(0xFFFF8F00));
    });
    test('FC5 colors', () {
      expect(FlexColor.amberLightSecondary, const Color(0xFF2979FF));
    });
    test('FC5 colors', () {
      expect(FlexColor.amberLightSecondaryVariant, const Color(0xFF2962FF));
    });
    test('FC5 colors', () {
      expect(FlexColor.amberDarkPrimary, const Color(0xFFFFB300));
    });
    test('FC5 colors', () {
      expect(FlexColor.amberDarkPrimaryVariant, const Color(0xFFFFD54F));
    });
    test('FC5 colors', () {
      expect(FlexColor.amberDarkSecondary, const Color(0xFF82B1FF));
    });
    test('FC5 colors', () {
      expect(FlexColor.amberDarkSecondaryVariant, const Color(0xFF448AFF));
    });

    test('FC5 colors', () {
      expect(FlexColor.vesuviusBurnName, 'Vesuvius burned');
    });
    test('FC5 colors', () {
      expect(
        FlexColor.vesuviusBurnDescription,
        'Vesuvius burned orange and eden green theme',
      );
    });
    test('FC5 colors', () {
      expect(FlexColor.vesuviusBurnLightPrimary, const Color(0xFFA6400F));
    });
    test('FC5 colors', () {
      expect(
          FlexColor.vesuviusBurnLightPrimaryVariant, const Color(0xFF7A2800));
    });
    test('FC5 colors', () {
      expect(FlexColor.vesuviusBurnLightSecondary, const Color(0xFF185358));
    });
    test('FC5 colors', () {
      expect(
          FlexColor.vesuviusBurnLightSecondaryVariant, const Color(0xFF144447));
    });
    test('FC5 colors', () {
      expect(FlexColor.vesuviusBurnDarkPrimary, const Color(0xFFD17D53));
    });
    test('FC5 colors', () {
      expect(FlexColor.vesuviusBurnDarkPrimaryVariant, const Color(0xFFA7613E));
    });
    test('FC5 colors', () {
      expect(FlexColor.vesuviusBurnDarkSecondary, const Color(0xFF5B8A8E));
    });
    test('FC5 colors', () {
      expect(
          FlexColor.vesuviusBurnDarkSecondaryVariant, const Color(0xFF3A7175));
    });

    test('FC5 colors', () {
      expect(FlexColor.deepPurpleName, 'Deep purple');
    });
    test('FC5 colors', () {
      expect(
        FlexColor.deepPurpleDescription,
        'Deep purple daisy bush theme, '
        'based on Material deepPurple and lightBlueAccent colors',
      );
    });
    test('FC5 colors', () {
      expect(FlexColor.deepPurpleLightPrimary, const Color(0xFF4527A0));
    });
    test('FC5 colors', () {
      expect(FlexColor.deepPurpleLightPrimaryVariant, const Color(0xFF673AB7));
    });
    test('FC5 colors', () {
      expect(FlexColor.deepPurpleLightSecondary, const Color(0xFF0091EA));
    });
    test('FC5 colors', () {
      expect(
          FlexColor.deepPurpleLightSecondaryVariant, const Color(0xFF00B0FF));
    });
    test('FC5 colors', () {
      expect(FlexColor.deepPurpleDarkPrimary, const Color(0xFFB39DDB));
    });
    test('FC5 colors', () {
      expect(FlexColor.deepPurpleDarkPrimaryVariant, const Color(0xFF9575CD));
    });
    test('FC5 colors', () {
      expect(FlexColor.deepPurpleDarkSecondary, const Color(0xFF80D8FF));
    });
    test('FC5 colors', () {
      expect(FlexColor.deepPurpleDarkSecondaryVariant, const Color(0xFF40C4FF));
    });

    test('FC5 colors', () {
      expect(FlexColor.ebonyClayName, 'Ebony clay');
    });
    test('FC5 colors', () {
      expect(
        FlexColor.ebonyClayDescription,
        'Ebony clay dark blue-grey and watercourse green colored theme',
      );
    });
    test('FC5 colors', () {
      expect(FlexColor.ebonyClayLightPrimary, const Color(0xFF202541));
    });
    test('FC5 colors', () {
      expect(FlexColor.ebonyClayLightPrimaryVariant, const Color(0xFF202531));
    });
    test('FC5 colors', () {
      expect(FlexColor.ebonyClayLightSecondary, const Color(0xFF006B54));
    });
    test('FC5 colors', () {
      expect(FlexColor.ebonyClayLightSecondaryVariant, const Color(0xFF004B3B));
    });
    test('FC5 colors', () {
      expect(FlexColor.ebonyClayDarkPrimary, const Color(0xFF4E597D));
    });
    test('FC5 colors', () {
      expect(FlexColor.ebonyClayDarkPrimaryVariant, const Color(0xFF707EAC));
    });
    test('FC5 colors', () {
      expect(FlexColor.ebonyClayDarkSecondary, const Color(0xFF4BA390));
    });
    test('FC5 colors', () {
      expect(FlexColor.ebonyClayDarkSecondaryVariant, const Color(0xFF3D8475));
    });

    test('FC5 colors', () {
      expect(FlexColor.barossaName, 'Barossa');
    });
    test('FC5 colors', () {
      expect(
        FlexColor.barossaDescription,
        'Barossa red and cardin green colored theme',
      );
    });
    test('FC5 colors', () {
      expect(FlexColor.barossaLightPrimary, const Color(0xFF4E0029));
    });
    test('FC5 colors', () {
      expect(FlexColor.barossaLightPrimaryVariant, const Color(0xFF750D43));
    });
    test('FC5 colors', () {
      expect(FlexColor.barossaLightSecondary, const Color(0xFF00341A));
    });
    test('FC5 colors', () {
      expect(FlexColor.barossaLightSecondaryVariant, const Color(0xFF124C2F));
    });
    test('FC5 colors', () {
      expect(FlexColor.barossaDarkPrimary, const Color(0xFF94667E));
    });
    test('FC5 colors', () {
      expect(FlexColor.barossaDarkPrimaryVariant, const Color(0xFFB3718D));
    });
    test('FC5 colors', () {
      expect(FlexColor.barossaDarkSecondary, const Color(0xFF6B9882));
    });
    test('FC5 colors', () {
      expect(FlexColor.barossaDarkSecondaryVariant, const Color(0xFF599B7B));
    });

    test('FC5 colors', () {
      expect(FlexColor.sharkName, 'Shark and orange');
    });
    test('FC5 colors', () {
      expect(
        FlexColor.sharkDescription,
        'Shark grey and orange ecstasy colored theme',
      );
    });
    test('FC5 colors', () {
      expect(FlexColor.sharkLightPrimary, const Color(0xFF1D2228));
    });
    test('FC5 colors', () {
      expect(FlexColor.sharkLightPrimaryVariant, const Color(0xFF484C50));
    });
    test('FC5 colors', () {
      expect(FlexColor.sharkLightSecondary, const Color(0xFFFB8122));
    });
    test('FC5 colors', () {
      expect(FlexColor.sharkLightSecondaryVariant, const Color(0xFFEA9654));
    });
    test('FC5 colors', () {
      expect(FlexColor.sharkDarkPrimary, const Color(0xFF777A7E));
    });
    test('FC5 colors', () {
      expect(FlexColor.sharkDarkPrimaryVariant, const Color(0xFF919396));
    });
    test('FC5 colors', () {
      expect(FlexColor.sharkDarkSecondary, const Color(0xFFFCB075));
    });
    test('FC5 colors', () {
      expect(FlexColor.sharkDarkSecondaryVariant, const Color(0xFFEFB383));
    });

    test('FC5 colors', () {
      expect(FlexColor.bigStoneName, 'Big stone tulip');
    });
    test('FC5 colors', () {
      expect(
        FlexColor.bigStoneDescription,
        'Big stone blue and tulip tree yellow colored theme',
      );
    });
    test('FC5 colors', () {
      expect(FlexColor.bigStoneLightPrimary, const Color(0xFF1A2C42));
    });
    test('FC5 colors', () {
      expect(FlexColor.bigStoneLightPrimaryVariant, const Color(0xFF0C1115));
    });
    test('FC5 colors', () {
      expect(FlexColor.bigStoneLightSecondary, const Color(0xFFE59A18));
    });
    test('FC5 colors', () {
      expect(FlexColor.bigStoneLightSecondaryVariant, const Color(0xFFF0B03F));
    });
    test('FC5 colors', () {
      expect(FlexColor.bigStoneDarkPrimary, const Color(0xFF60748A));
    });
    test('FC5 colors', () {
      expect(FlexColor.bigStoneDarkPrimaryVariant, const Color(0xFF889EB6));
    });
    test('FC5 colors', () {
      expect(FlexColor.bigStoneDarkSecondary, const Color(0xFFEBB251));
    });
    test('FC5 colors', () {
      expect(FlexColor.bigStoneDarkSecondaryVariant, const Color(0xFFF4CA7E));
    });

    test('FC5 colors', () {
      expect(FlexColor.damaskName, 'Damask and lunar');
    });
    test('FC5 colors', () {
      expect(
        FlexColor.damaskDescription,
        'Damask red and lunar green colored theme',
      );
    });
    test('FC5 colors', () {
      expect(FlexColor.damaskLightPrimary, const Color(0xFFC96646));
    });
    test('FC5 colors', () {
      expect(FlexColor.damaskLightPrimaryVariant, const Color(0xFFD48166));
    });
    test('FC5 colors', () {
      expect(FlexColor.damaskLightSecondary, const Color(0xFF373A36));
    });
    test('FC5 colors', () {
      expect(FlexColor.damaskLightSecondaryVariant, const Color(0xFF343E32));
    });
    test('FC5 colors', () {
      expect(FlexColor.damaskDarkPrimary, const Color(0xFFDA9882));
    });
    test('FC5 colors', () {
      expect(FlexColor.damaskDarkPrimaryVariant, const Color(0xFFECC9BD));
    });
    test('FC5 colors', () {
      expect(FlexColor.damaskDarkSecondary, const Color(0xFF767D75));
    });
    test('FC5 colors', () {
      expect(FlexColor.damaskDarkSecondaryVariant, const Color(0xFF839081));
    });

    test('FC5 colors', () {
      expect(FlexColor.bahamaBlueName, 'Bahama and trinidad');
    });
    test('FC5 colors', () {
      expect(
        FlexColor.bahamaBlueDescription,
        'Bahama blue and trinidad orange colored theme',
      );
    });
    test('FC5 colors', () {
      expect(FlexColor.bahamaBlueLightPrimary, const Color(0xFF095D9E));
    });
    test('FC5 colors', () {
      expect(FlexColor.bahamaBlueLightPrimaryVariant, const Color(0xFF658EAF));
    });
    test('FC5 colors', () {
      expect(FlexColor.bahamaBlueLightSecondary, const Color(0xFFDD520F));
    });
    test('FC5 colors', () {
      expect(
          FlexColor.bahamaBlueLightSecondaryVariant, const Color(0xFF7CC8F8));
    });
    test('FC5 colors', () {
      expect(FlexColor.bahamaBlueDarkPrimary, const Color(0xFF4585B5));
    });
    test('FC5 colors', () {
      expect(FlexColor.bahamaBlueDarkPrimaryVariant, const Color(0xFF70A1C9));
    });
    test('FC5 colors', () {
      expect(FlexColor.bahamaBlueDarkSecondary, const Color(0xFFE57C4A));
    });
    test('FC5 colors', () {
      expect(FlexColor.bahamaBlueDarkSecondaryVariant, const Color(0xFF9CD5F9));
    });

    test('FC5 colors', () {
      expect(FlexColor.mallardGreenName, 'Mallard and valencia');
    });
    test('FC5 colors', () {
      expect(
        FlexColor.mallardGreenDescription,
        'Mallard green and Valencia pink colored theme',
      );
    });
    test('FC5 colors', () {
      expect(FlexColor.mallardGreenLightPrimary, const Color(0xFF2D4421));
    });
    test('FC5 colors', () {
      expect(
          FlexColor.mallardGreenLightPrimaryVariant, const Color(0xFF779151));
    });
    test('FC5 colors', () {
      expect(FlexColor.mallardGreenLightSecondary, const Color(0xFFD34B4B));
    });
    test('FC5 colors', () {
      expect(
          FlexColor.mallardGreenLightSecondaryVariant, const Color(0xFF959D33));
    });
    test('FC5 colors', () {
      expect(FlexColor.mallardGreenDarkPrimary, const Color(0xFF808E79));
    });
    test('FC5 colors', () {
      expect(FlexColor.mallardGreenDarkPrimaryVariant, const Color(0xFFA3B58A));
    });
    test('FC5 colors', () {
      expect(FlexColor.mallardGreenDarkSecondary, const Color(0xFFE18686));
    });
    test('FC5 colors', () {
      expect(
          FlexColor.mallardGreenDarkSecondaryVariant, const Color(0xFFC3C87A));
    });

    test('FC5 colors', () {
      expect(FlexColor.espressoName, 'Espresso and crema');
    });
    test('FC5 colors', () {
      expect(
        FlexColor.espressoDescription,
        'Espresso dark brown and crema colored theme',
      );
    });
    test('FC5 colors', () {
      expect(FlexColor.espressoLightPrimary, const Color(0xFF220804));
    });
    test('FC5 colors', () {
      expect(FlexColor.espressoLightPrimaryVariant, const Color(0xFF977F55));
    });
    test('FC5 colors', () {
      expect(FlexColor.espressoLightSecondary, const Color(0xFFE3B964));
    });
    test('FC5 colors', () {
      expect(FlexColor.espressoLightSecondaryVariant, const Color(0xFFF5E9C9));
    });
    test('FC5 colors', () {
      expect(FlexColor.espressoDarkPrimary, const Color(0xFF8D7F7D));
    });
    test('FC5 colors', () {
      expect(FlexColor.espressoDarkPrimaryVariant, const Color(0xFFC3B59D));
    });
    test('FC5 colors', () {
      expect(FlexColor.espressoDarkSecondary, const Color(0xFFEED6A6));
    });
    test('FC5 colors', () {
      expect(FlexColor.espressoDarkSecondaryVariant, const Color(0xFFF8ECD4));
    });

    test('FC5 colors', () {
      expect(FlexColor.outerSpaceName, 'Outer space stage');
    });
    test('FC5 colors', () {
      expect(
        FlexColor.outerSpaceDescription,
        'Outer space dark blue-grey and stage red theme',
      );
    });
    test('FC5 colors', () {
      expect(FlexColor.outerSpaceLightPrimary, const Color(0xFF1F3339));
    });
    test('FC5 colors', () {
      expect(FlexColor.outerSpaceLightPrimaryVariant, const Color(0xFF416A7D));
    });
    test('FC5 colors', () {
      expect(FlexColor.outerSpaceLightSecondary, const Color(0xFFD2600A));
    });
    test('FC5 colors', () {
      expect(
          FlexColor.outerSpaceLightSecondaryVariant, const Color(0xFF93A0A9));
    });
    test('FC5 colors', () {
      expect(FlexColor.outerSpaceDarkPrimary, const Color(0xFF486A71));
    });
    test('FC5 colors', () {
      expect(FlexColor.outerSpaceDarkPrimaryVariant, const Color(0xFF6A8A99));
    });
    test('FC5 colors', () {
      expect(FlexColor.outerSpaceDarkSecondary, const Color(0xFFDB823F));
    });
    test('FC5 colors', () {
      expect(FlexColor.outerSpaceDarkSecondaryVariant, const Color(0xFFAAB4BB));
    });

    test('FC5 colors', () {
      expect(FlexColor.blueWhaleName, 'Blue whale');
    });
    test('FC5 colors', () {
      expect(
        FlexColor.blueWhaleDescription,
        'Blue whale, jungle green and outrageous tango orange theme',
      );
    });
    test('FC5 colors', () {
      expect(FlexColor.blueWhaleLightPrimary, const Color(0xFF023047));
    });
    test('FC5 colors', () {
      expect(FlexColor.blueWhaleLightPrimaryVariant, const Color(0xFF2A9D8F));
    });
    test('FC5 colors', () {
      expect(FlexColor.blueWhaleLightSecondary, const Color(0xFFF86541));
    });
    test('FC5 colors', () {
      expect(FlexColor.blueWhaleLightSecondaryVariant, const Color(0xFFF07E24));
    });
    test('FC5 colors', () {
      expect(FlexColor.blueWhaleDarkPrimary, const Color(0xFF57859D));
    });
    test('FC5 colors', () {
      expect(FlexColor.blueWhaleDarkPrimaryVariant, const Color(0xFF50A399));
    });
    test('FC5 colors', () {
      expect(FlexColor.blueWhaleDarkSecondary, const Color(0xFFFF6E48));
    });
    test('FC5 colors', () {
      expect(FlexColor.blueWhaleDarkSecondaryVariant, const Color(0xFFED7F29));
    });

    test('FC5 colors', () {
      expect(FlexColor.sanJuanBlueName, 'San Juan blue');
    });
    test('FC5 colors', () {
      expect(
        FlexColor.sanJuanBlueDescription,
        'San Juan blue and pink salmon theme',
      );
    });
    test('FC5 colors', () {
      expect(FlexColor.sanJuanBlueLightPrimary, const Color(0xFF375778));
    });
    test('FC5 colors', () {
      expect(FlexColor.sanJuanBlueLightPrimaryVariant, const Color(0xFF637E9F));
    });
    test('FC5 colors', () {
      expect(FlexColor.sanJuanBlueLightSecondary, const Color(0xFFF98D94));
    });
    test('FC5 colors', () {
      expect(
          FlexColor.sanJuanBlueLightSecondaryVariant, const Color(0xFFF2C4C7));
    });
    test('FC5 colors', () {
      expect(FlexColor.sanJuanBlueDarkPrimary, const Color(0xFF5E7691));
    });
    test('FC5 colors', () {
      expect(FlexColor.sanJuanBlueDarkPrimaryVariant, const Color(0xFF8096B1));
    });
    test('FC5 colors', () {
      expect(FlexColor.sanJuanBlueDarkSecondary, const Color(0xFFEBA1A6));
    });
    test('FC5 colors', () {
      expect(
          FlexColor.sanJuanBlueDarkSecondaryVariant, const Color(0xFFF4CFD1));
    });

    test('FC5 colors', () {
      expect(FlexColor.rosewoodName, 'Rosewood');
    });
    test('FC5 colors', () {
      expect(
        FlexColor.rosewoodDescription,
        'Rosewood red, with horses neck and driftwood theme',
      );
    });
    test('FC5 colors', () {
      expect(FlexColor.rosewoodLightPrimary, const Color(0xFF5C000E));
    });
    test('FC5 colors', () {
      expect(FlexColor.rosewoodLightPrimaryVariant, const Color(0xFF9D3E4C));
    });
    test('FC5 colors', () {
      expect(FlexColor.rosewoodLightSecondary, const Color(0xFF74540E));
    });
    test('FC5 colors', () {
      expect(FlexColor.rosewoodLightSecondaryVariant, const Color(0xFFAD8845));
    });
    test('FC5 colors', () {
      expect(FlexColor.rosewoodDarkPrimary, const Color(0xFF9C5A69));
    });
    test('FC5 colors', () {
      expect(FlexColor.rosewoodDarkPrimaryVariant, const Color(0xFFB97C88));
    });
    test('FC5 colors', () {
      expect(FlexColor.rosewoodDarkSecondary, const Color(0xFFEDCE9B));
    });
    test('FC5 colors', () {
      expect(FlexColor.rosewoodDarkSecondaryVariant, const Color(0xFFF5DFB9));
    });

    test('FC5 colors', () {
      expect(FlexColor.blumineBlueName, 'Blumine');
    });
    test('FC5 colors', () {
      expect(
        FlexColor.blumineBlueDescription,
        'Blumine, easter blue and saffron mango theme',
      );
    });
    test('FC5 colors', () {
      expect(FlexColor.blumineBlueLightPrimary, const Color(0xFF19647E));
    });
    test('FC5 colors', () {
      expect(FlexColor.blumineBlueLightPrimaryVariant, const Color(0xFF0B8691));
    });
    test('FC5 colors', () {
      expect(FlexColor.blumineBlueLightSecondary, const Color(0xFFFEC54B));
    });
    test('FC5 colors', () {
      expect(
          FlexColor.blumineBlueLightSecondaryVariant, const Color(0xFF0093C7));
    });
    test('FC5 colors', () {
      expect(FlexColor.blumineBlueDarkPrimary, const Color(0xFF82BACE));
    });
    test('FC5 colors', () {
      expect(FlexColor.blumineBlueDarkPrimaryVariant, const Color(0xFF569899));
    });
    test('FC5 colors', () {
      expect(FlexColor.blumineBlueDarkSecondary, const Color(0xFFFFD682));
    });
    test('FC5 colors', () {
      expect(
          FlexColor.blumineBlueDarkSecondaryVariant, const Color(0xFF243E4D));
    });
  });
}
