import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../shared/all_shared_imports.dart';

// -----------------------------------------------------------------------------
// Home Page for EXAMPLE 3)
//
// The content of the HomePage below is not relevant for using FlexColorScheme
// based application theming. The critical parts are in the MaterialApp
// theme definitions. The HomePage contains UI to visually show what the
// defined example looks like in an application and with commonly used Widgets.
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
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final TextStyle headline4 = textTheme.headline4!;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppConst.title(context)),
        actions: const <Widget>[AboutIconButton()],
      ),
      body: PageBody(
        constraints: const BoxConstraints(maxWidth: AppConst.maxBodyWidth),
        child: ListView(
          padding: const EdgeInsets.all(AppConst.edgePadding),
          children: <Widget>[
            Text('Theme', style: headline4),
            const Text(
              'This example shows how to use three built-in '
              'color schemes, and a custom color scheme as selectable '
              'themes in an application.\n\n'
              'The example uses primary color branded surface colors. '
              'The new opinionated widget sub-theming is ON. You can '
              'turn it OFF to use default widget themes. '
              'A theme showcase displays the resulting theme using '
              'common Material widgets.',
            ),
            const SizedBox(height: 8),
            // A 3-way theme mode toggle switch.
            Card(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppConst.edgePadding,
                      horizontal: AppConst.edgePadding + 4,
                    ),
                    child: FlexThemeModeSwitch(
                      themeMode: controller.themeMode,
                      onThemeModeChanged: controller.setThemeMode,
                      flexSchemeData: flexSchemeData,
                      optionButtonBorderRadius:
                          controller.useSubThemes ? 16 : 4,
                    ),
                  ),
                  ListTile(
                    title: const Text('Select theme'),
                    trailing: ThemeSelectButtons(
                      scheme: controller.usedScheme,
                      onChanged: controller.setUsedScheme,
                    ),
                  ),

                  // Show theme name and description.
                  ListTile(
                    title: Text('${flexSchemeData.name} theme'),
                    subtitle: Text(flexSchemeData.description),
                  ),
                  // Show all key active theme colors.
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: AppConst.edgePadding),
                    child: ShowThemeColors(),
                  ),
                  const SizedBox(height: 8),
                  SwitchListTile.adaptive(
                    title: const Text('Use FlexColorScheme sub-theming'),
                    subtitle: const Text(
                      'Turn ON to enable opinionated sub-themes.',
                    ),
                    value: controller.useSubThemes,
                    onChanged: controller.setUseSubThemes,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Divider(),
            Text('Theme Showcase', style: headline4),
            const ThemeShowcase(),
          ],
        ),
      ),
    );
  }
}
