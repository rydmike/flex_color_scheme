import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/const/app.dart';
import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/model/adaptive_theme.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../../../shared/widgets/universal/switch_list_tile_reveal.dart';
import '../../shared/adaptive_theme_popup_menu.dart';
import '../../shared/back_to_actual_platform.dart';
import '../../shared/color_scheme_popup_menu.dart';
import '../../shared/is_web_list_tile.dart';
import '../../shared/platform_popup_menu.dart';

class DialogSettings extends StatelessWidget {
  const DialogSettings(this.controller, {super.key});
  final ThemeController controller;

  static final Uri _fcsFlutterFix118657 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/pull/118657',
  );

  static final Uri _fcsFlutterIssue126597 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/issues/126597',
  );

  static final Uri _fcsFlutterIssue126617 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/issues/126617',
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
    final String dialogRadiusDefaultLabel =
        controller.dialogBorderRadius == null && effectiveRadius == null
            ? 'default 28'
            : controller.dialogBorderRadius == null && effectiveRadius != null
                ? 'global ${effectiveRadius.toStringAsFixed(0)}'
                : '';

    final String dialogAdaptiveRadiusDefaultLabel =
        controller.dialogBorderRadiusAdaptive == null &&
                effectiveRadius == null &&
                controller.adaptiveDialogRadius != AdaptiveTheme.off &&
                controller.adaptiveDialogRadius != null
            ? 'default 28'
            : controller.dialogBorderRadiusAdaptive == null &&
                    effectiveRadius != null
                ? 'global ${effectiveRadius.toStringAsFixed(0)}'
                : '';

    return Column(
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTileReveal(
          title: Text('Dialog'),
          subtitle: Text('In Flutter M2 the default dialog background '
              'color is colorScheme.background for Dialog and '
              'DatePickerDialog, but colorScheme.surface for '
              'TimePickerDialog. In M3 mode they all default to '
              'colorScheme.surface.\n'
              '\n'
              'FlexColorScheme sub-themes use surface as default for all '
              'dialogs in both M2 and M3 mode. This ensures that they have the '
              'same background by default and that elevation overlay '
              'color works in M2 dark mode when it is another '
              'color than background.\n'
              '\n'
              'You can theme dialogs to a color scheme based color. With '
              'seeded M3 colors, surfaceVariant, primaryContainer and '
              'inversePrimary are possible options.\n'
              '\n'
              'The AlertDialog uses the general DialogTheme for theming '
              'values. TimePicker and DatePicker have their own themes.\n'),
        ),
        const AlertDialogShowcase(),
        const SizedBox(height: 8),
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
        ListTileReveal(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Elevation'),
          subtitleDense: true,
          subtitle: const Text(
            'The elevation adjusts elevation for default dialog and thus '
            'also AlertDialog. It also sets elevation for the the '
            'TimePickerDialog and DatePickerDialog to same value.\n',
          ),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: Slider(
            min: -1,
            max: 30,
            divisions: 31,
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
        ListTileReveal(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Dialog border radius'),
          subtitleDense: true,
          subtitle: const Text(
            'This border radius adjusts radius for general Dialogs and thus '
            'also AlertDialog. By default in FlexColorScheme the border radius '
            'on the TimePickerDialog and DatePickerDialog also defaults to '
            'this radius if not defined separately.\n'
            '\n'
            'The Flutter default border radius in M2 mode is 4dp and M3 mode '
            'it is 28dp. FlexColorScheme defaults to 28dp in both M2 and M3 '
            'when using its component themes. If you think it is too round, '
            'try e.g. 16dp.\n',
          ),
        ),
        ListTileReveal(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          subtitleDense: true,
          title: Slider(
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
                      ? controller.dialogBorderRadius == null ||
                              (controller.dialogBorderRadius ?? -1) < 0
                          ? dialogRadiusDefaultLabel
                          : (controller.dialogBorderRadius
                                  ?.toStringAsFixed(0) ??
                              '')
                      : controller.useMaterial3
                          ? 'default 28'
                          : 'default 4',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        AdaptiveThemePopupMenu(
          title: const Text('Use platform adaptive dialog border radius'),
          subtitle: const Text('Use alternative dialog corner radius on '
              'selected platforms.\n'),
          index: controller.adaptiveDialogRadius?.index ?? -1,
          onChanged: controller.useFlexColorScheme && controller.useSubThemes
              ? (int index) {
                  if (index < 0 || index >= AdaptiveTheme.values.length) {
                    controller.setAdaptiveDialogRadius(null);
                  } else {
                    controller
                        .setAdaptiveDialogRadius(AdaptiveTheme.values[index]);
                  }
                }
              : null,
        ),
        ListTileReveal(
          enabled: controller.useSubThemes &&
              controller.useFlexColorScheme &&
              controller.adaptiveDialogRadius != AdaptiveTheme.off &&
              controller.adaptiveDialogRadius != null,
          title: const Text('Adaptive dialog border radius'),
          subtitleDense: true,
          subtitle: const Text(
            'You can define a separate Dialog border radius that gets used '
            'adaptively on selected platforms. This is useful if you '
            'for example want to keep M3 design Dialog radius on Android '
            'platform, but want a less rounded design on other platforms.\n'
            '\n'
            'With the API you can define which platform an adaptive '
            'feature is used on, including separate definitions when '
            'using the app in a web build on each platform. The above '
            'selections are using built-in preconfigured constructors, they '
            'probably cover most use cases. '
            '\n'
            'The default border radius in M2 mode is 4dp and M3 mode it is '
            '28dp. FCS defaults to 28dp in both M2 and M3 when using component '
            'themes. If you think it is too round, try e.g. 16dp.\n',
          ),
        ),
        ListTileReveal(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          subtitleDense: true,
          title: Slider(
            min: -1,
            max: 50,
            divisions: 51,
            label: controller.useSubThemes &&
                    controller.useFlexColorScheme &&
                    controller.adaptiveDialogRadius != AdaptiveTheme.off &&
                    controller.adaptiveDialogRadius != null
                ? controller.dialogBorderRadiusAdaptive == null ||
                        (controller.dialogBorderRadiusAdaptive ?? -1) < 0
                    ? dialogAdaptiveRadiusDefaultLabel
                    : (controller.dialogBorderRadiusAdaptive
                            ?.toStringAsFixed(0) ??
                        '')
                : controller.useMaterial3
                    ? 'default 28'
                    : 'default 4',
            value: controller.useSubThemes &&
                    controller.useFlexColorScheme &&
                    controller.adaptiveDialogRadius != AdaptiveTheme.off &&
                    controller.adaptiveDialogRadius != null
                ? controller.dialogBorderRadiusAdaptive ?? -1
                : -1,
            onChanged: controller.useSubThemes &&
                    controller.useFlexColorScheme &&
                    controller.adaptiveDialogRadius != AdaptiveTheme.off &&
                    controller.adaptiveDialogRadius != null
                ? (double value) {
                    controller.setDialogBorderRadiusAdaptive(
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
                  controller.useSubThemes &&
                          controller.useFlexColorScheme &&
                          controller.adaptiveDialogRadius !=
                              AdaptiveTheme.off &&
                          controller.adaptiveDialogRadius != null
                      ? controller.dialogBorderRadiusAdaptive == null ||
                              (controller.dialogBorderRadiusAdaptive ?? -1) < 0
                          ? dialogAdaptiveRadiusDefaultLabel
                          : (controller.dialogBorderRadiusAdaptive
                                  ?.toStringAsFixed(0) ??
                              '')
                      : controller.useMaterial3
                          ? 'default 28'
                          : 'default 4',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        PlatformPopupMenu(
          platform: controller.platform,
          onChanged: controller.setPlatform,
        ),
        IsWebListTile(controller: controller),
        BackToActualPlatform(controller: controller),
        const Divider(),
        const ListTileReveal(
          title: Text('TimePicker'),
          subtitleDense: true,
          subtitle: Text('Flutter 3.7 does not implement or fully support '
              'Material 3 styling of the TimePicker. FlexColorScheme adds '
              'M3 styling based on M3 specification already in Flutter 3.7 '
              'where it is supported by its theming capabilities. '
              'In Flutter 3.10 TimePicker theming is fully supported. The '
              '3.10 theming has some bugs, see known issues below.\n'),
        ),
        ListTileReveal(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Border radius'),
          subtitleDense: true,
          subtitle: const Text(
            'TimePicker radius defaults to the general dialog radius in '
            'FlexColorScheme, including its platform adaptive radius settings. '
            'This is a theme override radius for only the TimePicker dialog '
            'radius that is applied on all platforms, it also override the '
            'platform adaptive dialog radius value.\n',
          ),
        ),
        ListTileReveal(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          subtitleDense: true,
          title: Slider(
            min: -1,
            max: 50,
            divisions: 51,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.timePickerDialogBorderRadius == null ||
                        (controller.timePickerDialogBorderRadius ?? -1) < 0
                    ? dialogRadiusDefaultLabel
                    : (controller.timePickerDialogBorderRadius
                            ?.toStringAsFixed(0) ??
                        '')
                : controller.useMaterial3
                    ? 'default 28'
                    : 'default 4',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.timePickerDialogBorderRadius ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setTimePickerDialogBorderRadius(
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
                      ? controller.timePickerDialogBorderRadius == null ||
                              (controller.timePickerDialogBorderRadius ?? -1) <
                                  0
                          ? dialogRadiusDefaultLabel
                          : (controller.timePickerDialogBorderRadius
                                  ?.toStringAsFixed(0) ??
                              '')
                      : controller.useMaterial3
                          ? 'default 28'
                          : 'default 4',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ListTileReveal(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text("Time input elements' border radius"),
          subtitleDense: true,
          subtitle: const Text('Time input elements do not use the global '
              'radius override setting. '
              'Avoid large border radius on the time input elements.\n'),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: Slider(
            min: -1,
            max: 50,
            divisions: 51,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.timePickerElementRadius == null ||
                        (controller.timePickerElementRadius ?? -1) < 0
                    ? 'default 8'
                    : (controller.timePickerElementRadius?.toStringAsFixed(0) ??
                        '')
                : controller.useMaterial3
                    ? 'default 8'
                    : 'default 4',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.timePickerElementRadius ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setTimePickerElementRadius(
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
                      ? controller.timePickerElementRadius == null ||
                              (controller.timePickerElementRadius ?? -1) < 0
                          ? 'default 8'
                          : (controller.timePickerElementRadius
                                  ?.toStringAsFixed(0) ??
                              '')
                      : controller.useMaterial3
                          ? 'default 8'
                          : 'default 4',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        SwitchListTileReveal(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Use InputDecoration theme in dialog text entry'),
          subtitleDense: true,
          subtitle: const Text(
            'Turn ON to use the themed InputDecoration '
            'style on time entry fields.\n'
            '\n'
            'Keeping it OFF uses null as InputDecoration for '
            'TimePicker sub-theme in order to get widget default decorator '
            'style. Despite this, for some reason the app level themed '
            'InputDecoration background style still gets used. A potential '
            'Flutter SDK theming issue to revisit later.\n',
          ),
          value: controller.useInputDecoratorThemeInDialogs &&
              controller.useSubThemes &&
              controller.useFlexColorScheme,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? controller.setUseInputDecoratorThemeInDialogs
              : null,
        ),
        const TimePickerDialogShowcase(),
        ListTileReveal(
          dense: true,
          title: const Text('Known issues'),
          subtitle: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'In Flutter 3.10 the ClockDial background uses '
                      'wrong default background color in M3 mode. To see the '
                      'issue turn off FCS in M3 mode. For more info see ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsFlutterFix118657,
                  text: 'issue #118657',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: '. FCS includes a corrections for the issue in its '
                      'default TimePicker theme.\n',
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Divider(),
        const ListTileReveal(
          title: Text('DatePicker'),
          subtitleDense: true,
          subtitle: Text('Flutter 3.7 does not support any Material 3 styling '
              'of the DatePicker, there is not even a theme for DatePicker '
              'in Flutter 3.7. Flutter 3.10 adds theming and M3 support to '
              'the DatePicker.\n'),
        ),
        ListTileReveal(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Border radius'),
          subtitleDense: true,
          subtitle: const Text(
            'DatePicker radius defaults to the general dialog radius in '
            'FlexColorScheme, including its platform adaptive radius settings. '
            'This is a theme override radius for only the DatePicker dialog '
            'radius that is applied on all platforms. It also overrides the '
            'platform adaptive dialog radius value.\n',
          ),
        ),
        ListTileReveal(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          subtitleDense: true,
          title: Slider(
            min: -1,
            max: 50,
            divisions: 51,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.datePickerDialogBorderRadius == null ||
                        (controller.datePickerDialogBorderRadius ?? -1) < 0
                    ? dialogRadiusDefaultLabel
                    : (controller.datePickerDialogBorderRadius
                            ?.toStringAsFixed(0) ??
                        '')
                : controller.useMaterial3
                    ? 'default 28'
                    : 'default 4',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.datePickerDialogBorderRadius ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setDatePickerDialogBorderRadius(
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
                      ? controller.datePickerDialogBorderRadius == null ||
                              (controller.datePickerDialogBorderRadius ?? -1) <
                                  0
                          ? dialogRadiusDefaultLabel
                          : (controller.datePickerDialogBorderRadius
                                  ?.toStringAsFixed(0) ??
                              '')
                      : controller.useMaterial3
                          ? 'default 28'
                          : 'default 4',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ColorSchemePopupMenu(
          title: const Text('Header background color'),
          labelForDefault: controller.useMaterial3
              ? 'default (surface)'
              : 'default (primary)',
          index: controller.datePickerHeaderBackgroundSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setDatePickerHeaderBackgroundSchemeColor(null);
                  } else {
                    controller.setDatePickerHeaderBackgroundSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        const DatePickerDialogShowcase(),
        ListTileReveal(
          dense: true,
          title: const Text('Known issues'),
          subtitle: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'In Flutter 3.10 in M3 mode, the Divider is hard '
                      'coded and cannot be removed, it looks bad when you use '
                      'any other header color than the default surface color. '
                      'For more info see ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsFlutterIssue126597,
                  text: 'issue #126597',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: '. Both Divider spacing and color styling has been '
                      'fixed in master channel. The DatePicker manual date '
                      'entry input field picks '
                      'up the ambient InputDecorationTheme and it cannot be '
                      'styled independently, see ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsFlutterIssue126617,
                  text: 'issue #126617',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: '. This issue has a fix in master channel.\n',
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
