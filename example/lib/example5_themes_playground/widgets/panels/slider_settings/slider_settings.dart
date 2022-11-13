import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/theme_showcase.dart';
import '../../shared/color_scheme_popup_menu.dart';

class SliderSettings extends StatelessWidget {
  const SliderSettings(this.controller, {super.key});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        ColorSchemePopupMenu(
          title: const Text('Slider base color'),
          labelForDefault: controller.useMaterial3
              ? 'default (primary)'
              : 'default (primary)',
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
        SwitchListTile(
          title: const Text('Use base color tinted value indicator'),
          subtitle: const Text('The value indicator by default only shows on '
              'stepped Slider'),
          value: controller.sliderValueTinted &&
              controller.useSubThemes &&
              controller.useFlexColorScheme,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? controller.setSliderValueTinted
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
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.sliderTrackHeight == null ||
                              (controller.sliderTrackHeight ?? 0) <= 0
                          ? 'default 4'
                          : (controller.sliderTrackHeight?.toStringAsFixed(0) ??
                              '')
                      : 'default 4',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const ListTile(title: Text('Slider style demos')),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: SliderShowcase(),
        ),
        const ListTile(
          dense: true,
          subtitle:
              Text('Flutter SDK slider theme is very configurable, offering '
                  'also a lot of classes designed to be extended for complete '
                  'customization capabilities. FCS and Playground only offers '
                  'a limited set. Use copyWith on FCS generated theme if you '
                  'need further customization of the Slider.'),
        ),
      ],
    );
  }
}
