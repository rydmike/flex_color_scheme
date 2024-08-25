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

  String get _flexToneName =>
      FlexSchemeVariant.values[controller.usedFlexToneSetup].variantName;
  bool get _isFlutterScheme =>
      FlexSchemeVariant.values[controller.usedFlexToneSetup].isFlutterScheme;
  String get _seedType => _isFlutterScheme ? 'MCU' : 'FSS';

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
        UseSeededColorSchemeSwitch(controller: controller),
        FlexToneConfigPopupMenu(
          title: 'Scheme',
          flexToneName: '$_flexToneName $_seedType',
          index: controller.usedFlexToneSetup,
          onChanged: controller.setUsedFlexToneSetup,
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
          subtitleReveal: const Text(
            'With the switches on the colors below you can lock primary, '
            'secondary, tertiary, error and their container colors to '
            'their scheme input defined colors instead of using the color '
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
        ShowInputColorsSwitch(controller: controller),
        SwitchListTileReveal(
          title: const Text('Seed generated Fixed and FixedDim colors'),
          subtitleReveal: const Text(
            'This setting applies when not using a seed generated color '
            'scheme. '
            'It offers you to choose between two styles, internal FCS none '
            'seeded default or using seed generate versions also when not '
            'seed generating the ColorSchme.\n'
            '\n'
            'OFF  Compute fixed and fixed dim color without seeding\n'
            'ON   Always use seeded colors for fixed and fixed dim colors\n'
            '\n'
            'Fixed and fixed dim colors are used for colors that have '
            'the same value in light and dark mode.\n',
          ),
          value: controller.fixedColorStyle || controller.useKeyColors,
          onChanged:
              controller.useKeyColors ? null : controller.setFixedColorStyle,
        ),
        const Divider(height: 1),
        ListTile(
          title: const Text('Additional options '
              'for FSS FlexTones scheme variants'),
          subtitle: _isFlutterScheme
              ? const Text(
                  'Use a FSS FlexTones variant to enable options below')
              : const Text('Settings are separate for light and dark mode'),
        ),
        if (isLight) ...<Widget>[
          SwitchListTileReveal(
            title: const Text('Monochrome surfaces'),
            subtitleReveal: const Text(
              'All seed generated surface colors are pure greyscale with no '
              'color tint.\n',
            ),
            value: controller.useMonoSurfacesLight &&
                controller.useKeyColors &&
                !_isFlutterScheme,
            onChanged: controller.useKeyColors && !_isFlutterScheme
                ? controller.setUseMonoSurfacesLight
                : null,
          ),
          SwitchListTileReveal(
            title: const Text('Black & white main onColors'),
            subtitleReveal: const Text(
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
            subtitleReveal: const Text(
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
            subtitleReveal: const Text(
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
            title: const Text('Monochrome surfaces'),
            subtitleReveal: const Text(
              'All seed generated surface colors are pure greyscale with no '
              'color tint.\n',
            ),
            value: controller.useMonoSurfacesDark &&
                controller.useKeyColors &&
                !_isFlutterScheme,
            onChanged: controller.useKeyColors && !_isFlutterScheme
                ? controller.setUseMonoSurfacesDark
                : null,
          ),
          SwitchListTileReveal(
            title: const Text('Black & white main onColors'),
            subtitleReveal: const Text(
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
            subtitleReveal: const Text(
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
            subtitleReveal: const Text(
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
        ListTile(
          title: const Text('Additional options '
              'for Flutter MCU based scheme variants'),
          subtitle: _isFlutterScheme
              ? const Text(
                  'Use a MCU Flex Scheme variant to enable options below')
              : const Text('Settings are separate for light and dark mode'),
        ),
        // TODO(rydmike): Removed 29.7.2023, bring back the feature in V8.
        //   Ned a way to make this work, we need colors in keys!
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
