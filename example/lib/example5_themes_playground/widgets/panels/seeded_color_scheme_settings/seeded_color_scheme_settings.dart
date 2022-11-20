import 'package:flutter/material.dart';

import '../../../../shared/const/app_color.dart';
import '../../../../shared/const/flex_tone.dart';
import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/app/use_key_colors_buttons.dart';
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
    final bool useSeed = controller.useKeyColors;
    final String explainSeed = useSeed
        ? 'Theme is based on seed generated ColorScheme below'
        : 'Theme is based on selected FlexColorScheme defined colors';
    final String schemeMode = useSeed ? 'Seeded' : 'Selected';
    final bool showBlendInfo = ((isLight && controller.blendLevel > 0) ||
            (!isLight && controller.blendLevelDark > 0)) &&
        controller.useKeyColors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTile(
          subtitle: Text('In Material 3 color system, seed generated light and '
              'dark mode ColorSchemes use same key colors to generate six '
              'tonal palettes. Both light and dark ColorScheme colors '
              'use same palettes, but different tones. '
              'To ensure light and dark themes use identical tonal palettes, '
              'FlexColorScheme uses the light mode colors '
              'from built-in schemes to seed ColorSchemes. '
              'With custom colors, you can decide if you do so or not.'),
        ),
        ListTile(
          // dense: true,
          title: Text(explainSeed),
          subtitle: Text(AppColor.explainUsedColors(controller)),
        ),
        ListTile(
          dense: true,
          trailing: UseKeyColorsButtons(controller: controller),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ShowTonalPalette(controller: controller),
        ),
        const SizedBox(height: 8),
        FlexToneConfigPopupMenu(
          title: 'Tonal palettes use FlexTones',
          index: controller.useKeyColors ? controller.usedFlexToneSetup : 0,
          onChanged:
              controller.useKeyColors ? controller.setUsedFlexToneSetup : null,
        ),
        if (isLight) ...<Widget>[
          SwitchListTile(
            title: const Text('Use black & white for main onColors'),
            subtitle:
                const Text('Main colors are primary, secondary, tertiary, '
                    'error and their container colors'),
            value: controller.onMainsUseBWLight && controller.useKeyColors,
            onChanged: controller.useKeyColors
                ? controller.setOnMainsUseBWLight
                : null,
          ),
          SwitchListTile(
            title: const Text('Use black & white for surface onColors'),
            subtitle: const Text('Surface colors are background, surface, '
                'surfaceVariant and inverseSurface'),
            value: controller.onSurfacesUseBWLight && controller.useKeyColors,
            onChanged: controller.useKeyColors
                ? controller.setOnSurfacesUseBWLight
                : null,
          ),
        ] else ...<Widget>[
          SwitchListTile(
            title: const Text('Use black & white for main onColors'),
            subtitle:
                const Text('Main colors are primary, secondary, tertiary, '
                    'error and their container colors'),
            value: controller.onMainsUseBWDark && controller.useKeyColors,
            onChanged:
                controller.useKeyColors ? controller.setOnMainsUseBWDark : null,
          ),
          SwitchListTile(
            title: const Text('Use black & white for surface onColors'),
            subtitle: const Text('Surface colors are background, surface, '
                'surfaceVariant and inverseSurface'),
            value: controller.onSurfacesUseBWDark && controller.useKeyColors,
            onChanged: controller.useKeyColors
                ? controller.setOnSurfacesUseBWDark
                : null,
          ),
        ],
        ListTile(title: Text('$schemeMode ColorScheme')),
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
              "${controller.useKeyColors ? 'Hover a color to highlight its tonal palette source color above. ' : ''}"
              // ignore: lines_longer_than_80_chars
              "${showBlendInfo ? 'Surface blend is used, it modifies surface and background colors, they may not be found in palettes when hovered.' : '\n'}",
              style: theme.textTheme.labelSmall,
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
              style: theme.textTheme.labelSmall,
            ),
          ),
        const ListTile(
          dense: true,
          title: Text('Want to keep a theme color when using seeds?'),
          subtitle: Text('With the switches on the colors above you can lock '
              'primary, secondary, tertiary and their container colors to '
              'their theme colors instead of using the color from seeded tonal '
              'palette. Switches have separate states for light and dark '
              'theme. '),
        ),
        if (!isLight && controller.schemeIndex == (AppColor.schemes.length - 1))
          SwitchListTile(
              dense: true,
              title: const Text('Custom dark scheme uses its own key colors'),
              subtitle: const Text(
                'This option is only available on the custom dark schemes. If '
                'you "keep" dark input colors with custom dark schemes, '
                'turn this ON to use its own input color definition.',
              ),
              value: controller.useDarkColorsForSeed &&
                  controller.useKeyColors &&
                  controller.schemeIndex == AppColor.schemes.length - 1,
              onChanged: controller.useKeyColors &&
                      controller.schemeIndex == AppColor.schemes.length - 1
                  ? controller.setUseDarkColorsForSeed
                  : null),
        const ListTile(
          dense: true,
          title: Text('FlexTones'),
          subtitle: Text(
            'With FlexTones, you can configure which tone from '
            'generated palettes each color in the ColorScheme use. '
            'Set limits on used CAM16 chroma values '
            'for the three colors used as keys for primary, '
            'secondary and tertiary TonalPalettes. '
            'In this app you can choose between the default Material 3 '
            'tone mapping plus six pre-defined custom FlexTones setups. With '
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
