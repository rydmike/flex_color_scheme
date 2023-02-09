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
    final String drawerIndicatorRadiusDefaultLabel =
        controller.drawerIndicatorBorderRadius == null &&
                controller.defaultRadius == null
            ? 'default stadium'
            : controller.drawerIndicatorBorderRadius == null &&
                    controller.defaultRadius != null
                ? 'global ${controller.defaultRadius!.toStringAsFixed(0)}'
                : '';

    final double derivedIndicatorWidth =
        (controller.drawerWidth ?? (useMaterial3 ? 360 : 304)) - 2 * 12;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTile(
          title: Text('Themed Drawer and NavigationDrawer'),
          subtitle: Text('Flutter SDK default background is '
              'colorScheme.background for Drawer in M2, but '
              'colorScheme.surface in M3. FlexColorScheme component '
              'sub-themes use surface as default for both modes. The '
              'NavigationDrawer will get more quick theming settings, '
              'similar to NavigationRail in a future FCS version.'),
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
          title: const Text('Width'),
          subtitle: Slider(
            min: 199,
            max: 500,
            divisions: 301,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.drawerWidth == null ||
                        (controller.drawerWidth ?? 199) < 200
                    ? useMaterial3
                        ? 'default 360'
                        : 'default 304'
                    : (controller.drawerWidth?.toStringAsFixed(0) ?? '')
                : useMaterial3
                    ? 'default 360'
                    : 'default 304',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.drawerWidth ?? 199
                : 199,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setDrawerWidth(
                        value < 200 ? null : value.roundToDouble());
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'WIDTH',
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.drawerWidth == null ||
                              (controller.drawerWidth ?? 199) < 200
                          ? useMaterial3
                              ? 'default 360'
                              : 'default 304'
                          : (controller.drawerWidth?.toStringAsFixed(0) ?? '')
                      : useMaterial3
                          ? 'default 360'
                          : 'default 304',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
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
                  style: theme.textTheme.bodySmall,
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
                  style: theme.textTheme.bodySmall!
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
        ColorSchemePopupMenu(
          title: const Text('Drawer indicator color'),
          labelForDefault: 'default (secondaryContainer)',
          index: controller.drawerIndicatorSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setDrawerIndicatorSchemeColor(null);
                  } else {
                    controller.setDrawerIndicatorSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Indicator opacity'),
          subtitle: Slider(
            min: -1,
            max: 100,
            divisions: 101,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.drawerIndicatorOpacity == null ||
                        (controller.drawerIndicatorOpacity ?? -1) < 0
                    ? 'default (100%)'
                    : ((controller.drawerIndicatorOpacity! * 100)
                            .toStringAsFixed(0) ??
                        '')
                : 'default (100%)',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.drawerIndicatorOpacity != null
                    ? controller.drawerIndicatorOpacity! * 100
                    : -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setDrawerIndicatorOpacity(
                        value < 0 ? null : value / 100);
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'OPACITY',
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.drawerIndicatorOpacity == null ||
                              (controller.drawerIndicatorOpacity ?? -1) < 0
                          ? 'default (100%)'
                          : ((controller.drawerIndicatorOpacity! * 100)
                                  .toStringAsFixed(0) ??
                              '')
                      : 'default (100%)',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
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
                ? controller.drawerIndicatorBorderRadius == null ||
                        (controller.drawerIndicatorBorderRadius ?? -1) < 0
                    ? drawerIndicatorRadiusDefaultLabel
                    : (controller.drawerIndicatorBorderRadius
                            ?.toStringAsFixed(0) ??
                        '')
                : 'default (stadium)',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.drawerIndicatorBorderRadius ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setDrawerIndicatorBorderRadius(
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
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.drawerIndicatorBorderRadius == null ||
                              (controller.drawerIndicatorBorderRadius ?? -1) < 0
                          ? drawerIndicatorRadiusDefaultLabel
                          : (controller.drawerIndicatorBorderRadius
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
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Indicator width'),
          subtitle: Slider(
            min: 199,
            max: 500,
            divisions: 301,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.drawerIndicatorWidth == null ||
                        (controller.drawerIndicatorWidth ?? 199) < 200
                    ? 'computed $derivedIndicatorWidth'
                    : (controller.drawerIndicatorWidth?.toStringAsFixed(0) ??
                        '')
                : useMaterial3
                    ? 'default ${360 - 2 * 12}'
                    : 'default ${304 - 2 * 12}',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.drawerIndicatorWidth ?? 199
                : 199,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setDrawerIndicatorWidth(
                        value < 200 ? null : value.roundToDouble());
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'WIDTH',
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.drawerIndicatorWidth == null ||
                              (controller.drawerIndicatorWidth ?? 199) < 200
                          ? 'computed $derivedIndicatorWidth'
                          : (controller.drawerIndicatorWidth
                                  ?.toStringAsFixed(0) ??
                              '')
                      : useMaterial3
                          ? 'default ${360 - 2 * 12}'
                          : 'default ${304 - 2 * 12}',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const Divider(),
        const NavigationDrawerShowcase(),
        const SizedBox(height: 16),
        const DrawerShowcase(),
        const SizedBox(height: 32),
      ],
    );
  }
}
