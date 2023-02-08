import 'dart:math' as math;

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/theme_showcase.dart';
import '../../shared/color_scheme_popup_menu.dart';

class MenuSettings extends StatelessWidget {
  const MenuSettings(this.controller, {super.key});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;

    final double popupEffectiveRadius = controller.popupMenuBorderRadius ??
        math.min(controller.defaultRadius ?? 4.0, 10.0);
    final String popupMenuDefaultRadiusLabel =
        controller.popupMenuBorderRadius == null &&
                controller.defaultRadius == null
            ? 'default 4'
            : controller.popupMenuBorderRadius == null &&
                    controller.defaultRadius != null
                ? 'global ${popupEffectiveRadius.toStringAsFixed(0)}'
                : '';
    final String popupMenuElevationDefaultLabel =
        controller.popupMenuElevation == null
            ? useMaterial3
                ? 'default 3'
                : 'default 6'
            : '';
    final double popupOpacity =
        controller.useSubThemes && controller.useFlexColorScheme
            ? controller.popupMenuOpacity
            : 1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTile(
          title: Text('Menus'),
          subtitle: Text('The theming below only concerns the opened menu.'),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Menu border radius, follows global to max 10'),
          subtitle: Slider(
            min: -1,
            max: 12,
            divisions: 13,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.popupMenuBorderRadius == null ||
                        (controller.popupMenuBorderRadius ?? -1) < 0
                    ? popupMenuDefaultRadiusLabel
                    : (controller.popupMenuBorderRadius?.toStringAsFixed(0) ??
                        '')
                : 'default 4',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.popupMenuBorderRadius ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setPopupMenuBorderRadius(
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
                  'RADIUS',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.popupMenuBorderRadius == null ||
                              (controller.popupMenuBorderRadius ?? -1) < 0
                          ? popupMenuDefaultRadiusLabel
                          : (controller.popupMenuBorderRadius
                                  ?.toStringAsFixed(0) ??
                              '')
                      : 'default 4',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Menu elevation'),
          subtitle: Slider(
            min: -1,
            max: 20,
            divisions: 21,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.popupMenuElevation == null ||
                        (controller.popupMenuElevation ?? -1) < 0
                    ? popupMenuElevationDefaultLabel
                    : (controller.popupMenuElevation?.toStringAsFixed(0) ?? '')
                : useMaterial3
                    ? 'default 3'
                    : 'default 8',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.popupMenuElevation ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setPopupMenuElevation(
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
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.popupMenuElevation == null ||
                              (controller.popupMenuElevation ?? -1) < 0
                          ? popupMenuElevationDefaultLabel
                          : (controller.popupMenuElevation
                                  ?.toStringAsFixed(0) ??
                              '')
                      : useMaterial3
                          ? 'default 3'
                          : 'default 8',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ColorSchemePopupMenu(
          title: const Text('Menu background color'),
          labelForDefault: 'default (surface)',
          subtitle: const Text(
            'In current version of FCS, only colors that work '
            'with the contrasting color for surface are usable options.',
          ),
          index: controller.popupMenuSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setPopupMenuSchemeColor(null);
                  } else {
                    controller
                        .setPopupMenuSchemeColor(SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Menu background opacity'),
          subtitle: Slider(
            max: 100,
            divisions: 100,
            label: (popupOpacity * 100).toStringAsFixed(0),
            value: popupOpacity * 100,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setPopupMenuOpacity(value / 100);
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
                  '${(popupOpacity * 100).toStringAsFixed(0)} %',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const Divider(),
        const ListTile(
          title: Text('PopupMenuButton'),
          subtitle: Text('The PopupMenuButton can be used on any kind of '
              'widget, below a custom TextButton is being used.'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          // The button used in the PopupMenuShowcase to open the PopupMenu
          // is not a native widget, only the menu is, and it is the one that
          // is themed.
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: const <Widget>[
              PopupMenuButtonShowcase(),
              PopupMenuButtonTilesShowcase(),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const ListTile(
          title: Text('DropdownMenu'),
          subtitle: Text('New component in M3. Text input area uses the active '
              'InputDecorationTheme in FCS. The DropdownMenu will get more '
              'styling options in FCS later versions, e.g. tuning the default '
              'selection highlight style.'),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: DropDownMenuShowcase(),
        ),
        const SizedBox(height: 16),
        const ListTile(
          title: Text('MenuBar'),
          subtitle: Text('New component in M3. MenuBar is made up of '
              'SubMenuButton with MenuItemButton. The MenuBar will get more '
              'styling options in FCS later versions.'),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: MenuBarShowcase(explainUsage: false),
        ),
        const SizedBox(height: 16),
        const ListTile(
          title: Text('MenuAnchor'),
          subtitle: Text('New component in M3. The MenuAnchor can be used to '
              'attach a menu to any widget. It uses the same building blocks '
              'as the MenuBar, SubMenuButton with MenuItemButton. It can thus '
              'have sub-menus and keyboard shortcuts, like the MenuBar. '
              'The MenuAnchor will get more '
              'styling options in FCS later versions.'),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: MenuAnchorShowcase(explainUsage: false),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
