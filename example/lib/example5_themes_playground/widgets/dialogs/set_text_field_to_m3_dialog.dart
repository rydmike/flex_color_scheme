import 'package:flutter/material.dart';

import '../../../shared/const/app.dart';

/// Dialog to confirm if user wants to set TextField to M3.
class SetTextFieldToM3Dialog extends StatelessWidget {
  const SetTextFieldToM3Dialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Set TextField to Material-3?'),
      content: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: App.maxAlertDialogWidth),
        child: const Text('Set the text field settings to values that '
            'match Material-3 defaults?'),
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
            child: const Text('Set to M3')),
      ],
    );
  }
}
