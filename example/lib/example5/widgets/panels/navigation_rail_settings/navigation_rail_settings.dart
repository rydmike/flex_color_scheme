import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/header_card.dart';
import '../../../../shared/widgets/universal/switch_list_tile_adaptive.dart';
import '../../../../shared/widgets/universal/theme_showcase.dart';
import '../../shared/color_scheme_popup_menu.dart';

class NavigationRailSettings extends StatelessWidget {
  const NavigationRailSettings(
      {Key? key,
      required this.controller,
      required this.isOpen,
      required this.onTap})
      : super(key: key);
  final ThemeController controller;
  final bool isOpen;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    // final bool isLight = Theme.of(context).brightness == Brightness.light;
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
      title: const Text('Navigation Rail Settings'),
      child: Column(
        children: <Widget>[
          ColorSchemePopupMenu(
            title: const Text('Background color'),
            subtitle: const Text('Shared setting, also used by '
                'navigation bars. APIs have own properties'),
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
            subtitle: Text('Opacity on background, also used by '
                'navigation bars. APIs have own properties'),
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
          // const Divider(),
          const ListTile(
              title: Text('Elevation'),
              subtitle: Text('Setting shared with BottomNavigationBar. '
                  'APIs have own properties')),
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
          NavigationRailShowcase(
            height: 700,
            useIndicator: controller.useIndicator,
            onChangedUseIndicator: controller.setUseIndicator,
            child: Column(
              children: <Widget>[
                ColorSchemePopupMenu(
                  title: const Text('Item color'),
                  subtitle:
                      const Text('Shared setting with navigation bars. APIs '
                          'have own properties'),
                  index: controller.navBarScheme?.index ?? -1,
                  onChanged: controller.useSubThemes &&
                          controller.useFlexColorScheme
                      ? (int index) {
                          if (index < 0 || index >= SchemeColor.values.length) {
                            controller.setNavBarScheme(null);
                          } else {
                            controller
                                .setNavBarScheme(SchemeColor.values[index]);
                          }
                        }
                      : null,
                ),
                const SizedBox(height: 8),
                ColorSchemePopupMenu(
                  title: const Text('Item indicator color'),
                  subtitle:
                      const Text('Shared setting with NavigationBar. APIs '
                          'have own properties'),
                  index: controller.navBarHighlight?.index ?? -1,
                  onChanged: controller.useSubThemes &&
                          controller.useFlexColorScheme
                      ? (int index) {
                          if (index < 0 || index >= SchemeColor.values.length) {
                            controller.setNavBarHighlight(null);
                          } else {
                            controller
                                .setNavBarHighlight(SchemeColor.values[index]);
                          }
                        }
                      : null,
                ),
                SwitchListTileAdaptive(
                  title: const Text('Slight opacity on unselected items on '
                      'NavigationRail'),
                  subtitle:
                      const Text('Unselected icon and text are less bright. '
                          'The NavigationRail uses this by default too.'),
                  value: controller.navBarMuteUnselected &&
                      controller.useSubThemes &&
                      controller.useFlexColorScheme,
                  onChanged:
                      controller.useSubThemes && controller.useFlexColorScheme
                          ? controller.setNavBarMuteUnselected
                          : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
