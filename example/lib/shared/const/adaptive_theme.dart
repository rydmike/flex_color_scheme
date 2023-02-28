import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

enum AdaptiveTheme {
  off(
    label: 'Off',
    describe: 'Not used.',
    code: 'FlexAdaptive.off()',
    icon: Icons.hide_source_outlined,
  ),
  all(
    label: 'All platforms',
    describe: 'Used on all native platforms and on web on all platforms. '
        'Use this to turn of an M3 feature that does not fit your design '
        'requirements.',
    code: 'FlexAdaptive.all()',
    icon: Icons.radio_button_checked,
  ),
  apple(
    label: 'Apple devices',
    describe: 'Used on native iOS and macOS builds and when using a web build '
        'of the app on iOS and macOS.',
    code: 'FlexAdaptive.apple()',
    icon: Icons.tablet_mac_outlined,
  ),
  desktop(
    label: 'Desktops',
    describe: 'Used on all native desktop operating system builds and when '
        'using a web build of the app on them.',
    code: 'FlexAdaptive.desktop()',
    icon: Icons.desktop_mac_outlined,
  ),
  iOSAndDesktop(
    label: 'Desktops and iOS',
    describe: 'Used on native desktops and iOS builds, including '
        'when using a web build of the app on them.',
    code: 'FlexAdaptive.iOSAndDesktop()',
    icon: Icons.devices_outlined,
  ),
  excludeAndroidFuchsia(
    label: 'No Android/Fuchsia',
    describe: 'Used on all platforms, except on Android and Fuchsia native '
        'builds, but when a web build of the app app is used on them, the '
        'adaptive feature is used. Only native Android and Fuchsia builds '
        'keep the standard feature.',
    code: 'FlexAdaptive.excludeAndroidFuchsia()',
    icon: Icons.mobile_off_outlined,
  ),
  excludeWebAndroidFuchsia(
    label: 'No Web Android/Fuchsia',
    describe: 'Used on all platforms, except on Android and Fuchsia native '
        'builds and their web build usage of the app. Web usage on '
        'Android/Fuchsia platform also keep the standard feature. Use this '
        'to keep a native Android look on progressive web apps.',
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
