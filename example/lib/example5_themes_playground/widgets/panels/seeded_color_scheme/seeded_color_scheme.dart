import 'package:flutter/material.dart';

import '../../../../shared/const/app_color.dart';
import '../../../../shared/const/flex_tone.dart';
import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/app/use_key_colors_buttons.dart';
import '../../../../shared/widgets/universal/switch_list_tile_adaptive.dart';
import 'flex_tone_config_popup_menu.dart';
import 'scheme_colors.dart';
import 'show_tonal_palette.dart';

// Panel used to show effective color scheme, when using keys to seed it
// and just using raw FlexSchemeColors input data too based ColorScheme too.
class SeededColorScheme extends StatelessWidget {
  const SeededColorScheme(
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
        ListTile(
          title: const Text('Light input colors used to seed '
              'the ColorScheme'),
          subtitle: Text(AppColor.explainUsedColors(controller)),
        ),
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
              'change them.\n'
              // ignore: lines_longer_than_80_chars
              "${controller.useKeyColors ? 'Hover a color to highlight its tonal palette source color below. ' : ''}"
              // ignore: lines_longer_than_80_chars
              "${showBlendInfo ? 'Surface blend is used, it modifies surface and background colors, they may not be found in palettes when hovered.' : '\n'}",
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
        // ListTile(
        //   title: Text('Used FlexTones setup: $_flexToneName'),
        //   subtitle: Text(_flexToneDescribe),
        //   trailing: FlexToneConfigButtons(controller: controller),
        // ),
        FlexToneConfigPopupMenu(
          title: 'Used FlexTones setup:',
          index: controller.useKeyColors ? controller.usedFlexToneSetup : 0,
          onChanged:
              controller.useKeyColors ? controller.setUsedFlexToneSetup : null,
        ),
        ListTile(
          title: Text('$_flexToneName'
              ' FlexTones setup has CAM16 chroma:'),
          subtitle: Text(
            // ignore: lines_longer_than_80_chars
            '$_flexToneSetup\n'
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
