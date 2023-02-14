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
          subtitle: Text('The menu theming properties are shared '
              'in FCS across multiple component sub-themes to ensure a '
              'consistent style on all menu components whenever possible.'),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Menu container border radius'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text('Respects global setting up to max 10. If higher '
                  'than 10 is used, the selection indicator on '
                  'PopupMenuButton overflows visibly in the rounded corners.'),
              Slider(
                min: -1,
                max: 12,
                divisions: 13,
                label: controller.useSubThemes && controller.useFlexColorScheme
                    ? controller.popupMenuBorderRadius == null ||
                            (controller.popupMenuBorderRadius ?? -1) < 0
                        ? popupMenuDefaultRadiusLabel
                        : (controller.popupMenuBorderRadius
                                ?.toStringAsFixed(0) ??
                            '')
                    : 'default 4',
                value: controller.useSubThemes && controller.useFlexColorScheme
                    ? controller.popupMenuBorderRadius ?? -1
                    : -1,
                onChanged:
                    controller.useSubThemes && controller.useFlexColorScheme
                        ? (double value) {
                            controller.setPopupMenuBorderRadius(
                                value < 0 ? null : value.roundToDouble());
                          }
                        : null,
              ),
            ],
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
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.popupMenuBorderRadius == null ||
                              (controller.popupMenuBorderRadius ?? -1) < 0
                          ? popupMenuDefaultRadiusLabel
                          : (controller.popupMenuBorderRadius
                                  ?.toStringAsFixed(0) ??
                              '')
                      : 'default 4',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Menu container elevation'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text('Menu containers still have a drop shadow by default '
                  'in M3. They also use surface elevation tint, which is '
                  'useful in dark mode.'),
              Slider(
                min: -1,
                max: 20,
                divisions: 21,
                label: controller.useSubThemes && controller.useFlexColorScheme
                    ? controller.popupMenuElevation == null ||
                            (controller.popupMenuElevation ?? -1) < 0
                        ? popupMenuElevationDefaultLabel
                        : (controller.popupMenuElevation?.toStringAsFixed(0) ??
                            '')
                    : useMaterial3
                        ? 'default 3'
                        : 'default 8',
                value: controller.useSubThemes && controller.useFlexColorScheme
                    ? controller.popupMenuElevation ?? -1
                    : -1,
                onChanged:
                    controller.useSubThemes && controller.useFlexColorScheme
                        ? (double value) {
                            controller.setPopupMenuElevation(
                                value < 0 ? null : value.roundToDouble());
                          }
                        : null,
              ),
            ],
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
            'Correct contrast pair color will be used as foreground color '
            'automatically for menu container content in DropDownMenu, '
            'MenuBar and MenuAnchor. PopupMenuButton currently '
            'only supports onSurface as content color. The cause is being '
            'investigated, potential Flutter issue.',
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
          title: const Text('Menu container background opacity'),
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
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  // ignore: lines_longer_than_80_chars
                  '${(popupOpacity * 100).toStringAsFixed(0)} %',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const Divider(height: 32),
        const ListTile(
          title: Text('PopupMenuButton'),
          subtitle: Text('The PopupMenuButton can be used on any kind of '
              'widget, below a custom TextButton is being used. The '
              'PopupMenuButton has a different implementation in Flutter '
              'than the newer M3 menus further below. The properties '
              'originally used to only theme it, are now also used '
              'to style equivalent properties in the newer menus.'),
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
        const Divider(height: 32),
        // const SizedBox(height: 16),
        const ListTile(
          title: Text('DropdownMenu'),
          subtitle: Text('Text input area uses the themed '
              'InputDecoration settings. Other theming properties are '
              'shared with the PopupMenuButton.'),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: DropDownMenuShowcase(),
        ),
        const SizedBox(height: 16),
        const Divider(),
        const ListTile(
          title: Text('MenuBar'),
          subtitle: Text('THe MenuBar is made up of SubMenuButtons that have '
              'MenuItemButtons. You can construct arbitrary deep nested '
              'sub-menus and items can have keyboard shortcuts.'),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('MenuBar border radius'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text('For a nice edge-to-edge look, consider using 0 dp. '
                  'The M3 guide depicts MenuBar as edge-to-edge with no '
                  'corner rounding, but Flutter M3 defaults to 4 dp.'),
              Slider(
                min: -1,
                max: 30,
                divisions: 31,
                label: controller.useSubThemes && controller.useFlexColorScheme
                    ? controller.menuBarRadius == null ||
                            (controller.menuBarRadius ?? -1) < 0
                        ? 'default 4'
                        : (controller.menuBarRadius?.toStringAsFixed(0) ?? '')
                    : 'default 4',
                value: controller.useSubThemes && controller.useFlexColorScheme
                    ? controller.menuBarRadius ?? -1
                    : -1,
                onChanged:
                    controller.useSubThemes && controller.useFlexColorScheme
                        ? (double value) {
                            controller.setMenuBarRadius(
                                value < 0 ? null : value.roundToDouble());
                          }
                        : null,
              ),
            ],
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
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.menuBarRadius == null ||
                              (controller.menuBarRadius ?? -1) < 0
                          ? popupMenuDefaultRadiusLabel
                          : (controller.menuBarRadius?.toStringAsFixed(0) ?? '')
                      : 'default 4',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('MenuBar elevation'),
          subtitle: Slider(
            min: -1,
            max: 30,
            divisions: 31,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.menuBarElevation == null ||
                        (controller.menuBarElevation ?? -1) < 0
                    ? 'default 3'
                    : (controller.menuBarElevation?.toStringAsFixed(0) ?? '')
                : 'default 3',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.menuBarElevation ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setMenuBarElevation(
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
                      ? controller.menuBarElevation == null ||
                              (controller.menuBarElevation ?? -1) < 0
                          ? 'default 3'
                          : (controller.menuBarElevation?.toStringAsFixed(0) ??
                              '')
                      : 'default 3',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        SwitchListTile(
            title: const Text('Remove elevation shadow'),
            subtitle: const Text('The M3 guide depicts MenuBars with no '
                'shadow and optional elevation with tint. Flutter defaults '
                'has shadow in M3. To be able to use elevation with only '
                'elevation tint in M3, turn ON to remove the shadow.'),
            value: controller.menuBarShadowColor == Colors.transparent,
            onChanged: (bool removeShadow) {
              if (removeShadow) {
                controller.setMenuBarShadowColor(Colors.transparent);
              } else {
                controller.setMenuBarShadowColor(null);
              }
            }),
        const SizedBox(height: 8),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: MenuBarShowcase(explainUsage: false),
        ),
        const SizedBox(height: 16),
        const ListTile(
          title: Text('MenuAnchor'),
          subtitle: Text('The MenuAnchor can be used to attach a menu to any '
              'widget. It is based on same building blocks as the MenuBar by '
              'using SubMenuButton with MenuItemButton. It can have sub-menus '
              'and keyboard shortcuts, like the MenuBar.'),
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
