import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../const/app.dart';
import '../controllers/theme_controller.dart';
import '../utils/app_scroll_behavior.dart';
import '../widgets/app/about.dart';
import '../widgets/app/show_color_scheme_colors.dart';
import '../widgets/app/show_sub_theme_colors.dart';
import '../widgets/app/show_theme_data_colors.dart';
import '../widgets/universal/page_body.dart';
import '../widgets/universal/showcase_material.dart';
import '../widgets/universal/theme_mode_switch.dart';

// This sub page is used as a demo in the default example and in examples
// 4 and 5 to show a sub-page using the same FlexColorScheme based theme.
class SubpageDemo extends StatefulWidget {
  const SubpageDemo({this.controller, super.key});

  final ThemeController? controller;

  // A static convenience function show this screen, as pushed on top.
  static Future<void> show(BuildContext context,
      [ThemeController? controller]) async {
    await Navigator.of(context).push<Widget>(
      MaterialPageRoute<Widget>(
        builder: (BuildContext context) => SubpageDemo(controller: controller),
      ),
    );
  }

  @override
  State<SubpageDemo> createState() => _SubpageDemoState();
}

class _SubpageDemoState extends State<SubpageDemo> {
  int _buttonIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle headlineMedium = theme.textTheme.headlineMedium!;

    final EdgeInsets padding = MediaQuery.paddingOf(context);
    final double topPadding = padding.top + kToolbarHeight * 2;
    final double bottomPadding = padding.bottom + kBottomNavigationBarHeight;

    final Size size = MediaQuery.sizeOf(context);
    final bool isNarrow = size.width < App.phoneWidthBreakpoint;
    final double sideMargin = isNarrow ? 8 : App.edgeInsetsTablet;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: FlexColorScheme.themedSystemNavigationBar(
        context,
        systemNavBarStyle: widget.controller?.sysNavBarStyle ??
            FlexSystemNavBarStyle.background,
        useDivider: widget.controller?.useSysNavDivider ?? false,
        opacity: widget.controller?.sysNavBarOpacity ?? 1,
      ),
      child: DefaultTabController(
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
            child: ScrollConfiguration(
              behavior: const DragScrollBehavior(),
              child: ListView(
                primary: true,
                padding: EdgeInsets.fromLTRB(
                  sideMargin,
                  topPadding + App.edgeInsetsTablet,
                  sideMargin,
                  App.edgeInsetsTablet + bottomPadding,
                ),
                children: <Widget>[
                  Text('Subpage Demo', style: headlineMedium),
                  const Text(
                    'This screen shows an example page with the same '
                    'FlexColorScheme based ThemeData inherited theme being '
                    'used. It has a NavigationBar and a TabBar in the AppBar.',
                  ),
                  const SizedBox(height: 8),
                  if (widget.controller != null)
                    ListTile(
                      title: const Text('Theme mode'),
                      subtitle:
                          Text('Theme ${widget.controller!.themeMode.name}'),
                      trailing: ThemeModeSwitch(
                        themeMode: widget.controller!.themeMode,
                        onChanged: widget.controller!.setThemeMode,
                      ),
                      // Toggle theme mode also via the ListTile tap.
                      onTap: () {
                        if (theme.brightness == Brightness.light) {
                          widget.controller!.setThemeMode(ThemeMode.dark);
                        } else {
                          widget.controller!.setThemeMode(ThemeMode.light);
                        }
                      },
                    ),
                  const Divider(),
                  // Show all key active theme colors.
                  Text('Theme Colors', style: headlineMedium),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: App.edgeInsetsTablet),
                    child: ShowColorSchemeColors(),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: App.edgeInsetsTablet),
                    child: ShowThemeDataColors(),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: App.edgeInsetsTablet),
                    child: ShowSubThemeColors(),
                  ),
                  const Divider(),
                  Text('Theme Showcase', style: headlineMedium),
                  const ShowcaseMaterial(),
                ],
              ),
            ),
          ),
          bottomNavigationBar: NavigationBar(
            onDestinationSelected: (int value) {
              setState(() {
                _buttonIndex = value;
              });
            },
            selectedIndex: _buttonIndex,
            destinations: const <NavigationDestination>[
              NavigationDestination(
                icon: Icon(Icons.chat_bubble),
                label: 'Chat',
                tooltip: '',
              ),
              NavigationDestination(
                icon: Icon(Icons.beenhere),
                label: 'Tasks',
                tooltip: '',
              ),
              NavigationDestination(
                icon: Icon(Icons.create_new_folder),
                label: 'Archive',
                tooltip: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
