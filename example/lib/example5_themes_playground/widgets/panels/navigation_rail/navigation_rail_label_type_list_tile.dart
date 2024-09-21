import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/navigation_rail_label_type_toggle_buttons.dart';

class NavigationRailLabelBehaviorListTile extends StatelessWidget {
  const NavigationRailLabelBehaviorListTile({
    required this.controller,
    super.key,
  });
  final ThemeController controller;

  String _explainLabelStyle(final NavigationRailLabelType labelStyle) {
    switch (labelStyle) {
      case NavigationRailLabelType.none:
        return 'Items have no labels';
      case NavigationRailLabelType.selected:
        return 'Only selected item has a label';
      case NavigationRailLabelType.all:
        return 'All items have labels';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: controller.useSubThemes && controller.useFlexColorScheme,
      title: const Text('Labels when rail is collapsed'),
      subtitle: Text(_explainLabelStyle(
          controller.useSubThemes && controller.useFlexColorScheme
              ? controller.navRailLabelType
              : NavigationRailLabelType.none)),
      trailing: NavigationRailLabelTypeToggleButtons(
        style: controller.useSubThemes && controller.useFlexColorScheme
            ? controller.navRailLabelType
            : NavigationRailLabelType.none,
        onChanged: controller.useSubThemes && controller.useFlexColorScheme
            ? controller.setNavRailLabelType
            : null,
      ),
      onTap: () {
        if (controller.navRailLabelType == NavigationRailLabelType.none) {
          controller.setNavRailLabelType(NavigationRailLabelType.selected);
        } else if (controller.navRailLabelType ==
            NavigationRailLabelType.selected) {
          controller.setNavRailLabelType(NavigationRailLabelType.all);
        } else {
          controller.setNavRailLabelType(NavigationRailLabelType.none);
        }
      },
    );
  }
}
