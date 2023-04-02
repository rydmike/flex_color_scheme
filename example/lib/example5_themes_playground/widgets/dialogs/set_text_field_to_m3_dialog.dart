import 'package:flutter/material.dart';

/// Dialog to confirm if user wants to set TextField to M3.
class SetTextFieldToM3Dialog extends StatelessWidget {
  const SetTextFieldToM3Dialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Set TextField To Material 3'),
      content: const Text('Set the text field settings to values that '
          'match Material 3 default style?'),
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
