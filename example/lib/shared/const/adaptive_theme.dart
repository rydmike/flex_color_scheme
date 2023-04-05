import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

enum AdaptiveTheme {
  off(
    label: 'Off',
    describe: 'Platform adaptive feature is not used.\n',
    code: 'FlexAdaptive.off()',
    icon: Icons.hide_source_outlined,
  ),
  all(
    label: 'All platforms',
    describe: 'Platform adaptive feature is used on all native platforms and '
        'on web on all platforms. '
        'Use this option to disable, typically a Material 3 design feature, '
        'that does not fit your design.\n',
    code: 'FlexAdaptive.all()',
    icon: Icons.radio_button_checked,
  ),
  apple(
    label: 'Apple devices',
    describe: 'Use on iOS and macOS device builds, '
        'but not on any web build, not even in browsers on iOS and macOS. '
        'Use this option if you only want this platform adaptive feature '
        'on Apple device builds, and want to the keep the none adaptive '
        'designs on all other platforms.\n',
    code: 'FlexAdaptive.apple()',
    icon: Icons.tablet_mac_outlined,
  ),
  appleWeb(
    label: 'Apple devices and web',
    describe: 'Use on iOS and macOS device, also on web builds when '
        'used from iOS and macOS. Use this option if you always want this '
        'feature used on Apple devices and want to the keep the none adaptive '
        'value on all other platforms. This option is useful for making a '
        'progressive web app, that when used in a browser o Apple devices, '
        'matches its style when used as a native build.\n',
    code: 'FlexAdaptive.appleWeb()',
    icon: Icons.important_devices_outlined,
  ),
  desktop(
    label: 'Desktops',
    describe: 'Used on all desktop operating system builds and also when '
        'using a web build of the app from oa browser on them.\n',
    code: 'FlexAdaptive.desktop()',
    icon: Icons.desktop_mac_outlined,
  ),
  iOSAndDesktop(
    label: 'Desktops and iOS',
    describe: 'Used on all desktop operating system and iOS builds, including '
        'when using a web build of the app on them. This config is used to '
        'keep a standard Android theme on Android/Fuchsia device builds and '
        'when using the web build on them as a progressive web app. All '
        'other platforms and web usage get the adaptive design.\n',
    code: 'FlexAdaptive.iOSAndDesktop()',
    icon: Icons.devices_outlined,
  ),
  excludeAndroidFuchsia(
    label: 'Exclude Android/Fuchsia',
    describe: 'Use this adaptive feature on all platforms and on web when '
        'used from any platform, except on Android and Fuchsia device builds. '
        'They keep the none adaptive setting. Use this option to keep standard '
        'theme, often M3 design, on Android/Fuchsia, but a web design that is '
        'equal on all platforms and using the less opinionated adaptive '
        'value.\n',
    code: 'FlexAdaptive.excludeAndroidFuchsia()',
    icon: Icons.mobile_off_outlined,
  ),
  excludeWebAndroidFuchsia(
    label: 'Exclude Android/Fuchsia and all Web usage',
    describe: 'Use this adaptive feature on all platforms, except on native '
        'Android and Fuchsia device builds. Web usage on all platforms also '
        'retains the standard theme feature. Use this option to go all-in on '
        'Material 3 design on Google platforms and web usage on all platforms, '
        'but use the platform adaptive style on all other device builds.\n',
    code: 'FlexAdaptive.excludeWebAndroidFuchsia()',
    icon: Icons.no_cell_outlined,
  );

  const AdaptiveTheme({
    required this.label,
    required this.describe,
    required this.code,
    required this.icon,
  });

  final String label;
  final String describe;
  final String code;
  final IconData icon;

  FlexAdaptive setting([bool? overrideIsWeb]) {
    switch (this) {
      case AdaptiveTheme.off:
        return FlexAdaptive.off(overrideIsWeb: overrideIsWeb);
      case AdaptiveTheme.all:
        return FlexAdaptive.all(overrideIsWeb: overrideIsWeb);
      case AdaptiveTheme.apple:
        return FlexAdaptive.apple(overrideIsWeb: overrideIsWeb);
      case AdaptiveTheme.appleWeb:
        return FlexAdaptive.apple(overrideIsWeb: overrideIsWeb);
      case AdaptiveTheme.desktop:
        return FlexAdaptive.desktop(overrideIsWeb: overrideIsWeb);
      case AdaptiveTheme.iOSAndDesktop:
        return FlexAdaptive.iOSAndDesktop(overrideIsWeb: overrideIsWeb);
      case AdaptiveTheme.excludeAndroidFuchsia:
        return FlexAdaptive.excludeAndroidFuchsia(overrideIsWeb: overrideIsWeb);
      case AdaptiveTheme.excludeWebAndroidFuchsia:
        return FlexAdaptive.excludeWebAndroidFuchsia(
            overrideIsWeb: overrideIsWeb);
    }
  }
}
