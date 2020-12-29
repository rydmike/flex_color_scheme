import 'package:flutter/material.dart';

import '../all_shared_imports.dart';
// It is not necessary to review or understand the code in this file in order
// to understand how to use the FlexColorScheme package demonstrated in
// the examples.

// This sub page is used as a demo in Examples 4 and 5 to show a sub-page
// using the same FlexColorScheme based theme.
class SubPage extends StatelessWidget {
  const SubPage({Key key}) : super(key: key);

  // A static convenience function to show this page as a modal screen.
  static Future<void> show(BuildContext context) async {
    await Navigator.of(context).push<Widget>(
      MaterialPageRoute<Widget>(
        builder: (BuildContext context) => const SubPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final TextStyle headline4 = textTheme.headline4;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sub-page Demo'),
        elevation: 0,
        actions: const <Widget>[AboutIconButton()],
      ),
      body: PageBody(
        child: ListView(
          padding: const EdgeInsets.all(AppConst.edgePadding),
          children: <Widget>[
            Text('Sub-page demo', style: headline4),
            const Text(
              'This page just shows another example page with the same '
              'FlexColorScheme based theme applied when you open a sub-page. ',
            ),
            const Divider(),
            // Show all key active theme colors.
            Text('Theme colors', style: headline4),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: AppConst.edgePadding),
              child: ShowThemeColors(),
            ),
            const Divider(),
            Text('Theme Showcase', style: headline4),
            const ThemeShowcase(),
          ],
        ),
      ),
    );
  }
}
