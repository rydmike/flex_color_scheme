import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: avoid_redundant_argument_values

void main() {
  //****************************************************************************
  // FlexColorScheme unit tests.
  //
  // Basic object tests, equality, none equal, copyWith. Factory creation
  // same result as matching one with default constructor.
  //****************************************************************************
  group('FCS1: WITH FlexColorScheme ', () {
    debugDefaultTargetPlatformOverride = null;

    final FlexSchemeColor sc =
        FlexSchemeColor.from(primary: FlexColor.materialLightPrimary);

    final FlexColorScheme fc1 = FlexColorScheme.light(
      usedColors: 1,
      surfaceStyle: FlexSurface.medium,
      appBarStyle: FlexAppBarStyle.background,
      tabBarStyle: FlexTabBarStyle.forBackground,
      tooltipsMatchBackground: true,
      transparentStatusBar: false,
    );
    final FlexColorScheme fc1i = FlexColorScheme.light(
      scheme: FlexScheme.material,
      usedColors: 1,
      surfaceStyle: FlexSurface.medium,
      appBarStyle: FlexAppBarStyle.background,
      tabBarStyle: FlexTabBarStyle.forBackground,
      tooltipsMatchBackground: true,
      transparentStatusBar: false,
    );
    test(
        'FCS1.00j1: GIVEN a FlexColorScheme.light with null colors and null '
        'scheme EXPECT FlexColorScheme.light with scheme Material.', () {
      expect(fc1, equals(fc1i));
      // Expect toTheme from them to full-fill same condition.
      expect(fc1.toTheme, equals(fc1i.toTheme));
    });

    final FlexColorScheme fc2 = FlexColorScheme.light(
      colors: sc,
      scheme: FlexScheme.materialHc,
      usedColors: 1,
      surfaceStyle: FlexSurface.medium,
      appBarStyle: FlexAppBarStyle.background,
      tabBarStyle: FlexTabBarStyle.forBackground,
      tooltipsMatchBackground: true,
      transparentStatusBar: false,
      useSubThemes: true,
    );
    final FlexColorScheme fc2i = FlexColorScheme.light(
      colors: sc,
      usedColors: 1,
      surfaceStyle: FlexSurface.medium,
      appBarStyle: FlexAppBarStyle.background,
      tabBarStyle: FlexTabBarStyle.forBackground,
      tooltipsMatchBackground: true,
      transparentStatusBar: false,
      useSubThemes: true,
    );
    test(
        'FCS1.00j2: GIVEN a FlexColorScheme.light with colors sc and given '
        'scheme EXPECT FlexColorScheme.light with colors sc and null scheme.',
        () {
      expect(fc2, equals(fc2i));
      // Expect toTheme from theme to full-fill same condition.
      // TODO(rydmike): SDK ThemeData operator issue, fix in master!
      // https://github.com/flutter/flutter/issues/91587
      // If we run this test with just equals on the two objects, it fails!
      // but with this toString comparison and ignoring hashcodes, it works!
      // Why?
      expect(
        fc2.toTheme.toString(),
        equalsIgnoringHashCodes(
          fc2i.toTheme.toString(),
        ),
      );
    });

    final FlexColorScheme fc3 = FlexColorScheme.dark(
      usedColors: 1,
      surfaceStyle: FlexSurface.medium,
      appBarStyle: FlexAppBarStyle.background,
      tabBarStyle: FlexTabBarStyle.forBackground,
      tooltipsMatchBackground: true,
      transparentStatusBar: false,
      useSubThemes: true,
    );
    final FlexColorScheme fc3i = FlexColorScheme.dark(
      scheme: FlexScheme.material,
      usedColors: 1,
      surfaceStyle: FlexSurface.medium,
      appBarStyle: FlexAppBarStyle.background,
      tabBarStyle: FlexTabBarStyle.forBackground,
      tooltipsMatchBackground: true,
      transparentStatusBar: false,
      useSubThemes: true,
    );
    test(
        'FCS1.00q1: GIVEN a FlexColorScheme.dark with null colors and null '
        'scheme EXPECT FlexColorScheme.dark with scheme Material.', () {
      expect(fc3, equals(fc3i));
      // Expect toTheme from them to full-fill same condition.
      // TODO(rydmike): SDK ThemeData operator issue, fix in master!
      // https://github.com/flutter/flutter/issues/91587
      // If we run this test with just equals on the two objects, it fails!
      // but with this toString comparison and ignoring hashcodes, it works!
      // Why? ->
      expect(
        fc3.toTheme.toString(),
        equalsIgnoringHashCodes(
          fc3i.toTheme.toString(),
        ),
      );
    });

    final FlexColorScheme fc4 = FlexColorScheme.dark(
      colors: sc,
      scheme: FlexScheme.materialHc,
      usedColors: 1,
      surfaceStyle: FlexSurface.medium,
      appBarStyle: FlexAppBarStyle.background,
      tabBarStyle: FlexTabBarStyle.forBackground,
      tooltipsMatchBackground: true,
      transparentStatusBar: false,
    );
    final FlexColorScheme fc4i = FlexColorScheme.dark(
      colors: sc,
      usedColors: 1,
      surfaceStyle: FlexSurface.medium,
      appBarStyle: FlexAppBarStyle.background,
      tabBarStyle: FlexTabBarStyle.forBackground,
      tooltipsMatchBackground: true,
      transparentStatusBar: false,
    );
    test(
        'FCS1.00q2: GIVEN a FlexColorScheme.dark with colors sc and given '
        'scheme EXPECT FlexColorScheme.dark with colors sc and null scheme.',
        () {
      expect(fc4, equals(fc4i));
      // Expect toTheme from them to full-fill same condition.
      expect(fc4.toTheme, equals(fc4i.toTheme));
    });
    // m1 = Default material light scheme colors.
    const FlexColorScheme m1 = FlexColorScheme(
      brightness: Brightness.light,
      primary: FlexColor.materialLightPrimary,
      primaryVariant: FlexColor.materialLightPrimaryVariant,
      secondary: FlexColor.materialLightSecondary,
      secondaryVariant: FlexColor.materialLightSecondaryVariant,
    );
    // m2, same definition as m1.
    const FlexColorScheme m2 = FlexColorScheme(
      brightness: Brightness.light,
      primary: FlexColor.materialLightPrimary,
      primaryVariant: FlexColor.materialLightPrimaryVariant,
      secondary: FlexColor.materialLightSecondary,
      secondaryVariant: FlexColor.materialLightSecondaryVariant,
    );
    // m3, one different values than m1 and m2.
    const FlexColorScheme m3 = FlexColorScheme(
      brightness: Brightness.light,
      primary: FlexColor.materialLightPrimary,
      primaryVariant: FlexColor.materialLightPrimary, // Differs from m1 and m2.
      secondary: FlexColor.materialLightSecondary,
      secondaryVariant: FlexColor.materialLightSecondaryVariant,
    );
    // m4, all values different from m1 and m2.
    const FlexColorScheme m4 = FlexColorScheme(
      brightness: Brightness.dark,
      primary: FlexColor.materialDarkPrimary,
      primaryVariant: FlexColor.materialDarkPrimaryVariant,
      secondary: FlexColor.materialDarkSecondary,
      secondaryVariant: FlexColor.materialDarkSecondaryVariant,
    );

    // Identity and equality tests

    test(
        'FCS1.01a: GIVEN the same FlexColorScheme objects '
        'EXPECT them to have equality', () {
      expect(m1, equals(m1));
      // Expect toTheme from them to full-fill same condition.
      expect(m1.toTheme, equals(m1.toTheme));
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
      expect(m1.toTheme, equals(m2.toTheme));
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
      // Expect toTheme from them to full-fill same condition.
      expect(m1.toTheme == m2.toTheme, true);
    });
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
      primaryVariant: FlexColor.materialLightPrimaryVariant,
      secondary: FlexColor.materialLightSecondary,
      secondaryVariant: FlexColor.materialLightSecondaryVariant,
    );
    test(
        'FCS1.03a: GIVEN a FlexColorScheme object EXPECT it to be '
        'equal to an unequal object when made equal with copyWith.', () {
      expect(m1e1, equals(m1));
      // Expect toTheme from them to full-fill same condition.
      expect(m1e1.toTheme, equals(m1.toTheme));
    });
    test(
        'FCS1.03b: GIVEN a FlexColorScheme object EXPECT it to be '
        'unchanged after an empty .copyWith().', () {
      expect(m4.copyWith(), m4);
      // Expect toTheme from them to full-fill same condition.
      expect(m4.copyWith().toTheme, equals(m4.toTheme));
    });

    const FlexColorScheme m1e2 = FlexColorScheme(
      brightness: Brightness.light,
      primary: FlexColor.materialLightPrimary,
      primaryVariant: FlexColor.materialLightPrimaryVariant,
      secondary: FlexColor.materialLightSecondary,
      secondaryVariant: FlexColor.materialLightSecondaryVariant,
      surface: FlexColor.materialLightSurface,
      background: FlexColor.materialLightBackground,
      error: FlexColor.materialLightError,
      scaffoldBackground: FlexColor.materialLightBackground,
      appBarBackground: FlexColor.materialLightPrimary,
      dialogBackground: FlexColor.materialLightBackground,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.black,
      onBackground: Colors.black,
      onError: Colors.white,
    );
    test(
        'FCS1.04a: GIVEN a FlexColorScheme.light created object '
        'EXPECT equality when made by matching default constructor.', () {
      expect(FlexColorScheme.light(), equals(m1e2));
      // Expect toTheme from them to full-fill same condition.
      expect(
        FlexColorScheme.light().toTheme,
        equals(m1e2.toTheme),
      );
    });

    test(
        'FCS1.04b: GIVEN a FlexColorScheme.light created object with colors  '
        'EXPECT equality when made by matching default constructor.', () {
      expect(
        FlexColorScheme.light(colors: FlexColor.material.light),
        equals(m1e2),
      );
      // Expect toTheme from them to full-fill same condition.
      expect(
        FlexColorScheme.light(colors: FlexColor.material.light).toTheme,
        equals(m1e2.toTheme),
      );
    });

    test(
        'FCS1.04c: GIVEN a FlexColorScheme.light created object with colors '
        'map EXPECT equality when made by matching default constructor.', () {
      expect(
        FlexColorScheme.light(
            colors: FlexColor.schemes[FlexScheme.material]!.light),
        m1e2,
      );
      // Expect toTheme from them to full-fill same condition.
      expect(
        FlexColorScheme.light(
                colors: FlexColor.schemes[FlexScheme.material]!.light)
            .toTheme,
        equals(m1e2.toTheme),
      );
    });

    test(
        'FCS1.04d: GIVEN a FlexColorScheme.light created object with colors  '
        'EXPECT equality when made by matching mode factory constructor.', () {
      expect(
        FlexColorScheme.light(
          surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
          blendLevel: 0,
        ),
        equals(m1e2),
      );
      // Expect toTheme from them to full-fill same condition.
      expect(
        FlexColorScheme.light(
          surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
          blendLevel: 0,
        ).toTheme,
        equals(m1e2.toTheme),
      );
    });

    const FlexColorScheme m1e3 = FlexColorScheme(
      brightness: Brightness.dark,
      primary: FlexColor.materialDarkPrimary,
      primaryVariant: FlexColor.materialDarkPrimaryVariant,
      secondary: FlexColor.materialDarkSecondary,
      secondaryVariant: FlexColor.materialDarkSecondaryVariant,
      surface: FlexColor.materialDarkSurface,
      background: FlexColor.materialDarkBackground,
      error: FlexColor.materialDarkError,
      scaffoldBackground: FlexColor.materialDarkBackground,
      appBarBackground: FlexColor.materialDarkSurface,
      dialogBackground: FlexColor.materialDarkBackground,
      onPrimary: Colors.black,
      onSecondary: Colors.black,
      onSurface: Colors.white,
      onBackground: Colors.white,
      onError: Colors.white,
    );
    test(
        'FCS1.05a: GIVEN a FlexColorScheme.dark created object '
        'EXPECT equality when made by matching default constructor.', () {
      expect(
        FlexColorScheme.dark(),
        equals(m1e3),
      );
      // Expect toTheme from them to full-fill same condition.
      expect(
        FlexColorScheme.dark().toTheme,
        equals(m1e3.toTheme),
      );
    });
    test(
        'FCS1.05b: GIVEN a FlexColorScheme.dark created object with colors '
        'EXPECT equality when made by matching default constructor.', () {
      expect(
        FlexColorScheme.dark(
          colors: FlexColor.material.dark,
        ),
        equals(m1e3),
      );
      // Expect toTheme from them to full-fill same condition.
      expect(
        FlexColorScheme.dark(
          colors: FlexColor.material.dark,
        ).toTheme,
        equals(m1e3.toTheme),
      );
    });
    test(
        'FCS1.05cb: GIVEN a FlexColorScheme.dark created object with colors '
        'map EXPECT equality when made by matching default constructor.', () {
      expect(
        FlexColorScheme.dark(
          colors: FlexColor.schemes[FlexScheme.material]!.dark,
        ),
        m1e3,
      );
      // Expect toTheme from them to full-fill same condition.
      expect(
        FlexColorScheme.dark(
          colors: FlexColor.schemes[FlexScheme.material]!.dark,
        ).toTheme,
        equals(m1e3.toTheme),
      );
    });

    test(
        'FCS1.05d: GIVEN a FlexColorScheme.dark created object with colors  '
        'EXPECT equality when made by matching mode factory constructor.', () {
      expect(
          FlexColorScheme.dark(
            surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
            blendLevel: 0,
          ),
          m1e3);
      // Expect toTheme from them to full-fill same condition.
      expect(
        FlexColorScheme.dark(
          surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
          blendLevel: 0,
        ).toTheme,
        equals(m1e3.toTheme),
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
      primaryVariant: FlexColor.materialLightPrimaryVariant,
      secondary: FlexColor.materialLightSecondary,
      secondaryVariant: FlexColor.materialLightSecondaryVariant,
      surface: FlexColor.materialLightSurface,
      background: FlexColor.materialLightBackground,
      error: FlexColor.materialLightError,
      scaffoldBackground: FlexColor.materialLightBackground,
      appBarBackground: FlexColor.materialLightPrimary,
      dialogBackground: FlexColor.materialLightBackground,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.black,
      onBackground: Colors.black,
      onError: Colors.white,
      tabBarStyle: FlexTabBarStyle.forAppBar,
      appBarElevation: 1,
      bottomAppBarElevation: 2,
      tooltipsMatchBackground: true,
      transparentStatusBar: false,
      visualDensity: VisualDensity.standard,
      textTheme: const TextTheme(headline1: TextStyle(fontSize: 80)),
      primaryTextTheme: const TextTheme(headline1: TextStyle(fontSize: 80)),
      fontFamily: 'Roboto',
      platform: TargetPlatform.android,
      typography: Typography.material2018(),
      applyElevationOverlayColor: false,
      useSubThemes: true,
      subThemesData: const FlexSubThemesData(defaultRadius: 20),
    );

    final FlexColorScheme m5copy = FlexColorScheme(
      brightness: Brightness.light,
      primary: FlexColor.materialLightPrimary,
      primaryVariant: FlexColor.materialLightPrimaryVariant,
      secondary: FlexColor.materialLightSecondary,
      secondaryVariant: FlexColor.materialLightSecondaryVariant,
      surface: FlexColor.materialLightSurface,
      background: FlexColor.materialLightBackground,
      error: FlexColor.materialLightError,
      scaffoldBackground: FlexColor.materialLightBackground,
      appBarBackground: FlexColor.materialLightPrimary,
      dialogBackground: FlexColor.materialLightBackground,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.black,
      onBackground: Colors.black,
      onError: Colors.white,
      tabBarStyle: FlexTabBarStyle.forAppBar,
      appBarElevation: 1,
      bottomAppBarElevation: 2,
      tooltipsMatchBackground: true,
      transparentStatusBar: false,
      visualDensity: VisualDensity.standard,
      textTheme: const TextTheme(headline1: TextStyle(fontSize: 80)),
      primaryTextTheme: const TextTheme(headline1: TextStyle(fontSize: 80)),
      fontFamily: 'RobotoX', // <- This is different
      platform: TargetPlatform.android,
      typography: Typography.material2018(),
      applyElevationOverlayColor: false,
      useSubThemes: true,
      subThemesData: const FlexSubThemesData(defaultRadius: 20),
    );

    test(
        'FCS1.06-CopyWith: Test copyWith on complex object '
        'EXPECT equal when fixing un-equal value', () {
      expect(m5, equals(m5copy.copyWith(fontFamily: 'Roboto')));
    });

    test(
        'FCS1.06a: Test toString implemented via debugFillProperties '
        'EXPECT some kind of working data print.', () {
      expect(m5.toString().length, greaterThan(15));
    });

    test(
        'FCS1.06b Test toString implemented via debugFillProperties '
        'EXPECT exact print string.', () {
      expect(
          m5.toString(),
          // ignore: lines_longer_than_80_chars
          equalsIgnoringHashCodes(
              // ignore: lines_longer_than_80_chars
              'FlexColorScheme#00000(brightness: light, primary: Color(0xff6200ee), primaryVariant: Color(0xff3700b3), secondary: Color(0xff03dac6), secondaryVariant: Color(0xff018786), surface: Color(0xffffffff), background: Color(0xffffffff), error: Color(0xffb00020), scaffoldBackground: Color(0xffffffff), appBarBackground: Color(0xff6200ee), dialogBackground: Color(0xffffffff), onPrimary: Color(0xffffffff), onSecondary: Color(0xff000000), onSurface: Color(0xff000000), onBackground: Color(0xff000000), onError: Color(0xffffffff), tabBarStyle: forAppBar, appBarElevation: 1.0, bottomAppBarElevation: 2.0, tooltipsMatchBackground: true, transparentStatusBar: false, visualDensity: 0, v: 0.0), textTheme: TextTheme#00000(headline1: TextStyle(inherit: true, size: 80.0), headline2: null, headline3: null, headline4: null, headline5: null, headline6: null, subtitle1: null, subtitle2: null, bodyText1: null, bodyText2: null, caption: null, button: null, overline: null), primaryTextTheme: TextTheme#00000(headline1: TextStyle(inherit: true, size: 80.0), headline2: null, headline3: null, headline4: null, headline5: null, headline6: null, subtitle1: null, subtitle2: null, bodyText1: null, bodyText2: null, caption: null, button: null, overline: null), fontFamily: Roboto, platform: android, typography: Typography#00000(englishLike: TextTheme#00000(headline1: TextStyle(debugLabel: englishLike headline1 2018, inherit: true, size: 96.0, weight: 300, letterSpacing: -1.5, baseline: alphabetic), headline2: TextStyle(debugLabel: englishLike headline2 2018, inherit: true, size: 60.0, weight: 300, letterSpacing: -0.5, baseline: alphabetic), headline3: TextStyle(debugLabel: englishLike headline3 2018, inherit: true, size: 48.0, weight: 400, letterSpacing: 0.0, baseline: alphabetic), headline4: TextStyle(debugLabel: englishLike headline4 2018, inherit: true, size: 34.0, weight: 400, letterSpacing: 0.3, baseline: alphabetic), headline5: TextStyle(debugLabel: englishLike headline5 2018, inherit: true, size: 24.0, weight: 400, letterSpacing: 0.0, baseline: alphabetic), headline6: TextStyle(debugLabel: englishLike headline6 2018, inherit: true, size: 20.0, weight: 500, letterSpacing: 0.1, baseline: alphabetic), subtitle1: TextStyle(debugLabel: englishLike subtitle1 2018, inherit: true, size: 16.0, weight: 400, letterSpacing: 0.1, baseline: alphabetic), subtitle2: TextStyle(debugLabel: englishLike subtitle2 2018, inherit: true, size: 14.0, weight: 500, letterSpacing: 0.1, baseline: alphabetic), bodyText1: TextStyle(debugLabel: englishLike bodyText1 2018, inherit: true, size: 16.0, weight: 400, letterSpacing: 0.5, baseline: alphabetic), bodyText2: TextStyle(debugLabel: englishLike bodyText2 2018, inherit: true, size: 14.0, weight: 400, letterSpacing: 0.3, baseline: alphabetic), caption: TextStyle(debugLabel: englishLike caption 2018, inherit: true, size: 12.0, weight: 400, letterSpacing: 0.4, baseline: alphabetic), button: TextStyle(debugLabel: englishLike button 2018, inherit: true, size: 14.0, weight: 500, letterSpacing: 1.3, baseline: alphabetic), overline: TextStyle(debugLabel: englishLike overline 2018, inherit: true, size: 10.0, weight: 400, letterSpacing: 1.5, baseline: alphabetic)), dense: TextTheme#00000(headline1: TextStyle(debugLabel: dense headline1 2018, inherit: true, size: 96.0, weight: 100, baseline: ideographic), headline2: TextStyle(debugLabel: dense headline2 2018, inherit: true, size: 60.0, weight: 100, baseline: ideographic), headline3: TextStyle(debugLabel: dense headline3 2018, inherit: true, size: 48.0, weight: 400, baseline: ideographic), headline4: TextStyle(debugLabel: dense headline4 2018, inherit: true, size: 34.0, weight: 400, baseline: ideographic), headline5: TextStyle(debugLabel: dense headline5 2018, inherit: true, size: 24.0, weight: 400, baseline: ideographic), headline6: TextStyle(debugLabel: dense headline6 2018, inherit: true, size: 21.0, weight: 500, baseline: ideographic), subtitle1: TextStyle(debugLabel: dense subtitle1 2018, inherit: true, size: 17.0, weight: 400, baseline: ideographic), subtitle2: TextStyle(debugLabel: dense subtitle2 2018, inherit: true, size: 15.0, weight: 500, baseline: ideographic), bodyText1: TextStyle(debugLabel: dense bodyText1 2018, inherit: true, size: 17.0, weight: 400, baseline: ideographic), bodyText2: TextStyle(debugLabel: dense bodyText2 2018, inherit: true, size: 15.0, weight: 400, baseline: ideographic), caption: TextStyle(debugLabel: dense caption 2018, inherit: true, size: 13.0, weight: 400, baseline: ideographic), button: TextStyle(debugLabel: dense button 2018, inherit: true, size: 15.0, weight: 500, baseline: ideographic), overline: TextStyle(debugLabel: dense overline 2018, inherit: true, size: 11.0, weight: 400, baseline: ideographic)), tall: TextTheme#00000(headline1: TextStyle(debugLabel: tall headline1 2018, inherit: true, size: 96.0, weight: 400, baseline: alphabetic), headline2: TextStyle(debugLabel: tall headline2 2018, inherit: true, size: 60.0, weight: 400, baseline: alphabetic), headline3: TextStyle(debugLabel: tall headline3 2018, inherit: true, size: 48.0, weight: 400, baseline: alphabetic), headline4: TextStyle(debugLabel: tall headline4 2018, inherit: true, size: 34.0, weight: 400, baseline: alphabetic), headline5: TextStyle(debugLabel: tall headline5 2018, inherit: true, size: 24.0, weight: 400, baseline: alphabetic), headline6: TextStyle(debugLabel: tall headline6 2018, inherit: true, size: 21.0, weight: 700, baseline: alphabetic), subtitle1: TextStyle(debugLabel: tall subtitle1 2018, inherit: true, size: 17.0, weight: 400, baseline: alphabetic), subtitle2: TextStyle(debugLabel: tall subtitle2 2018, inherit: true, size: 15.0, weight: 500, baseline: alphabetic), bodyText1: TextStyle(debugLabel: tall bodyText1 2018, inherit: true, size: 17.0, weight: 700, baseline: alphabetic), bodyText2: TextStyle(debugLabel: tall bodyText2 2018, inherit: true, size: 15.0, weight: 400, baseline: alphabetic), caption: TextStyle(debugLabel: tall caption 2018, inherit: true, size: 13.0, weight: 400, baseline: alphabetic), button: TextStyle(debugLabel: tall button 2018, inherit: true, size: 15.0, weight: 700, baseline: alphabetic), overline: TextStyle(debugLabel: tall overline 2018, inherit: true, size: 11.0, weight: 400, baseline: alphabetic))), applyElevationOverlayColor: false, useSubThemes: true, subThemesData: FlexSubThemesData#00000(interactionEffects: true, blendOnColors: true, blendTextTheme: true, useTextTheme: true, defaultRadius: 20.0, buttonMinSize: Size(40.0, 40.0), buttonPadding: EdgeInsets(16.0, 0.0, 16.0, 0.0), thickBorderWidth: 2.0, thinBorderWidth: 1.5, textButtonRadius: null, elevatedButtonRadius: null, elevatedButtonElevation: 1.0, outlinedButtonRadius: null, toggleButtonsRadius: null, inputDecorationRadius: null, inputDecoratorSchemeColor: null, inputDecoratorIsFilled: true, inputDecoratorFillColor: null, inputDecoratorBorderType: outline, inputDecoratorUnfocusedHasBorder: true, fabRadius: null, fabUseShape: true, chipRadius: null, chipSchemeColor: null, cardRadius: null, cardElevation: 0.0, popupMenuRadius: null, popupMenuElevation: 3.0, popupMenuOpacity: 1.0, dialogRadius: null, dialogElevation: 10.0, timePickerDialogRadius: null, snackBarElevation: 4.0, tabBarIndicatorSchemeColor: null, bottomSheetRadius: null, bottomSheetElevation: 4.0, bottomSheetModalElevation: 8.0, bottomNavigationBarElevation: 0.0, bottomNavigationBarOpacity: 1.0, bottomNavigationBarSchemeColor: null, bottomNavigationBarBackgroundSchemeColor: null, bottomNavigationBarLandscapeLayout: null, navigationBarHeight: 62.0, navigationBarOpacity: 1.0, navigationBarIconSchemeColor: null, navigationBarIconSchemeColor: null, navigationBarHighlightSchemeColor: null, navigationBarBackgroundSchemeColor: background, navigationBarMutedUnselectedIcon: true, navigationBarMutedUnselectedText: true, navigationBarLabelBehavior: null))'));
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

    test(
        'FCS2.01: GIVEN a Material light FlexColorScheme object '
        'EXPECT toScheme to be equal to ColorScheme.light', () {
      expect(
        const FlexColorScheme(
          brightness: Brightness.light,
          primary: FlexColor.materialLightPrimary,
          primaryVariant: FlexColor.materialLightPrimaryVariant,
          secondary: FlexColor.materialLightSecondary,
          secondaryVariant: FlexColor.materialLightSecondaryVariant,
          surface: FlexColor.materialLightSurface,
          background: FlexColor.materialLightBackground,
          error: FlexColor.materialLightError,
          scaffoldBackground: FlexColor.materialLightBackground,
          appBarBackground: FlexColor.materialLightPrimary,
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onSurface: Colors.black,
          onBackground: Colors.black,
          onError: Colors.white,
        ).toScheme,
        equals(const ColorScheme.light()),
      );
    });
    test(
        'FCS2.02: GIVEN a Material dark FlexColorScheme object '
        'EXPECT toScheme to be equal to ColorScheme.dark', () {
      expect(
        const FlexColorScheme(
          brightness: Brightness.dark,
          primary: FlexColor.materialDarkPrimary,
          primaryVariant: FlexColor.materialDarkPrimaryVariant,
          secondary: FlexColor.materialDarkSecondary,
          secondaryVariant: FlexColor.materialDarkSecondaryVariant,
          surface: FlexColor.materialDarkSurface,
          background: FlexColor.materialDarkBackground,
          error: FlexColor.materialDarkError,
          scaffoldBackground: FlexColor.materialDarkBackground,
          appBarBackground: FlexColor.materialDarkSurface,
          onPrimary: Colors.black,
          onSecondary: Colors.black,
          onSurface: Colors.white,
          onBackground: Colors.white,
          onError: Colors.black,
        ).toScheme,
        equals(const ColorScheme.dark()),
      );
    });
    test(
        'FCS2.03: GIVEN a Material Hc light FlexColorScheme object '
        'EXPECT toScheme to be equal to ColorScheme.highContrastLight', () {
      expect(
        const FlexColorScheme(
          brightness: Brightness.light,
          primary: FlexColor.materialLightPrimaryHc,
          primaryVariant: FlexColor.materialLightPrimaryVariantHc,
          secondary: FlexColor.materialLightSecondaryHc,
          secondaryVariant: FlexColor.materialLightSecondaryVariantHc,
          surface: FlexColor.materialLightSurface,
          background: FlexColor.materialLightBackground,
          error: FlexColor.materialLightErrorHc,
          scaffoldBackground: FlexColor.materialLightBackground,
          appBarBackground: FlexColor.materialLightPrimaryHc,
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onSurface: Colors.black,
          onBackground: Colors.black,
          onError: Colors.white,
        ).toScheme,
        equals(const ColorScheme.highContrastLight()),
      );
    });
    test(
        'FCS2.04: GIVEN a Material Hc dark FlexColorScheme object '
        'EXPECT toScheme to be equal to ColorScheme.highContrastDark', () {
      expect(
        const FlexColorScheme(
          brightness: Brightness.dark,
          primary: FlexColor.materialDarkPrimaryHc,
          primaryVariant: FlexColor.materialDarkPrimaryVariantHc,
          secondary: FlexColor.materialDarkSecondaryHc,
          secondaryVariant: FlexColor.materialDarkSecondaryVariantHc,
          surface: FlexColor.materialDarkSurface,
          background: FlexColor.materialDarkBackground,
          error: FlexColor.materialDarkErrorHc,
          scaffoldBackground: FlexColor.materialDarkBackground,
          appBarBackground: FlexColor.materialDarkSurface,
          onPrimary: Colors.black,
          onSecondary: Colors.black,
          onSurface: Colors.white,
          onBackground: Colors.white,
          onError: Colors.black,
        ).toScheme,
        equals(const ColorScheme.highContrastDark()),
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
        Color(FlexColorScheme.createPrimarySwatch(col).value),
        equals(col),
      );
    });
    test(
        'FCS4.03: GIVEN color: $col '
        'EXPECT swatch[50] equal to Color(0xffa973f6)', () {
      expect(
        FlexColorScheme.createPrimarySwatch(col)[50],
        equals(const Color(0xffa973f6)),
      );
    });
    test(
        'FCS4.04: GIVEN color: $col '
        'EXPECT swatch[100] equal to Color(0xffa166f5)', () {
      expect(
        FlexColorScheme.createPrimarySwatch(col)[100],
        equals(const Color(0xffa166f5)),
      );
    });
    test(
        'FCS4.05: GIVEN color: $col '
        'EXPECT swatch[200] equal to Color(0xff914df3)', () {
      expect(
        FlexColorScheme.createPrimarySwatch(col)[200],
        equals(const Color(0xff914df3)),
      );
    });
    test(
        'FCS4.06: GIVEN color: $col '
        'EXPECT swatch[300] equal to Color(0xff8133f1)', () {
      expect(
        FlexColorScheme.createPrimarySwatch(col)[300],
        equals(const Color(0xff8133f1)),
      );
    });
    test(
        'FCS4.07: GIVEN color: $col '
        'EXPECT swatch[400] equal to Color(0xff7219f0)', () {
      expect(
        FlexColorScheme.createPrimarySwatch(col)[400],
        equals(const Color(0xff7219f0)),
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
        'EXPECT swatch[700] equal to Color(0xff4e00be)', () {
      expect(
        FlexColorScheme.createPrimarySwatch(col)[700],
        equals(const Color(0xff4e00be)),
      );
    });
    test(
        'FCS4.11: GIVEN color: $col '
        'EXPECT swatch[800] equal to Color(0xff4500a7)', () {
      expect(
        FlexColorScheme.createPrimarySwatch(col)[800],
        equals(const Color(0xff4500a7)),
      );
    });
    test(
        'FCS4.12: GIVEN color: $col '
        'EXPECT swatch[900] equal to Color(0xff3b008f)', () {
      expect(
        FlexColorScheme.createPrimarySwatch(col)[900],
        equals(const Color(0xff3b008f)),
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
              systemNavigationBarColor: Colors.white,
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
            systemNavigationBarColor: Colors.white,
            systemNavigationBarDividerColor: Colors.white,
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
          // Testing that the deprecated member still works as it should.
          // ignore: deprecated_member_use_from_same_package
          nullContextBackground: const Color(0xFFCCCCCC),
        ),
        equals(
          const SystemUiOverlayStyle(
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
            systemNavigationBarColor: Colors.black,
            systemNavigationBarDividerColor: Colors.black,
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
            systemNavigationBarColor: Color(0xFF202020),
            systemNavigationBarDividerColor: Color(0xFF202020),
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
          // Testing that the deprecated member still works as it should.
          // ignore: deprecated_member_use_from_same_package
          nullContextBackground: const Color(0xFF202020),
        ),
        equals(
          const SystemUiOverlayStyle(
            systemNavigationBarColor: Color(0xFF202020),
            systemNavigationBarDividerColor: Color(0xFF202020),
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
          // Testing that the deprecated member still works as it should.
          // ignore: deprecated_member_use_from_same_package
          nullContextBackground: const Color(0xFF202020),
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
          // Testing that the deprecated member still works as it should.
          // ignore: deprecated_member_use_from_same_package
          nullContextBackground: const Color(0xFF202020),
        ),
        const SystemUiOverlayStyle(
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
          // Testing that the deprecated member still works as it should.
          // ignore: deprecated_member_use_from_same_package
          nullContextBackground: const Color(0xFF202020),
        ),
        const SystemUiOverlayStyle(
          systemNavigationBarColor: Color(0xFF4545F3),
          systemNavigationBarDividerColor: Color(0xFF4545F3),
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
          systemNavigationBarColor: Color(0xFF202020),
          systemNavigationBarDividerColor: Color(0xFF202020),
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
          // Testing that the deprecated member still works as it should.
          // ignore: deprecated_member_use_from_same_package
          nullContextBackground: const Color(0xFF202020),
        ),
        const SystemUiOverlayStyle(
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
          systemNavigationBarColor: const Color(0x00202020).withOpacity(0),
          // Divider has opacity 0.8, when there is opacity on navbar.
          systemNavigationBarDividerColor:
              const Color(0xFF2C2C2C).withOpacity(0.8),
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
          // Testing that the deprecated member still works as it should.
          // ignore: deprecated_member_use_from_same_package
          nullContextBackground: const Color(0xFF202020),
        ),
        SystemUiOverlayStyle(
          systemNavigationBarColor: const Color(0x00202020).withOpacity(0.5),
          // Divider has opacity 0.8, when there is opacity on navbar.
          systemNavigationBarDividerColor:
              const Color(0xFF2C2C2C).withOpacity(0.8),
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
          systemNavigationBarColor: const Color(0x00202020).withOpacity(0),
          // Divider has opacity 0.8, when there is opacity on navbar.
          systemNavigationBarDividerColor:
              const Color(0xFF2C2C2C).withOpacity(0.8),
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
        'and black (invisible) status icons.', () {
      expect(
        FlexColorScheme.themedSystemNavigationBar(
          null,
          noAppBar: true,
          invertStatusIcons: true,
          useDivider: true,
          nullContextBrightness: Brightness.dark,
        ),
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.black,
          systemNavigationBarDividerColor: Color(0xFF2C2C2C),
          systemNavigationBarIconBrightness: Brightness.light,
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
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarDividerColor: Colors.white,
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
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarDividerColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
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
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Color(0xFFF44336),
          systemNavigationBarDividerColor: Color(0xFFF44336),
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
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: const Color(0xFFF44336).withOpacity(0.5),
          // Divider has opacity 0.8, when there is opacity on navbar.
          systemNavigationBarDividerColor:
              const Color(0xFF2196F3).withOpacity(0.8),
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
        'FCS5.01La: GIVEN A light theme with defined background colors AND '
        'themedSystemNavigationBar WITH '
        'systemNavBarStyle: FlexSystemNavBarStyle.system '
        'EXPECT white system navbar, with NO divider.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.light(
              background: Color(0xFF90CAF9),
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
                  systemNavigationBarColor: Colors.white,
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
        'FCS5.01Lb: GIVEN A light theme with defined background colors AND '
        'themedSystemNavigationBar WITH useDivider:false '
        'systemNavBarStyle: FlexSystemNavBarStyle.system divider:false '
        'EXPECT white system navbar, with no visible divider.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.light(
              background: Color(0xFF90CAF9),
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
                  systemNavigationBarColor: Colors.white,
                  systemNavigationBarDividerColor: Colors.white,
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
        'FCS5.02La: GIVEN A light theme with defined background colors AND '
        'themedSystemNavigationBar WITH '
        'systemNavBarStyle: FlexSystemNavBarStyle.scaffoldBackground '
        'EXPECT scaffoldBackground system navbar, with NO divider.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.light(
              background: Color(0xFF90CAF9),
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
                  systemNavigationBarColor:
                      Theme.of(context).scaffoldBackgroundColor,
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
        'FCS5.02Lb: GIVEN A light theme with defined background colors AND '
        'themedSystemNavigationBar WITH useDivider:false '
        'systemNavBarStyle: FlexSystemNavBarStyle.scaffoldBackground '
        'EXPECT scaffoldBackground system navbar, with no visible divider.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.light(
              background: Color(0xFF90CAF9),
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
                  systemNavigationBarColor:
                      Theme.of(context).scaffoldBackgroundColor,
                  systemNavigationBarDividerColor:
                      Theme.of(context).scaffoldBackgroundColor,
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
        'FCS5.03La: GIVEN A light theme with defined background colors AND '
        'themedSystemNavigationBar WITH '
        'systemNavBarStyle: FlexSystemNavBarStyle.surface '
        'EXPECT surface colored system navbar, with NO divider.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.light(
              background: Color(0xFF90CAF9),
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
                  systemNavigationBarColor:
                      Theme.of(context).colorScheme.surface,
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
        'FCS5.03Lb: GIVEN A light theme with defined background colors AND '
        'themedSystemNavigationBar WITH useDivider:false '
        'systemNavBarStyle: FlexSystemNavBarStyle.surface '
        'EXPECT surface colored system navbar, with no visible divider.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.light(
              background: Color(0xFF90CAF9),
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
                  systemNavigationBarColor:
                      Theme.of(context).colorScheme.surface,
                  systemNavigationBarDividerColor:
                      Theme.of(context).colorScheme.surface,
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
        'FCS5.04La: GIVEN A light theme with defined background colors AND '
        'themedSystemNavigationBar WITH '
        'systemNavBarStyle: FlexSystemNavBarStyle.background '
        'EXPECT background colored system navbar, with NO divider.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.light(
              background: Color(0xFF90CAF9),
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
                  systemNavigationBarColor:
                      Theme.of(context).colorScheme.background,
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
        'FCS5.04Lb: GIVEN A light theme with defined background colors AND '
        'themedSystemNavigationBar WITH useDivider:false '
        'systemNavBarStyle: FlexSystemNavBarStyle.background '
        'EXPECT background colored system navbar, with no visible divider.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.light(
              background: Color(0xFF90CAF9),
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
                  systemNavigationBarColor:
                      Theme.of(context).colorScheme.background,
                  systemNavigationBarDividerColor:
                      Theme.of(context).colorScheme.background,
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
        'FCS5.05L: GIVEN A light theme with defined background colors AND '
        'themedSystemNavigationBar WITH divider and '
        'systemNavBarStyle: FlexSystemNavBarStyle.surface '
        'EXPECT surface colored system navbar, with divider.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.light(
              background: Color(0xFF90CAF9),
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
        'FCS5.06L: GIVEN A light theme with defined background colors AND '
        'themedSystemNavigationBar WITH divider and opacity 0.5 and '
        'systemNavBarStyle: FlexSystemNavBarStyle.surface '
        'EXPECT surface colored system navbar with 0.5 opacity , with divider.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.light(
              background: Color(0xFF90CAF9),
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
                  systemNavigationBarColor:
                      Theme.of(context).colorScheme.surface.withOpacity(0.5),
                  // Divider has opacity 0.8, when there is opacity on navbar.
                  systemNavigationBarDividerColor:
                      const Color(0xFFDDDDDD).withOpacity(0.8),
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
        'FCS5.07L: GIVEN A light theme with defined background colors AND '
        'themedSystemNavigationBar WITH NO divider and opacity 0.5 and '
        'systemNavBarStyle: FlexSystemNavBarStyle.surface '
        'EXPECT surface colored system navbar with 0.5 opacity, with no '
        'visible divider.', (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.light(
              background: Color(0xFF90CAF9),
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
                  systemNavigationBarColor:
                      Theme.of(context).colorScheme.surface.withOpacity(0.5),
                  systemNavigationBarDividerColor:
                      Theme.of(context).colorScheme.surface.withOpacity(0.5),
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
        'FCS5.08L: GIVEN A light theme with defined background colors AND '
        'themedSystemNavigationBar WITH NO divider and '
        'systemNavBarStyle: FlexSystemNavBarStyle.transparent and opacity:0.5 '
        'EXPECT scaffoldBackground colored system navbar with 0.01 opacity, '
        'with no visible divider.', (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.light(
              background: Color(0xFF90CAF9),
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
                  systemNavigationBarColor: Theme.of(context)
                      .scaffoldBackgroundColor
                      .withOpacity(0.01),
                  systemNavigationBarDividerColor: Theme.of(context)
                      .scaffoldBackgroundColor
                      .withOpacity(0.01),
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
        'FCS5.01Da: GIVEN A dark theme with defined background colors AND '
        'themedSystemNavigationBar WITH '
        'systemNavBarStyle: FlexSystemNavBarStyle.system '
        'EXPECT black system navbar, with NO divider.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.dark(
              background: Color(0xFF303030),
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
                  systemNavigationBarColor: Colors.black,
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
        'FCS5.01Db: GIVEN A dark theme with defined background colors AND '
        'themedSystemNavigationBar WITH useDivider: false '
        'systemNavBarStyle: FlexSystemNavBarStyle.system '
        'EXPECT black system navbar, with no visible divider.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.dark(
              background: Color(0xFF303030),
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
                  systemNavigationBarColor: Colors.black,
                  systemNavigationBarDividerColor: Colors.black,
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
        'FCS5.02Da: GIVEN A dark theme with defined background colors AND '
        'themedSystemNavigationBar WITH '
        'systemNavBarStyle: FlexSystemNavBarStyle.scaffoldBackground '
        'EXPECT scaffoldBackground system navbar, with NO divider.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.dark(
              background: Color(0xFF303030),
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
                  systemNavigationBarColor:
                      Theme.of(context).scaffoldBackgroundColor,
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
        'FCS5.02Db: GIVEN A dark theme with defined background colors AND '
        'themedSystemNavigationBar WITH useDivider: false '
        'systemNavBarStyle: FlexSystemNavBarStyle.scaffoldBackground '
        'EXPECT scaffoldBackground system navbar, with no visible divider.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.dark(
              background: Color(0xFF303030),
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
                  systemNavigationBarColor:
                      Theme.of(context).scaffoldBackgroundColor,
                  systemNavigationBarDividerColor:
                      Theme.of(context).scaffoldBackgroundColor,
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
        'FCS5.03Da: GIVEN A dark theme with defined background colors AND '
        'themedSystemNavigationBar WITH '
        'systemNavBarStyle: FlexSystemNavBarStyle.surface '
        'EXPECT surface colored system navbar, with NO divider.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.dark(
              background: Color(0xFF303030),
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
                  systemNavigationBarColor:
                      Theme.of(context).colorScheme.surface,
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
        'FCS5.03Db: GIVEN A dark theme with defined background colors AND '
        'themedSystemNavigationBar WITH '
        'systemNavBarStyle: FlexSystemNavBarStyle.surface '
        'EXPECT surface colored system navbar, with no visible divider.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.dark(
              background: Color(0xFF303030),
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
                  systemNavigationBarColor:
                      Theme.of(context).colorScheme.surface,
                  systemNavigationBarDividerColor:
                      Theme.of(context).colorScheme.surface,
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
        'FCS5.04Da: GIVEN A dark theme with defined background colors AND '
        'themedSystemNavigationBar WITH '
        'systemNavBarStyle: FlexSystemNavBarStyle.background '
        'EXPECT background colored system navbar, with NO divider.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.dark(
              background: Color(0xFF303030),
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
                  systemNavigationBarColor:
                      Theme.of(context).colorScheme.background,
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
        'FCS5.04Db: GIVEN A dark theme with defined background colors AND '
        'themedSystemNavigationBar WITH '
        'systemNavBarStyle: FlexSystemNavBarStyle.background '
        'EXPECT background colored system navbar, with no visible divider.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.dark(
              background: Color(0xFF303030),
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
                  systemNavigationBarColor:
                      Theme.of(context).colorScheme.background,
                  systemNavigationBarDividerColor:
                      Theme.of(context).colorScheme.background,
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
        'FCS5.05D: GIVEN A dark theme with defined background colors AND '
        'themedSystemNavigationBar WITH divider and '
        'systemNavBarStyle: FlexSystemNavBarStyle.surface '
        'EXPECT surface colored system navbar, with divider.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.dark(
              background: Color(0xFF303030),
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
        'FCS5.06D: GIVEN A dark theme with defined background colors AND '
        'themedSystemNavigationBar WITH divider and opacity 0.5 and '
        'systemNavBarStyle: FlexSystemNavBarStyle.surface '
        'EXPECT surface colored system navbar and divider with 0.5 opacity.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.dark(
              background: Color(0xFF303030),
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
                  systemNavigationBarColor:
                      Theme.of(context).colorScheme.surface.withOpacity(0.5),
                  // Divider has opacity 0.8, when there is opacity on navbar.
                  systemNavigationBarDividerColor:
                      const Color(0xFF2C2C2C).withOpacity(0.8),
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
        'FCS5.07D: GIVEN A dark theme with defined background colors AND '
        'themedSystemNavigationBar WITH NO divider and opacity 0.5 and '
        'systemNavBarStyle: FlexSystemNavBarStyle.surface '
        'EXPECT surface colored system navbar with 0.5 opacity, with no '
        'visible divider.', (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.dark(
              background: Color(0xFF303030),
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
                  systemNavigationBarColor:
                      Theme.of(context).colorScheme.surface.withOpacity(0.5),
                  systemNavigationBarDividerColor:
                      Theme.of(context).colorScheme.surface.withOpacity(0.5),
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
        'FCS5.08D: GIVEN A dark theme with defined background colors AND '
        'themedSystemNavigationBar WITH NO divider and '
        'systemNavBarStyle: FlexSystemNavBarStyle.transparent and opacity:0.5 '
        'EXPECT scaffoldBackground colored system navbar with 0.01 opacity, '
        'with no visible divider.', (WidgetTester tester) async {
      await tester.pumpWidget(
        Theme(
          data: ThemeData.from(
            colorScheme: const ColorScheme.dark(
              background: Color(0xFF303030),
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
                  systemNavigationBarColor: Theme.of(context)
                      .scaffoldBackgroundColor
                      .withOpacity(0.01),
                  systemNavigationBarDividerColor: Theme.of(context)
                      .scaffoldBackgroundColor
                      .withOpacity(0.01),
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
