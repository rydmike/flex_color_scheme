import 'package:flutter/material.dart';

import '../../../shared/controllers/theme_controller.dart';
import '../../../shared/widgets/universal/switch_list_tile_reveal.dart';

class NavigatorsUseDefaultsSwitch extends StatelessWidget {
  const NavigatorsUseDefaultsSwitch({
    super.key,
    required this.controller,
  });
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    return SwitchListTileReveal(
      enabled: controller.useSubThemes && controller.useFlexColorScheme,
      dense: true,
      title: const Text('Navigators use Flutter defaults'),
      subtitle: const Text('Undefined sub-theme values will fall '
          'back to Flutter SDK defaults and some will be forced to defaults. '
          'Prefer using OFF to get FCS defaults. '
          'This setting affects BottomNavigationBar, NavigationBar and '
          'NavigationRail. See API docs for more info.\n'),
      value: controller.useFlutterDefaults &&
          controller.useSubThemes &&
          controller.useFlexColorScheme,
      onChanged: controller.useSubThemes && controller.useFlexColorScheme
          ? controller.setUseFlutterDefaults
          : null,
    );
  }
}
