import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../../../shared/widgets/universal/slider_list_tile_reveal.dart';
import '../../../../shared/widgets/universal/switch_list_tile_reveal.dart';
import '../../shared/color_scheme_popup_menu.dart';

class TooltipProgressBarPanel extends StatelessWidget {
  const TooltipProgressBarPanel(this.controller, {super.key});
  final ThemeController controller;

  static final Uri _fcsFlutterIssue131690 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/issues/131690',
  );

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle spanTextStyle = theme.textTheme.bodySmall!
        .copyWith(color: theme.colorScheme.onSurfaceVariant);
    final TextStyle linkStyle = theme.textTheme.bodySmall!.copyWith(
      color: theme.colorScheme.primary,
      fontWeight: FontWeight.bold,
    );
    final bool isLight = theme.brightness == Brightness.light;

    // The most common logic for enabling Playground controls.
    final bool enableControl =
        controller.useSubThemes && controller.useFlexColorScheme;

    final String opacityDefaultLabel = !controller.useFlexColorScheme
        ? isLight
            ? '90 %'
            : '90 %'
        : controller.useSubThemes && controller.tooltipSchemeColor != null
            ? '100 %'
            : controller.tooltipsMatchBackground
                ? controller.useSubThemes
                    ? isLight
                        ? '95 %'
                        : '95 %'
                    : isLight
                        ? '94 %'
                        : '93 %'
                : controller.useSubThemes
                    ? isLight
                        ? '95 %'
                        : '95 %'
                    : isLight
                        ? '90 %'
                        : '90 %';

    final String toolTipDefaultColorLabel = !controller.useFlexColorScheme
        ? isLight
            ? 'Grey700'
            : 'White'
        : controller.tooltipsMatchBackground
            ? controller.useSubThemes
                ? isLight
                    ? 'White + 4% primary alpha blend'
                    : 'Dark grey #111111 + 16% primary alpha blend'
                : isLight
                    ? 'Almost white #FCFCFC'
                    : 'Grey #444444'
            : controller.useSubThemes
                ? isLight
                    ? 'Dark grey #111111 + 45% primary alpha blend'
                    : 'White + 39% primary alpha blend'
                : isLight
                    ? 'Grey700'
                    : 'White';

    final String tooltipDefaultRadiusLabel = controller.tooltipRadius == null
        ? controller.useSubThemes
            ? '8 dp'
            : '4 dp'
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
          enabled: enableControl,
          title: const Text('Tooltip background color'),
          subtitle: controller.tooltipSchemeColor == null
              ? null
              : const Text('Foreground pair used as foreground color'),
          defaultLabel: toolTipDefaultColorLabel,
          value: controller.tooltipSchemeColor,
          onChanged: controller.setTooltipSchemeColor,
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
          valueDecimalPlaces: 0,
          valueHeading: 'RADIUS',
          valueUnitLabel: ' dp',
          valueDefaultLabel: tooltipDefaultRadiusLabel,
          valueDefaultDisabledLabel: '4 dp',
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
          valueDecimalPlaces: 0,
          valueHeading: 'WAIT',
          valueUnitLabel: ' ms',
          valueDefaultLabel: '0 ms',
        ),
        SliderListTileReveal(
          enabled: enableControl,
          title: const Text('Show duration, after tap&long press or '
              'mouse exit'),
          value: controller.tooltipShowDuration?.toDouble(),
          onChanged: (double? value) {
            controller.setTooltipShowDuration(
                value == null || value <= 0 ? null : value.toInt());
          },
          min: 100,
          max: 2000,
          divisions: 19,
          valueDecimalPlaces: 0,
          valueHeading: 'SHOW',
          valueUnitLabel: ' ms',
          valueDefaultLabel: 'tap 1500 mouse 100',
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
