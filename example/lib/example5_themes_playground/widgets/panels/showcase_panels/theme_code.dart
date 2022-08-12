import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/syntax_highlighter.dart';
import '../../../utils/generate_theme_dart_code.dart';
import 'show_code_theme_colors.dart';

/// Show the code for the currently configured FlexColorScheme theme setup.
///
/// Used by in a panel to show the code next to settings panels.
/// As theme settings are configured and changed, the generated setup code
/// is updated and can be copied to the clipboard at any point.
class ThemeCode extends StatelessWidget {
  const ThemeCode(this.controller, {super.key});
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
    final String code = generateThemeDartCode(controller);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        ListTile(
          title: const Text('FlexColorScheme code'),
          subtitle: const Text('This is the setup code for the light and dark '
              'theme you have configured. It changes as you adjust settings.'),
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
              style: GoogleFonts.firaMono(fontSize: 12),
              children: <TextSpan>[
                DartSyntaxHighlighter(
                  SyntaxHighlighterStyle.harmonized(context),
                ).format(code),
              ],
            ),
          ),
        ),
        const Divider(height: 1),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: ShowCodeThemeColors(),
        ),
        const ListTile(
          dense: true,
          title: Text('CodeTheme is a ThemeData ThemeExtension'),
          subtitle: Text('The above colors have been added as a custom theme '
              'extension to ThemeData. Light and dark mode CodeTheme change '
              'with theme mode and is accessed via Theme.of(context). The '
              'extension colors are also using Material 3 color harmonization '
              'with active theme. When you change theme you can see that '
              'these semantic CodeTheme colors are often automatically '
              'slightly adjusted towards the overall theme colors. '
              'This CodeTheme is used as a ThemeExtension example in the '
              'Themes Playground app. It also demonstrates how to use M3 color '
              'harmonization of custom theme colors in Flutter.'),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
