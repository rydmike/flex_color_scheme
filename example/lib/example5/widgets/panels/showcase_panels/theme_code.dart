import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/syntax_highlighter.dart';
import '../../../utils/generate_theme_dart_code.dart';

class ThemeCode extends StatelessWidget {
  const ThemeCode({Key? key, required this.controller}) : super(key: key);
  final ThemeController controller;

  Future<void> _handleCopyCode(BuildContext context, String text) async {
    final ClipboardData data = ClipboardData(text: text);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('FlexColorScheme setup code copied to the clipboard!'),
        duration: Duration(milliseconds: 2000),
      ),
    );
    await Clipboard.setData(data);
  }

  @override
  Widget build(BuildContext context) {
    final SyntaxHighlighterStyle style =
        Theme.of(context).brightness == Brightness.dark
            ? SyntaxHighlighterStyle.darkThemeStyle()
            : SyntaxHighlighterStyle.lightThemeStyle();
    final String code = generateThemeDartCode(controller);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        ListTile(
          title: const Text('FlexColorScheme code'),
          subtitle: const Text('This is the setup code for the light and dark '
              'theme you have configured. It changes as you adjust your '
              'settings, cool way to study the API.'),
          trailing: ElevatedButton(
            onPressed: () {
              _handleCopyCode(context, code);
            },
            child: const Text('Copy'),
          ),
          onTap: () {
            _handleCopyCode(context, code);
          },
        ),
        const Divider(height: 1),
        Padding(
          padding: const EdgeInsets.all(16),
          child: SelectableText.rich(
            TextSpan(
              style: GoogleFonts.droidSansMono(fontSize: 12),
              children: <TextSpan>[DartSyntaxHighlighter(style).format(code)],
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
