import 'package:flutter/material.dart';

/// Dialog to confirm if user wants to reset the current FlexColorscheme setup.
class ResetSettingsDialog extends StatelessWidget {
  const ResetSettingsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Reset theme settings'),
      content: const Text('Reset all theme settings back to their default '
          'values? Persisted theme settings will also be updated to default '
          'values. Your custom theme colors will not be reset.'),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('CANCEL')),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text('RESET')),
      ],
    );
  }
}
