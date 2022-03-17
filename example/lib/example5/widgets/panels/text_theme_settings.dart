import 'package:flutter/material.dart';

import '../../../shared/controllers/theme_controller.dart';
import '../../../shared/widgets/universal/header_card.dart';
import '../../../shared/widgets/universal/switch_list_tile_adaptive.dart';
import '../../../shared/widgets/universal/theme_showcase.dart';

class TextThemeSettings extends StatelessWidget {
  const TextThemeSettings({
    Key? key,
    required this.controller,
    this.isOpen = true,
    this.onTap,
  }) : super(key: key);
  final ThemeController controller;
  final bool isOpen;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final bool isLight = Theme.of(context).brightness == Brightness.light;
    return HeaderCard(
      isOpen: isOpen,
      onTap: onTap,
      title: const Text('TextTheme'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SwitchListTileAdaptive(
            title: const Text('Use Material 3 TextTheme'),
            subtitle: const Text("ON to use FlexColorScheme's M3 text styles "
                'and geometry\n'
                'OFF to use SDK M2 2018 text styles and geometry'),
            value: controller.useTextTheme &&
                controller.useSubThemes &&
                controller.useFlexColorScheme,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.setUseTextTheme
                : null,
          ),
          if (isLight)
            SwitchListTileAdaptive(
              title: const Text('Light mode TextTheme is primary colored'),
              subtitle: const Text('A hint of primary color is mixed into '
                  'main text theme'),
              value: controller.blendLightTextTheme &&
                  controller.useSubThemes &&
                  controller.useFlexColorScheme,
              onChanged:
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.setBlendLightTextTheme
                      : null,
            )
          else
            SwitchListTileAdaptive(
              title: const Text('Dark mode TextTheme is primary colored'),
              subtitle: const Text('A hint of primary color is mixed into '
                  'main text theme'),
              value: controller.blendDarkTextTheme &&
                  controller.useSubThemes &&
                  controller.useFlexColorScheme,
              onChanged:
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.setBlendDarkTextTheme
                      : null,
            ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: TextThemeShowcase(),
          ),
        ],
      ),
    );
  }
}
