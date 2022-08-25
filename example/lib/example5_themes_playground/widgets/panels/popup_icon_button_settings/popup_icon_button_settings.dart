import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/switch_list_tile_adaptive.dart';
import '../../../../shared/widgets/universal/theme_showcase.dart';

class PopupIconButtonSettings extends StatelessWidget {
  const PopupIconButtonSettings(this.controller, {super.key});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final double popupEffectiveRadius = controller.popupMenuBorderRadius ??
        math.min(controller.defaultRadius ?? 4.0, 10.0);
    final String popupMenuDefaultLabel =
        controller.popupMenuBorderRadius == null &&
                controller.defaultRadius == null
            ? 'default 4'
            : controller.popupMenuBorderRadius == null &&
                    controller.defaultRadius != null
                ? 'global ${popupEffectiveRadius.toStringAsFixed(0)}'
                : '';
    final double popupOpacity =
        controller.useSubThemes && controller.useFlexColorScheme
            ? controller.popupMenuOpacity
            : 1;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 16),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          // The button used in the PopupMenuShowcase to open the PopupMenu
          // is not a native widget, only the menu is, and it is the one that
          // is themed.
          child: PopupMenuShowcase(),
        ),
        const SizedBox(height: 16),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Border radius, follows global to max 10'),
          subtitle: Slider.adaptive(
            min: -1,
            max: 12,
            divisions: 13,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.popupMenuBorderRadius == null ||
                        (controller.popupMenuBorderRadius ?? -1) < 0
                    ? popupMenuDefaultLabel
                    : (controller.popupMenuBorderRadius?.toStringAsFixed(0) ??
                        '')
                : 'default 4',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.popupMenuBorderRadius ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller
                        .setPopupMenuBorderRadius(value < 0 ? null : value);
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
                          ? popupMenuDefaultLabel
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
          title: const Text('PopupMenu opacity'),
          subtitle: Slider.adaptive(
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
          title: Text('IconButton, CircleAvatar, DropdownButton and Tooltip'),
          subtitle: Text('Included to show their effective themed style'),
        ),
        const Padding(
          padding: EdgeInsets.all(16),
          child: IconButtonCircleAvatarDropdownTooltipShowcase(),
        ),
        SwitchListTileAdaptive(
          title: const Text(
            'Tooltip background brightness',
          ),
          subtitle: const Text(
            'OFF theme mode inverted, common on Web\n'
            'ON theme mode brightness, like Windows',
          ),
          value: controller.tooltipsMatchBackground &&
              controller.useFlexColorScheme,
          onChanged: controller.useFlexColorScheme
              ? controller.setTooltipsMatchBackground
              : null,
        ),
      ],
    );
  }
}
