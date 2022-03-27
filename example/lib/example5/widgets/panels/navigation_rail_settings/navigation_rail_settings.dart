import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/navigation_rail_label_type_buttons.dart';
import '../../../../shared/widgets/universal/switch_list_tile_adaptive.dart';
import '../../../../shared/widgets/universal/theme_showcase.dart';
import '../../shared/color_scheme_popup_menu.dart';

class NavigationRailSettings extends StatelessWidget {
  const NavigationRailSettings(this.controller, {Key? key}) : super(key: key);
  final ThemeController controller;

  String explainLabelStyle(final NavigationRailLabelType labelStyle) {
    switch (labelStyle) {
      case NavigationRailLabelType.none:
        return 'Items have no labels';
      case NavigationRailLabelType.selected:
        return 'Only selected item has a label';
      case NavigationRailLabelType.all:
        return 'All items have labels';
    }
  }

  @override
  Widget build(BuildContext context) {
    final double navRailOpacity =
        controller.useSubThemes && controller.useFlexColorScheme
            ? controller.navRailOpacity
            : 1;
    final double navBarElevation =
        controller.useSubThemes && controller.useFlexColorScheme
            ? controller.bottomNavigationBarElevation
            : 8;
    return Column(
      children: <Widget>[
        const SizedBox(height: 8),
        ColorSchemePopupMenu(
          title: const Text('Background color'),
          labelForDefault: 'null (surface)',
          index: controller.navRailBackgroundSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setNavRailBackgroundSchemeColor(null);
                  } else {
                    controller.setNavRailBackgroundSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ListTile(
          title: const Text('Background opacity'),
          subtitle: Slider.adaptive(
            max: 100,
            divisions: 100,
            label: (navRailOpacity * 100).toStringAsFixed(0),
            value: navRailOpacity * 100,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setNavRailOpacity(value / 100);
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
                  // ignore: lines_longer_than_80_chars
                  '${(navRailOpacity * 100).toStringAsFixed(0)} %',
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
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
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
                  style: Theme.of(context).textTheme.bodySmall,
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
          // TODO(rydmike): Still needed? Sometimes worked without it, weird.
          // This is used as a work around to avoid unnecessarily eager
          // assert in SDK.
          // Assertion: line 562: 'useIndicator || indicatorColor == null'
          // A flag is used to do trickery with transparency for this
          // assertion that we cannot avoid since the theme controls the
          // setup and user it. User may enter combo that has no effect, and
          // triggers the assert.
          // It should be obvious that if you have no indicator color
          // you cannot use an indicator, why assert it? Just don't show one!
          useAssertWorkAround:
              (!controller.useSubThemes || !controller.useFlexColorScheme) &&
                  !controller.useMaterial3,
          child: Column(
            children: <Widget>[
              SwitchListTileAdaptive(
                title: const Text('Use selection indicator'),
                subtitle: const Text('Also ON when ThemeData.useMaterial3 '
                    'is true, turn OFF sub-themes and try it'),
                value: controller.navRailUseIndicator &&
                    controller.useSubThemes &&
                    controller.useFlexColorScheme,
                onChanged:
                    controller.useSubThemes && controller.useFlexColorScheme
                        ? controller.setNavRailUseIndicator
                        : null,
              ),
              ColorSchemePopupMenu(
                title: const Text('Selection indicator color'),
                subtitle: const Text('Shared setting with NavigationBar, APIs '
                    'have own properties'),
                labelForDefault: 'null (secondary)',
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
              ColorSchemePopupMenu(
                title: const Text('Selected item color'),
                subtitle:
                    const Text('Shared setting with navigation bars, APIs '
                        'have own properties'),
                labelForDefault: 'null (primary)',
                index: controller.navBarSelectedSchemeColor?.index ?? -1,
                onChanged: controller.useSubThemes &&
                        controller.useFlexColorScheme
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
                title: const Text('Unselected item color'),
                subtitle:
                    const Text('Shared setting with navigation bars, APIs '
                        'have own properties'),
                labelForDefault:
                    controller.useSubThemes && controller.useFlexColorScheme
                        ? 'null (onSurface)'
                        : 'null (onSurface with opacity)',
                index: controller.navUnselectedSchemeColor?.index ?? -1,
                onChanged: controller.useSubThemes &&
                        controller.useFlexColorScheme
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
                title: const Text('Mute unselected items on NavigationRail'),
                subtitle: const Text(
                    'Unselected icon and text are less bright.\n'
                    'Rail will also use muted unselected items via SDK '
                    'default when this is OFF, if all item colors and sizes '
                    'are also at their default (null) values'),
                value: controller.navBarMuteUnselected &&
                    controller.useSubThemes &&
                    controller.useFlexColorScheme,
                onChanged:
                    controller.useSubThemes && controller.useFlexColorScheme
                        ? controller.setNavBarMuteUnselected
                        : null,
              ),
              ListTile(
                enabled:
                    controller.useSubThemes && controller.useFlexColorScheme,
                title: const Text('Labels when rail is collapsed'),
                subtitle: Text(explainLabelStyle(
                    controller.useSubThemes && controller.useFlexColorScheme
                        ? controller.navRailLabelType
                        : NavigationRailLabelType.none)),
                trailing: NavigationRailLabelTypeButtons(
                  style:
                      controller.useSubThemes && controller.useFlexColorScheme
                          ? controller.navRailLabelType
                          : NavigationRailLabelType.none,
                  onChanged:
                      controller.useSubThemes && controller.useFlexColorScheme
                          ? controller.setNavRailLabelType
                          : null,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
