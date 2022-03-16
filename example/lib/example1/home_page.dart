import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../shared/const/app_data.dart';
import '../shared/widgets/app/about.dart';
import '../shared/widgets/universal/page_body.dart';
import '../shared/widgets/universal/show_color_scheme_colors.dart';
import '../shared/widgets/universal/show_theme_data_colors.dart';
import '../shared/widgets/universal/theme_showcase.dart';

// -----------------------------------------------------------------------------
// Home Page for EXAMPLE 1 - Basic Theme Usage
//
// The content of the HomePage below is not relevant for using FlexColorScheme
// based application theming. The critical parts are in the MaterialApp
// theme definitions. The HomePage contains UI to visually show what the
// defined example looks like in an application and with commonly used Widgets.
// -----------------------------------------------------------------------------
class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.themeMode,
    required this.onThemeModeChanged,
    required this.flexSchemeData,
  }) : super(key: key);
  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;
  final FlexSchemeData flexSchemeData;

  @override
  Widget build(BuildContext context) {
    final double margins =
        AppData.responsiveInsets(MediaQuery.of(context).size.width);
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final TextStyle headlineMedium = textTheme.headlineMedium!;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppData.title(context)),
        actions: const <Widget>[AboutIconButton()],
      ),
      body: PageBody(
        constraints: const BoxConstraints(maxWidth: AppData.maxBodyWidth),
        child: ListView(
          padding: EdgeInsets.all(margins),
          children: <Widget>[
            const Text(
              'FlexColorScheme example 1 shows how to use a selected '
              'predefined color scheme for light and dark theme mode, and '
              'switch between the modes. A theme showcase displays the '
              'resulting theme using common Material widgets. Settings '
              'are not persisted',
            ),
            const SizedBox(height: 8),
            // A 3-way theme mode toggle switch that shows the color scheme.
            FlexThemeModeSwitch(
              themeMode: themeMode,
              onThemeModeChanged: onThemeModeChanged,
              // The `FlexThemeModeSwitch` has a `FlexSchemeData` property that
              // it uses to set colors on the theme mode buttons and to
              // display theme name and description. Since we passed in our
              // custom scheme data, with name and all, from main here to
              // the HomePage , we just pass it on to the FlexThemeModeSwitch.
              flexSchemeData: flexSchemeData,
              buttonOrder: FlexThemeModeButtonOrder.lightSystemDark,
            ),
            // Show theme name and description.
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text('${flexSchemeData.name} theme'),
              subtitle: Text(flexSchemeData.description),
            ),
            // Show all active ColorScheme colors.
            const ShowColorSchemeColors(),
            const SizedBox(height: 8),
            // Show all active colors in ThemeData, these will all be
            // deprecated in Flutter SDK, for more info see
            // https://github.com/flutter/flutter/issues/91772
            const ShowThemeDataColors(),
            const SizedBox(height: 8),
            const Divider(),
            Text('Theme Showcase', style: headlineMedium),
            const SizedBox(height: 8),
            const ThemeShowcase(),
          ],
        ),
      ),
    );
  }
}
