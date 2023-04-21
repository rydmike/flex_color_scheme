import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../../../shared/widgets/universal/switch_list_tile_reveal.dart';
import '../../shared/color_scheme_popup_menu.dart';

class TooltipIconButtonAvatarDropdownSettings extends StatelessWidget {
  const TooltipIconButtonAvatarDropdownSettings(this.controller, {super.key});
  final ThemeController controller;

  static final Uri _fcsM3IconButtonGuide = Uri(
    scheme: 'https',
    host: 'm3.material.io',
    path: 'components/icon-buttons/overview',
  );
  static final Uri _fcsFlutterIssue111800 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/issues/111800',
  );
  static final Uri _fcsFlutterIssue123829 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/pull/123829',
  );
  static final Uri _fcsFlutterIconButtonDoc = Uri(
    scheme: 'https',
    host: 'api.flutter.dev',
    path: 'flutter/material/IconButton-class.html',
  );

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final TextStyle spanTextStyle = theme.textTheme.bodySmall!;
    final TextStyle linkStyle = theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primary, fontWeight: FontWeight.bold);

    final String toolTipDefaultColorLabel = !controller.useFlexColorScheme
        ? isLight
            ? 'default (Grey700 op90%)'
            : 'default (White op90%)'
        : controller.tooltipsMatchBackground
            ? controller.useSubThemes
                ? isLight
                    ? 'default (Tinted White op95%)'
                    : 'default (Tinted #111111 op95%)'
                : isLight
                    ? 'default (#FCFCFC op94%)'
                    : 'default (#444444 op93%)'
            : controller.useSubThemes
                ? isLight
                    ? 'default (Tinted #111111 op95%)'
                    : 'default (Tinted White op95%)'
                : isLight
                    ? 'default (Grey700 op90%)'
                    : 'default (White op90%)';

    final String tooltipDefaultRadiusLabel = controller.tooltipRadius == null
        ? controller.useSubThemes
            ? 'default 8'
            : 'default 4'
        : '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        SwitchListTileReveal(
          title: const Text(
            'Tooltip background brightness',
          ),
          subtitleDense: true,
          subtitle: const Text(
            'OFF theme mode inverted, common on Web\n'
            'ON theme mode brightness, like Windows\n',
          ),
          value: controller.tooltipsMatchBackground &&
              controller.useFlexColorScheme &&
              (controller.tooltipSchemeColor == null ||
                  !controller.useSubThemes),
          onChanged: controller.useFlexColorScheme &&
                  (controller.tooltipSchemeColor == null ||
                      !controller.useSubThemes)
              ? controller.setTooltipsMatchBackground
              : null,
        ),
        ColorSchemePopupMenu(
          title: const Text('Tooltip background color'),
          subtitle: controller.tooltipSchemeColor == null
              ? null
              : const Text('Foreground pair used'),
          labelForDefault: toolTipDefaultColorLabel,
          index: controller.tooltipSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setTooltipSchemeColor(null);
                  } else {
                    controller.setTooltipSchemeColor(SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ListTile(
          enabled: controller.useFlexColorScheme &&
              controller.tooltipSchemeColor != null,
          title: const Text('Tooltip opacity, try 85% to 98%'),
          subtitle: Slider(
            max: 100,
            divisions: 100,
            label: (controller.tooltipOpacity * 100).toStringAsFixed(0),
            value: controller.useFlexColorScheme &&
                    controller.useSubThemes &&
                    controller.tooltipSchemeColor != null
                ? controller.tooltipOpacity * 100
                : 100,
            onChanged: controller.useFlexColorScheme &&
                    controller.useSubThemes &&
                    controller.tooltipSchemeColor != null
                ? (double value) {
                    controller.setTooltipOpacity(value / 100);
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'OPACITY',
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  // ignore: lines_longer_than_80_chars
                  '${(controller.useFlexColorScheme && controller.useSubThemes && controller.tooltipSchemeColor != null ? controller.tooltipOpacity * 100 : 100).toStringAsFixed(0)}'
                  ' %',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ListTileReveal(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Tooltip radius'),
          subtitleDense: true,
          subtitle: const Text(
            'Does not use the global border radius setting. '
            'Avoid using large border radius on tooltip containers.\n',
          ),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: Slider(
            min: -1,
            max: 30,
            divisions: 31,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.tooltipRadius == null ||
                        (controller.tooltipRadius ?? -1) < 0
                    ? tooltipDefaultRadiusLabel
                    : (controller.tooltipRadius?.toStringAsFixed(0) ?? '')
                : 'default 4',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.tooltipRadius ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setTooltipRadius(
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
                      ? controller.tooltipRadius == null ||
                              (controller.tooltipRadius ?? -1) < 0
                          ? tooltipDefaultRadiusLabel
                          : (controller.tooltipRadius?.toStringAsFixed(0) ?? '')
                      : 'default 4',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ListTile(
          title: const Text('Wait duration before shown'),
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          subtitle: Slider(
            min: 0,
            max: 2000,
            divisions: 20,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.tooltipWaitDuration == null ||
                        (controller.tooltipWaitDuration ?? 0) <= 0
                    ? 'default 0'
                    : (controller.tooltipWaitDuration.toString())
                : 'default 0',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.tooltipWaitDuration?.toDouble() ?? 0
                : 0,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setTooltipWaitDuration(
                        value <= 0 ? null : value.toInt());
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'mSec',
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.tooltipWaitDuration == null ||
                              (controller.tooltipWaitDuration ?? 0) <= 0
                          ? 'default 0'
                          : (controller.tooltipWaitDuration?.toString() ?? '')
                      : 'default 0',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ListTile(
          title: const Text('Show duration, after tap, long press or '
              'mouse exit'),
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          subtitle: Slider(
            min: 0,
            max: 2000,
            divisions: 20,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.tooltipShowDuration == null ||
                        (controller.tooltipShowDuration ?? 0) <= 0
                    ? 'tap/long 1500\nmouse exit 100'
                    : (controller.tooltipShowDuration.toString())
                : 'tap/long 1500\nmouse exit 100',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.tooltipShowDuration?.toDouble() ?? 0
                : 0,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setTooltipShowDuration(
                        value <= 0 ? null : value.toInt());
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'mSec',
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.tooltipShowDuration == null ||
                              (controller.tooltipShowDuration ?? 0) <= 0
                          ? 'tap/long 1500\nmouse exit 100'
                          : (controller.tooltipShowDuration?.toString() ?? '')
                      : 'tap/long 1500\nmouse exit 100',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: TooltipShowcase(),
        ),
        const Divider(),
        const ListTileReveal(
          title: Text('Icon, IconButton, CircleAvatar and DropdownButton'),
          subtitleDense: true,
          subtitle: Text('Included to show their styles with '
              'current theme and ColorScheme.\n'
              '\n'
              'These components have no adjustable theme properties in current '
              'version of FCS. Use "copyWith" on FCS returned ThemeData to '
              'add your custom theming to them.\n'
              '\n'
              'The DropdownButton is an old Material 2 widget in Flutter, '
              'prefer using newer M3 DropdownMenu or MenuAnchor, depending on '
              'use case.\n'),
        ),
        const Padding(
          padding: EdgeInsets.all(16),
          child: IconButtonCircleAvatarDropdownShowcase(),
        ),
        const ListTileReveal(
          dense: true,
          title: Text('Icon info'),
          subtitle: Text('Icons and IconButtons by default use same foreground '
              'color as active text theme. Some components change '
              'their colors automatically when they use them, but '
              'not all do. Icon usage is very varied, it is '
              'difficult to give them any single more universally '
              'applicable color than same as text.'),
        ),
        const Padding(
          padding: EdgeInsets.all(16),
          child: IconButtonShowcase(),
        ),
        // TODO(rydmike): Add variant IconButtons when available in stable.
        // const Padding(
        //   padding: EdgeInsets.all(16.0),
        //   child: IconButtonM3Showcase(),
        // ),
        ListTileReveal(
          dense: true,
          title: const Text('IconButton info, known issues and limitations'),
          subtitle: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'The new M3 style toggleable IconButtons, shown '
                      'above and in the ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsM3IconButtonGuide,
                  text: 'M3 guide here',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: ', are not yet available via own constructors in '
                      'Flutter 3.7. With current IconButton theming, only one '
                      'style is offered and thus only one of the M3 styles '
                      'can be made with theming, the default style is '
                      'therefore kept as it is.\n'
                      '\n'
                      'The constructors for above IconButtons are available in '
                      'the master channel, but not yet in Flutter 3.7. This ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsFlutterIssue111800,
                  text: 'proposal #111800',
                ),
                TextSpan(
                    style: spanTextStyle,
                    text: ' and its referenced PR brought the new styled '
                        'IconButton constructors. These new IconButtons have '
                        'the same theming limitation as the FilledButton, '
                        'for more information about it, see issue '),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsFlutterIssue123829,
                  text: '#123829',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: '. Currently you have to create these M3 IconButtons '
                      'as custom widgets using styleFrom. There is example '
                      'code showing how to do it correctly in the Flutter ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsFlutterIconButtonDoc,
                  text: 'IconButton API docs',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: '. It is a bit tedious to construct them, '
                      'but at least doable, but not with any built-in '
                      'constructors yet, nor is theming them possible.\n',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
