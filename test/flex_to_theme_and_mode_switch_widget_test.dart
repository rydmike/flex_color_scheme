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

    testWidgets('FTMS7.01: Finds FlexThemeModeSwitch',
        (WidgetTester tester) async {
      await tester.pumpWidget(const ThemeSwitch());
      final Finder themeSwitch = find.byKey(const ValueKey<String>('switch'));
      await tester.pump();
      expect(themeSwitch, findsOneWidget);
    });
  });
}

class ThemeSwitch extends StatefulWidget {
  const ThemeSwitch({Key key}) : super(key: key);

  @override
  _ThemeSwitchState createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  ThemeMode mode;
  @override
  void initState() {
    super.initState();
    mode = ThemeMode.light;
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
