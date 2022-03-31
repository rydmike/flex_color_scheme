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
    final String labelForDefaultIndicator = (!controller.useFlexColorScheme ||
            (controller.useFlutterDefaults &&
                controller.navBarIndicatorSchemeColor == null))
        ? 'null (onSurface)'
        : 'null (primary)';
    final String labelForDefaultSelectedItem =
        (!controller.useFlexColorScheme ||
                (controller.useFlutterDefaults &&
                    controller.navBarSelectedSchemeColor == null &&
                    controller.navBarUnselectedSchemeColor == null))
            ? 'null (onSurface)'
            : 'null (primary)';
    final bool muteUnselectedEnabled = controller.useSubThemes &&
        controller.useFlexColorScheme &&
        !(controller.useFlutterDefaults &&
            controller.navBarSelectedSchemeColor == null &&
            controller.navBarUnselectedSchemeColor == null);
    final String labelForDefaultUnelectedItem =
        (!controller.useFlexColorScheme ||
                !controller.useSubThemes ||
                (controller.useFlutterDefaults &&
                    controller.navBarSelectedSchemeColor == null &&
                    controller.navBarUnselectedSchemeColor == null))
            ? 'null (onSurface)'
            : controller.navBarMuteUnselected && muteUnselectedEnabled
                ? 'null (onSurface, blend & opacity)'
                : 'null (onSurface)';
    final bool navBarOpacityEnabled = controller.useSubThemes &&
        controller.useFlexColorScheme &&
        !(controller.navBarBackgroundSchemeColor == null &&
            controller.useFlutterDefaults);
    final double navBarOpacity =
        navBarOpacityEnabled ? controller.navBarOpacity : 1;

    return Column(
      children: <Widget>[
        const SizedBox(height: 8),
        ColorSchemePopupMenu(
          title: const Text('Background color'),
          labelForDefault: !controller.useSubThemes ||
                  !controller.useFlexColorScheme ||
                  (controller.useFlutterDefaults &&
                      controller.navBarBackgroundSchemeColor == null)
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
          enabled: navBarOpacityEnabled,
          title: const Text('Background opacity'),
          subtitle: Slider.adaptive(
            max: 100,
            divisions: 100,
            label: (navBarOpacity * 100).toStringAsFixed(0),
            value: navBarOpacity * 100,
            onChanged: navBarOpacityEnabled
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
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Height'),
          subtitle: Slider.adaptive(
            min: 54,
            max: 100,
            divisions: 46,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.navBarHeight == null ||
                        (controller.navBarHeight ?? 54) < 55
                    ? controller.useFlutterDefaults
                        ? 'default 80'
                        : 'default 62'
                    : (controller.navBarHeight?.toStringAsFixed(0) ?? '')
                : 'default 80',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.navBarHeight ?? 54
                : 54,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setNavBarHeight(value < 55 ? null : value);
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'HEIGHT',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.navBarHeight == null ||
                              (controller.navBarHeight ?? 54) < 55
                          ? controller.useFlutterDefaults
                              ? 'default 80'
                              : 'default 62'
                          : (controller.navBarHeight?.toStringAsFixed(0) ?? '')
                      : 'default 80',
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
          labelForDefault: labelForDefaultIndicator,
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
          subtitle: const Text('Label and icon, but own properties in API'),
          labelForDefault: labelForDefaultSelectedItem,
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
          subtitle: const Text('Label and icon, but own properties in API'),
          labelForDefault: labelForDefaultUnelectedItem,
          index: controller.navBarUnselectedSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setNavBarUnselectedSchemeColor(null);
                  } else {
                    controller.setNavBarUnselectedSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        SwitchListTileAdaptive(
          title: const Text('Mute unselected items'),
          subtitle: const Text('Unselected icon and text are less bright, '
              'Shared setting for icon and text, but separate properties '
              'in API'),
          value: controller.navBarMuteUnselected && muteUnselectedEnabled,
          onChanged:
              muteUnselectedEnabled ? controller.setNavBarMuteUnselected : null,
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
        const SizedBox(height: 8),
        SwitchListTileAdaptive(
          title: const Text('Use Flutter defaults'),
          subtitle: const Text('Undefined values will fall back to '
              'Flutter SDK defaults. Prefer OFF to use FCS defaults. '
              'Here, both selected and unselected color have to be null before '
              'the item colors can fall back to Flutter defaults. '
              'This setting affects many component themes that implement it. '
              'It is included on panels where it has an impact. '
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
