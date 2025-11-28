import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flex_color_scheme/src/flex_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WITH: FlexSubThemes.InputDecorationThemeData ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes InputDecorator tests
    // -------------------------------------------------------------------------
    test(
        'InputDecoration FST16.1-M2 light: GIVEN a M2 '
        'FlexSubThemes.inputDecorationTheme(tintedDisabled: true) '
        'EXPECT equal to InputDecorationThemeData() version with same values',
        () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      // Tinted disabled colors
      final Color tintDisabledColor = FlexSubThemes.tintedDisable(
        colorScheme.onSurface,
        colorScheme.primary,
      );

      const bool filled = false;
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

      // Get effective alpha value for background fill color.
      const double effectiveAlpha = kFillColorLightOpacity;
      final Color tintDisabledUltraLowColor = FlexSubThemes.tintedDisable(
        colorScheme.onSurface,
        colorScheme.primary,
      ).withValues(alpha: kAlphaUltraLowDisabledFloat);

      // Effective used fill color, can also be a totally custom color value.
      final Color usedFillColor = WidgetStateColor.resolveWith((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.disabled)) {
          return tintDisabledUltraLowColor;
        }
        return Color.alphaBlend(
          colorScheme.primary.withValues(alpha: effectiveAlpha),
          colorScheme.surface,
        );
      });

      // debugPrint('Test effectiveAlpha : $kFillColorAlphaLightFloat');
      // debugPrint('Test usedFillColor  : $usedFillColor');
      // debugPrint('Test primary        : ${colorScheme.primary}');
      // debugPrint('Test surface        : ${colorScheme.surface}');

      final Color usedHover =
          ThemeData.estimateBrightnessForColor(usedFillColor) ==
                  Brightness.light
              ? usedFillColor.darken(kInputDecoratorLightBgDarken)
              : usedFillColor.lighten(kInputDecoratorDarkBgLighten);

      expect(
        FlexSubThemes.inputDecorationTheme(
          colorScheme: colorScheme,
          tintedDisabled: tintDisable, // true
          tintedInteractions: tintInteract, // true
          useMaterial3: useM3, // false
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          InputDecorationThemeData(
            labelStyle: WidgetStateTextStyle.resolveWith((
              Set<WidgetState> states,
            ) {
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
                return TextStyle(color: tintDisabledColor);
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            floatingLabelStyle: WidgetStateTextStyle.resolveWith((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.error)) {
                if (states.contains(WidgetState.focused)) {
                  return TextStyle(color: colorScheme.error);
                }
                if (states.contains(WidgetState.hovered)) {
                  return TextStyle(
                    color: colorScheme.error
                        .withValues(alpha: kEnabledBorderOpacity),
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
                return TextStyle(color: tintDisabledColor);
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            helperStyle: WidgetStateTextStyle.resolveWith((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.disabled)) {
                return TextStyle(color: tintDisabledColor);
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            hintStyle: WidgetStateTextStyle.resolveWith((
              Set<WidgetState> states,
            ) {
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
            prefixIconColor: WidgetStateColor.resolveWith((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.disabled)) {
                return tintDisabledColor;
              }
              if (states.contains(WidgetState.focused)) {
                return colorScheme.primary;
              }
              return Colors.black45;
            }),
            suffixIconColor: WidgetStateColor.resolveWith((
              Set<WidgetState> states,
            ) {
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
            filled: filled,
            fillColor: usedFillColor,
            hoverColor: usedHover,
            border: WidgetStateInputBorder.resolveWith((
              Set<WidgetState> states,
            ) {
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
                    color: colorScheme.error
                        .withValues(alpha: kEnabledBorderOpacity),
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
            }),
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'InputDecoration FST16.1-M3 light: GIVEN a M3 '
        'FlexSubThemes.inputDecorationTheme(tintedDisabled: true, filled) '
        'EXPECT equal to InputDecorationThemeData() version with same values',
        () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      // Tinted disabled colors
      final Color tintDisabledColor = FlexSubThemes.tintedDisable(
        colorScheme.onSurface,
        colorScheme.primary,
      );

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
        colorScheme.surface,
      );
      final Color usedHover =
          ThemeData.estimateBrightnessForColor(usedFillColor) ==
                  Brightness.light
              ? usedFillColor.darken(kInputDecoratorLightBgDarken)
              : usedFillColor.lighten(kInputDecoratorDarkBgLighten);

      final InputDecorationThemeData m = FlexSubThemes.inputDecorationTheme(
        colorScheme: colorScheme,
        tintedDisabled: tintDisable,
        tintedInteractions: tintInteract,
        filled: isFilled,
        useMaterial3: useM3,
      );
      expect(
        m.toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          InputDecorationThemeData(
            labelStyle: WidgetStateTextStyle.resolveWith((
              Set<WidgetState> states,
            ) {
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
                return TextStyle(color: tintDisabledColor);
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            floatingLabelStyle: WidgetStateTextStyle.resolveWith((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.error)) {
                if (states.contains(WidgetState.focused)) {
                  return TextStyle(color: colorScheme.error);
                }
                if (states.contains(WidgetState.hovered)) {
                  return TextStyle(
                    color: colorScheme.error
                        .withValues(alpha: kEnabledBorderOpacity),
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
                return TextStyle(color: tintDisabledColor);
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            helperStyle: WidgetStateTextStyle.resolveWith((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.disabled)) {
                return TextStyle(color: tintDisabledColor);
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            hintStyle: WidgetStateTextStyle.resolveWith((
              Set<WidgetState> states,
            ) {
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
            prefixIconColor: WidgetStateColor.resolveWith((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.disabled)) {
                return tintDisabledColor;
              }
              if (states.contains(WidgetState.focused)) {
                return colorScheme.onSurfaceVariant;
              }
              return colorScheme.onSurfaceVariant;
            }),
            suffixIconColor: WidgetStateColor.resolveWith((
              Set<WidgetState> states,
            ) {
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
            border: WidgetStateInputBorder.resolveWith((
              Set<WidgetState> states,
            ) {
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
                    color: colorScheme.error
                        .withValues(alpha: kEnabledBorderOpacity),
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
            }),
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'InputDecoration FST16.2 light: GIVEN a M2 '
        'FlexSubTheme.inputDecorationTheme( '
        'unfocusedBorderIsColored: false, tintedDisabled: true) '
        'EXPECT equal to InputDecorationThemeData() version with same '
        'values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      // Tinted disabled colors
      final Color tintDisabledColor = FlexSubThemes.tintedDisable(
        colorScheme.onSurface,
        colorScheme.primary,
      );

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
      const double effectiveAlpha = kFillColorLightOpacity;
      // Get effective alpha value for background fill color.
      final Color tintDisabledUltraLowColor = FlexSubThemes.tintedDisable(
        colorScheme.onSurface,
        colorScheme.primary,
      ).withValues(alpha: kAlphaUltraLowDisabledFloat);
      // Effective used fill color, can also be a totally custom color value.
      final Color usedFillColor = WidgetStateColor.resolveWith((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.disabled)) {
          return tintDisabledUltraLowColor;
        }
        return Color.alphaBlend(
          colorScheme.primary.withValues(alpha: effectiveAlpha),
          colorScheme.surface,
        );
      });
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
          InputDecorationThemeData(
            labelStyle: WidgetStateTextStyle.resolveWith((
              Set<WidgetState> states,
            ) {
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
                return TextStyle(color: tintDisabledColor);
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            floatingLabelStyle: WidgetStateTextStyle.resolveWith((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.error)) {
                if (states.contains(WidgetState.focused)) {
                  return TextStyle(color: colorScheme.error);
                }
                if (states.contains(WidgetState.hovered)) {
                  return TextStyle(
                    color: colorScheme.error
                        .withValues(alpha: kEnabledBorderOpacity),
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
                return TextStyle(color: tintDisabledColor);
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            helperStyle: WidgetStateTextStyle.resolveWith((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.disabled)) {
                return TextStyle(color: tintDisabledColor);
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            hintStyle: WidgetStateTextStyle.resolveWith((
              Set<WidgetState> states,
            ) {
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
            prefixIconColor: WidgetStateColor.resolveWith((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.disabled)) {
                return tintDisabledColor;
              }
              if (states.contains(WidgetState.focused)) {
                return colorScheme.primary;
              }
              return Colors.black45;
            }),
            suffixIconColor: WidgetStateColor.resolveWith((
              Set<WidgetState> states,
            ) {
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
            border: WidgetStateInputBorder.resolveWith((
              Set<WidgetState> states,
            ) {
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
                    color: colorScheme.error
                        .withValues(alpha: kEnabledBorderOpacity),
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
            }),
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'InputDecoration FST16.3 dark: GIVEN a M2 '
        'FlexSubTheme.inputDecorationTheme(tintedDisabled: true) '
        'EXPECT equal to InputDecorationThemeData() version with same values',
        () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.dark,
      );
      // Tinted disabled colors
      final Color tintDisabledColor = FlexSubThemes.tintedDisable(
        colorScheme.onSurface,
        colorScheme.primary,
      );

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
      const double effectiveAlpha = kFillColorDarkOpacity;
      // Get effective alpha value for background fill color.
      final Color tintDisabledUltraLowColor = FlexSubThemes.tintedDisable(
        colorScheme.onSurface,
        colorScheme.primary,
      ).withValues(alpha: kAlphaUltraLowDisabledFloat);
      // Effective used fill color, can also be a totally custom color value.
      final Color usedFillColor = WidgetStateColor.resolveWith((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.disabled)) {
          return tintDisabledUltraLowColor;
        }
        return Color.alphaBlend(
          colorScheme.primary.withValues(alpha: effectiveAlpha),
          colorScheme.surface,
        );
      });
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
          InputDecorationThemeData(
            labelStyle: WidgetStateTextStyle.resolveWith((
              Set<WidgetState> states,
            ) {
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
                return TextStyle(color: tintDisabledColor);
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            floatingLabelStyle: WidgetStateTextStyle.resolveWith((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.error)) {
                if (states.contains(WidgetState.focused)) {
                  return TextStyle(color: colorScheme.error);
                }
                if (states.contains(WidgetState.hovered)) {
                  return TextStyle(
                    color: colorScheme.error
                        .withValues(alpha: kEnabledBorderOpacity),
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
                return TextStyle(color: tintDisabledColor);
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            helperStyle: WidgetStateTextStyle.resolveWith((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.disabled)) {
                return TextStyle(color: tintDisabledColor);
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            hintStyle: WidgetStateTextStyle.resolveWith((
              Set<WidgetState> states,
            ) {
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
            prefixIconColor: WidgetStateColor.resolveWith((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.disabled)) {
                return tintDisabledColor;
              }
              if (states.contains(WidgetState.focused)) {
                return colorScheme.primary;
              }
              return Colors.white70;
            }),
            suffixIconColor: WidgetStateColor.resolveWith((
              Set<WidgetState> states,
            ) {
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
            border: WidgetStateInputBorder.resolveWith((
              Set<WidgetState> states,
            ) {
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
                    color: colorScheme.error
                        .withValues(alpha: kEnabledBorderOpacity),
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
            }),
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'InputDecoration FST16.4 dark: GIVEN a default M2 '
        'FlexSubTheme.inputDecorationTheme( '
        'unfocusedBorderIsColored: false, tintedDisabled: true) '
        'EXPECT equal to InputDecorationThemeData() version with same values',
        () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.dark,
      );
      // Tinted disabled colors
      final Color tintDisabledColor = FlexSubThemes.tintedDisable(
        colorScheme.onSurface,
        colorScheme.primary,
      );

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
      const double effectiveAlpha = kFillColorDarkOpacity;
      // Get effective alpha value for background fill color.
      final Color tintDisabledUltraLowColor = FlexSubThemes.tintedDisable(
        colorScheme.onSurface,
        colorScheme.primary,
      ).withValues(alpha: kAlphaUltraLowDisabledFloat);
      // Effective used fill color, can also be a totally custom color value.
      final Color usedFillColor = WidgetStateColor.resolveWith((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.disabled)) {
          return tintDisabledUltraLowColor;
        }
        return Color.alphaBlend(
          colorScheme.primary.withValues(alpha: effectiveAlpha),
          colorScheme.surface,
        );
      });
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
          InputDecorationThemeData(
            labelStyle: WidgetStateTextStyle.resolveWith((
              Set<WidgetState> states,
            ) {
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
                return TextStyle(color: tintDisabledColor);
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            floatingLabelStyle: WidgetStateTextStyle.resolveWith((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.error)) {
                if (states.contains(WidgetState.focused)) {
                  return TextStyle(color: colorScheme.error);
                }
                if (states.contains(WidgetState.hovered)) {
                  return TextStyle(
                    color: colorScheme.error
                        .withValues(alpha: kEnabledBorderOpacity),
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
                return TextStyle(color: tintDisabledColor);
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            helperStyle: WidgetStateTextStyle.resolveWith((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.disabled)) {
                return TextStyle(color: tintDisabledColor);
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            hintStyle: WidgetStateTextStyle.resolveWith((
              Set<WidgetState> states,
            ) {
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
            prefixIconColor: WidgetStateColor.resolveWith((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.disabled)) {
                return tintDisabledColor;
              }
              if (states.contains(WidgetState.focused)) {
                return colorScheme.primary;
              }
              return Colors.white70;
            }),
            suffixIconColor: WidgetStateColor.resolveWith((
              Set<WidgetState> states,
            ) {
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
            border: WidgetStateInputBorder.resolveWith((
              Set<WidgetState> states,
            ) {
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
                    color: colorScheme.error
                        .withValues(alpha: kEnabledBorderOpacity),
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
            }),
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
        colorScheme.onSurface,
        colorScheme.primary,
      );

      // Floating label focused error style
      expect(
        (FlexSubThemes.inputDecorationTheme(
          colorScheme: colorScheme,
          tintedDisabled: true,
          useMaterial3: false,
        ).floatingLabelStyle as WidgetStateTextStyle?)!
            .resolve(<WidgetState>{WidgetState.error, WidgetState.focused}),
        equals(TextStyle(color: colorScheme.error)),
      );
      // Floating label error hovered style
      expect(
        (FlexSubThemes.inputDecorationTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).floatingLabelStyle as WidgetStateTextStyle?)!
            .resolve(<WidgetState>{WidgetState.error, WidgetState.hovered}),
        equals(TextStyle(color: colorScheme.error)),
      );
      // Floating label unfocused error style
      expect(
        (FlexSubThemes.inputDecorationTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).floatingLabelStyle as WidgetStateTextStyle?)!
            .resolve(<WidgetState>{WidgetState.error}),
        equals(
          TextStyle(
              color:
                  colorScheme.error.withValues(alpha: kEnabledBorderOpacity)),
        ),
      );
      // Floating label disabled style
      expect(
        (FlexSubThemes.inputDecorationTheme(
          colorScheme: colorScheme,
          tintedDisabled: true,
          useMaterial3: false,
        ).floatingLabelStyle as WidgetStateTextStyle?)!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(TextStyle(color: tintDisabledColor)),
      );
      // Floating label default style
      expect(
        (FlexSubThemes.inputDecorationTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).floatingLabelStyle as WidgetStateTextStyle?)!
            .resolve(<WidgetState>{}),
        equals(TextStyle(color: Colors.black.withAlpha(kTintHover))),
      );
    });
    test(
        'InputDecoration FST16.6 light: GIVEN a default M2 '
        'FlexSubTheme.inputDecorationTheme(borderType: '
        'FlexInputBorderType.outline, usedSchemeColor: '
        'FlexUsedColor.secondary, tintedDisabled: true) '
        'EXPECT equal to InputDecorationThemeData() version with same values',
        () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      // Tinted disabled colors
      final Color tintDisabledColor = FlexSubThemes.tintedDisable(
        colorScheme.onSurface,
        colorScheme.secondary,
      );

      const double? radius = null;
      const double unfocusedWidth = 1.0;
      const double focusedWidth = 2.0;
      final Color borderColor = colorScheme.secondary;
      final Color enabledBorderColor = colorScheme.outline;
      final Color enabledHoveredBorderColor = colorScheme.secondary;
      const double effectiveRadius = radius ?? kInputDecoratorRadius;
      final BorderRadius effectiveOutlineBorder = BorderRadius.circular(
        effectiveRadius,
      );
      const double effectiveAlpha = kFillColorLightOpacity;
      // Get effective alpha value for background fill color.
      final Color tintDisabledUltraLowColor = FlexSubThemes.tintedDisable(
        colorScheme.onSurface,
        colorScheme.primary,
      ).withValues(alpha: kAlphaUltraLowDisabledFloat);
      // Effective used fill color, can also be a totally custom color value.
      final Color usedFillColor = WidgetStateColor.resolveWith((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.disabled)) {
          return tintDisabledUltraLowColor;
        }
        return Color.alphaBlend(
          colorScheme.secondary.withValues(alpha: effectiveAlpha),
          colorScheme.surface,
        );
      });
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
          InputDecorationThemeData(
            labelStyle: WidgetStateTextStyle.resolveWith((
              Set<WidgetState> states,
            ) {
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
                return TextStyle(color: tintDisabledColor);
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            floatingLabelStyle: WidgetStateTextStyle.resolveWith((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.error)) {
                if (states.contains(WidgetState.focused)) {
                  return TextStyle(color: colorScheme.error);
                }
                if (states.contains(WidgetState.hovered)) {
                  return TextStyle(
                    color: colorScheme.error
                        .withValues(alpha: kEnabledBorderOpacity),
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
                return TextStyle(color: tintDisabledColor);
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            helperStyle: WidgetStateTextStyle.resolveWith((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.disabled)) {
                return TextStyle(color: tintDisabledColor);
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            hintStyle: WidgetStateTextStyle.resolveWith((
              Set<WidgetState> states,
            ) {
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
            prefixIconColor: WidgetStateColor.resolveWith((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.disabled)) {
                return tintDisabledColor;
              }
              if (states.contains(WidgetState.focused)) {
                return colorScheme.secondary;
              }
              return Colors.black45;
            }),
            suffixIconColor: WidgetStateColor.resolveWith((
              Set<WidgetState> states,
            ) {
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
            border: WidgetStateInputBorder.resolveWith((
              Set<WidgetState> states,
            ) {
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
                    color: colorScheme.error
                        .withValues(alpha: kEnabledBorderOpacity),
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
            }),
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
        colorScheme.onSurface,
        colorScheme.primary,
      );
      // Floating label focused error style
      expect(
        (FlexSubThemes.inputDecorationTheme(
          colorScheme: colorScheme,
          borderType: FlexInputBorderType.outline,
          tintedDisabled: true,
          useMaterial3: false,
        ).floatingLabelStyle as WidgetStateTextStyle?)!
            .resolve(<WidgetState>{WidgetState.error, WidgetState.focused}),
        equals(TextStyle(color: colorScheme.error)),
      );
      // Floating label error hovered style
      expect(
        (FlexSubThemes.inputDecorationTheme(
          colorScheme: colorScheme,
          borderType: FlexInputBorderType.outline,
          useMaterial3: false,
        ).floatingLabelStyle as WidgetStateTextStyle?)!
            .resolve(<WidgetState>{WidgetState.error, WidgetState.hovered}),
        equals(TextStyle(color: colorScheme.error)),
      );
      // Floating label unfocused error style
      expect(
        (FlexSubThemes.inputDecorationTheme(
          colorScheme: colorScheme,
          borderType: FlexInputBorderType.outline,
          useMaterial3: false,
        ).floatingLabelStyle as WidgetStateTextStyle?)!
            .resolve(<WidgetState>{WidgetState.error}),
        equals(
          TextStyle(
              color:
                  colorScheme.error.withValues(alpha: kEnabledBorderOpacity)),
        ),
      );
      // Floating label disabled style
      expect(
        (FlexSubThemes.inputDecorationTheme(
          colorScheme: colorScheme,
          borderType: FlexInputBorderType.outline,
          useMaterial3: false,
          tintedDisabled: true,
        ).floatingLabelStyle as WidgetStateTextStyle?)!
            .resolve(<WidgetState>{WidgetState.disabled}),
        equals(TextStyle(color: tintDisabledColor)),
      );
      // Floating label default style
      expect(
        (FlexSubThemes.inputDecorationTheme(
          colorScheme: colorScheme,
          borderType: FlexInputBorderType.outline,
          useMaterial3: false,
        ).floatingLabelStyle as WidgetStateTextStyle?)!
            .resolve(<WidgetState>{}),
        equals(TextStyle(color: Colors.black.withAlpha(kTintHover))),
      );
      //
      // Outline M3 case
      InputDecorationThemeData m = FlexSubThemes.inputDecorationTheme(
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
          Color.alphaBlend(
            colorScheme.secondaryContainer.withAlpha(0xAA),
            colorScheme.surface,
          ),
        ),
      );
      //
      // Outline border default
      expect(
        (m.border as WidgetStateInputBorder?)!.resolve(<WidgetState>{}),
        equals(
          OutlineInputBorder(
            gapPadding: 4,
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(color: colorScheme.outline, width: 3),
          ),
        ),
      );
      // Outline border disabled (not tinted)
      expect(
        (m.border as WidgetStateInputBorder?)!.resolve(<WidgetState>{
          WidgetState.disabled,
        }),
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
        (m.border as WidgetStateInputBorder?)!.resolve(<WidgetState>{
          WidgetState.error,
        }),
        equals(
          OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(
              color: colorScheme.error.withValues(alpha: kEnabledBorderOpacity),
              width: 3,
            ),
          ),
        ),
      );
      // Outline border error, focused
      expect(
        (m.border as WidgetStateInputBorder?)!.resolve(<WidgetState>{
          WidgetState.error,
          WidgetState.focused,
        }),
        equals(
          OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(color: colorScheme.error, width: 4),
          ),
        ),
      );
      // Outline border error, hovered
      expect(
        (m.border as WidgetStateInputBorder?)!.resolve(<WidgetState>{
          WidgetState.error,
          WidgetState.hovered,
        }),
        equals(
          OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(color: colorScheme.error, width: 3),
          ),
        ),
      );
      // Outline border focused
      expect(
        (m.border as WidgetStateInputBorder?)!.resolve(<WidgetState>{
          WidgetState.focused,
        }),
        equals(
          OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(color: colorScheme.primary, width: 4),
          ),
        ),
      );
      // Outline border focused
      expect(
        (m.border as WidgetStateInputBorder?)!.resolve(<WidgetState>{
          WidgetState.hovered,
        }),
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
        colorScheme.onSurface,
        colorScheme.secondaryContainer,
      );
      final OutlineInputBorder ulAct1 =
          (m.border as WidgetStateInputBorder?)!.resolve(<WidgetState>{
        WidgetState.disabled,
      }) as OutlineInputBorder;
      final OutlineInputBorder ulExp1 = OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(
          color: tintDisable.withValues(alpha: kAlphaLowDisabledFloat),
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
        (m.fillColor as WidgetStateColor?)!.resolve(<WidgetState>{
          WidgetState.disabled,
        }),
        equals(colorScheme.onSurface.withAlpha(kAlphaUltraLowDisabled)),
      );
      expect(
        (m.fillColor as WidgetStateColor?)!.resolve(<WidgetState>{}),
        equals(
          Color.alphaBlend(
            colorScheme.surfaceContainerHighest.withAlpha(0xCC),
            colorScheme.surface,
          ),
        ),
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
          TextStyle(color: colorScheme.onSurface.withAlpha(kAlphaDisabled)),
        ),
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
          TextStyle(color: colorScheme.onSurface.withAlpha(kAlphaDisabled)),
        ),
      );
      expect(
        (m.floatingLabelStyle as WidgetStateTextStyle?)!.resolve(
          <WidgetState>{},
        ),
        equals(TextStyle(color: colorScheme.onSurfaceVariant)),
      );
      //
      // helperStyle
      expect(
        (m.helperStyle as WidgetStateTextStyle?)!.resolve(<WidgetState>{
          WidgetState.disabled,
        }),
        equals(
          TextStyle(color: colorScheme.onSurface.withAlpha(kAlphaDisabled)),
        ),
      );
      expect(
        (m.helperStyle as WidgetStateTextStyle?)!.resolve(<WidgetState>{}),
        equals(TextStyle(color: colorScheme.onSurfaceVariant)),
      );
      //
      // hintStyle
      expect(
        (m.hintStyle as WidgetStateTextStyle?)!.resolve(<WidgetState>{
          WidgetState.disabled,
        }),
        equals(
          TextStyle(color: colorScheme.onSurface.withAlpha(kAlphaDisabled)),
        ),
      );
      expect(
        (m.hintStyle as WidgetStateTextStyle?)!.resolve(<WidgetState>{}),
        equals(TextStyle(color: colorScheme.onSurfaceVariant)),
      );
      //
      // iconColor
      expect(
        (m.iconColor as WidgetStateColor?)!.resolve(<WidgetState>{
          WidgetState.disabled,
        }),
        equals(colorScheme.onSurface.withAlpha(kAlphaDisabled)),
      );
      expect(
        (m.iconColor as WidgetStateColor?)!.resolve(<WidgetState>{
          WidgetState.focused,
        }),
        equals(colorScheme.onSurfaceVariant),
      );
      expect(
        (m.iconColor as WidgetStateColor?)!.resolve(<WidgetState>{}),
        equals(colorScheme.onSurfaceVariant),
      );
      //
      // prefixIconColor
      expect(
        (m.prefixIconColor as WidgetStateColor?)!.resolve(<WidgetState>{
          WidgetState.disabled,
        }),
        equals(colorScheme.onSurface.withAlpha(kAlphaDisabled)),
      );
      expect(
        (m.prefixIconColor as WidgetStateColor?)!.resolve(<WidgetState>{
          WidgetState.focused,
        }),
        equals(colorScheme.onSurfaceVariant),
      );
      expect(
        (m.prefixIconColor as WidgetStateColor?)!.resolve(<WidgetState>{}),
        equals(colorScheme.onSurfaceVariant),
      );
      //
      // suffixIconColor
      expect(
        (m.suffixIconColor as WidgetStateColor?)!.resolve(<WidgetState>{
          WidgetState.error,
        }),
        equals(colorScheme.error),
      );
      expect(
        (m.suffixIconColor as WidgetStateColor?)!.resolve(<WidgetState>{
          WidgetState.error,
          WidgetState.focused,
        }),
        equals(colorScheme.error),
      );
      expect(
        (m.suffixIconColor as WidgetStateColor?)!.resolve(<WidgetState>{
          WidgetState.error,
          WidgetState.hovered,
        }),
        equals(colorScheme.error),
      );
      expect(
        (m.suffixIconColor as WidgetStateColor?)!.resolve(<WidgetState>{
          WidgetState.disabled,
        }),
        equals(colorScheme.onSurface.withAlpha(kAlphaDisabled)),
      );
      expect(
        (m.suffixIconColor as WidgetStateColor?)!.resolve(<WidgetState>{
          WidgetState.focused,
        }),
        equals(colorScheme.onSurfaceVariant),
      );
      expect(
        (m.suffixIconColor as WidgetStateColor?)!.resolve(<WidgetState>{}),
        equals(colorScheme.onSurfaceVariant),
      );
      //
      // Underline border default
      expect(
        (m.border as WidgetStateInputBorder?)!.resolve(<WidgetState>{}),
        equals(
          UnderlineInputBorder(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
            borderSide: BorderSide(color: colorScheme.outline, width: 3),
          ),
        ),
      );
      // Underline border disabled (not tinted)
      expect(
        (m.border as WidgetStateInputBorder?)!.resolve(<WidgetState>{
          WidgetState.disabled,
        }),
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
        (m.border as WidgetStateInputBorder?)!.resolve(<WidgetState>{
          WidgetState.error,
        }),
        equals(
          UnderlineInputBorder(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
            borderSide: BorderSide(
              color: colorScheme.error.withValues(alpha: kEnabledBorderOpacity),
              width: 3,
            ),
          ),
        ),
      );
      // Underline border error, focused
      expect(
        (m.border as WidgetStateInputBorder?)!.resolve(<WidgetState>{
          WidgetState.error,
          WidgetState.focused,
        }),
        equals(
          UnderlineInputBorder(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
            borderSide: BorderSide(color: colorScheme.error, width: 4),
          ),
        ),
      );
      // Underline border error, hovered
      expect(
        (m.border as WidgetStateInputBorder?)!.resolve(<WidgetState>{
          WidgetState.error,
          WidgetState.hovered,
        }),
        equals(
          UnderlineInputBorder(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
            borderSide: BorderSide(color: colorScheme.error, width: 3),
          ),
        ),
      );
      // Underline border focused
      expect(
        (m.border as WidgetStateInputBorder?)!.resolve(<WidgetState>{
          WidgetState.focused,
        }),
        equals(
          UnderlineInputBorder(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
            borderSide: BorderSide(color: colorScheme.primary, width: 4),
          ),
        ),
      );
      // Underline border focused
      expect(
        (m.border as WidgetStateInputBorder?)!.resolve(<WidgetState>{
          WidgetState.hovered,
        }),
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
        colorScheme.onSurface,
        colorScheme.primary,
      );
      final UnderlineInputBorder ulAct =
          (m.border as WidgetStateInputBorder?)!.resolve(<WidgetState>{
        WidgetState.disabled,
      }) as UnderlineInputBorder;
      final UnderlineInputBorder ulExp = UnderlineInputBorder(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(kInputDecoratorRadius),
          topRight: Radius.circular(kInputDecoratorRadius),
        ),
        borderSide: BorderSide(
          color: tintDisabledColor2.withValues(alpha: kAlphaLowDisabledFloat),
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
        equals(
          TextStyle(
            color: FlexSubThemes.tintedDisable(
              colorScheme.onSurface,
              colorScheme.primary,
            ),
          ),
        ),
      );
      expect(
        (m.labelStyle as WidgetStateTextStyle?)!.resolve(<WidgetState>{}),
        equals(TextStyle(color: Colors.black.withAlpha(kTintHover))),
      );
      expect(
        (m.floatingLabelStyle as WidgetStateTextStyle?)!.resolve(
          <WidgetState>{},
        ),
        equals(TextStyle(color: Colors.black.withAlpha(kTintHover))),
      );
      //
      // helperStyle

      expect(
        (m.helperStyle as WidgetStateTextStyle?)!.resolve(<WidgetState>{
          WidgetState.disabled,
        }),
        equals(
          TextStyle(
            color: FlexSubThemes.tintedDisable(
              colorScheme.onSurface,
              colorScheme.primary,
            ),
          ),
        ),
      );
      expect(
        (m.helperStyle as WidgetStateTextStyle?)!.resolve(<WidgetState>{}),
        equals(TextStyle(color: Colors.black.withAlpha(kTintHover))),
      );
      //
      // hintStyle
      expect(
        (m.hintStyle as WidgetStateTextStyle?)!.resolve(<WidgetState>{
          WidgetState.disabled,
        }),
        equals(
          TextStyle(
            color: FlexSubThemes.tintedDisable(
              colorScheme.onSurface,
              colorScheme.primary,
            ),
          ),
        ),
      );
      //
      // iconColor
      expect(
        (m.iconColor as WidgetStateColor?)!.resolve(<WidgetState>{
          WidgetState.disabled,
        }),
        equals(
          FlexSubThemes.tintedDisable(
            colorScheme.onSurface,
            colorScheme.primary,
          ),
        ),
      );
      expect(
        (m.iconColor as WidgetStateColor?)!.resolve(<WidgetState>{
          WidgetState.focused,
        }),
        equals(colorScheme.primary),
      );
      expect(
        (m.iconColor as WidgetStateColor?)!.resolve(<WidgetState>{}),
        equals(Colors.black45),
      );
      //
      // prefixIconColor
      expect(
        (m.prefixIconColor as WidgetStateColor?)!.resolve(<WidgetState>{
          WidgetState.disabled,
        }),
        equals(
          FlexSubThemes.tintedDisable(
            colorScheme.onSurface,
            colorScheme.primary,
          ),
        ),
      );
      expect(
        (m.prefixIconColor as WidgetStateColor?)!.resolve(<WidgetState>{
          WidgetState.focused,
        }),
        equals(colorScheme.primary),
      );
      expect(
        (m.prefixIconColor as WidgetStateColor?)!.resolve(<WidgetState>{}),
        equals(Colors.black45),
      );
      //
      // suffixIconColor
      expect(
        (m.suffixIconColor as WidgetStateColor?)!.resolve(<WidgetState>{
          WidgetState.error,
        }),
        equals(colorScheme.error),
      );
      expect(
        (m.suffixIconColor as WidgetStateColor?)!.resolve(<WidgetState>{
          WidgetState.disabled,
        }),
        equals(
          FlexSubThemes.tintedDisable(
            colorScheme.onSurface,
            colorScheme.primary,
          ),
        ),
      );
      expect(
        (m.suffixIconColor as WidgetStateColor?)!.resolve(<WidgetState>{
          WidgetState.focused,
        }),
        equals(colorScheme.primary),
      );
      expect(
        (m.suffixIconColor as WidgetStateColor?)!.resolve(<WidgetState>{}),
        equals(Colors.black45),
      );
    });
  });
}
