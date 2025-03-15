import 'package:flutter/material.dart';

import '../../../../shared/const/app_color.dart';
import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../dialogs/copy_scheme_to_custom_dialog.dart';
import '../../dialogs/reset_custom_colors_dialog.dart';

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
          ListTileReveal(
            title: const Text('Use custom colors?'),
            subtitleReveal: const Text('The last color set in the Themes '
                'Playground is customizable. This command just moves you '
                'to it and is here to make it easier to discover this '
                'feature\n'),
            trailing: FilledButton(
              onPressed: () async {
                controller.setSchemeIndex(AppColor.schemes.length - 1);
              },
              child: const Text('Custom'),
            ),
            onTap: () {
              controller.setSchemeIndex(AppColor.schemes.length - 1);
            },
          ),
          ListTileReveal(
            title: const Text('Copy these colors to the custom colors?'),
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
            title: Text('Custom colors used'),
            subtitle: Text('Tap on the colors to modify them. You '
                'can copy/paste values to and from the color picker. It is '
                'always the input colors that are modified, not the '
                'resulting colors after applied color modifiers'),
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
      ],
    );
  }
}
