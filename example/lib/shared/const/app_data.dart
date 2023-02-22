import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/app/responsive_scaffold.dart';

/// App static functions and constants used in the example applications.
///
/// In a real app you probably prefer putting these into different static
/// classes that serves your application's usage. For these examples I
/// put them all in the same class, except the colors that are in their
/// own class.
class AppData {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  AppData._();

  // Info about the app.

  // Returns the title of the MaterialApp. Used to set title on pages to
  // same one that is defined in each example as its app name. Handy as we only
  // need to update in one place, where it belongs and no need to put it as
  // a const somewhere and no need to pass it around via a title prop either.
  // Also used in the About box as app name.
  static String title(BuildContext context) =>
      (context as Element).findAncestorWidgetOfExactType<MaterialApp>()!.title;

  // When building new public web versions of the demos, make sure to
  // update this info before triggering GitHub actions CI/CD that builds them.
  //
  // The name of the package this app demonstrates.
  static const String packageName = 'FlexColor\u{00AD}Scheme';
  // Version of the WEB build, usually same as package, but it also has a
  // build numbers.
  static const String versionMajor = '7';
  static const String versionMinor = '0';
  static const String versionPatch = '0-dev.3';
  static const String versionBuild = '01';
  static const String version = '$versionMajor.$versionMinor.$versionPatch '
      'Build-$versionBuild';
  static const String packageVersion =
      '$versionMajor.$versionMinor.$versionPatch';
  static const String flutterVersion = '3.7.3';
  static const String copyright = '© 2020 - 2023';
  static const String author = 'Mike Rydstrom';
  static const String license = 'BSD 3-Clause License';
  static const String icon = 'assets/images/app_icon.png';
  static final Uri packageUri = Uri(
    scheme: 'https',
    host: 'pub.dev',
    path: 'packages/flex_color_scheme',
  );

  // The max dp width used for layout content on the screen in the available
  // body area. Wider content gets growing side padding, kind of like on most
  // web pages when they are used on super wide screen. This is typically used
  // pages in the example apps that use content that is width constrained,
  // typically via the PageBody widget.
  static const double maxBodyWidth = 1000;

  // Breakpoint needed to show code view side by side breakpoint for the
  // panel page view. This available content layout width, not media size.
  // This min width was chosen because it gives at least the primary, secondary
  // and tertiary colors in one Wrap row on panels Input Colors and Seeded
  // ColorScheme, also when the side-by-side code view appears.
  static const double codeViewWidthBreakpoint = 1024;

  // The minimum media size needed for desktop/large tablet menu view,
  // this is media size.
  // Only at higher than this breakpoint will the menu expand from rail and
  // be possible to toggle between menu and rail. Below this breakpoint it
  // toggles between hidden in the Drawer and being a Rail, also on phones.
  // This size was chosen because in combination codeViewWidthBreakpoint, it
  // gives us a breakpoint where we get code side by side view in desktop
  // rail mode already, and when it switches to menu mode, the desktop is
  // wide enough to show both the full width menu and keep showing the
  // code in side-by-side view. We could do lower the desktop width breakpoint,
  // but then that view switches temporarily to now showing the code view,
  // and it is just to much dynamic changes happening, it does not nice.
  static const double desktopWidthBreakpoint = 1350;
  // This breakpoint is only used to further increase margins and insets on
  // very large desktops.
  static const double bigDesktopWidthBreakpoint = 2800;
  // A medium sized sized desktop, in panel view we switch to vertical
  // topic selectors, left and right side, one for each panel.
  static const double mediumDesktopWidthBreakpoint = 1779;

  // The minimum media width treated as a phone device in this demo.
  static const double phoneWidthBreakpoint = 600;
  // The minimum media height treated as a phone device in this demo.
  static const double phoneHeightBreakpoint = 700;
  // Edge insets and margins for content at above breakpoints.
  static const double edgeInsetsPhone = 8;
  static const double edgeInsetsTablet = 12;
  static const double edgeInsetsDesktop = 18;
  static const double edgeInsetsBigDesktop = 24;
  // Responsive insets based on width. The width may be from LayoutBuilder or
  // MediaQuery, depending on what is appropriate for the use case.
  static double responsiveInsets(double width, [bool isCompact = false]) {
    if (width < phoneWidthBreakpoint || isCompact) return edgeInsetsPhone;
    if (width < desktopWidthBreakpoint) return edgeInsetsTablet;
    if (width < bigDesktopWidthBreakpoint) return edgeInsetsDesktop;
    return edgeInsetsBigDesktop;
  }

  // The height when we want to pin the panel or color selector, instead of
  // letting it float and snap back.
  static const double pinnedSelector = 1000;
  // The width, and height of the scrolling panel buttons in Themes Playground
  // page view, and how much it shrinks when we go to phone size.
  static const double panelButtonWidth = 115;
  static const double panelButtonHeight = 100;
  static const double panelButtonPhoneWidthReduce = -16;
  static const double panelButtonPhoneHeightReduce = -30;
  // The width and height reduction of input color selection box in phone size.
  static const double colorButtonPhoneReduce = -12;

  // Get the main font that is used in some of the examples.
  // Feel free to try different fonts.
  static String? get font => GoogleFonts.notoSans().fontFamily;

  // Defining the visual density here to so we can change it in one spot when
  // we want to try different options.
  static VisualDensity get visualDensity =>
      FlexColorScheme.comfortablePlatformDensity;

  // The menu items that we use on the responsive side menu.
  static const List<ResponsiveMenuItems> menuItems = <ResponsiveMenuItems>[
    ResponsiveMenuItems(
      label: 'Grid view',
      labelSecondary: 'Page view',
      tooltip: 'Set to grid view',
      tooltipSecondary: 'Set to page view',
      icon: Icons.view_array_outlined,
      iconSecondary: Icons.calendar_view_month_outlined,
    ),
    ResponsiveMenuItems(
      label: 'Standard',
      labelSecondary: 'Compact',
      tooltip: 'Set to standard UI',
      tooltipSecondary: 'Set to compact UI',
      icon: Icons.view_compact_alt_rounded,
      iconSecondary: Icons.view_compact_alt_outlined,
    ),
    ResponsiveMenuItems(
      label: 'Dark mode',
      labelSecondary: 'Light mode',
      tooltip: 'Set to dark mode',
      tooltipSecondary: 'Set to light mode',
      icon: Icons.wb_sunny,
      iconSecondary: Icons.bedtime,
    ),
    ResponsiveMenuItems(
      label: 'Material 2',
      labelSecondary: 'Material 3',
      tooltip: 'Set to Material 2',
      tooltipSecondary: 'Set to Material 3',
      icon: Icons.looks_3_outlined,
      iconSecondary: Icons.looks_two_outlined,
    ),
    ResponsiveMenuItems(
      label: 'No FlexColorScheme',
      labelSecondary: 'Use FlexColorScheme',
      tooltip: 'Turn off FlexColorScheme',
      tooltipSecondary: 'Turn on FlexColorScheme',
      icon: Icons.blur_on_outlined,
      iconSecondary: Icons.blur_off_outlined,
    ),
    ResponsiveMenuItems(
      label: 'No sub themes',
      labelSecondary: 'Use sub themes',
      tooltip: 'Turn off sub themes',
      tooltipSecondary: 'Turn on sub themes',
      icon: Icons.subtitles_outlined,
      iconSecondary: Icons.subtitles_off_outlined,
    ),
    ResponsiveMenuItems(
      label: 'Copy theme code',
      icon: Icons.integration_instructions_outlined,
    ),
    ResponsiveMenuItems(
      label: 'Copy ColorScheme',
      icon: Icons.palette_outlined,
    ),
    ResponsiveMenuItems(
      label: 'Expand all',
      icon: Icons.open_in_full_outlined,
    ),
    ResponsiveMenuItems(
      label: 'Close all',
      icon: Icons.close_fullscreen_outlined,
    ),
    ResponsiveMenuItems(
      label: 'Reset settings',
      icon: Icons.replay_outlined,
    ),
  ];
}
