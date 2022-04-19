import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/switch_list_tile_adaptive.dart';
import '../../../../shared/widgets/universal/theme_showcase.dart';

class PrimaryTextThemeSettings extends StatelessWidget {
  const PrimaryTextThemeSettings(this.controller, {Key? key}) : super(key: key);
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final bool isLight = Theme.of(context).brightness == Brightness.light;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
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
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
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
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.setBlendDarkTextTheme
                : null,
          ),
        SwitchListTileAdaptive(
          title: const Text("Use the application's font Noto Sans"),
          subtitle: const Text('You can turn OFF using any app font definition '
              'here to see what the TextTheme looks like on each platform with '
              'its default. This is an app toggle, not a FlexColorScheme '
              'theming toggle.'),
          value: controller.useAppFont,
          onChanged: controller.setUseAppFont,
        ),
        SizedBox(
          width: double.infinity,
          child: Material(
            type: MaterialType.card,
            color: Theme.of(context).colorScheme.primary,
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: PrimaryTextThemeShowcase(),
            ),
          ),
        ),
      ],
    );
  }
}
