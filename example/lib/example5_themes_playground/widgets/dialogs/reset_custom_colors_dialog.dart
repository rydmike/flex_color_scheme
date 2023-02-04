import 'package:flutter/material.dart';

/// Dialog to confirm if user wants to reset the current custom colors.
class ResetCustomColorsDialog extends StatelessWidget {
  const ResetCustomColorsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Reset custom colors'),
      content: const Text('Set custom color definitions back to their '
          'default values?'),
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
