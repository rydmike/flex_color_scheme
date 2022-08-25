import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import 'system_nav_bar_style_buttons.dart';

// Panel used to control the themed Android system navigation bar on Android.
//
// Demo on how to use AnnotatedRegion with
// FlexColorScheme.themedSystemNavigationBar.
// This feature only has any impact on Android builds and requires the
// setup of an annotated region to be used in the app. The
// FlexColorScheme.themedSystemNavigationBar is a static helpers to
// that can be used to style the Android System navigation bar in a style
// that matches your used FlexColorScheme based theme.
class AndroidNavigationBarSettings extends StatelessWidget {
  const AndroidNavigationBarSettings(this.controller, {super.key});
  final ThemeController controller;

  String explainStyle(final FlexSystemNavBarStyle style, final bool isLight) {
    switch (style) {
      case FlexSystemNavBarStyle.system:
        return isLight
            ? 'System, white with opacity in light mode'
            : 'System, black with opacity in dark mode';
      case FlexSystemNavBarStyle.surface:
        return 'Surface color, with opacity & alpha blend';
      case FlexSystemNavBarStyle.background:
        return 'Background color, with opacity & alpha blend';
      case FlexSystemNavBarStyle.scaffoldBackground:
        return 'Scaffold background, with opacity & alpha blend';
      case FlexSystemNavBarStyle.transparent:
        return 'Fully transparent regardless of opacity value';
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isLight = Theme.of(context).brightness == Brightness.light;
    final double navBarOpacity = controller.sysNavBarOpacity;
    return Column(
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTile(
          title: Text('Themed Android system navigation bar'),
          subtitle: Text('This feature only has any effect if you '
              'build this application for an Android device. It '
              'demonstrates the usage of the AnnotatedRegion helper '
              'FlexColorScheme themedSystemNavigationBar. These '
              'settings do not have any impact on generated theme setup code. '
              'You have to implement the AnnotatedRegion with the helper '
              'separately.'),
        ),
        const ListTile(
          title: Text('Background opacity'),
          subtitle: Text('System navigation bar opacity'),
        ),
        ListTile(
          title: Slider.adaptive(
            max: 100,
            divisions: 100,
            label: (navBarOpacity * 100).toStringAsFixed(0),
            value: navBarOpacity * 100,
            onChanged: (double value) {
              controller.setSysBarOpacity(value / 100);
            },
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
                  // ignore: lines_longer_than_80_chars
                  '${(navBarOpacity * 100).toStringAsFixed(0)} %',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        ListTile(
          title: const Text('Android system navigation bar style'),
          subtitle: Text('Using themedSystemNavigationBar\n'
              '${explainStyle(controller.sysNavBarStyle, isLight)}'),
        ),
        ListTile(
          trailing: SystemNavBarStyleButtons(
            style: controller.sysNavBarStyle,
            onChanged: controller.setSysNavBarStyle,
          ),
        ),
        // TODO(rydmike): Put back when issue #100027 is resolved.
        // This switch is removed from demo until issue:
        // https://github.com/flutter/flutter/issues/100027
        // Has been resolved and landed in Flutter stable.
        //
        // SwitchListTileAdaptive(
        //   title: const Text('Android navigation bar divider'),
        //   subtitle: const Text('There is also an extra system built-in '
        //       'scrim on the nav bar when it is enabled. Recommend not '
        //       'enabling it '
        //       'if using opacity or fully transparent version.'),
        //   value: controller.useNavDivider,
        //   onChanged: controller.setUseNavDivider,
        // ),
        const SizedBox(height: 8),
      ],
    );
  }
}
