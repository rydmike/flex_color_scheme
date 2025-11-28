import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: deprecated_member_use_from_same_package, for tests.

void main() {
  group('WITH: FlexSubThemes.progressIndicatorTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes progressIndicatorTheme tests
    // -------------------------------------------------------------------------
    test(
        'ProgressIndicator FST25PI.1: GIVEN a default '
        'FlexSubTheme.progressIndicatorTheme() '
        'ProgressIndicatorThemeData with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      final ProgressIndicatorThemeData progressTheme =
          FlexSubThemes.progressIndicatorTheme(
        colorScheme: colorScheme,
      );
      expect(
        progressTheme,
        equals(
          ProgressIndicatorThemeData(
            stopIndicatorColor: colorScheme.primary,
          ),
        ),
      );
    });
    test(
        'ProgressIndicator FST25PI.2: GIVEN a custom '
        'FlexSubTheme.progressIndicatorTheme() '
        'ProgressIndicatorThemeData with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      final ProgressIndicatorThemeData progressTheme =
          FlexSubThemes.progressIndicatorTheme(
        colorScheme: colorScheme,
        baseSchemeColor: SchemeColor.secondary,
        linearTrackSchemeColor: SchemeColor.onSecondaryContainer,
        linearMinHeight: 6,
        circularTrackSchemeColor: SchemeColor.tertiary,
        refreshBackgroundSchemeColor: SchemeColor.surfaceContainerLow,
        linearRadius: 4,
        stopIndicatorSchemeColor: SchemeColor.primaryFixed,
        stopIndicatorRadius: 5,
        strokeWidth: 8,
        strokeAlign: 1.0,
        strokeCap: StrokeCap.round,
        constraints: const BoxConstraints(minWidth: 45.0, minHeight: 45.0),
        trackGap: 7,
        circularTrackPadding: const EdgeInsets.all(3.0),
        year2023: false,
      );
      expect(
        progressTheme,
        equals(
          ProgressIndicatorThemeData(
            color: colorScheme.secondary,
            linearTrackColor: colorScheme.onSecondaryContainer,
            linearMinHeight: 6,
            circularTrackColor: colorScheme.tertiary,
            refreshBackgroundColor: colorScheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(4.0),
            stopIndicatorColor: colorScheme.primaryFixed,
            stopIndicatorRadius: 5,
            strokeWidth: 8,
            strokeAlign: CircularProgressIndicator.strokeAlignOutside,
            strokeCap: StrokeCap.round,
            constraints: const BoxConstraints(minWidth: 45.0, minHeight: 45.0),
            trackGap: 7,
            circularTrackPadding: const EdgeInsets.all(3.0),
            //
            // ignore: deprecated_member_use, required to use new M3 style
            year2023: false,
          ),
        ),
      );
    });
  });

}
