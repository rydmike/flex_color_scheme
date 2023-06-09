import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../shared/widgets/universal/flex_icons.dart';
import '../../../shared/widgets/universal/list_tile_reveal.dart';

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
  final TargetPlatform? platform;
  final ValueChanged<TargetPlatform?>? onChanged;

  static const String _labelAndroid = 'Google Android';
  static const String _labelApple = 'Apple iOS';
  static const String _labelWindows = 'Microsoft Windows';
  static const String _labelMacOs = 'Apple macOS';
  static const String _labelLinux = 'Linux';
  static const String _labelFuchsia = 'Google Fuchsia';
  static final String _platform = defaultTargetPlatform.name;
  static final String _labelDefault = 'Actual platform ($_platform)';
  static const Map<TargetPlatform, IconData> _platformIcon =
      <TargetPlatform, IconData>{
    TargetPlatform.android: Icons.android,
    TargetPlatform.iOS: Icons.phone_iphone,
    TargetPlatform.windows: FlexIcons.windows,
    TargetPlatform.macOS: FlexIcons.apple,
    TargetPlatform.linux: FlexIcons.linux,
    TargetPlatform.fuchsia: FlexIcons.infinity,
  };
  static final Map<TargetPlatform, String> _platformString =
      <TargetPlatform, String>{
    TargetPlatform.android: _labelAndroid,
    TargetPlatform.iOS: _labelApple,
    TargetPlatform.windows: _labelWindows,
    TargetPlatform.macOS: _labelMacOs,
    TargetPlatform.linux: _labelLinux,
    TargetPlatform.fuchsia: _labelFuchsia,
  };

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color iconColor = theme.colorScheme.primary;
    final TextStyle txtStyle = theme.textTheme.labelLarge!;

    String subtitle;
    String platformLabel;
    if (platform != null) {
      platformLabel =
          'Mock ${_platformString[TargetPlatform.values[platform!.index]]!}';
      subtitle = 'Mock and used platform now set to '
          '${_platformString[TargetPlatform.values[platform!.index]]}, '
          'actual platform is $_platform.\n';
    } else {
      platformLabel = _labelDefault;
      subtitle = 'Now using actual platform $_platform.\n';
    }
    // If platform is null, we use the length of TargetPlatform as index.
    // To use and get last item, which is th null default selection.
    final int index = platform?.index ?? TargetPlatform.values.length;
    // Controls are disabled if onChanged callback is omitted.
    final bool enabled = onChanged != null;

    return PopupMenuButton<int>(
      enabled: enabled,
      tooltip: '',
      padding: const EdgeInsets.all(10),
      onSelected: (int index) {
        if (index >= TargetPlatform.values.length) {
          subtitle = 'Now using actual platform $_platform.\n';
        } else {
          subtitle =
              'Now set to ${_platformString[TargetPlatform.values[index]]}, '
              'actual platform is $_platform.\n';
        }
        onChanged?.call(index >= TargetPlatform.values.length
            ? null
            : TargetPlatform.values[index]);
      },
      itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
        for (int i = 0; i <= TargetPlatform.values.length; i++)
          PopupMenuItem<int>(
            value: i,
            child: ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              leading: i < TargetPlatform.values.length
                  ? Icon(_platformIcon[TargetPlatform.values[i]],
                      color: index == i ? iconColor : null)
                  : Icon(Icons.devices_outlined,
                      color: index == i ? iconColor : null),
              title: i < TargetPlatform.values.length
                  ? Text(_platformString[TargetPlatform.values[i]]!,
                      style: txtStyle)
                  : Text(_labelDefault, style: txtStyle),
            ),
          )
      ],
      child: ListTileReveal(
        enabled: enabled,
        title: Text('Platform\n$platformLabel'),
        subtitleDense: true,
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
                'Use this setting to test what your adaptive theme looks '
                'looks like on different platforms by mocking another '
                'platform here in the Playground.\n'),
            Text(subtitle),
          ],
        ),
        trailing: Padding(
          padding: const EdgeInsetsDirectional.only(end: 5),
          child: Icon(
            _platformIcon[platform ?? defaultTargetPlatform],
            color: iconColor,
            size: 40,
          ),
        ),
      ),
    );
  }
}
