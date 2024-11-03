import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flex_color_scheme/src/flex_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  double tintAlphaFactor(Color color, Brightness mode,
      [bool surfaceMode = false]) {
    if (mode == Brightness.light) {
      return surfaceMode
          ? ThemeData.estimateBrightnessForColor(color) == Brightness.dark
              ? 1.5
              : 4.0
          : ThemeData.estimateBrightnessForColor(color) == Brightness.dark
              ? 5.0
              : 2.0;
    } else {
      return surfaceMode
          ? ThemeData.estimateBrightnessForColor(color) == Brightness.dark
              ? 5.0
              : 2.0
          : ThemeData.estimateBrightnessForColor(color) == Brightness.dark
              ? 5.0
              : 4.0;
    }
  }

  //****************************************************************************
  // FlexSubTheme unit tests.
  //
  // Tests that the static sub theme methods create intended defined sub
  // ThemeData when matching ons, matching with FlexSubTheme defaults.
  //****************************************************************************
  group('WITH: FlexSubTheme.appBarTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes appBarTheme tests
    // -------------------------------------------------------------------------
    //
    // The AppBar theme is for now only pass through to the normal
    // Flutter AppBar theme. All the logic and complexity is included in
    // FlexColorScheme.toTheme factory and included in its tests. No need
    // to test it here, but included as a stub for potential future additions.
    test(
        'AppBar FST1.1: GIVEN a default FlexSubTheme.appBarTheme() '
        'EXPECT equal to AppBarTheme with shape RoundedRectangleBorder()', () {
      expect(
        FlexSubThemes.appBarTheme(),
        equals(const AppBarTheme(
          shape: RoundedRectangleBorder(),
        )),
      );
    });
  });
  group('WITH: FlexSubTheme.bottomAppBarTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes bottomAppBarTheme tests
    // -------------------------------------------------------------------------
    test(
        'BottomAppBar FST2.1: GIVEN a FlexSubTheme.bottomAppBarTheme() '
        'EXPECT equal to BottomAppBarTheme() with same config', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.dark,
      );
      expect(
        FlexSubThemes.bottomAppBarTheme(
          colorScheme: colorScheme,
          backgroundSchemeColor: SchemeColor.surfaceContainer,
        ),
        equals(BottomAppBarTheme(
          color: colorScheme.surfaceContainer,
        )),
      );
    });
    test(
        'BottomAppBar FST2.2: GIVEN a FlexSubTheme.bottomAppBarTheme() M3 '
        'EXPECT equal to BottomAppBarTheme() with same config', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.dark,
      );
      expect(
        FlexSubThemes.bottomAppBarTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
        ),
        equals(const BottomAppBarTheme()),
      );
    });
  });
  group('WITH: FlexSubTheme.bottomNavigationBar ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes BottomNavigationBar tests
    // -------------------------------------------------------------------------
    test(
        'BottomNavigationBar FST3.1 flutter-default-light: GIVEN a LIGHT '
        'default '
        'FlexSubTheme.bottomNavigationBar() with FlutterDefault '
        'EXPECT equal to BottomNavigationBarThemeData() version '
        'with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      expect(
        FlexSubThemes.bottomNavigationBarTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ),
        equals(
          const BottomNavigationBarThemeData(
            backgroundColor: Color(0xfff8faf0),
            elevation: 3.0,
            selectedIconTheme: IconThemeData(
                size: 24.0, color: Color(0xff446732), opacity: 1.0),
            unselectedIconTheme: IconThemeData(
                size: 24.0, color: Color(0xa5191d16), opacity: 1.0),
            selectedItemColor: Color(0xff446732),
            unselectedItemColor: Color(0xa5191d16),
            selectedLabelStyle: TextStyle(
                inherit: true, color: Color(0xff446732), fontSize: 14.0),
            unselectedLabelStyle: TextStyle(
                inherit: true, color: Color(0xa5191d16), fontSize: 12.0),
          ),
        ),
      );
    });
    test(
        'BottomNavigationBar FST3.2 flutter-default-dark: GIVEN a DARK '
        'default '
        'FlexSubTheme.bottomNavigationBar() with FlutterDefault '
        'EXPECT equal to BottomNavigationBarThemeData() version '
        'with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.dark,
      );
      expect(
        FlexSubThemes.bottomNavigationBarTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
        ),
        equals(
          const BottomNavigationBarThemeData(
            backgroundColor: Color(0xff11140e),
            elevation: 3.0,
            selectedIconTheme: IconThemeData(
                size: 24.0, color: Color(0xffaad291), opacity: 1.0),
            unselectedIconTheme: IconThemeData(
                size: 24.0, color: Color(0xffc3c8bb), opacity: 1.0),
            selectedItemColor: Color(0xffaad291),
            unselectedItemColor: Color(0xffc3c8bb),
            selectedLabelStyle: TextStyle(
                inherit: true, color: Color(0xffaad291), fontSize: 14.0),
            unselectedLabelStyle: TextStyle(
                inherit: true, color: Color(0xffc3c8bb), fontSize: 12.0),
          ),
        ),
      );
    });
    test(
        'BottomNavigationBar FST3.3 fcs-default-light: GIVEN a default LIGHT '
        'FlexSubTheme.bottomNavigationBar() with FCS default '
        'EXPECT equal to BottomNavigationBarThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.bottomNavigationBarTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ),
        equals(
          const BottomNavigationBarThemeData(
            elevation: 3.0,
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
        'BottomNavigationBar FST3.4 fcs-default-dark: GIVEN a default DARK '
        'FlexSubTheme.bottomNavigationBar() with FCS default '
        'EXPECT equal to BottomNavigationBarThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.dark();
      expect(
        FlexSubThemes.bottomNavigationBarTheme(
          colorScheme: colorScheme,
          elevation: 2,
          useMaterial3: false,
        ),
        equals(
          const BottomNavigationBarThemeData(
            elevation: 2,
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
        'BottomNavigationBar FST3.5 custom: GIVEN a custom '
        'FlexSubTheme.bottomNavigationBar() '
        'EXPECT equal to BottomNavigationBarThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.dark();
      expect(
        FlexSubThemes.bottomNavigationBarTheme(
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
    test(
        'BottomNavigationBar FST3.6: Given a deprecated bottomNavigationBar '
        'EXPECT bottomNavigationBarTheme', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      expect(
        FlexSubThemes.bottomNavigationBarTheme(
          colorScheme: colorScheme,
        ),
        equals(
          FlexSubThemes.bottomNavigationBar(
            colorScheme: colorScheme,
          ),
        ),
      );
    });
  });
  group('WITH: FlexSubTheme.bottomSheetTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes BottomSheet tests
    // -------------------------------------------------------------------------
    test(
        'BottomSheet FST4.1:  GIVEN a default FlexSubTheme.bottomSheetTheme() '
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
        'BottomSheet FST4.2 custom: GIVEN a custom '
        'FlexSubTheme.bottomSheetTheme() '
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
  });
  group('WITH: FlexSubTheme.buttonTheme ', () {
    // TODO(rydmike): Monitor Flutter SDK deprecation of ButtonThemeData.
    // -------------------------------------------------------------------------
    // FlexSubThemes old material buttons theme tests
    // -------------------------------------------------------------------------
    test(
        'ButtonTheme FST5.1: light GIVEN a default FlexSubTheme.buttonTheme() '
        'EXPECT equal to ButtonThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      final Color overlay = colorScheme.surface;
      final Color tint = colorScheme.primary;
      const double factor = 5.0;
      expect(
        FlexSubThemes.buttonTheme(
          colorScheme: colorScheme,
          useTintedInteraction: true,
          useTintedDisable: true,
        ),
        equals(
          ButtonThemeData(
            colorScheme: colorScheme,
            minWidth: 40,
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            layoutBehavior: ButtonBarLayoutBehavior.constrained,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            hoverColor: FlexSubThemes.tintedHovered(overlay, tint, factor),
            focusColor: FlexSubThemes.tintedFocused(overlay, tint, factor),
            highlightColor:
                FlexSubThemes.tintedHighlight(overlay, tint, factor),
            splashColor: FlexSubThemes.tintedSplash(overlay, tint, factor),
            disabledColor:
                FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)
                    .withAlpha(kAlphaLowDisabled),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
            ),
            textTheme: ButtonTextTheme.primary,
          ),
        ),
      );
    });
    test(
        'ButtonTheme FST5.2: dark GIVEN a custom FlexSubTheme.buttonTheme() '
        'EXPECT equal to ButtonThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.dark,
      );
      final Color overlay = colorScheme.surface;
      final Color tint = colorScheme.primary;
      const double factor = 4.0;
      expect(
        FlexSubThemes.buttonTheme(
          colorScheme: colorScheme,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          minButtonSize: const Size(45, 44),
          radius: 10,
          useTintedInteraction: true,
          useTintedDisable: true,
        ),
        equals(
          ButtonThemeData(
            colorScheme: colorScheme,
            minWidth: 45,
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            layoutBehavior: ButtonBarLayoutBehavior.constrained,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            hoverColor: FlexSubThemes.tintedHovered(overlay, tint, factor),
            focusColor: FlexSubThemes.tintedFocused(overlay, tint, factor),
            highlightColor:
                FlexSubThemes.tintedHighlight(overlay, tint, factor),
            splashColor: FlexSubThemes.tintedSplash(overlay, tint, factor),
            disabledColor:
                FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)
                    .withAlpha(kAlphaLowDisabled),
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
        'ButtonTheme FST5.3 base-color: GIVEN a default '
        'FlexSubTheme.buttonTheme() '
        'EXPECT equal to ButtonThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      final Color overlay = colorScheme.surface;
      final Color tint = colorScheme.secondary;
      const double factor = 5.0;
      expect(
        FlexSubThemes.buttonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          useTintedInteraction: true,
          useTintedDisable: true,
        ),
        equals(
          ButtonThemeData(
            colorScheme: colorScheme,
            minWidth: 40,
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            layoutBehavior: ButtonBarLayoutBehavior.constrained,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            hoverColor: FlexSubThemes.tintedHovered(overlay, tint, factor),
            focusColor: FlexSubThemes.tintedFocused(overlay, tint, factor),
            highlightColor:
                FlexSubThemes.tintedHighlight(overlay, tint, factor),
            splashColor: FlexSubThemes.tintedSplash(overlay, tint, factor),
            disabledColor:
                FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)
                    .withAlpha(kAlphaLowDisabled),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
            ),
            textTheme: ButtonTextTheme.primary,
          ),
        ),
      );
    });
  });
  group('WITH: FlexSubTheme.cardTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes Card tests
    // -------------------------------------------------------------------------
    test(
        'Card FST6.1: GIVEN a default FlexSubTheme.cardTheme() '
        'EXPECT equal to CardTheme() version with same values', () {
      expect(
        FlexSubThemes.cardTheme(),
        equals(
          const CardTheme(clipBehavior: Clip.antiAlias),
        ),
      );
    });
    test(
        'Card FST6.2 custom: GIVEN a custom FlexSubTheme.cardTheme() '
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
  });
  group('WITH: FlexSubTheme.checkboxTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes Checkbox tests
    // -------------------------------------------------------------------------
    test(
        'Checkbox FST7.1 light: GIVEN a light default M2 '
        'FlexSubTheme.checkboxTheme() '
        'EXPECT equal to CheckboxThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      );
      expect(
        FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).toString(),
        equalsIgnoringHashCodes(
          CheckboxThemeData(
            side: WidgetStateBorderSide.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                if (states.contains(WidgetState.selected)) {
                  return const BorderSide(
                      width: 2.0, color: Colors.transparent);
                }
                return BorderSide(
                  width: 2.0,
                  color: colorScheme.onSurface.withAlpha(kAlphaDisabled),
                );
              }
              if (states.contains(WidgetState.selected)) {
                return const BorderSide(width: 0.0, color: Colors.transparent);
              }
              // This is M2 SDK default.
              return const BorderSide(width: 2.0, color: Colors.black54);
            }),
            fillColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.disabled)) {
                  if (states.contains(WidgetState.selected)) {
                    return Colors.grey.shade400;
                  }
                }
                if (states.contains(WidgetState.selected)) {
                  return colorScheme.primary;
                }
                return Colors.transparent;
              },
            ),
            checkColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.disabled)) {
                  return Colors.grey.shade200;
                }
                if (states.contains(WidgetState.selected)) {
                  return colorScheme.onPrimary;
                }
                return Colors.grey.shade50;
              },
            ),
            overlayColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.selected)) {
                  if (states.contains(WidgetState.pressed)) {
                    return colorScheme.onSurface.withOpacity(0.12);
                  }
                  if (states.contains(WidgetState.hovered)) {
                    return colorScheme.primary.withOpacity(0.08);
                  }
                  if (states.contains(WidgetState.focused)) {
                    return colorScheme.primary.withOpacity(0.12);
                  }
                  return Colors.transparent;
                }
                if (states.contains(WidgetState.pressed)) {
                  return colorScheme.primary.withOpacity(0.12);
                }
                if (states.contains(WidgetState.hovered)) {
                  return colorScheme.onSurface.withOpacity(0.08);
                }
                if (states.contains(WidgetState.focused)) {
                  return colorScheme.onSurface.withOpacity(0.12);
                }
                return Colors.transparent;
              },
            ),
          ).toString(),
        ),
      );
    });
    test(
        'Checkbox FST7.2 light-states: Does '
        'Checkbox M2 have right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      );
      // Side states in M2.
      //
      // Side: Disabled and selected
      expect(
        (FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).side as WidgetStateBorderSide?)!
            .resolve(<WidgetState>{WidgetState.disabled, WidgetState.selected}),
        equals(const BorderSide(width: 2.0, color: Colors.transparent)),
      );
      // Side: Disabled, tinted
      expect(
        (FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useTintedDisable: true,
          useMaterial3: false,
        ).side as WidgetStateBorderSide?)!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(BorderSide(
          width: 2.0,
          color: FlexSubThemes.tintedDisable(
            colorScheme.onSurface,
            colorScheme.primary,
          ),
        )),
      );
      // Side: disabled
      expect(
        (FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).side as WidgetStateBorderSide?)!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(BorderSide(
          width: 2.0,
          color: colorScheme.onSurface.withAlpha(kAlphaDisabled),
        )),
      );
      // Side: selected
      expect(
        (FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).side as WidgetStateBorderSide?)!
            .resolve(<WidgetState>{WidgetState.selected}),
        equals(const BorderSide(width: 2.0, color: Colors.transparent)),
      );
      // Side: default stated, tinted
      expect(
        (FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          unselectedIsColored: true,
          useMaterial3: false,
        ).side as WidgetStateBorderSide?)!
            .resolve(<WidgetState>{}),
        equals(BorderSide(width: 2.0, color: colorScheme.primary)),
      );
      // Side: default stated, tinted
      expect(
        (FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).side as WidgetStateBorderSide?)!
            .resolve(<WidgetState>{}),
        equals(const BorderSide(width: 2.0, color: Colors.black54)),
      );
      //
      // fillColor
      expect(
        FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        )
            .fillColor!
            .resolve(<WidgetState>{WidgetState.disabled, WidgetState.selected}),
        equals(Colors.grey.shade400),
      );
      expect(
        FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).fillColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(Colors.transparent),
      );
      expect(
        FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).fillColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.primary),
      );
      expect(
        FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useTintedDisable: true,
          useMaterial3: false,
        )
            .fillColor!
            .resolve(<WidgetState>{WidgetState.disabled, WidgetState.selected}),
        equals(FlexSubThemes.tintedDisable(
            colorScheme.onSurface, colorScheme.primary)),
      );
      expect(
        FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          unselectedIsColored: true,
        ).fillColor!.resolve(<WidgetState>{}),
        equals(Colors.transparent),
      );
      //
      // Check color
      expect(
        FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).checkColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(Colors.grey.shade200),
      );
      expect(
        FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).checkColor!.resolve(<WidgetState>{}),
        equals(Colors.grey.shade50),
      );
      expect(
        FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).checkColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.onPrimary),
      );
    });
    //
    //
    test(
        'Checkbox FST7.3 light-M3-states: Does '
        'Checkbox have right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      );
      final CheckboxThemeData m = FlexSubThemes.checkboxTheme(
        colorScheme: colorScheme,
        useMaterial3: true,
      );
      final CheckboxThemeData m2 = FlexSubThemes.checkboxTheme(
        colorScheme: colorScheme,
        useMaterial3: true,
        useTintedDisable: true,
        useTintedInteraction: true,
        unselectedIsColored: true,
      );
      // Side states in M2.
      //
      // Side: Disabled and selected
      expect(
        (m.side as WidgetStateBorderSide?)!
            .resolve(<WidgetState>{WidgetState.disabled, WidgetState.selected}),
        equals(const BorderSide(width: 2.0, color: Colors.transparent)),
      );
      // Side: Disabled, tinted
      expect(
        (m2.side as WidgetStateBorderSide?)!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(BorderSide(
          width: 2.0,
          color: FlexSubThemes.tintedDisable(
            colorScheme.onSurface,
            colorScheme.primary,
          ),
        )),
      );
      // Side: disabled
      expect(
        (m.side as WidgetStateBorderSide?)!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(BorderSide(
          width: 2.0,
          color: colorScheme.onSurface.withAlpha(kAlphaDisabled),
        )),
      );
      // Side: selected
      expect(
        (m.side as WidgetStateBorderSide?)!
            .resolve(<WidgetState>{WidgetState.selected}),
        equals(const BorderSide(width: 0.0, color: Colors.transparent)),
      );
      // Side: error
      expect(
        (m.side as WidgetStateBorderSide?)!
            .resolve(<WidgetState>{WidgetState.error}),
        equals(BorderSide(width: 2.0, color: colorScheme.error)),
      );
      // Side: pressed, tinted
      expect(
        (m2.side as WidgetStateBorderSide?)!
            .resolve(<WidgetState>{WidgetState.pressed}),
        equals(BorderSide(width: 2.0, color: colorScheme.primary)),
      );
      // Side: pressed
      expect(
        (m.side as WidgetStateBorderSide?)!
            .resolve(<WidgetState>{WidgetState.pressed}),
        equals(BorderSide(width: 2.0, color: colorScheme.onSurface)),
      );
      // Side: hovered, tinted
      expect(
        (m2.side as WidgetStateBorderSide?)!
            .resolve(<WidgetState>{WidgetState.hovered}),
        equals(BorderSide(width: 2.0, color: colorScheme.primary)),
      );
      // Side: hovered
      expect(
        (m.side as WidgetStateBorderSide?)!
            .resolve(<WidgetState>{WidgetState.hovered}),
        equals(BorderSide(width: 2.0, color: colorScheme.onSurface)),
      );
      // Side: focused, tinted
      expect(
        (m2.side as WidgetStateBorderSide?)!
            .resolve(<WidgetState>{WidgetState.focused}),
        equals(BorderSide(width: 2.0, color: colorScheme.primary)),
      );
      // Side: focused
      expect(
        (m.side as WidgetStateBorderSide?)!
            .resolve(<WidgetState>{WidgetState.focused}),
        equals(BorderSide(width: 2.0, color: colorScheme.onSurface)),
      );
      // Side: default, tinted
      expect(
        (m2.side as WidgetStateBorderSide?)!.resolve(<WidgetState>{}),
        equals(BorderSide(width: 2.0, color: colorScheme.primary)),
      );
      // Side: default
      expect(
        (m.side as WidgetStateBorderSide?)!.resolve(<WidgetState>{}),
        equals(BorderSide(width: 2.0, color: colorScheme.onSurfaceVariant)),
      );
      //
      // Fill color
      //
      // FillColor - disabled, selected
      expect(
        m.fillColor!
            .resolve(<WidgetState>{WidgetState.disabled, WidgetState.selected}),
        equals(colorScheme.onSurface.withAlpha(kAlphaDisabled)),
      );
      // FillColor - disabled
      expect(
        m.fillColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(Colors.transparent),
      );
      // FillColor - selected, error
      expect(
        m.fillColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.error}),
        equals(colorScheme.error),
      );
      // FillColor - selected
      expect(
        m.fillColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.primary),
      );
      expect(
        m.fillColor!.resolve(<WidgetState>{}),
        equals(Colors.transparent),
      );
      // Tinted fillColor
      expect(
        m2.fillColor!
            .resolve(<WidgetState>{WidgetState.disabled, WidgetState.selected}),
        equals(FlexSubThemes.tintedDisable(
            colorScheme.onSurface, colorScheme.primary)),
      );
      // Check colors
      //
      // checkColor - disabled
      expect(
        m.checkColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(Colors.transparent),
      );
      // checkColor - disabled, selected
      expect(
        m.checkColor!
            .resolve(<WidgetState>{WidgetState.disabled, WidgetState.selected}),
        equals(colorScheme.surface),
      );
      // checkColor - selected, error
      expect(
        m.checkColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.error}),
        equals(colorScheme.onError),
      );
      // checkColor - selected
      expect(
        m.checkColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.onPrimary),
      );
      // checkColor - default
      expect(
        m.checkColor!.resolve(<WidgetState>{}),
        equals(Colors.transparent),
      );
      // OverlayColors
      //
      expect(
        m.overlayColor!
            .resolve(<WidgetState>{WidgetState.error, WidgetState.pressed}),
        equals(colorScheme.error.withAlpha(kAlphaPressed)),
      );
      expect(
        m.overlayColor!
            .resolve(<WidgetState>{WidgetState.error, WidgetState.hovered}),
        equals(colorScheme.error.withAlpha(kAlphaHovered)),
      );
      expect(
        m.overlayColor!
            .resolve(<WidgetState>{WidgetState.error, WidgetState.focused}),
        equals(colorScheme.error.withAlpha(kAlphaFocused)),
      );
      expect(
        m.overlayColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.pressed}),
        equals(colorScheme.onSurface.withAlpha(kAlphaPressed)),
      );
      expect(
        m2.overlayColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.pressed}),
        equals(FlexSubThemes.tintedPressed(
            colorScheme.surface, colorScheme.primary, 1.5)),
      );
      expect(
        m.overlayColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.hovered}),
        equals(colorScheme.primary.withAlpha(kAlphaHovered)),
      );
      expect(
        m2.overlayColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.hovered}),
        equals(FlexSubThemes.tintedHovered(
            colorScheme.surface, colorScheme.primary, 1.5)),
      );
      expect(
        m.overlayColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.focused}),
        equals(colorScheme.primary.withAlpha(kAlphaFocused)),
      );
      expect(
        m2.overlayColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.focused}),
        equals(FlexSubThemes.tintedFocused(
            colorScheme.surface, colorScheme.primary, 1.5)),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(Colors.transparent),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(colorScheme.primary.withAlpha(kAlphaPressed)),
      );
      expect(
        m2.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(FlexSubThemes.tintedPressed(
            colorScheme.surface, colorScheme.primary, 1.5)),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(colorScheme.onSurface.withAlpha(kAlphaHovered)),
      );
      expect(
        m2.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(FlexSubThemes.tintedHovered(
            colorScheme.surface, colorScheme.primary, 1.5)),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        equals(colorScheme.onSurface.withAlpha(kAlphaFocused)),
      );
      expect(
        m2.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        equals(FlexSubThemes.tintedFocused(
            colorScheme.surface, colorScheme.primary, 1.5)),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{}),
        equals(Colors.transparent),
      );
    });

    test(
        'CheckBox FST7.4 dark: GIVEN an M2 dark default '
        'FlexSubTheme.checkboxTheme() '
        'EXPECT equal to CheckboxThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.dark,
      );
      expect(
        FlexSubThemes.checkboxTheme(
                colorScheme: colorScheme, unselectedIsColored: true)
            .toString(),
        equalsIgnoringHashCodes(
          CheckboxThemeData(
            side: WidgetStateBorderSide.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                if (states.contains(WidgetState.selected)) {
                  return const BorderSide(
                      width: 2.0, color: Colors.transparent);
                }
                return BorderSide(
                  width: 2.0,
                  color: colorScheme.onSurface.withAlpha(kAlphaDisabled),
                );
              }
              if (states.contains(WidgetState.selected)) {
                return const BorderSide(width: 0.0, color: Colors.transparent);
              }
              // This is M2 SDK default.
              return const BorderSide(width: 2.0, color: Colors.white70);
            }),
            fillColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.disabled)) {
                  if (states.contains(WidgetState.selected)) {
                    return Colors.grey.shade800;
                  }
                }
                if (states.contains(WidgetState.selected)) {
                  return colorScheme.primary;
                }
                return Colors.transparent;
              },
            ),
            checkColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.disabled)) {
                  return Colors.grey.shade600;
                }
                if (states.contains(WidgetState.selected)) {
                  return colorScheme.onPrimary;
                }
                return Colors.grey.shade400;
              },
            ),
            overlayColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.selected)) {
                  if (states.contains(WidgetState.pressed)) {
                    return colorScheme.onSurface.withOpacity(0.12);
                  }
                  if (states.contains(WidgetState.hovered)) {
                    return colorScheme.primary.withOpacity(0.08);
                  }
                  if (states.contains(WidgetState.focused)) {
                    return colorScheme.primary.withOpacity(0.12);
                  }
                  return Colors.transparent;
                }
                if (states.contains(WidgetState.pressed)) {
                  return colorScheme.primary.withOpacity(0.12);
                }
                if (states.contains(WidgetState.hovered)) {
                  return colorScheme.onSurface.withOpacity(0.08);
                }
                if (states.contains(WidgetState.focused)) {
                  return colorScheme.onSurface.withOpacity(0.12);
                }
                return Colors.transparent;
              },
            ),
          ).toString(),
        ),
      );
    });
    test(
        'CheckBox FST7.5 dark-states: Does CheckBox M2 have '
        'right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.dark,
      );
      // Side states in M2.
      //
      // Side: Disabled and selected
      expect(
        (FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).side as WidgetStateBorderSide?)!
            .resolve(<WidgetState>{WidgetState.disabled, WidgetState.selected}),
        equals(const BorderSide(width: 2.0, color: Colors.transparent)),
      );
      // Side: Disabled, tinted
      expect(
        (FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useTintedDisable: true,
          useMaterial3: false,
        ).side as WidgetStateBorderSide?)!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(BorderSide(
          width: 2.0,
          color: FlexSubThemes.tintedDisable(
            colorScheme.onSurface,
            colorScheme.primary,
          ),
        )),
      );
      // Side: disabled
      expect(
        (FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).side as WidgetStateBorderSide?)!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(BorderSide(
          width: 2.0,
          color: colorScheme.onSurface.withAlpha(kAlphaDisabled),
        )),
      );
      // Side: selected
      expect(
        (FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).side as WidgetStateBorderSide?)!
            .resolve(<WidgetState>{WidgetState.selected}),
        equals(const BorderSide(width: 2.0, color: Colors.transparent)),
      );
      // Side: default stated, tinted
      expect(
        (FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          unselectedIsColored: true,
          useMaterial3: false,
        ).side as WidgetStateBorderSide?)!
            .resolve(<WidgetState>{}),
        equals(BorderSide(width: 2.0, color: colorScheme.primary)),
      );
      // Side: default stated, tinted
      expect(
        (FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).side as WidgetStateBorderSide?)!
            .resolve(<WidgetState>{}),
        equals(const BorderSide(width: 2.0, color: Colors.white70)),
      );
      //
      // fillColor
      expect(
        FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        )
            .fillColor!
            .resolve(<WidgetState>{WidgetState.disabled, WidgetState.selected}),
        equals(Colors.grey.shade800),
      );
      expect(
        FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).fillColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(Colors.transparent),
      );
      expect(
        FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).fillColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.primary),
      );
      expect(
        FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useTintedDisable: true,
          useMaterial3: false,
        )
            .fillColor!
            .resolve(<WidgetState>{WidgetState.disabled, WidgetState.selected}),
        equals(FlexSubThemes.tintedDisable(
            colorScheme.onSurface, colorScheme.primary)),
      );
      expect(
        FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          unselectedIsColored: true,
          useMaterial3: false,
        ).fillColor!.resolve(<WidgetState>{}),
        equals(Colors.transparent),
      );
      //
      // Check color
      expect(
        FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).checkColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(Colors.grey.shade900),
      );
      expect(
        FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).checkColor!.resolve(<WidgetState>{}),
        equals(Colors.grey.shade400),
      );
      expect(
        FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).checkColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.onPrimary),
      );
    });
    test(
        'CheckBox FST7.6 custom-light: GIVEN a light '
        'custom FlexSubTheme.checkboxTheme '
        'EXPECT equal to CheckboxThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      );
      expect(
        FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          splashRadius: 30,
          unselectedIsColored: false,
          useMaterial3: false,
        ).toString(),
        equalsIgnoringHashCodes(
          CheckboxThemeData(
            splashRadius: 30,
            side: WidgetStateBorderSide.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                if (states.contains(WidgetState.selected)) {
                  return const BorderSide(
                      width: 2.0, color: Colors.transparent);
                }
                return BorderSide(
                  width: 2.0,
                  color: colorScheme.onSurface.withAlpha(kAlphaDisabled),
                );
              }
              if (states.contains(WidgetState.selected)) {
                return const BorderSide(width: 0.0, color: Colors.transparent);
              }
              // This is M2 SDK default.
              return const BorderSide(width: 2.0, color: Colors.black54);
            }),
            fillColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.disabled)) {
                  return Colors.grey.shade400;
                }
                if (states.contains(WidgetState.selected)) {
                  return colorScheme.tertiary;
                }
                return Colors.transparent;
              },
            ),
            checkColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.disabled)) {
                  return Colors.grey.shade200;
                }
                if (states.contains(WidgetState.selected)) {
                  return colorScheme.onTertiary;
                }
                return Colors.grey.shade50;
              },
            ),
            overlayColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.selected)) {
                  if (states.contains(WidgetState.pressed)) {
                    return colorScheme.onSurface.withOpacity(0.12);
                  }
                  if (states.contains(WidgetState.hovered)) {
                    return colorScheme.tertiary.withOpacity(0.08);
                  }
                  if (states.contains(WidgetState.focused)) {
                    return colorScheme.tertiary.withOpacity(0.12);
                  }
                  return Colors.transparent;
                }
                if (states.contains(WidgetState.pressed)) {
                  return colorScheme.tertiary.withOpacity(0.12);
                }
                if (states.contains(WidgetState.hovered)) {
                  return colorScheme.onSurface.withOpacity(0.08);
                }
                if (states.contains(WidgetState.focused)) {
                  return colorScheme.onSurface.withOpacity(0.12);
                }
                return Colors.transparent;
              },
            ),
          ).toString(),
        ),
      );
    });
  });
  group('WITH: FlexSubTheme.chipTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes Chip tests
    // -------------------------------------------------------------------------
    test(
        'Chip FST8.1: GIVEN a default FlexSubTheme.chipTheme() '
        'EXPECT equal to ChipThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      final TextTheme textTheme =
          Typography.material2018(platform: TargetPlatform.android).black;
      expect(
        FlexSubThemes.chipTheme(
          colorScheme: colorScheme,
          labelStyle: textTheme.labelLarge,
          useTintedDisable: false, // Default
          useMaterial3: false,
        ),
        equals(
          ChipThemeData(
            padding: const EdgeInsets.all(4),
            labelStyle: textTheme.labelLarge!.copyWith(
              color: Colors.black87,
              fontSize: 14,
              letterSpacing: 0.1,
              height: 1.43,
            ),
            secondaryLabelStyle: textTheme.labelLarge!.copyWith(
              color: Colors.black87,
              fontSize: 14,
              letterSpacing: 0.1,
              height: 1.43,
            ),
            backgroundColor: const Color(0xffdfccfb),
            disabledColor: const Color(0xffdfccfb).withAlpha(kAlphaLowDisabled),
            selectedColor: const Color(0xffbe96f8),
            secondarySelectedColor: const Color(0xffbe96f8),
            checkmarkColor: Colors.black87,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            iconTheme: const IconThemeData(
              color: Colors.black87,
              size: 18.0,
            ),
          ),
        ),
      );
    });
    test(
        'Chip FST8.2: GIVEN a FlexSubTheme.chipTheme(tint disable) '
        'EXPECT equal to ChipThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      final TextTheme textTheme =
          Typography.material2018(platform: TargetPlatform.android).black;
      expect(
        FlexSubThemes.chipTheme(
          colorScheme: colorScheme,
          labelStyle: textTheme.labelLarge,
          useTintedDisable: true,
          useMaterial3: false,
        ),
        equals(
          ChipThemeData(
            padding: const EdgeInsets.all(4),
            labelStyle: textTheme.labelLarge!.copyWith(
              color: Colors.black87,
              fontSize: 14,
              letterSpacing: 0.1,
              height: 1.43,
            ),
            secondaryLabelStyle: textTheme.labelLarge!.copyWith(
              color: Colors.black87,
              fontSize: 14,
              letterSpacing: 0.1,
              height: 1.43,
            ),
            backgroundColor: const Color(0xffdfccfb),
            disabledColor: FlexSubThemes.tintedDisable(
                    const Color(0xffdfccfb), const Color(0xffbe96f8))
                .withAlpha(kAlphaLowDisabled),
            selectedColor: const Color(0xffbe96f8),
            secondarySelectedColor: const Color(0xffbe96f8),
            checkmarkColor: Colors.black87,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            iconTheme: const IconThemeData(
              color: Colors.black87,
              size: 18.0,
            ),
          ),
        ),
      );
    });
    test(
        'Chip FST8.3 M3: GIVEN a default '
        'FlexSubTheme.chipTheme(M3 no-null scheme) '
        'EXPECT equal to ChipThemeData() version '
        'with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      );
      expect(
        FlexSubThemes.chipTheme(
          colorScheme: colorScheme,
        ),
        equals(
          ChipThemeData(
            labelStyle: const TextStyle().copyWith(
              color: colorScheme.onSurfaceVariant,
              fontSize: 14,
              letterSpacing: 0.1,
              height: 1.43,
            ),
            secondaryLabelStyle: const TextStyle().copyWith(
              color: colorScheme.onSecondaryContainer,
              fontSize: 14,
              letterSpacing: 0.1,
              height: 1.43,
            ),
            backgroundColor: colorScheme.surface,
            checkmarkColor: colorScheme.onSecondaryContainer,
            iconTheme: IconThemeData(
              color: colorScheme.onSurfaceVariant,
              size: 18.0,
            ),
          ),
        ),
      );
    });
    test(
        'Chip FST8.4 M3: GIVEN a '
        'FlexSubTheme.chipTheme(M3 no-null scheme with disable tint) '
        'EXPECT equal to ChipThemeData() version '
        'with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      );
      final TextTheme textTheme = Typography.material2021(
        platform: TargetPlatform.android,
        colorScheme: colorScheme,
      ).black;
      expect(
        FlexSubThemes.chipTheme(
          colorScheme: colorScheme,
          labelStyle: textTheme.labelLarge,
          baseSchemeColor: SchemeColor.primary,
          useTintedDisable: true,
          // useMaterial3: true, // Default
        ),
        equals(
          ChipThemeData(
            labelStyle: textTheme.labelLarge!.copyWith(
              color: colorScheme.onPrimary,
              fontSize: 14,
              letterSpacing: 0.1,
              height: 1.43,
            ),
            secondaryLabelStyle: textTheme.labelLarge!.copyWith(
              color: colorScheme.onSecondaryContainer,
              fontSize: 14,
              letterSpacing: 0.1,
              height: 1.43,
            ),
            backgroundColor: colorScheme.primary,
            checkmarkColor: colorScheme.onSecondaryContainer,
            iconTheme: const IconThemeData(
              size: 18.0,
              color: Colors.white70,
            ),
            disabledColor: FlexSubThemes.tintedDisable(
                    colorScheme.primary, colorScheme.secondaryContainer)
                .withAlpha(kAlphaLowDisabled),
          ),
        ),
      );
    });
    test(
        'Chip FST8.5 M3-n: GIVEN a default '
        'FlexSubTheme.chipTheme(M3 null scheme) '
        'EXPECT equal to ChipThemeData() version '
        'with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
          seedColor: const Color(0xFF6750A4), brightness: Brightness.light);
      final TextTheme textTheme = Typography.material2021(
              platform: TargetPlatform.android, colorScheme: colorScheme)
          .black;
      expect(
        FlexSubThemes.chipTheme(
          colorScheme: colorScheme,
          labelStyle: textTheme.labelLarge,
        ),
        equals(
          ChipThemeData(
            labelStyle: textTheme.labelLarge!.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontSize: 14,
              letterSpacing: 0.1,
              height: 1.43,
            ),
            secondaryLabelStyle: textTheme.labelLarge!.copyWith(
              color: colorScheme.onSecondaryContainer,
              fontSize: 14,
              letterSpacing: 0.1,
              height: 1.43,
            ),
            backgroundColor: colorScheme.surface,
            checkmarkColor: colorScheme.onSecondaryContainer,
            iconTheme: IconThemeData(
              color: colorScheme.onSurfaceVariant,
              size: 18.0,
            ),
          ),
        ),
      );
    });
    test(
        'Chip FST8.6: GIVEN a '
        'FlexSubTheme.chipTheme() with usedSchemeColor '
        'Secondary EXPECT equal to ChipThemeData() version '
        'with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
          seedColor: const Color(0xFF6750A4), brightness: Brightness.light);
      final TextTheme textTheme =
          Typography.material2018(platform: TargetPlatform.android).black;
      expect(
        FlexSubThemes.chipTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          labelStyle: textTheme.labelLarge,
        ),
        equals(
          ChipThemeData(
            labelStyle: textTheme.labelLarge!.copyWith(
              color: colorScheme.onSecondary,
              fontSize: 14,
              letterSpacing: 0.1,
              height: 1.43,
            ),
            secondaryLabelStyle: textTheme.labelLarge!.copyWith(
              color: colorScheme.onSecondaryContainer,
              fontSize: 14,
              letterSpacing: 0.1,
              height: 1.43,
            ),
            disabledColor: colorScheme.secondary.withAlpha(kAlphaLowDisabled),
            backgroundColor: colorScheme.secondary,
            checkmarkColor: colorScheme.onSecondaryContainer,
            iconTheme: const IconThemeData(
              color: Colors.white70,
              size: 18.0,
            ),
          ),
        ),
      );
    });
    test(
        'Chip FST8.7: GIVEN a '
        'FlexSubTheme.chipTheme() with usedSchemeColor '
        'Tertiary and disable tint EXPECT equal to ChipThemeData() version '
        'with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
          seedColor: const Color(0xFF6750A4), brightness: Brightness.light);
      final TextTheme textTheme =
          Typography.material2018(platform: TargetPlatform.android).black;
      expect(
        FlexSubThemes.chipTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          labelStyle: textTheme.labelLarge,
          useTintedDisable: true,
          // useMaterial3: false,
        ),
        equals(
          ChipThemeData(
            labelStyle: textTheme.labelLarge!.copyWith(
              color: colorScheme.onTertiary,
              fontSize: 14,
              letterSpacing: 0.1,
              height: 1.43,
            ),
            secondaryLabelStyle: textTheme.labelLarge!.copyWith(
              color: colorScheme.onSecondaryContainer,
              fontSize: 14,
              letterSpacing: 0.1,
              height: 1.43,
            ),
            backgroundColor: colorScheme.tertiary,
            checkmarkColor: colorScheme.onSecondaryContainer,
            iconTheme: const IconThemeData(
              color: Colors.white70,
              size: 18.0,
            ),
            disabledColor: FlexSubThemes.tintedDisable(
                    colorScheme.tertiary, colorScheme.secondaryContainer)
                .withAlpha(kAlphaLowDisabled),
          ),
        ),
      );
    });
    test(
        'Chip FST8.8: GIVEN a '
        'FlexSubTheme.chipTheme() with usedSchemeColor '
        'Tertiary, selectedSchemeColor, secondarySelectedSchemeColor and '
        'disable tint EXPECT equal to ChipThemeData() version '
        'with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
          seedColor: const Color(0xFF6750A4), brightness: Brightness.light);
      final TextTheme textTheme = Typography.material2021(
        platform: TargetPlatform.android,
        colorScheme: colorScheme,
      ).black;
      expect(
        FlexSubThemes.chipTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          selectedSchemeColor: SchemeColor.tertiaryContainer,
          secondarySelectedSchemeColor: SchemeColor.secondaryContainer,
          labelStyle: textTheme.labelLarge,
          useTintedDisable: true,
          // blendColors: true,
        ),
        equals(
          ChipThemeData(
            labelStyle: textTheme.labelLarge!.copyWith(
              color: colorScheme.onTertiary,
              fontSize: 14,
              letterSpacing: 0.1,
              height: 1.43,
            ),
            secondaryLabelStyle: textTheme.labelLarge!.copyWith(
              color: colorScheme.onSecondaryContainer,
              fontSize: 14,
              letterSpacing: 0.1,
              height: 1.43,
            ),
            selectedColor: colorScheme.tertiaryContainer,
            secondarySelectedColor: colorScheme.secondaryContainer,
            backgroundColor: colorScheme.tertiary,
            checkmarkColor: colorScheme.onTertiaryContainer,
            iconTheme: const IconThemeData(
              color: Colors.white70,
              size: 18.0,
            ),
            disabledColor: FlexSubThemes.tintedDisable(
                    colorScheme.tertiary, colorScheme.tertiaryContainer)
                .withAlpha(kAlphaLowDisabled),
          ),
        ),
      );
    });
    test(
        'Chip FST8.9: GIVEN a '
        'FlexSubTheme.chipTheme() with blend and usedSchemeColor '
        'Tertiary, selectedSchemeColor, secondarySelectedSchemeColor and '
        'disable tint EXPECT equal to ChipThemeData() version '
        'with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
          seedColor: const Color(0xFF6750A4), brightness: Brightness.light);
      final TextTheme textTheme = Typography.material2021(
        platform: TargetPlatform.android,
        colorScheme: colorScheme,
      ).black;
      final Color backgroundColor = colorScheme.tertiary
          .blendAlpha(colorScheme.surface, kChipBackgroundAlphaBlend);
      const Color onBackgroundColor = Colors.black87;
      final Color selectedColor = colorScheme.tertiaryContainer
          .blendAlpha(colorScheme.surface, kChipSelectedBackgroundAlphaBlend);
      const Color onSelectedColor = Colors.black87;
      final Color secondarySelectedColor = colorScheme.secondaryContainer
          .blendAlpha(colorScheme.surface, kChipSelectedBackgroundAlphaBlend);
      const Color onSecondarySelectedColor = Colors.black87;
      expect(
        FlexSubThemes.chipTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          selectedSchemeColor: SchemeColor.tertiaryContainer,
          secondarySelectedSchemeColor: SchemeColor.secondaryContainer,
          labelStyle: textTheme.labelLarge,
          useTintedDisable: true,
          blendColors: true,
        ),
        equals(
          ChipThemeData(
            labelStyle: textTheme.labelLarge!.copyWith(
              color: onBackgroundColor,
              fontSize: 14,
              letterSpacing: 0.1,
              height: 1.43,
            ),
            secondaryLabelStyle: textTheme.labelLarge!.copyWith(
              color: onSecondarySelectedColor,
              fontSize: 14,
              letterSpacing: 0.1,
              height: 1.43,
            ),
            selectedColor: selectedColor,
            secondarySelectedColor: secondarySelectedColor,
            backgroundColor: backgroundColor,
            checkmarkColor: onSelectedColor,
            iconTheme: const IconThemeData(
              color: Colors.black87,
              size: 18.0,
            ),
            disabledColor:
                FlexSubThemes.tintedDisable(backgroundColor, selectedColor)
                    .withAlpha(kAlphaLowDisabled),
          ),
        ),
      );
    });
    test(
        'Chip FST8.10: GIVEN a '
        'FlexSubTheme.chipTheme() with usedSchemeColor '
        'tertiary, selectedSchemeColor, '
        'secondarySelectedSchemeColor and '
        'NO disable tint EXPECT equal to ChipThemeData() version '
        'with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
          seedColor: const Color(0xFF6750A4), brightness: Brightness.light);
      final TextTheme textTheme = Typography.material2021(
        platform: TargetPlatform.android,
        colorScheme: colorScheme,
      ).black;
      expect(
        FlexSubThemes.chipTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.surfaceContainer,
          selectedSchemeColor: SchemeColor.tertiaryContainer,
          secondarySelectedSchemeColor: SchemeColor.secondaryContainer,
          labelStyle: textTheme.labelLarge,
          useTintedDisable: false,
          blendColors: false,
          useMaterial3: false,
        ),
        equals(
          ChipThemeData(
            labelStyle: textTheme.labelLarge!.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontSize: 14,
              letterSpacing: 0.1,
              height: 1.43,
            ),
            secondaryLabelStyle: textTheme.labelLarge!.copyWith(
              color: colorScheme.onSecondaryContainer,
              fontSize: 14,
              letterSpacing: 0.1,
              height: 1.43,
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(kChipRadius),
              ),
            ),
            padding: const EdgeInsets.all(4),
            selectedColor: colorScheme.tertiaryContainer,
            secondarySelectedColor: colorScheme.secondaryContainer,
            backgroundColor: colorScheme.surfaceContainer,
            checkmarkColor: colorScheme.onTertiaryContainer,
            iconTheme: IconThemeData(
              color: colorScheme.onSurfaceVariant,
              size: 18.0,
            ),
            disabledColor: colorScheme.onSurface.withAlpha(kAlphaLowDisabled),
          ),
        ),
      );
    });
  });
  group('WITH: FlexSubTheme.datePickerTheme ', () {
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
              borderRadius: BorderRadius.all(
                Radius.circular(28),
              ),
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
              borderRadius: BorderRadius.all(
                Radius.circular(28),
              ),
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
              borderRadius: BorderRadius.all(
                Radius.circular(28),
              ),
            ),
          ),
        ),
      );
    });
    test(
        'DatePicker FST9a.4 scheme-based: GIVEN a FlexSubTheme.datePickerTheme '
        'with backgroundSchemeColor and no backgroundColor '
        'EXPECT equal to DatePickerThemeData with backgroundSchemeColor', () {
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
              borderRadius: BorderRadius.all(
                Radius.circular(28),
              ),
            ),
          ),
        ),
      );
    });
    test(
        'DatePicker FST9a.4 scheme-based: GIVEN a FlexSubTheme.datePickerTheme '
        'with backgroundSchemeColor and backgroundColor nad header '
        'background '
        'EXPECT equal to DatePickerThemeData with backgroundSchemeColor and '
        'header background and header foreground contrast ', () {
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
              borderRadius: BorderRadius.all(
                Radius.circular(28),
              ),
            ),
          ),
        ),
      );
    });
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
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
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
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              filled: false,
              hoverColor: colorScheme.brightness == Brightness.dark
                  ? Colors.white.withOpacity(0.04)
                  : Colors.black.withOpacity(0.04),
              focusColor: colorScheme.brightness == Brightness.dark
                  ? Colors.white.withOpacity(0.12)
                  : Colors.black.withOpacity(0.12),
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
                    color: colorScheme.onSurface.withOpacity(0.12), width: 1),
              ),
              floatingLabelStyle:
                  WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
                // These styles are copied from M3 default, we are not
                // going to test them again.
                // coverage:ignore-start
                if (states.contains(WidgetState.disabled)) {
                  return TextStyle(
                      color: colorScheme.onSurface.withOpacity(0.38));
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
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              filled: false,
              hoverColor: colorScheme.brightness == Brightness.dark
                  ? Colors.white.withOpacity(0.04)
                  : Colors.black.withOpacity(0.04),
              focusColor: colorScheme.brightness == Brightness.dark
                  ? Colors.white.withOpacity(0.12)
                  : Colors.black.withOpacity(0.12),
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
                    color: colorScheme.onSurface.withOpacity(0.12), width: 1),
              ),
              floatingLabelStyle:
                  WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
                // These styles are copied from M3 default,
                // we are not going to test them again.
                // coverage:ignore-start
                if (states.contains(WidgetState.disabled)) {
                  return TextStyle(
                      color: colorScheme.onSurface.withOpacity(0.38));
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

  group('WITH: FlexSubTheme.dialogTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes Dialog tests
    // -------------------------------------------------------------------------
    test(
        'Dialog FST9.1: GIVEN a default FlexSubTheme.dialogTheme() '
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
        'Dialog FST9.2 background-based-a: GIVEN a FlexSubTheme.dialogTheme '
        'with no '
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
        'Dialog FST9.3 background-based-b: GIVEN a FlexSubTheme.dialogTheme '
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
        'Dialog FST9.4 scheme-based: GIVEN a FlexSubTheme.dialogTheme '
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
        'Dialog FST9.5 custom: GIVEN a custom FlexSubTheme.dialogTheme() '
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
  });
  group('WITH: FlexSubTheme.drawerTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes drawerTheme tests
    // -------------------------------------------------------------------------
    test(
        'Drawer FST10.1: GIVEN a FlexSubTheme.drawerTheme() '
        'EXPECT equal to DrawerThemeData with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      );
      expect(
        FlexSubThemes.drawerTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
        ),
        equals(
            DrawerThemeData(backgroundColor: colorScheme.surfaceContainerLow)),
      );
      expect(
        FlexSubThemes.drawerTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
          radius: 8,
        ),
        equals(DrawerThemeData(
          backgroundColor: colorScheme.surfaceContainerLow,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.horizontal(
              end: Radius.circular(8),
            ),
          ),
          endShape: const RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.horizontal(
              start: Radius.circular(8),
            ),
          ),
        )),
      );
      expect(
        FlexSubThemes.drawerTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ),
        equals(DrawerThemeData(
          backgroundColor: colorScheme.surfaceContainerLow,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.horizontal(
              end: Radius.circular(kDrawerRadius),
            ),
          ),
          endShape: const RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.horizontal(
              start: Radius.circular(kDrawerRadius),
            ),
          ),
        )),
      );
      expect(
        FlexSubThemes.drawerTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
          radius: 7,
        ),
        equals(DrawerThemeData(
          backgroundColor: colorScheme.surfaceContainerLow,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.horizontal(
              end: Radius.circular(7),
            ),
          ),
          endShape: const RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.horizontal(
              start: Radius.circular(7),
            ),
          ),
        )),
      );
    });
  });
  group('WITH: FlexSubTheme.dropdownMenuTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes dropdownMenuTheme tests
    // -------------------------------------------------------------------------
    //
    // The major part of the theme for the DropdownMenu is done via the
    // InputDecoratorTheme and via the MenuTheme. This is mostly here to
    // provide a stub for future individual theming of the the container
    // for the DropdownMenu.
    test(
        'DropdownMenu 11.1: GIVEN a FlexSubTheme.dropdownMenuTheme() '
        'EXPECT equal to DropdownMenuThemeData with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      );
      expect(
        FlexSubThemes.dropdownMenuTheme(
          colorScheme: colorScheme,
        ),
        equals(const DropdownMenuThemeData(menuStyle: MenuStyle())),
      );
      const DropdownMenuThemeData m = DropdownMenuThemeData(
          menuStyle: MenuStyle(
              surfaceTintColor:
                  WidgetStatePropertyAll<Color>(Colors.transparent)));
      expect(
        m.menuStyle!.surfaceTintColor!.resolve(<WidgetState>{}),
        equals(Colors.transparent),
      );
      final DropdownMenuThemeData m2 = DropdownMenuThemeData(
          menuStyle: MenuStyle(
              surfaceTintColor:
                  WidgetStatePropertyAll<Color>(colorScheme.surfaceContainer)));
      expect(
        m2.menuStyle!.surfaceTintColor!.resolve(<WidgetState>{}),
        equals(colorScheme.surfaceContainer),
      );
    });
  });
  group('WITH: FlexSubTheme.elevatedButtonTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes ElevatedButton tests
    // -------------------------------------------------------------------------
    test(
        'ElevatedButton 12.1 M2: GIVEN a default M2 '
        'FlexSubTheme.elevatedButtonTheme() '
        'EXPECT equal to ElevatedButtonThemeData() version with '
        'same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).toString(),
        equalsIgnoringHashCodes(
          ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(40, 40),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
              ), //buttonShape,
              elevation: 1,
            ).copyWith(
              foregroundColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.disabled)) {
                    return colorScheme.primary
                        .blendAlpha(colorScheme.onSurface, 0x66)
                        .withAlpha(0x5E);
                  }
                  return colorScheme.onPrimary;
                },
              ),
              backgroundColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.disabled)) {
                    return colorScheme.primary
                        .blendAlpha(colorScheme.onSurface, 0x66)
                        .withAlpha(0x26);
                  }
                  return colorScheme.primary;
                },
              ),
              overlayColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.hovered)) {
                    return colorScheme.onPrimary.withAlpha(0x0D);
                  }
                  if (states.contains(WidgetState.focused)) {
                    return colorScheme.onPrimary.withAlpha(0x26);
                  }
                  if (states.contains(WidgetState.pressed)) {
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
        'ElevatedButton 12.2 M3: GIVEN a default M3 '
        'FlexSubTheme.elevatedButtonTheme() '
        'EXPECT equal to ElevatedButtonThemeData() version with '
        'defaults', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          const ElevatedButtonThemeData(
            style: ButtonStyle(),
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'ElevatedButton 12.3 M2 secondary: GIVEN a default '
        'FlexSubTheme.elevatedButtonTheme() '
        'with secondary color as base color '
        'EXPECT equal to ElevatedButtonThemeData() version with '
        'same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          useMaterial3: false,
        ).toString(),
        equalsIgnoringHashCodes(
          ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(40, 40),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
              ), //buttonShape,
              elevation: 1,
            ).copyWith(
              foregroundColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.disabled)) {
                    return colorScheme.secondary
                        .blendAlpha(colorScheme.onSurface, 0x66)
                        .withAlpha(0x5E);
                  }
                  return colorScheme.onSecondary;
                },
              ),
              backgroundColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.disabled)) {
                    return colorScheme.secondary
                        .blendAlpha(colorScheme.onSurface, 0x66)
                        .withAlpha(0x26);
                  }
                  return colorScheme.secondary;
                },
              ),
              overlayColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.hovered)) {
                    return colorScheme.onPrimary.withAlpha(0x0D);
                  }
                  if (states.contains(WidgetState.focused)) {
                    return colorScheme.onPrimary.withAlpha(0x26);
                  }
                  if (states.contains(WidgetState.pressed)) {
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
        'ElevatedButton 12.3 M2 secondary-onBase: GIVEN a default '
        'FlexSubTheme.elevatedButtonTheme() '
        'with secondary color as onBase color '
        'EXPECT equal to ElevatedButtonThemeData() version with '
        'same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          onBaseSchemeColor: SchemeColor.secondary,
          useMaterial3: false,
        ).toString(),
        equalsIgnoringHashCodes(
          ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(40, 40),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
              ), //buttonShape,
              elevation: 1,
            ).copyWith(
              foregroundColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.disabled)) {
                    return colorScheme.secondary
                        .blendAlpha(colorScheme.onSurface, 0x66)
                        .withAlpha(0x5E);
                  }
                  return colorScheme.onSecondary;
                },
              ),
              backgroundColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.disabled)) {
                    return colorScheme.primary
                        .blendAlpha(colorScheme.onSurface, 0x66)
                        .withAlpha(0x26);
                  }
                  return colorScheme.primary;
                },
              ),
              overlayColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.hovered)) {
                    return colorScheme.onSecondary.withAlpha(0x0D);
                  }
                  if (states.contains(WidgetState.focused)) {
                    return colorScheme.onSecondary.withAlpha(0x26);
                  }
                  if (states.contains(WidgetState.pressed)) {
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
    test(
        'ElevatedButton 12.4 M2 states: Does '
        'ElevatedButton have right Material 2 states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF42AEE7),
        brightness: Brightness.light,
      );
      // Disabled foreground, default, M2
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).style!.foregroundColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(colorScheme.onSurface.withAlpha(kAlphaDisabled)),
      );
      // Disabled foreground, custom, M2, with tint
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          useTintedDisable: true,
          useMaterial3: false,
        ).style!.foregroundColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(FlexSubThemes.tintedDisable(
            colorScheme.onSurface, colorScheme.secondary)),
      );
      // Selected foreground, M2
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).style!.foregroundColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.onPrimary),
      );
      // Selected foreground, custom color, M2
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          useMaterial3: false,
        ).style!.foregroundColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.onSecondary),
      );
      // Selected foreground, custom colors, M2
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          onBaseSchemeColor: SchemeColor.tertiary,
          useMaterial3: false,
        ).style!.foregroundColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.tertiary),
      );
      // Disabled background, M2, default
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).style!.backgroundColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(colorScheme.onSurface.withAlpha(kAlphaVeryLowDisabled)),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          useTintedDisable: true,
          useMaterial3: false,
        ).style!.backgroundColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(FlexSubThemes.tintedDisable(
                colorScheme.onSurface, colorScheme.secondary)
            .withAlpha(kAlphaVeryLowDisabled)),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).style!.backgroundColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.primary),
      );
      // Overlay color states
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).style!.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(colorScheme.onSecondary.withAlpha(kAlphaHovered)),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          useTintedInteraction: true,
          useMaterial3: false,
        ).style!.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(
          FlexSubThemes.tintedHovered(
              colorScheme.onPrimary, colorScheme.primary, 5.0),
        ),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).style!.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        equals(colorScheme.onSecondary.withAlpha(kAlphaFocused)),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          useTintedInteraction: true,
          useMaterial3: false,
        ).style!.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        equals(FlexSubThemes.tintedFocused(
            colorScheme.onPrimary, colorScheme.primary, 5.0)),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).style!.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(colorScheme.onSecondary.withAlpha(kAlphaPressed)),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          useTintedInteraction: true,
          useMaterial3: false,
        ).style!.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(FlexSubThemes.tintedPressed(
            colorScheme.onPrimary, colorScheme.primary, 5.0)),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).style!.overlayColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(Colors.transparent),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).style!.overlayColor!.resolve(<WidgetState>{}),
        equals(Colors.transparent),
      );
    });
    test(
        'ElevatedButton 12.5 M3-states: Does '
        'ElevatedButton have right Material 3 states', () {
      const ColorScheme colorScheme = ColorScheme.light();
      // Disabled foreground, default, M3
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primary,
          useMaterial3: true,
        ).style!.foregroundColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(colorScheme.onSurface.withOpacity(0.38)),
      );
      // Disabled foreground, tinted M3
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primary,
          useTintedDisable: true,
          useMaterial3: true,
        ).style!.foregroundColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(FlexSubThemes.tintedDisable(
            colorScheme.onSurface, colorScheme.primary)),
      );
      // Disabled foreground, custom, M3
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          useMaterial3: true,
        ).style!.foregroundColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(colorScheme.onSurface.withOpacity(0.38)),
      );
      // Selected foreground, M3
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primary,
          useMaterial3: true,
        ).style!.foregroundColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.primary),
      );
      // Selected foreground, custom color, M3
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          useMaterial3: true,
        ).style!.foregroundColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.secondary),
      );
      // Selected foreground, custom colors, M3
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          onBaseSchemeColor: SchemeColor.tertiary,
          useMaterial3: true,
        ).style!.foregroundColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.secondary),
      );
      // Disabled background, M3
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primary,
          useMaterial3: true,
        ).style!.backgroundColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(colorScheme.onSurface.withOpacity(0.12)),
      );
      // Disabled background, tinted M3
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primary,
          useTintedDisable: true,
          useMaterial3: true,
        ).style!.backgroundColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(FlexSubThemes.tintedDisable(
                colorScheme.onSurface, colorScheme.primary)
            .withAlpha(kAlphaVeryLowDisabled)),
      );
      // Disabled background, M3, only onBase given
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          onBaseSchemeColor: SchemeColor.tertiary,
          useMaterial3: true,
        ).style!.backgroundColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(colorScheme.onSurface.withOpacity(0.12)),
      );
      // Disabled background, tinted M3, only onBase given
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          onBaseSchemeColor: SchemeColor.tertiary,
          useTintedDisable: true,
          useMaterial3: true,
        ).style!.backgroundColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(FlexSubThemes.tintedDisable(
                colorScheme.onSurface, colorScheme.primary)
            .withAlpha(kAlphaVeryLowDisabled)),
      );
      // Default background, M3, only onBase given
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          onBaseSchemeColor: SchemeColor.tertiary,
          useMaterial3: true,
        ).style!.backgroundColor!.resolve(<WidgetState>{}),
        equals(colorScheme.tertiary),
      );
      // Selected background, M3
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primary,
          useMaterial3: true,
        ).style!.backgroundColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.surface),
      );
      // Overlay color states
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primary,
          useMaterial3: true,
        ).style!.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(colorScheme.primary.withOpacity(0.08)),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          useTintedInteraction: true,
          useMaterial3: true,
        ).style!.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(
          FlexSubThemes.tintedHovered(
              colorScheme.surface, colorScheme.primary, 1.5),
        ),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primary,
          useMaterial3: true,
        ).style!.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        equals(colorScheme.primary.withOpacity(0.12)),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          useTintedInteraction: true,
          useMaterial3: true,
        ).style!.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        equals(
          FlexSubThemes.tintedFocused(
              colorScheme.surface, colorScheme.primary, 1.5),
        ),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primary,
          useMaterial3: true,
        ).style!.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(colorScheme.primary.withOpacity(0.12)),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          useTintedInteraction: true,
          useMaterial3: true,
        ).style!.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(
          FlexSubThemes.tintedPressed(
              colorScheme.surface, colorScheme.primary, 1.5),
        ),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primary,
          useMaterial3: true,
        ).style!.overlayColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(null),
      );
      // Elevation states
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primary,
          elevation: 2,
          useMaterial3: true,
        ).style!.elevation!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(0.0),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primary,
          elevation: 2,
          useMaterial3: true,
        ).style!.elevation!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(4.0),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          elevation: 2,
          useMaterial3: true,
        ).style!.elevation!.resolve(<WidgetState>{WidgetState.focused}),
        equals(2.0),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primary,
          elevation: 2,
          useMaterial3: true,
        ).style!.elevation!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(2.0),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primary,
          elevation: 2,
          useMaterial3: true,
        ).style!.elevation!.resolve(<WidgetState>{WidgetState.selected}),
        equals(2.0),
      );
      // Custom shape test
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          radius: 10,
          useMaterial3: true,
        ).style!.shape!.resolve(<WidgetState>{}),
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
        'ElevatedButton 12.6 M2 custom-1: GIVEN a '
        'custom FlexSubTheme.elevatedButtonTheme() '
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
          useMaterial3: false,
        ).toString(),
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
              foregroundColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.disabled)) {
                    return colorScheme.primary
                        .blendAlpha(colorScheme.onSurface, 0x66)
                        .withAlpha(0x5E);
                  }
                  return colorScheme.onPrimary;
                },
              ),
              backgroundColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.disabled)) {
                    return colorScheme.primary
                        .blendAlpha(colorScheme.onSurface, 0x66)
                        .withAlpha(0x26);
                  }
                  return colorScheme.primary;
                },
              ),
              overlayColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.hovered)) {
                    return colorScheme.onPrimary.withAlpha(0x0D);
                  }
                  if (states.contains(WidgetState.focused)) {
                    return colorScheme.onPrimary.withAlpha(0x26);
                  }
                  if (states.contains(WidgetState.pressed)) {
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
        'ElevatedButton 12.7 M2 custom-2: GIVEN a custom '
        'FlexSubTheme.elevatedButtonTheme() '
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
          radius: 12,
          useMaterial3: false,
        ).toString(),
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
              foregroundColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.disabled)) {
                    return colorScheme.tertiary
                        .blendAlpha(colorScheme.onSurface, 0x66)
                        .withAlpha(0x5E);
                  }
                  return colorScheme.secondary;
                },
              ),
              backgroundColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.disabled)) {
                    return colorScheme.tertiary
                        .blendAlpha(colorScheme.onSurface, 0x66)
                        .withAlpha(0x26);
                  }
                  return colorScheme.tertiary;
                },
              ),
              overlayColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.hovered)) {
                    return colorScheme.onTertiary.withAlpha(0x0D);
                  }
                  if (states.contains(WidgetState.focused)) {
                    return colorScheme.onTertiary.withAlpha(0x26);
                  }
                  if (states.contains(WidgetState.pressed)) {
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
        'ElevatedButton 12.8 custom-1-M3: GIVEN a custom '
        'FlexSubTheme.elevatedButtonTheme() '
        'EXPECT equal to ElevatedButtonThemeData() version with '
        'same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          minButtonSize: const Size(50, 50),
          radius: 10,
          useMaterial3: true,
        ).toString(),
        equalsIgnoringHashCodes(
          ElevatedButtonThemeData(
            style: ButtonStyle(
              minimumSize:
                  ButtonStyleButton.allOrNull<Size>(const Size(50, 50)),
              padding: ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(
                  const EdgeInsets.symmetric(horizontal: 8)),
              elevation:
                  WidgetStateProperty.resolveWith((Set<WidgetState> states) {
                if (states.contains(WidgetState.disabled)) {
                  return 0.0;
                }
                if (states.contains(WidgetState.hovered)) {
                  return 4.0;
                }
                if (states.contains(WidgetState.focused)) {
                  return 2.0;
                }
                if (states.contains(WidgetState.pressed)) {
                  return 2.0;
                }
                return 2.0;
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
        'ElevatedButton 12.9 custom-2-M3: GIVEN a custom '
        'FlexSubTheme.elevatedButtonTheme() '
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
              foregroundColor:
                  WidgetStateProperty.resolveWith((Set<WidgetState> states) {
                if (states.contains(WidgetState.disabled)) {
                  return colorScheme.onSurface.withOpacity(0.38);
                }
                return colorScheme.tertiary;
              }),
              backgroundColor:
                  WidgetStateProperty.resolveWith((Set<WidgetState> states) {
                if (states.contains(WidgetState.disabled)) {
                  return colorScheme.onSurface.withOpacity(0.12);
                }
                return colorScheme.secondary;
              }),
              overlayColor:
                  WidgetStateProperty.resolveWith((Set<WidgetState> states) {
                if (states.contains(WidgetState.hovered)) {
                  return colorScheme.tertiary.withOpacity(0.08);
                }
                if (states.contains(WidgetState.focused)) {
                  return colorScheme.tertiary.withOpacity(0.12);
                }
                if (states.contains(WidgetState.pressed)) {
                  return colorScheme.tertiary.withOpacity(0.12);
                }
                return null;
              }),
              minimumSize:
                  ButtonStyleButton.allOrNull<Size>(const Size(55, 55)),
              padding: ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(
                  const EdgeInsets.symmetric(horizontal: 9)),
              elevation:
                  WidgetStateProperty.resolveWith((Set<WidgetState> states) {
                if (states.contains(WidgetState.disabled)) {
                  return 0.0;
                }
                if (states.contains(WidgetState.hovered)) {
                  return 4.0;
                }
                if (states.contains(WidgetState.focused)) {
                  return 2.0;
                }
                if (states.contains(WidgetState.pressed)) {
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
  });
  group('WITH: FlexSubTheme.filledButtonTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes FilledButton tests
    // -------------------------------------------------------------------------
    test(
        'FilledButton FST13.1 M2: GIVEN a default M2 '
        'FlexSubTheme.filledButtonTheme() '
        'EXPECT equal to FilledButtonThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.filledButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).toString(),
        equalsIgnoringHashCodes(
          FilledButtonThemeData(
            style: ButtonStyle(
              minimumSize:
                  ButtonStyleButton.allOrNull<Size>(const Size(40, 40)),
              shape: ButtonStyleButton.allOrNull<OutlinedBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(40),
                  ),
                ),
              ), // buttonShape,
            ),
          ).toString(),
        ),
      );
    });
    test(
        'FilledButton FST13.2 M2-base: GIVEN a custom '
        'FlexSubTheme.filledButtonTheme() '
        'EXPECT equal to FilledButtonThemeData() version with same color', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.filledButtonTheme(
          colorScheme: colorScheme,
          backgroundSchemeColor: SchemeColor.secondary,
          useMaterial3: false,
        ).toString(),
        equalsIgnoringHashCodes(
          FilledButtonThemeData(
            style: ButtonStyle(
              minimumSize:
                  ButtonStyleButton.allOrNull<Size>(const Size(40, 40)),
              shape: ButtonStyleButton.allOrNull<OutlinedBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(40),
                  ),
                ),
              ), // buttonShape,
              backgroundColor: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.disabled)) {
                    return colorScheme.onSurface.withOpacity(0.38);
                  }
                  return colorScheme.secondary;
                },
              ),
              foregroundColor: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.disabled)) {
                    return colorScheme.onSurface.withOpacity(0.38);
                  }
                  return colorScheme.onSecondary;
                },
              ),
              // No custom Overlay unless tinted version is used!
              // Temp design due to:
              // https://github.com/flutter/flutter/issues/118063
              // overlayColor: WidgetStateProperty.resolveWith<Color?>(
              //   (Set<WidgetState> states) {
              //     if (states.contains(WidgetState.hovered)) {
              //       return colorScheme.onSecondary.withOpacity(0.08);
              //     }
              //     if (states.contains(WidgetState.focused)) {
              //       return colorScheme.onSecondary.withOpacity(0.12);
              //     }
              //     if (states.contains(WidgetState.pressed)) {
              //       return colorScheme.onSecondary.withOpacity(0.12);
              //     }
              //     return null;
              //   },
              // ),
            ),
          ).toString(),
        ),
      );
    });
    test(
        'FilledButton FST13.3 M3: GIVEN a default M3 '
        'FlexSubTheme.filledButtonTheme() '
        'EXPECT equal to FilledButtonThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF7142E7),
        brightness: Brightness.light,
      );
      expect(
        FlexSubThemes.filledButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          const FilledButtonThemeData(
            style: ButtonStyle(),
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'FilledButton FST13.4 M2-states: Does FilledButton '
        'have right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF7142E7),
        brightness: Brightness.light,
      );
      final FilledButtonThemeData button = FlexSubThemes.filledButtonTheme(
        colorScheme: colorScheme,
        backgroundSchemeColor: SchemeColor.primary,
        useTintedInteraction: true,
      );
      // Disabled colors
      expect(
        button.style!.backgroundColor!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(colorScheme.onSurface.withOpacity(0.12)),
      );
      expect(
        button.style!.foregroundColor!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(colorScheme.onSurface.withOpacity(0.38)),
      );
      // Default state
      expect(
        button.style!.backgroundColor!.resolve(<WidgetState>{}),
        equals(colorScheme.primary),
      );
      expect(
        button.style!.foregroundColor!.resolve(<WidgetState>{}),
        equals(colorScheme.onPrimary),
      );
      // No custom Overlay unless tinted version is used!
      // Temp design due to: https://github.com/flutter/flutter/issues/118063
      // // Overlay color states
      // expect(
      //   button.style!.overlayColor!
      //       .resolve(<WidgetState>{WidgetState.hovered}),
      //   equals(colorScheme.onPrimary.withOpacity(0.08)),
      // );
      // expect(
      //   button.style!.overlayColor!
      //       .resolve(<WidgetState>{WidgetState.focused}),
      //   equals(colorScheme.onPrimary.withOpacity(0.12)),
      // );
      // expect(
      //   button.style?.overlayColor!
      //       .resolve(<WidgetState>{WidgetState.pressed}),
      //   equals(colorScheme.onPrimary.withOpacity(0.12)),
      // );
      // expect(
      //   button.style!.overlayColor!
      //       .resolve(<WidgetState>{WidgetState.selected}),
      //   equals(null),
      // );
    });
    test(
        'FilledButton FST13.5 M2-tint-states: Does M2 '
        'FilledButton have right tinted material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF7142E7),
        brightness: Brightness.light,
      );
      final FilledButtonThemeData button = FlexSubThemes.filledButtonTheme(
        colorScheme: colorScheme,
        backgroundSchemeColor: SchemeColor.tertiary,
        useTintedDisable: true,
        useTintedInteraction: true,
      );
      final Color overlay = colorScheme.onTertiary;
      final Color tint = colorScheme.tertiary;
      // Disabled foreground/background,
      expect(
        button.style!.backgroundColor!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)
            .withAlpha(kAlphaVeryLowDisabled)),
      );
      expect(
        button.style!.foregroundColor!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)),
      );
      // Default state colors
      expect(
        button.style!.backgroundColor!.resolve(<WidgetState>{}),
        equals(colorScheme.tertiary),
      );
      expect(
        button.style!.foregroundColor!.resolve(<WidgetState>{}),
        equals(colorScheme.onTertiary),
      );
      // Overlay color states
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(FlexSubThemes.tintedHovered(overlay, tint, 5.0)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        equals(FlexSubThemes.tintedFocused(overlay, tint, 5.0)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(FlexSubThemes.tintedPressed(overlay, tint, 5.0)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<WidgetState>{WidgetState.selected}),
        equals(null),
      );
    });
    test(
        'FilledButton FST13.6 M3-states: Does '
        'FilledButton have right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      final FilledButtonThemeData button = FlexSubThemes.filledButtonTheme(
        colorScheme: colorScheme,
        backgroundSchemeColor: SchemeColor.primary,
        radius: 15,
        useMaterial3: true,
      );
      // Disabled colors
      expect(
        button.style!.backgroundColor!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(colorScheme.onSurface.withOpacity(0.12)),
      );
      expect(
        button.style!.foregroundColor!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(colorScheme.onSurface.withOpacity(0.38)),
      );
      // Default state
      expect(
        button.style!.backgroundColor!.resolve(<WidgetState>{}),
        equals(colorScheme.primary),
      );
      expect(
        button.style!.foregroundColor!.resolve(<WidgetState>{}),
        equals(colorScheme.onPrimary),
      );
      // No custom Overlay unless tinted version is used!
      // Temp design due to: https://github.com/flutter/flutter/issues/118063
      // // Overlay color states
      // expect(
      //   button.style!.overlayColor!
      //       .resolve(<WidgetState>{WidgetState.hovered}),
      //   equals(colorScheme.onPrimary.withOpacity(0.08)),
      // );
      // expect(
      //   button.style!.overlayColor!
      //       .resolve(<WidgetState>{WidgetState.focused}),
      //   equals(colorScheme.onPrimary.withOpacity(0.12)),
      // );
      // expect(
      //   button.style!.overlayColor!
      //       .resolve(<WidgetState>{WidgetState.pressed}),
      //   equals(colorScheme.onPrimary.withOpacity(0.12)),
      // );
      // expect(
      //   button.style!.overlayColor!
      //       .resolve(<WidgetState>{WidgetState.selected}),
      //   equals(null),
      // );
      // Custom shape test
      expect(
        button.style!.shape!.resolve(<WidgetState>{}),
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
        'FilledButton FST13.7 M3-custom-tint-states: Does '
        'FilledButton have right material tinted states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      final FilledButtonThemeData button = FlexSubThemes.filledButtonTheme(
        colorScheme: colorScheme,
        backgroundSchemeColor: SchemeColor.tertiary,
        radius: 5,
        useTintedDisable: true,
        useTintedInteraction: true,
      );
      final Color overlay = colorScheme.onTertiary;
      final Color tint = colorScheme.tertiary;
      // Disabled foreground/background,
      expect(
        button.style!.backgroundColor!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)
            .withAlpha(kAlphaVeryLowDisabled)),
      );
      expect(
        button.style!.foregroundColor!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)),
      );
      // Default state colors
      expect(
        button.style!.backgroundColor!.resolve(<WidgetState>{}),
        equals(colorScheme.tertiary),
      );
      expect(
        button.style!.foregroundColor!.resolve(<WidgetState>{}),
        equals(colorScheme.onTertiary),
      );
      // Overlay color states
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(FlexSubThemes.tintedHovered(overlay, tint, 5.0)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        equals(FlexSubThemes.tintedFocused(overlay, tint, 5.0)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(FlexSubThemes.tintedPressed(overlay, tint, 5.0)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<WidgetState>{WidgetState.selected}),
        equals(null),
      );
      // Custom shape test
      expect(
          button.style!.shape!.resolve(<WidgetState>{}),
          equals(
            const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
          ));
    });
    test(
        'FilledButton FST13.8 M3-custom-tint-states: Does '
        'FilledButton have right material tinted states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.dark,
      );
      final FilledButtonThemeData button = FlexSubThemes.filledButtonTheme(
        colorScheme: colorScheme,
        backgroundSchemeColor: SchemeColor.tertiary,
        radius: 5,
        useTintedDisable: true,
        useTintedInteraction: true,
      );
      final Color overlay = colorScheme.onTertiary;
      final Color tint = colorScheme.tertiary;
      // Disabled foreground/background,
      expect(
        button.style!.backgroundColor!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)
            .withAlpha(kAlphaVeryLowDisabled)),
      );
      expect(
        button.style!.foregroundColor!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)),
      );
      // Default state colors
      expect(
        button.style!.backgroundColor!.resolve(<WidgetState>{}),
        equals(colorScheme.tertiary),
      );
      expect(
        button.style!.foregroundColor!.resolve(<WidgetState>{}),
        equals(colorScheme.onTertiary),
      );
      // Overlay color states
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(FlexSubThemes.tintedHovered(overlay, tint, 4.0)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        equals(FlexSubThemes.tintedFocused(overlay, tint, 4.0)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(FlexSubThemes.tintedPressed(overlay, tint, 4.0)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<WidgetState>{WidgetState.selected}),
        equals(null),
      );
      // Custom shape test
      expect(
          button.style!.shape!.resolve(<WidgetState>{}),
          equals(
            const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
          ));
    });
    test(
        'FilledButton FST13.9 M3-custom-disable-states: Does '
        'FilledButton have right material disabled when tinted disabled '
        'used on default null color', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.dark,
      );
      final FilledButtonThemeData button = FlexSubThemes.filledButtonTheme(
        colorScheme: colorScheme,
        useTintedDisable: true,
      );
      final Color tint = colorScheme.primary;
      // Disabled foreground/background,
      expect(
        button.style!.backgroundColor!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)
            .withAlpha(kAlphaVeryLowDisabled)),
      );
      expect(
        button.style!.foregroundColor!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)),
      );
    });
  });
  group('WITH: FlexSubTheme.floatingActionButtonTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes FloatingActionButton tests
    // -------------------------------------------------------------------------
    test(
        'FAB FST14.1: GIVEN a default '
        'FlexSubTheme.floatingActionButtonTheme() '
        'EXPECT equal to FloatingActionButtonThemeData() version '
        'with same values', () {
      expect(
        FlexSubThemes.floatingActionButtonTheme(
          colorScheme: const ColorScheme.light(),
        ),
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
        'FST14.2: GIVEN a custom FlexSubTheme.floatingActionButtonTheme() '
        'EXPECT equal to FloatingActionButtonThemeData() version '
        'with same values', () {
      expect(
        FlexSubThemes.floatingActionButtonTheme(
          colorScheme: const ColorScheme.light(),
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
        'FAB FST14.3: GIVEN a circular '
        'FlexSubTheme.floatingActionButtonTheme() '
        'EXPECT equal to FloatingActionButtonThemeData() version '
        'with same Shape', () {
      expect(
        FlexSubThemes.floatingActionButtonTheme(
          colorScheme: const ColorScheme.light(),
          radius: 30,
          alwaysCircular: true,
        ),
        equals(
          const FloatingActionButtonThemeData(shape: StadiumBorder()),
        ),
      );
    });
    test(
        'FAB FST14.4: GIVEN a custom FlexSubTheme.floatingActionButtonTheme() '
        'EXPECT equal to FloatingActionButtonThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.floatingActionButtonTheme(
          colorScheme: colorScheme,
          radius: 30,
          backgroundSchemeColor: SchemeColor.primaryContainer,
        ),
        equals(
          FloatingActionButtonThemeData(
            backgroundColor: colorScheme.primaryContainer,
            foregroundColor: colorScheme.onPrimaryContainer,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
          ),
        ),
      );
    });
    test(
        'FAB FST14.5: GIVEN a custom FlexSubTheme.floatingActionButtonTheme() '
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
        'FAB FST14.6: GIVEN a null shape '
        'FlexSubTheme.floatingActionButtonTheme() '
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
        'FST14.7: GIVEN a null shape FlexSubTheme.floatingActionButtonTheme() '
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
        'FAB FST14.8: GIVEN a custom FlexSubTheme.floatingActionButtonTheme() '
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
    test(
        'FAB FST14.9: GIVEN a custom FlexSubTheme.floatingActionButtonTheme() '
        'EXPECT equal to FloatingActionButtonThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.floatingActionButtonTheme(
          colorScheme: colorScheme,
          backgroundSchemeColor: SchemeColor.onPrimary,
          foregroundSchemeColor: SchemeColor.secondary,
          radius: 24,
          useTintedInteraction: true,
        ),
        equals(
          FloatingActionButtonThemeData(
            backgroundColor: colorScheme.onPrimary,
            foregroundColor: colorScheme.secondary,
            focusColor: const Color(0x38b2f3ed),
            hoverColor: const Color(0x22b2f3ed),
            splashColor: const Color(0x20a6f1ea),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(24),
              ),
            ),
          ),
        ),
      );
    });
  });
  group('WITH: FlexSubTheme.iconButtonTheme ', () {
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
        equals(FlexSubThemes.tintedDisable(
            colorScheme.onSurface, colorScheme.primary)),
      );
      // Overlay color states
      expect(
        b.style!.overlayColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.pressed}),
        equals(FlexSubThemes.tintedPressed(
            colorScheme.onPrimary, colorScheme.primary, 5.0)),
      );
      expect(
        b.style!.overlayColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.hovered}),
        equals(FlexSubThemes.tintedHovered(
            colorScheme.onPrimary, colorScheme.primary, 5.0)),
      );
      expect(
        b.style!.overlayColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.focused}),
        equals(FlexSubThemes.tintedFocused(
            colorScheme.onPrimary, colorScheme.primary, 5.0)),
      );
      expect(
        b.style!.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(FlexSubThemes.tintedPressed(
            colorScheme.onPrimary, colorScheme.primary, 5.0)),
      );
      expect(
        b.style!.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(FlexSubThemes.tintedHovered(
            colorScheme.onPrimary, colorScheme.primary, 5.0)),
      );
      expect(
        b.style!.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        equals(FlexSubThemes.tintedFocused(
            colorScheme.onPrimary, colorScheme.primary, 5.0)),
      );
      expect(
        b.style!.overlayColor!.resolve(<WidgetState>{}),
        equals(Colors.transparent),
      );
    });
  });
  group('WITH: FlexSubThemes.inputDecorationTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes InputDecorator tests
    // -------------------------------------------------------------------------
    test(
        'InputDecoration FST16.1-M2 light: GIVEN a M2 '
        'FlexSubThemes.inputDecorationTheme(tintedDisabled: true) '
        'EXPECT equal to InputDecorationTheme() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      // Tinted disabled colors
      final Color tintDisabledColor = FlexSubThemes.tintedDisable(
          colorScheme.onSurface, colorScheme.primary);

      const bool useM3 = false;
      const bool tintDisable = true;
      const bool tintInteract = true;
      const double? radius = null;
      const double unfocusedWidth = 1.0;
      const double focusedWidth = 2.0;
      final Color borderColor = colorScheme.primary;
      final Color enabledBorderColor = colorScheme.outline;
      final Color enabledHoveredBorderColor = colorScheme.primary;
      const double effectiveRadius = radius ?? kInputDecoratorRadius;
      const BorderRadius effectiveUnderlineBorder = BorderRadius.only(
        topLeft: Radius.circular(effectiveRadius),
        topRight: Radius.circular(effectiveRadius),
      );
      const int effectiveAlpha = kFillColorAlphaLight;
      final Color usedFillColor = Color.alphaBlend(
          colorScheme.primary.withAlpha(effectiveAlpha), colorScheme.surface);
      final Color usedHover =
          ThemeData.estimateBrightnessForColor(usedFillColor) ==
                  Brightness.light
              ? usedFillColor.darken(kInputDecoratorLightBgDarken)
              : usedFillColor.lighten(kInputDecoratorDarkBgLighten);

      expect(
        FlexSubThemes.inputDecorationTheme(
          colorScheme: colorScheme,
          tintedDisabled: tintDisable,
          tintedInteractions: tintInteract,
          useMaterial3: useM3,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          InputDecorationTheme(
            labelStyle:
                WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.error)) {
                if (states.contains(WidgetState.focused)) {
                  return TextStyle(color: colorScheme.error);
                }
                if (states.contains(WidgetState.hovered)) {
                  return TextStyle(color: colorScheme.onErrorContainer);
                }
                return TextStyle(color: colorScheme.error);
              }
              if (states.contains(WidgetState.focused)) {
                return TextStyle(color: colorScheme.primary);
              }
              if (states.contains(WidgetState.hovered)) {
                return TextStyle(color: colorScheme.onSurfaceVariant);
              }
              if (states.contains(WidgetState.disabled)) {
                return TextStyle(
                  color: tintDisabledColor,
                );
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            floatingLabelStyle:
                WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.error)) {
                if (states.contains(WidgetState.focused)) {
                  return TextStyle(color: colorScheme.error);
                }
                if (states.contains(WidgetState.hovered)) {
                  return TextStyle(
                    color: colorScheme.error.withAlpha(kEnabledBorderAlpha),
                  );
                }
                return TextStyle(color: colorScheme.error);
              }
              if (states.contains(WidgetState.focused)) {
                return TextStyle(color: colorScheme.primary);
              }
              if (states.contains(WidgetState.hovered)) {
                return TextStyle(color: colorScheme.onSurfaceVariant);
              }
              if (states.contains(WidgetState.disabled)) {
                return TextStyle(
                  color: tintDisabledColor,
                );
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            helperStyle:
                WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return TextStyle(
                  color: tintDisabledColor,
                );
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            hintStyle:
                WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return TextStyle(color: tintDisabledColor);
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            iconColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return tintDisabledColor;
              }
              if (states.contains(WidgetState.focused)) {
                return colorScheme.primary;
              }
              return Colors.black45;
            }),
            prefixIconColor:
                WidgetStateColor.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return tintDisabledColor;
              }
              if (states.contains(WidgetState.focused)) {
                return colorScheme.primary;
              }
              return Colors.black45;
            }),
            suffixIconColor:
                WidgetStateColor.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.error)) {
                return colorScheme.error;
              }
              if (states.contains(WidgetState.disabled)) {
                return tintDisabledColor;
              }
              if (states.contains(WidgetState.focused)) {
                return colorScheme.primary;
              }
              return Colors.black45;
            }),
            filled: false,
            fillColor: usedFillColor,
            hoverColor: usedHover,
            border: MaterialStateUnderlineInputBorder.resolveWith(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.disabled)) {
                  return UnderlineInputBorder(
                    borderRadius: effectiveUnderlineBorder,
                    borderSide: BorderSide(
                      color: tintDisabledColor.withAlpha(kAlphaLowDisabled),
                      width: unfocusedWidth,
                    ),
                  );
                }
                if (states.contains(WidgetState.error)) {
                  if (states.contains(WidgetState.focused)) {
                    return UnderlineInputBorder(
                      borderRadius: effectiveUnderlineBorder,
                      borderSide: BorderSide(
                        color: colorScheme.error,
                        width: focusedWidth,
                      ),
                    );
                  }
                  if (states.contains(WidgetState.hovered)) {
                    return UnderlineInputBorder(
                      borderRadius: effectiveUnderlineBorder,
                      borderSide: BorderSide(
                        color: colorScheme.error,
                        width: unfocusedWidth,
                      ),
                    );
                  }
                  return UnderlineInputBorder(
                    borderRadius: effectiveUnderlineBorder,
                    borderSide: BorderSide(
                      color: colorScheme.error.withAlpha(kEnabledBorderAlpha),
                      width: unfocusedWidth,
                    ),
                  );
                }
                if (states.contains(WidgetState.focused)) {
                  return UnderlineInputBorder(
                    borderRadius: effectiveUnderlineBorder,
                    borderSide: BorderSide(
                      color: borderColor,
                      width: focusedWidth,
                    ),
                  );
                }
                if (states.contains(WidgetState.hovered)) {
                  return UnderlineInputBorder(
                    borderRadius: effectiveUnderlineBorder,
                    borderSide: BorderSide(
                      color: enabledHoveredBorderColor,
                      width: unfocusedWidth,
                    ),
                  );
                }
                return UnderlineInputBorder(
                  borderRadius: effectiveUnderlineBorder,
                  borderSide: BorderSide(
                    color: enabledBorderColor,
                    width: unfocusedWidth,
                  ),
                );
              },
            ),
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'InputDecoration FST16.1-M3 light: GIVEN a M3 '
        'FlexSubThemes.inputDecorationTheme(tintedDisabled: true, filled) '
        'EXPECT equal to InputDecorationTheme() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      // Tinted disabled colors
      final Color tintDisabledColor = FlexSubThemes.tintedDisable(
          colorScheme.onSurface, colorScheme.primary);

      const bool useM3 = true;
      const bool tintDisable = true;
      const bool tintInteract = true;
      const bool isFilled = true;
      const double? radius = null;
      const double unfocusedWidth = 1.0;
      const double focusedWidth = 2.0;
      final Color borderColor = colorScheme.primary;
      final Color enabledBorderColor = colorScheme.onSurfaceVariant;
      final Color enabledHoveredBorderColor = colorScheme.primary;
      const double effectiveRadius = radius ?? kInputDecoratorM3Radius;
      const BorderRadius effectiveUnderlineBorder = BorderRadius.only(
        topLeft: Radius.circular(effectiveRadius),
        topRight: Radius.circular(effectiveRadius),
      );
      const int effectiveAlpha = 0xFF;
      final Color usedFillColor = Color.alphaBlend(
          colorScheme.surfaceContainerHighest.withAlpha(effectiveAlpha),
          colorScheme.surface);
      final Color usedHover =
          ThemeData.estimateBrightnessForColor(usedFillColor) ==
                  Brightness.light
              ? usedFillColor.darken(kInputDecoratorLightBgDarken)
              : usedFillColor.lighten(kInputDecoratorDarkBgLighten);

      final InputDecorationTheme m = FlexSubThemes.inputDecorationTheme(
        colorScheme: colorScheme,
        tintedDisabled: tintDisable,
        tintedInteractions: tintInteract,
        filled: isFilled,
        useMaterial3: useM3,
      );
      expect(
        m.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          InputDecorationTheme(
            labelStyle:
                WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.error)) {
                if (states.contains(WidgetState.focused)) {
                  return TextStyle(color: colorScheme.error);
                }
                if (states.contains(WidgetState.hovered)) {
                  return TextStyle(color: colorScheme.onErrorContainer);
                }
                return TextStyle(color: colorScheme.error);
              }
              if (states.contains(WidgetState.focused)) {
                return TextStyle(color: colorScheme.primary);
              }
              if (states.contains(WidgetState.hovered)) {
                return TextStyle(color: colorScheme.onSurfaceVariant);
              }
              if (states.contains(WidgetState.disabled)) {
                return TextStyle(
                  color: tintDisabledColor,
                );
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            floatingLabelStyle:
                WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.error)) {
                if (states.contains(WidgetState.focused)) {
                  return TextStyle(color: colorScheme.error);
                }
                if (states.contains(WidgetState.hovered)) {
                  return TextStyle(
                    color: colorScheme.error.withAlpha(kEnabledBorderAlpha),
                  );
                }
                return TextStyle(color: colorScheme.error);
              }
              if (states.contains(WidgetState.focused)) {
                return TextStyle(color: colorScheme.primary);
              }
              if (states.contains(WidgetState.hovered)) {
                return TextStyle(color: colorScheme.onSurfaceVariant);
              }
              if (states.contains(WidgetState.disabled)) {
                return TextStyle(
                  color: tintDisabledColor,
                );
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            helperStyle:
                WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return TextStyle(
                  color: tintDisabledColor,
                );
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            hintStyle:
                WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return TextStyle(color: tintDisabledColor);
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            iconColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return tintDisabledColor;
              }
              if (states.contains(WidgetState.focused)) {
                return colorScheme.onSurfaceVariant;
              }
              return colorScheme.onSurfaceVariant;
            }),
            prefixIconColor:
                WidgetStateColor.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return tintDisabledColor;
              }
              if (states.contains(WidgetState.focused)) {
                return colorScheme.onSurfaceVariant;
              }
              return colorScheme.onSurfaceVariant;
            }),
            suffixIconColor:
                WidgetStateColor.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.error)) {
                return colorScheme.error;
              }
              if (states.contains(WidgetState.disabled)) {
                return tintDisabledColor;
              }
              if (states.contains(WidgetState.focused)) {
                return colorScheme.onSurfaceVariant;
              }
              return colorScheme.onSurfaceVariant;
            }),
            filled: isFilled,
            fillColor: usedFillColor,
            hoverColor: usedHover,
            border: MaterialStateUnderlineInputBorder.resolveWith(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.disabled)) {
                  return UnderlineInputBorder(
                    borderRadius: effectiveUnderlineBorder,
                    borderSide: BorderSide(
                      color: tintDisabledColor.withAlpha(kAlphaLowDisabled),
                      width: unfocusedWidth,
                    ),
                  );
                }
                if (states.contains(WidgetState.error)) {
                  if (states.contains(WidgetState.focused)) {
                    return UnderlineInputBorder(
                      borderRadius: effectiveUnderlineBorder,
                      borderSide: BorderSide(
                        color: colorScheme.error,
                        width: focusedWidth,
                      ),
                    );
                  }
                  if (states.contains(WidgetState.hovered)) {
                    return UnderlineInputBorder(
                      borderRadius: effectiveUnderlineBorder,
                      borderSide: BorderSide(
                        color: colorScheme.error,
                        width: unfocusedWidth,
                      ),
                    );
                  }
                  return UnderlineInputBorder(
                    borderRadius: effectiveUnderlineBorder,
                    borderSide: BorderSide(
                      color: colorScheme.error.withAlpha(kEnabledBorderAlpha),
                      width: unfocusedWidth,
                    ),
                  );
                }
                if (states.contains(WidgetState.focused)) {
                  return UnderlineInputBorder(
                    borderRadius: effectiveUnderlineBorder,
                    borderSide: BorderSide(
                      color: borderColor,
                      width: focusedWidth,
                    ),
                  );
                }
                if (states.contains(WidgetState.hovered)) {
                  return UnderlineInputBorder(
                    borderRadius: effectiveUnderlineBorder,
                    borderSide: BorderSide(
                      color: enabledHoveredBorderColor,
                      width: unfocusedWidth,
                    ),
                  );
                }
                return UnderlineInputBorder(
                  borderRadius: effectiveUnderlineBorder,
                  borderSide: BorderSide(
                    color: enabledBorderColor,
                    width: unfocusedWidth,
                  ),
                );
              },
            ),
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'InputDecoration FST16.2 light: GIVEN a M2 '
        'FlexSubTheme.inputDecorationTheme( '
        'unfocusedBorderIsColored: false, tintedDisabled: true) '
        'EXPECT equal to InputDecorationTheme() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      // Tinted disabled colors
      final Color tintDisabledColor = FlexSubThemes.tintedDisable(
          colorScheme.onSurface, colorScheme.primary);

      const bool useM3 = false;
      const bool tintDisable = true;
      const bool tintInteract = true;
      const double? radius = null;
      const double unfocusedWidth = 1.0;
      const double focusedWidth = 2.0;
      const bool unfocusedBorderIsColored = false;
      final Color borderColor = colorScheme.primary;
      final Color enabledBorderColor = colorScheme.outline;
      final Color enabledHoveredBorderColor = colorScheme.primary;
      const double effectiveRadius = radius ?? kInputDecoratorRadius;
      const BorderRadius effectiveUnderlineBorder = BorderRadius.only(
        topLeft: Radius.circular(effectiveRadius),
        topRight: Radius.circular(effectiveRadius),
      );
      const int effectiveAlpha = kFillColorAlphaLight;
      final Color usedFillColor = Color.alphaBlend(
          colorScheme.primary.withAlpha(effectiveAlpha), colorScheme.surface);
      final Color usedHover =
          ThemeData.estimateBrightnessForColor(usedFillColor) ==
                  Brightness.light
              ? usedFillColor.darken(kInputDecoratorLightBgDarken)
              : usedFillColor.lighten(kInputDecoratorDarkBgLighten);

      expect(
        FlexSubThemes.inputDecorationTheme(
          colorScheme: colorScheme,
          unfocusedBorderIsColored: unfocusedBorderIsColored,
          tintedDisabled: tintDisable,
          tintedInteractions: tintInteract,
          useMaterial3: useM3,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          InputDecorationTheme(
            labelStyle:
                WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.error)) {
                if (states.contains(WidgetState.focused)) {
                  return TextStyle(color: colorScheme.error);
                }
                if (states.contains(WidgetState.hovered)) {
                  return TextStyle(color: colorScheme.onErrorContainer);
                }
                return TextStyle(color: colorScheme.error);
              }
              if (states.contains(WidgetState.focused)) {
                return TextStyle(color: colorScheme.primary);
              }
              if (states.contains(WidgetState.hovered)) {
                return TextStyle(color: colorScheme.onSurfaceVariant);
              }
              if (states.contains(WidgetState.disabled)) {
                return TextStyle(
                  color: tintDisabledColor,
                );
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            floatingLabelStyle:
                WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.error)) {
                if (states.contains(WidgetState.focused)) {
                  return TextStyle(color: colorScheme.error);
                }
                if (states.contains(WidgetState.hovered)) {
                  return TextStyle(
                    color: colorScheme.error.withAlpha(kEnabledBorderAlpha),
                  );
                }
                return TextStyle(color: colorScheme.error);
              }
              if (states.contains(WidgetState.focused)) {
                return TextStyle(color: colorScheme.primary);
              }
              if (states.contains(WidgetState.hovered)) {
                return TextStyle(color: colorScheme.onSurfaceVariant);
              }
              if (states.contains(WidgetState.disabled)) {
                return TextStyle(
                  color: tintDisabledColor,
                );
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            helperStyle:
                WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return TextStyle(
                  color: tintDisabledColor,
                );
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            hintStyle:
                WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return TextStyle(color: tintDisabledColor);
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            iconColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return tintDisabledColor;
              }
              if (states.contains(WidgetState.focused)) {
                return colorScheme.primary;
              }
              return Colors.black45;
            }),
            prefixIconColor:
                WidgetStateColor.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return tintDisabledColor;
              }
              if (states.contains(WidgetState.focused)) {
                return colorScheme.primary;
              }
              return Colors.black45;
            }),
            suffixIconColor:
                WidgetStateColor.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.error)) {
                return colorScheme.error;
              }
              if (states.contains(WidgetState.disabled)) {
                return tintDisabledColor;
              }
              if (states.contains(WidgetState.focused)) {
                return colorScheme.primary;
              }
              return Colors.black45;
            }),
            filled: false,
            fillColor: usedFillColor,
            hoverColor: usedHover,
            border: MaterialStateUnderlineInputBorder.resolveWith(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.disabled)) {
                  return UnderlineInputBorder(
                    borderRadius: effectiveUnderlineBorder,
                    borderSide: BorderSide(
                      color: tintDisabledColor.withAlpha(kAlphaLowDisabled),
                      width: unfocusedWidth,
                    ),
                  );
                }
                if (states.contains(WidgetState.error)) {
                  if (states.contains(WidgetState.focused)) {
                    return UnderlineInputBorder(
                      borderRadius: effectiveUnderlineBorder,
                      borderSide: BorderSide(
                        color: colorScheme.error,
                        width: focusedWidth,
                      ),
                    );
                  }
                  if (states.contains(WidgetState.hovered)) {
                    return UnderlineInputBorder(
                      borderRadius: effectiveUnderlineBorder,
                      borderSide: BorderSide(
                        color: colorScheme.error,
                        width: unfocusedWidth,
                      ),
                    );
                  }
                  return UnderlineInputBorder(
                    borderRadius: effectiveUnderlineBorder,
                    borderSide: BorderSide(
                      color: colorScheme.error.withAlpha(kEnabledBorderAlpha),
                      width: unfocusedWidth,
                    ),
                  );
                }
                if (states.contains(WidgetState.focused)) {
                  return UnderlineInputBorder(
                    borderRadius: effectiveUnderlineBorder,
                    borderSide: BorderSide(
                      color: borderColor,
                      width: focusedWidth,
                    ),
                  );
                }
                if (states.contains(WidgetState.hovered)) {
                  return UnderlineInputBorder(
                    borderRadius: effectiveUnderlineBorder,
                    borderSide: BorderSide(
                      color: enabledHoveredBorderColor,
                      width: unfocusedWidth,
                    ),
                  );
                }
                return UnderlineInputBorder(
                  borderRadius: effectiveUnderlineBorder,
                  borderSide: BorderSide(
                    color: enabledBorderColor,
                    width: unfocusedWidth,
                  ),
                );
              },
            ),
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'InputDecoration FST16.3 dark: GIVEN a M2 '
        'FlexSubTheme.inputDecorationTheme(tintedDisabled: true) '
        'EXPECT equal to InputDecorationTheme() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.dark,
      );
      // Tinted disabled colors
      final Color tintDisabledColor = FlexSubThemes.tintedDisable(
          colorScheme.onSurface, colorScheme.primary);

      const bool useM3 = false;
      const bool tintDisable = true;
      const bool tintInteract = true;
      const double? radius = null;
      const double unfocusedWidth = 1.0;
      const double focusedWidth = 2.0;
      const bool unfocusedBorderIsColored = true;
      final Color borderColor = colorScheme.primary;
      final Color enabledBorderColor = colorScheme.outline;
      final Color enabledHoveredBorderColor = colorScheme.primary;
      const double effectiveRadius = radius ?? kInputDecoratorRadius;
      const BorderRadius effectiveUnderlineBorder = BorderRadius.only(
        topLeft: Radius.circular(effectiveRadius),
        topRight: Radius.circular(effectiveRadius),
      );
      const int effectiveAlpha = kFillColorAlphaDark;
      final Color usedFillColor = Color.alphaBlend(
          colorScheme.primary.withAlpha(effectiveAlpha), colorScheme.surface);
      final Color usedHover =
          ThemeData.estimateBrightnessForColor(usedFillColor) ==
                  Brightness.light
              ? usedFillColor.darken(kInputDecoratorLightBgDarken)
              : usedFillColor.lighten(kInputDecoratorDarkBgLighten);

      expect(
        FlexSubThemes.inputDecorationTheme(
          colorScheme: colorScheme,
          unfocusedBorderIsColored: unfocusedBorderIsColored,
          tintedDisabled: tintDisable,
          tintedInteractions: tintInteract,
          useMaterial3: useM3,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          InputDecorationTheme(
            labelStyle:
                WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.error)) {
                if (states.contains(WidgetState.focused)) {
                  return TextStyle(color: colorScheme.error);
                }
                if (states.contains(WidgetState.hovered)) {
                  return TextStyle(color: colorScheme.onErrorContainer);
                }
                return TextStyle(color: colorScheme.error);
              }
              if (states.contains(WidgetState.focused)) {
                return TextStyle(color: colorScheme.primary);
              }
              if (states.contains(WidgetState.hovered)) {
                return TextStyle(color: colorScheme.onSurfaceVariant);
              }
              if (states.contains(WidgetState.disabled)) {
                return TextStyle(
                  color: tintDisabledColor,
                );
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            floatingLabelStyle:
                WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.error)) {
                if (states.contains(WidgetState.focused)) {
                  return TextStyle(color: colorScheme.error);
                }
                if (states.contains(WidgetState.hovered)) {
                  return TextStyle(
                    color: colorScheme.error.withAlpha(kEnabledBorderAlpha),
                  );
                }
                return TextStyle(color: colorScheme.error);
              }
              if (states.contains(WidgetState.focused)) {
                return TextStyle(color: colorScheme.primary);
              }
              if (states.contains(WidgetState.hovered)) {
                return TextStyle(color: colorScheme.onSurfaceVariant);
              }
              if (states.contains(WidgetState.disabled)) {
                return TextStyle(
                  color: tintDisabledColor,
                );
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            helperStyle:
                WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return TextStyle(
                  color: tintDisabledColor,
                );
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            hintStyle:
                WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return TextStyle(color: tintDisabledColor);
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            iconColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return tintDisabledColor;
              }
              if (states.contains(WidgetState.focused)) {
                return colorScheme.primary;
              }
              return Colors.white70;
            }),
            prefixIconColor:
                WidgetStateColor.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return tintDisabledColor;
              }
              if (states.contains(WidgetState.focused)) {
                return colorScheme.primary;
              }
              return Colors.white70;
            }),
            suffixIconColor:
                WidgetStateColor.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.error)) {
                return colorScheme.error;
              }
              if (states.contains(WidgetState.disabled)) {
                return tintDisabledColor;
              }
              if (states.contains(WidgetState.focused)) {
                return colorScheme.primary;
              }
              return Colors.white70;
            }),
            filled: false,
            fillColor: usedFillColor,
            hoverColor: usedHover,
            border: MaterialStateUnderlineInputBorder.resolveWith(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.disabled)) {
                  return UnderlineInputBorder(
                    borderRadius: effectiveUnderlineBorder,
                    borderSide: BorderSide(
                      color: tintDisabledColor.withAlpha(kAlphaLowDisabled),
                      width: unfocusedWidth,
                    ),
                  );
                }
                if (states.contains(WidgetState.error)) {
                  if (states.contains(WidgetState.focused)) {
                    return UnderlineInputBorder(
                      borderRadius: effectiveUnderlineBorder,
                      borderSide: BorderSide(
                        color: colorScheme.error,
                        width: focusedWidth,
                      ),
                    );
                  }
                  if (states.contains(WidgetState.hovered)) {
                    return UnderlineInputBorder(
                      borderRadius: effectiveUnderlineBorder,
                      borderSide: BorderSide(
                        color: colorScheme.error,
                        width: unfocusedWidth,
                      ),
                    );
                  }
                  return UnderlineInputBorder(
                    borderRadius: effectiveUnderlineBorder,
                    borderSide: BorderSide(
                      color: colorScheme.error.withAlpha(kEnabledBorderAlpha),
                      width: unfocusedWidth,
                    ),
                  );
                }
                if (states.contains(WidgetState.focused)) {
                  return UnderlineInputBorder(
                    borderRadius: effectiveUnderlineBorder,
                    borderSide: BorderSide(
                      color: borderColor,
                      width: focusedWidth,
                    ),
                  );
                }
                if (states.contains(WidgetState.hovered)) {
                  return UnderlineInputBorder(
                    borderRadius: effectiveUnderlineBorder,
                    borderSide: BorderSide(
                      color: enabledHoveredBorderColor,
                      width: unfocusedWidth,
                    ),
                  );
                }
                return UnderlineInputBorder(
                  borderRadius: effectiveUnderlineBorder,
                  borderSide: BorderSide(
                    color: enabledBorderColor,
                    width: unfocusedWidth,
                  ),
                );
              },
            ),
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'InputDecoration FST16.4 dark: GIVEN a default M2 '
        'FlexSubTheme.inputDecorationTheme( '
        'unfocusedBorderIsColored: false, tintedDisabled: true) '
        'EXPECT equal to InputDecorationTheme() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.dark,
      );
      // Tinted disabled colors
      final Color tintDisabledColor = FlexSubThemes.tintedDisable(
          colorScheme.onSurface, colorScheme.primary);

      const bool useM3 = false;
      const bool tintDisable = true;
      const bool tintInteract = true;
      const double? radius = null;
      const double unfocusedWidth = 1.0;
      const double focusedWidth = 2.0;
      const bool unfocusedBorderIsColored = false;
      final Color borderColor = colorScheme.primary;
      final Color enabledBorderColor = colorScheme.outline;
      final Color enabledHoveredBorderColor = colorScheme.primary;
      const double effectiveRadius = radius ?? kInputDecoratorRadius;
      const BorderRadius effectiveUnderlineBorder = BorderRadius.only(
        topLeft: Radius.circular(effectiveRadius),
        topRight: Radius.circular(effectiveRadius),
      );
      const int effectiveAlpha = kFillColorAlphaDark;
      final Color usedFillColor = Color.alphaBlend(
          colorScheme.primary.withAlpha(effectiveAlpha), colorScheme.surface);
      final Color usedHover =
          ThemeData.estimateBrightnessForColor(usedFillColor) ==
                  Brightness.light
              ? usedFillColor.darken(kInputDecoratorLightBgDarken)
              : usedFillColor.lighten(kInputDecoratorDarkBgLighten);

      expect(
        FlexSubThemes.inputDecorationTheme(
          colorScheme: colorScheme,
          unfocusedBorderIsColored: unfocusedBorderIsColored,
          tintedDisabled: tintDisable,
          tintedInteractions: tintInteract,
          useMaterial3: useM3,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          InputDecorationTheme(
            labelStyle:
                WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.error)) {
                if (states.contains(WidgetState.focused)) {
                  return TextStyle(color: colorScheme.error);
                }
                if (states.contains(WidgetState.hovered)) {
                  return TextStyle(color: colorScheme.onErrorContainer);
                }
                return TextStyle(color: colorScheme.error);
              }
              if (states.contains(WidgetState.focused)) {
                return TextStyle(color: colorScheme.primary);
              }
              if (states.contains(WidgetState.hovered)) {
                return TextStyle(color: colorScheme.onSurfaceVariant);
              }
              if (states.contains(WidgetState.disabled)) {
                return TextStyle(
                  color: tintDisabledColor,
                );
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            floatingLabelStyle:
                WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.error)) {
                if (states.contains(WidgetState.focused)) {
                  return TextStyle(color: colorScheme.error);
                }
                if (states.contains(WidgetState.hovered)) {
                  return TextStyle(
                    color: colorScheme.error.withAlpha(kEnabledBorderAlpha),
                  );
                }
                return TextStyle(color: colorScheme.error);
              }
              if (states.contains(WidgetState.focused)) {
                return TextStyle(color: colorScheme.primary);
              }
              if (states.contains(WidgetState.hovered)) {
                return TextStyle(color: colorScheme.onSurfaceVariant);
              }
              if (states.contains(WidgetState.disabled)) {
                return TextStyle(
                  color: tintDisabledColor,
                );
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            helperStyle:
                WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return TextStyle(
                  color: tintDisabledColor,
                );
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            hintStyle:
                WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return TextStyle(color: tintDisabledColor);
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            iconColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return tintDisabledColor;
              }
              if (states.contains(WidgetState.focused)) {
                return colorScheme.primary;
              }
              return Colors.white70;
            }),
            prefixIconColor:
                WidgetStateColor.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return tintDisabledColor;
              }
              if (states.contains(WidgetState.focused)) {
                return colorScheme.primary;
              }
              return Colors.white70;
            }),
            suffixIconColor:
                WidgetStateColor.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.error)) {
                return colorScheme.error;
              }
              if (states.contains(WidgetState.disabled)) {
                return tintDisabledColor;
              }
              if (states.contains(WidgetState.focused)) {
                return colorScheme.primary;
              }
              return Colors.white70;
            }),
            filled: false,
            fillColor: usedFillColor,
            hoverColor: usedHover,
            border: MaterialStateUnderlineInputBorder.resolveWith(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.disabled)) {
                  return UnderlineInputBorder(
                    borderRadius: effectiveUnderlineBorder,
                    borderSide: BorderSide(
                      color: tintDisabledColor.withAlpha(kAlphaLowDisabled),
                      width: unfocusedWidth,
                    ),
                  );
                }
                if (states.contains(WidgetState.error)) {
                  if (states.contains(WidgetState.focused)) {
                    return UnderlineInputBorder(
                      borderRadius: effectiveUnderlineBorder,
                      borderSide: BorderSide(
                        color: colorScheme.error,
                        width: focusedWidth,
                      ),
                    );
                  }
                  if (states.contains(WidgetState.hovered)) {
                    return UnderlineInputBorder(
                      borderRadius: effectiveUnderlineBorder,
                      borderSide: BorderSide(
                        color: colorScheme.error,
                        width: unfocusedWidth,
                      ),
                    );
                  }
                  return UnderlineInputBorder(
                    borderRadius: effectiveUnderlineBorder,
                    borderSide: BorderSide(
                      color: colorScheme.error.withAlpha(kEnabledBorderAlpha),
                      width: unfocusedWidth,
                    ),
                  );
                }
                if (states.contains(WidgetState.focused)) {
                  return UnderlineInputBorder(
                    borderRadius: effectiveUnderlineBorder,
                    borderSide: BorderSide(
                      color: borderColor,
                      width: focusedWidth,
                    ),
                  );
                }
                if (states.contains(WidgetState.hovered)) {
                  return UnderlineInputBorder(
                    borderRadius: effectiveUnderlineBorder,
                    borderSide: BorderSide(
                      color: enabledHoveredBorderColor,
                      width: unfocusedWidth,
                    ),
                  );
                }
                return UnderlineInputBorder(
                  borderRadius: effectiveUnderlineBorder,
                  borderSide: BorderSide(
                    color: enabledBorderColor,
                    width: unfocusedWidth,
                  ),
                );
              },
            ),
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'InputDecoration FST16.5 states: Does Decorator '
        'have right material states in M2', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
      );
      // Tinted disabled colors
      final Color tintDisabledColor = FlexSubThemes.tintedDisable(
          colorScheme.onSurface, colorScheme.primary);

      // Floating label focused error style
      expect(
          (FlexSubThemes.inputDecorationTheme(
            colorScheme: colorScheme,
            tintedDisabled: true,
            useMaterial3: false,
          ).floatingLabelStyle as WidgetStateTextStyle?)!
              .resolve(<WidgetState>{
            WidgetState.error,
            WidgetState.focused,
          }),
          equals(
            TextStyle(color: colorScheme.error),
          ));
      // Floating label error hovered style
      expect(
          (FlexSubThemes.inputDecorationTheme(
            colorScheme: colorScheme,
            useMaterial3: false,
          ).floatingLabelStyle as WidgetStateTextStyle?)!
              .resolve(<WidgetState>{
            WidgetState.error,
            WidgetState.hovered,
          }),
          equals(
            TextStyle(color: colorScheme.error),
          ));
      // Floating label unfocused error style
      expect(
          (FlexSubThemes.inputDecorationTheme(
            colorScheme: colorScheme,
            useMaterial3: false,
          ).floatingLabelStyle as WidgetStateTextStyle?)!
              .resolve(<WidgetState>{
            WidgetState.error,
          }),
          equals(
            TextStyle(color: colorScheme.error.withAlpha(kEnabledBorderAlpha)),
          ));
      // Floating label disabled style
      expect(
          (FlexSubThemes.inputDecorationTheme(
            colorScheme: colorScheme,
            tintedDisabled: true,
            useMaterial3: false,
          ).floatingLabelStyle as WidgetStateTextStyle?)!
              .resolve(<WidgetState>{
            WidgetState.disabled,
          }),
          equals(
            TextStyle(color: tintDisabledColor),
          ));
      // Floating label default style
      expect(
          (FlexSubThemes.inputDecorationTheme(
            colorScheme: colorScheme,
            useMaterial3: false,
          ).floatingLabelStyle as WidgetStateTextStyle?)!
              .resolve(<WidgetState>{}),
          equals(
            TextStyle(color: Colors.black.withAlpha(kTintHover)),
          ));
    });
    test(
        'InputDecoration FST16.6 light: GIVEN a default M2 '
        'FlexSubTheme.inputDecorationTheme(borderType: '
        'FlexInputBorderType.outline, usedSchemeColor: '
        'FlexUsedColor.secondary, tintedDisabled: true) '
        'EXPECT equal to InputDecorationTheme() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      // Tinted disabled colors
      final Color tintDisabledColor = FlexSubThemes.tintedDisable(
          colorScheme.onSurface, colorScheme.secondary);

      const double? radius = null;
      const double unfocusedWidth = 1.0;
      const double focusedWidth = 2.0;
      final Color borderColor = colorScheme.secondary;
      final Color enabledBorderColor = colorScheme.outline;
      final Color enabledHoveredBorderColor = colorScheme.secondary;
      const double effectiveRadius = radius ?? kInputDecoratorRadius;
      final BorderRadius effectiveOutlineBorder =
          BorderRadius.circular(effectiveRadius);
      const int effectiveAlpha = kFillColorAlphaLight;
      final Color usedFillColor = Color.alphaBlend(
          colorScheme.secondary.withAlpha(effectiveAlpha), colorScheme.surface);
      final Color usedHover =
          ThemeData.estimateBrightnessForColor(usedFillColor) ==
                  Brightness.light
              ? usedFillColor.darken(kInputDecoratorLightBgDarken)
              : usedFillColor.lighten(kInputDecoratorDarkBgLighten);

      expect(
        FlexSubThemes.inputDecorationTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          borderType: FlexInputBorderType.outline,
          tintedDisabled: true,
          tintedInteractions: true,
          useMaterial3: false,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          InputDecorationTheme(
            labelStyle:
                WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.error)) {
                if (states.contains(WidgetState.focused)) {
                  return TextStyle(color: colorScheme.error);
                }
                if (states.contains(WidgetState.hovered)) {
                  return TextStyle(color: colorScheme.onErrorContainer);
                }
                return TextStyle(color: colorScheme.error);
              }
              if (states.contains(WidgetState.focused)) {
                return TextStyle(color: colorScheme.secondary);
              }
              if (states.contains(WidgetState.hovered)) {
                return TextStyle(color: colorScheme.onSurfaceVariant);
              }
              if (states.contains(WidgetState.disabled)) {
                return TextStyle(
                  color: tintDisabledColor,
                );
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            floatingLabelStyle:
                WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.error)) {
                if (states.contains(WidgetState.focused)) {
                  return TextStyle(color: colorScheme.error);
                }
                if (states.contains(WidgetState.hovered)) {
                  return TextStyle(
                    color: colorScheme.error.withAlpha(kEnabledBorderAlpha),
                  );
                }
                return TextStyle(color: colorScheme.error);
              }
              if (states.contains(WidgetState.focused)) {
                return TextStyle(color: colorScheme.secondary);
              }
              if (states.contains(WidgetState.hovered)) {
                return TextStyle(color: colorScheme.onSurfaceVariant);
              }
              if (states.contains(WidgetState.disabled)) {
                return TextStyle(
                  color: tintDisabledColor,
                );
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            helperStyle:
                WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return TextStyle(
                  color: tintDisabledColor,
                );
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            hintStyle:
                WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return TextStyle(color: tintDisabledColor);
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            iconColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return tintDisabledColor;
              }
              if (states.contains(WidgetState.focused)) {
                return colorScheme.secondary;
              }
              return Colors.black45;
            }),
            prefixIconColor:
                WidgetStateColor.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return tintDisabledColor;
              }
              if (states.contains(WidgetState.focused)) {
                return colorScheme.secondary;
              }
              return Colors.black45;
            }),
            suffixIconColor:
                WidgetStateColor.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.error)) {
                return colorScheme.error;
              }
              if (states.contains(WidgetState.disabled)) {
                return tintDisabledColor;
              }
              if (states.contains(WidgetState.focused)) {
                return colorScheme.secondary;
              }
              return Colors.black45;
            }),
            filled: false,
            fillColor: usedFillColor,
            hoverColor: usedHover,
            border: MaterialStateOutlineInputBorder.resolveWith(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.disabled)) {
                  return OutlineInputBorder(
                    borderRadius: effectiveOutlineBorder,
                    borderSide: BorderSide(
                      color: tintDisabledColor.withAlpha(kAlphaLowDisabled),
                      width: unfocusedWidth,
                    ),
                  );
                }
                if (states.contains(WidgetState.error)) {
                  if (states.contains(WidgetState.focused)) {
                    return OutlineInputBorder(
                      borderRadius: effectiveOutlineBorder,
                      borderSide: BorderSide(
                        color: colorScheme.error,
                        width: focusedWidth,
                      ),
                    );
                  }
                  if (states.contains(WidgetState.hovered)) {
                    return OutlineInputBorder(
                      borderRadius: effectiveOutlineBorder,
                      borderSide: BorderSide(
                        // TODO(rydmike): INFO: M3 uses onErrorContainer
                        color: colorScheme.error,
                        width: unfocusedWidth,
                      ),
                    );
                  }
                  return OutlineInputBorder(
                    borderRadius: effectiveOutlineBorder,
                    borderSide: BorderSide(
                      // TODO(rydmike): INFO: M3 uses error
                      color: colorScheme.error.withAlpha(kEnabledBorderAlpha),
                      width: unfocusedWidth,
                    ),
                  );
                }
                if (states.contains(WidgetState.focused)) {
                  return OutlineInputBorder(
                    borderRadius: effectiveOutlineBorder,
                    borderSide: BorderSide(
                      color: borderColor,
                      width: focusedWidth,
                    ),
                  );
                }
                if (states.contains(WidgetState.hovered)) {
                  return OutlineInputBorder(
                    borderRadius: effectiveOutlineBorder,
                    borderSide: BorderSide(
                      color: enabledHoveredBorderColor,
                      width: unfocusedWidth,
                    ),
                  );
                }
                return OutlineInputBorder(
                  borderRadius: effectiveOutlineBorder,
                  borderSide: BorderSide(
                    color: enabledBorderColor,
                    width: unfocusedWidth,
                  ),
                );
              },
            ),
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'InputDecoration FST16.7 states: Does Decorator '
        'have right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      // Tinted disabled colors
      final Color tintDisabledColor = FlexSubThemes.tintedDisable(
          colorScheme.onSurface, colorScheme.primary);
      // Floating label focused error style
      expect(
          (FlexSubThemes.inputDecorationTheme(
            colorScheme: colorScheme,
            borderType: FlexInputBorderType.outline,
            tintedDisabled: true,
            useMaterial3: false,
          ).floatingLabelStyle as WidgetStateTextStyle?)!
              .resolve(<WidgetState>{
            WidgetState.error,
            WidgetState.focused,
          }),
          equals(
            TextStyle(color: colorScheme.error),
          ));
      // Floating label error hovered style
      expect(
          (FlexSubThemes.inputDecorationTheme(
            colorScheme: colorScheme,
            borderType: FlexInputBorderType.outline,
            useMaterial3: false,
          ).floatingLabelStyle as WidgetStateTextStyle?)!
              .resolve(<WidgetState>{
            WidgetState.error,
            WidgetState.hovered,
          }),
          equals(
            TextStyle(color: colorScheme.error),
          ));
      // Floating label unfocused error style
      expect(
          (FlexSubThemes.inputDecorationTheme(
            colorScheme: colorScheme,
            borderType: FlexInputBorderType.outline,
            useMaterial3: false,
          ).floatingLabelStyle as WidgetStateTextStyle?)!
              .resolve(<WidgetState>{
            WidgetState.error,
          }),
          equals(
            TextStyle(color: colorScheme.error.withAlpha(kEnabledBorderAlpha)),
          ));
      // Floating label disabled style
      expect(
          (FlexSubThemes.inputDecorationTheme(
            colorScheme: colorScheme,
            borderType: FlexInputBorderType.outline,
            useMaterial3: false,
            tintedDisabled: true,
          ).floatingLabelStyle as WidgetStateTextStyle?)!
              .resolve(<WidgetState>{
            WidgetState.disabled,
          }),
          equals(
            TextStyle(color: tintDisabledColor),
          ));
      // Floating label default style
      expect(
          (FlexSubThemes.inputDecorationTheme(
            colorScheme: colorScheme,
            borderType: FlexInputBorderType.outline,
            useMaterial3: false,
          ).floatingLabelStyle as WidgetStateTextStyle?)!
              .resolve(<WidgetState>{}),
          equals(
            TextStyle(color: Colors.black.withAlpha(kTintHover)),
          ));
      //
      // Outline M3 case
      InputDecorationTheme m = FlexSubThemes.inputDecorationTheme(
        colorScheme: colorScheme,
        borderType: FlexInputBorderType.outline,
        backgroundAlpha: 0xAA,
        fillColor: colorScheme.secondaryContainer,
        unfocusedBorderIsColored: false,
        unfocusedHasBorder: true,
        unfocusedBorderWidth: 3,
        focusedBorderWidth: 4,
        useMaterial3: true,
      );
      expect(
        m.fillColor,
        equals(
          Color.alphaBlend(colorScheme.secondaryContainer.withAlpha(0xAA),
              colorScheme.surface),
        ),
      );
      //
      // Outline border default
      expect(
        (m.border as MaterialStateOutlineInputBorder?)!
            .resolve(<WidgetState>{}),
        equals(
          OutlineInputBorder(
            gapPadding: 4,
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(
              color: colorScheme.outline,
              width: 3,
            ),
          ),
        ),
      );
      // Outline border disabled (not tinted)
      expect(
        (m.border as MaterialStateOutlineInputBorder?)!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(
          OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(
              color: colorScheme.onSurface.withAlpha(kAlphaVeryLowDisabled),
              width: 3,
            ),
          ),
        ),
      );
      // Outline border error
      expect(
        (m.border as MaterialStateOutlineInputBorder?)!
            .resolve(<WidgetState>{WidgetState.error}),
        equals(
          OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(
              color: colorScheme.error.withAlpha(kEnabledBorderAlpha),
              width: 3,
            ),
          ),
        ),
      );
      // Outline border error, focused
      expect(
        (m.border as MaterialStateOutlineInputBorder?)!
            .resolve(<WidgetState>{WidgetState.error, WidgetState.focused}),
        equals(
          OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(
              color: colorScheme.error,
              width: 4,
            ),
          ),
        ),
      );
      // Outline border error, hovered
      expect(
        (m.border as MaterialStateOutlineInputBorder?)!
            .resolve(<WidgetState>{WidgetState.error, WidgetState.hovered}),
        equals(
          OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(
              color: colorScheme.error,
              width: 3,
            ),
          ),
        ),
      );
      // Outline border focused
      expect(
        (m.border as MaterialStateOutlineInputBorder?)!
            .resolve(<WidgetState>{WidgetState.focused}),
        equals(
          OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(
              color: colorScheme.primary,
              width: 4,
            ),
          ),
        ),
      );
      // Outline border focused
      expect(
        (m.border as MaterialStateOutlineInputBorder?)!
            .resolve(<WidgetState>{WidgetState.hovered}),
        equals(
          OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(
              color: colorScheme.onSurfaceVariant,
              width: 3,
            ),
          ),
        ),
      );
      //
      // Outline M3 case -tinted disabled
      m = FlexSubThemes.inputDecorationTheme(
        colorScheme: colorScheme,
        borderType: FlexInputBorderType.outline,
        backgroundAlpha: 0xAA,
        fillColor: colorScheme.secondaryContainer,
        unfocusedBorderIsColored: false,
        unfocusedHasBorder: true,
        unfocusedBorderWidth: 3,
        focusedBorderWidth: 4,
        tintedDisabled: true,
        useMaterial3: true,
      );

      // Border
      // Underline border disabled (tinted)
      final Color tintDisable = FlexSubThemes.tintedDisable(
          colorScheme.onSurface, colorScheme.secondaryContainer);
      final OutlineInputBorder ulAct1 = (m.border
              as MaterialStateOutlineInputBorder?)!
          .resolve(<WidgetState>{WidgetState.disabled}) as OutlineInputBorder;
      final OutlineInputBorder ulExp1 = OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(
          color: tintDisable.withAlpha(kAlphaLowDisabled),
          width: 3,
        ),
      );
      expect(ulAct1.borderSide.color, equals(ulExp1.borderSide.color));
      expect(ulAct1.borderSide.width, equals(ulExp1.borderSide.width));
      expect(ulAct1, equals(ulExp1));
      //
      //
      // Underline border case
      m = FlexSubThemes.inputDecorationTheme(
        colorScheme: colorScheme,
        borderType: FlexInputBorderType.underline,
        backgroundAlpha: 0xCC,
        unfocusedBorderIsColored: false,
        unfocusedHasBorder: true,
        unfocusedBorderWidth: 3,
        focusedBorderWidth: 4,
        tintedDisabled: false,
        useMaterial3: true,
      );
      //
      // fillColor
      expect(
        (m.fillColor as WidgetStateColor?)!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(colorScheme.onSurface.withAlpha(kAlphaUltraLowDisabled)),
      );
      expect(
        (m.fillColor as WidgetStateColor?)!.resolve(<WidgetState>{}),
        equals(Color.alphaBlend(
            colorScheme.surfaceContainerHighest.withAlpha(0xCC),
            colorScheme.surface)),
      );
      //
      // labelStyle
      expect(
        (m.labelStyle as WidgetStateTextStyle?)!.resolve(<WidgetState>{
          WidgetState.error,
          WidgetState.focused,
        }),
        equals(TextStyle(color: colorScheme.error)),
      );
      expect(
        (m.labelStyle as WidgetStateTextStyle?)!.resolve(<WidgetState>{
          WidgetState.error,
          WidgetState.hovered,
        }),
        equals(TextStyle(color: colorScheme.error)),
      );
      expect(
        (m.labelStyle as WidgetStateTextStyle?)!.resolve(<WidgetState>{
          WidgetState.error,
        }),
        equals(TextStyle(color: colorScheme.error)),
      );
      expect(
        (m.labelStyle as WidgetStateTextStyle?)!.resolve(<WidgetState>{
          WidgetState.focused,
        }),
        equals(TextStyle(color: colorScheme.primary)),
      );
      expect(
        (m.labelStyle as WidgetStateTextStyle?)!.resolve(<WidgetState>{
          WidgetState.hovered,
        }),
        equals(TextStyle(color: colorScheme.onSurfaceVariant)),
      );
      expect(
        (m.labelStyle as WidgetStateTextStyle?)!.resolve(<WidgetState>{
          WidgetState.disabled,
        }),
        equals(
            TextStyle(color: colorScheme.onSurface.withAlpha(kAlphaDisabled))),
      );
      expect(
        (m.labelStyle as WidgetStateTextStyle?)!.resolve(<WidgetState>{}),
        equals(TextStyle(color: colorScheme.onSurfaceVariant)),
      );
      //
      // floatingLabelStyle
      expect(
        (m.floatingLabelStyle as WidgetStateTextStyle?)!.resolve(<WidgetState>{
          WidgetState.focused,
        }),
        equals(TextStyle(color: colorScheme.primary)),
      );
      expect(
        (m.floatingLabelStyle as WidgetStateTextStyle?)!.resolve(<WidgetState>{
          WidgetState.hovered,
        }),
        equals(TextStyle(color: colorScheme.onSurfaceVariant)),
      );
      expect(
        (m.floatingLabelStyle as WidgetStateTextStyle?)!.resolve(<WidgetState>{
          WidgetState.disabled,
        }),
        equals(
            TextStyle(color: colorScheme.onSurface.withAlpha(kAlphaDisabled))),
      );
      expect(
        (m.floatingLabelStyle as WidgetStateTextStyle?)!
            .resolve(<WidgetState>{}),
        equals(TextStyle(color: colorScheme.onSurfaceVariant)),
      );
      //
      // helperStyle
      expect(
        (m.helperStyle as WidgetStateTextStyle?)!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(
            TextStyle(color: colorScheme.onSurface.withAlpha(kAlphaDisabled))),
      );
      expect(
        (m.helperStyle as WidgetStateTextStyle?)!.resolve(<WidgetState>{}),
        equals(TextStyle(color: colorScheme.onSurfaceVariant)),
      );
      //
      // hintStyle
      expect(
        (m.hintStyle as WidgetStateTextStyle?)!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(
            TextStyle(color: colorScheme.onSurface.withAlpha(kAlphaDisabled))),
      );
      expect(
        (m.hintStyle as WidgetStateTextStyle?)!.resolve(<WidgetState>{}),
        equals(TextStyle(color: colorScheme.onSurfaceVariant)),
      );
      //
      // iconColor
      expect(
        (m.iconColor as WidgetStateColor?)!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(colorScheme.onSurface.withAlpha(kAlphaDisabled)),
      );
      expect(
        (m.iconColor as WidgetStateColor?)!
            .resolve(<WidgetState>{WidgetState.focused}),
        equals(colorScheme.onSurfaceVariant),
      );
      expect(
        (m.iconColor as WidgetStateColor?)!.resolve(<WidgetState>{}),
        equals(colorScheme.onSurfaceVariant),
      );
      //
      // prefixIconColor
      expect(
        (m.prefixIconColor as WidgetStateColor?)!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(colorScheme.onSurface.withAlpha(kAlphaDisabled)),
      );
      expect(
        (m.prefixIconColor as WidgetStateColor?)!
            .resolve(<WidgetState>{WidgetState.focused}),
        equals(colorScheme.onSurfaceVariant),
      );
      expect(
        (m.prefixIconColor as WidgetStateColor?)!.resolve(<WidgetState>{}),
        equals(colorScheme.onSurfaceVariant),
      );
      //
      // suffixIconColor
      expect(
        (m.suffixIconColor as WidgetStateColor?)!
            .resolve(<WidgetState>{WidgetState.error}),
        equals(colorScheme.error),
      );
      expect(
        (m.suffixIconColor as WidgetStateColor?)!
            .resolve(<WidgetState>{WidgetState.error, WidgetState.focused}),
        equals(colorScheme.error),
      );
      expect(
        (m.suffixIconColor as WidgetStateColor?)!
            .resolve(<WidgetState>{WidgetState.error, WidgetState.hovered}),
        equals(colorScheme.error),
      );
      expect(
        (m.suffixIconColor as WidgetStateColor?)!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(colorScheme.onSurface.withAlpha(kAlphaDisabled)),
      );
      expect(
        (m.suffixIconColor as WidgetStateColor?)!
            .resolve(<WidgetState>{WidgetState.focused}),
        equals(colorScheme.onSurfaceVariant),
      );
      expect(
        (m.suffixIconColor as WidgetStateColor?)!.resolve(<WidgetState>{}),
        equals(colorScheme.onSurfaceVariant),
      );
      //
      // Underline border default
      expect(
        (m.border as MaterialStateUnderlineInputBorder?)!
            .resolve(<WidgetState>{}),
        equals(
          UnderlineInputBorder(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
            borderSide: BorderSide(
              color: colorScheme.outline,
              width: 3,
            ),
          ),
        ),
      );
      // Underline border disabled (not tinted)
      expect(
        (m.border as MaterialStateUnderlineInputBorder?)!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(
          UnderlineInputBorder(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
            borderSide: BorderSide(
              color: colorScheme.onSurface.withAlpha(kAlphaVeryLowDisabled),
              width: 3,
            ),
          ),
        ),
      );
      // Underline border error
      expect(
        (m.border as MaterialStateUnderlineInputBorder?)!
            .resolve(<WidgetState>{WidgetState.error}),
        equals(
          UnderlineInputBorder(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
            borderSide: BorderSide(
              color: colorScheme.error.withAlpha(kEnabledBorderAlpha),
              width: 3,
            ),
          ),
        ),
      );
      // Underline border error, focused
      expect(
        (m.border as MaterialStateUnderlineInputBorder?)!
            .resolve(<WidgetState>{WidgetState.error, WidgetState.focused}),
        equals(
          UnderlineInputBorder(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
            borderSide: BorderSide(
              color: colorScheme.error,
              width: 4,
            ),
          ),
        ),
      );
      // Underline border error, hovered
      expect(
        (m.border as MaterialStateUnderlineInputBorder?)!
            .resolve(<WidgetState>{WidgetState.error, WidgetState.hovered}),
        equals(
          UnderlineInputBorder(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
            borderSide: BorderSide(
              color: colorScheme.error,
              width: 3,
            ),
          ),
        ),
      );
      // Underline border focused
      expect(
        (m.border as MaterialStateUnderlineInputBorder?)!
            .resolve(<WidgetState>{WidgetState.focused}),
        equals(
          UnderlineInputBorder(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
            borderSide: BorderSide(
              color: colorScheme.primary,
              width: 4,
            ),
          ),
        ),
      );
      // Underline border focused
      expect(
        (m.border as MaterialStateUnderlineInputBorder?)!
            .resolve(<WidgetState>{WidgetState.hovered}),
        equals(
          UnderlineInputBorder(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
            borderSide: BorderSide(
              color: colorScheme.onSurfaceVariant,
              width: 3,
            ),
          ),
        ),
      );
      m = FlexSubThemes.inputDecorationTheme(
        colorScheme: colorScheme,
        borderType: FlexInputBorderType.underline,
        backgroundAlpha: 0xCC,
        unfocusedBorderIsColored: false,
        unfocusedHasBorder: true,
        unfocusedBorderWidth: 3,
        focusedBorderWidth: 4,
        tintedDisabled: true,
        tintedInteractions: true,
        useMaterial3: false,
      );
      // Border
      // Underline border disabled (tinted)
      final Color tintDisabledColor2 = FlexSubThemes.tintedDisable(
          colorScheme.onSurface, colorScheme.primary);
      final UnderlineInputBorder ulAct = (m.border
              as MaterialStateUnderlineInputBorder?)!
          .resolve(<WidgetState>{WidgetState.disabled}) as UnderlineInputBorder;
      final UnderlineInputBorder ulExp = UnderlineInputBorder(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(kInputDecoratorRadius),
          topRight: Radius.circular(kInputDecoratorRadius),
        ),
        borderSide: BorderSide(
          color: tintDisabledColor2.withAlpha(kAlphaLowDisabled),
          width: 3,
        ),
      );
      expect(ulAct.borderSide.color, equals(ulExp.borderSide.color));
      expect(ulAct.borderSide.width, equals(ulExp.borderSide.width));
      expect(ulAct, equals(ulExp));
      //
      // Label style
      expect(
        (m.labelStyle as WidgetStateTextStyle?)!.resolve(<WidgetState>{
          WidgetState.disabled,
        }),
        equals(TextStyle(
            color: FlexSubThemes.tintedDisable(
                colorScheme.onSurface, colorScheme.primary))),
      );
      expect(
        (m.labelStyle as WidgetStateTextStyle?)!.resolve(<WidgetState>{}),
        equals(TextStyle(color: Colors.black.withAlpha(kTintHover))),
      );
      expect(
        (m.floatingLabelStyle as WidgetStateTextStyle?)!
            .resolve(<WidgetState>{}),
        equals(TextStyle(color: Colors.black.withAlpha(kTintHover))),
      );
      //
      // helperStyle

      expect(
        (m.helperStyle as WidgetStateTextStyle?)!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(TextStyle(
            color: FlexSubThemes.tintedDisable(
                colorScheme.onSurface, colorScheme.primary))),
      );
      expect(
        (m.helperStyle as WidgetStateTextStyle?)!.resolve(<WidgetState>{}),
        equals(TextStyle(color: Colors.black.withAlpha(kTintHover))),
      );
      //
      // hintStyle
      expect(
        (m.hintStyle as WidgetStateTextStyle?)!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(TextStyle(
            color: FlexSubThemes.tintedDisable(
                colorScheme.onSurface, colorScheme.primary))),
      );
      //
      // iconColor
      expect(
        (m.iconColor as WidgetStateColor?)!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(FlexSubThemes.tintedDisable(
            colorScheme.onSurface, colorScheme.primary)),
      );
      expect(
        (m.iconColor as WidgetStateColor?)!
            .resolve(<WidgetState>{WidgetState.focused}),
        equals(colorScheme.primary),
      );
      expect(
        (m.iconColor as WidgetStateColor?)!.resolve(<WidgetState>{}),
        equals(Colors.black45),
      );
      //
      // prefixIconColor
      expect(
        (m.prefixIconColor as WidgetStateColor?)!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(FlexSubThemes.tintedDisable(
            colorScheme.onSurface, colorScheme.primary)),
      );
      expect(
        (m.prefixIconColor as WidgetStateColor?)!
            .resolve(<WidgetState>{WidgetState.focused}),
        equals(colorScheme.primary),
      );
      expect(
        (m.prefixIconColor as WidgetStateColor?)!.resolve(<WidgetState>{}),
        equals(Colors.black45),
      );
      //
      // suffixIconColor
      expect(
        (m.suffixIconColor as WidgetStateColor?)!
            .resolve(<WidgetState>{WidgetState.error}),
        equals(colorScheme.error),
      );
      expect(
        (m.suffixIconColor as WidgetStateColor?)!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(FlexSubThemes.tintedDisable(
            colorScheme.onSurface, colorScheme.primary)),
      );
      expect(
        (m.suffixIconColor as WidgetStateColor?)!
            .resolve(<WidgetState>{WidgetState.focused}),
        equals(colorScheme.primary),
      );
      expect(
        (m.suffixIconColor as WidgetStateColor?)!.resolve(<WidgetState>{}),
        equals(Colors.black45),
      );
    });
  });
  group('WITH: FlexSubTheme.listTileTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes listTileTheme tests
    // -------------------------------------------------------------------------
    test(
        'ListTile FST17.1: GIVEN a default FlexSubTheme.listTileTheme() '
        'ListTileThemeData with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      final ListTileThemeData listTheme = FlexSubThemes.listTileTheme(
        colorScheme: colorScheme,
      );
      expect(
        listTheme,
        equals(
          ListTileThemeData(selectedColor: colorScheme.primary),
        ),
      );
    });
    test(
        'ListTile FST17.2: GIVEN a custom FlexSubTheme.listTileTheme() '
        'ListTileThemeData with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      final ListTileThemeData listTheme = FlexSubThemes.listTileTheme(
        colorScheme: colorScheme,
        selectedSchemeColor: SchemeColor.tertiary,
        iconSchemeColor: SchemeColor.primaryFixed,
        textSchemeColor: SchemeColor.secondary,
        tileSchemeColor: SchemeColor.surfaceContainer,
        selectedTileSchemeColor: SchemeColor.surfaceContainerHighest,
        contentPadding: const EdgeInsets.all(10),
        horizontalTitleGap: 16,
        minVerticalPadding: 5,
        style: ListTileStyle.drawer,
        titleAlignment: ListTileTitleAlignment.center,
      );
      expect(
        listTheme,
        equals(
          ListTileThemeData(
            selectedColor: colorScheme.tertiary,
            iconColor: colorScheme.primaryFixed,
            textColor: colorScheme.secondary,
            tileColor: colorScheme.surfaceContainer,
            selectedTileColor: colorScheme.surfaceContainerHighest,
            contentPadding: const EdgeInsets.all(10),
            horizontalTitleGap: 16,
            minVerticalPadding: 5,
            style: ListTileStyle.drawer,
            titleAlignment: ListTileTitleAlignment.center,
          ),
        ),
      );
    });
  });
  group('WITH: FlexSubTheme.menuBarTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes menuBarTheme tests
    // -------------------------------------------------------------------------
    test(
        'MenuBar FST18.1: GIVEN a FlexSubTheme.menuBarTheme() '
        'MenuBarThemeData with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      final MenuBarThemeData menuDefault = FlexSubThemes.menuBarTheme(
        colorScheme: colorScheme,
      );
      expect(menuDefault, equals(const MenuBarThemeData()));
      //
      MenuBarThemeData menu = FlexSubThemes.menuBarTheme(
        colorScheme: colorScheme,
        radius: 5,
      );
      expect(
        menu.style!.backgroundColor?.resolve(<WidgetState>{}),
        equals(null),
      );
      expect(
        menu.style!.surfaceTintColor?.resolve(<WidgetState>{}),
        equals(null),
      );
      expect(
        menu.style!.shadowColor?.resolve(<WidgetState>{}),
        equals(null),
      );
      expect(
        menu.style!.elevation?.resolve(<WidgetState>{}),
        equals(null),
      );
      expect(
        menu.style!.shape!.resolve(<WidgetState>{}),
        equals(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
        ),
      );
      menu = FlexSubThemes.menuBarTheme(
        colorScheme: colorScheme,
        backgroundSchemeColor: SchemeColor.surfaceContainer,
        surfaceTintColor: colorScheme.tertiary,
        shadowColor: colorScheme.onSurface,
        elevation: 8,
      );
      expect(
        menu.style!.backgroundColor?.resolve(<WidgetState>{}),
        equals(colorScheme.surfaceContainer),
      );
      expect(
        menu.style!.surfaceTintColor?.resolve(<WidgetState>{}),
        equals(colorScheme.tertiary),
      );
      expect(
        menu.style!.shadowColor?.resolve(<WidgetState>{}),
        equals(colorScheme.onSurface),
      );
      expect(
        menu.style!.elevation?.resolve(<WidgetState>{}),
        equals(8),
      );
      expect(
        menu.style!.shape?.resolve(<WidgetState>{}),
        equals(null),
      );
    });
  });
  group('WITH: FlexSubTheme.menuButtonTheme ', () {
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
      expect(
        m1.style!.animationDuration,
        equals(Duration.zero),
      );
      // Foreground color
      expect(
        m1.style!.foregroundColor?.resolve(<WidgetState>{WidgetState.disabled}),
        equals(colorScheme.onSurface.withAlpha(kAlphaDisabled)),
      );
      expect(
        m2.style!.foregroundColor?.resolve(<WidgetState>{WidgetState.disabled}),
        equals(FlexSubThemes.tintedDisable(
            colorScheme.onSurface, colorScheme.primary)),
      );
      expect(
        m5.style!.foregroundColor?.resolve(<WidgetState>{WidgetState.disabled}),
        equals(FlexSubThemes.tintedDisable(
            colorScheme.onSurfaceVariant, colorScheme.primary)),
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
        equals(FlexSubThemes.tintedDisable(
            colorScheme.onSurface, colorScheme.primary)),
      );
      expect(
        m5.style!.iconColor?.resolve(<WidgetState>{WidgetState.disabled}),
        equals(FlexSubThemes.tintedDisable(
            colorScheme.onSurfaceVariant, colorScheme.primary)),
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
        equals(FlexSubThemes.tintedPressed(
            colorScheme.surfaceContainer, colorScheme.primary, 1)),
      );
      expect(
        m1.style!.overlayColor?.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.onSurface.withAlpha(kAlphaPressed)),
      );
      expect(
        m2.style!.overlayColor?.resolve(<WidgetState>{WidgetState.selected}),
        equals(FlexSubThemes.tintedSplash(
            colorScheme.surfaceContainer, colorScheme.primary, 1)),
      );
      expect(
        m1.style!.overlayColor?.resolve(<WidgetState>{WidgetState.focused}),
        equals(colorScheme.onSurface.withAlpha(kAlphaSplash)),
      );
      expect(
        m2.style!.overlayColor?.resolve(<WidgetState>{WidgetState.focused}),
        equals(FlexSubThemes.tintedFocused(
            colorScheme.surfaceContainer, colorScheme.primary, 1)),
      );
      expect(
        m1.style!.overlayColor?.resolve(<WidgetState>{WidgetState.hovered}),
        equals(colorScheme.onSurface.withAlpha(kAlphaFocused)),
      );
      expect(
        m2.style!.overlayColor?.resolve(<WidgetState>{WidgetState.hovered}),
        equals(FlexSubThemes.tintedHovered(
            colorScheme.surfaceContainer, colorScheme.primary, 1)),
      );
      expect(
        m1.style!.overlayColor?.resolve(<WidgetState>{}),
        equals(Colors.transparent),
      );
      // Shape
      expect(
        m1.style!.shape?.resolve(<WidgetState>{}),
        equals(null),
      );
      expect(
        m2.style!.shape?.resolve(<WidgetState>{}),
        equals(const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(11),
          ),
        )),
      );
    });
  });
  group('WITH: FlexSubTheme.menuTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes menuTheme tests
    // -------------------------------------------------------------------------
    test(
        'MenuAnchor FST20.1: GIVEN a FlexSubTheme.menuTheme() '
        'EXPECT equal to MenuThemeData() with same values.', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      final MenuThemeData menuDefault = FlexSubThemes.menuTheme(
        colorScheme: colorScheme,
      );
      expect(menuDefault, equals(const MenuThemeData()));
      //
      MenuThemeData menu = FlexSubThemes.menuTheme(
        colorScheme: colorScheme,
        radius: 11,
      );
      expect(
        menu.style!.elevation?.resolve(<WidgetState>{}),
        equals(null),
      );
      expect(
        menu.style!.backgroundColor?.resolve(<WidgetState>{}),
        equals(null),
      );
      expect(
        menu.style!.padding?.resolve(<WidgetState>{}),
        equals(null),
      );
      expect(
        menu.style!.surfaceTintColor?.resolve(<WidgetState>{}),
        equals(null),
      );
      expect(
        menu.style!.shape!.resolve(<WidgetState>{}),
        equals(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(11),
            ),
          ),
        ),
      );
      menu = FlexSubThemes.menuTheme(
        colorScheme: colorScheme,
        elevation: 3,
        opacity: 0.8,
        surfaceTintColor: colorScheme.tertiary,
        padding: const EdgeInsets.all(7),
      );
      expect(
        menu.style!.elevation?.resolve(<WidgetState>{}),
        equals(3),
      );
      expect(
        menu.style!.backgroundColor?.resolve(<WidgetState>{}),
        equals(colorScheme.surfaceContainer.withOpacity(0.8)),
      );
      expect(
        menu.style!.padding?.resolve(<WidgetState>{}),
        equals(const EdgeInsets.all(7)),
      );
      expect(
        menu.style!.surfaceTintColor?.resolve(<WidgetState>{}),
        equals(colorScheme.tertiary),
      );
      expect(
        menu.style!.shape?.resolve(<WidgetState>{}),
        equals(null),
      );
      menu = FlexSubThemes.menuTheme(
        colorScheme: colorScheme,
        backgroundSchemeColor: SchemeColor.surfaceContainer,
      );
      expect(
        menu.style!.backgroundColor?.resolve(<WidgetState>{}),
        equals(colorScheme.surfaceContainer),
      );
      menu = FlexSubThemes.menuTheme(
          colorScheme: colorScheme,
          backgroundSchemeColor: SchemeColor.secondaryContainer,
          opacity: 0.9);
      expect(
        menu.style!.backgroundColor?.resolve(<WidgetState>{}),
        equals(colorScheme.secondaryContainer.withOpacity(0.9)),
      );
    });
  });
  group('WITH: FlexSubTheme.navigationBarTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes NavigationBar tests
    // -------------------------------------------------------------------------
    test(
        'NavigationBar FST21.1: GIVEN a default '
        'FlexSubTheme.navigationBarTheme() '
        'EXPECT equal to NavigationBarThemeData() version '
        'with same values', () {
      final ColorScheme colorScheme =
          ColorScheme.fromSeed(seedColor: const Color(0xFF6750A4));
      final TextTheme textTheme = Typography.material2021(
              platform: TargetPlatform.android, colorScheme: colorScheme)
          .black;
      expect(
        FlexSubThemes.navigationBarTheme(colorScheme: colorScheme).toString(),
        equalsIgnoringHashCodes(
          NavigationBarThemeData(
            height: null,
            elevation: null,
            labelBehavior: null,
            backgroundColor: colorScheme.surfaceContainer,
            indicatorColor: colorScheme.secondaryContainer,
            labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.selected)) {
                  return textTheme.labelMedium!.copyWith(
                    color: colorScheme.onSurface,
                    fontSize: 12,
                  );
                }
                return textTheme.labelMedium!.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontSize: 12,
                );
              },
            ),
            iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.selected)) {
                  return IconThemeData(
                    size: 24,
                    color: colorScheme.onSurface,
                  );
                }
                return IconThemeData(
                    size: 24, color: colorScheme.onSurfaceVariant);
              },
            ),
          ).toString(),
        ),
      );
    });

    test(
        'NavigationBar FST21.2 custom1: GIVEN a custom1 '
        'FlexSubTheme.navigationBarTheme() '
        'EXPECT equal to NavigationBarThemeData() version '
        'with same values', () {
      final ColorScheme colorScheme =
          ColorScheme.fromSeed(seedColor: const Color(0xFF6750A4));
      final TextTheme textTheme = Typography.material2021(
              platform: TargetPlatform.android, colorScheme: colorScheme)
          .black;
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
        indicatorRadius: 12,
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
            backgroundColor: colorScheme.surfaceContainer.withOpacity(0.9),
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            indicatorColor: colorScheme.secondaryContainer.withAlpha(0x3D),
            indicatorShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.selected)) {
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
            iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.selected)) {
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
            .resolve(<WidgetState>{WidgetState.selected})?.color,
        equals(colorScheme.secondary),
      );
      expect(
        navBarTheme.iconTheme!.resolve(<WidgetState>{})?.color,
        equals(
          colorScheme.onSurface
              .blendAlpha(colorScheme.onSurface, 0x66)
              .withAlpha(0xA5),
        ),
      );
      expect(
        navBarTheme.labelTextStyle!
            .resolve(<WidgetState>{WidgetState.selected})?.color,
        equals(colorScheme.error),
      );
      expect(
        navBarTheme.labelTextStyle!.resolve(<WidgetState>{})?.color,
        equals(
          colorScheme.onSurface
              .blendAlpha(colorScheme.onSurface, 0x66)
              .withAlpha(0xA5),
        ),
      );
    });
    test(
        'NavigationBar FST21.3 custom2: GIVEN a custom1 '
        'FlexSubTheme.navigationBarTheme() in M2 settings '
        'EXPECT equal to NavigationBarThemeData() version '
        'with same values', () {
      final ColorScheme colorScheme =
          ColorScheme.fromSeed(seedColor: const Color(0xFF6750A4));
      final TextTheme textTheme = Typography.material2021(
              platform: TargetPlatform.android, colorScheme: colorScheme)
          .black;
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
            labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.selected)) {
                  return textTheme.bodySmall!
                      .copyWith(color: colorScheme.primaryContainer);
                }
                return textTheme.bodySmall!
                    .copyWith(color: colorScheme.onSurface);
              },
            ),
            iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.selected)) {
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
            .resolve(<WidgetState>{WidgetState.selected})?.color,
        equals(colorScheme.secondaryContainer),
      );
      expect(
        navBarTheme.iconTheme!
            .resolve(<WidgetState>{WidgetState.selected})?.size,
        equals(28),
      );
      expect(
        navBarTheme.iconTheme!.resolve(<WidgetState>{})?.color,
        equals(
          colorScheme.onSurface,
        ),
      );
      expect(
        navBarTheme.iconTheme!.resolve(<WidgetState>{})?.size,
        equals(25),
      );
      expect(
        navBarTheme.labelTextStyle!
            .resolve(<WidgetState>{WidgetState.selected})?.color,
        equals(colorScheme.primaryContainer),
      );
      expect(
        navBarTheme.labelTextStyle!.resolve(<WidgetState>{})?.color,
        equals(
          colorScheme.onSurface,
        ),
      );
    });
  });
  group('WITH: FlexSubTheme.navigationDrawerTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes navigationDrawerTheme tests
    // -------------------------------------------------------------------------
    test(
        'NavigationDrawer FST22.1: GIVEN a FlexSubTheme.navigationDrawerTheme '
        'EXPECT equal to NavigationDrawerThemeData with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      NavigationDrawerThemeData m = FlexSubThemes.navigationDrawerTheme(
        colorScheme: colorScheme,
      );
      expect(
        m.backgroundColor,
        equals(colorScheme.surfaceContainerLow),
      );
      expect(
        m.indicatorColor,
        equals(colorScheme.secondaryContainer),
      );
      expect(
        m.indicatorSize,
        equals(const Size(336, 56)),
      );
      expect(
        m.labelTextStyle!.resolve(<WidgetState>{WidgetState.selected})?.color,
        equals(colorScheme.onSecondaryContainer),
      );
      expect(
        m.labelTextStyle!.resolve(<WidgetState>{})?.color,
        equals(colorScheme.onSurfaceVariant),
      );
      expect(
        m.iconTheme!.resolve(<WidgetState>{WidgetState.selected})?.color,
        equals(colorScheme.onSecondaryContainer),
      );
      expect(
        m.iconTheme!.resolve(<WidgetState>{})?.color,
        equals(colorScheme.onSurfaceVariant),
      );
      m = FlexSubThemes.navigationDrawerTheme(
        colorScheme: colorScheme,
        backgroundSchemeColor: SchemeColor.secondaryContainer,
        indicatorSchemeColor: SchemeColor.primary,
        selectedItemSchemeColor: SchemeColor.secondaryContainer,
        unselectedItemSchemeColor: SchemeColor.onTertiaryContainer,
        surfaceTintColor: colorScheme.tertiary,
        shadowColor: Colors.red,
        indicatorOpacity: 0.95,
        indicatorRadius: 8,
        indicatorWidth: 304,
      );
      expect(
        m.backgroundColor,
        equals(colorScheme.secondaryContainer),
      );
      expect(
        m.surfaceTintColor,
        equals(colorScheme.tertiary),
      );
      expect(
        m.shadowColor,
        equals(Colors.red),
      );
      expect(
        m.indicatorColor,
        equals(colorScheme.primary.withOpacity(0.95)),
      );
      expect(
        m.indicatorSize,
        equals(const Size(304, 56)),
      );
      expect(
        m.labelTextStyle!.resolve(<WidgetState>{WidgetState.selected})?.color,
        equals(colorScheme.secondaryContainer),
      );
      expect(
        m.labelTextStyle!.resolve(<WidgetState>{})?.color,
        equals(colorScheme.onTertiaryContainer),
      );
      expect(
        m.iconTheme!.resolve(<WidgetState>{WidgetState.selected})?.color,
        equals(colorScheme.secondaryContainer),
      );
      expect(
        m.iconTheme!.resolve(<WidgetState>{})?.color,
        equals(colorScheme.onTertiaryContainer),
      );
      expect(
        m.indicatorShape,
        equals(const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        )),
      );
    });
  });
  group('WITH: FlexSubTheme.navigationRailTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes NavigationRail tests
    // -------------------------------------------------------------------------
    test(
        'NavigationRail FST22.2 light-flutter default: GIVEN a default '
        'FlexSubTheme.navigationRailTheme() that uses Flutter defaults '
        'EXPECT equal to NavigationRailThemeData() version '
        'with same values', () {
      final ColorScheme colorScheme =
          ColorScheme.fromSeed(seedColor: const Color(0xFF6750A4));
      expect(
        FlexSubThemes.navigationRailTheme(
          colorScheme: colorScheme,
        ),
        equals(
          NavigationRailThemeData(
            backgroundColor: colorScheme.surface,
            elevation: 0,
            selectedLabelTextStyle: TextStyle(
              fontSize: 12,
              color: colorScheme.onSurface,
            ),
            unselectedLabelTextStyle: TextStyle(
              fontSize: 12,
              color: colorScheme.onSurfaceVariant,
            ),
            selectedIconTheme: IconThemeData(
              size: 24,
              opacity: 1,
              color: colorScheme.onSecondaryContainer,
            ),
            unselectedIconTheme: IconThemeData(
              size: 24,
              opacity: 1,
              color: colorScheme.onSurfaceVariant,
            ),
            indicatorColor: colorScheme.secondaryContainer,
            useIndicator: true,
          ),
        ),
      );
    });
    test(
        'NavigationRail FST22.3 dark-flutter default: GIVEN a default '
        'FlexSubTheme.navigationRailTheme() that uses Flutter defaults '
        'EXPECT equal to NavigationRailThemeData() version '
        'with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.dark,
      );
      expect(
        FlexSubThemes.navigationRailTheme(colorScheme: colorScheme),
        equals(
          NavigationRailThemeData(
            backgroundColor: colorScheme.surface,
            elevation: 0,
            selectedLabelTextStyle: TextStyle(
              fontSize: 12,
              color: colorScheme.onSurface,
            ),
            unselectedLabelTextStyle: TextStyle(
              fontSize: 12,
              color: colorScheme.onSurfaceVariant,
            ),
            selectedIconTheme: IconThemeData(
              size: 24,
              opacity: 1,
              color: colorScheme.onSecondaryContainer,
            ),
            unselectedIconTheme: IconThemeData(
              size: 24,
              opacity: 1,
              color: colorScheme.onSurfaceVariant,
            ),
            indicatorColor: colorScheme.secondaryContainer,
            useIndicator: true,
          ),
        ),
      );
    });
    test(
        'NavigationRail FST22.4 light-flutter default: GIVEN a default '
        'FlexSubTheme.navigationRailTheme() with opacity '
        'EXPECT equal to NavigationRailThemeData() version '
        'with same values', () {
      final ColorScheme colorScheme =
          ColorScheme.fromSeed(seedColor: const Color(0xFF6750A4));
      expect(
        FlexSubThemes.navigationRailTheme(
          colorScheme: colorScheme,
          opacity: 0.5,
          useIndicator: false,
        ),
        equals(
          NavigationRailThemeData(
            backgroundColor: colorScheme.surface.withOpacity(0.5),
            elevation: 0,
            selectedLabelTextStyle: TextStyle(
              fontSize: 12,
              color: colorScheme.onSurface,
            ),
            unselectedLabelTextStyle: TextStyle(
              fontSize: 12,
              color: colorScheme.onSurfaceVariant,
            ),
            selectedIconTheme: IconThemeData(
              size: 24,
              opacity: 1,
              color: colorScheme.onSecondaryContainer,
            ),
            unselectedIconTheme: IconThemeData(
              size: 24,
              opacity: 1,
              color: colorScheme.onSurfaceVariant,
            ),
            indicatorColor: colorScheme.secondaryContainer,
            useIndicator: false,
          ),
        ),
      );
    });
    test(
        'NavigationRail FST22.5 dark-flutter default: GIVEN a default '
        'FlexSubTheme.navigationRailTheme() that NOT use Flutter defaults '
        'EXPECT equal to NavigationRailThemeData() version '
        'with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.dark,
      );
      expect(
        FlexSubThemes.navigationRailTheme(
          colorScheme: colorScheme,
          opacity: 0.8,
          useIndicator: false,
        ),
        equals(
          NavigationRailThemeData(
            backgroundColor: colorScheme.surface.withOpacity(0.8),
            elevation: 0,
            selectedLabelTextStyle: TextStyle(
              fontSize: 12,
              color: colorScheme.onSurface,
            ),
            unselectedLabelTextStyle: TextStyle(
              fontSize: 12,
              color: colorScheme.onSurfaceVariant,
            ),
            selectedIconTheme: IconThemeData(
              size: 24,
              opacity: 1,
              color: colorScheme.onSecondaryContainer,
            ),
            unselectedIconTheme: IconThemeData(
              size: 24,
              opacity: 1,
              color: colorScheme.onSurfaceVariant,
            ),
            indicatorColor: colorScheme.secondaryContainer,
            useIndicator: false,
          ),
        ),
      );
    });
    test(
        'NavigationRail FST22.6 custom: GIVEN a custom '
        'FlexSubTheme.navigationRailTheme() '
        'EXPECT equal to NavigationRailThemeData() version '
        'with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.dark,
      );
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
          indicatorRadius: 13,
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
            indicatorShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(13),
              ),
            ),
            indicatorColor: colorScheme.secondaryContainer,
            labelType: NavigationRailLabelType.all,
            groupAlignment: 0,
          ),
        ),
      );
    });
    test(
        'NavigationRail FST22.7 custom: GIVEN a custom '
        'FlexSubTheme.navigationRailTheme() '
        'EXPECT equal to NavigationRailThemeData() version '
        'with same values Icons Size test', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.dark,
      );
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
          indicatorSchemeColor: SchemeColor.primaryFixed,
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
            indicatorColor: colorScheme.primaryFixed,
            labelType: NavigationRailLabelType.all,
            groupAlignment: 0,
          ),
        ),
      );
    });
  });
  group('WITH: FlexSubTheme.outlinedButtonTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes OutlinedButton tests
    // -------------------------------------------------------------------------
    test(
        'OutlinedButton FST23.1 M2: GIVEN a default M2 '
        'FlexSubTheme.outlinedButtonTheme() '
        'EXPECT '
        'equal to OutlinedButtonThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.outlinedButtonTheme(
                colorScheme: colorScheme, useMaterial3: false)
            .toString(),
        equalsIgnoringHashCodes(
          OutlinedButtonThemeData(
            style: ButtonStyle(
              minimumSize:
                  ButtonStyleButton.allOrNull<Size>(const Size(40, 40)),
              shape: ButtonStyleButton.allOrNull<OutlinedBorder>(
                  const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
              )), //buttonShape,
              side: WidgetStateProperty.resolveWith<BorderSide?>(
                (final Set<WidgetState> states) {
                  if (states.contains(WidgetState.disabled)) {
                    return BorderSide(
                      color: colorScheme.primary
                          .blendAlpha(colorScheme.onSurface, 0x66)
                          .withAlpha(0x26),
                      width: 1.5,
                    );
                  }
                  if (states.contains(WidgetState.error)) {
                    return BorderSide(
                      color: colorScheme.error,
                      width: 2,
                    );
                  }
                  if (states.contains(WidgetState.pressed)) {
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
        'OutlinedButton FST23.2 custom-M2: GIVEN a custom '
        'FlexSubTheme.outlinedButtonTheme() '
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
            style: ButtonStyle(
              minimumSize:
                  ButtonStyleButton.allOrNull<Size>(const Size(52, 40)),
              padding: ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(
                  const EdgeInsets.symmetric(horizontal: 17)),
              shape: ButtonStyleButton.allOrNull<OutlinedBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(13),
                  ),
                ),
              ),
              foregroundColor: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.disabled)) {
                    return colorScheme.onSurface.withOpacity(0.38);
                  }
                  return colorScheme.primaryContainer;
                },
              ),
              overlayColor: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.hovered)) {
                    return colorScheme.primaryContainer.withOpacity(0.08);
                  }
                  if (states.contains(WidgetState.focused)) {
                    return colorScheme.primaryContainer.withOpacity(0.12);
                  }
                  if (states.contains(WidgetState.pressed)) {
                    return colorScheme.primaryContainer.withOpacity(0.12);
                  }
                  return Colors.transparent;
                },
              ),
              side: WidgetStateProperty.resolveWith<BorderSide?>(
                (final Set<WidgetState> states) {
                  if (states.contains(WidgetState.disabled)) {
                    return BorderSide(
                      color: colorScheme.secondaryContainer
                          .blendAlpha(colorScheme.onSurface, 0x66)
                          .withAlpha(0x26),
                      width: 1.5,
                    );
                  }
                  if (states.contains(WidgetState.error)) {
                    return BorderSide(
                      color: colorScheme.error,
                      width: 2,
                    );
                  }
                  if (states.contains(WidgetState.pressed)) {
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
        'OutlinedButton FST23.3 M3: GIVEN a default '
        'FlexSubTheme.outlinedButtonTheme() EXPECT '
        'equal to OutlinedButtonThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF7142E7),
        brightness: Brightness.light,
      );
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          const OutlinedButtonThemeData(
            style: ButtonStyle(),
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'OutlinedButton FST23.4 outline-M2: GIVEN a custom '
        'FlexSubTheme.outlinedButtonTheme() '
        'EXPECT '
        'equal to OutlinedButtonThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          outlineSchemeColor: SchemeColor.tertiary,
          useMaterial3: false,
        ).toString(),
        equalsIgnoringHashCodes(
          OutlinedButtonThemeData(
            style: ButtonStyle(
              minimumSize:
                  ButtonStyleButton.allOrNull<Size>(const Size(40, 40)),
              shape: ButtonStyleButton.allOrNull<OutlinedBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(40),
                  ),
                ),
              ),
              foregroundColor: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.disabled)) {
                    return FlexSubThemes.tintedDisable(
                        colorScheme.onSurface, colorScheme.secondary);
                  }
                  return colorScheme.secondary;
                },
              ),
              overlayColor: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.hovered)) {
                    return colorScheme.secondary.withOpacity(0.08);
                  }
                  if (states.contains(WidgetState.focused)) {
                    return colorScheme.secondary.withOpacity(0.12);
                  }
                  if (states.contains(WidgetState.pressed)) {
                    return colorScheme.secondary.withOpacity(0.12);
                  }
                  return Colors.transparent;
                },
              ),
              side: WidgetStateProperty.resolveWith<BorderSide?>(
                (final Set<WidgetState> states) {
                  if (states.contains(WidgetState.disabled)) {
                    return BorderSide(
                      color: colorScheme.tertiary
                          .blendAlpha(colorScheme.onSurface, 0x66)
                          .withAlpha(0x26),
                      width: 1.5,
                    );
                  }
                  if (states.contains(WidgetState.error)) {
                    return BorderSide(
                      color: colorScheme.error,
                      width: 2,
                    );
                  }
                  if (states.contains(WidgetState.pressed)) {
                    return BorderSide(
                      color: colorScheme.tertiary,
                      width: 2,
                    );
                  }
                  return BorderSide(
                    color: colorScheme.tertiary.withOpacity(0.12),
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
        'OutlinedButton FST23.5 outline-M3: GIVEN a custom '
        'FlexSubTheme.outlinedButtonTheme() '
        'EXPECT '
        'equal to OutlinedButtonThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF7142E7),
        brightness: Brightness.light,
      );
      final WidgetStateProperty<Color?> foregroundColor =
          WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return colorScheme.onSurface.withOpacity(0.38);
        }
        return colorScheme.secondary;
      });

      final WidgetStateProperty<Color?> overlayColor =
          WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.hovered)) {
          return colorScheme.secondary.withOpacity(0.08);
        }
        if (states.contains(WidgetState.focused)) {
          return colorScheme.secondary.withOpacity(0.12);
        }
        if (states.contains(WidgetState.pressed)) {
          return colorScheme.secondary.withOpacity(0.12);
        }
        return null;
      });

      final WidgetStateProperty<BorderSide?> side =
          WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return BorderSide(
            color: colorScheme.onSurface.withOpacity(0.12),
            width: 1,
          );
        }
        if (states.contains(WidgetState.error)) {
          return BorderSide(
            color: colorScheme.error,
            width: 1,
          );
        }
        if (states.contains(WidgetState.pressed)) {
          return BorderSide(
            color: colorScheme.tertiary,
            width: 1,
          );
        }
        return BorderSide(
          color: colorScheme.tertiary,
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
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          OutlinedButtonThemeData(
            style: ButtonStyle(
              foregroundColor: foregroundColor,
              overlayColor: overlayColor,
              minimumSize:
                  ButtonStyleButton.allOrNull<Size>(const Size(52, 40)),
              padding: ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(
                  const EdgeInsets.symmetric(horizontal: 17)),
              side: side,
              shape: ButtonStyleButton.allOrNull<OutlinedBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(13),
                  ),
                ),
              ),
            ),
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });

    test(
        'OutlinedButton FST23.6 states-M2: Does '
        'OutlinedButton have right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      final OutlinedButtonThemeData button = FlexSubThemes.outlinedButtonTheme(
        colorScheme: colorScheme,
        baseSchemeColor: SchemeColor.primary,
        useMaterial3: false,
      );
      // Disabled foreground
      expect(
        button.style!.foregroundColor!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(colorScheme.onSurface.withOpacity(0.38)),
      );
      expect(
        button.style!.foregroundColor!
            .resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.primary),
      );
      expect(
        button.style!.foregroundColor!.resolve(<WidgetState>{}),
        equals(colorScheme.primary),
      );
      // Overlay color states
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(colorScheme.primary.withOpacity(0.08)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        equals(colorScheme.primary.withOpacity(0.12)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(colorScheme.primary.withOpacity(0.12)),
      );
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primary,
        ).style!.overlayColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(null),
      );
      // Border side states
      expect(
        button.style!.side!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(BorderSide(
            color: colorScheme.onSurface.withOpacity(0.12), width: 1)),
      );
      expect(
        button.style!.side!.resolve(<WidgetState>{WidgetState.error}),
        equals(BorderSide(
          color: colorScheme.error,
          width: 2,
        )),
      );
      expect(
        button.style!.side!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(BorderSide(
          color: colorScheme.primary,
          width: 2,
        )),
      );
      expect(
        button.style!.side!.resolve(<WidgetState>{WidgetState.selected}),
        equals(BorderSide(
          color: colorScheme.primary,
          width: 1,
        )),
      );
    });
    test(
        'OutlinedButton FST23.7 states-custom-M2: Does '
        'OutlinedButton have right states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF42AEE7),
        brightness: Brightness.light,
      );
      final OutlinedButtonThemeData button = FlexSubThemes.outlinedButtonTheme(
        colorScheme: colorScheme,
        baseSchemeColor: SchemeColor.tertiary,
        outlineSchemeColor: SchemeColor.primaryContainer,
        useTintedDisable: true,
        useTintedInteraction: true,
        useMaterial3: false,
      );
      final Color overlay = colorScheme.surface;
      final Color tint = colorScheme.tertiary;
      // Disabled foreground
      expect(
        button.style!.foregroundColor!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(FlexSubThemes.tintedDisable(
            colorScheme.onSurface, colorScheme.tertiary)),
      );
      expect(
        button.style!.foregroundColor!
            .resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.tertiary),
      );
      // Overlay color states
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(FlexSubThemes.tintedHovered(overlay, tint, 5)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        equals(FlexSubThemes.tintedFocused(overlay, tint, 5)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(FlexSubThemes.tintedPressed(overlay, tint, 5)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<WidgetState>{WidgetState.selected}),
        equals(null),
      );
      // Border side states
      expect(
        button.style!.side!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(BorderSide(
            color: FlexSubThemes.tintedDisable(
                    colorScheme.onSurface, colorScheme.primaryContainer)
                .withAlpha(kAlphaLowDisabled),
            width: 1)),
      );
      expect(
        button.style!.side!.resolve(<WidgetState>{WidgetState.error}),
        equals(BorderSide(
          color: colorScheme.error,
          width: 2,
        )),
      );
      expect(
        button.style!.side!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(BorderSide(
          color: colorScheme.primaryContainer,
          width: 2,
        )),
      );
      expect(
        button.style!.side!.resolve(<WidgetState>{WidgetState.selected}),
        equals(BorderSide(
          color: colorScheme.primaryContainer,
          width: 1,
        )),
      );
    });
    test(
        'OutlinedButton FST23.8 states-M3: Does '
        'OutlinedButton have right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      final OutlinedButtonThemeData button = FlexSubThemes.outlinedButtonTheme(
        colorScheme: colorScheme,
        baseSchemeColor: SchemeColor.primary,
        outlineWidth: 1.0,
        useMaterial3: true,
      );
      // Disabled foreground
      expect(
        button.style!.foregroundColor!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(colorScheme.onSurface.withOpacity(0.38)),
      );
      expect(
        button.style!.foregroundColor!
            .resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.primary),
      );
      // Overlay color states
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(colorScheme.primary.withOpacity(0.08)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        equals(colorScheme.primary.withOpacity(0.12)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(colorScheme.primary.withOpacity(0.12)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<WidgetState>{WidgetState.selected}),
        equals(null),
      );
      // Border side states
      expect(
        button.style!.side!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(BorderSide(
            color: colorScheme.onSurface.withOpacity(0.12), width: 1.0)),
      );
      expect(
        button.style!.side!.resolve(<WidgetState>{WidgetState.error}),
        equals(BorderSide(
          color: colorScheme.error,
          width: 1.0,
        )),
      );
      expect(
        button.style!.side!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(BorderSide(
          color: colorScheme.outline,
          width: 1.0,
        )),
      );
      expect(
        button.style!.side!.resolve(<WidgetState>{WidgetState.selected}),
        equals(BorderSide(
          color: colorScheme.outline,
          width: 1.0,
        )),
      );
    });
    test(
        'OutlinedButton FST23.9 states-M3-custom: Does '
        'OutlinedButton have right material '
        'custom states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      final OutlinedButtonThemeData button = FlexSubThemes.outlinedButtonTheme(
        colorScheme: colorScheme,
        baseSchemeColor: SchemeColor.tertiary,
        outlineSchemeColor: SchemeColor.primaryContainer,
        outlineWidth: 2,
        pressedOutlineWidth: 3,
        radius: 10,
        useMaterial3: true,
      );
      // Disabled foreground
      expect(
        button.style!.foregroundColor!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(colorScheme.onSurface.withOpacity(0.38)),
      );
      expect(
        button.style!.foregroundColor!
            .resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.tertiary),
      );
      // Overlay color states
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(colorScheme.tertiary.withOpacity(0.08)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        equals(colorScheme.tertiary.withOpacity(0.12)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(colorScheme.tertiary.withOpacity(0.12)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<WidgetState>{WidgetState.selected}),
        equals(null),
      );
      // Border side states
      expect(
        button.style!.side!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(BorderSide(
          color: colorScheme.onSurface.withOpacity(0.12),
          width: 2.0,
        )),
      );
      expect(
        button.style!.side!.resolve(<WidgetState>{WidgetState.error}),
        equals(BorderSide(
          color: colorScheme.error,
          width: 3.0,
        )),
      );
      expect(
        button.style!.side!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(BorderSide(
          color: colorScheme.primaryContainer,
          width: 3.0,
        )),
      );
      expect(
        button.style!.side!.resolve(<WidgetState>{WidgetState.selected}),
        equals(BorderSide(
          color: colorScheme.primaryContainer,
          width: 2.0,
        )),
      );
      // Custom shape test
      expect(
        button.style!.shape!.resolve(<WidgetState>{}),
        equals(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      );
    });
  });
  group('WITH: FlexSubTheme.popupMenuTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes PopupMenu tests
    // -------------------------------------------------------------------------
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF42AEE7),
      brightness: Brightness.light,
    );
    test(
        'PopupMenu FST24.1: GIVEN a default FlexSubTheme.popupMenuTheme() '
        'EXPECT equal to PopupMenuThemeData() version with same values', () {
      expect(
        FlexSubThemes.popupMenuTheme(),
        equals(const PopupMenuThemeData()),
      );
    });
    test(
        'PopupMenu FST24.2 custom: GIVEN a custom FlexSubTheme.popupMenuTheme '
        'EXPECT equal to PopupMenuThemeData() version with same values', () {
      expect(
        FlexSubThemes.popupMenuTheme(
          colorScheme: colorScheme,
          backgroundSchemeColor: SchemeColor.primary,
          surfaceTintColor: Colors.transparent,
          elevation: 8,
          radius: 8,
        ).toString(minLevel: DiagnosticLevel.debug),
        equalsIgnoringHashCodes(
          PopupMenuThemeData(
            color: colorScheme.primary,
            surfaceTintColor: Colors.transparent,
            elevation: 8,
            textStyle: const TextStyle().apply(color: Colors.white),
            labelTextStyle:
                WidgetStateProperty.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return const TextStyle()
                    .apply(color: Colors.white.withAlpha(kAlphaDisabled));
              }
              return const TextStyle().apply(color: Colors.white);
            }),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ).toString(minLevel: DiagnosticLevel.debug),
        ),
      );
    });
    test(
        'PopupMenu FST24.3 custom: GIVEN a custom FlexSubTheme.popupMenuTheme '
        'EXPECT equal to PopupMenuThemeData() version with same values', () {
      final PopupMenuThemeData m = FlexSubThemes.popupMenuTheme(
        colorScheme: colorScheme,
        backgroundSchemeColor: SchemeColor.tertiary,
        foregroundSchemeColor: SchemeColor.tertiaryContainer,
        textStyle: const TextStyle(),
        surfaceTintColor: colorScheme.onTertiary,
        elevation: 9,
        radius: 9,
      );
      expect(
        m.textStyle,
        equals(TextStyle(color: colorScheme.tertiaryContainer)),
      );
      expect(
        m.labelTextStyle!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(TextStyle(
            color: colorScheme.tertiaryContainer.withAlpha(kAlphaDisabled))),
      );
      expect(
        m.labelTextStyle!.resolve(<WidgetState>{}),
        equals(TextStyle(color: colorScheme.tertiaryContainer)),
      );
    });
  });
  group('WITH: FlexSubTheme.radioTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes Radio tests
    // -------------------------------------------------------------------------
    test(
        'Radio FST25.1 light: GIVEN a light default FlexSubTheme.radioTheme() '
        'EXPECT equal to RadioThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      );
      expect(
        FlexSubThemes.radioTheme(colorScheme: colorScheme).toString(),
        equalsIgnoringHashCodes(
          RadioThemeData(
            fillColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.disabled)) {
                  return Colors.grey.shade400;
                }
                if (states.contains(WidgetState.selected)) {
                  return colorScheme.primary;
                }
                // Opinionated color on track when not selected
                return colorScheme.primary.withAlpha(0xDD);
              },
            ),
            overlayColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.selected)) {
                  if (states.contains(WidgetState.pressed)) {
                    return colorScheme.onSurface.withOpacity(0.12);
                  }
                  if (states.contains(WidgetState.hovered)) {
                    return colorScheme.primary.withOpacity(0.08);
                  }
                  if (states.contains(WidgetState.focused)) {
                    return colorScheme.primary.withOpacity(0.12);
                  }
                  return Colors.transparent;
                }
                if (states.contains(WidgetState.pressed)) {
                  return colorScheme.primary.withOpacity(0.12);
                }
                if (states.contains(WidgetState.hovered)) {
                  return colorScheme.onSurface.withOpacity(0.08);
                }
                if (states.contains(WidgetState.focused)) {
                  return colorScheme.onSurface.withOpacity(0.12);
                }
                return Colors.transparent;
              },
            ),
          ).toString(),
        ),
      );
    });
    test(
        'Radio FST25.2 light-states: Does Radio '
        'have right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      );
      // Disabled colors
      expect(
        FlexSubThemes.radioTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).fillColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(Colors.grey.shade400),
      );
      // Selected radio fill
      expect(
        FlexSubThemes.radioTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).fillColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.primary),
      );
      // Default states
      expect(
        FlexSubThemes.radioTheme(
          colorScheme: colorScheme,
          unselectedIsColored: true,
          useMaterial3: false,
        ).fillColor!.resolve(<WidgetState>{}),
        equals(colorScheme.primary.withAlpha(0xDD)),
      );
      // Default state for trackColor when unselectedIsColored, is false
      expect(
        FlexSubThemes.radioTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
          // unselectedIsColored: false,  <- False by default
        ).fillColor!.resolve(<WidgetState>{}),
        equals(Colors.black54),
      );
    });

    test(
        'Radio FST25.3 dark: GIVEN a dark default FlexSubTheme.radioTheme() '
        'EXPECT equal to RadioThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.dark,
      );
      expect(
        FlexSubThemes.radioTheme(colorScheme: colorScheme).toString(),
        equalsIgnoringHashCodes(
          RadioThemeData(
            fillColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.disabled)) {
                  return Colors.grey.shade800;
                }
                if (states.contains(WidgetState.selected)) {
                  return colorScheme.primary;
                }
                // Opinionated color on track when not selected
                return colorScheme.primary.withAlpha(0xDD);
              },
            ),
            overlayColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.selected)) {
                  if (states.contains(WidgetState.pressed)) {
                    return colorScheme.onSurface.withOpacity(0.12);
                  }
                  if (states.contains(WidgetState.hovered)) {
                    return colorScheme.primary.withOpacity(0.08);
                  }
                  if (states.contains(WidgetState.focused)) {
                    return colorScheme.primary.withOpacity(0.12);
                  }
                  return Colors.transparent;
                }
                if (states.contains(WidgetState.pressed)) {
                  return colorScheme.primary.withOpacity(0.12);
                }
                if (states.contains(WidgetState.hovered)) {
                  return colorScheme.onSurface.withOpacity(0.08);
                }
                if (states.contains(WidgetState.focused)) {
                  return colorScheme.onSurface.withOpacity(0.12);
                }
                return Colors.transparent;
              },
            ),
          ).toString(),
        ),
      );
    });
    test(
        'Radio FST25.4 dark-states: Does '
        'Radio have right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.dark,
      );
      // Disabled colors
      expect(
        FlexSubThemes.radioTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).fillColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(Colors.grey.shade800),
      );
      // Selected radio fill
      expect(
        FlexSubThemes.radioTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).fillColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.primary),
      );
      // Default states
      expect(
        FlexSubThemes.radioTheme(
          colorScheme: colorScheme,
          unselectedIsColored: true,
          useMaterial3: false,
        ).fillColor!.resolve(<WidgetState>{}),
        equals(colorScheme.primary.withAlpha(0xDD)),
      );
      // Default state for fillColor when unselectedIsColored, is false
      expect(
        FlexSubThemes.radioTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
          // unselectedIsColored: false, <- False by default
        ).fillColor!.resolve(<WidgetState>{}),
        equals(Colors.white70),
      );
    });
    test(
        'Radio FST25.5 custom-light: GIVEN a light custom '
        'FlexSubTheme.radioTheme() '
        'EXPECT equal to RadioThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      );
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
            fillColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.disabled)) {
                  return Colors.grey.shade400;
                }
                if (states.contains(WidgetState.selected)) {
                  return colorScheme.tertiary;
                }
                return Colors.black54;
              },
            ),
            overlayColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.selected)) {
                  if (states.contains(WidgetState.pressed)) {
                    return colorScheme.onSurface.withOpacity(0.12);
                  }
                  if (states.contains(WidgetState.hovered)) {
                    return colorScheme.primary.withOpacity(0.08);
                  }
                  if (states.contains(WidgetState.focused)) {
                    return colorScheme.primary.withOpacity(0.12);
                  }
                  return Colors.transparent;
                }
                if (states.contains(WidgetState.pressed)) {
                  return colorScheme.primary.withOpacity(0.12);
                }
                if (states.contains(WidgetState.hovered)) {
                  return colorScheme.onSurface.withOpacity(0.08);
                }
                if (states.contains(WidgetState.focused)) {
                  return colorScheme.onSurface.withOpacity(0.12);
                }
                return Colors.transparent;
              },
            ),
          ).toString(),
        ),
      );
      // M2 tinted disable case.
      RadioThemeData m = FlexSubThemes.radioTheme(
        colorScheme: colorScheme,
        baseSchemeColor: SchemeColor.tertiary,
        splashRadius: 30,
        unselectedIsColored: false,
        useTintedDisable: true,
        useMaterial3: false,
      );
      expect(
        m.fillColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(FlexSubThemes.tintedDisable(
            colorScheme.onSurface, colorScheme.tertiary)),
      );
      m = FlexSubThemes.radioTheme(
        colorScheme: colorScheme,
        baseSchemeColor: SchemeColor.tertiary,
        splashRadius: 25,
        unselectedIsColored: false,
        useTintedDisable: false,
        useMaterial3: true,
      );
      //
      // fillColor
      expect(
        m.fillColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.disabled}),
        equals(colorScheme.onSurface.withAlpha(kAlphaDisabled)),
      );
      expect(
        m.fillColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.pressed}),
        equals(colorScheme.tertiary),
      );
      expect(
        m.fillColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.hovered}),
        equals(colorScheme.tertiary),
      );
      expect(
        m.fillColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.focused}),
        equals(colorScheme.tertiary),
      );
      expect(
        m.fillColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.tertiary),
      );
      expect(
        m.fillColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(colorScheme.onSurface.withAlpha(kAlphaDisabled)),
      );
      expect(
        m.fillColor!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(colorScheme.onSurface),
      );
      expect(
        m.fillColor!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(colorScheme.onSurface),
      );
      expect(
        m.fillColor!.resolve(<WidgetState>{WidgetState.focused}),
        equals(colorScheme.onSurface),
      );
      expect(
        m.fillColor!.resolve(<WidgetState>{}),
        equals(colorScheme.onSurfaceVariant),
      );
      //
      // overlayColor
      expect(
        m.overlayColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.pressed}),
        equals(colorScheme.onSurface.withAlpha(kAlphaPressed)),
      );
      expect(
        m.overlayColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.hovered}),
        equals(colorScheme.tertiary.withAlpha(kAlphaHovered)),
      );
      expect(
        m.overlayColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.focused}),
        equals(colorScheme.tertiary.withAlpha(kAlphaFocused)),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(Colors.transparent),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(colorScheme.tertiary.withAlpha(kAlphaPressed)),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(colorScheme.onSurface.withAlpha(kAlphaHovered)),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        equals(colorScheme.onSurface.withAlpha(kAlphaFocused)),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{}),
        equals(Colors.transparent),
      );
      m = FlexSubThemes.radioTheme(
        colorScheme: colorScheme,
        baseSchemeColor: SchemeColor.tertiary,
        splashRadius: 25,
        unselectedIsColored: true,
        useTintedDisable: true,
        useTintedInteraction: true,
        useMaterial3: true,
      );
      //
      // fillColor
      expect(
        m.fillColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.disabled}),
        equals(
          FlexSubThemes.tintedDisable(
              colorScheme.onSurface, colorScheme.tertiary),
        ),
      );
      expect(
        m.fillColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(
          FlexSubThemes.tintedDisable(
              colorScheme.onSurface, colorScheme.tertiary),
        ),
      );
      expect(
        m.fillColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.pressed}),
        equals(colorScheme.tertiary),
      );
      expect(
        m.fillColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.hovered}),
        equals(colorScheme.tertiary),
      );
      expect(
        m.fillColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.focused}),
        equals(colorScheme.tertiary),
      );
      expect(
        m.fillColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.tertiary),
      );
      expect(
        m.fillColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(
          FlexSubThemes.tintedDisable(
              colorScheme.onSurface, colorScheme.tertiary),
        ),
      );
      expect(
        m.fillColor!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(colorScheme.tertiary.withAlpha(kAlphaUnselect)),
      );
      expect(
        m.fillColor!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(colorScheme.tertiary.withAlpha(kAlphaUnselect)),
      );
      expect(
        m.fillColor!.resolve(<WidgetState>{WidgetState.focused}),
        equals(colorScheme.tertiary.withAlpha(kAlphaUnselect)),
      );
      expect(
        m.fillColor!.resolve(<WidgetState>{}),
        equals(colorScheme.tertiary.withAlpha(kAlphaUnselect)),
      );
      //
      // overlayColor
      expect(
        m.overlayColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.pressed}),
        equals(FlexSubThemes.tintedPressed(
            colorScheme.surface, colorScheme.tertiary, 1.5)),
      );
      expect(
        m.overlayColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.hovered}),
        equals(FlexSubThemes.tintedHovered(
            colorScheme.surface, colorScheme.tertiary, 1.5)),
      );
      expect(
        m.overlayColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.focused}),
        equals(FlexSubThemes.tintedFocused(
            colorScheme.surface, colorScheme.tertiary, 1.5)),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(Colors.transparent),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(FlexSubThemes.tintedPressed(
            colorScheme.surface, colorScheme.tertiary, 1.5)),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(FlexSubThemes.tintedHovered(
            colorScheme.surface, colorScheme.tertiary, 1.5)),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        equals(FlexSubThemes.tintedFocused(
            colorScheme.surface, colorScheme.tertiary, 1.5)),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{}),
        equals(Colors.transparent),
      );
    });
  });
  group('WITH: FlexSubTheme.searchBarTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes searchBarTheme tests
    // -------------------------------------------------------------------------
    test(
        'SearchBar FST25SB.1: GIVEN a default FlexSubTheme.searchBarTheme() '
        'SearchBarThemeData with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      final SearchBarThemeData searchBarTheme = FlexSubThemes.searchBarTheme(
        colorScheme: colorScheme,
      );
      final SearchBarThemeData m = SearchBarThemeData(
        elevation: const WidgetStatePropertyAll<double?>(null),
        shadowColor: const WidgetStatePropertyAll<Color?>(null),
        padding: const WidgetStatePropertyAll<EdgeInsetsGeometry?>(null),
        overlayColor:
            WidgetStateProperty.resolveWith((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return colorScheme.onSurface.withAlpha(kAlphaUltraLowDisabled);
          }
          if (states.contains(WidgetState.pressed)) {
            return colorScheme.onSurface.withAlpha(kAlphaInputPressed);
          }
          if (states.contains(WidgetState.hovered)) {
            return colorScheme.onSurface.withAlpha(kAlphaHovered);
          }
          return Colors.transparent;
        }),
      );

      expect(
        searchBarTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          m.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
      //
      // overlayColor color
      expect(
        searchBarTheme.overlayColor
            ?.resolve(<WidgetState>{WidgetState.disabled}),
        equals(colorScheme.onSurface.withAlpha(kAlphaUltraLowDisabled)),
      );
      expect(
        searchBarTheme.overlayColor
            ?.resolve(<WidgetState>{WidgetState.pressed}),
        equals(colorScheme.onSurface.withAlpha(kAlphaInputPressed)),
      );
      expect(
        searchBarTheme.overlayColor
            ?.resolve(<WidgetState>{WidgetState.hovered}),
        equals(colorScheme.onSurface.withAlpha(kAlphaHovered)),
      );
      expect(
        searchBarTheme.overlayColor?.resolve(<WidgetState>{}),
        equals(Colors.transparent),
      );
    });
    test(
        'SearchBar FST25SB.2: GIVEN a custom FlexSubTheme.searchBarTheme() '
        'SearchBarThemeData with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );

      const bool tintDisable = true;
      const bool tintInteract = true;
      final SearchBarThemeData searchBarTheme = FlexSubThemes.searchBarTheme(
        colorScheme: colorScheme,
        backgroundSchemeColor: SchemeColor.surfaceContainer,
        shadowColor: colorScheme.shadow,
        elevation: 4,
        radius: 10,
        padding: const EdgeInsets.all(8),
        tintedDisabled: tintDisable,
        tintedInteractions: tintInteract,
        constraints: const BoxConstraints(
          minWidth: 400.0,
          maxWidth: 700.0,
          minHeight: 60.0,
        ),
      );

      final Color backgroundColor = colorScheme.surfaceContainer;
      final Color onBackgroundColor = colorScheme.onSurface;
      final bool isLight = colorScheme.brightness == Brightness.light;
      // Get brightness of the SearchBar background color.
      final bool buttonBgIsLight =
          ThemeData.estimateBrightnessForColor(backgroundColor) ==
              Brightness.light;
      // For tint color use the one that is more likely to give a colored effect
      final Color tint = isLight
          ? buttonBgIsLight
              ? onBackgroundColor
              : backgroundColor
          : buttonBgIsLight
              ? backgroundColor
              : onBackgroundColor;
      // The reverse color is used for overlay
      final Color overlay = isLight
          ? buttonBgIsLight
              ? backgroundColor
              : onBackgroundColor
          : buttonBgIsLight
              ? onBackgroundColor
              : backgroundColor;
      final bool surfaceMode =
          (isLight && buttonBgIsLight) || (!isLight && !buttonBgIsLight);
      final double factor =
          tintAlphaFactor(tint, colorScheme.brightness, surfaceMode);

      final SearchBarThemeData m = SearchBarThemeData(
        backgroundColor: WidgetStatePropertyAll<Color?>(backgroundColor),
        elevation: const WidgetStatePropertyAll<double?>(4),
        shadowColor: WidgetStatePropertyAll<Color?>(colorScheme.shadow),
        shape: const WidgetStatePropertyAll<OutlinedBorder?>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        padding: const WidgetStatePropertyAll<EdgeInsetsGeometry?>(
          EdgeInsets.all(8),
        ),
        constraints: const BoxConstraints(
          minWidth: 400.0,
          maxWidth: 700.0,
          minHeight: 60.0,
        ),
        overlayColor:
            WidgetStateProperty.resolveWith((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            if (tintDisable) {
              return FlexSubThemes.tintedDisable(
                      colorScheme.onSurface, backgroundColor)
                  .withAlpha(kAlphaUltraLowDisabled);
            }
          }
          if (states.contains(WidgetState.pressed)) {
            if (tintInteract) {
              return FlexSubThemes.tintedPressed(backgroundColor, tint, factor);
            }
          }
          if (states.contains(WidgetState.hovered)) {
            if (tintInteract) {
              return FlexSubThemes.tintedHovered(overlay, tint, factor);
            }
          }
          return Colors.transparent;
        }),
      );
      expect(
        searchBarTheme.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          m.toString(minLevel: DiagnosticLevel.fine),
        ),
      );
      //
      // overlayColor color
      expect(
        searchBarTheme.overlayColor
            ?.resolve(<WidgetState>{WidgetState.disabled}),
        equals(
            FlexSubThemes.tintedDisable(colorScheme.onSurface, backgroundColor)
                .withAlpha(kAlphaUltraLowDisabled)),
      );
      expect(
        searchBarTheme.overlayColor
            ?.resolve(<WidgetState>{WidgetState.pressed}),
        equals(FlexSubThemes.tintedPressed(backgroundColor, tint, factor)),
      );
      expect(
        searchBarTheme.overlayColor
            ?.resolve(<WidgetState>{WidgetState.hovered}),
        equals(FlexSubThemes.tintedHovered(overlay, tint, factor)),
      );
      expect(
        searchBarTheme.overlayColor?.resolve(<WidgetState>{}),
        equals(Colors.transparent),
      );
    });
  });
  group('WITH: FlexSubTheme.searchViewTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes searchViewTheme tests
    // -------------------------------------------------------------------------
    test(
        'SearchView FST25SV.1: GIVEN a default FlexSubTheme.searchViewTheme() '
        'SearchViewThemeData with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      final SearchViewThemeData listTheme = FlexSubThemes.searchViewTheme(
        colorScheme: colorScheme,
      );
      expect(
        listTheme,
        equals(
          SearchViewThemeData(
            backgroundColor: colorScheme.surfaceContainerHigh,
          ),
        ),
      );
    });
    test(
        'SearchView FST25SV.2: GIVEN a custom FlexSubTheme.searchViewTheme() '
        'SearchViewThemeData with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      final SearchViewThemeData searchTheme = FlexSubThemes.searchViewTheme(
        colorScheme: colorScheme,
        backgroundSchemeColor: SchemeColor.surfaceContainer,
        elevation: 4,
        radius: 10,
        headerHeight: 50,
        dividerColor: colorScheme.onSurface,
        constraints: const BoxConstraints(minWidth: 400.0, minHeight: 500.0),
      );
      expect(
        searchTheme,
        equals(
          SearchViewThemeData(
            backgroundColor: colorScheme.surfaceContainer,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            headerHeight: 50,
            elevation: 4,
            dividerColor: colorScheme.onSurface,
            constraints: const BoxConstraints(
              minWidth: 400.0,
              minHeight: 500.0,
            ),
          ),
        ),
      );
    });
  });
  group('WITH: FlexSubTheme.segmentedButtonTheme ', () {
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
      expect(
        m.style?.padding?.resolve(<WidgetState>{}),
        equals(null),
      );
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
      expect(
        m.style?.backgroundColor?.resolve(<WidgetState>{}),
        equals(null),
      );
      //
      // foregroundColor color
      expect(
        m.style?.foregroundColor?.resolve(<WidgetState>{WidgetState.disabled}),
        equals(colorScheme.onSurface.withAlpha(kAlphaDisabled)),
      );
      expect(
        m.style?.foregroundColor
            ?.resolve(<WidgetState>{WidgetState.selected, WidgetState.pressed}),
        equals(colorScheme.onPrimary),
      );
      expect(
        m.style?.foregroundColor
            ?.resolve(<WidgetState>{WidgetState.selected, WidgetState.hovered}),
        equals(colorScheme.onPrimary),
      );
      expect(
        m.style?.foregroundColor
            ?.resolve(<WidgetState>{WidgetState.selected, WidgetState.focused}),
        equals(colorScheme.onPrimary),
      );
      expect(
        m.style?.foregroundColor?.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.onPrimary),
      );
      expect(
        m.style?.foregroundColor?.resolve(<WidgetState>{}),
        equals(colorScheme.onSurface),
      );
      //
      // overlayColor color
      expect(
        m.style?.overlayColor
            ?.resolve(<WidgetState>{WidgetState.selected, WidgetState.hovered}),
        equals(colorScheme.surface.withAlpha(kAlphaHovered)),
      );
      expect(
        m.style?.overlayColor
            ?.resolve(<WidgetState>{WidgetState.selected, WidgetState.focused}),
        equals(colorScheme.surface.withAlpha(kAlphaFocused)),
      );
      expect(
        m.style?.overlayColor
            ?.resolve(<WidgetState>{WidgetState.selected, WidgetState.pressed}),
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
      expect(
        m.style?.overlayColor?.resolve(<WidgetState>{}),
        equals(null),
      );
      //
      // side
      expect(
        m.style?.side?.resolve(<WidgetState>{WidgetState.disabled}),
        equals(BorderSide(
          color: colorScheme.onSurface.withAlpha(kAlphaVeryLowDisabled),
          width: 2,
        )),
      );
      expect(
        m.style?.side?.resolve(<WidgetState>{}),
        equals(BorderSide(
          color: colorScheme.primary,
          width: 2,
        )),
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
        equals(FlexSubThemes.tintedDisable(
            colorScheme.onSurface, colorScheme.secondaryContainer)),
      );
      //
      // overlayColor color
      expect(
        m.style?.overlayColor
            ?.resolve(<WidgetState>{WidgetState.selected, WidgetState.hovered}),
        equals(FlexSubThemes.tintedHovered(colorScheme.onSecondaryContainer,
            colorScheme.secondaryContainer, 4.0)),
      );
      expect(
        m.style?.overlayColor
            ?.resolve(<WidgetState>{WidgetState.selected, WidgetState.focused}),
        equals(FlexSubThemes.tintedFocused(colorScheme.onSecondaryContainer,
            colorScheme.secondaryContainer, 4.0)),
      );
      expect(
        m.style?.overlayColor
            ?.resolve(<WidgetState>{WidgetState.selected, WidgetState.pressed}),
        equals(FlexSubThemes.tintedPressed(colorScheme.onSecondaryContainer,
            colorScheme.secondaryContainer, 4.0)),
      );
      expect(
        m.style?.overlayColor?.resolve(<WidgetState>{WidgetState.hovered}),
        equals(FlexSubThemes.tintedHovered(
            colorScheme.surface, colorScheme.secondaryContainer, 4.0)),
      );
      expect(
        m.style?.overlayColor?.resolve(<WidgetState>{WidgetState.focused}),
        equals(FlexSubThemes.tintedFocused(
            colorScheme.surface, colorScheme.secondaryContainer, 4.0)),
      );
      expect(
        m.style?.overlayColor?.resolve(<WidgetState>{WidgetState.pressed}),
        equals(FlexSubThemes.tintedPressed(
            colorScheme.surface, colorScheme.secondaryContainer, 4.0)),
      );
      expect(
        m.style?.overlayColor?.resolve(<WidgetState>{}),
        equals(null),
      );
      // side
      expect(
        m.style?.side?.resolve(<WidgetState>{WidgetState.disabled}),
        equals(BorderSide(
          color: FlexSubThemes.tintedDisable(
                  colorScheme.onSurface, colorScheme.secondaryContainer)
              .withAlpha(kAlphaLowDisabled),
          width: 1,
        )),
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
      //
      // overlayColor color
      expect(
        m.style?.overlayColor
            ?.resolve(<WidgetState>{WidgetState.selected, WidgetState.hovered}),
        equals(colorScheme.primaryContainer.withAlpha(kAlphaHovered)),
      );
      expect(
        m.style?.overlayColor
            ?.resolve(<WidgetState>{WidgetState.selected, WidgetState.focused}),
        equals(colorScheme.primaryContainer.withAlpha(kAlphaFocused)),
      );
      expect(
        m.style?.overlayColor
            ?.resolve(<WidgetState>{WidgetState.selected, WidgetState.pressed}),
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
      expect(
        m.style?.overlayColor?.resolve(<WidgetState>{}),
        equals(null),
      );
      expect(
        m.style?.side?.resolve(<WidgetState>{}),
        equals(BorderSide(
          color: colorScheme.primaryContainer,
          width: 1,
        )),
      );
    });
  });
  group('WITH: FlexSubTheme.sliderTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes Slider tests
    // -------------------------------------------------------------------------
    test(
        'Slider FST27.1 light: GIVEN a light default '
        'FlexSubTheme.sliderTheme() '
        'EXPECT equal to SliderThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.sliderTheme(colorScheme: colorScheme)
            .toString(minLevel: DiagnosticLevel.debug),
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
            valueIndicatorShape: DropSliderValueIndicatorShape(),
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
            valueIndicatorShape: DropSliderValueIndicatorShape(),
            rangeValueIndicatorShape: PaddleRangeSliderValueIndicatorShape(),
            valueIndicatorTextStyle:
                TextStyle(inherit: true, color: Color(0x1fffffff)),
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
        equals(const DropSliderValueIndicatorShape()),
      );
      expect(
        m.rangeValueIndicatorShape,
        equals(const PaddleRangeSliderValueIndicatorShape()),
      );
      expect(
        (m.overlayColor as WidgetStateColor?)!
            .resolve(<WidgetState>{WidgetState.hovered}),
        equals(colorScheme.primary.withAlpha(kAlphaHovered)),
      );
      expect(
        (m.overlayColor as WidgetStateColor?)!
            .resolve(<WidgetState>{WidgetState.focused}),
        equals(colorScheme.primary.withAlpha(kAlphaFocused)),
      );
      expect(
        (m.overlayColor as WidgetStateColor?)!
            .resolve(<WidgetState>{WidgetState.dragged}),
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
        equals(null),
      );
      expect(
        (m.overlayColor as WidgetStateColor?)!
            .resolve(<WidgetState>{WidgetState.hovered}),
        equals(FlexSubThemes.tintedHovered(
            colorScheme.surface, colorScheme.primary, 1.5)),
      );
      expect(
        (m.overlayColor as WidgetStateColor?)!
            .resolve(<WidgetState>{WidgetState.focused}),
        equals(FlexSubThemes.tintedFocused(
            colorScheme.surface, colorScheme.primary, 1.5)),
      );
      expect(
        (m.overlayColor as WidgetStateColor?)!
            .resolve(<WidgetState>{WidgetState.dragged}),
        equals(FlexSubThemes.tintedFocused(
            colorScheme.surface, colorScheme.primary, 1.5)),
      );
      expect(
        (m.overlayColor as WidgetStateColor?)!.resolve(<WidgetState>{}),
        equals(Colors.transparent),
      );
      m = FlexSubThemes.sliderTheme(
        colorScheme: colorScheme,
        valueIndicatorType: FlexSliderIndicatorType.drop,
        useTintedDisable: true,
        useTintedInteraction: true,
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
    });
  });
  group('WITH: FlexSubTheme.snackBarTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes SnackBar tests
    // -------------------------------------------------------------------------
    test(
        'SnackBar FST28.1: GIVEN a default FlexSubTheme.snackBarTheme '
        'EXPECT equal to SnackBarThemeData() version '
        'with same values', () {
      expect(
        FlexSubThemes.snackBarTheme().toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          SnackBarThemeData(
            elevation: 4,
            actionTextColor: Colors.grey[500],
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'SnackBar FST28.2 background-based-a: GIVEN a '
        'FlexSubTheme.snackBarTheme with '
        'colorScheme, but with backgroundSchemeColor and backgroundColor '
        'EXPECT equal to SnackBarThemeData with backgroundColor', () {
      expect(
        FlexSubThemes.snackBarTheme(
          elevation: 10,
          colorScheme: null,
          backgroundColor: const Color(0xFF343476),
          backgroundSchemeColor: SchemeColor.tertiary,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          SnackBarThemeData(
            backgroundColor: const Color(0xFF343476),
            elevation: 10,
            contentTextStyle: ThemeData().textTheme.titleMedium!.copyWith(
                  color: Colors.white,
                ),
            actionTextColor: Colors.white.withAlpha(0xDD),
            disabledActionTextColor: Colors.white.withAlpha(0x11),
            closeIconColor: Colors.white.withAlpha(0xAA),
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'SnackBar FST28.3 background-based-b: GIVEN a '
        'FlexSubTheme.snackBarTheme with '
        'no colorScheme, no backgroundSchemeColor, but with backgroundColor '
        'EXPECT equal to SnackBarThemeData with backgroundColor', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.snackBarTheme(
          elevation: 5,
          colorScheme: colorScheme,
          backgroundColor: const Color(0xFFBBC2D5),
          backgroundSchemeColor: null,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          SnackBarThemeData(
            backgroundColor: const Color(0xFFBBC2D5),
            elevation: 5,
            contentTextStyle: ThemeData().textTheme.titleMedium!.copyWith(
                  color: Colors.black,
                ),
            actionTextColor: colorScheme.inversePrimary,
            disabledActionTextColor: colorScheme.inversePrimary.withAlpha(0x11),
            closeIconColor: Colors.black.withAlpha(0xAA),
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'SnackBar FST28.4 scheme-based: GIVEN a '
        'FlexSubTheme.snackBarTheme with '
        'colorScheme, backgroundSchemeColor and backgroundColor '
        'EXPECT equal to SnackBarThemeData with scheme color.', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.snackBarTheme(
          elevation: 0,
          colorScheme: colorScheme,
          backgroundColor: const Color(0xFF763370),
          backgroundSchemeColor: SchemeColor.error,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          SnackBarThemeData(
            backgroundColor: colorScheme.error,
            elevation: 0,
            contentTextStyle: ThemeData().textTheme.titleMedium!.copyWith(
                  color: colorScheme.onError,
                ),
            actionTextColor: colorScheme.inversePrimary,
            disabledActionTextColor: colorScheme.inversePrimary.withAlpha(0x11),
            closeIconColor: colorScheme.onError.withAlpha(0xAA),
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'SnackBar FST28.5 scheme-based: GIVEN a '
        'FlexSubTheme.snackBarTheme with '
        'colorScheme, backgroundSchemeColor and backgroundColor and '
        'actionTextSchemeColor'
        'EXPECT equal to SnackBarThemeData with scheme colors.', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.snackBarTheme(
          elevation: 0,
          colorScheme: colorScheme,
          backgroundColor: const Color(0xFF763370),
          backgroundSchemeColor: SchemeColor.error,
          actionTextSchemeColor: SchemeColor.tertiary,
          radius: 7,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          SnackBarThemeData(
            backgroundColor: colorScheme.error,
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(7),
              ),
            ),
            contentTextStyle: ThemeData().textTheme.titleMedium!.copyWith(
                  color: colorScheme.onError,
                ),
            actionTextColor: colorScheme.tertiary,
            disabledActionTextColor: colorScheme.tertiary.withAlpha(0x11),
            closeIconColor: colorScheme.onError.withAlpha(0xAA),
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'SnackBar FST28.6 scheme-based: GIVEN a '
        'FlexSubTheme.snackBarTheme with '
        'colorScheme, backgroundSchemeColor and backgroundColor and '
        'actionTextSchemeColor and content '
        'EXPECT equal to SnackBarThemeData with scheme colors.', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.snackBarTheme(
          elevation: 0,
          colorScheme: colorScheme,
          backgroundColor: const Color(0xFF763370),
          backgroundSchemeColor: SchemeColor.error,
          actionTextSchemeColor: SchemeColor.tertiary,
          contentTextStyle: const TextStyle(fontSize: 14, color: Colors.red),
          radius: 7,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          SnackBarThemeData(
            backgroundColor: colorScheme.error,
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(7),
              ),
            ),
            contentTextStyle:
                TextStyle(fontSize: 14, color: colorScheme.onError),
            actionTextColor: colorScheme.tertiary,
            disabledActionTextColor: colorScheme.tertiary.withAlpha(0x11),
            closeIconColor: colorScheme.onError.withAlpha(0xAA),
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
  });
  group('WITH: FlexSubTheme.switchTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes Switch tests
    // -------------------------------------------------------------------------
    test(
        'Switch FST29.1 light: GIVEN a light default M2 '
        'FlexSubTheme.switchTheme() '
        'EXPECT equal to SwitchThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).toString(),
        equalsIgnoringHashCodes(
          SwitchThemeData(
            thumbColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.disabled)) {
                  return Colors.grey.shade400;
                }
                if (states.contains(WidgetState.selected)) {
                  return colorScheme.primary;
                }
                return Colors.grey.shade50;
              },
            ),
            trackColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.disabled)) {
                  return Colors.black12;
                }
                if (states.contains(WidgetState.selected)) {
                  return colorScheme.primary.withAlpha(0x70);
                }
                // Opinionated color on track when not selected
                return colorScheme.primary.withAlpha(0x30);
              },
            ),
            overlayColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.selected)) {
                  if (states.contains(WidgetState.pressed)) {
                    return colorScheme.primary.withOpacity(0.12);
                  }
                  if (states.contains(WidgetState.hovered)) {
                    return colorScheme.primary.withOpacity(0.08);
                  }
                  if (states.contains(WidgetState.focused)) {
                    return colorScheme.primary.withOpacity(0.12);
                  }
                  return null;
                }
                if (states.contains(WidgetState.pressed)) {
                  return colorScheme.onSurface.withOpacity(0.12);
                }
                if (states.contains(WidgetState.hovered)) {
                  return colorScheme.onSurface.withOpacity(0.08);
                }
                if (states.contains(WidgetState.focused)) {
                  return colorScheme.onSurface.withOpacity(0.12);
                }
                return null;
              },
            ),
          ).toString(),
        ),
      );
    });
    test(
        'Switch FST29.2 light-states: Does Switch have right '
        'M2 material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      );
      // Disabled colors
      // Disabled thumb colors
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).thumbColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(Colors.grey.shade400),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        )
            .thumbColor!
            .resolve(<WidgetState>{WidgetState.disabled, WidgetState.selected}),
        equals(Colors.grey.shade400),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useTintedDisable: true,
          useMaterial3: false,
        )
            .thumbColor!
            .resolve(<WidgetState>{WidgetState.disabled, WidgetState.selected}),
        equals(
          FlexSubThemes.tintedDisable(
              colorScheme.onSurface, colorScheme.primary),
        ),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useTintedDisable: true,
          useMaterial3: false,
        ).thumbColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(
          FlexSubThemes.tintedDisable(
                  colorScheme.onSurface, colorScheme.primary)
              .withAlpha(kAlphaLowDisabled),
        ),
      );
      // Disabled track colors
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useTintedDisable: true,
          useMaterial3: false,
        ).trackColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(
          FlexSubThemes.tintedDisable(
                  colorScheme.onSurface, colorScheme.primary)
              .withAlpha(kAlphaVeryLowDisabled),
        ),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).trackColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(Colors.black12),
      );
      // Selected background
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).thumbColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.primary),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).trackColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.primary.withAlpha(0x70)),
      );
      // Interaction states - Using test with Opacity based SDK values on
      // purpose, to confirm results match alpha based ones used by FCS.
      // Non tinted interactions
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(colorScheme.onSurface.withOpacity(0.12)),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(colorScheme.onSurface.withOpacity(0.08)),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        equals(colorScheme.onSurface.withOpacity(0.12)),
      );
      // Non tinted interactions - selected
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        )
            .overlayColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.pressed}),
        equals(colorScheme.primary.withOpacity(0.12)),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        )
            .overlayColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.hovered}),
        equals(colorScheme.primary.withOpacity(0.08)),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        )
            .overlayColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.focused}),
        equals(colorScheme.primary.withOpacity(0.12)),
      );
      // Tinted interactions
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useTintedInteraction: true,
          useMaterial3: false,
        ).overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(FlexSubThemes.tintedPressed(
            colorScheme.surface, colorScheme.primary, 1.5)),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useTintedInteraction: true,
          useMaterial3: false,
        ).overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(FlexSubThemes.tintedHovered(
            colorScheme.surface, colorScheme.primary, 1.5)),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useTintedInteraction: true,
          useMaterial3: false,
        ).overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        equals(FlexSubThemes.tintedFocused(
            colorScheme.surface, colorScheme.primary, 1.5)),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useTintedInteraction: true,
          useMaterial3: false,
        )
            .overlayColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.pressed}),
        equals(FlexSubThemes.tintedPressed(
            colorScheme.surface, colorScheme.primary, 1.5)),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useTintedInteraction: true,
          useMaterial3: false,
        )
            .overlayColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.hovered}),
        equals(FlexSubThemes.tintedHovered(
            colorScheme.surface, colorScheme.primary, 1.5)),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useTintedInteraction: true,
          useMaterial3: false,
        )
            .overlayColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.focused}),
        equals(FlexSubThemes.tintedFocused(
            colorScheme.surface, colorScheme.primary, 1.5)),
      );

      // Default states
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).thumbColor!.resolve(<WidgetState>{}),
        equals(Colors.grey.shade50),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          unselectedIsColored: true,
          useMaterial3: false,
        ).trackColor!.resolve(<WidgetState>{}),
        equals(colorScheme.primary.withAlpha(0x50)),
      );
      // Default state for trackColor when unselectedIsColored, is false
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          unselectedIsColored: false,
          useMaterial3: false,
        ).trackColor!.resolve(<WidgetState>{}),
        equals(kSwitchM2LightTrackColor),
      );
    });

    test(
        'Switch FST29.3 dark: GIVEN a dark default FlexSubTheme.switchTheme() '
        'EXPECT equal to SwitchThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.dark,
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          unselectedIsColored: true,
          useMaterial3: false,
        ).toString(),
        equalsIgnoringHashCodes(
          SwitchThemeData(
            thumbColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.disabled)) {
                  return Colors.grey.shade800;
                }
                if (states.contains(WidgetState.selected)) {
                  return colorScheme.secondary;
                }
                return Colors.grey.shade400;
              },
            ),
            trackColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.disabled)) {
                  return Colors.white10;
                }
                if (states.contains(WidgetState.selected)) {
                  return colorScheme.secondary.withAlpha(0x70);
                }
                // Opinionated color on track when not selected
                return colorScheme.secondary.withAlpha(0x25);
              },
            ),
            overlayColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.selected)) {
                  if (states.contains(WidgetState.pressed)) {
                    return colorScheme.primary.withOpacity(0.12);
                  }
                  if (states.contains(WidgetState.hovered)) {
                    return colorScheme.primary.withOpacity(0.08);
                  }
                  if (states.contains(WidgetState.focused)) {
                    return colorScheme.primary.withOpacity(0.12);
                  }
                  return null;
                }
                if (states.contains(WidgetState.pressed)) {
                  return colorScheme.onSurface.withOpacity(0.12);
                }
                if (states.contains(WidgetState.hovered)) {
                  return colorScheme.onSurface.withOpacity(0.08);
                }
                if (states.contains(WidgetState.focused)) {
                  return colorScheme.onSurface.withOpacity(0.12);
                }
                return null;
              },
            ),
          ).toString(),
        ),
      );
    });
    test(
        'Switch FST29.4 dark-states: Does Switch have right '
        'M2 material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.dark,
      );
      // Disabled colors
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).thumbColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(Colors.grey.shade800),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        )
            .thumbColor!
            .resolve(<WidgetState>{WidgetState.disabled, WidgetState.selected}),
        equals(Colors.grey.shade800),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useTintedDisable: true,
          useMaterial3: false,
        )
            .thumbColor!
            .resolve(<WidgetState>{WidgetState.disabled, WidgetState.selected}),
        equals(
          FlexSubThemes.tintedDisable(
              colorScheme.onSurface, colorScheme.primary),
        ),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useTintedDisable: true,
          useMaterial3: false,
        ).thumbColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(
          FlexSubThemes.tintedDisable(
                  colorScheme.onSurface, colorScheme.primary)
              .withAlpha(kAlphaLowDisabled),
        ),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).trackColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(Colors.white10),
      );
      // Selected background
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).thumbColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.primary),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).trackColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.primary.withAlpha(0x80)),
      );
      // Default states
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).thumbColor!.resolve(<WidgetState>{}),
        equals(Colors.grey.shade400),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          unselectedIsColored: true,
          useMaterial3: false,
        ).trackColor!.resolve(<WidgetState>{}),
        equals(colorScheme.primary.withAlpha(0x65)),
      );
      // Default state for trackColor when unselectedIsColored, is false
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          unselectedIsColored: false,
          useMaterial3: false,
        ).trackColor!.resolve(<WidgetState>{}),
        equals(Colors.white30),
      );
    });
    test(
        'Switch FST29.5 custom-light: GIVEN a light custom '
        'FlexSubTheme.switchTheme() '
        'EXPECT equal to SwitchThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          splashRadius: 30,
          unselectedIsColored: true,
          useMaterial3: false,
        ).toString(),
        equalsIgnoringHashCodes(
          SwitchThemeData(
            splashRadius: 30,
            thumbColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.disabled)) {
                  return Colors.grey.shade400;
                }
                if (states.contains(WidgetState.selected)) {
                  return colorScheme.tertiary;
                }
                return Colors.grey.shade50;
              },
            ),
            trackColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.disabled)) {
                  return Colors.black12;
                }
                if (states.contains(WidgetState.selected)) {
                  return colorScheme.tertiary.withAlpha(0x70);
                }
                // Opinionated color on track when not selected
                return colorScheme.tertiary.withAlpha(0x30);
              },
            ),
            overlayColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.selected)) {
                  if (states.contains(WidgetState.pressed)) {
                    return colorScheme.primary.withOpacity(0.12);
                  }
                  if (states.contains(WidgetState.hovered)) {
                    return colorScheme.primary.withOpacity(0.08);
                  }
                  if (states.contains(WidgetState.focused)) {
                    return colorScheme.primary.withOpacity(0.12);
                  }
                  return null;
                }
                if (states.contains(WidgetState.pressed)) {
                  return colorScheme.onSurface.withOpacity(0.12);
                }
                if (states.contains(WidgetState.hovered)) {
                  return colorScheme.onSurface.withOpacity(0.08);
                }
                if (states.contains(WidgetState.focused)) {
                  return colorScheme.onSurface.withOpacity(0.12);
                }
                return null;
              },
            ),
          ).toString(),
        ),
      );
    });
    test(
        'Switch FST29.6 light-M3-states: '
        'Does Switch have right M3 states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      );
      final SwitchThemeData switchTheme = FlexSubThemes.switchTheme(
        colorScheme: colorScheme,
        useMaterial3: true,
      );
      // Thumb Icons - no icon
      Icon? icon = FlexSubThemes.switchTheme(
        colorScheme: colorScheme,
        useMaterial3: true,
      ).thumbIcon?.resolve(<WidgetState>{});
      expect(
        icon,
        equals(null),
      );
      icon = FlexSubThemes.switchTheme(
        colorScheme: colorScheme,
        thumbFixedSize: false,
        useMaterial3: true,
      ).thumbIcon?.resolve(<WidgetState>{});
      expect(
        icon,
        equals(null),
      );
      // Thumb Icons - has hidden icon for fixed size thumb effect.
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          thumbFixedSize: true,
          useMaterial3: true,
        ).thumbIcon!.resolve(<WidgetState>{})!.icon,
        equals(Icons.minimize),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          thumbFixedSize: true,
          useMaterial3: true,
        ).thumbIcon!.resolve(<WidgetState>{})!.color,
        equals(Colors.transparent),
      );
      // Disabled thumb colors
      expect(
        switchTheme.thumbColor!
            .resolve(<WidgetState>{WidgetState.disabled, WidgetState.selected}),
        equals(colorScheme.surface),
      );
      expect(
        switchTheme.thumbColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(colorScheme.onSurface.withOpacity(0.38)),
      );
      expect(
        switchTheme.trackOutlineColor!.resolve(<WidgetState>{}),
        equals(colorScheme.outline),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useTintedDisable: true,
          useMaterial3: true,
        ).thumbColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(
          FlexSubThemes.tintedDisable(
              colorScheme.onSurface, colorScheme.primary),
        ),
      );
      // Disabled track colors
      expect(
        switchTheme.trackColor!
            .resolve(<WidgetState>{WidgetState.disabled, WidgetState.selected}),
        equals(colorScheme.onSurface.withOpacity(0.12)),
      );
      expect(
        switchTheme.trackColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(colorScheme.surfaceContainerHighest.withOpacity(0.12)),
      );
      expect(
        switchTheme.trackOutlineColor!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(colorScheme.onSurface.withOpacity(0.12)),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useTintedDisable: true,
          useMaterial3: true,
        )
            .trackColor!
            .resolve(<WidgetState>{WidgetState.disabled, WidgetState.selected}),
        equals(
          FlexSubThemes.tintedDisable(
              colorScheme.onSurface, colorScheme.primary),
        ),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useTintedDisable: true,
          useMaterial3: true,
        ).trackOutlineColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(
          FlexSubThemes.tintedDisable(
              colorScheme.onSurface, colorScheme.primary),
        ),
      );

      // Selected thumb colors
      expect(
        switchTheme.thumbColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.pressed}),
        equals(colorScheme.primaryContainer),
      );
      expect(
        switchTheme.thumbColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.hovered}),
        equals(colorScheme.primaryContainer),
      );
      expect(
        switchTheme.thumbColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.focused}),
        equals(colorScheme.primaryContainer),
      );
      expect(
        switchTheme.thumbColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.onPrimary),
      );
      // Selected track color
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).trackColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.primary.withAlpha(0x70)),
      );
      // Pressed color
      expect(
        switchTheme.thumbColor!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(colorScheme.onSurfaceVariant),
      );
      // Hovered color
      expect(
        switchTheme.thumbColor!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(colorScheme.onSurfaceVariant),
      );
      // Focused color
      expect(
        switchTheme.thumbColor!.resolve(<WidgetState>{WidgetState.focused}),
        equals(colorScheme.onSurfaceVariant),
      );

      // Interaction states - Using test with Opacity based SDK values on
      // purpose, to confirm results match alpha based ones used by FCS.
      // Non tinted interactions
      // Overlay colors
      expect(
        switchTheme.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(colorScheme.onSurface.withOpacity(0.12)),
      );
      expect(
        switchTheme.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(colorScheme.onSurface.withOpacity(0.08)),
      );
      expect(
        switchTheme.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        equals(colorScheme.onSurface.withOpacity(0.12)),
      );
      // trackColor
      expect(
        switchTheme.trackColor!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(colorScheme.surfaceContainerHighest),
      );
      expect(
        switchTheme.trackColor!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(colorScheme.surfaceContainerHighest),
      );
      expect(
        switchTheme.trackColor!.resolve(<WidgetState>{WidgetState.focused}),
        equals(colorScheme.surfaceContainerHighest),
      );
      expect(
        switchTheme.trackColor!.resolve(<WidgetState>{}),
        equals(colorScheme.surfaceContainerHighest),
      );

      expect(
        switchTheme.trackColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.pressed}),
        equals(colorScheme.primary),
      );
      expect(
        switchTheme.trackColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.hovered}),
        equals(colorScheme.primary),
      );
      expect(
        switchTheme.trackColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.focused}),
        equals(colorScheme.primary),
      );
      // Non tinted interactions - selected
      expect(
        switchTheme.overlayColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.pressed}),
        equals(colorScheme.primary.withOpacity(0.12)),
      );
      expect(
        switchTheme.overlayColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.hovered}),
        equals(colorScheme.primary.withOpacity(0.08)),
      );
      expect(
        switchTheme.overlayColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.focused}),
        equals(colorScheme.primary.withOpacity(0.12)),
      );
      expect(
        switchTheme.trackColor!.resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.primary),
      );
      // Tinted interactions
      // Overlay color
      expect(
        FlexSubThemes.switchTheme(
                colorScheme: colorScheme,
                useTintedInteraction: true,
                useMaterial3: true)
            .overlayColor!
            .resolve(<WidgetState>{WidgetState.pressed}),
        equals(FlexSubThemes.tintedPressed(
            colorScheme.surface, colorScheme.primary, 1.5)),
      );
      expect(
        FlexSubThemes.switchTheme(
                colorScheme: colorScheme,
                useTintedInteraction: true,
                useMaterial3: true)
            .overlayColor!
            .resolve(<WidgetState>{WidgetState.hovered}),
        equals(FlexSubThemes.tintedHovered(
            colorScheme.surface, colorScheme.primary, 1.5)),
      );
      expect(
        FlexSubThemes.switchTheme(
                colorScheme: colorScheme,
                useTintedInteraction: true,
                useMaterial3: true)
            .overlayColor!
            .resolve(<WidgetState>{WidgetState.focused}),
        equals(FlexSubThemes.tintedFocused(
            colorScheme.surface, colorScheme.primary, 1.5)),
      );
      expect(
        FlexSubThemes.switchTheme(
                colorScheme: colorScheme,
                useTintedInteraction: true,
                useMaterial3: true)
            .overlayColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.pressed}),
        equals(FlexSubThemes.tintedPressed(
            colorScheme.surface, colorScheme.primary, 1.5)),
      );
      expect(
        FlexSubThemes.switchTheme(
                colorScheme: colorScheme,
                useTintedInteraction: true,
                useMaterial3: true)
            .overlayColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.hovered}),
        equals(FlexSubThemes.tintedHovered(
            colorScheme.surface, colorScheme.primary, 1.5)),
      );
      expect(
        FlexSubThemes.switchTheme(
                colorScheme: colorScheme,
                useTintedInteraction: true,
                useMaterial3: true)
            .overlayColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.focused}),
        equals(FlexSubThemes.tintedFocused(
            colorScheme.surface, colorScheme.primary, 1.5)),
      );

      // Unselected is colored
      // trackColor color
      expect(
        FlexSubThemes.switchTheme(
                colorScheme: colorScheme,
                unselectedIsColored: true,
                useMaterial3: true)
            .trackColor!
            .resolve(<WidgetState>{WidgetState.pressed}),
        equals(colorScheme.primary.withAlpha(0x33)),
      );
      expect(
        FlexSubThemes.switchTheme(
                colorScheme: colorScheme,
                unselectedIsColored: true,
                useMaterial3: true)
            .trackColor!
            .resolve(<WidgetState>{WidgetState.hovered}),
        equals(colorScheme.primary.withAlpha(0x33)),
      );
      expect(
        FlexSubThemes.switchTheme(
                colorScheme: colorScheme,
                unselectedIsColored: true,
                useMaterial3: true)
            .trackColor!
            .resolve(<WidgetState>{WidgetState.focused}),
        equals(colorScheme.primary.withAlpha(0x33)),
      );
      expect(
        FlexSubThemes.switchTheme(
                colorScheme: colorScheme,
                unselectedIsColored: true,
                useMaterial3: true)
            .trackColor!
            .resolve(<WidgetState>{}),
        equals(colorScheme.primary.withAlpha(0x33)),
      );

      // Default states
      expect(
        switchTheme.thumbColor!.resolve(<WidgetState>{}),
        equals(colorScheme.outline),
      );
      expect(
        switchTheme.trackColor!.resolve(<WidgetState>{}),
        equals(colorScheme.surfaceContainerHighest),
      );
      expect(
        switchTheme.trackOutlineColor!.resolve(<WidgetState>{}),
        equals(colorScheme.outline),
      );
      // Default state for trackColor when unselectedIsColored, is false
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          unselectedIsColored: false,
          useMaterial3: true,
        ).trackColor!.resolve(<WidgetState>{}),
        equals(colorScheme.surfaceContainerHighest),
      );
      // Default state for trackColor when unselectedIsColored, is true
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          unselectedIsColored: true,
          useMaterial3: true,
        ).trackColor!.resolve(<WidgetState>{}),
        equals(colorScheme.primary.withAlpha(0x33)),
      );
    });

    test(
        'Switch FST29.7 LIGHT Cupertino-like Switch: '
        'Does Switch have right states?', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      );
      final SwitchThemeData switchTheme = FlexSubThemes.switchTheme(
        colorScheme: colorScheme,
        useCupertinoStyle: true,
      );
      // Thumb Icons - hidden icon.
      final Icon? usedIcon = switchTheme.thumbIcon?.resolve(<WidgetState>{});
      expect(
        usedIcon!.icon,
        equals(Icons.minimize),
      );
      expect(
        usedIcon.color,
        equals(Colors.transparent),
      );
      // Disabled thumb colors
      expect(
        switchTheme.thumbColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(Colors.white.withOpacity(0.5)),
      );
      // All other thumb colors
      expect(
        switchTheme.thumbColor!.resolve(<WidgetState>{}),
        equals(Colors.white),
      );
      // Track colors
      const CupertinoDynamicColor cup = CupertinoColors.secondarySystemFill;
      expect(
        switchTheme.trackColor!.resolve(<WidgetState>{}),
        equals(cup.color),
      );
      // Disabled selected track colors
      expect(
        switchTheme.trackColor!
            .resolve(<WidgetState>{WidgetState.disabled, WidgetState.selected}),
        equals(colorScheme.primary.withOpacity(0.5)),
      );
      expect(
        switchTheme.trackColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(cup.color.withOpacity(0.07)),
      );
      // Track outline color focused
      expect(
        switchTheme.trackOutlineColor!
            .resolve(<WidgetState>{WidgetState.focused}),
        equals(HSLColor.fromColor(colorScheme.primary.withOpacity(0.80))
            .withLightness(0.69)
            .withSaturation(0.835)
            .toColor()),
      );
      // Track outline color all other cases
      expect(
        switchTheme.trackOutlineColor!.resolve(<WidgetState>{}),
        equals(Colors.transparent),
      );
      // Track outline width focused
      expect(
        switchTheme.trackOutlineWidth!
            .resolve(<WidgetState>{WidgetState.focused}),
        equals(3.5),
      );
      // Track outline width all other cases
      expect(
        switchTheme.trackOutlineWidth!.resolve(<WidgetState>{}),
        equals(0),
      );
      // Overlay color
      expect(
        switchTheme.overlayColor!.resolve(<WidgetState>{}),
        equals(Colors.transparent),
      );
      // The mouseCursor style
      expect(
        switchTheme.mouseCursor!.resolve(<WidgetState>{}),
        equals(kIsWeb ? SystemMouseCursors.click : SystemMouseCursors.basic),
      );
      // The mouseCursor disabled
      expect(
        switchTheme.mouseCursor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(SystemMouseCursors.basic),
      );
      // Zero splash radius
      expect(
        switchTheme.splashRadius,
        equals(0),
      );
    });
    test(
        'Switch FST29.7 DARK Cupertino-like Switch: '
        'Does Switch have right states?', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.dark,
      );
      final SwitchThemeData switchTheme = FlexSubThemes.switchTheme(
        colorScheme: colorScheme,
        useCupertinoStyle: true,
      );
      // Track colors
      const CupertinoDynamicColor cup = CupertinoColors.secondarySystemFill;
      expect(
        switchTheme.trackColor!.resolve(<WidgetState>{}),
        equals(cup.darkColor),
      );
      // Disabled selected track colors
      expect(
        switchTheme.trackColor!
            .resolve(<WidgetState>{WidgetState.disabled, WidgetState.selected}),
        equals(colorScheme.primary.withOpacity(0.5)),
      );
      expect(
        switchTheme.trackColor!.resolve(<WidgetState>{WidgetState.disabled}),
        equals(cup.darkColor.withOpacity(0.16)),
      );
      // Track outline color focused
      expect(
        switchTheme.trackOutlineColor!
            .resolve(<WidgetState>{WidgetState.focused}),
        equals(HSLColor.fromColor(colorScheme.primary.withOpacity(0.80))
            .withLightness(0.69)
            .withSaturation(0.835)
            .toColor()),
      );
    });
  });
  group('WITH: FlexSubTheme.tabBarTheme ', () {
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
      TabBarTheme m = FlexSubThemes.tabBarTheme(
        colorScheme: colorScheme,
        labelColor: colorScheme.tertiary,
        dividerColor: colorScheme.outline,
        useMaterial3: true,
      );
      expect(
        m.dividerColor,
        equals(colorScheme.outline),
      );
      // Overlay color
      expect(
        m.overlayColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.hovered}),
        equals(colorScheme.tertiary.withAlpha(kAlphaHovered)),
      );
      expect(
        m.overlayColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.focused}),
        equals(colorScheme.tertiary.withAlpha(kAlphaFocused)),
      );
      expect(
        m.overlayColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.pressed}),
        equals(colorScheme.tertiary.withAlpha(kAlphaPressed)),
      );
      expect(
        m.overlayColor?.resolve(<WidgetState>{WidgetState.selected}),
        equals(null),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(colorScheme.onSurface.withAlpha(kAlphaHovered)),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        equals(colorScheme.onSurface.withAlpha(kAlphaFocused)),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(colorScheme.tertiary.withAlpha(kAlphaPressed)),
      );
      expect(
        m.overlayColor?.resolve(<WidgetState>{}),
        equals(null),
      );
      m = FlexSubThemes.tabBarTheme(
        colorScheme: colorScheme,
        dividerColor: colorScheme.outline,
        indicatorColor: colorScheme.tertiary,
        useTintedInteraction: true,
        useMaterial3: true,
      );
      // Overlay color
      expect(
        m.overlayColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.hovered}),
        equals(colorScheme.primary.withAlpha(kAlphaHovered)),
      );
      expect(
        m.overlayColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.focused}),
        equals(colorScheme.primary.withAlpha(kAlphaFocused)),
      );
      expect(
        m.overlayColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.pressed}),
        equals(colorScheme.primary.withAlpha(kAlphaPressed)),
      );
      expect(
        m.overlayColor?.resolve(<WidgetState>{WidgetState.selected}),
        equals(null),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(colorScheme.primary.withAlpha(kAlphaHovered)),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        equals(colorScheme.primary.withAlpha(kAlphaFocused)),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(colorScheme.primary.withAlpha(kAlphaPressed)),
      );
      expect(
        m.overlayColor?.resolve(<WidgetState>{}),
        equals(null),
      );
      m = FlexSubThemes.tabBarTheme(
        colorScheme: colorScheme,
        dividerColor: colorScheme.outline,
        labelColor: colorScheme.secondary,
        useTintedInteraction: false,
      );
      // Overlay color
      expect(
        m.overlayColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.hovered}),
        equals(colorScheme.secondary.withAlpha(kAlphaHovered)),
      );
      expect(
        m.overlayColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.focused}),
        equals(colorScheme.secondary.withAlpha(kAlphaFocused)),
      );
      expect(
        m.overlayColor!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.pressed}),
        equals(colorScheme.secondary.withAlpha(kAlphaPressed)),
      );
      expect(
        m.overlayColor?.resolve(<WidgetState>{WidgetState.selected}),
        equals(null),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(colorScheme.onSurface.withAlpha(kAlphaHovered)),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        equals(colorScheme.onSurface.withAlpha(kAlphaFocused)),
      );
      expect(
        m.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(colorScheme.secondary.withAlpha(kAlphaPressed)),
      );
      expect(
        m.overlayColor?.resolve(<WidgetState>{}),
        equals(null),
      );
    });
  });
  group('WITH: FlexSubTheme.textButtonTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes TextButton tests
    // -------------------------------------------------------------------------
    test(
        'TextButton FST31.1 M2: GIVEN a default M2 '
        'FlexSubTheme.textButtonTheme() '
        'EXPECT equal to TextButtonThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.textButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).toString(),
        equalsIgnoringHashCodes(
          TextButtonThemeData(
            style: ButtonStyle(
              minimumSize:
                  ButtonStyleButton.allOrNull<Size>(const Size(40, 40)),
              shape: ButtonStyleButton.allOrNull<OutlinedBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(40),
                  ),
                ),
              ),
            ),
          ).toString(),
        ),
      );
    });
    test(
        'TextButton FST31.2 M2-base: GIVEN a custom '
        'FlexSubTheme.textButtonTheme() '
        'EXPECT equal to TextButtonThemeData() version with same color', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.textButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          useMaterial3: false,
        ).toString(),
        equalsIgnoringHashCodes(
          TextButtonThemeData(
            style: ButtonStyle(
              minimumSize: ButtonStyleButton.allOrNull<Size>(
                const Size(40, 40),
              ),
              shape: ButtonStyleButton.allOrNull<OutlinedBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(40),
                  ),
                ),
              ),
              foregroundColor: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.disabled)) {
                    return colorScheme.onSurface.withOpacity(0.38);
                  }
                  return colorScheme.secondary;
                },
              ),
              overlayColor: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.hovered)) {
                    return colorScheme.secondary.withOpacity(0.08);
                  }
                  if (states.contains(WidgetState.focused)) {
                    return colorScheme.secondary.withOpacity(0.12);
                  }
                  if (states.contains(WidgetState.pressed)) {
                    return colorScheme.secondary.withOpacity(0.12);
                  }
                  return null;
                },
              ),
            ),
          ).toString(),
        ),
      );
    });
    test(
        'TextButton FST31.3 M3: GIVEN a default M3 '
        'FlexSubTheme.textButtonTheme() '
        'EXPECT equal to TextButtonThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF7142E7),
        brightness: Brightness.light,
      );
      expect(
        FlexSubThemes.textButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          const TextButtonThemeData(
            style: ButtonStyle(),
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'TextButton FST31.4 M2-states: Does TextButton '
        'have right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF7142E7),
        brightness: Brightness.light,
      );
      final TextButtonThemeData button = FlexSubThemes.textButtonTheme(
        colorScheme: colorScheme,
        baseSchemeColor: SchemeColor.primary,
      );
      // Disabled foreground
      expect(
        button.style!.foregroundColor!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(colorScheme.onSurface.withOpacity(0.38)),
      );
      expect(
        button.style!.foregroundColor!
            .resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.primary),
      );
      // Overlay color states
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(colorScheme.primary.withOpacity(0.08)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        equals(colorScheme.primary.withOpacity(0.12)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(colorScheme.primary.withOpacity(0.12)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<WidgetState>{WidgetState.selected}),
        equals(null),
      );
    });
    test(
        'TextButton FST31.5 M2-tint-states: Does M2 '
        'TextButton have right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF7142E7),
        brightness: Brightness.light,
      );
      final TextButtonThemeData button = FlexSubThemes.textButtonTheme(
        colorScheme: colorScheme,
        baseSchemeColor: SchemeColor.tertiary,
        useTintedDisable: true,
        useTintedInteraction: true,
      );
      final Color overlay = colorScheme.surface;
      final Color tint = colorScheme.tertiary;
      // Disabled foreground
      expect(
        button.style!.foregroundColor!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)),
      );
      expect(
        button.style!.foregroundColor!
            .resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.tertiary),
      );
      // Overlay color states
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(FlexSubThemes.tintedHovered(overlay, tint, 1.5)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        equals(FlexSubThemes.tintedFocused(overlay, tint, 1.5)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(FlexSubThemes.tintedPressed(overlay, tint, 1.5)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<WidgetState>{WidgetState.selected}),
        equals(null),
      );
    });
    test(
        'TextButton FST31.6 M3-states: Does '
        'TextButton have right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      final TextButtonThemeData button = FlexSubThemes.textButtonTheme(
        colorScheme: colorScheme,
        baseSchemeColor: SchemeColor.primary,
        radius: 15,
        useMaterial3: true,
      );
      // Disabled foreground
      expect(
        button.style!.foregroundColor!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(colorScheme.onSurface.withOpacity(0.38)),
      );
      expect(
        button.style!.foregroundColor!
            .resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.primary),
      );
      // Overlay color states
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(colorScheme.primary.withOpacity(0.08)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        equals(colorScheme.primary.withOpacity(0.12)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(colorScheme.primary.withOpacity(0.12)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<WidgetState>{WidgetState.selected}),
        equals(null),
      );
      // Custom shape test
      expect(
        button.style!.shape!.resolve(<WidgetState>{}),
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
        'TextButton FST31.7 M3-custom-states: Does light '
        'TextButton have right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      final TextButtonThemeData button = FlexSubThemes.textButtonTheme(
        colorScheme: colorScheme,
        baseSchemeColor: SchemeColor.primaryContainer,
        radius: 5,
        useTintedDisable: true,
        useTintedInteraction: true,
      );
      final Color overlay = colorScheme.surface;
      final Color tint = colorScheme.primaryContainer;
      // Disabled foreground
      expect(
        button.style!.foregroundColor!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)),
      );
      expect(
        button.style!.foregroundColor!
            .resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.primaryContainer),
      );
      // Overlay color states
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(FlexSubThemes.tintedHovered(overlay, tint, 4.0)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        equals(FlexSubThemes.tintedFocused(overlay, tint, 4.0)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(FlexSubThemes.tintedPressed(overlay, tint, 4.0)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<WidgetState>{WidgetState.selected}),
        equals(null),
      );
      // Custom shape test
      expect(
          button.style!.shape!.resolve(<WidgetState>{}),
          equals(
            const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
          ));
    });
    test(
        'TextButton FST31.8 M3-custom-states: Does light '
        'TextButton have right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      final TextButtonThemeData button = FlexSubThemes.textButtonTheme(
        colorScheme: colorScheme,
        baseSchemeColor: SchemeColor.tertiary,
        radius: 5,
        useTintedDisable: true,
        useTintedInteraction: true,
      );
      final Color overlay = colorScheme.surface;
      final Color tint = colorScheme.tertiary;
      // Disabled foreground
      expect(
        button.style!.foregroundColor!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)),
      );
      expect(
        button.style!.foregroundColor!
            .resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.tertiary),
      );
      // Overlay color states
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(FlexSubThemes.tintedHovered(overlay, tint, 1.5)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        equals(FlexSubThemes.tintedFocused(overlay, tint, 1.5)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(FlexSubThemes.tintedPressed(overlay, tint, 1.5)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<WidgetState>{WidgetState.selected}),
        equals(null),
      );
      // Custom shape test
      expect(
          button.style!.shape!.resolve(<WidgetState>{}),
          equals(
            const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
          ));
    });
    test(
        'TextButton FST31.9 M3-custom-states: Does dark '
        'TextButton have right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.dark,
      );
      final TextButtonThemeData button = FlexSubThemes.textButtonTheme(
        colorScheme: colorScheme,
        baseSchemeColor: SchemeColor.tertiary,
        radius: 5,
        useTintedDisable: true,
        useTintedInteraction: true,
      );
      final Color overlay = colorScheme.surface;
      final Color tint = colorScheme.tertiary;
      // Disabled foreground
      expect(
        button.style!.foregroundColor!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)),
      );
      expect(
        button.style!.foregroundColor!
            .resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.tertiary),
      );
      // Overlay color states
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(FlexSubThemes.tintedHovered(overlay, tint, 2)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        equals(FlexSubThemes.tintedFocused(overlay, tint, 2)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(FlexSubThemes.tintedPressed(overlay, tint, 2)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<WidgetState>{WidgetState.selected}),
        equals(null),
      );
      // Custom shape test
      expect(
          button.style!.shape!.resolve(<WidgetState>{}),
          equals(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ));
    });
    test(
        'TextButton FST31.10 M3-custom-states: Does dark '
        'TextButton have right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.dark,
      );
      final TextButtonThemeData button = FlexSubThemes.textButtonTheme(
        colorScheme: colorScheme,
        baseSchemeColor: SchemeColor.primaryContainer,
        radius: 5,
        useTintedDisable: true,
        useTintedInteraction: true,
      );
      final Color overlay = colorScheme.surface;
      final Color tint = colorScheme.primaryContainer;
      // Disabled foreground
      expect(
        button.style!.foregroundColor!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)),
      );
      expect(
        button.style!.foregroundColor!
            .resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.primaryContainer),
      );
      // Overlay color states
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}),
        equals(FlexSubThemes.tintedHovered(overlay, tint, 5)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.focused}),
        equals(FlexSubThemes.tintedFocused(overlay, tint, 5)),
      );
      expect(
        button.style!.overlayColor!.resolve(<WidgetState>{WidgetState.pressed}),
        equals(FlexSubThemes.tintedPressed(overlay, tint, 5)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<WidgetState>{WidgetState.selected}),
        equals(null),
      );
      // Custom shape test
      expect(
          button.style!.shape!.resolve(<WidgetState>{}),
          equals(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ));
    });
  });
  group('WITH: FlexSubTheme.textSelectionTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes textSelectionTheme tests
    // -------------------------------------------------------------------------
    test(
        'TextSelection FST32.1: GIVEN a FlexSubTheme.textSelectionTheme() '
        'EXPECT equal to equivalent TextSelectionThemeData().', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      TextSelectionThemeData textSelection = FlexSubThemes.textSelectionTheme(
        colorScheme: colorScheme,
      );
      expect(
          textSelection,
          equals(TextSelectionThemeData(
            cursorColor: colorScheme.primary,
            selectionColor: colorScheme.primary.withOpacity(0.4),
            selectionHandleColor: colorScheme.primary,
          )));
      //
      textSelection = FlexSubThemes.textSelectionTheme(
        colorScheme: colorScheme,
        cursorSchemeColor: SchemeColor.tertiary,
        selectionSchemeColor: SchemeColor.secondary,
        selectionOpacity: 0.3,
        selectionHandleSchemeColor: SchemeColor.onPrimaryContainer,
      );
      expect(
          textSelection,
          equals(TextSelectionThemeData(
            cursorColor: colorScheme.tertiary,
            selectionColor: colorScheme.secondary.withOpacity(0.3),
            selectionHandleColor: colorScheme.onPrimaryContainer,
          )));
      textSelection = FlexSubThemes.textSelectionTheme(
        colorScheme: colorScheme,
        cursorSchemeColor: SchemeColor.tertiary,
        selectionSchemeColor: SchemeColor.secondary,
        selectionHandleSchemeColor: SchemeColor.onPrimaryContainer,
        selectionHandleCustomColor: const Color(0xFFEEDDCC),
      );
      expect(
          textSelection,
          equals(TextSelectionThemeData(
            cursorColor: colorScheme.tertiary,
            selectionColor: colorScheme.secondary.withOpacity(0.4),
            selectionHandleColor: const Color(0xFFEEDDCC),
          )));
    });
  });
  group('WITH: FlexSubTheme.timePickerTheme ', () {
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
              borderRadius: BorderRadius.all(
                Radius.circular(28),
              ),
            ),
            hourMinuteShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            dayPeriodShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
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
        'TimePicker FST33.2 scheme-based: GIVEN a default M2 '
        'FlexSubTheme.timePickerTheme() '
        'EXPECT equal to TimePickerThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.timePickerTheme(
          colorScheme: colorScheme,
          backgroundColor: const Color(0xFFDDDDDD),
          backgroundSchemeColor: SchemeColor.tertiary,
          inputDecorationTheme: const InputDecorationTheme(),
          useInputDecoratorTheme: true,
          useMaterial3: false,
        ),
        equals(
          TimePickerThemeData(
            elevation: 6,
            backgroundColor: colorScheme.tertiary,
            // dialBackgroundColor: colorScheme.surfaceVariant,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(28),
              ),
            ),
            hourMinuteShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            dayPeriodShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
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
        'TimePicker FST33.3 background-a: GIVEN a default M2 '
        'FlexSubTheme.timePickerTheme() '
        'EXPECT equal to TimePickerThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.timePickerTheme(
          colorScheme: colorScheme,
          backgroundColor: const Color(0xFFDDDDDD),
          inputDecorationTheme: const InputDecorationTheme(filled: true),
          useInputDecoratorTheme: true,
          useMaterial3: false,
        ),
        equals(
          TimePickerThemeData(
            elevation: 6,
            backgroundColor: const Color(0xFFDDDDDD),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(28),
              ),
            ),
            hourMinuteShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            dayPeriodShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
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
          inputDecorationTheme: const InputDecorationTheme(filled: true),
          elementRadius: 12,
          useInputDecoratorTheme: true,
          useMaterial3: false,
        ),
        equals(
          TimePickerThemeData(
            elevation: 6,
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
        'TimePicker FST33.5 GIVEN a custom FlexSubTheme.timePickerTheme() '
        'EXPECT equal to TimePickerThemeData() with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF345234),
        brightness: Brightness.light,
      );
      final TimePickerThemeData m = FlexSubThemes.timePickerTheme(
        colorScheme: colorScheme,
        inputDecorationTheme: const InputDecorationTheme(filled: true),
        useInputDecoratorTheme: true,
        useMaterial3: true,
      );
      //
      // dayPeriodColor
      expect(
        (m.dayPeriodColor as WidgetStateColor?)!
            .resolve(<WidgetState>{WidgetState.selected}),
        equals(colorScheme.tertiaryContainer),
      );
      expect(
        (m.dayPeriodColor as WidgetStateColor?)!.resolve(<WidgetState>{}),
        equals(Colors.transparent),
      );
      //
      // dayPeriodTextColor
      expect(
        (m.dayPeriodTextColor as WidgetStateColor?)!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.pressed}),
        equals(colorScheme.onTertiaryContainer),
      );
      expect(
        (m.dayPeriodTextColor as WidgetStateColor?)!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.focused}),
        equals(colorScheme.onTertiaryContainer),
      );
      expect(
        (m.dayPeriodTextColor as WidgetStateColor?)!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.hovered}),
        equals(colorScheme.onTertiaryContainer),
      );
      expect(
        (m.dayPeriodTextColor as WidgetStateColor?)!
            .resolve(<WidgetState>{WidgetState.pressed}),
        equals(colorScheme.onSurfaceVariant),
      );
      expect(
        (m.dayPeriodTextColor as WidgetStateColor?)!
            .resolve(<WidgetState>{WidgetState.focused}),
        equals(colorScheme.onSurfaceVariant),
      );
      expect(
        (m.dayPeriodTextColor as WidgetStateColor?)!
            .resolve(<WidgetState>{WidgetState.hovered}),
        equals(colorScheme.onSurfaceVariant),
      );
      expect(
        (m.dayPeriodTextColor as WidgetStateColor?)!.resolve(<WidgetState>{}),
        equals(colorScheme.onTertiaryContainer),
      );
      //
      // hourMinuteColor
      expect(
        (m.hourMinuteColor as WidgetStateColor?)!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.pressed}),
        equals(colorScheme.onPrimaryContainer),
      );
      expect(
        (m.hourMinuteColor as WidgetStateColor?)!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.focused}),
        equals(Color.alphaBlend(
            colorScheme.onPrimaryContainer.withAlpha(kAlphaFocused),
            colorScheme.primaryContainer)),
      );
      expect(
        (m.hourMinuteColor as WidgetStateColor?)!
            .resolve(<WidgetState>{WidgetState.selected, WidgetState.hovered}),
        equals(Color.alphaBlend(
            colorScheme.onPrimaryContainer.withAlpha(kAlphaHovered),
            colorScheme.primaryContainer)),
      );
      expect(
        (m.hourMinuteColor as WidgetStateColor?)!
            .resolve(<WidgetState>{WidgetState.selected}),
        equals(Color.alphaBlend(
            colorScheme.primaryContainer, colorScheme.primaryContainer)),
      );
      expect(
        (m.hourMinuteColor as WidgetStateColor?)!
            .resolve(<WidgetState>{WidgetState.pressed}),
        equals(Color.alphaBlend(
            colorScheme.onSurface, colorScheme.surfaceContainerHighest)),
      );
      expect(
        (m.hourMinuteColor as WidgetStateColor?)!
            .resolve(<WidgetState>{WidgetState.focused}),
        equals(Color.alphaBlend(colorScheme.onSurface.withAlpha(kAlphaFocused),
            colorScheme.surfaceContainerHighest)),
      );
      expect(
        (m.hourMinuteColor as WidgetStateColor?)!
            .resolve(<WidgetState>{WidgetState.hovered}),
        equals(Color.alphaBlend(colorScheme.onSurface.withAlpha(kAlphaHovered),
            colorScheme.surfaceContainerHighest)),
      );
      expect(
        (m.hourMinuteColor as WidgetStateColor?)!.resolve(<WidgetState>{}),
        equals(Color.alphaBlend(colorScheme.surfaceContainerHighest,
            colorScheme.surfaceContainerHighest)),
      );
    });
  });

  group('WITH: FlexSubTheme.toggleButtonsTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes ToggleButtons tests
    // -------------------------------------------------------------------------
    test(
        'ToggleButtons FST34.1: GIVEN a default '
        'FlexSubTheme.toggleButtonsTheme() EXPECT '
        'equal to ToggleButtonsThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      final VisualDensity visualDensity = VisualDensity.adaptivePlatformDensity;
      expect(
        FlexSubThemes.toggleButtonsTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ),
        equals(
          ToggleButtonsThemeData(
            borderWidth: 1,
            selectedColor: colorScheme.onPrimary,
            color: colorScheme.primary,
            fillColor: colorScheme.primary,
            borderColor: colorScheme.primary,
            selectedBorderColor: colorScheme.primary,
            hoverColor: colorScheme.primary.withAlpha(kAlphaHovered),
            focusColor: colorScheme.primary.withAlpha(kAlphaFocused),
            highlightColor: colorScheme.primary.withAlpha(kAlphaHighlight),
            splashColor: colorScheme.primary.withAlpha(kAlphaSplash),
            disabledColor: colorScheme.onSurface.withAlpha(kAlphaDisabled),
            disabledBorderColor:
                colorScheme.onSurface.withAlpha(kAlphaVeryLowDisabled),
            borderRadius: BorderRadius.circular(40),
            constraints: BoxConstraints(
              minWidth: 40 - 1 * 2 + visualDensity.baseSizeAdjustment.dx,
              minHeight: 40 - 1 * 2 + visualDensity.baseSizeAdjustment.dy,
            ),
          ),
        ),
      );
    });
    test(
        'ToggleButtons FST34.2 base-color: GIVEN a default '
        'FlexSubTheme.toggleButtonsTheme() '
        'EXPECT '
        'equal to ToggleButtonsThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      final VisualDensity visualDensity = VisualDensity.adaptivePlatformDensity;
      expect(
        FlexSubThemes.toggleButtonsTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          borderWidth: 2,
          useMaterial3: false,
        ),
        equals(
          ToggleButtonsThemeData(
            borderWidth: 2,
            selectedColor: colorScheme.onSecondary,
            color: colorScheme.secondary,
            fillColor: colorScheme.secondary,
            borderColor: colorScheme.secondary,
            selectedBorderColor: colorScheme.secondary,
            hoverColor: colorScheme.secondary.withAlpha(kAlphaHovered),
            focusColor: colorScheme.secondary.withAlpha(kAlphaFocused),
            highlightColor: colorScheme.secondary.withAlpha(kAlphaHighlight),
            splashColor: colorScheme.secondary.withAlpha(kAlphaSplash),
            disabledColor: colorScheme.onSurface.withAlpha(kAlphaDisabled),
            disabledBorderColor:
                colorScheme.onSurface.withAlpha(kAlphaVeryLowDisabled),
            borderRadius: BorderRadius.circular(40),
            constraints: BoxConstraints(
              minWidth: 40 - 2 * 2 + visualDensity.baseSizeAdjustment.dx,
              minHeight: 40 - 2 * 2 + visualDensity.baseSizeAdjustment.dy,
            ),
          ),
        ),
      );
    });
    test(
        'ToggleButtons FST34.3 M3-base-color: GIVEN a tinted interact disable '
        'and default M3 outline border FlexSubTheme.toggleButtonsTheme() '
        'EXPECT '
        'equal to ToggleButtonsThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      final VisualDensity visualDensity = VisualDensity.adaptivePlatformDensity;
      final Color overlay = colorScheme.surface;
      final Color tint = colorScheme.secondary;
      expect(
        FlexSubThemes.toggleButtonsTheme(
          colorScheme: colorScheme,
          radius: 14,
          baseSchemeColor: SchemeColor.secondary,
          unselectedSchemeColor: SchemeColor.error,
          useTintedDisable: true,
          useTintedInteraction: true,
          useMaterial3: true,
        ),
        equals(
          ToggleButtonsThemeData(
            borderWidth: 1,
            selectedColor: colorScheme.onSecondary,
            color: colorScheme.error,
            fillColor: colorScheme.secondary,
            borderColor: colorScheme.outline,
            selectedBorderColor: colorScheme.outline,
            hoverColor: FlexSubThemes.tintedHovered(overlay, tint, 2),
            focusColor: FlexSubThemes.tintedFocused(overlay, tint, 2),
            highlightColor: FlexSubThemes.tintedHighlight(overlay, tint, 2),
            splashColor: FlexSubThemes.tintedSplash(overlay, tint, 2),
            disabledColor:
                FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)
                    .withAlpha(kAlphaLowDisabled),
            disabledBorderColor: FlexSubThemes.tintedDisable(
                    colorScheme.onSurface, colorScheme.outline)
                .withAlpha(kAlphaLowDisabled),
            borderRadius: BorderRadius.circular(14),
            constraints: BoxConstraints(
              minWidth: 40 - 1 * 2 + visualDensity.baseSizeAdjustment.dx,
              minHeight: 40 - 1 * 2 + visualDensity.baseSizeAdjustment.dy,
            ),
          ),
        ),
      );
    });
    test(
        'ToggleButtons FST34.4 M3-base-color: GIVEN a tinted interact disable '
        'FlexSubTheme.toggleButtonsTheme() '
        'EXPECT '
        'equal to ToggleButtonsThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      final VisualDensity visualDensity = VisualDensity.adaptivePlatformDensity;
      final Color overlay = colorScheme.surface;
      final Color tint = colorScheme.secondary;
      expect(
        FlexSubThemes.toggleButtonsTheme(
          colorScheme: colorScheme,
          radius: 16,
          borderWidth: 1.5,
          baseSchemeColor: SchemeColor.secondary,
          selectedForegroundSchemeColor: SchemeColor.secondaryContainer,
          unselectedSchemeColor: SchemeColor.tertiary,
          borderSchemeColor: SchemeColor.error,
          useTintedDisable: true,
          useTintedInteraction: true,
          useMaterial3: true,
        ),
        equals(
          ToggleButtonsThemeData(
            borderWidth: 1.5,
            selectedColor: colorScheme.secondaryContainer,
            color: colorScheme.tertiary,
            fillColor: colorScheme.secondary,
            borderColor: colorScheme.error,
            selectedBorderColor: colorScheme.error,
            hoverColor: FlexSubThemes.tintedHovered(overlay, tint, 2),
            focusColor: FlexSubThemes.tintedFocused(overlay, tint, 2),
            highlightColor: FlexSubThemes.tintedHighlight(overlay, tint, 2),
            splashColor: FlexSubThemes.tintedSplash(overlay, tint, 2),
            disabledColor:
                FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)
                    .withAlpha(kAlphaLowDisabled),
            disabledBorderColor: FlexSubThemes.tintedDisable(
                    colorScheme.onSurface, colorScheme.error)
                .withAlpha(kAlphaLowDisabled),
            borderRadius: BorderRadius.circular(16),
            constraints: BoxConstraints(
              minWidth: 40 - 1.5 * 2 + visualDensity.baseSizeAdjustment.dx,
              minHeight: 40 - 1.5 * 2 + visualDensity.baseSizeAdjustment.dy,
            ),
          ),
        ),
      );
    });
  });
  group('WITH: FlexSubTheme.tooltipTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes Tooltip tests
    // -------------------------------------------------------------------------
    test(
        'Tooltip FST35.1 light: GIVEN a light default '
        'FlexSubTheme.tooltipTheme() '
        'EXPECT equal to TooltipThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.tooltipTheme(
          colorScheme: colorScheme,
        ).toString(),
        equalsIgnoringHashCodes(
          TooltipThemeData(
            textStyle: ThemeData(brightness: Brightness.light)
                .textTheme
                .bodyMedium!
                .copyWith(color: colorScheme.surface),
            decoration: BoxDecoration(
              color: colorScheme.onSurface,
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              border: Border.all(color: Colors.transparent),
            ),
          ).toString(),
        ),
      );
    });
    test(
        'Tooltip FST35.2 light: GIVEN a light custom '
        'FlexSubTheme.tooltipTheme() '
        'EXPECT equal to TooltipThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.tooltipTheme(
          colorScheme: colorScheme,
          foregroundColor: const Color(0xFFB5DEC2),
          backgroundColor: const Color(0xFF032F11),
          borderColor: const Color(0x88CCCCCC),
          borderRadius: 9,
          backgroundAlpha: 0xDD,
          textStyle:
              ThemeData(brightness: Brightness.light).textTheme.bodyLarge,
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(12),
          waitDuration: const Duration(seconds: 1),
          showDuration: const Duration(milliseconds: 2500),
        ).toString(),
        equalsIgnoringHashCodes(
          TooltipThemeData(
            textStyle: ThemeData(brightness: Brightness.light)
                .textTheme
                .bodyLarge!
                .copyWith(color: const Color(0xFFB5DEC2)),
            decoration: BoxDecoration(
              color: const Color(0xDD032F11),
              borderRadius: const BorderRadius.all(Radius.circular(9)),
              border: Border.all(color: const Color(0x88CCCCCC)),
            ),
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(12),
            waitDuration: const Duration(seconds: 1),
            showDuration: const Duration(milliseconds: 2500),
          ).toString(),
        ),
      );
    });
    test(
        'Tooltip FST34.3 light: GIVEN a light custom '
        'FlexSubTheme.tooltipTheme() '
        'EXPECT equal to TooltipThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.tooltipTheme(
          colorScheme: colorScheme,
          backgroundSchemeColor: SchemeColor.tertiary,
          foregroundColor: const Color(0xFFB5DEC2),
          backgroundColor: const Color(0xFF032F11),
          borderColor: const Color(0x88CCCCCC),
          borderRadius: 9,
          backgroundAlpha: 0xDD,
          textStyle:
              ThemeData(brightness: Brightness.light).textTheme.bodyLarge,
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(12),
          waitDuration: const Duration(seconds: 1),
          showDuration: const Duration(milliseconds: 2500),
        ).toString(),
        equalsIgnoringHashCodes(
          TooltipThemeData(
            textStyle: ThemeData(brightness: Brightness.light)
                .textTheme
                .bodyLarge!
                .copyWith(color: colorScheme.onTertiary),
            decoration: BoxDecoration(
              color: colorScheme.tertiary.withAlpha(0xDD),
              borderRadius: const BorderRadius.all(Radius.circular(9)),
              border: Border.all(color: const Color(0x88CCCCCC)),
            ),
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(12),
            waitDuration: const Duration(seconds: 1),
            showDuration: const Duration(milliseconds: 2500),
          ).toString(),
        ),
      );
    });
  });
}
