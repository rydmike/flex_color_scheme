import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../shared/const/app_color.dart';
import '../shared/const/app_data.dart';
import '../shared/controllers/theme_controller.dart';
import '../shared/pages/sub_pages.dart';
import '../shared/widgets/app/responsive_scaffold.dart';
import '../shared/widgets/universal/animated_switch_hide.dart';
import '../shared/widgets/universal/header_card.dart';
import '../shared/widgets/universal/responsive_dialog.dart';
import '../shared/widgets/universal/show_theme_colors.dart';
import '../shared/widgets/universal/theme_mode_switch.dart';
import '../shared/widgets/universal/theme_showcase.dart';
import 'widgets/app_bar_style_buttons.dart';
import 'widgets/dart_code_dialog_screen.dart';
import 'widgets/platform_popup_menu.dart';
import 'widgets/surface_mode_buttons.dart';
import 'widgets/system_nav_bar_style_buttons.dart';
import 'widgets/tab_bar_style_buttons.dart';
import 'widgets/theme_colors.dart';
import 'widgets/theme_popup_menu.dart';
import 'widgets/theme_selector.dart';

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
  // Open close/state of each card.
  late List<bool> isCardOpen;

  // The number of cards in the grid, must match the number we add to grid view.
  static const int _nrOfCards = 22;

  // Current amount of shown columns in the grid view.
  int columns = 1;

  // State that decides if we show all blend modes options or not, it
  // depends on if it will fit in the layout, it won't on phones.
  bool showAllBlends = false;

  // Toggle the state of a card as open/closed.
  void toggleCard(int index) {
    setState(() {
      isCardOpen[index] = !isCardOpen[index];
    });
  }

  @override
  void initState() {
    super.initState();
    isCardOpen = List<bool>.generate(_nrOfCards, (int i) => true);
  }

  @override
  Widget build(BuildContext context) {
    // In dark mode?
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    // Short handle to the media query, used to get size and paddings.
    final MediaQueryData media = MediaQuery.of(context);
    // Paddings so content shows up in visible area when we use Scaffold props
    // extendBodyBehindAppBar and extendBody.
    final double topPadding = media.padding.top + kToolbarHeight;
    final double bottomPadding = media.padding.bottom;
    // We are on phone width media, based on our definition in this app.
    final bool isPhone = media.size.width < AppData.phoneBreakpoint;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      // FlexColorScheme contains a static helper that can be use to theme
      // the system navigation bar using the AnnotatedRegion. Without this
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
        // Make Rail width larger when using it on tablet or desktop.
        railWidth: isPhone ? 52 : 66,
        breakpointShowFullMenu: AppData.desktopBreakpoint,
        title: Text(AppData.title(context)),
        menuTitle: const Text(AppData.appName),
        // Callback from menu, an item was clicked in the menu, for simplicity
        // we just use index based actions here.
        onSelect: (int index) async {
          // Open all cards
          if (index == 0) {
            for (int i = 0; i < isCardOpen.length; i++) {
              isCardOpen[i] = true;
            }
            setState(() {});
          }
          // Close all cards
          if (index == 1) {
            for (int i = 0; i < isCardOpen.length; i++) {
              isCardOpen[i] = false;
            }
            setState(() {});
          }
          // Open settings cards
          if (index == 2) {
            for (int i = 1; i < 11; i++) {
              isCardOpen[i] = true;
            }
            setState(() {});
          }
          // Close settings cards
          if (index == 3) {
            for (int i = 1; i < 11; i++) {
              isCardOpen[i] = false;
            }
            setState(() {});
          }
          // Open themed cards
          if (index == 4) {
            for (int i = 12; i < isCardOpen.length; i++) {
              isCardOpen[i] = true;
            }
            setState(() {});
          }
          // Close themed cards
          if (index == 5) {
            for (int i = 12; i < isCardOpen.length; i++) {
              isCardOpen[i] = false;
            }
            setState(() {});
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
          showAllBlends = constraints.maxWidth / columns > 445;
          // Make margins respond to media size and nr of columns.
          double margins = AppData.edgeInsetsPhone;
          if (!isPhone && columns == 1) margins = AppData.edgeInsetsTablet;
          if (columns >= 2) margins = AppData.edgeInsetsDesktop;
          if (columns >= 4) margins = AppData.edgeInsetsBigDesktop;

          return MasonryGridView.count(
            crossAxisCount: columns,
            mainAxisSpacing: margins,
            crossAxisSpacing: margins,
            padding: EdgeInsets.fromLTRB(
              margins,
              topPadding + margins,
              margins,
              bottomPadding + margins,
            ),
            itemBuilder: (BuildContext context, int index) => <Widget>[
              HeaderCard(
                isOpen: isCardOpen[0],
                onTap: () {
                  toggleCard(0);
                },
                title: const Text('FlexColorScheme Info'),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: const <Widget>[
                      Text(
                        'With this demo you can try all features and themes in '
                        'FlexColorScheme V4. Find a color scheme you '
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
                        'Widgets, but also TextTheme and its coloring. '
                        'This demo does not adjust any widget properties, the '
                        'theme is adjusted interactively and the Flutter '
                        'widgets change as the theme is modified '
                        'via the controls.\n'
                        '\n'
                        'The theming impact on widgets is shown in expandable '
                        'cards with "Themed" headings. The three first '
                        'themes are custom color schemes and are not built-in '
                        'choices. In the packages tutorial you learn how to '
                        'make your own custom color schemes and turn '
                        'them into advanced themes with FlexColorScheme.\n'
                        '\n'
                        'You can copy existing color schemes and make a custom '
                        'version of it. Want to use a theme you configured? '
                        'Copy setup code for active settings and paste it '
                        'into your IDE. Settings in the demo are persisted.',
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
              //
              // All the "Settings" Cards...
              _ThemeColors(
                controller: widget.controller,
                isOpen: isCardOpen[1],
                onTap: () {
                  toggleCard(1);
                },
              ),
              _ColorScheme(
                controller: widget.controller,
                isOpen: isCardOpen[2],
                onTap: () {
                  toggleCard(2);
                },
              ),
              _ThemeMode(
                controller: widget.controller,
                isOpen: isCardOpen[3],
                onTap: () {
                  toggleCard(3);
                },
              ),
              _Platform(
                controller: widget.controller,
                isOpen: isCardOpen[4],
                onTap: () {
                  toggleCard(4);
                },
              ),
              _SurfaceBlends(
                controller: widget.controller,
                isOpen: isCardOpen[5],
                onTap: () {
                  toggleCard(5);
                },
                showAllBlends: showAllBlends,
              ),
              _SubThemes(
                controller: widget.controller,
                isOpen: isCardOpen[6],
                onTap: () {
                  toggleCard(6);
                },
              ),
              _TextField(
                controller: widget.controller,
                isOpen: isCardOpen[7],
                onTap: () {
                  toggleCard(7);
                },
              ),
              _AppBarSettings(
                controller: widget.controller,
                isOpen: isCardOpen[8],
                onTap: () {
                  toggleCard(8);
                },
              ),
              _TabBar(
                controller: widget.controller,
                isOpen: isCardOpen[9],
                onTap: () {
                  toggleCard(9);
                },
              ),
              _BottomNavigation(
                controller: widget.controller,
                isOpen: isCardOpen[10],
                onTap: () {
                  toggleCard(10);
                },
              ),
              //
              // The sub pages card, not really a setting.
              SubPages(
                isOpen: isCardOpen[11],
                onTap: () {
                  toggleCard(11);
                },
              ),
              //
              // All the "Themed" results Cards...
              _MaterialButtonsShowcase(
                isOpen: isCardOpen[12],
                onTap: () {
                  toggleCard(12);
                },
              ),
              _ToggleFabSwitchesChipsShowcase(
                isOpen: isCardOpen[13],
                onTap: () {
                  toggleCard(13);
                },
              ),
              _ListTileShowcase(
                isOpen: isCardOpen[14],
                onTap: () {
                  toggleCard(14);
                },
              ),
              _TimePickerDialogShowcase(
                isOpen: isCardOpen[15],
                onTap: () {
                  toggleCard(15);
                },
              ),
              _DatePickerDialogShowcase(
                isOpen: isCardOpen[16],
                onTap: () {
                  toggleCard(16);
                },
              ),
              _DialogShowcase(
                isOpen: isCardOpen[17],
                onTap: () {
                  toggleCard(17);
                },
              ),
              _MaterialAndBottomSheetShowcase(
                isOpen: isCardOpen[18],
                onTap: () {
                  toggleCard(18);
                },
              ),
              _CardShowcase(
                isOpen: isCardOpen[19],
                onTap: () {
                  toggleCard(19);
                },
              ),
              _TextThemeShowcase(
                isOpen: isCardOpen[20],
                onTap: () {
                  toggleCard(20);
                },
              ),
              _PrimaryTextThemeShowcase(
                isOpen: isCardOpen[21],
                onTap: () {
                  toggleCard(21);
                },
              ),
            ].elementAt(index),
            itemCount: _nrOfCards,
          );
        }),
      ),
    );
  }
}

// The ResetSettings AlertDialog.
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
      // Add some padding to the action buttons, they are so close the
      // dialog edge without it.
      // Can't theme the padding in the dialog to something nicer, not yet!
      // I've seen it mentioned that it is coming, since M3 has more
      // default padding in its specs.
      actionsPadding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }
}

// The CopySchemeToCustom AlertDialog.
class _CopySchemeToCustomDialog extends StatelessWidget {
  const _CopySchemeToCustomDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Copy to Custom Scheme'),
      content: const Text('Copy this color scheme to the custom scheme?\n\n'
          'Current custom light and dark color scheme will be '
          'overwritten and set to the colors of this scheme.\n'
          'You will be able edit and make a custom scheme with these colors '
          'as a starting point.'),
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
            child: const Text('COPY')),
      ],
      // Add some padding to the action buttons, they are so close the
      // dialog edge without it.
      // Can't theme the padding in the dialog to something nicer, not yet!
      // I've seen it mentioned that it is coming, since M3 has more
      // default padding in its specs.
      actionsPadding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }
}

// Each Card shown in the grid view is just its on little widget, typically
// very simple and basic Column based layouts.
// They all share a common custom wrapper widget, the HeaderCard.
//
// The widgets below are all private classes local to this file, since in this
// demo they are only intended to be use in HomePage. The could of course be
// made public widget and put into their own files if there would be a need
// to use them on other other screens too.

class _ThemeColors extends StatelessWidget {
  const _ThemeColors({
    Key? key,
    required this.controller,
    required this.isOpen,
    required this.onTap,
  }) : super(key: key);
  final ThemeController controller;
  final bool isOpen;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return HeaderCard(
      isOpen: isOpen,
      onTap: onTap,
      title: const Text('Theme Colors'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
            child: ThemeSelector(controller: controller),
          ),
          ThemePopupMenu(controller: controller),
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

class _ColorScheme extends StatelessWidget {
  const _ColorScheme({
    Key? key,
    required this.controller,
    required this.isOpen,
    required this.onTap,
  }) : super(key: key);
  final ThemeController controller;
  final bool isOpen;
  final VoidCallback onTap;

  void _handleCodeTap(BuildContext context) {
    showResponsiveDialog<void>(
      context: context,
      child: DartCodeDialogScreen(controller: controller),
    );
  }

  Future<void> _handleCopySchemeTap(BuildContext context) async {
    final bool? copy = await showDialog<bool?>(
      context: context,
      builder: (BuildContext context) {
        return const _CopySchemeToCustomDialog();
      },
    );
    if (copy ?? false) {
      // Copy scheme to custom scheme, by setting custom scheme
      // to scheme of current scheme index.
      await controller.setCustomScheme(AppColor.scheme(controller));
      // After copy, set theme to the custom theme so
      // user can edit it
      await controller.setSchemeIndex(AppColor.schemesCustom.length - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return HeaderCard(
      isOpen: isOpen,
      onTap: onTap,
      title: const Text('Color Scheme'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 8),
          if (controller.schemeIndex != (AppColor.schemesCustom.length - 1))
            ListTile(
              title: const Text('Copy this scheme to custom colors?'),
              subtitle: const Text('Sets custom colors to this scheme. '
                  'You can then modify these colors'),
              trailing: ElevatedButton(
                onPressed: () async {
                  await _handleCopySchemeTap(context);
                },
                child: const Text('Copy'),
              ),
              onTap: () async {
                await _handleCopySchemeTap(context);
              },
            )
          else
            const ListTile(
              title: Text('Custom color scheme'),
              subtitle: Text('Tap the color to change it'),
            ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
            child: ThemeColors(controller: controller),
          ),
          const ListTile(
            title: Text('Tap color code to copy it to the clipboard'),
          ),
          AnimatedSwitchHide(
            showChild: controller.useFlexColorScheme,
            child: ListTile(
              title: const Text('Get the FlexColorScheme setup code for '
                  'this theme'),
              trailing: ElevatedButton(
                onPressed: () {
                  _handleCodeTap(context);
                },
                child: const Text('Code'),
              ),
              onTap: () {
                _handleCodeTap(context);
              },
            ),
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
    required this.isOpen,
    required this.onTap,
  }) : super(key: key);
  final ThemeController controller;
  final bool isOpen;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;

    return HeaderCard(
      isOpen: isOpen,
      onTap: onTap,
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
    required this.isOpen,
    required this.onTap,
  }) : super(key: key);
  final ThemeController controller;
  final bool isOpen;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return HeaderCard(
      isOpen: isOpen,
      onTap: onTap,
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
    required this.isOpen,
    required this.onTap,
    required this.showAllBlends,
  }) : super(key: key);
  final ThemeController controller;
  final bool isOpen;
  final VoidCallback onTap;
  final bool showAllBlends;

  String explainMode(final FlexSurfaceMode mode) {
    switch (mode) {
      case FlexSurfaceMode.level:
        return 'Flat blend\nAll surfaces at blend level 1x\n';
      case FlexSurfaceMode.highBackgroundLowScaffold:
        return 'High background, low scaffold\n'
            'Background 3/2x  Surface 1x  Scaffold 1/2x\n';
      case FlexSurfaceMode.highSurfaceLowScaffold:
        return 'High surface, low scaffold\n'
            'Surface 3/2x  Background 1x  Scaffold 1/2x\n';
      case FlexSurfaceMode.highScaffoldLowSurface:
        return 'High scaffold, low surface\n'
            'Scaffold 3x  Background 1x  Surface 1/2x\n';
      case FlexSurfaceMode.highScaffoldLevelSurface:
        return 'High scaffold, level surface\n'
            'Scaffold 3x  Background 2x  Surface 1x\n';
      case FlexSurfaceMode.levelSurfacesLowScaffold:
        return 'Level surfaces, low scaffold\n'
            'Surface & Background 1x  Scaffold 1/2x\n';
      case FlexSurfaceMode.highScaffoldLowSurfaces:
        return 'High scaffold, low surfaces\n'
            'Scaffold 3x  Surface and Background 1/2x\n';
      case FlexSurfaceMode.levelSurfacesLowScaffoldVariantDialog:
        return 'Variant dialog, low scaffold\n'
            'Surface & Background 1x  Scaffold 1/2x\n'
            'Dialog 1x blend of secondary variant color';
      case FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog:
        return 'High scaffold, variant dialog\n'
            'Scaffold 3x  Surface and Background 1/2x\n'
            'Dialog 1/2x blend of secondary variant color';
      case FlexSurfaceMode.custom:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isLight = Theme.of(context).brightness == Brightness.light;
    return HeaderCard(
      isOpen: isOpen,
      onTap: onTap,
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
                'White Scaffold in all blend modes, '
                'other surfaces get 8% lighter',
              ),
              value: controller.lightIsWhite,
              onChanged: controller.setLightIsWhite,
            )
          else
            SwitchListTile.adaptive(
              title: const Text('True black'),
              subtitle: const Text(
                'Black Scaffold in all blend modes, '
                'other surfaces get 8% darker',
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
  const _SubThemes(
      {Key? key,
      required this.controller,
      required this.isOpen,
      required this.onTap})
      : super(key: key);
  final ThemeController controller;
  final bool isOpen;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return HeaderCard(
      isOpen: isOpen,
      onTap: onTap,
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
                  subtitle: const Text('Disable, hover, focus, highlight and '
                      'splash use primary color'),
                  value: controller.interactionEffects,
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
  const _TextField(
      {Key? key,
      required this.controller,
      required this.isOpen,
      required this.onTap})
      : super(key: key);
  final ThemeController controller;
  final bool isOpen;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return HeaderCard(
      isOpen: isOpen,
      onTap: onTap,
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
                  value: controller.inputDecoratorBorderType ==
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
            padding: EdgeInsets.all(16),
            child: TextInputField(),
          ),
        ],
      ),
    );
  }
}

class _AppBarSettings extends StatelessWidget {
  const _AppBarSettings(
      {Key? key,
      required this.controller,
      required this.isOpen,
      required this.onTap})
      : super(key: key);
  final ThemeController controller;
  final bool isOpen;
  final VoidCallback onTap;

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
      isOpen: isOpen,
      onTap: onTap,
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
                  customAppBarColor:
                      AppColor.scheme(controller).light.appBarColor),
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
                  customAppBarColor:
                      AppColor.scheme(controller).dark.appBarColor),
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
  const _TabBar(
      {Key? key,
      required this.controller,
      required this.isOpen,
      required this.onTap})
      : super(key: key);
  final ThemeController controller;
  final bool isOpen;
  final VoidCallback onTap;

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
        return 'Style: flutterDefault\n'
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
      isOpen: isOpen,
      onTap: onTap,
      title: const Text('TabBar Settings'),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 8),
          ListTile(
            title: const Text('Choose TabBar style that fits your use case'),
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
  const _BottomNavigation(
      {Key? key,
      required this.controller,
      required this.isOpen,
      required this.onTap})
      : super(key: key);
  final ThemeController controller;
  final bool isOpen;
  final VoidCallback onTap;

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
      isOpen: isOpen,
      onTap: onTap,
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
    required this.isOpen,
    required this.onTap,
  }) : super(key: key);
  final bool isOpen;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return HeaderCard(
      isOpen: isOpen,
      onTap: onTap,
      title: const Text('Themed Material Buttons'),
      child: Padding(
        padding: const EdgeInsets.all(16),
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
            const SizedBox(height: 8),
            const LegacyButtonShowcase(enabled: false),
            const SizedBox(height: 8),
            const LegacyButtonIconShowcase(),
          ],
        ),
      ),
    );
  }
}

class _ToggleFabSwitchesChipsShowcase extends StatelessWidget {
  const _ToggleFabSwitchesChipsShowcase(
      {Key? key, required this.isOpen, required this.onTap})
      : super(key: key);
  final bool isOpen;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return HeaderCard(
      isOpen: isOpen,
      onTap: onTap,
      title: const Text('Themed Buttons Switches and Chips'),
      child: Padding(
        padding: const EdgeInsets.all(16),
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
  const _ListTileShowcase({Key? key, required this.isOpen, required this.onTap})
      : super(key: key);
  final bool isOpen;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return HeaderCard(
      isOpen: isOpen,
      onTap: onTap,
      title: const Text('Themed ListTile'),
      child: const ListTileShowcase(),
    );
  }
}

class _TimePickerDialogShowcase extends StatelessWidget {
  const _TimePickerDialogShowcase(
      {Key? key, required this.isOpen, required this.onTap})
      : super(key: key);
  final bool isOpen;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return HeaderCard(
      isOpen: isOpen,
      onTap: onTap,
      title: const Text('Themed TimePickerDialog'),
      child: const TimePickerDialogShowcase(),
    );
  }
}

class _DatePickerDialogShowcase extends StatelessWidget {
  const _DatePickerDialogShowcase(
      {Key? key, required this.isOpen, required this.onTap})
      : super(key: key);
  final bool isOpen;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return HeaderCard(
      isOpen: isOpen,
      onTap: onTap,
      title: const Text('Themed DatePickerDialog'),
      child: const DatePickerDialogShowcase(),
    );
  }
}

class _DialogShowcase extends StatelessWidget {
  const _DialogShowcase({Key? key, required this.isOpen, required this.onTap})
      : super(key: key);
  final bool isOpen;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return HeaderCard(
      isOpen: isOpen,
      onTap: onTap,
      title: const Text('Themed Dialog'),
      child: const AlertDialogShowcase(),
    );
  }
}

class _MaterialAndBottomSheetShowcase extends StatelessWidget {
  const _MaterialAndBottomSheetShowcase(
      {Key? key, required this.isOpen, required this.onTap})
      : super(key: key);
  final bool isOpen;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return HeaderCard(
      isOpen: isOpen,
      onTap: onTap,
      title: const Text('Themed Material'),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: MaterialAndBottomSheetShowcase(),
      ),
    );
  }
}

class _CardShowcase extends StatelessWidget {
  const _CardShowcase({Key? key, required this.isOpen, required this.onTap})
      : super(key: key);
  final bool isOpen;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return HeaderCard(
        isOpen: isOpen,
        onTap: onTap,
        title: const Text('Themed Card'),
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: CardShowcase(),
        ));
  }
}

class _TextThemeShowcase extends StatelessWidget {
  const _TextThemeShowcase(
      {Key? key, required this.isOpen, required this.onTap})
      : super(key: key);
  final bool isOpen;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return HeaderCard(
      isOpen: isOpen,
      onTap: onTap,
      title: const Text('Themed TextTheme'),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: TextThemeShowcase(),
      ),
    );
  }
}

class _PrimaryTextThemeShowcase extends StatelessWidget {
  const _PrimaryTextThemeShowcase(
      {Key? key, required this.isOpen, required this.onTap})
      : super(key: key);
  final bool isOpen;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return HeaderCard(
      color: Theme.of(context).colorScheme.primary,
      isOpen: isOpen,
      onTap: onTap,
      title: const Text('Themed PrimaryTextTheme'),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: PrimaryTextThemeShowcase(),
      ),
    );
  }
}
