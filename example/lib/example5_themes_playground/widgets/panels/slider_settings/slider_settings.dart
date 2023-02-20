import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../shared/color_scheme_popup_menu.dart';
import 'slider_indicator_popup_menu.dart';
import 'slider_show_indicator_popup_menu.dart';

class SliderSettings extends StatelessWidget {
  const SliderSettings(this.controller, {super.key});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final String labelIndicatorDefault =
        controller.sliderBaseSchemeColor == null
            ? controller.useMaterial3
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
          title: const Text('Slider base color'),
          labelForDefault: 'default (primary)',
          index: controller.sliderBaseSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
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
          title: const Text('Slider value indicator color'),
          labelForDefault: labelIndicatorDefault,
          colorPrefix: controller.sliderValueTinted ? 'tinted ' : '',
          index: controller.sliderIndicatorSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
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
        SwitchListTile(
          title: const Text('Tinted value indicator'),
          subtitle: const Text('Uses scrim and opacity, makes it darker than '
              'selected color, but with some opacity. The value indicator by '
              'default only shows on a stepped Slider'),
          value: controller.sliderValueTinted &&
              controller.useSubThemes &&
              controller.useFlexColorScheme,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? controller.setSliderValueTinted
              : null,
        ),
        SliderIndicatorPopupMenu(
          title: const Text('Slider value indicator type'),
          labelForDefault: controller.useMaterial3
              ? 'default M3 (drop)'
              : 'default M2 (rectangular)',
          index: controller.sliderValueIndicatorType?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
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
          title: const Text('Slider value indicator visibility'),
          labelForDefault: 'Default (Only for discrete)',
          index: controller.sliderShowValueIndicator?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
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
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Slider track height'),
          subtitle: Slider(
            min: 0,
            max: 14,
            divisions: 14,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.sliderTrackHeight == null ||
                        (controller.sliderTrackHeight ?? 0) <= 0
                    ? 'default 4'
                    : (controller.sliderTrackHeight?.toStringAsFixed(0) ?? '')
                : 'default 4',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.sliderTrackHeight ?? 0
                : 0,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setSliderTrackHeight(
                        value <= 0 ? null : value.roundToDouble());
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'HEIGHT',
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.sliderTrackHeight == null ||
                              (controller.sliderTrackHeight ?? 0) <= 0
                          ? 'default 4'
                          : (controller.sliderTrackHeight?.toStringAsFixed(0) ??
                              '')
                      : 'default 4',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const Divider(),
        const ListTile(title: Text('Slider')),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: SliderShowcase(),
        ),
        const Divider(),
        const ListTile(title: Text('RangeSlider')),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: RangeSliderShowcase(),
        ),
        const Divider(),
        const ListTile(
          dense: true,
          subtitle: Text('Slider and its theme are very configurable. Slider '
              'has classes designed to be extended for complete '
              'customization capabilities. FCS and Playground offer a good '
              'starter set. Use copyWith on FCS generated theme if you '
              'need further customization of the Slider or extend '
              'its classes.'),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
