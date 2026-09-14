import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/adaptive_theme/adaptive_theme_panel.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/android_navigation_bar/android_navigation_bar_panel.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/app_bar/app_bar_panel.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/bottom_app_bar/bottom_app_bar_panel.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/bottom_navigation_bar/bottom_navigation_bar_panel.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/bottom_sheet/bottom_sheet_panel.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/buttons/buttons_panel.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/card/card_panel.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/chip/chip_panel.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/color_blends/color_blends_panel.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/color_scheme/color_scheme_panel.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/dialog/dialog_panel.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/effective_colors/effective_colors_panel.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/floating_action_button/floating_action_button_panel.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/general/general_panel.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/icon_button_avatar/icon_button_avatar_panel.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/input_colors/input_colors_panel.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/introduction/introduction_panel.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/list_tile/list_tile_panel.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/material/material_panel.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/menus/menus_panel.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/navigation_bar/navigation_bar_panel.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/navigation_drawer/navigation_drawer_panel.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/navigation_rail/navigation_rail_panel.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/popup_menu_button/popup_menu_button_panel.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/premade_designs/premade_designs_panel.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/progress_indicator/progress_indicator_panel.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/search_bar/search_bar_panel.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/segmented_buttons/segmented_buttons_panel.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/shape_radius/shape_radius_panel.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/sliders/sliders_panel.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/snack_bar_material_banner/snack_bar_material_banner_panel.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/switch_check_radio/switch_check_radio_panel.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/tab_bar/tab_bar_panel.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/text_field/text_field_panel.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/text_theme/primary_text_theme_panel.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/text_theme/text_theme_panel.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/theme_code/theme_code_panel.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/theme_export_import/theme_export_import_panel.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/theme_simulator/theme_simulator_panel.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/tooltip_progressbar/tooltip_panel.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/widget_showcase/widget_showcase_panel.dart';
import 'package:flex_color_scheme_example/shared/controllers/theme_controller.dart';
import 'package:flex_color_scheme_example/shared/pages/page_examples.dart';
import 'package:material_ui/material_ui.dart';

/// Used to select which one of all the theme topic panels in the
/// Themes Playground is shown as content in a panel.
///
/// The panels are used as content in a [PageView.builder].
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
      ThemeExportImportPanel(controller),
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
      TooltipPanel(controller),
      ProgressIndicatorPanel(controller),
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
