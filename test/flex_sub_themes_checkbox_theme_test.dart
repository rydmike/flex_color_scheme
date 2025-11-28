import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flex_color_scheme/src/flex_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WITH: FlexSubThemes.checkboxTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes Checkbox tests
    // -------------------------------------------------------------------------
    test(
        'Checkbox FST7.1 light: GIVEN a light default M2 '
        'FlexSubTheme.checkboxTheme() '
        'EXPECT equal to CheckboxThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      );
      expect(
        FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).toString(),
        equalsIgnoringHashCodes(
          CheckboxThemeData(
            side: WidgetStateBorderSide.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                if (states.contains(WidgetState.selected)) {
                  return const BorderSide(
                    width: 2.0,
                    color: Colors.transparent,
                  );
                }
                return BorderSide(
                  width: 2.0,
                  color: colorScheme.onSurface.withAlpha(kAlphaDisabled),
                );
              }
              if (states.contains(WidgetState.selected)) {
                return const BorderSide(width: 0.0, color: Colors.transparent);
              }
              // This is M2 SDK default.
              return const BorderSide(width: 2.0, color: Colors.black54);
            }),
            fillColor: WidgetStateProperty.resolveWith<Color>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.disabled)) {
                if (states.contains(WidgetState.selected)) {
                  return Colors.grey.shade400;
                }
              }
              if (states.contains(WidgetState.selected)) {
                return colorScheme.primary;
              }
              return Colors.transparent;
            }),
            checkColor: WidgetStateProperty.resolveWith<Color>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.disabled)) {
                return Colors.grey.shade200;
              }
              if (states.contains(WidgetState.selected)) {
                return colorScheme.onPrimary;
              }
              return Colors.grey.shade50;
            }),
            overlayColor: WidgetStateProperty<Color>.fromMap(
              <WidgetStatesConstraint, Color>{
                WidgetState.selected & WidgetState.pressed:
                    colorScheme.onSurface.withAlpha(kAlphaPressed),
                WidgetState.selected & WidgetState.hovered:
                    colorScheme.primary.withAlpha(kAlphaHovered),
                WidgetState.selected & WidgetState.focused:
                    colorScheme.primary.withAlpha(kAlphaFocused),
                WidgetState.pressed:
                    colorScheme.primary.withAlpha(kAlphaPressed),
                WidgetState.hovered:
                    colorScheme.onSurface.withAlpha(kAlphaHovered),
                WidgetState.focused:
                    colorScheme.onSurface.withAlpha(kAlphaFocused),
                WidgetState.any: Colors.transparent,
              },
            ),
          ).toString(),
        ),
      );
    });
    test(
        'Checkbox FST7.2 light-states: Does '
        'Checkbox M2 have right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      );
      // Side states in M2.
      //
      // Side: Disabled and selected
      expect(
        (FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).side as WidgetStateBorderSide?)!
            .resolve(<WidgetState>{WidgetState.disabled, WidgetState.selected}),
        equals(const BorderSide(width: 2.0, color: Colors.transparent)),
      );
      // Side: Disabled, tinted
      expect(
        (FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useTintedDisable: true,
          useMaterial3: false,
        ).side as WidgetStateBorderSide?)!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(
          BorderSide(
            width: 2.0,
            color: FlexSubThemes.tintedDisable(
              colorScheme.onSurface,
              colorScheme.primary,
            ),
          ),
        ),
      );
      // Side: disabled
      expect(
        (FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).side as WidgetStateBorderSide?)!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(
          BorderSide(
            width: 2.0,
            color: colorScheme.onSurface.withAlpha(kAlphaDisabled),
          ),
        ),
      );
      // Side: selected
      expect(
        (FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).side as WidgetStateBorderSide?)!
            .resolve(<WidgetState>{WidgetState.selected}),
        equals(const BorderSide(width: 2.0, color: Colors.transparent)),
      );
      // Side: default stated, tinted
      expect(
        (FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          unselectedIsColored: true,
          useMaterial3: false,
        ).side as WidgetStateBorderSide?)!
            .resolve(<WidgetState>{}),
        equals(BorderSide(width: 2.0, color: colorScheme.primary)),
      );
      // Side: default stated, tinted
      expect(
        (FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).side as WidgetStateBorderSide?)!
            .resolve(<WidgetState>{}),
        equals(const BorderSide(width: 2.0, color: Colors.black54)),
      );
      //
      // fillColor
      expect(
        FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).fillColor!.resolve(<WidgetState>{
          WidgetState.disabled,
          WidgetState.selected,
        }),
        equals(Colors.grey.shade400),
      );
      expect(
        FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).fillColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(Colors.transparent),
      );
      expect(
        FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).fillColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.primary),
      );
      expect(
        FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useTintedDisable: true,
          useMaterial3: false,
        ).fillColor!.resolve(<WidgetState>{
          WidgetState.disabled,
          WidgetState.selected,
        }),
        equals(
          FlexSubThemes.tintedDisable(
            colorScheme.onSurface,
            colorScheme.primary,
          ),
        ),
      );
      expect(
        FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          unselectedIsColored: true,
        ).fillColor!.resolve(<WidgetState>{}),
        equals(Colors.transparent),
      );
      //
      // Check color
      expect(
        FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).checkColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(Colors.grey.shade200),
      );
      expect(
        FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).checkColor!.resolve(<WidgetState>{}),
        equals(Colors.grey.shade50),
      );
      expect(
        FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).checkColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.onPrimary),
      );
    });
    //
    //
    test(
        'Checkbox FST7.3 light-M3-states: Does '
        'Checkbox have right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      );
      final CheckboxThemeData m = FlexSubThemes.checkboxTheme(
        colorScheme: colorScheme,
        useMaterial3: true,
      );
      final CheckboxThemeData m2 = FlexSubThemes.checkboxTheme(
        colorScheme: colorScheme,
        useMaterial3: true,
        useTintedDisable: true,
        useTintedInteraction: true,
        unselectedIsColored: true,
      );
      // Side states in M2.
      //
      // Side: Disabled and selected
      expect(
        (m.side as WidgetStateBorderSide?)!.resolve(<WidgetState>{
          WidgetState.disabled,
          WidgetState.selected,
        }),
        equals(const BorderSide(width: 2.0, color: Colors.transparent)),
      );
      // Side: Disabled, tinted
      expect(
        (m2.side as WidgetStateBorderSide?)!.resolve(<WidgetState>{
          WidgetState.disabled,
        }),
        equals(
          BorderSide(
            width: 2.0,
            color: FlexSubThemes.tintedDisable(
              colorScheme.onSurface,
              colorScheme.primary,
            ),
          ),
        ),
      );
      // Side: disabled
      expect(
        (m.side as WidgetStateBorderSide?)!.resolve(<WidgetState>{
          WidgetState.disabled,
        }),
        equals(
          BorderSide(
            width: 2.0,
            color: colorScheme.onSurface.withAlpha(kAlphaDisabled),
          ),
        ),
      );
      // Side: selected
      expect(
        (m.side as WidgetStateBorderSide?)!.resolve(<WidgetState>{
          WidgetState.selected,
        }),
        equals(const BorderSide(width: 0.0, color: Colors.transparent)),
      );
      // Side: error
      expect(
        (m.side as WidgetStateBorderSide?)!.resolve(<WidgetState>{
          WidgetState.error,
        }),
        equals(BorderSide(width: 2.0, color: colorScheme.error)),
      );
      // Side: pressed, tinted
      expect(
        (m2.side as WidgetStateBorderSide?)!.resolve(<WidgetState>{
          WidgetState.pressed,
        }),
        equals(BorderSide(width: 2.0, color: colorScheme.primary)),
      );
      // Side: pressed
      expect(
        (m.side as WidgetStateBorderSide?)!.resolve(<WidgetState>{
          WidgetState.pressed,
        }),
        equals(BorderSide(width: 2.0, color: colorScheme.onSurface)),
      );
      // Side: hovered, tinted
      expect(
        (m2.side as WidgetStateBorderSide?)!.resolve(<WidgetState>{
          WidgetState.hovered,
        }),
        equals(BorderSide(width: 2.0, color: colorScheme.primary)),
      );
      // Side: hovered
      expect(
        (m.side as WidgetStateBorderSide?)!.resolve(<WidgetState>{
          WidgetState.hovered,
        }),
        equals(BorderSide(width: 2.0, color: colorScheme.onSurface)),
      );
      // Side: focused, tinted
      expect(
        (m2.side as WidgetStateBorderSide?)!.resolve(<WidgetState>{
          WidgetState.focused,
        }),
        equals(BorderSide(width: 2.0, color: colorScheme.primary)),
      );
      // Side: focused
      expect(
        (m.side as WidgetStateBorderSide?)!.resolve(<WidgetState>{
          WidgetState.focused,
        }),
        equals(BorderSide(width: 2.0, color: colorScheme.onSurface)),
      );
      // Side: default, tinted
      expect(
        (m2.side as WidgetStateBorderSide?)!.resolve(<WidgetState>{}),
        equals(BorderSide(width: 2.0, color: colorScheme.primary)),
      );
      // Side: default
      expect(
        (m.side as WidgetStateBorderSide?)!.resolve(<WidgetState>{}),
        equals(BorderSide(width: 2.0, color: colorScheme.onSurfaceVariant)),
      );
      //
      // Fill color
      //
      // FillColor - disabled, selected
      expect(
        m.fillColor!.resolve(<WidgetState>{
          WidgetState.disabled,
          WidgetState.selected,
        }),
        equals(colorScheme.onSurface.withAlpha(kAlphaDisabled)),
      );
      // FillColor - disabled
      expect(
        m.fillColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(Colors.transparent),
      );
      // FillColor - selected, error
      expect(
        m.fillColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.error,
        }),
        equals(colorScheme.error),
      );
      // FillColor - selected
      expect(
        m.fillColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.primary),
      );
      expect(m.fillColor!.resolve(<WidgetState>{}), equals(Colors.transparent));
      // Tinted fillColor
      expect(
        m2.fillColor!.resolve(<WidgetState>{
          WidgetState.disabled,
          WidgetState.selected,
        }),
        equals(
          FlexSubThemes.tintedDisable(
            colorScheme.onSurface,
            colorScheme.primary,
          ),
        ),
      );
      // Check colors
      //
      // checkColor - disabled
      expect(
        m.checkColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(Colors.transparent),
      );
      // checkColor - disabled, selected
      expect(
        m.checkColor!.resolve(<WidgetState>{
          WidgetState.disabled,
          WidgetState.selected,
        }),
        equals(colorScheme.surface),
      );
      // checkColor - selected, error
      expect(
        m.checkColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.error,
        }),
        equals(colorScheme.onError),
      );
      // checkColor - selected
      expect(
        m.checkColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.onPrimary),
      );
      // checkColor - default
      expect(
        m.checkColor!.resolve(<WidgetState>{}),
        equals(Colors.transparent),
      );
      // OverlayColors
      //
      expect(
        m.overlayColor!.resolve(<WidgetState>{
          WidgetState.error,
          WidgetState.pressed,
        }),
        equals(colorScheme.error.withAlpha(kAlphaPressed)),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{
          WidgetState.error,
          WidgetState.hovered,
        }),
        equals(colorScheme.error.withAlpha(kAlphaHovered)),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{
          WidgetState.error,
          WidgetState.focused,
        }),
        equals(colorScheme.error.withAlpha(kAlphaFocused)),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.pressed,
        }),
        equals(colorScheme.onSurface.withAlpha(kAlphaPressed)),
      );
      expect(
        m2.overlayColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.pressed,
        }),
        equals(
          FlexSubThemes.tintedPressed(
            colorScheme.surface,
            colorScheme.primary,
            1.5,
          ),
        ),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.hovered,
        }),
        equals(colorScheme.primary.withAlpha(kAlphaHovered)),
      );
      expect(
        m2.overlayColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.hovered,
        }),
        equals(
          FlexSubThemes.tintedHovered(
            colorScheme.surface,
            colorScheme.primary,
            1.5,
          ),
        ),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.focused,
        }),
        equals(colorScheme.primary.withAlpha(kAlphaFocused)),
      );
      expect(
        m2.overlayColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.focused,
        }),
        equals(
          FlexSubThemes.tintedFocused(
            colorScheme.surface,
            colorScheme.primary,
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
        equals(colorScheme.primary.withAlpha(kAlphaPressed)),
      );
      expect(
        m2.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(
          FlexSubThemes.tintedPressed(
            colorScheme.surface,
            colorScheme.primary,
            1.5,
          ),
        ),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(colorScheme.onSurface.withAlpha(kAlphaHovered)),
      );
      expect(
        m2.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(
          FlexSubThemes.tintedHovered(
            colorScheme.surface,
            colorScheme.primary,
            1.5,
          ),
        ),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        equals(colorScheme.onSurface.withAlpha(kAlphaFocused)),
      );
      expect(
        m2.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        equals(
          FlexSubThemes.tintedFocused(
            colorScheme.surface,
            colorScheme.primary,
            1.5,
          ),
        ),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{}),
        equals(Colors.transparent),
      );
    });

    test(
        'CheckBox FST7.4 dark: GIVEN an M2 dark default '
        'FlexSubTheme.checkboxTheme() '
        'EXPECT equal to CheckboxThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.dark,
      );
      expect(
        FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          unselectedIsColored: true,
          useMaterial3: false,
        ).toString(),
        equalsIgnoringHashCodes(
          CheckboxThemeData(
            side: WidgetStateBorderSide.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                if (states.contains(WidgetState.selected)) {
                  return const BorderSide(
                    width: 2.0,
                    color: Colors.transparent,
                  );
                }
                return BorderSide(
                  width: 2.0,
                  color: colorScheme.onSurface.withAlpha(kAlphaDisabled),
                );
              }
              if (states.contains(WidgetState.selected)) {
                return const BorderSide(width: 0.0, color: Colors.transparent);
              }
              // This is M2 SDK default.
              return const BorderSide(width: 2.0, color: Colors.white70);
            }),
            fillColor: WidgetStateProperty.resolveWith<Color>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.disabled)) {
                if (states.contains(WidgetState.selected)) {
                  return Colors.grey.shade800;
                }
              }
              if (states.contains(WidgetState.selected)) {
                return colorScheme.primary;
              }
              return Colors.transparent;
            }),
            checkColor: WidgetStateProperty.resolveWith<Color>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.disabled)) {
                return Colors.grey.shade600;
              }
              if (states.contains(WidgetState.selected)) {
                return colorScheme.onPrimary;
              }
              return Colors.grey.shade400;
            }),
            overlayColor: WidgetStateProperty<Color>.fromMap(
              <WidgetStatesConstraint, Color>{
                WidgetState.selected & WidgetState.pressed:
                    colorScheme.onSurface.withAlpha(kAlphaPressed),
                WidgetState.selected & WidgetState.hovered:
                    colorScheme.primary.withAlpha(kAlphaHovered),
                WidgetState.selected & WidgetState.focused:
                    colorScheme.primary.withAlpha(kAlphaFocused),
                WidgetState.pressed:
                    colorScheme.primary.withAlpha(kAlphaPressed),
                WidgetState.hovered:
                    colorScheme.onSurface.withAlpha(kAlphaHovered),
                WidgetState.focused:
                    colorScheme.onSurface.withAlpha(kAlphaFocused),
                WidgetState.any: Colors.transparent,
              },
            ),
          ).toString(),
        ),
      );
    });
    test(
        'CheckBox FST7.5 dark-states: Does CheckBox M2 have '
        'right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.dark,
      );
      // Side states in M2.
      //
      // Side: Disabled and selected
      expect(
        (FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).side as WidgetStateBorderSide?)!
            .resolve(<WidgetState>{WidgetState.disabled, WidgetState.selected}),
        equals(const BorderSide(width: 2.0, color: Colors.transparent)),
      );
      // Side: Disabled, tinted
      expect(
        (FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useTintedDisable: true,
          useMaterial3: false,
        ).side as WidgetStateBorderSide?)!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(
          BorderSide(
            width: 2.0,
            color: FlexSubThemes.tintedDisable(
              colorScheme.onSurface,
              colorScheme.primary,
            ),
          ),
        ),
      );
      // Side: disabled
      expect(
        (FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).side as WidgetStateBorderSide?)!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(
          BorderSide(
            width: 2.0,
            color: colorScheme.onSurface.withAlpha(kAlphaDisabled),
          ),
        ),
      );
      // Side: selected
      expect(
        (FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).side as WidgetStateBorderSide?)!
            .resolve(<WidgetState>{WidgetState.selected}),
        equals(const BorderSide(width: 2.0, color: Colors.transparent)),
      );
      // Side: default stated, tinted
      expect(
        (FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          unselectedIsColored: true,
          useMaterial3: false,
        ).side as WidgetStateBorderSide?)!
            .resolve(<WidgetState>{}),
        equals(BorderSide(width: 2.0, color: colorScheme.primary)),
      );
      // Side: default stated, tinted
      expect(
        (FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).side as WidgetStateBorderSide?)!
            .resolve(<WidgetState>{}),
        equals(const BorderSide(width: 2.0, color: Colors.white70)),
      );
      //
      // fillColor
      expect(
        FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).fillColor!.resolve(<WidgetState>{
          WidgetState.disabled,
          WidgetState.selected,
        }),
        equals(Colors.grey.shade800),
      );
      expect(
        FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).fillColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(Colors.transparent),
      );
      expect(
        FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).fillColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.primary),
      );
      expect(
        FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useTintedDisable: true,
          useMaterial3: false,
        ).fillColor!.resolve(<WidgetState>{
          WidgetState.disabled,
          WidgetState.selected,
        }),
        equals(
          FlexSubThemes.tintedDisable(
            colorScheme.onSurface,
            colorScheme.primary,
          ),
        ),
      );
      expect(
        FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          unselectedIsColored: true,
          useMaterial3: false,
        ).fillColor!.resolve(<WidgetState>{}),
        equals(Colors.transparent),
      );
      //
      // Check color
      expect(
        FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).checkColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(Colors.grey.shade900),
      );
      expect(
        FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).checkColor!.resolve(<WidgetState>{}),
        equals(Colors.grey.shade400),
      );
      expect(
        FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).checkColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.onPrimary),
      );
    });
    test(
        'CheckBox FST7.6 custom-light: GIVEN a light '
        'custom FlexSubTheme.checkboxTheme '
        'EXPECT equal to CheckboxThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      );
      expect(
        FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          splashRadius: 30,
          unselectedIsColored: false,
          useMaterial3: false,
        ).toString(),
        equalsIgnoringHashCodes(
          CheckboxThemeData(
            splashRadius: 30,
            side: WidgetStateBorderSide.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                if (states.contains(WidgetState.selected)) {
                  return const BorderSide(
                    width: 2.0,
                    color: Colors.transparent,
                  );
                }
                return BorderSide(
                  width: 2.0,
                  color: colorScheme.onSurface.withAlpha(kAlphaDisabled),
                );
              }
              if (states.contains(WidgetState.selected)) {
                return const BorderSide(width: 0.0, color: Colors.transparent);
              }
              // This is M2 SDK default.
              return const BorderSide(width: 2.0, color: Colors.black54);
            }),
            fillColor: WidgetStateProperty.resolveWith<Color>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.disabled)) {
                return Colors.grey.shade400;
              }
              if (states.contains(WidgetState.selected)) {
                return colorScheme.tertiary;
              }
              return Colors.transparent;
            }),
            checkColor: WidgetStateProperty.resolveWith<Color>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.disabled)) {
                return Colors.grey.shade200;
              }
              if (states.contains(WidgetState.selected)) {
                return colorScheme.onTertiary;
              }
              return Colors.grey.shade50;
            }),
            overlayColor: WidgetStateProperty<Color>.fromMap(
              <WidgetStatesConstraint, Color>{
                WidgetState.selected & WidgetState.pressed:
                    colorScheme.onSurface.withAlpha(kAlphaPressed),
                WidgetState.selected & WidgetState.hovered:
                    colorScheme.tertiary.withAlpha(kAlphaHovered),
                WidgetState.selected & WidgetState.focused:
                    colorScheme.tertiary.withAlpha(kAlphaFocused),
                WidgetState.pressed:
                    colorScheme.tertiary.withAlpha(kAlphaPressed),
                WidgetState.hovered:
                    colorScheme.onSurface.withAlpha(kAlphaHovered),
                WidgetState.focused:
                    colorScheme.onSurface.withAlpha(kAlphaFocused),
                WidgetState.any: Colors.transparent,
              },
            ),
          ).toString(),
        ),
      );
    });
  });
}
