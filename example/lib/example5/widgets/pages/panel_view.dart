import 'package:flutter/material.dart';

import '../../../shared/const/app_data.dart';
import '../../../shared/controllers/theme_controller.dart';
import '../../../shared/pages/page_examples.dart';
import '../../../shared/widgets/universal/header_card.dart';
import '../../../shared/widgets/universal/switch_list_tile_adaptive.dart';
import '../panels/app_bar_settings/app_bar_settings.dart';
import '../panels/buttons_settings/buttons_settings.dart';
import '../panels/card_and_material_settings/card_settings.dart';
import '../panels/card_and_material_settings/material_and_bottom_sheet_settings.dart';
import '../panels/component_themes/component_themes.dart';
import '../panels/dialog_settings/dialog_settings.dart';
import '../panels/fab_toggle_chip_popup_settings/fab_toggle_chip_popup_settings.dart';
import '../panels/input_colors/input_colors.dart';
import '../panels/input_colors/theme_selector.dart';
import '../panels/introduction/introduction_panel.dart';
import '../panels/navigation_bar_settings/android_navigation_bar_settings.dart';
import '../panels/navigation_bar_settings/bottom_navigation_bar_settings.dart';
import '../panels/navigation_bar_settings/navigation_bar_settings.dart';
import '../panels/navigation_rail_settings/navigation_rail_settings.dart';
import '../panels/panel_item.dart';
import '../panels/panel_selector.dart';
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

/// This is the smaller more focused single panel view of the Themes Playground.
///
/// It shows only one panel at a time as a PageView. This is a nice layout
/// on mid size screen, like tablets, might be preferable on a phone too.
class PanelView extends StatefulWidget {
  const PanelView({
    Key? key,
    required this.tc,
  }) : super(key: key);
  final ThemeController tc;

  @override
  State<PanelView> createState() => _PanelViewState();
}

class _PanelViewState extends State<PanelView> {
  late final ScrollController scrollController;
  late final PageController pageController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    pageController = PageController(
      initialPage: widget.tc.viewIndex,
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: ScrollController(),
      headerSliverBuilder: (BuildContext context, bool value) {
        return <Widget>[
          SliverToBoxAdapter(
            child: PanelSelector(
              index: widget.tc.viewIndex,
              onChanged: (int index) {
                widget.tc.setViewIndex(index);
                pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOutCubic);
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: ControlPanel(controller: widget.tc),
            ),
          ),
        ];
      },
      body: PageView.builder(
        controller: pageController,
        itemCount: panelItems.length,
        onPageChanged: widget.tc.setViewIndex,
        itemBuilder: (BuildContext context, int page) {
          return <Widget>[
            PanelPage(
                IntroductionPanel(controller: widget.tc), page, widget.tc),
            PanelPage(
                InputColors(controller: widget.tc, showThemeSelector: false),
                page,
                widget.tc),
            PanelPage(
                SeededColorScheme(controller: widget.tc), page, widget.tc),
            PanelPage(SurfaceBlends(controller: widget.tc, showAllBlends: true),
                page, widget.tc),
            PanelPage(EffectiveColors(controller: widget.tc), page, widget.tc),
            PanelPage(ComponentThemes(controller: widget.tc), page, widget.tc),
            PanelPage(
                TextFieldSettings(controller: widget.tc), page, widget.tc),
            PanelPage(AppBarSettings(controller: widget.tc), page, widget.tc),
            PanelPage(TabBarSettings(controller: widget.tc), page, widget.tc),
            PanelPage(
                NavigationBarSettings(controller: widget.tc), page, widget.tc),
            PanelPage(BottomNavigationBarSettings(controller: widget.tc), page,
                widget.tc),
            PanelPage(
                NavigationRailSettings(controller: widget.tc), page, widget.tc),
            PanelPage(AndroidNavigationBarSettings(controller: widget.tc), page,
                widget.tc),
            PanelPage(ButtonsSettings(controller: widget.tc), page, widget.tc),
            PanelPage(FabToggleChipPopupSettings(controller: widget.tc), page,
                widget.tc),
            PanelPage(SwitchesSettings(controller: widget.tc), page, widget.tc),
            PanelPage(ListTileSettings(controller: widget.tc), page, widget.tc),
            PanelPage(DialogSettings(controller: widget.tc), page, widget.tc),
            PanelPage(MaterialAndBottomSheetSettings(controller: widget.tc),
                page, widget.tc),
            PanelPage(CardSettings(controller: widget.tc), page, widget.tc),
            PanelPage(
                TextThemeSettings(controller: widget.tc), page, widget.tc),
            PanelPage(PrimaryTextThemeSettings(controller: widget.tc), page,
                widget.tc),
            PanelPage(const PageExamples(), page, widget.tc),
            PanelPage(const WidgetShowcase(), page, widget.tc),
            PanelPage(ThemeCode(controller: widget.tc), page, widget.tc),
          ].elementAt(page);
        },
      ),
    );
  }
}

// A PanelPAge wrapper that puts the content of our panels, in a ListView
// inside in HeaderCard, the ListView is needed so it can scrolls inside
// the PageView.
class PanelPage extends StatelessWidget {
  const PanelPage(
    this.child,
    this.panelPage,
    this.controller, {
    Key? key,
    this.showCodeView = true,
  }) : super(key: key);
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
      // we show the code panel in side-by side view, but only if we are not
      // the last 3 pages where we do not want it.
      final bool showCodeSideBySide =
          constraints.maxWidth >= 1200 && panelPage < panelItems.length - 3;
      return ListView(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
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
                    child: ThemeCode(controller: controller),
                  ),
              ],
            ),
          ),
        ],
      );
    });
  }
}

class ControlPanel extends StatelessWidget {
  const ControlPanel({Key? key, required this.controller}) : super(key: key);

  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    // We are on phone width media, adjust size a bit, make it tighter:
    final bool isPhone =
        MediaQuery.of(context).size.width < AppData.phoneBreakpoint;

    return HeaderCard(
      margin: EdgeInsets.zero,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
            child: ThemeSelector(controller: controller),
          ),
          Row(children: <Widget>[
            Expanded(
              child: SwitchListTileAdaptive(
                title: const Text('Flex\u200BColor\u200BScheme'),
                dense: isPhone,
                value: controller.useFlexColorScheme,
                onChanged: controller.setUseFlexColorScheme,
              ),
            ),
            Expanded(
              child: SwitchListTileAdaptive(
                title: const Text('Compo\u200Bnent themes'),
                dense: isPhone,
                value: controller.useSubThemes && controller.useFlexColorScheme,
                onChanged: controller.useFlexColorScheme
                    ? controller.setUseSubThemes
                    : null,
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
