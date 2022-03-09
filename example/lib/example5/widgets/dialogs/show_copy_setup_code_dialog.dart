import 'package:flutter/material.dart';

import '../../../shared/controllers/theme_controller.dart';
import '../../../shared/widgets/universal/responsive_dialog.dart';
import '../../utils/generate_theme_dart_code.dart';
import 'dart_code_dialog_screen.dart';

// Top level function to handle Theme code tap, make the FlexColorScheme
// setup code and copy the code to clipboard.
Future<void> showCopySetupCodeDialog(
    BuildContext context, ThemeController controller) async {
  final String code = generateThemeDartCode(controller);
  if (controller.useFlexColorScheme) {
    await showResponsiveDialog<void>(
      context: context,
      child: DartCodeDialogScreen(
          dialogHeader: 'Copy Theme Setup Code',
          copyMessage: 'FlexColorScheme setup code copied to the clipboard!',
          code: code),
    );
  } else {
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Copy Theme Setup Code'),
          content: const Text('Copying the theme code is only available\n'
              'when using FlexColorScheme theming is enabled'),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('CLOSE')),
          ],
          actionsPadding: const EdgeInsets.symmetric(horizontal: 16),
        );
      },
    );
  }
}
