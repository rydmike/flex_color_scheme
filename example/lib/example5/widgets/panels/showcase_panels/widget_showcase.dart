import 'package:flutter/material.dart';

import '../../../../shared/widgets/app/show_color_scheme_colors.dart';
import '../../../../shared/widgets/app/show_theme_data_colors.dart';
import '../../../../shared/widgets/universal/header_card.dart';
import '../../../../shared/widgets/universal/theme_showcase.dart';

/// All the sub demo pages wrapped in a header card.
class WidgetShowcase extends StatelessWidget {
  const WidgetShowcase({
    Key? key,
    this.isOpen = true,
    this.onTap,
  }) : super(key: key);
  final bool isOpen;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    // final ThemeData theme = Theme.of(context);
    // final TextTheme textTheme = theme.textTheme;
    // final TextStyle headline = textTheme.headlineMedium!;

    return HeaderCard(
      isOpen: isOpen,
      onTap: onTap,
      title: const Text('Widget Showcase'),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 8),
            const ShowColorSchemeColors(),
            const SizedBox(height: 8),
            const ShowThemeDataColors(),
            const Divider(),
            Text('Widgets', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            const ThemeShowcase(),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
