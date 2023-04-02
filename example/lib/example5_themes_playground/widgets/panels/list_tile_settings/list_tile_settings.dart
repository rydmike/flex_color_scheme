import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';

class ListTileSettings extends StatelessWidget {
  const ListTileSettings(this.controller, {super.key});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTile(
          title: Text('Themed ListTile'),
          subtitle: Text(
            'There are many different ListTile types in Flutter. They '
            'are useful widgets for settings and options. '
            'In FSC you can theme them by theming the colors of the '
            'switches, checkboxes and radio buttons they use.',
          ),
        ),
        SwitchListTile(
          title: const Text('Unselected toggle color'),
          subtitle: const Text('ON: Use theme color   OFF: default grey'),
          value: controller.unselectedToggleIsColored &&
              controller.useSubThemes &&
              controller.useFlexColorScheme,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? controller.setUnselectedToggleIsColored
              : null,
        ),
        const Divider(height: 1),
        const ListTileAllShowcase(),
        const Divider(),
        const ListTile(
          title: Text('Themed ExpansionTile'),
          subtitle:
              Text('No theming properties in current FCS, included to show it '
                  'with current theme.'),
        ),
        const ExpansionTileShowcase(),
        const Divider(),
        const ListTile(
          title: Text('Themed ExpansionPanelList'),
          subtitle:
              Text('No theming properties in current FCS, included to show it '
                  'with current theme.'),
        ),
        const ExpansionPanelListShowcase(),
        const SizedBox(height: 16),
      ],
    );
  }
}
