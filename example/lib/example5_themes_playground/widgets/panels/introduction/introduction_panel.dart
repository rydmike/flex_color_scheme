import 'package:flutter/material.dart';

import '../../../../shared/const/app.dart';
import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../dialogs/show_copy_setup_code_dialog.dart';

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
    final TextStyle linkStyle =
        App.notoSansBold.copyWith(color: theme.colorScheme.primary);

    final EdgeInsetsGeometry listTilePadding = theme.useMaterial3
        ? const EdgeInsetsDirectional.only(
            start: 16.0, end: 24.0, top: 8, bottom: 8)
        : const EdgeInsets.symmetric(horizontal: 16, vertical: 8);

    return Column(
      children: <Widget>[
        const SizedBox(height: 8),
        Padding(
          padding: listTilePadding,
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'Check out the FlexColorScheme ',
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
                  text: ' this Playground, give it a read. It not '
                      'only explains this application and FlexColorScheme API, '
                      'with tutorial examples and an API guide, it also '
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
            "widgets in it change as the application's overall theme is "
            'modified interactively.\n'
            '\n'
            'Material-3 ColorScheme is supported and can be '
            'generated using built-in '
            'scheme colors as ColorScheme seed keys. Like when using '
            'ColorScheme.fromSeed, you can use the primary color as seed key. '
            'You can also include secondary and tertiary colors as key colors '
            'to generate your '
            'Material-3 ColorScheme. You can customize the tonal palette '
            'generation parameters. For branding purposes you can lock '
            'selected main colors to their defined input values, while '
            'less significant colors are seed generated.\n'
            '\n'
            'The theming settings and their impact on widgets are shown in '
            'widget topic panels. There is also a theme simulator where you '
            'can see your configured theme using a few sample apps, including '
            'the Flutter official Material-3 demo app. You can try these apps '
            'on many different mock devices.\n'
            '\n'
            'This app has two different modes with different layouts. '
            'The default one is a page view, '
            'where you see one, or in wider screens, two selectable topics '
            'at a time. The second screen is a '
            'large masonry grid view, where you can see many topics at once '
            'when using very large screens. You can open and close topics to '
            'view more or fewer of them at the same time. '
            'This app is responsive down to phone sizes, but is primarily '
            'intended to be used on web based desktop browsers, or as a '
            'native Windows, Mac or Linux desktop app, where it shines.\n'
            '\n'
            'The first three color sets in the app are example custom color '
            'schemes. They are not built-in choices in the package. In the '
            'package tutorial you learn how to make your own custom color '
            'schemes and turn them into advanced themes with FlexColorScheme. '
            'The last color scheme is customizable, you can modify it as '
            'desired and also copy any existing scheme to it as a starting '
            'point for your own color definitions.\n'
            '\n'
            'All settings in this demo are persisted locally and can be reset '
            'back to default values at any time. Feel free to experiment with '
            'interesting theme styles. If you get lost in options, just reset '
            'and start again.',
          ),
        ),
        const Divider(),
        const ListTile(
          title: Text('FlexColorScheme theming'),
          subtitle: Text('You can turn OFF FlexColorScheme to see what a '
              'theme looks like when using the vanilla Flutter '
              'ThemeData factory, using the same ColorScheme '
              'as shown when FlexColorScheme is active.'),
        ),
        SwitchListTile(
          subtitle: const Text(
            "Turn OFF too see Flutter's standard "
            'theming using the same colors. Component themes are also '
            'disabled when FlexColorScheme is OFF.',
          ),
          value: controller.useFlexColorScheme,
          onChanged: controller.setUseFlexColorScheme,
        ),
        SwitchListTile(
          subtitle: const Text('The opinionated component sub-theming '
              'is ON by default in the Playground, but OFF by default in '
              'the API. By using them you get pre-styled components that you '
              'can adjust further.'),
          value: controller.useSubThemes && controller.useFlexColorScheme,
          onChanged:
              controller.useFlexColorScheme ? controller.setUseSubThemes : null,
        ),
        const ListTile(
          subtitle: Text(
            'When you enable component sub-themes you get an only slightly '
            'opinionated Material-3 default setup. If you turn OFF Material-3, '
            'you get a Material-2 theme that is inspired by Material-3, '
            'without using the "useMaterial3" toggle in ThemeData. All widgets '
            'are then M2 based, you can still give them colors from the M3 '
            'ColorScheme and also use M3 style seeded ColorScheme. ',
          ),
        ),
        const ListTile(
          subtitle: Text('Like Flutter, FlexColorScheme uses different '
              'theming defaults for properties in M2 and M3 mode. '
              'If a value has not been set, the Playground will show you what '
              'the default value is. When you toggle M2/M3 the value will '
              'change and show the default '
              'for the used mode. The Playground also shows what the default '
              'values are in Flutter SDK in both M2 and M3 mode, when '
              'FlexColorScheme or its sub-themes are not being used.'),
        ),
        ListTile(
          subtitle: const Text(
              'Want to use the FlexColorScheme theme you configured here in '
              'your Flutter app? Then Copy the setup code, paste it into your '
              'Flutter app, import FlexColorScheme and your theme is done. '
              'What you see in the Themes Playground is what you get.'),
          trailing: FilledButton(
            onPressed: controller.useFlexColorScheme
                ? () async {
                    await showCopySetupCodeDialog(context, controller);
                  }
                : null,
            child: const Text('Code'),
          ),
          onTap: controller.useFlexColorScheme
              ? () async {
                  await showCopySetupCodeDialog(context, controller);
                }
              : null,
        ),
        const Divider(),
        const ListTile(
          title: Text('Material-3 will be made default'),
          subtitle: Text('Flutter SDK will be switching to using M3 by default '
              'later during 2023, even when not setting the '
              '"ThemeData.useMaterial3" flag to true. After that point, '
              'if you intend to use Material-2, you have to '
              'explicitly opt-out of using Material-3 by setting the '
              'flag to false. In anticipation of this change, the '
              'Themes Playground code gen now always generates the code '
              'config for selected Material M2/M3 mode to always make it clear '
              'what the intent is.'),
        ),
        SwitchListTile(
          title: const Text('Use Material-3 design'),
          value: controller.useMaterial3,
          onChanged: controller.setUseMaterial3,
        ),
        const ListTile(
          title: Text('Material-2 will be deprecated'),
          subtitle: Text(
              'Another coming big change is the deprecation of Material-2 '
              'and eventual removal of it from the Flutter SDK '
              'code-base. If you use M2, you might want to consider migrating '
              'to M3 soonish. Incidentally, with FlexColorScheme and '
              'Themes Playground, you can  make a theme that is '
              'based on Material-3, but looks like Material-2. There '
              'is even a premade design to demonstrate this in the '
              'Playground. As such the M2 design is probably not something '
              'to strive for anymore, but this demonstrates the flexibility '
              'of Material-3 design in Flutter, and the powerful theming '
              'features in the Themes Playground.'),
        ),
        const ListTile(
          title: Text('Flutter SDK Material 3 Issues'),
          subtitle: Text('In Flutter 3.7 and later there are only minor issues '
              'left when using Material-3. The issues have a very low impact '
              'on apps using Material-3. '
              'FlexColorScheme is able to work around and fix some of '
              'the issues. In Flutter 3.3 and earlier, there are significant '
              'issues related to enabling and using Material-3. Do not use '
              'Material-3 with Flutter 3.3 or earlier. For the best '
              'experience when using Material-3, prefer using Flutter 3.10 '
              'or later.'),
        ),
        Padding(
          padding: listTilePadding,
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'You can read more about M3 and Flutter theming '
                      'related issues in the FlexColorScheme docs, where '
                      'Flutter theming issues are ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsFlutterIssues,
                  text: 'tracked',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: '. Due to the large number of issues and also '
                      'incomplete state of Material-3 implementation in '
                      'Flutter 3.3 and earlier, do not use '
                      'M3 with Flutter 3.3 or earlier versions. '
                      'However, in Flutter 3.7 or later versions, M3 is '
                      'ready and can be used in production. Some M3 '
                      'fidelity and specification compliance issues still '
                      'exist, even in 3.10 and later. Even if there are '
                      'quite a large number of issues, they are typically '
                      'minor and will be fixed in later releases. Many are '
                      'fixed in master channel and some already in beta '
                      'channel, waiting for next stable release after 3.10.\n',
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
