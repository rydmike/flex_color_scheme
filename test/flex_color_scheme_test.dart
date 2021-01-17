import 'package:flex_color_scheme/src/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

void main() {
  //****************************************************************************
  // FlexColorScheme unit tests.
  //
  // Basic object tests, equality, none equal, copyWith. Factory creation
  // same result as matching one with default constructor.
  //****************************************************************************
  group('FCS1: WITH FlexColorScheme ', () {
    debugDefaultTargetPlatformOverride = null;

    test(
        'FCS1.00a: GIVEN a FlexColorScheme with nulls '
        'EXPECT throws null assertion error.', () {
      expect(
          () => FlexColorScheme(
                brightness: null,
                primary: Colors.white,
                primaryVariant: Colors.white,
                secondary: Colors.white,
                secondaryVariant: Colors.white,
                tabBarStyle: FlexTabBarStyle.forBackground,
                appBarElevation: 1,
                tooltipsMatchBackground: true,
                transparentStatusBar: false,
              ),
          throwsAssertionError);
    });
    test(
        'FCS1.00b: GIVEN a FlexColorScheme with nulls '
        'EXPECT throws null assertion error.', () {
      expect(
          () => FlexColorScheme(
                brightness: Brightness.dark,
                primary: null,
                primaryVariant: Colors.white,
                secondary: Colors.white,
                secondaryVariant: Colors.white,
                tabBarStyle: FlexTabBarStyle.forBackground,
                appBarElevation: 1,
                tooltipsMatchBackground: true,
                transparentStatusBar: false,
              ),
          throwsAssertionError);
    });
    test(
        'FCS1.00c: GIVEN a FlexColorScheme with nulls '
        'EXPECT throws null assertion error.', () {
      expect(
          () => FlexColorScheme(
                brightness: Brightness.dark,
                primary: Colors.white,
                primaryVariant: null,
                secondary: Colors.white,
                secondaryVariant: Colors.white,
                tabBarStyle: FlexTabBarStyle.forBackground,
                appBarElevation: 1,
                tooltipsMatchBackground: true,
                transparentStatusBar: false,
              ),
          throwsAssertionError);
    });
    test(
        'FCS1.00d: GIVEN a FlexColorScheme with nulls '
        'EXPECT throws null assertion error.', () {
      expect(
          () => FlexColorScheme(
                brightness: Brightness.dark,
                primary: Colors.white,
                primaryVariant: Colors.white,
                secondary: null,
                secondaryVariant: Colors.white,
                tabBarStyle: FlexTabBarStyle.forBackground,
                appBarElevation: 1,
                tooltipsMatchBackground: true,
                transparentStatusBar: false,
              ),
          throwsAssertionError);
    });
    test(
        'FCS1.00e: GIVEN a FlexColorScheme with nulls '
        'EXPECT throws null assertion error.', () {
      expect(
          () => FlexColorScheme(
                brightness: Brightness.dark,
                primary: Colors.white,
                primaryVariant: Colors.white,
                secondary: Colors.white,
                secondaryVariant: null,
                tabBarStyle: FlexTabBarStyle.forBackground,
                appBarElevation: 1,
                tooltipsMatchBackground: true,
                transparentStatusBar: false,
              ),
          throwsAssertionError);
    });
    test(
        'FCS1.00f: GIVEN a FlexColorScheme with nulls '
        'EXPECT throws null assertion error.', () {
      expect(
          () => FlexColorScheme(
                brightness: Brightness.dark,
                primary: Colors.white,
                primaryVariant: Colors.white,
                secondary: Colors.white,
                secondaryVariant: Colors.white,
                tabBarStyle: null,
                appBarElevation: 1,
                tooltipsMatchBackground: true,
                transparentStatusBar: false,
              ),
          throwsAssertionError);
    });
    test(
        'FCS1.00g: GIVEN a FlexColorScheme with nulls '
        'EXPECT throws null assertion error.', () {
      expect(
          () => FlexColorScheme(
                brightness: Brightness.dark,
                primary: Colors.white,
                primaryVariant: Colors.white,
                secondary: Colors.white,
                secondaryVariant: Colors.white,
                tabBarStyle: FlexTabBarStyle.forBackground,
                appBarElevation: null,
                tooltipsMatchBackground: true,
                transparentStatusBar: false,
              ),
          throwsAssertionError);
    });
    test(
        'FCS1.00a: GIVEN a FlexColorScheme with nulls '
        'EXPECT throws null assertion error.', () {
      expect(
          () => FlexColorScheme(
                brightness: Brightness.dark,
                primary: Colors.white,
                primaryVariant: Colors.white,
                secondary: Colors.white,
                secondaryVariant: Colors.white,
                tabBarStyle: FlexTabBarStyle.forBackground,
                appBarElevation: 1,
                tooltipsMatchBackground: null,
                transparentStatusBar: false,
              ),
          throwsAssertionError);
    });
    test(
        'FCS1.00i: GIVEN a FlexColorScheme with nulls '
        'EXPECT throws null assertion error.', () {
      expect(
          () => FlexColorScheme(
                brightness: Brightness.dark,
                primary: Colors.white,
                primaryVariant: Colors.white,
                secondary: Colors.white,
                secondaryVariant: Colors.white,
                tabBarStyle: FlexTabBarStyle.forBackground,
                appBarElevation: 1,
                tooltipsMatchBackground: true,
                transparentStatusBar: null,
              ),
          throwsAssertionError);
    });
    // ---------------------------

    final FlexSchemeColor sc =
        FlexSchemeColor.from(primary: FlexColor.materialLightPrimary);

    test(
        'FCS1.00j1: GIVEN a FlexColorScheme.light with null colors and null '
        'scheme EXPECT FlexColorScheme.light with scheme Material.', () {
      expect(
        FlexColorScheme.light(
          usedColors: 1,
          surfaceStyle: FlexSurface.medium,
          appBarStyle: FlexAppBarStyle.background,
          tabBarStyle: FlexTabBarStyle.forBackground,
          tooltipsMatchBackground: true,
          transparentStatusBar: false,
        ),
        FlexColorScheme.light(
          scheme: FlexScheme.material,
          usedColors: 1,
          surfaceStyle: FlexSurface.medium,
          appBarStyle: FlexAppBarStyle.background,
          tabBarStyle: FlexTabBarStyle.forBackground,
          tooltipsMatchBackground: true,
          transparentStatusBar: false,
        ),
      );
    });
    test(
        'FCS1.00j2: GIVEN a FlexColorScheme.light with colors sc and given '
        'scheme EXPECT FlexColorScheme.light with colors sc and null scheme.',
        () {
      expect(
        FlexColorScheme.light(
          colors: sc,
          scheme: FlexScheme.materialHc,
          usedColors: 1,
          surfaceStyle: FlexSurface.medium,
          appBarStyle: FlexAppBarStyle.background,
          tabBarStyle: FlexTabBarStyle.forBackground,
          tooltipsMatchBackground: true,
          transparentStatusBar: false,
        ),
        FlexColorScheme.light(
          colors: sc,
          usedColors: 1,
          surfaceStyle: FlexSurface.medium,
          appBarStyle: FlexAppBarStyle.background,
          tabBarStyle: FlexTabBarStyle.forBackground,
          tooltipsMatchBackground: true,
          transparentStatusBar: false,
        ),
      );
    });
    test(
        'FCS1.00k: GIVEN a FlexColorScheme.light with null usedColors '
        'EXPECT throws null assertion error.', () {
      expect(
          () => FlexColorScheme.light(
                colors: sc,
                usedColors: null,
                surfaceStyle: FlexSurface.medium,
                appBarStyle: FlexAppBarStyle.background,
                tabBarStyle: FlexTabBarStyle.forBackground,
                tooltipsMatchBackground: true,
                transparentStatusBar: false,
              ),
          throwsAssertionError);
    });
    test(
        'FCS1.00l: GIVEN a FlexColorScheme.light with null surfaceStyle '
        'EXPECT throws null assertion error.', () {
      expect(
          () => FlexColorScheme.light(
                colors: sc,
                usedColors: 1,
                surfaceStyle: null,
                appBarStyle: FlexAppBarStyle.background,
                tabBarStyle: FlexTabBarStyle.forBackground,
                tooltipsMatchBackground: true,
                transparentStatusBar: false,
              ),
          throwsAssertionError);
    });
    test(
        'FCS1.00m: GIVEN a FlexColorScheme.light with null appBarStyle '
        'EXPECT throws null assertion error.', () {
      expect(
          () => FlexColorScheme.light(
                colors: sc,
                usedColors: 1,
                surfaceStyle: FlexSurface.medium,
                appBarStyle: null,
                tabBarStyle: FlexTabBarStyle.forBackground,
                tooltipsMatchBackground: true,
                transparentStatusBar: false,
              ),
          throwsAssertionError);
    });
    test(
        'FCS1.00n: GIVEN a FlexColorScheme.light with null tabBarStyle '
        'EXPECT throws null assertion error.', () {
      expect(
          () => FlexColorScheme.light(
                colors: sc,
                usedColors: 1,
                surfaceStyle: FlexSurface.medium,
                appBarStyle: FlexAppBarStyle.background,
                tabBarStyle: null,
                tooltipsMatchBackground: true,
                transparentStatusBar: false,
              ),
          throwsAssertionError);
    });
    test(
        'FCS1.00o: GIVEN a FlexColorScheme.light with null '
        'tooltipsMatchBackground EXPECT throws null assertion error.', () {
      expect(
          () => FlexColorScheme.light(
                colors: sc,
                usedColors: 1,
                surfaceStyle: FlexSurface.medium,
                appBarStyle: FlexAppBarStyle.background,
                tabBarStyle: FlexTabBarStyle.forBackground,
                tooltipsMatchBackground: null,
                transparentStatusBar: false,
              ),
          throwsAssertionError);
    });
    test(
        'FCS1.00p: GIVEN a FlexColorScheme.light with null '
        'transparentStatusBar EXPECT throws null assertion error.', () {
      expect(
          () => FlexColorScheme.light(
                colors: sc,
                usedColors: 1,
                surfaceStyle: FlexSurface.medium,
                appBarStyle: FlexAppBarStyle.background,
                tabBarStyle: FlexTabBarStyle.forBackground,
                tooltipsMatchBackground: true,
                transparentStatusBar: null,
              ),
          throwsAssertionError);
    });
    // ---------------------------
    test(
        'FCS1.00q1: GIVEN a FlexColorScheme.dark with null colors and null '
        'scheme EXPECT FlexColorScheme.dark with scheme Material.', () {
      expect(
        FlexColorScheme.dark(
          usedColors: 1,
          surfaceStyle: FlexSurface.medium,
          appBarStyle: FlexAppBarStyle.background,
          tabBarStyle: FlexTabBarStyle.forBackground,
          tooltipsMatchBackground: true,
          transparentStatusBar: false,
        ),
        FlexColorScheme.dark(
          scheme: FlexScheme.material,
          usedColors: 1,
          surfaceStyle: FlexSurface.medium,
          appBarStyle: FlexAppBarStyle.background,
          tabBarStyle: FlexTabBarStyle.forBackground,
          tooltipsMatchBackground: true,
          transparentStatusBar: false,
        ),
      );
    });
    test(
        'FCS1.00q2: GIVEN a FlexColorScheme.dark with colors sc and given '
        'scheme EXPECT FlexColorScheme.dark with colors sc and null scheme.',
        () {
      expect(
        FlexColorScheme.dark(
          colors: sc,
          scheme: FlexScheme.materialHc,
          usedColors: 1,
          surfaceStyle: FlexSurface.medium,
          appBarStyle: FlexAppBarStyle.background,
          tabBarStyle: FlexTabBarStyle.forBackground,
          tooltipsMatchBackground: true,
          transparentStatusBar: false,
        ),
        FlexColorScheme.dark(
          colors: sc,
          usedColors: 1,
          surfaceStyle: FlexSurface.medium,
          appBarStyle: FlexAppBarStyle.background,
          tabBarStyle: FlexTabBarStyle.forBackground,
          tooltipsMatchBackground: true,
          transparentStatusBar: false,
        ),
      );
    });
    test(
        'FCS1.00r: GIVEN a FlexColorScheme.dark with null usedColors '
        'EXPECT throws null assertion error.', () {
      expect(
          () => FlexColorScheme.dark(
                colors: sc,
                usedColors: null,
                surfaceStyle: FlexSurface.medium,
                appBarStyle: FlexAppBarStyle.background,
                tabBarStyle: FlexTabBarStyle.forBackground,
                tooltipsMatchBackground: true,
                transparentStatusBar: false,
              ),
          throwsAssertionError);
    });
    test(
        'FCS1.00s: GIVEN a FlexColorScheme.dark with null surfaceStyle '
        'EXPECT throws null assertion error.', () {
      expect(
          () => FlexColorScheme.dark(
                colors: sc,
                usedColors: 1,
                surfaceStyle: null,
                appBarStyle: FlexAppBarStyle.background,
                tabBarStyle: FlexTabBarStyle.forBackground,
                tooltipsMatchBackground: true,
                transparentStatusBar: false,
              ),
          throwsAssertionError);
    });
    test(
        'FCS1.00t: GIVEN a FlexColorScheme.dark with null appBarStyle '
        'EXPECT throws null assertion error.', () {
      expect(
          () => FlexColorScheme.dark(
                colors: sc,
                usedColors: 1,
                surfaceStyle: FlexSurface.medium,
                appBarStyle: null,
                tabBarStyle: FlexTabBarStyle.forBackground,
                tooltipsMatchBackground: true,
                transparentStatusBar: false,
              ),
          throwsAssertionError);
    });
    test(
        'FCS1.00u: GIVEN a FlexColorScheme.dark with null tabBarStyle '
        'EXPECT throws null assertion error.', () {
      expect(
          () => FlexColorScheme.dark(
                colors: sc,
                usedColors: 1,
                surfaceStyle: FlexSurface.medium,
                appBarStyle: FlexAppBarStyle.background,
                tabBarStyle: null,
                tooltipsMatchBackground: true,
                transparentStatusBar: false,
              ),
          throwsAssertionError);
    });
    test(
        'FCS1.00v: GIVEN a FlexColorScheme.dark with null '
        'tooltipsMatchBackground EXPECT throws null assertion error.', () {
      expect(
          () => FlexColorScheme.dark(
                colors: sc,
                usedColors: 1,
                surfaceStyle: FlexSurface.medium,
                appBarStyle: FlexAppBarStyle.background,
                tabBarStyle: FlexTabBarStyle.forBackground,
                tooltipsMatchBackground: null,
                transparentStatusBar: false,
              ),
          throwsAssertionError);
    });
    test(
        'FCS1.00w: GIVEN a FlexColorScheme.dark with null '
        'transparentStatusBar EXPECT throws null assertion error.', () {
      expect(
          () => FlexColorScheme.dark(
                colors: sc,
                usedColors: 1,
                surfaceStyle: FlexSurface.medium,
                appBarStyle: FlexAppBarStyle.background,
                tabBarStyle: FlexTabBarStyle.forBackground,
                tooltipsMatchBackground: true,
                transparentStatusBar: null,
              ),
          throwsAssertionError);
    });
    test(
        'FCS1.00x: GIVEN a FlexColorScheme.dark with null darkIsTrueBlack '
        'EXPECT throws null assertion error.', () {
      expect(
          () => FlexColorScheme.dark(
              colors: sc,
              usedColors: 1,
              surfaceStyle: FlexSurface.medium,
              appBarStyle: FlexAppBarStyle.background,
              tabBarStyle: FlexTabBarStyle.forBackground,
              tooltipsMatchBackground: true,
              transparentStatusBar: false,
              darkIsTrueBlack: null),
          throwsAssertionError);
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
    });
    test(
        'FCS1.01a: GIVEN two identical FlexColorScheme objects '
        'EXPECT them to have equality', () {
      expect(m1, equals(m2));
    });
    test(
        'FCS1.01b: GIVEN two identical FlexColorScheme objects '
        'EXPECT them to have equality with operator', () {
      expect(m1 == m2, true);
    });
    test(
        'FCS1.02a: GIVEN none identical FlexColorScheme objects '
        'EXPECT them to be unequal', () {
      expect(m1, isNot(m3));
    });
    test(
        'FCS1.02b: GIVEN none identical FlexColorScheme objects '
        'EXPECT them to be unequal with operator.', () {
      expect(m1 != m3, true);
    });
    test(
        'FCS1.03a: GIVEN a FlexColorScheme object EXPECT it to be '
        'equal to an unequal object when made equal with copyWith.', () {
      expect(
          m4.copyWith(
            brightness: Brightness.light,
            primary: FlexColor.materialLightPrimary,
            primaryVariant: FlexColor.materialLightPrimaryVariant,
            secondary: FlexColor.materialLightSecondary,
            secondaryVariant: FlexColor.materialLightSecondaryVariant,
          ),
          m1);
    });
    test(
        'FCS1.03b: GIVEN a FlexColorScheme object EXPECT it to be '
        'unchanged after an empty .copyWith().', () {
      expect(m4.copyWith(), m4);
    });
    test(
        'FCS1.04: GIVEN a FlexColorScheme.light created object '
        'EXPECT equality when made by matching default constructor.', () {
      expect(
        FlexColorScheme.light(
            colors: FlexColor.schemes[FlexScheme.material].light),
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
        ),
      );
    });
    test(
        'FCS1.05: GIVEN a FlexColorScheme.dark created object '
        'EXPECT equality when made by matching default constructor.', () {
      expect(
        FlexColorScheme.dark(
            colors: FlexColor.schemes[FlexScheme.material].dark),
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
          onError: Colors.white,
        ),
      );
    });

    //**************************************************************************
    // FlexColorScheme unit tests.
    //
    // toString and hashcode.
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
      accentColor: FlexColor.materialLightSecondary,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.black,
      onBackground: Colors.black,
      onError: Colors.white,
      visualDensity: VisualDensity.standard,
      fontFamily: 'Roboto',
      platform: TargetPlatform.android,
      typography: Typography.material2018(),
    );

    test(
        'FCS1.06a: Test toString implemented via debugFillProperties '
        'EXPECT working data print.', () {
      expect(m5.toString().length, greaterThan(15));
    });
    // test(
    //     'FCS1.06b: Test toString implemented via debugFillProperties '
    //     'EXPECT exact print string value.', () {
    //   expect(
    //       m5.toString(),
    //       // ignore: lines_longer_than_80_chars
    //       'FlexColorScheme#b4088(brightness: light, primary: Color(0xff6200ee), primaryVariant: Color(0xff3700b3), secondary: Color(0xff03dac6), secondaryVariant: Color(0xff018786), surface: Color(0xffffffff), background: Color(0xffffffff), error: Color(0xffb00020), scaffoldBackground: Color(0xffffffff), appBarBackground: Color(0xff6200ee), accentColor: null, onPrimary: Color(0xffffffff), onSecondary: Color(0xff000000), onSurface: Color(0xff000000), onBackground: Color(0xff000000), onError: Color(0xffffffff), tabBarStyle: forAppBar, appBarElevation: 0.0, bottomAppBarElevation: 0.0, tooltipsMatchBackground: false, transparentStatusBar: true, visualDensity: 0, v: 0.0), fontFamily: Roboto, platform: android, typography: null)');
    // });
    test(
        'FCS1.07a: Test toStringShort implemented via debugFillProperties '
        'EXPECT working data print.', () {
      expect(m5.toStringShort().length, greaterThan(10));
    });
    test('FCS1.08a: Test hashCode has value.', () {
      expect(m5.hashCode, isNotNull);
    });

    // TODO: This is strange, why is the hashCode result different on new runs?
    // The hashCode should imo remain the same when using same algorithm on same
    // data over multiple runs. It does with other objects, but not this one.
    // Is it the usage fo the list version? If I change it to ^ operator
    // does it work then? In Flutter ThemeData uses the hashcode operator I
    // used here, but I have seen some issue mentioned with ThemeData copies.
    // could it be related? Investigate!
    // I tested with standard .hashCode ^ hash algo, same result on this object.
    // I also experimented with Flutter ThemeData and ColorScheme, they also
    // change hashcode between runs! So i guess that is OK then...
    //
    // Since this test is not statically repeatable with a fixed hasCode, it
    // also seems to result in that the toSring and toStringShort methods via
    // debugFillProperties are not either since they contain some hasHcode hex
    // object ID as well.
    //
    // test('FCS1.08b: Test hashCode exact value.', () {
    //   expect(m5.hashCode, 3464563086);
    // });
    test('FCS1.08c: Test hashCode copyWith has exact same value.', () {
      expect(m5.hashCode, equals(m5.copyWith().hashCode));
    });

    // HashCode experiments with ThemeData and ColorScheme below
    //
    // final ThemeData mTd1 =
    //     ThemeData.from(colorScheme: const ColorScheme.dark());
    // final ThemeData mTd2 =
    //     ThemeData.from(colorScheme: const ColorScheme.dark());
    // test(
    //     'FCS1.08b: Test ThemeData hashCode ${mTd1.hashCode} '
    //     'exact value.', () {
    //   expect(mTd1.hashCode, 165713125);
    // });
    // test('FCS1.08b: Test ThemeData hashCode exact value.', () {
    //   expect(mTd1.hashCode, mTd2.hashCode);
    // });
    //
    // const ColorScheme mCs1 = ColorScheme.dark();
    // const ColorScheme mCs2 = ColorScheme.dark();
    // test('FCS1.08b: Test ColorScheme hashCode ${mCs1.hashCode} exact value.',
    //     () {
    //   expect(mCs1.hashCode, 160966695);
    // });
    // test('FCS1.08b: Test ColorScheme hashCode exact value.', () {
    //   expect(mCs1.hashCode, mCs2.hashCode);
    // });
  });

  //****************************************************************************
  // FlexColorScheme.toScheme unit tests.
  //
  // Validate result of "toScheme" property, when compared with ColorScheme made
  // with matching data.
  //****************************************************************************
  group('FCS2: WITH FlexColorScheme.toScheme ', () {
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
          const ColorScheme.light());
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
          const ColorScheme.dark());
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
          const ColorScheme.highContrastLight());
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
          const ColorScheme.highContrastDark());
    });
  });

  //****************************************************************************
  // FlexColorScheme.comfortablePlatformDensity unit tests.
  //
  // Validate that "comfortablePlatformDensity" function, produces
  // correct visual density selection on each platform.
  //****************************************************************************
  group('FCS3: WITH FlexColorScheme.comfortablePlatformDensity ', () {
    test(
        'FCS3.01: GIVEN TargetPlatform.android '
        'EXPECT VisualDensity.standard', () {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      expect(
          FlexColorScheme.comfortablePlatformDensity, VisualDensity.standard);
    });
    test(
        'FCS3.02: GIVEN TargetPlatform.iOS '
        'EXPECT VisualDensity.standard', () {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      expect(
          FlexColorScheme.comfortablePlatformDensity, VisualDensity.standard);
    });
    test(
        'FCS3.03: GIVEN TargetPlatform.fuchsia '
        'EXPECT VisualDensity.standard', () {
      debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
      expect(
          FlexColorScheme.comfortablePlatformDensity, VisualDensity.standard);
    });
    test(
        'FCS3.04: GIVEN TargetPlatform.linux '
        'EXPECT VisualDensity.comfortable', () {
      debugDefaultTargetPlatformOverride = TargetPlatform.linux;
      expect(FlexColorScheme.comfortablePlatformDensity,
          VisualDensity.comfortable);
    });
    test(
        'FCS3.05: GIVEN TargetPlatform.macOS '
        'EXPECT VisualDensity.comfortable', () {
      debugDefaultTargetPlatformOverride = TargetPlatform.macOS;
      expect(FlexColorScheme.comfortablePlatformDensity,
          VisualDensity.comfortable);
    });
    test(
        'FCS3.06: GIVEN TargetPlatform.windows '
        'EXPECT VisualDensity.comfortable', () {
      debugDefaultTargetPlatformOverride = TargetPlatform.windows;
      expect(FlexColorScheme.comfortablePlatformDensity,
          VisualDensity.comfortable);
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
        FlexColorScheme.createPrimarySwatch(col),
      );
    });
    test(
        'FCS4.02: GIVEN color: $col '
        'EXPECT Color(swatch.value) equal to $col', () {
      expect(
        Color(FlexColorScheme.createPrimarySwatch(col).value),
        col,
      );
    });
    test(
        'FCS4.03: GIVEN color: $col '
        'EXPECT swatch[50] equal to Color(0xffa973f6)', () {
      expect(
        FlexColorScheme.createPrimarySwatch(col)[50],
        const Color(0xffa973f6),
      );
    });
    test(
        'FCS4.04: GIVEN color: $col '
        'EXPECT swatch[100] equal to Color(0xffa166f5)', () {
      expect(
        FlexColorScheme.createPrimarySwatch(col)[100],
        const Color(0xffa166f5),
      );
    });
    test(
        'FCS4.05: GIVEN color: $col '
        'EXPECT swatch[200] equal to Color(0xff914df3)', () {
      expect(
        FlexColorScheme.createPrimarySwatch(col)[200],
        const Color(0xff914df3),
      );
    });
    test(
        'FCS4.06: GIVEN color: $col '
        'EXPECT swatch[300] equal to Color(0xff8133f1)', () {
      expect(
        FlexColorScheme.createPrimarySwatch(col)[300],
        const Color(0xff8133f1),
      );
    });
    test(
        'FCS4.07: GIVEN color: $col '
        'EXPECT swatch[400] equal to Color(0xff7219f0)', () {
      expect(
        FlexColorScheme.createPrimarySwatch(col)[400],
        const Color(0xff7219f0),
      );
    });
    test(
        'FCS4.08: GIVEN color: $col '
        'EXPECT swatch[500] equal to $col', () {
      expect(
        FlexColorScheme.createPrimarySwatch(col)[500],
        col,
      );
    });
    test(
        'FCS4.09: GIVEN color: $col '
        'EXPECT swatch[600] equal to Color(0xff5800d6)', () {
      expect(
        FlexColorScheme.createPrimarySwatch(col)[600],
        const Color(0xff5800d6),
      );
    });
    test(
        'FCS4.10: GIVEN color: $col '
        'EXPECT swatch[700] equal to Color(0xff4e00be)', () {
      expect(
        FlexColorScheme.createPrimarySwatch(col)[700],
        const Color(0xff4e00be),
      );
    });
    test(
        'FCS4.11: GIVEN color: $col '
        'EXPECT swatch[800] equal to Color(0xff4500a7)', () {
      expect(
        FlexColorScheme.createPrimarySwatch(col)[800],
        const Color(0xff4500a7),
      );
    });
    test(
        'FCS4.12: GIVEN color: $col '
        'EXPECT swatch[900] equal to Color(0xff3b008f)', () {
      expect(
        FlexColorScheme.createPrimarySwatch(col)[900],
        const Color(0xff3b008f),
      );
    });
  });

  //****************************************************************************
  // FlexColorScheme.themedSystemNavigationBar unit tests.
  //
  // Validate that "themedSystemNavigationBar" function, with produces expected
  // SystemUiOverlayStyle to be used in an AnnotatedRegion.
  // The test uses debug input values that they effect when it is used with a
  // BuildContext that is null in plain unit tests.
  //
  // A starter for using it in a Widget test is available in
  // 'flex_color_scheme_region_widget_test.dart' in FCS6.
  //****************************************************************************
  group('FCS5: WITH FlexColorScheme.themedSystemNavigationBar ', () {
    test(
        'FCS5.01: GIVEN Brightness.light divider:true '
        'EXPECT white system navbar, with divider', () {
      expect(
        FlexColorScheme.themedSystemNavigationBar(null),
        const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white,
          systemNavigationBarDividerColor: Color(0xFFDDDDDD),
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      );
    });
    test(
        'FCS5.02: GIVEN Brightness.light divider:false '
        'EXPECT white system navbar, with NO divider', () {
      expect(
        FlexColorScheme.themedSystemNavigationBar(
          null,
          useDivider: false,
        ),
        const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      );
    });
    test(
        'FCS5.03: GIVEN Brightness.light divider:false + defined color '
        'EXPECT defined colored system navbar, with NO divider.', () {
      expect(
        FlexColorScheme.themedSystemNavigationBar(
          null,
          useDivider: false,
          nullContextBackground: const Color(0xFFCCCCCC),
        ),
        const SystemUiOverlayStyle(
          systemNavigationBarColor: Color(0xFFCCCCCC),
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      );
    });
    test(
        'FCS5.04: GIVEN Brightness.dark divider:true '
        'EXPECT black system navbar, with divider', () {
      expect(
        FlexColorScheme.themedSystemNavigationBar(
          null,
          nullContextBrightness: Brightness.dark,
        ),
        const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.black,
          systemNavigationBarDividerColor: Color(0xFF2C2C2C),
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      );
    });
    test(
        'FCS5.05: GIVEN Brightness.dark divider:false '
        'EXPECT black system navbar, with NO divider', () {
      expect(
        FlexColorScheme.themedSystemNavigationBar(
          null,
          useDivider: false,
          nullContextBrightness: Brightness.dark,
        ),
        const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      );
    });
    test(
        'FCS5.06: GIVEN Brightness.dark divider:false + defined color '
        'EXPECT defined colored system navbar, with NO divider.', () {
      expect(
        FlexColorScheme.themedSystemNavigationBar(
          null,
          useDivider: false,
          nullContextBrightness: Brightness.dark,
          nullContextBackground: const Color(0xFF202020),
        ),
        const SystemUiOverlayStyle(
          systemNavigationBarColor: Color(0xFF202020),
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      );
    });
    test(
        'FCS5.07: GIVEN Brightness.dark divider:false + defined color '
        '+ opacity > 1 EXPECT defined colored system navbar, with NO divider '
        'and NO opacity.', () {
      expect(
        FlexColorScheme.themedSystemNavigationBar(
          null,
          useDivider: false,
          opacity: 100,
          nullContextBrightness: Brightness.dark,
          nullContextBackground: const Color(0xFF202020),
        ),
        const SystemUiOverlayStyle(
          systemNavigationBarColor: Color(0xFF202020),
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      );
    });
    test(
        'FCS5.07: GIVEN Brightness.dark divider:true + defined color '
        '+ opacity = 1 EXPECT defined colored system navbar, with divider '
        'and NO opacity.', () {
      expect(
        FlexColorScheme.themedSystemNavigationBar(
          null,
          // ignore: avoid_redundant_argument_values
          useDivider: true,
          // ignore: avoid_redundant_argument_values
          opacity: 1,
          nullContextBrightness: Brightness.dark,
          nullContextBackground: const Color(0xFF202020),
        ),
        const SystemUiOverlayStyle(
          systemNavigationBarColor: Color(0xFF202020),
          systemNavigationBarDividerColor: Color(0xFF2C2C2C),
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      );
    });
    test(
        'FCS5.08: GIVEN Brightness.dark divider:true + defined color '
        '+ opacity = 0 EXPECT fully transparent defined colored system '
        'navbar, with divider .', () {
      expect(
        FlexColorScheme.themedSystemNavigationBar(
          null,
          // ignore: avoid_redundant_argument_values
          useDivider: true,
          // ignore: avoid_redundant_argument_values
          opacity: 0,
          nullContextBrightness: Brightness.dark,
          nullContextBackground: const Color(0xFF202020),
        ),
        const SystemUiOverlayStyle(
          systemNavigationBarColor: Color(0x00202020),
          systemNavigationBarDividerColor: Color(0xFF2C2C2C),
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      );
    });
    test(
        'FCS5.09: GIVEN Brightness.dark divider:true + defined color '
        '+ opacity < 0 EXPECT fully transparent defined colored system '
        'navbar, with divider .', () {
      expect(
        FlexColorScheme.themedSystemNavigationBar(
          null,
          // ignore: avoid_redundant_argument_values
          useDivider: true,
          // ignore: avoid_redundant_argument_values
          opacity: -10.1,
          nullContextBrightness: Brightness.dark,
          nullContextBackground: const Color(0xFF202020),
        ),
        const SystemUiOverlayStyle(
          systemNavigationBarColor: Color(0x00202020),
          systemNavigationBarDividerColor: Color(0xFF2C2C2C),
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      );
    });
  });
}
