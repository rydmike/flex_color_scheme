import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/header_card.dart';
import '../../../../shared/widgets/universal/show_sub_theme_colors.dart';
import '../../../../shared/widgets/universal/switch_list_tile_adaptive.dart';

// Panel used to turn usage ON/OFF usage of opinionated component sub-themes.
//
// Settings are available for border radius and a few other options.
class ComponentThemes extends StatelessWidget {
  const ComponentThemes(
      {Key? key, required this.controller, this.isOpen = true, this.onTap})
      : super(key: key);
  final ThemeController controller;
  final bool isOpen;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final bool isLight = Theme.of(context).brightness == Brightness.light;
    return HeaderCard(
      isOpen: isOpen,
      onTap: onTap,
      title: const Text('Component Themes'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SwitchListTileAdaptive(
            title: const Text('Use component themes'),
            subtitle: const Text('Enable opinionated widget sub themes'),
            value: controller.useSubThemes && controller.useFlexColorScheme,
            onChanged: controller.useFlexColorScheme
                ? controller.setUseSubThemes
                : null,
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
              subtitle: const Text('A hint of primary color is mixed into '
                  'main text theme'),
              value: controller.blendLightTextTheme &&
                  controller.useSubThemes &&
                  controller.useFlexColorScheme,
              onChanged:
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.setBlendLightTextTheme
                      : null,
            )
          else
            SwitchListTileAdaptive(
              title: const Text('Dark mode TextTheme is primary colored'),
              subtitle: const Text('A hint of primary color is mixed into '
                  'main text theme'),
              value: controller.blendDarkTextTheme &&
                  controller.useSubThemes &&
                  controller.useFlexColorScheme,
              onChanged:
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.setBlendDarkTextTheme
                      : null,
            ),
          SwitchListTileAdaptive(
            title: const Text('Use Material 3 rounded corners on UI elements'),
            subtitle: const Text('ON to use M3 spec border radius, varies '
                'per component\n'
                'OFF to set same radius on all widgets, M2 spec is 4\n'
                'With API you can adjust it per widget with a double value'),
            value: controller.useDefaultRadius &&
                controller.useSubThemes &&
                controller.useFlexColorScheme,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.setUseDefaultRadius
                : null,
          ),
          Visibility(
            visible: !controller.useDefaultRadius &&
                controller.useSubThemes &&
                controller.useFlexColorScheme,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: ListTile(
              title: const Text('Border radius on all widgets'),
              subtitle: Slider.adaptive(
                max: 30,
                divisions: 30,
                label: controller.cornerRadius.toStringAsFixed(0),
                value: controller.cornerRadius,
                onChanged: controller.setCornerRadius,
              ),
              trailing: Padding(
                padding: const EdgeInsetsDirectional.only(end: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'dP',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      controller.cornerRadius.toStringAsFixed(0),
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
          SwitchListTileAdaptive(
            title: const Text('Themed interaction effects'),
            subtitle: const Text('Disable, hover, focus, highlight and '
                'splash are based on primary color.\n'
                'OFF for Flutter SDK defaults'),
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
          const Divider(height: 1),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: ShowSubThemeColors(),
          ),
        ],
      ),
    );
  }
}
