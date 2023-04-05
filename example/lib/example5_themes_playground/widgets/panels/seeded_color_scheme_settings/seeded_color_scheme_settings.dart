import 'package:flutter/material.dart';

import '../../../../shared/const/app_color.dart';
import '../../../../shared/const/flex_tone.dart';
import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/switch_list_tile_reveal.dart';
import '../../shared/show_input_colors_switch.dart';
import '../../shared/use_seeded_color_scheme_switch.dart';
import 'flex_tone_config_popup_menu.dart';
import 'scheme_colors.dart';
import 'show_tonal_palette.dart';

// Panel used to show effective color scheme, when using keys to seed it
// and just using raw FlexSchemeColors input data too based ColorScheme too.
class SeededColorSchemeSettings extends StatelessWidget {
  const SeededColorSchemeSettings(
    this.controller, {
    super.key,
  });
  final ThemeController controller;

  String get _flexToneName {
    if (controller.useKeyColors) {
      return FlexTone.values[controller.usedFlexToneSetup].tone;
    } else {
      return FlexTone.values[0].tone;
    }
  }

  String get _flexToneSetup {
    if (controller.useKeyColors) {
      return FlexTone.values[controller.usedFlexToneSetup].setup;
    } else {
      return FlexTone.values[0].setup;
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    // TODO(rydmike): Removed tone hover indication feature 16.3.2023.
    // final bool showBlendInfo = ((isLight && controller.blendLevel > 0) ||
    //         (!isLight && controller.blendLevelDark > 0)) &&
    //     controller.useKeyColors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        UseSeededColorSchemeSwitch(controller: controller, explainMore: false),
        FlexToneConfigPopupMenu(
          title: 'ColorScheme made with FlexTones',
          index: controller.useKeyColors ? controller.usedFlexToneSetup : 0,
          onChanged:
              controller.useKeyColors ? controller.setUsedFlexToneSetup : null,
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ShowTonalPalette(controller: controller),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 4),
          child: SchemeColors(tc: controller),
        ),
        if (controller.schemeIndex != (AppColor.schemes.length - 1))
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Tap a color code to copy it to the clipboard.',
              // TODO(rydmike): Removed tone hover indication feature 16.3.2023.
              //'\n'
              // ignore: lines_longer_than_80_chars
              // "${controller.useKeyColors ? 'Hover a color to highlight its tonal palette source color above. ' : ''}"
              // ignore: lines_longer_than_80_chars
              // "${showBlendInfo ? 'Surface blend is used, it modifies surface and background colors, they may not be found in palettes when hovered.' : '\n'}",
              style: theme.textTheme.labelSmall,
            ),
          ),
        if (controller.schemeIndex == (AppColor.schemes.length - 1))
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'This is the custom color theme, you can tap on primary, '
              'secondary or tertiary colors, plus their container colors to '
              'change them.',
              // TODO(rydmike): Removed tone hover indication feature 16.3.2023.
              //'\n'
              // ignore: lines_longer_than_80_chars
              // "${controller.useKeyColors ? 'Hover a color to highlight its tonal palette source color above. ' : ''}"
              // ignore: lines_longer_than_80_chars
              // "${showBlendInfo ? 'Surface blend is used, it modifies surface and background colors, they may not be found in palettes when hovered.' : '\n'}",
              style: theme.textTheme.labelSmall,
            ),
          ),
        const ListTileReveal(
          title: Text('Keep a theme brand color when using seeds?'),
          subtitleDense: true,
          subtitle: Text('With the switches on the colors above you can lock '
              'primary, secondary, tertiary and their container colors to '
              'their scheme input defined colors instead of using the color '
              'from the seeded tonal palette. The switches have separate '
              'states for light and dark theme.\n'),
        ),
        if (isLight) ...<Widget>[
          SwitchListTileReveal(
            title: const Text('Use black and white as onColors on main colors'),
            subtitleDense: true,
            subtitle:
                const Text('Main colors are primary, secondary, tertiary, '
                    'error and their container colors.\n'),
            value: controller.onMainsUseBWLight && controller.useKeyColors,
            onChanged: controller.useKeyColors
                ? controller.setOnMainsUseBWLight
                : null,
          ),
          SwitchListTileReveal(
            title: const Text('Use black and white as onColors on surfaces'),
            subtitleDense: true,
            subtitle: const Text('Surfaces are background, surface, '
                'surfaceVariant and inverseSurface colors.\n'),
            value: controller.onSurfacesUseBWLight && controller.useKeyColors,
            onChanged: controller.useKeyColors
                ? controller.setOnSurfacesUseBWLight
                : null,
          ),
        ] else ...<Widget>[
          SwitchListTileReveal(
            title: const Text('Use black and white as onColors on main colors'),
            subtitleDense: true,
            subtitle:
                const Text('Main colors are primary, secondary, tertiary, '
                    'error and their container colors.\n'),
            value: controller.onMainsUseBWDark && controller.useKeyColors,
            onChanged:
                controller.useKeyColors ? controller.setOnMainsUseBWDark : null,
          ),
          SwitchListTileReveal(
            title: const Text('Use black and white as onColors on surfaces'),
            subtitleDense: true,
            subtitle: const Text('Surfaces are background, surface, '
                'surfaceVariant and inverseSurface colors.\n'),
            value: controller.onSurfacesUseBWDark && controller.useKeyColors,
            onChanged: controller.useKeyColors
                ? controller.setOnSurfacesUseBWDark
                : null,
          ),
        ],
        ShowInputColorsSwitch(controller: controller),
        if (!isLight && controller.schemeIndex == (AppColor.schemes.length - 1))
          SwitchListTileReveal(
              dense: true,
              title: const Text('Custom dark scheme uses its own key colors'),
              subtitle: const Text(
                'Turn ON to use its dark input colors as seed keys for the '
                'dark theme. This option is only available when using a '
                'custom dark scheme.\n',
              ),
              value: controller.useDarkColorsForSeed &&
                  controller.useKeyColors &&
                  controller.schemeIndex == AppColor.schemes.length - 1,
              onChanged: controller.useKeyColors &&
                      controller.schemeIndex == AppColor.schemes.length - 1
                  ? controller.setUseDarkColorsForSeed
                  : null),
        const ListTileReveal(
          title: Text('FlexTones'),
          subtitleDense: true,
          subtitle: Text(
            'With FlexTones, you can configure which tone from '
            'generated palettes each color in the ColorScheme use. '
            'Set limits on used CAM16 chroma values '
            'for the three colors used as keys for primary, '
            'secondary and tertiary TonalPalettes. '
            'In this app you can choose between the default Material-3 tone '
            'mapping, plus eight pre-defined custom FlexTones setups. With '
            'the API you can make your own FlexTones configurations.',
          ),
        ),
        ListTile(
          dense: true,
          title: Text('$_flexToneName'
              ' FlexTones setup has CAM16 chroma:'),
          subtitle: Text(_flexToneSetup),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
