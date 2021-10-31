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
  static const String version = '4.0.0';
  static const String packageVersion = 'FlexColorScheme package $version';
  static const String packageUrl = 'https://pub.dev/packages/flex_color_scheme';
  static const String flutterVersion = 'stable v2.5.3';
  static const String copyright = '© 2020, 2021';
  static const String author = 'Mike Rydstrom';
  static const String license = 'BSD 3-Clause License';
  static const String icon = 'assets/images/app_icon.png';

  // The max dp width used for layout content on the screen in the available
  // body area. Wider content gets growing side padding, kind of like on most
  // web pages when they are used on super wide screen. Just a design used for
  // this demo app, that works pretty well in this use case too.
  static const double maxBodyWidth = 1000;

  // Edge padding insets for page content on the screen.
  static const double edgeInsetsPhone = 6;
  static const double edgeInsetsTablet = 12;
  static const double edgeInsetsDesktop = 16;
  // Used by Staggered gridview layout when are in 4 column layout mode.
  static const double edgeInsetsBigDesktop = 18;

  static double responsiveInsets(double width) {
    if (width < phoneBreakpoint) return edgeInsetsPhone;
    if (width < desktopBreakpoint) return edgeInsetsTablet;
    return edgeInsetsDesktop;
  }

  // The minimum media size needed for desktop/large tablet menu view.
  // Only at higher than this breakpoint will the menu open and be possible
  // to toggle between menu and rail. Below this breakpoint it toggles between
  // hidden in the Drawer and rail, also one phones. In this simple demo there
  // is no switching to bottom navigation.
  static const double desktopBreakpoint = 960;

  // The minimum media width treated as a phone device in this demo.
  static const double phoneBreakpoint = 500;

  // The width of the side menu when expanded to full menu.
  static const double menuWidth = 265;

  // The width of the side menu when collapsed to a rail.
  static const double railWidth = 60;

  // Returns title of used MaterialApp.
  static String title(BuildContext context) =>
      (context as Element).findAncestorWidgetOfExactType<MaterialApp>()!.title;

  // Get the main font used in the examples.
  static String? get font => GoogleFonts.roboto().fontFamily;

  // Defining the visual density here to so we can change it one spot when
  // we want to try different options.
  static VisualDensity get visualDensity =>
      FlexColorScheme.comfortablePlatformDensity;

  // We define a custom text theme for our app. Here we decided that
  // Headline1...4 are too big to be useful for us, so we make them smaller.
  // We also think buttons should have a bit bigger text, tighter letter
  // spacing, and that overline is a bit too small and have weird letter
  // spacing, so we change them too.
  static const TextTheme textTheme = TextTheme(
    headline1: TextStyle(
      fontSize: 64, // Defaults to 96 in Material2018 Typography.
    ),
    headline2: TextStyle(
      fontSize: 52, // Defaults to 60 in Material2018 Typography.
    ),
    headline3: TextStyle(
      fontSize: 42, // Defaults to 48 in Material2018 Typography.
    ),
    headline4: TextStyle(
      fontSize: 32, // Defaults to 34 in Material2018 Typography.
    ),
    button: TextStyle(
      fontSize: 16, // Defaults to 14 in Material2018 Typography.
      letterSpacing: 0.9, // Defaults to 1.25 in Material2018 Typography.
    ),
    overline: TextStyle(
      fontSize: 11, // Defaults to 10 in Material2018 Typography.
      letterSpacing: 0.5, // Defaults to 1.5 in Material2018 Typography.
    ),
  );
}
