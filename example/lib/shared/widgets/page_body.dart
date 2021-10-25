import 'package:flutter/material.dart';

/// A centered width constrained web page body.
//
// This type of layout is often used on web pages.
//
// It provides the following features to the content of the page:
// - Adds a scrollbar
// - Center the content and limit the content width when a given width
//   constraint value is exceeded, in this case an app level max width constant.
class PageBody extends StatelessWidget {
  /// Default constructor for the constrained PageBody.
  const PageBody({
    Key? key,
    this.controller,
    this.constraints = const BoxConstraints(maxWidth: 1000),
    this.padding = EdgeInsets.zero,
    required this.child,
  }) : super(key: key);

  /// Optional scroll controller for the constrained page body.
  ///
  /// If you use a scrolling view as child to the page body, that needs a
  /// scroll controller, we need to use the same controller here too.
  ///
  /// If null, a default controller is used.
  final ScrollController? controller;

  /// The constraints for the constrained layout.
  ///
  /// Default to max width constraint, with a value of 900 dp.
  final BoxConstraints constraints;

  /// Padding around the page body.
  ///
  /// Defaults to EdgeInsets.zero
  final EdgeInsetsGeometry padding;

  /// Child to be wrapped in the centered width constrained body, with an
  /// un-focus tap handler, the way an app should behave.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // We want the scroll bars to be at the edge of the screen, not next to the
    // width constrained content. If we use the built in scroll bars of the
    // in a scrolling child, it will be next to the child, not at the edge of
    // the screen where it belongs.
    return Scrollbar(
      controller: controller,
      child: Center(
        child: ConstrainedBox(
          constraints: constraints,
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: Padding(
              padding: padding,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
