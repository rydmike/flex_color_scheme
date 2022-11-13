import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flex_color_scheme/src/flex_constants.dart';
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
    // -------------------------------------------------------------------------
    // FlexSubThemes BottomSheet tests
    // -------------------------------------------------------------------------
    test(
        'FST1.01: GIVEN a default FlexSubTheme.bottomSheetTheme() '
        'EXPECT equal to BottomSheetThemeData() version with same values', () {
      expect(
        FlexSubThemes.bottomSheetTheme(),
        equals(
          const BottomSheetThemeData(
            clipBehavior: Clip.antiAlias,
            elevation: 1,
            modalElevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(28),
                topRight: Radius.circular(28),
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
    // -------------------------------------------------------------------------
    // FlexSubThemes BottomNavigationBar tests
    // -------------------------------------------------------------------------
    test(
        'FST1.02-flutter-default-light: GIVEN a LIGHT default '
        'FlexSubTheme.bottomNavigationBar() with FlutterDefault '
        'EXPECT equal to BottomNavigationBarThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.bottomNavigationBar(
          colorScheme: colorScheme,
          useFlutterDefaults: true,
        ),
        equals(
          const BottomNavigationBarThemeData(
            elevation: 0,
          ),
        ),
      );
    });
    test(
        'FST1.02-flutter-default-dark: GIVEN a DARK default '
        'FlexSubTheme.bottomNavigationBar() with FlutterDefault '
        'EXPECT equal to BottomNavigationBarThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.dark();
      expect(
        FlexSubThemes.bottomNavigationBar(
          colorScheme: colorScheme,
          useFlutterDefaults: true,
        ),
        equals(
          const BottomNavigationBarThemeData(
            elevation: 0,
          ),
        ),
      );
    });
    test(
        'FST1.02-fcs-default-light: GIVEN a default LIGHT '
        'FlexSubTheme.bottomNavigationBar() with FCS default '
        'EXPECT equal to BottomNavigationBarThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.bottomNavigationBar(
          colorScheme: colorScheme,
          // useFlutterDefaults: false, <<- Expect this to be default too
        ),
        equals(
          const BottomNavigationBarThemeData(
            elevation: 0,
            backgroundColor: Colors.white,
            selectedIconTheme: IconThemeData(
                color: Color(0xff6200ee), opacity: 1.0, size: 24.0),
            unselectedIconTheme: IconThemeData(
                color: Color(0xa5000000), opacity: 1.0, size: 24.0),
            selectedItemColor: Color(0xff6200ee),
            unselectedItemColor: Color(0xa5000000),
            selectedLabelStyle: TextStyle(
                inherit: true, color: Color(0xff6200ee), fontSize: 14.0),
            unselectedLabelStyle: TextStyle(
                inherit: true, color: Color(0xa5000000), fontSize: 12.0),
          ),
        ),
      );
    });
    test(
        'FST1.02-fcs-default-dark: GIVEN a default DARK '
        'FlexSubTheme.bottomNavigationBar() with FCS default '
        'EXPECT equal to BottomNavigationBarThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.dark();
      expect(
        FlexSubThemes.bottomNavigationBar(
          colorScheme: colorScheme,
          elevation: 3,
          // useFlutterDefaults: false, <<- Expect this to be default too
        ),
        equals(
          const BottomNavigationBarThemeData(
            elevation: 3,
            backgroundColor: Color(0xff121212),
            selectedIconTheme: IconThemeData(
                color: Color(0xffbb86fc), opacity: 1.0, size: 24.0),
            unselectedIconTheme: IconThemeData(
                color: Color(0xa5ffffff), opacity: 1.0, size: 24.0),
            selectedItemColor: Color(0xffbb86fc),
            unselectedItemColor: Color(0xa5ffffff),
            selectedLabelStyle: TextStyle(
                inherit: true, color: Color(0xffbb86fc), fontSize: 14.0),
            unselectedLabelStyle: TextStyle(
                inherit: true, color: Color(0xa5ffffff), fontSize: 12.0),
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
          selectedLabelSchemeColor: SchemeColor.secondary,
          selectedIconSchemeColor: SchemeColor.secondaryContainer,
          unselectedLabelSchemeColor: SchemeColor.onSurface,
          unselectedIconSchemeColor: SchemeColor.tertiary,
          backgroundSchemeColor: SchemeColor.surface,
          mutedUnselectedIcon: true,
          mutedUnselectedLabel: true,
          elevation: 1,
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          opacity: 0.5,
          unselectedAlphaBlend: 0xFA,
          unselectedAlpha: 0x45,
          selectedIconSize: 31,
          unselectedIconSize: 27,
        ),
        equals(
          BottomNavigationBarThemeData(
            elevation: 1,
            backgroundColor: colorScheme.surface.withOpacity(0.5),
            landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
            selectedItemColor: colorScheme.secondary,
            selectedIconTheme: IconThemeData(
              color: colorScheme.secondaryContainer,
              size: 31,
              opacity: 1,
            ),
            selectedLabelStyle: TextStyle(
              color: colorScheme.secondary,
              fontSize: 14,
            ),
            unselectedLabelStyle: TextStyle(
              color: colorScheme.onSurface
                  .blendAlpha(colorScheme.onSurface, 0xFA)
                  .withAlpha(0x45),
              fontSize: 12,
            ),
            unselectedItemColor: colorScheme.onSurface
                .blendAlpha(colorScheme.onSurface, 0xFA)
                .withAlpha(0x45),
            unselectedIconTheme: IconThemeData(
              color: colorScheme.tertiary
                  .blendAlpha(colorScheme.tertiary, 0xFA)
                  .withAlpha(0x45),
              size: 27,
              opacity: 1,
            ),
          ),
        ),
      );
    });
    // -------------------------------------------------------------------------
    // FlexSubThemes SnackBar tests
    // -------------------------------------------------------------------------
    test(
        'FST1.03: GIVEN a default FlexSubTheme.snackBarTheme '
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
        'FST1.03-background-based-a: GIVEN a FlexSubTheme.snackBarTheme with '
        'colorScheme, but with backgroundSchemeColor and backgroundColor '
        'EXPECT equal to SnackBarThemeData with backgroundColor', () {
      expect(
        FlexSubThemes.snackBarTheme(
          elevation: 10,
          colorScheme: null,
          backgroundColor: const Color(0xFF343476),
          backgroundSchemeColor: SchemeColor.tertiary,
        ),
        equals(
          SnackBarThemeData(
            backgroundColor: const Color(0xFF343476),
            elevation: 10,
            contentTextStyle: ThemeData().textTheme.titleMedium!.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
      );
    });
    test(
        'FST1.03-background-based-b: GIVEN a FlexSubTheme.snackBarTheme with '
        'no colorScheme, no backgroundSchemeColor, but with backgroundColor '
        'EXPECT equal to SnackBarThemeData with backgroundColor', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.snackBarTheme(
          elevation: 5,
          colorScheme: colorScheme,
          backgroundColor: const Color(0xFFBBC2D5),
          backgroundSchemeColor: null,
        ),
        equals(
          SnackBarThemeData(
            backgroundColor: const Color(0xFFBBC2D5),
            elevation: 5,
            contentTextStyle: ThemeData().textTheme.titleMedium!.copyWith(
                  color: Colors.black,
                ),
          ),
        ),
      );
    });
    test(
        'FST1.03-scheme-based: GIVEN a FlexSubTheme.snackBarTheme with '
        'colorScheme, backgroundSchemeColor and backgroundColor '
        'EXPECT equal to SnackBarThemeData with scheme color.', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.snackBarTheme(
          elevation: 0,
          colorScheme: colorScheme,
          backgroundColor: const Color(0xFF763370),
          backgroundSchemeColor: SchemeColor.error,
        ),
        equals(
          SnackBarThemeData(
            backgroundColor: colorScheme.error,
            elevation: 0,
            contentTextStyle: ThemeData().textTheme.titleMedium!.copyWith(
                  color: colorScheme.onError,
                ),
          ),
        ),
      );
    });
    // -------------------------------------------------------------------------
    // FlexSubThemes Card tests
    // -------------------------------------------------------------------------
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
    // -------------------------------------------------------------------------
    // FlexSubThemes Dialog tests
    // -------------------------------------------------------------------------
    test(
        'FST1.05: GIVEN a default FlexSubTheme.dialogTheme() '
        'EXPECT equal to DialogTheme() version with same values', () {
      expect(
        FlexSubThemes.dialogTheme(),
        equals(
          const DialogTheme(
            elevation: 6,
            actionsPadding:
                EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
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
        'FST1.05-background-based-a: GIVEN a FlexSubTheme.dialogTheme with no '
        'colorScheme, but with backgroundSchemeColor and backgroundColor '
        'EXPECT equal to DialogTheme with backgroundColor', () {
      expect(
        FlexSubThemes.dialogTheme(
            colorScheme: null,
            backgroundColor: const Color(0xFF343476),
            backgroundSchemeColor: SchemeColor.tertiary),
        equals(
          const DialogTheme(
            backgroundColor: Color(0xFF343476),
            elevation: 6,
            actionsPadding:
                EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
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
        'FST1.05-background-based-b: GIVEN a FlexSubTheme.dialogTheme '
        'with no backgroundSchemeColor and backgroundColor '
        'EXPECT equal to DialogTheme with backgroundColor', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.dialogTheme(
          colorScheme: colorScheme,
          backgroundColor: const Color(0xFFDDDDDD),
          backgroundSchemeColor: null,
        ),
        equals(
          const DialogTheme(
            backgroundColor: Color(0xFFDDDDDD),
            elevation: 6,
            actionsPadding:
                EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
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
        'FST1.05-scheme-based: GIVEN a FlexSubTheme.dialogTheme '
        'with backgroundSchemeColor and no backgroundColor '
        'EXPECT equal to DialogTheme with backgroundSchemeColor', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.dialogTheme(
          colorScheme: colorScheme,
          backgroundColor: null,
          backgroundSchemeColor: SchemeColor.tertiary,
        ),
        equals(
          DialogTheme(
            backgroundColor: colorScheme.tertiary,
            actionsPadding:
                const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
            elevation: 6,
            shape: const RoundedRectangleBorder(
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
          actionsPadding:
              const EdgeInsets.only(left: 12.0, right: 6.0, bottom: 20.0),
        ),
        equals(
          const DialogTheme(
            elevation: 10,
            actionsPadding:
                EdgeInsets.only(left: 12.0, right: 6.0, bottom: 20.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
            ),
          ),
        ),
      );
    });
    // -------------------------------------------------------------------------
    // FlexSubThemes PopupMenu tests
    // -------------------------------------------------------------------------
    test(
        'FST1.06: GIVEN a default FlexSubTheme.popupMenuTheme() '
        'EXPECT equal to PopupMenuThemeData() version with same values', () {
      expect(
        FlexSubThemes.popupMenuTheme(),
        equals(
          const PopupMenuThemeData(
            // elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(4),
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
    // -------------------------------------------------------------------------
    // FlexSubThemes TimePicker tests
    // -------------------------------------------------------------------------
    test(
        'FST1.07-default: GIVEN a default FlexSubTheme.timePickerTheme() '
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
        'FST1.07.scheme-based: GIVEN a default FlexSubTheme.timePickerTheme() '
        'EXPECT equal to TimePickerThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.timePickerTheme(
          colorScheme: colorScheme,
          backgroundColor: const Color(0xFFDDDDDD),
          backgroundSchemeColor: SchemeColor.tertiary,
          inputDecorationTheme: const InputDecorationTheme(),
        ),
        equals(
          TimePickerThemeData(
            backgroundColor: colorScheme.tertiary,
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
        'FST1.07.background-a: GIVEN a default FlexSubTheme.timePickerTheme() '
        'EXPECT equal to TimePickerThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.timePickerTheme(
          colorScheme: colorScheme,
          backgroundColor: const Color(0xFFDDDDDD),
          inputDecorationTheme: const InputDecorationTheme(filled: true),
        ),
        equals(
          TimePickerThemeData(
            backgroundColor: const Color(0xFFDDDDDD),
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
            inputDecorationTheme:
                const InputDecorationTheme(filled: true).copyWith(
              contentPadding: EdgeInsets.zero,
              errorStyle: const TextStyle(fontSize: 0, height: 0),
            ),
          ),
        ),
      );
    });

    test(
        'FST1.07.background-b: GIVEN a default FlexSubTheme.timePickerTheme() '
        'EXPECT equal to TimePickerThemeData() version with same values', () {
      expect(
        FlexSubThemes.timePickerTheme(
          backgroundColor: const Color(0xFFDDDDDD),
          backgroundSchemeColor: SchemeColor.tertiary,
          inputDecorationTheme: const InputDecorationTheme(filled: true),
        ),
        equals(
          TimePickerThemeData(
            backgroundColor: const Color(0xFFDDDDDD),
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
            inputDecorationTheme:
                const InputDecorationTheme(filled: true).copyWith(
              contentPadding: EdgeInsets.zero,
              errorStyle: const TextStyle(fontSize: 0, height: 0),
            ),
          ),
        ),
      );
    });

    // -------------------------------------------------------------------------
    // FlexSubThemes InputDecorator tests
    // -------------------------------------------------------------------------
    test(
        'FST1.08a.light: GIVEN a default FlexSubTheme.inputDecorationTheme() '
        'EXPECT equal to InputDecorationTheme() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.inputDecorationTheme(colorScheme: colorScheme),
        equals(
          InputDecorationTheme(
            floatingLabelStyle:
                MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.error) &&
                  states.contains(MaterialState.focused)) {
                return TextStyle(color: colorScheme.error);
              }
              if (states.contains(MaterialState.error)) {
                return TextStyle(
                  color: colorScheme.error.withAlpha(kEnabledBorderAlpha),
                );
              }
              if (states.contains(MaterialState.disabled)) {
                return TextStyle(
                  color: colorScheme.primary
                      .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                      .withAlpha(kDisabledBackgroundAlpha),
                );
              }
              return TextStyle(color: colorScheme.primary);
            }),
            filled: true,
            fillColor: colorScheme.primary.withAlpha(0x0D),
            hoverColor: colorScheme.primary.withAlpha(0x0D),
            focusColor: colorScheme.primary.withAlpha(0x26),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: colorScheme.primary,
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: colorScheme.primary.withAlpha(0xA7),
                width: 1,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: colorScheme.primary
                    .blendAlpha(colorScheme.onSurface, 0x66)
                    .withAlpha(0x31),
                width: 1,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: colorScheme.error,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: colorScheme.error.withAlpha(0xA7),
                width: 1,
              ),
            ),
          ),
        ),
      );
    });
    test(
        'FST1.08b.light: GIVEN a FlexSubTheme.inputDecorationTheme( '
        'unfocusedBorderIsColored: false) '
        'EXPECT equal to InputDecorationTheme() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.inputDecorationTheme(
            colorScheme: colorScheme, unfocusedBorderIsColored: false),
        equals(
          InputDecorationTheme(
            floatingLabelStyle:
                MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.error) &&
                  states.contains(MaterialState.focused)) {
                return TextStyle(color: colorScheme.error);
              }
              if (states.contains(MaterialState.error)) {
                return TextStyle(
                  color: colorScheme.error.withAlpha(kEnabledBorderAlpha),
                );
              }
              if (states.contains(MaterialState.disabled)) {
                return TextStyle(
                  color: colorScheme.primary
                      .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                      .withAlpha(kDisabledBackgroundAlpha),
                );
              }
              return TextStyle(color: colorScheme.primary);
            }),
            filled: true,
            fillColor: colorScheme.primary.withAlpha(0x0D),
            hoverColor: colorScheme.primary.withAlpha(0x0D),
            focusColor: colorScheme.primary.withAlpha(0x26),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: colorScheme.primary,
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: colorScheme.onSurface.withOpacity(0.38),
                width: 1,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: colorScheme.primary
                    .blendAlpha(colorScheme.onSurface, 0x66)
                    .withAlpha(0x31),
                width: 1,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: colorScheme.error,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: colorScheme.error.withAlpha(0xA7),
                width: 1,
              ),
            ),
          ),
        ),
      );
    });
    test(
        'FST1.08a.dark: GIVEN a default FlexSubTheme.inputDecorationTheme() '
        'EXPECT equal to InputDecorationTheme() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.dark();
      expect(
        FlexSubThemes.inputDecorationTheme(colorScheme: colorScheme),
        equals(
          InputDecorationTheme(
            floatingLabelStyle:
                MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.error) &&
                  states.contains(MaterialState.focused)) {
                return TextStyle(color: colorScheme.error);
              }
              if (states.contains(MaterialState.error)) {
                return TextStyle(
                  color: colorScheme.error.withAlpha(kEnabledBorderAlpha),
                );
              }
              if (states.contains(MaterialState.disabled)) {
                return TextStyle(
                  color: colorScheme.primary
                      .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                      .withAlpha(kDisabledBackgroundAlpha),
                );
              }
              return TextStyle(color: colorScheme.primary);
            }),
            filled: true,
            fillColor: colorScheme.primary.withAlpha(0x14),
            hoverColor: colorScheme.primary.withAlpha(0x0D),
            focusColor: colorScheme.primary.withAlpha(0x26),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: colorScheme.primary,
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: colorScheme.primary.withAlpha(0xA7),
                width: 1,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: colorScheme.primary
                    .blendAlpha(colorScheme.onSurface, 0x66)
                    .withAlpha(0x31),
                width: 1,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: colorScheme.error,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: colorScheme.error.withAlpha(0xA7),
                width: 1,
              ),
            ),
          ),
        ),
      );
    });
    test(
        'FST1.08b.dark: GIVEN a default FlexSubTheme.inputDecorationTheme( '
        'unfocusedBorderIsColored: false) '
        'EXPECT equal to InputDecorationTheme() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.dark();
      expect(
        FlexSubThemes.inputDecorationTheme(
            colorScheme: colorScheme, unfocusedBorderIsColored: false),
        equals(
          InputDecorationTheme(
            floatingLabelStyle:
                MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.error) &&
                  states.contains(MaterialState.focused)) {
                return TextStyle(color: colorScheme.error);
              }
              if (states.contains(MaterialState.error)) {
                return TextStyle(
                  color: colorScheme.error.withAlpha(kEnabledBorderAlpha),
                );
              }
              if (states.contains(MaterialState.disabled)) {
                return TextStyle(
                  color: colorScheme.primary
                      .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                      .withAlpha(kDisabledBackgroundAlpha),
                );
              }
              return TextStyle(color: colorScheme.primary);
            }),
            filled: true,
            fillColor: colorScheme.primary.withAlpha(0x14),
            hoverColor: colorScheme.primary.withAlpha(0x0D),
            focusColor: colorScheme.primary.withAlpha(0x26),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: colorScheme.primary,
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: colorScheme.onSurface.withOpacity(0.38),
                width: 1,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: colorScheme.primary
                    .blendAlpha(colorScheme.onSurface, 0x66)
                    .withAlpha(0x31),
                width: 1,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: colorScheme.error,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: colorScheme.error.withAlpha(0xA7),
                width: 1,
              ),
            ),
          ),
        ),
      );
    });
    test('FST1.08a-states: Does Decorator have right material states', () {
      const ColorScheme colorScheme = ColorScheme.light();
      // Floating label focused error style
      expect(
          (FlexSubThemes.inputDecorationTheme(
            colorScheme: colorScheme,
          ).floatingLabelStyle as MaterialStateTextStyle?)!
              .resolve(<MaterialState>{
            MaterialState.error,
            MaterialState.focused,
          }),
          equals(
            TextStyle(color: colorScheme.error),
          ));
      // Floating label unfocused error style
      expect(
          (FlexSubThemes.inputDecorationTheme(
            colorScheme: colorScheme,
          ).floatingLabelStyle as MaterialStateTextStyle?)!
              .resolve(<MaterialState>{
            MaterialState.error,
          }),
          equals(
            TextStyle(color: colorScheme.error.withAlpha(0xA7)),
          ));
      // Floating label disabled style
      expect(
          (FlexSubThemes.inputDecorationTheme(
            colorScheme: colorScheme,
          ).floatingLabelStyle as MaterialStateTextStyle?)!
              .resolve(<MaterialState>{
            MaterialState.disabled,
          }),
          equals(
            TextStyle(
                color: colorScheme.primary
                    .blendAlpha(colorScheme.onSurface, 0x66)
                    .withAlpha(0x31)),
          ));
      // Floating label default style
      expect(
          (FlexSubThemes.inputDecorationTheme(
            colorScheme: colorScheme,
          ).floatingLabelStyle as MaterialStateTextStyle?)!
              .resolve(<MaterialState>{}),
          equals(
            TextStyle(color: colorScheme.primary),
          ));
    });
    test(
        'FST1.08b-light: GIVEN a default '
        'FlexSubTheme.inputDecorationTheme(borderType: '
        'FlexInputBorderType.underline, usedSchemeColor: '
        'FlexUsedColor.secondary) '
        'EXPECT equal to InputDecorationTheme() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.inputDecorationTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          borderType: FlexInputBorderType.underline,
        ),
        equals(
          InputDecorationTheme(
            floatingLabelStyle:
                MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.error) &&
                  states.contains(MaterialState.focused)) {
                return TextStyle(color: colorScheme.error);
              }
              if (states.contains(MaterialState.error)) {
                return TextStyle(
                  color: colorScheme.error.withAlpha(kEnabledBorderAlpha),
                );
              }
              if (states.contains(MaterialState.disabled)) {
                return TextStyle(
                  color: colorScheme.primary
                      .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                      .withAlpha(kDisabledBackgroundAlpha),
                );
              }
              return TextStyle(color: colorScheme.primary);
            }),
            filled: true,
            fillColor: colorScheme.secondary.withAlpha(0x0D),
            hoverColor: colorScheme.secondary.withAlpha(0x0D),
            focusColor: colorScheme.secondary.withAlpha(0x26),
            focusedBorder: UnderlineInputBorder(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              borderSide: BorderSide(
                color: colorScheme.secondary,
                width: 2,
              ),
            ),
            enabledBorder: UnderlineInputBorder(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              borderSide: BorderSide(
                color: colorScheme.secondary.withAlpha(0xA7),
                width: 1,
              ),
            ),
            disabledBorder: UnderlineInputBorder(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              borderSide: BorderSide(
                color: colorScheme.secondary
                    .blendAlpha(colorScheme.onSurface, 0x66)
                    .withAlpha(0x31),
                width: 1,
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
                width: 1,
              ),
            ),
          ),
        ),
      );
    });
    test('FST1.08b-states: Does Decorator have right material states', () {
      const ColorScheme colorScheme = ColorScheme.light();
      // Floating label focused error style
      expect(
          (FlexSubThemes.inputDecorationTheme(
            colorScheme: colorScheme,
            borderType: FlexInputBorderType.underline,
          ).floatingLabelStyle as MaterialStateTextStyle?)!
              .resolve(<MaterialState>{
            MaterialState.error,
            MaterialState.focused,
          }),
          equals(
            TextStyle(color: colorScheme.error),
          ));
      // Floating label unfocused error style
      expect(
          (FlexSubThemes.inputDecorationTheme(
            colorScheme: colorScheme,
            borderType: FlexInputBorderType.underline,
          ).floatingLabelStyle as MaterialStateTextStyle?)!
              .resolve(<MaterialState>{
            MaterialState.error,
          }),
          equals(
            TextStyle(color: colorScheme.error.withAlpha(0xA7)),
          ));
      // Floating label disabled style
      expect(
          (FlexSubThemes.inputDecorationTheme(
            colorScheme: colorScheme,
            borderType: FlexInputBorderType.underline,
          ).floatingLabelStyle as MaterialStateTextStyle?)!
              .resolve(<MaterialState>{
            MaterialState.disabled,
          }),
          equals(
            TextStyle(
                color: colorScheme.primary
                    .blendAlpha(colorScheme.onSurface, 0x66)
                    .withAlpha(0x31)),
          ));
      // Floating label default style
      expect(
          (FlexSubThemes.inputDecorationTheme(
            colorScheme: colorScheme,
            borderType: FlexInputBorderType.underline,
          ).floatingLabelStyle as MaterialStateTextStyle?)!
              .resolve(<MaterialState>{}),
          equals(
            TextStyle(color: colorScheme.primary),
          ));
    });
    // -------------------------------------------------------------------------
    // FlexSubThemes ElevatedButton tests
    // -------------------------------------------------------------------------
    test(
        'FST1.09-M2: GIVEN a default M2 FlexSubTheme.elevatedButtonTheme() '
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
        'FST1.09-M3: GIVEN a default M3 FlexSubTheme.elevatedButtonTheme() '
        'EXPECT equal to ElevatedButtonThemeData() version with '
        'same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
        ).toString(),
        equalsIgnoringHashCodes(
          ElevatedButtonThemeData(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return colorScheme.onSurface.withOpacity(0.38);
                }
                return colorScheme.primary;
              }),
              backgroundColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return colorScheme.onSurface.withOpacity(0.12);
                }
                return colorScheme.onPrimary;
              }),
              overlayColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered)) {
                  return colorScheme.primary.withOpacity(0.08);
                }
                if (states.contains(MaterialState.focused)) {
                  return colorScheme.primary.withOpacity(0.12);
                }
                if (states.contains(MaterialState.pressed)) {
                  return colorScheme.primary.withOpacity(0.12);
                }
                return null;
              }),
            ),
          ).toString(),
        ),
      );
    });
    test(
        'FST1.09-secondary: GIVEN a default FlexSubTheme.elevatedButtonTheme() '
        'with secondary color as base color '
        'EXPECT equal to ElevatedButtonThemeData() version with '
        'same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
        ).toString(),
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
                    return colorScheme.secondary
                        .blendAlpha(colorScheme.onSurface, 0x66)
                        .withAlpha(0x5E);
                  }
                  return colorScheme.onSecondary;
                },
              ),
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return colorScheme.secondary
                        .blendAlpha(colorScheme.onSurface, 0x66)
                        .withAlpha(0x31);
                  }
                  return colorScheme.secondary;
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
        'FST1.09-secondary-onBase: GIVEN a default '
        'FlexSubTheme.elevatedButtonTheme() '
        'with secondary color as onBase color '
        'EXPECT equal to ElevatedButtonThemeData() version with '
        'same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          onBaseSchemeColor: SchemeColor.secondary,
        ).toString(),
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
                    return colorScheme.secondary
                        .blendAlpha(colorScheme.onSurface, 0x66)
                        .withAlpha(0x5E);
                  }
                  return colorScheme.onSecondary;
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
                    return colorScheme.onSecondary.withAlpha(0x0D);
                  }
                  if (states.contains(MaterialState.focused)) {
                    return colorScheme.onSecondary.withAlpha(0x26);
                  }
                  if (states.contains(MaterialState.pressed)) {
                    return colorScheme.onSecondary.withAlpha(0x33);
                  }
                  return Colors.transparent;
                },
              ),
            ),
          ).toString(),
        ),
      );
    });
    test('FST1.09-M2-states: Does ElevatedButton have right Material 2 states',
        () {
      const ColorScheme colorScheme = ColorScheme.light();
      // Disabled foreground, default, M2
      expect(
        FlexSubThemes.elevatedButtonTheme(colorScheme: colorScheme)
            .style!
            .foregroundColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(colorScheme.primary
            .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
            .withAlpha(kDisabledForegroundAlpha)),
      );
      // Disabled foreground, default, M2
      expect(
        FlexSubThemes.elevatedButtonTheme(
                colorScheme: colorScheme,
                baseSchemeColor: SchemeColor.secondary)
            .style!
            .foregroundColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(colorScheme.secondary
            .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
            .withAlpha(kDisabledForegroundAlpha)),
      );
      // Selected foreground, M2
      expect(
        FlexSubThemes.elevatedButtonTheme(colorScheme: colorScheme)
            .style!
            .foregroundColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.onPrimary),
      );
      // Selected foreground, custom color, M2
      expect(
        FlexSubThemes.elevatedButtonTheme(
                colorScheme: colorScheme,
                baseSchemeColor: SchemeColor.secondary)
            .style!
            .foregroundColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.onSecondary),
      );
      // Selected foreground, custom colors, M2
      expect(
        FlexSubThemes.elevatedButtonTheme(
                colorScheme: colorScheme,
                baseSchemeColor: SchemeColor.secondary,
                onBaseSchemeColor: SchemeColor.tertiary)
            .style!
            .foregroundColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.tertiary),
      );
      // Disabled background, M2
      expect(
        FlexSubThemes.elevatedButtonTheme(colorScheme: colorScheme)
            .style!
            .backgroundColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(colorScheme.primary
            .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
            .withAlpha(kDisabledBackgroundAlpha)),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(colorScheme: colorScheme)
            .style!
            .backgroundColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.primary),
      );
      // Overlay color states
      expect(
        FlexSubThemes.elevatedButtonTheme(colorScheme: colorScheme)
            .style!
            .overlayColor!
            .resolve(<MaterialState>{MaterialState.hovered}),
        equals(colorScheme.onPrimary.withAlpha(kHoverBackgroundAlpha)),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(colorScheme: colorScheme)
            .style!
            .overlayColor!
            .resolve(<MaterialState>{MaterialState.focused}),
        equals(colorScheme.onPrimary.withAlpha(kFocusBackgroundAlpha)),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(colorScheme: colorScheme)
            .style!
            .overlayColor!
            .resolve(<MaterialState>{MaterialState.pressed}),
        equals(colorScheme.onPrimary.withAlpha(kPressedBackgroundAlpha)),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(colorScheme: colorScheme)
            .style!
            .overlayColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(Colors.transparent),
      );
    });
    test('FST1.09-M3-states: Does ElevatedButton have right Material 3 states',
        () {
      const ColorScheme colorScheme = ColorScheme.light();
      // Disabled foreground, default, M3
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
        )
            .style!
            .foregroundColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(colorScheme.onSurface.withOpacity(0.38)),
      );
      // Disabled foreground, default, M3
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          useMaterial3: true,
        )
            .style!
            .foregroundColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(colorScheme.onSurface.withOpacity(0.38)),
      );
      // Selected foreground, M3
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
        )
            .style!
            .foregroundColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.primary),
      );
      // Selected foreground, custom color, M3
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          useMaterial3: true,
        )
            .style!
            .foregroundColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.secondary),
      );
      // Selected foreground, custom colors, M3
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          onBaseSchemeColor: SchemeColor.tertiary,
          useMaterial3: true,
        )
            .style!
            .foregroundColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.secondary),
      );
      // Disabled background, M3
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
        )
            .style!
            .backgroundColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(colorScheme.onSurface.withOpacity(0.12)),
      );
      // Selected background, M3
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
        )
            .style!
            .backgroundColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.surface),
      );
      // Overlay color states
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
        ).style!.overlayColor!.resolve(<MaterialState>{MaterialState.hovered}),
        equals(colorScheme.primary.withOpacity(0.08)),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
        ).style!.overlayColor!.resolve(<MaterialState>{MaterialState.focused}),
        equals(colorScheme.primary.withOpacity(0.12)),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
        ).style!.overlayColor!.resolve(<MaterialState>{MaterialState.pressed}),
        equals(colorScheme.primary.withOpacity(0.12)),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
        ).style!.overlayColor!.resolve(<MaterialState>{MaterialState.selected}),
        equals(null),
      );
      // Elevation states
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          elevation: 2,
          useMaterial3: true,
        ).style!.elevation!.resolve(<MaterialState>{MaterialState.disabled}),
        equals(0.0),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          elevation: 2,
          useMaterial3: true,
        ).style!.elevation!.resolve(<MaterialState>{MaterialState.hovered}),
        equals(4.0),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          elevation: 2,
          useMaterial3: true,
        ).style!.elevation!.resolve(<MaterialState>{MaterialState.focused}),
        equals(2.0),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          elevation: 2,
          useMaterial3: true,
        ).style!.elevation!.resolve(<MaterialState>{MaterialState.pressed}),
        equals(2.0),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          elevation: 2,
          useMaterial3: true,
        ).style!.elevation!.resolve(<MaterialState>{MaterialState.selected}),
        equals(2.0),
      );
      // Custom shape test
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          radius: 10,
          useMaterial3: true,
        ).style!.shape!.resolve(<MaterialState>{}),
        equals(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      );
    });
    test(
        'FST1.09custom-1: GIVEN a custom FlexSubTheme.elevatedButtonTheme() '
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
        'FST1.09custom-2: GIVEN a custom FlexSubTheme.elevatedButtonTheme() '
        'EXPECT equal to ElevatedButtonThemeData() version with '
        'same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.elevatedButtonTheme(
                colorScheme: colorScheme,
                baseSchemeColor: SchemeColor.tertiary,
                onBaseSchemeColor: SchemeColor.secondary,
                elevation: 1,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                minButtonSize: const Size(55, 55),
                radius: 12)
            .toString(),
        equalsIgnoringHashCodes(
          ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(55, 55),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ), //buttonShape,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              elevation: 1,
            ).copyWith(
              foregroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return colorScheme.tertiary
                        .blendAlpha(colorScheme.onSurface, 0x66)
                        .withAlpha(0x5E);
                  }
                  return colorScheme.secondary;
                },
              ),
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return colorScheme.tertiary
                        .blendAlpha(colorScheme.onSurface, 0x66)
                        .withAlpha(0x31);
                  }
                  return colorScheme.tertiary;
                },
              ),
              overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                    return colorScheme.onTertiary.withAlpha(0x0D);
                  }
                  if (states.contains(MaterialState.focused)) {
                    return colorScheme.onTertiary.withAlpha(0x26);
                  }
                  if (states.contains(MaterialState.pressed)) {
                    return colorScheme.onTertiary.withAlpha(0x33);
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
        'FST1.09custom-1-M3: GIVEN a custom FlexSubTheme.elevatedButtonTheme() '
        'EXPECT equal to ElevatedButtonThemeData() version with '
        'same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          elevation: 1,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          minButtonSize: const Size(50, 50),
          radius: 10,
          useMaterial3: true,
        ).toString(),
        equalsIgnoringHashCodes(
          ElevatedButtonThemeData(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return colorScheme.onSurface.withOpacity(0.38);
                }
                return colorScheme.primary;
              }),
              backgroundColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return colorScheme.onSurface.withOpacity(0.12);
                }
                return colorScheme.onPrimary;
              }),
              overlayColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered)) {
                  return colorScheme.primary.withOpacity(0.08);
                }
                if (states.contains(MaterialState.focused)) {
                  return colorScheme.primary.withOpacity(0.12);
                }
                if (states.contains(MaterialState.pressed)) {
                  return colorScheme.primary.withOpacity(0.12);
                }
                return null;
              }),
              minimumSize:
                  ButtonStyleButton.allOrNull<Size>(const Size(50, 50)),
              padding: ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(
                  const EdgeInsets.symmetric(horizontal: 8)),
              elevation: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return 0.0;
                }
                if (states.contains(MaterialState.hovered)) {
                  return 3.0;
                }
                if (states.contains(MaterialState.focused)) {
                  return 1.0;
                }
                if (states.contains(MaterialState.pressed)) {
                  return 1.0;
                }
                return 1.0;
              }),
              shape: ButtonStyleButton.allOrNull<OutlinedBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ), //buttonShape,
            ),
          ).toString(),
        ),
      );
    });
    test(
        'FST1.09custom-2-M3: GIVEN a custom FlexSubTheme.elevatedButtonTheme() '
        'EXPECT equal to ElevatedButtonThemeData() version with '
        'same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          onBaseSchemeColor: SchemeColor.secondary,
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 9),
          minButtonSize: const Size(55, 55),
          radius: 12,
          useMaterial3: true,
        ).toString(),
        equalsIgnoringHashCodes(
          ElevatedButtonThemeData(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return colorScheme.onSurface.withOpacity(0.38);
                }
                return colorScheme.tertiary;
              }),
              backgroundColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return colorScheme.onSurface.withOpacity(0.12);
                }
                return colorScheme.secondary;
              }),
              overlayColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered)) {
                  return colorScheme.tertiary.withOpacity(0.08);
                }
                if (states.contains(MaterialState.focused)) {
                  return colorScheme.tertiary.withOpacity(0.12);
                }
                if (states.contains(MaterialState.pressed)) {
                  return colorScheme.tertiary.withOpacity(0.12);
                }
                return null;
              }),
              minimumSize:
                  ButtonStyleButton.allOrNull<Size>(const Size(55, 55)),
              padding: ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(
                  const EdgeInsets.symmetric(horizontal: 9)),
              elevation: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return 0.0;
                }
                if (states.contains(MaterialState.hovered)) {
                  return 4.0;
                }
                if (states.contains(MaterialState.focused)) {
                  return 2.0;
                }
                if (states.contains(MaterialState.pressed)) {
                  return 2.0;
                }
                return 2.0;
              }),
              shape: ButtonStyleButton.allOrNull<OutlinedBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ), //buttonShape,
            ),
          ).toString(),
        ),
      );
    });
    // -------------------------------------------------------------------------
    // FlexSubThemes OutlinedButton tests
    // -------------------------------------------------------------------------
    test(
        'FST1.10-M2: GIVEN a default FlexSubTheme.outlinedButtonTheme() EXPECT '
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
        'FST1.10-custom-M2: GIVEN a custom FlexSubTheme.outlinedButtonTheme() '
        'EXPECT '
        'equal to OutlinedButtonThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF42AEE7),
        brightness: Brightness.light,
      );
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primaryContainer,
          outlineSchemeColor: SchemeColor.secondaryContainer,
          padding: const EdgeInsets.symmetric(horizontal: 17),
          minButtonSize: const Size(52, 40),
          radius: 13,
        ).toString(),
        equalsIgnoringHashCodes(
          OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(52, 40),
              padding: const EdgeInsets.symmetric(horizontal: 17),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(13),
                ),
              ), //buttonShape,
            ).copyWith(
              foregroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return colorScheme.primaryContainer
                        .blendAlpha(colorScheme.onSurface, 0x66)
                        .withAlpha(0x5E);
                  }
                  return colorScheme.primaryContainer;
                },
              ),
              overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                    return colorScheme.primaryContainer.withAlpha(0x0D);
                  }
                  if (states.contains(MaterialState.focused)) {
                    return colorScheme.primaryContainer.withAlpha(0x26);
                  }
                  if (states.contains(MaterialState.pressed)) {
                    return colorScheme.primaryContainer.withAlpha(0x33);
                  }
                  return Colors.transparent;
                },
              ),
              side: MaterialStateProperty.resolveWith<BorderSide?>(
                (final Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return BorderSide(
                      color: colorScheme.secondaryContainer
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
                      color: colorScheme.secondaryContainer,
                      width: 2,
                    );
                  }
                  return BorderSide(
                    color: colorScheme.secondaryContainer.withAlpha(0xA7),
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
        'FST1.10-M3: GIVEN a default FlexSubTheme.outlinedButtonTheme() EXPECT '
        'equal to OutlinedButtonThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF7142E7),
        brightness: Brightness.light,
      );
      final MaterialStateProperty<Color?> foregroundColor =
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return colorScheme.onSurface.withOpacity(0.38);
        }
        return colorScheme.primary;
      });

      final MaterialStateProperty<Color?> overlayColor =
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) {
          return colorScheme.primary.withOpacity(0.08);
        }
        if (states.contains(MaterialState.focused)) {
          return colorScheme.primary.withOpacity(0.12);
        }
        if (states.contains(MaterialState.pressed)) {
          return colorScheme.primary.withOpacity(0.12);
        }
        return null;
      });

      final MaterialStateProperty<BorderSide> side =
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return BorderSide(
            color: colorScheme.onSurface.withOpacity(0.12),
            width: 1,
          );
        }
        if (states.contains(MaterialState.error)) {
          return BorderSide(
            color: colorScheme.error,
            width: 1,
          );
        }
        if (states.contains(MaterialState.pressed)) {
          return BorderSide(
            color: colorScheme.outline,
            width: 1,
          );
        }
        return BorderSide(
          color: colorScheme.outline,
          width: 1,
        );
      });
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
        ).toString(),
        equalsIgnoringHashCodes(
          OutlinedButtonThemeData(
            style: ButtonStyle(
              foregroundColor: foregroundColor,
              backgroundColor:
                  ButtonStyleButton.allOrNull<Color>(Colors.transparent),
              overlayColor: overlayColor,
              elevation: ButtonStyleButton.allOrNull<double>(0.0),
              side: side,
            ),
          ).toString(),
        ),
      );
    });
    test(
        'FST1.10-outline-M2: GIVEN a custom FlexSubTheme.outlinedButtonTheme() '
        'EXPECT '
        'equal to OutlinedButtonThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          outlineSchemeColor: SchemeColor.tertiary,
        ).toString(),
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
                    return colorScheme.secondary
                        .blendAlpha(colorScheme.onSurface, 0x66)
                        .withAlpha(0x5E);
                  }
                  return colorScheme.secondary;
                },
              ),
              overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                    return colorScheme.secondary.withAlpha(0x0D);
                  }
                  if (states.contains(MaterialState.focused)) {
                    return colorScheme.secondary.withAlpha(0x26);
                  }
                  if (states.contains(MaterialState.pressed)) {
                    return colorScheme.secondary.withAlpha(0x33);
                  }
                  return Colors.transparent;
                },
              ),
              side: MaterialStateProperty.resolveWith<BorderSide?>(
                (final Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return BorderSide(
                      color: colorScheme.tertiary
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
                      color: colorScheme.tertiary,
                      width: 2,
                    );
                  }
                  return BorderSide(
                    color: colorScheme.tertiary.withAlpha(0xA7),
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
        'FST1.10-outline-M3: GIVEN a custom FlexSubTheme.outlinedButtonTheme() '
        'EXPECT '
        'equal to OutlinedButtonThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF7142E7),
        brightness: Brightness.light,
      );
      final MaterialStateProperty<Color?> foregroundColor =
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return colorScheme.onSurface.withOpacity(0.38);
        }
        return colorScheme.primary;
      });

      final MaterialStateProperty<Color?> overlayColor =
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) {
          return colorScheme.primary.withOpacity(0.08);
        }
        if (states.contains(MaterialState.focused)) {
          return colorScheme.primary.withOpacity(0.12);
        }
        if (states.contains(MaterialState.pressed)) {
          return colorScheme.primary.withOpacity(0.12);
        }
        return null;
      });

      final MaterialStateProperty<BorderSide> side =
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return BorderSide(
            color: colorScheme.onSurface.withOpacity(0.12),
            width: 1,
          );
        }
        if (states.contains(MaterialState.error)) {
          return BorderSide(
            color: colorScheme.error,
            width: 1,
          );
        }
        if (states.contains(MaterialState.pressed)) {
          return BorderSide(
            color: colorScheme.outline,
            width: 1,
          );
        }
        return BorderSide(
          color: colorScheme.outline,
          width: 1,
        );
      });
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          outlineSchemeColor: SchemeColor.tertiary,
          padding: const EdgeInsets.symmetric(horizontal: 17),
          minButtonSize: const Size(52, 40),
          radius: 13,
          useMaterial3: true,
        ).toString(),
        equalsIgnoringHashCodes(
          OutlinedButtonThemeData(
            style: ButtonStyle(
              foregroundColor: foregroundColor,
              backgroundColor:
                  ButtonStyleButton.allOrNull<Color>(Colors.transparent),
              overlayColor: overlayColor,
              minimumSize:
                  ButtonStyleButton.allOrNull<Size>(const Size(52, 40)),
              padding: ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(
                  const EdgeInsets.symmetric(horizontal: 17)),
              elevation: ButtonStyleButton.allOrNull<double>(0.0),
              side: side,
              shape: ButtonStyleButton.allOrNull<OutlinedBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(13),
                  ),
                ),
              ),
            ),
          ).toString(),
        ),
      );
    });

    test('FST1.10-states-M2: Does OutlinedButton have right material states',
        () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      // Disabled foreground
      expect(
        FlexSubThemes.outlinedButtonTheme(colorScheme: colorScheme)
            .style!
            .foregroundColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(colorScheme.primary
            .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
            .withAlpha(kDisabledForegroundAlpha)),
      );
      expect(
        FlexSubThemes.outlinedButtonTheme(colorScheme: colorScheme)
            .style!
            .foregroundColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.primary),
      );
      // Overlay color states
      expect(
        FlexSubThemes.outlinedButtonTheme(colorScheme: colorScheme)
            .style!
            .overlayColor!
            .resolve(<MaterialState>{MaterialState.hovered}),
        equals(colorScheme.primary.withAlpha(kHoverBackgroundAlpha)),
      );
      expect(
        FlexSubThemes.outlinedButtonTheme(colorScheme: colorScheme)
            .style!
            .overlayColor!
            .resolve(<MaterialState>{MaterialState.focused}),
        equals(colorScheme.primary.withAlpha(kFocusBackgroundAlpha)),
      );
      expect(
        FlexSubThemes.outlinedButtonTheme(colorScheme: colorScheme)
            .style!
            .overlayColor!
            .resolve(<MaterialState>{MaterialState.pressed}),
        equals(colorScheme.primary.withAlpha(kPressedBackgroundAlpha)),
      );
      expect(
        FlexSubThemes.outlinedButtonTheme(colorScheme: colorScheme)
            .style!
            .overlayColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(Colors.transparent),
      );
      // Border side states
      expect(
        FlexSubThemes.outlinedButtonTheme(colorScheme: colorScheme)
            .style!
            .side!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(BorderSide(
            color: colorScheme.primary
                .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                .withAlpha(kDisabledBackgroundAlpha),
            width: 1)),
      );
      expect(
        FlexSubThemes.outlinedButtonTheme(colorScheme: colorScheme)
            .style!
            .side!
            .resolve(<MaterialState>{MaterialState.error}),
        equals(BorderSide(
          color: colorScheme.error,
          width: 2,
        )),
      );
      expect(
        FlexSubThemes.outlinedButtonTheme(colorScheme: colorScheme)
            .style!
            .side!
            .resolve(<MaterialState>{MaterialState.pressed}),
        equals(BorderSide(
          color: colorScheme.primary,
          width: 2,
        )),
      );
      expect(
        FlexSubThemes.outlinedButtonTheme(colorScheme: colorScheme)
            .style!
            .side!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(BorderSide(
          color: colorScheme.primary.withAlpha(kEnabledBorderAlpha),
          width: 1,
        )),
      );
    });
    test('FST1.10-states-custom-M2: Does OutlinedButton have right states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF42AEE7),
        brightness: Brightness.light,
      );
      // Disabled foreground
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          outlineSchemeColor: SchemeColor.primaryContainer,
        )
            .style!
            .foregroundColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(colorScheme.tertiary
            .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
            .withAlpha(kDisabledForegroundAlpha)),
      );
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          outlineSchemeColor: SchemeColor.primaryContainer,
        )
            .style!
            .foregroundColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.tertiary),
      );
      // Overlay color states
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          outlineSchemeColor: SchemeColor.primaryContainer,
        ).style!.overlayColor!.resolve(<MaterialState>{MaterialState.hovered}),
        equals(colorScheme.tertiary.withAlpha(kHoverBackgroundAlpha)),
      );
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          outlineSchemeColor: SchemeColor.primaryContainer,
        ).style!.overlayColor!.resolve(<MaterialState>{MaterialState.focused}),
        equals(colorScheme.tertiary.withAlpha(kFocusBackgroundAlpha)),
      );
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          outlineSchemeColor: SchemeColor.primaryContainer,
        ).style!.overlayColor!.resolve(<MaterialState>{MaterialState.pressed}),
        equals(colorScheme.tertiary.withAlpha(kPressedBackgroundAlpha)),
      );
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          outlineSchemeColor: SchemeColor.primaryContainer,
        ).style!.overlayColor!.resolve(<MaterialState>{MaterialState.selected}),
        equals(Colors.transparent),
      );
      // Border side states
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          outlineSchemeColor: SchemeColor.primaryContainer,
        ).style!.side!.resolve(<MaterialState>{MaterialState.disabled}),
        equals(BorderSide(
            color: colorScheme.primaryContainer
                .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                .withAlpha(kDisabledBackgroundAlpha),
            width: 1)),
      );
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          outlineSchemeColor: SchemeColor.primaryContainer,
        ).style!.side!.resolve(<MaterialState>{MaterialState.error}),
        equals(BorderSide(
          color: colorScheme.error,
          width: 2,
        )),
      );
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          outlineSchemeColor: SchemeColor.primaryContainer,
        ).style!.side!.resolve(<MaterialState>{MaterialState.pressed}),
        equals(BorderSide(
          color: colorScheme.primaryContainer,
          width: 2,
        )),
      );
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          outlineSchemeColor: SchemeColor.primaryContainer,
        ).style!.side!.resolve(<MaterialState>{MaterialState.selected}),
        equals(BorderSide(
          color: colorScheme.primaryContainer.withAlpha(kEnabledBorderAlpha),
          width: 1,
        )),
      );
    });
    test('FST1.10-states-M3: Does OutlinedButton have right material states',
        () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      // Disabled foreground
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
        )
            .style!
            .foregroundColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(colorScheme.onSurface.withOpacity(0.38)),
      );
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
        )
            .style!
            .foregroundColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.primary),
      );
      // Overlay color states
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
        ).style!.overlayColor!.resolve(<MaterialState>{MaterialState.hovered}),
        equals(colorScheme.primary.withOpacity(0.08)),
      );
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
        ).style!.overlayColor!.resolve(<MaterialState>{MaterialState.focused}),
        equals(colorScheme.primary.withOpacity(0.12)),
      );
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
        ).style!.overlayColor!.resolve(<MaterialState>{MaterialState.pressed}),
        equals(colorScheme.primary.withOpacity(0.12)),
      );
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
        ).style!.overlayColor!.resolve(<MaterialState>{MaterialState.selected}),
        equals(null),
      );
      // Border side states
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
        ).style!.side!.resolve(<MaterialState>{MaterialState.disabled}),
        equals(BorderSide(
            color: colorScheme.onSurface.withOpacity(0.12), width: 1.0)),
      );
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
        ).style!.side!.resolve(<MaterialState>{MaterialState.error}),
        equals(BorderSide(
          color: colorScheme.error,
          width: 1.0,
        )),
      );
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
        ).style!.side!.resolve(<MaterialState>{MaterialState.pressed}),
        equals(BorderSide(
          color: colorScheme.outline,
          width: 1.0,
        )),
      );
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
        ).style!.side!.resolve(<MaterialState>{MaterialState.selected}),
        equals(BorderSide(
          color: colorScheme.outline,
          width: 1.0,
        )),
      );
    });
    test(
        'FST1.10-states-M3-custom: Does OutlinedButton have right material '
        'custom states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      // Disabled foreground
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          outlineSchemeColor: SchemeColor.primaryContainer,
          outlineWidth: 2,
          pressedOutlineWidth: 3,
          useMaterial3: true,
        )
            .style!
            .foregroundColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(colorScheme.onSurface.withOpacity(0.38)),
      );
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          outlineSchemeColor: SchemeColor.primaryContainer,
          outlineWidth: 2,
          pressedOutlineWidth: 3,
          useMaterial3: true,
        )
            .style!
            .foregroundColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.tertiary),
      );
      // Overlay color states
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          outlineSchemeColor: SchemeColor.primaryContainer,
          outlineWidth: 2,
          pressedOutlineWidth: 3,
          useMaterial3: true,
        ).style!.overlayColor!.resolve(<MaterialState>{MaterialState.hovered}),
        equals(colorScheme.tertiary.withOpacity(0.08)),
      );
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          outlineSchemeColor: SchemeColor.primaryContainer,
          outlineWidth: 2,
          pressedOutlineWidth: 3,
          useMaterial3: true,
        ).style!.overlayColor!.resolve(<MaterialState>{MaterialState.focused}),
        equals(colorScheme.tertiary.withOpacity(0.12)),
      );
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          outlineSchemeColor: SchemeColor.primaryContainer,
          outlineWidth: 2,
          pressedOutlineWidth: 3,
          useMaterial3: true,
        ).style!.overlayColor!.resolve(<MaterialState>{MaterialState.pressed}),
        equals(colorScheme.tertiary.withOpacity(0.12)),
      );
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          outlineSchemeColor: SchemeColor.primaryContainer,
          outlineWidth: 2,
          pressedOutlineWidth: 3,
          useMaterial3: true,
        ).style!.overlayColor!.resolve(<MaterialState>{MaterialState.selected}),
        equals(null),
      );
      // Border side states
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          outlineSchemeColor: SchemeColor.primaryContainer,
          outlineWidth: 2,
          pressedOutlineWidth: 3,
          useMaterial3: true,
        ).style!.side!.resolve(<MaterialState>{MaterialState.disabled}),
        equals(BorderSide(
          color: colorScheme.onSurface.withOpacity(0.12),
          width: 2.0,
        )),
      );
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          outlineSchemeColor: SchemeColor.primaryContainer,
          outlineWidth: 2,
          pressedOutlineWidth: 3,
          useMaterial3: true,
        ).style!.side!.resolve(<MaterialState>{MaterialState.error}),
        equals(BorderSide(
          color: colorScheme.error,
          width: 3.0,
        )),
      );
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          outlineSchemeColor: SchemeColor.primaryContainer,
          outlineWidth: 2,
          pressedOutlineWidth: 3,
          useMaterial3: true,
        ).style!.side!.resolve(<MaterialState>{MaterialState.pressed}),
        equals(BorderSide(
          color: colorScheme.primaryContainer,
          width: 3.0,
        )),
      );
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          outlineSchemeColor: SchemeColor.primaryContainer,
          outlineWidth: 2,
          pressedOutlineWidth: 3,
          useMaterial3: true,
        ).style!.side!.resolve(<MaterialState>{MaterialState.selected}),
        equals(BorderSide(
          color: colorScheme.primaryContainer,
          width: 2.0,
        )),
      );
      // Custom shape test
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          outlineSchemeColor: SchemeColor.primaryContainer,
          outlineWidth: 2,
          pressedOutlineWidth: 3,
          radius: 10,
          useMaterial3: true,
        ).style!.shape!.resolve(<MaterialState>{}),
        equals(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      );
    });

    // -------------------------------------------------------------------------
    // FlexSubThemes TextButton tests
    // -------------------------------------------------------------------------
    test(
        'FST1.11-M2: GIVEN a default FlexSubTheme.textButtonTheme() '
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
        'FST1.11-M2-base: GIVEN a custom FlexSubTheme.textButtonTheme() '
        'EXPECT equal to TextButtonThemeData() version with same color', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.textButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
        ).toString(),
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
                    return colorScheme.secondary
                        .blendAlpha(colorScheme.onSurface, 0x66)
                        .withAlpha(0x5E);
                  }
                  return colorScheme.secondary;
                },
              ),
              overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                    return colorScheme.secondary.withAlpha(0x0D);
                  }
                  if (states.contains(MaterialState.focused)) {
                    return colorScheme.secondary.withAlpha(0x26);
                  }
                  if (states.contains(MaterialState.pressed)) {
                    return colorScheme.secondary.withAlpha(0x33);
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
        'FST1.11-M3: GIVEN a default M3 FlexSubTheme.textButtonTheme() '
        'EXPECT equal to TextButtonThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF7142E7),
        brightness: Brightness.light,
      );
      final MaterialStateProperty<Color?> foregroundColor =
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return colorScheme.onSurface.withOpacity(0.38);
        }
        return colorScheme.primary;
      });

      final MaterialStateProperty<Color?> overlayColor =
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) {
          return colorScheme.primary.withOpacity(0.08);
        }
        if (states.contains(MaterialState.focused)) {
          return colorScheme.primary.withOpacity(0.12);
        }
        if (states.contains(MaterialState.pressed)) {
          return colorScheme.primary.withOpacity(0.12);
        }
        return null;
      });
      expect(
        FlexSubThemes.textButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
        ).toString(),
        equalsIgnoringHashCodes(
          TextButtonThemeData(
            style: ButtonStyle(
              foregroundColor: foregroundColor,
              backgroundColor:
                  ButtonStyleButton.allOrNull<Color>(Colors.transparent),
              overlayColor: overlayColor,
              elevation: ButtonStyleButton.allOrNull<double>(0.0),
            ),
          ).toString(),
        ),
      );
    });
    test('FST1.11-M2-states: Does TextButton have right material states', () {
      const ColorScheme colorScheme = ColorScheme.light();
      // Disabled foreground
      expect(
        FlexSubThemes.textButtonTheme(colorScheme: colorScheme)
            .style!
            .foregroundColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(colorScheme.primary
            .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
            .withAlpha(kDisabledForegroundAlpha)),
      );
      expect(
        FlexSubThemes.textButtonTheme(colorScheme: colorScheme)
            .style!
            .foregroundColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.primary),
      );
      // Overlay color states
      expect(
        FlexSubThemes.textButtonTheme(colorScheme: colorScheme)
            .style!
            .overlayColor!
            .resolve(<MaterialState>{MaterialState.hovered}),
        equals(colorScheme.primary.withAlpha(kHoverBackgroundAlpha)),
      );
      expect(
        FlexSubThemes.textButtonTheme(colorScheme: colorScheme)
            .style!
            .overlayColor!
            .resolve(<MaterialState>{MaterialState.focused}),
        equals(colorScheme.primary.withAlpha(kFocusBackgroundAlpha)),
      );
      expect(
        FlexSubThemes.textButtonTheme(colorScheme: colorScheme)
            .style!
            .overlayColor!
            .resolve(<MaterialState>{MaterialState.pressed}),
        equals(colorScheme.primary.withAlpha(kPressedBackgroundAlpha)),
      );
      expect(
        FlexSubThemes.textButtonTheme(colorScheme: colorScheme)
            .style!
            .overlayColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(Colors.transparent),
      );
    });
    test('FST1.11-M3-states: Does TextButton have right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      // Disabled foreground
      expect(
        FlexSubThemes.textButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
        )
            .style!
            .foregroundColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(colorScheme.onSurface.withOpacity(0.38)),
      );
      expect(
        FlexSubThemes.textButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
        )
            .style!
            .foregroundColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.primary),
      );
      // Overlay color states
      expect(
        FlexSubThemes.textButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
        ).style!.overlayColor!.resolve(<MaterialState>{MaterialState.hovered}),
        equals(colorScheme.primary.withOpacity(0.08)),
      );
      expect(
        FlexSubThemes.textButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
        ).style!.overlayColor!.resolve(<MaterialState>{MaterialState.focused}),
        equals(colorScheme.primary.withOpacity(0.12)),
      );
      expect(
        FlexSubThemes.textButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
        ).style!.overlayColor!.resolve(<MaterialState>{MaterialState.pressed}),
        equals(colorScheme.primary.withOpacity(0.12)),
      );
      expect(
        FlexSubThemes.textButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
        ).style!.overlayColor!.resolve(<MaterialState>{MaterialState.selected}),
        equals(null),
      );
      // Custom shape test
      expect(
        FlexSubThemes.textButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
          radius: 15,
        ).style!.shape!.resolve(<MaterialState>{}),
        equals(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
        ),
      );
    });
    test(
        'FST1.11-M3-custom-states: Does TextButton have right material '
        'states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      // Disabled foreground
      expect(
        FlexSubThemes.textButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          useMaterial3: true,
        )
            .style!
            .foregroundColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(colorScheme.onSurface.withOpacity(0.38)),
      );
      expect(
        FlexSubThemes.textButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          useMaterial3: true,
        )
            .style!
            .foregroundColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.tertiary),
      );
      // Overlay color states
      expect(
        FlexSubThemes.textButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          useMaterial3: true,
        ).style!.overlayColor!.resolve(<MaterialState>{MaterialState.hovered}),
        equals(colorScheme.tertiary.withOpacity(0.08)),
      );
      expect(
        FlexSubThemes.textButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          useMaterial3: true,
        ).style!.overlayColor!.resolve(<MaterialState>{MaterialState.focused}),
        equals(colorScheme.tertiary.withOpacity(0.12)),
      );
      expect(
        FlexSubThemes.textButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          useMaterial3: true,
        ).style!.overlayColor!.resolve(<MaterialState>{MaterialState.pressed}),
        equals(colorScheme.tertiary.withOpacity(0.12)),
      );
      expect(
        FlexSubThemes.textButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          useMaterial3: true,
        ).style!.overlayColor!.resolve(<MaterialState>{MaterialState.selected}),
        equals(null),
      );
      // Custom shape test
      expect(
        FlexSubThemes.textButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          useMaterial3: true,
          radius: 1,
        ).style!.shape!.resolve(<MaterialState>{}),
        equals(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(1),
            ),
          ),
        ),
      );
    });

    // TODO(rydmike): Monitor Flutter SDK deprecation of ButtonThemeData.
    // -------------------------------------------------------------------------
    // FlexSubThemes old material buttons theme tests
    // -------------------------------------------------------------------------
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
        'FST1.12d: GIVEN a custom FlexSubTheme.buttonTheme() '
        'EXPECT equal to ButtonThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.dark();
      expect(
        FlexSubThemes.buttonTheme(
          colorScheme: colorScheme,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          minButtonSize: const Size(45, 44),
          radius: 10,
        ),
        equals(
          ButtonThemeData(
            colorScheme: colorScheme,
            minWidth: 45,
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                Radius.circular(10),
              ),
            ),
            textTheme: ButtonTextTheme.primary,
          ),
        ),
      );
    });
    test(
        'FST1.12-base-color: GIVEN a default FlexSubTheme.buttonTheme() '
        'EXPECT equal to ButtonThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.buttonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
        ),
        equals(
          ButtonThemeData(
            colorScheme: colorScheme,
            minWidth: 40,
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            layoutBehavior: ButtonBarLayoutBehavior.constrained,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            hoverColor: colorScheme.secondary
                .blendAlpha(Colors.white, 0x40)
                .withAlpha(0x19),
            focusColor: colorScheme.secondary
                .blendAlpha(Colors.white, 0x4C)
                .withAlpha(0x4C),
            highlightColor: colorScheme.secondary
                .blendAlpha(Colors.white, 0x40)
                .withAlpha(0x19),
            splashColor: colorScheme.secondary
                .blendAlpha(Colors.white, 0x1F)
                .withAlpha(0x33),
            disabledColor: colorScheme.secondary
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
    // -------------------------------------------------------------------------
    // FlexSubThemes ToggleButtons tests
    // -------------------------------------------------------------------------
    test(
        'FST1.13: GIVEN a default FlexSubTheme.toggleButtonsTheme() EXPECT '
        'equal to ToggleButtonsThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      final VisualDensity visualDensity = VisualDensity.adaptivePlatformDensity;
      expect(
        FlexSubThemes.toggleButtonsTheme(colorScheme: colorScheme),
        equals(
          ToggleButtonsThemeData(
            borderWidth: 1,
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
              minWidth: 40 - 1 * 2 + visualDensity.baseSizeAdjustment.dx,
              minHeight: 40 - 1 * 2 + visualDensity.baseSizeAdjustment.dy,
            ),
          ),
        ),
      );
    });
    test(
        'FST1.13-base-color: GIVEN a default FlexSubTheme.toggleButtonsTheme() '
        'EXPECT '
        'equal to ToggleButtonsThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      final VisualDensity visualDensity = VisualDensity.adaptivePlatformDensity;
      expect(
        FlexSubThemes.toggleButtonsTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
        ),
        equals(
          ToggleButtonsThemeData(
            borderWidth: 1,
            selectedColor: colorScheme.onSecondary.withAlpha(0xE5),
            color: colorScheme.secondary,
            fillColor: colorScheme.secondary.blendAlpha(Colors.white, 0x19),
            borderColor: colorScheme.secondary.withAlpha(0xA7),
            selectedBorderColor:
                colorScheme.secondary.blendAlpha(Colors.white, 0x19),
            hoverColor: colorScheme.secondary
                .blendAlpha(Colors.white, 0x40 + 0x19)
                .withAlpha(0x19),
            focusColor: colorScheme.secondary
                .blendAlpha(Colors.white, 0x4C + 0x19)
                .withAlpha(0x4C),
            highlightColor: colorScheme.secondary
                .blendAlpha(Colors.white, 0x40 + 0x19)
                .withAlpha(0x19),
            splashColor: colorScheme.secondary
                .blendAlpha(Colors.white, 0x1F + 0x19)
                .withAlpha(0x33),
            disabledColor: colorScheme.secondary
                .blendAlpha(colorScheme.onSurface, 0x66)
                .withAlpha(0x5E),
            disabledBorderColor: colorScheme.secondary
                .blendAlpha(colorScheme.onSurface, 0x66)
                .withAlpha(0x31),
            borderRadius: BorderRadius.circular(20),
            constraints: BoxConstraints(
              minWidth: 40 - 1 * 2 + visualDensity.baseSizeAdjustment.dx,
              minHeight: 40 - 1 * 2 + visualDensity.baseSizeAdjustment.dy,
            ),
          ),
        ),
      );
    });
    // -------------------------------------------------------------------------
    // FlexSubThemes FloatingActionButton tests
    // -------------------------------------------------------------------------
    test(
        'FST1.14a: GIVEN a default FlexSubTheme.floatingActionButtonTheme() '
        'EXPECT equal to FloatingActionButtonThemeData() version '
        'with same values', () {
      expect(
        FlexSubThemes.floatingActionButtonTheme(),
        equals(
          const FloatingActionButtonThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
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
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
          ),
        ),
      );
    });
    test(
        'FST1.14c: GIVEN a circular FlexSubTheme.floatingActionButtonTheme() '
        'EXPECT equal to FloatingActionButtonThemeData() version '
        'with same Shape', () {
      expect(
        FlexSubThemes.floatingActionButtonTheme(
          radius: 30,
          alwaysCircular: true,
        ),
        equals(
          const FloatingActionButtonThemeData(shape: StadiumBorder()),
        ),
      );
    });
    test(
        'FST1.14d: GIVEN a custom FlexSubTheme.floatingActionButtonTheme() '
        'EXPECT equal to FloatingActionButtonThemeData() version '
        'with same values', () {
      expect(
        FlexSubThemes.floatingActionButtonTheme(
          radius: 30,
          backgroundSchemeColor: SchemeColor.primaryContainer,
        ),
        equals(
          const FloatingActionButtonThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
          ),
        ),
      );
    });
    test(
        'FST1.14e: GIVEN a custom FlexSubTheme.floatingActionButtonTheme() '
        'EXPECT equal to FloatingActionButtonThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.floatingActionButtonTheme(
          colorScheme: colorScheme,
          radius: 32,
        ),
        equals(
          const FloatingActionButtonThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32)),
            ),
          ),
        ),
      );
    });
    test(
        'FST1.14f: GIVEN a null shape FlexSubTheme.floatingActionButtonTheme() '
        'EXPECT equal to FloatingActionButtonThemeData() version '
        'with default shape values and colors', () {
      const ColorScheme colorScheme = ColorScheme.dark();
      expect(
        FlexSubThemes.floatingActionButtonTheme(
          colorScheme: colorScheme,
          backgroundSchemeColor: SchemeColor.secondary,
          radius: 32,
          useShape: false,
        ),
        equals(
          FloatingActionButtonThemeData(
            backgroundColor: colorScheme.secondary,
            foregroundColor: colorScheme.onSecondary,
          ),
        ),
      );
    });
    test(
        'FST1.14f: GIVEN a null shape FlexSubTheme.floatingActionButtonTheme() '
        'EXPECT equal to FloatingActionButtonThemeData() version '
        'with default shape values and colors', () {
      const ColorScheme colorScheme = ColorScheme.dark();
      expect(
        FlexSubThemes.floatingActionButtonTheme(
          colorScheme: colorScheme,
          backgroundSchemeColor: SchemeColor.secondary,
          radius: 32,
          useShape: true,
          alwaysCircular: true,
        ),
        equals(
          FloatingActionButtonThemeData(
            backgroundColor: colorScheme.secondary,
            foregroundColor: colorScheme.onSecondary,
            shape: const StadiumBorder(),
          ),
        ),
      );
    });
    test(
        'FST1.14g: GIVEN a custom FlexSubTheme.floatingActionButtonTheme() '
        'EXPECT equal to FloatingActionButtonThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.floatingActionButtonTheme(
          colorScheme: colorScheme,
          backgroundSchemeColor: SchemeColor.onPrimary,
          radius: 32,
        ),
        equals(
          FloatingActionButtonThemeData(
            backgroundColor: colorScheme.onPrimary,
            foregroundColor: colorScheme.primary,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(32),
              ),
            ),
          ),
        ),
      );
    });
    // -------------------------------------------------------------------------
    // FlexSubThemes Chip tests
    // -------------------------------------------------------------------------
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
          labelStyle: textTheme.labelLarge!,
        ),
        equals(
          ChipThemeData(
            brightness: Brightness.dark,
            padding: const EdgeInsets.all(4),
            labelStyle:
                textTheme.labelLarge!.copyWith(color: const Color(0xff310077)),
            secondaryLabelStyle:
                textTheme.labelLarge!.copyWith(color: const Color(0xff310077)),
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
    test(
        'FST1.15-M3: GIVEN a default FlexSubTheme.chipTheme(M3 no-null scheme) '
        'EXPECT equal to ChipThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      final TextTheme textTheme =
          Typography.material2018(platform: TargetPlatform.android).black;
      expect(
        FlexSubThemes.chipTheme(
          colorScheme: colorScheme,
          labelStyle: textTheme.labelLarge!,
          baseSchemeColor: SchemeColor.primary,
          useMaterial3: true,
        ),
        equals(
          ChipThemeData(
            brightness: Brightness.dark,
            labelStyle:
                textTheme.labelLarge!.copyWith(color: const Color(0xff310077)),
            secondaryLabelStyle:
                textTheme.labelLarge!.copyWith(color: const Color(0xff310077)),
            backgroundColor: const Color(0xffdfccfb),
            deleteIconColor: const Color(0xff6200ee),
            disabledColor: const Color(0x313a008e),
            selectedColor: const Color(0xffbe96f8),
            secondarySelectedColor: const Color(0xffbe96f8),
            checkmarkColor: const Color(0xff310077),
          ),
        ),
      );
    });
    test(
        'FST1.15-M3-n: GIVEN a default FlexSubTheme.chipTheme(M3 null scheme) '
        'EXPECT equal to ChipThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      final TextTheme textTheme =
          Typography.material2018(platform: TargetPlatform.android).black;
      expect(
        FlexSubThemes.chipTheme(
          colorScheme: colorScheme,
          labelStyle: textTheme.labelLarge!,
          useMaterial3: true,
        ),
        equals(
          const ChipThemeData(),
        ),
      );
    });
    test(
        'FST1.16: GIVEN a FlexSubTheme.chipTheme() with usedSchemeColor '
        'Secondary EXPECT equal to ChipThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      final TextTheme textTheme =
          Typography.material2018(platform: TargetPlatform.android).black;
      expect(
        FlexSubThemes.chipTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          labelStyle: textTheme.labelLarge!,
        ),
        equals(
          ChipThemeData(
            brightness: Brightness.dark,
            padding: const EdgeInsets.all(4),
            labelStyle:
                textTheme.labelLarge!.copyWith(color: const Color(0xff016d63)),
            secondaryLabelStyle:
                textTheme.labelLarge!.copyWith(color: const Color(0xff016d63)),
            backgroundColor: const Color(0xffccf7f3),
            deleteIconColor: const Color(0xff03dac6),
            disabledColor: const Color(0x31018276),
            selectedColor: const Color(0xff97efe7),
            secondarySelectedColor: const Color(0xff97efe7),
            checkmarkColor: const Color(0xff016d63),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
        ),
      );
    });
    // -------------------------------------------------------------------------
    // FlexSubThemes NavigationBar tests
    // -------------------------------------------------------------------------
    test(
        'FST1.17: GIVEN a default FlexSubTheme.navigationBarTheme() '
        'EXPECT equal to NavigationBarThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.navigationBarTheme(
          colorScheme: colorScheme,
          useFlutterDefaults: true,
        ),
        equals(
          const NavigationBarThemeData(
            height: null,
            elevation: null,
            labelBehavior: null,
            backgroundColor: null,
            indicatorColor: null,
            labelTextStyle: null,
            iconTheme: null,
          ),
        ),
      );
    });
    test(
        'FST1.18custom1: GIVEN a custom1 FlexSubTheme.navigationBarTheme() '
        'EXPECT equal to NavigationBarThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      final TextTheme textTheme =
          Typography.material2021(platform: TargetPlatform.android).black;
      final NavigationBarThemeData navBarTheme =
          FlexSubThemes.navigationBarTheme(
        colorScheme: colorScheme,
        elevation: 3,
        selectedIconSchemeColor: SchemeColor.secondary,
        selectedLabelSchemeColor: SchemeColor.error,
        unselectedIconSchemeColor: SchemeColor.onSurface,
        unselectedLabelSchemeColor: SchemeColor.onSurface,
        backgroundSchemeColor: null,
        indicatorSchemeColor: SchemeColor.secondaryContainer,
        height: 80,
        opacity: 0.9,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        mutedUnselectedIcon: true,
        mutedUnselectedLabel: true,
        indicatorAlpha: 0x3D,
        unselectedAlphaBlend: 0x66,
        unselectedAlpha: 0xA5,
      );
      expect(
        navBarTheme.toString(),
        equalsIgnoringHashCodes(
          NavigationBarThemeData(
            height: 80,
            elevation: 3,
            backgroundColor: colorScheme.background.withOpacity(0.9),
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            indicatorColor: colorScheme.secondaryContainer.withAlpha(0x3D),
            labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return textTheme.labelSmall!
                      .copyWith(color: colorScheme.error);
                }
                return textTheme.labelSmall!.copyWith(
                  color: colorScheme.error
                      .blendAlpha(colorScheme.error, 0x66)
                      .withAlpha(0xA5),
                );
              },
            ),
            iconTheme: MaterialStateProperty.resolveWith<IconThemeData>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return IconThemeData(
                    size: 24,
                    color: colorScheme.secondary,
                  );
                }
                return IconThemeData(
                    size: 24,
                    color: colorScheme.onSurface
                        .blendAlpha(colorScheme.onSurface, 0x66)
                        .withAlpha(0xA5));
              },
            ),
          ).toString(),
        ),
      );
      // Does it have the right states?
      expect(
        navBarTheme.iconTheme!
            .resolve(<MaterialState>{MaterialState.selected})?.color,
        equals(colorScheme.secondary),
      );
      expect(
        navBarTheme.iconTheme!.resolve(<MaterialState>{})?.color,
        equals(
          colorScheme.onSurface
              .blendAlpha(colorScheme.onSurface, 0x66)
              .withAlpha(0xA5),
        ),
      );
      expect(
        navBarTheme.labelTextStyle!
            .resolve(<MaterialState>{MaterialState.selected})?.color,
        equals(colorScheme.error),
      );
      expect(
        navBarTheme.labelTextStyle!.resolve(<MaterialState>{})?.color,
        equals(
          colorScheme.onSurface
              .blendAlpha(colorScheme.onSurface, 0x66)
              .withAlpha(0xA5),
        ),
      );
    });
    test(
        'FST1.18custom2: GIVEN a custom1 FlexSubTheme.navigationBarTheme() '
        'EXPECT equal to NavigationBarThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      final TextTheme textTheme =
          Typography.material2021(platform: TargetPlatform.android).black;
      final NavigationBarThemeData navBarTheme =
          FlexSubThemes.navigationBarTheme(
        colorScheme: colorScheme,
        labelTextStyle: textTheme.bodySmall,
        selectedIconSchemeColor: SchemeColor.secondaryContainer,
        selectedLabelSchemeColor: SchemeColor.primaryContainer,
        unselectedIconSchemeColor: SchemeColor.onSurface,
        unselectedLabelSchemeColor: SchemeColor.onSurface,
        indicatorSchemeColor: SchemeColor.secondary,
        backgroundSchemeColor: SchemeColor.error,
        height: 80,
        opacity: 0.9,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        mutedUnselectedIcon: false,
        mutedUnselectedLabel: false,
        indicatorAlpha: 0x3D,
        unselectedAlphaBlend: 0x66,
        unselectedAlpha: 0xA5,
        selectedIconSize: 28,
        unselectedIconSize: 25,
      );
      expect(
        navBarTheme.toString(),
        equalsIgnoringHashCodes(
          NavigationBarThemeData(
            height: 80,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            backgroundColor: colorScheme.error.withOpacity(0.9),
            indicatorColor: colorScheme.secondary.withAlpha(0x3D),
            labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return textTheme.bodySmall!
                      .copyWith(color: colorScheme.primaryContainer);
                }
                return textTheme.bodySmall!
                    .copyWith(color: colorScheme.onSurface);
              },
            ),
            iconTheme: MaterialStateProperty.resolveWith<IconThemeData>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return IconThemeData(
                    size: 28,
                    color: colorScheme.secondaryContainer,
                  );
                }
                return IconThemeData(size: 25, color: colorScheme.onSurface);
              },
            ),
          ).toString(),
        ),
      );
      // Does it have the right states?
      expect(
        navBarTheme.iconTheme!
            .resolve(<MaterialState>{MaterialState.selected})?.color,
        equals(colorScheme.secondaryContainer),
      );
      expect(
        navBarTheme.iconTheme!
            .resolve(<MaterialState>{MaterialState.selected})?.size,
        equals(28),
      );
      expect(
        navBarTheme.iconTheme!.resolve(<MaterialState>{})?.color,
        equals(
          colorScheme.onSurface,
        ),
      );
      expect(
        navBarTheme.iconTheme!.resolve(<MaterialState>{})?.size,
        equals(25),
      );
      expect(
        navBarTheme.labelTextStyle!
            .resolve(<MaterialState>{MaterialState.selected})?.color,
        equals(colorScheme.primaryContainer),
      );
      expect(
        navBarTheme.labelTextStyle!.resolve(<MaterialState>{})?.color,
        equals(
          colorScheme.onSurface,
        ),
      );
    });
    // -------------------------------------------------------------------------
    // FlexSubThemes Switch tests
    // -------------------------------------------------------------------------
    test(
        'FST1.19-light: GIVEN a light default FlexSubTheme.switchTheme() '
        'EXPECT equal to SwitchThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.switchTheme(colorScheme: colorScheme).toString(),
        equalsIgnoringHashCodes(
          SwitchThemeData(
            thumbColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.grey.shade400;
                }
                if (states.contains(MaterialState.selected)) {
                  return colorScheme.primary;
                }
                return Colors.grey.shade50;
              },
            ),
            trackColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.black12;
                }
                if (states.contains(MaterialState.selected)) {
                  return colorScheme.primary.withAlpha(0x70);
                }
                // Opinionated color on track when not selected
                return colorScheme.primary.withAlpha(0x30);
              },
            ),
          ).toString(),
        ),
      );
    });
    test('FST1.19-light-states: Does Switch have right material states', () {
      const ColorScheme colorScheme = ColorScheme.light();
      // Disabled colors
      expect(
        FlexSubThemes.switchTheme(colorScheme: colorScheme)
            .thumbColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(Colors.grey.shade400),
      );
      expect(
        FlexSubThemes.switchTheme(colorScheme: colorScheme)
            .trackColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(Colors.black12),
      );
      // Selected background
      expect(
        FlexSubThemes.switchTheme(colorScheme: colorScheme)
            .thumbColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.primary),
      );
      expect(
        FlexSubThemes.switchTheme(colorScheme: colorScheme)
            .trackColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.primary.withAlpha(0x70)),
      );
      // Default states
      expect(
        FlexSubThemes.switchTheme(colorScheme: colorScheme)
            .thumbColor!
            .resolve(<MaterialState>{}),
        equals(Colors.grey.shade50),
      );
      expect(
        FlexSubThemes.switchTheme(colorScheme: colorScheme)
            .trackColor!
            .resolve(<MaterialState>{}),
        equals(colorScheme.primary.withAlpha(0x70)),
      );
      // Default state for trackColor when unselectedIsColored, is false
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          unselectedIsColored: false,
        ).trackColor!.resolve(<MaterialState>{}),
        equals(const Color(0x52000000)),
      );
    });

    test(
        'FST1.19-dark: GIVEN a dark default FlexSubTheme.switchTheme() '
        'EXPECT equal to SwitchThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.dark();
      expect(
        FlexSubThemes.switchTheme(colorScheme: colorScheme).toString(),
        equalsIgnoringHashCodes(
          SwitchThemeData(
            thumbColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.grey.shade800;
                }
                if (states.contains(MaterialState.selected)) {
                  return colorScheme.secondary;
                }
                return Colors.grey.shade400;
              },
            ),
            trackColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.white10;
                }
                if (states.contains(MaterialState.selected)) {
                  return colorScheme.secondary.withAlpha(0x70);
                }
                // Opinionated color on track when not selected
                return colorScheme.secondary.withAlpha(0x25);
              },
            ),
          ).toString(),
        ),
      );
    });
    test('FST1.19-dark-states: Does Switch have right material states', () {
      const ColorScheme colorScheme = ColorScheme.dark();
      // Disabled colors
      expect(
        FlexSubThemes.switchTheme(colorScheme: colorScheme)
            .thumbColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(Colors.grey.shade800),
      );
      expect(
        FlexSubThemes.switchTheme(colorScheme: colorScheme)
            .trackColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(Colors.white10),
      );
      // Selected background
      expect(
        FlexSubThemes.switchTheme(colorScheme: colorScheme)
            .thumbColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.primary),
      );
      expect(
        FlexSubThemes.switchTheme(colorScheme: colorScheme)
            .trackColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.primary.withAlpha(0x70)),
      );
      // Default states
      expect(
        FlexSubThemes.switchTheme(colorScheme: colorScheme)
            .thumbColor!
            .resolve(<MaterialState>{}),
        equals(Colors.grey.shade400),
      );
      expect(
        FlexSubThemes.switchTheme(colorScheme: colorScheme)
            .trackColor!
            .resolve(<MaterialState>{}),
        equals(colorScheme.primary.withAlpha(0x70)),
      );
      // Default state for trackColor when unselectedIsColored, is false
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          unselectedIsColored: false,
        ).trackColor!.resolve(<MaterialState>{}),
        equals(Colors.white30),
      );
    });
    test(
        'FST1.19-custom-light: GIVEN a light custom FlexSubTheme.switchTheme() '
        'EXPECT equal to SwitchThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          splashRadius: 30,
          unselectedIsColored: true,
        ).toString(),
        equalsIgnoringHashCodes(
          SwitchThemeData(
            splashRadius: 30,
            thumbColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.grey.shade400;
                }
                if (states.contains(MaterialState.selected)) {
                  return colorScheme.tertiary;
                }
                return Colors.grey.shade50;
              },
            ),
            trackColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.black12;
                }
                if (states.contains(MaterialState.selected)) {
                  return colorScheme.tertiary.withAlpha(0x70);
                }
                // Opinionated color on track when not selected
                return colorScheme.tertiary.withAlpha(0x30);
              },
            ),
          ).toString(),
        ),
      );
    });
    // -------------------------------------------------------------------------
    // FlexSubThemes CheckBox tests
    // -------------------------------------------------------------------------
    test(
        'FST1.20-light: GIVEN a light default FlexSubTheme.checkboxTheme() '
        'EXPECT equal to CheckboxThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.checkboxTheme(colorScheme: colorScheme).toString(),
        equalsIgnoringHashCodes(
          CheckboxThemeData(
            checkColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.grey.shade200;
                }
                if (states.contains(MaterialState.selected)) {
                  return colorScheme.onPrimary;
                }
                return Colors.grey.shade50;
              },
            ),
            fillColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.grey.shade400;
                }
                if (states.contains(MaterialState.selected)) {
                  return colorScheme.primary;
                }
                // Opinionated color on track when not selected
                return colorScheme.primary.withAlpha(0xDD);
              },
            ),
          ).toString(),
        ),
      );
    });
    test('FST1.20-light-states: Does CheckBox have right material states', () {
      const ColorScheme colorScheme = ColorScheme.light();
      // Disabled colors
      expect(
        FlexSubThemes.checkboxTheme(colorScheme: colorScheme)
            .checkColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(Colors.grey.shade200),
      );
      expect(
        FlexSubThemes.checkboxTheme(colorScheme: colorScheme)
            .fillColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(Colors.grey.shade400),
      );
      // Selected background
      expect(
        FlexSubThemes.checkboxTheme(colorScheme: colorScheme)
            .checkColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.onPrimary),
      );
      expect(
        FlexSubThemes.checkboxTheme(colorScheme: colorScheme)
            .fillColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.primary),
      );
      // Default states
      expect(
        FlexSubThemes.checkboxTheme(colorScheme: colorScheme)
            .checkColor!
            .resolve(<MaterialState>{}),
        equals(Colors.grey.shade50),
      );
      expect(
        FlexSubThemes.checkboxTheme(colorScheme: colorScheme)
            .fillColor!
            .resolve(<MaterialState>{}),
        equals(colorScheme.primary.withAlpha(0xDD)),
      );
      // Default state for trackColor when unselectedIsColored, is false
      expect(
        FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          unselectedIsColored: false,
        ).fillColor!.resolve(<MaterialState>{}),
        equals(Colors.black54),
      );
    });

    test(
        'FST1.20-dark: GIVEN a dark default FlexSubTheme.checkboxTheme() '
        'EXPECT equal to CheckboxThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.dark();
      expect(
        FlexSubThemes.checkboxTheme(colorScheme: colorScheme).toString(),
        equalsIgnoringHashCodes(
          CheckboxThemeData(
            checkColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.grey.shade600;
                }
                if (states.contains(MaterialState.selected)) {
                  return colorScheme.onPrimary;
                }
                return Colors.grey.shade400;
              },
            ),
            fillColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.grey.shade800;
                }
                if (states.contains(MaterialState.selected)) {
                  return colorScheme.primary;
                }
                // Opinionated color on track when not selected
                return colorScheme.primary.withAlpha(0xDD);
              },
            ),
          ).toString(),
        ),
      );
    });
    test('FST1.20-dark-states: Does CheckBox have right material states', () {
      const ColorScheme colorScheme = ColorScheme.dark();
      // Disabled colors
      expect(
        FlexSubThemes.checkboxTheme(colorScheme: colorScheme)
            .checkColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(Colors.grey.shade600),
      );
      expect(
        FlexSubThemes.checkboxTheme(colorScheme: colorScheme)
            .fillColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(Colors.grey.shade800),
      );
      // Selected background
      expect(
        FlexSubThemes.checkboxTheme(colorScheme: colorScheme)
            .checkColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.onPrimary),
      );
      expect(
        FlexSubThemes.checkboxTheme(colorScheme: colorScheme)
            .fillColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.primary),
      );
      // Default states
      expect(
        FlexSubThemes.checkboxTheme(colorScheme: colorScheme)
            .checkColor!
            .resolve(<MaterialState>{}),
        equals(Colors.grey.shade400),
      );
      expect(
        FlexSubThemes.checkboxTheme(colorScheme: colorScheme)
            .fillColor!
            .resolve(<MaterialState>{}),
        equals(colorScheme.primary.withAlpha(0xDD)),
      );
      // Default state for trackColor when unselectedIsColored, is false
      expect(
        FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          unselectedIsColored: false,
        ).fillColor!.resolve(<MaterialState>{}),
        equals(Colors.white70),
      );
    });
    test(
        'FST1.20-custom-light: GIVEN a light custom FlexSubTheme.checkboxTheme '
        'EXPECT equal to CheckboxThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          splashRadius: 30,
          unselectedIsColored: false,
        ).toString(),
        equalsIgnoringHashCodes(
          CheckboxThemeData(
            splashRadius: 30,
            checkColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.grey.shade200;
                }
                if (states.contains(MaterialState.selected)) {
                  return colorScheme.onTertiary;
                }
                return Colors.grey.shade50;
              },
            ),
            fillColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.grey.shade400;
                }
                if (states.contains(MaterialState.selected)) {
                  return colorScheme.tertiary;
                }
                return Colors.black54;
              },
            ),
          ).toString(),
        ),
      );
    });
    // -------------------------------------------------------------------------
    // FlexSubThemes CheckBox tests
    // -------------------------------------------------------------------------
    test(
        'FST1.21-light: GIVEN a light default FlexSubTheme.radioTheme() '
        'EXPECT equal to RadioThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.radioTheme(colorScheme: colorScheme).toString(),
        equalsIgnoringHashCodes(
          RadioThemeData(
            fillColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.grey.shade400;
                }
                if (states.contains(MaterialState.selected)) {
                  return colorScheme.primary;
                }
                // Opinionated color on track when not selected
                return colorScheme.primary.withAlpha(0xDD);
              },
            ),
          ).toString(),
        ),
      );
    });
    test('FST1.21-light-states: Does CheckBox have right material states', () {
      const ColorScheme colorScheme = ColorScheme.light();
      // Disabled colors
      expect(
        FlexSubThemes.radioTheme(colorScheme: colorScheme)
            .fillColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(Colors.grey.shade400),
      );
      // Selected radio fill
      expect(
        FlexSubThemes.radioTheme(colorScheme: colorScheme)
            .fillColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.primary),
      );
      // Default states
      expect(
        FlexSubThemes.radioTheme(colorScheme: colorScheme)
            .fillColor!
            .resolve(<MaterialState>{}),
        equals(colorScheme.primary.withAlpha(0xDD)),
      );
      // Default state for trackColor when unselectedIsColored, is false
      expect(
        FlexSubThemes.radioTheme(
          colorScheme: colorScheme,
          unselectedIsColored: false,
        ).fillColor!.resolve(<MaterialState>{}),
        equals(Colors.black54),
      );
    });

    test(
        'FST1.21-dark: GIVEN a dark default FlexSubTheme.radioTheme() '
        'EXPECT equal to CheckboxThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.dark();
      expect(
        FlexSubThemes.radioTheme(colorScheme: colorScheme).toString(),
        equalsIgnoringHashCodes(
          RadioThemeData(
            fillColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.grey.shade800;
                }
                if (states.contains(MaterialState.selected)) {
                  return colorScheme.primary;
                }
                // Opinionated color on track when not selected
                return colorScheme.primary.withAlpha(0xDD);
              },
            ),
          ).toString(),
        ),
      );
    });
    test('FST1.21-dark-states: Does CheckBox have right material states', () {
      const ColorScheme colorScheme = ColorScheme.dark();
      // Disabled colors
      expect(
        FlexSubThemes.radioTheme(colorScheme: colorScheme)
            .fillColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(Colors.grey.shade800),
      );
      // Selected radio fill
      expect(
        FlexSubThemes.radioTheme(colorScheme: colorScheme)
            .fillColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.primary),
      );
      // Default states
      expect(
        FlexSubThemes.radioTheme(colorScheme: colorScheme)
            .fillColor!
            .resolve(<MaterialState>{}),
        equals(colorScheme.primary.withAlpha(0xDD)),
      );
      // Default state for trackColor when unselectedIsColored, is false
      expect(
        FlexSubThemes.radioTheme(
          colorScheme: colorScheme,
          unselectedIsColored: false,
        ).fillColor!.resolve(<MaterialState>{}),
        equals(Colors.white70),
      );
    });
    test(
        'FST1.21-custom-light: GIVEN a light custom FlexSubTheme.radioTheme() '
        'EXPECT equal to RadioThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.radioTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          splashRadius: 30,
          unselectedIsColored: false,
        ).toString(),
        equalsIgnoringHashCodes(
          RadioThemeData(
            splashRadius: 30,
            fillColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.grey.shade400;
                }
                if (states.contains(MaterialState.selected)) {
                  return colorScheme.tertiary;
                }
                return Colors.black54;
              },
            ),
          ).toString(),
        ),
      );
    });
    // -------------------------------------------------------------------------
    // FlexSubThemes NavigationRail tests
    // -------------------------------------------------------------------------
    test(
        'FST1.22-light-flutter default: GIVEN a default '
        'FlexSubTheme.navigationRailTheme() that uses Flutter defaults '
        'EXPECT equal to NavigationRailThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.navigationRailTheme(
          colorScheme: colorScheme,
          useFlutterDefaults: true,
        ),
        equals(
          const NavigationRailThemeData(
            elevation: 0,
            useIndicator: true,
            indicatorColor: Color(0x00000000),
          ),
        ),
      );
    });
    test(
        'FST1.22-dark-flutter default: GIVEN a default '
        'FlexSubTheme.navigationRailTheme() that uses Flutter defaults '
        'EXPECT equal to NavigationRailThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.dark();
      expect(
        FlexSubThemes.navigationRailTheme(
          colorScheme: colorScheme,
          useFlutterDefaults: true,
        ),
        equals(
          const NavigationRailThemeData(
            elevation: 0,
            useIndicator: true,
            indicatorColor: Color(0x00000000),
          ),
        ),
      );
    });
    test(
        'FST1.22-light-flutter default: GIVEN a default '
        'FlexSubTheme.navigationRailTheme() that NOT use Flutter defaults '
        'EXPECT equal to NavigationRailThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.navigationRailTheme(
          colorScheme: colorScheme,
          // useFlutterDefaults: false // <<- Assumed as default,
        ),
        equals(
          const NavigationRailThemeData(
            elevation: 0,
            useIndicator: true,
            indicatorColor: Color(0x00000000),
            backgroundColor: Color(0xffffffff),
            unselectedLabelTextStyle: TextStyle(
                inherit: true, color: Color(0xa5000000), fontSize: 12.0),
            selectedLabelTextStyle: TextStyle(
                inherit: true, color: Color(0xff6200ee), fontSize: 12.0),
            unselectedIconTheme: IconThemeData(
                color: Color(0xa5000000), opacity: 1.0, size: 24.0),
            selectedIconTheme: IconThemeData(
                color: Color(0xff6200ee), opacity: 1.0, size: 24.0),
          ),
        ),
      );
    });
    test(
        'FST1.22-dark-flutter default: GIVEN a default '
        'FlexSubTheme.navigationRailTheme() that NOT use Flutter defaults '
        'EXPECT equal to NavigationRailThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.dark();
      expect(
        FlexSubThemes.navigationRailTheme(
          colorScheme: colorScheme,
          // useFlutterDefaults: false // <<- Assumed as default,
        ),
        equals(
          const NavigationRailThemeData(
            elevation: 0,
            useIndicator: true,
            indicatorColor: Color(0x00000000),
            backgroundColor: Color(0xff121212),
            unselectedLabelTextStyle: TextStyle(
                inherit: true, color: Color(0xa5ffffff), fontSize: 12.0),
            selectedLabelTextStyle: TextStyle(
                inherit: true, color: Color(0xffbb86fc), fontSize: 12.0),
            unselectedIconTheme: IconThemeData(
                color: Color(0xa5ffffff), opacity: 1.0, size: 24.0),
            selectedIconTheme: IconThemeData(
                color: Color(0xffbb86fc), opacity: 1.0, size: 24.0),
          ),
        ),
      );
    });
    test(
        'FST1.22custom: GIVEN a custom FlexSubTheme.navigationRailTheme() '
        'EXPECT equal to NavigationRailThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.dark();
      expect(
        FlexSubThemes.navigationRailTheme(
          colorScheme: colorScheme,
          selectedLabelSchemeColor: SchemeColor.secondary,
          selectedIconSchemeColor: SchemeColor.secondaryContainer,
          unselectedLabelSchemeColor: SchemeColor.onSurface,
          unselectedIconSchemeColor: SchemeColor.tertiary,
          backgroundSchemeColor: SchemeColor.surface,
          mutedUnselectedIcon: true,
          mutedUnselectedLabel: true,
          elevation: 1,
          opacity: 0.5,
          unselectedAlphaBlend: 0xFA,
          unselectedAlpha: 0x45,
          labelType: NavigationRailLabelType.all,
          groupAlignment: 0,
        ),
        equals(
          NavigationRailThemeData(
            elevation: 1,
            backgroundColor: colorScheme.surface.withOpacity(0.5),
            selectedIconTheme: IconThemeData(
              color: colorScheme.secondaryContainer,
              size: 24,
              opacity: 1,
            ),
            selectedLabelTextStyle: TextStyle(
              color: colorScheme.secondary,
              fontSize: 12,
            ),
            unselectedLabelTextStyle: TextStyle(
              color: colorScheme.onSurface
                  .blendAlpha(colorScheme.onSurface, 0xFA)
                  .withAlpha(0x45),
              fontSize: 12,
            ),
            unselectedIconTheme: IconThemeData(
              color: colorScheme.tertiary
                  .blendAlpha(colorScheme.tertiary, 0xFA)
                  .withAlpha(0x45),
              size: 24,
              opacity: 1,
            ),
            useIndicator: true,
            indicatorColor: const Color(0x00000000),
            labelType: NavigationRailLabelType.all,
            groupAlignment: 0,
          ),
        ),
      );
    });
    test(
        'FST1.23custom: GIVEN a custom FlexSubTheme.navigationRailTheme() '
        'EXPECT equal to NavigationRailThemeData() version '
        'with same values Icons Size test', () {
      const ColorScheme colorScheme = ColorScheme.dark();
      expect(
        FlexSubThemes.navigationRailTheme(
          colorScheme: colorScheme,
          selectedLabelSchemeColor: SchemeColor.secondary,
          selectedIconSchemeColor: SchemeColor.secondaryContainer,
          unselectedLabelSchemeColor: SchemeColor.onSurface,
          unselectedIconSchemeColor: SchemeColor.tertiary,
          backgroundSchemeColor: SchemeColor.surface,
          mutedUnselectedIcon: true,
          mutedUnselectedLabel: true,
          unselectedIconSize: 30,
          selectedIconSize: 32,
          elevation: 1,
          opacity: 0.5,
          unselectedAlphaBlend: 0xFA,
          unselectedAlpha: 0x45,
          labelType: NavigationRailLabelType.all,
          groupAlignment: 0,
        ),
        equals(
          NavigationRailThemeData(
            elevation: 1,
            backgroundColor: colorScheme.surface.withOpacity(0.5),
            selectedIconTheme: IconThemeData(
              color: colorScheme.secondaryContainer,
              size: 32,
              opacity: 1,
            ),
            selectedLabelTextStyle: TextStyle(
              color: colorScheme.secondary,
              fontSize: 12,
            ),
            unselectedLabelTextStyle: TextStyle(
              color: colorScheme.onSurface
                  .blendAlpha(colorScheme.onSurface, 0xFA)
                  .withAlpha(0x45),
              fontSize: 12,
            ),
            unselectedIconTheme: IconThemeData(
              color: colorScheme.tertiary
                  .blendAlpha(colorScheme.tertiary, 0xFA)
                  .withAlpha(0x45),
              size: 30,
              opacity: 1,
            ),
            useIndicator: true,
            indicatorColor: const Color(0x00000000),
            labelType: NavigationRailLabelType.all,
            groupAlignment: 0,
          ),
        ),
      );
    });
    // -------------------------------------------------------------------------
    // FlexSubThemes Slider tests
    // -------------------------------------------------------------------------
    test(
        'FST1.24a-light: GIVEN a light default FlexSubTheme.sliderTheme() '
        'EXPECT equal to SliderThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.sliderTheme(colorScheme: colorScheme).toString(),
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
            overlayColor: Color(0x1f6200ee),
            valueIndicatorShape: RectangularSliderValueIndicatorShape(),
          ).toString(),
        ),
      );
    });
    test(
        'FST1.24b-light: GIVEN a light custom FlexSubTheme.sliderTheme() '
        'EXPECT equal to SliderThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.sliderTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          trackHeight: 6,
          valueIndicatorColor: const Color(0xFF342342),
          valueIndicatorTextStyle: const TextStyle(color: Colors.white12),
        ).toString(),
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
            overlayColor: Color(0x1f03dac6),
            valueIndicatorColor: Color(0xff342342),
            valueIndicatorShape: RectangularSliderValueIndicatorShape(),
            valueIndicatorTextStyle:
                TextStyle(inherit: true, color: Color(0x1fffffff)),
          ).toString(),
        ),
      );
    });
  });
}
