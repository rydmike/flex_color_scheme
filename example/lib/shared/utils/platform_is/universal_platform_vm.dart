import 'dart:io';
// NOTE:
// Never import this library directly in the application. The PlatformIs
// class and library uses conditional imports to only import this file on
// VM platform builds.

// UniversalPlatform for Flutter VM builds.
//
// We are using Dart VM builds, so we use dart:io Platform to
// get the current platform.
class UniversalPlatform {
  UniversalPlatform._();
  static bool get web => false;
  static bool get macOS => Platform.isMacOS;
  static bool get windows => Platform.isWindows;
  static bool get linux => Platform.isLinux;
  static bool get android => Platform.isAndroid;
  static bool get iOS => Platform.isIOS;
  static bool get fuchsia => Platform.isFuchsia;
}
