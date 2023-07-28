import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // These tests are really for the Flutter SDK gap in the
  // ElevationOverlay.applyOverlay function. See issue:
  // https://github.com/flutter/flutter/issues/90353
  // For more information. Tests are added here to cover them usage gap to
  // see if it might change one day.

  group('Test ElevationOverlay.applyOverlay', () {
    late BuildContext savedContext;
    Widget testApp(
      ThemeMode themeMode,
      ThemeData lightTheme,
      ThemeData darkTheme,
    ) {
      return MaterialApp(
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: themeMode,
        home: Builder(
          builder: (BuildContext context) {
            savedContext = context;
            return Container();
          },
        ),
      );
    }

    ThemeData lightTheme(int surfaceBlend, int backgroundBlend) =>
        ThemeData.from(
          colorScheme: ColorScheme.light(
            surface: Color.alphaBlend(
                const ColorScheme.light().primary.withAlpha(surfaceBlend),
                const ColorScheme.light().surface),
            background: Color.alphaBlend(
                const ColorScheme.light().primary.withAlpha(backgroundBlend),
                const ColorScheme.light().background),
          ),
        );

    ThemeData darkTheme(int surfaceBlend, int backgroundBlend) =>
        ThemeData.from(
          colorScheme: ColorScheme.dark(
            surface: Color.alphaBlend(
                const ColorScheme.dark().primary.withAlpha(surfaceBlend),
                const ColorScheme.dark().surface),
            background: Color.alphaBlend(
                const ColorScheme.dark().primary.withAlpha(backgroundBlend),
                const ColorScheme.dark().background),
          ),
        );

    testWidgets(
        'A) Expect no overlay in light ThemeData.from() with default '
        'background and surface colors.', (WidgetTester tester) async {
      // Default and equal surface and background colors.
      final ThemeData light = lightTheme(0x00, 0x00);
      final ThemeData dark = darkTheme(0x00, 0x00);

      await tester.pumpWidget(testApp(ThemeMode.light, light, dark));

      final Color surface = Theme.of(savedContext).colorScheme.surface;
      final Color background = Theme.of(savedContext).colorScheme.background;

      // EXPECT: no elevation overlay color for none elevated surface.
      expect(surface,
          equals(ElevationOverlay.applyOverlay(savedContext, surface, 0)));
      // EXPECT: no elevation overlay color for elevated surface.
      expect(surface,
          equals(ElevationOverlay.applyOverlay(savedContext, surface, 1)));

      // EXPECT: no elevation overlay color for none elevated background.
      expect(background,
          equals(ElevationOverlay.applyOverlay(savedContext, background, 0)));
      // EXPECT: no elevation overlay color for elevated background.
      expect(background,
          equals(ElevationOverlay.applyOverlay(savedContext, background, 1)));
    });

    testWidgets(
        'B) Expect no overlay in light ThemeData.from() with background '
        'and surface colors using same none default color.',
        (WidgetTester tester) async {
      // None default surface and background colors, but equal.
      final ThemeData light = lightTheme(0x10, 0x10);
      final ThemeData dark = darkTheme(0x10, 0x10);

      await tester.pumpWidget(testApp(ThemeMode.light, light, dark));

      final Color surface = Theme.of(savedContext).colorScheme.surface;
      final Color background = Theme.of(savedContext).colorScheme.background;

      // EXPECT: no elevation overlay color for none elevated surface.
      expect(surface,
          equals(ElevationOverlay.applyOverlay(savedContext, surface, 0)));
      // EXPECT: no elevation overlay color for elevated surface.
      expect(surface,
          equals(ElevationOverlay.applyOverlay(savedContext, surface, 1)));

      // EXPECT: no elevation overlay color for none elevated background.
      expect(background,
          equals(ElevationOverlay.applyOverlay(savedContext, background, 0)));
      // EXPECT: no elevation overlay color for elevated background.
      expect(background,
          equals(ElevationOverlay.applyOverlay(savedContext, background, 1)));
    });

    testWidgets(
        'C) Expect no overlay in light ThemeData.from() with background '
        'and surface colors using different none default color.',
        (WidgetTester tester) async {
      // None default and not equal surface and background colors.
      final ThemeData light = lightTheme(0x10, 0x20);
      final ThemeData dark = darkTheme(0x10, 0x20);

      await tester.pumpWidget(testApp(ThemeMode.light, light, dark));

      final Color surface = Theme.of(savedContext).colorScheme.surface;
      final Color background = Theme.of(savedContext).colorScheme.background;

      // EXPECT: no elevation overlay color for none elevated surface.
      expect(surface,
          equals(ElevationOverlay.applyOverlay(savedContext, surface, 0)));
      // EXPECT: no elevation overlay color for elevated surface.
      expect(surface,
          equals(ElevationOverlay.applyOverlay(savedContext, surface, 1)));

      // EXPECT: no elevation overlay color for none elevated background.
      expect(background,
          equals(ElevationOverlay.applyOverlay(savedContext, background, 0)));
      // EXPECT: no elevation overlay color for elevated background.
      expect(background,
          equals(ElevationOverlay.applyOverlay(savedContext, background, 1)));
    });

    testWidgets(
        'D) Expect overlay in dark ThemeData.from() with default background '
        'and surface colors, when elevation > 0.', (WidgetTester tester) async {
      // Default and equal surface and background colors.
      final ThemeData light = lightTheme(0x00, 0x00);
      final ThemeData dark = darkTheme(0x00, 0x00);

      await tester.pumpWidget(testApp(ThemeMode.dark, light, dark));

      final Color surface = Theme.of(savedContext).colorScheme.surface;
      final Color background = Theme.of(savedContext).colorScheme.background;

      // EXPECT: no elevation overlay color for none elevated surface.
      expect(surface,
          equals(ElevationOverlay.applyOverlay(savedContext, surface, 0)));
      // EXPECT: elevation overlay color for elevated surface.
      expect(surface,
          isNot(ElevationOverlay.applyOverlay(savedContext, surface, 1)));

      // EXPECT: no elevation overlay color for none elevated background.
      expect(background,
          equals(ElevationOverlay.applyOverlay(savedContext, background, 0)));
      // EXPECT: elevation overlay color for elevated background.
      expect(background,
          isNot(ElevationOverlay.applyOverlay(savedContext, background, 1)));
    });

    testWidgets(
        'E) Expect overlay in dark ThemeData.from() with background and '
        'surface colors using same none default color, when elevation > 0.',
        (WidgetTester tester) async {
      // None default surface and background colors, but equal.
      final ThemeData light = lightTheme(0x10, 0x10);
      final ThemeData dark = darkTheme(0x10, 0x10);

      await tester.pumpWidget(testApp(ThemeMode.dark, light, dark));

      final Color surface = Theme.of(savedContext).colorScheme.surface;
      final Color background = Theme.of(savedContext).colorScheme.background;

      // EXPECT: no elevation overlay color for none elevated surface.
      expect(surface,
          equals(ElevationOverlay.applyOverlay(savedContext, surface, 0)));
      // EXPECT: elevation overlay color for elevated surface.
      expect(surface,
          isNot(ElevationOverlay.applyOverlay(savedContext, surface, 1)));

      // EXPECT: no elevation overlay color for none elevated background.
      expect(background,
          equals(ElevationOverlay.applyOverlay(savedContext, background, 0)));
      // EXPECT: elevation overlay color for elevated background.
      expect(background,
          isNot(ElevationOverlay.applyOverlay(savedContext, background, 1)));
    });

    testWidgets(
        'F1) Expect NO overlay in dark ThemeData.from() on background and '
        'surface colors using separate and none default color, when '
        'elevation = 0.', (WidgetTester tester) async {
      // None default and not equal surface and background colors.
      final ThemeData light = lightTheme(0x10, 0x20);
      final ThemeData dark = darkTheme(0x10, 0x20);

      await tester.pumpWidget(testApp(ThemeMode.dark, light, dark));

      final Color surface = Theme.of(savedContext).colorScheme.surface;
      final Color background = Theme.of(savedContext).colorScheme.background;

      // EXPECT: no elevation overlay color for none elevated surface.
      expect(surface,
          equals(ElevationOverlay.applyOverlay(savedContext, surface, 0)));

      // EXPECT: no elevation overlay color for none elevated background.
      expect(background,
          equals(ElevationOverlay.applyOverlay(savedContext, background, 0)));
    });

    testWidgets(
        'F2) Expect *NO* overlay in dark ThemeData.from() on background, when '
        'different from surface color and using separate and none default '
        'color, when elevation > 0. '
        'THIS IS REVERSE EXPECTATION: '
        'WE WOULD EXPECT ELEVATION ON THIS AND THIS TEST TO FAIL!',
        (WidgetTester tester) async {
      // None default and not equal surface and background colors.
      final ThemeData light = lightTheme(0x10, 0x20);
      final ThemeData dark = darkTheme(0x10, 0x20);

      await tester.pumpWidget(testApp(ThemeMode.dark, light, dark));

      final Color surface = Theme.of(savedContext).colorScheme.surface;
      final Color background = Theme.of(savedContext).colorScheme.background;

      // EXPECT: elevation overlay color for elevated surface.
      expect(surface,
          isNot(ElevationOverlay.applyOverlay(savedContext, surface, 1)));

      // EXPECT: **NO** elevation overlay color for elevated background.
      // We would ACTUALLY WANT  THIS TO FAIL, this is reverse failed test
      // Based on HOW SDK currently behaves.
      // See issue: https://github.com/flutter/flutter/issues/90353
      expect(background,
          equals(ElevationOverlay.applyOverlay(savedContext, background, 1)));
    });

    testWidgets(
        'G1) Expect **NO** overlay in dark ThemeData() on background and '
        'surface colors when using default ThemeData() factory with '
        'applyElevationOverlayColor = true and elevation = 0.',
        (WidgetTester tester) async {
      // Light and dark theme data made using
      // ThemeData(applyElevationOverlayColor: true) factory.
      final ThemeData light = ThemeData(applyElevationOverlayColor: true);
      final ThemeData dark = ThemeData(
        brightness: Brightness.dark,
        applyElevationOverlayColor: true,
      );

      await tester.pumpWidget(testApp(ThemeMode.dark, light, dark));

      final Color surface = Theme.of(savedContext).colorScheme.surface;
      final Color background = Theme.of(savedContext).colorScheme.background;

      // EXPECT: no elevation overlay color for none elevated surface.
      expect(surface,
          equals(ElevationOverlay.applyOverlay(savedContext, surface, 0)));

      // EXPECT: no elevation overlay color for none elevated background.
      expect(background,
          equals(ElevationOverlay.applyOverlay(savedContext, background, 0)));
    });

    testWidgets(
        'G2) Expect *NO* overlay in dark ThemeData() on background, when '
        'surface color when uses different color with default ThemeData() '
        'factory with: applyElevationOverlayColor = true and elevation > 0. '
        'THIS IS REVERSE EXPECTATION: WE WOULD EXPECT ELEVATION ON THIS '
        'AND THIS TEST TO FAIL!', (WidgetTester tester) async {
      // Light and dark theme data made using
      // ThemeData(applyElevationOverlayColor: true) factory.
      final ThemeData light = ThemeData(applyElevationOverlayColor: true);
      final ThemeData dark = ThemeData(
        brightness: Brightness.dark,
        applyElevationOverlayColor: true,
        useMaterial3: false,
      );

      await tester.pumpWidget(testApp(ThemeMode.dark, light, dark));

      final Color surface = Theme.of(savedContext).colorScheme.surface;
      final Color background = Theme.of(savedContext).colorScheme.background;

      // EXPECT: elevation overlay color for elevated surface.
      expect(surface,
          isNot(ElevationOverlay.applyOverlay(savedContext, surface, 1)));

      // EXPECT: **NO** elevation overlay color for elevated background.
      // We would ACTUALLY WANT  THIS TO FAIL, this is reverse failed test
      // Based on HOW SDK currently behaves.
      // See issue: https://github.com/flutter/flutter/issues/90353
      expect(background,
          equals(ElevationOverlay.applyOverlay(savedContext, background, 1)));
    });
  });
}
