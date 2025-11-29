import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flex_color_scheme/src/flex_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WITH: FlexSubThemes.buttonTheme ', () {
    // TODO(rydmike): Monitor Flutter SDK deprecation of ButtonThemeData.
    // -------------------------------------------------------------------------
    // FlexSubThemes old material buttons theme tests
    // -------------------------------------------------------------------------
    test(
        'ButtonTheme FST5.1: light GIVEN a default FlexSubTheme.buttonTheme() '
        'EXPECT equal to ButtonThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      final Color overlay = colorScheme.surface;
      final Color tint = colorScheme.primary;
      const double factor = 5.0;
      expect(
        FlexSubThemes.buttonTheme(
          colorScheme: colorScheme,
          useTintedInteraction: true,
          useTintedDisable: true,
        ),
        equals(
          ButtonThemeData(
            colorScheme: colorScheme,
            minWidth: 40,
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            layoutBehavior: ButtonBarLayoutBehavior.constrained,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            hoverColor: FlexSubThemes.tintedHovered(overlay, tint, factor),
            focusColor: FlexSubThemes.tintedFocused(overlay, tint, factor),
            highlightColor: FlexSubThemes.tintedHighlight(
              overlay,
              tint,
              factor,
            ),
            splashColor: FlexSubThemes.tintedSplash(overlay, tint, factor),
            disabledColor: FlexSubThemes.tintedDisable(
              colorScheme.onSurface,
              tint,
            ).withAlpha(kAlphaLowDisabled),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(40)),
            ),
            textTheme: ButtonTextTheme.primary,
          ),
        ),
      );
    });
    test(
        'ButtonTheme FST5.2: dark GIVEN a custom FlexSubTheme.buttonTheme() '
        'EXPECT equal to ButtonThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.dark,
      );
      final Color overlay = colorScheme.surface;
      final Color tint = colorScheme.primary;
      const double factor = 4.0;
      expect(
        FlexSubThemes.buttonTheme(
          colorScheme: colorScheme,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          minButtonSize: const Size(45, 44),
          radius: 10,
          useTintedInteraction: true,
          useTintedDisable: true,
        ),
        equals(
          ButtonThemeData(
            colorScheme: colorScheme,
            minWidth: 45,
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            layoutBehavior: ButtonBarLayoutBehavior.constrained,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            hoverColor: FlexSubThemes.tintedHovered(overlay, tint, factor),
            focusColor: FlexSubThemes.tintedFocused(overlay, tint, factor),
            highlightColor: FlexSubThemes.tintedHighlight(
              overlay,
              tint,
              factor,
            ),
            splashColor: FlexSubThemes.tintedSplash(overlay, tint, factor),
            disabledColor: FlexSubThemes.tintedDisable(
              colorScheme.onSurface,
              tint,
            ).withAlpha(kAlphaLowDisabled),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            textTheme: ButtonTextTheme.primary,
          ),
        ),
      );
    });
    test(
        'ButtonTheme FST5.3 base-color: GIVEN a default '
        'FlexSubTheme.buttonTheme() '
        'EXPECT equal to ButtonThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      final Color overlay = colorScheme.surface;
      final Color tint = colorScheme.secondary;
      const double factor = 5.0;
      expect(
        FlexSubThemes.buttonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          useTintedInteraction: true,
          useTintedDisable: true,
        ),
        equals(
          ButtonThemeData(
            colorScheme: colorScheme,
            minWidth: 40,
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            layoutBehavior: ButtonBarLayoutBehavior.constrained,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            hoverColor: FlexSubThemes.tintedHovered(overlay, tint, factor),
            focusColor: FlexSubThemes.tintedFocused(overlay, tint, factor),
            highlightColor: FlexSubThemes.tintedHighlight(
              overlay,
              tint,
              factor,
            ),
            splashColor: FlexSubThemes.tintedSplash(overlay, tint, factor),
            disabledColor: FlexSubThemes.tintedDisable(
              colorScheme.onSurface,
              tint,
            ).withAlpha(kAlphaLowDisabled),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(40)),
            ),
            textTheme: ButtonTextTheme.primary,
          ),
        ),
      );
    });
  });
}
