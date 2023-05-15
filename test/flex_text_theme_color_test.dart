import 'package:flex_color_scheme/src/flex_text_theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

//****************************************************************************
// These simple FlexColor unit test just monitors that the used color values
// for the standard material color schemes included in the SDK, match the ones
// defined in FlexColor. If either changes in the future, the tests will fail.
// They also ensure that we have not changed our own used scheme color values.
//****************************************************************************

void main() {
  //****************************************************************************
  // TextThemeColor unit tests - TextThemeColor utility makes null colored font.
  //****************************************************************************
  group('FTTC01: TextThemeColor.nullFontColor makes font color null.', () {
    test('FTTC01.01: GIVEN a font, test all style has color', () {
      final TextTheme font = ThemeData.light().textTheme;
      expect(font.displayLarge?.color, isNotNull);
      expect(font.displayMedium?.color, isNotNull);
      expect(font.displaySmall?.color, isNotNull);
      //
      expect(font.headlineLarge?.color, isNotNull);
      expect(font.headlineMedium?.color, isNotNull);
      expect(font.headlineSmall?.color, isNotNull);
      //
      expect(font.bodyLarge?.color, isNotNull);
      expect(font.bodyMedium?.color, isNotNull);
      expect(font.bodySmall?.color, isNotNull);
      //
      expect(font.labelLarge?.color, isNotNull);
      expect(font.labelMedium?.color, isNotNull);
      expect(font.labelSmall?.color, isNotNull);
    });
    test(
        'FTTC01.02: GIVEN a font with colors, and apply null FontColor, '
        'test all style has NULL color', () {
      final TextTheme font =
          TextThemeColor.nullFontColor(ThemeData.light().textTheme);
      expect(font.displayLarge?.color, isNull);
      expect(font.displayMedium?.color, isNull);
      expect(font.displaySmall?.color, isNull);
      //
      expect(font.headlineLarge?.color, isNull);
      expect(font.headlineMedium?.color, isNull);
      expect(font.headlineSmall?.color, isNull);
      //
      expect(font.bodyLarge?.color, isNull);
      expect(font.bodyMedium?.color, isNull);
      expect(font.bodySmall?.color, isNull);
      //
      expect(font.labelLarge?.color, isNull);
      expect(font.labelMedium?.color, isNull);
      expect(font.labelSmall?.color, isNull);
    });
  });
}
