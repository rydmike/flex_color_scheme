import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/switch_list_tile_adaptive.dart';
import '../../../../shared/widgets/universal/theme_showcase.dart';

class ListTileSettings extends StatelessWidget {
  const ListTileSettings(this.controller, {super.key});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTile(
          title: Text('Themed List tiles'),
          subtitle: Text(
            'There are four different ListTile types in Flutter. They '
            'are very useful widgets for settings and options. '
            'In FlexColorScheme you can '
            'for now only quick theme them, by theming the colors of the '
            'switches, checkboxes and radio buttons they use.',
          ),
        ),
        SwitchListTileAdaptive(
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
        const ListTileShowcase(),
      ],
    );
  }
}
