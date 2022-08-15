import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';

// TODO(rydmike): Remove this widget in example 5 in future release 6.0.0.
// Widget used to change usage of flex tones configuration for
// color scheme generation in example 5.
//
// In version 5.2.0 of FlexColorScheme and its example 5, this widget is
// no longer used, but keeping it around for a while.
class FlexToneConfigButtons extends StatelessWidget {
  const FlexToneConfigButtons({super.key, required this.controller});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final List<bool> isSelected = <bool>[
      controller.usedFlexToneSetup == 1,
      controller.usedFlexToneSetup == 2,
      controller.usedFlexToneSetup == 3,
      controller.usedFlexToneSetup == 4,
      controller.usedFlexToneSetup == 5,
    ];
    return ToggleButtons(
      isSelected: isSelected,
      onPressed: controller.useKeyColors
          ? (int index) {
              controller.setUsedFlexToneSetup(index + 1);
            }
          : null,
      children: const <Widget>[
        Tooltip(
          message: 'Material 3 tones',
          child: Icon(Icons.looks_one),
        ),
        Tooltip(
          message: 'Soft tones',
          child: Icon(Icons.looks_two),
        ),
        Tooltip(
          message: 'Vivid tones',
          child: Icon(Icons.looks_3),
        ),
        Tooltip(
          message: 'Vivid surfaces tones',
          child: Icon(Icons.looks_4),
        ),
        Tooltip(
          message: 'High contrast tones',
          child: Icon(Icons.looks_5),
        ),
      ],
    );
  }
}
