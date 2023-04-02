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
      keyColors: const FlexKeyColors(
        useSecondary: false,
        useTertiary: false,
      ),
    );
    final FlexColorScheme m1Dark = FlexColorScheme.dark(
      colors: m3Baseline,
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
        'ColorScheme.fromSeed using same color as key.', () {
      expect(
        m1Light.toScheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(ColorScheme.fromSeed(
          seedColor: m3BaseSeed,
          brightness: Brightness.light,
        ).toString(minLevel: DiagnosticLevel.fine)),
      );
    });
    test(
        'FCS7.001-l-s: GIVEN a ColorScheme.fromFlexSeeds using only one seed '
        'EXPECT equal to ColorScheme.fromSeed using same color as key.', () {
      expect(
        SeedColorScheme.fromSeeds(
          brightness: Brightness.light,
          primaryKey: m3BaseSeed,
        ),
        equals(ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: m3BaseSeed,
        )),
      );
    });
    test(
        'FCS7.001-dark: GIVEN a FlexColorScheme.dark with keyColors using '
        'only one seed color '
        'EXPECT FlexColorScheme.dark.toScheme to be equal to '
        'ColorScheme.fromSeed using same color as key.', () {
      expect(
        m1Dark.toScheme,
        equals(ColorScheme.fromSeed(
          seedColor: m3BaseSeed,
          brightness: Brightness.dark,
        )),
      );
    });
    test(
        'FCS7.001-d-s: GIVEN a ColorScheme.fromFlexSeeds using only one seed '
        'EXPECT equal to ColorScheme.fromSeed using same color as key.', () {
      expect(
        SeedColorScheme.fromSeeds(
          brightness: Brightness.dark,
          primaryKey: m3BaseSeed,
        ),
        equals(ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: m3BaseSeed,
        )),
      );
    });
    //--------------------------------------------------------------------------
    // Test M3 error color and keeping colors
    //--------------------------------------------------------------------------
    //
    // Here we explicitly turn OFF of using key color based seeding
    // despite passing in a class for it, but member useKeyColors is FALSE.
    // We do however request M3 error colors and not M2 ones.
    // Verify the results.
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
    // Here we explicitly turn OFF of using key color based seeding
    // despite passing in a class for it, but member useKeyColors is FALSE.
    // We do also set no error colors and expect default M2 ones.
    final FlexColorScheme m2LightNoErrCol = FlexColorScheme.light(
      colors: schemeLight,
      surfaceMode: FlexSurfaceMode.level,
      blendLevel: 0,
      keyColors: const FlexKeyColors(
        useKeyColors: false,
        useSecondary: false,
        useTertiary: false,
      ),
    );
    final FlexColorScheme m2DarkNoErrCol = FlexColorScheme.dark(
      colors: schemeDark,
      surfaceMode: FlexSurfaceMode.level,
      blendLevel: 0,
      keyColors: const FlexKeyColors(
        useKeyColors: false,
        useSecondary: false,
        useTertiary: false,
      ),
    );
    test(
        'FCS7.002-light-no-err: GIVEN a FlexColorScheme.light with keyColors '
        'using explicit NO seed color AND no error colors '
        'EXPECT FlexColorScheme.light.toScheme to use M2 error colors and '
        'original provided main colors ', () {
      expect(
        m2LightNoErrCol.toScheme.primary,
        equals(FlexColor.sakuraLightPrimary),
      );
      expect(
        m2LightNoErrCol.toScheme.primaryContainer,
        equals(FlexColor.sakuraLightPrimaryContainer),
      );
      expect(
        m2LightNoErrCol.toScheme.secondary,
        equals(FlexColor.sakuraLightSecondary),
      );
      expect(
        m2LightNoErrCol.toScheme.secondaryContainer,
        equals(FlexColor.sakuraLightSecondaryContainer),
      );
      expect(
        m2LightNoErrCol.toScheme.tertiary,
        equals(FlexColor.sakuraLightTertiary),
      );
      expect(
        m2LightNoErrCol.toScheme.tertiaryContainer,
        equals(FlexColor.sakuraLightTertiaryContainer),
      );
      expect(
        m2LightNoErrCol.toScheme.error,
        equals(FlexColor.materialLightError),
      );
      expect(
        m2LightNoErrCol.toScheme.errorContainer,
        equals(FlexColor.lightErrorContainer(FlexColor.materialLightError)),
      );
    });
    test(
        'FCS7.002-dark-no-err: GIVEN a FlexColorScheme.dark with keyColors '
        'using explicit NO seed color AND no error colors '
        'EXPECT FlexColorScheme.dark.toScheme to use M2 error colors and '
        'original provided main colors ', () {
      expect(
        m2DarkNoErrCol.toScheme.primary,
        equals(FlexColor.sakuraDarkPrimary),
      );
      expect(
        m2DarkNoErrCol.toScheme.primaryContainer,
        equals(FlexColor.sakuraDarkPrimaryContainer),
      );
      expect(
        m2DarkNoErrCol.toScheme.secondary,
        equals(FlexColor.sakuraDarkSecondary),
      );
      expect(
        m2DarkNoErrCol.toScheme.secondaryContainer,
        equals(FlexColor.sakuraDarkSecondaryContainer),
      );
      expect(
        m2DarkNoErrCol.toScheme.tertiary,
        equals(FlexColor.sakuraDarkTertiary),
      );
      expect(
        m2DarkNoErrCol.toScheme.tertiaryContainer,
        equals(FlexColor.sakuraDarkTertiaryContainer),
      );
      expect(
        m2DarkNoErrCol.toScheme.error,
        equals(FlexColor.materialDarkError),
      );
      expect(
        m2DarkNoErrCol.toScheme.errorContainer,
        equals(FlexColor.darkErrorContainer(FlexColor.materialDarkError)),
      );
    });
    //
    // Here we explicitly turn OFF of using key color based seeding
    // despite passing in a class for it, but member useKeyColors is FALSE.
    // We do also set no error colors and expect default M2 ones.
    final FlexSchemeColor schemeLightDefErr = FlexSchemeColor.from(
      primary: FlexColor.sakuraLightPrimary,
      primaryContainer: FlexColor.sakuraLightPrimaryContainer,
      secondary: FlexColor.sakuraLightSecondary,
      secondaryContainer: FlexColor.sakuraLightSecondaryContainer,
      tertiary: FlexColor.sakuraLightTertiary,
      tertiaryContainer: FlexColor.sakuraLightTertiaryContainer,
      error: FlexColor.redLightPrimary,
      errorContainer: FlexColor.redLightPrimaryContainer,
    );
    final FlexSchemeColor schemeDarkDefErr = FlexSchemeColor.from(
      primary: FlexColor.sakuraDarkPrimary,
      primaryContainer: FlexColor.sakuraDarkPrimaryContainer,
      secondary: FlexColor.sakuraDarkSecondary,
      secondaryContainer: FlexColor.sakuraDarkSecondaryContainer,
      tertiary: FlexColor.sakuraDarkTertiary,
      tertiaryContainer: FlexColor.sakuraDarkTertiaryContainer,
      error: FlexColor.redDarkPrimary,
      errorContainer: FlexColor.redDarkPrimaryContainer,
    );
    final FlexColorScheme m2LightDefErrCol = FlexColorScheme.light(
      colors: schemeLightDefErr,
      surfaceMode: FlexSurfaceMode.level,
      blendLevel: 0,
      keyColors: const FlexKeyColors(
        useKeyColors: false,
        useSecondary: false,
        useTertiary: false,
      ),
    );
    final FlexColorScheme m2DarkDefErrCol = FlexColorScheme.dark(
      colors: schemeDarkDefErr,
      surfaceMode: FlexSurfaceMode.level,
      blendLevel: 0,
      keyColors: const FlexKeyColors(
        useKeyColors: false,
        useSecondary: false,
        useTertiary: false,
      ),
    );
    //
    // Here we are using explicit turn OFF of using key color based seeding
    // despite passing in a class for it, but member useKeyColors is FALSE.
    // We do also set no error colors and expect default M2 ones.
    test(
        'FCS7.002-light-def-err: GIVEN a FlexColorScheme.light with keyColors '
        'using explicit NO seed color AND given error colors '
        'EXPECT FlexColorScheme.light.toScheme to use given error colors and '
        'original provided main colors ', () {
      expect(
        m2LightDefErrCol.toScheme.primary,
        equals(FlexColor.sakuraLightPrimary),
      );
      expect(
        m2LightDefErrCol.toScheme.primaryContainer,
        equals(FlexColor.sakuraLightPrimaryContainer),
      );
      expect(
        m2LightDefErrCol.toScheme.secondary,
        equals(FlexColor.sakuraLightSecondary),
      );
      expect(
        m2LightDefErrCol.toScheme.secondaryContainer,
        equals(FlexColor.sakuraLightSecondaryContainer),
      );
      expect(
        m2LightDefErrCol.toScheme.tertiary,
        equals(FlexColor.sakuraLightTertiary),
      );
      expect(
        m2LightDefErrCol.toScheme.tertiaryContainer,
        equals(FlexColor.sakuraLightTertiaryContainer),
      );
      expect(
        m2LightDefErrCol.toScheme.error,
        equals(FlexColor.redLightPrimary),
      );
      expect(
        m2LightDefErrCol.toScheme.errorContainer,
        equals(FlexColor.redLightPrimaryContainer),
      );
    });
    test(
        'FCS7.002-dark-def-err: GIVEN a FlexColorScheme.dark with keyColors '
        'using explicit NO seed color AND given error colors '
        'EXPECT FlexColorScheme.dark.toScheme to use given error colors and '
        'original provided main colors ', () {
      expect(
        m2DarkDefErrCol.toScheme.primary,
        equals(FlexColor.sakuraDarkPrimary),
      );
      expect(
        m2DarkDefErrCol.toScheme.primaryContainer,
        equals(FlexColor.sakuraDarkPrimaryContainer),
      );
      expect(
        m2DarkDefErrCol.toScheme.secondary,
        equals(FlexColor.sakuraDarkSecondary),
      );
      expect(
        m2DarkDefErrCol.toScheme.secondaryContainer,
        equals(FlexColor.sakuraDarkSecondaryContainer),
      );
      expect(
        m2DarkDefErrCol.toScheme.tertiary,
        equals(FlexColor.sakuraDarkTertiary),
      );
      expect(
        m2DarkDefErrCol.toScheme.tertiaryContainer,
        equals(FlexColor.sakuraDarkTertiaryContainer),
      );
      expect(
        m2DarkDefErrCol.toScheme.error,
        equals(FlexColor.redDarkPrimary),
      );
      expect(
        m2DarkDefErrCol.toScheme.errorContainer,
        equals(FlexColor.redDarkPrimaryContainer),
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
    //--------------------------------------------------------------------------
    // Test Passing ColorScheme as override, with seed colors
    //--------------------------------------------------------------------------
    //
    final ColorScheme keySchemeLight = ColorScheme.fromSeed(
      seedColor: m3BaseSeed,
      brightness: Brightness.light,
    );
    final ColorScheme keySchemeDark = ColorScheme.fromSeed(
      seedColor: m3BaseSeed,
      brightness: Brightness.dark,
    );
    final FlexColorScheme m4PassSchemeLight = FlexColorScheme.light(
      colors: m3Baseline,
      colorScheme: keySchemeLight,
      surfaceMode: FlexSurfaceMode.level,
      blendLevel: 0,
      keyColors: const FlexKeyColors(
        useSecondary: false,
        useTertiary: false,
      ),
    );
    final FlexColorScheme m4PassSchemeDark = FlexColorScheme.dark(
      colors: m3Baseline,
      // We need to pass a color scheme with same primary color as in light that
      // will be used as seed color for to get desired/expected result.
      colorScheme: keySchemeDark.copyWith(primary: keySchemeLight.primary),
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
        'FCS7.004-light: GIVEN a FlexColorScheme.light with keyColors using '
        'only one seed color from passed in ColorScheme '
        'EXPECT FlexColorScheme.light.toScheme to be equal to '
        'ColorScheme.fromSeed using same color as key.', () {
      expect(
        m4PassSchemeLight.toScheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
            keySchemeLight.toString(minLevel: DiagnosticLevel.fine)),
      );
    });
    test(
        'FCS7.004-dark: GIVEN a FlexColorScheme.dark with keyColors using '
        'only one seed color from passed in ColorScheme '
        'EXPECT FlexColorScheme.dark.toScheme to be equal to '
        'ColorScheme.fromSeed using same color as key.', () {
      expect(
        m4PassSchemeDark.toScheme,
        equals(keySchemeDark),
      );
    });
    //--------------------------------------------------------------------------
    // Test Passing ColorScheme and override with seed colors
    //--------------------------------------------------------------------------
    final FlexColorScheme m5OverrideLight = FlexColorScheme.light(
      colors: m3Baseline,
      colorScheme: keySchemeLight,
      primary: FlexColor.sakuraLightPrimary,
      // The only main prop that matter is the seed key, these wont do anything.
      primaryContainer: FlexColor.sakuraLightPrimaryContainer,
      secondary: FlexColor.sakuraLightSecondary,
      secondaryContainer: FlexColor.sakuraLightSecondaryContainer,
      tertiary: FlexColor.sakuraLightTertiary,
      tertiaryContainer: FlexColor.sakuraLightTertiaryContainer,
      error: FlexColor.redLightPrimary,
      // Relevant for seed result
      surfaceMode: FlexSurfaceMode.level,
      blendLevel: 0,
      keyColors: const FlexKeyColors(
        useSecondary: false,
        useTertiary: false,
      ),
    );
    final FlexColorScheme m5OverrideDark = FlexColorScheme.dark(
      colors: m3Baseline,
      // We need to pass a color scheme with same primary color as in light that
      // will be used as seed color for to get desired/expected result.
      colorScheme: keySchemeDark,
      primary: FlexColor.sakuraDarkPrimary,
      // The only main prop that matter is the seed key, these wont do anything.
      primaryContainer: FlexColor.sakuraDarkPrimaryContainer,
      secondary: FlexColor.sakuraDarkSecondary,
      secondaryContainer: FlexColor.sakuraDarkSecondaryContainer,
      tertiary: FlexColor.sakuraDarkTertiary,
      tertiaryContainer: FlexColor.sakuraDarkTertiaryContainer,
      error: FlexColor.redDarkPrimary,
      // Relevant for seed result
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
        'FCS7.005-light: GIVEN a FlexColorScheme.light with keyColors using '
        'only one seed color from passed in color '
        'EXPECT FlexColorScheme.light.toScheme to be equal to '
        'ColorScheme.fromSeed using same primary color as override value.', () {
      expect(
        m5OverrideLight.toScheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(ColorScheme.fromSeed(
          seedColor: FlexColor.sakuraLightPrimary,
          brightness: Brightness.light,
        ).toString(minLevel: DiagnosticLevel.fine)),
      );
    });
    test(
        'FCS7.005-dark: GIVEN a FlexColorScheme.dark with keyColors using '
        'only one seed color from passed in color '
        'EXPECT FlexColorScheme.dark.toScheme to be equal to '
        'ColorScheme.fromSeed using same primary color as override value.', () {
      expect(
        m5OverrideDark.toScheme,
        equals(ColorScheme.fromSeed(
          seedColor: FlexColor.sakuraDarkPrimary,
          brightness: Brightness.dark,
        )),
      );
    });
    //
    // Test that scheme based seeded DARK color schemes are based on the
    // light colors when using FlexScheme `scheme`.
    test(
        'FCS7.007-dark: GIVEN a FlexColorScheme.dark with keyColors using '
        'three seed color from used FlexScheme scheme '
        'EXPECT FlexColorScheme.dark.toScheme to be equal to a '
        'FlexColorScheme.dark made with same scheme based colors '
        'FlexSchemeColor', () {
      expect(
        FlexColorScheme.dark(
            scheme: FlexScheme.flutterDash,
            blendLevel: 2,
            keyColors: const FlexKeyColors(
              useSecondary: true,
              useTertiary: true,
            )).toScheme,
        equals(
          FlexColorScheme.dark(
            colors: FlexColor.flutterDash.light,
            blendLevel: 2,
            keyColors: const FlexKeyColors(
              useSecondary: true,
              useTertiary: true,
            ),
          ).toScheme,
        ),
      );
    });
    //
  });
}
