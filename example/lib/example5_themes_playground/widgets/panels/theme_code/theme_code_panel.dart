import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/syntax_highlighter.dart';
import '../../../utils/generate_theme_dart_code.dart';
import '../../../utils/import_export_playground_settings.dart';
import '../../../utils/share_settings.dart';
import '../../dialogs/delete_settings_data.dart';
import '../../dialogs/import_settings_dialog.dart';
import 'show_code_theme_colors.dart';

/// Show the code for the currently configured FlexColorScheme theme setup.
///
/// Used by in a panel to show the code next to settings panels.
/// As theme settings are configured and changed, the generated setup code
/// is updated and can be copied to the clipboard at any point.
class ThemeCodePanel extends StatefulWidget {
  const ThemeCodePanel(this.controller, {super.key});

  final ThemeController controller;

  @override
  State<ThemeCodePanel> createState() => _ThemeCodePanelState();
}

class _ThemeCodePanelState extends State<ThemeCodePanel> {
  late String playgroundConfig;
  late String shareUrl;

  @override
  void initState() {
    super.initState();
    playgroundConfig = '';
    shareUrl = '';
  }

  // Handle delete storage event.
  Future<void> _handleDeleteStorage(BuildContext context) async {
    final bool? reset = await showDialog<bool?>(
      context: context,
      builder: (BuildContext context) {
        return const DeleteSettingsDataDialog();
      },
    );
    if (reset ?? false) {
      await widget.controller.resetAllToDefaults(deleteLocalData: true);
      setState(() {
        playgroundConfig = '';
        shareUrl = '';
      });
    }
  }

  // Handle import settings request.
  Future<void> _handleImportRequest(BuildContext context) async {
    final bool? import = await showDialog<bool?>(
      context: context,
      builder: (BuildContext context) {
        return const ImportSettingsDialog();
      },
    );
    if (import ?? false) {
      if (context.mounted) await _handleImportPlaygroundTheme(context);
    }
  }

  // Handle clipboard paste event.
  //
  // Copies plain text from the clipboard and set it as the playgroundConfig.
  Future<void> _handlePasteEvent() async {
    final ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
    if (data != null) {
      setState(() {
        playgroundConfig = data.text ?? '';
      });
    }
  }

  // Handle export playground theme event.
  Future<void> _handleExportPlaygroundTheme(BuildContext context) async {
    try {
      final String data = await exportPlaygroundSettings(widget.controller);
      if (context.mounted) {
        unawaited(
          ShareSettings.copyToClipboardWithSnackBarInfo(
            context,
            data,
            'Themes Playground configuration copied to the clipboard!',
          ),
        );
        setState(() {
          playgroundConfig = data;
          shareUrl = '';
        });
      }
    } on Exception catch (error, stackTrace) {
      debugPrintStack(
        label: 'Error exporting playground theme data: $error',
        stackTrace: stackTrace,
      );
      if (context.mounted) {
        final double? width =
            MediaQuery.sizeOf(context).width > 800 ? 700 : null;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            width: width,
            content: Text('Unable to export playground settings, $error'),
            duration: const Duration(milliseconds: 2000),
          ),
        );
      }
    }
  }

  // Handle import playground theme event.
  Future<void> _handleImportPlaygroundTheme(BuildContext context) async {
    try {
      if (playgroundConfig.isNotEmpty) {
        final String result = await importPlaygroundSettings(
          widget.controller,
          settings: playgroundConfig,
        );
        widget.controller.setImportErrorLog(result);
      }
    } on Exception catch (error, stackTrace) {
      debugPrintStack(
        label: 'Error importing playground theme data: $error',
        stackTrace: stackTrace,
      );
      // Date time now formatted as string dd.MM.yyyy HH:mm:ss
      final String importDate =
          DateFormat('dd.MM.yyyy HH:mm:ss').format(DateTime.now());
      widget.controller.setImportErrorLog(
          'Failed to decode JSON at $importDate, error:\n$error');
      if (context.mounted) {
        final double? width =
            MediaQuery.sizeOf(context).width > 800 ? 700 : null;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            width: width,
            content: Text('Unable to import playground settings, $error'),
            duration: const Duration(milliseconds: 2000),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final String code = generateThemeDartCode(widget.controller);
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
