import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/const/app_color.dart';
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
class ColorSchemeSettings extends StatelessWidget {
  const ColorSchemeSettings(
    this.controller, {
    super.key,
  });
  final ThemeController controller;

  String get _flexToneName {
    if (controller.useKeyColors) {
      return FlexSchemeVariant.values[controller.usedFlexToneSetup].variantName;
    } else {
      return FlexSchemeVariant.values[0].variantName;
    }
  }

  bool get _isFlutterScheme =>
      FlexSchemeVariant.values[controller.usedFlexToneSetup].isFlutterScheme;

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
          flexToneName: _flexToneName,
          index: controller.useKeyColors ? controller.usedFlexToneSetup : 0,
          onChanged:
              controller.useKeyColors ? controller.setUsedFlexToneSetup : null,
        ),
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ShowTonalPalette(controller: controller),
        ),
        ListTileReveal(
          enabled: controller.useKeyColors,
          title: const Text('Keep brand colors when using seeded scheme?'),
          dense: true,
          subtitle: const Text(
            'With the switches on the colors below you can '
            'lock primary, secondary, tertiary and their container colors to '
            'their scheme input defined colors, instead of using the color '
            'from the seeded tonal palette. The switches have separate '
            'states for light and dark theme mode.\n',
          ),
        ),
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
        if (_isFlutterScheme)
          const ListTile(
            dense: true,
            title: Text('Additional seed generation options are not '
                'available when using Flutter MCU dynamic scheme variants. '
                'Use a variant based on FSS FlexTones for the options below.'),
          )
        else
          const ListTile(
            dense: true,
            title: Text('These additional seed generated scheme options are '
                'available when using FSS FlexTones based scheme variants:'),
          ),
        if (isLight) ...<Widget>[
          SwitchListTileReveal(
            title: const Text('Black & white main onColors'),
            subtitleDense: true,
            subtitle: const Text(
              'Main colors are primary, secondary, tertiary, '
              'error, their container and fixed colors. Using black and white '
              'as onColors on the main colors may improve '
              'contrast, it also makes the theme less color expressive.\n',
            ),
            value: controller.onMainsUseBWLight &&
                controller.useKeyColors &&
                !_isFlutterScheme,
            onChanged: controller.useKeyColors && !_isFlutterScheme
                ? controller.setOnMainsUseBWLight
                : null,
          ),
          SwitchListTileReveal(
            title: const Text('Black & white surface onColors'),
            subtitleDense: true,
            subtitle: const Text(
              'Surface onColors are onSurface, onSurfaceVariant and '
              'onInverseSurface colors. Using black and white as onColors on '
              'all surfaces may improve contrast.\n',
            ),
            value: controller.onSurfacesUseBWLight &&
                controller.useKeyColors &&
                !_isFlutterScheme,
            onChanged: controller.useKeyColors && !_isFlutterScheme
                ? controller.setOnSurfacesUseBWLight
                : null,
          ),
          SwitchListTileReveal(
            title: const Text('White surface'),
            subtitleDense: true,
            subtitle: const Text(
              'Surface color uses tone 100 which is '
              'always white. You can add this modifier to any seed '
              'generation strategy. Surface blends will still mix in '
              'blend color into surface, using selected blend strategy '
              'and level.\n',
            ),
            value: controller.surfacesUseBWLight &&
                controller.useKeyColors &&
                !_isFlutterScheme,
            onChanged: controller.useKeyColors && !_isFlutterScheme
                ? controller.setSurfacesUseBWLight
                : null,
          ),
        ] else ...<Widget>[
          SwitchListTileReveal(
            title: const Text('Black & white main onColors'),
            subtitleDense: true,
            subtitle: const Text(
              'Main colors are primary, secondary, tertiary, '
              'error, their container and fixed colors. Using black and white '
              'as onColors on the main colors may improve '
              'contrast, it also makes the theme less color expressive.\n',
            ),
            value: controller.onMainsUseBWDark &&
                controller.useKeyColors &&
                !_isFlutterScheme,
            onChanged: controller.useKeyColors && !_isFlutterScheme
                ? controller.setOnMainsUseBWDark
                : null,
          ),
          SwitchListTileReveal(
            title: const Text('Black & white surface onColors'),
            subtitleDense: true,
            subtitle: const Text(
              'Surface onColors are onSurface, onSurfaceVariant and '
              'onInverseSurface colors. Using black and white as onColors on '
              'all surfaces may improve contrast.\n',
            ),
            value: controller.onSurfacesUseBWDark &&
                controller.useKeyColors &&
                !_isFlutterScheme,
            onChanged: controller.useKeyColors && !_isFlutterScheme
                ? controller.setOnSurfacesUseBWDark
                : null,
          ),
          SwitchListTileReveal(
            title: const Text('Black surface'),
            subtitleDense: true,
            subtitle: const Text(
              'Surface uses tone 0, which is always '
              'true black. You can add this modifier to any seed '
              'generation strategy. Surface blends will still mix in '
              'blend color into surface, using selected blend strategy '
              'and level.\n',
            ),
            value: controller.surfacesUseBWDark &&
                controller.useKeyColors &&
                !_isFlutterScheme,
            onChanged: controller.useKeyColors && !_isFlutterScheme
                ? controller.setSurfacesUseBWDark
                : null,
          ),
        ],
        const Divider(),
        ShowInputColorsSwitch(controller: controller),
        // TODO(rydmike): Remove as not used 29.7.2023
        //
        // if (!isLight && controller.schemeIndex ==
        // (AppColor.schemes.length - 1))
        //   SwitchListTileReveal(
        //       dense: true,
        //      title: const Text('Custom dark scheme uses its own key colors'),
        //       subtitle: const Text(
        //         'Turn ON to use its dark input colors as seed keys for the '
        //         'dark theme. This option is only available when using a '
        //         'custom dark scheme.\n',
        //       ),
        //       value: controller.useDarkColorsForSeed &&
        //           controller.useKeyColors &&
        //           controller.schemeIndex == AppColor.schemes.length - 1,
        //       onChanged: controller.useKeyColors &&
        //               controller.schemeIndex == AppColor.schemes.length - 1
        //           ? controller.setUseDarkColorsForSeed
        //           : null),
      ],
    );
  }
}
