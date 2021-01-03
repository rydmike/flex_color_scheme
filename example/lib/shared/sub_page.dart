import 'package:flutter/material.dart';

import '../all_shared_imports.dart';
// It is not necessary to review or understand the code in this file in order
// to understand how to use the FlexColorScheme package demonstrated in
// the examples.

// This sub page is used as a demo in Examples 4 and 5 to show a sub-page
// using the same FlexColorScheme based theme.
class SubPage extends StatefulWidget {
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
  _SubPageState createState() => _SubPageState();
}

class _SubPageState extends State<SubPage> {
  int _buttonIndex;

  @override
  void initState() {
    super.initState();
    _buttonIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final TextStyle headline4 = textTheme.headline4;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sub-page Demo'),
          elevation: 0,
          actions: const <Widget>[AboutIconButton()],
          bottom: const TabBar(
            // indicatorColor: Colors.white,
            // indicatorWeight: 5,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.star), text: 'Feed'),
              Tab(icon: Icon(Icons.face), text: 'Profile'),
              Tab(icon: Icon(Icons.settings), text: 'Settings'),
            ],
          ),
        ),
        body: PageBody(
          child: ListView(
            padding: const EdgeInsets.all(AppConst.edgePadding),
            children: <Widget>[
              Text('Sub-page demo', style: headline4),
              const Text(
                'This page just shows another example page with the same '
                'FlexColorScheme based theme applied when you open a sub-page. '
                'It also has a BottomNavigationBar and TabBar in the AppBar.',
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
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int value) {
            setState(() {
              _buttonIndex = value;
            });
          },
          currentIndex: _buttonIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble),
              label: 'Chat',
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.beenhere),
              label: 'Tasks',
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.create_new_folder),
              label: 'Archive',
              tooltip: '',
            ),
          ],
        ),
      ),
    );
  }
}
