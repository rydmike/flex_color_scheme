// ignore_for_file: lines_longer_than_80_chars

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  //****************************************************************************
  // FlexColorScheme.toTheme unit tests.
  //
  // The ".toTheme" is the core function of `FlexColorScheme` to return a
  // ThemeData object from the defined color scheme.
  // Below we test that its key properties as as expected.
  //****************************************************************************
  group('FCS7: WITH FlexColorScheme.toTheme ', () {
    TestWidgetsFlutterBinding.ensureInitialized();

    test(
        'FCS7.00-Default: GIVEN FlexColorScheme.light() made with default '
        'EXPECT its ThemeData to be equal to one made with light factory with '
        'only primary color. v5.0.0 test case', () {
      expect(
          FlexColorScheme.light(
            useMaterial3: false,
          ).toScheme.toString(minLevel: DiagnosticLevel.fine),
          equalsIgnoringHashCodes(FlexColorScheme.light(
            useMaterial3: false,
            primary: FlexColor.materialLightPrimary,
          ).toScheme.toString(minLevel: DiagnosticLevel.fine)));
    });

    // TODO(rydmike): toString on ThemeData match, but not ThemeData.
    //   This is repeated for many test cases. It seems like ThemeData
    //   equality comparison cannot be guaranteed when using sub-themes that
    //   uses WidgetState or WidgetStateProperty. Maybe report this.
    //   Investigate first what SDK ThemeData test do, if they even attempt it.
    test(
        'FCS7.01-Default-Light: GIVEN FlexColorScheme.light() made with light '
        'brightness '
        'EXPECT its ThemeData to be equal to one made with light factory '
        'only primary color. v5.0.0 test case', () {
      expect(
        FlexColorScheme.light(
          useMaterial3: false,
        ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexColorScheme.light(
            primary: FlexColor.materialLightPrimary,
            useMaterial3: false,
          ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });

    test(
        'FCS7.02-Default-Dark: GIVEN FlexColorScheme.dark() '
        'EXPECT its ThemeData to be equal to one made with dark factory '
        'only primary color. v5.0.0 test case', () {
      expect(
        FlexColorScheme.dark(
          useMaterial3: false,
        ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexColorScheme.dark(
            primary: FlexColor.materialDarkPrimary,
            primaryLightRef: FlexColor.materialLightPrimary,
            useMaterial3: false,
          ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });

    const ColorScheme schemeLight = ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff6200ee),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffbb86fc),
      onPrimaryContainer: Color(0xff000000),
      primaryFixed: Color(0xffdbc3ff),
      primaryFixedDim: Color(0xffb98cfc),
      onPrimaryFixed: Color(0xff280062),
      onPrimaryFixedVariant: Color(0xff300075),
      secondary: Color(0xff03dac6),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffcefaf8),
      onSecondaryContainer: Color(0xff000000),
      secondaryFixed: Color(0xff73fdf0),
      secondaryFixedDim: Color(0xff40eddd),
      onSecondaryFixed: Color(0xff000000),
      onSecondaryFixedVariant: Color(0xff000000),
      tertiary: Color(0xff018786),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffa4f1ef),
      onTertiaryContainer: Color(0xff000000),
      tertiaryFixed: Color(0xffbfeeed),
      tertiaryFixedDim: Color(0xff8cdbdb),
      onTertiaryFixed: Color(0xff001b1b),
      onTertiaryFixedVariant: Color(0xff002c2c),
      error: Color(0xffb00020),
      onError: Color(0xffffffff),
      errorContainer: Color(0xfffcd8df),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xffffffff),
      onSurface: Color(0xff000000),
      surfaceDim: Color(0xffe0e0e0),
      surfaceBright: Color(0xfffdfdfd),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff8f8f8),
      surfaceContainer: Color(0xfff3f3f3),
      surfaceContainerHigh: Color(0xffededed),
      surfaceContainerHighest: Color(0xffe7e7e7),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff919191),
      outlineVariant: Color(0xffd1d1d1),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff121212),
      onInverseSurface: Color(0xffffffff),
      inversePrimary: Color(0xffda99ff),
      surfaceTint: Color(0xff6200ee),
    );
    test(
        'FCS7.03-Raw-scheme-light: GIVEN FlexColorScheme() made with '
        'raw light color scheme '
        'EXPECT its ColorScheme to be equal to one made with light '
        'factory toString compare. v4.2.0 test case.', () {
      expect(
        FlexColorScheme.light(
          useMaterial3: false,
        ).toScheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          const FlexColorScheme(
            colorScheme: schemeLight,
            useMaterial3: false,
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
          useMaterial3: false,
        ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexColorScheme.light(
            useMaterial3: false,
          ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'FCS7.05-Default-scheme-light-STING: GIVEN FlexColorScheme() made with '
        'default light color scheme '
        'EXPECT its STRING ThemeData to be equal to one made with light '
        'factory and ColorScheme.light v4.2.0 test case.', () {
      expect(
          const FlexColorScheme(
            colorScheme: ColorScheme.light(),
            useMaterial3: false,
          ).toScheme.toString(minLevel: DiagnosticLevel.fine),
          equalsIgnoringHashCodes(FlexColorScheme.light(
            colorScheme: const ColorScheme.light(),
            useMaterial3: false,
          ).toScheme.toString(minLevel: DiagnosticLevel.fine)));
    });
    test(
        'FCS7.05-Default-scheme-light: GIVEN FlexColorScheme() made with '
        'default light color scheme '
        'EXPECT its ThemeData to be equal to one made with light factory '
        'and ColorScheme.light v4.2.0 test case.', () {
      expect(
        const FlexColorScheme(
          colorScheme: ColorScheme.light(),
          useMaterial3: false,
        ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexColorScheme.light(
            colorScheme: const ColorScheme.light(),
            useMaterial3: false,
          ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    const ColorScheme schemeDark = ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffbb86fc),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff6200ee),
      onPrimaryContainer: Color(0xffffffff),
      primaryFixed: Color(0xffdbc3ff),
      primaryFixedDim: Color(0xffb98cfc),
      onPrimaryFixed: Color(0xff280062),
      onPrimaryFixedVariant: Color(0xff300075),
      secondary: Color(0xff03dac6),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xff005047),
      onSecondaryContainer: Color(0xffffffff),
      secondaryFixed: Color(0xff73fdf0),
      secondaryFixedDim: Color(0xff40eddd),
      onSecondaryFixed: Color(0xff000000),
      onSecondaryFixedVariant: Color(0xff000000),
      tertiary: Color(0xff03dac6),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xff003e3e),
      onTertiaryContainer: Color(0xffffffff),
      tertiaryFixed: Color(0xffbfeeed),
      tertiaryFixedDim: Color(0xff8cdbdb),
      onTertiaryFixed: Color(0xff001b1b),
      onTertiaryFixedVariant: Color(0xff002c2c),
      error: Color(0xffcf6679),
      onError: Color(0xff000000),
      errorContainer: Color(0xffb1384e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xff121212),
      onSurface: Color(0xffffffff),
      surfaceDim: Color(0xff060606),
      surfaceBright: Color(0xff2c2c2c),
      surfaceContainerLowest: Color(0xff010101),
      surfaceContainerLow: Color(0xff0e0e0e),
      surfaceContainer: Color(0xff151515),
      surfaceContainerHigh: Color(0xff1d1d1d),
      surfaceContainerHighest: Color(0xff282828),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xff777777),
      outlineVariant: Color(0xff414141),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffffffff),
      onInverseSurface: Color(0xff121212),
      inversePrimary: Color(0xff5a4570),
      surfaceTint: Color(0xffbb86fc),
    );
    test(
        'FCS7.06s-Raw-scheme-dark: GIVEN FlexColorScheme() made with '
        'default dark color scheme '
        'EXPECT its ColorScheme to be equal to one made with dark factory '
        'correcting on error. v4.2.0 test case', () {
      expect(
        FlexColorScheme.dark(
          useMaterial3: false,
        ).toScheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          const FlexColorScheme(
            colorScheme: schemeDark,
            useMaterial3: false,
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
        const FlexColorScheme(
          colorScheme: schemeDark,
          useMaterial3: false,
        ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexColorScheme.dark(
            useMaterial3: false,
          ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        ),
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
          useMaterial3: false,
        ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexColorScheme.dark(
            colorScheme: const ColorScheme.dark(),
            useMaterial3: false,
          ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });

    const FlexColorScheme rawHcLight = FlexColorScheme(
      useMaterial3: false,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xff0000ba),
        onPrimary: Color(0xffffffff),
        primaryContainer: Color(0xffb6b6ff),
        onPrimaryContainer: Color(0xff000000),
        primaryFixed: Color(0xffbfbff8),
        primaryFixedDim: Color(0xff8c8ceb),
        onPrimaryFixed: Color(0xff00003e),
        onPrimaryFixedVariant: Color(0xff000050),
        secondary: Color(0xff66fff9),
        onSecondary: Color(0xff000000),
        secondaryContainer: Color(0xffc8f9f7),
        onSecondaryContainer: Color(0xff000000),
        secondaryFixed: Color(0xffc0f3f1),
        secondaryFixedDim: Color(0xff9dece9),
        onSecondaryFixed: Color(0xff002827),
        onSecondaryFixedVariant: Color(0xff005c58),
        tertiary: Color(0xff018786),
        onTertiary: Color(0xffffffff),
        tertiaryContainer: Color(0xffb3f1f0),
        onTertiaryContainer: Color(0xff000000),
        tertiaryFixed: Color(0xffbfeeed),
        tertiaryFixedDim: Color(0xff8cdbdb),
        onTertiaryFixed: Color(0xff001b1b),
        onTertiaryFixedVariant: Color(0xff002c2c),
        error: Color(0xff790000),
        onError: Color(0xffffffff),
        errorContainer: Color(0xfff1d8d8),
        onErrorContainer: Color(0xff000000),
        surface: Color(0xffffffff),
        onSurface: Color(0xff000000),
        surfaceDim: Color(0xffe0e0e0),
        surfaceBright: Color(0xfffdfdfd),
        surfaceContainerLowest: Color(0xffffffff),
        surfaceContainerLow: Color(0xfff8f8f8),
        surfaceContainer: Color(0xfff3f3f3),
        surfaceContainerHigh: Color(0xffededed),
        surfaceContainerHighest: Color(0xffe7e7e7),
        onSurfaceVariant: Color(0xff000000),
        outline: Color(0xff919191),
        outlineVariant: Color(0xffd1d1d1),
        shadow: Color(0xff000000),
        scrim: Color(0xff000000),
        inverseSurface: Color(0xff121212),
        onInverseSurface: Color(0xffffffff),
        inversePrimary: Color(0xff9999ff),
        surfaceTint: Color(0xff0000ba),
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
          FlexColorScheme.light(
            scheme: FlexScheme.materialHc,
            useMaterial3: false,
          ).toScheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });

    test(
        'FCS7.09-Scheme-hc-light: GIVEN raw FlexColorScheme() made with '
        'overrides '
        'EXPECT its ThemeData to be equal to one made '
        'FlexColorScheme.light(scheme: FlexScheme.materialHc)', () {
      expect(
        rawHcLight.toTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(FlexColorScheme.light(
          scheme: FlexScheme.materialHc,
          useMaterial3: false,
        ).toTheme.toString(minLevel: DiagnosticLevel.fine)),
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
      surface: Color(0xff121212),
      onSurface: Colors.white,
      // Pre-inverted for light to be correct as is.
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
      error: const Color(0xff790000),
      onSurface: Colors.black,
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
            useMaterial3: false,
          ).toScheme.toString(minLevel: DiagnosticLevel.fine),
          equalsIgnoringHashCodes(FlexColorScheme.light(
            colorScheme: overrideScheme,
            useMaterial3: false,
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
          useMaterial3: false,
        ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexColorScheme.light(
            colorScheme: overrideScheme,
            useMaterial3: false,
          ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });

    const ColorScheme hcDarkWithLight = ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffaaaaaa),
      onPrimary: Color(0xffaaaaaa),
      primaryContainer: Color(0xffaaaaaa),
      onPrimaryContainer: Color(0xffaaaaaa),
      secondary: Color(0xff66fff9),
      onSecondary: Color(0xffaaaaaa),
      secondaryContainer: Color(0xffaaaaaa),
      onSecondaryContainer: Color(0xffaaaaaa),
      tertiary: Color(0xffaaaaaa),
      onTertiary: Color(0xffaaaaaa),
      tertiaryContainer: Color(0xffaaaaaa),
      onTertiaryContainer: Color(0xffaaaaaa),
      error: Color(0xffaaaaaa),
      onError: Color(0xffaaaaaa),
      errorContainer: Color(0xffaaaaaa),
      onErrorContainer: Color(0xffaaaaaa),
      surface: Color(0xffffffff),
      onSurface: Color(0xff000000),
      // Light colors that will be created by light scheme defaults
      // but cannot be overridden via passed in properties to raw constructor.

      primaryFixed: Color(0xffbfbff8),
      primaryFixedDim: Color(0xff8c8ceb),
      onPrimaryFixed: Color(0xff00003e),
      onPrimaryFixedVariant: Color(0xff000050),
      secondaryFixed: Color(0xffc0f3f1),
      secondaryFixedDim: Color(0xff9dece9),
      onSecondaryFixed: Color(0xff002827),
      onSecondaryFixedVariant: Color(0xff005c58),
      tertiaryFixed: Color(0xffbfeeed),
      tertiaryFixedDim: Color(0xff8cdbdb),
      onTertiaryFixed: Color(0xff001b1b),
      onTertiaryFixedVariant: Color(0xff002c2c),
      surfaceDim: Color(0xffe0e0e0),
      surfaceBright: Color(0xfffdfdfd),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff8f8f8),
      surfaceContainer: Color(0xfff3f3f3),
      surfaceContainerHigh: Color(0xffededed),
      surfaceContainerHighest: Color(0xffe7e7e7),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff919191),
      outlineVariant: Color(0xffd1d1d1),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff121212),
      onInverseSurface: Color(0xffffffff),
      inversePrimary: Color(0xff9999ff),
      surfaceTint: Color(0xff0000ba),
    );

    const FlexColorScheme hcLightWithLight = FlexColorScheme(
      useMaterial3: false,
      colorScheme: hcDarkWithLight,
      brightness: Brightness.light,
      primary: Color(0xff0000ba),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffb6b6ff),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xff66fff9),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffc8f9f7),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xff018786),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffb3f1f0),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xff790000),
      onError: Color(0xffffffff),
      errorContainer: Color(0xfff1d8d8),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xffffffff),
      onSurface: Color(0xff000000),
    );

    final FlexColorScheme hcLight = FlexColorScheme.light(
      scheme: FlexScheme.materialHc,
      useMaterial3: false,
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
      expect(
        hcLightWithLight.toTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          hcLight.toTheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });

    // Dark default color scheme
    const FlexColorScheme darkDefault = FlexColorScheme(
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xffefb7ff),
        onPrimary: Color(0xff000000),
        primaryContainer: Color(0xffbe9eff),
        onPrimaryContainer: Color(0xff000000),
        primaryFixed: Color(0xfff2e4f6),
        primaryFixedDim: Color(0xffe8cfef),
        onPrimaryFixed: Color(0xff520069),
        onPrimaryFixedVariant: Color(0xff8000a5),
        secondary: Color(0xff66fff9),
        onSecondary: Color(0xff000000),
        secondaryContainer: Color(0xff66fff9),
        onSecondaryContainer: Color(0xff000000),
        secondaryFixed: Color(0xffc0f3f1),
        secondaryFixedDim: Color(0xff9dece9),
        onSecondaryFixed: Color(0xff002827),
        onSecondaryFixedVariant: Color(0xff005c58),
        tertiary: Color(0xff66fff9),
        onTertiary: Color(0xff000000),
        tertiaryContainer: Color(0xff66fff9),
        onTertiaryContainer: Color(0xff000000),
        tertiaryFixed: Color(0xffc0f3f1),
        tertiaryFixedDim: Color(0xff9dece9),
        onTertiaryFixed: Color(0xff002827),
        onTertiaryFixedVariant: Color(0xff005c58),
        error: Color(0xff9b374d),
        onError: Color(0xff000000),
        errorContainer: Color(0xff632331),
        onErrorContainer: Color(0xffffffff),
        surface: Color(0xff121212),
        onSurface: Color(0xffffffff),
        surfaceDim: Color(0xff060606),
        surfaceBright: Color(0xff2c2c2c),
        surfaceContainerLowest: Color(0xff010101),
        surfaceContainerLow: Color(0xff0e0e0e),
        surfaceContainer: Color(0xff151515),
        surfaceContainerHigh: Color(0xff1d1d1d),
        surfaceContainerHighest: Color(0xff282828),
        onSurfaceVariant: Color(0xffffffff),
        outline: Color(0xff777777),
        outlineVariant: Color(0xff414141),
        shadow: Color(0xff000000),
        scrim: Color(0xff000000),
        inverseSurface: Color(0xffffffff),
        onInverseSurface: Color(0xff121212),
        inversePrimary: Color(0xff6f5970),
        surfaceTint: Color(0xffefb7ff),
      ),
      useMaterial3: false,
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
      surface: const Color(0xff121212),
      onSurface: Colors.white,
      useMaterial3: false,
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
        darkDefault.toTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          darkFactoryDefault.toTheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });

    // Raw High contrast dark scheme
    const FlexColorScheme hcDarkDefault = FlexColorScheme(
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xffefb7ff),
        onPrimary: Color(0xff000000),
        primaryContainer: Color(0xff8a61db),
        onPrimaryContainer: Color(0xffffffff),
        primaryFixed: Color(0xffbfbff8),
        primaryFixedDim: Color(0xff8c8ceb),
        onPrimaryFixed: Color(0xff00003e),
        onPrimaryFixedVariant: Color(0xff000050),
        secondary: Color(0xff66fff9),
        onSecondary: Color(0xff000000),
        secondaryContainer: Color(0xff00504d),
        onSecondaryContainer: Color(0xffffffff),
        secondaryFixed: Color(0xffc0f3f1),
        secondaryFixedDim: Color(0xff9dece9),
        onSecondaryFixed: Color(0xff002827),
        onSecondaryFixedVariant: Color(0xff005c58),
        tertiary: Color(0xff66fff9),
        onTertiary: Color(0xff000000),
        tertiaryContainer: Color(0xff043232),
        onTertiaryContainer: Color(0xffffffff),
        tertiaryFixed: Color(0xffbfeeed),
        tertiaryFixedDim: Color(0xff8cdbdb),
        onTertiaryFixed: Color(0xff001b1b),
        onTertiaryFixedVariant: Color(0xff002c2c),
        error: Color(0xff9b374d),
        onError: Color(0xff000000),
        errorContainer: Color(0xff632331),
        onErrorContainer: Color(0xffffffff),
        surface: Color(0xff121212),
        onSurface: Color(0xffffffff),
        surfaceDim: Color(0xff060606),
        surfaceBright: Color(0xff2c2c2c),
        surfaceContainerLowest: Color(0xff010101),
        surfaceContainerLow: Color(0xff0e0e0e),
        surfaceContainer: Color(0xff151515),
        surfaceContainerHigh: Color(0xff1d1d1d),
        surfaceContainerHighest: Color(0xff282828),
        onSurfaceVariant: Color(0xffffffff),
        outline: Color(0xff777777),
        outlineVariant: Color(0xff414141),
        shadow: Color(0xff000000),
        scrim: Color(0xff000000),
        inverseSurface: Color(0xffffffff),
        onInverseSurface: Color(0xff121212),
        inversePrimary: Color(0xff6f5970),
        surfaceTint: Color(0xffefb7ff),
      ),
      useMaterial3: false,
    );

    // Dark factory based high contrast dark scheme
    final FlexColorScheme hcDarkFactoryDefault = FlexColorScheme.dark(
      scheme: FlexScheme.materialHc,
      useMaterial3: false,
    );

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
        hcDarkDefault.toTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          hcDarkFactoryDefault.toTheme.toString(minLevel: DiagnosticLevel.fine),
        ),
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
      secondary: Color(0xffaaaaaa),
      onSecondary: Color(0xffaaaaaa),
      secondaryContainer: Color(0xffaaaaaa),
      onSecondaryContainer: Color(0xffaaaaaa),
      tertiary: Color(0xffaaaaaa),
      onTertiary: Color(0xffaaaaaa),
      tertiaryContainer: Color(0xffaaaaaa),
      onTertiaryContainer: Color(0xffaaaaaa),
      error: Color(0xffaaaaaa),
      onError: Color(0xffaaaaaa),
      errorContainer: Color(0xffaaaaaa),
      onErrorContainer: Color(0xffaaaaaa),
      surface: Color(0xff121212),
      onSurface: Color(0xffffffff),
      // Dark colors that will be created by dark scheme defaults
      // but cannot be overridden via passed in properties to raw constructor.
      primaryFixed: Color(0xffbfbff8),
      primaryFixedDim: Color(0xff8c8ceb),
      onPrimaryFixed: Color(0xff00003e),
      onPrimaryFixedVariant: Color(0xff000050),
      secondaryFixed: Color(0xffc0f3f1),
      secondaryFixedDim: Color(0xff9dece9),
      onSecondaryFixed: Color(0xff002827),
      onSecondaryFixedVariant: Color(0xff005c58),
      tertiaryFixed: Color(0xffbfeeed),
      tertiaryFixedDim: Color(0xff8cdbdb),
      onTertiaryFixed: Color(0xff001b1b),
      onTertiaryFixedVariant: Color(0xff002c2c),
      surfaceDim: Color(0xff060606),
      surfaceBright: Color(0xff2c2c2c),
      surfaceContainerLowest: Color(0xff010101),
      surfaceContainerLow: Color(0xff0e0e0e),
      surfaceContainer: Color(0xff151515),
      surfaceContainerHigh: Color(0xff1d1d1d),
      surfaceContainerHighest: Color(0xff282828),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xff777777),
      outlineVariant: Color(0xff414141),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffffffff),
      onInverseSurface: Color(0xff121212),
      inversePrimary: Color(0xff6f5970),
      surfaceTint: Color(0xffefb7ff),
    );

    const FlexColorScheme rawHcFCS = FlexColorScheme(
      colorScheme: hcLightWithDark,
      brightness: Brightness.dark,
      primary: Color(0xffefb7ff),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff8a61db),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff66fff9),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xff00504d),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff66fff9),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xff043232),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff9b374d),
      onError: Color(0xff000000),
      errorContainer: Color(0xff632331),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xff121212),
      onSurface: Color(0xffffffff),
      useMaterial3: false,
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
      expect(
        rawHcFCS.toTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          hcDarkFactoryDefault.toTheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });

    test(
        'FCS7.19-Scheme-hc-dark-M2: GIVEN FlexColorScheme() made with '
        'raw high contrast dark color scheme '
        'EXPECT its ColorScheme string to be equal to one made with '
        'dark factory and color overrides. v4.2.0 test case.', () {
      expect(
        const FlexColorScheme(
          colorScheme: ColorScheme(
            brightness: Brightness.dark,
            primary: Color(0xffefb7ff),
            onPrimary: Color(0xff000000),
            primaryContainer: Color(0xffbe9eff),
            onPrimaryContainer: Color(0xff000000),
            primaryFixed: Color(0xfff2e4f6),
            primaryFixedDim: Color(0xffe8cfef),
            onPrimaryFixed: Color(0xff520069),
            onPrimaryFixedVariant: Color(0xff8000a5),
            secondary: Color(0xff66fff9),
            onSecondary: Color(0xff000000),
            secondaryContainer: Color(0xff66fff9),
            onSecondaryContainer: Color(0xff000000),
            secondaryFixed: Color(0xffc0f3f1),
            secondaryFixedDim: Color(0xff9dece9),
            onSecondaryFixed: Color(0xff002827),
            onSecondaryFixedVariant: Color(0xff005c58),
            tertiary: Color(0xff03dac6),
            onTertiary: Color(0xff000000),
            tertiaryContainer: Color(0xff03dac6),
            onTertiaryContainer: Color(0xff000000),
            tertiaryFixed: Color(0xff73fdf0),
            tertiaryFixedDim: Color(0xff40eddd),
            onTertiaryFixed: Color(0xff000000),
            onTertiaryFixedVariant: Color(0xff000000),
            error: Color(0xff9b374d),
            onError: Color(0xffffffff),
            errorContainer: Color(0xff632331),
            onErrorContainer: Color(0xffffffff),
            surface: Color(0xff121212),
            onSurface: Color(0xffffffff),
            surfaceDim: Color(0xff060606),
            surfaceBright: Color(0xff2c2c2c),
            surfaceContainerLowest: Color(0xff010101),
            surfaceContainerLow: Color(0xff0e0e0e),
            surfaceContainer: Color(0xff151515),
            surfaceContainerHigh: Color(0xff1d1d1d),
            surfaceContainerHighest: Color(0xff282828),
            onSurfaceVariant: Color(0xffffffff),
            outline: Color(0xff777777),
            outlineVariant: Color(0xff414141),
            shadow: Color(0xff000000),
            scrim: Color(0xff000000),
            inverseSurface: Color(0xffffffff),
            onInverseSurface: Color(0xff121212),
            inversePrimary: Color(0xff6f5970),
            surfaceTint: Color(0xffefb7ff),
          ),
          useMaterial3: false,
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
            error: const Color(0xff9b374d),
            onPrimary: Colors.black,
            onPrimaryContainer: Colors.black,
            onSecondary: Colors.black,
            onSecondaryContainer: Colors.black,
            onSurface: Colors.white,
            onError: Colors.white,
            useMaterial3: false,
          ).toScheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'FCS7.19-ThemeData-hc-dark-M2: GIVEN FlexColorScheme() made with '
        'raw high contrast dark color scheme '
        'EXPECT its ThemeData string to be equal to one made with '
        'dark factory and color overrides. v4.2.0 test case.', () {
      expect(
        const FlexColorScheme(
          colorScheme: ColorScheme(
            brightness: Brightness.dark,
            primary: Color(0xffefb7ff),
            onPrimary: Color(0xff000000),
            primaryContainer: Color(0xffbe9eff),
            onPrimaryContainer: Color(0xff000000),
            primaryFixed: Color(0xfff2e4f6),
            primaryFixedDim: Color(0xffe8cfef),
            onPrimaryFixed: Color(0xff520069),
            onPrimaryFixedVariant: Color(0xff8000a5),
            secondary: Color(0xff66fff9),
            onSecondary: Color(0xff000000),
            secondaryContainer: Color(0xff66fff9),
            onSecondaryContainer: Color(0xff000000),
            secondaryFixed: Color(0xffc0f3f1),
            secondaryFixedDim: Color(0xff9dece9),
            onSecondaryFixed: Color(0xff002827),
            onSecondaryFixedVariant: Color(0xff005c58),
            tertiary: Color(0xff03dac6),
            onTertiary: Color(0xff000000),
            tertiaryContainer: Color(0xff03dac6),
            onTertiaryContainer: Color(0xff000000),
            tertiaryFixed: Color(0xff73fdf0),
            tertiaryFixedDim: Color(0xff40eddd),
            onTertiaryFixed: Color(0xff000000),
            onTertiaryFixedVariant: Color(0xff000000),
            error: Color(0xff9b374d),
            onError: Color(0xffffffff),
            errorContainer: Color(0xff632331),
            onErrorContainer: Color(0xffffffff),
            surface: Color(0xff121212),
            onSurface: Color(0xffffffff),
            surfaceDim: Color(0xff060606),
            surfaceBright: Color(0xff2c2c2c),
            surfaceContainerLowest: Color(0xff010101),
            surfaceContainerLow: Color(0xff0e0e0e),
            surfaceContainer: Color(0xff151515),
            surfaceContainerHigh: Color(0xff1d1d1d),
            surfaceContainerHighest: Color(0xff282828),
            onSurfaceVariant: Color(0xffffffff),
            outline: Color(0xff777777),
            outlineVariant: Color(0xff414141),
            shadow: Color(0xff000000),
            scrim: Color(0xff000000),
            inverseSurface: Color(0xffffffff),
            onInverseSurface: Color(0xff121212),
            inversePrimary: Color(0xff6f5970),
            surfaceTint: Color(0xffefb7ff),
          ),
          useMaterial3: false,
        ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexColorScheme.dark(
            primary: const Color(0xffefb7ff),
            primaryContainer: const Color(0xffbe9eff),
            secondary: const Color(0xff66fff9),
            secondaryContainer: const Color(0xff66fff9),
            tertiary: const Color(0xff03dac6),
            tertiaryContainer: const Color(0xff03dac6),
            surface: const Color(0xff121212),
            error: const Color(0xff9b374d),
            onPrimary: Colors.black,
            onPrimaryContainer: Colors.black,
            onSecondary: Colors.black,
            onSecondaryContainer: Colors.black,
            onSurface: Colors.white,
            onError: Colors.white,
            useMaterial3: false,
          ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });

    test(
        'FCS7.20-Scheme-hc-dark-M3: GIVEN FlexColorScheme() made with '
        'raw high contrast dark color scheme '
        'EXPECT its ColorScheme string to be equal to one made with '
        'dark factory and color overrides. v4.2.0 test case.', () {
      expect(
        const FlexColorScheme(
          colorScheme: ColorScheme(
            brightness: Brightness.dark,
            primary: Color(0xffefb7ff),
            onPrimary: Color(0xff000000),
            primaryContainer: Color(0xffbe9eff),
            onPrimaryContainer: Color(0xff000000),
            primaryFixed: Color(0xfff2e4f6),
            primaryFixedDim: Color(0xffe8cfef),
            onPrimaryFixed: Color(0xff520069),
            onPrimaryFixedVariant: Color(0xff8000a5),
            secondary: Color(0xff66fff9),
            onSecondary: Color(0xff000000),
            secondaryContainer: Color(0xff66fff9),
            onSecondaryContainer: Color(0xff000000),
            secondaryFixed: Color(0xffc0f3f1),
            secondaryFixedDim: Color(0xff9dece9),
            onSecondaryFixed: Color(0xff002827),
            onSecondaryFixedVariant: Color(0xff005c58),
            tertiary: Color(0xff03dac6),
            onTertiary: Color(0xff000000),
            tertiaryContainer: Color(0xff03dac6),
            onTertiaryContainer: Color(0xff000000),
            tertiaryFixed: Color(0xff73fdf0),
            tertiaryFixedDim: Color(0xff40eddd),
            onTertiaryFixed: Color(0xff000000),
            onTertiaryFixedVariant: Color(0xff000000),
            error: Color(0xff9b374d),
            onError: Color(0xffffffff),
            errorContainer: Color(0xff93000a),
            onErrorContainer: Color(0xffffffff),
            surface: Color(0xff121212),
            onSurface: Color(0xffffffff),
            surfaceDim: Color(0xff060606),
            surfaceBright: Color(0xff2c2c2c),
            surfaceContainerLowest: Color(0xff010101),
            surfaceContainerLow: Color(0xff0e0e0e),
            surfaceContainer: Color(0xff151515),
            surfaceContainerHigh: Color(0xff1d1d1d),
            surfaceContainerHighest: Color(0xff282828),
            onSurfaceVariant: Color(0xffcacaca),
            outline: Color(0xff777777),
            outlineVariant: Color(0xff414141),
            shadow: Color(0xff000000),
            scrim: Color(0xff000000),
            inverseSurface: Color(0xffe8e8e8),
            onInverseSurface: Color(0xff2a2a2a),
            inversePrimary: Color(0xff6f5970),
            surfaceTint: Color(0xffefb7ff),
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
            error: const Color(0xff9b374d),
            onPrimary: Colors.black,
            onPrimaryContainer: Colors.black,
            onSecondary: Colors.black,
            onSecondaryContainer: Colors.black,
            onSurface: Colors.white,
            onError: Colors.white,
          ).toScheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });

    test(
        'FCS7.20-Scheme-hc-dark-M3: GIVEN FlexColorScheme() made with '
        'raw high contrast dark color scheme '
        'EXPECT its ThemeData string to be equal to one made with '
        'dark factory and color overrides. v4.2.0 test case.', () {
      expect(
        const FlexColorScheme(
          colorScheme: ColorScheme(
            brightness: Brightness.dark,
            primary: Color(0xffefb7ff),
            onPrimary: Color(0xff000000),
            primaryContainer: Color(0xffbe9eff),
            onPrimaryContainer: Color(0xff000000),
            primaryFixed: Color(0xfff2e4f6),
            primaryFixedDim: Color(0xffe8cfef),
            onPrimaryFixed: Color(0xff520069),
            onPrimaryFixedVariant: Color(0xff8000a5),
            secondary: Color(0xff66fff9),
            onSecondary: Color(0xff000000),
            secondaryContainer: Color(0xff66fff9),
            onSecondaryContainer: Color(0xff000000),
            secondaryFixed: Color(0xffc0f3f1),
            secondaryFixedDim: Color(0xff9dece9),
            onSecondaryFixed: Color(0xff002827),
            onSecondaryFixedVariant: Color(0xff005c58),
            tertiary: Color(0xff03dac6),
            onTertiary: Color(0xff000000),
            tertiaryContainer: Color(0xff03dac6),
            onTertiaryContainer: Color(0xff000000),
            tertiaryFixed: Color(0xff73fdf0),
            tertiaryFixedDim: Color(0xff40eddd),
            onTertiaryFixed: Color(0xff000000),
            onTertiaryFixedVariant: Color(0xff000000),
            error: Color(0xff9b374d),
            onError: Color(0xffffffff),
            errorContainer: Color(0xff93000a),
            onErrorContainer: Color(0xffffffff),
            surface: Color(0xff121212),
            onSurface: Color(0xffffffff),
            surfaceDim: Color(0xff060606),
            surfaceBright: Color(0xff2c2c2c),
            surfaceContainerLowest: Color(0xff010101),
            surfaceContainerLow: Color(0xff0e0e0e),
            surfaceContainer: Color(0xff151515),
            surfaceContainerHigh: Color(0xff1d1d1d),
            surfaceContainerHighest: Color(0xff282828),
            onSurfaceVariant: Color(0xffcacaca),
            outline: Color(0xff777777),
            outlineVariant: Color(0xff414141),
            shadow: Color(0xff000000),
            scrim: Color(0xff000000),
            inverseSurface: Color(0xffe8e8e8),
            onInverseSurface: Color(0xff2a2a2a),
            inversePrimary: Color(0xff6f5970),
            surfaceTint: Color(0xffefb7ff),
          ),
        ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexColorScheme.dark(
            primary: const Color(0xffefb7ff),
            primaryContainer: const Color(0xffbe9eff),
            secondary: const Color(0xff66fff9),
            secondaryContainer: const Color(0xff66fff9),
            tertiary: const Color(0xff03dac6),
            tertiaryContainer: const Color(0xff03dac6),
            surface: const Color(0xff121212),
            error: const Color(0xff9b374d),
            onPrimary: Colors.black,
            onPrimaryContainer: Colors.black,
            onSecondary: Colors.black,
            onSecondaryContainer: Colors.black,
            onSurface: Colors.white,
            onError: Colors.white,
          ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });

    // TODO(rydmike): These past test cases are not valid anymore in V8.
    // The RAW constructor cannot produce same theme and scheme as basic
    // factory constructors in V8 anymore.
    //
    // test(
    //     'FCS7.20RawL String: GIVEN FlexColorScheme() made with min required '
    //     'light params that equals default Material light scheme '
    //     'EXPECT its ColorScheme to be equal to one made with light scheme with '
    //     'no parameters.', () {
    //   expect(
    //       const FlexColorScheme(
    //         brightness: Brightness.light,
    //         primary: FlexColor.materialLightPrimary,
    //         primaryContainer: FlexColor.materialLightPrimaryContainer,
    //         secondary: FlexColor.materialLightSecondary,
    //         secondaryContainer: FlexColor.materialLightSecondaryContainer,
    //         tertiary: FlexColor.materialLightTertiary,
    //         tertiaryContainer: FlexColor.materialLightTertiaryContainer,
    //         useMaterial3: false,
    //       ).toScheme.toString(minLevel: DiagnosticLevel.fine),
    //       equalsIgnoringHashCodes(FlexColorScheme.light(
    //         useMaterial3: false,
    //       ).toScheme.toString(minLevel: DiagnosticLevel.fine)));
    // });
    //
    // test(
    //     'FCS7.21RawL: GIVEN FlexColorScheme() made with min required light '
    //     'params that equals default Material light scheme '
    //     'EXPECT its ThemeData to be equal to one made with light scheme with '
    //     'no parameters.', () {
    //   expect(
    //     const FlexColorScheme(
    //       brightness: Brightness.light,
    //       primary: FlexColor.materialLightPrimary,
    //       primaryContainer: FlexColor.materialLightPrimaryContainer,
    //       secondary: FlexColor.materialLightSecondary,
    //       secondaryContainer: FlexColor.materialLightSecondaryContainer,
    //       tertiary: FlexColor.materialLightTertiary,
    //       tertiaryContainer: FlexColor.materialLightTertiaryContainer,
    //       useMaterial3: false,
    //     ).toTheme.toString(minLevel: DiagnosticLevel.fine),
    //     equalsIgnoringHashCodes(
    //       FlexColorScheme.light(
    //         useMaterial3: false,
    //       ).toTheme.toString(minLevel: DiagnosticLevel.fine),
    //     ),
    //   );
    // });

    test(
        'FCS7.22DefL: GIVEN FlexColorScheme.light made with no parameters '
        'EXPECT its ThemeData to be equal to one made with light scheme.', () {
      expect(
        FlexColorScheme.light(
          useMaterial3: false,
        ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexColorScheme.light(
            colors: FlexColor.schemes[FlexScheme.material]!.light,
            useMaterial3: false,
          ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'FCS7.23L: GIVEN two FlexColorScheme.light made with identical '
        'parameters EXPECT their ThemeData to be equal.', () {
      expect(
        FlexColorScheme.light(
          colors: FlexColor.schemes[FlexScheme.material]!.light,
          useMaterial3: false,
        ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexColorScheme.light(
            colors: FlexColor.schemes[FlexScheme.material]!.light,
            useMaterial3: false,
          ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'FCS7.24L: GIVEN a FlexColorScheme.light made with no '
        'parameters EXPECT ThemeData to be equal to one made with '
        'scheme FlexScheme.material.', () {
      expect(
        FlexColorScheme.light(
          useMaterial3: false,
        ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexColorScheme.light(
            scheme: FlexScheme.material,
            useMaterial3: false,
          ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'FCS7.25L: GIVEN a FlexColorScheme.light made with colors '
        'material EXPECT ThemeData to be equal to one made with '
        'scheme FlexScheme.material.', () {
      expect(
        FlexColorScheme.light(
          colors: FlexColor.schemes[FlexScheme.material]!.light,
          useMaterial3: false,
        ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexColorScheme.light(
            scheme: FlexScheme.material,
            useMaterial3: false,
          ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'FCS7.26L: GIVEN a FlexColorScheme.light made with scheme '
        'material EXPECT ThemeData to be equal to one made with '
        'no params.', () {
      expect(
        FlexColorScheme.light(
          colors: FlexColor.schemes[FlexScheme.material]!.light,
          useMaterial3: false,
        ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexColorScheme.light(
            useMaterial3: false,
          ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });

    test(
        'FCS7.27RawD: GIVEN FlexColorScheme() made with min required dark '
        'params that equals default Material dark scheme '
        'EXPECT its ThemeData to be equal to one made with dark scheme with '
        'no parameters.', () {
      expect(
        FlexColorScheme.dark(
          useMaterial3: false,
          colors: const FlexSchemeColor(
            primary: FlexColor.materialDarkPrimary,
            primaryContainer: FlexColor.materialDarkPrimaryContainer,
            primaryLightRef: FlexColor.materialLightPrimary,
            secondary: FlexColor.materialDarkSecondary,
            secondaryContainer: FlexColor.materialDarkSecondaryContainer,
            secondaryLightRef: FlexColor.materialLightSecondary,
            tertiary: FlexColor.materialDarkTertiary,
            tertiaryContainer: FlexColor.materialDarkTertiaryContainer,
            tertiaryLightRef: FlexColor.materialLightTertiary,
          ),
        ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexColorScheme.dark(
            useMaterial3: false,
          ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });

    // themeDark = Default material dark scheme colors.
    test(
        'FCS7.28SwapL: GIVEN FlexColorScheme.light(swapColors: true) EXPECT it '
        'to be equal to one made with light scheme colors swapped ', () {
      expect(
        FlexColorScheme.light(
          useMaterial3: false,
          swapColors: true,
        ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexColorScheme.light(
            useMaterial3: false,
            colors: const FlexSchemeColor(
              primary: FlexColor.materialLightSecondary,
              primaryContainer: FlexColor.materialLightSecondaryContainer,
              primaryLightRef: FlexColor.materialLightSecondary,
              secondary: FlexColor.materialLightPrimary,
              secondaryContainer: FlexColor.materialLightPrimaryContainer,
              secondaryLightRef: FlexColor.materialLightPrimary,
              tertiary: FlexColor.materialLightTertiary,
              tertiaryContainer: FlexColor.materialLightTertiaryContainer,
              tertiaryLightRef: FlexColor.materialLightTertiary,
            ),
          ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });

    // themeDark = Default material dark scheme colors.
    test(
        'FCS7.29SwapD: GIVEN FlexColorScheme.dark(swapColors: true) EXPECT it '
        'to be equal to one made with dark scheme colors swapped ', () {
      expect(
        FlexColorScheme.dark(
          useMaterial3: false,
          swapColors: true,
        ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexColorScheme.dark(
            useMaterial3: false,
            colors: const FlexSchemeColor(
              primary: FlexColor.materialDarkSecondary,
              primaryContainer: FlexColor.materialDarkSecondaryContainer,
              primaryLightRef: FlexColor.materialLightSecondary,
              secondary: FlexColor.materialDarkPrimary,
              secondaryContainer: FlexColor.materialDarkPrimaryContainer,
              secondaryLightRef: FlexColor.materialLightPrimary,
              tertiary: FlexColor.materialDarkTertiary,
              tertiaryContainer: FlexColor.materialDarkTertiaryContainer,
              tertiaryLightRef: FlexColor.materialLightTertiary,
            ),
          ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });

    test(
        'FCS7.30DefL: GIVEN FlexColorScheme.dark made with no parameters '
        'EXPECT its ThemeData to be equal to one made with light scheme.', () {
      expect(
        FlexColorScheme.dark().toTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexColorScheme.dark(
            colors: FlexColor.schemes[FlexScheme.materialBaseline]!.dark,
          ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'FCS7.31D: GIVEN two FlexColorScheme.dark made with identical '
        'parameters EXPECT their ThemeData to be equal.', () {
      expect(
        FlexColorScheme.dark(
          colors: FlexColor.schemes[FlexScheme.material]!.dark,
        ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexColorScheme.dark(
            colors: FlexColor.schemes[FlexScheme.material]!.dark,
          ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'FCS7.32D: GIVEN a FlexColorScheme.dark made with no '
        'parameters EXPECT ThemeData to be equal to one made with '
        'scheme FlexScheme.material.', () {
      expect(
        FlexColorScheme.dark().toTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexColorScheme.dark(scheme: FlexScheme.materialBaseline)
              .toTheme
              .toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'FCS7.33D: GIVEN a FlexColorScheme.dark made with colors '
        'material EXPECT ThemeData to be equal to one made with '
        'scheme FlexScheme.material.', () {
      expect(
        FlexColorScheme.dark(
          colors: FlexColor.schemes[FlexScheme.material]!.dark,
        ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexColorScheme.dark(
            scheme: FlexScheme.material,
          ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'FCS7.34D: GIVEN a FlexColorScheme.dark made with scheme '
        'material EXPECT ThemeData to be equal to one made with '
        'no params.', () {
      expect(
        FlexColorScheme.dark(
          colors: FlexColor.schemes[FlexScheme.materialBaseline]!.dark,
        ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexColorScheme.dark()
              .toTheme
              .toString(minLevel: DiagnosticLevel.fine),
        ),
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
        ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          const FlexColorScheme(
            brightness: Brightness.light,
            primary: FlexColor.materialLightPrimary,
            primaryContainer: FlexColor.materialLightPrimaryContainer,
            secondary: FlexColor.materialLightSecondary,
            secondaryContainer: FlexColor.materialLightTertiary,
          ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        ),
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
        ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          const FlexColorScheme(
            brightness: Brightness.dark,
            primary: FlexColor.materialDarkPrimary,
            primaryContainer: FlexColor.materialDarkPrimaryContainer,
            secondary: FlexColor.materialDarkSecondary,
            secondaryContainer: FlexColor.materialDarkTertiary,
          ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });

    // themeLight = Default material light scheme colors.
    final ThemeData themeLight = const FlexColorScheme(
      useMaterial3: false,
      brightness: Brightness.light,
      primary: FlexColor.materialLightPrimary,
      primaryContainer: FlexColor.materialLightPrimaryContainer,
      secondary: FlexColor.materialLightSecondary,
      secondaryContainer: FlexColor.materialLightTertiary,
    ).toTheme;
    const ColorScheme lightScheme = ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff6200ee),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffbb86fc),
      onPrimaryContainer: Color(0xff000000),
      primaryFixed: Color(0xff6200ee),
      primaryFixedDim: Color(0xff6200ee),
      onPrimaryFixed: Color(0xffffffff),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondary: Color(0xff03dac6),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xff018786),
      onSecondaryContainer: Color(0xffffffff),
      secondaryFixed: Color(0xff03dac6),
      secondaryFixedDim: Color(0xff03dac6),
      onSecondaryFixed: Color(0xff000000),
      onSecondaryFixedVariant: Color(0xff000000),
      tertiary: Color(0xff03dac6),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xff03dac6),
      onTertiaryContainer: Color(0xff000000),
      tertiaryFixed: Color(0xff03dac6),
      tertiaryFixedDim: Color(0xff03dac6),
      onTertiaryFixed: Color(0xff000000),
      onTertiaryFixedVariant: Color(0xff000000),
      error: Color(0xffb00020),
      onError: Color(0xffffffff),
      errorContainer: Color(0xfffcd8df),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xffffffff),
      onSurface: Color(0xff000000),
      surfaceDim: Color(0xffffffff),
      surfaceBright: Color(0xffffffff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffffffff),
      surfaceContainer: Color(0xffffffff),
      surfaceContainerHigh: Color(0xffffffff),
      surfaceContainerHighest: Color(0xffffffff),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff919191),
      outlineVariant: Color(0xffd1d1d1),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff121212),
      onInverseSurface: Color(0xffffffff),
      inversePrimary: Color(0xffda99ff),
      surfaceTint: Color(0xff6200ee),
      // background: Color(0xffffffff),
      // onBackground: Color(0xff000000),
      // surfaceVariant: Color(0xffffffff),
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

    // themeDark = Default material dark scheme colors.
    final ThemeData themeDark = const FlexColorScheme(
      useMaterial3: false,
      brightness: Brightness.dark,
      primary: FlexColor.materialDarkPrimary,
      primaryContainer: FlexColor.materialDarkPrimaryContainer,
      secondary: FlexColor.materialDarkSecondary,
      secondaryContainer: FlexColor.materialDarkTertiary,
    ).toTheme;

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
            primaryFixed: Color(0xffbb86fc),
            primaryFixedDim: Color(0xffbb86fc),
            onPrimaryFixed: Color(0xff000000),
            onPrimaryFixedVariant: Color(0xff000000),
            secondary: Color(0xff03dac6),
            onSecondary: Color(0xff000000),
            secondaryContainer: Color(0xff03dac6),
            onSecondaryContainer: Color(0xff000000),
            secondaryFixed: Color(0xff03dac6),
            secondaryFixedDim: Color(0xff03dac6),
            onSecondaryFixed: Color(0xff000000),
            onSecondaryFixedVariant: Color(0xff000000),
            tertiary: Color(0xff03dac6),
            onTertiary: Color(0xff000000),
            tertiaryContainer: Color(0xff03dac6),
            onTertiaryContainer: Color(0xff000000),
            tertiaryFixed: Color(0xff03dac6),
            tertiaryFixedDim: Color(0xff03dac6),
            onTertiaryFixed: Color(0xff000000),
            onTertiaryFixedVariant: Color(0xff000000),
            error: Color(0xffcf6679),
            onError: Color(0xff000000),
            errorContainer: Color(0xffb1384e),
            onErrorContainer: Color(0xffffffff),
            surface: Color(0xff121212),
            onSurface: Color(0xffffffff),
            surfaceDim: Color(0xff121212),
            surfaceBright: Color(0xff121212),
            surfaceContainerLowest: Color(0xff121212),
            surfaceContainerLow: Color(0xff121212),
            surfaceContainer: Color(0xff121212),
            surfaceContainerHigh: Color(0xff121212),
            surfaceContainerHighest: Color(0xff121212),
            onSurfaceVariant: Color(0xffffffff),
            outline: Color(0xff777777),
            outlineVariant: Color(0xff414141),
            shadow: Color(0xff000000),
            scrim: Color(0xff000000),
            inverseSurface: Color(0xffffffff),
            onInverseSurface: Color(0xff121212),
            inversePrimary: Color(0xff5a4570),
            surfaceTint: Color(0xffbb86fc),
            // background: Color(0xff121212),
            // onBackground: Color(0xffffffff),
            // surfaceVariant: Color(0xff121212),
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });

    //**************************************************************************
    // Test defaults and null input resulting in expected theme values.
    //**************************************************************************

    test(
        'FCS7.03: GIVEN a FlexColorScheme theme with Material2 scheme light '
        'colors EXPECT appbar theme color to be primary color.', () {
      expect(themeLight.appBarTheme.backgroundColor, const Color(0xff6200ee));
    });
    test(
        'FCS7.04: GIVEN a FlexColorScheme theme with Material3 scheme dark '
        'colors EXPECT appbar theme color to be surface color.', () {
      expect(
        themeDark.appBarTheme.backgroundColor,
        equals(const Color(0xff121212)),
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
        'FCS7.06: GIVEN a FlexColorScheme M2 theme with null Typography input '
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
        'FCS7.09: GIVEN a FlexColorScheme theme with Material scheme light '
        'colors EXPECT primaryColorDark equality with '
        'blend(Colors.black, 40).', () {
      expect(
        themeLight.primaryColorDark,
        equals(themeLight.colorScheme.primary.blend(Colors.black, 40)),
      );
    });
    test(
        'FCS7.10: GIVEN a FlexColorScheme theme with Material scheme dark '
        'colors EXPECT primaryColorDark equality with '
        'blend(Colors.black, 45).', () {
      expect(
        themeDark.primaryColorDark,
        equals(themeDark.colorScheme.primary.blend(Colors.black, 45)),
      );
    });

    test(
        'FCS7.11: GIVEN a FlexColorScheme theme with Material scheme light '
        'colors EXPECT primaryColorLight equality with '
        '.blend(Colors.white, 40).', () {
      expect(
        themeLight.primaryColorLight,
        equals(themeLight.colorScheme.primary.blend(Colors.white, 40)),
      );
    });
    test(
        'FCS7.12: GIVEN a FlexColorScheme theme with Material scheme dark '
        'colors EXPECT primaryColorLight equality with '
        '.blend(Colors.white, 35).', () {
      expect(
        themeDark.primaryColorLight,
        equals(themeDark.colorScheme.primary.blend(Colors.white, 35)),
      );
    });

    test(
        'FCS7.13: GIVEN a FlexColorScheme theme with Material scheme light '
        'colors EXPECT secondaryHeaderColor equality with '
        '.blend(Colors.white, 80).', () {
      expect(
        themeLight.secondaryHeaderColor,
        equals(themeLight.colorScheme.primary.blend(Colors.white, 80)),
      );
    });
    test(
        'FCS7.14: GIVEN a FlexColorScheme theme with Material scheme dark '
        'colors EXPECT secondaryHeaderColor equality with '
        'blend(Colors.black, 60).', () {
      expect(
        themeDark.secondaryHeaderColor,
        equals(themeDark.colorScheme.primary.blend(Colors.black, 60)),
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
        'WITH FlexSurface.light EXPECT surface Color(0xfffbfbfb).', () {
      expect(tLightL.colorScheme.surface, equals(const Color(0xfffbfbfb)));
    });
    test(
        'FCS7.21: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH FlexSurface.light EXPECT surface Color(0xff080808).', () {
      expect(tDarkL.colorScheme.surface, equals(const Color(0xff080808)));
    });

    test(
        'FCS7.24: GIVEN a FlexColorScheme.light theme FROM scheme "material" '
        'WITH highScaffoldLowSurfaces blendLevel=2 '
        'EXPECT scaffold '
        'background Color(0xfffbf9fe).', () {
      expect(tLightL.scaffoldBackgroundColor, equals(const Color(0xfffbf9fe)));
    });
    test(
        'FCS7.25: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH highScaffoldLowSurfaces blendLevel=2 '
        'EXPECT scaffold '
        'background Color(0xff050406).', () {
      expect(tDarkL.scaffoldBackgroundColor, equals(const Color(0xff050406)));
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
        'EXPECT surface Color(0xfff5f2fb).', () {
      expect(tLightM.colorScheme.surface, equals(const Color(0xfff5f2fb)));
    });
    test(
        'FCS7.37: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH highScaffoldLowSurfacesVariantDialog blendLevel 20 '
        'EXPECT surface Color(0xff0f0c11).', () {
      expect(tDarkM.colorScheme.surface, equals(const Color(0xff0f0c11)));
    });

    test(
        'FCS7.39: GIVEN a FlexColorScheme.light theme FROM scheme "material" '
        'WITH highScaffoldLowSurfacesVariantDialog blendLevel 20 '
        'EXPECT scaffold background Color(0xffdac3fb).', () {
      expect(tLightM.scaffoldBackgroundColor, equals(const Color(0xffdac3fb)));
    });
    test(
        'FCS7.40: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH highScaffoldLowSurfacesVariantDialog blendLevel 20 '
        'EXPECT scaffold background Color(0xff2c203c).', () {
      expect(tDarkM.scaffoldBackgroundColor, equals(const Color(0xff2c203c)));
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
        'EXPECT surface Color(0xffe0cff9).', () {
      expect(tLightS.colorScheme.surface, equals(const Color(0xffe0cff9)));
    });
    test(
        'FCS7.52: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH highSurfaceLowScaffold blendLevel 30 '
        'EXPECT surface Color(0xff271e33).', () {
      expect(tDarkS.colorScheme.surface, equals(const Color(0xff271e33)));
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
        'EXPECT scaffold background Color(0xff0b080f).', () {
      expect(tDarkS.scaffoldBackgroundColor, equals(const Color(0xff0b080f)));
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
        'colorScheme.surfaceContainerLow.', () {
      expect(
        tLightH.appBarTheme.backgroundColor,
        equals(tLightH.colorScheme.surfaceContainerLow),
      );
    });
    test(
        'FCS7.64: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH FlexAppBarStyle.background EXPECT appbar theme color '
        'colorScheme.surfaceContainerLow.', () {
      expect(
        tDarkH.appBarTheme.backgroundColor,
        equals(tDarkH.colorScheme.surfaceContainerLow),
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
        'EXPECT surface Color(0xffcbacf7).', () {
      expect(tLightH.colorScheme.surface, equals(const Color(0xffcbacf7)));
    });
    test(
        'FCS7.68: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH highBackgroundLowScaffold blendLevel 40 '
        'EXPECT surface Color(0xff402f54).', () {
      expect(tDarkH.colorScheme.surface, equals(const Color(0xff402f54)));
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
        'EXPECT scaffold background Color(0xff0f0b14).', () {
      expect(tDarkH.scaffoldBackgroundColor, equals(const Color(0xff0f0b14)));
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
      useMaterial3: false,
    );
    final FlexColorScheme fcsLightH2Raw = FlexColorScheme.light(
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xffcd5758),
          onPrimary: Color(0xffffffff),
          primaryContainer: Color(0xfff4dbdb),
          onPrimaryContainer: Color(0xff000000),
          primaryFixed: Color(0xfff0dcdc),
          primaryFixedDim: Color(0xffe0b8b8),
          onPrimaryFixed: Color(0xff691f20),
          onPrimaryFixedVariant: Color(0xff772324),
          secondary: Color(0xff57c8d3),
          onSecondary: Color(0xff000000),
          secondaryContainer: Color(0xffbcf5fa),
          onSecondaryContainer: Color(0xff000000),
          secondaryFixed: Color(0xffb4dde2),
          secondaryFixedDim: Color(0xff8ecdd3),
          onSecondaryFixed: Color(0xff000000),
          onSecondaryFixedVariant: Color(0xff081c1e),
          tertiary: Color(0xfff37d7e),
          onTertiary: Color(0xff000000),
          tertiaryContainer: Color(0xfffdf0f0),
          onTertiaryContainer: Color(0xff000000),
          tertiaryFixed: Color(0xffefc9c9),
          tertiaryFixedDim: Color(0xffe6a9aa),
          onTertiaryFixed: Color(0xff2d0404),
          onTertiaryFixedVariant: Color(0xff5c0909),
          error: Color(0xff790000),
          onError: Color(0xffffffff),
          surface: Color(0xfffcf5f5),
          onSurface: Color(0xff000000),
          surfaceDim: Color(0xffded7d8),
          surfaceBright: Color(0xfffaf3f3),
          surfaceContainerLowest: Color(0xfffcf5f5),
          surfaceContainerLow: Color(0xfff5eeee),
          surfaceContainer: Color(0xfff0e9e9),
          surfaceContainerHigh: Color(0xffebe4e4),
          surfaceContainerHighest: Color(0xffe5dede),
          onSurfaceVariant: Color(0xff000000),
          //
          errorContainer: Color(0xfff1d8d8),
          onErrorContainer: Color(0xff000000),
          outline: Color(0xff919191),
          outlineVariant: Color(0xffd1d1d1),
          shadow: Color(0xff000000),
          scrim: Color(0xff000000),
          inverseSurface: Color(0xff1d1616),
          onInverseSurface: Color(0xffffffff),
          inversePrimary: Color(0xfffff0f0),
        ),
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurfaces,
        // The 30 blend level will be produced by the colors given here
        // with 0 blend level
        blendLevel: 0,
        primary: const Color(0xffcd5758),
        onPrimary: const Color(0xffffffff),
        primaryContainer: const Color(0xfff4dbdb),
        onPrimaryContainer: const Color(0xff000000),
        secondary: const Color(0xff57c8d3),
        onSecondary: const Color(0xff000000),
        secondaryContainer: const Color(0xffbcf5fa),
        onSecondaryContainer: const Color(0xff000000),
        tertiary: const Color(0xfff37d7e),
        onTertiary: const Color(0xff000000),
        tertiaryContainer: const Color(0xfffdf0f0),
        onTertiaryContainer: const Color(0xff000000),
        error: const Color(0xff790000),
        onError: const Color(0xffffffff),
        surface: const Color(0xfffcf5f5),
        onSurface: const Color(0xff000000),
        //
        tabBarStyle: FlexTabBarStyle.forBackground,
        appBarBackground: const Color(0xfffaf3f3),
        appBarElevation: null,
        bottomAppBarElevation: null,
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
    const FlexColorScheme fcsLightH2RealRaw = FlexColorScheme(
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xffcd5758),
        onPrimary: Color(0xffffffff),
        primaryContainer: Color(0xfff4dbdb),
        onPrimaryContainer: Color(0xff000000),
        primaryFixed: Color(0xfff0dcdc),
        primaryFixedDim: Color(0xffe0b8b8),
        onPrimaryFixed: Color(0xff691f20),
        onPrimaryFixedVariant: Color(0xff772324),
        secondary: Color(0xff57c8d3),
        onSecondary: Color(0xff000000),
        secondaryContainer: Color(0xffbcf5fa),
        onSecondaryContainer: Color(0xff000000),
        secondaryFixed: Color(0xffb4dde2),
        secondaryFixedDim: Color(0xff8ecdd3),
        onSecondaryFixed: Color(0xff000000),
        onSecondaryFixedVariant: Color(0xff081c1e),
        tertiary: Color(0xfff37d7e),
        onTertiary: Color(0xff000000),
        tertiaryContainer: Color(0xfffdf0f0),
        onTertiaryContainer: Color(0xff000000),
        tertiaryFixed: Color(0xffefc9c9),
        tertiaryFixedDim: Color(0xffe6a9aa),
        onTertiaryFixed: Color(0xff2d0404),
        onTertiaryFixedVariant: Color(0xff5c0909),
        error: Color(0xff790000),
        onError: Color(0xffffffff),
        surface: Color(0xfffcf5f5),
        onSurface: Color(0xff000000),
        surfaceDim: Color(0xffded7d8),
        surfaceBright: Color(0xfffaf3f3),
        surfaceContainerLowest: Color(0xfffcf5f5),
        surfaceContainerLow: Color(0xfff5eeee),
        surfaceContainer: Color(0xfff0e9e9),
        surfaceContainerHigh: Color(0xffebe4e4),
        surfaceContainerHighest: Color(0xffe5dede),
        onSurfaceVariant: Color(0xff000000),
        //
        errorContainer: Color(0xfff1d8d8),
        onErrorContainer: Color(0xff000000),
        outline: Color(0xff919191),
        outlineVariant: Color(0xffd1d1d1),
        shadow: Color(0xff000000),
        scrim: Color(0xff000000),
        inverseSurface: Color(0xff1d1616),
        onInverseSurface: Color(0xffffffff),
        inversePrimary: Color(0xfffff0f0),
      ),
      primary: Color(0xffcd5758),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xfff4dbdb),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xff57c8d3),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffbcf5fa),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfff37d7e),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xfffdf0f0),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xff790000),
      onError: Color(0xffffffff),
      errorContainer: Color(0xfff1d8d8),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xfffcf5f5),
      onSurface: Color(0xff000000),
      //
      brightness: Brightness.light,
      tabBarStyle: FlexTabBarStyle.forBackground,
      appBarBackground: Color(0xfff5eeee),
      dialogBackground: Color(0xfffcf5f5),
      scaffoldBackground: Color(0xffedc3c4),
      appBarElevation: null,
      bottomAppBarElevation: null,
      tooltipsMatchBackground: false,
      transparentStatusBar: true,
      visualDensity: null,
      textTheme: null,
      primaryTextTheme: null,
      fontFamily: null,
      platform: null,
      typography: null,
      applyElevationOverlayColor: true,
      subThemesData: null,
      useMaterial3: false,
    );
    test(
        'FCS7.79c-string: GIVEN a Equal Raw and FlexColorScheme.light with '
        'heavy branding and 2 colors EXPECT equal toStrings.', () {
      expect(
        fcsLightH2.toString(),
        equalsIgnoringHashCodes(fcsLightH2RealRaw.toString()),
      );
    });
    test(
        'FCS7.79d-object: GIVEN a Equal Raw and FlexColorScheme.light with '
        'heavy branding and 2 colors EXPECT equal objects.', () {
      expect(
        fcsLightH2,
        equals(fcsLightH2RealRaw),
      );
    });
    test(
        'FCS7.79e-theme: GIVEN a Equal Raw and FlexColorScheme.light with '
        'heavy branding and 2 colors EXPECT toTheme equals.', () {
      expect(
        fcsLightH2.toTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
            fcsLightH2RealRaw.toTheme.toString(minLevel: DiagnosticLevel.fine)),
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
      brightness: Brightness.dark,
      // Override the ones we can set via direct input
      // to be equal to direct inputs
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xffda8585),
        onPrimary: Color(0xffffffff),
        primaryContainer: Color(0xff5f3232),
        onPrimaryContainer: Color(0xffffffff),
        primaryFixed: Color(0xfff0dcdc),
        primaryFixedDim: Color(0xffe0b8b8),
        onPrimaryFixed: Color(0xff691f20),
        onPrimaryFixedVariant: Color(0xff772324),
        secondary: Color(0xff68cdd7),
        onSecondary: Color(0xff000000),
        secondaryContainer: Color(0xff14464b),
        onSecondaryContainer: Color(0xffffffff),
        secondaryFixed: Color(0xffb4dde2),
        secondaryFixedDim: Color(0xff8ecdd3),
        onSecondaryFixed: Color(0xff000000),
        onSecondaryFixedVariant: Color(0xff081c1e),
        tertiary: Color(0xffffabab),
        onTertiary: Color(0xff000000),
        tertiaryContainer: Color(0xffb33030),
        onTertiaryContainer: Color(0xffffffff),
        tertiaryFixed: Color(0xffefc9c9),
        tertiaryFixedDim: Color(0xffe6a9aa),
        onTertiaryFixed: Color(0xff2d0404),
        onTertiaryFixedVariant: Color(0xff5c0909),
        error: Color(0xffcf6679),
        onError: Color(0xff000000),
        errorContainer: Color(0xffb1384e),
        onErrorContainer: Color(0xffffffff),
        surface: Color(0xff050404),
        onSurface: Color(0xfff1f1f1),
        surfaceDim: Color(0xff030202),
        surfaceBright: Color(0xff292525),
        surfaceContainerLowest: Color(0xff000000),
        surfaceContainerLow: Color(0xff0c0a0a),
        surfaceContainer: Color(0xff120f0f),
        surfaceContainerHigh: Color(0xff1a1717),
        surfaceContainerHighest: Color(0xff252121),
        onSurfaceVariant: Color(0xffcacaca),
        outline: Color(0xff777777),
        outlineVariant: Color(0xff414141),
        shadow: Color(0xff000000),
        scrim: Color(0xff000000),
        inverseSurface: Color(0xfff3f0f0),
        onInverseSurface: Color(0xff2a2a2a),
        inversePrimary: Color(0xff5f3c3c),
        surfaceTint: Color(0xffda8585),
      ),
      primary: Color(0xffda8585),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff5f3232),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff68cdd7),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xff14464b),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xffffabab),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffb33030),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xffcf6679),
      onError: Color(0xff000000),
      errorContainer: Color(0xffb1384e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xff050404),
      onSurface: Color(0xfff1f1f1),
      //
      scaffoldBackground: Color(0xff000000),
      appBarBackground: Color(0xff0c0a0a),
      dialogBackground: Color(0xff1a1717),
      tabBarStyle: FlexTabBarStyle.forBackground,
      tooltipsMatchBackground: false,
      transparentStatusBar: true,
      visualDensity: null,
      textTheme: null,
      primaryTextTheme: null,
      fontFamily: null,
      platform: null,
      typography: null,
      applyElevationOverlayColor: true,
      subThemesData: null,
    );

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
        false,
      );
    });
    test(
        'FCS7.80d-object: GIVEN a Equal Raw and FlexColorScheme.dark with '
        'heavy branding and 2 colors EXPECT equal objects.', () {
      expect(
        fcsDarkH2,
        equals(fcsDarkH2Raw),
      );
    });
    test(
        'FCS7.80e: GIVEN a Raw and FlexColorScheme.dark with heavy '
        'branding and 2 colors and true black, that define SAME '
        'FlexColorScheme.toScheme and theme but are unequal as '
        'FlexColorScheme objects '
        'EXPECT equals toTheme.', () {
      expect(
        fcsDarkH2.toTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          fcsDarkH2Raw.toTheme.toString(minLevel: DiagnosticLevel.fine),
        ),
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

    final RoundedRectangleBorder? shapeL =
        tLightHb.popupMenuTheme.shape as RoundedRectangleBorder?;

    test(
        'FCS7.82-3L shape: Expect border radius null on popup menu does not '
        'follow default radius.', () {
      expect(shapeL?.borderRadius, null);
    });

    // Use M2
    final ThemeData tDarkHb = FlexColorScheme.dark(
      useMaterial3: false,
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

    final RoundedRectangleBorder? shapeD =
        tDarkHb.popupMenuTheme.shape as RoundedRectangleBorder?;
    final RoundedRectangleBorder shapeD2 =
        tDarkHb.cardTheme.shape! as RoundedRectangleBorder;

    test(
        'FCS7.82-3D shape: Expect border radius null on popup, it '
        'does not follow default radius', () {
      expect(shapeD?.borderRadius, null);
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
      ),
    ).toTheme;

    test(
        'FCS7.82-M3Bar1: GIVEN a FlexColorScheme.light with more options '
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
        navigationBarHeight: 70,
        navigationBarOpacity: 0.95,
        navigationBarSelectedIconSchemeColor: SchemeColor.primary,
        navigationBarSelectedLabelSchemeColor: SchemeColor.onSurface,
        navigationBarIndicatorSchemeColor: SchemeColor.primaryContainer,
        navigationBarBackgroundSchemeColor: SchemeColor.surfaceContainer,
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

    test(
        'FCS7.83: GIVEN a FlexColorScheme.light with given options '
        'EXPECT none null result and matching ThemeData to options.', () {
      expect(tLightC, isNotNull);
      expect(
        tLightC.appBarTheme.backgroundColor,
        FlexColor.mandyRed.light.tertiary,
      );
      expect(
        tLightC.appBarTheme.elevation,
        2,
      );
    });

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
        'FCS7.84: GIVEN a FlexColorScheme.dark with given options '
        'EXPECT none null result and matching ThemeData to options.', () {
      expect(tDarkC, isNotNull);
      expect(
        tDarkC.appBarTheme.backgroundColor,
        FlexColor.mandyRed.dark.tertiary,
      );
      expect(
        tDarkC.appBarTheme.elevation,
        4,
      );
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
    final TextTheme fLightT = FlexColorScheme.light(
      onSurface: Colors.black,
    ).toTheme.textTheme;
    // Should be same as a light ThemeData textTheme with Typography 2018
    final TextTheme nLightT =
        ThemeData(typography: Typography.material2021()).textTheme;
    test(
        'FCS7.88: GIVEN a FlexColorScheme.light with no TextTheme defined '
        'EXPECT equal to '
        'ThemeData(typography: Typography.material2021()).textTheme.', () {
      expect(fLightT, equals(nLightT));
    });

    // Default light Primary TextTheme equality verification.
    //
    // Flex default TextTheme light
    final TextTheme fLightP = FlexColorScheme.light(
      surface: Colors.white,
    ).toTheme.primaryTextTheme;
    // Should be same as a light ThemeData textTheme with Typography 2021
    final TextTheme nLightP =
        ThemeData(typography: Typography.material2021()).primaryTextTheme;
    test(
        'FCS7.89: GIVEN a FlexColorScheme.light with no PrimaryTextTheme '
        'defined EXPECT equal '
        'ThemeData(typography: Typography.material2018()).primaryTextTheme',
        () {
      expect(fLightP, equals(nLightP));
    });

    // Default dark TextTheme equality verification.
    final TextTheme fDarkT = FlexColorScheme.dark(
      onSurface: Colors.white,
    ).toTheme.textTheme;
    final TextTheme nDarkT = ThemeData(
      brightness: Brightness.dark,
      typography: Typography.material2021(),
    ).textTheme;
    test(
        'FCS7.90: GIVEN a FlexColorScheme.dark with no TextTheme defined '
        'EXPECT equal to default dark with Typography 2021.', () {
      expect(fDarkT, equals(nDarkT));
    });

    // Primary dark text theme verification, this is not equal to default
    // ThemeData primary text theme, it is so by design, we have to also
    // set the primaryColor to the color used by FlexColorScheme.dark, otherwise
    // default dark theme uses an almost black color as primary color, giving
    // us the wrong on primaryTextTheme color for this test case, which is
    // part of the test.
    final TextTheme fDarkP = FlexColorScheme.dark(
      useMaterial3: false,
    ).toTheme.primaryTextTheme;
    final Color nDarkPColor =
        FlexColorScheme.dark(useMaterial3: false).toTheme.primaryColor;
    final TextTheme nDarkP = ThemeData(
      useMaterial3: false,
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
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        height: 24 / 20,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
      ),
      headlineMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.15,
      ),
      titleSmall: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.25,
        height: 20 / 17,
      ),
      bodyLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        height: 20 / 14,
      ),
      bodyMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      ),
    );

    // Make a custom text theme for PrimaryTextTheme, it should only get these
    // customizations + default style, not the the ones in the custom TextTheme.
    const TextTheme customPrimText = TextTheme(
      bodyMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      ),
      labelSmall: TextStyle(
        letterSpacing: 0.5,
      ),
    );

    // Light theme with custom text theme
    final ThemeData fLightTD = FlexColorScheme.light(
      surface: const Color(0xfffef7ff), // Seeded default surface color
      onSurface: const Color(0xff1d1b20), // Seeded default on surface color
      textTheme: customText,
      primaryTextTheme: customPrimText,
      // subThemesData: const FlexSubThemesData(useMaterial3Typography: true),
    ).toTheme;
    final ThemeData nLightTD = ThemeData(
      textTheme: customText,
      primaryTextTheme: customPrimText,
    );

    // Custom light TextTheme equality verification.
    final TextTheme fCText = fLightTD.textTheme;
    final TextTheme nCText = nLightTD.textTheme;
    test(
        'FCS7.92: GIVEN a FlexColorScheme.light with custom TextTheme defined '
        'EXPECT equal to default with same text theme and typography 2021', () {
      expect(fCText, equals(nCText));
    });
    // Custom light TextTheme with Primary derived from it equality test.
    final TextTheme fCPText = fLightTD.primaryTextTheme;
    final TextTheme nCPText = nLightTD.primaryTextTheme;
    test(
        'FCS7.93: GIVEN a FlexColorScheme.light with custom PrimaryTextTheme '
        'defined EXPECT the primaryTextTheme to be equal with default '
        'ThemeData with same primary text theme and typography 2021.', () {
      expect(fCPText, equals(nCPText));
    });

    // Dark theme with custom text theme
    final ThemeData fDarkTD = FlexColorScheme.dark(
      textTheme: customText,
      primaryTextTheme: customPrimText,
      applyElevationOverlayColor: false,
      useMaterial3: false,
    ).toTheme;
    final ThemeData nDarkTD = ThemeData(
      brightness: Brightness.dark,
      textTheme: customText,
      primaryTextTheme: customPrimText,
      primaryColor: nDarkPColor,
      typography: Typography.material2018(),
      useMaterial3: false,
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

    // AppBar test null style, not using M3.
    test(
        'FCS7.96 Light: GIVEN a FlexColorScheme.light with null appBarStyle '
        'and not using M3 EXPECT app bar background primary ', () {
      final ThemeData theme = FlexColorScheme.light(
        scheme: FlexScheme.flutterDash,
        // appBarStyle: null, // Default value
        useMaterial3: false,
      ).toTheme;
      expect(
          theme.appBarTheme.backgroundColor, equals(theme.colorScheme.primary));
    });
    // AppBar test dark defaults.
    test(
        'FCS7.96 Dark: GIVEN a FlexColorScheme.dark with null appBarStyle and '
        'not using M3 EXPECT app bar background surface ', () {
      final ThemeData theme = FlexColorScheme.dark(
        scheme: FlexScheme.flutterDash,
        // appBarStyle: null, // Default value
        useMaterial3: false,
      ).toTheme;
      expect(
          theme.appBarTheme.backgroundColor, equals(theme.colorScheme.surface));
    });
    // AppBar test null style, not using M3.
    test(
        'FCS7.97 Light: GIVEN a FlexColorScheme.light with null appBarStyle '
        'and using M3 EXPECT app bar background Color(0xfffcfcfc) ', () {
      final ThemeData theme = FlexColorScheme.light(
        scheme: FlexScheme.flutterDash,
        // appBarStyle: null, // Default value
        useMaterial3: true,
      ).toTheme;
      expect(
          theme.appBarTheme.backgroundColor, equals(const Color(0xfffcfcfc)));
    });
    // AppBar test null style, using M3.
    test(
        'FCS7.97 Dark: GIVEN a FlexColorScheme.dark with null appBarStyle and '
        ' using M3 EXPECT app bar background Color(0xff080808) ', () {
      final ThemeData theme = FlexColorScheme.dark(
        scheme: FlexScheme.flutterDash,
        // appBarStyle: null, // Default value
        useMaterial3: true,
      ).toTheme;
      expect(
          theme.appBarTheme.backgroundColor, equals(const Color(0xff080808)));
    });
    // AppBar test null style, not using M3.
    test(
        'FCS7.98 Light: GIVEN a FlexColorScheme.light with '
        'appBarStyle.scaffold and not using M3 '
        'EXPECT app bar background equals theme.scaffoldBackground ', () {
      final ThemeData theme = FlexColorScheme.light(
        scheme: FlexScheme.flutterDash,
        appBarStyle: FlexAppBarStyle.scaffoldBackground,
        scaffoldBackground: FlexColor.amberDarkTertiary,
        // useMaterial3: false, // Default value
      ).toTheme;
      expect(theme.appBarTheme.backgroundColor,
          equals(theme.scaffoldBackgroundColor));
    });
    // AppBar test scaffoldBackground style, not using M3.
    test(
        'FCS7.98 Dark: GIVEN a FlexColorScheme.dark with '
        'appBarStyle.scaffold and not using M3 '
        'EXPECT app bar background equals theme.scaffoldBackground ', () {
      final ThemeData theme = FlexColorScheme.dark(
        scheme: FlexScheme.flutterDash,
        appBarStyle: FlexAppBarStyle.scaffoldBackground,
        scaffoldBackground: FlexColor.verdunHemlockDarkSecondaryContainer,
        // useMaterial3: false, // Default value
      ).toTheme;
      expect(theme.appBarTheme.backgroundColor,
          equals(theme.scaffoldBackgroundColor));
    });
    // AppBar test scaffoldBackground style, not using M3.
    test(
        'FCS7.98 Dark: GIVEN a FlexColorScheme.dark with '
        'appBarStyle.scaffold and using M3 '
        'EXPECT app bar background equals theme.scaffoldBackground ', () {
      final ThemeData theme = FlexColorScheme.dark(
        scheme: FlexScheme.flutterDash,
        appBarStyle: FlexAppBarStyle.scaffoldBackground,
        scaffoldBackground: FlexColor.verdunHemlockDarkSecondaryContainer,
        useMaterial3: true,
      ).toTheme;
      expect(theme.appBarTheme.backgroundColor,
          equals(theme.scaffoldBackgroundColor));
    });
    // AppBar test null center title.
    test(
        'FCS7.99 null: GIVEN a FlexColorScheme.light with no centerTitle '
        'EXPECT app bar center title null ', () {
      final ThemeData tLAppBarCenterNull = FlexColorScheme.light(
        scheme: FlexScheme.flutterDash,
      ).toTheme;
      expect(tLAppBarCenterNull.appBarTheme.centerTitle, equals(null));
    });
    // AppBar test true center title.
    test(
        'FCS7.99 true: GIVEN a FlexColorScheme.dark with no centerTitle '
        'EXPECT app bar center title true ', () {
      final ThemeData theme = FlexColorScheme.dark(
        scheme: FlexScheme.flutterDash,
        subThemesData: const FlexSubThemesData(appBarCenterTitle: true),
      ).toTheme;
      expect(theme.appBarTheme.centerTitle, equals(true));
    });
    // AppBar test true center title.
    test(
        'FCS7.99 false: GIVEN a FlexColorScheme.light with no centerTitle '
        'EXPECT app bar center title false ', () {
      final ThemeData theme = FlexColorScheme.light(
        scheme: FlexScheme.flutterDash,
        subThemesData: const FlexSubThemesData(appBarCenterTitle: false),
      ).toTheme;
      expect(theme.appBarTheme.centerTitle, equals(false));
    });
    // Test swapLegacyOnMaterial3 when using Material 3 - No swap result
    test(
        'FCS7.100a GIVEN a FlexColorScheme.light with useMaterial3:true '
        'and swapLegacyOnMaterial3:true and theme flutterDash '
        'EXPECT no legacy swap - Dash does not swap', () {
      final ThemeData theme = FlexColorScheme.light(
        scheme: FlexScheme.flutterDash,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
      ).toTheme;
      expect(
        theme.colorScheme.secondary,
        equals(FlexColor.dashBlueLightSecondary),
      );
      expect(
        theme.colorScheme.secondaryContainer,
        equals(FlexColor.dashBlueLightSecondaryContainer),
      );
      expect(
        theme.colorScheme.tertiary,
        equals(FlexColor.dashBlueLightTertiary),
      );
      expect(
        theme.colorScheme.tertiaryContainer,
        equals(FlexColor.dashBlueLightTertiaryContainer),
      );
    });
    // Test swapLegacyOnMaterial3 when using Material 3 - Swapped result
    test(
        'FCS7.100b GIVEN a FlexColorScheme.light with useMaterial3:true '
        'and swapLegacyOnMaterial3:true and theme blumineBlue '
        'EXPECT legacy swap - Blumine swaps', () {
      final ThemeData theme = FlexColorScheme.light(
        scheme: FlexScheme.blumineBlue,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
      ).toTheme;
      expect(
        theme.colorScheme.secondary,
        equals(FlexColor.blumineBlueLightTertiary),
      );
      expect(
        theme.colorScheme.secondaryContainer,
        equals(FlexColor.blumineBlueLightTertiaryContainer),
      );
      expect(
        theme.colorScheme.tertiary,
        equals(FlexColor.blumineBlueLightSecondary),
      );
      expect(
        theme.colorScheme.tertiaryContainer,
        equals(FlexColor.blumineBlueLightSecondaryContainer),
      );
    });
    // Test swapLegacyOnMaterial3 when using Material 3 - No swap result
    test(
        'FCS7.100c GIVEN a FlexColorScheme.Dark with useMaterial3:true '
        'and swapLegacyOnMaterial3:true and theme flutterDash '
        'EXPECT no legacy swap - Dash does not swap', () {
      final ThemeData theme = FlexColorScheme.dark(
        scheme: FlexScheme.flutterDash,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
      ).toTheme;
      expect(
        theme.colorScheme.secondary,
        equals(FlexColor.dashBlueDarkSecondary),
      );
      expect(
        theme.colorScheme.secondaryContainer,
        equals(FlexColor.dashBlueDarkSecondaryContainer),
      );
      expect(
        theme.colorScheme.tertiary,
        equals(FlexColor.dashBlueDarkTertiary),
      );
      expect(
        theme.colorScheme.tertiaryContainer,
        equals(FlexColor.dashBlueDarkTertiaryContainer),
      );
    });
    // Test swapLegacyOnMaterial3 when using Material 3 - Swapped result
    test(
        'FCS7.100d GIVEN a FlexColorScheme.Dark with useMaterial3:true '
        'and swapLegacyOnMaterial3:true and theme blumineBlue '
        'EXPECT legacy swap - Blumine swaps', () {
      final ThemeData theme = FlexColorScheme.dark(
        scheme: FlexScheme.blumineBlue,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
      ).toTheme;
      expect(
        theme.colorScheme.secondary,
        equals(FlexColor.blumineBlueDarkTertiary),
      );
      expect(
        theme.colorScheme.secondaryContainer,
        equals(FlexColor.blumineBlueDarkTertiaryContainer),
      );
      expect(
        theme.colorScheme.tertiary,
        equals(FlexColor.blumineBlueDarkSecondary),
      );
      expect(
        theme.colorScheme.tertiaryContainer,
        equals(FlexColor.blumineBlueDarkSecondaryContainer),
      );
    });
    // Test default bottomSheet theming, light M2
    test(
        'FCS7.101a GIVEN a FlexColorScheme.light with useMaterial3:false '
        'and a default FlexSubThemesData '
        'EXPECT bottom surface and elevation 4 and 8 and border radius '
        'top 28', () {
      final ThemeData theme = FlexColorScheme.light(
        scheme: FlexScheme.flutterDash,
        useMaterial3: false,
        subThemesData: const FlexSubThemesData(),
      ).toTheme;
      expect(
        theme.bottomSheetTheme.backgroundColor,
        equals(theme.colorScheme.surfaceContainerLow),
      );
      expect(
        theme.bottomSheetTheme.modalBackgroundColor,
        equals(theme.colorScheme.surfaceContainerLow),
      );
      expect(
        theme.bottomSheetTheme.elevation,
        equals(4),
      );
      expect(
        theme.bottomSheetTheme.modalElevation,
        equals(8),
      );
      expect(
        theme.bottomSheetTheme.clipBehavior,
        equals(Clip.antiAlias),
      );
      expect(
        theme.bottomSheetTheme.shape,
        equals(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(28),
              topRight: Radius.circular(28),
            ),
          ),
        ),
      );
    });
    // Test default bottomSheet theming dark M3
    test(
        'FCS7.101b GIVEN a FlexColorScheme.dark with useMaterial3:true '
        'and a default FlexSubThemesData '
        'EXPECT bottom surface+tint and elevation 1 and 2 and border radius '
        'top 28', () {
      final ThemeData theme = FlexColorScheme.dark(
        scheme: FlexScheme.materialBaseline,
        useMaterial3: true,
        subThemesData: const FlexSubThemesData(),
      ).toTheme;
      final ColorScheme scheme = theme.colorScheme;
      final ThemeData refTheme = ThemeData.from(colorScheme: scheme);
      final Color bottomSheetColor = refTheme.colorScheme.surfaceContainerLow;
      final Color bottomSheetModalColor =
          refTheme.colorScheme.surfaceContainerLow;
      expect(
        theme.bottomSheetTheme.backgroundColor,
        equals(bottomSheetColor),
      );
      expect(
        theme.bottomSheetTheme.modalBackgroundColor,
        equals(bottomSheetModalColor),
      );
      expect(
        theme.bottomSheetTheme.elevation,
        equals(1),
      );
      expect(
        theme.bottomSheetTheme.modalElevation,
        equals(2),
      );
      expect(
        theme.bottomSheetTheme.clipBehavior,
        equals(Clip.antiAlias),
      );
      expect(
        theme.bottomSheetTheme.shape,
        equals(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(28),
              topRight: Radius.circular(28),
            ),
          ),
        ),
      );
    });

    // Test bottomSheet theming custom dark M2
    test(
        'FCS7.101c GIVEN a FlexColorScheme.dark with useMaterial3:false '
        'and a custom FlexSubThemesData '
        'EXPECT bottom surface and elevation 2 and 12 and border radius '
        'top 8 and none tinted backgrounds', () {
      final ThemeData theme = FlexThemeData.dark(
        scheme: FlexScheme.sanJuanBlue,
        useMaterial3: false,
        subThemesData: const FlexSubThemesData(
          bottomSheetRadius: 8,
          bottomSheetElevation: 2,
          bottomSheetModalElevation: 12,
          bottomSheetBackgroundColor: SchemeColor.surface,
          bottomSheetModalBackgroundColor: SchemeColor.surfaceContainer,
        ),
      );
      final ColorScheme scheme = theme.colorScheme;
      expect(
        theme.bottomSheetTheme.backgroundColor,
        equals(scheme.surface),
      );
      expect(
        theme.bottomSheetTheme.modalBackgroundColor,
        equals(scheme.surfaceContainer),
      );
      expect(
        theme.bottomSheetTheme.elevation,
        equals(2),
      );
      expect(
        theme.bottomSheetTheme.modalElevation,
        equals(12),
      );
      expect(
        theme.bottomSheetTheme.clipBehavior,
        equals(Clip.antiAlias),
      );
      expect(
        theme.bottomSheetTheme.shape,
        equals(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
        ),
      );
    });

    // Test bottomSheet theming custom light M3
    test(
        'FCS7.101d GIVEN a FlexColorScheme.light with useMaterial3:true '
        'and a custom FlexSubThemesData '
        'EXPECT bottom surface and elevation 6 and 10 and border radius '
        'top 20 and tinted backgrounds', () {
      final ThemeData theme = FlexThemeData.light(
        scheme: FlexScheme.sakura,
        useMaterial3: true,
        subThemesData: const FlexSubThemesData(
          bottomSheetRadius: 20,
          bottomSheetElevation: 6,
          bottomSheetModalElevation: 10,
          bottomSheetBackgroundColor: SchemeColor.onPrimary,
          bottomSheetModalBackgroundColor: SchemeColor.surfaceContainer,
        ),
      );
      final ColorScheme scheme = theme.colorScheme;
      final ThemeData refTheme = ThemeData.from(colorScheme: scheme);
      final Color bottomSheetColor = refTheme.colorScheme.onPrimary;
      final Color bottomSheetModalColor = refTheme.colorScheme.surfaceContainer;
      expect(
        theme.bottomSheetTheme.backgroundColor,
        equals(bottomSheetColor),
      );
      expect(
        theme.bottomSheetTheme.modalBackgroundColor,
        equals(bottomSheetModalColor),
      );
      expect(
        theme.bottomSheetTheme.elevation,
        equals(6),
      );
      expect(
        theme.bottomSheetTheme.modalElevation,
        equals(10),
      );
      expect(
        theme.bottomSheetTheme.clipBehavior,
        equals(Clip.antiAlias),
      );
      expect(
        theme.bottomSheetTheme.shape,
        equals(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
        ),
      );
    });
    // Test bottomSheet theming custom light M3
    test(
        'FCS7.101d MODAL GIVEN a FlexColorScheme.light with useMaterial3:true '
        'and a custom FlexSubThemesData, FAILING test for issue '
        'https://github.com/rydmike/flex_color_scheme/issues/106 '
        'EXPECT modal bottom surface and elevation 6 and 10 and border radius '
        'top 20 and tinted backgrounds', () {
      final ThemeData theme = FlexThemeData.light(
        scheme: FlexScheme.sakura,
        useMaterial3: true,
        subThemesData: const FlexSubThemesData(
          bottomSheetRadius: 20,
          bottomSheetModalElevation: 10,
          bottomSheetModalBackgroundColor: SchemeColor.surfaceContainer,
        ),
      );
      final ColorScheme scheme = theme.colorScheme;
      final ThemeData refTheme = ThemeData.from(colorScheme: scheme);
      final Color bottomSheetModalColor = refTheme.colorScheme.surfaceContainer;
      expect(
        theme.bottomSheetTheme.modalBackgroundColor,
        equals(bottomSheetModalColor),
      );
      expect(
        theme.bottomSheetTheme.modalElevation,
        equals(10),
      );
      expect(
        theme.bottomSheetTheme.clipBehavior,
        equals(Clip.antiAlias),
      );
      expect(
        theme.bottomSheetTheme.shape,
        equals(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
        ),
      );
    });
    // Test default PopupMenu theming, light M2
    test(
        'FCS7.102a GIVEN a FlexColorScheme.light with useMaterial3:false '
        'and a default FlexSubThemesData '
        'EXPECT popup surface and elevation 6 and border radius 4', () {
      final ThemeData theme = FlexColorScheme.light(
        scheme: FlexScheme.materialBaseline,
        useMaterial3: false,
        subThemesData: const FlexSubThemesData(),
      ).toTheme;
      expect(
        theme.popupMenuTheme.color,
        equals(null), // Will show as theme.cardColor via defaults.
      );
      expect(
        theme.popupMenuTheme.elevation,
        equals(6.0),
      );
      expect(
        theme.popupMenuTheme.textStyle,
        equals(null),
      );
      expect(
        theme.popupMenuTheme.shape,
        equals(null),
      );
    });
    // Test default PopupMenu theming, light M3
    test(
        'FCS7.102b GIVEN a FlexColorScheme.light with useMaterial3:true '
        'and a default FlexSubThemesData '
        'EXPECT popup surface with elev tint and elevation 3 and border '
        'radius 4', () {
      final ThemeData theme = FlexColorScheme.light(
        scheme: FlexScheme.materialBaseline,
        useMaterial3: true,
        subThemesData: const FlexSubThemesData(),
      ).toTheme;
      expect(
        theme.popupMenuTheme.color,
        equals(null),
      );
      expect(
        theme.popupMenuTheme.elevation,
        equals(3.0),
      );
      expect(
        theme.popupMenuTheme.textStyle,
        equals(null),
      );
      expect(
        theme.popupMenuTheme.shape,
        equals(null),
      );
    });
    // Test custom PopupMenu theming, with default background, light M2.
    test(
        'FCS7.102c GIVEN a FlexColorScheme.light with useMaterial3:false '
        'and a FlexSubThemesData with popup opacity 0.95, elev 5, radius 8 '
        'EXPECT popup surface, with opacity 0.95, elev 5 and radius 8 ', () {
      final ThemeData theme = FlexColorScheme.light(
        scheme: FlexScheme.materialBaseline,
        useMaterial3: false,
        subThemesData: const FlexSubThemesData(
          popupMenuElevation: 5,
          popupMenuRadius: 8,
          popupMenuOpacity: 0.95,
        ),
      ).toTheme;
      expect(
        theme.popupMenuTheme.color,
        equals(theme.colorScheme.surface.withOpacity(0.95)),
      );
      expect(
        theme.popupMenuTheme.elevation,
        equals(5.0),
      );
      expect(
        theme.popupMenuTheme.textStyle?.color,
        equals(Colors.black),
      );
      expect(
        theme.popupMenuTheme.shape,
        equals(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
        ),
      );
    });
    // Test custom PopupMenu theming, with default background, light M3.
    test(
        'FCS7.102d GIVEN a FlexColorScheme.light with useMaterial3:true '
        'and a FlexSubThemesData with popup opacity 0.9, elev 6, radius 10 '
        'EXPECT popup surfaceContainer, '
        'with opacity 0.9, elev 6 and radius 10 ', () {
      final ThemeData theme = FlexColorScheme.light(
        scheme: FlexScheme.materialBaseline,
        useMaterial3: true,
        subThemesData: const FlexSubThemesData(
          popupMenuElevation: 6,
          popupMenuRadius: 10,
          popupMenuOpacity: 0.9,
        ),
      ).toTheme;
      final ThemeData refTheme = ThemeData.from(colorScheme: theme.colorScheme);
      final Color background =
          refTheme.colorScheme.surfaceContainer.withOpacity(0.9);
      expect(
        theme.popupMenuTheme.color,
        equals(background),
      );
      expect(
        theme.popupMenuTheme.elevation,
        equals(6.0),
      );
      expect(
        theme.popupMenuTheme.textStyle?.color,
        equals(Colors.black),
      );
      expect(
        theme.popupMenuTheme.shape,
        equals(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
        ),
      );
    });
    // Test custom PopupMenu theming, with custom background, dark M2.
    test(
        'FCS7.102d GIVEN a FlexColorScheme.dark with useMaterial3:false '
        'and a FlexSubThemesData with popup opacity 0.98, elev 12, radius 11 '
        'and custom background '
        'EXPECT popup surface, with opacity 0.98, elev 12 and radius 11 '
        'using custom background.', () {
      final ThemeData theme = FlexColorScheme.dark(
        scheme: FlexScheme.materialBaseline,
        useMaterial3: false,
        subThemesData: const FlexSubThemesData(
          popupMenuElevation: 12,
          popupMenuRadius: 11,
          popupMenuOpacity: 0.98,
          popupMenuSchemeColor: SchemeColor.primaryContainer,
        ),
      ).toTheme;
      expect(
        theme.popupMenuTheme.color,
        equals(theme.colorScheme.primaryContainer.withOpacity(0.98)),
      );
      expect(
        theme.popupMenuTheme.elevation,
        equals(12),
      );
      expect(
        theme.popupMenuTheme.textStyle?.color,
        equals(Colors.white),
      );
      expect(
        theme.popupMenuTheme.shape,
        equals(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(11.0),
            ),
          ),
        ),
      );
    });
    // Test custom PopupMenu theming, with custom background, dark M3.
    test(
        'FCS7.102e GIVEN a FlexColorScheme.dark with useMaterial3:true '
        'and a FlexSubThemesData with popup opacity 0.8, elev 2, radius 9 '
        'and custom background '
        'EXPECT popup surface, with opacity 0.8, elev 2 and radius 9 '
        'using custom background.', () {
      final ThemeData theme = FlexColorScheme.dark(
        scheme: FlexScheme.materialBaseline,
        useMaterial3: true,
        subThemesData: const FlexSubThemesData(
          popupMenuElevation: 2,
          popupMenuRadius: 9,
          popupMenuOpacity: 0.8,
          popupMenuSchemeColor: SchemeColor.surfaceContainer,
        ),
      ).toTheme;
      final ThemeData refTheme = ThemeData.from(colorScheme: theme.colorScheme);
      final Color background =
          refTheme.colorScheme.surfaceContainer.withOpacity(0.8);
      expect(
        theme.popupMenuTheme.color,
        equals(background),
      );
      expect(
        theme.popupMenuTheme.elevation,
        equals(2.0),
      );
      expect(
        theme.popupMenuTheme.textStyle?.color,
        equals(refTheme.colorScheme.onSurface),
      );
      expect(
        theme.popupMenuTheme.shape,
        equals(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(9.0),
            ),
          ),
        ),
      );
    });
    // Test custom PopupMenu theming, with custom background, dark M2.
    test(
        'FCS7.102d GIVEN a FlexColorScheme.dark with useMaterial3:false '
        'and a FlexSubThemesData with popup opacity null, elev 12, radi 11 '
        'and custom background '
        'EXPECT popup surface, with opacity null, elev 12 and radius 11 '
        'using custom background.', () {
      final ThemeData theme = FlexColorScheme.dark(
        scheme: FlexScheme.materialBaseline,
        useMaterial3: false,
        subThemesData: const FlexSubThemesData(
          popupMenuElevation: 12,
          popupMenuRadius: 11,
          popupMenuSchemeColor: SchemeColor.primaryContainer,
        ),
      ).toTheme;
      final ThemeData refTheme = ThemeData.from(colorScheme: theme.colorScheme);
      final Color background = refTheme.colorScheme.primaryContainer;
      expect(
        theme.popupMenuTheme.color,
        equals(background),
      );
      expect(
        theme.popupMenuTheme.elevation,
        equals(12),
      );
      expect(
        theme.popupMenuTheme.textStyle?.color,
        equals(Colors.white),
      );
      expect(
        theme.popupMenuTheme.shape,
        equals(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(11.0),
            ),
          ),
        ),
      );
    });
    // Test custom PopupMenu theming, with custom background, dark M3.
    test(
        'FCS7.102e GIVEN a FlexColorScheme.dark with useMaterial3:true '
        'and a FlexSubThemesData with popup opacity null, elev 2, radius 9 '
        'and custom background '
        'EXPECT popup surface, with opacity null, elev 2 and radius 9 '
        'using custom background.', () {
      final ThemeData theme = FlexColorScheme.dark(
        scheme: FlexScheme.materialBaseline,
        useMaterial3: true,
        subThemesData: const FlexSubThemesData(
          popupMenuElevation: 2,
          popupMenuRadius: 9,
          popupMenuSchemeColor: SchemeColor.surfaceContainer,
        ),
      ).toTheme;
      final ThemeData refTheme = ThemeData.from(colorScheme: theme.colorScheme);
      final Color background = refTheme.colorScheme.surfaceContainer;
      expect(
        theme.popupMenuTheme.color,
        equals(background),
      );
      expect(
        theme.popupMenuTheme.elevation,
        equals(2.0),
      );
      expect(
        theme.popupMenuTheme.textStyle?.color,
        equals(refTheme.colorScheme.onSurface),
      );
      expect(
        theme.popupMenuTheme.shape,
        equals(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(9.0),
            ),
          ),
        ),
      );
    });
    // Test custom outlines on ToggleButtons, OutlinedButton, InputDecorator
    test(
        'FCS7.103a GIVEN a FlexColorScheme.light with useMaterial3:false '
        'and a FlexSubThemesData with default global widths set '
        'EXPECT default global widths on components using it ', () {
      final ThemeData theme = FlexColorScheme.light(
        scheme: FlexScheme.materialBaseline,
        useMaterial3: false,
        subThemesData: const FlexSubThemesData(
            // We will override these and should not see them
            // thinBorderWidth: 1,
            // thickBorderWidth: 2,
            ),
      ).toTheme;
      // ToggleButtons thin width
      expect(
        theme.toggleButtonsTheme.borderWidth,
        equals(1),
      );
      final MaterialStateUnderlineInputBorder? border = theme
          .inputDecorationTheme.border as MaterialStateUnderlineInputBorder?;

      // InputDecoration thin width
      expect(
        border?.resolve(<WidgetState>{WidgetState.selected}).borderSide.width,
        equals(1),
      );
      expect(
        border?.resolve(<WidgetState>{}).borderSide.width,
        equals(1),
      );
      // InputDecoration thick width
      expect(
        border?.resolve(<WidgetState>{WidgetState.focused}).borderSide.width,
        equals(2),
      );
      expect(
        border
            ?.resolve(<WidgetState>{WidgetState.focused, WidgetState.error})
            .borderSide
            .width,
        equals(2),
      );
      expect(
        theme.inputDecorationTheme.border?.borderSide.width,
        equals(1),
      );
      // OutlinedButton thin widths
      expect(
        theme.outlinedButtonTheme.style?.side
            ?.resolve(<WidgetState>{WidgetState.selected})?.width,
        equals(1),
      );
      expect(
        theme.outlinedButtonTheme.style?.side
            ?.resolve(<WidgetState>{WidgetState.hovered})?.width,
        equals(1),
      );
      expect(
        theme.outlinedButtonTheme.style?.side
            ?.resolve(<WidgetState>{WidgetState.disabled})?.width,
        equals(1),
      );
      expect(
        theme.outlinedButtonTheme.style?.side
            ?.resolve(<WidgetState>{WidgetState.focused})?.width,
        equals(1),
      );
      // OutlinedButton thick widths
      expect(
        theme.outlinedButtonTheme.style?.side
            ?.resolve(<WidgetState>{WidgetState.error})?.width,
        equals(2),
      );
      expect(
        theme.outlinedButtonTheme.style?.side
            ?.resolve(<WidgetState>{WidgetState.pressed})?.width,
        equals(2),
      );
    });
    test(
        'FCS7.103b GIVEN a FlexColorScheme.light with useMaterial3:true '
        'and a FlexSubThemesData with default global widths set '
        'EXPECT default global widths on components using it ', () {
      final ThemeData theme = FlexColorScheme.light(
        scheme: FlexScheme.materialBaseline,
        useMaterial3: true,
        subThemesData: const FlexSubThemesData(
            // Defaults we should see
            // thinBorderWidth: 1,
            // thickBorderWidth: 2,
            ),
      ).toTheme;
      // ToggleButtons thin width
      expect(
        theme.toggleButtonsTheme.borderWidth,
        equals(1),
      );
      final MaterialStateUnderlineInputBorder? border = theme
          .inputDecorationTheme.border as MaterialStateUnderlineInputBorder?;
      // InputDecoration thin width
      expect(
        border?.resolve(<WidgetState>{WidgetState.disabled}).borderSide.width,
        equals(1),
      );
      expect(
        border?.resolve(<WidgetState>{}).borderSide.width,
        equals(1),
      );
      // InputDecoration thick width
      expect(
        border?.resolve(<WidgetState>{WidgetState.focused}).borderSide.width,
        equals(2),
      );
      expect(
        border
            ?.resolve(<WidgetState>{WidgetState.focused, WidgetState.error})
            .borderSide
            .width,
        equals(2),
      );
      // The general width should not be defined since we used the specific ones
      expect(
        theme.inputDecorationTheme.border?.borderSide.width,
        equals(1),
      );
      // OutlinedButton thin widths, null in M3 which results in 1
      expect(
        theme.outlinedButtonTheme.style?.side
            ?.resolve(<WidgetState>{WidgetState.selected})?.width,
        equals(null),
      );
      expect(
        theme.outlinedButtonTheme.style?.side
            ?.resolve(<WidgetState>{WidgetState.hovered})?.width,
        equals(null),
      );
      expect(
        theme.outlinedButtonTheme.style?.side
            ?.resolve(<WidgetState>{WidgetState.disabled})?.width,
        equals(null),
      );
      expect(
        theme.outlinedButtonTheme.style?.side
            ?.resolve(<WidgetState>{WidgetState.focused})?.width,
        equals(null),
      );
      // OutlinedButton thick widths, null in M3 which results in 1
      expect(
        theme.outlinedButtonTheme.style?.side
            ?.resolve(<WidgetState>{WidgetState.error})?.width,
        equals(null),
      );
      expect(
        theme.outlinedButtonTheme.style?.side
            ?.resolve(<WidgetState>{WidgetState.pressed})?.width,
        equals(null),
      );
    });
    test(
        'FCS7.103c GIVEN a FlexColorScheme.light with useMaterial3:false '
        'and a FlexSubThemesData with custom global widths set '
        'EXPECT custom global widths on components using it ', () {
      final ThemeData theme = FlexColorScheme.light(
        scheme: FlexScheme.materialBaseline,
        useMaterial3: false,
        subThemesData: const FlexSubThemesData(
          thinBorderWidth: 3,
          thickBorderWidth: 4,
        ),
      ).toTheme;
      // ToggleButtons thin width
      expect(
        theme.toggleButtonsTheme.borderWidth,
        equals(3),
      );
      final MaterialStateUnderlineInputBorder? border = theme
          .inputDecorationTheme.border as MaterialStateUnderlineInputBorder?;
      // InputDecoration thin width
      expect(
        border?.resolve(<WidgetState>{WidgetState.disabled}).borderSide.width,
        equals(3),
      );
      expect(
        border?.resolve(<WidgetState>{}).borderSide.width,
        equals(3),
      );
      // InputDecoration thick width
      expect(
        border?.resolve(<WidgetState>{WidgetState.focused}).borderSide.width,
        equals(4),
      );
      expect(
        border
            ?.resolve(<WidgetState>{WidgetState.focused, WidgetState.error})
            .borderSide
            .width,
        equals(4),
      );
      // TODO(rydmike): This is not expected, why do we get this? Study it!
      expect(
        theme.inputDecorationTheme.border?.borderSide.width,
        equals(1),
      );
      // OutlinedButton thin widths
      expect(
        theme.outlinedButtonTheme.style?.side
            ?.resolve(<WidgetState>{WidgetState.selected})?.width,
        equals(3),
      );
      expect(
        theme.outlinedButtonTheme.style?.side
            ?.resolve(<WidgetState>{WidgetState.hovered})?.width,
        equals(3),
      );
      expect(
        theme.outlinedButtonTheme.style?.side
            ?.resolve(<WidgetState>{WidgetState.disabled})?.width,
        equals(3),
      );
      expect(
        theme.outlinedButtonTheme.style?.side
            ?.resolve(<WidgetState>{WidgetState.focused})?.width,
        equals(3),
      );
      // OutlinedButton thick widths
      expect(
        theme.outlinedButtonTheme.style?.side
            ?.resolve(<WidgetState>{WidgetState.error})?.width,
        equals(4),
      );
      expect(
        theme.outlinedButtonTheme.style?.side
            ?.resolve(<WidgetState>{WidgetState.pressed})?.width,
        equals(4),
      );
    });
    test(
        'FCS7.103d GIVEN a FlexColorScheme.light with useMaterial3:true '
        'and a FlexSubThemesData with custom global widths set '
        'EXPECT custom global widths on components using it ', () {
      final ThemeData theme = FlexColorScheme.light(
        scheme: FlexScheme.materialBaseline,
        useMaterial3: true,
        subThemesData: const FlexSubThemesData(
          thinBorderWidth: 3,
          thickBorderWidth: 4,
        ),
      ).toTheme;
      // ToggleButtons thin width
      expect(
        theme.toggleButtonsTheme.borderWidth,
        equals(3),
      );
      // InputDecoration thin width
      final MaterialStateUnderlineInputBorder? border = theme
          .inputDecorationTheme.border as MaterialStateUnderlineInputBorder?;
      expect(
        border?.resolve(<WidgetState>{WidgetState.disabled}).borderSide.width,
        equals(3),
      );
      expect(
        border?.resolve(<WidgetState>{}).borderSide.width,
        equals(3),
      );
      // InputDecoration thick width
      expect(
        border?.resolve(<WidgetState>{WidgetState.focused}).borderSide.width,
        equals(4),
      );
      expect(
        border
            ?.resolve(<WidgetState>{WidgetState.focused, WidgetState.error})
            .borderSide
            .width,
        equals(4),
      );
      // The general width should not be defined since we used the specific ones
      expect(
        theme.inputDecorationTheme.border?.borderSide.width,
        // TODO(rydmike): This is not expected, why do we get this? Study it!
        equals(1),
      );
      // OutlinedButton thin widths
      expect(
        theme.outlinedButtonTheme.style?.side
            ?.resolve(<WidgetState>{WidgetState.selected})?.width,
        equals(3),
      );
      expect(
        theme.outlinedButtonTheme.style?.side
            ?.resolve(<WidgetState>{WidgetState.hovered})?.width,
        equals(3),
      );
      expect(
        theme.outlinedButtonTheme.style?.side
            ?.resolve(<WidgetState>{WidgetState.disabled})?.width,
        equals(3),
      );
      expect(
        theme.outlinedButtonTheme.style?.side
            ?.resolve(<WidgetState>{WidgetState.focused})?.width,
        equals(3),
      );
      // OutlinedButton thick widths
      expect(
        theme.outlinedButtonTheme.style?.side
            ?.resolve(<WidgetState>{WidgetState.error})?.width,
        equals(4),
      );
      expect(
        theme.outlinedButtonTheme.style?.side
            ?.resolve(<WidgetState>{WidgetState.pressed})?.width,
        equals(4),
      );
    });
    test(
        'FCS7.103e GIVEN a FlexColorScheme.light with useMaterial3:false '
        'and a FlexSubThemesData with custom component widths set '
        'EXPECT custom component widths on components using it ', () {
      final ThemeData theme = FlexColorScheme.light(
        scheme: FlexScheme.materialBaseline,
        useMaterial3: false,
        subThemesData: const FlexSubThemesData(
          // We will override these and should not see them
          thinBorderWidth: 3,
          thickBorderWidth: 4,
          // Component overrides we should find instead.
          toggleButtonsBorderWidth: 1.5,
          inputDecoratorBorderWidth: 2.5,
          inputDecoratorFocusedBorderWidth: 3.5,
          outlinedButtonBorderWidth: 0.5,
          outlinedButtonPressedBorderWidth: 1.5,
        ),
      ).toTheme;
      // ToggleButtons thin width
      expect(
        theme.toggleButtonsTheme.borderWidth,
        equals(1.5),
      );
      // InputDecoration thin width
      final MaterialStateUnderlineInputBorder? border = theme
          .inputDecorationTheme.border as MaterialStateUnderlineInputBorder?;
      expect(
        border?.resolve(<WidgetState>{WidgetState.disabled}).borderSide.width,
        equals(2.5),
      );
      expect(
        border?.resolve(<WidgetState>{}).borderSide.width,
        equals(2.5),
      );
      // InputDecoration thick width
      expect(
        border?.resolve(<WidgetState>{WidgetState.focused}).borderSide.width,
        equals(3.5),
      );
      expect(
        border
            ?.resolve(<WidgetState>{WidgetState.focused, WidgetState.error})
            .borderSide
            .width,
        equals(3.5),
      );
      // The general width should not be defined since we used the specific ones
      expect(
        theme.inputDecorationTheme.border?.borderSide.width,
        // TODO(rydmike): This is not expected, why do we get this? Study it!
        equals(1),
      );
      // OutlinedButton thin widths
      expect(
        theme.outlinedButtonTheme.style?.side
            ?.resolve(<WidgetState>{WidgetState.selected})?.width,
        equals(0.5),
      );
      expect(
        theme.outlinedButtonTheme.style?.side
            ?.resolve(<WidgetState>{WidgetState.hovered})?.width,
        equals(0.5),
      );
      expect(
        theme.outlinedButtonTheme.style?.side
            ?.resolve(<WidgetState>{WidgetState.disabled})?.width,
        equals(0.5),
      );
      expect(
        theme.outlinedButtonTheme.style?.side
            ?.resolve(<WidgetState>{WidgetState.focused})?.width,
        equals(0.5),
      );
      // OutlinedButton thick widths
      expect(
        theme.outlinedButtonTheme.style?.side
            ?.resolve(<WidgetState>{WidgetState.error})?.width,
        equals(1.5),
      );
      expect(
        theme.outlinedButtonTheme.style?.side
            ?.resolve(<WidgetState>{WidgetState.pressed})?.width,
        equals(1.5),
      );
    });
    // Test default Slider theming, light M2
    test(
        'FCS7.104a GIVEN a FlexColorScheme.light with useMaterial3:false '
        'and a default FlexSubThemesData '
        'EXPECT Slider default', () {
      final ThemeData theme = FlexColorScheme.light(
        scheme: FlexScheme.materialBaseline,
        useMaterial3: false,
        subThemesData: const FlexSubThemesData(
          tintedDisabledControls: true,
        ),
      ).toTheme;
      expect(
          theme.sliderTheme.toString(minLevel: DiagnosticLevel.debug),
          equalsIgnoringHashCodes(
            const SliderThemeData(
              activeTrackColor: Color(0xff6750a4),
              inactiveTrackColor: Color(0x3d6750a4),
              disabledActiveTrackColor: Color(0x61292041),
              disabledInactiveTrackColor: Color(0x1f000000),
              activeTickMarkColor: Color(0x8affffff),
              inactiveTickMarkColor: Color(0x8a6750a4),
              disabledActiveTickMarkColor: Color(0x1fffffff),
              disabledInactiveTickMarkColor: Color(0x1f000000),
              thumbColor: Color(0xff6750a4),
              disabledThumbColor: Color(0xffadaab6),
              overlayColor: Color(0x00000000),
              valueIndicatorColor: Color(0xff6750a4),
              valueIndicatorShape: RectangularSliderValueIndicatorShape(),
            ).toString(minLevel: DiagnosticLevel.debug),
          ));
    });
    // Test default Slider theming, dark M2
    test(
        'FCS7.104b GIVEN a FlexColorScheme.dark with useMaterial3:false '
        'and a default FlexSubThemesData '
        'EXPECT Slider default', () {
      final ThemeData theme = FlexColorScheme.dark(
        scheme: FlexScheme.materialBaseline,
        useMaterial3: false,
        subThemesData: const FlexSubThemesData(
          tintedDisabledControls: true,
        ),
      ).toTheme;
      expect(
          theme.sliderTheme.toString(minLevel: DiagnosticLevel.debug),
          equalsIgnoringHashCodes(
            const SliderThemeData(
              activeTrackColor: Color(0xffd0bcff),
              inactiveTrackColor: Color(0x3dd0bcff),
              disabledActiveTrackColor: Color(0x61ece4ff),
              disabledInactiveTrackColor: Color(0x1fffffff),
              activeTickMarkColor: Color(0x8a000000),
              inactiveTickMarkColor: Color(0x8ad0bcff),
              disabledActiveTickMarkColor: Color(0x1f000000),
              disabledInactiveTickMarkColor: Color(0x1fffffff),
              thumbColor: Color(0xffd0bcff),
              disabledThumbColor: Color(0xff64616c),
              overlayColor: Color(0x00000000),
              valueIndicatorColor: Color(0xffd0bcff),
              valueIndicatorShape: RectangularSliderValueIndicatorShape(),
            ).toString(minLevel: DiagnosticLevel.debug),
          ));
    });
    test(
        'FCS7.104c GIVEN a FlexColorScheme.light with useMaterial3:false '
        'and custom FlexSubThemesData with tinted value & height 6 '
        'EXPECT Slider with tinted value and height 6', () {
      final ThemeData theme = FlexColorScheme.light(
        scheme: FlexScheme.materialBaseline,
        useMaterial3: false,
        subThemesData: const FlexSubThemesData(
          sliderValueTinted: true,
          sliderTrackHeight: 6,
        ),
      ).toTheme;
      expect(
        theme.sliderTheme.valueIndicatorColor,
        equals(const Color(0xed2e2349)),
      );
      expect(
        theme.sliderTheme.trackHeight,
        equals(6),
      );
      expect(
        theme.sliderTheme.activeTrackColor,
        equals(theme.colorScheme.primary),
      );
    });
    test(
        'FCS7.104c GIVEN a FlexColorScheme.light with useMaterial3:false '
        'and custom FlexSubThemesData with tinted value & height 8 '
        ' and Scheme color tertiary '
        'EXPECT Slider with tinted value and height 8 and tertiary '
        'track ', () {
      final ThemeData theme = FlexColorScheme.light(
        scheme: FlexScheme.materialBaseline,
        useMaterial3: false,
        subThemesData: const FlexSubThemesData(
          sliderValueTinted: true,
          sliderBaseSchemeColor: SchemeColor.tertiary,
          sliderTrackHeight: 8,
        ),
      ).toTheme;
      expect(
        theme.sliderTheme.valueIndicatorColor,
        equals(const Color(0xed37242a)),
      );
      expect(
        theme.sliderTheme.trackHeight,
        equals(8),
      );
      expect(
        theme.sliderTheme.activeTrackColor,
        equals(theme.colorScheme.tertiary),
      );
    });
    // Test default tooltip theming, light M2
    test(
        'FCS7.105a GIVEN a FlexColorScheme.light with useMaterial3:false '
        'and a default FlexSubThemesData '
        'EXPECT Tooltip default', () {
      final FlexColorScheme fcs = FlexColorScheme.light(
        scheme: FlexScheme.materialBaseline,
        useMaterial3: false,
        subThemesData: const FlexSubThemesData(),
      );
      final ThemeData theme = fcs.toTheme;
      final ColorScheme colorScheme = fcs.toScheme;
      expect(
        theme.tooltipTheme.decoration,
        equals(
          BoxDecoration(
            color: FlexColor.darkSurface.blendAlpha(colorScheme.primary, 0x72),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: theme.dividerColor),
          ),
        ),
      );
      expect(
        theme.tooltipTheme.textStyle!.color,
        equals(Colors.white),
      );
      expect(
        theme.tooltipTheme.textStyle!.fontSize,
        equals(14),
      );
    });
    test(
        'FCS7.105b GIVEN a FlexColorScheme.dark with useMaterial3:false '
        'and a custom FlexSubThemesData '
        'EXPECT Tooltip with custom results', () {
      final FlexColorScheme fcs = FlexColorScheme.dark(
        scheme: FlexScheme.materialBaseline,
        useMaterial3: false,
        subThemesData: const FlexSubThemesData(
          tooltipRadius: 12,
        ),
      );
      final ThemeData theme = fcs.toTheme;
      final ColorScheme colorScheme = fcs.toScheme;
      expect(
        theme.tooltipTheme.decoration,
        equals(
          BoxDecoration(
            color: FlexColor.lightSurface.blendAlpha(colorScheme.primary, 0x63),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            border: Border.all(color: theme.dividerColor),
          ),
        ),
      );
      expect(
        theme.tooltipTheme.textStyle!.color,
        equals(Colors.black),
      );
      expect(
        theme.tooltipTheme.textStyle!.fontSize,
        equals(14),
      );
    });
    test(
        'FCS7.105c GIVEN a FlexColorScheme.dark with useMaterial3:false '
        'and a custom FlexSubThemesData '
        'EXPECT Tooltip with custom results', () {
      final FlexColorScheme fcs = FlexColorScheme.dark(
        scheme: FlexScheme.materialBaseline,
        useMaterial3: false,
        tooltipsMatchBackground: true,
        subThemesData: const FlexSubThemesData(
          tooltipRadius: 12,
        ),
      );
      final ThemeData theme = fcs.toTheme;
      final ColorScheme colorScheme = fcs.toScheme;
      expect(
        theme.tooltipTheme.decoration,
        equals(
          BoxDecoration(
            color: FlexColor.darkSurface
                .blendAlpha(colorScheme.primary, 0x28)
                .withAlpha(0xF2),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            border: Border.all(color: theme.dividerColor),
          ),
        ),
      );
      expect(
        theme.tooltipTheme.textStyle!.color,
        equals(Colors.white),
      );
      expect(
        theme.tooltipTheme.textStyle!.fontSize,
        equals(14),
      );
    });
    test(
        'FCS7.105d GIVEN a FlexColorScheme.dark with useMaterial3:false '
        'and a custom FlexSubThemesData '
        'EXPECT Tooltip with custom results', () {
      final FlexColorScheme fcs = FlexColorScheme.dark(
        scheme: FlexScheme.materialBaseline,
        useMaterial3: false,
        tooltipsMatchBackground: true,
        subThemesData: const FlexSubThemesData(
          tooltipRadius: 12,
          tooltipOpacity: 0.5,
        ),
      );
      final ThemeData theme = fcs.toTheme;
      final ColorScheme colorScheme = fcs.toScheme;
      expect(
        theme.tooltipTheme.decoration,
        equals(
          BoxDecoration(
            color: FlexColor.darkSurface
                .blendAlpha(colorScheme.primary, 0x28)
                .withAlpha(0xF2)
                .withOpacity(0.5),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            border: Border.all(color: theme.dividerColor),
          ),
        ),
      );
      expect(
        theme.tooltipTheme.textStyle!.color,
        equals(Colors.white),
      );
      expect(
        theme.tooltipTheme.textStyle!.fontSize,
        equals(14),
      );
    });
    test(
        'FCS7.105e GIVEN a FlexColorScheme.dark with useMaterial3:false '
        'and a custom FlexSubThemesData '
        'EXPECT Tooltip with custom results', () {
      final FlexColorScheme fcs = FlexColorScheme.dark(
        scheme: FlexScheme.materialBaseline,
        useMaterial3: false,
        tooltipsMatchBackground: true,
        subThemesData: const FlexSubThemesData(
          tooltipRadius: 12,
          tooltipSchemeColor: SchemeColor.tertiaryContainer,
          tooltipOpacity: 0.5,
          tooltipWaitDuration: Duration(seconds: 1),
          tooltipShowDuration: Duration(milliseconds: 2500),
        ),
      );
      final ThemeData theme = fcs.toTheme;
      final ColorScheme colorScheme = fcs.toScheme;
      expect(
        theme.tooltipTheme.decoration,
        equals(
          BoxDecoration(
            color: colorScheme.tertiaryContainer
                .withAlpha(Color.getAlphaFromOpacity(0.5)),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            border: Border.all(color: theme.dividerColor),
          ),
        ),
      );
      expect(
        theme.tooltipTheme.textStyle!.color,
        equals(Colors.white),
      );
      expect(
        theme.tooltipTheme.textStyle!.fontSize,
        equals(14),
      );
      expect(
        theme.tooltipTheme.waitDuration,
        const Duration(seconds: 1),
      );
      expect(
        theme.tooltipTheme.showDuration,
        const Duration(milliseconds: 2500),
      );
    });
    // Test FlexKeys noOnMainsTint and noOnSurfacesTint
    test(
        'FCS7.106a GIVEN a FlexColorScheme.light with useMaterial3:true '
        'and a default FlexSubThemesData() and no tints on colors '
        'EXPECT correct and only BW onColors', () {
      final FlexColorScheme fcs = FlexColorScheme.light(
        scheme: FlexScheme.materialBaseline,
        useMaterial3: true,
        subThemesData: const FlexSubThemesData(),
        keyColors: const FlexKeyColors(useSecondary: true, useTertiary: true),
        tones:
            FlexTones.jolly(Brightness.light).onMainsUseBW().onSurfacesUseBW(),
      );
      final ColorScheme scheme = fcs.toScheme;
      expect(scheme.onPrimary, Colors.white);
      expect(scheme.onPrimaryContainer, Colors.black);
      expect(scheme.onSecondary, Colors.white);
      expect(scheme.onSecondaryContainer, Colors.black);
      expect(scheme.onTertiary, Colors.white);
      expect(scheme.onTertiaryContainer, Colors.black);
      expect(scheme.onError, Colors.white);
      expect(scheme.onErrorContainer, Colors.black);
      //
      expect(scheme.onSurface, Colors.black);
      expect(scheme.onSurfaceVariant, Colors.black);
      expect(scheme.onInverseSurface, Colors.white);
    });
    // Test FlexKeys noOnMainsTint and noOnSurfacesTint
    test(
        'FCS7.106a GIVEN a FlexColorScheme.dark with useMaterial3:true '
        'and a default FlexSubThemesData() and no tints on colors '
        'EXPECT correct and only BW onColors', () {
      final FlexColorScheme fcs = FlexColorScheme.dark(
        scheme: FlexScheme.materialBaseline,
        useMaterial3: true,
        subThemesData: const FlexSubThemesData(),
        keyColors: const FlexKeyColors(
          useSecondary: true,
          useTertiary: true,
        ),
        tones:
            FlexTones.jolly(Brightness.dark).onMainsUseBW().onSurfacesUseBW(),
      );
      final ColorScheme scheme = fcs.toScheme;
      expect(scheme.onPrimary, Colors.black);
      expect(scheme.onPrimaryContainer, Colors.white);
      expect(scheme.onSecondary, Colors.black);
      expect(scheme.onSecondaryContainer, Colors.white);
      expect(scheme.onTertiary, Colors.black);
      expect(scheme.onTertiaryContainer, Colors.white);
      expect(scheme.onError, Colors.black);
      expect(scheme.onErrorContainer, Colors.white);
      //
      expect(scheme.onSurface, Colors.white);
      expect(scheme.onSurfaceVariant, Colors.white);
      expect(scheme.onInverseSurface, Colors.black);
    });
    test(
        'FCS7.107a GIVEN a FlexColorScheme.light with useMaterial3:true '
        'and a using M2 style divider '
        'EXPECT M2 divider theme color in M3', () {
      final FlexColorScheme fcs = FlexColorScheme.light(
        scheme: FlexScheme.materialBaseline,
        useMaterial3: true,
        subThemesData: const FlexSubThemesData(
          useM2StyleDividerInM3: true,
        ),
      );
      final ThemeData theme = fcs.toTheme;
      expect(
        theme.dividerTheme.color,
        equals(const Color(0x1F000000)),
      );
      expect(
        theme.dividerColor,
        equals(const Color(0x1F000000)),
      );
    });
    test(
        'FCS7.107b GIVEN a FlexColorScheme.dark with useMaterial3:true '
        'and a using M2 style divider '
        'EXPECT M2 divider theme color in M3', () {
      final FlexColorScheme fcs = FlexColorScheme.dark(
        scheme: FlexScheme.materialBaseline,
        useMaterial3: true,
        subThemesData: const FlexSubThemesData(
          useM2StyleDividerInM3: true,
        ),
      );
      final ThemeData theme = fcs.toTheme;
      expect(
        theme.dividerTheme.color,
        equals(const Color(0x1FFFFFFF)),
      );
      expect(
        theme.dividerColor,
        equals(const Color(0x1FFFFFFF)),
      );
    });
    test(
        'FCS7.107c GIVEN a FlexColorScheme.light with useMaterial3:true '
        'and a using M2 style divider '
        'EXPECT M2 divider theme color in M3', () {
      final FlexColorScheme fcs = FlexColorScheme.light(
        scheme: FlexScheme.materialBaseline,
        useMaterial3: true,
        subThemesData: const FlexSubThemesData(
          useM2StyleDividerInM3: false,
        ),
      );
      final ThemeData theme = fcs.toTheme;
      final ColorScheme colorScheme = fcs.toScheme;
      expect(
        theme.dividerTheme.color,
        equals(null),
      );
      expect(
        theme.dividerColor,
        equals(colorScheme.outlineVariant),
      );
    });
    test(
        'FCS7.108a GIVEN a FlexColorScheme.light with useMaterial3:true '
        'and using Flutter default TabBar '
        'EXPECT M2 divider theme color in M3', () {
      final FlexColorScheme fcs = FlexColorScheme.light(
        scheme: FlexScheme.materialBaseline,
        useMaterial3: true,
        tabBarStyle: FlexTabBarStyle.flutterDefault,
        subThemesData: const FlexSubThemesData(
          useM2StyleDividerInM3: true,
        ),
      );
      final ThemeData theme = fcs.toTheme;
      final ColorScheme colorScheme = fcs.toScheme;
      expect(
        theme.tabBarTheme.unselectedLabelColor,
        equals(colorScheme.onSurface),
      );
      expect(
        theme.tabBarTheme.labelColor,
        equals(colorScheme.primary),
      );
    });
    test(
        'FCS7.109a GIVEN a FlexColorScheme.light with useMaterial3:true '
        'and using Flutter Slider with baseSchemeColor secondaryContainer '
        'EXPECT slider and indicator of secondaryContainer', () {
      final FlexColorScheme fcs = FlexColorScheme.light(
        scheme: FlexScheme.materialBaseline,
        useMaterial3: true,
        subThemesData: const FlexSubThemesData(
          sliderBaseSchemeColor: SchemeColor.secondaryContainer,
        ),
      );
      final ThemeData theme = fcs.toTheme;
      final ColorScheme colorScheme = fcs.toScheme;
      expect(
        theme.sliderTheme.valueIndicatorColor,
        equals(colorScheme.secondaryContainer),
      );
      expect(
        theme.sliderTheme.activeTrackColor,
        equals(colorScheme.secondaryContainer),
      );
      expect(
        theme.sliderTheme.thumbColor,
        equals(colorScheme.secondaryContainer),
      );
    });
    test(
        'FCS7.109a GIVEN a FlexColorScheme.light with useMaterial3:true '
        'and using Flutter Slider with baseSchemeColor primaryContainer '
        'and sliderIndicatorSchemeColor inversePrimary '
        'EXPECT slider primaryContainer and indicator of inversePrimary', () {
      final FlexColorScheme fcs = FlexColorScheme.light(
        scheme: FlexScheme.materialBaseline,
        useMaterial3: true,
        subThemesData: const FlexSubThemesData(
          sliderBaseSchemeColor: SchemeColor.primaryContainer,
          sliderIndicatorSchemeColor: SchemeColor.inversePrimary,
        ),
      );
      final ThemeData theme = fcs.toTheme;
      final ColorScheme colorScheme = fcs.toScheme;
      expect(
        theme.sliderTheme.valueIndicatorColor,
        equals(colorScheme.inversePrimary),
      );
      expect(
        theme.sliderTheme.activeTrackColor,
        equals(colorScheme.primaryContainer),
      );
      expect(
        theme.sliderTheme.thumbColor,
        equals(colorScheme.primaryContainer),
      );
    });
    test(
        'FCS7.110a GIVEN a FlexColorScheme.light with useMaterial3:true '
        'and using not using subTheme but bottomAppBarElevation 2 '
        'EXPECT bottom appbar theme with elevation 2', () {
      final FlexColorScheme fcs = FlexColorScheme.light(
        scheme: FlexScheme.materialBaseline,
        useMaterial3: true,
        bottomAppBarElevation: 2,
      );
      final ThemeData theme = fcs.toTheme;
      expect(
        theme.bottomAppBarTheme.elevation,
        equals(2),
      );
    });
    test(
        'FCS7.110a GIVEN a FlexColorScheme.light with useMaterial3:true '
        'and using not using subTheme and bottomAppBar elevation none', () {
      final FlexColorScheme fcs = FlexColorScheme.light(
        scheme: FlexScheme.materialBaseline,
        useMaterial3: true,
      );
      final ThemeData theme = fcs.toTheme;
      expect(
        theme.bottomAppBarTheme.elevation,
        equals(null),
      );
    });
    test(
        'FCS7.111a GIVEN a FlexColorScheme.light with useMaterial3:true '
        'and using not using subTheme but appBarOpacity 0.5 '
        'EXPECT bottom appbar background with surface opacity 0.5', () {
      final FlexColorScheme fcs = FlexColorScheme.light(
        scheme: FlexScheme.materialBaseline,
        useMaterial3: true,
        appBarOpacity: 0.5,
      );
      final ThemeData theme = fcs.toTheme;
      final ColorScheme colorScheme = fcs.toScheme;
      expect(
        theme.appBarTheme.backgroundColor,
        equals(colorScheme.surface.withOpacity(0.5)),
      );
    });
    test(
        'FCS7.111b GIVEN a FlexColorScheme.light with useMaterial3:false '
        'and using not using subTheme but appBarOpacity 0.5 '
        'EXPECT bottom appbar background with primary opacity 0.5', () {
      final FlexColorScheme fcs = FlexColorScheme.light(
        scheme: FlexScheme.materialBaseline,
        useMaterial3: false,
        appBarOpacity: 0.5,
      );
      final ThemeData theme = fcs.toTheme;
      final ColorScheme colorScheme = fcs.toScheme;
      expect(
        theme.appBarTheme.backgroundColor,
        equals(colorScheme.primary.withOpacity(0.5)),
      );
    });
    test(
        'FCS7.111c GIVEN a FlexColorScheme.dark with useMaterial3:true '
        'and using not using subTheme but appBarOpacity 0.5 '
        'EXPECT bottom appbar background with surface opacity 0.5', () {
      final FlexColorScheme fcs = FlexColorScheme.dark(
        scheme: FlexScheme.materialBaseline,
        useMaterial3: true,
        appBarOpacity: 0.5,
      );
      final ThemeData theme = fcs.toTheme;
      final ColorScheme colorScheme = fcs.toScheme;
      expect(
        theme.appBarTheme.backgroundColor,
        equals(colorScheme.surface.withOpacity(0.5)),
      );
    });
    test(
        'FCS7.111d GIVEN a FlexColorScheme.dark with useMaterial3:true '
        'and using not using subTheme but appBarOpacity 0.5 '
        'EXPECT bottom appbar background with surface opacity 0.5', () {
      final FlexColorScheme fcs = FlexColorScheme.dark(
        scheme: FlexScheme.materialBaseline,
        useMaterial3: false,
        appBarOpacity: 0.5,
      );
      final ThemeData theme = fcs.toTheme;
      final ColorScheme colorScheme = fcs.toScheme;
      expect(
        theme.appBarTheme.backgroundColor,
        equals(colorScheme.surface.withOpacity(0.5)),
      );
    });
    test(
        'FCS7.111e GIVEN a FlexColorScheme.light with useMaterial3:false '
        'and using not using subTheme but appBarOpacity 0.5 '
        'EXPECT bottom appbar background with primary opacity 0.5', () {
      final FlexColorScheme fcs = FlexColorScheme.light(
        colors: const FlexSchemeColor(
          primary: Colors.blue,
          secondary: Colors.red,
        ),
        useMaterial3: false,
        appBarOpacity: 0.5,
        appBarStyle: FlexAppBarStyle.custom,
      );
      final ThemeData theme = fcs.toTheme;
      final ColorScheme colorScheme = fcs.toScheme;
      expect(
        theme.appBarTheme.backgroundColor,
        equals(colorScheme.primary.withOpacity(0.5)),
      );
    });
    test(
        'FCS7.111f GIVEN a FlexColorScheme.dark with useMaterial3:false '
        'and using not using subTheme but appBarOpacity 0.6 '
        'EXPECT bottom appbar background with primary opacity 0.6', () {
      final FlexColorScheme fcs = FlexColorScheme.dark(
        colors: const FlexSchemeColor(
          primary: Colors.blue,
          secondary: Colors.red,
        ),
        useMaterial3: false,
        appBarOpacity: 0.6,
        appBarStyle: FlexAppBarStyle.custom,
      );
      final ThemeData theme = fcs.toTheme;
      final ColorScheme colorScheme = fcs.toScheme;
      expect(
        theme.appBarTheme.backgroundColor,
        equals(colorScheme.primary.withOpacity(0.6)),
      );
    });
    test(
        'FCS7.112a GIVEN a FlexColorScheme.light with useMaterial3:true '
        'and removing tint and adding shadows '
        'EXPECT given sub themes with tint removed and shadow added on sub '
        'themes', () {
      final FlexColorScheme fcs = FlexColorScheme.light(
        scheme: FlexScheme.materialBaseline,
        useMaterial3: true,
        platform: TargetPlatform.android,
        subThemesData: const FlexSubThemesData(
          adaptiveRemoveElevationTint: FlexAdaptive.all(),
          adaptiveElevationShadowsBack: FlexAdaptive.all(),
          adaptiveAppBarScrollUnderOff: FlexAdaptive.all(),
        ),
      );
      final ThemeData theme = fcs.toTheme;
      final ColorScheme colorScheme = fcs.toScheme;
      // Sub-themes that should get transparent surface tint with remove tint.
      // and sub-theme, that should get shadow color, with shadows back.
      //
      // AppBar
      expect(
        theme.appBarTheme.surfaceTintColor,
        equals(Colors.transparent),
      );
      expect(
        theme.appBarTheme.shadowColor,
        equals(colorScheme.shadow),
      );
      // BottomAppBar
      expect(
        theme.bottomAppBarTheme.surfaceTintColor,
        equals(Colors.transparent),
      );
      // BottomSheet
      expect(
        theme.bottomSheetTheme.surfaceTintColor,
        equals(Colors.transparent),
      );
      // Card
      expect(
        theme.cardTheme.surfaceTintColor,
        equals(Colors.transparent),
      );
      // Chip
      expect(
        theme.chipTheme.surfaceTintColor,
        equals(Colors.transparent),
      );
      // Dialog
      expect(
        theme.dialogTheme.surfaceTintColor,
        equals(Colors.transparent),
      );
      expect(
        theme.dialogTheme.shadowColor,
        equals(colorScheme.shadow),
      );
      // Drawer
      expect(
        theme.drawerTheme.surfaceTintColor,
        equals(Colors.transparent),
      );
      expect(
        theme.drawerTheme.shadowColor,
        equals(colorScheme.shadow),
      );
      // DropDownMenu
      expect(
        theme.dropdownMenuTheme.menuStyle!.surfaceTintColor!
            .resolve(<WidgetState>{}),
        equals(Colors.transparent),
      );
      // MenuBar
      expect(
        theme.menuBarTheme.style!.surfaceTintColor!.resolve(<WidgetState>{}),
        equals(Colors.transparent),
      );
      // Menu
      expect(
        theme.menuTheme.style!.surfaceTintColor!.resolve(<WidgetState>{}),
        equals(Colors.transparent),
      );
      // NavigationBar
      expect(
        theme.navigationBarTheme.shadowColor,
        equals(colorScheme.shadow),
      );
      // NavigationDrawer
      expect(
        theme.navigationDrawerTheme.surfaceTintColor,
        equals(Colors.transparent),
      );
      expect(
        theme.navigationDrawerTheme.shadowColor,
        equals(colorScheme.shadow),
      );
      // PopupMenuButton
      expect(
        theme.popupMenuTheme.surfaceTintColor,
        equals(Colors.transparent),
      );
    });
    test(
        'FCS7.112b GIVEN a FlexColorScheme.light with useMaterial3:true '
        'and adaptive removing tint and adding shadows '
        'EXPECT given sub themes with tint adaptive and shadow '
        'adaptive on sub themes on iOS platform', () {
      final FlexColorScheme fcs = FlexColorScheme.light(
        scheme: FlexScheme.materialBaseline,
        useMaterial3: true,
        platform: TargetPlatform.iOS,
        subThemesData: const FlexSubThemesData(
          adaptiveRemoveElevationTint: FlexAdaptive.iOSAndDesktop(),
          adaptiveRemoveNavigationBarTint: FlexAdaptive.iOSAndDesktop(),
          adaptiveElevationShadowsBack: FlexAdaptive.iOSAndDesktop(),
        ),
      );
      final ThemeData theme = fcs.toTheme;
      final ColorScheme colorScheme = fcs.toScheme;
      // Sub-themes that should get transparent surface tint with remove tint.
      // and sub-theme, that should get shadow color, with shadows back.
      //
      // AppBar
      expect(
        theme.appBarTheme.surfaceTintColor,
        // Tint is kept on AppBar when using adaptiveRemoveElevationTint
        equals(null),
      );
      expect(
        theme.appBarTheme.shadowColor,
        equals(colorScheme.shadow),
        // don't use it otherwise either on native AppBars
      );
      // BottomAppBar
      expect(
        theme.bottomAppBarTheme.surfaceTintColor,
        equals(Colors.transparent),
      );
      // BottomSheet
      expect(
        theme.bottomSheetTheme.surfaceTintColor,
        equals(Colors.transparent),
      );
      // Card
      expect(
        theme.cardTheme.surfaceTintColor,
        equals(Colors.transparent),
      );
      // Chip
      expect(
        theme.chipTheme.surfaceTintColor,
        equals(Colors.transparent),
      );
      // Dialog
      expect(
        theme.dialogTheme.surfaceTintColor,
        equals(Colors.transparent),
      );
      expect(
        theme.dialogTheme.shadowColor,
        equals(colorScheme.shadow),
      );
      // Drawer
      expect(
        theme.drawerTheme.surfaceTintColor,
        equals(Colors.transparent),
      );
      expect(
        theme.drawerTheme.shadowColor,
        equals(colorScheme.shadow),
      );
      // DropDownMenu
      expect(
        theme.dropdownMenuTheme.menuStyle!.surfaceTintColor!
            .resolve(<WidgetState>{}),
        equals(Colors.transparent),
      );
      // MenuBar
      expect(
        theme.menuBarTheme.style!.surfaceTintColor!.resolve(<WidgetState>{}),
        equals(Colors.transparent),
      );
      // Menu
      expect(
        theme.menuTheme.style!.surfaceTintColor!.resolve(<WidgetState>{}),
        equals(Colors.transparent),
      );
      // NavigationBar
      expect(
        theme.navigationBarTheme.surfaceTintColor,
        equals(Colors.transparent),
      );
      expect(
        theme.navigationBarTheme.shadowColor,
        equals(colorScheme.shadow),
      );
      // NavigationDrawer
      expect(
        theme.navigationDrawerTheme.surfaceTintColor,
        equals(Colors.transparent),
      );
      expect(
        theme.navigationDrawerTheme.shadowColor,
        equals(colorScheme.shadow),
      );
      // PopupMenuButton
      expect(
        theme.popupMenuTheme.surfaceTintColor,
        equals(Colors.transparent),
      );
    });
    test(
        'FCS7.112c GIVEN a FlexColorScheme.light with useMaterial3:true '
        'and adaptive removing tint and adding shadows '
        'EXPECT given sub themes with tint adaptive and shadow '
        'adaptive on sub themes on macOS platform', () {
      final FlexColorScheme fcs = FlexColorScheme.light(
        scheme: FlexScheme.materialBaseline,
        useMaterial3: true,
        platform: TargetPlatform.macOS,
        subThemesData: const FlexSubThemesData(
          adaptiveRemoveElevationTint: FlexAdaptive.iOSAndDesktop(),
          adaptiveRemoveNavigationBarTint: FlexAdaptive.iOSAndDesktop(),
          adaptiveElevationShadowsBack: FlexAdaptive.iOSAndDesktop(),
          adaptiveAppBarScrollUnderOff: FlexAdaptive.iOSAndDesktop(),
          adaptiveRadius: FlexAdaptive.iOSAndDesktop(),
          defaultRadiusAdaptive: 8,
        ),
      );
      final ThemeData theme = fcs.toTheme;
      final ColorScheme colorScheme = fcs.toScheme;

      // Expect CardRadius to be 10 with mock macOS target
      expect(
        theme.cardTheme.shape,
        equals(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
      );
      // Sub-themes that should get transparent surface tint with remove tint.
      // and sub-theme, that should get shadow color, with shadows back.
      //
      // AppBar
      expect(
        theme.appBarTheme.surfaceTintColor,
        equals(Colors.transparent),
      );
      expect(
        theme.appBarTheme.shadowColor,
        equals(colorScheme.shadow),
      );
      // BottomAppBar
      expect(
        theme.bottomAppBarTheme.surfaceTintColor,
        equals(Colors.transparent),
      );
      // BottomSheet
      expect(
        theme.bottomSheetTheme.surfaceTintColor,
        equals(Colors.transparent),
      );
      // Card
      expect(
        theme.cardTheme.surfaceTintColor,
        equals(Colors.transparent),
      );
      // Chip
      expect(
        theme.chipTheme.surfaceTintColor,
        equals(Colors.transparent),
      );
      // Dialog
      expect(
        theme.dialogTheme.surfaceTintColor,
        equals(Colors.transparent),
      );
      expect(
        theme.dialogTheme.shadowColor,
        equals(colorScheme.shadow),
      );
      // Drawer
      expect(
        theme.drawerTheme.surfaceTintColor,
        equals(Colors.transparent),
      );
      expect(
        theme.drawerTheme.shadowColor,
        equals(colorScheme.shadow),
      );
      // DropDownMenu
      expect(
        theme.dropdownMenuTheme.menuStyle!.surfaceTintColor!
            .resolve(<WidgetState>{}),
        equals(Colors.transparent),
      );
      // MenuBar
      expect(
        theme.menuBarTheme.style!.surfaceTintColor!.resolve(<WidgetState>{}),
        equals(Colors.transparent),
      );
      // Menu
      expect(
        theme.menuTheme.style!.surfaceTintColor!.resolve(<WidgetState>{}),
        equals(Colors.transparent),
      );
      // NavigationBar
      expect(
        theme.navigationBarTheme.surfaceTintColor,
        equals(Colors.transparent),
      );
      expect(
        theme.navigationBarTheme.shadowColor,
        equals(colorScheme.shadow),
      );
      // NavigationDrawer
      expect(
        theme.navigationDrawerTheme.surfaceTintColor,
        equals(Colors.transparent),
      );
      expect(
        theme.navigationDrawerTheme.shadowColor,
        equals(colorScheme.shadow),
      );
      // PopupMenuButton
      expect(
        theme.popupMenuTheme.surfaceTintColor,
        equals(Colors.transparent),
      );
    });
    test(
        'FCS7.112d GIVEN a FlexColorScheme.light with useMaterial3:true '
        'and adaptive removing tint and adding shadows '
        'EXPECT given sub themes with tint ADAPTIVE and shadow '
        'ADAPTIVE on sub themes on ANDROID platform', () {
      final FlexColorScheme fcs = FlexColorScheme.light(
        scheme: FlexScheme.materialBaseline,
        useMaterial3: true,
        platform: TargetPlatform.android,
        subThemesData: const FlexSubThemesData(
          adaptiveRemoveElevationTint: FlexAdaptive.iOSAndDesktop(),
          adaptiveRemoveNavigationBarTint: FlexAdaptive.iOSAndDesktop(),
          adaptiveElevationShadowsBack: FlexAdaptive.iOSAndDesktop(),
        ),
      );
      final ThemeData theme = fcs.toTheme;
      // Sub-themes that should get transparent surface tint with remove tint.
      // and sub-theme, that should get shadow color, with shadows back.
      //
      // AppBar
      expect(
        theme.appBarTheme.surfaceTintColor,
        equals(null),
      );
      expect(
        theme.appBarTheme.shadowColor,
        equals(null),
      );
      // BottomAppBar
      expect(
        theme.bottomAppBarTheme.surfaceTintColor,
        equals(null),
      );
      // BottomSheet
      expect(
        theme.bottomSheetTheme.surfaceTintColor,
        equals(null),
      );
      // Card
      expect(
        theme.cardTheme.surfaceTintColor,
        equals(null),
      );
      // Chip
      expect(
        theme.chipTheme.surfaceTintColor,
        equals(null),
      );
      // Dialog
      expect(
        theme.dialogTheme.surfaceTintColor,
        equals(null),
      );
      expect(
        theme.dialogTheme.shadowColor,
        equals(null),
      );
      // Drawer
      expect(
        theme.drawerTheme.surfaceTintColor,
        equals(null),
      );
      expect(
        theme.drawerTheme.shadowColor,
        equals(null),
      );
      // DropDownMenu
      expect(
        theme.dropdownMenuTheme.menuStyle?.surfaceTintColor,
        equals(null),
      );
      // MenuBar
      expect(
        theme.menuBarTheme.style?.surfaceTintColor,
        equals(null),
      );
      // Menu
      expect(
        theme.menuTheme.style?.surfaceTintColor,
        equals(null),
      );
      // NavigationBar
      expect(
        theme.navigationBarTheme.surfaceTintColor,
        equals(null),
      );
      expect(
        theme.navigationBarTheme.shadowColor,
        equals(null),
      );
      // NavigationDrawer
      expect(
        theme.navigationDrawerTheme.surfaceTintColor,
        equals(null),
      );
      expect(
        theme.navigationDrawerTheme.shadowColor,
        equals(null),
      );
      // PopupMenuButton
      expect(
        theme.popupMenuTheme.surfaceTintColor,
        equals(null),
      );
    });
  });

  group('FCS8: New v7 tests WITH FlexColorScheme.toTheme ', () {
    TestWidgetsFlutterBinding.ensureInitialized();

    test(
        'FCS8:1 GIVEN a FlexColorScheme.light with useMaterial3:true '
        'and use textTheme and a custom tabBar theme', () {
      final FlexColorScheme fcs = FlexColorScheme.light(
          scheme: FlexScheme.materialBaseline,
          useMaterial3: true,
          subThemesData: const FlexSubThemesData(
              useMaterial3Typography: true,
              tabBarItemSchemeColor: SchemeColor.secondary));
      final ColorScheme scheme = fcs.toScheme;
      final ThemeData theme = fcs.toTheme;
      expect(
        theme.typography,
        equals(Typography.material2021(
            platform: defaultTargetPlatform, colorScheme: scheme)),
      );
      expect(
        theme.tabBarTheme.unselectedLabelColor,
        equals(scheme.onSurfaceVariant),
      );
    });
    test(
        'FCS8:2 GIVEN a FlexColorScheme.light with useMaterial3:false '
        'and a custom tabBar theme', () {
      final FlexColorScheme fcs = FlexColorScheme.light(
          useMaterial3: false,
          scheme: FlexScheme.materialBaseline,
          subThemesData: const FlexSubThemesData(
              tabBarItemSchemeColor: SchemeColor.tertiary));
      final ColorScheme scheme = fcs.toScheme;
      final ThemeData theme = fcs.toTheme;
      expect(
        theme.tabBarTheme.unselectedLabelColor,
        equals(scheme.tertiary.withOpacity(0.7)),
      );
    });
    test(
        'FCS8:3 GIVEN a FlexColorScheme.light with useMaterial3:false '
        'and a custom tabBar theme', () {
      final FlexColorScheme fcs = FlexColorScheme.light(
          useMaterial3: false,
          scheme: FlexScheme.materialBaseline,
          subThemesData: const FlexSubThemesData(
            tabBarItemSchemeColor: SchemeColor.tertiary,
            tabBarUnselectedItemSchemeColor: SchemeColor.tertiaryContainer,
            tabBarUnselectedItemOpacity: 0.45,
          ));
      final ColorScheme scheme = fcs.toScheme;
      final ThemeData theme = fcs.toTheme;
      expect(
        theme.tabBarTheme.unselectedLabelColor,
        equals(scheme.tertiaryContainer.withOpacity(0.45)),
      );
    });
  });

  group('FCS8: ISSUE-118-Light WITH FlexColorScheme.toTheme ', () {
    // Tests for issue:
    // https://github.com/rydmike/flex_color_scheme/issues/118
    TestWidgetsFlutterBinding.ensureInitialized();
    test(
        'FCS-ISSUE-118-Light-M2: GIVEN a FlexColorScheme.light with defined '
        'colorScheme, expect toScheme and toTheme to contain the ColorScheme, '
        'provided that no seeding or surface blend is used.', () {
      // Make a full ColorScheme from a SeedColor, and also override
      // surfaceVariant with pure red.
      final ColorScheme schemeLight = ColorScheme.fromSeed(
        brightness: Brightness.light,
        seedColor: const Color(0xffffcf33),
      );
      final FlexColorScheme fcs = FlexColorScheme.light(
        colorScheme: schemeLight,
        tooltipsMatchBackground: true,
        useMaterial3: false,
        scaffoldBackground: schemeLight.surface,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
      );
      final ColorScheme scheme = fcs.toScheme;
      final ThemeData theme = fcs.toTheme;
      expect(
        scheme,
        equals(schemeLight),
      );
      expect(
        theme.colorScheme,
        equals(schemeLight),
      );
    });
    test(
        'FCS-ISSUE-118-Dark-M2: GIVEN a FlexColorScheme.dark with defined '
        'colorScheme, expect toScheme and toTheme to contain the ColorScheme, '
        'provided that no seeding or surface blend is used.', () {
      // Make a full ColorScheme from a SeedColor, and also override
      // surfaceVariant with pure red.
      final ColorScheme schemeDark = ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: const Color(0xffffcf33),
      );
      final FlexColorScheme fcs = FlexColorScheme.dark(
        colorScheme: schemeDark,
        tooltipsMatchBackground: true,
        useMaterial3: false,
        scaffoldBackground: schemeDark.surface,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
      );
      final ColorScheme scheme = fcs.toScheme;
      final ThemeData theme = fcs.toTheme;
      expect(
        scheme,
        equals(schemeDark),
      );
      expect(
        theme.colorScheme,
        equals(schemeDark),
      );
    });
    test(
        'FCS-ISSUE-118-Light-M3: GIVEN a FlexColorScheme.light with defined '
        'colorScheme, expect toScheme and toTheme to contain the ColorScheme, '
        'provided that no seeding or surface blend is used.', () {
      // Make a full ColorScheme from a SeedColor, and also override
      // surfaceVariant with pure red.
      final ColorScheme schemeLight = ColorScheme.fromSeed(
        brightness: Brightness.light,
        seedColor: const Color(0xffffcf33),
      );
      final FlexColorScheme fcs = FlexColorScheme.light(
        colorScheme: schemeLight,
        tooltipsMatchBackground: true,
        useMaterial3: true,
        scaffoldBackground: schemeLight.surface,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
      );
      final ColorScheme scheme = fcs.toScheme;
      final ThemeData theme = fcs.toTheme;
      expect(
        scheme,
        equals(schemeLight),
      );
      expect(
        theme.colorScheme,
        equals(schemeLight),
      );
    });
    test(
        'FCS-ISSUE-118-Dark-M3: GIVEN a FlexColorScheme.dark with defined '
        'colorScheme, expect toScheme and toTheme to contain the ColorScheme, '
        'provided that no seeding or surface blend is used.', () {
      // Make a full ColorScheme from a SeedColor, and also override
      // surfaceVariant with pure red.
      final ColorScheme schemeDark = ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: const Color(0xffffcf33),
      );
      final FlexColorScheme fcs = FlexColorScheme.dark(
        colorScheme: schemeDark,
        tooltipsMatchBackground: true,
        useMaterial3: true,
        scaffoldBackground: schemeDark.surface,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
      );
      final ColorScheme scheme = fcs.toScheme;
      final ThemeData theme = fcs.toTheme.copyWith(colorScheme: schemeDark);
      expect(
        scheme,
        equals(schemeDark),
      );
      expect(
        theme.colorScheme,
        equals(schemeDark),
      );
    });
  });
  //
  // FCS9 GROUP
  //
  group('FCS9: Pass-through features WITH FlexColorScheme.toTheme ', () {
    TestWidgetsFlutterBinding.ensureInitialized();
    test(
        'FCS9.1: GIVEN a FlexColorScheme test materialTapTargetSize '
        'pass-through.', () {
      ThemeData theme = FlexColorScheme.light(
        materialTapTargetSize: MaterialTapTargetSize.padded,
      ).toTheme;
      expect(
        theme.materialTapTargetSize,
        equals(MaterialTapTargetSize.padded),
      );
      theme = FlexThemeData.light(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      );
      expect(
        theme.materialTapTargetSize,
        equals(MaterialTapTargetSize.shrinkWrap),
      );
      theme = FlexColorScheme.dark(
        materialTapTargetSize: MaterialTapTargetSize.padded,
      ).toTheme;
      expect(
        theme.materialTapTargetSize,
        equals(MaterialTapTargetSize.padded),
      );
      theme = FlexThemeData.dark(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      );
      expect(
        theme.materialTapTargetSize,
        equals(MaterialTapTargetSize.shrinkWrap),
      );
    });
    test(
        'FCS9.2: GIVEN a FlexColorScheme test pageTransitionsTheme '
        'pass-through.', () {
      const PageTransitionsTheme transitionsTheme = PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.linux: _NoPageTransitionsBuilder(),
          TargetPlatform.macOS: _NoPageTransitionsBuilder(),
          TargetPlatform.windows: _NoPageTransitionsBuilder(),
        },
      );

      ThemeData theme = FlexColorScheme.light(
        pageTransitionsTheme: transitionsTheme,
      ).toTheme;
      expect(
        theme.pageTransitionsTheme,
        equals(transitionsTheme),
      );
      theme = FlexThemeData.light(
        pageTransitionsTheme: transitionsTheme,
      );
      expect(
        theme.pageTransitionsTheme,
        equals(transitionsTheme),
      );
      theme = FlexColorScheme.dark(
        pageTransitionsTheme: transitionsTheme,
      ).toTheme;
      expect(
        theme.pageTransitionsTheme,
        equals(transitionsTheme),
      );
      theme = FlexThemeData.dark(
        pageTransitionsTheme: transitionsTheme,
      );
      expect(
        theme.pageTransitionsTheme,
        equals(transitionsTheme),
      );
    });
  });
  group('FCS10: Raw and minimal FlexColorScheme COLOR promise tests', () {
    TestWidgetsFlutterBinding.ensureInitialized();
    test('FCS10.1: GIVEN a raw default FlexColorScheme test default colors.',
        () {
      final ThemeData theme = const FlexColorScheme(
        primary: Colors.red,
        useMaterial3: false,
      ).toTheme;
      expect(theme.brightness, equals(Brightness.light));
      expect(theme.primaryColor, equals(Colors.red));
      expect(theme.colorScheme.primary, equals(Colors.red));
      expect(theme.colorScheme.onPrimary, equals(Colors.white));
      expect(theme.colorScheme.primaryContainer, equals(Colors.red));
      expect(theme.colorScheme.onPrimaryContainer, equals(Colors.white));
      expect(theme.colorScheme.secondary, equals(Colors.red));
      expect(theme.colorScheme.onSecondary, equals(Colors.white));
      expect(theme.colorScheme.secondaryContainer, equals(Colors.red));
      expect(theme.colorScheme.onSecondaryContainer, equals(Colors.white));
      expect(theme.colorScheme.tertiary, equals(Colors.red));
      expect(theme.colorScheme.onTertiary, equals(Colors.white));
      expect(theme.colorScheme.tertiaryContainer, equals(Colors.red));
      expect(theme.colorScheme.onTertiaryContainer, equals(Colors.white));
      expect(theme.colorScheme.error, equals(FlexColor.materialLightError));
      expect(theme.colorScheme.onError, equals(Colors.white));
      expect(theme.colorScheme.errorContainer,
          equals(FlexColor.lightErrorContainer(FlexColor.materialLightError)));
      expect(theme.colorScheme.onErrorContainer, equals(Colors.black));
      expect(theme.colorScheme.surface, equals(FlexColor.materialLightSurface));
      expect(theme.colorScheme.onSurface, equals(Colors.black));
      expect(theme.scaffoldBackgroundColor,
          equals(FlexColor.materialLightBackground));
      expect(
          theme.dialogBackgroundColor, equals(FlexColor.materialLightSurface));
      expect(theme.colorScheme.surfaceTint, equals(Colors.red));
    });
    test(
        'FCS10.2: GIVEN a raw default FlexColorScheme test dialog override '
        'color and default.', () {
      final ThemeData theme = const FlexColorScheme(
        primary: Colors.red,
        dialogBackground: Colors.blue,
        useMaterial3: false,
      ).toTheme;
      expect(theme.brightness, equals(Brightness.light));
      expect(theme.primaryColor, equals(Colors.red));
      expect(theme.colorScheme.primary, equals(Colors.red));
      expect(theme.colorScheme.onPrimary, equals(Colors.white));
      expect(theme.colorScheme.primaryContainer, equals(Colors.red));
      expect(theme.colorScheme.onPrimaryContainer, equals(Colors.white));
      expect(theme.colorScheme.secondary, equals(Colors.red));
      expect(theme.colorScheme.onSecondary, equals(Colors.white));
      expect(theme.colorScheme.secondaryContainer, equals(Colors.red));
      expect(theme.colorScheme.onSecondaryContainer, equals(Colors.white));
      expect(theme.colorScheme.tertiary, equals(Colors.red));
      expect(theme.colorScheme.onTertiary, equals(Colors.white));
      expect(theme.colorScheme.tertiaryContainer, equals(Colors.red));
      expect(theme.colorScheme.onTertiaryContainer, equals(Colors.white));
      expect(theme.colorScheme.error, equals(FlexColor.materialLightError));
      expect(theme.colorScheme.onError, equals(Colors.white));
      expect(theme.colorScheme.errorContainer,
          equals(FlexColor.lightErrorContainer(FlexColor.materialLightError)));
      expect(theme.colorScheme.onErrorContainer, equals(Colors.black));
      expect(theme.colorScheme.surface, equals(FlexColor.materialLightSurface));
      expect(theme.colorScheme.onSurface, equals(Colors.black));
      expect(theme.scaffoldBackgroundColor,
          equals(FlexColor.materialLightBackground));
      expect(theme.dialogBackgroundColor, equals(Colors.blue));
      expect(theme.colorScheme.surfaceTint, equals(Colors.red));
    });
    test(
        'FCS10.3: GIVEN a raw default FlexColorScheme with colorScheme, '
        'primary and dialog override '
        'EXPECT colorscheme, and overridden primary and dialog colors.', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF345234),
        brightness: Brightness.light,
      );
      final ThemeData theme = FlexColorScheme(
        colorScheme: colorScheme,
        primary: Colors.red,
        dialogBackground: Colors.blue,
        subThemesData: const FlexSubThemesData(),
        useMaterial3: false,
      ).toTheme;
      expect(theme.brightness, equals(Brightness.light));
      expect(theme.primaryColor, equals(Colors.red));
      expect(theme.colorScheme.primary, equals(Colors.red));
      expect(theme.colorScheme.onPrimary, equals(colorScheme.onPrimary));
      expect(theme.colorScheme.primaryContainer,
          equals(colorScheme.primaryContainer));
      expect(theme.colorScheme.onPrimaryContainer,
          equals(colorScheme.onPrimaryContainer));
      expect(theme.colorScheme.secondary, equals(colorScheme.secondary));
      expect(theme.colorScheme.onSecondary, equals(colorScheme.onSecondary));
      expect(theme.colorScheme.secondaryContainer,
          equals(colorScheme.secondaryContainer));
      expect(theme.colorScheme.onSecondaryContainer,
          equals(colorScheme.onSecondaryContainer));
      expect(theme.colorScheme.tertiary, equals(colorScheme.tertiary));
      expect(theme.colorScheme.onTertiary, equals(colorScheme.onTertiary));
      expect(theme.colorScheme.tertiaryContainer,
          equals(colorScheme.tertiaryContainer));
      expect(theme.colorScheme.onTertiaryContainer,
          equals(colorScheme.onTertiaryContainer));
      expect(theme.colorScheme.error, equals(colorScheme.error));
      expect(theme.colorScheme.onError, equals(colorScheme.onError));
      expect(
          theme.colorScheme.errorContainer, equals(colorScheme.errorContainer));
      expect(theme.colorScheme.onErrorContainer,
          equals(colorScheme.onErrorContainer));
      expect(theme.colorScheme.surface, equals(colorScheme.surface));
      expect(theme.colorScheme.onSurface, equals(colorScheme.onSurface));
      expect(theme.dialogBackgroundColor, equals(Colors.blue));
      expect(theme.colorScheme.surfaceTint, equals(colorScheme.surfaceTint));
      //
      expect(theme.dialogTheme.backgroundColor, equals(Colors.blue));
      expect(theme.datePickerTheme.backgroundColor, equals(Colors.blue));
      expect(theme.timePickerTheme.backgroundColor, equals(Colors.blue));
    });
    test(
        'FCS10.4: GIVEN a raw default FlexColorScheme with colorScheme, '
        'primary and dialog override and dialog sub theme scheme, '
        'EXPECT colorscheme, and overridden primary and dialog scheme colors.',
        () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF345234),
        brightness: Brightness.light,
      );
      final ThemeData theme = FlexColorScheme(
        colorScheme: colorScheme,
        primary: Colors.red,
        dialogBackground: Colors.blue,
        subThemesData: const FlexSubThemesData(
            dialogBackgroundSchemeColor: SchemeColor.primaryContainer),
        useMaterial3: false,
      ).toTheme;
      expect(theme.brightness, equals(Brightness.light));
      expect(theme.primaryColor, equals(Colors.red));
      expect(theme.colorScheme.primary, equals(Colors.red));
      expect(theme.colorScheme.onPrimary, equals(colorScheme.onPrimary));
      expect(theme.colorScheme.primaryContainer,
          equals(colorScheme.primaryContainer));
      expect(theme.colorScheme.onPrimaryContainer,
          equals(colorScheme.onPrimaryContainer));
      expect(theme.colorScheme.secondary, equals(colorScheme.secondary));
      expect(theme.colorScheme.onSecondary, equals(colorScheme.onSecondary));
      expect(theme.colorScheme.secondaryContainer,
          equals(colorScheme.secondaryContainer));
      expect(theme.colorScheme.onSecondaryContainer,
          equals(colorScheme.onSecondaryContainer));
      expect(theme.colorScheme.tertiary, equals(colorScheme.tertiary));
      expect(theme.colorScheme.onTertiary, equals(colorScheme.onTertiary));
      expect(theme.colorScheme.tertiaryContainer,
          equals(colorScheme.tertiaryContainer));
      expect(theme.colorScheme.onTertiaryContainer,
          equals(colorScheme.onTertiaryContainer));
      expect(theme.colorScheme.error, equals(colorScheme.error));
      expect(theme.colorScheme.onError, equals(colorScheme.onError));
      expect(
          theme.colorScheme.errorContainer, equals(colorScheme.errorContainer));
      expect(theme.colorScheme.onErrorContainer,
          equals(colorScheme.onErrorContainer));
      expect(theme.colorScheme.surface, equals(colorScheme.surface));
      expect(theme.colorScheme.onSurface, equals(colorScheme.onSurface));
      expect(theme.scaffoldBackgroundColor, equals(colorScheme.surface));
      expect(theme.dialogBackgroundColor, equals(Colors.blue));
      expect(theme.colorScheme.surfaceTint, equals(colorScheme.surfaceTint));
      //
      expect(theme.dialogTheme.backgroundColor,
          equals(colorScheme.primaryContainer));
      expect(theme.datePickerTheme.backgroundColor,
          equals(colorScheme.primaryContainer));
      expect(theme.timePickerTheme.backgroundColor,
          equals(colorScheme.primaryContainer));
    });
    test(
        'FCS10.5: GIVEN a raw default FlexColorScheme.light with colorScheme, '
        'primary and dialog over ride as well as FlexColor '
        'EXPECT colorscheme, and overridden primary and dialog colors.', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF345234),
        brightness: Brightness.light,
      );
      final ThemeData theme = FlexColorScheme.light(
        colorScheme: colorScheme,
        scheme: FlexScheme.ebonyClay,
        primary: Colors.red,
        dialogBackground: Colors.blue,
        subThemesData: const FlexSubThemesData(),
        useMaterial3: false,
      ).toTheme;
      expect(theme.brightness, equals(Brightness.light));
      expect(theme.primaryColor, equals(Colors.red));
      expect(theme.colorScheme.primary, equals(Colors.red));
      expect(theme.colorScheme.onPrimary, equals(colorScheme.onPrimary));
      expect(theme.colorScheme.primaryContainer,
          equals(colorScheme.primaryContainer));
      expect(theme.colorScheme.onPrimaryContainer,
          equals(colorScheme.onPrimaryContainer));
      expect(theme.colorScheme.secondary, equals(colorScheme.secondary));
      expect(theme.colorScheme.onSecondary, equals(colorScheme.onSecondary));
      expect(theme.colorScheme.secondaryContainer,
          equals(colorScheme.secondaryContainer));
      expect(theme.colorScheme.onSecondaryContainer,
          equals(colorScheme.onSecondaryContainer));
      expect(theme.colorScheme.tertiary, equals(colorScheme.tertiary));
      expect(theme.colorScheme.onTertiary, equals(colorScheme.onTertiary));
      expect(theme.colorScheme.tertiaryContainer,
          equals(colorScheme.tertiaryContainer));
      expect(theme.colorScheme.onTertiaryContainer,
          equals(colorScheme.onTertiaryContainer));
      expect(theme.colorScheme.error, equals(colorScheme.error));
      expect(theme.colorScheme.onError, equals(colorScheme.onError));
      expect(
          theme.colorScheme.errorContainer, equals(colorScheme.errorContainer));
      expect(theme.colorScheme.onErrorContainer,
          equals(colorScheme.onErrorContainer));
      expect(theme.colorScheme.surface, equals(colorScheme.surface));
      expect(theme.colorScheme.onSurface, equals(colorScheme.onSurface));
      expect(theme.scaffoldBackgroundColor, equals(colorScheme.surface));
      expect(theme.dialogBackgroundColor, equals(Colors.blue));
      expect(theme.colorScheme.surfaceTint, equals(colorScheme.surfaceTint));
      //
      expect(theme.dialogTheme.backgroundColor, equals(Colors.blue));
      expect(theme.datePickerTheme.backgroundColor, equals(Colors.blue));
      expect(theme.timePickerTheme.backgroundColor, equals(Colors.blue));
    });
    test(
        'FCS10.6: GIVEN a raw default FlexColorScheme.light with colorScheme, '
        'primary and dialog override and dialog sub theme scheme, as well '
        'as FlexColor '
        'EXPECT colorscheme, and overridden primary and dialog scheme colors.',
        () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF345234),
        brightness: Brightness.light,
      );
      final ThemeData theme = FlexColorScheme.light(
        useMaterial3: false,
        colorScheme: colorScheme,
        scheme: FlexScheme.ebonyClay,
        primary: Colors.red,
        dialogBackground: Colors.blue,
        subThemesData: const FlexSubThemesData(
            dialogBackgroundSchemeColor: SchemeColor.surfaceContainer),
      ).toTheme;
      expect(theme.brightness, equals(Brightness.light));
      expect(theme.primaryColor, equals(Colors.red));
      expect(theme.colorScheme.primary, equals(Colors.red));
      expect(theme.colorScheme.onPrimary, equals(colorScheme.onPrimary));
      expect(theme.colorScheme.primaryContainer,
          equals(colorScheme.primaryContainer));
      expect(theme.colorScheme.onPrimaryContainer,
          equals(colorScheme.onPrimaryContainer));
      expect(theme.colorScheme.secondary, equals(colorScheme.secondary));
      expect(theme.colorScheme.onSecondary, equals(colorScheme.onSecondary));
      expect(theme.colorScheme.secondaryContainer,
          equals(colorScheme.secondaryContainer));
      expect(theme.colorScheme.onSecondaryContainer,
          equals(colorScheme.onSecondaryContainer));
      expect(theme.colorScheme.tertiary, equals(colorScheme.tertiary));
      expect(theme.colorScheme.onTertiary, equals(colorScheme.onTertiary));
      expect(theme.colorScheme.tertiaryContainer,
          equals(colorScheme.tertiaryContainer));
      expect(theme.colorScheme.onTertiaryContainer,
          equals(colorScheme.onTertiaryContainer));
      expect(theme.colorScheme.error, equals(colorScheme.error));
      expect(theme.colorScheme.onError, equals(colorScheme.onError));
      expect(
          theme.colorScheme.errorContainer, equals(colorScheme.errorContainer));
      expect(theme.colorScheme.onErrorContainer,
          equals(colorScheme.onErrorContainer));
      expect(theme.colorScheme.surface, equals(colorScheme.surface));
      expect(theme.colorScheme.onSurface, equals(colorScheme.onSurface));
      expect(theme.scaffoldBackgroundColor, equals(colorScheme.surface));
      expect(theme.dialogBackgroundColor, equals(Colors.blue));
      expect(theme.colorScheme.surfaceTint, equals(colorScheme.surfaceTint));
      //
      expect(theme.dialogTheme.backgroundColor,
          equals(colorScheme.surfaceContainer));
      expect(theme.datePickerTheme.backgroundColor,
          equals(colorScheme.surfaceContainer));
      expect(theme.timePickerTheme.backgroundColor,
          equals(colorScheme.surfaceContainer));
    });
  });
  //
  // Group FCS11 More TextTheme tests and tests for issue #151:
  // https://github.com/rydmike/flex_color_scheme/issues/151
  group('FCS11: TextTheme and ISSUE-151-Light WITH FlexColorScheme.toTheme ',
      () {
    TestWidgetsFlutterBinding.ensureInitialized();
    //
    // Define a full TextTheme, but no font size or colors.
    const TextTheme testText = TextTheme(
      displayLarge: TextStyle(
          fontWeight: FontWeight.w300,
          textBaseline: TextBaseline.alphabetic,
          letterSpacing: -1.5),
      displayMedium: TextStyle(
          fontWeight: FontWeight.w300,
          textBaseline: TextBaseline.alphabetic,
          letterSpacing: -0.5),
      displaySmall: TextStyle(
          fontWeight: FontWeight.w400,
          textBaseline: TextBaseline.alphabetic,
          letterSpacing: 0.0),
      headlineLarge: TextStyle(
          fontWeight: FontWeight.w400,
          textBaseline: TextBaseline.alphabetic,
          letterSpacing: 0.25),
      headlineMedium: TextStyle(
          fontWeight: FontWeight.w400,
          textBaseline: TextBaseline.alphabetic,
          letterSpacing: 0.25),
      headlineSmall: TextStyle(
          fontWeight: FontWeight.w400,
          textBaseline: TextBaseline.alphabetic,
          letterSpacing: 0.0),
      titleLarge: TextStyle(
          fontWeight: FontWeight.w500,
          textBaseline: TextBaseline.alphabetic,
          letterSpacing: 0.15),
      titleMedium: TextStyle(
          fontWeight: FontWeight.w400,
          textBaseline: TextBaseline.alphabetic,
          letterSpacing: 0.15),
      titleSmall: TextStyle(
          fontWeight: FontWeight.w500,
          textBaseline: TextBaseline.alphabetic,
          letterSpacing: 0.1),
      bodyLarge: TextStyle(
          fontWeight: FontWeight.w400,
          textBaseline: TextBaseline.alphabetic,
          letterSpacing: 0.5),
      bodyMedium: TextStyle(
          fontWeight: FontWeight.w400,
          textBaseline: TextBaseline.alphabetic,
          letterSpacing: 0.25),
      bodySmall: TextStyle(
          fontWeight: FontWeight.w400,
          textBaseline: TextBaseline.alphabetic,
          letterSpacing: 0.4),
      labelLarge: TextStyle(
          fontWeight: FontWeight.w500,
          textBaseline: TextBaseline.alphabetic,
          letterSpacing: 1.25),
      labelMedium: TextStyle(
          fontWeight: FontWeight.w400,
          textBaseline: TextBaseline.alphabetic,
          letterSpacing: 1.5),
      labelSmall: TextStyle(
          fontWeight: FontWeight.w400,
          textBaseline: TextBaseline.alphabetic,
          letterSpacing: 1.5),
    );
    testWidgets(
        'FCS11-01 FCS-M2-LIGHT default textTheme with some other props defined '
        'EXPECT color and font size match 2018 typography',
        (WidgetTester tester) async {
      // Make a full ColorScheme from a SeedColor,.
      final ColorScheme scheme = ColorScheme.fromSeed(
          brightness: Brightness.light, seedColor: const Color(0xffd9008c));
      // FCS light, M2 and custom text theme.
      final FlexColorScheme fcs = FlexColorScheme.light(
        colorScheme: scheme,
        useMaterial3: false,
        textTheme: testText,
        primaryTextTheme: testText,
      );
      final ThemeData theme = fcs.toTheme;
      late TextTheme textTheme;
      late TextTheme pTextTheme;
      await tester.pumpWidget(MaterialApp(
        theme: theme,
        themeMode: ThemeMode.light,
        home: Builder(
          builder: (BuildContext context) {
            textTheme = Theme.of(context).textTheme;
            pTextTheme = Theme.of(context).primaryTextTheme;
            return const Text('A');
          },
        ),
      ));
      // Test M2 default font sizes for textTheme.
      expect(textTheme.displayLarge!.fontSize, equals(96));
      expect(textTheme.displayMedium!.fontSize, equals(60));
      expect(textTheme.displaySmall!.fontSize, equals(48));
      expect(textTheme.headlineLarge!.fontSize, equals(40));
      expect(textTheme.headlineMedium!.fontSize, equals(34));
      expect(textTheme.headlineSmall!.fontSize, equals(24));
      expect(textTheme.titleLarge!.fontSize, equals(20));
      expect(textTheme.titleMedium!.fontSize, equals(16));
      expect(textTheme.titleSmall!.fontSize, equals(14));
      expect(textTheme.bodyLarge!.fontSize, equals(16));
      expect(textTheme.bodyMedium!.fontSize, equals(14));
      expect(textTheme.bodySmall!.fontSize, equals(12));
      expect(textTheme.labelLarge!.fontSize, equals(14));
      expect(textTheme.labelMedium!.fontSize, equals(11));
      expect(textTheme.labelSmall!.fontSize, equals(10));
      // Test M2 default font sizes for primaryTextTheme.
      expect(pTextTheme.displayLarge!.fontSize, equals(96));
      expect(pTextTheme.displayMedium!.fontSize, equals(60));
      expect(pTextTheme.displaySmall!.fontSize, equals(48));
      expect(pTextTheme.headlineLarge!.fontSize, equals(40));
      expect(pTextTheme.headlineMedium!.fontSize, equals(34));
      expect(pTextTheme.headlineSmall!.fontSize, equals(24));
      expect(pTextTheme.titleLarge!.fontSize, equals(20));
      expect(pTextTheme.titleMedium!.fontSize, equals(16));
      expect(pTextTheme.titleSmall!.fontSize, equals(14));
      expect(pTextTheme.bodyLarge!.fontSize, equals(16));
      expect(pTextTheme.bodyMedium!.fontSize, equals(14));
      expect(pTextTheme.bodySmall!.fontSize, equals(12));
      expect(pTextTheme.labelLarge!.fontSize, equals(14));
      expect(pTextTheme.labelMedium!.fontSize, equals(11));
      expect(pTextTheme.labelSmall!.fontSize, equals(10));
      // Test M2 default font colors for textTheme.
      expect(textTheme.displayLarge!.color, equals(Colors.black54));
      expect(textTheme.displayMedium!.color, equals(Colors.black54));
      expect(textTheme.displaySmall!.color, equals(Colors.black54));
      expect(textTheme.headlineLarge!.color, equals(Colors.black54));
      expect(textTheme.headlineMedium!.color, equals(Colors.black54));
      expect(textTheme.headlineSmall!.color, equals(Colors.black87));
      expect(textTheme.titleLarge!.color, equals(Colors.black87));
      expect(textTheme.titleMedium!.color, equals(Colors.black87));
      expect(textTheme.titleSmall!.color, equals(Colors.black));
      expect(textTheme.bodyLarge!.color, equals(Colors.black87));
      expect(textTheme.bodyMedium!.color, equals(Colors.black87));
      expect(textTheme.bodySmall!.color, equals(Colors.black54));
      expect(textTheme.labelLarge!.color, equals(Colors.black87));
      expect(textTheme.labelMedium!.color, equals(Colors.black));
      expect(textTheme.labelSmall!.color, equals(Colors.black));
      // Test M2 default font colors for primTextTheme.
      expect(pTextTheme.displayLarge!.color, equals(Colors.white70));
      expect(pTextTheme.displayMedium!.color, equals(Colors.white70));
      expect(pTextTheme.displaySmall!.color, equals(Colors.white70));
      expect(pTextTheme.headlineLarge!.color, equals(Colors.white70));
      expect(pTextTheme.headlineMedium!.color, equals(Colors.white70));
      expect(pTextTheme.headlineSmall!.color, equals(Colors.white));
      expect(pTextTheme.titleLarge!.color, equals(Colors.white));
      expect(pTextTheme.titleMedium!.color, equals(Colors.white));
      expect(pTextTheme.titleSmall!.color, equals(Colors.white));
      expect(pTextTheme.bodyLarge!.color, equals(Colors.white));
      expect(pTextTheme.bodyMedium!.color, equals(Colors.white));
      expect(pTextTheme.bodySmall!.color, equals(Colors.white70));
      expect(pTextTheme.labelLarge!.color, equals(Colors.white));
      expect(pTextTheme.labelMedium!.color, equals(Colors.white));
      expect(pTextTheme.labelSmall!.color, equals(Colors.white));
    });
    testWidgets(
        'FCS11-02 FCS-M2-LIGHT default textTheme with some other props defined '
        'FCS use TINTED text '
        'EXPECT font size match 2018 typography and FCS tined text.',
        (WidgetTester tester) async {
      // Make a full ColorScheme from a SeedColor,.
      final ColorScheme scheme = ColorScheme.fromSeed(
          brightness: Brightness.light, seedColor: const Color(0xffd9008c));
      // FCS light, M2 and custom text theme.
      final FlexColorScheme fcs = FlexColorScheme.light(
        colorScheme: scheme,
        useMaterial3: false,
        textTheme: testText,
        primaryTextTheme: testText,
        subThemesData: const FlexSubThemesData(
          useMaterial3Typography: false,
          // TODO(rydmike): Commented as part of deprecation of blendTextTheme.
          // blendTextTheme: true,
        ),
      );
      final ThemeData theme = fcs.toTheme;
      late TextTheme textTheme;
      late TextTheme pTextTheme;
      await tester.pumpWidget(MaterialApp(
        theme: theme,
        themeMode: ThemeMode.light,
        home: Builder(
          builder: (BuildContext context) {
            textTheme = Theme.of(context).textTheme;
            pTextTheme = Theme.of(context).primaryTextTheme;
            return const Text('A');
          },
        ),
      ));
      // Test M2 default font sizes for textTheme.
      expect(textTheme.displayLarge!.fontSize, equals(96));
      expect(textTheme.displayMedium!.fontSize, equals(60));
      expect(textTheme.displaySmall!.fontSize, equals(48));
      expect(textTheme.headlineLarge!.fontSize, equals(40));
      expect(textTheme.headlineMedium!.fontSize, equals(34));
      expect(textTheme.headlineSmall!.fontSize, equals(24));
      expect(textTheme.titleLarge!.fontSize, equals(20));
      expect(textTheme.titleMedium!.fontSize, equals(16));
      expect(textTheme.titleSmall!.fontSize, equals(14));
      expect(textTheme.bodyLarge!.fontSize, equals(16));
      expect(textTheme.bodyMedium!.fontSize, equals(14));
      expect(textTheme.bodySmall!.fontSize, equals(12));
      expect(textTheme.labelLarge!.fontSize, equals(14));
      expect(textTheme.labelMedium!.fontSize, equals(11));
      expect(textTheme.labelSmall!.fontSize, equals(10));
      // Test M2 default font sizes for primaryTextTheme.
      expect(pTextTheme.displayLarge!.fontSize, equals(96));
      expect(pTextTheme.displayMedium!.fontSize, equals(60));
      expect(pTextTheme.displaySmall!.fontSize, equals(48));
      expect(pTextTheme.headlineLarge!.fontSize, equals(40));
      expect(pTextTheme.headlineMedium!.fontSize, equals(34));
      expect(pTextTheme.headlineSmall!.fontSize, equals(24));
      expect(pTextTheme.titleLarge!.fontSize, equals(20));
      expect(pTextTheme.titleMedium!.fontSize, equals(16));
      expect(pTextTheme.titleSmall!.fontSize, equals(14));
      expect(pTextTheme.bodyLarge!.fontSize, equals(16));
      expect(pTextTheme.bodyMedium!.fontSize, equals(14));
      expect(pTextTheme.bodySmall!.fontSize, equals(12));
      expect(pTextTheme.labelLarge!.fontSize, equals(14));
      expect(pTextTheme.labelMedium!.fontSize, equals(11));
      expect(pTextTheme.labelSmall!.fontSize, equals(10));
      // TODO(rydmike): Commented as part of deprecation of blendTextTheme.
      // // Test M2 default font colors for textTheme.
      // expect(textTheme.displayLarge!.color, equals(const Color(0xd81b0e14)));
      // expect(textTheme.displayMedium!.color, equals(const Color(0xd81b0e14)));
      // expect(textTheme.displaySmall!.color, equals(const Color(0xd81b0e14)));
      // expect(textTheme.headlineLarge!.color, equals(const Color(0xd81b0e14)));
      // expect(textTheme.headlineMedium!.color, equals(const Color(0xd81b0e14)));
      // expect(textTheme.headlineSmall!.color, equals(const Color(0xf41b0e14)));
      // expect(textTheme.titleLarge!.color, equals(const Color(0xf41b0e14)));
      // expect(textTheme.titleMedium!.color, equals(const Color(0xf41b0e14)));
      // expect(textTheme.titleSmall!.color, equals(const Color(0xff1f1017)));
      // expect(textTheme.bodyLarge!.color, equals(const Color(0xf41b0e14)));
      // expect(textTheme.bodyMedium!.color, equals(const Color(0xf41b0e14)));
      // expect(textTheme.bodySmall!.color, equals(const Color(0xd81b0e14)));
      // expect(textTheme.labelLarge!.color, equals(const Color(0xf41b0e14)));
      // expect(textTheme.labelMedium!.color, equals(const Color(0xff1f1017)));
      // expect(textTheme.labelSmall!.color, equals(const Color(0xff1f1017)));
      // // Test M2 default font colors for primTextTheme.
      // expect(pTextTheme.displayLarge!.color, equals(const Color(0xe5f3edf0)));
      // expect(pTextTheme.displayMedium!.color, equals(const Color(0xe5f3edf0)));
      // expect(pTextTheme.displaySmall!.color, equals(const Color(0xe5f3edf0)));
      // expect(pTextTheme.headlineLarge!.color, equals(const Color(0xe5f3edf0)));
      // expect(pTextTheme.headlineMedium!.color, equals(const Color(0xe5f3edf0)));
      // expect(pTextTheme.headlineSmall!.color, equals(const Color(0xfff4eff1)));
      // expect(pTextTheme.titleLarge!.color, equals(const Color(0xfff4eff1)));
      // expect(pTextTheme.titleMedium!.color, equals(const Color(0xfff4eff1)));
      // expect(pTextTheme.titleSmall!.color, equals(const Color(0xfff7f2f4)));
      // expect(pTextTheme.bodyLarge!.color, equals(const Color(0xfff4eff1)));
      // expect(pTextTheme.bodyMedium!.color, equals(const Color(0xfff4eff1)));
      // expect(pTextTheme.bodySmall!.color, equals(const Color(0xe5f3edf0)));
      // expect(pTextTheme.labelLarge!.color, equals(const Color(0xfff4eff1)));
      // expect(pTextTheme.labelMedium!.color, equals(const Color(0xfff7f2f4)));
      // expect(pTextTheme.labelSmall!.color, equals(const Color(0xfff7f2f4)));
    });
    testWidgets(
        'FCS11-03 FCS-M2-DARK default textTheme with some other props defined '
        'EXPECT color and font size match 2018 typography',
        (WidgetTester tester) async {
      // Make a full ColorScheme from a SeedColor,.
      final ColorScheme scheme = ColorScheme.fromSeed(
          brightness: Brightness.dark, seedColor: const Color(0xffd9008c));
      // FCS light, M2 and custom text theme.
      final FlexColorScheme fcs = FlexColorScheme.dark(
        colorScheme: scheme,
        useMaterial3: false,
        textTheme: testText,
        primaryTextTheme: testText,
      );
      final ThemeData theme = fcs.toTheme;
      late TextTheme textTheme;
      late TextTheme pTextTheme;
      await tester.pumpWidget(MaterialApp(
        darkTheme: theme,
        themeMode: ThemeMode.dark,
        home: Builder(
          builder: (BuildContext context) {
            textTheme = Theme.of(context).textTheme;
            pTextTheme = Theme.of(context).primaryTextTheme;
            return const Text('A');
          },
        ),
      ));
      // Test M2 default font sizes for textTheme.
      expect(textTheme.displayLarge!.fontSize, equals(96));
      expect(textTheme.displayMedium!.fontSize, equals(60));
      expect(textTheme.displaySmall!.fontSize, equals(48));
      expect(textTheme.headlineLarge!.fontSize, equals(40));
      expect(textTheme.headlineMedium!.fontSize, equals(34));
      expect(textTheme.headlineSmall!.fontSize, equals(24));
      expect(textTheme.titleLarge!.fontSize, equals(20));
      expect(textTheme.titleMedium!.fontSize, equals(16));
      expect(textTheme.titleSmall!.fontSize, equals(14));
      expect(textTheme.bodyLarge!.fontSize, equals(16));
      expect(textTheme.bodyMedium!.fontSize, equals(14));
      expect(textTheme.bodySmall!.fontSize, equals(12));
      expect(textTheme.labelLarge!.fontSize, equals(14));
      expect(textTheme.labelMedium!.fontSize, equals(11));
      expect(textTheme.labelSmall!.fontSize, equals(10));
      // Test M2 default font sizes for primaryTextTheme.
      expect(pTextTheme.displayLarge!.fontSize, equals(96));
      expect(pTextTheme.displayMedium!.fontSize, equals(60));
      expect(pTextTheme.displaySmall!.fontSize, equals(48));
      expect(pTextTheme.headlineLarge!.fontSize, equals(40));
      expect(pTextTheme.headlineMedium!.fontSize, equals(34));
      expect(pTextTheme.headlineSmall!.fontSize, equals(24));
      expect(pTextTheme.titleLarge!.fontSize, equals(20));
      expect(pTextTheme.titleMedium!.fontSize, equals(16));
      expect(pTextTheme.titleSmall!.fontSize, equals(14));
      expect(pTextTheme.bodyLarge!.fontSize, equals(16));
      expect(pTextTheme.bodyMedium!.fontSize, equals(14));
      expect(pTextTheme.bodySmall!.fontSize, equals(12));
      expect(pTextTheme.labelLarge!.fontSize, equals(14));
      expect(pTextTheme.labelMedium!.fontSize, equals(11));
      expect(pTextTheme.labelSmall!.fontSize, equals(10));
      // Test M2 default font colors for textTheme.
      expect(textTheme.displayLarge!.color, equals(Colors.white70));
      expect(textTheme.displayMedium!.color, equals(Colors.white70));
      expect(textTheme.displaySmall!.color, equals(Colors.white70));
      expect(textTheme.headlineLarge!.color, equals(Colors.white70));
      expect(textTheme.headlineMedium!.color, equals(Colors.white70));
      expect(textTheme.headlineSmall!.color, equals(Colors.white));
      expect(textTheme.titleLarge!.color, equals(Colors.white));
      expect(textTheme.titleMedium!.color, equals(Colors.white));
      expect(textTheme.titleSmall!.color, equals(Colors.white));
      expect(textTheme.bodyLarge!.color, equals(Colors.white));
      expect(textTheme.bodyMedium!.color, equals(Colors.white));
      expect(textTheme.bodySmall!.color, equals(Colors.white70));
      expect(textTheme.labelLarge!.color, equals(Colors.white));
      expect(textTheme.labelMedium!.color, equals(Colors.white));
      expect(textTheme.labelSmall!.color, equals(Colors.white));
      // Test M2 default font colors for primTextTheme.
      expect(pTextTheme.displayLarge!.color, equals(Colors.black54));
      expect(pTextTheme.displayMedium!.color, equals(Colors.black54));
      expect(pTextTheme.displaySmall!.color, equals(Colors.black54));
      expect(pTextTheme.headlineLarge!.color, equals(Colors.black54));
      expect(pTextTheme.headlineMedium!.color, equals(Colors.black54));
      expect(pTextTheme.headlineSmall!.color, equals(Colors.black87));
      expect(pTextTheme.titleLarge!.color, equals(Colors.black87));
      expect(pTextTheme.titleMedium!.color, equals(Colors.black87));
      expect(pTextTheme.titleSmall!.color, equals(Colors.black));
      expect(pTextTheme.bodyLarge!.color, equals(Colors.black87));
      expect(pTextTheme.bodyMedium!.color, equals(Colors.black87));
      expect(pTextTheme.bodySmall!.color, equals(Colors.black54));
      expect(pTextTheme.labelLarge!.color, equals(Colors.black87));
      expect(pTextTheme.labelMedium!.color, equals(Colors.black));
      expect(pTextTheme.labelSmall!.color, equals(Colors.black));
    });
    testWidgets(
        'FCS11-04 FCS-M2-DARK default textTheme with some other props defined '
        'FCS use TINTED text '
        'EXPECT font size match 2018 typography and FCS tined text.',
        (WidgetTester tester) async {
      // Make a full ColorScheme from a SeedColor,.
      final ColorScheme scheme = ColorScheme.fromSeed(
          brightness: Brightness.dark, seedColor: const Color(0xffd9008c));
      // FCS light, M2 and custom text theme.
      final FlexColorScheme fcs = FlexColorScheme.dark(
        colorScheme: scheme,
        useMaterial3: false,
        textTheme: testText,
        primaryTextTheme: testText,
        subThemesData: const FlexSubThemesData(
            // TODO(rydmike): Commented as part of blendTextTheme deprecation.
            // blendTextTheme: true,
            ),
      );
      final ThemeData theme = fcs.toTheme;
      late TextTheme textTheme;
      late TextTheme pTextTheme;
      await tester.pumpWidget(MaterialApp(
        darkTheme: theme,
        themeMode: ThemeMode.dark,
        home: Builder(
          builder: (BuildContext context) {
            textTheme = Theme.of(context).textTheme;
            pTextTheme = Theme.of(context).primaryTextTheme;
            return const Text('A');
          },
        ),
      ));
      // Test M2 default font sizes for textTheme.
      expect(textTheme.displayLarge!.fontSize, equals(96));
      expect(textTheme.displayMedium!.fontSize, equals(60));
      expect(textTheme.displaySmall!.fontSize, equals(48));
      expect(textTheme.headlineLarge!.fontSize, equals(40));
      expect(textTheme.headlineMedium!.fontSize, equals(34));
      expect(textTheme.headlineSmall!.fontSize, equals(24));
      expect(textTheme.titleLarge!.fontSize, equals(20));
      expect(textTheme.titleMedium!.fontSize, equals(16));
      expect(textTheme.titleSmall!.fontSize, equals(14));
      expect(textTheme.bodyLarge!.fontSize, equals(16));
      expect(textTheme.bodyMedium!.fontSize, equals(14));
      expect(textTheme.bodySmall!.fontSize, equals(12));
      expect(textTheme.labelLarge!.fontSize, equals(14));
      expect(textTheme.labelMedium!.fontSize, equals(11));
      expect(textTheme.labelSmall!.fontSize, equals(10));
      // Test M2 default font sizes for primaryTextTheme.
      expect(pTextTheme.displayLarge!.fontSize, equals(96));
      expect(pTextTheme.displayMedium!.fontSize, equals(60));
      expect(pTextTheme.displaySmall!.fontSize, equals(48));
      expect(pTextTheme.headlineLarge!.fontSize, equals(40));
      expect(pTextTheme.headlineMedium!.fontSize, equals(34));
      expect(pTextTheme.headlineSmall!.fontSize, equals(24));
      expect(pTextTheme.titleLarge!.fontSize, equals(20));
      expect(pTextTheme.titleMedium!.fontSize, equals(16));
      expect(pTextTheme.titleSmall!.fontSize, equals(14));
      expect(pTextTheme.bodyLarge!.fontSize, equals(16));
      expect(pTextTheme.bodyMedium!.fontSize, equals(14));
      expect(pTextTheme.bodySmall!.fontSize, equals(12));
      expect(pTextTheme.labelLarge!.fontSize, equals(14));
      expect(pTextTheme.labelMedium!.fontSize, equals(11));
      expect(pTextTheme.labelSmall!.fontSize, equals(10));
      // TODO(rydmike): Commented as part of deprecation of blendTextTheme.
      // // Test M2 default font colors for textTheme.
      // expect(textTheme.displayLarge!.color, equals(const Color(0xe2fff3f8)));
      // expect(textTheme.displayMedium!.color, equals(const Color(0xe2fff3f8)));
      // expect(textTheme.displaySmall!.color, equals(const Color(0xe2fff3f8)));
      // expect(textTheme.headlineLarge!.color, equals(const Color(0xe2fff3f8)));
      // expect(textTheme.headlineMedium!.color, equals(const Color(0xe2fff3f8)));
      // expect(textTheme.headlineSmall!.color, equals(const Color(0xfffff5f9)));
      // expect(textTheme.titleLarge!.color, equals(const Color(0xfffff5f9)));
      // expect(textTheme.titleMedium!.color, equals(const Color(0xfffff5f9)));
      // expect(textTheme.titleSmall!.color, equals(const Color(0xfffff3f8)));
      // expect(textTheme.bodyLarge!.color, equals(const Color(0xfffff5f9)));
      // expect(textTheme.bodyMedium!.color, equals(const Color(0xfffff5f9)));
      // expect(textTheme.bodySmall!.color, equals(const Color(0xe2fff3f8)));
      // expect(textTheme.labelLarge!.color, equals(const Color(0xfffff5f9)));
      // expect(textTheme.labelMedium!.color, equals(const Color(0xfffff3f8)));
      // expect(textTheme.labelSmall!.color, equals(const Color(0xfffff3f8)));
      // // Test M2 default font colors for primTextTheme.
      // expect(pTextTheme.displayLarge!.color, equals(const Color(0xd8191114)));
      // expect(pTextTheme.displayMedium!.color, equals(const Color(0xd8191114)));
      // expect(pTextTheme.displaySmall!.color, equals(const Color(0xd8191114)));
      // expect(pTextTheme.headlineLarge!.color, equals(const Color(0xd8191114)));
      // expect(pTextTheme.headlineMedium!.color, equals(const Color(0xd8191114)));
      // expect(pTextTheme.headlineSmall!.color, equals(const Color(0xf20c0809)));
      // expect(pTextTheme.titleLarge!.color, equals(const Color(0xf20c0809)));
      // expect(pTextTheme.titleMedium!.color, equals(const Color(0xf20c0809)));
      // expect(pTextTheme.titleSmall!.color, equals(const Color(0xff0a0608)));
      // expect(pTextTheme.bodyLarge!.color, equals(const Color(0xf20c0809)));
      // expect(pTextTheme.bodyMedium!.color, equals(const Color(0xf20c0809)));
      // expect(pTextTheme.bodySmall!.color, equals(const Color(0xd8191114)));
      // expect(pTextTheme.labelLarge!.color, equals(const Color(0xf20c0809)));
      // expect(pTextTheme.labelMedium!.color, equals(const Color(0xff0a0608)));
      // expect(pTextTheme.labelSmall!.color, equals(const Color(0xff0a0608)));
    });
    //
    //
    testWidgets(
        'FCS11-05 FCS-M3-LIGHT default textTheme with some other props defined '
        'EXPECT color and font size match 2021 typography',
        (WidgetTester tester) async {
      // Make a full ColorScheme from a SeedColor,.
      final ColorScheme scheme = ColorScheme.fromSeed(
          brightness: Brightness.light, seedColor: const Color(0xffd9008c));
      // FCS light, M3 and custom text theme.
      final FlexColorScheme fcs = FlexColorScheme.light(
        colorScheme: scheme,
        useMaterial3: true,
        textTheme: testText,
        primaryTextTheme: testText,
      );
      final ThemeData theme = fcs.toTheme;
      final ColorScheme c = fcs.toScheme;
      final Color tColor = c.onSurface;
      final Color pColor = c.surface;
      late TextTheme textTheme;
      late TextTheme pTextTheme;
      await tester.pumpWidget(MaterialApp(
        theme: theme,
        themeMode: ThemeMode.light,
        home: Builder(
          builder: (BuildContext context) {
            textTheme = Theme.of(context).textTheme;
            pTextTheme = Theme.of(context).primaryTextTheme;
            return const Text('A');
          },
        ),
      ));
      // Test M3 default font sizes for textTheme.
      expect(textTheme.displayLarge!.fontSize, equals(57));
      expect(textTheme.displayMedium!.fontSize, equals(45));
      expect(textTheme.displaySmall!.fontSize, equals(36));
      expect(textTheme.headlineLarge!.fontSize, equals(32));
      expect(textTheme.headlineMedium!.fontSize, equals(28));
      expect(textTheme.headlineSmall!.fontSize, equals(24));
      expect(textTheme.titleLarge!.fontSize, equals(22));
      expect(textTheme.titleMedium!.fontSize, equals(16));
      expect(textTheme.titleSmall!.fontSize, equals(14));
      expect(textTheme.bodyLarge!.fontSize, equals(16));
      expect(textTheme.bodyMedium!.fontSize, equals(14));
      expect(textTheme.bodySmall!.fontSize, equals(12));
      expect(textTheme.labelLarge!.fontSize, equals(14));
      expect(textTheme.labelMedium!.fontSize, equals(12));
      expect(textTheme.labelSmall!.fontSize, equals(11));
      // Test M3 default font sizes for primaryTextTheme.
      expect(pTextTheme.displayLarge!.fontSize, equals(57));
      expect(pTextTheme.displayMedium!.fontSize, equals(45));
      expect(pTextTheme.displaySmall!.fontSize, equals(36));
      expect(pTextTheme.headlineLarge!.fontSize, equals(32));
      expect(pTextTheme.headlineMedium!.fontSize, equals(28));
      expect(pTextTheme.headlineSmall!.fontSize, equals(24));
      expect(pTextTheme.titleLarge!.fontSize, equals(22));
      expect(pTextTheme.titleMedium!.fontSize, equals(16));
      expect(pTextTheme.titleSmall!.fontSize, equals(14));
      expect(pTextTheme.bodyLarge!.fontSize, equals(16));
      expect(pTextTheme.bodyMedium!.fontSize, equals(14));
      expect(pTextTheme.bodySmall!.fontSize, equals(12));
      expect(pTextTheme.labelLarge!.fontSize, equals(14));
      expect(pTextTheme.labelMedium!.fontSize, equals(12));
      expect(pTextTheme.labelSmall!.fontSize, equals(11));
      // Test M3 default font colors for textTheme.
      expect(textTheme.displayLarge!.color, equals(tColor));
      expect(textTheme.displayMedium!.color, equals(tColor));
      expect(textTheme.displaySmall!.color, equals(tColor));
      expect(textTheme.headlineLarge!.color, equals(tColor));
      expect(textTheme.headlineMedium!.color, equals(tColor));
      expect(textTheme.headlineSmall!.color, equals(tColor));
      expect(textTheme.titleLarge!.color, equals(tColor));
      expect(textTheme.titleMedium!.color, equals(tColor));
      expect(textTheme.titleSmall!.color, equals(tColor));
      expect(textTheme.bodyLarge!.color, equals(tColor));
      expect(textTheme.bodyMedium!.color, equals(tColor));
      expect(textTheme.bodySmall!.color, equals(tColor));
      expect(textTheme.labelLarge!.color, equals(tColor));
      expect(textTheme.labelMedium!.color, equals(tColor));
      expect(textTheme.labelSmall!.color, equals(tColor));
      // Test M3 default font colors for primTextTheme.
      expect(pTextTheme.displayLarge!.color, equals(pColor));
      expect(pTextTheme.displayMedium!.color, equals(pColor));
      expect(pTextTheme.displaySmall!.color, equals(pColor));
      expect(pTextTheme.headlineLarge!.color, equals(pColor));
      expect(pTextTheme.headlineMedium!.color, equals(pColor));
      expect(pTextTheme.headlineSmall!.color, equals(pColor));
      expect(pTextTheme.titleLarge!.color, equals(pColor));
      expect(pTextTheme.titleMedium!.color, equals(pColor));
      expect(pTextTheme.titleSmall!.color, equals(pColor));
      expect(pTextTheme.bodyLarge!.color, equals(pColor));
      expect(pTextTheme.bodyMedium!.color, equals(pColor));
      expect(pTextTheme.bodySmall!.color, equals(pColor));
      expect(pTextTheme.labelLarge!.color, equals(pColor));
      expect(pTextTheme.labelMedium!.color, equals(pColor));
      expect(pTextTheme.labelSmall!.color, equals(pColor));
    });
    testWidgets(
        'FCS11-06 FCS-M3-LIGHT default textTheme with some other props defined '
        'FCS use TINTED text '
        'EXPECT font size match 2021 typography and FCS tined text.',
        (WidgetTester tester) async {
      // Make a full ColorScheme from a SeedColor,.
      final ColorScheme scheme = ColorScheme.fromSeed(
          brightness: Brightness.light, seedColor: const Color(0xffd9008c));
      // FCS light, M2 and custom text theme.
      final FlexColorScheme fcs = FlexColorScheme.light(
        colorScheme: scheme,
        useMaterial3: true,
        textTheme: testText,
        primaryTextTheme: testText,
        subThemesData: const FlexSubThemesData(
          useMaterial3Typography: true,
          // TODO(rydmike): Commented as part of deprecation of blendTextTheme.
          // blendTextTheme: true,
        ),
      );
      final ThemeData theme = fcs.toTheme;
      late TextTheme textTheme;
      late TextTheme pTextTheme;
      await tester.pumpWidget(MaterialApp(
        theme: theme,
        themeMode: ThemeMode.light,
        home: Builder(
          builder: (BuildContext context) {
            textTheme = Theme.of(context).textTheme;
            pTextTheme = Theme.of(context).primaryTextTheme;
            return const Text('A');
          },
        ),
      ));
      // Test M3 default font sizes for textTheme.
      expect(textTheme.displayLarge!.fontSize, equals(57));
      expect(textTheme.displayMedium!.fontSize, equals(45));
      expect(textTheme.displaySmall!.fontSize, equals(36));
      expect(textTheme.headlineLarge!.fontSize, equals(32));
      expect(textTheme.headlineMedium!.fontSize, equals(28));
      expect(textTheme.headlineSmall!.fontSize, equals(24));
      expect(textTheme.titleLarge!.fontSize, equals(22));
      expect(textTheme.titleMedium!.fontSize, equals(16));
      expect(textTheme.titleSmall!.fontSize, equals(14));
      expect(textTheme.bodyLarge!.fontSize, equals(16));
      expect(textTheme.bodyMedium!.fontSize, equals(14));
      expect(textTheme.bodySmall!.fontSize, equals(12));
      expect(textTheme.labelLarge!.fontSize, equals(14));
      expect(textTheme.labelMedium!.fontSize, equals(12));
      expect(textTheme.labelSmall!.fontSize, equals(11));
      // Test M3 default font sizes for primaryTextTheme.
      expect(pTextTheme.displayLarge!.fontSize, equals(57));
      expect(pTextTheme.displayMedium!.fontSize, equals(45));
      expect(pTextTheme.displaySmall!.fontSize, equals(36));
      expect(pTextTheme.headlineLarge!.fontSize, equals(32));
      expect(pTextTheme.headlineMedium!.fontSize, equals(28));
      expect(pTextTheme.headlineSmall!.fontSize, equals(24));
      expect(pTextTheme.titleLarge!.fontSize, equals(22));
      expect(pTextTheme.titleMedium!.fontSize, equals(16));
      expect(pTextTheme.titleSmall!.fontSize, equals(14));
      expect(pTextTheme.bodyLarge!.fontSize, equals(16));
      expect(pTextTheme.bodyMedium!.fontSize, equals(14));
      expect(pTextTheme.bodySmall!.fontSize, equals(12));
      expect(pTextTheme.labelLarge!.fontSize, equals(14));
      expect(pTextTheme.labelMedium!.fontSize, equals(12));
      expect(pTextTheme.labelSmall!.fontSize, equals(11));
      // TODO(rydmike): Commented as part of deprecation of blendTextTheme.
      // // Test M3 default font colors for textTheme.
      // expect(textTheme.displayLarge!.color, equals(const Color(0xd81b0e14)));
      // expect(textTheme.displayMedium!.color, equals(const Color(0xd81b0e14)));
      // expect(textTheme.displaySmall!.color, equals(const Color(0xd81b0e14)));
      // expect(textTheme.headlineLarge!.color, equals(const Color(0xd81b0e14)));
      // expect(textTheme.headlineMedium!.color, equals(const Color(0xd81b0e14)));
      // expect(textTheme.headlineSmall!.color, equals(const Color(0xf41b0e14)));
      // expect(textTheme.titleLarge!.color, equals(const Color(0xf41b0e14)));
      // expect(textTheme.titleMedium!.color, equals(const Color(0xf41b0e14)));
      // expect(textTheme.titleSmall!.color, equals(const Color(0xff1f1017)));
      // expect(textTheme.bodyLarge!.color, equals(const Color(0xf41b0e14)));
      // expect(textTheme.bodyMedium!.color, equals(const Color(0xf41b0e14)));
      // expect(textTheme.bodySmall!.color, equals(const Color(0xd81b0e14)));
      // expect(textTheme.labelLarge!.color, equals(const Color(0xf41b0e14)));
      // expect(textTheme.labelMedium!.color, equals(const Color(0xff1f1017)));
      // expect(textTheme.labelSmall!.color, equals(const Color(0xff1f1017)));
      // // Test M3 default font colors for primTextTheme.
      // expect(pTextTheme.displayLarge!.color, equals(const Color(0xe5f3edf0)));
      // expect(pTextTheme.displayMedium!.color, equals(const Color(0xe5f3edf0)));
      // expect(pTextTheme.displaySmall!.color, equals(const Color(0xe5f3edf0)));
      // expect(pTextTheme.headlineLarge!.color, equals(const Color(0xe5f3edf0)));
      // expect(pTextTheme.headlineMedium!.color, equals(const Color(0xe5f3edf0)));
      // expect(pTextTheme.headlineSmall!.color, equals(const Color(0xfff4eff1)));
      // expect(pTextTheme.titleLarge!.color, equals(const Color(0xfff4eff1)));
      // expect(pTextTheme.titleMedium!.color, equals(const Color(0xfff4eff1)));
      // expect(pTextTheme.titleSmall!.color, equals(const Color(0xfff7f2f4)));
      // expect(pTextTheme.bodyLarge!.color, equals(const Color(0xfff4eff1)));
      // expect(pTextTheme.bodyMedium!.color, equals(const Color(0xfff4eff1)));
      // expect(pTextTheme.bodySmall!.color, equals(const Color(0xe5f3edf0)));
      // expect(pTextTheme.labelLarge!.color, equals(const Color(0xfff4eff1)));
      // expect(pTextTheme.labelMedium!.color, equals(const Color(0xfff7f2f4)));
      // expect(pTextTheme.labelSmall!.color, equals(const Color(0xfff7f2f4)));
    });
    testWidgets(
        'FCS11-07 FCS-M3-DARK default textTheme with some other props defined '
        'EXPECT color and font size match 2018 typography',
        (WidgetTester tester) async {
      // Make a full ColorScheme from a SeedColor,.
      final ColorScheme scheme = ColorScheme.fromSeed(
          brightness: Brightness.dark, seedColor: const Color(0xffd9008c));
      // FCS light, M3 and custom text theme.
      final FlexColorScheme fcs = FlexColorScheme.dark(
        colorScheme: scheme,
        useMaterial3: true,
        textTheme: testText,
        primaryTextTheme: testText,
      );
      final ThemeData theme = fcs.toTheme;
      final ColorScheme c = fcs.toScheme;
      final Color tColor = c.onSurface;
      final Color pColor = c.surface;
      late TextTheme textTheme;
      late TextTheme pTextTheme;
      await tester.pumpWidget(MaterialApp(
        darkTheme: theme,
        themeMode: ThemeMode.dark,
        home: Builder(
          builder: (BuildContext context) {
            textTheme = Theme.of(context).textTheme;
            pTextTheme = Theme.of(context).primaryTextTheme;
            return const Text('A');
          },
        ),
      ));
      // Test M3 default font sizes for textTheme.
      expect(textTheme.displayLarge!.fontSize, equals(57));
      expect(textTheme.displayMedium!.fontSize, equals(45));
      expect(textTheme.displaySmall!.fontSize, equals(36));
      expect(textTheme.headlineLarge!.fontSize, equals(32));
      expect(textTheme.headlineMedium!.fontSize, equals(28));
      expect(textTheme.headlineSmall!.fontSize, equals(24));
      expect(textTheme.titleLarge!.fontSize, equals(22));
      expect(textTheme.titleMedium!.fontSize, equals(16));
      expect(textTheme.titleSmall!.fontSize, equals(14));
      expect(textTheme.bodyLarge!.fontSize, equals(16));
      expect(textTheme.bodyMedium!.fontSize, equals(14));
      expect(textTheme.bodySmall!.fontSize, equals(12));
      expect(textTheme.labelLarge!.fontSize, equals(14));
      expect(textTheme.labelMedium!.fontSize, equals(12));
      expect(textTheme.labelSmall!.fontSize, equals(11));
      // Test M3 default font sizes for primaryTextTheme.
      expect(pTextTheme.displayLarge!.fontSize, equals(57));
      expect(pTextTheme.displayMedium!.fontSize, equals(45));
      expect(pTextTheme.displaySmall!.fontSize, equals(36));
      expect(pTextTheme.headlineLarge!.fontSize, equals(32));
      expect(pTextTheme.headlineMedium!.fontSize, equals(28));
      expect(pTextTheme.headlineSmall!.fontSize, equals(24));
      expect(pTextTheme.titleLarge!.fontSize, equals(22));
      expect(pTextTheme.titleMedium!.fontSize, equals(16));
      expect(pTextTheme.titleSmall!.fontSize, equals(14));
      expect(pTextTheme.bodyLarge!.fontSize, equals(16));
      expect(pTextTheme.bodyMedium!.fontSize, equals(14));
      expect(pTextTheme.bodySmall!.fontSize, equals(12));
      expect(pTextTheme.labelLarge!.fontSize, equals(14));
      expect(pTextTheme.labelMedium!.fontSize, equals(12));
      expect(pTextTheme.labelSmall!.fontSize, equals(11));
      // Test M3 default font colors for textTheme.
      expect(textTheme.displayLarge!.color, equals(tColor));
      expect(textTheme.displayMedium!.color, equals(tColor));
      expect(textTheme.displaySmall!.color, equals(tColor));
      expect(textTheme.headlineLarge!.color, equals(tColor));
      expect(textTheme.headlineMedium!.color, equals(tColor));
      expect(textTheme.headlineSmall!.color, equals(tColor));
      expect(textTheme.titleLarge!.color, equals(tColor));
      expect(textTheme.titleMedium!.color, equals(tColor));
      expect(textTheme.titleSmall!.color, equals(tColor));
      expect(textTheme.bodyLarge!.color, equals(tColor));
      expect(textTheme.bodyMedium!.color, equals(tColor));
      expect(textTheme.bodySmall!.color, equals(tColor));
      expect(textTheme.labelLarge!.color, equals(tColor));
      expect(textTheme.labelMedium!.color, equals(tColor));
      expect(textTheme.labelSmall!.color, equals(tColor));
      // Test M3 default font colors for primTextTheme.
      expect(pTextTheme.displayLarge!.color, equals(pColor));
      expect(pTextTheme.displayMedium!.color, equals(pColor));
      expect(pTextTheme.displaySmall!.color, equals(pColor));
      expect(pTextTheme.headlineLarge!.color, equals(pColor));
      expect(pTextTheme.headlineMedium!.color, equals(pColor));
      expect(pTextTheme.headlineSmall!.color, equals(pColor));
      expect(pTextTheme.titleLarge!.color, equals(pColor));
      expect(pTextTheme.titleMedium!.color, equals(pColor));
      expect(pTextTheme.titleSmall!.color, equals(pColor));
      expect(pTextTheme.bodyLarge!.color, equals(pColor));
      expect(pTextTheme.bodyMedium!.color, equals(pColor));
      expect(pTextTheme.bodySmall!.color, equals(pColor));
      expect(pTextTheme.labelLarge!.color, equals(pColor));
      expect(pTextTheme.labelMedium!.color, equals(pColor));
      expect(pTextTheme.labelSmall!.color, equals(pColor));
    });
    testWidgets(
        'FCS11-08 FCS-M3-DARK default textTheme with some other props defined '
        'FCS use TINTED text '
        'EXPECT font size match 2021 typography and FCS tined text.',
        (WidgetTester tester) async {
      // Make a full ColorScheme from a SeedColor,.
      final ColorScheme scheme = ColorScheme.fromSeed(
          brightness: Brightness.dark, seedColor: const Color(0xffd9008c));
      // FCS light, M3 and custom text theme.
      final FlexColorScheme fcs = FlexColorScheme.dark(
        colorScheme: scheme,
        useMaterial3: true,
        textTheme: testText,
        primaryTextTheme: testText,
        subThemesData: const FlexSubThemesData(
            // TODO(rydmike): Commented as part of blendTextTheme deprecation.
            // blendTextTheme: true,
            ),
      );
      final ThemeData theme = fcs.toTheme;
      late TextTheme textTheme;
      late TextTheme pTextTheme;
      await tester.pumpWidget(MaterialApp(
        darkTheme: theme,
        themeMode: ThemeMode.dark,
        home: Builder(
          builder: (BuildContext context) {
            textTheme = Theme.of(context).textTheme;
            pTextTheme = Theme.of(context).primaryTextTheme;
            return const Text('A');
          },
        ),
      ));
      // Test M3 default font sizes for textTheme.
      expect(textTheme.displayLarge!.fontSize, equals(57));
      expect(textTheme.displayMedium!.fontSize, equals(45));
      expect(textTheme.displaySmall!.fontSize, equals(36));
      expect(textTheme.headlineLarge!.fontSize, equals(32));
      expect(textTheme.headlineMedium!.fontSize, equals(28));
      expect(textTheme.headlineSmall!.fontSize, equals(24));
      expect(textTheme.titleLarge!.fontSize, equals(22));
      expect(textTheme.titleMedium!.fontSize, equals(16));
      expect(textTheme.titleSmall!.fontSize, equals(14));
      expect(textTheme.bodyLarge!.fontSize, equals(16));
      expect(textTheme.bodyMedium!.fontSize, equals(14));
      expect(textTheme.bodySmall!.fontSize, equals(12));
      expect(textTheme.labelLarge!.fontSize, equals(14));
      expect(textTheme.labelMedium!.fontSize, equals(12));
      expect(textTheme.labelSmall!.fontSize, equals(11));
      // Test M3 default font sizes for primaryTextTheme.
      expect(pTextTheme.displayLarge!.fontSize, equals(57));
      expect(pTextTheme.displayMedium!.fontSize, equals(45));
      expect(pTextTheme.displaySmall!.fontSize, equals(36));
      expect(pTextTheme.headlineLarge!.fontSize, equals(32));
      expect(pTextTheme.headlineMedium!.fontSize, equals(28));
      expect(pTextTheme.headlineSmall!.fontSize, equals(24));
      expect(pTextTheme.titleLarge!.fontSize, equals(22));
      expect(pTextTheme.titleMedium!.fontSize, equals(16));
      expect(pTextTheme.titleSmall!.fontSize, equals(14));
      expect(pTextTheme.bodyLarge!.fontSize, equals(16));
      expect(pTextTheme.bodyMedium!.fontSize, equals(14));
      expect(pTextTheme.bodySmall!.fontSize, equals(12));
      expect(pTextTheme.labelLarge!.fontSize, equals(14));
      expect(pTextTheme.labelMedium!.fontSize, equals(12));
      expect(pTextTheme.labelSmall!.fontSize, equals(11));
      // TODO(rydmike): Commented as part of deprecation of blendTextTheme.
      // // Test M2 default font colors for textTheme.
      // expect(textTheme.displayLarge!.color, equals(const Color(0xe2fff3f8)));
      // expect(textTheme.displayMedium!.color, equals(const Color(0xe2fff3f8)));
      // expect(textTheme.displaySmall!.color, equals(const Color(0xe2fff3f8)));
      // expect(textTheme.headlineLarge!.color, equals(const Color(0xe2fff3f8)));
      // expect(textTheme.headlineMedium!.color, equals(const Color(0xe2fff3f8)));
      // expect(textTheme.headlineSmall!.color, equals(const Color(0xfffff5f9)));
      // expect(textTheme.titleLarge!.color, equals(const Color(0xfffff5f9)));
      // expect(textTheme.titleMedium!.color, equals(const Color(0xfffff5f9)));
      // expect(textTheme.titleSmall!.color, equals(const Color(0xfffff3f8)));
      // expect(textTheme.bodyLarge!.color, equals(const Color(0xfffff5f9)));
      // expect(textTheme.bodyMedium!.color, equals(const Color(0xfffff5f9)));
      // expect(textTheme.bodySmall!.color, equals(const Color(0xe2fff3f8)));
      // expect(textTheme.labelLarge!.color, equals(const Color(0xfffff5f9)));
      // expect(textTheme.labelMedium!.color, equals(const Color(0xfffff3f8)));
      // expect(textTheme.labelSmall!.color, equals(const Color(0xfffff3f8)));
      // // Test M2 default font colors for primTextTheme.
      // expect(pTextTheme.displayLarge!.color, equals(const Color(0xd8191114)));
      // expect(pTextTheme.displayMedium!.color, equals(const Color(0xd8191114)));
      // expect(pTextTheme.displaySmall!.color, equals(const Color(0xd8191114)));
      // expect(pTextTheme.headlineLarge!.color, equals(const Color(0xd8191114)));
      // expect(pTextTheme.headlineMedium!.color, equals(const Color(0xd8191114)));
      // expect(pTextTheme.headlineSmall!.color, equals(const Color(0xf20c0809)));
      // expect(pTextTheme.titleLarge!.color, equals(const Color(0xf20c0809)));
      // expect(pTextTheme.titleMedium!.color, equals(const Color(0xf20c0809)));
      // expect(pTextTheme.titleSmall!.color, equals(const Color(0xff0a0608)));
      // expect(pTextTheme.bodyLarge!.color, equals(const Color(0xf20c0809)));
      // expect(pTextTheme.bodyMedium!.color, equals(const Color(0xf20c0809)));
      // expect(pTextTheme.bodySmall!.color, equals(const Color(0xd8191114)));
      // expect(pTextTheme.labelLarge!.color, equals(const Color(0xf20c0809)));
      // expect(pTextTheme.labelMedium!.color, equals(const Color(0xff0a0608)));
      // expect(pTextTheme.labelSmall!.color, equals(const Color(0xff0a0608)));
    });
    //
    // Define a full LIGHT TextTheme, with font sizes and colors.
    const TextTheme tLText = TextTheme(
      displayLarge: TextStyle(
          fontSize: 58.0,
          color: Color(0xd8500433),
          fontWeight: FontWeight.w400,
          letterSpacing: -0.25,
          height: 1.12,
          textBaseline: TextBaseline.alphabetic,
          leadingDistribution: TextLeadingDistribution.even),
      displayMedium: TextStyle(
          fontSize: 46.0,
          color: Color(0xd8295004),
          fontWeight: FontWeight.w400,
          letterSpacing: 0.0,
          height: 1.16,
          textBaseline: TextBaseline.alphabetic,
          leadingDistribution: TextLeadingDistribution.even),
      displaySmall: TextStyle(
          fontSize: 37.0,
          color: Color(0xd8044550),
          fontWeight: FontWeight.w400,
          letterSpacing: 0.0,
          height: 1.22,
          textBaseline: TextBaseline.alphabetic,
          leadingDistribution: TextLeadingDistribution.even),
      headlineLarge: TextStyle(
          fontSize: 33.0,
          color: Color(0xd8500433),
          fontWeight: FontWeight.w400,
          letterSpacing: 0.0,
          height: 1.25,
          textBaseline: TextBaseline.alphabetic,
          leadingDistribution: TextLeadingDistribution.even),
      headlineMedium: TextStyle(
          fontSize: 29.0,
          color: Color(0xd83b1602),
          fontWeight: FontWeight.w400,
          letterSpacing: 0.0,
          height: 1.29,
          textBaseline: TextBaseline.alphabetic,
          leadingDistribution: TextLeadingDistribution.even),
      headlineSmall: TextStyle(
          fontSize: 25.0,
          color: Color(0xd84f0834),
          fontWeight: FontWeight.w400,
          letterSpacing: 0.0,
          height: 1.33,
          textBaseline: TextBaseline.alphabetic,
          leadingDistribution: TextLeadingDistribution.even),
      titleLarge: TextStyle(
          fontSize: 23.0,
          color: Color(0xd860053d),
          fontWeight: FontWeight.w400,
          letterSpacing: 0.0,
          height: 1.27,
          textBaseline: TextBaseline.alphabetic,
          leadingDistribution: TextLeadingDistribution.even),
      titleMedium: TextStyle(
          fontSize: 17.0,
          color: Color(0xd8405004),
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          height: 1.50,
          textBaseline: TextBaseline.alphabetic,
          leadingDistribution: TextLeadingDistribution.even),
      titleSmall: TextStyle(
          fontSize: 15.0,
          color: Color(0xd8045016),
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
          height: 1.43,
          textBaseline: TextBaseline.alphabetic,
          leadingDistribution: TextLeadingDistribution.even),
      labelLarge: TextStyle(
          fontSize: 15.0,
          color: Color(0xd80e0450),
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
          height: 1.43,
          textBaseline: TextBaseline.alphabetic,
          leadingDistribution: TextLeadingDistribution.even),
      labelMedium: TextStyle(
          fontSize: 13.0,
          color: Color(0xd8020c36),
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
          height: 1.33,
          textBaseline: TextBaseline.alphabetic,
          leadingDistribution: TextLeadingDistribution.even),
      labelSmall: TextStyle(
          fontSize: 12.0,
          color: Color(0xd81b3605),
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
          height: 1.45,
          textBaseline: TextBaseline.alphabetic,
          leadingDistribution: TextLeadingDistribution.even),
      bodyLarge: TextStyle(
          fontSize: 17.0,
          color: Color(0xd80d2f02),
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          height: 1.50,
          textBaseline: TextBaseline.alphabetic,
          leadingDistribution: TextLeadingDistribution.even),
      bodyMedium: TextStyle(
          fontSize: 15.0,
          color: Color(0xd8260118),
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          height: 1.43,
          textBaseline: TextBaseline.alphabetic,
          leadingDistribution: TextLeadingDistribution.even),
      bodySmall: TextStyle(
          fontSize: 13.0,
          color: Color(0xd8570738),
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
          height: 1.33,
          textBaseline: TextBaseline.alphabetic,
          leadingDistribution: TextLeadingDistribution.even),
    );
    //
    // Define a full DARK TextTheme, with font sizes and colors.
    const TextTheme tDText = TextTheme(
      displayLarge: TextStyle(
          fontSize: 58.0,
          color: Color(0xd84d4148),
          fontWeight: FontWeight.w400,
          letterSpacing: -0.25,
          height: 1.12,
          textBaseline: TextBaseline.alphabetic,
          leadingDistribution: TextLeadingDistribution.even),
      displayMedium: TextStyle(
          fontSize: 46.0,
          color: Color(0xd8495042),
          fontWeight: FontWeight.w400,
          letterSpacing: 0.0,
          height: 1.16,
          textBaseline: TextBaseline.alphabetic,
          leadingDistribution: TextLeadingDistribution.even),
      displaySmall: TextStyle(
          fontSize: 37.0,
          color: Color(0xd8344548),
          fontWeight: FontWeight.w400,
          letterSpacing: 0.0,
          height: 1.22,
          textBaseline: TextBaseline.alphabetic,
          leadingDistribution: TextLeadingDistribution.even),
      headlineLarge: TextStyle(
          fontSize: 33.0,
          color: Color(0xd8603e53),
          fontWeight: FontWeight.w400,
          letterSpacing: 0.0,
          height: 1.25,
          textBaseline: TextBaseline.alphabetic,
          leadingDistribution: TextLeadingDistribution.even),
      headlineMedium: TextStyle(
          fontSize: 29.0,
          color: Color(0xd8775e51),
          fontWeight: FontWeight.w400,
          letterSpacing: 0.0,
          height: 1.29,
          textBaseline: TextBaseline.alphabetic,
          leadingDistribution: TextLeadingDistribution.even),
      headlineSmall: TextStyle(
          fontSize: 25.0,
          color: Color(0xd8704f63),
          fontWeight: FontWeight.w400,
          letterSpacing: 0.0,
          height: 1.33,
          textBaseline: TextBaseline.alphabetic,
          leadingDistribution: TextLeadingDistribution.even),
      titleLarge: TextStyle(
          fontSize: 23.0,
          color: Color(0xd86c465e),
          fontWeight: FontWeight.w400,
          letterSpacing: 0.0,
          height: 1.27,
          textBaseline: TextBaseline.alphabetic,
          leadingDistribution: TextLeadingDistribution.even),
      titleMedium: TextStyle(
          fontSize: 17.0,
          color: Color(0xd8626947),
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          height: 1.50,
          textBaseline: TextBaseline.alphabetic,
          leadingDistribution: TextLeadingDistribution.even),
      titleSmall: TextStyle(
          fontSize: 15.0,
          color: Color(0xd8045016),
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
          height: 1.43,
          textBaseline: TextBaseline.alphabetic,
          leadingDistribution: TextLeadingDistribution.even),
      labelLarge: TextStyle(
          fontSize: 15.0,
          color: Color(0xd8484467),
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
          height: 1.43,
          textBaseline: TextBaseline.alphabetic,
          leadingDistribution: TextLeadingDistribution.even),
      labelMedium: TextStyle(
          fontSize: 13.0,
          color: Color(0xd8525870),
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
          height: 1.33,
          textBaseline: TextBaseline.alphabetic,
          leadingDistribution: TextLeadingDistribution.even),
      labelSmall: TextStyle(
          fontSize: 12.0,
          color: Color(0xd8647557),
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
          height: 1.45,
          textBaseline: TextBaseline.alphabetic,
          leadingDistribution: TextLeadingDistribution.even),
      bodyLarge: TextStyle(
          fontSize: 17.0,
          color: Color(0xd84b6244),
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          height: 1.50,
          textBaseline: TextBaseline.alphabetic,
          leadingDistribution: TextLeadingDistribution.even),
      bodyMedium: TextStyle(
          fontSize: 15.0,
          color: Color(0xd879566b),
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          height: 1.43,
          textBaseline: TextBaseline.alphabetic,
          leadingDistribution: TextLeadingDistribution.even),
      bodySmall: TextStyle(
          fontSize: 13.0,
          color: Color(0xd86b4f60),
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
          height: 1.33,
          textBaseline: TextBaseline.alphabetic,
          leadingDistribution: TextLeadingDistribution.even),
    );
    testWidgets(
        'FCS11-09 FCS-M3-LIGHT custom textTheme with color and size defined '
        'EXPECT color and font size match custom style',
        (WidgetTester tester) async {
      // Make a full ColorScheme from a SeedColor,.
      final ColorScheme scheme = ColorScheme.fromSeed(
          brightness: Brightness.light, seedColor: const Color(0xffd9008c));
      // FCS light, M3 and custom text theme.
      final FlexColorScheme fcs = FlexColorScheme.light(
        colorScheme: scheme,
        useMaterial3: true,
        textTheme: tLText,
        primaryTextTheme: tDText,
      );
      final ThemeData theme = fcs.toTheme;
      late TextTheme textTheme;
      late TextTheme pTextTheme;
      await tester.pumpWidget(MaterialApp(
        theme: theme,
        themeMode: ThemeMode.light,
        home: Builder(
          builder: (BuildContext context) {
            textTheme = Theme.of(context).textTheme;
            pTextTheme = Theme.of(context).primaryTextTheme;
            return const Text('A');
          },
        ),
      ));
      // Test M3 custom font sizes for textTheme.
      expect(textTheme.displayLarge!.fontSize, equals(58));
      expect(textTheme.displayMedium!.fontSize, equals(46));
      expect(textTheme.displaySmall!.fontSize, equals(37));
      expect(textTheme.headlineLarge!.fontSize, equals(33));
      expect(textTheme.headlineMedium!.fontSize, equals(29));
      expect(textTheme.headlineSmall!.fontSize, equals(25));
      expect(textTheme.titleLarge!.fontSize, equals(23));
      expect(textTheme.titleMedium!.fontSize, equals(17));
      expect(textTheme.titleSmall!.fontSize, equals(15));
      expect(textTheme.bodyLarge!.fontSize, equals(17));
      expect(textTheme.bodyMedium!.fontSize, equals(15));
      expect(textTheme.bodySmall!.fontSize, equals(13));
      expect(textTheme.labelLarge!.fontSize, equals(15));
      expect(textTheme.labelMedium!.fontSize, equals(13));
      expect(textTheme.labelSmall!.fontSize, equals(12));
      // Test M3 custom font sizes for primaryTextTheme.
      expect(pTextTheme.displayLarge!.fontSize, equals(58));
      expect(pTextTheme.displayMedium!.fontSize, equals(46));
      expect(pTextTheme.displaySmall!.fontSize, equals(37));
      expect(pTextTheme.headlineLarge!.fontSize, equals(33));
      expect(pTextTheme.headlineMedium!.fontSize, equals(29));
      expect(pTextTheme.headlineSmall!.fontSize, equals(25));
      expect(pTextTheme.titleLarge!.fontSize, equals(23));
      expect(pTextTheme.titleMedium!.fontSize, equals(17));
      expect(pTextTheme.titleSmall!.fontSize, equals(15));
      expect(pTextTheme.bodyLarge!.fontSize, equals(17));
      expect(pTextTheme.bodyMedium!.fontSize, equals(15));
      expect(pTextTheme.bodySmall!.fontSize, equals(13));
      expect(pTextTheme.labelLarge!.fontSize, equals(15));
      expect(pTextTheme.labelMedium!.fontSize, equals(13));
      expect(pTextTheme.labelSmall!.fontSize, equals(12));
      // Test M3 custom font colors for textTheme.
      expect(textTheme.displayLarge!.color, equals(const Color(0xd8500433)));
      expect(textTheme.displayMedium!.color, equals(const Color(0xd8295004)));
      expect(textTheme.displaySmall!.color, equals(const Color(0xd8044550)));
      expect(textTheme.headlineLarge!.color, equals(const Color(0xd8500433)));
      expect(textTheme.headlineMedium!.color, equals(const Color(0xd83b1602)));
      expect(textTheme.headlineSmall!.color, equals(const Color(0xd84f0834)));
      expect(textTheme.titleLarge!.color, equals(const Color(0xd860053d)));
      expect(textTheme.titleMedium!.color, equals(const Color(0xd8405004)));
      expect(textTheme.titleSmall!.color, equals(const Color(0xd8045016)));
      expect(textTheme.bodyLarge!.color, equals(const Color(0xd80d2f02)));
      expect(textTheme.bodyMedium!.color, equals(const Color(0xd8260118)));
      expect(textTheme.bodySmall!.color, equals(const Color(0xd8570738)));
      expect(textTheme.labelLarge!.color, equals(const Color(0xd80e0450)));
      expect(textTheme.labelMedium!.color, equals(const Color(0xd8020c36)));
      expect(textTheme.labelSmall!.color, equals(const Color(0xd81b3605)));
      // Test M3 custom font colors for primTextTheme.
      expect(pTextTheme.displayLarge!.color, equals(const Color(0xd84d4148)));
      expect(pTextTheme.displayMedium!.color, equals(const Color(0xd8495042)));
      expect(pTextTheme.displaySmall!.color, equals(const Color(0xd8344548)));
      expect(pTextTheme.headlineLarge!.color, equals(const Color(0xd8603e53)));
      expect(pTextTheme.headlineMedium!.color, equals(const Color(0xd8775e51)));
      expect(pTextTheme.headlineSmall!.color, equals(const Color(0xd8704f63)));
      expect(pTextTheme.titleLarge!.color, equals(const Color(0xd86c465e)));
      expect(pTextTheme.titleMedium!.color, equals(const Color(0xd8626947)));
      expect(pTextTheme.titleSmall!.color, equals(const Color(0xd8045016)));
      expect(pTextTheme.bodyLarge!.color, equals(const Color(0xd84b6244)));
      expect(pTextTheme.bodyMedium!.color, equals(const Color(0xd879566b)));
      expect(pTextTheme.bodySmall!.color, equals(const Color(0xd86b4f60)));
      expect(pTextTheme.labelLarge!.color, equals(const Color(0xd8484467)));
      expect(pTextTheme.labelMedium!.color, equals(const Color(0xd8525870)));
      expect(pTextTheme.labelSmall!.color, equals(const Color(0xd8647557)));
    });
    testWidgets(
        'FCS11-10 FCS-M3-LIGHT custom textTheme with color and size defined '
        'TINTED textTheme '
        'EXPECT color and font size match custom style',
        (WidgetTester tester) async {
      // Make a full ColorScheme from a SeedColor,.
      final ColorScheme scheme = ColorScheme.fromSeed(
          brightness: Brightness.light, seedColor: const Color(0xffd9008c));
      // FCS light, M3 and custom text theme.
      final FlexColorScheme fcs = FlexColorScheme.light(
        colorScheme: scheme,
        useMaterial3: true,
        textTheme: tLText,
        primaryTextTheme: tDText,
        subThemesData: const FlexSubThemesData(
            // TODO(rydmike): Commented as part of blendTextTheme deprecation.
            // blendTextTheme: true,
            ),
      );
      final ThemeData theme = fcs.toTheme;
      late TextTheme textTheme;
      late TextTheme pTextTheme;
      await tester.pumpWidget(MaterialApp(
        theme: theme,
        themeMode: ThemeMode.light,
        home: Builder(
          builder: (BuildContext context) {
            textTheme = Theme.of(context).textTheme;
            pTextTheme = Theme.of(context).primaryTextTheme;
            return const Text('A');
          },
        ),
      ));
      // Test M3 custom font sizes for textTheme.
      expect(textTheme.displayLarge!.fontSize, equals(58));
      expect(textTheme.displayMedium!.fontSize, equals(46));
      expect(textTheme.displaySmall!.fontSize, equals(37));
      expect(textTheme.headlineLarge!.fontSize, equals(33));
      expect(textTheme.headlineMedium!.fontSize, equals(29));
      expect(textTheme.headlineSmall!.fontSize, equals(25));
      expect(textTheme.titleLarge!.fontSize, equals(23));
      expect(textTheme.titleMedium!.fontSize, equals(17));
      expect(textTheme.titleSmall!.fontSize, equals(15));
      expect(textTheme.bodyLarge!.fontSize, equals(17));
      expect(textTheme.bodyMedium!.fontSize, equals(15));
      expect(textTheme.bodySmall!.fontSize, equals(13));
      expect(textTheme.labelLarge!.fontSize, equals(15));
      expect(textTheme.labelMedium!.fontSize, equals(13));
      expect(textTheme.labelSmall!.fontSize, equals(12));
      // Test M3 custom font sizes for primaryTextTheme.
      expect(pTextTheme.displayLarge!.fontSize, equals(58));
      expect(pTextTheme.displayMedium!.fontSize, equals(46));
      expect(pTextTheme.displaySmall!.fontSize, equals(37));
      expect(pTextTheme.headlineLarge!.fontSize, equals(33));
      expect(pTextTheme.headlineMedium!.fontSize, equals(29));
      expect(pTextTheme.headlineSmall!.fontSize, equals(25));
      expect(pTextTheme.titleLarge!.fontSize, equals(23));
      expect(pTextTheme.titleMedium!.fontSize, equals(17));
      expect(pTextTheme.titleSmall!.fontSize, equals(15));
      expect(pTextTheme.bodyLarge!.fontSize, equals(17));
      expect(pTextTheme.bodyMedium!.fontSize, equals(15));
      expect(pTextTheme.bodySmall!.fontSize, equals(13));
      expect(pTextTheme.labelLarge!.fontSize, equals(15));
      expect(pTextTheme.labelMedium!.fontSize, equals(13));
      expect(pTextTheme.labelSmall!.fontSize, equals(12));
      // TODO(rydmike): Commented as part of deprecation of blendTextTheme.
      // // Test M3 custom and tinted font colors for textTheme.
      // expect(textTheme.displayLarge!.color, equals(const Color(0xd85d143e)));
      // expect(textTheme.displayMedium!.color, equals(const Color(0xd83e4e1a)));
      // expect(textTheme.displaySmall!.color, equals(const Color(0xd8224655)));
      // expect(textTheme.headlineLarge!.color, equals(const Color(0xd85d143e)));
      // expect(textTheme.headlineMedium!.color, equals(const Color(0xd84c2119)));
      // expect(textTheme.headlineSmall!.color, equals(const Color(0xf45c173f)));
      // expect(textTheme.titleLarge!.color, equals(const Color(0xf4691446)));
      // expect(textTheme.titleMedium!.color, equals(const Color(0xf4504e1a)));
      // expect(textTheme.titleSmall!.color, equals(const Color(0xff264e2a)));
      // expect(textTheme.bodyLarge!.color, equals(const Color(0xf4293519)));
      // expect(textTheme.bodyMedium!.color, equals(const Color(0xf43c112a)));
      // expect(textTheme.bodySmall!.color, equals(const Color(0xd8621642)));
      // expect(textTheme.labelLarge!.color, equals(const Color(0xf42a1455)));
      // expect(textTheme.labelMedium!.color, equals(const Color(0xff241c42)));
      // expect(textTheme.labelSmall!.color, equals(const Color(0xff373b1e)));
      // // Test M3 custom and tinted font colors for primTextTheme.
      // expect(pTextTheme.displayLarge!.color, equals(const Color(0xe553424b)));
      // expect(pTextTheme.displayMedium!.color, equals(const Color(0xe5504f46)));
      // expect(pTextTheme.displaySmall!.color, equals(const Color(0xe53d454b)));
      // expect(pTextTheme.headlineLarge!.color, equals(const Color(0xe5643f55)));
      // expect(pTextTheme.headlineMedium!.color, equals(const Color(0xe5795b53)));
      // expect(pTextTheme.headlineSmall!.color, equals(const Color(0xff724e63)));
      // expect(pTextTheme.titleLarge!.color, equals(const Color(0xff6e465e)));
      // expect(pTextTheme.titleMedium!.color, equals(const Color(0xff65654a)));
      // expect(pTextTheme.titleSmall!.color, equals(const Color(0xff0e4f1c)));
      // expect(pTextTheme.bodyLarge!.color, equals(const Color(0xff515f47)));
      // expect(pTextTheme.bodyMedium!.color, equals(const Color(0xff7a546a)));
      // expect(pTextTheme.bodySmall!.color, equals(const Color(0xe56e4e60)));
      // expect(pTextTheme.labelLarge!.color, equals(const Color(0xff4e4467)));
      // expect(pTextTheme.labelMedium!.color, equals(const Color(0xff56566f)));
      // expect(pTextTheme.labelSmall!.color, equals(const Color(0xff667158)));
    });

    testWidgets(
        'FCS11-11 FCS-M3-DARK custom textTheme with color and size defined '
        'EXPECT color and font size match custom style',
        (WidgetTester tester) async {
      // Make a full ColorScheme from a SeedColor,.
      final ColorScheme scheme = ColorScheme.fromSeed(
          brightness: Brightness.dark, seedColor: const Color(0xffd9008c));
      // FCS dark, M3 and custom text theme.
      final FlexColorScheme fcs = FlexColorScheme.dark(
        colorScheme: scheme,
        useMaterial3: true,
        textTheme: tDText,
        primaryTextTheme: tLText,
      );
      final ThemeData theme = fcs.toTheme;
      late TextTheme textTheme;
      late TextTheme pTextTheme;
      await tester.pumpWidget(MaterialApp(
        darkTheme: theme,
        themeMode: ThemeMode.dark,
        home: Builder(
          builder: (BuildContext context) {
            textTheme = Theme.of(context).textTheme;
            pTextTheme = Theme.of(context).primaryTextTheme;
            return const Text('A');
          },
        ),
      ));
      // Test M3 custom font sizes for textTheme.
      expect(textTheme.displayLarge!.fontSize, equals(58));
      expect(textTheme.displayMedium!.fontSize, equals(46));
      expect(textTheme.displaySmall!.fontSize, equals(37));
      expect(textTheme.headlineLarge!.fontSize, equals(33));
      expect(textTheme.headlineMedium!.fontSize, equals(29));
      expect(textTheme.headlineSmall!.fontSize, equals(25));
      expect(textTheme.titleLarge!.fontSize, equals(23));
      expect(textTheme.titleMedium!.fontSize, equals(17));
      expect(textTheme.titleSmall!.fontSize, equals(15));
      expect(textTheme.bodyLarge!.fontSize, equals(17));
      expect(textTheme.bodyMedium!.fontSize, equals(15));
      expect(textTheme.bodySmall!.fontSize, equals(13));
      expect(textTheme.labelLarge!.fontSize, equals(15));
      expect(textTheme.labelMedium!.fontSize, equals(13));
      expect(textTheme.labelSmall!.fontSize, equals(12));
      // Test M3 custom font sizes for primaryTextTheme.
      expect(pTextTheme.displayLarge!.fontSize, equals(58));
      expect(pTextTheme.displayMedium!.fontSize, equals(46));
      expect(pTextTheme.displaySmall!.fontSize, equals(37));
      expect(pTextTheme.headlineLarge!.fontSize, equals(33));
      expect(pTextTheme.headlineMedium!.fontSize, equals(29));
      expect(pTextTheme.headlineSmall!.fontSize, equals(25));
      expect(pTextTheme.titleLarge!.fontSize, equals(23));
      expect(pTextTheme.titleMedium!.fontSize, equals(17));
      expect(pTextTheme.titleSmall!.fontSize, equals(15));
      expect(pTextTheme.bodyLarge!.fontSize, equals(17));
      expect(pTextTheme.bodyMedium!.fontSize, equals(15));
      expect(pTextTheme.bodySmall!.fontSize, equals(13));
      expect(pTextTheme.labelLarge!.fontSize, equals(15));
      expect(pTextTheme.labelMedium!.fontSize, equals(13));
      expect(pTextTheme.labelSmall!.fontSize, equals(12));
      // Test M3 custom font colors for textTheme.
      expect(textTheme.displayLarge!.color, equals(const Color(0xd84d4148)));
      expect(textTheme.displayMedium!.color, equals(const Color(0xd8495042)));
      expect(textTheme.displaySmall!.color, equals(const Color(0xd8344548)));
      expect(textTheme.headlineLarge!.color, equals(const Color(0xd8603e53)));
      expect(textTheme.headlineMedium!.color, equals(const Color(0xd8775e51)));
      expect(textTheme.headlineSmall!.color, equals(const Color(0xd8704f63)));
      expect(textTheme.titleLarge!.color, equals(const Color(0xd86c465e)));
      expect(textTheme.titleMedium!.color, equals(const Color(0xd8626947)));
      expect(textTheme.titleSmall!.color, equals(const Color(0xd8045016)));
      expect(textTheme.bodyLarge!.color, equals(const Color(0xd84b6244)));
      expect(textTheme.bodyMedium!.color, equals(const Color(0xd879566b)));
      expect(textTheme.bodySmall!.color, equals(const Color(0xd86b4f60)));
      expect(textTheme.labelLarge!.color, equals(const Color(0xd8484467)));
      expect(textTheme.labelMedium!.color, equals(const Color(0xd8525870)));
      expect(textTheme.labelSmall!.color, equals(const Color(0xd8647557)));
      // Test M3 custom font colors for primTextTheme.
      expect(pTextTheme.displayLarge!.color, equals(const Color(0xd8500433)));
      expect(pTextTheme.displayMedium!.color, equals(const Color(0xd8295004)));
      expect(pTextTheme.displaySmall!.color, equals(const Color(0xd8044550)));
      expect(pTextTheme.headlineLarge!.color, equals(const Color(0xd8500433)));
      expect(pTextTheme.headlineMedium!.color, equals(const Color(0xd83b1602)));
      expect(pTextTheme.headlineSmall!.color, equals(const Color(0xd84f0834)));
      expect(pTextTheme.titleLarge!.color, equals(const Color(0xd860053d)));
      expect(pTextTheme.titleMedium!.color, equals(const Color(0xd8405004)));
      expect(pTextTheme.titleSmall!.color, equals(const Color(0xd8045016)));
      expect(pTextTheme.bodyLarge!.color, equals(const Color(0xd80d2f02)));
      expect(pTextTheme.bodyMedium!.color, equals(const Color(0xd8260118)));
      expect(pTextTheme.bodySmall!.color, equals(const Color(0xd8570738)));
      expect(pTextTheme.labelLarge!.color, equals(const Color(0xd80e0450)));
      expect(pTextTheme.labelMedium!.color, equals(const Color(0xd8020c36)));
      expect(pTextTheme.labelSmall!.color, equals(const Color(0xd81b3605)));
    });
    testWidgets(
        'FCS11-12 FCS-M3-DARK custom textTheme with color and size defined '
        'TINTED textTheme '
        'EXPECT color and font size match custom style',
        (WidgetTester tester) async {
      // Make a full ColorScheme from a SeedColor,.
      final ColorScheme scheme = ColorScheme.fromSeed(
          brightness: Brightness.dark, seedColor: const Color(0xffd9008c));
      // FCS dark, M3 and custom text theme.
      final FlexColorScheme fcs = FlexColorScheme.dark(
        colorScheme: scheme,
        useMaterial3: true,
        textTheme: tDText,
        primaryTextTheme: tLText,
        subThemesData: const FlexSubThemesData(
            // TODO(rydmike): Commented as part of blendTextTheme deprecation.
            // blendTextTheme: true,
            ),
      );
      final ThemeData theme = fcs.toTheme;
      late TextTheme textTheme;
      late TextTheme pTextTheme;
      await tester.pumpWidget(MaterialApp(
        darkTheme: theme,
        themeMode: ThemeMode.dark,
        home: Builder(
          builder: (BuildContext context) {
            textTheme = Theme.of(context).textTheme;
            pTextTheme = Theme.of(context).primaryTextTheme;
            return const Text('A');
          },
        ),
      ));
      // Test M3 custom font sizes for textTheme.
      expect(textTheme.displayLarge!.fontSize, equals(58));
      expect(textTheme.displayMedium!.fontSize, equals(46));
      expect(textTheme.displaySmall!.fontSize, equals(37));
      expect(textTheme.headlineLarge!.fontSize, equals(33));
      expect(textTheme.headlineMedium!.fontSize, equals(29));
      expect(textTheme.headlineSmall!.fontSize, equals(25));
      expect(textTheme.titleLarge!.fontSize, equals(23));
      expect(textTheme.titleMedium!.fontSize, equals(17));
      expect(textTheme.titleSmall!.fontSize, equals(15));
      expect(textTheme.bodyLarge!.fontSize, equals(17));
      expect(textTheme.bodyMedium!.fontSize, equals(15));
      expect(textTheme.bodySmall!.fontSize, equals(13));
      expect(textTheme.labelLarge!.fontSize, equals(15));
      expect(textTheme.labelMedium!.fontSize, equals(13));
      expect(textTheme.labelSmall!.fontSize, equals(12));
      // Test M3 custom font sizes for primaryTextTheme.
      expect(pTextTheme.displayLarge!.fontSize, equals(58));
      expect(pTextTheme.displayMedium!.fontSize, equals(46));
      expect(pTextTheme.displaySmall!.fontSize, equals(37));
      expect(pTextTheme.headlineLarge!.fontSize, equals(33));
      expect(pTextTheme.headlineMedium!.fontSize, equals(29));
      expect(pTextTheme.headlineSmall!.fontSize, equals(25));
      expect(pTextTheme.titleLarge!.fontSize, equals(23));
      expect(pTextTheme.titleMedium!.fontSize, equals(17));
      expect(pTextTheme.titleSmall!.fontSize, equals(15));
      expect(pTextTheme.bodyLarge!.fontSize, equals(17));
      expect(pTextTheme.bodyMedium!.fontSize, equals(15));
      expect(pTextTheme.bodySmall!.fontSize, equals(13));
      expect(pTextTheme.labelLarge!.fontSize, equals(15));
      expect(pTextTheme.labelMedium!.fontSize, equals(13));
      expect(pTextTheme.labelSmall!.fontSize, equals(12));
      // TODO(rydmike): Commented as part of deprecation of blendTextTheme.
      // // Test M3 custom and tinted font colors for textTheme.
      // expect(textTheme.displayLarge!.color, equals(const Color(0xe26b545f)));
      // expect(textTheme.displayMedium!.color, equals(const Color(0xe268605a)));
      // expect(textTheme.displaySmall!.color, equals(const Color(0xe256575f)));
      // expect(textTheme.headlineLarge!.color, equals(const Color(0xe27b5168)));
      // expect(textTheme.headlineMedium!.color, equals(const Color(0xe28e6c67)));
      // expect(textTheme.headlineSmall!.color, equals(const Color(0xff835c72)));
      // expect(textTheme.titleLarge!.color, equals(const Color(0xff80546d)));
      // expect(textTheme.titleMedium!.color, equals(const Color(0xff777259)));
      // expect(textTheme.titleSmall!.color, equals(const Color(0xff2f6036)));
      // expect(textTheme.bodyLarge!.color, equals(const Color(0xff636c57)));
      // expect(textTheme.bodyMedium!.color, equals(const Color(0xff8b6278)));
      // expect(textTheme.bodySmall!.color, equals(const Color(0xe2845f73)));
      // expect(textTheme.labelLarge!.color, equals(const Color(0xff605275)));
      // expect(textTheme.labelMedium!.color, equals(const Color(0xff6f6780)));
      // expect(textTheme.labelSmall!.color, equals(const Color(0xff7e7f6b)));
      // // Test M3 custom and tinted font colors for primTextTheme.
      // expect(pTextTheme.displayLarge!.color, equals(const Color(0xd8631745)));
      // expect(pTextTheme.displayMedium!.color, equals(const Color(0xd8415a1b)));
      // expect(pTextTheme.displaySmall!.color, equals(const Color(0xd820515e)));
      // expect(pTextTheme.headlineLarge!.color, equals(const Color(0xd8631745)));
      // expect(pTextTheme.headlineMedium!.color, equals(const Color(0xd8512719)));
      // expect(pTextTheme.headlineSmall!.color, equals(const Color(0xf258113c)));
      // expect(pTextTheme.titleLarge!.color, equals(const Color(0xf2680e45)));
      // expect(pTextTheme.titleMedium!.color, equals(const Color(0xf24a550f)));
      // expect(pTextTheme.titleSmall!.color, equals(const Color(0xff0f541e)));
      // expect(pTextTheme.bodyLarge!.color, equals(const Color(0xf21a360d)));
      // expect(pTextTheme.bodyMedium!.color, equals(const Color(0xf2320a22)));
      // expect(pTextTheme.bodySmall!.color, equals(const Color(0xd86a1a49)));
      // expect(pTextTheme.labelLarge!.color, equals(const Color(0xf21b0d57)));
      // expect(pTextTheme.labelMedium!.color, equals(const Color(0xff0d133d)));
      // expect(pTextTheme.labelSmall!.color, equals(const Color(0xff253b0e)));
    });

    testWidgets(
        'FCS11-13 FCS-M2-LIGHT Google textTheme with no props defined '
        'EXPECT color and font size match 2018 typography',
        (WidgetTester tester) async {
      // Define a Google Fonts TextTheme, it has colors baked into its styles.
      // FCS will handle their removal and return theme correct colors, if the
      // colors in default Google default TextTheme has not been modified.
      // FCS will then return the correct color style for textTheme and
      // primaryTextTheme, that is correct for both M2 and M3 mode, where
      // M2 gets the opacity based colors and M3 the onSurface based colors.
      final TextTheme gTextTheme = GoogleFonts.notoSansTextTheme();
      // Make a full ColorScheme from a SeedColor.
      final ColorScheme scheme = ColorScheme.fromSeed(
          brightness: Brightness.light, seedColor: const Color(0xffd9008c));
      // FCS light, M2 and custom text theme.
      final FlexColorScheme fcs = FlexColorScheme.light(
        colorScheme: scheme,
        useMaterial3: false,
        textTheme: gTextTheme,
        primaryTextTheme: gTextTheme,
      );
      final ThemeData theme = fcs.toTheme;
      late TextTheme textTheme;
      late TextTheme pTextTheme;
      await tester.pumpWidget(MaterialApp(
        theme: theme,
        themeMode: ThemeMode.light,
        home: Builder(
          builder: (BuildContext context) {
            textTheme = Theme.of(context).textTheme;
            pTextTheme = Theme.of(context).primaryTextTheme;
            return const Text('A');
          },
        ),
      ));
      // Test M2 default font sizes for textTheme.
      expect(textTheme.displayLarge!.fontSize, equals(96));
      expect(textTheme.displayMedium!.fontSize, equals(60));
      expect(textTheme.displaySmall!.fontSize, equals(48));
      expect(textTheme.headlineLarge!.fontSize, equals(40));
      expect(textTheme.headlineMedium!.fontSize, equals(34));
      expect(textTheme.headlineSmall!.fontSize, equals(24));
      expect(textTheme.titleLarge!.fontSize, equals(20));
      expect(textTheme.titleMedium!.fontSize, equals(16));
      expect(textTheme.titleSmall!.fontSize, equals(14));
      expect(textTheme.bodyLarge!.fontSize, equals(16));
      expect(textTheme.bodyMedium!.fontSize, equals(14));
      expect(textTheme.bodySmall!.fontSize, equals(12));
      expect(textTheme.labelLarge!.fontSize, equals(14));
      expect(textTheme.labelMedium!.fontSize, equals(11));
      expect(textTheme.labelSmall!.fontSize, equals(10));
      // Test M2 default font sizes for primaryTextTheme.
      expect(pTextTheme.displayLarge!.fontSize, equals(96));
      expect(pTextTheme.displayMedium!.fontSize, equals(60));
      expect(pTextTheme.displaySmall!.fontSize, equals(48));
      expect(pTextTheme.headlineLarge!.fontSize, equals(40));
      expect(pTextTheme.headlineMedium!.fontSize, equals(34));
      expect(pTextTheme.headlineSmall!.fontSize, equals(24));
      expect(pTextTheme.titleLarge!.fontSize, equals(20));
      expect(pTextTheme.titleMedium!.fontSize, equals(16));
      expect(pTextTheme.titleSmall!.fontSize, equals(14));
      expect(pTextTheme.bodyLarge!.fontSize, equals(16));
      expect(pTextTheme.bodyMedium!.fontSize, equals(14));
      expect(pTextTheme.bodySmall!.fontSize, equals(12));
      expect(pTextTheme.labelLarge!.fontSize, equals(14));
      expect(pTextTheme.labelMedium!.fontSize, equals(11));
      expect(pTextTheme.labelSmall!.fontSize, equals(10));
      // Test M2 default font colors for textTheme.
      expect(textTheme.displayLarge!.color, equals(Colors.black54));
      expect(textTheme.displayMedium!.color, equals(Colors.black54));
      expect(textTheme.displaySmall!.color, equals(Colors.black54));
      expect(textTheme.headlineLarge!.color, equals(Colors.black54));
      expect(textTheme.headlineMedium!.color, equals(Colors.black54));
      expect(textTheme.headlineSmall!.color, equals(Colors.black87));
      expect(textTheme.titleLarge!.color, equals(Colors.black87));
      expect(textTheme.titleMedium!.color, equals(Colors.black87));
      expect(textTheme.titleSmall!.color, equals(Colors.black));
      expect(textTheme.bodyLarge!.color, equals(Colors.black87));
      expect(textTheme.bodyMedium!.color, equals(Colors.black87));
      expect(textTheme.bodySmall!.color, equals(Colors.black54));
      expect(textTheme.labelLarge!.color, equals(Colors.black87));
      expect(textTheme.labelMedium!.color, equals(Colors.black));
      expect(textTheme.labelSmall!.color, equals(Colors.black));
      // Test M2 default font colors for primTextTheme.
      expect(pTextTheme.displayLarge!.color, equals(Colors.white70));
      expect(pTextTheme.displayMedium!.color, equals(Colors.white70));
      expect(pTextTheme.displaySmall!.color, equals(Colors.white70));
      expect(pTextTheme.headlineLarge!.color, equals(Colors.white70));
      expect(pTextTheme.headlineMedium!.color, equals(Colors.white70));
      expect(pTextTheme.headlineSmall!.color, equals(Colors.white));
      expect(pTextTheme.titleLarge!.color, equals(Colors.white));
      expect(pTextTheme.titleMedium!.color, equals(Colors.white));
      expect(pTextTheme.titleSmall!.color, equals(Colors.white));
      expect(pTextTheme.bodyLarge!.color, equals(Colors.white));
      expect(pTextTheme.bodyMedium!.color, equals(Colors.white));
      expect(pTextTheme.bodySmall!.color, equals(Colors.white70));
      expect(pTextTheme.labelLarge!.color, equals(Colors.white));
      expect(pTextTheme.labelMedium!.color, equals(Colors.white));
      expect(pTextTheme.labelSmall!.color, equals(Colors.white));
    });
    testWidgets(
        'FCS11-14 FCS-M2-LIGHT Google textTheme with no other props defined '
        'FCS use TINTED text '
        'EXPECT font size match 2018 typography and FCS tined text.',
        (WidgetTester tester) async {
      // Define a Google Fonts TextTheme, it has colors baked into its styles.
      // FCS will handle their removal and return theme correct colors, if the
      // colors in default Google default TextTheme has not been modified.
      // FCS will then return the correct color style for textTheme and
      // primaryTextTheme, that is correct for both M2 and M3 mode, where
      // M2 gets the opacity based colors and M3 the onSurface based colors.
      final TextTheme gTextTheme = GoogleFonts.notoSansTextTheme();
      // Make a full ColorScheme from a SeedColor.
      final ColorScheme scheme = ColorScheme.fromSeed(
          brightness: Brightness.light, seedColor: const Color(0xffd9008c));
      // FCS light, M2 and custom text theme.
      final FlexColorScheme fcs = FlexColorScheme.light(
        colorScheme: scheme,
        useMaterial3: false,
        textTheme: gTextTheme,
        primaryTextTheme: gTextTheme,
        subThemesData: const FlexSubThemesData(
          useMaterial3Typography: false,
          // TODO(rydmike): Commented as part of deprecation of blendTextTheme.
          // blendTextTheme: true,
        ),
      );
      final ThemeData theme = fcs.toTheme;
      late TextTheme textTheme;
      late TextTheme pTextTheme;
      await tester.pumpWidget(MaterialApp(
        theme: theme,
        themeMode: ThemeMode.light,
        home: Builder(
          builder: (BuildContext context) {
            textTheme = Theme.of(context).textTheme;
            pTextTheme = Theme.of(context).primaryTextTheme;
            return const Text('A');
          },
        ),
      ));
      // Test M2 default font sizes for textTheme.
      expect(textTheme.displayLarge!.fontSize, equals(96));
      expect(textTheme.displayMedium!.fontSize, equals(60));
      expect(textTheme.displaySmall!.fontSize, equals(48));
      expect(textTheme.headlineLarge!.fontSize, equals(40));
      expect(textTheme.headlineMedium!.fontSize, equals(34));
      expect(textTheme.headlineSmall!.fontSize, equals(24));
      expect(textTheme.titleLarge!.fontSize, equals(20));
      expect(textTheme.titleMedium!.fontSize, equals(16));
      expect(textTheme.titleSmall!.fontSize, equals(14));
      expect(textTheme.bodyLarge!.fontSize, equals(16));
      expect(textTheme.bodyMedium!.fontSize, equals(14));
      expect(textTheme.bodySmall!.fontSize, equals(12));
      expect(textTheme.labelLarge!.fontSize, equals(14));
      expect(textTheme.labelMedium!.fontSize, equals(11));
      expect(textTheme.labelSmall!.fontSize, equals(10));
      // Test M2 default font sizes for primaryTextTheme.
      expect(pTextTheme.displayLarge!.fontSize, equals(96));
      expect(pTextTheme.displayMedium!.fontSize, equals(60));
      expect(pTextTheme.displaySmall!.fontSize, equals(48));
      expect(pTextTheme.headlineLarge!.fontSize, equals(40));
      expect(pTextTheme.headlineMedium!.fontSize, equals(34));
      expect(pTextTheme.headlineSmall!.fontSize, equals(24));
      expect(pTextTheme.titleLarge!.fontSize, equals(20));
      expect(pTextTheme.titleMedium!.fontSize, equals(16));
      expect(pTextTheme.titleSmall!.fontSize, equals(14));
      expect(pTextTheme.bodyLarge!.fontSize, equals(16));
      expect(pTextTheme.bodyMedium!.fontSize, equals(14));
      expect(pTextTheme.bodySmall!.fontSize, equals(12));
      expect(pTextTheme.labelLarge!.fontSize, equals(14));
      expect(pTextTheme.labelMedium!.fontSize, equals(11));
      expect(pTextTheme.labelSmall!.fontSize, equals(10));
      // TODO(rydmike): Commented as part of deprecation of blendTextTheme.
      // // Test M2 default font colors for textTheme.
      // expect(textTheme.displayLarge!.color, equals(const Color(0xd81b0e14)));
      // expect(textTheme.displayMedium!.color, equals(const Color(0xd81b0e14)));
      // expect(textTheme.displaySmall!.color, equals(const Color(0xd81b0e14)));
      // expect(textTheme.headlineLarge!.color, equals(const Color(0xd81b0e14)));
      // expect(textTheme.headlineMedium!.color, equals(const Color(0xd81b0e14)));
      // expect(textTheme.headlineSmall!.color, equals(const Color(0xf41b0e14)));
      // expect(textTheme.titleLarge!.color, equals(const Color(0xf41b0e14)));
      // expect(textTheme.titleMedium!.color, equals(const Color(0xf41b0e14)));
      // expect(textTheme.titleSmall!.color, equals(const Color(0xff1f1017)));
      // expect(textTheme.bodyLarge!.color, equals(const Color(0xf41b0e14)));
      // expect(textTheme.bodyMedium!.color, equals(const Color(0xf41b0e14)));
      // expect(textTheme.bodySmall!.color, equals(const Color(0xd81b0e14)));
      // expect(textTheme.labelLarge!.color, equals(const Color(0xf41b0e14)));
      // expect(textTheme.labelMedium!.color, equals(const Color(0xff1f1017)));
      // expect(textTheme.labelSmall!.color, equals(const Color(0xff1f1017)));
      // // Test M2 default font colors for primTextTheme.
      // expect(pTextTheme.displayLarge!.color, equals(const Color(0xe5f3edf0)));
      // expect(pTextTheme.displayMedium!.color, equals(const Color(0xe5f3edf0)));
      // expect(pTextTheme.displaySmall!.color, equals(const Color(0xe5f3edf0)));
      // expect(pTextTheme.headlineLarge!.color, equals(const Color(0xe5f3edf0)));
      // expect(pTextTheme.headlineMedium!.color, equals(const Color(0xe5f3edf0)));
      // expect(pTextTheme.headlineSmall!.color, equals(const Color(0xfff4eff1)));
      // expect(pTextTheme.titleLarge!.color, equals(const Color(0xfff4eff1)));
      // expect(pTextTheme.titleMedium!.color, equals(const Color(0xfff4eff1)));
      // expect(pTextTheme.titleSmall!.color, equals(const Color(0xfff7f2f4)));
      // expect(pTextTheme.bodyLarge!.color, equals(const Color(0xfff4eff1)));
      // expect(pTextTheme.bodyMedium!.color, equals(const Color(0xfff4eff1)));
      // expect(pTextTheme.bodySmall!.color, equals(const Color(0xe5f3edf0)));
      // expect(pTextTheme.labelLarge!.color, equals(const Color(0xfff4eff1)));
      // expect(pTextTheme.labelMedium!.color, equals(const Color(0xfff7f2f4)));
      // expect(pTextTheme.labelSmall!.color, equals(const Color(0xfff7f2f4)));
    });
    testWidgets(
        'FCS11-15 FCS-M2-DARK Google textTheme with no other props defined '
        'EXPECT color and font size match 2018 typography',
        (WidgetTester tester) async {
      // Define a Google Fonts TextTheme, it has colors baked into its styles.
      // FCS will handle their removal and return theme correct colors, if the
      // colors in default Google default TextTheme has not been modified.
      // FCS will then return the correct color style for textTheme and
      // primaryTextTheme, that is correct for both M2 and M3 mode, where
      // M2 gets the opacity based colors and M3 the onSurface based colors.
      final TextTheme gTextTheme = GoogleFonts.notoSansTextTheme();
      // Make a full ColorScheme from a SeedColor.
      final ColorScheme scheme = ColorScheme.fromSeed(
          brightness: Brightness.dark, seedColor: const Color(0xffd9008c));
      // FCS light, M2 and custom text theme.
      final FlexColorScheme fcs = FlexColorScheme.dark(
        colorScheme: scheme,
        useMaterial3: false,
        textTheme: gTextTheme,
        primaryTextTheme: gTextTheme,
      );
      final ThemeData theme = fcs.toTheme;
      late TextTheme textTheme;
      late TextTheme pTextTheme;
      await tester.pumpWidget(MaterialApp(
        darkTheme: theme,
        themeMode: ThemeMode.dark,
        home: Builder(
          builder: (BuildContext context) {
            textTheme = Theme.of(context).textTheme;
            pTextTheme = Theme.of(context).primaryTextTheme;
            return const Text('A');
          },
        ),
      ));
      // Test M2 default font sizes for textTheme.
      expect(textTheme.displayLarge!.fontSize, equals(96));
      expect(textTheme.displayMedium!.fontSize, equals(60));
      expect(textTheme.displaySmall!.fontSize, equals(48));
      expect(textTheme.headlineLarge!.fontSize, equals(40));
      expect(textTheme.headlineMedium!.fontSize, equals(34));
      expect(textTheme.headlineSmall!.fontSize, equals(24));
      expect(textTheme.titleLarge!.fontSize, equals(20));
      expect(textTheme.titleMedium!.fontSize, equals(16));
      expect(textTheme.titleSmall!.fontSize, equals(14));
      expect(textTheme.bodyLarge!.fontSize, equals(16));
      expect(textTheme.bodyMedium!.fontSize, equals(14));
      expect(textTheme.bodySmall!.fontSize, equals(12));
      expect(textTheme.labelLarge!.fontSize, equals(14));
      expect(textTheme.labelMedium!.fontSize, equals(11));
      expect(textTheme.labelSmall!.fontSize, equals(10));
      // Test M2 default font sizes for primaryTextTheme.
      expect(pTextTheme.displayLarge!.fontSize, equals(96));
      expect(pTextTheme.displayMedium!.fontSize, equals(60));
      expect(pTextTheme.displaySmall!.fontSize, equals(48));
      expect(pTextTheme.headlineLarge!.fontSize, equals(40));
      expect(pTextTheme.headlineMedium!.fontSize, equals(34));
      expect(pTextTheme.headlineSmall!.fontSize, equals(24));
      expect(pTextTheme.titleLarge!.fontSize, equals(20));
      expect(pTextTheme.titleMedium!.fontSize, equals(16));
      expect(pTextTheme.titleSmall!.fontSize, equals(14));
      expect(pTextTheme.bodyLarge!.fontSize, equals(16));
      expect(pTextTheme.bodyMedium!.fontSize, equals(14));
      expect(pTextTheme.bodySmall!.fontSize, equals(12));
      expect(pTextTheme.labelLarge!.fontSize, equals(14));
      expect(pTextTheme.labelMedium!.fontSize, equals(11));
      expect(pTextTheme.labelSmall!.fontSize, equals(10));
      // Test M2 default font colors for textTheme.
      expect(textTheme.displayLarge!.color, equals(Colors.white70));
      expect(textTheme.displayMedium!.color, equals(Colors.white70));
      expect(textTheme.displaySmall!.color, equals(Colors.white70));
      expect(textTheme.headlineLarge!.color, equals(Colors.white70));
      expect(textTheme.headlineMedium!.color, equals(Colors.white70));
      expect(textTheme.headlineSmall!.color, equals(Colors.white));
      expect(textTheme.titleLarge!.color, equals(Colors.white));
      expect(textTheme.titleMedium!.color, equals(Colors.white));
      expect(textTheme.titleSmall!.color, equals(Colors.white));
      expect(textTheme.bodyLarge!.color, equals(Colors.white));
      expect(textTheme.bodyMedium!.color, equals(Colors.white));
      expect(textTheme.bodySmall!.color, equals(Colors.white70));
      expect(textTheme.labelLarge!.color, equals(Colors.white));
      expect(textTheme.labelMedium!.color, equals(Colors.white));
      expect(textTheme.labelSmall!.color, equals(Colors.white));
      // Test M2 default font colors for primTextTheme.
      expect(pTextTheme.displayLarge!.color, equals(Colors.black54));
      expect(pTextTheme.displayMedium!.color, equals(Colors.black54));
      expect(pTextTheme.displaySmall!.color, equals(Colors.black54));
      expect(pTextTheme.headlineLarge!.color, equals(Colors.black54));
      expect(pTextTheme.headlineMedium!.color, equals(Colors.black54));
      expect(pTextTheme.headlineSmall!.color, equals(Colors.black87));
      expect(pTextTheme.titleLarge!.color, equals(Colors.black87));
      expect(pTextTheme.titleMedium!.color, equals(Colors.black87));
      expect(pTextTheme.titleSmall!.color, equals(Colors.black));
      expect(pTextTheme.bodyLarge!.color, equals(Colors.black87));
      expect(pTextTheme.bodyMedium!.color, equals(Colors.black87));
      expect(pTextTheme.bodySmall!.color, equals(Colors.black54));
      expect(pTextTheme.labelLarge!.color, equals(Colors.black87));
      expect(pTextTheme.labelMedium!.color, equals(Colors.black));
      expect(pTextTheme.labelSmall!.color, equals(Colors.black));
    });
    testWidgets(
        'FCS11-16 FCS-M2-DARK Google textTheme with no other props defined '
        'FCS use TINTED text '
        'EXPECT font size match 2018 typography and FCS tined text.',
        (WidgetTester tester) async {
      // Define a Google Fonts TextTheme, it has colors baked into its styles.
      // FCS will handle their removal and return theme correct colors, if the
      // colors in default Google default TextTheme has not been modified.
      // FCS will then return the correct color style for textTheme and
      // primaryTextTheme, that is correct for both M2 and M3 mode, where
      // M2 gets the opacity based colors and M3 the onSurface based colors.
      final TextTheme gTextTheme = GoogleFonts.notoSansTextTheme();
      // Make a full ColorScheme from a SeedColor.
      final ColorScheme scheme = ColorScheme.fromSeed(
          brightness: Brightness.dark, seedColor: const Color(0xffd9008c));
      // FCS light, M2 and custom text theme.
      final FlexColorScheme fcs = FlexColorScheme.dark(
        colorScheme: scheme,
        useMaterial3: false,
        textTheme: gTextTheme,
        primaryTextTheme: gTextTheme,
        subThemesData: const FlexSubThemesData(
            // TODO(rydmike): Commented as part of blendTextTheme deprecation.
            // blendTextTheme: true,
            ),
      );
      final ThemeData theme = fcs.toTheme;
      late TextTheme textTheme;
      late TextTheme pTextTheme;
      await tester.pumpWidget(MaterialApp(
        darkTheme: theme,
        themeMode: ThemeMode.dark,
        home: Builder(
          builder: (BuildContext context) {
            textTheme = Theme.of(context).textTheme;
            pTextTheme = Theme.of(context).primaryTextTheme;
            return const Text('A');
          },
        ),
      ));
      // Test M2 default font sizes for textTheme.
      expect(textTheme.displayLarge!.fontSize, equals(96));
      expect(textTheme.displayMedium!.fontSize, equals(60));
      expect(textTheme.displaySmall!.fontSize, equals(48));
      expect(textTheme.headlineLarge!.fontSize, equals(40));
      expect(textTheme.headlineMedium!.fontSize, equals(34));
      expect(textTheme.headlineSmall!.fontSize, equals(24));
      expect(textTheme.titleLarge!.fontSize, equals(20));
      expect(textTheme.titleMedium!.fontSize, equals(16));
      expect(textTheme.titleSmall!.fontSize, equals(14));
      expect(textTheme.bodyLarge!.fontSize, equals(16));
      expect(textTheme.bodyMedium!.fontSize, equals(14));
      expect(textTheme.bodySmall!.fontSize, equals(12));
      expect(textTheme.labelLarge!.fontSize, equals(14));
      expect(textTheme.labelMedium!.fontSize, equals(11));
      expect(textTheme.labelSmall!.fontSize, equals(10));
      // Test M2 default font sizes for primaryTextTheme.
      expect(pTextTheme.displayLarge!.fontSize, equals(96));
      expect(pTextTheme.displayMedium!.fontSize, equals(60));
      expect(pTextTheme.displaySmall!.fontSize, equals(48));
      expect(pTextTheme.headlineLarge!.fontSize, equals(40));
      expect(pTextTheme.headlineMedium!.fontSize, equals(34));
      expect(pTextTheme.headlineSmall!.fontSize, equals(24));
      expect(pTextTheme.titleLarge!.fontSize, equals(20));
      expect(pTextTheme.titleMedium!.fontSize, equals(16));
      expect(pTextTheme.titleSmall!.fontSize, equals(14));
      expect(pTextTheme.bodyLarge!.fontSize, equals(16));
      expect(pTextTheme.bodyMedium!.fontSize, equals(14));
      expect(pTextTheme.bodySmall!.fontSize, equals(12));
      expect(pTextTheme.labelLarge!.fontSize, equals(14));
      expect(pTextTheme.labelMedium!.fontSize, equals(11));
      expect(pTextTheme.labelSmall!.fontSize, equals(10));
      // TODO(rydmike): Commented as part of deprecation of blendTextTheme.
      // // Test M2 default font colors for textTheme.
      // expect(textTheme.displayLarge!.color, equals(const Color(0xe2fff3f8)));
      // expect(textTheme.displayMedium!.color, equals(const Color(0xe2fff3f8)));
      // expect(textTheme.displaySmall!.color, equals(const Color(0xe2fff3f8)));
      // expect(textTheme.headlineLarge!.color, equals(const Color(0xe2fff3f8)));
      // expect(textTheme.headlineMedium!.color, equals(const Color(0xe2fff3f8)));
      // expect(textTheme.headlineSmall!.color, equals(const Color(0xfffff5f9)));
      // expect(textTheme.titleLarge!.color, equals(const Color(0xfffff5f9)));
      // expect(textTheme.titleMedium!.color, equals(const Color(0xfffff5f9)));
      // expect(textTheme.titleSmall!.color, equals(const Color(0xfffff3f8)));
      // expect(textTheme.bodyLarge!.color, equals(const Color(0xfffff5f9)));
      // expect(textTheme.bodyMedium!.color, equals(const Color(0xfffff5f9)));
      // expect(textTheme.bodySmall!.color, equals(const Color(0xe2fff3f8)));
      // expect(textTheme.labelLarge!.color, equals(const Color(0xfffff5f9)));
      // expect(textTheme.labelMedium!.color, equals(const Color(0xfffff3f8)));
      // expect(textTheme.labelSmall!.color, equals(const Color(0xfffff3f8)));
      // // Test M2 default font colors for primTextTheme.
      // expect(pTextTheme.displayLarge!.color, equals(const Color(0xd8191114)));
      // expect(pTextTheme.displayMedium!.color, equals(const Color(0xd8191114)));
      // expect(pTextTheme.displaySmall!.color, equals(const Color(0xd8191114)));
      // expect(pTextTheme.headlineLarge!.color, equals(const Color(0xd8191114)));
      // expect(pTextTheme.headlineMedium!.color, equals(const Color(0xd8191114)));
      // expect(pTextTheme.headlineSmall!.color, equals(const Color(0xf20c0809)));
      // expect(pTextTheme.titleLarge!.color, equals(const Color(0xf20c0809)));
      // expect(pTextTheme.titleMedium!.color, equals(const Color(0xf20c0809)));
      // expect(pTextTheme.titleSmall!.color, equals(const Color(0xff0a0608)));
      // expect(pTextTheme.bodyLarge!.color, equals(const Color(0xf20c0809)));
      // expect(pTextTheme.bodyMedium!.color, equals(const Color(0xf20c0809)));
      // expect(pTextTheme.bodySmall!.color, equals(const Color(0xd8191114)));
      // expect(pTextTheme.labelLarge!.color, equals(const Color(0xf20c0809)));
      // expect(pTextTheme.labelMedium!.color, equals(const Color(0xff0a0608)));
      // expect(pTextTheme.labelSmall!.color, equals(const Color(0xff0a0608)));
    });
    //
    //
    testWidgets(
        'FCS11-17 FCS-M3-LIGHT Google textTheme with no other props defined '
        'EXPECT color and font size match 2021 typography',
        (WidgetTester tester) async {
      // Define a Google Fonts TextTheme, it has colors baked into its styles.
      // FCS will handle their removal and return theme correct colors, if the
      // colors in default Google default TextTheme has not been modified.
      // FCS will then return the correct color style for textTheme and
      // primaryTextTheme, that is correct for both M2 and M3 mode, where
      // M2 gets the opacity based colors and M3 the onSurface based colors.
      final TextTheme gTextTheme = GoogleFonts.notoSansTextTheme();
      // Make a full ColorScheme from a SeedColor.
      final ColorScheme scheme = ColorScheme.fromSeed(
          brightness: Brightness.light, seedColor: const Color(0xffd9008c));
      // FCS light, M3 and custom text theme.
      final FlexColorScheme fcs = FlexColorScheme.light(
        colorScheme: scheme,
        useMaterial3: true,
        textTheme: gTextTheme,
        primaryTextTheme: gTextTheme,
      );
      final ThemeData theme = fcs.toTheme;
      final ColorScheme c = fcs.toScheme;
      final Color tColor = c.onSurface;
      final Color pColor = c.surface;
      late TextTheme textTheme;
      late TextTheme pTextTheme;
      await tester.pumpWidget(MaterialApp(
        theme: theme,
        themeMode: ThemeMode.light,
        home: Builder(
          builder: (BuildContext context) {
            textTheme = Theme.of(context).textTheme;
            pTextTheme = Theme.of(context).primaryTextTheme;
            return const Text('A');
          },
        ),
      ));
      // Test M3 default font sizes for textTheme.
      expect(textTheme.displayLarge!.fontSize, equals(57));
      expect(textTheme.displayMedium!.fontSize, equals(45));
      expect(textTheme.displaySmall!.fontSize, equals(36));
      expect(textTheme.headlineLarge!.fontSize, equals(32));
      expect(textTheme.headlineMedium!.fontSize, equals(28));
      expect(textTheme.headlineSmall!.fontSize, equals(24));
      expect(textTheme.titleLarge!.fontSize, equals(22));
      expect(textTheme.titleMedium!.fontSize, equals(16));
      expect(textTheme.titleSmall!.fontSize, equals(14));
      expect(textTheme.bodyLarge!.fontSize, equals(16));
      expect(textTheme.bodyMedium!.fontSize, equals(14));
      expect(textTheme.bodySmall!.fontSize, equals(12));
      expect(textTheme.labelLarge!.fontSize, equals(14));
      expect(textTheme.labelMedium!.fontSize, equals(12));
      expect(textTheme.labelSmall!.fontSize, equals(11));
      // Test M3 default font sizes for primaryTextTheme.
      expect(pTextTheme.displayLarge!.fontSize, equals(57));
      expect(pTextTheme.displayMedium!.fontSize, equals(45));
      expect(pTextTheme.displaySmall!.fontSize, equals(36));
      expect(pTextTheme.headlineLarge!.fontSize, equals(32));
      expect(pTextTheme.headlineMedium!.fontSize, equals(28));
      expect(pTextTheme.headlineSmall!.fontSize, equals(24));
      expect(pTextTheme.titleLarge!.fontSize, equals(22));
      expect(pTextTheme.titleMedium!.fontSize, equals(16));
      expect(pTextTheme.titleSmall!.fontSize, equals(14));
      expect(pTextTheme.bodyLarge!.fontSize, equals(16));
      expect(pTextTheme.bodyMedium!.fontSize, equals(14));
      expect(pTextTheme.bodySmall!.fontSize, equals(12));
      expect(pTextTheme.labelLarge!.fontSize, equals(14));
      expect(pTextTheme.labelMedium!.fontSize, equals(12));
      expect(pTextTheme.labelSmall!.fontSize, equals(11));
      // Test M3 default font colors for textTheme.
      expect(textTheme.displayLarge!.color, equals(tColor));
      expect(textTheme.displayMedium!.color, equals(tColor));
      expect(textTheme.displaySmall!.color, equals(tColor));
      expect(textTheme.headlineLarge!.color, equals(tColor));
      expect(textTheme.headlineMedium!.color, equals(tColor));
      expect(textTheme.headlineSmall!.color, equals(tColor));
      expect(textTheme.titleLarge!.color, equals(tColor));
      expect(textTheme.titleMedium!.color, equals(tColor));
      expect(textTheme.titleSmall!.color, equals(tColor));
      expect(textTheme.bodyLarge!.color, equals(tColor));
      expect(textTheme.bodyMedium!.color, equals(tColor));
      expect(textTheme.bodySmall!.color, equals(tColor));
      expect(textTheme.labelLarge!.color, equals(tColor));
      expect(textTheme.labelMedium!.color, equals(tColor));
      expect(textTheme.labelSmall!.color, equals(tColor));
      // Test M3 default font colors for primTextTheme.
      expect(pTextTheme.displayLarge!.color, equals(pColor));
      expect(pTextTheme.displayMedium!.color, equals(pColor));
      expect(pTextTheme.displaySmall!.color, equals(pColor));
      expect(pTextTheme.headlineLarge!.color, equals(pColor));
      expect(pTextTheme.headlineMedium!.color, equals(pColor));
      expect(pTextTheme.headlineSmall!.color, equals(pColor));
      expect(pTextTheme.titleLarge!.color, equals(pColor));
      expect(pTextTheme.titleMedium!.color, equals(pColor));
      expect(pTextTheme.titleSmall!.color, equals(pColor));
      expect(pTextTheme.bodyLarge!.color, equals(pColor));
      expect(pTextTheme.bodyMedium!.color, equals(pColor));
      expect(pTextTheme.bodySmall!.color, equals(pColor));
      expect(pTextTheme.labelLarge!.color, equals(pColor));
      expect(pTextTheme.labelMedium!.color, equals(pColor));
      expect(pTextTheme.labelSmall!.color, equals(pColor));
    });
    testWidgets(
        'FCS11-18 FCS-M3-LIGHT Google textTheme with some no props defined '
        'FCS use TINTED text '
        'EXPECT font size match 2021 typography and FCS tined text.',
        (WidgetTester tester) async {
      // Define a Google Fonts TextTheme, it has colors baked into its styles.
      // FCS will handle their removal and return theme correct colors, if the
      // colors in default Google default TextTheme has not been modified.
      // FCS will then return the correct color style for textTheme and
      // primaryTextTheme, that is correct for both M2 and M3 mode, where
      // M2 gets the opacity based colors and M3 the onSurface based colors.
      final TextTheme gTextTheme = GoogleFonts.notoSansTextTheme();
      // Make a full ColorScheme from a SeedColor.
      final ColorScheme scheme = ColorScheme.fromSeed(
          brightness: Brightness.light, seedColor: const Color(0xffd9008c));
      // FCS light, M3 and custom text theme.
      final FlexColorScheme fcs = FlexColorScheme.light(
        colorScheme: scheme,
        useMaterial3: true,
        textTheme: gTextTheme,
        primaryTextTheme: gTextTheme,
        subThemesData: const FlexSubThemesData(
          useMaterial3Typography: true,
          // TODO(rydmike): Commented as part of deprecation of blendTextTheme.
          // blendTextTheme: true,
        ),
      );
      final ThemeData theme = fcs.toTheme;
      late TextTheme textTheme;
      late TextTheme pTextTheme;
      await tester.pumpWidget(MaterialApp(
        theme: theme,
        themeMode: ThemeMode.light,
        home: Builder(
          builder: (BuildContext context) {
            textTheme = Theme.of(context).textTheme;
            pTextTheme = Theme.of(context).primaryTextTheme;
            return const Text('A');
          },
        ),
      ));
      // Test M3 default font sizes for textTheme.
      expect(textTheme.displayLarge!.fontSize, equals(57));
      expect(textTheme.displayMedium!.fontSize, equals(45));
      expect(textTheme.displaySmall!.fontSize, equals(36));
      expect(textTheme.headlineLarge!.fontSize, equals(32));
      expect(textTheme.headlineMedium!.fontSize, equals(28));
      expect(textTheme.headlineSmall!.fontSize, equals(24));
      expect(textTheme.titleLarge!.fontSize, equals(22));
      expect(textTheme.titleMedium!.fontSize, equals(16));
      expect(textTheme.titleSmall!.fontSize, equals(14));
      expect(textTheme.bodyLarge!.fontSize, equals(16));
      expect(textTheme.bodyMedium!.fontSize, equals(14));
      expect(textTheme.bodySmall!.fontSize, equals(12));
      expect(textTheme.labelLarge!.fontSize, equals(14));
      expect(textTheme.labelMedium!.fontSize, equals(12));
      expect(textTheme.labelSmall!.fontSize, equals(11));
      // Test M3 default font sizes for primaryTextTheme.
      expect(pTextTheme.displayLarge!.fontSize, equals(57));
      expect(pTextTheme.displayMedium!.fontSize, equals(45));
      expect(pTextTheme.displaySmall!.fontSize, equals(36));
      expect(pTextTheme.headlineLarge!.fontSize, equals(32));
      expect(pTextTheme.headlineMedium!.fontSize, equals(28));
      expect(pTextTheme.headlineSmall!.fontSize, equals(24));
      expect(pTextTheme.titleLarge!.fontSize, equals(22));
      expect(pTextTheme.titleMedium!.fontSize, equals(16));
      expect(pTextTheme.titleSmall!.fontSize, equals(14));
      expect(pTextTheme.bodyLarge!.fontSize, equals(16));
      expect(pTextTheme.bodyMedium!.fontSize, equals(14));
      expect(pTextTheme.bodySmall!.fontSize, equals(12));
      expect(pTextTheme.labelLarge!.fontSize, equals(14));
      expect(pTextTheme.labelMedium!.fontSize, equals(12));
      expect(pTextTheme.labelSmall!.fontSize, equals(11));
      // TODO(rydmike): Commented as part of deprecation of blendTextTheme.
      // // Test M3 default font colors for textTheme.
      // expect(textTheme.displayLarge!.color, equals(const Color(0xd81b0e14)));
      // expect(textTheme.displayMedium!.color, equals(const Color(0xd81b0e14)));
      // expect(textTheme.displaySmall!.color, equals(const Color(0xd81b0e14)));
      // expect(textTheme.headlineLarge!.color, equals(const Color(0xd81b0e14)));
      // expect(textTheme.headlineMedium!.color, equals(const Color(0xd81b0e14)));
      // expect(textTheme.headlineSmall!.color, equals(const Color(0xf41b0e14)));
      // expect(textTheme.titleLarge!.color, equals(const Color(0xf41b0e14)));
      // expect(textTheme.titleMedium!.color, equals(const Color(0xf41b0e14)));
      // expect(textTheme.titleSmall!.color, equals(const Color(0xff1f1017)));
      // expect(textTheme.bodyLarge!.color, equals(const Color(0xf41b0e14)));
      // expect(textTheme.bodyMedium!.color, equals(const Color(0xf41b0e14)));
      // expect(textTheme.bodySmall!.color, equals(const Color(0xd81b0e14)));
      // expect(textTheme.labelLarge!.color, equals(const Color(0xf41b0e14)));
      // expect(textTheme.labelMedium!.color, equals(const Color(0xff1f1017)));
      // expect(textTheme.labelSmall!.color, equals(const Color(0xff1f1017)));
      // // Test M3 default font colors for primTextTheme.
      // expect(pTextTheme.displayLarge!.color, equals(const Color(0xe5f3edf0)));
      // expect(pTextTheme.displayMedium!.color, equals(const Color(0xe5f3edf0)));
      // expect(pTextTheme.displaySmall!.color, equals(const Color(0xe5f3edf0)));
      // expect(pTextTheme.headlineLarge!.color, equals(const Color(0xe5f3edf0)));
      // expect(pTextTheme.headlineMedium!.color, equals(const Color(0xe5f3edf0)));
      // expect(pTextTheme.headlineSmall!.color, equals(const Color(0xfff4eff1)));
      // expect(pTextTheme.titleLarge!.color, equals(const Color(0xfff4eff1)));
      // expect(pTextTheme.titleMedium!.color, equals(const Color(0xfff4eff1)));
      // expect(pTextTheme.titleSmall!.color, equals(const Color(0xfff7f2f4)));
      // expect(pTextTheme.bodyLarge!.color, equals(const Color(0xfff4eff1)));
      // expect(pTextTheme.bodyMedium!.color, equals(const Color(0xfff4eff1)));
      // expect(pTextTheme.bodySmall!.color, equals(const Color(0xe5f3edf0)));
      // expect(pTextTheme.labelLarge!.color, equals(const Color(0xfff4eff1)));
      // expect(pTextTheme.labelMedium!.color, equals(const Color(0xfff7f2f4)));
      // expect(pTextTheme.labelSmall!.color, equals(const Color(0xfff7f2f4)));
    });
    testWidgets(
        'FCS11-19 FCS-M3-DARK Google textTheme with no other props defined '
        'EXPECT color and font size match 2018 typography',
        (WidgetTester tester) async {
      // Define a Google Fonts TextTheme, it has colors baked into its styles.
      // FCS will handle their removal and return theme correct colors, if the
      // colors in default Google default TextTheme has not been modified.
      // FCS will then return the correct color style for textTheme and
      // primaryTextTheme, that is correct for both M2 and M3 mode, where
      // M2 gets the opacity based colors and M3 the onSurface based colors.
      final TextTheme gTextTheme = GoogleFonts.notoSansTextTheme();
      // Make a full ColorScheme from a SeedColor.
      final ColorScheme scheme = ColorScheme.fromSeed(
          brightness: Brightness.dark, seedColor: const Color(0xffd9008c));
      // FCS light, M3 and custom text theme.
      final FlexColorScheme fcs = FlexColorScheme.dark(
        colorScheme: scheme,
        useMaterial3: true,
        textTheme: gTextTheme,
        primaryTextTheme: gTextTheme,
      );
      final ThemeData theme = fcs.toTheme;
      final ColorScheme c = fcs.toScheme;
      final Color tColor = c.onSurface;
      final Color pColor = c.surface;
      late TextTheme textTheme;
      late TextTheme pTextTheme;
      await tester.pumpWidget(MaterialApp(
        darkTheme: theme,
        themeMode: ThemeMode.dark,
        home: Builder(
          builder: (BuildContext context) {
            textTheme = Theme.of(context).textTheme;
            pTextTheme = Theme.of(context).primaryTextTheme;
            return const Text('A');
          },
        ),
      ));
      // Test M3 default font sizes for textTheme.
      expect(textTheme.displayLarge!.fontSize, equals(57));
      expect(textTheme.displayMedium!.fontSize, equals(45));
      expect(textTheme.displaySmall!.fontSize, equals(36));
      expect(textTheme.headlineLarge!.fontSize, equals(32));
      expect(textTheme.headlineMedium!.fontSize, equals(28));
      expect(textTheme.headlineSmall!.fontSize, equals(24));
      expect(textTheme.titleLarge!.fontSize, equals(22));
      expect(textTheme.titleMedium!.fontSize, equals(16));
      expect(textTheme.titleSmall!.fontSize, equals(14));
      expect(textTheme.bodyLarge!.fontSize, equals(16));
      expect(textTheme.bodyMedium!.fontSize, equals(14));
      expect(textTheme.bodySmall!.fontSize, equals(12));
      expect(textTheme.labelLarge!.fontSize, equals(14));
      expect(textTheme.labelMedium!.fontSize, equals(12));
      expect(textTheme.labelSmall!.fontSize, equals(11));
      // Test M3 default font sizes for primaryTextTheme.
      expect(pTextTheme.displayLarge!.fontSize, equals(57));
      expect(pTextTheme.displayMedium!.fontSize, equals(45));
      expect(pTextTheme.displaySmall!.fontSize, equals(36));
      expect(pTextTheme.headlineLarge!.fontSize, equals(32));
      expect(pTextTheme.headlineMedium!.fontSize, equals(28));
      expect(pTextTheme.headlineSmall!.fontSize, equals(24));
      expect(pTextTheme.titleLarge!.fontSize, equals(22));
      expect(pTextTheme.titleMedium!.fontSize, equals(16));
      expect(pTextTheme.titleSmall!.fontSize, equals(14));
      expect(pTextTheme.bodyLarge!.fontSize, equals(16));
      expect(pTextTheme.bodyMedium!.fontSize, equals(14));
      expect(pTextTheme.bodySmall!.fontSize, equals(12));
      expect(pTextTheme.labelLarge!.fontSize, equals(14));
      expect(pTextTheme.labelMedium!.fontSize, equals(12));
      expect(pTextTheme.labelSmall!.fontSize, equals(11));
      // Test M3 default font colors for textTheme.
      expect(textTheme.displayLarge!.color, equals(tColor));
      expect(textTheme.displayMedium!.color, equals(tColor));
      expect(textTheme.displaySmall!.color, equals(tColor));
      expect(textTheme.headlineLarge!.color, equals(tColor));
      expect(textTheme.headlineMedium!.color, equals(tColor));
      expect(textTheme.headlineSmall!.color, equals(tColor));
      expect(textTheme.titleLarge!.color, equals(tColor));
      expect(textTheme.titleMedium!.color, equals(tColor));
      expect(textTheme.titleSmall!.color, equals(tColor));
      expect(textTheme.bodyLarge!.color, equals(tColor));
      expect(textTheme.bodyMedium!.color, equals(tColor));
      expect(textTheme.bodySmall!.color, equals(tColor));
      expect(textTheme.labelLarge!.color, equals(tColor));
      expect(textTheme.labelMedium!.color, equals(tColor));
      expect(textTheme.labelSmall!.color, equals(tColor));
      // Test M3 default font colors for primTextTheme.
      expect(pTextTheme.displayLarge!.color, equals(pColor));
      expect(pTextTheme.displayMedium!.color, equals(pColor));
      expect(pTextTheme.displaySmall!.color, equals(pColor));
      expect(pTextTheme.headlineLarge!.color, equals(pColor));
      expect(pTextTheme.headlineMedium!.color, equals(pColor));
      expect(pTextTheme.headlineSmall!.color, equals(pColor));
      expect(pTextTheme.titleLarge!.color, equals(pColor));
      expect(pTextTheme.titleMedium!.color, equals(pColor));
      expect(pTextTheme.titleSmall!.color, equals(pColor));
      expect(pTextTheme.bodyLarge!.color, equals(pColor));
      expect(pTextTheme.bodyMedium!.color, equals(pColor));
      expect(pTextTheme.bodySmall!.color, equals(pColor));
      expect(pTextTheme.labelLarge!.color, equals(pColor));
      expect(pTextTheme.labelMedium!.color, equals(pColor));
      expect(pTextTheme.labelSmall!.color, equals(pColor));
    });
    testWidgets(
        'FCS11-20 FCS-M3-DARK Google textTheme with no other props defined '
        'FCS use TINTED text '
        'EXPECT font size match 2021 typography and FCS tined text.',
        (WidgetTester tester) async {
      // Define a Google Fonts TextTheme, it has colors baked into its styles.
      // FCS will handle their removal and return theme correct colors, if the
      // colors in default Google default TextTheme has not been modified.
      // FCS will then return the correct color style for textTheme and
      // primaryTextTheme, that is correct for both M2 and M3 mode, where
      // M2 gets the opacity based colors and M3 the onSurface based colors.
      final TextTheme gTextTheme = GoogleFonts.notoSansTextTheme();
      // Make a full ColorScheme from a SeedColor.
      final ColorScheme scheme = ColorScheme.fromSeed(
          brightness: Brightness.dark, seedColor: const Color(0xffd9008c));
      // FCS light, M3 and custom text theme.
      final FlexColorScheme fcs = FlexColorScheme.dark(
        colorScheme: scheme,
        useMaterial3: true,
        textTheme: gTextTheme,
        primaryTextTheme: gTextTheme,
        subThemesData: const FlexSubThemesData(
            // TODO(rydmike): Commented as part of blendTextTheme deprecation.
            // blendTextTheme: true,
            ),
      );
      final ThemeData theme = fcs.toTheme;
      late TextTheme textTheme;
      late TextTheme pTextTheme;
      await tester.pumpWidget(MaterialApp(
        darkTheme: theme,
        themeMode: ThemeMode.dark,
        home: Builder(
          builder: (BuildContext context) {
            textTheme = Theme.of(context).textTheme;
            pTextTheme = Theme.of(context).primaryTextTheme;
            return const Text('A');
          },
        ),
      ));
      // Test M3 default font sizes for textTheme.
      expect(textTheme.displayLarge!.fontSize, equals(57));
      expect(textTheme.displayMedium!.fontSize, equals(45));
      expect(textTheme.displaySmall!.fontSize, equals(36));
      expect(textTheme.headlineLarge!.fontSize, equals(32));
      expect(textTheme.headlineMedium!.fontSize, equals(28));
      expect(textTheme.headlineSmall!.fontSize, equals(24));
      expect(textTheme.titleLarge!.fontSize, equals(22));
      expect(textTheme.titleMedium!.fontSize, equals(16));
      expect(textTheme.titleSmall!.fontSize, equals(14));
      expect(textTheme.bodyLarge!.fontSize, equals(16));
      expect(textTheme.bodyMedium!.fontSize, equals(14));
      expect(textTheme.bodySmall!.fontSize, equals(12));
      expect(textTheme.labelLarge!.fontSize, equals(14));
      expect(textTheme.labelMedium!.fontSize, equals(12));
      expect(textTheme.labelSmall!.fontSize, equals(11));
      // Test M3 default font sizes for primaryTextTheme.
      expect(pTextTheme.displayLarge!.fontSize, equals(57));
      expect(pTextTheme.displayMedium!.fontSize, equals(45));
      expect(pTextTheme.displaySmall!.fontSize, equals(36));
      expect(pTextTheme.headlineLarge!.fontSize, equals(32));
      expect(pTextTheme.headlineMedium!.fontSize, equals(28));
      expect(pTextTheme.headlineSmall!.fontSize, equals(24));
      expect(pTextTheme.titleLarge!.fontSize, equals(22));
      expect(pTextTheme.titleMedium!.fontSize, equals(16));
      expect(pTextTheme.titleSmall!.fontSize, equals(14));
      expect(pTextTheme.bodyLarge!.fontSize, equals(16));
      expect(pTextTheme.bodyMedium!.fontSize, equals(14));
      expect(pTextTheme.bodySmall!.fontSize, equals(12));
      expect(pTextTheme.labelLarge!.fontSize, equals(14));
      expect(pTextTheme.labelMedium!.fontSize, equals(12));
      expect(pTextTheme.labelSmall!.fontSize, equals(11));
      // TODO(rydmike): Commented as part of deprecation of blendTextTheme.
      // // Test M2 default font colors for textTheme.
      // expect(textTheme.displayLarge!.color, equals(const Color(0xe2fff3f8)));
      // expect(textTheme.displayMedium!.color, equals(const Color(0xe2fff3f8)));
      // expect(textTheme.displaySmall!.color, equals(const Color(0xe2fff3f8)));
      // expect(textTheme.headlineLarge!.color, equals(const Color(0xe2fff3f8)));
      // expect(textTheme.headlineMedium!.color, equals(const Color(0xe2fff3f8)));
      // expect(textTheme.headlineSmall!.color, equals(const Color(0xfffff5f9)));
      // expect(textTheme.titleLarge!.color, equals(const Color(0xfffff5f9)));
      // expect(textTheme.titleMedium!.color, equals(const Color(0xfffff5f9)));
      // expect(textTheme.titleSmall!.color, equals(const Color(0xfffff3f8)));
      // expect(textTheme.bodyLarge!.color, equals(const Color(0xfffff5f9)));
      // expect(textTheme.bodyMedium!.color, equals(const Color(0xfffff5f9)));
      // expect(textTheme.bodySmall!.color, equals(const Color(0xe2fff3f8)));
      // expect(textTheme.labelLarge!.color, equals(const Color(0xfffff5f9)));
      // expect(textTheme.labelMedium!.color, equals(const Color(0xfffff3f8)));
      // expect(textTheme.labelSmall!.color, equals(const Color(0xfffff3f8)));
      // // Test M2 default font colors for primTextTheme.
      // expect(pTextTheme.displayLarge!.color, equals(const Color(0xd8191114)));
      // expect(pTextTheme.displayMedium!.color, equals(const Color(0xd8191114)));
      // expect(pTextTheme.displaySmall!.color, equals(const Color(0xd8191114)));
      // expect(pTextTheme.headlineLarge!.color, equals(const Color(0xd8191114)));
      // expect(pTextTheme.headlineMedium!.color, equals(const Color(0xd8191114)));
      // expect(pTextTheme.headlineSmall!.color, equals(const Color(0xf20c0809)));
      // expect(pTextTheme.titleLarge!.color, equals(const Color(0xf20c0809)));
      // expect(pTextTheme.titleMedium!.color, equals(const Color(0xf20c0809)));
      // expect(pTextTheme.titleSmall!.color, equals(const Color(0xff0a0608)));
      // expect(pTextTheme.bodyLarge!.color, equals(const Color(0xf20c0809)));
      // expect(pTextTheme.bodyMedium!.color, equals(const Color(0xf20c0809)));
      // expect(pTextTheme.bodySmall!.color, equals(const Color(0xd8191114)));
      // expect(pTextTheme.labelLarge!.color, equals(const Color(0xf20c0809)));
      // expect(pTextTheme.labelMedium!.color, equals(const Color(0xff0a0608)));
      // expect(pTextTheme.labelSmall!.color, equals(const Color(0xff0a0608)));
    });
  });
}

// Custom page transition with no transition.
class _NoPageTransitionsBuilder extends PageTransitionsBuilder {
  const _NoPageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}
