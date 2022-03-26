import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/app/show_color_scheme_colors.dart';
import '../../../../shared/widgets/app/show_theme_data_colors.dart';

class EffectiveColors extends StatelessWidget {
  const EffectiveColors(this.controller, {Key? key}) : super(key: key);
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle spanTextStyle = theme.textTheme.bodyMedium!
        .copyWith(color: theme.textTheme.bodySmall!.color);
    final TextStyle linkStyle =
        theme.textTheme.bodyMedium!.copyWith(color: theme.colorScheme.primary);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: ShowColorSchemeColors(),
        ),
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text('The effective ColorScheme colors '
              'are presented in the same order as they appear in the '
              'ColorScheme class. The deprecated colors primaryVariant and '
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
                  text: 'The effective color properties in your ThemeData are '
                      'shown above. All direct color properties in '
                      'ThemeData are planned to be deprecated and eventually '
                      'removed from Flutter. More info can be found in ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  url: 'https://github.com/flutter/flutter/issues/91772',
                  text: 'issue #91772',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: '.\n\n'
                      'These colors are still critical in Flutter 2.10.x and '
                      'earlier. Many UI Widgets depend on them for their '
                      'default colors. FlexColorScheme has since its first '
                      'version kept all of them in sync with provided '
                      'ColorScheme, to produce an app with consistent '
                      'ColorScheme based colors on all widgets. It will '
                      'continue to do so as long as these colors exist in '
                      'ThemeData.',
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
