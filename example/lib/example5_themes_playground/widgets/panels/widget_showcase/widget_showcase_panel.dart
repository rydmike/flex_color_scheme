import 'package:flutter/material.dart';

import '../../../../shared/widgets/universal/showcase_material.dart';

/// A panel with all the widgets using effective theming in a column layout.
///
/// This might be a bit heavy layout this on a web build.
class WidgetShowcasePanel extends StatelessWidget {
  const WidgetShowcasePanel({super.key});

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
