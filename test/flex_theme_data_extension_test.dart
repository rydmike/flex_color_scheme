import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  //****************************************************************************
  // FlexThemeData unit tests.
  //
  // The FlexThemeData extension is the core feature of `FlexColorScheme`
  // it returns ThemeData object from the defined color scheme.
  // Below we test that its key properties as as expected.
  //****************************************************************************
  group('FTD1: WITH FlexColorScheme.toTheme ', () {
    debugDefaultTargetPlatformOverride = null;
    TestWidgetsFlutterBinding.ensureInitialized();

    test(
        'FTD1.00RawL: GIVEN FlexThemeData.raw() made with min required light '
        'params that equals default Material light scheme '
        'EXPECT its FlexThemeData to be equal to one made with light scheme '
        'with no parameters.', () {
      expect(
        FlexThemeData.raw(
          brightness: Brightness.light,
          primary: FlexColor.materialLightPrimary,
          primaryVariant: FlexColor.materialLightPrimaryVariant,
          secondary: FlexColor.materialLightSecondary,
          secondaryVariant: FlexColor.materialLightSecondaryVariant,
        ),
        equals(FlexThemeData.light()),
      );
    });
    test(
        'FTD1.00DefL: GIVEN FlexThemeData.light made with no parameters '
        'EXPECT its ThemeData to be equal to one made with light scheme.', () {
      expect(
          FlexThemeData.light(),
          equals(FlexColorScheme.light(
            colors: FlexColor.schemes[FlexScheme.material]!.light,
          ).toTheme));
    });
    test(
        'FTD1.00aL: GIVEN two FlexThemeData.light made with identical '
        'parameters EXPECT their ThemeData to be equal.', () {
      expect(
          FlexThemeData.light(
            colors: FlexColor.schemes[FlexScheme.material]!.light,
          ),
          equals(FlexThemeData.light(
            colors: FlexColor.schemes[FlexScheme.material]!.light,
          )));
    });
    test(
        'FTD1.00bL: GIVEN a FlexThemeData.light made with no '
        'parameters EXPECT ThemeData to be equal to one made with '
        'scheme FlexScheme.material.', () {
      expect(FlexThemeData.light(),
          FlexThemeData.light(scheme: FlexScheme.material));
    });
    test(
        'FTD1.00cL: GIVEN a FlexThemeData.light made with colors '
        'material EXPECT ThemeData to be equal to one made with '
        'scheme FlexScheme.material.', () {
      expect(
          FlexThemeData.light(
            colors: FlexColor.schemes[FlexScheme.material]!.light,
          ),
          FlexThemeData.light(
            scheme: FlexScheme.material,
          ));
    });
    test(
        'FTD1.00dL: GIVEN a FlexThemeData.light made with scheme '
        'material EXPECT ThemeData to be equal to one made with '
        'no params.', () {
      expect(
          FlexThemeData.light(
            colors: FlexColor.schemes[FlexScheme.material]!.light,
          ),
          FlexThemeData.light());
    });

    test(
        'FTD1.00RawD: GIVEN FlexThemeData.raw() made with min required dark '
        'params that equals default Material dark scheme '
        'EXPECT its ThemeData to be equal to one made with dark scheme with '
        'no parameters.', () {
      expect(
          FlexThemeData.raw(
            brightness: Brightness.dark,
            primary: FlexColor.materialDarkPrimary,
            primaryVariant: FlexColor.materialDarkPrimaryVariant,
            secondary: FlexColor.materialDarkSecondary,
            secondaryVariant: FlexColor.materialDarkSecondaryVariant,
          ),
          equals(FlexThemeData.dark()));
    });

    // themeDark = Default material dark scheme colors.
    test(
        'FTD1.00SwapL: GIVEN FlexThemeData.light(swapColors: true) EXPECT it '
        'to be equal to one made with light scheme colors swapped ', () {
      expect(
          FlexThemeData.light(
            swapColors: true,
          ),
          equals(FlexThemeData.raw(
            brightness: Brightness.light,
            primary: FlexColor.materialLightSecondary,
            primaryVariant: FlexColor.materialLightSecondaryVariant,
            secondary: FlexColor.materialLightPrimary,
            secondaryVariant: FlexColor.materialLightPrimaryVariant,
          )));
    });

    // themeDark = Default material dark scheme colors.
    test(
        'FTD1.00SwapD: GIVEN FlexThemeData.dark(swapColors: true) EXPECT it '
        'to be equal to one made with dark scheme colors swapped ', () {
      expect(
          FlexThemeData.dark(
            swapColors: true,
          ),
          equals(FlexThemeData.raw(
            brightness: Brightness.dark,
            primary: FlexColor.materialDarkSecondary,
            primaryVariant: FlexColor.materialDarkSecondaryVariant,
            secondary: FlexColor.materialDarkPrimary,
            secondaryVariant: FlexColor.materialDarkPrimaryVariant,
          )));
    });

    test(
        'FTD1.00DefL: GIVEN FlexThemeData.dark made with no parameters '
        'EXPECT its ThemeData to be equal to one made with light scheme.', () {
      expect(
          FlexThemeData.dark(),
          equals(FlexThemeData.dark(
            colors: FlexColor.schemes[FlexScheme.material]!.dark,
          )));
    });
    test(
        'FTD1.00aD: GIVEN two FlexThemeData.dark made with identical '
        'parameters EXPECT their ThemeData to be equal.', () {
      expect(
          FlexThemeData.dark(
            colors: FlexColor.schemes[FlexScheme.material]!.dark,
          ),
          FlexThemeData.dark(
            colors: FlexColor.schemes[FlexScheme.material]!.dark,
          ));
    });
    test(
        'FTD1.00bD: GIVEN a FlexThemeData.dark made with no '
        'parameters EXPECT ThemeData to be equal to one made with '
        'scheme FlexScheme.material.', () {
      expect(FlexThemeData.dark(),
          FlexThemeData.dark(scheme: FlexScheme.material));
    });
    test(
        'FTD1.00cD: GIVEN a FlexThemeData.dark made with colors '
        'material EXPECT ThemeData to be equal to one made with '
        'scheme FlexScheme.material.', () {
      expect(
          FlexThemeData.dark(
            colors: FlexColor.schemes[FlexScheme.material]!.dark,
          ),
          FlexThemeData.dark(
            scheme: FlexScheme.material,
          ));
    });
    test(
        'FTD1.00dD: GIVEN a FlexThemeData.dark made with scheme '
        'material EXPECT ThemeData to be equal to one made with '
        'no params.', () {
      expect(
          FlexThemeData.dark(
            colors: FlexColor.schemes[FlexScheme.material]!.dark,
          ),
          FlexThemeData.dark());
    });

    test(
        'FTD1.00eL: GIVEN a FlexThemeData.raw() made with scheme default '
        'constructor + light and '
        'material EXPECT ThemeData to be equal to an identical one.', () {
      expect(
          FlexThemeData.raw(
            brightness: Brightness.light,
            primary: FlexColor.materialLightPrimary,
            primaryVariant: FlexColor.materialLightPrimaryVariant,
            secondary: FlexColor.materialLightSecondary,
            secondaryVariant: FlexColor.materialLightSecondaryVariant,
          ),
          equals(FlexThemeData.raw(
            brightness: Brightness.light,
            primary: FlexColor.materialLightPrimary,
            primaryVariant: FlexColor.materialLightPrimaryVariant,
            secondary: FlexColor.materialLightSecondary,
            secondaryVariant: FlexColor.materialLightSecondaryVariant,
          )));
    });

    test(
        'FTD1.00eD: GIVEN a FlexThemeData.raw() made with scheme default '
        'constructor + dark and '
        'material EXPECT ThemeData to be equal to an identical one.', () {
      expect(
          FlexThemeData.raw(
            brightness: Brightness.dark,
            primary: FlexColor.materialDarkPrimary,
            primaryVariant: FlexColor.materialDarkPrimaryVariant,
            secondary: FlexColor.materialDarkSecondary,
            secondaryVariant: FlexColor.materialDarkSecondaryVariant,
          ),
          FlexThemeData.raw(
            brightness: Brightness.dark,
            primary: FlexColor.materialDarkPrimary,
            primaryVariant: FlexColor.materialDarkPrimaryVariant,
            secondary: FlexColor.materialDarkSecondary,
            secondaryVariant: FlexColor.materialDarkSecondaryVariant,
          ));
    });

    // themeLight = Default material light scheme colors.
    final ThemeData themeLight = FlexThemeData.raw(
      brightness: Brightness.light,
      primary: FlexColor.materialLightPrimary,
      primaryVariant: FlexColor.materialLightPrimaryVariant,
      secondary: FlexColor.materialLightSecondary,
      secondaryVariant: FlexColor.materialLightSecondaryVariant,
    );
    // themeDark = Default material dark scheme colors.
    final ThemeData themeDark = FlexThemeData.raw(
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
    );

    test(
        'FTD1.01: GIVEN a FlexThemeData.raw theme with Material scheme light '
        'colors EXPECT .colorScheme equality with ColorScheme.light().', () {
      expect(themeLight.colorScheme, const ColorScheme.light());
    });
    test(
        'FTD1.02: GIVEN a FlexColorScheme theme with Material scheme dark '
        'colors EXPECT .colorScheme equality with ColorScheme.dark().', () {
      expect(themeDark.colorScheme, const ColorScheme.dark());
    });

    //**************************************************************************
    // Test defaults and null input resulting in expected theme values.
    //**************************************************************************
    test(
        'FTD1.03: GIVEN a FlexThemeData.raw theme with Material scheme light '
        'colors EXPECT appbar theme color to be primary color.', () {
      expect(themeLight.appBarTheme.backgroundColor,
          themeLight.colorScheme.primary);
    });

    test(
        'FTD1.04: GIVEN a FlexThemeData.raw theme with Material scheme dark '
        'colors EXPECT appbar theme color to be surface color.', () {
      expect(
          themeDark.appBarTheme.backgroundColor, themeDark.colorScheme.surface);
    });

    test(
        'FTD1.05: GIVEN a FlexThemeData.raw theme with null VisualDensity '
        'input EXPECT VisualDensity().', () {
      expect(themeLight.visualDensity, VisualDensity.standard);
    });
    test(
        'FTD1.06: GIVEN a FlexThemeData.raw theme with null Typography input '
        'EXPECT Typography.material2018.', () {
      expect(themeLight.typography,
          Typography.material2018(platform: defaultTargetPlatform));
    });

    //**************************************************************************
    // Test result of some customizations that fixes ThemeData.from color
    // scheme compliance gaps.
    //**************************************************************************

    test(
        'FTD1.07: GIVEN a FlexThemeData.raw theme with Material scheme light '
        'colors EXPECT toggleableActiveColor equality with '
        'colorScheme.secondary.', () {
      expect(
        themeLight.toggleableActiveColor,
        themeLight.colorScheme.secondary,
      );
    });
    test(
        'FTD1.08: GIVEN a FlexThemeData.raw theme with Material scheme dark '
        'colors EXPECT toggleableActiveColor equality with '
        'colorScheme.secondary.', () {
      expect(
        themeDark.toggleableActiveColor,
        themeDark.colorScheme.secondary,
      );
    });
    final MaterialColor lightSwatch =
        FlexColorScheme.createPrimarySwatch(themeLight.colorScheme.primary);
    final MaterialColor darkSwatch =
        FlexColorScheme.createPrimarySwatch(themeDark.colorScheme.primary);

    test(
        'FTD1.09: GIVEN a FlexThemeData.raw theme with Material scheme light '
        'colors EXPECT primaryColorDark equality with '
        'createPrimarySwatch(primaryColor)[800].', () {
      expect(
        themeLight.primaryColorDark,
        lightSwatch[800],
      );
    });
    test(
        'FTD1.10: GIVEN a FlexThemeData.raw theme with Material scheme dark '
        'colors EXPECT primaryColorDark equality with '
        'createPrimarySwatch(primaryColor)[700].', () {
      expect(
        themeDark.primaryColorDark,
        darkSwatch[700],
      );
    });

    test(
        'FTD1.11: GIVEN a FlexThemeData.raw theme with Material scheme light '
        'colors EXPECT primaryColorLight equality with '
        'createPrimarySwatch(primaryColor)[100].', () {
      expect(
        themeLight.primaryColorLight,
        lightSwatch[100],
      );
    });
    test(
        'FTD1.12: GIVEN a FlexThemeData.raw theme with Material scheme dark '
        'colors EXPECT primaryColorLight equality with '
        'createPrimarySwatch(primaryColor)[100].', () {
      expect(
        themeDark.primaryColorLight,
        darkSwatch[100],
      );
    });

    test(
        'FTD1.13: GIVEN a FlexThemeData.raw theme with Material scheme light '
        'colors EXPECT secondaryHeaderColor equality with '
        'createPrimarySwatch(primaryColor)[50].', () {
      expect(
        themeLight.secondaryHeaderColor,
        lightSwatch[50],
      );
    });
    test(
        'FTD1.14: GIVEN a FlexThemeData.raw theme with Material scheme dark '
        'colors EXPECT secondaryHeaderColor equality with '
        'createPrimarySwatch(primaryColor)[50].', () {
      expect(
        themeDark.secondaryHeaderColor,
        darkSwatch[50],
      );
    });

    //**************************************************************************
    // FlexThemeData.light & dark extension tests. With LIGHT surface branding.
    //
    // Test result with custom features like surface, appbar, tab bar options.
    //**************************************************************************

    final ThemeData tLightL = FlexThemeData.light(
      colors: FlexColor.schemes[FlexScheme.material]!.light,
      surfaceStyle: FlexSurface.light,
      appBarStyle: FlexAppBarStyle.surface,
      tabBarStyle: FlexTabBarStyle.forBackground,
    );

    final ThemeData tDarkL = FlexThemeData.dark(
      colors: FlexColor.schemes[FlexScheme.material]!.dark,
      surfaceStyle: FlexSurface.light,
      appBarStyle: FlexAppBarStyle.surface,
      tabBarStyle: FlexTabBarStyle.forBackground,
    );

    test(
        'FTD1.16: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH FlexAppBarStyle.surface EXPECT appbar theme color '
        'colorScheme.surface.', () {
      expect(tLightL.appBarTheme.backgroundColor, tLightL.colorScheme.surface);
    });
    test(
        'FTD1.17: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH FlexAppBarStyle.surface EXPECT appbar theme color '
        'colorScheme.surface.', () {
      expect(tDarkL.appBarTheme.backgroundColor, tDarkL.colorScheme.surface);
    });

    test(
        'FTD1.18: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH appBarElevation: default EXPECT appbar theme elevation 0.', () {
      expect(tLightL.appBarTheme.elevation, 0);
    });
    test(
        'FTD1.19: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH appBarElevation: default EXPECT appbar theme elevation 0.', () {
      expect(tDarkL.appBarTheme.elevation, 0);
    });

    test(
        'FTD1.2: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH FlexSurface.light EXPECT surface Color(0xffffffff).', () {
      expect(tLightL.colorScheme.surface, const Color(0xffffffff));
    });
    test(
        'FTD1.21: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH FlexSurface.light EXPECT surface Color(0xff141315).', () {
      expect(tDarkL.colorScheme.surface, const Color(0xff141315));
    });

    test(
        'FTD1.22: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH FlexSurface.light EXPECT background Color(0xfff9f8fc).', () {
      expect(tLightL.colorScheme.background, const Color(0xfff9f8fc));
    });
    test(
        'FTD1.23: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH FlexSurface.light EXPECT background Color(0xff18151b).', () {
      expect(tDarkL.colorScheme.background, const Color(0xff18151b));
    });

    test(
        'FTD1.24: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH FlexSurface.light EXPECT scaffold '
        'background Color(0xffffffff).', () {
      expect(tLightL.scaffoldBackgroundColor, const Color(0xffffffff));
    });
    test(
        'FTD1.25: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH FlexSurface.light EXPECT scaffold '
        'background Color(0xff121212).', () {
      expect(tDarkL.scaffoldBackgroundColor, const Color(0xff121212));
    });

    test(
        'FTD1.26: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.material EXPECT '
        'indicator color primary.', () {
      expect(tLightL.indicatorColor, tLightL.colorScheme.primary);
    });
    test(
        'FTD1.27: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.primary EXPECT '
        'indicator color primary.', () {
      expect(tDarkL.indicatorColor, tDarkL.colorScheme.primary);
    });

    test(
        'FTD1.28: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.material EXPECT '
        'TabBarTheme.labelColor primary.', () {
      expect(tLightL.tabBarTheme.labelColor, tLightL.colorScheme.primary);
    });
    test(
        'FTD1.296: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.primary EXPECT '
        'TabBarTheme.labelColor primary.', () {
      expect(tDarkL.tabBarTheme.labelColor, tDarkL.colorScheme.primary);
    });

    test(
        'FTD1.30: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.material EXPECT '
        'TabBarTheme.unselectedLabelColor onSurface.withOpacity(0.6).', () {
      expect(tLightL.tabBarTheme.unselectedLabelColor,
          tLightL.colorScheme.onSurface.withOpacity(0.6));
    });
    test(
        'FTD1.31: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.primary EXPECT '
        'TabBarTheme.unselectedLabelColor onSurface.withOpacity(0.6)', () {
      expect(tDarkL.tabBarTheme.unselectedLabelColor,
          tDarkL.colorScheme.onSurface.withOpacity(0.6));
    });

    //**************************************************************************
    // FlexThemeData.light & dark extension tests. With MEDIUM surface branding.
    //
    // Test result with custom features like surface, appbar, tab bar options.
    //**************************************************************************

    final ThemeData tLightM = FlexThemeData.light(
      colors: FlexColor.schemes[FlexScheme.material]!.light,
      surfaceStyle: FlexSurface.medium,
      appBarStyle: FlexAppBarStyle.material,
      appBarElevation: 1,
      // ignore: avoid_redundant_argument_values
      tabBarStyle: FlexTabBarStyle.forAppBar,
    );

    final ThemeData tDarkM = FlexThemeData.dark(
      colors: FlexColor.schemes[FlexScheme.material]!.dark,
      surfaceStyle: FlexSurface.medium,
      appBarStyle: FlexAppBarStyle.primary,
      appBarElevation: 3,
      // ignore: avoid_redundant_argument_values
      tabBarStyle: FlexTabBarStyle.forAppBar,
    );

    test(
        'FTD1.32: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH FlexAppBarStyle.material EXPECT appbar theme color '
        'FlexColor.materialLightSurface.', () {
      expect(
          tLightM.appBarTheme.backgroundColor, FlexColor.materialLightSurface);
    });
    test(
        'FTD1.33: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH FlexAppBarStyle.primary EXPECT appbar theme color '
        'colorScheme.primary.', () {
      expect(tDarkM.appBarTheme.backgroundColor, tDarkM.colorScheme.primary);
    });

    test(
        'FTD1.34: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH appBarElevation: 1 EXPECT appbar theme elevation 1.', () {
      expect(tLightM.appBarTheme.elevation, 1);
    });
    test(
        'FTD1.35: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH appBarElevation: 3 EXPECT appbar theme elevation 3.', () {
      expect(tDarkM.appBarTheme.elevation, 3);
    });

    test(
        'FTD1.36: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH FlexSurface.medium EXPECT surface Color(0xfffdfdfe).', () {
      expect(tLightM.colorScheme.surface, const Color(0xfffdfdfe));
    });
    test(
        'FTD1.37: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH FlexSurface.medium EXPECT surface Color(0xff17151a).', () {
      expect(tDarkM.colorScheme.surface, const Color(0xff17151a));
    });

    test(
        'FTD1.38: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH FlexSurface.medium EXPECT background Color(0xfff6f3fc).', () {
      expect(tLightM.colorScheme.background, const Color(0xfff6f3fc));
    });
    test(
        'FTD1.24: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH FlexSurface.medium EXPECT background Color(0xff1d1922).', () {
      expect(tDarkM.colorScheme.background, const Color(0xff1d1922));
    });

    test(
        'FTD1.39: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH FlexSurface.medium EXPECT scaffold '
        'background Color(0xffffffff).', () {
      expect(tLightM.scaffoldBackgroundColor, const Color(0xffffffff));
    });
    test(
        'FTD1.40: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH FlexSurface.medium EXPECT scaffold '
        'background Color(0xff121212).', () {
      expect(tDarkM.scaffoldBackgroundColor, const Color(0xff121212));
    });

    test(
        'FTD1.41: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.material EXPECT '
        'indicator color black87.', () {
      expect(tLightM.indicatorColor, Colors.black87);
    });
    test(
        'FTD1.42: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.primary EXPECT '
        'indicator color black87.', () {
      expect(tDarkM.indicatorColor, Colors.black87);
    });

    test(
        'FTD1.43: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.material EXPECT '
        'TabBarTheme.labelColor black87.', () {
      expect(tLightM.tabBarTheme.labelColor, Colors.black87);
    });
    test(
        'FTD1.44: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.primary EXPECT '
        'TabBarTheme.labelColor black87.', () {
      expect(tDarkM.tabBarTheme.labelColor, Colors.black87);
    });

    test(
        'FTD1.45: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.material EXPECT '
        'TabBarTheme.unselectedLabelColor onSurface.withOpacity(0.6).', () {
      expect(tLightM.tabBarTheme.unselectedLabelColor,
          tLightM.colorScheme.onSurface.withOpacity(0.6));
    });
    test(
        'FTD1.46: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.primary EXPECT '
        'TabBarTheme.unselectedLabelColor black87.withOpacity(0.7)', () {
      expect(tDarkM.tabBarTheme.unselectedLabelColor,
          Colors.black87.withOpacity(0.7));
    });

    //**************************************************************************
    // FlexThemeData.light & dark extension tests. With STRONG surface branding.
    //
    // Test result with custom features like surface, appbar, tab bar options.
    //**************************************************************************

    final ThemeData tLightS = FlexThemeData.light(
      colors: FlexColor.schemes[FlexScheme.material]!.light,
      surfaceStyle: FlexSurface.strong,
      appBarStyle: FlexAppBarStyle.custom,
      appBarElevation: 6,
      // ignore: avoid_redundant_argument_values
      tabBarStyle: FlexTabBarStyle.forAppBar,
    );

    final ThemeData tDarkS = FlexThemeData.dark(
      colors: FlexColor.schemes[FlexScheme.material]!.dark,
      surfaceStyle: FlexSurface.strong,
      // ignore: avoid_redundant_argument_values
      appBarStyle: FlexAppBarStyle.material,
      appBarElevation: 6,
      // ignore: avoid_redundant_argument_values
      tabBarStyle: FlexTabBarStyle.forAppBar,
    );

    test(
        'FTD1.47: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH FlexAppBarStyle.material EXPECT appbar theme color '
        'FlexColor.materialLightSurface.', () {
      expect(tLightS.appBarTheme.backgroundColor,
          tLightS.colorScheme.secondaryVariant);
    });
    test(
        'FTD1.48: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH FlexAppBarStyle.primary EXPECT appbar theme color '
        'colorScheme.primary.', () {
      expect(tDarkS.appBarTheme.backgroundColor, FlexColor.materialDarkSurface);
    });

    test(
        'FTD1.49: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH appBarElevation: 6 EXPECT appbar theme elevation 6.', () {
      expect(tLightS.appBarTheme.elevation, 6);
    });
    test(
        'FTD1.50: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH appBarElevation: 6 EXPECT appbar theme elevation 6.', () {
      expect(tDarkS.appBarTheme.elevation, 6);
    });

    test(
        'FTD1.51: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH FlexSurface.strong EXPECT surface Color(0xfffbfafe).', () {
      expect(tLightS.colorScheme.surface, const Color(0xfffbfafe));
    });
    test(
        'FTD1.52: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH FlexSurface.strong EXPECT surface Color(0xff1b171e).', () {
      expect(tDarkS.colorScheme.surface, const Color(0xff1b171e));
    });

    test(
        'FTD1.53: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH FlexSurface.strong EXPECT background Color(0xfff3eefc).', () {
      expect(tLightS.colorScheme.background, const Color(0xfff3eefc));
    });
    test(
        'FTD1.54: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH FlexSurface.strong EXPECT background Color(0xff221c29).', () {
      expect(tDarkS.colorScheme.background, const Color(0xff221c29));
    });

    test(
        'FTD1.55: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH FlexSurface.strong EXPECT scaffold '
        'background Color(0xffffffff).', () {
      expect(tLightS.scaffoldBackgroundColor, const Color(0xffffffff));
    });
    test(
        'FTD1.56: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH FlexSurface.strong EXPECT scaffold '
        'background Color(0xff121212).', () {
      expect(tDarkS.scaffoldBackgroundColor, const Color(0xff121212));
    });

    test(
        'FTD1.57: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.material EXPECT '
        'indicator color white.', () {
      expect(tLightS.indicatorColor, Colors.white);
    });
    test(
        'FTD1.58: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.primary EXPECT '
        'indicator color white.', () {
      expect(tDarkS.indicatorColor, Colors.white);
    });

    test(
        'FTD1.59: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.material EXPECT '
        'TabBarTheme.labelColor white.', () {
      expect(tLightS.tabBarTheme.labelColor, Colors.white);
    });
    test(
        'FTD1.60: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.primary EXPECT '
        'TabBarTheme.labelColor white.', () {
      expect(tDarkS.tabBarTheme.labelColor, Colors.white);
    });

    test(
        'FTD1.61: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.material EXPECT '
        'TabBarTheme.unselectedLabelColor white.withOpacity(0.7).', () {
      expect(tLightS.tabBarTheme.unselectedLabelColor,
          Colors.white.withOpacity(0.7));
    });
    test(
        'FTD1.62: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.primary EXPECT '
        'TabBarTheme.unselectedLabelColor white.withOpacity(0.7)', () {
      expect(tDarkS.tabBarTheme.unselectedLabelColor,
          Colors.white.withOpacity(0.7));
    });

    //**************************************************************************
    // FlexThemeData.light & dark extension tests. With HEAVY surface branding.
    //
    // Test result with custom features like surface, appbar, tab bar options.
    //**************************************************************************

    final ThemeData tLightH = FlexThemeData.light(
      colors: FlexColor.schemes[FlexScheme.material]!.light,
      surfaceStyle: FlexSurface.heavy,
      appBarStyle: FlexAppBarStyle.background,
      appBarElevation: 2,
      tabBarStyle: FlexTabBarStyle.forBackground,
      tooltipsMatchBackground: true,
      transparentStatusBar: false,
      bottomAppBarElevation: 1,
    );

    final ThemeData tDarkH = FlexThemeData.dark(
      colors: FlexColor.schemes[FlexScheme.material]!.dark,
      surfaceStyle: FlexSurface.heavy,
      appBarStyle: FlexAppBarStyle.background,
      appBarElevation: 4,
      tabBarStyle: FlexTabBarStyle.forBackground,
      tooltipsMatchBackground: true,
      transparentStatusBar: false,
      bottomAppBarElevation: 1,
    );

    test(
        'FTD1.63: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH FlexAppBarStyle.background EXPECT appbar theme color '
        'colorScheme.background.', () {
      expect(
          tLightH.appBarTheme.backgroundColor, tLightH.colorScheme.background);
    });
    test(
        'FTD1.64: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH FlexAppBarStyle.background EXPECT appbar theme color '
        'colorScheme.background.', () {
      expect(tDarkH.appBarTheme.backgroundColor, tDarkH.colorScheme.background);
    });

    test(
        'FTD1.65: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH appBarElevation: 2 EXPECT appbar theme elevation 2.', () {
      expect(tLightH.appBarTheme.elevation, 2);
    });
    test(
        'FTD1.66: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH appBarElevation: 4 EXPECT appbar theme elevation 4.', () {
      expect(tDarkH.appBarTheme.elevation, 4);
    });

    test(
        'FTD1.67: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH FlexSurface.heavy EXPECT surface Color(0xfffaf8fe).', () {
      expect(tLightH.colorScheme.surface, const Color(0xfffaf8fe));
    });
    test(
        'FTD1.68: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH FlexSurface.heavy EXPECT surface Color(0xff1e1a23).', () {
      expect(tDarkH.colorScheme.surface, const Color(0xff1e1a23));
    });

    test(
        'FTD1.69: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH FlexSurface.heavy EXPECT background Color(0xfff0e9fb).', () {
      expect(tLightH.colorScheme.background, const Color(0xfff0e9fb));
    });
    test(
        'FTD1.70: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH FlexSurface.heavy EXPECT background Color(0xff272030).', () {
      expect(tDarkH.colorScheme.background, const Color(0xff272030));
    });

    test(
        'FTD1.71: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH FlexSurface.heavy EXPECT scaffold '
        'background Color(0xfffdfdfe).', () {
      expect(tLightH.scaffoldBackgroundColor, const Color(0xfffdfdfe));
    });
    test(
        'FTD1.72: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH FlexSurface.heavy EXPECT scaffold '
        'background Color(0xff151416).', () {
      expect(tDarkH.scaffoldBackgroundColor, const Color(0xff151416));
    });

    test(
        'FTD1.73: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.material EXPECT '
        'indicator color primary.', () {
      expect(tLightH.indicatorColor, tLightH.colorScheme.primary);
    });
    test(
        'FTD1.74: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.primary EXPECT '
        'indicator color primary.', () {
      expect(tDarkH.indicatorColor, tDarkH.colorScheme.primary);
    });

    test(
        'FTD1.75: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.material EXPECT '
        'TabBarTheme.labelColor primary.', () {
      expect(tLightH.tabBarTheme.labelColor, tLightH.colorScheme.primary);
    });
    test(
        'FTD1.76: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.primary EXPECT '
        'TabBarTheme.labelColor primary.', () {
      expect(tDarkH.tabBarTheme.labelColor, tDarkH.colorScheme.primary);
    });

    test(
        'FTD1.77: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.material EXPECT '
        'TabBarTheme.unselectedLabelColor onSurface.withOpacity(0.6).', () {
      expect(tLightH.tabBarTheme.unselectedLabelColor,
          tLightH.colorScheme.onSurface.withOpacity(0.6));
    });
    test(
        'FTD1.78: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.primary EXPECT '
        'TabBarTheme.unselectedLabelColor onSurface.withOpacity(0.6)', () {
      expect(tDarkH.tabBarTheme.unselectedLabelColor,
          tDarkH.colorScheme.onSurface.withOpacity(0.6));
    });

    //**************************************************************************
    // FlexThemeData.light & dark extension tests. With HEAVY surface branding.
    //
    // Test result with 2...3 colors and true black.
    // Just verify not failing (coverage), should check result as well later.
    //**************************************************************************

    final ThemeData tLightH2 = FlexThemeData.light(
      colors: FlexColor.schemes[FlexScheme.mandyRed]!.light,
      surfaceStyle: FlexSurface.heavy,
      appBarStyle: FlexAppBarStyle.background,
      tabBarStyle: FlexTabBarStyle.forBackground,
      usedColors: 2,
    );

    final ThemeData tDarkH2 = FlexThemeData.dark(
      colors: FlexColor.schemes[FlexScheme.mandyRed]!.dark,
      surfaceStyle: FlexSurface.heavy,
      appBarStyle: FlexAppBarStyle.background,
      tabBarStyle: FlexTabBarStyle.forBackground,
      darkIsTrueBlack: true,
      usedColors: 2,
    );

    test(
        'FTD1.79: GIVEN a FlexThemeData.light with heavy branding and 2 '
        'colors EXPECT none null result.', () {
      expect(tLightH2, isNotNull);
    });
    test(
        'FTD1.80: GIVEN a FlexThemeData.dark with heavy branding and '
        '2 colors and true black EXPECT none null result.', () {
      expect(tDarkH2, isNotNull);
    });

    final ThemeData tLightH3 = FlexThemeData.light(
      colors: FlexColor.schemes[FlexScheme.mandyRed]!.light,
      surfaceStyle: FlexSurface.heavy,
      appBarStyle: FlexAppBarStyle.background,
      tabBarStyle: FlexTabBarStyle.forBackground,
      usedColors: 3,
    );

    final ThemeData tDarkH3 = FlexThemeData.dark(
      colors: FlexColor.schemes[FlexScheme.mandyRed]!.dark,
      surfaceStyle: FlexSurface.heavy,
      appBarStyle: FlexAppBarStyle.background,
      tabBarStyle: FlexTabBarStyle.forBackground,
      darkIsTrueBlack: true,
      usedColors: 3,
    );

    test(
        'FTD1.79: GIVEN a FlexThemeData.light with heavy branding and 3 '
        'colors EXPECT none null result.', () {
      expect(tLightH3, isNotNull);
    });
    test(
        'FTD1.80: GIVEN a FlexThemeData.dark with heavy branding and '
        '3 colors and true black EXPECT none null result.', () {
      expect(tDarkH3, isNotNull);
    });

    //**************************************************************************
    // FlexThemeData.light & dark extension tests. With CUSTOM surface branding.
    //
    // Test result with custom features like surface, appbar, tab bar options.
    // Just verify not failing (coverage), should check result as well later.
    //**************************************************************************

    final ThemeData tLightC = FlexThemeData.light(
      colors: FlexColor.schemes[FlexScheme.mandyRed]!.light,
      surfaceStyle: FlexSurface.custom,
      appBarStyle: FlexAppBarStyle.custom,
      appBarElevation: 2,
      tabBarStyle: FlexTabBarStyle.forBackground,
      tooltipsMatchBackground: true,
      transparentStatusBar: false,
      bottomAppBarElevation: 1,
      usedColors: 1,
    );

    final ThemeData tDarkC = FlexThemeData.dark(
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
    );

    test(
        'FTD1.81: GIVEN a FlexThemeData.light with more options '
        'EXPECT none null result.', () {
      expect(tLightC, isNotNull);
    });
    test(
        'FTD1.82: GIVEN a FlexThemeData.dark with more options '
        'EXPECT none null result.', () {
      expect(tDarkC, isNotNull);
    });

    // With surface and background colors defined
    final ThemeData tLightC2 = FlexThemeData.light(
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
    );

    final ThemeData tDarkC2 = FlexThemeData.dark(
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
    );

    final ThemeData tDarkC2tb = FlexThemeData.dark(
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
    );

    test(
        'FTD1.81: GIVEN a FlexThemeData.light with more options '
        'like custom surface and background '
        'EXPECT OK and identical to copy.', () {
      expect(tLightC2, tLightC2.copyWith());
    });
    test(
        'FTD1.82: GIVEN a FlexThemeData.dark with more options '
        'like custom surface and background '
        'EXPECT OK and identical to copy.', () {
      expect(tDarkC2, tDarkC2.copyWith());
    });
    test(
        'FTD1.82: GIVEN a FlexThemeData.dark with more options '
        'like custom surface and background and true black '
        'EXPECT OK and identical to copy.', () {
      expect(tDarkC2tb, tDarkC2tb.copyWith());
    });

    // Default light TextTheme equality verification.
    //
    // Flex default TextTheme light
    final TextTheme fLightT = FlexThemeData.light().textTheme;
    // Should be same as a light ThemeData textTheme with Typography 2018
    final TextTheme nLightT =
        ThemeData(typography: Typography.material2018()).textTheme;
    test(
        'FTD1.83: GIVEN a FlexThemeData.light with no TextTheme defined '
        'EXPECT equal to '
        'ThemeData(typography: Typography.material2018()).textTheme.', () {
      expect(fLightT, equals(nLightT));
    });

    // Default light Primary TextTheme equality verification.
    //
    // Flex default TextTheme light
    final TextTheme fLightP = FlexThemeData.light().primaryTextTheme;
    // Should be same as a light ThemeData textTheme with Typography 2018
    final TextTheme nLightP =
        ThemeData(typography: Typography.material2018()).primaryTextTheme;
    test(
        'FTD1.84: GIVEN a FlexThemeData.light with no PrimaryTextTheme '
        'defined EXPECT equal '
        'ThemeData(typography: Typography.material2018()).primaryTextTheme',
        () {
      expect(fLightP, equals(nLightP));
    });

    // Default dark TextTheme equality verification.
    final TextTheme fDarkT = FlexThemeData.dark().textTheme;
    final TextTheme nDarkT = ThemeData(
      brightness: Brightness.dark,
      typography: Typography.material2018(),
    ).textTheme;
    test(
        'FTD1.85: GIVEN a FlexThemeData.dark with no TextTheme defined '
        'EXPECT equal to default dark with Typography 2018.', () {
      expect(fDarkT, equals(nDarkT));
    });

    // Primary dark text theme verification, this is not equal to default
    // ThemeData primary text theme, it is so by design, we have to also
    // set the primaryColor to the color used by FlexColorScheme.dark, otherwise
    // default dark theme uses an almost black color as primary color, giving
    // us the wrong on primaryTextTheme color for this test case, which is
    // part of the test.
    final TextTheme fDarkP = FlexThemeData.dark().primaryTextTheme;
    final Color nDarkPColor = FlexThemeData.dark().primaryColor;
    final TextTheme nDarkP = ThemeData(
      brightness: Brightness.dark,
      primaryColor: nDarkPColor,
      typography: Typography.material2018(),
    ).primaryTextTheme;
    // Default dark Primary TextTheme equality verification.
    test(
        'FTD1.86: GIVEN a FlexThemeData.dark with no PrimaryTextThemes '
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
    final ThemeData fLightTD = FlexThemeData.light(
      textTheme: customText,
      primaryTextTheme: customPrimText,
    );
    final ThemeData nLightTD = ThemeData(
      textTheme: customText,
      primaryTextTheme: customPrimText,
      typography: Typography.material2018(),
    );

    // Custom light TextTheme equality verification.
    final TextTheme fCText = fLightTD.textTheme;
    final TextTheme nCText = nLightTD.textTheme;
    test(
        'FTD1.87: GIVEN a FlexThemeData.light with custom TextTheme defined '
        'EXPECT equal to default with same text theme and typography 2018', () {
      expect(fCText, equals(nCText));
    });
    // Custom light TextTheme with Primary derived from it equality test.
    final TextTheme fCPText = fLightTD.primaryTextTheme;
    final TextTheme nCPText = nLightTD.primaryTextTheme;
    test(
        'FTD1.88: GIVEN a FlexThemeData.light with custom PrimaryTextTheme '
        'defined EXPECT the primaryTextTheme to be equal with default '
        'ThemeData with same primary text theme and typography 2018.', () {
      expect(fCPText, equals(nCPText));
    });

    // Dark theme with custom text theme
    final ThemeData fDarkTD = FlexThemeData.dark(
      textTheme: customText,
      primaryTextTheme: customPrimText,
    );
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
        'FTD1.89: GIVEN a FlexThemeData.dark with custom TextTheme defined '
        'EXPECT equal to default with same text theme and typography 2018', () {
      expect(fCDText, equals(nCDText));
    });

    // Custom dark TextTheme with Primary derived from it equality test.
    final TextTheme fCPDText = fDarkTD.primaryTextTheme;
    final TextTheme nCPDText = nDarkTD.primaryTextTheme;
    test(
        'FTD1.90: GIVEN a FlexThemeData.dark with custom PrimaryTextTheme '
        'defined EXPECT equal to default with same primary text theme and '
        'typography 2018 and primaryColor set as in FlexThemeData.dark.', () {
      expect(fCPDText, equals(nCPDText));
    });
  });

  //****************************************************************************
  // FlexThemeData and FlexColorScheme.toTheme equality tests.
  //
  // TESTS to ensure we have matching results between
  // FlexThemeData and FlexColorScheme.toTheme.
  //****************************************************************************
  group('FTD2: TEST FlexThemeData and FlexColorScheme.toTHeme equality', () {
    test(
        'FTD1.01: GIVEN equal FlexThemeData and FlexColorScheme.toTheme '
        'EXPECT equal.', () {
      expect(FlexThemeData.light(), FlexColorScheme.light().toTheme);
      expect(FlexThemeData.dark(), FlexColorScheme.dark().toTheme);
    });
    test(
        'FTD1.02: GIVEN equal FlexThemeData and FlexColorScheme.toTheme '
        'EXPECT equal.', () {
      expect(
        FlexThemeData.light(
          colors: FlexColor.mandyRed.light,
        ),
        FlexColorScheme.light(
          colors: FlexColor.mandyRed.light,
        ).toTheme,
      );
      expect(
        FlexThemeData.dark(
          colors: FlexColor.mandyRed.dark,
        ),
        FlexColorScheme.dark(
          colors: FlexColor.mandyRed.dark,
        ).toTheme,
      );
    });
    test(
        'FTD1.03: GIVEN equal FlexThemeData and FlexColorScheme.toTheme '
        'EXPECT equal.', () {
      expect(
        FlexThemeData.light(
          scheme: FlexScheme.barossa,
          usedColors: 1,
        ),
        FlexColorScheme.light(
          scheme: FlexScheme.barossa,
          usedColors: 1,
        ).toTheme,
      );
      expect(
        FlexThemeData.dark(
          scheme: FlexScheme.barossa,
          usedColors: 1,
        ),
        FlexColorScheme.dark(
          scheme: FlexScheme.barossa,
          usedColors: 1,
        ).toTheme,
      );
    });
    test(
        'FTD1.04: GIVEN equal FlexThemeData and FlexColorScheme.toTheme '
        'EXPECT equal.', () {
      expect(
        FlexThemeData.light(
          scheme: FlexScheme.bigStone,
          surfaceStyle: FlexSurface.heavy,
          appBarStyle: FlexAppBarStyle.background,
          tabBarStyle: FlexTabBarStyle.forBackground,
          usedColors: 2,
        ),
        FlexColorScheme.light(
          scheme: FlexScheme.bigStone,
          surfaceStyle: FlexSurface.heavy,
          appBarStyle: FlexAppBarStyle.background,
          tabBarStyle: FlexTabBarStyle.forBackground,
          usedColors: 2,
        ).toTheme,
      );
      expect(
        FlexThemeData.dark(
          scheme: FlexScheme.bigStone,
          surfaceStyle: FlexSurface.heavy,
          appBarStyle: FlexAppBarStyle.background,
          tabBarStyle: FlexTabBarStyle.forBackground,
          usedColors: 2,
        ),
        FlexColorScheme.dark(
          scheme: FlexScheme.bigStone,
          surfaceStyle: FlexSurface.heavy,
          appBarStyle: FlexAppBarStyle.background,
          tabBarStyle: FlexTabBarStyle.forBackground,
          usedColors: 2,
        ).toTheme,
      );
    });
    test(
        'FTD1.05: GIVEN equal FlexThemeData and FlexColorScheme.toTheme '
        'EXPECT equal.', () {
      expect(
        FlexThemeData.light(
          colors: FlexColor.mandyRed.light,
          scheme: FlexScheme.bigStone,
          usedColors: 3,
          surfaceStyle: FlexSurface.strong,
          surfaceMode: FlexSurfaceMode.equalAll,
          blendLevel: FlexBlendLevel.zero,
          appBarStyle: FlexAppBarStyle.background,
          tabBarStyle: FlexTabBarStyle.forBackground,
          appBarElevation: 1,
          bottomAppBarElevation: 1,
          primary: FlexColor.indigo.light.primary,
          primaryVariant: FlexColor.indigo.light.primaryVariant,
          secondary: FlexColor.indigo.light.secondary,
          secondaryVariant: FlexColor.indigo.light.secondaryVariant,
          surface: FlexColor.lightSurface,
          background: FlexColor.lightBackground,
          scaffoldBackground: FlexColor.lightScaffoldBackground,
          dialogBackground: FlexColor.lightSurface,
          appBarBackground: FlexColor.indigo.light.primary,
          swapColors: true,
          tooltipsMatchBackground: true,
          transparentStatusBar: false,
          visualDensity: VisualDensity.compact,
          applyElevationOverlayColor: false,
        ),
        FlexColorScheme.light(
          colors: FlexColor.mandyRed.light,
          scheme: FlexScheme.bigStone,
          usedColors: 3,
          surfaceStyle: FlexSurface.strong,
          surfaceMode: FlexSurfaceMode.equalAll,
          blendLevel: FlexBlendLevel.zero,
          appBarStyle: FlexAppBarStyle.background,
          tabBarStyle: FlexTabBarStyle.forBackground,
          appBarElevation: 1,
          bottomAppBarElevation: 1,
          primary: FlexColor.indigo.light.primary,
          primaryVariant: FlexColor.indigo.light.primaryVariant,
          secondary: FlexColor.indigo.light.secondary,
          secondaryVariant: FlexColor.indigo.light.secondaryVariant,
          surface: FlexColor.lightSurface,
          background: FlexColor.lightBackground,
          scaffoldBackground: FlexColor.lightScaffoldBackground,
          dialogBackground: FlexColor.lightSurface,
          appBarBackground: FlexColor.indigo.light.primary,
          swapColors: true,
          tooltipsMatchBackground: true,
          transparentStatusBar: false,
          visualDensity: VisualDensity.compact,
          applyElevationOverlayColor: false,
        ).toTheme,
      );
      expect(
        FlexThemeData.dark(
          colors: FlexColor.mandyRed.dark,
          scheme: FlexScheme.bigStone,
          usedColors: 3,
          surfaceStyle: FlexSurface.strong,
          surfaceMode: FlexSurfaceMode.equalAll,
          blendLevel: FlexBlendLevel.zero,
          appBarStyle: FlexAppBarStyle.background,
          tabBarStyle: FlexTabBarStyle.forBackground,
          appBarElevation: 1,
          bottomAppBarElevation: 1,
          primary: FlexColor.indigo.dark.primary,
          primaryVariant: FlexColor.indigo.dark.primaryVariant,
          secondary: FlexColor.indigo.dark.secondary,
          secondaryVariant: FlexColor.indigo.dark.secondaryVariant,
          surface: FlexColor.darkSurface,
          background: FlexColor.darkBackground,
          scaffoldBackground: FlexColor.darkScaffoldBackground,
          dialogBackground: FlexColor.darkSurface,
          appBarBackground: FlexColor.indigo.dark.primary,
          swapColors: true,
          tooltipsMatchBackground: true,
          transparentStatusBar: false,
          visualDensity: VisualDensity.compact,
          applyElevationOverlayColor: false,
        ),
        FlexColorScheme.dark(
          colors: FlexColor.mandyRed.dark,
          scheme: FlexScheme.bigStone,
          usedColors: 3,
          surfaceStyle: FlexSurface.strong,
          surfaceMode: FlexSurfaceMode.equalAll,
          blendLevel: FlexBlendLevel.zero,
          appBarStyle: FlexAppBarStyle.background,
          tabBarStyle: FlexTabBarStyle.forBackground,
          appBarElevation: 1,
          bottomAppBarElevation: 1,
          primary: FlexColor.indigo.dark.primary,
          primaryVariant: FlexColor.indigo.dark.primaryVariant,
          secondary: FlexColor.indigo.dark.secondary,
          secondaryVariant: FlexColor.indigo.dark.secondaryVariant,
          surface: FlexColor.darkSurface,
          background: FlexColor.darkBackground,
          scaffoldBackground: FlexColor.darkScaffoldBackground,
          dialogBackground: FlexColor.darkSurface,
          appBarBackground: FlexColor.indigo.dark.primary,
          swapColors: true,
          tooltipsMatchBackground: true,
          transparentStatusBar: false,
          visualDensity: VisualDensity.compact,
          applyElevationOverlayColor: false,
        ).toTheme,
      );
    });
    test(
        'FTD1.06: GIVEN equal FlexThemeData and FlexColorScheme.toTheme '
        'EXPECT equal.', () {
      expect(
        FlexThemeData.light(
          colors: FlexColor.mandyRed.light,
          scheme: FlexScheme.bigStone,
          usedColors: 3,
          surfaceStyle: FlexSurface.strong,
          surfaceMode: FlexSurfaceMode.equalSurfacesHighScaffoldSecDialog,
          blendLevel: FlexBlendLevel.fifteen,
          appBarStyle: FlexAppBarStyle.background,
          tabBarStyle: FlexTabBarStyle.forBackground,
          appBarElevation: 1,
          bottomAppBarElevation: 1,
          primary: FlexColor.indigo.light.primary,
          primaryVariant: FlexColor.indigo.light.primaryVariant,
          secondary: FlexColor.indigo.light.secondary,
          secondaryVariant: FlexColor.indigo.light.secondaryVariant,
          surface: FlexColor.lightSurface,
          background: FlexColor.lightBackground,
          scaffoldBackground: FlexColor.lightScaffoldBackground,
          dialogBackground: FlexColor.lightSurface,
          appBarBackground: FlexColor.indigo.light.primary,
          swapColors: true,
          tooltipsMatchBackground: true,
          transparentStatusBar: true,
          visualDensity: VisualDensity.compact,
          applyElevationOverlayColor: true,
          platform: defaultTargetPlatform,
        ),
        FlexColorScheme.light(
          colors: FlexColor.mandyRed.light,
          scheme: FlexScheme.bigStone,
          usedColors: 3,
          surfaceStyle: FlexSurface.strong,
          surfaceMode: FlexSurfaceMode.equalSurfacesHighScaffoldSecDialog,
          blendLevel: FlexBlendLevel.fifteen,
          appBarStyle: FlexAppBarStyle.background,
          tabBarStyle: FlexTabBarStyle.forBackground,
          appBarElevation: 1,
          bottomAppBarElevation: 1,
          primary: FlexColor.indigo.light.primary,
          primaryVariant: FlexColor.indigo.light.primaryVariant,
          secondary: FlexColor.indigo.light.secondary,
          secondaryVariant: FlexColor.indigo.light.secondaryVariant,
          surface: FlexColor.lightSurface,
          background: FlexColor.lightBackground,
          scaffoldBackground: FlexColor.lightScaffoldBackground,
          dialogBackground: FlexColor.lightSurface,
          appBarBackground: FlexColor.indigo.light.primary,
          swapColors: true,
          tooltipsMatchBackground: true,
          transparentStatusBar: true,
          visualDensity: VisualDensity.compact,
          applyElevationOverlayColor: true,
          platform: defaultTargetPlatform,
        ).toTheme,
      );
      expect(
        FlexThemeData.dark(
          colors: FlexColor.mandyRed.dark,
          scheme: FlexScheme.bigStone,
          usedColors: 3,
          surfaceStyle: FlexSurface.strong,
          surfaceMode: FlexSurfaceMode.equalSurfacesHighScaffoldSecDialog,
          blendLevel: FlexBlendLevel.fifteen,
          appBarStyle: FlexAppBarStyle.background,
          tabBarStyle: FlexTabBarStyle.forBackground,
          appBarElevation: 1,
          bottomAppBarElevation: 1,
          primary: FlexColor.indigo.dark.primary,
          primaryVariant: FlexColor.indigo.dark.primaryVariant,
          secondary: FlexColor.indigo.dark.secondary,
          secondaryVariant: FlexColor.indigo.dark.secondaryVariant,
          surface: FlexColor.darkSurface,
          background: FlexColor.darkBackground,
          scaffoldBackground: FlexColor.darkScaffoldBackground,
          dialogBackground: FlexColor.darkSurface,
          appBarBackground: FlexColor.indigo.dark.primary,
          swapColors: true,
          tooltipsMatchBackground: true,
          transparentStatusBar: true,
          visualDensity: VisualDensity.compact,
          applyElevationOverlayColor: true,
          platform: defaultTargetPlatform,
        ),
        FlexColorScheme.dark(
          colors: FlexColor.mandyRed.dark,
          scheme: FlexScheme.bigStone,
          usedColors: 3,
          surfaceStyle: FlexSurface.strong,
          surfaceMode: FlexSurfaceMode.equalSurfacesHighScaffoldSecDialog,
          blendLevel: FlexBlendLevel.fifteen,
          appBarStyle: FlexAppBarStyle.background,
          tabBarStyle: FlexTabBarStyle.forBackground,
          appBarElevation: 1,
          bottomAppBarElevation: 1,
          primary: FlexColor.indigo.dark.primary,
          primaryVariant: FlexColor.indigo.dark.primaryVariant,
          secondary: FlexColor.indigo.dark.secondary,
          secondaryVariant: FlexColor.indigo.dark.secondaryVariant,
          surface: FlexColor.darkSurface,
          background: FlexColor.darkBackground,
          scaffoldBackground: FlexColor.darkScaffoldBackground,
          dialogBackground: FlexColor.darkSurface,
          appBarBackground: FlexColor.indigo.dark.primary,
          swapColors: true,
          tooltipsMatchBackground: true,
          transparentStatusBar: true,
          visualDensity: VisualDensity.compact,
          applyElevationOverlayColor: true,
          platform: defaultTargetPlatform,
        ).toTheme,
      );
    });
    test(
        'FTD1.07: GIVEN equal FlexThemeData and FlexColorScheme.toTheme '
        'EXPECT equal.', () {
      const TextTheme _myTextTheme = TextTheme(
        headline1: TextStyle(
          fontSize: 70, // Defaults to 96 in Material2018 Typography.
        ),
        button: TextStyle(
          fontSize: 16, // Defaults to 14 in Material2018 Typography.
          letterSpacing: 0.9, // Defaults to 1.25 in Material2018 Typography.
        ),
        overline: TextStyle(
          fontSize: 11, // Defaults to 10 in Material2018 Typography.
          letterSpacing: 0.5, // Defaults to 1.5 in Material2018 Typography.
        ),
      );
      // Make a FlexColorScheme.
      final FlexColorScheme _fcsLight = FlexColorScheme.light(
        colors: FlexColor.mandyRed.light,
        scheme: FlexScheme.bigStone,
        usedColors: 4,
        surfaceStyle: FlexSurface.strong,
        surfaceMode: FlexSurfaceMode.equalSurfacesLowScaffold,
        blendLevel: FlexBlendLevel.fifteen,
        appBarStyle: FlexAppBarStyle.primary,
        tabBarStyle: FlexTabBarStyle.forAppBar,
        appBarElevation: 1,
        bottomAppBarElevation: 1,
        primary: FlexColor.indigo.light.primary,
        primaryVariant: FlexColor.indigo.light.primaryVariant,
        secondary: FlexColor.indigo.light.secondary,
        secondaryVariant: FlexColor.indigo.light.secondaryVariant,
        surface: FlexColor.lightSurface,
        background: FlexColor.lightBackground,
        scaffoldBackground: FlexColor.lightScaffoldBackground,
        dialogBackground: FlexColor.lightSurface,
        appBarBackground: FlexColor.indigo.light.primary,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.black,
        onBackground: Colors.black,
        onError: Colors.white,
        swapColors: false,
        tooltipsMatchBackground: true,
        transparentStatusBar: true,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        textTheme: _myTextTheme,
        primaryTextTheme: _myTextTheme,
        fontFamily: 'Roboto',
        platform: defaultTargetPlatform,
        typography: Typography.material2018(platform: defaultTargetPlatform),
        applyElevationOverlayColor: true,
      );

      // Turn it into ThemeData.
      final ThemeData _fcsLightTd = _fcsLight.toTheme;

      // Make same ThemeData via extension.
      final ThemeData _ftdLight = FlexThemeData.light(
        // The manual colors will override commented ones:
        // -> colors: FlexColor.mandyRed.light,
        // -> scheme: FlexScheme.bigStone,
        usedColors: 4,
        // -> surfaceStyle: FlexSurface.strong,
        // -> surfaceMode: FlexSurfaceMode.scaffoldBackgroundSurface,
        // -> blendLevel: FlexBlendLevel.fifteen,
        appBarStyle: FlexAppBarStyle.primary,
        tabBarStyle: FlexTabBarStyle.forAppBar,
        appBarElevation: 1,
        bottomAppBarElevation: 1,
        primary: FlexColor.indigo.light.primary,
        primaryVariant: FlexColor.indigo.light.primaryVariant,
        secondary: FlexColor.indigo.light.secondary,
        secondaryVariant: FlexColor.indigo.light.secondaryVariant,
        surface: FlexColor.lightSurface,
        background: FlexColor.lightBackground,
        scaffoldBackground: FlexColor.lightScaffoldBackground,
        dialogBackground: FlexColor.lightSurface,
        appBarBackground: FlexColor.indigo.light.primary,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.black,
        onBackground: Colors.black,
        onError: Colors.white,
        swapColors: false,
        tooltipsMatchBackground: true,
        transparentStatusBar: true,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        textTheme: _myTextTheme,
        primaryTextTheme: _myTextTheme,
        fontFamily: 'Roboto',
        platform: defaultTargetPlatform,
        typography: Typography.material2018(platform: defaultTargetPlatform),
        applyElevationOverlayColor: true,
      );
      // Check to String equality
      expect(
        _fcsLightTd.toString(),
        equalsIgnoringHashCodes(_ftdLight.toString()),
      );
      // Check object equality
      // expect(
      //   _ftdLight,
      //   equals(_fcsLightTd),
      // );
      // Same test for dark mode
      final FlexColorScheme _fcsDark = FlexColorScheme.dark(
        // colors: FlexColor.mandyRed.dark,
        // scheme: FlexScheme.bigStone,
        usedColors: 4,
        surfaceStyle: FlexSurface.strong,
        surfaceMode: FlexSurfaceMode.equalSurfacesLowScaffold,
        blendLevel: FlexBlendLevel.fifteen,
        appBarStyle: FlexAppBarStyle.background,
        tabBarStyle: FlexTabBarStyle.forBackground,
        appBarElevation: 1,
        bottomAppBarElevation: 1,
        primary: FlexColor.indigo.dark.primary,
        primaryVariant: FlexColor.indigo.dark.primaryVariant,
        secondary: FlexColor.indigo.dark.secondary,
        secondaryVariant: FlexColor.indigo.dark.secondaryVariant,
        surface: FlexColor.darkSurface,
        background: FlexColor.darkBackground,
        scaffoldBackground: FlexColor.darkScaffoldBackground,
        dialogBackground: FlexColor.darkSurface,
        appBarBackground: FlexColor.indigo.dark.primary,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.white,
        onBackground: Colors.white,
        onError: Colors.white,
        swapColors: true,
        darkIsTrueBlack: true,
        tooltipsMatchBackground: true,
        transparentStatusBar: true,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        textTheme: _myTextTheme,
        primaryTextTheme: _myTextTheme,
        fontFamily: 'Roboto',
        platform: defaultTargetPlatform,
        typography: Typography.material2018(platform: defaultTargetPlatform),
        applyElevationOverlayColor: true,
      );
      expect(
        FlexThemeData.dark(
          colors: FlexColor.mandyRed.dark,
          scheme: FlexScheme.bigStone,
          usedColors: 4,
          surfaceStyle: FlexSurface.strong,
          surfaceMode: FlexSurfaceMode.scaffoldBackgroundSurface,
          blendLevel: FlexBlendLevel.fifteen,
          appBarStyle: FlexAppBarStyle.background,
          tabBarStyle: FlexTabBarStyle.forBackground,
          appBarElevation: 1,
          bottomAppBarElevation: 1,
          primary: FlexColor.indigo.dark.primary,
          primaryVariant: FlexColor.indigo.dark.primaryVariant,
          secondary: FlexColor.indigo.dark.secondary,
          secondaryVariant: FlexColor.indigo.dark.secondaryVariant,
          surface: FlexColor.darkSurface,
          background: FlexColor.darkBackground,
          scaffoldBackground: FlexColor.darkScaffoldBackground,
          dialogBackground: FlexColor.darkSurface,
          appBarBackground: FlexColor.indigo.dark.primary,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.white,
          onBackground: Colors.white,
          onError: Colors.white,
          swapColors: true,
          darkIsTrueBlack: true,
          tooltipsMatchBackground: true,
          transparentStatusBar: true,
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          textTheme: _myTextTheme,
          primaryTextTheme: _myTextTheme,
          fontFamily: 'Roboto',
          platform: defaultTargetPlatform,
          typography: Typography.material2018(platform: defaultTargetPlatform),
          applyElevationOverlayColor: true,
        ),
        _fcsDark.toTheme,
      );
    });
    test(
        'FTD1.08: GIVEN equal FlexThemeData RAW and FlexColorScheme.toTheme '
        'EXPECT equal.', () {
      const TextTheme _myTextTheme = TextTheme(
        headline1: TextStyle(
          fontSize: 70, // Defaults to 96 in Material2018 Typography.
        ),
        button: TextStyle(
          fontSize: 16, // Defaults to 14 in Material2018 Typography.
          letterSpacing: 0.9, // Defaults to 1.25 in Material2018 Typography.
        ),
        overline: TextStyle(
          fontSize: 11, // Defaults to 10 in Material2018 Typography.
          letterSpacing: 0.5, // Defaults to 1.5 in Material2018 Typography.
        ),
      );

      expect(
        FlexThemeData.raw(
          brightness: Brightness.light,
          primary: FlexColor.indigo.light.primary,
          primaryVariant: FlexColor.indigo.light.primaryVariant,
          secondary: FlexColor.indigo.light.secondary,
          secondaryVariant: FlexColor.indigo.light.secondaryVariant,
          surface: FlexColor.lightSurface,
          background: FlexColor.lightBackground,
          scaffoldBackground: FlexColor.lightScaffoldBackground,
          dialogBackground: FlexColor.lightSurface,
          appBarBackground: FlexColor.indigo.light.primary,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.black,
          onBackground: Colors.black,
          onError: Colors.white,
          tabBarStyle: FlexTabBarStyle.forBackground,
          appBarElevation: 1,
          bottomAppBarElevation: 1,
          tooltipsMatchBackground: true,
          transparentStatusBar: true,
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          textTheme: _myTextTheme,
          primaryTextTheme: _myTextTheme,
          fontFamily: 'Roboto',
          platform: defaultTargetPlatform,
          typography: Typography.material2018(platform: defaultTargetPlatform),
          applyElevationOverlayColor: true,
        ),
        FlexColorScheme(
          brightness: Brightness.light,
          primary: FlexColor.indigo.light.primary,
          primaryVariant: FlexColor.indigo.light.primaryVariant,
          secondary: FlexColor.indigo.light.secondary,
          secondaryVariant: FlexColor.indigo.light.secondaryVariant,
          surface: FlexColor.lightSurface,
          background: FlexColor.lightBackground,
          scaffoldBackground: FlexColor.lightScaffoldBackground,
          dialogBackground: FlexColor.lightSurface,
          appBarBackground: FlexColor.indigo.light.primary,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.black,
          onBackground: Colors.black,
          onError: Colors.white,
          tabBarStyle: FlexTabBarStyle.forBackground,
          appBarElevation: 1,
          bottomAppBarElevation: 1,
          tooltipsMatchBackground: true,
          transparentStatusBar: true,
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          textTheme: _myTextTheme,
          primaryTextTheme: _myTextTheme,
          fontFamily: 'Roboto',
          platform: defaultTargetPlatform,
          typography: Typography.material2018(platform: defaultTargetPlatform),
          applyElevationOverlayColor: true,
        ).toTheme,
      );
      expect(
        FlexThemeData.raw(
          brightness: Brightness.dark,
          primary: FlexColor.indigo.dark.primary,
          primaryVariant: FlexColor.indigo.dark.primaryVariant,
          secondary: FlexColor.indigo.dark.secondary,
          secondaryVariant: FlexColor.indigo.dark.secondaryVariant,
          surface: FlexColor.darkSurface,
          background: FlexColor.darkBackground,
          scaffoldBackground: FlexColor.darkScaffoldBackground,
          dialogBackground: FlexColor.darkSurface,
          appBarBackground: FlexColor.indigo.dark.primary,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.white,
          onBackground: Colors.white,
          onError: Colors.white,
          tabBarStyle: FlexTabBarStyle.forBackground,
          appBarElevation: 1,
          bottomAppBarElevation: 1,
          tooltipsMatchBackground: true,
          transparentStatusBar: true,
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          textTheme: _myTextTheme,
          primaryTextTheme: _myTextTheme,
          fontFamily: 'Roboto',
          platform: defaultTargetPlatform,
          typography: Typography.material2018(platform: defaultTargetPlatform),
          applyElevationOverlayColor: true,
        ),
        FlexColorScheme(
          brightness: Brightness.dark,
          primary: FlexColor.indigo.dark.primary,
          primaryVariant: FlexColor.indigo.dark.primaryVariant,
          secondary: FlexColor.indigo.dark.secondary,
          secondaryVariant: FlexColor.indigo.dark.secondaryVariant,
          surface: FlexColor.darkSurface,
          background: FlexColor.darkBackground,
          scaffoldBackground: FlexColor.darkScaffoldBackground,
          dialogBackground: FlexColor.darkSurface,
          appBarBackground: FlexColor.indigo.dark.primary,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.white,
          onBackground: Colors.white,
          onError: Colors.white,
          tabBarStyle: FlexTabBarStyle.forBackground,
          appBarElevation: 1,
          bottomAppBarElevation: 1,
          tooltipsMatchBackground: true,
          transparentStatusBar: true,
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          textTheme: _myTextTheme,
          primaryTextTheme: _myTextTheme,
          fontFamily: 'Roboto',
          platform: defaultTargetPlatform,
          typography: Typography.material2018(platform: defaultTargetPlatform),
          applyElevationOverlayColor: true,
        ).toTheme,
      );
    });
  });
}
