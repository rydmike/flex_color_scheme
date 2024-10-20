import 'package:flutter/material.dart';

/// Dialog to confirm if user wants to set theme to a premade setup.
class SetThemeToPremadeDialog extends StatelessWidget {
  const SetThemeToPremadeDialog({super.key, required this.selectedOption});
  final String selectedOption;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Use "$selectedOption" theme?'),
      content: const Text('Your current configuration will be overwritten, '
          'but custom colors will be kept.'),
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
            child: const Text('Use theme')),
      ],
    );
  }
}
