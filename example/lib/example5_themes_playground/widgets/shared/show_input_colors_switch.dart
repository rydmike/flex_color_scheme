import 'package:flutter/material.dart';

import '../../../shared/controllers/theme_controller.dart';
import '../../../shared/widgets/universal/switch_list_tile_reveal.dart';

class ShowInputColorsSwitch extends StatelessWidget {
  const ShowInputColorsSwitch({
    super.key,
    required this.controller,
    this.contentPadding,
  });

  final ThemeController controller;

  /// The [ListTile]'s internal padding.
  ///
  /// Insets a [ListTile]'s contents.
  ///
  /// If null, `EdgeInsets.symmetric(horizontal: 16.0)` is used in M2
  /// and `EdgeInsetsDirectional.only(start: 16.0, end: 24.0)` in M3.
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return SwitchListTileReveal(
      dense: true,
      contentPadding: contentPadding,
      title: const Text('Show input colors'),
      subtitleReveal:
          const Text('Turn ON this option to show the FlexColorScheme scheme '
              'input color values. This shows the used color values '
              'before any input modifiers are used on them. This includes seed '
              'generation, swapping legacy colors, swapping primary and '
              'secondary colors, used input color limiters, computed dark '
              'theme and using M3 error colors on legacy M2 schemes.\n'
              '\n'
              'In older Playground versions the scheme input color '
              'values were always shown. This may be confusing and they '
              'are now hidden by default. Showing them may be useful to '
              'understand how the scheme defined input colors are being '
              'modified by input modifiers, but it is more cluttered. '
              'If ON, scheme input color values show the colors before '
              'input modifiers, and the surrounding '
              "color is the effective theme's ColorScheme.\n"),
      value: controller.showSchemeInputColors,
      onChanged: controller.setShowSchemeInputColors,
    );
  }
}
