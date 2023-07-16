import 'package:flutter/material.dart';

import '../../../shared/controllers/theme_controller.dart';
import '../../../shared/pages/page_examples.dart';
import '../panels/adaptive_theme_settings/adaptive_theme_settings.dart';
import '../panels/android_navigation_bar_settings/android_navigation_bar_settings.dart';
import '../panels/app_bar_settings/app_bar_settings.dart';
import '../panels/bottom_app_bar_search_bar_settings/bottom_app_bar_search_bar_settings.dart';
import '../panels/bottom_navigation_bar_settings/bottom_navigation_bar_settings.dart';
import '../panels/bottom_sheet_settings/bottom_sheet_settings.dart';
import '../panels/buttons_settings/buttons_settings.dart';
import '../panels/card_settings/card_settings.dart';
import '../panels/component_settings/component_settings.dart';
import '../panels/dialog_settings/dialog_settings.dart';
import '../panels/effective_colors/effective_colors.dart';
import '../panels/fab_chip_settings/fab_chip_settings.dart';
import '../panels/icon_button_avatar_settings/icon_button_avatar_settings.dart';
import '../panels/introduction/introduction_panel.dart';
import '../panels/list_tile_settings/list_tile_settings.dart';
import '../panels/material_panel/material_panel.dart';
import '../panels/menu_settings/menu_settings.dart';
import '../panels/navigation_bar_settings/navigation_bar_settings.dart';
import '../panels/navigation_drawer_settings/navigation_drawer_settings.dart';
import '../panels/navigation_rail_settings/navigation_rail_settings.dart';
import '../panels/popup_menu_button_settings/popup_menu_button_settings.dart';
import '../panels/premade_designs/premade_designs_panel.dart';
import '../panels/seeded_color_scheme_settings/seeded_color_scheme_settings.dart';
import '../panels/segmented_buttons_settings/segmented_buttons_settings.dart';
import '../panels/shape_radius_settings/shape_radius_settings.dart';
import '../panels/slider_settings/slider_settings.dart';
import '../panels/snack_bar_material_banner_settings/snack_bar_material_banner_settings.dart';
import '../panels/surface_blend_settings/surface_blend_settings.dart';
import '../panels/switch_settings/switch_settings.dart';
import '../panels/tab_bar_settings/tab_bar_settings.dart';
import '../panels/text_field_settings/text_field_settings.dart';
import '../panels/text_theme_settings/primary_text_theme_settings.dart';
import '../panels/text_theme_settings/text_theme_settings.dart';
import '../panels/theme_code/theme_code.dart';
import '../panels/theme_colors_settings/theme_colors_settings.dart';
import '../panels/theme_simulator/theme_simulator.dart';
import '../panels/tooltip_progressbar_settings/tooltip_progressbar_settings.dart';
import '../panels/widget_showcase/widget_showcase.dart';

// ignore_for_file: comment_references

/// Used to select which one of all the theme topic panels in the
/// Themes Playground is shown as content.
///
/// The panels are used as content in the [SliverMasonryGrid.count] builder
/// based page [ThemeTopicsGridPage] and the [PageView.builder] based view used
/// by the [ThemeTopicPage] and in the [ThemeTwoTopicsPage].
class ThemePanel extends StatelessWidget {
  const ThemePanel(this.page, this.controller, {super.key});
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
      ThemeColorsSettings(controller),
      SeededColorSchemeSettings(controller),
      SurfaceBlendSettings(controller),
      EffectiveColors(controller),
      ComponentSettings(controller),
      AdaptiveThemeSettings(controller),
      ShapeRadiusSettings(controller),
      ButtonsSettings(controller),
      SegmentedButtonsSettings(controller),
      FabChipSettings(controller),
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
