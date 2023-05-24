import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../shared/use_material3_text_theme.dart';
import '../../shared/use_tinted_text_theme.dart';
import 'use_app_font_switch_list_tile.dart';

class TextThemeSettings extends StatefulWidget {
  const TextThemeSettings(this.controller, {super.key});
  final ThemeController controller;

  @override
  State<TextThemeSettings> createState() => _TextThemeSettingsState();
}

class _TextThemeSettingsState extends State<TextThemeSettings> {
  bool showDetails = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        UseMaterial3TextTheme(controller: widget.controller),
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
