import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/switch_list_tile_reveal.dart';
import '../../shared/custom_theme_controls.dart';
import '../../shared/theme_mode_switch_list_tile.dart';
import '../../shared/use_seeded_color_scheme_switch.dart';
import 'input_colors_popup_menu.dart';
import 'show_input_colors.dart';
import 'used_colors_popup_menu.dart';

class ThemeColorsSettings extends StatelessWidget {
  const ThemeColorsSettings(
    this.controller, {
    super.key,
  });
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        ThemeModeSwitchListTile(controller: controller),
        InputColorsPopupMenu(controller: controller),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
          child: ShowInputColors(controller: controller),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Text(
            'Tap a color code to copy it to the clipboard.',
            style: denseBody,
          ),
        ),
        const ListTileReveal(
          title: Text('Theme color modifiers'),
          subtitleDense: true,
          subtitle: Text('Use theme color modifiers below to change how '
              'the input scheme colors are used to define the effective '
              "theme's ColorScheme.\n"),
        ),
        UseSeededColorSchemeSwitch(controller: controller),
        SwitchListTileReveal(
          enabled: controller.useFlexColorScheme && !controller.useKeyColors,
          title: const Text('Use Material 3 error colors'),
          subtitleDense: true,
          subtitle: const Text('Override scheme defined used legacy M2 error '
              'colors and use M3 error colors instead. This applies when not '
              'using seeded ColorSchemes. Seed generated ColorSchemes always '
              'use M3 error colors. Newer built-in schemes also use the M3 '
              'error colors by default, this setting has no impact on '
              'them.\n'),
          value: controller.useM3ErrorColors &&
              controller.useFlexColorScheme &&
              !controller.useKeyColors,
          onChanged: controller.useFlexColorScheme && !controller.useKeyColors
              ? controller.setUseM3ErrorColors
              : null,
        ),
        UsedColorsPopupMenu(
          title: const Text('Used input colors'),
          index: controller.usedColors,
          onChanged:
              controller.useFlexColorScheme ? controller.setUsedColors : null,
        ),
        SwitchListTileReveal(
          title: const Text('Swap secondary '
              'and tertiary legacy colors in M3'),
          subtitleDense: true,
          subtitle: const Text(
            'Only applies when using M3, and only to built-in FCS M2 '
            'designed schemes that benefit from this swap for a better fit '
            'with the M3 color system design intent. '
            'Prefer ON when using M3 and legacy FCS color schemes to get a '
            'theme result with them, that is more in-line with M3 color '
            'system color expectations. You can turn it OFF if that is not '
            'important and also when using seeded ColorScheme, especially '
            'if you do not use the secondary color as a seed key.\n',
          ),
          value: controller.swapLegacyColors && controller.useMaterial3,
          onChanged:
              controller.useMaterial3 ? controller.setSwapLegacyColors : null,
        ),
        if (isLight)
          SwitchListTileReveal(
            title: const Text('Swap light primary and secondary'),
            subtitleDense: true,
            subtitle: const Text(
              'Swap primary and secondary, and their container colors. '
              'The above legacy M3 mode secondary and tertiary swap is done '
              'first, it is enabled.\n',
            ),
            value: controller.swapLightColors && controller.useFlexColorScheme,
            onChanged: controller.useFlexColorScheme
                ? controller.setSwapLightColors
                : null,
          )
        else
          SwitchListTileReveal(
            title: const Text('Swap dark primary and secondary'),
            subtitleDense: true,
            subtitle: const Text(
              'Swap primary and secondary, and their container colors. '
              'The above legacy M3 mode secondary and tertiary swap is done '
              'first, it is enabled.\n',
            ),
            value: controller.swapDarkColors && controller.useFlexColorScheme,
            onChanged: controller.useFlexColorScheme
                ? controller.setSwapDarkColors
                : null,
          ),
        Visibility(
          visible: !isLight,
          child: Column(
            children: <Widget>[
              SwitchListTileReveal(
                title: const Text('Compute dark theme'),
                subtitleDense: true,
                subtitle: const Text('Compute dark theme from light color '
                    'values, instead of using predefined dark colors.\n'),
                value: controller.useToDarkMethod &&
                    controller.useFlexColorScheme &&
                    !controller.useKeyColors,
                onChanged:
                    controller.useFlexColorScheme && !controller.useKeyColors
                        ? controller.setUseToDarkMethod
                        : null,
              ),
              SwitchListTileReveal(
                title: const Text('Computed dark swaps main and container'),
                subtitleDense: true,
                subtitle: const Text('Recommend to turn this one. When '
                    'swapped, you can often use them as they are with no '
                    'white blend level, especially if the light colors '
                    'use M3 design intent.\n'),
                value: controller.toDarkSwapPrimaryAndContainer &&
                    controller.useToDarkMethod &&
                    controller.useFlexColorScheme &&
                    !controller.useKeyColors,
                onChanged: controller.useToDarkMethod &&
                        controller.useFlexColorScheme &&
                        !controller.useKeyColors
                    ? controller.setToDarkSwapPrimaryAndContainer
                    : null,
              ),
              ListTileReveal(
                enabled: controller.useToDarkMethod &&
                    controller.useFlexColorScheme &&
                    !controller.useKeyColors,
                title: const Text('White blend level'),
                subtitleDense: true,
                subtitle: const Text('Adjust white blend level to desaturate '
                    'the the light mode colors to make them work better in '
                    'your dark theme\n'),
              ),
              ListTile(
                title: Slider(
                  max: 100,
                  divisions: 100,
                  label: controller.darkMethodLevel.toString(),
                  value: controller.darkMethodLevel.toDouble(),
                  onChanged: controller.useToDarkMethod &&
                          controller.useFlexColorScheme &&
                          !controller.useKeyColors
                      ? (double value) {
                          controller.setDarkMethodLevel(value.floor());
                        }
                      : null,
                ),
                trailing: Padding(
                  padding: const EdgeInsetsDirectional.only(end: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'LEVEL',
                        style: theme.textTheme.bodySmall,
                      ),
                      Text(
                        '${controller.darkMethodLevel} %',
                        style: theme.textTheme.bodySmall!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(),
        CustomThemeControls(controller: controller),
      ],
    );
  }
}
