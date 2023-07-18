import 'dart:ui';

import 'flex_extensions.dart';
import 'flex_scheme.dart';
import 'flex_scheme_color.dart';
import 'flex_scheme_data.dart';

// ignore_for_file: comment_references

/// Defines colors, names and color schemes used to make maps and a list of
/// predefined [FlexSchemeData] objects that can be used by FlexColorScheme.
///
/// There are also const values for every color value and FlexSchemeData of
/// every scheme.
class FlexColor {
  /// Private constructor for the FlexColor static class to prevent it from
  /// being instantiated or extended.
  FlexColor._(); // coverage:ignore-line

  /// Material 2 standard color for light surface.
  static const Color materialLightSurface = Color(0xFFFFFFFF);

  /// Material 2 standard color for light background.
  static const Color materialLightBackground = Color(0xFFFFFFFF);

  /// Material 2 standard color for light scaffold background.
  static const Color materialLightScaffoldBackground = Color(0xFFFFFFFF);

  /// Material 2 standard color for dark surface.
  static const Color materialDarkSurface = Color(0xFF121212);

  /// Material 2 standard color for dark background.
  static const Color materialDarkBackground = Color(0xFF121212);

  /// Material 2 standard color for dark scaffold background.
  static const Color materialDarkScaffoldBackground = Color(0xFF121212);

  // Custom static constants for surface, background, scaffold and background
  // colors. Some surface colors are slightly modified from the Material
  // standards and different constants are used so we could tune them,
  // without touching the material standard surface values.

  /// FlexColors standard for light surface, same as material.
  static const Color lightSurface = Color(0xFFFFFFFF);

  /// FlexColors standard color for light surfaceVariant.
  static const Color lightSurfaceVariant = Color(0xFFEEEEEE);

  /// FlexColors standard for light background.
  ///
  /// A very light grey, lighter than grey50, used for better blend effect when
  /// blending in primary color with the surface color.
  static const Color lightBackground = Color(0xFFFDFDFD);

  /// FlexColors standard for light scaffold background, just white as Material.
  static const Color lightScaffoldBackground = Color(0xFFFFFFFF);

  /// FlexColors standard for dark surfaces.
  ///
  /// Slightly darker than its Material counter part, so we can blend in
  /// more primary color without getting too light too soon.
  static const Color darkSurface = Color(0xFF111111);

  /// FlexColors standard color for dark surfaceVariant.
  static const Color darkSurfaceVariant = Color(0xFF323232);

  /// FlexColors standard for dark background.
  ///
  /// Slightly darker than its Material counter part, so we can blend in
  /// more primary color without getting too light too soon.
  ///
  /// It is also a tad darker then [darkSurface] because we will be blending
  /// in more of the primary color into it. Making its starting value darker
  /// allows us to do so without it getting too light when we blend in more
  /// primary color.
  static const Color darkBackground = Color(0xFF101010);

  /// FlexColors standard for dark scaffold background, same as Material.
  static const Color darkScaffoldBackground = Color(0xFF121212);

  // The Material standard error colors for light and dark modes as defined by
  // https://material.io/design/color/the-color-system.html#color-theme-creation.
  // As they were July 11, 2020.

  /// Material 2 standard light error color.
  static const Color materialLightError = Color(0xFFB00020);

  /// Light error container color computer from give light error color.
  static Color lightErrorContainer(Color lightError) =>
      lightError.brighten(25).blend(const Color(0xFFFFFFFF), 80);

  /// Material 3 standard light error color.
  ///
  /// INFO: v0.1.5 of material_color_utilities changed this color.
  /// Before version 0.1.5. the color value was:
  /// static const Color material3LightError = Color(0xFFBA1B1B);
  /// In version 0.1.5 and due to a small braking algo change, it is:
  static const Color material3LightError = Color(0xFFBA1A1A);

  /// Material 3 standard light onError color.
  static const Color material3LightOnError = Color(0xFFFFFFFF);

  /// Material 3 standard light error container color.
  ///
  /// INFO: v0.1.5 of material_color_utilities changed this color.
  /// Before version 0.1.5. the color value was:
  /// static const Color material3LightErrorContainer = Color(0xFFFFDAD4);
  /// In version 0.1.5 and due to a small braking algo change, it is:
  static const Color material3LightErrorContainer = Color(0xFFFFDAD6);

  /// Material 3 standard light on error container color.
  ///
  /// INFO: v0.1.5 of material_color_utilities changed this color.
  /// Before version 0.1.5. the color value was:
  /// static const Color material3LightOnErrorContainer = Color(0xFF410001);
  static const Color material3LightOnErrorContainer = Color(0xFF410002);

  /// Material 2 standard dark error color.
  static const Color materialDarkError = Color(0xFFCF6679);

  /// Dark error container color computed from given dark error color.
  static Color darkErrorContainer(Color darkError) => darkError.darken(15);

  /// Material 3 standard dark error color.
  ///
  /// INFO: v0.1.5 of material_color_utilities changed this color.
  /// Before version 0.1.5. the color value was:
  /// static const Color material3DarkError = Color(0xFFFFB4A9);
  static const Color material3DarkError = Color(0xFFFFB4AB);

  /// Material 3 standard dark onError color.
  ///
  /// INFO: v0.1.5 of material_color_utilities changed this color.
  /// Before version 0.1.5. the color value was:
  /// static const Color material3DarkOnError = Color(0xFF680003);
  static const Color material3DarkOnError = Color(0xFF690005);

  /// Material 3 standard dark error container color.
  ///
  /// INFO: v0.1.5 of material_color_utilities changed this color.
  /// Before version 0.1.5. the color value was:
  /// static const Color material3DarkErrorContainer = Color(0xFF930006);
  static const Color material3DarkErrorContainer = Color(0xFF93000A);

  /// Material 3 standard dark on error container color.
  ///
  /// INFO: v0.1.5 of material_color_utilities changed this color.
  /// Before version 0.1.5. the color value was:
  /// static const Color material3DarkOnErrorContainer = Color(0xFFFFB4A9);
  static const Color material3DarkOnErrorContainer = Color(0xFFFFB4AB);

  // High contrast Material 2 standard error colors as per those used in Flutter
  // ColorScheme.highContrastLight and ColorScheme.highContrastDark

  /// Material 2 standard high contrast light error color.
  static const Color materialLightErrorHc = Color(0xff790000);

  /// Material 2 standard high contrast dark error color.
  static const Color materialDarkErrorHc = Color(0xff9b374d);

  // The primary and variant Material 2 theme colors as defined by:
  // https://material.io/design/color/the-color-system.html#color-theme-creation.

  /// English name of the standard Material theme.
  static const String materialName = 'Material default';

  /// English description of the standard Material theme.
  static const String materialDescription =
      'Default Material 2 color theme, used in the design guide';

  /// Material 2 standard default color for light primary color.
  static const Color materialLightPrimary = Color(0xff6200ee);

  /// Material 2 standard default color for light primary container color.
  static const Color materialLightPrimaryContainer = Color(0xffbb86fc);

  /// Material 2 standard default color for light primary container color.
  ///
  /// Old Material 2 color system, prefer [materialLightPrimaryContainer].
  static const Color materialLightPrimaryVariant = Color(0xff3700b3);

  /// Material 2 standard default color for light secondary color.
  static const Color materialLightSecondary = Color(0xff03dac6);

  /// Material 2 standard default color for light secondary container color.
  static const Color materialLightSecondaryContainer = Color(0xFFCEFAF8);

  /// Material 2 standard default color for light tertiary color.
  static const Color materialLightTertiary = Color(0xff018786);

  /// Material 2 standard default color for light tertiary color.
  static const Color materialLightTertiaryContainer = Color(0xFFA4F1EF);

  /// Material 2 standard default color for light secondary variant color.
  ///
  /// Old Material 2 color system, prefer [materialLightTertiary] instead.
  static const Color materialLightSecondaryVariant = materialLightTertiary;

  /// Material 2 standard default color for dark primary color.
  static const Color materialDarkPrimary = Color(0xffbb86fc);

  /// Material 2 standard default color for dark primary container color.
  static const Color materialDarkPrimaryContainer = Color(0xff6200ee);

  /// Material 2 standard default color for dark primary variant color.
  ///
  /// Old Material 2 color system, prefer [materialDarkPrimaryContainer].
  static const Color materialDarkPrimaryVariant = Color(0xff3700B3);

  /// Material 2 standard default color for dark secondary color, the
  /// color value is same as the light secondary color.
  static const Color materialDarkSecondary = Color(0xff03dac6);

  /// Material 2 dark secondary container
  static const Color materialDarkSecondaryContainer = Color(0xFF005047);

  /// Material 2 standard default color for dark tertiary color, the
  /// color value is same as the light secondary color.
  static const Color materialDarkTertiary = Color(0xff03dac6);

  /// Material 2 dark secondary container
  static const Color materialDarkTertiaryContainer = Color(0xFF003E3E);

  /// Material 2 standard default color for dark secondary variant color, the
  /// color value is same as the light secondary color.
  ///
  /// Old Material 2 color system, prefer [materialDarkTertiary] instead.
  static const Color materialDarkSecondaryVariant = materialDarkTertiary;

  // High contrast versions of Material 2 Guide colors as per those used
  // in ColorScheme.highContrastLight and ColorScheme.highContrastDark.

  /// English name of the material high contrast theme.
  static const String materialHcName = 'Material high contrast';

  /// English description of the material high contrast theme.
  static const String materialHcDescription =
      'High contrast Material 2 design guide theme';

  /// Material high contrast color for light primary color.
  static const Color materialLightPrimaryHc = Color(0xff0000ba);

  /// Material high contrast color for light primary container color.
  static const Color materialLightPrimaryContainerHc = Color(0xffb6b6ff);

  /// Old Material 2 high contrast color for light primary variant color.
  ///
  /// Deprecated in Flutter SDK, prefer [materialLightPrimaryContainerHc].
  static const Color materialLightPrimaryVariantHc = Color(0xff000088);

  /// Material 2 high contrast color for light secondary color.
  static const Color materialLightSecondaryHc = Color(0xff66fff9);

  /// Material 2 high contrast color for light secondary container color.
  static const Color materialLightSecondaryContainerHc = Color(0xFFC8F9F7);

  /// Material 2 high contrast color for light tertiary container color.
  static const Color materialLightTertiaryHc = Color(0xff018786);

  /// Material 2 high contrast color for light tertiary color.
  static const Color materialLightTertiaryContainerHc = Color(0xFFB3F1F0);

  /// Material 2 high contrast color for light secondary variant color.
  ///
  /// Old Material 2 color system, prefer [materialLightTertiaryHc] instead.
  static const Color materialLightSecondaryVariantHc = materialLightTertiaryHc;

  /// Material 2 high contrast color for dark primary color.
  static const Color materialDarkPrimaryHc = Color(0xffefb7ff);

  /// Material 2 high contrast color for dark primary container color.
  static const Color materialDarkPrimaryContainerHc = Color(0xff8a61db);

  /// Material 2 high contrast color for dark primary variant color.
  ///
  /// Old Material 2 color system, prefer [materialDarkPrimaryContainerHc].
  static const Color materialDarkPrimaryVariantHc = Color(0xffbe9eff);

  ///Material 2 high contrast color for dark secondary color.
  static const Color materialDarkSecondaryHc = Color(0xff66fff9);

  /// Material 2 high contrast color for dark secondary container color.
  static const Color materialDarkSecondaryContainerHc = Color(0xFF00504D);

  /// Material 2 high contrast color for dark tertiary color.
  static const Color materialDarkTertiaryHc = Color(0xff66fff9);

  /// Material 2 high contrast color for dark tertiary container color.
  static const Color materialDarkTertiaryContainerHc = Color(0xFF043232);

  /// Material 2 high contrast color for dark secondary variant color.
  ///
  /// Old Material 2 color system, prefer [materialDarkTertiaryHc] instead.
  static const Color materialDarkSecondaryVariantHc = materialDarkTertiaryHc;

  // Material blue and light blue colors based scheme.

  /// English name of the blue theme.
  static const String blueName = 'Blue delight';

  /// English description of the blue theme.
  static const String blueDescription = 'Blue color theme, based on '
      'Material blue and light blue colors';

  /// Blue theme color for light primary color.
  static const Color blueLightPrimary = Color(0xFF1565C0); // blue800

  /// Blue theme color for light primary container color.
  static const Color blueLightPrimaryContainer = Color(0xFF90CAF9); // blue200

  /// Blue theme color for light primary variant color.
  ///
  /// Old Material 2 color system, prefer [blueLightPrimaryContainer].
  static const Color blueLightPrimaryVariant = Color(0xFF0D47A1);

  /// Blue theme color for light secondary color.
  static const Color blueLightSecondary = Color(0xFF039BE5); // lightBlue600

  /// Blue theme color for light secondary color.
  static const Color blueLightSecondaryContainer = Color(0xFFCBE6FF);

  /// Blue theme color for light tertiary color.
  static const Color blueLightTertiary = Color(0xFF0277BD);

  /// Blue theme color for light tertiary color.
  static const Color blueLightTertiaryContainer = Color(0xFFBEDCFF);

  /// Blue theme color for light secondary variant color.
  ///
  /// Old Material 2 color system, prefer [blueLightTertiary] instead.
  static const Color blueLightSecondaryVariant = blueLightTertiary;

  /// Blue theme color for dark primary color.
  static const Color blueDarkPrimary = Color(0xFF90CAF9); // blue200

  /// Blue theme color for dark primary container color.
  static const Color blueDarkPrimaryContainer = Color(0xFF0D47A1); // blue900

  /// Blue theme color for dark primary variant color.
  ///
  /// Old Material 2 color system, prefer [blueDarkPrimaryContainer] instead.
  static const Color blueDarkPrimaryVariant = Color(0xFF64B5F6);

  /// Blue theme color for dark secondary color.
  static const Color blueDarkSecondary = Color(0xFF81D4FA); // lightBlue200

  /// Blue theme color for dark secondary container color.
  static const Color blueDarkSecondaryContainer = Color(0xFF004B73);

  /// Blue theme color for dark tertiary color.
  static const Color blueDarkTertiary = Color(0xFFE1F5FE); // lBlue50

  /// Blue theme color for dark tertiary container color.
  static const Color blueDarkTertiaryContainer = Color(0xFF1A567D);

  /// Blue theme color for dark secondary variant color.
  ///
  /// Old Material 2 color system, prefer [blueDarkTertiary] instead.
  static const Color blueDarkSecondaryVariant = blueDarkTertiary;

  // Material indigo and deep purple colors based scheme.

  /// English name of the indigo theme.
  static const String indigoName = 'Indigo nights';

  /// English description of the indigo theme.
  static const String indigoDescription = 'Indigo color theme, based on '
      'Material indigo and deep purple colors';

  /// Indigo theme color for light primary color.
  static const Color indigoLightPrimary = Color(0xFF303F9F); // indigo700

  /// Indigo theme color for light primary container color.
  static const Color indigoLightPrimaryContainer = Color(0xFFAEB9F4);

  /// Indigo theme color for light primary variant color.
  ///
  /// Old Material 2 color system, prefer [indigoLightPrimaryContainer].
  static const Color indigoLightPrimaryVariant = Color(0xFF1A237E);

  /// Indigo theme color for light secondary color.
  static const Color indigoLightSecondary = Color(0xFF512DA8); // deepPurple700

  /// Indigo theme color for light secondary container color.
  static const Color indigoLightSecondaryContainer = Color(0xFFE9DDFF);

  /// Indigo theme color for light tertiary color.
  static const Color indigoLightTertiary = Color(0xFF311B92);

  /// Indigo theme color for light tertiary container color.
  static const Color indigoLightTertiaryContainer = Color(0xFFD1C5FF);

  /// Indigo theme color for light secondary variant color.
  ///
  /// Old Material 2 color system, prefer [indigoLightTertiary].
  static const Color indigoLightSecondaryVariant = indigoLightTertiary;

  /// Indigo theme color for dark primary color.
  static const Color indigoDarkPrimary = Color(0xFF7986CB); // indigo300

  /// Indigo theme color for dark primary container color.
  static const Color indigoDarkPrimaryContainer = Color(0xFF283593); // ind800

  /// Indigo theme color for dark primary variant color.
  ///
  /// Old Material 2 color system, prefer [indigoDarkPrimaryContainer].
  static const Color indigoDarkPrimaryVariant = Color(0xFF5C6BC0);

  /// Indigo theme color for dark secondary color.
  static const Color indigoDarkSecondary = Color(0xFF9575CD); // deepPurple300

  /// Indigo theme color for dark secondary container color.
  static const Color indigoDarkSecondaryContainer = Color(0xFF502CA7);

  /// Indigo theme color for dark tertiary color.
  static const Color indigoDarkTertiary = Color(0xFF7E57C2);

  /// Indigo theme color for dark tertiary container color.
  static const Color indigoDarkTertiaryContainer = Color(0xFF4433A4);

  /// Indigo theme color for dark secondary variant color.
  ///
  /// Old Material 2 color system, prefer [indigoDarkTertiary].
  static const Color indigoDarkSecondaryVariant = indigoDarkTertiary;

  // Hippie blue colors. Found some of them here:
  // https://www.designwizard.com/blog/design-trends/colour-combination
  // However, colors and scheme name by "name that color" library.

  /// English name of the hippie blue theme.
  static const String hippieBlueName = 'Hippie blue';

  /// English description of the hippie blue theme.
  static const String hippieBlueDescription = 'Hippie blue with surfie green '
      'and chock coral pink theme';

  /// Hippie blue theme color for light primary color.
  static const Color hippieBlueLightPrimary = Color(0xFF4C9BBA);

  /// Hippie blue theme color for light primary container color.
  static const Color hippieBlueLightPrimaryContainer = Color(0xFF9CEBEB);

  /// Hippie blue theme color for light primary variant color.
  ///
  /// Old Material 2 color system, prefer [hippieBlueLightPrimaryContainer].
  static const Color hippieBlueLightPrimaryVariant = Color(0xFF078282);

  /// Hippie blue theme color for light secondary color.
  static const Color hippieBlueLightSecondary = Color(0xFFFF4F58);

  /// Hippie blue theme color for light secondary container color.
  static const Color hippieBlueLightSecondaryContainer = Color(0xFFFFDAD7);

  /// Hippie blue theme color for light secondary variant color.
  ///
  /// Old Material 2 color system, prefer [hippieBlueLightTertiary].
  static const Color hippieBlueLightSecondaryVariant = hippieBlueLightTertiary;

  /// Hippie blue theme color for light tertiary color.
  static const Color hippieBlueLightTertiary = Color(0xFFBF4A50);

  /// Hippie blue theme color for light tertiary container color.
  static const Color hippieBlueLightTertiaryContainer = Color(0xFFFCBDBD);

  /// Hippie blue theme color for dark primary color.
  static const Color hippieBlueDarkPrimary = Color(0xFF669DB3);

  /// Hippie blue theme color for dark primary container color.
  static const Color hippieBlueDarkPrimaryContainer = Color(0xFF078282);

  /// Hippie blue theme color for dark primary variant color.
  ///
  /// Old Material 2 color system, prefer [hippieBlueDarkPrimaryContainer].
  static const Color hippieBlueDarkPrimaryVariant = Color(0xFF208E8E);

  /// Hippie blue theme color for dark secondary color.
  static const Color hippieBlueDarkSecondary = Color(0xFFFC6E75);

  /// Hippie blue theme color for dark secondary container color.
  static const Color hippieBlueDarkSecondaryContainer = Color(0xFF92001A);

  /// Hippie blue theme color for dark tertiary color.
  static const Color hippieBlueDarkTertiary = Color(0xFFF75F67);

  /// Hippie blue theme color for dark tertiary container color.
  static const Color hippieBlueDarkTertiaryContainer = Color(0xFF580810);

  /// Hippie blue theme color for dark secondary variant color.
  ///
  /// Old Material 2 color system, prefer [hippieBlueDarkTertiary].
  static const Color hippieBlueDarkSecondaryVariant = hippieBlueDarkTertiary;

  // Aqua tropical blue ocean scheme.
  // The scheme looks like clear tropical coral waters, hence the name.

  /// English name of the aqua blue theme.
  static const String aquaBlueName = 'Aqua blue';

  /// English description of the aqua blue theme.
  static const String aquaBlueDescription = 'Aqua tropical ocean blue theme';

  /// Aqua blue theme color for light primary color.
  static const Color aquaBlueLightPrimary = Color(0xFF35A0CB);

  /// Aqua blue theme color for light primary container color.
  static const Color aquaBlueLightPrimaryContainer = Color(0xFF71D3ED);

  /// Aqua blue theme color for light primary variant color.
  ///
  /// Old Material 2 color system, prefer [aquaBlueLightPrimaryContainer].
  static const Color aquaBlueLightPrimaryVariant = Color(0xFF45B4D2);

  /// Aqua blue theme color for light secondary color.
  static const Color aquaBlueLightSecondary = Color(0xFF89D1C8);

  /// Aqua blue theme color for light secondary container color.
  static const Color aquaBlueLightSecondaryContainer = Color(0xFF91F4E8);

  /// Aqua blue theme color for light secondary variant color.
  /// Old Material 2 color system, prefer [aquaBlueLightTertiary].
  static const Color aquaBlueLightSecondaryVariant = aquaBlueLightTertiary;

  /// Aqua blue theme color for light tertiary color.
  static const Color aquaBlueLightTertiary = Color(0xFF61D4D4);

  /// Aqua blue theme color for light tertiary container color.
  static const Color aquaBlueLightTertiaryContainer = Color(0xFF8FF3F2);

  /// Aqua blue theme color for dark primary color.
  static const Color aquaBlueDarkPrimary = Color(0xFF5DB3D5);

  /// Aqua blue theme color for dark primary container color.
  static const Color aquaBlueDarkPrimaryContainer = Color(0xFF297EA0);

  /// Aqua blue theme color for dark primary variant color.
  /// Old Material 2 color system, prefer [aquaBlueDarkPrimaryContainer].
  static const Color aquaBlueDarkPrimaryVariant = Color(0xFF71D3ED);

  /// Aqua blue theme color for dark secondary color.
  static const Color aquaBlueDarkSecondary = Color(0xFFA1E9DF);

  /// Aqua blue theme color for dark secondary container color.
  static const Color aquaBlueDarkSecondaryContainer = Color(0xFF005049);

  /// Aqua blue theme color for dark tertiary color.
  static const Color aquaBlueDarkTertiary = Color(0xFFA0E5E5);

  /// Aqua blue theme color for dark tertiary container color.
  static const Color aquaBlueDarkTertiaryContainer = Color(0xFF004F50);

  /// Aqua blue theme color for dark secondary variant color.
  /// Old Material 2 color system, prefer [aquaBlueDarkTertiary].
  static const Color aquaBlueDarkSecondaryVariant = aquaBlueDarkTertiary;

  // Blue color scheme based on well known blue web brand colors.

  /// English name of the brand blue colors theme.
  static const String brandBlueName = 'Brand blues';

  /// English description of the brand blue colors theme.
  static const String brandBlueDescription = 'Blue colors used in well known '
      'brand themes';

  /// Brand blues theme color for light primary color.
  static const Color brandBlueLightPrimary = Color(0xFF3B5998); // FB blue

  /// Brand blues theme color for light primary container color.
  static const Color brandBlueLightPrimaryContainer = Color(0xFFA8CAE6); // FB2

  /// Brand blues theme color for light primary variant color.
  ///
  /// Old Material 2 color system, prefer [brandBlueLightPrimaryContainer].
  static const Color brandBlueLightPrimaryVariant = Color(0xFF3F729B); // IG

  /// Brand blues theme color for light secondary color.
  static const Color brandBlueLightSecondary = Color(0xFF55ACEE); // Twitter

  /// Brand blues theme color for light secondary container color.
  static const Color brandBlueLightSecondaryContainer = Color(0xFFCBE5FF);

  /// Brand blues theme color for light tertiary color.
  static const Color brandBlueLightTertiary = Color(0xFF4285F4); // Google

  /// Brand blues theme color for light tertiary container color.
  static const Color brandBlueLightTertiaryContainer = Color(0xFFD6E2FF);

  /// Brand blues theme color for light secondary variant color.
  ///
  /// Old Material 2 color system, prefer [brandBlueLightTertiary].
  static const Color brandBlueLightSecondaryVariant = brandBlueLightTertiary;

  /// Brand blues theme color for dark primary color.
  static const Color brandBlueDarkPrimary = Color(0xFF8B9DC3); // FB 2nd

  /// Brand blues theme color for dark primary container color.
  static const Color brandBlueDarkPrimaryContainer = Color(0xFF3B5998); // FB

  /// Brand blues theme color for dark primary variant color.
  ///
  /// Old Material 2 color system, prefer [brandBlueDarkPrimaryContainer].
  static const Color brandBlueDarkPrimaryVariant = Color(0xFF799CB9);

  /// Brand blues theme color for dark secondary color.
  static const Color brandBlueDarkSecondary = Color(0xFFA0D1F5);

  /// Brand blues theme color for dark secondary container color.
  static const Color brandBlueDarkSecondaryContainer = Color(0xFF004B75);

  /// Brand blues theme color for dark tertiary color.
  static const Color brandBlueDarkTertiary = Color(0xFF88B2F8);

  /// Brand blues theme color for dark tertiary container color.
  static const Color brandBlueDarkTertiaryContainer = Color(0xFF004397);

  /// Brand blues theme color for dark secondary variant color.
  /// Old Material 2 color system, prefer [brandBlueDarkTertiary].
  static const Color brandBlueDarkSecondaryVariant = brandBlueDarkTertiary;

  // Deep blue sea color scheme.
  // Colors looked like a deep abyss, hence the name.

  /// English name of the dark deep blue sea theme.
  static const String deepBlueName = 'Deep blue sea';

  /// English description of the dark deep blue sea theme.
  static const String deepBlueDescription = 'Dark deep blue sea color theme';

  /// Deep blue theme color for light primary color.
  static const Color deepBlueLightPrimary = Color(0xFF223A5E);

  /// Deep blue theme color for light primary container color.
  static const Color deepBlueLightPrimaryContainer = Color(0xFF97BAEA);

  /// Deep blue theme color for light primary variant color.
  ///
  /// Old Material 2 color system, prefer [deepBlueLightPrimaryContainer].
  static const Color deepBlueLightPrimaryVariant = Color(0xFF1B2E4B);

  /// Deep blue theme color for light secondary color.
  static const Color deepBlueLightSecondary = Color(0xFF144955);

  /// Deep blue theme color for light secondary container color.
  static const Color deepBlueLightSecondaryContainer = Color(0xFFA9EDFF);

  /// Deep blue theme color for light tertiary color.
  static const Color deepBlueLightTertiary = Color(0xFF208399);

  /// Deep blue theme color for light tertiary container color.
  static const Color deepBlueLightTertiaryContainer = Color(0xFFCCF3FF);

  /// Deep blue theme color for light secondary variant color.
  ///
  /// Old Material 2 color system, prefer [deepBlueLightTertiary].
  static const Color deepBlueLightSecondaryVariant = deepBlueLightTertiary;

  /// Deep blue theme color for dark primary color.
  static const Color deepBlueDarkPrimary = Color(0xFF748BAC);

  /// Deep blue theme color for dark primary container color.
  static const Color deepBlueDarkPrimaryContainer = Color(0xFF1B2E4B);

  /// Deep blue theme color for dark primary variant color.
  /// Old Material 2 color system, prefer [deepBlueDarkPrimaryContainer].
  static const Color deepBlueDarkPrimaryVariant = Color(0xFF7FA1D0);

  /// Deep blue theme color for dark secondary color.
  static const Color deepBlueDarkSecondary = Color(0xFF539EAF);

  /// Deep blue theme color for dark secondary container color.
  static const Color deepBlueDarkSecondaryContainer = Color(0xFF004E5D);

  /// Deep blue theme color for dark tertiary color.
  static const Color deepBlueDarkTertiary = Color(0xFF219AB5);

  /// Deep blue theme color for dark tertiary container color.
  static const Color deepBlueDarkTertiaryContainer = Color(0xFF0F5B6A);

  /// Deep blue theme color for dark secondary variant color.
  ///
  /// Old Material 2 color system, prefer [deepBlueDarkTertiary].
  static const Color deepBlueDarkSecondaryVariant = deepBlueDarkTertiary;

  // Pink Sakura color scheme.
  // Color sources: https://www.w3schools.com/colors/colors_2019.asp

  /// English name of the pink sakura inspired theme.
  static const String sakuraName = 'Pink sakura';

  /// English description of the pink sakura inspired theme.
  static const String sakuraDescription = 'Pink color theme, based on sakura '
      'cherry blossom like colors';

  /// Sakura theme color for light primary color.
  static const Color sakuraLightPrimary = Color(0xFFCE5B78); // Fruit dove

  /// Sakura theme color for light primary container color.
  static const Color sakuraLightPrimaryContainer = Color(0xFFe8b5ce);

  /// Sakura theme color for light primary variant color.
  ///
  /// Old Material 2 color system, prefer [sakuraLightPrimaryContainer].
  static const Color sakuraLightPrimaryVariant = Color(0xffe4446c);

  /// Sakura theme color for light secondary color.
  static const Color sakuraLightSecondary = Color(0xFFfbae9d); // Peach pink 80%

  /// Sakura theme color for light secondary container color.
  static const Color sakuraLightSecondaryContainer = Color(0xFFFFDAD1);

  /// Sakura theme color for light tertiary color.
  static const Color sakuraLightTertiary = Color(0xFFF39682); //Peach

  /// Sakura theme color for light tertiary container color.
  static const Color sakuraLightTertiaryContainer = Color(0xFFFFCFC3);

  /// Sakura theme color for light secondary variant color.
  ///
  /// Old Material 2 color system, prefer [sakuraLightTertiary].
  static const Color sakuraLightSecondaryVariant = sakuraLightTertiary;

  /// Sakura theme color for dark primary color.
  static const Color sakuraDarkPrimary = Color(0xFFeec4d8); // Peach pink 80%

  /// Sakura theme color for dark primary container color.
  static const Color sakuraDarkPrimaryContainer = Color(0xFFCE5B78);

  /// Sakura theme color for dark primary variant color.
  ///
  /// Old Material 2 color system, prefer [sakuraDarkPrimaryContainer].
  static const Color sakuraDarkPrimaryVariant = Color(0xFFe8b5ce);

  /// Sakura theme color for dark secondary color.
  static const Color sakuraDarkSecondary = Color(0xFFF5D6C6); // Peche

  /// Sakura theme color for dark secondary container color.
  static const Color sakuraDarkSecondaryContainer = Color(0xFFEBA689);

  /// Sakura theme color for dark tertiary color.
  static const Color sakuraDarkTertiary = Color(0xFFf7e0d4);

  /// Sakura theme color for dark tertiary container color.
  static const Color sakuraDarkTertiaryContainer = Color(0xFFEEBDA8);

  /// Sakura theme color for dark secondary variant color.
  ///
  /// Old Material 2 color system, prefer [sakuraDarkTertiary].
  static const Color sakuraDarkSecondaryVariant = sakuraDarkTertiary;

  // Mandy Red and Viking blue color scheme.
  // Colors and scheme named by "name that color" library.

  /// English name of the Mandy Red inspired theme.
  static const String mandyRedName = 'Oh Mandy red';

  /// English description of the pink mandyRed inspired theme.
  static const String mandyRedDescription =
      'Mandy red and Viking blue inspired red theme';

  /// Mandy red theme color for light primary color.
  static const Color mandyRedLightPrimary = Color(0xFFCD5758);

  /// Mandy red theme color for light primary container color.
  static const Color mandyRedLightPrimaryContainer = Color(0xFFE49797);

  /// Mandy red theme color for light primary variant color.
  ///
  /// Old Material 2 color system, prefer [mandyRedLightPrimaryContainer].
  static const Color mandyRedLightPrimaryVariant = Color(0xFFA23556);

  /// Mandy red theme color for light secondary color.
  static const Color mandyRedLightSecondary = Color(0xFF57C8D3);

  /// Mandy red theme color for light secondary container color.
  static const Color mandyRedLightSecondaryContainer = Color(0xFF90F2FC);

  /// Mandy red theme color for light tertiary color.
  static const Color mandyRedLightTertiary = Color(0xFF69B9CD);

  /// Mandy red theme color for light tertiary container color.
  static const Color mandyRedLightTertiaryContainer = Color(0xFFA6EDFF);

  /// Mandy red theme color for light secondary variant color.
  /// Old Material 2 color system, prefer [mandyRedLightTertiary].
  static const Color mandyRedLightSecondaryVariant = mandyRedLightTertiary;

  /// Mandy red theme color for dark primary color.
  static const Color mandyRedDarkPrimary = Color(0xFFDA8585);

  /// Mandy red theme color for dark primary container color.
  static const Color mandyRedDarkPrimaryContainer = Color(0xFFC05253);

  /// Mandy red theme color for dark primary variant color.
  ///
  /// Old Material 2 color system, prefer [mandyRedDarkPrimaryContainer].
  static const Color mandyRedDarkPrimaryVariant = Color(0xFFAB4967);

  /// Mandy red theme color for dark secondary color.
  static const Color mandyRedDarkSecondary = Color(0xFF68CDD7);

  /// Mandy red theme color for dark secondary container color.
  static const Color mandyRedDarkSecondaryContainer = Color(0xFF037481);

  /// Mandy red theme color for dark tertiary color.
  static const Color mandyRedDarkTertiary = Color(0xFF85C6D6);

  /// Mandy red theme color for dark tertiary container color.
  static const Color mandyRedDarkTertiaryContainer = Color(0xFF21859E);

  /// Mandy red theme color for dark secondary variant color.
  ///
  /// Old Material 2 color system, prefer [mandyRedDarkTertiary].
  static const Color mandyRedDarkSecondaryVariant = mandyRedDarkTertiary;

  // Material red and pink color scheme.

  /// English name of the red theme.
  static const String redName = 'Red tornado';

  /// English description of the red theme.
  static const String redDescription = 'Red color theme, based on '
      'Material red and pink colors';

  /// Red theme color for light primary color.
  static const Color redLightPrimary = Color(0xFFC62828); // red800

  /// Red theme color for light primary container color.
  static const Color redLightPrimaryContainer = Color(0xFFFFCDD2); // red100

  /// Red theme color for light primary variant color.
  ///
  /// Old Material 2 color system, prefer [redLightPrimaryContainer].
  static const Color redLightPrimaryVariant = Color(0xFFB71C1C); // red900

  /// Red theme color for light secondary color.
  static const Color redLightSecondary = Color(0xFFAD1457); // pink800

  /// Red theme color for light secondary container color.
  static const Color redLightSecondaryContainer = Color(0xFFF8BBD0); // pink50

  /// Red theme color for light tertiary color.
  static const Color redLightTertiary = Color(0xFFC2185B); // pink700

  /// Red theme color for light tertiary container color.
  static const Color redLightTertiaryContainer = Color(0xFFFCE4EC); // pink100

  /// Red theme color for light secondary variant color.
  ///
  /// Old Material 2 color system, prefer [redLightTertiary].
  static const Color redLightSecondaryVariant = redLightTertiary;

  /// Red theme color for dark primary color.
  static const Color redDarkPrimary = Color(0xFFEF9A9A); // red200

  /// Red theme color for dark primary container color.
  static const Color redDarkPrimaryContainer = Color(0xFFB71C1C); // red900

  /// Red theme color for dark primary variant color.
  ///
  /// Old Material 2 color system, prefer [redDarkPrimaryContainer].
  static const Color redDarkPrimaryVariant = Color(0xFFE57373); // red300

  /// Red theme color for dark secondary color.
  static const Color redDarkSecondary = Color(0xFFF8BBD0); // pink100

  /// Red theme color for dark secondary container color.
  static const Color redDarkSecondaryContainer = Color(0xFFAD1457); // pink800

  /// Red theme color for dark tertiary color.
  static const Color redDarkTertiary = Color(0xFFFCE4EC); // pink50

  /// Red theme color for dark tertiary container color.
  static const Color redDarkTertiaryContainer = Color(0xFFC2185B); //pink 900

  /// Red theme color for dark secondary variant color.
  ///
  /// Old Material 2 color system, prefer [redDarkTertiary].
  static const Color redDarkSecondaryVariant = redDarkTertiary;

  // Custom red wine palette
  // Color sources: https://www.w3schools.com/colors/colors_2019.asp
  // The names that the "name that color" lib gives these colors are
  // wine related, and yes it is a song title. (Neil Diamond 1968, UB40 1983).

  /// English name of the red wine theme.
  static const String redWineName = 'Red red wine';

  /// English description of the red wine theme.
  static const String redWineDescription = 'Red color theme, based on '
      'red wine like colors';

  /// Red wine theme color for light primary color.
  static const Color redWineLightPrimary = Color(0xFF9B1B30);

  /// Red wine theme color for light primary container color.
  static const Color redWineLightPrimaryContainer = Color(0xFFEDBAC2);

  /// Red wine theme color for light primary variant color.
  ///
  /// Old Material 2 color system, prefer [redWineLightPrimaryContainer].
  static const Color redWineLightPrimaryVariant = Color(0xFF6C1322);

  /// Red wine theme color for light secondary color.
  static const Color redWineLightSecondary = Color(0xFFA70043);

  /// Red wine theme color for light secondary container color.
  static const Color redWineLightSecondaryContainer = Color(0xFFFFD9DF);

  /// Red wine theme color for light tertiary color.
  static const Color redWineLightTertiary = Color(0xFFA4121C);

  /// Red wine theme color for light tertiary container color.
  static const Color redWineLightTertiaryContainer = Color(0xFFFFDAD5);

  /// Red wine theme color for light secondary variant color.
  ///
  /// Old Material 2 color system, prefer [redWineLightTertiary].
  static const Color redWineLightSecondaryVariant = redWineLightTertiary;

  /// Red wine theme color for dark primary color.
  static const Color redWineDarkPrimary = Color(0xFFE4677C);

  /// Red wine theme color for dark primary container color.
  static const Color redWineDarkPrimaryContainer = Color(0xFF9B1B30);

  /// Red wine theme color for dark primary variant color.
  ///
  /// Old Material 2 color system, prefer [redWineDarkPrimaryContainer].
  static const Color redWineDarkPrimaryVariant = Color(0xFFB25867);

  /// Red wine theme color for dark secondary color.
  static const Color redWineDarkSecondary = Color(0xFFC87A98); // 0xFFc8374d

  /// Red wine theme color for dark secondary container color.
  static const Color redWineDarkSecondaryContainer = Color(0xFF910037);

  /// Red wine theme color for dark tertiary color.
  static const Color redWineDarkTertiary = Color(0xFFBD545B);

  /// Red wine theme color for dark tertiary container color.
  static const Color redWineDarkTertiaryContainer = Color(0xFF930012);

  /// Red wine theme color for dark secondary variant color.
  /// Old Material 2 color system, prefer [redWineDarkTertiary].
  static const Color redWineDarkSecondaryVariant = redWineDarkTertiary;

  // Purple brown theme.
  // Color sources: https://visme.co/blog/website-color-schemes/
  // Scheme 8 on the above link.

  /// English name of the purple brown theme.
  static const String purpleBrownName = 'Purple brown';

  /// English description of the purple brown theme.
  static const String purpleBrownDescription = 'Purple brown tinted aubergine '
      'and eggplant colored theme';

  /// Purple brown theme color for light primary color.
  static const Color purpleBrownLightPrimary = Color(0xFF450A0F);

  /// Purple brown theme color for light primary container color.
  static const Color purpleBrownLightPrimaryContainer = Color(0xFFB9A6A8);

  /// Purple brown theme color for light primary variant color.
  ///
  /// Old Material 2 color system, prefer [purpleBrownLightPrimaryContainer].
  static const Color purpleBrownLightPrimaryVariant = Color(0xFF682A2C);

  /// Purple brown theme color for light secondary color.
  static const Color purpleBrownLightSecondary = Color(0xFF60234F);

  /// Purple brown theme color for light secondary container color.
  static const Color purpleBrownLightSecondaryContainer = Color(0xFFE9CEDD);

  /// Purple brown theme color for light tertiary color.
  static const Color purpleBrownLightTertiary = Color(0xFF4A0635);

  /// Purple brown theme color for light tertiary container color.
  static const Color purpleBrownLightTertiaryContainer = Color(0xFFE3B0C5);

  /// Purple brown theme color for light secondary variant color.
  ///
  /// Old Material 2 color system, prefer [purpleBrownLightTertiary].
  static const Color purpleBrownLightSecondaryVariant =
      purpleBrownLightTertiary;

  /// Purple brown theme color for dark primary color.
  static const Color purpleBrownDarkPrimary = Color(0xFFA98085);

  /// Purple brown theme color for dark primary container color.
  static const Color purpleBrownDarkPrimaryContainer = Color(0xFF682A2C);

  /// Purple brown theme color for dark primary variant color.
  ///
  /// Old Material 2 color system, prefer [purpleBrownDarkPrimaryContainer].
  static const Color purpleBrownDarkPrimaryVariant = Color(0xFF73494A);

  /// Purple brown theme color for dark secondary color.
  static const Color purpleBrownDarkSecondary = Color(0xFF975384);

  /// Purple brown theme color for dark secondary container color.
  static const Color purpleBrownDarkSecondaryContainer = Color(0xFF6A2357);

  /// Purple brown theme color for dark tertiary color.
  static const Color purpleBrownDarkTertiary = Color(0xFF5F4C5A);

  /// Purple brown theme color for dark tertiary container color.
  static const Color purpleBrownDarkTertiaryContainer = Color(0xFF501A3C);

  /// Purple brown theme color for dark secondary variant color.
  ///
  /// Old Material 2 color system, prefer [purpleBrownDarkTertiary].
  static const Color purpleBrownDarkSecondaryVariant = purpleBrownDarkTertiary;

  // Material green and cyan color scheme.

  /// English name of the green theme.
  static const String greenName = 'Green forest';

  /// English description of the green theme.
  static const String greenDescription = 'Green color theme, based on '
      'Material green and cyan colors';

  /// Green theme color for light primary color.
  static const Color greenLightPrimary = Color(0xFF2E7D32); // green800

  /// Green theme color for light primary container color.
  static const Color greenLightPrimaryContainer = Color(0xFFA5D6A7); // green200

  /// Green theme color for light primary variant color.
  ///
  /// Old Material 2 color system, prefer [greenLightPrimaryContainer].
  static const Color greenLightPrimaryVariant = Color(0xFF1B5E20); // green900

  /// Green theme color for light secondary color.
  static const Color greenLightSecondary = Color(0xFF00695C); // cyan800

  /// Green theme color for light secondary container color.
  static const Color greenLightSecondaryContainer = Color(0xFF7DCEC4);

  /// Green theme color for light tertiary color.
  static const Color greenLightTertiary = Color(0xFF004D40);

  /// Green theme color for light tertiary container color.
  static const Color greenLightTertiaryContainer = Color(0xFF59B1A1);

  /// Green theme color for light secondary variant color.
  ///
  /// Old Material 2 color system, prefer [greenLightTertiary].
  static const Color greenLightSecondaryVariant = greenLightTertiary;

  /// Green theme color for dark primary color.
  static const Color greenDarkPrimary = Color(0xFFA5D6A7); // green200

  /// Green theme color for dark primary container color.
  static const Color greenDarkPrimaryContainer = Color(0xFF1B5E20); // green900

  /// Green theme color for dark primary variant color.
  ///
  /// Old Material 2 color system, prefer [greenDarkPrimaryContainer].
  static const Color greenDarkPrimaryVariant = Color(0xFF81C784); // green300

  /// Green theme color for dark secondary color.
  static const Color greenDarkSecondary = Color(0xFF80CBC4); // cyan200

  /// Green theme color for dark secondary container color.
  static const Color greenDarkSecondaryContainer = Color(0xFF00695C); // cyan800

  /// Green theme color for dark tertiary color.
  static const Color greenDarkTertiary = Color(0xFF4DB6AC); // cyan300

  /// Green theme color for dark tertiary container color.
  static const Color greenDarkTertiaryContainer = Color(0xFF05514A);

  /// Green theme color for dark secondary variant color.
  ///
  /// Old Material 2 color system, prefer [greenDarkTertiary].
  static const Color greenDarkSecondaryVariant = greenDarkTertiary;

  // Custom Eden color scheme.
  // Color sources: https://www.w3schools.com/colors/colors_2019.asp
  // Looks like colors suitable for a finance app, so I named it accordingly.

  /// English name of the green money theme.
  static const String moneyName = 'Green money';

  /// English description of the green money theme.
  static const String moneyDescription = 'Green money and finance style '
      'color theme';

  /// Money green theme color for light primary color.
  static const Color moneyLightPrimary = Color(0xFF264E36); // Eden 23%

  /// Money green theme color for light primary container color.
  static const Color moneyLightPrimaryContainer = Color(0xFF94BDA5);

  /// Money green theme color for light primary variant color.
  ///
  /// Old Material 2 color system, prefer [moneyLightPrimaryContainer].
  static const Color moneyLightPrimaryVariant = Color(0xFF224430); // Eden 20%

  /// Money green theme color for light secondary color.
  static const Color moneyLightSecondary = Color(0xFF797b3a); // Guacamole 35%

  /// Money green theme color for light secondary container color.
  static const Color moneyLightSecondaryContainer = Color(0xffbfc0a0);

  /// Money green theme color for light tertiary color.
  static const Color moneyLightTertiary = Color(0xFF555729);

  /// Money green theme color for light tertiary container color.
  static const Color moneyLightTertiaryContainer = Color(0xFF9EA089);

  /// Money green theme color for light secondary variant color.
  ///
  /// Old Material 2 color system, prefer [moneyLightTertiary].
  static const Color moneyLightSecondaryVariant = moneyLightTertiary;

  /// Money green theme color for dark primary color.
  static const Color moneyDarkPrimary = Color(0xFF7AB893);

  /// Money green theme color for dark primary container color.
  static const Color moneyDarkPrimaryContainer = Color(0xFF224430);

  /// Money green theme color for dark primary variant color.
  ///
  /// Old Material 2 color system, prefer [moneyDarkPrimaryContainer].
  static const Color moneyDarkPrimaryVariant = Color(0xFF6AAF85);

  /// Money green theme color for dark secondary color.
  static const Color moneyDarkSecondary = Color(0xFFd5d6a8); // Guacamole 75%

  /// Money green theme color for dark secondary container color.
  static const Color moneyDarkSecondaryContainer = Color(0xFF515402);

  /// Money green theme color for dark tertiary color.
  static const Color moneyDarkTertiary = Color(0xFFbbbe74); //Gua. 60%

  /// Money green theme color for dark tertiary container color.
  static const Color moneyDarkTertiaryContainer = Color(0xFF404204);

  /// Money green theme color for dark secondary variant color.
  ///
  /// Old Material 2 color system, prefer [moneyDarkTertiary].
  static const Color moneyDarkSecondaryVariant = moneyDarkTertiary;

  // Jungle green color scheme.
  // Looks like all the green colors in a rain forest, hence the name.

  /// English name of the lush green jungle theme.
  static const String jungleName = 'Green jungle';

  /// English description of the lush green jungle theme.
  static const String jungleDescription = 'Green jungle and rain forest '
      'color theme';

  /// Jungle green theme color for light primary color.
  static const Color jungleLightPrimary = Color(0xFF004E15);

  /// Jungle green theme color for light primary container color.
  static const Color jungleLightPrimaryContainer = Color(0xFF8FB99B);

  /// Jungle green theme color for light primary variant color.
  ///
  /// Old Material 2 color system, prefer [jungleLightPrimaryContainer].
  static const Color jungleLightPrimaryVariant = Color(0xFF00411F);

  /// Jungle green theme color for light secondary color.
  static const Color jungleLightSecondary = Color(0xFF007256);

  /// Jungle green theme color for light secondary container color.
  static const Color jungleLightSecondaryContainer = Color(0xFF83BCAD);

  /// Jungle green theme color for light tertiary color.
  static const Color jungleLightTertiary = Color(0xFF295300);

  /// Jungle green theme color for light tertiary container color.
  static const Color jungleLightTertiaryContainer = Color(0xFF8FAA78);

  /// Jungle green theme color for light secondary variant color.
  ///
  /// Old Material 2 color system, prefer [jungleLightTertiary].
  static const Color jungleLightSecondaryVariant = jungleLightTertiary;

  /// Jungle green theme color for dark primary color.
  static const Color jungleDarkPrimary = Color(0xFF519E67);

  /// Jungle green theme color for dark primary container color.
  static const Color jungleDarkPrimaryContainer = Color(0xFF27683A);

  /// Jungle green theme color for dark primary variant color.
  ///
  /// Old Material 2 color system, prefer [jungleDarkPrimaryContainer].
  static const Color jungleDarkPrimaryVariant = Color(0xFF3F9368);

  /// Jungle green theme color for dark secondary color.
  static const Color jungleDarkSecondary = Color(0xFF479985);

  /// Jungle green theme color for dark secondary container color.
  static const Color jungleDarkSecondaryContainer = Color(0xFF00513B);

  /// Jungle green theme color for dark tertiary color.
  static const Color jungleDarkTertiary = Color(0xFF73A497);

  /// Jungle green theme color for dark tertiary container color.
  static const Color jungleDarkTertiaryContainer = Color(0xFF275000);

  /// Jungle green theme color for dark secondary variant color.
  ///
  /// Old Material 2 color system, prefer [jungleDarkTertiary].
  static const Color jungleDarkSecondaryVariant = jungleDarkTertiary;

  // Custom Legal color scheme.
  // The colors are suitable for a law firm, named it accordingly, with a twist.

  /// English name of the grey law theme.
  static const String greyLawName = 'Grey law';

  /// English description of the grey law theme.
  static const String greyLawDescription = 'Material blue grey and ultra dark '
      'purple color theme, law firm style';

  /// Grey law theme color for light primary color.
  static const Color greyLawLightPrimary = Color(0xFF37474F); // BlueGrey800

  /// Grey law theme color for light primary container color.
  static const Color greyLawLightPrimaryContainer = Color(0xFFB0BEC5); // BG200

  /// Grey law theme color for light primary variant color.
  ///
  /// Old Material 2 color system, prefer [greyLawLightPrimaryContainer].
  static const Color greyLawLightPrimaryVariant = Color(0xFF455A64);

  /// Grey law theme color for light secondary color.
  static const Color greyLawLightSecondary = Color(0xFF521D82);

  /// Grey law theme color for light secondary container color.
  static const Color greyLawLightSecondaryContainer = Color(0xFFF1DAFF);

  /// Grey law theme color for light tertiary color.
  static const Color greyLawLightTertiary = Color(0xFF2C314F);

  /// Grey law theme color for light tertiary container color.
  static const Color greyLawLightTertiaryContainer = Color(0xFFDDE0FF);

  /// Grey law theme color for light secondary variant color.
  ///
  /// Old Material 2 color system, prefer [greyLawLightTertiary].
  static const Color greyLawLightSecondaryVariant = greyLawLightTertiary;

  /// Grey law theme color for dark primary color.
  static const Color greyLawDarkPrimary = Color(0xFF90A4AE); //BlueGrey300

  /// Grey law theme color for dark primary container color.
  static const Color greyLawDarkPrimaryContainer = Color(0xFF37474F); // BlGr800

  /// Grey law theme color for dark primary variant color.
  ///
  /// Old Material 2 color system, prefer [greyLawDarkPrimaryContainer].
  static const Color greyLawDarkPrimaryVariant = Color(0xFF78909C);

  /// Grey law theme color for dark secondary color.
  static const Color greyLawDarkSecondary = Color(0xFF815AA3);

  /// Grey law theme color for dark secondary container color.
  static const Color greyLawDarkSecondaryContainer = Color(0xFF421F62);

  /// Grey law theme color for dark tertiary color.
  static const Color greyLawDarkTertiary = Color(0xFF373D5C);

  /// Grey law theme color for dark tertiary container color.
  static const Color greyLawDarkTertiaryContainer = Color(0xFF1D2449);

  /// Grey law theme color for dark secondary variant color.
  ///
  /// Old Material 2 color system, prefer [greyLawDarkTertiary].
  static const Color greyLawDarkSecondaryVariant = greyLawDarkTertiary;

  // Wild willow and wasabi greenish and purple orchid inspired colors.
  // Colors and theme from "name that color" library.

  /// English name of the green Wild Willow and wasabi theme.
  static const String wasabiName = 'Willow and wasabi';

  /// English description of the Wild Willow and wasabi green theme.
  static const String wasabiDescription = 'Wild Willow and wasabi green '
      'with orchid purple inspired colors';

  /// Willow and wasabi green theme color for light primary color.
  static const Color wasabiLightPrimary = Color(0xFF738625);

  /// Willow and wasabi green theme color for light primary container color.
  static const Color wasabiLightPrimaryContainer = Color(0xFFD7DFB2);

  /// Willow and wasabi green theme color for light primary variant color.
  ///
  /// Old Material 2 color system, prefer [wasabiLightPrimaryContainer].
  static const Color wasabiLightPrimaryVariant = Color(0xFF586621);

  /// Wild Willow and wasabi green theme color for light secondary color.
  static const Color wasabiLightSecondary = Color(0xFF893789);

  /// Wild Willow and wasabi green theme color for light secondary container
  /// color.
  static const Color wasabiLightSecondaryContainer = Color(0xFFFFD6F9);

  /// Willow and wasabi green theme color for light tertiary color.
  static const Color wasabiLightTertiary = Color(0xFF5E3974);

  /// Willow and wasabi green theme color for light tertiary container color.
  static const Color wasabiLightTertiaryContainer = Color(0xFFF6D8FF);

  /// Willow and wasabi green theme color for light secondary variant color.
  ///
  /// Old Material 2 color system, prefer [wasabiLightTertiary].
  static const Color wasabiLightSecondaryVariant = wasabiLightTertiary;

  /// Willow and wasabi green theme color for dark primary color.
  static const Color wasabiDarkPrimary = Color(0xFFC3CB77);

  /// Willow and wasabi green theme color for dark primary container color.
  static const Color wasabiDarkPrimaryContainer = Color(0xFF586621);

  /// Willow and wasabi green theme color for dark primary variant color.
  ///
  /// Old Material 2 color system, prefer [wasabiDarkPrimaryContainer].
  static const Color wasabiDarkPrimaryVariant = Color(0xFFD7DFB2);

  /// Willow and wasabi green theme color for dark secondary color.
  static const Color wasabiDarkSecondary = Color(0xFFDF9ADF);

  /// Willow and wasabi green theme color for dark secondary container color.
  static const Color wasabiDarkSecondaryContainer = Color(0xFF742375);

  /// Willow and wasabi green theme color for dark tertiary color.
  static const Color wasabiDarkTertiary = Color(0xFFA664CD);

  /// Willow and wasabi green theme color for dark tertiary container color.
  static const Color wasabiDarkTertiaryContainer = Color(0xFF61317E);

  /// Willow and wasabi green theme color for dark secondary variant color.
  ///
  /// Old Material 2 color system, prefer [wasabiDarkTertiary].
  static const Color wasabiDarkSecondaryVariant = wasabiDarkTertiary;

  // Gold orange colors, like a tropical evening sunset.
  // Color sources: https://www.w3schools.com/colors/colors_2019.asp

  /// English name of the gold sunset theme.
  static const String goldName = 'Gold sunset';

  /// English description of the gold sunset theme.
  static const String goldDescription = 'Gold sunset color theme, based on '
      'orange like colors';

  /// Gold sunset theme color for light primary color.
  static const Color goldLightPrimary = Color(0xFFb86914); // Dark cheddar 40%

  /// Gold sunset theme color for light primary container color.
  static const Color goldLightPrimaryContainer = Color(0xFFf2c18c);

  /// Gold sunset theme color for light primary variant color.
  ///
  /// Old Material 2 color system, prefer [goldLightPrimaryContainer].
  static const Color goldLightPrimaryVariant = Color(0xFFcf7617);

  /// Gold sunset theme color for light secondary color.
  static const Color goldLightSecondary = Color(0xFFEF6C00); // Orange800

  /// Gold sunset theme color for light secondary container color.
  static const Color goldLightSecondaryContainer = Color(0xFFFFBE93);

  /// Gold sunset theme color for light tertiary color.
  static const Color goldLightTertiary = Color(0xFFb36832);

  /// Gold sunset theme color for light tertiary container color.
  static const Color goldLightTertiaryContainer = Color(0xffca9d7c);

  /// Gold sunset theme color for light secondary variant color.
  ///
  /// Old Material 2 color system, prefer [goldLightTertiary].
  static const Color goldLightSecondaryVariant = goldLightTertiary;

  /// Gold sunset theme color for dark primary color.
  static const Color goldDarkPrimary = Color(0xFFeda85e); // Dark cheddar L 65%

  /// Gold sunset theme color for dark primary container color.
  static const Color goldDarkPrimaryContainer = Color(0xFFb86914);

  /// Gold sunset theme color for dark primary variant color.
  /// Old Material 2 color system, prefer [goldDarkPrimaryContainer].
  static const Color goldDarkPrimaryVariant = Color(0xFFf2c18c);

  /// Gold sunset theme color for dark secondary color.
  static const Color goldDarkSecondary = Color(0xFFd28f60); // S.almond L 60%

  /// Gold sunset theme color for dark secondary container color.
  static const Color goldDarkSecondaryContainer = Color(0xffb5642c);

  /// Gold sunset theme color for dark tertiary color.
  static const Color goldDarkTertiary = Color(0xFFddab88);

  /// Gold sunset theme color for dark tertiary container color.
  static const Color goldDarkTertiaryContainer = Color(0xffbf7d4e);

  /// Gold sunset theme color for dark secondary variant color.
  ///
  /// Old Material 2 color system, prefer [goldDarkTertiary].
  static const Color goldDarkSecondaryVariant = goldDarkTertiary;

  // Mango mojito colored scheme.
  // Color sources: https://www.w3schools.com/colors/colors_2019.asp
  // Colors and scheme named by "name that color" library.

  /// English name of the mango mojito theme.
  static const String mangoName = 'Mango mojito';

  /// English description of the mango mojito theme.
  static const String mangoDescription = 'Orange and green Mango mojito '
      'color theme';

  /// Mango mojito theme color for light primary color.
  static const Color mangoLightPrimary = Color(0xFFC78D20);

  /// Mango mojito theme color for light primary container color.
  static const Color mangoLightPrimaryContainer = Color(0xFFDEB059);

  /// Mango mojito theme color for light primary variant color.
  ///
  /// Old Material 2 color system, prefer [mangoLightPrimaryContainer].
  static const Color mangoLightPrimaryVariant = Color(0xFFD2691E);

  /// Mango mojito theme color for light secondary color.
  static const Color mangoLightSecondary = Color(0xFF8D9440);

  /// Mango mojito theme color for light secondary container color.
  static const Color mangoLightSecondaryContainer = Color(0xFFBFC39B);

  /// Mango mojito theme color for light tertiary color.
  static const Color mangoLightTertiary = Color(0xFF616247);

  /// Mango mojito theme color for light tertiary container color.
  static const Color mangoLightTertiaryContainer = Color(0xFFBCBCA8);

  /// Mango mojito theme color for light secondary variant color.
  ///
  /// Old Material 2 color system, prefer [mangoLightTertiary].
  static const Color mangoLightSecondaryVariant = mangoLightTertiary;

  /// Mango mojito theme color for dark primary color.
  static const Color mangoDarkPrimary = Color(0xFFDEB059);

  /// Mango mojito theme color for dark primary container color.
  static const Color mangoDarkPrimaryContainer = Color(0xFFC78D20);

  /// Mango mojito theme color for dark primary variant color.
  ///
  /// Old Material 2 color system, prefer [mangoDarkPrimaryContainer].
  static const Color mangoDarkPrimaryVariant = Color(0xFFDB874B);

  /// Mango mojito theme color for dark secondary color.
  static const Color mangoDarkSecondary = Color(0xFFAFB479);

  /// Mango mojito theme color for dark secondary container color.
  static const Color mangoDarkSecondaryContainer = Color(0xFF82883D);

  /// Mango mojito theme color for dark tertiary color.
  static const Color mangoDarkTertiary = Color(0xFF81816C);

  /// Mango mojito theme color for dark tertiary container color.
  static const Color mangoDarkTertiaryContainer = Color(0xFF5A5A35);

  /// Mango mojito theme color for dark secondary variant color.
  ///
  /// Old Material 2 color system, prefer [mangoDarkTertiary].
  static const Color mangoDarkSecondaryVariant = mangoDarkTertiary;

  // Material amber and blue accent colors based scheme.

  /// English name of the amber theme.
  static const String amberName = 'Amber blue';

  /// English description of the amber theme.
  static const String amberDescription =
      'Amber blaze and blue color theme, based on '
      'Material amber and blue accent colors';

  /// Amber theme color for light primary color.
  static const Color amberLightPrimary = Color(0xFFE65100); // Orange900

  /// Amber theme color for light primary container color.
  static const Color amberLightPrimaryContainer = Color(0xFFFFCC80); // Oran200

  /// Amber theme color for light primary variant color.
  ///
  /// Old Material 2 color system, prefer [amberLightPrimaryContainer].
  static const Color amberLightPrimaryVariant = Color(0xFFFF8F00); // Amber800

  /// Amber theme color for light secondary color.
  static const Color amberLightSecondary = Color(0xFF2979FF); // BlueAccent400

  /// Amber theme color for light secondary container color.
  static const Color amberLightSecondaryContainer = Color(0xFFE4EAFF);

  /// Amber theme color for light tertiary color.
  static const Color amberLightTertiary = Color(0xFF2962FF);

  /// Amber theme color for light tertiary container color.
  static const Color amberLightTertiaryContainer = Color(0xFFCBD6FF);

  /// Amber theme color for light secondary variant color.
  ///
  /// Old Material 2 color system, prefer [amberLightTertiary].
  static const Color amberLightSecondaryVariant = amberLightTertiary;

  /// Amber theme color for dark primary color.
  static const Color amberDarkPrimary = Color(0xFFFFB300); // Amber600

  /// Amber theme color for dark primary container color.
  static const Color amberDarkPrimaryContainer = Color(0xFFC87200);

  /// Amber theme color for dark primary variant color.
  ///
  /// Old Material 2 color system, prefer [amberDarkPrimaryContainer].
  static const Color amberDarkPrimaryVariant = Color(0xFFFFD54F); // Amber300

  /// Amber theme color for dark secondary color.
  static const Color amberDarkSecondary = Color(0xFF82B1FF); // BlueAccent100

  /// Amber theme color for dark secondary container color.
  static const Color amberDarkSecondaryContainer = Color(0xFF3770CF);

  /// Amber theme color for dark tertiary color.
  static const Color amberDarkTertiary = Color(0xFF448AFF);

  /// Amber theme color for dark tertiary container color.
  static const Color amberDarkTertiaryContainer = Color(0xFF0B429C);

  /// Amber theme color for dark secondary variant color.
  ///
  /// Old Material 2 color system, prefer [amberDarkTertiary].
  static const Color amberDarkSecondaryVariant = amberDarkTertiary;

  // Vesuvius burned and eden green scheme.
  // Colors and scheme named by "name that color" library.

  /// English name of the vesuvius burned orange theme.
  static const String vesuviusBurnName = 'Vesuvius burned';

  /// English description of the vesuvius burned orange theme.
  static const String vesuviusBurnDescription =
      'Vesuvius burned orange and eden green theme';

  /// Vesuvius burned theme color for light primary color.
  static const Color vesuviusBurnLightPrimary = Color(0xFFA6400F);

  /// Vesuvius burned theme color for light primary container color.
  static const Color vesuviusBurnLightPrimaryContainer = Color(0xFFD1AA99);

  /// Vesuvius burned theme color for light primary variant color.
  ///
  /// Old Material 2 color system, prefer [vesuviusBurnLightPrimaryContainer].
  static const Color vesuviusBurnLightPrimaryVariant = Color(0xFF7A2800);

  /// Vesuvius burned theme color for light secondary color.
  static const Color vesuviusBurnLightSecondary = Color(0xFF185358);

  /// Vesuvius burned theme color for light secondary container color.
  static const Color vesuviusBurnLightSecondaryContainer = Color(0xFFA3C4C7);

  /// Vesuvius burned theme color for light tertiary color.
  static const Color vesuviusBurnLightTertiary = Color(0xFF144447);

  /// Vesuvius burned theme color for light tertiary container color.
  static const Color vesuviusBurnLightTertiaryContainer = Color(0xFF7FC0C4);

  /// Vesuvius burned theme color for light secondary variant color.
  ///
  /// Old Material 2 color system, prefer [vesuviusBurnLightTertiary].
  static const Color vesuviusBurnLightSecondaryVariant =
      vesuviusBurnLightTertiary;

  /// Vesuvius burned theme color for dark primary color.
  static const Color vesuviusBurnDarkPrimary = Color(0xFFD17D53);

  /// Vesuvius burned theme color for dark primary container color.
  static const Color vesuviusBurnDarkPrimaryContainer = Color(0xFF874E32);

  /// Vesuvius burned theme color for dark primary variant color.
  ///
  /// Old Material 2 color system, prefer [vesuviusBurnDarkPrimaryContainer].
  static const Color vesuviusBurnDarkPrimaryVariant = Color(0xFFA7613E);

  /// Vesuvius burned theme color for dark secondary color.
  static const Color vesuviusBurnDarkSecondary = Color(0xFF5B8A8E);

  /// Vesuvius burned theme color for dark secondary container color.
  static const Color vesuviusBurnDarkSecondaryContainer = Color(0xFF0D494D);

  /// Vesuvius burned theme color for dark tertiary color.
  static const Color vesuviusBurnDarkTertiary = Color(0xFF3A7175);

  /// Vesuvius burned theme color for dark tertiary container color.
  static const Color vesuviusBurnDarkTertiaryContainer = Color(0xFF023639);

  /// Vesuvius burned theme color for dark secondary variant color.
  ///
  /// Old Material 2 color system, prefer [vesuviusBurnDarkTertiary].
  static const Color vesuviusBurnDarkSecondaryVariant =
      vesuviusBurnDarkTertiary;

  // Material deepPurple and light blue accent colors based scheme.

  /// English name of the deepPurple theme.
  static const String deepPurpleName = 'Deep purple';

  /// English description of the deepPurple theme.
  static const String deepPurpleDescription = 'Deep purple daisy bush theme, '
      'based on Material deepPurple and lightBlueAccent colors';

  /// Indigo theme color for light primary color.
  static const Color deepPurpleLightPrimary = Color(0xFF4527A0); // dp800

  /// Indigo theme color for light primary container color.
  static const Color deepPurpleLightPrimaryContainer =
      Color(0xFFD1C4E9); //dp200

  /// Indigo theme color for light primary variant color.
  ///
  /// Old Material 2 color system, prefer [deepPurpleLightPrimaryContainer].
  static const Color deepPurpleLightPrimaryVariant = Color(0xFF673AB7);

  /// Indigo theme color for light secondary color.
  static const Color deepPurpleLightSecondary = Color(0xFF0091EA); // lba700

  /// Indigo theme color for light secondary container color.
  static const Color deepPurpleLightSecondaryContainer = Color(0xFFCFE4FF);

  /// Indigo theme color for light tertiary color.
  static const Color deepPurpleLightTertiary = Color(0xFF00B0FF);

  /// Indigo theme color for light tertiary container color.
  static const Color deepPurpleLightTertiaryContainer = Color(0xFF9FCBF1);

  /// Indigo theme color for light secondary variant color.
  ///
  /// Old Material 2 color system, prefer [deepPurpleLightTertiary].
  static const Color deepPurpleLightSecondaryVariant = deepPurpleLightTertiary;

  /// Indigo theme color for dark primary color.
  static const Color deepPurpleDarkPrimary = Color(0xFFB39DDB); // dp200

  /// Indigo theme color for dark primary container color.
  static const Color deepPurpleDarkPrimaryContainer = Color(0xFF7E57C2); //dp400

  /// Indigo theme color for dark primary variant color.
  ///
  /// Old Material 2 color system, prefer [deepPurpleDarkPrimaryContainer].
  static const Color deepPurpleDarkPrimaryVariant = Color(0xFF9575CD);

  /// Indigo theme color for dark secondary color.
  static const Color deepPurpleDarkSecondary = Color(0xFF80D8FF); // lba100

  /// Indigo theme color for dark secondary container color.
  static const Color deepPurpleDarkSecondaryContainer = Color(0xFF00497B);

  /// Indigo theme color for dark tertiary color.
  static const Color deepPurpleDarkTertiary = Color(0xFF40C4FF);

  /// Indigo theme color for dark tertiary container color.
  static const Color deepPurpleDarkTertiaryContainer = Color(0xFF0179B6);

  /// Indigo theme color for dark secondary variant color.
  ///
  /// Old Material 2 color system, prefer [deepPurpleDarkTertiary].
  static const Color deepPurpleDarkSecondaryVariant = deepPurpleDarkTertiary;

  // Ebony Clay super dark blue grey scheme.
  // Colors and scheme named by "name that color" library.

  /// English name of the Ebony clay theme.
  static const String ebonyClayName = 'Ebony clay';

  /// English description of the Ebony clay theme.
  static const String ebonyClayDescription =
      'Ebony clay dark blue-grey and watercourse green colored theme';

  /// Ebony clay theme color for light primary color.
  static const Color ebonyClayLightPrimary = Color(0xFF202541);

  /// Ebony clay theme color for light primary container color.
  static const Color ebonyClayLightPrimaryContainer = Color(0xFF9BA7CF);

  /// Ebony clay theme color for light primary variant color.
  ///
  /// Old Material 2 color system, prefer [ebonyClayLightPrimaryContainer].
  static const Color ebonyClayLightPrimaryVariant = Color(0xFF202531);

  /// Ebony clay theme color for light secondary color.
  static const Color ebonyClayLightSecondary = Color(0xFF006B54);

  /// Ebony clay theme color for light secondary container color.
  static const Color ebonyClayLightSecondaryContainer = Color(0xFF8FC3AD);

  /// Ebony clay theme color for light tertiary color.
  static const Color ebonyClayLightTertiary = Color(0xFF004B3B);

  /// Ebony clay theme color for light tertiary container color.
  static const Color ebonyClayLightTertiaryContainer = Color(0xFF82BCB5);

  /// Ebony clay theme color for light secondary variant color.
  ///
  /// Old Material 2 color system, prefer [ebonyClayLightTertiary].
  static const Color ebonyClayLightSecondaryVariant = ebonyClayLightTertiary;

  /// Ebony clay theme color for dark primary color.
  static const Color ebonyClayDarkPrimary = Color(0xFF4E597D);

  /// Ebony clay theme color for dark primary container color.
  static const Color ebonyClayDarkPrimaryContainer = Color(0xFF202541);

  /// Ebony clay theme color for dark primary variant color.
  ///
  /// Old Material 2 color system, prefer [ebonyClayDarkPrimaryContainer].
  static const Color ebonyClayDarkPrimaryVariant = Color(0xFF707EAC);

  /// Ebony clay theme color for dark secondary color.
  static const Color ebonyClayDarkSecondary = Color(0xFF4BA390);

  /// Ebony clay theme color for dark secondary container color.
  static const Color ebonyClayDarkSecondaryContainer = Color(0xFF0B5341);

  /// Ebony clay theme color for dark tertiary color.
  static const Color ebonyClayDarkTertiary = Color(0xFF3D8475);

  /// Ebony clay theme color for dark tertiary container color.
  static const Color ebonyClayDarkTertiaryContainer = Color(0xFF063F36);

  /// Ebony clay theme color for dark secondary variant color.
  ///
  /// Old Material 2 color system, prefer [ebonyClayDarkTertiary].
  static const Color ebonyClayDarkSecondaryVariant = ebonyClayDarkTertiary;

  // Barossa dark purple and cardin green scheme.
  // Colors and scheme named by "name that color" library for the light colors.

  /// English name of the Barossa theme.
  static const String barossaName = 'Barossa';

  /// English description of the Barossa theme.
  static const String barossaDescription =
      'Barossa red and cardin green colored theme';

  /// Barossa theme color for light primary color.
  static const Color barossaLightPrimary = Color(0xFF4E0029);

  /// Barossa theme color for light primary container color.
  static const Color barossaLightPrimaryContainer = Color(0xFFBDA5B1);

  /// Barossa theme color for light primary variant color.
  ///
  /// Old Material 2 color system, prefer [barossaLightPrimaryContainer].
  static const Color barossaLightPrimaryVariant = Color(0xFF750D43);

  /// Barossa theme color for light secondary color.
  static const Color barossaLightSecondary = Color(0xFF00341A);

  /// Barossa theme color for light secondary container color.
  static const Color barossaLightSecondaryContainer = Color(0xFF8DC1A8);

  /// Barossa theme color for light tertiary color.
  static const Color barossaLightTertiary = Color(0xFF124C2F);

  /// Barossa theme color for light tertiary container color.
  static const Color barossaLightTertiaryContainer = Color(0xFFA4D9BF);

  /// Barossa theme color for light secondary variant color.
  ///
  /// Old Material 2 color system, prefer [barossaLightTertiary].
  static const Color barossaLightSecondaryVariant = barossaLightTertiary;

  /// Barossa theme color for dark primary color.
  static const Color barossaDarkPrimary = Color(0xFF94667E);

  /// Barossa theme color for dark primary container color.
  static const Color barossaDarkPrimaryContainer = Color(0xFF4E0029);

  /// Barossa theme color for dark primary variant color.
  ///
  /// Old Material 2 color system, prefer [barossaDarkPrimaryContainer].
  static const Color barossaDarkPrimaryVariant = Color(0xFFB3718D);

  /// Barossa theme color for dark secondary color.
  static const Color barossaDarkSecondary = Color(0xFF6B9882);

  /// Barossa theme color for dark secondary container color.
  static const Color barossaDarkSecondaryContainer = Color(0xFF21614C);

  /// Barossa theme color for dark tertiary color.
  static const Color barossaDarkTertiary = Color(0xFF599B7B);

  /// Barossa theme color for dark tertiary container color.
  static const Color barossaDarkTertiaryContainer = Color(0xFF1D5330);

  /// Barossa theme color for dark secondary variant color.
  ///
  /// Old Material 2 color system, prefer [barossaDarkTertiary].
  static const Color barossaDarkSecondaryVariant = barossaDarkTertiary;

  // Shark grey and orange ecstasy scheme.
  // Color scheme named by "name that color" library using the light colors.

  /// English name of the Shark ecstasy theme.
  static const String sharkName = 'Shark and orange';

  /// English description of the Shark ecstasy theme.
  static const String sharkDescription =
      'Shark grey and orange ecstasy colored theme';

  /// Shark ecstasy theme color for light primary color.
  static const Color sharkLightPrimary = Color(0xFF1D2228);

  /// Shark ecstasy theme color for light primary container color.
  static const Color sharkLightPrimaryContainer = Color(0xFFB0B2C0);

  /// Shark ecstasy theme color for light primary variant color.
  ///
  /// Old Material 2 color system, prefer [sharkLightPrimaryContainer].
  static const Color sharkLightPrimaryVariant = Color(0xFF484C50);

  /// Shark ecstasy theme color for light secondary color.
  static const Color sharkLightSecondary = Color(0xFFFB8122);

  /// Shark ecstasy theme color for light secondary container color.
  static const Color sharkLightSecondaryContainer = Color(0xFFFFB680);

  /// Shark ecstasy theme color for light tertiary color.
  static const Color sharkLightTertiary = Color(0xFFEA9654);

  /// Shark ecstasy theme color for light tertiary container color.
  static const Color sharkLightTertiaryContainer = Color(0xFFE9CBAB);

  /// Shark ecstasy theme color for light secondary variant color.
  ///
  /// Old Material 2 color system, prefer [sharkLightTertiary].
  static const Color sharkLightSecondaryVariant = sharkLightTertiary;

  /// Shark ecstasy theme color for dark primary color.
  static const Color sharkDarkPrimary = Color(0xFF777A7E);

  /// Shark ecstasy theme color for dark primary container color.
  static const Color sharkDarkPrimaryContainer = Color(0xFF313C42);

  /// Shark ecstasy theme color for dark primary variant color.
  ///
  /// Old Material 2 color system, prefer [sharkDarkPrimaryContainer].
  static const Color sharkDarkPrimaryVariant = Color(0xFF919396);

  /// Shark ecstasy theme color for dark secondary color.
  static const Color sharkDarkSecondary = Color(0xFFFCB075);

  /// Shark ecstasy theme color for dark secondary container color.
  static const Color sharkDarkSecondaryContainer = Color(0xFFD97B18);

  /// Shark ecstasy theme color for dark tertiary color.
  static const Color sharkDarkTertiary = Color(0xFFEFB383);

  /// Shark ecstasy theme color for dark tertiary container color.
  static const Color sharkDarkTertiaryContainer = Color(0xFFA75F27);

  /// Shark ecstasy theme color for dark secondary variant color.
  ///
  /// Old Material 2 color system, prefer [sharkDarkTertiary].
  static const Color sharkDarkSecondaryVariant = sharkDarkTertiary;

  // Big stone blue and neon tulip-three yellow scheme.
  // Colors and scheme named by "name that color" library for the light colors.

  /// English name of the Big stone ecstasy theme.
  static const String bigStoneName = 'Big stone tulip';

  /// English description of the Big stone tulip yellow theme.
  static const String bigStoneDescription =
      'Big stone blue and tulip tree yellow colored theme';

  /// Big stone theme color for light primary color.
  static const Color bigStoneLightPrimary = Color(0xFF1A2C42);

  /// Big stone theme color for light primary container color.
  static const Color bigStoneLightPrimaryContainer = Color(0xFFB1C0DD);

  /// Big stone theme color for light primary variant color.
  ///
  /// Old Material 2 color system, prefer [bigStoneLightPrimaryContainer].
  static const Color bigStoneLightPrimaryVariant = Color(0xFF0C1115);

  /// Big stone theme color for light secondary color.
  static const Color bigStoneLightSecondary = Color(0xFFE59A18);

  /// Big stone theme color for light secondary container color.
  static const Color bigStoneLightSecondaryContainer = Color(0xFFE0BD80);

  /// Big stone theme color for light tertiary color.
  static const Color bigStoneLightTertiary = Color(0xFFF0B03F);

  /// Big stone theme color for light tertiary container color.
  static const Color bigStoneLightTertiaryContainer = Color(0xFFE9CFA1);

  /// Big stone theme color for light secondary variant color.
  ///
  /// Old Material 2 color system, prefer [bigStoneLightTertiary].
  static const Color bigStoneLightSecondaryVariant = bigStoneLightTertiary;

  /// Big stone theme color for dark primary color.
  static const Color bigStoneDarkPrimary = Color(0xFF60748A);

  /// Big stone theme color for dark primary container color.
  static const Color bigStoneDarkPrimaryContainer = Color(0xFF1A2C42);

  /// Big stone theme color for dark primary variant color.
  ///
  /// Old Material 2 color system, prefer [bigStoneDarkPrimaryContainer].
  static const Color bigStoneDarkPrimaryVariant = Color(0xFF889EB6);

  /// Big stone theme color for dark secondary color.
  static const Color bigStoneDarkSecondary = Color(0xFFEBB251);

  /// Big stone theme color for dark secondary container color.
  static const Color bigStoneDarkSecondaryContainer = Color(0xFFD48608);

  /// Big stone theme color for dark tertiary color.
  static const Color bigStoneDarkTertiary = Color(0xFFF4CA7E);

  /// Big stone theme color for dark tertiary container color.
  static const Color bigStoneDarkTertiaryContainer = Color(0xFFC68E2D);

  /// Big stone theme color for dark secondary variant color.
  ///
  /// Old Material 2 color system, prefer [bigStoneDarkTertiary].
  static const Color bigStoneDarkSecondaryVariant = bigStoneDarkTertiary;

  // Damask red and lunar green scheme.
  // Colors and scheme named by "name that color" library for the light colors.

  /// English name of the damask theme.
  static const String damaskName = 'Damask and lunar';

  /// English description of the damask theme.
  static const String damaskDescription =
      'Damask red and lunar green colored theme';

  /// Damask theme color for light primary color.
  static const Color damaskLightPrimary = Color(0xFFC96646);

  /// Damask theme color for light primary container color.
  static const Color damaskLightPrimaryContainer = Color(0xFFECC9BD);

  /// Damask theme color for light primary variant color.
  ///
  /// Old Material 2 color system, prefer [damaskLightPrimaryContainer].
  static const Color damaskLightPrimaryVariant = Color(0xFFD48166);

  /// Damask theme color for light secondary color.
  static const Color damaskLightSecondary = Color(0xFF373A36);

  /// Damask theme color for light secondary container color.
  static const Color damaskLightSecondaryContainer = Color(0xFF9EAB9F);

  /// Damask theme color for light tertiary color.
  static const Color damaskLightTertiary = Color(0xFF343E32);

  /// Damask theme color for light tertiary container color.
  static const Color damaskLightTertiaryContainer = Color(0xFF94B291);

  /// Damask theme color for light secondary variant color.
  ///
  /// Old Material 2 color system, prefer [damaskLightTertiary].
  static const Color damaskLightSecondaryVariant = damaskLightTertiary;

  /// Damask theme color for dark primary color.
  static const Color damaskDarkPrimary = Color(0xFFDA9882);

  /// Damask theme color for dark primary container color.
  static const Color damaskDarkPrimaryContainer = Color(0xFFC96646);

  /// Damask theme color for dark primary variant color.
  ///
  /// Old Material 2 color system, prefer [damaskDarkPrimaryContainer].
  static const Color damaskDarkPrimaryVariant = Color(0xFFECC9BD);

  /// Damask theme color for dark secondary color.
  static const Color damaskDarkSecondary = Color(0xFF767D75);

  /// Damask theme color for dark secondary container color.
  static const Color damaskDarkSecondaryContainer = Color(0xFF3A5444);

  /// Damask theme color for dark tertiary color.
  static const Color damaskDarkTertiary = Color(0xFF839081);

  /// Damask theme color for dark tertiary container color.
  static const Color damaskDarkTertiaryContainer = Color(0xFF34553E);

  /// Damask theme color for dark secondary variant color.
  ///
  /// Old Material 2 color system, prefer [damaskDarkTertiary].
  static const Color damaskDarkSecondaryVariant = damaskDarkTertiary;

  // Bahama blue red and lunar green scheme.
  // Colors and scheme named by "name that color" library for the light colors.
  // The colors are based on image theme nr 4 mix 1 in Flexfold demo app.

  /// English name of the bahamaBlue theme.
  static const String bahamaBlueName = 'Bahama and trinidad';

  /// English description of the bahamaBlue theme.
  static const String bahamaBlueDescription =
      'Bahama blue and trinidad orange colored theme';

  /// Bahama blue theme color for light primary color.
  static const Color bahamaBlueLightPrimary = Color(0xFF095D9E);

  /// Bahama blue theme color for light primary container color.
  static const Color bahamaBlueLightPrimaryContainer = Color(0xFFA6CCED);

  /// Bahama blue theme color for light primary variant color.
  ///
  /// Old Material 2 color system, prefer [bahamaBlueLightPrimaryContainer].
  static const Color bahamaBlueLightPrimaryVariant = Color(0xFF658EAF);

  /// Bahama blue theme color for light secondary color.
  static const Color bahamaBlueLightSecondary = Color(0xFFDD520F);

  /// Bahama blue theme color for light secondary container color.
  static const Color bahamaBlueLightSecondaryContainer = Color(0xFFFFDBCD);

  /// Bahama blue theme color for light tertiary color.
  static const Color bahamaBlueLightTertiary = Color(0xFF7CC8F8);

  /// Bahama blue theme color for light tertiary container color.
  static const Color bahamaBlueLightTertiaryContainer = Color(0xFFC5E7FF);

  /// Bahama blue theme color for light secondary variant color.
  ///
  /// Old Material 2 color system, prefer [bahamaBlueLightTertiary].
  static const Color bahamaBlueLightSecondaryVariant = bahamaBlueLightTertiary;

  /// Bahama blue theme color for dark primary color.
  static const Color bahamaBlueDarkPrimary = Color(0xFF4585B5);

  /// Bahama blue theme color for dark primary container color.
  static const Color bahamaBlueDarkPrimaryContainer = Color(0xFF095D9E);

  /// Bahama blue theme color for dark primary variant color.
  ///
  /// Old Material 2 color system, prefer [bahamaBlueDarkPrimaryContainer].
  static const Color bahamaBlueDarkPrimaryVariant = Color(0xFF70A1C9);

  /// Bahama blue theme color for dark secondary color.
  static const Color bahamaBlueDarkSecondary = Color(0xFFE57C4A);

  /// Bahama blue theme color for dark secondary container color.
  static const Color bahamaBlueDarkSecondaryContainer = Color(0xFFDD520F);

  /// Bahama blue theme color for dark tertiary color.
  static const Color bahamaBlueDarkTertiary = Color(0xFF9CD5F9);

  /// Bahama blue theme color for dark tertiary container color.
  static const Color bahamaBlueDarkTertiaryContainer = Color(0xFF3A7292);

  /// Bahama blue theme color for dark secondary variant color.
  /// Old Material 2 color system, prefer [bahamaBlueDarkTertiary].
  static const Color bahamaBlueDarkSecondaryVariant = bahamaBlueDarkTertiary;

  // Mallard green and Valencia pink green scheme.
  // Colors and scheme named by "name that color" library for the light colors.
  // The colors are based on image theme nr 5 mix 4 in Flexfold demo app.

  /// English name of the mallardGreen theme.
  static const String mallardGreenName = 'Mallard and valencia';

  /// English description of the mallardGreen theme.
  static const String mallardGreenDescription =
      'Mallard green and Valencia pink colored theme';

  /// Mallard green theme color for light primary color.
  static const Color mallardGreenLightPrimary = Color(0xFF2D4421);

  /// Mallard green theme color for light primary container color.
  static const Color mallardGreenLightPrimaryContainer = Color(0xFFA3B58A);

  /// Mallard green theme color for light primary variant color.
  ///
  /// Old Material 2 color system, prefer [mallardGreenLightPrimaryContainer].
  static const Color mallardGreenLightPrimaryVariant = Color(0xFF779151);

  /// Mallard green theme color for light secondary color.
  static const Color mallardGreenLightSecondary = Color(0xFFD34B4B);

  /// Mallard green theme color for light secondary container color.
  static const Color mallardGreenLightSecondaryContainer = Color(0xFFFFDAD6);

  /// Mallard green theme color for light tertiary color.
  static const Color mallardGreenLightTertiary = Color(0xFF959D33);

  /// Mallard green theme color for light tertiary container color.
  static const Color mallardGreenLightTertiaryContainer = Color(0xFFE2E989);

  /// Mallard green theme color for light secondary variant color.
  ///
  /// Old Material 2 color system, prefer [mallardGreenLightTertiary].
  static const Color mallardGreenLightSecondaryVariant =
      mallardGreenLightTertiary;

  /// Mallard green theme color for dark primary color.
  static const Color mallardGreenDarkPrimary = Color(0xFF808E79);

  /// Mallard green theme color for dark primary container color.
  static const Color mallardGreenDarkPrimaryContainer = Color(0xFF2D4421);

  /// Mallard green theme color for dark primary variant color.
  ///
  /// Old Material 2 color system, prefer [mallardGreenDarkPrimaryContainer].
  static const Color mallardGreenDarkPrimaryVariant = Color(0xFFA3B58A);

  /// Mallard green theme color for dark secondary color.
  static const Color mallardGreenDarkSecondary = Color(0xFFE18686);

  /// Mallard green theme color for dark secondary container color.
  static const Color mallardGreenDarkSecondaryContainer = Color(0xFF501116);

  /// Mallard green theme color for dark tertiary color.
  static const Color mallardGreenDarkTertiary = Color(0xFFC3C87A);

  /// Mallard green theme color for dark tertiary container color.
  static const Color mallardGreenDarkTertiaryContainer = Color(0xFF454B00);

  /// Mallard green theme color for dark secondary variant color.
  ///
  /// Old Material 2 color system, prefer [mallardGreenDarkTertiary].
  static const Color mallardGreenDarkSecondaryVariant =
      mallardGreenDarkTertiary;

  // Espresso dark brown and crema scheme.
  // Colors and scheme named by "name that color" library for the light colors.
  // The colors are based on image theme nr 11 mix 1 in Flexfold demo app.

  /// English name of the espresso theme.
  static const String espressoName = 'Espresso and crema';

  /// English description of the espresso theme.
  static const String espressoDescription =
      'Espresso dark brown and crema colored theme';

  /// Espresso theme color for light primary color.
  ///
  /// This color was revised for version 5, past color was too dark brown to be
  /// very usable in a UI. It was very black coffee like, but not very
  /// practical. Considered optional brown: Color(0xFF4C2D27), but decided to
  /// use same color value as [espressoDarkPrimaryContainer] for symmetry, and
  /// also because it was a bit darker, to keep maybe a bit more of the black
  /// coffee like vibe instead of hot chocolate. Previous used color
  /// value before version 5.0.0 was Color(0xFF220804).
  static const Color espressoLightPrimary = Color(0xFF452F2B);

  /// Espresso theme color for light primary container color.
  static const Color espressoLightPrimaryContainer = Color(0xFFC7BCAC);

  /// Espresso theme color for light primary variant color.
  ///
  /// Old Material 2 color system, prefer [espressoLightPrimaryContainer].
  static const Color espressoLightPrimaryVariant = Color(0xFF977F55);

  /// Espresso theme color for light secondary color.
  static const Color espressoLightSecondary = Color(0xFFE3B964);

  /// Espresso theme color for light secondary container color.
  static const Color espressoLightSecondaryContainer = Color(0xFFFFDE9C);

  /// Espresso theme color for light tertiary color.
  static const Color espressoLightTertiary = Color(0xFFF5E9C9);

  /// Espresso theme color for light tertiary container color.
  static const Color espressoLightTertiaryContainer = Color(0xFFFEE7AD);

  /// Espresso theme color for light secondary variant color.
  ///
  /// Old Material 2 color system, prefer [espressoLightTertiary].
  static const Color espressoLightSecondaryVariant = espressoLightTertiary;

  /// Espresso theme color for dark primary color.
  static const Color espressoDarkPrimary = Color(0xFF8D7F7D);

  /// Espresso theme color for dark primary container color.
  static const Color espressoDarkPrimaryContainer = Color(0xFF452F2B);

  /// Espresso theme color for dark primary variant color.
  ///
  /// Old Material 2 color system, prefer [espressoDarkPrimaryContainer].
  static const Color espressoDarkPrimaryVariant = Color(0xFFC3B59D);

  /// Espresso theme color for dark secondary color.
  static const Color espressoDarkSecondary = Color(0xFFEED6A6);

  /// Espresso theme color for dark secondary container color.
  static const Color espressoDarkSecondaryContainer = Color(0xFF8E774F);

  /// Espresso theme color for dark tertiary color.
  static const Color espressoDarkTertiary = Color(0xFFF8ECD4);

  /// Espresso theme color for dark tertiary container color.
  static const Color espressoDarkTertiaryContainer = Color(0xFF705D49);

  /// Espresso theme color for dark secondary variant color.
  ///
  /// Old Material 2 color system, prefer [espressoDarkTertiary].
  static const Color espressoDarkSecondaryVariant = espressoDarkTertiary;

  // Outer Space dark blue grey and stage red orange scheme.
  // Colors and scheme named by "name that color" library for the light colors.
  // The colors are based on image theme nr 19 mix 1 in Flexfold demo app.

  /// English name of the outerSpace theme.
  static const String outerSpaceName = 'Outer space stage';

  /// English description of the outerSpace theme.
  static const String outerSpaceDescription =
      'Outer space dark blue-grey and stage red theme';

  /// Outer Space theme color for light primary color.
  static const Color outerSpaceLightPrimary = Color(0xFF1F3339);

  /// Outer Space theme color for light primary container color.
  static const Color outerSpaceLightPrimaryContainer = Color(0xFF9EC4D4);

  /// Outer Space theme color for light primary variant color.
  ///
  /// Old Material 2 color system, prefer [outerSpaceLightPrimaryContainer].
  static const Color outerSpaceLightPrimaryVariant = Color(0xFF416A7D);

  /// Outer Space theme color for light secondary color.
  static const Color outerSpaceLightSecondary = Color(0xFFD2600A);

  /// Outer Space theme color for light secondary container color.
  static const Color outerSpaceLightSecondaryContainer = Color(0xFFFFDBC8);

  /// Outer Space theme color for light tertiary color.
  static const Color outerSpaceLightTertiary = Color(0xFF93A0A9);

  /// Outer Space theme color for light tertiary container color.
  static const Color outerSpaceLightTertiaryContainer = Color(0xFFB5CDDB);

  /// Outer Space theme color for light secondary variant color.
  ///
  /// Old Material 2 color system, prefer [outerSpaceLightTertiary].
  static const Color outerSpaceLightSecondaryVariant = outerSpaceLightTertiary;

  /// Outer Space theme color for dark primary color.
  static const Color outerSpaceDarkPrimary = Color(0xFF486A71);

  /// Outer Space theme color for dark primary container color.
  static const Color outerSpaceDarkPrimaryContainer = Color(0xFF1F3339);

  /// Outer Space theme color for dark primary variant color.
  ///
  /// Old Material 2 color system, prefer [outerSpaceDarkPrimaryContainer].
  static const Color outerSpaceDarkPrimaryVariant = Color(0xFF6A8A99);

  /// Outer Space theme color for dark secondary color.
  static const Color outerSpaceDarkSecondary = Color(0xFFDB823F);

  /// Outer Space theme color for dark secondary container color.
  static const Color outerSpaceDarkSecondaryContainer = Color(0xFFC05402);

  /// Outer Space theme color for dark tertiary color.
  static const Color outerSpaceDarkTertiary = Color(0xFFAAB4BB);

  /// Outer Space theme color for dark tertiary container color.
  static const Color outerSpaceDarkTertiaryContainer = Color(0xFF285C71);

  /// Outer Space theme color for dark secondary variant color.
  ///
  /// Old Material 2 color system, prefer [outerSpaceDarkTertiary].
  static const Color outerSpaceDarkSecondaryVariant = outerSpaceDarkTertiary;

  // Blue whale dark blue grey and stage red orange scheme.
  // Colors and scheme named by "name that color" library for the light colors.
  // The colors are based on image theme nr 19 mix 1 in Flexfold demo app.

  /// English name of the blueWhale theme.
  static const String blueWhaleName = 'Blue whale';

  /// English description of the blueWhale theme.
  static const String blueWhaleDescription =
      'Blue whale, jungle green and outrageous tango orange theme';

  /// Blue whale theme color for light primary color.
  static const Color blueWhaleLightPrimary = Color(0xFF023047);

  /// Blue whale theme color for light primary container color.
  static const Color blueWhaleLightPrimaryContainer = Color(0xFF8EDBCE);

  /// Blue whale theme color for light primary variant color.
  ///
  /// Old Material 2 color system, prefer [blueWhaleLightPrimaryContainer].
  static const Color blueWhaleLightPrimaryVariant = Color(0xFF2A9D8F);

  /// Blue whale theme color for light secondary color.
  static const Color blueWhaleLightSecondary = Color(0xFFF86541);

  /// Blue whale theme color for light secondary container color.
  static const Color blueWhaleLightSecondaryContainer = Color(0xFFFFAD91);

  /// Blue whale theme color for light tertiary color.
  static const Color blueWhaleLightTertiary = Color(0xFFF07E24);

  /// Blue whale theme color for light tertiary container color.
  static const Color blueWhaleLightTertiaryContainer = Color(0xFFFFBF93);

  /// Blue whale theme color for light secondary variant color.
  ///
  /// Old Material 2 color system, prefer [blueWhaleLightTertiary].
  static const Color blueWhaleLightSecondaryVariant = blueWhaleLightTertiary;

  /// Blue whale theme color for dark primary color.
  static const Color blueWhaleDarkPrimary = Color(0xFF57859D);

  /// Blue whale theme color for dark primary container color.
  static const Color blueWhaleDarkPrimaryContainer = Color(0xFF2A9D8F);

  /// Blue whale theme color for dark primary variant color.
  ///
  /// Old Material 2 color system, prefer [blueWhaleDarkPrimaryContainer].
  static const Color blueWhaleDarkPrimaryVariant = Color(0xFF50A399);

  /// Blue whale theme color for dark secondary color.
  static const Color blueWhaleDarkSecondary = Color(0xFFFF6E48);

  /// Blue whale theme color for dark secondary container color.
  static const Color blueWhaleDarkSecondaryContainer = Color(0xFFA3290F);

  /// Blue whale theme color for dark tertiary color.
  static const Color blueWhaleDarkTertiary = Color(0xFFED7F29);

  /// Blue whale theme color for dark tertiary container color.
  static const Color blueWhaleDarkTertiaryContainer = Color(0xFF994600);

  /// Blue whale theme color for dark secondary variant color.
  ///
  /// Old Material 2 color system, prefer [blueWhaleDarkTertiary].
  static const Color blueWhaleDarkSecondaryVariant = blueWhaleDarkTertiary;

  // San Juan blue and salmon pink.
  // Colors and scheme named by "name that color" library for the light colors.

  /// English name of the San Juan blue theme.
  static const String sanJuanBlueName = 'San Juan blue';

  /// English description of the sanJuanBlue theme.
  static const String sanJuanBlueDescription =
      'San Juan blue and pink salmon theme';

  /// San Juan blue theme color for light primary color.
  static const Color sanJuanBlueLightPrimary = Color(0xFF375778);

  /// San Juan blue theme color for light primary container color.
  static const Color sanJuanBlueLightPrimaryContainer = Color(0xFFA4C4ED);

  /// San Juan blue theme color for light primary variant color.
  ///
  /// Old Material 2 color system, prefer [sanJuanBlueLightPrimaryContainer].
  static const Color sanJuanBlueLightPrimaryVariant = Color(0xFF637E9F);

  /// San Juan blue theme color for light secondary color.
  static const Color sanJuanBlueLightSecondary = Color(0xFFF98D94);

  /// San Juan blue theme color for light secondary container color.
  static const Color sanJuanBlueLightSecondaryContainer = Color(0xFFFFC4C6);

  /// San Juan blue theme color for light tertiary color.
  static const Color sanJuanBlueLightTertiary = Color(0xFFF2C4C7);

  /// San Juan blue theme color for light tertiary container color.
  static const Color sanJuanBlueLightTertiaryContainer = Color(0xFFFFE3E5);

  /// San Juan blue theme color for light secondary variant color.
  ///
  /// Old Material 2 color system, prefer [sanJuanBlueLightTertiary].
  static const Color sanJuanBlueLightSecondaryVariant =
      sanJuanBlueLightTertiary;

  /// San Juan blue theme color for dark primary color.
  static const Color sanJuanBlueDarkPrimary = Color(0xFF5E7691);

  /// San Juan blue theme color for dark primary container color.
  static const Color sanJuanBlueDarkPrimaryContainer = Color(0xFF375778);

  /// San Juan blue theme color for dark primary variant color.
  ///
  /// Old Material 2 color system, prefer [sanJuanBlueDarkPrimaryContainer].
  static const Color sanJuanBlueDarkPrimaryVariant = Color(0xFF8096B1);

  /// San Juan blue theme color for dark secondary color.
  static const Color sanJuanBlueDarkSecondary = Color(0xFFEBA1A6);

  /// San Juan blue theme color for dark secondary container color.
  static const Color sanJuanBlueDarkSecondaryContainer = Color(0xFFAE424F);

  /// San Juan blue theme color for dark tertiary color.
  static const Color sanJuanBlueDarkTertiary = Color(0xFFF4CFD1);

  /// San Juan blue theme color for dark tertiary container color.
  static const Color sanJuanBlueDarkTertiaryContainer = Color(0xFF96434F);

  /// San Juan blue theme color for dark secondary variant color.
  ///
  /// Old Material 2 color system, prefer [sanJuanBlueDarkTertiary].
  static const Color sanJuanBlueDarkSecondaryVariant = sanJuanBlueDarkTertiary;

  // Rosewood red, with horses neck and driftwood theme.
  // Colors and scheme named by "name that color" library for the light colors.

  /// English name of the rosewood theme.
  static const String rosewoodName = 'Rosewood';

  /// English description of the rosewood theme.
  static const String rosewoodDescription =
      'Rosewood red, with horses neck and driftwood theme';

  /// Rosewood theme color for light primary color.
  static const Color rosewoodLightPrimary = Color(0xFF5C000E);

  /// Rosewood theme color for light primary container color.
  static const Color rosewoodLightPrimaryContainer = Color(0xFFF4CACE);

  /// Rosewood theme color for light primary variant color.
  ///
  /// Old Material 2 color system, prefer [rosewoodLightPrimaryContainer].
  static const Color rosewoodLightPrimaryVariant = Color(0xFF9D3E4C);

  /// Rosewood theme color for light secondary color.
  static const Color rosewoodLightSecondary = Color(0xFF74540E);

  /// Rosewood theme color for light secondary container color.
  static const Color rosewoodLightSecondaryContainer = Color(0xFFFFDEA3);

  /// Rosewood theme color for light tertiary color.
  static const Color rosewoodLightTertiary = Color(0xFFAD8845);

  /// Rosewood theme color for light tertiary container color.
  static const Color rosewoodLightTertiaryContainer = Color(0xFFFFE8C0);

  /// Rosewood theme color for light secondary variant color.
  ///
  /// Old Material 2 color system, prefer [rosewoodLightTertiary].
  static const Color rosewoodLightSecondaryVariant = rosewoodLightTertiary;

  /// Rosewood theme color for dark primary color.
  static const Color rosewoodDarkPrimary = Color(0xFF9C5A69);

  /// Rosewood theme color for dark primary container color.
  static const Color rosewoodDarkPrimaryContainer = Color(0xFF5F111E);

  /// Rosewood theme color for dark primary variant color.
  /// Old Material 2 color system, prefer [rosewoodDarkPrimaryContainer].
  static const Color rosewoodDarkPrimaryVariant = Color(0xFFB97C88);

  /// Rosewood theme color for dark secondary color.
  static const Color rosewoodDarkSecondary = Color(0xFFEDCE9B);

  /// Rosewood theme color for dark secondary container color.
  static const Color rosewoodDarkSecondaryContainer = Color(0xFF805E23);

  /// Rosewood theme color for dark tertiary color.
  static const Color rosewoodDarkTertiary = Color(0xFFF5DFB9);

  /// Rosewood theme color for dark tertiary container color.
  static const Color rosewoodDarkTertiaryContainer = Color(0xFF8E6E3C);

  /// Rosewood theme color for dark secondary variant color.
  ///
  /// Old Material 2 color system, prefer [rosewoodDarkTertiary].
  static const Color rosewoodDarkSecondaryVariant = rosewoodDarkTertiary;

  // The Blumine theme is based on blumine blue green color, eastern blue,
  // with saffron mango.
  // Colors and scheme named by "name that color" library for the light colors.

  /// English name of the blumineBlue theme.
  static const String blumineBlueName = 'Blumine';

  /// English description of the blumine blue theme.
  static const String blumineBlueDescription =
      'Blumine, easter blue and saffron mango theme';

  /// Blumine blue green theme color for light primary color.
  static const Color blumineBlueLightPrimary = Color(0xFF19647E);

  /// Blumine blue green theme color for light primary container color.
  static const Color blumineBlueLightPrimaryContainer = Color(0xFFA1CBCF);

  /// Blumine blue green theme color for light primary variant color.
  ///
  /// Old Material 2 color system, prefer [blumineBlueLightPrimaryContainer].
  static const Color blumineBlueLightPrimaryVariant = Color(0xFF0B8691);

  /// Blumine blue green theme color for light secondary color.
  static const Color blumineBlueLightSecondary = Color(0xFFFEB716);

  /// Blumine blue green theme color for light secondary container color.
  static const Color blumineBlueLightSecondaryContainer = Color(0xFFFFDEA5);

  /// Blumine blue green theme color for light tertiary color.
  static const Color blumineBlueLightTertiary = Color(0xFF0093C7);

  /// Blumine blue green theme color for light tertiary container color.
  static const Color blumineBlueLightTertiaryContainer = Color(0xFFC3E7FF);

  /// Blumine blue green theme color for light secondary variant color.
  ///
  /// Old Material 2 color system, prefer [blumineBlueLightTertiary].
  static const Color blumineBlueLightSecondaryVariant =
      blumineBlueLightTertiary;

  /// Blumine blue green theme color for dark primary color.
  static const Color blumineBlueDarkPrimary = Color(0xFF82BACE);

  /// Blumine blue green theme color for dark primary container color.
  static const Color blumineBlueDarkPrimaryContainer = Color(0xFF04666F);

  /// Blumine blue green theme color for dark primary variant color.
  ///
  /// Old Material 2 color system, prefer [blumineBlueDarkPrimaryContainer].
  static const Color blumineBlueDarkPrimaryVariant = Color(0xFF569899);

  /// Blumine blue green theme color for dark secondary color.
  static const Color blumineBlueDarkSecondary = Color(0xFFFFD682);

  /// Blumine blue green theme color for dark secondary container color.
  static const Color blumineBlueDarkSecondaryContainer = Color(0xFF9E7910);

  /// Blumine blue green theme color for dark tertiary color.
  static const Color blumineBlueDarkTertiary = Color(0xFF243E4D);

  /// Blumine blue green theme color for dark tertiary container color.
  static const Color blumineBlueDarkTertiaryContainer = Color(0xFF426173);

  /// Blumine blue green theme color for dark secondary variant color.
  ///
  /// Old Material 2 color system, prefer [blumineBlueDarkTertiary].
  static const Color blumineBlueDarkSecondaryVariant = blumineBlueDarkTertiary;

  // The Dash theme is based on the colors in the Flutter Dash mascot found in
  // the 4k wallpaper from Google that was shared before the Flutter 2.10
  // release.

  /// English name of the dashBlue theme.
  static const String dashBlueName = 'Flutter Dash';

  /// English description of the dash blue theme.
  static const String dashBlueDescription =
      'Flutter Dash wallpaper based theme';

  /// Dash blue theme color for light primary color.
  static const Color dashBlueLightPrimary = Color(0xFF4496E0);

  /// Dash blue theme color for light primary container color.
  static const Color dashBlueLightPrimaryContainer = Color(0xFFB4E6FF);

  /// Dash blue theme color for light secondary color.
  static const Color dashBlueLightSecondary = Color(0xFF202B6D);

  /// Dash blue theme color for light secondary container color.
  static const Color dashBlueLightSecondaryContainer = Color(0xFF99CCF9);

  /// Dash blue theme color for light tertiary color.
  static const Color dashBlueLightTertiary = Color(0xFF514239);

  /// Dash blue theme color for light tertiary container color.
  static const Color dashBlueLightTertiaryContainer = Color(0xFFBAA99D);

  /// Dash blue theme color for dark primary color.
  static const Color dashBlueDarkPrimary = Color(0xFFB4E6FF);

  /// Dash blue theme color for dark primary container color.
  static const Color dashBlueDarkPrimaryContainer = Color(0xFF1E8FDB);

  /// Dash blue theme color for dark secondary color.
  static const Color dashBlueDarkSecondary = Color(0xFF99CCF9);

  /// Dash blue theme color for dark secondary container color.
  static const Color dashBlueDarkSecondaryContainer = Color(0xFF202B6D);

  /// Dash blue theme color for dark tertiary color.
  static const Color dashBlueDarkTertiary = Color(0xFFBAA99D);

  /// Dash blue theme color for dark tertiary container color.
  static const Color dashBlueDarkTertiaryContainer = Color(0xFF514239);

  // This is the Material 3 baseline color scheme used in the M3 guide.

  /// English name of the materialBaseline theme.
  static const String materialBaselineName = 'Material 3 purple';

  /// English description of the Material 3 baseline theme.
  static const String materialBaselineDescription =
      'Material 3 guide and default purple theme';

  /// MaterialBaseline theme color for light primary color.
  static const Color materialBaselineLightPrimary = Color(0xFF6750A4);

  /// MaterialBaseline theme color for light primary container color.
  static const Color materialBaselineLightPrimaryContainer = Color(0xFFEADDFF);

  /// MaterialBaseline theme color for light secondary color.
  static const Color materialBaselineLightSecondary = Color(0xFF625B71);

  /// MaterialBaseline theme color for light secondary container color.
  static const Color materialBaselineLightSecondaryContainer =
      Color(0xFFE8DEF8);

  /// MaterialBaseline theme color for light tertiary color.
  static const Color materialBaselineLightTertiary = Color(0xFF7D5260);

  /// MaterialBaseline theme color for light tertiary container color.
  static const Color materialBaselineLightTertiaryContainer = Color(0xFFFFD8E4);

  /// MaterialBaseline theme color for dark primary color.
  static const Color materialBaselineDarkPrimary = Color(0xFFD0BCFF);

  /// MaterialBaseline theme color for dark primary container color.
  static const Color materialBaselineDarkPrimaryContainer = Color(0xFF4F378B);

  /// MaterialBaseline theme color for dark secondary color.
  static const Color materialBaselineDarkSecondary = Color(0xFFCCC2DC);

  /// MaterialBaseline theme color for dark secondary container color.
  static const Color materialBaselineDarkSecondaryContainer = Color(0xFF4A4458);

  /// MaterialBaseline theme color for dark tertiary color.
  static const Color materialBaselineDarkTertiary = Color(0xFFEFB8C8);

  /// MaterialBaseline theme color for dark tertiary container color.
  static const Color materialBaselineDarkTertiaryContainer = Color(0xFF633B48);

  // This is a Material 3 design guide color scheme found in an image
  // the M3 guide here
  // https://m3.material.io/styles/color/dynamic-color/overview)

  /// English name of the verdunHemlock theme.
  static const String verdunHemlockName = 'Verdun green';

  /// English description of the VerdunHemlock green theme.
  static const String verdunHemlockDescription =
      'Material guide 3 verdun and mineral green with hemlock';

  /// VerdunHemlock theme color for light primary color.
  static const Color verdunHemlockLightPrimary = Color(0xFF616200);

  /// VerdunHemlock theme color for light primary container color.
  static const Color verdunHemlockLightPrimaryContainer = Color(0xFFE7E885);

  /// VerdunHemlock theme color for light secondary color.
  static const Color verdunHemlockLightSecondary = Color(0xFF606042);

  /// VerdunHemlock theme color for light secondary container color.
  static const Color verdunHemlockLightSecondaryContainer = Color(0xFFE6E4C0);

  /// VerdunHemlock theme color for light tertiary color.
  static const Color verdunHemlockLightTertiary = Color(0xFF3D6657);

  /// VerdunHemlock theme color for light tertiary container color.
  static const Color verdunHemlockLightTertiaryContainer = Color(0xFFBFECD9);

  /// VerdunHemlock theme color for dark primary color.
  static const Color verdunHemlockDarkPrimary = Color(0xFFCBCC58);

  /// VerdunHemlock theme color for dark primary container color.
  static const Color verdunHemlockDarkPrimaryContainer = Color(0xFF494A00);

  /// VerdunHemlock theme color for dark secondary color.
  static const Color verdunHemlockDarkSecondary = Color(0xFFC9C8A4);

  /// VerdunHemlock theme color for dark secondary container color.
  static const Color verdunHemlockDarkSecondaryContainer = Color(0xFF48482D);

  /// VerdunHemlock theme color for dark tertiary color.
  static const Color verdunHemlockDarkTertiary = Color(0xFFA4D0BE);

  /// VerdunHemlock theme color for dark tertiary container color.
  static const Color verdunHemlockDarkTertiaryContainer = Color(0xFF254E40);

  // This is a Material 3 design guide color scheme found in an image
  // the M3 guide here
  // https://m3.material.io/styles/color/the-color-system/color-roles

  /// English name of the dellGenoaGreen theme.
  static const String dellGenoaGreenName = 'Dell genoa green';

  /// English description of the DellGenoaGreen green theme.
  static const String dellGenoaGreenDescription =
      'Material guide 3 theme with dell, axolotl and genoa greens';

  /// DellGenoaGreen theme color for light primary color.
  static const Color dellGenoaGreenLightPrimary = Color(0xFF386A20);

  /// DellGenoaGreen theme color for light primary container color.
  static const Color dellGenoaGreenLightPrimaryContainer = Color(0xFFB7F397);

  /// DellGenoaGreen theme color for light secondary color.
  static const Color dellGenoaGreenLightSecondary = Color(0xFF55624C);

  /// DellGenoaGreen theme color for light secondary container color.
  static const Color dellGenoaGreenLightSecondaryContainer = Color(0xFFD9E7CB);

  /// DellGenoaGreen theme color for light tertiary color.
  static const Color dellGenoaGreenLightTertiary = Color(0xFF19686A);

  /// DellGenoaGreen theme color for light tertiary container color.
  static const Color dellGenoaGreenLightTertiaryContainer = Color(0xFFA8EFF0);

  /// DellGenoaGreen theme color for dark primary color.
  static const Color dellGenoaGreenDarkPrimary = Color(0xFF9CD67D);

  /// DellGenoaGreen theme color for dark primary container color.
  static const Color dellGenoaGreenDarkPrimaryContainer = Color(0xFF205107);

  /// DellGenoaGreen theme color for dark secondary color.
  static const Color dellGenoaGreenDarkSecondary = Color(0xFFBDCBB0);

  /// DellGenoaGreen theme color for dark secondary container color.
  static const Color dellGenoaGreenDarkSecondaryContainer = Color(0xFF3E4A36);

  /// DellGenoaGreen theme color for dark tertiary color.
  static const Color dellGenoaGreenDarkTertiary = Color(0xFFA0CFD0);

  /// DellGenoaGreen theme color for dark tertiary container color.
  static const Color dellGenoaGreenDarkTertiaryContainer = Color(0xFF1E4E4F);

  /// English name of the red M3 theme.
  static const String redM3Name = 'Thunderbird red';

  /// English description of the red M3 theme.
  static const String redM3Description =
      'Thunderbird red based Material 3 theme';

  /// Red M3 theme color for light primary color.
  ///
  /// This is primary color you get when you seed from M2 [Colors.red].
  static const Color redM3LightPrimary = Color(0xFFBB1614);

  /// Red M3 theme color for light primary container color.
  static const Color redM3LightPrimaryContainer = Color(0xFFFFDAD5);

  /// Red M3 theme color for light secondary color.
  static const Color redM3LightSecondary = Color(0xFF96482B);

  /// Red M3 theme color for light secondary container color.
  static const Color redM3LightSecondaryContainer = Color(0xFFFFDBCF);

  /// Red M3 theme color for light tertiary color.
  static const Color redM3LightTertiary = Color(0xFF286294);

  /// Red M3 theme color for light tertiary container color.
  static const Color redM3LightTertiaryContainer = Color(0xFFD0E4FF);

  /// Red M3 theme color for dark primary color.
  static const Color redM3DarkPrimary = Color(0xFFFFB4AA);

  /// Red M3 theme color for dark primary container color.
  static const Color redM3DarkPrimaryContainer = Color(0xFF930006);

  /// Red M3 theme color for dark secondary color.
  static const Color redM3DarkSecondary = Color(0xFFFFB59C);

  /// Red M3 theme color for dark secondary container color.
  static const Color redM3DarkSecondaryContainer = Color(0xFF783116);

  /// Red M3 theme color for dark tertiary color.
  static const Color redM3DarkTertiary = Color(0xFF9BCBFF);

  /// Red M3 theme color for dark tertiary container color.
  static const Color redM3DarkTertiaryContainer = Color(0xFF004A79);

  /// English name of the pink M3 theme.
  static const String pinkM3Name = 'Lipstick pink';

  /// English description of the pink M3 theme.
  static const String pinkM3Description =
      'Lipstick pink based Material 3 theme';

  /// Pink M3 theme color for light primary color.
  ///
  /// This is primary color you get when you seed from M2 [Colors.pink].
  static const Color pinkM3LightPrimary = Color(0xFFBC004B);

  /// Pink M3 theme color for light primary container color.
  static const Color pinkM3LightPrimaryContainer = Color(0xFFFFD9DE);

  /// Pink M3 theme color for light secondary color.
  static const Color pinkM3LightSecondary = Color(0xFF9B4050);

  /// Pink M3 theme color for light secondary container color.
  static const Color pinkM3LightSecondaryContainer = Color(0xFFF8C7CB);

  /// Pink M3 theme color for light tertiary color.
  static const Color pinkM3LightTertiary = Color(0xFF874978);

  /// Pink M3 theme color for light tertiary container color.
  static const Color pinkM3LightTertiaryContainer = Color(0xFFFFD7F0);

  /// Pink M3 theme color for dark primary color.
  static const Color pinkM3DarkPrimary = Color(0xFFFFB2BE);

  /// Pink M3 theme color for dark primary container color.
  static const Color pinkM3DarkPrimaryContainer = Color(0xFF900038);

  /// Pink M3 theme color for dark secondary color.
  static const Color pinkM3DarkSecondary = Color(0xFFFFD9DC);

  /// Pink M3 theme color for dark secondary container color.
  static const Color pinkM3DarkSecondaryContainer = Color(0xFF5F1224);

  /// Pink M3 theme color for dark tertiary color.
  static const Color pinkM3DarkTertiary = Color(0xFFFAAFE4);

  /// Pink M3 theme color for dark tertiary container color.
  static const Color pinkM3DarkTertiaryContainer = Color(0xFF6B325F);

  /// English name of the purple M3 theme.
  static const String purpleM3Name = 'Eggplant purple';

  /// English description of the purple M3 theme.
  static const String purpleM3Description =
      'Eggplant purple based Material 3 theme';

  /// Purple M3 theme color for light primary color.
  ///
  /// This is primary color you get when you seed from M2 [Colors.purple].
  static const Color purpleM3LightPrimary = Color(0xFF9A25AE);

  /// Purple M3 theme color for light primary container color.
  static const Color purpleM3LightPrimaryContainer = Color(0xFFFFD6FE);

  /// Purple M3 theme color for light secondary color.
  static const Color purpleM3LightSecondary = Color(0xFF8728CF);

  /// Purple M3 theme color for light secondary container color.
  static const Color purpleM3LightSecondaryContainer = Color(0xFFF2DAFF);

  /// Purple M3 theme color for light tertiary color.
  static const Color purpleM3LightTertiary = Color(0xFF934932);

  /// Purple M3 theme color for light tertiary container color.
  static const Color purpleM3LightTertiaryContainer = Color(0xFFFFDBD0);

  /// Purple M3 theme color for dark primary color.
  static const Color purpleM3DarkPrimary = Color(0xFFF9ABFF);

  /// Purple M3 theme color for dark primary container color.
  static const Color purpleM3DarkPrimaryContainer = Color(0xFF7B008F);

  /// Purple M3 theme color for dark secondary color.
  static const Color purpleM3DarkSecondary = Color(0xFFE0B6FF);

  /// Purple M3 theme color for dark secondary container color.
  static const Color purpleM3DarkSecondaryContainer = Color(0xFF6B00AF);

  /// Purple M3 theme color for dark tertiary color.
  static const Color purpleM3DarkTertiary = Color(0xFFFFB59F);

  /// Purple M3 theme color for dark tertiary container color.
  static const Color purpleM3DarkTertiaryContainer = Color(0xFF76331D);

  /// English name of the indigo M3 theme.
  static const String indigoM3Name = 'Indigo San Marino';

  /// English description of the indigo M3 theme.
  ///
  /// This is primary color you get when you seed from M2 [Colors.indigo].
  static const String indigoM3Description =
      'Indigo San Marino based Material 3 theme';

  /// Indigo M3 theme color for light primary color.
  static const Color indigoM3LightPrimary = Color(0xFF4355B9);

  /// Indigo M3 theme color for light primary container color.
  static const Color indigoM3LightPrimaryContainer = Color(0xFFDEE0FF);

  /// Indigo M3 theme color for light secondary color.
  static const Color indigoM3LightSecondary = Color(0xFF3C64AE);

  /// Indigo M3 theme color for light secondary container color.
  static const Color indigoM3LightSecondaryContainer = Color(0xFFD8E2FF);

  /// Indigo M3 theme color for light tertiary color.
  static const Color indigoM3LightTertiary = Color(0xFF537577);

  /// Indigo M3 theme color for light tertiary container color.
  static const Color indigoM3LightTertiaryContainer = Color(0xFFA9D4D6);

  /// Indigo M3 theme color for dark primary color.
  static const Color indigoM3DarkPrimary = Color(0xFFBAC3FF);

  /// Indigo M3 theme color for dark primary container color.
  static const Color indigoM3DarkPrimaryContainer = Color(0xFF293CA0);

  /// Indigo M3 theme color for dark secondary color.
  static const Color indigoM3DarkSecondary = Color(0xFFAEC6FF);

  /// Indigo M3 theme color for dark secondary container color.
  static const Color indigoM3DarkSecondaryContainer = Color(0xFF14448D);

  /// Indigo M3 theme color for dark tertiary color.
  static const Color indigoM3DarkTertiary = Color(0xFFA9CDCF);

  /// Indigo M3 theme color for dark tertiary container color.
  static const Color indigoM3DarkTertiaryContainer = Color(0xFF2A4C4E);

  /// English name of the blue M3 theme.
  static const String blueM3Name = 'Endeavour blue';

  /// English description of the blue M3 theme.
  static const String blueM3Description =
      'Endeavour blue based Material 3 theme';

  /// Blue M3 theme color for light primary color.
  ///
  /// This is primary color you get when you seed from M2 [Colors.blue].
  static const Color blueM3LightPrimary = Color(0xFF0061A4);

  /// Blue M3 theme color for light primary container color.
  static const Color blueM3LightPrimaryContainer = Color(0xFFD1E4FF);

  /// Blue M3 theme color for light secondary color.
  static const Color blueM3LightSecondary = Color(0xFF006781);

  /// Blue M3 theme color for light secondary container color.
  static const Color blueM3LightSecondaryContainer = Color(0xFFB9EAFF);

  /// Blue M3 theme color for light tertiary color.
  static const Color blueM3LightTertiary = Color(0xFFA73A00);

  /// Blue M3 theme color for light tertiary container color.
  static const Color blueM3LightTertiaryContainer = Color(0xFFFFDBCE);

  /// Blue M3 theme color for dark primary color.
  static const Color blueM3DarkPrimary = Color(0xFF9ECAFF);

  /// Blue M3 theme color for dark primary container color.
  static const Color blueM3DarkPrimaryContainer = Color(0xFF00497D);

  /// Blue M3 theme color for dark secondary color.
  static const Color blueM3DarkSecondary = Color(0xFF86D1EE);

  /// Blue M3 theme color for dark secondary container color.
  static const Color blueM3DarkSecondaryContainer = Color(0xFF004D62);

  /// Blue M3 theme color for dark tertiary color.
  static const Color blueM3DarkTertiary = Color(0xFFFFB599);

  /// Blue M3 theme color for dark tertiary container color.
  static const Color blueM3DarkTertiaryContainer = Color(0xFF802A00);

  /// English name of the cyan M3 theme.
  static const String cyanM3Name = 'Mosque cyan';

  /// English description of the cyan M3 theme.
  static const String cyanM3Description = 'Mosque cyan based Material 3 theme';

  /// Cyan M3 theme color for light primary color.
  ///
  /// This is primary color you get when you seed from M2 [Colors.cyan].
  static const Color cyanM3LightPrimary = Color(0xFF006876);

  /// Cyan M3 theme color for light primary container color.
  static const Color cyanM3LightPrimaryContainer = Color(0xFFA1EFFF);

  /// Cyan M3 theme color for light secondary color.
  static const Color cyanM3LightSecondary = Color(0xFF476365);

  /// Cyan M3 theme color for light secondary container color.
  static const Color cyanM3LightSecondaryContainer = Color(0xFFCAE8EA);

  /// Cyan M3 theme color for light tertiary color.
  static const Color cyanM3LightTertiary = Color(0xFF585C82);

  /// Cyan M3 theme color for light tertiary container color.
  static const Color cyanM3LightTertiaryContainer = Color(0xFFDFE0FF);

  /// Cyan M3 theme color for dark primary color.
  static const Color cyanM3DarkPrimary = Color(0xFF44D8F1);

  /// Cyan M3 theme color for dark primary container color.
  static const Color cyanM3DarkPrimaryContainer = Color(0xFF004E59);

  /// Cyan M3 theme color for dark secondary color.
  static const Color cyanM3DarkSecondary = Color(0xFFAECCCE);

  /// Cyan M3 theme color for dark secondary container color.
  static const Color cyanM3DarkSecondaryContainer = Color(0xFF304B4D);

  /// Cyan M3 theme color for dark tertiary color.
  static const Color cyanM3DarkTertiary = Color(0xFFC0C3EF);

  /// Cyan M3 theme color for dark tertiary container color.
  static const Color cyanM3DarkTertiaryContainer = Color(0xFF404468);

  /// English name of the teal M3 theme.
  static const String tealM3Name = 'Blue stone teal';

  /// English description of the teal M3 theme.
  static const String tealM3Description =
      'Blue stone teal based Material 3 theme';

  /// Teal M3 theme color for light primary color.
  ///
  /// This is primary color you get when you seed from M2 [Colors.teal].
  static const Color tealM3LightPrimary = Color(0xFF006A60);

  /// Teal M3 theme color for light primary container color.
  static const Color tealM3LightPrimaryContainer = Color(0xFFBBEDE6);

  /// Teal M3 theme color for light secondary color.
  static const Color tealM3LightSecondary = Color(0xFF4A635F);

  /// Teal M3 theme color for light secondary container color.
  static const Color tealM3LightSecondaryContainer = Color(0xFFCCE8E2);

  /// Teal M3 theme color for light tertiary color.
  static const Color tealM3LightTertiary = Color(0xFF48617A);

  /// Teal M3 theme color for light tertiary container color.
  static const Color tealM3LightTertiaryContainer = Color(0xFFCFE5FF);

  /// Teal M3 theme color for dark primary color.
  static const Color tealM3DarkPrimary = Color(0xFF53DBCA);

  /// Teal M3 theme color for dark primary container color.
  static const Color tealM3DarkPrimaryContainer = Color(0xFF005048);

  /// Teal M3 theme color for dark secondary color.
  static const Color tealM3DarkSecondary = Color(0xFFAECCCE);

  /// Teal M3 theme color for dark secondary container color.
  static const Color tealM3DarkSecondaryContainer = Color(0xFF304B4D);

  /// Teal M3 theme color for dark tertiary color.
  static const Color tealM3DarkTertiary = Color(0xFFC0C3EF);

  /// Teal M3 theme color for dark tertiary container color.
  static const Color tealM3DarkTertiaryContainer = Color(0xFF404468);

  /// English name of the green M3 theme.
  static const String greenM3Name = 'Camarone green';

  /// English description of the green M3 theme.
  static const String greenM3Description =
      'Camarone green based Material 3 theme';

  /// Green M3 theme color for light primary color.
  ///
  /// This is primary color you get when you seed from M2 [Colors.green].
  static const Color greenM3LightPrimary = Color(0xFF006E1C);

  /// Green M3 theme color for light primary container color.
  static const Color greenM3LightPrimaryContainer = Color(0xFFB6F2AF);

  /// Green M3 theme color for light secondary color.
  static const Color greenM3LightSecondary = Color(0xFF36855E);

  /// Green M3 theme color for light secondary container color.
  static const Color greenM3LightSecondaryContainer = Color(0xFFC0FFD8);

  /// Green M3 theme color for light tertiary color.
  static const Color greenM3LightTertiary = Color(0xFF00658C);

  /// Green M3 theme color for light tertiary container color.
  static const Color greenM3LightTertiaryContainer = Color(0xFFC5E7FF);

  /// Green M3 theme color for dark primary color.
  static const Color greenM3DarkPrimary = Color(0xFF7EDB7B);

  /// Green M3 theme color for dark primary container color.
  static const Color greenM3DarkPrimaryContainer = Color(0xFF005313);

  /// Green M3 theme color for dark secondary color.
  static const Color greenM3DarkSecondary = Color(0xFFA3F4C5);

  /// Green M3 theme color for dark secondary container color.
  static const Color greenM3DarkSecondaryContainer = Color(0xFF003822);

  /// Green M3 theme color for dark tertiary color.
  static const Color greenM3DarkTertiary = Color(0xFF87CFFB);

  /// Green M3 theme color for dark tertiary container color.
  static const Color greenM3DarkTertiaryContainer = Color(0xFF004C6A);

  /// English name of the lime M3 theme.
  static const String limeM3Name = 'Verdun lime';

  /// English description of the lime M3 theme.
  static const String limeM3Description = 'Verdun lime based Material 3 theme';

  // TODO(rydmike): Consider reporting issue with Lime case to Material team.
  // TODO(rydmike): Check if MCU3 avoids this issue when using avoid bad colors.

  /// Lime M3 theme color for light primary color.
  ///
  /// This is primary color you get when you seed from M2 [Colors.lime].
  ///
  /// In this case it almost the result from the lime color. The result from
  /// Here we use 0xFF596400 because the result M2 Colors.lime[500] is
  /// 0xFF5B6300, and it produces very bright surface. Feels like a bug in the
  /// Material Color Utilities algorithm since it does not produce a smooth
  /// tone set, it suddenly jumps and gets much brighter at tone 99.
  static const Color limeM3LightPrimary = Color(0xFF556500);

  /// Lime M3 theme color for light primary container color.
  static const Color limeM3LightPrimaryContainer = Color(0xFFDAEB8F);

  /// Lime M3 theme color for light secondary color.
  static const Color limeM3LightSecondary = Color(0xFF8C7519);

  /// Lime M3 theme color for light secondary container color.
  static const Color limeM3LightSecondaryContainer = Color(0xFFFFF0C7);

  /// Lime M3 theme color for light tertiary color.
  static const Color limeM3LightTertiary = Color(0xFF00687B);

  /// Lime M3 theme color for light tertiary container color.
  static const Color limeM3LightTertiaryContainer = Color(0xFFAEECFF);

  /// Lime M3 theme color for dark primary color.
  static const Color limeM3DarkPrimary = Color(0xFFBCD063);

  /// Lime M3 theme color for dark primary container color.
  static const Color limeM3DarkPrimaryContainer = Color(0xFF3F4C00);

  /// Lime M3 theme color for dark secondary color.
  static const Color limeM3DarkSecondary = Color(0xFFFFE17B);

  /// Lime M3 theme color for dark secondary container color.
  static const Color limeM3DarkSecondaryContainer = Color(0xFF3B2F00);

  /// Lime M3 theme color for dark tertiary color.
  static const Color limeM3DarkTertiary = Color(0xFF78D3EC);

  /// Lime M3 theme color for dark tertiary container color.
  static const Color limeM3DarkTertiaryContainer = Color(0xFF224E43);

  /// English name of the yellow M3 theme.
  static const String yellowM3Name = 'Yukon gold yellow';

  /// English description of the yellow M3 theme.
  static const String yellowM3Description =
      'Yukon gold yellow based Material 3 theme';

  /// Yellow M3 theme color for light primary color.
  ///
  /// This is primary color you get when you seed from M2 [Colors.yellow].
  static const Color yellowM3LightPrimary = Color(0xFF695F00);

  /// Yellow M3 theme color for light primary container color.
  static const Color yellowM3LightPrimaryContainer = Color(0xFFF3E47F);

  /// Yellow M3 theme color for light secondary color.
  static const Color yellowM3LightSecondary = Color(0xFF7C7B16);

  /// Yellow M3 theme color for light secondary container color.
  static const Color yellowM3LightSecondaryContainer = Color(0xFFF8F591);

  /// Yellow M3 theme color for light tertiary color.
  static const Color yellowM3LightTertiary = Color(0xFF375F97);

  /// Yellow M3 theme color for light tertiary container color.
  static const Color yellowM3LightTertiaryContainer = Color(0xFFD5E3FF);

  /// Yellow M3 theme color for dark primary color.
  static const Color yellowM3DarkPrimary = Color(0xFFD8C84F);

  /// Yellow M3 theme color for dark primary container color.
  static const Color yellowM3DarkPrimaryContainer = Color(0xFF4F4700);

  /// Yellow M3 theme color for dark secondary color.
  static const Color yellowM3DarkSecondary = Color(0xFFE9E784);

  /// Yellow M3 theme color for dark secondary container color.
  static const Color yellowM3DarkSecondaryContainer = Color(0xFF333200);

  /// Yellow M3 theme color for dark tertiary color.
  static const Color yellowM3DarkTertiary = Color(0xFFA7C8FF);

  /// Yellow M3 theme color for dark tertiary container color.
  static const Color yellowM3DarkTertiaryContainer = Color(0xFF1B477E);

  /// English name of the orange M3 theme.
  static const String orangeM3Name = 'Brown orange';

  /// English description of the orange M3 theme.
  static const String orangeM3Description =
      'Brown orange based Material 3 theme';

  /// Orange M3 theme color for light primary color.
  ///
  /// This is primary color you get when you seed from M2 [Colors.orange].
  static const Color orangeM3LightPrimary = Color(0xFF8B5000);

  /// Orange M3 theme color for light primary container color.
  static const Color orangeM3LightPrimaryContainer = Color(0xFFFFDCBE);

  /// Orange M3 theme color for light secondary color.
  static const Color orangeM3LightSecondary = Color(0xFFB6602F);

  /// Orange M3 theme color for light secondary container color.
  static const Color orangeM3LightSecondaryContainer = Color(0xFFFFEDE6);

  /// Orange M3 theme color for light tertiary color.
  static const Color orangeM3LightTertiary = Color(0xFF466827);

  /// Orange M3 theme color for light tertiary container color.
  static const Color orangeM3LightTertiaryContainer = Color(0xFFC6EF9F);

  /// Orange M3 theme color for dark primary color.
  static const Color orangeM3DarkPrimary = Color(0xFFFFB871);

  /// Orange M3 theme color for dark primary container color.
  static const Color orangeM3DarkPrimaryContainer = Color(0xFF6A3C00);

  /// Orange M3 theme color for dark secondary color.
  static const Color orangeM3DarkSecondary = Color(0xFFFFDBCB);

  /// Orange M3 theme color for dark secondary container color.
  static const Color orangeM3DarkSecondaryContainer = Color(0xFF552000);

  /// Orange M3 theme color for dark tertiary color.
  static const Color orangeM3DarkTertiary = Color(0xFFABD285);

  /// Orange M3 theme color for dark tertiary container color.
  static const Color orangeM3DarkTertiaryContainer = Color(0xFF2F4F11);

  /// English name of the deepOrange M3 theme.
  static const String deepOrangeM3Name = 'Rust deep orange';

  /// English description of the deepOrange M3 theme.
  static const String deepOrangeM3Description =
      'Rust deep orange based Material 3 theme';

  /// Deep orange M3 theme color for light primary color.
  ///
  /// This is primary color you get when you seed from M2 [Colors.deepOrange].
  static const Color deepOrangeM3LightPrimary = Color(0xFFBF360C);

  /// Deep orange M3 theme color for light primary container color.
  static const Color deepOrangeM3LightPrimaryContainer = Color(0xFFFFDBD1);

  /// Deep orange M3 theme color for light secondary color.
  static const Color deepOrangeM3LightSecondary = Color(0xFFBE593B);

  /// Deep orange M3 theme color for light secondary container color.
  static const Color deepOrangeM3LightSecondaryContainer = Color(0xFFFFEDE8);

  /// Deep orange M3 theme color for light tertiary color.
  static const Color deepOrangeM3LightTertiary = Color(0xFF466827);

  /// Deep orange M3 theme color for light tertiary container color.
  static const Color deepOrangeM3LightTertiaryContainer = Color(0xFFC6EF9F);

  /// Deep orange M3 theme color for dark primary color.
  static const Color deepOrangeM3DarkPrimary = Color(0xFFFFB5A0);

  /// Deep orange M3 theme color for dark primary container color.
  static const Color deepOrangeM3DarkPrimaryContainer = Color(0xFF862200);

  /// Deep orange M3 theme color for dark secondary color.
  static const Color deepOrangeM3DarkSecondary = Color(0xFFFFDBD1);

  /// Deep orange M3 theme color for dark secondary container color.
  static const Color deepOrangeM3DarkSecondaryContainer = Color(0xFF5F1600);

  /// Deep orange M3 theme color for dark tertiary color.
  static const Color deepOrangeM3DarkTertiary = Color(0xFFABD285);

  /// Deep orange M3 theme color for dark tertiary container color.
  static const Color deepOrangeM3DarkTertiaryContainer = Color(0xFF2F4F11);

  /// English name of the custom theme.
  static const String customName = 'Custom';

  /// English description of the custom theme.
  static const String customDescription = 'Define a custom color scheme';

  /// Material default color scheme based FlexSchemeData.
  static const FlexSchemeData material = FlexSchemeData(
    name: materialName,
    description: materialDescription,
    light: FlexSchemeColor(
      primary: materialLightPrimary,
      primaryContainer: materialLightPrimaryContainer,
      secondary: materialLightSecondary,
      secondaryContainer: materialLightSecondaryContainer,
      tertiary: materialLightTertiary,
      tertiaryContainer: materialLightTertiaryContainer,
      appBarColor: materialLightTertiary,
      error: materialLightError,
      swapOnMaterial3: true,
    ),
    dark: FlexSchemeColor(
      primary: materialDarkPrimary,
      primaryContainer: materialDarkPrimaryContainer,
      secondary: materialDarkSecondary,
      secondaryContainer: materialDarkSecondaryContainer,
      tertiary: materialDarkTertiary,
      tertiaryContainer: materialDarkTertiaryContainer,
      appBarColor: materialDarkTertiary,
      error: materialDarkError,
      swapOnMaterial3: true,
    ),
  );

  /// Material default high contrast color scheme based FlexSchemeData.
  static const FlexSchemeData materialHc = FlexSchemeData(
    name: materialHcName,
    description: materialHcDescription,
    light: FlexSchemeColor(
      primary: materialLightPrimaryHc,
      primaryContainer: materialLightPrimaryContainerHc,
      secondary: materialLightSecondaryHc,
      secondaryContainer: materialLightSecondaryContainerHc,
      tertiary: materialLightTertiaryHc,
      tertiaryContainer: materialLightTertiaryContainerHc,
      appBarColor: materialLightTertiaryHc,
      error: materialLightErrorHc,
      swapOnMaterial3: true,
    ),
    dark: FlexSchemeColor(
      primary: materialDarkPrimaryHc,
      primaryContainer: materialDarkPrimaryContainerHc,
      secondary: materialDarkSecondaryHc,
      secondaryContainer: materialDarkSecondaryContainerHc,
      tertiary: materialDarkTertiaryHc,
      tertiaryContainer: materialDarkTertiaryContainerHc,
      appBarColor: materialDarkTertiaryHc,
      error: materialDarkErrorHc,
      swapOnMaterial3: true,
    ),
  );

  /// Material blue color scheme based FlexSchemeData.
  static const FlexSchemeData blue = FlexSchemeData(
    name: blueName,
    description: blueDescription,
    light: FlexSchemeColor(
      primary: blueLightPrimary,
      primaryContainer: blueLightPrimaryContainer,
      secondary: blueLightSecondary,
      secondaryContainer: blueLightSecondaryContainer,
      tertiary: blueLightTertiary,
      tertiaryContainer: blueLightTertiaryContainer,
      appBarColor: blueLightTertiary,
      error: materialLightError,
      swapOnMaterial3: true,
    ),
    dark: FlexSchemeColor(
      primary: blueDarkPrimary,
      primaryContainer: blueDarkPrimaryContainer,
      secondary: blueDarkSecondary,
      secondaryContainer: blueDarkSecondaryContainer,
      tertiary: blueDarkTertiary,
      tertiaryContainer: blueDarkTertiaryContainer,
      appBarColor: blueDarkTertiary,
      error: materialDarkError,
      swapOnMaterial3: true,
    ),
  );

  /// Material indigo and deep purple color scheme based FlexSchemeData.
  static const FlexSchemeData indigo = FlexSchemeData(
    name: indigoName,
    description: indigoDescription,
    light: FlexSchemeColor(
      primary: indigoLightPrimary,
      primaryContainer: indigoLightPrimaryContainer,
      secondary: indigoLightSecondary,
      secondaryContainer: indigoLightSecondaryContainer,
      tertiary: indigoLightTertiary,
      tertiaryContainer: indigoLightTertiaryContainer,
      appBarColor: indigoLightTertiary,
      error: materialLightError,
    ),
    dark: FlexSchemeColor(
      primary: indigoDarkPrimary,
      primaryContainer: indigoDarkPrimaryContainer,
      secondary: indigoDarkSecondary,
      secondaryContainer: indigoDarkSecondaryContainer,
      tertiary: indigoDarkTertiary,
      tertiaryContainer: indigoDarkTertiaryContainer,
      appBarColor: indigoDarkTertiary,
      error: materialDarkError,
    ),
  );

  /// Hippie blue with surfie green and chock coral pink based FlexSchemeData.
  static const FlexSchemeData hippieBlue = FlexSchemeData(
    name: hippieBlueName,
    description: hippieBlueDescription,
    light: FlexSchemeColor(
      primary: hippieBlueLightPrimary,
      primaryContainer: hippieBlueLightPrimaryContainer,
      secondary: hippieBlueLightSecondary,
      secondaryContainer: hippieBlueLightSecondaryContainer,
      tertiary: hippieBlueLightTertiary,
      tertiaryContainer: hippieBlueLightTertiaryContainer,
      appBarColor: hippieBlueLightTertiary,
      error: materialLightError,
      swapOnMaterial3: true,
    ),
    dark: FlexSchemeColor(
      primary: hippieBlueDarkPrimary,
      primaryContainer: hippieBlueDarkPrimaryContainer,
      secondary: hippieBlueDarkSecondary,
      secondaryContainer: hippieBlueDarkSecondaryContainer,
      tertiary: hippieBlueDarkTertiary,
      tertiaryContainer: hippieBlueDarkTertiaryContainer,
      appBarColor: hippieBlueDarkTertiary,
      error: materialDarkError,
      swapOnMaterial3: true,
    ),
  );

  /// Aqua tropical blue ocean color scheme based FlexSchemeData.
  static const FlexSchemeData aquaBlue = FlexSchemeData(
    name: aquaBlueName,
    description: aquaBlueDescription,
    light: FlexSchemeColor(
      primary: aquaBlueLightPrimary,
      primaryContainer: aquaBlueLightPrimaryContainer,
      secondary: aquaBlueLightSecondary,
      secondaryContainer: aquaBlueLightSecondaryContainer,
      tertiary: aquaBlueLightTertiary,
      tertiaryContainer: aquaBlueLightTertiaryContainer,
      appBarColor: aquaBlueLightTertiary,
      error: materialLightError,
    ),
    dark: FlexSchemeColor(
      primary: aquaBlueDarkPrimary,
      primaryContainer: aquaBlueDarkPrimaryContainer,
      secondary: aquaBlueDarkSecondary,
      secondaryContainer: aquaBlueDarkSecondaryContainer,
      tertiary: aquaBlueDarkTertiary,
      tertiaryContainer: aquaBlueDarkTertiaryContainer,
      appBarColor: aquaBlueDarkTertiary,
      error: materialDarkError,
    ),
  );

  /// Brand blues theme color based FlexSchemeData.
  static const FlexSchemeData brandBlue = FlexSchemeData(
    name: brandBlueName,
    description: brandBlueDescription,
    light: FlexSchemeColor(
      primary: brandBlueLightPrimary,
      primaryContainer: brandBlueLightPrimaryContainer,
      secondary: brandBlueLightSecondary,
      secondaryContainer: brandBlueLightSecondaryContainer,
      tertiary: brandBlueLightTertiary,
      tertiaryContainer: brandBlueLightTertiaryContainer,
      appBarColor: brandBlueLightTertiary,
      error: materialLightError,
    ),
    dark: FlexSchemeColor(
      primary: brandBlueDarkPrimary,
      primaryContainer: brandBlueDarkPrimaryContainer,
      secondary: brandBlueDarkSecondary,
      secondaryContainer: brandBlueDarkSecondaryContainer,
      tertiary: brandBlueDarkTertiary,
      tertiaryContainer: brandBlueDarkTertiaryContainer,
      appBarColor: brandBlueDarkTertiary,
      error: materialDarkError,
    ),
  );

  /// Dark deep blue sea color based FlexSchemeData.
  static const FlexSchemeData deepBlue = FlexSchemeData(
    name: deepBlueName,
    description: deepBlueDescription,
    light: FlexSchemeColor(
      primary: deepBlueLightPrimary,
      primaryContainer: deepBlueLightPrimaryContainer,
      secondary: deepBlueLightSecondary,
      secondaryContainer: deepBlueLightSecondaryContainer,
      tertiary: deepBlueLightTertiary,
      tertiaryContainer: deepBlueLightTertiaryContainer,
      appBarColor: deepBlueLightTertiary,
      error: materialLightError,
    ),
    dark: FlexSchemeColor(
      primary: deepBlueDarkPrimary,
      primaryContainer: deepBlueDarkPrimaryContainer,
      secondary: deepBlueDarkSecondary,
      secondaryContainer: deepBlueDarkSecondaryContainer,
      tertiary: deepBlueDarkTertiary,
      tertiaryContainer: deepBlueDarkTertiaryContainer,
      appBarColor: deepBlueDarkTertiary,
      error: materialDarkError,
    ),
  );

  /// Sakura cherry blossom like colors based FlexSchemeData.
  static const FlexSchemeData sakura = FlexSchemeData(
    name: sakuraName,
    description: sakuraDescription,
    light: FlexSchemeColor(
      primary: sakuraLightPrimary,
      primaryContainer: sakuraLightPrimaryContainer,
      secondary: sakuraLightSecondary,
      secondaryContainer: sakuraLightSecondaryContainer,
      tertiary: sakuraLightTertiary,
      tertiaryContainer: sakuraLightTertiaryContainer,
      appBarColor: sakuraLightTertiary,
      error: materialLightErrorHc,
    ),
    dark: FlexSchemeColor(
      primary: sakuraDarkPrimary,
      primaryContainer: sakuraDarkPrimaryContainer,
      secondary: sakuraDarkSecondary,
      secondaryContainer: sakuraDarkSecondaryContainer,
      tertiary: sakuraDarkTertiary,
      tertiaryContainer: sakuraDarkTertiaryContainer,
      appBarColor: sakuraDarkTertiary,
      error: materialDarkError,
    ),
  );

  /// Mandy red and Viking blue inspired colors based FlexSchemeData.
  static const FlexSchemeData mandyRed = FlexSchemeData(
    name: mandyRedName,
    description: mandyRedDescription,
    light: FlexSchemeColor(
      primary: mandyRedLightPrimary,
      primaryContainer: mandyRedLightPrimaryContainer,
      secondary: mandyRedLightSecondary,
      secondaryContainer: mandyRedLightSecondaryContainer,
      tertiary: mandyRedLightTertiary,
      tertiaryContainer: mandyRedLightTertiaryContainer,
      appBarColor: mandyRedLightTertiary,
      error: materialLightErrorHc,
      swapOnMaterial3: true,
    ),
    dark: FlexSchemeColor(
      primary: mandyRedDarkPrimary,
      primaryContainer: mandyRedDarkPrimaryContainer,
      secondary: mandyRedDarkSecondary,
      secondaryContainer: mandyRedDarkSecondaryContainer,
      tertiary: mandyRedDarkTertiary,
      tertiaryContainer: mandyRedDarkTertiaryContainer,
      appBarColor: mandyRedDarkTertiary,
      error: materialDarkError,
      swapOnMaterial3: true,
    ),
  );

  /// Material red and pink colors based FlexSchemeData.
  static const FlexSchemeData red = FlexSchemeData(
    name: redName,
    description: redDescription,
    light: FlexSchemeColor(
      primary: redLightPrimary,
      primaryContainer: redLightPrimaryContainer,
      secondary: redLightSecondary,
      secondaryContainer: redLightSecondaryContainer,
      tertiary: redLightTertiary,
      tertiaryContainer: redLightTertiaryContainer,
      appBarColor: redLightTertiary,
      error: materialLightErrorHc,
      swapOnMaterial3: true,
    ),
    dark: FlexSchemeColor(
      primary: redDarkPrimary,
      primaryContainer: redDarkPrimaryContainer,
      secondary: redDarkSecondary,
      secondaryContainer: redDarkSecondaryContainer,
      tertiary: redDarkTertiary,
      tertiaryContainer: redDarkTertiaryContainer,
      appBarColor: redDarkTertiary,
      error: materialDarkError,
      swapOnMaterial3: true,
    ),
  );

  /// Red wine like colors based FlexSchemeData.
  static const FlexSchemeData redWine = FlexSchemeData(
    name: redWineName,
    description: redWineDescription,
    light: FlexSchemeColor(
      primary: redWineLightPrimary,
      primaryContainer: redWineLightPrimaryContainer,
      secondary: redWineLightSecondary,
      secondaryContainer: redWineLightSecondaryContainer,
      tertiary: redWineLightTertiary,
      tertiaryContainer: redWineLightTertiaryContainer,
      appBarColor: redWineLightTertiary,
      error: materialLightErrorHc,
      swapOnMaterial3: true,
    ),
    dark: FlexSchemeColor(
      primary: redWineDarkPrimary,
      primaryContainer: redWineDarkPrimaryContainer,
      secondary: redWineDarkSecondary,
      secondaryContainer: redWineDarkSecondaryContainer,
      tertiary: redWineDarkTertiary,
      tertiaryContainer: redWineDarkTertiaryContainer,
      appBarColor: redWineDarkTertiary,
      error: materialDarkError,
      swapOnMaterial3: true,
    ),
  );

  /// Purple brown tinted aubergine and eggplant colored based FlexSchemeData.
  static const FlexSchemeData purpleBrown = FlexSchemeData(
    name: purpleBrownName,
    description: purpleBrownDescription,
    light: FlexSchemeColor(
      primary: purpleBrownLightPrimary,
      primaryContainer: purpleBrownLightPrimaryContainer,
      secondary: purpleBrownLightSecondary,
      secondaryContainer: purpleBrownLightSecondaryContainer,
      tertiary: purpleBrownLightTertiary,
      tertiaryContainer: purpleBrownLightTertiaryContainer,
      appBarColor: purpleBrownLightTertiary,
      error: materialLightError,
      swapOnMaterial3: true,
    ),
    dark: FlexSchemeColor(
      primary: purpleBrownDarkPrimary,
      primaryContainer: purpleBrownDarkPrimaryContainer,
      secondary: purpleBrownDarkSecondary,
      secondaryContainer: purpleBrownDarkSecondaryContainer,
      tertiary: purpleBrownDarkTertiary,
      tertiaryContainer: purpleBrownDarkTertiaryContainer,
      appBarColor: purpleBrownDarkTertiary,
      error: materialDarkError,
      swapOnMaterial3: true,
    ),
  );

  /// Material green and cyan colors based FlexSchemeData.
  static const FlexSchemeData green = FlexSchemeData(
    name: greenName,
    description: greenDescription,
    light: FlexSchemeColor(
      primary: greenLightPrimary,
      primaryContainer: greenLightPrimaryContainer,
      secondary: greenLightSecondary,
      secondaryContainer: greenLightSecondaryContainer,
      tertiary: greenLightTertiary,
      tertiaryContainer: greenLightTertiaryContainer,
      appBarColor: greenLightTertiary,
      error: materialLightErrorHc,
      swapOnMaterial3: true,
    ),
    dark: FlexSchemeColor(
      primary: greenDarkPrimary,
      primaryContainer: greenDarkPrimaryContainer,
      secondary: greenDarkSecondary,
      secondaryContainer: greenDarkSecondaryContainer,
      tertiary: greenDarkTertiary,
      tertiaryContainer: greenDarkTertiaryContainer,
      appBarColor: greenDarkTertiary,
      error: materialDarkError,
      swapOnMaterial3: true,
    ),
  );

  /// Green money and finance style colors based FlexSchemeData.
  static const FlexSchemeData money = FlexSchemeData(
    name: moneyName,
    description: moneyDescription,
    light: FlexSchemeColor(
      primary: moneyLightPrimary,
      primaryContainer: moneyLightPrimaryContainer,
      secondary: moneyLightSecondary,
      secondaryContainer: moneyLightSecondaryContainer,
      tertiary: moneyLightTertiary,
      tertiaryContainer: moneyLightTertiaryContainer,
      appBarColor: moneyLightTertiary,
      error: materialLightErrorHc,
      swapOnMaterial3: true,
    ),
    dark: FlexSchemeColor(
      primary: moneyDarkPrimary,
      primaryContainer: moneyDarkPrimaryContainer,
      secondary: moneyDarkSecondary,
      secondaryContainer: moneyDarkSecondaryContainer,
      tertiary: moneyDarkTertiary,
      tertiaryContainer: moneyDarkTertiaryContainer,
      appBarColor: moneyDarkTertiary,
      error: materialDarkError,
      swapOnMaterial3: true,
    ),
  );

  /// Green jungle and rain forest colors based FlexSchemeData.
  static const FlexSchemeData jungle = FlexSchemeData(
    name: jungleName,
    description: jungleDescription,
    light: FlexSchemeColor(
      primary: jungleLightPrimary,
      primaryContainer: jungleLightPrimaryContainer,
      secondary: jungleLightSecondary,
      secondaryContainer: jungleLightSecondaryContainer,
      tertiary: jungleLightTertiary,
      tertiaryContainer: jungleLightTertiaryContainer,
      appBarColor: jungleLightTertiary,
      error: materialLightErrorHc,
      swapOnMaterial3: true,
    ),
    dark: FlexSchemeColor(
      primary: jungleDarkPrimary,
      primaryContainer: jungleDarkPrimaryContainer,
      secondary: jungleDarkSecondary,
      secondaryContainer: jungleDarkSecondaryContainer,
      tertiary: jungleDarkTertiary,
      tertiaryContainer: jungleDarkTertiaryContainer,
      appBarColor: jungleDarkTertiary,
      error: materialDarkError,
      swapOnMaterial3: true,
    ),
  );

  /// Material blue grey and ultra dark purple colors based FlexSchemeData.
  static const FlexSchemeData greyLaw = FlexSchemeData(
    name: greyLawName,
    description: greyLawDescription,
    light: FlexSchemeColor(
      primary: greyLawLightPrimary,
      primaryContainer: greyLawLightPrimaryContainer,
      secondary: greyLawLightSecondary,
      secondaryContainer: greyLawLightSecondaryContainer,
      tertiary: greyLawLightTertiary,
      tertiaryContainer: greyLawLightTertiaryContainer,
      appBarColor: greyLawLightTertiary,
      error: materialLightErrorHc,
      swapOnMaterial3: true,
    ),
    dark: FlexSchemeColor(
      primary: greyLawDarkPrimary,
      primaryContainer: greyLawDarkPrimaryContainer,
      secondary: greyLawDarkSecondary,
      secondaryContainer: greyLawDarkSecondaryContainer,
      tertiary: greyLawDarkTertiary,
      tertiaryContainer: greyLawDarkTertiaryContainer,
      appBarColor: greyLawDarkTertiary,
      error: materialDarkError,
      swapOnMaterial3: true,
    ),
  );

  /// Willow and wasabi green colors based FlexSchemeData.
  static const FlexSchemeData wasabi = FlexSchemeData(
    name: wasabiName,
    description: wasabiDescription,
    light: FlexSchemeColor(
      primary: wasabiLightPrimary,
      primaryContainer: wasabiLightPrimaryContainer,
      secondary: wasabiLightSecondary,
      secondaryContainer: wasabiLightSecondaryContainer,
      tertiary: wasabiLightTertiary,
      tertiaryContainer: wasabiLightTertiaryContainer,
      appBarColor: wasabiLightTertiary,
      error: materialLightErrorHc,
      swapOnMaterial3: true,
    ),
    dark: FlexSchemeColor(
      primary: wasabiDarkPrimary,
      primaryContainer: wasabiDarkPrimaryContainer,
      secondary: wasabiDarkSecondary,
      secondaryContainer: wasabiDarkSecondaryContainer,
      tertiary: wasabiDarkTertiary,
      tertiaryContainer: wasabiDarkTertiaryContainer,
      appBarColor: wasabiDarkTertiary,
      error: materialDarkError,
      swapOnMaterial3: true,
    ),
  );

  /// Gold sunset colors based FlexSchemeData.
  static const FlexSchemeData gold = FlexSchemeData(
    name: goldName,
    description: goldDescription,
    light: FlexSchemeColor(
      primary: goldLightPrimary,
      primaryContainer: goldLightPrimaryContainer,
      secondary: goldLightSecondary,
      secondaryContainer: goldLightSecondaryContainer,
      tertiary: goldLightTertiary,
      tertiaryContainer: goldLightTertiaryContainer,
      appBarColor: goldLightTertiary,
      error: materialLightErrorHc,
      swapOnMaterial3: true,
    ),
    dark: FlexSchemeColor(
      primary: goldDarkPrimary,
      primaryContainer: goldDarkPrimaryContainer,
      secondary: goldDarkSecondary,
      secondaryContainer: goldDarkSecondaryContainer,
      tertiary: goldDarkTertiary,
      tertiaryContainer: goldDarkTertiaryContainer,
      appBarColor: goldDarkTertiary,
      error: materialDarkError,
      swapOnMaterial3: true,
    ),
  );

  /// Orange and green Mango mojito colors based FlexSchemeData.
  static const FlexSchemeData mango = FlexSchemeData(
    name: mangoName,
    description: mangoDescription,
    light: FlexSchemeColor(
      primary: mangoLightPrimary,
      primaryContainer: mangoLightPrimaryContainer,
      secondary: mangoLightSecondary,
      secondaryContainer: mangoLightSecondaryContainer,
      tertiary: mangoLightTertiary,
      tertiaryContainer: mangoLightTertiaryContainer,
      appBarColor: mangoLightTertiary,
      error: materialLightError,
      swapOnMaterial3: true,
    ),
    dark: FlexSchemeColor(
      primary: mangoDarkPrimary,
      primaryContainer: mangoDarkPrimaryContainer,
      secondary: mangoDarkSecondary,
      secondaryContainer: mangoDarkSecondaryContainer,
      tertiary: mangoDarkTertiary,
      tertiaryContainer: mangoDarkTertiaryContainer,
      appBarColor: mangoDarkTertiary,
      error: materialDarkError,
      swapOnMaterial3: true,
    ),
  );

  /// Material amber and blue accent colors based FlexSchemeData.
  ///
  /// This is a high contrast color scheme, an alternative to the Material
  /// design hih contrast color scheme set [FlexColor.materialHc].
  static const FlexSchemeData amber = FlexSchemeData(
    name: amberName,
    description: amberDescription,
    light: FlexSchemeColor(
      primary: amberLightPrimary,
      primaryContainer: amberLightPrimaryContainer,
      secondary: amberLightSecondary,
      secondaryContainer: amberLightSecondaryContainer,
      tertiary: amberLightTertiary,
      tertiaryContainer: amberLightTertiaryContainer,
      appBarColor: amberLightTertiary,
      error: materialLightError,
    ),
    dark: FlexSchemeColor(
      primary: amberDarkPrimary,
      primaryContainer: amberDarkPrimaryContainer,
      secondary: amberDarkSecondary,
      secondaryContainer: amberDarkSecondaryContainer,
      tertiary: amberDarkTertiary,
      tertiaryContainer: amberDarkTertiaryContainer,
      appBarColor: amberDarkTertiary,
      error: materialDarkError,
    ),
  );

  /// Vesuvius burned orange and eden green colors based FlexSchemeData.
  static const FlexSchemeData vesuviusBurn = FlexSchemeData(
    name: vesuviusBurnName,
    description: vesuviusBurnDescription,
    light: FlexSchemeColor(
      primary: vesuviusBurnLightPrimary,
      primaryContainer: vesuviusBurnLightPrimaryContainer,
      secondary: vesuviusBurnLightSecondary,
      secondaryContainer: vesuviusBurnLightSecondaryContainer,
      tertiary: vesuviusBurnLightTertiary,
      tertiaryContainer: vesuviusBurnLightTertiaryContainer,
      appBarColor: vesuviusBurnLightTertiary,
      error: materialLightError,
    ),
    dark: FlexSchemeColor(
      primary: vesuviusBurnDarkPrimary,
      primaryContainer: vesuviusBurnDarkPrimaryContainer,
      secondary: vesuviusBurnDarkSecondary,
      secondaryContainer: vesuviusBurnDarkSecondaryContainer,
      tertiary: vesuviusBurnDarkTertiary,
      tertiaryContainer: vesuviusBurnDarkTertiaryContainer,
      appBarColor: vesuviusBurnDarkTertiary,
      error: materialDarkError,
    ),
  );

  /// Material deepPurple and lightBlueAccent colors based FlexSchemeData.
  static const FlexSchemeData deepPurple = FlexSchemeData(
    name: deepPurpleName,
    description: deepPurpleDescription,
    light: FlexSchemeColor(
      primary: deepPurpleLightPrimary,
      primaryContainer: deepPurpleLightPrimaryContainer,
      secondary: deepPurpleLightSecondary,
      secondaryContainer: deepPurpleLightSecondaryContainer,
      tertiary: deepPurpleLightTertiary,
      tertiaryContainer: deepPurpleLightTertiaryContainer,
      appBarColor: deepPurpleLightTertiary,
      error: materialLightError,
      swapOnMaterial3: true,
    ),
    dark: FlexSchemeColor(
      primary: deepPurpleDarkPrimary,
      primaryContainer: deepPurpleDarkPrimaryContainer,
      secondary: deepPurpleDarkSecondary,
      secondaryContainer: deepPurpleDarkSecondaryContainer,
      tertiary: deepPurpleDarkTertiary,
      tertiaryContainer: deepPurpleDarkTertiaryContainer,
      appBarColor: deepPurpleDarkTertiary,
      error: materialDarkError,
      swapOnMaterial3: true,
    ),
  );

  /// Ebony clay dark blue-grey and watercourse green colors
  /// based FlexSchemeData.
  static const FlexSchemeData ebonyClay = FlexSchemeData(
    name: ebonyClayName,
    description: ebonyClayDescription,
    light: FlexSchemeColor(
      primary: ebonyClayLightPrimary,
      primaryContainer: ebonyClayLightPrimaryContainer,
      secondary: ebonyClayLightSecondary,
      secondaryContainer: ebonyClayLightSecondaryContainer,
      tertiary: ebonyClayLightTertiary,
      tertiaryContainer: ebonyClayLightTertiaryContainer,
      appBarColor: ebonyClayLightTertiary,
      error: materialLightError,
      swapOnMaterial3: true,
    ),
    dark: FlexSchemeColor(
      primary: ebonyClayDarkPrimary,
      primaryContainer: ebonyClayDarkPrimaryContainer,
      secondary: ebonyClayDarkSecondary,
      secondaryContainer: ebonyClayDarkSecondaryContainer,
      tertiary: ebonyClayDarkTertiary,
      tertiaryContainer: ebonyClayDarkTertiaryContainer,
      appBarColor: ebonyClayDarkTertiary,
      error: materialDarkError,
      swapOnMaterial3: true,
    ),
  );

  /// Barossa red and cardin green colors based FlexSchemeData.
  static const FlexSchemeData barossa = FlexSchemeData(
    name: barossaName,
    description: barossaDescription,
    light: FlexSchemeColor(
      primary: barossaLightPrimary,
      primaryContainer: barossaLightPrimaryContainer,
      secondary: barossaLightSecondary,
      secondaryContainer: barossaLightSecondaryContainer,
      tertiary: barossaLightTertiary,
      tertiaryContainer: barossaLightTertiaryContainer,
      appBarColor: barossaLightTertiary,
      error: materialLightError,
    ),
    dark: FlexSchemeColor(
      primary: barossaDarkPrimary,
      primaryContainer: barossaDarkPrimaryContainer,
      secondary: barossaDarkSecondary,
      secondaryContainer: barossaDarkSecondaryContainer,
      tertiary: barossaDarkTertiary,
      tertiaryContainer: barossaDarkTertiaryContainer,
      appBarColor: barossaDarkTertiary,
      error: materialDarkError,
    ),
  );

  /// Shark grey and orange ecstasy colors based FlexSchemeData.
  static const FlexSchemeData shark = FlexSchemeData(
    name: sharkName,
    description: sharkDescription,
    light: FlexSchemeColor(
      primary: sharkLightPrimary,
      primaryContainer: sharkLightPrimaryContainer,
      secondary: sharkLightSecondary,
      secondaryContainer: sharkLightSecondaryContainer,
      tertiary: sharkLightTertiary,
      tertiaryContainer: sharkLightTertiaryContainer,
      appBarColor: sharkLightTertiary,
      error: materialLightError,
      swapOnMaterial3: true,
    ),
    dark: FlexSchemeColor(
      primary: sharkDarkPrimary,
      primaryContainer: sharkDarkPrimaryContainer,
      secondary: sharkDarkSecondary,
      secondaryContainer: sharkDarkSecondaryContainer,
      tertiary: sharkDarkTertiary,
      tertiaryContainer: sharkDarkTertiaryContainer,
      appBarColor: sharkDarkTertiary,
      error: materialDarkError,
      swapOnMaterial3: true,
    ),
  );

  /// Big stone blue and tulip tree yellow colors based FlexSchemeData.
  static const FlexSchemeData bigStone = FlexSchemeData(
    name: bigStoneName,
    description: bigStoneDescription,
    light: FlexSchemeColor(
      primary: bigStoneLightPrimary,
      primaryContainer: bigStoneLightPrimaryContainer,
      secondary: bigStoneLightSecondary,
      secondaryContainer: bigStoneLightSecondaryContainer,
      tertiary: bigStoneLightTertiary,
      tertiaryContainer: bigStoneLightTertiaryContainer,
      appBarColor: bigStoneLightTertiary,
      error: materialLightError,
    ),
    dark: FlexSchemeColor(
      primary: bigStoneDarkPrimary,
      primaryContainer: bigStoneDarkPrimaryContainer,
      secondary: bigStoneDarkSecondary,
      secondaryContainer: bigStoneDarkSecondaryContainer,
      tertiary: bigStoneDarkTertiary,
      tertiaryContainer: bigStoneDarkTertiaryContainer,
      appBarColor: bigStoneDarkTertiary,
      error: materialDarkError,
    ),
  );

  /// Damask red and lunar green colors based FlexSchemeData.
  static const FlexSchemeData damask = FlexSchemeData(
    name: damaskName,
    description: damaskDescription,
    light: FlexSchemeColor(
      primary: damaskLightPrimary,
      primaryContainer: damaskLightPrimaryContainer,
      secondary: damaskLightSecondary,
      secondaryContainer: damaskLightSecondaryContainer,
      tertiary: damaskLightTertiary,
      tertiaryContainer: damaskLightTertiaryContainer,
      appBarColor: damaskLightTertiary,
      error: materialLightError,
    ),
    dark: FlexSchemeColor(
      primary: damaskDarkPrimary,
      primaryContainer: damaskDarkPrimaryContainer,
      secondary: damaskDarkSecondary,
      secondaryContainer: damaskDarkSecondaryContainer,
      tertiary: damaskDarkTertiary,
      tertiaryContainer: damaskDarkTertiaryContainer,
      appBarColor: damaskDarkTertiary,
      error: materialDarkError,
    ),
  );

  /// Bahama blue and trinidad orange colors based FlexSchemeData.
  static const FlexSchemeData bahamaBlue = FlexSchemeData(
    name: bahamaBlueName,
    description: bahamaBlueDescription,
    light: FlexSchemeColor(
      primary: bahamaBlueLightPrimary,
      primaryContainer: bahamaBlueLightPrimaryContainer,
      secondary: bahamaBlueLightSecondary,
      secondaryContainer: bahamaBlueLightSecondaryContainer,
      tertiary: bahamaBlueLightTertiary,
      tertiaryContainer: bahamaBlueLightTertiaryContainer,
      appBarColor: bahamaBlueLightTertiary,
      error: materialLightError,
      swapOnMaterial3: true,
    ),
    dark: FlexSchemeColor(
      primary: bahamaBlueDarkPrimary,
      primaryContainer: bahamaBlueDarkPrimaryContainer,
      secondary: bahamaBlueDarkSecondary,
      secondaryContainer: bahamaBlueDarkSecondaryContainer,
      tertiary: bahamaBlueDarkTertiary,
      tertiaryContainer: bahamaBlueDarkTertiaryContainer,
      appBarColor: bahamaBlueDarkTertiary,
      error: materialDarkError,
      swapOnMaterial3: true,
    ),
  );

  /// Mallard green and Valencia pink colors based FlexSchemeData.
  static const FlexSchemeData mallardGreen = FlexSchemeData(
    name: mallardGreenName,
    description: mallardGreenDescription,
    light: FlexSchemeColor(
      primary: mallardGreenLightPrimary,
      primaryContainer: mallardGreenLightPrimaryContainer,
      secondary: mallardGreenLightSecondary,
      secondaryContainer: mallardGreenLightSecondaryContainer,
      tertiary: mallardGreenLightTertiary,
      tertiaryContainer: mallardGreenLightTertiaryContainer,
      appBarColor: mallardGreenLightTertiary,
      error: materialLightError,
      swapOnMaterial3: true,
    ),
    dark: FlexSchemeColor(
      primary: mallardGreenDarkPrimary,
      primaryContainer: mallardGreenDarkPrimaryContainer,
      secondary: mallardGreenDarkSecondary,
      secondaryContainer: mallardGreenDarkSecondaryContainer,
      tertiary: mallardGreenDarkTertiary,
      tertiaryContainer: mallardGreenDarkTertiaryContainer,
      appBarColor: mallardGreenDarkTertiary,
      error: materialDarkError,
      swapOnMaterial3: true,
    ),
  );

  /// Espresso dark brown and crema colors based FlexSchemeData.
  static const FlexSchemeData espresso = FlexSchemeData(
    name: espressoName,
    description: espressoDescription,
    light: FlexSchemeColor(
      primary: espressoLightPrimary,
      primaryContainer: espressoLightPrimaryContainer,
      secondary: espressoLightSecondary,
      secondaryContainer: espressoLightSecondaryContainer,
      tertiary: espressoLightTertiary,
      tertiaryContainer: espressoLightTertiaryContainer,
      appBarColor: espressoLightTertiary,
      error: materialLightError,
      swapOnMaterial3: true,
    ),
    dark: FlexSchemeColor(
      primary: espressoDarkPrimary,
      primaryContainer: espressoDarkPrimaryContainer,
      secondary: espressoDarkSecondary,
      secondaryContainer: espressoDarkSecondaryContainer,
      tertiary: espressoDarkTertiary,
      tertiaryContainer: espressoDarkTertiaryContainer,
      appBarColor: espressoDarkTertiary,
      error: materialDarkError,
      swapOnMaterial3: true,
    ),
  );

  /// Outer space dark blue-grey and stage red colors based FlexSchemeData.
  static const FlexSchemeData outerSpace = FlexSchemeData(
    name: outerSpaceName,
    description: outerSpaceDescription,
    light: FlexSchemeColor(
      primary: outerSpaceLightPrimary,
      primaryContainer: outerSpaceLightPrimaryContainer,
      secondary: outerSpaceLightSecondary,
      secondaryContainer: outerSpaceLightSecondaryContainer,
      tertiary: outerSpaceLightTertiary,
      tertiaryContainer: outerSpaceLightTertiaryContainer,
      appBarColor: outerSpaceLightTertiary,
      error: materialLightError,
      swapOnMaterial3: true,
    ),
    dark: FlexSchemeColor(
      primary: outerSpaceDarkPrimary,
      primaryContainer: outerSpaceDarkPrimaryContainer,
      secondary: outerSpaceDarkSecondary,
      secondaryContainer: outerSpaceDarkSecondaryContainer,
      tertiary: outerSpaceDarkTertiary,
      tertiaryContainer: outerSpaceDarkTertiaryContainer,
      appBarColor: outerSpaceDarkTertiary,
      error: materialDarkError,
      swapOnMaterial3: true,
    ),
  );

  /// Blue whale dark blue-grey and stage red colors based FlexSchemeData.
  static const FlexSchemeData blueWhale = FlexSchemeData(
    name: blueWhaleName,
    description: blueWhaleDescription,
    light: FlexSchemeColor(
      primary: blueWhaleLightPrimary,
      primaryContainer: blueWhaleLightPrimaryContainer,
      secondary: blueWhaleLightSecondary,
      secondaryContainer: blueWhaleLightSecondaryContainer,
      tertiary: blueWhaleLightTertiary,
      tertiaryContainer: blueWhaleLightTertiaryContainer,
      appBarColor: blueWhaleLightTertiary,
      error: materialLightError,
      swapOnMaterial3: true,
    ),
    dark: FlexSchemeColor(
      primary: blueWhaleDarkPrimary,
      primaryContainer: blueWhaleDarkPrimaryContainer,
      secondary: blueWhaleDarkSecondary,
      secondaryContainer: blueWhaleDarkSecondaryContainer,
      tertiary: blueWhaleDarkTertiary,
      tertiaryContainer: blueWhaleDarkTertiaryContainer,
      appBarColor: blueWhaleDarkTertiary,
      error: materialDarkError,
      swapOnMaterial3: true,
    ),
  );

  /// San Juan blue based FlexSchemeData.
  static const FlexSchemeData sanJuanBlue = FlexSchemeData(
    name: sanJuanBlueName,
    description: sanJuanBlueDescription,
    light: FlexSchemeColor(
      primary: sanJuanBlueLightPrimary,
      primaryContainer: sanJuanBlueLightPrimaryContainer,
      secondary: sanJuanBlueLightSecondary,
      secondaryContainer: sanJuanBlueLightSecondaryContainer,
      tertiary: sanJuanBlueLightTertiary,
      tertiaryContainer: sanJuanBlueLightTertiaryContainer,
      appBarColor: sanJuanBlueLightTertiary,
      error: materialLightError,
      swapOnMaterial3: true,
    ),
    dark: FlexSchemeColor(
      primary: sanJuanBlueDarkPrimary,
      primaryContainer: sanJuanBlueDarkPrimaryContainer,
      secondary: sanJuanBlueDarkSecondary,
      secondaryContainer: sanJuanBlueDarkSecondaryContainer,
      tertiary: sanJuanBlueDarkTertiary,
      tertiaryContainer: sanJuanBlueDarkTertiaryContainer,
      appBarColor: sanJuanBlueDarkTertiary,
      error: materialDarkError,
      swapOnMaterial3: true,
    ),
  );

  /// Rosewood based FlexSchemeData.
  static const FlexSchemeData rosewood = FlexSchemeData(
    name: rosewoodName,
    description: rosewoodDescription,
    light: FlexSchemeColor(
      primary: rosewoodLightPrimary,
      primaryContainer: rosewoodLightPrimaryContainer,
      secondary: rosewoodLightSecondary,
      secondaryContainer: rosewoodLightSecondaryContainer,
      tertiary: rosewoodLightTertiary,
      tertiaryContainer: rosewoodLightTertiaryContainer,
      appBarColor: rosewoodLightTertiary,
      error: materialLightError,
    ),
    dark: FlexSchemeColor(
      primary: rosewoodDarkPrimary,
      primaryContainer: rosewoodDarkPrimaryContainer,
      secondary: rosewoodDarkSecondary,
      secondaryContainer: rosewoodDarkSecondaryContainer,
      tertiary: rosewoodDarkTertiary,
      tertiaryContainer: rosewoodDarkTertiaryContainer,
      appBarColor: rosewoodDarkTertiary,
      error: materialDarkError,
    ),
  );

  /// Blumine blue based FlexSchemeData.
  static const FlexSchemeData blumineBlue = FlexSchemeData(
    name: blumineBlueName,
    description: blumineBlueDescription,
    light: FlexSchemeColor(
      primary: blumineBlueLightPrimary,
      primaryContainer: blumineBlueLightPrimaryContainer,
      secondary: blumineBlueLightSecondary,
      secondaryContainer: blumineBlueLightSecondaryContainer,
      tertiary: blumineBlueLightTertiary,
      tertiaryContainer: blumineBlueLightTertiaryContainer,
      appBarColor: blumineBlueLightTertiary,
      error: materialLightError,
      swapOnMaterial3: true,
    ),
    dark: FlexSchemeColor(
      primary: blumineBlueDarkPrimary,
      primaryContainer: blumineBlueDarkPrimaryContainer,
      secondary: blumineBlueDarkSecondary,
      secondaryContainer: blumineBlueDarkSecondaryContainer,
      tertiary: blumineBlueDarkTertiary,
      tertiaryContainer: blumineBlueDarkTertiaryContainer,
      appBarColor: blumineBlueDarkTertiary,
      error: materialDarkError,
      swapOnMaterial3: true,
    ),
  );

  /// A Flutter Dash bird mascot blue toned FlexSchemeData.
  static const FlexSchemeData flutterDash = FlexSchemeData(
    name: dashBlueName,
    description: dashBlueDescription,
    light: FlexSchemeColor(
      primary: dashBlueLightPrimary,
      primaryContainer: dashBlueLightPrimaryContainer,
      secondary: dashBlueLightSecondary,
      secondaryContainer: dashBlueLightSecondaryContainer,
      tertiary: dashBlueLightTertiary,
      tertiaryContainer: dashBlueLightTertiaryContainer,
      appBarColor: dashBlueLightTertiary,
      error: materialLightError,
    ),
    dark: FlexSchemeColor(
      primary: dashBlueDarkPrimary,
      primaryContainer: dashBlueDarkPrimaryContainer,
      secondary: dashBlueDarkSecondary,
      secondaryContainer: dashBlueDarkSecondaryContainer,
      tertiary: dashBlueDarkTertiary,
      tertiaryContainer: dashBlueDarkTertiaryContainer,
      appBarColor: dashBlueDarkTertiary,
      error: materialDarkError,
    ),
  );

  /// The Material 3 Design Guide material baseline primary, secondary and
  /// tertiary colors as a FlexSchemeData.
  static const FlexSchemeData materialBaseline = FlexSchemeData(
    name: materialBaselineName,
    description: materialBaselineDescription,
    light: FlexSchemeColor(
      primary: materialBaselineLightPrimary,
      primaryContainer: materialBaselineLightPrimaryContainer,
      secondary: materialBaselineLightSecondary,
      secondaryContainer: materialBaselineLightSecondaryContainer,
      tertiary: materialBaselineLightTertiary,
      tertiaryContainer: materialBaselineLightTertiaryContainer,
      appBarColor: materialBaselineLightTertiary,
      error: material3LightError,
      errorContainer: material3LightErrorContainer,
    ),
    dark: FlexSchemeColor(
      primary: materialBaselineDarkPrimary,
      primaryContainer: materialBaselineDarkPrimaryContainer,
      secondary: materialBaselineDarkSecondary,
      secondaryContainer: materialBaselineDarkSecondaryContainer,
      tertiary: materialBaselineDarkTertiary,
      tertiaryContainer: materialBaselineDarkTertiaryContainer,
      appBarColor: materialBaselineDarkTertiary,
      error: material3DarkError,
      errorContainer: material3DarkErrorContainer,
    ),
  );

  /// A verdun and mineral green with hemlock grey-greens color scheme set
  /// found in an image in the Material 3 design guide
  /// [here](https://m3.material.io/styles/color/dynamic-color/overview).
  static const FlexSchemeData verdunHemlock = FlexSchemeData(
    name: verdunHemlockName,
    description: verdunHemlockDescription,
    light: FlexSchemeColor(
      primary: verdunHemlockLightPrimary,
      primaryContainer: verdunHemlockLightPrimaryContainer,
      secondary: verdunHemlockLightSecondary,
      secondaryContainer: verdunHemlockLightSecondaryContainer,
      tertiary: verdunHemlockLightTertiary,
      tertiaryContainer: verdunHemlockLightTertiaryContainer,
      appBarColor: verdunHemlockLightTertiary,
      error: material3LightError,
      errorContainer: material3LightErrorContainer,
    ),
    dark: FlexSchemeColor(
      primary: verdunHemlockDarkPrimary,
      primaryContainer: verdunHemlockDarkPrimaryContainer,
      secondary: verdunHemlockDarkSecondary,
      secondaryContainer: verdunHemlockDarkSecondaryContainer,
      tertiary: verdunHemlockDarkTertiary,
      tertiaryContainer: verdunHemlockDarkTertiaryContainer,
      appBarColor: verdunHemlockDarkTertiary,
      error: material3DarkError,
      errorContainer: material3DarkErrorContainer,
    ),
  );

  /// A dell, axolotl and genoa greens color scheme set
  /// found in an image in the Material 3 design guide
  /// [here](https://m3.material.io/styles/color/the-color-system/color-roles).
  static const FlexSchemeData dellGenoa = FlexSchemeData(
    name: dellGenoaGreenName,
    description: dellGenoaGreenDescription,
    light: FlexSchemeColor(
      primary: dellGenoaGreenLightPrimary,
      primaryContainer: dellGenoaGreenLightPrimaryContainer,
      secondary: dellGenoaGreenLightSecondary,
      secondaryContainer: dellGenoaGreenLightSecondaryContainer,
      tertiary: dellGenoaGreenLightTertiary,
      tertiaryContainer: dellGenoaGreenLightTertiaryContainer,
      appBarColor: dellGenoaGreenLightTertiary,
      error: material3LightError,
      errorContainer: material3LightErrorContainer,
    ),
    dark: FlexSchemeColor(
      primary: dellGenoaGreenDarkPrimary,
      primaryContainer: dellGenoaGreenDarkPrimaryContainer,
      secondary: dellGenoaGreenDarkSecondary,
      secondaryContainer: dellGenoaGreenDarkSecondaryContainer,
      tertiary: dellGenoaGreenDarkTertiary,
      tertiaryContainer: dellGenoaGreenDarkTertiaryContainer,
      appBarColor: dellGenoaGreenDarkTertiary,
      error: material3DarkError,
      errorContainer: material3DarkErrorContainer,
    ),
  );

  /// A Material 3 red based color scheme as FlexSchemeData.
  static const FlexSchemeData redM3 = FlexSchemeData(
    name: redM3Name,
    description: redM3Description,
    light: FlexSchemeColor(
      primary: redM3LightPrimary,
      primaryContainer: redM3LightPrimaryContainer,
      secondary: redM3LightSecondary,
      secondaryContainer: redM3LightSecondaryContainer,
      tertiary: redM3LightTertiary,
      tertiaryContainer: redM3LightTertiaryContainer,
      appBarColor: redM3LightTertiary,
      error: material3LightError,
      errorContainer: material3LightErrorContainer,
    ),
    dark: FlexSchemeColor(
      primary: redM3DarkPrimary,
      primaryContainer: redM3DarkPrimaryContainer,
      secondary: redM3DarkSecondary,
      secondaryContainer: redM3DarkSecondaryContainer,
      tertiary: redM3DarkTertiary,
      tertiaryContainer: redM3DarkTertiaryContainer,
      appBarColor: redM3DarkTertiary,
      error: material3DarkError,
      errorContainer: material3DarkErrorContainer,
    ),
  );

  /// A Material 3 pink based color scheme as FlexSchemeData.
  static const FlexSchemeData pinkM3 = FlexSchemeData(
    name: pinkM3Name,
    description: pinkM3Description,
    light: FlexSchemeColor(
      primary: pinkM3LightPrimary,
      primaryContainer: pinkM3LightPrimaryContainer,
      secondary: pinkM3LightSecondary,
      secondaryContainer: pinkM3LightSecondaryContainer,
      tertiary: pinkM3LightTertiary,
      tertiaryContainer: pinkM3LightTertiaryContainer,
      appBarColor: pinkM3LightTertiary,
      error: material3LightError,
      errorContainer: material3LightErrorContainer,
    ),
    dark: FlexSchemeColor(
      primary: pinkM3DarkPrimary,
      primaryContainer: pinkM3DarkPrimaryContainer,
      secondary: pinkM3DarkSecondary,
      secondaryContainer: pinkM3DarkSecondaryContainer,
      tertiary: pinkM3DarkTertiary,
      tertiaryContainer: pinkM3DarkTertiaryContainer,
      appBarColor: pinkM3DarkTertiary,
      error: material3DarkError,
      errorContainer: material3DarkErrorContainer,
    ),
  );

  /// A Material 3 purple based color scheme as FlexSchemeData.
  static const FlexSchemeData purpleM3 = FlexSchemeData(
    name: purpleM3Name,
    description: purpleM3Description,
    light: FlexSchemeColor(
      primary: purpleM3LightPrimary,
      primaryContainer: purpleM3LightPrimaryContainer,
      secondary: purpleM3LightSecondary,
      secondaryContainer: purpleM3LightSecondaryContainer,
      tertiary: purpleM3LightTertiary,
      tertiaryContainer: purpleM3LightTertiaryContainer,
      appBarColor: purpleM3LightTertiary,
      error: material3LightError,
      errorContainer: material3LightErrorContainer,
    ),
    dark: FlexSchemeColor(
      primary: purpleM3DarkPrimary,
      primaryContainer: purpleM3DarkPrimaryContainer,
      secondary: purpleM3DarkSecondary,
      secondaryContainer: purpleM3DarkSecondaryContainer,
      tertiary: purpleM3DarkTertiary,
      tertiaryContainer: purpleM3DarkTertiaryContainer,
      appBarColor: purpleM3DarkTertiary,
      error: material3DarkError,
      errorContainer: material3DarkErrorContainer,
    ),
  );

  /// A Material 3 indigo based color scheme as FlexSchemeData.
  static const FlexSchemeData indigoM3 = FlexSchemeData(
    name: indigoM3Name,
    description: indigoM3Description,
    light: FlexSchemeColor(
      primary: indigoM3LightPrimary,
      primaryContainer: indigoM3LightPrimaryContainer,
      secondary: indigoM3LightSecondary,
      secondaryContainer: indigoM3LightSecondaryContainer,
      tertiary: indigoM3LightTertiary,
      tertiaryContainer: indigoM3LightTertiaryContainer,
      appBarColor: indigoM3LightTertiary,
      error: material3LightError,
      errorContainer: material3LightErrorContainer,
    ),
    dark: FlexSchemeColor(
      primary: indigoM3DarkPrimary,
      primaryContainer: indigoM3DarkPrimaryContainer,
      secondary: indigoM3DarkSecondary,
      secondaryContainer: indigoM3DarkSecondaryContainer,
      tertiary: indigoM3DarkTertiary,
      tertiaryContainer: indigoM3DarkTertiaryContainer,
      appBarColor: indigoM3DarkTertiary,
      error: material3DarkError,
      errorContainer: material3DarkErrorContainer,
    ),
  );

  /// A Material 3 blue based color scheme as FlexSchemeData.
  static const FlexSchemeData blueM3 = FlexSchemeData(
    name: blueM3Name,
    description: blueM3Description,
    light: FlexSchemeColor(
      primary: blueM3LightPrimary,
      primaryContainer: blueM3LightPrimaryContainer,
      secondary: blueM3LightSecondary,
      secondaryContainer: blueM3LightSecondaryContainer,
      tertiary: blueM3LightTertiary,
      tertiaryContainer: blueM3LightTertiaryContainer,
      appBarColor: blueM3LightTertiary,
      error: material3LightError,
      errorContainer: material3LightErrorContainer,
    ),
    dark: FlexSchemeColor(
      primary: blueM3DarkPrimary,
      primaryContainer: blueM3DarkPrimaryContainer,
      secondary: blueM3DarkSecondary,
      secondaryContainer: blueM3DarkSecondaryContainer,
      tertiary: blueM3DarkTertiary,
      tertiaryContainer: blueM3DarkTertiaryContainer,
      appBarColor: blueM3DarkTertiary,
      error: material3DarkError,
      errorContainer: material3DarkErrorContainer,
    ),
  );

  /// A Material 3 cyan based color scheme as FlexSchemeData.
  static const FlexSchemeData cyanM3 = FlexSchemeData(
    name: cyanM3Name,
    description: cyanM3Description,
    light: FlexSchemeColor(
      primary: cyanM3LightPrimary,
      primaryContainer: cyanM3LightPrimaryContainer,
      secondary: cyanM3LightSecondary,
      secondaryContainer: cyanM3LightSecondaryContainer,
      tertiary: cyanM3LightTertiary,
      tertiaryContainer: cyanM3LightTertiaryContainer,
      appBarColor: cyanM3LightTertiary,
      error: material3LightError,
      errorContainer: material3LightErrorContainer,
    ),
    dark: FlexSchemeColor(
      primary: cyanM3DarkPrimary,
      primaryContainer: cyanM3DarkPrimaryContainer,
      secondary: cyanM3DarkSecondary,
      secondaryContainer: cyanM3DarkSecondaryContainer,
      tertiary: cyanM3DarkTertiary,
      tertiaryContainer: cyanM3DarkTertiaryContainer,
      appBarColor: cyanM3DarkTertiary,
      error: material3DarkError,
      errorContainer: material3DarkErrorContainer,
    ),
  );

  /// A Material 3 teal based color scheme as FlexSchemeData.
  static const FlexSchemeData tealM3 = FlexSchemeData(
    name: tealM3Name,
    description: tealM3Description,
    light: FlexSchemeColor(
      primary: tealM3LightPrimary,
      primaryContainer: tealM3LightPrimaryContainer,
      secondary: tealM3LightSecondary,
      secondaryContainer: tealM3LightSecondaryContainer,
      tertiary: tealM3LightTertiary,
      tertiaryContainer: tealM3LightTertiaryContainer,
      appBarColor: tealM3LightTertiary,
      error: material3LightError,
      errorContainer: material3LightErrorContainer,
    ),
    dark: FlexSchemeColor(
      primary: tealM3DarkPrimary,
      primaryContainer: tealM3DarkPrimaryContainer,
      secondary: tealM3DarkSecondary,
      secondaryContainer: tealM3DarkSecondaryContainer,
      tertiary: tealM3DarkTertiary,
      tertiaryContainer: tealM3DarkTertiaryContainer,
      appBarColor: tealM3DarkTertiary,
      error: material3DarkError,
      errorContainer: material3DarkErrorContainer,
    ),
  );

  /// A Material 3 green based color scheme as FlexSchemeData.
  static const FlexSchemeData greenM3 = FlexSchemeData(
    name: greenM3Name,
    description: greenM3Description,
    light: FlexSchemeColor(
      primary: greenM3LightPrimary,
      primaryContainer: greenM3LightPrimaryContainer,
      secondary: greenM3LightSecondary,
      secondaryContainer: greenM3LightSecondaryContainer,
      tertiary: greenM3LightTertiary,
      tertiaryContainer: greenM3LightTertiaryContainer,
      appBarColor: greenM3LightTertiary,
      error: material3LightError,
      errorContainer: material3LightErrorContainer,
    ),
    dark: FlexSchemeColor(
      primary: greenM3DarkPrimary,
      primaryContainer: greenM3DarkPrimaryContainer,
      secondary: greenM3DarkSecondary,
      secondaryContainer: greenM3DarkSecondaryContainer,
      tertiary: greenM3DarkTertiary,
      tertiaryContainer: greenM3DarkTertiaryContainer,
      appBarColor: greenM3DarkTertiary,
      error: material3DarkError,
      errorContainer: material3DarkErrorContainer,
    ),
  );

  /// A Material 3 lime based color scheme as FlexSchemeData.
  static const FlexSchemeData limeM3 = FlexSchemeData(
    name: limeM3Name,
    description: limeM3Description,
    light: FlexSchemeColor(
      primary: limeM3LightPrimary,
      primaryContainer: limeM3LightPrimaryContainer,
      secondary: limeM3LightSecondary,
      secondaryContainer: limeM3LightSecondaryContainer,
      tertiary: limeM3LightTertiary,
      tertiaryContainer: limeM3LightTertiaryContainer,
      appBarColor: limeM3LightTertiary,
      error: material3LightError,
      errorContainer: material3LightErrorContainer,
    ),
    dark: FlexSchemeColor(
      primary: limeM3DarkPrimary,
      primaryContainer: limeM3DarkPrimaryContainer,
      secondary: limeM3DarkSecondary,
      secondaryContainer: limeM3DarkSecondaryContainer,
      tertiary: limeM3DarkTertiary,
      tertiaryContainer: limeM3DarkTertiaryContainer,
      appBarColor: limeM3DarkTertiary,
      error: material3DarkError,
      errorContainer: material3DarkErrorContainer,
    ),
  );

  /// A Material 3 yukonGold based color scheme as FlexSchemeData.
  static const FlexSchemeData yellowM3 = FlexSchemeData(
    name: yellowM3Name,
    description: yellowM3Description,
    light: FlexSchemeColor(
      primary: yellowM3LightPrimary,
      primaryContainer: yellowM3LightPrimaryContainer,
      secondary: yellowM3LightSecondary,
      secondaryContainer: yellowM3LightSecondaryContainer,
      tertiary: yellowM3LightTertiary,
      tertiaryContainer: yellowM3LightTertiaryContainer,
      appBarColor: yellowM3LightTertiary,
      error: material3LightError,
      errorContainer: material3LightErrorContainer,
    ),
    dark: FlexSchemeColor(
      primary: yellowM3DarkPrimary,
      primaryContainer: yellowM3DarkPrimaryContainer,
      secondary: yellowM3DarkSecondary,
      secondaryContainer: yellowM3DarkSecondaryContainer,
      tertiary: yellowM3DarkTertiary,
      tertiaryContainer: yellowM3DarkTertiaryContainer,
      appBarColor: yellowM3DarkTertiary,
      error: material3DarkError,
      errorContainer: material3DarkErrorContainer,
    ),
  );

  /// A Material 3 orange based color scheme as FlexSchemeData.
  static const FlexSchemeData orangeM3 = FlexSchemeData(
    name: orangeM3Name,
    description: orangeM3Description,
    light: FlexSchemeColor(
      primary: orangeM3LightPrimary,
      primaryContainer: orangeM3LightPrimaryContainer,
      secondary: orangeM3LightSecondary,
      secondaryContainer: orangeM3LightSecondaryContainer,
      tertiary: orangeM3LightTertiary,
      tertiaryContainer: orangeM3LightTertiaryContainer,
      appBarColor: orangeM3LightTertiary,
      error: material3LightError,
      errorContainer: material3LightErrorContainer,
    ),
    dark: FlexSchemeColor(
      primary: orangeM3DarkPrimary,
      primaryContainer: orangeM3DarkPrimaryContainer,
      secondary: orangeM3DarkSecondary,
      secondaryContainer: orangeM3DarkSecondaryContainer,
      tertiary: orangeM3DarkTertiary,
      tertiaryContainer: orangeM3DarkTertiaryContainer,
      appBarColor: orangeM3DarkTertiary,
      error: material3DarkError,
      errorContainer: material3DarkErrorContainer,
    ),
  );

  /// A Material 3 deepOrange based color scheme as FlexSchemeData.
  static const FlexSchemeData deepOrangeM3 = FlexSchemeData(
    name: deepOrangeM3Name,
    description: deepOrangeM3Description,
    light: FlexSchemeColor(
      primary: deepOrangeM3LightPrimary,
      primaryContainer: deepOrangeM3LightPrimaryContainer,
      secondary: deepOrangeM3LightSecondary,
      secondaryContainer: deepOrangeM3LightSecondaryContainer,
      tertiary: deepOrangeM3LightTertiary,
      tertiaryContainer: deepOrangeM3LightTertiaryContainer,
      appBarColor: deepOrangeM3LightTertiary,
      error: material3LightError,
      errorContainer: material3LightErrorContainer,
    ),
    dark: FlexSchemeColor(
      primary: deepOrangeM3DarkPrimary,
      primaryContainer: deepOrangeM3DarkPrimaryContainer,
      secondary: deepOrangeM3DarkSecondary,
      secondaryContainer: deepOrangeM3DarkSecondaryContainer,
      tertiary: deepOrangeM3DarkTertiary,
      tertiaryContainer: deepOrangeM3DarkTertiaryContainer,
      appBarColor: deepOrangeM3DarkTertiary,
      error: material3DarkError,
      errorContainer: material3DarkErrorContainer,
    ),
  );

  /// Starting values for custom color data.
  ///
  /// These can serve as fallback data to custom color values
  /// in a map or list with FlexSchemeData.
  static const FlexSchemeData customColors = FlexSchemeData(
    name: customName,
    description: customDescription,
    light: FlexSchemeColor(
      primary: materialLightPrimary,
      primaryContainer: materialLightPrimaryContainer,
      secondary: materialLightSecondary,
      secondaryContainer: materialLightSecondaryContainer,
      tertiary: materialLightTertiary,
      tertiaryContainer: materialLightTertiaryContainer,
      appBarColor: materialLightTertiary,
      error: materialLightError,
    ),
    dark: FlexSchemeColor(
      primary: materialDarkPrimary,
      primaryContainer: materialDarkPrimaryContainer,
      secondary: materialDarkSecondary,
      secondaryContainer: materialDarkSecondaryContainer,
      tertiary: materialDarkTertiary,
      tertiaryContainer: materialDarkTertiaryContainer,
      appBarColor: materialDarkTertiary,
      error: materialDarkError,
    ),
  );

  /// A [FlexScheme] enum to [FlexSchemeData] constant map.
  ///
  /// Contains pre-made ready to go nice dark and light [FlexSchemeColor]
  /// color schemes, that can be used by FlexColorScheme.
  /// The [FlexColor.schemes] map also contain the standard
  /// default material design themes, both the normal and the high
  /// contrast version.
  ///
  /// Each of these predefined color schemes include matching hand-tuned light
  /// and dark mode theme colors for the theme it defines.
  ///
  /// You can make your own color schemes as well. This can also serve as an
  /// example on how to define your own [FlexSchemeData] schemes that you can
  /// use instead.
  ///
  /// This map excludes the last enum [FlexScheme.custom], it can thus not be
  /// directly iterated over using the [FlexScheme] enum values list.
  /// For a version that contains all the enum values, including the last
  /// [FlexScheme.custom] value, use the [schemesWithCustom] map instead.
  static const Map<FlexScheme, FlexSchemeData> schemes =
      <FlexScheme, FlexSchemeData>{
    FlexScheme.material: material,
    FlexScheme.materialHc: materialHc,
    FlexScheme.blue: blue,
    FlexScheme.indigo: indigo,
    FlexScheme.hippieBlue: hippieBlue,
    FlexScheme.aquaBlue: aquaBlue,
    FlexScheme.brandBlue: brandBlue,
    FlexScheme.deepBlue: deepBlue,
    FlexScheme.sakura: sakura,
    FlexScheme.mandyRed: mandyRed,
    FlexScheme.red: red,
    FlexScheme.redWine: redWine,
    FlexScheme.purpleBrown: purpleBrown,
    FlexScheme.green: green,
    FlexScheme.money: money,
    FlexScheme.jungle: jungle,
    FlexScheme.greyLaw: greyLaw,
    FlexScheme.wasabi: wasabi,
    FlexScheme.gold: gold,
    FlexScheme.mango: mango,
    FlexScheme.amber: amber,
    FlexScheme.vesuviusBurn: vesuviusBurn,
    FlexScheme.deepPurple: deepPurple,
    FlexScheme.ebonyClay: ebonyClay,
    FlexScheme.barossa: barossa,
    FlexScheme.shark: shark,
    FlexScheme.bigStone: bigStone,
    FlexScheme.damask: damask,
    FlexScheme.bahamaBlue: bahamaBlue,
    FlexScheme.mallardGreen: mallardGreen,
    FlexScheme.espresso: espresso,
    FlexScheme.outerSpace: outerSpace,
    FlexScheme.blueWhale: blueWhale,
    FlexScheme.sanJuanBlue: sanJuanBlue,
    FlexScheme.rosewood: rosewood,
    FlexScheme.blumineBlue: blumineBlue,
    FlexScheme.flutterDash: flutterDash,
    FlexScheme.materialBaseline: materialBaseline,
    FlexScheme.verdunHemlock: verdunHemlock,
    FlexScheme.dellGenoa: dellGenoa,
    FlexScheme.redM3: redM3,
    FlexScheme.pinkM3: pinkM3,
    FlexScheme.purpleM3: purpleM3,
    FlexScheme.indigoM3: indigoM3,
    FlexScheme.blueM3: blueM3,
    FlexScheme.cyanM3: cyanM3,
    FlexScheme.tealM3: tealM3,
    FlexScheme.greenM3: greenM3,
    FlexScheme.limeM3: limeM3,
    FlexScheme.yellowM3: yellowM3,
    FlexScheme.orangeM3: orangeM3,
    FlexScheme.deepOrangeM3: deepOrangeM3,
  };

  /// Returns a [FlexScheme] enum to [FlexSchemeData] constant map.
  ///
  /// Contains all the pre-made ready to use dark and light [FlexSchemeColor]
  /// color values that can be used e.g. by FlexColorScheme.
  /// The [FlexColor.schemesWithCustom] also contain the
  /// standard default material design themes, both the normal and the
  /// newer high contrast version.
  ///
  /// Each pre-made custom theme include hand-tuned light and dark modes colors
  /// for the theme it defines.
  ///
  /// You can make your own color schemes as well. This list can serve as an
  /// example on how to define your own [FlexSchemeData] schemes that you can
  /// use instead.
  static const Map<FlexScheme, FlexSchemeData> schemesWithCustom =
      <FlexScheme, FlexSchemeData>{
    ...schemes,
    // This custom color set has same colors as the material default theme.
    // It is up to the implementation to provide custom colors or provide
    // other customization solution for this choice. Often an implementation
    // might allow users to copy a pre-made theme's colors as a starting point
    // to this enum theme choice and allow customizations of its colors with a
    // color picker.
    FlexScheme.custom: customColors,
  };

  /// Returns a list with all the predefined [FlexSchemeData] objects.
  ///
  /// This list excludes the custom [FlexSchemeData] placeholder that
  /// exists in the [schemesWithCustom] map.
  static const List<FlexSchemeData> schemesList = <FlexSchemeData>[
    material,
    materialHc,
    blue,
    indigo,
    hippieBlue,
    aquaBlue,
    brandBlue,
    deepBlue,
    sakura,
    mandyRed,
    red,
    redWine,
    purpleBrown,
    green,
    money,
    jungle,
    greyLaw,
    wasabi,
    gold,
    mango,
    amber,
    vesuviusBurn,
    deepPurple,
    ebonyClay,
    barossa,
    shark,
    bigStone,
    damask,
    bahamaBlue,
    mallardGreen,
    espresso,
    outerSpace,
    blueWhale,
    sanJuanBlue,
    rosewood,
    blumineBlue,
    flutterDash,
    materialBaseline,
    verdunHemlock,
    dellGenoa,
    redM3,
    pinkM3,
    purpleM3,
    indigoM3,
    blueM3,
    cyanM3,
    tealM3,
    greenM3,
    limeM3,
    yellowM3,
    orangeM3,
    deepOrangeM3,
  ];
}
