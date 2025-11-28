import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flex_color_scheme/src/flex_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: deprecated_member_use_from_same_package, for tests.

void main() {
  group('WITH: FlexSubThemes.sliderTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes Slider tests
    // -------------------------------------------------------------------------
    test(
        'Slider FST27.1 light: GIVEN a light default '
        'FlexSubTheme.sliderTheme() '
        'EXPECT equal to SliderThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.sliderTheme(
          colorScheme: colorScheme,
        ).toString(minLevel: DiagnosticLevel.debug),
        equalsIgnoringHashCodes(
          const SliderThemeData(
            activeTrackColor: Color(0xff6200ee),
            inactiveTrackColor: Color(0x3d6200ee),
            disabledActiveTrackColor: Color(0x52000000),
            disabledInactiveTrackColor: Color(0x1f000000),
            activeTickMarkColor: Color(0x8affffff),
            inactiveTickMarkColor: Color(0x8a6200ee),
            disabledActiveTickMarkColor: Color(0x1fffffff),
            disabledInactiveTickMarkColor: Color(0x1f000000),
            thumbColor: Color(0xff6200ee),
            disabledThumbColor: Color(0xff9e9e9e),
            overlayColor: Color(0x00000000),
            // valueIndicatorShape: DropSliderValueIndicatorShape(),
            rangeValueIndicatorShape: PaddleRangeSliderValueIndicatorShape(),
          ).toString(minLevel: DiagnosticLevel.debug),
        ),
      );
    });
    test(
        'Slider FST27.2 light: GIVEN a light custom '
        'FlexSubTheme.sliderTheme() '
        'EXPECT equal to SliderThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.sliderTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          trackHeight: 6,
          valueIndicatorColor: const Color(0xFF342342),
          valueIndicatorTextStyle: const TextStyle(color: Colors.white12),
        ).toString(minLevel: DiagnosticLevel.debug),
        equalsIgnoringHashCodes(
          const SliderThemeData(
            trackHeight: 6.0,
            activeTrackColor: Color(0xff03dac6),
            inactiveTrackColor: Color(0x3d03dac6),
            disabledActiveTrackColor: Color(0x52000000),
            disabledInactiveTrackColor: Color(0x1f000000),
            activeTickMarkColor: Color(0x8a000000),
            inactiveTickMarkColor: Color(0x8a03dac6),
            disabledActiveTickMarkColor: Color(0x1f000000),
            disabledInactiveTickMarkColor: Color(0x1f000000),
            thumbColor: Color(0xff03dac6),
            disabledThumbColor: Color(0xff9e9e9e),
            overlayColor: Color(0x00000000),
            valueIndicatorColor: Color(0xff342342),
            // valueIndicatorShape: DropSliderValueIndicatorShape(),
            rangeValueIndicatorShape: PaddleRangeSliderValueIndicatorShape(),
            valueIndicatorTextStyle: TextStyle(
              inherit: true,
              color: Color(0x1fffffff),
            ),
          ).toString(minLevel: DiagnosticLevel.debug),
        ),
      );
    });
    test(
        'Slider FST27.3: GIVEN a FlexSubTheme.sliderTheme '
        'EXPECT equal to SliderThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      SliderThemeData m = FlexSubThemes.sliderTheme(
        colorScheme: colorScheme,
        useMaterial3: true,
      );
      expect(
        m.valueIndicatorShape,
        equals(null),
      );
      expect(
        m.rangeValueIndicatorShape,
        equals(const PaddleRangeSliderValueIndicatorShape()),
      );
      expect(
        (m.overlayColor as WidgetStateColor?)!.resolve(<WidgetState>{
          WidgetState.hovered,
        }),
        equals(colorScheme.primary.withAlpha(kAlphaHovered)),
      );
      expect(
        (m.overlayColor as WidgetStateColor?)!.resolve(<WidgetState>{
          WidgetState.focused,
        }),
        equals(colorScheme.primary.withAlpha(kAlphaFocused)),
      );
      expect(
        (m.overlayColor as WidgetStateColor?)!.resolve(<WidgetState>{
          WidgetState.dragged,
        }),
        equals(colorScheme.primary.withAlpha(kAlphaFocused)),
      );
      expect(
        (m.overlayColor as WidgetStateColor?)!.resolve(<WidgetState>{}),
        equals(Colors.transparent),
      );
      m = FlexSubThemes.sliderTheme(
        colorScheme: colorScheme,
        valueIndicatorType: FlexSliderIndicatorType.rectangular,
        useTintedDisable: true,
        useTintedInteraction: true,
        useMaterial3: true,
      );
      expect(
        m.valueIndicatorShape,
        equals(const RectangularSliderValueIndicatorShape()),
      );
      expect(
        m.rangeValueIndicatorShape,
        equals(const RectangularRangeSliderValueIndicatorShape()),
      );
      expect(
        (m.overlayColor as WidgetStateColor?)!.resolve(<WidgetState>{
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
        (m.overlayColor as WidgetStateColor?)!.resolve(<WidgetState>{
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
        (m.overlayColor as WidgetStateColor?)!.resolve(<WidgetState>{
          WidgetState.dragged,
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
        (m.overlayColor as WidgetStateColor?)!.resolve(<WidgetState>{}),
        equals(Colors.transparent),
      );
      m = FlexSubThemes.sliderTheme(
        colorScheme: colorScheme,
        valueIndicatorType: FlexSliderIndicatorType.drop,
        useMaterial3: true,
      );
      expect(
        m.valueIndicatorShape,
        equals(const DropSliderValueIndicatorShape()),
      );
      expect(
        m.rangeValueIndicatorShape,
        equals(const PaddleRangeSliderValueIndicatorShape()),
      );

      m = FlexSubThemes.sliderTheme(
        colorScheme: colorScheme,
        useMaterial3: true,
        useOldM3Design: true,
      );
      expect(
        m.valueIndicatorShape,
        equals(null),
      );
      expect(
        m.rangeValueIndicatorShape,
        equals(const PaddleRangeSliderValueIndicatorShape()),
      );

      m = FlexSubThemes.sliderTheme(
        colorScheme: colorScheme,
        useMaterial3: true,
        useOldM3Design: false,
      );
      expect(
        m.valueIndicatorShape,
        equals(null),
      );
      expect(
        m.rangeValueIndicatorShape,
        equals(null),
      );

      m = FlexSubThemes.sliderTheme(
        colorScheme: colorScheme,
        valueIndicatorType: FlexSliderIndicatorType.rounded,
        useMaterial3: true,
        useOldM3Design: false,
      );
      expect(
        m.valueIndicatorShape,
        equals(const RoundedRectSliderValueIndicatorShape()),
      );
      expect(
        m.rangeValueIndicatorShape,
        equals(const RoundedRectRangeSliderValueIndicatorShape()),
      );
    });
  });
}
