import 'dart:math' as math;

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/switch_list_tile_adaptive.dart';
import '../../../../shared/widgets/universal/theme_showcase.dart';
import '../../shared/color_scheme_popup_menu.dart';

class FabToggleChipPopupSettings extends StatelessWidget {
  const FabToggleChipPopupSettings(this.controller, {super.key});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final String fabRadiusDefaultLabel = controller.fabBorderRadius == null &&
            controller.defaultRadius == null
        ? 'default 16'
        : controller.fabBorderRadius == null && controller.defaultRadius != null
            ? 'global ${controller.defaultRadius!.toStringAsFixed(0)}'
            : '';
    final String toggleButtonRadiusDefaultLabel =
        controller.toggleButtonsBorderRadius == null &&
                controller.defaultRadius == null
            ? 'default 20'
            : controller.toggleButtonsBorderRadius == null &&
                    controller.defaultRadius != null
                ? 'global ${controller.defaultRadius!.toStringAsFixed(0)}'
                : '';
    final String chipRadiusDefaultLabel =
        controller.chipBorderRadius == null && controller.defaultRadius == null
            ? 'default 8'
            : controller.chipBorderRadius == null &&
                    controller.defaultRadius != null
                ? 'global ${controller.defaultRadius!.toStringAsFixed(0)}'
                : '';

    final double popupEffectiveRadius = controller.popupMenuBorderRadius ??
        math.min(controller.defaultRadius ?? 4.0, 10.0);
    final String popupMenuDefaultLabel =
        controller.popupMenuBorderRadius == null &&
                controller.defaultRadius == null
            ? 'default 4'
            : controller.popupMenuBorderRadius == null &&
                    controller.defaultRadius != null
                ? 'global ${popupEffectiveRadius.toStringAsFixed(0)}'
                : '';
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
          labelForDefault: controller.useMaterial3
              ? 'default (primaryContainer)'
              : 'default (secondary)',
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
          title: const Text('Use themed shape'),
          subtitle: const Text('OFF removes shape usage, making it use default '
              'style, regardless of global border radius setting or own radius '
              'setting. It is like "useFlutterDefaults", but only for the FAB'),
          value: controller.fabUseShape &&
              controller.useSubThemes &&
              controller.useFlexColorScheme,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? controller.setFabUseShape
              : null,
        ),
        ListTile(
          enabled: controller.useSubThemes &&
              controller.useFlexColorScheme &&
              controller.fabUseShape,
          title: const Text('Border radius'),
          subtitle: Slider.adaptive(
            min: -1,
            max: 60,
            divisions: 61,
            label: controller.useSubThemes &&
                    controller.useFlexColorScheme &&
                    controller.fabUseShape
                ? controller.fabBorderRadius == null ||
                        (controller.fabBorderRadius ?? -1) < 0
                    ? fabRadiusDefaultLabel
                    : (controller.fabBorderRadius?.toStringAsFixed(0) ?? '')
                : controller.useMaterial3
                    ? 'M3 rounded'
                    : 'circular',
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
                  controller.useSubThemes &&
                          controller.useFlexColorScheme &&
                          controller.fabUseShape
                      ? controller.fabBorderRadius == null ||
                              (controller.fabBorderRadius ?? -1) < 0
                          ? fabRadiusDefaultLabel
                          : (controller.fabBorderRadius?.toStringAsFixed(0) ??
                              '')
                      : controller.useMaterial3
                          ? 'M3 rounded'
                          : 'circular',
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
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: FabShowcase(),
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
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Border radius'),
          subtitle: Slider.adaptive(
            min: -1,
            max: 40,
            divisions: 41,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.toggleButtonsBorderRadius == null ||
                        (controller.toggleButtonsBorderRadius ?? -1) < 0
                    ? toggleButtonRadiusDefaultLabel
                    : (controller.toggleButtonsBorderRadius
                            ?.toStringAsFixed(0) ??
                        '')
                : 'default 0',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.toggleButtonsBorderRadius ?? -1
                : -1,
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
                          ? toggleButtonRadiusDefaultLabel
                          : (controller.toggleButtonsBorderRadius
                                  ?.toStringAsFixed(0) ??
                              '')
                      : 'default 0',
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
          padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: ToggleButtonsShowcase(),
        ),
        const Divider(),
        ColorSchemePopupMenu(
          title: const Text('Chip color base'),
          labelForDefault: controller.useMaterial3
              ? 'default M3 (secondary container)'
              : 'default (primary with opacity)',
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
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Border radius'),
          subtitle: Slider.adaptive(
            min: -1,
            max: 40,
            divisions: 41,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.chipBorderRadius == null ||
                        (controller.chipBorderRadius ?? -1) < 0
                    ? chipRadiusDefaultLabel
                    : (controller.chipBorderRadius?.toStringAsFixed(0) ?? '')
                : controller.useMaterial3
                    ? 'default 8'
                    : 'stadium',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.chipBorderRadius ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setChipBorderRadius(value < 0 ? null : value);
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
                      ? controller.chipBorderRadius == null ||
                              (controller.chipBorderRadius ?? -1) < 0
                          ? chipRadiusDefaultLabel
                          : (controller.chipBorderRadius?.toStringAsFixed(0) ??
                              '')
                      : controller.useMaterial3
                          ? 'default 8'
                          : 'stadium',
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
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Border radius, follows global to max 10'),
          subtitle: Slider.adaptive(
            min: -1,
            max: 12,
            divisions: 13,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.popupMenuBorderRadius == null ||
                        (controller.popupMenuBorderRadius ?? -1) < 0
                    ? popupMenuDefaultLabel
                    : (controller.popupMenuBorderRadius?.toStringAsFixed(0) ??
                        '')
                : 'default 4',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.popupMenuBorderRadius ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller
                        .setPopupMenuBorderRadius(value < 0 ? null : value);
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
                      ? controller.popupMenuBorderRadius == null ||
                              (controller.popupMenuBorderRadius ?? -1) < 0
                          ? popupMenuDefaultLabel
                          : (controller.popupMenuBorderRadius
                                  ?.toStringAsFixed(0) ??
                              '')
                      : 'default 4',
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
          // The button used in the PopupMenuShowcase to open the PopupMenu
          // is not a native widget, only the menu is, and it is the one that
          // is themed.
          child: PopupMenuShowcase(),
        ),
        const Divider(),
        const ListTile(
          title: Text('IconButton, CircleAvatar, DropdownButton and Tooltip'),
          subtitle: Text('Included to show their effective themed style'),
        ),
        SwitchListTileAdaptive(
          title: const Text(
            'Tooltip background brightness',
          ),
          subtitle: const Text(
            'OFF theme mode inverted, common on Web\n'
            'ON theme mode brightness, like Windows',
          ),
          value: controller.tooltipsMatchBackground &&
              controller.useFlexColorScheme,
          onChanged: controller.useFlexColorScheme
              ? controller.setTooltipsMatchBackground
              : null,
        ),
        const Padding(
          padding: EdgeInsets.all(16),
          child: IconButtonCircleAvatarDropdownTooltipShowcase(),
        ),
      ],
    );
  }
}
