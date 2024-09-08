import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../../../shared/widgets/universal/slider_list_tile_reveal.dart';
import '../../shared/color_scheme_popup_menu.dart';

class SnackBarMaterialBannerSettings extends StatelessWidget {
  const SnackBarMaterialBannerSettings(this.controller, {super.key});

  final ThemeController controller;

  static final Uri _fcsFlutterIssue108539 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/issues/108539',
  );

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;
    final bool isDark = theme.brightness == Brightness.dark;
    final TextStyle spanTextStyle = theme.textTheme.bodySmall!;
    final TextStyle linkStyle = theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primary, fontWeight: FontWeight.bold);

    // The most common logic for enabling Playground controls.
    final bool enableControl =
        controller.useSubThemes && controller.useFlexColorScheme;

    final String snackDefaultColorLabel = isDark
        ? (controller.useSubThemes && controller.useFlexColorScheme)
            ? 'default (light primary, 93% opacity)'
            : useMaterial3
                ? 'default (inverseSurface)'
                : 'default (onSurface)'
        : (controller.useSubThemes && controller.useFlexColorScheme)
            ? 'default (dark primary, 95% opacity)'
            : useMaterial3
                ? 'default (inverseSurface)'
                : 'default (onSurface.op80%, alphaBlend surface)';

    final String snackActionDefaultColorLabel = isDark
        ? (controller.useSubThemes && controller.useFlexColorScheme)
            ? 'default (inversePrimary)'
            : useMaterial3
                ? 'default (inversePrimary)'
                : 'default (secondary)'
        : (controller.useSubThemes && controller.useFlexColorScheme)
            ? 'default (inversePrimary)'
            : useMaterial3
                ? 'default (inversePrimary)'
                : 'default (secondary)';

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
          title: const Text('Background color'),
          subtitle: const Text('Set to inverseSurface for default M3 style'),
          defaultLabel: snackDefaultColorLabel,
          value: controller.snackBarSchemeColor?.index ?? -1,
          onChanged: enableControl
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setSnackBarSchemeColor(null);
                  } else {
                    controller
                        .setSnackBarSchemeColor(SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ColorSchemePopupMenu(
          title: const Text('Action button text color'),
          defaultLabel: snackActionDefaultColorLabel,
          value: controller.snackBarActionSchemeColor?.index ?? -1,
          onChanged: enableControl
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setSnackBarActionSchemeColor(null);
                  } else {
                    controller.setSnackBarActionSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
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
      ],
    );
  }
}
