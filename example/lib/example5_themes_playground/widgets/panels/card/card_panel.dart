import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../../../shared/widgets/universal/slider_list_tile_reveal.dart';
import '../../../theme/theme_values.dart';
import '../../shared/color_scheme_popup_menu.dart';

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
    final String cardElevationDefaultLabel = controller.cardElevation == null
        ? useMaterial3
            ? 'Card 1/variants 0'
            : '1'
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
          subtitleReveal: const Text(
            'Warning: Card variants in M3 cannot be themed separately. If you '
            'provide a radius, all Card variants will share the same radius '
            'and the Card.outlined variant will loose its outline border, if '
            'a radius is provided and it is not 12.\n',
          ),
        ),
        ColorSchemePopupMenu(
          enabled: enableControl,
          title: const Text('Background color'),
          defaultLabel:
              useMaterial3 ? 'surfaceContainerLow' : 'ThemeData.cardColor',
          value: controller.cardBackgroundSchemeColor,
          onChanged: controller.setCardBackgroundSchemeColor,
          subtitleReveal: const Text(
            'The background color for Cards. In M3 mode, the default varies '
            'by Card variant: elevated uses surfaceContainerLow, filled uses '
            'surfaceContainerHighest, and outlined uses surface. In M2 mode, '
            'ThemeData.cardColor is used.\n'
            'Warning: Card variants cannot be themed separately. If you '
            'provide a color, all M3 Card variants will share the same '
            'background color.',
          ),
        ),
        ColorSchemePopupMenu(
          enabled: enableControl,
          title: const Text('Border color'),
          defaultLabel:
              useMaterial3 ? 'outlineVariant only Card.outlined' : 'none',
          value: controller.cardBorderSchemeColor,
          onChanged: controller.setCardBorderSchemeColor,
          subtitleReveal: const Text(
            'The border color for Cards. In M3 mode, only Card.outlined has '
            'a border by default (using outlineVariant). Other Card variants '
            'have no border. In M2 mode, Cards have no border by default.\n'
            'Warning: Card variants cannot be themed separately. If you '
            'provide a border color, all M3 Card variants will have a border.',
          ),
        ),
        SliderListTileReveal(
          enabled: enableControl && controller.cardBorderSchemeColor != null,
          title: const Text('Border width'),
          value: controller.cardBorderWidth,
          onChanged: controller.setCardBorderWidth,
          min: 0,
          max: 6,
          divisions: 12,
          valueDecimalPlaces: 1,
          valueHeading: 'WIDTH',
          valueUnitLabel: ' dp',
          valueDefaultLabel: controller.cardBorderWidth == null
              ? useMaterial3
                  ? '1.0 only Card.outlined'
                  : 'none'
              : '',
          subtitleReveal: const Text(
            'Defines the border width for Cards. Only used if a border color '
            'is also defined. In M3 mode, Card.outlined defaults to 1.0 dp, '
            'while other variants have no border. In M2 mode, Cards have no '
            'border.\n'
            'Warning: Card variants cannot be themed separately. If you '
            'provide a border width, all M3 Card variants will have a border '
            'with the same width.',
          ),
        ),
        SliderListTileReveal(
          enabled: enableControl,
          title: const Text('Elevation'),
          value: controller.cardElevation,
          onChanged: controller.setCardElevation,
          min: 0,
          max: 20,
          divisions: 40,
          valueDecimalPlaces: 1,
          valueHeading: 'ELEV',
          valueDefaultLabel: cardElevationDefaultLabel,
          subtitleReveal: const Text(
            'Defines the elevation for Cards. Card is the elevated type and '
            'uses elevation 1.0, Card.filled and Card.outlined use '
            '0.0.\n'
            'Warning: If a value is provided it is applied to all Card '
            'variants and their variant specific elevation defaults are lost.',
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(16),
          child: CardTypesShowcase(showForcedOutlined: false),
        ),
        ListTileReveal(
          dense: true,
          title: const Text('Known issues'),
          subtitleReveal: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'You cannot theme the M3 Card variants separately. If '
                      'you change the border radius from the default radius, '
                      'the outline will be removed from the themed '
                      'Card.outlined if radius is not 12.\n'
                      '\n'
                      'Same applies if you theme the Card background color, '
                      'elevation, border4 color or border width, the defined '
                      'values will get used by all Card variants and you loose '
                      'their different styles. See Flutter SDK ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsFlutterIssueCardTheme,
                  text: 'issue #153912',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: ' for more information.\n',
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
