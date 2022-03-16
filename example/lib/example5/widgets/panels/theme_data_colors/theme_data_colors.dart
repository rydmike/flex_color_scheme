import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/header_card.dart';
import '../../../../shared/widgets/universal/show_theme_data_colors.dart';

class ThemeDataColors extends StatelessWidget {
  const ThemeDataColors({
    Key? key,
    required this.controller,
    required this.isOpen,
    required this.onTap,
  }) : super(key: key);
  final ThemeController controller;
  final bool isOpen;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle spanTextStyle = theme.textTheme.bodyMedium!
        .copyWith(color: theme.textTheme.bodySmall!.color);
    final TextStyle linkStyle =
        theme.textTheme.bodyMedium!.copyWith(color: theme.colorScheme.primary);

    return HeaderCard(
      isOpen: isOpen,
      onTap: onTap,
      title: const Text('ThemeData Colors'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    style: spanTextStyle,
                    text:
                        'The effective color properties in your ThemeData are '
                        'shown below. All direct color properties in '
                        'ThemeData are planned to be deprecated and eventually '
                        'removed from Flutter. More info can be found here ',
                  ),
                  LinkTextSpan(
                    style: linkStyle,
                    url: 'https://github.com/flutter/flutter/issues/91772',
                    text: 'in issue #91772',
                  ),
                  TextSpan(
                    style: spanTextStyle,
                    text: '.\n\n'
                        'These colors are still critical in Flutter 2.10.x and '
                        'earlier. Many UI Widgets still use them for their '
                        'default colors. FlexColorScheme has since its first '
                        'version kept all of them in sync with provided '
                        'ColorScheme, to produce an app with a consistent '
                        'ColorScheme based look on all widgets. It will '
                        'continue to do so as long as the colors exist in '
                        'ThemeData.\n'
                        '\n'
                        'Migration to replacement colors in ColorScheme only '
                        'or needed component sub-themes is added changes in '
                        'Flutter SDK stable version proceeds.',
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ShowThemeDataColors(),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
