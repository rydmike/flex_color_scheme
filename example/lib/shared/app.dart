import 'package:flutter/material.dart';

/// App static functions and constants used in the example applications.
class App {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  App._();

  // This info is mainly for the Live public web builds of the examples.
  // When I build a new public version I just make sure to update this info
  // before building them.
  static const String appName = 'FlexColorScheme';
  static const String version = '4.0.0';
  static const String packageVersion = 'FlexColorScheme package $version';
  static const String packageUrl = 'https://pub.dev/packages/flex_color_scheme';
  static const String flutterVersion = 'Channel stable, 2.5.2';
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
  static const double desktopBreakpoint = 700;

  // The width of the side menu when expanded.
  static const double expandWidth = 265;

  // The width of the side menu when rail sized.
  static const double shrinkWidth = 60;

  // Returns title of used MaterialApp.
  static String title(BuildContext context) =>
      (context as Element).findAncestorWidgetOfExactType<MaterialApp>()!.title;
}
