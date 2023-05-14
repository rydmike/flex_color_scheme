import 'package:flutter/material.dart';

import '../controllers/theme_controller.dart';
import 'splash_page_one.dart';
import 'splash_page_two.dart';
import 'subpage.dart';

/// All the sub demo pages wrapped in a header card.
class PageExamples extends StatelessWidget {
  const PageExamples({this.controller, super.key});

  final ThemeController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 8),
        ListTile(
          title: const Text('Example sub page with all widgets'),
          subtitle: const Text(
            'Uses active ColorScheme and Theme. '
            'Widgets are presented on Scaffold with its themed '
            'background color, they are not in Cards like in this app.',
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () async {
            await SubpageDemo.show(context, controller);
          },
        ),
        ListTile(
          title: const Text('Splash page demo 1a'),
          subtitle: const Text(
            'No scrim and normal status icons\n'
            'Using themedSystemNavigationBar (noAppBar:true)',
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () async {
            await SplashPageOne.show(context, false);
          },
        ),
        ListTile(
          title: const Text('Splash page demo 1b'),
          subtitle: const Text(
            'No scrim and inverted status icons\n'
            'Using themedSystemNavigationBar (noAppBar:true, '
            'invertStatusIcons:true)',
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () async {
            await SplashPageOne.show(context, true);
          },
        ),
        ListTile(
          title: const Text('Splash page demo 2'),
          subtitle: const Text(
            'No status icons or navigation bar\n'
            'Using setEnabledSystemUIMode',
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () async {
            await SplashPageTwo.show(context);
          },
        ),
      ],
    );
  }
}
