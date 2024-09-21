import 'package:flutter/material.dart';

import '../../../shared/controllers/theme_controller.dart';
import '../../../shared/pages/page_examples.dart';
import 'adaptive_theme_settings/adaptive_theme_settings.dart';
import 'android_navigation_bar_settings/android_navigation_bar_settings.dart';
import 'app_bar_settings/app_bar_settings.dart';
import 'bottom_app_bar_search_bar_settings/bottom_app_bar_search_bar_settings.dart';
import 'bottom_navigation_bar_settings/bottom_navigation_bar_settings.dart';
import 'bottom_sheet_settings/bottom_sheet_settings.dart';
import 'buttons_settings/buttons_settings.dart';
import 'card_settings/card_settings.dart';
import 'chip_settings/chip_settings.dart';
import 'color_blends_settings/color_blends_settings.dart';
import 'color_scheme_settings/color_scheme_settings.dart';
import 'dialog_settings/dialog_settings.dart';
import 'effective_colors/effective_colors.dart';
import 'fab_settings/fab_settings.dart';
import 'general_settings/general_settings.dart';
import 'icon_button_avatar_settings/icon_button_avatar_settings.dart';
import 'input_colors_settings/input_colors_settings.dart';
import 'introduction/introduction_panel.dart';
import 'list_tile_settings/list_tile_settings.dart';
import 'material_panel/material_panel.dart';
import 'menu_settings/menu_settings.dart';
import 'navigation_bar_settings/navigation_bar_settings.dart';
import 'navigation_drawer_settings/navigation_drawer_settings.dart';
import 'navigation_rail_settings/navigation_rail_settings.dart';
import 'popup_menu_button_settings/popup_menu_button_settings.dart';
import 'premade_designs/premade_designs_panel.dart';
import 'segmented_buttons_settings/segmented_buttons_settings.dart';
import 'shape_radius_settings/shape_radius_settings.dart';
import 'slider_settings/slider_settings.dart';
import 'snack_bar_material_banner_settings/snack_bar_material_banner_settings.dart';
import 'switch_settings/switch_settings.dart';
import 'tab_bar_settings/tab_bar_settings.dart';
import 'text_field_settings/text_field_settings.dart';
import 'text_theme_settings/primary_text_theme_settings.dart';
import 'text_theme_settings/text_theme_settings.dart';
import 'theme_code/theme_code.dart';
import 'theme_simulator/theme_simulator.dart';
import 'tooltip_progressbar_settings/tooltip_progressbar_settings.dart';
import 'widget_showcase/widget_showcase.dart';

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
      ThemeSimulator(controller: controller),
      const WidgetShowcase(),
      ThemeCode(controller),
      GeneralSettings(controller),
      AdaptiveThemeSettings(controller),
      ShapeRadiusSettings(controller),
      InputColorsSettings(controller),
      ColorSchemeSettings(controller),
      ColorBlendsSettings(controller),
      EffectiveColors(controller),
      ButtonsSettings(controller),
      SegmentedButtonsSettings(controller),
      FabSettings(controller),
      ChipSettings(controller),
      SwitchesSettings(controller),
      IconButtonAvatarSettings(controller),
      TooltipProgressBarSettings(controller),
      SliderSettings(controller),
      TextFieldSettings(controller),
      PopupMenuButtonSettings(controller),
      MenuSettings(controller),
      AppBarSettings(controller),
      TabBarSettings(controller),
      BottomAppBarSearchBarSettings(controller),
      BottomNavigationBarSettings(controller),
      NavigationBarSettings(controller),
      NavigationRailSettings(controller),
      NavigationDrawerSettings(controller),
      DialogSettings(controller),
      BottomSheetSettings(controller),
      SnackBarMaterialBannerSettings(controller),
      CardSettings(controller),
      const MaterialPanel(),
      ListTileSettings(controller),
      TextThemeSettings(controller),
      PrimaryTextThemeSettings(controller),
      AndroidNavigationBarSettings(controller),
      PageExamples(controller: controller),
    ].elementAt(page);
  }
}
