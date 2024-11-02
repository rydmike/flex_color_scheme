import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test FlexColorScheme V8 features: fixedColorStyle', () {
    test(
        'FCSV8:01L GIVEN a M3 FlexColorScheme.light with  '
        'fixedColorStyle.computed expect given styles.', () {
      final FlexColorScheme fcs = FlexColorScheme.light(
        scheme: FlexScheme.materialBaseline,
        fixedColorStyle: FlexFixedColorStyle.computed,
      );
      final ThemeData theme = fcs.toTheme;
      expect(
        theme.colorScheme.primaryFixed,
        equals(const Color(0xFFDDD7EB)),
      );
      expect(
        theme.colorScheme.onPrimaryFixed,
        equals(const Color(0xFF2B2145)),
      );
      expect(
        theme.colorScheme.primaryFixedDim,
        equals(const Color(0xFFBBB1D8)),
      );
      expect(
        theme.colorScheme.onPrimaryFixedVariant,
        equals(const Color(0xFF332851)),
      );
      //
      expect(
        theme.colorScheme.secondaryFixed,
        equals(const Color(0xFFDCDAE1)),
      );
      expect(
        theme.colorScheme.onSecondaryFixed,
        equals(const Color(0xFF232129)),
      );
      expect(
        theme.colorScheme.secondaryFixedDim,
        equals(const Color(0xFFBCB8C3)),
      );
      expect(
        theme.colorScheme.onSecondaryFixedVariant,
        equals(const Color(0xFF2C2933)),
      );
      //
      expect(
        theme.colorScheme.tertiaryFixed,
        equals(const Color(0xFFE4D7DB)),
      );
      expect(
        theme.colorScheme.onTertiaryFixed,
        equals(const Color(0xFF2E1E23)),
      );
      expect(
        theme.colorScheme.tertiaryFixedDim,
        equals(const Color(0xFFC9B4BB)),
      );
      expect(
        theme.colorScheme.onTertiaryFixedVariant,
        equals(const Color(0xFF39252C)),
      );
    });
    test(
        'FCSV8:01D GIVEN a M3 FlexColorScheme.dark with  '
        'fixedColorStyle.computed expect given styles.', () {
      final FlexColorScheme fcs = FlexColorScheme.dark(
        scheme: FlexScheme.materialBaseline,
        fixedColorStyle: FlexFixedColorStyle.computed,
      );
      final ThemeData theme = fcs.toTheme;
      expect(
        theme.colorScheme.primaryFixed,
        equals(const Color(0xFFDDD7EB)),
      );
      expect(
        theme.colorScheme.onPrimaryFixed,
        equals(const Color(0xFF2B2145)),
      );
      expect(
        theme.colorScheme.primaryFixedDim,
        equals(const Color(0xFFBBB1D8)),
      );
      expect(
        theme.colorScheme.onPrimaryFixedVariant,
        equals(const Color(0xFF332851)),
      );
      //
      expect(
        theme.colorScheme.secondaryFixed,
        equals(const Color(0xFFDCDAE1)),
      );
      expect(
        theme.colorScheme.onSecondaryFixed,
        equals(const Color(0xFF232129)),
      );
      expect(
        theme.colorScheme.secondaryFixedDim,
        equals(const Color(0xFFBCB8C3)),
      );
      expect(
        theme.colorScheme.onSecondaryFixedVariant,
        equals(const Color(0xFF2C2933)),
      );
      //
      expect(
        theme.colorScheme.tertiaryFixed,
        equals(const Color(0xFFE4D7DB)),
      );
      expect(
        theme.colorScheme.onTertiaryFixed,
        equals(const Color(0xFF2E1E23)),
      );
      expect(
        theme.colorScheme.tertiaryFixedDim,
        equals(const Color(0xFFC9B4BB)),
      );
      expect(
        theme.colorScheme.onTertiaryFixedVariant,
        equals(const Color(0xFF39252C)),
      );
    });
    test(
        'FCSV8:02L GIVEN a M3 FlexColorScheme.light with  '
        'fixedColorStyle.seeded expect given styles.', () {
      final FlexColorScheme fcs = FlexColorScheme.light(
        scheme: FlexScheme.materialBaseline,
        fixedColorStyle: FlexFixedColorStyle.seeded,
      );
      final ThemeData theme = fcs.toTheme;
      expect(
        theme.colorScheme.primaryFixed,
        equals(const Color(0xFFE9DDFF)),
      );
      expect(
        theme.colorScheme.onPrimaryFixed,
        equals(const Color(0xFF22005D)),
      );
      expect(
        theme.colorScheme.primaryFixedDim,
        equals(const Color(0xFFCFBCFF)),
      );
      expect(
        theme.colorScheme.onPrimaryFixedVariant,
        equals(const Color(0xFF4F378A)),
      );
      //
      expect(
        theme.colorScheme.secondaryFixed,
        equals(const Color(0xFFE8DEF9)),
      );
      expect(
        theme.colorScheme.onSecondaryFixed,
        equals(const Color(0xFF1E192B)),
      );
      expect(
        theme.colorScheme.secondaryFixedDim,
        equals(const Color(0xFFCCC2DC)),
      );
      expect(
        theme.colorScheme.onSecondaryFixedVariant,
        equals(const Color(0xFF4A4358)),
      );
      //
      expect(
        theme.colorScheme.tertiaryFixed,
        equals(const Color(0xFFFFD9E3)),
      );
      expect(
        theme.colorScheme.onTertiaryFixed,
        equals(const Color(0xFF31111D)),
      );
      expect(
        theme.colorScheme.tertiaryFixedDim,
        equals(const Color(0xFFEEB8C8)),
      );
      expect(
        theme.colorScheme.onTertiaryFixedVariant,
        equals(const Color(0xFF633B48)),
      );
    });
    test(
        'FCSV8:02D GIVEN a M3 FlexColorScheme.dark with  '
        'fixedColorStyle.seeded expect given styles.', () {
      final FlexColorScheme fcs = FlexColorScheme.dark(
        scheme: FlexScheme.materialBaseline,
        fixedColorStyle: FlexFixedColorStyle.seeded,
      );
      final ThemeData theme = fcs.toTheme;
      expect(
        theme.colorScheme.primaryFixed,
        equals(const Color(0xFFE9DDFF)),
      );
      expect(
        theme.colorScheme.onPrimaryFixed,
        equals(const Color(0xFF22005D)),
      );
      expect(
        theme.colorScheme.primaryFixedDim,
        equals(const Color(0xFFCFBCFF)),
      );
      expect(
        theme.colorScheme.onPrimaryFixedVariant,
        equals(const Color(0xFF4F378A)),
      );
      //
      expect(
        theme.colorScheme.secondaryFixed,
        equals(const Color(0xFFE8DEF9)),
      );
      expect(
        theme.colorScheme.onSecondaryFixed,
        equals(const Color(0xFF1E192B)),
      );
      expect(
        theme.colorScheme.secondaryFixedDim,
        equals(const Color(0xFFCCC2DC)),
      );
      expect(
        theme.colorScheme.onSecondaryFixedVariant,
        equals(const Color(0xFF4A4358)),
      );
      //
      expect(
        theme.colorScheme.tertiaryFixed,
        equals(const Color(0xFFFFD9E3)),
      );
      expect(
        theme.colorScheme.onTertiaryFixed,
        equals(const Color(0xFF31111D)),
      );
      expect(
        theme.colorScheme.tertiaryFixedDim,
        equals(const Color(0xFFEEB8C8)),
      );
      expect(
        theme.colorScheme.onTertiaryFixedVariant,
        equals(const Color(0xFF633B48)),
      );
    });
    test(
        'FCSV8:03L GIVEN a M3 FlexColorScheme.light with  '
        'fixedColorStyle.seededHighContrast expect given styles.', () {
      final FlexColorScheme fcs = FlexColorScheme.light(
        scheme: FlexScheme.materialBaseline,
        fixedColorStyle: FlexFixedColorStyle.seededHighContrast,
      );
      final ThemeData theme = fcs.toTheme;
      expect(
        theme.colorScheme.primaryFixed,
        equals(const Color(0xFFEEE4FF)),
      );
      expect(
        theme.colorScheme.onPrimaryFixed,
        equals(const Color(0xFF190048)),
      );
      expect(
        theme.colorScheme.primaryFixedDim,
        equals(const Color(0xFFD9CAFF)),
      );
      expect(
        theme.colorScheme.onPrimaryFixedVariant,
        equals(const Color(0xFF260661)),
      );
      //
      expect(
        theme.colorScheme.secondaryFixed,
        equals(const Color(0xFFEEE4FE)),
      );
      expect(
        theme.colorScheme.onSecondaryFixed,
        equals(const Color(0xFF161023)),
      );
      expect(
        theme.colorScheme.secondaryFixedDim,
        equals(const Color(0xFFD7CDE7)),
      );
      expect(
        theme.colorScheme.onSecondaryFixedVariant,
        equals(const Color(0xFF221D2F)),
      );
      //
      expect(
        theme.colorScheme.tertiaryFixed,
        equals(const Color(0xFFFFE1E8)),
      );
      expect(
        theme.colorScheme.onTertiaryFixed,
        equals(const Color(0xFF270915)),
      );
      expect(
        theme.colorScheme.tertiaryFixedDim,
        equals(const Color(0xFFFAC3D3)),
      );
      expect(
        theme.colorScheme.onTertiaryFixedVariant,
        equals(const Color(0xFF361521)),
      );
    });
    test(
        'FCSV8:03D GIVEN a M3 FlexColorScheme.dark with  '
        'fixedColorStyle.seededHighContrast expect given styles.', () {
      final FlexColorScheme fcs = FlexColorScheme.dark(
        scheme: FlexScheme.materialBaseline,
        fixedColorStyle: FlexFixedColorStyle.seededHighContrast,
      );
      final ThemeData theme = fcs.toTheme;
      expect(
        theme.colorScheme.primaryFixed,
        equals(const Color(0xFFEEE4FF)),
      );
      expect(
        theme.colorScheme.onPrimaryFixed,
        equals(const Color(0xFF190048)),
      );
      expect(
        theme.colorScheme.primaryFixedDim,
        equals(const Color(0xFFD9CAFF)),
      );
      expect(
        theme.colorScheme.onPrimaryFixedVariant,
        equals(const Color(0xFF260661)),
      );
      //
      expect(
        theme.colorScheme.secondaryFixed,
        equals(const Color(0xFFEEE4FE)),
      );
      expect(
        theme.colorScheme.onSecondaryFixed,
        equals(const Color(0xFF161023)),
      );
      expect(
        theme.colorScheme.secondaryFixedDim,
        equals(const Color(0xFFD7CDE7)),
      );
      expect(
        theme.colorScheme.onSecondaryFixedVariant,
        equals(const Color(0xFF221D2F)),
      );
      //
      expect(
        theme.colorScheme.tertiaryFixed,
        equals(const Color(0xFFFFE1E8)),
      );
      expect(
        theme.colorScheme.onTertiaryFixed,
        equals(const Color(0xFF270915)),
      );
      expect(
        theme.colorScheme.tertiaryFixedDim,
        equals(const Color(0xFFFAC3D3)),
      );
      expect(
        theme.colorScheme.onTertiaryFixedVariant,
        equals(const Color(0xFF361521)),
      );
    });
  });
  group('Test FlexColorScheme V8 features: FlexScaffoldBaseColor', () {
    test(
        'FCSV8:10L GIVEN a FlexScaffoldBaseColor using a ColorScheme light '
        'or defaults with with Brightness.light expect given styles.', () {
      final ColorScheme scheme = FlexColorScheme.dark(
        scheme: FlexScheme.sepia,
      ).toTheme.colorScheme;
      // Test FlexScaffoldBaseColor.lowestBase
      expect(
        FlexScaffoldBaseColor.lowestBase.color(null),
        equals(Colors.white),
      );
      expect(
        FlexScaffoldBaseColor.lowestBase.color(
          null,
          brightness: Brightness.light,
          useMaterial3: true,
        ),
        equals(Colors.white),
      );
      expect(
        FlexScaffoldBaseColor.lowestBase.color(
          null,
          brightness: Brightness.light,
          useMaterial3: false,
        ),
        equals(Colors.white),
      );
      expect(
        FlexScaffoldBaseColor.lowestBase.getName(true),
        equals('Lowest base (White)'),
      );
      // Test FlexScaffoldBaseColor.surface
      expect(
        FlexScaffoldBaseColor.surface.color(null),
        equals(FlexColor.lightFlexSurface),
      );
      expect(
        FlexScaffoldBaseColor.surface.color(
          null,
          brightness: Brightness.light,
          useMaterial3: true,
        ),
        equals(FlexColor.lightFlexSurface),
      );
      expect(
        FlexScaffoldBaseColor.surface.color(
          null,
          brightness: Brightness.light,
          useMaterial3: false,
        ),
        equals(FlexColor.materialLightScaffoldBackground),
      );
      expect(
        FlexScaffoldBaseColor.surface.color(scheme),
        equals(scheme.surface),
      );
      expect(
        FlexScaffoldBaseColor.surface.getName(true),
        equals('Surface'),
      );
      // Test FlexScaffoldBaseColor.surfaceDim
      expect(
        FlexScaffoldBaseColor.surfaceDim.color(null),
        equals(FlexColor.lightFlexSurfaceDim),
      );
      expect(
        FlexScaffoldBaseColor.surfaceDim.color(
          null,
          brightness: Brightness.light,
          useMaterial3: true,
        ),
        equals(FlexColor.lightFlexSurfaceDim),
      );
      expect(
        FlexScaffoldBaseColor.surfaceDim.color(
          null,
          brightness: Brightness.light,
          useMaterial3: false,
        ),
        equals(FlexColor.lightFlexSurfaceDim),
      );
      expect(
        FlexScaffoldBaseColor.surfaceDim.color(scheme),
        equals(scheme.surfaceDim),
      );
      expect(
        FlexScaffoldBaseColor.surfaceDim.getName(true),
        equals('Surface dim'),
      );
      // Test FlexScaffoldBaseColor.surfaceBright
      expect(
        FlexScaffoldBaseColor.surfaceBright.color(null),
        equals(FlexColor.lightFlexSurfaceBright),
      );
      expect(
        FlexScaffoldBaseColor.surfaceBright.color(
          null,
          brightness: Brightness.light,
          useMaterial3: true,
        ),
        equals(FlexColor.lightFlexSurfaceBright),
      );
      expect(
        FlexScaffoldBaseColor.surfaceBright.color(
          null,
          brightness: Brightness.light,
          useMaterial3: false,
        ),
        equals(FlexColor.lightFlexSurfaceBright),
      );
      expect(
        FlexScaffoldBaseColor.surfaceBright.color(scheme),
        equals(scheme.surfaceBright),
      );
      expect(
        FlexScaffoldBaseColor.surfaceBright.getName(true),
        equals('Surface bright'),
      );
      // Test FlexScaffoldBaseColor.surfaceContainerLowest
      expect(
        FlexScaffoldBaseColor.surfaceContainerLowest.color(null),
        equals(FlexColor.lightFlexSurfaceContainerLowest),
      );
      expect(
        FlexScaffoldBaseColor.surfaceContainerLowest.color(
          null,
          brightness: Brightness.light,
          useMaterial3: true,
        ),
        equals(FlexColor.lightFlexSurfaceContainerLowest),
      );
      expect(
        FlexScaffoldBaseColor.surfaceContainerLowest.color(
          null,
          brightness: Brightness.light,
          useMaterial3: false,
        ),
        equals(FlexColor.lightFlexSurfaceContainerLowest),
      );
      expect(
        FlexScaffoldBaseColor.surfaceContainerLowest.color(scheme),
        equals(scheme.surfaceContainerLowest),
      );
      expect(
        FlexScaffoldBaseColor.surfaceContainerLowest.getName(true),
        equals('Surface container lowest'),
      );
      // Test FlexScaffoldBaseColor.surfaceContainerLow
      expect(
        FlexScaffoldBaseColor.surfaceContainerLow.color(null),
        equals(FlexColor.lightFlexSurfaceContainerLow),
      );
      expect(
        FlexScaffoldBaseColor.surfaceContainerLow.color(
          null,
          brightness: Brightness.light,
          useMaterial3: true,
        ),
        equals(FlexColor.lightFlexSurfaceContainerLow),
      );
      expect(
        FlexScaffoldBaseColor.surfaceContainerLow.color(
          null,
          brightness: Brightness.light,
          useMaterial3: false,
        ),
        equals(FlexColor.lightFlexSurfaceContainerLow),
      );
      expect(
        FlexScaffoldBaseColor.surfaceContainerLow.color(scheme),
        equals(scheme.surfaceContainerLow),
      );
      expect(
        FlexScaffoldBaseColor.surfaceContainerLow.getName(true),
        equals('Surface container low'),
      );
      // Test FlexScaffoldBaseColor.surfaceContainer
      expect(
        FlexScaffoldBaseColor.surfaceContainer.color(null),
        equals(FlexColor.lightFlexSurfaceContainer),
      );
      expect(
        FlexScaffoldBaseColor.surfaceContainer.color(
          null,
          brightness: Brightness.light,
          useMaterial3: true,
        ),
        equals(FlexColor.lightFlexSurfaceContainer),
      );
      expect(
        FlexScaffoldBaseColor.surfaceContainer.color(
          null,
          brightness: Brightness.light,
          useMaterial3: false,
        ),
        equals(FlexColor.lightFlexSurfaceContainer),
      );
      expect(
        FlexScaffoldBaseColor.surfaceContainer.color(scheme),
        equals(scheme.surfaceContainer),
      );
      expect(
        FlexScaffoldBaseColor.surfaceContainer.getName(true),
        equals('Surface container'),
      );
      // Test FlexScaffoldBaseColor.surfaceContainerHigh
      expect(
        FlexScaffoldBaseColor.surfaceContainerHigh.color(null),
        equals(FlexColor.lightFlexSurfaceContainerHigh),
      );
      expect(
        FlexScaffoldBaseColor.surfaceContainerHigh.color(
          null,
          brightness: Brightness.light,
          useMaterial3: true,
        ),
        equals(FlexColor.lightFlexSurfaceContainerHigh),
      );
      expect(
        FlexScaffoldBaseColor.surfaceContainerHigh.color(
          null,
          brightness: Brightness.light,
          useMaterial3: false,
        ),
        equals(FlexColor.lightFlexSurfaceContainerHigh),
      );
      expect(
        FlexScaffoldBaseColor.surfaceContainerHigh.color(scheme),
        equals(scheme.surfaceContainerHigh),
      );
      expect(
        FlexScaffoldBaseColor.surfaceContainerHigh.getName(true),
        equals('Surface container high'),
      );
      // Test FlexScaffoldBaseColor.surfaceContainerHighest
      expect(
        FlexScaffoldBaseColor.surfaceContainerHighest.color(null),
        equals(FlexColor.lightFlexSurfaceContainerHighest),
      );
      expect(
        FlexScaffoldBaseColor.surfaceContainerHighest.color(
          null,
          brightness: Brightness.light,
          useMaterial3: true,
        ),
        equals(FlexColor.lightFlexSurfaceContainerHighest),
      );
      expect(
        FlexScaffoldBaseColor.surfaceContainerHighest.color(
          null,
          brightness: Brightness.light,
          useMaterial3: false,
        ),
        equals(FlexColor.lightFlexSurfaceContainerHighest),
      );
      expect(
        FlexScaffoldBaseColor.surfaceContainerHighest.color(scheme),
        equals(scheme.surfaceContainerHighest),
      );
      expect(
        FlexScaffoldBaseColor.surfaceContainerHighest.getName(true),
        equals('Surface container highest'),
      );
    });
    test(
        'FCSV8:10D GIVEN a FlexScaffoldBaseColor using a ColorScheme dark '
        'or defaults with with Brightness.dark expect given styles.', () {
      final ColorScheme scheme = FlexColorScheme.dark(
        scheme: FlexScheme.sepia,
      ).toTheme.colorScheme;
      // Test FlexScaffoldBaseColor.lowestBase
      expect(
        FlexScaffoldBaseColor.lowestBase
            .color(null, brightness: Brightness.dark),
        equals(Colors.black),
      );
      expect(
        FlexScaffoldBaseColor.lowestBase.color(
          null,
          brightness: Brightness.dark,
          useMaterial3: true,
        ),
        equals(Colors.black),
      );
      expect(
        FlexScaffoldBaseColor.lowestBase.color(
          null,
          brightness: Brightness.dark,
          useMaterial3: false,
        ),
        equals(Colors.black),
      );
      expect(
        FlexScaffoldBaseColor.lowestBase.getName(true),
        equals('Lowest base (White)'),
      );
      // Test FlexScaffoldBaseColor.surface
      expect(
        FlexScaffoldBaseColor.surface.color(null, brightness: Brightness.dark),
        equals(FlexColor.darkFlexSurface),
      );
      expect(
        FlexScaffoldBaseColor.surface.color(
          null,
          brightness: Brightness.dark,
          useMaterial3: true,
        ),
        equals(FlexColor.darkFlexSurface),
      );
      expect(
        FlexScaffoldBaseColor.surface.color(
          null,
          brightness: Brightness.dark,
          useMaterial3: false,
        ),
        equals(FlexColor.materialDarkScaffoldBackground),
      );
      expect(
        FlexScaffoldBaseColor.surface.color(scheme),
        equals(scheme.surface),
      );
      expect(
        FlexScaffoldBaseColor.surface.getName(true),
        equals('Surface'),
      );
      // Test FlexScaffoldBaseColor.surfaceDim
      expect(
        FlexScaffoldBaseColor.surfaceDim
            .color(null, brightness: Brightness.dark),
        equals(FlexColor.darkFlexSurfaceDim),
      );
      expect(
        FlexScaffoldBaseColor.surfaceDim.color(
          null,
          brightness: Brightness.dark,
          useMaterial3: true,
        ),
        equals(FlexColor.darkFlexSurfaceDim),
      );
      expect(
        FlexScaffoldBaseColor.surfaceDim.color(
          null,
          brightness: Brightness.dark,
          useMaterial3: false,
        ),
        equals(FlexColor.darkFlexSurfaceDim),
      );
      expect(
        FlexScaffoldBaseColor.surfaceDim.color(scheme),
        equals(scheme.surfaceDim),
      );
      expect(
        FlexScaffoldBaseColor.surfaceDim.getName(false),
        equals('Surface dim'),
      );
      // Test FlexScaffoldBaseColor.surfaceBright
      expect(
        FlexScaffoldBaseColor.surfaceBright
            .color(null, brightness: Brightness.dark),
        equals(FlexColor.darkFlexSurfaceBright),
      );
      expect(
        FlexScaffoldBaseColor.surfaceBright.color(
          null,
          brightness: Brightness.dark,
          useMaterial3: false,
        ),
        equals(FlexColor.darkFlexSurfaceBright),
      );
      expect(
        FlexScaffoldBaseColor.surfaceBright.color(
          null,
          brightness: Brightness.dark,
          useMaterial3: false,
        ),
        equals(FlexColor.darkFlexSurfaceBright),
      );
      expect(
        FlexScaffoldBaseColor.surfaceBright.color(scheme),
        equals(scheme.surfaceBright),
      );
      expect(
        FlexScaffoldBaseColor.surfaceBright.getName(false),
        equals('Surface bright'),
      );
      // Test FlexScaffoldBaseColor.surfaceContainerLowest
      expect(
        FlexScaffoldBaseColor.surfaceContainerLowest
            .color(null, brightness: Brightness.dark),
        equals(FlexColor.darkFlexSurfaceContainerLowest),
      );
      expect(
        FlexScaffoldBaseColor.surfaceContainerLowest.color(
          null,
          brightness: Brightness.dark,
          useMaterial3: false,
        ),
        equals(FlexColor.darkFlexSurfaceContainerLowest),
      );
      expect(
        FlexScaffoldBaseColor.surfaceContainerLowest.color(
          null,
          brightness: Brightness.dark,
          useMaterial3: false,
        ),
        equals(FlexColor.darkFlexSurfaceContainerLowest),
      );
      expect(
        FlexScaffoldBaseColor.surfaceContainerLowest.color(scheme),
        equals(scheme.surfaceContainerLowest),
      );
      expect(
        FlexScaffoldBaseColor.surfaceContainerLowest.getName(false),
        equals('Surface container lowest'),
      );
      // Test FlexScaffoldBaseColor.surfaceContainerLow
      expect(
        FlexScaffoldBaseColor.surfaceContainerLow
            .color(null, brightness: Brightness.dark),
        equals(FlexColor.darkFlexSurfaceContainerLow),
      );
      expect(
        FlexScaffoldBaseColor.surfaceContainerLow.color(
          null,
          brightness: Brightness.dark,
          useMaterial3: false,
        ),
        equals(FlexColor.darkFlexSurfaceContainerLow),
      );
      expect(
        FlexScaffoldBaseColor.surfaceContainerLow.color(
          null,
          brightness: Brightness.dark,
          useMaterial3: false,
        ),
        equals(FlexColor.darkFlexSurfaceContainerLow),
      );
      expect(
        FlexScaffoldBaseColor.surfaceContainerLow.color(scheme),
        equals(scheme.surfaceContainerLow),
      );
      expect(
        FlexScaffoldBaseColor.surfaceContainerLow.getName(false),
        equals('Surface container low'),
      );
      // Test FlexScaffoldBaseColor.surfaceContainer
      expect(
        FlexScaffoldBaseColor.surfaceContainer
            .color(null, brightness: Brightness.dark),
        equals(FlexColor.darkFlexSurfaceContainer),
      );
      expect(
        FlexScaffoldBaseColor.surfaceContainer.color(
          null,
          brightness: Brightness.dark,
          useMaterial3: false,
        ),
        equals(FlexColor.darkFlexSurfaceContainer),
      );
      expect(
        FlexScaffoldBaseColor.surfaceContainer.color(
          null,
          brightness: Brightness.dark,
          useMaterial3: false,
        ),
        equals(FlexColor.darkFlexSurfaceContainer),
      );
      expect(
        FlexScaffoldBaseColor.surfaceContainer.color(scheme),
        equals(scheme.surfaceContainer),
      );
      expect(
        FlexScaffoldBaseColor.surfaceContainer.getName(false),
        equals('Surface container'),
      );
      // Test FlexScaffoldBaseColor.surfaceContainerHigh
      expect(
        FlexScaffoldBaseColor.surfaceContainerHigh
            .color(null, brightness: Brightness.dark),
        equals(FlexColor.darkFlexSurfaceContainerHigh),
      );
      expect(
        FlexScaffoldBaseColor.surfaceContainerHigh.color(
          null,
          brightness: Brightness.dark,
          useMaterial3: false,
        ),
        equals(FlexColor.darkFlexSurfaceContainerHigh),
      );
      expect(
        FlexScaffoldBaseColor.surfaceContainerHigh.color(
          null,
          brightness: Brightness.dark,
          useMaterial3: false,
        ),
        equals(FlexColor.darkFlexSurfaceContainerHigh),
      );
      expect(
        FlexScaffoldBaseColor.surfaceContainerHigh.color(scheme),
        equals(scheme.surfaceContainerHigh),
      );
      expect(
        FlexScaffoldBaseColor.surfaceContainerHigh.getName(false),
        equals('Surface container high'),
      );
      // Test FlexScaffoldBaseColor.surfaceContainerHighest
      expect(
        FlexScaffoldBaseColor.surfaceContainerHighest
            .color(null, brightness: Brightness.dark),
        equals(FlexColor.darkFlexSurfaceContainerHighest),
      );
      expect(
        FlexScaffoldBaseColor.surfaceContainerHighest.color(
          null,
          brightness: Brightness.dark,
          useMaterial3: false,
        ),
        equals(FlexColor.darkFlexSurfaceContainerHighest),
      );
      expect(
        FlexScaffoldBaseColor.surfaceContainerHighest.color(
          null,
          brightness: Brightness.dark,
          useMaterial3: false,
        ),
        equals(FlexColor.darkFlexSurfaceContainerHighest),
      );
      expect(
        FlexScaffoldBaseColor.surfaceContainerHighest.color(scheme),
        equals(scheme.surfaceContainerHighest),
      );
      expect(
        FlexScaffoldBaseColor.surfaceContainerHighest.getName(false),
        equals('Surface container highest'),
      );
    });
  });
  group('Test FlexColorScheme V8 features: Error seed and scaffold color', () {
    test(
        'FCSV8:20L GIVEN a M3 FlexColorScheme.light sepia theme with custom '
        'error colors and keeping them expect given styles.', () {
      const Color error = Color(0xFFB73E11);
      const Color errorContainer = Color(0xFFDFA392);
      final FlexColorScheme fcs = FlexColorScheme.light(
        scheme: FlexScheme.sepia,
        error: error,
        errorContainer: errorContainer,
        fixedColorStyle: FlexFixedColorStyle.seededHighContrast,
        subThemesData: const FlexSubThemesData(
          interactionEffects: true,
          tintedDisabledControls: true,
          scaffoldBackgroundBaseColor: FlexScaffoldBaseColor.surfaceDim,
          useM2StyleDividerInM3: true,
          inputDecoratorIsFilled: true,
          inputDecoratorBorderType: FlexInputBorderType.outline,
          alignedDropdown: true,
          navigationRailUseIndicator: true,
          navigationRailLabelType: NavigationRailLabelType.all,
          appBarActionsIconSchemeColor: SchemeColor.tertiary,
          appBarIconSchemeColor: SchemeColor.tertiaryContainer,
        ),
        keyColors: const FlexKeyColors(
          useSecondary: true,
          useTertiary: true,
          useError: true,
          keyError: error,
          keepError: true,
          keepErrorContainer: true,
          useExpressiveOnContainerColors: true,
        ),
      );
      final ThemeData theme = fcs.toTheme;
      expect(
        theme.colorScheme.error,
        equals(error),
      );
      expect(
        theme.colorScheme.errorContainer,
        equals(errorContainer),
      );
      expect(
        theme.colorScheme.onPrimaryContainer,
        equals(const Color(0xFF554500)),
      );
      expect(
        theme.colorScheme.onSecondaryContainer,
        equals(const Color(0xFF54442A)),
      );
      expect(
        theme.colorScheme.onTertiaryContainer,
        equals(const Color(0xFF594319)),
      );
      expect(
        theme.scaffoldBackgroundColor,
        equals(theme.colorScheme.surfaceDim),
      );
      expect(
        theme.dialogBackgroundColor,
        equals(theme.colorScheme.surfaceContainerHigh),
      );
      expect(
        theme.disabledColor,
        equals(const Color(0x612C2505)),
      );
      expect(
        theme.hoverColor,
        equals(const Color(0x114E4009)),
      );
      expect(
        theme.focusColor,
        equals(const Color(0x1C4E4009)),
      );
      expect(
        theme.highlightColor,
        equals(const Color(0x0F483C08)),
      );
      expect(
        theme.splashColor,
        equals(const Color(0x10483C08)),
      );
      expect(
        theme.appBarTheme.actionsIconTheme!.color,
        equals(theme.colorScheme.tertiary),
      );
      expect(
        theme.appBarTheme.iconTheme!.color,
        equals(theme.colorScheme.tertiaryContainer),
      );
    });
    test(
        'FCSV8:20D GIVEN a M3 FlexColorScheme.dark sepia theme with custom '
        'error colors and keeping them expect given styles.', () {
      const Color error = Color(0xFFDFA392);
      const Color errorContainer = Color(0xFFB73E11);
      final FlexColorScheme fcs = FlexColorScheme.dark(
        scheme: FlexScheme.sepia,
        error: error,
        errorContainer: errorContainer,
        fixedColorStyle: FlexFixedColorStyle.seededHighContrast,
        subThemesData: const FlexSubThemesData(
          interactionEffects: true,
          tintedDisabledControls: true,
          scaffoldBackgroundBaseColor: FlexScaffoldBaseColor.surfaceBright,
          useM2StyleDividerInM3: true,
          inputDecoratorIsFilled: true,
          inputDecoratorBorderType: FlexInputBorderType.outline,
          alignedDropdown: true,
          navigationRailUseIndicator: true,
          navigationRailLabelType: NavigationRailLabelType.all,
          appBarActionsIconSchemeColor: SchemeColor.primary,
          appBarIconSchemeColor: SchemeColor.secondary,
        ),
        keyColors: const FlexKeyColors(
          useSecondary: true,
          useTertiary: true,
          useError: true,
          keyError: error,
          keepError: true,
          keepErrorContainer: true,
          useExpressiveOnContainerColors: true,
        ),
      );
      final ThemeData theme = fcs.toTheme;
      expect(
        theme.colorScheme.error,
        equals(error),
      );
      expect(
        theme.colorScheme.errorContainer,
        equals(errorContainer),
      );
      expect(
        theme.colorScheme.onPrimaryContainer,
        equals(const Color(0xFFFCE186)),
      );
      expect(
        theme.colorScheme.onSecondaryContainer,
        equals(const Color(0xFFF8DFBB)),
      );
      expect(
        theme.colorScheme.onTertiaryContainer,
        equals(const Color(0xFFFFDEA8)),
      );
      expect(
        theme.scaffoldBackgroundColor,
        equals(theme.colorScheme.surfaceBright),
      );
      expect(
        theme.dialogBackgroundColor,
        equals(theme.colorScheme.surfaceContainerHigh),
      );
      expect(
        theme.disabledColor,
        equals(const Color(0x61F1E7C5)),
      );
      expect(
        theme.hoverColor,
        equals(const Color(0x11E7D699)),
      );
      expect(
        theme.focusColor,
        equals(const Color(0x1CE7D699)),
      );
      expect(
        theme.highlightColor,
        equals(const Color(0x0FE9D9A1)),
      );
      expect(
        theme.splashColor,
        equals(const Color(0x10E9D9A1)),
      );
      expect(
        theme.appBarTheme.actionsIconTheme!.color,
        equals(theme.colorScheme.primary),
      );
      expect(
        theme.appBarTheme.iconTheme!.color,
        equals(theme.colorScheme.secondary),
      );
    });
    test(
        'FCSV8:21L GIVEN a M2 FlexColorScheme.light sepia theme with seeds '
        'expect given styles.', () {
      const Color tertiary = Color(0xFF565656);
      final FlexColorScheme fcs = FlexColorScheme.light(
        useMaterial3: false,
        scheme: FlexScheme.sepia,
        tertiary: tertiary,
        fixedColorStyle: FlexFixedColorStyle.seededHighContrast,
        subThemesData: const FlexSubThemesData(
          interactionEffects: true,
          tintedDisabledControls: true,
          scaffoldBackgroundBaseColor: FlexScaffoldBaseColor.surfaceDim,
          scaffoldBackgroundSchemeColor: SchemeColor.white,
          useM2StyleDividerInM3: true,
          inputDecoratorIsFilled: true,
          inputDecoratorBorderType: FlexInputBorderType.outline,
          alignedDropdown: true,
        ),
        keyColors: const FlexKeyColors(
          useSecondary: true,
          useTertiary: true,
          useError: true,
          keyTertiary: tertiary,
          useLegacyMonochromeSeedBehavior: true,
        ),
      );
      final ThemeData theme = fcs.toTheme;
      expect(
        theme.colorScheme.tertiary,
        equals(const Color(0xFF39656C)),
      );
      expect(
        theme.scaffoldBackgroundColor,
        equals(Colors.white),
      );
      expect(
        theme.dialogBackgroundColor,
        equals(theme.colorScheme.surface),
      );
    });
    test(
        'FCSV8:21D GIVEN a M2 FlexColorScheme.dark sepia theme with seeds '
        'expect given styles.', () {
      const Color tertiary = Color(0xFF565656);
      final FlexColorScheme fcs = FlexColorScheme.dark(
        useMaterial3: false,
        scheme: FlexScheme.sepia,
        tertiary: tertiary,
        fixedColorStyle: FlexFixedColorStyle.seededHighContrast,
        subThemesData: const FlexSubThemesData(
          interactionEffects: true,
          tintedDisabledControls: true,
          scaffoldBackgroundBaseColor: FlexScaffoldBaseColor.surfaceDim,
          scaffoldBackgroundSchemeColor: SchemeColor.surfaceContainerLow,
          useM2StyleDividerInM3: true,
          inputDecoratorIsFilled: true,
          inputDecoratorBorderType: FlexInputBorderType.outline,
          alignedDropdown: true,
        ),
        keyColors: const FlexKeyColors(
          useSecondary: true,
          useTertiary: true,
          useError: true,
          keyTertiary: tertiary,
          useLegacyMonochromeSeedBehavior: true,
        ),
      );
      final ThemeData theme = fcs.toTheme;
      expect(
        theme.colorScheme.tertiary,
        equals(const Color(0xFFA1CED6)),
      );
      expect(
        theme.scaffoldBackgroundColor,
        equals(theme.colorScheme.surfaceContainerLow),
      );
      expect(
        theme.dialogBackgroundColor,
        equals(theme.colorScheme.surface),
      );
    });
    test(
        'FCSV8:22L GIVEN a M2 FlexColorScheme.light custom colors theme with  '
        'and keeping expect given styles.', () {
      final FlexColorScheme fcs = FlexColorScheme.light(
        useMaterial3: false,
        colors: const FlexSchemeColor(
          primary: FlexColor.indigoM3LightPrimary,
          primaryContainer: FlexColor.indigoM3LightPrimaryContainer,
          secondary: FlexColor.indigoM3LightSecondary,
          secondaryContainer: FlexColor.indigoM3LightSecondaryContainer,
          tertiary: FlexColor.indigoM3LightTertiary,
          tertiaryContainer: FlexColor.indigoM3LightTertiaryContainer,
          appBarColor: FlexColor.indigoM3LightTertiary,
          error: FlexColor.material3LightError,
          errorContainer: FlexColor.material3LightErrorContainer,
        ),
        subThemesData: const FlexSubThemesData(
          interactionEffects: true,
          tintedDisabledControls: true,
          useM2StyleDividerInM3: true,
          inputDecoratorIsFilled: true,
        ),
        keyColors: const FlexKeyColors(
          useSecondary: true,
          useTertiary: true,
          useError: true,
        ),
      );
      final ThemeData theme = fcs.toTheme;
      expect(
        theme.scaffoldBackgroundColor,
        equals(theme.colorScheme.surface),
      );
      expect(
        theme.dialogBackgroundColor,
        equals(theme.colorScheme.surface),
      );
    });
    test(
        'FCSV8:22D GIVEN a M2 FlexColorScheme.dark custom colors theme with  '
        'and keeping expect given styles.', () {
      final FlexColorScheme fcs = FlexColorScheme.dark(
        useMaterial3: false,
        colors: const FlexSchemeColor(
          primary: FlexColor.indigoM3DarkPrimary,
          primaryContainer: FlexColor.indigoM3DarkPrimaryContainer,
          secondary: FlexColor.indigoM3DarkSecondary,
          secondaryContainer: FlexColor.indigoM3DarkSecondaryContainer,
          tertiary: FlexColor.indigoM3DarkTertiary,
          tertiaryContainer: FlexColor.indigoM3DarkTertiaryContainer,
          appBarColor: FlexColor.indigoM3DarkTertiary,
          error: FlexColor.material3DarkError,
          errorContainer: FlexColor.material3DarkErrorContainer,
        ),
        subThemesData: const FlexSubThemesData(
          interactionEffects: true,
          tintedDisabledControls: true,
          useM2StyleDividerInM3: true,
          inputDecoratorIsFilled: true,
        ),
        keyColors: const FlexKeyColors(
          useSecondary: true,
          useTertiary: true,
          useError: true,
        ),
      );
      final ThemeData theme = fcs.toTheme;
      expect(
        theme.colorScheme.primary,
        equals(const Color(0xffbac3ff)),
      );
      expect(
        theme.scaffoldBackgroundColor,
        equals(theme.colorScheme.surface),
      );
      expect(
        theme.dialogBackgroundColor,
        equals(theme.colorScheme.surface),
      );
    });
    test(
        'FCSV8:23L GIVEN a M2 FlexColorScheme.light sepia theme with seeds '
        'expect given styles.', () {
      final FlexColorScheme fcs = FlexColorScheme.light(
        useMaterial3: false,
        scheme: FlexScheme.sepia,
        fixedColorStyle: FlexFixedColorStyle.seededHighContrast,
        tabBarStyle: FlexTabBarStyle.flutterDefault,
        subThemesData: const FlexSubThemesData(
          appBarForegroundSchemeColor: SchemeColor.tertiary,
          adaptiveInputDecoratorRadius: FlexAdaptive.all(),
          inputDecoratorRadius: 10,
          inputDecoratorRadiusAdaptive: 15,
          inputDecoratorBorderType: FlexInputBorderType.outline,
        ),
        keyColors: const FlexKeyColors(),
      );
      final ThemeData theme = fcs.toTheme;
      expect(
        theme.appBarTheme.foregroundColor,
        equals(theme.colorScheme.tertiary),
      );
      expect(
        theme.tabBarTheme.unselectedLabelColor,
        equals(const Color(0xb2ffffff)),
      );
      final OutlineInputBorder border = (theme.inputDecorationTheme.border!
              as MaterialStateOutlineInputBorder?)!
          .resolve(<WidgetState>{}) as OutlineInputBorder;
      expect(
        border.borderRadius.bottomLeft,
        equals(const Radius.circular(15.0)),
      );
    });
    test(
        'FCSV8:23D GIVEN a M2 FlexColorScheme.dark sepia theme with seeds '
        'expect given styles.', () {
      final FlexColorScheme fcs = FlexColorScheme.light(
        useMaterial3: false,
        scheme: FlexScheme.sepia,
        fixedColorStyle: FlexFixedColorStyle.seededHighContrast,
        tabBarStyle: FlexTabBarStyle.flutterDefault,
        subThemesData: const FlexSubThemesData(
          appBarForegroundSchemeColor: SchemeColor.tertiary,
          adaptiveInputDecoratorRadius: FlexAdaptive.all(),
          inputDecoratorRadius: 10,
          inputDecoratorRadiusAdaptive: 15,
          inputDecoratorBorderType: FlexInputBorderType.outline,
        ),
        keyColors: const FlexKeyColors(),
      );
      final ThemeData theme = fcs.toTheme;
      expect(
        theme.appBarTheme.foregroundColor,
        equals(theme.colorScheme.tertiary),
      );
      expect(
        theme.tabBarTheme.unselectedLabelColor,
        equals(const Color(0xb2ffffff)),
      );
      final OutlineInputBorder border = (theme.inputDecorationTheme.border!
              as MaterialStateOutlineInputBorder?)!
          .resolve(<WidgetState>{}) as OutlineInputBorder;
      expect(
        border.borderRadius.bottomLeft,
        equals(const Radius.circular(15.0)),
      );
    });
    test(
        'FCSV8:24L GIVEN a M3 FlexColorScheme.light blackWhite theme with '
        'seeds tab bar opacity '
        'expect given styles.', () {
      final FlexColorScheme fcs = FlexColorScheme.light(
        scheme: FlexScheme.blackWhite,
        fixedColorStyle: FlexFixedColorStyle.seededHighContrast,
        tabBarStyle: FlexTabBarStyle.flutterDefault,
        subThemesData: const FlexSubThemesData(
          appBarForegroundSchemeColor: SchemeColor.tertiary,
          adaptiveRadius: FlexAdaptive.all(),
          defaultRadiusAdaptive: 14,
          defaultRadius: 16,
          adaptiveInputDecoratorRadius: FlexAdaptive.off(),
          inputDecoratorRadius: 10,
          inputDecoratorRadiusAdaptive: 15,
          inputDecoratorBorderType: FlexInputBorderType.outline,
          tabBarUnselectedItemOpacity: 0.9,
        ),
        keyColors: const FlexKeyColors(),
      );
      final ThemeData theme = fcs.toTheme;
      expect(
        theme.appBarTheme.foregroundColor,
        equals(theme.colorScheme.tertiary),
      );
      expect(
        theme.tabBarTheme.unselectedLabelColor,
        equals(const Color(0xe61b1b1b)),
      );
      final OutlineInputBorder border = (theme.inputDecorationTheme.border!
              as MaterialStateOutlineInputBorder?)!
          .resolve(<WidgetState>{}) as OutlineInputBorder;
      expect(
        border.borderRadius.bottomLeft,
        equals(const Radius.circular(10.0)),
      );
    });
  });
}
