import 'package:flutter/material.dart';

import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';

class MaterialPanel extends StatelessWidget {
  const MaterialPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 8),
        ListTileReveal(
          title: Text('Material'),
          subtitleDense: true,
          subtitle: Text('Material can also specify surfaceTint color, '
              'which is applied when Material is elevated, but only in '
              'Material 3 mode.\n'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: MaterialShowcase(explain: false),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
