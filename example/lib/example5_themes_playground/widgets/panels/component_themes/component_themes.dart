import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/app/show_sub_theme_colors.dart';
import '../../../../shared/widgets/universal/switch_list_tile_adaptive.dart';
import '../../shared/use_material3_text_theme.dart';
import '../../shared/use_tinted_text_theme.dart';

// Panel used to turn usage ON/OFF usage of opinionated component sub-themes.
//
// Settings are available for border radius and a few other options.
class ComponentThemes extends StatelessWidget {
  const ComponentThemes(this.controller, {super.key});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        SwitchListTileAdaptive(
          title: const Text('Use component themes'),
          subtitle: const Text('Enable opinionated widget themes'),
          value: controller.useSubThemes && controller.useFlexColorScheme,
          onChanged:
              controller.useFlexColorScheme ? controller.setUseSubThemes : null,
        ),
        UseMaterial3TextTheme(controller: controller),
        UseTinted3TextTheme(controller: controller),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Global border radius on components'),
          subtitle: const Text('Default setting uses mostly Material 3 design '
              'values, where radius spec varies per component. '
              'Material 2 design uses 4 on all components. '
              'If you set a value, all components will use it. '
              'You can set radius per component too, it will then use its own '
              'setting, regardless of what is set here'),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: Slider.adaptive(
            min: -1,
            max: 60,
            divisions: 61,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.defaultRadius == null ||
                        (controller.defaultRadius ?? -1) < 0
                    ? 'default'
                    : (controller.defaultRadius?.toStringAsFixed(0) ?? '')
                : 'default 4',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.defaultRadius ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setDefaultRadius(value < 0 ? null : value);
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'RADIUS',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.defaultRadius == null ||
                              (controller.defaultRadius ?? -1) < 0
                          ? 'default'
                          : (controller.defaultRadius?.toStringAsFixed(0) ?? '')
                      : 'default 4',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        SwitchListTileAdaptive(
          title: const Text('Themed interaction effects'),
          subtitle: const Text('Disable, hover, focus, highlight and '
              'splash are based on primary color.\n'
              'OFF for Flutter grey defaults'),
          value: controller.interactionEffects &&
              controller.useSubThemes &&
              controller.useFlexColorScheme,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? controller.setInteractionEffects
              : null,
        ),
        // Tooltip theme style.
        Tooltip(
          message: 'A tooltip, on the tooltip style toggle',
          child: SwitchListTileAdaptive(
            title: const Text(
              'Tooltip background brightness',
            ),
            subtitle: const Text(
              'OFF theme mode inverted, common on Web\n'
              'ON theme mode brightness, like Windows',
            ),
            value: controller.tooltipsMatchBackground &&
                controller.useFlexColorScheme,
            onChanged: controller.useFlexColorScheme
                ? controller.setTooltipsMatchBackground
                : null,
          ),
        ),
        const Divider(),
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: ShowSubThemeColors(),
        ),
        const ListTile(
          dense: true,
          subtitle: Text("Colors are controlled in each component's "
              'settings panel. Above default or currently selected '
              'ColorScheme based used theme color for each component.'),
        ),
        const Divider(height: 16),
        SwitchListTileAdaptive(
          dense: true,
          title: const Text('Use Flutter defaults'),
          subtitle: const Text('Undefined sub-theme values will fall '
              'back to Flutter SDK defaults. Prefer OFF to use FCS defaults. '
              'This setting affects component themes that implement it, '
              'currently BottomNavigationBar, NavigationBar and '
              'NavigationRail. See API docs for more info.'),
          value: controller.useFlutterDefaults &&
              controller.useSubThemes &&
              controller.useFlexColorScheme,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? controller.setUseFlutterDefaults
              : null,
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
