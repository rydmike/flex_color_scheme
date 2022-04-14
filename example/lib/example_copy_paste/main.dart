import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart';

// ignore_for_file: unused_import
// ignore_for_file: lines_longer_than_80_chars

// -----------------------------------------------------------------------------
/// EXAMPLE: COPY-PASTE PLAYGROUND
//
// Use this example to via copy-paste test a theme using code generated by
// the Themes PlayGround found at:
// https://rydmike.com/flexcolorscheme/themesplayground-v5
// -----------------------------------------------------------------------------
void main() => runApp(const DemoApp());

class DemoApp extends StatefulWidget {
  const DemoApp({Key? key}) : super(key: key);

  @override
  State<DemoApp> createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  ThemeMode themeMode = ThemeMode.system;

  // ignore: unused_field
  late final String? _fontFamily = GoogleFonts.notoSans().fontFamily;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // To use this app with the Flutter SDK default theme and default
      // Material Design 2 color scheme, uncomment and use the theme setup below
      // and comment the copy-pasted themes further below,

      // theme: ThemeData.from(colorScheme: const ColorScheme.light()).copyWith(
      //   typography: Typography.material2018(platform: defaultTargetPlatform),
      // ),
      // darkTheme: ThemeData.from(colorScheme: const ColorScheme.dark()).copyWith(
      //   typography: Typography.material2018(platform: defaultTargetPlatform),
      // ),

      // This is where you would put a copy-pasted theme definition from
      // the Themes Playground. There is already one example below, but do
      // try your own and copy-paste new setup code from the
      // Themes Playground app at
      // https://rydmike.com/flexcolorscheme/themesplayground-v5
      // And do remember to comment the default Flutter theme above.

      // theme: FlexThemeData.light(
      //   scheme: FlexScheme.flutterDash,
      //   blendLevel: 18,
      //   appBarOpacity: 0.95,
      //   subThemesData: const FlexSubThemesData(
      //     blendOnLevel: 20,
      //     blendOnColors: false,
      //     unselectedToggleIsColored: true,
      //     fabUseShape: false,
      //     popupMenuOpacity: 0.95,
      //     bottomNavigationBarOpacity: 0.95,
      //     navigationBarOpacity: 0.95,
      //     navigationRailOpacity: 0.95,
      //   ),
      //   visualDensity: FlexColorScheme.comfortablePlatformDensity,
      //   fontFamily: GoogleFonts.notoSans().fontFamily,
      // ),
      // darkTheme: FlexThemeData.dark(
      //   colors: FlexColor.schemes[FlexScheme.flutterDash]!.light.defaultError
      //       .toDark(19, true),
      //   blendLevel: 16,
      //   appBarStyle: FlexAppBarStyle.background,
      //   appBarOpacity: 0.95,
      //   subThemesData: const FlexSubThemesData(
      //     blendOnLevel: 24,
      //     unselectedToggleIsColored: true,
      //     fabUseShape: false,
      //     popupMenuOpacity: 0.95,
      //     bottomNavigationBarOpacity: 0.95,
      //     navigationBarOpacity: 0.95,
      //     navigationRailOpacity: 0.95,
      //     navigationRailLabelType: NavigationRailLabelType.none,
      //   ),
      //   visualDensity: FlexColorScheme.comfortablePlatformDensity,
      //   fontFamily: GoogleFonts.notoSans().fontFamily,
      // ),

      // If you want to use ThemeData.from a ColorScheme based on a ColorScheme
      // from FlexColorScheme, then comment the other two theme setups above and
      // uncomment the theme setup below, and copy-paste the generated
      // ColorScheme code from the Themes Playground app at
      // https://rydmike.com/flexcolorscheme/themesplayground-v5
      // over the example ColorSchemes further below, with copy-pasted schemes.
      // This will give you the same colors as with FlexColorScheme, but no
      // other theme customizations FlexColorScheme does when it creates
      // its ThemeData with FlexColorScheme.toTheme or using its
      // FlexThemeData extensions and opinionated component themes.

      // theme: ThemeData.from(colorScheme: flexSchemeLight).copyWith(
      //   typography: Typography.material2018(platform: defaultTargetPlatform),
      // ),
      // darkTheme: ThemeData.from(colorScheme: flexSchemeDark).copyWith(
      //   typography: Typography.material2018(platform: defaultTargetPlatform),
      // ),

      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff6750a4),
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff6750a4),
          brightness: Brightness.dark,
        ),
      ),
      // theme: FlexThemeData.light(
      //   colorScheme: flexSchemeLight,
      //   keyColors: const FlexKeyColors(),
      //   subThemesData: const FlexSubThemesData(
      //     defaultRadius: 4,
      //     fabUseShape: false,
      //   ),
      //   fontFamily: GoogleFonts.roboto().fontFamily,
      // ),
      // darkTheme: FlexThemeData.dark(
      //   colorScheme: flexSchemeDark,
      //   keyColors: const FlexKeyColors(),
      //   subThemesData: const FlexSubThemesData(
      //     defaultRadius: 4,
      //     fabUseShape: false,
      //   ),
      //   fontFamily: GoogleFonts.roboto().fontFamily,
      // ),
      //
      debugShowCheckedModeBanner: false,
      // title: 'FlexTD(Scheme Seed SubT)',
      title: 'TD.from(scheme.fromSeed)',
      // title: 'Copy Playground Theme',
      // ThemeMode toggle via callback
      themeMode: themeMode,
      home: HomePage(
        themeMode: themeMode,
        onThemeModeChanged: (ThemeMode mode) {
          setState(() {
            themeMode = mode;
          });
        },
      ),
    );
  }
}

final MaterialColor flexSwatch =
    FlexColorScheme.createPrimarySwatch(const Color(0xff6750a4));

const ColorScheme flexSchemeLight = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xff6750a4),
  onPrimary: Color(0xffffffff),
  primaryContainer: Color(0xffeaddff),
  onPrimaryContainer: Color(0xff000000),
  secondary: Color(0xff625b71),
  onSecondary: Color(0xffffffff),
  secondaryContainer: Color(0xffe8def8),
  onSecondaryContainer: Color(0xff000000),
  tertiary: Color(0xff7d5260),
  onTertiary: Color(0xffffffff),
  tertiaryContainer: Color(0xffffd8e4),
  onTertiaryContainer: Color(0xff000000),
  error: Color(0xffb00020),
  onError: Color(0xffffffff),
  errorContainer: Color(0xfffcd8df),
  onErrorContainer: Color(0xff000000),
  outline: Color(0xff4d4d4d),
  background: Color(0xffffffff),
  onBackground: Color(0xff000000),
  surface: Color(0xffffffff),
  onSurface: Color(0xff000000),
  surfaceVariant: Color(0xffffffff),
  onSurfaceVariant: Color(0xff000000),
  inverseSurface: Color(0xff121212),
  onInverseSurface: Color(0xffffffff),
  inversePrimary: Color(0xfff0e9ff),
  shadow: Color(0xff000000),
);

const ColorScheme flexSchemeDark = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xffd0bcff),
  onPrimary: Color(0xff000000),
  primaryContainer: Color(0xff4f378b),
  onPrimaryContainer: Color(0xffffffff),
  secondary: Color(0xffccc2dc),
  onSecondary: Color(0xff000000),
  secondaryContainer: Color(0xff4a4458),
  onSecondaryContainer: Color(0xffffffff),
  tertiary: Color(0xffefb8c8),
  onTertiary: Color(0xff000000),
  tertiaryContainer: Color(0xff633b48),
  onTertiaryContainer: Color(0xffffffff),
  error: Color(0xffcf6679),
  onError: Color(0xff000000),
  errorContainer: Color(0xffb1384e),
  onErrorContainer: Color(0xffffffff),
  outline: Color(0xffb3b3b3),
  background: Color(0xff121212),
  onBackground: Color(0xffffffff),
  surface: Color(0xff121212),
  onSurface: Color(0xffffffff),
  surfaceVariant: Color(0xff121212),
  onSurfaceVariant: Color(0xffffffff),
  inverseSurface: Color(0xffffffff),
  onInverseSurface: Color(0xff000000),
  inversePrimary: Color(0xff635b70),
  shadow: Color(0xff000000),
);




// // Copy-paste the code for a light ColorScheme you want from the
// // Themes Playground here and try it with plain vanilla
// // ThemeData.from(colorScheme: flexSchemeLight) light by uncommenting
// // that section further above.
// const ColorScheme flexSchemeLight = ColorScheme(
//   brightness: Brightness.light,
//   primary: Color(0xff00497c),
//   onPrimary: Color(0xffe8f1ff),
//   primaryContainer: Color(0xff9acaff),
//   onPrimaryContainer: Color(0xff001d36),
//   secondary: Color(0xff4f599d),
//   onSecondary: Color(0xffefefff),
//   secondaryContainer: Color(0xffbac3ff),
//   onSecondaryContainer: Color(0xff041157),
//   tertiary: Color(0xff6c5b51),
//   onTertiary: Color(0xffffede2),
//   tertiaryContainer: Color(0xffd8c2b6),
//   onTertiaryContainer: Color(0xff251911),
//   error: Color(0xffba1b1b),
//   onError: Color(0xffffede9),
//   errorContainer: Color(0xffffb4a9),
//   onErrorContainer: Color(0xff410001),
//   outline: Color(0xff6b7889),
//   background: Color(0xffcdd6e3),
//   onBackground: Color(0xff171c22),
//   surface: Color(0xffe3eaf5),
//   onSurface: Color(0xff171c22),
//   surfaceVariant: Color(0xffb2c3d7),
//   onSurfaceVariant: Color(0xff243140),
//   inverseSurface: Color(0xff3f474f),
//   onInverseSurface: Color(0xffedf1fa),
//   inversePrimary: Color(0xff9acaff),
//   shadow: Color(0xff000000),
// );

// // Copy-paste the code for a dark ColorScheme you want from the
// // Themes Playground here and try it with plain vanilla
// // ThemeData.from(colorScheme: flexSchemeLight) light by uncommenting
// // that section further above.
// //
// // Normally it would be the matching pair to the light one, but it does not
// // have to be. Same applies when you use FlexColorScheme to make your
// // ThemeData.
// const ColorScheme flexSchemeDark = ColorScheme(
//   brightness: Brightness.dark,
//   primary: Color(0xff9acaff),
//   onPrimary: Color(0xff001d36),
//   primaryContainer: Color(0xff0061a2),
//   onPrimaryContainer: Color(0xffcfe4ff),
//   secondary: Color(0xffbac3ff),
//   onSecondary: Color(0xff041157),
//   secondaryContainer: Color(0xff4f599d),
//   onSecondaryContainer: Color(0xffdde0ff),
//   tertiary: Color(0xffd8c2b6),
//   onTertiary: Color(0xff251911),
//   tertiaryContainer: Color(0xff6c5b51),
//   onTertiaryContainer: Color(0xfff5ded1),
//   error: Color(0xffffb4a9),
//   onError: Color(0xff680003),
//   errorContainer: Color(0xff930006),
//   onErrorContainer: Color(0xffffdad4),
//   outline: Color(0xff8492a4),
//   background: Color(0xff323a42),
//   onBackground: Color(0xffdfe3ec),
//   surface: Color(0xff1a2028),
//   onSurface: Color(0xffc3c7cf),
//   surfaceVariant: Color(0xff536173),
//   onSurfaceVariant: Color(0xffd6e4f7),
//   inverseSurface: Color(0xffeaeffa),
//   onInverseSurface: Color(0xff42474e),
//   inversePrimary: Color(0xff0061a2),
//   shadow: Color(0xff000000),
// );
