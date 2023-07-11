import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

enum AdaptiveTheme {
  off(
    label: 'Off',
    describe: 'Platform adaptive value is not used.\n',
    code: 'FlexAdaptive.off()',
    icon: Icons.hide_source_outlined,
  ),
  all(
    label: 'All platforms',
    describe: 'This platform adaptive setting is now used on all native '
        'platforms and on Web on all platforms. Use this choice to '
        'disable a feature that does not fit your design, '
        'typically a Material-3 design feature.\n',
    code: 'FlexAdaptive.all()',
    icon: Icons.radio_button_checked,
  ),
  apple(
    label: 'Apple devices',
    describe: 'Platform adaptive value is used on iOS and macOS '
        'device builds, '
        'but not on any web build, not even in browsers on iOS and macOS. '
        'Use this choice when you only want this value used '
        'on Apple device builds, and want to the keep the none adaptive '
        'value on all other platforms.\n',
    code: 'FlexAdaptive.apple()',
    icon: Icons.tablet_mac_outlined,
  ),
  appleWeb(
    label: 'Apple devices and web',
    describe: 'Platform adaptive value is used on iOS and macOS '
        'devices, also on Web when used from iOS and macOS. '
        'Use this choice when you always want this '
        'value used on Apple devices and want to the keep the none adaptive '
        'value on all other platforms. This option is useful for making a '
        'progressive web app that when used in a browser on Apple devices, '
        'will get same style as the native build on Apple devices.\n',
    code: 'FlexAdaptive.appleWeb()',
    icon: Icons.important_devices_outlined,
  ),
  desktop(
    label: 'Desktops',
    describe: 'Platform adaptive value is used on all desktop '
        'operating system builds and '
        'also when using a Web build of the app from a browser on all '
        'desktop operating systems.\n',
    code: 'FlexAdaptive.desktop()',
    icon: Icons.desktop_mac_outlined,
  ),
  iOSAndDesktop(
    label: 'Desktops and iOS',
    describe: 'Platform adaptive value is used on all desktop '
        'operating system and iOS builds, '
        'including when using a Web build of the app on them. Use this '
        'choice to use the none adaptive value on Android/Fuchsia device '
        'builds and when using a web build of the app on them as a '
        'progressive web app. All other platforms and Web usage get the '
        'platform adaptive value.\n',
    code: 'FlexAdaptive.iOSAndDesktop()',
    icon: Icons.devices_outlined,
  ),
  excludeAndroidFuchsia(
    label: 'Exclude Android/Fuchsia',
    describe: 'Platform adaptive setting is used on all platforms and '
        'Web, except on Android and Fuchsia device builds. '
        'They keep the none adaptive setting. Use this option to keep the none '
        'adaptive value, typically M3 design, on Android/Fuchsia, but use '
        'a Web value that is equal on all platforms and uses this '
        'platform adaptive value.\n',
    code: 'FlexAdaptive.excludeAndroidFuchsia()',
    icon: Icons.mobile_off_outlined,
  ),
  excludeWebAndroidFuchsia(
    label: 'Exclude Android/Fuchsia and all Web usage',
    describe: 'Platform adaptive setting is used on all platforms, '
        'except on native Android and Fuchsia device builds. Web usage on '
        'all platforms also keep the none platform adaptive value. Use '
        'this option to go all-in on Material-3 design on Google platforms '
        'and on web on all platforms, but still keep this platform '
        'adaptive value on all other device builds. Typically to use a '
        'less M3 opinionated design on their native builds.\n',
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
