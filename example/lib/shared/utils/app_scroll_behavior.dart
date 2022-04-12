import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Custom app scroll behavior class.
///
/// If we want to use the old style drag scroll that was in use on Flutter
/// stable 2.2.x and earlier, also on desktop and web we can use this scroll
/// behavior for the entire application.
///
/// Normally you would probably not use this scroll behavior in real
/// desktop/web apps, but I like it, so I use it when I can choose! :)
///
/// This is a Flutter class that only depends on the SDK and can be dropped
/// into any application.
@immutable
class AppScrollBehavior extends MaterialScrollBehavior {
  const AppScrollBehavior();
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => <PointerDeviceKind>{
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

/// Another alternative custom scroll behavior class.
/// Using the Apple iOS bouncing scroll and over stretch.
///
/// Currently not used in these apps, but experimented with it, for some other
/// type of app it is quite cool.
@immutable
class AppleScrollBehavior extends ScrollBehavior {
  const AppleScrollBehavior();

  @override
  Widget buildScrollbar(
          BuildContext context, Widget child, ScrollableDetails details) =>
      child;

  @override
  Widget buildOverscrollIndicator(
          BuildContext context, Widget child, ScrollableDetails details) =>
      child;

  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => <PointerDeviceKind>{
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };

  @override
  TargetPlatform getPlatform(BuildContext context) => TargetPlatform.macOS;

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());
}
