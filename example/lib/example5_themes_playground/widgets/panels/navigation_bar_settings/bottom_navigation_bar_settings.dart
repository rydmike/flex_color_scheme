import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/switch_list_tile_adaptive.dart';
import '../../../../shared/widgets/universal/theme_showcase.dart';
import '../../shared/color_scheme_popup_menu.dart';

// Panel used to control the sub-theme for BottomNavigationBar.
class BottomNavigationBarSettings extends StatelessWidget {
  const BottomNavigationBarSettings(this.controller, {super.key});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle denseHeader = theme.textTheme.titleMedium!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final String labelForDefaultSelectedItem = isDark &&
            (!controller.useFlexColorScheme ||
                (controller.useFlutterDefaults &&
                    controller.bottomNavBarSelectedSchemeColor == null &&
                    controller.bottomNavBarUnselectedSchemeColor == null))
        ? 'default (secondary)'
        : 'default (primary)';
    final bool muteUnselectedEnabled = controller.useSubThemes &&
        controller.useFlexColorScheme &&
        !(controller.useFlutterDefaults &&
            controller.bottomNavBarSelectedSchemeColor == null &&
            controller.bottomNavBarUnselectedSchemeColor == null);
    final String labelForDefaultUnelectedItem =
        (!controller.useFlexColorScheme ||
                !controller.useSubThemes ||
                (controller.useFlutterDefaults &&
                    controller.bottomNavBarUnselectedSchemeColor == null &&
                    controller.bottomNavBarUnselectedSchemeColor == null))
            ? 'default (onSurface with opacity)'
            : controller.bottomNavBarMuteUnselected && muteUnselectedEnabled
                ? 'default (onSurface, blend & opacity)'
                : isDark
                    ? 'default (white70)'
                    : 'default (black54)';
    final bool navBarOpacityEnabled = controller.useSubThemes &&
        controller.useFlexColorScheme &&
        !(controller.bottomNavBarBackgroundSchemeColor == null &&
            controller.useFlutterDefaults);
    final double navBarOpacity =
        navBarOpacityEnabled ? controller.bottomNavigationBarOpacity : 1;

    final double navBarElevation =
        controller.useSubThemes && controller.useFlexColorScheme
            ? controller.bottomNavigationBarElevation
            : 8;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        const BottomNavigationBarShowcase(),
        ColorSchemePopupMenu(
          title: const Text('Background color'),
          labelForDefault: 'default (background)',
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
          enabled: navBarOpacityEnabled,
          title: const Text('Background opacity'),
          subtitle: Slider.adaptive(
            max: 100,
            divisions: 100,
            label: (navBarOpacity * 100).toStringAsFixed(0),
            value: navBarOpacity * 100,
            onChanged: navBarOpacityEnabled
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
                      .bodySmall!
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
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ColorSchemePopupMenu(
          title: const Text('Selected item color'),
          subtitle: const Text('Label and icon, but own properties in API'),
          labelForDefault: labelForDefaultSelectedItem,
          index: controller.bottomNavBarSelectedSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setBottomNavBarSelectedSchemeColor(null);
                  } else {
                    controller.setBottomNavBarSelectedSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ColorSchemePopupMenu(
          title: const Text('Unselected item color'),
          subtitle: const Text('Label and icon, but own properties in API'),
          labelForDefault: labelForDefaultUnelectedItem,
          index: controller.bottomNavBarUnselectedSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setBottomNavBarUnselectedSchemeColor(null);
                  } else {
                    controller.setBottomNavBarUnselectedSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        SwitchListTileAdaptive(
          title: const Text('Mute unselected items'),
          subtitle: const Text('Unselected icon and text are less bright. '
              'Shared setting for icon and text, but separate properties '
              'in API'),
          value: muteUnselectedEnabled
              ? controller.bottomNavBarMuteUnselected
              : !muteUnselectedEnabled,
          onChanged: muteUnselectedEnabled
              ? controller.setBottomNavBarMuteUnselected
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
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
          child: Text(
            'More settings with the API',
            style: denseHeader,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: Text(
            'With the API you can also set the font and icon size '
            'individually on selected and unselected items. Use '
            'FlexSubThemesData properties: '
            'bottomNavigationBarSelectedLabelSize, '
            'bottomNavigationBarUnselectedLabelSize, '
            'bottomNavigationBarSelectedIconSize and '
            'bottomNavigationBarUnselectedIconSize.',
            style: denseBody,
          ),
        ),
        SwitchListTileAdaptive(
          dense: true,
          title: const Text('Use Flutter defaults'),
          subtitle: const Text('Undefined color values will fall back to '
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
