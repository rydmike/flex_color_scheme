import 'package:flutter/material.dart';

/// Dialog to confirm if user wants to reset the current FlexColorscheme setup.
class ResetSettingsDialog extends StatelessWidget {
  const ResetSettingsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Reset Theme Settings'),
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
      // Add some padding to the action buttons, they are so close the
      // dialog edge without it.
      // Can't theme the padding in the dialog to something nicer, not yet!
      // I've seen it mentioned that it is coming, since M3 has more
      // default padding in its specs.
      actionsPadding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }
}
