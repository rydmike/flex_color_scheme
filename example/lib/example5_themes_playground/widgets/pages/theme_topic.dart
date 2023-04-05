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
    this.info,
  }) : _buttonLabel = buttonLabel;

  final String heading;
  final IconData icon;
  final String? _buttonLabel;
  final String? info;
  String get buttonLabel => _buttonLabel ?? heading;
}

const List<ThemeTopic> themeTopics = <ThemeTopic>[
  ThemeTopic(
    heading: 'Introduction',
    icon: Icons.info_outlined,
    info: 'Use Themes Playground to try features and themes '
        'of FlexColorScheme. Find a theme you like, experiment '
        'with surface blends and try Material 3\n',
  ),
  ThemeTopic(
    heading: 'Premade designs',
    buttonLabel: 'Premade\ndesigns',
    icon: Icons.design_services_outlined,
    info: 'To quick start your theming try these '
        'premade designs. You can use them as starting points, for '
        'inspiration and to see examples of what FlexColorScheme can '
        'do. These templates do no set colors, you choose them as '
        'desired. Many choices use seeded Material 3 ColorScheme and '
        'they all use Material 3 mode. You can easily turn both off. '
        'In fact all configs are just starting points for you to '
        'explore and modify further. '
        'In the two panels view, try the Theme simulator as 2nd panel '
        'with the official Material 3 demo app, using 11" or 12" iPad, '
        'to experience how these examples impact the theme.\n',
  ),
  ThemeTopic(
    heading: 'Theme simulator',
    buttonLabel: 'Theme\nsimulator',
    icon: Icons.phone_iphone,
    info: 'Use theme simulator devices in a side view '
        'as you change theme settings, and see how the changes '
        'modify the look and feel of included demo apps.\n',
  ),
  ThemeTopic(
    heading: 'Theme code',
    buttonLabel: 'Theme\ncode',
    icon: Icons.integration_instructions_outlined,
    info: 'This is the setup code for the light and dark theme '
        'you have configured. It changes as you adjust theme settings in '
        'the Playground. Use this view as a side panel to see and learn '
        'what API properties each setting modifies. FlexColorScheme '
        'works like an advanced ThemeData factory. It returns a very '
        'elaborate Flutter ThemeData object, with a lot less setup '
        'needed. Some of its possible setups would require over 2000 '
        'rows of code to reproduce with the ThemeData factory.\n',
  ),
  ThemeTopic(
    heading: 'Component themes',
    buttonLabel: 'Component\nthemes',
    icon: Icons.widgets_outlined,
    info: "FlexColorScheme's M2 mode component themes are very opinionated. "
        'Components look almost like Material 3 components, but done in M2 '
        'mode. When using Material 3, there are only a few nuance differences '
        'to compared to default M3 styles, plus some minor fixes to a few '
        'Flutter Material 3 specification deviations.\n',
  ),
  ThemeTopic(
    heading: 'Theme colors',
    buttonLabel: 'Theme\ncolors',
    icon: Icons.palette_outlined,
    info: 'Theme colors show the color values defined for the selected '
        'color scheme. You can use any predefined scheme as a starting point '
        'for your own custom colors.\n',
  ),
  ThemeTopic(
    heading: 'Seeded ColorScheme',
    buttonLabel: 'Seeded\nColorScheme',
    icon: Icons.colorize_outlined,
    info: 'In Material-3 color system, seed generated light and '
        'dark mode ColorSchemes use the same key colors to generate six '
        'tonal palettes. Light and dark ColorScheme colors, use the same '
        'palettes, but different tones. This ensures that light and '
        'dark modes are color matched with each other.\n'
        '\n'
        'To ensure that light and dark themes use identical tonal palettes, '
        'FlexColorScheme uses the light mode colors '
        'from built-in schemes, to seed generate the ColorSchemes. '
        'When using custom colors, you can decide if you do so or not.\n',
  ),
  ThemeTopic(
    heading: 'Surface blends',
    buttonLabel: 'Surface\nblends',
    icon: Icons.invert_colors_outlined,
    info: 'Material 2 design demonstrates using surfaces with primary color '
        'alpha blends in dark mode. FlexColorScheme surface blends '
        'provides it for both light and dark mode. '
        'Material 3 design has a new color system where a hint of primary '
        'color is also used on surfaces. It is done via its neutral tonal '
        'palettes, that are shifted slightly towards the primary color.\n'
        '\n'
        'When using M3 seeded ColorSchemes, set blend level to zero to get the '
        'pure M3 design. With surface blends, you can further strengthen the '
        'M3 effect. You can vary blend levels by surface type in both M2 and '
        'M3 mode, regardless of if you use seeded ColorScheme or not.\n'
        '\n'
        'Surface blend settings have separate control values in the '
        'Playground for light and dark mode. Different values for blends in '
        'light and dark mode, are often a part of the desired design.\n',
  ),
  ThemeTopic(
    heading: 'Effective colors',
    buttonLabel: 'Effective\ncolors',
    icon: Icons.gradient_outlined,
  ),
  ThemeTopic(
    heading: 'TextField',
    icon: Icons.pin_outlined,
    info: 'TextField theming is done via the InputDecorator theme, it is a '
        'fairly complex theme with mixed legacy and MaterialState '
        'properties.\n',
  ),
  ThemeTopic(
    heading: 'AppBar and BottomAppBar',
    buttonLabel: 'AppBar',
    icon: Icons.web_asset_outlined,
    info: 'Material 2 uses primary colored AppBar in light mode and almost '
        'black in dark mode. Material 3 defaults to surface color in both '
        'light and dark theme mode. With FCS you can use select if you '
        'want Primary, Material2 surface, background, scaffoldBackground '
        'colors with their surfaceTint and blends, or use a custom color.\n',
  ),
  ThemeTopic(
    heading: 'TabBar',
    icon: Icons.tab_outlined,
    info: 'FlexColorscheme comes with a quick TabBar styling '
        'option, where you can choose if it should always fit in '
        'your AppBar, regardless of what theme you set for the AppBar. '
        'Usually you want this, but sometimes surface might be preferred '
        'or the Flutter SDK default style. In M2 mode Flutter default '
        'does not work well on surface colored AppBar and in M3 mode '
        'the default does not work with primary colored AppBar. By using '
        'the forAppBar style, the TabBar always fits with the AppBar.\n',
  ),
  ThemeTopic(
    heading: 'BottomNavigationBar',
    buttonLabel: 'Bottom\nNavigationBar',
    icon: Icons.video_label,
    info: 'The BottomNavigationBar is used for top level destination '
        'navigation on mobile phones in Material 2 design. In Material 3 it '
        'has been replaced with NavigationBar, prefer using it instead.\n'
        '\n'
        'Default SDK background color is theme canvasColor via Material. '
        'The canvasColor is typically colorScheme.background, elevation '
        'is 8. FCS sub-theme default is colorScheme.background and '
        'elevation 0.\n',
  ),
  ThemeTopic(
    heading: 'NavigationBar',
    buttonLabel: 'Navigation\nBar',
    icon: Icons.call_to_action,
    info: 'The NavigationBar is used for top level destination '
        'navigation on phones in Material 3 design.\n'
        '\n'
        'Default background color is surface with an onSurface overlay '
        'color in M2. In M3 default background color is surface with '
        'elevation 3, using M3 elevation tint. '
        'FlexColorScheme M2 theme default is color scheme '
        'background, with active surface blend and elevation 0. FCS M3 mode '
        'background is same as M3 default.\n',
  ),
  ThemeTopic(
    heading: 'NavigationRail',
    buttonLabel: 'Navigation\nRail',
    icon: Icons.view_sidebar_rounded,
    info: 'The NavigationRail is typically used for top level destination '
        'navigation on tablets. It supports both Material 2 and 3, style '
        'rails. Flutter default background color is colorScheme.surface. '
        'FlexColorScheme sub-theme default is colorScheme.background.\n',
  ),
  ThemeTopic(
    heading: 'NavigationDrawer',
    buttonLabel: 'Navigation\nDrawer',
    icon: Icons.featured_video_outlined,
    info: 'A drawer is used on phones to hide navigation destinations in a '
        'side drawer. On desktop media sizes, a navigation drawer can also be '
        'used as pinned side menu. Flutter default background is '
        'colorScheme.background for Drawer in M2, but '
        'colorScheme.surface in M3. FlexColorScheme component '
        'sub-themes use surface as default for both modes.\n',
  ),
  ThemeTopic(
    heading: 'Material buttons',
    buttonLabel: 'Material\nbuttons',
    icon: Icons.crop_16_9_outlined,
    info: 'Material buttons refer to the stander Flutter push buttons '
        'implemented using ButtonStyleButton. The buttons are ElevatedButton, '
        'FilledButton, FilledButton.tonal, OutlinedButton and TextButton. '
        'They are quite versatile when it comes to their theming capabilities. '
        'With all the styles offered, they often also work well as they are.\n',
  ),
  ThemeTopic(
    heading: 'Selection buttons',
    buttonLabel: 'Selection\nbuttons',
    icon: Icons.view_week_outlined,
    info: 'Selection buttons includes both Material 2 style ToggleButtons and '
        'Material 3 SegmentedButton. FlexColorsScheme uses a sophisticated '
        'theme on to modernize it, for some use cases, like dense icons only '
        'buttons, it may still fit and work better than the new M3 '
        'SegmentedButton.\n',
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
