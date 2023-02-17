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
    final double menuOpacity =
        controller.useSubThemes && controller.useFlexColorScheme
            ? controller.menuOpacity ?? 1
            : 1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTile(
          title: Text('PopupMenuButton'),
          subtitle: Text('The PopupMenuButton can be used on any kind of '
              'widget, below it used on its typical icons. The '
              'PopupMenuButton menu has a different implementation '
              'than the newer M3 menus further below.'),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: PopupMenuButtonsShowcase(explainUsage: false),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Border radius'),
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
          title: const Text('Elevation'),
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
          title: const Text('Background color'),
          labelForDefault: 'default (surface)',
          subtitle: const Text(
            'Correct contrast pair color should be used as foreground color, '
            'but PopupMenuButton only gets onSurface color. The cause is being '
            'investigated.',
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
          title: const Text('Background opacity'),
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
                  '${(popupOpacity * 100).toStringAsFixed(0)} %',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const Divider(height: 16),
        const ListTile(
          title: Text('Menus'),
          subtitle: Text('These menu properties are shared by the new M3 '
              'DropdownMenu, MenuAnchor and MenuBar.'),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Border radius'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text('Respects global setting up to max 10. If higher '
                  'than 10 is used, the selection indicator may '
                  'overflow visibly in the rounded corners.'),
              Slider(
                min: -1,
                max: 12,
                divisions: 13,
                label: controller.useSubThemes && controller.useFlexColorScheme
                    ? controller.menuRadius == null ||
                            (controller.menuRadius ?? -1) < 0
                        ? 'default 4'
                        : (controller.menuRadius?.toStringAsFixed(0) ?? '')
                    : 'default 4',
                value: controller.useSubThemes && controller.useFlexColorScheme
                    ? controller.menuRadius ?? -1
                    : -1,
                onChanged:
                    controller.useSubThemes && controller.useFlexColorScheme
                        ? (double value) {
                            controller.setMenuRadius(
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
                      ? controller.menuRadius == null ||
                              (controller.menuRadius ?? -1) < 0
                          ? popupMenuDefaultRadiusLabel
                          : (controller.menuRadius?.toStringAsFixed(0) ?? '')
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
          title: const Text('Elevation'),
          subtitle: Slider(
            min: -1,
            max: 20,
            divisions: 21,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.menuElevation == null ||
                        (controller.menuElevation ?? -1) < 0
                    ? 'default 3'
                    : (controller.menuElevation?.toStringAsFixed(0) ?? '')
                : 'default 3',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.menuElevation ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setMenuElevation(
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
                      ? controller.menuElevation == null ||
                              (controller.menuElevation ?? -1) < 0
                          ? 'default 3'
                          : (controller.menuElevation?.toStringAsFixed(0) ?? '')
                      : 'default 3',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ColorSchemePopupMenu(
          title: const Text('Background color'),
          labelForDefault: 'default (surface)',
          index: controller.menuSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setMenuSchemeColor(null);
                  } else {
                    controller.setMenuSchemeColor(SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Background opacity'),
          subtitle: Slider(
            max: 100,
            divisions: 100,
            label: (menuOpacity * 100).toStringAsFixed(0),
            value: menuOpacity * 100,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setMenuOpacity(value / 100);
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
                  '${(menuOpacity * 100).toStringAsFixed(0)} %',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),

        // const SizedBox(height: 16),
        const ListTile(
          title: Text('DropdownMenu'),
          subtitle: Text('The text input area uses the themed '
              'InputDecoration.'),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: DropDownMenuShowcase(),
        ),
        const SizedBox(height: 16),
        const ListTile(
          title: Text('MenuAnchor'),
          subtitle: Text('The MenuAnchor can be used to attach a menu to any '
              'widget. It is based on same building blocks as the MenuBar, '
              'using SubMenuButton with MenuItemButton. It can have sub-menus '
              'and keyboard shortcuts.'),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: MenuAnchorShowcase(explainUsage: false),
        ),
        const SizedBox(height: 16),
        const ListTile(
          title: Text('MenuBar'),
          subtitle: Text('The MenuBar is made up of SubMenuButtons that have '
              'MenuItemButtons. You can construct arbitrary deep nested '
              'sub-menus. Menu items can have keyboard shortcuts.'),
        ),
        const SizedBox(height: 8),
        const MenuBarShowcase(explainUsage: false),
        const SizedBox(height: 16),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('MenuBar border radius'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text('For an edge-to-edge design use 0 dp. '
                  'The M3 guide shows menu bar as edge-to-edge with no '
                  'corner rounding, Flutter defaults to 4 dp.'),
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
                          ? 'default 4'
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
                'has shadow in M3. To be able to use elevation with '
                'only elevation tint in M3, turn ON to remove the shadow.'),
            value: controller.menuBarShadowColor == Colors.transparent,
            onChanged: (bool removeShadow) {
              if (removeShadow) {
                controller.setMenuBarShadowColor(Colors.transparent);
              } else {
                controller.setMenuBarShadowColor(null);
              }
            }),
        const SizedBox(height: 8),
      ],
    );
  }
}
