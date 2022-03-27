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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTile(
          title: Text('Adjust TextField style'),
          subtitle: Text('When sub themes are enabled you can adjust the '
              'style of the TextField input via easy to use '
              'InputDecorator theme options'),
        ),
        ColorSchemePopupMenu(
          title: const Text('Base color of text field'),
          index: controller.inputDecoratorSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setInputDecoratorSchemeColor(null);
                  } else {
                    controller.setInputDecoratorSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        SwitchListTileAdaptive(
          title: const Text(
            'Field has fill color',
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
            'ON for outline  OFF for underline',
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
        SwitchListTileAdaptive(
          title: const Text('Unfocused field has border'),
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
              controller.useSubThemes &&
              controller.useFlexColorScheme,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
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
