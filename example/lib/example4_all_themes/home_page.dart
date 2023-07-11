import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../shared/const/app.dart';
import '../shared/const/app_color.dart';
import '../shared/controllers/theme_controller.dart';
import '../shared/widgets/app/about.dart';
import '../shared/widgets/app/show_color_scheme_colors.dart';
import '../shared/widgets/app/show_sub_pages.dart';
import '../shared/widgets/app/show_sub_theme_colors.dart';
import '../shared/widgets/app/show_theme_data_colors.dart';
import '../shared/widgets/app/use_key_colors_buttons.dart';
import '../shared/widgets/universal/page_body.dart';
import '../shared/widgets/universal/showcase_material.dart';
import 'widgets/theme_popup_menu.dart';

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
    super.key,
    required this.controller,
  });

  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final double margins =
        App.responsiveInsets(MediaQuery.sizeOf(context).width);
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final TextStyle headlineMedium = theme.textTheme.headlineMedium!;

    return Row(
      children: <Widget>[
        const SizedBox(width: 0.01),
        Expanded(
          // TODO(rydmike): INFO: Trick to move Popup to end of wrapped widget.
          // Wrapping the Scaffold in a Row, with an almost zero width SizedBox
          // before the Scaffold that is in an Expanded widget so it fills the
          // available screen, causes the PopupMenu to open up right aligned on
          // its ListTile child used as its activation button. Without this, it
          // is always left aligned on the ListTile and would require a
          // computed offset. This trick, or maybe a bit of a hack, does it
          // automatically. No idea why, just something I noticed by accident.
          // Tested also in v7 of FCS, still works date (21.3.2023).
          child: Scaffold(
            appBar: AppBar(
              title: Text(App.title(context)),
              actions: const <Widget>[AboutIconButton()],
            ),
            body: PageBody(
              constraints: const BoxConstraints(maxWidth: App.maxBodyWidth),
              child: ListView(
                primary: true,
                padding: EdgeInsets.all(margins),
                children: <Widget>[
                  const Text(
                    'FlexColorScheme example 4 shows how you can use all the '
                    'built-in color schemes, add 3 custom schemes to '
                    'it and select used theme.\n'
                    'A primary color branding style common on desktop and web '
                    'is used. '
                    'Widget component theming is ON. You can '
                    'turn it OFF to use default widget themes. '
                    'Key color generated ColorSchemes can be enabled. '
                    'Border radius on all widgets can be adjusted.\n'
                    'A theme showcase displays the resulting theme using '
                    'common Material widgets. Settings are persisted',
                  ),
                  const SizedBox(height: 8),
                  // Wrap these in a card for a nice design effect.
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
                          // A 3-way theme toggle switch that shows the scheme.
                          FlexThemeModeSwitch(
                            themeMode: controller.themeMode,
                            onThemeModeChanged: controller.setThemeMode,
                            flexSchemeData:
                                AppColor.customSchemes[controller.schemeIndex],
                            optionButtonBorderRadius:
                                controller.useSubThemes ? 12 : 4,
                            buttonOrder:
                                FlexThemeModeButtonOrder.lightSystemDark,
                          ),
                          // Theme popup menu button to select color scheme.
                          ThemePopupMenu(
                            contentPadding: EdgeInsets.zero,
                            schemeIndex: controller.schemeIndex,
                            onChanged: controller.setSchemeIndex,
                          ),
                          SwitchListTile(
                            contentPadding: EdgeInsets.zero,
                            title: const Text('Use Material 3'),
                            value: controller.useMaterial3,
                            onChanged: controller.setUseMaterial3,
                          ),
                          // Active theme color indicators.
                          const ShowColorSchemeColors(),
                          const SizedBox(height: 8),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: const Text('Use input colors as keys '
                                'for the ColorScheme'),
                            subtitle:
                                Text(AppColor.explainUsedColors(controller)),
                          ),
                          // const SizedBox(height: 4),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            trailing: UseKeyColorsButtons(
                              controller: controller,
                            ),
                          ),
                          if (isLight) ...<Widget>[
                            SwitchListTile(
                              contentPadding: EdgeInsets.zero,
                              title: const Text('Keep primary color'),
                              value: controller.useKeyColors &&
                                  controller.keepPrimary,
                              onChanged: controller.useKeyColors
                                  ? controller.setKeepPrimary
                                  : null,
                            ),
                            SwitchListTile(
                              contentPadding: EdgeInsets.zero,
                              title: const Text('Keep secondary color'),
                              value: controller.useKeyColors &&
                                  controller.keepSecondary,
                              onChanged: controller.useKeyColors
                                  ? controller.setKeepSecondary
                                  : null,
                            ),
                            SwitchListTile(
                              contentPadding: EdgeInsets.zero,
                              title: const Text('Keep tertiary color'),
                              value: controller.useKeyColors &&
                                  controller.keepTertiary,
                              onChanged: controller.useKeyColors
                                  ? controller.setKeepTertiary
                                  : null,
                            ),
                          ] else ...<Widget>[
                            SwitchListTile(
                              contentPadding: EdgeInsets.zero,
                              title: const Text('Keep primary color'),
                              value: controller.useKeyColors &&
                                  controller.keepDarkPrimary,
                              onChanged: controller.useKeyColors
                                  ? controller.setKeepDarkPrimary
                                  : null,
                            ),
                            SwitchListTile(
                              contentPadding: EdgeInsets.zero,
                              title: const Text('Keep secondary color'),
                              value: controller.useKeyColors &&
                                  controller.keepDarkSecondary,
                              onChanged: controller.useKeyColors
                                  ? controller.setKeepDarkSecondary
                                  : null,
                            ),
                            SwitchListTile(
                              contentPadding: EdgeInsets.zero,
                              title: const Text('Keep tertiary color'),
                              value: controller.useKeyColors &&
                                  controller.keepDarkTertiary,
                              onChanged: controller.useKeyColors
                                  ? controller.setKeepDarkTertiary
                                  : null,
                            ),
                          ],
                          // Show all active colors in ThemeData, these will all
                          // be deprecated in Flutter SDK, for more info see
                          // https://github.com/flutter/flutter/issues/91772
                          const ShowThemeDataColors(),
                          const SizedBox(height: 8),
                          const ShowSubThemeColors(),
                          const SizedBox(height: 8),
                          SwitchListTile(
                            contentPadding: EdgeInsets.zero,
                            title: const Text('Use component themes'),
                            subtitle: const Text(
                                'Enable opinionated widget sub themes'),
                            value: controller.useSubThemes,
                            onChanged: controller.setUseSubThemes,
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            enabled: controller.useSubThemes &&
                                controller.useFlexColorScheme,
                            title:
                                const Text('Used border radius on UI elements'),
                            subtitle: const Text(
                                'Default uses Material 3 specification border '
                                'radius, which varies per component. '
                                'A defined value sets it for all components. '
                                'Material 2 specification is 4.'),
                          ),
                          ListTile(
                            enabled: controller.useSubThemes &&
                                controller.useFlexColorScheme,
                            contentPadding: EdgeInsets.zero,
                            title: Slider(
                              min: -1,
                              max: 30,
                              divisions: 31,
                              label: controller.defaultRadius == null ||
                                      (controller.defaultRadius ?? -1) < 0
                                  ? 'default'
                                  : (controller.defaultRadius
                                          ?.toStringAsFixed(0) ??
                                      ''),
                              value: controller.useSubThemes &&
                                      controller.useFlexColorScheme
                                  ? controller.defaultRadius ?? -1
                                  : 4,
                              onChanged: controller.useSubThemes &&
                                      controller.useFlexColorScheme
                                  ? (double value) {
                                      controller.setDefaultRadius(value < 0
                                          ? null
                                          : value.roundToDouble());
                                    }
                                  : null,
                            ),
                            trailing: Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(end: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'RADIUS',
                                    style: theme.textTheme.bodySmall,
                                  ),
                                  Text(
                                    controller.useSubThemes &&
                                            controller.useFlexColorScheme
                                        ? controller.defaultRadius == null ||
                                                (controller.defaultRadius ??
                                                        -1) <
                                                    0
                                            ? 'default'
                                            : (controller.defaultRadius
                                                    ?.toStringAsFixed(0) ??
                                                '')
                                        : '4',
                                    style: theme.textTheme.bodySmall!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Open some sub-pages
                  ShowSubPages(controller: controller),
                  const SizedBox(height: 8),
                  const Divider(),
                  Text('Theme Showcase', style: headlineMedium),
                  const ShowcaseMaterial(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
