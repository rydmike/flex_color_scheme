import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

//****************************************************************************
// FlexThemeModeSwitch and FlexColorScheme.toTheme Widget tests.
//
//****************************************************************************
void main() {
  group('FTMS1 LDS: WITH FlexThemeModeSwitch LightMode LightDarkSystem', () {
    debugDefaultTargetPlatformOverride = null;

    testWidgets('FTMS1.01: Finds FlexThemeModeSwitch LightMode',
        (WidgetTester tester) async {
      await tester.pumpWidget(const ThemeSwitchApp(
        order: FlexThemeModeButtonOrder.lightDarkSystem,
      ));

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
      await tester.tap(optionButton, warnIfMissed: false);
      await tester.pumpAndSettle();
      expect(optionButton, findsOneWidget);
    });
  });

  group('FTMS1 LSD: WITH FlexThemeModeSwitch LightMode LightSystemDark', () {
    debugDefaultTargetPlatformOverride = null;

    testWidgets('FTMS1.01: Finds FlexThemeModeSwitch LightMode',
        (WidgetTester tester) async {
      await tester.pumpWidget(const ThemeSwitchApp(
        order: FlexThemeModeButtonOrder.lightSystemDark,
      ));

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
      await tester.tap(optionButton, warnIfMissed: false);
      await tester.pumpAndSettle();
      expect(optionButton, findsOneWidget);
    });
  });

  group('FTMS1 DLS: WITH FlexThemeModeSwitch LightMode DarkLightSystem', () {
    debugDefaultTargetPlatformOverride = null;

    testWidgets('FTMS1.01: Finds FlexThemeModeSwitch LightMode',
        (WidgetTester tester) async {
      await tester.pumpWidget(const ThemeSwitchApp(
        order: FlexThemeModeButtonOrder.darkLightSystem,
      ));

      // EXPECT: That we find the built MaterialApp.
      final Finder theApp = find.byKey(const ValueKey<String>('theApp'));
      await tester.pump();
      expect(theApp, findsOneWidget);

      // EXPECT: That we find a Text with 'Theme mode'.
      final Finder textThemeMode = find.text('Theme mode');
      await tester.pump();
      expect(textThemeMode, findsOneWidget);

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
      await tester.tap(optionButton, warnIfMissed: false);
      await tester.pumpAndSettle();
      expect(optionButton, findsOneWidget);
    });
  });

  group('FTMS1 DSL: WITH FlexThemeModeSwitch LightMode DarkSystemLight', () {
    debugDefaultTargetPlatformOverride = null;

    testWidgets('FTMS1.01: Finds FlexThemeModeSwitch LightMode',
        (WidgetTester tester) async {
      await tester.pumpWidget(const ThemeSwitchApp(
        order: FlexThemeModeButtonOrder.darkSystemLight,
        title: Text('TITLE'),
      ));

      // EXPECT: That we find the built MaterialApp.
      final Finder theApp = find.byKey(const ValueKey<String>('theApp'));
      await tester.pump();
      expect(theApp, findsOneWidget);

      // EXPECT: That we find a Text with 'TITLE' since we added custom title.
      final Finder textThemeMode = find.text('TITLE');
      await tester.pump();
      expect(textThemeMode, findsOneWidget);

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
      await tester.tap(optionButton, warnIfMissed: false);
      await tester.pumpAndSettle();
      expect(optionButton, findsOneWidget);
    });
  });

  group('FTMS2 LDS: WITH FlexThemeModeSwitch DarkMode LightDarkSystem', () {
    debugDefaultTargetPlatformOverride = null;
    testWidgets('FTMS2.01: Finds FlexThemeModeSwitch in DarkMode no System btn',
        (WidgetTester tester) async {
      await tester.pumpWidget(const ThemeSwitchApp(
        themeMode: ThemeMode.dark,
        showSystemMode: false,
        labelAbove: false,
        labelLight: 'light',
        labelDark: 'dark',
        labelSystem: 'system',
        selected: false,
        hasTitle: false,
      ));

      // EXPECT: That we find the built MaterialApp.
      final Finder theApp = find.byKey(const ValueKey<String>('theApp'));
      await tester.pump();
      expect(theApp, findsOneWidget);

      // EXPECT: That we find no Text with 'Theme mode' when it has no title.
      final Finder textThemeMode = find.text('Theme mode');
      await tester.pump();
      expect(textThemeMode, findsNothing);

      // EXPECT: That it STARTED in dark theme mode.
      // ignore: prefer_function_declarations_over_variables
      final WidgetPredicate darkMaterialApp = (Widget widget) =>
          widget is MaterialApp && widget.themeMode == ThemeMode.dark;
      expect(find.byWidgetPredicate(darkMaterialApp), findsOneWidget);

      // EXPECT: That we find a theme mode 3-way switch.
      final Finder themeSwitch = find.byKey(const ValueKey<String>('switch'));
      await tester.tap(themeSwitch, warnIfMissed: false);
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
      await tester.tap(optionButton, warnIfMissed: false);
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

      // EXPECT: That we find a Text with 'Theme mode'.
      final Finder textThemeMode = find.text('Theme mode');
      await tester.pump();
      expect(textThemeMode, findsOneWidget);

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
    });
  });
}

class ThemeSwitchApp extends StatefulWidget {
  const ThemeSwitchApp({
    this.themeMode = ThemeMode.light,
    this.order = FlexThemeModeButtonOrder.lightDarkSystem,
    this.showSystemMode = true,
    this.labelAbove = true,
    this.labelLight = 'LIGHT',
    this.labelDark = 'DARK',
    this.labelSystem = 'SYSTEM',
    this.selected = true,
    this.hasTitle = true,
    this.title,
    super.key,
  });
  final ThemeMode themeMode;
  final bool showSystemMode;
  final FlexThemeModeButtonOrder order;
  final bool labelAbove;
  final String labelLight;
  final String labelDark;
  final String labelSystem;
  final bool selected;
  final bool hasTitle;
  final Widget? title;

  @override
  State<ThemeSwitchApp> createState() => _ThemeSwitchAppState();
}

class _ThemeSwitchAppState extends State<ThemeSwitchApp> {
  ThemeMode? mode;
  late bool selected;

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
              colors: FlexColor.schemes[FlexScheme.material]!.light)
          .toTheme,
      darkTheme: FlexColorScheme.dark(
              colors: FlexColor.schemes[FlexScheme.material]!.dark)
          .toTheme,
      themeMode: mode,
      home: Scaffold(
        appBar: AppBar(title: const Text('Theme Switch')),
        body: Column(
          children: <Widget>[
            FlexThemeModeSwitch(
                key: const ValueKey<String>('switch'),
                themeMode: mode!,
                labelAbove: widget.labelAbove,
                labelLight: widget.labelLight,
                labelDark: widget.labelDark,
                labelSystem: widget.labelSystem,
                showSystemMode: widget.showSystemMode,
                buttonOrder: widget.order,
                title: widget.title,
                hasTitle: widget.hasTitle,
                onThemeModeChanged: (ThemeMode value) {
                  setState(() {
                    mode = value;
                  });
                },
                flexSchemeData: FlexColor.schemes[FlexScheme.material]!),
            FlexThemeModeOptionButton(
              key: const ValueKey<String>('option'),
              flexSchemeColor: FlexColor.schemes[FlexScheme.material]!.light,
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
