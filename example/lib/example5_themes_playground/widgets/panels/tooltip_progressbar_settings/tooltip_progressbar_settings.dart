import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../../../shared/widgets/universal/switch_list_tile_reveal.dart';
import '../../shared/color_scheme_popup_menu.dart';

class TooltipProgressBarSettings extends StatelessWidget {
  const TooltipProgressBarSettings(this.controller, {super.key});
  final ThemeController controller;

  static final Uri _fcsFlutterIssue131690 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/issues/131690',
  );

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle spanTextStyle = theme.textTheme.bodySmall!;
    final TextStyle linkStyle = theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primary, fontWeight: FontWeight.bold);
    final bool isLight = theme.brightness == Brightness.light;

    final String toolTipDefaultColorLabel = !controller.useFlexColorScheme
        ? isLight
            ? 'default (Grey700 op90%)'
            : 'default (White op90%)'
        : controller.tooltipsMatchBackground
            ? controller.useSubThemes
                ? isLight
                    ? 'default (Tinted White op95%)'
                    : 'default (Tinted #111111 op95%)'
                : isLight
                    ? 'default (#FCFCFC op94%)'
                    : 'default (#444444 op93%)'
            : controller.useSubThemes
                ? isLight
                    ? 'default (Tinted #111111 op95%)'
                    : 'default (Tinted White op95%)'
                : isLight
                    ? 'default (Grey700 op90%)'
                    : 'default (White op90%)';

    final String tooltipDefaultRadiusLabel = controller.tooltipRadius == null
        ? controller.useSubThemes
            ? 'default 8'
            : 'default 4'
        : '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        SwitchListTileReveal(
          title: const Text(
            'Tooltip background brightness',
          ),
          subtitleDense: true,
          subtitle: const Text(
            'OFF theme mode inverted, common on Web\n'
            'ON theme mode brightness, like Windows\n',
          ),
          value: controller.tooltipsMatchBackground &&
              controller.useFlexColorScheme &&
              (controller.tooltipSchemeColor == null ||
                  !controller.useSubThemes),
          onChanged: controller.useFlexColorScheme &&
                  (controller.tooltipSchemeColor == null ||
                      !controller.useSubThemes)
              ? controller.setTooltipsMatchBackground
              : null,
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: TooltipShowcase(),
        ),
        ColorSchemePopupMenu(
          title: const Text('Tooltip background color'),
          subtitle: controller.tooltipSchemeColor == null
              ? null
              : const Text('Foreground pair used'),
          labelForDefault: toolTipDefaultColorLabel,
          index: controller.tooltipSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setTooltipSchemeColor(null);
                  } else {
                    controller.setTooltipSchemeColor(SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ListTile(
          enabled: controller.useFlexColorScheme &&
              controller.tooltipSchemeColor != null,
          title: const Text('Tooltip opacity, try 85% to 98%'),
          subtitle: Slider(
            max: 100,
            divisions: 100,
            label: (controller.tooltipOpacity * 100).toStringAsFixed(0),
            value: controller.useFlexColorScheme &&
                    controller.useSubThemes &&
                    controller.tooltipSchemeColor != null
                ? controller.tooltipOpacity * 100
                : 100,
            onChanged: controller.useFlexColorScheme &&
                    controller.useSubThemes &&
                    controller.tooltipSchemeColor != null
                ? (double value) {
                    controller.setTooltipOpacity(value / 100);
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'OPACITY',
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  // ignore: lines_longer_than_80_chars
                  '${(controller.useFlexColorScheme && controller.useSubThemes && controller.tooltipSchemeColor != null ? controller.tooltipOpacity * 100 : 100).toStringAsFixed(0)}'
                  ' %',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ListTileReveal(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Tooltip radius'),
          subtitleDense: true,
          subtitle: const Text(
            'Does not use the global border radius setting. '
            'Avoid using large border radius on tooltip containers.\n',
          ),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: Slider(
            min: -1,
            max: 30,
            divisions: 31,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.tooltipRadius == null ||
                        (controller.tooltipRadius ?? -1) < 0
                    ? tooltipDefaultRadiusLabel
                    : (controller.tooltipRadius?.toStringAsFixed(0) ?? '')
                : 'default 4',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.tooltipRadius ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setTooltipRadius(
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
                      ? controller.tooltipRadius == null ||
                              (controller.tooltipRadius ?? -1) < 0
                          ? tooltipDefaultRadiusLabel
                          : (controller.tooltipRadius?.toStringAsFixed(0) ?? '')
                      : 'default 4',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ListTile(
          title: const Text('Wait duration before shown'),
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          subtitle: Slider(
            min: 0,
            max: 2000,
            divisions: 20,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.tooltipWaitDuration == null ||
                        (controller.tooltipWaitDuration ?? 0) <= 0
                    ? 'default 0'
                    : (controller.tooltipWaitDuration.toString())
                : 'default 0',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.tooltipWaitDuration?.toDouble() ?? 0
                : 0,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setTooltipWaitDuration(
                        value <= 0 ? null : value.toInt());
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'mSec',
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.tooltipWaitDuration == null ||
                              (controller.tooltipWaitDuration ?? 0) <= 0
                          ? 'default 0'
                          : (controller.tooltipWaitDuration?.toString() ?? '')
                      : 'default 0',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ListTile(
          title: const Text('Show duration, after tap, long press or '
              'mouse exit'),
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          subtitle: Slider(
            min: 0,
            max: 2000,
            divisions: 20,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.tooltipShowDuration == null ||
                        (controller.tooltipShowDuration ?? 0) <= 0
                    ? 'tap/long 1500\nmouse exit 100'
                    : (controller.tooltipShowDuration.toString())
                : 'tap/long 1500\nmouse exit 100',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.tooltipShowDuration?.toDouble() ?? 0
                : 0,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setTooltipShowDuration(
                        value <= 0 ? null : value.toInt());
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'mSec',
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.tooltipShowDuration == null ||
                              (controller.tooltipShowDuration ?? 0) <= 0
                          ? 'tap/long 1500\nmouse exit 100'
                          : (controller.tooltipShowDuration?.toString() ?? '')
                      : 'tap/long 1500\nmouse exit 100',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const Divider(),
        const ListTileReveal(
          subtitleDense: true,
          title: Text('ProgressIndicator'),
          subtitle: Text('Progress indicators in FCS currently only offer the '
              'default theme and no customization.\n'),
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: ProgressIndicatorShowcase(),
        ),
        ListTileReveal(
          dense: true,
          title: const Text('Known issues and limitations'),
          subtitle: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'There is a nice new feature to enable circular '
                      'end-caps in Flutter 3.10. However, that feature cannot '
                      'set via a theme at all yet. To support bringing the '
                      'feature Flutter, go upvote this  ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsFlutterIssue131690,
                  text: 'issue #131690',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: '.\n',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
