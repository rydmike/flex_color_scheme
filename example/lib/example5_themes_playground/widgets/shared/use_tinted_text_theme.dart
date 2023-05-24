import 'package:flutter/material.dart';

import '../../../shared/controllers/theme_controller.dart';
import '../../../shared/widgets/universal/switch_list_tile_reveal.dart';

class UseTinted3TextTheme extends StatelessWidget {
  const UseTinted3TextTheme({super.key, required this.controller});
  final ThemeController controller;

  static const String _describeTextTint =
      'A hint of tint color, typically primary, is '
      'mixed into main and primary text theme. This style may divide '
      'opinions. Keep it OFF for default black and dark grey text.\n'
      '\n'
      'Note that in M2 Typography 2018 and 2014, some text styles '
      'in the text theme use partially transparent white or '
      'black colors, making them appear tinted when placed on '
      'colored backgrounds. The M3 Typography 2021, its default '
      'TextTheme and all styles in it are fully opaque by default.\n'
      '\n'
      'If you use tinted text on a surface that deviates a lot '
      'in surface tint, from the tint used by the TextTheme, it may '
      'not fit well. If you use a custom surface tint color in FCS, '
      'that color is also used for the tint in the neutral tonal palettes in '
      'seeded ColorScheme generation and for surface blends, as '
      'well as for the subtle tint of the text theme, when this feature is '
      'used, thus automatically keeping them all in sync.\n';

  @override
  Widget build(BuildContext context) {
    final bool isLight = Theme.of(context).brightness == Brightness.light;
    return isLight
        ? SwitchListTileReveal(
            title: const Text('Tinted light TextTheme'),
            subtitleDense: true,
            subtitle: const Text(_describeTextTint),
            value: controller.blendLightTextTheme &&
                controller.useSubThemes &&
                controller.useFlexColorScheme,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.setBlendLightTextTheme
                : null,
          )
        : SwitchListTileReveal(
            title: const Text('Tinted dark TextTheme'),
            subtitleDense: true,
            subtitle: const Text(_describeTextTint),
            value: controller.blendDarkTextTheme &&
                controller.useSubThemes &&
                controller.useFlexColorScheme,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.setBlendDarkTextTheme
                : null,
          );
  }
}
