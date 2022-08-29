import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/theme_showcase.dart';
import '../../shared/color_scheme_popup_menu.dart';

// Settings for the standard Material buttons.
class ButtonsSettings extends StatelessWidget {
  const ButtonsSettings(
    this.controller, {
    super.key,
  });
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final String elevatedButtonRadiusDefaultLabel =
        controller.elevatedButtonBorderRadius == null &&
                controller.defaultRadius == null
            ? controller.useMaterial3
                ? 'default stadium'
                : 'default 20'
            : controller.elevatedButtonBorderRadius == null &&
                    controller.defaultRadius != null
                ? 'global ${controller.defaultRadius!.toStringAsFixed(0)}'
                : '';
    final String outlinedButtonRadiusDefaultLabel =
        controller.outlinedButtonBorderRadius == null &&
                controller.defaultRadius == null
            ? controller.useMaterial3
                ? 'default stadium'
                : 'default 20'
            : controller.outlinedButtonBorderRadius == null &&
                    controller.defaultRadius != null
                ? 'global ${controller.defaultRadius!.toStringAsFixed(0)}'
                : '';
    final String textButtonRadiusDefaultLabel =
        controller.textButtonBorderRadius == null &&
                controller.defaultRadius == null
            ? controller.useMaterial3
                ? 'default stadium'
                : 'default 20'
            : controller.textButtonBorderRadius == null &&
                    controller.defaultRadius != null
                ? 'global ${controller.defaultRadius!.toStringAsFixed(0)}'
                : '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ElevatedButtonShowcase(),
        ),
        ColorSchemePopupMenu(
          title: const Text('ElevatedButton main color'),
          subtitle: controller.useMaterial3
              ? const Text('Foreground color')
              : const Text('Background color'),
          index: controller.elevatedButtonSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setElevatedButtonSchemeColor(null);
                  } else {
                    controller.setElevatedButtonSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ColorSchemePopupMenu(
          title: const Text('ElevatedButton secondary color'),
          subtitle: controller.useMaterial3
              ? const Text('Background color')
              : const Text('Foreground color'),
          labelForDefault: controller.useMaterial3
              ? 'default (surface)'
              : 'default (onPrimary)',
          index: controller.elevatedButtonSecondarySchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setElevatedButtonSecondarySchemeColor(null);
                  } else {
                    controller.setElevatedButtonSecondarySchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('ElevatedButton border radius'),
          subtitle: Slider.adaptive(
            min: -1,
            max: 40,
            divisions: 41,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.elevatedButtonBorderRadius == null ||
                        (controller.elevatedButtonBorderRadius ?? -1) < 0
                    ? elevatedButtonRadiusDefaultLabel
                    : (controller.elevatedButtonBorderRadius
                            ?.toStringAsFixed(0) ??
                        '')
                : controller.useMaterial3
                    ? 'default stadium'
                    : 'default 4',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.elevatedButtonBorderRadius ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setElevatedButtonBorderRadius(
                        value < 0 ? null : value);
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
                      ? controller.elevatedButtonBorderRadius == null ||
                              (controller.elevatedButtonBorderRadius ?? -1) < 0
                          ? elevatedButtonRadiusDefaultLabel
                          : (controller.elevatedButtonBorderRadius
                                  ?.toStringAsFixed(0) ??
                              '')
                      : controller.useMaterial3
                          ? 'default stadium'
                          : 'default 4',
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
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: OutlinedButtonShowcase(),
        ),
        ColorSchemePopupMenu(
          title: const Text('OutlinedButton foreground color'),
          index: controller.outlinedButtonSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setOutlinedButtonSchemeColor(null);
                  } else {
                    controller.setOutlinedButtonSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ColorSchemePopupMenu(
          title: const Text('OutlinedButton outline color'),
          labelForDefault: controller.useMaterial3
              ? 'default (outline)'
              : controller.useSubThemes && controller.useFlexColorScheme
                  ? 'default (primary)'
                  : 'default (onSurface opacity 0.12)',
          index: controller.outlinedButtonOutlineSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setOutlinedButtonOutlineSchemeColor(null);
                  } else {
                    controller.setOutlinedButtonOutlineSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('OutlinedButton border radius'),
          subtitle: Slider.adaptive(
            min: -1,
            max: 40,
            divisions: 41,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.outlinedButtonBorderRadius == null ||
                        (controller.outlinedButtonBorderRadius ?? -1) < 0
                    ? outlinedButtonRadiusDefaultLabel
                    : (controller.outlinedButtonBorderRadius
                            ?.toStringAsFixed(0) ??
                        '')
                : controller.useMaterial3
                    ? 'default stadium'
                    : 'default 4',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.outlinedButtonBorderRadius ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setOutlinedButtonBorderRadius(
                        value < 0 ? null : value);
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
                      ? controller.outlinedButtonBorderRadius == null ||
                              (controller.outlinedButtonBorderRadius ?? -1) < 0
                          ? outlinedButtonRadiusDefaultLabel
                          : (controller.outlinedButtonBorderRadius
                                  ?.toStringAsFixed(0) ??
                              '')
                      : controller.useMaterial3
                          ? 'default stadium'
                          : 'default 4',
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
          title: const Text('Normal border width'),
          subtitle: const Text('Setting shared with unfocused TextField and '
              'ToggleButtons'),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: Slider.adaptive(
            min: -0.5,
            max: 5,
            divisions: 11,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.thinBorderWidth == null ||
                        (controller.thinBorderWidth ?? -0.5) < 0
                    ? controller.useMaterial3
                        ? 'default 1'
                        : 'default 1.5'
                    : (controller.thinBorderWidth?.toStringAsFixed(1) ?? '')
                : 'default 1',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.thinBorderWidth ?? -0.5
                : -0.5,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setThinBorderWidth(value < 0 ? null : value);
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
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.thinBorderWidth == null ||
                              (controller.thinBorderWidth ?? -0.5) < 0
                          ? controller.useMaterial3
                              ? 'default 1'
                              : 'default 1.5'
                          : (controller.thinBorderWidth?.toStringAsFixed(1) ??
                              '')
                      : 'default 1',
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
          title: const Text('Pressed border width'),
          subtitle: const Text('Setting shared with focused TextField'),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: Slider.adaptive(
            min: -0.5,
            max: 5,
            divisions: 11,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.thickBorderWidth == null ||
                        (controller.thickBorderWidth ?? -0.5) < 0
                    ? controller.useMaterial3
                        ? 'default 1'
                        : 'default 2'
                    : (controller.thickBorderWidth?.toStringAsFixed(1) ?? '')
                : controller.useMaterial3
                    ? 'default 1'
                    : 'default 2',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.thickBorderWidth ?? -0.5
                : -0.5,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setThickBorderWidth(value < 0 ? null : value);
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
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.thickBorderWidth == null ||
                              (controller.thickBorderWidth ?? -0.5) < 0
                          ? controller.useMaterial3
                              ? 'default 1'
                              : 'default 2'
                          : (controller.thickBorderWidth?.toStringAsFixed(1) ??
                              '')
                      : controller.useMaterial3
                          ? 'default 1'
                          : 'default 2',
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
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: TextButtonShowcase(),
        ),
        ColorSchemePopupMenu(
          title: const Text('TextButton color'),
          index: controller.textButtonSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setTextButtonSchemeColor(null);
                  } else {
                    controller
                        .setTextButtonSchemeColor(SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('TextButton border radius'),
          subtitle: Slider.adaptive(
            min: -1,
            max: 40,
            divisions: 41,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.textButtonBorderRadius == null ||
                        (controller.textButtonBorderRadius ?? -1) < 0
                    ? textButtonRadiusDefaultLabel
                    : (controller.textButtonBorderRadius?.toStringAsFixed(0) ??
                        '')
                : controller.useMaterial3
                    ? 'default stadium'
                    : 'default 4',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.textButtonBorderRadius ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller
                        .setTextButtonBorderRadius(value < 0 ? null : value);
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
                      ? controller.textButtonBorderRadius == null ||
                              (controller.textButtonBorderRadius ?? -1) < 0
                          ? textButtonRadiusDefaultLabel
                          : (controller.textButtonBorderRadius
                                  ?.toStringAsFixed(0) ??
                              '')
                      : controller.useMaterial3
                          ? 'default stadium'
                          : 'default 4',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
