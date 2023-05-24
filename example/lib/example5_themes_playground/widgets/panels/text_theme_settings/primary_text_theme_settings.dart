import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../shared/use_material3_text_theme.dart';
import '../../shared/use_tinted_text_theme.dart';
import 'use_app_font_switch_list_tile.dart';

class PrimaryTextThemeSettings extends StatefulWidget {
  const PrimaryTextThemeSettings(this.controller, {super.key});
  final ThemeController controller;

  static final Uri _fcsPrimTextIssue118146 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/issues/118146',
  );

  @override
  State<PrimaryTextThemeSettings> createState() =>
      _PrimaryTextThemeSettingsState();
}

class _PrimaryTextThemeSettingsState extends State<PrimaryTextThemeSettings> {
  bool showDetails = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle spanTextStyle = theme.textTheme.bodySmall!;
    final TextStyle linkStyle = theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primary, fontWeight: FontWeight.bold);
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
        ListTileReveal(
          dense: true,
          title: const Text('Known issues'),
          subtitle: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'When the primary color of the theme requires dark '
                      'contrast color, the primaryTextTheme gets the wrong '
                      'contrast color in dark mode. For more information, '
                      'please see ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: PrimaryTextThemeSettings._fcsPrimTextIssue118146,
                  text: 'issue #118146',
                ),
                // _fcsChipUmbrellaIssue115364
                TextSpan(
                  style: spanTextStyle,
                  text: '. FlexColorScheme fixes this issue and ensures that '
                      'the primaryTextTheme always has the correct contrast '
                      "color to fit on active theme's primary color.\n",
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Material(
            type: MaterialType.card,
            color: Theme.of(context).colorScheme.primary,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: PrimaryTextThemeShowcase(showDetails: showDetails),
            ),
          ),
        ),
      ],
    );
  }
}
