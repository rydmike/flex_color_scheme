import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/theme_showcase.dart';
import '../../shared/color_scheme_popup_menu.dart';

class DrawerSettings extends StatelessWidget {
  const DrawerSettings(this.controller, {super.key});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;

    final String drawerRadiusDefaultLabel =
        controller.drawerBorderRadius == null &&
                controller.defaultRadius == null
            ? 'default 16'
            : controller.drawerBorderRadius == null &&
                    controller.defaultRadius != null
                ? 'global ${controller.defaultRadius!.toStringAsFixed(0)}'
                : '';
    return Column(
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTile(
          title: Text('Themed Drawer and NavigationDrawer'),
          subtitle: Text('Flutter SDK default background is '
              'colorScheme.background for Drawer in M2, but '
              'colorScheme.surface in M3. FlexColorScheme component '
              'sub-themes use surface as default for both modes.'),
        ),
        ColorSchemePopupMenu(
          title: const Text('Background color'),
          labelForDefault: controller.useFlexColorScheme
              ? 'default (surface)'
              : useMaterial3
                  ? 'default (surface)'
                  : 'default (background)',
          index: controller.drawerBackgroundSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setDrawerBackgroundSchemeColor(null);
                  } else {
                    controller.setDrawerBackgroundSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Border radius'),
          subtitle: Slider(
            min: -1,
            max: 50,
            divisions: 51,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.drawerBorderRadius == null ||
                        (controller.drawerBorderRadius ?? -1) < 0
                    ? drawerRadiusDefaultLabel
                    : (controller.drawerBorderRadius?.toStringAsFixed(0) ?? '')
                : controller.useMaterial3
                    ? 'default 16'
                    : 'default 0',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.drawerBorderRadius ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setDrawerBorderRadius(
                        value < 0 ? null : value.roundToDouble());
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
                      ? controller.drawerBorderRadius == null ||
                              (controller.drawerBorderRadius ?? -1) < 0
                          ? drawerRadiusDefaultLabel
                          : (controller.drawerBorderRadius
                                  ?.toStringAsFixed(0) ??
                              '')
                      : controller.useMaterial3
                          ? 'default 16'
                          : 'default 0',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
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
            max: 20,
            divisions: 21,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.drawerElevation == null ||
                        (controller.drawerElevation ?? -1) < 0
                    ? useMaterial3
                        ? 'default 1'
                        : 'default 16'
                    : (controller.drawerElevation?.toStringAsFixed(0) ?? '')
                : useMaterial3
                    ? 'default 1'
                    : 'default 16',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.drawerElevation ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setDrawerElevation(
                        value < 0 ? null : value.roundToDouble());
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'ELEV',
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.drawerElevation == null ||
                              (controller.drawerElevation ?? -1) < 0
                          ? useMaterial3
                              ? 'default 1'
                              : 'default 16'
                          : (controller.drawerElevation?.toStringAsFixed(0) ??
                              '')
                      : useMaterial3
                          ? 'default 1'
                          : 'default 16',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const Divider(),
        const DrawerShowcase(),
        const SizedBox(height: 16),
        const NavigationDrawerShowcase(),
        const SizedBox(height: 32),
      ],
    );
  }
}
