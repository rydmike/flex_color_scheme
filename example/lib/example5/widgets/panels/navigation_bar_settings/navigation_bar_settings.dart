import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/navigation_bar_label_behavior_buttons.dart';
import '../../../../shared/widgets/universal/switch_list_tile_adaptive.dart';
import '../../../../shared/widgets/universal/theme_showcase.dart';
import '../../shared/color_scheme_popup_menu.dart';

// Panel used to control the sub-theme for NavigationBar.
class NavigationBarSettings extends StatelessWidget {
  const NavigationBarSettings(this.controller, {Key? key}) : super(key: key);
  final ThemeController controller;

  String explainLabelStyle(
      final NavigationDestinationLabelBehavior labelBehavior) {
    switch (labelBehavior) {
      case NavigationDestinationLabelBehavior.alwaysHide:
        return 'Items have no labels';
      case NavigationDestinationLabelBehavior.onlyShowSelected:
        return 'Only selected item has a label';
      case NavigationDestinationLabelBehavior.alwaysShow:
        return 'All items have labels';
    }
  }

  @override
  Widget build(BuildContext context) {
    final double navBarOpacity =
        controller.useSubThemes && controller.useFlexColorScheme
            ? controller.navBarOpacity
            : 1;
    return Column(
      children: <Widget>[
        const SizedBox(height: 8),
        ColorSchemePopupMenu(
          title: const Text('Background color'),
          labelForDefault: controller.useFlutterDefaults ||
                  !controller.useSubThemes ||
                  !controller.useFlexColorScheme
              ? 'null (surface with onSurface overlay)'
              : 'null (background)',
          index: controller.navBarBackgroundSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setNavBarBackgroundSchemeColor(null);
                  } else {
                    controller.setNavBarBackgroundSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Background opacity'),
          subtitle: Slider.adaptive(
            max: 100,
            divisions: 100,
            label: (navBarOpacity * 100).toStringAsFixed(0),
            value: navBarOpacity * 100,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setNavBarOpacity(value / 100);
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  'OPACITY',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  // ignore: lines_longer_than_80_chars
                  '${(navBarOpacity * 100).toStringAsFixed(0)} %',
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ColorSchemePopupMenu(
          title: const Text('Selection indicator color'),
          labelForDefault: 'null (secondary)',
          index: controller.navBarIndicatorSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setNavBarIndicatorSchemeColor(null);
                  } else {
                    controller.setNavBarIndicatorSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ColorSchemePopupMenu(
          title: const Text('Selected item color'),
          subtitle: const Text('Shared setting in this app, but APIs have '
              'own properties'),
          labelForDefault: 'null (onSurface)',
          index: controller.navBarSelectedSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setNavBarSelectedSchemeColor(null);
                  } else {
                    controller.setNavBarSelectedSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ColorSchemePopupMenu(
          title: const Text('Unselected item color'),
          subtitle: const Text('Shared setting in this app, but APIs have '
              'own properties'),
          labelForDefault: 'null (onSurface)',
          index: controller.navUnselectedSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setNavUnselectedSchemeColor(null);
                  } else {
                    controller
                        .setNavUnselectedSchemeColor(SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        SwitchListTileAdaptive(
          title: const Text('Mute unselected items'),
          subtitle: const Text('Unselected icon and text are less bright.\n'
              'Shared setting in this app, but APIs have own properties'),
          value: controller.navBarMuteUnselected &&
              controller.useSubThemes &&
              controller.useFlexColorScheme,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? controller.setNavBarMuteUnselected
              : null,
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Label behavior'),
          subtitle: Text(explainLabelStyle(
              controller.useSubThemes && controller.useFlexColorScheme
                  ? controller.navBarLabelBehavior
                  : NavigationDestinationLabelBehavior.alwaysShow)),
          trailing: NavigationBarLabelBehaviorButtons(
            labelBehavior:
                controller.useSubThemes && controller.useFlexColorScheme
                    ? controller.navBarLabelBehavior
                    : NavigationDestinationLabelBehavior.alwaysShow,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.setNavBarLabelBehavior
                : null,
          ),
        ),
        const NavigationBarShowcase(),
        const Divider(height: 1),
        const SizedBox(height: 16),
      ],
    );
  }
}
