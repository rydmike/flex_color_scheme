import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/model/adaptive_theme.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../../../shared/widgets/universal/slider_list_tile_reveal.dart';
import '../../../../shared/widgets/universal/switch_list_tile_reveal.dart';
import '../../shared/back_to_actual_platform.dart';
import '../../shared/color_scheme_popup_menu.dart';
import '../../shared/enum_popup_menu.dart';
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

  static final Uri _fcsFlutterPull128950 = Uri(
      scheme: 'https',
      host: 'github.com',
      path: 'flutter/flutter/pull/128950',
      fragment: 'issuecomment-1657177393');

  static final Uri _fcsFlutterIssue131666 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/issues/131666',
  );

  static final Uri _fcsFlutterIssue148849 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/issues/148849',
  );

  // Complex logic for the dialog radius label.
  static String _dialogRadiusLabel(ThemeController controller) {
    final bool useFCS =
        controller.useSubThemes && controller.useFlexColorScheme;
    if (!useFCS) {
      return controller.useMaterial3 ? '28' : '4';
    }
    final bool useGlobalRadius =
        (controller.adaptiveDialogRadius == AdaptiveTheme.off ||
                controller.adaptiveDialogRadius == null) &&
            controller.dialogBorderRadius == null;
    if (useGlobalRadius) {
      return controller.defaultRadius != null
          ? 'global ${controller.defaultRadius!.toStringAsFixed(0)}'
          : (controller.useMaterial3 ? '28' : '4');
    } else {
      return controller.dialogBorderRadius != null
          ? controller.dialogBorderRadius!.toStringAsFixed(0)
          : (controller.useMaterial3 ? '28' : '4');
    }
  }

  // Complex logic for the adaptive dialog radius label.
  static String? _adaptiveDialogModeLabel(ThemeController controller) {
    if (!controller.useSubThemes && !controller.useFlexColorScheme) return null;
    final bool useAdaptiveRadius =
        controller.adaptiveRadius != AdaptiveTheme.off &&
            controller.adaptiveRadius != null &&
            controller.dialogBorderRadius == null;
    if (useAdaptiveRadius) {
      return 'Global (${controller.adaptiveRadius?.label ?? ''})';
    }
    return null;
  }

  // Complex logic for the adaptive dialog radius label.
  static String _adaptiveDialogRadiusLabel(ThemeController controller) {
    final bool useFCS =
        controller.useSubThemes && controller.useFlexColorScheme;
    if (!useFCS) {
      return controller.useMaterial3 ? '28' : '4';
    }
    final bool useAdaptiveDialogRadius =
        controller.adaptiveDialogRadius != AdaptiveTheme.off &&
            controller.adaptiveDialogRadius != null;
    if (useAdaptiveDialogRadius) {
      return controller.dialogBorderRadiusAdaptive != null
          ? controller.dialogBorderRadiusAdaptive!.toStringAsFixed(0)
          : (controller.useMaterial3 ? '28' : '4');
    }
    final bool useAdaptiveRadius =
        controller.adaptiveRadius != AdaptiveTheme.off &&
            controller.adaptiveRadius != null &&
            controller.dialogBorderRadius == null;
    if (useAdaptiveRadius) {
      return controller.defaultRadiusAdaptive != null
          ? 'global ${controller.defaultRadiusAdaptive!.toStringAsFixed(0)}'
          : (controller.useMaterial3 ? '28' : '4');
    }
    return 'OFF';
  }

  // Complex logic to display the effective radius label on time picker
  // and date picker dialogs.
  static String _effectiveDateTimeRadiusLabel(
      ThemeController controller, double? radius) {
    final bool useFCS =
        controller.useSubThemes && controller.useFlexColorScheme;
    if (!useFCS) {
      return controller.useMaterial3 ? '28' : '4';
    }

    // Use defaultRadiusAdaptive instead of defaultRadius?
    final FlexAdaptive adaptiveRadius =
        controller.adaptiveRadius?.setting(controller.fakeIsWeb) ??
            const FlexAdaptive.off();
    // Get the correct platform default radius.
    final double? platformRadius = adaptiveRadius.adapt(controller.platform)
        ? controller.defaultRadiusAdaptive
        : controller.defaultRadius;

    // Use adaptive dialog radius?
    final FlexAdaptive adaptiveDialogRadius =
        controller.adaptiveDialogRadius?.setting(controller.fakeIsWeb) ??
            const FlexAdaptive.off();
    // Get the effective used adaptive dialog default radius.
    final double? platformDialogRadius =
        adaptiveDialogRadius == const FlexAdaptive.off() &&
                controller.dialogBorderRadius == null
            ? null
            : adaptiveDialogRadius.adapt(controller.platform)
                ? controller.dialogBorderRadiusAdaptive ?? 28
                : controller.dialogBorderRadius ?? 28;

    final double? effectiveRadius = platformDialogRadius ?? platformRadius;

    final bool useDefinedRadius = radius != null;
    if (useDefinedRadius) {
      return radius.toStringAsFixed(0);
    } else {
      if (effectiveRadius != null) {
        return 'dialog ${effectiveRadius.toStringAsFixed(0)}';
      }
    }
    return controller.useMaterial3 ? '28' : '4';
  }

  // Logic to get the effective default Dialog color label.
  static String _dialogBackgroundDefault(
    ThemeController controller,
    bool isLight,
  ) {
    if (!controller.useFlexColorScheme) {
      if (controller.useMaterial3) {
        // TODO(rydmike): Flutter 3.22...3.24 bug, Dialog gets
        // theme.dialogBackgroundColor (which is surface in M3) instead of
        // surfaceContainerHigh, but Date and Time picker use correct default.
        // This is fixed in master, not yet landed in stable.
        // Issue: https://github.com/flutter/flutter/issues/148849
        return 'default (surfaceContainerHigh)';
      } else {
        return isLight
            ? 'default (Alert & Date: white, Time: surface)'
            : 'default (Alert & Date: grey800, Time: surface)';
      }
    } else {
      if (controller.useMaterial3) {
        return 'default (surfaceContainerHigh)';
      } else {
        return isLight
            ? 'default (surface)'
            : 'default (surface + elevation overlay)';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;
    final bool isLight = theme.brightness == Brightness.light;
    final TextStyle spanTextStyle = theme.textTheme.bodySmall!;
    final TextStyle linkStyle = theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primary, fontWeight: FontWeight.bold);

    // The most common logic for enabling Playground controls.
    final bool enableControl =
        controller.useSubThemes && controller.useFlexColorScheme;

    final String datePickerHeaderBackgroundDefault = controller
                .dialogBackgroundLightSchemeColor ==
            null
        ? useMaterial3
            ? 'default (surfaceContainerHigh)'
            : 'default (primary)'
        : useMaterial3
            // ignore: lines_longer_than_80_chars
            ? 'default (${SchemeColor.values[controller.dialogBackgroundLightSchemeColor!.index].name})'
            : 'default (primary)';

    return Column(
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTileReveal(
          title: Text('Dialog and AlertDialog'),
          subtitleReveal: Text('In Flutter Material-2 the default dialog '
              'background color is surface for all Dialogs. In Material-3 mode '
              'they default to surfaceContainerHigh. FCS 8.0 and '
              'later uses surfaceContainerHigh in both modes.'
              '\n'
              'You can theme dialogs to a different color scheme color. '
              'It is recommended to stick to one of the surface colors.\n'
              '\n'
              'The AlertDialog uses the general DialogTheme for theming '
              'values. TimePicker and DatePicker have their own themes. In '
              'the Themes Playground they share the same setting for the '
              'background color, but you can change them individually in '
              'the produced code.\n'),
        ),
        const AlertDialogShowcase(),
        SliderListTileReveal(
          enabled: enableControl,
          title: const Text('Radius'),
          subtitleReveal: const Text(
            'This border radius adjusts radius for general Dialogs and thus '
            'also AlertDialog. By default in FlexColorScheme the border radius '
            'on the TimePickerDialog and DatePickerDialog also defaults to '
            'this radius if not defined separately.\n'
            '\n'
            'The Flutter default border radius in M2 mode is 4dp and M3 mode '
            'it is 28dp. FlexColorScheme defaults to 28dp in both M2 and M3 '
            'when using its component themes. If you think it is too round, '
            'try e.g. 16dp.\n'
            '\n'
            'If you use adaptive radius on the global default radius, and keep '
            'this dialog radius at default value and the dialog adaptive '
            'radius OFF, the Dialogs gets the effective value of the global '
            'radius value and any used adaptive response. '
            'The dialog radius settings and its platform adaptive response '
            'will override any global setting when activated.\n',
          ),
          value: controller.dialogBorderRadius,
          onChanged: controller.setDialogBorderRadius,
          min: 0,
          max: 50,
          divisions: 50,
          valueDecimalPlaces: 0,
          valueHeading: 'RADIUS',
          valueUnitLabel: ' dp',
          valueDefaultLabel: _dialogRadiusLabel(controller),
          valueDefaultDisabledLabel: useMaterial3 ? '28' : '4',
        ),
        EnumPopupMenu<AdaptiveTheme>(
          enabled: enableControl && controller.useMaterial3,
          values: AdaptiveTheme.values,
          title: const Text('Use adaptive radius'),
          subtitleReveal: Text(
            'Use an alternative dialog border radius on '
            'selected platforms.\n'
            '\n'
            // ignore: lines_longer_than_80_chars
            '${controller.adaptiveDialogRadius?.describe ?? AdaptiveTheme.off.describe}',
          ),
          defaultLabel: _adaptiveDialogModeLabel(controller),
          value: controller.adaptiveDialogRadius,
          onChanged: controller.setAdaptiveDialogRadius,
        ),
        SliderListTileReveal(
          enabled: enableControl &&
              controller.adaptiveDialogRadius != AdaptiveTheme.off &&
              controller.adaptiveDialogRadius != null,
          title: const Text('Adaptive radius'),
          subtitleReveal: const Text(
            'You can define a separate Dialog border radius that gets used '
            'adaptively on selected platforms. This is useful if you '
            'for example want to keep M3 design Dialog radius on the Android '
            'platform, but want a less rounded design on other platforms.\n'
            '\n'
            'With the API you can define which platforms an adaptive '
            'feature is used on, including separate definitions when '
            'using the app in a web build on each platform. Presented options '
            'are using built-in preconfigured constructors, they '
            'cover typical use cases.\n'
            '\n'
            'The default border radius in M2 mode is 4dp and M3 mode it is '
            '28dp. FCS defaults to 28dp in both M2 and M3 when using component '
            'themes. If you think it is too round, try e.g. 16dp.\n',
          ),
          value: enableControl &&
                  controller.adaptiveDialogRadius != AdaptiveTheme.off &&
                  controller.adaptiveDialogRadius != null
              ? controller.dialogBorderRadiusAdaptive
              : null,
          onChanged: controller.setDialogBorderRadiusAdaptive,
          min: 0,
          max: 50,
          divisions: 50,
          valueDecimalPlaces: 0,
          valueHeading: 'RADIUS',
          valueUnitLabel: ' dp',
          valueDefaultLabel: _adaptiveDialogRadiusLabel(controller),
        ),
        PlatformPopupMenu(
          platform: controller.platform,
          onChanged: controller.setPlatform,
        ),
        IsWebListTile(controller: controller),
        BackToActualPlatform(controller: controller),
        const Divider(),
        if (isLight)
          ColorSchemePopupMenu(
            title: const Text('Background color light mode'),
            defaultLabel: _dialogBackgroundDefault(controller, isLight),
            value: controller.dialogBackgroundLightSchemeColor?.index ?? -1,
            onChanged: enableControl
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setDialogBackgroundLightSchemeColor(null);
                    } else {
                      controller.setDialogBackgroundLightSchemeColor(
                          SchemeColor.values[index]);
                    }
                  }
                : null,
          )
        else
          ColorSchemePopupMenu(
            title: const Text('Background color dark mode'),
            defaultLabel: _dialogBackgroundDefault(controller, isLight),
            value: controller.dialogBackgroundDarkSchemeColor?.index ?? -1,
            onChanged: enableControl
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setDialogBackgroundDarkSchemeColor(null);
                    } else {
                      controller.setDialogBackgroundDarkSchemeColor(
                          SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
        ListTileReveal(
          dense: true,
          title: const Text('Known issues'),
          subtitleReveal: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'In Flutter 3.22 to 3.24 in M3 mode, the Dialog and '
                      'thus AlertDialog gets Theme.dialogBackgroundColor, '
                      'which is equal to surface color and not '
                      'surfaceContainerHigh. TimePicker and DatePicker get '
                      'the correct default surfaceContainerHigh. '
                      'For more info see ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsFlutterIssue148849,
                  text: 'issue #148849',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: '. This is is fixed in the master channel, '
                      'but has not landed in current stable (3.24.x).\n',
                ),
              ],
            ),
          ),
        ),
        SliderListTileReveal(
          enabled: enableControl,
          title: const Text('Elevation'),
          subtitleReveal: const Text(
            'The elevation adjusts elevation for default dialog and thus '
            'also AlertDialog. It also sets elevation for the '
            'TimePickerDialog and DatePickerDialog to the same value.\n',
          ),
          value: controller.dialogElevation,
          onChanged: controller.setDialogElevation,
          min: 0,
          max: 30,
          divisions: 30,
          valueHeading: 'ELEV',
          valueDecimalPlaces: 0,
          valueDefaultLabel: '6',
          valueDefaultDisabledLabel: useMaterial3 ? '6' : '24',
        ),
        const Divider(),
        const ListTileReveal(
          title: Text('TimePicker'),
          subtitleReveal: Text('Flutter 3.7 did not support '
              'Material-3 styling of the TimePicker. FlexColorScheme added '
              'Material-3 styling based on M3 specification already in '
              'Flutter 3.7 where it was supported by its theming capabilities. '
              'In Flutter 3.10 and later, TimePicker theming is fully '
              'supported. In Flutter 3.10 the theming had some issues, '
              'see known issues further below.\n'),
        ),
        const TimePickerDialogShowcase(),
        SliderListTileReveal(
          enabled: enableControl,
          title: const Text('Radius'),
          subtitleReveal: const Text(
            'TimePicker radius defaults to the general dialog radius in '
            'FlexColorScheme, including its platform adaptive radius settings '
            'defined above or in general border radius. '
            'This is a themed override radius for the TimePicker dialog '
            'that is applied on all platforms.\n',
          ),
          value: controller.timePickerDialogBorderRadius,
          onChanged: controller.setTimePickerDialogBorderRadius,
          min: 0,
          max: 50,
          divisions: 50,
          valueDecimalPlaces: 0,
          valueHeading: 'RADIUS',
          valueUnitLabel: ' dp',
          valueDefaultLabel: _effectiveDateTimeRadiusLabel(
            controller,
            controller.timePickerDialogBorderRadius,
          ),
        ),
        SliderListTileReveal(
          enabled: enableControl,
          title: const Text("Time input elements' border radius"),
          subtitleReveal: const Text(
            'Time input elements do not use the global '
            'radius override setting. '
            'Avoid large border radius on the time input elements.\n',
          ),
          value: controller.timePickerElementRadius,
          onChanged: controller.setTimePickerElementRadius,
          min: 0,
          max: 50,
          divisions: 50,
          valueDecimalPlaces: 0,
          valueHeading: 'RADIUS',
          valueUnitLabel: ' dp',
          valueDefaultLabel: '8',
          valueDefaultDisabledLabel: useMaterial3 ? '8' : '4',
        ),
        ListTileReveal(
          dense: true,
          title: const Text('Known issues'),
          subtitleReveal: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'In Flutter 3.13 and earlier the clock dial background '
                      'used the wrong default background color in Material-3 '
                      'mode. For more info see ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsFlutterFix118657,
                  text: 'issue #118657',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: '. In Flutter 3.16 and later the issue has been fixed. '
                      'FlexColorScheme includes a correction for the issue in '
                      'its default TimePicker theme for earlier Flutter '
                      'versions.\n',
                ),
              ],
            ),
          ),
        ),
        const Divider(height: 0),
        SwitchListTileReveal(
          enabled: enableControl,
          title: const Text("Use TextField's InputDecorationTheme in Pickers "),
          subtitleReveal: const Text(
            'Turn ON to use the FlexColorScheme themed TextField '
            'InputDecoration style on time and date text entry fields in '
            'TimePicker and DatePicker dialogs.\n'
            '\n'
            'Turn OFF to use default M3 styles on text input fields '
            'in TimePicker and DatePicker dialogs.\n'
            '\n'
            'NOTE:\n'
            'While this feature is supported by DatePicker in Flutter 3.13 and '
            'later, the support is flawed. See known issues further below.\n',
          ),
          value: enableControl && controller.useInputDecoratorThemeInDialogs,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? controller.setUseInputDecoratorThemeInDialogs
              : null,
        ),
        const Divider(height: 0),
        const ListTileReveal(
          title: Text('DatePicker'),
          subtitleReveal:
              Text('Flutter 3.7 does not support any Material-3 styling '
                  'of the DatePicker, there is not even a theme for DatePicker '
                  'in Flutter 3.7. Flutter 3.10 added theming and Material-3 '
                  'support to the DatePicker.\n'),
        ),
        const DatePickerDialogShowcase(),
        SliderListTileReveal(
          enabled: enableControl,
          title: const Text('Border radius'),
          subtitleReveal: const Text(
            'DatePicker radius defaults to the general dialog radius in '
            'FlexColorScheme, including its platform adaptive radius settings '
            'defined above or in general border radius. '
            'This is a themed override radius for the DatePicker dialog '
            'that is applied on all platforms.\n',
          ),
          value: controller.datePickerDialogBorderRadius,
          onChanged: controller.setDatePickerDialogBorderRadius,
          min: 0,
          max: 50,
          divisions: 50,
          valueDecimalPlaces: 0,
          valueHeading: 'RADIUS',
          valueUnitLabel: ' dp',
          valueDefaultLabel: _effectiveDateTimeRadiusLabel(
            controller,
            controller.timePickerDialogBorderRadius,
          ),
        ),
        ColorSchemePopupMenu(
          title: const Text('Header background color'),
          defaultLabel: datePickerHeaderBackgroundDefault,
          value: controller.datePickerHeaderBackgroundSchemeColor?.index ?? -1,
          onChanged: enableControl
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
        ColorSchemePopupMenu(
          title: const Text('Divider color'),
          defaultLabel:
              useMaterial3 ? 'outlineVariant' : 'No Divider in build in M2',
          value: controller.datePickerDividerSchemeColor?.index ?? -1,
          onChanged: enableControl && useMaterial3
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setDatePickerDividerSchemeColor(null);
                  } else {
                    controller.setDatePickerDividerSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ListTileReveal(
          dense: true,
          title: const Text('Known issues'),
          subtitleReveal: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'In Flutter 3.10 in Material-3 mode, the DatePicker '
                      'Divider is hard coded and cannot be removed, it looks '
                      'poor when you use any other header color than the '
                      'default surface color. For more info see ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsFlutterIssue126597,
                  text: 'issue #126597',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: '. Both the Divider spacing and color styling have '
                      'been fixed in Flutter 3.13 and later.\n'
                      '\n'
                      'The DatePicker manual date entry input field always '
                      'picks up the ambient InputDecorationTheme and it '
                      'cannot be styled independently, see ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsFlutterIssue126617,
                  text: 'issue #126617',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: '. This issue has a feature in Flutter 3.13 to enable '
                      'using another decorator, but the solution is partially '
                      'flawed, see ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsFlutterPull128950,
                  text: 'PR comment #128950',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: '. This topic is further discussed in ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsFlutterIssue131666,
                  text: 'issue #126617',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: '.\n The DatePicker should adopt the working prior '
                      'art solution used by the TimePicker.',
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
