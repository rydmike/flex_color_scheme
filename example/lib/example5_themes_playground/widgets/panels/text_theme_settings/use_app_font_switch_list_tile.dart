import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';

class UseAppFontSwitchLisTile extends StatelessWidget {
  const UseAppFontSwitchLisTile({super.key, required this.controller});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: const Text("Use the application's font Noto Sans"),
      subtitle: const Text("You can turn OFF using the application's custom "
          'font definition to see what the TextTheme looks like on each '
          'platform with its platform default font. This is an app feature '
          'toggle, not a FlexColorScheme theming toggle.'),
      value: controller.useAppFont,
      onChanged: controller.setUseAppFont,
    );
  }
}
