import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Custom app scroll behavior. We want to use the old style drag scroll that
// was in use on Flutter stable 2.2.x and earlier, also on desktop and
// web in this demo.
class AppScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => <PointerDeviceKind>{
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
