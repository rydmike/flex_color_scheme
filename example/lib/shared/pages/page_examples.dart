import 'dart:async';

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
          title: const Text('Sub page example with all widgets'),
          subtitle: const Text('Uses the same color scheme and theme. '
              'However, widgets are presented on Scaffold with its themed '
              'background color. They are not in Cards like on this page. '
              'If you plan to place controls directly on the Scaffold '
              'surface, you should check this out. You might want to '
              'reduce the blend on your Scaffold in such a use case.'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            unawaited(SubpageDemo.show(context, controller));
          },
        ),
        ListTile(
          title: const Text('Splash page demo 1a'),
          subtitle: const Text(
            'No scrim and normal status icons\n'
            'Using themedSystemNavigationBar (noAppBar:true)',
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            unawaited(SplashPageOne.show(context, false));
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
          onTap: () {
            unawaited(SplashPageOne.show(context, true));
          },
        ),
        ListTile(
          title: const Text('Splash page demo 2'),
          subtitle: const Text(
            'No status icons or navigation bar\n'
            'Using setEnabledSystemUIMode',
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            unawaited(SplashPageTwo.show(context));
          },
        ),
      ],
    );
  }
}
