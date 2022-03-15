import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: avoid_redundant_argument_values

void main() {
  //****************************************************************************
  // FlexColorScheme unit tests for using FlexKeyColors and FlexTones
  //
  // Basic object tests, equality, none equal, copyWith. Factory creation
  // same result as matching one with default constructor.
  //****************************************************************************
  group('FCS7: WITH FlexColorScheme ', () {
    debugDefaultTargetPlatformOverride = null;

    const Color m3BaseSeed = Color(0xFF6750A4);
    final FlexSchemeColor m3Baseline =
        FlexSchemeColor.from(primary: m3BaseSeed);

    final FlexColorScheme m1Light = FlexColorScheme.light(
      colors: m3Baseline,
      // TODO(rydmike): When SurfaceStyle is removed, mode&level not needed.
      //  Remove here and other similar usage in these tests.
      surfaceMode: FlexSurfaceMode.level,
      blendLevel: 0,
      keyColors: const FlexKeyColors(
        useSecondary: false,
        useTertiary: false,
      ),
    );
    final FlexColorScheme m1Dark = FlexColorScheme.dark(
      colors: m3Baseline,
      surfaceMode: FlexSurfaceMode.level,
      blendLevel: 0,
      keyColors: const FlexKeyColors(
        useSecondary: false,
        useTertiary: false,
      ),
    );
    //
    // A key promise of the above algorithm is that ColorScheme produced by
    // the above setup should be equal to ColorScheme.fromSeed with same color,
    // this verifies that it is.
    test(
        'FCS7.001-light: GIVEN a FlexColorScheme.light with keyColors using '
        'only one seed color '
        'EXPECT FlexColorScheme.light.toScheme to be equal to '
        'ColorScheme with scheme Material.', () {
      expect(
        m1Light.toScheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(ColorScheme.fromSeed(
          seedColor: m3BaseSeed,
          brightness: Brightness.light,
        ).toString(minLevel: DiagnosticLevel.fine)),
      );
    });
    test(
        'FCS7.001-dark: GIVEN a FlexColorScheme.light with keyColors using '
        'only one seed color '
        'EXPECT FlexColorScheme.light.toScheme to be equal to '
        'ColorScheme with scheme Material.', () {
      expect(
        m1Dark.toScheme,
        equals(ColorScheme.fromSeed(
          seedColor: m3BaseSeed,
          brightness: Brightness.dark,
        )),
      );
    });
    //
    // Test M3 error color and keeping colors
    //
    final FlexSchemeColor schemeLight = FlexSchemeColor.from(
      primary: FlexColor.sakuraLightPrimary,
      primaryContainer: FlexColor.sakuraLightPrimaryContainer,
      secondary: FlexColor.sakuraLightSecondary,
      secondaryContainer: FlexColor.sakuraLightSecondaryContainer,
      tertiary: FlexColor.sakuraLightTertiary,
      tertiaryContainer: FlexColor.sakuraLightTertiaryContainer,
    );
    final FlexSchemeColor schemeDark = FlexSchemeColor.from(
      primary: FlexColor.sakuraDarkPrimary,
      primaryContainer: FlexColor.sakuraDarkPrimaryContainer,
      secondary: FlexColor.sakuraDarkSecondary,
      secondaryContainer: FlexColor.sakuraDarkSecondaryContainer,
      tertiary: FlexColor.sakuraDarkTertiary,
      tertiaryContainer: FlexColor.sakuraDarkTertiaryContainer,
    );
    final FlexColorScheme m2Light = FlexColorScheme.light(
      colors: schemeLight,
      surfaceMode: FlexSurfaceMode.level,
      blendLevel: 0,
      useMaterial3ErrorColors: true,
      keyColors: const FlexKeyColors(
        useKeyColors: false,
        useSecondary: false,
        useTertiary: false,
      ),
    );
    final FlexColorScheme m2Dark = FlexColorScheme.dark(
      colors: schemeDark,
      surfaceMode: FlexSurfaceMode.level,
      blendLevel: 0,
      useMaterial3ErrorColors: true,
      keyColors: const FlexKeyColors(
        useKeyColors: false,
        useSecondary: false,
        useTertiary: false,
      ),
    );
    //
    // Here we are using explicit turn OFF of using key color based seeding
    // despite passing in a class for it, but member useKeyColors is FALSE.
    // We do however request M3 error colors and not M2 ones.
    // Verify the results.
    test(
        'FCS7.002-light: GIVEN a FlexColorScheme.light with keyColors using '
        'explicit NO seed color but M3 error colors '
        'EXPECT FlexColorScheme.light.toScheme to use M3 error colors but '
        'original provided main colors ', () {
      expect(
        m2Light.toScheme.primary,
        equals(FlexColor.sakuraLightPrimary),
      );
      expect(
        m2Light.toScheme.primaryContainer,
        equals(FlexColor.sakuraLightPrimaryContainer),
      );
      expect(
        m2Light.toScheme.secondary,
        equals(FlexColor.sakuraLightSecondary),
      );
      expect(
        m2Light.toScheme.secondaryContainer,
        equals(FlexColor.sakuraLightSecondaryContainer),
      );
      expect(
        m2Light.toScheme.tertiary,
        equals(FlexColor.sakuraLightTertiary),
      );
      expect(
        m2Light.toScheme.tertiaryContainer,
        equals(FlexColor.sakuraLightTertiaryContainer),
      );
      expect(
        m2Light.toScheme.error,
        equals(FlexColor.material3LightError),
      );
      expect(
        m2Light.toScheme.errorContainer,
        equals(FlexColor.material3LightErrorContainer),
      );
    });
    test(
        'FCS7.002-dark: GIVEN a FlexColorScheme.dark with keyColors using '
        'explicit NO seed color but M3 error colors '
        'EXPECT FlexColorScheme.dark.toScheme to use M3 error colors but '
        'original provided main colors ', () {
      expect(
        m2Dark.toScheme.primary,
        equals(FlexColor.sakuraDarkPrimary),
      );
      expect(
        m2Dark.toScheme.primaryContainer,
        equals(FlexColor.sakuraDarkPrimaryContainer),
      );
      expect(
        m2Dark.toScheme.secondary,
        equals(FlexColor.sakuraDarkSecondary),
      );
      expect(
        m2Dark.toScheme.secondaryContainer,
        equals(FlexColor.sakuraDarkSecondaryContainer),
      );
      expect(
        m2Dark.toScheme.tertiary,
        equals(FlexColor.sakuraDarkTertiary),
      );
      expect(
        m2Dark.toScheme.tertiaryContainer,
        equals(FlexColor.sakuraDarkTertiaryContainer),
      );
      expect(
        m2Dark.toScheme.error,
        equals(FlexColor.material3DarkError),
      );
      expect(
        m2Dark.toScheme.errorContainer,
        equals(FlexColor.material3DarkErrorContainer),
      );
    });
    //
    // Setup test for using key colors all, but keeping ALL input colors.
    //
    final FlexColorScheme m3Light = FlexColorScheme.light(
      colors: schemeLight,
      surfaceMode: FlexSurfaceMode.level,
      blendLevel: 0,
      keyColors: const FlexKeyColors(
        useKeyColors: true,
        useSecondary: true,
        useTertiary: true,
        keepPrimary: true,
        keepPrimaryContainer: true,
        keepSecondary: true,
        keepSecondaryContainer: true,
        keepTertiary: true,
        keepTertiaryContainer: true,
      ),
    );
    final FlexColorScheme m3Dark = FlexColorScheme.dark(
      colors: schemeDark,
      surfaceMode: FlexSurfaceMode.level,
      blendLevel: 0,
      keyColors: const FlexKeyColors(
        useKeyColors: true,
        useSecondary: true,
        useTertiary: true,
        keepPrimary: true,
        keepPrimaryContainer: true,
        keepSecondary: true,
        keepSecondaryContainer: true,
        keepTertiary: true,
        keepTertiaryContainer: true,
      ),
    );
    //
    // Here we are using explicit turn OFF of using key color based seeding
    // despite passing in a class for it, but member useKeyColors is FALSE.
    // We do however request M3 error colors and not M2 ones.
    // Verify the results.
    test(
        'FCS7.003-light: GIVEN a FlexColorScheme.light with keyColors using '
        'ALL INPUT but keeping all inputs as they were defined '
        'EXPECT FlexColorScheme.light.toScheme to use input colors '
        'and M3 error colors by seed algo.', () {
      expect(
        m3Light.toScheme.primary,
        equals(FlexColor.sakuraLightPrimary),
      );
      expect(
        m3Light.toScheme.primaryContainer,
        equals(FlexColor.sakuraLightPrimaryContainer),
      );
      expect(
        m3Light.toScheme.secondary,
        equals(FlexColor.sakuraLightSecondary),
      );
      expect(
        m3Light.toScheme.secondaryContainer,
        equals(FlexColor.sakuraLightSecondaryContainer),
      );
      expect(
        m3Light.toScheme.tertiary,
        equals(FlexColor.sakuraLightTertiary),
      );
      expect(
        m3Light.toScheme.tertiaryContainer,
        equals(FlexColor.sakuraLightTertiaryContainer),
      );
      expect(
        m3Light.toScheme.error,
        equals(FlexColor.material3LightError),
      );
      expect(
        m3Light.toScheme.errorContainer,
        equals(FlexColor.material3LightErrorContainer),
      );
    });
    test(
        'FCS7.003-dark: GIVEN a FlexColorScheme.dark with keyColors using '
        'ALL INPUT but keeping all inputs as they were defined '
        'EXPECT FlexColorScheme.dark.toScheme to use input colors '
        'and M3 error colors by seed algo.', () {
      expect(
        m3Dark.toScheme.primary,
        equals(FlexColor.sakuraDarkPrimary),
      );
      expect(
        m3Dark.toScheme.primaryContainer,
        equals(FlexColor.sakuraDarkPrimaryContainer),
      );
      expect(
        m3Dark.toScheme.secondary,
        equals(FlexColor.sakuraDarkSecondary),
      );
      expect(
        m3Dark.toScheme.secondaryContainer,
        equals(FlexColor.sakuraDarkSecondaryContainer),
      );
      expect(
        m3Dark.toScheme.tertiary,
        equals(FlexColor.sakuraDarkTertiary),
      );
      expect(
        m3Dark.toScheme.tertiaryContainer,
        equals(FlexColor.sakuraDarkTertiaryContainer),
      );
      expect(
        m3Dark.toScheme.error,
        equals(FlexColor.material3DarkError),
      );
      expect(
        m3Dark.toScheme.errorContainer,
        equals(FlexColor.material3DarkErrorContainer),
      );
    });

    //
  });
}
