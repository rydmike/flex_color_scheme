import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import 'tab_bar_style_toggle_buttons.dart';

class TabBarStyleListTile extends StatelessWidget {
  const TabBarStyleListTile({
    this.title,
    this.subtitle,
    required this.controller,
    super.key,
  });

  final Widget? title;
  final Widget? subtitle;
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final FlexTabBarStyle style = controller.tabBarStyle;
    return ListTile(
      enabled: controller.useFlexColorScheme,
      title: title,
      subtitle: subtitle,
      onTap: () {
        if (style.index + 1 >= FlexTabBarStyle.values.length) {
          controller.setTabBarStyle(FlexTabBarStyle.values[0]);
        } else {
          controller.setTabBarStyle(FlexTabBarStyle.values[style.index + 1]);
        }
      },
      trailing: TabBarStyleToggleButtons(
        style: controller.useFlexColorScheme
            ? controller.tabBarStyle
            : FlexTabBarStyle.flutterDefault,
        onChanged:
            controller.useFlexColorScheme ? controller.setTabBarStyle : null,
      ),
    );
  }
}
