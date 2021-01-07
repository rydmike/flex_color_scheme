import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

//****************************************************************************
// FlexThemeModeSwitch and FlexColorScheme.toTheme Widget tests.
//
// TODO Add more tests for this widget, now just a "hi I got built OK test".
//****************************************************************************
void main() {
  group('FTMS7: WITH FlexThemeModeSwitch and FlexColorScheme', () {
    debugDefaultTargetPlatformOverride = null;

    testWidgets('FTMS7.01: Finds FlexThemeModeSwitch LightMode',
        (WidgetTester tester) async {
      await tester.pumpWidget(const ThemeSwitchApp(
        themeMode: ThemeMode.light,
        labelAbove: true,
      ));
      final Finder themeSwitch = find.byKey(const ValueKey<String>('switch'));
      await tester.pump();
      expect(themeSwitch, findsOneWidget);
    });
    testWidgets('FTMS7.02: Finds FlexThemeModeSwitch DarkMode',
        (WidgetTester tester) async {
      await tester.pumpWidget(const ThemeSwitchApp(
        themeMode: ThemeMode.dark,
        labelAbove: false,
      ));
      final Finder themeSwitch = find.byKey(const ValueKey<String>('switch'));
      await tester.pump();
      expect(themeSwitch, findsOneWidget);
    });
  });
}

class ThemeSwitchApp extends StatefulWidget {
  const ThemeSwitchApp({
    this.themeMode,
    this.labelAbove,
    Key key,
  }) : super(key: key);
  final ThemeMode themeMode;
  final bool labelAbove;

  @override
  _ThemeSwitchAppState createState() => _ThemeSwitchAppState();
}

class _ThemeSwitchAppState extends State<ThemeSwitchApp> {
  ThemeMode mode;
  bool labelAbove;

  @override
  void initState() {
    super.initState();
    mode = widget.themeMode;
    labelAbove = widget.labelAbove;
  }

  @override
  Widget build(BuildContext context) {
    debugDefaultTargetPlatformOverride = null;
    return MaterialApp(
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
        body: FlexThemeModeSwitch(
            key: const ValueKey<String>('switch'),
            themeMode: mode,
            labelAbove: labelAbove,
            onThemeModeChanged: (ThemeMode value) {
              setState(() {
                mode = value;
              });
            },
            flexSchemeData: FlexColor.schemes[FlexScheme.material]),
      ),
    );
  }
}
