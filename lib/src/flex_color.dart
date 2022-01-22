import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'flex_constants.dart';
import 'flex_extensions.dart';
import 'flex_scheme.dart';

// ignore_for_file: comment_references

/// Defines colors, names and color schemes used to make maps and a list of
/// predefined [FlexSchemeData] objects that can be used by FlexColorScheme.
/// There is also const values for each color value and [FlexSchemeData] of
/// of each scheme.
class FlexColor {
  /// Private constructor for the FlexColor static class to prevent it from
  /// being instantiated or extended.
  FlexColor._(); // coverage:ignore-line

  /// Material standard color for light surface.
  static const Color materialLightSurface = Colors.white;

  /// Material standard color for light background.
  static const Color materialLightBackground = Colors.white;

  /// Material standard color for light scaffold background.
  static const Color materialLightScaffoldBackground = Colors.white;

  /// Material standard color for dark surface.
  static const Color materialDarkSurface = Color(0xFF121212);

  /// Material standard color for dark background.
  static const Color materialDarkBackground = Color(0xFF121212);

  /// Material standard color for dark scaffold background.
  static const Color materialDarkScaffoldBackground = Color(0xFF121212);

  // Custom static constants for surface, background, scaffold and background
  // colors. Some surface colors are slightly modified from the Material
  // standards and different constants are used so we could tune them,
  // without touching the material standard surface values.

  /// FlexColors standard for light surface, same as material.
  static const Color lightSurface = Colors.white;

  /// FlexColors standard for light background.
  ///
  /// A very light grey, lighter than grey50, used for better blend effect when
  /// blending in primary color with the surface color.
  static const Color lightBackground = Color(0xFFFDFDFD);

  /// FlexColors standard for light scaffold background, just white as Material.
  static const Color lightScaffoldBackground = Colors.white;

  /// FlexColors standard for dark surfaces.
  ///
  /// Slightly darker than its Material counter part, so we can blend in
  /// more primary color without getting too light too soon.
  static const Color darkSurface = Color(0xFF111111);

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

  /// Material standard light error color.
  static const Color materialLightError = Color(0xFFB00020);

  /// Material standard dark error color.
  static const Color materialDarkError = Color(0xFFCF6679);

  // High contrast Material standard error color as per those used in Flutter
  // ColorScheme.highContrastLight and ColorScheme.highContrastDark

  /// Material standard high contrast light error color.
  static const Color materialLightErrorHc = Color(0xff790000);

  /// Material standard high contrast dark error color.
  static const Color materialDarkErrorHc = Color(0xff9b374d);

  // The primary and variant Material theme colors as defined by:
  // https://material.io/design/color/the-color-system.html#color-theme-creation.

  /// English name of the standard Material theme.
  static const String materialName = 'Material default';

  /// English description of the standard Material theme.
  static const String materialDescription =
      'Default Material color theme, used in the design guide';

  /// Material standard default color for light primary color.
  static const Color materialLightPrimary = Color(0xff6200ee);

  /// Material standard default color for light primary variant color.
  static const Color materialLightPrimaryVariant = Color(0xff3700b3);

  /// Material standard default color for light secondary color.
  static const Color materialLightSecondary = Color(0xff03dac6);

  /// Material standard default color for light secondary variant color.
  static const Color materialLightSecondaryVariant = Color(0xff018786);

  /// Material standard default color for dark primary color.
  static const Color materialDarkPrimary = Color(0xffbb86fc);

  /// Material standard default color for dark primary variant color.
  static const Color materialDarkPrimaryVariant = Color(0xff3700B3);

  /// Material standard default color for dark secondary color, the
  /// color value is same as the light secondary color.
  static const Color materialDarkSecondary = Color(0xff03dac6);

  /// Material standard default color for dark secondary variant color, the
  /// color value is same as the light secondary color.
  static const Color materialDarkSecondaryVariant = Color(0xff03dac6);

  // High contrast versions of Material Guide colors as per those used
  // in ColorScheme.highContrastLight and ColorScheme.highContrastDark.

  /// English name of the material high contrast theme.
  static const String materialHcName = 'Material high contrast';

  /// English description of the material high contrast theme.
  static const String materialHcDescription =
      'High contrast Material design guide theme';

  /// Material high contrast color for light primary color.
  static const Color materialLightPrimaryHc = Color(0xff0000ba);

  /// Material high contrast color for light primary variant color.
  static const Color materialLightPrimaryVariantHc = Color(0xff000088);

  /// Material high contrast color for light secondary color.
  static const Color materialLightSecondaryHc = Color(0xff66fff9);

  /// Material high contrast color for light secondary variant color.
  static const Color materialLightSecondaryVariantHc = Color(0xff018786);

  /// Material high contrast color for dark primary color.
  static const Color materialDarkPrimaryHc = Color(0xffefb7ff);

  /// Material high contrast color for dark primary variant color.
  static const Color materialDarkPrimaryVariantHc = Color(0xffbe9eff);

  /// Material high contrast color for dark secondary color.
  static const Color materialDarkSecondaryHc = Color(0xff66fff9);

  /// Material high contrast color for dark secondary variant color.
  static const Color materialDarkSecondaryVariantHc = Color(0xff66fff9);

  // Material blue and light blue colors based scheme.

  /// English name of the blue theme.
  static const String blueName = 'Blue delight';

  /// English description of the blue theme.
  static const String blueDescription = 'Blue color theme, based on '
      'Material blue and light blue colors';

  /// Blue theme color for light primary color.
  static const Color blueLightPrimary = Color(0xFF1565C0); // blue800

  /// Blue theme color for light primary variant color.
  static const Color blueLightPrimaryVariant = Color(0xFF0D47A1); // blue900

  /// Blue theme color for light secondary color.
  static const Color blueLightSecondary = Color(0xFF039BE5); // lightBlue600

  /// Blue theme color for light secondary variant color.
  static const Color blueLightSecondaryVariant = Color(0xFF0277BD); // lBlue800

  /// Blue theme color for dark primary color.
  static const Color blueDarkPrimary = Color(0xFF90CAF9); // blue200

  /// Blue theme color for dark primary variant color.
  static const Color blueDarkPrimaryVariant = Color(0xFF64B5F6); // blue300

  /// Blue theme color for dark secondary color.
  static const Color blueDarkSecondary = Color(0xFF81D4FA); // lightBlue200

  /// Blue theme color for dark secondary variant color.
  static const Color blueDarkSecondaryVariant = Color(0xFFE1F5FE); // lBlue50

  // Material indigo and deep purple colors based scheme.

  /// English name of the indigo theme.
  static const String indigoName = 'Indigo nights';

  /// English description of the indigo theme.
  static const String indigoDescription = 'Indigo color theme, based on '
      'Material indigo and deep purple colors';

  /// Indigo theme color for light primary color.
  static const Color indigoLightPrimary = Color(0xFF303F9F); // indigo700

  /// Indigo theme color for light primary variant color.
  static const Color indigoLightPrimaryVariant = Color(0xFF1A237E); // indigo900

  /// Indigo theme color for light secondary color.
  static const Color indigoLightSecondary = Color(0xFF512DA8); // deepPurple700

  /// Indigo theme color for light secondary variant color.
  static const Color indigoLightSecondaryVariant = Color(0xFF311B92); //dPurp900

  /// Indigo theme color for dark primary color.
  static const Color indigoDarkPrimary = Color(0xFF7986CB); // indigo300

  /// Indigo theme color for dark primary variant color.
  static const Color indigoDarkPrimaryVariant = Color(0xFF5C6BC0); // indigo400

  /// Indigo theme color for dark secondary color.
  static const Color indigoDarkSecondary = Color(0xFF9575CD); // deepPurple300

  /// Indigo theme color for dark secondary variant color.
  static const Color indigoDarkSecondaryVariant = Color(0xFF7E57C2); // dPurp400

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

  /// Hippie blue theme color for light primary variant color.
  static const Color hippieBlueLightPrimaryVariant = Color(0xFF078282);

  /// Hippie blue theme color for light secondary color.
  static const Color hippieBlueLightSecondary = Color(0xFFFF4F58);

  /// Hippie blue theme color for light secondary variant color.
  static const Color hippieBlueLightSecondaryVariant = Color(0xFFBF4A50);

  /// Hippie blue theme color for dark primary color.
  static const Color hippieBlueDarkPrimary = Color(0xFF669DB3);

  /// Hippie blue theme color for dark primary variant color.
  static const Color hippieBlueDarkPrimaryVariant = Color(0xFF208E8E);

  /// Hippie blue theme color for dark secondary color.
  static const Color hippieBlueDarkSecondary = Color(0xFFFC6E75);

  /// Hippie blue theme color for dark secondary variant color.
  static const Color hippieBlueDarkSecondaryVariant = Color(0xFFF75F67);

  // Aqua tropical blue ocean scheme.
  // The scheme looks like clear tropical coral waters, hence the name.

  /// English name of the aqua blue theme.
  static const String aquaBlueName = 'Aqua blue';

  /// English description of the aqua blue theme.
  static const String aquaBlueDescription = 'Aqua tropical ocean blue theme';

  /// Aqua blue theme color for light primary color.
  static const Color aquaBlueLightPrimary = Color(0xFF35A0CB);

  /// Aqua blue theme color for light primary variant color.
  static const Color aquaBlueLightPrimaryVariant = Color(0xFF45B4D2);

  /// Aqua blue theme color for light secondary color.
  static const Color aquaBlueLightSecondary = Color(0xFF89D1C8);

  /// Aqua blue theme color for light secondary variant color.
  static const Color aquaBlueLightSecondaryVariant = Color(0xFF61D4D4);

  /// Aqua blue theme color for dark primary color.
  static const Color aquaBlueDarkPrimary = Color(0xFF5DB3D5);

  /// Aqua blue theme color for dark primary variant color.
  static const Color aquaBlueDarkPrimaryVariant = Color(0xFF71D3ED);

  /// Aqua blue theme color for dark secondary color.
  static const Color aquaBlueDarkSecondary = Color(0xFFA1E9DF);

  /// Aqua blue theme color for dark secondary variant color.
  static const Color aquaBlueDarkSecondaryVariant = Color(0xFFA0E5E5);

  // Blue color scheme based on well known blue web brand colors.

  /// English name of the brand blue colors theme.
  static const String brandBlueName = 'Brand blues';

  /// English description of the brand blue colors theme.
  static const String brandBlueDescription = 'Blue colors used in well known '
      'brand themes';

  /// Brand blues theme color for light primary color.
  static const Color brandBlueLightPrimary = Color(0xFF3B5998); // FB blue

  /// Brand blues theme color for light primary variant color.
  static const Color brandBlueLightPrimaryVariant = Color(0xFF3F729B); // IG

  /// Brand blues theme color for light secondary color.
  static const Color brandBlueLightSecondary = Color(0xFF55ACEE); // Twitter

  /// Brand blues theme color for light secondary variant color.
  static const Color brandBlueLightSecondaryVariant = Color(0xFF4285F4); // G

  /// Brand blues theme color for dark primary color.
  static const Color brandBlueDarkPrimary = Color(0xFF8B9DC3); // FB 2nd

  /// Brand blues theme color for dark primary variant color.
  static const Color brandBlueDarkPrimaryVariant = Color(0xFF799CB9);

  /// Brand blues theme color for dark secondary color.
  static const Color brandBlueDarkSecondary = Color(0xFFA0D1F5);

  /// Brand blues theme color for dark secondary variant color.
  static const Color brandBlueDarkSecondaryVariant = Color(0xFF88B2F8);

  // Deep blue sea color scheme.
  // Colors looked like a deep abyss, hence the name.

  /// English name of the dark deep blue sea theme.
  static const String deepBlueName = 'Deep blue sea';

  /// English description of the dark deep blue sea theme.
  static const String deepBlueDescription = 'Dark deep blue sea color theme';

  /// Deep blue theme color for light primary color.
  static const Color deepBlueLightPrimary = Color(0xFF223A5E);

  /// Deep blue theme color for light primary variant color.
  static const Color deepBlueLightPrimaryVariant = Color(0xFF1B2E4B);

  /// Deep blue theme color for light secondary color.
  static const Color deepBlueLightSecondary = Color(0xFF144955);

  /// Deep blue theme color for light secondary variant color.
  static const Color deepBlueLightSecondaryVariant = Color(0xFF208399);

  /// Deep blue theme color for dark primary color.
  static const Color deepBlueDarkPrimary = Color(0xFF748BAC);

  /// Deep blue theme color for dark primary variant color.
  static const Color deepBlueDarkPrimaryVariant = Color(0xFF7FA1D0);

  /// Deep blue theme color for dark secondary color.
  static const Color deepBlueDarkSecondary = Color(0xFF539EAF);

  /// Deep blue theme color for dark secondary variant color.
  static const Color deepBlueDarkSecondaryVariant = Color(0xFF219AB5);

  // Pink Sakura color scheme.
  // Color sources: https://www.w3schools.com/colors/colors_2019.asp

  /// English name of the pink sakura inspired theme.
  static const String sakuraName = 'Pink sakura';

  /// English description of the pink sakura inspired theme.
  static const String sakuraDescription = 'Pink color theme, based on sakura '
      'cherry blossom like colors';

  /// Sakura theme color for light primary color.
  static const Color sakuraLightPrimary = Color(0xFFCE5B78); // Fruit dove

  /// Sakura theme color for light primary variant color.
  static const Color sakuraLightPrimaryVariant = Color(0xffe4446c);

  /// Sakura theme color for light secondary color.
  static const Color sakuraLightSecondary = Color(0xFFfbae9d); // Peach pink 80%

  /// Sakura theme color for light secondary variant color.
  static const Color sakuraLightSecondaryVariant = Color(0xFFF39682); //Peach

  /// Sakura theme color for dark primary color.
  static const Color sakuraDarkPrimary = Color(0xFFeec4d8); // Peach pink 80%

  /// Sakura theme color for dark primary variant color.
  static const Color sakuraDarkPrimaryVariant = Color(0xFFe8b5ce); //SweetLilac

  /// Sakura theme color for dark secondary color.
  static const Color sakuraDarkSecondary = Color(0xFFF5D6C6); // Peche

  /// Sakura theme color for dark secondary variant color.
  static const Color sakuraDarkSecondaryVariant = Color(0xFFf7e0d4); // Peche90%

  // Mandy Red and Viking blue color scheme.
  // Colors and scheme named by "name that color" library.

  /// English name of the Mandy Red inspired theme.
  static const String mandyRedName = 'Oh Mandy red';

  /// English description of the pink mandyRed inspired theme.
  static const String mandyRedDescription =
      'Mandy red and Viking blue inspired red theme';

  /// Mandy red theme color for light primary color.
  static const Color mandyRedLightPrimary = Color(0xFFCD5758);

  /// Mandy red theme color for light primary variant color.
  static const Color mandyRedLightPrimaryVariant = Color(0xFFA23556);

  /// Mandy red theme color for light secondary color.
  static const Color mandyRedLightSecondary = Color(0xFF57C8D3);

  /// Mandy red theme color for light secondary variant color.
  static const Color mandyRedLightSecondaryVariant = Color(0xFF69B9CD);

  /// Mandy red theme color for dark primary color.
  static const Color mandyRedDarkPrimary = Color(0xFFDA8585);

  /// Mandy red theme color for dark primary variant color.
  static const Color mandyRedDarkPrimaryVariant = Color(0xFFAB4967);

  /// Mandy red theme color for dark secondary color.
  static const Color mandyRedDarkSecondary = Color(0xFF68CDD7);

  /// Mandy red theme color for dark secondary variant color.
  static const Color mandyRedDarkSecondaryVariant = Color(0xFF85C6D6);

  // Material red and pink color scheme.

  /// English name of the red theme.
  static const String redName = 'Red tornado';

  /// English description of the red theme.
  static const String redDescription = 'Red color theme, based on '
      'Material red and pink colors';

  /// Red theme color for light primary color.
  static const Color redLightPrimary = Color(0xFFC62828); // red800

  /// Red theme color for light primary variant color.
  static const Color redLightPrimaryVariant = Color(0xFFB71C1C); // red900

  /// Red theme color for light secondary color.
  static const Color redLightSecondary = Color(0xFFAD1457); // pink800

  /// Red theme color for light secondary variant color.
  static const Color redLightSecondaryVariant = Color(0xFF880E4F); // pink900

  /// Red theme color for dark primary color.
  static const Color redDarkPrimary = Color(0xFFEF9A9A); // red200

  /// Red theme color for dark primary variant color.
  static const Color redDarkPrimaryVariant = Color(0xFFE57373); // red300

  /// Red theme color for dark secondary color.
  static const Color redDarkSecondary = Color(0xFFF48FB1); // pink200

  /// Red theme color for dark secondary variant color.
  static const Color redDarkSecondaryVariant = Color(0xFFF06292); // pink300

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

  /// Red wine theme color for light primary variant color.
  static const Color redWineLightPrimaryVariant = Color(0xFF6C1322);

  /// Red wine theme color for light secondary color.
  static const Color redWineLightSecondary = Color(0xFFA70043);

  /// Red wine theme color for light secondary variant color.
  static const Color redWineLightSecondaryVariant = Color(0xFFA4121C);

  /// Red wine theme color for dark primary color.
  static const Color redWineDarkPrimary = Color(0xFFE4677C); //0xFFe4677c

  /// Red wine theme color for dark primary variant color.
  static const Color redWineDarkPrimaryVariant = Color(0xFFB25867);

  /// Red wine theme color for dark secondary color.
  static const Color redWineDarkSecondary = Color(0xFFC87A98); // 0xFFc8374d

  /// Red wine theme color for dark secondary variant color.
  static const Color redWineDarkSecondaryVariant = Color(0xFFBD545B); // B.L 45%

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

  /// Purple brown theme color for light primary variant color.
  static const Color purpleBrownLightPrimaryVariant = Color(0xFF682A2C);

  /// Purple brown theme color for light secondary color.
  static const Color purpleBrownLightSecondary = Color(0xFF60234F);

  /// Purple brown theme color for light secondary variant color.
  static const Color purpleBrownLightSecondaryVariant = Color(0xFF4A0635);

  /// Purple brown theme color for dark primary color.
  static const Color purpleBrownDarkPrimary = Color(0xFFA98085);

  /// Purple brown theme color for dark primary variant color.
  static const Color purpleBrownDarkPrimaryVariant = Color(0xFF73494A);

  /// Purple brown theme color for dark secondary color.
  static const Color purpleBrownDarkSecondary = Color(0xFF975384);

  /// Purple brown theme color for dark secondary variant color.
  static const Color purpleBrownDarkSecondaryVariant = Color(0xFF5F4C5A);

  // Material green and cyan color scheme.

  /// English name of the green theme.
  static const String greenName = 'Green forest';

  /// English description of the green theme.
  static const String greenDescription = 'Green color theme, based on '
      'Material green and cyan colors';

  /// Green theme color for light primary color.
  static const Color greenLightPrimary = Color(0xFF2E7D32); // green800

  /// Green theme color for light primary variant color.
  static const Color greenLightPrimaryVariant = Color(0xFF1B5E20); // green900

  /// Green theme color for light secondary color.
  static const Color greenLightSecondary = Color(0xFF00695C); // cyan800

  /// Green theme color for light secondary variant color.
  static const Color greenLightSecondaryVariant = Color(0xFF004D40); // cyan900

  /// Green theme color for dark primary color.
  static const Color greenDarkPrimary = Color(0xFFA5D6A7); // green200

  /// Green theme color for dark primary variant color.
  static const Color greenDarkPrimaryVariant = Color(0xFF81C784); // green300

  /// Green theme color for dark secondary color.
  static const Color greenDarkSecondary = Color(0xFF80CBC4); // cyan200

  /// Green theme color for dark secondary variant color.
  static const Color greenDarkSecondaryVariant = Color(0xFF4DB6AC); // cyan300

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

  /// Money green theme color for light primary variant color.
  static const Color moneyLightPrimaryVariant = Color(0xFF224430); // Eden 20%

  /// Money green theme color for light secondary color.
  static const Color moneyLightSecondary = Color(0xFF797b3a); // Guacamole 35%

  /// Money green theme color for light secondary variant color.
  static const Color moneyLightSecondaryVariant = Color(0xFF555729); // Gua. 25%

  /// Money green theme color for dark primary color.
  static const Color moneyDarkPrimary = Color(0xFF7AB893);

  /// Money green theme color for dark primary variant color.
  static const Color moneyDarkPrimaryVariant = Color(0xFF6AAF85);

  /// Money green theme color for dark secondary color.
  static const Color moneyDarkSecondary = Color(0xFFd5d6a8); // Guacamole 75%

  /// Money green theme color for dark secondary variant color.
  static const Color moneyDarkSecondaryVariant = Color(0xFFbbbe74); //Gua. 60%

  // Jungle green color scheme.
  // Looks like all the green colors in a rain forest, hence the name.

  /// English name of the lush green jungle theme.
  static const String jungleName = 'Green jungle';

  /// English description of the lush green jungle theme.
  static const String jungleDescription = 'Green jungle and rain forest '
      'color theme';

  /// Jungle green theme color for light primary color.
  static const Color jungleLightPrimary = Color(0xFF004E15);

  /// Jungle green theme color for light primary variant color.
  static const Color jungleLightPrimaryVariant = Color(0xFF00411F);

  /// Jungle green theme color for light secondary color.
  static const Color jungleLightSecondary = Color(0xFF007256);

  /// Jungle green theme color for light secondary variant color.
  static const Color jungleLightSecondaryVariant = Color(0xFF295300);

  /// Jungle green theme color for dark primary color.
  static const Color jungleDarkPrimary = Color(0xFF519E67);

  /// Jungle green theme color for dark primary variant color.
  static const Color jungleDarkPrimaryVariant = Color(0xFF3F9368);

  /// Jungle green theme color for dark secondary color.
  static const Color jungleDarkSecondary = Color(0xFF479985);

  /// Jungle green theme color for dark secondary variant color.
  static const Color jungleDarkSecondaryVariant = Color(0xFF73A497);

  // Custom Legal color scheme.
  // The colors are suitable for a law firm, named it accordingly, with a twist.

  /// English name of the grey law theme.
  static const String greyLawName = 'Grey law';

  /// English description of the grey law theme.
  static const String greyLawDescription = 'Material blue grey and ultra dark '
      'purple color theme, law firm style';

  /// Grey law theme color for light primary color.
  static const Color greyLawLightPrimary = Color(0xFF37474F); // BlueGrey800

  /// Grey law theme color for light primary variant color.
  static const Color greyLawLightPrimaryVariant = Color(0xFF455A64); //BlueGr700

  /// Grey law theme color for light secondary color.
  static const Color greyLawLightSecondary = Color(0xFF521D82);

  /// Grey law theme color for light secondary variant color.
  static const Color greyLawLightSecondaryVariant = Color(0xFF2C314F);

  /// Grey law theme color for dark primary color.
  static const Color greyLawDarkPrimary = Color(0xFF90A4AE); //BlueGrey300

  /// Grey law theme color for dark primary variant color.
  static const Color greyLawDarkPrimaryVariant = Color(0xFF78909C); //BlueGr400

  /// Grey law theme color for dark secondary color.
  static const Color greyLawDarkSecondary = Color(0xFF815AA3);

  /// Grey law theme color for dark secondary variant color.
  static const Color greyLawDarkSecondaryVariant = Color(0xFF373D5C);

  // Wild willow and wasabi greenish and purple orchid inspired colors.
  // Colors and theme from "name that color" library.

  /// English name of the green Wild Willow and wasabi theme.
  static const String wasabiName = 'Willow and wasabi';

  /// English description of the Wild Willow and wasabi green theme.
  static const String wasabiDescription = 'Wild Willow and wasabi green '
      'with orchid purple inspired colors';

  /// Willow and wasabi green theme color for light primary color.
  static const Color wasabiLightPrimary = Color(0xFF738625);

  /// Willow and wasabi green theme color for light primary variant color.
  static const Color wasabiLightPrimaryVariant = Color(0xFF586621);

  /// Wild Willow and wasabi green theme color for light secondary color.
  static const Color wasabiLightSecondary = Color(0xFF893789);

  /// Willow and wasabi green theme color for light secondary variant color.
  static const Color wasabiLightSecondaryVariant = Color(0xFF5E3974);

  /// Willow and wasabi green theme color for dark primary color.
  static const Color wasabiDarkPrimary = Color(0xFFC3CB77);

  /// Willow and wasabi green theme color for dark primary variant color.
  static const Color wasabiDarkPrimaryVariant = Color(0xFFD7DFB2);

  /// Willow and wasabi green theme color for dark secondary color.
  static const Color wasabiDarkSecondary = Color(0xFFDF9ADF);

  /// Willow and wasabi green theme color for dark secondary variant color.
  static const Color wasabiDarkSecondaryVariant = Color(0xFFA664CD);

  // Gold orange colors, like a tropical evening sunset.
  // Color sources: https://www.w3schools.com/colors/colors_2019.asp

  /// English name of the gold sunset theme.
  static const String goldName = 'Gold sunset';

  /// English description of the gold sunset theme.
  static const String goldDescription = 'Gold sunset color theme, based on '
      'orange like colors';

  /// Gold sunset theme color for light primary color.
  static const Color goldLightPrimary = Color(0xFFb86914); // Dark cheddar 40%

  /// Gold sunset theme color for light primary variant color.
  static const Color goldLightPrimaryVariant = Color(0xFFcf7617); // D.ched 45%

  /// Gold sunset theme color for light secondary color.
  static const Color goldLightSecondary = Color(0xFFEF6C00); // Orange800

  /// Gold sunset theme color for light secondary variant color.
  static const Color goldLightSecondaryVariant = Color(0xFFb36832); // S.alm 45%

  /// Gold sunset theme color for dark primary color.
  static const Color goldDarkPrimary = Color(0xFFeda85e); // Dark cheddar L 65%

  /// Gold sunset theme color for dark primary variant color.
  static const Color goldDarkPrimaryVariant = Color(0xFFf2c18c); // D.ched.L 65%

  /// Gold sunset theme color for dark secondary color.
  static const Color goldDarkSecondary = Color(0xFFd28f60); // S.almond L 60%

  /// Gold sunset theme color for dark secondary variant color.
  static const Color goldDarkSecondaryVariant = Color(0xFFddab88); // S.alm.L70%

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

  /// Mango mojito theme color for light primary variant color.
  static const Color mangoLightPrimaryVariant = Color(0xFFD2691E);

  /// Mango mojito theme color for light secondary color.
  static const Color mangoLightSecondary = Color(0xFF8D9440);

  /// Mango mojito theme color for light secondary variant color.
  static const Color mangoLightSecondaryVariant = Color(0xFF616247);

  /// Mango mojito theme color for dark primary color.
  static const Color mangoDarkPrimary = Color(0xFFDEB059);

  /// Mango mojito theme color for dark primary variant color.
  static const Color mangoDarkPrimaryVariant = Color(0xFFDB874B);

  /// Mango mojito theme color for dark secondary color.
  static const Color mangoDarkSecondary = Color(0xFFAFB479);

  /// Mango mojito theme color for dark secondary variant color.
  static const Color mangoDarkSecondaryVariant = Color(0xFF81816C);

  // Material amber and blue accent colors based scheme.

  /// English name of the amber theme.
  static const String amberName = 'Amber blue';

  /// English description of the amber theme.
  static const String amberDescription =
      'Amber blaze and blue color theme, based on '
      'Material amber and blue accent colors';

  /// Amber theme color for light primary color.
  static const Color amberLightPrimary = Color(0xFFE65100); // Amber900

  /// Amber theme color for light primary variant color.
  static const Color amberLightPrimaryVariant = Color(0xFFFF8F00); // Amber800

  /// Amber theme color for light secondary color.
  static const Color amberLightSecondary = Color(0xFF2979FF); // BlueAccent400

  /// Amber theme color for light secondary variant color.
  static const Color amberLightSecondaryVariant =
      Color(0xFF2962FF); // BlueAccent700

  /// Amber theme color for dark primary color.
  static const Color amberDarkPrimary = Color(0xFFFFB300); // Amber600

  /// Amber theme color for dark primary variant color.
  static const Color amberDarkPrimaryVariant = Color(0xFFFFD54F); // Amber300

  /// Amber theme color for dark secondary color.
  static const Color amberDarkSecondary = Color(0xFF82B1FF); // BlueAccent100

  /// Amber theme color for dark secondary variant color.
  static const Color amberDarkSecondaryVariant =
      Color(0xFF448AFF); // BlueAccent100

  // Vesuvius burned and eden green scheme.
  // Colors and scheme named by "name that color" library.

  /// English name of the vesuvius burned orange theme.
  static const String vesuviusBurnName = 'Vesuvius burned';

  /// English description of the vesuvius burned orange theme.
  static const String vesuviusBurnDescription =
      'Vesuvius burned orange and eden green theme';

  /// Vesuvius burned theme color for light primary color.
  static const Color vesuviusBurnLightPrimary = Color(0xFFA6400F);

  /// Vesuvius burned theme color for light primary variant color.
  static const Color vesuviusBurnLightPrimaryVariant = Color(0xFF7A2800);

  /// Vesuvius burned theme color for light secondary color.
  static const Color vesuviusBurnLightSecondary = Color(0xFF185358);

  /// Vesuvius burned theme color for light secondary variant color.
  static const Color vesuviusBurnLightSecondaryVariant = Color(0xFF144447);

  /// Vesuvius burned theme color for dark primary color.
  static const Color vesuviusBurnDarkPrimary = Color(0xFFD17D53);

  /// Vesuvius burned theme color for dark primary variant color.
  static const Color vesuviusBurnDarkPrimaryVariant = Color(0xFFA7613E);

  /// Vesuvius burned theme color for dark secondary color.
  static const Color vesuviusBurnDarkSecondary = Color(0xFF5B8A8E);

  /// Vesuvius burned theme color for dark secondary variant color.
  static const Color vesuviusBurnDarkSecondaryVariant = Color(0xFF3A7175);

  // Material deepPurple and light blue accent colors based scheme.

  /// English name of the deepPurple theme.
  static const String deepPurpleName = 'Deep purple';

  /// English description of the deepPurple theme.
  static const String deepPurpleDescription = 'Deep purple daisy bush theme, '
      'based on Material deepPurple and lightBlueAccent colors';

  /// Indigo theme color for light primary color.
  static const Color deepPurpleLightPrimary = Color(0xFF4527A0); // dp800

  /// Indigo theme color for light primary variant color.
  static const Color deepPurpleLightPrimaryVariant = Color(0xFF673AB7); // dp500

  /// Indigo theme color for light secondary color.
  static const Color deepPurpleLightSecondary = Color(0xFF0091EA); // lba700

  /// Indigo theme color for light secondary variant color.
  static const Color deepPurpleLightSecondaryVariant =
      Color(0xFF00B0FF); // lba400

  /// Indigo theme color for dark primary color.
  static const Color deepPurpleDarkPrimary = Color(0xFFB39DDB); // dp200

  /// Indigo theme color for dark primary variant color.
  static const Color deepPurpleDarkPrimaryVariant = Color(0xFF9575CD); // dp200

  /// Indigo theme color for dark secondary color.
  static const Color deepPurpleDarkSecondary = Color(0xFF80D8FF); // lba100

  /// Indigo theme color for dark secondary variant color.
  static const Color deepPurpleDarkSecondaryVariant =
      Color(0xFF40C4FF); // lba200

  // Ebony Clay super dark blue grey scheme.
  // Colors and scheme named by "name that color" library.

  /// English name of the Ebony clay theme.
  static const String ebonyClayName = 'Ebony clay';

  /// English description of the Ebony clay theme.
  static const String ebonyClayDescription =
      'Ebony clay dark blue-grey and watercourse green colored theme';

  /// Ebony clay theme color for light primary color.
  static const Color ebonyClayLightPrimary = Color(0xFF202541);

  /// Ebony clay theme color for light primary variant color.
  static const Color ebonyClayLightPrimaryVariant = Color(0xFF202531);

  /// Ebony clay theme color for light secondary color.
  static const Color ebonyClayLightSecondary = Color(0xFF006B54);

  /// Ebony clay theme color for light secondary variant color.
  static const Color ebonyClayLightSecondaryVariant = Color(0xFF004B3B);

  /// Ebony clay theme color for dark primary color.
  static const Color ebonyClayDarkPrimary = Color(0xFF4E597D);

  /// Ebony clay theme color for dark primary variant color.
  static const Color ebonyClayDarkPrimaryVariant = Color(0xFF707EAC);

  /// Ebony clay theme color for dark secondary color.
  static const Color ebonyClayDarkSecondary = Color(0xFF4BA390);

  /// Ebony clay theme color for dark secondary variant color.
  static const Color ebonyClayDarkSecondaryVariant = Color(0xFF3D8475);

  // Barossa dark purple and cardin green scheme.
  // Colors and scheme named by "name that color" library for the light colors.

  /// English name of the Barossa theme.
  static const String barossaName = 'Barossa';

  /// English description of the Barossa theme.
  static const String barossaDescription =
      'Barossa red and cardin green colored theme';

  /// Barossa theme color for light primary color.
  static const Color barossaLightPrimary = Color(0xFF4E0029);

  /// Barossa theme color for light primary variant color.
  static const Color barossaLightPrimaryVariant = Color(0xFF750D43);

  /// Barossa theme color for light secondary color.
  static const Color barossaLightSecondary = Color(0xFF00341A);

  /// Barossa theme color for light secondary variant color.
  static const Color barossaLightSecondaryVariant = Color(0xFF124C2F);

  /// Barossa theme color for dark primary color.
  static const Color barossaDarkPrimary = Color(0xFF94667E);

  /// Barossa theme color for dark primary variant color.
  static const Color barossaDarkPrimaryVariant = Color(0xFFB3718D);

  /// Barossa theme color for dark secondary color.
  static const Color barossaDarkSecondary = Color(0xFF6B9882);

  /// Barossa theme color for dark secondary variant color.
  static const Color barossaDarkSecondaryVariant = Color(0xFF599B7B);

  // Shark grey and orange ecstasy scheme.
  // Color scheme named by "name that color" library using the light colors.

  /// English name of the Shark ecstasy theme.
  static const String sharkName = 'Shark and orange';

  /// English description of the Shark ecstasy theme.
  static const String sharkDescription =
      'Shark grey and orange ecstasy colored theme';

  /// Shark ecstasy theme color for light primary color.
  static const Color sharkLightPrimary = Color(0xFF1D2228);

  /// Shark ecstasy theme color for light primary variant color.
  static const Color sharkLightPrimaryVariant = Color(0xFF484C50);

  /// Shark ecstasy theme color for light secondary color.
  static const Color sharkLightSecondary = Color(0xFFFB8122);

  /// Shark ecstasy theme color for light secondary variant color.
  static const Color sharkLightSecondaryVariant = Color(0xFFEA9654);

  /// Shark ecstasy theme color for dark primary color.
  static const Color sharkDarkPrimary = Color(0xFF777A7E);

  /// Shark ecstasy theme color for dark primary variant color.
  static const Color sharkDarkPrimaryVariant = Color(0xFF919396);

  /// Shark ecstasy theme color for dark secondary color.
  static const Color sharkDarkSecondary = Color(0xFFFCB075);

  /// Shark ecstasy theme color for dark secondary variant color.
  static const Color sharkDarkSecondaryVariant = Color(0xFFEFB383);

  // Big stone blue and neon tulip-three yellow scheme.
  // Colors and scheme named by "name that color" library for the light colors.

  /// English name of the Big stone ecstasy theme.
  static const String bigStoneName = 'Big stone tulip';

  /// English description of the Big stone tulip yellow theme.
  static const String bigStoneDescription =
      'Big stone blue and tulip tree yellow colored theme';

  /// Big stone theme color for light primary color.
  static const Color bigStoneLightPrimary = Color(0xFF1A2C42);

  /// Big stone theme color for light primary variant color.
  static const Color bigStoneLightPrimaryVariant = Color(0xFF0C1115);

  /// Big stone theme color for light secondary color.
  static const Color bigStoneLightSecondary = Color(0xFFE59A18);

  /// Big stone theme color for light secondary variant color.
  static const Color bigStoneLightSecondaryVariant = Color(0xFFF0B03F);

  /// Big stone theme color for dark primary color.
  static const Color bigStoneDarkPrimary = Color(0xFF60748A);

  /// Big stone theme color for dark primary variant color.
  static const Color bigStoneDarkPrimaryVariant = Color(0xFF889EB6);

  /// Big stone theme color for dark secondary color.
  static const Color bigStoneDarkSecondary = Color(0xFFEBB251);

  /// Big stone theme color for dark secondary variant color.
  static const Color bigStoneDarkSecondaryVariant = Color(0xFFF4CA7E);

  // Damask red and lunar green scheme.
  // Colors and scheme named by "name that color" library for the light colors.

  /// English name of the damask theme.
  static const String damaskName = 'Damask and lunar';

  /// English description of the damask theme.
  static const String damaskDescription =
      'Damask red and lunar green colored theme';

  /// Damask theme color for light primary color.
  static const Color damaskLightPrimary = Color(0xFFC96646);

  /// Damask theme color for light primary variant color.
  static const Color damaskLightPrimaryVariant = Color(0xFFD48166);

  /// Damask theme color for light secondary color.
  static const Color damaskLightSecondary = Color(0xFF373A36);

  /// Damask theme color for light secondary variant color.
  static const Color damaskLightSecondaryVariant = Color(0xFF343E32);

  /// Damask theme color for dark primary color.
  static const Color damaskDarkPrimary = Color(0xFFDA9882);

  /// Damask theme color for dark primary variant color.
  static const Color damaskDarkPrimaryVariant = Color(0xFFECC9BD);

  /// Damask theme color for dark secondary color.
  static const Color damaskDarkSecondary = Color(0xFF767D75);

  /// Damask theme color for dark secondary variant color.
  static const Color damaskDarkSecondaryVariant = Color(0xFF839081);

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

  /// Bahama blue theme color for light primary variant color.
  static const Color bahamaBlueLightPrimaryVariant = Color(0xFF658EAF);

  /// Bahama blue theme color for light secondary color.
  static const Color bahamaBlueLightSecondary = Color(0xFFDD520F);

  /// Bahama blue theme color for light secondary variant color.
  static const Color bahamaBlueLightSecondaryVariant = Color(0xFF7CC8F8);

  /// Bahama blue theme color for dark primary color.
  static const Color bahamaBlueDarkPrimary = Color(0xFF4585B5);

  /// Bahama blue theme color for dark primary variant color.
  static const Color bahamaBlueDarkPrimaryVariant = Color(0xFF70A1C9);

  /// Bahama blue theme color for dark secondary color.
  static const Color bahamaBlueDarkSecondary = Color(0xFFE57C4A);

  /// Bahama blue theme color for dark secondary variant color.
  static const Color bahamaBlueDarkSecondaryVariant = Color(0xFF9CD5F9);

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

  /// Mallard green theme color for light primary variant color.
  static const Color mallardGreenLightPrimaryVariant = Color(0xFF779151);

  /// Mallard green theme color for light secondary color.
  static const Color mallardGreenLightSecondary = Color(0xFFD34B4B);

  /// Mallard green theme color for light secondary variant color.
  static const Color mallardGreenLightSecondaryVariant = Color(0xFF959D33);

  /// Mallard green theme color for dark primary color.
  static const Color mallardGreenDarkPrimary = Color(0xFF808E79);

  /// Mallard green theme color for dark primary variant color.
  static const Color mallardGreenDarkPrimaryVariant = Color(0xFFA3B58A);

  /// Mallard green theme color for dark secondary color.
  static const Color mallardGreenDarkSecondary = Color(0xFFE18686);

  /// Mallard green theme color for dark secondary variant color.
  static const Color mallardGreenDarkSecondaryVariant = Color(0xFFC3C87A);

  // Espresso dark brown and crema scheme.
  // Colors and scheme named by "name that color" library for the light colors.
  // The colors are based on image theme nr 11 mix 1 in Flexfold demo app.

  /// English name of the espresso theme.
  static const String espressoName = 'Espresso and crema';

  /// English description of the espresso theme.
  static const String espressoDescription =
      'Espresso dark brown and crema colored theme';

  /// Espresso theme color for light primary color.
  static const Color espressoLightPrimary = Color(0xFF220804);

  /// Espresso theme color for light primary variant color.
  static const Color espressoLightPrimaryVariant = Color(0xFF977F55);

  /// Espresso theme color for light secondary color.
  static const Color espressoLightSecondary = Color(0xFFE3B964);

  /// Espresso theme color for light secondary variant color.
  static const Color espressoLightSecondaryVariant = Color(0xFFF5E9C9);

  /// Espresso theme color for dark primary color.
  static const Color espressoDarkPrimary = Color(0xFF8D7F7D);

  /// Espresso theme color for dark primary variant color.
  static const Color espressoDarkPrimaryVariant = Color(0xFFC3B59D);

  /// Espresso theme color for dark secondary color.
  static const Color espressoDarkSecondary = Color(0xFFEED6A6);

  /// Espresso theme color for dark secondary variant color.
  static const Color espressoDarkSecondaryVariant = Color(0xFFF8ECD4);

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

  /// Outer Space theme color for light primary variant color.
  static const Color outerSpaceLightPrimaryVariant = Color(0xFF416A7D);

  /// Outer Space theme color for light secondary color.
  static const Color outerSpaceLightSecondary = Color(0xFFD2600A);

  /// Outer Space theme color for light secondary variant color.
  static const Color outerSpaceLightSecondaryVariant = Color(0xFF93A0A9);

  /// Outer Space theme color for dark primary color.
  static const Color outerSpaceDarkPrimary = Color(0xFF486A71);

  /// Outer Space theme color for dark primary variant color.
  static const Color outerSpaceDarkPrimaryVariant = Color(0xFF6A8A99);

  /// Outer Space theme color for dark secondary color.
  static const Color outerSpaceDarkSecondary = Color(0xFFDB823F);

  /// Outer Space theme color for dark secondary variant color.
  static const Color outerSpaceDarkSecondaryVariant = Color(0xFFAAB4BB);

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

  /// Blue whale theme color for light primary variant color.
  static const Color blueWhaleLightPrimaryVariant = Color(0xFF2A9D8F);

  /// Blue whale theme color for light secondary color.
  static const Color blueWhaleLightSecondary = Color(0xFFF86541);

  /// Blue whale theme color for light secondary variant color.
  static const Color blueWhaleLightSecondaryVariant = Color(0xFFF07E24);

  /// Blue whale theme color for dark primary color.
  static const Color blueWhaleDarkPrimary = Color(0xFF57859D);

  /// Blue whale theme color for dark primary variant color.
  static const Color blueWhaleDarkPrimaryVariant = Color(0xFF50A399);

  /// Blue whale theme color for dark secondary color.
  static const Color blueWhaleDarkSecondary = Color(0xFFFF6E48);

  /// Blue whale theme color for dark secondary variant color.
  static const Color blueWhaleDarkSecondaryVariant = Color(0xFFED7F29);

  // San Juan blue and salmon pink.
  // Colors and scheme named by "name that color" library for the light colors.

  /// English name of the San Juan blue theme.
  static const String sanJuanBlueName = 'San Juan blue';

  /// English description of the sanJuanBlue theme.
  static const String sanJuanBlueDescription =
      'San Juan blue and pink salmon theme';

  /// San Juan blue theme color for light primary color.
  static const Color sanJuanBlueLightPrimary = Color(0xFF375778);

  /// San Juan blue theme color for light primary variant color.
  static const Color sanJuanBlueLightPrimaryVariant = Color(0xFF637E9F);

  /// San Juan blue theme color for light secondary color.
  static const Color sanJuanBlueLightSecondary = Color(0xFFF98D94);

  /// San Juan blue theme color for light secondary variant color.
  static const Color sanJuanBlueLightSecondaryVariant = Color(0xFFF2C4C7);

  /// San Juan blue theme color for dark primary color.
  static const Color sanJuanBlueDarkPrimary = Color(0xFF5E7691);

  /// San Juan blue theme color for dark primary variant color.
  static const Color sanJuanBlueDarkPrimaryVariant = Color(0xFF8096B1);

  /// San Juan blue theme color for dark secondary color.
  static const Color sanJuanBlueDarkSecondary = Color(0xFFEBA1A6);

  /// San Juan blue theme color for dark secondary variant color.
  static const Color sanJuanBlueDarkSecondaryVariant = Color(0xFFF4CFD1);

  // Rosewood red, with horses neck and driftwood theme.
  // Colors and scheme named by "name that color" library for the light colors.

  /// English name of the rosewood theme.
  static const String rosewoodName = 'Rosewood';

  /// English description of the rosewood theme.
  static const String rosewoodDescription =
      'Rosewood red, with horses neck and driftwood theme';

  /// Rosewood theme color for light primary color.
  static const Color rosewoodLightPrimary = Color(0xFF5C000E);

  /// Rosewood theme color for light primary variant color.
  static const Color rosewoodLightPrimaryVariant = Color(0xFF9D3E4C);

  /// Rosewood theme color for light secondary color.
  static const Color rosewoodLightSecondary = Color(0xFF74540E);

  /// Rosewood theme color for light secondary variant color.
  static const Color rosewoodLightSecondaryVariant = Color(0xFFAD8845);

  /// Rosewood theme color for dark primary color.
  static const Color rosewoodDarkPrimary = Color(0xFF9C5A69);

  /// Rosewood theme color for dark primary variant color.
  static const Color rosewoodDarkPrimaryVariant = Color(0xFFB97C88);

  /// Rosewood theme color for dark secondary color.
  static const Color rosewoodDarkSecondary = Color(0xFFEDCE9B);

  /// Rosewood theme color for dark secondary variant color.
  static const Color rosewoodDarkSecondaryVariant = Color(0xFFF5DFB9);

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

  /// Blumine blue green theme color for light primary variant color.
  static const Color blumineBlueLightPrimaryVariant = Color(0xFF0B8691);

  /// Blumine blue green theme color for light secondary color.
  static const Color blumineBlueLightSecondary = Color(0xFFFEB716);

  /// Blumine blue green theme color for light secondary variant color.
  static const Color blumineBlueLightSecondaryVariant = Color(0xFF0093C7);

  /// Blumine blue green theme color for dark primary color.
  static const Color blumineBlueDarkPrimary = Color(0xFF82BACE);

  /// Blumine blue green theme color for dark primary variant color.
  static const Color blumineBlueDarkPrimaryVariant = Color(0xFF569899);

  /// Blumine blue green theme color for dark secondary color.
  static const Color blumineBlueDarkSecondary = Color(0xFFFFD682);

  /// Blumine blue green theme color for dark secondary variant color.
  static const Color blumineBlueDarkSecondaryVariant = Color(0xFF243E4D);

  /// English name of the custom theme.
  static const String customName = 'Custom';

  /// English description of the custom theme.
  static const String customDescription = 'Define a custom color scheme';

  // Define private FlexSchemeData objects for all color schemes, so we can use
  // them as const in both a map and list, without repeating them.

  /// Material default color scheme based FlexSchemeData.
  static const FlexSchemeData material = FlexSchemeData(
    name: materialName,
    description: materialDescription,
    light: FlexSchemeColor(
      primary: materialLightPrimary,
      primaryVariant: materialLightPrimaryVariant,
      secondary: materialLightSecondary,
      secondaryVariant: materialLightSecondaryVariant,
      appBarColor: materialLightSecondaryVariant,
      error: materialLightError,
    ),
    dark: FlexSchemeColor(
      primary: materialDarkPrimary,
      primaryVariant: materialDarkPrimaryVariant,
      secondary: materialDarkSecondary,
      secondaryVariant: materialDarkSecondaryVariant,
      appBarColor: materialDarkSecondaryVariant,
      error: materialDarkError,
    ),
  );

  /// Material default high contrast color scheme based FlexSchemeData.
  static const FlexSchemeData materialHc = FlexSchemeData(
    name: materialHcName,
    description: materialHcDescription,
    light: FlexSchemeColor(
      primary: materialLightPrimaryHc,
      primaryVariant: materialLightPrimaryVariantHc,
      secondary: materialLightSecondaryHc,
      secondaryVariant: materialLightSecondaryVariantHc,
      appBarColor: materialLightSecondaryVariantHc,
      error: materialLightErrorHc,
    ),
    dark: FlexSchemeColor(
      primary: materialDarkPrimaryHc,
      primaryVariant: materialDarkPrimaryVariantHc,
      secondary: materialDarkSecondaryHc,
      secondaryVariant: materialDarkSecondaryVariantHc,
      appBarColor: materialDarkSecondaryVariantHc,
      error: materialDarkErrorHc,
    ),
  );

  /// Material blue color scheme based FlexSchemeData.
  static const FlexSchemeData blue = FlexSchemeData(
    name: blueName,
    description: blueDescription,
    light: FlexSchemeColor(
      primary: blueLightPrimary,
      primaryVariant: blueLightPrimaryVariant,
      secondary: blueLightSecondary,
      secondaryVariant: blueLightSecondaryVariant,
      appBarColor: blueLightSecondaryVariant,
      error: materialLightError,
    ),
    dark: FlexSchemeColor(
      primary: blueDarkPrimary,
      primaryVariant: blueDarkPrimaryVariant,
      secondary: blueDarkSecondary,
      secondaryVariant: blueDarkSecondaryVariant,
      appBarColor: blueDarkSecondaryVariant,
      error: materialDarkError,
    ),
  );

  /// Material indigo and deep purple color scheme based FlexSchemeData.
  static const FlexSchemeData indigo = FlexSchemeData(
    name: indigoName,
    description: indigoDescription,
    light: FlexSchemeColor(
      primary: indigoLightPrimary,
      primaryVariant: indigoLightPrimaryVariant,
      secondary: indigoLightSecondary,
      secondaryVariant: indigoLightSecondaryVariant,
      appBarColor: indigoLightSecondaryVariant,
      error: materialLightError,
    ),
    dark: FlexSchemeColor(
      primary: indigoDarkPrimary,
      primaryVariant: indigoDarkPrimaryVariant,
      secondary: indigoDarkSecondary,
      secondaryVariant: indigoDarkSecondaryVariant,
      appBarColor: indigoDarkSecondaryVariant,
      error: materialDarkError,
    ),
  );

  /// Hippie blue with surfie green and chock coral pink based FlexSchemeData.
  static const FlexSchemeData hippieBlue = FlexSchemeData(
    name: hippieBlueName,
    description: hippieBlueDescription,
    light: FlexSchemeColor(
      primary: hippieBlueLightPrimary,
      primaryVariant: hippieBlueLightPrimaryVariant,
      secondary: hippieBlueLightSecondary,
      secondaryVariant: hippieBlueLightSecondaryVariant,
      appBarColor: hippieBlueLightSecondaryVariant,
      error: materialLightError,
    ),
    dark: FlexSchemeColor(
      primary: hippieBlueDarkPrimary,
      primaryVariant: hippieBlueDarkPrimaryVariant,
      secondary: hippieBlueDarkSecondary,
      secondaryVariant: hippieBlueDarkSecondaryVariant,
      appBarColor: hippieBlueDarkSecondaryVariant,
      error: materialDarkError,
    ),
  );

  /// Aqua tropical blue ocean color scheme based FlexSchemeData.
  static const FlexSchemeData aquaBlue = FlexSchemeData(
    name: aquaBlueName,
    description: aquaBlueDescription,
    light: FlexSchemeColor(
      primary: aquaBlueLightPrimary,
      primaryVariant: aquaBlueLightPrimaryVariant,
      secondary: aquaBlueLightSecondary,
      secondaryVariant: aquaBlueLightSecondaryVariant,
      appBarColor: aquaBlueLightSecondaryVariant,
      error: materialLightError,
    ),
    dark: FlexSchemeColor(
      primary: aquaBlueDarkPrimary,
      primaryVariant: aquaBlueDarkPrimaryVariant,
      secondary: aquaBlueDarkSecondary,
      secondaryVariant: aquaBlueDarkSecondaryVariant,
      appBarColor: aquaBlueDarkSecondaryVariant,
      error: materialDarkError,
    ),
  );

  /// Brand blues theme color based FlexSchemeData.
  static const FlexSchemeData brandBlue = FlexSchemeData(
    name: brandBlueName,
    description: brandBlueDescription,
    light: FlexSchemeColor(
      primary: brandBlueLightPrimary,
      primaryVariant: brandBlueLightPrimaryVariant,
      secondary: brandBlueLightSecondary,
      secondaryVariant: brandBlueLightSecondaryVariant,
      appBarColor: brandBlueLightSecondaryVariant,
      error: materialLightError,
    ),
    dark: FlexSchemeColor(
      primary: brandBlueDarkPrimary,
      primaryVariant: brandBlueDarkPrimaryVariant,
      secondary: brandBlueDarkSecondary,
      secondaryVariant: brandBlueDarkSecondaryVariant,
      appBarColor: brandBlueDarkSecondaryVariant,
      error: materialDarkError,
    ),
  );

  /// Dark deep blue sea color based FlexSchemeData.
  static const FlexSchemeData deepBlue = FlexSchemeData(
    name: deepBlueName,
    description: deepBlueDescription,
    light: FlexSchemeColor(
      primary: deepBlueLightPrimary,
      primaryVariant: deepBlueLightPrimaryVariant,
      secondary: deepBlueLightSecondary,
      secondaryVariant: deepBlueLightSecondaryVariant,
      appBarColor: deepBlueLightSecondaryVariant,
      error: materialLightError,
    ),
    dark: FlexSchemeColor(
      primary: deepBlueDarkPrimary,
      primaryVariant: deepBlueDarkPrimaryVariant,
      secondary: deepBlueDarkSecondary,
      secondaryVariant: deepBlueDarkSecondaryVariant,
      appBarColor: deepBlueDarkSecondaryVariant,
      error: materialDarkError,
    ),
  );

  /// Sakura cherry blossom like colors based FlexSchemeData.
  static const FlexSchemeData sakura = FlexSchemeData(
    name: sakuraName,
    description: sakuraDescription,
    light: FlexSchemeColor(
      primary: sakuraLightPrimary,
      primaryVariant: sakuraLightPrimaryVariant,
      secondary: sakuraLightSecondary,
      secondaryVariant: sakuraLightSecondaryVariant,
      appBarColor: sakuraLightSecondaryVariant,
      error: materialLightErrorHc,
    ),
    dark: FlexSchemeColor(
      primary: sakuraDarkPrimary,
      primaryVariant: sakuraDarkPrimaryVariant,
      secondary: sakuraDarkSecondary,
      secondaryVariant: sakuraDarkSecondaryVariant,
      appBarColor: sakuraDarkSecondaryVariant,
      error: materialDarkError,
    ),
  );

  /// Mandy red and Viking blue inspired colors based FlexSchemeData.
  static const FlexSchemeData mandyRed = FlexSchemeData(
    name: mandyRedName,
    description: mandyRedDescription,
    light: FlexSchemeColor(
      primary: mandyRedLightPrimary,
      primaryVariant: mandyRedLightPrimaryVariant,
      secondary: mandyRedLightSecondary,
      secondaryVariant: mandyRedLightSecondaryVariant,
      appBarColor: mandyRedLightSecondaryVariant,
      error: materialLightErrorHc,
    ),
    dark: FlexSchemeColor(
      primary: mandyRedDarkPrimary,
      primaryVariant: mandyRedDarkPrimaryVariant,
      secondary: mandyRedDarkSecondary,
      secondaryVariant: mandyRedDarkSecondaryVariant,
      appBarColor: mandyRedDarkSecondaryVariant,
      error: materialDarkError,
    ),
  );

  /// Material red and pink colors based FlexSchemeData.
  static const FlexSchemeData red = FlexSchemeData(
    name: redName,
    description: redDescription,
    light: FlexSchemeColor(
      primary: redLightPrimary,
      primaryVariant: redLightPrimaryVariant,
      secondary: redLightSecondary,
      secondaryVariant: redLightSecondaryVariant,
      appBarColor: redLightSecondaryVariant,
      error: materialLightErrorHc,
    ),
    dark: FlexSchemeColor(
      primary: redDarkPrimary,
      primaryVariant: redDarkPrimaryVariant,
      secondary: redDarkSecondary,
      secondaryVariant: redDarkSecondaryVariant,
      appBarColor: redDarkSecondaryVariant,
      error: materialDarkError,
    ),
  );

  /// Red wine like colors based FlexSchemeData.
  static const FlexSchemeData redWine = FlexSchemeData(
    name: redWineName,
    description: redWineDescription,
    light: FlexSchemeColor(
      primary: redWineLightPrimary,
      primaryVariant: redWineLightPrimaryVariant,
      secondary: redWineLightSecondary,
      secondaryVariant: redWineLightSecondaryVariant,
      appBarColor: redWineLightSecondaryVariant,
      error: materialLightErrorHc,
    ),
    dark: FlexSchemeColor(
      primary: redWineDarkPrimary,
      primaryVariant: redWineDarkPrimaryVariant,
      secondary: redWineDarkSecondary,
      secondaryVariant: redWineDarkSecondaryVariant,
      appBarColor: redWineDarkSecondaryVariant,
      error: materialDarkError,
    ),
  );

  /// Purple brown tinted aubergine and eggplant colored based FlexSchemeData.
  static const FlexSchemeData purpleBrown = FlexSchemeData(
    name: purpleBrownName,
    description: purpleBrownDescription,
    light: FlexSchemeColor(
      primary: purpleBrownLightPrimary,
      primaryVariant: purpleBrownLightPrimaryVariant,
      secondary: purpleBrownLightSecondary,
      secondaryVariant: purpleBrownLightSecondaryVariant,
      appBarColor: purpleBrownLightSecondaryVariant,
      error: materialLightError,
    ),
    dark: FlexSchemeColor(
      primary: purpleBrownDarkPrimary,
      primaryVariant: purpleBrownDarkPrimaryVariant,
      secondary: purpleBrownDarkSecondary,
      secondaryVariant: purpleBrownDarkSecondaryVariant,
      appBarColor: purpleBrownDarkSecondaryVariant,
      error: materialDarkError,
    ),
  );

  /// Material green and cyan colors based FlexSchemeData.
  static const FlexSchemeData green = FlexSchemeData(
    name: greenName,
    description: greenDescription,
    light: FlexSchemeColor(
      primary: greenLightPrimary,
      primaryVariant: greenLightPrimaryVariant,
      secondary: greenLightSecondary,
      secondaryVariant: greenLightSecondaryVariant,
      appBarColor: greenLightSecondaryVariant,
      error: materialLightErrorHc,
    ),
    dark: FlexSchemeColor(
      primary: greenDarkPrimary,
      primaryVariant: greenDarkPrimaryVariant,
      secondary: greenDarkSecondary,
      secondaryVariant: greenDarkSecondaryVariant,
      appBarColor: greenDarkSecondaryVariant,
      error: materialDarkError,
    ),
  );

  /// Green money and finance style colors based FlexSchemeData.
  static const FlexSchemeData money = FlexSchemeData(
    name: moneyName,
    description: moneyDescription,
    light: FlexSchemeColor(
      primary: moneyLightPrimary,
      primaryVariant: moneyLightPrimaryVariant,
      secondary: moneyLightSecondary,
      secondaryVariant: moneyLightSecondaryVariant,
      appBarColor: moneyLightSecondaryVariant,
      error: materialLightErrorHc,
    ),
    dark: FlexSchemeColor(
      primary: moneyDarkPrimary,
      primaryVariant: moneyDarkPrimaryVariant,
      secondary: moneyDarkSecondary,
      secondaryVariant: moneyDarkSecondaryVariant,
      appBarColor: moneyDarkSecondaryVariant,
      error: materialDarkError,
    ),
  );

  /// Green jungle and rain forest colors based FlexSchemeData.
  static const FlexSchemeData jungle = FlexSchemeData(
    name: jungleName,
    description: jungleDescription,
    light: FlexSchemeColor(
      primary: jungleLightPrimary,
      primaryVariant: jungleLightPrimaryVariant,
      secondary: jungleLightSecondary,
      secondaryVariant: jungleLightSecondaryVariant,
      appBarColor: jungleLightSecondaryVariant,
      error: materialLightErrorHc,
    ),
    dark: FlexSchemeColor(
      primary: jungleDarkPrimary,
      primaryVariant: jungleDarkPrimaryVariant,
      secondary: jungleDarkSecondary,
      secondaryVariant: jungleDarkSecondaryVariant,
      appBarColor: jungleDarkSecondaryVariant,
      error: materialDarkError,
    ),
  );

  /// Material blue grey and ultra dark purple colors based FlexSchemeData.
  static const FlexSchemeData greyLaw = FlexSchemeData(
    name: greyLawName,
    description: greyLawDescription,
    light: FlexSchemeColor(
      primary: greyLawLightPrimary,
      primaryVariant: greyLawLightPrimaryVariant,
      secondary: greyLawLightSecondary,
      secondaryVariant: greyLawLightSecondaryVariant,
      appBarColor: greyLawLightSecondaryVariant,
      error: materialLightErrorHc,
    ),
    dark: FlexSchemeColor(
      primary: greyLawDarkPrimary,
      primaryVariant: greyLawDarkPrimaryVariant,
      secondary: greyLawDarkSecondary,
      secondaryVariant: greyLawDarkSecondaryVariant,
      appBarColor: greyLawDarkSecondaryVariant,
      error: materialDarkError,
    ),
  );

  /// Willow and wasabi green colors based FlexSchemeData.
  static const FlexSchemeData wasabi = FlexSchemeData(
    name: wasabiName,
    description: wasabiDescription,
    light: FlexSchemeColor(
      primary: wasabiLightPrimary,
      primaryVariant: wasabiLightPrimaryVariant,
      secondary: wasabiLightSecondary,
      secondaryVariant: wasabiLightSecondaryVariant,
      appBarColor: wasabiLightSecondaryVariant,
      error: materialLightErrorHc,
    ),
    dark: FlexSchemeColor(
      primary: wasabiDarkPrimary,
      primaryVariant: wasabiDarkPrimaryVariant,
      secondary: wasabiDarkSecondary,
      secondaryVariant: wasabiDarkSecondaryVariant,
      appBarColor: wasabiDarkSecondaryVariant,
      error: materialDarkError,
    ),
  );

  /// Gold sunset colors based FlexSchemeData.
  static const FlexSchemeData gold = FlexSchemeData(
    name: goldName,
    description: goldDescription,
    light: FlexSchemeColor(
      primary: goldLightPrimary,
      primaryVariant: goldLightPrimaryVariant,
      secondary: goldLightSecondary,
      secondaryVariant: goldLightSecondaryVariant,
      appBarColor: goldLightSecondaryVariant,
      error: materialLightErrorHc,
    ),
    dark: FlexSchemeColor(
      primary: goldDarkPrimary,
      primaryVariant: goldDarkPrimaryVariant,
      secondary: goldDarkSecondary,
      secondaryVariant: goldDarkSecondaryVariant,
      appBarColor: goldDarkSecondaryVariant,
      error: materialDarkError,
    ),
  );

  /// Orange and green Mango mojito colors based FlexSchemeData.
  static const FlexSchemeData mango = FlexSchemeData(
    name: mangoName,
    description: mangoDescription,
    light: FlexSchemeColor(
      primary: mangoLightPrimary,
      primaryVariant: mangoLightPrimaryVariant,
      secondary: mangoLightSecondary,
      secondaryVariant: mangoLightSecondaryVariant,
      appBarColor: mangoLightSecondaryVariant,
      error: materialLightError,
    ),
    dark: FlexSchemeColor(
      primary: mangoDarkPrimary,
      primaryVariant: mangoDarkPrimaryVariant,
      secondary: mangoDarkSecondary,
      secondaryVariant: mangoDarkSecondaryVariant,
      appBarColor: mangoDarkSecondaryVariant,
      error: materialDarkError,
    ),
  );

  /// Material amber and blue accent colors based FlexSchemeData.
  ///
  /// This is a high contrast color scheme, an alternative to the Material
  /// design hih contrast color scheme set [FlexColor.materialHc].
  ///
  static const FlexSchemeData amber = FlexSchemeData(
    name: amberName,
    description: amberDescription,
    light: FlexSchemeColor(
      primary: amberLightPrimary,
      primaryVariant: amberLightPrimaryVariant,
      secondary: amberLightSecondary,
      secondaryVariant: amberLightSecondaryVariant,
      appBarColor: amberLightSecondaryVariant,
      error: materialLightError,
    ),
    dark: FlexSchemeColor(
      primary: amberDarkPrimary,
      primaryVariant: amberDarkPrimaryVariant,
      secondary: amberDarkSecondary,
      secondaryVariant: amberDarkSecondaryVariant,
      appBarColor: amberDarkSecondaryVariant,
      error: materialDarkError,
    ),
  );

  /// Vesuvius burned orange and eden green colors based FlexSchemeData.
  static const FlexSchemeData vesuviusBurn = FlexSchemeData(
    name: vesuviusBurnName,
    description: vesuviusBurnDescription,
    light: FlexSchemeColor(
      primary: vesuviusBurnLightPrimary,
      primaryVariant: vesuviusBurnLightPrimaryVariant,
      secondary: vesuviusBurnLightSecondary,
      secondaryVariant: vesuviusBurnLightSecondaryVariant,
      appBarColor: vesuviusBurnLightSecondaryVariant,
      error: materialLightError,
    ),
    dark: FlexSchemeColor(
      primary: vesuviusBurnDarkPrimary,
      primaryVariant: vesuviusBurnDarkPrimaryVariant,
      secondary: vesuviusBurnDarkSecondary,
      secondaryVariant: vesuviusBurnDarkSecondaryVariant,
      appBarColor: vesuviusBurnDarkSecondaryVariant,
      error: materialDarkError,
    ),
  );

  /// Material deepPurple and lightBlueAccent colors based FlexSchemeData.
  static const FlexSchemeData deepPurple = FlexSchemeData(
    name: deepPurpleName,
    description: deepPurpleDescription,
    light: FlexSchemeColor(
      primary: deepPurpleLightPrimary,
      primaryVariant: deepPurpleLightPrimaryVariant,
      secondary: deepPurpleLightSecondary,
      secondaryVariant: deepPurpleLightSecondaryVariant,
      appBarColor: deepPurpleLightSecondaryVariant,
      error: materialLightError,
    ),
    dark: FlexSchemeColor(
      primary: deepPurpleDarkPrimary,
      primaryVariant: deepPurpleDarkPrimaryVariant,
      secondary: deepPurpleDarkSecondary,
      secondaryVariant: deepPurpleDarkSecondaryVariant,
      appBarColor: deepPurpleDarkSecondaryVariant,
      error: materialDarkError,
    ),
  );

  /// Ebony clay dark blue-grey and watercourse green colors
  /// based FlexSchemeData.
  static const FlexSchemeData ebonyClay = FlexSchemeData(
    name: ebonyClayName,
    description: ebonyClayDescription,
    light: FlexSchemeColor(
      primary: ebonyClayLightPrimary,
      primaryVariant: ebonyClayLightPrimaryVariant,
      secondary: ebonyClayLightSecondary,
      secondaryVariant: ebonyClayLightSecondaryVariant,
      appBarColor: ebonyClayLightSecondaryVariant,
      error: materialLightError,
    ),
    dark: FlexSchemeColor(
      primary: ebonyClayDarkPrimary,
      primaryVariant: ebonyClayDarkPrimaryVariant,
      secondary: ebonyClayDarkSecondary,
      secondaryVariant: ebonyClayDarkSecondaryVariant,
      appBarColor: ebonyClayDarkSecondaryVariant,
      error: materialDarkError,
    ),
  );

  /// Barossa red and cardin green colors based FlexSchemeData.
  static const FlexSchemeData barossa = FlexSchemeData(
    name: barossaName,
    description: barossaDescription,
    light: FlexSchemeColor(
      primary: barossaLightPrimary,
      primaryVariant: barossaLightPrimaryVariant,
      secondary: barossaLightSecondary,
      secondaryVariant: barossaLightSecondaryVariant,
      appBarColor: barossaLightSecondaryVariant,
      error: materialLightError,
    ),
    dark: FlexSchemeColor(
      primary: barossaDarkPrimary,
      primaryVariant: barossaDarkPrimaryVariant,
      secondary: barossaDarkSecondary,
      secondaryVariant: barossaDarkSecondaryVariant,
      appBarColor: barossaDarkSecondaryVariant,
      error: materialDarkError,
    ),
  );

  /// Shark grey and orange ecstasy colors based FlexSchemeData.
  static const FlexSchemeData shark = FlexSchemeData(
    name: sharkName,
    description: sharkDescription,
    light: FlexSchemeColor(
      primary: sharkLightPrimary,
      primaryVariant: sharkLightPrimaryVariant,
      secondary: sharkLightSecondary,
      secondaryVariant: sharkLightSecondaryVariant,
      appBarColor: sharkLightSecondaryVariant,
      error: materialLightError,
    ),
    dark: FlexSchemeColor(
      primary: sharkDarkPrimary,
      primaryVariant: sharkDarkPrimaryVariant,
      secondary: sharkDarkSecondary,
      secondaryVariant: sharkDarkSecondaryVariant,
      appBarColor: sharkDarkSecondaryVariant,
      error: materialDarkError,
    ),
  );

  /// Big stone blue and tulip tree yellow colors based FlexSchemeData.
  static const FlexSchemeData bigStone = FlexSchemeData(
    name: bigStoneName,
    description: bigStoneDescription,
    light: FlexSchemeColor(
      primary: bigStoneLightPrimary,
      primaryVariant: bigStoneLightPrimaryVariant,
      secondary: bigStoneLightSecondary,
      secondaryVariant: bigStoneLightSecondaryVariant,
      appBarColor: bigStoneLightSecondaryVariant,
      error: materialLightError,
    ),
    dark: FlexSchemeColor(
      primary: bigStoneDarkPrimary,
      primaryVariant: bigStoneDarkPrimaryVariant,
      secondary: bigStoneDarkSecondary,
      secondaryVariant: bigStoneDarkSecondaryVariant,
      appBarColor: bigStoneDarkSecondaryVariant,
      error: materialDarkError,
    ),
  );

  /// Damask red and lunar green colors based FlexSchemeData.
  static const FlexSchemeData damask = FlexSchemeData(
    name: damaskName,
    description: damaskDescription,
    light: FlexSchemeColor(
      primary: damaskLightPrimary,
      primaryVariant: damaskLightPrimaryVariant,
      secondary: damaskLightSecondary,
      secondaryVariant: damaskLightSecondaryVariant,
      appBarColor: damaskLightSecondaryVariant,
      error: materialLightError,
    ),
    dark: FlexSchemeColor(
      primary: damaskDarkPrimary,
      primaryVariant: damaskDarkPrimaryVariant,
      secondary: damaskDarkSecondary,
      secondaryVariant: damaskDarkSecondaryVariant,
      appBarColor: damaskDarkSecondaryVariant,
      error: materialDarkError,
    ),
  );

  /// Bahama blue and trinidad orange colors based FlexSchemeData.
  static const FlexSchemeData bahamaBlue = FlexSchemeData(
    name: bahamaBlueName,
    description: bahamaBlueDescription,
    light: FlexSchemeColor(
      primary: bahamaBlueLightPrimary,
      primaryVariant: bahamaBlueLightPrimaryVariant,
      secondary: bahamaBlueLightSecondary,
      secondaryVariant: bahamaBlueLightSecondaryVariant,
      appBarColor: bahamaBlueLightSecondaryVariant,
      error: materialLightError,
    ),
    dark: FlexSchemeColor(
      primary: bahamaBlueDarkPrimary,
      primaryVariant: bahamaBlueDarkPrimaryVariant,
      secondary: bahamaBlueDarkSecondary,
      secondaryVariant: bahamaBlueDarkSecondaryVariant,
      appBarColor: bahamaBlueDarkSecondaryVariant,
      error: materialDarkError,
    ),
  );

  /// Mallard green and Valencia pink colors based FlexSchemeData.
  static const FlexSchemeData mallardGreen = FlexSchemeData(
    name: mallardGreenName,
    description: mallardGreenDescription,
    light: FlexSchemeColor(
      primary: mallardGreenLightPrimary,
      primaryVariant: mallardGreenLightPrimaryVariant,
      secondary: mallardGreenLightSecondary,
      secondaryVariant: mallardGreenLightSecondaryVariant,
      appBarColor: mallardGreenLightSecondaryVariant,
      error: materialLightError,
    ),
    dark: FlexSchemeColor(
      primary: mallardGreenDarkPrimary,
      primaryVariant: mallardGreenDarkPrimaryVariant,
      secondary: mallardGreenDarkSecondary,
      secondaryVariant: mallardGreenDarkSecondaryVariant,
      appBarColor: mallardGreenDarkSecondaryVariant,
      error: materialDarkError,
    ),
  );

  /// Espresso dark brown and crema colors based FlexSchemeData.
  static const FlexSchemeData espresso = FlexSchemeData(
    name: espressoName,
    description: espressoDescription,
    light: FlexSchemeColor(
      primary: espressoLightPrimary,
      primaryVariant: espressoLightPrimaryVariant,
      secondary: espressoLightSecondary,
      secondaryVariant: espressoLightSecondaryVariant,
      appBarColor: espressoLightSecondaryVariant,
      error: materialLightError,
    ),
    dark: FlexSchemeColor(
      primary: espressoDarkPrimary,
      primaryVariant: espressoDarkPrimaryVariant,
      secondary: espressoDarkSecondary,
      secondaryVariant: espressoDarkSecondaryVariant,
      appBarColor: espressoDarkSecondaryVariant,
      error: materialDarkError,
    ),
  );

  /// Outer space dark blue-grey and stage red colors based FlexSchemeData.
  static const FlexSchemeData outerSpace = FlexSchemeData(
    name: outerSpaceName,
    description: outerSpaceDescription,
    light: FlexSchemeColor(
      primary: outerSpaceLightPrimary,
      primaryVariant: outerSpaceLightPrimaryVariant,
      secondary: outerSpaceLightSecondary,
      secondaryVariant: outerSpaceLightSecondaryVariant,
      appBarColor: outerSpaceLightSecondaryVariant,
      error: materialLightError,
    ),
    dark: FlexSchemeColor(
      primary: outerSpaceDarkPrimary,
      primaryVariant: outerSpaceDarkPrimaryVariant,
      secondary: outerSpaceDarkSecondary,
      secondaryVariant: outerSpaceDarkSecondaryVariant,
      appBarColor: outerSpaceDarkSecondaryVariant,
      error: materialDarkError,
    ),
  );

  /// Blue whale dark blue-grey and stage red colors based FlexSchemeData.
  static const FlexSchemeData blueWhale = FlexSchemeData(
    name: blueWhaleName,
    description: blueWhaleDescription,
    light: FlexSchemeColor(
      primary: blueWhaleLightPrimary,
      primaryVariant: blueWhaleLightPrimaryVariant,
      secondary: blueWhaleLightSecondary,
      secondaryVariant: blueWhaleLightSecondaryVariant,
      appBarColor: blueWhaleLightSecondaryVariant,
      error: materialLightError,
    ),
    dark: FlexSchemeColor(
      primary: blueWhaleDarkPrimary,
      primaryVariant: blueWhaleDarkPrimaryVariant,
      secondary: blueWhaleDarkSecondary,
      secondaryVariant: blueWhaleDarkSecondaryVariant,
      appBarColor: blueWhaleDarkSecondaryVariant,
      error: materialDarkError,
    ),
  );

  /// San Juan blue based FlexSchemeData.
  static const FlexSchemeData sanJuanBlue = FlexSchemeData(
    name: sanJuanBlueName,
    description: sanJuanBlueDescription,
    light: FlexSchemeColor(
      primary: sanJuanBlueLightPrimary,
      primaryVariant: sanJuanBlueLightPrimaryVariant,
      secondary: sanJuanBlueLightSecondary,
      secondaryVariant: sanJuanBlueLightSecondaryVariant,
      appBarColor: sanJuanBlueLightSecondaryVariant,
      error: materialLightError,
    ),
    dark: FlexSchemeColor(
      primary: sanJuanBlueDarkPrimary,
      primaryVariant: sanJuanBlueDarkPrimaryVariant,
      secondary: sanJuanBlueDarkSecondary,
      secondaryVariant: sanJuanBlueDarkSecondaryVariant,
      appBarColor: sanJuanBlueDarkSecondaryVariant,
      error: materialDarkError,
    ),
  );

  /// Rosewood based FlexSchemeData.
  static const FlexSchemeData rosewood = FlexSchemeData(
    name: rosewoodName,
    description: rosewoodDescription,
    light: FlexSchemeColor(
      primary: rosewoodLightPrimary,
      primaryVariant: rosewoodLightPrimaryVariant,
      secondary: rosewoodLightSecondary,
      secondaryVariant: rosewoodLightSecondaryVariant,
      appBarColor: rosewoodLightSecondaryVariant,
      error: materialLightError,
    ),
    dark: FlexSchemeColor(
      primary: rosewoodDarkPrimary,
      primaryVariant: rosewoodDarkPrimaryVariant,
      secondary: rosewoodDarkSecondary,
      secondaryVariant: rosewoodDarkSecondaryVariant,
      appBarColor: rosewoodDarkSecondaryVariant,
      error: materialDarkError,
    ),
  );

  /// Blumine blue based FlexSchemeData.
  static const FlexSchemeData blumineBlue = FlexSchemeData(
    name: blumineBlueName,
    description: blumineBlueDescription,
    light: FlexSchemeColor(
      primary: blumineBlueLightPrimary,
      primaryVariant: blumineBlueLightPrimaryVariant,
      secondary: blumineBlueLightSecondary,
      secondaryVariant: blumineBlueLightSecondaryVariant,
      appBarColor: blumineBlueLightSecondaryVariant,
      error: materialLightError,
    ),
    dark: FlexSchemeColor(
      primary: blumineBlueDarkPrimary,
      primaryVariant: blumineBlueDarkPrimaryVariant,
      secondary: blumineBlueDarkSecondary,
      secondaryVariant: blumineBlueDarkSecondaryVariant,
      appBarColor: blumineBlueDarkSecondaryVariant,
      error: materialDarkError,
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
      primaryVariant: materialLightPrimaryVariant,
      secondary: materialLightSecondary,
      secondaryVariant: materialLightSecondaryVariant,
      appBarColor: materialLightSecondaryVariant,
      error: materialLightError,
    ),
    dark: FlexSchemeColor(
      primary: materialDarkPrimary,
      primaryVariant: materialDarkPrimaryVariant,
      secondary: materialDarkSecondary,
      secondaryVariant: materialDarkSecondaryVariant,
      appBarColor: materialDarkSecondaryVariant,
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
    blumineBlue
  ];
}

/// Immutable data class that holds [name] and [description] string scheme
/// descriptions, [light] and [dark], [FlexSchemeColor] definitions.
///
/// The [FlexSchemeData] bundles together a [FlexSchemeColor] pair suitable
/// for light and dark theme mode, that can used by the FlexColorScheme.light
/// and FlexColorScheme.dark factories to create a FlexColorScheme and
/// corresponding [ThemeData] from it.
///
/// This class can also be used to make a map with [FlexScheme] enum or some
/// other usable lookup value as key, and [FlexSchemeData] as values, that you
/// can then use as input to define multiple theme options for FlexColorScheme
/// based themes.
///
/// A predefined example of a [FlexScheme] and [FlexSchemeData] maps are
/// available in [FlexColor.schemes] and [FlexColor.schemesWithCustom].
@immutable
class FlexSchemeData with Diagnosticable {
  /// Default constructor, used to make an immutable FlexSchemeData object.
  ///
  /// Contains [name], [description] plus [light] and [dark] scheme colors.
  const FlexSchemeData({
    required final this.name,
    required final this.description,
    required final this.light,
    required final this.dark,
  });

  /// A short name for the [FlexSchemeData] based color scheme.
  final String name;

  /// A longer description of the [FlexSchemeData] based color scheme.
  final String description;

  /// The light scheme colors used by this [FlexSchemeData].
  final FlexSchemeColor light;

  /// The dark scheme colors used by this [FlexSchemeData].
  final FlexSchemeColor dark;

  /// Copy the object with one or more provided properties changed.
  FlexSchemeData copyWith({
    final String? name,
    final String? description,
    final FlexSchemeColor? light,
    final FlexSchemeColor? dark,
  }) {
    return FlexSchemeData(
      name: name ?? this.name,
      description: description ?? this.description,
      light: light ?? this.light,
      dark: dark ?? this.dark,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is FlexSchemeData &&
        other.name == name &&
        other.description == description &&
        other.light == light &&
        other.dark == dark;
  }

  @override
  int get hashCode {
    return hashValues(
      name,
      description,
      light,
      dark,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('name', name));
    properties.add(StringProperty('description', description));
    properties.add(DiagnosticsProperty<FlexSchemeColor>('light', light));
    properties.add(DiagnosticsProperty<FlexSchemeColor>('dark', dark));
  }
}

/// Immutable color data class for the main scheme colors used in a
///  FlexColorScheme based color scheme and theming engine.
///
/// The default constructor requires the main color properties. To make a
/// [FlexSchemeColor] from a minimum of just the primary color, use the factory
/// [FlexSchemeColor.from] which only requires the primary color to make
/// a complete color set, but can use the other colors as optional values.
///
/// The [FlexSchemeColor] is a set of main colors, or a palette used to define
/// a color scheme for a theme. See also [FlexSchemeData] that defines
/// a name and description for a pair of matched light and dark
/// [FlexSchemeColor] classes, used to make a color scheme pair, that is
/// then used to make light and dark [ThemeData], typically toggled
/// by [ThemeMode].
@immutable
class FlexSchemeColor with Diagnosticable {
  /// Default constructor, that requires the main four colors.
  ///
  /// Consider using the [FlexSchemeColor.from] factory
  /// constructor for more flexibility and less required values based on
  /// using computed defaults for missing, but required values in a complete
  /// [FlexSchemeColor].
  ///
  /// If you are defining all four required color values, then prefer using this
  /// default constructor as it can be const.
  ///
  /// The appBarColor and error colors are not required, if they
  /// are null, they will be provided by defaults in theme creation later.
  const FlexSchemeColor({
    required final this.primary,
    required final this.primaryVariant,
    required final this.secondary,
    required final this.secondaryVariant,
    final this.appBarColor,
    final this.error,
  });

  /// The color displayed most frequently across your application's screens
  /// and components.
  final Color primary;

  /// Typically a darker version of the primary color.
  ///
  /// In Flutter SDK the [primaryVariant] color is only used by [SnackBar]
  /// button color in dark theme mode as a part of predefined widget behavior.
  /// If you provide a custom [SnackBarThemeData] where you define
  /// [SnackBarThemeData.actionTextColor] to [primary] or [secondary], this
  /// color property becomes a good property to use if you need a custom color
  /// for custom widgets accessible via your application's ThemeData, that is
  /// not used as default color by any built-in widgets.
  final Color primaryVariant;

  /// An accent color that, when used sparingly, calls attention to parts
  /// of your app.
  final Color secondary;

  /// Typically a darker version of the secondary color.
  ///
  /// In Flutter SDK the [secondaryVariant] color is not used by in any
  /// built-in widgets default themes or predefined widget behavior.
  /// It is an excellent property to use if you need a custom color for
  /// custom widgets accessible via your application's ThemeData, that is
  /// not used as default color by any built-in widgets.
  final Color secondaryVariant;

  /// The color of the app bar.
  ///
  /// In light mode an app bar's theme color will in standard Material themes
  /// default to primary color and to surface color in dark mode.
  /// [FlexSchemeColor] allows you to define a color for the app bar theme
  /// that differs from this default.
  final Color? appBarColor;

  /// The color to use for input validation errors, e.g. for
  /// [InputDecoration.errorText].
  final Color? error;

  /// Make a [FlexSchemeColor] from just one primary color or possible also
  /// from a more complete color scheme set. This is a convenience factory that
  /// can create nice toned color schemes based on only the primary color.
  factory FlexSchemeColor.from({
    required Color primary,
    Color? primaryVariant,
    Color? secondary,
    Color? secondaryVariant,
    Color? appBarColor,
    Color? error,
  }) {
    return FlexSchemeColor(
      primary: primary,
      primaryVariant: primaryVariant ?? primary.darken(kDarkenPrimaryVariant),
      secondary: secondary ?? primary.darken(kDarkenSecondary),
      secondaryVariant: secondaryVariant ??
          secondary?.darken(kDarkenSecondaryVariantFromSecondary) ??
          primary.darken(kDarkenSecondaryVariant),
      appBarColor: appBarColor ??
          secondary?.darken(kDarkenSecondaryVariantFromSecondary) ??
          primary.darken(kDarkenSecondaryVariant),
      error: error,
    );
  }

  /// Make effective [FlexSchemeColor] colors using 1 to 4 of the passed in
  /// [colors] based on the [usedColors] property.
  ///
  /// The [usedColors] value corresponds to:
  ///
  /// * 1: Use only [primary] color in [colors], and compute [primaryVariant],
  ///   [secondary] and [secondaryVariant] for returned [FlexSchemeColor].
  /// * 2: Use [primary] and [secondary] in [colors] and compute
  ///   [primaryVariant] and [secondaryVariant] for returned [FlexSchemeColor].
  /// * 3: Use [primary], [secondary] and [primaryVariant] in [colors] and
  ///   compute and [secondaryVariant] for returned [FlexSchemeColor].
  /// * 4: Use all 4 [colors] in passed in FlexColorsScheme as they are.
  ///
  /// If [swapColors] is true, [primary] and [secondary], as well as
  /// [primaryVariant] and [secondaryVariant] are swapped, before being
  /// usage limited by [usedColors].
  static FlexSchemeColor effective(
      final FlexSchemeColor colors, final int usedColors,
      {final bool swapColors = false}) {
    assert(usedColors >= 1 && usedColors <= 4, 'usedColors must be 1 to 4.');

    final FlexSchemeColor effectiveColors = swapColors
        ? colors.copyWith(
            primary: colors.secondary,
            primaryVariant: colors.secondaryVariant,
            secondary: colors.primary,
            secondaryVariant: colors.primaryVariant,
          )
        : colors;

    return effectiveColors.copyWith(
      primary: effectiveColors.primary,
      primaryVariant: usedColors > 2
          ? effectiveColors.primaryVariant
          : effectiveColors.primary.darken(kDarkenPrimaryVariant),
      secondary: usedColors > 1
          ? effectiveColors.secondary
          : effectiveColors.primary.darken(kDarkenSecondary),
      secondaryVariant: usedColors > 3
          ? effectiveColors.secondaryVariant
          : usedColors > 1
              ? effectiveColors.secondary
                  .darken(kDarkenSecondaryVariantFromSecondary)
              : effectiveColors.primary.darken(kDarkenSecondaryVariant),
      appBarColor: colors.appBarColor,
      error: colors.error,
    );
  }

  /// Returns a new [FlexSchemeColor] instance based on this one that is
  /// suitable for dark mode.
  ///
  /// Assumes that the colors this FlexColorScheme is made for are for a light
  /// theme, it does not check that current colors actually are so.
  ///
  /// Calculates less saturated colors of any colors defined for this
  /// [FlexSchemeColor] colors, by blending any none null values with white
  /// using given alpha [whiteBlend] percentage.
  ///
  /// The default [whiteBlend] is 35%, this is normally a suitable value.
  /// For more saturated primary color try 40%, which is also used in the
  /// Material design guide to convert the default red error color for
  /// light mode to dark mode. For primary light mode color with low saturation,
  /// a white blend of 20...30% often also produces nice results.
  FlexSchemeColor toDark([final int whiteBlend = 35]) {
    return FlexSchemeColor.from(
      primary: primary.blend(Colors.white, whiteBlend),
      primaryVariant: primaryVariant.blend(Colors.white, whiteBlend),
      secondary: secondary.blend(Colors.white, whiteBlend),
      secondaryVariant: secondaryVariant.blend(Colors.white, whiteBlend),
      appBarColor: appBarColor?.blend(Colors.white, whiteBlend),
      error: error?.blend(Colors.white, whiteBlend),
    );
  }

  /// Return a copy of this [FlexSchemeColor] that will when used, result in a
  /// theme that use the Material Guide's default [error] color.
  ///
  /// The [error] color is left out when the new object is created. This
  /// results in a copy where the scheme error color is null, this again
  /// will result in that a theme created from the color scheme will use the
  /// Material design guide's default and standard error color.
  ///
  /// This function is useful if we want to create a dark scheme
  /// from a light scheme that already specifies the light scheme's error color,
  /// but we do not want a dark scheme where this light error color is used by
  /// [toDark] to compute an error color for the dark scheme, instead we prefer
  /// to use use the Material default dark mode error color.
  ///
  /// This is demonstrated in example 5) where the [toDark] method is used, but
  /// we do not want use the already defined built-in light schemes' error
  /// colors for the computed dark schemes' error colors.
  ///
  /// Generally if you make your own schemes and are satisfied with the Material
  /// default error color, you can omit defining it for the light scheme
  /// too. In that case it will remain null and get its default value, and
  /// likewise for the dark scheme. Example 5, the three custom schemes
  /// uses this setup.
  ///
  /// If you in example 5 remove the [defaultError] before the [toDark],
  /// you will notice that dark scheme's from the built-in schemes get
  /// a dark scheme where the error color changes when you use the
  /// "Compute dark theme" feature and the white blend "level" slider.
  /// Whereas, the custom example schemes that had no error color specified
  /// for their light scheme, still get the fixed default dark error color,
  /// as when we used this [defaultError] feature.
  FlexSchemeColor get defaultError {
    return FlexSchemeColor(
      primary: primary,
      primaryVariant: primaryVariant,
      secondary: secondary,
      secondaryVariant: secondaryVariant,
      appBarColor: appBarColor,
    );
  }

  /// Copy the object with one or more provided properties changed.
  FlexSchemeColor copyWith({
    final Color? primary,
    final Color? primaryVariant,
    final Color? secondary,
    final Color? secondaryVariant,
    final Color? appBarColor,
    final Color? error,
  }) {
    return FlexSchemeColor(
      primary: primary ?? this.primary,
      primaryVariant: primaryVariant ?? this.primaryVariant,
      secondary: secondary ?? this.secondary,
      secondaryVariant: secondaryVariant ?? this.secondaryVariant,
      appBarColor: appBarColor ?? this.appBarColor,
      error: error ?? this.error,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is FlexSchemeColor &&
        other.primary == primary &&
        other.primaryVariant == primaryVariant &&
        other.secondary == secondary &&
        other.secondaryVariant == secondaryVariant &&
        other.appBarColor == appBarColor &&
        other.error == error;
  }

  @override
  int get hashCode {
    return hashValues(
      primary,
      primaryVariant,
      secondary,
      secondaryVariant,
      appBarColor,
      error.hashCode,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('primary', primary));
    properties.add(ColorProperty('primaryVariant', primaryVariant));
    properties.add(ColorProperty('secondary', secondary));
    properties.add(ColorProperty('secondaryVariant', secondaryVariant));
    properties.add(ColorProperty('appBarColor', appBarColor));
    properties.add(ColorProperty('error', error));
  }
}
