import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/theme_showcase.dart';
import '../../shared/color_scheme_popup_menu.dart';

class DialogSettings extends StatelessWidget {
  const DialogSettings(this.controller, {super.key});
  final ThemeController controller;

  static final Uri _fcsFlutterIssues = Uri(
    scheme: 'https',
    host: 'docs.flexcolorscheme.com',
    path: 'known_issues',
  );

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;
    final TextStyle spanTextStyle = theme.textTheme.bodyMedium!
        .copyWith(color: theme.textTheme.bodySmall!.color);
    final TextStyle linkStyle = theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primary, fontWeight: FontWeight.bold);

    final String dialogRadiusDefaultLabel =
        controller.dialogBorderRadius == null &&
                controller.defaultRadius == null
            ? 'default 28'
            : controller.dialogBorderRadius == null &&
                    controller.defaultRadius != null
                ? 'global ${controller.defaultRadius!.toStringAsFixed(0)}'
                : '';
    return Column(
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTile(
          title: Text('Themed dialog'),
          subtitle: Text('Flutter SDK default background is '
              'colorScheme.background for Dialog and DatePickerDialog, but '
              'colorScheme.surface for TimePickerDialog. FlexColorScheme '
              'sub-themes use surface as default for all dialogs to ensure '
              'that they have the same background by default and that '
              'elevation overlay color works in dark mode when it is another '
              'color than background.\n\n'
              'You can theme them to a shared color scheme based color too, '
              'with M3 colors, surface variant is an interesting option.'),
        ),
        ColorSchemePopupMenu(
          title: const Text('Background color'),
          labelForDefault: controller.useFlexColorScheme
              ? 'default (surface)'
              : 'default (alert&date=background) (time=surface)',
          index: controller.dialogBackgroundSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setDialogBackgroundSchemeColor(null);
                  } else {
                    controller.setDialogBackgroundSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Border radius'),
          subtitle: Slider(
            min: -1,
            max: 50,
            divisions: 51,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.dialogBorderRadius == null ||
                        (controller.dialogBorderRadius ?? -1) < 0
                    ? dialogRadiusDefaultLabel
                    : (controller.dialogBorderRadius?.toStringAsFixed(0) ?? '')
                : controller.useMaterial3
                    ? 'default 28'
                    : 'default 4',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.dialogBorderRadius ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setDialogBorderRadius(
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
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.dialogBorderRadius == null ||
                              (controller.dialogBorderRadius ?? -1) < 0
                          ? dialogRadiusDefaultLabel
                          : (controller.dialogBorderRadius
                                  ?.toStringAsFixed(0) ??
                              '')
                      : controller.useMaterial3
                          ? 'default 28'
                          : 'default 4',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
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
                ? controller.dialogElevation == null ||
                        (controller.dialogElevation ?? -1) < 0
                    ? 'default 6'
                    : (controller.dialogElevation?.toStringAsFixed(0) ?? '')
                : useMaterial3
                    ? 'default 6'
                    : 'default 24',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.dialogElevation ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setDialogElevation(
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
                      ? controller.dialogElevation == null ||
                              (controller.dialogElevation ?? -1) < 0
                          ? 'default 6'
                          : (controller.dialogElevation?.toStringAsFixed(0) ??
                              '')
                      : useMaterial3
                          ? 'default 6'
                          : 'default 24',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const Divider(),
        // Material 3 dialog elevation issue info.
        if (useMaterial3)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    style: spanTextStyle,
                    text:
                        "Do to an issue with Material's behavior in M3, there "
                        'is no elevation or tint on Dialogs when Material 3 is '
                        'enabled in Flutter 3.3 and earlier versions. You '
                        'can read more about it in docs ',
                  ),
                  LinkTextSpan(
                    style: linkStyle,
                    uri: _fcsFlutterIssues,
                    text: 'known SDK M3 issues',
                  ),
                  TextSpan(
                    style: spanTextStyle,
                    text: '. Dialogs usually have a scrim, so the issue is not '
                        'so visible when they are actually used as dialogs. '
                        'Fix should arrive in next stable release after '
                        'Flutter 3.3.',
                  ),
                ],
              ),
            ),
          ),
        const AlertDialogShowcase(),
        const TimePickerDialogShowcase(),
        const DatePickerDialogShowcase(),
      ],
    );
  }
}
