import 'package:flutter/material.dart';

import '../../../shared/const/app.dart';

/// Dialog to confirm if user wants to set TextField to Outlined example.
class SetTextFieldToOutlinedDialog extends StatelessWidget {
  const SetTextFieldToOutlinedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Set TextField to Colored Outlined?'),
      content: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: App.maxAlertDialogWidth),
        child: const Text('Set the text field settings to an example '
            'using colored outlined border?'),
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
            child: const Text('Set to outlined')),
      ],
    );
  }
}
