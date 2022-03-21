import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../shared/controllers/theme_controller.dart';
import '../../../shared/pages/sub_pages.dart';
import '../../../shared/widgets/universal/header_card.dart';
import '../../../shared/widgets/universal/switch_list_tile_adaptive.dart';
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
import '../panels/input_colors/theme_selector.dart';
import '../panels/introduction/introduction_panel.dart';
import '../panels/navigation_bar_settings/android_navigation_bar_settings.dart';
import '../panels/navigation_bar_settings/bottom_navigation_bar_settings.dart';
import '../panels/navigation_bar_settings/navigation_bar_settings.dart';
import '../panels/navigation_rail_settings/navigation_rail_settings.dart';
import '../panels/seeded_color_scheme/seeded_color_scheme.dart';
import '../panels/showcase_panels/effective_colors.dart';
import '../panels/showcase_panels/effective_setup_code.dart';
import '../panels/showcase_panels/widget_showcase.dart';
import '../panels/surface_blends/surface_blends.dart';
import '../panels/switch_settings/list_tile_settings.dart';
import '../panels/switch_settings/switch_settings.dart';
import '../panels/tab_bar_settings/tab_bar_settings.dart';
import '../panels/text_field_settings/text_field_settings.dart';
import '../panels/text_theme_settings/primary_text_theme_settings.dart';
import '../panels/text_theme_settings/text_theme_settings.dart';
import 'panel_selector.dart';

/// This is the smaller more focused single panel view of the Themes Playground.
///
/// It shows only one panel at a time as a PageView. This is a nice layout
/// on mid size screen, like tablets, might be preferable on a phone too.
class PanelView extends StatelessWidget {
  const PanelView({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData media = MediaQuery.of(context);
    // Paddings so content shows up in visible area when we use Scaffold props
    // extendBodyBehindAppBar and extendBody.
    final double topPadding = media.padding.top; // + kToolbarHeight;
    // final double bottomPadding = media.padding.bottom;
    // We are on phone width media, based on our definition in this app.

    final PageController pageController =
        PageController(initialPage: controller.viewIndex);

    return Stack(
      clipBehavior: Clip.hardEdge,
      children: <Widget>[
        CustomScrollView(
          controller: ScrollController(),
          slivers: <Widget>[
            SliverToBoxAdapter(child: SizedBox(height: topPadding + 130)),
            ControlPanel(controller: controller),
            SliverLayoutBuilder(
                builder: (BuildContext context, SliverConstraints constraints) {
              return PanelPage(
                controller: controller,
                pageController: pageController,
                constraints: constraints,
              );
            }),
          ],
        ),
        PanelSelector(
          index: controller.viewIndex,
          onChanged: (int index) {
            controller.setViewIndex(index);
            pageController.animateToPage(index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOutCubic);
          },
        )
      ],
    );
  }
}

class ControlPanel extends StatelessWidget {
  const ControlPanel({Key? key, required this.controller}) : super(key: key);

  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: HeaderCard(
          margin: EdgeInsets.zero,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: ThemeSelector(controller: controller),
              ),
              AlignedGridView.count(
                padding: EdgeInsets.zero,
                itemCount: 2,
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
                itemBuilder: (BuildContext context, int index) {
                  return <Widget>[
                    SwitchListTileAdaptive(
                      title: const Text('Use FlexColorScheme'),
                      value: controller.useFlexColorScheme,
                      onChanged: controller.setUseFlexColorScheme,
                    ),
                    SwitchListTileAdaptive(
                      title: const Text('Use component themes'),
                      value: controller.useSubThemes &&
                          controller.useFlexColorScheme,
                      onChanged: controller.useFlexColorScheme
                          ? controller.setUseSubThemes
                          : null,
                    ),
                  ].elementAt(index);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PanelPage extends StatelessWidget {
  const PanelPage({
    Key? key,
    required this.controller,
    required this.pageController,
    required this.constraints,
  }) : super(key: key);
  final ThemeController controller;
  final PageController pageController;
  final SliverConstraints constraints;

  // The number of cards in the page view, must
  // match the number of cards we add to grid view.
  static const int _nrOfCards = 27;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: SizedBox(
        height: constraints.remainingPaintExtent,
        child: PageView.builder(
          controller: pageController,
          itemCount: _nrOfCards,
          onPageChanged: controller.setViewIndex,
          itemBuilder: (BuildContext context, int page) {
            return PanelPageContent(
              key: ValueKey<int>(page),
              controller: controller,
              pageController: pageController,
              page: page,
            );
          },
        ),
      ),
    );
  }
}

class PanelPageContent extends StatelessWidget {
  const PanelPageContent(
      {Key? key,
      required this.controller,
      required this.pageController,
      required this.page})
      : super(key: key);
  final ThemeController controller;
  final PageController pageController;
  final int page;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Card(
        margin: EdgeInsets.zero,
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: <Widget>[
            IntroductionPanel(controller: controller),
            InputColors(
              controller: controller,
              showThemeSelector: false,
            ),
            SeededColorScheme(controller: controller),
            SurfaceBlends(
              controller: controller,
              showAllBlends: true,
            ),
            EffectiveColors(controller: controller),
            ComponentThemes(controller: controller),
            TextFieldSettings(controller: controller),
            AppBarSettings(controller: controller),
            TabBarSettings(controller: controller),
            NavigationBarSettings(controller: controller),
            BottomNavigationBarSettings(controller: controller),
            NavigationRailSettings(controller: controller),
            AndroidNavigationBarSettings(controller: controller),
            ButtonsSettings(controller: controller),
            FabToggleChipPopupSettings(controller: controller),
            SwitchesSettings(controller: controller),
            const ListTileSettings(),
            DialogSettings(controller: controller),
            const TimePickerDialogSettings(),
            const DatePickerDialogSettings(),
            MaterialAndBottomSheetSettings(controller: controller),
            CardSettings(controller: controller),
            TextThemeSettings(controller: controller),
            PrimaryTextThemeSettings(controller: controller),
            const SubPagesDemo(),
            const WidgetShowcase(),
            EffectiveSetupCode(controller: controller),
          ].elementAt(page),
        ),
      ),
      // ),
    );
  }
}
