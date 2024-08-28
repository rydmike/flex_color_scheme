import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../../../shared/widgets/universal/slider_list_tile_reveal.dart';
import '../../../../shared/widgets/universal/switch_list_tile_reveal.dart';
import '../../shared/color_scheme_popup_menu.dart';
import 'slider_indicator_popup_menu.dart';
import 'slider_show_indicator_popup_menu.dart';

class SliderSettings extends StatelessWidget {
  const SliderSettings(this.controller, {super.key});
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
    final TextStyle spanTextStyle = theme.textTheme.bodySmall!;
    final TextStyle linkStyle = theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primary, fontWeight: FontWeight.bold);

    // The most common logic for enabling Playground controls.
    final bool enableControl =
        controller.useSubThemes && controller.useFlexColorScheme;

    final bool isLight = theme.brightness == Brightness.light;
    final String labelIndicatorDefault =
        controller.sliderBaseSchemeColor == null
            ? useMaterial3
                ? controller.sliderValueTinted
                    ? 'primary'
                    : 'default (primary)'
                : controller.sliderValueTinted
                    ? 'primary'
                    : 'default (grey)'
            : '${controller.sliderBaseSchemeColor?.name}';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        ColorSchemePopupMenu(
          title: const Text('Main color'),
          labelForDefault: 'default (primary)',
          index: controller.sliderBaseSchemeColor?.index ?? -1,
          onChanged: enableControl
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setSliderBaseSchemeColor(null);
                  } else {
                    controller
                        .setSliderBaseSchemeColor(SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ColorSchemePopupMenu(
          title: const Text('Value indicator color'),
          labelForDefault: labelIndicatorDefault,
          colorPrefix: controller.sliderValueTinted ? 'tinted ' : '',
          index: controller.sliderIndicatorSchemeColor?.index ?? -1,
          onChanged: enableControl
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setSliderIndicatorSchemeColor(null);
                  } else {
                    controller.setSliderIndicatorSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        SwitchListTileReveal(
          title: const Text('Tinted value indicator'),
          subtitleReveal: Text('Uses a scrim and opacity, to make it much '
              '${isLight ? 'darker' : 'lighter'} than the selected color, '
              'it also and adds some slight opacity. By default the value '
              'indicator only shows up on a stepped Slider. You can change '
              'this behavior with the indicator visibility further below.\n'),
          value: enableControl && controller.sliderValueTinted,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? controller.setSliderValueTinted
              : null,
        ),
        SliderIndicatorPopupMenu(
          title: const Text('Indicator type'),
          labelForDefault:
              useMaterial3 ? 'default M3 (drop)' : 'default M2 (rectangular)',
          index: controller.sliderValueIndicatorType?.index ?? -1,
          onChanged: enableControl
              ? (int index) {
                  if (index < 0 ||
                      index >= FlexSliderIndicatorType.values.length) {
                    controller.setSliderValueIndicatorType(null);
                  } else {
                    controller.setSliderValueIndicatorType(
                        FlexSliderIndicatorType.values[index]);
                  }
                }
              : null,
        ),
        SliderShowIndicatorPopupMenu(
          title: const Text('Indicator visibility'),
          labelForDefault: 'Default (Only for discrete)',
          index: controller.sliderShowValueIndicator?.index ?? -1,
          onChanged: enableControl
              ? (int index) {
                  if (index < 0 || index >= ShowValueIndicator.values.length) {
                    controller.setSliderShowValueIndicator(null);
                  } else {
                    controller.setSliderShowValueIndicator(
                        ShowValueIndicator.values[index]);
                  }
                }
              : null,
        ),
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
                  text: '.\n',
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
                      'in Material 3 mode. his design is not yet available in '
                      'Flutter 3.10 and earlier. It can also not use the same '
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
