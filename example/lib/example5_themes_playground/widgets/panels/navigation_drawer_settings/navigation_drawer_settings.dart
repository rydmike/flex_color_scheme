import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/const/app.dart';
import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../shared/color_scheme_popup_menu.dart';

class NavigationDrawerSettings extends StatelessWidget {
  const NavigationDrawerSettings(this.controller, {super.key});
  final ThemeController controller;

  static final Uri _drawerM3Spec = Uri(
    scheme: 'https',
    host: 'm3.material.io',
    path: 'components/navigation-drawer/specs',
  );
  static final Uri _drawerWidthIssue123380 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/issues/123380',
  );
  static final Uri _drawerUmbrellaIssue123507 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/issues/123507',
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
    final String drawerRadiusDefaultLabel =
        controller.drawerBorderRadius == null && effectiveRadius == null
            ? 'default 16'
            : controller.drawerBorderRadius == null && effectiveRadius != null
                ? 'global ${effectiveRadius.toStringAsFixed(0)}'
                : '';
    final String indicatorDefaultLabel =
        controller.drawerIndicatorBorderRadius == null &&
                effectiveRadius == null
            ? 'default (stadium)'
            : controller.drawerIndicatorBorderRadius == null &&
                    effectiveRadius != null
                ? 'global ${effectiveRadius.toStringAsFixed(0)}'
                : '';

    final String onIndicatorDefault = controller.drawerIndicatorSchemeColor ==
            null
        ? 'default (onSecondaryContainer)'
        // ignore: lines_longer_than_80_chars
        : 'default (${SchemeColor.values[FlexSubThemes.onSchemeColor(controller.drawerIndicatorSchemeColor!).index].name})';

    final String onBackgroundDefault = controller.drawerBackgroundSchemeColor ==
            null
        ? 'default (onSurfaceVariant)'
        // ignore: lines_longer_than_80_chars
        : 'default (${SchemeColor.values[FlexSubThemes.onSchemeColor(controller.drawerBackgroundSchemeColor!).index].name})';

    final double derivedIndicatorWidth =
        (controller.drawerWidth ?? (useMaterial3 ? 360 : 304)) - 2 * 12;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTileReveal(
          title: Text('Drawer'),
          subtitleDense: true,
          subtitle: Text('The Drawer comes in two variants, the vanilla '
              'Drawer, which is an empty Drawer container. You provide '
              'the content. Its theme also control how the '
              'NavigationDrawer looks, since the NavigationDrawer builds '
              'on the Drawer.\n'
              '\n'
              'Default background in Flutter SDK in M3 is colorScheme.surface, '
              'with elevation tint and no shadow. In M2 it has shadow and '
              'uses color theme.canvasColor, that is typically set '
              'to colorScheme.background. FCS component sub-themes use '
              'surface as default color in both M2 and M3 modes.\n'),
        ),
        const SizedBox(height: 8),
        const DrawerShowcase(explain: false),
        const SizedBox(height: 16),
        ColorSchemePopupMenu(
          title: const Text('Background color'),
          labelForDefault: controller.useFlexColorScheme
              ? 'default (surface)'
              : useMaterial3
                  ? 'default (surface)'
                  : 'default (background)',
          index: controller.drawerBackgroundSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setDrawerBackgroundSchemeColor(null);
                  } else {
                    controller.setDrawerBackgroundSchemeColor(
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
                ? controller.drawerBorderRadius == null ||
                        (controller.drawerBorderRadius ?? -1) < 0
                    ? drawerRadiusDefaultLabel
                    : (controller.drawerBorderRadius?.toStringAsFixed(0) ?? '')
                : controller.useMaterial3
                    ? 'default 16'
                    : 'default 0',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.drawerBorderRadius ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setDrawerBorderRadius(
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
                      ? controller.drawerBorderRadius == null ||
                              (controller.drawerBorderRadius ?? -1) < 0
                          ? drawerRadiusDefaultLabel
                          : (controller.drawerBorderRadius
                                  ?.toStringAsFixed(0) ??
                              '')
                      : controller.useMaterial3
                          ? 'default 16'
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
          title: const Text('Elevation'),
          subtitle: Slider(
            min: -1,
            max: 20,
            divisions: 21,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.drawerElevation == null ||
                        (controller.drawerElevation ?? -1) < 0
                    ? useMaterial3
                        ? 'default 1'
                        : 'default 16'
                    : (controller.drawerElevation?.toStringAsFixed(0) ?? '')
                : useMaterial3
                    ? 'default 1'
                    : 'default 16',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.drawerElevation ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setDrawerElevation(
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
                      ? controller.drawerElevation == null ||
                              (controller.drawerElevation ?? -1) < 0
                          ? useMaterial3
                              ? 'default 1'
                              : 'default 16'
                          : (controller.drawerElevation?.toStringAsFixed(0) ??
                              '')
                      : useMaterial3
                          ? 'default 1'
                          : 'default 16',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        // TODO(rydmike): Change M3 Drawer width default info when SDK is fixed.
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Width'),
          subtitle: Slider(
            min: 199,
            max: 500,
            divisions: 301,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.drawerWidth == null ||
                        (controller.drawerWidth ?? 199) < 200
                    ? useMaterial3
                        ? 'default 360'
                        : 'default 304'
                    : (controller.drawerWidth?.toStringAsFixed(0) ?? '')
                : useMaterial3
                    ? 'default 304' // Should be 360, but is 304, SDK BUG.
                    : 'default 304',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.drawerWidth ?? 199
                : 199,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setDrawerWidth(
                        value < 200 ? null : value.roundToDouble());
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
                      ? controller.drawerWidth == null ||
                              (controller.drawerWidth ?? 199) < 200
                          ? useMaterial3
                              ? 'default 360'
                              : 'default 304'
                          : (controller.drawerWidth?.toStringAsFixed(0) ?? '')
                      : useMaterial3
                          ? 'default 304' // Should be 360, but is 304, SDK BUG.
                          : 'default 304',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ListTileReveal(
          title: const Text('Width issue'),
          dense: true,
          subtitle: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'Based on Material-3 ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _drawerM3Spec,
                  text: 'specification of NavigationDrawer',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: ' it should be 360dp wide, while Material-2 is '
                      '304dp in Flutter. '
                      'Due to a bug in Flutter, it defaults to 304 dp in both '
                      'modes in Flutter 3.7 and 3.10. '
                      'FCS corrects this spec deviation in its defaults.\n'
                      '\n'
                      'Please note that a 360 dp wide Drawer may be too wide '
                      'for smaller or older phones and the Drawer may '
                      'cover the entire width of the phone. This may not be '
                      'desired, if so adjust the width down. The 304 dp M2 '
                      'spec width is not a bad choice in M3 either, maybe a '
                      'bit wider but below 360dp. Please see ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _drawerWidthIssue123380,
                  text: 'issue #123380',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: ' for more information and analysis of suitable '
                      'Drawer width on different sized phones.\n',
                ),
              ],
            ),
          ),
        ),
        const Divider(),
        const ListTileReveal(
          title: Text('NavigationDrawer'),
          subtitleDense: true,
          subtitle: Text('The NavigationDrawer arrived with Flutter 3.7. '
              'It provides an easy way to make a Material-3 specification '
              'matching Drawer with built-in top level navigation items '
              'and a selected destination indicator.\n'
              '\n'
              'Default Flutter background color is colorScheme.surface, '
              'with addition of elevation tint in Material-3 mode.\n'),
        ),
        const NavigationDrawerShowcase(explain: false),
        const SizedBox(height: 16),
        ColorSchemePopupMenu(
          title: const Text('Drawer indicator color'),
          labelForDefault: 'default (secondaryContainer)',
          index: controller.drawerIndicatorSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setDrawerIndicatorSchemeColor(null);
                  } else {
                    controller.setDrawerIndicatorSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Indicator opacity'),
          subtitle: Slider(
            min: -1,
            max: 100,
            divisions: 101,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.drawerIndicatorOpacity == null ||
                        (controller.drawerIndicatorOpacity ?? -1) < 0
                    ? 'default (100%)'
                    : (controller.drawerIndicatorOpacity! * 100)
                        .toStringAsFixed(0)
                : 'default (100%)',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.drawerIndicatorOpacity != null
                    ? controller.drawerIndicatorOpacity! * 100
                    : -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setDrawerIndicatorOpacity(
                        value < 0 ? null : value / 100);
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
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.drawerIndicatorOpacity == null ||
                              (controller.drawerIndicatorOpacity ?? -1) < 0
                          ? 'default (100%)'
                          // ignore: lines_longer_than_80_chars
                          : '${(controller.drawerIndicatorOpacity! * 100).toStringAsFixed(0)}%'
                      : 'default (100%)',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Indicator border radius'),
          subtitle: Slider(
            min: -1,
            max: 50,
            divisions: 51,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.drawerIndicatorBorderRadius == null ||
                        (controller.drawerIndicatorBorderRadius ?? -1) < 0
                    ? indicatorDefaultLabel
                    : (controller.drawerIndicatorBorderRadius
                            ?.toStringAsFixed(0) ??
                        '')
                : 'default (stadium)',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.drawerIndicatorBorderRadius ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setDrawerIndicatorBorderRadius(
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
                      ? controller.drawerIndicatorBorderRadius == null ||
                              (controller.drawerIndicatorBorderRadius ?? -1) < 0
                          ? indicatorDefaultLabel
                          : (controller.drawerIndicatorBorderRadius
                                  ?.toStringAsFixed(0) ??
                              '')
                      : 'default (stadium)',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Indicator width'),
          subtitle: Slider(
            min: 199,
            max: 500,
            divisions: 301,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.drawerIndicatorWidth == null ||
                        (controller.drawerIndicatorWidth ?? 199) < 200
                    ? 'computed $derivedIndicatorWidth'
                    : (controller.drawerIndicatorWidth?.toStringAsFixed(0) ??
                        '')
                : useMaterial3
                    ? 'default ${360 - 2 * 12}'
                    : 'default ${304 - 2 * 12}',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.drawerIndicatorWidth ?? 199
                : 199,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setDrawerIndicatorWidth(
                        value < 200 ? null : value.roundToDouble());
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
                      ? controller.drawerIndicatorWidth == null ||
                              (controller.drawerIndicatorWidth ?? 199) < 200
                          ? 'computed $derivedIndicatorWidth'
                          : (controller.drawerIndicatorWidth
                                  ?.toStringAsFixed(0) ??
                              '')
                      : useMaterial3
                          ? 'default ${360 - 2 * 12}'
                          : 'default ${304 - 2 * 12}',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ColorSchemePopupMenu(
          title: const Text('Selected item color'),
          labelForDefault: onIndicatorDefault,
          index: controller.drawerSelectedItemSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setDrawerSelectedItemSchemeColor(null);
                  } else {
                    controller.setDrawerSelectedItemSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ColorSchemePopupMenu(
          title: const Text('Unselected item color'),
          labelForDefault: onBackgroundDefault,
          index: controller.drawerUnselectedItemSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setDrawerUnselectedItemSchemeColor(null);
                  } else {
                    controller.setDrawerUnselectedItemSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ListTileReveal(
          dense: true,
          title: const Text('Known issues'),
          subtitle: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'The NavigationDrawer and its Indicator styling has a '
                      'fair amount of minor issues in Flutter 3.7 and 3.10 '
                      'that limits useful styling options. You can find '
                      'an overview of them and their status in ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _drawerUmbrellaIssue123507,
                  text: 'issue #123507',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: '.\n',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
