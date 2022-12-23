import 'package:flutter/material.dart';

import '../../../../shared/widgets/app/show_color_scheme_colors.dart';
import '../../../../shared/widgets/app/show_sub_theme_colors.dart';
import '../../../../shared/widgets/app/show_theme_data_colors.dart';
import '../../../../shared/widgets/universal/theme_showcase.dart';

/// All the widgets using effective theming in a column.
class WidgetShowcase extends StatelessWidget {
  const WidgetShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 8),
          const ShowColorSchemeColors(),
          const SizedBox(height: 8),
          const ShowThemeDataColors(),
          const SizedBox(height: 8),
          const ShowSubThemeColors(),
          const Divider(),
          Text('Widgets', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 16),
          const ThemeShowcase(),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
