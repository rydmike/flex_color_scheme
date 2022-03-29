import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/switch_list_tile_adaptive.dart';
import '../../../../shared/widgets/universal/theme_showcase.dart';
import '../../shared/color_scheme_popup_menu.dart';

// Panel used to control the sub-theme for BottomNavigationBar.
class BottomNavigationBarSettings extends StatelessWidget {
  const BottomNavigationBarSettings(this.controller, {Key? key})
      : super(key: key);
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final String labelForDefaultSelectedItem =
        (isDark && !controller.useFlexColorScheme)
            ? 'null (secondary)'
            : 'null (primary)';
    final double navBarOpacity = controller.useSubThemes &&
            controller.useFlexColorScheme &&
            controller.bottomNavBarBackgroundSchemeColor?.index != null
        ? controller.bottomNavigationBarOpacity
        : 1;
    final double navBarElevation =
        controller.useSubThemes && controller.useFlexColorScheme
            ? controller.bottomNavigationBarElevation
            : 8;
    return Column(
      children: <Widget>[
        const SizedBox(height: 8),
        ColorSchemePopupMenu(
          title: const Text('Background color'),
          labelForDefault: 'null (background)',
          index: controller.bottomNavBarBackgroundSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setBottomNavBarBackgroundSchemeColor(null);
                  } else {
                    controller.setBottomNavBarBackgroundSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ListTile(
          enabled: controller.useSubThemes &&
              controller.useFlexColorScheme &&
              controller.bottomNavBarBackgroundSchemeColor?.index != null,
          title: const Text('Background opacity'),
          subtitle: Slider.adaptive(
            max: 100,
            divisions: 100,
            label: (navBarOpacity * 100).toStringAsFixed(0),
            value: navBarOpacity * 100,
            onChanged: controller.useSubThemes &&
                    controller.useFlexColorScheme &&
                    controller.bottomNavBarBackgroundSchemeColor?.index != null
                ? (double value) {
                    controller.setBottomNavigationBarOpacity(value / 100);
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
          title: const Text('Elevation'),
          subtitle: Slider.adaptive(
            max: 24,
            divisions: 48,
            label: navBarElevation.toStringAsFixed(1),
            value: navBarElevation,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.setBottomNavigationBarElevation
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  'ELEV',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  navBarElevation.toStringAsFixed(1),
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
          title: const Text('Selected item color'),
          subtitle: const Text('Shared setting in this app, but APIs have '
              'own properties'),
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
          subtitle: const Text('Shared setting in this app, but APIs have '
              'own properties'),
          labelForDefault:
              controller.useSubThemes && controller.useFlexColorScheme
                  ? 'null (onSurface)'
                  : 'null (onSurface with opacity)',
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
          subtitle: const Text('Unselected icon and text are less bright.\n'),
          value: controller.navBarMuteUnselected &&
              controller.useSubThemes &&
              controller.useFlexColorScheme,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? controller.setNavBarMuteUnselected
              : null,
        ),
        SwitchListTileAdaptive(
          title: const Text('Show selected labels'),
          value: controller.bottomNavShowSelectedLabels &&
              controller.useSubThemes &&
              controller.useFlexColorScheme,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? controller.setBottomNavShowSelectedLabels
              : null,
        ),
        SwitchListTileAdaptive(
          title: const Text('Show unselected labels'),
          value: controller.bottomNavShowUnselectedLabels &&
              controller.useSubThemes &&
              controller.useFlexColorScheme,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? controller.setBottomNavShowUnselectedLabels
              : null,
        ),
        const BottomNavigationBarShowcase(),
        const Divider(height: 1),
        const SizedBox(height: 16),
      ],
    );
  }
}
