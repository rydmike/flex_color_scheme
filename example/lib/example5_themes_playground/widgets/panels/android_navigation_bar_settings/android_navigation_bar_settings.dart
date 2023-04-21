import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/switch_list_tile_reveal.dart';
import 'system_nav_bar_style_toggle_buttons.dart';

// Panel used to control the themed Android system navigation bar on Android.
//
// Demo on how to use AnnotatedRegion with
// FlexColorScheme.themedSystemNavigationBar.
// This feature only has any impact on Android builds and requires the
// setup of an annotated region to be used in the app. The
// FlexColorScheme.themedSystemNavigationBar is a static helpers to
// that can be used to style the Android System navigation bar in a style
// that matches your used FlexColorScheme based theme.
class AndroidNavigationBarSettings extends StatelessWidget {
  const AndroidNavigationBarSettings(this.controller, {super.key});
  final ThemeController controller;

  static final Uri _fcsFlutterIssue100027 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/issues/100027',
  );

  static final Uri _fcsFlutterIssue112301 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/issues/112301',
  );

  static final Uri _fcsSysNavDocs = Uri(
    scheme: 'https',
    host: 'docs.flexcolorscheme.com',
    path: 'deep_dives',
    fragment: 'themed-system-navigation-bar-in-android',
  );

  String explainStyle(final FlexSystemNavBarStyle style, final bool isLight) {
    switch (style) {
      case FlexSystemNavBarStyle.system:
        return isLight
            ? 'System, white with opacity in light mode'
            : 'System, black with opacity in dark mode';
      case FlexSystemNavBarStyle.surface:
        return 'Surface color, with opacity & alpha blend';
      case FlexSystemNavBarStyle.background:
        return 'Background color, with opacity & alpha blend';
      case FlexSystemNavBarStyle.scaffoldBackground:
        return 'Scaffold background, with opacity & alpha blend';
      case FlexSystemNavBarStyle.transparent:
        return 'Fully transparent';
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final TextStyle spanTextStyle = theme.textTheme.bodySmall!;
    final TextStyle linkStyle = theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primary, fontWeight: FontWeight.bold);
    final double navBarOpacity = controller.sysNavBarOpacity;
    return Column(
      children: <Widget>[
        const SizedBox(height: 8),
        ListTileReveal(
          title: const Text('Theme following Android system navigation bar'),
          subtitleDense: true,
          subtitle: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'Settings below only have any effect if you '
                      'build this application for an Android device. They then '
                      'demonstrates the usage and effects of the '
                      'AnnotatedRegion helper '
                      '"FlexColorScheme.themedSystemNavigationBar". These '
                      'settings do not have any impact on generated theme '
                      'setup code. You have to implement the AnnotatedRegion '
                      'with the helper separately in your application.\n'
                      '\n'
                      'You can read more about how to use FlexColorScheme '
                      'annotated region helper "themedSystemNavigationBar" '
                      'in the ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsSysNavDocs,
                  text: 'documentation',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: '. There are some Android version limitations '
                      'and issues concerning stying the system navigation bar. '
                      'You can read more about them in Flutter SDK ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsFlutterIssue112301,
                  text: 'umbrella issue #112301',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: '. In earlier versions ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsFlutterIssue100027,
                  text: 'issue #100027',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: ' impacted the FlexColorScheme annotated region helper '
                      'to the degree that divider support was removed. The '
                      'issue has been fixed and the divider feature restored '
                      'in FCS v7 and later.',
                ),
              ],
            ),
          ),
        ),
        const ListTile(
          title: Text('Background opacity'),
          subtitle: Text('System navigation bar opacity'),
        ),
        ListTile(
          enabled:
              controller.sysNavBarStyle != FlexSystemNavBarStyle.transparent,
          title: Slider(
            max: 100,
            divisions: 100,
            label: (navBarOpacity * 100).toStringAsFixed(0),
            value:
                controller.sysNavBarStyle == FlexSystemNavBarStyle.transparent
                    ? 0
                    : navBarOpacity * 100,
            onChanged:
                controller.sysNavBarStyle != FlexSystemNavBarStyle.transparent
                    ? (double value) {
                        controller.setSysBarOpacity(value / 100);
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
                  controller.sysNavBarStyle == FlexSystemNavBarStyle.transparent
                      ? '0 %'
                      : '${(navBarOpacity * 100).toStringAsFixed(0)} %',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        ListTile(
          title: const Text('Android system navigation bar style'),
          subtitle: Text('Using themedSystemNavigationBar\n'
              '${explainStyle(controller.sysNavBarStyle, isLight)}'),
        ),
        ListTile(
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 4.0),
            child: SystemNavBarStyleToggleButtons(
              style: controller.sysNavBarStyle,
              onChanged: controller.setSysNavBarStyle,
            ),
          ),
          onTap: () {
            if (controller.sysNavBarStyle.index + 1 >=
                FlexSystemNavBarStyle.values.length) {
              controller.setSysNavBarStyle(FlexSystemNavBarStyle.values[0]);
            } else {
              controller.setSysNavBarStyle(FlexSystemNavBarStyle
                  .values[controller.sysNavBarStyle.index + 1]);
            }
          },
        ),
        SwitchListTileReveal(
          title: const Text('System navigation bar divider'),
          subtitleDense: true,
          subtitle: const Text('There is an extra system built-in scrim on '
              'the system navigation bar when the divider is enabled.\n'
              '\n'
              'The divider is actually not a divider, it is another colored '
              'partially transparent black color that is behind the system '
              'navigation bar that is one pixel taller than the foreground '
              'bar. This then also becomes a scrim when using transparent '
              'color on the foreground.\n'),
          value: controller.useSysNavDivider,
          onChanged: controller.setUseSysNavDivider,
        ),
      ],
    );
  }
}
