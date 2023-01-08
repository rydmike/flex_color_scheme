import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/const/app_color.dart';
import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/theme_showcase.dart';
import '../../shared/color_scheme_popup_menu.dart';
import 'app_bar_style_popup_menu.dart';

class AppBarSettings extends StatelessWidget {
  const AppBarSettings(this.controller, {super.key});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    return Column(
      children: <Widget>[
        const AppBarShowcase(),
        const ListTile(
          subtitle: Text(
            'Material 2 uses primary colored AppBar in light mode and almost '
            'black in dark mode. Material 3 defaults to surface '
            'color in both light and dark theme mode. '
            'With FCS you can use select '
            'Primary, Material2 surface, background and surface colors '
            'with their surfaceTint blends, or use a custom color.',
          ),
        ),
        if (isLight)
          AppBarStylePopupMenu(
            title: const Text('Light AppBarStyle'),
            labelForDefault: 'default',
            index: controller.appBarStyleLight?.index ?? -1,
            onChanged: controller.useFlexColorScheme &&
                    controller.appBarBackgroundSchemeColorLight == null
                ? (int index) {
                    if (index < 0 || index >= FlexAppBarStyle.values.length) {
                      controller.setAppBarStyleLight(null);
                    } else {
                      controller
                          .setAppBarStyleLight(FlexAppBarStyle.values[index]);
                    }
                  }
                : null,
            // To access the custom color we defined for AppBars in this
            // PopupMenu buttons widget, we have to pass it along, or the
            // entire controller. We chose the color in this case. It is not
            // carried with the theme, so we cannot get it from there in
            // the widget. FlexColorScheme knows the color when
            // you make a theme with it. This color is used to show the
            // correct color on the AppBar custom color option for the not
            // built-in custom color scheme.
            // In our examples we only actually have a custom app bar
            // color in the three custom color examples, and we want to
            // show them as well on the PopupMenu button.
            customAppBarColor: AppColor.scheme(controller).light.appBarColor,
          )
        else
          AppBarStylePopupMenu(
            title: const Text('Dark AppBarStyle'),
            labelForDefault: 'default',
            index: controller.appBarStyleDark?.index ?? -1,
            onChanged: controller.useFlexColorScheme &&
                    controller.appBarBackgroundSchemeColorDark == null
                ? (int index) {
                    if (index < 0 || index >= FlexAppBarStyle.values.length) {
                      controller.setAppBarStyleDark(null);
                    } else {
                      controller
                          .setAppBarStyleDark(FlexAppBarStyle.values[index]);
                    }
                  }
                : null,
            customAppBarColor: AppColor.scheme(controller).dark.appBarColor,
          ),
        SwitchListTile(
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
            title: const Text('Light AppBar elevation'),
            subtitle: Slider(
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
                    style: theme.textTheme.bodySmall,
                  ),
                  Text(
                    controller.appBarElevationLight.toStringAsFixed(1),
                    style: theme.textTheme.bodySmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            enabled: controller.useFlexColorScheme,
            title: const Text('Light opacity'),
            subtitle: const Text('To use themed opacity, try 85% to 98%'),
          ),
          ListTile(
            title: Slider(
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
                    style: theme.textTheme.bodySmall,
                  ),
                  Text(
                    // ignore: lines_longer_than_80_chars
                    '${(controller.appBarOpacityLight * 100).toStringAsFixed(0)}'
                    ' %',
                    style: theme.textTheme.bodySmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ] else ...<Widget>[
          ListTile(
            enabled: controller.useFlexColorScheme,
            title: const Text('Dark AppBar elevation'),
            subtitle: Slider(
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
                    style: theme.textTheme.bodySmall,
                  ),
                  Text(
                    controller.appBarElevationDark.toStringAsFixed(1),
                    style: theme.textTheme.bodySmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            enabled: controller.useFlexColorScheme,
            title: const Text('Dark opacity'),
            subtitle: const Text('To use themed opacity, try 85% to 98%'),
          ),
          ListTile(
            title: Slider(
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
                    style: theme.textTheme.bodySmall,
                  ),
                  Text(
                    '${(controller.appBarOpacityDark * 100).toStringAsFixed(0)}'
                    ' %',
                    style: theme.textTheme.bodySmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
        const ListTile(
          title: Text('Background color'),
          subtitle: Text('With component themes enabled you can select scheme '
              'color for the AppBar background color. '
              'Using AppBarStyle is convenient and does not require activating '
              'FlexColorScheme component themes, but this offers more choices. '
              'Selecting a color overrides used AppBarStyle, set it back '
              'to default to use AppBarStyle again.'),
        ),
        if (isLight)
          ColorSchemePopupMenu(
            title: const Text('Light custom background color'),
            labelForDefault: controller.useFlexColorScheme
                ? 'default (AppBarStyle)'
                : 'default (primary)',
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
            title: const Text('Dark custom background color'),
            labelForDefault: controller.useFlexColorScheme
                ? 'default (AppBarStyle)'
                : 'default (surface)',
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
        const Divider(),
        const ListTile(
          title: Text('BottomAppBar'),
          subtitle: Text('Typically used with Scaffold.bottomNavigationBar. '
              'Elevation in FCS defaults to AppBar elevation in M2, '
              'when using M3 it defaults to 3 and gets elevation tint.'),
        ),
        if (isLight) ...<Widget>[
          ListTile(
            enabled: controller.useFlexColorScheme,
            title: const Text('Light BottomAppBar elevation'),
            subtitle: Slider(
              min: -0.5,
              max: 24,
              divisions: 49,
              label: controller.useFlexColorScheme
                  ? controller.bottomAppBarElevationLight == null ||
                          (controller.bottomAppBarElevationLight ?? -0.5) < 0
                      ? controller.useMaterial3
                          ? 'default 3'
                          : controller.appBarElevationLight.toStringAsFixed(1)
                      : (controller.bottomAppBarElevationLight
                              ?.toStringAsFixed(1) ??
                          '')
                  : controller.useMaterial3
                      ? 'default 3'
                      : 'default 8',
              value: controller.useFlexColorScheme
                  ? controller.bottomAppBarElevationLight ?? -0.5
                  : -0.5,
              onChanged: controller.useFlexColorScheme
                  ? (double value) {
                      controller.setBottomAppBarElevationLight(
                          value < 0 ? null : value.roundToDouble());
                    }
                  : null,
            ),
            trailing: Padding(
              padding: const EdgeInsetsDirectional.only(end: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'ELEV',
                    style: theme.textTheme.bodySmall,
                  ),
                  Text(
                    controller.useFlexColorScheme
                        ? controller.bottomAppBarElevationLight == null ||
                                (controller.bottomAppBarElevationLight ??
                                        -0.5) <
                                    0
                            ? controller.useMaterial3
                                ? 'default 3'
                                : controller.appBarElevationLight
                                    .toStringAsFixed(1)
                            : (controller.bottomAppBarElevationLight
                                    ?.toStringAsFixed(1) ??
                                '')
                        : controller.useMaterial3
                            ? 'default 3'
                            : 'default 8',
                    style: theme.textTheme.bodySmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ] else ...<Widget>[
          ListTile(
            enabled: controller.useFlexColorScheme,
            title: const Text('Dark BottomAppBar elevation'),
            subtitle: Slider(
              min: -0.5,
              max: 24,
              divisions: 49,
              label: controller.useFlexColorScheme
                  ? controller.bottomAppBarElevationDark == null ||
                          (controller.bottomAppBarElevationDark ?? -0.5) < 0
                      ? controller.useMaterial3
                          ? 'default 3'
                          : controller.appBarElevationDark.toStringAsFixed(1)
                      : (controller.bottomAppBarElevationDark
                              ?.toStringAsFixed(1) ??
                          '')
                  : controller.useMaterial3
                      ? 'default 3'
                      : 'default 8',
              value: controller.useFlexColorScheme
                  ? controller.bottomAppBarElevationDark ?? -0.5
                  : -0.5,
              onChanged: controller.useFlexColorScheme
                  ? (double value) {
                      controller.setBottomAppBarElevationDark(
                          value < 0 ? null : value.roundToDouble());
                    }
                  : null,
            ),
            trailing: Padding(
              padding: const EdgeInsetsDirectional.only(end: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'ELEV',
                    style: theme.textTheme.bodySmall,
                  ),
                  Text(
                    controller.useFlexColorScheme
                        ? controller.bottomAppBarElevationDark == null ||
                                (controller.bottomAppBarElevationDark ?? -0.5) <
                                    0
                            ? controller.useMaterial3
                                ? 'default 3'
                                : controller.appBarElevationDark
                                    .toStringAsFixed(1)
                            : (controller.bottomAppBarElevationDark
                                    ?.toStringAsFixed(1) ??
                                '')
                        : controller.useMaterial3
                            ? 'default 3'
                            : 'default 8',
                    style: theme.textTheme.bodySmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
        const BottomAppBarShowcase(),
        const SizedBox(height: 16),
      ],
    );
  }
}
