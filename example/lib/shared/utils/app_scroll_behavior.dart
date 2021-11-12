import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Custom app scroll behavior class.
///
/// If we want to use the old style drag scroll that was in use on Flutter
/// stable 2.2.x and earlier, also on desktop and web we can use this scroll
/// behaviour for the entire application.
///
/// Normally you would probably not use this scroll behavior in real
/// desktop/web apps, but I like it, so I use it when I can choose! :)
///
/// This is a Flutter class that only depends on the SDK and can be dropped
/// into any application.
class AppScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => <PointerDeviceKind>{
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
