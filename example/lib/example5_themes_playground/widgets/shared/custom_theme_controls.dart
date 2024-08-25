import 'package:flutter/material.dart';

import '../../../shared/const/app_color.dart';
import '../../../shared/controllers/theme_controller.dart';
import '../../../shared/widgets/universal/list_tile_reveal.dart';
import '../dialogs/copy_scheme_to_custom_dialog.dart';
import '../dialogs/reset_custom_colors_dialog.dart';
import 'show_input_colors_switch.dart';

class CustomThemeControls extends StatelessWidget {
  const CustomThemeControls({super.key, required this.controller});
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (controller.schemeIndex !=
            (AppColor.schemes.length - 1)) ...<Widget>[
          ListTile(
            title: const Text('Use custom colors?'),
            subtitle: const Text('Tap here to active customizable colors'),
            onTap: () {
              controller.setSchemeIndex(AppColor.schemes.length - 1);
            },
          ),
          ListTileReveal(
            title: const Text('Copy these colors to the customizable scheme?'),
            subtitleReveal: const Text('When you copy a built-in color scheme '
                'to the customizable ones, it becomes a starting point '
                'for your own custom colors. Note that it is always '
                'the input colors that are copied, not the effective '
                'colors after modifiers. Modifiers are also applied to '
                'custom colors when used. To see the input colors, '
                'enable the option to show them below\n'),
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
            title: Text('These colors are customizable'),
            subtitle: Text('Tap on the main colors above to modify them. You '
                'can copy/paste values to and from the color picker. It is '
                'always the input colors that are modified, not the '
                'resulting colors after effective color modifiers'),
          ),
          ListTile(
            title: const Text('Reset custom colors to their defaults?'),
            trailing: FilledButton(
              onPressed: () async {
                await _handleResetSchemeTap(context);
              },
              child: const Text('Reset'),
            ),
            onTap: () async {
              await _handleResetSchemeTap(context);
            },
          )
        ],
        ShowInputColorsSwitch(controller: controller),
      ],
    );
  }
}
