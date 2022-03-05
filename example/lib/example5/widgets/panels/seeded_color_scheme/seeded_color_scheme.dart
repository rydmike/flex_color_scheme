import 'package:flutter/material.dart';

import '../../../../shared/const/app_color.dart';
import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/header_card.dart';
import 'flex_tone_config_buttons.dart';
import 'scheme_colors.dart';
import 'show_tonal_palette.dart';
import 'use_key_colors_buttons.dart';

// Panel used to show effective color scheme, when using keys to seed it
// and just using raw FlexSchemeColors input data too based ColorScheme too.
class SeededColorScheme extends StatelessWidget {
  const SeededColorScheme({
    Key? key,
    required this.controller,
    required this.isOpen,
    required this.onTap,
  }) : super(key: key);
  final ThemeController controller;
  final bool isOpen;
  final VoidCallback onTap;

  String _describeFlexToneShort(int colors) {
    if (colors == 1) {
      return 'Default Material 3 design tone map and chroma setup';
    } else if (colors == 2) {
      return 'Softer and more earth like tones than Material 3 defaults';
    } else if (colors == 3) {
      return 'More vivid colors than Material 3 defaults';
    } else if (colors == 4) {
      return 'High contrast version, may be useful for accessibility';
    }
    return 'Disabled';
  }

  String _describeFlexToneLong(int colors) {
    if (colors == 1) {
      return 'Primary - Chroma from key color, but min 48\n'
          'Secondary - Chroma set to 16\n'
          'Tertiary - Chroma set to 24\n';
    } else if (colors == 2) {
      return 'Primary - Chroma set to 30\n'
          'Secondary - Chroma set to 14\n'
          'Tertiary - Chroma set to 20\n';
    } else if (colors == 3) {
      return 'Primary - Chroma from key color, but min 50\n'
          'Secondary - Chroma from key color\n'
          'Tertiary - Chroma from key color\n';
    } else if (colors == 4) {
      return 'Primary - Chroma from key color, but min 65\n'
          'Secondary - Chroma from key color, but min 55\n'
          'Tertiary - Chroma from key color, but min 55\n';
    }
    return 'Key color based tonal palettes are not used.\n'
        'Enable at least one key color to seed the palettes.\n'
        'Primary color must always be included as a key color.\n';
  }

  @override
  Widget build(BuildContext context) {
    return HeaderCard(
      isOpen: isOpen,
      onTap: onTap,
      title: const Text('Seeded ColorScheme'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 8),
          ListTile(
            title: const Text('Use effective input colors as keys to seed '
                'the ColorScheme'),
            subtitle: Text(AppColor.explainUsedColors(controller)),
          ),
          // const SizedBox(height: 4),
          ListTile(
            trailing: UseKeyColorsButtons(
              controller: controller,
            ),
          ),
          const ListTile(
            title: Text('Keep effective input color'),
            subtitle: Text('When using a seeded ColorScheme, '
                'you can lock primary, secondary, tertiary and their '
                'container colors to their effective input color value, '
                'instead of using the tone from the computed tonal palette. '
                'Toggle switches below for each color to keep its effective '
                'input color. The lock switches are only available when the '
                'key color based seeded scheme is used.'),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
            child: SchemeColors(controller: controller),
          ),
          if (controller.schemeIndex != (AppColor.schemesCustom.length - 1))
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Tap a color code to copy it to the clipboard. '
                  // ignore: lines_longer_than_80_chars
                  "${controller.useKeyColors ? 'Hover a color to highlight its tonal palette source color. ' : ''}"
                  // ignore: lines_longer_than_80_chars
                  "${controller.blendLevel > 0 ? 'Surface blends modifies surface and background colors, they may not be found in generated palettes when hovered.' : ''}"),
            ),

          if (controller.schemeIndex == (AppColor.schemesCustom.length - 1))
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child:
                  Text('This is the custom color theme, you can tap primary, '
                      'secondary or tertiary, plus their container colors to '
                      'change them.'),
            ),
          const SizedBox(height: 8),
          const ListTile(
            title: Text('Generated tonal palettes'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ShowTonalPalette(controller: controller),
          ),
          const ListTile(
            subtitle: Text(
              'With FlexTone you can configure which tone from '
              'generated tonal palettes each color in the ColorScheme use. '
              'You can also set limits on used CAM16 chroma values '
              'for the three color values used as keys to seed the M3 primary, '
              'secondary and tertiary TonalPalette.',
            ),
          ),
          ListTile(
            title: const Text('Select FlexTone setup'),
            subtitle: Text(
              _describeFlexToneShort(
                  controller.useKeyColors ? controller.usedFlexToneSetup : 0),
            ),
            trailing: FlexToneConfigButtons(controller: controller),
          ),
          ListTile(
            title: const Text('Used CAM16 chroma configuration'),
            subtitle: Text(
              // ignore: lines_longer_than_80_chars
              '${_describeFlexToneLong(controller.useKeyColors ? controller.usedFlexToneSetup : 0)}\n'
              'In this version you can choose between the default Material 3 '
              'tone mapping and three pre-defined custom FlexTone setup. With '
              'the API you can make your own FlexTone configurations. A future '
              'version of this app may add interactive configuration of tone '
              'to ColorScheme color mapping.',
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
