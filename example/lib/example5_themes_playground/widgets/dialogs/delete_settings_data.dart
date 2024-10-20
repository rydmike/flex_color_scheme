import 'package:flutter/material.dart';

/// Dialog to confirm if user wants to delete all Playground settings data.
class DeleteSettingsDataDialog extends StatelessWidget {
  const DeleteSettingsDataDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Delete stored settings'),
      content: const Text('Delete all stored settings data?\n'
          'All persisted theme settings in local storage will be deleted!\n'
          '\n'
          'This is useful for purging all keys from the local storage\n'
          'including any invalid keys from older Playground versions or\n'
          'invalid data inserted via invalid JSON import keys.\n'),
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
            child: const Text('DELETE')),
      ],
    );
  }
}
