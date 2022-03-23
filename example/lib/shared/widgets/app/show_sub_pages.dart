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
    return HeaderCard(
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
