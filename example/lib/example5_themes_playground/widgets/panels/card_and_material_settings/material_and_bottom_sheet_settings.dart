import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/theme_showcase.dart';
import '../../shared/color_scheme_popup_menu.dart';

class MaterialAndBottomSheetSettings extends StatelessWidget {
  const MaterialAndBottomSheetSettings(this.controller, {super.key});

  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final String labelForDefaultSelectedItem = isDark
        ? (controller.useSubThemes && controller.useFlexColorScheme)
            ? 'default (light primary, 93% opacity)'
            : 'default (Light grey)'
        : (controller.useSubThemes && controller.useFlexColorScheme)
            ? 'default (dark primary, 95% opacity)'
            : 'default (dark grey)';
    final String sheetRadiusDefaultLabel =
        controller.bottomSheetBorderRadius == null &&
                controller.defaultRadius == null
            ? 'default 16'
            : controller.bottomSheetBorderRadius == null &&
                    controller.defaultRadius != null
                ? 'global ${controller.defaultRadius!.toStringAsFixed(0)}'
                : '';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(16),
          child: MaterialAndBottomSheetShowcase(),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('BottomSheet border radius'),
          subtitle: Slider.adaptive(
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
                    controller
                        .setBottomSheetBorderRadius(value < 0 ? null : value);
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
                      ? controller.bottomSheetBorderRadius == null ||
                              (controller.bottomSheetBorderRadius ?? -1) < 0
                          ? sheetRadiusDefaultLabel
                          : (controller.bottomSheetBorderRadius
                                  ?.toStringAsFixed(0) ??
                              '')
                      : 'default 0',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ColorSchemePopupMenu(
          title: const Text('SnackBar background color'),
          labelForDefault: labelForDefaultSelectedItem,
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
      ],
    );
  }
}
