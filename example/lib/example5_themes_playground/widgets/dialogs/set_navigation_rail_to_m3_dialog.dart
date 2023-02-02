import 'package:flutter/material.dart';

/// Dialog to confirm if user wants to set NavigationRail to M3 defaults.
class SetNavigationRailToM3Dialog extends StatelessWidget {
  const SetNavigationRailToM3Dialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Set NavigationRail To Material 3'),
      content: const Text('Set the navigation rail settings to values that '
          'match Material 3 default style?'),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('Cancel')),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text('Set to M3')),
      ],
    );
  }
}
