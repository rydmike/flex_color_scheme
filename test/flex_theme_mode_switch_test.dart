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

      // EXPECT: Light switch has default white background and type canvas.
      final Finder lightSwitchMaterial = find
          .descendant(of: lightSwitch, matching: find.byType(Material))
          .first;
      final Material lightMaterial =
          tester.widget<Material>(lightSwitchMaterial);
      expect(lightMaterial.type, MaterialType.canvas);
      expect(lightMaterial.color, Colors.white);

      // EXPECT: That we find a dark theme mode button
      final Finder darkSwitch = find.bySemanticsLabel('DARK');
      await tester.tap(darkSwitch);
      await tester.pumpAndSettle();
      expect(darkSwitch, findsOneWidget);

      // EXPECT: Dark switch has default grey850 background and type canvas.
      final Finder darkSwitchMaterial = find
          .descendant(of: darkSwitch, matching: find.byType(Material))
          .first;
      final Material darkMaterial = tester.widget<Material>(darkSwitchMaterial);
      expect(darkMaterial.type, MaterialType.canvas);
      expect(darkMaterial.color, Colors.grey[850]);

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

      // EXPECT: Dark switch has default grey850 background and type canvas.
      final Finder systemSwitchMaterial = find
          .descendant(of: systemSwitch, matching: find.byType(Material))
          .first;
      final Material systemMaterial =
          tester.widget<Material>(systemSwitchMaterial);
      expect(systemMaterial.type, MaterialType.canvas);
      expect(systemMaterial.color, Colors.grey[500]);

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
        changePadding: true,
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

  group('FTMS4: WITH FlexThemeModeOptionButton', () {
    debugDefaultTargetPlatformOverride = null;

    testWidgets('FTMS4.01: Finds FlexThemeModeOptionButton with BUTTON sem',
        (WidgetTester tester) async {
      await tester.pumpWidget(const ModeOptionButtonApp(
        themeMode: ThemeMode.light,
        label: 'BUTTON',
        semanticLabel: null,
      ));

      // EXPECT: That we find the built MaterialApp.
      final Finder theApp = find.byKey(const ValueKey<String>('theApp'));
      await tester.pump();
      expect(theApp, findsOneWidget);

      // EXPECT: That we find a button by semantic label
      final Finder modeButton = find.bySemanticsLabel('BUTTON');
      await tester.tap(modeButton, warnIfMissed: false);
      await tester.pumpAndSettle();
      expect(modeButton, findsOneWidget);

      // EXPECT: That we correct Size on button.
      // final Finder sizedBox =
      //     find.byWidget(const SizedBox(width: 64, height: 64));
      // await tester.pumpAndSettle();
      // expect(sizedBox, findsOneWidget);
    });
    //
    testWidgets('FTMS4.02: Finds FlexThemeModeOptionButton with BUTTON2 sem',
        (WidgetTester tester) async {
      await tester.pumpWidget(const ModeOptionButtonApp(
        themeMode: ThemeMode.light,
        padding: EdgeInsets.all(5),
        label: 'BUTTON',
        semanticLabel: 'BUTTON2',
      ));

      // EXPECT: That we find the built MaterialApp.
      final Finder theApp = find.byKey(const ValueKey<String>('theApp'));
      await tester.pump();
      expect(theApp, findsOneWidget);

      // EXPECT: That we a button by semantic label
      final Finder modeButton = find.bySemanticsLabel('BUTTON2');
      await tester.tap(modeButton, warnIfMissed: false);
      await tester.pumpAndSettle();
      expect(modeButton, findsOneWidget);
    });
    //
    testWidgets('FTMS4.03: Finds FlexThemeModeOptionButton with BUTTON2 sem',
        (WidgetTester tester) async {
      await tester.pumpWidget(const ModeOptionButtonApp(
        themeMode: ThemeMode.light,
        padding: EdgeInsetsDirectional.fromSTEB(5, 6, 7, 8),
        label: 'BUTTON',
        semanticLabel: 'BUTTON3',
        setFocusOnTap: true,
      ));

      // EXPECT: That we find the built MaterialApp.
      final Finder theApp = find.byKey(const ValueKey<String>('theApp'));
      await tester.pump();
      expect(theApp, findsOneWidget);

      // EXPECT: That we a button by semantic label
      final Finder modeButton = find.bySemanticsLabel('BUTTON3');
      await tester.tap(modeButton, warnIfMissed: false);
      await tester.pumpAndSettle();
      expect(modeButton, findsOneWidget);

      // EXPECT: That we find a single option button.
      final Finder inkButton = find.byType(InkWell);
      await tester.tap(inkButton, warnIfMissed: true);
      await tester.pumpAndSettle();
      expect(inkButton, findsOneWidget);

      // EXPECT: That we find a single option button.
      final Finder optionButton = find.byKey(const ValueKey<String>('option'));
      await tester.tap(optionButton, warnIfMissed: false);
      await tester.pumpAndSettle();
      expect(optionButton, findsOneWidget);
    });
    //
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
    this.changePadding = false,
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
  final bool changePadding;

  @override
  State<ThemeSwitchApp> createState() => _ThemeSwitchAppState();
}

class _ThemeSwitchAppState extends State<ThemeSwitchApp> {
  ThemeMode? mode;
  late bool selected;
  bool padNormal = true;

  static const EdgeInsetsGeometry padDir = EdgeInsetsDirectional.all(6);
  static const EdgeInsetsGeometry padNor = EdgeInsets.all(4);

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
                optionButtonMargin: widget.changePadding
                    ? padNormal
                        ? padNor
                        : padDir
                    : null,
                padding: widget.changePadding
                    ? padNormal
                        ? padDir
                        : padNor
                    : null,
                onThemeModeChanged: (ThemeMode value) {
                  setState(() {
                    mode = value;
                    padNormal = !padNormal;
                  });
                },
                flexSchemeData: FlexColor.schemes[FlexScheme.material]!),
            FlexThemeModeOptionButton(
              key: const ValueKey<String>('option'),
              flexSchemeColor: FlexColor.schemes[FlexScheme.material]!.light,
              backgroundColor: Colors.white,
              optionButtonMargin: widget.changePadding
                  ? padNormal
                      ? padNor
                      : padDir
                  : null,
              padding: widget.changePadding
                  ? padNormal
                      ? padDir
                      : padNor
                  : null,
              selected: selected,
              onSelect: () {
                setState(() {
                  selected = !selected;
                  padNormal = !padNormal;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ModeOptionButtonApp extends StatefulWidget {
  const ModeOptionButtonApp({
    this.themeMode = ThemeMode.light,
    this.setFocusOnTap = true,
    this.padding,
    this.selected = true,
    this.label,
    this.semanticLabel,
    // this.onSelect,
    super.key,
  });
  final ThemeMode themeMode;
  final bool setFocusOnTap;
  final EdgeInsetsGeometry? padding;
  final bool selected;
  final String? label;
  final String? semanticLabel;
  // final VoidCallback? onSelect;

  @override
  State<ModeOptionButtonApp> createState() => _ModeOptionButtonAppState();
}

class _ModeOptionButtonAppState extends State<ModeOptionButtonApp> {
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
        body: Center(
          child: FlexThemeModeOptionButton(
            key: const ValueKey<String>('option'),
            flexSchemeColor: FlexColor.schemes[FlexScheme.material]!.light,
            backgroundColor: Colors.white,
            padding: widget.padding,
            selected: selected,
            label: widget.label,
            setFocusOnTap: widget.setFocusOnTap,
            semanticLabel: widget.semanticLabel,
            onSelect: () {
              setState(() {
                selected = !selected;
              });
            },
          ),
        ),
      ),
    );
  }
}
