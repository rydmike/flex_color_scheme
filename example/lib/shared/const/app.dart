import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/examples/responsive_scaffold.dart';

// ignore_for_file: comment_references

/// App static container class with functions and constants used in by
/// example applications.
///
/// In a real app you probably prefer putting these into different static
/// classes that serves your application's usage. For these examples we
/// put them all in the same class, except the colors that are in their
/// own class.
abstract final class App {
  /// Returns the title of the MaterialApp.
  ///
  /// Used to set title on pages to
  /// same one that is defined in each example as its app name. Handy as we only
  /// need to update in one place, where it belongs and no need to put it as
  /// a const somewhere and no need to pass it around via a title prop either.
  /// Also used in the [showAppAboutDialog] About box as app name.
  static String title(BuildContext context) =>
      (context as Element)
          .findAncestorWidgetOfExactType<MaterialApp>()
          ?.title ??
      '';

  // When building new public web versions of the demos, make sure to
  // update this info with current versions used for the build, before
  // triggering GitHub actions CI/CD that builds them.
  //
  // The name of the package this app demonstrates.
  static const String packageName = 'FlexColor\u{00AD}Scheme';

  // Check if this is a Web-WASM build, Web-JS build or native VM build.
  static const bool isRunningWithWasm = bool.fromEnvironment(
    'dart.tool.dart2wasm',
  );
  static const String buildType = isRunningWithWasm
      ? ', WasmGC'
      : kIsWeb
          ? ', JS'
          : ', native VM';
  // Version of the WEB build, usually same as package, but it also has a
  // build numbers.
  static const String versionMajor = '8';
  static const String versionMinor = '2';
  static const String versionPatch = '1';
  static const String versionBuild = '01';
  static const String versionFull = '$versionMajor.$versionMinor.$versionPatch'
      '\nBuild-$versionBuild';
  static const String version = '$versionMajor.$versionMinor.$versionPatch';
  static const String flutterVersionNum = FlutterVersion.version ?? '';
  static const String flutterChannel = FlutterVersion.channel ?? '';
  static const String flutterVersion =
      '$flutterChannel $flutterVersionNum (canvaskit$buildType)';
  static const String copyright = '© 2020 - 2025';
  static const String author = 'Mike Rydstrom';
  static const String license = 'BSD 3-Clause License';
  static const String icon = 'assets/images/app_icon.png';
  // URL for Netlify hosting build.
  // This will be the only one later when WASM works OK.
  //static const String playgroundURL='https://playground.flexcolorscheme.com/';
  // URL for GitHub pages build.
  static const String playgroundURL =
      'https://rydmike.com/flexcolorscheme/themesplayground-latest/';

  static final Uri packageUri = Uri(
    scheme: 'https',
    host: 'pub.dev',
    path: 'packages/flex_color_scheme',
  );
  static const String exportInfo = 'Themes Playground data exported ';

  /// The max dp width used for layout content on the screen in the available
  /// body area.
  ///
  /// Wider content gets growing side padding, kind of like on most
  /// web pages when they are used on super wide screen. This is typically used
  /// pages in the example apps that use content that is width constrained,
  /// typically via the [PageBody] screen content wrapper widget.
  static const double maxBodyWidth = 1000;

  /// Breakpoint needed to show second panel in side-by-side view for the
  /// [ThemeTopicPage] page view.
  ///
  /// This is available content layout width, not media size!
  ///
  /// This min width was chosen because it gives at least the primary, secondary
  /// and tertiary colors in one Wrap row on panels Input Colors and Seeded
  /// ColorScheme, also when the side-by-side code view appears.
  static const double sideBySideViewBreakpoint = 770;

  /// The minimum media size needed for desktop/large tablet menu view,
  /// this is media size.
  ///
  /// Only at higher than this breakpoint will the menu expand from rail and
  /// be possible to toggle between menu and rail. Below this breakpoint it
  /// toggles between hidden in the Drawer and being a Rail, also on phones.
  /// This size was chosen because in combination codeViewWidthBreakpoint, it
  /// gives us a breakpoint where we get code side by side view in desktop
  /// rail mode already, and when it switches to menu mode, the desktop is
  /// wide enough to show both the full width menu and keep showing the
  /// code in side-by-side view. We could do lower the desktop width breakpoint,
  /// but then that view switches temporarily to now showing the code view,
  /// and it is just to much dynamic changes happening, it does not nice.
  static const double desktopWidthBreakpoint = 1700;

  /// A medium sized desktop, in panel view we switch to vertical
  /// topic selector page [ThemeTwoTopicsPage], with topic selector on
  /// left and right side, one for each theme topic panel.
  ///
  /// This is a media size breakpoint.
  static const double mediumDesktopWidthBreakpoint = 1079;

  /// This breakpoint is only used to further increase margins and insets on
  /// very large desktops.
  static const double bigDesktopWidthBreakpoint = 2800;

  /// The minimum media width treated as a phone device in this app.
  static const double phoneWidthBreakpoint = 600;

  /// The minimum media height treated as a phone device in this app.
  static const double phoneHeightBreakpoint = 700;

  /// Edge insets and margins for phone breakpoint size.
  static const double edgeInsetsPhone = 8;

  /// Edge insets and margins for tablet breakpoint size.
  static const double edgeInsetsTablet = 12;

  /// Edge insets and margins for desktop and medium desktop breakpoint sizes.
  static const double edgeInsetsDesktop = 18;

  /// Edge insets and margins for big desktop breakpoint size.
  static const double edgeInsetsBigDesktop = 24;

  /// The maximum width for an AlertDialog.
  static const double maxAlertDialogWidth = 410;

  /// Responsive insets based on width.
  ///
  /// The width may be from LayoutBuilder or
  /// MediaQuery, depending on what is appropriate for the use case.
  static double responsiveInsets(double width, [bool isCompact = false]) {
    if (width < phoneWidthBreakpoint || isCompact) return edgeInsetsPhone;
    if (width < desktopWidthBreakpoint) return edgeInsetsTablet;
    if (width < bigDesktopWidthBreakpoint) return edgeInsetsDesktop;
    return edgeInsetsBigDesktop;
  }

  /// The height when we want to pin the panel or color selector, instead of
  /// letting it float and snap back.
  static const double pinnedSelector = 1090;

  /// The width and height of the scrolling panel buttons in Themes Playground
  /// page view, and how much it shrinks when we go to phone size.
  ///
  /// The same shrunk sizes are reused in the compact view mode in larger
  /// breakpoints, when the compact view mode is selected.
  static const double panelButtonWidth = 115;
  static const double panelButtonHeight = 100;
  static const double panelButtonPhoneWidthReduce = -20;
  static const double panelButtonPhoneHeightReduce = -30;

  /// The width and height reduction of input color selection box in phone size.
  ///
  /// The same shrunk size is reused in the compact view mode in larger
  /// breakpoints, when the compact view mode is selected.
  static const double colorButtonPhoneReduce = -12;

  // Get the main font that is used in some of the examples.
  // Feel free to try different fonts.
  // For demonstration purposes the custom font is defined via Google fonts
  // both as its fontFamily name and its TextTheme. In the playground we pass
  // the textTheme to fontFamily and the textTheme to both textTheme and
  // primaryTextTheme. You can remove either the fontFamily or the
  // textTheme/primaryTextTheme usage and it will still work fine.
  // FlexColorScheme will also sort out the right text theme contrasts for
  // light and dark themes and for the primaryTextTheme to always have right
  // contrast for whatever primary color is used. FlexColorScheme also retains
  // the correct opacities on text style if M2 Typography is used, and removes
  // it from style when M3 Typography is used.
  static String? get font => GoogleFonts.notoSans().fontFamily;

  static final TextStyle notoSansRegular = GoogleFonts.notoSans(
    fontWeight: FontWeight.w400,
  );
  static final TextStyle notoSansMedium = GoogleFonts.notoSans(
    fontWeight: FontWeight.w500,
  );
  static final TextStyle notoSansBold = GoogleFonts.notoSans(
    fontWeight: FontWeight.w700,
  );
  static TextTheme? get textTheme => TextTheme(
        displayLarge: notoSansRegular, // Regular is default
        displayMedium: notoSansRegular, // Regular is default
        displaySmall: notoSansRegular, // Regular is default
        headlineLarge: notoSansRegular, // Regular is default
        headlineMedium: notoSansRegular, // Regular is default
        headlineSmall: notoSansRegular, // Regular is default
        titleLarge: notoSansRegular, // Regular is default
        titleMedium: notoSansMedium, // medium is default
        titleSmall: notoSansMedium, // Medium is default
        bodyLarge: notoSansRegular, // Regular is default
        bodyMedium: notoSansRegular, // Regular is default
        bodySmall: notoSansRegular, // Regular is default
        labelLarge: notoSansMedium, // Medium is default
        labelMedium: notoSansMedium, // Medium is default
        labelSmall: notoSansMedium, // Medium is default
      );

  /// Defining the visual density here to so we can change it in one spot when
  /// we want to try different options.
  ///
  /// Use what you prefer, I just like this one on desktop better than the
  /// default one. The default Flutter one is too dense imo.
  ///
  /// Only used by example 4.
  static VisualDensity get visualDensity =>
      FlexColorScheme.comfortablePlatformDensity;

  /// The menu items that we use on the responsive side menu.
  ///
  /// These could well be defined somewhere else too, but they kind of fit here.
  static const List<ResponsiveMenuItems> menuItems = <ResponsiveMenuItems>[
    // Item 0
    ResponsiveMenuItems(
      dividerAbove: true,
      label: 'Use dark mode',
      labelSecondary: 'Use light mode',
      tooltip: 'Set to dark mode',
      tooltipSecondary: 'Set to light mode',
      icon: Icons.wb_sunny,
      iconSecondary: Icons.bedtime,
    ),
    // Item 1
    ResponsiveMenuItems(
      label: 'Use Material-2',
      labelSecondary: 'Use Material-3',
      tooltip: 'Set to Material-2',
      tooltipSecondary: 'Set to Material-3',
      icon: Icons.looks_3_outlined,
      iconSecondary: Icons.looks_two_outlined,
    ),
    // Item 2
    ResponsiveMenuItems(
      dividerAbove: true,
      label: 'FlexColorScheme OFF',
      labelSecondary: 'Use FlexColorScheme',
      tooltip: 'Turn off FlexColorScheme',
      tooltipSecondary: 'Turn on FlexColorScheme',
      icon: Icons.blur_on_outlined,
      iconSecondary: Icons.blur_off_outlined,
    ),
    // Item 3
    ResponsiveMenuItems(
      label: 'Component themes OFF',
      labelSecondary: 'Use component themes',
      tooltip: 'Turn OFF component themes',
      tooltipSecondary: 'Turn ON component themes',
      icon: Icons.subtitles_outlined,
      iconSecondary: Icons.subtitles_off_outlined,
    ),
    // Item 4
    ResponsiveMenuItems(
      dividerAbove: true,
      label: 'Copy theme code',
      icon: Icons.integration_instructions_outlined,
    ),
    // Item 5
    ResponsiveMenuItems(
      label: 'Copy ColorScheme',
      icon: Icons.palette_outlined,
    ),
    // Item 6
    ResponsiveMenuItems(
      dividerAbove: true,
      label: 'Large UI',
      labelSecondary: 'Compact UI',
      tooltip: 'Set to large UI',
      tooltipSecondary: 'Set to compact UI',
      icon: Icons.view_compact_alt_rounded,
      iconSecondary: Icons.view_compact_alt_outlined,
    ),
    // Item 7
    ResponsiveMenuItems(
      label: 'Colors on top',
      labelSecondary: 'Colors on side',
      tooltip: 'Colors on top\non large screens',
      tooltipSecondary: 'Colors on side\non large screens',
      icon: Icons.view_sidebar,
      // turns: 3,
      iconSecondary: Icons.view_sidebar,
      turnsSecondary: 3,
    ),
    // Item 8
    ResponsiveMenuItems(
      dividerAbove: true,
      label: 'Share config',
      tooltip: 'Share Playground configuration',
      icon: Icons.ios_share,
    ),
    // Item 9
    ResponsiveMenuItems(
      label: 'Reset config',
      icon: Icons.replay_outlined,
      dividerBelow: true,
    ),
  ];
}
