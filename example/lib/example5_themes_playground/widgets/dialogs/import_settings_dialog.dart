import 'package:flutter/material.dart';

import '../../../shared/const/app.dart';

/// Dialog to confirm if user wants to import a Playground setup.
class ImportSettingsDialog extends StatelessWidget {
  const ImportSettingsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Import Playground Settings?'),
      content: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: App.maxAlertDialogWidth),
        child: const Text('Import the settings from the staging area?\n'
            '\n'
            'You current configuration will be overwritten and replaced '
            'with the JSON settings from the staging area!'),
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
            child: const Text('IMPORT')),
      ],
    );
  }
}
