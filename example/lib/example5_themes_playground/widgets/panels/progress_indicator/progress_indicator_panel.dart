import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/responsive_two_widgets.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../../../shared/widgets/universal/slider_list_tile_reveal.dart';
import '../../../../shared/widgets/universal/switch_list_tile_reveal.dart';
import '../../../theme/theme_values.dart';
import '../../shared/color_scheme_popup_menu.dart';
import '../../shared/enum_popup_menu.dart';
import '../../shared/test_adaptive_response.dart';

class ProgressIndicatorPanel extends StatelessWidget {
  const ProgressIndicatorPanel(this.controller, {super.key});
  final ThemeController controller;

  static final Uri _fcsFlutterIssues = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/issues',
  );

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;
    final bool use2023Style = controller.progressIndicatorYear2023 ?? true;

    final TextStyle spanTextStyle = theme.textTheme.bodySmall!
        .copyWith(color: theme.colorScheme.onSurfaceVariant);
    final TextStyle linkStyle = theme.textTheme.bodySmall!.copyWith(
      color: theme.colorScheme.primary,
      fontWeight: FontWeight.bold,
    );

    // The most common logic for enabling Playground controls.
    final bool enableControl =
        controller.useSubThemes && controller.useFlexColorScheme;

    // Default labels for SchemeColor properties
    final String labelBaseDefault =
        controller.progressIndicatorBaseSchemeColor == null
            ? 'primary'
            : '${controller.progressIndicatorBaseSchemeColor?.name}';
    final String labelLinearTrackDefault =
        controller.progressIndicatorLinearTrackSchemeColor == null
            ? useMaterial3
                ? 'secondaryContainer'
                : 'background deprecated'
            : '${controller.progressIndicatorLinearTrackSchemeColor?.name}';
    final String labelCircularTrackDefault =
        controller.progressIndicatorCircularTrackSchemeColor == null
            ? 'not painted'
            : '${controller.progressIndicatorCircularTrackSchemeColor?.name}';
    final String labelRefreshBackgroundDefault = controller
                .progressIndicatorRefreshBackgroundSchemeColor ==
            null
        ? 'canvasColor'
        : '${controller.progressIndicatorRefreshBackgroundSchemeColor?.name}';
    final String labelStopIndicatorDefault =
        controller.progressIndicatorStopIndicatorSchemeColor == null
            ? 'primary'
            : '${controller.progressIndicatorStopIndicatorSchemeColor?.name}';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        SwitchListTileReveal(
          enabled: enableControl,
          title: const Text('Use legacy Material-3 style'),
          subtitleReveal: const Text(
              'The Material-3 specification for the ProgressIndicator design '
              'changed in December 2023. The old style is ON and used by '
              'default in Flutter and FCS Material-3 to not break past themed '
              'style. Turn OFF this setting to opt-in and enable the newer and '
              'current Material-3 ProgressIndicator style.\n'
              '\n'
              'There are plans to make the new style the default in a future '
              'Flutter release and remove support for the older M3 style. When '
              'that happens and if it is '
              'possible, FCS will retain support for the older '
              'M3 style via theming options.'),
          value: use2023Style,
          onChanged: controller.setProgressIndicatorYear2023,
        ),
        const Divider(),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: ColorSchemePopupMenu(
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              enabled: enableControl,
              title: const Text('Main color'),
              defaultLabel: labelBaseDefault,
              value: controller.progressIndicatorBaseSchemeColor,
              onChanged: controller.setProgressIndicatorBaseSchemeColor,
            ),
            lastWidget: ColorSchemePopupMenu(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              enabled: enableControl,
              title: const Text('Linear track color'),
              defaultLabel: labelLinearTrackDefault,
              value: controller.progressIndicatorLinearTrackSchemeColor,
              onChanged: controller.setProgressIndicatorLinearTrackSchemeColor,
            ),
            isRow: isRow,
          );
        }),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: ColorSchemePopupMenu(
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              enabled: enableControl && !use2023Style,
              title: const Text('Linear stop indicator'),
              defaultLabel: labelStopIndicatorDefault,
              value: controller.progressIndicatorStopIndicatorSchemeColor,
              onChanged:
                  controller.setProgressIndicatorStopIndicatorSchemeColor,
            ),
            lastWidget: ColorSchemePopupMenu(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              enabled: enableControl,
              title: const Text('Refresh background'),
              subtitleReveal: const Text('Background color of the '
                  'pull-to-refresh circular progress indicator.\n'),
              defaultLabel: labelRefreshBackgroundDefault,
              value: controller.progressIndicatorRefreshBackgroundSchemeColor,
              onChanged:
                  controller.setProgressIndicatorRefreshBackgroundSchemeColor,
            ),
            isRow: isRow,
          );
        }),
        SliderListTileReveal(
          enabled: enableControl,
          title: const Text('Linear minimum height'),
          value: controller.progressIndicatorLinearMinHeight,
          onChanged: controller.setProgressIndicatorLinearMinHeight,
          min: 1,
          max: 20,
          divisions: 19,
          valueDecimalPlaces: 0,
          valueHeading: 'HEIGHT',
          valueUnitLabel: ' dp',
          valueDefaultLabel: '4 dp',
        ),
        SliderListTileReveal(
          enabled: enableControl,
          title: const Text('Linear radius'),
          value: controller.progressIndicatorLinearRadius,
          onChanged: controller.setProgressIndicatorLinearRadius,
          min: 0,
          max: 20,
          divisions: 40,
          valueDecimalPlaces: 1,
          valueHeading: 'RADIUS',
          valueUnitLabel: ' dp',
          valueDefaultLabel: use2023Style || !useMaterial3 ? '0 dp' : '2 dp',
        ),
        SliderListTileReveal(
          enabled: enableControl && !use2023Style,
          title: const Text('Linear stop indicator radius'),
          value: controller.progressIndicatorStopIndicatorRadius,
          onChanged: controller.setProgressIndicatorStopIndicatorRadius,
          min: 0,
          max: 20,
          divisions: 40,
          valueDecimalPlaces: 1,
          valueHeading: 'RADIUS',
          valueUnitLabel: ' dp',
          valueDefaultLabel: use2023Style || !useMaterial3 ? 'null' : '2 dp',
        ),
        const Divider(),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: ColorSchemePopupMenu(
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              enabled: enableControl,
              title: const Text('Circular track color'),
              defaultLabel: labelCircularTrackDefault,
              value: controller.progressIndicatorCircularTrackSchemeColor,
              onChanged:
                  controller.setProgressIndicatorCircularTrackSchemeColor,
            ),
            lastWidget: EnumPopupMenu<StrokeCap>(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              enabled: enableControl,
              values: StrokeCap.values,
              title: const Text('Circular stroke cap'),
              value: controller.progressIndicatorStrokeCap,
              onChanged: controller.setProgressIndicatorStrokeCap,
            ),
            isRow: isRow,
          );
        }),
        SliderListTileReveal(
          enabled: enableControl,
          title: const Text('Circular stroke width'),
          value: controller.progressIndicatorStrokeWidth,
          onChanged: controller.setProgressIndicatorStrokeWidth,
          min: 1,
          max: 10,
          divisions: 18,
          valueDecimalPlaces: 1,
          valueHeading: 'WIDTH',
          valueUnitLabel: ' dp',
          valueDefaultLabel: '4 dp',
        ),
        SliderListTileReveal(
          enabled: enableControl,
          title: const Text('Circular stroke align'),
          subtitleReveal: const Text('-1.0 is inside, 0.0 is center, '
              'and 1.0 is outside the nominal radius.\n'),
          value: controller.progressIndicatorStrokeAlign,
          onChanged: controller.setProgressIndicatorStrokeAlign,
          min: -1,
          max: 1,
          divisions: 21,
          valueDecimalPlaces: 1,
          valueHeading: 'ALIGN',
          valueUnitLabel: '',
          valueDefaultLabel: !use2023Style && useMaterial3 ? '-1' : '0',
        ),
        SliderListTileReveal(
          enabled: enableControl && !use2023Style,
          title: const Text('Circular track gap'),
          value: controller.progressIndicatorTrackGap,
          onChanged: controller.setProgressIndicatorTrackGap,
          min: 0,
          max: 10,
          divisions: 20,
          valueDecimalPlaces: 1,
          valueHeading: 'GAP',
          valueUnitLabel: ' dp',
          valueDefaultLabel: !use2023Style && useMaterial3 ? '4 dp' : '0 dp',
        ),
        const ListTile(title: Text('Circular track padding')),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              enabled: enableControl,
              value: controller.progressIndicatorCircularTrackPaddingStart,
              onChanged:
                  controller.setProgressIndicatorCircularTrackPaddingStart,
              min: 0,
              max: 20,
              divisions: 40,
              valueDecimalPlaces: 1,
              valueHeading: 'START',
              valueUnitLabel: ' dp',
              valueDefaultLabel: '0 dp',
            ),
            lastWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              enabled: enableControl,
              value: controller.progressIndicatorCircularTrackPaddingEnd,
              onChanged: controller.setProgressIndicatorCircularTrackPaddingEnd,
              min: 0,
              max: 20,
              divisions: 40,
              valueDecimalPlaces: 1,
              valueHeading: 'END',
              valueUnitLabel: ' dp',
              valueDefaultLabel: '0 dp',
            ),
            isRow: isRow,
          );
        }),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              enabled: enableControl,
              value: controller.progressIndicatorCircularTrackPaddingTop,
              onChanged: controller.setProgressIndicatorCircularTrackPaddingTop,
              min: 0,
              max: 20,
              divisions: 40,
              valueDecimalPlaces: 1,
              valueHeading: 'TOP',
              valueUnitLabel: ' dp',
              valueDefaultLabel: '0 dp',
            ),
            lastWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              enabled: enableControl,
              value: controller.progressIndicatorCircularTrackPaddingBottom,
              onChanged:
                  controller.setProgressIndicatorCircularTrackPaddingBottom,
              min: 0,
              max: 20,
              divisions: 40,
              valueDecimalPlaces: 1,
              valueHeading: 'BOTTOM',
              valueUnitLabel: ' dp',
              valueDefaultLabel: '0 dp',
            ),
            isRow: isRow,
          );
        }),
        const Divider(),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: ProgressIndicatorShowcase(),
        ),
        TestAdaptiveResponse(controller),
        ListTileReveal(
          dense: true,
          title: const Text('Known issues'),
          subtitleReveal: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'If you set legacy style, year2023, to false and use '
                      'Material-2 mode and do not specify the linear stop '
                      'indicator color and you have specified a linear stop '
                      'indicator radius, the Flutter SDK will throw a null '
                      'check error. Not sure if this is reported, feel free to '
                      'report it in Flutter ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsFlutterIssues,
                  text: 'issues',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: ' if it is not.\n'
                      '\n'
                      'FCS and the Playground avoids this bug '
                      'by always defining a sub-theme with the default color '
                      'assigned. The correct fix is probably that in M2 mode '
                      'the SDK should not draw the stop indicator at all, '
                      'but currently it does if year2023 is false and a color '
                      'is assigned to stopIndicatorColor.\n',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
