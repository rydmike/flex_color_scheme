import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../shared/const/app_data.dart';
import '../shared/controllers/theme_controller.dart';
import '../shared/widgets/app/about.dart';
import '../shared/widgets/app/show_color_scheme_colors.dart';
import '../shared/widgets/app/show_theme_data_colors.dart';
import '../shared/widgets/universal/page_body.dart';
import '../shared/widgets/universal/switch_list_tile_adaptive.dart';
import '../shared/widgets/universal/theme_showcase.dart';

// -----------------------------------------------------------------------------
// Home Page for EXAMPLE 2 - Custom Theme
//
// The content of the HomePage below is not relevant for using FlexColorScheme
// based application theming. The critical parts are in the above MaterialApp
// theme definitions. The HomePage contains UI to visually show what the
// defined example looks like in an application and with commonly used Widgets.
//
// This example use a ThemeController that widgets can use to manipulate the
// theme with, the app listens to changes in the controller and rebuilds.
// -----------------------------------------------------------------------------
class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.flexSchemeData,
    required this.controller,
  }) : super(key: key);

  final FlexSchemeData flexSchemeData;
  final ThemeController controller;

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
              'FlexColorScheme example 2 shows how to define your own '
              'FlexSchemeData, create a theme '
              'from it and toggle between light and dark mode. '
              'The new opinionated widget theming is ON. You can '
              'turn it OFF to use Flutter default widget themes. '
              'A theme showcase displays the resulting theme using '
              'common Material widgets. Settings are not persisted',
            ),
            // A 3-way theme mode toggle switch that shows the color scheme.
            FlexThemeModeSwitch(
              // Read the selected themeMode from the controller
              themeMode: controller.themeMode,
              // Call the updateThemeMode method when user selects a mode.
              onThemeModeChanged: controller.setThemeMode,
              flexSchemeData: flexSchemeData,
              optionButtonBorderRadius: controller.useSubThemes ? 12 : 4,
              buttonOrder: FlexThemeModeButtonOrder.lightSystemDark,
            ),
            // Show theme name and description.
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text('${flexSchemeData.name} theme'),
              subtitle: Text(flexSchemeData.description),
            ),
            // Show all key active theme colors.
            const ShowColorSchemeColors(),
            const SizedBox(height: 8),
            // Show all active colors in ThemeData, these will all be
            // deprecated in Flutter SDK, for more info see
            // https://github.com/flutter/flutter/issues/91772
            const ShowThemeDataColors(),
            const SizedBox(height: 8),
            SwitchListTileAdaptive(
              contentPadding: EdgeInsets.zero,
              title: const Text('Use component themes'),
              subtitle: const Text('Enable opinionated widget sub themes'),
              value: controller.useSubThemes,
              onChanged: controller.setUseSubThemes,
            ),
            const SizedBox(height: 8),
            const Divider(),
            Text('Theme Showcase', style: headlineMedium),
            const SizedBox(height: 8),
            ThemeShowcase(useRailAssertWorkAround: !controller.useSubThemes),
          ],
        ),
      ),
    );
  }
}
