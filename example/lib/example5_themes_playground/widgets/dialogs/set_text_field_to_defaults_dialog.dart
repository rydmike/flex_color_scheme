import 'package:flutter/material.dart';

import '../../../shared/const/app.dart';

/// Dialog to confirm if user wants to set TextField to Playground defaults.
class SetTextFieldToDefaultsDialog extends StatelessWidget {
  const SetTextFieldToDefaultsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Set TextField to Defaults?'),
      content: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: App.maxAlertDialogWidth),
        child: const Text('Set the text field settings back to the '
            "Playground's default values?"),
      ),
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
            child: const Text('Set to defaults')),
      ],
    );
  }
}
