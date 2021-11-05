import 'package:flutter/material.dart';

class PlatformPopupMenu extends StatelessWidget {
  const PlatformPopupMenu({
    Key? key,
    required this.platform,
    required this.onChanged,
  }) : super(key: key);
  final TargetPlatform platform;
  final ValueChanged<TargetPlatform> onChanged;

  @override
  Widget build(BuildContext context) {
    const String labelAndroid = 'Google Android';
    const String labelApple = 'Apple iOS';
    const String labelWindows = 'Microsoft Windows';
    const String labelMacOs = 'Apple MacOS';
    const String labelLinux = 'Linux';
    const String labelFuchsia = 'Google Fuchsia';

    const Map<TargetPlatform, PopupMenuItem<TargetPlatform>> platformItems =
        <TargetPlatform, PopupMenuItem<TargetPlatform>>{
      TargetPlatform.android: PopupMenuItem<TargetPlatform>(
        value: TargetPlatform.android,
        child: ListTile(
          leading: Icon(Icons.phone_android_rounded),
          title: Text(labelAndroid),
        ),
      ),
      TargetPlatform.iOS: PopupMenuItem<TargetPlatform>(
        value: TargetPlatform.iOS,
        child: ListTile(
          leading: Icon(Icons.phone_iphone_rounded),
          title: Text(labelApple),
        ),
      ),
      TargetPlatform.windows: PopupMenuItem<TargetPlatform>(
        value: TargetPlatform.windows,
        child: ListTile(
          leading: Icon(Icons.desktop_windows_rounded),
          title: Text(labelWindows),
        ),
      ),
      TargetPlatform.macOS: PopupMenuItem<TargetPlatform>(
        value: TargetPlatform.macOS,
        child: ListTile(
          leading: Icon(Icons.laptop_mac_rounded),
          title: Text(labelMacOs),
        ),
      ),
      TargetPlatform.linux: PopupMenuItem<TargetPlatform>(
        value: TargetPlatform.linux,
        child: ListTile(
          leading: Icon(Icons.desktop_windows_sharp),
          title: Text(labelLinux),
        ),
      ),
      TargetPlatform.fuchsia: PopupMenuItem<TargetPlatform>(
        value: TargetPlatform.fuchsia,
        child: ListTile(
          leading: Icon(Icons.laptop_chromebook_rounded),
          title: Text(labelFuchsia),
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

    const Map<TargetPlatform, Widget> platformIcon = <TargetPlatform, Widget>{
      TargetPlatform.android: Icon(Icons.phone_android_rounded),
      TargetPlatform.iOS: Icon(Icons.phone_iphone_rounded),
      TargetPlatform.windows: Icon(Icons.desktop_windows_rounded),
      TargetPlatform.macOS: Icon(Icons.laptop_mac_rounded),
      TargetPlatform.linux: Icon(Icons.desktop_windows_sharp),
      TargetPlatform.fuchsia: Icon(Icons.laptop_chromebook_rounded),
    };

    String subtitle = 'Now set to ${platformString[platform]}';

    return PopupMenuButton<TargetPlatform>(
      padding: const EdgeInsets.all(10),
      onSelected: (TargetPlatform value) {
        subtitle = 'Now set to ${platformString[value]}';
        onChanged(value);
      },
      itemBuilder: (BuildContext context) =>
          <PopupMenuItem<TargetPlatform>>[...platformItems.values.toList()],
      child: ListTile(
        trailing: platformIcon[platform],
        title: const Text('Select platform mechanics'),
        subtitle: Text(subtitle),
      ),
    );
  }
}
