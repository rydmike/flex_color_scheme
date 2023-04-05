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
      subtitleDense: true,
      subtitle: Text('Component theme colors are defined by each '
          "component's settings panel. Below default or currently selected "
          'ColorScheme based used theme color for each component. '
          'Themed interaction colors for hover, focus, highlight and '
          'splash are also shown.\n'),
    );
  }
}
