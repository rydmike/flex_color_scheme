import 'package:flutter/material.dart';

import '../../../shared/controllers/theme_controller.dart';
import '../../../shared/widgets/universal/switch_list_tile_reveal.dart';

class UseTinted3TextTheme extends StatelessWidget {
  const UseTinted3TextTheme({super.key, required this.controller});
  final ThemeController controller;

  static const String _describeTextTint =
      'A hint of tint color, typically primary, is '
      'mixed into main and primary text theme. This style may divide '
      'opinions. Keep it OFF for default black and dark grey text when not '
      'using seed generated ColorSchemes.\n'
      '\n'
      'The M3 Typography 2021 default TextTheme and all styles in it are '
      'fully opaque by default. However, when you use a seed generated '
      'ColorScheme, the text becomes primary tinted, because they use '
      'the onSurface color that by default has primary tint. With FCS you can '
      'modify the onSurface to black/white tones to avoid this. Also note '
      'that FCS tinted ColorScheme in dark mode is less tinted than dark mode '
      'default onSurface, whereas the light mode often appears a bit more '
      'tinted than default seeded onSurface color. The differences are quite '
      'subtle though.\n'
      '\n'
      'In M2 Typography 2018 and 2014, some text styles '
      'in the text theme use partially transparent white or '
      'partially transparent black colors, making them appear tinted '
      'when placed on colored backgrounds.\n'
      '\n'
      'When you use tinted text, also via the default seeded onSurface text '
      'color, on a surface color that deviates a lot in hue from the hue used '
      'as tint color by the TextTheme, it may not fit so well. The M2 opacity '
      'based text styles do not have this limitation.\n'
      '\n'
      'If you use a custom surface tint color in FCS, '
      'this color is also used for the tint in the neutral tonal palettes in '
      'seeded ColorScheme generation and for surface blends, as '
      "well as for the subtle tint on the TextTheme's TextStyles, when this "
      'tinted TextTheme feature is enabled, thus automatically keeping them '
      'all in sync.\n';

  @override
  Widget build(BuildContext context) {
    final bool isLight = Theme.of(context).brightness == Brightness.light;
    return isLight
        ? SwitchListTileReveal(
            title: const Text('Tinted light TextTheme'),
            subtitleReveal: const Text(_describeTextTint),
            value: controller.blendLightTextTheme &&
                controller.useSubThemes &&
                controller.useFlexColorScheme,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.setBlendLightTextTheme
                : null,
          )
        : SwitchListTileReveal(
            title: const Text('Tinted dark TextTheme'),
            subtitleReveal: const Text(_describeTextTint),
            value: controller.blendDarkTextTheme &&
                controller.useSubThemes &&
                controller.useFlexColorScheme,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.setBlendDarkTextTheme
                : null,
          );
  }
}
