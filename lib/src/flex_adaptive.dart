import 'package:flutter/cupertino.dart'; // For comment refs.
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'; // For comment refs.

import 'flex_color_scheme.dart' show FlexColorScheme; // For comment refs.
import 'flex_sub_themes_data.dart'; // For comment refs.

/// The [FlexAdaptive] class is used to define on what platforms
/// [FlexColorScheme] generated [ThemeData] platform adaptive theming
/// responses are used.
///
/// [FlexColorScheme] provides platform adaptive theming features, where
/// you can opt in and out of theming features and use different settings,
/// based on device platform and platform specific web usage of a web build
/// of your FlexColorScheme themed application.
///
/// The purpose of this feature is to enable using Material design based
/// themes, that are adjusted differently based on the used platform. A typical
/// use case is removing Material-3 design features that may be too opinionated
/// on e.g. iOS and desktop platforms, but you want to keep them on Android.
///
/// Each platform adaptive theming response can be configure to what platform it
/// applies to. You can even define it so you get a different theme on the
/// device native build and when using a web build of the same app, on the same
/// device. The swapping between the default none adaptive theme and the
/// platform adaptive response, can be done per platform and web usage
/// per platform.
///
/// The following adaptive theme settings are available in [FlexColorScheme]:
///
/// - [FlexSubThemesData.adaptiveRemoveElevationTint] to adaptively remove
///   elevation tint when Material-3 mode is used.
/// - [FlexSubThemesData.adaptiveElevationShadowsBack] to adaptively bring
///   elevation shadows back where they were removed in Material-3, when
///   Material-3 mode is used.
/// - [FlexSubThemesData.adaptiveAppBarScrollUnderOff] to adaptively remove the
///   [AppBar] scroll under elevation tint when Material-3 mode is used.
/// - [FlexSubThemesData.adaptiveRadius] to adaptively use global
///   [FlexSubThemesData.defaultRadiusAdaptive] instead of
///   [FlexSubThemesData.defaultRadius] in both Material-2 and Material-3 mode.
/// - [FlexSubThemesData.adaptiveDialogRadius] to platform adaptively use
///   [FlexSubThemesData.dialogRadiusAdaptive] instead of
///   [FlexSubThemesData.dialogRadius] in both Material-2 and Material-3
///   mode as border radius on dialogs.
/// - [FlexSubThemesData.adaptiveSplash] to platform adaptively use
///   [FlexSubThemesData.splashTypeAdaptive] instead of
///   [FlexSubThemesData.splashType] in both
///   Material-2 and Material-3 mode as Ink effect on Material widgets.
/// - [FlexSubThemesData.switchAdaptiveCupertinoLike] to platform adaptively use
///   a [Switch] theme that makes it look like a [CupertinoSwitch] on platforms
///   selected to get the adaptive response. It does not have to be only
///   Apple platforms, like [Switch.adaptive] constructor is.
///
/// More platform adaptive theming features may be added in future versions,
/// depending on feedback and requests. One planned **future** platform
/// adaptive feature is to introduce the Squircle or super-ellipses
/// as the curvature of the border radius. It would then be possible to use it
/// adaptively on desired platforms. When this adaptive feature is enabled
/// all Material components that use [ShapeBorder] will use Squircle curvature
/// instead of circular borer radius, on selected platforms. The Squircle is
/// the border curvature shape used on Apple devices. Adding this feature
/// is a bit on hold since there is currently no consensus or built-in support
/// in Flutter to draw an iOS correct Squircle. See issue:
/// https://github.com/flutter/flutter/issues/91523
///
/// - **FUTURE PLAN**: FlexSubThemesData.adaptiveSquircle use Squircle as
///   [ShapeBorder] shape instead of Circular, when added, will be available in
///   both Material-2 and Material-3 mode.
///
/// Another planned feature is FlexSubThemesData.adaptiveAppBarStyle, that
/// can enable you to e.g. use colored AppBar in traditional M2 style, plain
/// white e.g. on iOS. This could be useful for designs that on Android prefer
/// the classic M2 colored AppBar in light mode, but want to use a white AppBar
/// on iOS to match the typical design style on it. Since M3 also brings surface
/// colored AppBar to Android, this adaptive feature may not be in such high
/// demand anymore, but if a feature request for it appears, it may be added.
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
///  - [FlexAdaptive.appleWeb]
///  - [FlexAdaptive.desktop]
///  - [FlexAdaptive.iOSAndDesktop]
///  - [FlexAdaptive.excludeAndroidFuchsia]
///  - [FlexAdaptive.excludeWebAndroidFuchsia]
///
/// You can easily make your own custom configuration, if the above ones do
/// not fit your needs.
///
/// Platform aware adaptive theming in [FlexColorScheme] is not a
/// replacement for using actual platform aware and adaptive widgets, either
/// built-in ones in Flutter, or custom/package ones.
///
/// You may want to combine the platform adaptive theming features
/// with selected platform adaptive widgets. The platform adaptive theming can
/// help you remove certain features of Material-3 default theming that may
/// look out of place if you use [MaterialApp] with [ThemeData.useMaterial3]
/// enabled to build a cross platform apps.
///
/// You may often want or need to use some Material Design widgets in your cross
/// platform app. Using the platform aware theming features can make them
/// look more platform agnostic, instead of using their Material-3 defaults.
/// However, on Android you may prefer them to still use their Material-3
/// design. The adaptive theming features in [FlexColorScheme] are intended
/// to help you do both with one theme, to achieve such a design goals.
@immutable
class FlexAdaptive with Diagnosticable {
  /// Default constructor for making a platform adaptive response apply only
  /// on selected platforms.
  ///
  /// Default constructor requires all properties. Prefer using other
  /// constructors with suitable defaults, and overriding properties
  /// you want to change.
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
    this.overrideIsWeb,
  });

  /// The adaptive feature is not used.
  ///
  /// This is also the default behavior for all adaptive theming features.
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
    this.overrideIsWeb,
  });

  /// The adaptive feature is used on all platforms.
  ///
  /// Use this configuration it you want to use the adaptive response on all
  /// platforms. This is typically used to totally remove a Material-3 design
  /// style on all platforms that does not fit your custom design goals.
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
    this.overrideIsWeb,
  });

  /// Use the adaptive feature on Apple operating system iOS and macOS, but
  /// not when using the app on web browsers builds on iOS and macOS.
  ///
  /// The rationale for this config, you want the adaptive theme response on
  /// Apple devices, but not when it is used in a browser, in the browser
  /// you want the response of its default none adaptive value.
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
    this.overrideIsWeb,
  });

  /// Use the adaptive feature on Apple operating system iOS and macOS, and
  /// when using the app on web browsers builds on iOS and macOS.
  ///
  /// The rationale for this config, you want the adaptive feature on
  /// Apple devices, and also when the app is used on web on Apple devices.
  /// This is useful for an identical platform adaptive design of the
  /// progressive web app on apple devices. Other devices and their web
  /// usage get the none adaptive feature.
  const FlexAdaptive.appleWeb({
    this.android = false,
    this.androidWeb = false,
    this.fuchsia = false,
    this.fuchsiaWeb = false,
    this.iOS = true,
    this.iOSWeb = true,
    this.linux = false,
    this.linuxWeb = false,
    this.macOS = true,
    this.macOSWeb = true,
    this.windows = false,
    this.windowsWeb = false,
    this.overrideIsWeb,
  });

  /// Use the adaptive feature on desktop operating systems Windows, macOS and
  /// linux and also when using the app as a web build on their
  /// desktop web browsers.
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
    this.overrideIsWeb,
  });

  /// Use adaptive feature on iOS and all desktop operating systems (Windows,
  /// macOS and linux), also when using the app in their web browsers.
  ///
  /// Rationale for this configuration, you only want to retain the default
  /// none adaptive theme feature setup on Android and Fuchsia platforms on
  /// both their devices and their web behavior.
  ///
  /// Useful for changing M3 opinionated styles on everything else than
  /// Android and Fuchsia, while also keeping it for web usage on Android
  /// and Fuchsia builds.
  ///
  /// Consider using this configuration for correct platform styled
  /// progressive WEB apps on Android and Fuchsia. While the adaptive style
  /// is used on everything else, where the typical use case is to replace
  /// Material-3 opinionated styles with the platform adaptive values.
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
    this.overrideIsWeb,
  });

  /// Use adaptive feature on all platforms on web and on all devices,
  /// except Android and Fuchsia devices.
  ///
  /// Rationale for this configuration, you only want to retain the default
  /// Material 3 theme feature setup on Android and Fuchsia platform device
  /// builds, but on Web and all other platforms, you want the adaptive, less
  /// opinionated feature.
  ///
  /// The rationale for Web being same on all, it should look the same
  /// regardless of platform and it should use the less opinionated adaptive
  /// config. This is a suitable option if you are not ready to use the Google
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
    this.overrideIsWeb,
  });

  /// Don't use adaptive feature on any web platform, also exclude Android and
  /// Fuchsia devices from using the adaptive features.
  ///
  /// Rationale for this configuration, you want to retain the default
  /// Material 3 theme feature setup on Android and Fuchsia device
  /// platforms, and also use it on Web on all platforms. On all other device
  /// platforms you want the adaptive less opinionated design feature.
  ///
  /// The rationale for Web being same on all, it should look the same
  /// regardless of platform and it should use the Google opinionated
  /// Material 3 design. This is useful fi you on web always want to use
  /// Google's Material design, not the adaptive config, where some of those
  /// features are removed. With this option you typically use Material 3
  /// styles on web on all platforms and on Android and Fuchsia devices, but
  /// not on any other device build.
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
    this.overrideIsWeb,
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

  /// This property should only be used if you wish to override the
  /// actual value of [kIsWeb].
  ///
  /// Typically only used for testing and apps that want to fake
  /// [kIsWeb] to simulate the result of the app being run in a web build or
  /// not, for this the adaptive feature.
  ///
  /// This property is used by the Themes Playground app. Unless you are
  /// building something similar to the Themes Playground (example 5 in the
  /// package repo) app, you do not need to use this property and actually
  /// should not use it.
  final bool? overrideIsWeb;

  /// Using the current [FlexAdaptive] configuration, should the theme
  /// feature use this adaptive configuration?
  ///
  /// Returns true if the adaptive theme feature should be used.
  ///
  /// You can provide a [platformOverride] and web override [isWebOverride] for
  /// development and testing purposes.
  bool adapt([TargetPlatform? platformOverride, bool? isWebOverride]) {
    if (isWebOverride ?? overrideIsWeb ?? kIsWeb) {
      switch (platformOverride ?? defaultTargetPlatform) {
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
      switch (platformOverride ?? defaultTargetPlatform) {
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
    bool? overrideIsWeb,
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
      overrideIsWeb: overrideIsWeb ?? this.overrideIsWeb,
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
        other.windowsWeb == windowsWeb &&
        other.overrideIsWeb == overrideIsWeb;
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
        overrideIsWeb,
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
    properties.add(DiagnosticsProperty<bool>('overrideIsWeb', overrideIsWeb));
  }
}
