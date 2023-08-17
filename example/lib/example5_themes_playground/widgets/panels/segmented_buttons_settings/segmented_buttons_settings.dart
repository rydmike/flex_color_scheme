import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/const/app.dart';
import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../shared/color_scheme_popup_menu.dart';

class SegmentedButtonsSettings extends StatelessWidget {
  const SegmentedButtonsSettings(this.controller, {super.key});
  final ThemeController controller;

  static final Uri _segmentNotTransparentIssue123292 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/pull/123292',
  );
  static final Uri _segmentWrongHeightIssue121493 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/pull/121493',
  );
  static final Uri _segmentWrongOverlayIssue123308 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/pull/123308',
  );
  static final Uri _segmentNotM3SpecIssue119733 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/pull/119733',
  );

  @override
  Widget build(BuildContext context) {
    // Get effective platform default global radius.
    final double? effectiveRadius = App.effectiveRadius(controller);
    final String toggleButtonsRadiusDefaultLabel =
        controller.toggleButtonsBorderRadius == null && effectiveRadius == null
            ? 'default 40'
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

    final String segmentedUnselectedForegroundDefault = controller
                .segmentedButtonUnselectedSchemeColor ==
            null
        ? 'default (onSurface)'
        // ignore: lines_longer_than_80_chars
        : 'default (${SchemeColor.values[FlexSubThemes.onSchemeColor(controller.segmentedButtonUnselectedSchemeColor!).index].name})';

    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;
    final TextStyle spanTextStyle = theme.textTheme.bodySmall!;
    final TextStyle linkStyle = theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primary, fontWeight: FontWeight.bold);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const ListTileReveal(
          title: Text('ToggleButtons'),
          subtitleDense: true,
          subtitle: Text('By default ToggleButtons are themed to style and '
              'height align with OutlinedButton and FilledButton, shown '
              'here for comparison.\n'),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: ToggleButtonsShowcase(compareButtons: true),
        ),
        ColorSchemePopupMenu(
          title: const Text('Main color'),
          subtitle: const Text('Selected background color, also unselected '
              'foreground color, if not defined.'),
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
          title: const Text('Unselected foreground color'),
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
          title: const Text('Border color'),
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
            padding: const EdgeInsetsDirectional.only(end: 5),
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
            padding: const EdgeInsetsDirectional.only(end: 5),
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
        const ListTileReveal(
          title: Text('SegmentedButton'),
          subtitleDense: true,
          subtitle: Text('Material 3, replacement for ToggleButtons. '
              'ToggleButtons may work better when using only icons and it is '
              'similarly styled by FCS sub themes. SegmentedButton '
              'is better if you also have text, and optionally also want '
              'a checkmark icon to mark selected button.\n'),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: SegmentedButtonShowcase(),
        ),
        ColorSchemePopupMenu(
          title: const Text('Background color'),
          subtitle: const Text('Selected foreground automatically uses the '
              'color pair of used background color'),
          labelForDefault:
              controller.useSubThemes && controller.useFlexColorScheme
                  ? useMaterial3
                      ? 'default (secondaryContainer)'
                      : 'default (primary)'
                  : 'default (secondaryContainer)',
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
          title: const Text('Unselected button background color'),
          labelForDefault: 'default (transparent)',
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
          title: const Text('Unselected button foreground color'),
          labelForDefault: segmentedUnselectedForegroundDefault,
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
          title: const Text('Border color'),
          labelForDefault: controller.useSubThemes &&
                  controller.useFlexColorScheme
              ? controller.segmentedButtonBorderSchemeColor == null
                  ? useMaterial3
                      ? 'default (outline)'
                      : 'default (primary)'
                  // ignore: lines_longer_than_80_chars
                  : 'default (${controller.segmentedButtonSchemeColor?.name ?? SchemeColor.primary.name})'
              : 'default (outline)',
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
            padding: const EdgeInsetsDirectional.only(end: 5),
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
            padding: const EdgeInsetsDirectional.only(end: 5),
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
        ListTileReveal(
          dense: true,
          title: const Text('Known issues'),
          subtitle: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'In Flutter 3.7 the SegmentedButton has a few '
                      'small issues, like background is not transparent ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _segmentNotTransparentIssue123292,
                  text: '(issue #123292)',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: ' and its default unselected foreground color does '
                      'not follow M3 spec ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _segmentNotM3SpecIssue119733,
                  text: '(issue #119733)',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: ', these issues are fixed in Flutter 3.10.\n'
                      'Additionally min height or size '
                      'cannot be set ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _segmentWrongHeightIssue121493,
                  text: '(issue #121493)',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: ' and selectedOverlay state does not work ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _segmentWrongOverlayIssue123308,
                  text: '(issue #123308)',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: ', these have no fixes yet.',
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
