import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  // When I build new public web versions of the demos, I just make sure to
  // update this info before I trigger GitHub actions CI/CD that builds them.
  static const String appName = 'FlexColor\u{00AD}Scheme';
  static const String version = '4.2.0';
  static const String packageVersion = 'FlexColorScheme package $version';
  static const String packageUrl = 'https://pub.dev/packages/flex_color_scheme';
  static const String flutterVersion = 'stable v2.8.1';
  static const String copyright = '© 2020, 2021';
  static const String author = 'Mike Rydstrom';
  static const String license = 'BSD 3-Clause License';
  static const String icon = 'assets/images/app_icon.png';

  // The max dp width used for layout content on the screen in the available
  // body area. Wider content gets growing side padding, kind of like on most
  // web pages when they are used on super wide screen. Just a design used for
  // this demo app, that works pretty well in this use case too.
  static const double maxBodyWidth = 1000;

  // The minimum media size needed for desktop/large tablet menu view.
  // Only at higher than this breakpoint will the menu open and be possible
  // to toggle between menu and rail. Below this breakpoint it toggles between
  // hidden in the Drawer and rail, also on phones. This size was mostly chosen
  // based on what worked well for the content in the staggered column view.
  static const double desktopBreakpoint = 1150;

  // The minimum media width treated as a phone device in this demo.
  static const double phoneBreakpoint = 600;

  // Edge padding insets for page content on the screen.
  static const double edgeInsetsPhone = 8;
  static const double edgeInsetsTablet = 14;
  static const double edgeInsetsDesktop = 18;
  // Used by grid layout when in >= 4 column layout mode.
  static const double edgeInsetsBigDesktop = 24;

  // Opacity of the popup menu in example 5, just set via a const to
  // show and use a property not in the controller.
  static const double popupMenuOpacity = 0.95;

  // Responsive insets based on width. The width may be from LayoutBuilder or
  // MediaQuery, depending on what is appropriate for the use case.
  static double responsiveInsets(double width) {
    if (width < phoneBreakpoint) return edgeInsetsPhone;
    if (width < desktopBreakpoint) return edgeInsetsTablet;
    return edgeInsetsDesktop;
  }

  // Returns the title of the MaterialApp. Used to set title on pages to
  // same that is defined in each example as its app name. Handy as we only
  // need to update in one place, where it belongs and no need to put it as
  // a const somewhere and no need to pass it around via a title prop either.
  static String title(BuildContext context) =>
      (context as Element).findAncestorWidgetOfExactType<MaterialApp>()!.title;

  // Get the main font that is used in some of the examples.
  // Feel free to try different fonts.
  static String? get font => GoogleFonts.notoSans().fontFamily;

  // Defining the visual density here to so we can change it in one spot when
  // we want to try different options.
  static VisualDensity get visualDensity =>
      FlexColorScheme.comfortablePlatformDensity;

  // We define a custom text theme for our app. This is just for demo purposes
  // on how to setup a custom text theme. This works just as well with normal
  // ThemeData and ThemeData.from btw. FlexColorScheme does the TextTheme
  // setup same way as ThemeData, but injects the primary color blends if you
  // use the new text theme blend mode option when you opt in on sub themes.
  //
  // In this example we decided that:
  //
  // Headline1...4 are too big to be useful on mobile, so we make them smaller.
  // The used sizes for them below are actually from Material Guide M3/You.
  // https://m3.material.io/styles/typography/overview
  //
  // We also think that overline is a bit too small and have weird letter
  // spacing, so we change it too.
  static const TextTheme textTheme = TextTheme(
    headline1: TextStyle(
      fontSize: 57, // Same as M3, defaults to 96 in Material2018 Typography.
    ),
    headline2: TextStyle(
      fontSize: 45, // Same as M3, defaults to 60 in Material2018 Typography.
    ),
    headline3: TextStyle(
      fontSize: 36, // Same as M3, defaults to 48 in Material2018 Typography.
    ),
    headline4: TextStyle(
      fontSize: 28, // Same as M3, defaults to 34 in Material2018 Typography.
    ),
    // I chose this, I later saw it happened to match new M3 style too - cool!
    overline: TextStyle(
      fontSize: 11, // Defaults to 10 in Material2018 Typography.
      letterSpacing: 0.5, // Defaults to 1.5 in Material2018 Typography.
    ),
  );
}
