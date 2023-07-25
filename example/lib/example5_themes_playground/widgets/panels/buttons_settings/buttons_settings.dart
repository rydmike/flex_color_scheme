import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/const/app.dart';
import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../shared/color_scheme_popup_menu.dart';

// Settings for the standard Material buttons.
class ButtonsSettings extends StatelessWidget {
  const ButtonsSettings(
    this.controller, {
    super.key,
  });
  final ThemeController controller;

  static final Uri _fcsFlutterIssue118063 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/issues/118063',
  );

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;
    final TextStyle spanTextStyle = theme.textTheme.bodySmall!;
    final TextStyle linkStyle = theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primary, fontWeight: FontWeight.bold);

    // Get effective platform default global radius.
    final double? effectiveRadius = App.effectiveRadius(controller);
    final String elevatedButtonRadiusDefaultLabel =
        controller.elevatedButtonBorderRadius == null && effectiveRadius == null
            ? controller.useMaterial3
                ? 'default stadium'
                : 'default 40'
            : controller.elevatedButtonBorderRadius == null &&
                    effectiveRadius != null
                ? 'global ${effectiveRadius.toStringAsFixed(0)}'
                : '';
    final String outlinedButtonRadiusDefaultLabel =
        controller.outlinedButtonBorderRadius == null && effectiveRadius == null
            ? controller.useMaterial3
                ? 'default stadium'
                : 'default 40'
            : controller.outlinedButtonBorderRadius == null &&
                    effectiveRadius != null
                ? 'global ${effectiveRadius.toStringAsFixed(0)}'
                : '';
    final String textButtonRadiusDefaultLabel =
        controller.textButtonBorderRadius == null && effectiveRadius == null
            ? controller.useMaterial3
                ? 'default stadium'
                : 'default 40'
            : controller.textButtonBorderRadius == null &&
                    effectiveRadius != null
                ? 'global ${effectiveRadius.toStringAsFixed(0)}'
                : '';
    final String filledButtonRadiusDefaultLabel =
        controller.filledButtonBorderRadius == null && effectiveRadius == null
            ? controller.useMaterial3
                ? 'default stadium'
                : 'default 40'
            : controller.filledButtonBorderRadius == null &&
                    effectiveRadius != null
                ? 'global ${effectiveRadius.toStringAsFixed(0)}'
                : '';
    final String thinBorderDefaultLabel =
        controller.outlinedButtonBorderWidth == null &&
                controller.thinBorderWidth == null
            ? 'default 1'
            : controller.outlinedButtonBorderWidth == null &&
                    controller.thinBorderWidth != null
                ? 'global ${controller.thinBorderWidth!.toStringAsFixed(1)}'
                : '';
    final String thickBorderDefaultLabel =
        controller.outlinedButtonPressedBorderWidth == null &&
                controller.thickBorderWidth == null
            ? useMaterial3
                ? 'default 1'
                : 'default 2'
            : controller.outlinedButtonPressedBorderWidth == null &&
                    controller.thickBorderWidth != null
                ? 'global ${controller.thickBorderWidth!.toStringAsFixed(1)}'
                : '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        ColorSchemePopupMenu(
          title: const Text('ElevatedButton main color'),
          subtitle: controller.useMaterial3
              ? const Text('Foreground color')
              : const Text('Background color'),
          index: controller.elevatedButtonSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setElevatedButtonSchemeColor(null);
                  } else {
                    controller.setElevatedButtonSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ElevatedButtonShowcase(),
        ),
        ColorSchemePopupMenu(
          title: const Text('ElevatedButton secondary color'),
          subtitle: controller.useMaterial3
              ? const Text('Background color')
              : const Text('Foreground color'),
          labelForDefault: controller.useMaterial3
              ? 'default (surface)'
              : 'default (onPrimary)',
          index: controller.elevatedButtonSecondarySchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setElevatedButtonSecondarySchemeColor(null);
                  } else {
                    controller.setElevatedButtonSecondarySchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('ElevatedButton border radius'),
          subtitle: Slider(
            min: -1,
            max: 40,
            divisions: 41,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.elevatedButtonBorderRadius == null ||
                        (controller.elevatedButtonBorderRadius ?? -1) < 0
                    ? elevatedButtonRadiusDefaultLabel
                    : (controller.elevatedButtonBorderRadius
                            ?.toStringAsFixed(0) ??
                        '')
                : controller.useMaterial3
                    ? 'default stadium'
                    : 'default 4',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.elevatedButtonBorderRadius ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setElevatedButtonBorderRadius(
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
                      ? controller.elevatedButtonBorderRadius == null ||
                              (controller.elevatedButtonBorderRadius ?? -1) < 0
                          ? elevatedButtonRadiusDefaultLabel
                          : (controller.elevatedButtonBorderRadius
                                  ?.toStringAsFixed(0) ??
                              '')
                      : controller.useMaterial3
                          ? 'default stadium'
                          : 'default 4',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const Divider(),
        ColorSchemePopupMenu(
          labelForDefault: 'default (primary or secondaryContainer)',
          title: const Text('FilledButton color'),
          index: controller.filledButtonSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setFilledButtonSchemeColor(null);
                  } else {
                    controller
                        .setFilledButtonSchemeColor(SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: FilledButtonShowcase(),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: FilledButtonTonalShowcase(),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('FilledButton border radius'),
          subtitle: Slider(
            min: -1,
            max: 40,
            divisions: 41,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.filledButtonBorderRadius == null ||
                        (controller.filledButtonBorderRadius ?? -1) < 0
                    ? filledButtonRadiusDefaultLabel
                    : (controller.filledButtonBorderRadius
                            ?.toStringAsFixed(0) ??
                        '')
                : 'default stadium',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.filledButtonBorderRadius ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setFilledButtonBorderRadius(
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
                      ? controller.filledButtonBorderRadius == null ||
                              (controller.filledButtonBorderRadius ?? -1) < 0
                          ? filledButtonRadiusDefaultLabel
                          : (controller.filledButtonBorderRadius
                                  ?.toStringAsFixed(0) ??
                              '')
                      : 'default stadium',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
        ListTileReveal(
          dense: true,
          title: const Text('Known issues and limitations'),
          subtitle: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'Current Flutter SDK FilledButton theming has a '
                      'limitation where the FilledButton.tonal variant cannot '
                      'be themed differently from FilledButton. See '
                      'Flutter SDK ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsFlutterIssue118063,
                  text: 'issue #118063',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: '. Due to this issue, if you change theme color, the '
                      'FilledButton and FilledButton.tonal will get the same '
                      'color. For same reason the tinted disable colors are '
                      'NOT set unless its main color is changed. If disabled '
                      'colors would be set, the different colors of the '
                      'buttons will also be lost. Separate colors and border '
                      'radius for the two variants will be offered when the '
                      'current limitation is removed. Go upvote the issue '
                      'by giving it thumbs-up!\n',
                ),
              ],
            ),
          ),
        ),
        const Divider(),
        // TODO(rydmike): To be uses when FilledButton tonal has own theme.
        // ColorSchemePopupMenu(
        //   title: const Text('FilledButton.tonal color'),
        //   index: controller.filledButtonSchemeColor?.index ?? -1,
        //   onChanged: controller.useSubThemes && controller.useFlexColorScheme
        //       ? (int index) {
        //           if (index < 0 || index >= SchemeColor.values.length) {
        //             controller.setFilledButtonSchemeColor(null);
        //           } else {
        //             controller
        //              .setFilledButtonSchemeColor(SchemeColor.values[index]);
        //           }
        //         }
        //       : null,
        // ),
        // ListTile(
        //   enabled: controller.useSubThemes && controller.useFlexColorScheme,
        //   title: const Text('FilledButton.tonal border radius'),
        //   subtitle: Slider(
        //     min: -1,
        //     max: 40,
        //     divisions: 41,
        //     label: controller.useSubThemes && controller.useFlexColorScheme
        //         ? controller.filledButtonBorderRadius == null ||
        //                 (controller.filledButtonBorderRadius ?? -1) < 0
        //             ? filledButtonRadiusDefaultLabel
        //             : (controller.filledButtonBorderRadius
        //                     ?.toStringAsFixed(0) ??
        //                 '')
        //         : controller.useMaterial3
        //             ? 'default stadium'
        //             : 'default 4',
        //     value: controller.useSubThemes && controller.useFlexColorScheme
        //         ? controller.filledButtonBorderRadius ?? -1
        //         : -1,
        //   onChanged: controller.useSubThemes && controller.useFlexColorScheme
        //         ? (double value) {
        //             controller.setFilledButtonBorderRadius(
        //                 value < 0 ? null : value.roundToDouble());
        //           }
        //         : null,
        //   ),
        //   trailing: Padding(
        //     padding: const EdgeInsetsDirectional.only(end: 5),
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       children: <Widget>[
        //         Text(
        //           'RADIUS',
        //           style: theme.textTheme.bodySmall,
        //         ),
        //         Text(
        //           controller.useSubThemes && controller.useFlexColorScheme
        //               ? controller.filledButtonBorderRadius == null ||
        //                       (controller.filledButtonBorderRadius ?? -1) < 0
        //                   ? filledButtonRadiusDefaultLabel
        //                   : (controller.filledButtonBorderRadius
        //                           ?.toStringAsFixed(0) ??
        //                       '')
        //               : controller.useMaterial3
        //                   ? 'default stadium'
        //                   : 'default 4',
        //           style: theme.textTheme.bodySmall!
        //               .copyWith(fontWeight: FontWeight.bold),
        //         ),
        //         const SizedBox(height: 8),
        //       ],
        //     ),
        //   ),
        // ),
        // const Divider(),
        ColorSchemePopupMenu(
          title: const Text('OutlinedButton foreground color'),
          index: controller.outlinedButtonSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setOutlinedButtonSchemeColor(null);
                  } else {
                    controller.setOutlinedButtonSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: OutlinedButtonShowcase(),
        ),
        ColorSchemePopupMenu(
          title: const Text('OutlinedButton outline color'),
          labelForDefault: controller.useMaterial3
              ? 'default (outline)'
              : controller.useSubThemes && controller.useFlexColorScheme
                  ? 'default (primary)'
                  : 'default (onSurface opacity 0.12)',
          index: controller.outlinedButtonOutlineSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setOutlinedButtonOutlineSchemeColor(null);
                  } else {
                    controller.setOutlinedButtonOutlineSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('OutlinedButton border radius'),
          subtitle: Slider(
            min: -1,
            max: 40,
            divisions: 41,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.outlinedButtonBorderRadius == null ||
                        (controller.outlinedButtonBorderRadius ?? -1) < 0
                    ? outlinedButtonRadiusDefaultLabel
                    : (controller.outlinedButtonBorderRadius
                            ?.toStringAsFixed(0) ??
                        '')
                : controller.useMaterial3
                    ? 'default stadium'
                    : 'default 4',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.outlinedButtonBorderRadius ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setOutlinedButtonBorderRadius(
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
                      ? controller.outlinedButtonBorderRadius == null ||
                              (controller.outlinedButtonBorderRadius ?? -1) < 0
                          ? outlinedButtonRadiusDefaultLabel
                          : (controller.outlinedButtonBorderRadius
                                  ?.toStringAsFixed(0) ??
                              '')
                      : controller.useMaterial3
                          ? 'default stadium'
                          : 'default 4',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ListTile(
          title: const Text('Border width'),
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          subtitle: Slider(
            min: 0,
            max: 5,
            divisions: 10,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.outlinedButtonBorderWidth == null ||
                        (controller.outlinedButtonBorderWidth ?? 0) <= 0
                    ? thinBorderDefaultLabel
                    : (controller.outlinedButtonBorderWidth
                            ?.toStringAsFixed(1) ??
                        '')
                : 'default 1',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.outlinedButtonBorderWidth ?? 0
                : 0,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setOutlinedButtonBorderWidth(
                        value <= 0 ? null : value);
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'WIDTH',
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.outlinedButtonBorderWidth == null ||
                              (controller.outlinedButtonBorderWidth ?? 0) < 0
                          ? thinBorderDefaultLabel
                          : (controller.outlinedButtonBorderWidth
                                  ?.toStringAsFixed(1) ??
                              '')
                      : 'default 1',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Pressed border width'),
          subtitle: Slider(
            min: 0,
            max: 5,
            divisions: 10,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.outlinedButtonPressedBorderWidth == null ||
                        (controller.outlinedButtonPressedBorderWidth ?? 0) <= 0
                    ? thickBorderDefaultLabel
                    : (controller.outlinedButtonPressedBorderWidth
                            ?.toStringAsFixed(1) ??
                        '')
                : 'default 2',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.outlinedButtonPressedBorderWidth ?? 0
                : 0,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setOutlinedButtonPressedBorderWidth(
                        value <= 0 ? null : value);
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'WIDTH',
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.outlinedButtonPressedBorderWidth == null ||
                              (controller.outlinedButtonPressedBorderWidth ??
                                      0) <=
                                  0
                          ? thickBorderDefaultLabel
                          : (controller.outlinedButtonPressedBorderWidth
                                  ?.toStringAsFixed(1) ??
                              '')
                      : 'default 2',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const Divider(),

        ColorSchemePopupMenu(
          title: const Text('TextButton color'),
          index: controller.textButtonSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setTextButtonSchemeColor(null);
                  } else {
                    controller
                        .setTextButtonSchemeColor(SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: TextButtonShowcase(),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('TextButton border radius'),
          subtitle: Slider(
            min: -1,
            max: 40,
            divisions: 41,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.textButtonBorderRadius == null ||
                        (controller.textButtonBorderRadius ?? -1) < 0
                    ? textButtonRadiusDefaultLabel
                    : (controller.textButtonBorderRadius?.toStringAsFixed(0) ??
                        '')
                : controller.useMaterial3
                    ? 'default stadium'
                    : 'default 4',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.textButtonBorderRadius ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setTextButtonBorderRadius(
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
                      ? controller.textButtonBorderRadius == null ||
                              (controller.textButtonBorderRadius ?? -1) < 0
                          ? textButtonRadiusDefaultLabel
                          : (controller.textButtonBorderRadius
                                  ?.toStringAsFixed(0) ??
                              '')
                      : controller.useMaterial3
                          ? 'default stadium'
                          : 'default 4',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
