import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../shared/const/app_data.dart';
import '../../../shared/controllers/theme_controller.dart';
import '../../../shared/pages/sub_pages.dart';
import '../panels/app_bar_settings/app_bar_settings.dart';
import '../panels/buttons_settings/buttons_settings.dart';
import '../panels/card_and_material_settings/card_settings.dart';
import '../panels/card_and_material_settings/material_and_bottom_sheet_settings.dart';
import '../panels/component_themes/component_themes.dart';
import '../panels/dialog_settings/date_picker_dialog_settings.dart';
import '../panels/dialog_settings/dialog_settings.dart';
import '../panels/dialog_settings/time_picker_dialog_settings.dart';
import '../panels/fab_toggle_chip_popup_settings/fab_toggle_chip_popup_settings.dart';
import '../panels/input_colors/input_colors.dart';
import '../panels/introduction/introduction_panel.dart';
import '../panels/navigation_bar_settings/android_navigation_bar_settings.dart';
import '../panels/navigation_bar_settings/bottom_navigation_bar_settings.dart';
import '../panels/navigation_bar_settings/navigation_bar_settings.dart';
import '../panels/navigation_rail_settings/navigation_rail_settings.dart';
import '../panels/seeded_color_scheme/seeded_color_scheme.dart';
import '../panels/showcase_panels/effective_colors.dart';
import '../panels/showcase_panels/effective_setup_code.dart';
import '../panels/surface_blends/surface_blends.dart';
import '../panels/switch_settings/list_tile_settings.dart';
import '../panels/switch_settings/switch_settings.dart';
import '../panels/tab_bar_settings/tab_bar_settings.dart';
import '../panels/text_field_settings/text_field_settings.dart';
import '../panels/text_theme_settings/primary_text_theme_settings.dart';
import '../panels/text_theme_settings/text_theme_settings.dart';

/// This is the super large masonry grid view layout of the Themes Playground.
///
/// It is nice on a 4k screen where you can see a lot of settings in one glance.
/// It works thanks to collapsible panels and responsive layout down to
/// phone size too, but a page view may be more convenient on eg tablet size.
class LargeGridView extends StatefulWidget {
  const LargeGridView({
    Key? key,
    required this.controller,
    required this.scrollController,
    required this.isCardOpen,
    required this.toggleCard,
  }) : super(key: key);
  final ThemeController controller;
  final ScrollController scrollController;
  final List<bool> isCardOpen;
  final ValueChanged<int> toggleCard;

  @override
  State<LargeGridView> createState() => _LargeGridViewState();
}

class _LargeGridViewState extends State<LargeGridView>
    with AutomaticKeepAliveClientMixin {
  // final ScrollController scrollController = ScrollController();

  // Override `wantKeepAlive` when using `AutomaticKeepAliveClientMixin`.
  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    // scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Call `super.build` when using `AutomaticKeepAliveClientMixin`.
    super.build(context);

    final MediaQueryData media = MediaQuery.of(context);
    final bool isPhone = media.size.width < AppData.phoneBreakpoint;

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      // Just a suitable breakpoint for when we want to have more
      // than one column in the body with this particular content.
      final int columns = constraints.maxWidth ~/ 860 + 1;

      // Flag used to hide some blend mode options that wont fit when
      // using toggle buttons on small media.
      final bool showAllBlends = constraints.maxWidth / columns > 445;
      // Make margins respond to media size and nr of columns.
      double margins = AppData.edgeInsetsPhone;
      if (!isPhone && columns == 1) margins = AppData.edgeInsetsTablet;
      if (columns >= 2) margins = AppData.edgeInsetsDesktop;
      if (columns >= 4) margins = AppData.edgeInsetsBigDesktop;

      return MasonryGridView.count(
        controller: widget.scrollController,
        crossAxisCount: columns,
        mainAxisSpacing: margins,
        crossAxisSpacing: margins,
        padding: EdgeInsets.fromLTRB(
          margins,
          margins + kToolbarHeight,
          margins,
          margins,
        ),
        itemCount: widget.isCardOpen.length,
        itemBuilder: (BuildContext context, int index) => <Widget>[
          IntroductionPanel(
            controller: widget.controller,
            isOpen: widget.isCardOpen[0],
            onTap: () {
              widget.toggleCard(0);
            },
          ),
          EffectiveSetupCode(
            controller: widget.controller,
            isOpen: widget.isCardOpen[1],
            onTap: () {
              widget.toggleCard(1);
            },
          ),
          InputColors(
            controller: widget.controller,
            isOpen: widget.isCardOpen[2],
            onTap: () {
              widget.toggleCard(2);
            },
          ),
          SeededColorScheme(
            controller: widget.controller,
            isOpen: widget.isCardOpen[3],
            onTap: () {
              widget.toggleCard(3);
            },
          ),
          SurfaceBlends(
            controller: widget.controller,
            isOpen: widget.isCardOpen[4],
            onTap: () {
              widget.toggleCard(4);
            },
            showAllBlends: showAllBlends,
          ),
          EffectiveColors(
            controller: widget.controller,
            isOpen: widget.isCardOpen[5],
            onTap: () {
              widget.toggleCard(5);
            },
          ),
          ComponentThemes(
            controller: widget.controller,
            isOpen: widget.isCardOpen[6],
            onTap: () {
              widget.toggleCard(6);
            },
          ),
          TextFieldSettings(
            controller: widget.controller,
            isOpen: widget.isCardOpen[7],
            onTap: () {
              widget.toggleCard(7);
            },
          ),
          AppBarSettings(
            controller: widget.controller,
            isOpen: widget.isCardOpen[8],
            onTap: () {
              widget.toggleCard(8);
            },
          ),
          TabBarSettings(
            controller: widget.controller,
            isOpen: widget.isCardOpen[9],
            onTap: () {
              widget.toggleCard(9);
            },
          ),
          NavigationBarSettings(
            controller: widget.controller,
            isOpen: widget.isCardOpen[10],
            onTap: () {
              widget.toggleCard(10);
            },
          ),
          BottomNavigationBarSettings(
            controller: widget.controller,
            isOpen: widget.isCardOpen[11],
            onTap: () {
              widget.toggleCard(11);
            },
          ),
          NavigationRailSettings(
            controller: widget.controller,
            isOpen: widget.isCardOpen[12],
            onTap: () {
              widget.toggleCard(12);
            },
          ),
          AndroidNavigationBarSettings(
            controller: widget.controller,
            isOpen: widget.isCardOpen[13],
            onTap: () {
              widget.toggleCard(13);
            },
          ),
          ButtonsSettings(
            controller: widget.controller,
            isOpen: widget.isCardOpen[14],
            onTap: () {
              widget.toggleCard(14);
            },
          ),
          FabToggleChipPopupSettings(
            controller: widget.controller,
            isOpen: widget.isCardOpen[15],
            onTap: () {
              widget.toggleCard(15);
            },
          ),
          SwitchesSettings(
            controller: widget.controller,
            isOpen: widget.isCardOpen[16],
            onTap: () {
              widget.toggleCard(16);
            },
          ),
          ListTileSettings(
            isOpen: widget.isCardOpen[17],
            onTap: () {
              widget.toggleCard(17);
            },
          ),
          DialogSettings(
            controller: widget.controller,
            isOpen: widget.isCardOpen[18],
            onTap: () {
              widget.toggleCard(18);
            },
          ),
          TimePickerDialogSettings(
            isOpen: widget.isCardOpen[19],
            onTap: () {
              widget.toggleCard(19);
            },
          ),
          DatePickerDialogSettings(
            isOpen: widget.isCardOpen[20],
            onTap: () {
              widget.toggleCard(20);
            },
          ),
          MaterialAndBottomSheetSettings(
            controller: widget.controller,
            isOpen: widget.isCardOpen[21],
            onTap: () {
              widget.toggleCard(21);
            },
          ),
          CardSettings(
            controller: widget.controller,
            isOpen: widget.isCardOpen[22],
            onTap: () {
              widget.toggleCard(22);
            },
          ),
          TextThemeSettings(
            controller: widget.controller,
            isOpen: widget.isCardOpen[23],
            onTap: () {
              widget.toggleCard(23);
            },
          ),
          PrimaryTextThemeSettings(
            controller: widget.controller,
            isOpen: widget.isCardOpen[24],
            onTap: () {
              widget.toggleCard(24);
            },
          ),
          SubPagesDemo(
            isOpen: widget.isCardOpen[25],
            onTap: () {
              widget.toggleCard(25);
            },
          ),
        ].elementAt(index),
      );
    });
  }
}
