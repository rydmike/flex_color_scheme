import 'package:flutter/material.dart';

import '../../controllers/theme_controller.dart';
import '../../pages/page_examples.dart';
import '../universal/stateful_header_card.dart';

// StatefulHeaderCard wrapper of PageExamples.
//
// Widget to show some example sub pages one that also includes the
// ThemeShowcase, where widgets are presented on Scaffold background color
// instead of in cards, as otherwise used but examples.
//
// Used by main example, Copy Paste Playground and Example 4 "All Themes"
class ShowSubPages extends StatelessWidget {
  const ShowSubPages({this.controller, super.key});

  final ThemeController? controller;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99),
            theme.colorScheme.onBackground)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F),
            theme.colorScheme.onBackground);
    return StatefulHeaderCard(
      leading: Icon(Icons.article_outlined, color: iconColor),
      title: const Text('Page Examples'),
      child: PageExamples(controller: controller),
    );
  }
}
