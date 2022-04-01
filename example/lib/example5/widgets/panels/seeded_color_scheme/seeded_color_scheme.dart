import 'package:flutter/material.dart';

import '../../../../shared/const/app_color.dart';
import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/switch_list_tile_adaptive.dart';
import 'flex_tone_config_buttons.dart';
import 'scheme_colors.dart';
import 'show_tonal_palette.dart';
import 'use_key_colors_buttons.dart';

// Panel used to show effective color scheme, when using keys to seed it
// and just using raw FlexSchemeColors input data too based ColorScheme too.
class SeededColorScheme extends StatelessWidget {
  const SeededColorScheme(
    this.controller, {
    Key? key,
    this.showKeyButtons = true,
  }) : super(key: key);
  final ThemeController controller;
  final bool showKeyButtons;

  String _describeFlexToneLabel(int colors) {
    if (colors == 1) {
      return 'Material 3';
    } else if (colors == 2) {
      return 'Soft';
    } else if (colors == 3) {
      return 'Vivid';
    } else if (colors == 4) {
      return 'Vivid surfaces';
    } else if (colors == 5) {
      return 'High contrast';
    }
    return 'Disabled';
  }

  String _describeFlexToneShort(int colors) {
    if (colors == 1) {
      return 'Default Material 3 design tone map and chroma setup';
    } else if (colors == 2) {
      return 'Softer and more earth like tones than Material 3 defaults';
    } else if (colors == 3) {
      return 'More Vivid colors than Material 3 defaults';
    } else if (colors == 4) {
      return 'Like Vivid, but with more colorful containers, onColors and '
          'surface tones. Creates alpha blend like effect without '
          'any blend level';
    } else if (colors == 5) {
      return 'High contrast version, may be useful for accessibility';
    }
    return 'Disabled';
  }

  String _describeFlexToneLong(int colors) {
    if (colors == 1) {
      return 'Primary - Chroma from key color, but min 48\n'
          'Secondary - Chroma set to 16\n'
          'Tertiary - Chroma set to 24\n'
          'Neutral - Chroma set to 4\n'
          'Neutral variant - Chroma set to 8\n';
    } else if (colors == 2) {
      return 'Primary - Chroma set to 30\n'
          'Secondary - Chroma set to 14\n'
          'Tertiary - Chroma set to 20\n'
          'Neutral - Chroma set to 4\n'
          'Neutral variant - Chroma set to 8\n';
    } else if (colors == 3) {
      return 'Primary - Chroma from key color, but min 50\n'
          'Secondary - Chroma from key color\n'
          'Tertiary - Chroma from key color\n'
          'Neutral - Chroma set to 4\n'
          'Neutral variant - Chroma set to 8\n';
    } else if (colors == 4) {
      return 'Primary - Chroma from key color, but min 50\n'
          'Secondary - Chroma from key color\n'
          'Tertiary - Chroma from key color\n'
          'Neutral - Chroma set to 8\n'
          'Neutral variant - Chroma set to 16\n';
    } else if (colors == 5) {
      return 'Primary - Chroma from key color, but min 65\n'
          'Secondary - Chroma from key color, but min 55\n'
          'Tertiary - Chroma from key color, but min 55\n'
          'Neutral - Chroma set to 4\n'
          'Neutral variant - Chroma set to 8\n';
    }
    return 'Key color based tonal palettes are not used.\n'
        'Enable at least one key color to seed the palettes.\n'
        'Primary color must always be included as a key color.\n\n\n';
  }

  @override
  Widget build(BuildContext context) {
    final bool isLight = Theme.of(context).brightness == Brightness.light;
    final bool showBlendInfo = ((isLight && controller.blendLevel > 0) ||
            (!isLight && controller.blendLevelDark > 0)) &&
        controller.useKeyColors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTile(
          subtitle: Text('In Material Design 3, seed generated light and '
              'dark mode ColorSchemes use same key colors to generate six '
              'tonal palettes. Both light and dark theme ColorScheme colors '
              'are picked from these palettes, but using different tones. '
              'To ensure light and dark themes use identical tonal palettes, '
              'FlexColorScheme automatically only uses the light mode colors '
              'from built-in schemes to seed ColorSchemes. '
              'When using custom colors, you can decide if you do so or not.'),
        ),
        if (showKeyButtons)
          ListTile(
            title: const Text('Light input colors used to seed '
                'the ColorScheme'),
            subtitle: Text(AppColor.explainUsedColors(controller)),
          ),
        if (showKeyButtons)
          ListTile(trailing: UseKeyColorsButtons(controller: controller)),
        Visibility(
          visible: !isLight,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: SwitchListTileAdaptive(
              title: const Text('Custom dark scheme uses its own key colors'),
              subtitle: const Text(
                'This option is only available on custom dark schemes. If '
                'you "keep" dark input colors with custom dark schemes, '
                'turn this ON to use its own input color definition.',
              ),
              value: controller.useDarkColorsForSeed &&
                  controller.useKeyColors &&
                  (controller.schemeIndex == 0 ||
                      controller.schemeIndex == 1 ||
                      controller.schemeIndex == 2 ||
                      controller.schemeIndex == AppColor.schemes.length - 1),
              onChanged: controller.useKeyColors &&
                      (controller.schemeIndex == 0 ||
                          controller.schemeIndex == 1 ||
                          controller.schemeIndex == 2 ||
                          controller.schemeIndex == AppColor.schemes.length - 1)
                  ? controller.setUseDarkColorsForSeed
                  : null),
        ),
        const ListTile(
          title: Text('Keep input color'),
          subtitle: Text('You can lock primary, secondary, tertiary and their '
              'container colors to their input colors, '
              'instead of using its color from seeded tonal palette. '
              'Switches have separate states for light and dark theme mode.'),
        ),
        const ListTile(title: Text('Effective ColorScheme')),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 4),
          child: SchemeColors(tc: controller),
        ),
        if (controller.schemeIndex != (AppColor.schemes.length - 1))
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Tap a color code to copy it to the clipboard.\n'
              // ignore: lines_longer_than_80_chars
              "${controller.useKeyColors ? 'Hover a color to highlight its tonal palette source color below. ' : ''}"
              // ignore: lines_longer_than_80_chars
              "${showBlendInfo ? 'Surface blend is used, it modifies surface and background colors, they may not be found in palettes when hovered.' : '\n'}",
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
        if (controller.schemeIndex == (AppColor.schemes.length - 1))
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'This is the custom color theme, you can tap primary, '
              'secondary or tertiary, plus their container colors to '
              'change them.',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
        const ListTile(title: Text('Generated tonal palettes')),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ShowTonalPalette(controller: controller),
        ),
        const ListTile(
          subtitle: Text(
            'With FlexTones, you can configure which tone from '
            'generated palettes each color in the ColorScheme use. '
            'Set limits on used CAM16 chroma values '
            'for the three colors used as keys for primary, '
            'secondary and tertiary TonalPalettes.',
          ),
        ),
        ListTile(
          title: Text('Used FlexTones setup: '
              // ignore: lines_longer_than_80_chars
              '${_describeFlexToneLabel(controller.useKeyColors ? controller.usedFlexToneSetup : 0)}'),
          subtitle: Text(
            _describeFlexToneShort(
                controller.useKeyColors ? controller.usedFlexToneSetup : 0),
          ),
          trailing: FlexToneConfigButtons(controller: controller),
        ),
        ListTile(
          title: Text(
              // ignore: lines_longer_than_80_chars
              '${_describeFlexToneLabel(controller.useKeyColors ? controller.usedFlexToneSetup : 0)}'
              ' FlexTones setup has CAM16 chroma:'),
          subtitle: Text(
            // ignore: lines_longer_than_80_chars
            '${_describeFlexToneLong(controller.useKeyColors ? controller.usedFlexToneSetup : 0)}\n'
            'In this app you can choose between the default Material 3 '
            'tone mapping and four pre-defined custom FlexTones setups. With '
            'the API you can make your own FlexTones configurations. A '
            'future version of the app may add interactive configuration of '
            'tone to ColorScheme color mapping.',
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
