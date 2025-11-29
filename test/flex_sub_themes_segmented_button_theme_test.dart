import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flex_color_scheme/src/flex_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WITH: FlexSubThemes.segmentedButtonTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes segmentedButtonTheme tests
    // -------------------------------------------------------------------------
    test(
        'SegmentedButton FST26.1: GIVEN a FlexSubTheme.segmentedButtonTheme() '
        'EXPECT equal to SegmentedButtonThemeData with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      //
      // Baseline test, M2 and defaults
      SegmentedButtonThemeData m = FlexSubThemes.segmentedButtonTheme(
        colorScheme: colorScheme,
        borderWidth: 2,
        useMaterial3: false,
      );
      expect(
        m.style?.minimumSize?.resolve(<WidgetState>{}),
        equals(const Size(40, 40)),
      );
      expect(m.style?.padding?.resolve(<WidgetState>{}), equals(null));
      //
      // background color
      expect(
        m.style?.backgroundColor?.resolve(<WidgetState>{WidgetState.disabled}),
        equals(null),
      );
      expect(
        m.style?.backgroundColor?.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.primary),
      );
      expect(m.style?.backgroundColor?.resolve(<WidgetState>{}), equals(null));
      //
      // foregroundColor color
      expect(
        m.style?.foregroundColor?.resolve(<WidgetState>{WidgetState.disabled}),
        equals(colorScheme.onSurface.withAlpha(kAlphaDisabled)),
      );
      expect(
        m.style?.iconColor?.resolve(<WidgetState>{WidgetState.disabled}),
        equals(colorScheme.onSurface.withAlpha(kAlphaDisabled)),
      );
      expect(
        m.style?.foregroundColor?.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.pressed,
        }),
        equals(colorScheme.onPrimary),
      );
      expect(
        m.style?.iconColor?.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.pressed,
        }),
        equals(colorScheme.onPrimary),
      );
      expect(
        m.style?.foregroundColor?.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.hovered,
        }),
        equals(colorScheme.onPrimary),
      );
      expect(
        m.style?.iconColor?.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.hovered,
        }),
        equals(colorScheme.onPrimary),
      );
      expect(
        m.style?.foregroundColor?.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.focused,
        }),
        equals(colorScheme.onPrimary),
      );
      expect(
        m.style?.iconColor?.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.focused,
        }),
        equals(colorScheme.onPrimary),
      );
      expect(
        m.style?.foregroundColor?.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.onPrimary),
      );
      expect(
        m.style?.iconColor?.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.onPrimary),
      );
      expect(
        m.style?.foregroundColor?.resolve(<WidgetState>{}),
        equals(colorScheme.onSurface),
      );
      expect(
        m.style?.iconColor?.resolve(<WidgetState>{}),
        equals(colorScheme.onSurface),
      );
      //
      // overlayColor color
      expect(
        m.style?.overlayColor?.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.hovered,
        }),
        equals(colorScheme.surface.withAlpha(kAlphaHovered)),
      );
      expect(
        m.style?.overlayColor?.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.focused,
        }),
        equals(colorScheme.surface.withAlpha(kAlphaFocused)),
      );
      expect(
        m.style?.overlayColor?.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.pressed,
        }),
        equals(colorScheme.surface.withAlpha(kAlphaPressed)),
      );
      expect(
        m.style?.overlayColor?.resolve(<WidgetState>{WidgetState.hovered}),
        equals(colorScheme.onSurface.withAlpha(kAlphaHovered)),
      );
      expect(
        m.style?.overlayColor?.resolve(<WidgetState>{WidgetState.focused}),
        equals(colorScheme.onSurface.withAlpha(kAlphaFocused)),
      );
      expect(
        m.style?.overlayColor?.resolve(<WidgetState>{WidgetState.pressed}),
        equals(colorScheme.onSurface.withAlpha(kAlphaPressed)),
      );
      expect(m.style?.overlayColor?.resolve(<WidgetState>{}), equals(null));
      //
      // side
      expect(
        m.style?.side?.resolve(<WidgetState>{WidgetState.disabled}),
        equals(
          BorderSide(
            color: colorScheme.onSurface.withAlpha(kAlphaVeryLowDisabled),
            width: 2,
          ),
        ),
      );
      expect(
        m.style?.side?.resolve(<WidgetState>{}),
        equals(BorderSide(color: colorScheme.primary, width: 2)),
      );
      //
      // Baseline test, M3 and tints
      m = FlexSubThemes.segmentedButtonTheme(
        colorScheme: colorScheme,
        useTintedInteraction: true,
        useTintedDisable: true,
        useMaterial3: true,
      );
      //
      // foregroundColor
      expect(
        m.style?.foregroundColor?.resolve(<WidgetState>{WidgetState.disabled}),
        equals(
          FlexSubThemes.tintedDisable(
            colorScheme.onSurface,
            colorScheme.secondaryContainer,
          ),
        ),
      );
      expect(
        m.style?.iconColor?.resolve(<WidgetState>{WidgetState.disabled}),
        equals(
          FlexSubThemes.tintedDisable(
            colorScheme.onSurface,
            colorScheme.secondaryContainer,
          ),
        ),
      );
      //
      // overlayColor color
      expect(
        m.style?.overlayColor?.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.hovered,
        }),
        equals(
          FlexSubThemes.tintedHovered(
            colorScheme.onSecondaryContainer,
            colorScheme.secondaryContainer,
            4.0,
          ),
        ),
      );
      expect(
        m.style?.overlayColor?.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.focused,
        }),
        equals(
          FlexSubThemes.tintedFocused(
            colorScheme.onSecondaryContainer,
            colorScheme.secondaryContainer,
            4.0,
          ),
        ),
      );
      expect(
        m.style?.overlayColor?.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.pressed,
        }),
        equals(
          FlexSubThemes.tintedPressed(
            colorScheme.onSecondaryContainer,
            colorScheme.secondaryContainer,
            4.0,
          ),
        ),
      );
      expect(
        m.style?.overlayColor?.resolve(<WidgetState>{WidgetState.hovered}),
        equals(
          FlexSubThemes.tintedHovered(
            colorScheme.surface,
            colorScheme.secondaryContainer,
            4.0,
          ),
        ),
      );
      expect(
        m.style?.overlayColor?.resolve(<WidgetState>{WidgetState.focused}),
        equals(
          FlexSubThemes.tintedFocused(
            colorScheme.surface,
            colorScheme.secondaryContainer,
            4.0,
          ),
        ),
      );
      expect(
        m.style?.overlayColor?.resolve(<WidgetState>{WidgetState.pressed}),
        equals(
          FlexSubThemes.tintedPressed(
            colorScheme.surface,
            colorScheme.secondaryContainer,
            4.0,
          ),
        ),
      );
      expect(m.style?.overlayColor?.resolve(<WidgetState>{}), equals(null));
      // side
      expect(
        m.style?.side?.resolve(<WidgetState>{WidgetState.disabled}),
        equals(
          BorderSide(
            color: FlexSubThemes.tintedDisable(
              colorScheme.onSurface,
              colorScheme.secondaryContainer,
            ).withAlpha(kAlphaLowDisabled),
            width: 1,
          ),
        ),
      );
      // Baseline test, M3 and tints
      m = FlexSubThemes.segmentedButtonTheme(
        colorScheme: colorScheme,
        selectedSchemeColor: SchemeColor.tertiary,
        selectedForegroundSchemeColor: SchemeColor.tertiaryContainer,
        unselectedSchemeColor: SchemeColor.primaryContainer,
        unselectedForegroundSchemeColor: SchemeColor.onSecondaryContainer,
        borderSchemeColor: SchemeColor.primaryContainer,
        useTintedInteraction: false,
        useTintedDisable: true,
        useMaterial3: true,
      );
      expect(
        m.style?.foregroundColor?.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.tertiaryContainer),
      );
      expect(
        m.style?.iconColor?.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.tertiaryContainer),
      );
      //
      // overlayColor color
      expect(
        m.style?.overlayColor?.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.hovered,
        }),
        equals(colorScheme.primaryContainer.withAlpha(kAlphaHovered)),
      );
      expect(
        m.style?.overlayColor?.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.focused,
        }),
        equals(colorScheme.primaryContainer.withAlpha(kAlphaFocused)),
      );
      expect(
        m.style?.overlayColor?.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.pressed,
        }),
        equals(colorScheme.primaryContainer.withAlpha(kAlphaPressed)),
      );
      expect(
        m.style?.overlayColor?.resolve(<WidgetState>{WidgetState.hovered}),
        equals(colorScheme.onSecondaryContainer.withAlpha(kAlphaHovered)),
      );
      expect(
        m.style?.overlayColor?.resolve(<WidgetState>{WidgetState.focused}),
        equals(colorScheme.onSecondaryContainer.withAlpha(kAlphaFocused)),
      );
      expect(
        m.style?.overlayColor?.resolve(<WidgetState>{WidgetState.pressed}),
        equals(colorScheme.onSecondaryContainer.withAlpha(kAlphaPressed)),
      );
      expect(m.style?.overlayColor?.resolve(<WidgetState>{}), equals(null));
      expect(
        m.style?.side?.resolve(<WidgetState>{}),
        equals(BorderSide(color: colorScheme.primaryContainer, width: 1)),
      );
    });
  });
}
