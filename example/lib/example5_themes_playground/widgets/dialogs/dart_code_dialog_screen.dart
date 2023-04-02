import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/widgets/universal/syntax_highlighter.dart';

/// Show the code for the currently configured FlexColorScheme theme setup.
///
/// Used by the dialog `showCopySetupCodeDialog` to show the code .
class DartCodeDialogScreen extends StatelessWidget {
  const DartCodeDialogScreen({
    super.key,
    required this.dialogHeader,
    required this.copyMessage,
    required this.code,
  });
  final String dialogHeader;
  final String copyMessage;
  final String code;

  // Set the passed in text to the clipboard.
  Future<void> copyToClipBoard(String text) async {
    final ClipboardData data = ClipboardData(text: text);
    await Clipboard.setData(data);
  }

  @override
  Widget build(BuildContext context) {
    // We want to show the snack bar only in this screen, not on the main
    // screen too. So we create a scoped ScaffoldMessenger that we use instead
    // of the default one. If we use the default one the SnackBar shows
    // also on the main screen when we view the code in a dialog, as well as
    // in the dialog. We don't want that.
    final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
        GlobalKey<ScaffoldMessengerState>();

    final ThemeData theme = Theme.of(context);

    // We want to make the used Scaffold background color behave like Dialog
    // theme. We Could make it transparent, to see the Material in the
    // ResponsiveDialog behind it, but then we see through and screen behind it
    // when it becomes a MaterialPageRoute full screen modal dialog.
    // This ensure the Scaffold background has matching color. To a themed or
    // default themed dialog.
    final double elevation =
        theme.dialogTheme.elevation ?? (theme.useMaterial3 ? 6 : 24);
    final Color background = theme.colorScheme.surface;
    final Color backgroundColor = theme.useMaterial3
        ? ElevationOverlay.applySurfaceTint(
            background,
            theme.dialogTheme.surfaceTintColor ?? theme.colorScheme.surfaceTint,
            elevation)
        : ElevationOverlay.applyOverlay(context, background, elevation);

    return ScaffoldMessenger(
      key: scaffoldMessengerKey,
      child: Scaffold(
          // Color should come from its custom Dialog that matches normal
          // Dialog color behavior.
          backgroundColor: backgroundColor,
          appBar: AppBar(
            surfaceTintColor: theme.colorScheme.surfaceTint,
            shadowColor: theme.useMaterial3 ? Colors.transparent : null,
            title: Text(dialogHeader),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.copy),
                tooltip: 'Copy code\nto clipboard',
                onPressed: () {
                  unawaited(copyToClipBoard(code));
                  // Show a snack bar with copy message.
                  scaffoldMessengerKey.currentState!.showSnackBar(
                    SnackBar(
                      content: Text(copyMessage),
                      duration: const Duration(milliseconds: 2000),
                    ),
                  );
                },
              ),
            ],
          ),
          body: ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SelectableText.rich(
                  TextSpan(
                    style: GoogleFonts.firaMono(fontSize: 12),
                    children: <TextSpan>[
                      DartSyntaxHighlighter(
                        SyntaxHighlighterStyle.harmonized(context),
                      ).format(code),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
