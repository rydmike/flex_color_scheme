import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/app/show_color_scheme_colors.dart';
import '../../../../shared/widgets/app/show_sub_theme_colors.dart';
import '../../../../shared/widgets/app/show_theme_data_colors.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../shared/component_colors_reveal.dart';
import '../../shared/use_seeded_color_scheme_switch.dart';

/// Used to show effective theme colors.
///
/// * Boxes with [ColorScheme] colors.
/// * Boxes with [ThemeData] colors.
/// * Boxes with effective sub-theme colors.
class EffectiveColors extends StatelessWidget {
  const EffectiveColors(this.controller, {super.key});
  final ThemeController controller;

  static final Uri _githubIssueUri = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/issues/91772',
  );

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle spanTextStyle = theme.textTheme.bodySmall!;
    final TextStyle linkStyle =
        theme.textTheme.bodySmall!.copyWith(color: theme.colorScheme.primary);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        UseSeededColorSchemeSwitch(controller: controller),
        const ListTileReveal(
          title: Text('ColorScheme colors'),
          subtitleDense: true,
          subtitle: Text(
            'The themed and effective ColorScheme colors '
            'are presented below in the order they appear in the '
            'ColorScheme class. Deprecated colors primaryVariant and '
            'secondaryVariant are excluded.\n'
            '\n'
            'When you make custom components or assign custom colors to '
            'component themes, prefer using colors that are '
            "available in the application's ColorScheme. Flutter Material "
            'widgets are mostly transitioned to using only ColorScheme '
            'based colors. In M3 mode this migration is mostly done, '
            'but in M2 mode some components still use colors defined '
            'directly in ThemeData. Avoid using colors directly from '
            'ThemeData going forward. See more info via the ThemeData info '
            'expand below.\n',
          ),
        ),
        const SizedBox(height: 4),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: ShowColorSchemeColors(showTitle: false),
        ),
        ListTileReveal(
          title: const Text('ThemeData colors'),
          subtitleDense: true,
          subtitle: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'Most direct color properties in ThemeData are '
                      'planned to be deprecated and removed from Flutter. '
                      'More info in ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _githubIssueUri,
                  text: 'issue #91772',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: '.\n'
                      '\n'
                      'Some ThemeData colors still matter in Flutter 3.10 '
                      'and earlier. Some widgets depend on them for '
                      'their default colors, especially when using M2. '
                      'FlexColorScheme keeps them in sync with ColorScheme to '
                      'produce an app with consistent colors on all widgets. '
                      'It will do so as long as the colors exist in ThemeData.'
                      '\n\n'
                      'If you turn FlexColorScheme OFF, you can see that some '
                      'colors in ThemeData loose their relation to active '
                      'ColorScheme. Widgets in the SDK that still get their '
                      'default colors from those ThemeData color properties '
                      'will then no longer get ColorScheme based colors. '
                      'FlexColorScheme automatically assigns correct '
                      'ColorScheme based '
                      'colors to such still relevant ThemeData colors.\n',
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 4),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: ShowThemeDataColors(showTitle: false),
        ),
        const ComponentColorsReveal(),
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 4, 16, 16),
          child: ShowSubThemeColors(showTitle: false),
        ),
      ],
    );
  }
}
