import 'package:flutter/material.dart';

import '../../../shared/const/app_color.dart';
import '../../../shared/controllers/theme_controller.dart';
import '../../../shared/pages/sub_pages.dart';
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
import '../panels/seeded_color_scheme/use_key_colors_buttons.dart';
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

/// This is the smaller mor focused vied of the Themes Playground.
///
/// It shows only one panel at a time as a PageView.
class FocusedView extends StatelessWidget {
  const FocusedView({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final ThemeController controller;

  // The number of cards in the page view, must
  // match the number of cards we add to grid view.
  static const int _nrOfCards = 27;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData media = MediaQuery.of(context);
    // Paddings so content shows up in visible area when we use Scaffold props
    // extendBodyBehindAppBar and extendBody.
    final double topPadding = media.padding.top; // + kToolbarHeight;
    final double bottomPadding = media.padding.bottom;
    // We are on phone width media, based on our definition in this app.
    final PageController pageController =
        PageController(initialPage: controller.viewIndex);
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        topPadding,
        0,
        bottomPadding + 16,
      ),
      child: Column(
        children: <Widget>[
          PanelSelector(
            index: controller.viewIndex,
            onChanged: (int index) {
              controller.setViewIndex(index);
              pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 350),
                  curve: Curves.easeOutCubic);
            },
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Card(
              margin: EdgeInsets.zero,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: ThemeSelector(controller: controller),
                  ),
                  SwitchListTileAdaptive(
                    title: const Text('FlexColorScheme ON/OFF'),
                    value: controller.useFlexColorScheme,
                    onChanged: controller.setUseFlexColorScheme,
                  ),
                  SwitchListTileAdaptive(
                    title: const Text('Component themes ON/OFF'),
                    value: controller.useSubThemes &&
                        controller.useFlexColorScheme,
                    onChanged: controller.useFlexColorScheme
                        ? controller.setUseSubThemes
                        : null,
                  ),
                  ListTile(
                    title:
                        const Text('Use effective input colors as keys to seed '
                            'the ColorScheme'),
                    subtitle: Text(AppColor.explainUsedColors(controller)),
                    trailing: UseKeyColorsButtons(controller: controller),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: _nrOfCards,
              onPageChanged: controller.setViewIndex,
              itemBuilder: (BuildContext context, int index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Card(
                  margin: EdgeInsets.zero,
                  elevation: 0,
                  clipBehavior: Clip.antiAlias,
                  child: SingleChildScrollView(
                    controller: ScrollController(),
                    // clipBehavior: Clip.antiAlias,
                    child: <Widget>[
                      IntroductionPanel(controller: controller),
                      InputColors(
                        controller: controller,
                        showThemeSelector: false,
                      ),
                      SeededColorScheme(
                        controller: controller,
                        showKeyButtons: false,
                      ),
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
                    ].elementAt(index),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
