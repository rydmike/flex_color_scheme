// The test for the FlexHighlightSplash.splashFactory is copied from
// Flutter repo and pretty identical to the test for InkSplash.
// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flex_color_scheme/src/flex_instant_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
      'InkWell with NoSplash.splashFactory paints nothing AND '
      'InkWell FlexHighlightSplash paints one Circle quickly.',
      (WidgetTester tester) async {
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
      final TestGesture gesture =
          await tester.startGesture(tester.getCenter(find.text('test')));
      final MaterialInkController material =
          Material.of(tester.element(find.text('test')));
      await tester.pump(const Duration(milliseconds: 200));
      expect(material, paintsExactlyCountTimes(#drawCircle, 0));
      await gesture.up();
      await tester.pumpAndSettle();
    }

    // FlexHighlightSplash.splashFactory, one splash circle drawn quickly.
    await tester
        .pumpWidget(buildFrame(splashFactory: FlexInstantSplash.splashFactory));
    {
      final TestGesture gesture =
          await tester.startGesture(tester.getCenter(find.text('test')));
      final MaterialInkController material =
          Material.of(tester.element(find.text('test')));
      await tester.pump(const Duration(milliseconds: 1));
      expect(material, paintsExactlyCountTimes(#drawCircle, 1));
      await gesture.up();
      await tester.pumpAndSettle();
    }
  });
}
