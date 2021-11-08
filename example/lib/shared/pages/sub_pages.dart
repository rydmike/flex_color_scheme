import 'package:flutter/material.dart';

import '../widgets/universal/header_card.dart';
import 'splash_page_one.dart';
import 'splash_page_two.dart';
import 'subpage.dart';

/// All the sub pages wrapped in a header card.
class SubPages extends StatelessWidget {
  const SubPages({
    Key? key,
    this.command,
    this.initialOpen = true,
  }) : super(key: key);
  final HeaderCardCommand? command;
  final bool initialOpen;

  @override
  Widget build(BuildContext context) {
    return HeaderCard(
      command: command,
      initialOpen: initialOpen,
      title: const Text('Page Examples'),
      child: Column(
        children: <Widget>[
          ListTile(
            title: const Text('Sub page demo'),
            subtitle: const Text('Uses the same color scheme and theme'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Subpage.show(context);
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
              SplashPageOne.show(context, false);
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
              SplashPageOne.show(context, true);
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
              SplashPageTwo.show(context, true);
            },
          ),
        ],
      ),
    );
  }
}
