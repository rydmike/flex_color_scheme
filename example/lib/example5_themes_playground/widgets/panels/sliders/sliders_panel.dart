import 'package:flex_color_scheme/flex_color_scheme.dart';
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

class SlidersPanel extends StatelessWidget {
  const SlidersPanel(this.controller, {super.key});
  final ThemeController controller;

  static final Uri _fcsFlutterIssue125329 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/issues/125329',
  );

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;
    final TextStyle spanTextStyle = theme.textTheme.bodySmall!
        .copyWith(color: theme.colorScheme.onSurfaceVariant);
    final TextStyle linkStyle = theme.textTheme.bodySmall!.copyWith(
      color: theme.colorScheme.primary,
      fontWeight: FontWeight.bold,
    );
    // The most common logic for enabling Playground controls.
    final bool enableControl =
        controller.useSubThemes && controller.useFlexColorScheme;
    final bool isLight = theme.brightness == Brightness.light;
    final String labelIndicatorDefault =
        controller.sliderBaseSchemeColor == null
            ? useMaterial3
                ? controller.sliderValueTinted
                    ? 'primary'
                    : 'primary'
                : controller.sliderValueTinted
                    ? 'primary'
                    : 'grey [onSurface op60% alpha blended w. surface op90%]'
            : '${controller.sliderBaseSchemeColor?.name}';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        ColorSchemePopupMenu(
          enabled: enableControl,
          title: const Text('Main color'),
          defaultLabel: 'primary',
          defaultDisabledLabelM2: 'secondary',
          value: controller.sliderBaseSchemeColor,
          onChanged: controller.setSliderBaseSchemeColor,
        ),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: ColorSchemePopupMenu(
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              enabled: enableControl,
              title: const Text('Value indicator color'),
              defaultLabel: labelIndicatorDefault,
              colorPrefix: controller.sliderValueTinted ? 'tinted ' : '',
              value: controller.sliderIndicatorSchemeColor,
              onChanged: controller.setSliderIndicatorSchemeColor,
            ),
            lastWidget: SwitchListTileReveal(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              enabled: enableControl,
              title: const Text('Tinted indicator'),
              subtitleReveal: Text(
                'Uses a scrim and opacity, to make it much '
                '${isLight ? 'darker' : 'lighter'} than the selected color, '
                'it also and adds some slight opacity. By default the value '
                'indicator only shows up on a stepped Slider. You can change '
                'this behavior with the indicator visibility further '
                'below.\n',
              ),
              value: controller.sliderValueTinted,
              onChanged: controller.setSliderValueTinted,
            ),
            isRow: isRow,
          );
        }),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: EnumPopupMenu<FlexSliderIndicatorType>(
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              enabled: enableControl,
              values: FlexSliderIndicatorType.values,
              title: const Text('Indicator type'),
              value: controller.sliderValueIndicatorType,
              onChanged: controller.setSliderValueIndicatorType,
            ),
            lastWidget: EnumPopupMenu<ShowValueIndicator>(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              enabled: enableControl,
              values: ShowValueIndicator.values,
              title: const Text('Indicator visibility'),
              value: controller.sliderShowValueIndicator,
              onChanged: controller.setSliderShowValueIndicator,
            ),
            isRow: isRow,
          );
        }),
        SliderListTileReveal(
          enabled: enableControl,
          title: const Text('Track height'),
          value: controller.sliderTrackHeight,
          onChanged: controller.setSliderTrackHeight,
          min: 1,
          max: 14,
          divisions: 13,
          valueDecimalPlaces: 0,
          valueHeading: 'HEIGHT',
          valueUnitLabel: ' dp',
          valueDefaultLabel: '4 dp',
        ),
        const Divider(),
        const ListTile(title: Text('Slider')),
        //
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: SliderShowcase(),
        ),
        ListTileReveal(
          dense: true,
          title: const Text('Known issues'),
          subtitleReveal: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'There are many issues related to Slider and a few '
                      'to its theming as well. You can find a collection of '
                      'issues related to the Slider in the slider umbrella ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsFlutterIssue125329,
                  text: 'issue #125329',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: '. The Slider does also not in Flutter 3.24 and '
                      'earlier versions follow the correct Material-3 '
                      'design. This is being worked on and a version that '
                      'supports it is expected in a coming Flutter update.\n',
                ),
              ],
            ),
          ),
        ),
        const Divider(),
        const ListTileReveal(title: Text('RangeSlider')),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: RangeSliderShowcase(),
        ),
        ListTileReveal(
          title: const Text('Known issues'),
          dense: true,
          subtitleReveal: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'The RangeSlider should behave and look like Slider '
                      'in Material-3 mode. This design is not yet available in '
                      'Flutter 3.24 and earlier. It can also not use the same '
                      'indicator classes as Slider. FCS applies existing drop '
                      'style as a better match with M3 than the rectangle in '
                      'M3 mode as default.\n'
                      '\n'
                      'RangeSlider also behaves differently from Slider when '
                      'looking at things like hover and focus responses. It '
                      'also lacks any kind of keyboard usage support. '
                      'You can find a collection of issues related to the '
                      'RangeSlider in the slider umbrella ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsFlutterIssue125329,
                  text: 'issue #125329',
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
