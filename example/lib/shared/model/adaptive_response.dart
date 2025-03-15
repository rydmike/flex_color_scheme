import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

enum AdaptiveResponse {
  off(
    label: 'Off',
    describe: 'A platform adaptive response is not used.\n',
    code: 'FlexAdaptive.off()',
    icon: Icons.hide_source_outlined,
  ),
  all(
    label: 'All platforms',
    describe: 'The platform adaptive response is used on ALL native '
        'platform builds and on web builds on ALL platforms.\n'
        '\n'
        'Use this choice to disable a theming feature that does not fit '
        'your design, typically a Material-3 design feature.\n',
    code: 'FlexAdaptive.all()',
    icon: Icons.radio_button_checked,
  ),
  apple(
    label: 'Apple devices, no web usage',
    describe: 'The platform adaptive response is used on iOS and macOS '
        'device builds, but not on any platform with the web build, '
        'not even in browsers on iOS and macOS.\n'
        '\n'
        'Use this choice when you only want the platform adaptive response '
        'on Apple device builds, but want to keep the none adaptive '
        'response on all other platforms.\n',
    code: 'FlexAdaptive.apple()',
    icon: Icons.tablet_mac_outlined,
  ),
  appleWeb(
    label: 'Apple devices and their web usage',
    describe: 'The platform adaptive response is used on iOS and macOS '
        'devices, also on web builds when used from iOS and macOS.\n'
        '\n'
        'Use this choice when you want this platform adaptive response '
        'on Apple devices and want to the keep the none adaptive '
        'value on all other platforms. This option is useful for making a '
        'web app that when used in a browser on Apple devices, '
        'will get the same style as the native build on Apple devices.\n',
    code: 'FlexAdaptive.appleWeb()',
    icon: Icons.important_devices_outlined,
  ),
  desktop(
    label: 'Desktops and their web usage',
    describe: 'The platform adaptive response is used on all desktop '
        'operating system builds, also when using a web build of the app '
        'from a browser on all desktop operating systems.\n',
    code: 'FlexAdaptive.desktop()',
    icon: Icons.desktop_mac_outlined,
  ),
  iOSAndDesktop(
    label: 'Desktops, iOS and their web usage',
    describe: 'The platform adaptive response is used on all desktop '
        'operating system and iOS builds, '
        'including when using a web build of the app on them.\n'
        '\n'
        'Use this choice to use the none adaptive response on Android and '
        'Fuchsia device builds and when using a web build of the app on them. '
        'All other platforms and Web usage get this platform adaptive '
        'response.\n',
    code: 'FlexAdaptive.iOSAndDesktop()',
    icon: Icons.devices_outlined,
  ),
  excludeAndroidFuchsia(
    label: 'Exclude Android and Fuchsia device builds',
    describe: 'The platform adaptive response is used on all platforms and all '
        'Web builds, only Android and Fuchsia device builds are excluded. '
        'They keep the none adaptive response.\n'
        '\n'
        'Use this option to keep the none adaptive response, typically '
        'Material-3 design, on Android and Fuchsia device builds. '
        'Apply this platform adaptive response on all other device builds '
        'and on ALL platforms on web builds.\n',
    code: 'FlexAdaptive.excludeAndroidFuchsia()',
    icon: Icons.mobile_off_outlined,
  ),
  excludeWebAndroidFuchsia(
    label: 'Exclude Android and Fuchsia, exclude all Web usage',
    describe: 'The platform adaptive response is used on all platforms, '
        'except on native Android and Fuchsia device builds. Web usage on '
        'all platforms also keep the none adaptive response.\n'
        '\n'
        'Use this option to go all-in on Material-3 design on Google platforms '
        'and on web builds on all platforms. We keep this platform '
        'adaptive response on all other device builds. Typically to use a '
        'less Material-3 opinionated design on their native builds.\n',
    code: 'FlexAdaptive.excludeWebAndroidFuchsia()',
    icon: Icons.no_cell_outlined,
  );

  const AdaptiveResponse({
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
      case AdaptiveResponse.off:
        return FlexAdaptive.off(overrideIsWeb: overrideIsWeb);
      case AdaptiveResponse.all:
        return FlexAdaptive.all(overrideIsWeb: overrideIsWeb);
      case AdaptiveResponse.apple:
        return FlexAdaptive.apple(overrideIsWeb: overrideIsWeb);
      case AdaptiveResponse.appleWeb:
        return FlexAdaptive.appleWeb(overrideIsWeb: overrideIsWeb);
      case AdaptiveResponse.desktop:
        return FlexAdaptive.desktop(overrideIsWeb: overrideIsWeb);
      case AdaptiveResponse.iOSAndDesktop:
        return FlexAdaptive.iOSAndDesktop(overrideIsWeb: overrideIsWeb);
      case AdaptiveResponse.excludeAndroidFuchsia:
        return FlexAdaptive.excludeAndroidFuchsia(overrideIsWeb: overrideIsWeb);
      case AdaptiveResponse.excludeWebAndroidFuchsia:
        return FlexAdaptive.excludeWebAndroidFuchsia(
            overrideIsWeb: overrideIsWeb);
    }
  }
}
