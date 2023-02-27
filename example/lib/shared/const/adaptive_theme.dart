import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

enum AdaptiveTheme {
  off(
    label: 'Feature off',
    describe: 'Adaptive feature is not used.',
    code: 'FlexAdaptive.off()',
    icon: Icons.radio_button_unchecked,
  ),
  all(
    label: 'All platforms',
    describe: 'Adaptive feature is used on all native platforms and on web '
        'on all platforms.',
    code: 'FlexAdaptive.all()',
    icon: Icons.radio_button_checked,
  ),
  apple(
    label: 'Apple devices',
    describe: 'Adaptive feature is used on native iOS and macOS builds and '
        'when using the app on a web browser on these devices.',
    code: 'FlexAdaptive.apple()',
    icon: Icons.tablet_mac_outlined,
  ),
  desktop(
    label: 'Desktops',
    describe: 'The adaptive feature is used on all native desktop operating '
        'system builds and when using the app on a web browser on them.',
    code: 'FlexAdaptive.desktop()',
    icon: Icons.desktop_mac_outlined,
  ),
  iOSAndDesktop(
    label: 'Desktops and iOS',
    describe: 'The adaptive feature is used on desktops and on iOS, including '
        'web when used in a browser on them.',
    code: 'FlexAdaptive.iOSAndDesktop()',
    icon: Icons.devices_outlined,
  ),
  excludeAndroidFuchsia(
    label: 'No Android/Fuchsia',
    describe: 'The adaptive theme feature is used on all platforms, except on '
        'Android and Fuchsia native builds, their web browsers use the '
        'adaptive feature. Only native Android and Fuchsia builds keep the '
        'standard feature.',
    code: 'FlexAdaptive.excludeAndroidFuchsia()',
    icon: Icons.mobile_off_outlined,
  ),
  excludeWebAndroidFuchsia(
    label: 'No Web Android/Fuchsia',
    describe: 'The adaptive theme feature is used on all platforms, except on '
        'Android and Fuchsia native builds and their web usage. Web on '
        'Android/Fuchsia also keep standard feature for a native look on '
        'progressive web apps.',
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

  FlexAdaptive setting() {
    switch (this) {
      case AdaptiveTheme.off:
        return const FlexAdaptive.off();
      case AdaptiveTheme.all:
        return const FlexAdaptive.all();
      case AdaptiveTheme.apple:
        return const FlexAdaptive.apple();
      case AdaptiveTheme.desktop:
        return const FlexAdaptive.desktop();
      case AdaptiveTheme.iOSAndDesktop:
        return const FlexAdaptive.iOSAndDesktop();
      case AdaptiveTheme.excludeAndroidFuchsia:
        return const FlexAdaptive.excludeAndroidFuchsia();
      case AdaptiveTheme.excludeWebAndroidFuchsia:
        return const FlexAdaptive.excludeWebAndroidFuchsia();
    }
  }
}
