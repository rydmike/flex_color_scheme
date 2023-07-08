import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
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
          subtitleDense: true,
          subtitle: Text('The SnackBar comes with two behaviors, fixed and '
              'floating. When using M3, prefer using the floating '
              'behavior.\n'),
        ),
        const SizedBox(height: 8),
        const SnackBarShowcase(),
        ListTileReveal(
          dense: true,
          title: const Text('Known issues and limitations'),
          subtitle: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'In Flutter 3.7 and earlier the SnackBar border radius '
                      'for fixed and floating behavior cannot be changed '
                      'separately via themes. The fixed style should always '
                      'by straight, the floating one may have border radius. '
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
                  text: ' for more information. Due to this issue and because '
                      'the M3 design spec states one should avoid large '
                      'border radius on on SnackBars, it does not use '
                      'global radius override.',
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Border radius'),
          subtitle: Slider(
            min: -1,
            max: 30,
            divisions: 31,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.snackBarBorderRadius == null ||
                        (controller.snackBarBorderRadius ?? -1) < 0
                    ? 'default fix 0, float 4'
                    : (controller.snackBarBorderRadius?.toStringAsFixed(0) ??
                        '')
                : 'default fix 0, float 4',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.snackBarBorderRadius ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setSnackBarBorderRadius(
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
                      ? controller.snackBarBorderRadius == null ||
                              (controller.snackBarBorderRadius ?? -1) < 0
                          ? 'default\nfix 0, float 4'
                          : (controller.snackBarBorderRadius
                                  ?.toStringAsFixed(0) ??
                              '')
                      : 'default\nfix 0, float 4',
                  style: theme.textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Elevation'),
          subtitle: Slider(
            min: -1,
            max: 20,
            divisions: 21,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.snackBarElevation == null ||
                        (controller.snackBarElevation ?? -1) < 0
                    ? 'default 4'
                    : (controller.snackBarElevation?.toStringAsFixed(0) ?? '')
                : 'default 6',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.snackBarElevation ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setSnackBarElevation(
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
                  'ELEV',
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.snackBarElevation == null ||
                              (controller.snackBarElevation ?? -1) < 0
                          ? 'default 4'
                          : (controller.snackBarElevation?.toStringAsFixed(0) ??
                              '')
                      : 'default 6',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ColorSchemePopupMenu(
          title: const Text('Background color'),
          subtitle: const Text('Set to inverseSurface for default M3 style'),
          labelForDefault: snackDefaultColorLabel,
          index: controller.snackBarSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
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
          labelForDefault: snackActionDefaultColorLabel,
          index: controller.snackBarActionSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
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
          subtitleDense: true,
          subtitle: Text('No theme settings in current version of '
              'FlexColorScheme. Only included here to demonstrates its style '
              'with current theme and used ColorScheme.\n'),
        ),
        const MaterialBannerShowcase(),
        const SizedBox(height: 8),
      ],
    );
  }
}
