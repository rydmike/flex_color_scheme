import 'package:flutter/material.dart';

import '../../../shared/controllers/theme_controller.dart';
import '../../../shared/pages/page_examples.dart';
import 'adaptive_theme/adaptive_theme_panel.dart';
import 'android_navigation_bar/android_navigation_bar_panel.dart';
import 'app_bar/app_bar_panel.dart';
import 'bottom_app_bar/bottom_app_bar_panel.dart';
import 'bottom_navigation_bar/bottom_navigation_bar_panel.dart';
import 'bottom_sheet/bottom_sheet_panel.dart';
import 'buttons/buttons_panel.dart';
import 'card/card_panel.dart';
import 'chip/chip_panel.dart';
import 'color_blends/color_blends_panel.dart';
import 'color_scheme/color_scheme_panel.dart';
import 'dialog/dialog_panel.dart';
import 'effective_colors/effective_colors_panel.dart';
import 'floating_action_button/floating_action_button_panel.dart';
import 'general/general_panel.dart';
import 'icon_button_avatar/icon_button_avatar_panel.dart';
import 'input_colors/input_colors_panel.dart';
import 'introduction/introduction_panel.dart';
import 'list_tile/list_tile_panel.dart';
import 'material/material_panel.dart';
import 'menus/menus_panel.dart';
import 'navigation_bar/navigation_bar_panel.dart';
import 'navigation_drawer/navigation_drawer_panel.dart';
import 'navigation_rail/navigation_rail_panel.dart';
import 'popup_menu_button/popup_menu_button_panel.dart';
import 'premade_designs/premade_designs_panel.dart';
import 'search_bar/search_bar_panel.dart';
import 'segmented_buttons/segmented_buttons_panel.dart';
import 'shape_radius/shape_radius_panel.dart';
import 'sliders/sliders_panel.dart';
import 'snack_bar_material_banner/snack_bar_material_banner_panel.dart';
import 'switch_check_radio/switch_check_radio_panel.dart';
import 'tab_bar/tab_bar_panel.dart';
import 'text_field/text_field_panel.dart';
import 'text_theme/primary_text_theme_panel.dart';
import 'text_theme/text_theme_panel.dart';
import 'theme_code/theme_code_panel.dart';
import 'theme_simulator/theme_simulator_panel.dart';
import 'tooltip_progressbar/tooltip_progressbar_settings.dart';
import 'widget_showcase/widget_showcase_panel.dart';

// ignore_for_file: comment_references

/// Used to select which one of all the theme topic panels in the
/// Themes Playground is shown as content in a panel.
///
/// The panels are used as content in the [PageView.builder] based view used
/// by the [TopicPage], the [TwoTopicsPage] and [].
class Panel extends StatelessWidget {
  const Panel(this.page, this.controller, {super.key});
  final int page;
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      IntroductionPanel(controller),
      PremadeDesignsPanel(controller),
      ThemeSimulatorPanel(controller: controller),
      const WidgetShowcasePanel(),
      ThemeCodePanel(controller),
      GeneralPanel(controller),
      AdaptiveThemePanel(controller),
      ShapeRadiusPanel(controller),
      InputColorsPanel(controller),
      ColorSchemePanel(controller),
      ColorBlendsPanel(controller),
      EffectiveColorsPanel(controller),
      ButtonsPanel(controller),
      SegmentedButtonsPanel(controller),
      FloatingActionButtonPanel(controller),
      ChipPanel(controller),
      SwitchCheckRadioPanel(controller),
      IconButtonAvatarPanel(controller),
      TooltipProgressBarPanel(controller),
      SlidersPanel(controller),
      TextFieldPanel(controller),
      PopupMenuButtonPanel(controller),
      MenusPanel(controller),
      AppBarPanel(controller),
      TabBarPanel(controller),
      SearchBarPanel(controller),
      BottomAppBarPanel(controller),
      BottomNavigationBarPanel(controller),
      NavigationBarPanel(controller),
      NavigationRailPanel(controller),
      NavigationDrawerPanel(controller),
      DialogPanel(controller),
      BottomSheetPanel(controller),
      SnackBarMaterialBannerPanel(controller),
      CardPanel(controller),
      const MaterialPanel(),
      ListTilePanel(controller),
      TextThemePanel(controller),
      PrimaryTextThemePanel(controller),
      AndroidNavigationBarPanel(controller),
      PageExamples(controller: controller),
    ].elementAt(page);
  }
}
