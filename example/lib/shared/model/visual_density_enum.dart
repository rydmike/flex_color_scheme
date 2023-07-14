import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum VisualDensityEnum {
  standard(
    label: 'Standard',
    describe: 'The Standard VisualDensity is the least dense of component UI '
        'density settings in Flutter. This is the preferred density on small '
        'mobile touch based devices. It is called "Standard", because '
        'originally this mobile density was the only supported '
        'density in Flutter.\n',
    code: 'VisualDensity.standard',
    icon: Icons.crop_din_outlined,
  ),
  comfortable(
    label: 'Comfortable',
    describe: 'The Comfortable VisualDensity is a medium level of component UI '
        'density setting in Flutter. It is not used by Flutter SDK '
        'by default on any devices. It works well and looks balanced on '
        'laptops with touch screens. It allows user interface elements to be '
        'a bit larger than Compact, without looking overblown large, like '
        'the Standard density does on desktop devices.\n',
    code: 'VisualDensity.comfortable',
    icon: Icons.crop_3_2_outlined,
  ),
  compact(
    label: 'Compact',
    describe: 'The Compact VisualDensity is the most dense and compact '
        'component UI density setting in Flutter. It is used by '
        'Flutter SDK by default on Windows, macOS and Linux. It may make some '
        'components look a bit too compact, if you think so, try the '
        'Comfortable setting instead.\n',
    code: 'VisualDensity.compact',
    icon: Icons.crop_16_9_outlined,
  ),
  platform(
    label: 'Platform adaptive',
    describe: 'This VisualDensity is adaptive based on the current '
        'platform on which the framework is executing. If a density is not '
        'specified in ThemeData, Flutter SDK uses this setup by DEFAULT. This '
        'setting results in Standard density on platforms '
        'Android, iOS and Fuchsia, while Windows, macOs and Linux get '
        'the Compact value.\n',
    code: 'VisualDensity.adaptivePlatformDensity',
    icon: Icons.calendar_view_day_outlined,
  ),
  comfortablePlatform(
    label: 'Platform comfortable adaptive',
    describe: 'This VisualDensity is adaptive based on the current '
        'platform on which the framework is executing. It '
        'results in Standard density on platforms '
        'Android, iOS and Fuchsia, while Windows, macOs and Linux get '
        'the Comfortable VisualDensity. If you feel that the Flutter '
        'default platform adaptive density results in too dense components on '
        'desktops, try this adaptive density instead. It is identical to the '
        'default one on mobile devices, but uses Comfortable density on '
        'desktops, instead of Compact.\n',
    code: 'FlexColorScheme.comfortablePlatformDensity',
    icon: Icons.view_day_outlined,
  );

  const VisualDensityEnum({
    required this.label,
    required this.describe,
    required this.code,
    required this.icon,
  });

  final String label;
  final String describe;
  final String code;
  final IconData icon;

  // The setting allows us to use optional platform controlled via app, to
  // get the correct mocked platform density responses for those settings.
  VisualDensity setting(TargetPlatform? platform) {
    switch (this) {
      case VisualDensityEnum.standard:
        return VisualDensity.standard;
      case VisualDensityEnum.comfortable:
        return VisualDensity.comfortable;
      case VisualDensityEnum.compact:
        return VisualDensity.compact;
      case VisualDensityEnum.platform:
        return VisualDensity.defaultDensityForPlatform(
            platform ?? defaultTargetPlatform);
      case VisualDensityEnum.comfortablePlatform:
        return FlexColorScheme.defaultComfortablePlatformDensity(
            platform ?? defaultTargetPlatform);
    }
  }
}
