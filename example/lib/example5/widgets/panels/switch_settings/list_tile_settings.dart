import 'package:flutter/material.dart';

import '../../../../shared/widgets/universal/theme_showcase.dart';

class ListTileSettings extends StatelessWidget {
  const ListTileSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        SizedBox(height: 8),
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
    );
  }
}
