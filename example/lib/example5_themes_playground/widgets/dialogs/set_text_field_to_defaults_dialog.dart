import 'package:flutter/material.dart';

/// Dialog to confirm if user wants to set TextField to FCS deefaults.
class SetTextFieldToDefaultsDialog extends StatelessWidget {
  const SetTextFieldToDefaultsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Set TextField To FlexColorScheme Defaults'),
      content: const Text('Set the text field settings back to its opinionated '
          'default values?'),
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
            child: const Text('Set to FCS defaults')),
      ],
    );
  }
}
