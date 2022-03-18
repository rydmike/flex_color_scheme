import 'package:flutter/material.dart';

import '../../../../shared/widgets/universal/header_card.dart';
import '../../../../shared/widgets/universal/theme_showcase.dart';

class ListTileSettings extends StatelessWidget {
  const ListTileSettings({
    Key? key,
    this.isOpen = true,
    this.onTap,
  }) : super(key: key);
  final bool isOpen;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return HeaderCard(
      isOpen: isOpen,
      onTap: onTap,
      title: const Text('ListTile'),
      child: Column(
        children: const <Widget>[
          ListTile(
            title: Text('Themed List tiles'),
            subtitle: Text(
              'There are four different ListTile types in Flutter. They '
              'are very useful widgets for settings and options, used '
              'extensively in this application too. In FlexColorScheme you can '
              'for now only quick theme them by theming the colors of the '
              'switches, checkboxes and radio buttons they use.',
            ),
          ),
          Divider(),
          ListTileShowcase(),
        ],
      ),
    );
  }
}
