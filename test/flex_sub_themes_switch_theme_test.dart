import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flex_color_scheme/src/flex_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WITH: FlexSubThemes.switchTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes Switch tests
    // -------------------------------------------------------------------------
    test(
        'Switch FST29.1 light: GIVEN a light default M2 '
        'FlexSubTheme.switchTheme() '
        'EXPECT equal to SwitchThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).toString(),
        equalsIgnoringHashCodes(
          SwitchThemeData(
            thumbColor: WidgetStateProperty.resolveWith<Color>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.disabled)) {
                return Colors.grey.shade400;
              }
              if (states.contains(WidgetState.selected)) {
                return colorScheme.primary;
              }
              return Colors.grey.shade50;
            }),
            trackColor: WidgetStateProperty.resolveWith<Color>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.disabled)) {
                return Colors.black12;
              }
              if (states.contains(WidgetState.selected)) {
                return colorScheme.primary.withAlpha(0x70);
              }
              // Opinionated color on track when not selected
              return colorScheme.primary.withAlpha(0x30);
            }),
            overlayColor: WidgetStateProperty.resolveWith<Color?>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.selected)) {
                if (states.contains(WidgetState.pressed)) {
                  return colorScheme.primary.withValues(alpha: 0.12);
                }
                if (states.contains(WidgetState.hovered)) {
                  return colorScheme.primary.withValues(alpha: 0.08);
                }
                if (states.contains(WidgetState.focused)) {
                  return colorScheme.primary.withValues(alpha: 0.12);
                }
                return null;
              }
              if (states.contains(WidgetState.pressed)) {
                return colorScheme.onSurface.withValues(alpha: 0.12);
              }
              if (states.contains(WidgetState.hovered)) {
                return colorScheme.onSurface.withValues(alpha: 0.08);
              }
              if (states.contains(WidgetState.focused)) {
                return colorScheme.onSurface.withValues(alpha: 0.12);
              }
              return null;
            }),
          ).toString(),
        ),
      );
    });
    test(
        'Switch FST29.2 light-states: Does Switch have right '
        'M2 material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      );
      // Disabled colors
      // Disabled thumb colors
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).thumbColor!.resolve(<WidgetState>{WidgetState.disabled}),
        isSameColorAs(Colors.grey.shade400),
      );
      expect(
        FlexSubThemes.switchTheme(colorScheme: colorScheme, useMaterial3: false)
            .thumbColor!
            .resolve(<WidgetState>{WidgetState.disabled, WidgetState.selected}),
        isSameColorAs(Colors.grey.shade400),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useTintedDisable: true,
          useMaterial3: false,
        ).thumbColor!.resolve(<WidgetState>{
          WidgetState.disabled,
          WidgetState.selected,
        }),
        isSameColorAs(
          FlexSubThemes.tintedDisable(
            colorScheme.onSurface,
            colorScheme.primary,
          ),
        ),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useTintedDisable: true,
          useMaterial3: false,
        ).thumbColor!.resolve(<WidgetState>{WidgetState.disabled}),
        isSameColorAs(
          FlexSubThemes.tintedDisable(
            colorScheme.onSurface,
            colorScheme.primary,
          ).withAlpha(kAlphaLowDisabled),
        ),
      );
      // Disabled track colors
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useTintedDisable: true,
          useMaterial3: false,
        ).trackColor!.resolve(<WidgetState>{WidgetState.disabled}),
        isSameColorAs(
          FlexSubThemes.tintedDisable(
            colorScheme.onSurface,
            colorScheme.primary,
          ).withAlpha(kAlphaVeryLowDisabled),
        ),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).trackColor!.resolve(<WidgetState>{WidgetState.disabled}),
        isSameColorAs(Colors.black12),
      );
      // Selected background
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).thumbColor!.resolve(<WidgetState>{WidgetState.selected}),
        isSameColorAs(colorScheme.primary),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).trackColor!.resolve(<WidgetState>{WidgetState.selected}),
        isSameColorAs(colorScheme.primary.withAlpha(0x70)),
      );
      // Interaction states - Using test with Opacity based SDK values on
      // purpose, to confirm results match alpha based ones used by FCS.
      // Non tinted interactions
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        isSameColorAs(colorScheme.onSurface.withValues(alpha: 0.12)),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        isSameColorAs(colorScheme.onSurface.withValues(alpha: 0.08)),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        isSameColorAs(colorScheme.onSurface.withValues(alpha: 0.12)),
      );
      // Non tinted interactions - selected
      expect(
        FlexSubThemes.switchTheme(colorScheme: colorScheme, useMaterial3: false)
            .overlayColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.pressed}),
        isSameColorAs(colorScheme.primary.withValues(alpha: 0.12)),
      );
      expect(
        FlexSubThemes.switchTheme(colorScheme: colorScheme, useMaterial3: false)
            .overlayColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.hovered}),
        isSameColorAs(colorScheme.primary.withValues(alpha: 0.08)),
      );
      expect(
        FlexSubThemes.switchTheme(colorScheme: colorScheme, useMaterial3: false)
            .overlayColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.focused}),
        isSameColorAs(colorScheme.primary.withValues(alpha: 0.12)),
      );
      // Tinted interactions
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useTintedInteraction: true,
          useMaterial3: false,
        ).overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        isSameColorAs(
          FlexSubThemes.tintedPressed(
            colorScheme.surface,
            colorScheme.primary,
            1.5,
          ),
        ),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useTintedInteraction: true,
          useMaterial3: false,
        ).overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        isSameColorAs(
          FlexSubThemes.tintedHovered(
            colorScheme.surface,
            colorScheme.primary,
            1.5,
          ),
        ),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useTintedInteraction: true,
          useMaterial3: false,
        ).overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        isSameColorAs(
          FlexSubThemes.tintedFocused(
            colorScheme.surface,
            colorScheme.primary,
            1.5,
          ),
        ),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useTintedInteraction: true,
          useMaterial3: false,
        ).overlayColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.pressed,
        }),
        isSameColorAs(
          FlexSubThemes.tintedPressed(
            colorScheme.surface,
            colorScheme.primary,
            1.5,
          ),
        ),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useTintedInteraction: true,
          useMaterial3: false,
        ).overlayColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.hovered,
        }),
        isSameColorAs(
          FlexSubThemes.tintedHovered(
            colorScheme.surface,
            colorScheme.primary,
            1.5,
          ),
        ),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useTintedInteraction: true,
          useMaterial3: false,
        ).overlayColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.focused,
        }),
        isSameColorAs(
          FlexSubThemes.tintedFocused(
            colorScheme.surface,
            colorScheme.primary,
            1.5,
          ),
        ),
      );

      // Default states
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).thumbColor!.resolve(<WidgetState>{}),
        isSameColorAs(Colors.grey.shade50),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          unselectedIsColored: true,
          useMaterial3: false,
        ).trackColor!.resolve(<WidgetState>{}),
        isSameColorAs(colorScheme.primary.withAlpha(0x50)),
      );
      // Default state for trackColor when unselectedIsColored, is false
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          unselectedIsColored: false,
          useMaterial3: false,
        ).trackColor!.resolve(<WidgetState>{}),
        isSameColorAs(kSwitchM2LightTrackColor),
      );
    });

    test(
        'Switch FST29.3 dark: GIVEN a dark default FlexSubTheme.switchTheme() '
        'EXPECT equal to SwitchThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.dark,
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          unselectedIsColored: true,
          useMaterial3: false,
        ).toString(),
        equalsIgnoringHashCodes(
          SwitchThemeData(
            thumbColor: WidgetStateProperty.resolveWith<Color>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.disabled)) {
                return Colors.grey.shade800;
              }
              if (states.contains(WidgetState.selected)) {
                return colorScheme.secondary;
              }
              return Colors.grey.shade400;
            }),
            trackColor: WidgetStateProperty.resolveWith<Color>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.disabled)) {
                return Colors.white10;
              }
              if (states.contains(WidgetState.selected)) {
                return colorScheme.secondary.withAlpha(0x70);
              }
              // Opinionated color on track when not selected
              return colorScheme.secondary.withAlpha(0x25);
            }),
            overlayColor: WidgetStateProperty.resolveWith<Color?>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.selected)) {
                if (states.contains(WidgetState.pressed)) {
                  return colorScheme.primary.withValues(alpha: 0.12);
                }
                if (states.contains(WidgetState.hovered)) {
                  return colorScheme.primary.withValues(alpha: 0.08);
                }
                if (states.contains(WidgetState.focused)) {
                  return colorScheme.primary.withValues(alpha: 0.12);
                }
                return null;
              }
              if (states.contains(WidgetState.pressed)) {
                return colorScheme.onSurface.withValues(alpha: 0.12);
              }
              if (states.contains(WidgetState.hovered)) {
                return colorScheme.onSurface.withValues(alpha: 0.08);
              }
              if (states.contains(WidgetState.focused)) {
                return colorScheme.onSurface.withValues(alpha: 0.12);
              }
              return null;
            }),
          ).toString(),
        ),
      );
    });
    test(
        'Switch FST29.4 dark-states: Does Switch have right '
        'M2 material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.dark,
      );
      // Disabled colors
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).thumbColor!.resolve(<WidgetState>{WidgetState.disabled}),
        isSameColorAs(Colors.grey.shade800),
      );
      expect(
        FlexSubThemes.switchTheme(colorScheme: colorScheme, useMaterial3: false)
            .thumbColor!
            .resolve(<WidgetState>{WidgetState.disabled, WidgetState.selected}),
        isSameColorAs(Colors.grey.shade800),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useTintedDisable: true,
          useMaterial3: false,
        ).thumbColor!.resolve(<WidgetState>{
          WidgetState.disabled,
          WidgetState.selected,
        }),
        isSameColorAs(
          FlexSubThemes.tintedDisable(
            colorScheme.onSurface,
            colorScheme.primary,
          ),
        ),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useTintedDisable: true,
          useMaterial3: false,
        ).thumbColor!.resolve(<WidgetState>{WidgetState.disabled}),
        isSameColorAs(
          FlexSubThemes.tintedDisable(
            colorScheme.onSurface,
            colorScheme.primary,
          ).withAlpha(kAlphaLowDisabled),
        ),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).trackColor!.resolve(<WidgetState>{WidgetState.disabled}),
        isSameColorAs(Colors.white10),
      );
      // Selected background
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).thumbColor!.resolve(<WidgetState>{WidgetState.selected}),
        isSameColorAs(colorScheme.primary),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).trackColor!.resolve(<WidgetState>{WidgetState.selected}),
        isSameColorAs(colorScheme.primary.withAlpha(0x80)),
      );
      // Default states
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).thumbColor!.resolve(<WidgetState>{}),
        isSameColorAs(Colors.grey.shade400),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          unselectedIsColored: true,
          useMaterial3: false,
        ).trackColor!.resolve(<WidgetState>{}),
        isSameColorAs(colorScheme.primary.withAlpha(0x65)),
      );
      // Default state for trackColor when unselectedIsColored, is false
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          unselectedIsColored: false,
          useMaterial3: false,
        ).trackColor!.resolve(<WidgetState>{}),
        isSameColorAs(Colors.white30),
      );
    });
    test(
        'Switch FST29.5 custom-light: GIVEN a light custom '
        'FlexSubTheme.switchTheme() '
        'EXPECT equal to SwitchThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          splashRadius: 30,
          unselectedIsColored: true,
          useMaterial3: false,
        ).toString(),
        equalsIgnoringHashCodes(
          SwitchThemeData(
            splashRadius: 30,
            thumbColor: WidgetStateProperty.resolveWith<Color>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.disabled)) {
                return Colors.grey.shade400;
              }
              if (states.contains(WidgetState.selected)) {
                return colorScheme.tertiary;
              }
              return Colors.grey.shade50;
            }),
            trackColor: WidgetStateProperty.resolveWith<Color>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.disabled)) {
                return Colors.black12;
              }
              if (states.contains(WidgetState.selected)) {
                return colorScheme.tertiary.withAlpha(0x70);
              }
              // Opinionated color on track when not selected
              return colorScheme.tertiary.withAlpha(0x30);
            }),
            overlayColor: WidgetStateProperty.resolveWith<Color?>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.selected)) {
                if (states.contains(WidgetState.pressed)) {
                  return colorScheme.primary.withValues(alpha: 0.12);
                }
                if (states.contains(WidgetState.hovered)) {
                  return colorScheme.primary.withValues(alpha: 0.08);
                }
                if (states.contains(WidgetState.focused)) {
                  return colorScheme.primary.withValues(alpha: 0.12);
                }
                return null;
              }
              if (states.contains(WidgetState.pressed)) {
                return colorScheme.onSurface.withValues(alpha: 0.12);
              }
              if (states.contains(WidgetState.hovered)) {
                return colorScheme.onSurface.withValues(alpha: 0.08);
              }
              if (states.contains(WidgetState.focused)) {
                return colorScheme.onSurface.withValues(alpha: 0.12);
              }
              return null;
            }),
          ).toString(),
        ),
      );
    });
    test(
        'Switch FST29.6 light-M3-states: '
        'Does Switch have right M3 states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      );
      final SwitchThemeData switchTheme = FlexSubThemes.switchTheme(
        colorScheme: colorScheme,
        useMaterial3: true,
      );
      // Thumb Icons - no icon
      Icon? icon = FlexSubThemes.switchTheme(
        colorScheme: colorScheme,
        useMaterial3: true,
      ).thumbIcon?.resolve(<WidgetState>{});
      expect(icon, equals(null));
      icon = FlexSubThemes.switchTheme(
        colorScheme: colorScheme,
        thumbFixedSize: false,
        useMaterial3: true,
      ).thumbIcon?.resolve(<WidgetState>{});
      expect(icon, equals(null));
      // Thumb Icons - has hidden icon for fixed size thumb effect.
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          thumbFixedSize: true,
          useMaterial3: true,
        ).thumbIcon!.resolve(<WidgetState>{})!.icon,
        equals(Icons.minimize),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          thumbFixedSize: true,
          useMaterial3: true,
        ).thumbIcon!.resolve(<WidgetState>{})!.color,
        equals(Colors.transparent),
      );
      // Disabled thumb colors
      expect(
        switchTheme.thumbColor!.resolve(<WidgetState>{
          WidgetState.disabled,
          WidgetState.selected,
        }),
        isSameColorAs(colorScheme.surface),
      );
      expect(
        switchTheme.thumbColor!.resolve(<WidgetState>{WidgetState.disabled}),
        isSameColorAs(colorScheme.onSurface.withValues(alpha: 0.38)),
      );
      expect(
        switchTheme.trackOutlineColor!.resolve(<WidgetState>{}),
        isSameColorAs(colorScheme.outline),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useTintedDisable: true,
          useMaterial3: true,
        ).thumbColor!.resolve(<WidgetState>{WidgetState.disabled}),
        isSameColorAs(
          FlexSubThemes.tintedDisable(
            colorScheme.onSurface,
            colorScheme.primary,
          ),
        ),
      );
      // Disabled track colors
      expect(
        switchTheme.trackColor!.resolve(<WidgetState>{
          WidgetState.disabled,
          WidgetState.selected,
        }),
        isSameColorAs(colorScheme.onSurface.withValues(alpha: 0.12)),
      );
      expect(
        switchTheme.trackColor!.resolve(<WidgetState>{WidgetState.disabled}),
        isSameColorAs(
          colorScheme.surfaceContainerHighest.withValues(alpha: 0.12),
        ),
      );
      expect(
        switchTheme.trackOutlineColor!.resolve(<WidgetState>{
          WidgetState.disabled,
        }),
        isSameColorAs(colorScheme.onSurface.withValues(alpha: 0.12)),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useTintedDisable: true,
          useMaterial3: true,
        ).trackColor!.resolve(<WidgetState>{
          WidgetState.disabled,
          WidgetState.selected,
        }),
        isSameColorAs(
          FlexSubThemes.tintedDisable(
            colorScheme.onSurface,
            colorScheme.primary,
          ),
        ),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useTintedDisable: true,
          useMaterial3: true,
        ).trackOutlineColor!.resolve(<WidgetState>{WidgetState.disabled}),
        isSameColorAs(
          FlexSubThemes.tintedDisable(
            colorScheme.onSurface,
            colorScheme.primary,
          ),
        ),
      );

      // Selected thumb colors
      expect(
        switchTheme.thumbColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.pressed,
        }),
        isSameColorAs(colorScheme.primaryContainer),
      );
      expect(
        switchTheme.thumbColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.hovered,
        }),
        isSameColorAs(colorScheme.primaryContainer),
      );
      expect(
        switchTheme.thumbColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.focused,
        }),
        isSameColorAs(colorScheme.primaryContainer),
      );
      expect(
        switchTheme.thumbColor!.resolve(<WidgetState>{WidgetState.selected}),
        isSameColorAs(colorScheme.onPrimary),
      );
      // Selected track color
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).trackColor!.resolve(<WidgetState>{WidgetState.selected}),
        isSameColorAs(colorScheme.primary.withAlpha(0x70)),
      );
      // Pressed color
      expect(
        switchTheme.thumbColor!.resolve(<WidgetState>{WidgetState.pressed}),
        isSameColorAs(colorScheme.onSurfaceVariant),
      );
      // Hovered color
      expect(
        switchTheme.thumbColor!.resolve(<WidgetState>{WidgetState.hovered}),
        isSameColorAs(colorScheme.onSurfaceVariant),
      );
      // Focused color
      expect(
        switchTheme.thumbColor!.resolve(<WidgetState>{WidgetState.focused}),
        isSameColorAs(colorScheme.onSurfaceVariant),
      );

      // Interaction states - Using test with Opacity based SDK values on
      // purpose, to confirm results match alpha based ones used by FCS.
      // Non tinted interactions
      // Overlay colors
      expect(
        switchTheme.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        isSameColorAs(colorScheme.onSurface.withValues(alpha: 0.12)),
      );
      expect(
        switchTheme.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        isSameColorAs(colorScheme.onSurface.withValues(alpha: 0.08)),
      );
      expect(
        switchTheme.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        isSameColorAs(colorScheme.onSurface.withValues(alpha: 0.12)),
      );
      // trackColor
      expect(
        switchTheme.trackColor!.resolve(<WidgetState>{WidgetState.pressed}),
        isSameColorAs(colorScheme.surfaceContainerHighest),
      );
      expect(
        switchTheme.trackColor!.resolve(<WidgetState>{WidgetState.hovered}),
        isSameColorAs(colorScheme.surfaceContainerHighest),
      );
      expect(
        switchTheme.trackColor!.resolve(<WidgetState>{WidgetState.focused}),
        isSameColorAs(colorScheme.surfaceContainerHighest),
      );
      expect(
        switchTheme.trackColor!.resolve(<WidgetState>{}),
        isSameColorAs(colorScheme.surfaceContainerHighest),
      );

      expect(
        switchTheme.trackColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.pressed,
        }),
        isSameColorAs(colorScheme.primary),
      );
      expect(
        switchTheme.trackColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.hovered,
        }),
        isSameColorAs(colorScheme.primary),
      );
      expect(
        switchTheme.trackColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.focused,
        }),
        isSameColorAs(colorScheme.primary),
      );
      // Non tinted interactions - selected
      expect(
        switchTheme.overlayColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.pressed,
        }),
        isSameColorAs(colorScheme.primary.withValues(alpha: 0.12)),
      );
      expect(
        switchTheme.overlayColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.hovered,
        }),
        isSameColorAs(colorScheme.primary.withValues(alpha: 0.08)),
      );
      expect(
        switchTheme.overlayColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.focused,
        }),
        isSameColorAs(colorScheme.primary.withValues(alpha: 0.12)),
      );
      expect(
        switchTheme.trackColor!.resolve(<WidgetState>{WidgetState.selected}),
        isSameColorAs(colorScheme.primary),
      );
      // Tinted interactions
      // Overlay color
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useTintedInteraction: true,
          useMaterial3: true,
        ).overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        isSameColorAs(
          FlexSubThemes.tintedPressed(
            colorScheme.surface,
            colorScheme.primary,
            1.5,
          ),
        ),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useTintedInteraction: true,
          useMaterial3: true,
        ).overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        isSameColorAs(
          FlexSubThemes.tintedHovered(
            colorScheme.surface,
            colorScheme.primary,
            1.5,
          ),
        ),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useTintedInteraction: true,
          useMaterial3: true,
        ).overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        isSameColorAs(
          FlexSubThemes.tintedFocused(
            colorScheme.surface,
            colorScheme.primary,
            1.5,
          ),
        ),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useTintedInteraction: true,
          useMaterial3: true,
        ).overlayColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.pressed,
        }),
        isSameColorAs(
          FlexSubThemes.tintedPressed(
            colorScheme.surface,
            colorScheme.primary,
            1.5,
          ),
        ),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useTintedInteraction: true,
          useMaterial3: true,
        ).overlayColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.hovered,
        }),
        isSameColorAs(
          FlexSubThemes.tintedHovered(
            colorScheme.surface,
            colorScheme.primary,
            1.5,
          ),
        ),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useTintedInteraction: true,
          useMaterial3: true,
        ).overlayColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.focused,
        }),
        isSameColorAs(
          FlexSubThemes.tintedFocused(
            colorScheme.surface,
            colorScheme.primary,
            1.5,
          ),
        ),
      );

      // Unselected is colored
      // trackColor color
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          unselectedIsColored: true,
          useMaterial3: true,
        ).trackColor!.resolve(<WidgetState>{WidgetState.pressed}),
        isSameColorAs(colorScheme.primary.withAlpha(0x33)),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          unselectedIsColored: true,
          useMaterial3: true,
        ).trackColor!.resolve(<WidgetState>{WidgetState.hovered}),
        isSameColorAs(colorScheme.primary.withAlpha(0x33)),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          unselectedIsColored: true,
          useMaterial3: true,
        ).trackColor!.resolve(<WidgetState>{WidgetState.focused}),
        isSameColorAs(colorScheme.primary.withAlpha(0x33)),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          unselectedIsColored: true,
          useMaterial3: true,
        ).trackColor!.resolve(<WidgetState>{}),
        isSameColorAs(colorScheme.primary.withAlpha(0x33)),
      );

      // Default states
      expect(
        switchTheme.thumbColor!.resolve(<WidgetState>{}),
        isSameColorAs(colorScheme.outline),
      );
      expect(
        switchTheme.trackColor!.resolve(<WidgetState>{}),
        isSameColorAs(colorScheme.surfaceContainerHighest),
      );
      expect(
        switchTheme.trackOutlineColor!.resolve(<WidgetState>{}),
        isSameColorAs(colorScheme.outline),
      );
      // Default state for trackColor when unselectedIsColored, is false
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          unselectedIsColored: false,
          useMaterial3: true,
        ).trackColor!.resolve(<WidgetState>{}),
        isSameColorAs(colorScheme.surfaceContainerHighest),
      );
      // Default state for trackColor when unselectedIsColored, is true
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          unselectedIsColored: true,
          useMaterial3: true,
        ).trackColor!.resolve(<WidgetState>{}),
        isSameColorAs(colorScheme.primary.withAlpha(0x33)),
      );
    });

    test(
        'Switch FST29.7 LIGHT Cupertino-like Switch: '
        'Does Switch have right states?', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      );
      final SwitchThemeData switchTheme = FlexSubThemes.switchTheme(
        colorScheme: colorScheme,
        useCupertinoStyle: true,
      );
      // Thumb Icons - hidden icon.
      final Icon? usedIcon = switchTheme.thumbIcon?.resolve(<WidgetState>{});
      expect(usedIcon!.icon, equals(Icons.minimize));
      expect(usedIcon.color, equals(Colors.transparent));
      // Disabled thumb colors
      expect(
        switchTheme.thumbColor!.resolve(<WidgetState>{WidgetState.disabled}),
        isSameColorAs(Colors.white.withValues(alpha: 0.5)),
      );
      // All other thumb colors
      expect(
        switchTheme.thumbColor!.resolve(<WidgetState>{}),
        isSameColorAs(Colors.white),
      );
      // Track colors
      const CupertinoDynamicColor cup = CupertinoColors.secondarySystemFill;
      expect(
        switchTheme.trackColor!.resolve(<WidgetState>{}),
        isSameColorAs(cup.color),
      );
      // Disabled selected track colors
      expect(
        switchTheme.trackColor!.resolve(<WidgetState>{
          WidgetState.disabled,
          WidgetState.selected,
        }),
        equals(colorScheme.primary.withValues(alpha: 0.5)),
      );
      expect(
        switchTheme.trackColor!.resolve(<WidgetState>{WidgetState.disabled}),
        isSameColorAs(cup.color.withValues(alpha: 0.07)),
      );
      // Track outline color focused
      expect(
        switchTheme.trackOutlineColor!.resolve(<WidgetState>{
          WidgetState.focused,
        }),
        isSameColorAs(
          HSLColor.fromColor(
            colorScheme.primary.withValues(alpha: 0.80),
          ).withLightness(0.69).withSaturation(0.835).toColor(),
        ),
      );
      // Track outline color all other cases
      expect(
        switchTheme.trackOutlineColor!.resolve(<WidgetState>{}),
        equals(Colors.transparent),
      );
      // Track outline width focused
      expect(
        switchTheme.trackOutlineWidth!.resolve(<WidgetState>{
          WidgetState.focused,
        }),
        equals(3.5),
      );
      // Track outline width all other cases
      expect(
        switchTheme.trackOutlineWidth!.resolve(<WidgetState>{}),
        equals(0),
      );
      // Overlay color
      expect(
        switchTheme.overlayColor!.resolve(<WidgetState>{}),
        equals(Colors.transparent),
      );
      // The mouseCursor style
      expect(
        switchTheme.mouseCursor!.resolve(<WidgetState>{}),
        equals(kIsWeb ? SystemMouseCursors.click : SystemMouseCursors.basic),
      );
      // The mouseCursor disabled
      expect(
        switchTheme.mouseCursor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(SystemMouseCursors.basic),
      );
      // Zero splash radius
      expect(switchTheme.splashRadius, equals(0));
    });
    test(
        'Switch FST29.7 DARK Cupertino-like Switch: '
        'Does Switch have right states?', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.dark,
      );
      final SwitchThemeData switchTheme = FlexSubThemes.switchTheme(
        colorScheme: colorScheme,
        useCupertinoStyle: true,
      );
      // Track colors
      const CupertinoDynamicColor cup = CupertinoColors.secondarySystemFill;
      expect(
        switchTheme.trackColor!.resolve(<WidgetState>{}),
        isSameColorAs(cup.darkColor),
      );
      // Disabled selected track colors
      expect(
        switchTheme.trackColor!.resolve(<WidgetState>{
          WidgetState.disabled,
          WidgetState.selected,
        }),
        isSameColorAs(colorScheme.primary.withValues(alpha: 0.5)),
      );
      expect(
        switchTheme.trackColor!.resolve(<WidgetState>{WidgetState.disabled}),
        isSameColorAs(cup.darkColor.withValues(alpha: 0.16)),
      );
      // Track outline color focused
      expect(
        switchTheme.trackOutlineColor!.resolve(<WidgetState>{
          WidgetState.focused,
        }),
        isSameColorAs(
          HSLColor.fromColor(
            colorScheme.primary.withValues(alpha: 0.80),
          ).withLightness(0.69).withSaturation(0.835).toColor(),
        ),
      );
    });
  });
}
