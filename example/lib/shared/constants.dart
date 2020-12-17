// It is not necessary to review or understand the code in this file in order
// to understand how to use the FlexColorScheme package demonstrated in
// the examples.

// Layout constants and strings used in the example application
class AppConst {
  AppConst._();

  // This info is mainly for the Live public web builds of the examples.
  // When I build a new public version I just make sure to update this info
  // before building them.
  static const String appName = 'FlexColorScheme';
  static const String version = '1.0.0-dev.1';
  static const String packageVersion = 'FlexColorScheme package $version';
  static const String packageUrl = 'https://pub.dev/packages/flex_color_scheme';
  static const String flutterVersion = 'Flutter dev 1.25.0-8.0.pre';
  static const String copyright = '© 2020';
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

  // The width of the side menu when expanded, only used by example 5.
  static const double expandWidth = 220;

  // The width of the side menu when rail sized, only used by example 5.
  static const double shrinkWidth = 60;

  // The minimum width the demo card can be, only used by example 5.
  static const double minCardWidth = 150;

  // The number of cards displayed, only used by example 5.
  static const int maxCards = 200;
}
