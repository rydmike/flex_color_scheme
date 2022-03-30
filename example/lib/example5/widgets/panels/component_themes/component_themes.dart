import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/app/show_sub_theme_colors.dart';
import '../../../../shared/widgets/universal/switch_list_tile_adaptive.dart';

// Panel used to turn usage ON/OFF usage of opinionated component sub-themes.
//
// Settings are available for border radius and a few other options.
class ComponentThemes extends StatelessWidget {
  const ComponentThemes(this.controller, {Key? key}) : super(key: key);
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final bool isLight = Theme.of(context).brightness == Brightness.light;
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
        SwitchListTileAdaptive(
          title: const Text('Use Material 3 TextTheme'),
          subtitle: const Text("ON to use FlexColorScheme's M3 text styles "
              'and geometry\n'
              'OFF to use SDK M2 2018 text styles and geometry'),
          value: controller.useTextTheme &&
              controller.useSubThemes &&
              controller.useFlexColorScheme,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? controller.setUseTextTheme
              : null,
        ),
        if (isLight)
          SwitchListTileAdaptive(
            title: const Text('Light mode TextTheme is primary colored'),
            subtitle: const Text('Primary color is mixed into main text theme'),
            value: controller.blendLightTextTheme &&
                controller.useSubThemes &&
                controller.useFlexColorScheme,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.setBlendLightTextTheme
                : null,
          )
        else
          SwitchListTileAdaptive(
            title: const Text('Dark mode TextTheme is primary colored'),
            subtitle: const Text('Primary color is mixed into main text theme'),
            value: controller.blendDarkTextTheme &&
                controller.useSubThemes &&
                controller.useFlexColorScheme,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.setBlendDarkTextTheme
                : null,
          ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Global border radius on components'),
          subtitle: const Text('Defaults use Material 3 design '
              'values, where radius spec varies per component. '
              'Material 2 design uses 4 on all components. '
              'If you set a value, all components will use it. '
              'You can set per component too, it will then use its own '
              'setting, regardless of what is set here'),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: Slider.adaptive(
            min: -1,
            max: 40,
            divisions: 41,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.cornerRadius == null ||
                        (controller.cornerRadius ?? -1) < 0
                    ? 'default'
                    : (controller.cornerRadius?.toStringAsFixed(0) ?? '')
                : 'default 4',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.cornerRadius ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setCornerRadius(value < 0 ? null : value);
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
                      ? controller.cornerRadius == null ||
                              (controller.cornerRadius ?? -1) < 0
                          ? 'default'
                          : (controller.cornerRadius?.toStringAsFixed(0) ?? '')
                      : 'default 4',
                  style: Theme.of(context)
                      .textTheme
                      .caption!
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
          padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: ShowSubThemeColors(),
        ),
        SwitchListTileAdaptive(
          title: const Text('Use Flutter defaults'),
          subtitle: const Text('Undefined sub-theme color values will fall '
              'back to Flutter SDK defaults. Prefer OFF to use FCS defaults. '
              'See API docs for more info.'),
          value: controller.useFlutterDefaults &&
              controller.useSubThemes &&
              controller.useFlexColorScheme,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? controller.setUseFlutterDefaults
              : null,
        ),
      ],
    );
  }
}
