import 'package:flutter/material.dart';

import '../../../shared/const/app.dart';

/// Dialog to confirm if user wants to reset the current FlexColorscheme setup.
class ResetSettingsDialog extends StatelessWidget {
  const ResetSettingsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Reset Theme Config?'),
      content: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: App.maxAlertDialogWidth),
        child: const Text('Reset all theme configuration settings back to '
            'their default values?\n'
            '\n'
            'Persisted theme settings will also be updated to default values. '
            'Your custom theme colors will not be reset.'),
      ),
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
