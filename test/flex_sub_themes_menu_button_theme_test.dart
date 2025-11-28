import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flex_color_scheme/src/flex_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WITH: FlexSubThemes.menuButtonTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes menuButtonTheme tests
    // -------------------------------------------------------------------------
    test(
        'MenuButton FST19.1 : GIVEN a FlexSubTheme.menuButtonTheme() '
        'MenuButtonThemeData() with same values.', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      final MenuButtonThemeData m1 = FlexSubThemes.menuButtonTheme(
        colorScheme: colorScheme,
      );
      final MenuButtonThemeData m2 = FlexSubThemes.menuButtonTheme(
        colorScheme: colorScheme,
        radius: 11,
        useTintedInteraction: true,
        useTintedDisable: true,
      );
      final MenuButtonThemeData m3 = FlexSubThemes.menuButtonTheme(
        colorScheme: colorScheme,
        backgroundSchemeColor: SchemeColor.surfaceContainer,
        indicatorBackgroundSchemeColor: SchemeColor.primary,
        radius: 11,
        useTintedInteraction: true,
        useTintedDisable: true,
      );
      final MenuButtonThemeData m4 = FlexSubThemes.menuButtonTheme(
        colorScheme: colorScheme,
        backgroundSchemeColor: SchemeColor.surfaceContainer,
        indicatorBackgroundSchemeColor: SchemeColor.primary,
        radius: 11,
        useTintedInteraction: true,
        useTintedDisable: true,
      );
      final MenuButtonThemeData m5 = FlexSubThemes.menuButtonTheme(
        colorScheme: colorScheme,
        foregroundSchemeColor: SchemeColor.onSurfaceVariant,
        backgroundSchemeColor: SchemeColor.surfaceContainer,
        indicatorBackgroundSchemeColor: SchemeColor.primary,
        radius: 11,
        useTintedInteraction: true,
        useTintedDisable: true,
      );
      // No animation duration on menu buttons, this is a fix for issue:
      // https://github.com/flutter/flutter/issues/123615
      expect(m1.style!.animationDuration, equals(Duration.zero));
      // Foreground color
      expect(
        m1.style!.foregroundColor?.resolve(<WidgetState>{WidgetState.disabled}),
        equals(colorScheme.onSurface.withAlpha(kAlphaDisabled)),
      );
      expect(
        m2.style!.foregroundColor?.resolve(<WidgetState>{WidgetState.disabled}),
        equals(
          FlexSubThemes.tintedDisable(
            colorScheme.onSurface,
            colorScheme.primary,
          ),
        ),
      );
      expect(
        m5.style!.foregroundColor?.resolve(<WidgetState>{WidgetState.disabled}),
        equals(
          FlexSubThemes.tintedDisable(
            colorScheme.onSurfaceVariant,
            colorScheme.primary,
          ),
        ),
      );
      expect(
        m1.style!.foregroundColor?.resolve(<WidgetState>{WidgetState.pressed}),
        equals(colorScheme.onSurface),
      );
      expect(
        m1.style!.foregroundColor?.resolve(<WidgetState>{WidgetState.hovered}),
        equals(colorScheme.onSurface),
      );
      expect(
        m1.style!.foregroundColor?.resolve(<WidgetState>{WidgetState.focused}),
        equals(colorScheme.onSurface),
      );
      expect(
        m1.style!.foregroundColor?.resolve(<WidgetState>{}),
        equals(colorScheme.onSurface),
      );
      expect(
        m4.style!.foregroundColor?.resolve(<WidgetState>{}),
        equals(colorScheme.onSurface),
      );
      // Icon color
      expect(
        m1.style!.iconColor?.resolve(<WidgetState>{WidgetState.disabled}),
        equals(colorScheme.onSurface.withAlpha(kAlphaDisabled)),
      );
      expect(
        m2.style!.iconColor?.resolve(<WidgetState>{WidgetState.disabled}),
        equals(
          FlexSubThemes.tintedDisable(
            colorScheme.onSurface,
            colorScheme.primary,
          ),
        ),
      );
      expect(
        m5.style!.iconColor?.resolve(<WidgetState>{WidgetState.disabled}),
        equals(
          FlexSubThemes.tintedDisable(
            colorScheme.onSurfaceVariant,
            colorScheme.primary,
          ),
        ),
      );
      expect(
        m1.style!.iconColor?.resolve(<WidgetState>{WidgetState.pressed}),
        equals(colorScheme.onSurface),
      );
      expect(
        m1.style!.iconColor?.resolve(<WidgetState>{WidgetState.hovered}),
        equals(colorScheme.onSurface),
      );
      expect(
        m1.style!.iconColor?.resolve(<WidgetState>{WidgetState.focused}),
        equals(colorScheme.onSurface),
      );
      expect(
        m1.style!.iconColor?.resolve(<WidgetState>{}),
        equals(colorScheme.onSurface),
      );
      // backgroundColor color
      expect(
        m1.style!.backgroundColor?.resolve(<WidgetState>{WidgetState.pressed}),
        equals(Colors.transparent),
      );
      expect(
        m1.style!.backgroundColor?.resolve(<WidgetState>{WidgetState.hovered}),
        equals(Colors.transparent),
      );
      expect(
        m1.style!.backgroundColor?.resolve(<WidgetState>{WidgetState.focused}),
        equals(Colors.transparent),
      );
      expect(
        m1.style!.backgroundColor?.resolve(<WidgetState>{}),
        equals(Colors.transparent),
      );
      expect(
        m3.style!.backgroundColor?.resolve(<WidgetState>{WidgetState.pressed}),
        equals(colorScheme.primary),
      );
      expect(
        m3.style!.backgroundColor?.resolve(<WidgetState>{WidgetState.hovered}),
        equals(colorScheme.primary),
      );
      expect(
        m3.style!.backgroundColor?.resolve(<WidgetState>{WidgetState.focused}),
        equals(colorScheme.primary),
      );
      expect(
        m3.style!.backgroundColor?.resolve(<WidgetState>{}),
        equals(Colors.transparent),
      );
      // Overlay color
      expect(
        m1.style!.overlayColor?.resolve(<WidgetState>{WidgetState.pressed}),
        equals(colorScheme.onSurface.withAlpha(kAlphaPressed)),
      );
      expect(
        m2.style!.overlayColor?.resolve(<WidgetState>{WidgetState.pressed}),
        equals(
          FlexSubThemes.tintedPressed(
            colorScheme.surfaceContainer,
            colorScheme.primary,
            1,
          ),
        ),
      );
      expect(
        m1.style!.overlayColor?.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.onSurface.withAlpha(kAlphaPressed)),
      );
      expect(
        m2.style!.overlayColor?.resolve(<WidgetState>{WidgetState.selected}),
        equals(
          FlexSubThemes.tintedSplash(
            colorScheme.surfaceContainer,
            colorScheme.primary,
            1,
          ),
        ),
      );
      expect(
        m1.style!.overlayColor?.resolve(<WidgetState>{WidgetState.focused}),
        equals(colorScheme.onSurface.withAlpha(kAlphaSplash)),
      );
      expect(
        m2.style!.overlayColor?.resolve(<WidgetState>{WidgetState.focused}),
        equals(
          FlexSubThemes.tintedFocused(
            colorScheme.surfaceContainer,
            colorScheme.primary,
            1,
          ),
        ),
      );
      expect(
        m1.style!.overlayColor?.resolve(<WidgetState>{WidgetState.hovered}),
        equals(colorScheme.onSurface.withAlpha(kAlphaFocused)),
      );
      expect(
        m2.style!.overlayColor?.resolve(<WidgetState>{WidgetState.hovered}),
        equals(
          FlexSubThemes.tintedHovered(
            colorScheme.surfaceContainer,
            colorScheme.primary,
            1,
          ),
        ),
      );
      expect(
        m1.style!.overlayColor?.resolve(<WidgetState>{}),
        equals(Colors.transparent),
      );
      // Shape
      expect(m1.style!.shape?.resolve(<WidgetState>{}), equals(null));
      expect(
        m2.style!.shape?.resolve(<WidgetState>{}),
        equals(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(11)),
          ),
        ),
      );
    });
  });
}
