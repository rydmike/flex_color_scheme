import 'package:flutter/material.dart';

/// Dialog to confirm if user wants to reset the current custom colors.
class ResetCustomColorsDialog extends StatelessWidget {
  const ResetCustomColorsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Reset Custom Colors'),
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
      // Add some padding to the action buttons, they are so close the
      // dialog edge without it.
      // Can't theme the padding in the dialog to something nicer, not yet!
      // I've seen it mentioned that it is coming, since M3 has more
      // default padding in its specs.
      actionsPadding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }
}
