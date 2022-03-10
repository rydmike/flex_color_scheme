import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/header_card.dart';
import '../../../../shared/widgets/universal/switch_list_tile_adaptive.dart';
import 'system_nav_bar_style_buttons.dart';

// Panel used to control the themed Android system navigation bar on Android.
//
// Demo on how to use AnnotatedRegion with
// FlexColorScheme.themedSystemNavigationBar.
// This feature only has any impact on Android builds and requires the
// setup of an annotated region to be used in the app. The
// FlexColorScheme.themedSystemNavigationBar is a static helpers to
// that can be used to style the Android System navigation bar in a style
// that matches your used FlexColorScheme baased theme.
class AndroidNavigationBarSettings extends StatelessWidget {
  const AndroidNavigationBarSettings(
      {Key? key,
      required this.controller,
      required this.isOpen,
      required this.onTap})
      : super(key: key);
  final ThemeController controller;
  final bool isOpen;
  final VoidCallback onTap;

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
    final double navBarOpacity =
        controller.useSubThemes && controller.useFlexColorScheme
            ? controller.bottomNavigationBarOpacity
            : 1;
    return HeaderCard(
      isOpen: isOpen,
      onTap: onTap,
      title: const Text('Android System Navigation Bar Settings'),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 8),
          const ListTile(
            title: Text('Themed Android system navigation bar'),
            subtitle: Text('This feature is only visible if you '
                'build this application for an Android device. It '
                'demonstrates the usage of the AnnotatedRegion helper '
                'FlexColorScheme.themedSystemNavigationBar.'),
          ),
          ListTile(
            enabled: controller.useSubThemes && controller.useFlexColorScheme,
            title: const Text('Background opacity'),
            subtitle: const Text('Shared setting in this app, but APIs have '
                'own properties'),
          ),
          ListTile(
            enabled: controller.useSubThemes && controller.useFlexColorScheme,
            title: Slider.adaptive(
              max: 100,
              divisions: 100,
              label: (navBarOpacity * 100).toStringAsFixed(0),
              value: navBarOpacity * 100,
              onChanged:
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? (double value) {
                          controller.setBottomNavigationBarOpacity(value / 100);
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
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Text(
                    // ignore: lines_longer_than_80_chars
                    '${(navBarOpacity * 100).toStringAsFixed(0)} %',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          ListTile(
            title: const Text('Android system navigation bar style'),
            subtitle: Text('Using FlexColorScheme.themedSystemNavigationBar.\n'
                '${explainStyle(controller.navBarStyle, isLight)}'),
          ),
          ListTile(
            trailing: SystemNavBarStyleButtons(
              style: controller.navBarStyle,
              onChanged: controller.setNavBarStyle,
            ),
          ),
          SwitchListTileAdaptive(
            title: const Text('Android navigation bar divider'),
            subtitle: const Text('There is also an extra system built-in scrim '
                'on the nav bar when it is enabled. Recommend not enabling it '
                'if using opacity or fully transparent version.'),
            value: controller.useNavDivider,
            onChanged: controller.setUseNavDivider,
          ),
        ],
      ),
    );
  }
}
