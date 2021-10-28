import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../shared/all_shared_imports.dart';

// -----------------------------------------------------------------------------
// Home Page for EXAMPLE 5)
//
// The content of the HomePage below is not relevant for using FlexColorScheme
// based application theming. The critical parts are in the above MaterialApp
// theme definitions. The HomePage contains UI to visually show what the
// defined example looks like in an application and with commonly used Widgets.
// -----------------------------------------------------------------------------
class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ThemeController controller;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController scrollController;

  // The reason for example 5 using a stateful widget is that it holds the
  // state of the dummy side menu/rail locally. However, all state for the
  // application theme are in this example also held by the stateful MaterialApp
  // widget, and values are passed in and changed via ValueChanged callbacks.
  double _menuWidth = AppData.expandWidth;
  bool _isExpanded = true;

  // The state for the system navbar style and divider usage is local as it is
  // is only used by the AnnotatedRegion, not by FlexThemeData.
  //
  // Used to control system navbar style via an AnnotatedRegion.
  FlexSystemNavBarStyle _navBarStyle = FlexSystemNavBarStyle.background;
  // Used to control if we have a top divider on the system navigation bar.
  bool _useNavDivider = false;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData media = MediaQuery.of(context);
    final double topPadding =
        media.padding.top + kToolbarHeight + AppData.edgeInsets;
    final double bottomPadding = media.padding.bottom + AppData.edgeInsets;

    final bool menuCanOperate = media.size.width >= AppData.desktopBreakpoint;
    final bool isNarrow = media.size.width < AppData.phoneBreakpoint;
    final double sideMargin = isNarrow ? 8 : AppData.edgeInsets;

    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final TextStyle headline4 = textTheme.headline4!;

    // Give the width of the side panel some automatic responsive behavior and
    // make it rail sized when there is not enough room for a menu, even if
    // menu size is requested, and even remove rail on narrow phones.
    if (isNarrow) {
      _menuWidth = 0.01;
    } else {
      if (!menuCanOperate) {
        _menuWidth = AppData.collapseWidth;
      }
      if (menuCanOperate && !_isExpanded) {
        _menuWidth = AppData.collapseWidth;
      }
      if (menuCanOperate && _isExpanded) {
        _menuWidth = AppData.expandWidth;
      }
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      // FlexColorScheme contains a helper that can be use to theme
      // the system navigation bar using an AnnotatedRegion. Without this
      // page wrapper the system navigation bar in Android will not change
      // theme color as we change themes for the page. This is a
      // Flutter "feature", but with this annotated region we can have the
      // navigation bar follow desired background color and theme-mode,
      // which looks nicer and more as it should on an Android device.
      value: FlexColorScheme.themedSystemNavigationBar(
        context,
        systemNavBarStyle: _navBarStyle,
        useDivider: _useNavDivider,
        opacity: widget.controller.bottomNavigationBarOpacity,
      ),
      child: Row(
        children: <Widget>[
          // The dummy demo menu and side rail.
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: AppData.expandWidth),
            child: Material(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: _menuWidth,
                child: SideMenu(
                  maxWidth: AppData.expandWidth,
                  onTap: menuCanOperate
                      ? () {
                          setState(() {
                            _isExpanded = !_isExpanded;
                          });
                        }
                      : null,
                ),
              ),
            ),
          ),
          // The actual page content is a normal Scaffold.
          Expanded(
            child: Scaffold(
              extendBodyBehindAppBar: true,
              extendBody: true,
              appBar: AppBar(
                title: Text(AppData.title(context)),
                actions: const <Widget>[AboutIconButton()],
              ),
              body: PageBody(
                controller: scrollController,
                constraints:
                    const BoxConstraints(maxWidth: AppData.maxBodyWidth),
                child: ListView(
                  controller: scrollController,
                  padding: EdgeInsets.fromLTRB(
                    sideMargin,
                    topPadding,
                    sideMargin,
                    bottomPadding,
                  ),
                  children: <Widget>[
                    Text('FlexColorScheme', style: headline4),
                    const Text(
                      'In this example you can try all themes and almost '
                      'all features.\n\n'
                      'See how to surface blends and the app bar theme '
                      'options work. Try the true black option for dark '
                      'themes along with computed dark themes.\n\n'
                      'A dummy responsive side menu/rail is visible on '
                      'larger media. It is used to demonstrate the different '
                      'surface blends more clearly. '
                      'A widget showcase demonstrates theme impact on common '
                      'Material widgets.',
                    ),
                    const Divider(),
                    _Theme(controller: widget.controller),
                    _ModeOptions(controller: widget.controller),
                    _WidgetThemes(controller: widget.controller),
                    _SurfaceBlends(controller: widget.controller),
                    _AppBar(controller: widget.controller),
                    _BottomNavigation(
                      controller: widget.controller,
                      navBarStyle: _navBarStyle,
                      onNavBarStyle: (FlexSystemNavBarStyle value) {
                        setState(() {
                          _navBarStyle = value;
                        });
                      },
                      hasDivider: _useNavDivider,
                      onHasDivider: (bool value) {
                        setState(() {
                          _useNavDivider = value;
                        });
                      },
                    ),
                    const _SubPages(),
                    Text('Theme Showcase', style: headline4),
                    const ThemeShowcase(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Theme extends StatelessWidget {
  const _Theme({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    return RevealListTileCard(
      title: Text(
        'Theme',
        style: Theme.of(context).textTheme.headline6,
      ),
      closed: false,
      child: Column(
        children: <Widget>[
          ThemePopupMenu(
            schemeIndex: controller.schemeIndex,
            onChanged: controller.setSchemeIndex,
          ),
          // TODO(rydmike): Add the buttons list selector from FlexFold.
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: AppData.edgeInsets),
            child: ShowThemeColors(),
          ),
          const SizedBox(height: 8),
          ListTile(
            title: const Text('Mode'),
            subtitle: Text('Using ${controller.themeMode.toString().dotTail} '
                'mode'),
            trailing: ThemeModeSwitch(
              themeMode: controller.themeMode,
              onChanged: controller.setThemeMode,
            ),
            // Make it possible to toggle theme mode also via the ListTile.
            onTap: () {
              if (Theme.of(context).brightness == Brightness.light) {
                controller.setThemeMode(ThemeMode.dark);
              } else {
                controller.setThemeMode(ThemeMode.light);
              }
            },
          ),
          SwitchListTile.adaptive(
            title: const Text(
              'Use the theming features',
            ),
            subtitle: const Text(
              'Turn OFF to see Flutter default theming',
            ),
            value: controller.useFlexColorScheme,
            onChanged: controller.setUseFlexColorScheme,
          ),
        ],
      ),
    );
  }
}

class _ModeOptions extends StatelessWidget {
  const _ModeOptions({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;

    return RevealListTileCard(
      title: Text(
        'Mode options',
        style: Theme.of(context).textTheme.headline6,
      ),
      closed: true,
      child: Column(
        children: <Widget>[
          if (isLight)
            SwitchListTile.adaptive(
              title: const Text('Light mode color swap'),
              subtitle: const Text(
                'Swap primary and secondary colors',
              ),
              value: controller.swapLightColors,
              onChanged: controller.setSwapLightColors,
            )
          else
            SwitchListTile.adaptive(
              title: const Text('Dark mode color swap'),
              subtitle: const Text(
                'Swap primary and secondary colors',
              ),
              value: controller.swapDarkColors,
              onChanged: controller.setSwapDarkColors,
            ),
          AnimatedSwitchHide(
            showChild: !isLight,
            duration: const Duration(milliseconds: 300),
            child: Column(
              children: <Widget>[
                // Set dark mode to use true black!
                SwitchListTile.adaptive(
                  title: const Text('True black'),
                  subtitle: const Text(
                    'Ink black scaffold in all blend modes, '
                    'other backgrounds are darker too',
                  ),
                  value: controller.darkIsTrueBlack,
                  onChanged: controller.setDarkIsTrueBlack,
                ),
                // Set to make dark scheme lazily for light theme
                SwitchListTile.adaptive(
                  title: const Text('Compute dark theme'),
                  subtitle: const Text(
                    'Calculate from the light scheme, instead '
                    'of using a predefined dark scheme.',
                  ),
                  value: controller.useToDarkMethod,
                  onChanged: controller.setUseToDarkMethod,
                ),
                // White blend slider in a ListTile.
                AnimatedSwitchHide(
                  showChild: controller.useToDarkMethod,
                  child: ListTile(
                    title: Slider.adaptive(
                      max: 100,
                      divisions: 100,
                      label: controller.darkMethodLevel.toString(),
                      value: controller.darkMethodLevel.toDouble(),
                      onChanged: (double value) {
                        controller.setDarkMethodLevel(value.floor());
                      },
                    ),
                    trailing: Padding(
                      padding: const EdgeInsetsDirectional.only(end: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'LEVEL',
                            style: Theme.of(context).textTheme.caption,
                          ),
                          Text(
                            '${controller.darkMethodLevel} %',
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _WidgetThemes extends StatelessWidget {
  const _WidgetThemes({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    return RevealListTileCard(
      title: Text(
        'Widget themes',
        style: Theme.of(context).textTheme.headline6,
      ),
      closed: true,
      child: Column(
        children: <Widget>[
          SwitchListTile.adaptive(
            title: const Text('Use widget theming'),
            subtitle: const Text('Enable opinionated sub themes'),
            value: controller.useSubThemes,
            onChanged: controller.setUseSubThemes,
          ),
          AnimatedSwitchHide(
            showChild: controller.useSubThemes,
            child: Column(
              children: <Widget>[
                // AppBar elevation value in a ListTile.
                ListTile(
                  title: const Text('Corner border radius'),
                  subtitle: Slider.adaptive(
                    max: 30,
                    divisions: 30,
                    label: controller.cornerRadius.toStringAsFixed(0),
                    value: controller.cornerRadius,
                    onChanged: controller.setCornerRadius,
                  ),
                  trailing: Padding(
                    padding: const EdgeInsetsDirectional.only(end: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'dP',
                          style: Theme.of(context).textTheme.caption,
                        ),
                        Text(
                          controller.cornerRadius.toStringAsFixed(0),
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                SwitchListTile.adaptive(
                  title: const Text('Themed state effects'),
                  subtitle: const Text('Hover, focus, highlight and '
                      'splash use primary color'),
                  value: controller.themedEffects,
                  onChanged: controller.setThemedEffects,
                ),
                const Divider(height: 1),
                SwitchListTile.adaptive(
                  title: const Text(
                    'Input decorator with fill color',
                  ),
                  value: controller.inputDecoratorIsFilled,
                  onChanged: controller.setInputDecoratorIsFilled,
                ),
                SwitchListTile.adaptive(
                  title: const Text(
                    'Input decorator border style',
                  ),
                  subtitle: const Text(
                    'ON for outline   OFF for underline',
                  ),
                  value: controller.inputDecoratorIsOutlinedBorder,
                  onChanged: controller.setInputDecoratorIsOutlinedBorder,
                ),
                SwitchListTile.adaptive(
                  title: const Text(
                    'Unfocused decorator has border',
                  ),
                  // subtitle: const Text(
                  //   'ON for outline, OFF for underline.',
                  // ),
                  value: controller.inputDecoratorUnfocusedHasBorder,
                  onChanged: controller.setInputDecoratorUnfocusedHasBorder,
                ),
                const Divider(height: 1),
              ],
            ),
          ),
          // Tooltip theme style.
          Tooltip(
            message: 'A tooltip, on the tooltip style toggle',
            child: SwitchListTile.adaptive(
              title: const Text(
                'Tooltip brightness',
              ),
              subtitle: const Text(
                'ON Normal  OFF Inverted (Material style)',
              ),
              value: controller.tooltipsMatchBackground,
              onChanged: controller.setTooltipsMatchBackground,
            ),
          ),
        ],
      ),
    );
  }
}

class _SurfaceBlends extends StatelessWidget {
  const _SurfaceBlends({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final ThemeController controller;

  String explainMode(final FlexSurfaceMode mode) {
    switch (mode) {
      case FlexSurfaceMode.flat:
        return 'Flat\nAll surface colors at blend level (1x)';
      case FlexSurfaceMode.highBackground:
        return 'High background\nBackground (2x) Surface (1x) Scaffold (1/3x)';
      case FlexSurfaceMode.highSurface:
        return 'High surface\nSurface (2x) Background (1x) Scaffold (1/3x)';
      case FlexSurfaceMode.lowSurfaceHighScaffold:
        return 'Low surface, high scaffold\nSurface (1x) Background (2x) '
            'Scaffold (3x)\n'
            'When used, content is typically placed in Cards with '
            'less primary color blend';
      case FlexSurfaceMode.lowScaffold:
        return 'Low scaffold\nScaffold (1/3x) Surface and Background (1x)';
      case FlexSurfaceMode.highScaffold:
        return 'High scaffold\nScaffold (3x) Surface and Background (1x)\n'
            'When used, content is typically placed in Cards with '
            'less primary color blend';
      case FlexSurfaceMode.lowScaffoldVariantDialog:
        return 'Low scaffold\nScaffold (1/3x) Surface and Background (1x)\n'
            'Dialog background (1x) using secondary variant color';
      case FlexSurfaceMode.highScaffoldVariantDialog:
        return 'High scaffold\nScaffold (3x) Surface and Background (1x)\n'
            'Dialog background (1x) using secondary variant color';
      case FlexSurfaceMode.custom:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return RevealListTileCard(
      title: Text(
        'Surface blends',
        style: Theme.of(context).textTheme.headline6,
      ),
      closed: true,
      child: Column(
        children: <Widget>[
          const ListTile(
            title: Text('Blended surfaces and backgrounds'),
            isThreeLine: true,
            subtitle: Text(
              'Standard Material design use white and dark surface colors, '
              'but it also mentions using surfaces with different alpha '
              'blends. Typically you blend primary color into surface '
              'colors. This is supported by using blend mode and level.',
            ),
          ),
          ListTile(
            title: const Text('Blend mode'),
            subtitle: Text(explainMode(controller.surfaceMode)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SurfaceModeButtons(
                mode: controller.surfaceMode,
                onChanged: controller.setSurface,
              ),
              const SizedBox(width: 16),
            ],
          ),
          const ListTile(
            title: Text('Blend level'),
            subtitle: Text('Adjust the blend strength'),
          ),
          ListTile(
            title: Slider.adaptive(
              min: 0,
              max: 40,
              divisions: 40,
              label: controller.blendLevel.toString(),
              value: controller.blendLevel.toDouble(),
              onChanged: (double value) {
                controller.setBlendLevel(value.toInt());
              },
            ),
            trailing: Padding(
              padding: const EdgeInsetsDirectional.only(end: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'LEVEL',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Text(
                    '${controller.blendLevel}',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final ThemeController controller;

  String explainAppBarStyle(final FlexAppBarStyle style, final bool isLight) {
    switch (style) {
      case FlexAppBarStyle.primary:
        return isLight ? 'Primary color (Default)' : 'Primary color';
      case FlexAppBarStyle.material:
        return isLight
            ? 'Material guide white background color'
            : 'Material guide dark (#121212) background color (Default)';
      case FlexAppBarStyle.surface:
        return 'Surface, including its primary color alpha blend';
      case FlexAppBarStyle.background:
        return 'Background, including its primary color alpha blend';
      case FlexAppBarStyle.custom:
        return 'Built-in schemes use their secondary variant color as '
            'their custom AppBar color, but you can use any color';
    }
  }

  String explainTabStyle(final FlexTabBarStyle style) {
    switch (style) {
      case FlexTabBarStyle.forAppBar:
        return 'Style: forAppbar\n'
            'Works with used app bar style (Default)';
      case FlexTabBarStyle.forBackground:
        return 'Style: forBackground:\n'
            'Works on surface colors, like Scaffold, but '
            'also works on surface colored app bars';
      case FlexTabBarStyle.useDefault:
        return 'Style: useDefault\n'
            'Works on primary color in light mode, and '
            'background color in dark mode';
      case FlexTabBarStyle.universal:
        return 'Style: universal\n'
            'An experimental design intended to work anywhere, but has '
            'low contrast in some combinations. This '
            'style may be changed in future versions';
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;

    return RevealListTileCard(
      title: Text(
        'App bar',
        style: Theme.of(context).textTheme.headline6,
      ),
      closed: true,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 8),
          const ListTile(
            subtitle: Text(
              'Default Flutter themes use primary colored AppBar in light '
              'mode, and almost black in dark mode. Now you can select '
              'if it should be Primary, Material background, background or '
              'surface color, with their primary blends or a custom color. '
              'Predefined themes use their secondary variant color for '
              'custom AppBar color, but you can make it any color.',
            ),
          ),
          if (isLight) ...<Widget>[
            ListTile(
              isThreeLine: true,
              title: const Text('Light mode color'),
              subtitle: Text(
                explainAppBarStyle(controller.lightAppBarStyle, isLight),
              ),
            ),
            ListTile(
              trailing: AppBarStyleButtons(
                  style: controller.lightAppBarStyle,
                  onChanged: controller.setLightAppBarStyle,
                  // To access the custom color we defined for app bar, in this
                  // toggle buttons widget, we have to pass it in. It is not
                  // carried with the theme so we cannot get it from there in
                  // the widget. FlexColorScheme knows the color when
                  // you switch to it. This is just to be able to show the
                  // correct color on the 'custom' toggle button option. In our
                  // example we only actually have a custom color in the 1st
                  // custom color example named Toledo.
                  customAppBarColor: AppColor
                      .schemes[controller.schemeIndex].light.appBarColor),
            ),
          ] else ...<Widget>[
            ListTile(
              isThreeLine: true,
              title: const Text('Dark mode color'),
              subtitle: Text(
                explainAppBarStyle(controller.darkAppBarStyle, isLight),
              ),
            ),
            ListTile(
              trailing: AppBarStyleButtons(
                  style: controller.darkAppBarStyle,
                  onChanged: controller.setDarkAppBarStyle,
                  customAppBarColor: AppColor
                      .schemes[controller.schemeIndex].dark.appBarColor),
            ),
          ],
          SwitchListTile.adaptive(
            title: const Text(
              'One colored app bar on Android',
            ),
            subtitle: const Text(
              'ON   There is no scrim on the status bar\n'
              'OFF  Use default two toned style',
            ),
            value: controller.transparentStatusBar,
            onChanged: controller.setTransparentStatusBar,
          ),
          ListTile(
              title: const Text('Elevation'),
              subtitle: Slider.adaptive(
                max: 24,
                divisions: 48,
                label: controller.appBarElevation.toStringAsFixed(1),
                value: controller.appBarElevation,
                onChanged: controller.setAppBarElevation,
              ),
              trailing: Padding(
                padding: const EdgeInsetsDirectional.only(end: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'ELEV',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Text(
                      controller.appBarElevation.toStringAsFixed(1),
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )),
          const ListTile(
            title: Text('Opacity'),
            subtitle: Text(
              'Themed opacity. Try 85% to 98%',
            ),
          ),
          ListTile(
            title: Slider.adaptive(
              max: 100,
              divisions: 100,
              label: (controller.appBarOpacity * 100).toStringAsFixed(0),
              value: controller.appBarOpacity * 100,
              onChanged: (double value) {
                controller.setAppBarOpacity(value / 100);
              },
            ),
            trailing: Padding(
              padding: const EdgeInsetsDirectional.only(end: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'OPACITY',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Text(
                    '${(controller.appBarOpacity * 100).toStringAsFixed(0)}'
                    ' %',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const Divider(height: 1),
          const SizedBox(height: 8),
          ListTile(
            title: const Text('Tab bar'),
            subtitle: Text(
              'Choose a style that fits your intend usage.\n'
              '${explainTabStyle(controller.tabBarStyle)}',
            ),
          ),
          const SizedBox(height: 4),
          ListTile(
            trailing: TabBarStyleButtons(
              style: controller.tabBarStyle,
              onChanged: controller.setTabBarStyle,
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  const _BottomNavigation({
    Key? key,
    required this.controller,
    required this.navBarStyle,
    required this.onNavBarStyle,
    required this.hasDivider,
    required this.onHasDivider,
  }) : super(key: key);
  final ThemeController controller;

  final FlexSystemNavBarStyle navBarStyle;
  final ValueChanged<FlexSystemNavBarStyle> onNavBarStyle;

  final bool hasDivider;
  final ValueChanged<bool> onHasDivider;

  String explainStyle(final FlexSystemNavBarStyle style, final bool isLight) {
    switch (style) {
      case FlexSystemNavBarStyle.system:
        return isLight
            ? 'System, white with opacity in light mode'
            : 'System, black with opacity in dark mode';
      case FlexSystemNavBarStyle.surface:
        return 'Surface color, with opacity & alpha blend';
      case FlexSystemNavBarStyle.background:
        return 'Background color, with opacity & alpha blend';
      case FlexSystemNavBarStyle.scaffoldBackground:
        return 'Scaffold background, with opacity & alpha blend';
      case FlexSystemNavBarStyle.transparent:
        return 'Fully transparent regardless of opacity value';
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isLight = Theme.of(context).brightness == Brightness.light;
    return RevealListTileCard(
      title: Text(
        'Bottom navigation',
        style: Theme.of(context).textTheme.headline6,
      ),
      closed: true,
      child: Column(
        children: <Widget>[
          const ListTile(
            title: Text('Opacity'),
            subtitle: Text(
              'System navigation and bottom '
              'navigation bar opacity. They are separate parameters, but '
              'share input control value in this example',
            ),
          ),
          ListTile(
            title: Slider.adaptive(
              max: 100,
              divisions: 100,
              label: (controller.bottomNavigationBarOpacity * 100)
                  .toStringAsFixed(0),
              value: controller.bottomNavigationBarOpacity * 100,
              onChanged: (double value) {
                controller.setBottomNavigationBarOpacity(value / 100);
              },
            ),
            trailing: Padding(
              padding: const EdgeInsetsDirectional.only(end: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'OPACITY',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Text(
                    // ignore: lines_longer_than_80_chars
                    '${(controller.bottomNavigationBarOpacity * 100).toStringAsFixed(0)} %',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: const Text('Android system navigation bar'),
            subtitle: Text('FlexColorScheme.themedSystemNavigationBar\n'
                '${explainStyle(navBarStyle, isLight)}'),
          ),
          ListTile(
            trailing: SystemNavBarStyleButtons(
              style: navBarStyle,
              onChanged: onNavBarStyle,
            ),
          ),
          SwitchListTile.adaptive(
            title: const Text('System navigation bar divider'),
            subtitle: const Text('Recommend OFF, due to extra scrim'),
            value: hasDivider,
            onChanged: onHasDivider,
          ),
        ],
      ),
    );
  }
}

class _SubPages extends StatelessWidget {
  const _SubPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RevealListTileCard(
      title: Text(
        'Page examples',
        style: Theme.of(context).textTheme.headline6,
      ),
      closed: true,
      child: Column(
        children: <Widget>[
          ListTile(
            title: const Text('Open a demo subpage'),
            subtitle: const Text(
              'The subpage will use the same '
              'color scheme based theme automatically.',
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Subpage.show(context);
            },
          ),
          ListTile(
            title: const Text('Splash page demo 1a'),
            subtitle: const Text(
              'No scrim and normal status icons.\n'
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
              'No scrim and inverted status icons.\n'
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
              'No status icons or navigation bar.\n'
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
