import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../shared/color_scheme_popup_menu.dart';

class MenuSettings extends StatelessWidget {
  const MenuSettings(this.controller, {super.key});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;

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

    final String menuBarDefault = controller.menuSchemeColor == null
        ? 'default (surface)'
        // ignore: lines_longer_than_80_chars
        : 'default (${SchemeColor.values[controller.menuSchemeColor!.index].name})';

    final String menuItemDefault = controller.menuSchemeColor == null
        ? 'default (surface)'
        // ignore: lines_longer_than_80_chars
        : 'default (${SchemeColor.values[controller.menuSchemeColor!.index].name})';

    final String menuOnItemDefault = controller.menuSchemeColor == null
        ? 'default (onSurface)'
        // ignore: lines_longer_than_80_chars
        : 'default (${SchemeColor.values[FlexSubThemes.onSchemeColor(controller.menuSchemeColor!).index].name})';

    final String overlayStyle = controller.interactionEffects
        ? ' with tinted overlay'
        : ' with default overlay';

    final String menuIndicatorDefault = controller.menuSchemeColor == null &&
            controller.menuItemBackgroundSchemeColor == null
        ? 'default (surface$overlayStyle)'
        : controller.menuItemBackgroundSchemeColor == null
            // ignore: lines_longer_than_80_chars
            ? 'default (${SchemeColor.values[controller.menuSchemeColor!.index].name}$overlayStyle)'
            // ignore: lines_longer_than_80_chars
            : 'default (${SchemeColor.values[controller.menuItemBackgroundSchemeColor!.index].name}$overlayStyle)';

    final String menuOnIndicatorDefault = controller.menuSchemeColor == null &&
            controller.menuItemBackgroundSchemeColor == null &&
            controller.menuIndicatorBackgroundSchemeColor == null
        ? 'default (onSurface)'
        : controller.menuIndicatorBackgroundSchemeColor == null
            ? controller.menuItemBackgroundSchemeColor == null
                // ignore: lines_longer_than_80_chars
                ? 'default (${SchemeColor.values[FlexSubThemes.onSchemeColor(controller.menuSchemeColor!).index].name})'
                // ignore: lines_longer_than_80_chars
                : 'default (${SchemeColor.values[FlexSubThemes.onSchemeColor(controller.menuItemBackgroundSchemeColor!).index].name})'
            // ignore: lines_longer_than_80_chars
            : 'default (${SchemeColor.values[FlexSubThemes.onSchemeColor(controller.menuIndicatorBackgroundSchemeColor!).index].name})';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTile(
          title: Text('PopupMenuButton'),
          subtitle: Text('The PopupMenuButton can be used on any kind of '
              'widget, below it used on its typical icons. The Flutter '
              'PopupMenuButton menu implementation differs from the '
              'Material 3 menus below.'),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: PopupMenuButtonsShowcase(explainUsage: false),
        ),
        ColorSchemePopupMenu(
          title: const Text('Background color of popup menu container'),
          labelForDefault: 'default (surface)',
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
        const ListTile(
          dense: true,
          subtitle: Text('FCS tries to use correct contrast pair color as '
              'foreground color, but PopupMenuButton only uses onSurface '
              'color. The cause is being investigated, potentially a theming '
              'bug in Flutter SDK. For now only background colors with '
              'same brightness as surface color are usable.'),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Opacity of popup menu container'),
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
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Border radius of popup menu container'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text('Does not use global radius override. '
                  'Avoid large border radius on menus.'),
              Slider(
                min: -1,
                max: 12,
                divisions: 13,
                label: controller.useSubThemes && controller.useFlexColorScheme
                    ? controller.popupMenuBorderRadius == null ||
                            (controller.popupMenuBorderRadius ?? -1) < 0
                        ? 'default 4'
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
                          ? 'default 4'
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
          title: const Text('Elevation of popup menu container'),
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
        const Divider(height: 16),
        //
        // Menu
        //
        const ListTile(
          title: Text('Menu containers'),
          subtitle: Text('Menu container theming properties are shared by '
              'DropdownMenu, MenuAnchor and MenuBar. You can see applied '
              'container styles when you open test menus further below.'),
        ),
        ColorSchemePopupMenu(
          title: const Text('Background color of menu container'),
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
          title: const Text('Opacity of menu container'),
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
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Border radius of menu container'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text('Does not use global radius override. '
                  'Avoid large border radius on menus.'),
              Slider(
                min: -1,
                max: 24,
                divisions: 25,
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
                          ? 'default 4'
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
          title: const Text('Elevation of menu container'),
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

        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Padding of menu container content'),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                contentPadding: const EdgeInsetsDirectional.only(start: 16),
                enabled:
                    controller.useSubThemes && controller.useFlexColorScheme,
                title: Slider(
                  min: -1,
                  max: 32,
                  divisions: 33,
                  label: controller.useSubThemes &&
                          controller.useFlexColorScheme
                      ? controller.menuPaddingStart == null ||
                              (controller.menuPaddingStart ?? -1) < 0
                          ? 'default 0'
                          : (controller.menuPaddingStart?.toStringAsFixed(0) ??
                              '')
                      : 'default 0',
                  value:
                      controller.useSubThemes && controller.useFlexColorScheme
                          ? controller.menuPaddingStart ?? -1
                          : -1,
                  onChanged:
                      controller.useSubThemes && controller.useFlexColorScheme
                          ? (double value) {
                              controller.setMenuPaddingStart(
                                  value < 0 ? null : value.roundToDouble());
                            }
                          : null,
                ),
                trailing: SizedBox(
                  width: 58,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'START',
                        style: theme.textTheme.bodySmall,
                      ),
                      Text(
                        controller.useSubThemes && controller.useFlexColorScheme
                            ? controller.menuPaddingStart == null ||
                                    (controller.menuPaddingStart ?? -1) < 0
                                ? 'default 0'
                                : (controller.menuPaddingStart
                                        ?.toStringAsFixed(0) ??
                                    '')
                            : 'default 0',
                        style: theme.textTheme.bodySmall!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                contentPadding: const EdgeInsetsDirectional.only(end: 16),
                enabled:
                    controller.useSubThemes && controller.useFlexColorScheme,
                title: Slider(
                  min: -1,
                  max: 32,
                  divisions: 33,
                  label: controller.useSubThemes &&
                          controller.useFlexColorScheme
                      ? controller.menuPaddingEnd == null ||
                              (controller.menuPaddingEnd ?? -1) < 0
                          ? 'default 0'
                          : (controller.menuPaddingEnd?.toStringAsFixed(0) ??
                              '')
                      : 'default 0',
                  value:
                      controller.useSubThemes && controller.useFlexColorScheme
                          ? controller.menuPaddingEnd ?? -1
                          : -1,
                  onChanged:
                      controller.useSubThemes && controller.useFlexColorScheme
                          ? (double value) {
                              controller.setMenuPaddingEnd(
                                  value < 0 ? null : value.roundToDouble());
                            }
                          : null,
                ),
                trailing: Padding(
                  padding: const EdgeInsetsDirectional.only(end: 12),
                  child: SizedBox(
                    width: 58,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'END',
                          style: theme.textTheme.bodySmall,
                        ),
                        Text(
                          controller.useSubThemes &&
                                  controller.useFlexColorScheme
                              ? controller.menuPaddingEnd == null ||
                                      (controller.menuPaddingEnd ?? -1) < 0
                                  ? 'default 0'
                                  : (controller.menuPaddingEnd
                                          ?.toStringAsFixed(0) ??
                                      '')
                              : 'default 0',
                          style: theme.textTheme.bodySmall!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                contentPadding: const EdgeInsetsDirectional.only(start: 16),
                enabled:
                    controller.useSubThemes && controller.useFlexColorScheme,
                title: Slider(
                  min: -1,
                  max: 32,
                  divisions: 33,
                  label: controller.useSubThemes &&
                          controller.useFlexColorScheme
                      ? controller.menuPaddingTop == null ||
                              (controller.menuPaddingTop ?? -1) < 0
                          ? 'default 0'
                          : (controller.menuPaddingTop?.toStringAsFixed(0) ??
                              '')
                      : 'default 0',
                  value:
                      controller.useSubThemes && controller.useFlexColorScheme
                          ? controller.menuPaddingTop ?? -1
                          : -1,
                  onChanged:
                      controller.useSubThemes && controller.useFlexColorScheme
                          ? (double value) {
                              controller.setMenuPaddingTop(
                                  value < 0 ? null : value.roundToDouble());
                            }
                          : null,
                ),
                trailing: SizedBox(
                  width: 58,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'TOP',
                        style: theme.textTheme.bodySmall,
                      ),
                      Text(
                        controller.useSubThemes && controller.useFlexColorScheme
                            ? controller.menuPaddingTop == null ||
                                    (controller.menuPaddingTop ?? -1) < 0
                                ? 'default 0'
                                : (controller.menuPaddingTop
                                        ?.toStringAsFixed(0) ??
                                    '')
                            : 'default 0',
                        style: theme.textTheme.bodySmall!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                contentPadding: const EdgeInsetsDirectional.only(end: 16),
                enabled:
                    controller.useSubThemes && controller.useFlexColorScheme,
                title: Slider(
                  min: -1,
                  max: 32,
                  divisions: 33,
                  label: controller.useSubThemes &&
                          controller.useFlexColorScheme
                      ? controller.menuPaddingBottom == null ||
                              (controller.menuPaddingBottom ?? -1) < 0
                          ? 'default 0'
                          : (controller.menuPaddingBottom?.toStringAsFixed(0) ??
                              '')
                      : 'default 0',
                  value:
                      controller.useSubThemes && controller.useFlexColorScheme
                          ? controller.menuPaddingBottom ?? -1
                          : -1,
                  onChanged:
                      controller.useSubThemes && controller.useFlexColorScheme
                          ? (double value) {
                              controller.setMenuPaddingBottom(
                                  value < 0 ? null : value.roundToDouble());
                            }
                          : null,
                ),
                trailing: Padding(
                  padding: const EdgeInsetsDirectional.only(end: 12),
                  child: SizedBox(
                    width: 58,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'BOTTOM',
                          style: theme.textTheme.bodySmall,
                        ),
                        Text(
                          controller.useSubThemes &&
                                  controller.useFlexColorScheme
                              ? controller.menuPaddingBottom == null ||
                                      (controller.menuPaddingBottom ?? -1) < 0
                                  ? 'default 0'
                                  : (controller.menuPaddingBottom
                                          ?.toStringAsFixed(0) ??
                                      '')
                              : 'default 0',
                          style: theme.textTheme.bodySmall!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        //
        // Menu items
        //
        const Divider(),
        const ListTile(
          title: Text('Menu items'),
          subtitle: Text('Styling of menu items are used by SubmenuButton and '
              'MenuItemButton, that are used in DropdownMenu, MenuAnchor and '
              'MenuBar. You can see applied menu item styles when you open '
              'test menus further below.'),
        ),
        ColorSchemePopupMenu(
          title: const Text('Menu item background color'),
          labelForDefault: menuItemDefault,
          index: controller.menuItemBackgroundSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setMenuItemBackgroundSchemeColor(null);
                  } else {
                    controller.setMenuItemBackgroundSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ColorSchemePopupMenu(
          title: const Text('Menu item foreground color'),
          labelForDefault: menuOnItemDefault,
          index: controller.menuItemForegroundSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setMenuItemForegroundSchemeColor(null);
                  } else {
                    controller.setMenuItemForegroundSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ColorSchemePopupMenu(
          title: const Text('Highlighted menu item background color'),
          labelForDefault: menuIndicatorDefault,
          index: controller.menuIndicatorBackgroundSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setMenuIndicatorBackgroundSchemeColor(null);
                  } else {
                    controller.setMenuIndicatorBackgroundSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ColorSchemePopupMenu(
          title: const Text('Highlighted menu item foreground color'),
          labelForDefault: menuOnIndicatorDefault,
          index: controller.menuIndicatorForegroundSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setMenuIndicatorForegroundSchemeColor(null);
                  } else {
                    controller.setMenuIndicatorForegroundSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Border radius of menu item highlight '
              'and indicator'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text('Does not use global radius override.'),
              Slider(
                min: -1,
                max: 24,
                divisions: 25,
                label: controller.useSubThemes && controller.useFlexColorScheme
                    ? controller.menuIndicatorRadius == null ||
                            (controller.menuIndicatorRadius ?? -1) < 0
                        ? 'default 0'
                        : (controller.menuIndicatorRadius?.toStringAsFixed(0) ??
                            '')
                    : 'default 0',
                value: controller.useSubThemes && controller.useFlexColorScheme
                    ? controller.menuIndicatorRadius ?? -1
                    : -1,
                onChanged:
                    controller.useSubThemes && controller.useFlexColorScheme
                        ? (double value) {
                            controller.setMenuIndicatorRadius(
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
                      ? controller.menuIndicatorRadius == null ||
                              (controller.menuIndicatorRadius ?? -1) < 0
                          ? 'default 0'
                          : (controller.menuIndicatorRadius
                                  ?.toStringAsFixed(0) ??
                              '')
                      : 'default 0',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const Divider(),
        const ListTile(
          title: Text('DropdownMenu'),
          subtitle: Text('The text input area uses the themed '
              'InputDecoration.'),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: DropDownMenuShowcase(),
        ),
        const SizedBox(height: 8),
        // TODO(rydmike): Add links to reported menu issues when reported.
        const ListTile(
          dense: true,
          subtitle: Text('The selected style of and item found in the '
              'DropdownMenu and selected as found item, cannot be themed. '
              'If it would use the selected state in the ButtonStyleButton '
              'items it would be possible to style it correctly. This feature '
              'gap is an oversight in Flutter SDK.'),
        ),
        const ListTile(
          dense: true,
          subtitle: Text('The foreground color of text of overlay highlighted '
              'menu items animate its color change if its color if different '
              'from none highlighted state. This is incorrect behavior by '
              'Flutter SDK. It does not happen on e.g. icons with same color '
              'change. This issue applies to all menu types. To see it, use '
              'defaults and set highlighted menu item background to primary.'),
        ),
        const SizedBox(height: 16),
        const Divider(),
        // const SizedBox(height: 16),
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
        const Divider(),
        const ListTile(
          title: Text('MenuBar'),
          subtitle: Text('The MenuBar is made up of SubMenuButtons that have '
              'MenuItemButtons. You can construct arbitrary deep nested '
              'sub-menus. Menu items can have keyboard shortcuts.'),
        ),
        ColorSchemePopupMenu(
          title: const Text('Background color of MenuBar container'),
          labelForDefault: menuBarDefault,
          index: controller.menuBarBackgroundSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setMenuBarBackgroundSchemeColor(null);
                  } else {
                    controller.setMenuBarBackgroundSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        const SizedBox(height: 8),
        const MenuBarShowcase(explainUsage: false),
        const SizedBox(height: 16),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Border radius of MenuBar container'),
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
          title: const Text('Elevation of MenuBar container'),
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
