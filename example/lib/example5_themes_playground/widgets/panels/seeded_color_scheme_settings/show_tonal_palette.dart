import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/const/app_color.dart';
import '../../../../shared/const/flex_tone.dart';
import '../../../../shared/controllers/theme_controller.dart';
import 'tonal_palette_colors.dart';

class ShowTonalPalette extends StatelessWidget {
  const ShowTonalPalette({
    super.key,
    required this.controller,
  });

  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Brightness brightness = theme.brightness;
    final bool isLight = brightness == Brightness.light;

    final FlexSchemeData scheme = AppColor.scheme(controller);

    // Effective FlexSchemeColor depends on usedColors and swap.
    // Note: For TonalPalette's we only use the light scheme as input!
    final FlexSchemeColor colors = FlexSchemeColor.effective(
      scheme.light,
      controller.usedColors,
      swapLegacy: controller.swapLegacyColors && scheme.light.swapOnMaterial3,
      swapColors: (isLight && controller.swapLightColors) ||
          (!isLight && controller.swapDarkColors),
      brightness: Brightness.light,
    );

    // Get the FlexTones setup
    final FlexTones tones =
        FlexTone.values[controller.usedFlexToneSetup].tones(brightness);

    // Compute all the core Tonal Palettes.
    final FlexCorePalette palettes = FlexCorePalette.fromSeeds(
      primary: colors.primary.value,
      // Pass in null if set to not secondary or tertiary colors seed keys.
      secondary: controller.useSecondary ? colors.secondary.value : null,
      tertiary: controller.useTertiary ? colors.tertiary.value : null,
      // If custom surfaceTint is not null, use it as key for neutrals.
      neutral: isLight
          ? controller.surfaceTintLight?.value
          : controller.surfaceTintDark?.value,
      neutralVariant: isLight
          ? controller.surfaceTintLight?.value
          : controller.surfaceTintDark?.value,
      // Tone config details we get from active FlexTones.
      primaryChroma: controller.useKeyColors ? tones.primaryChroma : 0,
      primaryMinChroma: controller.useKeyColors ? tones.primaryMinChroma : 0,
      secondaryChroma: controller.useKeyColors ? tones.secondaryChroma : 0,
      secondaryMinChroma:
          controller.useKeyColors ? tones.secondaryMinChroma : 0,
      tertiaryChroma: controller.useKeyColors ? tones.tertiaryChroma : 0,
      tertiaryMinChroma: controller.useKeyColors ? tones.tertiaryMinChroma : 0,
      tertiaryHueRotation:
          controller.useKeyColors ? tones.tertiaryHueRotation : 0,
      neutralChroma: controller.useKeyColors ? tones.neutralChroma : 0,
      neutralVariantChroma:
          controller.useKeyColors ? tones.neutralVariantChroma : 0,
    );
    // TODO(rydmike): Removed tone hover indication feature 16.3.2023.
    // For some reason tone hover feature started causing issues in WEB release
    // mode builds, but only in WEB release mode on both SKIA and HTML. No idea
    // why that happens only on web release mode and not in its debug mode or
    // any mode VM mode build.
    // Removal of this feature has removed commented code in:
    // - theme_controller.dart
    // - scheme_colors.dart
    // - show_tonal_palette.dart
    // - seeded_color_scheme_settings.dart
    // ------- Commented hover setters below ------
    return Column(
      children: <Widget>[
        TonalPaletteColors(
          name: 'Primary',
          tonalPalette: palettes.primary.asList,
          // selectedColor: controller.useKeyColors &&
          //         controller.hoverTonalPalette == TonalPalettes.primary
          //     ? controller.hoverColor
          //     : null,
        ),
        TonalPaletteColors(
          name: 'Secondary',
          tonalPalette: palettes.secondary.asList,
          // selectedColor: controller.useKeyColors &&
          //         controller.hoverTonalPalette == TonalPalettes.secondary
          //     ? controller.hoverColor
          //     : null,
        ),
        TonalPaletteColors(
          name: 'Tertiary',
          tonalPalette: palettes.tertiary.asList,
          // selectedColor: controller.useKeyColors &&
          //         controller.hoverTonalPalette == TonalPalettes.tertiary
          //     ? controller.hoverColor
          //     : null,
        ),
        TonalPaletteColors(
          name: 'Error',
          tonalPalette: palettes.error.asList,
          // selectedColor: controller.useKeyColors &&
          //         controller.hoverTonalPalette == TonalPalettes.error
          //     ? controller.hoverColor
          //     : null,
        ),
        TonalPaletteColors(
          name: 'Neutral',
          tonalPalette: palettes.neutral.asList,
          // selectedColor: controller.useKeyColors &&
          //         controller.hoverTonalPalette == TonalPalettes.neutral
          //     ? controller.hoverColor
          //     : null,
        ),
        TonalPaletteColors(
          name: 'Neutral variant',
          tonalPalette: palettes.neutralVariant.asList,
          // selectedColor: controller.useKeyColors &&
          //       controller.hoverTonalPalette == TonalPalettes.neutralVariant
          //     ? controller.hoverColor
          //     : null,
        ),
      ],
    );
  }
}
