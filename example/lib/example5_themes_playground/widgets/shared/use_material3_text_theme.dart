import 'package:flutter/material.dart';

import '../../../shared/controllers/theme_controller.dart';
import '../../../shared/widgets/universal/switch_list_tile_adaptive.dart';

class UseMaterial3TextTheme extends StatelessWidget {
  const UseMaterial3TextTheme({super.key, required this.controller});
  final ThemeController controller;
  @override
  Widget build(BuildContext context) {
    return SwitchListTileAdaptive(
      title: const Text('Use Material 3 TextTheme'),
      subtitle: const Text('ON to use M3 2021 text styles and geometry\n'
          'OFF to use M2 2018 text styles and geometry'),
      value: controller.useTextTheme &&
          controller.useSubThemes &&
          controller.useFlexColorScheme,
      onChanged: controller.useSubThemes && controller.useFlexColorScheme
          ? controller.setUseTextTheme
          : null,
    );
  }
}
