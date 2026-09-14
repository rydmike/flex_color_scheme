// The test for the FlexHighlightSplash.splashFactory is copied from
// Flutter repo and pretty identical to the test for InkSplash.
// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flex_color_scheme/src/flex_instant_splash.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  testWidgets('InkWell with NoSplash.splashFactory paints nothing AND '
      'InkWell FlexHighlightSplash paints one Circle quickly.', (WidgetTester tester) async {
    Widget buildFrame({InteractiveInkFeatureFactory? splashFactory}) {
      return MaterialApp(
        theme: ThemeData(useMaterial3: false),
        home: Scaffold(
          body: Center(
            child: Material(
              child: InkWell(
                splashFactory: splashFactory,
                onTap: () {},
                child: const Text('test'),
              ),
            ),
          ),
        ),
      );
    }

    // NoSplash.splashFactory, no splash circles drawn
    await tester.pumpWidget(buildFrame(splashFactory: NoSplash.splashFactory));
    {
      final TestGesture gesture = await tester.startGesture(tester.getCenter(find.text('test')));
      final MaterialInkController material = Material.of(tester.element(find.text('test')));
      await tester.pump(const Duration(milliseconds: 200));
      expect(material, paintsExactlyCountTimes(#drawCircle, 0));
      await gesture.up();
      await tester.pumpAndSettle();
    }

    // FlexHighlightSplash.splashFactory, one splash circle drawn quickly.
    await tester.pumpWidget(buildFrame(splashFactory: FlexInstantSplash.splashFactory));
    {
      final TestGesture gesture = await tester.startGesture(tester.getCenter(find.text('test')));
      final MaterialInkController material = Material.of(tester.element(find.text('test')));
      await tester.pump(const Duration(milliseconds: 1));
      expect(material, paintsExactlyCountTimes(#drawCircle, 1));
      await gesture.up();
      await tester.pumpAndSettle();
    }
  });

  testWidgets('FlexInstantSplash cancel fades the splash without confirming.', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(useMaterial3: false),
        home: Scaffold(
          body: Center(
            child: Material(
              child: InkWell(
                splashFactory: FlexInstantSplash.splashFactory,
                onTap: () {},
                child: const Text('cancel'),
              ),
            ),
          ),
        ),
      ),
    );
    final TestGesture gesture = await tester.startGesture(tester.getCenter(find.text('cancel')));
    final MaterialInkController material = Material.of(tester.element(find.text('cancel')));
    await tester.pump(const Duration(milliseconds: 1));
    expect(material, paintsExactlyCountTimes(#drawCircle, 1));
    await gesture.cancel();
    await tester.pumpAndSettle();
    expect(material, paintsExactlyCountTimes(#drawCircle, 0));
  });

  testWidgets('FlexInstantSplash uncontained InkResponse repositions the splash.', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(useMaterial3: false),
        home: Scaffold(
          body: Center(
            child: Material(
              child: InkResponse(
                splashFactory: FlexInstantSplash.splashFactory,
                onTap: () {},
                child: const SizedBox.square(dimension: 80, child: Text('uncontained')),
              ),
            ),
          ),
        ),
      ),
    );
    final TestGesture gesture = await tester.startGesture(tester.getCenter(find.text('uncontained')));
    final MaterialInkController material = Material.of(tester.element(find.text('uncontained')));
    await tester.pump(const Duration(milliseconds: 1));
    // Uncontained response paints the splash plus the default highlight circle.
    expect(material, paintsExactlyCountTimes(#drawCircle, 2));
    await gesture.up();
    await tester.pumpAndSettle();
  });

  testWidgets('FlexInstantSplash contained InkResponse without rectCallback still paints.', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(useMaterial3: false),
        home: Scaffold(
          body: Center(
            child: Material(
              child: InkResponse(
                containedInkWell: true,
                highlightShape: BoxShape.rectangle,
                splashFactory: FlexInstantSplash.splashFactory,
                onTap: () {},
                child: const SizedBox.square(dimension: 80, child: Text('contained')),
              ),
            ),
          ),
        ),
      ),
    );
    final TestGesture gesture = await tester.startGesture(tester.getCenter(find.text('contained')));
    final MaterialInkController material = Material.of(tester.element(find.text('contained')));
    await tester.pump(const Duration(milliseconds: 1));
    expect(material, paintsExactlyCountTimes(#drawCircle, 1));
    await gesture.up();
    await tester.pumpAndSettle();
  });

  testWidgets('FlexInstantSplash InkWell with explicit radius, border and custom border paints.', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(useMaterial3: false),
        home: Scaffold(
          body: Center(
            child: Material(
              child: InkWell(
                splashFactory: FlexInstantSplash.splashFactory,
                radius: 24,
                borderRadius: BorderRadius.circular(8),
                customBorder: const CircleBorder(),
                onTap: () {},
                child: const SizedBox.square(dimension: 80, child: Text('radius')),
              ),
            ),
          ),
        ),
      ),
    );
    final TestGesture gesture = await tester.startGesture(tester.getCenter(find.text('radius')));
    final MaterialInkController material = Material.of(tester.element(find.text('radius')));
    await tester.pump(const Duration(milliseconds: 1));
    expect(material, paintsExactlyCountTimes(#drawCircle, 1));
    await gesture.up();
    await tester.pumpAndSettle();
  });

  testWidgets('FlexInstantSplash uses a non-null rectCallback for clip and target radius.', (
    WidgetTester tester,
  ) async {
    const Key materialKey = Key('splash-host');
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(useMaterial3: false),
        home: const Scaffold(
          body: Center(
            child: SizedBox.square(
              dimension: 80,
              child: Material(
                key: materialKey,
                child: SizedBox.expand(),
              ),
            ),
          ),
        ),
      ),
    );

    final BuildContext materialContext = tester.element(find.byKey(materialKey));
    final MaterialInkController controller = Material.of(materialContext);
    final RenderBox box = tester.renderObject(find.byKey(materialKey));

    FlexInstantSplash(
      controller: controller,
      referenceBox: box,
      textDirection: TextDirection.ltr,
      position: const Offset(8, 8),
      color: const Color(0x88000000),
      containedInkWell: true,
      rectCallback: () => const Rect.fromLTWH(0, 0, 40, 40),
    );

    await tester.pump();
    expect(controller, paintsExactlyCountTimes(#drawCircle, 1));
    await tester.pumpAndSettle();
  });
}
