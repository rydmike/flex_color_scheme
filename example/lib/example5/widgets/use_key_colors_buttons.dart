import 'package:flutter/material.dart';

import '../../shared/controllers/theme_controller.dart';

// Widget used to change usage of key colors for colorscheme generation
// in example 5.
class UseKeyColorsButtons extends StatelessWidget {
  const UseKeyColorsButtons({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final List<bool> isSelected = <bool>[
      controller.useKeyColors,
      controller.useSecondary && controller.useKeyColors,
      controller.useTertiary && controller.useKeyColors,
    ];
    return ToggleButtons(
      isSelected: isSelected,
      onPressed: controller.useFlexColorScheme
          ? (int index) {
              if (index == 0) {
                controller.setUseKeyColors(!controller.useKeyColors);
              }
              if (index == 1 && controller.useKeyColors) {
                controller.setUseSecondary(!controller.useSecondary);
              }
              if (index == 2 && controller.useKeyColors) {
                controller.setUseTertiary(!controller.useTertiary);
              }
            }
          : null,
      children: <Widget>[
        const Tooltip(
          message: 'Use input Primary color\n'
              'as key to seed your ColorScheme',
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('Primary', style: TextStyle(fontSize: 12)),
          ),
        ),
        Visibility(
          visible: controller.useKeyColors,
          maintainSize: true,
          maintainState: true,
          maintainAnimation: true,
          child: const Tooltip(
            message: 'Use input Secondary color\n'
                'as key to seed your ColorScheme',
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('Secondary', style: TextStyle(fontSize: 12)),
            ),
          ),
        ),
        Visibility(
          visible: controller.useKeyColors,
          maintainSize: true,
          maintainState: true,
          maintainAnimation: true,
          child: const Tooltip(
            message: 'Use input Tertiary color\n'
                'as key to seed your ColorScheme',
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('Tertiary', style: TextStyle(fontSize: 12)),
            ),
          ),
        ),
      ],
    );
  }
}
