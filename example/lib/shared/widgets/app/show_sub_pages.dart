import 'package:flutter/material.dart';

import '../../pages/page_examples.dart';
import '../universal/header_card.dart';

// Stateful HeaderCard wrapper os PageExamples.
//
// Widget to show some example sub pages one that also includes the
// ThemeShowcase, where widgets are presented on Scaffold background color
// instead of in cards, as otherwise used but examples.
//
// Used by main example, Copy Paste Playground and Example 4 "All Themes"
class ShowSubPages extends StatefulWidget {
  const ShowSubPages({
    Key? key,
    this.isOpen = true,
  }) : super(key: key);

  final bool isOpen;

  @override
  State<ShowSubPages> createState() => _ShowSubPagesState();
}

class _ShowSubPagesState extends State<ShowSubPages> {
  bool isOpen = true;

  @override
  void initState() {
    super.initState();
    isOpen = widget.isOpen;
  }

  @override
  void didUpdateWidget(covariant ShowSubPages oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isOpen != isOpen) {
      isOpen = widget.isOpen;
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99),
            theme.colorScheme.onBackground)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F),
            theme.colorScheme.onBackground);
    return HeaderCard(
      leading: Icon(Icons.article_outlined, color: iconColor),
      title: const Text('Page Examples'),
      isOpen: isOpen,
      onTap: () {
        setState(() {
          isOpen = !isOpen;
        });
      },
      child: const PageExamples(),
    );
  }
}
