import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/const/app_color.dart';
import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/switch_list_tile_adaptive.dart';
import '../../shared/color_scheme_popup_menu.dart';
import 'app_bar_style_buttons.dart';

class AppBarSettings extends StatelessWidget {
  const AppBarSettings(this.controller, {Key? key}) : super(key: key);
  final ThemeController controller;

  String explainAppBarStyle(final FlexAppBarStyle style, final bool isLight) {
    switch (style) {
      case FlexAppBarStyle.primary:
        return isLight ? 'Primary color - M2 default' : 'Primary color';
      case FlexAppBarStyle.material:
        return isLight
            ? 'White background'
            : 'Dark background (#121212) - M2 default';
      case FlexAppBarStyle.surface:
        return 'Surface, with primary color blend';
      case FlexAppBarStyle.background:
        return 'Background, with primary color blend';
      case FlexAppBarStyle.custom:
        return 'Custom, built-in schemes use tertiary color, '
            'but you can use any color';
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;

    return Column(
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTile(
          subtitle: Text(
            'Material 2 themes favor primary colored AppBar in light '
            'mode, and almost black in dark mode. Here you can select '
            'Primary, Material background or background and surface color, '
            'with their primary blends or even a custom color',
          ),
        ),
        if (isLight) ...<Widget>[
          ListTile(
            enabled: controller.useFlexColorScheme &&
                controller.appBarBackgroundSchemeColorLight == null,
            title: const Text('Light mode AppBarStyle'),
            subtitle: Text(
              explainAppBarStyle(
                  controller.useFlexColorScheme &&
                          controller.appBarBackgroundSchemeColorLight == null
                      ? controller.appBarStyleLight
                      : FlexAppBarStyle.primary,
                  isLight),
            ),
          ),
          ListTile(
            enabled: controller.useFlexColorScheme &&
                controller.appBarBackgroundSchemeColorLight == null,
            trailing: AppBarStyleButtons(
                style: controller.useFlexColorScheme &&
                        controller.appBarBackgroundSchemeColorLight == null
                    ? controller.appBarStyleLight
                    : FlexAppBarStyle.primary,
                onChanged: controller.useFlexColorScheme &&
                        controller.appBarBackgroundSchemeColorLight == null
                    ? controller.setAppBarStyleLight
                    : null,
                // To access the custom color we defined for app bar, in this
                // toggle buttons widget, we have to pass along, or the
                // entire controller. Chose the color in this case. It is not
                // carried with the theme, so we cannot get it from there in
                // the widget. FlexColorScheme knows the color when
                // you make a theme with it. This color is used to show the
                // correct color on the toggle button option for custom color.
                // In our examples we only actually have a custom app bar
                // color in the first custom color example, and we want to
                // show this color as well on the toggle button.
                customAppBarColor:
                    AppColor.scheme(controller).light.appBarColor),
          ),
        ] else ...<Widget>[
          ListTile(
            enabled: controller.useFlexColorScheme,
            title: const Text('Dark mode AppBarStyle'),
            subtitle: Text(
              explainAppBarStyle(
                  controller.useFlexColorScheme
                      ? controller.appBarStyleDark
                      : FlexAppBarStyle.material,
                  isLight),
            ),
          ),
          ListTile(
            enabled: controller.useFlexColorScheme,
            trailing: AppBarStyleButtons(
                style: controller.useFlexColorScheme
                    ? controller.appBarStyleDark
                    : FlexAppBarStyle.material,
                onChanged: controller.useFlexColorScheme
                    ? controller.setAppBarStyleDark
                    : null,
                customAppBarColor:
                    AppColor.scheme(controller).dark.appBarColor),
          ),
        ],
        SwitchListTileAdaptive(
          title: const Text('One colored AppBar on Android'),
          subtitle: const Text(
            'ON  No scrim on the top status bar\n'
            'OFF Default two toned status bar',
          ),
          value:
              controller.transparentStatusBar && controller.useFlexColorScheme,
          onChanged: controller.useFlexColorScheme
              ? controller.setTransparentStatusBar
              : null,
        ),
        if (isLight) ...<Widget>[
          ListTile(
            enabled: controller.useFlexColorScheme,
            title: const Text('Light mode elevation'),
            subtitle: Slider.adaptive(
              max: 24,
              divisions: 48,
              label: controller.appBarElevationLight.toStringAsFixed(1),
              value: controller.appBarElevationLight,
              onChanged: controller.useFlexColorScheme
                  ? controller.setAppBarElevationLight
                  : null,
            ),
            trailing: Padding(
              padding: const EdgeInsetsDirectional.only(end: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'ELEV',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    controller.appBarElevationLight.toStringAsFixed(1),
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            enabled: controller.useFlexColorScheme,
            title: const Text('Light mode opacity'),
            subtitle: const Text('Themed opacity, try 85% to 98%'),
          ),
          ListTile(
            title: Slider.adaptive(
              max: 100,
              divisions: 100,
              label: (controller.appBarOpacityLight * 100).toStringAsFixed(0),
              value: controller.appBarOpacityLight * 100,
              onChanged: controller.useFlexColorScheme
                  ? (double value) {
                      controller.setAppBarOpacityLight(value / 100);
                    }
                  : null,
            ),
            trailing: Padding(
              padding: const EdgeInsetsDirectional.only(end: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'OPACITY',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    '${(controller.appBarOpacityLight * 100).toStringAsFixed(0)}'
                    ' %',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ] else ...<Widget>[
          ListTile(
            enabled: controller.useFlexColorScheme,
            title: const Text('Dark mode elevation'),
            subtitle: Slider.adaptive(
              max: 24,
              divisions: 48,
              label: controller.appBarElevationDark.toStringAsFixed(1),
              value: controller.appBarElevationDark,
              onChanged: controller.useFlexColorScheme
                  ? controller.setAppBarElevationDark
                  : null,
            ),
            trailing: Padding(
              padding: const EdgeInsetsDirectional.only(end: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'ELEV',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    controller.appBarElevationDark.toStringAsFixed(1),
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            enabled: controller.useFlexColorScheme,
            title: const Text('Dark mode opacity'),
            subtitle: const Text('Themed opacity, try 85% to 98%'),
          ),
          ListTile(
            title: Slider.adaptive(
              max: 100,
              divisions: 100,
              label: (controller.appBarOpacityDark * 100).toStringAsFixed(0),
              value: controller.appBarOpacityDark * 100,
              onChanged: controller.useFlexColorScheme
                  ? (double value) {
                      controller.setAppBarOpacityDark(value / 100);
                    }
                  : null,
            ),
            trailing: Padding(
              padding: const EdgeInsetsDirectional.only(end: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'OPACITY',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    '${(controller.appBarOpacityDark * 100).toStringAsFixed(0)}'
                    ' %',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
        const Divider(),
        const ListTile(
          title: Text('Custom color'),
          subtitle: Text('With sub-themes you can set scheme color for the '
              'AppBar background color. '
              'Using AppBarStyle is easier, but this offers more colors. '
              'This overrides used AppBarStyle, set it back to default '
              '(null) to use AppBarStyle again.'),
        ),
        if (isLight)
          ColorSchemePopupMenu(
            title: const Text('Light mode AppBar background color'),
            labelForDefault: 'null (AppBarStyle)',
            index: controller.appBarBackgroundSchemeColorLight?.index ?? -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setAppBarBackgroundSchemeColorLight(null);
                    } else {
                      controller.setAppBarBackgroundSchemeColorLight(
                          SchemeColor.values[index]);
                    }
                  }
                : null,
          )
        else
          ColorSchemePopupMenu(
            title: const Text('Dark mode AppBar background color'),
            labelForDefault: 'null (AppBarStyle)',
            index: controller.appBarBackgroundSchemeColorDark?.index ?? -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setAppBarBackgroundSchemeColorDark(null);
                    } else {
                      controller.setAppBarBackgroundSchemeColorDark(
                          SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
      ],
    );
  }
}
