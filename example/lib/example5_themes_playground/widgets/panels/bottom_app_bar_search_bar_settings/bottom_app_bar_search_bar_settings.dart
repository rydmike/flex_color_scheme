import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../shared/color_scheme_popup_menu.dart';

class BottomAppBarSearchBarSettings extends StatelessWidget {
  const BottomAppBarSearchBarSettings(this.controller, {super.key});
  final ThemeController controller;

  static final Uri _fcsFlutterFix117082 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/pull/117082',
  );
  static final Uri _fcsFlutterIssue126623 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/issues/126623',
  );

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final TextStyle spanTextStyle = theme.textTheme.bodySmall!;
    final TextStyle linkStyle = theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primary, fontWeight: FontWeight.bold);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTileReveal(
          title: Text('BottomAppBar'),
          subtitle: Text('A BottomAppBar is typically used with '
              'Scaffold.bottomNavigationBar. '
              'Its elevation in FCS defaults to AppBar elevation in M2 mode, '
              'when using M3 it defaults to 3 and gets elevation tint.\n'),
        ),
        const SizedBox(height: 8),
        Card(
          elevation: 0,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          color: theme.colorScheme.surfaceVariant,
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: BottomAppBarShowcase(explain: false),
          ),
        ),
        const SizedBox(height: 8),
        if (isLight) ...<Widget>[
          ListTile(
            enabled: controller.useFlexColorScheme,
            title: const Text('Light BottomAppBar elevation'),
            subtitle: Slider(
              min: -0.5,
              max: 20,
              divisions: 41,
              label: !controller.useFlexColorScheme ||
                      controller.bottomAppBarElevationLight == null
                  ? controller.useMaterial3
                      ? 'default 3'
                      : 'default 8'
                  : (controller.bottomAppBarElevationLight
                          ?.toStringAsFixed(1) ??
                      ''),
              value: controller.useFlexColorScheme
                  ? controller.bottomAppBarElevationLight ?? -0.5
                  : -0.5,
              onChanged: controller.useFlexColorScheme
                  ? (double value) {
                      controller.setBottomAppBarElevationLight(
                          value < 0 ? null : value);
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
                    !controller.useFlexColorScheme ||
                            controller.bottomAppBarElevationLight == null
                        ? controller.useMaterial3
                            ? 'default 3'
                            : 'default 8'
                        : (controller.bottomAppBarElevationLight
                                ?.toStringAsFixed(1) ??
                            ''),
                    style: theme.textTheme.bodySmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ] else ...<Widget>[
          ListTile(
            enabled: controller.useFlexColorScheme,
            title: const Text('Dark BottomAppBar elevation'),
            subtitle: Slider(
              min: -0.5,
              max: 20,
              divisions: 41,
              label: !controller.useFlexColorScheme ||
                      controller.bottomAppBarElevationDark == null
                  ? controller.useMaterial3
                      ? 'default 3'
                      : 'default 8'
                  : (controller.bottomAppBarElevationDark?.toStringAsFixed(1) ??
                      ''),
              value: controller.useFlexColorScheme
                  ? controller.bottomAppBarElevationDark ?? -0.5
                  : -0.5,
              onChanged: controller.useFlexColorScheme
                  ? (double value) {
                      controller.setBottomAppBarElevationDark(
                          value < 0 ? null : value);
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
                    !controller.useFlexColorScheme ||
                            controller.bottomAppBarElevationDark == null
                        ? controller.useMaterial3
                            ? 'default 3'
                            : 'default 8'
                        : (controller.bottomAppBarElevationDark
                                ?.toStringAsFixed(1) ??
                            ''),
                    style: theme.textTheme.bodySmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
        ColorSchemePopupMenu(
          title: const Text('Background color for light and dark mode'),
          labelForDefault: 'default (surface)',
          index: controller.bottomAppBarSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setBottomAppBarSchemeColor(null);
                  } else {
                    controller
                        .setBottomAppBarSchemeColor(SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        const ListTileReveal(
          dense: true,
          title: Text('Theming info'),
          subtitle: Text(
              'Flutter M2 past default color is ThemeData.bottomAppBarColor '
              '(deprecated in Flutter 3.7) now colorScheme.surface and '
              'elevation 8. In M3 it defaults to colorScheme.surface '
              'color, elevation 3, no shadow, but with surface elevation '
              'tint.\n'
              '\n'
              'The color of the items in a BottomAppBar cannot be themed. If '
              'you use a background color that requires other contrasting '
              'color than what works on surface and background colors, you '
              'will have to color the content on widget level.\n'),
        ),
        ListTileReveal(
          dense: true,
          title: const Text('Known issues'),
          subtitle: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'In Flutter 3.7 the BottomAppBar '
                      'color cannot be changed due to the issue described in ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsFlutterFix117082,
                  text: 'FIX PR #117082',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: '. The fix is available in Flutter 3.10 '
                      'and later.\n',
                ),
              ],
            ),
          ),
        ),
        const Divider(),
        //
        // SearchBar
        //
        const ListTileReveal(
          title: Text('SearchBar'),
          subtitle: Text('The SearchBar with SearchView is new in Flutter '
              '3.10. A convenient way to create a search bar with a '
              'view is with the factory SearchAnchor.bar.\n'
              '\n'
              'FCS does not provide any convenience theming features for '
              'the search bar in current version, but may add some later.\n'),
        ),
        const SearchBarShowcase(),
        ListTileReveal(
          dense: true,
          title: const Text('Known issues'),
          subtitle: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'The InputDecoration theme leeks through into '
                      'SearchBar and SearchView. From the SearchView it cannot '
                      'even be removed with a Theme wrapper. For more '
                      'information, see ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsFlutterIssue126623,
                  text: 'issue #126623',
                ),
                TextSpan(
                    style: spanTextStyle,
                    text: '. This issue has been fixed in Flutter 3.13.\n '),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
