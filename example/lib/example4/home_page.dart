import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../shared/all_shared_imports.dart';

// -----------------------------------------------------------------------------
// Home Page for EXAMPLE 4 - All Themes
//
// The content of the HomePage below is not relevant for using FlexColorScheme
// based application theming. The critical parts are in the above MaterialApp
// theme definitions. The HomePage contains UI to visually show what the
// defined example looks like in an application and with commonly used Widgets.
// -----------------------------------------------------------------------------
class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final double margins =
        AppData.responsiveInsets(MediaQuery.of(context).size.width);
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final TextStyle headline4 = textTheme.headline4!;

    return Row(
      children: <Widget>[
        const SizedBox(width: 0.01),
        Expanded(
          // Wrapping the Scaffold in a Row, with an almost zero width SizedBox
          // before the Scaffold that is in an Expanded widget so it fills the
          // available screen, causes the PopupMenu to open up right aligned on
          // its ListTile child used as its activation button. Without this, it
          // is always left aligned on the ListTile and would require a
          // computed offset. This trick or maybe a bit of a hack, does it
          // automatically. No idea why, just something I noticed by accident.
          child: Scaffold(
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
                    'This example shows how you can use all the built in '
                    'color schemes in FlexColorScheme, add 3 custom schemes to '
                    'it and how to select the used theme.\n\n'
                    'A primary color branding style common on desktop and web '
                    'is used. '
                    'The new opinionated widget theming is ON. You can '
                    'turn it OFF to use default widget themes. '
                    'A theme showcase displays the resulting theme using '
                    'common Material widgets.',
                  ),
                  const SizedBox(height: 8),
                  // Wrap these in a card for a nice design effect.
                  Card(
                    child: Column(
                      children: <Widget>[
                        // A 3-way theme toggle switch that shows the scheme.
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: margins,
                            horizontal: margins + 4,
                          ),
                          child: FlexThemeModeSwitch(
                            themeMode: controller.themeMode,
                            onThemeModeChanged: controller.setThemeMode,
                            flexSchemeData:
                                AppColor.schemes[controller.schemeIndex],
                            optionButtonBorderRadius:
                                controller.useSubThemes ? 16 : 4,
                            buttonOrder:
                                FlexThemeModeButtonOrder.lightSystemDark,
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Theme popup menu button to select color scheme.
                        ThemePopupMenu(
                          schemeIndex: controller.schemeIndex,
                          onChanged: controller.setSchemeIndex,
                        ),
                        const SizedBox(height: 8),
                        // Active theme color indicators.
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: margins,
                          ),
                          child: const ShowThemeColors(),
                        ),
                        const SizedBox(height: 8),
                        SwitchListTile.adaptive(
                          title: const Text('Use sub theming'),
                          subtitle: const Text(
                              'Enable opinionated widget sub themes'),
                          value: controller.useSubThemes,
                          onChanged: controller.setUseSubThemes,
                        ),
                        // Open some sub-pages
                        const SubPages(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text('Theme Showcase', style: headline4),
                  const ThemeShowcase(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
