import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: avoid_redundant_argument_values

void main() {
  //****************************************************************************
  // FlexColorScheme unit tests for using FlexColorScheme with sub-themes.
  // Used to verify that sub-themes are created as expected.
  //****************************************************************************
  group('FCS8: WITH FlexColorScheme ', () {
    debugDefaultTargetPlatformOverride = null;
    //
    // Test that sub-theme props implemented in toTheme work as intended.
    // Most sub-themes are tested via sub-theme unit tests.
    test(
        'FCS8.001-light: GIVEN a FlexColorScheme.light with sub themes '
        'and sub-theme with props coded in toTheme '
        'EXPECT sub-theme using the requested props, with onSurface '
        'text theme blends.', () {
      final FlexColorScheme fcs = FlexColorScheme.light(
        scheme: FlexScheme.redWine,
        surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
        blendLevel: 40,
        subThemesData: const FlexSubThemesData(
          appBarBackgroundSchemeColor: SchemeColor.secondaryContainer,
          tabBarIndicatorSchemeColor: SchemeColor.inversePrimary,
          tabBarItemSchemeColor: SchemeColor.onSurfaceVariant,
          blendTextTheme: true,
          blendOnColors: true,
          blendOnLevel: 40,
        ),
      );
      final ColorScheme fcsScheme = fcs.toScheme;
      expect(
        fcs.toTheme.appBarTheme.backgroundColor,
        equals(fcs.toTheme.colorScheme.secondaryContainer),
      );
      expect(
        fcs.toTheme.indicatorColor,
        equals(fcs.toTheme.colorScheme.inversePrimary),
      );
      expect(
        fcs.toTheme.tabBarTheme.labelColor,
        equals(fcs.toTheme.colorScheme.onSurfaceVariant),
      );
      // We get onSurface as blend color for blended TextTheme in light mode.
      expect(
        fcsScheme.onBackground.red > fcsScheme.onSurface.red,
        equals(true),
      );
    });
    test(
        'FCS8.001-dark: GIVEN a FlexColorScheme.dark with sub themes '
        'and sub-theme with props coded in toTheme '
        'EXPECT sub-theme using the requested props, with onSurface '
        'text theme blends.', () {
      final FlexColorScheme fcs = FlexColorScheme.dark(
        scheme: FlexScheme.redWine,
        surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
        blendLevel: 40,
        subThemesData: const FlexSubThemesData(
          appBarBackgroundSchemeColor: SchemeColor.secondaryContainer,
          tabBarIndicatorSchemeColor: SchemeColor.inversePrimary,
          tabBarItemSchemeColor: SchemeColor.onSurfaceVariant,
          blendTextTheme: true,
          blendOnColors: true,
          blendOnLevel: 40,
        ),
      );
      final ColorScheme fcsScheme = fcs.toScheme;
      expect(
        fcs.toTheme.appBarTheme.backgroundColor,
        equals(fcs.toTheme.colorScheme.secondaryContainer),
      );
      expect(
        fcs.toTheme.indicatorColor,
        equals(fcs.toTheme.colorScheme.inversePrimary),
      );
      expect(
        fcs.toTheme.tabBarTheme.labelColor,
        equals(fcs.toTheme.colorScheme.onSurfaceVariant),
      );
      // We get onSurface as blend color for blended TextTheme in dark mode.
      expect(
        fcsScheme.onBackground.red < fcsScheme.onSurface.red,
        equals(true),
      );
    });
    test(
        'FCS8.002-light: GIVEN a FlexColorScheme.light with sub themes '
        'and sub-theme with props coded in toTheme '
        'EXPECT sub-theme using the requested props, with onBackground '
        'text theme blends.', () {
      final FlexColorScheme fcs = FlexColorScheme.light(
        scheme: FlexScheme.red,
        surfaceMode: FlexSurfaceMode.highSurfaceLowScaffold,
        blendLevel: 40,
        subThemesData: const FlexSubThemesData(
          appBarBackgroundSchemeColor: SchemeColor.secondaryContainer,
          tabBarIndicatorSchemeColor: SchemeColor.inversePrimary,
          tabBarItemSchemeColor: SchemeColor.onSurfaceVariant,
          blendTextTheme: true,
          blendOnColors: true,
          blendOnLevel: 40,
        ),
      );
      final ColorScheme fcsScheme = fcs.toScheme;
      expect(
        fcs.toTheme.appBarTheme.backgroundColor,
        equals(fcs.toTheme.colorScheme.secondaryContainer),
      );
      expect(
        fcs.toTheme.indicatorColor,
        equals(fcs.toTheme.colorScheme.inversePrimary),
      );
      expect(
        fcs.toTheme.tabBarTheme.labelColor,
        equals(fcs.toTheme.colorScheme.onSurfaceVariant),
      );
      // We get onSurface as blend color for blended TextTheme
      expect(
        fcsScheme.onBackground.red <= fcsScheme.onSurface.red,
        equals(true),
      );
    });
    test(
        'FCS8.003-dark: GIVEN a FlexColorScheme.dark with sub themes '
        'and sub-theme with props coded in toTheme '
        'EXPECT sub-theme using the requested props, with onBackground '
        'text theme blends.', () {
      final FlexColorScheme fcs = FlexColorScheme.dark(
        scheme: FlexScheme.red,
        surfaceMode: FlexSurfaceMode.highSurfaceLowScaffold,
        blendLevel: 40,
        subThemesData: const FlexSubThemesData(
          appBarBackgroundSchemeColor: SchemeColor.secondaryContainer,
          tabBarIndicatorSchemeColor: SchemeColor.inversePrimary,
          tabBarItemSchemeColor: SchemeColor.onSurfaceVariant,
          blendTextTheme: true,
          blendOnColors: true,
          blendOnLevel: 40,
        ),
      );
      final ColorScheme fcsScheme = fcs.toScheme;
      expect(
        fcs.toTheme.appBarTheme.backgroundColor,
        equals(fcs.toTheme.colorScheme.secondaryContainer),
      );
      expect(
        fcs.toTheme.indicatorColor,
        equals(fcs.toTheme.colorScheme.inversePrimary),
      );
      expect(
        fcs.toTheme.tabBarTheme.labelColor,
        equals(fcs.toTheme.colorScheme.onSurfaceVariant),
      );
      // We get onSurface as blend color for blended TextTheme
      expect(
        fcsScheme.onBackground.red >= fcsScheme.onSurface.red,
        equals(true),
      );
    });
    test(
        'FCS8.004-light-a: GIVEN a FlexColorScheme raw with sub themes '
        'and AppBar scheme '
        'EXPECT sub-theme with given AppBar scheme color.', () {
      final FlexColorScheme fcs = FlexColorScheme(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4D31D7),
          brightness: Brightness.light,
        ),
        subThemesData: const FlexSubThemesData(
          appBarBackgroundSchemeColor: SchemeColor.secondary,
          blendTextTheme: true,
          blendOnColors: true,
          blendOnLevel: 25,
        ),
      );
      expect(
        fcs.toTheme.appBarTheme.backgroundColor,
        equals(fcs.toTheme.colorScheme.secondary),
      );
    });
    test(
        'FCS8.004-light-b: GIVEN a FlexColorScheme raw with sub themes '
        'and AppBar scheme with override '
        'EXPECT sub-theme with given AppBar override color.', () {
      final FlexColorScheme fcs = FlexColorScheme(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4D31D7),
          brightness: Brightness.light,
        ),
        appBarBackground: const Color(0xFF3DA3C2),
        subThemesData: const FlexSubThemesData(
          appBarBackgroundSchemeColor: SchemeColor.secondary,
          blendTextTheme: true,
          blendOnColors: true,
          blendOnLevel: 25,
        ),
      );
      expect(
        fcs.toTheme.appBarTheme.backgroundColor,
        equals(const Color(0xFF3DA3C2)),
      );
    });
    test(
        'FCS8.005-dark-a: GIVEN a FlexColorScheme raw with sub themes '
        'and AppBar scheme '
        'EXPECT sub-theme with given AppBar scheme color ', () {
      final FlexColorScheme fcs = FlexColorScheme(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4D31D7),
          brightness: Brightness.dark,
        ),
        subThemesData: const FlexSubThemesData(
          appBarBackgroundSchemeColor: SchemeColor.tertiary,
          blendTextTheme: true,
          blendOnColors: true,
          blendOnLevel: 25,
        ),
      );
      expect(
        fcs.toTheme.appBarTheme.backgroundColor,
        equals(fcs.toTheme.colorScheme.tertiary),
      );
    });
    test(
        'FCS8.005-dark-b: GIVEN a FlexColorScheme raw with sub themes '
        'and AppBar scheme with override '
        'EXPECT sub-theme with given AppBar override color ', () {
      final FlexColorScheme fcs = FlexColorScheme(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4D31D7),
          brightness: Brightness.dark,
        ),
        appBarBackground: const Color(0xFF30454C),
        subThemesData: const FlexSubThemesData(
          appBarBackgroundSchemeColor: SchemeColor.tertiary,
          blendTextTheme: true,
          blendOnColors: true,
          blendOnLevel: 25,
        ),
      );
      expect(
        fcs.toTheme.appBarTheme.backgroundColor,
        equals(const Color(0xFF30454C)),
      );
    });
    test(
        'FCS8.006-light-a: GIVEN a FlexColorScheme.light with sub themes '
        'and custom navigation bar and rail indicator color and '
        'opacity '
        'EXPECT sub-themes with given properties. ', () {
      final FlexColorScheme fcs = FlexColorScheme.light(
        scheme: FlexScheme.flutterDash,
        blendLevel: 20,
        subThemesData: const FlexSubThemesData(
          navigationRailIndicatorOpacity: 0.5,
          navigationRailIndicatorSchemeColor: SchemeColor.onTertiary,
          navigationBarIndicatorOpacity: 0.8,
          navigationBarIndicatorSchemeColor: SchemeColor.primaryContainer,
          blendTextTheme: true,
          blendOnColors: true,
          blendOnLevel: 25,
        ),
      );
      final ColorScheme fcsScheme = fcs.toScheme;
      final ThemeData fcsTheme = fcs.toTheme;
      expect(
        fcsTheme.navigationRailTheme.indicatorColor,
        equals(fcsScheme.onTertiary.withOpacity(0.5)),
      );
      expect(
        fcsTheme.navigationBarTheme.indicatorColor,
        equals(fcsScheme.primaryContainer.withOpacity(0.8)),
      );
    });
    test(
        'FCS8.007-deprecated: GIVEN a FlexColorScheme.light with sub themes '
        'using deprecated sub-themes members '
        'EXPECT them to produce past results via new members. ', () {
      final FlexColorScheme fcs = FlexColorScheme.light(
        scheme: FlexScheme.flutterDash,
        blendLevel: 0,
        subThemesData: const FlexSubThemesData(
          inputDecorationRadius: 15,
          bottomNavigationBarSchemeColor: SchemeColor.surfaceVariant,
          navigationBarHighlightSchemeColor: SchemeColor.tertiary,
          navigationBarTextSchemeColor: SchemeColor.secondary,
          navigationBarIconSchemeColor: SchemeColor.secondaryContainer,
          navigationBarMutedUnselectedText: false,
        ),
      );
      final ColorScheme fcsScheme = fcs.toScheme;
      final ThemeData fcsTheme = fcs.toTheme;
      expect(
        fcsTheme.inputDecorationTheme.enabledBorder,
        equals(OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(
            color: fcs.colorScheme!.primary.withAlpha(0xA7),
            width: 1.5,
          ),
        )),
      );
      expect(
        fcsTheme.bottomNavigationBarTheme.backgroundColor,
        equals(fcsScheme.surfaceVariant),
      );
      expect(
        fcsTheme.navigationBarTheme.indicatorColor,
        equals(fcsScheme.tertiary.withOpacity(0.24)),
      );
      expect(
        fcsTheme.navigationBarTheme.labelTextStyle!
            .resolve(<MaterialState>{MaterialState.selected})?.color,
        equals(fcsScheme.secondary),
      );
      expect(
        fcsTheme.navigationBarTheme.labelTextStyle!
            .resolve(<MaterialState>{})?.color,
        equals(fcsScheme.onSurface),
      );
      expect(
        fcsTheme.navigationBarTheme.iconTheme!
            .resolve(<MaterialState>{MaterialState.selected})?.color,
        equals(fcsScheme.secondaryContainer),
      );
      expect(
        fcsTheme.navigationBarTheme.iconTheme!
            .resolve(<MaterialState>{})?.color,
        equals(fcsScheme.onSurface.withAlpha(0xA5)),
      );
    });
    test(
        'FCS8.008-deprecated: GIVEN a FlexColorScheme.light with old '
        'variant colors input, '
        'EXPECT to find them on containers ', () {
      final FlexColorScheme fcs = FlexColorScheme.light(
        colors: const FlexSchemeColor(
          primary: FlexColor.blumineBlueLightPrimary,
          primaryVariant: FlexColor.blumineBlueLightPrimaryVariant,
          secondary: FlexColor.blumineBlueLightSecondary,
          secondaryVariant: FlexColor.blumineBlueLightSecondaryVariant,
        ),
        blendLevel: 0,
      );
      final ColorScheme fcsScheme = fcs.toScheme;
      expect(
        fcsScheme.primary,
        equals(FlexColor.blumineBlueLightPrimary),
      );
      expect(
        fcsScheme.primaryContainer,
        equals(FlexColor.blumineBlueLightPrimaryVariant),
      );
      expect(
        // ignore: deprecated_member_use
        fcsScheme.primaryVariant,
        equals(FlexColor.blumineBlueLightPrimary),
      );
      expect(
        fcsScheme.secondary,
        equals(FlexColor.blumineBlueLightSecondary),
      );
      expect(
        fcsScheme.secondaryContainer,
        equals(FlexColor.blumineBlueLightSecondaryVariant),
      );
      expect(
        // ignore: deprecated_member_use
        fcsScheme.secondaryVariant,
        equals(FlexColor.blumineBlueLightSecondary),
      );
      expect(
        fcsScheme.tertiary,
        equals(FlexColor.blumineBlueLightSecondary),
      );
      expect(
        fcsScheme.tertiaryContainer,
        equals(FlexColor.blumineBlueLightSecondary),
      );
    });
    test(
        'FCS8.009-deprecated: GIVEN a FlexColorScheme.dark with old '
        'variant colors input, '
        'EXPECT to find them on containers ', () {
      final FlexColorScheme fcs = FlexColorScheme.dark(
        colors: const FlexSchemeColor(
          primary: FlexColor.blumineBlueDarkPrimary,
          primaryVariant: FlexColor.blumineBlueDarkPrimaryVariant,
          secondary: FlexColor.blumineBlueDarkSecondary,
          secondaryVariant: FlexColor.blumineBlueDarkSecondaryVariant,
        ),
        blendLevel: 0,
      );
      final ColorScheme fcsScheme = fcs.toScheme;
      expect(
        fcsScheme.primary,
        equals(FlexColor.blumineBlueDarkPrimary),
      );
      expect(
        fcsScheme.primaryContainer,
        equals(FlexColor.blumineBlueDarkPrimaryVariant),
      );
      expect(
        // ignore: deprecated_member_use
        fcsScheme.primaryVariant,
        equals(FlexColor.blumineBlueDarkPrimary),
      );
      expect(
        fcsScheme.secondary,
        equals(FlexColor.blumineBlueDarkSecondary),
      );
      expect(
        fcsScheme.secondaryContainer,
        equals(FlexColor.blumineBlueDarkSecondaryVariant),
      );
      expect(
        // ignore: deprecated_member_use
        fcsScheme.secondaryVariant,
        equals(FlexColor.blumineBlueDarkSecondary),
      );
      expect(
        fcsScheme.tertiary,
        equals(FlexColor.blumineBlueDarkSecondary),
      );
      expect(
        fcsScheme.tertiaryContainer,
        equals(FlexColor.blumineBlueDarkSecondary),
      );
    });
    test(
        'FCS8.010-deprecated: GIVEN a FlexColorScheme raw light with old '
        'variant colors input, '
        'EXPECT to find them on containers ', () {
      const FlexColorScheme fcs = FlexColorScheme(
        brightness: Brightness.light,
        primary: FlexColor.blumineBlueLightPrimary,
        primaryVariant: FlexColor.blumineBlueLightPrimaryVariant,
        secondary: FlexColor.blumineBlueLightSecondary,
        secondaryVariant: FlexColor.blumineBlueLightSecondaryVariant,
      );
      final ColorScheme fcsScheme = fcs.toScheme;
      expect(
        fcsScheme.primary,
        equals(FlexColor.blumineBlueLightPrimary),
      );
      expect(
        fcsScheme.primaryContainer,
        equals(FlexColor.blumineBlueLightPrimaryVariant),
      );
      expect(
        // ignore: deprecated_member_use
        fcsScheme.primaryVariant,
        equals(FlexColor.blumineBlueLightPrimary),
      );
      expect(
        fcsScheme.secondary,
        equals(FlexColor.blumineBlueLightSecondary),
      );
      expect(
        fcsScheme.secondaryContainer,
        equals(FlexColor.blumineBlueLightSecondaryVariant),
      );
      expect(
        // ignore: deprecated_member_use
        fcsScheme.secondaryVariant,
        equals(FlexColor.blumineBlueLightSecondary),
      );
      expect(
        fcsScheme.tertiary,
        equals(FlexColor.blumineBlueLightSecondary),
      );
      expect(
        fcsScheme.tertiaryContainer,
        equals(FlexColor.blumineBlueLightSecondary),
      );
    });
    test(
        'FCS8.011-deprecated: GIVEN a FlexColorScheme raw dark with old '
        'variant colors input, '
        'EXPECT to find them on containers ', () {
      const FlexColorScheme fcs = FlexColorScheme(
        brightness: Brightness.dark,
        primary: FlexColor.blumineBlueDarkPrimary,
        primaryVariant: FlexColor.blumineBlueDarkPrimaryVariant,
        secondary: FlexColor.blumineBlueDarkSecondary,
        secondaryVariant: FlexColor.blumineBlueDarkSecondaryVariant,
      );
      final ColorScheme fcsScheme = fcs.toScheme;
      expect(
        fcsScheme.primary,
        equals(FlexColor.blumineBlueDarkPrimary),
      );
      expect(
        fcsScheme.primaryContainer,
        equals(FlexColor.blumineBlueDarkPrimaryVariant),
      );
      expect(
        // ignore: deprecated_member_use
        fcsScheme.primaryVariant,
        equals(FlexColor.blumineBlueDarkPrimary),
      );
      expect(
        fcsScheme.secondary,
        equals(FlexColor.blumineBlueDarkSecondary),
      );
      expect(
        fcsScheme.secondaryContainer,
        equals(FlexColor.blumineBlueDarkSecondaryVariant),
      );
      expect(
        // ignore: deprecated_member_use
        fcsScheme.secondaryVariant,
        equals(FlexColor.blumineBlueDarkSecondary),
      );
      expect(
        fcsScheme.tertiary,
        equals(FlexColor.blumineBlueDarkSecondary),
      );
      expect(
        fcsScheme.tertiaryContainer,
        equals(FlexColor.blumineBlueDarkSecondary),
      );
    });
    // TODO(rydmike): Remove all the fontFamily experiments from tests too.
    // Keeping them around for a while in case I need it again, then the
    // tests are readily available.
    // test(
    //     'FCS8.012-android: GIVEN a FlexColorScheme raw with sub themes '
    //     'and using sub-theme with custom textTheme '
    //     'EXPECT target platform fontFamily.', () {
    //   const FlexColorScheme fcs = FlexColorScheme(
    //     subThemesData: FlexSubThemesData(useTextTheme: true),
    //     platform: TargetPlatform.android,
    //   );
    //   expect(
    //     fcs.toTheme.textTheme.bodyMedium!.fontFamily,
    //     equals('Roboto'),
    //   );
    // });
    // test(
    //     'FCS8.012-windows: GIVEN a FlexColorScheme raw with sub themes '
    //     'and using sub-theme with custom textTheme '
    //     'EXPECT target platform fontFamily.', () {
    //   const FlexColorScheme fcs = FlexColorScheme(
    //     subThemesData: FlexSubThemesData(useTextTheme: true),
    //     platform: TargetPlatform.windows,
    //   );
    //   expect(
    //     fcs.toTheme.textTheme.bodyMedium!.fontFamily,
    //     equals('Segoe UI'),
    //   );
    // });
    // test(
    //     'FCS8.012-iOS: GIVEN a FlexColorScheme raw with sub themes '
    //     'and using sub-theme with custom textTheme '
    //     'EXPECT target platform fontFamily.', () {
    //   const FlexColorScheme fcs = FlexColorScheme(
    //     subThemesData: FlexSubThemesData(useTextTheme: true),
    //     platform: TargetPlatform.iOS,
    //   );
    //   expect(
    //     fcs.toTheme.textTheme.bodyMedium!.fontFamily,
    //     equals('.SF UI Text'),
    //   );
    // });
    // test(
    //     'FCS8.012-macOS: GIVEN a FlexColorScheme raw with sub themes '
    //     'and using sub-theme with custom textTheme '
    //     'EXPECT target platform fontFamily.', () {
    //   const FlexColorScheme fcs = FlexColorScheme(
    //     subThemesData: FlexSubThemesData(useTextTheme: true),
    //     platform: TargetPlatform.macOS,
    //   );
    //   expect(
    //     fcs.toTheme.textTheme.bodyMedium!.fontFamily,
    //     equals('.AppleSystemUIFont'),
    //   );
    // });
    // test(
    //     'FCS8.012-linux: GIVEN a FlexColorScheme raw with sub themes '
    //     'and using sub-theme with custom textTheme '
    //     'EXPECT target platform fontFamily.', () {
    //   const FlexColorScheme fcs = FlexColorScheme(
    //     subThemesData: FlexSubThemesData(useTextTheme: true),
    //     platform: TargetPlatform.linux,
    //   );
    //   expect(
    //     fcs.toTheme.textTheme.bodyMedium!.fontFamily,
    //     equals('Roboto'),
    //   );
    // });
    // test(
    //     'FCS8.012-fuchsia: GIVEN a FlexColorScheme raw with sub themes '
    //     'and using sub-theme with custom textTheme '
    //     'EXPECT target platform fontFamily.', () {
    //   const FlexColorScheme fcs = FlexColorScheme(
    //     subThemesData: FlexSubThemesData(useTextTheme: true),
    //     platform: TargetPlatform.fuchsia,
    //   );
    //   expect(
    //     fcs.toTheme.textTheme.bodyMedium!.fontFamily,
    //     equals('Roboto'),
    //   );
    // });
  });
}
