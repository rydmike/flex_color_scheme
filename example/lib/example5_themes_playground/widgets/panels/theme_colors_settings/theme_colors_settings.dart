import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../shared/const/app_color.dart';
import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/theme_mode_switch.dart';
import '../../dialogs/copy_scheme_to_custom_dialog.dart';
import '../../dialogs/reset_custom_colors_dialog.dart';
import '../../shared/use_seeded_color_scheme_switch.dart';
import 'input_colors_popup_menu.dart';
import 'show_input_colors.dart';
import 'used_colors_popup_menu.dart';

class ThemeColorsSettings extends StatelessWidget {
  const ThemeColorsSettings(
    this.controller, {
    super.key,
  });
  final ThemeController controller;

  Future<void> _handleCopySchemeTap(BuildContext context) async {
    final bool? copy = await showDialog<bool?>(
      context: context,
      builder: (BuildContext context) {
        return const CopySchemeToCustomDialog();
      },
    );
    if (copy ?? false) {
      // Copy scheme to custom scheme, by setting custom scheme
      // to scheme of current scheme index.
      controller.setCustomScheme(AppColor.scheme(controller));
      // After copy, set input colors to the custom one so user can edit it.
      controller.setSchemeIndex(AppColor.schemes.length - 1);
    }
  }

  Future<void> _handleResetSchemeTap(BuildContext context) async {
    final bool? reset = await showDialog<bool?>(
      context: context,
      builder: (BuildContext context) {
        return const ResetCustomColorsDialog();
      },
    );
    if (reset ?? false) {
      await controller.resetCustomColorsToDefaults();
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        ListTile(
          title: const Text('Theme mode'),
          subtitle: Text('Theme ${controller.themeMode.name}'),
          trailing: ThemeModeSwitch(
            themeMode: controller.themeMode,
            onChanged: controller.setThemeMode,
          ),
          // Toggle theme mode also via the ListTile tap.
          onTap: () {
            if (theme.brightness == Brightness.light) {
              controller.setThemeMode(ThemeMode.dark);
            } else {
              controller.setThemeMode(ThemeMode.light);
            }
          },
        ),
        InputColorsPopupMenu(controller: controller),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
          child: ShowInputColors(controller: controller),
        ),
        if (controller.schemeIndex !=
            (AppColor.schemes.length - 1)) ...<Widget>[
          ListTile(
            title: const Text('Use a custom theme?'),
            subtitle: const Text('Tap here to active the customizable theme. '
                'If you tap a color code above, it is copied it to the '
                'clipboard.'),
            onTap: () {
              controller.setSchemeIndex(AppColor.schemes.length - 1);
            },
          ),
          ListTile(
            title: const Text('Copy above colors to the customizable theme'),
            subtitle: const Text('This theme then becomes a starting template '
                'for your own custom theme.'),
            trailing: FilledButton(
              onPressed: () async {
                await _handleCopySchemeTap(context);
              },
              child: const Text('Copy'),
            ),
            onTap: () async {
              await _handleCopySchemeTap(context);
            },
          )
        ] else ...<Widget>[
          const ListTile(
            title: Text('This theme is customizable!'),
            subtitle: Text('Tap on the colors above to modify them with a '
                'color picker. You can copy/paste values to and from the '
                'color picker.'),
          ),
          ListTile(
            title: const Text('Reset the custom theme to its default colors?'),
            trailing: FilledButton(
              onPressed: () async {
                await _handleResetSchemeTap(context);
              },
              child: const Text('Reset'),
            ),
          )
        ],
        const Divider(),
        const ListTile(
          title: Text('Theme Color Modifiers'),
          subtitle: Text('Use the modifiers below to change how the input '
              "scheme colors are used to define the effective theme's "
              'ColorScheme.'),
        ),
        SwitchListTile(
          dense: true,
          title: const Text('Show scheme input color values'),
          subtitle: const Text(
              'Turn ON this option to show the FlexColorScheme scheme '
              'input color values. This shows the used color values '
              'before any input modifiers are used on them. This includes seed '
              'generation, swapping legacy colors, swapping primary and '
              'secondary colors, seed generation, input color limiters, '
              'computed dark theme and using M3 error colors on legacy '
              'M2 schemes. In older versions the scheme input color '
              'values were always shown. This may be confusing and they '
              'are now hidden by default. Showing them may be useful to '
              'understand how the scheme defined input colors are '
              'being modified by input modifiers, but it is cluttered. '
              'If ON, scheme input color values show the colors before '
              'input modifiers, and the surrounding '
              "color is the effective theme's ColorScheme."),
          value: controller.showSchemeInput,
          onChanged: controller.setShowSchemeInput,
        ),
        UseSeededColorSchemeSwitch(controller: controller),
        SwitchListTile(
          title: const Text('Use Material 3 error colors'),
          subtitle: const Text('Override default M2 error colors and use M3 '
              'error colors, when not using seeded ColorSchemes. Seed '
              'generated ColorSchemes always use M3 error colors.'),
          value: controller.useM3ErrorColors &&
              controller.useFlexColorScheme &&
              !controller.useKeyColors,
          onChanged: controller.useFlexColorScheme && !controller.useKeyColors
              ? controller.setUseM3ErrorColors
              : null,
        ),
        UsedColorsPopupMenu(
          title: const Text('Change amount of used scheme input colors'),
          index: controller.usedColors,
          onChanged:
              controller.useFlexColorScheme ? controller.setUsedColors : null,
        ),
        SwitchListTile(
          title: const Text('When using Material 3 swap secondary '
              'and tertiary'),
          subtitle: const Text(
            'Only applies to built-in M2 designed schemes that benefit from '
            'it. Prefer ON when using M3. You can also use OFF when using '
            'seeded ColorScheme without enabling secondary seed key.',
          ),
          value: controller.swapLegacyColors && controller.useMaterial3,
          onChanged:
              controller.useMaterial3 ? controller.setSwapLegacyColors : null,
        ),
        if (isLight)
          SwitchListTile(
            title: const Text('Light theme swap primary and secondary'),
            subtitle: const Text(
              'Swap primary and secondary, and their container colors. '
              'Material 3 mode secondary and tertiary swap, is done '
              'first when used.',
            ),
            value: controller.swapLightColors && controller.useFlexColorScheme,
            onChanged: controller.useFlexColorScheme
                ? controller.setSwapLightColors
                : null,
          )
        else
          SwitchListTile(
            title: const Text('Dark theme swap primary and secondary'),
            subtitle: const Text(
              'Swap primary and secondary, and their container colors. '
              'Material 3 mode secondary and tertiary swap, is done '
              'first when used.',
            ),
            value: controller.swapDarkColors && controller.useFlexColorScheme,
            onChanged: controller.useFlexColorScheme
                ? controller.setSwapDarkColors
                : null,
          ),
        Visibility(
          visible: !isLight,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: Column(
            children: <Widget>[
              SwitchListTile(
                title: const Text('Compute dark theme'),
                subtitle: const Text('Compute dark theme from light color '
                    'values, instead of using predefined dark colors.'),
                value: controller.useToDarkMethod &&
                    controller.useFlexColorScheme &&
                    !controller.useKeyColors,
                onChanged:
                    controller.useFlexColorScheme && !controller.useKeyColors
                        ? controller.setUseToDarkMethod
                        : null,
              ),
              SwitchListTile(
                title: const Text('Computed dark swaps main and container'),
                subtitle: const Text('If swapped, you can often use them '
                    'as they are with no white blend level, if light colors '
                    'use M3 design intent.'),
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
              ListTile(
                title: Slider(
                  max: 100,
                  divisions: 100,
                  label: controller.darkMethodLevel.toString(),
                  value: controller.darkMethodLevel.toDouble(),
                  onChanged: controller.useToDarkMethod &&
                          controller.useFlexColorScheme &&
                          !controller.useKeyColors
                      ? (double value) {
                          controller.setDarkMethodLevel(value.floor());
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
                        '${controller.darkMethodLevel} %',
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
        const SizedBox(height: 8),
      ],
    );
  }
}
