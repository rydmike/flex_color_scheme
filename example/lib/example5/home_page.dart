import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../shared/const/app_data.dart';
import '../shared/controllers/theme_controller.dart';
import '../shared/pages/sub_pages.dart';
import '../shared/widgets/app/responsive_scaffold.dart';
import '../shared/widgets/universal/responsive_dialog.dart';
import 'utils/generate_colorscheme_dart_code.dart';
import 'widgets/dialogs/dart_code_dialog_screen.dart';
import 'widgets/dialogs/reset_settings_dialog.dart';
import 'widgets/dialogs/show_copy_setup_code_dialog.dart';
import 'widgets/panels/app_bar_settings/app_bar_settings.dart';
import 'widgets/panels/buttons_settings/buttons_settings.dart';
import 'widgets/panels/component_themes/component_themes.dart';
import 'widgets/panels/dialog_settings/dialog_settings.dart';
import 'widgets/panels/info/info_panel.dart';
import 'widgets/panels/navigation_bar_settings/navigation_bar_settings.dart';
import 'widgets/panels/navigation_rail_settings/navigation_rail_settings.dart';
import 'widgets/panels/seeded_color_scheme/color_scheme_colors/color_scheme_colors.dart';
import 'widgets/panels/seeded_color_scheme/seeded_color_scheme.dart';
import 'widgets/panels/select_theme/select_theme.dart';
import 'widgets/panels/surface_blends/surface_blends.dart';
import 'widgets/panels/switch_settings/switch_settings.dart';
import 'widgets/panels/tab_bar_settings/tab_bar_settings.dart';
import 'widgets/panels/text_field_settings/text_field_settings.dart';
import 'widgets/panels/theme_data_colors/theme_data_colors.dart';
import 'widgets/panels/themed_card.dart';
import 'widgets/panels/themed_date_picker_dialog.dart';
import 'widgets/panels/themed_list_tile.dart';
import 'widgets/panels/themed_material_and_bottom_sheet.dart';
import 'widgets/panels/themed_primary_text_theme.dart';
import 'widgets/panels/themed_text_theme.dart';
import 'widgets/panels/themed_time_picker_dialog.dart';
import 'widgets/panels/toggle_fab_chip_settings/toggle_fab_chip_settings.dart';

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
        // In this demo app we are sharing the same setting as used on the
        // bottom navigation bars opacity, just to not make another setting
        // parameter. Normally you would probably hard code this to the
        // desired design.
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
            await showCopySetupCodeDialog(context, widget.controller);
          }
          // Copy ColorScheme code
          if (index == 7) {
            final String code = generateColorSchemeDartCode(colorScheme);
            await showResponsiveDialog<void>(
              context: context,
              child: DartCodeDialogScreen(
                dialogHeader: 'Active ${isDark ? 'Dark' : 'Light'} '
                    'ColorScheme Code',
                copyMessage: 'ColorScheme code copied to the clipboard!',
                code: code,
              ),
            );
          }
          // Reset theme settings.
          if (index == 8) {
            final bool? reset = await showDialog<bool?>(
              context: context,
              builder: (BuildContext context) {
                return const ResetSettingsDialog();
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
          columns = constraints.maxWidth ~/ 860 + 1;

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
            itemCount: _nrOfCards,
            itemBuilder: (BuildContext context, int index) => <Widget>[
              // The main info Card.
              InfoPanel(
                controller: widget.controller,
                isOpen: isCardOpen[0],
                onTap: () {
                  toggleCard(0);
                },
              ),
              //
              // All the "Settings" Cards.
              SelectTheme(
                controller: widget.controller,
                isOpen: isCardOpen[1],
                onTap: () {
                  toggleCard(1);
                },
              ),
              SeededColorScheme(
                controller: widget.controller,
                isOpen: isCardOpen[2],
                onTap: () {
                  toggleCard(2);
                },
              ),
              ColorSchemeColors(
                controller: widget.controller,
                isOpen: isCardOpen[3],
                onTap: () {
                  toggleCard(3);
                },
              ),
              ThemeDataColors(
                controller: widget.controller,
                isOpen: isCardOpen[4],
                onTap: () {
                  toggleCard(4);
                },
              ),
              SurfaceBlends(
                controller: widget.controller,
                isOpen: isCardOpen[5],
                onTap: () {
                  toggleCard(5);
                },
                showAllBlends: showAllBlends,
              ),
              ComponentThemes(
                controller: widget.controller,
                isOpen: isCardOpen[6],
                onTap: () {
                  toggleCard(6);
                },
              ),
              TextFieldSettings(
                controller: widget.controller,
                isOpen: isCardOpen[7],
                onTap: () {
                  toggleCard(7);
                },
              ),
              AppBarSettings(
                controller: widget.controller,
                isOpen: isCardOpen[8],
                onTap: () {
                  toggleCard(8);
                },
              ),
              TabBarSettings(
                controller: widget.controller,
                isOpen: isCardOpen[9],
                onTap: () {
                  toggleCard(9);
                },
              ),
              NavigationBarSettings(
                controller: widget.controller,
                isOpen: isCardOpen[10],
                onTap: () {
                  toggleCard(10);
                },
              ),
              NavigationRailSettings(
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
              // All the "Themed" results Card panels.
              //
              // TODO(rydmike): Consider changing open/close action.
              // Although technically buttons, Toggles, FAB, Switches and
              // Dialog panels are now also settings screens, may I should
              // change the groups they belong with regards to what the
              // open clos side buttons act on.
              //
              ButtonsSettings(
                controller: widget.controller,
                isOpen: isCardOpen[13],
                onTap: () {
                  toggleCard(13);
                },
              ),
              ToggleFabChipsSettings(
                controller: widget.controller,
                isOpen: isCardOpen[14],
                onTap: () {
                  toggleCard(14);
                },
              ),
              SwitchesSettings(
                controller: widget.controller,
                isOpen: isCardOpen[15],
                onTap: () {
                  toggleCard(15);
                },
              ),
              DialogSettings(
                controller: widget.controller,
                isOpen: isCardOpen[16],
                onTap: () {
                  toggleCard(16);
                },
              ),
              ThemedListTile(
                isOpen: isCardOpen[17],
                onTap: () {
                  toggleCard(17);
                },
              ),
              ThemedTimePickerDialog(
                isOpen: isCardOpen[18],
                onTap: () {
                  toggleCard(18);
                },
              ),
              ThemedDatePickerDialog(
                isOpen: isCardOpen[19],
                onTap: () {
                  toggleCard(19);
                },
              ),
              ThemedMaterialAndBottomSheet(
                isOpen: isCardOpen[20],
                onTap: () {
                  toggleCard(20);
                },
              ),
              ThemedCard(
                isOpen: isCardOpen[21],
                onTap: () {
                  toggleCard(21);
                },
              ),
              ThemedTextTheme(
                isOpen: isCardOpen[22],
                onTap: () {
                  toggleCard(22);
                },
              ),
              ThemedPrimaryTextTheme(
                isOpen: isCardOpen[23],
                onTap: () {
                  toggleCard(23);
                },
              ),
            ].elementAt(index),
          );
        }),
      ),
    );
  }
}
