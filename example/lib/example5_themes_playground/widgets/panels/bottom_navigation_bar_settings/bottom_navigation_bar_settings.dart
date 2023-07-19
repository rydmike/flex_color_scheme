import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../../../shared/widgets/universal/switch_list_tile_reveal.dart';
import '../../shared/color_scheme_popup_menu.dart';
import '../../shared/navigators_use_default_switch.dart';

// Panel used to control the sub-theme for BottomNavigationBar.
class BottomNavigationBarSettings extends StatelessWidget {
  const BottomNavigationBarSettings(this.controller, {super.key});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
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

    // Logic for default elevation label.
    final String elevationDefaultLabel =
        controller.bottomNavigationBarElevation == null
            ? controller.useFlutterDefaults
                ? 'default 8'
                : 'default 3'
            : controller.bottomNavigationBarElevation!.toStringAsFixed(1);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTileReveal(
          title: Text('BottomNavigationBar colors and styles'),
          subtitle: Text(
            'Default SDK background color is theme canvasColor via Material. '
            'The canvasColor is typically colorScheme.background, elevation '
            'is 8. FCS sub-theme default is colorScheme.background and '
            'elevation 0.\n',
          ),
        ),
        Card(
          elevation: 0,
          shadowColor: Colors.transparent,
          color: theme.colorScheme.surfaceVariant,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: BottomNavigationBarShowcase(explain: false),
          ),
        ),
        const SizedBox(height: 8),
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
          subtitle: Slider(
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
            padding: const EdgeInsetsDirectional.only(end: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'OPACITY',
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  // ignore: lines_longer_than_80_chars
                  '${(navBarOpacity * 100).toStringAsFixed(0)} %',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Elevation'),
          subtitle: Slider(
            min: -1,
            max: 24,
            divisions: 25,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.bottomNavigationBarElevation == null ||
                        (controller.bottomNavigationBarElevation ?? -1) < 0
                    ? elevationDefaultLabel
                    : (controller.bottomNavigationBarElevation
                            ?.toStringAsFixed(1) ??
                        '')
                : 'default 8',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.bottomNavigationBarElevation ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setBottomNavigationBarElevation(
                        value < 0 ? null : value.roundToDouble());
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'ELEV',
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.bottomNavigationBarElevation == null ||
                              (controller.bottomNavigationBarElevation ?? -1) <
                                  0
                          ? elevationDefaultLabel
                          : (controller.bottomNavigationBarElevation
                                  ?.toStringAsFixed(1) ??
                              '')
                      : 'default 8',
                  style: theme.textTheme.bodySmall!
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
        SwitchListTileReveal(
          title: const Text('Mute unselected items'),
          subtitleDense: true,
          subtitle: const Text('Unselected icon and text are less bright. '
              'Shared setting for icon and text in the Playground, but '
              'separate properties are used by the API.\n'),
          value: muteUnselectedEnabled
              ? controller.bottomNavBarMuteUnselected
              : !muteUnselectedEnabled,
          onChanged: muteUnselectedEnabled
              ? controller.setBottomNavBarMuteUnselected
              : null,
        ),
        SwitchListTile(
          title: const Text('Show selected labels'),
          value: controller.bottomNavShowSelectedLabels &&
              controller.useSubThemes &&
              controller.useFlexColorScheme,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? controller.setBottomNavShowSelectedLabels
              : null,
        ),
        SwitchListTile(
          title: const Text('Show unselected labels'),
          value: controller.bottomNavShowUnselectedLabels &&
              controller.useSubThemes &&
              controller.useFlexColorScheme,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? controller.setBottomNavShowUnselectedLabels
              : null,
        ),
        NavigatorsUseDefaultsSwitch(controller: controller),
        const ListTileReveal(
          dense: true,
          title: Text('More settings with the API'),
          subtitle: Text(
            'With the API you can also set the font and icon size '
            'individually on selected and unselected items. Use '
            'FlexSubThemesData properties: '
            'bottomNavigationBarSelectedLabelSize, '
            'bottomNavigationBarUnselectedLabelSize, '
            'bottomNavigationBarSelectedIconSize and '
            'bottomNavigationBarUnselectedIconSize.\n',
          ),
        ),
      ],
    );
  }
}
