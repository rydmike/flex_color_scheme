import 'package:flutter/foundation.dart';
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
import '../panels/fab_chip_settings/fab_chip_settings.dart';
import '../panels/grid_item.dart';
import '../panels/input_colors/input_colors.dart';
import '../panels/introduction/introduction_panel.dart';
import '../panels/navigation_bar_settings/android_navigation_bar_settings.dart';
import '../panels/navigation_bar_settings/bottom_navigation_bar_settings.dart';
import '../panels/navigation_bar_settings/navigation_bar_settings.dart';
import '../panels/navigation_rail_settings/navigation_rail_settings.dart';
import '../panels/popup_icon_button_settings/popup_icon_button_settings.dart';
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
import '../panels/theme_selector.dart';
import '../panels/toggle_buttons_settings/toggle_buttons_settings.dart';

// Set the bool flag to true to show debug prints. Even if it is forgotten
// to set it to false, debug prints will not show in release builds.
// The handy part is that if it gets in the way in debugging, it is an easy
// toggle to turn it off there too. Often I just leave them true if it is one
// I want to see in dev mode, unless it is too chatty.
const bool _debug = !kReleaseMode && false;

/// This is the super large masonry grid view layout of the Themes Playground.
///
/// It is nice on a 4k screen where you can see a lot of settings in one glance.
/// It works thanks to collapsible panels and responsive layout down to
/// phone size too, but a page view may be more convenient on eg tablet size.
class LargeGridView extends StatefulWidget {
  const LargeGridView({
    super.key,
    required this.controller,
    required this.isCardOpen,
    required this.toggleCard,
    // required this.scrollPosition,
    // required this.onScrollChanged,
  });
  final ThemeController controller;
  final List<bool> isCardOpen;
  final ValueChanged<int> toggleCard;

  @override
  State<LargeGridView> createState() => _LargeGridViewState();
}

class _LargeGridViewState extends State<LargeGridView>
    with TickerProviderStateMixin {
  late final ScrollController scrollController;
  late int previousSchemeIndex;
  late bool previousUseFlexColorScheme;
  late bool previousUseSubThemes;
  late bool updateDelegate;

  @override
  void initState() {
    super.initState();
    // debugPrint('Init GRID MasonryGridScroll pos: ${widget.scrollPosition}');
    scrollController = ScrollController(
      keepScrollOffset: true,
      debugLabel: 'masonryGridScrollController',
    );
    previousSchemeIndex = widget.controller.schemeIndex;
    previousUseFlexColorScheme = widget.controller.useFlexColorScheme;
    previousUseSubThemes = widget.controller.useSubThemes;
    updateDelegate = false;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    updateDelegate = false;
    if (widget.controller.schemeIndex != previousSchemeIndex) {
      previousSchemeIndex = widget.controller.schemeIndex;
      updateDelegate = true;
    }
    if (widget.controller.useFlexColorScheme != previousUseFlexColorScheme) {
      previousUseFlexColorScheme = widget.controller.useFlexColorScheme;
      updateDelegate = true;
    }
    if (widget.controller.useSubThemes != previousUseSubThemes) {
      previousUseSubThemes = widget.controller.useSubThemes;
      updateDelegate = true;
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  // The fixed desktop height of the theme selector control,
  // before any margin and media size adjustments
  static const double _kHeightSelector = 118;
  // Magic numbers for normal and dense ListTile
  static const double _kHeightNormaListTile = 52;
  static const double _kHeightDenseListTile = 44;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData media = MediaQuery.of(context);
    final bool isPhone = media.size.width < AppData.phoneWidthBreakpoint ||
        media.size.height < AppData.phoneHeightBreakpoint;
    final double phoneReduce = isPhone ? AppData.colorButtonPhoneReduce : 0;
    final bool isPinned = media.size.height >= AppData.pinnedSelector;
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99),
            theme.colorScheme.onBackground)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F),
            theme.colorScheme.onBackground);
    final ThemeController themeCtrl = widget.controller;
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      // Just a suitable breakpoint for when we want to have more
      // than one column in the body with this particular content.
      final int columns = constraints.maxWidth ~/ 860 + 1;
      // Flag used to hide some blend mode options that wont fit when
      // using toggle buttons on small media.
      final bool showAllBlends = constraints.maxWidth / columns > 445;
      final double margins = AppData.responsiveInsets(media.size.width);
      // The intrinsic height diff of the switch = dense - normal.
      final double phoneSwitchReduce =
          isPhone ? _kHeightDenseListTile - _kHeightNormaListTile : 0;
      final double headerExtent = _kHeightSelector +
          media.padding.top +
          margins * 3 +
          phoneReduce +
          phoneSwitchReduce;
      if (_debug) {
        debugPrint('headerExtent ............ : $headerExtent');
        debugPrint('margins ................. : $margins');
        debugPrint('phoneReduce ............. : $phoneReduce');
        debugPrint('kToolbarHeight .......... : $kToolbarHeight');
        debugPrint('media.viewPadding.top.... : ${media.viewPadding.top}');
        debugPrint('media.viewPadding.bottom. : ${media.viewPadding.bottom}');
        debugPrint('media.padding.top ....... : ${media.padding.top}');
        debugPrint('media.padding.bottom..... : ${media.padding.bottom}');
        debugPrint('media.size.width ........ : ${media.size.width}');
        debugPrint('media.size.height ....... : ${media.size.height}');
      }
      return CustomScrollView(
        controller: scrollController,
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: isPinned,
            floating: true,
            delegate: ThemeSelectorHeaderDelegate(
              vsync: this,
              extent: headerExtent,
              controller: themeCtrl,
              updateDelegate: updateDelegate,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(
                margins, margins, margins, margins + media.padding.bottom),
            sliver: SliverMasonryGrid.count(
              crossAxisCount: columns,
              mainAxisSpacing: margins,
              crossAxisSpacing: margins,
              childCount: widget.isCardOpen.length,
              itemBuilder: (BuildContext context, int itemIndex) => HeaderCard(
                title: Text(gridItems[itemIndex].panelLabel),
                leading: Icon(gridItems[itemIndex].icon, color: iconColor),
                isOpen: widget.isCardOpen[itemIndex],
                onTap: () {
                  widget.toggleCard(itemIndex);
                },
                child: <Widget>[
                  IntroductionPanel(themeCtrl),
                  ThemeCode(themeCtrl),
                  InputColors(themeCtrl),
                  SeededColorScheme(themeCtrl),
                  SurfaceBlends(themeCtrl, allBlends: showAllBlends),
                  EffectiveColors(themeCtrl),
                  ComponentThemes(themeCtrl),
                  TextFieldSettings(themeCtrl),
                  AppBarSettings(themeCtrl),
                  TabBarSettings(themeCtrl),
                  BottomNavigationBarSettings(themeCtrl),
                  NavigationBarSettings(themeCtrl),
                  NavigationRailSettings(themeCtrl),
                  AndroidNavigationBarSettings(themeCtrl),
                  ButtonsSettings(themeCtrl),
                  ToggleButtonsSettings(themeCtrl),
                  FabChipSettings(themeCtrl),
                  PopupIconButtonSettings(themeCtrl),
                  SwitchesSettings(themeCtrl),
                  ListTileSettings(themeCtrl),
                  DialogSettings(themeCtrl),
                  MaterialAndBottomSheetSettings(themeCtrl),
                  CardSettings(themeCtrl),
                  TextThemeSettings(themeCtrl),
                  PrimaryTextThemeSettings(themeCtrl),
                  const PageExamples(),
                ].elementAt(itemIndex),
              ),
            ),
          ),
        ],
      );
    });
  }
}
