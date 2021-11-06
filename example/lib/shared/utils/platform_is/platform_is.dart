import 'universal_platform_web.dart'
    if (dart.library.io) 'universal_platform_vm.dart';

/// A universal platform checker.
///
/// Can be used to check active physical Flutter platform on all platforms.
///
/// To check what host platform the app is running on use:
///
/// * PlatformIs.android
/// * PlatformIs.iOS
/// * PlatformIs.macOS
/// * PlatformIs.windows
/// * PlatformIs.linux
/// * PlatformIs.fuchsia
///
/// To check the device type use:
///
/// * PlatformIs.mobile  (Android or iOS)
/// * PlatformIs.desktop (Windows, macOS or Linux)
///
/// Currently Fuchsia is not considered mobile nor desktop, even if it
/// might be so in the future.
///
/// To check if the Flutter application is running on Web you can use:
///
/// * PlatformIs.web
///
/// Alternatively the Flutter foundation compile time constant kIsWeb also
/// works well for that.
///
/// The platform checks are supported independently on web. You can use
/// PlatformIs windows, iOS, macOS, Android and Linux to check what the host
/// platform is when you are running a Flutter Web application.
///
/// Checking if we are running on Fuchsia host in a Web browser, is not yet
/// supported. If running in a Web browser on PlatformIs.web will be true, but
/// PlatformIs.fuchsia will still be false.
class PlatformIs {
  PlatformIs._();
  static bool get web => UniversalPlatform.web;
  static bool get macOS => UniversalPlatform.macOS;
  static bool get windows => UniversalPlatform.windows;
  static bool get linux => UniversalPlatform.linux;
  static bool get android => UniversalPlatform.android;
  static bool get iOS => UniversalPlatform.iOS;
  static bool get fuchsia => UniversalPlatform.fuchsia;
  static bool get mobile => PlatformIs.iOS || PlatformIs.android;
  static bool get desktop =>
      PlatformIs.macOS || PlatformIs.windows || PlatformIs.linux;
}
