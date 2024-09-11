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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        ColorSchemePopupMenuNew(
          enabled: enableControl,
          title: const Text('Background color'),
          defaultLabel: 'surface',
          value: controller.navRailBackgroundSchemeColor,
          onChanged: controller.setNavRailBackgroundSchemeColor,
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
        ColorSchemePopupMenuNew(
          enabled: enableControl,
          title: const Text('Selection indicator color'),
          defaultLabel: 'secondaryContainer',
          defaultDisabledLabelM2: 'secondary',
          value: controller.navRailIndicatorSchemeColor,
          onChanged: controller.setNavRailIndicatorSchemeColor,
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
                  ColorSchemePopupMenuNew(
                    enabled: enableControl,
                    title: const Text('Selected icon color'),
                    defaultLabel: controller.navRailIndicatorSchemeColor == null
                        ? 'onSecondaryContainer'
                        : SchemeColor
                            .values[FlexSubThemes.onSchemeColor(
                                    controller.navRailIndicatorSchemeColor!)
                                .index]
                            .name,
                    defaultDisabledLabel: 'onSecondaryContainer',
                    defaultDisabledLabelM2: 'primary',
                    value: controller.navRailSelectedIconSchemeColor,
                    onChanged: controller.setNavRailSelectedIconSchemeColor,
                  ),
                  ColorSchemePopupMenuNew(
                    enabled: enableControl,
                    title: const Text('NEW Selected label color'),
                    defaultLabel: controller.navRailBackgroundSchemeColor ==
                            null
                        ? 'onSurface'
                        : SchemeColor
                            .values[FlexSubThemes.onSchemeColor(
                                    controller.navRailBackgroundSchemeColor!)
                                .index]
                            .name,
                    defaultDisabledLabel: 'onSurface',
                    defaultDisabledLabelM2: 'primary',
                    value: controller.navRailSelectedIconSchemeColor,
                    onChanged: controller.setNavRailSelectedIconSchemeColor,
                  ),
                  ColorSchemePopupMenuNew(
                    enabled: enableControl,
                    title: const Text('Unselected item color'),
                    subtitle:
                        const Text('Label and icon, but own properties in API'),
                    defaultLabel: controller.navRailBackgroundSchemeColor ==
                            null
                        ? 'onSurfaceVariant'
                        : SchemeColor
                            .values[FlexSubThemes.onSchemeColor(
                                    controller.navRailBackgroundSchemeColor!,
                                    useOnSurfaceVariant: true)
                                .index]
                            .name,
                    defaultDisabledLabel: 'onSurfaceVariant',
                    defaultDisabledLabelM2: 'onSurface with 64% opacity',
                    value: controller.navRailUnselectedSchemeColor,
                    onChanged: controller.setNavRailUnselectedSchemeColor,
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
