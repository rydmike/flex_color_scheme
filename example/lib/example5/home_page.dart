import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../shared/all_shared_imports.dart';

// -----------------------------------------------------------------------------
// Home Page for EXAMPLE 5 - Themes Playground
//
// The content of the HomePage below is not relevant for using FlexColorScheme
// based application theming. The critical parts are in the above MaterialApp
// theme definitions. The HomePage contains UI to visually show what the
// defined example looks like in an application and with commonly used Widgets.
//
// That said there is some interesting stuff going one here! :)
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

  // Used to control system navbar style via an AnnotatedRegion that uses
  // FlexColorScheme.themedSystemNavigationBar.
  FlexSystemNavBarStyle navBarStyle = FlexSystemNavBarStyle.background;
  // Used to control if we have a top divider on the system navigation bar.
  bool useNavDivider = false;

  // Previous amount of used columns in the layout, used to auto close when
  // going one column and open when going multi column.
  int prevColumns = 0;

  // Set expand/collapse state for main Card.
  bool collapseMain = false;

  // Set expand/collapse state for all settings Cards.
  bool collapseSettings = true;

  // Set expand/collapse state for all themed result Cards.
  bool collapseThemed = false;

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
    // Short handle to the media query, used to get size and paddings.
    final MediaQueryData media = MediaQuery.of(context);
    // Paddings so content shows up visible area when we use Scaffold props
    // extendBodyBehindAppBar and extendBody.
    final double topPadding = media.padding.top + kToolbarHeight;
    final double bottomPadding = media.padding.bottom;

    // // We are on desktop width media, based on our definition in this app.
    // final bool isDesktop = media.size.width >= AppData.desktopBreakpoint;

    // We are on phone width media, based on our definition in this app.
    final bool isPhone = media.size.width < AppData.phoneBreakpoint;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      // FlexColorScheme contains a static helper that can be use to theme
      // the system navigation bar using an AnnotatedRegion. Without this
      // wrapper the system navigation bar in Android will not change
      // theme color as we change themes for the page. This is normal Flutter
      // behavior. By using an annotated region with the helper function
      // FlexColorScheme.themedSystemNavigationBar, we can make the
      // navigation bar follow desired background color and theme-mode.
      // This looks much better and as it should on Android devices.
      // It also supports system navbar with opacity or fully transparent
      // Android system navigation bar on Android SDK >= 29.
      value: FlexColorScheme.themedSystemNavigationBar(
        context,
        systemNavBarStyle: navBarStyle,
        useDivider: useNavDivider,
        opacity: widget.controller.bottomNavigationBarOpacity,
      ),
      child: ResponsiveScaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        // Callback from menu, an item was clicked
        onSelect: (int index) async {
          // Toggle all cards
          if (index == 0) {
            setState(() {
              collapseMain = false;
              collapseSettings = false;
              collapseThemed = false;
            });
          }
          // Collapse all cards
          if (index == 1) {
            setState(() {
              collapseMain = true;
              collapseSettings = true;
              collapseThemed = true;
            });
          }
          // Expand settings cards
          if (index == 2) {
            setState(() {
              collapseSettings = false;
            });
          }
          // Collapse settings cards
          if (index == 3) {
            setState(() {
              collapseSettings = true;
            });
          }
          // Expand themed cards
          if (index == 4) {
            setState(() {
              collapseThemed = false;
            });
          }
          // Collapse themed cards
          if (index == 5) {
            setState(() {
              collapseThemed = true;
            });
          }
          // Reset theme settings.
          if (index == 6) {
            final bool? reset = await showDialog<bool?>(
              context: context,
              builder: (BuildContext context) {
                return const _RestSettingsDialog();
              },
            );
            if (reset ?? false) {
              await widget.controller.resetAllToDefaults();
            }
          }
        },
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          // Just a suitable breakpoint for when we want to have more
          // than one column in the body with this particular content.
          final int columns = constraints.maxWidth ~/ 780 + 1;
          if (prevColumns != columns) {
            if (columns == 1) collapseSettings = true;
            if (columns >= 2) collapseSettings = false;
            prevColumns = columns;
          }
          // Make margins respond to media size and nr of columns.
          double margins = AppData.edgeInsetsPhone;
          if (!isPhone && columns == 1) margins = AppData.edgeInsetsTablet;
          if (columns >= 2) margins = AppData.edgeInsetsDesktop;
          if (columns >= 4) margins = AppData.edgeInsetsBigDesktop;

          return StaggeredGridView.countBuilder(
            controller: scrollController,
            crossAxisCount: columns,
            mainAxisSpacing: margins,
            crossAxisSpacing: margins,
            padding: EdgeInsets.fromLTRB(
              margins,
              topPadding + margins,
              margins,
              bottomPadding + margins,
            ),
            staggeredTileBuilder: (int index) {
              // To make some RevealListTileCard panels below use more columns
              // we can do this:
              // if (index == 2) return const StaggeredTile.fit(2);
              return const StaggeredTile.fit(1);
            },
            itemBuilder: (BuildContext context, int index) => <Widget>[
              RevealListTileCard(
                isClosed: collapseMain,
                title: const Text('FlexColorScheme'),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 8),
                      const Text(
                        'In this example you can try all themes and '
                        'features. Experiment with surface blends and see '
                        'how the app bar theme options work. '
                        'Try the true black option for dark '
                        'themes along with computed dark themes.\n\n'
                        'A responsive side menu/rail is used to visually '
                        'demonstrate the different surface blends. '
                        'The impact on Flutter SDK Material widgets is shown '
                        'in expandable cards with the "Themed" heading.',
                      ),
                      const SizedBox(height: 16),
                      ThemeSelector(controller: widget.controller),
                    ],
                  ),
                ),
              ),
              //
              // The "Settings" Cards.
              _ThemeColors(
                controller: widget.controller,
                isClosed: collapseSettings,
              ),
              _ThemeMode(
                controller: widget.controller,
                isClosed: collapseSettings,
              ),
              _WidgetThemes(
                controller: widget.controller,
                isClosed: collapseSettings,
              ),
              _SurfaceBlends(
                controller: widget.controller,
                isClosed: collapseSettings,
              ),
              _AppBarSettings(
                controller: widget.controller,
                isClosed: collapseSettings,
              ),
              _BottomNavigation(
                controller: widget.controller,
                isClosed: collapseSettings,
                navBarStyle: navBarStyle,
                onNavBarStyle: (FlexSystemNavBarStyle value) {
                  setState(() {
                    navBarStyle = value;
                  });
                },
                hasDivider: useNavDivider,
                onHasDivider: (bool value) {
                  setState(() {
                    useNavDivider = value;
                  });
                },
              ),
              _SubPages(isClosed: collapseSettings),
              //
              // The "Themed" results Cards.
              _ButtonsShowcase(isClosed: collapseThemed),
              _InputShowcase(isClosed: collapseThemed),
              _ThemeBarsShowcase(isClosed: collapseThemed),
              _ListTileShowcase(isClosed: collapseThemed),
              _TimePickerDialogShowcase(isClosed: collapseThemed),
              _DatePickerDialogShowcase(isClosed: collapseThemed),
              _AlertDialogShowcase(isClosed: collapseThemed),
              _BottomSheetAndMaterialShowcase(isClosed: collapseThemed),
              _CardShowcase(isClosed: collapseThemed),
              _TextThemeShowcase(isClosed: collapseThemed),
            ].elementAt(index),
            itemCount: 18,
          );
        }),
      ),
    );
  }
}

class _RestSettingsDialog extends StatelessWidget {
  const _RestSettingsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Reset Theme Settings'),
      content: const Text('Reset all settings back to their default values?\n'
          'Persisted theme settings will also be updated '
          'to default values.'),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text('RESET')),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('CANCEL')),
      ],
      actionsPadding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }
}

class _ThemeColors extends StatelessWidget {
  const _ThemeColors({
    Key? key,
    required this.controller,
    this.isClosed = false,
  }) : super(key: key);
  final ThemeController controller;
  final bool isClosed;

  @override
  Widget build(BuildContext context) {
    return RevealListTileCard(
      isClosed: isClosed,
      title: const Text('Theme Colors'),
      child: Column(
        children: <Widget>[
          ThemePopupMenu(
            schemeIndex: controller.schemeIndex,
            onChanged: controller.setSchemeIndex,
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: AppData.edgeInsetsTablet),
            child: ShowThemeColors(),
          ),
          const SizedBox(height: 8),
          SwitchListTile.adaptive(
            title: const Text(
              'Use FlexColorScheme theming features',
            ),
            subtitle: const Text(
              'Turn OFF to see Flutter default theming with selected '
              'color scheme',
            ),
            value: controller.useFlexColorScheme,
            onChanged: controller.setUseFlexColorScheme,
          ),
        ],
      ),
    );
  }
}

class _ThemeMode extends StatelessWidget {
  const _ThemeMode({
    Key? key,
    required this.controller,
    this.isClosed = false,
  }) : super(key: key);
  final ThemeController controller;
  final bool isClosed;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;

    return RevealListTileCard(
      isClosed: isClosed,
      title: const Text('Theme Mode'),
      child: Column(
        children: <Widget>[
          ListTile(
            title: const Text('Theme mode'),
            subtitle: Text('Mode ${controller.themeMode.toString().dotTail}'),
            trailing: ThemeModeSwitch(
              themeMode: controller.themeMode,
              onChanged: controller.setThemeMode,
            ),
            // Toggle theme mode also via the ListTile tap.
            onTap: () {
              if (Theme.of(context).brightness == Brightness.light) {
                controller.setThemeMode(ThemeMode.dark);
              } else {
                controller.setThemeMode(ThemeMode.light);
              }
            },
          ),
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
    this.isClosed = false,
  }) : super(key: key);
  final ThemeController controller;
  final bool isClosed;

  @override
  Widget build(BuildContext context) {
    return RevealListTileCard(
      isClosed: isClosed,
      title: const Text('Sub Theme Settings'),
      child: Column(
        children: <Widget>[
          SwitchListTile.adaptive(
            title: const Text('Use sub theming'),
            subtitle: const Text('Enable opinionated widget sub themes'),
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
                  value: controller.inputDecoratorIsOutlinedBorder ==
                      FlexInputBorderType.outline,
                  onChanged: (bool isOn) {
                    if (isOn) {
                      controller.setInputDecoratorBorderType(
                          FlexInputBorderType.outline);
                    } else {
                      controller.setInputDecoratorBorderType(
                          FlexInputBorderType.underline);
                    }
                  },
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
    this.isClosed = false,
  }) : super(key: key);
  final ThemeController controller;
  final bool isClosed;

  String explainMode(final FlexSurfaceMode mode) {
    switch (mode) {
      case FlexSurfaceMode.flat:
        return 'Flat\nAll surface colors at blend level (1x)\n';
      case FlexSurfaceMode.highBackground:
        return 'High background\nBackground (2x) Surface (1x) '
            'Scaffold (1/3x)\n';
      case FlexSurfaceMode.highSurface:
        return 'High surface\nSurface (2x) Background (1x) Scaffold (1/3x)\n';
      case FlexSurfaceMode.lowSurfaceHighScaffold:
        return 'Low surface, high scaffold\nSurface (1x) Background (2x) '
            'Scaffold (3x)\n';
      case FlexSurfaceMode.lowScaffold:
        return 'Low scaffold\nScaffold (1/3x) Surface and Background (1x)\n';
      case FlexSurfaceMode.highScaffold:
        return 'High scaffold\nScaffold (3x) Surface and Background (1x)\n';
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
      isClosed: isClosed,
      title: const Text('Surface Blends'),
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
                onChanged: controller.setSurfaceMode,
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
              max: 50,
              divisions: 50,
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

class _AppBarSettings extends StatelessWidget {
  const _AppBarSettings({
    Key? key,
    required this.controller,
    this.isClosed = false,
  }) : super(key: key);
  final ThemeController controller;
  final bool isClosed;

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
        return 'Style: forBackground\n'
            'Works on surface colors, like Scaffold, but '
            'also works on surface colored app bars';
      case FlexTabBarStyle.useDefault:
        return 'Style: useDefault\n'
            'Works on primary color in light mode, and '
            'background color in dark mode';
      case FlexTabBarStyle.universal:
        return 'Style: universal\n'
            'Experimental design intended to work anywhere, has '
            'low contrast in some combinations. This '
            'style may change in future versions';
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;

    return RevealListTileCard(
      isClosed: isClosed,
      title: const Text('AppBar Settings'),
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
            title: const Text('One colored app bar on Android'),
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
            subtitle: Text('Themed opacity. Try 85% to 98%'),
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
    this.isClosed = false,
  }) : super(key: key);
  final ThemeController controller;

  final FlexSystemNavBarStyle navBarStyle;
  final ValueChanged<FlexSystemNavBarStyle> onNavBarStyle;

  final bool hasDivider;
  final ValueChanged<bool> onHasDivider;
  final bool isClosed;

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
      isClosed: isClosed,
      title: const Text('Bottom Navigation Settings'),
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
  const _SubPages({
    Key? key,
    this.isClosed = false,
  }) : super(key: key);
  final bool isClosed;

  @override
  Widget build(BuildContext context) {
    return RevealListTileCard(
      isClosed: isClosed,
      title: const Text('Page Examples'),
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

class _ButtonsShowcase extends StatelessWidget {
  const _ButtonsShowcase({
    Key? key,
    this.isClosed = false,
  }) : super(key: key);
  final bool isClosed;

  @override
  Widget build(BuildContext context) {
    return RevealListTileCard(
      isClosed: isClosed,
      title: const Text('Themed Buttons'),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const IconButtonShowcase(),
            const ButtonsShowcase(),
            const ButtonsShowcase(enabled: false),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text('Legacy buttons deprecated',
                  style: Theme.of(context).textTheme.headline6),
            ),
            const LegacyButtonShowcase(),
            const LegacyButtonShowcase(enabled: false),
          ],
        ),
      ),
    );
  }
}

class _InputShowcase extends StatelessWidget {
  const _InputShowcase({
    Key? key,
    this.isClosed = false,
  }) : super(key: key);
  final bool isClosed;

  @override
  Widget build(BuildContext context) {
    return RevealListTileCard(
      isClosed: isClosed,
      title: const Text('Themed Inputs'),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            ChipShowcase(),
            CheckboxShowcase(),
            TextInputField(),
          ],
        ),
      ),
    );
  }
}

class _ThemeBarsShowcase extends StatelessWidget {
  const _ThemeBarsShowcase({
    Key? key,
    this.isClosed = false,
  }) : super(key: key);
  final bool isClosed;

  @override
  Widget build(BuildContext context) {
    return RevealListTileCard(
      isClosed: isClosed,
      title: const Text('Themed Bars'),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const <Widget>[
            TabBarForAppBarShowcase(),
            TabBarForBackgroundShowcase(),
            BottomNavigationBarShowcase(),
          ],
        ),
      ),
    );
  }
}

class _ListTileShowcase extends StatelessWidget {
  const _ListTileShowcase({
    Key? key,
    this.isClosed = false,
  }) : super(key: key);
  final bool isClosed;

  @override
  Widget build(BuildContext context) {
    return RevealListTileCard(
      isClosed: isClosed,
      title: const Text('Themed ListTile'),
      child: const ListTileShowcase(),
    );
  }
}

class _TimePickerDialogShowcase extends StatelessWidget {
  const _TimePickerDialogShowcase({
    Key? key,
    this.isClosed = false,
  }) : super(key: key);
  final bool isClosed;

  @override
  Widget build(BuildContext context) {
    return RevealListTileCard(
      isClosed: isClosed,
      title: const Text('Themed TimePickerDialog'),
      child: const TimePickerDialogShowcase(),
    );
  }
}

class _DatePickerDialogShowcase extends StatelessWidget {
  const _DatePickerDialogShowcase({
    Key? key,
    this.isClosed = false,
  }) : super(key: key);
  final bool isClosed;

  @override
  Widget build(BuildContext context) {
    return RevealListTileCard(
      isClosed: isClosed,
      title: const Text('Themed DatePickerDialog'),
      child: const DatePickerDialogShowcase(),
    );
  }
}

class _AlertDialogShowcase extends StatelessWidget {
  const _AlertDialogShowcase({
    Key? key,
    this.isClosed = false,
  }) : super(key: key);
  final bool isClosed;

  @override
  Widget build(BuildContext context) {
    return RevealListTileCard(
      isClosed: isClosed,
      title: const Text('Themed Dialog'),
      child: const _RestSettingsDialog(),
    );
  }
}

class _BottomSheetAndMaterialShowcase extends StatelessWidget {
  const _BottomSheetAndMaterialShowcase({
    Key? key,
    this.isClosed = false,
  }) : super(key: key);
  final bool isClosed;

  @override
  Widget build(BuildContext context) {
    return RevealListTileCard(
      isClosed: isClosed,
      title: const Text('Themed Material'),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: BottomSheetAndMaterialShowcase(),
      ),
    );
  }
}

class _CardShowcase extends StatelessWidget {
  const _CardShowcase({
    Key? key,
    this.isClosed = false,
  }) : super(key: key);
  final bool isClosed;

  @override
  Widget build(BuildContext context) {
    return RevealListTileCard(
        isClosed: isClosed,
        title: const Text('Themed Card'),
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: CardShowcase(),
        ));
  }
}

class _TextThemeShowcase extends StatelessWidget {
  const _TextThemeShowcase({
    Key? key,
    this.isClosed = false,
  }) : super(key: key);
  final bool isClosed;

  @override
  Widget build(BuildContext context) {
    return RevealListTileCard(
      isClosed: isClosed,
      title: const Text('Themed TextTheme'),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: TextThemeShowcase(),
      ),
    );
  }
}
