import 'package:flutter/material.dart';

// A class to hold the data we need to display on our page panel headers and
// buttons.
//
// The item class is separate for Page Panel view and Grid Panel view, because
// the order is different for the code view and the show case is not
// included in the grid view, since you see all the widgets in the grid
// already.
@immutable
class PanelItem {
  const PanelItem({
    required this.panelLabel,
    String? buttonLabel,
    required this.icon,
  }) : _buttonLabel = buttonLabel;

  final String panelLabel;
  final IconData icon;
  final String? _buttonLabel;
  String get buttonLabel => _buttonLabel ?? panelLabel;
}

const List<PanelItem> panelItems = <PanelItem>[
  PanelItem(
    panelLabel: 'Introduction',
    icon: Icons.info_outlined,
  ),
  PanelItem(
    panelLabel: 'Theme Colors',
    buttonLabel: 'Theme\ncolors',
    icon: Icons.palette_outlined,
  ),
  PanelItem(
    panelLabel: 'Seeded ColorScheme',
    buttonLabel: 'Seeded\nColorScheme',
    icon: Icons.colorize_outlined,
  ),
  PanelItem(
    panelLabel: 'Surface Blends',
    buttonLabel: 'Surface\nblends',
    icon: Icons.invert_colors_outlined,
  ),
  PanelItem(
    panelLabel: 'Effective Colors',
    buttonLabel: 'Effective\ncolors',
    icon: Icons.gradient_outlined,
  ),
  PanelItem(
    panelLabel: 'Component Themes',
    buttonLabel: 'Component\nthemes',
    icon: Icons.widgets_outlined,
  ),
  PanelItem(
    panelLabel: 'TextField',
    icon: Icons.pin_outlined,
  ),
  PanelItem(
    panelLabel: 'AppBar and BottomAppBar',
    buttonLabel: 'AppBar\nBottomAppBar',
    icon: Icons.web_asset_outlined,
  ),
  PanelItem(
    panelLabel: 'TabBar',
    icon: Icons.tab_outlined,
  ),
  PanelItem(
    panelLabel: 'BottomNavigationBar',
    buttonLabel: 'Bottom\nNavigationBar',
    icon: Icons.video_label,
  ),
  PanelItem(
    panelLabel: 'NavigationBar',
    buttonLabel: 'Navigation\nBar',
    icon: Icons.call_to_action,
  ),
  PanelItem(
    panelLabel: 'NavigationRail',
    buttonLabel: 'Navigation\nRail',
    icon: Icons.view_sidebar_rounded,
  ),
  PanelItem(
    panelLabel: 'NavigationDrawer',
    buttonLabel: 'Navigation\nDrawer',
    icon: Icons.featured_video_outlined,
  ),
  PanelItem(
    panelLabel: 'Material Buttons',
    buttonLabel: 'Material\nButtons',
    icon: Icons.crop_16_9_outlined,
  ),
  PanelItem(
    panelLabel: 'Selection Buttons',
    buttonLabel: 'Selection\nButtons',
    icon: Icons.view_week_outlined,
  ),
  PanelItem(
    panelLabel: 'FloatingActionButton and Chip',
    buttonLabel: 'FAB and\nChip',
    icon: Icons.add_circle,
  ),
  PanelItem(
    panelLabel: 'Menus',
    buttonLabel: 'Menus',
    icon: Icons.arrow_drop_down_circle_outlined,
  ),
  PanelItem(
    panelLabel: 'Tooltip, IconButton, CircleAvatar and DropdownButton ',
    buttonLabel: 'Tooltip, Icon\nAvatar, Drop',
    icon: Icons.live_help_outlined,
  ),
  PanelItem(
    panelLabel: 'Switch, CheckBox and Radio',
    buttonLabel: 'Switch\nCheck Radio',
    icon: Icons.toggle_on_outlined,
  ),
  PanelItem(
    panelLabel: 'Slider',
    buttonLabel: 'Slider',
    icon: Icons.tune,
  ),
  PanelItem(
    panelLabel: 'ListTile',
    buttonLabel: 'ListTile',
    icon: Icons.dns_outlined,
  ),
  PanelItem(
    panelLabel: 'Dialogs',
    icon: Icons.branding_watermark_outlined,
  ),
  PanelItem(
    panelLabel: 'BottomSheet, MaterialBanner and SnackBar',
    buttonLabel: 'BottomSheet\nBanner, Snack',
    icon: Icons.call_to_action_outlined,
  ),
  PanelItem(
    panelLabel: 'Material',
    buttonLabel: 'Material',
    icon: Icons.square,
  ),
  PanelItem(
    panelLabel: 'Card',
    buttonLabel: 'Card',
    icon: Icons.picture_in_picture_alt_outlined,
  ),
  PanelItem(
    panelLabel: 'TextTheme',
    buttonLabel: 'Text\nTheme',
    icon: Icons.font_download_outlined,
  ),
  PanelItem(
    panelLabel: 'PrimaryTextTheme',
    buttonLabel: 'Primary\nTextTheme',
    icon: Icons.font_download,
  ),
  PanelItem(
    panelLabel: 'Theme simulator',
    buttonLabel: 'Theme\nsimulator',
    icon: Icons.phone_iphone,
  ),
  PanelItem(
    panelLabel: 'Android system navigation bar',
    buttonLabel: 'Android\nSystem Nav',
    icon: Icons.android_outlined,
  ),
  PanelItem(
    panelLabel: 'Page examples',
    buttonLabel: 'Page\nexamples',
    icon: Icons.article_outlined,
  ),
  PanelItem(
    panelLabel: 'Widget Showcase',
    buttonLabel: 'Widget\nshowcase',
    icon: Icons.flutter_dash,
  ),
  PanelItem(
    panelLabel: 'Theme code',
    buttonLabel: 'Theme\ncode',
    icon: Icons.integration_instructions_outlined,
  ),
];
