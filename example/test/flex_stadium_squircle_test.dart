// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../lib/shared/widgets/universal/flex_stadium_squircle.dart';

void main() {
  test('Continuous rectangle border scale and lerp', () {
    const SquircleStadiumBorder c10 =
        SquircleStadiumBorder(side: BorderSide(width: 10.0));
    const SquircleStadiumBorder c15 =
        SquircleStadiumBorder(side: BorderSide(width: 15.0));
    const SquircleStadiumBorder c20 =
        SquircleStadiumBorder(side: BorderSide(width: 20.0));
    expect(c10.dimensions, const EdgeInsets.all(10.0));
    expect(c10.scale(2.0), c20);
    expect(c20.scale(0.5), c10);
    expect(ShapeBorder.lerp(c10, c20, 0.0), c10);
    expect(ShapeBorder.lerp(c10, c20, 0.5), c15);
    expect(ShapeBorder.lerp(c10, c20, 1.0), c20);
  });

  testWidgets('Golden test medium sized stadium, medium radius',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      RepaintBoundary(
        child: Container(
          alignment: Alignment.center,
          child: Material(
            color: Colors.blueAccent[400],
            shape: const SquircleStadiumBorder(),
            child: const SizedBox(
              height: 100,
              width: 200,
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await expectLater(
      find.byType(RepaintBoundary),
      matchesGoldenFile(
          'continuous_stadium_border.golden_test_medium_medium.png'),
      skip: !Platform.isLinux,
    );
  });

  testWidgets('Golden test small sized small, medium radius',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      RepaintBoundary(
        child: Container(
          alignment: Alignment.center,
          child: Material(
            color: Colors.blueAccent[400],
            shape: const SquircleStadiumBorder(),
            child: const SizedBox(
              height: 10,
              width: 100,
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await expectLater(
      find.byType(RepaintBoundary),
      matchesGoldenFile(
          'continuous_stadium_border.golden_test_small_medium.png'),
      skip: !Platform.isLinux,
    );
  });

  testWidgets('Golden test very small stadium, medium radius',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      RepaintBoundary(
        child: Container(
          alignment: Alignment.center,
          child: Material(
            color: Colors.blueAccent[400],
            shape: const SquircleStadiumBorder(),
            child: const SizedBox(
              height: 5,
              width: 100,
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await expectLater(
      find.byType(RepaintBoundary),
      matchesGoldenFile(
          'continuous_stadium_border.golden_test_vsmall_medium.png'),
      skip: !Platform.isLinux,
    );
  });

  testWidgets('Golden test large radii', (WidgetTester tester) async {
    await tester.pumpWidget(
      RepaintBoundary(
        child: Container(
          alignment: Alignment.center,
          child: Material(
            color: Colors.blueAccent[400],
            shape: const SquircleStadiumBorder(),
            child: const SizedBox(
              height: 200,
              width: 400,
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await expectLater(
      find.byType(RepaintBoundary),
      matchesGoldenFile(
          'continuous_stadium_border.golden_test_large_large.png'),
      skip: !Platform.isLinux,
    );
  });

  testWidgets('Golden test large radii vertical alignment',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      RepaintBoundary(
        child: Container(
          alignment: Alignment.center,
          child: Material(
            color: Colors.blueAccent[400],
            shape: const SquircleStadiumBorder(),
            child: const SizedBox(
              height: 400,
              width: 200,
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await expectLater(
      find.byType(RepaintBoundary),
      matchesGoldenFile(
          'continuous_stadium_border.golden_test_large_large_vertical.png'),
      skip: !Platform.isLinux,
    );
  });

  testWidgets('Golden test equal dimensions', (WidgetTester tester) async {
    await tester.pumpWidget(
      RepaintBoundary(
        child: Container(
          alignment: Alignment.center,
          child: Material(
            color: Colors.blueAccent[400],
            shape: const SquircleStadiumBorder(),
            child: const SizedBox(
              height: 200,
              width: 200,
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await expectLater(
      find.byType(RepaintBoundary),
      matchesGoldenFile(
          'continuous_stadium_border.golden_test_equal_dimensions.png'),
      skip: !Platform.isLinux,
    );
  });

  testWidgets('Golden test small border', (WidgetTester tester) async {
    await tester.pumpWidget(
      RepaintBoundary(
        child: Container(
          alignment: Alignment.center,
          child: Material(
            color: Colors.blueAccent[400],
            shape: const SquircleStadiumBorder(
              side: BorderSide(
                width: 30.0,
                color: Colors.pink,
              ),
            ),
            child: const SizedBox(
              height: 200,
              width: 200,
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await expectLater(
      find.byType(RepaintBoundary),
      matchesGoldenFile(
          'continuous_stadium_border.golden_test_small_border.png'),
      skip: !Platform.isLinux,
    );
  });

  testWidgets('Golden test large border', (WidgetTester tester) async {
    await tester.pumpWidget(
      RepaintBoundary(
        child: Container(
          alignment: Alignment.center,
          child: Material(
            color: Colors.blueAccent[400],
            shape: const SquircleStadiumBorder(
              side: BorderSide(
                width: 150.0,
                color: Colors.pink,
              ),
            ),
            child: const SizedBox(
              height: 200,
              width: 200,
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await expectLater(
      find.byType(RepaintBoundary),
      matchesGoldenFile(
          'continuous_stadium_border.golden_test_large_border.png'),
      skip: !Platform.isLinux,
    );
  });
}
