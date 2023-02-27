import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/const/app.dart';
import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../shared/color_scheme_popup_menu.dart';

class ToggleButtonsSettings extends StatelessWidget {
  const ToggleButtonsSettings(this.controller, {super.key});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    // Get effective platform default global radius.
    final double? effectiveRadius = App.effectiveRadius(controller);
    final String toggleButtonsRadiusDefaultLabel =
        controller.toggleButtonsBorderRadius == null && effectiveRadius == null
            ? 'default 20'
            : controller.toggleButtonsBorderRadius == null &&
                    effectiveRadius != null
                ? 'global ${effectiveRadius.toStringAsFixed(0)}'
                : '';
    final String toggleBorderWidthDefaultLabel =
        controller.toggleButtonsBorderWidth == null &&
                controller.thinBorderWidth == null
            ? 'default 1'
            : controller.toggleButtonsBorderWidth == null &&
                    controller.thinBorderWidth != null
                ? 'global ${controller.thinBorderWidth!.toStringAsFixed(1)}'
                : '';
    final String segmentedButtonsRadiusDefaultLabel =
        controller.segmentedButtonBorderRadius == null &&
                effectiveRadius == null
            ? 'default stadium'
            : controller.segmentedButtonBorderRadius == null &&
                    effectiveRadius != null
                ? 'global ${effectiveRadius.toStringAsFixed(0)}'
                : '';
    final String segmentedBorderWidthDefaultLabel =
        controller.segmentedButtonBorderWidth == null &&
                controller.thinBorderWidth == null
            ? 'default 1'
            : controller.segmentedButtonBorderWidth == null &&
                    controller.thinBorderWidth != null
                ? 'global ${controller.thinBorderWidth!.toStringAsFixed(1)}'
                : '';
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const ListTile(
          title: Text('ToggleButtons'),
          subtitle: Text('By default ToggleButtons are themed to style and '
              'height align with OutlinedButton and FilledButton, shown '
              'here for comparison.'),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: ToggleButtonsShowcase(compareButtons: true),
        ),
        ColorSchemePopupMenu(
          title: const Text('ToggleButtons color'),
          subtitle: const Text('Always used as selected button background, '
              'but also as unselected button foreground if it is not defined.'),
          index: controller.toggleButtonsSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setToggleButtonsSchemeColor(null);
                  } else {
                    controller
                        .setToggleButtonsSchemeColor(SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ColorSchemePopupMenu(
          title: const Text('ToggleButtons unselected button color'),
          subtitle: const Text('Unselected button foreground'),
          labelForDefault: controller.useSubThemes &&
                  controller.useFlexColorScheme &&
                  controller.toggleButtonsUnselectedSchemeColor == null
              // ignore: lines_longer_than_80_chars
              ? 'default (${controller.toggleButtonsSchemeColor?.name ?? SchemeColor.primary.name})'
              : 'default (primary)',
          index: controller.toggleButtonsUnselectedSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setToggleButtonsUnselectedSchemeColor(null);
                  } else {
                    controller.setToggleButtonsUnselectedSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ColorSchemePopupMenu(
          title: const Text('ToggleButtons border color'),
          labelForDefault: useMaterial3
              ? 'default (outline)'
              : controller.useSubThemes &&
                      controller.useFlexColorScheme &&
                      controller.toggleButtonsBorderSchemeColor == null
                  // ignore: lines_longer_than_80_chars
                  ? 'default (${controller.toggleButtonsSchemeColor?.name ?? SchemeColor.primary.name})'
                  : 'default (primary)',
          index: controller.toggleButtonsBorderSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setToggleButtonsBorderSchemeColor(null);
                  } else {
                    controller.setToggleButtonsBorderSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Border radius'),
          subtitle: Slider(
            min: -1,
            max: 40,
            divisions: 41,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.toggleButtonsBorderRadius == null ||
                        (controller.toggleButtonsBorderRadius ?? -1) < 0
                    ? toggleButtonsRadiusDefaultLabel
                    : (controller.toggleButtonsBorderRadius
                            ?.toStringAsFixed(0) ??
                        '')
                : 'default 0',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.toggleButtonsBorderRadius ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setToggleButtonsBorderRadius(
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
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.toggleButtonsBorderRadius == null ||
                              (controller.toggleButtonsBorderRadius ?? -1) < 0
                          ? toggleButtonsRadiusDefaultLabel
                          : (controller.toggleButtonsBorderRadius
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
        ListTile(
          title: const Text('Border width'),
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          subtitle: Slider(
            min: 0,
            max: 5,
            divisions: 10,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.toggleButtonsBorderWidth == null ||
                        (controller.toggleButtonsBorderWidth ?? 0) <= 0
                    ? toggleBorderWidthDefaultLabel
                    : (controller.toggleButtonsBorderWidth
                            ?.toStringAsFixed(1) ??
                        '')
                : 'default 1',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.toggleButtonsBorderWidth ?? 0
                : 0,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller
                        .setToggleButtonsBorderWidth(value <= 0 ? null : value);
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'WIDTH',
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.toggleButtonsBorderWidth == null ||
                              (controller.toggleButtonsBorderWidth ?? 0) <= 0
                          ? toggleBorderWidthDefaultLabel
                          : (controller.toggleButtonsBorderWidth
                                  ?.toStringAsFixed(1) ??
                              '')
                      : 'default 1',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const Divider(),
        const ListTile(
          title: Text('SegmentedButton'),
          subtitle: Text('New in Material 3, starts with default M3 style '
              'and you can modify key design elements.'),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: SegmentedButtonShowcase(),
        ),
        ColorSchemePopupMenu(
          title: const Text('SegmentedButton background color'),
          subtitle: const Text('Selected foreground automatically uses the '
              'color pair of used background color'),
          labelForDefault: 'default (secondaryContainer)',
          index: controller.segmentedButtonSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setSegmentedButtonSchemeColor(null);
                  } else {
                    controller.setSegmentedButtonSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ColorSchemePopupMenu(
          title: const Text('SegmentedButton unselected button background '
              'color'),
          labelForDefault: 'default (surface)',
          index: controller.segmentedButtonUnselectedSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setSegmentedButtonUnselectedSchemeColor(null);
                  } else {
                    controller.setSegmentedButtonUnselectedSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ColorSchemePopupMenu(
          title: const Text('SegmentedButton unselected button foreground '
              'color'),
          labelForDefault: 'default (onSurface)',
          index: controller
                  .segmentedButtonUnselectedForegroundSchemeColor?.index ??
              -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller
                        .setSegmentedButtonUnselectedForegroundSchemeColor(
                            null);
                  } else {
                    controller
                        .setSegmentedButtonUnselectedForegroundSchemeColor(
                            SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ColorSchemePopupMenu(
          title: const Text('SegmentedButton border color'),
          labelForDefault: useMaterial3
              ? 'default (outline)'
              : controller.useSubThemes &&
                      controller.useFlexColorScheme &&
                      controller.segmentedButtonBorderSchemeColor == null
                  // ignore: lines_longer_than_80_chars
                  ? 'default (${controller.segmentedButtonSchemeColor?.name ?? SchemeColor.primary.name})'
                  : 'default (primary)',
          index: controller.segmentedButtonBorderSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setSegmentedButtonBorderSchemeColor(null);
                  } else {
                    controller.setSegmentedButtonBorderSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Border radius'),
          subtitle: Slider(
            min: -1,
            max: 40,
            divisions: 41,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.segmentedButtonBorderRadius == null ||
                        (controller.segmentedButtonBorderRadius ?? -1) < 0
                    ? segmentedButtonsRadiusDefaultLabel
                    : (controller.segmentedButtonBorderRadius
                            ?.toStringAsFixed(0) ??
                        '')
                : 'default 0',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.segmentedButtonBorderRadius ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setSegmentedButtonBorderRadius(
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
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.segmentedButtonBorderRadius == null ||
                              (controller.segmentedButtonBorderRadius ?? -1) < 0
                          ? segmentedButtonsRadiusDefaultLabel
                          : (controller.segmentedButtonBorderRadius
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
        ListTile(
          title: const Text('Border width'),
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          subtitle: Slider(
            min: 0,
            max: 5,
            divisions: 10,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.segmentedButtonBorderWidth == null ||
                        (controller.segmentedButtonBorderWidth ?? 0) <= 0
                    ? segmentedBorderWidthDefaultLabel
                    : (controller.segmentedButtonBorderWidth
                            ?.toStringAsFixed(1) ??
                        '')
                : 'default 1',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.segmentedButtonBorderWidth ?? 0
                : 0,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setSegmentedButtonBorderWidth(
                        value <= 0 ? null : value);
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'WIDTH',
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.segmentedButtonBorderWidth == null ||
                              (controller.segmentedButtonBorderWidth ?? 0) <= 0
                          ? segmentedBorderWidthDefaultLabel
                          : (controller.segmentedButtonBorderWidth
                                  ?.toStringAsFixed(1) ??
                              '')
                      : 'default 1',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
