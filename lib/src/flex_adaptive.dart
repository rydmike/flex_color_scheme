import 'package:flutter/foundation.dart';

// ignore_for_file: comment_references

/// The [FlexAdaptive] class is used to define on what platforms
/// [FlexColorScheme] generated [ThemeData] platform adaptive theming
/// features are used.
///
/// [FlexColorScheme] provides some platform adaptive theming features, where
/// you can opt-in and out of if a certain theme feature, based on device
/// platform and device web platform.
///
/// The aim of these features is to enable different Material design based
/// themes that are adjusted differently based on used platform. A typical
/// use case is removing Material 3 design features that may be too opinionated
/// on e.g. iOS and desktop platforms, but you may want to keep them on Android.
///
/// For each of these features you can configure what platform each adaptive
/// features is used on. You can have different configuration on the
/// device native app platform and when using a web build of the app, per
/// platform.
///
/// The following adaptive theme settings are available in [FlexColorScheme].
///
/// - [FlexSubThemesData.adaptiveRemoveElevationTint] to adaptively remove
///   elevation tint when Material 3 mode is used.
/// - [FlexSubThemesData.adaptiveElevationShadowsBack] to adaptively bring
///   elevation shadows back where they were removed in Material 3, when
///   Material 3 mode is used.
/// - [FlexSubThemesData.adaptiveAppBarScrollUnder] to adaptively remove the
///   [AppBar] scroll under elevation tint when Material 3 mode is used.
/// - [FlexSubThemesData.adaptiveBorderRadius] to adaptively use global
///   [adaptiveDefaultBorderRadius] instead of [defaultBorderRadius] in both
///   Material 2 and Material 3 mode.
///
/// A planned **future** feature is to introduce the Squircle or super-ellipses
/// as the curvature of the border radius, that can be adaptively configured to
/// be used on desired platforms. When this adaptive feature is enabled
/// all Material components that use [ShapeBorder] will use Squircle curvature
/// instead of circular borer radius. The Squircle is the border curvature
/// shape used on Apple devices.
///
/// - **FUTURE**: [FlexSubThemesData.adaptiveSquircle] use Squircle as
///   [ShapeBorder] shape instead of Circular, will be available in
///   both Material 2 and Material 3 mode.
///
/// By default all adaptive features use the [FlexAdaptive.off] setting and
/// the adaptive style is not used on any platform.
///
/// There are many premade adaptive configurations available. One interesting
/// option is for example the [FlexAdaptive.iOSAndDesktop] configuration. It
/// makes the used adaptive behavior apply to all desktop platforms and their
/// web usage, as well as to iOS devices and their web usage. The purpose of
/// this config is that you only want the opinionated Material 3 designs on
/// Android and Fuchsia devices and when the app is used on web on these
/// devices, this for a platform correct progressive web app design for
/// these devices. But for other usage you want the optional adaptive
/// feature.
///
/// The following pre-made [FlexAdaptive] configuration constructors are
/// available:
///
///  - [FlexAdaptive.off]
///  - [FlexAdaptive.all]
///  - [FlexAdaptive.apple]
///  - [FlexAdaptive.desktop]
///  - [FlexAdaptive.iOSAndDesktop]
///  - [FlexAdaptive.excludeAndroidFuchsia]
///  - [FlexAdaptive.excludeWebAndroidFuchsia]
///
/// You can easily make your own custom configuration for each feature, if
/// the above ones do not fit your needs.
@immutable
class FlexAdaptive with Diagnosticable {
  /// Default constructor for making platform adaptive features apply only
  /// on selected platforms.
  ///
  /// Default constructor requires all properties. Prefer using other
  /// constructors with suitable defaults, and only overriding the properties
  /// you want to change something in them.
  const FlexAdaptive({
    required this.android,
    required this.androidWeb,
    required this.fuchsia,
    required this.fuchsiaWeb,
    required this.iOS,
    required this.iOSWeb,
    required this.linux,
    required this.linuxWeb,
    required this.macOS,
    required this.macOSWeb,
    required this.windows,
    required this.windowsWeb,
  });

  /// The adaptive feature is not used.
  ///
  /// This is also the default behavior for all adaptive features.
  const FlexAdaptive.off({
    this.android = false,
    this.androidWeb = false,
    this.fuchsia = false,
    this.fuchsiaWeb = false,
    this.iOS = false,
    this.iOSWeb = false,
    this.linux = false,
    this.linuxWeb = false,
    this.macOS = false,
    this.macOSWeb = false,
    this.windows = false,
    this.windowsWeb = false,
  });

  /// The adaptive feature is used on all platforms.
  ///
  /// Use this configuration it you want to use the adaptive feature on all
  /// platforms. The effectively removes the Material 3
  const FlexAdaptive.all({
    this.android = true,
    this.androidWeb = true,
    this.fuchsia = true,
    this.fuchsiaWeb = true,
    this.iOS = true,
    this.iOSWeb = true,
    this.linux = true,
    this.linuxWeb = true,
    this.macOS = true,
    this.macOSWeb = true,
    this.windows = true,
    this.windowsWeb = true,
  });

  /// Use the adaptive feature on Apple operating system iOS and macOS, but
  /// not when using the app on web browsers builds on iOS and macOS.
  ///
  /// The rationale fot this config, you want the adaptive feature on
  /// Apple devices, but not when it is used in a a browser, in the browser
  /// you want the feature in its default setup.
  const FlexAdaptive.apple({
    this.android = false,
    this.androidWeb = false,
    this.fuchsia = false,
    this.fuchsiaWeb = false,
    this.iOS = true,
    this.iOSWeb = false,
    this.linux = false,
    this.linuxWeb = false,
    this.macOS = true,
    this.macOSWeb = false,
    this.windows = false,
    this.windowsWeb = false,
  });

  /// Use adaptive feature on desktop operating systems Windows, macOS and
  /// linux and also when using the app in their desktop web browsers.
  const FlexAdaptive.desktop({
    this.android = false,
    this.androidWeb = false,
    this.fuchsia = false,
    this.fuchsiaWeb = false,
    this.iOS = false,
    this.iOSWeb = false,
    this.linux = true,
    this.linuxWeb = true,
    this.macOS = true,
    this.macOSWeb = true,
    this.windows = true,
    this.windowsWeb = true,
  });

  /// Use adaptive feature on iOS and all desktop operating systems Windows,
  /// macOS and linux, also when using the app in their web browsers.
  ///
  /// Rationale for this configuration, you only want to retain the default
  /// none adaptive theme feature setup on Android and Fuchsia platforms on
  /// both device and their web behavior. Great for changing M3 opinionated
  /// style on everything else than Android and Fuchsia, while also keeping
  /// it for web usage on Android and Fuchsia builds for that device
  /// correctly platform styled progressive WEB app. But using the adaptive
  /// style on everything else where M3 opinionated styles will be removed.
  const FlexAdaptive.iOSAndDesktop({
    this.android = false,
    this.androidWeb = false,
    this.fuchsia = false,
    this.fuchsiaWeb = false,
    this.iOS = true,
    this.iOSWeb = true,
    this.linux = true,
    this.linuxWeb = true,
    this.macOS = true,
    this.macOSWeb = true,
    this.windows = true,
    this.windowsWeb = true,
  });

  /// Use adaptive feature on all platforms on web and on all devices,
  /// except Android and Fuchsia devices.
  ///
  /// Rationale for this configuration, you only want to retain the default
  /// Material 3 theme feature setup on Android and Fuchsia device
  /// platforms, but on Web and all other platforms you want the adaptive less
  /// opinionated feature.
  ///
  /// The rationale for Web being same on all, it should look the same
  /// regardless of platform and it should use the less opinionated adaptive
  /// config. This is a good choice if you are not ready to use the Google
  /// opinionated Material 3 design on any platform on web.
  const FlexAdaptive.excludeAndroidFuchsia({
    this.android = false,
    this.androidWeb = true,
    this.fuchsia = false,
    this.fuchsiaWeb = true,
    this.iOS = true,
    this.iOSWeb = true,
    this.linux = true,
    this.linuxWeb = true,
    this.macOS = true,
    this.macOSWeb = true,
    this.windows = true,
    this.windowsWeb = true,
  });

  /// Don't use adaptive feature on any web platform, also exclude Android and
  /// Fuchsia devices from using the adaptive features.
  ///
  /// Rationale for this configuration, you want to retain the default
  /// Material 3 theme feature setup on Android and Fuchsia device
  /// platforms, and also use it on Web on all platforms, on all other device
  /// platforms you want the adaptive less opinionated design feature.
  ///
  /// The rationale for Web being same on all, it should look the same
  /// regardless of platform and it should use the Google opinionated
  /// Material 3 design, not the adaptive config where some of those features
  /// are removed. Basically you want Material 3 styles on web on all platforms
  /// and on Android and Fuchsia devices, but not on any other native device
  /// build.
  const FlexAdaptive.excludeWebAndroidFuchsia({
    this.android = false,
    this.androidWeb = false,
    this.fuchsia = false,
    this.fuchsiaWeb = false,
    this.iOS = true,
    this.iOSWeb = false,
    this.linux = true,
    this.linuxWeb = false,
    this.macOS = true,
    this.macOSWeb = false,
    this.windows = true,
    this.windowsWeb = false,
  });

  /// Set to true if adaptive feature should be used on Android.
  final bool android;

  /// Set to true if adaptive feature should be used on web in Android.
  final bool androidWeb;

  /// Set to true if adaptive feature should be used on Fuchsia.
  final bool fuchsia;

  /// Set to true if adaptive feature should be used on web in Fuchsia.
  final bool fuchsiaWeb;

  /// Set to true if adaptive feature should be used on iOS.
  final bool iOS;

  /// Set to true if adaptive feature should be used on web in iOS.
  final bool iOSWeb;

  /// Set to true if adaptive feature should be used on linux.
  final bool linux;

  /// Set to true if adaptive feature should be used on web in linux.
  final bool linuxWeb;

  /// Set to true if adaptive feature should be used on web in macOS.
  final bool macOS;

  /// Set to true if adaptive feature should be used on web in macOS.
  final bool macOSWeb;

  /// Set to true if adaptive feature should be used on Windows.
  final bool windows;

  /// Set to true if adaptive feature should be used on web in Windows.
  final bool windowsWeb;

  /// Using the current [FlexAdaptive] configuration, should the theme
  /// feature use the adaptive configuration?
  ///
  /// Returns true if the adaptive theme feature should be used.
  ///
  /// You can provide a [platformOverride] and web override [isWebOverride] for
  /// development and testing purposes.
  bool adapt([TargetPlatform? platformOverride, bool? isWebOverride]) {
    final TargetPlatform platform = platformOverride ?? defaultTargetPlatform;

    if (isWebOverride ?? kIsWeb) {
      switch (platform) {
        case TargetPlatform.android:
          return androidWeb;
        case TargetPlatform.fuchsia:
          return fuchsiaWeb;
        case TargetPlatform.iOS:
          return iOSWeb;
        case TargetPlatform.linux:
          return linuxWeb;
        case TargetPlatform.macOS:
          return macOSWeb;
        case TargetPlatform.windows:
          return windowsWeb;
      }
    } else {
      switch (platform) {
        case TargetPlatform.android:
          return android;
        case TargetPlatform.fuchsia:
          return fuchsia;
        case TargetPlatform.iOS:
          return iOS;
        case TargetPlatform.linux:
          return linux;
        case TargetPlatform.macOS:
          return macOS;
        case TargetPlatform.windows:
          return windows;
      }
    }
  }

  /// Copy the object with one or more provided properties changed.
  FlexAdaptive copyWith({
    bool? android,
    bool? androidWeb,
    bool? fuchsia,
    bool? fuchsiaWeb,
    bool? iOS,
    bool? iOSWeb,
    bool? linux,
    bool? linuxWeb,
    bool? macOS,
    bool? macOSWeb,
    bool? windows,
    bool? windowsWeb,
  }) {
    return FlexAdaptive(
      android: android ?? this.android,
      androidWeb: androidWeb ?? this.androidWeb,
      fuchsia: fuchsia ?? this.fuchsia,
      fuchsiaWeb: fuchsiaWeb ?? this.fuchsiaWeb,
      iOS: iOS ?? this.iOS,
      iOSWeb: iOSWeb ?? this.iOSWeb,
      linux: linux ?? this.linux,
      linuxWeb: linuxWeb ?? this.linuxWeb,
      macOS: macOS ?? this.macOS,
      macOSWeb: macOSWeb ?? this.macOSWeb,
      windows: windows ?? this.windows,
      windowsWeb: windowsWeb ?? this.windowsWeb,
    );
  }

  /// Override the equality operator.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is FlexAdaptive &&
        other.android == android &&
        other.androidWeb == androidWeb &&
        other.fuchsia == fuchsia &&
        other.fuchsiaWeb == fuchsiaWeb &&
        other.iOS == iOS &&
        other.iOSWeb == iOSWeb &&
        other.linux == linux &&
        other.linuxWeb == linuxWeb &&
        other.macOS == macOS &&
        other.macOSWeb == macOSWeb &&
        other.windows == windows &&
        other.windowsWeb == windowsWeb;
  }

  /// Override for hashcode, dart.ui Jenkins based.
  @override
  int get hashCode => Object.hashAll(<Object?>[
        android,
        androidWeb,
        fuchsia,
        fuchsiaWeb,
        iOS,
        iOSWeb,
        linux,
        linuxWeb,
        macOS,
        macOSWeb,
        windows,
        windowsWeb,
      ]);

  /// Flutter debug properties override, includes toString.
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('android', android));
    properties.add(DiagnosticsProperty<bool>('androidWeb', androidWeb));
    properties.add(DiagnosticsProperty<bool>('fuchsia', fuchsia));
    properties.add(DiagnosticsProperty<bool>('fuchsiaWeb', fuchsiaWeb));
    properties.add(DiagnosticsProperty<bool>('iOS', iOS));
    properties.add(DiagnosticsProperty<bool>('iOSWeb', iOSWeb));
    properties.add(DiagnosticsProperty<bool>('linux', linux));
    properties.add(DiagnosticsProperty<bool>('linuxWeb', linuxWeb));
    properties.add(DiagnosticsProperty<bool>('macOS', macOS));
    properties.add(DiagnosticsProperty<bool>('macOSWeb', macOSWeb));
    properties.add(DiagnosticsProperty<bool>('windows', windows));
    properties.add(DiagnosticsProperty<bool>('windowsWeb', windowsWeb));
  }
}
