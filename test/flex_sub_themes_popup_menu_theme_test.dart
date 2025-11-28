import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flex_color_scheme/src/flex_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: deprecated_member_use_from_same_package, for tests.

void main() {
  group('WITH: FlexSubThemes.popupMenuTheme ', () {
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
            labelTextStyle: WidgetStateProperty.resolveWith((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.disabled)) {
                return const TextStyle().apply(
                  color: Colors.white.withAlpha(kAlphaDisabled),
                );
              }
              return const TextStyle().apply(color: Colors.white);
            }),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
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
        equals(
          TextStyle(
            color: colorScheme.tertiaryContainer.withAlpha(kAlphaDisabled),
          ),
        ),
      );
      expect(
        m.labelTextStyle!.resolve(<WidgetState>{}),
        equals(TextStyle(color: colorScheme.tertiaryContainer)),
      );
    });
  });

}
