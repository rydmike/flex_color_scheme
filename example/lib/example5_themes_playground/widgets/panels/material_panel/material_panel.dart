import 'package:flutter/material.dart';

import '../../../../shared/widgets/universal/theme_showcase.dart';

class MaterialPanel extends StatelessWidget {
  const MaterialPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Padding(
          padding: EdgeInsets.all(16),
          child: MaterialShowcase(),
        ),
      ],
    );
  }
}
