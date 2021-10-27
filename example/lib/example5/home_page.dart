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
    final bool menuHide = media.size.width < AppData.phoneBreakpoint;

    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final TextStyle headline4 = textTheme.headline4!;

    // Give the width of the side panel some automatic responsive behavior and
    // make it rail sized when there is not enough room for a menu, even if
    // menu size is requested, and even remove rail on narrow phones.
    if (menuHide) {
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
                    AppData.edgeInsets,
                    topPadding,
                    AppData.edgeInsets,
                    bottomPadding,
                  ),
                  children: <Widget>[
                    Text('Theme', style: headline4),
                    const Text(
                      'This example shows how you can use all the built in '
                      'color schemes in FlexColorScheme to define themes '
                      'from them and how you can make your own custom '
                      'scheme colors and use them together with the '
                      'predefined ones.\n\n'
                      'The example also shows how to use the surface '
                      'branding feature and the app bar theme '
                      'options in FlexColorScheme. The usage of the '
                      'true black option for dark themes is also '
                      'demonstrated.\n\n'
                      'The example includes a dummy responsive side menu and '
                      'rail, to give a visual example of what applications '
                      'that have larger visible surfaces using surface '
                      'branding may look like. '
                      'A theme showcase widget shows the active theme with '
                      'several common Material widgets.\n',
                    ),
                    _ThemeColors(controller: widget.controller),
                    _ModeOptions(controller: widget.controller),
                    _SubThemes(controller: widget.controller),
                    _SurfaceBlends(controller: widget.controller),
                    _AppBarStyle(controller: widget.controller),
                    _BottomNavBars(
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
                    const Divider(),
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

class _ThemeColors extends StatelessWidget {
  const _ThemeColors({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    return RevealListTileCard(
      title: Text(
        'Theme colors',
        style: Theme.of(context).textTheme.headline6,
      ),
      closed: false,
      child: Column(
        children: <Widget>[
          ThemePopupMenu(
            schemeIndex: controller.schemeIndex,
            onChanged: controller.setSchemeIndex,
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: AppData.edgeInsets),
            child: ShowThemeColors(),
          ),
          const SizedBox(height: 8),
          ListTile(
            title: const Text('Theme mode'),
            subtitle: Text('Using theme mode '
                '${controller.themeMode.toString().dotTail}'),
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
              'Use FlexColorScheme theming',
            ),
            subtitle: const Text(
              'Turn OFF to use default ThemeData and see the difference.',
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
              title: const Text('Light mode swap colors'),
              subtitle: const Text(
                'Turn ON to swap primary and secondary colors.',
              ),
              value: controller.swapLightColors,
              onChanged: controller.setSwapLightColors,
            )
          else
            SwitchListTile.adaptive(
              title: const Text('Dark mode swap colors'),
              subtitle: const Text(
                'Turn ON to swap primary and secondary colors.',
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
                    'Makes scaffold background black in all surface blends and '
                    'other backgrounds much darker. Keep OFF for normal '
                    'dark mode.',
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

class _SubThemes extends StatelessWidget {
  const _SubThemes({
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
            subtitle: const Text('Turn ON to enable opinionated widget '
                'theming.'),
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
                      'splash use primary color.'),
                  value: controller.themedEffects,
                  onChanged: controller.setThemedEffects,
                ),
                const Divider(height: 1),
                SwitchListTile.adaptive(
                  title: const Text(
                    'Input decorator has fill color',
                  ),
                  value: controller.inputDecoratorIsFilled,
                  onChanged: controller.setInputDecoratorIsFilled,
                ),
                SwitchListTile.adaptive(
                  title: const Text(
                    'Input decorator border style',
                  ),
                  subtitle: const Text(
                    'ON for outline, OFF for underline.',
                  ),
                  value: controller.inputDecoratorIsOutlinedBorder,
                  onChanged: controller.setInputDecoratorIsOutlinedBorder,
                ),
                SwitchListTile.adaptive(
                  title: const Text(
                    'Unfocused input decorator has border',
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
                'Tooltips are light on light, and dark on dark',
              ),
              subtitle: const Text(
                "Keep OFF to use Material's default inverted "
                'background style.',
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
        return 'Flat: All surface and background colors at blend level (1x)';
      case FlexSurfaceMode.highBackground:
        return 'High background: Background (2x) Surface (1x) Scaffold (1/4x)';
      case FlexSurfaceMode.highSurface:
        return 'High surface: Surface (2x) Background (1x) Scaffold (1/4x)';
      case FlexSurfaceMode.lowSurfaceHighScaffold:
        return 'Low surface, high scaffold: Surface (1x) Background (2x) '
            'Scaffold (4x)';
      case FlexSurfaceMode.lowScaffold:
        return 'Low scaffold: Scaffold (1/3x) Surface and Background (1x)';
      case FlexSurfaceMode.highScaffold:
        return 'High scaffold: Scaffold (3x) Surface and Background (1x)\n'
            'When used, scaffold content is typically placed on Cards with '
            'less primary color blend.';
      case FlexSurfaceMode.lowScaffoldVariantDialog:
        return 'Low scaffold: Scaffold (1/3x) Surface and Background (1x)\n'
            'Dialog background (1x) using secondary variant color';
      case FlexSurfaceMode.highScaffoldVariantDialog:
        return 'High scaffold: Scaffold (3x) Surface and Background (1x)\n'
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
            title: Text('Alpha blended surfaces and backgrounds'),
            isThreeLine: true,
            subtitle: Text(
              'Default Material design uses white and dark background colors. '
              'With FlexColorScheme you can adjust the primary color '
              'alpha blend strategy used to blend primary color into surface '
              'and background colors.',
            ),
          ),
          ListTile(
            title: const Text('Surface blend mode'),
            subtitle: Text(explainMode(controller.surfaceMode)),
          ),
          ListTile(
            trailing: SurfaceModeButtons(
              mode: controller.surfaceMode,
              onChanged: controller.setSurface,
            ),
          ),
          const ListTile(
            title: Text('Alpha blend level'),
            subtitle: Text(
              'Adjust the alpha level of the color blending',
            ),
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

class _AppBarStyle extends StatelessWidget {
  const _AppBarStyle({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final ThemeController controller;

  String explainAppBarStyle(final FlexAppBarStyle style, final bool isLight) {
    switch (style) {
      case FlexAppBarStyle.primary:
        return isLight ? 'Use primary color. (Default)' : 'Use primary color.';
      case FlexAppBarStyle.material:
        return isLight
            ? 'Use Material guide light white background color.'
            : 'Use Material guide dark (#121212) background color. (Default)';
      case FlexAppBarStyle.surface:
        return 'Use surface color including its primary color alpha blend.';
      case FlexAppBarStyle.background:
        return 'Use background color including its primary color alpha blend.';
      case FlexAppBarStyle.custom:
        return 'Built-in schemes use their secondary variant color as custom '
            'color choice, but you can make it any color.';
    }
  }

  String explainTabStyle(final FlexTabBarStyle style) {
    switch (style) {
      case FlexTabBarStyle.forAppBar:
        return 'Themed to fit chosen FlexColorScheme AppBar style in both '
            'dark and light mode. Typically the one you want. (Default)';
      case FlexTabBarStyle.forBackground:
        return 'Themed to fit background color, eg on Scaffold. Also works '
            'well on background colored AppBars.';
      case FlexTabBarStyle.useDefault:
        return 'Flutter SDK default. Works on primary color in light mode, and '
            'background color in dark mode.';
      case FlexTabBarStyle.universal:
        return 'Universal style. Experimental feature, the '
            'style may change in the future. Has low contrast on some theme '
            'combinations.';
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;

    return RevealListTileCard(
      title: Text(
        'AppBar style',
        style: Theme.of(context).textTheme.headline6,
      ),
      closed: true,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 8),
          const ListTile(
            subtitle: Text(
              'Flutter SDK ColorScheme based themes have a primary '
              'colored AppBar in light mode, and a Material guide background '
              'colored one in dark mode. With FlexColorScheme you can choose '
              'if it should be primary color, Material guide background color, '
              'blended background or surface color or even a custom color. '
              'The predefined schemes use their secondary variant color as '
              'the custom color for the AppBar color, but it can be any color.',
            ),
          ),
          if (isLight) ...<Widget>[
            ListTile(
              title: const Text('Light mode AppBar background color'),
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
              title: const Text('Dark mode AppBar background color'),
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
              'One toned AppBar with transparent status bar',
            ),
            subtitle: const Text(
              'If ON there is no scrim on the status bar. '
              'Turn OFF for normal two toned AppBar on Android.',
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
                      'ELEVATE',
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
            title: Text('Background opacity'),
            subtitle: Text(
              'Set themed AppBar opacity, typically 85% to 98% works well.',
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
            title: const Text('TabBar theme'),
            subtitle: Text(
              'Choose the style that fit best with where you primarily intend '
              'to use your TabBars.\n'
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

class _BottomNavBars extends StatelessWidget {
  const _BottomNavBars({
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

  @override
  Widget build(BuildContext context) {
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
              'Used by system navigation bar and themed bottom '
              'navigation bar opacity. They are different '
              'parameters, but share setting in this example.',
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
          const Divider(height: 1),
          const ListTile(
            title: Text('Android system navigation bar style'),
            subtitle: Text(
              'Styled with annotated region. System is white '
              'in light theme and black in dark. '
              'Others use their respective theme '
              'color. Transparent shows background with system '
              'navigation buttons on background.\n',
            ),
          ),
          ListTile(
            title: const Text('Style'),
            trailing: SystemNavBarStyleButtons(
              style: navBarStyle,
              onChanged: onNavBarStyle,
            ),
          ),
          SwitchListTile.adaptive(
            title: const Text('System navigation bar has divider'),
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
              'Using setEnabledSystemUIOverlays([])',
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
