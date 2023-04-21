import 'dart:async';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/const/app.dart';
import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../shared/color_scheme_popup_menu.dart';

class BottomSheetBannerSnackSettings extends StatelessWidget {
  const BottomSheetBannerSnackSettings(this.controller, {super.key});

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

    final String sheetDefaultColorLabel =
        controller.useSubThemes && controller.useFlexColorScheme
            ? 'default (surface)'
            : useMaterial3
                ? 'default (surface)'
                : 'default (theme.canvasColor)';
    final String sheetElevationDefaultLabel =
        controller.bottomSheetElevation == null
            ? useMaterial3
                ? 'default 1'
                : 'default 4'
            : '';
    final String sheetModalElevationDefaultLabel =
        controller.bottomSheetModalElevation == null
            ? useMaterial3
                ? 'default 2'
                : 'default 8'
            : '';

    // Get effective platform default global radius.
    final double? effectiveRadius = App.effectiveRadius(controller);
    final String sheetRadiusDefaultLabel = controller.bottomSheetBorderRadius ==
                null &&
            effectiveRadius == null
        ? 'default 28'
        : controller.bottomSheetBorderRadius == null && effectiveRadius != null
            ? 'global ${effectiveRadius.toStringAsFixed(0)}'
            : '';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTileReveal(
          title: Text('BottomSheet'),
          subtitleDense: true,
          subtitle: Text('The BottomSheet comes in two variants, normal and '
              'modal version. Some of their properties can be themed '
              'individually, but not all of them. The border radius only has '
              'one the property shared by both variants.\n'),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Border radius'),
          subtitle: Slider(
            min: -1,
            max: 50,
            divisions: 51,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.bottomSheetBorderRadius == null ||
                        (controller.bottomSheetBorderRadius ?? -1) < 0
                    ? sheetRadiusDefaultLabel
                    : (controller.bottomSheetBorderRadius?.toStringAsFixed(0) ??
                        '')
                : useMaterial3
                    ? 'default 28'
                    : 'default 0',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.bottomSheetBorderRadius ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setBottomSheetBorderRadius(
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
                      ? controller.bottomSheetBorderRadius == null ||
                              (controller.bottomSheetBorderRadius ?? -1) < 0
                          ? sheetRadiusDefaultLabel
                          : (controller.bottomSheetBorderRadius
                                  ?.toStringAsFixed(0) ??
                              '')
                      : useMaterial3
                          ? 'default 28'
                          : 'default 0',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const ListTile(title: Text('Standard BottomSheet')),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Elevation'),
          subtitle: Slider(
            min: -1,
            max: 20,
            divisions: 21,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.bottomSheetElevation == null ||
                        (controller.bottomSheetElevation ?? -1) < 0
                    ? sheetElevationDefaultLabel
                    : (controller.bottomSheetElevation?.toStringAsFixed(0) ??
                        '')
                : useMaterial3
                    ? 'default 1'
                    : 'default 0',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.bottomSheetElevation ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setBottomSheetElevation(
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
                      ? controller.bottomSheetElevation == null ||
                              (controller.bottomSheetElevation ?? -1) < 0
                          ? sheetElevationDefaultLabel
                          : (controller.bottomSheetElevation
                                  ?.toStringAsFixed(0) ??
                              '')
                      : useMaterial3
                          ? 'default 1'
                          : 'default 0',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ColorSchemePopupMenu(
          title: const Text('Background color'),
          labelForDefault: sheetDefaultColorLabel,
          index: controller.bottomSheetSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setBottomSheetSchemeColor(null);
                  } else {
                    controller
                        .setBottomSheetSchemeColor(SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        const SizedBox(height: 8),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: BottomSheetShowcase(),
        ),
        const ListTile(title: Text('Modal BottomSheet')),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Elevation'),
          subtitle: Slider(
            min: -1,
            max: 20,
            divisions: 21,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.bottomSheetModalElevation == null ||
                        (controller.bottomSheetModalElevation ?? -1) < 0
                    ? sheetModalElevationDefaultLabel
                    : (controller.bottomSheetModalElevation
                            ?.toStringAsFixed(0) ??
                        '')
                : useMaterial3
                    ? 'default 1'
                    : 'default 0',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.bottomSheetModalElevation ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setBottomSheetModalElevation(
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
                      ? controller.bottomSheetModalElevation == null ||
                              (controller.bottomSheetModalElevation ?? -1) < 0
                          ? sheetModalElevationDefaultLabel
                          : (controller.bottomSheetModalElevation
                                  ?.toStringAsFixed(0) ??
                              '')
                      : useMaterial3
                          ? 'default 1'
                          : 'default 0',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ColorSchemePopupMenu(
          title: const Text('Background color'),
          labelForDefault: sheetDefaultColorLabel,
          index: controller.bottomSheetModalSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setBottomSheetModalSchemeColor(null);
                  } else {
                    controller.setBottomSheetModalSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        const SizedBox(height: 8),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: BottomSheetModalShowcase(),
        ),
        const SizedBox(height: 16),
        const Divider(),
        const ListTileReveal(
          title: Text('SnackBar'),
          subtitleDense: true,
          subtitle: Text('The SnackBar comes with two behaviors, fixed and '
              'floating. When using M3, prefer using the floating '
              'behavior.\n'),
        ),
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
        ListTile(
          title: const Text('Show a fixed test SnackBar'),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 5.0),
            child: FilledButton(
              onPressed: () {
                unawaited(_showDemoSnackBar(context, SnackBarBehavior.fixed,
                    'A SnackBar with SnackBarBehavior.fixed'));
              },
              child: const Text('Fixed Snack'),
            ),
          ),
          onTap: () {
            unawaited(_showDemoSnackBar(context, SnackBarBehavior.fixed,
                'A SnackBar with SnackBarBehavior.fixed'));
          },
        ),
        ListTile(
          title: const Text('Show a floating test SnackBar'),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 5.0),
            child: FilledButton(
              onPressed: () {
                unawaited(_showDemoSnackBar(context, SnackBarBehavior.floating,
                    'A SnackBar with SnackBarBehavior.floating'));
              },
              child: const Text('Float Snack'),
            ),
          ),
          onTap: () {
            unawaited(_showDemoSnackBar(context, SnackBarBehavior.floating,
                'A SnackBar with SnackBarBehavior.floating'));
          },
        ),
        const SizedBox(height: 8),
        const SnackBarShowcase(),
        const SizedBox(height: 16),
        const Divider(),
        const ListTileReveal(
          title: Text('MaterialBanner'),
          subtitleDense: true,
          subtitle: Text('No theme settings in current version of '
              'FlexColorScheme. Included to demonstrates its style with '
              'current theme and used ColorScheme.\n'),
        ),
        const MaterialBannerShowcase(),
        const SizedBox(height: 8),
      ],
    );
  }

  Future<void> _showDemoSnackBar(
      BuildContext context, SnackBarBehavior style, String message) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: style,
        showCloseIcon: true,
        action: SnackBarAction(
          label: 'Close',
          onPressed: () {},
        ),
        duration: const Duration(milliseconds: 3000),
      ),
    );
  }
}
