import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../../../shared/widgets/universal/slider_list_tile_reveal.dart';
import '../../../../shared/widgets/universal/switch_list_tile_reveal.dart';
import '../../shared/color_scheme_popup_menu.dart';
import 'navigation_rail_label_type_list_tile.dart';

class NavigationRailSettings extends StatelessWidget {
  const NavigationRailSettings(this.controller, {super.key});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;

    // The most common logic for enabling Playground controls.
    final bool enableControl =
        controller.useSubThemes && controller.useFlexColorScheme;

    // Logic for indicator color label default value,
    // custom color selection overrides default label and value.
    String indicatorColorLabel() {
      // Use FCS component default, secondaryContainer.
      if (enableControl) {
        return 'default (secondaryContainer)';
      }
      // Use M2 default color
      if (!useMaterial3) {
        return 'default (secondary)';
      }
      // All other cases will use M3 style.
      return 'default (secondaryContainer)';
    }

    // Logic for selected icon color label default value,
    // custom color selection overrides default label and value.
    String selectedIconColorLabel() {
      // Use FCS component default, onSecondaryContainer.
      if (enableControl) {
        return 'default (onSecondaryContainer)';
      }
      // Use M2 default color
      if (!useMaterial3) {
        return 'default (primary)';
      }
      // All other cases will use M3 style.
      return 'default (onSecondaryContainer)';
    }

    // Logic for selected icon color label default value,
    // custom color selection overrides default label and value.
    String selectedLabelColorLabel() {
      // Use FCS component default, onSurface.
      if (enableControl) {
        return 'default (onSurface)';
      }
      // Use M2 default color
      if (!useMaterial3) {
        return 'default (primary)';
      }
      // All other cases will use M3 style.
      return 'default (onSurface)';
    }

    // Logic for unselected item color label default value,
    // custom color selection overrides default label and value.
    String unselectedItemColorLabel() {
      // Use FCS component default.
      if (enableControl) {
        return 'default (onSurfaceVariant)';
      }
      // Use M2 Flutter component default..
      if (!useMaterial3) {
        return 'default (onSurface)';
      }
      // All other cases will use M3 style.
      return 'default (onSurfaceVariant)';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        ColorSchemePopupMenu(
          title: const Text('Background color'),
          labelForDefault: 'default (surface)',
          index: controller.navRailBackgroundSchemeColor?.index ?? -1,
          onChanged: enableControl
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
        SliderListTileReveal(
          enabled: enableControl,
          title: const Text('Opacity'),
          value: controller.navRailOpacity,
          onChanged: controller.setNavRailOpacity,
          min: 0,
          max: 1,
          divisions: 100,
          valueDisplayScale: 100,
          valueDecimalPlaces: 0,
          valueHeading: 'OPACITY',
          valueUnitLabel: ' %',
          valueDefaultLabel: '100 %',
        ),
        SliderListTileReveal(
          enabled: enableControl,
          title: const Text('Elevation'),
          value: controller.navRailElevation,
          onChanged: controller.setNavRailElevation,
          min: 0,
          max: 24,
          divisions: 24,
          valueHeading: 'ELEV',
          valueDecimalPlaces: 1,
          valueDefaultLabel: '0',
        ),
        SwitchListTileReveal(
          enabled: enableControl,
          title: const Text('Use selection indicator'),
          subtitleReveal: const Text('On by default when useMaterial3 '
              'is true, turn OFF component themes to see this.\n'),
          value: enableControl && controller.navRailUseIndicator,
          onChanged: enableControl ? controller.setNavRailUseIndicator : null,
        ),
        ColorSchemePopupMenu(
          title: const Text('Selection indicator color'),
          labelForDefault: indicatorColorLabel(),
          index: controller.navRailIndicatorSchemeColor?.index ?? -1,
          onChanged: enableControl && controller.navRailUseIndicator
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
        SliderListTileReveal(
          enabled: enableControl && controller.navRailUseIndicator,
          title: const Text('Selection indicator opacity'),
          value: controller.navRailIndicatorOpacity,
          onChanged: controller.setNavRailIndicatorOpacity,
          min: 0,
          max: 1,
          divisions: 100,
          valueDisplayScale: 100,
          valueDecimalPlaces: 0,
          valueHeading: 'OPACITY',
          valueUnitLabel: ' %',
          valueDefaultLabel: '100 %',
          valueDefaultDisabledLabel: useMaterial3 ? '100 %' : '64 %',
        ),
        SliderListTileReveal(
          enabled: enableControl &&
              controller.navRailUseIndicator &&
              !(!useMaterial3 &&
                  controller.navRailLabelType == NavigationRailLabelType.none),
          title: const Text('Indicator border radius'),
          value: controller.navRailIndicatorBorderRadius,
          onChanged: controller.setNavRailIndicatorBorderRadius,
          min: 0,
          max: 50,
          divisions: 50,
          valueDecimalPlaces: 0,
          valueHeading: 'RADIUS',
          valueUnitLabel: ' dp',
          valueDefaultLabel: 'stadium',
          valueDefaultDisabledLabel: !useMaterial3 &&
                  controller.navRailLabelType == NavigationRailLabelType.none
              ? 'circular'
              : 'stadium',
        ),
        NavigationRailLabelBehaviorListTile(controller: controller),
        Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text('Text'),
                  const SizedBox(height: 16),
                  const Text('behind'),
                  const SizedBox(height: 16),
                  const Text('Rail'),
                  const SizedBox(height: 16),
                  FilledButton(onPressed: () {}, child: const Text('OK')),
                  const SizedBox(height: 16),
                  ColoredBox(
                      color: theme.colorScheme.tertiaryContainer,
                      child: const SizedBox(height: 60, width: 60)),
                ],
              ),
            ),
            NavigationRailShowcase(
              explain: false,
              height: 700,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ColorSchemePopupMenu(
                    title: const Text('Selected icon color'),
                    labelForDefault: selectedIconColorLabel(),
                    index:
                        controller.navRailSelectedIconSchemeColor?.index ?? -1,
                    onChanged: enableControl
                        ? (int index) {
                            if (index < 0 ||
                                index >= SchemeColor.values.length) {
                              controller
                                  .setNavRailSelectedIconSchemeColor(null);
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
                    index:
                        controller.navRailSelectedLabelSchemeColor?.index ?? -1,
                    onChanged: enableControl
                        ? (int index) {
                            if (index < 0 ||
                                index >= SchemeColor.values.length) {
                              controller
                                  .setNavRailSelectedLabelSchemeColor(null);
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
                    onChanged: enableControl
                        ? (int index) {
                            if (index < 0 ||
                                index >= SchemeColor.values.length) {
                              controller.setNavRailUnselectedSchemeColor(null);
                            } else {
                              controller.setNavRailUnselectedSchemeColor(
                                  SchemeColor.values[index]);
                            }
                          }
                        : null,
                  ),
                  SwitchListTileReveal(
                    enabled: enableControl,
                    title: const Text('Mute unselected items'),
                    subtitleReveal: const Text(
                        'Unselected icon and text are less bright. Shared '
                        'setting for icon and text, but separate properties '
                        'in API.\n'),
                    value: enableControl
                        ? controller.navRailMuteUnselected
                        : !enableControl,
                    onChanged: enableControl
                        ? controller.setNavRailMuteUnselected
                        : null,
                  ),
                  const Divider(),
                  const ListTileReveal(
                    dense: true,
                    title: Text('More settings with the API'),
                    subtitleReveal: Text(
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
        ),
      ],
    );
  }
}
