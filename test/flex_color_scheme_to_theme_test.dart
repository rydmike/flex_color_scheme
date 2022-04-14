import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  //****************************************************************************
  // FlexColorScheme.toTheme unit tests.
  //
  // The ".toTheme" is the core function of `FlexColorScheme` to return a
  // ThemeData object from the defined color scheme.
  // Below we test that its key properties as as expected.
  //****************************************************************************
  group('FCS7: WITH FlexColorScheme.toTheme ', () {
    debugDefaultTargetPlatformOverride = null;
    TestWidgetsFlutterBinding.ensureInitialized();

    test(
        'FCS7.00-Default: GIVEN FlexColorScheme.light() made with default '
        'EXPECT its ThemeData to be equal to one made with light factory with '
        'only primary color. v5.0.0 test case', () {
      expect(
          FlexColorScheme.light()
              .toScheme
              .toString(minLevel: DiagnosticLevel.fine),
          equalsIgnoringHashCodes(FlexColorScheme.light(
            primary: FlexColor.materialLightPrimary,
          ).toScheme.toString(minLevel: DiagnosticLevel.fine)));
    });

    test(
        'FCS7.01-Default-Light: GIVEN FlexColorScheme.light() made with light '
        'brightness '
        'EXPECT its ThemeData to be equal to one made with light factory '
        'only primary color. v5.0.0 test case', () {
      expect(
          FlexColorScheme.light().toTheme,
          equals(FlexColorScheme.light(
            primary: FlexColor.materialLightPrimary,
          ).toTheme));
    });

    test(
        'FCS7.02-Default-Dark: GIVEN FlexColorScheme.dark() '
        'EXPECT its ThemeData to be equal to one made with dark factory '
        'only primary color. v5.0.0 test case', () {
      expect(
          FlexColorScheme.dark().toTheme,
          equals(FlexColorScheme.dark(
            primary: FlexColor.materialDarkPrimary,
          ).toTheme));
    });

    const ColorScheme schemeLight = ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff6200ee),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffbb86fc),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xff03dac6),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xFFCEFAF8),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xff018786),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffa4f1ef),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffb00020),
      onError: Color(0xffffffff),
      errorContainer: Color(0xfffcd8df),
      onErrorContainer: Color(0xff000000),
      background: Color(0xffffffff),
      onBackground: Color(0xff000000),
      surface: Color(0xffffffff),
      onSurface: Color(0xff000000),
      surfaceVariant: Color(0xffffffff),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff4d4d4d),
      shadow: Color(0xff000000),
      inverseSurface: Color(0xff121212),
      onInverseSurface: Color(0xffffffff),
      inversePrimary: Color(0xffda99ff),
    );

    test(
        'FCS7.03-Raw-scheme-light: GIVEN FlexColorScheme() made with '
        'raw light color scheme '
        'EXPECT its ColorScheme to be equal to one made with light '
        'factory toString compare. v4.2.0 test case.', () {
      expect(
        FlexColorScheme.light()
            .toScheme
            .toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          const FlexColorScheme(
            colorScheme: schemeLight,
          ).toScheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });

    test(
        'FCS7.04-Raw-scheme-light: GIVEN FlexColorScheme() made with '
        'raw light color scheme '
        'EXPECT its ThemeData to be equal to one made with light factory. '
        ' v4.2.0 test case.', () {
      expect(
          const FlexColorScheme(
            colorScheme: schemeLight,
          ).toTheme,
          equals(FlexColorScheme.light().toTheme));
    });
    test(
        'FCS7.05-Default-scheme-light-STING: GIVEN FlexColorScheme() made with '
        'default light color scheme '
        'EXPECT its STRING ThemeData to be equal to one made with light '
        'factory and ColorScheme.light v4.2.0 test case.', () {
      expect(
          const FlexColorScheme(
            colorScheme: ColorScheme.light(inverseSurface: Color(0xff121212)),
          ).toScheme.toString(minLevel: DiagnosticLevel.fine),
          equalsIgnoringHashCodes(FlexColorScheme.light(
            colorScheme: const ColorScheme.light(),
          ).toScheme.toString(minLevel: DiagnosticLevel.fine)));
    });
    test(
        'FCS7.05-Default-scheme-light: GIVEN FlexColorScheme() made with '
        'default light color scheme '
        'EXPECT its ThemeData to be equal to one made with light factory '
        'and ColorScheme.light v4.2.0 test case.', () {
      expect(
          const FlexColorScheme(
            colorScheme: ColorScheme.light(inverseSurface: Color(0xff121212)),
          ).toTheme,
          equals(FlexColorScheme.light(
            colorScheme: const ColorScheme.light(),
          ).toTheme));
    });
    const ColorScheme schemeDark = ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffbb86fc),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff6200ee),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff03dac6),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xff005047),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff03dac6),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xff003e3e),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xffcf6679),
      onError: Color(0xff000000),
      errorContainer: Color(0xffb1384e),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xff121212),
      onBackground: Color(0xffffffff),
      surface: Color(0xff121212),
      onSurface: Color(0xffffffff),
      surfaceVariant: Color(0xff121212),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffb3b3b3),
      shadow: Color(0xff000000),
      inverseSurface: Color(0xffffffff),
      onInverseSurface: Color(0xff000000),
      inversePrimary: Color(0xff5a4570),
    );
    test(
        'FCS7.06s-Raw-scheme-dark: GIVEN FlexColorScheme() made with '
        'default dark color scheme '
        'EXPECT its ColorScheme to be equal to one made with dark factory '
        'correcting on error. v4.2.0 test case', () {
      expect(
        FlexColorScheme.dark()
            .toScheme
            .toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          const FlexColorScheme(
            colorScheme: schemeDark,
          ).toScheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });

    test(
        'FCS7.06t-Raw-scheme-dark: GIVEN FlexColorScheme() made with '
        'default dark color scheme '
        'EXPECT its ThemeData to be equal to one made with dark factory '
        'correcting on error. v4.2.0 test case', () {
      expect(
        const FlexColorScheme(colorScheme: schemeDark).toTheme,
        equals(FlexColorScheme.dark().toTheme),
      );
    });

    test(
        'FCS7.07-Default-scheme-dark: GIVEN FlexColorScheme() made with '
        'default dark color scheme '
        'EXPECT its ThemeData to be equal to one made with dark factory '
        'and ColorScheme.dark v4.2.0 test case.', () {
      expect(
          const FlexColorScheme(
            colorScheme: ColorScheme.dark(),
          ).toTheme,
          equals(FlexColorScheme.dark(
            colorScheme: const ColorScheme.dark(),
          ).toTheme));
    });

    const FlexColorScheme rawHcLight = FlexColorScheme(
      colorScheme: ColorScheme(
        errorContainer: Color(0xfff1d8d8),
        onErrorContainer: Color(0xff000000),
        surfaceVariant: Color(0xffffffff),
        onSurfaceVariant: Color(0xff000000),
        outline: Color(0xff4d4d4d),
        shadow: Color(0xff000000),
        inverseSurface: Color(0xff121212),
        onInverseSurface: Color(0xffffffff),
        inversePrimary: Color(0xff9999ff),
        brightness: Brightness.light,
        primary: Color(0xff0000ba),
        onPrimary: Color(0xffffffff),
        primaryContainer: Color(0xffb6b6ff),
        onPrimaryContainer: Color(0xff000000),
        secondary: Color(0xff66fff9),
        onSecondary: Color(0xff000000),
        secondaryContainer: Color(0xFFC8F9F7),
        onSecondaryContainer: Color(0xff000000),
        tertiary: Color(0xff018786),
        onTertiary: Color(0xffffffff),
        tertiaryContainer: Color(0xffb3f1f0),
        onTertiaryContainer: Color(0xff000000),
        error: Color(0xff790000),
        onError: Color(0xffffffff),
        background: Color(0xffffffff),
        onBackground: Color(0xff000000),
        surface: Color(0xffffffff),
        onSurface: Color(0xff000000),
      ),
      brightness: Brightness.light,
      primary: Color(0xff0000ba),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffb6b6ff),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xff66fff9),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xFFC8F9F7),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xff018786),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffb3f1f0),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xff790000),
      onError: Color(0xffffffff),
      background: Color(0xffffffff),
      onBackground: Color(0xff000000),
      surface: Color(0xffffffff),
      onSurface: Color(0xff000000),
    );

    test(
        'FCS7.08-Scheme-hc-light: GIVEN raw FlexColorScheme() made with '
        'overrides '
        'EXPECT its ColorScheme to be equal to one made '
        'FlexColorScheme.light(scheme: FlexScheme.materialHc)', () {
      expect(
        rawHcLight.toScheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexColorScheme.light(scheme: FlexScheme.materialHc)
              .toScheme
              .toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });

    test(
        'FCS7.09-Scheme-hc-light: GIVEN raw FlexColorScheme() made with '
        'overrides '
        'EXPECT its ThemeData to be equal to one made '
        'FlexColorScheme.light(scheme: FlexScheme.materialHc)', () {
      expect(
        rawHcLight.toTheme,
        equals(FlexColorScheme.light(scheme: FlexScheme.materialHc).toTheme),
      );
    });

    const ColorScheme hcDarkScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffefb7ff),
      onPrimary: Colors.black,
      primaryContainer: Color(0xffbe9eff),
      onPrimaryContainer: Colors.black,
      secondary: Color(0xff66fff9),
      onSecondary: Colors.black,
      secondaryContainer: Color(0xff66fff9),
      onSecondaryContainer: Colors.black,
      error: Color(0xff9b374d),
      onError: Colors.black,
      background: Color(0xff121212),
      onBackground: Colors.white,
      surface: Color(0xff121212),
      onSurface: Colors.white,
      // Pre-inverted for light to be correct as is.
      surfaceVariant: Colors.white,
      inverseSurface: Color(0xff121212),
      onInverseSurface: Colors.white,
    );

    final ColorScheme overrideScheme = hcDarkScheme.copyWith(
      brightness: Brightness.light,
      primary: const Color(0xff0000ba),
      onPrimary: Colors.white,
      primaryContainer: const Color(0xff000088),
      onPrimaryContainer: Colors.white,
      secondary: const Color(0xff66fff9),
      onSecondary: Colors.black,
      secondaryContainer: const Color(0xff018786),
      onSecondaryContainer: Colors.white,
      surface: Colors.white,
      background: Colors.white,
      error: const Color(0xff790000),
      onSurface: Colors.black,
      onBackground: Colors.black,
      onError: Colors.white,
    );

    test(
        'FCS7.10-Scheme-hc-light: GIVEN FlexColorScheme() made with '
        'override colors despite conflicting colorscheme given '
        'EXPECT its ThemeData to be equal to one made with light factory '
        'and same sum color scheme. v4.2.0 test case.', () {
      expect(
          const FlexColorScheme(
            colorScheme: hcDarkScheme,
            brightness: Brightness.light,
            primary: Color(0xff0000ba),
            onPrimary: Colors.white,
            primaryContainer: Color(0xff000088),
            onPrimaryContainer: Colors.white,
            secondary: Color(0xff66fff9),
            onSecondary: Colors.black,
            secondaryContainer: Color(0xff018786),
            onSecondaryContainer: Colors.white,
            error: Color(0xff790000),
            onError: Colors.white,
            surface: Colors.white,
            onSurface: Colors.black,
            background: Colors.white,
            onBackground: Colors.black,
          ).toScheme.toString(minLevel: DiagnosticLevel.fine),
          equalsIgnoringHashCodes(FlexColorScheme.light(
            colorScheme: overrideScheme,
          ).toScheme.toString(minLevel: DiagnosticLevel.fine)));

      expect(
          const FlexColorScheme(
            colorScheme: hcDarkScheme,
            brightness: Brightness.light,
            primary: Color(0xff0000ba),
            onPrimary: Colors.white,
            primaryContainer: Color(0xff000088),
            onPrimaryContainer: Colors.white,
            secondary: Color(0xff66fff9),
            onSecondary: Colors.black,
            secondaryContainer: Color(0xff018786),
            onSecondaryContainer: Colors.white,
            error: Color(0xff790000),
            onError: Colors.white,
            surface: Colors.white,
            onSurface: Colors.black,
            background: Colors.white,
            onBackground: Colors.black,
          ).toTheme,
          equals(FlexColorScheme.light(
            colorScheme: overrideScheme,
          ).toTheme));
    });

    const ColorScheme hcDarkWithLight = ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff0000ba),
      onPrimary: Color(0xffaaaaaa),
      primaryContainer: Color(0xffaaaaaa),
      onPrimaryContainer: Color(0xffaaaaaa),
      secondary: Color(0xff66fff9),
      onSecondary: Color(0xffaaaaaa),
      tertiary: Color(0xffaaaaaa),
      onTertiary: Color(0xffaaaaaa),
      error: Color(0xffaaaaaa),
      onError: Color(0xffaaaaaa),
      background: Color(0xffaaaaaa),
      onBackground: Color(0xffaaaaaa),
      surface: Color(0xffaaaaaa),
      onSurface: Color(0xffaaaaaa),
      // Light colors that will be created by light scheme defaults
      // but cannot be overridden via passed in properties to raw constructor.
      errorContainer: Color(0xfff1d8d8),
      onErrorContainer: Color(0xff000000),
      surfaceVariant: Color(0xffffffff),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff4d4d4d),
      shadow: Color(0xff000000),
      inverseSurface: Color(0xff121212),
      onInverseSurface: Color(0xffffffff),
      inversePrimary: Color(0xff9999ff),
    );

    const FlexColorScheme hcLightWithLight = FlexColorScheme(
      colorScheme: hcDarkWithLight,
      brightness: Brightness.light,
      primary: Color(0xff0000ba),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffb6b6ff),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xff66fff9),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xFFC8F9F7),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xff018786),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffb3f1f0),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xff790000),
      onError: Color(0xffffffff),
      background: Color(0xffffffff),
      onBackground: Color(0xff000000),
      surface: Color(0xffffffff),
      onSurface: Color(0xff000000),
    );

    final FlexColorScheme hcLight = FlexColorScheme.light(
      scheme: FlexScheme.materialHc,
    );

    test(
        'FCS7.11-Scheme-hc-light.toString: GIVEN FlexColorScheme() made with '
        'override colors despite conflicting colorscheme given '
        'EXPECT its ColorScheme string to be equal to one made '
        'FlexColorScheme.light(scheme: FlexScheme.materialHc) '
        'v4.2.0 test case.', () {
      expect(
          hcLightWithLight.toScheme.toString(minLevel: DiagnosticLevel.fine),
          equalsIgnoringHashCodes(
              hcLight.toScheme.toString(minLevel: DiagnosticLevel.fine)));
    });

    test(
        'FCS7.12-Scheme-hc-light: GIVEN FlexColorScheme() made with '
        'override colors despite conflicting colorscheme given '
        'EXPECT its ColorScheme to be equal to one made '
        'FlexColorScheme.light(scheme: FlexScheme.materialHc) '
        'v4.2.0 test case.', () {
      expect(hcLightWithLight.toScheme, equals(hcLight.toScheme));
    });

    test(
        'FCS7.13-Theme-hc-light: GIVEN FlexColorScheme() made with '
        'override colors despite conflicting colorscheme given '
        'EXPECT its ThemeData to be equal to one made '
        'FlexColorScheme.light(scheme: FlexScheme.materialHc) '
        'v4.2.0 test case.', () {
      expect(hcLightWithLight.toTheme, equals(hcLight.toTheme));
    });

    // Dark default color scheme
    const FlexColorScheme darkDefault = FlexColorScheme(
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xffefb7ff),
        onPrimary: Colors.black,
        primaryContainer: Color(0xffbe9eff),
        onPrimaryContainer: Colors.black,
        secondary: Color(0xff66fff9),
        onSecondary: Colors.black,
        secondaryContainer: Color(0xff66fff9),
        onSecondaryContainer: Colors.black,
        error: Color(0xff9b374d),
        onError: Colors.black,
        errorContainer: Color(0xff632331),
        onErrorContainer: Color(0xffffffff),
        background: Color(0xff121212),
        onBackground: Colors.white,
        surface: Color(0xff121212),
        onSurface: Colors.white,
        onInverseSurface: Color(0xff000000),
        inversePrimary: Color(0xff6f5970),
        outline: Color(0xffb3b3b3),
        shadow: Color(0xff000000),
      ),
    );

    final FlexColorScheme darkFactoryDefault = FlexColorScheme.dark(
      primary: const Color(0xffefb7ff),
      onPrimary: Colors.black,
      primaryContainer: const Color(0xffbe9eff),
      onPrimaryContainer: Colors.black,
      secondary: const Color(0xff66fff9),
      onSecondary: Colors.black,
      secondaryContainer: const Color(0xff66fff9),
      onSecondaryContainer: Colors.black,
      tertiary: const Color(0xff66fff9),
      onTertiary: Colors.black,
      tertiaryContainer: const Color(0xff66fff9),
      onTertiaryContainer: Colors.black,
      error: const Color(0xff9b374d),
      onError: Colors.black,
      background: const Color(0xff121212),
      onBackground: Colors.white,
      surface: const Color(0xff121212),
      onSurface: Colors.white,
    );

    test(
        'FCS7.14a-Scheme-hc-dark: GIVEN FlexColorScheme() made with '
        'raw high contrast dark color scheme '
        'EXPECT its ColorScheme string to be equal to one made with dark '
        'factory and minimal color inputs.', () {
      expect(
          darkDefault.toScheme.toString(minLevel: DiagnosticLevel.fine),
          equalsIgnoringHashCodes(
            darkFactoryDefault.toScheme
                .toString(minLevel: DiagnosticLevel.fine),
          ));
    });

    test(
        'FCS7.14b-Theme-hc-dark: GIVEN FlexColorScheme() made with '
        'raw high contrast dark color scheme '
        'EXPECT its ThemeData to be equal to one made with dark factory '
        'and minimal color inputs.', () {
      expect(
        darkDefault.toTheme,
        equals(darkFactoryDefault.toTheme),
      );
    });

    // Raw High contrast dark scheme
    const FlexColorScheme hcDarkDefault = FlexColorScheme(
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xffefb7ff),
        onPrimary: Colors.black,
        primaryContainer: Color(0xff8a61db),
        onPrimaryContainer: Colors.white,
        secondary: Color(0xff66fff9),
        onSecondary: Colors.black,
        secondaryContainer: Color(0xFF00504D),
        onSecondaryContainer: Colors.white,
        tertiary: Color(0xff66fff9),
        onTertiary: Colors.black,
        tertiaryContainer: Color(0xFF043232),
        onTertiaryContainer: Colors.white,
        error: Color(0xff9b374d),
        onError: Colors.black,
        errorContainer: Color(0xff632331),
        onErrorContainer: Colors.white,
        surface: Color(0xff121212),
        onSurface: Colors.white,
        background: Color(0xff121212),
        onBackground: Colors.white,
        outline: Color(0xffb3b3b3),
        shadow: Color(0xff000000),
        inverseSurface: Color(0xffffffff),
        onInverseSurface: Color(0xff000000),
        inversePrimary: Color(0xff6f5970),
      ),
    );

    // Dark factory based high contrast dark scheme
    final FlexColorScheme hcDarkFactoryDefault =
        FlexColorScheme.dark(scheme: FlexScheme.materialHc);

    test(
        'FCS7.15a-Scheme-hc-dark: GIVEN Raw FlexColorScheme() made with '
        'given high contrast colors '
        'EXPECT its Scheme string to be equal to one made with dark '
        'factory and minimal colors inputs.', () {
      expect(
        hcDarkDefault.toScheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          hcDarkFactoryDefault.toScheme
              .toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });

    test(
        'FCS7.15b-Scheme-hc-dark: GIVEN Raw FlexColorScheme() made with '
        'given high contrast colors '
        'EXPECT its toScheme to be equal to one made with dark '
        'factory and minimal color inputs.', () {
      expect(
        hcDarkDefault.toScheme,
        equals(hcDarkFactoryDefault.toScheme),
      );
    });

    test(
        'FCS7.15b-Theme-hc-dark: GIVEN GIVEN Raw FlexColorScheme() made with '
        'given high contrast colors '
        'EXPECT its ThemeData to be equal to one made with dark factory '
        'and minimal color inputs.', () {
      expect(
        hcDarkDefault.toTheme,
        equals(hcDarkFactoryDefault.toTheme),
      );
    });

    // A color scheme that, that we will use as "wrong" input
    // to override and expect correct result via the overrides.
    const ColorScheme hcLightWithDark = ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xffefb7ff),
      onPrimary: Color(0xffaaaaaa),
      primaryContainer: Color(0xffaaaaaa),
      onPrimaryContainer: Color(0xffaaaaaa),
      secondary: Color(0xff66fff9),
      onSecondary: Color(0xffaaaaaa),
      tertiary: Color(0xffaaaaaa),
      onTertiary: Color(0xffaaaaaa),
      error: Color(0xffaaaaaa),
      onError: Color(0xffaaaaaa),
      background: Color(0xffaaaaaa),
      onBackground: Color(0xffaaaaaa),
      surface: Color(0xffaaaaaa),
      onSurface: Color(0xffaaaaaa),
      // Dark colors that will be created by dark scheme defaults
      // but cannot be overridden via passed in properties to raw constructor.
      errorContainer: Color(0xff632331),
      onErrorContainer: Colors.white,
      surfaceVariant: Color(0xff121212),
      onSurfaceVariant: Colors.white,
      outline: Color(0xffb3b3b3),
      shadow: Color(0xff000000),
      inverseSurface: Color(0xffffffff),
      onInverseSurface: Color(0xff000000),
      inversePrimary: Color(0xff6f5970),
    );

    const FlexColorScheme rawHcFCS = FlexColorScheme(
      colorScheme: hcLightWithDark,
      brightness: Brightness.dark,
      primary: Color(0xffefb7ff),
      onPrimary: Colors.black,
      primaryContainer: Color(0xff8a61db),
      onPrimaryContainer: Colors.white,
      secondary: Color(0xff66fff9),
      onSecondary: Colors.black,
      secondaryContainer: Color(0xFF00504D),
      onSecondaryContainer: Colors.white,
      tertiary: Color(0xff66fff9),
      onTertiary: Colors.black,
      tertiaryContainer: Color(0xFF043232),
      onTertiaryContainer: Colors.white,
      error: Color(0xff9b374d),
      onError: Colors.black,
      surface: Color(0xff121212),
      onSurface: Colors.white,
      background: Color(0xff121212),
      onBackground: Colors.white,
    );

    test(
        'FCS7.16-toScheme-string-hc-dark: GIVEN FlexColorScheme() made with '
        'override colors despite conflicting colorscheme given '
        'EXPECT its toScheme to be equal to one made with dark factory '
        'and minimal colors', () {
      expect(
          rawHcFCS.toScheme.toString(minLevel: DiagnosticLevel.fine),
          equalsIgnoringHashCodes(
            hcDarkFactoryDefault.toScheme
                .toString(minLevel: DiagnosticLevel.fine),
          ));
    });

    test(
        'FCS7.17-toScheme-hc-dark: GIVEN FlexColorScheme() made with '
        'override colors despite conflicting colorscheme given '
        'EXPECT its toScheme to be equal to one made with dark factory '
        'and minimal colors', () {
      expect(
        rawHcFCS.toScheme,
        equals(hcDarkFactoryDefault.toScheme),
      );
    });

    test(
        'FCS7.18-toTheme-hc-dark: GIVEN FlexColorScheme() made with '
        'override colors despite conflicting colorscheme given '
        'EXPECT its toScheme to be equal to one made with dark factory '
        'and minimal colors', () {
      expect(rawHcFCS.toTheme, equals(hcDarkFactoryDefault.toTheme));
    });

    test(
        'FCS7.19-Scheme-hc-dark: GIVEN FlexColorScheme() made with '
        'raw high contrast dark color scheme '
        'EXPECT its ColorScheme string to be equal to one made with '
        'dark factory and color overrides. v4.2.0 test case.', () {
      expect(
        const FlexColorScheme(
          colorScheme: ColorScheme(
            brightness: Brightness.dark,
            primary: Color(0xffefb7ff),
            primaryContainer: Color(0xffbe9eff),
            secondary: Color(0xff66fff9),
            secondaryContainer: Color(0xff66fff9),
            tertiary: Color(0xff03dac6),
            tertiaryContainer: Color(0xff03dac6),
            surface: Color(0xff121212),
            background: Color(0xff121212),
            error: Color(0xff9b374d),
            errorContainer: Color(0xff632331),
            onPrimary: Colors.black,
            onPrimaryContainer: Colors.black,
            onSecondary: Colors.black,
            onSecondaryContainer: Colors.black,
            onSurface: Colors.white,
            onBackground: Colors.white,
            onError: Colors.white,
            onErrorContainer: Color(0xffffffff),
            outline: Color(0xffb3b3b3),
            shadow: Color(0xff000000),
            onInverseSurface: Color(0xff000000),
            inversePrimary: Color(0xff6f5970),
          ),
        ).toScheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexColorScheme.dark(
            primary: const Color(0xffefb7ff),
            primaryContainer: const Color(0xffbe9eff),
            secondary: const Color(0xff66fff9),
            secondaryContainer: const Color(0xff66fff9),
            tertiary: const Color(0xff03dac6),
            tertiaryContainer: const Color(0xff03dac6),
            surface: const Color(0xff121212),
            background: const Color(0xff121212),
            error: const Color(0xff9b374d),
            onPrimary: Colors.black,
            onPrimaryContainer: Colors.black,
            onSecondary: Colors.black,
            onSecondaryContainer: Colors.black,
            onSurface: Colors.white,
            onBackground: Colors.white,
            onError: Colors.white,
          ).toScheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });

    test(
        'FCS7.19-ThemeData-hc-dark: GIVEN FlexColorScheme() made with '
        'raw high contrast dark color scheme '
        'EXPECT its ThemeData string to be equal to one made with '
        'dark factory and color overrides. v4.2.0 test case.', () {
      expect(
        const FlexColorScheme(
          colorScheme: ColorScheme(
            brightness: Brightness.dark,
            primary: Color(0xffefb7ff),
            primaryContainer: Color(0xffbe9eff),
            secondary: Color(0xff66fff9),
            secondaryContainer: Color(0xff66fff9),
            tertiary: Color(0xff03dac6),
            tertiaryContainer: Color(0xff03dac6),
            surface: Color(0xff121212),
            background: Color(0xff121212),
            error: Color(0xff9b374d),
            errorContainer: Color(0xff632331),
            onPrimary: Colors.black,
            onPrimaryContainer: Colors.black,
            onSecondary: Colors.black,
            onSecondaryContainer: Colors.black,
            onSurface: Colors.white,
            onBackground: Colors.white,
            onError: Colors.white,
            onErrorContainer: Color(0xffffffff),
            outline: Color(0xffb3b3b3),
            shadow: Color(0xff000000),
            onInverseSurface: Color(0xff000000),
            inversePrimary: Color(0xff6f5970),
          ),
        ).toTheme,
        equals(
          FlexColorScheme.dark(
            primary: const Color(0xffefb7ff),
            primaryContainer: const Color(0xffbe9eff),
            secondary: const Color(0xff66fff9),
            secondaryContainer: const Color(0xff66fff9),
            tertiary: const Color(0xff03dac6),
            tertiaryContainer: const Color(0xff03dac6),
            surface: const Color(0xff121212),
            background: const Color(0xff121212),
            error: const Color(0xff9b374d),
            onPrimary: Colors.black,
            onPrimaryContainer: Colors.black,
            onSecondary: Colors.black,
            onSecondaryContainer: Colors.black,
            onSurface: Colors.white,
            onBackground: Colors.white,
            onError: Colors.white,
          ).toTheme,
        ),
      );
    });

    test(
        'FCS7.20RawL String: GIVEN FlexColorScheme() made with min required '
        'light params that equals default Material light scheme '
        'EXPECT its ColorScheme to be equal to one made with light scheme with '
        'no parameters.', () {
      expect(
          const FlexColorScheme(
            brightness: Brightness.light,
            primary: FlexColor.materialLightPrimary,
            primaryContainer: FlexColor.materialLightPrimaryContainer,
            secondary: FlexColor.materialLightSecondary,
            secondaryContainer: FlexColor.materialLightSecondaryContainer,
            tertiary: FlexColor.materialLightTertiary,
            tertiaryContainer: FlexColor.materialLightTertiaryContainer,
          ).toScheme.toString(minLevel: DiagnosticLevel.fine),
          equalsIgnoringHashCodes(FlexColorScheme.light()
              .toScheme
              .toString(minLevel: DiagnosticLevel.fine)));
    });

    test(
        'FCS7.21RawL: GIVEN FlexColorScheme() made with min required light '
        'params that equals default Material light scheme '
        'EXPECT its ThemeData to be equal to one made with light scheme with '
        'no parameters.', () {
      expect(
          const FlexColorScheme(
            brightness: Brightness.light,
            primary: FlexColor.materialLightPrimary,
            primaryContainer: FlexColor.materialLightPrimaryContainer,
            secondary: FlexColor.materialLightSecondary,
            secondaryContainer: FlexColor.materialLightSecondaryContainer,
            tertiary: FlexColor.materialLightTertiary,
            tertiaryContainer: FlexColor.materialLightTertiaryContainer,
          ).toTheme,
          equals(FlexColorScheme.light().toTheme));
    });
    test(
        'FCS7.22DefL: GIVEN FlexColorScheme.light made with no parameters '
        'EXPECT its ThemeData to be equal to one made with light scheme.', () {
      expect(
        FlexColorScheme.light().toTheme,
        equals(FlexColorScheme.light(
          colors: FlexColor.schemes[FlexScheme.material]!.light,
        ).toTheme),
      );
    });
    test(
        'FCS7.23L: GIVEN two FlexColorScheme.light made with identical '
        'parameters EXPECT their ThemeData to be equal.', () {
      expect(
        FlexColorScheme.light(
          colors: FlexColor.schemes[FlexScheme.material]!.light,
        ).toTheme,
        equals(FlexColorScheme.light(
          colors: FlexColor.schemes[FlexScheme.material]!.light,
        ).toTheme),
      );
    });
    test(
        'FCS7.24L: GIVEN a FlexColorScheme.light made with no '
        'parameters EXPECT ThemeData to be equal to one made with '
        'scheme FlexScheme.material.', () {
      expect(
        FlexColorScheme.light().toTheme,
        equals(FlexColorScheme.light(scheme: FlexScheme.material).toTheme),
      );
    });
    test(
        'FCS7.25L: GIVEN a FlexColorScheme.light made with colors '
        'material EXPECT ThemeData to be equal to one made with '
        'scheme FlexScheme.material.', () {
      expect(
        FlexColorScheme.light(
          colors: FlexColor.schemes[FlexScheme.material]!.light,
        ).toTheme,
        equals(FlexColorScheme.light(scheme: FlexScheme.material).toTheme),
      );
    });
    test(
        'FCS7.26L: GIVEN a FlexColorScheme.light made with scheme '
        'material EXPECT ThemeData to be equal to one made with '
        'no params.', () {
      expect(
        FlexColorScheme.light(
          colors: FlexColor.schemes[FlexScheme.material]!.light,
        ).toTheme,
        equals(FlexColorScheme.light().toTheme),
      );
    });

    test(
        'FCS7.27RawD: GIVEN FlexColorScheme() made with min required dark '
        'params that equals default Material dark scheme '
        'EXPECT its ThemeData to be equal to one made with dark scheme with '
        'no parameters.', () {
      expect(
          FlexColorScheme.dark(
            colors: const FlexSchemeColor(
              primary: FlexColor.materialDarkPrimary,
              primaryContainer: FlexColor.materialDarkPrimaryContainer,
              secondary: FlexColor.materialDarkSecondary,
              secondaryContainer: FlexColor.materialDarkSecondaryContainer,
              tertiary: FlexColor.materialDarkTertiary,
              tertiaryContainer: FlexColor.materialDarkTertiaryContainer,
            ),
          ).toTheme,
          equals(FlexColorScheme.dark().toTheme));
    });

    // themeDark = Default material dark scheme colors.
    test(
        'FCS7.28SwapL: GIVEN FlexColorScheme.light(swapColors: true) EXPECT it '
        'to be equal to one made with light scheme colors swapped ', () {
      expect(
        FlexColorScheme.light(
          swapColors: true,
        ).toTheme,
        equals(FlexColorScheme.light(
          colors: const FlexSchemeColor(
            primary: FlexColor.materialLightSecondary,
            primaryContainer: FlexColor.materialLightSecondaryContainer,
            secondary: FlexColor.materialLightPrimary,
            secondaryContainer: FlexColor.materialLightPrimaryContainer,
            tertiary: FlexColor.materialLightTertiary,
            tertiaryContainer: FlexColor.materialLightTertiaryContainer,
          ),
        ).toTheme),
      );
    });

    // themeDark = Default material dark scheme colors.
    test(
        'FCS7.29SwapD: GIVEN FlexColorScheme.dark(swapColors: true) EXPECT it '
        'to be equal to one made with dark scheme colors swapped ', () {
      expect(
        FlexColorScheme.dark(
          swapColors: true,
        ).toTheme,
        equals(FlexColorScheme.dark(
          colors: const FlexSchemeColor(
            primary: FlexColor.materialDarkSecondary,
            primaryContainer: FlexColor.materialDarkSecondaryContainer,
            secondary: FlexColor.materialDarkPrimary,
            secondaryContainer: FlexColor.materialDarkPrimaryContainer,
            tertiary: FlexColor.materialDarkTertiary,
            tertiaryContainer: FlexColor.materialDarkTertiaryContainer,
          ),
        ).toTheme),
      );
    });

    test(
        'FCS7.30DefL: GIVEN FlexColorScheme.dark made with no parameters '
        'EXPECT its ThemeData to be equal to one made with light scheme.', () {
      expect(
        FlexColorScheme.dark().toTheme,
        equals(FlexColorScheme.dark(
          colors: FlexColor.schemes[FlexScheme.material]!.dark,
        ).toTheme),
      );
    });
    test(
        'FCS7.31D: GIVEN two FlexColorScheme.dark made with identical '
        'parameters EXPECT their ThemeData to be equal.', () {
      expect(
        FlexColorScheme.dark(
          colors: FlexColor.schemes[FlexScheme.material]!.dark,
        ).toTheme,
        equals(FlexColorScheme.dark(
          colors: FlexColor.schemes[FlexScheme.material]!.dark,
        ).toTheme),
      );
    });
    test(
        'FCS7.32D: GIVEN a FlexColorScheme.dark made with no '
        'parameters EXPECT ThemeData to be equal to one made with '
        'scheme FlexScheme.material.', () {
      expect(FlexColorScheme.dark().toTheme,
          FlexColorScheme.dark(scheme: FlexScheme.material).toTheme);
    });
    test(
        'FCS7.33D: GIVEN a FlexColorScheme.dark made with colors '
        'material EXPECT ThemeData to be equal to one made with '
        'scheme FlexScheme.material.', () {
      expect(
        FlexColorScheme.dark(
          colors: FlexColor.schemes[FlexScheme.material]!.dark,
        ).toTheme,
        equals(FlexColorScheme.dark(
          scheme: FlexScheme.material,
        ).toTheme),
      );
    });
    test(
        'FCS7.34D: GIVEN a FlexColorScheme.dark made with scheme '
        'material EXPECT ThemeData to be equal to one made with '
        'no params.', () {
      expect(
        FlexColorScheme.dark(
          colors: FlexColor.schemes[FlexScheme.material]!.dark,
        ).toTheme,
        equals(FlexColorScheme.dark().toTheme),
      );
    });

    test(
        'FCS7.35L: GIVEN a FlexColorScheme() made with scheme default '
        'constructor + light and '
        'material EXPECT ThemeData to be equal to an identical one.', () {
      expect(
        const FlexColorScheme(
          brightness: Brightness.light,
          primary: FlexColor.materialLightPrimary,
          primaryContainer: FlexColor.materialLightPrimaryContainer,
          secondary: FlexColor.materialLightSecondary,
          secondaryContainer: FlexColor.materialLightTertiary,
        ).toTheme,
        equals(const FlexColorScheme(
          brightness: Brightness.light,
          primary: FlexColor.materialLightPrimary,
          primaryContainer: FlexColor.materialLightPrimaryContainer,
          secondary: FlexColor.materialLightSecondary,
          secondaryContainer: FlexColor.materialLightTertiary,
        ).toTheme),
      );
    });

    test(
        'FCS7.36D: GIVEN a FlexColorScheme() made with scheme default '
        'constructor + dark and '
        'material EXPECT ThemeData to be equal to an identical one.', () {
      expect(
        const FlexColorScheme(
          brightness: Brightness.dark,
          primary: FlexColor.materialDarkPrimary,
          primaryContainer: FlexColor.materialDarkPrimaryContainer,
          secondary: FlexColor.materialDarkSecondary,
          secondaryContainer: FlexColor.materialDarkTertiary,
        ).toTheme,
        equals(const FlexColorScheme(
          brightness: Brightness.dark,
          primary: FlexColor.materialDarkPrimary,
          primaryContainer: FlexColor.materialDarkPrimaryContainer,
          secondary: FlexColor.materialDarkSecondary,
          secondaryContainer: FlexColor.materialDarkTertiary,
        ).toTheme),
      );
    });

    // themeLight = Default material light scheme colors.
    final ThemeData themeLight = const FlexColorScheme(
      brightness: Brightness.light,
      primary: FlexColor.materialLightPrimary,
      primaryContainer: FlexColor.materialLightPrimaryContainer,
      secondary: FlexColor.materialLightSecondary,
      secondaryContainer: FlexColor.materialLightTertiary,
    ).toTheme;
    // themeDark = Default material dark scheme colors.
    final ThemeData themeDark = const FlexColorScheme(
      brightness: Brightness.dark,
      primary: FlexColor.materialDarkPrimary,
      primaryContainer: FlexColor.materialDarkPrimaryContainer,
      secondary: FlexColor.materialDarkSecondary,
      secondaryContainer: FlexColor.materialDarkTertiary,
    ).toTheme;
    const ColorScheme lightScheme = ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff6200ee),
      onPrimary: Colors.white,
      primaryContainer: Color(0xffbb86fc),
      onPrimaryContainer: Colors.black,
      secondary: Color(0xff03dac6),
      onSecondary: Colors.black,
      secondaryContainer: Color(0xff018786),
      onSecondaryContainer: Colors.white,
      error: Color(0xffb00020),
      onError: Colors.white,
      errorContainer: Color(0xfffcd8df),
      onErrorContainer: Color(0xff000000),
      background: Colors.white,
      onBackground: Colors.black,
      surface: Colors.white,
      onSurface: Colors.black,
      outline: Color(0xff4d4d4d),
      inverseSurface: Color(0xff121212),
      onInverseSurface: Color(0xffffffff),
      inversePrimary: Color(0xffda99ff),
    );
    test(
        'FCS7.01 string: GIVEN a FlexColorScheme theme with Material scheme '
        'light colors EXPECT .colorScheme equality with given ColorScheme '
        'light.', () {
      expect(
        themeLight.colorScheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
            lightScheme.toString(minLevel: DiagnosticLevel.fine)),
      );
    });

    test(
        'FCS7.01: GIVEN a FlexColorScheme theme with Material scheme light '
        'colors EXPECT .colorScheme equality with given ColorScheme light().',
        () {
      expect(
        themeLight.colorScheme,
        equals(
          lightScheme,
        ),
      );
    });

    test(
        'FCS7.02: GIVEN a FlexColorScheme theme with Material scheme dark '
        'colors EXPECT .colorScheme equality with given ColorScheme.', () {
      expect(
        themeDark.colorScheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          const ColorScheme(
            brightness: Brightness.dark,
            primary: Color(0xffbb86fc),
            onPrimary: Color(0xff000000),
            primaryContainer: Color(0xff6200ee),
            onPrimaryContainer: Color(0xffffffff),
            secondary: Color(0xff03dac6),
            onSecondary: Color(0xff000000),
            secondaryContainer: Color(0xff03dac6),
            onSecondaryContainer: Color(0xff000000),
            tertiary: Color(0xff03dac6),
            onTertiary: Color(0xff000000),
            tertiaryContainer: Color(0xff03dac6),
            onTertiaryContainer: Color(0xff000000),
            error: Color(0xffcf6679),
            onError: Color(0xff000000),
            errorContainer: Color(0xffb1384e),
            onErrorContainer: Color(0xffffffff),
            background: Color(0xff121212),
            onBackground: Color(0xffffffff),
            surface: Color(0xff121212),
            onSurface: Color(0xffffffff),
            surfaceVariant: Color(0xff121212),
            onSurfaceVariant: Color(0xffffffff),
            outline: Color(0xffb3b3b3),
            shadow: Color(0xff000000),
            inverseSurface: Color(0xffffffff),
            onInverseSurface: Color(0xff000000),
            inversePrimary: Color(0xff5a4570),
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });

    //**************************************************************************
    // Test defaults and null input resulting in expected theme values.
    //**************************************************************************
    test(
        'FCS7.03: GIVEN a FlexColorScheme theme with Material scheme light '
        'colors EXPECT appbar theme color to be primary color.', () {
      expect(themeLight.appBarTheme.backgroundColor,
          themeLight.colorScheme.primary);
    });

    test(
        'FCS7.04: GIVEN a FlexColorScheme theme with Material scheme dark '
        'colors EXPECT appbar theme color to be surface color.', () {
      expect(
        themeDark.appBarTheme.backgroundColor,
        equals(themeDark.colorScheme.surface),
      );
    });

    test(
        'FCS7.05: GIVEN a FlexColorScheme theme with null VisualDensity input '
        'EXPECT VisualDensity().', () {
      expect(
        themeLight.visualDensity,
        equals(VisualDensity.standard),
      );
    });
    test(
        'FCS7.06: GIVEN a FlexColorScheme theme with null Typography input '
        'EXPECT Typography.material2018.', () {
      expect(
        themeLight.typography,
        equals(Typography.material2018(platform: defaultTargetPlatform)),
      );
    });

    //**************************************************************************
    // Test result of some customizations that fixes ThemeData.from color
    // scheme compliance gaps.
    //**************************************************************************

    test(
        'FCS7.07: GIVEN a FlexColorScheme theme with Material scheme light '
        'colors EXPECT toggleableActiveColor equality with '
        'colorScheme.secondary.', () {
      expect(
        themeLight.toggleableActiveColor,
        equals(themeLight.colorScheme.secondary),
      );
    });
    test(
        'FCS7.08: GIVEN a FlexColorScheme theme with Material scheme dark '
        'colors EXPECT toggleableActiveColor equality with '
        'colorScheme.secondary.', () {
      expect(
        themeDark.toggleableActiveColor,
        equals(themeDark.colorScheme.secondary),
      );
    });
    final MaterialColor lightSwatch =
        FlexColorScheme.createPrimarySwatch(themeLight.colorScheme.primary);
    final MaterialColor darkSwatch =
        FlexColorScheme.createPrimarySwatch(themeDark.colorScheme.primary);

    test(
        'FCS7.09: GIVEN a FlexColorScheme theme with Material scheme light '
        'colors EXPECT primaryColorDark equality with '
        'createPrimarySwatch(primaryColor)[900].', () {
      expect(
        themeLight.primaryColorDark,
        equals(lightSwatch[900]),
      );
    });
    test(
        'FCS7.10: GIVEN a FlexColorScheme theme with Material scheme dark '
        'colors EXPECT primaryColorDark equality with '
        'createPrimarySwatch(primaryColor)[800].', () {
      expect(
        themeDark.primaryColorDark,
        equals(darkSwatch[800]),
      );
    });

    test(
        'FCS7.11: GIVEN a FlexColorScheme theme with Material scheme light '
        'colors EXPECT primaryColorLight equality with '
        'createPrimarySwatch(primaryColor)[100].', () {
      expect(
        themeLight.primaryColorLight,
        equals(lightSwatch[100]),
      );
    });
    test(
        'FCS7.12: GIVEN a FlexColorScheme theme with Material scheme dark '
        'colors EXPECT primaryColorLight equality with '
        'createPrimarySwatch(primaryColor)[100].', () {
      expect(
        themeDark.primaryColorLight,
        equals(darkSwatch[100]),
      );
    });

    test(
        'FCS7.13: GIVEN a FlexColorScheme theme with Material scheme light '
        'colors EXPECT secondaryHeaderColor equality with '
        'createPrimarySwatch(primaryColor)[50].', () {
      expect(
        themeLight.secondaryHeaderColor,
        equals(lightSwatch[50]),
      );
    });
    test(
        'FCS7.14: GIVEN a FlexColorScheme theme with Material scheme dark '
        'colors EXPECT secondaryHeaderColor equality with '
        'createPrimarySwatch(primaryColor)[900].', () {
      expect(
        themeDark.secondaryHeaderColor,
        equals(darkSwatch[900]),
      );
    });

    //**************************************************************************
    // FlexColorScheme.light & dark factory tests. With LIGHT surface branding.
    //
    // Test result with custom features like surface, appbar, tab bar options.
    //**************************************************************************

    final ThemeData tLightL = FlexColorScheme.light(
      colors: FlexColor.schemes[FlexScheme.material]!.light,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurfaces,
      blendLevel: 2,
      appBarStyle: FlexAppBarStyle.surface,
      tabBarStyle: FlexTabBarStyle.forBackground,
    ).toTheme;

    final ThemeData tDarkL = FlexColorScheme.dark(
      colors: FlexColor.schemes[FlexScheme.material]!.dark,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurfaces,
      blendLevel: 2,
      appBarStyle: FlexAppBarStyle.surface,
      tabBarStyle: FlexTabBarStyle.forBackground,
    ).toTheme;

    test(
        'FCS7.16: GIVEN a FlexColorScheme.light theme FROM scheme "material" '
        'WITH FlexAppBarStyle.surface EXPECT appbar theme color '
        'colorScheme.surface.', () {
      expect(
        tLightL.appBarTheme.backgroundColor,
        equals(tLightL.colorScheme.surface),
      );
    });
    test(
        'FCS7.17: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH FlexAppBarStyle.surface EXPECT appbar theme color '
        'colorScheme.surface.', () {
      expect(
        tDarkL.appBarTheme.backgroundColor,
        equals(tDarkL.colorScheme.surface),
      );
    });

    test(
        'FCS7.18: GIVEN a FlexColorScheme.light theme FROM scheme "material" '
        'WITH appBarElevation: default EXPECT appbar theme elevation 0.', () {
      expect(tLightL.appBarTheme.elevation, equals(0));
    });
    test(
        'FCS7.19: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH appBarElevation: default EXPECT appbar theme elevation 0.', () {
      expect(tDarkL.appBarTheme.elevation, equals(0));
    });

    test(
        'FCS7.2: GIVEN a FlexColorScheme.light theme FROM scheme "material" '
        'WITH FlexSurface.light EXPECT surface Color(0xfffcfcfc).', () {
      expect(tLightL.colorScheme.surface, equals(const Color(0xfffcfcfc)));
    });
    test(
        'FCS7.21: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH FlexSurface.light EXPECT surface Color(0xff101010).', () {
      expect(tDarkL.colorScheme.surface, equals(const Color(0xff101010)));
    });

    test(
        'FCS7.22: GIVEN a FlexColorScheme.light theme FROM scheme "material" '
        'WITH FlexSurface.light EXPECT background Color(0xfffcfcfc).', () {
      expect(tLightL.colorScheme.background, equals(const Color(0xfffcfcfc)));
    });
    test(
        'FCS7.23: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH highScaffoldLowSurfaces blendLevel=2 '
        'EXPECT background Color(0xff101010).', () {
      expect(tDarkL.colorScheme.background, equals(const Color(0xff101010)));
    });

    test(
        'FCS7.24: GIVEN a FlexColorScheme.light theme FROM scheme "material" '
        'WITH highScaffoldLowSurfaces blendLevel=2 '
        'EXPECT scaffold '
        'background Color(0xfff9f7fc).', () {
      expect(tLightL.scaffoldBackgroundColor, equals(const Color(0xfff9f7fc)));
    });
    test(
        'FCS7.25: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH highScaffoldLowSurfaces blendLevel=2 '
        'EXPECT scaffold '
        'background Color(0xff141215).', () {
      expect(tDarkL.scaffoldBackgroundColor, equals(const Color(0xff141215)));
    });

    test(
        'FCS7.26: GIVEN a FlexColorScheme.light theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.material EXPECT '
        'indicator color primary.', () {
      expect(tLightL.indicatorColor, equals(tLightL.colorScheme.primary));
    });
    test(
        'FCS7.27: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.primary EXPECT '
        'indicator color primary.', () {
      expect(tDarkL.indicatorColor, equals(tDarkL.colorScheme.primary));
    });

    test(
        'FCS7.28: GIVEN a FlexColorScheme.light theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.material EXPECT '
        'TabBarTheme.labelColor primary.', () {
      expect(
        tLightL.tabBarTheme.labelColor,
        equals(tLightL.colorScheme.primary),
      );
    });
    test(
        'FCS7.29: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.primary EXPECT '
        'TabBarTheme.labelColor primary.', () {
      expect(
        tDarkL.tabBarTheme.labelColor,
        equals(tDarkL.colorScheme.primary),
      );
    });

    test(
        'FCS7.30: GIVEN a FlexColorScheme.light theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.material EXPECT '
        'TabBarTheme.unselectedLabelColor onSurface.withOpacity(0.6).', () {
      expect(
          tLightL.tabBarTheme.unselectedLabelColor,
          equals(
            tLightL.colorScheme.onSurface.withOpacity(0.6),
          ));
    });
    test(
        'FCS7.31: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.primary EXPECT '
        'TabBarTheme.unselectedLabelColor onSurface.withOpacity(0.6)', () {
      expect(
        tDarkL.tabBarTheme.unselectedLabelColor,
        equals(tDarkL.colorScheme.onSurface.withOpacity(0.6)),
      );
    });

    //**************************************************************************
    // FlexColorScheme.light & dark factory tests. With MEDIUM surface branding.
    //
    // Test result with custom features like surface, appbar, tab bar options.
    //**************************************************************************

    final ThemeData tLightM = FlexColorScheme.light(
      colors: FlexColor.schemes[FlexScheme.material]!.light,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog,
      blendLevel: 20,
      appBarStyle: FlexAppBarStyle.material,
      appBarElevation: 1,
      // ignore: avoid_redundant_argument_values
      tabBarStyle: FlexTabBarStyle.forAppBar,
    ).toTheme;

    final ThemeData tDarkM = FlexColorScheme.dark(
      colors: FlexColor.schemes[FlexScheme.material]!.dark,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog,
      blendLevel: 20,
      appBarStyle: FlexAppBarStyle.primary,
      appBarElevation: 3,
      // ignore: avoid_redundant_argument_values
      tabBarStyle: FlexTabBarStyle.forAppBar,
    ).toTheme;

    test(
        'FCS7.32: GIVEN a FlexColorScheme.light theme FROM scheme "material" '
        'WITH FlexAppBarStyle.material EXPECT appbar theme color '
        'FlexColor.materialLightSurface.', () {
      expect(
        tLightM.appBarTheme.backgroundColor,
        equals(FlexColor.materialLightSurface),
      );
    });
    test(
        'FCS7.33: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH FlexAppBarStyle.primary EXPECT appbar theme color '
        'colorScheme.primary.', () {
      expect(
        tDarkM.appBarTheme.backgroundColor,
        equals(tDarkM.colorScheme.primary),
      );
    });

    test(
        'FCS7.34: GIVEN a FlexColorScheme.light theme FROM scheme "material" '
        'WITH appBarElevation: 1 EXPECT appbar theme elevation 1.', () {
      expect(tLightM.appBarTheme.elevation, equals(1));
    });
    test(
        'FCS7.35: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH appBarElevation: 3 EXPECT appbar theme elevation 3.', () {
      expect(tDarkM.appBarTheme.elevation, equals(3));
    });

    test(
        'FCS7.36: GIVEN a FlexColorScheme.light theme FROM scheme "material" '
        'WITH highScaffoldLowSurfacesVariantDialog blendLevel 20 '
        'EXPECT surface Color(0xfff6f3fc).', () {
      expect(tLightM.colorScheme.surface, equals(const Color(0xfff6f3fc)));
    });
    test(
        'FCS7.37: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH highScaffoldLowSurfacesVariantDialog blendLevel 20 '
        'EXPECT surface Color(0xff161419).', () {
      expect(tDarkM.colorScheme.surface, equals(const Color(0xff161419)));
    });

    test(
        'FCS7.38a: GIVEN a FlexColorScheme.light theme FROM scheme "material" '
        'WITH highScaffoldLowSurfacesVariantDialog blendLevel 20 '
        'EXPECT background Color(0xfff6f3fc).', () {
      expect(tLightM.colorScheme.background, equals(const Color(0xfff6f3fc)));
    });
    test(
        'FCS7.38b: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH highScaffoldLowSurfacesVariantDialog blendLevel 20 '
        'EXPECT background Color(0xff161419).', () {
      expect(tDarkM.colorScheme.background, equals(const Color(0xff161419)));
    });

    test(
        'FCS7.39: GIVEN a FlexColorScheme.light theme FROM scheme "material" '
        'WITH highScaffoldLowSurfacesVariantDialog blendLevel 20 '
        'EXPECT scaffold background Color(0xffd8c1f9).', () {
      expect(tLightM.scaffoldBackgroundColor, equals(const Color(0xffd8c1f9)));
    });
    test(
        'FCS7.40: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH highScaffoldLowSurfacesVariantDialog blendLevel 20 '
        'EXPECT scaffold background Color(0xff382b47).', () {
      expect(tDarkM.scaffoldBackgroundColor, equals(const Color(0xff382b47)));
    });

    test(
        'FCS7.41: GIVEN a FlexColorScheme.light theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.material EXPECT '
        'indicator color black87.', () {
      expect(tLightM.indicatorColor, equals(Colors.black87));
    });
    test(
        'FCS7.42: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.primary EXPECT '
        'indicator color black87.', () {
      expect(tDarkM.indicatorColor, equals(Colors.black87));
    });

    test(
        'FCS7.43: GIVEN a FlexColorScheme.light theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.material EXPECT '
        'TabBarTheme.labelColor black87.', () {
      expect(tLightM.tabBarTheme.labelColor, equals(Colors.black87));
    });
    test(
        'FCS7.44: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.primary EXPECT '
        'TabBarTheme.labelColor black87.', () {
      expect(tDarkM.tabBarTheme.labelColor, equals(Colors.black87));
    });

    test(
        'FCS7.45: GIVEN a FlexColorScheme.light theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.material EXPECT '
        'TabBarTheme.unselectedLabelColor onSurface.withOpacity(0.6).', () {
      expect(
        tLightM.tabBarTheme.unselectedLabelColor,
        equals(tLightM.colorScheme.onSurface.withOpacity(0.6)),
      );
    });
    test(
        'FCS7.46: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.primary EXPECT '
        'TabBarTheme.unselectedLabelColor black87.withAlpha(0xB2)', () {
      expect(
        tDarkM.tabBarTheme.unselectedLabelColor,
        equals(Colors.black87.withAlpha(0xB2)),
      );
    });

    //**************************************************************************
    // FlexColorScheme.light & dark factory tests. With STRONG surface branding.
    //
    // Test result with custom features like surface, appbar, tab bar options.
    //**************************************************************************

    final ThemeData tLightS = FlexColorScheme.light(
      colors: FlexColor.schemes[FlexScheme.material]!.light,
      surfaceMode: FlexSurfaceMode.highSurfaceLowScaffold,
      blendLevel: 30,
      appBarStyle: FlexAppBarStyle.custom,
      appBarElevation: 6,
      // ignore: avoid_redundant_argument_values
      tabBarStyle: FlexTabBarStyle.forAppBar,
    ).toTheme;

    final ThemeData tDarkS = FlexColorScheme.dark(
      colors: FlexColor.schemes[FlexScheme.material]!.dark,
      surfaceMode: FlexSurfaceMode.highSurfaceLowScaffold,
      blendLevel: 30,
      // ignore: avoid_redundant_argument_values
      appBarStyle: FlexAppBarStyle.material,
      appBarElevation: 6,
      // ignore: avoid_redundant_argument_values
      tabBarStyle: FlexTabBarStyle.forAppBar,
    ).toTheme;

    test(
        'FCS7.47: GIVEN a FlexColorScheme.light theme FROM scheme "material" '
        'WITH FlexAppBarStyle.custom EXPECT appbar theme color '
        'colorScheme.tertiary.', () {
      expect(
        tLightS.appBarTheme.backgroundColor,
        equals(tLightS.colorScheme.tertiary),
      );
    });
    test(
        'FCS7.48: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH FlexAppBarStyle.material EXPECT appbar theme color '
        'default material dark surface.', () {
      expect(
        tDarkS.appBarTheme.backgroundColor,
        equals(FlexColor.materialDarkSurface),
      );
    });

    test(
        'FCS7.49: GIVEN a FlexColorScheme.light theme FROM scheme "material" '
        'WITH appBarElevation: 6 EXPECT appbar theme elevation 6.', () {
      expect(tLightS.appBarTheme.elevation, equals(6));
    });
    test(
        'FCS7.50: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH appBarElevation: 6 EXPECT appbar theme elevation 6.', () {
      expect(tDarkS.appBarTheme.elevation, equals(6));
    });

    test(
        'FCS7.51: GIVEN a FlexColorScheme.light theme FROM scheme "material" '
        'WITH highSurfaceLowScaffold blendLevel 30 '
        'EXPECT surface Color(0xffe3d2fc).', () {
      expect(tLightS.colorScheme.surface, equals(const Color(0xffe3d2fc)));
    });
    test(
        'FCS7.52: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH highSurfaceLowScaffold blendLevel 30 '
        'EXPECT surface Color(0xff2f253a).', () {
      expect(tDarkS.colorScheme.surface, equals(const Color(0xff2f253a)));
    });

    test(
        'FCS7.53: GIVEN a FlexColorScheme.light theme FROM scheme "material" '
        'WITH highSurfaceLowScaffold blendLevel 30 '
        'EXPECT background Color(0xffeadffb).', () {
      expect(tLightS.colorScheme.background, equals(const Color(0xffeadffb)));
    });
    test(
        'FCS7.54: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH highSurfaceLowScaffold blendLevel 30 '
        'EXPECT background Color(0xff241d2b).', () {
      expect(tDarkS.colorScheme.background, equals(const Color(0xff241d2b)));
    });

    test(
        'FCS7.55: GIVEN a FlexColorScheme.light theme FROM scheme "material" '
        'WITH highSurfaceLowScaffold blendLevel 30 '
        'EXPECT scaffold background Color(0xfff5f0fe).', () {
      expect(tLightS.scaffoldBackgroundColor, equals(const Color(0xfff5f0fe)));
    });
    test(
        'FCS7.56: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH highSurfaceLowScaffold blendLevel 30 '
        'EXPECT scaffold background Color(0xff1b181f).', () {
      expect(tDarkS.scaffoldBackgroundColor, equals(const Color(0xff1b181f)));
    });

    test(
        'FCS7.57: GIVEN a FlexColorScheme.light theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.material EXPECT '
        'indicator color white.', () {
      expect(tLightS.indicatorColor, equals(Colors.white));
    });
    test(
        'FCS7.58: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.primary EXPECT '
        'indicator color white.', () {
      expect(tDarkS.indicatorColor, equals(Colors.white));
    });

    test(
        'FCS7.59: GIVEN a FlexColorScheme.light theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.material EXPECT '
        'TabBarTheme.labelColor white.', () {
      expect(tLightS.tabBarTheme.labelColor, equals(Colors.white));
    });
    test(
        'FCS7.60: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.primary EXPECT '
        'TabBarTheme.labelColor white.', () {
      expect(tDarkS.tabBarTheme.labelColor, equals(Colors.white));
    });

    test(
        'FCS7.61: GIVEN a FlexColorScheme.light theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.material EXPECT '
        'TabBarTheme.unselectedLabelColor white.withAlpha(0xB2).', () {
      expect(
        tLightS.tabBarTheme.unselectedLabelColor,
        equals(Colors.white.withAlpha(0xB2)),
      );
    });
    test(
        'FCS7.62: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.primary EXPECT '
        'TabBarTheme.unselectedLabelColor white.withAlpha(0xB2).', () {
      expect(
        tDarkS.tabBarTheme.unselectedLabelColor,
        equals(Colors.white.withAlpha(0xB2)),
      );
    });

    //**************************************************************************
    // FlexColorScheme.light & dark factory tests. With HEAVY surface branding.
    //
    // Test result with custom features like surface, appbar, tab bar options.
    //**************************************************************************

    final ThemeData tLightH = FlexColorScheme.light(
      colors: FlexColor.schemes[FlexScheme.material]!.light,
      surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
      blendLevel: 40,
      appBarStyle: FlexAppBarStyle.background,
      appBarElevation: 2,
      tabBarStyle: FlexTabBarStyle.forBackground,
      tooltipsMatchBackground: true,
      transparentStatusBar: false,
      bottomAppBarElevation: 1,
    ).toTheme;

    final ThemeData tDarkH = FlexColorScheme.dark(
      colors: FlexColor.schemes[FlexScheme.material]!.dark,
      surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
      blendLevel: 40,
      appBarStyle: FlexAppBarStyle.background,
      appBarElevation: 4,
      tabBarStyle: FlexTabBarStyle.forBackground,
      tooltipsMatchBackground: true,
      transparentStatusBar: false,
      bottomAppBarElevation: 1,
    ).toTheme;

    test(
        'FCS7.63: GIVEN a FlexColorScheme.light theme FROM scheme "material" '
        'WITH FlexAppBarStyle.background EXPECT appbar theme color '
        'colorScheme.background.', () {
      expect(
        tLightH.appBarTheme.backgroundColor,
        equals(tLightH.colorScheme.background),
      );
    });
    test(
        'FCS7.64: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH FlexAppBarStyle.background EXPECT appbar theme color '
        'colorScheme.background.', () {
      expect(
        tDarkH.appBarTheme.backgroundColor,
        equals(tDarkH.colorScheme.background),
      );
    });

    test(
        'FCS7.65: GIVEN a FlexColorScheme.light theme FROM scheme "material" '
        'WITH appBarElevation: 2 EXPECT appbar theme elevation 2.', () {
      expect(tLightH.appBarTheme.elevation, equals(2));
    });
    test(
        'FCS7.66: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH appBarElevation: 4 EXPECT appbar theme elevation 4.', () {
      expect(tDarkH.appBarTheme.elevation, equals(4));
    });

    test(
        'FCS7.67: GIVEN a FlexColorScheme.light theme FROM scheme "material" '
        'WITH highBackgroundLowScaffold blendLevel 40 '
        'EXPECT surface Color(0xffe6d7fc).', () {
      expect(tLightH.colorScheme.surface, equals(const Color(0xffe6d7fc)));
    });
    test(
        'FCS7.68: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH highBackgroundLowScaffold blendLevel 40 '
        'EXPECT surface Color(0xff2b2335).', () {
      expect(tDarkH.colorScheme.surface, equals(const Color(0xff2b2335)));
    });

    test(
        'FCS7.69: GIVEN a FlexColorScheme.light theme FROM scheme "material" '
        'WITH FlexSurface.heavy EXPECT background Color(0xffd8c1f9).', () {
      expect(tLightH.colorScheme.background, equals(const Color(0xffd8c1f9)));
    });
    test(
        'FCS7.70: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH highBackgroundLowScaffold blendLevel 40 '
        'EXPECT background Color(0xff382b47).', () {
      expect(tDarkH.colorScheme.background, equals(const Color(0xff382b47)));
    });

    test(
        'FCS7.71: GIVEN a FlexColorScheme.light theme FROM scheme "material" '
        'WITH highBackgroundLowScaffold blendLevel 40 '
        'EXPECT scaffold background Color(0xfff2ebfd).', () {
      expect(tLightH.scaffoldBackgroundColor, equals(const Color(0xfff2ebfd)));
    });
    test(
        'FCS7.72: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH highBackgroundLowScaffold blendLevel 40 '
        'EXPECT scaffold background Color(0xff1f1b24).', () {
      expect(tDarkH.scaffoldBackgroundColor, equals(const Color(0xff1f1b24)));
    });

    test(
        'FCS7.73: GIVEN a FlexColorScheme.light theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.material EXPECT '
        'indicator color primary.', () {
      expect(tLightH.indicatorColor, equals(tLightH.colorScheme.primary));
    });
    test(
        'FCS7.74: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.primary EXPECT '
        'indicator color primary.', () {
      expect(tDarkH.indicatorColor, equals(tDarkH.colorScheme.primary));
    });

    test(
        'FCS7.75: GIVEN a FlexColorScheme.light theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.material EXPECT '
        'TabBarTheme.labelColor primary.', () {
      expect(
        tLightH.tabBarTheme.labelColor,
        equals(tLightH.colorScheme.primary),
      );
    });
    test(
        'FCS7.76: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.primary EXPECT '
        'TabBarTheme.labelColor primary.', () {
      expect(
        tDarkH.tabBarTheme.labelColor,
        equals(tDarkH.colorScheme.primary),
      );
    });

    test(
        'FCS7.77: GIVEN a FlexColorScheme.light theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.material EXPECT '
        'TabBarTheme.unselectedLabelColor onSurface.withOpacity(0.6).', () {
      expect(
        tLightH.tabBarTheme.unselectedLabelColor,
        equals(
          tLightH.colorScheme.onSurface.withOpacity(0.6),
        ),
      );
    });
    test(
        'FCS7.78: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.primary EXPECT '
        'TabBarTheme.unselectedLabelColor onSurface.withOpacity(0.6)', () {
      expect(
        tDarkH.tabBarTheme.unselectedLabelColor,
        equals(
          tDarkH.colorScheme.onSurface.withOpacity(0.6),
        ),
      );
    });

    //**************************************************************************
    // FlexColorScheme.light & dark factory tests. With HEAVY surface branding.
    //
    // Test result with 2...3 colors and true black.
    //**************************************************************************

    final FlexColorScheme fcsLightH2 = FlexColorScheme.light(
      colors: FlexColor.schemes[FlexScheme.mandyRed]!.light,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurfaces,
      blendLevel: 30,
      appBarStyle: FlexAppBarStyle.background,
      tabBarStyle: FlexTabBarStyle.forBackground,
      usedColors: 2,
    );
    final FlexColorScheme fcsLightH2Raw = FlexColorScheme.light(
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xffcd5758),
          onPrimary: Color(0xffffffff),
          primaryContainer: Color(0xffebbbbc),
          onPrimaryContainer: Color(0xff000000),
          secondary: Color(0xff57c8d3),
          onSecondary: Color(0xff000000),
          secondaryContainer: Color(0xffbbe9ed),
          onSecondaryContainer: Color(0xff000000),
          tertiary: Color(0xfff37d7e),
          onTertiary: Color(0xff000000),
          tertiaryContainer: Color(0xfffdf0f0),
          onTertiaryContainer: Color(0xff000000),
          error: Color(0xff790000),
          onError: Color(0xffffffff),
          background: Color(0xfffaf3f3),
          onBackground: Color(0xff000000),
          surface: Color(0xfffaf3f3),
          onSurface: Color(0xff000000),
          //
          errorContainer: Color(0xfff1d8d8),
          onErrorContainer: Color(0xff000000),
          surfaceVariant: Color(0xfff7e9e9),
          onSurfaceVariant: Color(0xff000000),
          outline: Color(0xff4d4d4d),
          shadow: Color(0xff000000),
          inverseSurface: Color(0xff1b1414),
          onInverseSurface: Color(0xffffffff),
          inversePrimary: Color(0xfffff0f0),
        ),
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurfaces,
        blendLevel: 30,
        primary: const Color(0xffcd5758),
        onPrimary: const Color(0xffffffff),
        primaryContainer: const Color(0xffebbbbc),
        onPrimaryContainer: const Color(0xff000000),
        secondary: const Color(0xff57c8d3),
        onSecondary: const Color(0xff000000),
        secondaryContainer: const Color(0xffbbe9ed),
        onSecondaryContainer: const Color(0xff000000),
        tertiary: const Color(0xfff37d7e),
        onTertiary: const Color(0xff000000),
        tertiaryContainer: const Color(0xfffdf0f0),
        onTertiaryContainer: const Color(0xff000000),
        error: const Color(0xff790000),
        onError: const Color(0xffffffff),
        background: const Color(0xfffaf3f3),
        onBackground: const Color(0xff000000),
        surface: const Color(0xfffaf3f3),
        onSurface: const Color(0xff000000),
        //
        tabBarStyle: FlexTabBarStyle.forBackground,
        appBarBackground: const Color(0xfffaf3f3),
        appBarElevation: 0,
        bottomAppBarElevation: 0,
        tooltipsMatchBackground: false,
        transparentStatusBar: true,
        visualDensity: null,
        textTheme: null,
        primaryTextTheme: null,
        fontFamily: null,
        platform: null,
        typography: null,
        applyElevationOverlayColor: true,
        subThemesData: null);

    // Doing a string version for easy comparisons.
    test(
        'FCS7.79a-scheme-toString: GIVEN a Equal Raw and FlexColorScheme.light '
        'with heavy branding and 2 colors EXPECT equal ColorScheme string.',
        () {
      expect(
        fcsLightH2.toScheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          fcsLightH2Raw.toScheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });

    test(
        'FCS7.79b-scheme: GIVEN a Equal Raw and FlexColorScheme.light with '
        'heavy branding and 2 colors EXPECT equal ColorScheme.toScheme.', () {
      expect(
        fcsLightH2.toScheme,
        equals(
          fcsLightH2Raw.toScheme,
        ),
      );
    });
    test(
        'FCS7.79c-string: GIVEN a Equal Raw and FlexColorScheme.light with '
        'heavy branding and 2 colors EXPECT equal toStrings.', () {
      expect(
        fcsLightH2.toString(),
        equalsIgnoringHashCodes(fcsLightH2Raw.toString()),
      );
    });
    test(
        'FCS7.79d-object: GIVEN a Equal Raw and FlexColorScheme.light with '
        'heavy branding and 2 colors EXPECT equal objects.', () {
      expect(
        fcsLightH2,
        equals(fcsLightH2Raw),
      );
    });
    test(
        'FCS7.79e-theme: GIVEN a Equal Raw and FlexColorScheme.light with '
        'heavy branding and 2 colors EXPECT toTheme equals.', () {
      expect(
        fcsLightH2.toTheme,
        equals(fcsLightH2Raw.toTheme),
      );
    });

    final FlexColorScheme fcsDarkH2 = FlexColorScheme.dark(
      colors: FlexColor.schemes[FlexScheme.mandyRed]!.dark,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
      blendLevel: 30,
      appBarStyle: FlexAppBarStyle.background,
      tabBarStyle: FlexTabBarStyle.forBackground,
      darkIsTrueBlack: true,
      usedColors: 2,
    );

    const FlexColorScheme fcsDarkH2Raw = FlexColorScheme(
        // Override the ones we can set via direct input
        // to be equal to direct inputs
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xffda8585),
          onPrimary: Color(0xffffffff),
          primaryContainer: Color(0xff573535),
          onPrimaryContainer: Color(0xffffffff),
          secondary: Color(0xff68cdd7),
          onSecondary: Color(0xff000000),
          secondaryContainer: Color(0xff295256),
          onSecondaryContainer: Color(0xffffffff),
          tertiary: Color(0xffffabab),
          onTertiary: Color(0xff000000),
          tertiaryContainer: Color(0xffb33030),
          onTertiaryContainer: Color(0xffffffff),
          error: Color(0xffcf6679),
          onError: Color(0xff000000),
          background: Color(0xff191313),
          onBackground: Color(0xffffffff),
          surface: Color(0xff0e0c0c),
          onSurface: Color(0xffffffff),
          //
          errorContainer: Color(0xffb1384e),
          onErrorContainer: Color(0xffffffff),
          surfaceVariant: Color(0xff191313),
          onSurfaceVariant: Color(0xffffffff),
          outline: Color(0xffb3b3b3),
          shadow: Color(0xff000000),
          inverseSurface: Color(0xffffffff),
          onInverseSurface: Color(0xff000000),
          inversePrimary: Color(0xff644141),
        ),
        primary: Color(0xffda8585),
        onPrimary: Color(0xffffffff),
        primaryContainer: Color(0xff573535),
        onPrimaryContainer: Color(0xffffffff),
        secondary: Color(0xff68cdd7),
        onSecondary: Color(0xff000000),
        secondaryContainer: Color(0xff295256),
        onSecondaryContainer: Color(0xffffffff),
        tertiary: Color(0xffffabab),
        onTertiary: Color(0xff000000),
        tertiaryContainer: Color(0xffb33030),
        onTertiaryContainer: Color(0xffffffff),
        error: Color(0xffcf6679),
        onError: Color(0xff000000),
        background: Color(0xff191313),
        onBackground: Color(0xffffffff),
        surface: Color(0xff0e0c0c),
        onSurface: Color(0xffffffff),
        //
        scaffoldBackground: Color(0xff000000),
        appBarBackground: Color(0xff191313),
        dialogBackground: Color(0xff0e0c0c),
        tabBarStyle: FlexTabBarStyle.forBackground,
        appBarElevation: 0,
        bottomAppBarElevation: 0,
        tooltipsMatchBackground: false,
        transparentStatusBar: true,
        visualDensity: null,
        textTheme: null,
        primaryTextTheme: null,
        fontFamily: null,
        platform: null,
        typography: null,
        applyElevationOverlayColor: true,
        subThemesData: null);

    test(
        'FCS7.80a-scheme: GIVEN a Equal Raw and FlexColorScheme.dark with '
        'heavy branding and 2 colors and true black '
        'EXPECT equals scheme strings.', () {
      expect(
        fcsDarkH2.toScheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          fcsDarkH2Raw.toScheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'FCS7.80b-scheme: GIVEN a Equal Raw and FlexColorScheme.dark with '
        'heavy branding and 2 colors and true black EXPECT equal objects.', () {
      expect(
        fcsDarkH2.toScheme,
        equals(fcsDarkH2Raw.toScheme),
      );
    });
    test(
        'FCS7.80c-string: GIVEN a Equal Raw and FlexColorScheme.dark with '
        'heavy branding and 2 colors and true black that produce same '
        'ColorScheme but via different config '
        'EXPECT unequal equal objects.', () {
      expect(
        fcsDarkH2 != fcsDarkH2Raw,
        true,
      );
    });
    test(
        'FCS7.80d: GIVEN a Raw and FlexColorScheme.dark with heavy '
        'branding and 2 colors and true black, that define SAME '
        'FlexColorScheme.toScheme and theme but are unequal as '
        'FlexColorScheme objects '
        'EXPECT equals toTheme.', () {
      expect(
        fcsDarkH2.toTheme,
        equals(fcsDarkH2Raw.toTheme),
      );
    });

    final ThemeData tLightH3 = FlexColorScheme.light(
      colors: FlexColor.schemes[FlexScheme.mandyRed]!.light,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurfaces,
      blendLevel: 35,
      appBarStyle: FlexAppBarStyle.background,
      tabBarStyle: FlexTabBarStyle.universal,
      lightIsWhite: true,
      usedColors: 3,
    ).toTheme;

    final ThemeData tDarkH3 = FlexColorScheme.dark(
      colors: FlexColor.schemes[FlexScheme.mandyRed]!.dark,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurfaces,
      blendLevel: 35,
      appBarStyle: FlexAppBarStyle.background,
      tabBarStyle: FlexTabBarStyle.universal,
      darkIsTrueBlack: true,
      usedColors: 3,
    ).toTheme;

    test(
        'FCS7.81: GIVEN a FlexColorScheme.light with heavy branding and 3 '
        'colors and light is white EXPECT equal when copy in same color.', () {
      expect(
        tLightH3,
        tLightH3.copyWith(primaryColor: FlexColor.mandyRedLightPrimary),
      );
    });
    test(
        'FCS7.82: GIVEN a FlexColorScheme.dark with heavy branding and '
        '3 colors and true black EXPECT EXPECT equal when copy in same color.',
        () {
      expect(
        tDarkH3,
        tDarkH3.copyWith(primaryColor: FlexColor.mandyRedDarkPrimary),
      );
    });

    //**************************************************************************
    // FlexColorScheme.light & dark factory tests. With
    // highBackgroundLowScaffold to hit background red color less than surface.
    //**************************************************************************

    // TODO(rydmike): Improve tests by adding more results verification checks.

    final ThemeData tLightHb = FlexColorScheme.light(
      scheme: FlexScheme.red,
      surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
      blendLevel: 30,
      appBarStyle: FlexAppBarStyle.background,
      appBarElevation: 2,
      tabBarStyle: FlexTabBarStyle.universal,
      tooltipsMatchBackground: false,
      transparentStatusBar: false,
      bottomAppBarElevation: 1,
      subThemesData: const FlexSubThemesData(
        defaultRadius: 8,
        tabBarIndicatorSchemeColor: SchemeColor.secondary,
      ),
    ).toTheme;

    test(
        'FCS7.82-1L: GIVEN a FlexColorScheme.light with more options '
        'EXPECT none null result.', () {
      expect(tLightHb, isNotNull);
    });

    test(
        'FCS7.82-2L indicator: GIVEN tabBarIndicatorUsedColor: '
        'FlexUsedColor.secondary '
        'EXPECT indicator color to be theme.scheme.secondary', () {
      expect(tLightHb.indicatorColor, tLightHb.colorScheme.secondary);
    });

    final RoundedRectangleBorder shapeL =
        tLightHb.popupMenuTheme.shape! as RoundedRectangleBorder;

    test('FCS7.82-3L shape: Expect border radius 8', () {
      expect(shapeL.borderRadius, BorderRadius.circular(8.0));
    });

    final ThemeData tDarkHb = FlexColorScheme.dark(
      scheme: FlexScheme.red,
      surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
      blendLevel: 30,
      appBarStyle: FlexAppBarStyle.background,
      appBarElevation: 2,
      tabBarStyle: FlexTabBarStyle.universal,
      tooltipsMatchBackground: false,
      transparentStatusBar: false,
      bottomAppBarElevation: 1,
      subThemesData: const FlexSubThemesData(
        defaultRadius: 12,
        tabBarIndicatorSchemeColor: SchemeColor.error,
      ),
    ).toTheme;

    test(
        'FCS7.82-1D: GIVEN a FlexColorScheme.dark with more options '
        'EXPECT none null result.', () {
      expect(tDarkHb, isNotNull);
    });

    test(
        'FCS7.82-2D indicator: GIVEN tabBarIndicatorUsedColor: '
        'FlexUsedColor.error '
        'EXPECT indicator color to be theme.scheme.secondary', () {
      expect(tDarkHb.indicatorColor, tDarkHb.colorScheme.error);
    });

    final RoundedRectangleBorder shapeD =
        tDarkHb.popupMenuTheme.shape! as RoundedRectangleBorder;
    final RoundedRectangleBorder shapeD2 =
        tDarkHb.cardTheme.shape! as RoundedRectangleBorder;

    test(
        'FCS7.82-3D shape: Expect border radius 10 on popup, it '
        'does not higher via default parameter', () {
      expect(shapeD.borderRadius, BorderRadius.circular(10.0));
    });
    test('FCS7.82-4D shape: Expect border radius 12 on card', () {
      expect(shapeD2.borderRadius, BorderRadius.circular(12.0));
    });

    final ThemeData tLightM3Bar1 = FlexColorScheme.light(
      scheme: FlexScheme.red,
      surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
      blendLevel: 30,
      appBarStyle: FlexAppBarStyle.background,
      appBarElevation: 2,
      tabBarStyle: FlexTabBarStyle.universal,
      tooltipsMatchBackground: false,
      transparentStatusBar: false,
      bottomAppBarElevation: 1,
      subThemesData: const FlexSubThemesData(
        defaultRadius: 8,
        tabBarIndicatorSchemeColor: SchemeColor.secondary,
        navigationBarIsStyled: false,
      ),
    ).toTheme;

    test(
        'FCS7.82-M3Bar1: GIVEN a FlexColorScheme.light with more options '
        'setting navigationBarIsStyled '
        'EXPECT none null result.', () {
      expect(tLightM3Bar1, isNotNull);
    });

    final ThemeData tLightM3Bar2 = FlexColorScheme.light(
      scheme: FlexScheme.red,
      surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
      blendLevel: 30,
      appBarStyle: FlexAppBarStyle.background,
      appBarElevation: 2,
      tabBarStyle: FlexTabBarStyle.universal,
      tooltipsMatchBackground: false,
      transparentStatusBar: false,
      bottomAppBarElevation: 1,
      subThemesData: const FlexSubThemesData(
        defaultRadius: 8,
        tabBarIndicatorSchemeColor: SchemeColor.secondary,
        navigationBarIsStyled: false,
        navigationBarHeight: 70,
        navigationBarOpacity: 0.95,
        navigationBarSelectedIconSchemeColor: SchemeColor.primary,
        navigationBarSelectedLabelSchemeColor: SchemeColor.onSurface,
        navigationBarIndicatorSchemeColor: SchemeColor.primaryContainer,
        navigationBarBackgroundSchemeColor: SchemeColor.background,
        navigationBarMutedUnselectedIcon: true,
        navigationBarMutedUnselectedLabel: true,
        navigationBarSelectedLabelSize: 12,
        navigationBarUnselectedLabelSize: 10,
        navigationBarSelectedIconSize: 26,
        navigationBarUnselectedIconSize: 24,
        navigationBarLabelBehavior:
            NavigationDestinationLabelBehavior.onlyShowSelected,
      ),
    ).toTheme;

    test(
        'FCS7.82-M3Bar2: GIVEN a FlexColorScheme.light with more options '
        'setting navigationBarIsStyled '
        'EXPECT none null result.', () {
      expect(tLightM3Bar2, isNotNull);
    });

    //**************************************************************************
    // FlexColorScheme.light & dark factory tests. With CUSTOM surface branding.
    //
    // Test result with custom features like surface, appbar, tab bar options.
    //**************************************************************************

    // TODO(rydmike): Improve tests by adding more results verification checks.

    final ThemeData tLightC = FlexColorScheme.light(
      colors: FlexColor.schemes[FlexScheme.mandyRed]!.light,
      surfaceMode: FlexSurfaceMode.custom,
      blendLevel: 20,
      appBarStyle: FlexAppBarStyle.custom,
      appBarElevation: 2,
      tabBarStyle: FlexTabBarStyle.flutterDefault,
      tooltipsMatchBackground: true,
      transparentStatusBar: false,
      bottomAppBarElevation: 1,
      usedColors: 1,
    ).toTheme;

    final ThemeData tDarkC = FlexColorScheme.dark(
      colors: FlexColor.schemes[FlexScheme.mandyRed]!.dark,
      surfaceMode: FlexSurfaceMode.custom,
      blendLevel: 20,
      appBarStyle: FlexAppBarStyle.custom,
      appBarElevation: 4,
      tabBarStyle: FlexTabBarStyle.flutterDefault,
      tooltipsMatchBackground: true,
      transparentStatusBar: false,
      bottomAppBarElevation: 1,
      darkIsTrueBlack: true,
      usedColors: 1,
    ).toTheme;

    test(
        'FCS7.83: GIVEN a FlexColorScheme.light with more options '
        'EXPECT none null result.', () {
      expect(tLightC, isNotNull);
    });
    test(
        'FCS7.84: GIVEN a FlexColorScheme.dark with more options '
        'EXPECT none null result.', () {
      expect(tDarkC, isNotNull);
    });

    // With surface and background colors defined, and light is white
    final ThemeData tLightC2 = FlexColorScheme.light(
      colors: FlexColor.schemes[FlexScheme.mandyRed]!.light,
      surfaceMode: FlexSurfaceMode.custom,
      blendLevel: 0,
      appBarStyle: FlexAppBarStyle.custom,
      appBarElevation: 2,
      tabBarStyle: FlexTabBarStyle.forBackground,
      tooltipsMatchBackground: true,
      transparentStatusBar: false,
      bottomAppBarElevation: 1,
      lightIsWhite: true,
      usedColors: 3,
      surface: FlexColor.materialLightSurface,
      background: FlexColor.materialLightBackground,
      scaffoldBackground: FlexColor.materialLightBackground,
      applyElevationOverlayColor: false,
    ).toTheme;

    final ThemeData tDarkC2 = FlexColorScheme.dark(
      colors: FlexColor.schemes[FlexScheme.mandyRed]!.dark,
      surfaceMode: FlexSurfaceMode.custom,
      blendLevel: 0,
      appBarStyle: FlexAppBarStyle.custom,
      appBarElevation: 4,
      tabBarStyle: FlexTabBarStyle.forBackground,
      tooltipsMatchBackground: true,
      transparentStatusBar: false,
      bottomAppBarElevation: 1,
      darkIsTrueBlack: true,
      usedColors: 3,
      surface: FlexColor.materialDarkSurface,
      background: FlexColor.materialDarkBackground,
      scaffoldBackground: FlexColor.materialDarkBackground,
      applyElevationOverlayColor: true,
    ).toTheme;

    final ThemeData tDarkC2tb = FlexColorScheme.dark(
      colors: FlexColor.schemes[FlexScheme.mandyRed]!.dark,
      surfaceMode: FlexSurfaceMode.custom,
      blendLevel: 0,
      appBarStyle: FlexAppBarStyle.custom,
      appBarElevation: 4,
      tabBarStyle: FlexTabBarStyle.forBackground,
      tooltipsMatchBackground: true,
      transparentStatusBar: false,
      bottomAppBarElevation: 1,
      usedColors: 3,
      surface: FlexColor.materialDarkSurface,
      background: FlexColor.materialDarkBackground,
      scaffoldBackground: FlexColor.materialDarkBackground,
    ).toTheme;

    test(
        'FCS7.85: GIVEN a FlexColorScheme.light with more options '
        'like custom surface and background '
        'EXPECT OK and identical to copy.', () {
      expect(
        tLightC2,
        equals(tLightC2.copyWith(applyElevationOverlayColor: false)),
      );
    });
    test(
        'FCS7.86: GIVEN a FlexColorScheme.dark with more options '
        'like custom surface and background '
        'EXPECT OK and identical to copy.', () {
      expect(
        tDarkC2,
        equals(tDarkC2.copyWith(applyElevationOverlayColor: true)),
      );
    });
    test(
        'FCS7.87: GIVEN a FlexColorScheme.dark with more options '
        'like custom surface and background and true black '
        'EXPECT OK and identical to copy.', () {
      expect(tDarkC2tb, equals(tDarkC2tb.copyWith()));
    });

    //**************************************************************************
    // Text Theme TESTS
    //**************************************************************************
    // Default light TextTheme equality verification.
    //
    // Flex default TextTheme light
    final TextTheme fLightT = FlexColorScheme.light().toTheme.textTheme;
    // Should be same as a light ThemeData textTheme with Typography 2018
    final TextTheme nLightT =
        ThemeData(typography: Typography.material2018()).textTheme;
    test(
        'FCS7.88: GIVEN a FlexColorScheme.light with no TextTheme defined '
        'EXPECT equal to '
        'ThemeData(typography: Typography.material2018()).textTheme.', () {
      expect(fLightT, equals(nLightT));
    });

    // Default light Primary TextTheme equality verification.
    //
    // Flex default TextTheme light
    final TextTheme fLightP = FlexColorScheme.light().toTheme.primaryTextTheme;
    // Should be same as a light ThemeData textTheme with Typography 2018
    final TextTheme nLightP =
        ThemeData(typography: Typography.material2018()).primaryTextTheme;
    test(
        'FCS7.89: GIVEN a FlexColorScheme.light with no PrimaryTextTheme '
        'defined EXPECT equal '
        'ThemeData(typography: Typography.material2018()).primaryTextTheme',
        () {
      expect(fLightP, equals(nLightP));
    });

    // Default dark TextTheme equality verification.
    final TextTheme fDarkT = FlexColorScheme.dark().toTheme.textTheme;
    final TextTheme nDarkT = ThemeData(
      brightness: Brightness.dark,
      typography: Typography.material2018(),
    ).textTheme;
    test(
        'FCS7.90: GIVEN a FlexColorScheme.dark with no TextTheme defined '
        'EXPECT equal to default dark with Typography 2018.', () {
      expect(fDarkT, equals(nDarkT));
    });

    // Primary dark text theme verification, this is not equal to default
    // ThemeData primary text theme, it is so by design, we have to also
    // set the primaryColor to the color used by FlexColorScheme.dark, otherwise
    // default dark theme uses an almost black color as primary color, giving
    // us the wrong on primaryTextTheme color for this test case, which is
    // part of the test.
    final TextTheme fDarkP = FlexColorScheme.dark().toTheme.primaryTextTheme;
    final Color nDarkPColor = FlexColorScheme.dark().toTheme.primaryColor;
    final TextTheme nDarkP = ThemeData(
      brightness: Brightness.dark,
      primaryColor: nDarkPColor,
      typography: Typography.material2018(),
    ).primaryTextTheme;
    // Default dark Primary TextTheme equality verification.
    test(
        'FCS7.91: GIVEN a FlexColorScheme.dark with no PrimaryTextThemes '
        'defined EXPECT equal to default default dark with Typography 2018 and '
        'primaryColor set as in FlexColorScheme.light.', () {
      expect(fDarkP, equals(nDarkP));
    });

    // Next let's test som crazy themes, make one for TextTheme
    const TextTheme customText = TextTheme(
      headline6: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        height: 24 / 20,
      ),
      headline5: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
      ),
      headline4: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.15,
      ),
      subtitle2: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.25,
        height: 20 / 17,
      ),
      bodyText1: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        height: 20 / 14,
      ),
      bodyText2: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      ),
    );

    // Make a custom text theme for PrimaryTextTheme, it should only get these
    // customizations + default style, not the the ones in the custom TextTheme.
    const TextTheme customPrimText = TextTheme(
      bodyText2: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      ),
      overline: TextStyle(
        letterSpacing: 0.5,
      ),
    );

    // Light theme with custom text theme
    final ThemeData fLightTD = FlexColorScheme.light(
      textTheme: customText,
      primaryTextTheme: customPrimText,
    ).toTheme;
    final ThemeData nLightTD = ThemeData(
      textTheme: customText,
      primaryTextTheme: customPrimText,
      typography: Typography.material2018(),
    );

    // Custom light TextTheme equality verification.
    final TextTheme fCText = fLightTD.textTheme;
    final TextTheme nCText = nLightTD.textTheme;
    test(
        'FCS7.92: GIVEN a FlexColorScheme.light with custom TextTheme defined '
        'EXPECT equal to default with same text theme and typography 2018', () {
      expect(fCText, equals(nCText));
    });
    // Custom light TextTheme with Primary derived from it equality test.
    final TextTheme fCPText = fLightTD.primaryTextTheme;
    final TextTheme nCPText = nLightTD.primaryTextTheme;
    test(
        'FCS7.93: GIVEN a FlexColorScheme.light with custom PrimaryTextTheme '
        'defined EXPECT the primaryTextTheme to be equal with default '
        'ThemeData with same primary text theme and typography 2018.', () {
      expect(fCPText, equals(nCPText));
    });

    // Dark theme with custom text theme
    final ThemeData fDarkTD = FlexColorScheme.dark(
      textTheme: customText,
      primaryTextTheme: customPrimText,
      applyElevationOverlayColor: false,
    ).toTheme;
    final ThemeData nDarkTD = ThemeData(
      brightness: Brightness.dark,
      textTheme: customText,
      primaryTextTheme: customPrimText,
      primaryColor: nDarkPColor,
      typography: Typography.material2018(),
    );

    // Custom dark TextTheme equality verification.
    final TextTheme fCDText = fDarkTD.textTheme;
    final TextTheme nCDText = nDarkTD.textTheme;
    test(
        'FCS7.94: GIVEN a FlexColorScheme.dark with custom TextTheme defined '
        'EXPECT equal to default with same text theme and typography 2018', () {
      expect(fCDText, equals(nCDText));
    });

    // Custom dark TextTheme with Primary derived from it equality test.
    final TextTheme fCPDText = fDarkTD.primaryTextTheme;
    final TextTheme nCPDText = nDarkTD.primaryTextTheme;
    test(
        'FCS7.95: GIVEN a FlexColorScheme.dark with custom PrimaryTextTheme '
        'defined EXPECT equal to default with same primary text theme and '
        'typography 2018 and primaryColor set as in FlexColorScheme.dark.', () {
      expect(fCPDText, equals(nCPDText));
    });
  });
}
