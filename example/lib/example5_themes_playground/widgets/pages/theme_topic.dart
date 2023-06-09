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
    this.iconTurns = 0,
    this.info,
  }) : _buttonLabel = buttonLabel;

  final String heading;
  final IconData icon;
  final int iconTurns;
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
        'explore and modify further.\n'
        '\n'
        'In two panels view, try the Theme simulator as 2nd panel '
        'with the official Material 3 demo app. Use the 11" or 12" iPad, '
        'to experience how these examples impact the design of the app '
        'and Material components.\n',
  ),
  ThemeTopic(
    heading: 'Theme simulator',
    buttonLabel: 'Theme\nsimulator',
    icon: Icons.phone_iphone,
    info: 'Use the theme simulator and its devices in a side view '
        'as you change theme settings, to see how the changes '
        'modify the look and feel of included demo apps.\n',
  ),
  ThemeTopic(
    heading: 'Theme code',
    buttonLabel: 'Theme\ncode',
    icon: Icons.integration_instructions_outlined,
    info: 'This is the setup code for the light and dark theme '
        'you have configured. It changes as you adjust theme settings in '
        'the Playground.\n'
        '\n'
        'Use this view as a side panel to see and learn '
        'what API properties each setting modifies.\n'
        '\n'
        'FlexColorScheme works like an advanced ThemeData factory. It returns '
        'a very elaborate Flutter ThemeData object, with a lot less setup '
        'needed. Some of its possible configurations would require over 2000 '
        'rows of code to reproduce with the vanilla ThemeData factory.\n',
  ),
  ThemeTopic(
    heading: 'Theme colors',
    buttonLabel: 'Theme\ncolors',
    icon: Icons.palette_outlined,
    info: 'Theme colors show the color values defined for the selected '
        'color scheme. You can also use any predefined scheme as a starting '
        'point for your own custom colors.\n',
  ),
  ThemeTopic(
    heading: 'Seeded ColorScheme',
    buttonLabel: 'Seeded\nColorScheme',
    icon: Icons.colorize_outlined,
    info: 'In Material 3 color system, seed generated light and '
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
    info: 'Material 2 design demonstrated using surfaces with primary color '
        'alpha blends in dark mode. FlexColorScheme surface blends '
        'provides this for both light and dark mode. '
        'Material 3 design has a new color system where a hint of primary '
        'color is also used on surfaces. It is done via its neutral tonal '
        'palettes, that are shifted slightly towards the primary color.\n'
        '\n'
        'When using M3 seeded ColorSchemes, set blend level to zero to get the '
        'pure M3 design. With surface blends, you can further strengthen the '
        'M3 effect. You can vary blend levels by surface type in both M2 and '
        'M3 mode, regardless of if you used seeded ColorScheme or not.\n'
        '\n'
        'Surface blend settings have separate control values in the '
        'Playground for light and dark mode. Different values for blends in '
        'light and dark mode are often a part of the desired design.\n',
  ),
  ThemeTopic(
    heading: 'Effective colors',
    buttonLabel: 'Effective\ncolors',
    icon: Icons.gradient_outlined,
    info: 'The effective colors show the current effective colors in the '
        "theme's ColorScheme, colors directly in ThemeData and also important "
        'component theme colors. It also provides some additional useful '
        'background information about colors in Flutter, that are useful to '
        'be aware of.',
  ),
  ThemeTopic(
    heading: 'Component themes',
    buttonLabel: 'Component\nthemes',
    icon: Icons.widgets_outlined,
    info: "FlexColorScheme's Material 2 mode component themes are opinionated. "
        'They look almost like Material 3 mode default components, '
        'but done in Material 2 mode.\n'
        '\n'
        'When using Material 3, there are only a few nuance differences '
        'compared to default M3 styles, plus some minor fixes to a few '
        'Flutter Material 3 specification deviations, that Flutter may also '
        'fix in later versions.\n',
  ),
  ThemeTopic(
    heading: 'Shape and Radius',
    buttonLabel: 'Shape\nRadius',
    icon: Icons.rounded_corner_outlined,
    info: 'The border shape and radius used by shape corner can be themed. In '
        'FlexColorScheme you can change it globally for all curved corners '
        'with one convenient setting. You can also use a different shape and '
        'border radius on selected platforms.\n',
  ),
  ThemeTopic(
    heading: 'TextField',
    icon: Icons.pin_outlined,
    info: 'Text fields allow users to enter text into a UI. They typically '
        'appear in forms and dialogs. TextField theming is done via the '
        'InputDecorator theme. It is a very complex theme, with mixed '
        'legacy and MaterialState properties.\n',
  ),
  ThemeTopic(
    heading: 'AppBar and BottomAppBar',
    buttonLabel: 'AppBar',
    icon: Icons.web_asset_outlined,
    info: 'Top app bars display information and actions at the top of a '
        'screen. Material 2 uses primary colored AppBar in light mode and '
        'almost black in dark mode. Material 3 defaults to surface color in '
        'both light and dark theme mode. With FCS you can use select if you '
        'want Primary, Material2 surface, background, scaffoldBackground '
        'colors with their surfaceTint and blends, or use a custom color.\n'
        '\n'
        'A bottom app bar displays navigation and key actions at the '
        'bottom of mobile screens.\n',
  ),
  ThemeTopic(
    heading: 'TabBar',
    icon: Icons.tab_outlined,
    info: 'Tabs organize content across different screens, data sets, and '
        'other interactions.\n'
        '\n'
        'FlexColorscheme comes with a quick TabBar styling '
        'option, where you can choose if it should always fit in '
        'your AppBar, regardless of what theme you set for the AppBar. '
        'Usually you want this, but sometimes surface might be preferred '
        'or the Flutter SDK default style.\n'
        '\n'
        'In M2 mode Flutter default '
        'does not work well on surface colored AppBar, and in M3 mode '
        'the default does not work with primary colored AppBar. By using '
        'the FCS forAppBar style, the TabBar always fits with selected '
        'AppBar theme.\n',
  ),
  ThemeTopic(
    heading: 'BottomNavigationBar',
    buttonLabel: 'Bottom\nNavBar',
    icon: Icons.video_label,
    info: 'Navigation bars offer a persistent and convenient way to switch '
        'between primary destinations in an app. '
        'The BottomNavigationBar is used for top level destination '
        'navigation on phones in Material 2 design. In Material 3 it '
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
    info: 'Navigation bars offer a persistent and convenient way to switch '
        'between primary destinations in an app. The NavigationBar is '
        'used for top level destination '
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
    iconTurns: 2,
    info: 'The NavigationRail is typically used for top level destination '
        'navigation on tablets and sometimes also on desktops. It supports '
        'both Material 2 and 3, styles rails. Flutter default background '
        'color is colorScheme.surface. '
        'FlexColorScheme sub-theme default is colorScheme.background.\n',
  ),
  ThemeTopic(
    heading: 'NavigationDrawer',
    buttonLabel: 'Navigation\nDrawer',
    icon: Icons.featured_video_outlined,
    info: 'A drawer is used on phones to provide navigation destinations in a '
        'hidden side drawer. On desktop media sizes, a navigation drawer can '
        'also be used as pinned side menu.\n'
        '\n'
        'Flutter default background is colorScheme.background for Drawer '
        'in M2 mode, but colorScheme.surface in M3. FlexColorScheme '
        'component sub-themes use surface as default color in both modes.\n',
  ),
  ThemeTopic(
    heading: 'Material buttons',
    buttonLabel: 'Material\nbuttons',
    icon: Icons.crop_16_9_outlined,
    info: 'Buttons help people take action, such as sending an email, '
        'sharing a document, or liking a comment.\n'
        '\n'
        'In Flutter Material buttons refer to the standard push buttons, '
        'implemented using ButtonStyleButton. The buttons are ElevatedButton, '
        'FilledButton, FilledButton.tonal, OutlinedButton and TextButton. '
        'They are quite versatile when it comes to their theming capabilities. '
        'With all the styles offered, they often also work well as they are.\n',
  ),
  ThemeTopic(
    heading: 'Segmented buttons',
    buttonLabel: 'Segmented\nbuttons',
    icon: Icons.view_week_outlined,
    info: 'Segmented buttons help people select options, switch views, '
        'or sort elements. '
        'In Flutter segmented buttons includes both the Material 2 style '
        'ToggleButtons and Material 3 style SegmentedButton.\n'
        '\n'
        'FlexColorsScheme uses a sophisticated theme to modernize '
        'ToggleButtons. For some use cases, like when using only icons, '
        'it may still fit and work better than the new M3 '
        'SegmentedButton. ToggleButtons sizes itself to fit each item, you '
        'have to size the content equally if that is desired. '
        'SegmentedButton makes all segments same size by default, each '
        'segment becomes large enough to fit the largest item.\n',
  ),
  ThemeTopic(
    heading: 'FloatingActionButton and Chip',
    buttonLabel: 'FAB and\nChip',
    icon: Icons.add_circle,
    info: 'The FloatingActionButton, the "FAB", represents the most '
        'important action '
        'on a screen. It puts key actions within reach. In M2 design it '
        'uses secondary color by default. In M3 color system secondary '
        'color is by default a very muted color, in M3 mode it instead '
        'maps to primaryContainer color. If you use an M3 seed generated '
        'ColorScheme in M2 mode, it is recommended to use another themed '
        'color for the FAB than secondary color.\n'
        '\n'
        'Chips help people enter information, make selections, filter '
        'content, or trigger actions. It has a totally new design in M3 '
        'mode, FCS M2 mode takes some inspiration from it, while also '
        'retaining some M2 style influences.\n',
  ),
  ThemeTopic(
    heading: 'Menus',
    buttonLabel: 'Menus',
    icon: Icons.arrow_drop_down_circle_outlined,
    info: 'Menus display a list of choices on a temporary surface.\n'
        '\n'
        'The PopupMenuButton is a Material 2 menu control, it still works '
        'well, but prefer using the new more versatile M3 menu '
        'components, like MenuAnchor, DropdownMenu and MenuBar.\n',
  ),
  ThemeTopic(
    heading: 'Tooltip, Icon, CircleAvatar and DropdownButton ',
    buttonLabel: 'Tooltip, Icon\nAvatar, Drop',
    icon: Icons.live_help_outlined,
    info: 'Tooltips display informative text when users hover over, '
        'focus on, or tap an element.\n',
  ),
  ThemeTopic(
    heading: 'Switch, CheckBox and Radio',
    buttonLabel: 'Switch\nCheck Radio',
    icon: Icons.toggle_on_outlined,
    info: 'Switches toggle the state of a single item on or off.\n'
        '\n'
        'Checkboxes allow users to select one or more items from a set. '
        'Checkboxes can turn an option on or off.\n'
        '\n'
        'Radio buttons allow users to select one option from a set.\n',
  ),
  ThemeTopic(
    heading: 'Slider',
    buttonLabel: 'Slider',
    icon: Icons.tune,
    info: 'Sliders allow users to make selections from a range of values.\n'
        '\n'
        'Slider and its theme are very configurable in Flutter. Slider '
        'has classes designed to be extended for complete '
        'customization capabilities. FCS and Playground offer a good '
        'starter set. Use copyWith on FCS generated theme if you '
        'need further customization of the Slider or extend '
        'its classes.\n',
  ),
  ThemeTopic(
    heading: 'ListTile',
    buttonLabel: 'ListTile',
    icon: Icons.dns_outlined,
    info: 'Lists tiles are often used in lists, with continuous, '
        'vertical indexes of text or images.\n',
  ),
  ThemeTopic(
    heading: 'Dialogs',
    icon: Icons.branding_watermark_outlined,
    info: 'Dialogs provide important prompts in a user flow.\n',
  ),
  ThemeTopic(
    heading: 'BottomSheet, SnackBar and MaterialBanner',
    buttonLabel: 'BottomSheet\nSnack Banner',
    icon: Icons.call_to_action_outlined,
    info: 'Bottom sheets are surfaces containing supplementary content, '
        'anchored to the bottom of the screen.\n'
        '\n'
        'A SnackBar is used to provide brief messages about app processes '
        'at the bottom of the screen.\n'
        '\n'
        'Banners are similar to SnackBars, but at the top of '
        'the screen and typically used to provide more information on '
        'topics related to content in the application.\n',
  ),
  ThemeTopic(
    heading: 'Card',
    buttonLabel: 'Card',
    icon: Icons.picture_in_picture_alt_outlined,
    info: 'Cards contain content and actions that relate '
        'information about a subject.\n',
  ),
  ThemeTopic(
    heading: 'TextTheme',
    buttonLabel: 'Text\nTheme',
    icon: Icons.font_download_outlined,
    info: 'The default typeface for Android is Roboto. Flutter uses platform '
        'specific default typefaces. The Typography (2021) introduced with '
        'Material-3 is better than past Material-2 typography '
        '(2018 in Flutter) or even older (2014). Typography 2014 is the '
        'default one used in Flutter when using M2 theme mode, even if 2018 is '
        'the correct M2 typography. Few devs knew you had to specify it '
        'separately to get correct Typography in M2 mode. In M3 mode you '
        'automatically get the correct M3 Typography by default. '
        'Recommend using the nicer and much better M3 Typography in both '
        'M2 and M3 mode.\n'
        '\n'
        "Material's default type scale includes contrasting and flexible "
        'styles to support a wide range of use cases. You can modify '
        'the global styles. However, Flutter widgets expect certain font '
        'sizes and depend on the global TextTheme for their default '
        'styles. Changing a style in the global TextTheme will impact '
        'default styles for all components that use the style. To avoid '
        'this, prefer defining custom text styles for each component theme.\n'
        '\n'
        'For custom content related TextStyles, prefer defining separate '
        'content text styles and considering adding them as theme '
        'extensions.\n',
  ),
  ThemeTopic(
    heading: 'PrimaryTextTheme',
    buttonLabel: 'Primary\nTextTheme',
    icon: Icons.font_download,
    info: 'The primary text theme sounds based on its name like it should be '
        'a TextTheme that by default fits on primary colored surfaces. '
        'It actually does so in light theme mode, but not always in Flutter '
        'by default in dark theme mode. FlexColorScheme corrects this and '
        'makes it always work in dark mode as well.\n',
  ),
  ThemeTopic(
    heading: 'Widget showcase',
    buttonLabel: 'Widget\nshowcase',
    icon: Icons.flutter_dash,
    info: 'This page presents most Flutter Material UI widgets, in one large '
        'page, as they look when the current theme is applied on them.\n',
  ),
  ThemeTopic(
    heading: 'Page examples',
    buttonLabel: 'Page\nexamples',
    icon: Icons.article_outlined,
    info: 'The page examples present the Material showcase content in '
        'a separate screen. It also contains examples of different ways to '
        'make full screen themed splash screens.\n',
  ),
  ThemeTopic(
    heading: 'Material',
    buttonLabel: 'Material',
    icon: Icons.square,
    info: 'Material widget is a lower level building block. It cannot '
        'be themed, but it has Material 2 and Material 3 mode dependent '
        'behavior. Material is responsible for clipping, elevation '
        'and ink effects below its children.\n',
  ),
  ThemeTopic(
    heading: 'Android system navigation bar',
    buttonLabel: 'Android\nSystem Nav',
    icon: Icons.android_outlined,
    info: 'The system navigation bar in Android is in newer versions '
        'the swipe bar at the bottom of the screen used for swipe '
        'gestures. In older versions it is made up of the 3 system '
        'navigation buttons. The system navigation area can be styled '
        'in Flutter, but not via themes.\n'
        '\n'
        'The AnnotatedRegion widget can be used to style it. '
        'FlexColorScheme contains a helper called '
        '"FlexColorScheme.themedSystemNavigationBar" to make it '
        'easy to style with a selected style that fits with a theme made '
        'by FlexColorColorScheme.\n',
  ),
];
