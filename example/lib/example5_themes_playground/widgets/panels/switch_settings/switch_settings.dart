import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../../../shared/widgets/universal/switch_list_tile_reveal.dart';
import '../../shared/color_scheme_popup_menu.dart';

// Panel used to configure sub themes on Switch, Checkbox and Radio widgets.
class SwitchesSettings extends StatelessWidget {
  const SwitchesSettings(this.controller, {super.key});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final String labelForDefaultColor =
        (controller.useSubThemes || controller.useMaterial3) &&
                controller.useFlexColorScheme
            ? 'default (primary)'
            : isDark
                ? 'default (tealAccent[200])'
                : 'default (secondary)';
    final String labelForDefaultThumbColor =
        (controller.useSubThemes || controller.useMaterial3) &&
                controller.useFlexColorScheme
            ? controller.useMaterial3
                ? 'default (primaryContainer)'
                : 'default (primary)'
            : isDark
                ? 'default (tealAccent[200])'
                : 'default (secondary)';

    final String explainThumb =
        controller.useMaterial3 ? ' pressed/hovered/focused' : '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SwitchShowcase(),
        ),
        ColorSchemePopupMenu(
          title: const Text('Switch main color'),
          labelForDefault: labelForDefaultColor,
          index: controller.switchSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setSwitchSchemeColor(null);
                  } else {
                    controller.setSwitchSchemeColor(SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ColorSchemePopupMenu(
          title: Text('Switch ON state$explainThumb thumb color'),
          labelForDefault: labelForDefaultThumbColor,
          index: controller.switchThumbSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setSwitchThumbSchemeColor(null);
                  } else {
                    controller
                        .setSwitchThumbSchemeColor(SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        const Divider(height: 1),
        const SizedBox(height: 8),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CheckboxShowcase(),
        ),
        ColorSchemePopupMenu(
          title: const Text('Checkbox main color'),
          labelForDefault: labelForDefaultColor,
          index: controller.checkboxSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setCheckboxSchemeColor(null);
                  } else {
                    controller
                        .setCheckboxSchemeColor(SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        const Divider(height: 1),
        const SizedBox(height: 8),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: RadioShowcase(),
        ),
        ColorSchemePopupMenu(
          title: const Text('Radio main color'),
          labelForDefault: labelForDefaultColor,
          index: controller.radioSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setRadioSchemeColor(null);
                  } else {
                    controller.setRadioSchemeColor(SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        const Divider(height: 1),
        SwitchListTileReveal(
          title: const Text('Unselected toggle is colored'),
          subtitle: const Text('ON: Use main color on unselected toggle\n'
              'OFF: Use default grey/surface style on unselected toggle\n'),
          value: controller.unselectedToggleIsColored &&
              controller.useSubThemes &&
              controller.useFlexColorScheme,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? controller.setUnselectedToggleIsColored
              : null,
        ),
      ],
    );
  }
}
