import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WITH: FlexSubThemes.iconButtonTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes iconButtonTheme tests
    // -------------------------------------------------------------------------
    test(
        'IconButton 15.1: GIVEN a FlexSubTheme.iconButtonTheme() '
        'EXPECT equal to ...', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      final IconButtonThemeData bDef = FlexSubThemes.iconButtonTheme(
        colorScheme: colorScheme,
        // useTintedInteraction: false,  <- Expect false as default
      );
      expect(bDef, equals(const IconButtonThemeData()));
      final IconButtonThemeData b = FlexSubThemes.iconButtonTheme(
        colorScheme: colorScheme,
        useTintedInteraction: true,
        useTintedDisable: true,
      );
      // Disabled foreground color states
      expect(
        b.style!.foregroundColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(
          FlexSubThemes.tintedDisable(
            colorScheme.onSurface,
            colorScheme.primary,
          ),
        ),
      );
      // Overlay color states
      expect(
        b.style!.overlayColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.pressed,
        }),
        equals(
          FlexSubThemes.tintedPressed(
            colorScheme.onPrimary,
            colorScheme.primary,
            5.0,
          ),
        ),
      );
      expect(
        b.style!.overlayColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.hovered,
        }),
        equals(
          FlexSubThemes.tintedHovered(
            colorScheme.onPrimary,
            colorScheme.primary,
            5.0,
          ),
        ),
      );
      expect(
        b.style!.overlayColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.focused,
        }),
        equals(
          FlexSubThemes.tintedFocused(
            colorScheme.onPrimary,
            colorScheme.primary,
            5.0,
          ),
        ),
      );
      expect(
        b.style!.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(
          FlexSubThemes.tintedPressed(
            colorScheme.onPrimary,
            colorScheme.primary,
            5.0,
          ),
        ),
      );
      expect(
        b.style!.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(
          FlexSubThemes.tintedHovered(
            colorScheme.onPrimary,
            colorScheme.primary,
            5.0,
          ),
        ),
      );
      expect(
        b.style!.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        equals(
          FlexSubThemes.tintedFocused(
            colorScheme.onPrimary,
            colorScheme.primary,
            5.0,
          ),
        ),
      );
      expect(
        b.style!.overlayColor!.resolve(<WidgetState>{}),
        equals(Colors.transparent),
      );
    });
  });
}
