import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/responsive_two_widgets.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../../../shared/widgets/universal/slider_list_tile_reveal.dart';
import '../../../theme/theme_values.dart';
import '../../shared/color_scheme_popup_menu.dart';
import 'bottom_bar_mute_unselected_toggle_buttons.dart';

// Panel used to control the sub-theme for BottomNavigationBar.
class BottomNavigationBarPanel extends StatelessWidget {
  const BottomNavigationBarPanel(this.controller, {super.key});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final bool useMaterial3 = theme.useMaterial3;

    // The most common logic for enabling Playground controls.
    final bool enableControl =
        controller.useSubThemes && controller.useFlexColorScheme;

    final String labelForDefaultSelectedItem = isDark &&
            (!controller.useFlexColorScheme ||
                (controller.bottomNavigationBarSelectedItemSchemeColor ==
                        null &&
                    controller.bottomNavigationBarUnselectedItemSchemeColor ==
                        null))
        ? 'secondary'
        : 'primary';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTileReveal(
          title: Text('BottomNavigationBar colors and styles'),
          subtitleReveal: Text(
            'Default SDK background color is theme canvasColor via Material. '
            'The canvasColor is typically colorScheme.background, elevation '
            'is 8. FCS sub-theme default is colorScheme.background and '
            'elevation 0.\n',
          ),
        ),
        Card(
          elevation: 0,
          shadowColor: Colors.transparent,
          color: theme.colorScheme.surfaceContainerHighest,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: BottomNavigationBarShowcase(explain: false),
          ),
        ),
        const SizedBox(height: 8),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: ColorSchemePopupMenu(
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              enabled: enableControl,
              title: const Text('Background color'),
              subtitleReveal: const Text('In Material-2 dark mode, the bottom '
                  'navigation background color gets an elevation overlay, '
                  'making the background color lighter the more it is '
                  'elevated. This is the correct behavior for elevated '
                  'Material surfaces in dark mode in Material-2. This is '
                  'most likely where the now abandoned elevation tint in '
                  'Material-3 got its inspiration.\n'
                  '\n'
                  'The elevation overlay only happens in Material-2 dark '
                  'mode when the `applyElevationOverlayColor` is set to '
                  'true. In vanilla ThemeData is is false by default, you '
                  'are supposed to set it to true when you use Material-2. '
                  'FlexColorScheme sets it to true by default, set it to '
                  'false if you do not want the elevation overlay in '
                  'dark mode.\n'
                  '\n'
                  'Also notice that the elevation overlay is ONLY applied to '
                  'elevated Material surfaces when the background color of '
                  'the Material has a color value that equals '
                  'ColorScheme.surface. For any other color value, the '
                  'elevation overlay is not applied.\n'),
              colorSuffix: isDark &&
                      !useMaterial3 &&
                      controller.bottomNavigationBarBackgroundSchemeColor ==
                          SchemeColor.surface &&
                      controller.bottomNavigationBarElevation != 0
                  ? ', with dark elevation overlay'
                  : '',
              defaultLabel: 'surface',
              defaultLabelDarkM2: controller.bottomNavigationBarElevation != 0
                  ? 'surface, with dark elevation overlay'
                  : 'surface',
              defaultDisabledLabel:
                  !controller.useSubThemes && controller.useFlexColorScheme
                      ? 'surface'
                      : 'ThemeData.canvasColor',
              defaultDisabledLabelDark: 'surface',
              defaultDisabledLabelDarkM2:
                  !controller.useSubThemes && controller.useFlexColorScheme
                      ? 'surface, with dark elevation overlay'
                      : 'ThemeData.canvasColor, with dark elevation overlay',
              value: controller.bottomNavigationBarBackgroundSchemeColor,
              onChanged: controller.setBottomNavigationBarBackgroundSchemeColor,
            ),
            lastWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              enabled: enableControl,
              title: const Text('Opacity'),
              value: controller.bottomNavigationBarOpacity,
              onChanged: controller.setBottomNavigationBarOpacity,
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
            firstWidget: ColorSchemePopupMenu(
              enabled: enableControl,
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              title: const Text('Selected item color'),
              subtitle: const Text('Label and icon, but separate API'),
              defaultLabel: labelForDefaultSelectedItem,
              value: controller.bottomNavigationBarSelectedItemSchemeColor,
              onChanged:
                  controller.setBottomNavigationBarSelectedItemSchemeColor,
            ),
            lastWidget: SliderListTileReveal(
              enabled: enableControl,
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              title: const Text('Elevation'),
              value: controller.bottomNavigationBarElevation,
              onChanged: controller.setBottomNavigationBarElevation,
              min: 0,
              max: 24,
              divisions: 24,
              valueHeading: 'ELEV',
              valueDecimalPlaces: 1,
              valueDefaultLabel: '3',
              valueDefaultDisabledLabel: '8',
            ),
            isRow: isRow,
          );
        }),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: ColorSchemePopupMenu(
              enabled: enableControl,
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              title: const Text('Unselected item color'),
              subtitle: const Text('Label and icon, but separate API'),
              defaultLabel: useMaterial3 ? 'onSurfaceVariant' : 'onSurface',
              value: controller.bottomNavigationBarUnselectedItemSchemeColor,
              onChanged:
                  controller.setBottomNavigationBarUnselectedItemSchemeColor,
            ),
            lastWidget: BottomBarMuteUnselectedToggleButtons(
              controller: controller,
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
            ),
            isRow: isRow,
          );
        }),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: SwitchListTile(
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              title: const Text('Show selected labels'),
              value: enableControl &&
                  controller.bottomNavigationBarShowSelectedLabels,
              onChanged:
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.setBottomNavigationBarShowSelectedLabels
                      : null,
            ),
            lastWidget: SwitchListTile(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              title: const Text('Show unselected labels'),
              value: enableControl &&
                  controller.bottomNavigationBarShowUnselectedLabels,
              onChanged:
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.setBottomNavigationBarShowUnselectedLabels
                      : null,
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
              value: controller.bottomNavigationBarSelectedLabelSize,
              onChanged: controller.setBottomNavigationBarSelectedLabelSize,
              min: 10,
              max: 26,
              divisions: 16,
              valueHeading: 'SIZE',
              valueUnitLabel: ' pt',
              valueDecimalPlaces: 0,
              valueDefaultLabel: '14 pt',
            ),
            lastWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              enabled: enableControl,
              title: const Text('Unselected size'),
              value: controller.bottomNavigationBarUnselectedLabelSize,
              onChanged: controller.setBottomNavigationBarUnselectedLabelSize,
              min: 8,
              max: 26,
              divisions: 20,
              valueHeading: 'SIZE',
              valueUnitLabel: ' pt',
              valueDecimalPlaces: 0,
              valueDefaultLabel: controller
                          .bottomNavigationBarSelectedLabelSize !=
                      null
                  // ignore: lines_longer_than_80_chars
                  ? '${((controller.bottomNavigationBarSelectedLabelSize ?? 12) - 2).toStringAsFixed(0)} pt'
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
              value: controller.bottomNavigationBarSelectedIconSize,
              onChanged: controller.setBottomNavigationBarSelectedIconSize,
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
              value: controller.bottomNavigationBarUnselectedIconSize,
              onChanged: controller.setBottomNavigationBarUnselectedIconSize,
              min: 14,
              max: 50,
              divisions: 36,
              valueHeading: 'SIZE',
              valueUnitLabel: ' dp',
              valueDecimalPlaces: 0,
              valueDefaultLabel: controller
                          .bottomNavigationBarSelectedIconSize !=
                      null
                  // ignore: lines_longer_than_80_chars
                  ? '${(controller.bottomNavigationBarSelectedIconSize ?? 24).toStringAsFixed(0)} dp'
                  : '24 dp',
              valueDefaultDisabledLabel: '24 dp',
            ),
            isRow: isRow,
          );
        }),
      ],
    );
  }
}
