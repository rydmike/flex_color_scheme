import 'package:flutter/material.dart';

import '../const/app_data.dart';
import '../widgets/app/about.dart';
import '../widgets/universal/page_body.dart';
import '../widgets/universal/show_theme_colors.dart';
import '../widgets/universal/theme_showcase.dart';

// This sub page is used as a demo in the default example and in examples
// 4 and 5 to show a sub-page using the same FlexColorScheme based theme.
class Subpage extends StatefulWidget {
  const Subpage({Key? key}) : super(key: key);

  // A static convenience function show this screen, as pushed on top.
  static Future<void> show(BuildContext context) async {
    await Navigator.of(context).push<Widget>(
      MaterialPageRoute<Widget>(
        builder: (BuildContext context) => const Subpage(),
      ),
    );
  }

  @override
  _SubpageState createState() => _SubpageState();
}

class _SubpageState extends State<Subpage> {
  int _buttonIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final TextStyle headline4 = textTheme.headline4!;

    final MediaQueryData media = MediaQuery.of(context);
    final double topPadding = media.padding.top + kToolbarHeight * 2;
    final double bottomPadding =
        media.padding.bottom + kBottomNavigationBarHeight;

    final bool isNarrow = media.size.width < AppData.phoneBreakpoint;
    final double sideMargin = isNarrow ? 8 : AppData.edgeInsetsTablet;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        // For scrolling behind the app bar.
        extendBodyBehindAppBar: true,
        // For scrolling behind the bottom nav bar, if there is one.
        extendBody: true,
        appBar: AppBar(
          title: const Text('Subpage Demo'),
          actions: const <Widget>[AboutIconButton()],
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(text: 'Home'),
              Tab(text: 'Feed'),
              Tab(text: 'Settings'),
            ],
          ),
        ),
        body: PageBody(
          child: ListView(
            padding: EdgeInsets.fromLTRB(
              sideMargin,
              topPadding + AppData.edgeInsetsTablet,
              sideMargin,
              AppData.edgeInsetsTablet + bottomPadding,
            ),
            children: <Widget>[
              Text('Subpage Demo', style: headline4),
              const Text(
                'This screen shows an example page with the same '
                'FlexColorScheme based inherited theme being used. '
                'It also has a BottomNavigationBar and TabBar in the AppBar.',
              ),
              const Divider(),
              // Show all key active theme colors.
              Text('Theme Colors', style: headline4),
              const Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppData.edgeInsetsTablet),
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
              // API still only on Master channel
              // tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.beenhere),
              label: 'Tasks',
              // API still only on Master channel
              // tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.create_new_folder),
              label: 'Archive',
              // API still only on Master channel
              // tooltip: '',
            ),
          ],
        ),
      ),
    );
  }
}
