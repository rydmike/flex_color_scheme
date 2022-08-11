import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/app/show_color_scheme_colors.dart';
import '../../../../shared/widgets/app/show_sub_theme_colors.dart';
import '../../../../shared/widgets/app/show_theme_data_colors.dart';

/// Used to show effective theme colors.
///
/// * Boxes with [ColorScheme] colors.
/// * Boxes with [ThemeData] colors.
/// * Boxes with effective sub-theme colors.
class EffectiveColors extends StatelessWidget {
  const EffectiveColors(this.controller, {super.key});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle spanTextStyle = theme.textTheme.bodySmall!;
    final TextStyle linkStyle =
        theme.textTheme.bodySmall!.copyWith(color: theme.colorScheme.primary);
    final Uri githubIssueUri = Uri(
      scheme: 'https',
      host: 'github.com',
      path: 'flutter/flutter/issues/91772',
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: ShowColorSchemeColors(),
        ),
        const SizedBox(height: 8),
        const ListTile(
          dense: true,
          subtitle: Text('The effective ColorScheme colors '
              'are presented above in the order they appear in the '
              'ColorScheme class. Deprecated colors primaryVariant and '
              'secondaryVariant are excluded.'),
        ),
        const SizedBox(height: 8),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: ShowThemeDataColors(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'Effective color properties in ThemeData class. '
                      'All direct color properties in ThemeData are planned '
                      'to be deprecated and removed from Flutter. '
                      'More info in ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: githubIssueUri,
                  text: 'issue #91772',
                ),
              ],
            ),
          ),
        ),
        const ListTile(
          dense: true,
          subtitle: Text('Above ThemeData colors are still important in '
              'Flutter 3.0 and earlier. Many widgets still depend on them for '
              'their default colors. FlexColorScheme keeps them in sync '
              'with ColorScheme to produce an app with consistent colors '
              'on all widgets. It will do so as long as the colors exist '
              'in ThemeData. If you turn FlexColorScheme OFF, you can see '
              'that the colors in ThemeData loose their relation to active '
              'ColorScheme. Widgets in the SDK that still get their default '
              'colors from these ThemeData color properties will then no '
              'longer get ColorScheme based colors. FlexColorScheme assigns '
              'correct ColorScheme based colors to still relevant ThemeData '
              'colors.'),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: ShowSubThemeColors(showSubtitle: true),
        ),
      ],
    );
  }
}
