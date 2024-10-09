import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../shared/const/app.dart';
import '../shared/const/app_color.dart';
import '../shared/controllers/theme_controller.dart';
import '../shared/widgets/examples/about.dart';
import '../shared/widgets/examples/show_color_scheme_colors.dart';
import '../shared/widgets/examples/show_theme_data_colors.dart';
import '../shared/widgets/examples/use_key_colors_buttons.dart';
import '../shared/widgets/universal/responsive_center.dart';
import '../shared/widgets/universal/showcase_material.dart';
import 'widgets/theme_select_buttons.dart';

// -----------------------------------------------------------------------------
// Home Page for EXAMPLE 3 - Four Themes
//
// The content of the HomePage below is not important for using FlexColorScheme
// based application theming. The key parts are in the MaterialApp
// theme definitions. The HomePage contains UI to visually show what the
// defined example looks like in an application and with commonly used Widgets.
// -----------------------------------------------------------------------------
class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.flexSchemeData,
    required this.controller,
  });
  final FlexSchemeData flexSchemeData;
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final double margins =
        App.responsiveInsets(MediaQuery.sizeOf(context).width);
    final ThemeData theme = Theme.of(context);
    final TextStyle headlineMedium = theme.textTheme.headlineMedium!;

    return Scaffold(
      appBar: AppBar(
        title: Text(App.title(context)),
        actions: const <Widget>[AboutIconButton()],
      ),
      body: ResponsiveCenter(
        constraints: const BoxConstraints(maxWidth: App.maxBodyWidth),
        child: ListView(
          primary: true,
          padding: EdgeInsets.all(margins),
          children: <Widget>[
            const Text(
              'FlexColorScheme example 3 shows how to use three built-in '
              'color schemes, plus one custom color scheme as selectable '
              'themes in an application. '
              'It uses primary color alpha blended surface colors. '
              'Customized component themes are enabled, but you can '
              'turn them OFF to use default component themes. '
              'Key color seed generated ColorSchemes can be enabled. '
              'A Widget Showcase displays the resulting theme using '
              'common Material widgets. Settings are persisted.',
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
                      // can pass it property values to make it match. It is
                      // possible to extract it from the surrounding theme too
                      // and use that value, this is done in another example.
                      optionButtonBorderRadius:
                          controller.useSubThemes ? 12 : 4,
                      buttonOrder: FlexThemeModeButtonOrder.lightSystemDark,
                    ),
                    const SizedBox(height: 8),
                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Use Material-3'),
                      value: controller.useMaterial3,
                      onChanged: controller.setUseMaterial3,
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
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Seed generated ColorScheme'),
                      subtitle: Text(AppColor.explainUsedColors(controller)),
                    ),
                    // Only Playground uses the error key color.
                    ListTile(
                      trailing: UseKeyColorsButtons(
                        controller: controller,
                        showErrorButton: false,
                      ),
                    ),
                    // Show all active colors in ThemeData, these will all be
                    // deprecated in Flutter SDK, for more info see
                    // https://github.com/flutter/flutter/issues/91772
                    const ShowThemeDataColors(),
                    const SizedBox(height: 8),
                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Use component themes'),
                      subtitle: const Text('Enable component themes. '
                          'They are not customized in this example. FCS M3 '
                          'component themes look mostly same as default M3, '
                          'but in M2 mode, FCS defaults are very opinionated '
                          'and look more like M3 defaults than M2 '
                          'defaults.'),
                      value: controller.useSubThemes,
                      onChanged: controller.setUseSubThemes,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text('Widget Showcase', style: headlineMedium),
            const SizedBox(height: 8),
            const ShowcaseMaterial(),
          ],
        ),
      ),
    );
  }
}
