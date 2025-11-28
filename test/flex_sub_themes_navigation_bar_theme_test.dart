import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: deprecated_member_use_from_same_package, for tests.

void main() {
  group('WITH: FlexSubThemes.navigationBarTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes NavigationBar tests
    // -------------------------------------------------------------------------
    test(
        'NavigationBar FST21.1: GIVEN a default '
        'FlexSubTheme.navigationBarTheme() '
        'EXPECT equal to NavigationBarThemeData() version '
        'with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
      );
      final TextTheme textTheme = Typography.material2021(
        platform: TargetPlatform.android,
        colorScheme: colorScheme,
      ).black;
      expect(
        FlexSubThemes.navigationBarTheme(colorScheme: colorScheme).toString(),
        equalsIgnoringHashCodes(
          NavigationBarThemeData(
            height: null,
            elevation: null,
            labelBehavior: null,
            backgroundColor: colorScheme.surfaceContainer,
            indicatorColor: colorScheme.secondaryContainer,
            labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((
              Set<WidgetState> states,
            ) {
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
            }),
            iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.selected)) {
                return IconThemeData(size: 24, color: colorScheme.onSurface);
              }
              return IconThemeData(
                size: 24,
                color: colorScheme.onSurfaceVariant,
              );
            }),
          ).toString(),
        ),
      );
    });

    test(
        'NavigationBar FST21.2 custom1: GIVEN a custom1 '
        'FlexSubTheme.navigationBarTheme() '
        'EXPECT equal to NavigationBarThemeData() version '
        'with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
      );
      final TextTheme textTheme = Typography.material2021(
        platform: TargetPlatform.android,
        colorScheme: colorScheme,
      ).black;
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
            backgroundColor: colorScheme.surfaceContainer.withValues(
              alpha: 0.9,
            ),
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            indicatorColor: colorScheme.secondaryContainer.withAlpha(0x3D),
            indicatorShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.selected)) {
                return textTheme.labelSmall!.copyWith(color: colorScheme.error);
              }
              return textTheme.labelSmall!.copyWith(
                color: colorScheme.error
                    .blendAlpha(colorScheme.error, 0x66)
                    .withAlpha(0xA5),
              );
            }),
            iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.selected)) {
                return IconThemeData(size: 24, color: colorScheme.secondary);
              }
              return IconThemeData(
                size: 24,
                color: colorScheme.onSurface
                    .blendAlpha(colorScheme.onSurface, 0x66)
                    .withAlpha(0xA5),
              );
            }),
          ).toString(),
        ),
      );
      // Does it have the right states?
      expect(
        navBarTheme.iconTheme!.resolve(<WidgetState>{
          WidgetState.selected,
        })?.color,
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
        navBarTheme.labelTextStyle!.resolve(<WidgetState>{
          WidgetState.selected,
        })?.color,
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
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
      );
      final TextTheme textTheme = Typography.material2021(
        platform: TargetPlatform.android,
        colorScheme: colorScheme,
      ).black;
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
            backgroundColor: colorScheme.error.withValues(alpha: 0.9),
            indicatorColor: colorScheme.secondary.withAlpha(0x3D),
            labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.selected)) {
                return textTheme.bodySmall!.copyWith(
                  color: colorScheme.primaryContainer,
                );
              }
              return textTheme.bodySmall!.copyWith(
                color: colorScheme.onSurface,
              );
            }),
            iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.selected)) {
                return IconThemeData(
                  size: 28,
                  color: colorScheme.secondaryContainer,
                );
              }
              return IconThemeData(size: 25, color: colorScheme.onSurface);
            }),
          ).toString(),
        ),
      );
      // Does it have the right states?
      expect(
        navBarTheme.iconTheme!.resolve(<WidgetState>{
          WidgetState.selected,
        })?.color,
        equals(colorScheme.secondaryContainer),
      );
      expect(
        navBarTheme.iconTheme!.resolve(<WidgetState>{
          WidgetState.selected,
        })?.size,
        equals(28),
      );
      expect(
        navBarTheme.iconTheme!.resolve(<WidgetState>{})?.color,
        equals(colorScheme.onSurface),
      );
      expect(navBarTheme.iconTheme!.resolve(<WidgetState>{})?.size, equals(25));
      expect(
        navBarTheme.labelTextStyle!.resolve(<WidgetState>{
          WidgetState.selected,
        })?.color,
        equals(colorScheme.primaryContainer),
      );
      expect(
        navBarTheme.labelTextStyle!.resolve(<WidgetState>{})?.color,
        equals(colorScheme.onSurface),
      );
    });
  });
}
