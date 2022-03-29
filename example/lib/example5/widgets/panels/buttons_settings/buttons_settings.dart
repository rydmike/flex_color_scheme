import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/theme_showcase.dart';
import '../../shared/color_scheme_popup_menu.dart';

class ButtonsSettings extends StatelessWidget {
  const ButtonsSettings(
    this.controller, {
    Key? key,
  }) : super(key: key);
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTile(
          subtitle: Text('You can change button theme colors, default is '
              'primary color. All component themes with border radius can '
              'also have their own radius changed individually. It then either '
              'overrides the M3 default or the set global radius default, '
              'depending on what is in use. This is demonstrated here with '
              'the standard buttons. Use API to modify radius individually '
              'on even more components.'),
        ),
        ColorSchemePopupMenu(
          title: const Text('ElevatedButton color'),
          index: controller.elevatedButtonSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setElevatedButtonSchemeColor(null);
                  } else {
                    controller.setElevatedButtonSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ElevatedButtonShowcase(),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('ElevatedButton border radius'),
          subtitle: Slider.adaptive(
            min: -1,
            max: 30,
            divisions: 31,
            label: controller.elevatedButtonBorderRadius == null ||
                    (controller.elevatedButtonBorderRadius ?? -1) < 0
                ? 'default'
                : (controller.elevatedButtonBorderRadius?.toStringAsFixed(0) ??
                    ''),
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.elevatedButtonBorderRadius ?? -1
                : 4,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setElevatedButtonBorderRadius(
                        value < 0 ? null : value);
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'RADIUS',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.elevatedButtonBorderRadius == null ||
                              (controller.elevatedButtonBorderRadius ?? -1) < 0
                          ? 'default'
                          : (controller.elevatedButtonBorderRadius
                                  ?.toStringAsFixed(0) ??
                              '')
                      : '4',
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ColorSchemePopupMenu(
          title: const Text('OutlinedButton color'),
          index: controller.outlinedButtonSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setOutlinedButtonSchemeColor(null);
                  } else {
                    controller.setOutlinedButtonSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: OutlinedButtonShowcase(),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('OutlinedButton border radius'),
          subtitle: Slider.adaptive(
            min: -1,
            max: 30,
            divisions: 31,
            label: controller.outlinedButtonBorderRadius == null ||
                    (controller.outlinedButtonBorderRadius ?? -1) < 0
                ? 'default'
                : (controller.outlinedButtonBorderRadius?.toStringAsFixed(0) ??
                    ''),
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.outlinedButtonBorderRadius ?? -1
                : 4,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setOutlinedButtonBorderRadius(
                        value < 0 ? null : value);
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'RADIUS',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.outlinedButtonBorderRadius == null ||
                              (controller.outlinedButtonBorderRadius ?? -1) < 0
                          ? 'default'
                          : (controller.outlinedButtonBorderRadius
                                  ?.toStringAsFixed(0) ??
                              '')
                      : '4',
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ColorSchemePopupMenu(
          title: const Text('TextButton color'),
          index: controller.textButtonSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setTextButtonSchemeColor(null);
                  } else {
                    controller
                        .setTextButtonSchemeColor(SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: TextButtonShowcase(),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('TextButton border radius'),
          subtitle: Slider.adaptive(
            min: -1,
            max: 30,
            divisions: 31,
            label: controller.textButtonBorderRadius == null ||
                    (controller.textButtonBorderRadius ?? -1) < 0
                ? 'default'
                : (controller.textButtonBorderRadius?.toStringAsFixed(0) ?? ''),
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.textButtonBorderRadius ?? -1
                : 4,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller
                        .setTextButtonBorderRadius(value < 0 ? null : value);
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'RADIUS',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.textButtonBorderRadius == null ||
                              (controller.textButtonBorderRadius ?? -1) < 0
                          ? 'default'
                          : (controller.textButtonBorderRadius
                                  ?.toStringAsFixed(0) ??
                              '')
                      : '4',
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),

        /// Showing the legacy buttons is removed from the sample.
        ///
        /// The deprecated legacy buttons weill be removed in next stable
        /// release after Flutter 2.10.x. For more info see:
        /// https://github.com/flutter/flutter/issues/98537
        ///
        /// The sub themes that style them will be kept available since it
        /// is not going away and may be useful to the theme ButtonBar and
        /// dropdown. button style. As long as the buttons are actually
        /// available in the SDK, the comment code to show will be kept
        /// around in the samples, should anybody want to uncomment it to
        /// see what their style with sub themes applied looks like.

        // Padding(
        //   padding: const EdgeInsets.all(8),
        //   child: Text('Legacy buttons, deprecated',
        //       style: Theme.of(context).textTheme.titleMedium),
        // ),
        // const LegacyButtonShowcase(),
        // const SizedBox(height: 8),
        // const LegacyButtonShowcase(enabled: false),
        // const SizedBox(height: 8),
        // const LegacyButtonIconShowcase(),
      ],
    );
  }
}
