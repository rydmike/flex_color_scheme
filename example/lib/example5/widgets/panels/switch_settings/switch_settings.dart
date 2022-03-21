import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/header_card.dart';
import '../../../../shared/widgets/universal/switch_list_tile_adaptive.dart';
import '../../../../shared/widgets/universal/theme_showcase.dart';
import '../../shared/color_scheme_popup_menu.dart';

// Panel used to configure sub themes on Switch, Checkbox and Radio widgets.
class SwitchesSettings extends StatelessWidget {
  const SwitchesSettings({
    Key? key,
    required this.controller,
    this.isOpen = true,
    this.onTap,
  }) : super(key: key);
  final ThemeController controller;
  final bool isOpen;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return HeaderCard(
      isOpen: isOpen,
      onTap: onTap,
      title: const Text('Switch, Checkbox and Radio'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SwitchListTileAdaptive(
            title: const Text('Unselected toggle color'),
            subtitle: const Text('ON: Use theme color   OFF: SDK neutral'),
            value: controller.unselectedIsColored &&
                controller.useSubThemes &&
                controller.useFlexColorScheme,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.setUnselectedIsColored
                : null,
          ),
          const Divider(),
          ColorSchemePopupMenu(
            title: const Text('Switch color'),
            labelForDefault: !controller.useFlexColorScheme && isDark
                ? 'null (tealAccent[200])'
                : 'null (secondary)',
            index: controller.switchSchemeColor?.index ?? -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setSwitchSchemeColor(null);
                    } else {
                      controller
                          .setSwitchSchemeColor(SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SwitchShowcase(),
          ),
          const Divider(),
          ColorSchemePopupMenu(
            title: const Text('Checkbox color'),
            labelForDefault: !controller.useFlexColorScheme && isDark
                ? 'null (tealAccent[200])'
                : 'null (secondary)',
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CheckboxShowcase(),
          ),
          const Divider(),
          ColorSchemePopupMenu(
            title: const Text('Radio color'),
            labelForDefault: !controller.useFlexColorScheme && isDark
                ? 'null (tealAccent[200])'
                : 'null (secondary)',
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: RadioShowcase(),
          ),
        ],
      ),
    );
  }
}
