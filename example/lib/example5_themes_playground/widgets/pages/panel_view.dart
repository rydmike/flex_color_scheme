import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
import '../panels/input_colors/input_colors.dart';
import '../panels/introduction/introduction_panel.dart';
import '../panels/navigation_bar_settings/android_navigation_bar_settings.dart';
import '../panels/navigation_bar_settings/bottom_navigation_bar_settings.dart';
import '../panels/navigation_bar_settings/navigation_bar_settings.dart';
import '../panels/navigation_rail_settings/navigation_rail_settings.dart';
import '../panels/panel_item.dart';
import '../panels/panel_selector.dart';
import '../panels/popup_icon_button_settings/popup_icon_button_settings.dart';
import '../panels/seeded_color_scheme/seeded_color_scheme.dart';
import '../panels/showcase_panels/effective_colors.dart';
import '../panels/showcase_panels/theme_code.dart';
import '../panels/showcase_panels/widget_showcase.dart';
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

/// This is the smaller more focused single panel view of the Themes Playground.
///
/// It shows only one panel at a time as a PageView. This is a nice layout
/// on mid size screen, like tablets, might be preferable on a phone too.
class PanelView extends StatefulWidget {
  const PanelView({
    super.key,
    required this.themeController,
  });
  final ThemeController themeController;

  @override
  State<PanelView> createState() => _PanelViewState();
}

class _PanelViewState extends State<PanelView> with TickerProviderStateMixin {
  late final PageController pageController;
  late final ScrollController scrollController;
  late int previousPage;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: widget.themeController.viewIndex,
    );
    previousPage = widget.themeController.viewIndex;
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    pageController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeController themeCtrl = widget.themeController;
    final MediaQueryData media = MediaQuery.of(context);
    // Flag used to hide some blend mode options that wont fit when
    // using toggle buttons on small media.
    final bool showAllBlends = media.size.width > 445;
    final bool isPinned = media.size.height >= AppData.pinnedSelector;
    final bool isPhone = media.size.width < AppData.phoneWidthBreakpoint ||
        media.size.height < AppData.phoneHeightBreakpoint;
    final double margins = AppData.responsiveInsets(media.size.width);
    final double buttonHeight = AppData.panelButtonHeight +
        (isPhone ? AppData.panelButtonPhoneHeightReduce : 0);
    final double headerExtent = buttonHeight + media.padding.top + margins * 2;
    if (_debug) {
      debugPrint('headerExtent ............ : $headerExtent');
      debugPrint('margins ................. : $margins');
      debugPrint('kToolbarHeight .......... : $kToolbarHeight');
      debugPrint('media.viewPadding.top.... : ${media.viewPadding.top}');
      debugPrint('media.viewPadding.bottom. : ${media.viewPadding.bottom}');
      debugPrint('media.padding.top ....... : ${media.padding.top}');
      debugPrint('media.padding.bottom..... : ${media.padding.bottom}');
      debugPrint('media.size.width ........ : ${media.size.width}');
      debugPrint('media.size.height ....... : ${media.size.height}');
    }
    return NestedScrollView(
      controller: scrollController,
      headerSliverBuilder: (BuildContext context, bool value) {
        return <Widget>[
          SliverPersistentHeader(
            pinned: isPinned,
            floating: true,
            delegate: PanelSelectorHeaderDelegate(
              vsync: this,
              extent: headerExtent,
              page: themeCtrl.viewIndex,
              previousPage: previousPage,
              onChanged: (int page) {
                setState(() {
                  previousPage = themeCtrl.viewIndex;
                });
                themeCtrl.setViewIndex(page);
                pageController.animateToPage(page,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOutCubic);
              },
            ),
          ),
          // SliverAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: margins),
              child: ThemeSelector(controller: themeCtrl),
            ),
          ),
        ];
      },
      body: PageView.builder(
        controller: pageController,
        itemCount: panelItems.length,
        onPageChanged: (int page) {
          setState(() {
            previousPage = themeCtrl.viewIndex;
          });
          themeCtrl.setViewIndex(page);
        },
        itemBuilder: (BuildContext context, int page) {
          return <Widget>[
            PanelPage(IntroductionPanel(themeCtrl), page, themeCtrl),
            PanelPage(InputColors(themeCtrl), page, themeCtrl),
            PanelPage(SeededColorScheme(themeCtrl), page, themeCtrl),
            PanelPage(SurfaceBlends(themeCtrl, allBlends: showAllBlends), page,
                themeCtrl),
            PanelPage(EffectiveColors(themeCtrl), page, themeCtrl),
            PanelPage(ComponentThemes(themeCtrl), page, themeCtrl),
            PanelPage(TextFieldSettings(themeCtrl), page, themeCtrl),
            PanelPage(AppBarSettings(themeCtrl), page, themeCtrl),
            PanelPage(TabBarSettings(themeCtrl), page, themeCtrl),
            PanelPage(BottomNavigationBarSettings(themeCtrl), page, themeCtrl),
            PanelPage(NavigationBarSettings(themeCtrl), page, themeCtrl),
            PanelPage(NavigationRailSettings(themeCtrl), page, themeCtrl),
            PanelPage(AndroidNavigationBarSettings(themeCtrl), page, themeCtrl),
            PanelPage(ButtonsSettings(themeCtrl), page, themeCtrl),
            PanelPage(ToggleButtonsSettings(themeCtrl), page, themeCtrl),
            PanelPage(FabChipSettings(themeCtrl), page, themeCtrl),
            PanelPage(PopupIconButtonSettings(themeCtrl), page, themeCtrl),
            PanelPage(SwitchesSettings(themeCtrl), page, themeCtrl),
            PanelPage(ListTileSettings(themeCtrl), page, themeCtrl),
            PanelPage(DialogSettings(themeCtrl), page, themeCtrl),
            PanelPage(
                MaterialAndBottomSheetSettings(themeCtrl), page, themeCtrl),
            PanelPage(CardSettings(themeCtrl), page, themeCtrl),
            PanelPage(TextThemeSettings(themeCtrl), page, themeCtrl),
            PanelPage(PrimaryTextThemeSettings(themeCtrl), page, themeCtrl),
            PanelPage(const PageExamples(), page, themeCtrl),
            PanelPage(const WidgetShowcase(), page, themeCtrl),
            PanelPage(ThemeCode(themeCtrl), page, themeCtrl),
          ].elementAt(page);
        },
      ),
    );
  }
}

// A PanelPage wrapper that puts the content of our panels, in a ListView
// inside a HeaderCard. The ListView is needed so it grows as far as needed
// inside the page in the PageView.
class PanelPage extends StatelessWidget {
  const PanelPage(
    this.child,
    this.panelPage,
    this.controller, {
    super.key,
    this.showCodeView = true,
  });
  final Widget child;
  final int panelPage;
  final ThemeController controller;
  final bool showCodeView;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99),
            theme.colorScheme.onBackground)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F),
            theme.colorScheme.onBackground);

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      // A custom breakpoint, when the layout width is larger than 1200dp
      // we show the code panel in a side-by side view, but only if we are not
      // on the last 3 pages, there we do not want it.
      final bool showCodeSideBySide =
          constraints.maxWidth >= AppData.codeViewWidthBreakpoint &&
              panelPage < panelItems.length - 3;
      final double margins =
          AppData.responsiveInsets(MediaQuery.of(context).size.width);

      return ListView(
        padding: EdgeInsets.fromLTRB(
          margins,
          0,
          margins,
          margins + MediaQuery.of(context).padding.bottom,
        ),
        children: <Widget>[
          HeaderCard(
            title: Text(panelItems[panelPage].panelLabel),
            leading: Icon(panelItems[panelPage].icon, color: iconColor),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(child: child),
                if (showCodeSideBySide)
                  Expanded(
                    child: ThemeCode(controller),
                  ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
