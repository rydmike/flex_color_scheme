import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flex_color_scheme/src/flex_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'helpers/tint_alpha_factor.dart';

// ignore_for_file: deprecated_member_use_from_same_package, for tests.

void main() {
  group('WITH: FlexSubThemes.searchBarTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes searchBarTheme tests
    // -------------------------------------------------------------------------
    test(
        'SearchBar FST25SB.1: GIVEN a default FlexSubTheme.searchBarTheme() '
        'SearchBarThemeData with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      final SearchBarThemeData searchBarTheme = FlexSubThemes.searchBarTheme(
        colorScheme: colorScheme,
      );
      final SearchBarThemeData m = SearchBarThemeData(
        elevation: const WidgetStatePropertyAll<double?>(null),
        shadowColor: const WidgetStatePropertyAll<Color?>(null),
        padding: const WidgetStatePropertyAll<EdgeInsetsGeometry?>(null),
        overlayColor: WidgetStateProperty.resolveWith((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.disabled)) {
            return colorScheme.onSurface.withAlpha(kAlphaUltraLowDisabled);
          }
          if (states.contains(WidgetState.pressed)) {
            return colorScheme.onSurface.withAlpha(kAlphaInputPressed);
          }
          if (states.contains(WidgetState.hovered)) {
            return colorScheme.onSurface.withAlpha(kAlphaHovered);
          }
          return Colors.transparent;
        }),
      );

      expect(
        searchBarTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(m.toString(minLevel: DiagnosticLevel.fine)),
      );
      //
      // overlayColor color
      expect(
        searchBarTheme.overlayColor?.resolve(<WidgetState>{
          WidgetState.disabled,
        }),
        equals(colorScheme.onSurface.withAlpha(kAlphaUltraLowDisabled)),
      );
      expect(
        searchBarTheme.overlayColor?.resolve(<WidgetState>{
          WidgetState.pressed,
        }),
        equals(colorScheme.onSurface.withAlpha(kAlphaInputPressed)),
      );
      expect(
        searchBarTheme.overlayColor?.resolve(<WidgetState>{
          WidgetState.hovered,
        }),
        equals(colorScheme.onSurface.withAlpha(kAlphaHovered)),
      );
      expect(
        searchBarTheme.overlayColor?.resolve(<WidgetState>{}),
        equals(Colors.transparent),
      );
    });
    test(
        'SearchBar FST25SB.2: GIVEN a custom FlexSubTheme.searchBarTheme() '
        'SearchBarThemeData with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );

      const bool tintDisable = true;
      const bool tintInteract = true;
      final SearchBarThemeData searchBarTheme = FlexSubThemes.searchBarTheme(
        colorScheme: colorScheme,
        backgroundSchemeColor: SchemeColor.surfaceContainer,
        shadowColor: colorScheme.shadow,
        elevation: 4,
        radius: 10,
        padding: const EdgeInsets.all(8),
        tintedDisabled: tintDisable,
        tintedInteractions: tintInteract,
        constraints: const BoxConstraints(
          minWidth: 400.0,
          maxWidth: 700.0,
          minHeight: 60.0,
        ),
      );

      final Color backgroundColor = colorScheme.surfaceContainer;
      final Color onBackgroundColor = colorScheme.onSurface;
      final bool isLight = colorScheme.brightness == Brightness.light;
      // Get brightness of the SearchBar background color.
      final bool buttonBgIsLight =
          ThemeData.estimateBrightnessForColor(backgroundColor) ==
              Brightness.light;
      // For tint color use the one that is more likely to give a colored effect
      final Color tint = isLight
          ? buttonBgIsLight
              ? onBackgroundColor
              : backgroundColor
          : buttonBgIsLight
              ? backgroundColor
              : onBackgroundColor;
      // The reverse color is used for overlay
      final Color overlay = isLight
          ? buttonBgIsLight
              ? backgroundColor
              : onBackgroundColor
          : buttonBgIsLight
              ? onBackgroundColor
              : backgroundColor;
      final bool surfaceMode =
          (isLight && buttonBgIsLight) || (!isLight && !buttonBgIsLight);
      final double factor = tintAlphaFactor(
        tint,
        colorScheme.brightness,
        surfaceMode,
      );

      final SearchBarThemeData m = SearchBarThemeData(
        backgroundColor: WidgetStatePropertyAll<Color?>(backgroundColor),
        elevation: const WidgetStatePropertyAll<double?>(4),
        shadowColor: WidgetStatePropertyAll<Color?>(colorScheme.shadow),
        shape: const WidgetStatePropertyAll<OutlinedBorder?>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        padding: const WidgetStatePropertyAll<EdgeInsetsGeometry?>(
          EdgeInsets.all(8),
        ),
        constraints: const BoxConstraints(
          minWidth: 400.0,
          maxWidth: 700.0,
          minHeight: 60.0,
        ),
        overlayColor: WidgetStateProperty.resolveWith((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.disabled)) {
            if (tintDisable) {
              return FlexSubThemes.tintedDisable(
                colorScheme.onSurface,
                backgroundColor,
              ).withAlpha(kAlphaUltraLowDisabled);
            }
          }
          if (states.contains(WidgetState.pressed)) {
            if (tintInteract) {
              return FlexSubThemes.tintedPressed(backgroundColor, tint, factor);
            }
          }
          if (states.contains(WidgetState.hovered)) {
            if (tintInteract) {
              return FlexSubThemes.tintedHovered(overlay, tint, factor);
            }
          }
          return Colors.transparent;
        }),
      );
      expect(
        searchBarTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(m.toString(minLevel: DiagnosticLevel.fine)),
      );
      //
      // overlayColor color
      expect(
        searchBarTheme.overlayColor?.resolve(<WidgetState>{
          WidgetState.disabled,
        }),
        equals(
          FlexSubThemes.tintedDisable(
            colorScheme.onSurface,
            backgroundColor,
          ).withAlpha(kAlphaUltraLowDisabled),
        ),
      );
      expect(
        searchBarTheme.overlayColor?.resolve(<WidgetState>{
          WidgetState.pressed,
        }),
        equals(FlexSubThemes.tintedPressed(backgroundColor, tint, factor)),
      );
      expect(
        searchBarTheme.overlayColor?.resolve(<WidgetState>{
          WidgetState.hovered,
        }),
        equals(FlexSubThemes.tintedHovered(overlay, tint, factor)),
      );
      expect(
        searchBarTheme.overlayColor?.resolve(<WidgetState>{}),
        equals(Colors.transparent),
      );
    });
  });
}
