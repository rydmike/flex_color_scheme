import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/switch_list_tile_adaptive.dart';
import '../../../../shared/widgets/universal/theme_showcase.dart';
import '../../shared/color_scheme_popup_menu.dart';

class FabChipSettings extends StatelessWidget {
  const FabChipSettings(this.controller, {super.key});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final String fabRadiusDefaultLabel = controller.fabBorderRadius == null &&
            controller.defaultRadius == null
        ? 'default 16'
        : controller.fabBorderRadius == null && controller.defaultRadius != null
            ? 'global ${controller.defaultRadius!.toStringAsFixed(0)}'
            : '';

    final String chipRadiusDefaultLabel =
        controller.chipBorderRadius == null && controller.defaultRadius == null
            ? 'default 8'
            : controller.chipBorderRadius == null &&
                    controller.defaultRadius != null
                ? 'global ${controller.defaultRadius!.toStringAsFixed(0)}'
                : '';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: FabShowcase(),
        ),
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
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const Divider(),
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
          child: ChipShowcase(),
        ),
        ColorSchemePopupMenu(
          title: const Text('Chip color base'),
          labelForDefault: controller.useMaterial3
              ? 'default M3 (surface & secondaryContainer)'
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
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
