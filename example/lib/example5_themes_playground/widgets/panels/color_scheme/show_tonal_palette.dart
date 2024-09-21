import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/const/app_color.dart';
import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
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

    final bool useMonochrome = controller.useMonoSurfacesLight && isLight ||
        controller.useMonoSurfacesDark && !isLight;

    final FlexSchemeData scheme = AppColor.scheme(controller);

    // Effective FlexSchemeColor depends on usedColors and swaps.
    // Note: For the TonalPalette's we only use the light scheme as input!
    final FlexSchemeColor colors = FlexSchemeColor.effective(
      scheme.light,
      controller.usedColors,
      swapLegacy: controller.swapLegacyColors && scheme.light.swapOnMaterial3,
      swapColors: (isLight && controller.swapLightColors) ||
          (!isLight && controller.swapDarkColors),
      brightness: Brightness.light,
    );

    // Get the FlexTones setup
    final FlexTones tones = FlexSchemeVariant
        .values[controller.usedFlexToneSetup]
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
        FlexSchemeVariant.values[controller.usedFlexToneSetup];

    // But error input dark mode colors also when we use toDark
    final FlexSchemeColor inputErrColor = isLight
        ? AppColor.scheme(controller).light
        : AppColor.scheme(controller).dark;

    // Input errorColors
    final Color inputErrorColor = inputErrColor.error ??
        (isLight ? FlexColor.materialLightError : FlexColor.materialDarkError);

    // Are we using a Flutter SDK scheme? Otherwise use FlexTone.
    if (usedVariant.isFlutterScheme || !controller.useKeyColors) {
      // Get DynamicScheme tones if using Flutter SDK scheme.
      final DynamicScheme dynamicScheme = SeedColorScheme.buildDynamicScheme(
        brightness: brightness,
        primarySeedColor: colors.primary,
        secondarySeedColor: controller.useSecondary ? colors.secondary : null,
        tertiarySeedColor: controller.useTertiary ? colors.tertiary : null,
        errorSeedColor: controller.useError ? inputErrorColor : null,
        neutralSeedColor:
            isLight ? controller.surfaceTintLight : controller.surfaceTintDark,
        neutralVariantSeedColor:
            isLight ? controller.surfaceTintLight : controller.surfaceTintDark,
        variant: controller.useKeyColors
            ? usedVariant
            : FlexSchemeVariant.monochrome,
        contrastLevel: controller.dynamicContrastLevel,
        useExpressiveOnContainerColors: controller.expressiveOnContainer,
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
        secondary: controller.useSecondary ? colors.secondary.value : null,
        tertiary: controller.useTertiary ? colors.tertiary.value : null,
        error: controller.useError ? inputErrorColor.value : null,
        // If custom surfaceTint is not null, use it as key for neutrals.
        neutral: isLight
            ? controller.surfaceTintLight?.value
            : controller.surfaceTintDark?.value,
        neutralVariant: isLight
            ? controller.surfaceTintLight?.value
            : controller.surfaceTintDark?.value,
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
      );

      // Assign the tonals for the schemes to the int lists.
      primaryTonals = palettes.primary.asList;
      secondaryTonals = palettes.secondary.asList;
      tertiaryTonals = palettes.tertiary.asList;
      errorTonals = palettes.error.asList;
      neutralTonals = palettes.neutral.asList;
      neutralVariantTonals = palettes.neutralVariant.asList;
    }

    // TODO(rydmike): Removed tone hover indication feature 16.3.2023.
    // For some reason tone hover feature started causing issues in WEB release
    // mode builds, but only in WEB release mode on both SKIA and HTML. No idea
    // why that happens only on web release mode and not in its debug mode or
    // any mode VM mode build.
    // Removal of this feature has removed commented code in:
    // - theme_controller.dart
    // - scheme_colors.dart
    // - show_tonal_palette.dart
    // - color_scheme_settings.dart
    // ------- Commented hover setters below ------
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
          // selectedColor: controller.useKeyColors &&
          //         controller.hoverTonalPalette == TonalPalettes.primary
          //     ? controller.hoverColor
          //     : null,
        ),
        TonalPaletteColors(
          name: 'Secondary',
          tonalPalette: secondaryTonals,
          // selectedColor: controller.useKeyColors &&
          //         controller.hoverTonalPalette == TonalPalettes.secondary
          //     ? controller.hoverColor
          //     : null,
        ),
        TonalPaletteColors(
          name: 'Tertiary',
          tonalPalette: tertiaryTonals,
          // selectedColor: controller.useKeyColors &&
          //         controller.hoverTonalPalette == TonalPalettes.tertiary
          //     ? controller.hoverColor
          //     : null,
        ),
        TonalPaletteColors(
          name: 'Error',
          tonalPalette: errorTonals,
          // selectedColor: controller.useKeyColors &&
          //         controller.hoverTonalPalette == TonalPalettes.error
          //     ? controller.hoverColor
          //     : null,
        ),
        TonalPaletteColors(
          name: 'Neutral',
          tonalPalette: neutralTonals,
          // selectedColor: controller.useKeyColors &&
          //         controller.hoverTonalPalette == TonalPalettes.neutral
          //     ? controller.hoverColor
          //     : null,
        ),
        TonalPaletteColors(
          name: 'Neutral variant',
          tonalPalette: neutralVariantTonals,
          // selectedColor: controller.useKeyColors &&
          //       controller.hoverTonalPalette == TonalPalettes.neutralVariant
          //     ? controller.hoverColor
          //     : null,
        ),
      ],
    );
  }
}
