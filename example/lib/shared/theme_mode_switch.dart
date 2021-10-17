import 'package:flutter/material.dart';

/// Widget used to toggle the theme mode of the default example application.
class ThemeModeSwitch extends StatelessWidget {
  const ThemeModeSwitch({
    Key? key,
    required this.themeMode,
    required this.onChanged,
  }) : super(key: key);
  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onChanged;

  @override
  Widget build(BuildContext context) {
    final List<bool> isSelected = <bool>[
      themeMode == ThemeMode.light,
      themeMode == ThemeMode.system,
      themeMode == ThemeMode.dark,
    ];
    return ToggleButtons(
      isSelected: isSelected,
      onPressed: (int newIndex) {
        if (newIndex == 0) {
          onChanged(ThemeMode.light);
        } else if (newIndex == 1) {
          onChanged(ThemeMode.system);
        } else {
          onChanged(ThemeMode.dark);
        }
      },
      children: const <Widget>[
        Icon(Icons.wb_sunny),
        Icon(Icons.phone_iphone),
        Icon(Icons.bedtime),
      ],
    );
  }
}
