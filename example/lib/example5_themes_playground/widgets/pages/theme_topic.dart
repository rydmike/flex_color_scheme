import 'package:flutter/material.dart';

// ignore_for_file: comment_references

/// A class to hold the heading data we need to display in our [ThemePanel]
/// topic panels headers and selection buttons.
@immutable
class ThemeTopic {
  const ThemeTopic({
    required this.heading,
    String? buttonLabel,
    required this.icon,
  }) : _buttonLabel = buttonLabel;

  final String heading;
  final IconData icon;
  final String? _buttonLabel;
  String get buttonLabel => _buttonLabel ?? heading;
}

const List<ThemeTopic> themeTopics = <ThemeTopic>[
  ThemeTopic(
    heading: 'Introduction',
    icon: Icons.info_outlined,
  ),
  ThemeTopic(
    heading: 'Premade designs',
    buttonLabel: 'Premade\ndesigns',
    icon: Icons.design_services_outlined,
  ),
  ThemeTopic(
    heading: 'Theme simulator',
    buttonLabel: 'Theme\nsimulator',
    icon: Icons.phone_iphone,
  ),
  ThemeTopic(
    heading: 'Theme code',
    buttonLabel: 'Theme\ncode',
    icon: Icons.integration_instructions_outlined,
  ),
  ThemeTopic(
    heading: 'Component themes',
    buttonLabel: 'Component\nthemes',
    icon: Icons.widgets_outlined,
  ),
  ThemeTopic(
    heading: 'Theme colors',
    buttonLabel: 'Theme\ncolors',
    icon: Icons.palette_outlined,
  ),
  ThemeTopic(
    heading: 'Seeded ColorScheme',
    buttonLabel: 'Seeded\nColorScheme',
    icon: Icons.colorize_outlined,
  ),
  ThemeTopic(
    heading: 'Surface blends',
    buttonLabel: 'Surface\nblends',
    icon: Icons.invert_colors_outlined,
  ),
  ThemeTopic(
    heading: 'Effective colors',
    buttonLabel: 'Effective\ncolors',
    icon: Icons.gradient_outlined,
  ),
  ThemeTopic(
    heading: 'TextField',
    icon: Icons.pin_outlined,
  ),
  ThemeTopic(
    heading: 'AppBar and BottomAppBar',
    buttonLabel: 'AppBar',
    icon: Icons.web_asset_outlined,
  ),
  ThemeTopic(
    heading: 'TabBar',
    icon: Icons.tab_outlined,
  ),
  ThemeTopic(
    heading: 'BottomNavigationBar',
    buttonLabel: 'Bottom\nNavigationBar',
    icon: Icons.video_label,
  ),
  ThemeTopic(
    heading: 'NavigationBar',
    buttonLabel: 'Navigation\nBar',
    icon: Icons.call_to_action,
  ),
  ThemeTopic(
    heading: 'NavigationRail',
    buttonLabel: 'Navigation\nRail',
    icon: Icons.view_sidebar_rounded,
  ),
  ThemeTopic(
    heading: 'NavigationDrawer',
    buttonLabel: 'Navigation\nDrawer',
    icon: Icons.featured_video_outlined,
  ),
  ThemeTopic(
    heading: 'Material buttons',
    buttonLabel: 'Material\nbuttons',
    icon: Icons.crop_16_9_outlined,
  ),
  ThemeTopic(
    heading: 'Selection buttons',
    buttonLabel: 'Selection\nbuttons',
    icon: Icons.view_week_outlined,
  ),
  ThemeTopic(
    heading: 'FloatingActionButton and Chip',
    buttonLabel: 'FAB and\nChip',
    icon: Icons.add_circle,
  ),
  ThemeTopic(
    heading: 'Menus',
    buttonLabel: 'Menus',
    icon: Icons.arrow_drop_down_circle_outlined,
  ),
  ThemeTopic(
    heading: 'Tooltip, IconButton, CircleAvatar and DropdownButton ',
    buttonLabel: 'Tooltip, Icon\nAvatar, Drop',
    icon: Icons.live_help_outlined,
  ),
  ThemeTopic(
    heading: 'Switch, CheckBox and Radio',
    buttonLabel: 'Switch\nCheck Radio',
    icon: Icons.toggle_on_outlined,
  ),
  ThemeTopic(
    heading: 'Slider',
    buttonLabel: 'Slider',
    icon: Icons.tune,
  ),
  ThemeTopic(
    heading: 'ListTile',
    buttonLabel: 'ListTile',
    icon: Icons.dns_outlined,
  ),
  ThemeTopic(
    heading: 'Dialogs',
    icon: Icons.branding_watermark_outlined,
  ),
  ThemeTopic(
    heading: 'BottomSheet, SnackBar and MaterialBanner',
    buttonLabel: 'BottomSheet\nSnack Banner',
    icon: Icons.call_to_action_outlined,
  ),
  ThemeTopic(
    heading: 'Card',
    buttonLabel: 'Card',
    icon: Icons.picture_in_picture_alt_outlined,
  ),
  ThemeTopic(
    heading: 'TextTheme',
    buttonLabel: 'Text\nTheme',
    icon: Icons.font_download_outlined,
  ),
  ThemeTopic(
    heading: 'PrimaryTextTheme',
    buttonLabel: 'Primary\nTextTheme',
    icon: Icons.font_download,
  ),
  ThemeTopic(
    heading: 'Widget showcase',
    buttonLabel: 'Widget\nshowcase',
    icon: Icons.flutter_dash,
  ),
  ThemeTopic(
    heading: 'Page examples',
    buttonLabel: 'Page\nexamples',
    icon: Icons.article_outlined,
  ),
  ThemeTopic(
    heading: 'Material',
    buttonLabel: 'Material',
    icon: Icons.square,
  ),
  ThemeTopic(
    heading: 'Android system navigation bar',
    buttonLabel: 'Android\nSystem Nav',
    icon: Icons.android_outlined,
  ),
];
