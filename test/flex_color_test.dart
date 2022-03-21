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
    const ColorScheme ml = ColorScheme.light(
      primaryContainer: Color(0xffbb86fc),
      secondaryContainer: Color(0xffcefaf8),
      tertiary: Color(0xff018786),
      tertiaryContainer: Color(0xFFA4F1EF),
    );
    test(
        'FC1.01: GIVEN FlexColor is materialLightPrimary '
        'EXPECT color is ColorScheme.light().primary', () {
      expect(FlexColor.materialLightPrimary, ml.primary);
    });
    test(
        'FC1.02-prim-con: GIVEN FlexColor is materialLightPrimaryContainer '
        'EXPECT color is ColorScheme.light().primaryContainer', () {
      expect(FlexColor.materialLightPrimaryContainer, ml.primaryContainer);
    });
    test(
        'FC1.03: GIVEN FlexColor is materialLightSecondary '
        'EXPECT color is ColorScheme.light().secondary', () {
      expect(FlexColor.materialLightSecondary, ml.secondary);
    });
    test(
        'FC1.04-sec-con: GIVEN FlexColor is materialLightSecondaryContainer '
        'EXPECT color is ColorScheme.light().primaryVariant', () {
      expect(FlexColor.materialLightSecondaryContainer, ml.secondaryContainer);
    });
    test(
        'FC1.04-tert: GIVEN FlexColor is materialLightTertiary '
        'EXPECT color is ColorScheme.light().tertiary', () {
      expect(FlexColor.materialLightTertiary, ml.tertiary);
    });
    test(
        'FC1.04-tert-con: GIVEN FlexColor is materialLightTertiaryContainer '
        'EXPECT color is ColorScheme.light().tertiary', () {
      expect(FlexColor.materialLightTertiaryContainer, ml.tertiaryContainer);
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
    const ColorScheme md = ColorScheme.dark(
      primaryContainer: Color(0xff6200ee),
      secondaryContainer: Color(0xFF005047),
      tertiary: Color(0xff03dac6),
      tertiaryContainer: Color(0xFF003E3E),
    );
    test(
        'FC2.01: GIVEN FlexColor is materialDarkPrimary '
        'EXPECT color is ColorScheme.dark().primary', () {
      expect(FlexColor.materialDarkPrimary, md.primary);
    });
    test(
        'FC2.02-prim-con: GIVEN FlexColor is materialDarkPrimaryContainer '
        'EXPECT color is ColorScheme.dark().primaryContainer', () {
      expect(FlexColor.materialDarkPrimaryContainer, md.primaryContainer);
    });
    test(
        'FC2.03: GIVEN FlexColor is materialDarkSecondary '
        'EXPECT color is ColorScheme.dark().secondary', () {
      expect(FlexColor.materialDarkSecondary, md.secondary);
    });
    test(
        'FC2.04-sec-con: GIVEN FlexColor is materialDarkSecondaryContainer '
        'EXPECT color is ColorScheme.dark().secondaryContainer', () {
      expect(FlexColor.materialDarkSecondaryContainer, md.secondaryContainer);
    });
    test(
        'FC2.04-tert: GIVEN FlexColor is materialDarkTertiary '
        'EXPECT color is ColorScheme.dark().secondaryContainer', () {
      expect(FlexColor.materialDarkTertiary, md.tertiary);
    });
    test(
        'FC2.04-tert-con: GIVEN FlexColor is materialDarkTertiary '
        'EXPECT color is ColorScheme.dark().primaryVariant', () {
      expect(FlexColor.materialDarkTertiaryContainer, md.tertiaryContainer);
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
    const ColorScheme ml = ColorScheme.highContrastLight(
      primaryContainer: Color(0xffb6b6ff),
      secondaryContainer: Color(0xffc8f9f7),
      tertiary: Color(0xff018786),
      tertiaryContainer: Color(0xFFB3F1F0),
    );
    test(
        'FC3.01: GIVEN FlexColor is materialLightPrimaryHc '
        'EXPECT color is ColorScheme.highContrastLight().primary', () {
      expect(FlexColor.materialLightPrimaryHc, ml.primary);
    });
    test(
        'FC3.02-prim-con: GIVEN FlexColor is materialLightPrimaryContainerHc '
        'EXPECT color is ColorScheme.highContrastLight().primaryVariant', () {
      expect(FlexColor.materialLightPrimaryContainerHc, ml.primaryContainer);
    });
    test(
        'FC3.03: GIVEN FlexColor is materialLightSecondaryHc '
        'EXPECT color is ColorScheme.highContrastLight().secondary', () {
      expect(FlexColor.materialLightSecondaryHc, ml.secondary);
    });
    test(
        'FC3.04-sec-con: GIVEN FlexColor is materialLightSecondaryContainerHc '
        'EXPECT color is ColorScheme.highContrastLight().secondaryContainer',
        () {
      expect(
          FlexColor.materialLightSecondaryContainerHc, ml.secondaryContainer);
    });
    test(
        'FC3.04-tert: GIVEN FlexColor is materialLightTertiaryHc '
        'EXPECT color is ColorScheme.highContrastLight().tertiary', () {
      expect(FlexColor.materialLightTertiaryHc, ml.tertiary);
    });
    test(
        'FC3.04-tert-con: GIVEN FlexColor is materialLightTertiaryContainerHc '
        'EXPECT color is ColorScheme.highContrastLight().tertiaryContainer',
        () {
      expect(FlexColor.materialLightTertiaryContainerHc, ml.tertiaryContainer);
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
    const ColorScheme md = ColorScheme.highContrastDark(
      primaryContainer: Color(0xff8a61db),
      secondaryContainer: Color(0xFF00504D),
      tertiary: Color(0xff66fff9),
      tertiaryContainer: Color(0xFF043232),
    );
    test(
        'FC4.01: GIVEN FlexColor is materialDarkPrimaryHc '
        'EXPECT color is ColorScheme.highContrastDark().primary', () {
      expect(FlexColor.materialDarkPrimaryHc, md.primary);
    });
    test(
        'FC4.02-prim-con: GIVEN FlexColor is materialDarkPrimaryContainerHc '
        'EXPECT color is ColorScheme.highContrastDark().primaryContainer', () {
      expect(FlexColor.materialDarkPrimaryContainerHc, md.primaryContainer);
    });
    test(
        'FC4.03: GIVEN FlexColor is materialDarkSecondaryHc '
        'EXPECT color is ColorScheme.highContrastDark().secondary', () {
      expect(FlexColor.materialDarkSecondaryHc, md.secondary);
    });
    test(
        'FC4.04-sec-con: GIVEN FlexColor is materialDarkSecondaryContainerHc '
        'EXPECT color is ColorScheme.highContrastDark().secondaryContainer',
        () {
      expect(FlexColor.materialDarkSecondaryContainerHc, md.secondaryContainer);
    });
    test(
        'FC4.04-tert: GIVEN FlexColor is materialDarkTertiaryHc '
        'EXPECT color is ColorScheme.highContrastDark().tertiary', () {
      expect(FlexColor.materialDarkTertiaryHc, md.tertiary);
    });
    test(
        'FC4.04-tert-con: GIVEN FlexColor is materialDarkTertiaryContainerHc '
        'EXPECT color is ColorScheme.highContrastDark().secondaryContainer',
        () {
      expect(FlexColor.materialDarkTertiaryContainerHc, md.tertiaryContainer);
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
    //
    // Light error colors.
    //
    test('FC5 colors materialLightError', () {
      expect(FlexColor.materialLightError, const Color(0xFFB00020));
    });
    test(
        'FC5 colors FlexColor lightErrorContainer with materialLightError '
        'EXPECT color is Color()', () {
      expect(
        FlexColor.lightErrorContainer(FlexColor.materialLightError),
        equals(const Color(0xfffcd8df)),
      );
    });
    test(
        'FC5 colors FlexColor is material3LightError '
        'EXPECT color is Color(0xFFBA1B1B)', () {
      expect(
        FlexColor.material3LightError,
        equals(const Color(0xFFBA1B1B)),
      );
    });
    test(
        'FC5 colors FlexColor is material3LightOnError '
        'EXPECT color is Color(0xFFFFFFFF)', () {
      expect(
        FlexColor.material3LightOnError,
        equals(const Color(0xFFFFFFFF)),
      );
    });
    test(
        'FC5 colors FlexColor is material3LightErrorContainer '
        'EXPECT color is Color(0xFFFFDAD4)', () {
      expect(
        FlexColor.material3LightErrorContainer,
        equals(const Color(0xFFFFDAD4)),
      );
    });
    test(
        'FC5 colors FlexColor is material3LightOnErrorContainer '
        'EXPECT color is Color(0xFF410001)', () {
      expect(
        FlexColor.material3LightOnErrorContainer,
        equals(const Color(0xFF410001)),
      );
    });
    //
    // Dark error colors.
    //
    test('FC5 colors materialLightErrorHc', () {
      expect(FlexColor.materialLightErrorHc, const Color(0xff790000));
    });
    test('FC5 colors materialDarkError', () {
      expect(FlexColor.materialDarkError, const Color(0xFFCF6679));
    });
    test('FC5 colors materialDarkErrorHc', () {
      expect(FlexColor.materialDarkErrorHc, const Color(0xff9b374d));
    });
    test(
        'FC5 colors FlexColor darkErrorContainer with materialDarkError '
        'EXPECT color is Color()', () {
      expect(
        FlexColor.darkErrorContainer(FlexColor.materialDarkError),
        equals(const Color(0xffb1384e)),
      );
    });
    test(
        'FC5 colors FlexColor is material3DarkError '
        'EXPECT color is Color(0xFFFFB4A9)', () {
      expect(
        FlexColor.material3DarkError,
        equals(const Color(0xFFFFB4A9)),
      );
    });
    test(
        'FC5 colors FlexColor is material3DarkOnError '
        'EXPECT color is Color(0xFF680003)', () {
      expect(
        FlexColor.material3DarkOnError,
        equals(const Color(0xFF680003)),
      );
    });
    test(
        'FC5 colors FlexColor is material3DarkErrorContainer '
        'EXPECT color is Color(0xFF930006)', () {
      expect(
        FlexColor.material3DarkErrorContainer,
        equals(const Color(0xFF930006)),
      );
    });
    test(
        'FC5 colors FlexColor is material3DarkOnErrorContainer '
        'EXPECT color is Color(0xFFFFB4A9)', () {
      expect(
        FlexColor.material3DarkOnErrorContainer,
        equals(const Color(0xFFFFB4A9)),
      );
    });
    //
    // Material 2 default theme colors.
    //
    test('FC5 colors Material default', () {
      expect(FlexColor.materialName, 'Material default');
    });
    test('FC5 colors Material default', () {
      expect(FlexColor.materialDescription,
          'Default Material 2 color theme, used in the design guide');
    });
    test('FC5 colors Material 2 default light', () {
      expect(FlexColor.materialLightPrimary, const Color(0xff6200ee));
    });
    test('FC5 colors Material 2 default light', () {
      expect(FlexColor.materialLightPrimaryContainer, const Color(0xffbb86fc));
    });
    test('FC5 colors Material 2 default light', () {
      expect(FlexColor.materialLightPrimaryVariant, const Color(0xff3700b3));
    });
    test('FC5 colors Material 2 default light', () {
      expect(FlexColor.materialLightSecondary, const Color(0xff03dac6));
    });
    test('FC5 colors Material 2 default light', () {
      expect(
          FlexColor.materialLightSecondaryContainer, const Color(0xffcefaf8));
    });
    test('FC5 colors Material 2 default light', () {
      expect(FlexColor.materialLightSecondaryVariant, const Color(0xff018786));
    });
    test('FC5 colors Material 2 default light', () {
      expect(FlexColor.materialLightTertiary, const Color(0xff018786));
    });
    test('FC5 colors Material 2 default light', () {
      expect(FlexColor.materialLightTertiaryContainer, const Color(0xFFA4F1EF));
    });
    test('FC5 colors Material 2 default light dark', () {
      expect(FlexColor.materialDarkPrimary, const Color(0xffbb86fc));
    });
    test('FC5 colors Material 2 default light dark', () {
      expect(FlexColor.materialDarkPrimaryContainer, const Color(0xff6200ee));
    });
    test('FC5 colors Material 2 default light dark', () {
      expect(FlexColor.materialDarkPrimaryVariant, const Color(0xff3700B3));
    });
    test('FC5 colors Material 2 default light dark', () {
      expect(FlexColor.materialDarkSecondary, const Color(0xff03dac6));
    });
    test('FC5 colors Material 2 default light dark', () {
      expect(FlexColor.materialDarkSecondaryContainer, const Color(0xFF005047));
    });
    test('FC5 colors Material 2 default light dark', () {
      expect(FlexColor.materialDarkSecondaryVariant, const Color(0xff03dac6));
    });
    test('FC5 colors Material 2 default light dark', () {
      expect(FlexColor.materialDarkTertiary, const Color(0xff03dac6));
    });
    test('FC5 colors Material 2 default light dark', () {
      expect(FlexColor.materialDarkTertiaryContainer, const Color(0xFF003E3E));
    });
    //
    // Material 2 default high contrast theme colors.
    //
    test('FC5 colors Material 2 high contrast', () {
      expect(FlexColor.materialHcName, 'Material high contrast');
    });
    test('FC5 colors Material 2 high contrast', () {
      expect(FlexColor.materialHcDescription,
          'High contrast Material 2 design guide theme');
    });
    test('FC5 colors Material 2 high contrast light', () {
      expect(FlexColor.materialLightPrimaryHc, const Color(0xff0000ba));
    });
    test('FC5 colors Material 2 high contrast light', () {
      expect(
          FlexColor.materialLightPrimaryContainerHc, const Color(0xffb6b6ff));
    });
    test('FC5 colors Material 2 high contrast light', () {
      expect(FlexColor.materialLightPrimaryVariantHc, const Color(0xff000088));
    });
    test('FC5 colors Material 2 high contrast light', () {
      expect(FlexColor.materialLightSecondaryHc, const Color(0xff66fff9));
    });
    test('FC5 colors Material 2 high contrast light', () {
      expect(
          FlexColor.materialLightSecondaryContainerHc, const Color(0xFFC8F9F7));
    });
    test('FC5 colors Material 2 high contrast light', () {
      expect(
          FlexColor.materialLightSecondaryVariantHc, const Color(0xff018786));
    });
    test('FC5 colors Material 2 high contrast light', () {
      expect(FlexColor.materialLightTertiaryHc, const Color(0xff018786));
    });
    test('FC5 colors Material 2 high contrast light', () {
      expect(
          FlexColor.materialLightTertiaryContainerHc, const Color(0xFFB3F1F0));
    });
    test('FC5 colors Material 2 high contrast dark', () {
      expect(FlexColor.materialDarkPrimaryHc, const Color(0xffefb7ff));
    });
    //
    test('FC5 colors Material 2 high contrast dark', () {
      expect(FlexColor.materialDarkPrimaryContainerHc, const Color(0xff8a61db));
    });
    test('FC5 colors Material 2 high contrast dark', () {
      expect(FlexColor.materialDarkPrimaryVariantHc, const Color(0xffbe9eff));
    });
    test('FC5 colors Material 2 high contrast dark', () {
      expect(FlexColor.materialDarkSecondaryHc, const Color(0xff66fff9));
    });
    test('FC5 colors Material 2 high contrast dark', () {
      expect(FlexColor.materialDarkSecondaryHc, const Color(0xff66fff9));
    });
    test('FC5 colors Material 2 high contrast dark', () {
      expect(
          FlexColor.materialDarkSecondaryContainerHc, const Color(0xFF00504D));
    });
    test('FC5 colors Material 2 high contrast dark', () {
      expect(FlexColor.materialDarkSecondaryVariantHc, const Color(0xff66fff9));
    });
    test('FC5 colors Material 2 high contrast dark', () {
      expect(FlexColor.materialDarkTertiaryHc, const Color(0xff66fff9));
    });
    test('FC5 colors Material 2 high contrast dark', () {
      expect(
          FlexColor.materialDarkTertiaryContainerHc, const Color(0xFF043232));
    });
    //
    test('FC5 colors Blue delight', () {
      expect(FlexColor.blueName, 'Blue delight');
    });
    test('FC5 colors Blue delight', () {
      expect(FlexColor.blueDescription,
          'Blue color theme, based on Material blue and light blue colors');
    });
    test('FC5 colors Blue delight light', () {
      expect(FlexColor.blueLightPrimary, const Color(0xFF1565C0));
    });
    test('FC5 colors Blue delight light', () {
      expect(FlexColor.blueLightPrimaryContainer, const Color(0xFF90CAF9));
    });
    test('FC5 colors Blue delight light', () {
      expect(FlexColor.blueLightPrimaryVariant, const Color(0xFF0D47A1));
    });
    test('FC5 colors Blue delight light', () {
      expect(FlexColor.blueLightSecondary, const Color(0xFF039BE5));
    });
    test('FC5 colors Blue delight light', () {
      expect(FlexColor.blueLightSecondaryContainer, const Color(0xFFCBE6FF));
    });
    test('FC5 colors Blue delight light', () {
      expect(FlexColor.blueLightSecondaryVariant, const Color(0xFF0277BD));
    });
    test('FC5 colors Blue delight light', () {
      expect(FlexColor.blueLightTertiary, const Color(0xFF0277BD));
    });
    test('FC5 colors Blue delight light', () {
      expect(FlexColor.blueLightTertiaryContainer, const Color(0xFFBEDCFF));
    });
    test('FC5 colors Blue delight dark', () {
      expect(FlexColor.blueDarkPrimary, const Color(0xFF90CAF9));
    });
    test('FC5 colors Blue delight dark', () {
      expect(FlexColor.blueDarkPrimaryContainer, const Color(0xFF0D47A1));
    });
    test('FC5 colors Blue delight dark', () {
      expect(FlexColor.blueDarkPrimaryVariant, const Color(0xFF64B5F6));
    });
    test('FC5 colors Blue delight dark', () {
      expect(FlexColor.blueDarkSecondary, const Color(0xFF81D4FA));
    });
    test('FC5 colors Blue delight dark', () {
      expect(FlexColor.blueDarkSecondaryContainer, const Color(0xFF004B73));
    });
    test('FC5 colors Blue delight dark', () {
      expect(FlexColor.blueDarkSecondaryVariant, const Color(0xFFE1F5FE));
    });
    test('FC5 colors Blue delight dark', () {
      expect(FlexColor.blueDarkTertiary, const Color(0xFFE1F5FE));
    });
    test('FC5 colors Blue delight dark', () {
      expect(FlexColor.blueDarkTertiaryContainer, const Color(0xFF1A567D));
    });
    test('FC5 colors Indigo nights', () {
      expect(FlexColor.indigoName, 'Indigo nights');
    });
    test('FC5 colors Indigo nights', () {
      expect(
          FlexColor.indigoDescription,
          'Indigo color theme, based on Material indigo and deep '
          'purple colors');
    });
    test('FC5 colors Indigo nights light', () {
      expect(FlexColor.indigoLightPrimary, const Color(0xFF303F9F));
    });
    test('FC5 colors Indigo nights light', () {
      expect(FlexColor.indigoLightPrimaryContainer, const Color(0xFFAEB9F4));
    });
    test('FC5 colors Indigo nights light', () {
      expect(FlexColor.indigoLightPrimaryVariant, const Color(0xFF1A237E));
    });
    test('FC5 colors Indigo nights light', () {
      expect(FlexColor.indigoLightSecondary, const Color(0xFF512DA8));
    });
    test('FC5 colors Indigo nights light', () {
      expect(FlexColor.indigoLightSecondaryContainer, const Color(0xFFE9DDFF));
    });
    test('FC5 colors Indigo nights light', () {
      expect(FlexColor.indigoLightSecondaryVariant, const Color(0xFF311B92));
    });
    test('FC5 colors Indigo nights light', () {
      expect(FlexColor.indigoLightTertiary, const Color(0xFF311B92));
    });
    test('FC5 colors Indigo nights light', () {
      expect(FlexColor.indigoLightTertiaryContainer, const Color(0xFFD1C5FF));
    });
    test('FC5 colors Indigo nights dark', () {
      expect(FlexColor.indigoDarkPrimary, const Color(0xFF7986CB));
    });
    test('FC5 colors Indigo nights dark', () {
      expect(FlexColor.indigoDarkPrimaryContainer, const Color(0xFF283593));
    });
    test('FC5 colors Indigo nights dark', () {
      expect(FlexColor.indigoDarkPrimaryVariant, const Color(0xFF5C6BC0));
    });
    test('FC5 colors Indigo nights dark', () {
      expect(FlexColor.indigoDarkSecondary, const Color(0xFF9575CD));
    });
    test('FC5 colors Indigo nights dark', () {
      expect(FlexColor.indigoDarkSecondaryContainer, const Color(0xFF502CA7));
    });
    test('FC5 colors Indigo nights dark', () {
      expect(FlexColor.indigoDarkSecondaryVariant, const Color(0xFF7E57C2));
    });
    test('FC5 colors Indigo nights dark', () {
      expect(FlexColor.indigoDarkTertiary, const Color(0xFF7E57C2));
    });
    test('FC5 colors Indigo nights dark', () {
      expect(FlexColor.indigoDarkTertiaryContainer, const Color(0xFF4433A4));
    });
    test('FC5 colors Hippie blue', () {
      expect(FlexColor.hippieBlueName, 'Hippie blue');
    });
    test('FC5 colors Hippie blue', () {
      expect(FlexColor.hippieBlueDescription,
          'Hippie blue with surfie green and chock coral pink theme');
    });
    test('FC5 colors Hippie blue light', () {
      expect(FlexColor.hippieBlueLightPrimary, const Color(0xFF4C9BBA));
    });
    test('FC5 colors Hippie blue light', () {
      expect(
          FlexColor.hippieBlueLightPrimaryContainer, const Color(0xFF9CEBEB));
    });
    test('FC5 colors Hippie blue light', () {
      expect(FlexColor.hippieBlueLightPrimaryVariant, const Color(0xFF078282));
    });
    test('FC5 colors Hippie blue light', () {
      expect(FlexColor.hippieBlueLightSecondary, const Color(0xFFFF4F58));
    });
    test('FC5 colors Hippie blue light', () {
      expect(
          FlexColor.hippieBlueLightSecondaryContainer, const Color(0xFFFFDAD7));
    });
    test('FC5 colors Hippie blue light', () {
      expect(FlexColor.hippieBlueLightSecondaryVariant,
          FlexColor.hippieBlueLightTertiary);
    });
    test('FC5 colors Hippie blue light', () {
      expect(FlexColor.hippieBlueLightTertiary, const Color(0xFFBF4A50));
    });
    test('FC5 colors Hippie blue light', () {
      expect(
          FlexColor.hippieBlueLightTertiaryContainer, const Color(0xFFFCBDBD));
    });
    test('FC5 colors Hippie blue dark', () {
      expect(FlexColor.hippieBlueDarkPrimary, const Color(0xFF669DB3));
    });
    test('FC5 colors Hippie blue dark', () {
      expect(FlexColor.hippieBlueDarkPrimaryContainer, const Color(0xFF078282));
    });
    test('FC5 colors Hippie blue dark', () {
      expect(FlexColor.hippieBlueDarkPrimaryVariant, const Color(0xFF208E8E));
    });
    test('FC5 colors Hippie blue dark', () {
      expect(FlexColor.hippieBlueDarkSecondary, const Color(0xFFFC6E75));
    });
    test('FC5 colors Hippie blue dark', () {
      expect(
          FlexColor.hippieBlueDarkSecondaryContainer, const Color(0xFF92001A));
    });
    test('FC5 colors Hippie blue dark', () {
      expect(FlexColor.hippieBlueDarkSecondaryVariant,
          FlexColor.hippieBlueDarkTertiary);
    });
    test('FC5 colors Hippie blue dark', () {
      expect(FlexColor.hippieBlueDarkTertiary, const Color(0xFFF75F67));
    });
    test('FC5 colors Hippie blue dark', () {
      expect(
          FlexColor.hippieBlueDarkTertiaryContainer, const Color(0xFF580810));
    });

    test('FC5 colors Aqua blue', () {
      expect(FlexColor.aquaBlueName, 'Aqua blue');
    });
    test('FC5 colors Aqua blue', () {
      expect(FlexColor.aquaBlueDescription, 'Aqua tropical ocean blue theme');
    });
    test('FC5 colors Aqua blue light', () {
      expect(FlexColor.aquaBlueLightPrimary, const Color(0xFF35A0CB));
    });
    test('FC5 colors Aqua blue light', () {
      expect(FlexColor.aquaBlueLightPrimaryContainer, const Color(0xFF71D3ED));
    });
    test('FC5 colors Aqua blue light', () {
      expect(FlexColor.aquaBlueLightPrimaryVariant, const Color(0xFF45B4D2));
    });
    test('FC5 colors Aqua blue light', () {
      expect(FlexColor.aquaBlueLightSecondary, const Color(0xFF89D1C8));
    });
    test('FC5 colors Aqua blue light', () {
      expect(
          FlexColor.aquaBlueLightSecondaryContainer, const Color(0xFF91F4E8));
    });
    test('FC5 colors Aqua blue light', () {
      expect(FlexColor.aquaBlueLightSecondaryVariant,
          FlexColor.aquaBlueLightTertiary);
    });
    test('FC5 colors Aqua blue light', () {
      expect(FlexColor.aquaBlueLightTertiary, const Color(0xFF61D4D4));
    });
    test('FC5 colors Aqua blue light', () {
      expect(FlexColor.aquaBlueLightTertiaryContainer, const Color(0xFF8FF3F2));
    });
    test('FC5 colors Aqua blue dark', () {
      expect(FlexColor.aquaBlueDarkPrimary, const Color(0xFF5DB3D5));
    });
    test('FC5 colors Aqua blue dark', () {
      expect(FlexColor.aquaBlueDarkPrimaryContainer, const Color(0xFF297EA0));
    });
    test('FC5 colors Aqua blue dark', () {
      expect(FlexColor.aquaBlueDarkPrimaryVariant, const Color(0xFF71D3ED));
    });
    test('FC5 colors Aqua blue dark', () {
      expect(FlexColor.aquaBlueDarkSecondary, const Color(0xFFA1E9DF));
    });
    test('FC5 colors Aqua blue dark', () {
      expect(FlexColor.aquaBlueDarkSecondaryContainer, const Color(0xFF005049));
    });
    test('FC5 colors Aqua blue dark', () {
      expect(FlexColor.aquaBlueDarkSecondaryVariant,
          FlexColor.aquaBlueDarkTertiary);
    });
    test('FC5 colors Aqua blue dark', () {
      expect(FlexColor.aquaBlueDarkTertiary, const Color(0xFFA0E5E5));
    });
    test('FC5 colors Aqua blue dark', () {
      expect(FlexColor.aquaBlueDarkTertiaryContainer, const Color(0xFF004F50));
    });

    test('FC5 colors Brand blues', () {
      expect(FlexColor.brandBlueName, 'Brand blues');
    });
    test('FC5 colors Brand blues', () {
      expect(FlexColor.brandBlueDescription,
          'Blue colors used in well known brand themes');
    });
    test('FC5 colors Brand blues light', () {
      expect(FlexColor.brandBlueLightPrimary, const Color(0xFF3B5998));
    });
    test('FC5 colors Brand blues light', () {
      expect(FlexColor.brandBlueLightPrimaryContainer, const Color(0xFFA8CAE6));
    });
    test('FC5 colors Brand blues light', () {
      expect(FlexColor.brandBlueLightPrimaryVariant, const Color(0xFF3F729B));
    });
    test('FC5 colors Brand blues light', () {
      expect(FlexColor.brandBlueLightSecondary, const Color(0xFF55ACEE));
    });
    test('FC5 colors Brand blues light', () {
      expect(
          FlexColor.brandBlueLightSecondaryContainer, const Color(0xFFCBE5FF));
    });
    test('FC5 colors Brand blues light', () {
      expect(FlexColor.brandBlueLightSecondaryVariant,
          FlexColor.brandBlueLightTertiary);
    });
    test('FC5 colors Brand blues light', () {
      expect(FlexColor.brandBlueLightTertiary, const Color(0xFF4285F4));
    });
    test('FC5 colors Brand blues light', () {
      expect(
          FlexColor.brandBlueLightTertiaryContainer, const Color(0xFFD6E2FF));
    });
    test('FC5 colors Brand blues dark', () {
      expect(FlexColor.brandBlueDarkPrimary, const Color(0xFF8B9DC3));
    });
    test('FC5 colors Brand blues dark', () {
      expect(FlexColor.brandBlueDarkPrimaryContainer, const Color(0xFF3B5998));
    });
    test('FC5 colors Brand blues dark', () {
      expect(FlexColor.brandBlueDarkPrimaryVariant, const Color(0xFF799CB9));
    });
    test('FC5 colors Brand blues dark', () {
      expect(FlexColor.brandBlueDarkSecondary, const Color(0xFFA0D1F5));
    });
    test('FC5 colors Brand blues dark', () {
      expect(
          FlexColor.brandBlueDarkSecondaryContainer, const Color(0xFF004B75));
    });
    test('FC5 colors Brand blues dark', () {
      expect(FlexColor.brandBlueDarkSecondaryVariant,
          FlexColor.brandBlueDarkTertiary);
    });
    test('FC5 colors Brand blues dark', () {
      expect(FlexColor.brandBlueDarkTertiary, const Color(0xFF88B2F8));
    });
    test('FC5 colors Brand blues dark', () {
      expect(FlexColor.brandBlueDarkTertiaryContainer, const Color(0xFF004397));
    });

    test('FC5 colors Deep blue sea', () {
      expect(FlexColor.deepBlueName, 'Deep blue sea');
    });
    test('FC5 colors Deep blue sea', () {
      expect(FlexColor.deepBlueDescription, 'Dark deep blue sea color theme');
    });
    test('FC5 colors Deep blue sea light', () {
      expect(FlexColor.deepBlueLightPrimary, const Color(0xFF223A5E));
    });
    test('FC5 colors Deep blue sea light', () {
      expect(FlexColor.deepBlueLightPrimaryContainer, const Color(0xFF97BAEA));
    });
    test('FC5 colors Deep blue sea light', () {
      expect(FlexColor.deepBlueLightPrimaryVariant, const Color(0xFF1B2E4B));
    });
    test('FC5 colors Deep blue sea light', () {
      expect(FlexColor.deepBlueLightSecondary, const Color(0xFF144955));
    });
    test('FC5 colors Deep blue sea light', () {
      expect(
          FlexColor.deepBlueLightSecondaryContainer, const Color(0xFFA9EDFF));
    });
    test('FC5 colors Deep blue sea light', () {
      expect(FlexColor.deepBlueLightSecondaryVariant,
          FlexColor.deepBlueLightTertiary);
    });
    test('FC5 colors Deep blue sea light', () {
      expect(FlexColor.deepBlueLightTertiary, const Color(0xFF208399));
    });
    test('FC5 colors Deep blue sea light', () {
      expect(FlexColor.deepBlueLightTertiaryContainer, const Color(0xFFCCF3FF));
    });
    test('FC5 colors Deep blue sea dark', () {
      expect(FlexColor.deepBlueDarkPrimary, const Color(0xFF748BAC));
    });
    test('FC5 colors Deep blue sea dark', () {
      expect(FlexColor.deepBlueDarkPrimaryContainer, const Color(0xFF1B2E4B));
    });
    test('FC5 colors Deep blue sea dark', () {
      expect(FlexColor.deepBlueDarkPrimaryVariant, const Color(0xFF7FA1D0));
    });
    test('FC5 colors Deep blue sea dark', () {
      expect(FlexColor.deepBlueDarkSecondary, const Color(0xFF539EAF));
    });
    test('FC5 colors Deep blue sea dark', () {
      expect(FlexColor.deepBlueDarkSecondaryContainer, const Color(0xFF004E5D));
    });
    test('FC5 colors Deep blue sea dark', () {
      expect(FlexColor.deepBlueDarkSecondaryVariant,
          FlexColor.deepBlueDarkTertiary);
    });
    test('FC5 colors Deep blue sea dark', () {
      expect(FlexColor.deepBlueDarkTertiary, const Color(0xFF219AB5));
    });
    test('FC5 colors Deep blue sea dark', () {
      expect(FlexColor.deepBlueDarkTertiaryContainer, const Color(0xFF0F5B6A));
    });

    test('FC5 colors Pink sakura', () {
      expect(FlexColor.sakuraName, 'Pink sakura');
    });
    test('FC5 colors Pink sakura', () {
      expect(
        FlexColor.sakuraDescription,
        'Pink color theme, based on sakura cherry blossom like colors',
      );
    });
    test('FC5 colors Pink sakura light', () {
      expect(FlexColor.sakuraLightPrimary, const Color(0xFFCE5B78));
    });
    test('FC5 colors Pink sakura light', () {
      expect(FlexColor.sakuraLightPrimaryContainer, const Color(0xFFe8b5ce));
    });
    test('FC5 colors Pink sakura light', () {
      expect(FlexColor.sakuraLightPrimaryVariant, const Color(0xffe4446c));
    });
    test('FC5 colors Pink sakura light', () {
      expect(FlexColor.sakuraLightSecondary, const Color(0xFFfbae9d));
    });
    test('FC5 colors Pink sakura light', () {
      expect(FlexColor.sakuraLightSecondaryContainer, const Color(0xFFFFDAD1));
    });
    test('FC5 colors Pink sakura light', () {
      expect(
          FlexColor.sakuraLightSecondaryVariant, FlexColor.sakuraLightTertiary);
    });
    test('FC5 colors Pink sakura light', () {
      expect(FlexColor.sakuraLightTertiary, const Color(0xFFF39682));
    });
    test('FC5 colors Pink sakura light', () {
      expect(FlexColor.sakuraLightTertiaryContainer, const Color(0xFFFFCFC3));
    });
    test('FC5 colors Pink sakura dark', () {
      expect(FlexColor.sakuraDarkPrimary, const Color(0xFFeec4d8));
    });
    test('FC5 colors Pink sakura dark', () {
      expect(FlexColor.sakuraDarkPrimaryContainer, const Color(0xFFCE5B78));
    });
    test('FC5 colors Pink sakura dark', () {
      expect(FlexColor.sakuraDarkSecondary, const Color(0xFFF5D6C6));
    });
    test('FC5 colors Pink sakura dark', () {
      expect(FlexColor.sakuraDarkSecondaryContainer, const Color(0xFFEBA689));
    });
    test('FC5 colors Pink sakura dark', () {
      expect(
          FlexColor.sakuraDarkSecondaryVariant, FlexColor.sakuraDarkTertiary);
    });
    test('FC5 colors Pink sakura dark', () {
      expect(FlexColor.sakuraDarkTertiary, const Color(0xFFf7e0d4));
    });
    test('FC5 colors Pink sakura dark', () {
      expect(FlexColor.sakuraDarkTertiaryContainer, const Color(0xFFEEBDA8));
    });

    test('FC5 colors Oh Mandy red', () {
      expect(FlexColor.mandyRedName, 'Oh Mandy red');
    });
    test('FC5 colors Oh Mandy red', () {
      expect(
        FlexColor.mandyRedDescription,
        'Mandy red and Viking blue inspired red theme',
      );
    });
    test('FC5 colors Oh Mandy red light', () {
      expect(FlexColor.mandyRedLightPrimary, const Color(0xFFCD5758));
    });
    test('FC5 colors Oh Mandy red light', () {
      expect(FlexColor.mandyRedLightPrimaryContainer, const Color(0xFFE49797));
    });
    test('FC5 colors Oh Mandy red light', () {
      expect(FlexColor.mandyRedLightPrimaryVariant, const Color(0xFFA23556));
    });
    test('FC5 colors Oh Mandy red light', () {
      expect(FlexColor.mandyRedLightSecondary, const Color(0xFF57C8D3));
    });
    test('FC5 colors Oh Mandy red light', () {
      expect(
          FlexColor.mandyRedLightSecondaryContainer, const Color(0xFF90F2FC));
    });
    test('FC5 colors Oh Mandy red light', () {
      expect(FlexColor.mandyRedLightTertiary, const Color(0xFF69B9CD));
    });
    test('FC5 colors Oh Mandy red light', () {
      expect(FlexColor.mandyRedLightTertiaryContainer, const Color(0xFFA6EDFF));
    });
    test('FC5 colors Oh Mandy red dark', () {
      expect(FlexColor.mandyRedDarkPrimary, const Color(0xFFDA8585));
    });
    test('FC5 colors Oh Mandy red dark', () {
      expect(FlexColor.mandyRedDarkPrimaryContainer, const Color(0xFFC05253));
    });
    test('FC5 colors Oh Mandy red dark', () {
      expect(FlexColor.mandyRedDarkPrimaryVariant, const Color(0xFFAB4967));
    });
    test('FC5 colors Oh Mandy red dark', () {
      expect(FlexColor.mandyRedDarkSecondary, const Color(0xFF68CDD7));
    });
    test('FC5 colors Oh Mandy red dark', () {
      expect(FlexColor.mandyRedDarkSecondaryContainer, const Color(0xFF037481));
    });
    test('FC5 colors Oh Mandy red dark', () {
      expect(FlexColor.mandyRedDarkSecondaryVariant,
          FlexColor.mandyRedDarkTertiary);
    });
    test('FC5 colors Oh Mandy red dark', () {
      expect(FlexColor.mandyRedDarkTertiary, const Color(0xFF85C6D6));
    });
    test('FC5 colors Oh Mandy red dark', () {
      expect(FlexColor.mandyRedDarkTertiaryContainer, const Color(0xFF21859E));
    });

    test('FC5 colors Red tornado', () {
      expect(FlexColor.redName, 'Red tornado');
    });
    test('FC5 colors Red tornado', () {
      expect(
        FlexColor.redDescription,
        'Red color theme, based on Material red and pink colors',
      );
    });
    test('FC5 colors Red tornado light', () {
      expect(FlexColor.redLightPrimary, const Color(0xFFC62828));
    });
    test('FC5 colors Red tornado light', () {
      expect(FlexColor.redLightPrimaryContainer, const Color(0xFFFFCDD2));
    });
    test('FC5 colors Red tornado light', () {
      expect(FlexColor.redLightPrimaryVariant, const Color(0xFFB71C1C));
    });
    test('FC5 colors Red tornado light', () {
      expect(FlexColor.redLightSecondary, const Color(0xFFAD1457));
    });
    test('FC5 colors Red tornado light', () {
      expect(FlexColor.redLightSecondaryContainer, const Color(0xFFF8BBD0));
    });
    test('FC5 colors Red tornado light', () {
      expect(FlexColor.redLightSecondaryVariant, FlexColor.redLightTertiary);
    });
    test('FC5 colors Red tornado light', () {
      expect(FlexColor.redLightTertiary, const Color(0xFFC2185B));
    });
    test('FC5 colors Red tornado light', () {
      expect(FlexColor.redLightTertiaryContainer, const Color(0xFFFCE4EC));
    });
    test('FC5 colors Red tornado dark', () {
      expect(FlexColor.redDarkPrimary, const Color(0xFFEF9A9A));
    });
    test('FC5 colors Red tornado dark', () {
      expect(FlexColor.redDarkPrimaryContainer, const Color(0xFFB71C1C));
    });
    test('FC5 colors Red tornado dark', () {
      expect(FlexColor.redDarkPrimaryVariant, const Color(0xFFE57373));
    });
    test('FC5 colors Red tornado dark', () {
      expect(FlexColor.redDarkSecondary, const Color(0xFFF8BBD0));
    });
    test('FC5 colors Red tornado dark', () {
      expect(FlexColor.redDarkSecondaryContainer, const Color(0xFFAD1457));
    });
    test('FC5 colors Red tornado dark', () {
      expect(FlexColor.redDarkSecondaryVariant, FlexColor.redDarkTertiary);
    });
    test('FC5 colors Red tornado dark', () {
      expect(FlexColor.redDarkTertiary, const Color(0xFFFCE4EC));
    });
    test('FC5 colors Red tornado dark', () {
      expect(FlexColor.redDarkTertiaryContainer, const Color(0xFFC2185B));
    });

    test('FC5 colors Red red wine', () {
      expect(FlexColor.redWineName, 'Red red wine');
    });
    test('FC5 colors Red red wine', () {
      expect(
        FlexColor.redWineDescription,
        'Red color theme, based on red wine like colors',
      );
    });
    test('FC5 colors Red red wine light', () {
      expect(FlexColor.redWineLightPrimary, const Color(0xFF9B1B30));
    });
    test('FC5 colors Red red wine light', () {
      expect(FlexColor.redWineLightPrimaryContainer, const Color(0xFFEDBAC2));
    });
    test('FC5 colors Red red wine light', () {
      expect(FlexColor.redWineLightPrimaryVariant, const Color(0xFF6C1322));
    });
    test('FC5 colors Red red wine light', () {
      expect(FlexColor.redWineLightSecondary, const Color(0xFFA70043));
    });
    test('FC5 colors Red red wine light', () {
      expect(FlexColor.redWineLightSecondaryContainer, const Color(0xFFFFD9DF));
    });
    test('FC5 colors Red red wine light', () {
      expect(FlexColor.redWineLightSecondaryVariant,
          FlexColor.redWineLightTertiary);
    });
    test('FC5 colors Red red wine light', () {
      expect(FlexColor.redWineLightTertiary, const Color(0xFFA4121C));
    });
    test('FC5 colors Red red wine light', () {
      expect(FlexColor.redWineLightTertiaryContainer, const Color(0xFFFFDAD5));
    });
    test('FC5 colors Red red wine dark', () {
      expect(FlexColor.redWineDarkPrimary, const Color(0xFFE4677C));
    });
    test('FC5 colors Red red wine dark', () {
      expect(FlexColor.redWineDarkPrimaryContainer, const Color(0xFF9B1B30));
    });
    test('FC5 colors Red red wine dark', () {
      expect(FlexColor.redWineDarkPrimaryVariant, const Color(0xFFB25867));
    });
    test('FC5 colors Red red wine dark', () {
      expect(FlexColor.redWineDarkSecondary, const Color(0xFFC87A98));
    });
    test('FC5 colors Red red wine dark', () {
      expect(FlexColor.redWineDarkSecondaryContainer, const Color(0xFF910037));
    });
    test('FC5 colors Red red wine dark', () {
      expect(
          FlexColor.redWineDarkSecondaryVariant, FlexColor.redWineDarkTertiary);
    });
    test('FC5 colors Red red wine dark', () {
      expect(FlexColor.redWineDarkTertiary, const Color(0xFFBD545B));
    });
    test('FC5 colors Red red wine dark', () {
      expect(FlexColor.redWineDarkTertiaryContainer, const Color(0xFF930012));
    });

    test('FC5 colors Purple brown', () {
      expect(FlexColor.purpleBrownName, 'Purple brown');
    });
    test('FC5 colors Purple brown', () {
      expect(
        FlexColor.purpleBrownDescription,
        'Purple brown tinted aubergine and eggplant colored theme',
      );
    });
    test('FC5 colors Purple brown light', () {
      expect(FlexColor.purpleBrownLightPrimary, const Color(0xFF450A0F));
    });
    test('FC5 colors Purple brown light', () {
      expect(
          FlexColor.purpleBrownLightPrimaryContainer, const Color(0xFFB9A6A8));
    });
    test('FC5 colors Purple brown light', () {
      expect(FlexColor.purpleBrownLightPrimaryVariant, const Color(0xFF682A2C));
    });
    test('FC5 colors Purple brown light', () {
      expect(FlexColor.purpleBrownLightSecondary, const Color(0xFF60234F));
    });
    test('FC5 colors Purple brown light', () {
      expect(FlexColor.purpleBrownLightSecondaryContainer,
          const Color(0xFFE9CEDD));
    });
    test('FC5 colors Purple brown light', () {
      expect(FlexColor.purpleBrownLightSecondaryVariant,
          FlexColor.purpleBrownLightTertiary);
    });
    test('FC5 colors Purple brown light', () {
      expect(FlexColor.purpleBrownLightTertiary, const Color(0xFF4A0635));
    });
    test('FC5 colors Purple brown light', () {
      expect(
          FlexColor.purpleBrownLightTertiaryContainer, const Color(0xFFE3B0C5));
    });
    test('FC5 colors Purple brown dark', () {
      expect(FlexColor.purpleBrownDarkPrimary, const Color(0xFFA98085));
    });
    test('FC5 colors Purple brown dark', () {
      expect(
          FlexColor.purpleBrownDarkPrimaryContainer, const Color(0xFF682A2C));
    });
    test('FC5 colors Purple brown dark', () {
      expect(FlexColor.purpleBrownDarkPrimaryVariant, const Color(0xFF73494A));
    });
    test('FC5 colors Purple brown dark', () {
      expect(FlexColor.purpleBrownDarkSecondary, const Color(0xFF975384));
    });
    test('FC5 colors Purple brown dark', () {
      expect(
          FlexColor.purpleBrownDarkSecondaryContainer, const Color(0xFF6A2357));
    });
    test('FC5 colors Purple brown dark', () {
      expect(FlexColor.purpleBrownDarkSecondaryVariant,
          FlexColor.purpleBrownDarkTertiary);
    });
    test('FC5 colors Purple brown dark', () {
      expect(FlexColor.purpleBrownDarkTertiary, const Color(0xFF5F4C5A));
    });
    test('FC5 colors Purple brown dark', () {
      expect(
          FlexColor.purpleBrownDarkTertiaryContainer, const Color(0xFF501A3C));
    });

    test('FC5 colors', () {
      expect(FlexColor.greenName, 'Green forest');
    });
    test('FC5 colors Green forest', () {
      expect(
        FlexColor.greenDescription,
        'Green color theme, based on Material green and cyan colors',
      );
    });
    test('FC5 colors Green forest', () {
      expect(FlexColor.greenLightPrimary, const Color(0xFF2E7D32));
    });
    test('FC5 colors Green forest light', () {
      expect(FlexColor.greenLightPrimaryContainer, const Color(0xFFA5D6A7));
    });
    test('FC5 colors Green forest light', () {
      expect(FlexColor.greenLightPrimaryVariant, const Color(0xFF1B5E20));
    });
    test('FC5 colors Green forest light', () {
      expect(FlexColor.greenLightSecondary, const Color(0xFF00695C));
    });
    test('FC5 colors Green forest light', () {
      expect(FlexColor.greenLightSecondaryContainer, const Color(0xFF7DCEC4));
    });
    test('FC5 colors Green forest light', () {
      expect(
          FlexColor.greenLightSecondaryVariant, FlexColor.greenLightTertiary);
    });
    test('FC5 colors Green forest light', () {
      expect(FlexColor.greenLightTertiary, const Color(0xFF004D40));
    });
    test('FC5 colors Green forest light', () {
      expect(FlexColor.greenLightTertiaryContainer, const Color(0xFF59B1A1));
    });
    test('FC5 colors Green forest dark', () {
      expect(FlexColor.greenDarkPrimary, const Color(0xFFA5D6A7));
    });
    test('FC5 colors Green forest dark', () {
      expect(FlexColor.greenDarkPrimaryContainer, const Color(0xFF1B5E20));
    });
    test('FC5 colors Green forest dark', () {
      expect(FlexColor.greenDarkPrimaryVariant, const Color(0xFF81C784));
    });
    test('FC5 colors Green forest dark', () {
      expect(FlexColor.greenDarkSecondary, const Color(0xFF80CBC4));
    });
    test('FC5 colors Green forest dark', () {
      expect(FlexColor.greenDarkSecondaryContainer, const Color(0xFF00695C));
    });
    test('FC5 colors Green forest dark', () {
      expect(FlexColor.greenDarkSecondaryVariant, FlexColor.greenDarkTertiary);
    });
    test('FC5 colors Green forest dark', () {
      expect(FlexColor.greenDarkTertiary, const Color(0xFF4DB6AC));
    });
    test('FC5 colors Green forest dark', () {
      expect(FlexColor.greenDarkTertiaryContainer, const Color(0xFF05514A));
    });

    test('FC5 colors Green money', () {
      expect(FlexColor.moneyName, 'Green money');
    });
    test('FC5 colors Green money', () {
      expect(
        FlexColor.moneyDescription,
        'Green money and finance style color theme',
      );
    });
    test('FC5 colors Green money light', () {
      expect(FlexColor.moneyLightPrimary, const Color(0xFF264E36));
    });
    test('FC5 colors Green money light', () {
      expect(FlexColor.moneyLightPrimaryContainer, const Color(0xFF94BDA5));
    });
    test('FC5 colors Green money light', () {
      expect(FlexColor.moneyLightPrimaryVariant, const Color(0xFF224430));
    });
    test('FC5 colors Green money light', () {
      expect(FlexColor.moneyLightSecondary, const Color(0xFF797b3a));
    });
    test('FC5 colors Green money light', () {
      expect(FlexColor.moneyLightSecondaryContainer, const Color(0xffbfc0a0));
    });
    test('FC5 colors Green money light', () {
      expect(
          FlexColor.moneyLightSecondaryVariant, FlexColor.moneyLightTertiary);
    });
    test('FC5 colors Green money light', () {
      expect(FlexColor.moneyLightTertiary, const Color(0xFF555729));
    });
    test('FC5 colors Green money light', () {
      expect(FlexColor.moneyLightTertiaryContainer, const Color(0xFF9EA089));
    });
    test('FC5 colors Green money dark', () {
      expect(FlexColor.moneyDarkPrimary, const Color(0xFF7AB893));
    });
    test('FC5 colors Green money dark', () {
      expect(FlexColor.moneyDarkPrimaryContainer, const Color(0xFF224430));
    });
    test('FC5 colors Green money dark', () {
      expect(FlexColor.moneyDarkPrimaryVariant, const Color(0xFF6AAF85));
    });
    test('FC5 colors Green money dark', () {
      expect(FlexColor.moneyDarkSecondary, const Color(0xFFd5d6a8));
    });
    test('FC5 colors Green money dark', () {
      expect(FlexColor.moneyDarkSecondaryContainer, const Color(0xFF515402));
    });
    test('FC5 colors Green money dark', () {
      expect(FlexColor.moneyDarkSecondaryVariant, FlexColor.moneyDarkTertiary);
    });
    test('FC5 colors Green money dark', () {
      expect(FlexColor.moneyDarkTertiary, const Color(0xFFbbbe74));
    });
    test('FC5 colors Green money dark', () {
      expect(FlexColor.moneyDarkTertiaryContainer, const Color(0xFF404204));
    });

    test('FC5 colors Green jungle', () {
      expect(FlexColor.jungleName, 'Green jungle');
    });
    test('FC5 colorsGreen jungle', () {
      expect(
        FlexColor.jungleDescription,
        'Green jungle and rain forest color theme',
      );
    });
    test('FC5 colors Green jungle light', () {
      expect(FlexColor.jungleLightPrimary, const Color(0xFF004E15));
    });
    test('FC5 colors Green jungle light', () {
      expect(FlexColor.jungleLightPrimaryContainer, const Color(0xFF8FB99B));
    });
    test('FC5 colors Green jungle light', () {
      expect(FlexColor.jungleLightPrimaryVariant, const Color(0xFF00411F));
    });
    test('FC5 colors Green jungle light', () {
      expect(FlexColor.jungleLightSecondary, const Color(0xFF007256));
    });
    test('FC5 colors Green jungle light', () {
      expect(FlexColor.jungleLightSecondaryContainer, const Color(0xFF83BCAD));
    });
    test('FC5 colors Green jungle light', () {
      expect(
          FlexColor.jungleLightSecondaryVariant, FlexColor.jungleLightTertiary);
    });
    test('FC5 colors Green jungle light', () {
      expect(FlexColor.jungleLightTertiary, const Color(0xFF295300));
    });
    test('FC5 colors Green jungle light', () {
      expect(FlexColor.jungleLightTertiaryContainer, const Color(0xFF8FAA78));
    });
    test('FC5 colors Green jungle dark', () {
      expect(FlexColor.jungleDarkPrimary, const Color(0xFF519E67));
    });
    test('FC5 colors Green jungle dark', () {
      expect(FlexColor.jungleDarkPrimaryContainer, const Color(0xFF27683A));
    });
    test('FC5 colors Green jungle dark', () {
      expect(FlexColor.jungleDarkPrimaryVariant, const Color(0xFF3F9368));
    });
    test('FC5 colors Green jungle dark', () {
      expect(FlexColor.jungleDarkSecondary, const Color(0xFF479985));
    });
    test('FC5 colors Green jungle dark', () {
      expect(FlexColor.jungleDarkSecondaryContainer, const Color(0xFF00513B));
    });
    test('FC5 colors Green jungle dark', () {
      expect(
          FlexColor.jungleDarkSecondaryVariant, FlexColor.jungleDarkTertiary);
    });
    test('FC5 colors Green jungle dark', () {
      expect(FlexColor.jungleDarkTertiary, const Color(0xFF73A497));
    });
    test('FC5 colors Green jungle dark', () {
      expect(FlexColor.jungleDarkTertiaryContainer, const Color(0xFF275000));
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
      expect(FlexColor.greyLawLightPrimaryContainer, const Color(0xFFB0BEC5));
    });
    test('FC5 colors', () {
      expect(FlexColor.greyLawLightSecondary, const Color(0xFF521D82));
    });
    test('FC5 colors', () {
      expect(FlexColor.greyLawLightTertiary, const Color(0xFF2C314F));
    });
    test('FC5 colors', () {
      expect(FlexColor.greyLawDarkPrimary, const Color(0xFF90A4AE));
    });
    test('FC5 colors', () {
      expect(FlexColor.greyLawDarkPrimaryContainer, const Color(0xFF37474F));
    });
    test('FC5 colors', () {
      expect(FlexColor.greyLawDarkSecondary, const Color(0xFF815AA3));
    });
    test('FC5 colors', () {
      expect(FlexColor.greyLawDarkTertiary, const Color(0xFF373D5C));
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
      expect(FlexColor.wasabiLightPrimaryContainer, const Color(0xFFD7DFB2));
    });
    test('FC5 colors', () {
      expect(FlexColor.wasabiLightSecondary, const Color(0xFF893789));
    });
    test('FC5 colors', () {
      expect(FlexColor.wasabiLightTertiary, const Color(0xFF5E3974));
    });
    test('FC5 colors', () {
      expect(FlexColor.wasabiDarkPrimary, const Color(0xFFC3CB77));
    });
    test('FC5 colors', () {
      expect(FlexColor.wasabiDarkPrimaryContainer, const Color(0xFF586621));
    });
    test('FC5 colors', () {
      expect(FlexColor.wasabiDarkSecondary, const Color(0xFFDF9ADF));
    });
    test('FC5 colors', () {
      expect(FlexColor.wasabiDarkTertiary, const Color(0xFFA664CD));
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
      expect(FlexColor.goldLightPrimaryContainer, const Color(0xFFf2c18c));
    });
    test('FC5 colors', () {
      expect(FlexColor.goldLightSecondary, const Color(0xFFEF6C00));
    });
    test('FC5 colors', () {
      expect(FlexColor.goldLightTertiary, const Color(0xFFb36832));
    });
    test('FC5 colors', () {
      expect(FlexColor.goldDarkPrimary, const Color(0xFFeda85e));
    });
    test('FC5 colors', () {
      expect(FlexColor.goldDarkPrimaryContainer, const Color(0xFFb86914));
    });
    test('FC5 colors', () {
      expect(FlexColor.goldDarkSecondary, const Color(0xFFd28f60));
    });
    test('FC5 colors', () {
      expect(FlexColor.goldDarkTertiary, const Color(0xFFddab88));
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
      expect(FlexColor.mangoLightPrimaryContainer, const Color(0xFFDEB059));
    });
    test('FC5 colors', () {
      expect(FlexColor.mangoLightSecondary, const Color(0xFF8D9440));
    });
    test('FC5 colors', () {
      expect(FlexColor.mangoLightTertiary, const Color(0xFF616247));
    });
    test('FC5 colors', () {
      expect(FlexColor.mangoDarkPrimary, const Color(0xFFDEB059));
    });
    test('FC5 colors', () {
      expect(FlexColor.mangoDarkPrimaryContainer, const Color(0xFFC78D20));
    });
    test('FC5 colors', () {
      expect(FlexColor.mangoDarkSecondary, const Color(0xFFAFB479));
    });
    test('FC5 colors', () {
      expect(FlexColor.mangoDarkTertiary, const Color(0xFF81816C));
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
      expect(FlexColor.amberLightPrimaryContainer, const Color(0xFFFFCC80));
    });
    test('FC5 colors', () {
      expect(FlexColor.amberLightSecondary, const Color(0xFF2979FF));
    });
    test('FC5 colors', () {
      expect(FlexColor.amberLightTertiary, const Color(0xFF2962FF));
    });
    test('FC5 colors', () {
      expect(FlexColor.amberDarkPrimary, const Color(0xFFFFB300));
    });
    test('FC5 colors', () {
      expect(FlexColor.amberDarkPrimaryContainer, const Color(0xFFC87200));
    });
    test('FC5 colors', () {
      expect(FlexColor.amberDarkSecondary, const Color(0xFF82B1FF));
    });
    test('FC5 colors', () {
      expect(FlexColor.amberDarkTertiary, const Color(0xFF448AFF));
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
          FlexColor.vesuviusBurnLightPrimaryContainer, const Color(0xFFD1AA99));
    });
    test('FC5 colors', () {
      expect(FlexColor.vesuviusBurnLightSecondary, const Color(0xFF185358));
    });
    test('FC5 colors', () {
      expect(FlexColor.vesuviusBurnLightTertiary, const Color(0xFF144447));
    });
    test('FC5 colors', () {
      expect(FlexColor.vesuviusBurnDarkPrimary, const Color(0xFFD17D53));
    });
    test('FC5 colors', () {
      expect(
          FlexColor.vesuviusBurnDarkPrimaryContainer, const Color(0xFF874E32));
    });
    test('FC5 colors', () {
      expect(FlexColor.vesuviusBurnDarkSecondary, const Color(0xFF5B8A8E));
    });
    test('FC5 colors', () {
      expect(FlexColor.vesuviusBurnDarkTertiary, const Color(0xFF3A7175));
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
      expect(
          FlexColor.deepPurpleLightPrimaryContainer, const Color(0xFFD1C4E9));
    });
    test('FC5 colors', () {
      expect(FlexColor.deepPurpleLightSecondary, const Color(0xFF0091EA));
    });
    test('FC5 colors', () {
      expect(FlexColor.deepPurpleLightTertiary, const Color(0xFF00B0FF));
    });
    test('FC5 colors', () {
      expect(FlexColor.deepPurpleDarkPrimary, const Color(0xFFB39DDB));
    });
    test('FC5 colors', () {
      expect(FlexColor.deepPurpleDarkPrimaryContainer, const Color(0xFF7E57C2));
    });
    test('FC5 colors', () {
      expect(FlexColor.deepPurpleDarkSecondary, const Color(0xFF80D8FF));
    });
    test('FC5 colors', () {
      expect(FlexColor.deepPurpleDarkTertiary, const Color(0xFF40C4FF));
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
      expect(FlexColor.ebonyClayLightPrimaryContainer, const Color(0xFF9BA7CF));
    });
    test('FC5 colors', () {
      expect(FlexColor.ebonyClayLightSecondary, const Color(0xFF006B54));
    });
    test('FC5 colors', () {
      expect(FlexColor.ebonyClayLightTertiary, const Color(0xFF004B3B));
    });
    test('FC5 colors', () {
      expect(FlexColor.ebonyClayDarkPrimary, const Color(0xFF4E597D));
    });
    test('FC5 colors', () {
      expect(FlexColor.ebonyClayDarkPrimaryContainer, const Color(0xFF202541));
    });
    test('FC5 colors', () {
      expect(FlexColor.ebonyClayDarkSecondary, const Color(0xFF4BA390));
    });
    test('FC5 colors', () {
      expect(FlexColor.ebonyClayDarkTertiary, const Color(0xFF3D8475));
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
      expect(FlexColor.barossaLightPrimaryContainer, const Color(0xFFBDA5B1));
    });
    test('FC5 colors', () {
      expect(FlexColor.barossaLightSecondary, const Color(0xFF00341A));
    });
    test('FC5 colors', () {
      expect(FlexColor.barossaLightTertiary, const Color(0xFF124C2F));
    });
    test('FC5 colors', () {
      expect(FlexColor.barossaDarkPrimary, const Color(0xFF94667E));
    });
    test('FC5 colors', () {
      expect(FlexColor.barossaDarkPrimaryContainer, const Color(0xFF4E0029));
    });
    test('FC5 colors', () {
      expect(FlexColor.barossaDarkSecondary, const Color(0xFF6B9882));
    });
    test('FC5 colors', () {
      expect(FlexColor.barossaDarkTertiary, const Color(0xFF599B7B));
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
      expect(FlexColor.sharkLightPrimaryContainer, const Color(0xFFB0B2C0));
    });
    test('FC5 colors', () {
      expect(FlexColor.sharkLightSecondary, const Color(0xFFFB8122));
    });
    test('FC5 colors', () {
      expect(FlexColor.sharkLightTertiary, const Color(0xFFEA9654));
    });
    test('FC5 colors', () {
      expect(FlexColor.sharkDarkPrimary, const Color(0xFF777A7E));
    });
    test('FC5 colors', () {
      expect(FlexColor.sharkDarkPrimaryContainer, const Color(0xFF313C42));
    });
    test('FC5 colors', () {
      expect(FlexColor.sharkDarkSecondary, const Color(0xFFFCB075));
    });
    test('FC5 colors', () {
      expect(FlexColor.sharkDarkTertiary, const Color(0xFFEFB383));
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
      expect(FlexColor.bigStoneLightPrimaryContainer, const Color(0xFFB1C0DD));
    });
    test('FC5 colors', () {
      expect(FlexColor.bigStoneLightSecondary, const Color(0xFFE59A18));
    });
    test('FC5 colors', () {
      expect(FlexColor.bigStoneLightTertiary, const Color(0xFFF0B03F));
    });
    test('FC5 colors', () {
      expect(FlexColor.bigStoneDarkPrimary, const Color(0xFF60748A));
    });
    test('FC5 colors', () {
      expect(FlexColor.bigStoneDarkPrimaryContainer, const Color(0xFF1A2C42));
    });
    test('FC5 colors', () {
      expect(FlexColor.bigStoneDarkSecondary, const Color(0xFFEBB251));
    });
    test('FC5 colors', () {
      expect(FlexColor.bigStoneDarkTertiary, const Color(0xFFF4CA7E));
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
      expect(FlexColor.damaskLightPrimaryContainer, const Color(0xFFECC9BD));
    });
    test('FC5 colors', () {
      expect(FlexColor.damaskLightSecondary, const Color(0xFF373A36));
    });
    test('FC5 colors', () {
      expect(FlexColor.damaskLightTertiary, const Color(0xFF343E32));
    });
    test('FC5 colors', () {
      expect(FlexColor.damaskDarkPrimary, const Color(0xFFDA9882));
    });
    test('FC5 colors', () {
      expect(FlexColor.damaskDarkPrimaryContainer, const Color(0xFFC96646));
    });
    test('FC5 colors', () {
      expect(FlexColor.damaskDarkSecondary, const Color(0xFF767D75));
    });
    test('FC5 colors', () {
      expect(FlexColor.damaskDarkTertiary, const Color(0xFF839081));
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
      expect(
          FlexColor.bahamaBlueLightPrimaryContainer, const Color(0xFFA6CCED));
    });
    test('FC5 colors', () {
      expect(FlexColor.bahamaBlueLightSecondary, const Color(0xFFDD520F));
    });
    test('FC5 colors', () {
      expect(FlexColor.bahamaBlueLightTertiary, const Color(0xFF7CC8F8));
    });
    test('FC5 colors', () {
      expect(FlexColor.bahamaBlueDarkPrimary, const Color(0xFF4585B5));
    });
    test('FC5 colors', () {
      expect(FlexColor.bahamaBlueDarkPrimaryContainer, const Color(0xFF095D9E));
    });
    test('FC5 colors', () {
      expect(FlexColor.bahamaBlueDarkSecondary, const Color(0xFFE57C4A));
    });
    test('FC5 colors', () {
      expect(FlexColor.bahamaBlueDarkTertiary, const Color(0xFF9CD5F9));
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
          FlexColor.mallardGreenLightPrimaryContainer, const Color(0xFFA3B58A));
    });
    test('FC5 colors', () {
      expect(FlexColor.mallardGreenLightSecondary, const Color(0xFFD34B4B));
    });
    test('FC5 colors', () {
      expect(FlexColor.mallardGreenLightTertiary, const Color(0xFF959D33));
    });
    test('FC5 colors', () {
      expect(FlexColor.mallardGreenDarkPrimary, const Color(0xFF808E79));
    });
    test('FC5 colors', () {
      expect(
          FlexColor.mallardGreenDarkPrimaryContainer, const Color(0xFF2D4421));
    });
    test('FC5 colors', () {
      expect(FlexColor.mallardGreenDarkSecondary, const Color(0xFFE18686));
    });
    test('FC5 colors', () {
      expect(FlexColor.mallardGreenDarkTertiary, const Color(0xFFC3C87A));
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
      expect(FlexColor.espressoLightPrimaryContainer, const Color(0xFFC7BCAC));
    });
    test('FC5 colors', () {
      expect(FlexColor.espressoLightSecondary, const Color(0xFFE3B964));
    });
    test('FC5 colors', () {
      expect(FlexColor.espressoLightTertiary, const Color(0xFFF5E9C9));
    });
    test('FC5 colors', () {
      expect(FlexColor.espressoDarkPrimary, const Color(0xFF8D7F7D));
    });
    test('FC5 colors', () {
      expect(FlexColor.espressoDarkPrimaryContainer, const Color(0xFF452F2B));
    });
    test('FC5 colors', () {
      expect(FlexColor.espressoDarkSecondary, const Color(0xFFEED6A6));
    });
    test('FC5 colors', () {
      expect(FlexColor.espressoDarkTertiary, const Color(0xFFF8ECD4));
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
      expect(
          FlexColor.outerSpaceLightPrimaryContainer, const Color(0xFF9EC4D4));
    });
    test('FC5 colors', () {
      expect(FlexColor.outerSpaceLightSecondary, const Color(0xFFD2600A));
    });
    test('FC5 colors', () {
      expect(FlexColor.outerSpaceLightTertiary, const Color(0xFF93A0A9));
    });
    test('FC5 colors', () {
      expect(FlexColor.outerSpaceDarkPrimary, const Color(0xFF486A71));
    });
    test('FC5 colors', () {
      expect(FlexColor.outerSpaceDarkPrimaryContainer, const Color(0xFF1F3339));
    });
    test('FC5 colors', () {
      expect(FlexColor.outerSpaceDarkSecondary, const Color(0xFFDB823F));
    });
    test('FC5 colors', () {
      expect(FlexColor.outerSpaceDarkTertiary, const Color(0xFFAAB4BB));
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
      expect(FlexColor.blueWhaleLightPrimaryContainer, const Color(0xFF8EDBCE));
    });
    test('FC5 colors', () {
      expect(FlexColor.blueWhaleLightSecondary, const Color(0xFFF86541));
    });
    test('FC5 colors', () {
      expect(FlexColor.blueWhaleLightTertiary, const Color(0xFFF07E24));
    });
    test('FC5 colors', () {
      expect(FlexColor.blueWhaleDarkPrimary, const Color(0xFF57859D));
    });
    test('FC5 colors', () {
      expect(FlexColor.blueWhaleDarkPrimaryContainer, const Color(0xFF2A9D8F));
    });
    test('FC5 colors', () {
      expect(FlexColor.blueWhaleDarkSecondary, const Color(0xFFFF6E48));
    });
    test('FC5 colors', () {
      expect(FlexColor.blueWhaleDarkTertiary, const Color(0xFFED7F29));
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
      expect(
          FlexColor.sanJuanBlueLightPrimaryContainer, const Color(0xFFA4C4ED));
    });
    test('FC5 colors', () {
      expect(FlexColor.sanJuanBlueLightSecondary, const Color(0xFFF98D94));
    });
    test('FC5 colors', () {
      expect(FlexColor.sanJuanBlueLightTertiary, const Color(0xFFF2C4C7));
    });
    test('FC5 colors', () {
      expect(FlexColor.sanJuanBlueDarkPrimary, const Color(0xFF5E7691));
    });
    test('FC5 colors', () {
      expect(
          FlexColor.sanJuanBlueDarkPrimaryContainer, const Color(0xFF375778));
    });
    test('FC5 colors', () {
      expect(FlexColor.sanJuanBlueDarkSecondary, const Color(0xFFEBA1A6));
    });
    test('FC5 colors', () {
      expect(FlexColor.sanJuanBlueDarkTertiary, const Color(0xFFF4CFD1));
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
      expect(FlexColor.rosewoodLightPrimaryContainer, const Color(0xFFF4CACE));
    });
    test('FC5 colors', () {
      expect(FlexColor.rosewoodLightSecondary, const Color(0xFF74540E));
    });
    test('FC5 colors', () {
      expect(FlexColor.rosewoodLightTertiary, const Color(0xFFAD8845));
    });
    test('FC5 colors', () {
      expect(FlexColor.rosewoodDarkPrimary, const Color(0xFF9C5A69));
    });
    test('FC5 colors', () {
      expect(FlexColor.rosewoodDarkPrimaryContainer, const Color(0xFF5F111E));
    });
    test('FC5 colors', () {
      expect(FlexColor.rosewoodDarkSecondary, const Color(0xFFEDCE9B));
    });
    test('FC5 colors', () {
      expect(FlexColor.rosewoodDarkTertiary, const Color(0xFFF5DFB9));
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
      expect(
          FlexColor.blumineBlueLightPrimaryContainer, const Color(0xFFA1CBCF));
    });
    test('FC5 colors', () {
      expect(FlexColor.blumineBlueLightSecondary, const Color(0xFFFEB716));
    });
    test('FC5 colors', () {
      expect(FlexColor.blumineBlueLightTertiary, const Color(0xFF0093C7));
    });
    test('FC5 colors', () {
      expect(FlexColor.blumineBlueDarkPrimary, const Color(0xFF82BACE));
    });
    test('FC5 colors', () {
      expect(
          FlexColor.blumineBlueDarkPrimaryContainer, const Color(0xFF04666F));
    });
    test('FC5 colors', () {
      expect(FlexColor.blumineBlueDarkSecondary, const Color(0xFFFFD682));
    });
    test('FC5 colors', () {
      expect(FlexColor.blumineBlueDarkTertiary, const Color(0xFF243E4D));
    });

    //-----

    test('FC5 colors Flutter Dash', () {
      expect(FlexColor.dashBlueName, 'Flutter Dash');
    });
    test('FC5 colors Flutter Dash', () {
      expect(
        FlexColor.dashBlueDescription,
        'Flutter Dash wallpaper based theme',
      );
    });
    test('FC5 colors Flutter Dash light', () {
      expect(FlexColor.dashBlueLightPrimary, const Color(0xFF4496E0));
    });
    test('FC5 colors Flutter Dash light', () {
      expect(FlexColor.dashBlueLightPrimaryContainer, const Color(0xFFB4E6FF));
    });
    test('FC5 colors Flutter Dash light', () {
      expect(FlexColor.dashBlueLightSecondary, const Color(0xFF202B6D));
    });
    test('FC5 colors Flutter Dash light', () {
      expect(
          FlexColor.dashBlueLightSecondaryContainer, const Color(0xFF99CCF9));
    });
    test('FC5 colors Flutter Dash light', () {
      expect(FlexColor.dashBlueLightTertiary, const Color(0xFF514239));
    });
    test('FC5 colors Flutter Dash light', () {
      expect(FlexColor.dashBlueLightTertiaryContainer, const Color(0xFFBAA99D));
    });
    test('FC5 colors Flutter Dash dark', () {
      expect(FlexColor.dashBlueDarkPrimary, const Color(0xFFB4E6FF));
    });
    test('FC5 colors Flutter Dash dark', () {
      expect(FlexColor.dashBlueDarkPrimaryContainer, const Color(0xFF1E8FDB));
    });
    test('FC5 colors Flutter Dash dark', () {
      expect(FlexColor.dashBlueDarkSecondary, const Color(0xFF99CCF9));
    });
    test('FC5 colors Flutter Dash dark', () {
      expect(FlexColor.dashBlueDarkSecondaryContainer, const Color(0xFF202B6D));
    });
    test('FC5 colors Flutter Dash dark', () {
      expect(FlexColor.dashBlueDarkTertiary, const Color(0xFFBAA99D));
    });
    test('FC5 colors Flutter Dash dark', () {
      expect(FlexColor.dashBlueDarkTertiaryContainer, const Color(0xFF514239));
    });

    //-----

    test('FC5 colors M3 Baseline', () {
      expect(FlexColor.materialBaselineName, 'M3 baseline');
    });
    test('FC5 colors M3 Baseline', () {
      expect(
        FlexColor.materialBaselineDescription,
        'Material guide 3 baseline based theme',
      );
    });
    test('FC5 colors M3 Baseline light', () {
      expect(FlexColor.materialBaselineLightPrimary, const Color(0xFF6750A4));
    });
    test('FC5 colors M3 Baseline light', () {
      expect(FlexColor.materialBaselineLightPrimaryContainer,
          const Color(0xFFEADDFF));
    });
    test('FC5 colors M3 Baseline light', () {
      expect(FlexColor.materialBaselineLightSecondary, const Color(0xFF625B71));
    });
    test('FC5 colors M3 Baseline light', () {
      expect(FlexColor.materialBaselineLightSecondaryContainer,
          const Color(0xFFE8DEF8));
    });
    test('FC5 colors M3 Baseline light', () {
      expect(FlexColor.materialBaselineLightTertiary, const Color(0xFF7D5260));
    });
    test('FC5 colors M3 Baseline light', () {
      expect(FlexColor.materialBaselineLightTertiaryContainer,
          const Color(0xFFFFD8E4));
    });
    test('FC5 colors M3 Baseline dark', () {
      expect(FlexColor.materialBaselineDarkPrimary, const Color(0xFFD0BCFF));
    });
    test('FC5 colors M3 Baseline dark', () {
      expect(FlexColor.materialBaselineDarkPrimaryContainer,
          const Color(0xFF4F378B));
    });
    test('FC5 colors M3 Baseline dark', () {
      expect(FlexColor.materialBaselineDarkSecondary, const Color(0xFFCCC2DC));
    });
    test('FC5 colors M3 Baseline dark', () {
      expect(FlexColor.materialBaselineDarkSecondaryContainer,
          const Color(0xFF4A4458));
    });
    test('FC5 colors M3 Baseline dark', () {
      expect(FlexColor.materialBaselineDarkTertiary, const Color(0xFFEFB8C8));
    });
    test('FC5 colors M3 Baseline dark', () {
      expect(FlexColor.materialBaselineDarkTertiaryContainer,
          const Color(0xFF633B48));
    });

    //-----

    test('FC5 colors Verdun green', () {
      expect(FlexColor.verdunHemlockName, 'Verdun green');
    });
    test('FC5 colors Verdun green', () {
      expect(
        FlexColor.verdunHemlockDescription,
        'Material guide 3 verdun and mineral green with hemlock',
      );
    });
    test('FC5 colors Verdun green light', () {
      expect(FlexColor.verdunHemlockLightPrimary, const Color(0xFF616200));
    });
    test('FC5 colors Verdun green light', () {
      expect(FlexColor.verdunHemlockLightPrimaryContainer,
          const Color(0xFFE7E885));
    });
    test('FC5 colors Verdun green light', () {
      expect(FlexColor.verdunHemlockLightSecondary, const Color(0xFF606042));
    });
    test('FC5 colors Verdun green light', () {
      expect(FlexColor.verdunHemlockLightSecondaryContainer,
          const Color(0xFFE6E4C0));
    });
    test('FC5 colors Verdun green light', () {
      expect(FlexColor.verdunHemlockLightTertiary, const Color(0xFF3D6657));
    });
    test('FC5 colors Verdun green light', () {
      expect(FlexColor.verdunHemlockLightTertiaryContainer,
          const Color(0xFFBFECD9));
    });
    test('FC5 colors Verdun green dark', () {
      expect(FlexColor.verdunHemlockDarkPrimary, const Color(0xFFCBCC58));
    });
    test('FC5 colors Verdun green dark', () {
      expect(
          FlexColor.verdunHemlockDarkPrimaryContainer, const Color(0xFF494A00));
    });
    test('FC5 colors Verdun green dark', () {
      expect(FlexColor.verdunHemlockDarkSecondary, const Color(0xFFC9C8A4));
    });
    test('FC5 colors Verdun green dark', () {
      expect(FlexColor.verdunHemlockDarkSecondaryContainer,
          const Color(0xFF48482D));
    });
    test('FC5 colors Verdun green dark', () {
      expect(FlexColor.verdunHemlockDarkTertiary, const Color(0xFFA4D0BE));
    });
    test('FC5 colors Verdun green dark', () {
      expect(FlexColor.verdunHemlockDarkTertiaryContainer,
          const Color(0xFF254E40));
    });

    //-----

    test('FC5 colors Dell genoa green', () {
      expect(FlexColor.dellGenoaGreenName, 'Dell genoa green');
    });
    test('FC5 colors Dell genoa green', () {
      expect(
        FlexColor.dellGenoaGreenDescription,
        'Material guide 3 theme with dell, axolotl and genoa greens',
      );
    });
    test('FC5 colors Dell genoa green light', () {
      expect(FlexColor.dellGenoaGreenLightPrimary, const Color(0xFF386A20));
    });
    test('FC5 colors Dell genoa green light', () {
      expect(FlexColor.dellGenoaGreenLightPrimaryContainer,
          const Color(0xFFB7F397));
    });
    test('FC5 colors Dell genoa green light', () {
      expect(FlexColor.dellGenoaGreenLightSecondary, const Color(0xFF55624C));
    });
    test('FC5 colors Dell genoa green light', () {
      expect(FlexColor.dellGenoaGreenLightSecondaryContainer,
          const Color(0xFFD9E7CB));
    });
    test('FC5 colors Dell genoa green light', () {
      expect(FlexColor.dellGenoaGreenLightTertiary, const Color(0xFF19686A));
    });
    test('FC5 colors Dell genoa green light', () {
      expect(FlexColor.dellGenoaGreenLightTertiaryContainer,
          const Color(0xFFA8EFF0));
    });
    test('FC5 colors Dell genoa green dark', () {
      expect(FlexColor.dellGenoaGreenDarkPrimary, const Color(0xFF9CD67D));
    });
    test('FC5 colors Dell genoa green dark', () {
      expect(FlexColor.dellGenoaGreenDarkPrimaryContainer,
          const Color(0xFF205107));
    });
    test('FC5 colors Dell genoa green dark', () {
      expect(FlexColor.dellGenoaGreenDarkSecondary, const Color(0xFFBDCBB0));
    });
    test('FC5 colors Dell genoa green dark', () {
      expect(FlexColor.dellGenoaGreenDarkSecondaryContainer,
          const Color(0xFF3E4A36));
    });
    test('FC5 colors Dell genoa green dark', () {
      expect(FlexColor.dellGenoaGreenDarkTertiary, const Color(0xFFA0CFD0));
    });
    test('FC5 colors Dell genoa green dark', () {
      expect(FlexColor.dellGenoaGreenDarkTertiaryContainer,
          const Color(0xFF1E4E4F));
    });
  });
}
