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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(16),
          child: TextInputField(),
        ),
        if (isLight)
          ColorSchemePopupMenu(
            labelForDefault: controller.useMaterial3
                ? 'default (primary & surfaceVariant)'
                : 'default (primary)',
            title: const Text('Light theme base color'),
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
            title: const Text('Dark theme base color'),
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
          title: const Text('Background has fill color'),
          subtitle: const Text('The base color is used'),
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
          enabled: controller.useSubThemes &&
              controller.useFlexColorScheme &&
              controller.inputDecoratorUnfocusedHasBorder,
          subtitle: Slider(
            min: 0,
            max: 5,
            divisions: 10,
            label: controller.useSubThemes &&
                    controller.useFlexColorScheme &&
                    controller.inputDecoratorUnfocusedHasBorder
                ? controller.inputDecoratorBorderWidth == null ||
                        (controller.inputDecoratorBorderWidth ?? 0) <= 0
                    ? thinBorderDefaultLabel
                    : (controller.inputDecoratorBorderWidth
                            ?.toStringAsFixed(1) ??
                        '')
                : controller.inputDecoratorUnfocusedHasBorder ||
                        !controller.useSubThemes ||
                        !controller.useFlexColorScheme
                    ? 'default 1'
                    : 'none',
            value: controller.useSubThemes &&
                    controller.useFlexColorScheme &&
                    controller.inputDecoratorUnfocusedHasBorder
                ? controller.inputDecoratorBorderWidth ?? 0
                : 0,
            onChanged: controller.useSubThemes &&
                    controller.useFlexColorScheme &&
                    controller.inputDecoratorUnfocusedHasBorder
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
                  controller.useSubThemes &&
                          controller.useFlexColorScheme &&
                          controller.inputDecoratorUnfocusedHasBorder
                      ? controller.inputDecoratorBorderWidth == null ||
                              (controller.inputDecoratorBorderWidth ?? 0) <= 0
                          ? thinBorderDefaultLabel
                          : (controller.inputDecoratorBorderWidth
                                  ?.toStringAsFixed(1) ??
                              '')
                      : controller.inputDecoratorUnfocusedHasBorder ||
                              !controller.useSubThemes ||
                              !controller.useFlexColorScheme
                          ? 'default 1'
                          : 'none',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        SwitchListTile(
          title: const Text('Focused field has a border'),
          value: controller.inputDecoratorFocusedHasBorder &&
              controller.useSubThemes &&
              controller.useFlexColorScheme,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? controller.setInputDecoratorFocusedHasBorder
              : null,
        ),
        ListTile(
          enabled: controller.useSubThemes &&
              controller.useFlexColorScheme &&
              controller.inputDecoratorFocusedHasBorder,
          title: const Text('Focused border width'),
          subtitle: Slider(
            min: 0,
            max: 5,
            divisions: 10,
            label: controller.useSubThemes &&
                    controller.useFlexColorScheme &&
                    controller.inputDecoratorFocusedHasBorder
                ? controller.inputDecoratorFocusedBorderWidth == null ||
                        (controller.inputDecoratorFocusedBorderWidth ?? 0) <= 0
                    ? thickBorderDefaultLabel
                    : (controller.inputDecoratorFocusedBorderWidth
                            ?.toStringAsFixed(1) ??
                        '')
                : controller.inputDecoratorFocusedHasBorder ||
                        !controller.useSubThemes ||
                        !controller.useFlexColorScheme
                    ? 'default 2'
                    : 'none',
            value: controller.useSubThemes &&
                    controller.useFlexColorScheme &&
                    controller.inputDecoratorFocusedHasBorder
                ? controller.inputDecoratorFocusedBorderWidth ?? 0
                : 0,
            onChanged: controller.useSubThemes &&
                    controller.useFlexColorScheme &&
                    controller.inputDecoratorFocusedHasBorder
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
                  controller.useSubThemes &&
                          controller.useFlexColorScheme &&
                          controller.inputDecoratorFocusedHasBorder
                      ? controller.inputDecoratorFocusedBorderWidth == null ||
                              (controller.inputDecoratorFocusedBorderWidth ??
                                      0) <=
                                  0
                          ? thickBorderDefaultLabel
                          : (controller.inputDecoratorFocusedBorderWidth
                                  ?.toStringAsFixed(1) ??
                              '')
                      : controller.inputDecoratorFocusedHasBorder ||
                              !controller.useSubThemes ||
                              !controller.useFlexColorScheme
                          ? 'default 2'
                          : 'none',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const Divider(),
        const ListTile(
          title: Text('DropdownMenu'),
          subtitle: Text('The DropDown menu has a text entry used to select '
              'an option in a dropdown men by typing in the selection. '
              'The text entry part matches the text input decoration theme '
              'in FCS by default.'),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: DropDownMenuShowcase(),
        ),
        const ListTile(
          title: Text('DropdownButtonFormField'),
          subtitle: Text('An older Material widget. Uses the text input '
              'decoration theme'),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: DropDownButtonFormField(),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
