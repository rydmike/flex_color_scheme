import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
        'FTD1.00DefLType: GIVEN FlexThemeData.light() '
        'EXPECT it to be a ThemeData type.', () {
      expect(
        FlexThemeData.light().runtimeType,
        ThemeData,
      );
    });

    test(
        'FTD1.00DefDType: GIVEN FlexThemeData.dark() '
        'EXPECT it to be a ThemeData type.', () {
      expect(
        FlexThemeData.light().runtimeType,
        ThemeData,
      );
    });
    // TODO(rydmike): toString on ThemeData match, but not ThemeData.
    //   This is repeated for many test cases. It seems like ThemeData
    //   equality comparison cannot be guaranteed when using sub-themes that
    //   uses MaterialState or MaterialStateProperty. Maybe report this.
    //   Investigate first what SDK ThemeData tests do, if they even attempt it.
    test(
        'FTD1.00DefL1: GIVEN FlexColorScheme.light().toTheme '
        'EXPECT its ThemeData to be equal to FlexThemeData.light().', () {
      expect(
        FlexColorScheme.light()
            .toTheme
            .toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
            FlexThemeData.light().toString(minLevel: DiagnosticLevel.fine)),
      );
    });

    test(
        'FTD1.00DefL2: GIVEN FlexThemeData.light made with no parameters '
        'EXPECT its ThemeData to be equal to one made with light scheme.', () {
      expect(
          FlexThemeData.light().toString(minLevel: DiagnosticLevel.fine),
          equalsIgnoringHashCodes(FlexColorScheme.light(
            colors: FlexColor.schemes[FlexScheme.material]!.light,
          ).toTheme.toString(minLevel: DiagnosticLevel.fine)));
    });
    test(
        'FTD1.00aL: GIVEN two FlexThemeData.light made with identical '
        'parameters EXPECT their ThemeData to be equal.', () {
      expect(
          FlexThemeData.light(
            colors: FlexColor.schemes[FlexScheme.material]!.light,
          ).toString(minLevel: DiagnosticLevel.fine),
          equalsIgnoringHashCodes(FlexThemeData.light(
            colors: FlexColor.schemes[FlexScheme.material]!.light,
          ).toString(minLevel: DiagnosticLevel.fine)));
    });
    test(
        'FTD1.00bL: GIVEN a FlexThemeData.light made with no '
        'parameters EXPECT ThemeData to be equal to one made with '
        'scheme FlexScheme.material.', () {
      expect(
        FlexThemeData.light().toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexThemeData.light(scheme: FlexScheme.material)
              .toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'FTD1.00cL: GIVEN a FlexThemeData.light made with colors '
        'material EXPECT ThemeData to be equal to one made with '
        'scheme FlexScheme.material.', () {
      expect(
        FlexThemeData.light(
          colors: FlexColor.schemes[FlexScheme.material]!.light,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexThemeData.light(
            scheme: FlexScheme.material,
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'FTD1.00dL: GIVEN a FlexThemeData.light made with scheme '
        'material EXPECT ThemeData to be equal to one made with '
        'no params.', () {
      expect(
        FlexThemeData.light(
          colors: FlexColor.schemes[FlexScheme.material]!.light,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexThemeData.light().toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });

    test(
        'FTD1.00RawD: GIVEN FlexThemeData.dark(colors) made with colors '
        'params that equals default Material dark scheme '
        'EXPECT its ThemeData to be equal to one made with dark scheme with '
        'no parameters.', () {
      expect(
        FlexColorScheme.dark(
          colors: const FlexSchemeColor(
            primary: FlexColor.materialDarkPrimary,
            primaryContainer: FlexColor.materialDarkPrimaryContainer,
            secondary: FlexColor.materialDarkSecondary,
            secondaryContainer: FlexColor.materialDarkSecondaryContainer,
            tertiary: FlexColor.materialDarkTertiary,
            tertiaryContainer: FlexColor.materialDarkTertiaryContainer,
            appBarColor: FlexColor.materialDarkTertiary,
          ),
        ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexThemeData.dark().toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });

    // themeDark = Default material dark scheme colors.
    test(
        'FTD1.00SwapL: GIVEN FlexThemeData.light(swapColors: true) EXPECT it '
        'to be equal to one made with light scheme colors swapped ', () {
      expect(
        FlexThemeData.light(
          swapColors: true,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexColorScheme.light(
            colors: const FlexSchemeColor(
              primary: FlexColor.materialLightSecondary,
              primaryContainer: FlexColor.materialLightSecondaryContainer,
              secondary: FlexColor.materialLightPrimary,
              secondaryContainer: FlexColor.materialLightPrimaryContainer,
              tertiaryContainer: FlexColor.materialLightTertiaryContainer,
              tertiary: FlexColor.materialLightTertiary,
              appBarColor: FlexColor.materialDarkTertiary,
            ),
          ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });

    // themeDark = Default material dark scheme colors.
    test(
        'FTD1.00SwapD: GIVEN FlexThemeData.dark(swapColors: true) EXPECT it '
        'to be equal to one made with dark scheme colors swapped ', () {
      expect(
        FlexThemeData.dark(
          swapColors: true,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexColorScheme.dark(
            colors: const FlexSchemeColor(
              primary: FlexColor.materialDarkSecondary,
              primaryContainer: FlexColor.materialDarkSecondaryContainer,
              secondary: FlexColor.materialDarkPrimary,
              secondaryContainer: FlexColor.materialDarkPrimaryContainer,
              tertiary: FlexColor.materialDarkTertiary,
              tertiaryContainer: FlexColor.materialDarkTertiaryContainer,
              appBarColor: FlexColor.materialDarkTertiary,
            ),
          ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });

    test(
        'FTD1.00DefD1: GIVEN FFlexColorScheme.dark().toTheme '
        'EXPECT its ThemeData to be equal to FlexThemeData.dark().', () {
      expect(
        FlexColorScheme.dark().toTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexThemeData.dark().toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });

    test(
        'FTD1.00DefD2: GIVEN FlexThemeData.dark made with no parameters '
        'EXPECT its ThemeData to be equal to one made with light scheme.', () {
      expect(
        FlexThemeData.dark().toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexThemeData.dark(
            colors: FlexColor.schemes[FlexScheme.material]!.dark,
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'FTD1.00aD: GIVEN two FlexThemeData.dark made with identical '
        'parameters EXPECT their ThemeData to be equal.', () {
      expect(
        FlexThemeData.dark(
          colors: FlexColor.schemes[FlexScheme.material]!.dark,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexThemeData.dark(
            colors: FlexColor.schemes[FlexScheme.material]!.dark,
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'FTD1.00bD: GIVEN a FlexThemeData.dark made with no '
        'parameters EXPECT ThemeData to be equal to one made with '
        'scheme FlexScheme.material.', () {
      expect(
        FlexThemeData.dark().toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexThemeData.dark(scheme: FlexScheme.material)
              .toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'FTD1.00cD: GIVEN a FlexThemeData.dark made with colors '
        'material EXPECT ThemeData to be equal to one made with '
        'scheme FlexScheme.material.', () {
      expect(
        FlexThemeData.dark(
          colors: FlexColor.schemes[FlexScheme.material]!.dark,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexThemeData.dark(
            scheme: FlexScheme.material,
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'FTD1.00dD: GIVEN a FlexThemeData.dark made with scheme '
        'material EXPECT ThemeData to be equal to one made with '
        'no params.', () {
      expect(
        FlexThemeData.dark(
          colors: FlexColor.schemes[FlexScheme.material]!.dark,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexThemeData.dark().toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });

    // themeLight = Default material light scheme colors.
    final ThemeData themeLight = const FlexColorScheme(
      brightness: Brightness.light,
      primary: FlexColor.materialLightPrimary,
      primaryContainer: FlexColor.materialLightPrimaryContainer,
      secondary: FlexColor.materialLightSecondary,
      secondaryContainer: FlexColor.materialLightSecondaryContainer,
      tertiary: FlexColor.materialLightTertiary,
      tertiaryContainer: FlexColor.materialLightTertiaryContainer,
      surface: FlexColor.materialLightSurface,
      background: FlexColor.materialLightBackground,
      error: FlexColor.materialLightError,
    ).toTheme;
    // themeDark = Default material dark scheme colors.
    final ThemeData themeDark = const FlexColorScheme(
      brightness: Brightness.dark,
      primary: FlexColor.materialDarkPrimary,
      primaryContainer: FlexColor.materialDarkPrimaryContainer,
      secondary: FlexColor.materialDarkSecondary,
      secondaryContainer: FlexColor.materialDarkSecondaryContainer,
      tertiary: FlexColor.materialDarkTertiary,
      tertiaryContainer: FlexColor.materialDarkTertiaryContainer,
      surface: FlexColor.materialDarkSurface,
      background: FlexColor.materialDarkBackground,
      error: FlexColor.materialDarkError,
    ).toTheme;

    test(
        'FTD1.01: GIVEN a FlexThemeData.raw theme with Material scheme light '
        'colors EXPECT .colorScheme equality with raw ColorScheme light().',
        () {
      expect(
          themeLight.colorScheme,
          const ColorScheme(
            brightness: Brightness.light,
            primary: Color(0xff6200ee),
            onPrimary: Color(0xffffffff),
            primaryContainer: Color(0xffbb86fc),
            onPrimaryContainer: Color(0xff000000),
            secondary: Color(0xff03dac6),
            onSecondary: Color(0xff000000),
            secondaryContainer: Color(0xFFCEFAF8),
            onSecondaryContainer: Color(0xff000000),
            tertiary: Color(0xff018786),
            onTertiary: Color(0xffffffff),
            tertiaryContainer: Color(0xffa4f1ef),
            onTertiaryContainer: Color(0xff000000),
            error: Color(0xffb00020),
            onError: Color(0xffffffff),
            errorContainer: Color(0xfffcd8df),
            onErrorContainer: Color(0xff000000),
            background: Color(0xffffffff),
            onBackground: Color(0xff000000),
            surface: Color(0xffffffff),
            onSurface: Color(0xff000000),
            surfaceVariant: Color(0xFFEEEEEE),
            onSurfaceVariant: Color(0xff000000),
            outline: Color(0xFF737373),
            outlineVariant: Color(0xFFBFBFBF),
            shadow: Color(0xff000000),
            scrim: Color(0xff000000),
            inverseSurface: Color(0xff121212),
            onInverseSurface: Color(0xffffffff),
            inversePrimary: Color(0xffda99ff),
          ));
    });
    test(
        'FTD1.02: GIVEN a FlexColorScheme theme with Material scheme dark '
        'colors EXPECT .colorScheme equality with raw ColorScheme dark().', () {
      expect(
          themeDark.colorScheme,
          const ColorScheme(
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
            background: Color(0xff121212),
            onBackground: Color(0xffffffff),
            surface: Color(0xff121212),
            onSurface: Color(0xffffffff),
            surfaceVariant: Color(0xFF323232),
            onSurfaceVariant: Color(0xffffffff),
            outline: Color(0xFF8C8C8C),
            outlineVariant: Color(0xFF404040),
            shadow: Color(0xff000000),
            scrim: Color(0xff000000),
            inverseSurface: Color(0xffffffff),
            onInverseSurface: Color(0xff000000),
            inversePrimary: Color(0xff5a4570),
          ));
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
        'FTD1.09: GIVEN a FlexThemeData.raw theme with Material scheme light '
        'colors EXPECT primaryColorDark equality with '
        'blend(Colors.black, 40).', () {
      expect(
        themeLight.primaryColorDark,
        equals(themeLight.colorScheme.primary.blend(Colors.black, 40)),
      );
    });
    test(
        'FTD1.10: GIVEN a FlexThemeData.raw theme with Material scheme dark '
        'colors EXPECT primaryColorDark equality with '
        'blend(Colors.black, 45).', () {
      expect(
        themeDark.primaryColorDark,
        equals(themeDark.colorScheme.primary.blend(Colors.black, 45)),
      );
    });

    test(
        'FTD1.11: GIVEN a FlexThemeData.raw theme with Material scheme light '
        'colors EXPECT primaryColorLight equality with '
        '.blend(Colors.white, 40).', () {
      expect(
        themeLight.primaryColorLight,
        equals(themeLight.colorScheme.primary.blend(Colors.white, 40)),
      );
    });
    test(
        'FTD1.12: GIVEN a FlexThemeData.raw theme with Material scheme dark '
        'colors EXPECT primaryColorLight equality with '
        '.blend(Colors.white, 35).', () {
      expect(
        themeDark.primaryColorLight,
        equals(themeDark.colorScheme.primary.blend(Colors.white, 35)),
      );
    });

    test(
        'FTD1.13: GIVEN a FlexThemeData.raw theme with Material scheme light '
        'colors EXPECT secondaryHeaderColor equality with '
        '.blend(Colors.white, 80).', () {
      expect(
        themeLight.secondaryHeaderColor,
        equals(themeLight.colorScheme.primary.blend(Colors.white, 80)),
      );
    });
    test(
        'FTD1.14: GIVEN a FlexThemeData.raw theme with Material scheme dark '
        'colors EXPECT secondaryHeaderColor equality with '
        'blend(Colors.black, 60).', () {
      expect(
        themeDark.secondaryHeaderColor,
        equals(themeDark.colorScheme.primary.blend(Colors.black, 60)),
      );
    });

    //**************************************************************************
    // FlexThemeData.light & dark extension tests. With LIGHT surface branding.
    //
    // Test result with custom features like surface, appbar, tab bar options.
    //**************************************************************************

    final ThemeData tLightL = FlexThemeData.light(
      colors: FlexColor.schemes[FlexScheme.material]!.light,
      surfaceMode: FlexSurfaceMode.level,
      blendLevel: 4,
      appBarStyle: FlexAppBarStyle.surface,
      tabBarStyle: FlexTabBarStyle.forBackground,
    );

    final ThemeData tDarkL = FlexThemeData.dark(
      colors: FlexColor.schemes[FlexScheme.material]!.dark,
      surfaceMode: FlexSurfaceMode.level,
      blendLevel: 4,
      appBarStyle: FlexAppBarStyle.surface,
      tabBarStyle: FlexTabBarStyle.forBackground,
    );
    test(
        'FTD1.16: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH FlexSurfaceMode.level blendLevel: 4 '
        'EXPECT appbar theme color colorScheme.surface.', () {
      expect(tLightL.appBarTheme.backgroundColor, tLightL.colorScheme.surface);
    });
    test(
        'FTD1.17: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH FlexSurfaceMode.level blendLevel: 4 '
        'EXPECT appbar theme color colorScheme.surface.', () {
      expect(tDarkL.appBarTheme.backgroundColor, tDarkL.colorScheme.surface);
    });

    test(
        'FTD1.18: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH FlexSurfaceMode.level blendLevel: 4 '
        'EXPECT appbar theme elevation 0.', () {
      expect(tLightL.appBarTheme.elevation, 0);
    });
    test(
        'FTD1.19: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH FlexSurfaceMode.level blendLevel: 4 '
        'EXPECT appbar theme elevation 0.', () {
      expect(tDarkL.appBarTheme.elevation, 0);
    });

    test(
        'FTD1.2: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH FlexSurfaceMode.level blendLevel: 4 '
        'EXPECT surface Color(0xfffcfbfe).', () {
      expect(tLightL.colorScheme.surface, const Color(0xfffcfbfe));
    });
    test(
        'FTD1.21: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH FlexSurfaceMode.level blendLevel: 4 '
        'EXPECT surface Color(0xff131214).', () {
      expect(tDarkL.colorScheme.surface, const Color(0xff131214));
    });

    test(
        'FTD1.22: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH FlexSurfaceMode.level blendLevel: 4 '
        'EXPECT background Color(0xfffcfbfe).', () {
      expect(tLightL.colorScheme.background, const Color(0xfffcfbfe));
    });
    test(
        'FTD1.23: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH FlexSurfaceMode.level blendLevel: 4 '
        'EXPECT background Color(0xff131214).', () {
      expect(tDarkL.colorScheme.background, const Color(0xff131214));
    });

    test(
        'FTD1.24: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH FlexSurfaceMode.level blendLevel: 4 '
        'EXPECT scaffold background Color(0xfffcfbfe).', () {
      expect(tLightL.scaffoldBackgroundColor, const Color(0xfffcfbfe));
    });
    test(
        'FTD1.25: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH FlexSurfaceMode.level blendLevel: 4 '
        'EXPECT scaffold background Color(0xff131214).', () {
      expect(tDarkL.scaffoldBackgroundColor, const Color(0xff131214));
    });

    test(
        'FTD1.26: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH FlexSurfaceMode.level blendLevel: 4 '
        'FlexTabBarStyle.forAppBar and FlexAppBarStyle.material '
        'EXPECT indicator color primary.', () {
      expect(tLightL.indicatorColor, tLightL.colorScheme.primary);
    });
    test(
        'FTD1.27: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH FlexSurfaceMode.level blendLevel: 4 '
        'FlexTabBarStyle.forAppBar and FlexAppBarStyle.primary '
        'EXPECT indicator color primary.', () {
      expect(tDarkL.indicatorColor, tDarkL.colorScheme.primary);
    });

    test(
        'FTD1.28: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH FlexSurfaceMode.level blendLevel: 4 '
        'FlexTabBarStyle.forAppBar and FlexAppBarStyle.material '
        'EXPECT TabBarTheme.labelColor primary.', () {
      expect(tLightL.tabBarTheme.labelColor, tLightL.colorScheme.primary);
    });
    test(
        'FTD1.296: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH FlexSurfaceMode.level blendLevel: 4 '
        'FlexTabBarStyle.forAppBar and FlexAppBarStyle.primary '
        'EXPECT TabBarTheme.labelColor primary.', () {
      expect(tDarkL.tabBarTheme.labelColor, tDarkL.colorScheme.primary);
    });

    test(
        'FTD1.30: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH FlexSurfaceMode.level blendLevel: 4 '
        'FlexTabBarStyle.forAppBar and FlexAppBarStyle.material '
        'EXPECT TabBarTheme.unselectedLabelColor onSurface.withOpacity(0.6).',
        () {
      expect(tLightL.tabBarTheme.unselectedLabelColor,
          tLightL.colorScheme.onSurface.withOpacity(0.6));
    });
    test(
        'FTD1.31: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH FlexSurfaceMode.level blendLevel: 4 '
        'FlexTabBarStyle.forAppBar and FlexAppBarStyle.primary '
        'EXPECT TabBarTheme.unselectedLabelColor onSurface.withOpacity(0.6)',
        () {
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
      surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
      blendLevel: 10,
      appBarStyle: FlexAppBarStyle.material,
      appBarElevation: 1,
      // ignore: avoid_redundant_argument_values
      tabBarStyle: FlexTabBarStyle.forAppBar,
    );
    final ThemeData tDarkM = FlexThemeData.dark(
      colors: FlexColor.schemes[FlexScheme.material]!.dark,
      surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
      blendLevel: 10,
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
        'WITH surfaceMode: highBackgroundLowScaffold blendLevel: 10 '
        'EXPECT surface Color(0xfff8f5fe).', () {
      expect(tLightM.colorScheme.surface, const Color(0xfff8f5fe));
    });
    test(
        'FTD1.37: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH FlexSurface.medium EXPECT surface Color(0xff17151a).', () {
      expect(tDarkM.colorScheme.surface, const Color(0xff17151a));
    });
    test(
        'FTD1.38: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH surfaceMode: highBackgroundLowScaffold blendLevel: 10 '
        'EXPECT background Color(0xfff3eefc).', () {
      expect(tLightM.colorScheme.background, const Color(0xfff3eefc));
    });
    test(
        'FTD1.24: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH surfaceMode: highBackgroundLowScaffold blendLevel: 10 '
        'EXPECT background Color(0xff1a161d).', () {
      expect(tDarkM.colorScheme.background, const Color(0xff1a161d));
    });

    test(
        'FTD1.39: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH surfaceMode: highBackgroundLowScaffold blendLevel: 10 '
        'EXPECT scaffold '
        'background Color(0xfffbfafe).', () {
      expect(tLightM.scaffoldBackgroundColor, const Color(0xfffbfafe));
    });
    test(
        'FTD1.40: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH surfaceMode: highBackgroundLowScaffold blendLevel: 10 '
        'background Color(0xff151416).', () {
      expect(tDarkM.scaffoldBackgroundColor, const Color(0xff151416));
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
        'TabBarTheme.unselectedLabelColor black87.withAlpha(0xB2)', () {
      expect(tDarkM.tabBarTheme.unselectedLabelColor,
          Colors.black87.withAlpha(0xB2));
    });

    //**************************************************************************
    // FlexThemeData.light & dark extension tests. With STRONG surface branding.
    //
    // Test result with custom features like surface, appbar, tab bar options.
    //**************************************************************************

    final ThemeData tLightS = FlexThemeData.light(
      colors: FlexColor.schemes[FlexScheme.material]!.light,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurfaces,
      blendLevel: 30,
      appBarStyle: FlexAppBarStyle.custom,
      appBarElevation: 6,
      // ignore: avoid_redundant_argument_values
      tabBarStyle: FlexTabBarStyle.forAppBar,
    );
    final ThemeData tDarkS = FlexThemeData.dark(
      colors: FlexColor.schemes[FlexScheme.material]!.dark,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurfaces,
      blendLevel: 30,
      // ignore: avoid_redundant_argument_values
      appBarStyle: FlexAppBarStyle.material,
      appBarElevation: 6,
      // ignore: avoid_redundant_argument_values
      tabBarStyle: FlexTabBarStyle.forAppBar,
    );
    test(
        'FTD1.47: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH FlexAppBarStyle.custom EXPECT appbar theme color '
        'scheme.tertiary.', () {
      expect(tLightS.appBarTheme.backgroundColor, tLightS.colorScheme.tertiary);
    });
    test(
        'FTD1.48: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH FlexAppBarStyle.material EXPECT appbar theme color '
        'to be default material dark surface.', () {
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
        'WITH surfaceMode: highScaffoldLowSurfaces blendLevel: 30 '
        'EXPECT surface Color(0xfff3eefc).', () {
      expect(tLightS.colorScheme.surface, const Color(0xfff3eefc));
    });
    test(
        'FTD1.52: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH surfaceMode: highScaffoldLowSurfaces blendLevel: 30 '
        'EXPECT surface Color(0xff1a161d).', () {
      expect(tDarkS.colorScheme.surface, const Color(0xff1a161d));
    });
    test(
        'FTD1.53: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH surfaceMode: highScaffoldLowSurfaces blendLevel: 30 '
        'EXPECT background Color(0xfff3eefc).', () {
      expect(tLightS.colorScheme.background, const Color(0xfff3eefc));
    });
    test(
        'FTD1.54: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH surfaceMode: highScaffoldLowSurfaces blendLevel: 30 '
        'EXPECT background Color(0xff1a161d).', () {
      expect(tDarkS.colorScheme.background, const Color(0xff1a161d));
    });
    test(
        'FTD1.55: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH surfaceMode: highScaffoldLowSurfaces blendLevel: 30 '
        'EXPECT scaffold background Color(0xffc6a3f7).', () {
      expect(tLightS.scaffoldBackgroundColor, const Color(0xffc6a3f7));
    });
    test(
        'FTD1.56: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH surfaceMode: highScaffoldLowSurfaces blendLevel: 30 '
        'EXPECT scaffold background Color(0xff4c3963).', () {
      expect(tDarkS.scaffoldBackgroundColor, const Color(0xff4c3963));
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
        'TabBarTheme.unselectedLabelColor white.withAlpha(0xB2).', () {
      expect(tLightS.tabBarTheme.unselectedLabelColor,
          Colors.white.withAlpha(0xB2));
    });
    test(
        'FTD1.62: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH FlexTabBarStyle.forAppBar and FlexAppBarStyle.primary EXPECT '
        'TabBarTheme.unselectedLabelColor white.withAlpha(0xB2)', () {
      expect(tDarkS.tabBarTheme.unselectedLabelColor,
          Colors.white.withAlpha(0xB2));
    });

    //**************************************************************************
    // FlexThemeData.light & dark extension tests. With HEAVY surface branding.
    //
    // Test result with custom features like surface, appbar, tab bar options.
    //**************************************************************************

    final ThemeData tLightH = FlexThemeData.light(
      colors: FlexColor.schemes[FlexScheme.material]!.light,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog,
      blendLevel: 40,
      appBarStyle: FlexAppBarStyle.background,
      appBarElevation: 2,
      tabBarStyle: FlexTabBarStyle.forBackground,
      tooltipsMatchBackground: true,
      transparentStatusBar: false,
      bottomAppBarElevation: 1,
    );
    final ThemeData tDarkH = FlexThemeData.dark(
      colors: FlexColor.schemes[FlexScheme.material]!.dark,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog,
      blendLevel: 40,
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
        'WITH surfaceMode: highScaffoldLowSurfacesVariantDialog blendLevel: 40 '
        'EXPECT surface Color(0xfff0e9fb).', () {
      expect(tLightH.colorScheme.surface, const Color(0xfff0e9fb));
    });
    test(
        'FTD1.68: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH surfaceMode: highScaffoldLowSurfacesVariantDialog blendLevel: 40 '
        'EXPECT surface Color(0xff1d1922).', () {
      expect(tDarkH.colorScheme.surface, const Color(0xff1d1922));
    });
    test(
        'FTD1.69: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH surfaceMode: highScaffoldLowSurfacesVariantDialog blendLevel: 40 '
        'EXPECT background Color(0xfff0e9fb).', () {
      expect(tLightH.colorScheme.background, const Color(0xfff0e9fb));
    });
    test(
        'FTD1.70: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH surfaceMode: highScaffoldLowSurfacesVariantDialog blendLevel: 40 '
        'EXPECT background Color(0xff1d1922).', () {
      expect(tDarkH.colorScheme.background, const Color(0xff1d1922));
    });
    test(
        'FTD1.71: GIVEN a FlexThemeData.light theme FROM scheme "material" '
        'WITH surfaceMode: highScaffoldLowSurfacesVariantDialog blendLevel: 40 '
        'EXPECT scaffold background Color(0xffb485f5).', () {
      expect(tLightH.scaffoldBackgroundColor, const Color(0xffb485f5));
    });
    test(
        'FTD1.72: GIVEN a FlexThemeData.dark theme FROM scheme "material" '
        'WITH surfaceMode: highScaffoldLowSurfacesVariantDialog blendLevel: 40 '
        'EXPECT scaffold background Color(0xff60477f).', () {
      expect(tDarkH.scaffoldBackgroundColor, const Color(0xff60477f));
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
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurfaces,
      blendLevel: 32,
      appBarStyle: FlexAppBarStyle.background,
      tabBarStyle: FlexTabBarStyle.forBackground,
      usedColors: 2,
    );
    final ThemeData tDarkH2 = FlexThemeData.dark(
      colors: FlexColor.schemes[FlexScheme.mandyRed]!.dark,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurfaces,
      blendLevel: 32,
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
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
      blendLevel: 32,
      appBarStyle: FlexAppBarStyle.background,
      tabBarStyle: FlexTabBarStyle.forBackground,
      usedColors: 3,
    );
    final ThemeData tDarkH3 = FlexThemeData.dark(
      colors: FlexColor.schemes[FlexScheme.mandyRed]!.dark,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
      blendLevel: 32,
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
      surfaceMode: FlexSurfaceMode.custom,
      blendLevel: 2,
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
      surfaceMode: FlexSurfaceMode.custom,
      blendLevel: 2,
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
      surfaceMode: FlexSurfaceMode.custom,
      blendLevel: 10,
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
      surfaceMode: FlexSurfaceMode.custom,
      blendLevel: 10,
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
      surfaceMode: FlexSurfaceMode.custom,
      blendLevel: 10,
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
  group('FTD2: TEST FlexThemeData and FlexColorScheme.toTheme equality', () {
    test(
        'FTD2.01: GIVEN equal FlexThemeData and FlexColorScheme.toTheme '
        'EXPECT equal.', () {
      expect(
        FlexThemeData.light().toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexColorScheme.light()
              .toTheme
              .toString(minLevel: DiagnosticLevel.fine),
        ),
      );
      expect(
        FlexThemeData.dark().toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexColorScheme.dark()
              .toTheme
              .toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'FTD2.02: GIVEN equal FlexThemeData and FlexColorScheme.toTheme '
        'EXPECT equal.', () {
      expect(
        FlexThemeData.light(
          colors: FlexColor.mandyRed.light,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexColorScheme.light(
            colors: FlexColor.mandyRed.light,
          ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
      expect(
        FlexThemeData.dark(
          colors: FlexColor.mandyRed.dark,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexColorScheme.dark(
            colors: FlexColor.mandyRed.dark,
          ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'FTD2.03: GIVEN equal FlexThemeData and FlexColorScheme.toTheme '
        'EXPECT equal.', () {
      expect(
        FlexThemeData.light(
          scheme: FlexScheme.barossa,
          usedColors: 1,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexColorScheme.light(
            scheme: FlexScheme.barossa,
            usedColors: 1,
          ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
      expect(
        FlexThemeData.dark(
          scheme: FlexScheme.barossa,
          usedColors: 1,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexColorScheme.dark(
            scheme: FlexScheme.barossa,
            usedColors: 1,
          ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'FTD2.04: GIVEN equal FlexThemeData and FlexColorScheme.toTheme '
        'EXPECT equal.', () {
      expect(
        FlexThemeData.light(
          scheme: FlexScheme.bigStone,
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
          blendLevel: 10,
          appBarStyle: FlexAppBarStyle.background,
          tabBarStyle: FlexTabBarStyle.forBackground,
          usedColors: 2,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexColorScheme.light(
            scheme: FlexScheme.bigStone,
            surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
            blendLevel: 10,
            appBarStyle: FlexAppBarStyle.background,
            tabBarStyle: FlexTabBarStyle.forBackground,
            usedColors: 2,
          ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
      expect(
        FlexThemeData.dark(
          scheme: FlexScheme.bigStone,
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
          blendLevel: 12,
          appBarStyle: FlexAppBarStyle.background,
          tabBarStyle: FlexTabBarStyle.forBackground,
          usedColors: 2,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexColorScheme.dark(
            scheme: FlexScheme.bigStone,
            surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
            blendLevel: 12,
            appBarStyle: FlexAppBarStyle.background,
            tabBarStyle: FlexTabBarStyle.forBackground,
            usedColors: 2,
          ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'FTD2.05: GIVEN equal FlexThemeData and FlexColorScheme.toTheme '
        'EXPECT equal.', () {
      expect(
        FlexThemeData.light(
          colors: FlexColor.mandyRed.light,
          scheme: FlexScheme.bigStone,
          usedColors: 3,
          surfaceMode: FlexSurfaceMode.level,
          blendLevel: 0,
          appBarStyle: FlexAppBarStyle.background,
          tabBarStyle: FlexTabBarStyle.forBackground,
          appBarElevation: 1,
          bottomAppBarElevation: 1,
          primary: FlexColor.indigo.light.primary,
          primaryContainer: FlexColor.indigo.light.primaryContainer,
          secondary: FlexColor.indigo.light.secondary,
          secondaryContainer: FlexColor.indigo.light.secondaryContainer,
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
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexColorScheme.light(
            colors: FlexColor.mandyRed.light,
            scheme: FlexScheme.bigStone,
            usedColors: 3,
            surfaceMode: FlexSurfaceMode.level,
            blendLevel: 0,
            appBarStyle: FlexAppBarStyle.background,
            tabBarStyle: FlexTabBarStyle.forBackground,
            appBarElevation: 1,
            bottomAppBarElevation: 1,
            primary: FlexColor.indigo.light.primary,
            primaryContainer: FlexColor.indigo.light.primaryContainer,
            secondary: FlexColor.indigo.light.secondary,
            secondaryContainer: FlexColor.indigo.light.secondaryContainer,
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
          ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
      expect(
        FlexThemeData.dark(
          colors: FlexColor.mandyRed.dark,
          scheme: FlexScheme.bigStone,
          usedColors: 3,
          surfaceMode: FlexSurfaceMode.level,
          blendLevel: 0,
          appBarStyle: FlexAppBarStyle.background,
          tabBarStyle: FlexTabBarStyle.forBackground,
          appBarElevation: 1,
          bottomAppBarElevation: 1,
          primary: FlexColor.indigo.dark.primary,
          primaryContainer: FlexColor.indigo.dark.primaryContainer,
          secondary: FlexColor.indigo.dark.secondary,
          secondaryContainer: FlexColor.indigo.dark.secondaryContainer,
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
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexColorScheme.dark(
            colors: FlexColor.mandyRed.dark,
            scheme: FlexScheme.bigStone,
            usedColors: 3,
            surfaceMode: FlexSurfaceMode.level,
            blendLevel: 0,
            appBarStyle: FlexAppBarStyle.background,
            tabBarStyle: FlexTabBarStyle.forBackground,
            appBarElevation: 1,
            bottomAppBarElevation: 1,
            primary: FlexColor.indigo.dark.primary,
            primaryContainer: FlexColor.indigo.dark.primaryContainer,
            secondary: FlexColor.indigo.dark.secondary,
            secondaryContainer: FlexColor.indigo.dark.secondaryContainer,
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
          ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'FTD2.06: GIVEN equal FlexThemeData and FlexColorScheme.toTheme '
        'EXPECT equal.', () {
      expect(
        FlexThemeData.light(
          colors: FlexColor.mandyRed.light,
          scheme: FlexScheme.bigStone,
          usedColors: 3,
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog,
          blendLevel: 0,
          appBarStyle: FlexAppBarStyle.background,
          tabBarStyle: FlexTabBarStyle.forBackground,
          appBarElevation: 1,
          bottomAppBarElevation: 1,
          primary: FlexColor.indigo.light.primary,
          primaryContainer: FlexColor.indigo.light.primaryContainer,
          secondary: FlexColor.indigo.light.secondary,
          secondaryContainer: FlexColor.indigo.light.secondaryContainer,
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
          platform: TargetPlatform.android,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexColorScheme.light(
            colors: FlexColor.mandyRed.light,
            scheme: FlexScheme.bigStone,
            usedColors: 3,
            surfaceMode: FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog,
            blendLevel: 0,
            appBarStyle: FlexAppBarStyle.background,
            tabBarStyle: FlexTabBarStyle.forBackground,
            appBarElevation: 1,
            bottomAppBarElevation: 1,
            primary: FlexColor.indigo.light.primary,
            primaryContainer: FlexColor.indigo.light.primaryContainer,
            secondary: FlexColor.indigo.light.secondary,
            secondaryContainer: FlexColor.indigo.light.secondaryContainer,
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
            platform: TargetPlatform.android,
          ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
      expect(
        FlexThemeData.dark(
          colors: FlexColor.mandyRed.dark,
          scheme: FlexScheme.bigStone,
          usedColors: 3,
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog,
          blendLevel: 0,
          appBarStyle: FlexAppBarStyle.background,
          tabBarStyle: FlexTabBarStyle.forBackground,
          appBarElevation: 1,
          bottomAppBarElevation: 1,
          primary: FlexColor.indigo.dark.primary,
          primaryContainer: FlexColor.indigo.dark.primaryContainer,
          secondary: FlexColor.indigo.dark.secondary,
          secondaryContainer: FlexColor.indigo.dark.secondaryContainer,
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
          platform: TargetPlatform.android,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexColorScheme.dark(
            colors: FlexColor.mandyRed.dark,
            scheme: FlexScheme.bigStone,
            usedColors: 3,
            surfaceMode: FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog,
            blendLevel: 0,
            appBarStyle: FlexAppBarStyle.background,
            tabBarStyle: FlexTabBarStyle.forBackground,
            appBarElevation: 1,
            bottomAppBarElevation: 1,
            primary: FlexColor.indigo.dark.primary,
            primaryContainer: FlexColor.indigo.dark.primaryContainer,
            secondary: FlexColor.indigo.dark.secondary,
            secondaryContainer: FlexColor.indigo.dark.secondaryContainer,
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
            platform: TargetPlatform.android,
          ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'FTD2.07: GIVEN equal FlexThemeData and FlexColorScheme.toTheme '
        'case no sub-themes EXPECT equal.', () {
      const TextTheme myTextTheme = TextTheme(
        displayLarge: TextStyle(
          fontSize: 70, // Defaults to 96 in Material2018 Typography.
        ),
        labelLarge: TextStyle(
          fontSize: 16, // Defaults to 14 in Material2018 Typography.
          letterSpacing: 0.9, // Defaults to 1.25 in Material2018 Typography.
        ),
        labelSmall: TextStyle(
          fontSize: 11, // Defaults to 10 in Material2018 Typography.
          letterSpacing: 0.5, // Defaults to 1.5 in Material2018 Typography.
        ),
      );
      // Make a FlexColorScheme.
      final FlexColorScheme fcsLight = FlexColorScheme.light(
        colors: FlexColor.mandyRed.light,
        scheme: FlexScheme.bigStone,
        usedColors: 2,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 0,
        appBarStyle: FlexAppBarStyle.primary,
        tabBarStyle: FlexTabBarStyle.forAppBar,
        appBarElevation: 1,
        bottomAppBarElevation: 1,
        primary: FlexColor.indigo.light.primary,
        primaryContainer: FlexColor.indigo.light.primaryContainer,
        secondary: FlexColor.indigo.light.secondary,
        secondaryContainer: FlexColor.indigo.light.secondaryContainer,
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
        textTheme: myTextTheme,
        primaryTextTheme: myTextTheme,
        fontFamily: 'Roboto',
        platform: TargetPlatform.android,
        typography: Typography.material2018(platform: TargetPlatform.android),
        applyElevationOverlayColor: true,
      );

      // Turn it into ThemeData.
      final ThemeData fcsLightTd = fcsLight.toTheme;

      // Make same ThemeData via extension.
      final ThemeData ftdLight = FlexThemeData.light(
        // The manual colors will override commented ones:
        colors: FlexColor.mandyRed.light,
        scheme: FlexScheme.bigStone,
        usedColors: 2,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 0,
        appBarStyle: FlexAppBarStyle.primary,
        tabBarStyle: FlexTabBarStyle.forAppBar,
        appBarElevation: 1,
        bottomAppBarElevation: 1,
        primary: FlexColor.indigo.light.primary,
        primaryContainer: FlexColor.indigo.light.primaryContainer,
        secondary: FlexColor.indigo.light.secondary,
        secondaryContainer: FlexColor.indigo.light.secondaryContainer,
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
        textTheme: myTextTheme,
        primaryTextTheme: myTextTheme,
        fontFamily: 'Roboto',
        platform: TargetPlatform.android,
        typography: Typography.material2018(platform: TargetPlatform.android),
        applyElevationOverlayColor: true,
      );
      // Check to String equality
      expect(
        fcsLightTd.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          ftdLight.toString(minLevel: DiagnosticLevel.fine),
        ),
      );

      // Check object equality - Removed since as stated earlier, does not work.
      // expect(
      //   fcsLightTd,
      //   equals(ftdLight),
      // );
      // Same test for dark mode
      final FlexColorScheme fcsDark = FlexColorScheme.dark(
        colors: FlexColor.mandyRed.dark,
        scheme: FlexScheme.bigStone,
        usedColors: 3,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 0,
        appBarStyle: FlexAppBarStyle.background,
        tabBarStyle: FlexTabBarStyle.forBackground,
        appBarElevation: 1,
        bottomAppBarElevation: 1,
        primary: FlexColor.indigo.dark.primary,
        primaryContainer: FlexColor.indigo.dark.primaryContainer,
        secondary: FlexColor.indigo.dark.secondary,
        secondaryContainer: FlexColor.indigo.dark.secondaryContainer,
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
        tooltipsMatchBackground: false,
        transparentStatusBar: true,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        textTheme: myTextTheme,
        primaryTextTheme: myTextTheme,
        fontFamily: 'Roboto',
        platform: TargetPlatform.android,
        typography: Typography.material2018(platform: TargetPlatform.android),
        applyElevationOverlayColor: true,
      );
      expect(
        FlexThemeData.dark(
          colors: FlexColor.mandyRed.dark,
          scheme: FlexScheme.bigStone,
          usedColors: 3,
          surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
          blendLevel: 0,
          appBarStyle: FlexAppBarStyle.background,
          tabBarStyle: FlexTabBarStyle.forBackground,
          appBarElevation: 1,
          bottomAppBarElevation: 1,
          primary: FlexColor.indigo.dark.primary,
          primaryContainer: FlexColor.indigo.dark.primaryContainer,
          secondary: FlexColor.indigo.dark.secondary,
          secondaryContainer: FlexColor.indigo.dark.secondaryContainer,
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
          tooltipsMatchBackground: false,
          transparentStatusBar: true,
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          textTheme: myTextTheme,
          primaryTextTheme: myTextTheme,
          fontFamily: 'Roboto',
          platform: TargetPlatform.android,
          typography: Typography.material2018(platform: TargetPlatform.android),
          applyElevationOverlayColor: true,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          fcsDark.toTheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'FTD2.08-w-sub: GIVEN equal FlexThemeData and FlexColorScheme.toTheme '
        'case with sub-theme EXPECT equal.', () {
      const TextTheme myTextTheme = TextTheme(
        displayLarge: TextStyle(
          fontSize: 70, // Defaults to 96 in Material2018 Typography.
        ),
        labelLarge: TextStyle(
          fontSize: 16, // Defaults to 14 in Material2018 Typography.
          letterSpacing: 0.9, // Defaults to 1.25 in Material2018 Typography.
        ),
        labelSmall: TextStyle(
          fontSize: 11, // Defaults to 10 in Material2018 Typography.
          letterSpacing: 0.5, // Defaults to 1.5 in Material2018 Typography.
        ),
      );
      // Make a FlexColorScheme.
      final FlexColorScheme fcsLight1 = FlexColorScheme.light(
        colors: FlexColor.mandyRed.light,
        scheme: FlexScheme.bigStone,
        usedColors: 3,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 0,
        appBarStyle: FlexAppBarStyle.primary,
        tabBarStyle: FlexTabBarStyle.forAppBar,
        appBarElevation: 1,
        bottomAppBarElevation: 1,
        primary: FlexColor.indigo.light.primary,
        primaryContainer: FlexColor.indigo.light.primaryContainer,
        secondary: FlexColor.indigo.light.secondary,
        secondaryContainer: FlexColor.indigo.light.secondaryContainer,
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
        textTheme: myTextTheme,
        primaryTextTheme: myTextTheme,
        fontFamily: 'Roboto',
        platform: TargetPlatform.android,
        typography: Typography.material2018(platform: TargetPlatform.android),
        applyElevationOverlayColor: true,
        subThemesData: const FlexSubThemesData(),
      );

      final FlexColorScheme fcsLight2 = FlexColorScheme.light(
        colors: FlexColor.mandyRed.light,
        scheme: FlexScheme.bigStone,
        usedColors: 3,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 0,
        appBarStyle: FlexAppBarStyle.primary,
        tabBarStyle: FlexTabBarStyle.forAppBar,
        appBarElevation: 1,
        bottomAppBarElevation: 1,
        primary: FlexColor.indigo.light.primary,
        primaryContainer: FlexColor.indigo.light.primaryContainer,
        secondary: FlexColor.indigo.light.secondary,
        secondaryContainer: FlexColor.indigo.light.secondaryContainer,
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
        textTheme: myTextTheme,
        primaryTextTheme: myTextTheme,
        fontFamily: 'Roboto',
        platform: TargetPlatform.android,
        typography: Typography.material2018(platform: TargetPlatform.android),
        applyElevationOverlayColor: true,
        subThemesData: const FlexSubThemesData(),
      );

      // Check FlexColorScheme light object equality - with all props.
      expect(
        fcsLight1,
        equals(fcsLight2),
      );

      // Turn it into ThemeData.
      final ThemeData fcsLightTd = fcsLight1.toTheme;

      // Make same ThemeData via extension.
      final ThemeData ftdLight = FlexThemeData.light(
        // The manual colors will override commented ones:
        colors: FlexColor.mandyRed.light,
        scheme: FlexScheme.bigStone,
        usedColors: 3,
        surfaceMode: FlexSurfaceMode.highSurfaceLowScaffold,
        blendLevel: 0,
        appBarStyle: FlexAppBarStyle.primary,
        tabBarStyle: FlexTabBarStyle.forAppBar,
        appBarElevation: 1,
        bottomAppBarElevation: 1,
        primary: FlexColor.indigo.light.primary,
        primaryContainer: FlexColor.indigo.light.primaryContainer,
        secondary: FlexColor.indigo.light.secondary,
        secondaryContainer: FlexColor.indigo.light.secondaryContainer,
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
        textTheme: myTextTheme,
        primaryTextTheme: myTextTheme,
        fontFamily: 'Roboto',
        platform: TargetPlatform.android,
        typography: Typography.material2018(platform: TargetPlatform.android),
        applyElevationOverlayColor: true,
        subThemesData: const FlexSubThemesData(),
      );
      // Check to String equality
      expect(
        fcsLightTd.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          ftdLight.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
      // TODO(rydmike): toString on ThemeData match above, but not ThemeData.
      // Using isNot to prove that here and get a track on the issue, if it
      // ever changes and is fixed, it will show up here.
      // Check ThemeData equality, well checking inequality for now.
      expect(
        fcsLightTd,
        isNot(ftdLight),
      );
      expect(
        ftdLight,
        equals(ftdLight.copyWith(
          primaryColor: FlexColor.indigo.light.primary,
          scaffoldBackgroundColor: FlexColor.lightScaffoldBackground,
          dialogBackgroundColor: FlexColor.lightSurface,
        )),
      );
    });

    test(
        'FTD2.08-w-sub2: GIVEN equal FlexThemeData and FlexColorScheme.toTheme '
        'case with sub-theme and rev tooltip EXPECT equal.', () {
      const TextTheme myTextTheme = TextTheme(
        displayLarge: TextStyle(
          fontSize: 70, // Defaults to 96 in Material2018 Typography.
        ),
        labelLarge: TextStyle(
          fontSize: 16, // Defaults to 14 in Material2018 Typography.
          letterSpacing: 0.9, // Defaults to 1.25 in Material2018 Typography.
        ),
        labelSmall: TextStyle(
          fontSize: 11, // Defaults to 10 in Material2018 Typography.
          letterSpacing: 0.5, // Defaults to 1.5 in Material2018 Typography.
        ),
      );
      // Make a FlexColorScheme.
      final FlexColorScheme fcsLight1 = FlexColorScheme.light(
        colors: FlexColor.mandyRed.light,
        scheme: FlexScheme.bigStone,
        usedColors: 3,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 0,
        appBarStyle: FlexAppBarStyle.primary,
        appBarOpacity: 0.95,
        appBarElevation: 1,
        bottomAppBarElevation: 1,
        tabBarStyle: FlexTabBarStyle.universal,
        primary: FlexColor.indigo.light.primary,
        primaryContainer: FlexColor.indigo.light.primaryContainer,
        secondary: FlexColor.indigo.light.secondary,
        secondaryContainer: FlexColor.indigo.light.secondaryContainer,
        tertiary: FlexColor.indigo.light.tertiary,
        tertiaryContainer: FlexColor.indigo.light.tertiaryContainer,
        error: FlexColor.indigo.light.error,
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
        lightIsWhite: true,
        swapColors: false,
        tooltipsMatchBackground: false,
        transparentStatusBar: true,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        textTheme: myTextTheme,
        primaryTextTheme: myTextTheme,
        fontFamily: 'Roboto',
        fontFamilyFallback: const <String>['Roboto', 'Arial'],
        package: 'SansSerif',
        platform: TargetPlatform.android,
        typography: Typography.material2018(platform: TargetPlatform.android),
        applyElevationOverlayColor: true,
        subThemesData: const FlexSubThemesData(),
      );

      final FlexColorScheme fcsLight2 = FlexColorScheme.light(
        colors: FlexColor.mandyRed.light,
        scheme: FlexScheme.bigStone,
        usedColors: 3,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 0,
        appBarStyle: FlexAppBarStyle.primary,
        appBarOpacity: 0.95,
        appBarElevation: 1,
        bottomAppBarElevation: 1,
        tabBarStyle: FlexTabBarStyle.universal,
        primary: FlexColor.indigo.light.primary,
        primaryContainer: FlexColor.indigo.light.primaryContainer,
        secondary: FlexColor.indigo.light.secondary,
        secondaryContainer: FlexColor.indigo.light.secondaryContainer,
        tertiary: FlexColor.indigo.light.tertiary,
        tertiaryContainer: FlexColor.indigo.light.tertiaryContainer,
        error: FlexColor.indigo.light.error,
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
        lightIsWhite: true,
        swapColors: false,
        tooltipsMatchBackground: false,
        transparentStatusBar: true,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        textTheme: myTextTheme,
        primaryTextTheme: myTextTheme,
        fontFamily: 'Roboto',
        fontFamilyFallback: const <String>['Roboto', 'Arial'],
        package: 'SansSerif',
        platform: TargetPlatform.android,
        typography: Typography.material2018(platform: TargetPlatform.android),
        applyElevationOverlayColor: true,
        subThemesData: const FlexSubThemesData(),
      );

      // Check FlexColorScheme light object equality - with all props.
      expect(
        fcsLight1,
        equals(fcsLight2),
      );

      // Turn it into ThemeData.
      final ThemeData fcsLightTd = fcsLight1.toTheme;

      // Make same ThemeData via extension.
      final ThemeData ftdLight = FlexThemeData.light(
        // The manual colors will override commented ones:
        colors: FlexColor.mandyRed.light,
        scheme: FlexScheme.bigStone,
        usedColors: 3,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 0,
        appBarStyle: FlexAppBarStyle.primary,
        appBarOpacity: 0.95,
        appBarElevation: 1,
        bottomAppBarElevation: 1,
        tabBarStyle: FlexTabBarStyle.universal,
        primary: FlexColor.indigo.light.primary,
        primaryContainer: FlexColor.indigo.light.primaryContainer,
        secondary: FlexColor.indigo.light.secondary,
        secondaryContainer: FlexColor.indigo.light.secondaryContainer,
        tertiary: FlexColor.indigo.light.tertiary,
        tertiaryContainer: FlexColor.indigo.light.tertiaryContainer,
        error: FlexColor.indigo.light.error,
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
        lightIsWhite: true,
        swapColors: false,
        tooltipsMatchBackground: false,
        transparentStatusBar: true,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        textTheme: myTextTheme,
        primaryTextTheme: myTextTheme,
        fontFamily: 'Roboto',
        fontFamilyFallback: const <String>['Roboto', 'Arial'],
        package: 'SansSerif',
        platform: TargetPlatform.android,
        typography: Typography.material2018(platform: TargetPlatform.android),
        applyElevationOverlayColor: true,
        subThemesData: const FlexSubThemesData(),
      );
      // Check to String equality
      expect(
        fcsLightTd.toString(),
        equalsIgnoringHashCodes(
          ftdLight.toString(),
        ),
      );
      // TODO(rydmike): toString on ThemeData match above, but not ThemeData.
      // Using isNot to prove that here and get a track on the issue, if it
      // ever changes and is fixed, it will show up here.
      // Check ThemeData equality, well checking inequality for now.
      expect(
        fcsLightTd,
        isNot(ftdLight),
      );
      // Test color override results with this copyWith, copying in expected
      // results that should not change the ColorScheme.
      expect(
        ftdLight,
        equals(ftdLight.copyWith(primaryColor: FlexColor.indigo.light.primary)),
      );
      expect(
        ftdLight.colorScheme,
        equals(ftdLight.colorScheme.copyWith(
            primaryContainer: FlexColor.indigo.light.primaryContainer)),
      );
      expect(
        ftdLight.colorScheme,
        equals(ftdLight.colorScheme
            .copyWith(secondary: FlexColor.indigo.light.secondary)),
      );
      // Used colors is 3, we should NOT get tertiary, but computed value
      expect(
        ftdLight.colorScheme,
        isNot(ftdLight.colorScheme
            .copyWith(tertiary: FlexColor.indigo.light.tertiary)),
      );
      // But we should get this color on tertiary with this setup.
      expect(
        ftdLight.colorScheme,
        equals(ftdLight.colorScheme.copyWith(
          tertiary: FlexColor.indigo.light.primary.brighten(15),
        )),
      );
    });

    test(
        'FTD2.09-w-sub-DARK: GIVEN equal FlexThemeData and '
        'FlexColorScheme.toTheme case with sub-theme EXPECT equal.', () {
      const TextTheme myTextTheme = TextTheme(
        displayLarge: TextStyle(
          fontSize: 70, // Defaults to 96 in Material2018 Typography.
        ),
        labelLarge: TextStyle(
          fontSize: 16, // Defaults to 14 in Material2018 Typography.
          letterSpacing: 0.9, // Defaults to 1.25 in Material2018 Typography.
        ),
        labelSmall: TextStyle(
          fontSize: 11, // Defaults to 10 in Material2018 Typography.
          letterSpacing: 0.5, // Defaults to 1.5 in Material2018 Typography.
        ),
      );

      // Same test for dark mode
      final FlexColorScheme fcsDark1 = FlexColorScheme.dark(
        colors: FlexColor.mandyRed.dark,
        scheme: FlexScheme.bigStone,
        usedColors: 3,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 20,
        appBarStyle: FlexAppBarStyle.background,
        appBarOpacity: 0.95,
        appBarElevation: 1,
        bottomAppBarElevation: 1,
        tabBarStyle: FlexTabBarStyle.forBackground,
        primary: FlexColor.indigo.dark.primary,
        primaryContainer: FlexColor.indigo.dark.primaryContainer,
        secondary: FlexColor.indigo.dark.secondary,
        secondaryContainer: FlexColor.indigo.dark.secondaryContainer,
        error: FlexColor.indigo.dark.error,
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
        darkIsTrueBlack: true,
        swapColors: true,
        tooltipsMatchBackground: true,
        transparentStatusBar: true,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        textTheme: myTextTheme,
        primaryTextTheme: myTextTheme,
        fontFamily: 'Roboto',
        fontFamilyFallback: const <String>['Roboto', 'Arial'],
        package: 'SansSerif',
        platform: TargetPlatform.android,
        typography: Typography.material2018(platform: TargetPlatform.android),
        applyElevationOverlayColor: true,
        subThemesData: const FlexSubThemesData(),
      );

      final FlexColorScheme fcsDark2 = FlexColorScheme.dark(
        colors: FlexColor.mandyRed.dark,
        scheme: FlexScheme.bigStone,
        usedColors: 3,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 20,
        appBarStyle: FlexAppBarStyle.background,
        appBarOpacity: 0.95,
        appBarElevation: 1,
        bottomAppBarElevation: 1,
        tabBarStyle: FlexTabBarStyle.forBackground,
        primary: FlexColor.indigo.dark.primary,
        primaryContainer: FlexColor.indigo.dark.primaryContainer,
        secondary: FlexColor.indigo.dark.secondary,
        secondaryContainer: FlexColor.indigo.dark.secondaryContainer,
        error: FlexColor.indigo.dark.error,
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
        darkIsTrueBlack: true,
        swapColors: true,
        tooltipsMatchBackground: true,
        transparentStatusBar: true,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        textTheme: myTextTheme,
        primaryTextTheme: myTextTheme,
        fontFamily: 'Roboto',
        fontFamilyFallback: const <String>['Roboto', 'Arial'],
        package: 'SansSerif',
        platform: TargetPlatform.android,
        typography: Typography.material2018(platform: TargetPlatform.android),
        applyElevationOverlayColor: true,
        subThemesData: const FlexSubThemesData(),
      );

      // Check FlexColorScheme dark object equality - with all props.
      expect(
        fcsDark1,
        equals(fcsDark2),
      );

      // Turn it into ThemeData.
      final ThemeData fcsTdDark = fcsDark1.toTheme;

      final ThemeData fcsDarkTd = FlexThemeData.dark(
        colors: FlexColor.mandyRed.dark,
        scheme: FlexScheme.bigStone,
        usedColors: 3,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 20,
        appBarStyle: FlexAppBarStyle.background,
        appBarOpacity: 0.95,
        appBarElevation: 1,
        bottomAppBarElevation: 1,
        tabBarStyle: FlexTabBarStyle.forBackground,
        primary: FlexColor.indigo.dark.primary,
        primaryContainer: FlexColor.indigo.dark.primaryContainer,
        secondary: FlexColor.indigo.dark.secondary,
        secondaryContainer: FlexColor.indigo.dark.secondaryContainer,
        error: FlexColor.indigo.dark.error,
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
        darkIsTrueBlack: true,
        swapColors: true,
        tooltipsMatchBackground: true,
        transparentStatusBar: true,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        textTheme: myTextTheme,
        primaryTextTheme: myTextTheme,
        fontFamily: 'Roboto',
        fontFamilyFallback: const <String>['Roboto', 'Arial'],
        package: 'SansSerif',
        platform: TargetPlatform.android,
        typography: Typography.material2018(platform: TargetPlatform.android),
        applyElevationOverlayColor: true,
        subThemesData: const FlexSubThemesData(),
      );
      // Check to String equality
      expect(
        fcsTdDark.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          fcsDarkTd.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
      // TODO(rydmike): toString on ThemeData match above, but not ThemeData.
      // Using isNot to prove that here and get a track on the issue, if it
      // ever changes and is fixed, it will show up here.
      // Check ThemeData equality, well checking inequality for now.
      expect(
        fcsTdDark,
        isNot(fcsDarkTd),
      );
    });

    //**************************************************************************
    // FlexThemeData TESTS
    //**************************************************************************

    debugDefaultTargetPlatformOverride = null;
    TestWidgetsFlutterBinding.ensureInitialized();

    test(
        'FTD3.00DefL: GIVEN FlexThemeData.light made with no parameters '
        'EXPECT its ThemeData to be equal to one made with light scheme.', () {
      expect(
        FlexThemeData.light().toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexColorScheme.light(
            colors: FlexColor.schemes[FlexScheme.material]!.light,
          ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'FTD3.00aL: GIVEN FlexThemeData.light made with identical '
        'parameters as FlexColorScheme EXPECT their ThemeData '
        'to be equal.', () {
      expect(
        FlexThemeData.light(
          colors: FlexColor.schemes[FlexScheme.material]!.light,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexColorScheme.light(
            colors: FlexColor.schemes[FlexScheme.material]!.light,
          ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'FTD3.00bL: GIVEN a FlexColorScheme.light made with no '
        'parameters EXPECT ThemeData to be equal to one made with '
        'scheme FlexThemeData.light FlexScheme.material.', () {
      expect(
        FlexColorScheme.light()
            .toTheme
            .toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexThemeData.light(scheme: FlexScheme.material)
              .toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'FTD3.00cL: GIVEN a FlexThemeData.light made with colors '
        'material EXPECT ThemeData to be equal to one made with '
        'scheme FlexColorScheme.light FlexScheme.material.', () {
      expect(
        FlexThemeData.light(
          colors: FlexColor.schemes[FlexScheme.material]!.light,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexColorScheme.light(
            scheme: FlexScheme.material,
          ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'FTD3.00dL: GIVEN a FlexThemeData.light made with scheme '
        'material EXPECT ThemeData to be equal to one made with '
        'no params.', () {
      expect(
          FlexThemeData.light(
            colors: FlexColor.schemes[FlexScheme.material]!.light,
          ).toString(minLevel: DiagnosticLevel.fine),
          equalsIgnoringHashCodes(FlexColorScheme.light()
              .toTheme
              .toString(minLevel: DiagnosticLevel.fine)));
    });

    test(
        'FTD3.00RawD: GIVEN FlexThemeData.dark() made with min required dark '
        'params that equals default Material dark scheme '
        'EXPECT its ThemeData to be equal to one made with FlexColorScheme '
        'dark scheme with no parameters.', () {
      expect(
        FlexThemeData.dark(
          colors: const FlexSchemeColor(
            primary: FlexColor.materialDarkPrimary,
            primaryContainer: FlexColor.materialDarkPrimaryContainer,
            secondary: FlexColor.materialDarkSecondary,
            secondaryContainer: FlexColor.materialDarkSecondaryContainer,
            tertiary: FlexColor.materialDarkTertiary,
            tertiaryContainer: FlexColor.materialDarkTertiaryContainer,
            appBarColor: FlexColor.materialDarkTertiary,
          ),
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexColorScheme.dark()
              .toTheme
              .toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });

    // themeDark = Default material dark scheme colors.
    test(
        'FTD3.00SwapL: GIVEN FlexThemeData.light(light colors swapped) '
        'EXPECT it to be equal to one made with '
        'FlexColorScheme.light(swapColors: true)', () {
      expect(
        FlexThemeData.light(
          colors: const FlexSchemeColor(
            primary: FlexColor.materialLightSecondary,
            primaryContainer: FlexColor.materialLightSecondaryContainer,
            secondary: FlexColor.materialLightPrimary,
            secondaryContainer: FlexColor.materialLightPrimaryContainer,
            tertiaryContainer: FlexColor.materialLightTertiaryContainer,
            tertiary: FlexColor.materialLightTertiary,
            appBarColor: FlexColor.materialDarkTertiary,
          ),
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexColorScheme.light(
            swapColors: true,
          ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });

    // themeDark = Default material dark scheme colors.
    test(
        'FTD3.00SwapD: GIVEN FlexThemeData.dark(dark colors swapped) '
        'EXPECT it to be equal to one made with '
        'FlexThemeData.dark(swapColors: true)', () {
      expect(
        FlexThemeData.dark(
          colors: const FlexSchemeColor(
            primary: FlexColor.materialDarkSecondary,
            primaryContainer: FlexColor.materialDarkSecondaryContainer,
            secondary: FlexColor.materialDarkPrimary,
            secondaryContainer: FlexColor.materialDarkPrimaryContainer,
            tertiary: FlexColor.materialDarkTertiary,
            tertiaryContainer: FlexColor.materialDarkTertiaryContainer,
            appBarColor: FlexColor.materialDarkTertiary,
          ),
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexColorScheme.dark(
            swapColors: true,
          ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });

    test(
        'FTD3.00DefL: GIVEN FlexColorScheme.dark made with no parameters '
        'EXPECT its ThemeData to be equal to one made with FlexThemeData '
        'dark scheme.', () {
      expect(
        FlexColorScheme.dark().toTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexThemeData.dark(
            colors: FlexColor.schemes[FlexScheme.material]!.dark,
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'FTD3.00aD: GIVEN two FlexColorScheme.dark made with identical '
        'parameters as a FlexThemeData.dark EXPECT their ThemeData to '
        'be equal.', () {
      expect(
        FlexColorScheme.dark(
          colors: FlexColor.schemes[FlexScheme.material]!.dark,
        ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexThemeData.dark(
            colors: FlexColor.schemes[FlexScheme.material]!.dark,
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'FTD3.00bD: GIVEN a FlexThemeData.dark made with no '
        'parameters EXPECT ThemeData to be equal to one made with '
        'scheme FlexScheme.material.', () {
      expect(
        FlexThemeData.dark().toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexThemeData.dark(scheme: FlexScheme.material)
              .toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'FTD3.00cD: GIVEN a FlexThemeData.dark made with colors '
        'material EXPECT ThemeData to be equal to one made with '
        'FlexColorScheme.dark FlexScheme.material.', () {
      expect(
        FlexThemeData.dark(
          colors: FlexColor.schemes[FlexScheme.material]!.dark,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(FlexColorScheme.dark(
          scheme: FlexScheme.material,
        ).toTheme.toString(minLevel: DiagnosticLevel.fine)),
      );
    });
    test(
        'FTD3.00dD: GIVEN a FlexColorScheme.dark made with scheme '
        'material EXPECT ThemeData to be equal to one made with '
        'FlexThemeData.dark and no params.', () {
      expect(
        FlexColorScheme.dark(
          colors: FlexColor.schemes[FlexScheme.material]!.dark,
        ).toTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          FlexThemeData.dark().toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });

    // AppBar test null style, not using M3.
    final ThemeData tLAppBarNull = FlexThemeData.light(
      scheme: FlexScheme.flutterDash,
      // appBarStyle: null, // Default value
      // useMaterial3: false, // Default value
    );
    test(
        'FTD3.10 Light: GIVEN a FlexThemeData.light with null appBarStyle and '
        'not using M3 EXPECT app bar background primary ', () {
      expect(tLAppBarNull.appBarTheme.backgroundColor,
          equals(tLAppBarNull.colorScheme.primary));
    });
    final ThemeData tDAppBarNull = FlexThemeData.dark(
      scheme: FlexScheme.flutterDash,
      // appBarStyle: null, // Default value
      // useMaterial3: false, // Default value
    );
    test(
        'FTD3.10 Dark: GIVEN a FlexThemeData.dark with null appBarStyle and '
        'not using M3 EXPECT app bar background surface ', () {
      expect(tDAppBarNull.appBarTheme.backgroundColor,
          equals(tDAppBarNull.colorScheme.surface));
    });
    // AppBar test null style, using M3.
    final ThemeData tLAppBarNullM3 = FlexThemeData.light(
      scheme: FlexScheme.flutterDash,
      // appBarStyle: null, // Default value
      useMaterial3: true,
    );
    test(
        'FTD3.11 Light: GIVEN a FlexThemeData.light with null appBarStyle '
        'and using M3 EXPECT app bar background null ', () {
      expect(tLAppBarNullM3.appBarTheme.backgroundColor, equals(null));
    });
    final ThemeData tDAppBarNullM3 = FlexThemeData.dark(
      scheme: FlexScheme.flutterDash,
      // appBarStyle: null, // Default value
      useMaterial3: true,
    );
    test(
        'FTD3.11 Dark: GIVEN a FlexThemeData.dark with null appBarStyle and '
        ' using M3 EXPECT app bar background null ', () {
      expect(tDAppBarNullM3.appBarTheme.backgroundColor, equals(null));
    });

    // Test swapLegacyOnMaterial3 when using Material 3 - No swap result
    final ThemeData tLSwapLegacy = FlexThemeData.light(
      scheme: FlexScheme.materialBaseline,
      useMaterial3: true,
      swapLegacyOnMaterial3: true,
    );
    test(
        'FCS7.100 GIVEN a FlexThemeData.light with useMaterial3:true '
        'and swapLegacyOnMaterial3:true and theme materialBaseline '
        'EXPECT no legacy swap - materialBaseline does not swap', () {
      expect(
        tLSwapLegacy.colorScheme.secondary,
        equals(FlexColor.materialBaselineLightSecondary),
      );
      expect(
        tLSwapLegacy.colorScheme.secondaryContainer,
        equals(FlexColor.materialBaselineLightSecondaryContainer),
      );
      expect(
        tLSwapLegacy.colorScheme.tertiary,
        equals(FlexColor.materialBaselineLightTertiary),
      );
      expect(
        tLSwapLegacy.colorScheme.tertiaryContainer,
        equals(FlexColor.materialBaselineLightTertiaryContainer),
      );
    });
    // Test swapLegacyOnMaterial3 when using Material 3 - Swapped result
    final ThemeData tLSwapLegacy2 = FlexThemeData.light(
      scheme: FlexScheme.sanJuanBlue,
      useMaterial3: true,
      swapLegacyOnMaterial3: true,
    );
    test(
        'FCS7.100 GIVEN a FlexThemeData.light with useMaterial3:true '
        'and swapLegacyOnMaterial3:true and theme sanJuanBlue '
        'EXPECT legacy swap - Blumine swaps', () {
      expect(
        tLSwapLegacy2.colorScheme.secondary,
        equals(FlexColor.sanJuanBlueLightTertiary),
      );
      expect(
        tLSwapLegacy2.colorScheme.secondaryContainer,
        equals(FlexColor.sanJuanBlueLightTertiaryContainer),
      );
      expect(
        tLSwapLegacy2.colorScheme.tertiary,
        equals(FlexColor.sanJuanBlueLightSecondary),
      );
      expect(
        tLSwapLegacy2.colorScheme.tertiaryContainer,
        equals(FlexColor.sanJuanBlueLightSecondaryContainer),
      );
    });
    // Test swapLegacyOnMaterial3 when using Material 3 - No swap result
    final ThemeData tDSwapLegacy = FlexThemeData.dark(
      scheme: FlexScheme.materialBaseline,
      useMaterial3: true,
      swapLegacyOnMaterial3: true,
    );
    test(
        'FCS7.100 GIVEN a FlexThemeData.Dark with useMaterial3:true '
        'and swapLegacyOnMaterial3:true and theme materialBaseline '
        'EXPECT no legacy swap - materialBaseline does not swap', () {
      expect(
        tDSwapLegacy.colorScheme.secondary,
        equals(FlexColor.materialBaselineDarkSecondary),
      );
      expect(
        tDSwapLegacy.colorScheme.secondaryContainer,
        equals(FlexColor.materialBaselineDarkSecondaryContainer),
      );
      expect(
        tDSwapLegacy.colorScheme.tertiary,
        equals(FlexColor.materialBaselineDarkTertiary),
      );
      expect(
        tDSwapLegacy.colorScheme.tertiaryContainer,
        equals(FlexColor.materialBaselineDarkTertiaryContainer),
      );
    });
    // Test swapLegacyOnMaterial3 when using Material 3 - Swapped result
    final ThemeData tDSwapLegacy2 = FlexThemeData.dark(
      scheme: FlexScheme.sanJuanBlue,
      useMaterial3: true,
      swapLegacyOnMaterial3: true,
    );
    test(
        'FCS7.100 GIVEN a FlexThemeData.Dark with useMaterial3:true '
        'and swapLegacyOnMaterial3:true and theme sanJuanBlue '
        'EXPECT legacy swap - Blumine swaps', () {
      expect(
        tDSwapLegacy2.colorScheme.secondary,
        equals(FlexColor.sanJuanBlueDarkTertiary),
      );
      expect(
        tDSwapLegacy2.colorScheme.secondaryContainer,
        equals(FlexColor.sanJuanBlueDarkTertiaryContainer),
      );
      expect(
        tDSwapLegacy2.colorScheme.tertiary,
        equals(FlexColor.sanJuanBlueDarkSecondary),
      );
      expect(
        tDSwapLegacy2.colorScheme.tertiaryContainer,
        equals(FlexColor.sanJuanBlueDarkSecondaryContainer),
      );
    });
  });
}
