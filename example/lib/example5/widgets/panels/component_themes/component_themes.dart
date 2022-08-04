import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/app/show_sub_theme_colors.dart';
import '../../../../shared/widgets/universal/switch_list_tile_adaptive.dart';

// Panel used to turn usage ON/OFF usage of opinionated component sub-themes.
//
// Settings are available for border radius and a few other options.
class ComponentThemes extends StatelessWidget {
  const ComponentThemes(this.controller, {super.key});
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
                      .caption!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Outline normal width'),
          subtitle: const Text('For OutlinedButton, ToggleButtons and '
              'TextField input decorator in normal mode'),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: Slider.adaptive(
            min: -0.5,
            max: 5,
            divisions: 11,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.thinBorderWidth == null ||
                        (controller.thinBorderWidth ?? -0.5) < 0
                    ? controller.useMaterial3
                        ? 'default 1'
                        : 'default 1.5'
                    : (controller.thinBorderWidth?.toStringAsFixed(1) ?? '')
                : 'default 1',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.thinBorderWidth ?? -0.5
                : -0.5,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setThinBorderWidth(value < 0 ? null : value);
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'WIDTH',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.thinBorderWidth == null ||
                              (controller.thinBorderWidth ?? -0.5) < 0
                          ? controller.useMaterial3
                              ? 'default 1'
                              : 'default 1.5'
                          : (controller.thinBorderWidth?.toStringAsFixed(1) ??
                              '')
                      : 'default 1',
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Outline active thickness'),
          subtitle: const Text('For pressed OutlinedButton and focused '
              'TextField input decorator'),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: Slider.adaptive(
            min: -0.5,
            max: 5,
            divisions: 11,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.thickBorderWidth == null ||
                        (controller.thickBorderWidth ?? -0.5) < 0
                    ? 'default 2'
                    : (controller.thickBorderWidth?.toStringAsFixed(1) ?? '')
                : 'default 2',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.thickBorderWidth ?? -0.5
                : -0.5,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setThickBorderWidth(value < 0 ? null : value);
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'WIDTH',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.thickBorderWidth == null ||
                              (controller.thickBorderWidth ?? -0.5) < 0
                          ? 'default 2'
                          : (controller.thickBorderWidth?.toStringAsFixed(1) ??
                              '')
                      : 'default 2',
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
