import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: deprecated_member_use_from_same_package, for tests.

void main() {
  group('WITH: FlexSubThemes.datePickerTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes DatePicker tests
    // -------------------------------------------------------------------------
    test(
        'DatePicker FST9a.1: GIVEN a default FlexSubTheme.dialogTheme() '
        'EXPECT equal to DatePickerThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.datePickerTheme(
          colorScheme: colorScheme,
          inputDecorationTheme: null,
          useInputDecoratorTheme: true,
        ),
        equals(
          const DatePickerThemeData(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(28)),
            ),
          ),
        ),
      );
    });
    test(
        'DatePicker FST9a.2 background-based-a: GIVEN a '
        'FlexSubTheme.datePickerTheme with no '
        'colorScheme, but with backgroundSchemeColor and backgroundColor '
        'EXPECT equal to DatePickerThemeData with backgroundColor', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.datePickerTheme(
          colorScheme: colorScheme,
          backgroundColor: const Color(0xFF343476),
          backgroundSchemeColor: SchemeColor.tertiary,
          inputDecorationTheme: null,
          useInputDecoratorTheme: true,
        ),
        equals(
          DatePickerThemeData(
            backgroundColor: colorScheme.tertiary,
            elevation: 6,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(28)),
            ),
          ),
        ),
      );
    });
    test(
        'DatePicker FST9a.3 background-based-b: GIVEN a '
        'FlexSubTheme.datePickerTheme '
        'with no backgroundSchemeColor and backgroundColor '
        'EXPECT equal to DatePickerThemeData with backgroundColor', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.datePickerTheme(
          colorScheme: colorScheme,
          backgroundColor: const Color(0xFFDDDDDD),
          backgroundSchemeColor: null,
          inputDecorationTheme: null,
          useInputDecoratorTheme: true,
        ),
        equals(
          const DatePickerThemeData(
            backgroundColor: Color(0xFFDDDDDD),
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(28)),
            ),
          ),
        ),
      );
    });
    test(
      'DatePicker FST9a.4 scheme-based: GIVEN a FlexSubTheme.datePickerTheme '
      'with backgroundSchemeColor and no backgroundColor '
      'EXPECT equal to DatePickerThemeData with backgroundSchemeColor',
      () {
        const ColorScheme colorScheme = ColorScheme.light();
        expect(
          FlexSubThemes.datePickerTheme(
            colorScheme: colorScheme,
            backgroundColor: null,
            backgroundSchemeColor: SchemeColor.tertiary,
            inputDecorationTheme: null,
            useInputDecoratorTheme: true,
          ),
          equals(
            DatePickerThemeData(
              backgroundColor: colorScheme.tertiary,
              elevation: 6,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(28)),
              ),
            ),
          ),
        );
      },
    );
    test(
      'DatePicker FST9a.4 scheme-based: GIVEN a FlexSubTheme.datePickerTheme '
      'with backgroundSchemeColor and backgroundColor nad header '
      'background '
      'EXPECT equal to DatePickerThemeData with backgroundSchemeColor and '
      'header background and header foreground contrast ',
      () {
        const ColorScheme colorScheme = ColorScheme.light();
        expect(
          FlexSubThemes.datePickerTheme(
            colorScheme: colorScheme,
            backgroundColor: const Color(0xFFDDDDDD),
            backgroundSchemeColor: SchemeColor.tertiary,
            headerBackgroundSchemeColor: SchemeColor.primaryContainer,
            inputDecorationTheme: null,
            useInputDecoratorTheme: true,
          ),
          equals(
            DatePickerThemeData(
              backgroundColor: colorScheme.tertiary,
              headerBackgroundColor: colorScheme.primaryContainer,
              headerForegroundColor: colorScheme.onPrimaryContainer,
              elevation: 6,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(28)),
              ),
            ),
          ),
        );
      },
    );
    test(
        'DatePicker FST9a.5 custom: GIVEN a custom '
        'FlexSubTheme.datePickerTheme '
        'EXPECT equal to DatePickerThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.dark();
      expect(
        FlexSubThemes.datePickerTheme(
          colorScheme: colorScheme,
          elevation: 10,
          radius: 6,
          inputDecorationTheme: null,
          useInputDecoratorTheme: true,
        ),
        equals(
          const DatePickerThemeData(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
          ),
        ),
      );
    });
    test(
        'DatePicker FST9a.6 custom: GIVEN a custom '
        'FlexSubTheme.datePickerTheme with light ColorScheme '
        'EXPECT equal to DatePickerThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        brightness: Brightness.light,
        seedColor: const Color(0xFF16D797),
      );
      const BorderRadius defaultRadius = BorderRadius.all(Radius.circular(4.0));
      expect(
        FlexSubThemes.datePickerTheme(
          colorScheme: colorScheme,
          elevation: 4,
          radius: 6,
          inputDecorationTheme: null,
          useInputDecoratorTheme: false,
          dividerSchemeColor: SchemeColor.secondary,
          headerForegroundSchemeColor: SchemeColor.secondaryContainer,
          headerBackgroundSchemeColor: SchemeColor.onSecondaryContainer,
        ),
        equals(
          DatePickerThemeData(
            elevation: 4,
            dividerColor: colorScheme.secondary,
            headerForegroundColor: colorScheme.secondaryContainer,
            headerBackgroundColor: colorScheme.onSecondaryContainer,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            inputDecorationTheme: InputDecorationThemeData(
              filled: false,
              hoverColor: colorScheme.brightness == Brightness.dark
                  ? Colors.white.withValues(alpha: 0.04)
                  : Colors.black.withValues(alpha: 0.04),
              focusColor: colorScheme.brightness == Brightness.dark
                  ? Colors.white.withValues(alpha: 0.12)
                  : Colors.black.withValues(alpha: 0.12),
              border: OutlineInputBorder(
                borderRadius: defaultRadius,
                borderSide: BorderSide(color: colorScheme.primary, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: defaultRadius,
                borderSide: BorderSide(color: colorScheme.outline, width: 1),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: defaultRadius,
                borderSide: BorderSide(color: colorScheme.error, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: defaultRadius,
                borderSide: BorderSide(color: colorScheme.primary, width: 2),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: defaultRadius,
                borderSide: BorderSide(color: colorScheme.error, width: 2),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: defaultRadius,
                borderSide: BorderSide(
                  color: colorScheme.onSurface.withValues(alpha: 0.12),
                  width: 1,
                ),
              ),
              floatingLabelStyle: WidgetStateTextStyle.resolveWith((
                Set<WidgetState> states,
              ) {
                // These styles are copied from M3 default, we are not
                // going to test them again.
                // coverage:ignore-start
                if (states.contains(WidgetState.disabled)) {
                  return TextStyle(
                    color: colorScheme.onSurface.withValues(alpha: 0.38),
                  );
                }
                if (states.contains(WidgetState.error)) {
                  if (states.contains(WidgetState.hovered)) {
                    return TextStyle(color: colorScheme.onErrorContainer);
                  }
                  if (states.contains(WidgetState.focused)) {
                    return TextStyle(color: colorScheme.error);
                  }
                  return TextStyle(color: colorScheme.error);
                }
                if (states.contains(WidgetState.hovered)) {
                  return TextStyle(color: colorScheme.onSurfaceVariant);
                }
                if (states.contains(WidgetState.focused)) {
                  return TextStyle(color: colorScheme.primary);
                }
                return TextStyle(color: colorScheme.onSurfaceVariant);
                // coverage:ignore-end
              }),
            ),
          ),
        ),
      );
    });
    test(
        'DatePicker FST9a.6 custom: GIVEN a custom '
        'FlexSubTheme.datePickerTheme with dark ColorScheme '
        'EXPECT equal to DatePickerThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: const Color(0xFF16D797),
      );
      const BorderRadius defaultRadius = BorderRadius.all(Radius.circular(4.0));
      expect(
        FlexSubThemes.datePickerTheme(
          colorScheme: colorScheme,
          elevation: 4,
          radius: 6,
          inputDecorationTheme: null,
          useInputDecoratorTheme: false,
          dividerSchemeColor: SchemeColor.secondary,
          headerForegroundSchemeColor: SchemeColor.secondaryContainer,
          headerBackgroundSchemeColor: SchemeColor.onSecondaryContainer,
        ),
        equals(
          DatePickerThemeData(
            elevation: 4,
            dividerColor: colorScheme.secondary,
            headerForegroundColor: colorScheme.secondaryContainer,
            headerBackgroundColor: colorScheme.onSecondaryContainer,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            inputDecorationTheme: InputDecorationThemeData(
              filled: false,
              hoverColor: colorScheme.brightness == Brightness.dark
                  ? Colors.white.withValues(alpha: 0.04)
                  : Colors.black.withValues(alpha: 0.04),
              focusColor: colorScheme.brightness == Brightness.dark
                  ? Colors.white.withValues(alpha: 0.12)
                  : Colors.black.withValues(alpha: 0.12),
              border: OutlineInputBorder(
                borderRadius: defaultRadius,
                borderSide: BorderSide(color: colorScheme.primary, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: defaultRadius,
                borderSide: BorderSide(color: colorScheme.outline, width: 1),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: defaultRadius,
                borderSide: BorderSide(color: colorScheme.error, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: defaultRadius,
                borderSide: BorderSide(color: colorScheme.primary, width: 2),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: defaultRadius,
                borderSide: BorderSide(color: colorScheme.error, width: 2),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: defaultRadius,
                borderSide: BorderSide(
                  color: colorScheme.onSurface.withValues(alpha: 0.12),
                  width: 1,
                ),
              ),
              floatingLabelStyle: WidgetStateTextStyle.resolveWith((
                Set<WidgetState> states,
              ) {
                // These styles are copied from M3 default,
                // we are not going to test them again.
                // coverage:ignore-start
                if (states.contains(WidgetState.disabled)) {
                  return TextStyle(
                    color: colorScheme.onSurface.withValues(alpha: 0.38),
                  );
                }
                if (states.contains(WidgetState.error)) {
                  if (states.contains(WidgetState.hovered)) {
                    return TextStyle(color: colorScheme.onErrorContainer);
                  }
                  if (states.contains(WidgetState.focused)) {
                    return TextStyle(color: colorScheme.error);
                  }
                  return TextStyle(color: colorScheme.error);
                }
                if (states.contains(WidgetState.hovered)) {
                  return TextStyle(color: colorScheme.onSurfaceVariant);
                }
                if (states.contains(WidgetState.focused)) {
                  return TextStyle(color: colorScheme.primary);
                }
                return TextStyle(color: colorScheme.onSurfaceVariant);
                // coverage:ignore-end
              }),
            ),
          ),
        ),
      );
    });
  });

}
