import 'package:flutter/material.dart';

import '../../../shared/const/app.dart';

/// Dialog to confirm if user wants to delete all Playground settings data.
class DeleteSettingsDataDialog extends StatelessWidget {
  const DeleteSettingsDataDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Delete Stored Settings?'),
      content: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: App.maxAlertDialogWidth),
        child: const Text('All persisted theme settings in local '
            'storage will be deleted!\n'
            '\n'
            'This is useful for purging all keys from the local storage '
            'including any invalid keys from older Playground versions or '
            'invalid data inserted via invalid JSON import keys. There are '
            'checks to prevent invalid JSON keys from being imported.\n'
            '\n'
            'This is a way to clean up the local storage and remove '
            'legacy no longer used keys stored in it. You rarely need '
            'to use this feature, but if you do it before you start a new '
            'fresh configuration, you may get a shorter more '
            'compact JSON settings export, as it wont included any stored '
            'values that are not used in the effective config.'),
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
            child: const Text('DELETE')),
      ],
    );
  }
}
