import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/theme_showcase.dart';
import '../../shared/color_scheme_popup_menu.dart';

class ToggleButtonsSettings extends StatelessWidget {
  const ToggleButtonsSettings(this.controller, {super.key});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final String toggleButtonRadiusDefaultLabel =
        controller.toggleButtonsBorderRadius == null &&
                controller.defaultRadius == null
            ? 'default 20'
            : controller.toggleButtonsBorderRadius == null &&
                    controller.defaultRadius != null
                ? 'global ${controller.defaultRadius!.toStringAsFixed(0)}'
                : '';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const ListTile(
          title: Text('ToggleButtons'),
          subtitle: Text('Component themes style and height aligns '
              'ToggleButtons with OutlinedButton and FilledButton'),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: ToggleButtonsShowcase(showOutlinedButton: true),
        ),
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
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Border width'),
          subtitle: const Text('Setting shared with OutlinedButton and '
              'unfocused TextField'),
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
      ],
    );
  }
}
