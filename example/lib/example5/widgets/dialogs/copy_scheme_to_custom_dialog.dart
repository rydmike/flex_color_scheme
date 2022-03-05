import 'package:flutter/material.dart';

/// Dialog to confirm is active scheme should be copied over to the
/// custom and modifiable scheme.
class CopySchemeToCustomDialog extends StatelessWidget {
  const CopySchemeToCustomDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Copy to Custom Scheme'),
      content: const Text('Copy this color scheme to the custom scheme?\n\n'
          'Current custom light and dark color scheme will be '
          'overwritten and set to the colors of this scheme.\n'
          'You will be able edit and make a custom scheme with these colors '
          'as a starting point.'),
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
      // Add some padding to the action buttons, they are so close the
      // dialog edge without it.
      // Can't theme the padding in the dialog to something nicer, not yet!
      // I've seen it mentioned that it is coming, since M3 has more
      // default padding in its specs.
      actionsPadding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }
}
