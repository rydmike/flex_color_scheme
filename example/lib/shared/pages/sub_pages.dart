import 'package:flutter/material.dart';

import '../widgets/universal/header_card.dart';
import 'splash_page_one.dart';
import 'splash_page_two.dart';
import 'subpage.dart';

/// All the sub demo pages wrapped in a header card.
class SubPagesDemo extends StatelessWidget {
  const SubPagesDemo({
    Key? key,
    this.isOpen = true,
    this.onTap,
  }) : super(key: key);
  final bool isOpen;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return HeaderCard(
      isOpen: isOpen,
      onTap: onTap,
      title: const Text('Page Examples'),
      child: Column(
        children: <Widget>[
          ListTile(
            title: const Text('Sub page example with all widgets'),
            subtitle: const Text('Uses the same color scheme and theme. '
                'However, widgets are presented on Scaffold with its themed '
                'background color. Tey are not in Cards like on this page. '
                'If you plan to place controls directly on the Scaffold '
                'surface, you should check this out. You might want to '
                'reduce the blend on your Scaffold in such a use case.'),
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
              SplashPageTwo.show(context);
            },
          ),
        ],
      ),
    );
  }
}
