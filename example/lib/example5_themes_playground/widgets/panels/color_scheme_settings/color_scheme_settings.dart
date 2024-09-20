import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/const/app_color.dart';
import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/list_tile_slider.dart';
import '../../../../shared/widgets/universal/switch_list_tile_reveal.dart';
import '../../shared/enum_popup_menu.dart';
import '../../shared/show_input_colors_switch.dart';
import '../../shared/use_seeded_color_scheme_switch.dart';
import 'flex_tone_config_popup_menu.dart';
import 'scheme_colors.dart';
import 'show_tonal_palette.dart';

// Panel used to show effective color scheme, when using keys to seed it
// and just using raw FlexSchemeColors input data too based ColorScheme too.
class ColorSchemeSettings extends StatelessWidget {
  const ColorSchemeSettings(
    this.controller, {
    super.key,
  });
  final ThemeController controller;

  String get _flexToneName =>
      FlexSchemeVariant.values[controller.usedFlexToneSetup].variantName;
  bool get _isFlutterScheme =>
      FlexSchemeVariant.values[controller.usedFlexToneSetup].isFlutterScheme;
  String get _seedType => _isFlutterScheme ? 'MCU' : 'FSS';

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;

    // Paddings for the two column control layouts.
    const EdgeInsetsDirectional paddingStartColumn =
        EdgeInsetsDirectional.only(start: 16, end: 8);
    final EdgeInsetsDirectional paddingEndColumn =
        EdgeInsetsDirectional.only(start: 8, end: theme.useMaterial3 ? 24 : 16);

    // TODO(rydmike): Removed tone hover indication feature 16.3.2023.
    // final bool showBlendInfo = ((isLight && controller.blendLevel > 0) ||
    //         (!isLight && controller.blendLevelDark > 0)) &&
    //     controller.useKeyColors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        UseSeededColorSchemeSwitch(controller: controller),
        FlexToneConfigPopupMenu(
          title: 'Scheme',
          flexToneName: '$_flexToneName $_seedType',
          index: controller.usedFlexToneSetup,
          onChanged: controller.setUsedFlexToneSetup,
        ),
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ShowTonalPalette(controller: controller),
        ),
        ListTileReveal(
          enabled: controller.useKeyColors,
          title: const Text('Keep brand colors when using seeded scheme?'),
          dense: true,
          subtitleReveal: const Text(
            'With the switches on the colors below you can lock primary, '
            'secondary, tertiary, error and their container colors to '
            'their scheme input defined colors instead of using the color '
            'from the seeded tonal palette. The switches have separate '
            'states for light and dark theme mode.\n',
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 4),
          child: SchemeColors(tc: controller),
        ),
        if (controller.schemeIndex != (AppColor.schemes.length - 1))
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Tap a color code to copy it to the clipboard.',
              // TODO(rydmike): Removed tone hover indication feature 16.3.2023.
              //'\n'
              // ignore: lines_longer_than_80_chars
              // "${controller.useKeyColors ? 'Hover a color to highlight its tonal palette source color above. ' : ''}"
              // ignore: lines_longer_than_80_chars
              // "${showBlendInfo ? 'Surface blend is used, it modifies surface and background colors, they may not be found in palettes when hovered.' : '\n'}",
              style: theme.textTheme.labelSmall,
            ),
          ),
        if (controller.schemeIndex == (AppColor.schemes.length - 1))
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'This is the custom color theme, you can tap on primary, '
              'secondary or tertiary colors, plus their container colors to '
              'change them.',
              // TODO(rydmike): Removed tone hover indication feature 16.3.2023.
              //'\n'
              // ignore: lines_longer_than_80_chars
              // "${controller.useKeyColors ? 'Hover a color to highlight its tonal palette source color above. ' : ''}"
              // ignore: lines_longer_than_80_chars
              // "${showBlendInfo ? 'Surface blend is used, it modifies surface and background colors, they may not be found in palettes when hovered.' : '\n'}",
              style: theme.textTheme.labelSmall,
            ),
          ),
        ShowInputColorsSwitch(controller: controller),
        const Divider(height: 1),
        const Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 8, 24, 0),
          child: Text(
            'Adjust the none seeded ColorScheme',
            style: TextStyle(fontSize: 13),
          ),
        ),
        EnumPopupMenu<FlexFixedColorStyle>(
          enabled: controller.useFlexColorScheme && !controller.useKeyColors,
          values: FlexFixedColorStyle.values,
          title: const Text('Fixed and FixedDim color style'),
          subtitleReveal: const Text(
            'This setting applies when not using a seed generated color '
            'scheme. '
            'It offers three styles. FCS computed fixed and fixedDim style, '
            'these are not seed generated in HCT color space. Alternatively '
            'two different seed generated versions can be used, the first one '
            'called seeded uses the same tones as the M3 spec. The second '
            'option uses tone that create fixed and fixedDim colors that '
            'are brighter and have  more contrast.\n'
            '\n'
            'Fixed and fixed dim colors are used for colors that have '
            'the same value in light and dark mode.\n',
          ),
          value: controller.fixedColorStyle,
          onChanged: controller.setFixedColorStyle,
        ),
        const Divider(height: 1),
        const Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 8, 24, 0),
          child: Text(
            'Adjust the seeded ColorScheme',
            style: TextStyle(fontSize: 13),
          ),
        ),
        SwitchListTileReveal(
          enabled: controller.useFlexColorScheme &&
              controller.useKeyColors &&
              isLight,
          title: const Text('Expressive onColors on containers in light mode'),
          subtitleReveal: const Text(
            'Use tone 30 instead of 10 for onColors on containers in light '
            'mode. This is a new Material-3 spec standard. It is more color '
            'expressive, but reduces contrast.\n'
            '\n'
            'It is not yet used by Flutter SDK in ColorScheme.fromSeed '
            'produced color schemes, but will be when Flutter upgrades to '
            'Material Color Utilities 0.12.0. You can opt in on using it '
            'already here, or decide to not use it, even after it becomes '
            'a forced default in Flutter SDK.\n'
            '\n'
            'For MCU seed generated schemes this only has any impact when '
            'contrast level is at the default value (0).\n',
          ),
          value: controller.expressiveOnContainer,
          onChanged: controller.setExpressiveOnContainer,
        ),
        const Divider(height: 1),
        ListTileReveal(
          dense: true,
          title: !controller.useKeyColors || _isFlutterScheme
              ? const Text('Additional adjustments available '
                  'when FSS FlexTones scheme variants are used')
              : const Text('Adjust the FSS FlexTones seeded ColorScheme'),
          subtitleReveal: !controller.useKeyColors || _isFlutterScheme
              ? null
              : const Text('FSS FlexTones adjustments are separate for light '
                  'and dark mode, '
                  'except the higher contrast fixed and fixedDim option '
                  'that must be same so that fixed scheme colors in light and '
                  'dark mode remain "fixed" and identical.'),
        ),
        SwitchListTileReveal(
          enabled: controller.useKeyColors && !_isFlutterScheme,
          title: const Text('Higher contrast fixed and fixedDim'),
          subtitleReveal: const Text(
            'The seed generated fixed, onFixed, fixedDim and onFixedVariant '
            'color palette tones use 92, 6, 84, 12 instead Material-3 '
            'design specified 90, 10, 80, 30.\n',
          ),
          value: controller.higherContrastFixed,
          onChanged: controller.setHigherContrastFixed,
        ),
        if (isLight) ...<Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: SwitchListTileReveal(
                  contentPadding: paddingStartColumn,
                  enabled: controller.useKeyColors && !_isFlutterScheme,
                  title: const Text('Monochrome surfaces'),
                  subtitleReveal: const Text(
                    'All seed generated surface colors are pure greyscale with '
                    'no color tint.\n',
                  ),
                  value: controller.useMonoSurfacesLight,
                  onChanged: controller.setUseMonoSurfacesLight,
                ),
              ),
              Expanded(
                child: SwitchListTileReveal(
                  contentPadding: paddingEndColumn,
                  enabled: controller.useKeyColors && !_isFlutterScheme,
                  title: const Text('White surface'),
                  subtitleReveal: const Text(
                    'Surface color uses tone 100 which is '
                    'always white. You can add this modifier to any seed '
                    'generation strategy. Surface blends are applied after '
                    'this and will still mix in the blend color into surface, '
                    'using selected blend strategy and level.\n',
                  ),
                  value: controller.surfacesUseBWLight,
                  onChanged: controller.setSurfacesUseBWLight,
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: SwitchListTileReveal(
                  contentPadding: paddingStartColumn,
                  enabled: controller.useKeyColors && !_isFlutterScheme,
                  title: const Text('B&W main onColors'),
                  subtitleReveal: const Text(
                    'Main colors are primary, secondary, tertiary, '
                    'error, their container and fixed colors. Using black and '
                    'white as contrast colors on the main colors may improve '
                    'their contrast, it also makes them less color '
                    'expressive.\n',
                  ),
                  value: controller.onMainsUseBWLight,
                  onChanged: controller.setOnMainsUseBWLight,
                ),
              ),
              Expanded(
                child: SwitchListTileReveal(
                  contentPadding: paddingEndColumn,
                  enabled: controller.useKeyColors && !_isFlutterScheme,
                  title: const Text('B&W surface onColors'),
                  subtitleReveal: const Text(
                    'Surface on colors are onSurface, onSurfaceVariant and '
                    'onInverseSurface colors. Using black and white as '
                    'contrast colors on all surfaces will improve '
                    'the contrast.\n',
                  ),
                  value: controller.onSurfacesUseBWLight,
                  onChanged: controller.setOnSurfacesUseBWLight,
                ),
              ),
            ],
          ),
        ] else ...<Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: SwitchListTileReveal(
                  contentPadding: paddingStartColumn,
                  enabled: controller.useKeyColors && !_isFlutterScheme,
                  title: const Text('Monochrome surfaces'),
                  subtitleReveal: const Text(
                    'All seed generated surface colors are pure greyscale '
                    'with no color tint.\n',
                  ),
                  value: controller.useMonoSurfacesDark,
                  onChanged: controller.setUseMonoSurfacesDark,
                ),
              ),
              Expanded(
                child: SwitchListTileReveal(
                  contentPadding: paddingEndColumn,
                  enabled: controller.useKeyColors && !_isFlutterScheme,
                  title: const Text('Black surface'),
                  subtitleReveal: const Text(
                    'Surface uses tone 0, which is always '
                    'true black. You can add this modifier to any seed '
                    'generation strategy. Surface blends will still mix in '
                    'blend color into surface, using selected blend strategy '
                    'and level.\n',
                  ),
                  value: controller.surfacesUseBWDark,
                  onChanged: controller.setSurfacesUseBWDark,
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: SwitchListTileReveal(
                  contentPadding: paddingStartColumn,
                  enabled: controller.useKeyColors && !_isFlutterScheme,
                  title: const Text('B&W main onColors'),
                  subtitleReveal: const Text(
                    'Main colors are primary, secondary, tertiary, '
                    'error, their container and fixed colors. Using black and '
                    'white as onColors on the main colors may improve '
                    'contrast, it also makes the theme less color '
                    'expressive.\n',
                  ),
                  value: controller.onMainsUseBWDark,
                  onChanged: controller.setOnMainsUseBWDark,
                ),
              ),
              Expanded(
                child: SwitchListTileReveal(
                  contentPadding: paddingEndColumn,
                  enabled: controller.useKeyColors && !_isFlutterScheme,
                  title: const Text('B&W surface onColors'),
                  subtitleReveal: const Text(
                    'Surface onColors are onSurface, onSurfaceVariant and '
                    'onInverseSurface colors. Using black and white as '
                    'onColors on all surfaces may improve contrast.\n',
                  ),
                  value: controller.onSurfacesUseBWDark,
                  onChanged: controller.setOnSurfacesUseBWDark,
                ),
              ),
            ],
          ),
        ],
        const Divider(height: 1),
        ListTileReveal(
          dense: true,
          title: const Text('Adjust the MCU based seeded ColorScheme'),
          subtitle: !controller.useKeyColors || !_isFlutterScheme
              ? const Text(
                  'Use a MCU scheme variant to enable contrast level tuning')
              : const Text(
                  'Defined value is the same for light and dark mode.'),
          subtitleReveal: const Text('Please be aware that using any other '
              'contrast level than default (0) will make the fixed colors no '
              'longer confirm to the Material-3 design specification that says '
              'they should be the same color in light and dark mode.\n'
              '\n'
              'This is what the Material-3 accessibility contrast level '
              'adjustment does to them. It is probably not what you want for '
              'your design if you used them because they have the same color '
              'values in light and dark mode. This design is still most likely '
              'intentional, as the contrast level adjustment is designed to '
              'allow you to easily create an optional more accessible version '
              'of your theme by increasing the contrast. The '
              'fixed colors do not have very high contrast ratios, so they '
              'will need adjustment.\n'
              '\n'
              'When not using seeded color schemes or when using FSS FlexTones '
              'based seed generated schemes, you have an option to use '
              'higher contrast fixed colors, that are still fixed and same '
              'in light and dark mode.\n'),
        ),
        ListTileSlider(
          enabled: controller.useKeyColors && _isFlutterScheme,
          title: const Text('Contrast level'),
          subtitle:
              const Text('Levels in M3 guide 0: Normal, 0.5: Medium, 1: High'),
          min: -1,
          max: 1,
          divisions: 8,
          valueDecimals: 2,
          value: controller.useKeyColors && _isFlutterScheme
              ? controller.dynamicContrastLevel
              : 0,
          onChanged: controller.setDynamicContrastLevel,
          sliderLabel: 'Contrast',
        ),

        // TODO(rydmike): Removed 29.7.2023, maybe bring back the feature in V8.
        //   Ned a way to make this work, we need colors in keys!
        //
        // if (!isLight && controller.schemeIndex ==
        // (AppColor.schemes.length - 1))
        //   SwitchListTileReveal(
        //       dense: true,
        //      title: const Text('Custom dark scheme uses its own key colors'),
        //       subtitle: const Text(
        //         'Turn ON to use its dark input colors as seed keys for the '
        //         'dark theme. This option is only available when using a '
        //         'custom dark scheme.\n',
        //       ),
        //       value: controller.useDarkColorsForSeed &&
        //           controller.useKeyColors &&
        //           controller.schemeIndex == AppColor.schemes.length - 1,
        //       onChanged: controller.useKeyColors &&
        //               controller.schemeIndex == AppColor.schemes.length - 1
        //           ? controller.setUseDarkColorsForSeed
        //           : null),
      ],
    );
  }
}
