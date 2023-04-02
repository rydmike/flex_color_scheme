import 'package:flutter/material.dart';

import '../../../shared/controllers/theme_controller.dart';
import '../../../shared/widgets/universal/responsive_dialog.dart';
import '../../utils/generate_theme_dart_code.dart';
import 'dart_code_dialog_screen.dart';

// Top level function to handle Theme code menu tap, make the FlexColorScheme
// setup code and copy the code to clipboard.
Future<void> showCopySetupCodeDialog(
    BuildContext context, ThemeController controller) async {
  final String code = generateThemeDartCode(controller);
  await showResponsiveDialog<void>(
    context: context,
    child: DartCodeDialogScreen(
        dialogHeader: 'Copy ThemeData setup code',
        copyMessage: 'FlexColorScheme setup code copied to the clipboard!',
        code: code),
  );
}
