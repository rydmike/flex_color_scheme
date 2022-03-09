import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/header_card.dart';
import '../../../../shared/widgets/universal/switch_list_tile_adaptive.dart';
import '../../../../shared/widgets/universal/theme_showcase.dart';
import '../../shared/color_scheme_popup_menu.dart';

class ToggleFabChipsSettings extends StatelessWidget {
  const ToggleFabChipsSettings({
    Key? key,
    required this.controller,
    required this.isOpen,
    required this.onTap,
  }) : super(key: key);
  final ThemeController controller;
  final bool isOpen;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return HeaderCard(
      isOpen: isOpen,
      onTap: onTap,
      title: const Text('Themed Buttons, Switches and Chips'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ColorSchemePopupMenu(
            title: const Text('ToggleButtons color'),
            index: controller.toggleButtonsSchemeColor?.index ?? -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setToggleButtonsSchemeColor(null);
                    } else {
                      controller.setToggleButtonsSchemeColor(
                          SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: ToggleButtonsShowcase(),
          ),
          const Divider(),
          ColorSchemePopupMenu(
            title: const Text('FloatingActionButton color'),
            labelForDefault: 'null (secondary)',
            index: controller.fabSchemeColor?.index ?? -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setFabSchemeColor(null);
                    } else {
                      controller.setFabSchemeColor(SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
          SwitchListTileAdaptive(
            title: const Text('Use themed shape on FloatingActionButton'),
            subtitle: const Text('OFF removes the Shape usage from its theme, '
                'making it use its default un-themed style. Circular '
                'while M2 style remain its default un-themed style'),
            value: controller.fabUseShape &&
                controller.useSubThemes &&
                controller.useFlexColorScheme,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.setFabUseShape
                : null,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: FabShowcase(),
          ),
          const Divider(),
          ColorSchemePopupMenu(
            title: const Text('Chip color'),
            index: controller.chipSchemeColor?.index ?? -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setChipSchemeColor(null);
                    } else {
                      controller.setChipSchemeColor(SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: ChipShowcase(),
          ),
          const Divider(),
          // TODO(rydmike): Keeping this setting out of the demo, no impact.
          //  This setting has no impact on anything in the demo so taking it
          //  away for now. Thought it might affect something on the
          //  DropDownButton, but it does not.
          //
          // ColorSchemePopupMenu(
          //   title: const Text('Old ButtonTheme color'),
          //   index: controller.materialButtonSchemeColor?.index ?? -1,
          //   onChanged: controller.useSubThemes &&
          //      controller.useFlexColorScheme
          //       ? (int index) {
          //           if (index < 0 || index >= SchemeColor.values.length) {
          //             controller.setMaterialButtonSchemeColor(null);
          //           } else {
          //             controller.setMaterialButtonSchemeColor(
          //                 SchemeColor.values[index]);
          //           }
          //         }
          //       : null,
          // ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: PopupDropdownButtonsShowcase(),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(16),
            child: CircleAvatarAndTooltipShowcase(),
          ),
        ],
      ),
    );
  }
}
