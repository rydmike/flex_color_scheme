import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/nullable_bool_toggle_buttons.dart';

class ChipBlendColorsToggleButtons extends StatelessWidget {
  const ChipBlendColorsToggleButtons({
    super.key,
    required this.controller,
    this.contentPadding,
  });
  final ThemeController controller;

  /// The [ListTile]'s internal padding.
  ///
  /// Insets a [ListTile]'s contents.
  ///
  /// If null, `EdgeInsets.symmetric(horizontal: 16.0)` is used in M2
  /// and `EdgeInsetsDirectional.only(start: 16.0, end: 24.0)` in M3.
  final EdgeInsetsGeometry? contentPadding;

  String _explainLabelStyle(final bool? value) {
    switch (value) {
      case true:
        return 'Always blend (true)';
      case false:
        return 'Never blend (false)';
      case null:
        return 'Blend in M2, do not blend in M3 (null)';
    }
  }

  @override
  Widget build(BuildContext context) {
    // The most common logic for enabling Playground controls.
    final bool enableControl =
        controller.useSubThemes && controller.useFlexColorScheme;

    return ListTileReveal(
      contentPadding: contentPadding,
      enabled: controller.useFlexColorScheme && controller.useSubThemes,
      title: const Text('Blend chip color'),
      subtitle: Text(_explainLabelStyle(controller.chipBlendColors)),
      subtitleReveal: const Text(
        'When true, the selected chip color is '
        'blended with surface color using a fixed alpha blend value. It '
        'also creates a blended Selected chip color, if it has not been '
        'defined using the selected Chip color by also blending it with '
        'surface color, but using a higher alpha blend value.\n'
        '\n'
        'If not defined, default to true in Material-2 mode and to false '
        ' in Material-3 mode.\n'
        '\n'
        'The blended style option was added to give more styling options '
        'that also work within the constraints of the current Chip theming '
        'limitations. See known issues further below for more info.\n',
      ),
      trailing: Padding(
        padding: const EdgeInsetsDirectional.only(end: 2.0),
        child: NullableBoolToggleButtons(
          value: enableControl ? controller.chipBlendColors : null,
          onChanged: enableControl ? controller.setChipBlendColors : null,
        ),
      ),
      onTap: () {
        if (controller.chipBlendColors == false) {
          controller.setChipBlendColors(null);
        } else if (controller.chipBlendColors == null) {
          controller.setChipBlendColors(true);
        } else {
          controller.setChipBlendColors(false);
        }
      },
    );
  }
}
