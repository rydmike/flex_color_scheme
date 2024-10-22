import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/navigation_bar_label_behavior_toggle_buttons.dart';

class NavigationBarLabelBehaviorListTile extends StatelessWidget {
  const NavigationBarLabelBehaviorListTile({
    required this.controller,
    this.contentPadding,
    super.key,
  });
  final ThemeController controller;

  /// The [ListTile]'s internal padding.
  ///
  /// Insets a [ListTile]'s contents.
  ///
  /// If null, `EdgeInsets.symmetric(horizontal: 16.0)` is used in M2
  /// and `EdgeInsetsDirectional.only(start: 16.0, end: 24.0)` in M3.
  final EdgeInsetsGeometry? contentPadding;

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
      contentPadding: contentPadding,
      enabled: controller.useSubThemes && controller.useFlexColorScheme,
      title: const Text('Label behavior'),
      subtitle: Text(_explainLabelStyle(
          controller.useSubThemes && controller.useFlexColorScheme
              ? controller.navigationBarLabelBehavior
              : NavigationDestinationLabelBehavior.alwaysShow)),
      trailing: NavigationBarLabelBehaviorToggleButtons(
        labelBehavior: controller.useSubThemes && controller.useFlexColorScheme
            ? controller.navigationBarLabelBehavior
            : NavigationDestinationLabelBehavior.alwaysShow,
        onChanged: controller.useSubThemes && controller.useFlexColorScheme
            ? controller.setNavigationBarLabelBehavior
            : null,
      ),
      onTap: () {
        if (controller.navigationBarLabelBehavior ==
            NavigationDestinationLabelBehavior.alwaysHide) {
          controller.setNavigationBarLabelBehavior(
              NavigationDestinationLabelBehavior.onlyShowSelected);
        } else if (controller.navigationBarLabelBehavior ==
            NavigationDestinationLabelBehavior.onlyShowSelected) {
          controller.setNavigationBarLabelBehavior(
              NavigationDestinationLabelBehavior.alwaysShow);
        } else {
          controller.setNavigationBarLabelBehavior(
              NavigationDestinationLabelBehavior.alwaysHide);
        }
      },
    );
  }
}
