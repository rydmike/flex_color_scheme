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
      controller.usedFlexTonesSetup == 1,
      controller.usedFlexTonesSetup == 2,
      controller.usedFlexTonesSetup == 3,
      controller.usedFlexTonesSetup == 4,
    ];
    return ToggleButtons(
      isSelected: isSelected,
      onPressed: controller.useFlexColorScheme && controller.useSubThemes
          ? (int index) {
              controller.setUsedFlexTonesSetup(index + 1);
            }
          : null,
      children: const <Widget>[
        Tooltip(
          message: 'Default Material 3 muted soft tones',
          child: Icon(Icons.looks_one),
        ),
        Tooltip(
          message: 'Darker primary and more vivid secondary and tertiary',
          child: Icon(Icons.looks_two),
        ),
        Tooltip(
          message: 'Message',
          child: Icon(Icons.looks_3),
        ),
        Tooltip(
          message: 'Message',
          child: Icon(Icons.looks_4),
        ),
      ],
    );
  }
}
