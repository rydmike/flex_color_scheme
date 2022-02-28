import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../shared/const/app_color.dart';
import '../shared/const/app_data.dart';
import '../shared/controllers/theme_controller.dart';
import '../shared/pages/sub_pages.dart';
import '../shared/utils/link_text_span.dart';
import '../shared/widgets/app/responsive_scaffold.dart';
import '../shared/widgets/universal/header_card.dart';
import '../shared/widgets/universal/responsive_dialog.dart';
import '../shared/widgets/universal/show_color_scheme_colors.dart';
import '../shared/widgets/universal/show_sub_theme_colors.dart';
import '../shared/widgets/universal/show_theme_data_colors.dart';
import '../shared/widgets/universal/theme_mode_switch.dart';
import '../shared/widgets/universal/theme_showcase.dart';
import 'utils/generate_colorscheme_dart_code.dart';
import 'utils/generate_theme_dart_code.dart';
import 'widgets/app_bar_style_buttons.dart';
import 'widgets/color_scheme_popup_menu.dart';
import 'widgets/dart_code_dialog_screen.dart';
import 'widgets/platform_popup_menu.dart';
import 'widgets/scheme_colors.dart';
import 'widgets/surface_mode_buttons.dart';
import 'widgets/system_nav_bar_style_buttons.dart';
import 'widgets/tab_bar_style_buttons.dart';
import 'widgets/theme_input_colors.dart';
import 'widgets/theme_popup_menu.dart';
import 'widgets/theme_selector.dart';
import 'widgets/use_key_colors_buttons.dart';
import 'widgets/used_colors_popup_menu.dart';

// -----------------------------------------------------------------------------
// Home Page for EXAMPLE 5 - Themes Playground
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

  final ScrollController scrollController = ScrollController();

  // The number of cards in the grid, must match the number we add to grid view.
  static const int _nrOfCards = 24;

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
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
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
            for (int i = 1; i < 12; i++) {
              isCardOpen[i] = true;
            }
            setState(() {});
          }
          // Close settings cards
          if (index == 3) {
            for (int i = 1; i < 12; i++) {
              isCardOpen[i] = false;
            }
            setState(() {});
          }
          // Open themed cards
          if (index == 4) {
            for (int i = 13; i < isCardOpen.length; i++) {
              isCardOpen[i] = true;
            }
            setState(() {});
          }
          // Close themed cards
          if (index == 5) {
            for (int i = 13; i < isCardOpen.length; i++) {
              isCardOpen[i] = false;
            }
            setState(() {});
          }
          // Copy theme setup code
          if (index == 6) {
            // Get the theme's Dart and Flutter setup code.
            await _handleCodeTap(context, widget.controller);
          }
          // Copy ColorScheme code
          if (index == 7) {
            final String code = generateColorSchemeDartCode(colorScheme);
            await showResponsiveDialog<void>(
              context: context,
              child: DartCodeDialogScreen(
                dialogHeader: 'Active ${isDark ? 'Dark' : 'Light'} '
                    'ColorScheme Code',
                copyMessage: 'ColorScheme code copied clipboard!',
                code: code,
              ),
            );
          }
          // Reset theme settings.
          if (index == 8) {
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
          // Set theme-mode light/dark
          if (index == 9) {
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
            itemBuilder: (BuildContext context, int index) => <Widget>[
              // The main info Card.
              _Info(
                controller: widget.controller,
                isOpen: isCardOpen[0],
                onTap: () {
                  toggleCard(0);
                },
              ),
              //
              // All the "Settings" Cards.
              _SelectTheme(
                controller: widget.controller,
                isOpen: isCardOpen[1],
                onTap: () {
                  toggleCard(1);
                },
              ),
              _SeededColorScheme(
                controller: widget.controller,
                isOpen: isCardOpen[2],
                onTap: () {
                  toggleCard(2);
                },
              ),
              _ColorScheme(
                controller: widget.controller,
                isOpen: isCardOpen[3],
                onTap: () {
                  toggleCard(3);
                },
              ),
              _ThemeDataColors(
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
              _ComponentThemes(
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
              _AppBar(
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
              _NavigationRail(
                controller: widget.controller,
                isOpen: isCardOpen[11],
                onTap: () {
                  toggleCard(11);
                },
              ),
              //
              // The sub pages card, not really a setting.
              SubPages(
                isOpen: isCardOpen[12],
                onTap: () {
                  toggleCard(12);
                },
              ),
              //
              // All the "Themed" results Cards.
              _ButtonsShowcase(
                controller: widget.controller,
                isOpen: isCardOpen[13],
                onTap: () {
                  toggleCard(13);
                },
              ),
              _ToggleFabChipsShowcase(
                controller: widget.controller,
                isOpen: isCardOpen[14],
                onTap: () {
                  toggleCard(14);
                },
              ),
              _SwitchesShowcase(
                controller: widget.controller,
                isOpen: isCardOpen[15],
                onTap: () {
                  toggleCard(15);
                },
              ),
              _ListTileShowcase(
                isOpen: isCardOpen[16],
                onTap: () {
                  toggleCard(16);
                },
              ),
              _TimePickerDialogShowcase(
                isOpen: isCardOpen[17],
                onTap: () {
                  toggleCard(17);
                },
              ),
              _DatePickerDialogShowcase(
                isOpen: isCardOpen[18],
                onTap: () {
                  toggleCard(18);
                },
              ),
              _DialogShowcase(
                controller: widget.controller,
                isOpen: isCardOpen[19],
                onTap: () {
                  toggleCard(19);
                },
              ),
              _MaterialAndBottomSheetShowcase(
                isOpen: isCardOpen[20],
                onTap: () {
                  toggleCard(20);
                },
              ),
              _CardShowcase(
                isOpen: isCardOpen[21],
                onTap: () {
                  toggleCard(21);
                },
              ),
              _TextThemeShowcase(
                isOpen: isCardOpen[22],
                onTap: () {
                  toggleCard(22);
                },
              ),
              _PrimaryTextThemeShowcase(
                isOpen: isCardOpen[23],
                onTap: () {
                  toggleCard(23);
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

// Top level function to handle Theme code tap and get the code to clipboard.
Future<void> _handleCodeTap(
    BuildContext context, ThemeController controller) async {
  final String code = generateThemeDartCode(controller);
  await showResponsiveDialog<void>(
    context: context,
    child: DartCodeDialogScreen(
        dialogHeader: 'Active FlexColorScheme Setup',
        copyMessage: 'FlexColorScheme setup code copied clipboard!',
        code: code),
  );
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

class _Info extends StatelessWidget {
  const _Info({
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
      title: const Text('FlexColorScheme Info'),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 8),
          const ListTile(
            title: Text('FlexColorScheme v5 Themes Playground'),
            subtitle: Text(
                'With this app you can try all features and themes in '
                'FlexColorScheme V5. Find a color scheme you '
                'like, experiment with the new surface blend modes and '
                'levels. See how the AppBar theme options work. '
                'Try the true black option for dark '
                'themes, along with computed dark themes.\n'
                '\n'
                'In version 5 the new '
                'Material 3 based ColorScheme is used. It can also be '
                'generated using the main colors as color seed keys. You '
                'can use primary, secondary and tertiary colors as seed keys '
                'or just primary, like in ColorScheme.fromSeed. For branding '
                'needs you can also lock selected ColorScheme colors to their '
                'key value while other colors are still seed generated.\n'
                '\n'
                'This demo does not adjust any individual widget properties, '
                'the application theme is adjusted interactively and all the '
                'Flutter widgets change as the theme is modified interactively '
                'via the controls.\n'
                '\n'
                'The theming impact on widgets is shown in expandable '
                'cards with "Themed" headings. The three first '
                'themes are custom color schemes and are not built-in '
                'choices. In the packages tutorial you learn how to '
                'make your own custom color schemes and turn '
                'them into advanced themes with FlexColorScheme. '
                'All settings in this demo are persisted locally.'),
          ),
          const ListTile(
            title: Text('Use FlexColorScheme Theming Features'),
            subtitle: Text("You can turn FlexColorScheme's theming OFF "
                'to see what a theme looks like when using standard Flutter '
                'ThemeData.from(colorScheme) using same active ColorScheme '
                'as shown when FlexColorScheme is active.'),
          ),
          SwitchListTile.adaptive(
            subtitle: const Text(
              "Turn OFF to see Flutter's default theming with active colors.\n"
              'Most settings are disabled or have no impact when turned OFF.',
            ),
            value: controller.useFlexColorScheme,
            onChanged: controller.setUseFlexColorScheme,
          ),
          const ListTile(
            title: Text('Component Themes'),
            subtitle: Text('The opinionated opt-in component widget sub '
                'theming is ON by default in this app, but off in the API. '
                'Turn it OFF to see the differences. The component themes '
                'follow Material Design 3 as far as possible '
                'while still being based on and limited by Material 2 themes. '
                'Mostly this affects corner radius of Widgets, but also '
                'TextTheme size and its optional coloring. '),
          ),
          SwitchListTile.adaptive(
            subtitle: const Text('Use opinionated widget sub themes.\n'
                'When ON you can configure additional settings on components, '
                'that is on Flutter built-in Material UI widgets.'),
            value: controller.useSubThemes && controller.useFlexColorScheme,
            onChanged: controller.useFlexColorScheme
                ? controller.setUseSubThemes
                : null,
          ),
          const ListTile(
            title: Text('Get Setup Code'),
            subtitle: Text(
                'Want to use a theme you configured here in your Flutter app? '
                'Just copy the setup code for your active settings and paste '
                'it into your Flutter app iny our IDE, import FlexColorScheme '
                'and you are good to go.'),
          ),
          ListTile(
            title: const Text('Get the FlexColorScheme setup code for '
                'this theme'),
            trailing: ElevatedButton(
              onPressed: controller.useFlexColorScheme
                  ? () {
                      _handleCodeTap(context, controller);
                    }
                  : null,
              child: const Text('Code'),
            ),
            onTap: controller.useFlexColorScheme
                ? () {
                    _handleCodeTap(context, controller);
                  }
                : null,
          ),
          const ListTile(
            title: Text('Material Design 3'),
            subtitle: Text('Only a few Material 3 widgets and styles are '
                'available in Flutter 2.10 and earlier. There is a toggle in '
                'ThemeData that you can turn on to enable M3 styles, but it '
                'still has no effect on Widgets in Flutter.'),
          ),
          SwitchListTile.adaptive(
            title: const Text(
              "Use Flutter's Material 3 based ThemeData defaults",
            ),
            subtitle: const Text(
              'Toggles ThemeData.useMaterial3 true/false. '
              'Has no effect in Flutter 2.10.2 or earlier. It will in future '
              'versions. When it does, use this toggle to see what it does.',
            ),
            value: controller.useMaterial3,
            onChanged: controller.setUseMaterial3,
          ),
          const ListTile(
            title: Text('New ColorScheme in Flutter 2.10 and '
                'FlexColorScheme v5'),
            subtitle: Text('The Material 3 ColorScheme is used in '
                'FlexColorScheme v5. However, '
                'widgets in Flutter 2.10 do not utilize any of its colors '
                'yet by default. Nor do they implement other M3 styles, even '
                'if the useMaterial3:true flag is set in ThemeData.\n'
                '\n'
                'You can use '
                "FlexColorScheme's opinionated component sub-themes to get "
                'a theme that is close to M3 styles already now. You can also '
                'customize it, and '
                'define which scheme colors are used by which widgets via '
                'sub-theme configuration. '
                'This feature will also work well when Material 3 styles '
                'become available in Flutter. It works as a quick and '
                'convenient way to select non standard color, from the '
                'ColorScheme for built-in Material UI components.'),
          ),
          const ListTile(
            title: Text('Platform'),
            subtitle: Text('For testing purposes you can change used platform. '
                'It changes some icons and widgets like Switches and Sliders, '
                'also font and platform mechanics, like '
                'scrolling behavior and acceleration. '
                'This setting is not persisted.'),
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

class _SelectTheme extends StatelessWidget {
  const _SelectTheme({
    Key? key,
    required this.controller,
    required this.isOpen,
    required this.onTap,
  }) : super(key: key);
  final ThemeController controller;
  final bool isOpen;
  final VoidCallback onTap;

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
    final bool isLight = Theme.of(context).brightness == Brightness.light;
    return HeaderCard(
      isOpen: isOpen,
      onTap: onTap,
      title: const Text('Select Theme'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
            child: ThemeSelector(controller: controller),
          ),
          ThemePopupMenu(controller: controller),
          const SizedBox(height: 8),
          if (controller.schemeIndex != (AppColor.schemesCustom.length - 1))
            ListTile(
              title: const Text('Copy these input colors to custom colors?'),
              subtitle: const Text('Sets custom colors to this input scheme. '
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
              subtitle: Text('Tap the primary, secondary or tertiary and their '
                  'container colors to customize them'),
            ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
            child: ThemeInputColors(controller: controller),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('Tap a color code to copy it to the clipboard'),
          ),
          const SizedBox(height: 8),
          const Divider(),
          const ListTile(
            title: Text('Input color modifiers'),
            subtitle: Text('You can use the input color modifiers below to '
                'change the input colors before they are used to define '
                'the ColorScheme'),
          ),
          UsedColorsPopupMenu(
            title: const Text('Input limiter, use fewer of the six '
                'predefined color values'),
            index: controller.usedColors,
            onChanged: controller.setUsedColors,
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
          Visibility(
            visible: !isLight,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: SwitchListTile.adaptive(
              title: const Text('Compute dark theme'),
              subtitle: const Text(
                'Calculate from light scheme color values, instead '
                'of using the predefined dark ones',
              ),
              value: controller.useToDarkMethod &&
                  controller.useSubThemes &&
                  controller.useFlexColorScheme,
              onChanged:
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.setUseToDarkMethod
                      : null,
            ),
          ),
          Visibility(
            visible: !isLight,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: ListTile(
              title: Slider.adaptive(
                max: 100,
                divisions: 100,
                label: controller.darkMethodLevel.toString(),
                value: controller.darkMethodLevel.toDouble(),
                onChanged: controller.useToDarkMethod &&
                        controller.useSubThemes &&
                        controller.useFlexColorScheme
                    ? (double value) {
                        controller.setDarkMethodLevel(value.floor());
                      }
                    : null,
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
    );
  }
}

class _ThemeDataColors extends StatelessWidget {
  const _ThemeDataColors({
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
    final TextStyle spanTextStyle = theme.textTheme.bodyText2!
        .copyWith(color: theme.textTheme.caption!.color);
    final TextStyle linkStyle =
        theme.textTheme.bodyText2!.copyWith(color: theme.colorScheme.primary);

    return HeaderCard(
      isOpen: isOpen,
      onTap: onTap,
      title: const Text('ThemeData Colors'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    style: spanTextStyle,
                    text:
                        'The effective color properties in your ThemeData are '
                        'shown below. All direct color properties in '
                        'ThemeData are planned to be deprecated and eventually '
                        'removed from Flutter. More info can be found here ',
                  ),
                  LinkTextSpan(
                    style: linkStyle,
                    url: 'https://github.com/flutter/flutter/issues/91772',
                    text: 'in issue #91772',
                  ),
                  TextSpan(
                    style: spanTextStyle,
                    text: '.\n\n'
                        'These colors are still critical in Flutter 2.10.x and '
                        'earlier. Many UI Widgets still use them for their '
                        'default colors. FlexColorScheme has since its first '
                        'version kept all of them in sync with provided '
                        'ColorScheme, to produce an app with a consistent '
                        'ColorScheme based look on all widgets. It will '
                        'continue to do so as long as the colors exist in '
                        'ThemeData.\n'
                        '\n'
                        'Migration to replacement colors in ColorScheme only '
                        'or needed component sub-themes is added changes in '
                        'Flutter SDK stable version proceeds.',
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ShowThemeDataColors(),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _SeededColorScheme extends StatelessWidget {
  const _SeededColorScheme({
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
      title: const Text('Seeded ColorScheme'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 8),
          ListTile(
            title: const Text('Use input colors as seed keys '
                'for the ColorScheme'),
            subtitle: Text(AppColor.explainUsedColors(controller)),
          ),
          // const SizedBox(height: 4),
          ListTile(
            trailing: UseKeyColorsButtons(
              controller: controller,
            ),
          ),
          const ListTile(
            title: Text('Keep selected input colors'),
            subtitle: Text('When using a FlexColorScheme seeded ColorScheme, '
                'you can also lock primary, secondary, tertiary and their '
                'container colors to their key input color, instead of '
                'letting it be replaced by a seed computed tone. Toggle the '
                'switch below for each color to keep its input color. When '
                'ON you can see that the locked color keeps it input value. '
                'The lock switches are only available when seed colors '
                'are used.'),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
            child: SchemeColors(controller: controller),
          ),
          if (controller.schemeIndex != (AppColor.schemesCustom.length - 1))
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Tap a color code to copy it to the clipboard.'),
            )
          else
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Tap a color code to copy it to the clipboard. '
                  'This is the custom color theme, you can tap primary, '
                  'secondary or tertiary and their container colors to '
                  'customize them.'),
            ),
          const SizedBox(height: 8),
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

  @override
  Widget build(BuildContext context) {
    return HeaderCard(
      isOpen: isOpen,
      onTap: onTap,
      title: const Text('ColorScheme Colors'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: Text('This shows all the effective ColorScheme colors. '
                'They are presented in the same order as they appear in the '
                'ColorScheme class.'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ShowColorSchemeColors(),
          ),
          SizedBox(height: 8),
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
        return 'Tertiary container dialog, low scaffold\n'
            'Surface & Background 1x  Scaffold 1/2x\n'
            'Dialog 1x blend of tertiary container color';
      case FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog:
        return 'High scaffold, tertiary container dialog\n'
            'Scaffold 3x  Surface and Background 1/2x\n'
            'Dialog 1/2x blend of tertiary container color';
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
          const SizedBox(height: 8),
          const ListTile(
            title: Text('Blended surfaces and backgrounds'),
            isThreeLine: true,
            subtitle: Text(
              'Material 2 design use white and almost black surface colors. '
              'The M2 guide mentions using surfaces with different alpha '
              'blends, by blending primary color into different surfaces. '
              'Blend mode and level does that.\n'
              '\n'
              'Material Design 3 introduces a new color system, where a hint '
              'of primary color is also used on surfaces via neutral tonal '
              'palettes, shifted slightly towards the primary color. If you '
              'use key color seeded ColorScheme and set blend level to zero, '
              'you get the pure M3 design. When you use it with blends, you '
              'can further strengthen the surface blends and also vary '
              'blend strength by surface type.',
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
          if (isLight) ...<Widget>[
            const ListTile(
              title: Text('Light mode blend level'),
              subtitle: Text('Adjust the surface, background, scaffold and '
                  'dialog blend level. Also impacts surfaces when '
                  'seed colors are used. Seed based surfaces already include '
                  'a touch of primary, but you can make it stronger with '
                  'surface blends'),
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
            const ListTile(
              title: Text('Light mode onColors blend level'),
              subtitle: Text('When seed colors are not used, this affects '
                  'onContainers, onSurface and onBackground, plus main '
                  'onColors when the onColor blending switch is ON'),
            ),
            ListTile(
              title: Slider.adaptive(
                min: 0,
                max: 40,
                divisions: 40,
                label: controller.blendOnLevel.toString(),
                value: controller.blendOnLevel.toDouble(),
                onChanged: (double value) {
                  controller.setBlendOnLevel(value.toInt());
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
                      '${controller.blendOnLevel}',
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
              title: const Text('Light mode main colors use onColor blending'),
              subtitle: const Text(
                  'In M3 seeded light design only container colors use color '
                  'pair tinted onColor, main colors use black or white. '
                  'Keep this OFF to do so, or ON to also use it with '
                  'onPrimary, onSecondary, onTertiary and onError, in light '
                  'mode when seed colors are not used. Recommend OFF, but a '
                  'low onColor blend level is fine too'),
              value: controller.blendLightOnColors &&
                  controller.useSubThemes &&
                  controller.useFlexColorScheme,
              onChanged:
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.setBlendLightOnColors
                      : null,
            ),
          ] else ...<Widget>[
            const ListTile(
              title: Text('Dark mode blend level'),
              subtitle: Text('Adjust the surface, background, scaffold and '
                  'dialog blend level. Also impacts surfaces when '
                  'seed colors are used. Seed based surfaces already include '
                  'a touch of primary, but you can make it stronger with '
                  'surface blends'),
            ),
            ListTile(
              title: Slider.adaptive(
                min: 0,
                max: 40,
                divisions: 40,
                label: controller.blendLevelDark.toString(),
                value: controller.blendLevelDark.toDouble(),
                onChanged: (double value) {
                  controller.setBlendLevelDark(value.toInt());
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
                      '${controller.blendLevelDark}',
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
              title: Text('Dark mode onColors blend level'),
              subtitle: Text('When seed colors are not used, this affects '
                  'onContainers, onSurface and onBackground, plus main '
                  'onColors when the onColor blending switch is ON'),
            ),
            ListTile(
              title: Slider.adaptive(
                min: 0,
                max: 40,
                divisions: 40,
                label: controller.blendOnLevelDark.toString(),
                value: controller.blendOnLevelDark.toDouble(),
                onChanged: (double value) {
                  controller.setBlendOnLevelDark(value.toInt());
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
                      '${controller.blendOnLevelDark}',
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
              title: const Text('Dark mode main colors use onColor blending'),
              subtitle: const Text(
                  'In M3 seeded dark design, not only container colors use '
                  'color pair tinted onColor, but also the main colors do. '
                  'Keep this ON to also use it with onPrimary, onSecondary, '
                  'onTertiary and onError colors in dark mode when seed colors '
                  'are not used'),
              value: controller.blendDarkOnColors &&
                  controller.useSubThemes &&
                  controller.useFlexColorScheme,
              onChanged:
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.setBlendDarkOnColors
                      : null,
            ),
          ],
          // Set dark mode to use true black!
          if (isLight)
            SwitchListTile.adaptive(
              title: const Text('Plain white'),
              subtitle: const Text(
                'White Scaffold in all blend modes, '
                'other surfaces become 5% lighter',
              ),
              value: controller.lightIsWhite,
              onChanged: controller.setLightIsWhite,
            )
          else
            SwitchListTile.adaptive(
              title: const Text('True black'),
              subtitle: const Text(
                'Black Scaffold in all blend modes, '
                'other surfaces become 5% darker',
              ),
              value: controller.darkIsTrueBlack,
              onChanged: controller.setDarkIsTrueBlack,
            ),
        ],
      ),
    );
  }
}

class _ComponentThemes extends StatelessWidget {
  const _ComponentThemes(
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
    final bool isLight = Theme.of(context).brightness == Brightness.light;
    return HeaderCard(
      isOpen: isOpen,
      onTap: onTap,
      title: const Text('Component Themes'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SwitchListTile.adaptive(
            title: const Text('Use component themes'),
            subtitle: const Text('Enable opinionated widget sub themes'),
            value: controller.useSubThemes && controller.useFlexColorScheme,
            onChanged: controller.useFlexColorScheme
                ? controller.setUseSubThemes
                : null,
          ),
          SwitchListTile.adaptive(
            title: const Text('Use Material 3 TextTheme'),
            subtitle: const Text('ON to use FCS M3 text styles and geometry\n'
                'OFF to use SDK M2 2018 text styles and geometry'),
            value: controller.useTextTheme &&
                controller.useSubThemes &&
                controller.useFlexColorScheme,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.setUseTextTheme
                : null,
          ),
          if (isLight)
            SwitchListTile.adaptive(
              title: const Text('Light mode TextTheme is primary colored'),
              subtitle: const Text('A hint of primary color is mixed into '
                  'main text theme'),
              value: controller.blendLightTextTheme &&
                  controller.useSubThemes &&
                  controller.useFlexColorScheme,
              onChanged:
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.setBlendLightTextTheme
                      : null,
            )
          else
            SwitchListTile.adaptive(
              title: const Text('Dark mode TextTheme is primary colored'),
              subtitle: const Text('A hint of primary color is mixed into '
                  'main text theme'),
              value: controller.blendDarkTextTheme &&
                  controller.useSubThemes &&
                  controller.useFlexColorScheme,
              onChanged:
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.setBlendDarkTextTheme
                      : null,
            ),
          SwitchListTile.adaptive(
            title: const Text('Use Material 3 rounded corners on UI elements'),
            subtitle: const Text('ON to use M3 spec border radius, varies '
                'per component\n'
                'OFF to set same radius on all widgets, M2 spec is 4\n'
                'With API you can adjust it per widget with a double value'),
            value: controller.useDefaultRadius &&
                controller.useSubThemes &&
                controller.useFlexColorScheme,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.setUseDefaultRadius
                : null,
          ),
          Visibility(
            visible: !controller.useDefaultRadius &&
                controller.useSubThemes &&
                controller.useFlexColorScheme,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
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
            subtitle: const Text('OFF removes Shape from custom FAB sub-theme, '
                'making it use M2 circular style.'),
            value: controller.fabUseShape &&
                controller.useSubThemes &&
                controller.useFlexColorScheme,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.setFabUseShape
                : null,
          ),
          SwitchListTile.adaptive(
            title: const Text('Themed state effects'),
            subtitle: const Text('Disable, hover, focus, highlight and '
                'splash use primary color'),
            value: controller.interactionEffects &&
                controller.useSubThemes &&
                controller.useFlexColorScheme,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.setInteractionEffects
                : null,
          ),
          const Divider(height: 1),
          // Tooltip theme style.
          Tooltip(
            message: 'A tooltip, on the tooltip style toggle',
            child: SwitchListTile.adaptive(
              title: const Text(
                'Tooltip background',
              ),
              subtitle: const Text(
                'ON Normal   OFF Inverted',
              ),
              value: controller.tooltipsMatchBackground &&
                  controller.useFlexColorScheme,
              onChanged: controller.useFlexColorScheme
                  ? controller.setTooltipsMatchBackground
                  : null,
            ),
          ),
          const Divider(height: 1),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: ShowSubThemeColors(),
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
          ColorSchemePopupMenu(
            title: const Text('Base color of text field'),
            index: controller.inputDecoratorSchemeColor?.index ?? -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setInputDecoratorSchemeColor(null);
                    } else {
                      controller.setInputDecoratorSchemeColor(
                          SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
          SwitchListTile.adaptive(
            title: const Text(
              'Field has fill color',
            ),
            value: controller.inputDecoratorIsFilled &&
                controller.useSubThemes &&
                controller.useFlexColorScheme,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.setInputDecoratorIsFilled
                : null,
          ),
          SwitchListTile.adaptive(
            title: const Text(
              'Border style',
            ),
            subtitle: const Text(
              'ON for outline  OFF for underline',
            ),
            value: controller.inputDecoratorBorderType ==
                    FlexInputBorderType.outline &&
                controller.useSubThemes &&
                controller.useFlexColorScheme,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (bool isOn) {
                    if (isOn) {
                      controller.setInputDecoratorBorderType(
                          FlexInputBorderType.outline);
                    } else {
                      controller.setInputDecoratorBorderType(
                          FlexInputBorderType.underline);
                    }
                  }
                : null,
          ),
          SwitchListTile.adaptive(
            title: const Text('Unfocused field has border'),
            value: controller.inputDecoratorUnfocusedHasBorder &&
                controller.useSubThemes &&
                controller.useFlexColorScheme,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.setInputDecoratorUnfocusedHasBorder
                : null,
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

class _AppBar extends StatelessWidget {
  const _AppBar(
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
        return isLight ? 'Primary color - M2 default' : 'Primary color';
      case FlexAppBarStyle.material:
        return isLight
            ? 'White background'
            : 'Dark background (#121212) - M2 default';
      case FlexAppBarStyle.surface:
        return 'Surface, with primary color blend';
      case FlexAppBarStyle.background:
        return 'Background, with primary color blend';
      case FlexAppBarStyle.custom:
        return 'Custom, built-in schemes use tertiary color, '
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
          const Divider(),
          const ListTile(
            title: Text('Custom color'),
            subtitle: Text('With sub-themes you can set scheme color for the '
                'AppBar background color. '
                'Using AppBarStyle is easier, but this offers more colors. '
                'This overrides used AppBarStyle and passed in color, set them '
                'back to default to use AppBarStyle again. '
                'With API you can set different color in light and dark '
                'mode. This app shares same input for both modes, but you '
                'can easily modify the generated setup code.'),
          ),
          ColorSchemePopupMenu(
            title: const Text('AppBar background color'),
            index: controller.appBarBackgroundSchemeColor?.index ?? -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setAppBarBackgroundSchemeColor(null);
                    } else {
                      controller.setAppBarBackgroundSchemeColor(
                          SchemeColor.values[index]);
                    }
                  }
                : null,
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
          const Divider(),
          const ListTile(
            title: Text('Custom colors'),
            subtitle: Text('With sub-themes you can select scheme color for '
                'the items and indicator separately. '
                'Using TabBarStyle is easier, but this offers more control. '
                'These settings overrides used TabBarStyle, set them '
                'back to default to use TabBarStyle again. '
                'With API you can set different color in light and dark '
                'mode. This app shares same input for both modes, but you '
                'can easily modify the generated setup code.'),
          ),
          ColorSchemePopupMenu(
            title: const Text('TabBar items color'),
            index: controller.tabBarItemSchemeColor?.index ?? -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setTabBarItemSchemeColor(null);
                    } else {
                      controller
                          .setTabBarItemSchemeColor(SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
          ColorSchemePopupMenu(
            title: const Text('TabBar indicator color'),
            index: controller.tabBarIndicator?.index ?? -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setTabBarIndicator(null);
                    } else {
                      controller.setTabBarIndicator(SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
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
    final double navBarOpacity =
        controller.useSubThemes && controller.useFlexColorScheme
            ? controller.bottomNavigationBarOpacity
            : 1;
    final double navBarElevation =
        controller.useSubThemes && controller.useFlexColorScheme
            ? controller.bottomNavigationBarElevation
            : 8;
    return HeaderCard(
      isOpen: isOpen,
      onTap: onTap,
      title: const Text('Navigation Bar Settings'),
      child: Column(
        children: <Widget>[
          const ListTile(
            title: Text('Opacity'),
            subtitle: Text(
              'Opacity on all bars. Separate '
              'parameters, but use shared input here',
            ),
          ),
          ListTile(
            title: Slider.adaptive(
              max: 100,
              divisions: 100,
              label: (navBarOpacity * 100).toStringAsFixed(0),
              value: navBarOpacity * 100,
              onChanged:
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? (double value) {
                          controller.setBottomNavigationBarOpacity(value / 100);
                        }
                      : null,
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
                    '${(navBarOpacity * 100).toStringAsFixed(0)} %',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
          const ListTile(
            title: Text('M2 bottom navigation bar elevation'),
          ),
          ListTile(
            title: Slider.adaptive(
              max: 24,
              divisions: 48,
              label: navBarElevation.toStringAsFixed(1),
              value: navBarElevation,
              onChanged:
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.setBottomNavigationBarElevation
                      : null,
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
                    navBarElevation.toStringAsFixed(1),
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const BottomNavigationBarShowcase(),
          const NavigationBarShowcase(),
          ColorSchemePopupMenu(
            title: const Text('Background color on M2 and M3 navigation bars'),
            index: controller.navBarBackgroundSchemeColor?.index ?? -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setNavBarBackgroundSchemeColor(null);
                    } else {
                      controller.setNavBarBackgroundSchemeColor(
                          SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
          ColorSchemePopupMenu(
            title: const Text('Item color on M2 and M3 navigation bars'),
            index: controller.navBarScheme?.index ?? -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setNavBarScheme(null);
                    } else {
                      controller.setNavBarScheme(SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
          const SizedBox(height: 8),
          ColorSchemePopupMenu(
            title: const Text('Item highlight color on M3 navigation bar'),
            index: controller.navBarHighlight?.index ?? -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setNavBarHighlight(null);
                    } else {
                      controller.setNavBarHighlight(SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
          SwitchListTile.adaptive(
            title: const Text('Mute unselected item on M3 navigation bar'),
            subtitle: const Text('Unselected icon and text are less bright'),
            value: controller.navBarMuteUnselected &&
                controller.useSubThemes &&
                controller.useFlexColorScheme,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.setNavBarMuteUnselected
                : null,
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

class _NavigationRail extends StatelessWidget {
  const _NavigationRail(
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
    final bool isLight = Theme.of(context).brightness == Brightness.light;
    final double navBarOpacity =
        controller.useSubThemes && controller.useFlexColorScheme
            ? controller.bottomNavigationBarOpacity
            : 1;
    final double navBarElevation =
        controller.useSubThemes && controller.useFlexColorScheme
            ? controller.bottomNavigationBarElevation
            : 8;
    return HeaderCard(
      isOpen: isOpen,
      onTap: onTap,
      title: const Text('Navigation Rail Settings'),
      child: Column(
        children: <Widget>[
          const NavigationRailShowcase(),
          // const ListTile(
          //   title: Text('Opacity'),
          //   subtitle: Text(
          //     'Opacity on all bars. Separate '
          //     'parameters, but use shared input here',
          //   ),
          // ),
          // ListTile(
          //   title: Slider.adaptive(
          //     max: 100,
          //     divisions: 100,
          //     label: (navBarOpacity * 100).toStringAsFixed(0),
          //     value: navBarOpacity * 100,
          //     onChanged:
          //         controller.useSubThemes && controller.useFlexColorScheme
          //             ? (double value) {
          //                 controller.setBottomNavigationBarOpacity(value / 100);
          //               }
          //             : null,
          //   ),
          //   trailing: Padding(
          //     padding: const EdgeInsetsDirectional.only(end: 12),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.end,
          //       children: <Widget>[
          //         Text(
          //           'OPACITY',
          //           style: Theme.of(context).textTheme.caption,
          //         ),
          //         Text(
          //           // ignore: lines_longer_than_80_chars
          //           '${(navBarOpacity * 100).toStringAsFixed(0)} %',
          //           style: Theme.of(context)
          //               .textTheme
          //               .caption!
          //               .copyWith(fontWeight: FontWeight.bold),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // const Divider(),
          const ListTile(
              subtitle: Text('In this demo these settings are shared with the '
                  'navigation bars, but they are separate properties '
                  'in the API. You can modify generated code to edit and quick '
                  'theme them separately.')),
          const ListTile(
              title: Text('NavigationRail elevation'),
              subtitle: Text('Setting shared with M2 BottomNavigationBar')),
          ListTile(
            title: Slider.adaptive(
              max: 24,
              divisions: 48,
              label: navBarElevation.toStringAsFixed(1),
              value: navBarElevation,
              onChanged:
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.setBottomNavigationBarElevation
                      : null,
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
                    navBarElevation.toStringAsFixed(1),
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          ColorSchemePopupMenu(
            title: const Text('Background color on navigation rail and bars'),
            index: controller.navBarBackgroundSchemeColor?.index ?? -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setNavBarBackgroundSchemeColor(null);
                    } else {
                      controller.setNavBarBackgroundSchemeColor(
                          SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
          ColorSchemePopupMenu(
            title: const Text('Item color on rail and navigation bars'),
            index: controller.navBarScheme?.index ?? -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setNavBarScheme(null);
                    } else {
                      controller.setNavBarScheme(SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
          const SizedBox(height: 8),
          ColorSchemePopupMenu(
            title: const Text(
                'Item highlight color on rail and M3 navigation bar'),
            index: controller.navBarHighlight?.index ?? -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setNavBarHighlight(null);
                    } else {
                      controller.setNavBarHighlight(SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
          // SwitchListTile.adaptive(
          //   title: const Text('Mute unselected item on M3 navigation bar'),
          //   subtitle: const Text('Unselected icon and text are less bright'),
          //   value: controller.navBarMuteUnselected &&
          //       controller.useSubThemes &&
          //       controller.useFlexColorScheme,
          //   onChanged: controller.useSubThemes && controller.useFlexColorScheme
          //       ? controller.setNavBarMuteUnselected
          //       : null,
          // ),
        ],
      ),
    );
  }
}

class _ButtonsShowcase extends StatelessWidget {
  const _ButtonsShowcase({
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
      title: const Text('Themed Material Buttons'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 8),
          const ListTile(
            title: Text('Themed button colors'),
            subtitle: Text('Change theme color, default is primary via '
                'SDK default and component sub-theme defaults. '
                'With API you can set different color in light and dark '
                'mode. This app shares same input for both modes, but you '
                'can easily modify the generated setup code.'),
          ),
          ColorSchemePopupMenu(
            title: const Text('ElevatedButton color'),
            index: controller.elevatedButtonSchemeColor?.index ?? -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setElevatedButtonSchemeColor(null);
                    } else {
                      controller.setElevatedButtonSchemeColor(
                          SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ElevatedButtonShowcase(),
          ),
          ColorSchemePopupMenu(
            title: const Text('OutlinedButton color'),
            index: controller.outlinedButtonSchemeColor?.index ?? -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setOutlinedButtonSchemeColor(null);
                    } else {
                      controller.setOutlinedButtonSchemeColor(
                          SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: OutlinedButtonShowcase(),
          ),
          ColorSchemePopupMenu(
            title: const Text('TextButton color'),
            index: controller.textButtonSchemeColor?.index ?? -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setTextButtonSchemeColor(null);
                    } else {
                      controller
                          .setTextButtonSchemeColor(SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextButtonShowcase(),
          ),

          /// Showing the legacy buttons is removed from the sample.
          ///
          /// The deprecated legacy buttons weill be removed in next stable
          /// release after Flutter 2.10.x. For more info see:
          /// https://github.com/flutter/flutter/issues/98537
          ///
          /// The sub themes that style them will be kept available since it
          /// is not going away and may be useful to the theme ButtonBar and
          /// dropdown. button style. As long as the buttons are actually
          /// available in the SDK, the comment code to show will be kept
          /// around in the samples, should anybody want to uncomment it to
          /// see what their style with sub themes applied looks like.

          // Padding(
          //   padding: const EdgeInsets.all(8),
          //   child: Text('Legacy buttons, deprecated',
          //       style: Theme.of(context).textTheme.subtitle1),
          // ),
          // const LegacyButtonShowcase(),
          // const SizedBox(height: 8),
          // const LegacyButtonShowcase(enabled: false),
          // const SizedBox(height: 8),
          // const LegacyButtonIconShowcase(),
        ],
      ),
    );
  }
}

class _ToggleFabChipsShowcase extends StatelessWidget {
  const _ToggleFabChipsShowcase({
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
      title: const Text('Themed Buttons, Switches and Chips'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ColorSchemePopupMenu(
            title: const Text('ToggleButtons color'),
            index: controller.toggleButtonsSchemeColor?.index ?? -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setToggleButtonsSchemeColor(null);
                    } else {
                      controller.setToggleButtonsSchemeColor(
                          SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: ToggleButtonsShowcase(),
          ),
          const Divider(),
          ColorSchemePopupMenu(
            title: const Text('FloatingActionButton color'),
            index: controller.fabSchemeColor?.index ?? -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setFabSchemeColor(null);
                    } else {
                      controller.setFabSchemeColor(SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: FabShowcase(),
          ),
          const Divider(),
          ColorSchemePopupMenu(
            title: const Text('Chip color'),
            index: controller.chipSchemeColor?.index ?? -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setChipSchemeColor(null);
                    } else {
                      controller.setChipSchemeColor(SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: ChipShowcase(),
          ),
          const Divider(),
          // TODO(rydmike): Keeping this setting out of the demo, no impact.
          //  This setting has no impact on anything in the demo so taking it
          //  away for now.
          //
          // ColorSchemePopupMenu(
          //   title: const Text('Old ButtonTheme color'),
          //   index: controller.materialButtonSchemeColor?.index ?? -1,
          //   onChanged: controller.useSubThemes &&
          //      controller.useFlexColorScheme
          //       ? (int index) {
          //           if (index < 0 || index >= SchemeColor.values.length) {
          //             controller.setMaterialButtonSchemeColor(null);
          //           } else {
          //             controller.setMaterialButtonSchemeColor(
          //                 SchemeColor.values[index]);
          //           }
          //         }
          //       : null,
          // ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: PopupDropdownButtonsShowcase(),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(16),
            child: CircleAvatarAndTooltipShowcase(),
          ),
        ],
      ),
    );
  }
}

class _SwitchesShowcase extends StatelessWidget {
  const _SwitchesShowcase({
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
      title: const Text('Themed Switches'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ColorSchemePopupMenu(
            title: const Text('Switch color'),
            index: controller.switchSchemeColor?.index ?? -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setSwitchSchemeColor(null);
                    } else {
                      controller
                          .setSwitchSchemeColor(SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SwitchShowcase(),
          ),
          const Divider(),
          ColorSchemePopupMenu(
            title: const Text('Checkbox color'),
            index: controller.checkboxSchemeColor?.index ?? -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setCheckboxSchemeColor(null);
                    } else {
                      controller
                          .setCheckboxSchemeColor(SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CheckboxShowcase(),
          ),
          const Divider(),
          ColorSchemePopupMenu(
            title: const Text('Radio color'),
            index: controller.radioSchemeColor?.index ?? -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setRadioSchemeColor(null);
                    } else {
                      controller.setRadioSchemeColor(SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: RadioShowcase(),
          ),
        ],
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
  const _DialogShowcase({
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
      title: const Text('Themed Dialog'),
      child: Column(
        children: <Widget>[
          const ListTile(
            title: Text('Themed dialog'),
            subtitle: Text('Flutter SDK default background is '
                'colorScheme.background for Dialog and DatePickerDialog, but '
                'colorScheme.surface for TimePickerDialog. FlexColorScheme '
                'sub-themes use surface as default for all dialogs, to ensure '
                'that elevation overlay color works in dark mode.'),
          ),
          ColorSchemePopupMenu(
            title: const Text('Background color'),
            index: controller.dialogBackgroundSchemeColor?.index ?? -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setDialogBackgroundSchemeColor(null);
                    } else {
                      controller.setDialogBackgroundSchemeColor(
                          SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
          const AlertDialogShowcase(),
        ],
      ),
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
