import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

enum VisualDensityEnum {
  standard(
    label: 'Standard',
    describe: 'The standard density is the least dense of component UI '
        'density settings in Flutter. This density is preferred on small '
        'mobile touch based devices. It is called "standard", because '
        'originally this mobile first component density was the only '
        'supported density in Flutter Material components.\n',
    code: 'VisualDensity.standard',
    icon: Icons.crop_din_outlined,
  ),
  comfortable(
    label: 'Comfortable',
    describe: 'The comfortable density is the medium level of component UI '
        'density settings in Flutter. This density is not used by Flutter SDK '
        'by default on any devices. It is a setting that works well and '
        'looks quite balanced on laptops with touch screens. It allows '
        'user interface elements to be a bit larger than Compact, without '
        'looking overblown large, like Standard density does on desktops '
        'devices.\n',
    code: 'VisualDensity.comfortable',
    icon: Icons.crop_3_2_outlined,
  ),
  compact(
    label: 'Compact',
    describe: 'The compact density is the most dense and compact '
        'component UI density settings in Flutter. This density is used by '
        'Flutter SDK by default on Windows, macOS and Linux. It may make some '
        'components look a bit too compact, if you think so try the '
        'comfortable setting.\n',
    code: 'VisualDensity.compact',
    icon: Icons.crop_16_9_outlined,
  ),
  platform(
    label: 'Platform adaptive',
    describe: 'A visual density that is adaptive based on the current '
        'platform on which the framework is executing. If a density is not '
        'specified in ThemeData, Flutter SDK uses this by default. This '
        'visual density setting results in Standard density on platforms '
        'Android, iOS and Fuchsia. While Windows, macOs and Linux get '
        'the Compact visual density.\n',
    code: 'VisualDensity.adaptivePlatformDensity',
    icon: Icons.calendar_view_day_outlined,
  ),
  comfortablePlatform(
    label: 'Platform comfortable adaptive',
    describe: 'A visual density that is adaptive based on the current '
        'platform on which the framework is executing. This '
        'visual density setting results in Standard density on platforms '
        'Android, iOS and Fuchsia. While Windows, macOs and Linux get '
        'the Comfortable visual density. If you feel that the Flutter '
        'default platform adaptive density results in too dense components on '
        'desktops, try this adaptive density instead. It is identical to the '
        'default one on mobile devices, but uses comfortable on desktops, '
        'instead of compact.\n',
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

  VisualDensity setting() {
    switch (this) {
      case VisualDensityEnum.standard:
        return VisualDensity.standard;
      case VisualDensityEnum.comfortable:
        return VisualDensity.comfortable;
      case VisualDensityEnum.compact:
        return VisualDensity.compact;
      case VisualDensityEnum.platform:
        return VisualDensity.adaptivePlatformDensity;
      case VisualDensityEnum.comfortablePlatform:
        return FlexColorScheme.comfortablePlatformDensity;
    }
  }
}
