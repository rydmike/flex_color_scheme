import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/model/adaptive_response.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/responsive_two_widgets.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../../../shared/widgets/universal/slider_list_tile_reveal.dart';
import '../../../../shared/widgets/universal/switch_list_tile_reveal.dart';
import '../../../theme/theme_values.dart';
import '../../shared/color_scheme_popup_menu.dart';
import '../../shared/enum_popup_menu.dart';
import '../../shared/test_adaptive_response.dart';
import 'navigation_bar_label_behavior_list_tile.dart';

// Panel used to control the sub-theme for NavigationBar.
class NavigationBarPanel extends StatelessWidget {
  const NavigationBarPanel(this.controller, {super.key});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;
    final bool isLight = theme.brightness == Brightness.light;
    // The most common logic for enabling Playground controls.
    final bool enableControl =
        controller.useSubThemes && controller.useFlexColorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTileReveal(
          title: Text('NavigationBar colors and styles'),
          subtitleReveal: Text(
            'Default background color in Material 2 is surface with an '
            'onSurface overlay elevation color fixed to level 3. '
            'In M3 default background color is surfaceContainer, no '
            'elevation tint is used since Flutter 3.22. FlexColorScheme uses '
            'surfaceContainer as default background color in both '
            'Material-2 and Material-3 mode, since V8, when component themes '
            'are enabled.\n',
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: NavigationBarShowcase(explain: false),
        ),
        const SizedBox(height: 8),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: ColorSchemePopupMenu(
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              enabled: enableControl,
              title: const Text('Background color'),
              defaultLabel: 'surfaceContainer',
              defaultDisabledLabelM2: 'surface with onSurface overlay-3',
              value: controller.navigationBarBackgroundSchemeColor,
              onChanged: controller.setNavigationBarBackgroundSchemeColor,
            ),
            lastWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              enabled: enableControl,
              title: const Text('Opacity'),
              value: controller.navigationBarOpacity,
              onChanged: controller.setNavigationBarOpacity,
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
              value: controller.navigationBarElevation,
              onChanged: controller.setNavigationBarElevation,
              min: 0,
              max: 24,
              divisions: 24,
              valueHeading: 'ELEV',
              valueDecimalPlaces: 0,
              valueDefaultLabel: useMaterial3 ? '3' : '0',
            ),
            lastWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              enabled: enableControl,
              title: const Text('Height'),
              value: controller.navigationBarHeight,
              onChanged: controller.setNavigationBarHeight,
              min: 55,
              max: 100,
              divisions: 45,
              valueHeading: 'HEIGHT',
              valueUnitLabel: ' dp',
              valueDecimalPlaces: 0,
              valueDefaultLabel: '80 dp',
            ),
            isRow: isRow,
          );
        }),
        const Divider(),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: ColorSchemePopupMenu(
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              enabled: enableControl,
              title: const Text('Indicator color'),
              defaultLabel: 'secondaryContainer',
              defaultDisabledLabelM2: 'secondary opacity 24%',
              value: controller.navigationBarIndicatorSchemeColor,
              onChanged: controller.setNavigationBarIndicatorSchemeColor,
            ),
            lastWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              enabled: enableControl,
              title: const Text('Opacity'),
              value: controller.navigationBarIndicatorOpacity,
              onChanged: controller.setNavigationBarIndicatorOpacity,
              min: 0,
              max: 1,
              divisions: 100,
              valueDisplayScale: 100,
              valueDecimalPlaces: 0,
              valueHeading: 'OPACITY',
              valueUnitLabel: ' %',
              valueDefaultLabel: '100 %',
              valueDefaultDisabledLabel: useMaterial3 ? '100 %' : '24 %',
            ),
            isRow: isRow,
          );
        }),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              enabled: enableControl,
              title: const Text('Radius'),
              value: controller.navigationBarIndicatorBorderRadius,
              onChanged: controller.setNavigationBarIndicatorBorderRadius,
              min: 0,
              max: 25,
              divisions: 25,
              valueHeading: 'RADIUS',
              valueUnitLabel: ' dp',
              valueDecimalPlaces: 0,
              valueDefaultLabel: 'stadium',
            ),
            lastWidget: NavigationBarLabelBehaviorListTile(
              controller: controller,
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
            ),
            isRow: isRow,
          );
        }),
        const Divider(),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: ColorSchemePopupMenu(
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              enabled: enableControl,
              title: const Text('Selected icon color'),
              defaultLabel: controller.navigationBarIndicatorSchemeColor == null
                  ? 'onSecondaryContainer'
                  : SchemeColor
                      .values[FlexSubThemes.onSchemeColor(
                              controller.navigationBarIndicatorSchemeColor!)
                          .index]
                      .name,
              defaultDisabledLabelM2: 'onSurface',
              value: controller.navigationBarSelectedIconSchemeColor,
              onChanged: controller.setNavigationBarSelectedIconSchemeColor,
            ),
            lastWidget: ColorSchemePopupMenu(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              enabled: enableControl,
              title: const Text('Selected label color'),
              defaultLabel: controller.navigationBarBackgroundSchemeColor ==
                      null
                  ? 'onSurface'
                  : SchemeColor
                      .values[FlexSubThemes.onSchemeColor(
                              controller.navigationBarBackgroundSchemeColor!)
                          .index]
                      .name,
              defaultDisabledLabel: 'onSurface',
              value: controller.navigationBarSelectedLabelSchemeColor,
              onChanged: controller.setNavigationBarSelectedLabelSchemeColor,
            ),
            isRow: isRow,
          );
        }),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: ColorSchemePopupMenu(
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              enabled: enableControl,
              title: const Text('Unselected item color'),
              subtitle: const Text('Label and icon, but separate API'),
              defaultLabel: controller.navigationBarBackgroundSchemeColor ==
                      null
                  ? 'onSurfaceVariant'
                  : SchemeColor
                      .values[FlexSubThemes.onSchemeColor(
                              controller.navigationBarBackgroundSchemeColor!,
                              useOnSurfaceVariant: true)
                          .index]
                      .name,
              defaultDisabledLabel: 'onSurfaceVariant',
              defaultDisabledLabelM2: 'onSurface',
              value: controller.navigationBarUnselectedItemSchemeColor,
              onChanged: controller.setNavigationBarUnselectedItemSchemeColor,
            ),
            lastWidget: SwitchListTileReveal(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              enabled: enableControl,
              title: const Text('Mute unselected items'),
              subtitleReveal: const Text(
                  'Unselected icon and text are less bright. '
                  'Shared setting for icon and text, but separate properties '
                  'in the API.\n'),
              value: controller.navigationBarMuteUnselectedItem,
              onChanged: controller.setNavigationBarMuteUnselectedItem,
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
              value: controller.navigationBarSelectedLabelSize,
              onChanged: controller.setNavigationBarSelectedLabelSize,
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
              value: controller.navigationBarUnselectedLabelSize,
              onChanged: controller.setNavigationBarUnselectedLabelSize,
              min: 8,
              max: 26,
              divisions: 20,
              valueHeading: 'SIZE',
              valueUnitLabel: ' pt',
              valueDecimalPlaces: 0,
              valueDefaultLabel: controller.navigationBarSelectedLabelSize !=
                      null
                  // ignore: lines_longer_than_80_chars
                  ? '${(controller.navigationBarSelectedLabelSize ?? 12).toStringAsFixed(0)} pt'
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
              value: controller.navigationBarSelectedIconSize,
              onChanged: controller.setNavigationBarSelectedIconSize,
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
              value: controller.navigationBarUnselectedIconSize,
              onChanged: controller.setNavigationBarUnselectedIconSize,
              min: 14,
              max: 50,
              divisions: 36,
              valueHeading: 'SIZE',
              valueUnitLabel: ' dp',
              valueDecimalPlaces: 0,
              valueDefaultLabel: controller.navigationBarSelectedIconSize !=
                      null
                  // ignore: lines_longer_than_80_chars
                  ? '${(controller.navigationBarSelectedIconSize ?? 24).toStringAsFixed(0)} dp'
                  : '24 dp',
              valueDefaultDisabledLabel: '24 dp',
            ),
            isRow: isRow,
          );
        }),
        const Divider(),
        if (isLight)
          EnumPopupMenu<AdaptiveResponse>(
            enabled: enableControl && controller.useMaterial3,
            values: AdaptiveResponse.values,
            title: const Text('Remove elevation tint (obsolete)'),
            subtitleReveal: Text(
              'Platform adaptive theme response to remove elevation tint on '
              'elevated NavigationBar in Material-3 in light theme-mode, on '
              'selected platforms. This setting has no impact in Material-2 '
              'mode.\n'
              '\n'
              'OBSOLETE: In Flutter version 3.22 and later, this feature is '
              'no longer needed, as elevation tints are no longer used. '
              'Keeping it around for now, but it is not useful in Flutter 3.22 '
              'and later.\n'
              '\n'
              // ignore: lines_longer_than_80_chars
              '${controller.adaptiveRemoveNavigationBarTintLight?.describe ?? AdaptiveResponse.off.describe}',
            ),
            value: controller.adaptiveRemoveNavigationBarTintLight,
            onChanged: controller.setAdaptiveRemoveNavigationBarTintLight,
          )
        else
          EnumPopupMenu<AdaptiveResponse>(
            enabled: enableControl && controller.useMaterial3,
            values: AdaptiveResponse.values,
            title: const Text('Remove elevation tint (obsolete)'),
            subtitleReveal: Text(
              'Platform adaptive theme response to remove elevation tint on '
              'elevated NavigationBar in Material-3 in dark theme-mode on '
              'selected platforms. This setting has no impact in Material-2 '
              'mode.\n'
              '\n'
              'OBSOLETE: In Flutter version 3.22 and later, this feature is '
              'no longer needed, as elevation tints are no longer used. '
              'Keeping it around for now, but it is not useful in Flutter 3.22 '
              'and later.\n'
              '\n'
              // ignore: lines_longer_than_80_chars
              '${controller.adaptiveRemoveNavigationBarTintDark?.describe ?? AdaptiveResponse.off.describe}',
            ),
            value: controller.adaptiveRemoveNavigationBarTintDark,
            onChanged: controller.setAdaptiveRemoveNavigationBarTintDark,
          ),
        TestAdaptiveResponse(controller),
        const SizedBox(height: 8),
      ],
    );
  }
}
