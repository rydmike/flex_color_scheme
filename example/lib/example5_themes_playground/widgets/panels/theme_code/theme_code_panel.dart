import 'dart:async';

import 'package:flex_color_scheme_example/example5_themes_playground/utils/generate_theme_dart_code.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/utils/share_settings.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/theme_code/show_code_theme_colors.dart';
import 'package:flex_color_scheme_example/shared/controllers/theme_controller.dart';
import 'package:flex_color_scheme_example/shared/widgets/universal/list_tile_reveal.dart';
import 'package:flex_color_scheme_example/shared/widgets/universal/syntax_highlighter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_ui/material_ui.dart';

/// Show the code for the currently configured FlexColorScheme theme setup.
///
/// Used by in a panel to show the code next to settings panels.
/// As theme settings are configured and changed, the generated setup code
/// is updated and can be copied to the clipboard at any point.
class ThemeCodePanel extends StatelessWidget {
  const ThemeCodePanel(this.controller, {super.key});

  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final String code = generateThemeDartCode(controller);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        ListTileReveal(
          title: const Text('Copy theme code'),
          subtitleReveal: const Text(
            'When you are happy with your theme design, you can copy the '
            'produced API configuration code. Paste it into your Flutter '
            'app and when used together with the FlexColorScheme package, '
            'your app gets the same theme.\n',
          ),
          trailing: Tooltip(
            message: 'Copy code',
            child: IconButton(
              onPressed: () {
                unawaited(ShareSettings.copyToClipboardWithSnackBarInfo(
                  context,
                  code,
                  'FlexColorScheme setup code copied to the clipboard!',
                ));
              },
              icon: const Icon(Icons.copy),
            ),
          ),
          onTap: () {
            unawaited(ShareSettings.copyToClipboardWithSnackBarInfo(
              context,
              code,
              'FlexColorScheme setup code copied to the clipboard!',
            ));
          },
        ),
        const Divider(height: 1),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
        const ListTileReveal(
          revealDense: true,
          title: Text('Code highlight colors as a ThemeExtension'),
          subtitleReveal: Column(
            children: <Widget>[
              Text(
                'The code highlight colors have been added as a custom theme '
                'extension to ThemeData. Light and dark mode CodeTheme change '
                'with theme mode and is accessed via Theme.of(context). The '
                'extension colors also use Material-3 color harmonization '
                'with active theme. When you change theme you can see that '
                'these semantic CodeTheme colors below are often automatically '
                'slightly adjusted towards the overall theme colors.\n'
                '\n'
                'This CodeTheme is used as a ThemeExtension example in the '
                'Themes Playground app. It also demonstrates how to use '
                'Material-3 color harmonization of custom theme colors in '
                'Flutter.\n',
              ),
              ShowCodeThemeColors(),
              Text(
                '\nThe used icon colors for the theme topic buttons and icon '
                'on Settings panel headers, are also using Material-3 '
                'color harmonization. When you change the app theme you can '
                'notice that they also change color temperature to fit better '
                'with the ambient colors in the theme\n',
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
