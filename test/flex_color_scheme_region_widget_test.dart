import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

//****************************************************************************
// FlexColorScheme themedSystemNavigationBar Widget tests
//
// Covered quite well in flex_color_scheme_test unit test group FCS5, but
// could potentially do more here. Current test just tests that it can build
// an app and find an AnnotatedRegion using the themedSystemNavigationBar
// styled SystemUiOverlayStyle. Which is certainly a bit already, as it
// tests that it builds and works as a widget.
//****************************************************************************
void main() {
  group('FCS6: WITH FlexColorScheme.themedSystemNavigationBar ', () {
    debugDefaultTargetPlatformOverride = null;
    testWidgets('FCS6.01: Finds Annotated Region in light themed app',
        (WidgetTester tester) async {
      // Create the widget by telling the tester to build it.
      await tester.pumpWidget(const MyWidget(scheme: ColorScheme.light()));
      final Finder region = find.byKey(const ValueKey<String>('region'));
      expect(region, findsOneWidget);
    });
    testWidgets('FCS6.02: Finds Annotated Region in dark themed app',
        (WidgetTester tester) async {
      // Create the widget by telling the tester to build it.
      await tester.pumpWidget(const MyWidget(scheme: ColorScheme.dark()));
      final Finder region = find.byKey(const ValueKey<String>('region'));
      expect(region, findsOneWidget);
    });
  });
}

class MyWidget extends StatelessWidget {
  final ColorScheme scheme;

  const MyWidget({
    super.key,
    required this.scheme,
  });

  @override
  Widget build(BuildContext context) {
    debugDefaultTargetPlatformOverride = null;
    return MaterialApp(
      title: 'themedSystemNavigationBar',
      theme: ThemeData.from(colorScheme: scheme),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('themedSystemNavigationBar'),
        ),
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          key: const ValueKey<String>('region'),
          value: FlexColorScheme.themedSystemNavigationBar(context),
          child: const Center(
            child: Text('Themed Nav Bar'),
          ),
        ),
      ),
    );
  }
}
