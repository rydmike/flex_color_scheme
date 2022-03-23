import 'package:flutter/material.dart';

import '../../../../shared/const/app_color.dart';
import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/switch_list_tile_adaptive.dart';
import '../../../../shared/widgets/universal/theme_mode_switch.dart';
import '../../dialogs/copy_scheme_to_custom_dialog.dart';
import 'theme_input_colors.dart';
import 'theme_popup_menu.dart';
import 'theme_selector.dart';
import 'used_colors_popup_menu.dart';

class InputColors extends StatelessWidget {
  const InputColors({
    Key? key,
    required this.controller,
    this.showThemeSelector = true,
  }) : super(key: key);
  final ThemeController controller;
  final bool showThemeSelector;

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
      // After copy, set theme to the custom theme so
      // user can edit it
      await controller.setSchemeIndex(AppColor.schemes.length - 1);
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
        if (showThemeSelector)
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: ThemeSelector(controller: controller),
          ),
        ThemePopupMenu(controller: controller),
        const SizedBox(height: 8),
        if (controller.schemeIndex != (AppColor.schemes.length - 1))
          ListTile(
            title: const Text('Copy effective input colors to the custom '
                'scheme?'),
            subtitle: const Text('Applies effective input color value to '
                'the last scheme, the custom one, that you can modify'),
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
          const ListTile(
            title: Text('Custom color scheme'),
            subtitle: Text('Tap the primary, secondary, tertiary color or '
                ' their container colors to change the colors'),
          ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
          child: ThemeInputColors(controller: controller),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Tap a color code to copy it to the clipboard',
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
        const SizedBox(height: 8),
        const ListTile(
          title: Text('Input color modifiers'),
          subtitle: Text('You can use the input color modifiers below to '
              'change the effective input colors that are used to define '
              'the ColorScheme. The input color values show the color before '
              'input modifiers, the surrounding color is the effective input '
              'color.'),
        ),
        SwitchListTileAdaptive(
          title: const Text('Use Material 3 error colors'),
          subtitle: const Text('Override defined M2 error colors and use M3 '
              'error colors also when not using seeded ColorScheme'),
          value: controller.useM3ErrorColors,
          onChanged: controller.setUseM3ErrorColors,
        ),
        UsedColorsPopupMenu(
          title: const Text('Input limiter, use fewer of the six '
              'main input color values'),
          index: controller.usedColors,
          onChanged: controller.setUsedColors,
        ),
        if (isLight)
          SwitchListTileAdaptive(
            title: const Text('Light mode swap colors'),
            subtitle: const Text(
              'Swap primary, secondary and their container colors',
            ),
            value: controller.swapLightColors,
            onChanged: controller.setSwapLightColors,
          )
        else
          SwitchListTileAdaptive(
            title: const Text('Dark mode swap colors'),
            subtitle: const Text(
              'Swap primary, secondary and their container colors',
            ),
            value: controller.swapDarkColors,
            onChanged: controller.setSwapDarkColors,
          ),
        Visibility(
          visible: !isLight,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: SwitchListTileAdaptive(
            title: const Text('Compute dark theme'),
            subtitle: const Text(
              'Calculate dark mode colors from light scheme color values, '
              'instead of using the predefined dark ones. Using M3 seed key '
              'colors does this too, using a more involved and expensive '
              'algorithm. This option has no effect if seed colors '
              'are used, it is kept disabled then.',
            ),
            value: controller.useToDarkMethod && !controller.useKeyColors,
            onChanged: controller.useSubThemes && !controller.useKeyColors
                ? controller.setUseToDarkMethod
                : null,
          ),
        ),
        Visibility(
          visible: !isLight,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: ListTile(
            title: Slider.adaptive(
              max: 100,
              divisions: 100,
              label: controller.darkMethodLevel.toString(),
              value: controller.darkMethodLevel.toDouble(),
              onChanged: controller.useToDarkMethod && !controller.useKeyColors
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
                        .caption!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
