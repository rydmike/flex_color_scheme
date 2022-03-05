import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/const/app_color.dart';
import '../../../../shared/controllers/theme_controller.dart';
import 'tonal_palette_colors.dart';

class ShowTonalPalette extends StatelessWidget {
  const ShowTonalPalette({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    final bool isLight = Theme.of(context).brightness == Brightness.light;

    final FlexSchemeData scheme = AppColor.scheme(controller);

    // Effective FlexSchemeColor depends on usedColors and swap.
    // Note: For TonalPalette's we only use the light scheme as input!
    final FlexSchemeColor colors = FlexSchemeColor.effective(
      scheme.light,
      controller.usedColors,
      swapColors: (isLight && controller.swapLightColors) ||
          (!isLight && controller.swapDarkColors),
      brightness: Brightness.light,
    );

    // Get the FlexTone setup
    final FlexTone tones = AppColor.flexTonesConfig(
      brightness,
      controller.usedFlexToneSetup,
    );
    // Compute all the core Tonal Palettes.
    final FlexCorePalette palettes = FlexCorePalette.fromSeeds(
      primary: colors.primary.value,
      // Pass in null if set to not secondary or tertiary colors seed keys.
      secondary: controller.useSecondary ? colors.secondary.value : null,
      tertiary: controller.useTertiary ? colors.tertiary.value : null,
      // Tone config details we get from active FlexTone.
      primaryChroma: controller.useKeyColors ? tones.primaryChroma : 0,
      primaryMinChroma: controller.useKeyColors ? tones.primaryMinChroma : 0,
      secondaryChroma: controller.useKeyColors ? tones.secondaryChroma : 0,
      secondaryMinChroma:
          controller.useKeyColors ? tones.secondaryMinChroma : 0,
      tertiaryChroma: controller.useKeyColors ? tones.tertiaryChroma : 0,
      tertiaryMinChroma: controller.useKeyColors ? tones.tertiaryMinChroma : 0,
    );
    return Column(
      children: <Widget>[
        TonalPaletteColors(
          tonalPalette: palettes.primary.asList,
          selectedColor: controller.useKeyColors &&
                  controller.hoverTonalPalette == TonalPalettes.primary
              ? controller.hoverColor
              : null,
        ),
        TonalPaletteColors(
          tonalPalette: palettes.secondary.asList,
          selectedColor: controller.useKeyColors &&
                  controller.hoverTonalPalette == TonalPalettes.secondary
              ? controller.hoverColor
              : null,
        ),
        TonalPaletteColors(
          tonalPalette: palettes.tertiary.asList,
          selectedColor: controller.useKeyColors &&
                  controller.hoverTonalPalette == TonalPalettes.tertiary
              ? controller.hoverColor
              : null,
        ),
        TonalPaletteColors(
          tonalPalette: palettes.error.asList,
          selectedColor: controller.useKeyColors &&
                  controller.hoverTonalPalette == TonalPalettes.error
              ? controller.hoverColor
              : null,
        ),
        TonalPaletteColors(
          tonalPalette: palettes.neutral.asList,
          selectedColor: controller.useKeyColors &&
                  controller.hoverTonalPalette == TonalPalettes.neutral
              ? controller.hoverColor
              : null,
        ),
        TonalPaletteColors(
          tonalPalette: palettes.neutralVariant.asList,
          selectedColor: controller.useKeyColors &&
                  controller.hoverTonalPalette == TonalPalettes.neutralVariant
              ? controller.hoverColor
              : null,
        ),
      ],
    );
  }
}
