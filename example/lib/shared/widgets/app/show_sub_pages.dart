import 'package:flutter/material.dart';

import '../../pages/page_examples.dart';
import '../universal/header_card.dart';

// Used by main example and example 4.
class ShowSubPages extends StatefulWidget {
  const ShowSubPages({Key? key}) : super(key: key);

  @override
  State<ShowSubPages> createState() => _ShowSubPagesState();
}

class _ShowSubPagesState extends State<ShowSubPages> {
  bool isOpen = true;

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
