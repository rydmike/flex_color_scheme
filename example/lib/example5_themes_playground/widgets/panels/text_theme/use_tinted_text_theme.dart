import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';

class UseTinted3TextTheme extends StatelessWidget {
  const UseTinted3TextTheme({super.key, required this.controller});
  final ThemeController controller;

  static const String _deprecateTint = 'The tinted TextTheme feature '
      'available in previous versions has been deprecated.\n'
      '\n'
      'The feature was originally '
      "made before Material-3's TextTheme was available and it was fully "
      'known how it was going to be implemented. It was an approximation of '
      'the TextStyles that could be seen in early versions of Material-3 '
      'images. Since the actual Material-3 TextTheme is available, the tinted '
      'TextTheme feature is no longer needed. While the FCS tinted TextTheme '
      'did provide an alternative version of the actual tint used in '
      'Material-3, but the differences were quite subtle. Additionally '
      'recent changes in Flutter makes using it very verbose and complicated. '
      'Why it does so, is explained below.\n'
      '\n'
      'In Material-3 Typography 2021, the TextTheme and all styles in it are '
      'fully opaque and use onSurface as color on all TextStyles. '
      'In a seed generated ColorScheme, the text becomes primary tinted, '
      'because the onSurface color by default has subtle primary tint. '
      'With FCS you can modify the onSurface to black or white to avoid this, '
      'if so preferred.\n'
      '\n'
      'In Material-2 Typography 2018 and 2014, some TextStyles '
      'in their TextThemes use partially transparent white or '
      'black colors, making them appear tinted '
      'when placed on lightly colored backgrounds. Such TextStyles also '
      'have lower contrast. If the Material-3 default text theme is '
      'used on background colors that are tinted with a color that '
      'deviates a lot in hue from the hue used as tint color by the TextTheme, '
      'it may not fit it so well. The Material-2 opacity based text styles '
      'do not have this limitation. It is unknown why Material-3 switched to '
      'a fixed tint color instead of using the opacity based approach '
      'used in Material-2, that is more universally '
      'usable on backgrounds with different tint colors.\n'
      '\n'
      'In Material-3, some component themes override the default color the of '
      'the default TextTheme TextStyles they use with onSurfaceVariant. '
      'This color has slightly more tint and lower contrast than onSurface. '
      'This is used for elements that should have less emphasis. Many default '
      'Material-3 components also override the color in default TextTheme '
      'TextStyles '
      'they use with onSurface color, that it actually already has in a '
      'default TextTheme. These two overrides causes whatever '
      'color the default TextTheme TextStyles have, to be overridden by '
      'these ColorScheme colors. Resulting in that any custom colored '
      'TextTheme is not getting used by such Material-3 components and that '
      'the custom colors from the meticulously colored custom TextTheme, '
      'are rarely visible anywhere in a Material-3 application. Material-2 '
      'component themes do not do this, nor did older Flutter versions of '
      'Material-3 component themes do this.\n'
      '\n'
      'An issue has been raised explaining the challenges this newer approach '
      'in Flutter causes when using custom colored text themes. If this '
      'issue is addressed, the tinted TextTheme feature in FCS may '
      'be brought back, if it is a requested feature.\n'
      '\n'
      'In current Flutter versions, using a custom tinted TextTheme is '
      'rather pointless. You can do it, but is not enough to just define the '
      'TextTheme, you also have to pass each tinted TextStyle it has, to the '
      'appropriate TextStyles in ALL component themes that override the '
      'colors for it to have any effect. It is typically not '
      'worth the effort.\n';

  // TODO(rydmike): Commented as part of deprecation of blendTextTheme.
  // static const String _describeTextTint =
  //     'A hint of tint color, typically primary, is '
  //     'mixed into main and primary text theme. This style may divide '
  //     'opinions. Keep it OFF for default black and dark grey text when not '
  //     'using seed generated ColorSchemes.\n'
  //     '\n'
  //     'The M3 Typography 2021 default TextTheme and all styles in it are '
  //     'fully opaque by default. However, when you use a seed generated '
  //     'ColorScheme, the text becomes primary tinted, because they use '
  //   'the onSurface color that by default has primary tint. With FCS you can '
  //     'modify the onSurface to black/white tones to avoid this. Also note '
  //   'that FCS tinted ColorScheme in dark mode is less tinted than dark mode '
  //     'default onSurface, whereas the light mode often appears a bit more '
  //   'tinted than default seeded onSurface color. The differences are quite '
  //     'subtle though.\n'
  //     '\n'
  //     'In M2 Typography 2018 and 2014, some text styles '
  //     'in the text theme use partially transparent white or '
  //     'partially transparent black colors, making them appear tinted '
  //     'when placed on colored backgrounds.\n'
  //     '\n'
  //     'When you use tinted text, also via the default seeded onSurface text '
  //   'color, on a surface color that deviates a lot in hue from the hue used '
  //   'as tint color by the TextTheme, it may not fit so well. The M2 opacity '
  //     'based text styles do not have this limitation.\n'
  //     '\n'
  //     'If you use a custom surface tint color in FCS, '
  //    'this color is also used for the tint in the neutral tonal palettes in '
  //     'seeded ColorScheme generation and for surface blends, as '
  //     "well as for the subtle tint on the TextTheme's TextStyles, when this "
  //     'tinted TextTheme feature is enabled, thus automatically keeping them '
  //     'all in sync.\n';

  @override
  Widget build(BuildContext context) {
    return const ListTileReveal(
      title: Text('Where is the tinted TextTheme?'),
      subtitleReveal: Text(_deprecateTint),
    );

    // TODO(rydmike): Commented as part of deprecation of blendTextTheme.
    // final bool isLight = Theme.of(context).brightness == Brightness.light;
    // return isLight
    //     ? SwitchListTileReveal(
    //         title: const Text('Tinted light TextTheme'),
    //         subtitleReveal: const Text(_describeTextTint),
    //         value: controller.blendLightTextTheme &&
    //             controller.useSubThemes &&
    //             controller.useFlexColorScheme,
    //       onChanged: controller.useSubThemes && controller.useFlexColorScheme
    //             ? controller.setBlendLightTextTheme
    //             : null,
    //       )
    //     : SwitchListTileReveal(
    //         title: const Text('Tinted dark TextTheme'),
    //         subtitleReveal: const Text(_describeTextTint),
    //         value: controller.blendDarkTextTheme &&
    //             controller.useSubThemes &&
    //             controller.useFlexColorScheme,
    //       onChanged: controller.useSubThemes && controller.useFlexColorScheme
    //             ? controller.setBlendDarkTextTheme
    //             : null,
    //       );
  }
}
