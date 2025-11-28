import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flex_color_scheme/src/flex_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: deprecated_member_use_from_same_package, for tests.

void main() {
  group('WITH: FlexSubThemes.timePickerTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes TimePicker tests
    // -------------------------------------------------------------------------
    test(
        'TimePicker FST33.1 default: GIVEN a default M2 '
        'FlexSubTheme.timePickerTheme() '
        'EXPECT equal to TimePickerThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF345234),
        brightness: Brightness.light,
      );
      expect(
        FlexSubThemes.timePickerTheme(
          colorScheme: colorScheme,
          useInputDecoratorTheme: true,
          useMaterial3: false,
        ),
        equals(
          TimePickerThemeData(
            elevation: 6,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(28)),
            ),
            hourMinuteShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            dayPeriodShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            inputDecorationTheme: const InputDecorationThemeData().copyWith(
              contentPadding: EdgeInsets.zero,
              errorStyle: const TextStyle(fontSize: 0, height: 0),
            ),
          ),
        ),
      );
    });

    test(
        'TimePicker FST33.2 scheme-based: GIVEN a default M2 '
        'FlexSubTheme.timePickerTheme() '
        'EXPECT equal to TimePickerThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.timePickerTheme(
          colorScheme: colorScheme,
          backgroundColor: const Color(0xFFDDDDDD),
          backgroundSchemeColor: SchemeColor.tertiary,
          inputDecorationTheme: const InputDecorationThemeData(),
          useInputDecoratorTheme: true,
          useMaterial3: false,
        ),
        equals(
          TimePickerThemeData(
            elevation: 6,
            backgroundColor: colorScheme.tertiary,
            // dialBackgroundColor: colorScheme.surfaceVariant,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(28)),
            ),
            hourMinuteShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            dayPeriodShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            inputDecorationTheme: const InputDecorationThemeData().copyWith(
              contentPadding: EdgeInsets.zero,
              errorStyle: const TextStyle(fontSize: 0, height: 0),
            ),
          ),
        ),
      );
    });

    test(
        'TimePicker FST33.3 background-a: GIVEN a default M2 '
        'FlexSubTheme.timePickerTheme() '
        'EXPECT equal to TimePickerThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.timePickerTheme(
          colorScheme: colorScheme,
          backgroundColor: const Color(0xFFDDDDDD),
          inputDecorationTheme: const InputDecorationThemeData(filled: true),
          useInputDecoratorTheme: true,
          useMaterial3: false,
        ),
        equals(
          TimePickerThemeData(
            elevation: 6,
            backgroundColor: const Color(0xFFDDDDDD),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(28)),
            ),
            hourMinuteShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            dayPeriodShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            inputDecorationTheme: const InputDecorationThemeData(
              filled: true,
            ).copyWith(
              contentPadding: EdgeInsets.zero,
              errorStyle: const TextStyle(fontSize: 0, height: 0),
            ),
          ),
        ),
      );
    });

    test(
        'TimePicker FST33.4 background-b: GIVEN a custom '
        'FlexSubTheme.timePickerTheme() '
        'EXPECT equal to TimePickerThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF345234),
        brightness: Brightness.light,
      );
      expect(
        FlexSubThemes.timePickerTheme(
          colorScheme: colorScheme,
          backgroundSchemeColor: SchemeColor.tertiary,
          inputDecorationTheme: const InputDecorationThemeData(filled: true),
          elementRadius: 12,
          useInputDecoratorTheme: true,
          useMaterial3: false,
        ),
        equals(
          TimePickerThemeData(
            elevation: 6,
            backgroundColor: colorScheme.tertiary,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(28)),
            ),
            hourMinuteShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            dayPeriodShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            inputDecorationTheme: const InputDecorationThemeData(
              filled: true,
            ).copyWith(
              contentPadding: EdgeInsets.zero,
              errorStyle: const TextStyle(fontSize: 0, height: 0),
            ),
          ),
        ),
      );
    });
    test(
        'TimePicker FST33.5 GIVEN a custom FlexSubTheme.timePickerTheme() '
        'EXPECT equal to TimePickerThemeData() with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF345234),
        brightness: Brightness.light,
      );
      final TimePickerThemeData m = FlexSubThemes.timePickerTheme(
        colorScheme: colorScheme,
        inputDecorationTheme: const InputDecorationThemeData(filled: true),
        useInputDecoratorTheme: true,
        useMaterial3: true,
      );
      //
      // dayPeriodColor
      expect(
        (m.dayPeriodColor as WidgetStateColor?)!.resolve(<WidgetState>{
          WidgetState.selected,
        }),
        equals(colorScheme.tertiaryContainer),
      );
      expect(
        (m.dayPeriodColor as WidgetStateColor?)!.resolve(<WidgetState>{}),
        equals(Colors.transparent),
      );
      //
      // dayPeriodTextColor
      expect(
        (m.dayPeriodTextColor as WidgetStateColor?)!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.pressed,
        }),
        equals(colorScheme.onTertiaryContainer),
      );
      expect(
        (m.dayPeriodTextColor as WidgetStateColor?)!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.focused,
        }),
        equals(colorScheme.onTertiaryContainer),
      );
      expect(
        (m.dayPeriodTextColor as WidgetStateColor?)!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.hovered,
        }),
        equals(colorScheme.onTertiaryContainer),
      );
      expect(
        (m.dayPeriodTextColor as WidgetStateColor?)!.resolve(<WidgetState>{
          WidgetState.pressed,
        }),
        equals(colorScheme.onSurfaceVariant),
      );
      expect(
        (m.dayPeriodTextColor as WidgetStateColor?)!.resolve(<WidgetState>{
          WidgetState.focused,
        }),
        equals(colorScheme.onSurfaceVariant),
      );
      expect(
        (m.dayPeriodTextColor as WidgetStateColor?)!.resolve(<WidgetState>{
          WidgetState.hovered,
        }),
        equals(colorScheme.onSurfaceVariant),
      );
      expect(
        (m.dayPeriodTextColor as WidgetStateColor?)!.resolve(<WidgetState>{}),
        equals(colorScheme.onTertiaryContainer),
      );
      //
      // hourMinuteColor
      expect(
        (m.hourMinuteColor as WidgetStateColor?)!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.pressed,
        }),
        equals(colorScheme.onPrimaryContainer),
      );
      expect(
        (m.hourMinuteColor as WidgetStateColor?)!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.focused,
        }),
        equals(
          Color.alphaBlend(
            colorScheme.onPrimaryContainer.withAlpha(kAlphaFocused),
            colorScheme.primaryContainer,
          ),
        ),
      );
      expect(
        (m.hourMinuteColor as WidgetStateColor?)!.resolve(<WidgetState>{
          WidgetState.selected,
          WidgetState.hovered,
        }),
        equals(
          Color.alphaBlend(
            colorScheme.onPrimaryContainer.withAlpha(kAlphaHovered),
            colorScheme.primaryContainer,
          ),
        ),
      );
      expect(
        (m.hourMinuteColor as WidgetStateColor?)!.resolve(<WidgetState>{
          WidgetState.selected,
        }),
        equals(
          Color.alphaBlend(
            colorScheme.primaryContainer,
            colorScheme.primaryContainer,
          ),
        ),
      );
      expect(
        (m.hourMinuteColor as WidgetStateColor?)!.resolve(<WidgetState>{
          WidgetState.pressed,
        }),
        equals(
          Color.alphaBlend(
            colorScheme.onSurface,
            colorScheme.surfaceContainerHighest,
          ),
        ),
      );
      expect(
        (m.hourMinuteColor as WidgetStateColor?)!.resolve(<WidgetState>{
          WidgetState.focused,
        }),
        equals(
          Color.alphaBlend(
            colorScheme.onSurface.withAlpha(kAlphaFocused),
            colorScheme.surfaceContainerHighest,
          ),
        ),
      );
      expect(
        (m.hourMinuteColor as WidgetStateColor?)!.resolve(<WidgetState>{
          WidgetState.hovered,
        }),
        equals(
          Color.alphaBlend(
            colorScheme.onSurface.withAlpha(kAlphaHovered),
            colorScheme.surfaceContainerHighest,
          ),
        ),
      );
      expect(
        (m.hourMinuteColor as WidgetStateColor?)!.resolve(<WidgetState>{}),
        equals(
          Color.alphaBlend(
            colorScheme.surfaceContainerHighest,
            colorScheme.surfaceContainerHighest,
          ),
        ),
      );
    });
  });

}
