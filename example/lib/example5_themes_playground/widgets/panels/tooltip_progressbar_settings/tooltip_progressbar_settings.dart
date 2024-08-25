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

    final bool tooltipOpacityEnabled =
        controller.useSubThemes && controller.useFlexColorScheme;
    final double tooltipOpacity =
        tooltipOpacityEnabled ? (controller.tooltipOpacity ?? -0.01) : -0.01;

    final String opacityDefaultLabel = !controller.useFlexColorScheme
        ? isLight
            ? 'default (90%)'
            : 'default (90%)'
        : controller.useSubThemes && controller.tooltipSchemeColor != null
            ? 'default (100%)'
            : controller.tooltipsMatchBackground
                ? controller.useSubThemes
                    ? isLight
                        ? 'default (95%)'
                        : 'default (95%)'
                    : isLight
                        ? 'default (94%)'
                        : 'default (93%)'
                : controller.useSubThemes
                    ? isLight
                        ? 'default (95%)'
                        : 'default (95%)'
                    : isLight
                        ? 'default (90%)'
                        : 'default (90%)';

    final String toolTipDefaultColorLabel = !controller.useFlexColorScheme
        ? isLight
            ? 'default (Grey700)'
            : 'default (White)'
        : controller.tooltipsMatchBackground
            ? controller.useSubThemes
                ? isLight
                    ? 'default (Primary tinted white)'
                    : 'default (Primary tinted #111111)'
                : isLight
                    ? 'default (#FCFCFC)'
                    : 'default (#444444)'
            : controller.useSubThemes
                ? isLight
                    ? 'default (Primary tinted #111111)'
                    : 'default (Primary tinted white)'
                : isLight
                    ? 'default (Grey700)'
                    : 'default (White)';

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
          subtitleReveal: const Text(
            "OFF theme mode inverted, common on Web. Android's default.\n"
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
        ListTileReveal(
          enabled: controller.useSubThemes,
          title: const Text('Tooltip opacity'),
          subtitleReveal: const Text(
            "Set to 90% to match Flutter's default in both M2 and M3 mode. "
            'The correct M3 spec is 100% and using inverseSurface, but '
            'Flutter at least up to 3.24, does not use the correct spec.\n',
          ),
        ),
        ListTile(
          enabled: controller.useFlexColorScheme,
          title: Slider(
            min: -1,
            max: 100,
            divisions: 101,
            label: tooltipOpacityEnabled
                ? controller.tooltipOpacity == null ||
                        (controller.tooltipOpacity ?? -1) < 0
                    ? opacityDefaultLabel
                    : (tooltipOpacity * 100).toStringAsFixed(0)
                : opacityDefaultLabel,
            value: tooltipOpacity * 100,
            onChanged: tooltipOpacityEnabled
                ? (double value) {
                    controller
                        .setTooltipOpacity(value < 0 ? null : value / 100);
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
                  tooltipOpacityEnabled
                      ? controller.tooltipOpacity == null ||
                              (controller.tooltipOpacity ?? -1) < 0
                          ? opacityDefaultLabel
                          : '${(tooltipOpacity * 100).toStringAsFixed(0)} %'
                      : opacityDefaultLabel,
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
          subtitleReveal: const Text(
            'Does not use the global border radius setting.\n'
            'Avoid using very large border radius on tooltip containers.\n'
            'Set to 4dp to match Material design in both M2 and M3.',
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
          title: Text('ProgressIndicator'),
          subtitleReveal:
              Text('Progress indicators in FCS currently only offer the '
                  'default theme and no customization.\n'),
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: ProgressIndicatorShowcase(),
        ),
        ListTileReveal(
          dense: true,
          title: const Text('Known issues'),
          subtitleReveal: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'There is a nice new feature to enable circular '
                      'end-caps in Flutter 3.10. However, that feature cannot '
                      'be set via a theme at all yet. To support bringing the '
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
