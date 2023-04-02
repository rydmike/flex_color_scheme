import 'package:flutter/material.dart';

/// Dialog to confirm if user wants to set NavigationBar to M3 defaults.
class SetNavigationBarToM3Dialog extends StatelessWidget {
  const SetNavigationBarToM3Dialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Set NavigationBar To Material 3'),
      content: const Text('Set the navigation bar settings to values that '
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
