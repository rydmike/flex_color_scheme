import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../../../shared/widgets/universal/slider_list_tile_reveal.dart';
import '../../shared/color_scheme_popup_menu.dart';

class SnackBarMaterialBannerPanel extends StatelessWidget {
  const SnackBarMaterialBannerPanel(this.controller, {super.key});

  final ThemeController controller;

  static final Uri _fcsFlutterIssue108539 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/issues/108539',
  );

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle spanTextStyle = theme.textTheme.bodySmall!
        .copyWith(color: theme.colorScheme.onSurfaceVariant);
    final TextStyle linkStyle = theme.textTheme.bodySmall!.copyWith(
      color: theme.colorScheme.primary,
      fontWeight: FontWeight.bold,
    );

    // The most common logic for enabling Playground controls.
    final bool enableControl =
        controller.useSubThemes && controller.useFlexColorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTileReveal(
          title: Text('SnackBar'),
          subtitleReveal:
              Text('The SnackBar comes with two behaviors, fixed and '
                  'floating. When using M3, prefer using the floating '
                  'behavior.\n'),
        ),
        const SizedBox(height: 8),
        const SnackBarShowcase(),
        ListTileReveal(
          dense: true,
          title: const Text('Known issues'),
          subtitleReveal: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'The SnackBar border radius '
                      'for fixed and floating variants cannot be changed '
                      'separately via themes. The fixed style should always '
                      'by straight, the floating one may have border radius.\n'
                      '\n'
                      'If you set a border radius both variants will get it. '
                      'See Flutter SDK ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsFlutterIssue108539,
                  text: 'issue #108539',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: ' for more information.\n'
                      '\n'
                      'Due to this issue and because '
                      'the M3 design spec states one should avoid large '
                      'border radius on on SnackBars, it does not use '
                      'global radius override. You can still set a none '
                      'default radius here if you want to. It will change the '
                      'default style of both variants, but if you do not '
                      'use the older M2 fixed style, it does not matter.\n',
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        SliderListTileReveal(
          enabled: enableControl,
          title: const Text('Radius'),
          value: controller.snackBarBorderRadius,
          onChanged: controller.setSnackBarBorderRadius,
          min: 0,
          max: 40,
          divisions: 40,
          valueDecimalPlaces: 0,
          valueHeading: 'RADIUS',
          valueUnitLabel: ' dp',
          valueDefaultLabel: 'fixed 0, float 4',
        ),
        SliderListTileReveal(
          enabled: enableControl,
          title: const Text('Elevation'),
          value: controller.snackBarElevation,
          onChanged: controller.setSnackBarElevation,
          min: 0,
          max: 20,
          divisions: 20,
          valueDecimalPlaces: 0,
          valueHeading: 'ELEV',
          valueDefaultLabel: '4',
          valueDefaultDisabledLabel: '6',
        ),
        ColorSchemePopupMenu(
          enabled: enableControl,
          title: const Text('Background color'),
          subtitleReveal:
              const Text('Set to inverseSurface for default Material-3 style'),
          defaultLabel: 'onSurface with 45% primary blend and 93% opacity',
          defaultLabelDark: 'onSurface with 39% primary blend and 95% opacity',
          defaultDisabledLabel: 'inverseSurface',
          defaultDisabledLabelM2:
              'onSurface opacity 80%, alpha blend with surface',
          defaultDisabledLabelDarkM2: 'onSurface',
          value: controller.snackBarSchemeColor,
          onChanged: controller.setSnackBarSchemeColor,
        ),
        ColorSchemePopupMenu(
          enabled: enableControl,
          title: const Text('Action button text color'),
          defaultLabel: 'inversePrimary',
          defaultDisabledLabelM2: 'secondary',
          value: controller.snackBarActionSchemeColor,
          onChanged: controller.setSnackBarActionSchemeColor,
        ),
        const Divider(),
        const ListTileReveal(
          title: Text('MaterialBanner'),
          subtitleReveal: Text('No theme settings in current version of '
              'FlexColorScheme. Only included here to demonstrates its style '
              'with current theme and used ColorScheme.\n'),
        ),
        const MaterialBannerShowcase(),
        const SizedBox(height: 8),
        const ListTileReveal(
          dense: true,
          title: Text('More settings with the API'),
          subtitleReveal: Text(
            'With the API you can also set the text styles with '
            'FlexSubThemesData properties:\n'
            '\n'
            '- snackBarContentTextStyle\n',
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
