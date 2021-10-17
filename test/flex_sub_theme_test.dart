import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  //****************************************************************************
  // FlexSubTheme unit tests.
  //
  // Tests that the static sub theme methods create intended defined sub
  // ThemeData when matching ons, matching with FlexSubTheme defaults.
  //****************************************************************************
  group('FST1: WITH FlexSubTheme ', () {
    test(
        'FST1.01: GIVEN a default FlexSubTheme.bottomSheetTheme() '
        'EXPECT equal to BottomSheetThemeData() version with same values', () {
      expect(
        FlexSubTheme.bottomSheetTheme(),
        equals(
          const BottomSheetThemeData(
            clipBehavior: Clip.antiAlias,
            elevation: 4,
            modalElevation: 12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
          ),
        ),
      );
    });
    test(
        'FST1.02: GIVEN a default FlexSubTheme.cardTheme() '
        'EXPECT equal to CardTheme() version with same values', () {
      expect(
        FlexSubTheme.cardTheme(),
        equals(
          const CardTheme(
            clipBehavior: Clip.antiAlias,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
          ),
        ),
      );
    });
    test(
        'FST1.03: GIVEN a default FlexSubTheme.dialogTheme() '
        'EXPECT equal to DialogTheme() version with same values', () {
      expect(
        FlexSubTheme.dialogTheme(),
        equals(
          const DialogTheme(
            elevation: 12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
          ),
        ),
      );
    });
    test(
        'FST1.04: GIVEN a default FlexSubTheme.timePickerTheme() '
        'EXPECT equal to TimePickerThemeData() version with same values', () {
      expect(
        FlexSubTheme.timePickerTheme(),
        equals(
          TimePickerThemeData(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            hourMinuteShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            dayPeriodShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            inputDecorationTheme: const InputDecorationTheme().copyWith(
              contentPadding: EdgeInsets.zero,
              errorStyle: const TextStyle(fontSize: 0, height: 0),
            ),
          ),
        ),
      );
    });
    test(
        'FST1.05a: GIVEN a default FlexSubTheme.inputDecorationTheme() '
        'EXPECT equal to InputDecorationTheme() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubTheme.inputDecorationTheme(colorScheme: colorScheme),
        equals(
          InputDecorationTheme(
            filled: true,
            fillColor: colorScheme.primary.withOpacity(0.075),
            hoverColor: colorScheme.primary.withOpacity(0.1),
            focusColor: colorScheme.primary.withOpacity(0.15),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: colorScheme.primary,
                width: 1.5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: colorScheme.primary.withOpacity(0.65),
                width: 1,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: colorScheme.onSurface.withOpacity(0.12),
                width: 1,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: colorScheme.error,
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: colorScheme.error,
                width: 1,
              ),
            ),
          ),
        ),
      );
    });
    test(
        'FST1.05b: GIVEN a default '
        'FlexSubTheme.inputDecorationTheme(useOutlinedBorder: false) '
        'EXPECT equal to InputDecorationTheme() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubTheme.inputDecorationTheme(
          colorScheme: colorScheme,
          useOutlinedBorder: false,
        ),
        equals(
          InputDecorationTheme(
            filled: true,
            fillColor: colorScheme.primary.withOpacity(0.075),
            hoverColor: colorScheme.primary.withOpacity(0.1),
            focusColor: colorScheme.primary.withOpacity(0.15),
            focusedBorder: UnderlineInputBorder(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              borderSide: BorderSide(
                color: colorScheme.primary,
                width: 1.5,
              ),
            ),
            enabledBorder: UnderlineInputBorder(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              borderSide: BorderSide(
                color: colorScheme.primary.withOpacity(0.65),
                width: 1,
              ),
            ),
            disabledBorder: UnderlineInputBorder(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              borderSide: BorderSide(
                color: colorScheme.onSurface.withOpacity(0.12),
                width: 1,
              ),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              borderSide: BorderSide(
                color: colorScheme.error,
                width: 1.5,
              ),
            ),
            errorBorder: UnderlineInputBorder(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              borderSide: BorderSide(
                color: colorScheme.error,
                width: 1,
              ),
            ),
          ),
        ),
      );
    });
    // TODO(rydmike): Figure out why this test fails with object equals!
    // If we run this test with just equals on the two objects, it fails!
    // but with this toString comparison and ignoring hashcodes, it works!
    // Why?
    // Applies to: tests: FST1.06, FST1.07, FST1.08, all using ButtonStyle.
    // Same happens if we compare the ButtonStyle object directly too.
    test(
        'FST1.06: GIVEN a default FlexSubTheme.elevatedButtonTheme() '
        'EXPECT equal to ElevatedButtonThemeData() version with '
        'same values', () {
      expect(
        FlexSubTheme.elevatedButtonTheme().toString(),
        equalsIgnoringHashCodes(
          ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(
                  kMinInteractiveDimension, kMinInteractiveDimension),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ), //buttonShape,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              elevation: 0,
            ),
          ).toString(),
        ),
      );
    });
    test(
        'FST1.07: GIVEN a default FlexSubTheme.outlinedButtonTheme() EXPECT '
        'equal to OutlinedButtonThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubTheme.outlinedButtonTheme(colorScheme: colorScheme).toString(),
        equalsIgnoringHashCodes(
          OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(
                  kMinInteractiveDimension, kMinInteractiveDimension),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ), //buttonShape,
              padding: const EdgeInsets.symmetric(horizontal: 16),
            ).copyWith(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                    return colorScheme.primary.withOpacity(0.08);
                  }
                  if (states.contains(MaterialState.focused)) {
                    return colorScheme.primary.withOpacity(0.1);
                  }
                  if (states.contains(MaterialState.pressed)) {
                    return colorScheme.primary.withOpacity(0.2);
                  }
                  return Colors.transparent;
                },
              ),
              side: MaterialStateProperty.resolveWith<BorderSide?>(
                (final Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return BorderSide(
                      color: colorScheme.onSurface.withOpacity(0.12),
                      width: 1,
                    );
                  }
                  if (states.contains(MaterialState.error)) {
                    return BorderSide(
                      color: colorScheme.error,
                      width: 1.5,
                    );
                  }
                  return BorderSide(
                    color: colorScheme.primary,
                    width: 1.5,
                  );
                },
              ),
            ),
          ).toString(),
        ),
      );
    });
    test(
        'FST1.08: GIVEN a default FlexSubTheme.textButtonTheme() '
        'EXPECT equal to TextButtonThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubTheme.textButtonTheme(colorScheme: colorScheme).toString(),
        equalsIgnoringHashCodes(
          TextButtonThemeData(
            style: TextButton.styleFrom(
              minimumSize: const Size(
                  kMinInteractiveDimension, kMinInteractiveDimension),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ), // buttonShape,
              padding: const EdgeInsets.symmetric(horizontal: 16),
            ).copyWith(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                    return colorScheme.primary.withOpacity(0.08);
                  }
                  if (states.contains(MaterialState.focused)) {
                    return colorScheme.primary.withOpacity(0.1);
                  }
                  if (states.contains(MaterialState.pressed)) {
                    return colorScheme.primary.withOpacity(0.2);
                  }
                  return Colors.transparent;
                },
              ),
            ),
          ).toString(),
        ),
      );
    });
    test(
        'FST1.09: GIVEN a default FlexSubTheme.buttonTheme() '
        'EXPECT equal to ButtonThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubTheme.buttonTheme(colorScheme: colorScheme),
        equals(
          ButtonThemeData(
            colorScheme: colorScheme,
            minWidth: 48,
            height: 48,
            hoverColor:
                colorScheme.primary.blend(Colors.white, 30).withOpacity(0.2),
            focusColor:
                colorScheme.primary.blend(Colors.white, 20).withOpacity(0.25),
            splashColor:
                colorScheme.primary.blend(Colors.white, 30).withOpacity(0.35),
            highlightColor:
                colorScheme.primary.blend(Colors.white, 10).withOpacity(0.2),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            textTheme: ButtonTextTheme.primary,
            materialTapTargetSize: MaterialTapTargetSize.padded,
            padding: const EdgeInsets.symmetric(horizontal: 16),
          ),
        ),
      );
    });
    test(
        'FST1.10: GIVEN a default FlexSubTheme.toggleButtonsTheme() EXPECT '
        'equal to ToggleButtonsThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      final VisualDensity _visualDensity =
          VisualDensity.adaptivePlatformDensity;
      expect(
        FlexSubTheme.toggleButtonsTheme(colorScheme: colorScheme),
        equals(
          ToggleButtonsThemeData(
            borderWidth: 1.5,
            selectedColor: colorScheme.background,
            color: colorScheme.primary,
            fillColor: colorScheme.primary,
            borderColor: colorScheme.primary,
            selectedBorderColor: colorScheme.primary,
            hoverColor:
                colorScheme.primary.blend(Colors.white, 30).withOpacity(0.2),
            focusColor:
                colorScheme.primary.blend(Colors.white, 20).withOpacity(0.25),
            splashColor:
                colorScheme.primary.blend(Colors.white, 30).withOpacity(0.35),
            highlightColor:
                colorScheme.primary.blend(Colors.white, 10).withOpacity(0.2),
            disabledColor: colorScheme.onSurface.withOpacity(0.3),
            disabledBorderColor: colorScheme.onSurface.withOpacity(0.12),
            borderRadius: BorderRadius.circular(16),
            constraints: BoxConstraints.tight(
              Size(
                48 - 1.5 * 2 + _visualDensity.baseSizeAdjustment.dx,
                48 - 1.5 * 2 + _visualDensity.baseSizeAdjustment.dy,
              ),
            ),
          ),
        ),
      );
    });
  });
}
