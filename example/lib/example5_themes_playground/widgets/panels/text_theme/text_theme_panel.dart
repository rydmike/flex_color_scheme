import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import 'use_app_font_switch_list_tile.dart';
import 'use_material3_typography.dart';
import 'use_tinted_text_theme.dart';

class TextThemePanel extends StatefulWidget {
  const TextThemePanel(this.controller, {super.key});
  final ThemeController controller;

  @override
  State<TextThemePanel> createState() => _TextThemePanelState();
}

class _TextThemePanelState extends State<TextThemePanel> {
  bool showDetails = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        UseMaterial3Typography(controller: widget.controller),
        UseTinted3TextTheme(controller: widget.controller),
        const Divider(),
        UseAppFontSwitchLisTile(controller: widget.controller),
        SwitchListTile(
          title: const Text('Show text style details'),
          value: showDetails,
          onChanged: (bool value) {
            setState(() {
              showDetails = value;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextThemeShowcase(showDetails: showDetails),
        ),
      ],
    );
  }
}
