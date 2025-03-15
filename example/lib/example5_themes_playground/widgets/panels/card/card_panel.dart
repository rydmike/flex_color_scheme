import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../../../shared/widgets/universal/slider_list_tile_reveal.dart';
import '../../../theme/theme_values.dart';

class CardPanel extends StatelessWidget {
  const CardPanel(this.controller, {super.key});
  final ThemeController controller;

  static final Uri _fcsFlutterIssueCardTheme = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/issues/153912',
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

    // Get effective platform default global radius.
    final double? effectiveRadius = ThemeValues.effectiveRadius(controller);
    final String cardRadiusDefaultLabel =
        controller.cardBorderRadius == null && effectiveRadius == null
            ? '12 dp'
            : controller.cardBorderRadius == null && effectiveRadius != null
                ? 'global ${effectiveRadius.toStringAsFixed(0)} dp'
                : '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTileReveal(
          title: Text('Card info'),
          subtitleReveal: Text(
            'In Component Theme settings you can remove '
            'elevation tint from all widgets on desired platforms. '
            'In Flutter 3.22 and later this feature is not needed since '
            'elevation tints are removed by default.\n'
            '\n'
            'Cards still have elevation shadow in M3 mode as before. You '
            'can remove the shadow from elevated Cards by assigning '
            'Colors.transparent to its shadowColor theme or widget property.\n',
          ),
        ),
        SliderListTileReveal(
          enabled: enableControl,
          title: const Text('Border radius'),
          value: controller.cardBorderRadius,
          onChanged: controller.setCardBorderRadius,
          min: 0,
          max: 40,
          divisions: 40,
          valueDecimalPlaces: 0,
          valueHeading: 'RADIUS',
          valueUnitLabel: ' dp',
          valueDefaultLabel: cardRadiusDefaultLabel,
          valueDefaultDisabledLabel: useMaterial3 ? '12 dp' : '4 dp',
        ),
        const Padding(
          padding: EdgeInsets.all(16),
          child: CardTypesShowcase(showForcedOutlined: true),
        ),
        ListTileReveal(
          dense: true,
          title: const Text('Known issues'),
          subtitleReveal: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'You cannot theme the Card variants separately. If '
                      'you change the border radius from the default radius, '
                      'the outline will be removed from the themed '
                      'Card.outlined.\n'
                      '\n'
                      'Same applies if you theme the Card background color or '
                      'elevation, the defined values will get used by all Card '
                      'variants and you loose their different styles. '
                      'See Flutter SDK ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsFlutterIssueCardTheme,
                  text: 'issue #153912',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: ' for more information.\n'
                      '\n'
                      'Due to this issue, if you theme the radius to anything '
                      'else above than 12 in M3 mode, be aware that you loose '
                      'the Card.outlined variant, it will not have a border. '
                      'The Outlined Forced version above is putting the border '
                      'back on widget level.\n',
                ),
              ],
            ),
          ),
        ),
        const Divider(),
        const Padding(
          padding: EdgeInsets.all(16),
          child: CardShowcase(explain: true),
        ),
      ],
    );
  }
}
