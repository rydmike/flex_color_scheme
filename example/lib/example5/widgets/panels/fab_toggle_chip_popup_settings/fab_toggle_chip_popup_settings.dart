import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/switch_list_tile_adaptive.dart';
import '../../../../shared/widgets/universal/theme_showcase.dart';
import '../../shared/color_scheme_popup_menu.dart';

class FabToggleChipPopupSettings extends StatelessWidget {
  const FabToggleChipPopupSettings(this.controller, {Key? key})
      : super(key: key);
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final double popupOpacity =
        controller.useSubThemes && controller.useFlexColorScheme
            ? controller.popupMenuOpacity
            : 1;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        ColorSchemePopupMenu(
          title: const Text('FloatingActionButton color'),
          labelForDefault: 'null (secondary)',
          index: controller.fabSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setFabSchemeColor(null);
                  } else {
                    controller.setFabSchemeColor(SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        SwitchListTileAdaptive(
          title: const Text('Use themed Shape on FloatingActionButton'),
          subtitle: const Text('OFF removes Shape usage, making it use default '
              'style, regardless of global border radius setting or own radius '
              'setting. It is like "useFlutterDefaults", but only for the FAB'),
          value: controller.fabUseShape &&
              controller.useSubThemes &&
              controller.useFlexColorScheme,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? controller.setFabUseShape
              : null,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: FabShowcase(),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('FloatingActionButton border radius'),
          subtitle: Slider.adaptive(
            min: -1,
            max: 40,
            divisions: 41,
            label: controller.fabBorderRadius == null ||
                    (controller.fabBorderRadius ?? -1) < 0 ||
                    !controller.fabUseShape ||
                    !controller.useSubThemes ||
                    !controller.useFlexColorScheme
                ? 'default'
                : (controller.fabBorderRadius?.toStringAsFixed(0) ?? ''),
            value: controller.useSubThemes &&
                    controller.useFlexColorScheme &&
                    controller.fabUseShape
                ? controller.fabBorderRadius ?? -1
                : -1,
            onChanged: controller.useSubThemes &&
                    controller.useFlexColorScheme &&
                    controller.fabUseShape
                ? (double value) {
                    controller.setFabBorderRadius(value < 0 ? null : value);
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'RADIUS',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.fabBorderRadius == null ||
                              (controller.fabBorderRadius ?? -1) < 0 ||
                              !controller.fabUseShape
                          ? 'default'
                          : (controller.fabBorderRadius?.toStringAsFixed(0) ??
                              '')
                      : 'default',
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const Divider(),
        ColorSchemePopupMenu(
          title: const Text('ToggleButtons color'),
          index: controller.toggleButtonsSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setToggleButtonsSchemeColor(null);
                  } else {
                    controller
                        .setToggleButtonsSchemeColor(SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: ToggleButtonsShowcase(),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('ToggleButtons border radius'),
          subtitle: Slider.adaptive(
            min: -1,
            max: 40,
            divisions: 41,
            label: controller.toggleButtonsBorderRadius == null ||
                    (controller.toggleButtonsBorderRadius ?? -1) < 0
                ? 'default'
                : (controller.toggleButtonsBorderRadius?.toStringAsFixed(0) ??
                    ''),
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.toggleButtonsBorderRadius ?? -1
                : 0,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller
                        .setToggleButtonsBorderRadius(value < 0 ? null : value);
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'RADIUS',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.toggleButtonsBorderRadius == null ||
                              (controller.toggleButtonsBorderRadius ?? -1) < 0
                          ? 'default'
                          : (controller.toggleButtonsBorderRadius
                                  ?.toStringAsFixed(0) ??
                              '')
                      : '0',
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const Divider(),
        ColorSchemePopupMenu(
          title: const Text('Chip color'),
          index: controller.chipSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setChipSchemeColor(null);
                  } else {
                    controller.setChipSchemeColor(SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
          child: ChipShowcase(),
        ),
        const Divider(),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('PopupMenu opacity'),
          subtitle: Slider.adaptive(
            max: 100,
            divisions: 100,
            label: (popupOpacity * 100).toStringAsFixed(0),
            value: popupOpacity * 100,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setPopupMenuOpacity(value / 100);
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
                  '${(popupOpacity * 100).toStringAsFixed(0)} %',
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: PopupDropdownButtonsShowcase(),
        ),
        const Divider(),
        const Padding(
          padding: EdgeInsets.all(16),
          child: CircleAvatarAndTooltipShowcase(),
        ),
      ],
    );
  }
}
