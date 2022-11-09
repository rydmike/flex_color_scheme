import 'package:flutter/material.dart';

import '../../../../shared/widgets/universal/theme_showcase.dart';

class MaterialPanel extends StatelessWidget {
  const MaterialPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        SizedBox(height: 8),
        ListTile(
          title: Text('Material'),
          subtitle: Text('The Material widget is lower level building block. '
              'It cannot be themed, but has theme dependent default behaviour '
              'shown below. Material is responsible for clipping, elevation '
              'and ink effects below its children.'),
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: MaterialShowcase(),
        ),
      ],
    );
  }
}
