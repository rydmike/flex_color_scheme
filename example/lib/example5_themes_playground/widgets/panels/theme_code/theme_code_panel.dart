import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/responsive_two_widgets.dart';
import '../../../../shared/widgets/universal/switch_list_tile_reveal.dart';
import '../../../../shared/widgets/universal/syntax_highlighter.dart';
import '../../../theme/theme_values.dart';
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
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: ListTileReveal(
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
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
            lastWidget: SwitchListTileReveal(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              title: const Text('Separate file'),
              subtitleReveal: const Text(
                'Keep ON to get theme definitions '
                'intended for a separate file, instead of using the '
                'theme definitions in your MaterialApp setup directly.\n'
                '\n'
                'Turn OFF to get the theme definitions in same format as '
                'versions before V8, that are intended to be used directly '
                'in your MaterialApp setup.\n',
              ),
              value: widget.controller.generateCodeForOwnFile,
              onChanged: widget.controller.setGenerateCodeForOwnFile,
            ),
            isRow: isRow,
          );
        }),
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
        // const Divider(height: 1),
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
        const SizedBox(height: 16),
        ...switch (widget.controller.canImportExportThemeData()) {
          true => <Widget>[
              const SizedBox(height: 8),
              const Divider(height: 1),
              ListTileReveal(
                title: const Text('Export and Import Playground Settings'),
                leading: const Icon(Icons.data_object),
                subtitleReveal: Text(
                  'With this feature you can export '
                  'the current theme settings from the Themes Playground '
                  'app to a JSON string into the staging area below. '
                  'You can then paste this JSON string into a file and e.g. '
                  'keep the file in your project. The Themes Playground '
                  'settings can then be re-imported here if you need to '
                  "make design changes to your application's theme.\n"
                  '\n'
                  'Latest import log is shown below:\n'
                  '\n'
                  '${widget.controller.importErrorLog}',
                ),
                tileColor: theme.colorScheme.surfaceContainer,
              ),
              const Divider(height: 1),
              const SizedBox(height: 8),
              ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
                return RowOrColumn(
                  firstWidget: ListTileReveal(
                    dense: true,
                    contentPadding:
                        ThemeValues.tilePaddingStart(context, isRow),
                    title: const Text('Export settings'),
                    subtitleReveal: const Text(
                      'Export theme settings to JSON to the staging '
                      'area below. Exported Settings are automatically put in '
                      'the clipboard as a string. You can '
                      'paste this JSON into a file and keep it with your '
                      'project. The settings can then be pasted and '
                      're-imported here if you need to make design '
                      'changes to your theme.',
                    ),
                    trailing: Tooltip(
                      message: 'Export settings',
                      child: IconButton(
                        onPressed: () {
                          unawaited(_handleExportPlaygroundTheme(context));
                        },
                        icon: const Icon(Icons.logout),
                      ),
                    ),
                    onTap: () {
                      unawaited(_handleExportPlaygroundTheme(context));
                    },
                  ),
                  lastWidget: ListTileReveal(
                    enabled: playgroundConfig.isNotEmpty,
                    dense: true,
                    contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
                    title: const Text('Copy settings'),
                    subtitleReveal: const Text(
                      'Copy theme settings from the staging area below '
                      'to the clipboard. When you export settings they are '
                      'also automatically copied to the clipboard.',
                    ),
                    trailing: Tooltip(
                      message: 'Copy settings',
                      child: IconButton(
                        onPressed: () {
                          unawaited(
                              ShareSettings.copyToClipboardWithSnackBarInfo(
                            context,
                            playgroundConfig,
                            'Themes Playground configuration copied to the '
                            'clipboard!',
                          ));
                        },
                        icon: const Icon(Icons.copy),
                      ),
                    ),
                    onTap: () {
                      unawaited(ShareSettings.copyToClipboardWithSnackBarInfo(
                        context,
                        playgroundConfig,
                        'Themes Playground configuration copied to the '
                        'clipboard!',
                      ));
                    },
                  ),
                  isRow: isRow,
                );
              }),
              ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
                return RowOrColumn(
                  firstWidget: ListTileReveal(
                    dense: true,
                    contentPadding:
                        ThemeValues.tilePaddingStart(context, isRow),
                    title: const Text('Paste settings'),
                    subtitleReveal: const Text(
                      'Paste Themes Playground JSON settings from '
                      'clipboard data to the staging area below. '
                      'You can then import the staged settings '
                      'to set them as you current theme settings.',
                    ),
                    trailing: Tooltip(
                      message: 'Paste settings',
                      child: IconButton(
                        onPressed: () async {
                          await _handlePasteEvent();
                        },
                        icon: const Icon(Icons.paste),
                      ),
                    ),
                    onTap: () async {
                      await _handlePasteEvent();
                    },
                  ),
                  lastWidget: ListTileReveal(
                    dense: true,
                    enabled: playgroundConfig.isNotEmpty,
                    contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
                    title: const Text('Import settings'),
                    subtitleReveal: const Text(
                      'Import theme settings exported previously from '
                      'the below paste input staging area.',
                    ),
                    trailing: Tooltip(
                      message: 'Import settings',
                      child: IconButton(
                        onPressed: () async {
                          await _handleImportRequest(context);
                        },
                        icon: const Icon(Icons.login),
                      ),
                    ),
                    onTap: () async {
                      await _handleImportRequest(context);
                    },
                  ),
                  isRow: isRow,
                );
              }),
              ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
                return RowOrColumn(
                  firstWidget: ListTileReveal(
                    dense: true,
                    enabled: playgroundConfig.isNotEmpty,
                    contentPadding:
                        ThemeValues.tilePaddingStart(context, isRow),
                    title: const Text('Make shareable URL'),
                    subtitleReveal: const Text(
                      'This takes the exported settings JSON string from the '
                      'staging area below and creates a link URL with the same '
                      'settings that can be shared.\n',
                    ),
                    trailing: IconButton(
                      icon: const Tooltip(
                        message: 'Make URL',
                        child: Icon(Icons.link),
                      ),
                      onPressed: () async {
                        shareUrl =
                            await ShareSettings.makeUrl(playgroundConfig);
                        setState(() {});
                      },
                    ),
                    onTap: () async {
                      shareUrl = await ShareSettings.makeUrl(playgroundConfig);
                      setState(() {});
                    },
                  ),
                  lastWidget: ListTileReveal(
                    enabled: shareUrl.isNotEmpty,
                    dense: true,
                    contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
                    title: const Text('Copy URL'),
                    subtitleReveal: const Text(
                      'Copy the share URL created to the clipbaord, it may '
                      'be quite long, some browsers may not support it. You '
                      'can also use the "Share config" button on the '
                      'side menu, to export settings, make a shareable '
                      'URL and copy it to the clipboard in one go, then '
                      'just paste it somewhere to share it.\n',
                    ),
                    trailing: Tooltip(
                      message: 'Copy URL',
                      child: IconButton(
                        onPressed: () {
                          unawaited(
                              ShareSettings.copyToClipboardWithSnackBarInfo(
                            context,
                            shareUrl,
                            'Themes Playground settings share link copied '
                            'to the clipboard!',
                          ));
                        },
                        icon: const Icon(Icons.copy),
                      ),
                    ),
                    onTap: () {
                      unawaited(ShareSettings.copyToClipboardWithSnackBarInfo(
                        context,
                        shareUrl,
                        'Themes Playground settings share link copied '
                        'to the clipboard!',
                      ));
                    },
                  ),
                  isRow: isRow,
                );
              }),
              ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
                return RowOrColumn(
                  firstWidget: ListTileReveal(
                    dense: true,
                    enabled: playgroundConfig.isNotEmpty,
                    contentPadding:
                        ThemeValues.tilePaddingStart(context, isRow),
                    title: const Text('Clear staging area'),
                    subtitleReveal: const Text(
                      'This action only clears the staging area below '
                      'where you export, paste '
                      'and copy theme settings data from, it is not '
                      'destructive, just a way to clear the area.',
                    ),
                    trailing: IconButton(
                      icon: const Tooltip(
                        message: 'Clear staging area',
                        child: Icon(Icons.refresh),
                      ),
                      onPressed: () {
                        setState(() {
                          playgroundConfig = '';
                          shareUrl = '';
                        });
                      },
                    ),
                    onTap: () {
                      setState(() {
                        playgroundConfig = '';
                        shareUrl = '';
                      });
                    },
                  ),
                  lastWidget: ListTileReveal(
                    dense: true,
                    contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
                    title: const Text('Delete local storage'),
                    subtitleReveal: const Text(
                      'All persisted theme settings in the local storage will '
                      'be deleted!\n'
                      '\n'
                      'This is useful for purging all keys from the local '
                      'storage including any invalid keys from older '
                      'Playground versions or invalid data inserted via '
                      'invalid JSON import keys.\n',
                    ),
                    trailing: IconButton(
                      icon: const Tooltip(
                        message: 'Delete local data',
                        child: Icon(Icons.delete),
                      ),
                      onPressed: () async {
                        await _handleDeleteStorage(context);
                      },
                    ),
                    onTap: () async {
                      await _handleDeleteStorage(context);
                    },
                  ),
                  isRow: isRow,
                );
              }),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Card(
                  margin: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        if (playgroundConfig.isEmpty)
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'Staging import/export area is empty',
                              ),
                            ),
                          )
                        else ...<Widget>[
                          if (shareUrl.isNotEmpty) ...<Widget>[
                            const Text('\nShareable settings URL'),
                            Text(
                              shareUrl,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.firaMono(
                                fontSize: 11,
                              ).copyWith(
                                color: theme.colorScheme.primary,
                              ),
                            ),
                            const Text('\nExported settings JSON data'),
                          ],
                          SelectableText(
                            playgroundConfig,
                            style: GoogleFonts.firaMono(
                              fontSize: 11,
                            ).copyWith(
                              color: theme.colorScheme.primary,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ],
          false => <Widget>[
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Card(
                  margin: EdgeInsets.zero,
                  child: Text(
                    'Playground theme export not supported with '
                    'current storage solution.',
                  ),
                ),
              ),
            ],
        },
        const SizedBox(height: 8),
      ],
    );
  }
}
