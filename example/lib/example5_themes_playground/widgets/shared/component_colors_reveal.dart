import 'package:flutter/material.dart';

import '../../../shared/widgets/universal/list_tile_reveal.dart';

class ComponentColorsReveal extends StatelessWidget {
  const ComponentColorsReveal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ListTileReveal(
      title: Text('Component theme colors'),
      subtitleReveal: Text('Component theme colors are defined in each '
          "component's settings panel. Below default or currently selected "
          'ColorScheme based color for important components and their '
          'main ColorScheme based color.\n'),
    );
  }
}
