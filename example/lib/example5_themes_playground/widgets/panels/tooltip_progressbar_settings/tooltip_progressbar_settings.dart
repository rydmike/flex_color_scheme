import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../../../shared/widgets/universal/slider_list_tile_reveal.dart';
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

    // The most common logic for enabling Playground controls.
    final bool enableControl =
        controller.useSubThemes && controller.useFlexColorScheme;

    final String opacityDefaultLabel = !controller.useFlexColorScheme
        ? isLight
            ? 'default\n90 %'
            : 'default\n90 %'
        : controller.useSubThemes && controller.tooltipSchemeColor != null
            ? 'default\n100 %'
            : controller.tooltipsMatchBackground
                ? controller.useSubThemes
                    ? isLight
                        ? 'default\n95 %'
                        : 'default\n95 %'
                    : isLight
                        ? 'default\n94 %'
                        : 'default\n93 %'
                : controller.useSubThemes
                    ? isLight
                        ? 'default\n95 %'
                        : 'default\n95 %'
                    : isLight
                        ? 'default\n90 %'
                        : 'default\n90 %';

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
            ? 'default\n8 dp'
            : 'default\n4 dp'
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
          onChanged: enableControl
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setTooltipSchemeColor(null);
                  } else {
                    controller.setTooltipSchemeColor(SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        SliderListTileReveal(
          enabled: enableControl,
          title: const Text('Tooltip opacity'),
          subtitleReveal: const Text(
            "Set to 90% to match Flutter's default in both M2 and M3 mode. "
            'The correct M3 spec is 100% and using inverseSurface, but '
            'Flutter at least up to 3.24, does not use the correct spec.\n',
          ),
          value: controller.tooltipOpacity,
          onChanged: controller.setTooltipOpacity,
          min: 0,
          max: 1,
          divisions: 100,
          valueDisplayScale: 100,
          valueDecimalPlaces: 0,
          valueHeading: 'OPACITY',
          valueUnitLabel: ' %',
          valueDefaultLabel: opacityDefaultLabel,
        ),
        SliderListTileReveal(
          enabled: enableControl,
          title: const Text('Tooltip radius'),
          subtitleReveal: const Text(
            'Does not use the global border radius setting. '
            'Avoid using very large border radius on tooltip containers. '
            'Set to 4dp to match Material design in both M2 and M3.',
          ),
          value: controller.tooltipRadius,
          onChanged: controller.setTooltipRadius,
          min: 0,
          max: 40,
          divisions: 40,
          valueDisplayScale: 1,
          valueDecimalPlaces: 0,
          valueHeading: 'RADIUS',
          valueUnitLabel: ' dp',
          valueDefaultLabel: tooltipDefaultRadiusLabel,
          valueDefaultDisabledLabel: 'default\n4 dp',
        ),
        SliderListTileReveal(
          enabled: enableControl,
          title: const Text('Wait duration before shown'),
          value: controller.tooltipWaitDuration?.toDouble(),
          onChanged: (double? value) {
            controller.setTooltipWaitDuration(
                value == null || value <= 0 ? null : value.toInt());
          },
          min: 100,
          max: 2000,
          divisions: 19,
          valueDisplayScale: 1,
          valueDecimalPlaces: 0,
          valueHeading: 'WAIT',
          valueUnitLabel: ' ms',
          valueDefaultLabel: 'default\n0 ms',
          // valueDefaultDisabledLabel: 'default 0',
        ),
        SliderListTileReveal(
          enabled: enableControl,
          title: const Text('Show duration, after tap/long press or '
              'mouse exit'),
          value: controller.tooltipShowDuration?.toDouble(),
          onChanged: (double? value) {
            controller.setTooltipShowDuration(
                value == null || value <= 0 ? null : value.toInt());
          },
          min: 100,
          max: 2000,
          divisions: 19,
          valueDisplayScale: 1,
          valueDecimalPlaces: 0,
          valueHeading: 'SHOW',
          valueUnitLabel: ' ms',
          valueDefaultLabel: 'tap 1500\nmouse 100',
          // valueDefaultDisabledLabel: 'default 0',
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
