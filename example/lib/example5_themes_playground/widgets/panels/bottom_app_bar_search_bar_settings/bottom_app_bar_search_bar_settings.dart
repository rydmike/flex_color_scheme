import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../../../shared/widgets/universal/slider_list_tile_reveal.dart';
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
    final bool useMaterial3 = theme.useMaterial3;
    final bool isLight = theme.brightness == Brightness.light;
    final TextStyle spanTextStyle = theme.textTheme.bodySmall!;
    final TextStyle linkStyle = theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primary, fontWeight: FontWeight.bold);

    // The most common logic for enabling Playground controls.
    final bool enableControl =
        controller.useSubThemes && controller.useFlexColorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTileReveal(
          title: Text('BottomAppBar'),
          subtitleReveal: Text('A BottomAppBar is typically used with '
              'Scaffold.bottomNavigationBar. '
              'Its elevation in FCS defaults to AppBar elevation in M2 mode, '
              'when using M3 it defaults to 3 and gets elevation tint.\n'),
        ),
        const SizedBox(height: 8),
        Card(
          elevation: 0,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          color: theme.colorScheme.surfaceContainerHighest,
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: BottomAppBarShowcase(explain: false),
          ),
        ),
        const SizedBox(height: 8),
        if (isLight) ...<Widget>[
          SliderListTileReveal(
            enabled: controller.useFlexColorScheme,
            title: const Text('Light elevation'),
            value: controller.bottomAppBarElevationLight,
            onChanged: controller.setBottomAppBarElevationLight,
            min: 0,
            max: 20,
            divisions: 40,
            valueHeading: 'ELEV',
            valueDecimalPlaces: 1,
            valueDefaultLabel: useMaterial3 ? '3' : '8',
          ),
          ColorSchemePopupMenu(
            title: const Text('Light background color'),
            labelForDefault: useMaterial3
                ? 'default (surfaceContainer)'
                : 'default (surface)',
            index: controller.bottomAppBarSchemeColorLight?.index ?? -1,
            onChanged: enableControl
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setBottomAppBarSchemeColorLight(null);
                    } else {
                      controller.setBottomAppBarSchemeColorLight(
                          SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
        ] else ...<Widget>[
          SliderListTileReveal(
            enabled: controller.useFlexColorScheme,
            title: const Text('Dark elevation'),
            value: controller.bottomAppBarElevationDark,
            onChanged: controller.setBottomAppBarElevationDark,
            min: 0,
            max: 20,
            divisions: 40,
            valueHeading: 'ELEV',
            valueDecimalPlaces: 1,
            valueDefaultLabel: useMaterial3 ? '3' : '8',
          ),
          ColorSchemePopupMenu(
            title: const Text('Dark background color'),
            labelForDefault: useMaterial3
                ? 'default (surfaceContainer)'
                : 'default (surface)',
            index: controller.bottomAppBarSchemeColorDark?.index ?? -1,
            onChanged: enableControl
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setBottomAppBarSchemeColorDark(null);
                    } else {
                      controller.setBottomAppBarSchemeColorDark(
                          SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
        ],

        const ListTileReveal(
          dense: true,
          title: Text('Theming info'),
          subtitleReveal: Text('Flutter M2 mode older default color is '
              'ThemeData.bottomAppBarColor. '
              'This was deprecated in Flutter 3.7, now M2 mode uses '
              'surface color and elevation 8.\n'
              '\n'
              'In M3 mode, before Flutter 3.22 it defaults to '
              'surface color, elevation 3, no shadow, but '
              'with surface elevation tint. In Flutter 3.22 and later default '
              'is surfaceContainer. The elevation is still 3, but surfaceTint '
              'is transparent, so elevation has no visible impact.\n'
              '\n'
              'The color of the items in a BottomAppBar cannot be themed. If '
              'you use a background color that requires other contrasting '
              'color than what works on surface colors, you '
              'will have to color the content on widget level.\n'),
        ),
        ListTileReveal(
          dense: true,
          title: const Text('Known issues'),
          subtitleReveal: RichText(
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
          subtitleReveal: Text(
              'The SearchBar with SearchView is new in Flutter '
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
          subtitleReveal: RichText(
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
