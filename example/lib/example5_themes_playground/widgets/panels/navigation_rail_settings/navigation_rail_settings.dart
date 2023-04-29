import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../../../shared/widgets/universal/switch_list_tile_reveal.dart';
import '../../dialogs/set_navigation_rail_to_m3_dialog.dart';
import '../../shared/color_scheme_popup_menu.dart';
import '../../shared/navigators_use_default_switch.dart';
import 'navigation_rail_label_type_list_tile.dart';

class NavigationRailSettings extends StatelessWidget {
  const NavigationRailSettings(this.controller, {super.key});
  final ThemeController controller;

  Future<void> _handleSetToM3(BuildContext context) async {
    final bool? reset = await showDialog<bool?>(
      context: context,
      builder: (BuildContext context) {
        return const SetNavigationRailToM3Dialog();
      },
    );
    if (reset ?? false) {
      await controller.setNavigationRailToM3();
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;
    // Logic for indicator color label default value,
    // custom color selection overrides default label and value.
    String indicatorColorLabel() {
      // Use FCS component default, primary.
      if (!controller.useFlutterDefaults &&
          controller.useFlexColorScheme &&
          controller.useSubThemes) {
        return 'default (primary)';
      }
      // Use M2 default color
      if (!controller.useMaterial3) {
        return 'default (primary)';
      }
      // All other cases will use M3 style.
      return 'default (secondaryContainer)';
    }

    // Logic for selected icon color label default value,
    // custom color selection overrides default label and value.
    String selectedIconColorLabel() {
      // Use FCS component default, primary.
      if (!controller.useFlutterDefaults &&
          controller.useFlexColorScheme &&
          controller.useSubThemes) {
        return 'default (primary)';
      }
      // Use M2 default color
      if (!controller.useMaterial3) {
        return 'default (primary)';
      }
      // All other cases will use M3 style.
      return 'default (onSecondaryContainer)';
    }

    // Logic for selected icon color label default value,
    // custom color selection overrides default label and value.
    String selectedLabelColorLabel() {
      // Use FCS component default, primary.
      if (!controller.useFlutterDefaults &&
          controller.useFlexColorScheme &&
          controller.useSubThemes) {
        return 'default (primary)';
      }
      // Use M2 default color
      if (!controller.useMaterial3) {
        return 'default (primary)';
      }
      // All other cases will use M3 style.
      return 'default (onSurface)';
    }

    // const String labelForDefaultSelectedItem = 'default (primary)';
    final bool muteUnselectedEnabled = controller.useSubThemes &&
        controller.useFlexColorScheme &&
        !(controller.useFlutterDefaults &&
            controller.navRailSelectedIconSchemeColor == null &&
            controller.navRailUnselectedSchemeColor == null);

    // Logic for unselected item color label default value,
    // custom color selection overrides default label and value.
    String unselectedItemColorLabel() {
      // Use FCS component default, onSurface with muted label.
      if (!controller.useFlutterDefaults &&
          controller.useFlexColorScheme &&
          controller.useSubThemes &&
          controller.navRailMuteUnselected &&
          muteUnselectedEnabled) {
        return 'default (onSurface, with blend & opacity)';
      }
      // Use FCS component default, onSurface.
      if (!controller.useMaterial3 && controller.useFlutterDefaults) {
        return 'default (onSurface, with opacity 64%)';
      }
      // Use M2 default, onSurface.
      if (!controller.useMaterial3) {
        return 'default (onSurface)';
      }
      // All other cases will use M3 style.
      return 'default (icon onSurfaceVariant, label onSurface)';
    }

    final bool navRailOpacityEnabled = controller.useSubThemes &&
        controller.useFlexColorScheme &&
        !(controller.navRailBackgroundSchemeColor == null &&
            controller.useFlutterDefaults);
    final double navRailOpacity =
        navRailOpacityEnabled ? controller.navRailOpacity : 1;
    final bool navRailIndicatorOpacityEnabled =
        controller.navRailUseIndicator &&
            controller.useSubThemes &&
            controller.useFlexColorScheme &&
            !(controller.navRailIndicatorSchemeColor == null &&
                controller.useFlutterDefaults);
    final double navRailIndicatorOpacity = navRailIndicatorOpacityEnabled
        ? (controller.navRailIndicatorOpacity ?? -0.01)
        : -0.01;
    // Logic for default elevation label.
    final String elevationDefaultLabel = controller.navRailElevation == null
        ? 'default 0'
        : controller.navRailElevation!.toStringAsFixed(1);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        ListTileReveal(
            enabled: useMaterial3,
            title: const Text('Use Material 3 default NavigationRail style?'),
            subtitleDense: true,
            subtitle: const Text('Update settings below to match M3 default '
                'values.\n'),
            trailing: FilledButton(
              onPressed: useMaterial3
                  ? () async {
                      await _handleSetToM3(context);
                    }
                  : null,
              child: const Text('Set to M3'),
            ),
            onTap: () async {
              await _handleSetToM3(context);
            }),
        ColorSchemePopupMenu(
          title: const Text('Background color'),
          labelForDefault: !controller.useSubThemes ||
                  !controller.useFlexColorScheme ||
                  (controller.useFlutterDefaults &&
                      controller.navRailBackgroundSchemeColor == null)
              ? 'default (surface)'
              : 'default (background)',
          index: controller.navRailBackgroundSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setNavRailBackgroundSchemeColor(null);
                  } else {
                    controller.setNavRailBackgroundSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ListTile(
          enabled: navRailOpacityEnabled,
          title: const Text('Background opacity'),
          subtitle: Slider(
            max: 100,
            divisions: 100,
            label: (navRailOpacity * 100).toStringAsFixed(0),
            value: navRailOpacity * 100,
            onChanged: navRailOpacityEnabled
                ? (double value) {
                    controller.setNavRailOpacity(value / 100);
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
                  '${(navRailOpacity * 100).toStringAsFixed(0)} %',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        // const Divider(),
        ListTile(
          title: const Text('Elevation'),
          subtitle: Slider(
            min: -1,
            max: 24,
            divisions: 25,
            label: controller.useSubThemes &&
                    controller.useFlexColorScheme &&
                    !controller.useFlutterDefaults
                ? controller.navRailElevation == null ||
                        (controller.navRailElevation ?? -1) < 0
                    ? elevationDefaultLabel
                    : (controller.navRailElevation?.toStringAsFixed(1) ?? '')
                : 'default 0',
            value: controller.useSubThemes &&
                    controller.useFlexColorScheme &&
                    !controller.useFlutterDefaults
                ? controller.navRailElevation ?? -1
                : -1,
            onChanged: controller.useSubThemes &&
                    controller.useFlexColorScheme &&
                    !controller.useFlutterDefaults
                ? (double value) {
                    controller.setNavRailElevation(
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
                  controller.useSubThemes &&
                          controller.useFlexColorScheme &&
                          !controller.useFlutterDefaults
                      ? controller.navRailElevation == null ||
                              (controller.navRailElevation ?? -1) < 0
                          ? elevationDefaultLabel
                          : (controller.navRailElevation?.toStringAsFixed(1) ??
                              '')
                      : 'default 0',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        SwitchListTileReveal(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Use selection indicator'),
          subtitleDense: true,
          subtitle: const Text('On by default when useMaterial3 '
              'is true, turn OFF component themes to see this.\n'),
          value: controller.navRailUseIndicator &&
              controller.useSubThemes &&
              controller.useFlexColorScheme,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? controller.setNavRailUseIndicator
              : null,
        ),
        ColorSchemePopupMenu(
          title: const Text('Selection indicator color'),
          labelForDefault: indicatorColorLabel(),
          index: controller.navRailIndicatorSchemeColor?.index ?? -1,
          onChanged: controller.navRailUseIndicator &&
                  controller.useSubThemes &&
                  controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setNavRailIndicatorSchemeColor(null);
                  } else {
                    controller.setNavRailIndicatorSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ListTile(
          enabled: navRailIndicatorOpacityEnabled,
          title: const Text('Selection indicator opacity'),
          subtitle: Slider(
            min: -1,
            max: 100,
            divisions: 101,
            label: navRailIndicatorOpacityEnabled
                ? controller.navRailIndicatorOpacity == null ||
                        (controller.navRailIndicatorOpacity ?? -1) < 0
                    ? 'default 24%'
                    : (navRailIndicatorOpacity * 100).toStringAsFixed(0)
                : 'default 24%',
            value: navRailIndicatorOpacity * 100,
            onChanged: navRailIndicatorOpacityEnabled
                ? (double value) {
                    controller.setNavRailIndicatorOpacity(
                        value < 0 ? null : value / 100);
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
                  navRailIndicatorOpacityEnabled
                      ? controller.navRailIndicatorOpacity == null ||
                              (controller.navRailIndicatorOpacity ?? -1) < 0
                          ? 'default 24%'
                          // ignore: lines_longer_than_80_chars
                          : '${(navRailIndicatorOpacity * 100).toStringAsFixed(0)} %'
                      : 'default 24%',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Indicator border radius'),
          subtitle: Slider(
            min: -1,
            max: 50,
            divisions: 51,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.navRailIndicatorBorderRadius == null ||
                        (controller.navRailIndicatorBorderRadius ?? -1) < 0
                    ? 'default (stadium)'
                    : (controller.navRailIndicatorBorderRadius
                            ?.toStringAsFixed(0) ??
                        '')
                : 'default (stadium)',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.navRailIndicatorBorderRadius ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setNavRailIndicatorBorderRadius(
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
                  'RADIUS',
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.navRailIndicatorBorderRadius == null ||
                              (controller.navRailIndicatorBorderRadius ?? -1) <
                                  0
                          ? 'default (stadium)'
                          : (controller.navRailIndicatorBorderRadius
                                  ?.toStringAsFixed(0) ??
                              '')
                      : 'default (stadium)',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        NavigationRailLabelBehaviorListTile(controller: controller),
        NavigationRailShowcase(
          explain: false,
          height: 700,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ColorSchemePopupMenu(
                title: const Text('Selected icon color'),
                labelForDefault: selectedIconColorLabel(),
                index: controller.navRailSelectedIconSchemeColor?.index ?? -1,
                onChanged: controller.useSubThemes &&
                        controller.useFlexColorScheme
                    ? (int index) {
                        if (index < 0 || index >= SchemeColor.values.length) {
                          controller.setNavRailSelectedIconSchemeColor(null);
                        } else {
                          controller.setNavRailSelectedIconSchemeColor(
                              SchemeColor.values[index]);
                        }
                      }
                    : null,
              ),
              ColorSchemePopupMenu(
                title: const Text('Selected label color'),
                labelForDefault: selectedLabelColorLabel(),
                index: controller.navRailSelectedLabelSchemeColor?.index ?? -1,
                onChanged: controller.useSubThemes &&
                        controller.useFlexColorScheme
                    ? (int index) {
                        if (index < 0 || index >= SchemeColor.values.length) {
                          controller.setNavRailSelectedLabelSchemeColor(null);
                        } else {
                          controller.setNavRailSelectedLabelSchemeColor(
                              SchemeColor.values[index]);
                        }
                      }
                    : null,
              ),
              ColorSchemePopupMenu(
                title: const Text('Unselected item color'),
                subtitle:
                    const Text('Label and icon, but own properties in API'),
                labelForDefault: unselectedItemColorLabel(),
                index: controller.navRailUnselectedSchemeColor?.index ?? -1,
                onChanged: controller.useSubThemes &&
                        controller.useFlexColorScheme
                    ? (int index) {
                        if (index < 0 || index >= SchemeColor.values.length) {
                          controller.setNavRailUnselectedSchemeColor(null);
                        } else {
                          controller.setNavRailUnselectedSchemeColor(
                              SchemeColor.values[index]);
                        }
                      }
                    : null,
              ),
              SwitchListTileReveal(
                enabled:
                    controller.useSubThemes && controller.useFlexColorScheme,
                title: const Text('Mute unselected items'),
                subtitleDense: true,
                subtitle: const Text(
                    'Unselected icon and text are less bright. Shared '
                    'setting for icon and text, but separate properties '
                    'in API.\n'),
                value: muteUnselectedEnabled
                    ? controller.navRailMuteUnselected
                    : !muteUnselectedEnabled,
                onChanged: muteUnselectedEnabled
                    ? controller.setNavRailMuteUnselected
                    : null,
              ),
              const Divider(),
              NavigatorsUseDefaultsSwitch(controller: controller),
              const ListTileReveal(
                dense: true,
                title: Text('More settings with the API'),
                subtitle: Text(
                  'With the API you can also set the font and icon size '
                  'individually on selected and unselected items. Use '
                  'FlexSubThemesData properties: '
                  'navigationRailSelectedLabelSize, '
                  'navigationRailUnselectedLabelSize, '
                  'navigationRailSelectedIconSize and '
                  'navigationRailUnselectedIconSize.\n',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
