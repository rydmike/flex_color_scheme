import 'package:flutter/material.dart';

import 'constants.dart';

// It is not necessary to review or understand the code in this file in order
// to understand how to use the FlexColorScheme package demonstrated in
// the examples.

// A wrapper for a page body.
//
// It provides the following features to the content of the page:
// - Add a scrollbar
// - Add the capability to un-focus a control like a TextFiled by clicking on
//   the background.
// - Center the content and limit the content width when a given constraint
//   is exceeded, in this a constant value we defined.
class PageBody extends StatelessWidget {
  const PageBody({Key key, this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: GestureDetector(
        // This allows us to un-focus a widget, typically a TextField with focus
        // by tapping somewhere outside it.
        onTap: () => FocusScope.of(context).unfocus(),
        // The Center and ConstrainedBox is a neat way of making a layout that
        // will never be wider than the width constraint and when the available
        // width get wider than the constraint, the body never gets any
        // wider and the content will be in centered column. A common web page
        // layout, in order to never make the content so wide that it becomes
        // difficult to read.
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: kMaxContentWidth),
            child: child,
          ),
        ),
      ),
    );
  }
}
