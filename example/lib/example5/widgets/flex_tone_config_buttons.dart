import 'package:flutter/material.dart';

import '../../shared/controllers/theme_controller.dart';

// Widget used to change usage of flex tones configuration for
// color scheme generation in example 5.
class FlexToneConfigButtons extends StatelessWidget {
  const FlexToneConfigButtons({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final List<bool> isSelected = <bool>[
      controller.usedFlexToneSetup == 1,
      controller.usedFlexToneSetup == 2,
      controller.usedFlexToneSetup == 3,
      controller.usedFlexToneSetup == 4,
    ];
    return ToggleButtons(
      isSelected: isSelected,
      onPressed: controller.useFlexColorScheme &&
              controller.useSubThemes &&
              controller.useKeyColors
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
          message: 'High contrast tones',
          child: Icon(Icons.looks_4),
        ),
      ],
    );
  }
}
