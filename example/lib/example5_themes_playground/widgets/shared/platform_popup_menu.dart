import 'package:flutter/material.dart';

import '../../../shared/widgets/universal/flex_icons.dart';

// A popup menu that allows us to select the Flutter platform we want to use.
//
// Does not actually change the platform, only the UI for the selection.
// The actual selection is done via platform property in ThemeData.
class PlatformPopupMenu extends StatelessWidget {
  const PlatformPopupMenu({
    super.key,
    required this.platform,
    required this.onChanged,
  });
  final TargetPlatform platform;
  final ValueChanged<TargetPlatform> onChanged;

  @override
  Widget build(BuildContext context) {
    final Color iconColor = Theme.of(context).colorScheme.primary;
    const String labelAndroid = 'Google Android';
    const String labelApple = 'Apple iOS';
    const String labelWindows = 'Microsoft Windows';
    const String labelMacOs = 'Apple MacOS';
    const String labelLinux = 'Linux';
    const String labelFuchsia = 'Google Fuchsia';

    final Map<TargetPlatform, PopupMenuItem<TargetPlatform>> platformItems =
        <TargetPlatform, PopupMenuItem<TargetPlatform>>{
      TargetPlatform.android: PopupMenuItem<TargetPlatform>(
        value: TargetPlatform.android,
        child: ListTile(
          leading: Icon(Icons.android, color: iconColor),
          title: const Text(labelAndroid),
        ),
      ),
      TargetPlatform.iOS: PopupMenuItem<TargetPlatform>(
        value: TargetPlatform.iOS,
        child: ListTile(
          leading: Icon(Icons.phone_iphone, color: iconColor),
          // leading: Icon(MdiIcons.appleIos, color: iconColor),
          title: const Text(labelApple),
        ),
      ),
      TargetPlatform.windows: PopupMenuItem<TargetPlatform>(
        value: TargetPlatform.windows,
        child: ListTile(
          leading: Icon(FlexIcons.windows, color: iconColor),
          // leading: Icon(MdiIcons.microsoftWindows, color: iconColor),
          title: const Text(labelWindows),
        ),
      ),
      TargetPlatform.macOS: PopupMenuItem<TargetPlatform>(
        value: TargetPlatform.macOS,
        child: ListTile(
          leading: Icon(FlexIcons.apple, color: iconColor),
          // leading: Icon(MdiIcons.appleFinder, color: iconColor),
          title: const Text(labelMacOs),
        ),
      ),
      TargetPlatform.linux: PopupMenuItem<TargetPlatform>(
        value: TargetPlatform.linux,
        child: ListTile(
          leading: Icon(FlexIcons.linux, color: iconColor),
          // leading: Icon(MdiIcons.linux, color: iconColor),
          title: const Text(labelLinux),
        ),
      ),
      TargetPlatform.fuchsia: PopupMenuItem<TargetPlatform>(
        value: TargetPlatform.fuchsia,
        child: ListTile(
          leading: Icon(FlexIcons.infinity, color: iconColor),
          // leading: Icon(MdiIcons.allInclusive, color: iconColor),
          title: const Text(labelFuchsia),
        ),
      ),
    };

    const Map<TargetPlatform, String> platformString = <TargetPlatform, String>{
      TargetPlatform.android: labelAndroid,
      TargetPlatform.iOS: labelApple,
      TargetPlatform.windows: labelWindows,
      TargetPlatform.macOS: labelMacOs,
      TargetPlatform.linux: labelLinux,
      TargetPlatform.fuchsia: labelFuchsia,
    };

    const Map<TargetPlatform, IconData> platformIcon =
        <TargetPlatform, IconData>{
      TargetPlatform.android: Icons.android,
      TargetPlatform.iOS: Icons.phone_iphone,
      TargetPlatform.windows: FlexIcons.windows,
      TargetPlatform.macOS: FlexIcons.apple,
      TargetPlatform.linux: FlexIcons.linux,
      TargetPlatform.fuchsia: FlexIcons.infinity,
    };

    String subtitle = 'Now set to ${platformString[platform]}';

    return PopupMenuButton<TargetPlatform>(
      tooltip: '',
      padding: const EdgeInsets.all(10),
      onSelected: (TargetPlatform value) {
        subtitle = 'Now set to ${platformString[value]}';
        onChanged(value);
      },
      itemBuilder: (BuildContext context) =>
          <PopupMenuItem<TargetPlatform>>[...platformItems.values],
      child: ListTile(
        trailing: Padding(
          padding: const EdgeInsetsDirectional.only(end: 12),
          child: Icon(
            platformIcon[platform],
            color: iconColor,
            size: 40,
          ),
        ),
        title: const Text('Select platform'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('For testing purposes only, not persisted.'),
            Text(subtitle),
          ],
        ),
      ),
    );
  }
}
