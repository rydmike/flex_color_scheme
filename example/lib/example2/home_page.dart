import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../shared/all_shared_imports.dart';

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
    final TextStyle headline4 = textTheme.headline4!;

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
            Text('Theme', style: headline4),
            const Text(
              'This example shows how to define your own '
              'FlexSchemeData and create a FlexColorScheme based theme '
              'from it, and toggle between light and dark mode.\n\n'
              'The new opinionated widget theming is ON. You can '
              'turn it OFF to use default widget themes. '
              'A theme showcase displays the resulting theme using '
              'common Material widgets.',
            ),
            // A 3-way theme mode toggle switch that shows the color scheme.
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: margins,
                horizontal: margins + 4,
              ),
              child: FlexThemeModeSwitch(
                // Read the selected themeMode from the controller
                themeMode: controller.themeMode,
                // Call the updateThemeMode method when user selects a mode.
                onThemeModeChanged: controller.setThemeMode,
                flexSchemeData: flexSchemeData,
                optionButtonBorderRadius: controller.useSubThemes ? 16 : 4,
                buttonOrder: FlexThemeModeButtonOrder.lightSystemDark,
              ),
            ),
            // Show theme name and description.
            ListTile(
              title: Text('${flexSchemeData.name} theme'),
              subtitle: Text(flexSchemeData.description),
            ),
            // Show all key active theme colors.
            Padding(
              padding: EdgeInsets.symmetric(horizontal: margins),
              child: const ShowThemeColors(),
            ),
            const SizedBox(height: 8),
            SwitchListTile.adaptive(
              title: const Text('Use sub theming'),
              subtitle: const Text('Enable opinionated widget sub themes'),
              value: controller.useSubThemes,
              onChanged: controller.setUseSubThemes,
            ),
            const SizedBox(height: 16),
            Text('Theme Showcase', style: headline4),
            const ThemeShowcase(),
          ],
        ),
      ),
    );
  }
}
