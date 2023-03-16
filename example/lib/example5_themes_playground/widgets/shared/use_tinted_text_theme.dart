import 'package:flutter/material.dart';

import '../../../shared/controllers/theme_controller.dart';

class UseTinted3TextTheme extends StatelessWidget {
  const UseTinted3TextTheme({super.key, required this.controller});
  final ThemeController controller;
  @override
  Widget build(BuildContext context) {
    final bool isLight = Theme.of(context).brightness == Brightness.light;
    return isLight
        ? SwitchListTile(
            title: const Text('Light mode TextTheme tint'),
            subtitle: const Text('A hint of tint color, typically primary, is '
                'mixed into main and primary text theme. This style divides '
                'opinions. Keep it OFF for default black and dark grey text.'),
            value: controller.blendLightTextTheme &&
                controller.useSubThemes &&
                controller.useFlexColorScheme,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.setBlendLightTextTheme
                : null,
          )
        : SwitchListTile(
            title: const Text('Dark mode TextTheme tint'),
            subtitle: const Text('A hint of tint color, typically primary, is '
                'mixed into main and primary text theme. This style divides '
                'opinions. Keep it OFF for default white and light grey text.'),
            value: controller.blendDarkTextTheme &&
                controller.useSubThemes &&
                controller.useFlexColorScheme,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.setBlendDarkTextTheme
                : null,
          );
  }
}
