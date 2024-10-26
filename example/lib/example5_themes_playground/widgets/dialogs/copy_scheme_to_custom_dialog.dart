import 'package:flutter/material.dart';

import '../../../shared/const/app.dart';

/// Dialog to confirm is active scheme should be copied over to the
/// custom and modifiable scheme.
class CopySchemeToCustomDialog extends StatelessWidget {
  const CopySchemeToCustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Copy To Custom Colors?'),
      content: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: App.maxAlertDialogWidth),
        child: const Text("Copy this color scheme's colors to the customizable "
            'colors?\n\n'
            'Current customizable light and dark color scheme will be '
            'overwritten and set to the colors of this scheme. '
            'You will be able edit and make a custom scheme with these colors '
            'as a starting point.'),
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
            child: const Text('COPY')),
      ],
    );
  }
}
