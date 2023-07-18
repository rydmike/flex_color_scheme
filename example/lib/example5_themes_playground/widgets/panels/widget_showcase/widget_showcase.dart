import 'package:flutter/material.dart';

import '../../../../shared/widgets/universal/showcase_material.dart';

/// All the widgets using effective theming in a column.
class WidgetShowcase extends StatelessWidget {
  const WidgetShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 8),
          ShowcaseMaterial(),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
