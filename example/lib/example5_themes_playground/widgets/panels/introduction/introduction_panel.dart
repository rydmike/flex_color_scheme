import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
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

  static final Uri _fcsDocsPlaygroundHistory = Uri(
    scheme: 'https',
    host: 'docs.flexcolorscheme.com',
    path: 'playground_history',
  );

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle spanTextStyle = theme.textTheme.bodyMedium!
        .copyWith(color: theme.colorScheme.onSurfaceVariant);
    final TextStyle linkStyle = theme.textTheme.bodyMedium!.copyWith(
      color: theme.colorScheme.primary,
      fontWeight: FontWeight.bold,
    );
    final TextStyle spanSmallTextStyle = theme.textTheme.bodySmall!;
    final TextStyle linkSmallStyle = theme.textTheme.bodySmall!.copyWith(
      color: theme.colorScheme.primary,
      fontWeight: FontWeight.bold,
    );

    final EdgeInsetsGeometry listTilePadding = theme.useMaterial3
        ? const EdgeInsetsDirectional.only(
            start: 16.0, end: 24.0, top: 8, bottom: 8)
        : const EdgeInsets.symmetric(horizontal: 16, vertical: 8);

    // TODO(rydmike): Make one more review of the intro text.
    return Column(
      children: <Widget>[
        const SizedBox(height: 8),
        // Add more general info about the app here.
        // What it the Themes Playground?
        const ListTile(
          subtitle: Text(
            'Welcome to the FlexColorScheme Themes Playground. This is a '
            'tool to help you design and experiment with themes for your '
            'Flutter MaterialApp based applications. It uses '
            "FlexColorScheme, a package that extends Flutter's theming "
            'capabilities.\n'
            '\n'
            'With the Playground, you can interactively design your theme '
            'and see the changes in real-time. The Playground is a '
            'companion to the FlexColorScheme package, which you can use '
            'to apply the themes you design here to your Flutter MaterialApp.',
          ),
        ),
        Padding(
          padding: listTilePadding,
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'Check out the ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsDocs,
                  text: 'FlexColorScheme documentation site',
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
                  text: ' the Themes Playground, give it a go. It also '
                      'explains FlexColorScheme with tutorials, examples and '
                      'an API guide. Additionally it also contains general '
                      'Flutter theming guidance and advice.',
                ),
              ],
            ),
          ),
        ),
        const ListTile(
          subtitle: Text(
            'An interesting feature of this Playground is that it does NOT '
            'adjust any individual widget properties for its own styling. '
            "As you design your theme, this application's theme is also "
            'adjusted interactively and all Flutter '
            "widgets in it change, as the application's overall theme is "
            'modified.\n'
            '\n'
            'Material-3 and its complicated ColorScheme is fully supported '
            'and can be generated using built-in '
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
            'This app is responsive down to larger phone sizes, but is '
            'primarily intended to be used on web based desktop browsers, or '
            'even better, as a native Windows, Mac or Linux desktop app, '
            'where it shines.\n'
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
          title: Text('FlexColorScheme Theming'),
          subtitle: Text(
            'You can turn OFF FlexColorScheme to see what a '
            'theme looks like when using the vanilla Flutter '
            'ThemeData factory, using the same ColorScheme '
            'as shown when FlexColorScheme is active.',
          ),
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
          subtitle: const Text('The component themes are '
              'ON by default in the Playground, but OFF by default in '
              'the API. By using them you get pre-styled components that you '
              'can adjust further to your liking.'),
          value: controller.useSubThemes && controller.useFlexColorScheme,
          onChanged:
              controller.useFlexColorScheme ? controller.setUseSubThemes : null,
        ),
        const ListTile(
          subtitle: Text(
            'When you enable component themes in Material-3 mode, you get a '
            'mostly Material-3 default spec design. If you turn OFF '
            'Material-3 mode, by default you get a Material-2 theme that is '
            'heavily inspired by Material-3 design.',
          ),
        ),
        const ListTile(
          subtitle: Text(
            'Like Flutter, FlexColorScheme uses different '
            'theming defaults for properties in Material-3 and Material-2 '
            'mode. If a value has not been set, the Playground will show '
            'you what the default value is. When you toggle the mode, '
            'the value will change and show the default '
            'for the used mode. The Playground also shows what the default '
            'values are in Flutter SDK in both Material-3 and Material-2 '
            'mode, when FlexColorScheme or its sub-themes are not '
            'being used.',
          ),
        ),
        ListTile(
          subtitle: const Text(
            'Want to use the FlexColorScheme theme you configured here in '
            'your Flutter app? Then Copy the setup code, paste it into your '
            'Flutter app, import FlexColorScheme and your theme is done. '
            'What you see in the Themes Playground is what you get.',
          ),
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
        SwitchListTile(
          title: const Text('Material-3 Design'),
          subtitle: const Text(
              'Flutter SDK and FlexColorScheme use Material-3 design '
              'styled components by default. You can still turn it OFF '
              'and use Material-2 design, but it is not recommended.'),
          value: controller.useMaterial3,
          onChanged: controller.setUseMaterial3,
        ),
        const ListTile(
          title: Text('Material-2 Deprecation?'),
          subtitle: Text(
            'Legacy Material-2 support is still supported in Flutter 3.24 '
            'and FCS V8, but will be deprecated and eventually '
            'removed from the Flutter SDK and FCS code-base. If you still use '
            'Material-2, you should migrate your Flutter app to use '
            'Material-3 mode.\n'
            '\n'
            'If you prefer the Material-2 style, then with FlexColorScheme '
            'and the Themes Playground you can make a theme that is '
            'based on Material-3, but looks very close to Material-2. There '
            'is a premade design to demonstrate this in the '
            'Playground. The Material-2 design is perhaps not something '
            'to strive for anymore, but this demonstrates the flexibility '
            "of Material-3 design's theming in Flutter, and the powerful "
            'theming features available in the Themes Playground.',
          ),
        ),
        const Divider(),
        const ListTile(
          title: Text('Flutter Theming Issues'),
          subtitle: Text(
            'There are many known issues and theming '
            'limitations in Flutter. In the Themes Playground, you will '
            'find information about common known ones and theming limitations, '
            "presented next to each component's theme settings. "
            'The issues are presented in an info expand, like the one shown '
            'below. You can view it by clicking on the small info icon.',
          ),
        ),
        ListTileReveal(
          dense: true,
          title: const Text('Known issues'),
          subtitleReveal: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanSmallTextStyle,
                  text: 'Info about known theming issues in Flutter are '
                      'presented in component theme settings in this style. '
                      'You can also read more about Flutter '
                      'theming related issues in the FlexColorScheme docs. '
                      'Important Flutter theming issues are ',
                ),
                LinkTextSpan(
                  style: linkSmallStyle,
                  uri: _fcsFlutterIssues,
                  text: 'tracked here',
                ),
                TextSpan(
                  style: spanSmallTextStyle,
                  text: '.\n',
                ),
              ],
            ),
          ),
        ),
        const Divider(),
        const ListTile(
          title: Text('Disclaimer'),
          subtitle: Text(
            'The tools FlexColorScheme and Themes Playground are provided as '
            'is and no guarantees are made about their correctness, '
            'reliability or suitability for any purpose. The tools are '
            'provided for free and are open-source. They are developed as a '
            'hobby-side-project, corrections and new features are provided as '
            'time permits and at best effort.\n'
            '\n'
            'FlexColorScheme and Themes Playground are not '
            'official Google products and are not are not affiliated with '
            'the Flutter or Material teams at Google.\n'
            '\n'
            'The Playground is provided as a convenience tool to help you '
            'quickly design complex custom Material themes for your Flutter '
            'application, based on using the FlexColorScheme package as a '
            'theme factory that makes Material ThemeData. The Themes '
            'Playground was originally only designed and intended to '
            'be the last step in the FlexColorScheme usage tutorial, found as '
            'example-5. The Playground source is still provided as example-5 '
            'in the FlexColorScheme repo. Over time the Playground grew into '
            'more and became an interactive API configuration tool for '
            'FlexColorScheme.',
          ),
        ),
        Padding(
          padding: listTilePadding,
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: "Due the the Playground's original intent and purpose "
                      'it has a simple architecture that is not so well suited '
                      'to be developed into a direction that can provide all '
                      'the features users are currently asking for. You can '
                      'read more about the history and also future plans for '
                      'the Playground in the ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsDocsPlaygroundHistory,
                  text: 'documentation site here',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: '.',
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
