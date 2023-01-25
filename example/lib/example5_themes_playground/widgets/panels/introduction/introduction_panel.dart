// Each Card shown in the grid view is just its on little widget, typically
// very simple and basic Column based layouts.
// They all share a common custom wrapper widget, the HeaderCard.
//
// The widgets below are all private classes local to this file, since in this
// demo they are only intended to be use in HomePage. The could of course be
// made public widget and put into their own files if there would be a need
// to use them on other other screens too.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../dialogs/show_copy_setup_code_dialog.dart';
import 'platform_popup_menu.dart';

/// Show the main panel with introduction information.
///
/// Has the main controls to turn ON/OFF using FlexColorScheme and
/// the sub themes too.
class IntroductionPanel extends StatelessWidget {
  const IntroductionPanel(this.controller, {super.key});
  final ThemeController controller;

  static final Uri _fcsDocs = Uri(
    scheme: 'https',
    host: 'docs.flexcolorscheme.com',
  );

  static final Uri _fcsDocsPlayground = Uri(
    scheme: 'https',
    host: 'docs.flexcolorscheme.com',
    path: 'playground',
  );

  static final Uri _fcsFlutterIssues = Uri(
    scheme: 'https',
    host: 'docs.flexcolorscheme.com',
    path: 'known_issues',
  );

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle spanTextStyle = theme.textTheme.bodyMedium!
        .copyWith(color: theme.textTheme.bodySmall!.color);
    final TextStyle linkStyle = theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primary, fontWeight: FontWeight.bold);

    return Column(
      children: <Widget>[
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'Use Themes Playground to try features and themes '
                      'of FlexColorScheme. Find a theme you like, experiment '
                      'with surface blends and try Material 3.\n'
                      '\n'
                      'Check out the FlexColorScheme ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsDocs,
                  text: 'documentation site',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: ' for more information. It also has a section on ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsDocsPlayground,
                  text: 'how-to-use',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: ' this Playground. Give it a read, it not '
                      'only explains this application and FlexColorScheme API, '
                      'using tutorial examples and API guide. It also '
                      'contains general Flutter theming guidance and advice.',
                ),
              ],
            ),
          ),
        ),
        const ListTile(
          subtitle: Text(
            'This application does not adjust any individual widget '
            'properties. The theme is adjusted interactively and all Flutter '
            "widgets in it change as the application's theme is modified "
            'interactively.\n'
            '\n'
            'Material 3 ColorScheme is supported and can be '
            'generated using built-in '
            'scheme colors as ColorScheme seed keys. Like with '
            'ColorScheme.fromSeed, you can use the primary color as seed key. '
            'You can also include secondary and tertiary colors as key colors '
            'to generate your '
            'Material 3 ColorScheme. You can customize the tonal palette '
            'generation parameters. For branding purposes you can lock '
            'selected main colors to their defined input values, while for '
            'branding less relevant colors are still seed generated.\n'
            '\n'
            'The theming settings and their impact on widgets are shown in '
            'widget topic panels. The same panels are used on two screens '
            'with different layouts. The default one is a page view, '
            'where you see one topic at a time. The second screen is a '
            'large masonry grid view, where you can see many topics at once '
            'when using large screens. You can open and close topics to view '
            'more or fewer of them at the same time. '
            'This app works on phones, but is primarily intended to be used on '
            'web based desktop browsers, or as a native Windows, '
            'Mac or Linux desktop app, where it shines.\n'
            '\n'
            'The three first themes in the app are example custom color '
            'schemes, made in the tutorials with the API, they are not '
            'built-in choices in the package. In the package tutorials '
            'you learn how to make your own custom color schemes and turn '
            'them into advanced themes with FlexColorScheme. '
            'All settings in this demo are persisted locally and can be reset '
            'back to default values at any time. Feel free to experiment with '
            'interesting theme styles. If you get lost in options, just reset '
            'and start again.',
          ),
        ),
        const Divider(),
        const ListTile(
          title: Text('FlexColorScheme Theming'),
          subtitle: Text('You can turn OFF FlexColorScheme to see what a '
              'theme looks like when using vanilla Flutter '
              'ThemeData() factory, using the same ColorScheme '
              'as shown when FlexColorScheme is active.'),
        ),
        SwitchListTile(
          subtitle: const Text(
            "Turn OFF too see Flutter's standard "
            'theming using the same colors. Component themes are also '
            'disabled when FlexColorScheme is disabled.',
          ),
          value: controller.useFlexColorScheme,
          onChanged: controller.setUseFlexColorScheme,
        ),
        SwitchListTile(
          subtitle: const Text('The opinionated component sub '
              'theming is ON by default in this app, but OFF by default in '
              'the API. By using them you get pre-styled components that you '
              'can adjust further.'),
          value: controller.useSubThemes && controller.useFlexColorScheme,
          onChanged:
              controller.useFlexColorScheme ? controller.setUseSubThemes : null,
        ),
        const ListTile(
          subtitle: Text(
            'When you enable component sub-themes you get '
            'a theme that is inspired by Material 3, without using the '
            'useMaterial3 toggle in ThemeData. All widgets are still Material '
            '2 based, you can give them colors from the full Material 3 '
            'ColorScheme and also use a seeded ColorScheme with them. ',
          ),
        ),
        ListTile(
          subtitle: const Text(
              'Want to use the FlexColorScheme theme you configured here in '
              'your Flutter app? Then Copy the setup code, paste it into your '
              'Flutter app, import FlexColorScheme, and theming is done.'),
          trailing: FilledButton(
            onPressed: controller.useFlexColorScheme
                ? () {
                    // ignore: discarded_futures
                    showCopySetupCodeDialog(context, controller);
                  }
                : null,
            child: const Text('Code'),
          ),
          onTap: controller.useFlexColorScheme
              ? () {
                  // ignore: discarded_futures
                  showCopySetupCodeDialog(context, controller);
                }
              : null,
        ),
        const Divider(),
        SwitchListTile(
          title: const Text('Use Material 3'),
          value: controller.useMaterial3,
          onChanged: controller.setUseMaterial3,
        ),
        const ListTile(
          title: Text('Flutter SDK Material 3 Issues'),
          subtitle: Text('In Flutter 3.7 there are only a few minor issues '
              'with Material 3, with hardly any impact on an app using it. In '
              'Flutter 3.3 and earlier, that are many issues '
              'related to enabling and using Material 3.'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'You can read more about M3 issues in '
                      'FlexColorScheme docs, where they are being ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsFlutterIssues,
                  text: 'tracked',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: '. Due to the large number of issues and also '
                      'incomplete state of Material 3 implementation in '
                      'Flutter 3.3 and earlier, resulting in mixed results, '
                      'We do NOT recommend using M3 with these versions.\n'
                      '\n'
                      'In Flutter stable 3.7 and later, M3 is ready and can be '
                      'used in production. Some minor M3 fidelity and '
                      'specification compliance issues still exists, but they '
                      'are very minor.',
                ),
              ],
            ),
          ),
        ),
        const Divider(),
        PlatformPopupMenu(
          platform: controller.platform,
          onChanged: controller.setPlatform,
        ),
        ListTile(
          subtitle: const Text('Set back to actual platform'),
          trailing: FilledButton(
            onPressed: () {
              controller.setPlatform(defaultTargetPlatform);
            },
            child: const Text('Actual'),
          ),
          onTap: () {
            controller.setPlatform(defaultTargetPlatform);
          },
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
