import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/theme_showcase.dart';

class TooltipIconButtonAvatarDropdownSettings extends StatelessWidget {
  const TooltipIconButtonAvatarDropdownSettings(this.controller, {super.key});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        SwitchListTile(
          title: const Text(
            'Tooltip background brightness',
          ),
          subtitle: const Text(
            'OFF theme mode inverted, common on Web\n'
            'ON theme mode brightness, like Windows',
          ),
          value: controller.tooltipsMatchBackground &&
              controller.useFlexColorScheme,
          onChanged: controller.useFlexColorScheme
              ? controller.setTooltipsMatchBackground
              : null,
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: TooltipShowcase(),
        ),
        const Divider(),
        const ListTile(
          title: Text('IconButton, CircleAvatar and DropdownButton'),
          subtitle: Text('Included to show their themed styles'),
        ),
        const Padding(
          padding: EdgeInsets.all(16),
          child: IconButtonCircleAvatarDropdownShowcase(),
        ),
      ],
    );
  }
}
