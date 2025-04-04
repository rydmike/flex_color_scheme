import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_color_scheme_equality.dart';

// ignore_for_file: deprecated_member_use_from_same_package

void main() {
  //****************************************************************************
  // FlexColorScheme unit tests.
  //
  // Basic object tests, equality, none equal, copyWith. Factory creation
  // same result as matching one with default constructor.
  //****************************************************************************
  group('FCS1: WITH FlexColorScheme ', () {
    debugDefaultTargetPlatformOverride = null;

    const FlexColorScheme fcsDefault = FlexColorScheme();
    const FlexColorScheme fcsMaterialLight = FlexColorScheme(
        brightness: Brightness.light, primary: FlexColor.materialLightPrimary);

    test(
        'FCS1.001-00: GIVEN a default FlexColorScheme() '
        'EXPECT it to use Material 2 default primary and be light', () {
      // Expect toTheme to be equal
      expect(fcsDefault.toScheme, equals(fcsMaterialLight.toScheme));
      // Expect toTheme to be equal
      // TODO(rydmike): toString on ThemeData match, but not ThemeData.
      // This is repeated for many test cases. It is because ThemeData
      // equality comparison is broken when using sub-themes that
      // uses MaterialState or MaterialStateProperty.
      expect(
          fcsDefault.toTheme.toString(minLevel: DiagnosticLevel.fine),
          equalsIgnoringHashCodes(fcsMaterialLight.toTheme
              .toString(minLevel: DiagnosticLevel.fine)));
    });

    final FlexSchemeColor sc =
        FlexSchemeColor.from(primary: FlexColor.materialLightPrimary);

    final FlexColorScheme fc1 = FlexColorScheme.light(
      usedColors: 1,
      blendLevel: 10,
      appBarStyle: FlexAppBarStyle.background,
      tabBarStyle: FlexTabBarStyle.forBackground,
      tooltipsMatchBackground: true,
      transparentStatusBar: false,
      useMaterial3: false,
    );
    final FlexColorScheme fc1i = FlexColorScheme.light(
      scheme: FlexScheme.material,
      usedColors: 1,
      surfaceMode: FlexSurfaceMode.level,
      blendLevel: 10,
      appBarStyle: FlexAppBarStyle.background,
      tabBarStyle: FlexTabBarStyle.forBackground,
      tooltipsMatchBackground: true,
      transparentStatusBar: false,
      useMaterial3: false,
    );
    test(
        'FCS1.001-01: GIVEN a FlexColorScheme.light with null colors and null '
        'blend level 10 and default surfaceMode to be highScaffoldLowSurfaces '
        'EXPECT FlexColorScheme.light with scheme Material.', () {
      expect(fc1, equals(fc1i));
      // Expect toTheme from them to full-fill same condition.
      expect(
          fc1.toTheme.toString(minLevel: DiagnosticLevel.fine),
          equalsIgnoringHashCodes(
              fc1i.toTheme.toString(minLevel: DiagnosticLevel.fine)));
    });

    final FlexColorScheme fc2 = FlexColorScheme.light(
      colors: sc,
      scheme: FlexScheme.materialHc,
      usedColors: 1,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
      blendLevel: 15,
      appBarStyle: FlexAppBarStyle.background,
      tabBarStyle: FlexTabBarStyle.forBackground,
      tooltipsMatchBackground: true,
      transparentStatusBar: false,
      subThemesData: const FlexSubThemesData(),
    );
    final FlexColorScheme fc2i = FlexColorScheme.light(
      colors: sc,
      usedColors: 1,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
      blendLevel: 15,
      appBarStyle: FlexAppBarStyle.background,
      tabBarStyle: FlexTabBarStyle.forBackground,
      tooltipsMatchBackground: true,
      transparentStatusBar: false,
      subThemesData: const FlexSubThemesData(),
    );
    test(
        'FCS1.001-02: GIVEN a FlexColorScheme.light with colors sc and given '
        'scheme EXPECT FlexColorScheme.light with colors sc and null scheme.',
        () {
      expect(fc2, equals(fc2i));
      // Expect toTheme from them to full-fill same condition.
      expect(
        fc2.toTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
            fc2i.toTheme.toString(minLevel: DiagnosticLevel.fine)),
      );
    });

    final FlexColorScheme fc3 = FlexColorScheme.dark(
      usedColors: 1,
      blendLevel: 10,
      appBarStyle: FlexAppBarStyle.background,
      tabBarStyle: FlexTabBarStyle.forBackground,
      tooltipsMatchBackground: true,
      transparentStatusBar: false,
      subThemesData: const FlexSubThemesData(),
      useMaterial3: false,
    );
    final FlexColorScheme fc3i = FlexColorScheme.dark(
      scheme: FlexScheme.material,
      usedColors: 1,
      surfaceMode: FlexSurfaceMode.level,
      blendLevel: 10,
      appBarStyle: FlexAppBarStyle.background,
      tabBarStyle: FlexTabBarStyle.forBackground,
      tooltipsMatchBackground: true,
      transparentStatusBar: false,
      subThemesData: const FlexSubThemesData(),
      useMaterial3: false,
    );
    test(
        'FCS1.001-03: GIVEN a FlexColorScheme.dark with null colors and null '
        'blend level 10 and default surfaceMode to be highScaffoldLowSurfaces '
        'EXPECT FlexColorScheme.dark with scheme Material.', () {
      expect(fc3, equals(fc3i));
      // Expect toTheme from them to full-fill same condition.
      expect(
        fc3.toTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
            fc3i.toTheme.toString(minLevel: DiagnosticLevel.fine)),
      );
    });

    final FlexColorScheme fc4 = FlexColorScheme.dark(
      colors: sc,
      scheme: FlexScheme.materialHc,
      usedColors: 1,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
      blendLevel: 15,
      appBarStyle: FlexAppBarStyle.background,
      tabBarStyle: FlexTabBarStyle.forBackground,
      tooltipsMatchBackground: true,
      transparentStatusBar: false,
    );
    final FlexColorScheme fc4i = FlexColorScheme.dark(
      colors: sc,
      usedColors: 1,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
      blendLevel: 15,
      appBarStyle: FlexAppBarStyle.background,
      tabBarStyle: FlexTabBarStyle.forBackground,
      tooltipsMatchBackground: true,
      transparentStatusBar: false,
    );
    test(
        'FCS1.001-04: GIVEN a FlexColorScheme.dark with colors sc and given '
        'scheme EXPECT FlexColorScheme.dark with colors sc and null scheme.',
        () {
      expect(fc4, equals(fc4i));
      // Expect toTheme from them to full-fill same condition.
      expect(
          fc4.toTheme.toString(minLevel: DiagnosticLevel.fine),
          equalsIgnoringHashCodes(
              fc4i.toTheme.toString(minLevel: DiagnosticLevel.fine)));
    });
    // m1 = Default material light scheme colors.
    const FlexColorScheme m1 = FlexColorScheme(
      brightness: Brightness.light,
      primary: FlexColor.materialLightPrimary,
      primaryContainer: FlexColor.materialLightPrimaryContainer,
      secondary: FlexColor.materialLightSecondary,
      tertiary: FlexColor.materialLightTertiary,
    );
    // m2, same definition as m1.
    const FlexColorScheme m2 = FlexColorScheme(
      brightness: Brightness.light,
      primary: FlexColor.materialLightPrimary,
      primaryContainer: FlexColor.materialLightPrimaryContainer,
      secondary: FlexColor.materialLightSecondary,
      tertiary: FlexColor.materialLightTertiary,
    );
    // m3, one different values than m1 and m2.
    const FlexColorScheme m3 = FlexColorScheme(
      brightness: Brightness.light,
      primary: FlexColor.materialLightPrimary,
      primaryContainer:
          FlexColor.materialLightPrimary, // Differs from m1 and m2.
      secondary: FlexColor.materialLightSecondary,
      tertiary: FlexColor.materialLightTertiary,
    );
    // m4, all values different from m1 and m2.
    const FlexColorScheme m4 = FlexColorScheme(
      brightness: Brightness.dark,
      primary: FlexColor.materialDarkPrimary,
      primaryContainer: FlexColor.materialDarkPrimaryContainer,
      secondary: FlexColor.materialDarkSecondary,
      tertiary: FlexColor.materialDarkTertiary,
    );

    // Identity and equality tests

    test(
        'FCS1.01a: GIVEN the same FlexColorScheme objects '
        'EXPECT them to have equality', () {
      expect(m1, equals(m1));
      // Expect toTheme from them to full-fill same condition.
      expect(
          m1.toTheme.toString(minLevel: DiagnosticLevel.fine),
          equalsIgnoringHashCodes(
              m1.toTheme.toString(minLevel: DiagnosticLevel.fine)));
    });
    test(
        'FCS1.01b: GIVEN the same FlexColorScheme objects '
        'EXPECT them to have identity', () {
      expect(identical(m1, m1), true);
    });
    test(
        'FCS1.01c: GIVEN two equal FlexColorScheme objects '
        'EXPECT them to have equality', () {
      expect(m1, equals(m2));
      // Expect toTheme from them to full-fill same condition.
      expect(
          m1.toTheme.toString(minLevel: DiagnosticLevel.fine),
          equalsIgnoringHashCodes(
              m2.toTheme.toString(minLevel: DiagnosticLevel.fine)));
    });
    test(
        'FCS1.01d: GIVEN two equal FlexColorScheme objects '
        'EXPECT them to have identity', () {
      expect(identical(m1, m2), true);
    });
    test(
        'FCS1.01e: GIVEN two identical FlexColorScheme objects '
        'EXPECT them to have equality with operator', () {
      expect(m1 == m2, true);
    });
    // Expect toTheme from them to full-fill same condition.
    // TODO(rydmike): toString on ThemeData equals, but not ThemeData.
    //   This is repeated for many test cases. It is because ThemeData
    //   equality comparison is broken when using sub-themes that
    //   uses MaterialState or MaterialStateProperty.
    //   Investigate first what SDK ThemeData tests do, if they even attempt
    //   it. This is commented for now:
    //
    //   expect(m1.toTheme == m2.toTheme, true);
    //
    //   Instead we test isNot below to see if this ever changes, if it does
    //   we can start doing the test on ThemeData object instead of its
    //   toString where the test works.
    test(
        'FCS1.02a: GIVEN none identical FlexColorScheme objects '
        'EXPECT them to be unequal', () {
      expect(m1, isNot(m3));
      // Expect toTheme from them to full-fill same condition.
      expect(m1.toTheme, isNot(m3.toTheme));
    });
    test(
        'FCS1.02b: GIVEN none identical FlexColorScheme objects '
        'EXPECT them to be unequal with operator.', () {
      expect(m1 != m3, true);
      // Expect toTheme from them to full-fill same condition.
      expect(m1.toTheme != m3.toTheme, true);
    });

    final FlexColorScheme m1e1 = m4.copyWith(
      brightness: Brightness.light,
      primary: FlexColor.materialLightPrimary,
      primaryContainer: FlexColor.materialLightPrimaryContainer,
      secondary: FlexColor.materialLightSecondary,
      tertiary: FlexColor.materialLightTertiary,
    );
    test(
        'FCS1.03a: GIVEN a FlexColorScheme object EXPECT it to be '
        'equal to an unequal object when made equal with copyWith.', () {
      expect(m1e1, equals(m1));
      // Expect toTheme from them to full-fill same condition.
      expect(
          m1e1.toTheme.toString(minLevel: DiagnosticLevel.fine),
          equalsIgnoringHashCodes(
              m1.toTheme.toString(minLevel: DiagnosticLevel.fine)));
    });
    test(
        'FCS1.03b: GIVEN a FlexColorScheme object EXPECT it to be '
        'unchanged after an empty .copyWith().', () {
      expect(m4.copyWith(), m4);
      // Expect toTheme from them to full-fill same condition.
      expect(
          m4.copyWith().toTheme.toString(minLevel: DiagnosticLevel.fine),
          equalsIgnoringHashCodes(
              m4.toTheme.toString(minLevel: DiagnosticLevel.fine)));
    });

    final FlexColorScheme m1e2 = FlexColorScheme.light(
      primary: FlexColor.materialLightPrimary,
      primaryContainer: FlexColor.materialLightPrimaryContainer,
      secondary: FlexColor.materialLightSecondary,
      secondaryContainer: FlexColor.materialLightSecondaryContainer,
      tertiary: FlexColor.materialLightTertiary,
      tertiaryContainer: FlexColor.materialLightTertiaryContainer,
      // surface: FlexColor.lightFlexSurface,
      error: FlexColor.materialLightError,
      // scaffoldBackground: FlexColor.lightFlexSurfaceContainerLowest,
      // dialogBackground: FlexColor.lightFlexSurfaceContainerHigh,
      onPrimary: Colors.white,
      onPrimaryContainer: Colors.black,
      onSecondary: Colors.black,
      onSecondaryContainer: Colors.black,
      onTertiary: Colors.white,
      onTertiaryContainer: Colors.black,
      // onSurface: FlexColor.lightFlexOnSurface,
      onError: Colors.white,
      useMaterial3: false,
    );
    test(
        'FCS1.04a1: GIVEN a FlexColorScheme.light() created object '
        'EXPECT equality when made by matching .light() overrides.', () {
      expect(FlexColorScheme.light(useMaterial3: false), equals(m1e2));
      // Expect toTheme from them to full-fill same condition.
      expect(
        FlexColorScheme.light(useMaterial3: false)
            .toTheme
            .toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
            m1e2.toTheme.toString(minLevel: DiagnosticLevel.fine)),
      );
    });
    final FlexColorScheme m1e22 = FlexColorScheme.light(
      primary: FlexColor.materialLightPrimary,
      primaryContainer: FlexColor.materialLightPrimaryContainer,
      secondary: FlexColor.materialLightSecondary,
      secondaryContainer: FlexColor.materialLightSecondaryContainer,
      tertiary: FlexColor.materialLightTertiary,
      tertiaryContainer: FlexColor.materialLightTertiaryContainer,
      // surface: FlexColor.lightFlexSurface,
      error: FlexColor.materialLightError,
      // scaffoldBackground: FlexColor.lightFlexSurfaceContainerLowest,
      // appBarBackground: FlexColor.lightFlexSurface,
      // dialogBackground: FlexColor.lightFlexSurfaceContainerHigh,
      onPrimary: Colors.white,
      onPrimaryContainer: Colors.black,
      onSecondary: Colors.black,
      onSecondaryContainer: Colors.black,
      onTertiary: Colors.white,
      onTertiaryContainer: Colors.black,
      // onSurface: FlexColor.lightFlexOnSurface,
      onError: Colors.white,
      useMaterial3: false,
    );
    test(
        'FCS1.04a2: GIVEN a FlexColorScheme.light() created object '
        'EXPECT equality when made by matching .light() overrides.', () {
      expect(
          FlexColorScheme.light(
            appBarStyle: FlexAppBarStyle.primary,
            useMaterial3: false,
          ),
          equals(m1e22));
      // Expect toTheme from them to full-fill same condition.
      expect(
        FlexColorScheme.light(useMaterial3: false)
            .toTheme
            .toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
            m1e2.toTheme.toString(minLevel: DiagnosticLevel.fine)),
      );
    });

    test(
        'FCS1.04b: GIVEN a FlexColorScheme.light created object with colors  '
        'EXPECT equality when made by matching .light() overrides.', () {
      expect(
        FlexColorScheme.light(
          colors: FlexColor.material.light,
          useMaterial3: false,
        ),
        equals(m1e2),
      );
      // Expect toTheme from them to full-fill same condition.
      expect(
        FlexColorScheme.light(
          colors: FlexColor.material.light,
          useMaterial3: false,
        ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
            m1e2.toTheme.toString(minLevel: DiagnosticLevel.fine)),
      );
    });

    test(
        'FCS1.04c: GIVEN a FlexColorScheme.light created object with colors '
        'map EXPECT equality when made by matching .light() overrides.', () {
      expect(
        FlexColorScheme.light(
            useMaterial3: false,
            colors: FlexColor.schemes[FlexScheme.material]!.light),
        m1e2,
      );
      // Expect toTheme from them to full-fill same condition.
      expect(
        FlexColorScheme.light(
                useMaterial3: false,
                colors: FlexColor.schemes[FlexScheme.material]!.light)
            .toTheme
            .toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
            m1e2.toTheme.toString(minLevel: DiagnosticLevel.fine)),
      );
    });

    test(
        'FCS1.04d: GIVEN a FlexColorScheme.light created object with colors  '
        'EXPECT equality when made by matching mode .light() overrides.', () {
      expect(
        FlexColorScheme.light(
          useMaterial3: false,
          surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
          blendLevel: 0,
        ),
        equals(m1e2),
      );
      // Expect toTheme from them to full-fill same condition.
      expect(
        FlexColorScheme.light(
          useMaterial3: false,
          surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
          blendLevel: 0,
        ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
            m1e2.toTheme.toString(minLevel: DiagnosticLevel.fine)),
      );
    });

    final FlexColorScheme m1e3 = FlexColorScheme.dark(
      primary: FlexColor.materialDarkPrimary,
      primaryContainer: FlexColor.materialDarkPrimaryContainer,
      primaryLightRef: FlexColor.materialLightPrimary,
      secondary: FlexColor.materialDarkSecondary,
      secondaryContainer: FlexColor.materialDarkSecondaryContainer,
      secondaryLightRef: FlexColor.materialLightSecondary,
      tertiary: FlexColor.materialDarkTertiary,
      tertiaryContainer: FlexColor.materialDarkTertiaryContainer,
      tertiaryLightRef: FlexColor.materialLightTertiary,
      surface: FlexColor.materialDarkSurface,
      error: FlexColor.materialDarkError,
      scaffoldBackground: FlexColor.materialDarkBackground,
      dialogBackground: FlexColor.materialDarkBackground,
      onPrimary: Colors.black,
      onPrimaryContainer: Colors.white,
      onSecondary: Colors.black,
      onTertiary: Colors.black,
      onSecondaryContainer: Colors.white,
      onTertiaryContainer: Colors.white,
      onSurface: Colors.white,
      onError: Colors.black,
      useMaterial3: false,
    );
    test(
        'FCS1.05a: GIVEN a FlexColorScheme.dark created object '
        'EXPECT equality when made by matching .dark() overrides', () {
      expect(
        FlexColorScheme.dark(useMaterial3: false),
        equals(m1e3),
      );
      // Expect toTheme from them to full-fill same condition.
      expect(
        FlexColorScheme.dark(useMaterial3: false)
            .toTheme
            .toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
            m1e3.toTheme.toString(minLevel: DiagnosticLevel.fine)),
      );
    });
    test(
        'FCS1.05b: GIVEN a FlexColorScheme.dark created object with colors '
        'EXPECT equality when made by matching .dark() overrides', () {
      expect(
        FlexColorScheme.dark(
          colors: FlexColor.material.dark,
          useMaterial3: false,
        ),
        equals(m1e3),
      );
      // Expect toTheme from them to full-fill same condition.
      expect(
        FlexColorScheme.dark(
          colors: FlexColor.material.dark,
          useMaterial3: false,
        ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
            m1e3.toTheme.toString(minLevel: DiagnosticLevel.fine)),
      );
    });
    test(
        'FCS1.05cb: GIVEN a FlexColorScheme.dark created object with colors '
        'map EXPECT equality when made by matching .dark() overrides', () {
      expect(
        FlexColorScheme.dark(
          useMaterial3: false,
          colors: FlexColor.schemes[FlexScheme.material]!.dark,
        ),
        m1e3,
      );
      // Expect toTheme from them to full-fill same condition.
      expect(
        FlexColorScheme.dark(
          useMaterial3: false,
          colors: FlexColor.schemes[FlexScheme.material]!.dark,
        ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
            m1e3.toTheme.toString(minLevel: DiagnosticLevel.fine)),
      );
    });

    test(
        'FCS1.05d: GIVEN a FlexColorScheme.dark created object with colors  '
        'EXPECT equality when made by matching .dark() overrides', () {
      expect(
          FlexColorScheme.dark(
            surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
            blendLevel: 0,
            useMaterial3: false,
          ),
          m1e3);
      // Expect toTheme from them to full-fill same condition.
      expect(
        FlexColorScheme.dark(
          surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
          blendLevel: 0,
          useMaterial3: false,
        ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
            m1e3.toTheme.toString(minLevel: DiagnosticLevel.fine)),
      );
    });

    final FlexColorScheme m05a2 = FlexColorScheme.dark(
      primary: FlexColor.materialDarkPrimary,
      primaryContainer: FlexColor.materialDarkPrimaryContainer,
      primaryLightRef: FlexColor.materialLightPrimary,
      secondary: FlexColor.materialDarkSecondary,
      secondaryContainer: FlexColor.materialDarkSecondaryContainer,
      secondaryLightRef: FlexColor.materialLightSecondary,
      tertiary: FlexColor.materialDarkTertiary,
      tertiaryContainer: FlexColor.materialDarkTertiaryContainer,
      tertiaryLightRef: FlexColor.materialLightTertiary,
      surface: FlexColor.materialDarkSurface,
      error: FlexColor.materialDarkError,
      scaffoldBackground: FlexColor.materialDarkBackground,
      appBarBackground: FlexColor.materialDarkSurface,
      dialogBackground: FlexColor.materialDarkBackground,
      onPrimary: Colors.black,
      onPrimaryContainer: Colors.white,
      onSecondary: Colors.black,
      onTertiary: Colors.black,
      onSecondaryContainer: Colors.white,
      onTertiaryContainer: Colors.white,
      onSurface: Colors.white,
      onError: Colors.black,
      useMaterial3: false,
    );
    test(
        'FCS1.05a2: GIVEN a FlexColorScheme.dark created object '
        'EXPECT equality when made by matching .dark(surface) overrides', () {
      expect(
        FlexColorScheme.dark(
          appBarStyle: FlexAppBarStyle.surface,
          useMaterial3: false,
        ),
        equals(m05a2),
      );
      // Expect toTheme from them to full-fill same condition.
      expect(
        FlexColorScheme.dark(
          appBarStyle: FlexAppBarStyle.surface,
          useMaterial3: false,
        ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
            m05a2.toTheme.toString(minLevel: DiagnosticLevel.fine)),
      );
    });

    //**************************************************************************
    // FlexColorScheme unit tests.
    //
    // toString and hashCode.
    //**************************************************************************

    final FlexColorScheme m5 = FlexColorScheme(
      brightness: Brightness.light,
      primary: FlexColor.materialLightPrimary,
      primaryContainer: FlexColor.materialLightPrimaryContainer,
      secondary: FlexColor.materialLightSecondary,
      secondaryContainer: FlexColor.materialLightSecondaryContainer,
      tertiary: FlexColor.materialLightTertiary,
      tertiaryContainer: FlexColor.materialLightTertiaryContainer,
      surface: FlexColor.materialLightSurface,
      error: FlexColor.materialLightError,
      scaffoldBackground: FlexColor.materialLightBackground,
      appBarBackground: FlexColor.materialLightPrimary,
      dialogBackground: FlexColor.materialLightBackground,
      onPrimary: Colors.white,
      onPrimaryContainer: Colors.white,
      onSecondary: Colors.black,
      onSecondaryContainer: Colors.black,
      onTertiary: Colors.white,
      onTertiaryContainer: Colors.black,
      onSurface: Colors.black,
      onError: Colors.white,
      tabBarStyle: FlexTabBarStyle.forAppBar,
      appBarElevation: 1,
      bottomAppBarElevation: 2,
      tooltipsMatchBackground: true,
      transparentStatusBar: false,
      visualDensity: VisualDensity.standard,
      textTheme: const TextTheme(displayLarge: TextStyle(fontSize: 80)),
      primaryTextTheme: const TextTheme(displayLarge: TextStyle(fontSize: 80)),
      fontFamily: 'Roboto',
      platform: TargetPlatform.android,
      typography: Typography.material2018(),
      applyElevationOverlayColor: false,
      subThemesData: const FlexSubThemesData(defaultRadius: 20),
    );

    final FlexColorScheme m5copy = FlexColorScheme(
      brightness: Brightness.light,
      primary: FlexColor.materialLightPrimary,
      primaryContainer: FlexColor.materialLightPrimaryContainer,
      secondary: FlexColor.materialLightSecondary,
      secondaryContainer: FlexColor.materialLightSecondaryContainer,
      tertiary: FlexColor.materialLightTertiary,
      tertiaryContainer: FlexColor.materialLightTertiaryContainer,
      surface: FlexColor.materialLightSurface,
      error: FlexColor.materialLightError,
      scaffoldBackground: FlexColor.materialLightBackground,
      appBarBackground: FlexColor.materialLightPrimary,
      dialogBackground: FlexColor.materialLightBackground,
      onPrimary: Colors.white,
      onPrimaryContainer: Colors.white,
      onSecondary: Colors.black,
      onSecondaryContainer: Colors.black,
      onTertiary: Colors.white,
      onTertiaryContainer: Colors.black,
      onSurface: Colors.black,
      onError: Colors.white,
      tabBarStyle: FlexTabBarStyle.forAppBar,
      appBarElevation: 1,
      bottomAppBarElevation: 2,
      tooltipsMatchBackground: true,
      transparentStatusBar: false,
      visualDensity: VisualDensity.standard,
      textTheme: const TextTheme(displayLarge: TextStyle(fontSize: 80)),
      primaryTextTheme: const TextTheme(displayLarge: TextStyle(fontSize: 80)),
      fontFamily: 'RobotoX', // <- This is different
      platform: TargetPlatform.android,
      typography: Typography.material2018(),
      applyElevationOverlayColor: false,
      subThemesData: const FlexSubThemesData(defaultRadius: 20),
    );
    test(
        'FCS1.06-CopyWith: Test copyWith on complex object '
        'EXPECT equal when fixing un-equal value', () {
      expect(m5, equals(m5copy.copyWith(fontFamily: 'Roboto')));
    });

    test(
        'FCS1.06-b-CopyWith: Test copyWith on complex object '
        'EXPECT equal when fixing un-equal value WITH '
        'fontFamily and package additions', () {
      expect(
        m5.copyWith(
          fontFamilyFallback: <String>['Roboto', 'Arial'],
          package: 'SansSerif',
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          m5copy
              .copyWith(
                fontFamily: 'Roboto',
                fontFamilyFallback: <String>['Roboto', 'Arial'],
                package: 'SansSerif',
              )
              .toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'FCS1.06a: Test toString implemented via debugFillProperties '
        'EXPECT some kind of working data print.', () {
      expect(m5.toString().length, greaterThan(15));
    });
    test(
        'FCS1.06b Test toString implemented via debugFillProperties '
        'EXPECT exact print string.', () {
      expect(m5.toString(), equalsIgnoringHashCodes(
          // ignore: lines_longer_than_80_chars
          'FlexColorScheme#19415(brightness: light, colorScheme: null, primary: Color(alpha: 1.0000, red: 0.3843, green: 0.0000, blue: 0.9333, colorSpace: ColorSpace.sRGB), onPrimary: Color(alpha: 1.0000, red: 1.0000, green: 1.0000, blue: 1.0000, colorSpace: ColorSpace.sRGB), primaryContainer: Color(alpha: 1.0000, red: 0.7333, green: 0.5255, blue: 0.9882, colorSpace: ColorSpace.sRGB), onPrimaryContainer: Color(alpha: 1.0000, red: 1.0000, green: 1.0000, blue: 1.0000, colorSpace: ColorSpace.sRGB), secondary: Color(alpha: 1.0000, red: 0.0118, green: 0.8549, blue: 0.7765, colorSpace: ColorSpace.sRGB), onSecondary: Color(alpha: 1.0000, red: 0.0000, green: 0.0000, blue: 0.0000, colorSpace: ColorSpace.sRGB), secondaryContainer: Color(alpha: 1.0000, red: 0.8078, green: 0.9804, blue: 0.9725, colorSpace: ColorSpace.sRGB), onSecondaryContainer: Color(alpha: 1.0000, red: 0.0000, green: 0.0000, blue: 0.0000, colorSpace: ColorSpace.sRGB), tertiary: Color(alpha: 1.0000, red: 0.0039, green: 0.5294, blue: 0.5255, colorSpace: ColorSpace.sRGB), onTertiary: Color(alpha: 1.0000, red: 1.0000, green: 1.0000, blue: 1.0000, colorSpace: ColorSpace.sRGB), tertiaryContainer: Color(alpha: 1.0000, red: 0.6431, green: 0.9451, blue: 0.9373, colorSpace: ColorSpace.sRGB), onTertiaryContainer: Color(alpha: 1.0000, red: 0.0000, green: 0.0000, blue: 0.0000, colorSpace: ColorSpace.sRGB), error: Color(alpha: 1.0000, red: 0.6902, green: 0.0000, blue: 0.1255, colorSpace: ColorSpace.sRGB), onError: Color(alpha: 1.0000, red: 1.0000, green: 1.0000, blue: 1.0000, colorSpace: ColorSpace.sRGB), errorContainer: null, onErrorContainer: null, surface: Color(alpha: 1.0000, red: 1.0000, green: 1.0000, blue: 1.0000, colorSpace: ColorSpace.sRGB), onSurface: Color(alpha: 1.0000, red: 0.0000, green: 0.0000, blue: 0.0000, colorSpace: ColorSpace.sRGB), scaffoldBackground: Color(alpha: 1.0000, red: 1.0000, green: 1.0000, blue: 1.0000, colorSpace: ColorSpace.sRGB), appBarBackground: Color(alpha: 1.0000, red: 0.3843, green: 0.0000, blue: 0.9333, colorSpace: ColorSpace.sRGB), dialogBackground: Color(alpha: 1.0000, red: 1.0000, green: 1.0000, blue: 1.0000, colorSpace: ColorSpace.sRGB), surfaceTint: null, tabBarStyle: forAppBar, appBarElevation: 1.0, bottomAppBarElevation: 2.0, tooltipsMatchBackground: true, transparentStatusBar: false, visualDensity: VisualDensity#59a0b(h: 0.0, v: 0.0), textTheme: TextTheme#5c655(displayLarge: TextStyle(inherit: true, size: 80.0), displayMedium: null, displaySmall: null, headlineLarge: null, headlineMedium: null, headlineSmall: null, titleLarge: null, titleMedium: null, titleSmall: null, bodyLarge: null, bodyMedium: null, bodySmall: null, labelLarge: null, labelMedium: null, labelSmall: null), primaryTextTheme: TextTheme#5c655(displayLarge: TextStyle(inherit: true, size: 80.0), displayMedium: null, displaySmall: null, headlineLarge: null, headlineMedium: null, headlineSmall: null, titleLarge: null, titleMedium: null, titleSmall: null, bodyLarge: null, bodyMedium: null, bodySmall: null, labelLarge: null, labelMedium: null, labelSmall: null), fontFamily: Roboto, fontFamilyFallback: null, package: null, materialTapTargetSize: null, pageTransitionsTheme: null, platform: android, typography: Typography#bd932(englishLike: TextTheme#91419(displayLarge: TextStyle(debugLabel: englishLike displayLarge 2018, inherit: false, size: 96.0, weight: 300, letterSpacing: -1.5, baseline: alphabetic), displayMedium: TextStyle(debugLabel: englishLike displayMedium 2018, inherit: false, size: 60.0, weight: 300, letterSpacing: -0.5, baseline: alphabetic), displaySmall: TextStyle(debugLabel: englishLike displaySmall 2018, inherit: false, size: 48.0, weight: 400, letterSpacing: 0.0, baseline: alphabetic), headlineLarge: TextStyle(debugLabel: englishLike headlineLarge 2018, inherit: false, size: 40.0, weight: 400, letterSpacing: 0.3, baseline: alphabetic), headlineMedium: TextStyle(debugLabel: englishLike headlineMedium 2018, inherit: false, size: 34.0, weight: 400, letterSpacing: 0.3, baseline: alphabetic), headlineSmall: TextStyle(debugLabel: englishLike headlineSmall 2018, inherit: false, size: 24.0, weight: 400, letterSpacing: 0.0, baseline: alphabetic), titleLarge: TextStyle(debugLabel: englishLike titleLarge 2018, inherit: false, size: 20.0, weight: 500, letterSpacing: 0.1, baseline: alphabetic), titleMedium: TextStyle(debugLabel: englishLike titleMedium 2018, inherit: false, size: 16.0, weight: 400, letterSpacing: 0.1, baseline: alphabetic), titleSmall: TextStyle(debugLabel: englishLike titleSmall 2018, inherit: false, size: 14.0, weight: 500, letterSpacing: 0.1, baseline: alphabetic), bodyLarge: TextStyle(debugLabel: englishLike bodyLarge 2018, inherit: false, size: 16.0, weight: 400, letterSpacing: 0.5, baseline: alphabetic), bodyMedium: TextStyle(debugLabel: englishLike bodyMedium 2018, inherit: false, size: 14.0, weight: 400, letterSpacing: 0.3, baseline: alphabetic), bodySmall: TextStyle(debugLabel: englishLike bodySmall 2018, inherit: false, size: 12.0, weight: 400, letterSpacing: 0.4, baseline: alphabetic), labelLarge: TextStyle(debugLabel: englishLike labelLarge 2018, inherit: false, size: 14.0, weight: 500, letterSpacing: 1.3, baseline: alphabetic), labelMedium: TextStyle(debugLabel: englishLike labelMedium 2018, inherit: false, size: 11.0, weight: 400, letterSpacing: 1.5, baseline: alphabetic), labelSmall: TextStyle(debugLabel: englishLike labelSmall 2018, inherit: false, size: 10.0, weight: 400, letterSpacing: 1.5, baseline: alphabetic)), dense: TextTheme#119d9(displayLarge: TextStyle(debugLabel: dense displayLarge 2018, inherit: false, size: 96.0, weight: 100, baseline: ideographic), displayMedium: TextStyle(debugLabel: dense displayMedium 2018, inherit: false, size: 60.0, weight: 100, baseline: ideographic), displaySmall: TextStyle(debugLabel: dense displaySmall 2018, inherit: false, size: 48.0, weight: 400, baseline: ideographic), headlineLarge: TextStyle(debugLabel: dense headlineLarge 2018, inherit: false, size: 40.0, weight: 400, baseline: ideographic), headlineMedium: TextStyle(debugLabel: dense headlineMedium 2018, inherit: false, size: 34.0, weight: 400, baseline: ideographic), headlineSmall: TextStyle(debugLabel: dense headlineSmall 2018, inherit: false, size: 24.0, weight: 400, baseline: ideographic), titleLarge: TextStyle(debugLabel: dense titleLarge 2018, inherit: false, size: 21.0, weight: 500, baseline: ideographic), titleMedium: TextStyle(debugLabel: dense titleMedium 2018, inherit: false, size: 17.0, weight: 400, baseline: ideographic), titleSmall: TextStyle(debugLabel: dense titleSmall 2018, inherit: false, size: 15.0, weight: 500, baseline: ideographic), bodyLarge: TextStyle(debugLabel: dense bodyLarge 2018, inherit: false, size: 17.0, weight: 400, baseline: ideographic), bodyMedium: TextStyle(debugLabel: dense bodyMedium 2018, inherit: false, size: 15.0, weight: 400, baseline: ideographic), bodySmall: TextStyle(debugLabel: dense bodySmall 2018, inherit: false, size: 13.0, weight: 400, baseline: ideographic), labelLarge: TextStyle(debugLabel: dense labelLarge 2018, inherit: false, size: 15.0, weight: 500, baseline: ideographic), labelMedium: TextStyle(debugLabel: dense labelMedium 2018, inherit: false, size: 12.0, weight: 400, baseline: ideographic), labelSmall: TextStyle(debugLabel: dense labelSmall 2018, inherit: false, size: 11.0, weight: 400, baseline: ideographic)), tall: TextTheme#59be4(displayLarge: TextStyle(debugLabel: tall displayLarge 2018, inherit: false, size: 96.0, weight: 400, baseline: alphabetic), displayMedium: TextStyle(debugLabel: tall displayMedium 2018, inherit: false, size: 60.0, weight: 400, baseline: alphabetic), displaySmall: TextStyle(debugLabel: tall displaySmall 2018, inherit: false, size: 48.0, weight: 400, baseline: alphabetic), headlineLarge: TextStyle(debugLabel: tall headlineLarge 2018, inherit: false, size: 40.0, weight: 400, baseline: alphabetic), headlineMedium: TextStyle(debugLabel: tall headlineMedium 2018, inherit: false, size: 34.0, weight: 400, baseline: alphabetic), headlineSmall: TextStyle(debugLabel: tall headlineSmall 2018, inherit: false, size: 24.0, weight: 400, baseline: alphabetic), titleLarge: TextStyle(debugLabel: tall titleLarge 2018, inherit: false, size: 21.0, weight: 700, baseline: alphabetic), titleMedium: TextStyle(debugLabel: tall titleMedium 2018, inherit: false, size: 17.0, weight: 400, baseline: alphabetic), titleSmall: TextStyle(debugLabel: tall titleSmall 2018, inherit: false, size: 15.0, weight: 500, baseline: alphabetic), bodyLarge: TextStyle(debugLabel: tall bodyLarge 2018, inherit: false, size: 17.0, weight: 700, baseline: alphabetic), bodyMedium: TextStyle(debugLabel: tall bodyMedium 2018, inherit: false, size: 15.0, weight: 400, baseline: alphabetic), bodySmall: TextStyle(debugLabel: tall bodySmall 2018, inherit: false, size: 13.0, weight: 400, baseline: alphabetic), labelLarge: TextStyle(debugLabel: tall labelLarge 2018, inherit: false, size: 15.0, weight: 700, baseline: alphabetic), labelMedium: TextStyle(debugLabel: tall labelMedium 2018, inherit: false, size: 12.0, weight: 400, baseline: alphabetic), labelSmall: TextStyle(debugLabel: tall labelSmall 2018, inherit: false, size: 11.0, weight: 400, baseline: alphabetic))), applyElevationOverlayColor: false, cupertinoOverrideTheme: null, subThemesData: FlexSubThemesData#b7a6a(interactionEffects: false, tintedDisabledControls: false, blendOnLevel : null, blendOnColors: false, adaptiveRemoveElevationTint: null, adaptiveElevationShadowsBack: null, adaptiveAppBarScrollUnderOff: null, adaptiveRadius: null, adaptiveDialogRadius: null, adaptiveInputDecoratorRadius: null, adaptiveSplash: null, splashType: null, splashTypeAdaptive: null, useMaterial3Typography: null, useM2StyleDividerInM3: false, defaultRadius: 20.0, defaultRadiusAdaptive: null, buttonMinSize: null, alignedDropdown: null, buttonPadding: null, thickBorderWidth: null, thinBorderWidth: null, textButtonRadius: null, textButtonSchemeColor: null, textButtonTextStyle: null, filledButtonRadius: null, filledButtonSchemeColor: null, filledButtonTextStyle: null, elevatedButtonRadius: null, elevatedButtonElevation: null, elevatedButtonSchemeColor: null, elevatedButtonSecondarySchemeColor: null, elevatedButtonTextStyle: null, outlinedButtonRadius: null, outlinedButtonSchemeColor: null, outlinedButtonOutlineSchemeColor: null, outlinedButtonBorderWidth: null, outlinedButtonPressedBorderWidth: null, outlinedButtonTextStyle: null, toggleButtonsRadius: null, toggleButtonsSchemeColor: null, toggleButtonsSelectedForegroundSchemeColor: null, toggleButtonsUnselectedSchemeColor: null, toggleButtonsBorderSchemeColor: null, toggleButtonsBorderWidth: null, toggleButtonsTextStyle: null, segmentedButtonRadius: null, segmentedButtonSchemeColor: null, segmentedButtonSelectedForegroundSchemeColor: null, segmentedButtonUnselectedSchemeColor: null, segmentedButtonUnselectedForegroundSchemeColor: null, segmentedButtonBorderSchemeColor: null, segmentedButtonBorderWidth: null, segmentedButtonTextStyle: null, scaffoldBackgroundBaseColor: null, scaffoldBackgroundSchemeColor: null, materialButtonSchemeColor: null, switchSchemeColor: null, switchThumbSchemeColor: null, switchThumbFixedSize: null, switchAdaptiveCupertinoLike: null, checkboxSchemeColor: null, radioSchemeColor: null, unselectedToggleIsColored: false, sliderBaseSchemeColor: null, sliderThumbSchemeColor: null, sliderIndicatorSchemeColor: null, sliderValueTinted: false, sliderValueIndicatorType: null, sliderShowValueIndicator: null, sliderTrackHeight: null, inputDecoratorRadius: null, inputDecoratorRadiusAdaptive: null, inputDecoratorSchemeColor: null, inputDecoratorContentPadding: null, inputDecoratorIsDense: null, inputDecoratorIsFilled: null, inputDecoratorFillColor: null, inputDecoratorBackgroundAlpha: null, inputDecoratorBorderSchemeColor: null, inputDecoratorBorderType: null, inputDecoratorFocusedHasBorder: true, inputDecoratorUnfocusedHasBorder: true, inputDecoratorUnfocusedBorderIsColored: null, inputDecoratorBorderWidth: null, inputDecoratorFocusedBorderWidth: null, inputDecoratorPrefixIconSchemeColor: null, inputDecoratorSuffixIconSchemeColor: null, inputCursorSchemeColor: null, inputSelectionSchemeColor: null, inputSelectionOpacity: null, inputSelectionHandleSchemeColor: null, listTileSelectedSchemeColor: null, listTileIconSchemeColor: null, listTileTextSchemeColor: null, listTileTitleTextStyle: null, listTileSubtitleTextStyle: null, listTileLeadingAndTrailingTextStyle: null, listTileTileSchemeColor: null, listTileSelectedTileSchemeColor: null, listTileContentPadding: null, listTileHorizontalTitleGap: null, listTileMinVerticalPadding: null, listTileStyle: null, listTileTitleAlignment: null, listTileControlAffinity: null, fabRadius: null, fabUseShape: false, fabAlwaysCircular: false, fabSchemeColor: null, fabForegroundSchemeColor: null, fabExtendedTextStyle: null, chipRadius: null, chipBlendColors: null, chipSchemeColor: null, chipSelectedSchemeColor: null, chipSecondarySelectedSchemeColor: null, chipDeleteIconSchemeColor: null, chipLabelStyle: null, chipSecondaryLabelStyle: null, chipFontSize: null, chipSecondaryFontSize: null, chipIconSize: null, chipPadding: null, cardRadius: null, cardElevation: null, popupMenuRadius: null, popupMenuElevation: null, popupMenuSchemeColor: null, popupMenuOpacity: null, dropdownMenuTextStyle: null, menuRadius: null, menuElevation: null, menuSchemeColor: null, menuOpacity: null, menuPadding: null, menuButtonTextStyle: null, menuBarBackgroundSchemeColor: null, menuBarRadius: null, menuBarElevation: null, menuBarShadowColor: null, menuItemBackgroundSchemeColor: null, menuItemForegroundSchemeColor: null, menuIndicatorBackgroundSchemeColor: null, menuIndicatorForegroundSchemeColor: null, menuIndicatorRadius: null, tooltipRadius: null, tooltipWaitDuration: null, tooltipShowDuration: null, tooltipSchemeColor: null, tooltipOpacity: null, searchBarBackgroundSchemeColor: null, searchViewBackgroundSchemeColor: null, searchBarElevation: null, searchViewElevation: null, searchBarRadius: null, searchViewRadius: null, searchUseShape: false, searchViewHeaderHeight: null, searchBarTextStyle: null, searchViewHeaderTextStyle: null, searchBarHintStyle: null, searchViewHeaderHintStyle: null, searchViewDividerColor: null, searchBarShadowColor: null, searchBarTextCapitalization: null, searchBarPadding: null, searchBarConstraints: null, searchViewConstraints: null, useInputDecoratorThemeInDialogs: null, dialogRadius: null, dialogRadiusAdaptive: null, dialogElevation: null, dialogBackgroundSchemeColor: null, dialogTitleTextStyle: null, dialogContentTextStyle: null, datePickerHeaderBackgroundSchemeColor: null, datePickerHeaderForegroundSchemeColor: null, datePickerDialogRadius: null, datePickerDividerSchemeColor: null, datePickerHeaderHeadlineStyle: null, datePickerHeaderHelpStyle: null, datePickerWeekdayStyle: null, datePickerDayStyle: null, datePickerYearStyle: null, datePickerRangePickerHeaderHeadlineStyle: null, datePickerRangePickerHeaderHelpStyle: null, timePickerDialogRadius: null, timePickerElementRadius: null, timePickerDayPeriodTextStyle: null, timePickerDialTextStyle: null, timePickerHelpTextStyle: null, timePickerHourMinuteTextStyle: null, snackBarRadius: null, snackBarElevation: null, snackBarBackgroundSchemeColor: null, snackBarActionSchemeColor: null, snackBarContentTextStyle: null, appBarBackgroundSchemeColor: null, appBarForegroundSchemeColor: null, appBarIconSchemeColor: null, appBarActionsIconSchemeColor: null, appBarCenterTitle: null, appBarScrolledUnderElevation: null, appBarToolbarTextStyle: null, appBarTitleTextStyle: null, bottomAppBarSchemeColor: null, bottomAppBarHeight: null, tabBarItemSchemeColor: null, tabBarUnselectedItemSchemeColor: null, tabBarUnselectedItemOpacity: null, tabBarIndicatorSchemeColor: null, tabBarIndicatorSize: null, tabBarIndicatorWeight: null, tabBarIndicatorTopRadius: null, tabBarDividerColor: null, tabBarTabAlignment: null, tabBarIndicatorAnimation: null, drawerRadius: null, drawerElevation: null, drawerBackgroundSchemeColor: null, drawerWidth: null, drawerIndicatorWidth: null, drawerIndicatorRadius: null, drawerIndicatorSchemeColor: null, drawerIndicatorOpacity: null, drawerSelectedItemSchemeColor: null, drawerUnselectedItemSchemeColor: null, bottomSheetBackgroundColor: null, bottomSheetModalBackgroundColor: null, bottomSheetRadius: null, bottomSheetElevation: null, bottomSheetModalElevation: null, bottomSheetClipBehavior: null, bottomNavigationBarLabelTextStyle: null, bottomNavigationBarSelectedLabelSize: null, bottomNavigationBarUnselectedLabelSize: null, bottomNavigationBarSelectedLabelSchemeColor: null, bottomNavigationBarUnselectedLabelSchemeColor: null, bottomNavigationBarMutedUnselectedLabel: null, bottomNavigationBarSelectedIconSize: null, bottomNavigationBarUnselectedIconSize: null, bottomNavigationBarSelectedIconSchemeColor: null, bottomNavigationBarUnselectedIconSchemeColor: null, bottomNavigationBarMutedUnselectedIcon: null, bottomNavigationBarBackgroundSchemeColor: null, bottomNavigationBarOpacity: null, bottomNavigationBarElevation: null, bottomNavigationBarShowSelectedLabels: true, bottomNavigationBarShowUnselectedLabels: true, bottomNavigationBarType: null, bottomNavigationBarLandscapeLayout: null, navigationBarLabelTextStyle: null, navigationBarSelectedLabelSize: null, navigationBarUnselectedLabelSize: null, navigationBarSelectedLabelSchemeColor: null, navigationBarUnselectedLabelSchemeColor: null, navigationBarMutedUnselectedLabel: null, navigationBarSelectedIconSize: null, navigationBarUnselectedIconSize: null, navigationBarSelectedIconSchemeColor: null, navigationBarUnselectedIconSchemeColor: null, navigationBarMutedUnselectedIcon: null, navigationBarIndicatorSchemeColor: null, navigationBarIndicatorOpacity: null, navigationBarIndicatorRadius: null, navigationBarBackgroundSchemeColor: null, navigationBarOpacity: null, navigationBarElevation: null, navigationBarHeight: null, navigationBarLabelBehavior: null, adaptiveRemoveNavigationBarTint: null, navigationRailLabelTextStyle: null, navigationRailSelectedLabelSize: null, navigationRailUnselectedLabelSize: null, navigationRailSelectedLabelSchemeColor: null, navigationRailUnselectedLabelSchemeColor: null, navigationRailMutedUnselectedLabel: null, navigationRailSelectedIconSize: null, navigationRailUnselectedIconSize: null, navigationRailSelectedIconSchemeColor: null, navigationRailUnselectedIconSchemeColor: null, navigationRailMutedUnselectedIcon: null, navigationRailUseIndicator: null, navigationRailIndicatorSchemeColor: null, navigationRailIndicatorOpacity: null, navigationRailIndicatorRadius: null, navigationRailBackgroundSchemeColor: null, navigationRailOpacity: null, navigationRailElevation: null, navigationRailLabelType: null, navigationRailGroupAlignment: null, navigationRailMinWidth: null, navigationRailMinExtendedWidth: null), useMaterial3: true, extensions: null)'));
    });
    test(
        'FCS1.07a: Test toStringShort implemented via debugFillProperties '
        'EXPECT some kind of working data print.', () {
      expect(m5.toStringShort().length, greaterThan(10));
    });
    test(
        'FCS1.07b: Test toStringShort implemented via debugFillProperties '
        'EXPECT exact print string.', () {
      expect(
          m5.toStringShort(), equalsIgnoringHashCodes('FlexColorScheme#00000'));
    });
    test('FCS1.08a: Test hashCode has value.', () {
      expect(m5.hashCode, isNotNull);
    });
    test('FCS1.08b: Test hashCode copyWith has exact same value.', () {
      expect(m5.hashCode, equals(m5.copyWith().hashCode));
    });
  });

  //****************************************************************************
  // FlexColorScheme.toScheme unit tests.
  //
  // Validate result of "toScheme" property, when compared with ColorScheme made
  // with matching data.
  //****************************************************************************
  group('FCS2: WITH FlexColorScheme.toScheme ', () {
    debugDefaultTargetPlatformOverride = null;

    final ColorScheme lightScheme = ColorScheme(
      brightness: Brightness.light,
      primary: const Color(0xff6200ee),
      onPrimary: const Color(0xffffffff),
      primaryContainer: const Color(0xffbb86fc),
      onPrimaryContainer: const Color(0xff000000),
      secondary: const Color(0xff03dac6),
      onSecondary: const Color(0xff000000),
      secondaryContainer: const Color(0xFFCEFAF8),
      onSecondaryContainer: const Color(0xff000000),
      tertiary: const Color(0xff018786),
      onTertiary: const Color(0xffffffff),
      tertiaryContainer: const Color(0xffa4f1ef),
      onTertiaryContainer: const Color(0xff000000),
      error: const Color(0xffb00020),
      onError: const Color(0xffffffff),
      errorContainer: FlexColor.lightErrorContainer(const Color(0xffb00020)),
      onErrorContainer: const Color(0xff000000),
      surface: const Color(0xffffffff),
      onSurface: const Color(0xff000000),
      onSurfaceVariant: const Color(0xff000000),
      outline: const Color(0xFF919191),
      outlineVariant: const Color(0xFFD1D1D1),
      shadow: const Color(0xff000000),
      scrim: const Color(0xff000000),
      inverseSurface: const Color(0xFF121212),
      inversePrimary: const Color(0xffda99ff),
    );

    final ColorScheme lightFCS = const FlexColorScheme(
      useMaterial3: false,
      brightness: Brightness.light,
      primary: FlexColor.materialLightPrimary,
      primaryContainer: FlexColor.materialLightPrimaryContainer,
      secondary: FlexColor.materialLightSecondary,
      secondaryContainer: FlexColor.materialLightSecondaryContainer,
      tertiary: FlexColor.materialLightTertiary,
      tertiaryContainer: FlexColor.materialLightTertiaryContainer,
    ).toScheme;

    test(
        'FCS2.01colors: GIVEN a Material2 light FlexColorScheme object '
        'EXPECT colors to be equal', () {
      expect(lightFCS.error, isSameColorAs(lightScheme.error));
      expect(lightFCS.onError, isSameColorAs(lightScheme.onError));
      expect(
          lightFCS.errorContainer, isSameColorAs(lightScheme.errorContainer));
      expect(lightFCS.onErrorContainer,
          isSameColorAs(lightScheme.onErrorContainer));
    });

    test(
        'FCS2.01string: GIVEN a Material2 light FlexColorScheme object '
        'EXPECT toScheme to be equal to raw ColorScheme light', () {
      expect(
        lightFCS.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          lightScheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });

    test(
        'FCS2.01: GIVEN a Material2 light FlexColorScheme object '
        'EXPECT toScheme to be equal to raw ColorScheme light', () {
      testColorSchemeEquality(lightFCS, lightScheme);
      expect(
        lightFCS,
        equals(lightScheme),
      );
    });

    const ColorScheme lightSchemeM3 = ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff6200ee),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffbb86fc),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xff03dac6),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffcefaf8),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xff018786),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffa4f1ef),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xFFBA1A1A),
      onError: Color(0xffffffff),
      errorContainer: Color(0xFFFFDAD6),
      onErrorContainer: Color(0xFF410002),
      surface: Color(0xfffcfcfc),
      onSurface: Color(0xff111111),
      onSurfaceVariant: Color(0xff393939),
      outline: Color(0xff919191),
      outlineVariant: Color(0xffd1d1d1),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2a2a2a),
      onInverseSurface: Color(0xfff1f1f1),
      inversePrimary: Color(0xffda99ff),
      surfaceTint: Color(0xff6200ee),
    );

    test(
        'FCS2.01-M3-string: GIVEN a Material2 light FlexColorScheme object '
        'EXPECT toScheme to be equal to raw ColorScheme light', () {
      expect(
        const FlexColorScheme(
          brightness: Brightness.light,
          useMaterial3: true,
          primary: FlexColor.materialLightPrimary,
          primaryContainer: FlexColor.materialLightPrimaryContainer,
          secondary: FlexColor.materialLightSecondary,
          secondaryContainer: FlexColor.materialLightSecondaryContainer,
          tertiary: FlexColor.materialLightTertiary,
          tertiaryContainer: FlexColor.materialLightTertiaryContainer,
          surface: FlexColor.lightFlexSurface,
        ).toScheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          lightSchemeM3.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });

    test(
        'FCS2.01-M3: GIVEN a Material3 light FlexColorScheme object '
        'EXPECT toScheme to be equal to raw ColorScheme light', () {
      expect(
        const FlexColorScheme(
          brightness: Brightness.light,
          useMaterial3: true,
          primary: FlexColor.materialLightPrimary,
          primaryContainer: FlexColor.materialLightPrimaryContainer,
          secondary: FlexColor.materialLightSecondary,
          secondaryContainer: FlexColor.materialLightSecondaryContainer,
          tertiary: FlexColor.materialLightTertiary,
          tertiaryContainer: FlexColor.materialLightTertiaryContainer,
          surface: FlexColor.lightFlexSurface,
          error: FlexColor.material3LightError,
        ).toScheme,
        equals(lightSchemeM3),
      );
    });

    const ColorScheme darkScheme = ColorScheme(
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
      surface: Color(0xff121212),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xFF777777),
      outlineVariant: Color(0xFF414141),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffffffff),
      onInverseSurface: Color(0xFF121212),
      inversePrimary: Color(0xff5a4570),
    );

    test(
        'FCS2.02: GIVEN a Material2 dark FlexColorScheme object '
        'EXPECT toScheme to be equal to raw ColorScheme dark', () {
      testColorSchemeEquality(
        const FlexColorScheme(
          brightness: Brightness.dark,
          useMaterial3: false,
          primary: FlexColor.materialDarkPrimary,
          primaryContainer: FlexColor.materialDarkPrimaryContainer,
          secondary: FlexColor.materialDarkSecondary,
          secondaryContainer: FlexColor.materialDarkSecondaryContainer,
          tertiary: FlexColor.materialDarkTertiary,
          tertiaryContainer: FlexColor.materialDarkTertiaryContainer,
          surface: FlexColor.materialDarkSurface,
          error: FlexColor.materialDarkError,
        ).toScheme,
        darkScheme,
      );
    });
    test(
        'FCS2.03: GIVEN a Material2 Hc light FlexColorScheme object '
        'EXPECT toScheme to be equal to raw ColorScheme highContrastLight', () {
      testColorSchemeEquality(
        const FlexColorScheme(
          brightness: Brightness.light,
          useMaterial3: false,
          primary: FlexColor.materialLightPrimaryHc,
          primaryContainer: FlexColor.materialLightPrimaryContainerHc,
          secondary: FlexColor.materialLightSecondaryHc,
          secondaryContainer: FlexColor.materialLightSecondaryContainerHc,
          tertiary: FlexColor.materialLightTertiaryHc,
          tertiaryContainer: FlexColor.materialLightTertiaryContainerHc,
          surface: FlexColor.materialLightSurface,
          error: FlexColor.materialLightErrorHc,
        ).toScheme,
        const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xff0000ba),
          onPrimary: Colors.white,
          primaryContainer: Color(0xffb6b6ff),
          onPrimaryContainer: Colors.black,
          secondary: Color(0xff66fff9),
          onSecondary: Colors.black,
          secondaryContainer: Color(0xFFC8F9F7),
          tertiary: Color(0xff018786),
          onTertiary: Color(0xffffffff),
          tertiaryContainer: Color(0xFFB3F1F0),
          onTertiaryContainer: Colors.black,
          error: Color(0xff790000),
          onError: Colors.white,
          errorContainer: Color(0xfffcd8df),
          onErrorContainer: Color(0xff000000),
          surface: Colors.white,
          onSurface: Colors.black,
          onSurfaceVariant: Colors.black,
          inverseSurface: Color(0xff121212),
          onInverseSurface: Colors.white,
          inversePrimary: Color(0xff9999ff),
          outline: Color(0xFF919191),
          outlineVariant: Color(0xFFD1D1D1),
          shadow: Colors.black,
          scrim: Colors.black,
        ),
      );
    });
    test(
        'FCS2.04: GIVEN a Material2 Hc dark FlexColorScheme object '
        'EXPECT toScheme to be equal to raw ColorScheme highContrastDark', () {
      testColorSchemeEquality(
        const FlexColorScheme(
          brightness: Brightness.dark,
          useMaterial3: false,
          primary: FlexColor.materialDarkPrimaryHc,
          primaryContainer: FlexColor.materialDarkPrimaryContainerHc,
          secondary: FlexColor.materialDarkSecondaryHc,
          secondaryContainer: FlexColor.materialDarkSecondaryContainerHc,
          tertiary: FlexColor.materialDarkTertiaryHc,
          tertiaryContainer: FlexColor.materialDarkTertiaryContainerHc,
          surface: FlexColor.materialDarkSurface,
          error: FlexColor.materialDarkErrorHc,
          onError: Colors.black,
        ).toScheme,
        const ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xffefb7ff),
          onPrimary: Colors.black,
          primaryContainer: Color(0xff8a61db),
          onPrimaryContainer: Colors.white,
          secondary: Color(0xff66fff9),
          onSecondary: Colors.black,
          secondaryContainer: Color(0xff00504d),
          onSecondaryContainer: Colors.white,
          tertiary: Color(0xff66fff9),
          onTertiary: Colors.black,
          tertiaryContainer: Color(0xff043232),
          onTertiaryContainer: Colors.white,
          error: Color(0xff9b374d),
          onError: Colors.black,
          errorContainer: Color(0xffb1384e),
          onErrorContainer: Colors.white,
          surface: Color(0xff121212),
          onSurface: Colors.white,
          onSurfaceVariant: Colors.white,
          inverseSurface: Colors.white,
          onInverseSurface: Color(0xFF121212),
          inversePrimary: Color(0xff6f5970),
          outline: Color(0xFF777777),
          outlineVariant: Color(0xFF414141),
          shadow: Colors.black,
          scrim: Colors.black,
        ),
      );
    });
  });

  //****************************************************************************
  // FlexColorScheme.comfortablePlatformDensity unit tests.
  //
  // Validate that "comfortablePlatformDensity" function, produces
  // correct visual density selection on each platform.
  //****************************************************************************
  group('FCS3: WITH FlexColorScheme.comfortablePlatformDensity ', () {
    debugDefaultTargetPlatformOverride = null;

    test(
        'FCS3.01: GIVEN TargetPlatform.android '
        'EXPECT VisualDensity.standard', () {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      expect(
        FlexColorScheme.comfortablePlatformDensity,
        equals(VisualDensity.standard),
      );
    });
    test(
        'FCS3.02: GIVEN TargetPlatform.iOS '
        'EXPECT VisualDensity.standard', () {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      expect(
        FlexColorScheme.comfortablePlatformDensity,
        equals(VisualDensity.standard),
      );
    });
    test(
        'FCS3.03: GIVEN TargetPlatform.fuchsia '
        'EXPECT VisualDensity.standard', () {
      debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
      expect(
        FlexColorScheme.comfortablePlatformDensity,
        equals(VisualDensity.standard),
      );
    });
    test(
        'FCS3.04: GIVEN TargetPlatform.linux '
        'EXPECT VisualDensity.comfortable', () {
      debugDefaultTargetPlatformOverride = TargetPlatform.linux;
      expect(
        FlexColorScheme.comfortablePlatformDensity,
        equals(VisualDensity.comfortable),
      );
    });
    test(
        'FCS3.05: GIVEN TargetPlatform.macOS '
        'EXPECT VisualDensity.comfortable', () {
      debugDefaultTargetPlatformOverride = TargetPlatform.macOS;
      expect(
        FlexColorScheme.comfortablePlatformDensity,
        equals(VisualDensity.comfortable),
      );
    });
    test(
        'FCS3.06: GIVEN TargetPlatform.windows '
        'EXPECT VisualDensity.comfortable', () {
      debugDefaultTargetPlatformOverride = TargetPlatform.windows;
      expect(
        FlexColorScheme.comfortablePlatformDensity,
        equals(VisualDensity.comfortable),
      );
      debugDefaultTargetPlatformOverride = null;
    });
    debugDefaultTargetPlatformOverride = null;
  });

  //****************************************************************************
  // FlexColorScheme.createPrimarySwatch unit tests.
  //
  // Validate that "createPrimarySwatch" function, with fixed reference values,
  // expect object function and defined edge case inputs with fallbacks.
  //****************************************************************************
  group('FCS4: WITH FlexColorScheme.createPrimarySwatch ', () {
    const Color col = FlexColor.materialLightPrimary;
    test(
        'FCS4.01: GIVEN color: <null> '
        'EXPECT swatch to be equal to '
        'FlexColorScheme.createPrimarySwatch($col).', () {
      expect(
        FlexColorScheme.createPrimarySwatch(null),
        equals(FlexColorScheme.createPrimarySwatch(col)),
      );
    });
    test(
        'FCS4.02: GIVEN color: $col '
        'EXPECT Color(swatch.value) equal to $col', () {
      expect(
        Color(FlexColorScheme.createPrimarySwatch(col).value32bit),
        equals(col),
      );
    });
    test(
        'FCS4.03: GIVEN color: $col '
        'EXPECT swatch[50] equal to Color(0xffdec9fc)', () {
      expect(
        FlexColorScheme.createPrimarySwatch(col)[50],
        equals(const Color(0xffdec9fc)),
      );
    });
    test(
        'FCS4.04: GIVEN color: $col '
        'EXPECT swatch[100] equal to Color(0xffd0b3fa)', () {
      expect(
        FlexColorScheme.createPrimarySwatch(col)[100],
        equals(const Color(0xffd0b3fa)),
      );
    });
    test(
        'FCS4.05: GIVEN color: $col '
        'EXPECT swatch[200] equal to Color(0xffba90f8)', () {
      expect(
        FlexColorScheme.createPrimarySwatch(col)[200],
        equals(const Color(0xffba90f8)),
      );
    });
    test(
        'FCS4.06: GIVEN color: $col '
        'EXPECT swatch[300] equal to Color(0xff9e63f4)', () {
      expect(
        FlexColorScheme.createPrimarySwatch(col)[300],
        equals(const Color(0xff9e63f4)),
      );
    });
    test(
        'FCS4.07: GIVEN color: $col '
        'EXPECT swatch[400] equal to Color(0xff8436f2)', () {
      expect(
        FlexColorScheme.createPrimarySwatch(col)[400],
        equals(const Color(0xff8436f2)),
      );
    });
    test(
        'FCS4.08: GIVEN color: $col '
        'EXPECT swatch[500] equal to $col', () {
      expect(
        FlexColorScheme.createPrimarySwatch(col)[500],
        equals(col),
      );
    });
    test(
        'FCS4.09: GIVEN color: $col '
        'EXPECT swatch[600] equal to Color(0xff5800d6)', () {
      expect(
        FlexColorScheme.createPrimarySwatch(col)[600],
        equals(const Color(0xff5800d6)),
      );
    });
    test(
        'FCS4.10: GIVEN color: $col '
        'EXPECT swatch[700] equal to Color(0xff4a00b4)', () {
      expect(
        FlexColorScheme.createPrimarySwatch(col)[700],
        equals(const Color(0xff4a00b4)),
      );
    });
    test(
        'FCS4.11: GIVEN color: $col '
        'EXPECT swatch[800] equal to Color(0xff3f0098)', () {
      expect(
        FlexColorScheme.createPrimarySwatch(col)[800],
        equals(const Color(0xff3f0098)),
      );
    });
    test(
        'FCS4.12: GIVEN color: $col '
        'EXPECT swatch[900] equal to Color(0xff33007b)', () {
      expect(
        FlexColorScheme.createPrimarySwatch(col)[900],
        equals(const Color(0xff33007b)),
      );
    });
  });

  //****************************************************************************
  // FlexColorScheme.themedSystemNavigationBar unit tests.
  //
  // Validate that "themedSystemNavigationBar" function, produces expected
  // SystemUiOverlayStyle to be used in an AnnotatedRegion.
  // The test uses null context and run as plain unit tests.
  //****************************************************************************
  group('FCS5: WITH FlexColorScheme.themedSystemNavigationBar ', () {
    debugDefaultTargetPlatformOverride = null;

    test(
        'FCS5.01: GIVEN all default values '
        'EXPECT white system navbar, with NO divider', () {
      expect(
        FlexColorScheme.themedSystemNavigationBar(null),
        equals(
          const SystemUiOverlayStyle(
              systemStatusBarContrastEnforced: false,
              systemNavigationBarColor: Colors.white,
              systemNavigationBarDividerColor: Colors.transparent,
              systemNavigationBarIconBrightness: Brightness.dark,
              systemNavigationBarContrastEnforced: false),
        ),
      );
    });
    test(
        'FCS5.02: GIVEN Brightness.light divider:false '
        'EXPECT white system navbar, with no visible divider', () {
      expect(
        FlexColorScheme.themedSystemNavigationBar(
          null,
          useDivider: false,
        ),
        equals(
          const SystemUiOverlayStyle(
            systemStatusBarContrastEnforced: false,
            systemNavigationBarColor: Colors.white,
            systemNavigationBarDividerColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.dark,
            systemNavigationBarContrastEnforced: false,
          ),
        ),
      );
    });
    test(
        'FCS5.03: GIVEN Brightness.light divider:true + defined color '
        'EXPECT defined colored system navbar, with default divider.', () {
      expect(
        FlexColorScheme.themedSystemNavigationBar(
          null,
          useDivider: true,
          systemNavigationBarColor: const Color(0xFFCCCCCC),
        ),
        equals(
          const SystemUiOverlayStyle(
            systemStatusBarContrastEnforced: false,
            systemNavigationBarColor: Color(0xFFCCCCCC),
            systemNavigationBarDividerColor: Color(0xFFDDDDDD),
            systemNavigationBarIconBrightness: Brightness.dark,
            systemNavigationBarContrastEnforced: false,
          ),
        ),
      );
    });
    test(
        'FCS5.04: GIVEN Brightness.dark divider:true '
        'EXPECT black system navbar, with default divider', () {
      expect(
        FlexColorScheme.themedSystemNavigationBar(
          null,
          useDivider: true,
          nullContextBrightness: Brightness.dark,
        ),
        equals(
          const SystemUiOverlayStyle(
            systemStatusBarContrastEnforced: false,
            systemNavigationBarColor: Colors.black,
            systemNavigationBarDividerColor: Color(0xFF2C2C2C),
            systemNavigationBarIconBrightness: Brightness.light,
            systemNavigationBarContrastEnforced: false,
          ),
        ),
      );
    });
    test(
        'FCS5.05: GIVEN Brightness.dark divider:false '
        'EXPECT black system navbar, with no visible divider', () {
      expect(
        FlexColorScheme.themedSystemNavigationBar(
          null,
          useDivider: false,
          nullContextBrightness: Brightness.dark,
        ),
        equals(
          const SystemUiOverlayStyle(
            systemStatusBarContrastEnforced: false,
            systemNavigationBarColor: Colors.black,
            systemNavigationBarDividerColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.light,
            systemNavigationBarContrastEnforced: false,
          ),
        ),
      );
    });
    test(
        'FCS5.06a: GIVEN Brightness.dark divider:false + defined bg color '
        'EXPECT defined colored system navbar, with no visible divider.', () {
      expect(
        FlexColorScheme.themedSystemNavigationBar(
          null,
          useDivider: false,
          nullContextBrightness: Brightness.dark,
          // Testing that new color works as it should.
          systemNavigationBarColor: const Color(0xFF202020),
        ),
        equals(
          const SystemUiOverlayStyle(
            systemStatusBarContrastEnforced: false,
            systemNavigationBarColor: Color(0xFF202020),
            systemNavigationBarDividerColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.light,
            systemNavigationBarContrastEnforced: false,
          ),
        ),
      );
    });
    test(
        'FCS5.06b: GIVEN Brightness.dark divider:false + defined old bg color '
        'EXPECT defined colored system navbar, with NO divider.', () {
      expect(
        FlexColorScheme.themedSystemNavigationBar(
          null,
          useDivider: false,
          nullContextBrightness: Brightness.dark,
          systemNavigationBarColor: const Color(0xFF202020),
        ),
        equals(
          const SystemUiOverlayStyle(
            systemStatusBarContrastEnforced: false,
            systemNavigationBarColor: Color(0xFF202020),
            systemNavigationBarDividerColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.light,
            systemNavigationBarContrastEnforced: false,
          ),
        ),
      );
    });
    test(
        'FCS5.06c: GIVEN Brightness.dark divider:false + old defined color '
        'EXPECT to be same as when using the new color property.', () {
      expect(
        FlexColorScheme.themedSystemNavigationBar(
          null,
          useDivider: false,
          nullContextBrightness: Brightness.dark,
          systemNavigationBarColor: const Color(0xFF202020),
        ),
        equals(
          FlexColorScheme.themedSystemNavigationBar(
            null,
            useDivider: false,
            nullContextBrightness: Brightness.dark,
            systemNavigationBarColor: const Color(0xFF202020),
          ),
        ),
      );
    });
    test(
        'FCS5.06d: GIVEN Brightness.dark divider:true + defined old color '
        'EXPECT defined colored system navbar, with NO divider.', () {
      expect(
        FlexColorScheme.themedSystemNavigationBar(
          null,
          useDivider: true,
          nullContextBrightness: Brightness.dark,
          systemNavigationBarColor: const Color(0xFF202020),
        ),
        const SystemUiOverlayStyle(
          systemStatusBarContrastEnforced: false,
          systemNavigationBarColor: Color(0xFF202020),
          systemNavigationBarDividerColor: Color(0xFF2C2C2C),
          systemNavigationBarIconBrightness: Brightness.light,
          systemNavigationBarContrastEnforced: false,
        ),
      );
    });
    test(
        'FCS5.06e: GIVEN Brightness.dark divider:false + defined old & new '
        'bg color '
        'EXPECT new color using system navbar, with NO visible divider.', () {
      expect(
        FlexColorScheme.themedSystemNavigationBar(
          null,
          useDivider: false,
          nullContextBrightness: Brightness.dark,
          systemNavigationBarColor: const Color(0xFF4545F3),
        ),
        const SystemUiOverlayStyle(
          systemStatusBarContrastEnforced: false,
          systemNavigationBarColor: Color(0xFF4545F3),
          systemNavigationBarDividerColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.light,
          systemNavigationBarContrastEnforced: false,
        ),
      );
    });
    test(
        'FCS5.07a: GIVEN Brightness.dark divider:false + defined new color '
        '+ opacity > 1 EXPECT defined colored system navbar, with NO visible '
        'divider and NO opacity.', () {
      expect(
        FlexColorScheme.themedSystemNavigationBar(
          null,
          useDivider: false,
          opacity: 100,
          nullContextBrightness: Brightness.dark,
          systemNavigationBarColor: const Color(0xFF202020),
        ),
        const SystemUiOverlayStyle(
          systemStatusBarContrastEnforced: false,
          systemNavigationBarColor: Color(0xFF202020),
          systemNavigationBarDividerColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.light,
          systemNavigationBarContrastEnforced: false,
        ),
      );
    });
    test(
        'FCS5.07b: GIVEN Brightness.dark divider:true + defined new color '
        '+ opacity = 1 EXPECT defined colored system navbar, with divider '
        'and NO opacity.', () {
      expect(
        FlexColorScheme.themedSystemNavigationBar(
          null,
          useDivider: true,
          opacity: 1,
          nullContextBrightness: Brightness.dark,
          systemNavigationBarColor: const Color(0xFF202020),
        ),
        const SystemUiOverlayStyle(
          systemStatusBarContrastEnforced: false,
          systemNavigationBarColor: Color(0xFF202020),
          systemNavigationBarDividerColor: Color(0xFF2C2C2C),
          systemNavigationBarIconBrightness: Brightness.light,
          systemNavigationBarContrastEnforced: false,
        ),
      );
    });
    test(
        'FCS5.07c: GIVEN Brightness.dark divider:true + defined old color '
        '+ opacity = 1 EXPECT defined colored system navbar, with divider '
        'and NO opacity.', () {
      expect(
        FlexColorScheme.themedSystemNavigationBar(
          null,
          useDivider: true,
          opacity: 1,
          nullContextBrightness: Brightness.dark,
          systemNavigationBarColor: const Color(0xFF202020),
        ),
        const SystemUiOverlayStyle(
          systemStatusBarContrastEnforced: false,
          systemNavigationBarColor: Color(0xFF202020),
          systemNavigationBarDividerColor: Color(0xFF2C2C2C),
          systemNavigationBarIconBrightness: Brightness.light,
          systemNavigationBarContrastEnforced: false,
        ),
      );
    });
    test(
        'FCS5.08a: GIVEN Brightness.dark divider:true + defined new color '
        '+ opacity = 0 EXPECT fully transparent defined colored system '
        'navbar and divider .', () {
      expect(
        FlexColorScheme.themedSystemNavigationBar(
          null,
          useDivider: true,
          opacity: 0,
          nullContextBrightness: Brightness.dark,
          systemNavigationBarColor: const Color(0xFF202020),
        ),
        SystemUiOverlayStyle(
          systemStatusBarContrastEnforced: false,
          systemNavigationBarColor:
              const Color(0x00202020).withValues(alpha: 0),
          // Divider has opacity 0.5, when there is opacity on navbar.
          systemNavigationBarDividerColor:
              const Color(0xFF2C2C2C).withValues(alpha: 0.5),
          systemNavigationBarIconBrightness: Brightness.light,
          systemNavigationBarContrastEnforced: false,
        ),
      );
    });
    test(
        'FCS5.08b: GIVEN Brightness.dark divider:true + defined old color '
        '+ opacity = 0.5 EXPECT fully transparent defined colored system '
        'navbar, and divider with opacity 0.5.', () {
      expect(
        FlexColorScheme.themedSystemNavigationBar(
          null,
          useDivider: true,
          opacity: 0.5,
          nullContextBrightness: Brightness.dark,
          systemNavigationBarColor: const Color(0xFF202020),
        ),
        SystemUiOverlayStyle(
          systemStatusBarContrastEnforced: false,
          systemNavigationBarColor:
              const Color(0x00202020).withValues(alpha: 0.5),
          // Divider has opacity 0.5, when there is opacity on navbar.
          systemNavigationBarDividerColor:
              const Color(0xFF2C2C2C).withValues(alpha: 0.5),
          systemNavigationBarIconBrightness: Brightness.light,
          systemNavigationBarContrastEnforced: false,
        ),
      );
    });
    test(
        'FCS5.09: GIVEN Brightness.dark divider:true + defined new color '
        '+ opacity < 0 EXPECT fully transparent defined colored system '
        'navbar and divider .', () {
      expect(
        FlexColorScheme.themedSystemNavigationBar(
          null,
          useDivider: true,
          opacity: -10.1,
          nullContextBrightness: Brightness.dark,
          systemNavigationBarColor: const Color(0xFF202020),
        ),
        SystemUiOverlayStyle(
          systemStatusBarContrastEnforced: false,
          systemNavigationBarColor:
              const Color(0x00202020).withValues(alpha: 0),
          // Divider has opacity 0.5, when there is opacity on navbar.
          systemNavigationBarDividerColor:
              const Color(0xFF2C2C2C).withValues(alpha: 0.5),
          systemNavigationBarIconBrightness: Brightness.light,
          systemNavigationBarContrastEnforced: false,
        ),
      );
    });

    test(
        'FCS5.10: GIVEN Brightness.dark divider:true noAppBar: true '
        'EXPECT black system navbar, with divider and transparent status bar '
        'and normal white status icons.', () {
      expect(
        FlexColorScheme.themedSystemNavigationBar(
          null,
          noAppBar: true,
          useDivider: true,
          nullContextBrightness: Brightness.dark,
        ),
        const SystemUiOverlayStyle(
          systemStatusBarContrastEnforced: false,
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.black,
          systemNavigationBarDividerColor: Color(0xFF2C2C2C),
          systemNavigationBarIconBrightness: Brightness.light,
          systemNavigationBarContrastEnforced: false,
        ),
      );
    });

    test(
        'FCS5.11: GIVEN Brightness.dark divider:true noAppBar: true and '
        'invertStatusIcons: true '
        'EXPECT black system navbar, with divider and transparent status bar '
        'and black (invisible) system icons.', () {
      expect(
        FlexColorScheme.themedSystemNavigationBar(
          null,
          noAppBar: true,
          invertStatusIcons: true,
          useDivider: true,
          nullContextBrightness: Brightness.dark,
        ),
        const SystemUiOverlayStyle(
          systemStatusBarContrastEnforced: false,
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.black,
          systemNavigationBarDividerColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.dark,
          systemNavigationBarContrastEnforced: false,
        ),
      );
    });

    test(
        'FCS5.12: GIVEN Brightness.light divider:false noAppBar: true '
        'EXPECT white system navbar, with no divider and transparent '
        'status bar and normal black status icons.', () {
      expect(
        FlexColorScheme.themedSystemNavigationBar(
          null,
          noAppBar: true,
          useDivider: false,
          nullContextBrightness: Brightness.light,
        ),
        const SystemUiOverlayStyle(
          systemStatusBarContrastEnforced: false,
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarDividerColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.dark,
          systemNavigationBarContrastEnforced: false,
        ),
      );
    });

    test(
        'FCS5.13: GIVEN Brightness.dark divider:false noAppBar: true and '
        'invertStatusIcons: true '
        'EXPECT white system navbar, with divider and transparent status bar '
        'and white (invisible) status icons.', () {
      expect(
        FlexColorScheme.themedSystemNavigationBar(
          null,
          noAppBar: true,
          invertStatusIcons: true,
          useDivider: false,
          nullContextBrightness: Brightness.light,
        ),
        const SystemUiOverlayStyle(
          systemStatusBarContrastEnforced: false,
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarDividerColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.light,
          systemNavigationBarContrastEnforced: false,
        ),
      );
    });

    test(
        'FCS5.14: GIVEN Brightness.light divider:false, '
        'systemNavigationBarDividerColor: blue, '
        'systemNavigationBarColor: red, '
        'noAppBar: true '
        'EXPECT red system navbar, with no divider and transparent '
        'status bar and normal black status icons.', () {
      expect(
        FlexColorScheme.themedSystemNavigationBar(
          null,
          noAppBar: true,
          useDivider: false,
          systemNavigationBarDividerColor: const Color(0xFF2196F3),
          systemNavigationBarColor: const Color(0xFFF44336),
          nullContextBrightness: Brightness.light,
        ),
        const SystemUiOverlayStyle(
          systemStatusBarContrastEnforced: false,
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Color(0xFFF44336),
          systemNavigationBarDividerColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.dark,
          systemNavigationBarContrastEnforced: false,
        ),
      );
    });

    test(
        'FCS5.15: GIVEN Brightness.light divider:true, '
        'systemNavigationBarDividerColor: blue, '
        'systemNavigationBarColor: red, '
        'noAppBar: true '
        'opacity: 0.5 '
        'EXPECT red system navbar, with blue divider both with opacity 0.5 '
        'status bar and normal dark status icons.', () {
      expect(
        FlexColorScheme.themedSystemNavigationBar(
          null,
          noAppBar: true,
          useDivider: true,
          opacity: 0.5,
          systemNavigationBarDividerColor: const Color(0xFF2196F3),
          systemNavigationBarColor: const Color(0xFFF44336),
          nullContextBrightness: Brightness.light,
        ),
        SystemUiOverlayStyle(
          systemStatusBarContrastEnforced: false,
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor:
              const Color(0xFFF44336).withValues(alpha: 0.5),
          // Divider has opacity 0.5, when there is opacity on navbar.
          systemNavigationBarDividerColor:
              const Color(0xFF2196F3).withValues(alpha: 0.5),
          systemNavigationBarIconBrightness: Brightness.dark,
          systemNavigationBarContrastEnforced: false,
        ),
      );
    });

    test(
        'FCS5.16: GIVEN Brightness.light divider:true, '
        'systemNavigationBarDividerColor: blue, '
        'systemNavigationBarColor: red, '
        'noAppBar: true '
        'EXPECT red system navbar, with blue divider and transparent '
        'status bar and normal black status icons.', () {
      expect(
        FlexColorScheme.themedSystemNavigationBar(
          null,
          noAppBar: true,
          useDivider: true,
          systemNavigationBarDividerColor: const Color(0xFF2196F3),
          systemNavigationBarColor: const Color(0xFFF44336),
          nullContextBrightness: Brightness.light,
        ),
        const SystemUiOverlayStyle(
          systemStatusBarContrastEnforced: false,
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarDividerColor: Color(0xFF2196F3),
          systemNavigationBarColor: Color(0xFFF44336),
          systemNavigationBarIconBrightness: Brightness.dark,
          systemNavigationBarContrastEnforced: false,
        ),
      );
    });
  });
  //****************************************************************************
  // FlexColorScheme.themedSystemNavigationBar used in a Widget tests.
  //
  // Validate that "themedSystemNavigationBar" function, produces expected
  // SystemUiOverlayStyle to be used in an AnnotatedRegion, when it is used
  // as a Widget, with a BuildContext and a Theme present.
  //****************************************************************************
  group('FCS6: WITH FlexColorScheme.themedSystemNavigationBar ', () {
    debugDefaultTargetPlatformOverride = null;

    testWidgets(
        'FCS6.01La: GIVEN A light theme with defined background colors AND '
        'themedSystemNavigationBar WITH '
        'systemNavBarStyle: FlexSystemNavBarStyle.system '
        'EXPECT white system navbar, with NO divider.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.light(
              surface: Color(0xFFBBDEFB),
            ),
          ).copyWith(
            scaffoldBackgroundColor: const Color(0xFFE3F2FD),
          ),
          child: Builder(
            builder: (BuildContext context) {
              expect(
                FlexColorScheme.themedSystemNavigationBar(
                  context,
                  systemNavBarStyle: FlexSystemNavBarStyle.system,
                ),
                const SystemUiOverlayStyle(
                  systemStatusBarContrastEnforced: false,
                  systemNavigationBarColor: Colors.white,
                  systemNavigationBarIconBrightness: Brightness.dark,
                  systemNavigationBarDividerColor: Colors.transparent,
                  systemNavigationBarContrastEnforced: false,
                ),
              );
              // The builder function must return a widget.
              return const Placeholder();
            },
          ),
        ),
      );
    });

    testWidgets(
        'FCS6.01Lb: GIVEN A light theme with defined background colors AND '
        'themedSystemNavigationBar WITH useDivider:false '
        'systemNavBarStyle: FlexSystemNavBarStyle.system divider:false '
        'EXPECT white system navbar, with no visible divider.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.light(
              surface: Color(0xFFBBDEFB),
            ),
          ).copyWith(
            scaffoldBackgroundColor: const Color(0xFFE3F2FD),
          ),
          child: Builder(
            builder: (BuildContext context) {
              expect(
                FlexColorScheme.themedSystemNavigationBar(
                  context,
                  systemNavBarStyle: FlexSystemNavBarStyle.system,
                  useDivider: false,
                ),
                const SystemUiOverlayStyle(
                  systemStatusBarContrastEnforced: false,
                  systemNavigationBarColor: Colors.white,
                  systemNavigationBarDividerColor: Colors.transparent,
                  systemNavigationBarIconBrightness: Brightness.dark,
                  systemNavigationBarContrastEnforced: false,
                ),
              );
              // The builder function must return a widget.
              return const Placeholder();
            },
          ),
        ),
      );
    });

    testWidgets(
        'FCS6.02La: GIVEN A light theme with defined background colors AND '
        'themedSystemNavigationBar WITH '
        'systemNavBarStyle: FlexSystemNavBarStyle.scaffoldBackground '
        'EXPECT scaffoldBackground system navbar, with NO divider.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.light(
              surface: Color(0xFFBBDEFB),
            ),
          ).copyWith(
            scaffoldBackgroundColor: const Color(0xFFE3F2FD),
          ),
          child: Builder(
            builder: (BuildContext context) {
              expect(
                FlexColorScheme.themedSystemNavigationBar(
                  context,
                  systemNavBarStyle: FlexSystemNavBarStyle.scaffoldBackground,
                ),
                SystemUiOverlayStyle(
                  systemStatusBarContrastEnforced: false,
                  systemNavigationBarColor:
                      Theme.of(context).scaffoldBackgroundColor,
                  systemNavigationBarIconBrightness: Brightness.dark,
                  systemNavigationBarDividerColor: Colors.transparent,
                  systemNavigationBarContrastEnforced: false,
                ),
              );
              // The builder function must return a widget.
              return const Placeholder();
            },
          ),
        ),
      );
    });

    testWidgets(
        'FCS6.02Lb: GIVEN A light theme with defined background colors AND '
        'themedSystemNavigationBar WITH useDivider:false '
        'systemNavBarStyle: FlexSystemNavBarStyle.scaffoldBackground '
        'EXPECT scaffoldBackground system navbar, with no visible divider.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.light(
              surface: Color(0xFFBBDEFB),
            ),
          ).copyWith(
            scaffoldBackgroundColor: const Color(0xFFE3F2FD),
          ),
          child: Builder(
            builder: (BuildContext context) {
              expect(
                FlexColorScheme.themedSystemNavigationBar(
                  context,
                  systemNavBarStyle: FlexSystemNavBarStyle.scaffoldBackground,
                  useDivider: false,
                ),
                SystemUiOverlayStyle(
                  systemStatusBarContrastEnforced: false,
                  systemNavigationBarColor:
                      Theme.of(context).scaffoldBackgroundColor,
                  systemNavigationBarDividerColor: Colors.transparent,
                  systemNavigationBarIconBrightness: Brightness.dark,
                  systemNavigationBarContrastEnforced: false,
                ),
              );
              // The builder function must return a widget.
              return const Placeholder();
            },
          ),
        ),
      );
    });

    testWidgets(
        'FCS6.03La: GIVEN A light theme with defined background colors AND '
        'themedSystemNavigationBar WITH '
        'systemNavBarStyle: FlexSystemNavBarStyle.surface '
        'EXPECT surface colored system navbar, with NO divider.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.light(
              surface: Color(0xFFBBDEFB),
            ),
          ).copyWith(
            scaffoldBackgroundColor: const Color(0xFFE3F2FD),
          ),
          child: Builder(
            builder: (BuildContext context) {
              expect(
                FlexColorScheme.themedSystemNavigationBar(
                  context,
                  systemNavBarStyle: FlexSystemNavBarStyle.surface,
                ),
                SystemUiOverlayStyle(
                  systemStatusBarContrastEnforced: false,
                  systemNavigationBarColor:
                      Theme.of(context).colorScheme.surface,
                  systemNavigationBarDividerColor: Colors.transparent,
                  systemNavigationBarIconBrightness: Brightness.dark,
                  systemNavigationBarContrastEnforced: false,
                ),
              );
              // The builder function must return a widget.
              return const Placeholder();
            },
          ),
        ),
      );
    });

    testWidgets(
        'FCS6.03Lb: GIVEN A light theme with defined background colors AND '
        'themedSystemNavigationBar WITH useDivider:false '
        'systemNavBarStyle: FlexSystemNavBarStyle.surface '
        'EXPECT surface colored system navbar, with no visible divider.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.light(
              surface: Color(0xFFBBDEFB),
            ),
          ).copyWith(
            scaffoldBackgroundColor: const Color(0xFFE3F2FD),
          ),
          child: Builder(
            builder: (BuildContext context) {
              expect(
                FlexColorScheme.themedSystemNavigationBar(
                  context,
                  systemNavBarStyle: FlexSystemNavBarStyle.surface,
                  useDivider: false,
                ),
                SystemUiOverlayStyle(
                  systemStatusBarContrastEnforced: false,
                  systemNavigationBarColor:
                      Theme.of(context).colorScheme.surface,
                  systemNavigationBarDividerColor: Colors.transparent,
                  systemNavigationBarIconBrightness: Brightness.dark,
                  systemNavigationBarContrastEnforced: false,
                ),
              );
              // The builder function must return a widget.
              return const Placeholder();
            },
          ),
        ),
      );
    });

    testWidgets(
        'FCS6.04La: GIVEN A light theme with defined background colors AND '
        'themedSystemNavigationBar WITH '
        'systemNavBarStyle: FlexSystemNavBarStyle.background '
        'EXPECT background colored system navbar, with NO divider.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.light(
              surface: Color(0xFFBBDEFB),
            ),
          ).copyWith(
            scaffoldBackgroundColor: const Color(0xFFE3F2FD),
          ),
          child: Builder(
            builder: (BuildContext context) {
              expect(
                FlexColorScheme.themedSystemNavigationBar(
                  context,
                  systemNavBarStyle: FlexSystemNavBarStyle.background,
                ),
                SystemUiOverlayStyle(
                  systemStatusBarContrastEnforced: false,
                  systemNavigationBarColor:
                      Theme.of(context).colorScheme.surface,
                  systemNavigationBarDividerColor: Colors.transparent,
                  systemNavigationBarIconBrightness: Brightness.dark,
                  systemNavigationBarContrastEnforced: false,
                ),
              );
              // The builder function must return a widget.
              return const Placeholder();
            },
          ),
        ),
      );
    });

    testWidgets(
        'FCS6.04Lb: GIVEN A light theme with defined background colors AND '
        'themedSystemNavigationBar WITH useDivider:false '
        'systemNavBarStyle: FlexSystemNavBarStyle.background '
        'EXPECT background colored system navbar, with no visible divider.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.light(
              surface: Color(0xFFBBDEFB),
            ),
          ).copyWith(
            scaffoldBackgroundColor: const Color(0xFFE3F2FD),
          ),
          child: Builder(
            builder: (BuildContext context) {
              expect(
                FlexColorScheme.themedSystemNavigationBar(
                  context,
                  systemNavBarStyle: FlexSystemNavBarStyle.background,
                  useDivider: false,
                ),
                SystemUiOverlayStyle(
                  systemStatusBarContrastEnforced: false,
                  systemNavigationBarColor:
                      Theme.of(context).colorScheme.surface,
                  systemNavigationBarDividerColor: Colors.transparent,
                  systemNavigationBarIconBrightness: Brightness.dark,
                  systemNavigationBarContrastEnforced: false,
                ),
              );
              // The builder function must return a widget.
              return const Placeholder();
            },
          ),
        ),
      );
    });

    testWidgets(
        'FCS6.05L: GIVEN A light theme with defined background colors AND '
        'themedSystemNavigationBar WITH divider and '
        'systemNavBarStyle: FlexSystemNavBarStyle.surface '
        'EXPECT surface colored system navbar, with divider.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.light(
              surface: Color(0xFFBBDEFB),
            ),
          ).copyWith(
            scaffoldBackgroundColor: const Color(0xFFE3F2FD),
          ),
          child: Builder(
            builder: (BuildContext context) {
              expect(
                FlexColorScheme.themedSystemNavigationBar(
                  context,
                  systemNavBarStyle: FlexSystemNavBarStyle.surface,
                  useDivider: true,
                ),
                SystemUiOverlayStyle(
                  systemStatusBarContrastEnforced: false,
                  systemNavigationBarColor:
                      Theme.of(context).colorScheme.surface,
                  systemNavigationBarDividerColor: const Color(0xFFDDDDDD),
                  systemNavigationBarIconBrightness: Brightness.dark,
                  systemNavigationBarContrastEnforced: false,
                ),
              );
              // The builder function must return a widget.
              return const Placeholder();
            },
          ),
        ),
      );
    });

    testWidgets(
        'FCS6.06L: GIVEN A light theme with defined background colors AND '
        'themedSystemNavigationBar WITH divider and opacity 0.5 and '
        'systemNavBarStyle: FlexSystemNavBarStyle.surface '
        'EXPECT surface colored system navbar with 0.5 opacity , with divider.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.light(
              surface: Color(0xFFBBDEFB),
            ),
          ).copyWith(
            scaffoldBackgroundColor: const Color(0xFFE3F2FD),
          ),
          child: Builder(
            builder: (BuildContext context) {
              expect(
                FlexColorScheme.themedSystemNavigationBar(
                  context,
                  systemNavBarStyle: FlexSystemNavBarStyle.surface,
                  useDivider: true,
                  opacity: 0.5,
                ),
                SystemUiOverlayStyle(
                  systemStatusBarContrastEnforced: false,
                  systemNavigationBarColor: Theme.of(context)
                      .colorScheme
                      .surface
                      .withValues(alpha: 0.5),
                  // Divider has opacity 0.5, when there is opacity on navbar.
                  systemNavigationBarDividerColor:
                      const Color(0xFFDDDDDD).withValues(alpha: 0.5),
                  systemNavigationBarIconBrightness: Brightness.dark,
                  systemNavigationBarContrastEnforced: false,
                ),
              );
              // The builder function must return a widget.
              return const Placeholder();
            },
          ),
        ),
      );
    });

    testWidgets(
        'FCS6.07L: GIVEN A light theme with defined background colors AND '
        'themedSystemNavigationBar WITH NO divider and opacity 0.5 and '
        'systemNavBarStyle: FlexSystemNavBarStyle.surface '
        'EXPECT surface colored system navbar with 0.5 opacity, with no '
        'visible divider.', (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.light(
              surface: Color(0xFFBBDEFB),
            ),
          ).copyWith(
            scaffoldBackgroundColor: const Color(0xFFE3F2FD),
          ),
          child: Builder(
            builder: (BuildContext context) {
              expect(
                FlexColorScheme.themedSystemNavigationBar(
                  context,
                  systemNavBarStyle: FlexSystemNavBarStyle.surface,
                  useDivider: false,
                  opacity: 0.5,
                ),
                SystemUiOverlayStyle(
                  systemStatusBarContrastEnforced: false,
                  systemNavigationBarColor: Theme.of(context)
                      .colorScheme
                      .surface
                      .withValues(alpha: 0.5),
                  systemNavigationBarDividerColor: Colors.transparent,
                  systemNavigationBarIconBrightness: Brightness.dark,
                  systemNavigationBarContrastEnforced: false,
                ),
              );
              // The builder function must return a widget.
              return const Placeholder();
            },
          ),
        ),
      );
    });

    testWidgets(
        'FCS6.08L: GIVEN A light theme with defined background colors AND '
        'themedSystemNavigationBar WITH NO divider and '
        'systemNavBarStyle: FlexSystemNavBarStyle.transparent and opacity:0.5 '
        'EXPECT scaffoldBackground colored system navbar with 0.01 opacity, '
        'with no visible divider.', (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.light(
              surface: Color(0xFFBBDEFB),
            ),
          ).copyWith(
            scaffoldBackgroundColor: const Color(0xFFE3F2FD),
          ),
          child: Builder(
            builder: (BuildContext context) {
              expect(
                FlexColorScheme.themedSystemNavigationBar(
                  context,
                  systemNavBarStyle: FlexSystemNavBarStyle.transparent,
                  useDivider: false,
                  opacity: 0.5,
                ),
                SystemUiOverlayStyle(
                  systemStatusBarContrastEnforced: false,
                  systemNavigationBarColor: Theme.of(context)
                      .scaffoldBackgroundColor
                      .withValues(alpha: 0.0),
                  systemNavigationBarDividerColor: Colors.transparent,
                  systemNavigationBarIconBrightness: Brightness.dark,
                  systemNavigationBarContrastEnforced: false,
                ),
              );
              // The builder function must return a widget.
              return const Placeholder();
            },
          ),
        ),
      );
    });

    testWidgets(
        'FCS6.09L: GIVEN A light theme with defined background colors AND '
        'themedSystemNavigationBar WITH NO divider and '
        'systemNavBarStyle: FlexSystemNavBarStyle.navigationBar '
        'EXPECT navigationBarTheme.backgroundColor colored system navbar, '
        'with no visible divider.', (WidgetTester tester) async {
      const Color seedColor = Color(0xFF1577C7);
      const Color navBarColor = Color(0xFFA7C2D5);

      await tester.pumpWidget(
        Theme(
          data: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: seedColor,
            ),
            scaffoldBackgroundColor: const Color(0xFFE3F2FD),
            navigationBarTheme: const NavigationBarThemeData(
              backgroundColor: navBarColor,
            ),
          ),
          child: Builder(
            builder: (BuildContext context) {
              expect(
                FlexColorScheme.themedSystemNavigationBar(
                  context,
                  systemNavBarStyle: FlexSystemNavBarStyle.navigationBar,
                  useDivider: false,
                ),
                SystemUiOverlayStyle(
                  systemStatusBarContrastEnforced: false,
                  systemNavigationBarColor:
                      Theme.of(context).navigationBarTheme.backgroundColor,
                  systemNavigationBarDividerColor: Colors.transparent,
                  systemNavigationBarIconBrightness: Brightness.dark,
                  systemNavigationBarContrastEnforced: false,
                ),
              );
              // The builder function must return a widget.
              return const Placeholder();
            },
          ),
        ),
      );
    });

    testWidgets(
        'FCS6.10L: GIVEN A LIGHT theme with defined background colors AND '
        'un-themedSystemNavigationBar WITH NO divider and '
        'systemNavBarStyle: FlexSystemNavBarStyle.navigationBar '
        'EXPECT colorScheme.surfaceContainer colored system navbar, '
        'with no visible divider.', (WidgetTester tester) async {
      const Color seedColor = Color(0xFF1577C7);

      await tester.pumpWidget(
        Theme(
          data: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              brightness: Brightness.light,
              seedColor: seedColor,
            ),
            scaffoldBackgroundColor: const Color(0xFF050C0E),
          ),
          child: Builder(
            builder: (BuildContext context) {
              expect(
                FlexColorScheme.themedSystemNavigationBar(
                  context,
                  systemNavBarStyle: FlexSystemNavBarStyle.navigationBar,
                  useDivider: false,
                ),
                SystemUiOverlayStyle(
                  systemStatusBarContrastEnforced: false,
                  systemNavigationBarColor:
                      Theme.of(context).colorScheme.surfaceContainer,
                  systemNavigationBarDividerColor: Colors.transparent,
                  systemNavigationBarIconBrightness: Brightness.dark,
                  systemNavigationBarContrastEnforced: false,
                ),
              );
              // The builder function must return a widget.
              return const Placeholder();
            },
          ),
        ),
      );
    });

    // Tests for dark mode

    testWidgets(
        'FCS6.01Da: GIVEN A dark theme with defined background colors AND '
        'themedSystemNavigationBar WITH '
        'systemNavBarStyle: FlexSystemNavBarStyle.system '
        'EXPECT black system navbar, with NO divider.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.dark(
              surface: Color(0xFF424242),
            ),
          ).copyWith(
            scaffoldBackgroundColor: const Color(0xFF212121),
          ),
          child: Builder(
            builder: (BuildContext context) {
              expect(
                FlexColorScheme.themedSystemNavigationBar(
                  context,
                  systemNavBarStyle: FlexSystemNavBarStyle.system,
                ),
                const SystemUiOverlayStyle(
                  systemStatusBarContrastEnforced: false,
                  systemNavigationBarColor: Colors.black,
                  systemNavigationBarDividerColor: Colors.transparent,
                  systemNavigationBarIconBrightness: Brightness.light,
                  systemNavigationBarContrastEnforced: false,
                ),
              );
              // The builder function must return a widget.
              return const Placeholder();
            },
          ),
        ),
      );
    });

    testWidgets(
        'FCS6.01Db: GIVEN A dark theme with defined background colors AND '
        'themedSystemNavigationBar WITH useDivider: false '
        'systemNavBarStyle: FlexSystemNavBarStyle.system '
        'EXPECT black system navbar, with no visible divider.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.dark(
              surface: Color(0xFF424242),
            ),
          ).copyWith(
            scaffoldBackgroundColor: const Color(0xFF212121),
          ),
          child: Builder(
            builder: (BuildContext context) {
              expect(
                FlexColorScheme.themedSystemNavigationBar(
                  context,
                  systemNavBarStyle: FlexSystemNavBarStyle.system,
                  useDivider: false,
                ),
                const SystemUiOverlayStyle(
                  systemStatusBarContrastEnforced: false,
                  systemNavigationBarColor: Colors.black,
                  systemNavigationBarDividerColor: Colors.transparent,
                  systemNavigationBarIconBrightness: Brightness.light,
                  systemNavigationBarContrastEnforced: false,
                ),
              );
              // The builder function must return a widget.
              return const Placeholder();
            },
          ),
        ),
      );
    });

    testWidgets(
        'FCS6.02Da: GIVEN A dark theme with defined background colors AND '
        'themedSystemNavigationBar WITH '
        'systemNavBarStyle: FlexSystemNavBarStyle.scaffoldBackground '
        'EXPECT scaffoldBackground system navbar, with NO divider.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.dark(
              surface: Color(0xFF424242),
            ),
          ).copyWith(
            scaffoldBackgroundColor: const Color(0xFF212121),
          ),
          child: Builder(
            builder: (BuildContext context) {
              expect(
                FlexColorScheme.themedSystemNavigationBar(
                  context,
                  systemNavBarStyle: FlexSystemNavBarStyle.scaffoldBackground,
                ),
                SystemUiOverlayStyle(
                  systemStatusBarContrastEnforced: false,
                  systemNavigationBarColor:
                      Theme.of(context).scaffoldBackgroundColor,
                  systemNavigationBarDividerColor: Colors.transparent,
                  systemNavigationBarIconBrightness: Brightness.light,
                  systemNavigationBarContrastEnforced: false,
                ),
              );
              // The builder function must return a widget.
              return const Placeholder();
            },
          ),
        ),
      );
    });

    testWidgets(
        'FCS6.02Db: GIVEN A dark theme with defined background colors AND '
        'themedSystemNavigationBar WITH useDivider: false '
        'systemNavBarStyle: FlexSystemNavBarStyle.scaffoldBackground '
        'EXPECT scaffoldBackground system navbar, with no visible divider.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.dark(
              surface: Color(0xFF424242),
            ),
          ).copyWith(
            scaffoldBackgroundColor: const Color(0xFF212121),
          ),
          child: Builder(
            builder: (BuildContext context) {
              expect(
                FlexColorScheme.themedSystemNavigationBar(
                  context,
                  systemNavBarStyle: FlexSystemNavBarStyle.scaffoldBackground,
                  useDivider: false,
                ),
                SystemUiOverlayStyle(
                  systemStatusBarContrastEnforced: false,
                  systemNavigationBarColor:
                      Theme.of(context).scaffoldBackgroundColor,
                  systemNavigationBarDividerColor: Colors.transparent,
                  systemNavigationBarIconBrightness: Brightness.light,
                  systemNavigationBarContrastEnforced: false,
                ),
              );
              // The builder function must return a widget.
              return const Placeholder();
            },
          ),
        ),
      );
    });

    testWidgets(
        'FCS6.03Da: GIVEN A dark theme with defined background colors AND '
        'themedSystemNavigationBar WITH '
        'systemNavBarStyle: FlexSystemNavBarStyle.surface '
        'EXPECT surface colored system navbar, with NO divider.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.dark(
              // background: Color(0xFF303030),
              surface: Color(0xFF424242),
            ),
          ).copyWith(
            scaffoldBackgroundColor: const Color(0xFF212121),
          ),
          child: Builder(
            builder: (BuildContext context) {
              expect(
                FlexColorScheme.themedSystemNavigationBar(
                  context,
                  systemNavBarStyle: FlexSystemNavBarStyle.surface,
                ),
                SystemUiOverlayStyle(
                  systemStatusBarContrastEnforced: false,
                  systemNavigationBarColor:
                      Theme.of(context).colorScheme.surface,
                  systemNavigationBarDividerColor: Colors.transparent,
                  systemNavigationBarIconBrightness: Brightness.light,
                  systemNavigationBarContrastEnforced: false,
                ),
              );
              // The builder function must return a widget.
              return const Placeholder();
            },
          ),
        ),
      );
    });

    testWidgets(
        'FCS6.03Db: GIVEN A dark theme with defined background colors AND '
        'themedSystemNavigationBar WITH '
        'systemNavBarStyle: FlexSystemNavBarStyle.surface '
        'EXPECT surface colored system navbar, with no visible divider.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.dark(
              // background: Color(0xFF303030),
              surface: Color(0xFF424242),
            ),
          ).copyWith(
            scaffoldBackgroundColor: const Color(0xFF212121),
          ),
          child: Builder(
            builder: (BuildContext context) {
              expect(
                FlexColorScheme.themedSystemNavigationBar(
                  context,
                  systemNavBarStyle: FlexSystemNavBarStyle.surface,
                  useDivider: false,
                ),
                SystemUiOverlayStyle(
                  systemStatusBarContrastEnforced: false,
                  systemNavigationBarColor:
                      Theme.of(context).colorScheme.surface,
                  systemNavigationBarDividerColor: Colors.transparent,
                  systemNavigationBarIconBrightness: Brightness.light,
                  systemNavigationBarContrastEnforced: false,
                ),
              );
              // The builder function must return a widget.
              return const Placeholder();
            },
          ),
        ),
      );
    });

    testWidgets(
        'FCS6.04Da: GIVEN A dark theme with defined background colors AND '
        'themedSystemNavigationBar WITH '
        'systemNavBarStyle: FlexSystemNavBarStyle.background '
        'EXPECT background colored system navbar, with NO divider.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.dark(
              // background: Color(0xFF303030),
              surface: Color(0xFF424242),
            ),
          ).copyWith(
            scaffoldBackgroundColor: const Color(0xFF212121),
          ),
          child: Builder(
            builder: (BuildContext context) {
              expect(
                FlexColorScheme.themedSystemNavigationBar(
                  context,
                  systemNavBarStyle: FlexSystemNavBarStyle.background,
                ),
                SystemUiOverlayStyle(
                  systemStatusBarContrastEnforced: false,
                  systemNavigationBarColor:
                      Theme.of(context).colorScheme.surface,
                  systemNavigationBarDividerColor: Colors.transparent,
                  systemNavigationBarIconBrightness: Brightness.light,
                  systemNavigationBarContrastEnforced: false,
                ),
              );
              // The builder function must return a widget.
              return const Placeholder();
            },
          ),
        ),
      );
    });

    testWidgets(
        'FCS6.04Db: GIVEN A dark theme with defined background colors AND '
        'themedSystemNavigationBar WITH '
        'systemNavBarStyle: FlexSystemNavBarStyle.background '
        'EXPECT background colored system navbar, with no visible divider.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.dark(
              // background: Color(0xFF303030),
              surface: Color(0xFF424242),
            ),
          ).copyWith(
            scaffoldBackgroundColor: const Color(0xFF212121),
          ),
          child: Builder(
            builder: (BuildContext context) {
              expect(
                FlexColorScheme.themedSystemNavigationBar(
                  context,
                  systemNavBarStyle: FlexSystemNavBarStyle.background,
                  useDivider: false,
                ),
                SystemUiOverlayStyle(
                  systemStatusBarContrastEnforced: false,
                  systemNavigationBarColor:
                      Theme.of(context).colorScheme.surface,
                  systemNavigationBarDividerColor: Colors.transparent,
                  systemNavigationBarIconBrightness: Brightness.light,
                  systemNavigationBarContrastEnforced: false,
                ),
              );
              // The builder function must return a widget.
              return const Placeholder();
            },
          ),
        ),
      );
    });

    testWidgets(
        'FCS6.05D: GIVEN A dark theme with defined background colors AND '
        'themedSystemNavigationBar WITH divider and '
        'systemNavBarStyle: FlexSystemNavBarStyle.surface '
        'EXPECT surface colored system navbar, with divider.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.dark(
              // background: Color(0xFF303030),
              surface: Color(0xFF424242),
            ),
          ).copyWith(
            scaffoldBackgroundColor: const Color(0xFF212121),
          ),
          child: Builder(
            builder: (BuildContext context) {
              expect(
                FlexColorScheme.themedSystemNavigationBar(
                  context,
                  systemNavBarStyle: FlexSystemNavBarStyle.surface,
                  useDivider: true,
                ),
                SystemUiOverlayStyle(
                  systemStatusBarContrastEnforced: false,
                  systemNavigationBarColor:
                      Theme.of(context).colorScheme.surface,
                  systemNavigationBarDividerColor: const Color(0xFF2C2C2C),
                  systemNavigationBarIconBrightness: Brightness.light,
                  systemNavigationBarContrastEnforced: false,
                ),
              );
              // The builder function must return a widget.
              return const Placeholder();
            },
          ),
        ),
      );
    });

    testWidgets(
        'FCS6.06D: GIVEN A dark theme with defined background colors AND '
        'themedSystemNavigationBar WITH divider and opacity 0.5 and '
        'systemNavBarStyle: FlexSystemNavBarStyle.surface '
        'EXPECT surface colored system navbar and divider with 0.5 opacity.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.dark(
              // background: Color(0xFF303030),
              surface: Color(0xFF424242),
            ),
          ).copyWith(
            scaffoldBackgroundColor: const Color(0xFF212121),
          ),
          child: Builder(
            builder: (BuildContext context) {
              expect(
                FlexColorScheme.themedSystemNavigationBar(
                  context,
                  systemNavBarStyle: FlexSystemNavBarStyle.surface,
                  useDivider: true,
                  opacity: 0.5,
                ),
                SystemUiOverlayStyle(
                  systemStatusBarContrastEnforced: false,
                  systemNavigationBarColor: Theme.of(context)
                      .colorScheme
                      .surface
                      .withValues(alpha: 0.5),
                  // Divider has opacity 0.5, when there is opacity on navbar.
                  systemNavigationBarDividerColor:
                      const Color(0xFF2C2C2C).withValues(alpha: 0.5),
                  systemNavigationBarIconBrightness: Brightness.light,
                  systemNavigationBarContrastEnforced: false,
                ),
              );
              // The builder function must return a widget.
              return const Placeholder();
            },
          ),
        ),
      );
    });

    testWidgets(
        'FCS6.07D: GIVEN A dark theme with defined background colors AND '
        'themedSystemNavigationBar WITH NO divider and opacity 0.5 and '
        'systemNavBarStyle: FlexSystemNavBarStyle.surface '
        'EXPECT surface colored system navbar with 0.5 opacity, with no '
        'visible divider.', (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.dark(
              // background: Color(0xFF303030),
              surface: Color(0xFF424242),
            ),
          ).copyWith(
            scaffoldBackgroundColor: const Color(0xFF212121),
          ),
          child: Builder(
            builder: (BuildContext context) {
              expect(
                FlexColorScheme.themedSystemNavigationBar(
                  context,
                  systemNavBarStyle: FlexSystemNavBarStyle.surface,
                  useDivider: false,
                  opacity: 0.5,
                ),
                SystemUiOverlayStyle(
                  systemStatusBarContrastEnforced: false,
                  systemNavigationBarColor: Theme.of(context)
                      .colorScheme
                      .surface
                      .withValues(alpha: 0.5),
                  systemNavigationBarDividerColor: Colors.transparent,
                  systemNavigationBarIconBrightness: Brightness.light,
                  systemNavigationBarContrastEnforced: false,
                ),
              );
              // The builder function must return a widget.
              return const Placeholder();
            },
          ),
        ),
      );
    });

    testWidgets(
        'FCS6.08D: GIVEN A dark theme with defined background colors AND '
        'themedSystemNavigationBar WITH NO divider and '
        'systemNavBarStyle: FlexSystemNavBarStyle.transparent and opacity:0.5 '
        'EXPECT scaffoldBackground colored system navbar with 0.01 opacity, '
        'with no visible divider.', (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.dark(
              // background: Color(0xFF303030),
              surface: Color(0xFF424242),
            ),
          ).copyWith(
            scaffoldBackgroundColor: const Color(0xFF212121),
          ),
          child: Builder(
            builder: (BuildContext context) {
              expect(
                FlexColorScheme.themedSystemNavigationBar(
                  context,
                  systemNavBarStyle: FlexSystemNavBarStyle.transparent,
                  useDivider: false,
                  opacity: 0.5,
                ),
                SystemUiOverlayStyle(
                  systemStatusBarContrastEnforced: false,
                  systemNavigationBarColor: Theme.of(context)
                      .scaffoldBackgroundColor
                      .withValues(alpha: 0),
                  systemNavigationBarDividerColor: Colors.transparent,
                  systemNavigationBarIconBrightness: Brightness.light,
                  systemNavigationBarContrastEnforced: false,
                ),
              );
              // The builder function must return a widget.
              return const Placeholder();
            },
          ),
        ),
      );
    });

    testWidgets(
        'FCS6.09D: GIVEN A DARK theme with defined background colors AND '
        'themedSystemNavigationBar WITH NO divider and '
        'systemNavBarStyle: FlexSystemNavBarStyle.navigationBar '
        'EXPECT navigationBarTheme.backgroundColor colored system navbar, '
        'with no visible divider.', (WidgetTester tester) async {
      const Color seedColor = Color(0xFF1577C7);
      const Color navBarColor = Color(0xFF051318);

      await tester.pumpWidget(
        Theme(
          data: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              brightness: Brightness.dark,
              seedColor: seedColor,
            ),
            scaffoldBackgroundColor: const Color(0xFF050C0E),
            navigationBarTheme: const NavigationBarThemeData(
              backgroundColor: navBarColor,
            ),
          ),
          child: Builder(
            builder: (BuildContext context) {
              expect(
                FlexColorScheme.themedSystemNavigationBar(
                  context,
                  systemNavBarStyle: FlexSystemNavBarStyle.navigationBar,
                  useDivider: false,
                ),
                SystemUiOverlayStyle(
                  systemStatusBarContrastEnforced: false,
                  systemNavigationBarColor:
                      Theme.of(context).navigationBarTheme.backgroundColor,
                  systemNavigationBarDividerColor: Colors.transparent,
                  systemNavigationBarIconBrightness: Brightness.light,
                  systemNavigationBarContrastEnforced: false,
                ),
              );
              // The builder function must return a widget.
              return const Placeholder();
            },
          ),
        ),
      );
    });
    testWidgets(
        'FCS6.10D: GIVEN A DARK theme with defined background colors AND '
        'un-themedSystemNavigationBar WITH NO divider and '
        'systemNavBarStyle: FlexSystemNavBarStyle.navigationBar '
        'EXPECT colorScheme.surfaceContainer colored system navbar, '
        'with no visible divider.', (WidgetTester tester) async {
      const Color seedColor = Color(0xFF1577C7);

      await tester.pumpWidget(
        Theme(
          data: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              brightness: Brightness.dark,
              seedColor: seedColor,
            ),
            scaffoldBackgroundColor: const Color(0xFF050C0E),
          ),
          child: Builder(
            builder: (BuildContext context) {
              expect(
                FlexColorScheme.themedSystemNavigationBar(
                  context,
                  systemNavBarStyle: FlexSystemNavBarStyle.navigationBar,
                  useDivider: false,
                ),
                SystemUiOverlayStyle(
                  systemStatusBarContrastEnforced: false,
                  systemNavigationBarColor:
                      Theme.of(context).colorScheme.surfaceContainer,
                  systemNavigationBarDividerColor: Colors.transparent,
                  systemNavigationBarIconBrightness: Brightness.light,
                  systemNavigationBarContrastEnforced: false,
                ),
              );
              // The builder function must return a widget.
              return const Placeholder();
            },
          ),
        ),
      );
    });
  });
}
