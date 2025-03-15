import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';

class IconButtonAvatarPanel extends StatelessWidget {
  const IconButtonAvatarPanel(this.controller, {super.key});
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

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle spanTextStyle = theme.textTheme.bodySmall!
        .copyWith(color: theme.colorScheme.onSurfaceVariant);
    final TextStyle linkStyle = theme.textTheme.bodySmall!.copyWith(
      color: theme.colorScheme.primary,
      fontWeight: FontWeight.bold,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTileReveal(
          title: Text('Icon, IconButton and CircleAvatar'),
          subtitleReveal: Text('Included to show their styles with '
              'current theme and ColorScheme. '
              'These components have no adjustable theme properties in current '
              'version of FCS. Use "copyWith" on FCS returned ThemeData to '
              'add your custom theming to them.\n'
              '\n'),
        ),
        const Divider(),
        const ListTileReveal(
          title: Text('Icon'),
          subtitleReveal: Text('Icons by default use same foreground '
              'color as active text theme. Some components change '
              'icon colors automatically when they use them, but '
              'not all do. Icon usage is very varied, it is '
              'difficult to give them any single more universally '
              'applicable color than same as text.'),
        ),
        const Padding(
          padding: EdgeInsets.all(16),
          child: IconShowcase(),
        ),
        const Divider(),
        const ListTileReveal(
          title: Text('IconButton'),
          subtitleReveal: Text('IconButtons in FCS currently only offer the '
              'default theme and no customization. See known issues for '
              'explanation of why this limitation is used.\n'),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: IconButtonShowcase(),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: IconButtonVariantsShowcase(),
        ),
        ListTileReveal(
          dense: true,
          title: const Text('Known issues'),
          subtitleReveal: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'The Material-3 style toggleable IconButtons, shown '
                      'above and in the ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsM3IconButtonGuide,
                  text: 'Material-3 guide here',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: ', are available via own constructors in already in '
                      'Flutter 3.10. '
                      'With current IconButton theming, only one '
                      'style is offered and thus only one of the Material-3 '
                      'styles '
                      'can be made with theming. The default styles are '
                      'therefore kept as they are.\n'
                      '\n'
                      'The constructors for above IconButtons are not '
                      'available in Flutter 3.7. This ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsFlutterIssue111800,
                  text: 'proposal #111800',
                ),
                TextSpan(
                    style: spanTextStyle,
                    text: ' and its referenced PR brought the new styled '
                        'IconButton constructors to 3.10.\n'
                        'In Flutter 3.3 and 3.7 you have to create these '
                        'M3 IconButtons as custom widgets using styleFrom. '
                        'There is example code showing how to do it correctly '
                        'in the Flutter API docs for 3.3 and 3.7. It is '
                        'tedious to construct them, but doable. The built-in '
                        'constructors are available in Flutter 3.10.\n'
                        '\n'
                        'Theming the IconButtons is not recommended because '
                        'they all have the same theming limitation as the '
                        'FilledButton. '
                        'For more information about this, see issue '),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsFlutterIssue123829,
                  text: '#123829',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: '. Due to this, FCS is currently '
                      'not offering any color theming for the IconButton '
                      'variants. Their default styles are however quite '
                      'diverse and have usable default theme based '
                      'ColorScheme color mappings.\n',
                ),
              ],
            ),
          ),
        ),
        const Divider(),
        const ListTileReveal(
          title: Text('CircleAvatar'),
          subtitleReveal: Text('When using M2 mode, CircleAvatar uses legacy '
              'ThemeData color primaryColorDark and primaryColorLight as '
              'default colors. FCS takes care of defining light and dark '
              'shades for these legacy ThemeData colors automatically based '
              'on colorScheme.primary color. In M3 mode CircleAvatar defaults '
              'to using colorScheme.primaryContainer and onPrimaryContainer. '
              'There is no component '
              'theme available in Flutter for CircleAvatar.\n'),
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: CircleAvatarShowcase(),
        ),
      ],
    );
  }
}
