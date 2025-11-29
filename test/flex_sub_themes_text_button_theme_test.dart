import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WITH: FlexSubThemes.textButtonTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes TextButton tests
    // -------------------------------------------------------------------------
    test(
        'TextButton FST31.1 M2: GIVEN a default M2 '
        'FlexSubTheme.textButtonTheme() '
        'EXPECT equal to TextButtonThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.textButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).toString(),
        equalsIgnoringHashCodes(
          TextButtonThemeData(
            style: ButtonStyle(
              minimumSize: ButtonStyleButton.allOrNull<Size>(
                const Size(40, 40),
              ),
              shape: ButtonStyleButton.allOrNull<OutlinedBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
              ),
            ),
          ).toString(),
        ),
      );
    });
    test(
        'TextButton FST31.2 M2-base: GIVEN a custom '
        'FlexSubTheme.textButtonTheme() '
        'EXPECT equal to TextButtonThemeData() version with same color', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.textButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          useMaterial3: false,
        ).toString(),
        equalsIgnoringHashCodes(
          TextButtonThemeData(
            style: ButtonStyle(
              minimumSize: ButtonStyleButton.allOrNull<Size>(
                const Size(40, 40),
              ),
              shape: ButtonStyleButton.allOrNull<OutlinedBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
              ),
              foregroundColor: WidgetStateProperty.resolveWith<Color?>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.disabled)) {
                  return colorScheme.onSurface.withValues(alpha: 0.38);
                }
                return colorScheme.secondary;
              }),
              iconColor: WidgetStateProperty.resolveWith<Color?>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.disabled)) {
                  return colorScheme.onSurface.withValues(alpha: 0.38);
                }
                return colorScheme.secondary;
              }),
              overlayColor: WidgetStateProperty.resolveWith<Color?>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.hovered)) {
                  return colorScheme.secondary.withValues(alpha: 0.08);
                }
                if (states.contains(WidgetState.focused)) {
                  return colorScheme.secondary.withValues(alpha: 0.12);
                }
                if (states.contains(WidgetState.pressed)) {
                  return colorScheme.secondary.withValues(alpha: 0.12);
                }
                return null;
              }),
            ),
          ).toString(),
        ),
      );
    });
    test(
        'TextButton FST31.3 M3: GIVEN a default M3 '
        'FlexSubTheme.textButtonTheme() '
        'EXPECT equal to TextButtonThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF7142E7),
        brightness: Brightness.light,
      );
      expect(
        FlexSubThemes.textButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          const TextButtonThemeData(
            style: ButtonStyle(),
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'TextButton FST31.4 M2-states: Does TextButton '
        'have right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF7142E7),
        brightness: Brightness.light,
      );
      final TextButtonThemeData button = FlexSubThemes.textButtonTheme(
        colorScheme: colorScheme,
        baseSchemeColor: SchemeColor.primary,
      );
      // Disabled foreground
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
      expect(
        button.style!.foregroundColor!.resolve(<WidgetState>{
          WidgetState.selected,
        }),
        isSameColorAs(colorScheme.primary),
      );
      expect(
        button.style!.iconColor!.resolve(<WidgetState>{WidgetState.selected}),
        isSameColorAs(colorScheme.primary),
      );
      // Overlay color states
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        isSameColorAs(colorScheme.primary.withValues(alpha: 0.08)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        isSameColorAs(colorScheme.primary.withValues(alpha: 0.12)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        isSameColorAs(colorScheme.primary.withValues(alpha: 0.12)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{
          WidgetState.selected,
        }),
        equals(null),
      );
    });
    test(
        'TextButton FST31.5 M2-tint-states: Does M2 '
        'TextButton have right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF7142E7),
        brightness: Brightness.light,
      );
      final TextButtonThemeData button = FlexSubThemes.textButtonTheme(
        colorScheme: colorScheme,
        baseSchemeColor: SchemeColor.tertiary,
        useTintedDisable: true,
        useTintedInteraction: true,
      );
      final Color overlay = colorScheme.surface;
      final Color tint = colorScheme.tertiary;
      // Disabled foreground
      expect(
        button.style!.foregroundColor!.resolve(<WidgetState>{
          WidgetState.disabled,
        }),
        isSameColorAs(FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)),
      );
      expect(
        button.style!.iconColor!.resolve(<WidgetState>{WidgetState.disabled}),
        isSameColorAs(FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)),
      );
      expect(
        button.style!.foregroundColor!.resolve(<WidgetState>{
          WidgetState.selected,
        }),
        isSameColorAs(colorScheme.tertiary),
      );
      expect(
        button.style!.iconColor!.resolve(<WidgetState>{WidgetState.selected}),
        isSameColorAs(colorScheme.tertiary),
      );
      // Overlay color states
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        isSameColorAs(FlexSubThemes.tintedHovered(overlay, tint, 1.5)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        isSameColorAs(FlexSubThemes.tintedFocused(overlay, tint, 1.5)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        isSameColorAs(FlexSubThemes.tintedPressed(overlay, tint, 1.5)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{
          WidgetState.selected,
        }),
        equals(null),
      );
    });
    test(
        'TextButton FST31.6 M3-states: Does '
        'TextButton have right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      final TextButtonThemeData button = FlexSubThemes.textButtonTheme(
        colorScheme: colorScheme,
        baseSchemeColor: SchemeColor.primary,
        radius: 15,
        useMaterial3: true,
      );
      // Disabled foreground
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
      expect(
        button.style!.foregroundColor!.resolve(<WidgetState>{
          WidgetState.selected,
        }),
        isSameColorAs(colorScheme.primary),
      );
      expect(
        button.style!.iconColor!.resolve(<WidgetState>{WidgetState.selected}),
        isSameColorAs(colorScheme.primary),
      );
      // Overlay color states
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        isSameColorAs(colorScheme.primary.withValues(alpha: 0.08)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        isSameColorAs(colorScheme.primary.withValues(alpha: 0.12)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        isSameColorAs(colorScheme.primary.withValues(alpha: 0.12)),
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
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
      );
    });
    test(
        'TextButton FST31.7 M3-custom-states: Does light '
        'TextButton have right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      final TextButtonThemeData button = FlexSubThemes.textButtonTheme(
        colorScheme: colorScheme,
        baseSchemeColor: SchemeColor.primaryContainer,
        radius: 5,
        useTintedDisable: true,
        useTintedInteraction: true,
      );
      final Color overlay = colorScheme.surface;
      final Color tint = colorScheme.primaryContainer;
      // Disabled foreground
      expect(
        button.style!.foregroundColor!.resolve(<WidgetState>{
          WidgetState.disabled,
        }),
        isSameColorAs(FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)),
      );
      expect(
        button.style!.iconColor!.resolve(<WidgetState>{WidgetState.disabled}),
        isSameColorAs(FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)),
      );
      expect(
        button.style!.foregroundColor!.resolve(<WidgetState>{
          WidgetState.selected,
        }),
        isSameColorAs(colorScheme.primaryContainer),
      );
      expect(
        button.style!.iconColor!.resolve(<WidgetState>{WidgetState.selected}),
        isSameColorAs(colorScheme.primaryContainer),
      );
      // Overlay color states
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        isSameColorAs(FlexSubThemes.tintedHovered(overlay, tint, 4.0)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        isSameColorAs(FlexSubThemes.tintedFocused(overlay, tint, 4.0)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        isSameColorAs(FlexSubThemes.tintedPressed(overlay, tint, 4.0)),
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
        'TextButton FST31.8 M3-custom-states: Does light '
        'TextButton have right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      final TextButtonThemeData button = FlexSubThemes.textButtonTheme(
        colorScheme: colorScheme,
        baseSchemeColor: SchemeColor.tertiary,
        radius: 5,
        useTintedDisable: true,
        useTintedInteraction: true,
      );
      final Color overlay = colorScheme.surface;
      final Color tint = colorScheme.tertiary;
      // Disabled foreground
      expect(
        button.style!.foregroundColor!.resolve(<WidgetState>{
          WidgetState.disabled,
        }),
        isSameColorAs(FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)),
      );
      expect(
        button.style!.iconColor!.resolve(<WidgetState>{WidgetState.disabled}),
        isSameColorAs(FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)),
      );
      expect(
        button.style!.foregroundColor!.resolve(<WidgetState>{
          WidgetState.selected,
        }),
        isSameColorAs(colorScheme.tertiary),
      );
      expect(
        button.style!.iconColor!.resolve(<WidgetState>{WidgetState.selected}),
        isSameColorAs(colorScheme.tertiary),
      );
      // Overlay color states
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        isSameColorAs(FlexSubThemes.tintedHovered(overlay, tint, 1.5)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        isSameColorAs(FlexSubThemes.tintedFocused(overlay, tint, 1.5)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        isSameColorAs(FlexSubThemes.tintedPressed(overlay, tint, 1.5)),
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
        'TextButton FST31.9 M3-custom-states: Does dark '
        'TextButton have right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.dark,
      );
      final TextButtonThemeData button = FlexSubThemes.textButtonTheme(
        colorScheme: colorScheme,
        baseSchemeColor: SchemeColor.tertiary,
        radius: 5,
        useTintedDisable: true,
        useTintedInteraction: true,
      );
      final Color overlay = colorScheme.surface;
      final Color tint = colorScheme.tertiary;
      // Disabled foreground
      expect(
        button.style!.foregroundColor!.resolve(<WidgetState>{
          WidgetState.disabled,
        }),
        isSameColorAs(FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)),
      );
      expect(
        button.style!.iconColor!.resolve(<WidgetState>{WidgetState.disabled}),
        isSameColorAs(FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)),
      );
      expect(
        button.style!.foregroundColor!.resolve(<WidgetState>{
          WidgetState.selected,
        }),
        equals(colorScheme.tertiary),
      );
      expect(
        button.style!.iconColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.tertiary),
      );
      // Overlay color states
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        isSameColorAs(FlexSubThemes.tintedHovered(overlay, tint, 2)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        isSameColorAs(FlexSubThemes.tintedFocused(overlay, tint, 2)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        isSameColorAs(FlexSubThemes.tintedPressed(overlay, tint, 2)),
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
        'TextButton FST31.10 M3-custom-states: Does dark '
        'TextButton have right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.dark,
      );
      final TextButtonThemeData button = FlexSubThemes.textButtonTheme(
        colorScheme: colorScheme,
        baseSchemeColor: SchemeColor.primaryContainer,
        radius: 5,
        useTintedDisable: true,
        useTintedInteraction: true,
      );
      final Color overlay = colorScheme.surface;
      final Color tint = colorScheme.primaryContainer;
      // Disabled foreground
      expect(
        button.style!.foregroundColor!.resolve(<WidgetState>{
          WidgetState.disabled,
        }),
        isSameColorAs(FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)),
      );
      expect(
        button.style!.iconColor!.resolve(<WidgetState>{WidgetState.disabled}),
        isSameColorAs(FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)),
      );
      expect(
        button.style!.foregroundColor!.resolve(<WidgetState>{
          WidgetState.selected,
        }),
        isSameColorAs(colorScheme.primaryContainer),
      );
      expect(
        button.style!.iconColor!.resolve(<WidgetState>{WidgetState.selected}),
        isSameColorAs(colorScheme.primaryContainer),
      );
      // Overlay color states
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        isSameColorAs(FlexSubThemes.tintedHovered(overlay, tint, 5)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        isSameColorAs(FlexSubThemes.tintedFocused(overlay, tint, 5)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        isSameColorAs(FlexSubThemes.tintedPressed(overlay, tint, 5)),
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
  });
}
