import 'package:flutter/material.dart';

/// A centered width constrained web style page body.
///
/// This type of layout is often used on web pages.
///
/// It provides the following features to the content of the page:
/// - Adds a scrollbar
/// - Adds the capability to un-focus a control like a TextFiled by clicking on
///   the background.
/// - Center the content and limit the content width when a given max width
///   constraint is exceeded.
///
///  This implementation has a flaw, you cannot mouse or touch/drag scroll from
///  expanding margin areas like you could in a Web view. Read more about
///  it here: https://rydmike.com/blog_layout_and_theming
///
/// This is a Flutter "Universal" Widget that only depends on the SDK and
/// can be dropped into any application.
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
      child: GestureDetector(
        // This allows us to un-focus a widget, typically a TextField with focus
        // by tapping somewhere outside it. It is no longer needed on desktop
        // builds, it is done automatically there, but not on tablet and phone
        // app. In this demo we want it on them too.
        onTap: () => FocusScope.of(context).unfocus(),
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
      ),
    );
  }
}
