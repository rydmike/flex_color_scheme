import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/const/app_color.dart';
import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/controllers/tone_indicator_controller.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import 'tonal_palette_colors.dart';

class ShowTonalPalette extends StatelessWidget {
  const ShowTonalPalette({
    super.key,
    required this.themController,
    required this.toneController,
  });

  final ThemeController themController;
  final ToneIndicatorController toneController;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Brightness brightness = theme.brightness;
    final bool isLight = brightness == Brightness.light;

    final bool useMonochrome = themController.useMonoSurfacesLight && isLight ||
        themController.useMonoSurfacesDark && !isLight;

    final FlexSchemeData scheme = AppColor.scheme(themController);

    // Effective FlexSchemeColor depends on usedColors and swaps.
    // Note: For the TonalPalette's we only use the light scheme as input!
    final FlexSchemeColor colors = FlexSchemeColor.effective(
      scheme.light,
      themController.usedColors,
      swapLegacy:
          themController.swapLegacyColorsInM3 && scheme.light.swapOnMaterial3,
      swapColors:
          (isLight && themController.swapPrimaryAndSecondaryLightColors) ||
              (!isLight && themController.swapPrimaryAndSecondaryDarkColors),
      brightness: Brightness.light,
    );

    // Get the FlexTones setup
    final FlexTones tones = FlexSchemeVariant
        .values[themController.usedFlexToneSetup]
        .tones(brightness);

    // Lists of ints that we need to draw the tonal palettes.
    List<int> primaryTonals = <int>[];
    List<int> secondaryTonals = <int>[];
    List<int> tertiaryTonals = <int>[];
    List<int> errorTonals = <int>[];
    List<int> neutralTonals = <int>[];
    List<int> neutralVariantTonals = <int>[];

    // Which variant is being used?
    final FlexSchemeVariant usedVariant =
        FlexSchemeVariant.values[themController.usedFlexToneSetup];

    // But error input dark mode colors also when we use toDark
    final FlexSchemeColor inputErrColor = isLight
        ? AppColor.scheme(themController).light
        : AppColor.scheme(themController).dark;

    // Input errorColors
    final Color inputErrorColor = inputErrColor.error ??
        (isLight ? FlexColor.materialLightError : FlexColor.materialDarkError);

    // Are we using a Flutter SDK scheme? Otherwise use FlexTone.
    if (usedVariant.isFlutterScheme || !themController.useKeyColors) {
      // Get DynamicScheme tones if using Flutter SDK scheme.
      final DynamicScheme dynamicScheme = SeedColorScheme.buildDynamicScheme(
        brightness: brightness,
        primarySeedColor: colors.primary,
        secondarySeedColor:
            themController.useSecondary ? colors.secondary : null,
        tertiarySeedColor: themController.useTertiary ? colors.tertiary : null,
        errorSeedColor: themController.useError ? inputErrorColor : null,
        neutralSeedColor: isLight
            ? themController.surfaceTintLight
            : themController.surfaceTintDark,
        neutralVariantSeedColor: isLight
            ? themController.surfaceTintLight
            : themController.surfaceTintDark,
        variant: themController.useKeyColors
            ? usedVariant
            : FlexSchemeVariant.monochrome,
        contrastLevel: themController.dynamicContrastLevel,
        useExpressiveOnContainerColors: themController.expressiveOnContainer,
        respectMonochromeSeed: !themController.useLegacyMonochromeSeedBehavior,
      );

      // Assign the tonals for the schemes to the int lists using tone indexes
      // from FlexTonalPalette based on used type.
      for (final int i in FlexTonalPalette.extendedTones) {
        primaryTonals.add(dynamicScheme.primaryPalette.get(i));
        secondaryTonals.add(dynamicScheme.secondaryPalette.get(i));
        tertiaryTonals.add(dynamicScheme.tertiaryPalette.get(i));
        errorTonals.add(dynamicScheme.errorPalette.get(i));
        neutralTonals.add(dynamicScheme.neutralPalette.get(i));
        neutralVariantTonals.add(dynamicScheme.neutralVariantPalette.get(i));
      }
    } else {
      // Compute all the core Tonal Palettes.
      final FlexCorePalette palettes = FlexCorePalette.fromSeeds(
        primary: colors.primary.value,
        // Null if set to not use secondary, tertiary or error seed keys.
        secondary: themController.useSecondary ? colors.secondary.value : null,
        tertiary: themController.useTertiary ? colors.tertiary.value : null,
        error: themController.useError ? inputErrorColor.value : null,
        // If custom surfaceTint is not null, use it as key for neutrals.
        neutral: isLight
            ? themController.surfaceTintLight?.value
            : themController.surfaceTintDark?.value,
        neutralVariant: isLight
            ? themController.surfaceTintLight?.value
            : themController.surfaceTintDark?.value,
        // The tone config details we get from the active FlexTones.
        primaryChroma: tones.primaryChroma,
        primaryMinChroma: tones.primaryMinChroma,
        secondaryChroma: tones.secondaryChroma,
        secondaryMinChroma: tones.secondaryMinChroma,
        tertiaryChroma: tones.tertiaryChroma,
        tertiaryMinChroma: tones.tertiaryMinChroma,
        tertiaryHueRotation: tones.tertiaryHueRotation,
        errorChroma: tones.errorChroma,
        errorMinChroma: tones.errorMinChroma,
        neutralChroma: useMonochrome ? 0 : tones.neutralChroma,
        neutralVariantChroma: useMonochrome ? 0 : tones.neutralVariantChroma,
        paletteType: FlexPaletteType.extended,
        respectMonochromeSeed: !themController.useLegacyMonochromeSeedBehavior,
      );

      // Assign the tonals for the schemes to the int lists.
      primaryTonals = palettes.primary.asList;
      secondaryTonals = palettes.secondary.asList;
      tertiaryTonals = palettes.tertiary.asList;
      errorTonals = palettes.error.asList;
      neutralTonals = palettes.neutral.asList;
      neutralVariantTonals = palettes.neutralVariant.asList;
    }

    return Column(
      children: <Widget>[
        const ListTileReveal(
          contentPadding: EdgeInsetsDirectional.only(end: 12),
          title: Text('Tonal color palettes'),
          subtitleReveal: Text(
            'Tonal palettes and their tones are shown in order:\n'
            '  - Primary palette\n'
            '  - Secondary palette\n'
            '  - Tertiary palette\n'
            '  - Error palette\n'
            '  - Neutral palette\n'
            '  - Neutral variant palette\n'
            '\n'
            'The FSS based light and dark mode ColorScheme colors are picked '
            'from these palettes and these predefined color tones when using '
            'seed generated ColorSchemes. The MCU based Flutter SDK dynamic '
            'schemes also use these palettes for their generated ColorSchemes. '
            'Typically their tones are also from this fixed list of tones, '
            'but some of the dynamic schemes may use and create color '
            'tones dynamically, that are not included in '
            'the predefined tones below.',
          ),
        ),
        TonalPaletteColors(
          name: 'Primary',
          tonalPalette: primaryTonals,
          paletteType: FlexPaletteType.extended,
          selectedColor: themController.useKeyColors &&
                  toneController.hoverTonalPalette == TonalPalettes.primary
              ? toneController.hoverColor
              : null,
        ),
        TonalPaletteColors(
          name: 'Secondary',
          tonalPalette: secondaryTonals,
          selectedColor: themController.useKeyColors &&
                  toneController.hoverTonalPalette == TonalPalettes.secondary
              ? toneController.hoverColor
              : null,
        ),
        TonalPaletteColors(
          name: 'Tertiary',
          tonalPalette: tertiaryTonals,
          selectedColor: themController.useKeyColors &&
                  toneController.hoverTonalPalette == TonalPalettes.tertiary
              ? toneController.hoverColor
              : null,
        ),
        TonalPaletteColors(
          name: 'Error',
          tonalPalette: errorTonals,
          selectedColor: themController.useKeyColors &&
                  toneController.hoverTonalPalette == TonalPalettes.error
              ? toneController.hoverColor
              : null,
        ),
        TonalPaletteColors(
          name: 'Neutral',
          tonalPalette: neutralTonals,
          selectedColor: themController.useKeyColors &&
                  toneController.hoverTonalPalette == TonalPalettes.neutral
              ? toneController.hoverColor
              : null,
        ),
        TonalPaletteColors(
          name: 'Neutral variant',
          tonalPalette: neutralVariantTonals,
          selectedColor: themController.useKeyColors &&
                  toneController.hoverTonalPalette ==
                      TonalPalettes.neutralVariant
              ? toneController.hoverColor
              : null,
        ),
      ],
    );
  }
}
