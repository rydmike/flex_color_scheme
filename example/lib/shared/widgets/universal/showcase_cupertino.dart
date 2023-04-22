// ignore_for_file: comment_references

import 'package:flutter/cupertino.dart';

// TODO(rydmike): Add a showcase to show most Cupertino widgets.
// This is a preparation for adding a ColorScheme mapper for Cupertino theme.

/// Used to show the current theme on Cupertino widgets.
///
/// Use this widget to review your theme's impact on [ThemeData] and see
/// how it looks with different Cupertino widgets.
///
/// The sub widgets used in this theme show case can also be used on their
/// own, for example combined in smaller panels instead of in on big column
/// like here.
///
/// These are all Flutter "Universal" Widgets that only depends on the SDK and
/// all the Widgets in this file be dropped into any application. They are
/// however not so useful, unless all you really want to do is to show what
/// Flutter Widgets look like.
class ShowcaseCupertino extends StatelessWidget {
  const ShowcaseCupertino({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 8),
        CupertinoButtonShowcase(),
      ],
    );
  }
}

class CupertinoButtonShowcase extends StatelessWidget {
  const CupertinoButtonShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8,
      runSpacing: 8,
      children: <Widget>[
        CupertinoButton(
          child: const Text('CupertinoButton'),
          onPressed: () {},
        ),
        CupertinoButton.filled(
          child: const Text('CupertinoButton filled'),
          onPressed: () {},
        ),
      ],
    );
  }
}
