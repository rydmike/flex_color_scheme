import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flex_color_scheme/src/flex_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: deprecated_member_use_from_same_package, for tests.

void main() {
  group('WITH: FlexSubThemes.radioTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes Radio tests
    // -------------------------------------------------------------------------
    test(
        'Radio FST25.1 light: GIVEN a light default FlexSubTheme.radioTheme() '
        'EXPECT equal to RadioThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      );
      expect(
        FlexSubThemes.radioTheme(colorScheme: colorScheme).toString(),
        equalsIgnoringHashCodes(
          RadioThemeData(
            fillColor: WidgetStateProperty.resolveWith<Color>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.disabled)) {
                return Colors.grey.shade400;
              }
              if (states.contains(WidgetState.selected)) {
                return colorScheme.primary;
              }
              // Opinionated color on track when not selected
              return colorScheme.primary.withAlpha(0xDD);
            }),
            overlayColor: WidgetStateProperty.resolveWith<Color>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.selected)) {
                if (states.contains(WidgetState.pressed)) {
                  return colorScheme.onSurface.withValues(alpha: 0.12);
                }
                if (states.contains(WidgetState.hovered)) {
                  return colorScheme.primary.withValues(alpha: 0.08);
                }
                if (states.contains(WidgetState.focused)) {
                  return colorScheme.primary.withValues(alpha: 0.12);
                }
                return Colors.transparent;
              }
              if (states.contains(WidgetState.pressed)) {
                return colorScheme.primary.withValues(alpha: 0.12);
              }
              if (states.contains(WidgetState.hovered)) {
                return colorScheme.onSurface.withValues(alpha: 0.08);
              }
              if (states.contains(WidgetState.focused)) {
                return colorScheme.onSurface.withValues(alpha: 0.12);
              }
              return Colors.transparent;
            }),
          ).toString(),
        ),
      );
    });
    test(
        'Radio FST25.2 light-states: Does Radio '
        'have right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      );
      // Disabled colors
      expect(
        FlexSubThemes.radioTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).fillColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(Colors.grey.shade400),
      );
      // Selected radio fill
      expect(
        FlexSubThemes.radioTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).fillColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.primary),
      );
      // Default states
      expect(
        FlexSubThemes.radioTheme(
          colorScheme: colorScheme,
          unselectedIsColored: true,
          useMaterial3: false,
        ).fillColor!.resolve(<WidgetState>{}),
        equals(colorScheme.primary.withAlpha(0xDD)),
      );
      // Default state for trackColor when unselectedIsColored, is false
      expect(
        FlexSubThemes.radioTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
          // unselectedIsColored: false,  <- False by default
        ).fillColor!.resolve(<WidgetState>{}),
        equals(Colors.black54),
      );
    });

    test(
        'Radio FST25.3 dark: GIVEN a dark default FlexSubTheme.radioTheme() '
        'EXPECT equal to RadioThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.dark,
      );
      expect(
        FlexSubThemes.radioTheme(colorScheme: colorScheme).toString(),
        equalsIgnoringHashCodes(
          RadioThemeData(
            fillColor: WidgetStateProperty.resolveWith<Color>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.disabled)) {
                return Colors.grey.shade800;
              }
              if (states.contains(WidgetState.selected)) {
                return colorScheme.primary;
              }
              // Opinionated color on track when not selected
              return colorScheme.primary.withAlpha(0xDD);
            }),
            overlayColor: WidgetStateProperty.resolveWith<Color>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.selected)) {
                if (states.contains(WidgetState.pressed)) {
                  return colorScheme.onSurface.withValues(alpha: 0.12);
                }
                if (states.contains(WidgetState.hovered)) {
                  return colorScheme.primary.withValues(alpha: 0.08);
                }
                if (states.contains(WidgetState.focused)) {
                  return colorScheme.primary.withValues(alpha: 0.12);
                }
                return Colors.transparent;
              }
              if (states.contains(WidgetState.pressed)) {
                return colorScheme.primary.withValues(alpha: 0.12);
              }
              if (states.contains(WidgetState.hovered)) {
                return colorScheme.onSurface.withValues(alpha: 0.08);
              }
              if (states.contains(WidgetState.focused)) {
                return colorScheme.onSurface.withValues(alpha: 0.12);
              }
              return Colors.transparent;
            }),
          ).toString(),
        ),
      );
    });
    test(
        'Radio FST25.4 dark-states: Does '
        'Radio have right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.dark,
      );
      // Disabled colors
      expect(
        FlexSubThemes.radioTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).fillColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(Colors.grey.shade800),
      );
      // Selected radio fill
      expect(
        FlexSubThemes.radioTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).fillColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.primary),
      );
      // Default states
      expect(
        FlexSubThemes.radioTheme(
          colorScheme: colorScheme,
          unselectedIsColored: true,
          useMaterial3: false,
        ).fillColor!.resolve(<WidgetState>{}),
        equals(colorScheme.primary.withAlpha(0xDD)),
      );
      // Default state for fillColor when unselectedIsColored, is false
      expect(
        FlexSubThemes.radioTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
          // unselectedIsColored: false, <- False by default
        ).fillColor!.resolve(<WidgetState>{}),
        equals(Colors.white70),
      );
    });
    test(
        'Radio FST25.5 custom-light: GIVEN a light custom '
        'FlexSubTheme.radioTheme() '
        'EXPECT equal to RadioThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      );
      expect(
        FlexSubThemes.radioTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          splashRadius: 30,
          unselectedIsColored: false,
        ).toString(),
        equalsIgnoringHashCodes(
          RadioThemeData(
            splashRadius: 30,
            fillColor: WidgetStateProperty.resolveWith<Color>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.disabled)) {
                return Colors.grey.shade400;
              }
              if (states.contains(WidgetState.selected)) {
                return colorScheme.tertiary;
              }
              return Colors.black54;
            }),
            overlayColor: WidgetStateProperty.resolveWith<Color>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.selected)) {
                if (states.contains(WidgetState.pressed)) {
                  return colorScheme.onSurface.withValues(alpha: 0.12);
                }
                if (states.contains(WidgetState.hovered)) {
                  return colorScheme.primary.withValues(alpha: 0.08);
                }
                if (states.contains(WidgetState.focused)) {
                  return colorScheme.primary.withValues(alpha: 0.12);
                }
                return Colors.transparent;
              }
              if (states.contains(WidgetState.pressed)) {
                return colorScheme.primary.withValues(alpha: 0.12);
              }
              if (states.contains(WidgetState.hovered)) {
                return colorScheme.onSurface.withValues(alpha: 0.08);
              }
              if (states.contains(WidgetState.focused)) {
                return colorScheme.onSurface.withValues(alpha: 0.12);
              }
              return Colors.transparent;
            }),
          ).toString(),
        ),
      );
      // M2 tinted disable case.
      RadioThemeData m = FlexSubThemes.radioTheme(
        colorScheme: colorScheme,
        baseSchemeColor: SchemeColor.tertiary,
        splashRadius: 30,
        unselectedIsColored: false,
        useTintedDisable: true,
        useMaterial3: false,
      );
      expect(
        m.fillColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(
          FlexSubThemes.tintedDisable(
            colorScheme.onSurface,
            colorScheme.tertiary,
          ),
        ),
      );
      m = FlexSubThemes.radioTheme(
        colorScheme: colorScheme,
        baseSchemeColor: SchemeColor.tertiary,
        splashRadius: 25,
        unselectedIsColored: false,
        useTintedDisable: false,
        useMaterial3: true,
      );
      //
      // fillColor
      expect(
        m.fillColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.disabled,
        }),
        equals(colorScheme.onSurface.withAlpha(kAlphaDisabled)),
      );
      expect(
        m.fillColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.pressed,
        }),
        equals(colorScheme.tertiary),
      );
      expect(
        m.fillColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.hovered,
        }),
        equals(colorScheme.tertiary),
      );
      expect(
        m.fillColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.focused,
        }),
        equals(colorScheme.tertiary),
      );
      expect(
        m.fillColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.tertiary),
      );
      expect(
        m.fillColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(colorScheme.onSurface.withAlpha(kAlphaDisabled)),
      );
      expect(
        m.fillColor!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(colorScheme.onSurface),
      );
      expect(
        m.fillColor!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(colorScheme.onSurface),
      );
      expect(
        m.fillColor!.resolve(<WidgetState>{WidgetState.focused}),
        equals(colorScheme.onSurface),
      );
      expect(
        m.fillColor!.resolve(<WidgetState>{}),
        equals(colorScheme.onSurfaceVariant),
      );
      //
      // overlayColor
      expect(
        m.overlayColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.pressed,
        }),
        equals(colorScheme.onSurface.withAlpha(kAlphaPressed)),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.hovered,
        }),
        equals(colorScheme.tertiary.withAlpha(kAlphaHovered)),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.focused,
        }),
        equals(colorScheme.tertiary.withAlpha(kAlphaFocused)),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(Colors.transparent),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(colorScheme.tertiary.withAlpha(kAlphaPressed)),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(colorScheme.onSurface.withAlpha(kAlphaHovered)),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        equals(colorScheme.onSurface.withAlpha(kAlphaFocused)),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{}),
        equals(Colors.transparent),
      );
      m = FlexSubThemes.radioTheme(
        colorScheme: colorScheme,
        baseSchemeColor: SchemeColor.tertiary,
        splashRadius: 25,
        unselectedIsColored: true,
        useTintedDisable: true,
        useTintedInteraction: true,
        useMaterial3: true,
      );
      //
      // fillColor
      expect(
        m.fillColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.disabled,
        }),
        equals(
          FlexSubThemes.tintedDisable(
            colorScheme.onSurface,
            colorScheme.tertiary,
          ),
        ),
      );
      expect(
        m.fillColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(
          FlexSubThemes.tintedDisable(
            colorScheme.onSurface,
            colorScheme.tertiary,
          ),
        ),
      );
      expect(
        m.fillColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.pressed,
        }),
        equals(colorScheme.tertiary),
      );
      expect(
        m.fillColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.hovered,
        }),
        equals(colorScheme.tertiary),
      );
      expect(
        m.fillColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.focused,
        }),
        equals(colorScheme.tertiary),
      );
      expect(
        m.fillColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.tertiary),
      );
      expect(
        m.fillColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(
          FlexSubThemes.tintedDisable(
            colorScheme.onSurface,
            colorScheme.tertiary,
          ),
        ),
      );
      expect(
        m.fillColor!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(colorScheme.tertiary.withAlpha(kAlphaUnselect)),
      );
      expect(
        m.fillColor!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(colorScheme.tertiary.withAlpha(kAlphaUnselect)),
      );
      expect(
        m.fillColor!.resolve(<WidgetState>{WidgetState.focused}),
        equals(colorScheme.tertiary.withAlpha(kAlphaUnselect)),
      );
      expect(
        m.fillColor!.resolve(<WidgetState>{}),
        equals(colorScheme.tertiary.withAlpha(kAlphaUnselect)),
      );
      //
      // overlayColor
      expect(
        m.overlayColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.pressed,
        }),
        equals(
          FlexSubThemes.tintedPressed(
            colorScheme.surface,
            colorScheme.tertiary,
            1.5,
          ),
        ),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.hovered,
        }),
        equals(
          FlexSubThemes.tintedHovered(
            colorScheme.surface,
            colorScheme.tertiary,
            1.5,
          ),
        ),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.focused,
        }),
        equals(
          FlexSubThemes.tintedFocused(
            colorScheme.surface,
            colorScheme.tertiary,
            1.5,
          ),
        ),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(Colors.transparent),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(
          FlexSubThemes.tintedPressed(
            colorScheme.surface,
            colorScheme.tertiary,
            1.5,
          ),
        ),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(
          FlexSubThemes.tintedHovered(
            colorScheme.surface,
            colorScheme.tertiary,
            1.5,
          ),
        ),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        equals(
          FlexSubThemes.tintedFocused(
            colorScheme.surface,
            colorScheme.tertiary,
            1.5,
          ),
        ),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{}),
        equals(Colors.transparent),
      );
    });
  });
}
