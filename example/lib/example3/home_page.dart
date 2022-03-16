import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../example5/widgets/panels/seeded_color_scheme/use_key_colors_buttons.dart';
import '../shared/const/app_color.dart';
import '../shared/const/app_data.dart';
import '../shared/controllers/theme_controller.dart';
import '../shared/widgets/app/about.dart';
import '../shared/widgets/universal/page_body.dart';
import '../shared/widgets/universal/show_color_scheme_colors.dart';
import '../shared/widgets/universal/show_theme_data_colors.dart';
import '../shared/widgets/universal/switch_list_tile_adaptive.dart';
import '../shared/widgets/universal/theme_showcase.dart';
import 'widgets/theme_select_buttons.dart';

// -----------------------------------------------------------------------------
// Home Page for EXAMPLE 3 - Four Themes
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
              'FlexColorScheme example 3 shows how to use three built-in '
              'color schemes, plus one custom color scheme as selectable '
              'themes in an application. '
              'The example uses primary color alpha blended surface colors. '
              'The new opinionated widget theming is ON. You can '
              'turn it OFF to use default widget themes. '
              'A theme showcase displays the resulting theme using '
              'common Material widgets. Settings are persisted',
            ),
            const SizedBox(height: 8),
            // The content is wrapped in a card so we can see the
            // theme's surface blend impact better via the Card widget.
            Card(
              margin: EdgeInsets.zero,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: margins,
                  horizontal: margins + 4,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // A 3-way theme mode toggle switch that shows the scheme.
                    FlexThemeModeSwitch(
                      themeMode: controller.themeMode,
                      onThemeModeChanged: controller.setThemeMode,
                      flexSchemeData: flexSchemeData,
                      // This is not an SDK BorderShape themed widget, but we
                      // can pass it property values to make it match.
                      optionButtonBorderRadius:
                          controller.useSubThemes ? 12 : 4,
                      buttonOrder: FlexThemeModeButtonOrder.lightSystemDark,
                    ),
                    const SizedBox(height: 8),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Select theme'),
                      trailing: ThemeSelectButtons(
                        scheme: controller.usedScheme,
                        onChanged: controller.setUsedScheme,
                      ),
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
                      title: const Text('Use component sub themes'),
                      subtitle:
                          const Text('Enable opinionated widget sub themes'),
                      value: controller.useSubThemes,
                      onChanged: controller.setUseSubThemes,
                    ),
                    const SizedBox(height: 8),
                    ListTile(
                      title: const Text('Use input colors as seed keys '
                          'for the ColorScheme'),
                      subtitle: Text(AppColor.explainUsedColors(controller)),
                    ),
                    // const SizedBox(height: 4),
                    ListTile(
                      trailing: UseKeyColorsButtons(
                        controller: controller,
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
