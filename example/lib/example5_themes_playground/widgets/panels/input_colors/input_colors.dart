import 'package:flutter/material.dart';

import '../../../../shared/const/app_color.dart';
import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/switch_list_tile_adaptive.dart';
import '../../../../shared/widgets/universal/theme_mode_switch.dart';
import '../../dialogs/copy_scheme_to_custom_dialog.dart';
import '../../dialogs/reset_custom_colors_dialog.dart';
import 'input_colors_popup_menu.dart';
import 'show_input_colors.dart';
import 'used_colors_popup_menu.dart';

class InputColors extends StatelessWidget {
  const InputColors(
    this.controller, {
    super.key,
  });
  final ThemeController controller;

  Future<void> _handleCopySchemeTap(BuildContext context) async {
    final bool? copy = await showDialog<bool?>(
      context: context,
      builder: (BuildContext context) {
        return const CopySchemeToCustomDialog();
      },
    );
    if (copy ?? false) {
      // Copy scheme to custom scheme, by setting custom scheme
      // to scheme of current scheme index.
      await controller.setCustomScheme(AppColor.scheme(controller));
      // After copy, set input colors to the custom one so user can edit it.
      await controller.setSchemeIndex(AppColor.schemes.length - 1);
    }
  }

  Future<void> _handleResetSchemeTap(BuildContext context) async {
    final bool? reset = await showDialog<bool?>(
      context: context,
      builder: (BuildContext context) {
        return const ResetCustomColorsDialog();
      },
    );
    if (reset ?? false) {
      await controller.resetCustomColorsToDefaults();
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isLight = Theme.of(context).brightness == Brightness.light;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        ListTile(
          title: const Text('Theme mode'),
          subtitle: Text('Mode ${controller.themeMode.name}'),
          trailing: ThemeModeSwitch(
            themeMode: controller.themeMode,
            onChanged: controller.setThemeMode,
          ),
          // Toggle theme mode also via the ListTile tap.
          onTap: () {
            if (Theme.of(context).brightness == Brightness.light) {
              controller.setThemeMode(ThemeMode.dark);
            } else {
              controller.setThemeMode(ThemeMode.light);
            }
          },
        ),
        InputColorsPopupMenu(controller: controller),
        if (controller.schemeIndex != (AppColor.schemes.length - 1))
          ListTile(
            title: const Text('Copy effective input colors to customizable '
                'scheme?'),
            subtitle:
                const Text('Or tap a color code to copy it to the clipboard'),
            trailing: ElevatedButton(
              onPressed: () async {
                await _handleCopySchemeTap(context);
              },
              child: const Text('Copy'),
            ),
            onTap: () async {
              await _handleCopySchemeTap(context);
            },
          )
        else
          ListTile(
            title: const Text('Customizable color scheme'),
            subtitle: const Text('Tap the primary, secondary, tertiary color '
                'or their container colors to change color'),
            trailing: ElevatedButton(
              onPressed: () async {
                await _handleResetSchemeTap(context);
              },
              child: const Text('Reset'),
            ),
          ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
          child: ShowInputColors(controller: controller),
        ),
        const ListTile(
          title: Text('Input color modifiers'),
          subtitle: Text('Use input modifiers to change the effective colors '
              'that define the ColorScheme. The input color values show the '
              'color before input modifiers, surrounding color is the '
              'effective result. Seeded ColorSchemes also modify '
              'input colors, above you can see how.'),
        ),
        SwitchListTileAdaptive(
          title: const Text('Use Material 3 error colors'),
          subtitle: const Text('Override default M2 error colors and use M3 '
              'error colors, also when not using seeded ColorSchemes'),
          value: controller.useM3ErrorColors &&
              controller.useFlexColorScheme &&
              !controller.useKeyColors,
          onChanged: controller.useFlexColorScheme && !controller.useKeyColors
              ? controller.setUseM3ErrorColors
              : null,
        ),
        UsedColorsPopupMenu(
          title: const Text('Reduce amount of used input colors'),
          index: controller.usedColors,
          onChanged:
              controller.useFlexColorScheme ? controller.setUsedColors : null,
        ),
        if (isLight)
          SwitchListTileAdaptive(
            title: const Text('Light theme swap colors'),
            subtitle: const Text(
              'Swap primary and secondary, and their container colors',
            ),
            value: controller.swapLightColors && controller.useFlexColorScheme,
            onChanged: controller.useFlexColorScheme
                ? controller.setSwapLightColors
                : null,
          )
        else
          SwitchListTileAdaptive(
            title: const Text('Dark theme swap colors'),
            subtitle: const Text(
              'Swap primary and secondary, and their container colors',
            ),
            value: controller.swapDarkColors && controller.useFlexColorScheme,
            onChanged: controller.useFlexColorScheme
                ? controller.setSwapDarkColors
                : null,
          ),
        Visibility(
          visible: !isLight,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: Column(
            children: <Widget>[
              SwitchListTileAdaptive(
                title: const Text('Compute dark theme'),
                subtitle: const Text('Compute dark theme from light color '
                    'values, instead of using predefined dark colors'),
                value: controller.useToDarkMethod &&
                    controller.useFlexColorScheme &&
                    !controller.useKeyColors,
                onChanged:
                    controller.useFlexColorScheme && !controller.useKeyColors
                        ? controller.setUseToDarkMethod
                        : null,
              ),
              SwitchListTileAdaptive(
                title: const Text('Computed dark swaps main and container'),
                subtitle: const Text('If swapped, you can often use them '
                    'as they are with no white blend level, if light colors '
                    'use M3 design intent.'),
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
              ListTile(
                title: Slider.adaptive(
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
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        '${controller.darkMethodLevel} %',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
