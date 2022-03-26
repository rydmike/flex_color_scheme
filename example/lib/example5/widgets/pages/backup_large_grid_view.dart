import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../shared/const/app_data.dart';
import '../../../shared/controllers/theme_controller.dart';
import '../../../shared/pages/page_examples.dart';
import '../../../shared/widgets/universal/header_card.dart';
import '../panels/app_bar_settings/app_bar_settings.dart';
import '../panels/buttons_settings/buttons_settings.dart';
import '../panels/card_and_material_settings/card_settings.dart';
import '../panels/card_and_material_settings/material_and_bottom_sheet_settings.dart';
import '../panels/component_themes/component_themes.dart';
import '../panels/dialog_settings/dialog_settings.dart';
import '../panels/fab_toggle_chip_popup_settings/fab_toggle_chip_popup_settings.dart';
import '../panels/grid_item.dart';
import '../panels/input_colors/input_colors.dart';
import '../panels/introduction/introduction_panel.dart';
import '../panels/navigation_bar_settings/android_navigation_bar_settings.dart';
import '../panels/navigation_bar_settings/bottom_navigation_bar_settings.dart';
import '../panels/navigation_bar_settings/navigation_bar_settings.dart';
import '../panels/navigation_rail_settings/navigation_rail_settings.dart';
import '../panels/seeded_color_scheme/seeded_color_scheme.dart';
import '../panels/showcase_panels/effective_colors.dart';
import '../panels/showcase_panels/theme_code.dart';
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
    required this.isCardOpen,
    required this.toggleCard,
  }) : super(key: key);
  final ThemeController controller;
  final List<bool> isCardOpen;
  final ValueChanged<int> toggleCard;

  @override
  State<LargeGridView> createState() => _LargeGridViewState();
}

class _LargeGridViewState extends State<LargeGridView>
    with AutomaticKeepAliveClientMixin {
  // Override `wantKeepAlive` when using `AutomaticKeepAliveClientMixin`.
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    // Call `super.build` when using `AutomaticKeepAliveClientMixin`.
    super.build(context);

    final MediaQueryData media = MediaQuery.of(context);
    final bool isPhone = media.size.width < AppData.phoneBreakpoint;
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99),
            theme.colorScheme.onBackground)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F),
            theme.colorScheme.onBackground);

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      // Just a suitable breakpoint for when we want to have more
      // than one column in the body with this particular content.
      final int columns = constraints.maxWidth ~/ 860 + 1;

      // Flag used to hide some blend mode options that wont fit when
      // using toggle buttons on small media.
      final bool showAllBlends = constraints.maxWidth / columns > 445;
      // Make margins respond to media size and nr of shown columns.
      double margins = AppData.edgeInsetsPhone;
      if (!isPhone && columns == 1) margins = AppData.edgeInsetsTablet;
      if (columns >= 2) margins = AppData.edgeInsetsDesktop;
      if (columns >= 4) margins = AppData.edgeInsetsBigDesktop;

      return MasonryGridView.count(
        controller: ScrollController(),
        crossAxisCount: columns,
        mainAxisSpacing: margins,
        crossAxisSpacing: margins,
        padding: EdgeInsets.fromLTRB(
          margins,
          margins + media.padding.top,
          margins,
          margins,
        ),
        itemCount: widget.isCardOpen.length,
        itemBuilder: (BuildContext context, int itemIndex) => HeaderCard(
          title: Text(gridItems[itemIndex].panelLabel),
          leading: Icon(gridItems[itemIndex].icon, color: iconColor),
          isOpen: widget.isCardOpen[itemIndex],
          onTap: () {
            widget.toggleCard(itemIndex);
          },
          child: <Widget>[
            IntroductionPanel(widget.controller),
            ThemeCode(widget.controller),
            InputColors(widget.controller),
            SeededColorScheme(widget.controller),
            SurfaceBlends(widget.controller, allBlends: showAllBlends),
            EffectiveColors(widget.controller),
            ComponentThemes(widget.controller),
            TextFieldSettings(widget.controller),
            AppBarSettings(widget.controller),
            TabBarSettings(widget.controller),
            NavigationBarSettings(widget.controller),
            BottomNavigationBarSettings(widget.controller),
            NavigationRailSettings(widget.controller),
            AndroidNavigationBarSettings(widget.controller),
            ButtonsSettings(widget.controller),
            FabToggleChipPopupSettings(widget.controller),
            SwitchesSettings(widget.controller),
            ListTileSettings(widget.controller),
            DialogSettings(widget.controller),
            MaterialAndBottomSheetSettings(widget.controller),
            CardSettings(widget.controller),
            TextThemeSettings(widget.controller),
            PrimaryTextThemeSettings(widget.controller),
            const PageExamples(),
          ].elementAt(itemIndex),
        ),
      );
    });
  }
}
