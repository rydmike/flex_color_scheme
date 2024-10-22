import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/responsive_two_widgets.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../../../shared/widgets/universal/slider_list_tile_reveal.dart';
import '../../../../shared/widgets/universal/switch_list_tile_reveal.dart';
import '../../../theme/theme_values.dart';
import '../../shared/color_scheme_popup_menu.dart';
import 'navigation_rail_label_type_list_tile.dart';

class NavigationRailPanel extends StatelessWidget {
  const NavigationRailPanel(this.controller, {super.key});
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
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: ColorSchemePopupMenu(
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              enabled: enableControl,
              title: const Text('Background color'),
              defaultLabel: 'surface',
              value: controller.navigationRailBackgroundSchemeColor,
              onChanged: controller.setNavigationRailBackgroundSchemeColor,
            ),
            lastWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              enabled: enableControl,
              title: const Text('Opacity'),
              value: controller.navigationRailOpacity,
              onChanged: controller.setNavigationRailOpacity,
              min: 0,
              max: 1,
              divisions: 100,
              valueDisplayScale: 100,
              valueDecimalPlaces: 0,
              valueHeading: 'OPACITY',
              valueUnitLabel: ' %',
              valueDefaultLabel: '100 %',
            ),
            isRow: isRow,
          );
        }),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              enabled: enableControl,
              title: const Text('Elevation'),
              value: controller.navigationRailElevation,
              onChanged: controller.setNavigationRailElevation,
              min: 0,
              max: 24,
              divisions: 24,
              valueHeading: 'ELEV',
              valueDecimalPlaces: 1,
              valueDefaultLabel: '0',
            ),
            lastWidget: NavigationRailLabelBehaviorListTile(
              controller: controller,
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
            ),
            isRow: isRow,
          );
        }),
        const Divider(),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: SwitchListTileReveal(
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              enabled: enableControl,
              title: const Text('Use indicator'),
              subtitleReveal: const Text('On by default in Material-3 '
                  'and off in Material-2. Turn OFF component themes '
                  'to see this and toggle M2/M3 mode.\n'),
              value: enableControl && controller.navigationRailUseIndicator,
              onChanged: enableControl
                  ? controller.setNavigationRailUseIndicator
                  : null,
            ),
            lastWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              enabled: enableControl &&
                  controller.navigationRailUseIndicator &&
                  !(!useMaterial3 &&
                      controller.navigationRailLabelType ==
                          NavigationRailLabelType.none),
              title: const Text('Radius'),
              value: controller.navigationRailIndicatorBorderRadius,
              onChanged: controller.setNavigationRailIndicatorBorderRadius,
              min: 0,
              max: 50,
              divisions: 50,
              valueDecimalPlaces: 0,
              valueHeading: 'RADIUS',
              valueUnitLabel: ' dp',
              valueDefaultLabel: 'stadium',
              valueDefaultDisabledLabel: !useMaterial3 &&
                      controller.navigationRailLabelType ==
                          NavigationRailLabelType.none
                  ? 'circular'
                  : 'stadium',
            ),
            isRow: isRow,
          );
        }),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: ColorSchemePopupMenu(
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              enabled: enableControl && controller.navigationRailUseIndicator,
              title: const Text('Color'),
              defaultLabel: 'secondaryContainer',
              defaultDisabledLabelM2: 'secondary',
              value: controller.navigationRailIndicatorSchemeColor,
              onChanged: controller.setNavigationRailIndicatorSchemeColor,
            ),
            lastWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              enabled: enableControl && controller.navigationRailUseIndicator,
              title: const Text('Opacity'),
              value: controller.navigationRailIndicatorOpacity,
              onChanged: controller.setNavigationRailIndicatorOpacity,
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
            isRow: isRow,
          );
        }),
        const Divider(),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              enabled: enableControl,
              title: const Text('Selected label size'),
              value: controller.navigationRailSelectedLabelSize,
              onChanged: controller.setNavigationRailSelectedLabelSize,
              min: 10,
              max: 26,
              divisions: 16,
              valueHeading: 'SIZE',
              valueUnitLabel: ' pt',
              valueDecimalPlaces: 0,
              valueDefaultLabel: '12 pt',
            ),
            lastWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              enabled: enableControl,
              title: const Text('Unselected size'),
              value: controller.navigationRailUnselectedLabelSize,
              onChanged: controller.setNavigationRailUnselectedLabelSize,
              min: 8,
              max: 26,
              divisions: 20,
              valueHeading: 'SIZE',
              valueUnitLabel: ' pt',
              valueDecimalPlaces: 0,
              valueDefaultLabel: controller.navigationRailSelectedLabelSize !=
                      null
                  // ignore: lines_longer_than_80_chars
                  ? '${(controller.navigationRailSelectedLabelSize ?? 12).toStringAsFixed(0)} pt'
                  : '12 pt',
              valueDefaultDisabledLabel: '12 pt',
            ),
            isRow: isRow,
          );
        }),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              enabled: enableControl,
              title: const Text('Selected icon size'),
              value: controller.navigationRailSelectedIconSize,
              onChanged: controller.setNavigationRailSelectedIconSize,
              min: 14,
              max: 50,
              divisions: 36,
              valueHeading: 'SIZE',
              valueUnitLabel: ' dp',
              valueDecimalPlaces: 0,
              valueDefaultLabel: '24 dp',
            ),
            lastWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              enabled: enableControl,
              title: const Text('Unselected size'),
              value: controller.navigationRailUnselectedIconSize,
              onChanged: controller.setNavigationRailUnselectedIconSize,
              min: 14,
              max: 50,
              divisions: 36,
              valueHeading: 'SIZE',
              valueUnitLabel: ' dp',
              valueDecimalPlaces: 0,
              valueDefaultLabel: controller.navigationRailSelectedIconSize !=
                      null
                  // ignore: lines_longer_than_80_chars
                  ? '${(controller.navigationRailSelectedIconSize ?? 24).toStringAsFixed(0)} dp'
                  : '24 dp',
              valueDefaultDisabledLabel: '24 dp',
            ),
            isRow: isRow,
          );
        }),
        const Divider(),
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
              height: 850,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ColorSchemePopupMenu(
                    enabled: enableControl,
                    title: const Text('Selected icon color'),
                    defaultLabel:
                        controller.navigationRailIndicatorSchemeColor == null
                            ? 'onSecondaryContainer'
                            : SchemeColor
                                .values[FlexSubThemes.onSchemeColor(controller
                                        .navigationRailIndicatorSchemeColor!)
                                    .index]
                                .name,
                    defaultDisabledLabel: 'onSecondaryContainer',
                    defaultDisabledLabelM2: 'primary',
                    value: controller.navigationRailSelectedIconSchemeColor,
                    onChanged:
                        controller.setNavigationRailSelectedIconSchemeColor,
                  ),
                  ColorSchemePopupMenu(
                    enabled: enableControl,
                    title: const Text('Selected label color'),
                    defaultLabel:
                        controller.navigationRailBackgroundSchemeColor == null
                            ? 'onSurface'
                            : SchemeColor
                                .values[FlexSubThemes.onSchemeColor(controller
                                        .navigationRailBackgroundSchemeColor!)
                                    .index]
                                .name,
                    defaultDisabledLabel: 'onSurface',
                    defaultDisabledLabelM2: 'primary',
                    value: controller.navigationRailSelectedLabelSchemeColor,
                    onChanged:
                        controller.setNavigationRailSelectedLabelSchemeColor,
                  ),
                  ColorSchemePopupMenu(
                    enabled: enableControl,
                    title: const Text('Unselected item color'),
                    subtitle:
                        const Text('Label and icon, but own properties in API'),
                    defaultLabel: controller
                                .navigationRailBackgroundSchemeColor ==
                            null
                        ? 'onSurfaceVariant'
                        : SchemeColor
                            .values[FlexSubThemes.onSchemeColor(
                                    controller
                                        .navigationRailBackgroundSchemeColor!,
                                    useOnSurfaceVariant: true)
                                .index]
                            .name,
                    defaultDisabledLabel: 'onSurfaceVariant',
                    defaultDisabledLabelM2: 'onSurface with 64% opacity',
                    value: controller.navigationRailUnselectedItemSchemeColor,
                    onChanged:
                        controller.setNavigationRailUnselectedItemSchemeColor,
                  ),
                  SwitchListTileReveal(
                    enabled: enableControl,
                    title: const Text('Mute unselected items'),
                    subtitleReveal: const Text(
                        'Unselected icon and text are less bright. Shared '
                        'setting for icon and text, but separate properties '
                        'in API.\n'),
                    value: enableControl
                        ? controller.navigationRailMuteUnselectedItem
                        : !enableControl,
                    onChanged: enableControl
                        ? controller.setNavigationRailMuteUnselectedItem
                        : null,
                  ),
                  const Divider(),
                  SliderListTileReveal(
                    enabled: enableControl,
                    title: const Text('Rail width'),
                    value: controller.navigationRailMinWidth,
                    onChanged: controller.setNavigationRailMinWidth,
                    min: 72,
                    max: 150,
                    divisions: 78,
                    valueHeading: 'WIDTH',
                    valueUnitLabel: ' dp',
                    valueDecimalPlaces: 0,
                    valueDefaultLabel: useMaterial3 ? '80 dp' : '72 dp',
                  ),
                  SliderListTileReveal(
                    enabled: enableControl,
                    title: const Text('Rail expanded width'),
                    value: controller.navigationRailMinExtendedWidth,
                    onChanged: controller.setNavigationRailMinExtendedWidth,
                    min: 200,
                    max: 400,
                    divisions: 200,
                    valueHeading: 'WIDTH',
                    valueUnitLabel: ' dp',
                    valueDecimalPlaces: 0,
                    valueDefaultLabel: '256 dp',
                  ),
                  SliderListTileReveal(
                    enabled: enableControl,
                    title: const Text('Alignment'),
                    subtitleReveal: const Text(
                      'Vertical alignment for the item. The items are grouped '
                      'together with the trailing widget, between the leading '
                      'widget and the bottom of the rail. If alignment is '
                      '-1.0, then the items are aligned to the top. If '
                      'alignment is 0.0, then the items are aligned to '
                      'the center. If alignment is 1.0, then the items are '
                      'aligned to the bottom.\n',
                    ),
                    value: controller.navigationRailGroupAlignment,
                    onChanged: controller.setNavigationRailGroupAlignment,
                    min: -1,
                    max: 1,
                    divisions: 40,
                    valueHeading: 'ALIGN',
                    valueDecimalPlaces: 2,
                    valueDefaultLabel: '-1',
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
