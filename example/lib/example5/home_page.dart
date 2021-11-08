import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
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

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  // Scroll controller used to jump to stored scroll position, needed as a
  // workaround, to a workaround for issue with StaggeredGridView.
  late ScrollController scrollController;

  // Used to store listened to scroll position.
  double scrollPos = 0;
  // Current amount of shown columns in the grid view.
  int columns = 1;
  // Previous columns, when we last stored a scroll position.
  int prevColumns = 0;

  // Set command for cards open/close to none for all card groups
  HeaderCardCommand commandMain = HeaderCardCommand.none;
  HeaderCardCommand commandSettings = HeaderCardCommand.none;
  HeaderCardCommand commandThemed = HeaderCardCommand.none;

  // Must override wantKeepAlive, when using AutomaticKeepAliveClientMixin.
  @override
  bool get wantKeepAlive => true;

  void _scrollPosition() {
    scrollPos = scrollController.position.pixels;
    // debugPrint('ScrollPos listener pos = $scrollPos');
  }

  @override
  void didChangeDependencies() {
    // debugPrint('CALLED: didChangeDependencies');
    if (prevColumns != columns) {
      // debugPrint('Columns: $columns Previous: $prevColumns Pos: $scrollPos '
      //     'hasClients: ${scrollController.hasClients}');
      prevColumns = columns;
      if (scrollController.hasClients) scrollController.jumpTo(scrollPos);
    }
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(_scrollPosition);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant HomePage oldWidget) {
    // Set command for cards open/close to none for all card groups
    commandMain = HeaderCardCommand.none;
    commandSettings = HeaderCardCommand.none;
    commandThemed = HeaderCardCommand.none;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    // Must call super when using AutomaticKeepAliveClientMixin.
    super.build(context);

    // Set command for cards open/close to none for all card groups
    // HeaderCardCommand commandMain = HeaderCardCommand.none;
    // HeaderCardCommand commandSettings = HeaderCardCommand.none;
    // HeaderCardCommand commandThemed = HeaderCardCommand.none;

    // In dark mode?
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    // Short handle to the media query, used to get size and paddings.
    final MediaQueryData media = MediaQuery.of(context);
    // Paddings so content shows up visible area when we use Scaffold props
    // extendBodyBehindAppBar and extendBody.
    final double topPadding = media.padding.top + kToolbarHeight;
    final double bottomPadding = media.padding.bottom;

    // We are on phone width media, based on our definition in this app.
    final bool isPhone = media.size.width < AppData.phoneBreakpoint;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      // FlexColorScheme contains a static helper that can be use to theme
      // the system navigation bar using an AnnotatedRegion. Without this
      // wrapper the system navigation bar in Android will not change
      // color as we change themes for the page. This is normal Flutter
      // behavior. By using an annotated region with the helper function
      // FlexColorScheme.themedSystemNavigationBar, we can make the
      // navigation bar follow desired background color and theme-mode easily.
      // This looks much better and as it should on Android devices.
      // It also supports system navbar with opacity or fully transparent
      // Android system navigation bar on Android SDK >= 29.
      value: FlexColorScheme.themedSystemNavigationBar(
        context,
        systemNavBarStyle: widget.controller.navBarStyle,
        useDivider: widget.controller.useNavDivider,
        opacity: widget.controller.bottomNavigationBarOpacity,
      ),
      child: ResponsiveScaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        // Callback from menu, an item was clicked
        onSelect: (int index) async {
          // Open all cards
          if (index == 0) {
            setState(() {
              commandMain = HeaderCardCommand.open;
              commandSettings = HeaderCardCommand.open;
              commandThemed = HeaderCardCommand.open;
            });
          }
          // Close all cards
          if (index == 1) {
            setState(() {
              commandMain = HeaderCardCommand.close;
              commandSettings = HeaderCardCommand.close;
              commandThemed = HeaderCardCommand.close;
            });
          }
          // Open settings cards
          if (index == 2) {
            setState(() {
              commandSettings = HeaderCardCommand.open;
            });
          }
          // Close settings cards
          if (index == 3) {
            setState(() {
              commandSettings = HeaderCardCommand.close;
            });
          }
          // Open themed cards
          if (index == 4) {
            setState(() {
              commandThemed = HeaderCardCommand.open;
            });
          }
          // Close themed cards
          if (index == 5) {
            setState(() {
              commandThemed = HeaderCardCommand.close;
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
          if (index == 7) {
            if (isDark) {
              await widget.controller.setThemeMode(ThemeMode.light);
            } else {
              await widget.controller.setThemeMode(ThemeMode.dark);
            }
          }
        },
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          // Just a suitable breakpoint for when we want to have more
          // than one column in the body with this particular content.
          columns = constraints.maxWidth ~/ 810 + 1;

          // Flag used to hide some blend mode options that wont fit when
          // using toggle buttons on small media.
          final bool showAllBlends = constraints.maxWidth / columns > 445;
          // Make margins respond to media size and nr of columns.
          double margins = AppData.edgeInsetsPhone;
          if (!isPhone && columns == 1) margins = AppData.edgeInsetsTablet;
          if (columns >= 2) margins = AppData.edgeInsetsDesktop;
          if (columns >= 4) margins = AppData.edgeInsetsBigDesktop;

          // Without the value key below that changes when the amount of columns
          // updates, the StaggeredGridView or also the WaterfallFlow layout
          // does not work correctly. The issue appears related in both
          // packages, but end breaking style looks a bit different, but cause
          // is they, break when resizing media and columns change.
          // Issue:
          // https://github.com/letsar/flutter_staggered_grid_view/issues/138
          // https://github.com/letsar/flutter_staggered_grid_view/issues/167
          // This key causes another problem as it naturally causes a complete
          // rebuild when the key changes. Then w also  loose the layout
          // scroll position even with AutomaticKeepAliveClientMixin, so when
          // columns change/ we are always back at start of view, not good!
          // My temp hack for this was to listen to the used scroll controller
          // position, store its value in local state and jump to position it
          // last had, when dependencies changes and we also have a different
          // column count than we had before. It kind of works, but even with
          // jumpTo position, it is visible that it jumped to start and then
          // back again to where we were. Scroll position is tricky to keep
          // logical and right in this kind of layout when columns change.
          //
          // Regarding the layout issue, I have not found a Masonry or
          // Staggered grid lik view package that would be able to handle
          // this layout correctly. I'm beginning to wonder if the issue
          // might be at a lower layer in layout widget used by both
          // StaggeredGridView and WaterfallFlow. Using StaggeredGridView below
          // the usage with WaterfallFlow is very similar. The WaterfallFlow
          // seems to be a bit smoother/faster, but I got it to crash when doing
          // very quick resizing on desktop builds. StaggeredGridView is a tad
          // choppier, but so far it did not crash.
          //
          // For a WaterfallFlow implementation, import it and replace with
          // this until and including the itemBuilder row:
          //
          // return WaterfallFlow.builder(
          //   key: ValueKey<int>(columns),
          //   controller: scrollController,
          //   padding: EdgeInsets.fromLTRB(
          //     margins,
          //     topPadding + margins,
          //     margins,
          //     bottomPadding + margins,
          //   ),
          //   gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: columns,
          //     crossAxisSpacing: margins,
          //     mainAxisSpacing: margins,
          //   ),
          //   itemBuilder: (BuildContext context, int index) => <Widget>[
          //
          return StaggeredGridView.countBuilder(
            key: ValueKey<int>(columns),
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
            staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
            itemBuilder: (BuildContext context, int index) => <Widget>[
              HeaderCard(
                command: commandMain,
                title: const Text('FlexColorScheme Info'),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: const <Widget>[
                      Text(
                        'With this demo you can try all features and themes in '
                        'FlexColorScheme v4 (alpha1). Find a color scheme you '
                        'like, experiment with the new surface blend modes and '
                        'levels. See how the AppBar theme options work. '
                        'Try the true black option for dark '
                        'themes, along with computed dark themes.\n'
                        '\n'
                        "You can also turn FlexColorScheme's theming OFF "
                        'and see how a color scheme looks when using '
                        'standard Flutter ThemeData.from a ColorScheme.\n'
                        '\n'
                        'The new opinionated opt-in widget sub '
                        'theming is ON, you can turn it OFF and see the '
                        'differences. The sub theming defaults '
                        'mimics Material 3 (You), mostly on corner radius of '
                        'Widgets, but also TextTheme and its coloring.\n'
                        'This demo does not adjust any widget properties, the '
                        'theme is adjusted interactively and the Flutter '
                        ' widgets change as the theme is modified '
                        'via the controls.\n'
                        '\n'
                        'The theming impact on widgets is shown in expandable '
                        'cards with the "Themed" heading. The three first '
                        'themes are custom color schemes and are not built-in '
                        'choices. In the packages tutorial you learn how to '
                        'make your own custom Flutter color schemes and make '
                        'advanced themes with FlexColorScheme',
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
              //
              // The "Settings" Cards.
              _ThemeColors(
                controller: widget.controller,
                command: commandSettings,
              ),
              _ThemeMode(
                controller: widget.controller,
                command: commandSettings,
              ),
              _Platform(
                controller: widget.controller,
                command: commandSettings,
              ),
              _SurfaceBlends(
                controller: widget.controller,
                command: commandSettings,
                showAllBlends: showAllBlends,
              ),
              _SubThemes(
                controller: widget.controller,
                command: commandSettings,
              ),
              _TextField(
                controller: widget.controller,
                command: commandSettings,
              ),
              _AppBarSettings(
                controller: widget.controller,
                command: commandSettings,
              ),
              _TabBar(
                controller: widget.controller,
                command: commandSettings,
              ),
              _BottomNavigation(
                controller: widget.controller,
                command: commandSettings,
              ),
              SubPages(command: commandSettings),
              //
              // The "Themed" results Cards.
              _MaterialButtonsShowcase(command: commandThemed),
              _ToggleFabSwitchesChipsShowcase(command: commandThemed),
              _ListTileShowcase(command: commandThemed),
              _TimePickerDialogShowcase(command: commandThemed),
              _DatePickerDialogShowcase(command: commandThemed),
              _DialogShowcase(command: commandThemed),
              _MaterialAndBottomSheetShowcase(command: commandThemed),
              _CardShowcase(command: commandThemed),
              _TextThemeShowcase(command: commandThemed),
              _PrimaryTextThemeShowcase(command: commandThemed),
            ].elementAt(index),
            itemCount: 21,
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
              Navigator.of(context).pop(false);
            },
            child: const Text('CANCEL')),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text('RESET')),
      ],
      actionsPadding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }
}

class _ThemeColors extends StatelessWidget {
  const _ThemeColors({
    Key? key,
    required this.controller,
    this.command,
  }) : super(key: key);
  final ThemeController controller;
  final HeaderCardCommand? command;

  @override
  Widget build(BuildContext context) {
    return HeaderCard(
      command: command,
      title: const Text('Theme Colors'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
            child: ThemeSelector(controller: controller),
          ),
          ThemePopupMenu(
            schemeIndex: controller.schemeIndex,
            onChanged: controller.setSchemeIndex,
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ShowThemeColors(),
          ),
          const SizedBox(height: 8),
          SwitchListTile.adaptive(
            title: const Text(
              'Use FlexColorScheme theming features',
            ),
            subtitle: const Text(
              'Turn OFF to see Flutter default theming using these colors\n'
              'Most other settings have no impact when this is OFF',
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
    this.command,
  }) : super(key: key);
  final ThemeController controller;
  final HeaderCardCommand? command;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;

    return HeaderCard(
      command: command,
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
              title: const Text('Light mode swap colors'),
              subtitle: const Text(
                'Swap primary and secondary colors',
              ),
              value: controller.swapLightColors,
              onChanged: controller.setSwapLightColors,
            )
          else
            SwitchListTile.adaptive(
              title: const Text('Dark mode swap colors'),
              subtitle: const Text(
                'Swap primary and secondary colors',
              ),
              value: controller.swapDarkColors,
              onChanged: controller.setSwapDarkColors,
            ),
          AnimatedSwitchHide(
            showChild: controller.useSubThemes && controller.useFlexColorScheme,
            child: Column(
              children: <Widget>[
                if (isLight) ...<Widget>[
                  SwitchListTile.adaptive(
                    title: const Text('Light mode TextTheme is colored'),
                    value: controller.blendLightTextTheme,
                    onChanged: controller.setBlendLightTextTheme,
                  ),
                  SwitchListTile.adaptive(
                    title: const Text(
                        'Light mode onColor have a hint of its color'),
                    value: controller.blendLightOnColors,
                    onChanged: controller.setBlendLightOnColors,
                  )
                ] else ...<Widget>[
                  SwitchListTile.adaptive(
                    title: const Text('Dark mode TextTheme is colored'),
                    value: controller.blendDarkTextTheme,
                    onChanged: controller.setBlendDarkTextTheme,
                  ),
                  SwitchListTile.adaptive(
                    title: const Text(
                        'Dark mode onColor have a hint of its color'),
                    value: controller.blendDarkOnColors,
                    onChanged: controller.setBlendDarkOnColors,
                  )
                ],
              ],
            ),
          ),
          AnimatedSwitchHide(
            showChild: !isLight,
            duration: const Duration(milliseconds: 300),
            child: Column(
              children: <Widget>[
                // Set to make dark scheme lazily for light theme
                SwitchListTile.adaptive(
                  title: const Text('Compute dark theme'),
                  subtitle: const Text(
                    'Calculate from the light scheme, instead '
                    'of using a predefined dark scheme',
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

class _Platform extends StatelessWidget {
  const _Platform({
    Key? key,
    required this.controller,
    this.command,
  }) : super(key: key);
  final ThemeController controller;
  final HeaderCardCommand? command;

  @override
  Widget build(BuildContext context) {
    return HeaderCard(
      command: command,
      title: const Text('Platform'),
      child: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text('For testing you can change used platform. '
                'It changes some icons and widgets like Switches and Sliders, '
                'also font and platform mechanics, like '
                'scrolling behavior and acceleration. '
                'This setting is not persisted'),
          ),
          PlatformPopupMenu(
            platform: controller.platform,
            onChanged: controller.setPlatform,
          ),
          ListTile(
            title: const Text('Set to actual platform'),
            trailing: ElevatedButton(
              onPressed: () {
                controller.setPlatform(defaultTargetPlatform);
              },
              child: const Text('Actual'),
            ),
            onTap: () {
              controller.setPlatform(defaultTargetPlatform);
            },
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
    this.command,
    required this.showAllBlends,
  }) : super(key: key);
  final ThemeController controller;
  final HeaderCardCommand? command;
  final bool showAllBlends;

  String explainMode(final FlexSurfaceMode mode) {
    switch (mode) {
      case FlexSurfaceMode.flat:
        return 'Flat\nAll surface colors at blend level (1x)\n';
      case FlexSurfaceMode.highBackground:
        return 'High background, very low scaffold\n'
            'Background (3/2x) Surface (1x) Scaffold (1/3x)\n';
      case FlexSurfaceMode.highSurface:
        return 'High surface, very low scaffold\n'
            'Surface (3/2x) Background (1x) Scaffold (1/3x)\n';
      case FlexSurfaceMode.veryLowSurfaceHighScaffold:
        return 'Very low surface, high scaffold\n'
            'Surface & dialog (1/2x) Background (1x) Scaffold (3x)\n';
      case FlexSurfaceMode.lowSurfaceHighScaffold:
        return 'Low surface, Very high scaffold\n'
            'Surface (1x) Background (2x) Scaffold (3x)\n';
      case FlexSurfaceMode.lowScaffold:
        return 'Low scaffold\n'
            'Scaffold (1/3x) Surface and Background (1x)\n';
      case FlexSurfaceMode.highScaffold:
        return 'High scaffold\n'
            'Scaffold (3x) Surface and Background (1x)\n';
      case FlexSurfaceMode.lowScaffoldVariantDialog:
        return 'Low scaffold\n'
            'Scaffold (1/3x) Surface and Background (1x)\n'
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
    final bool isLight = Theme.of(context).brightness == Brightness.light;
    return HeaderCard(
      command: command,
      title: const Text('Surface Blends'),
      child: Column(
        children: <Widget>[
          const ListTile(
            title: Text('Blended surfaces and backgrounds'),
            isThreeLine: true,
            subtitle: Text(
              'Material 2 design use white and almost black surface colors. '
              'The guide mentions using surfaces with different alpha blends, '
              'by blending primary color into different surfaces. '
              'Blend mode and level does that',
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
                showAllModes: showAllBlends,
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
          // Set dark mode to use true black!
          if (isLight)
            SwitchListTile.adaptive(
              title: const Text('Plain white'),
              subtitle: const Text(
                'Plain white Scaffold in all blend modes, '
                'other surfaces becomes 8% lighter',
              ),
              value: controller.lightIsWhite,
              onChanged: controller.setLightIsWhite,
            )
          else
            SwitchListTile.adaptive(
              title: const Text('True black'),
              subtitle: const Text(
                'True black Scaffold in all blend modes, '
                'other surfaces becomes 8% darker',
              ),
              value: controller.darkIsTrueBlack,
              onChanged: controller.setDarkIsTrueBlack,
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
    this.command,
  }) : super(key: key);
  final ThemeController controller;
  final HeaderCardCommand? command;

  @override
  Widget build(BuildContext context) {
    return HeaderCard(
      command: command,
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
                SwitchListTile.adaptive(
                  title: const Text('Use Material 3 TextTheme'),
                  subtitle: const Text('ON to use M3 text styles\n'
                      'OFF to use M2 2018 text styles'),
                  value: controller.useTextTheme,
                  onChanged: controller.setUseTextTheme,
                ),
                SwitchListTile.adaptive(
                  title: const Text('Use Material 3 rounded corners'),
                  subtitle: const Text('ON to use M3 radius '
                      'on widgets\n'
                      'OFF to adjust radius on all widgets'),
                  value: controller.useDefaultRadius,
                  onChanged: controller.setUseDefaultRadius,
                ),
                AnimatedSwitchHide(
                  showChild: !controller.useDefaultRadius,
                  child: ListTile(
                    title: const Text('Border radius on all widgets'),
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
                ),
                SwitchListTile.adaptive(
                  title: const Text('Rounded corners on FloatingActionButton'),
                  subtitle: const Text('OFF removes Shape from FAB theme, '
                      'making it always use M2 circular style'),
                  value: controller.fabUseShape,
                  onChanged: controller.setFabUseShape,
                ),
                SwitchListTile.adaptive(
                  title: const Text('Themed state effects'),
                  subtitle: const Text('Hover, focus, highlight and '
                      'splash use primary color'),
                  value: controller.themedEffects,
                  onChanged: controller.setInteractionEffects,
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
                'Tooltip background',
              ),
              subtitle: const Text(
                'ON Normal  OFF Inverted',
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

class _TextField extends StatelessWidget {
  const _TextField({
    Key? key,
    required this.controller,
    this.command,
  }) : super(key: key);
  final ThemeController controller;
  final HeaderCardCommand? command;

  @override
  Widget build(BuildContext context) {
    return HeaderCard(
      command: command,
      title: const Text('TextField Settings'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 8),
          const ListTile(
            title: Text('Adjust TextField style'),
            subtitle: Text('When sub themes are enabled you can adjust the '
                'style of the TextField input via easy to use '
                'InputDecorator theme options'),
          ),
          AnimatedSwitchHide(
            showChild: controller.useSubThemes,
            child: Column(
              children: <Widget>[
                SwitchListTile.adaptive(
                  title: const Text(
                    'Field has fill color',
                  ),
                  value: controller.inputDecoratorIsFilled,
                  onChanged: controller.setInputDecoratorIsFilled,
                ),
                SwitchListTile.adaptive(
                  title: const Text(
                    'Border style',
                  ),
                  subtitle: const Text(
                    'ON for outline  OFF for underline',
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
                  title: const Text('Unfocused field has border'),
                  value: controller.inputDecoratorUnfocusedHasBorder,
                  onChanged: controller.setInputDecoratorUnfocusedHasBorder,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8),
            child: TextInputField(),
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
    this.command,
  }) : super(key: key);
  final ThemeController controller;
  final HeaderCardCommand? command;

  String explainAppBarStyle(final FlexAppBarStyle style, final bool isLight) {
    switch (style) {
      case FlexAppBarStyle.primary:
        return isLight ? 'Primary color - Default' : 'Primary color';
      case FlexAppBarStyle.material:
        return isLight
            ? 'White background'
            : 'Dark background (#121212) - Default';
      case FlexAppBarStyle.surface:
        return 'Surface, with primary color blend';
      case FlexAppBarStyle.background:
        return 'Background, with primary color blend';
      case FlexAppBarStyle.custom:
        return 'Built-in schemes use secondary variant color, '
            'but you can use any color';
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;

    return HeaderCard(
      command: command,
      title: const Text('AppBar Settings'),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 8),
          const ListTile(
            subtitle: Text(
              'Material themes favor primary colored AppBar in light '
              'mode, and almost black in dark mode. Here you can select '
              'Primary, Material background or background and surface color, '
              'with their primary blends or even a custom color',
            ),
          ),
          if (isLight) ...<Widget>[
            ListTile(
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
                  // example we only actually only have a custom app bar color
                  // in the 1st custom color example, and we wanted to be
                  // able to show it on the toggle button.
                  customAppBarColor: AppColor
                      .schemes[controller.schemeIndex].light.appBarColor),
            ),
          ] else ...<Widget>[
            ListTile(
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
            title: const Text('One colored AppBar on Android'),
            subtitle: const Text(
              'ON  No scrim on the top status bar\n'
              'OFF Default two toned status bar',
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
            ),
          ),
          const ListTile(
            title: Text('Opacity'),
            subtitle: Text('Themed opacity, try 85% to 98%'),
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
        ],
      ),
    );
  }
}

class _TabBar extends StatelessWidget {
  const _TabBar({
    Key? key,
    required this.controller,
    this.command,
  }) : super(key: key);
  final HeaderCardCommand? command;
  final ThemeController controller;

  String explainTabStyle(final FlexTabBarStyle style) {
    switch (style) {
      case FlexTabBarStyle.forAppBar:
        return 'Style: forAppbar\n'
            'Works with used app bar style, usually the one you want (Default)';
      case FlexTabBarStyle.forBackground:
        return 'Style: forBackground\n'
            'Works on surface colors, like Scaffold, but '
            'also works on surface colored app bars';
      case FlexTabBarStyle.flutterDefault:
        return 'Style: useDefault\n'
            'SDK default. Works on primary color in light mode, and '
            'background color in dark mode';
      case FlexTabBarStyle.universal:
        return 'Style: universal\n'
            'Experimental universal style, has '
            'low contrast. May change in future versions';
    }
  }

  @override
  Widget build(BuildContext context) {
    return HeaderCard(
      command: command,
      title: const Text('TabBar Settings'),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 8),
          ListTile(
            title: const Text('Choose TabBar style that fits your usage'),
            subtitle: Text(explainTabStyle(controller.tabBarStyle)),
          ),
          // const SizedBox(height: 4),
          ListTile(
            trailing: TabBarStyleButtons(
              style: controller.tabBarStyle,
              onChanged: controller.setTabBarStyle,
            ),
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TabBarForAppBarShowcase(),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TabBarForBackgroundShowcase(),
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
    this.command,
  }) : super(key: key);
  final ThemeController controller;
  final HeaderCardCommand? command;

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
    return HeaderCard(
      command: command,
      title: const Text('Bottom Navigation Settings'),
      child: Column(
        children: <Widget>[
          const ListTile(
            title: Text('Elevation'),
            subtitle: Text(
              'Bottom navigation bar elevation',
            ),
          ),
          ListTile(
            title: Slider.adaptive(
              max: 24,
              divisions: 48,
              label: controller.bottomNavigationBarElevation.toStringAsFixed(1),
              value: controller.bottomNavigationBarElevation,
              onChanged: controller.setBottomNavigationBarElevation,
            ),
            trailing: Padding(
              padding: const EdgeInsetsDirectional.only(end: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'ELEV',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Text(
                    controller.bottomNavigationBarElevation.toStringAsFixed(1),
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const ListTile(
            title: Text('Opacity'),
            subtitle: Text(
              'Bottom and system navigation bar opacity. Separate '
              'parameters, they only share input here',
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: BottomNavigationBarShowcase(),
          ),
          const Divider(),
          ListTile(
            title: const Text('Android system navigation bar'),
            subtitle: Text('Using themedSystemNavigationBar:\n'
                '${explainStyle(controller.navBarStyle, isLight)}'),
          ),
          ListTile(
            trailing: SystemNavBarStyleButtons(
              style: controller.navBarStyle,
              onChanged: controller.setNavBarStyle,
            ),
          ),
          SwitchListTile.adaptive(
            title: const Text('Android navigation bar divider'),
            subtitle: const Text('There is also an extra system built-in scrim '
                'on the nav bar when it is enabled'),
            value: controller.useNavDivider,
            onChanged: controller.setUseNavDivider,
          ),
        ],
      ),
    );
  }
}

class _MaterialButtonsShowcase extends StatelessWidget {
  const _MaterialButtonsShowcase({
    Key? key,
    this.command,
  }) : super(key: key);
  final HeaderCardCommand? command;

  @override
  Widget build(BuildContext context) {
    return HeaderCard(
      command: command,
      title: const Text('Themed Material Buttons'),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const ButtonShowcase(),
            const SizedBox(height: 8),
            const ButtonShowcase(enabled: false),
            const SizedBox(height: 8),
            const ButtonIconShowcase(),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text('Legacy buttons, deprecated',
                  style: Theme.of(context).textTheme.subtitle1),
            ),
            const LegacyButtonShowcase(),
            const LegacyButtonShowcase(enabled: false),
            const LegacyButtonIconShowcase(),
          ],
        ),
      ),
    );
  }
}

class _ToggleFabSwitchesChipsShowcase extends StatelessWidget {
  const _ToggleFabSwitchesChipsShowcase({
    Key? key,
    this.command,
  }) : super(key: key);
  final HeaderCardCommand? command;

  @override
  Widget build(BuildContext context) {
    return HeaderCard(
      command: command,
      title: const Text('Themed Buttons Switches and Chips'),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            ToggleFabIconButtonsShowcase(),
            CircleAvatarAndTooltipShowcase(),
            CheckboxShowcase(),
            ChipShowcase(),
          ],
        ),
      ),
    );
  }
}

class _ListTileShowcase extends StatelessWidget {
  const _ListTileShowcase({
    Key? key,
    this.command,
  }) : super(key: key);
  final HeaderCardCommand? command;

  @override
  Widget build(BuildContext context) {
    return HeaderCard(
      command: command,
      title: const Text('Themed ListTile'),
      child: const ListTileShowcase(),
    );
  }
}

class _TimePickerDialogShowcase extends StatelessWidget {
  const _TimePickerDialogShowcase({
    Key? key,
    this.command,
  }) : super(key: key);
  final HeaderCardCommand? command;

  @override
  Widget build(BuildContext context) {
    return HeaderCard(
      command: command,
      title: const Text('Themed TimePickerDialog'),
      child: const TimePickerDialogShowcase(),
    );
  }
}

class _DatePickerDialogShowcase extends StatelessWidget {
  const _DatePickerDialogShowcase({
    Key? key,
    this.command,
  }) : super(key: key);
  final HeaderCardCommand? command;

  @override
  Widget build(BuildContext context) {
    return HeaderCard(
      command: command,
      title: const Text('Themed DatePickerDialog'),
      child: const DatePickerDialogShowcase(),
    );
  }
}

class _DialogShowcase extends StatelessWidget {
  const _DialogShowcase({
    Key? key,
    this.command,
  }) : super(key: key);
  final HeaderCardCommand? command;

  @override
  Widget build(BuildContext context) {
    return HeaderCard(
      command: command,
      title: const Text('Themed Dialog'),
      child: const AlertDialogShowcase(),
    );
  }
}

class _MaterialAndBottomSheetShowcase extends StatelessWidget {
  const _MaterialAndBottomSheetShowcase({
    Key? key,
    this.command,
  }) : super(key: key);
  final HeaderCardCommand? command;

  @override
  Widget build(BuildContext context) {
    return HeaderCard(
      command: command,
      title: const Text('Themed Material'),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: MaterialAndBottomSheetShowcase(),
      ),
    );
  }
}

class _CardShowcase extends StatelessWidget {
  const _CardShowcase({
    Key? key,
    this.command,
  }) : super(key: key);
  final HeaderCardCommand? command;

  @override
  Widget build(BuildContext context) {
    return HeaderCard(
        command: command,
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
    this.command,
  }) : super(key: key);
  final HeaderCardCommand? command;

  @override
  Widget build(BuildContext context) {
    return HeaderCard(
      command: command,
      title: const Text('Themed TextTheme'),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: TextThemeShowcase(),
      ),
    );
  }
}

class _PrimaryTextThemeShowcase extends StatelessWidget {
  const _PrimaryTextThemeShowcase({
    Key? key,
    this.command,
  }) : super(key: key);
  final HeaderCardCommand? command;

  @override
  Widget build(BuildContext context) {
    return HeaderCard(
      color: Theme.of(context).colorScheme.primary,
      command: command,
      title: const Text('Themed PrimaryTextTheme'),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: PrimaryTextThemeShowcase(),
      ),
    );
  }
}
