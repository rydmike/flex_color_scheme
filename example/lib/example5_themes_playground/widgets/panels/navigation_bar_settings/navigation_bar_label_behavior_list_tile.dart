import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/navigation_bar_label_behavior_toggle_buttons.dart';

class NavigationBarLabelBehaviorListTile extends StatelessWidget {
  const NavigationBarLabelBehaviorListTile({
    required this.controller,
    super.key,
  });
  final ThemeController controller;

  String _explainLabelStyle(NavigationDestinationLabelBehavior labelBehavior) {
    switch (labelBehavior) {
      case NavigationDestinationLabelBehavior.alwaysHide:
        return 'Items have no labels';
      case NavigationDestinationLabelBehavior.onlyShowSelected:
        return 'Only selected item has a label';
      case NavigationDestinationLabelBehavior.alwaysShow:
        return 'All items have labels';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: controller.useSubThemes && controller.useFlexColorScheme,
      title: const Text('Label behavior'),
      subtitle: Text(_explainLabelStyle(
          controller.useSubThemes && controller.useFlexColorScheme
              ? controller.navBarLabelBehavior
              : NavigationDestinationLabelBehavior.alwaysShow)),
      trailing: NavigationBarLabelBehaviorToggleButtons(
        labelBehavior: controller.useSubThemes && controller.useFlexColorScheme
            ? controller.navBarLabelBehavior
            : NavigationDestinationLabelBehavior.alwaysShow,
        onChanged: controller.useSubThemes && controller.useFlexColorScheme
            ? controller.setNavBarLabelBehavior
            : null,
      ),
      onTap: () {
        if (controller.navBarLabelBehavior ==
            NavigationDestinationLabelBehavior.alwaysHide) {
          controller.setNavBarLabelBehavior(
              NavigationDestinationLabelBehavior.onlyShowSelected);
        } else if (controller.navBarLabelBehavior ==
            NavigationDestinationLabelBehavior.onlyShowSelected) {
          controller.setNavBarLabelBehavior(
              NavigationDestinationLabelBehavior.alwaysShow);
        } else {
          controller.setNavBarLabelBehavior(
              NavigationDestinationLabelBehavior.alwaysHide);
        }
      },
    );
  }
}
