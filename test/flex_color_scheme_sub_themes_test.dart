import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

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
          // TODO(rydmike): Commented as part of deprecation of blendTextTheme.
          // blendTextTheme: true,
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
        fcs.toTheme.tabBarTheme.indicatorColor,
        equals(fcs.toTheme.colorScheme.inversePrimary),
      );
      expect(
        fcs.toTheme.tabBarTheme.labelColor,
        equals(fcs.toTheme.colorScheme.onSurfaceVariant),
      );
      // We get fixed blend color for blended TextTheme in light mode.
      // It is more blended than the onSurface color in light mode, when
      // onSurface is max blended.
      // Oct 15, 2024: Since blendTextTheme is deprecated, this test is: false
      expect(
        fcsScheme.onSurface.red8bit >
            fcs.toTheme.textTheme.displayLarge!.color!.red8bit,
        equals(false),
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
          // TODO(rydmike): Commented as part of deprecation of blendTextTheme.
          // blendTextTheme: true,
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
        fcs.toTheme.tabBarTheme.indicatorColor,
        equals(fcs.toTheme.colorScheme.inversePrimary),
      );
      expect(
        fcs.toTheme.tabBarTheme.labelColor,
        equals(fcs.toTheme.colorScheme.onSurfaceVariant),
      );
      // We get fixed blend color for blended TextTheme in dark mode.
      // It is less blended than the onSurface color in dark mode, when
      // onSurface is max blended.
      // Oct 15, 2024: Since blendTextTheme is deprecated, this test is: false
      expect(
        fcsScheme.onSurface.red8bit <
            fcs.toTheme.textTheme.displayLarge!.color!.red8bit,
        equals(false),
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
          // TODO(rydmike): Commented as part of deprecation of blendTextTheme.
          // blendTextTheme: true,
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
        fcs.toTheme.tabBarTheme.indicatorColor,
        equals(fcs.toTheme.colorScheme.inversePrimary),
      );
      expect(
        fcs.toTheme.tabBarTheme.labelColor,
        equals(fcs.toTheme.colorScheme.onSurfaceVariant),
      );
      // We get onSurface as blend color for blended TextTheme
      expect(
        fcsScheme.onSurface.red8bit <= fcsScheme.onSurface.red8bit,
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
          // TODO(rydmike): Commented as part of deprecation of blendTextTheme.
          // blendTextTheme: true,
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
        fcs.toTheme.tabBarTheme.indicatorColor,
        equals(fcs.toTheme.colorScheme.inversePrimary),
      );
      expect(
        fcs.toTheme.tabBarTheme.labelColor,
        equals(fcs.toTheme.colorScheme.onSurfaceVariant),
      );
      // We get onSurface as blend color for blended TextTheme
      expect(
        fcsScheme.onSurface.red8bit >= fcsScheme.onSurface.red8bit,
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
          // TODO(rydmike): Commented as part of deprecation of blendTextTheme.
          // blendTextTheme: true,
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
          // TODO(rydmike): Commented as part of deprecation of blendTextTheme.
          // blendTextTheme: true,
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
          // TODO(rydmike): Commented as part of deprecation of blendTextTheme.
          // blendTextTheme: true,
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
          // TODO(rydmike): Commented as part of deprecation of blendTextTheme.
          // blendTextTheme: true,
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
          // TODO(rydmike): Commented as part of deprecation of blendTextTheme.
          // blendTextTheme: true,
          blendOnColors: true,
          blendOnLevel: 25,
        ),
      );
      final ColorScheme fcsScheme = fcs.toScheme;
      final ThemeData fcsTheme = fcs.toTheme;
      expect(
        fcsTheme.navigationRailTheme.indicatorColor,
        isSameColorAs(fcsScheme.onTertiary.withValues(alpha: 0.5)),
      );
      expect(
        fcsTheme.navigationBarTheme.indicatorColor,
        isSameColorAs(fcsScheme.primaryContainer.withValues(alpha: 0.8)),
      );
    });
    //
    // Version 7.2 new TextSelectionTheme
    //
    test(
        'FCS8.007-light: GIVEN a FlexColorScheme.light with sub themes '
        'using text selection props '
        'EXPECT sub-theme with given properties. ', () {
      final FlexColorScheme fcs = FlexColorScheme.light(
        scheme: FlexScheme.flutterDash,
        subThemesData: const FlexSubThemesData(
          inputCursorSchemeColor: null,
          inputSelectionSchemeColor: null,
          inputSelectionOpacity: null,
          inputSelectionHandleSchemeColor: null,
        ),
      );
      final ColorScheme fcsScheme = fcs.toScheme;
      final ThemeData fcsTheme = fcs.toTheme;
      expect(
        fcsTheme.textSelectionTheme.cursorColor,
        equals(fcsScheme.primary),
      );
      expect(
        fcsTheme.textSelectionTheme.selectionColor,
        isSameColorAs(fcsScheme.primary.withValues(alpha: 0.3)),
      );
      expect(
        fcsTheme.textSelectionTheme.selectionHandleColor,
        isSameColorAs(fcsScheme.primary),
      );
    });
    test(
        'FCS8.008-dark: GIVEN a FlexColorScheme.dark with sub themes '
        'using text selection props '
        'EXPECT sub-theme with given properties. ', () {
      final FlexColorScheme fcs = FlexColorScheme.dark(
        scheme: FlexScheme.flutterDash,
        subThemesData: const FlexSubThemesData(
          inputCursorSchemeColor: null,
          inputSelectionSchemeColor: null,
          inputSelectionOpacity: null,
          inputSelectionHandleSchemeColor: null,
        ),
      );
      final ColorScheme fcsScheme = fcs.toScheme;
      final ThemeData fcsTheme = fcs.toTheme;
      expect(
        fcsTheme.textSelectionTheme.cursorColor,
        isSameColorAs(fcsScheme.primary),
      );
      expect(
        fcsTheme.textSelectionTheme.selectionColor,
        isSameColorAs(fcsScheme.primary.withValues(alpha: 0.5)),
      );
      expect(
        fcsTheme.textSelectionTheme.selectionHandleColor,
        isSameColorAs(fcsScheme.primary),
      );
    });
    test(
        'FCS8.009-light: GIVEN a FlexColorScheme.light with sub themes '
        'using text selection props input selection color props '
        'EXPECT sub-theme with given properties. ', () {
      final FlexColorScheme fcs = FlexColorScheme.light(
        scheme: FlexScheme.flutterDash,
        subThemesData: const FlexSubThemesData(
          inputDecoratorSchemeColor: SchemeColor.tertiary,
          inputCursorSchemeColor: null,
          inputSelectionSchemeColor: null,
          inputSelectionOpacity: null,
          inputSelectionHandleSchemeColor: null,
        ),
      );
      final ColorScheme fcsScheme = fcs.toScheme;
      final ThemeData fcsTheme = fcs.toTheme;
      expect(
        fcsTheme.textSelectionTheme.cursorColor,
        isSameColorAs(fcsScheme.tertiary),
      );
      expect(
        fcsTheme.textSelectionTheme.selectionColor,
        isSameColorAs(fcsScheme.tertiary.withValues(alpha: 0.3)),
      );
      expect(
        fcsTheme.textSelectionTheme.selectionHandleColor,
        isSameColorAs(fcsScheme.tertiary),
      );
    });
    test(
        'FCS8.010-dark: GIVEN a FlexColorScheme.dark with sub themes '
        'using text selection props input selection color props '
        'EXPECT sub-theme with given properties. ', () {
      final FlexColorScheme fcs = FlexColorScheme.dark(
        scheme: FlexScheme.flutterDash,
        subThemesData: const FlexSubThemesData(
          inputDecoratorSchemeColor: SchemeColor.tertiary,
          inputCursorSchemeColor: SchemeColor.secondary,
          inputSelectionSchemeColor: SchemeColor.onPrimaryContainer,
          inputSelectionOpacity: 0.35,
          inputSelectionHandleSchemeColor: SchemeColor.onTertiaryContainer,
        ),
      );
      final ColorScheme fcsScheme = fcs.toScheme;
      final ThemeData fcsTheme = fcs.toTheme;
      expect(
        fcsTheme.textSelectionTheme.cursorColor,
        isSameColorAs(fcsScheme.secondary),
      );
      expect(
        fcsTheme.textSelectionTheme.selectionColor,
        isSameColorAs(fcsScheme.onPrimaryContainer.withValues(alpha: 0.35)),
      );
      expect(
        fcsTheme.textSelectionTheme.selectionHandleColor,
        isSameColorAs(fcsScheme.onTertiaryContainer),
      );
    });
    //
    test(
        'FCS8.011-light: GIVEN a FlexColorScheme.light with sub themes '
        'using adaptive dialog radius on desktop '
        'EXPECT sub-theme dialog with given desktop radius on Windows. ', () {
      debugDefaultTargetPlatformOverride = TargetPlatform.windows;
      final FlexColorScheme fcs = FlexColorScheme.light(
        scheme: FlexScheme.flutterDash,
        subThemesData: const FlexSubThemesData(
          dialogRadius: 20,
          adaptiveDialogRadius: FlexAdaptive.desktop(),
          dialogRadiusAdaptive: 10,
        ),
      );
      final ThemeData fcsTheme = fcs.toTheme;
      expect(
        fcsTheme.dialogTheme.shape,
        equals(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      );
    });
    test(
        'FCS8.012-light: GIVEN a FlexColorScheme.light with sub themes '
        'using adaptive dialog radius on desktop '
        'EXPECT sub-theme dialog with given none adaptive radius. ', () {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      final FlexColorScheme fcs = FlexColorScheme.light(
        scheme: FlexScheme.flutterDash,
        subThemesData: const FlexSubThemesData(
          dialogRadius: 20,
          adaptiveDialogRadius: FlexAdaptive.desktop(),
          dialogRadiusAdaptive: 10,
        ),
      );
      final ThemeData fcsTheme = fcs.toTheme;
      expect(
        fcsTheme.dialogTheme.shape,
        equals(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      );
    });
    //
    test(
        'FCS8.013-light: GIVEN a FlexColorScheme.light with sub themes '
        'using adaptive splash on Apple devices '
        'EXPECT sub-theme splash with given splash on Apple device.', () {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      final FlexColorScheme fcs = FlexColorScheme.light(
        scheme: FlexScheme.flutterDash,
        subThemesData: const FlexSubThemesData(
          splashType: FlexSplashType.inkRipple,
          adaptiveSplash: FlexAdaptive.apple(),
          splashTypeAdaptive: FlexSplashType.instantSplash,
        ),
      );
      final ThemeData fcsTheme = fcs.toTheme;
      expect(
        fcsTheme.splashFactory.toString(),
        "Instance of '_InstantSplashFactory'",
      );
    });
    test(
        'FCS8.014-light: GIVEN a FlexColorScheme.light with sub themes '
        'using adaptive splash on Android devices '
        'EXPECT sub-theme splash with given none adaptive splash.', () {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      final FlexColorScheme fcs = FlexColorScheme.light(
        scheme: FlexScheme.flutterDash,
        subThemesData: const FlexSubThemesData(
          splashType: FlexSplashType.inkRipple,
          adaptiveSplash: FlexAdaptive.apple(),
          splashTypeAdaptive: FlexSplashType.instantSplash,
        ),
      );
      final ThemeData fcsTheme = fcs.toTheme;
      expect(
        fcsTheme.splashFactory.toString(),
        "Instance of '_InkRippleFactory'",
      );
    });
    // Tests for issue https://github.com/rydmike/flex_color_scheme/issues/198
    test(
        'FCS8.015-prim: GIVEN a FlexColorScheme.light with sub themes '
        'using primary appbar background color, using seed generation '
        'and locking primary to source primary color '
        'EXPECT expect AppBar to be primary colored.', () {
      final FlexColorScheme fcs = FlexColorScheme.light(
        scheme: FlexScheme.flutterDash,
        subThemesData: const FlexSubThemesData(
          appBarBackgroundSchemeColor: SchemeColor.primary,
        ),
        keyColors: const FlexKeyColors(
          keepPrimary: true,
        ),
      );
      final ThemeData fcsTheme = fcs.toTheme;
      final ColorScheme scheme = fcs.toScheme;
      const Color sourceColor = FlexColor.dashBlueLightPrimary;
      final Color targetColor = scheme.primary;
      final Color? appBarColor = fcsTheme.appBarTheme.backgroundColor;
      // Expect primary color to be source blue color.
      expect(sourceColor, equals(targetColor));
      // Expect appBar color to be source blue color.
      expect(appBarColor, equals(targetColor));
    });
    test(
        'FCS8.015-sec: GIVEN a FlexColorScheme.light with sub themes '
        'using secondary appbar background color, using seed generation '
        'and locking secondary to source secondary color '
        'EXPECT expect AppBar to be secondary colored.', () {
      final FlexColorScheme fcs = FlexColorScheme.light(
        scheme: FlexScheme.flutterDash,
        subThemesData: const FlexSubThemesData(
          appBarBackgroundSchemeColor: SchemeColor.secondary,
        ),
        keyColors: const FlexKeyColors(
          useSecondary: true,
          keepSecondary: true,
        ),
      );
      final ThemeData fcsTheme = fcs.toTheme;
      final ColorScheme scheme = fcs.toScheme;
      const Color sourceColor = FlexColor.dashBlueLightSecondary;
      final Color targetColor = scheme.secondary;
      final Color? appBarColor = fcsTheme.appBarTheme.backgroundColor;
      // Expect secondary color to be source blue color.
      expect(sourceColor, equals(targetColor));
      // Expect appBar color to be source blue color.
      expect(appBarColor, equals(targetColor));
    });
    test(
        'FCS8.015-tert: GIVEN a FlexColorScheme.light with sub themes '
        'using tertiary appbar background color, using seed generation '
        'and locking tertiary to source tertiary color '
        'EXPECT expect AppBar to be tertiary colored.', () {
      final FlexColorScheme fcs = FlexColorScheme.light(
        scheme: FlexScheme.flutterDash,
        subThemesData: const FlexSubThemesData(
          appBarBackgroundSchemeColor: SchemeColor.tertiary,
        ),
        keyColors: const FlexKeyColors(
          useTertiary: true,
          keepTertiary: true,
        ),
      );
      final ThemeData fcsTheme = fcs.toTheme;
      final ColorScheme scheme = fcs.toScheme;
      const Color sourceColor = FlexColor.dashBlueLightTertiary;
      final Color targetColor = scheme.tertiary;
      final Color? appBarColor = fcsTheme.appBarTheme.backgroundColor;
      // Expect secondary color to be source blue color.
      expect(sourceColor, equals(targetColor));
      // Expect appBar color to be source blue color.
      expect(appBarColor, equals(targetColor));
    });
    test(
        'FCS8.016-prim: GIVEN a FlexColorScheme.dark with sub themes '
        'using primary appbar background color, using seed generation '
        'and locking primary to source primary color '
        'EXPECT expect AppBar to be primary colored.', () {
      final FlexColorScheme fcs = FlexColorScheme.dark(
        scheme: FlexScheme.flutterDash,
        subThemesData: const FlexSubThemesData(
          appBarBackgroundSchemeColor: SchemeColor.primary,
        ),
        keyColors: const FlexKeyColors(
          keepPrimary: true,
        ),
      );
      final ThemeData fcsTheme = fcs.toTheme;
      final ColorScheme scheme = fcs.toScheme;
      const Color sourceColor = FlexColor.dashBlueDarkPrimary;
      final Color targetColor = scheme.primary;
      final Color? appBarColor = fcsTheme.appBarTheme.backgroundColor;
      // Expect primary color to be source blue color.
      expect(sourceColor, equals(targetColor));
      // Expect appBar color to be source blue color.
      expect(appBarColor, equals(targetColor));
    });
    test(
        'FCS8.016-sec: GIVEN a FlexColorScheme.dark with sub themes '
        'using secondary appbar background color, using seed generation '
        'and locking secondary to source secondary color '
        'EXPECT expect AppBar to be secondary colored.', () {
      final FlexColorScheme fcs = FlexColorScheme.dark(
        scheme: FlexScheme.flutterDash,
        subThemesData: const FlexSubThemesData(
          appBarBackgroundSchemeColor: SchemeColor.secondary,
        ),
        keyColors: const FlexKeyColors(
          useSecondary: true,
          keepSecondary: true,
        ),
      );
      final ThemeData fcsTheme = fcs.toTheme;
      final ColorScheme scheme = fcs.toScheme;
      const Color sourceColor = FlexColor.dashBlueDarkSecondary;
      final Color targetColor = scheme.secondary;
      final Color? appBarColor = fcsTheme.appBarTheme.backgroundColor;
      // Expect secondary color to be source blue color.
      expect(sourceColor, equals(targetColor));
      // Expect appBar color to be source blue color.
      expect(appBarColor, equals(targetColor));
    });
    test(
        'FCS8.016-tert: GIVEN a FlexColorScheme.dark with sub themes '
        'using tertiary appbar background color, using seed generation '
        'and locking tertiary to source tertiary color '
        'EXPECT expect AppBar to be tertiary colored.', () {
      final FlexColorScheme fcs = FlexColorScheme.dark(
        scheme: FlexScheme.flutterDash,
        subThemesData: const FlexSubThemesData(
          appBarBackgroundSchemeColor: SchemeColor.tertiary,
        ),
        keyColors: const FlexKeyColors(
          useTertiary: true,
          keepTertiary: true,
        ),
      );
      final ThemeData fcsTheme = fcs.toTheme;
      final ColorScheme scheme = fcs.toScheme;
      const Color sourceColor = FlexColor.dashBlueDarkTertiary;
      final Color targetColor = scheme.tertiary;
      final Color? appBarColor = fcsTheme.appBarTheme.backgroundColor;
      // Expect secondary color to be source blue color.
      expect(sourceColor, equals(targetColor));
      // Expect appBar color to be source blue color.
      expect(appBarColor, equals(targetColor));
    });
  });
}
