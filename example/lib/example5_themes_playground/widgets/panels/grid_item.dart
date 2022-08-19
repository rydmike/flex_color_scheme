import 'package:flutter/material.dart';

// A class to hold the data we need to display on our grid panel headers and
// buttons.
//
// The item class is separate for Page Panel view and Grid Panel view, because
// the order is different for the code view and the show case is not
// included in the grid view, since you see all the widgets in the grid
// already.
@immutable
class GridItem {
  const GridItem({
    required this.panelLabel,
    String? buttonLabel,
    required this.icon,
  }) : _buttonLabel = buttonLabel;

  final String panelLabel;
  final IconData icon;
  final String? _buttonLabel;
  String get buttonLabel => _buttonLabel ?? panelLabel;
}

const List<GridItem> gridItems = <GridItem>[
  GridItem(
    panelLabel: 'Introduction',
    icon: Icons.info_outlined,
  ),
  GridItem(
    panelLabel: 'Theme Code',
    buttonLabel: 'Theme\ncode',
    icon: Icons.integration_instructions_outlined,
  ),
  GridItem(
    panelLabel: 'Input Colors',
    buttonLabel: 'Input\ncolors',
    icon: Icons.palette_outlined,
  ),
  GridItem(
    panelLabel: 'Seeded ColorScheme',
    buttonLabel: 'Seeded\nColorScheme',
    icon: Icons.colorize_outlined,
  ),
  GridItem(
    panelLabel: 'Surface Blends',
    buttonLabel: 'Surface\nblends',
    icon: Icons.invert_colors_outlined,
  ),
  GridItem(
    panelLabel: 'Effective Colors',
    buttonLabel: 'Effective\ncolors',
    icon: Icons.gradient_outlined,
  ),
  GridItem(
    panelLabel: 'Component Themes',
    buttonLabel: 'Component\nthemes',
    icon: Icons.widgets_outlined,
  ),
  GridItem(
    panelLabel: 'TextField',
    icon: Icons.pin_outlined,
  ),
  GridItem(
    panelLabel: 'AppBar',
    icon: Icons.web_asset_outlined,
  ),
  GridItem(
    panelLabel: 'TabBar',
    icon: Icons.tab_outlined,
  ),
  GridItem(
    panelLabel: 'BottomNavigationBar',
    buttonLabel: 'Bottom\nNavigationBar',
    icon: Icons.video_label,
  ),
  GridItem(
    panelLabel: 'NavigationBar',
    buttonLabel: 'Navigation\nBar',
    icon: Icons.call_to_action,
  ),
  GridItem(
    panelLabel: 'NavigationRail',
    buttonLabel: 'Navigation\nRail',
    icon: Icons.view_sidebar_outlined,
  ),
  GridItem(
    panelLabel: 'Android System Navigation Bar',
    buttonLabel: 'AndroidBar',
    icon: Icons.android_outlined,
  ),
  GridItem(
    panelLabel: 'Material Buttons',
    buttonLabel: 'Material\nButtons',
    icon: Icons.crop_16_9_outlined,
  ),
  GridItem(
    panelLabel: 'Toggle Buttons',
    buttonLabel: 'Toggle\nButtons',
    icon: Icons.view_week_outlined,
  ),
  GridItem(
    panelLabel: 'FloatingActionButton and Chip',
    buttonLabel: 'FAB Toggle\nChip Popup',
    icon: Icons.add_circle,
  ),
  GridItem(
    panelLabel: 'PopupMenu and IconButton',
    buttonLabel: 'Popup and\nIconButton',
    icon: Icons.arrow_drop_down_circle_outlined,
  ),
  GridItem(
    panelLabel: 'Switch, CheckBox and Radio',
    buttonLabel: 'Switch\nCheck Radio',
    icon: Icons.toggle_on_outlined,
  ),
  GridItem(
    panelLabel: 'ListTile',
    buttonLabel: 'ListTile',
    icon: Icons.dns_outlined,
  ),
  GridItem(
    panelLabel: 'Dialogs',
    icon: Icons.branding_watermark_outlined,
  ),
  GridItem(
    panelLabel: 'Material, Banner, Sheet and SnackBar',
    buttonLabel: 'Material\nBanner, Snack',
    icon: Icons.call_to_action_outlined,
  ),
  GridItem(
    panelLabel: 'Card',
    buttonLabel: 'Card',
    icon: Icons.picture_in_picture_alt_outlined,
  ),
  GridItem(
    panelLabel: 'TextTheme',
    buttonLabel: 'Text\nTheme',
    icon: Icons.font_download_outlined,
  ),
  GridItem(
    panelLabel: 'PrimaryTextTheme',
    buttonLabel: 'Primary\nTextTheme',
    icon: Icons.font_download,
  ),
  GridItem(
    panelLabel: 'Page Examples',
    buttonLabel: 'Page\nExamples',
    icon: Icons.article_outlined,
  ),
];
