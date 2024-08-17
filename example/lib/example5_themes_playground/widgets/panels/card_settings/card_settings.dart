import 'package:flutter/material.dart';

import '../../../../shared/const/app.dart';
import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';

class CardSettings extends StatelessWidget {
  const CardSettings(this.controller, {super.key});
  final ThemeController controller;

  // TODO(rydmike): Create issue and add correct URL.
  static final Uri _fcsFlutterIssueCardTheme = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/issues/115827',
  );

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle spanTextStyle = theme.textTheme.bodySmall!;
    final TextStyle linkStyle = theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primary, fontWeight: FontWeight.bold);

    // Get effective platform default global radius.
    final double? effectiveRadius = App.effectiveRadius(controller);
    final String cardRadiusDefaultLabel =
        controller.cardBorderRadius == null && effectiveRadius == null
            ? controller.useMaterial3
                ? 'default 12'
                : 'default 4'
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
        const Padding(
          padding: EdgeInsets.all(16),
          child: CardTypesShowcase(
            cardWidth: 140,
            showThemedOutline: true,
          ),
        ),
        ListTileReveal(
          dense: true,
          title: const Text('Known issues'),
          subtitle: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'You cannot theme the Card variants separately. If '
                      'you change the border radius from the default radius '
                      'the border outline will will be removed from the '
                      'default themed Card.outline.\n'
                      '\n'
                      'Same applies if you theme the Card background color, '
                      'it will get used by all Card variants and you loose '
                      'the different style. '
                      'See Flutter SDK ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsFlutterIssueCardTheme,
                  text: 'issue #CardTheme',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: ' for more information.\n'
                      '\n'
                      'Due to this issue, if you theme the radius to anything '
                      'other than 12 in M3 mode, be aware that you loose the '
                      'Card.outlined variant, as it will not have a border.\n'
                      '\n'
                      'Likewise if you use a custom themed background color, '
                      'all Card variants will get this color.\n ',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
