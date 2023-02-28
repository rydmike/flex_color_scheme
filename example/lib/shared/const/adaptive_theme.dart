import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

enum AdaptiveTheme {
  off(
    label: 'Off',
    describe: 'This platform adaptive feature is not used.',
    code: 'FlexAdaptive.off()',
    icon: Icons.hide_source_outlined,
  ),
  all(
    label: 'All platforms',
    describe: 'Used on all native platforms and on web on all platforms. '
        'Use this option to turn off, typically a Material 3 design feature, '
        'that does not fit your design requirements at all.',
    code: 'FlexAdaptive.all()',
    icon: Icons.radio_button_checked,
  ),
  apple(
    label: 'Apple devices',
    describe: 'Used on iOS and macOS device builds and when using a web build '
        'of the app on iOS and macOS.',
    code: 'FlexAdaptive.apple()',
    icon: Icons.tablet_mac_outlined,
  ),
  desktop(
    label: 'Desktops',
    describe: 'Used on all desktop operating system builds and when '
        'using a web build of the app on them.',
    code: 'FlexAdaptive.desktop()',
    icon: Icons.desktop_mac_outlined,
  ),
  iOSAndDesktop(
    label: 'Desktops and iOS',
    describe: 'Used on all desktop operating system and iOS builds, including '
        'when using a web build of the app on them. This config is used to '
        'keep a standard Android theme on Android/Fuchsia device builds and '
        'when using the web build on them as a progressive web app. All '
        'other platforms and web usage get the adaptive design.',
    code: 'FlexAdaptive.iOSAndDesktop()',
    icon: Icons.devices_outlined,
  ),
  excludeAndroidFuchsia(
    label: 'Exclude Android/Fuchsia',
    describe: 'Use the adaptive feature on all platforms and on web when '
        'used from any platform. Except on Android and Fuchsia device builds, '
        'they keep the standard theme feature. Use this option '
        'to keep standard theme on Android/Fuchsia, but a web design that is '
        'equal on all platforms and using the platform adaptive design.',
    code: 'FlexAdaptive.excludeAndroidFuchsia()',
    icon: Icons.mobile_off_outlined,
  ),
  excludeWebAndroidFuchsia(
    label: 'Exclude Android/Fuchsia and all Web usage',
    describe: 'Used on all platforms, except on native Android and Fuchsia '
        'device builds. Web usage on all platforms retains the standard '
        'theme feature. Use this option to go all-in on Material design on '
        'Google platforms and on web usage on all platform, but to use the '
        'platform adaptive style on all other device builds.',
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
