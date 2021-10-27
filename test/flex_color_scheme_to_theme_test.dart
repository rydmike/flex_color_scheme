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
        'FCS7.00RawL: GIVEN FlexColorScheme() made with min required light '
        'params that equals default Material light scheme '
        'EXPECT its ThemeData to be equal to one made with light scheme with '
        'no parameters.', () {
      expect(
          const FlexColorScheme(
            brightness: Brightness.light,
            primary: FlexColor.materialLightPrimary,
            primaryVariant: FlexColor.materialLightPrimaryVariant,
            secondary: FlexColor.materialLightSecondary,
            secondaryVariant: FlexColor.materialLightSecondaryVariant,
          ).toTheme,
          equals(FlexColorScheme.light().toTheme));
    });
    test(
        'FCS7.00DefL: GIVEN FlexColorScheme.light made with no parameters '
        'EXPECT its ThemeData to be equal to one made with light scheme.', () {
      expect(
        FlexColorScheme.light().toTheme,
        equals(FlexColorScheme.light(
          colors: FlexColor.schemes[FlexScheme.material]!.light,
        ).toTheme),
      );
    });
    test(
        'FCS7.00aL: GIVEN two FlexColorScheme.light made with identical '
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
        'FCS7.00bL: GIVEN a FlexColorScheme.light made with no '
        'parameters EXPECT ThemeData to be equal to one made with '
        'scheme FlexScheme.material.', () {
      expect(
        FlexColorScheme.light().toTheme,
        equals(FlexColorScheme.light(scheme: FlexScheme.material).toTheme),
      );
    });
    test(
        'FCS7.00cL: GIVEN a FlexColorScheme.light made with colors '
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
        'FCS7.00dL: GIVEN a FlexColorScheme.light made with scheme '
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
        'FCS7.00RawD: GIVEN FlexColorScheme() made with min required dark '
        'params that equals default Material dark scheme '
        'EXPECT its ThemeData to be equal to one made with dark scheme with '
        'no parameters.', () {
      expect(
          const FlexColorScheme(
            brightness: Brightness.dark,
            primary: FlexColor.materialDarkPrimary,
            primaryVariant: FlexColor.materialDarkPrimaryVariant,
            secondary: FlexColor.materialDarkSecondary,
            secondaryVariant: FlexColor.materialDarkSecondaryVariant,
          ).toTheme,
          equals(FlexColorScheme.dark().toTheme));
    });

    // themeDark = Default material dark scheme colors.
    test(
        'FCS7.00SwapL: GIVEN FlexColorScheme.light(swapColors: true) EXPECT it '
        'to be equal to one made with light scheme colors swapped ', () {
      expect(
        FlexColorScheme.light(
          swapColors: true,
        ).toTheme,
        equals(const FlexColorScheme(
          brightness: Brightness.light,
          primary: FlexColor.materialLightSecondary,
          primaryVariant: FlexColor.materialLightSecondaryVariant,
          secondary: FlexColor.materialLightPrimary,
          secondaryVariant: FlexColor.materialLightPrimaryVariant,
        ).toTheme),
      );
    });

    // themeDark = Default material dark scheme colors.
    test(
        'FCS7.00SwapD: GIVEN FlexColorScheme.dark(swapColors: true) EXPECT it '
        'to be equal to one made with dark scheme colors swapped ', () {
      expect(
        FlexColorScheme.dark(
          swapColors: true,
        ).toTheme,
        equals(const FlexColorScheme(
          brightness: Brightness.dark,
          primary: FlexColor.materialDarkSecondary,
          primaryVariant: FlexColor.materialDarkSecondaryVariant,
          secondary: FlexColor.materialDarkPrimary,
          secondaryVariant: FlexColor.materialDarkPrimaryVariant,
        ).toTheme),
      );
    });

    test(
        'FCS7.00DefL: GIVEN FlexColorScheme.dark made with no parameters '
        'EXPECT its ThemeData to be equal to one made with light scheme.', () {
      expect(
        FlexColorScheme.dark().toTheme,
        equals(FlexColorScheme.dark(
          colors: FlexColor.schemes[FlexScheme.material]!.dark,
        ).toTheme),
      );
    });
    test(
        'FCS7.00aD: GIVEN two FlexColorScheme.dark made with identical '
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
        'FCS7.00bD: GIVEN a FlexColorScheme.dark made with no '
        'parameters EXPECT ThemeData to be equal to one made with '
        'scheme FlexScheme.material.', () {
      expect(FlexColorScheme.dark().toTheme,
          FlexColorScheme.dark(scheme: FlexScheme.material).toTheme);
    });
    test(
        'FCS7.00cD: GIVEN a FlexColorScheme.dark made with colors '
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
        'FCS7.00dD: GIVEN a FlexColorScheme.dark made with scheme '
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
        'FCS7.00eL: GIVEN a FlexColorScheme() made with scheme default '
        'constructor + light and '
        'material EXPECT ThemeData to be equal to an identical one.', () {
      expect(
        const FlexColorScheme(
          brightness: Brightness.light,
          primary: FlexColor.materialLightPrimary,
          primaryVariant: FlexColor.materialLightPrimaryVariant,
          secondary: FlexColor.materialLightSecondary,
          secondaryVariant: FlexColor.materialLightSecondaryVariant,
        ).toTheme,
        equals(const FlexColorScheme(
          brightness: Brightness.light,
          primary: FlexColor.materialLightPrimary,
          primaryVariant: FlexColor.materialLightPrimaryVariant,
          secondary: FlexColor.materialLightSecondary,
          secondaryVariant: FlexColor.materialLightSecondaryVariant,
        ).toTheme),
      );
    });

    test(
        'FCS7.00eD: GIVEN a FlexColorScheme() made with scheme default '
        'constructor + dark and '
        'material EXPECT ThemeData to be equal to an identical one.', () {
      expect(
        const FlexColorScheme(
          brightness: Brightness.dark,
          primary: FlexColor.materialDarkPrimary,
          primaryVariant: FlexColor.materialDarkPrimaryVariant,
          secondary: FlexColor.materialDarkSecondary,
          secondaryVariant: FlexColor.materialDarkSecondaryVariant,
        ).toTheme,
        equals(const FlexColorScheme(
          brightness: Brightness.dark,
          primary: FlexColor.materialDarkPrimary,
          primaryVariant: FlexColor.materialDarkPrimaryVariant,
          secondary: FlexColor.materialDarkSecondary,
          secondaryVariant: FlexColor.materialDarkSecondaryVariant,
        ).toTheme),
      );
    });

    // themeLight = Default material light scheme colors.
    final ThemeData themeLight = const FlexColorScheme(
      brightness: Brightness.light,
      primary: FlexColor.materialLightPrimary,
      primaryVariant: FlexColor.materialLightPrimaryVariant,
      secondary: FlexColor.materialLightSecondary,
      secondaryVariant: FlexColor.materialLightSecondaryVariant,
    ).toTheme;
    // themeDark = Default material dark scheme colors.
    final ThemeData themeDark = const FlexColorScheme(
      brightness: Brightness.dark,
      primary: FlexColor.materialDarkPrimary,
      primaryVariant: FlexColor.materialDarkPrimaryVariant,
      secondary: FlexColor.materialDarkSecondary,
      secondaryVariant: FlexColor.materialDarkSecondaryVariant,
      // For the dark theme to be equal to ThemeData.from colorscheme dark we
      // have to override the computed onError color for the standard Material
      // dark error color. This is because the Material standard defines
      // the onColor for the used error color in the dark theme to Black instead
      // of white, which the Flutter brightness calculation algorithm says
      // it should use and that FlexColorScheme uses by default.
      // I don't know why they chose black for the text on the error color in
      // ColorScheme.dark, the white color that gets chosen based on their
      // own algorithm actually looks better. In Any case we just have to
      // specify the onError color then FlexColorScheme.toTheme uses that
      // instead of calculating from its default dark scheme error color.
      onError: Colors.black,
    ).toTheme;

    test(
        'FCS7.01: GIVEN a FlexColorScheme theme with Material scheme light '
        'colors EXPECT .colorScheme equality with ColorScheme.light().', () {
      expect(
        themeLight.colorScheme,
        equals(const ColorScheme.light()),
      );
    });
    test(
        'FCS7.02: GIVEN a FlexColorScheme theme with Material scheme dark '
        'colors EXPECT .colorScheme equality with ColorScheme.dark().', () {
      expect(
        themeDark.colorScheme,
        equals(
          const ColorScheme.dark(),
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
        'createPrimarySwatch(primaryColor)[800].', () {
      expect(
        themeLight.primaryColorDark,
        equals(lightSwatch[800]),
      );
    });
    test(
        'FCS7.10: GIVEN a FlexColorScheme theme with Material scheme dark '
        'colors EXPECT primaryColorDark equality with '
        'createPrimarySwatch(primaryColor)[700].', () {
      expect(
        themeDark.primaryColorDark,
        equals(darkSwatch[700]),
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
        'createPrimarySwatch(primaryColor)[50].', () {
      expect(
        themeDark.secondaryHeaderColor,
        equals(darkSwatch[50]),
      );
    });

    //**************************************************************************
    // FlexColorScheme.light & dark factory tests. With LIGHT surface branding.
    //
    // Test result with custom features like surface, appbar, tab bar options.
    //**************************************************************************

    final ThemeData tLightL = FlexColorScheme.light(
      colors: FlexColor.schemes[FlexScheme.material]!.light,
      surfaceStyle: FlexSurface.light,
      appBarStyle: FlexAppBarStyle.surface,
      tabBarStyle: FlexTabBarStyle.forBackground,
    ).toTheme;

    final ThemeData tDarkL = FlexColorScheme.dark(
      colors: FlexColor.schemes[FlexScheme.material]!.dark,
      surfaceStyle: FlexSurface.light,
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
        'WITH FlexSurface.light EXPECT surface Color(0xffffffff).', () {
      expect(tLightL.colorScheme.surface, equals(const Color(0xffffffff)));
    });
    test(
        'FCS7.21: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH FlexSurface.light EXPECT surface Color(0xff141315).', () {
      expect(tDarkL.colorScheme.surface, equals(const Color(0xff141315)));
    });

    test(
        'FCS7.22: GIVEN a FlexColorScheme.light theme FROM scheme "material" '
        'WITH FlexSurface.light EXPECT background Color(0xfff9f8fc).', () {
      expect(tLightL.colorScheme.background, equals(const Color(0xfff9f8fc)));
    });
    test(
        'FCS7.23: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH FlexSurface.light EXPECT background Color(0xff18151b).', () {
      expect(tDarkL.colorScheme.background, equals(const Color(0xff18151b)));
    });

    test(
        'FCS7.24: GIVEN a FlexColorScheme.light theme FROM scheme "material" '
        'WITH FlexSurface.light EXPECT scaffold '
        'background Color(0xffffffff).', () {
      expect(tLightL.scaffoldBackgroundColor, equals(const Color(0xffffffff)));
    });
    test(
        'FCS7.25: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH FlexSurface.light EXPECT scaffold '
        'background Color(0xff121212).', () {
      expect(tDarkL.scaffoldBackgroundColor, equals(const Color(0xff121212)));
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
        'FCS7.296: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
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
      surfaceStyle: FlexSurface.medium,
      appBarStyle: FlexAppBarStyle.material,
      appBarElevation: 1,
      // ignore: avoid_redundant_argument_values
      tabBarStyle: FlexTabBarStyle.forAppBar,
    ).toTheme;

    final ThemeData tDarkM = FlexColorScheme.dark(
      colors: FlexColor.schemes[FlexScheme.material]!.dark,
      surfaceStyle: FlexSurface.medium,
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
        'WITH FlexSurface.medium EXPECT surface Color(0xfffdfdfe).', () {
      expect(tLightM.colorScheme.surface, equals(const Color(0xfffdfdfe)));
    });
    test(
        'FCS7.37: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH FlexSurface.medium EXPECT surface Color(0xff17151a).', () {
      expect(tDarkM.colorScheme.surface, equals(const Color(0xff17151a)));
    });

    test(
        'FCS7.38: GIVEN a FlexColorScheme.light theme FROM scheme "material" '
        'WITH FlexSurface.medium EXPECT background Color(0xfff6f3fc).', () {
      expect(tLightM.colorScheme.background, equals(const Color(0xfff6f3fc)));
    });
    test(
        'FCS7.24: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH FlexSurface.medium EXPECT background Color(0xff1d1922).', () {
      expect(tDarkM.colorScheme.background, equals(const Color(0xff1d1922)));
    });

    test(
        'FCS7.39: GIVEN a FlexColorScheme.light theme FROM scheme "material" '
        'WITH FlexSurface.medium EXPECT scaffold '
        'background Color(0xffffffff).', () {
      expect(tLightM.scaffoldBackgroundColor, equals(const Color(0xffffffff)));
    });
    test(
        'FCS7.40: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH FlexSurface.medium EXPECT scaffold '
        'background Color(0xff121212).', () {
      expect(tDarkM.scaffoldBackgroundColor, equals(const Color(0xff121212)));
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
      surfaceStyle: FlexSurface.strong,
      appBarStyle: FlexAppBarStyle.custom,
      appBarElevation: 6,
      // ignore: avoid_redundant_argument_values
      tabBarStyle: FlexTabBarStyle.forAppBar,
    ).toTheme;

    final ThemeData tDarkS = FlexColorScheme.dark(
      colors: FlexColor.schemes[FlexScheme.material]!.dark,
      surfaceStyle: FlexSurface.strong,
      // ignore: avoid_redundant_argument_values
      appBarStyle: FlexAppBarStyle.material,
      appBarElevation: 6,
      // ignore: avoid_redundant_argument_values
      tabBarStyle: FlexTabBarStyle.forAppBar,
    ).toTheme;

    test(
        'FCS7.47: GIVEN a FlexColorScheme.light theme FROM scheme "material" '
        'WITH FlexAppBarStyle.material EXPECT appbar theme color '
        'FlexColor.materialLightSurface.', () {
      expect(
        tLightS.appBarTheme.backgroundColor,
        equals(tLightS.colorScheme.secondaryVariant),
      );
    });
    test(
        'FCS7.48: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH FlexAppBarStyle.primary EXPECT appbar theme color '
        'colorScheme.primary.', () {
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
        'WITH FlexSurface.strong EXPECT surface Color(0xfffbfafe).', () {
      expect(tLightS.colorScheme.surface, equals(const Color(0xfffbfafe)));
    });
    test(
        'FCS7.52: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH FlexSurface.strong EXPECT surface Color(0xff1b171e).', () {
      expect(tDarkS.colorScheme.surface, equals(const Color(0xff1b171e)));
    });

    test(
        'FCS7.53: GIVEN a FlexColorScheme.light theme FROM scheme "material" '
        'WITH FlexSurface.strong EXPECT background Color(0xfff3eefc).', () {
      expect(tLightS.colorScheme.background, equals(const Color(0xfff3eefc)));
    });
    test(
        'FCS7.54: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH FlexSurface.strong EXPECT background Color(0xff221c29).', () {
      expect(tDarkS.colorScheme.background, equals(const Color(0xff221c29)));
    });

    test(
        'FCS7.55: GIVEN a FlexColorScheme.light theme FROM scheme "material" '
        'WITH FlexSurface.strong EXPECT scaffold '
        'background Color(0xffffffff).', () {
      expect(tLightS.scaffoldBackgroundColor, equals(const Color(0xffffffff)));
    });
    test(
        'FCS7.56: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH FlexSurface.strong EXPECT scaffold '
        'background Color(0xff121212).', () {
      expect(tDarkS.scaffoldBackgroundColor, equals(const Color(0xff121212)));
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
      surfaceStyle: FlexSurface.heavy,
      appBarStyle: FlexAppBarStyle.background,
      appBarElevation: 2,
      tabBarStyle: FlexTabBarStyle.forBackground,
      tooltipsMatchBackground: true,
      transparentStatusBar: false,
      bottomAppBarElevation: 1,
    ).toTheme;

    final ThemeData tDarkH = FlexColorScheme.dark(
      colors: FlexColor.schemes[FlexScheme.material]!.dark,
      surfaceStyle: FlexSurface.heavy,
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
        'WITH FlexSurface.heavy EXPECT surface Color(0xfffaf8fe).', () {
      expect(tLightH.colorScheme.surface, equals(const Color(0xfffaf8fe)));
    });
    test(
        'FCS7.68: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH FlexSurface.heavy EXPECT surface Color(0xff1e1a23).', () {
      expect(tDarkH.colorScheme.surface, equals(const Color(0xff1e1a23)));
    });

    test(
        'FCS7.69: GIVEN a FlexColorScheme.light theme FROM scheme "material" '
        'WITH FlexSurface.heavy EXPECT background Color(0xfff0e9fb).', () {
      expect(tLightH.colorScheme.background, equals(const Color(0xfff0e9fb)));
    });
    test(
        'FCS7.70: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH FlexSurface.heavy EXPECT background Color(0xff272030).', () {
      expect(tDarkH.colorScheme.background, equals(const Color(0xff272030)));
    });

    test(
        'FCS7.71: GIVEN a FlexColorScheme.light theme FROM scheme "material" '
        'WITH FlexSurface.heavy EXPECT scaffold '
        'background Color(0xfffdfdfe).', () {
      expect(tLightH.scaffoldBackgroundColor, equals(const Color(0xfffdfdfe)));
    });
    test(
        'FCS7.72: GIVEN a FlexColorScheme.dark theme FROM scheme "material" '
        'WITH FlexSurface.heavy EXPECT scaffold '
        'background Color(0xff151416).', () {
      expect(tDarkH.scaffoldBackgroundColor, equals(const Color(0xff151416)));
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
    // Just verify not failing (coverage), should check result as well later.
    // TODO(rydmike): Improve these tests so they verify the results too.
    //**************************************************************************

    final ThemeData tLightH2 = FlexColorScheme.light(
      colors: FlexColor.schemes[FlexScheme.mandyRed]!.light,
      surfaceStyle: FlexSurface.heavy,
      appBarStyle: FlexAppBarStyle.background,
      tabBarStyle: FlexTabBarStyle.forBackground,
      usedColors: 2,
    ).toTheme;

    final ThemeData tDarkH2 = FlexColorScheme.dark(
      colors: FlexColor.schemes[FlexScheme.mandyRed]!.dark,
      surfaceStyle: FlexSurface.heavy,
      appBarStyle: FlexAppBarStyle.background,
      tabBarStyle: FlexTabBarStyle.forBackground,
      darkIsTrueBlack: true,
      usedColors: 2,
    ).toTheme;

    test(
        'FCS7.79: GIVEN a FlexColorScheme.light with heavy branding and 2 '
        'colors EXPECT none null result.', () {
      expect(tLightH2, isNotNull);
    });
    test(
        'FCS7.80: GIVEN a FlexColorScheme.dark with heavy branding and '
        '2 colors and true black EXPECT none null result.', () {
      expect(tDarkH2, isNotNull);
    });

    final ThemeData tLightH3 = FlexColorScheme.light(
      colors: FlexColor.schemes[FlexScheme.mandyRed]!.light,
      surfaceStyle: FlexSurface.heavy,
      appBarStyle: FlexAppBarStyle.background,
      tabBarStyle: FlexTabBarStyle.forBackground,
      usedColors: 3,
    ).toTheme;

    final ThemeData tDarkH3 = FlexColorScheme.dark(
      colors: FlexColor.schemes[FlexScheme.mandyRed]!.dark,
      surfaceStyle: FlexSurface.heavy,
      appBarStyle: FlexAppBarStyle.background,
      tabBarStyle: FlexTabBarStyle.forBackground,
      darkIsTrueBlack: true,
      usedColors: 3,
    ).toTheme;

    test(
        'FCS7.81: GIVEN a FlexColorScheme.light with heavy branding and 3 '
        'colors EXPECT none null result.', () {
      expect(tLightH3, isNotNull);
    });
    test(
        'FCS7.82: GIVEN a FlexColorScheme.dark with heavy branding and '
        '3 colors and true black EXPECT none null result.', () {
      expect(tDarkH3, isNotNull);
    });

    //**************************************************************************
    // FlexColorScheme.light & dark factory tests. With CUSTOM surface branding.
    //
    // Test result with custom features like surface, appbar, tab bar options.
    // Just verify not failing (coverage), should check result as well later.
    // TODO(rydmike): Improve these tests so they verify the results too.
    //**************************************************************************

    final ThemeData tLightC = FlexColorScheme.light(
      colors: FlexColor.schemes[FlexScheme.mandyRed]!.light,
      surfaceStyle: FlexSurface.custom,
      appBarStyle: FlexAppBarStyle.custom,
      appBarElevation: 2,
      tabBarStyle: FlexTabBarStyle.forBackground,
      tooltipsMatchBackground: true,
      transparentStatusBar: false,
      bottomAppBarElevation: 1,
      usedColors: 1,
    ).toTheme;

    final ThemeData tDarkC = FlexColorScheme.dark(
      colors: FlexColor.schemes[FlexScheme.mandyRed]!.dark,
      surfaceStyle: FlexSurface.custom,
      appBarStyle: FlexAppBarStyle.custom,
      appBarElevation: 4,
      tabBarStyle: FlexTabBarStyle.forBackground,
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

    // With surface and background colors defined
    final ThemeData tLightC2 = FlexColorScheme.light(
      colors: FlexColor.schemes[FlexScheme.mandyRed]!.light,
      surfaceStyle: FlexSurface.custom,
      appBarStyle: FlexAppBarStyle.custom,
      appBarElevation: 2,
      tabBarStyle: FlexTabBarStyle.forBackground,
      tooltipsMatchBackground: true,
      transparentStatusBar: false,
      bottomAppBarElevation: 1,
      usedColors: 3,
      surface: FlexColor.materialLightSurface,
      background: FlexColor.materialLightBackground,
      scaffoldBackground: FlexColor.materialLightBackground,
      applyElevationOverlayColor: false,
    ).toTheme;

    final ThemeData tDarkC2 = FlexColorScheme.dark(
      colors: FlexColor.schemes[FlexScheme.mandyRed]!.dark,
      surfaceStyle: FlexSurface.custom,
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
      surfaceStyle: FlexSurface.custom,
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
