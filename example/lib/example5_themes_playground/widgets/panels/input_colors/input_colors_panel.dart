import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/examples/input_colors_popup_menu.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/switch_list_tile_reveal.dart';
import '../../shared/custom_uses_dark_colors_for_seed_switch.dart';
import '../../shared/show_input_colors_switch.dart';
import '../../shared/theme_mode_switch_list_tile.dart';
import '../../shared/use_seeded_color_scheme_switch.dart';
import 'custom_theme_controls.dart';
import 'show_input_colors.dart';
import 'used_colors_popup_menu.dart';

class InputColorsPanel extends StatelessWidget {
  const InputColorsPanel(
    this.controller, {
    super.key,
  });
  final ThemeController controller;

  static final Uri _fcsDocSchemeReference = Uri(
    scheme: 'https',
    host: 'docs.flexcolorscheme.com',
    path: 'scheme_reference',
  );

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle spanTextStyle = theme.textTheme.bodySmall!;
    final TextStyle linkStyle = theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primary, fontWeight: FontWeight.bold);
    final bool isLight = theme.brightness == Brightness.light;
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        ThemeModeSwitchListTile(controller: controller),
        InputColorsPopupMenu(controller: controller),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
          child: ShowInputColors(controller: controller),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Text(
            'Tap a color code to copy it to the clipboard.',
            style: denseBody,
          ),
        ),
        ShowInputColorsSwitch(controller: controller),
        const Divider(),
        CustomThemeControls(controller: controller),
        const Divider(),
        const ListTile(
          title: Text('Color modifiers'),
          // subtitleDense: true,
          subtitle: Text('Modifiers change how the input colors '
              'are used to create the effective ColorScheme'),
        ),
        SwitchListTileReveal(
          enabled: controller.useFlexColorScheme && !controller.useKeyColors,
          title: const Text('Use Material 3 error colors'),
          subtitleReveal: const Text(
              'Override scheme defined used legacy M2 error '
              'colors and use M3 error colors instead. This applies when not '
              'using seeded ColorSchemes. Seed generated ColorSchemes always '
              'use M3 error colors. Newer built-in schemes also use the M3 '
              'error colors by default, this setting has no impact on '
              'them. For the custom scheme, to use a custom error color, turn '
              'OFF use Material 3 error colors.\n'),
          value: controller.useM3ErrorColors &&
              controller.useFlexColorScheme &&
              !controller.useKeyColors,
          onChanged: controller.useFlexColorScheme && !controller.useKeyColors
              ? controller.setUseM3ErrorColors
              : null,
        ),
        UsedColorsPopupMenu(
          title: const Text('Used input colors'),
          index: controller.usedColors,
          onChanged:
              controller.useFlexColorScheme ? controller.setUsedColors : null,
        ),
        SwitchListTileReveal(
          title: const Text('Swap secondary and tertiary legacy colors in M3'),
          subtitleReveal: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'Only applies when using Material-3 mode and only to '
                      'older built-in FCS Material-2 designed schemes that '
                      'benefit from this swap for a better fit with the '
                      'Material-3 color system design intent.\n'
                      '\n'
                      'Prefer ON when using Material-3 and legacy FCS color '
                      'schemes to get a scheme result in-line with the '
                      'Material-3 color system design expectations. '
                      'You can keep it OFF if this '
                      'is not important to your design. When using a seed '
                      'generated ColorScheme, especially if you do not use '
                      'the secondary color as a seed key color, you can keep '
                      'this setting OFF.\n'
                      '\n'
                      'Typically schemes that have tertiary colors that are '
                      'closer in Hue to the primary color than the secondary '
                      'color, will benefit from this swap. '
                      'Some FCS schemes created originally for Material-2 '
                      'color system design fall into this category.\n'
                      '\n'
                      'The ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsDocSchemeReference,
                  text: 'FlexColorScheme scheme reference page',
                ),
                // _fcsChipUmbrellaIssue115364
                TextSpan(
                  style: spanTextStyle,
                  text: ' shows which ones do so. It also documents with which '
                      'originally for Material-2 designed schemes, you '
                      'should avoid using the secondary color as a seed key '
                      'color when generating a ColorScheme with the scheme. '
                      'This in case you want a resulting ColorScheme that '
                      'adheres stringently to the Material-3 color system '
                      'design intent.\n',
                ),
              ],
            ),
          ),
          value: controller.swapLegacyColorsInM3 && controller.useMaterial3,
          onChanged: controller.useMaterial3
              ? controller.setSwapLegacyColorsInM3
              : null,
        ),
        if (isLight)
          SwitchListTileReveal(
            title: const Text('Swap light primary and secondary'),
            subtitleReveal: const Text(
              'Swap primary and secondary, and their container colors. '
              'The above legacy M3 mode secondary and tertiary swap is done '
              'first, if it is enabled.\n',
            ),
            value: controller.swapPrimaryAndSecondaryLightColors &&
                controller.useFlexColorScheme,
            onChanged: controller.useFlexColorScheme
                ? controller.setSwapPrimaryAndSecondaryLightColors
                : null,
          )
        else
          SwitchListTileReveal(
            title: const Text('Swap dark primary and secondary'),
            subtitleReveal: const Text(
              'Swap primary and secondary, and their container colors. '
              'The above legacy M3 mode secondary and tertiary swap is done '
              'first, if it is enabled.\n',
            ),
            value: controller.swapPrimaryAndSecondaryDarkColors &&
                controller.useFlexColorScheme,
            onChanged: controller.useFlexColorScheme
                ? controller.setSwapPrimaryAndSecondaryDarkColors
                : null,
          ),
        Visibility(
          visible: !isLight,
          child: Column(
            children: <Widget>[
              SwitchListTileReveal(
                title: const Text('Compute dark theme'),
                subtitleReveal:
                    const Text('Compute dark theme from light color '
                        'values, instead of using predefined dark colors.\n'),
                value: controller.useToDarkMethod &&
                    controller.useFlexColorScheme &&
                    !controller.useKeyColors,
                onChanged:
                    controller.useFlexColorScheme && !controller.useKeyColors
                        ? controller.setUseToDarkMethod
                        : null,
              ),
              SwitchListTileReveal(
                title: const Text('Computed dark swaps main and container'),
                subtitleReveal: const Text('Recommend to turn this ON. When '
                    'swapped, you can often use them as they are with no '
                    'white blend level, especially if the light colors '
                    'use M3 design intent.\n'),
                value: controller.toDarkSwapPrimaryAndContainer &&
                    controller.useToDarkMethod &&
                    controller.useFlexColorScheme &&
                    !controller.useKeyColors,
                onChanged: controller.useToDarkMethod &&
                        controller.useFlexColorScheme &&
                        !controller.useKeyColors
                    ? controller.setToDarkSwapPrimaryAndContainer
                    : null,
              ),
              ListTileReveal(
                enabled: controller.useToDarkMethod &&
                    controller.useFlexColorScheme &&
                    !controller.useKeyColors,
                title: const Text('White blend level'),
                subtitleReveal:
                    const Text('Adjust white blend level to desaturate '
                        'the the light mode colors to make them work better in '
                        'your dark theme\n'),
              ),
              ListTile(
                title: Slider(
                  max: 100,
                  divisions: 100,
                  label: controller.toDarkMethodLevel.toString(),
                  value: controller.toDarkMethodLevel.toDouble(),
                  onChanged: controller.useToDarkMethod &&
                          controller.useFlexColorScheme &&
                          !controller.useKeyColors
                      ? (double value) {
                          controller.setToDarkMethodLevel(value.floor());
                        }
                      : null,
                ),
                trailing: Padding(
                  padding: const EdgeInsetsDirectional.only(end: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'LEVEL',
                        style: theme.textTheme.bodySmall,
                      ),
                      Text(
                        '${controller.toDarkMethodLevel} %',
                        style: theme.textTheme.bodySmall!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const ListTile(
          dense: true,
          subtitle: Text('See ColorScheme for more seed generation settings'),
        ),
        UseSeededColorSchemeSwitch(controller: controller),
        CustomUsesDarkColorsForSeedSwitch(controller: controller),
        const SizedBox(height: 8),
      ],
    );
  }
}
