import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flex_color_scheme/src/flex_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: deprecated_member_use_from_same_package, for tests.

void main() {
  group('WITH: FlexSubThemes.filledButtonTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes FilledButton tests
    // -------------------------------------------------------------------------
    test(
        'FilledButton FST13.1 M2: GIVEN a default M2 '
        'FlexSubTheme.filledButtonTheme() '
        'EXPECT equal to FilledButtonThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.filledButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).toString(),
        equalsIgnoringHashCodes(
          FilledButtonThemeData(
            style: ButtonStyle(
              minimumSize: ButtonStyleButton.allOrNull<Size>(
                const Size(40, 40),
              ),
              shape: ButtonStyleButton.allOrNull<OutlinedBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
              ), // buttonShape,
            ),
          ).toString(),
        ),
      );
    });
    test(
        'FilledButton FST13.2 M2-base: GIVEN a custom '
        'FlexSubTheme.filledButtonTheme() '
        'EXPECT equal to FilledButtonThemeData() version with same color', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.filledButtonTheme(
          colorScheme: colorScheme,
          backgroundSchemeColor: SchemeColor.secondary,
          useMaterial3: false,
        ).toString(),
        equalsIgnoringHashCodes(
          FilledButtonThemeData(
            style: ButtonStyle(
              minimumSize: ButtonStyleButton.allOrNull<Size>(
                const Size(40, 40),
              ),
              shape: ButtonStyleButton.allOrNull<OutlinedBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
              ), // buttonShape,
              backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.disabled)) {
                  return colorScheme.onSurface.withValues(alpha: 0.38);
                }
                return colorScheme.secondary;
              }),
              foregroundColor: WidgetStateProperty.resolveWith<Color?>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.disabled)) {
                  return colorScheme.onSurface.withValues(alpha: 0.38);
                }
                return colorScheme.onSecondary;
              }),
              iconColor: WidgetStateProperty.resolveWith<Color?>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.disabled)) {
                  return colorScheme.onSurface.withValues(alpha: 0.38);
                }
                return colorScheme.onSecondary;
              }),
              // No custom Overlay unless tinted version is used!
              // Temp design due to:
              // https://github.com/flutter/flutter/issues/118063
              // overlayColor: WidgetStateProperty.resolveWith<Color?>(
              //   (Set<WidgetState> states) {
              //     if (states.contains(WidgetState.hovered)) {
              //       return colorScheme.onSecondary.withValues(alpha: 0.08);
              //     }
              //     if (states.contains(WidgetState.focused)) {
              //       return colorScheme.onSecondary.withValues(alpha: 0.12);
              //     }
              //     if (states.contains(WidgetState.pressed)) {
              //       return colorScheme.onSecondary.withValues(alpha: 0.12);
              //     }
              //     return null;
              //   },
              // ),
            ),
          ).toString(),
        ),
      );
    });
    test(
        'FilledButton FST13.3 M3: GIVEN a default M3 '
        'FlexSubTheme.filledButtonTheme() '
        'EXPECT equal to FilledButtonThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF7142E7),
        brightness: Brightness.light,
      );
      expect(
        FlexSubThemes.filledButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          const FilledButtonThemeData(
            style: ButtonStyle(),
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'FilledButton FST13.4 M2-states: Does FilledButton '
        'have right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF7142E7),
        brightness: Brightness.light,
      );
      final FilledButtonThemeData button = FlexSubThemes.filledButtonTheme(
        colorScheme: colorScheme,
        backgroundSchemeColor: SchemeColor.primary,
        useTintedInteraction: true,
      );
      // Disabled colors
      expect(
        button.style!.backgroundColor!.resolve(<WidgetState>{
          WidgetState.disabled,
        }),
        isSameColorAs(colorScheme.onSurface.withValues(alpha: 0.12)),
      );
      expect(
        button.style!.foregroundColor!.resolve(<WidgetState>{
          WidgetState.disabled,
        }),
        isSameColorAs(colorScheme.onSurface.withValues(alpha: 0.38)),
      );
      // Default state
      expect(
        button.style!.backgroundColor!.resolve(<WidgetState>{}),
        isSameColorAs(colorScheme.primary),
      );
      expect(
        button.style!.foregroundColor!.resolve(<WidgetState>{}),
        isSameColorAs(colorScheme.onPrimary),
      );
      // No custom Overlay unless tinted version is used!
      // Temp design due to: https://github.com/flutter/flutter/issues/118063
      // // Overlay color states
      // expect(
      //   button.style!.overlayColor!
      //       .resolve(<WidgetState>{WidgetState.hovered}),
      //   equals(colorScheme.onPrimary.withValues(alpha: 0.08)),
      // );
      // expect(
      //   button.style!.overlayColor!
      //       .resolve(<WidgetState>{WidgetState.focused}),
      //   equals(colorScheme.onPrimary.withValues(alpha: 0.12)),
      // );
      // expect(
      //   button.style?.overlayColor!
      //       .resolve(<WidgetState>{WidgetState.pressed}),
      //   equals(colorScheme.onPrimary.withValues(alpha: 0.12)),
      // );
      // expect(
      //   button.style!.overlayColor!
      //       .resolve(<WidgetState>{WidgetState.selected}),
      //   equals(null),
      // );
    });
    test(
        'FilledButton FST13.5 M2-tint-states: Does M2 '
        'FilledButton have right tinted material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF7142E7),
        brightness: Brightness.light,
      );
      final FilledButtonThemeData button = FlexSubThemes.filledButtonTheme(
        colorScheme: colorScheme,
        backgroundSchemeColor: SchemeColor.tertiary,
        useTintedDisable: true,
        useTintedInteraction: true,
      );
      final Color overlay = colorScheme.onTertiary;
      final Color tint = colorScheme.tertiary;
      // Disabled foreground/background,
      expect(
        button.style!.backgroundColor!.resolve(<WidgetState>{
          WidgetState.disabled,
        }),
        equals(
          FlexSubThemes.tintedDisable(
            colorScheme.onSurface,
            tint,
          ).withAlpha(kAlphaVeryLowDisabled),
        ),
      );
      expect(
        button.style!.foregroundColor!.resolve(<WidgetState>{
          WidgetState.disabled,
        }),
        equals(FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)),
      );
      expect(
        button.style!.iconColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)),
      );
      // Default state colors
      expect(
        button.style!.backgroundColor!.resolve(<WidgetState>{}),
        equals(colorScheme.tertiary),
      );
      expect(
        button.style!.foregroundColor!.resolve(<WidgetState>{}),
        equals(colorScheme.onTertiary),
      );
      expect(
        button.style!.iconColor!.resolve(<WidgetState>{}),
        equals(colorScheme.onTertiary),
      );
      // Overlay color states
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(FlexSubThemes.tintedHovered(overlay, tint, 5.0)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        equals(FlexSubThemes.tintedFocused(overlay, tint, 5.0)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(FlexSubThemes.tintedPressed(overlay, tint, 5.0)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{
          WidgetState.selected,
        }),
        equals(null),
      );
    });
    test(
        'FilledButton FST13.6 M3-states: Does '
        'FilledButton have right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      final FilledButtonThemeData button = FlexSubThemes.filledButtonTheme(
        colorScheme: colorScheme,
        backgroundSchemeColor: SchemeColor.primary,
        radius: 15,
        useMaterial3: true,
      );
      // Disabled colors
      expect(
        button.style!.backgroundColor!.resolve(<WidgetState>{
          WidgetState.disabled,
        }),
        isSameColorAs(colorScheme.onSurface.withValues(alpha: 0.12)),
      );
      expect(
        button.style!.foregroundColor!.resolve(<WidgetState>{
          WidgetState.disabled,
        }),
        isSameColorAs(colorScheme.onSurface.withValues(alpha: 0.38)),
      );
      expect(
        button.style!.iconColor!.resolve(<WidgetState>{WidgetState.disabled}),
        isSameColorAs(colorScheme.onSurface.withValues(alpha: 0.38)),
      );
      // Default state
      expect(
        button.style!.backgroundColor!.resolve(<WidgetState>{}),
        isSameColorAs(colorScheme.primary),
      );
      expect(
        button.style!.foregroundColor!.resolve(<WidgetState>{}),
        isSameColorAs(colorScheme.onPrimary),
      );
      expect(
        button.style!.iconColor!.resolve(<WidgetState>{}),
        isSameColorAs(colorScheme.onPrimary),
      );
      // No custom Overlay unless tinted version is used!
      // Temp design due to: https://github.com/flutter/flutter/issues/118063
      // // Overlay color states
      // expect(
      //   button.style!.overlayColor!
      //       .resolve(<WidgetState>{WidgetState.hovered}),
      //   equals(colorScheme.onPrimary.withValues(alpha: 0.08)),
      // );
      // expect(
      //   button.style!.overlayColor!
      //       .resolve(<WidgetState>{WidgetState.focused}),
      //   equals(colorScheme.onPrimary.withValues(alpha: 0.12)),
      // );
      // expect(
      //   button.style!.overlayColor!
      //       .resolve(<WidgetState>{WidgetState.pressed}),
      //   equals(colorScheme.onPrimary.withValues(alpha: 0.12)),
      // );
      // expect(
      //   button.style!.overlayColor!
      //       .resolve(<WidgetState>{WidgetState.selected}),
      //   equals(null),
      // );
      // Custom shape test
      expect(
        button.style!.shape!.resolve(<WidgetState>{}),
        equals(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
      );
    });
    test(
        'FilledButton FST13.7 M3-custom-tint-states: Does '
        'FilledButton have right material tinted states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      final FilledButtonThemeData button = FlexSubThemes.filledButtonTheme(
        colorScheme: colorScheme,
        backgroundSchemeColor: SchemeColor.tertiary,
        radius: 5,
        useTintedDisable: true,
        useTintedInteraction: true,
      );
      final Color overlay = colorScheme.onTertiary;
      final Color tint = colorScheme.tertiary;
      // Disabled foreground/background,
      expect(
        button.style!.backgroundColor!.resolve(<WidgetState>{
          WidgetState.disabled,
        }),
        equals(
          FlexSubThemes.tintedDisable(
            colorScheme.onSurface,
            tint,
          ).withAlpha(kAlphaVeryLowDisabled),
        ),
      );
      expect(
        button.style!.foregroundColor!.resolve(<WidgetState>{
          WidgetState.disabled,
        }),
        equals(FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)),
      );
      expect(
        button.style!.iconColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)),
      );
      // Default state colors
      expect(
        button.style!.backgroundColor!.resolve(<WidgetState>{}),
        equals(colorScheme.tertiary),
      );
      expect(
        button.style!.foregroundColor!.resolve(<WidgetState>{}),
        equals(colorScheme.onTertiary),
      );
      expect(
        button.style!.iconColor!.resolve(<WidgetState>{}),
        equals(colorScheme.onTertiary),
      );
      // Overlay color states
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(FlexSubThemes.tintedHovered(overlay, tint, 5.0)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        equals(FlexSubThemes.tintedFocused(overlay, tint, 5.0)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(FlexSubThemes.tintedPressed(overlay, tint, 5.0)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{
          WidgetState.selected,
        }),
        equals(null),
      );
      // Custom shape test
      expect(
        button.style!.shape!.resolve(<WidgetState>{}),
        equals(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
      );
    });
    test(
        'FilledButton FST13.8 M3-custom-tint-states: Does '
        'FilledButton have right material tinted states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.dark,
      );
      final FilledButtonThemeData button = FlexSubThemes.filledButtonTheme(
        colorScheme: colorScheme,
        backgroundSchemeColor: SchemeColor.tertiary,
        radius: 5,
        useTintedDisable: true,
        useTintedInteraction: true,
      );
      final Color overlay = colorScheme.onTertiary;
      final Color tint = colorScheme.tertiary;
      // Disabled foreground/background,
      expect(
        button.style!.backgroundColor!.resolve(<WidgetState>{
          WidgetState.disabled,
        }),
        equals(
          FlexSubThemes.tintedDisable(
            colorScheme.onSurface,
            tint,
          ).withAlpha(kAlphaVeryLowDisabled),
        ),
      );
      expect(
        button.style!.foregroundColor!.resolve(<WidgetState>{
          WidgetState.disabled,
        }),
        equals(FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)),
      );
      expect(
        button.style!.iconColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)),
      );
      // Default state colors
      expect(
        button.style!.backgroundColor!.resolve(<WidgetState>{}),
        equals(colorScheme.tertiary),
      );
      expect(
        button.style!.foregroundColor!.resolve(<WidgetState>{}),
        equals(colorScheme.onTertiary),
      );
      expect(
        button.style!.iconColor!.resolve(<WidgetState>{}),
        equals(colorScheme.onTertiary),
      );
      // Overlay color states
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(FlexSubThemes.tintedHovered(overlay, tint, 4.0)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        equals(FlexSubThemes.tintedFocused(overlay, tint, 4.0)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(FlexSubThemes.tintedPressed(overlay, tint, 4.0)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{
          WidgetState.selected,
        }),
        equals(null),
      );
      // Custom shape test
      expect(
        button.style!.shape!.resolve(<WidgetState>{}),
        equals(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
      );
    });
    test(
        'FilledButton FST13.9 M3-custom-disable-states: Does '
        'FilledButton have right material disabled when tinted disabled '
        'used on default null color', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.dark,
      );
      final FilledButtonThemeData button = FlexSubThemes.filledButtonTheme(
        colorScheme: colorScheme,
        useTintedDisable: true,
      );
      final Color tint = colorScheme.primary;
      // Disabled foreground/background,
      expect(
        button.style!.backgroundColor!.resolve(<WidgetState>{
          WidgetState.disabled,
        }),
        equals(
          FlexSubThemes.tintedDisable(
            colorScheme.onSurface,
            tint,
          ).withAlpha(kAlphaVeryLowDisabled),
        ),
      );
      expect(
        button.style!.foregroundColor!.resolve(<WidgetState>{
          WidgetState.disabled,
        }),
        equals(FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)),
      );
      expect(
        button.style!.iconColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)),
      );
    });
  });
}
