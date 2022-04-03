import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/switch_list_tile_adaptive.dart';
import '../../../../shared/widgets/universal/theme_showcase.dart';
import '../../shared/color_scheme_popup_menu.dart';

class TextFieldSettings extends StatelessWidget {
  const TextFieldSettings(this.controller, {Key? key}) : super(key: key);
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final bool isLight = Theme.of(context).brightness == Brightness.light;
    debugPrint('TextFieldSettings: inputDecoratorBorderType: '
        '${controller.inputDecoratorBorderType}');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
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
        SwitchListTileAdaptive(
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
        SwitchListTileAdaptive(
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
        // underline input border radius. this is because UnderlineInputBorder
        // does not implement correctly where as OutlineInputBorder does.
        // Issue is here:
        // https://github.com/flutter/flutter/blob/0b97874895eb3e14c1cf0e65bd7fca3a17c62b02/packages/flutter/lib/src/material/input_border.dart#L244
        // It needs border radius as a part of its equality and hashcode.
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Border radius'),
          subtitle: Slider.adaptive(
            min: -1,
            max: 40,
            divisions: 41,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.inputDecoratorBorderRadius == null ||
                        (controller.inputDecoratorBorderRadius ?? -1) < 0
                    ? 'default 20'
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
                      ? controller.inputDecoratorBorderRadius == null ||
                              (controller.inputDecoratorBorderRadius ?? -1) < 0
                          ? 'default 20'
                          : (controller.inputDecoratorBorderRadius
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
        SwitchListTileAdaptive(
          title: const Text('Unfocused field has a border'),
          value: controller.inputDecoratorUnfocusedHasBorder &&
              controller.useSubThemes &&
              controller.useFlexColorScheme,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? controller.setInputDecoratorUnfocusedHasBorder
              : null,
        ),
        SwitchListTileAdaptive(
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
        const Padding(
          padding: EdgeInsets.all(16),
          child: TextInputField(),
        ),
      ],
    );
  }
}
