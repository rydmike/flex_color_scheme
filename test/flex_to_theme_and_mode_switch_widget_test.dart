import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

//****************************************************************************
// FlexThemeModeSwitch and FlexColorScheme.toTheme Widget tests.
//
//****************************************************************************
void main() {
  group('FTMS1: WITH FlexThemeModeSwitch LightMode', () {
    debugDefaultTargetPlatformOverride = null;

    testWidgets('FTMS1.01: Finds FlexThemeModeSwitch LightMode',
        (WidgetTester tester) async {
      await tester.pumpWidget(const ThemeSwitchApp());

      // EXPECT: That we find the built MaterialApp.
      final Finder theApp = find.byKey(const ValueKey<String>('theApp'));
      await tester.pump();
      expect(theApp, findsOneWidget);

      // EXPECT: That it STARTED in light theme mode.
      // ignore: prefer_function_declarations_over_variables
      final WidgetPredicate lightMaterialApp = (Widget widget) =>
          widget is MaterialApp && widget.themeMode == ThemeMode.light;
      expect(find.byWidgetPredicate(lightMaterialApp), findsOneWidget);

      // EXPECT: That we find a theme mode 3-way switch.
      final Finder themeSwitch = find.byKey(const ValueKey<String>('switch'));
      await tester.tap(themeSwitch);
      await tester.pumpAndSettle();
      expect(themeSwitch, findsOneWidget);

      // EXPECT: That we find a light theme mode button
      final Finder lightSwitch = find.bySemanticsLabel('LIGHT');
      await tester.tap(lightSwitch);
      await tester.pumpAndSettle();
      expect(lightSwitch, findsOneWidget);

      // EXPECT: That we find a dark theme mode button
      final Finder darkSwitch = find.bySemanticsLabel('DARK');
      await tester.tap(darkSwitch);
      await tester.pumpAndSettle();
      expect(darkSwitch, findsOneWidget);

      // EXPECT: That after the DARK theme mode TAP the app is in DARK mode.
      // ignore: prefer_function_declarations_over_variables
      final WidgetPredicate darkMaterialApp = (Widget widget) =>
          widget is MaterialApp && widget.themeMode == ThemeMode.dark;
      expect(find.byWidgetPredicate(darkMaterialApp), findsOneWidget);

      // EXPECT: That we find a system theme mode button
      final Finder systemSwitch = find.bySemanticsLabel('SYSTEM');
      await tester.tap(systemSwitch);
      await tester.pumpAndSettle();
      expect(systemSwitch, findsOneWidget);

      // EXPECT: That we find a single option button.
      final Finder optionButton = find.byKey(const ValueKey<String>('option'));
      await tester.tap(optionButton);
      await tester.pumpAndSettle();
      expect(optionButton, findsOneWidget);
    });
  });

  group('FTMS2: WITH FlexThemeModeSwitch DarkMode', () {
    debugDefaultTargetPlatformOverride = null;
    testWidgets('FTMS2.01: Finds FlexThemeModeSwitch in DarkMode',
        (WidgetTester tester) async {
      await tester.pumpWidget(const ThemeSwitchApp(
        themeMode: ThemeMode.dark,
        showSystemMode: false,
        labelAbove: false,
        labelLight: 'light',
        labelDark: 'dark',
        labelSystem: 'system',
        selected: false,
      ));

      // EXPECT: That we find the built MaterialApp.
      final Finder theApp = find.byKey(const ValueKey<String>('theApp'));
      await tester.pump();
      expect(theApp, findsOneWidget);

      // EXPECT: That it STARTED in dark theme mode.
      // ignore: prefer_function_declarations_over_variables
      final WidgetPredicate darkMaterialApp = (Widget widget) =>
          widget is MaterialApp && widget.themeMode == ThemeMode.dark;
      expect(find.byWidgetPredicate(darkMaterialApp), findsOneWidget);

      // EXPECT: That we find a theme mode 3-way switch.
      final Finder themeSwitch = find.byKey(const ValueKey<String>('switch'));
      await tester.tap(themeSwitch);
      await tester.pumpAndSettle();
      expect(themeSwitch, findsOneWidget);

      // EXPECT: That we find a light theme mode button
      final Finder lightSwitch = find.bySemanticsLabel('light');
      await tester.tap(lightSwitch);
      await tester.pumpAndSettle();
      expect(lightSwitch, findsOneWidget);

      // EXPECT: That after the LIGHT theme mode TAP the app is in LIGHT mode.
      // ignore: prefer_function_declarations_over_variables
      final WidgetPredicate lightMaterialApp = (Widget widget) =>
          widget is MaterialApp && widget.themeMode == ThemeMode.light;
      expect(find.byWidgetPredicate(lightMaterialApp), findsOneWidget);

      // EXPECT: That we find a dark theme mode button
      final Finder darkSwitch = find.bySemanticsLabel('dark');
      await tester.tap(darkSwitch);
      await tester.pumpAndSettle();
      expect(darkSwitch, findsOneWidget);

      // EXPECT: That we find NO system theme mode button
      final Finder systemSwitch = find.bySemanticsLabel('system');
      await tester.pumpAndSettle();
      expect(systemSwitch, findsNothing);

      // EXPECT: That we find a single option button.
      final Finder optionButton = find.byKey(const ValueKey<String>('option'));
      await tester.tap(optionButton);
      await tester.pumpAndSettle();
      expect(optionButton, findsOneWidget);
    });
  });

  group('FTMS3: WITH FlexThemeModeSwitch SystemMode', () {
    debugDefaultTargetPlatformOverride = null;

    testWidgets('FTMS3.01: Finds FlexThemeModeSwitch in SystemMode',
        (WidgetTester tester) async {
      await tester.pumpWidget(const ThemeSwitchApp(
        themeMode: ThemeMode.system,
      ));

      // EXPECT: That we find the built MaterialApp.
      final Finder theApp = find.byKey(const ValueKey<String>('theApp'));
      await tester.pump();
      expect(theApp, findsOneWidget);

      // EXPECT: That it STARTED in system theme mode.
      // ignore: prefer_function_declarations_over_variables
      final WidgetPredicate systemMaterialApp = (Widget widget) =>
          widget is MaterialApp && widget.themeMode == ThemeMode.system;
      expect(find.byWidgetPredicate(systemMaterialApp), findsOneWidget);

      // EXPECT: That we find a theme mode 3-way switch.
      final Finder themeSwitch = find.byKey(const ValueKey<String>('switch'));
      await tester.tap(themeSwitch);
      await tester.pumpAndSettle();
      expect(themeSwitch, findsOneWidget);

      // EXPECT: That we find a system theme mode button
      final Finder systemSwitch = find.bySemanticsLabel('SYSTEM');
      await tester.tap(systemSwitch);
      await tester.pumpAndSettle();
      expect(systemSwitch, findsOneWidget);

      // EXPECT: That we find a dark theme mode button
      final Finder darkSwitch = find.bySemanticsLabel('DARK');
      await tester.tap(darkSwitch);
      await tester.pumpAndSettle();
      expect(darkSwitch, findsOneWidget);

      // EXPECT: That after the DARK theme mode TAP the app is in DARK mode.
      // ignore: prefer_function_declarations_over_variables
      final WidgetPredicate darkMaterialApp = (Widget widget) =>
          widget is MaterialApp && widget.themeMode == ThemeMode.dark;
      expect(find.byWidgetPredicate(darkMaterialApp), findsOneWidget);

      // EXPECT: That we find a single option button.
      final Finder optionButton = find.byKey(const ValueKey<String>('option'));
      await tester.tap(optionButton);
      await tester.pumpAndSettle();
      expect(optionButton, findsOneWidget);
    });
  });

  group('FTMS2: WITH FlexThemeModeSwitch Assertions ', () {
    // Test null assertion combinations
    test(
        'FTMS2.01: GIVEN a FlexThemeModeSwitch with a required as null value '
        'EXPECT throws null assertion error.', () {
      expect(
          () => FlexThemeModeSwitch(
              themeMode: null,
              onThemeModeChanged: (ThemeMode value) {},
              flexSchemeData: FlexColor.schemes[FlexScheme.material],
              showSystemMode: false,
              labelAbove: false,
              selectedElevation: 1,
              unselectedElevation: 1,
              optionButtonBorderRadius: 1,
              height: 10,
              width: 10,
              borderRadius: 5),
          throwsAssertionError);
    });
    test(
        'FTMS2.02: GIVEN a FlexThemeModeSwitch with a required as null value '
        'EXPECT throws null assertion error.', () {
      expect(
          () => FlexThemeModeSwitch(
              themeMode: ThemeMode.light,
              onThemeModeChanged: null,
              flexSchemeData: FlexColor.schemes[FlexScheme.material],
              showSystemMode: false,
              labelAbove: false,
              selectedElevation: 1,
              unselectedElevation: 1,
              optionButtonBorderRadius: 1,
              height: 10,
              width: 10,
              borderRadius: 5),
          throwsAssertionError);
    });
    test(
        'FTMS2.03: GIVEN a FlexThemeModeSwitch with a required as null value '
        'EXPECT throws null assertion error.', () {
      expect(
          () => FlexThemeModeSwitch(
              themeMode: ThemeMode.light,
              onThemeModeChanged: (ThemeMode value) {},
              flexSchemeData: null,
              showSystemMode: false,
              labelAbove: false,
              selectedElevation: 1,
              unselectedElevation: 1,
              optionButtonBorderRadius: 1,
              height: 10,
              width: 10,
              borderRadius: 5),
          throwsAssertionError);
    });
    test(
        'FTMS2.04: GIVEN a FlexThemeModeSwitch with a required as null value '
        'EXPECT throws null assertion error.', () {
      expect(
          () => FlexThemeModeSwitch(
              themeMode: ThemeMode.light,
              onThemeModeChanged: (ThemeMode value) {},
              flexSchemeData: FlexColor.schemes[FlexScheme.material],
              showSystemMode: null,
              labelAbove: false,
              selectedElevation: 1,
              unselectedElevation: 1,
              optionButtonBorderRadius: 1,
              height: 10,
              width: 10,
              borderRadius: 5),
          throwsAssertionError);
    });
    test(
        'FTMS2.05: GIVEN a FlexThemeModeSwitch with a required as null value '
        'EXPECT throws null assertion error.', () {
      expect(
          () => FlexThemeModeSwitch(
              themeMode: ThemeMode.light,
              onThemeModeChanged: (ThemeMode value) {},
              flexSchemeData: FlexColor.schemes[FlexScheme.material],
              showSystemMode: false,
              labelAbove: null,
              selectedElevation: 1,
              unselectedElevation: 1,
              optionButtonBorderRadius: 1,
              height: 10,
              width: 10,
              borderRadius: 5),
          throwsAssertionError);
    });
    test(
        'FTMS2.06: GIVEN a FlexThemeModeSwitch with a required as null value '
        'EXPECT throws null assertion error.', () {
      expect(
          () => FlexThemeModeSwitch(
              themeMode: ThemeMode.light,
              onThemeModeChanged: (ThemeMode value) {},
              flexSchemeData: FlexColor.schemes[FlexScheme.material],
              showSystemMode: false,
              labelAbove: false,
              selectedElevation: null,
              unselectedElevation: 1,
              optionButtonBorderRadius: 1,
              height: 10,
              width: 10,
              borderRadius: 5),
          throwsAssertionError);
    });
    test(
        'FTMS2.07: GIVEN a FlexThemeModeSwitch with a required as null value '
        'EXPECT throws null assertion error.', () {
      expect(
          () => FlexThemeModeSwitch(
              themeMode: ThemeMode.light,
              onThemeModeChanged: (ThemeMode value) {},
              flexSchemeData: FlexColor.schemes[FlexScheme.material],
              showSystemMode: false,
              labelAbove: false,
              selectedElevation: 1,
              unselectedElevation: null,
              optionButtonBorderRadius: 1,
              height: 10,
              width: 10,
              borderRadius: 5),
          throwsAssertionError);
    });
    test(
        'FTMS2.08: GIVEN a FlexThemeModeSwitch with a required as null value '
        'EXPECT throws null assertion error.', () {
      expect(
          () => FlexThemeModeSwitch(
              themeMode: ThemeMode.light,
              onThemeModeChanged: (ThemeMode value) {},
              flexSchemeData: FlexColor.schemes[FlexScheme.material],
              showSystemMode: false,
              labelAbove: false,
              selectedElevation: 1,
              unselectedElevation: 1,
              optionButtonBorderRadius: null,
              height: 10,
              width: 10,
              borderRadius: 5),
          throwsAssertionError);
    });
    test(
        'FTMS2.09: GIVEN a FlexThemeModeSwitch with a required as null value '
        'EXPECT throws null assertion error.', () {
      expect(
          () => FlexThemeModeSwitch(
              themeMode: ThemeMode.light,
              onThemeModeChanged: (ThemeMode value) {},
              flexSchemeData: FlexColor.schemes[FlexScheme.material],
              showSystemMode: false,
              labelAbove: false,
              selectedElevation: 1,
              unselectedElevation: 1,
              optionButtonBorderRadius: 1,
              height: null,
              width: 10,
              borderRadius: 5),
          throwsAssertionError);
    });
    test(
        'FTMS2.10: GIVEN a FlexThemeModeSwitch with a required as null value '
        'EXPECT throws null assertion error.', () {
      expect(
          () => FlexThemeModeSwitch(
              themeMode: ThemeMode.light,
              onThemeModeChanged: (ThemeMode value) {},
              flexSchemeData: FlexColor.schemes[FlexScheme.material],
              showSystemMode: false,
              labelAbove: false,
              selectedElevation: 1,
              unselectedElevation: 1,
              optionButtonBorderRadius: 1,
              height: 10,
              width: null,
              borderRadius: 5),
          throwsAssertionError);
    });
    test(
        'FTMS2.11: GIVEN a FlexThemeModeSwitch with a required as null value '
        'EXPECT throws null assertion error.', () {
      expect(
          () => FlexThemeModeSwitch(
              themeMode: ThemeMode.light,
              onThemeModeChanged: (ThemeMode value) {},
              flexSchemeData: FlexColor.schemes[FlexScheme.material],
              showSystemMode: false,
              labelAbove: false,
              selectedElevation: 1,
              unselectedElevation: 1,
              optionButtonBorderRadius: 1,
              height: 10,
              width: 10,
              borderRadius: null),
          throwsAssertionError);
    });
  });

  group('FTMS3: WITH FlexThemeModeOptionButton Assertions ', () {
    // Test null assertion combinations
    test(
        'FTMS3.01: GIVEN a FlexThemeModeOptionButton with a required as null '
        'value EXPECT throws null assertion error.', () {
      expect(
          () => FlexThemeModeOptionButton(
              flexSchemeColor: null,
              backgroundColor: Colors.black,
              labelAbove: false,
              selected: false,
              onSelect: () {},
              elevation: 2,
              optionButtonBorderRadius: 1,
              height: 10,
              width: 10,
              borderRadius: 5),
          throwsAssertionError);
    });
    test(
        'FTMS3.02: GIVEN a FlexThemeModeOptionButton with a required as null '
        'value EXPECT throws null assertion error.', () {
      expect(
          () => FlexThemeModeOptionButton(
              flexSchemeColor: FlexColor.schemes[FlexScheme.material].dark,
              backgroundColor: null,
              labelAbove: false,
              selected: false,
              onSelect: () {},
              elevation: 2,
              optionButtonBorderRadius: 1,
              height: 10,
              width: 10,
              borderRadius: 5),
          throwsAssertionError);
    });
    test(
        'FTMS3.03: GIVEN a FlexThemeModeOptionButton with a required as null '
        'value EXPECT throws null assertion error.', () {
      expect(
          () => FlexThemeModeOptionButton(
              flexSchemeColor: FlexColor.schemes[FlexScheme.material].dark,
              backgroundColor: Colors.black,
              labelAbove: null,
              selected: false,
              onSelect: () {},
              elevation: 2,
              optionButtonBorderRadius: 1,
              height: 10,
              width: 10,
              borderRadius: 5),
          throwsAssertionError);
    });
    test(
        'FTMS3.04: GIVEN a FlexThemeModeOptionButton with a required as null '
        'value EXPECT throws null assertion error.', () {
      expect(
          () => FlexThemeModeOptionButton(
              flexSchemeColor: FlexColor.schemes[FlexScheme.material].dark,
              backgroundColor: Colors.black,
              labelAbove: false,
              selected: null,
              onSelect: () {},
              elevation: 2,
              optionButtonBorderRadius: 1,
              height: 10,
              width: 10,
              borderRadius: 5),
          throwsAssertionError);
    });
    test(
        'FTMS3.05: GIVEN a FlexThemeModeOptionButton with a required as null '
        'value EXPECT throws null assertion error.', () {
      expect(
          () => FlexThemeModeOptionButton(
              flexSchemeColor: FlexColor.schemes[FlexScheme.material].dark,
              backgroundColor: Colors.black,
              labelAbove: false,
              selected: false,
              onSelect: null,
              elevation: 2,
              optionButtonBorderRadius: 1,
              height: 10,
              width: 10,
              borderRadius: 5),
          throwsAssertionError);
    });
    test(
        'FTMS3.06: GIVEN a FlexThemeModeOptionButton with a required as null '
        'value EXPECT throws null assertion error.', () {
      expect(
          () => FlexThemeModeOptionButton(
              flexSchemeColor: FlexColor.schemes[FlexScheme.material].dark,
              backgroundColor: Colors.black,
              labelAbove: false,
              selected: false,
              onSelect: () {},
              elevation: null,
              optionButtonBorderRadius: 1,
              height: 10,
              width: 10,
              borderRadius: 5),
          throwsAssertionError);
    });
    test(
        'FTMS3.07: GIVEN a FlexThemeModeOptionButton with a required as null '
        'value EXPECT throws null assertion error.', () {
      expect(
          () => FlexThemeModeOptionButton(
              flexSchemeColor: FlexColor.schemes[FlexScheme.material].dark,
              backgroundColor: Colors.black,
              labelAbove: false,
              selected: false,
              onSelect: () {},
              elevation: 2,
              optionButtonBorderRadius: null,
              height: 10,
              width: 10,
              borderRadius: 5),
          throwsAssertionError);
    });
    test(
        'FTMS3.08: GIVEN a FlexThemeModeOptionButton with a required as null '
        'value EXPECT throws null assertion error.', () {
      expect(
          () => FlexThemeModeOptionButton(
              flexSchemeColor: FlexColor.schemes[FlexScheme.material].dark,
              backgroundColor: Colors.black,
              labelAbove: false,
              selected: false,
              onSelect: () {},
              elevation: 2,
              optionButtonBorderRadius: 1,
              height: null,
              width: 10,
              borderRadius: 5),
          throwsAssertionError);
    });
    test(
        'FTMS3.09: GIVEN a FlexThemeModeOptionButton with a required as null '
        'value EXPECT throws null assertion error.', () {
      expect(
          () => FlexThemeModeOptionButton(
              flexSchemeColor: FlexColor.schemes[FlexScheme.material].dark,
              backgroundColor: Colors.black,
              labelAbove: false,
              selected: false,
              onSelect: () {},
              elevation: 2,
              optionButtonBorderRadius: 1,
              height: 10,
              width: null,
              borderRadius: 5),
          throwsAssertionError);
    });
    test(
        'FTMS3.10: GIVEN a FlexThemeModeOptionButton with a required as null '
        'value EXPECT throws null assertion error.', () {
      expect(
          () => FlexThemeModeOptionButton(
              flexSchemeColor: FlexColor.schemes[FlexScheme.material].dark,
              backgroundColor: Colors.black,
              labelAbove: false,
              selected: false,
              onSelect: () {},
              elevation: 2,
              optionButtonBorderRadius: 1,
              height: 10,
              width: 10,
              borderRadius: null),
          throwsAssertionError);
    });
  });
}

class ThemeSwitchApp extends StatefulWidget {
  const ThemeSwitchApp({
    this.themeMode = ThemeMode.light,
    this.showSystemMode = true,
    this.labelAbove = true,
    this.labelLight = 'LIGHT',
    this.labelDark = 'DARK',
    this.labelSystem = 'SYSTEM',
    this.selected = true,
    Key key,
  }) : super(key: key);
  final ThemeMode themeMode;
  final bool showSystemMode;
  final bool labelAbove;
  final String labelLight;
  final String labelDark;
  final String labelSystem;
  final bool selected;

  @override
  _ThemeSwitchAppState createState() => _ThemeSwitchAppState();
}

class _ThemeSwitchAppState extends State<ThemeSwitchApp> {
  ThemeMode mode;
  bool selected;

  @override
  void initState() {
    super.initState();
    mode = widget.themeMode;
    selected = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    debugDefaultTargetPlatformOverride = null;
    return MaterialApp(
      key: const ValueKey<String>('theApp'),
      title: 'Theme Switch',
      theme: FlexColorScheme.light(
              colors: FlexColor.schemes[FlexScheme.material].light)
          .toTheme,
      darkTheme: FlexColorScheme.dark(
              colors: FlexColor.schemes[FlexScheme.material].dark)
          .toTheme,
      themeMode: mode,
      home: Scaffold(
        appBar: AppBar(title: const Text('Theme Switch')),
        body: Column(
          children: <Widget>[
            FlexThemeModeSwitch(
                key: const ValueKey<String>('switch'),
                themeMode: mode,
                labelAbove: widget.labelAbove,
                labelLight: widget.labelLight,
                labelDark: widget.labelDark,
                labelSystem: widget.labelSystem,
                showSystemMode: widget.showSystemMode,
                onThemeModeChanged: (ThemeMode value) {
                  setState(() {
                    mode = value;
                  });
                },
                flexSchemeData: FlexColor.schemes[FlexScheme.material]),
            FlexThemeModeOptionButton(
              key: const ValueKey<String>('option'),
              flexSchemeColor: FlexColor.schemes[FlexScheme.material].light,
              backgroundColor: Colors.white,
              selected: selected,
              onSelect: () {
                setState(() {
                  selected = !selected;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
