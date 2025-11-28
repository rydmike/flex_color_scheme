import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flex_color_scheme/src/flex_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: deprecated_member_use_from_same_package, for tests.

void main() {
  group('WITH: FlexSubThemes.tabBarTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes tabBarTheme tests
    // -------------------------------------------------------------------------
    test(
        'TabBar FST30.1: GIVEN a FlexSubTheme.tabBarTheme() '
        'EXPECT equal to TabBarTheme with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      );
      TabBarThemeData m = FlexSubThemes.tabBarTheme(
        colorScheme: colorScheme,
        labelColor: colorScheme.tertiary,
        dividerColor: colorScheme.outline,
        useMaterial3: true,
      );
      expect(m.dividerColor, isSameColorAs(colorScheme.outline));
      // Overlay color
      expect(
        m.overlayColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.hovered,
        }),
        isSameColorAs(colorScheme.tertiary.withAlpha(kAlphaHovered)),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.focused,
        }),
        isSameColorAs(colorScheme.tertiary.withAlpha(kAlphaFocused)),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.pressed,
        }),
        isSameColorAs(colorScheme.tertiary.withAlpha(kAlphaPressed)),
      );
      expect(
        m.overlayColor?.resolve(<WidgetState>{WidgetState.selected}),
        equals(null),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        isSameColorAs(colorScheme.onSurface.withAlpha(kAlphaHovered)),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        isSameColorAs(colorScheme.onSurface.withAlpha(kAlphaFocused)),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        isSameColorAs(colorScheme.tertiary.withAlpha(kAlphaPressed)),
      );
      expect(m.overlayColor?.resolve(<WidgetState>{}), equals(null));
      m = FlexSubThemes.tabBarTheme(
        colorScheme: colorScheme,
        dividerColor: colorScheme.outline,
        indicatorColor: colorScheme.tertiary,
        useTintedInteraction: true,
        useMaterial3: true,
      );
      // Overlay color
      expect(
        m.overlayColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.hovered,
        }),
        isSameColorAs(colorScheme.primary.withAlpha(kAlphaHovered)),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.focused,
        }),
        isSameColorAs(colorScheme.primary.withAlpha(kAlphaFocused)),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.pressed,
        }),
        isSameColorAs(colorScheme.primary.withAlpha(kAlphaPressed)),
      );
      expect(
        m.overlayColor?.resolve(<WidgetState>{WidgetState.selected}),
        equals(null),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        isSameColorAs(colorScheme.primary.withAlpha(kAlphaHovered)),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        isSameColorAs(colorScheme.primary.withAlpha(kAlphaFocused)),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        isSameColorAs(colorScheme.primary.withAlpha(kAlphaPressed)),
      );
      expect(m.overlayColor?.resolve(<WidgetState>{}), equals(null));
      m = FlexSubThemes.tabBarTheme(
        colorScheme: colorScheme,
        dividerColor: colorScheme.outline,
        labelColor: colorScheme.secondary,
        useTintedInteraction: false,
      );
      // Overlay color
      expect(
        m.overlayColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.hovered,
        }),
        isSameColorAs(colorScheme.secondary.withAlpha(kAlphaHovered)),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.focused,
        }),
        isSameColorAs(colorScheme.secondary.withAlpha(kAlphaFocused)),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.pressed,
        }),
        isSameColorAs(colorScheme.secondary.withAlpha(kAlphaPressed)),
      );
      expect(
        m.overlayColor?.resolve(<WidgetState>{WidgetState.selected}),
        equals(null),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        isSameColorAs(colorScheme.onSurface.withAlpha(kAlphaHovered)),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        isSameColorAs(colorScheme.onSurface.withAlpha(kAlphaFocused)),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        isSameColorAs(colorScheme.secondary.withAlpha(kAlphaPressed)),
      );
      expect(m.overlayColor?.resolve(<WidgetState>{}), equals(null));
    });
  });
}
