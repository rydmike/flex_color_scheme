import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flex_color_scheme/src/flex_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WITH: FlexSubThemes.outlinedButtonTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes OutlinedButton tests
    // -------------------------------------------------------------------------
    test(
        'OutlinedButton FST23.1 M2: GIVEN a default M2 '
        'FlexSubTheme.outlinedButtonTheme() '
        'EXPECT '
        'equal to OutlinedButtonThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).toString(),
        equalsIgnoringHashCodes(
          OutlinedButtonThemeData(
            style: ButtonStyle(
              minimumSize: ButtonStyleButton.allOrNull<Size>(
                const Size(40, 40),
              ),
              shape: ButtonStyleButton.allOrNull<OutlinedBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
              ), //buttonShape,
              side: WidgetStateProperty.resolveWith<BorderSide?>((
                final Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.disabled)) {
                  return BorderSide(
                    color: colorScheme.primary
                        .blendAlpha(colorScheme.onSurface, 0x66)
                        .withAlpha(0x26),
                    width: 1.5,
                  );
                }
                if (states.contains(WidgetState.error)) {
                  return BorderSide(color: colorScheme.error, width: 2);
                }
                if (states.contains(WidgetState.pressed)) {
                  return BorderSide(color: colorScheme.primary, width: 2);
                }
                return BorderSide(
                  color: colorScheme.primary.withAlpha(0xA7),
                  width: 1.5,
                );
              }),
            ),
          ).toString(),
        ),
      );
    });
    test(
        'OutlinedButton FST23.2 custom-M2: GIVEN a custom '
        'FlexSubTheme.outlinedButtonTheme() '
        'EXPECT '
        'equal to OutlinedButtonThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF42AEE7),
        brightness: Brightness.light,
      );
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primaryContainer,
          outlineSchemeColor: SchemeColor.secondaryContainer,
          padding: const EdgeInsets.symmetric(horizontal: 17),
          minButtonSize: const Size(52, 40),
          radius: 13,
        ).toString(),
        equalsIgnoringHashCodes(
          OutlinedButtonThemeData(
            style: ButtonStyle(
              minimumSize: ButtonStyleButton.allOrNull<Size>(
                const Size(52, 40),
              ),
              padding: ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(horizontal: 17),
              ),
              shape: ButtonStyleButton.allOrNull<OutlinedBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(13)),
                ),
              ),
              foregroundColor: WidgetStateProperty.resolveWith<Color?>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.disabled)) {
                  return colorScheme.onSurface.withValues(alpha: 0.38);
                }
                return colorScheme.primaryContainer;
              }),
              iconColor: WidgetStateProperty.resolveWith<Color?>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.disabled)) {
                  return colorScheme.onSurface.withValues(alpha: 0.38);
                }
                return colorScheme.primaryContainer;
              }),
              overlayColor: WidgetStateProperty.resolveWith<Color?>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.hovered)) {
                  return colorScheme.primaryContainer.withValues(alpha: 0.08);
                }
                if (states.contains(WidgetState.focused)) {
                  return colorScheme.primaryContainer.withValues(alpha: 0.12);
                }
                if (states.contains(WidgetState.pressed)) {
                  return colorScheme.primaryContainer.withValues(alpha: 0.12);
                }
                return Colors.transparent;
              }),
              side: WidgetStateProperty.resolveWith<BorderSide?>((
                final Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.disabled)) {
                  return BorderSide(
                    color: colorScheme.secondaryContainer
                        .blendAlpha(colorScheme.onSurface, 0x66)
                        .withAlpha(0x26),
                    width: 1.5,
                  );
                }
                if (states.contains(WidgetState.error)) {
                  return BorderSide(color: colorScheme.error, width: 2);
                }
                if (states.contains(WidgetState.pressed)) {
                  return BorderSide(
                    color: colorScheme.secondaryContainer,
                    width: 2,
                  );
                }
                return BorderSide(
                  color: colorScheme.secondaryContainer.withAlpha(0xA7),
                  width: 1.5,
                );
              }),
            ),
          ).toString(),
        ),
      );
    });
    test(
        'OutlinedButton FST23.3 M3: GIVEN a default '
        'FlexSubTheme.outlinedButtonTheme() EXPECT '
        'equal to OutlinedButtonThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF7142E7),
        brightness: Brightness.light,
      );
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          const OutlinedButtonThemeData(
            style: ButtonStyle(),
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'OutlinedButton FST23.4 outline-M2: GIVEN a custom '
        'FlexSubTheme.outlinedButtonTheme() '
        'EXPECT '
        'equal to OutlinedButtonThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          outlineSchemeColor: SchemeColor.tertiary,
          useMaterial3: false,
        ).toString(),
        equalsIgnoringHashCodes(
          OutlinedButtonThemeData(
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
                  return FlexSubThemes.tintedDisable(
                    colorScheme.onSurface,
                    colorScheme.secondary,
                  );
                }
                return colorScheme.secondary;
              }),
              iconColor: WidgetStateProperty.resolveWith<Color?>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.disabled)) {
                  return FlexSubThemes.tintedDisable(
                    colorScheme.onSurface,
                    colorScheme.secondary,
                  );
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
                return Colors.transparent;
              }),
              side: WidgetStateProperty.resolveWith<BorderSide?>((
                final Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.disabled)) {
                  return BorderSide(
                    color: colorScheme.tertiary
                        .blendAlpha(colorScheme.onSurface, 0x66)
                        .withAlpha(0x26),
                    width: 1.5,
                  );
                }
                if (states.contains(WidgetState.error)) {
                  return BorderSide(color: colorScheme.error, width: 2);
                }
                if (states.contains(WidgetState.pressed)) {
                  return BorderSide(color: colorScheme.tertiary, width: 2);
                }
                return BorderSide(
                  color: colorScheme.tertiary.withValues(alpha: 0.12),
                  width: 1.5,
                );
              }),
            ),
          ).toString(),
        ),
      );
    });

    test(
        'OutlinedButton FST23.5 outline-M3: GIVEN a custom '
        'FlexSubTheme.outlinedButtonTheme() '
        'EXPECT '
        'equal to OutlinedButtonThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF7142E7),
        brightness: Brightness.light,
      );
      final WidgetStateProperty<Color?> foregroundColor =
          WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return colorScheme.onSurface.withValues(alpha: 0.38);
        }
        return colorScheme.secondary;
      });

      final WidgetStateProperty<Color?> overlayColor =
          WidgetStateProperty.resolveWith((Set<WidgetState> states) {
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
      });

      final WidgetStateProperty<BorderSide?> side =
          WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return BorderSide(
            color: colorScheme.onSurface.withValues(alpha: 0.12),
            width: 1,
          );
        }
        if (states.contains(WidgetState.error)) {
          return BorderSide(color: colorScheme.error, width: 1);
        }
        if (states.contains(WidgetState.pressed)) {
          return BorderSide(color: colorScheme.tertiary, width: 1);
        }
        return BorderSide(color: colorScheme.tertiary, width: 1);
      });
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          outlineSchemeColor: SchemeColor.tertiary,
          padding: const EdgeInsets.symmetric(horizontal: 17),
          minButtonSize: const Size(52, 40),
          radius: 13,
          useMaterial3: true,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          OutlinedButtonThemeData(
            style: ButtonStyle(
              foregroundColor: foregroundColor,
              iconColor: foregroundColor,
              overlayColor: overlayColor,
              minimumSize: ButtonStyleButton.allOrNull<Size>(
                const Size(52, 40),
              ),
              padding: ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(horizontal: 17),
              ),
              side: side,
              shape: ButtonStyleButton.allOrNull<OutlinedBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(13)),
                ),
              ),
            ),
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });

    test(
        'OutlinedButton FST23.6 states-M2: Does '
        'OutlinedButton have right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      final OutlinedButtonThemeData button = FlexSubThemes.outlinedButtonTheme(
        colorScheme: colorScheme,
        baseSchemeColor: SchemeColor.primary,
        useMaterial3: false,
      );
      // Disabled foreground
      expect(
        button.style!.foregroundColor!.resolve(<WidgetState>{
          WidgetState.disabled,
        }),
        colorScheme.onSurface.withValues(alpha: 0x61 / 255),
      );
      expect(
        button.style!.iconColor!.resolve(<WidgetState>{WidgetState.disabled}),
        colorScheme.onSurface.withValues(alpha: 0x61 / 255),
      );
      expect(
        button.style!.foregroundColor!.resolve(<WidgetState>{
          WidgetState.selected,
        }),
        colorScheme.primary,
      );
      expect(
        button.style!.iconColor!.resolve(<WidgetState>{WidgetState.selected}),
        colorScheme.primary,
      );
      expect(
        button.style!.foregroundColor!.resolve(<WidgetState>{}),
        colorScheme.primary,
      );
      expect(
        button.style!.iconColor!.resolve(<WidgetState>{}),
        colorScheme.primary,
      );
      // Overlay color states
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        colorScheme.primary.withValues(alpha: 0x14 / 255),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        colorScheme.primary.withValues(alpha: 0x1F / 255),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        colorScheme.primary.withValues(alpha: 0x1F / 255),
      );
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primary,
        ).style!.overlayColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(null),
      );
      // Border side states
      expect(
        button.style!.side!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(
          BorderSide(
            color: colorScheme.onSurface.withValues(alpha: 0x1F / 255),
            width: 1,
          ),
        ),
      );
      expect(
        button.style!.side!.resolve(<WidgetState>{WidgetState.error}),
        equals(BorderSide(color: colorScheme.error, width: 2)),
      );
      expect(
        button.style!.side!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(BorderSide(color: colorScheme.primary, width: 2)),
      );
      expect(
        button.style!.side!.resolve(<WidgetState>{WidgetState.selected}),
        equals(BorderSide(color: colorScheme.primary, width: 1)),
      );
    });
    test(
        'OutlinedButton FST23.7 states-custom-M2: Does '
        'OutlinedButton have right states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF42AEE7),
        brightness: Brightness.light,
      );
      final OutlinedButtonThemeData button = FlexSubThemes.outlinedButtonTheme(
        colorScheme: colorScheme,
        baseSchemeColor: SchemeColor.tertiary,
        outlineSchemeColor: SchemeColor.primaryContainer,
        useTintedDisable: true,
        useTintedInteraction: true,
        useMaterial3: false,
      );
      final Color overlay = colorScheme.surface;
      final Color tint = colorScheme.tertiary;
      // Disabled foreground
      expect(
        button.style!.foregroundColor!.resolve(<WidgetState>{
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
        button.style!.iconColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(
          FlexSubThemes.tintedDisable(
            colorScheme.onSurface,
            colorScheme.tertiary,
          ),
        ),
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
        equals(FlexSubThemes.tintedHovered(overlay, tint, 5)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        equals(FlexSubThemes.tintedFocused(overlay, tint, 5)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(FlexSubThemes.tintedPressed(overlay, tint, 5)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{
          WidgetState.selected,
        }),
        equals(null),
      );
      // Border side states
      expect(
        button.style!.side!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(
          BorderSide(
            color: FlexSubThemes.tintedDisable(
              colorScheme.onSurface,
              colorScheme.primaryContainer,
            ).withValues(alpha: kAlphaLowDisabledFloat),
            width: 1,
          ),
        ),
      );
      expect(
        button.style!.side!.resolve(<WidgetState>{WidgetState.error}),
        equals(BorderSide(color: colorScheme.error, width: 2)),
      );
      expect(
        button.style!.side!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(BorderSide(color: colorScheme.primaryContainer, width: 2)),
      );
      expect(
        button.style!.side!.resolve(<WidgetState>{WidgetState.selected}),
        equals(BorderSide(color: colorScheme.primaryContainer, width: 1)),
      );
    });
    test(
        'OutlinedButton FST23.8 states-M3: Does '
        'OutlinedButton have right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      final OutlinedButtonThemeData button = FlexSubThemes.outlinedButtonTheme(
        colorScheme: colorScheme,
        baseSchemeColor: SchemeColor.primary,
        outlineWidth: 1.0,
        useMaterial3: true,
      );
      // Disabled foreground
      expect(
        button.style!.foregroundColor!.resolve(<WidgetState>{
          WidgetState.disabled,
        }),
        colorScheme.onSurface.withValues(alpha: 0x61 / 255),
      );
      expect(
        button.style!.iconColor!.resolve(<WidgetState>{WidgetState.disabled}),
        colorScheme.onSurface.withValues(alpha: 0x61 / 255),
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
        colorScheme.primary.withValues(alpha: 0x14 / 255),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        colorScheme.primary.withValues(alpha: 0x1F / 255),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        colorScheme.primary.withValues(alpha: 0x1F / 255),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{
          WidgetState.selected,
        }),
        equals(null),
      );
      // Border side states
      expect(
        button.style!.side!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(
          BorderSide(
            color: colorScheme.onSurface.withValues(alpha: 0x1F / 255),
            width: 1.0,
          ),
        ),
      );
      expect(
        button.style!.side!.resolve(<WidgetState>{WidgetState.error}),
        equals(BorderSide(color: colorScheme.error, width: 1.0)),
      );
      expect(
        button.style!.side!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(BorderSide(color: colorScheme.outline, width: 1.0)),
      );
      expect(
        button.style!.side!.resolve(<WidgetState>{WidgetState.selected}),
        equals(BorderSide(color: colorScheme.outline, width: 1.0)),
      );
    });
    test(
        'OutlinedButton FST23.9 states-M3-custom: Does '
        'OutlinedButton have right material '
        'custom states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      final OutlinedButtonThemeData button = FlexSubThemes.outlinedButtonTheme(
        colorScheme: colorScheme,
        baseSchemeColor: SchemeColor.tertiary,
        outlineSchemeColor: SchemeColor.primaryContainer,
        outlineWidth: 2,
        pressedOutlineWidth: 3,
        radius: 10,
        useMaterial3: true,
      );
      // Disabled foreground
      expect(
        button.style!.foregroundColor!.resolve(<WidgetState>{
          WidgetState.disabled,
        }),
        colorScheme.onSurface.withValues(alpha: 0x61 / 255),
      );
      expect(
        button.style!.iconColor!.resolve(<WidgetState>{WidgetState.disabled}),
        colorScheme.onSurface.withValues(alpha: 0x61 / 255),
      );
      expect(
        button.style!.foregroundColor!.resolve(<WidgetState>{
          WidgetState.selected,
        }),
        colorScheme.tertiary,
      );
      expect(
        button.style!.iconColor!.resolve(<WidgetState>{WidgetState.selected}),
        colorScheme.tertiary,
      );
      // Overlay color states
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        colorScheme.tertiary.withValues(alpha: 0x14 / 255),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        colorScheme.tertiary.withValues(alpha: 0x1F / 255),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        colorScheme.tertiary.withValues(alpha: 0x1F / 255),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{
          WidgetState.selected,
        }),
        equals(null),
      );
      // Border side states
      expect(
        button.style!.side!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(
          BorderSide(
            color: colorScheme.onSurface.withValues(alpha: 0x1F / 255),
            width: 2.0,
          ),
        ),
      );
      expect(
        button.style!.side!.resolve(<WidgetState>{WidgetState.error}),
        equals(BorderSide(color: colorScheme.error, width: 3.0)),
      );
      expect(
        button.style!.side!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(BorderSide(color: colorScheme.primaryContainer, width: 3.0)),
      );
      expect(
        button.style!.side!.resolve(<WidgetState>{WidgetState.selected}),
        equals(BorderSide(color: colorScheme.primaryContainer, width: 2.0)),
      );
      // Custom shape test
      expect(
        button.style!.shape!.resolve(<WidgetState>{}),
        equals(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      );
    });
  });
}
