import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../example5_themes_playground/widgets/panels/color_scheme/flex_tone_config_popup_menu.dart';
import '../shared/const/app.dart';
import '../shared/const/app_color.dart';
import '../shared/controllers/theme_controller.dart';
import '../shared/widgets/examples/about.dart';
import '../shared/widgets/examples/input_colors_popup_menu.dart';
import '../shared/widgets/examples/show_color_scheme_colors.dart';
import '../shared/widgets/examples/show_sub_pages.dart';
import '../shared/widgets/examples/show_sub_theme_colors.dart';
import '../shared/widgets/examples/show_theme_data_colors.dart';
import '../shared/widgets/examples/use_key_colors_buttons.dart';
import '../shared/widgets/universal/responsive_center.dart';
import '../shared/widgets/universal/showcase_material.dart';

// -----------------------------------------------------------------------------
// Home Page for EXAMPLE 4 - All Themes
//
// The content of the HomePage below is not important for using FlexColorScheme
// based application theming. The key parts are in the MaterialApp
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
    final String flexToneName =
        FlexSchemeVariant.values[controller.usedFlexToneSetup].variantName;
    final bool isFlutterScheme =
        FlexSchemeVariant.values[controller.usedFlexToneSetup].isFlutterScheme;
    final String seedType = isFlutterScheme ? 'MCU' : 'FSS';
    final double endPadding = theme.useMaterial3 ? 24 : 16;

    return Row(
      children: <Widget>[
        const SizedBox(width: 0.01),
        Expanded(
          // TODO(rydmike): Trick to move Popup to end of wrapped widget.
          // Wrapping the Scaffold in a Row, with an almost zero width SizedBox
          // before the Scaffold that is in an Expanded widget so it fills the
          // available screen, causes the PopupmenuButton to open up right
          // aligned on its ListTile child used as its activation button.
          // Without this, it in this case is always left aligned on the
          // ListTile and would require a computed offset t move it to the
          // right side. This trick, or maybe a bit of a hack, does it
          // automatically. No idea why, just something I noticed by accident.
          // Tested also in V8 example 4, still works like this (26.8.2024).
          child: Scaffold(
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
                  const SizedBox(height: 16),
                  const Text(
                    'FlexColorScheme example 4 shows how you can use all the '
                    'built-in color schemes, add 3 custom schemes to '
                    'it and select any of them as the used theme. '
                    'A primary color branding style common on desktop and web '
                    'apps is used. '
                    'Customized component themes are enabled, but you can '
                    'turn it OFF to use default component themes. '
                    'Seed generated ColorSchemes can be enabled and you can '
                    'choose the seed generation variant and lock primary '
                    'secondary and tertiary colors to their seed values. '
                    'Border radius on all widgets can be adjusted. '
                    'A Widget showcase displays the resulting theme using '
                    'Material widgets. Settings are persisted',
                  ),
                  const SizedBox(height: 8),
                  // Wrap these in a card for a nice design effect.
                  Card(
                    margin: EdgeInsets.zero,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 16),
                        // A 3-way theme toggle switch that shows the scheme.
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                            start: 16,
                            end: endPadding + 6,
                          ),
                          child: FlexThemeModeSwitch(
                            themeMode: controller.themeMode,
                            onThemeModeChanged: controller.setThemeMode,
                            flexSchemeData:
                                AppColor.schemes[controller.schemeIndex],
                            optionButtonBorderRadius:
                                controller.useSubThemes ? 12 : 4,
                            buttonOrder:
                                FlexThemeModeButtonOrder.lightSystemDark,
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Theme popup menu button to select color scheme.
                        // The control is shared with example 5, we do not want
                        // to included the customizable scheme here.
                        InputColorsPopupMenu(
                          controller: controller,
                          includeCustomizableScheme: false,
                        ),
                        SwitchListTile(
                          title: const Text('Use Material-3'),
                          value: controller.useMaterial3,
                          onChanged: controller.setUseMaterial3,
                        ),
                        // Active theme color indicators.
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                            start: 16,
                            end: endPadding,
                          ),
                          child: const ShowColorSchemeColors(),
                        ),
                        const SizedBox(height: 8),
                        ListTile(
                          title: const Text('Use seed generated ColorScheme'),
                          subtitle:
                              Text(AppColor.explainUsedColors(controller)),
                        ),
                        // Only Playground uses the error key color.
                        ListTile(
                          trailing: UseKeyColorsButtons(
                            controller: controller,
                            showErrorButton: false,
                          ),
                        ),
                        // FlexSchemeColor seed type selection.
                        FlexToneConfigPopupMenu(
                          title: 'Scheme',
                          flexToneName: '$flexToneName $seedType',
                          index: controller.usedFlexToneSetup,
                          onChanged: controller.setUsedFlexToneSetup,
                        ),
                        if (isLight) ...<Widget>[
                          SwitchListTile(
                            title: const Text('Keep primary color'),
                            value: controller.useKeyColors &&
                                controller.keepPrimary,
                            onChanged: controller.useKeyColors
                                ? controller.setKeepPrimary
                                : null,
                          ),
                          SwitchListTile(
                            title: const Text('Keep secondary color'),
                            value: controller.useKeyColors &&
                                controller.keepSecondary,
                            onChanged: controller.useKeyColors
                                ? controller.setKeepSecondary
                                : null,
                          ),
                          SwitchListTile(
                            title: const Text('Keep tertiary color'),
                            value: controller.useKeyColors &&
                                controller.keepTertiary,
                            onChanged: controller.useKeyColors
                                ? controller.setKeepTertiary
                                : null,
                          ),
                        ] else ...<Widget>[
                          SwitchListTile(
                            title: const Text('Keep primary color'),
                            value: controller.useKeyColors &&
                                controller.keepDarkPrimary,
                            onChanged: controller.useKeyColors
                                ? controller.setKeepDarkPrimary
                                : null,
                          ),
                          SwitchListTile(
                            title: const Text('Keep secondary color'),
                            value: controller.useKeyColors &&
                                controller.keepDarkSecondary,
                            onChanged: controller.useKeyColors
                                ? controller.setKeepDarkSecondary
                                : null,
                          ),
                          SwitchListTile(
                            title: const Text('Keep tertiary color'),
                            value: controller.useKeyColors &&
                                controller.keepDarkTertiary,
                            onChanged: controller.useKeyColors
                                ? controller.setKeepDarkTertiary
                                : null,
                          ),
                        ],
                        // Show colors in ThemeData, these will all
                        // be deprecated in Flutter SDK, for more info see
                        // https://github.com/flutter/flutter/issues/91772
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                            start: 16,
                            end: endPadding + 6,
                          ),
                          child: const ShowThemeDataColors(),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                            start: 16,
                            end: endPadding + 6,
                          ),
                          child: const ShowSubThemeColors(),
                        ),
                        const SizedBox(height: 8),
                        SwitchListTile(
                          title: const Text('Use component themes'),
                          subtitle: const Text(
                              'Enable opinionated widget sub themes'),
                          value: controller.useSubThemes,
                          onChanged: controller.setUseSubThemes,
                        ),
                        ListTile(
                          enabled: controller.useSubThemes &&
                              controller.useFlexColorScheme,
                          title:
                              const Text('Used border radius on UI elements'),
                          subtitle: const Text(
                              'Default uses Material-3 specification border '
                              'radius, which varies per component. '
                              'A defined value sets it for all components. '
                              'Material-2 specification is 4.'),
                        ),
                        ListTile(
                          enabled: controller.useSubThemes &&
                              controller.useFlexColorScheme,
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
                            padding: const EdgeInsetsDirectional.only(end: 12),
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
                                              (controller.defaultRadius ?? -1) <
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
                  const SizedBox(height: 16),
                  // Open some sub-pages
                  ShowSubPages(controller: controller),
                  const SizedBox(height: 8),
                  const Divider(),
                  Text('Widget Showcase', style: headlineMedium),
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
