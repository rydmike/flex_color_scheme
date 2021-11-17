import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/controllers/theme_controller.dart';
import '../../shared/widgets/universal/syntax_highlighter.dart';
import '../utils/generate_theme_dart_code.dart';

/// Show the code for the Theme in a Dialog screen.
class DartCodeDialogScreen extends StatelessWidget {
  const DartCodeDialogScreen({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final ThemeController controller;

  // Set the passed in text to the clipboard.
  Future<void> copyToClipBoard(String text) async {
    final ClipboardData data = ClipboardData(text: text);
    await Clipboard.setData(data);
  }

  @override
  Widget build(BuildContext context) {
    // We want to show the snackbar only in this screen, not on the main
    // screen too. So we create a scoped ScaffoldMessenger that we use instead
    // of the default one. If we use the default one the snack bar shows
    // also on the main screen when we view the code in a dialog, as well as
    // in the dialog. We don't want that.
    final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
        GlobalKey<ScaffoldMessengerState>();

    // Get the theme's Dart and Flutter setup code.
    final String themeDartCode = generateThemeDartCode(controller);

    final SyntaxHighlighterStyle style =
        Theme.of(context).brightness == Brightness.dark
            ? SyntaxHighlighterStyle.darkThemeStyle()
            : SyntaxHighlighterStyle.lightThemeStyle();

    return ScaffoldMessenger(
      key: scaffoldMessengerKey,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Theme Setup Code'),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.copy),
                tooltip: 'Copy code\nto clipboard',
                onPressed: () {
                  copyToClipBoard(themeDartCode);
                  // Show a snack bar with copy message.
                  scaffoldMessengerKey.currentState!.showSnackBar(
                    const SnackBar(
                      content:
                          Text('FlexColorScheme setup code copied clipboard!'),
                      duration: Duration(milliseconds: 2000),
                    ),
                  );
                },
              ),
            ],
          ),
          body: Container(
            constraints: const BoxConstraints.expand(),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SelectableText.rich(
                  TextSpan(
                    style: GoogleFonts.droidSansMono(fontSize: 12),
                    children: <TextSpan>[
                      DartSyntaxHighlighter(style).format(themeDartCode)
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
