import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// App static functions and constants used in the example applications.
class AppData {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  AppData._();

  // This info is mainly for the Live public web builds of the examples.
  // When I build a new public version I just make sure to update this info
  // before building them.
  static const String appName = 'FlexColorScheme';
  static const String version = '4.0.0';
  static const String packageVersion = 'FlexColorScheme package $version';
  static const String packageUrl = 'https://pub.dev/packages/flex_color_scheme';
  static const String flutterVersion = 'Channel stable, 2.5.3';
  static const String copyright = '© 2020, 2021';
  static const String author = 'Mike Rydstrom';
  static const String license = 'BSD 3-Clause License';
  static const String icon = 'assets/images/app_icon.png';

  // The max dp width used for layout content on the screen in the available
  // body area. Wider content gets growing side padding, kind of like on most
  // web pages when they are used on super wide screen. Just a design used for
  // this demo app, that works pretty well in this use case.
  static const double maxBodyWidth = 1000;

  // Edge padding for page content on the screen. A better looking result
  // can be obtained if this increases in steps depending on canvas size.
  // Keeping it fairly tight now, but not too small, it is a compromise for
  // both phone and larger media.
  static const double edgePadding = 12;

  // The minimum media size needed for desktop/large tablet menu view.
  static const double desktopBreakpoint = 720;

  // The minimum media size needed for side rail tablet menu view.
  static const double phoneBreakpoint = 500;

  // The width of the side menu when expanded.
  static const double expandWidth = 265;

  // The width of the side menu when rail sized.
  static const double collapseWidth = 60;

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
