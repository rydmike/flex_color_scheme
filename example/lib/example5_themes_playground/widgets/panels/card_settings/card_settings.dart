import 'package:flutter/material.dart';

import '../../../../shared/const/app.dart';
import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';

class CardSettings extends StatelessWidget {
  const CardSettings(this.controller, {super.key});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    // Get effective platform default global radius.
    final double? effectiveRadius = App.effectiveRadius(controller);
    final String cardRadiusDefaultLabel =
        controller.cardBorderRadius == null && effectiveRadius == null
            ? 'default 12'
            : controller.cardBorderRadius == null && effectiveRadius != null
                ? 'global ${effectiveRadius.toStringAsFixed(0)}'
                : '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTileReveal(
          title: Text('Card info'),
          subtitleDense: true,
          subtitle: Text(
            'Default background color in M2 mode comes from Material of '
            'type card, which by default is set to theme colorScheme surface. '
            'When using Material 3, Card also gets elevation based tint using '
            'the scheme surfaceTint color. When using Material 2, surfaceTint '
            'has no effect, even if it is specified.\n'
            '\n'
            'You can set Card theme or widget property surfaceTintColor to '
            'Colors.transparent to remove the elevation tint. In '
            'FlexColorScheme Component Theme settings you can remove all '
            'elevation tint from all widgets on desired platforms.\n'
            '\n'
            'Cards still have elevation shadow in M3 mode as before. You '
            'can remove the shadow from elevated Cards in M3 mode to make '
            'only elevation tinted Cards by assigning Colors.transparent to '
            'its shadowColor theme or widget property.\n',
          ),
        ),
        ListTileReveal(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Border radius'),
          subtitleDense: true,
          subtitle: const Text(
            'Component themes with border radius can have their radius '
            'overridden and changed individually. It then either '
            'overrides its default value or the set global radius default, '
            'depending on what is in use. The border radius for Cards default '
            'to 12dp in M3 mode, and to 4dp in M2 mode.\n',
          ),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: Slider(
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
                    controller.setCardBorderRadius(
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
                      ? controller.cardBorderRadius == null ||
                              (controller.cardBorderRadius ?? -1) < 0
                          ? cardRadiusDefaultLabel
                          : (controller.cardBorderRadius?.toStringAsFixed(0) ??
                              '')
                      : controller.useMaterial3
                          ? 'default 12'
                          : 'default 4',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const Divider(),
        const Padding(
          padding: EdgeInsets.all(16),
          child: CardShowcase(explain: false),
        ),
      ],
    );
  }
}
