import 'package:flutter/material.dart';

import '../../pages/sub_pages.dart';

// Due to issue with StaggeredGridview in example 5, we had to make [SubPages]
// stateless, so here we wrap it in a state keeping version for main example
// and example nr 4. Then we do not have to keep state in them to be able to
// use the toggle. Not so pretty, but it shows how you can wrap a stateless
// Widget in one that keeps its state, might be useful info.
class ShowSubPages extends StatefulWidget {
  const ShowSubPages({Key? key}) : super(key: key);

  @override
  State<ShowSubPages> createState() => _ShowSubPagesState();
}

class _ShowSubPagesState extends State<ShowSubPages> {
  bool isOpen = true;

  @override
  Widget build(BuildContext context) {
    return SubPages(
      isOpen: isOpen,
      onTap: () {
        setState(() {
          isOpen = !isOpen;
        });
      },
    );
  }
}
