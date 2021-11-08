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
        FlexSubThemes.bottomSheetTheme(),
        equals(
          const BottomSheetThemeData(
            clipBehavior: Clip.antiAlias,
            elevation: 4,
            modalElevation: 8,
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
        'FST1.01custom: GIVEN a custom FlexSubTheme.bottomSheetTheme() '
        'EXPECT equal to BottomSheetThemeData() version with same values', () {
      expect(
        FlexSubThemes.bottomSheetTheme(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 2,
          modalElevation: 4,
          radius: 5,
        ),
        equals(
          const BottomSheetThemeData(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 2,
            modalElevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
          ),
        ),
      );
    });

    test(
        'FST1.02: GIVEN a default FlexSubTheme.bottomNavigationBar() '
        'EXPECT equal to BottomNavigationBarThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.bottomNavigationBar(
          colorScheme: colorScheme,
        ),
        equals(
          BottomNavigationBarThemeData(
            elevation: 0,
            backgroundColor: colorScheme.background.withOpacity(1),
            landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
            selectedItemColor: colorScheme.primary,
            selectedIconTheme: IconThemeData(
              color: colorScheme.primary,
            ),
            unselectedItemColor: colorScheme.onBackground
                .blendAlpha(colorScheme.primary, 0x00)
                .withAlpha(0xFF),
            unselectedIconTheme: IconThemeData(
              color: colorScheme.onBackground
                  .blendAlpha(colorScheme.primary, 0x00)
                  .withAlpha(0xFF),
            ),
          ),
        ),
      );
    });
    test(
        'FST1.02custom: GIVEN a custom FlexSubTheme.bottomNavigationBar() '
        'EXPECT equal to BottomNavigationBarThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.dark();
      expect(
        FlexSubThemes.bottomNavigationBar(
          colorScheme: colorScheme,
          elevation: 1,
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          opacity: 0.5,
          unselectedAlphaBlend: 0xFA,
          unselectedAlpha: 0x45,
        ),
        equals(
          BottomNavigationBarThemeData(
            elevation: 1,
            backgroundColor: colorScheme.background.withOpacity(0.5),
            landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
            selectedItemColor: colorScheme.primary,
            selectedIconTheme: IconThemeData(
              color: colorScheme.primary,
            ),
            unselectedItemColor: colorScheme.onBackground
                .blendAlpha(colorScheme.primary, 0xFA)
                .withAlpha(0x45),
            unselectedIconTheme: IconThemeData(
              color: colorScheme.onBackground
                  .blendAlpha(colorScheme.primary, 0xFA)
                  .withAlpha(0x45),
            ),
          ),
        ),
      );
    });

    test(
        'FST1.03: GIVEN a default FlexSubTheme.snackBarTheme() '
        'EXPECT equal to SnackBarThemeData() version '
        'with same values', () {
      expect(
        FlexSubThemes.snackBarTheme(),
        equals(
          const SnackBarThemeData(
            elevation: 4,
          ),
        ),
      );
    });
    test(
        'FST1.03custom: GIVEN a custom FlexSubTheme.snackBarTheme() '
        'EXPECT equal to SnackBarThemeData() version '
        'with same values', () {
      expect(
        FlexSubThemes.snackBarTheme(
          elevation: 10,
        ),
        equals(
          const SnackBarThemeData(
            elevation: 10,
          ),
        ),
      );
    });

    test(
        'FST1.04: GIVEN a default FlexSubTheme.cardTheme() '
        'EXPECT equal to CardTheme() version with same values', () {
      expect(
        FlexSubThemes.cardTheme(),
        equals(
          const CardTheme(
            clipBehavior: Clip.antiAlias,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
          ),
        ),
      );
    });
    test(
        'FST1.04custom: GIVEN a custom FlexSubTheme.cardTheme() '
        'EXPECT equal to CardTheme() version with same values', () {
      expect(
        FlexSubThemes.cardTheme(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 2,
          radius: 1,
        ),
        equals(
          const CardTheme(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(1),
              ),
            ),
          ),
        ),
      );
    });
    test(
        'FST1.05: GIVEN a default FlexSubTheme.dialogTheme() '
        'EXPECT equal to DialogTheme() version with same values', () {
      expect(
        FlexSubThemes.dialogTheme(),
        equals(
          const DialogTheme(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(28),
              ),
            ),
          ),
        ),
      );
    });
    test(
        'FST1.05custom: GIVEN a custom FlexSubTheme.dialogTheme() '
        'EXPECT equal to DialogTheme() version with same values', () {
      expect(
        FlexSubThemes.dialogTheme(
          elevation: 10,
          radius: 6,
        ),
        equals(
          const DialogTheme(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
            ),
          ),
        ),
      );
    });
    test(
        'FST1.06: GIVEN a default FlexSubTheme.popupMenuTheme() '
        'EXPECT equal to PopupMenuThemeData() version with same values', () {
      expect(
        FlexSubThemes.popupMenuTheme(),
        equals(
          const PopupMenuThemeData(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
      );
    });
    test(
        'FST1.06custom: GIVEN a custom FlexSubTheme.popupMenuTheme() '
        'EXPECT equal to PopupMenuThemeData() version with same values', () {
      expect(
        FlexSubThemes.popupMenuTheme(
          elevation: 8,
          radius: 8,
        ),
        equals(
          const PopupMenuThemeData(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
        ),
      );
    });
    test(
        'FST1.07: GIVEN a default FlexSubTheme.timePickerTheme() '
        'EXPECT equal to TimePickerThemeData() version with same values', () {
      expect(
        FlexSubThemes.timePickerTheme(),
        equals(
          TimePickerThemeData(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(28),
              ),
            ),
            hourMinuteShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            dayPeriodShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
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
        'FST1.08a: GIVEN a default FlexSubTheme.inputDecorationTheme() '
        'EXPECT equal to InputDecorationTheme() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.inputDecorationTheme(colorScheme: colorScheme),
        equals(
          InputDecorationTheme(
            filled: true,
            fillColor: colorScheme.primary.withAlpha(0x0F),
            hoverColor: colorScheme.primary.withAlpha(0x0D),
            focusColor: colorScheme.primary.withAlpha(0x26),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(
                color: colorScheme.primary,
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(
                color: colorScheme.primary.withAlpha(0xA7),
                width: 1.5,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(
                color: colorScheme.primary
                    .blendAlpha(colorScheme.onSurface, 0x66)
                    .withAlpha(0x31),
                width: 1.5,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(
                color: colorScheme.error,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(
                color: colorScheme.error.withAlpha(0xA7),
                width: 1.5,
              ),
            ),
          ),
        ),
      );
    });
    test(
        'FST1.08b: GIVEN a default '
        'FlexSubTheme.inputDecorationTheme(useOutlinedBorder: false) '
        'EXPECT equal to InputDecorationTheme() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.inputDecorationTheme(
          colorScheme: colorScheme,
          borderType: FlexInputBorderType.underline,
        ),
        equals(
          InputDecorationTheme(
            filled: true,
            fillColor: colorScheme.primary.withAlpha(0x0F),
            hoverColor: colorScheme.primary.withAlpha(0x0D),
            focusColor: colorScheme.primary.withAlpha(0x26),
            focusedBorder: UnderlineInputBorder(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              borderSide: BorderSide(
                color: colorScheme.primary,
                width: 2,
              ),
            ),
            enabledBorder: UnderlineInputBorder(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              borderSide: BorderSide(
                color: colorScheme.primary.withAlpha(0xA7),
                width: 1.5,
              ),
            ),
            disabledBorder: UnderlineInputBorder(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              borderSide: BorderSide(
                color: colorScheme.primary
                    .blendAlpha(colorScheme.onSurface, 0x66)
                    .withAlpha(0x31),
                width: 1.5,
              ),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              borderSide: BorderSide(
                color: colorScheme.error,
                width: 2,
              ),
            ),
            errorBorder: UnderlineInputBorder(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              borderSide: BorderSide(
                color: colorScheme.error.withAlpha(0xA7),
                width: 1.5,
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
        'FST1.09: GIVEN a default FlexSubTheme.elevatedButtonTheme() '
        'EXPECT equal to ElevatedButtonThemeData() version with '
        'same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.elevatedButtonTheme(colorScheme: colorScheme).toString(),
        equalsIgnoringHashCodes(
          ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(40, 40),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ), //buttonShape,
              elevation: 1,
            ).copyWith(
              foregroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return colorScheme.primary
                        .blendAlpha(colorScheme.onSurface, 0x66)
                        .withAlpha(0x5E);
                  }
                  return colorScheme.onPrimary;
                },
              ),
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return colorScheme.primary
                        .blendAlpha(colorScheme.onSurface, 0x66)
                        .withAlpha(0x31);
                  }
                  return colorScheme.primary;
                },
              ),
              overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                    return colorScheme.onPrimary.withAlpha(0x0D);
                  }
                  if (states.contains(MaterialState.focused)) {
                    return colorScheme.onPrimary.withAlpha(0x26);
                  }
                  if (states.contains(MaterialState.pressed)) {
                    return colorScheme.onPrimary.withAlpha(0x33);
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
        'FST1.09custom: GIVEN a custom FlexSubTheme.elevatedButtonTheme() '
        'EXPECT equal to ElevatedButtonThemeData() version with '
        'same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.elevatedButtonTheme(
                colorScheme: colorScheme,
                elevation: 1,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                minButtonSize: const Size(50, 50),
                radius: 10)
            .toString(),
        equalsIgnoringHashCodes(
          ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(50, 50),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ), //buttonShape,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              elevation: 1,
            ).copyWith(
              foregroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return colorScheme.primary
                        .blendAlpha(colorScheme.onSurface, 0x66)
                        .withAlpha(0x5E);
                  }
                  return colorScheme.onPrimary;
                },
              ),
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return colorScheme.primary
                        .blendAlpha(colorScheme.onSurface, 0x66)
                        .withAlpha(0x31);
                  }
                  return colorScheme.primary;
                },
              ),
              overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                    return colorScheme.onPrimary.withAlpha(0x0D);
                  }
                  if (states.contains(MaterialState.focused)) {
                    return colorScheme.onPrimary.withAlpha(0x26);
                  }
                  if (states.contains(MaterialState.pressed)) {
                    return colorScheme.onPrimary.withAlpha(0x33);
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
        'FST1.10: GIVEN a default FlexSubTheme.outlinedButtonTheme() EXPECT '
        'equal to OutlinedButtonThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.outlinedButtonTheme(colorScheme: colorScheme).toString(),
        equalsIgnoringHashCodes(
          OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(40, 40),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ), //buttonShape,
            ).copyWith(
              foregroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return colorScheme.primary
                        .blendAlpha(colorScheme.onSurface, 0x66)
                        .withAlpha(0x5E);
                  }
                  return colorScheme.primary;
                },
              ),
              overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                    return colorScheme.primary.withAlpha(0x0D);
                  }
                  if (states.contains(MaterialState.focused)) {
                    return colorScheme.primary.withAlpha(0x26);
                  }
                  if (states.contains(MaterialState.pressed)) {
                    return colorScheme.primary.withAlpha(0x33);
                  }
                  return Colors.transparent;
                },
              ),
              side: MaterialStateProperty.resolveWith<BorderSide?>(
                (final Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return BorderSide(
                      color: colorScheme.primary
                          .blendAlpha(colorScheme.onSurface, 0x66)
                          .withAlpha(0x31),
                      width: 1.5,
                    );
                  }
                  if (states.contains(MaterialState.error)) {
                    return BorderSide(
                      color: colorScheme.error,
                      width: 2,
                    );
                  }
                  if (states.contains(MaterialState.pressed)) {
                    return BorderSide(
                      color: colorScheme.primary,
                      width: 2,
                    );
                  }
                  return BorderSide(
                    color: colorScheme.primary.withAlpha(0xA7),
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
        'FST1.11: GIVEN a default FlexSubTheme.textButtonTheme() '
        'EXPECT equal to TextButtonThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.textButtonTheme(colorScheme: colorScheme).toString(),
        equalsIgnoringHashCodes(
          TextButtonThemeData(
            style: TextButton.styleFrom(
              minimumSize: const Size(40, 40),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ), // buttonShape,
            ).copyWith(
              foregroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return colorScheme.primary
                        .blendAlpha(colorScheme.onSurface, 0x66)
                        .withAlpha(0x5E);
                  }
                  return colorScheme.primary;
                },
              ),
              overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                    return colorScheme.primary.withAlpha(0x0D);
                  }
                  if (states.contains(MaterialState.focused)) {
                    return colorScheme.primary.withAlpha(0x26);
                  }
                  if (states.contains(MaterialState.pressed)) {
                    return colorScheme.primary.withAlpha(0x33);
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
        'FST1.12: GIVEN a default FlexSubTheme.buttonTheme() '
        'EXPECT equal to ButtonThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.buttonTheme(colorScheme: colorScheme),
        equals(
          ButtonThemeData(
            colorScheme: colorScheme,
            minWidth: 40,
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            layoutBehavior: ButtonBarLayoutBehavior.constrained,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            hoverColor: colorScheme.primary
                .blendAlpha(Colors.white, 0x40)
                .withAlpha(0x19),
            focusColor: colorScheme.primary
                .blendAlpha(Colors.white, 0x4C)
                .withAlpha(0x4C),
            highlightColor: colorScheme.primary
                .blendAlpha(Colors.white, 0x40)
                .withAlpha(0x19),
            splashColor: colorScheme.primary
                .blendAlpha(Colors.white, 0x1F)
                .withAlpha(0x33),
            disabledColor: colorScheme.primary
                .blendAlpha(colorScheme.onSurface, 0x66)
                .withAlpha(0x31),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            textTheme: ButtonTextTheme.primary,
          ),
        ),
      );
    });
    test(
        'FST1.12: GIVEN a default FlexSubTheme.toggleButtonsTheme() EXPECT '
        'equal to ToggleButtonsThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      final VisualDensity _visualDensity =
          VisualDensity.adaptivePlatformDensity;
      expect(
        FlexSubThemes.toggleButtonsTheme(colorScheme: colorScheme),
        equals(
          ToggleButtonsThemeData(
            borderWidth: 1.5,
            selectedColor: colorScheme.onPrimary.withAlpha(0xE5),
            color: colorScheme.primary,
            fillColor: colorScheme.primary.blendAlpha(Colors.white, 0x19),
            borderColor: colorScheme.primary.withAlpha(0xA7),
            selectedBorderColor:
                colorScheme.primary.blendAlpha(Colors.white, 0x19),
            hoverColor: colorScheme.primary
                .blendAlpha(Colors.white, 0x40 + 0x19)
                .withAlpha(0x19),
            focusColor: colorScheme.primary
                .blendAlpha(Colors.white, 0x4C + 0x19)
                .withAlpha(0x4C),
            highlightColor: colorScheme.primary
                .blendAlpha(Colors.white, 0x40 + 0x19)
                .withAlpha(0x19),
            splashColor: colorScheme.primary
                .blendAlpha(Colors.white, 0x1F + 0x19)
                .withAlpha(0x33),
            disabledColor: colorScheme.primary
                .blendAlpha(colorScheme.onSurface, 0x66)
                .withAlpha(0x5E),
            disabledBorderColor: colorScheme.primary
                .blendAlpha(colorScheme.onSurface, 0x66)
                .withAlpha(0x31),
            borderRadius: BorderRadius.circular(20),
            constraints: BoxConstraints(
              minWidth: 40 - 1.5 * 2 + _visualDensity.baseSizeAdjustment.dx,
              minHeight: 40 - 1.5 * 2 + _visualDensity.baseSizeAdjustment.dy,
            ),
          ),
        ),
      );
    });

    test(
        'FST1.14: GIVEN a default FlexSubTheme.floatingActionButtonTheme() '
        'EXPECT equal to FloatingActionButtonThemeData() version '
        'with same values', () {
      expect(
        FlexSubThemes.floatingActionButtonTheme(),
        equals(
          const FloatingActionButtonThemeData(
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
        'FST1.14b: GIVEN a custom FlexSubTheme.floatingActionButtonTheme() '
        'EXPECT equal to FloatingActionButtonThemeData() version '
        'with same values', () {
      expect(
        FlexSubThemes.floatingActionButtonTheme(
          radius: 30,
        ),
        equals(
          const FloatingActionButtonThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
          ),
        ),
      );
    });

    test(
        'FST1.15: GIVEN a default FlexSubTheme.chipTheme() '
        'EXPECT equal to ChipThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      final TextTheme textTheme =
          Typography.material2018(platform: TargetPlatform.android).black;
      expect(
        FlexSubThemes.chipTheme(
          colorScheme: colorScheme,
          labelStyle: textTheme.button!,
        ),
        equals(
          ChipThemeData(
            brightness: Brightness.dark,
            padding: const EdgeInsets.all(4),
            labelStyle:
                textTheme.button!.copyWith(color: const Color(0xff310077)),
            secondaryLabelStyle:
                textTheme.button!.copyWith(color: const Color(0xff310077)),
            backgroundColor: const Color(0xffdfccfb),
            deleteIconColor: const Color(0xff6200ee),
            disabledColor: const Color(0x313a008e),
            selectedColor: const Color(0xffbe96f8),
            secondarySelectedColor: const Color(0xffbe96f8),
            checkmarkColor: const Color(0xff310077),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
        ),
      );
    });
  });
}
