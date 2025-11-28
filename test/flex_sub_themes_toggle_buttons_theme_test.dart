import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flex_color_scheme/src/flex_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: deprecated_member_use_from_same_package, for tests.

void main() {
  group('WITH: FlexSubThemes.toggleButtonsTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes ToggleButtons tests
    // -------------------------------------------------------------------------
    test(
        'ToggleButtons FST34.1: GIVEN a default '
        'FlexSubTheme.toggleButtonsTheme() EXPECT '
        'equal to ToggleButtonsThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      final VisualDensity visualDensity = VisualDensity.adaptivePlatformDensity;
      expect(
        FlexSubThemes.toggleButtonsTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ),
        equals(
          ToggleButtonsThemeData(
            borderWidth: 1,
            selectedColor: colorScheme.onPrimary,
            color: colorScheme.primary,
            fillColor: colorScheme.primary,
            borderColor: colorScheme.primary,
            selectedBorderColor: colorScheme.primary,
            hoverColor: colorScheme.primary.withAlpha(kAlphaHovered),
            focusColor: colorScheme.primary.withAlpha(kAlphaFocused),
            highlightColor: colorScheme.primary.withAlpha(kAlphaHighlight),
            splashColor: colorScheme.primary.withAlpha(kAlphaSplash),
            disabledColor: colorScheme.onSurface.withAlpha(kAlphaDisabled),
            disabledBorderColor: colorScheme.onSurface.withAlpha(
              kAlphaVeryLowDisabled,
            ),
            borderRadius: BorderRadius.circular(40),
            constraints: BoxConstraints(
              minWidth: 40 - 1 * 2 + visualDensity.baseSizeAdjustment.dx,
              minHeight: 40 - 1 * 2 + visualDensity.baseSizeAdjustment.dy,
            ),
          ),
        ),
      );
    });
    test(
        'ToggleButtons FST34.2 base-color: GIVEN a default '
        'FlexSubTheme.toggleButtonsTheme() '
        'EXPECT '
        'equal to ToggleButtonsThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      final VisualDensity visualDensity = VisualDensity.adaptivePlatformDensity;
      expect(
        FlexSubThemes.toggleButtonsTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          borderWidth: 2,
          useMaterial3: false,
        ),
        equals(
          ToggleButtonsThemeData(
            borderWidth: 2,
            selectedColor: colorScheme.onSecondary,
            color: colorScheme.secondary,
            fillColor: colorScheme.secondary,
            borderColor: colorScheme.secondary,
            selectedBorderColor: colorScheme.secondary,
            hoverColor: colorScheme.secondary.withAlpha(kAlphaHovered),
            focusColor: colorScheme.secondary.withAlpha(kAlphaFocused),
            highlightColor: colorScheme.secondary.withAlpha(kAlphaHighlight),
            splashColor: colorScheme.secondary.withAlpha(kAlphaSplash),
            disabledColor: colorScheme.onSurface.withAlpha(kAlphaDisabled),
            disabledBorderColor: colorScheme.onSurface.withAlpha(
              kAlphaVeryLowDisabled,
            ),
            borderRadius: BorderRadius.circular(40),
            constraints: BoxConstraints(
              minWidth: 40 - 2 * 2 + visualDensity.baseSizeAdjustment.dx,
              minHeight: 40 - 2 * 2 + visualDensity.baseSizeAdjustment.dy,
            ),
          ),
        ),
      );
    });
    test(
        'ToggleButtons FST34.3 M3-base-color: GIVEN a tinted interact disable '
        'and default M3 outline border FlexSubTheme.toggleButtonsTheme() '
        'EXPECT '
        'equal to ToggleButtonsThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      final VisualDensity visualDensity = VisualDensity.adaptivePlatformDensity;
      final Color overlay = colorScheme.surface;
      final Color tint = colorScheme.secondary;
      expect(
        FlexSubThemes.toggleButtonsTheme(
          colorScheme: colorScheme,
          radius: 14,
          baseSchemeColor: SchemeColor.secondary,
          unselectedSchemeColor: SchemeColor.error,
          useTintedDisable: true,
          useTintedInteraction: true,
          useMaterial3: true,
        ),
        equals(
          ToggleButtonsThemeData(
            borderWidth: 1,
            selectedColor: colorScheme.onSecondary,
            color: colorScheme.error,
            fillColor: colorScheme.secondary,
            borderColor: colorScheme.outline,
            selectedBorderColor: colorScheme.outline,
            hoverColor: FlexSubThemes.tintedHovered(overlay, tint, 2),
            focusColor: FlexSubThemes.tintedFocused(overlay, tint, 2),
            highlightColor: FlexSubThemes.tintedHighlight(overlay, tint, 2),
            splashColor: FlexSubThemes.tintedSplash(overlay, tint, 2),
            disabledColor: FlexSubThemes.tintedDisable(
              colorScheme.onSurface,
              tint,
            ).withAlpha(kAlphaLowDisabled),
            disabledBorderColor: FlexSubThemes.tintedDisable(
              colorScheme.onSurface,
              colorScheme.outline,
            ).withAlpha(kAlphaLowDisabled),
            borderRadius: BorderRadius.circular(14),
            constraints: BoxConstraints(
              minWidth: 40 - 1 * 2 + visualDensity.baseSizeAdjustment.dx,
              minHeight: 40 - 1 * 2 + visualDensity.baseSizeAdjustment.dy,
            ),
          ),
        ),
      );
    });
    test(
        'ToggleButtons FST34.4 M3-base-color: GIVEN a tinted interact disable '
        'FlexSubTheme.toggleButtonsTheme() '
        'EXPECT '
        'equal to ToggleButtonsThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      final VisualDensity visualDensity = VisualDensity.adaptivePlatformDensity;
      final Color overlay = colorScheme.surface;
      final Color tint = colorScheme.secondary;
      expect(
        FlexSubThemes.toggleButtonsTheme(
          colorScheme: colorScheme,
          radius: 16,
          borderWidth: 1.5,
          baseSchemeColor: SchemeColor.secondary,
          selectedForegroundSchemeColor: SchemeColor.secondaryContainer,
          unselectedSchemeColor: SchemeColor.tertiary,
          borderSchemeColor: SchemeColor.error,
          useTintedDisable: true,
          useTintedInteraction: true,
          useMaterial3: true,
        ),
        equals(
          ToggleButtonsThemeData(
            borderWidth: 1.5,
            selectedColor: colorScheme.secondaryContainer,
            color: colorScheme.tertiary,
            fillColor: colorScheme.secondary,
            borderColor: colorScheme.error,
            selectedBorderColor: colorScheme.error,
            hoverColor: FlexSubThemes.tintedHovered(overlay, tint, 2),
            focusColor: FlexSubThemes.tintedFocused(overlay, tint, 2),
            highlightColor: FlexSubThemes.tintedHighlight(overlay, tint, 2),
            splashColor: FlexSubThemes.tintedSplash(overlay, tint, 2),
            disabledColor: FlexSubThemes.tintedDisable(
              colorScheme.onSurface,
              tint,
            ).withAlpha(kAlphaLowDisabled),
            disabledBorderColor: FlexSubThemes.tintedDisable(
              colorScheme.onSurface,
              colorScheme.error,
            ).withAlpha(kAlphaLowDisabled),
            borderRadius: BorderRadius.circular(16),
            constraints: BoxConstraints(
              minWidth: 40 - 1.5 * 2 + visualDensity.baseSizeAdjustment.dx,
              minHeight: 40 - 1.5 * 2 + visualDensity.baseSizeAdjustment.dy,
            ),
          ),
        ),
      );
    });
  });
}
