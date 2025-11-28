import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flex_color_scheme/src/flex_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WITH: FlexSubThemes.elevatedButtonTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes ElevatedButton tests
    // -------------------------------------------------------------------------
    test(
        'ElevatedButton 12.1 M2: GIVEN a default M2 '
        'FlexSubTheme.elevatedButtonTheme() '
        'EXPECT equal to ElevatedButtonThemeData() version with '
        'same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).toString(),
        equalsIgnoringHashCodes(
          ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(40, 40),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ), //buttonShape,
              elevation: 1,
            ).copyWith(
              foregroundColor: WidgetStateProperty.resolveWith<Color>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.disabled)) {
                  return colorScheme.primary
                      .blendAlpha(colorScheme.onSurface, 0x66)
                      .withAlpha(0x5E);
                }
                return colorScheme.onPrimary;
              }),
              iconColor: WidgetStateProperty.resolveWith<Color>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.disabled)) {
                  return colorScheme.primary
                      .blendAlpha(colorScheme.onSurface, 0x66)
                      .withAlpha(0x5E);
                }
                return colorScheme.onPrimary;
              }),
              backgroundColor: WidgetStateProperty.resolveWith<Color>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.disabled)) {
                  return colorScheme.primary
                      .blendAlpha(colorScheme.onSurface, 0x66)
                      .withAlpha(0x26);
                }
                return colorScheme.primary;
              }),
              overlayColor: WidgetStateProperty.resolveWith<Color>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.hovered)) {
                  return colorScheme.onPrimary.withAlpha(0x0D);
                }
                if (states.contains(WidgetState.focused)) {
                  return colorScheme.onPrimary.withAlpha(0x26);
                }
                if (states.contains(WidgetState.pressed)) {
                  return colorScheme.onPrimary.withAlpha(0x33);
                }
                return Colors.transparent;
              }),
            ),
          ).toString(),
        ),
      );
    });
    test(
        'ElevatedButton 12.2 M3: GIVEN a default M3 '
        'FlexSubTheme.elevatedButtonTheme() '
        'EXPECT equal to ElevatedButtonThemeData() version with '
        'defaults', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          const ElevatedButtonThemeData(
            style: ButtonStyle(),
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'ElevatedButton 12.3 M2 secondary: GIVEN a default '
        'FlexSubTheme.elevatedButtonTheme() '
        'with secondary color as base color '
        'EXPECT equal to ElevatedButtonThemeData() version with '
        'same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          useMaterial3: false,
        ).toString(),
        equalsIgnoringHashCodes(
          ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(40, 40),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ), //buttonShape,
              elevation: 1,
            ).copyWith(
              foregroundColor: WidgetStateProperty.resolveWith<Color>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.disabled)) {
                  return colorScheme.secondary
                      .blendAlpha(colorScheme.onSurface, 0x66)
                      .withAlpha(0x5E);
                }
                return colorScheme.onSecondary;
              }),
              iconColor: WidgetStateProperty.resolveWith<Color>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.disabled)) {
                  return colorScheme.secondary
                      .blendAlpha(colorScheme.onSurface, 0x66)
                      .withAlpha(0x5E);
                }
                return colorScheme.onSecondary;
              }),
              backgroundColor: WidgetStateProperty.resolveWith<Color>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.disabled)) {
                  return colorScheme.secondary
                      .blendAlpha(colorScheme.onSurface, 0x66)
                      .withAlpha(0x26);
                }
                return colorScheme.secondary;
              }),
              overlayColor: WidgetStateProperty.resolveWith<Color>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.hovered)) {
                  return colorScheme.onPrimary.withAlpha(0x0D);
                }
                if (states.contains(WidgetState.focused)) {
                  return colorScheme.onPrimary.withAlpha(0x26);
                }
                if (states.contains(WidgetState.pressed)) {
                  return colorScheme.onPrimary.withAlpha(0x33);
                }
                return Colors.transparent;
              }),
            ),
          ).toString(),
        ),
      );
    });
    test(
        'ElevatedButton 12.3 M2 secondary-onBase: GIVEN a default '
        'FlexSubTheme.elevatedButtonTheme() '
        'with secondary color as onBase color '
        'EXPECT equal to ElevatedButtonThemeData() version with '
        'same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          onBaseSchemeColor: SchemeColor.secondary,
          useMaterial3: false,
        ).toString(),
        equalsIgnoringHashCodes(
          ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(40, 40),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ), //buttonShape,
              elevation: 1,
            ).copyWith(
              foregroundColor: WidgetStateProperty.resolveWith<Color>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.disabled)) {
                  return colorScheme.secondary
                      .blendAlpha(colorScheme.onSurface, 0x66)
                      .withAlpha(0x5E);
                }
                return colorScheme.onSecondary;
              }),
              iconColor: WidgetStateProperty.resolveWith<Color>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.disabled)) {
                  return colorScheme.secondary
                      .blendAlpha(colorScheme.onSurface, 0x66)
                      .withAlpha(0x5E);
                }
                return colorScheme.onSecondary;
              }),
              backgroundColor: WidgetStateProperty.resolveWith<Color>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.disabled)) {
                  return colorScheme.primary
                      .blendAlpha(colorScheme.onSurface, 0x66)
                      .withAlpha(0x26);
                }
                return colorScheme.primary;
              }),
              overlayColor: WidgetStateProperty.resolveWith<Color>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.hovered)) {
                  return colorScheme.onSecondary.withAlpha(0x0D);
                }
                if (states.contains(WidgetState.focused)) {
                  return colorScheme.onSecondary.withAlpha(0x26);
                }
                if (states.contains(WidgetState.pressed)) {
                  return colorScheme.onSecondary.withAlpha(0x33);
                }
                return Colors.transparent;
              }),
            ),
          ).toString(),
        ),
      );
    });
    test(
        'ElevatedButton 12.4 M2 states: Does '
        'ElevatedButton have right Material 2 states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF42AEE7),
        brightness: Brightness.light,
      );
      // Disabled foreground, default, M2
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).style!.foregroundColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(colorScheme.onSurface.withAlpha(kAlphaDisabled)),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).style!.iconColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(colorScheme.onSurface.withAlpha(kAlphaDisabled)),
      );
      // Disabled foreground, custom, M2, with tint
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          useTintedDisable: true,
          useMaterial3: false,
        ).style!.foregroundColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(
          FlexSubThemes.tintedDisable(
            colorScheme.onSurface,
            colorScheme.secondary,
          ),
        ),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          useTintedDisable: true,
          useMaterial3: false,
        ).style!.iconColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(
          FlexSubThemes.tintedDisable(
            colorScheme.onSurface,
            colorScheme.secondary,
          ),
        ),
      );
      // Selected foreground, M2
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).style!.foregroundColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.onPrimary),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).style!.iconColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.onPrimary),
      );
      // Selected foreground, custom color, M2
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          useMaterial3: false,
        ).style!.foregroundColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.onSecondary),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          useMaterial3: false,
        ).style!.iconColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.onSecondary),
      );
      // Selected foreground, custom colors, M2
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          onBaseSchemeColor: SchemeColor.tertiary,
          useMaterial3: false,
        ).style!.foregroundColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.tertiary),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          onBaseSchemeColor: SchemeColor.tertiary,
          useMaterial3: false,
        ).style!.iconColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.tertiary),
      );
      // Disabled background, M2, default
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).style!.backgroundColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(colorScheme.onSurface.withAlpha(kAlphaVeryLowDisabled)),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          useTintedDisable: true,
          useMaterial3: false,
        ).style!.backgroundColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(
          FlexSubThemes.tintedDisable(
            colorScheme.onSurface,
            colorScheme.secondary,
          ).withAlpha(kAlphaVeryLowDisabled),
        ),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).style!.backgroundColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.primary),
      );
      // Overlay color states
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).style!.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(colorScheme.onSecondary.withAlpha(kAlphaHovered)),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          useTintedInteraction: true,
          useMaterial3: false,
        ).style!.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(
          FlexSubThemes.tintedHovered(
            colorScheme.onPrimary,
            colorScheme.primary,
            5.0,
          ),
        ),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).style!.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        equals(colorScheme.onSecondary.withAlpha(kAlphaFocused)),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          useTintedInteraction: true,
          useMaterial3: false,
        ).style!.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        equals(
          FlexSubThemes.tintedFocused(
            colorScheme.onPrimary,
            colorScheme.primary,
            5.0,
          ),
        ),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).style!.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(colorScheme.onSecondary.withAlpha(kAlphaPressed)),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          useTintedInteraction: true,
          useMaterial3: false,
        ).style!.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(
          FlexSubThemes.tintedPressed(
            colorScheme.onPrimary,
            colorScheme.primary,
            5.0,
          ),
        ),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).style!.overlayColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(Colors.transparent),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).style!.overlayColor!.resolve(<WidgetState>{}),
        equals(Colors.transparent),
      );
    });
    test(
        'ElevatedButton 12.5 M3-states: Does '
        'ElevatedButton have right Material 3 states', () {
      const ColorScheme colorScheme = ColorScheme.light();
      // Disabled foreground, default, M3
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primary,
          useMaterial3: true,
        ).style!.foregroundColor!.resolve(<WidgetState>{WidgetState.disabled}),
        isSameColorAs(colorScheme.onSurface.withValues(alpha: 0.38)),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primary,
          useMaterial3: true,
        ).style!.iconColor!.resolve(<WidgetState>{WidgetState.disabled}),
        isSameColorAs(colorScheme.onSurface.withValues(alpha: 0.38)),
      );
      // Disabled foreground, tinted M3
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primary,
          useTintedDisable: true,
          useMaterial3: true,
        ).style!.foregroundColor!.resolve(<WidgetState>{WidgetState.disabled}),
        isSameColorAs(
          FlexSubThemes.tintedDisable(
            colorScheme.onSurface,
            colorScheme.primary,
          ),
        ),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primary,
          useTintedDisable: true,
          useMaterial3: true,
        ).style!.iconColor!.resolve(<WidgetState>{WidgetState.disabled}),
        isSameColorAs(
          FlexSubThemes.tintedDisable(
            colorScheme.onSurface,
            colorScheme.primary,
          ),
        ),
      );
      // Disabled foreground, custom, M3
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          useMaterial3: true,
        ).style!.foregroundColor!.resolve(<WidgetState>{WidgetState.disabled}),
        isSameColorAs(colorScheme.onSurface.withValues(alpha: 0.38)),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          useMaterial3: true,
        ).style!.iconColor!.resolve(<WidgetState>{WidgetState.disabled}),
        isSameColorAs(colorScheme.onSurface.withValues(alpha: 0.38)),
      );
      // Selected foreground, M3
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primary,
          useMaterial3: true,
        ).style!.foregroundColor!.resolve(<WidgetState>{WidgetState.selected}),
        isSameColorAs(colorScheme.primary),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primary,
          useMaterial3: true,
        ).style!.iconColor!.resolve(<WidgetState>{WidgetState.selected}),
        isSameColorAs(colorScheme.primary),
      );
      // Selected foreground, custom color, M3
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          useMaterial3: true,
        ).style!.foregroundColor!.resolve(<WidgetState>{WidgetState.selected}),
        isSameColorAs(colorScheme.secondary),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          useMaterial3: true,
        ).style!.iconColor!.resolve(<WidgetState>{WidgetState.selected}),
        isSameColorAs(colorScheme.secondary),
      );
      // Selected foreground, custom colors, M3
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          onBaseSchemeColor: SchemeColor.tertiary,
          useMaterial3: true,
        ).style!.foregroundColor!.resolve(<WidgetState>{WidgetState.selected}),
        isSameColorAs(colorScheme.secondary),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          onBaseSchemeColor: SchemeColor.tertiary,
          useMaterial3: true,
        ).style!.iconColor!.resolve(<WidgetState>{WidgetState.selected}),
        isSameColorAs(colorScheme.secondary),
      );
      // Disabled background, M3
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primary,
          useMaterial3: true,
        ).style!.backgroundColor!.resolve(<WidgetState>{WidgetState.disabled}),
        isSameColorAs(colorScheme.onSurface.withValues(alpha: 0.12)),
      );
      // Disabled background, tinted M3
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primary,
          useTintedDisable: true,
          useMaterial3: true,
        ).style!.backgroundColor!.resolve(<WidgetState>{WidgetState.disabled}),
        isSameColorAs(
          FlexSubThemes.tintedDisable(
            colorScheme.onSurface,
            colorScheme.primary,
          ).withAlpha(kAlphaVeryLowDisabled),
        ),
      );
      // Disabled background, M3, only onBase given
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          onBaseSchemeColor: SchemeColor.tertiary,
          useMaterial3: true,
        ).style!.backgroundColor!.resolve(<WidgetState>{WidgetState.disabled}),
        isSameColorAs(colorScheme.onSurface.withValues(alpha: 0.12)),
      );
      // Disabled background, tinted M3, only onBase given
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          onBaseSchemeColor: SchemeColor.tertiary,
          useTintedDisable: true,
          useMaterial3: true,
        ).style!.backgroundColor!.resolve(<WidgetState>{WidgetState.disabled}),
        isSameColorAs(
          FlexSubThemes.tintedDisable(
            colorScheme.onSurface,
            colorScheme.primary,
          ).withAlpha(kAlphaVeryLowDisabled),
        ),
      );
      // Default background, M3, only onBase given
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          onBaseSchemeColor: SchemeColor.tertiary,
          useMaterial3: true,
        ).style!.backgroundColor!.resolve(<WidgetState>{}),
        equals(colorScheme.tertiary),
      );
      // Selected background, M3
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primary,
          useMaterial3: true,
        ).style!.backgroundColor!.resolve(<WidgetState>{WidgetState.selected}),
        isSameColorAs(colorScheme.surface),
      );
      // Overlay color states
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primary,
          useMaterial3: true,
        ).style!.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        isSameColorAs(colorScheme.primary.withValues(alpha: 0.08)),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          useTintedInteraction: true,
          useMaterial3: true,
        ).style!.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        isSameColorAs(
          FlexSubThemes.tintedHovered(
            colorScheme.surface,
            colorScheme.primary,
            1.5,
          ),
        ),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primary,
          useMaterial3: true,
        ).style!.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        isSameColorAs(colorScheme.primary.withValues(alpha: 0.12)),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          useTintedInteraction: true,
          useMaterial3: true,
        ).style!.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        isSameColorAs(
          FlexSubThemes.tintedFocused(
            colorScheme.surface,
            colorScheme.primary,
            1.5,
          ),
        ),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primary,
          useMaterial3: true,
        ).style!.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        isSameColorAs(colorScheme.primary.withValues(alpha: 0.12)),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          useTintedInteraction: true,
          useMaterial3: true,
        ).style!.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        isSameColorAs(
          FlexSubThemes.tintedPressed(
            colorScheme.surface,
            colorScheme.primary,
            1.5,
          ),
        ),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primary,
          useMaterial3: true,
        ).style!.overlayColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(null),
      );
      // Elevation states
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primary,
          elevation: 2,
          useMaterial3: true,
        ).style!.elevation!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(0.0),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primary,
          elevation: 2,
          useMaterial3: true,
        ).style!.elevation!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(4.0),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          elevation: 2,
          useMaterial3: true,
        ).style!.elevation!.resolve(<WidgetState>{WidgetState.focused}),
        equals(2.0),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primary,
          elevation: 2,
          useMaterial3: true,
        ).style!.elevation!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(2.0),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primary,
          elevation: 2,
          useMaterial3: true,
        ).style!.elevation!.resolve(<WidgetState>{WidgetState.selected}),
        equals(2.0),
      );
      // Custom shape test
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          radius: 10,
          useMaterial3: true,
        ).style!.shape!.resolve(<WidgetState>{}),
        equals(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      );
    });
    test(
        'ElevatedButton 12.6 M2 custom-1: GIVEN a '
        'custom FlexSubTheme.elevatedButtonTheme() '
        'EXPECT equal to ElevatedButtonThemeData() version with '
        'same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          elevation: 1,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          minButtonSize: const Size(50, 50),
          radius: 10,
          useMaterial3: false,
        ).toString(),
        equalsIgnoringHashCodes(
          ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(50, 50),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ), //buttonShape,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              elevation: 1,
            ).copyWith(
              foregroundColor: WidgetStateProperty.resolveWith<Color>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.disabled)) {
                  return colorScheme.primary
                      .blendAlpha(colorScheme.onSurface, 0x66)
                      .withAlpha(0x5E);
                }
                return colorScheme.onPrimary;
              }),
              iconColor: WidgetStateProperty.resolveWith<Color>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.disabled)) {
                  return colorScheme.primary
                      .blendAlpha(colorScheme.onSurface, 0x66)
                      .withAlpha(0x5E);
                }
                return colorScheme.onPrimary;
              }),
              backgroundColor: WidgetStateProperty.resolveWith<Color>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.disabled)) {
                  return colorScheme.primary
                      .blendAlpha(colorScheme.onSurface, 0x66)
                      .withAlpha(0x26);
                }
                return colorScheme.primary;
              }),
              overlayColor: WidgetStateProperty.resolveWith<Color>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.hovered)) {
                  return colorScheme.onPrimary.withAlpha(0x0D);
                }
                if (states.contains(WidgetState.focused)) {
                  return colorScheme.onPrimary.withAlpha(0x26);
                }
                if (states.contains(WidgetState.pressed)) {
                  return colorScheme.onPrimary.withAlpha(0x33);
                }
                return Colors.transparent;
              }),
            ),
          ).toString(),
        ),
      );
    });
    test(
        'ElevatedButton 12.7 M2 custom-2: GIVEN a custom '
        'FlexSubTheme.elevatedButtonTheme() '
        'EXPECT equal to ElevatedButtonThemeData() version with '
        'same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          onBaseSchemeColor: SchemeColor.secondary,
          elevation: 1,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          minButtonSize: const Size(55, 55),
          radius: 12,
          useMaterial3: false,
        ).toString(),
        equalsIgnoringHashCodes(
          ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(55, 55),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ), //buttonShape,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              elevation: 1,
            ).copyWith(
              foregroundColor: WidgetStateProperty.resolveWith<Color>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.disabled)) {
                  return colorScheme.tertiary
                      .blendAlpha(colorScheme.onSurface, 0x66)
                      .withAlpha(0x5E);
                }
                return colorScheme.secondary;
              }),
              iconColor: WidgetStateProperty.resolveWith<Color>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.disabled)) {
                  return colorScheme.tertiary
                      .blendAlpha(colorScheme.onSurface, 0x66)
                      .withAlpha(0x5E);
                }
                return colorScheme.secondary;
              }),
              backgroundColor: WidgetStateProperty.resolveWith<Color>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.disabled)) {
                  return colorScheme.tertiary
                      .blendAlpha(colorScheme.onSurface, 0x66)
                      .withAlpha(0x26);
                }
                return colorScheme.tertiary;
              }),
              overlayColor: WidgetStateProperty.resolveWith<Color>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.hovered)) {
                  return colorScheme.onTertiary.withAlpha(0x0D);
                }
                if (states.contains(WidgetState.focused)) {
                  return colorScheme.onTertiary.withAlpha(0x26);
                }
                if (states.contains(WidgetState.pressed)) {
                  return colorScheme.onTertiary.withAlpha(0x33);
                }
                return Colors.transparent;
              }),
            ),
          ).toString(),
        ),
      );
    });
    test(
        'ElevatedButton 12.8 custom-1-M3: GIVEN a custom '
        'FlexSubTheme.elevatedButtonTheme() '
        'EXPECT equal to ElevatedButtonThemeData() version with '
        'same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          minButtonSize: const Size(50, 50),
          radius: 10,
          useMaterial3: true,
        ).toString(),
        equalsIgnoringHashCodes(
          ElevatedButtonThemeData(
            style: ButtonStyle(
              minimumSize: ButtonStyleButton.allOrNull<Size>(
                const Size(50, 50),
              ),
              padding: ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(horizontal: 8),
              ),
              elevation: WidgetStateProperty.resolveWith((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.disabled)) {
                  return 0.0;
                }
                if (states.contains(WidgetState.hovered)) {
                  return 4.0;
                }
                if (states.contains(WidgetState.focused)) {
                  return 2.0;
                }
                if (states.contains(WidgetState.pressed)) {
                  return 2.0;
                }
                return 2.0;
              }),
              shape: ButtonStyleButton.allOrNull<OutlinedBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ), //buttonShape,
            ),
          ).toString(),
        ),
      );
    });
    test(
        'ElevatedButton 12.9 custom-2-M3: GIVEN a custom '
        'FlexSubTheme.elevatedButtonTheme() '
        'EXPECT equal to ElevatedButtonThemeData() version with '
        'same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          onBaseSchemeColor: SchemeColor.secondary,
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 9),
          minButtonSize: const Size(55, 55),
          radius: 12,
          useMaterial3: true,
        ).toString(),
        equalsIgnoringHashCodes(
          ElevatedButtonThemeData(
            style: ButtonStyle(
              foregroundColor: WidgetStateProperty.resolveWith((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.disabled)) {
                  return colorScheme.onSurface.withValues(alpha: 0.38);
                }
                return colorScheme.tertiary;
              }),
              iconColor: WidgetStateProperty.resolveWith((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.disabled)) {
                  return colorScheme.onSurface.withValues(alpha: 0.38);
                }
                return colorScheme.tertiary;
              }),
              backgroundColor: WidgetStateProperty.resolveWith((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.disabled)) {
                  return colorScheme.onSurface.withValues(alpha: 0.12);
                }
                return colorScheme.secondary;
              }),
              overlayColor: WidgetStateProperty.resolveWith((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.hovered)) {
                  return colorScheme.tertiary.withValues(alpha: 0.08);
                }
                if (states.contains(WidgetState.focused)) {
                  return colorScheme.tertiary.withValues(alpha: 0.12);
                }
                if (states.contains(WidgetState.pressed)) {
                  return colorScheme.tertiary.withValues(alpha: 0.12);
                }
                return null;
              }),
              minimumSize: ButtonStyleButton.allOrNull<Size>(
                const Size(55, 55),
              ),
              padding: ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(horizontal: 9),
              ),
              elevation: WidgetStateProperty.resolveWith((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.disabled)) {
                  return 0.0;
                }
                if (states.contains(WidgetState.hovered)) {
                  return 4.0;
                }
                if (states.contains(WidgetState.focused)) {
                  return 2.0;
                }
                if (states.contains(WidgetState.pressed)) {
                  return 2.0;
                }
                return 2.0;
              }),
              shape: ButtonStyleButton.allOrNull<OutlinedBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ), //buttonShape,
            ),
          ).toString(),
        ),
      );
    });
  });
}
