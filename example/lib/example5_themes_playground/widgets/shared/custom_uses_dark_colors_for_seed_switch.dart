import 'package:flutter/material.dart';

import '../../../shared/const/app_color.dart';
import '../../../shared/controllers/theme_controller.dart';
import '../../../shared/widgets/universal/switch_list_tile_reveal.dart';

class CustomUsesDarkColorsForSeedSwitch extends StatelessWidget {
  const CustomUsesDarkColorsForSeedSwitch({
    super.key,
    required this.controller,
  });
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    return SwitchListTileReveal(
      dense: true,
      enabled: controller.useKeyColors &&
          controller.schemeIndex == AppColor.schemes.length - 1,
      title: const Text('Custom dark uses its own colors as seeds'),
      subtitleReveal: const Text(
        'Turn ON to use the custom dark input colors as seed keys '
        'for the seed generated Colorscheme. Typically the dark '
        'ColorScheme is seed generated using the light mode '
        'colors as input. With custom schemes you do not '
        'have to do so. Turn this ON to not used the default locked '
        'to light colors, as seeds. This option is only available '
        'in the Playground when using the custom dark scheme.\n',
      ),
      value: controller.customUsesDarkColorsForSeed,
      onChanged: controller.setCustomUsesDarkColorsForSeed,
    );
  }
}
