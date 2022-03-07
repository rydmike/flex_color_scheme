import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/header_card.dart';
import '../../../../shared/widgets/universal/switch_list_tile_adaptive.dart';
import '../../../../shared/widgets/universal/theme_showcase.dart';
import '../../shared/color_scheme_popup_menu.dart';
import 'system_nav_bar_style_buttons.dart';

// Panel used to control the sub-theme for BottomNavigationBar and
// NavigationBar as well as system navigation bar on Android.
class NavigationBarSettings extends StatelessWidget {
  const NavigationBarSettings(
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
    final double navBarElevation =
        controller.useSubThemes && controller.useFlexColorScheme
            ? controller.bottomNavigationBarElevation
            : 8;
    return HeaderCard(
      isOpen: isOpen,
      onTap: onTap,
      title: const Text('Navigation Bar Settings'),
      child: Column(
        children: <Widget>[
          ColorSchemePopupMenu(
            title: const Text('Background color'),
            subtitle: const Text('Shared setting, also used by NavigationRail. '
                'APIs have own properties'),
            index: controller.navBarBackgroundSchemeColor?.index ?? -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setNavBarBackgroundSchemeColor(null);
                    } else {
                      controller.setNavBarBackgroundSchemeColor(
                          SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
          const ListTile(
            title: Text('Background opacity'),
            subtitle: Text('Opacity on background on all bars, also used by '
                'NavigationRail. APIs have own properties'),
          ),
          ListTile(
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
          const ListTile(
            title: Text('BottomNavigationBar elevation'),
            subtitle: Text('Shared setting with NavigationRail. APIs '
                'have own properties'),
          ),
          ListTile(
            title: Slider.adaptive(
              max: 24,
              divisions: 48,
              label: navBarElevation.toStringAsFixed(1),
              value: navBarElevation,
              onChanged:
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.setBottomNavigationBarElevation
                      : null,
            ),
            trailing: Padding(
              padding: const EdgeInsetsDirectional.only(end: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'ELEV',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Text(
                    navBarElevation.toStringAsFixed(1),
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          ColorSchemePopupMenu(
            title: const Text('Item selection indicator color on '
                'NavigationBar'),
            subtitle: const Text('Shared setting with NavigationRail. APIs '
                'have own properties'),
            index: controller.navBarHighlight?.index ?? -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setNavBarHighlight(null);
                    } else {
                      controller.setNavBarHighlight(SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
          ColorSchemePopupMenu(
            title: const Text('Item color on navigation bars'),
            subtitle: const Text('Shared setting with NavigationRail. APIs '
                'have own properties'),
            index: controller.navBarSelectedSchemeColor?.index ?? -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setNavBarSelectedSchemeColor(null);
                    } else {
                      controller.setNavBarSelectedSchemeColor(
                          SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
          ColorSchemePopupMenu(
            title: const Text('Unselected item color on navigation bars'),
            subtitle: const Text('Shared setting with NavigationRail. APIs '
                'have own properties'),
            index: controller.navUnselectedSchemeColor?.index ?? -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setNavUnselectedSchemeColor(null);
                    } else {
                      controller.setNavUnselectedSchemeColor(
                          SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
          SwitchListTileAdaptive(
            title: const Text('Mute unselected items on '
                'navigation bars'),
            subtitle: const Text('Unselected icon and text are less bright.\n'
                'BottomNavigationBar will also use muted unselected items '
                'as SDK default when this is OFF, if all item colors and '
                'sizes are also at their default values'),
            value: controller.navBarMuteUnselected &&
                controller.useSubThemes &&
                controller.useFlexColorScheme,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.setNavBarMuteUnselected
                : null,
          ),
          const BottomNavigationBarShowcase(),
          const NavigationBarShowcase(),
          const Divider(),
          ListTile(
            title: const Text('Android system navigation bar'),
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
                'on the nav bar when it is enabled'),
            value: controller.useNavDivider,
            onChanged: controller.setUseNavDivider,
          ),
        ],
      ),
    );
  }
}
