import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flex_color_scheme/src/flex_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WITH: FlexSubThemes.chipTheme ', () {
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

      final Color backgroundColor = colorScheme.primaryContainer.blendAlpha(
        colorScheme.surface,
        kChipBackgroundAlphaBlend,
      );
      final Color selectedColor = colorScheme.primaryContainer.blendAlpha(
        colorScheme.surface,
        kChipSelectedBackgroundAlphaBlend,
      );
      final Color secondarySelectedColor = colorScheme.primaryContainer
          .blendAlpha(colorScheme.surface, kChipSelectedBackgroundAlphaBlend);

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
            backgroundColor: backgroundColor,
            disabledColor: backgroundColor.withValues(
              alpha: kAlphaLowDisabledFloat,
            ),
            selectedColor: selectedColor,
            secondarySelectedColor: secondarySelectedColor,
            checkmarkColor: Colors.black87,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            iconTheme: const IconThemeData(color: Colors.black87, size: 18.0),
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

      final Color backgroundColor = colorScheme.primaryContainer.blendAlpha(
        colorScheme.surface,
        kChipBackgroundAlphaBlend,
      );
      final Color selectedColor = colorScheme.primaryContainer.blendAlpha(
        colorScheme.surface,
        kChipSelectedBackgroundAlphaBlend,
      );
      final Color secondarySelectedColor = colorScheme.primaryContainer
          .blendAlpha(colorScheme.surface, kChipSelectedBackgroundAlphaBlend);

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
            backgroundColor: backgroundColor,
            disabledColor: FlexSubThemes.tintedDisable(
              backgroundColor,
              selectedColor,
            ).withValues(alpha: kAlphaLowDisabledFloat),
            selectedColor: selectedColor,
            secondarySelectedColor: secondarySelectedColor,
            checkmarkColor: Colors.black87,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            iconTheme: const IconThemeData(color: Colors.black87, size: 18.0),
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
        FlexSubThemes.chipTheme(colorScheme: colorScheme),
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
            iconTheme: const IconThemeData(size: 18.0, color: Colors.white70),
            disabledColor: FlexSubThemes.tintedDisable(
              colorScheme.primary,
              colorScheme.secondaryContainer,
            ).withValues(alpha: kAlphaLowDisabledFloat),
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
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      );
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
            iconTheme: const IconThemeData(color: Colors.white70, size: 18.0),
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
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      );
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
            iconTheme: const IconThemeData(color: Colors.white70, size: 18.0),
            disabledColor: FlexSubThemes.tintedDisable(
              colorScheme.tertiary,
              colorScheme.secondaryContainer,
            ).withValues(alpha: kAlphaLowDisabledFloat),
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
            iconTheme: const IconThemeData(color: Colors.white70, size: 18.0),
            disabledColor: FlexSubThemes.tintedDisable(
              colorScheme.tertiary,
              colorScheme.tertiaryContainer,
            ).withValues(alpha: kAlphaLowDisabledFloat),
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
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      );
      final TextTheme textTheme = Typography.material2021(
        platform: TargetPlatform.android,
        colorScheme: colorScheme,
      ).black;
      final Color backgroundColor = colorScheme.tertiary.blendAlpha(
        colorScheme.surface,
        kChipBackgroundAlphaBlend,
      );
      const Color onBackgroundColor = Colors.black87;
      final Color selectedColor = colorScheme.tertiaryContainer.blendAlpha(
        colorScheme.surface,
        kChipSelectedBackgroundAlphaBlend,
      );
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
            iconTheme: const IconThemeData(color: Colors.black87, size: 18.0),
            disabledColor: FlexSubThemes.tintedDisable(
              backgroundColor,
              selectedColor,
            ).withValues(alpha: kAlphaLowDisabledFloat),
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
              borderRadius: BorderRadius.all(Radius.circular(kChipRadius)),
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
            disabledColor: colorScheme.onSurface.withValues(
              alpha: kAlphaLowDisabledFloat,
            ),
          ),
        ),
      );
    });
  });
}
