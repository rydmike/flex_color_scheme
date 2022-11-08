import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/theme_showcase.dart';
import '../../shared/color_scheme_popup_menu.dart';

class BannerBottomSheetSnackSettings extends StatelessWidget {
  const BannerBottomSheetSnackSettings(this.controller, {super.key});

  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;
    final bool isDark = theme.brightness == Brightness.dark;

    final String snackDefaultColorLabel = isDark
        ? (controller.useSubThemes && controller.useFlexColorScheme)
            ? 'default (light primary, 93% opacity)'
            : 'default (Light grey)'
        : (controller.useSubThemes && controller.useFlexColorScheme)
            ? 'default (dark primary, 95% opacity)'
            : 'default (dark grey)';

    // TODO(rydmike): Update BottomSheet M3 default when M3 version is released.
    final String sheetDefaultColorLabel = controller.useSubThemes &&
            controller.useFlexColorScheme
        ? 'default (surface)'
        : useMaterial3
            ? 'default (theme.canvasColor)' // Will become surface later in SDK.
            : 'default (theme.canvasColor)';

    final String sheetElevationDefaultLabel =
        controller.bottomSheetElevation == null
            ? 'modal 8\nfree 4'
            : controller.bottomSheetBorderRadius == null &&
                    controller.defaultRadius != null
                ? 'global ${controller.defaultRadius!.toStringAsFixed(0)}'
                : '';

    final String sheetRadiusDefaultLabel =
        controller.bottomSheetBorderRadius == null &&
                controller.defaultRadius == null
            ? 'default 28'
            : controller.bottomSheetBorderRadius == null &&
                    controller.defaultRadius != null
                ? 'global ${controller.defaultRadius!.toStringAsFixed(0)}'
                : '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(16),
          child: MaterialBannerSnackBarShowcase(),
        ),
        ColorSchemePopupMenu(
          title: const Text('SnackBar background color'),
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
        const Divider(),
        const Padding(
          padding: EdgeInsets.all(16),
          child: BottomSheetShowcase(),
        ),
        ColorSchemePopupMenu(
          title: const Text('BottomSheet background color'),
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
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('BottomSheet border radius'),
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
            padding: const EdgeInsetsDirectional.only(end: 12),
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
                      : 'default 0',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('BottomSheet elevation'),
          subtitle: Slider(
            min: -1,
            max: 30,
            divisions: 31,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.bottomSheetElevation == null ||
                        (controller.bottomSheetElevation ?? -1) < 0
                    ? sheetElevationDefaultLabel
                    : (controller.bottomSheetElevation?.toStringAsFixed(0) ??
                        '')
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
            padding: const EdgeInsetsDirectional.only(end: 12),
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
                      : 'default 0',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
