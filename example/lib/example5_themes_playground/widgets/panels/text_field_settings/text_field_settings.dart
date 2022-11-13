import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/theme_showcase.dart';
import '../../shared/color_scheme_popup_menu.dart';

class TextFieldSettings extends StatelessWidget {
  const TextFieldSettings(this.controller, {super.key});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final String thinBorderDefaultLabel =
        controller.inputDecoratorBorderWidth == null &&
                controller.thinBorderWidth == null
            ? 'default 1'
            : controller.inputDecoratorBorderWidth == null &&
                    controller.thinBorderWidth != null
                ? 'global ${controller.thinBorderWidth!.toStringAsFixed(1)}'
                : '';
    final String thickBorderDefaultLabel =
        controller.inputDecoratorFocusedBorderWidth == null &&
                controller.thickBorderWidth == null
            ? 'default 2'
            : controller.inputDecoratorFocusedBorderWidth == null &&
                    controller.thickBorderWidth != null
                ? 'global ${controller.thickBorderWidth!.toStringAsFixed(1)}'
                : '';

    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final String decoratorRadiusDefaultLabel =
        controller.inputDecoratorBorderRadius == null &&
                controller.defaultRadius == null
            ? controller.useMaterial3
                ? 'default 4'
                : 'default 16'
            : controller.inputDecoratorBorderRadius == null &&
                    controller.defaultRadius != null
                ? 'global ${controller.defaultRadius!.toStringAsFixed(0)}'
                : '';

    final bool? isFilled =
        controller.useSubThemes && controller.useFlexColorScheme
            ? controller.inputDecoratorIsFilled
            : null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextInputField(filled: isFilled),
        ),
        if (isLight)
          ColorSchemePopupMenu(
            title: const Text('Light theme TextField color base'),
            index: controller.inputDecoratorSchemeColorLight?.index ?? -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setInputDecoratorSchemeColorLight(null);
                    } else {
                      controller.setInputDecoratorSchemeColorLight(
                          SchemeColor.values[index]);
                    }
                  }
                : null,
          )
        else
          ColorSchemePopupMenu(
            title: const Text('Dark theme TextField color base'),
            index: controller.inputDecoratorSchemeColorDark?.index ?? -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setInputDecoratorSchemeColorDark(null);
                    } else {
                      controller.setInputDecoratorSchemeColorDark(
                          SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
        SwitchListTile(
          title: const Text(
            'TextField has fill color',
          ),
          value: controller.inputDecoratorIsFilled &&
              controller.useSubThemes &&
              controller.useFlexColorScheme,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? controller.setInputDecoratorIsFilled
              : null,
        ),
        SwitchListTile(
          title: const Text(
            'Border style',
          ),
          subtitle: const Text(
            'ON for outline | OFF for underline',
          ),
          value: controller.inputDecoratorBorderType ==
                  FlexInputBorderType.outline &&
              controller.useSubThemes &&
              controller.useFlexColorScheme,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (bool isOn) {
                  if (isOn) {
                    controller.setInputDecoratorBorderType(
                        FlexInputBorderType.outline);
                  } else {
                    controller.setInputDecoratorBorderType(
                        FlexInputBorderType.underline);
                  }
                }
              : null,
        ),
        // TODO(rydmike): Report Flutter bug on UnderlineInputBorder.
        // When using UnderlineInputBorder the border radius does not update
        // when ThemeData has changed to a new version with different
        // underline input border radius. This is because UnderlineInputBorder
        // does not implement correctly where as OutlineInputBorder does.
        // Issue is here:
        // https://github.com/flutter/flutter/blob/0b97874895eb3e14c1cf0e65bd7fca3a17c62b02/packages/flutter/lib/src/material/input_border.dart#L244
        // It needs border radius as a part of its equality and hashcode.
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Border radius'),
          subtitle: Slider(
            min: -1,
            max: 40,
            divisions: 41,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.inputDecoratorBorderRadius == null ||
                        (controller.inputDecoratorBorderRadius ?? -1) < 0
                    ? decoratorRadiusDefaultLabel
                    : (controller.inputDecoratorBorderRadius
                            ?.toStringAsFixed(0) ??
                        '')
                : 'default 4',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.inputDecoratorBorderRadius ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setInputDecoratorBorderRadius(
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
                      ? controller.inputDecoratorBorderRadius == null ||
                              (controller.inputDecoratorBorderRadius ?? -1) < 0
                          ? decoratorRadiusDefaultLabel
                          : (controller.inputDecoratorBorderRadius
                                  ?.toStringAsFixed(0) ??
                              '')
                      : 'default 4',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        SwitchListTile(
          title: const Text('Unfocused field has a border'),
          value: controller.inputDecoratorUnfocusedHasBorder &&
              controller.useSubThemes &&
              controller.useFlexColorScheme,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? controller.setInputDecoratorUnfocusedHasBorder
              : null,
        ),
        SwitchListTile(
          title: const Text('Unfocused border is colored'),
          value: controller.inputDecoratorUnfocusedBorderIsColored &&
              controller.inputDecoratorUnfocusedHasBorder &&
              controller.useSubThemes &&
              controller.useFlexColorScheme,
          onChanged: controller.useSubThemes &&
                  controller.inputDecoratorUnfocusedHasBorder &&
                  controller.useFlexColorScheme
              ? controller.setInputDecoratorUnfocusedBorderIsColored
              : null,
        ),
        ListTile(
          title: const Text('Unfocused border width'),
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          subtitle: Slider(
            min: 0,
            max: 5,
            divisions: 10,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.inputDecoratorBorderWidth == null ||
                        (controller.inputDecoratorBorderWidth ?? 0) <= 0
                    ? thinBorderDefaultLabel
                    : (controller.inputDecoratorBorderWidth
                            ?.toStringAsFixed(1) ??
                        '')
                : 'default 1',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.inputDecoratorBorderWidth ?? 0
                : 0,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setInputDecoratorBorderWidth(
                        value <= 0 ? null : value);
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
                      ? controller.inputDecoratorBorderWidth == null ||
                              (controller.inputDecoratorBorderWidth ?? 0) <= 0
                          ? thinBorderDefaultLabel
                          : (controller.inputDecoratorBorderWidth
                                  ?.toStringAsFixed(1) ??
                              '')
                      : 'default 1',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Focused border width'),
          subtitle: Slider(
            min: 0,
            max: 5,
            divisions: 10,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.inputDecoratorFocusedBorderWidth == null ||
                        (controller.inputDecoratorFocusedBorderWidth ?? 0) <= 0
                    ? thickBorderDefaultLabel
                    : (controller.inputDecoratorFocusedBorderWidth
                            ?.toStringAsFixed(1) ??
                        '')
                : 'default 2',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.inputDecoratorFocusedBorderWidth ?? 0
                : 0,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setInputDecoratorFocusedBorderWidth(
                        value <= 0 ? null : value);
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
                      ? controller.inputDecoratorFocusedBorderWidth == null ||
                              (controller.inputDecoratorFocusedBorderWidth ??
                                      0) <=
                                  0
                          ? thickBorderDefaultLabel
                          : (controller.inputDecoratorFocusedBorderWidth
                                  ?.toStringAsFixed(1) ??
                              '')
                      : 'default 2',
                  style: theme.textTheme.bodySmall!
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
