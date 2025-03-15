import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/navigation_rail_label_type_toggle_buttons.dart';

class NavigationRailLabelBehaviorListTile extends StatelessWidget {
  const NavigationRailLabelBehaviorListTile({
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

  String _explainLabelStyle(final NavigationRailLabelType labelStyle) {
    switch (labelStyle) {
      case NavigationRailLabelType.none:
        return 'No labels';
      case NavigationRailLabelType.selected:
        return 'Only selected';
      case NavigationRailLabelType.all:
        return 'All';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: contentPadding,
      enabled: controller.useSubThemes && controller.useFlexColorScheme,
      title: const Text('Labels when collapsed'),
      subtitle: Text(_explainLabelStyle(
          controller.useSubThemes && controller.useFlexColorScheme
              ? controller.navigationRailLabelType
              : NavigationRailLabelType.none)),
      trailing: NavigationRailLabelTypeToggleButtons(
        style: controller.useSubThemes && controller.useFlexColorScheme
            ? controller.navigationRailLabelType
            : NavigationRailLabelType.none,
        onChanged: controller.useSubThemes && controller.useFlexColorScheme
            ? controller.setNavigationRailLabelType
            : null,
      ),
      onTap: () {
        if (controller.navigationRailLabelType ==
            NavigationRailLabelType.none) {
          controller
              .setNavigationRailLabelType(NavigationRailLabelType.selected);
        } else if (controller.navigationRailLabelType ==
            NavigationRailLabelType.selected) {
          controller.setNavigationRailLabelType(NavigationRailLabelType.all);
        } else {
          controller.setNavigationRailLabelType(NavigationRailLabelType.none);
        }
      },
    );
  }
}
