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

    ThemeData lightTheme(int blend) => ThemeData.from(
          colorScheme: ColorScheme.light(
            surfaceContainer: Color.alphaBlend(
                const ColorScheme.light().primary.withAlpha(blend),
                const ColorScheme.light().surface),
          ),
          useMaterial3: false,
        );

    ThemeData darkTheme(int blend) => ThemeData.from(
          colorScheme: ColorScheme.dark(
            surfaceContainer: Color.alphaBlend(
                const ColorScheme.dark().primary.withAlpha(blend),
                const ColorScheme.dark().surface),
          ),
          useMaterial3: false,
        );

    testWidgets(
        'A) Expect no overlay in light ThemeData.from() with default '
        'container and surface colors.', (WidgetTester tester) async {
      // Default and equal surface and container colors.
      final ThemeData light = lightTheme(0x00);
      final ThemeData dark = darkTheme(0x00);

      await tester.pumpWidget(testApp(ThemeMode.light, light, dark));

      final Color surface = Theme.of(savedContext).colorScheme.surface;
      final Color container =
          Theme.of(savedContext).colorScheme.surfaceContainer;

      // EXPECT: no elevation overlay color for none elevated surface.
      expect(surface,
          equals(ElevationOverlay.applyOverlay(savedContext, surface, 0)));
      // EXPECT: no elevation overlay color for elevated surface.
      expect(surface,
          equals(ElevationOverlay.applyOverlay(savedContext, surface, 1)));

      // EXPECT: no elevation overlay color for none elevated container.
      expect(container,
          equals(ElevationOverlay.applyOverlay(savedContext, container, 0)));
      // EXPECT: no elevation overlay color for elevated container.
      expect(container,
          equals(ElevationOverlay.applyOverlay(savedContext, container, 1)));
    });

    testWidgets(
        'B) Expect no overlay in light ThemeData.from() with container '
        'and surface colors using same none default color.',
        (WidgetTester tester) async {
      // None default surface and container colors, but equal.
      final ThemeData light = lightTheme(0x10);
      final ThemeData dark = darkTheme(0x10);

      await tester.pumpWidget(testApp(ThemeMode.light, light, dark));

      final Color surface = Theme.of(savedContext).colorScheme.surface;
      final Color container = Theme.of(savedContext).colorScheme.surface;

      // EXPECT: no elevation overlay color for none elevated surface.
      expect(surface,
          equals(ElevationOverlay.applyOverlay(savedContext, surface, 0)));
      // EXPECT: no elevation overlay color for elevated surface.
      expect(surface,
          equals(ElevationOverlay.applyOverlay(savedContext, surface, 1)));

      // EXPECT: no elevation overlay color for none elevated container.
      expect(container,
          equals(ElevationOverlay.applyOverlay(savedContext, container, 0)));
      // EXPECT: no elevation overlay color for elevated container.
      expect(container,
          equals(ElevationOverlay.applyOverlay(savedContext, container, 1)));
    });

    testWidgets(
        'C) Expect no overlay in light ThemeData.from() with container '
        'and surface colors using different none default color.',
        (WidgetTester tester) async {
      // None default and not equal surface and container colors.
      final ThemeData light = lightTheme(0x10);
      final ThemeData dark = darkTheme(0x10);

      await tester.pumpWidget(testApp(ThemeMode.light, light, dark));

      final Color surface = Theme.of(savedContext).colorScheme.surface;
      final Color container = Theme.of(savedContext).colorScheme.surface;

      // EXPECT: no elevation overlay color for none elevated surface.
      expect(surface,
          equals(ElevationOverlay.applyOverlay(savedContext, surface, 0)));
      // EXPECT: no elevation overlay color for elevated surface.
      expect(surface,
          equals(ElevationOverlay.applyOverlay(savedContext, surface, 1)));

      // EXPECT: no elevation overlay color for none elevated container.
      expect(container,
          equals(ElevationOverlay.applyOverlay(savedContext, container, 0)));
      // EXPECT: no elevation overlay color for elevated container.
      expect(container,
          equals(ElevationOverlay.applyOverlay(savedContext, container, 1)));
    });

    testWidgets(
        'D) Expect overlay in dark ThemeData.from() with default container '
        'and surface colors, when elevation > 0.', (WidgetTester tester) async {
      // Default and equal surface and container colors.
      final ThemeData light = lightTheme(0x00);
      final ThemeData dark = darkTheme(0x00);

      await tester.pumpWidget(testApp(ThemeMode.dark, light, dark));

      final Color surface = Theme.of(savedContext).colorScheme.surface;
      final Color container = Theme.of(savedContext).colorScheme.surface;

      // EXPECT: no elevation overlay color for none elevated surface.
      expect(surface,
          equals(ElevationOverlay.applyOverlay(savedContext, surface, 0)));
      // EXPECT: elevation overlay color for elevated surface.
      expect(surface,
          isNot(ElevationOverlay.applyOverlay(savedContext, surface, 1)));

      // EXPECT: no elevation overlay color for none elevated container.
      expect(container,
          equals(ElevationOverlay.applyOverlay(savedContext, container, 0)));
      // EXPECT: elevation overlay color for elevated container.
      expect(container,
          isNot(ElevationOverlay.applyOverlay(savedContext, container, 1)));
    });

    testWidgets(
        'E) Expect overlay in dark ThemeData.from() with container and '
        'surface colors using same none default color, when elevation > 0.',
        (WidgetTester tester) async {
      // None default surface and container colors, but equal.
      final ThemeData light = lightTheme(0x10);
      final ThemeData dark = darkTheme(0x10);

      await tester.pumpWidget(testApp(ThemeMode.dark, light, dark));

      final Color surface = Theme.of(savedContext).colorScheme.surface;
      final Color container = Theme.of(savedContext).colorScheme.surface;

      // EXPECT: no elevation overlay color for none elevated surface.
      expect(surface,
          equals(ElevationOverlay.applyOverlay(savedContext, surface, 0)));
      // EXPECT: elevation overlay color for elevated surface.
      expect(surface,
          isNot(ElevationOverlay.applyOverlay(savedContext, surface, 1)));

      // EXPECT: no elevation overlay color for none elevated container.
      expect(container,
          equals(ElevationOverlay.applyOverlay(savedContext, container, 0)));
      // EXPECT: elevation overlay color for elevated container.
      expect(container,
          isNot(ElevationOverlay.applyOverlay(savedContext, container, 1)));
    });

    testWidgets(
        'F1) Expect NO overlay in dark ThemeData.from() on container and '
        'surface colors using separate and none default color, when '
        'elevation = 0.', (WidgetTester tester) async {
      // None default and not equal surface and container colors.
      final ThemeData light = lightTheme(0x10);
      final ThemeData dark = darkTheme(0x10);

      await tester.pumpWidget(testApp(ThemeMode.dark, light, dark));

      final Color surface = Theme.of(savedContext).colorScheme.surface;
      final Color container = Theme.of(savedContext).colorScheme.surface;

      // EXPECT: no elevation overlay color for none elevated surface.
      expect(surface,
          equals(ElevationOverlay.applyOverlay(savedContext, surface, 0)));

      // EXPECT: no elevation overlay color for none elevated container.
      expect(container,
          equals(ElevationOverlay.applyOverlay(savedContext, container, 0)));
    });

    testWidgets(
        'F2) Expect *NO* overlay in dark ThemeData.from() on surfaceContainer, '
        'when different from surface color and using separate and none default '
        'color, when elevation > 0. '
        'THIS IS REVERSE EXPECTATION: '
        'WE WOULD EXPECT ELEVATION ON THIS AND THIS TEST TO FAIL!',
        (WidgetTester tester) async {
      // None default and not equal surface and container colors.
      final ThemeData light = lightTheme(0x10);
      final ThemeData dark = darkTheme(0x10);

      await tester.pumpWidget(testApp(ThemeMode.dark, light, dark));

      final Color surface = Theme.of(savedContext).colorScheme.surface;
      final Color container =
          Theme.of(savedContext).colorScheme.surfaceContainer;

      // EXPECT: elevation overlay color for elevated surface.
      expect(surface,
          isNot(ElevationOverlay.applyOverlay(savedContext, surface, 1)));

      // EXPECT: **NO** elevation overlay color for elevated surface container.
      // We would ACTUALLY WANT  THIS TO FAIL, this is reverse failed test
      // Based on HOW SDK currently behaves.
      // See issue: https://github.com/flutter/flutter/issues/90353
      expect(container,
          equals(ElevationOverlay.applyOverlay(savedContext, container, 1)));
    });

    testWidgets(
        'G1) Expect **NO** overlay in dark ThemeData() on container and '
        'surface colors when using default ThemeData() factory with '
        'applyElevationOverlayColor = true and elevation = 0.',
        (WidgetTester tester) async {
      // Light and dark theme data made using
      // ThemeData(applyElevationOverlayColor: true) factory.
      final ThemeData light = ThemeData(
        applyElevationOverlayColor: true,
        useMaterial3: false,
      );
      final ThemeData dark = ThemeData(
        brightness: Brightness.dark,
        applyElevationOverlayColor: true,
        useMaterial3: false,
      );

      await tester.pumpWidget(testApp(ThemeMode.dark, light, dark));

      final Color surface = Theme.of(savedContext).colorScheme.surface;
      final Color container = Theme.of(savedContext).colorScheme.surface;

      // EXPECT: no elevation overlay color for none elevated surface.
      expect(surface,
          equals(ElevationOverlay.applyOverlay(savedContext, surface, 0)));

      // EXPECT: no elevation overlay color for none elevated container.
      expect(container,
          equals(ElevationOverlay.applyOverlay(savedContext, container, 0)));
    });

    testWidgets(
        'G2) Expect *NO* overlay in dark ThemeData() on container, when '
        'surface color when uses different color with default ThemeData() '
        'factory with: applyElevationOverlayColor = true and elevation > 0. '
        'THIS IS REVERSE EXPECTATION: WE WOULD EXPECT ELEVATION ON THIS '
        'AND THIS TEST TO FAIL!', (WidgetTester tester) async {
      // Light and dark theme data made using
      // ThemeData(applyElevationOverlayColor: true) factory.
      final ThemeData light = ThemeData(
        applyElevationOverlayColor: true,
        useMaterial3: false,
      );
      ThemeData dark = ThemeData(
        brightness: Brightness.dark,
        applyElevationOverlayColor: true,
        useMaterial3: false,
      );
      dark = dark.copyWith(
          colorScheme: dark.colorScheme.copyWith(
        surfaceContainer: Colors.green,
      ));

      await tester.pumpWidget(testApp(ThemeMode.dark, light, dark));

      final Color surface = Theme.of(savedContext).colorScheme.surface;
      final Color container =
          Theme.of(savedContext).colorScheme.surfaceContainer;

      // EXPECT: elevation overlay color for elevated surface.
      expect(surface,
          isNot(ElevationOverlay.applyOverlay(savedContext, surface, 1)));

      // EXPECT: **NO** elevation overlay color for elevated container.
      // We would ACTUALLY WANT  THIS TO FAIL, this is reverse failed test
      // Based on HOW SDK currently behaves.
      // See issue: https://github.com/flutter/flutter/issues/90353
      expect(container,
          equals(ElevationOverlay.applyOverlay(savedContext, container, 1)));
    });
  });
}
