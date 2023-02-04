import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';

class UseSeededColorSchemeSwitch extends StatelessWidget {
  const UseSeededColorSchemeSwitch({super.key, required this.controller});

  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final bool useSeed = controller.useKeyColors;
    final String explainSeed = useSeed
        ? 'You can adjust the seed generated theme further with the "Seeded '
            'ColorScheme" feature.'
        : "Seeded ColorSchemes use at least the scheme's defined primary color "
            'as input key color to seed generate ColorSchemes for the light '
            'and dark themes.';

    return SwitchListTile(
      title: const Text("Use Material 3 color system's seed generated "
          'ColorScheme'),
      subtitle: Text(explainSeed),
      value: useSeed,
      onChanged: controller.setUseKeyColors,
    );
  }
}
