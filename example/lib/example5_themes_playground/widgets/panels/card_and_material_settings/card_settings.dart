import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/theme_showcase.dart';

class CardSettings extends StatelessWidget {
  const CardSettings(this.controller, {super.key});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final String cardRadiusDefaultLabel =
        controller.cardBorderRadius == null && controller.defaultRadius == null
            ? 'default 12'
            : controller.cardBorderRadius == null &&
                    controller.defaultRadius != null
                ? 'global ${controller.defaultRadius!.toStringAsFixed(0)}'
                : '';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTile(
          subtitle: Text('All component themes with border radius can '
              'also have their '
              'radius overridden and changed individually. It then either '
              'overrides the M3 default or the set global radius default, '
              'depending on what is in use. This is demonstrated here on '
              'the Card. Use API to modify radius individually '
              'on even more components.'),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Card border radius'),
          subtitle: Slider.adaptive(
            min: -1,
            max: 40,
            divisions: 41,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.cardBorderRadius == null ||
                        (controller.cardBorderRadius ?? -1) < 0
                    ? cardRadiusDefaultLabel
                    : (controller.cardBorderRadius?.toStringAsFixed(0) ?? '')
                : controller.useMaterial3
                    ? 'default 12'
                    : 'default 4',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.cardBorderRadius ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setCardBorderRadius(value < 0 ? null : value);
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
                      ? controller.cardBorderRadius == null ||
                              (controller.cardBorderRadius ?? -1) < 0
                          ? cardRadiusDefaultLabel
                          : (controller.cardBorderRadius?.toStringAsFixed(0) ??
                              '')
                      : controller.useMaterial3
                          ? 'default 12'
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
        const Padding(
          padding: EdgeInsets.all(16),
          child: CardShowcase(),
        ),
      ],
    );
  }
}
