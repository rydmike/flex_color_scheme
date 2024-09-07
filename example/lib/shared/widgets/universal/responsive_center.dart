import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../utils/app_scroll_behavior.dart';

/// A layout with horizontally centered and max width constrained content.
///
/// This type of layout is often used on web pages.
///
/// It provides the following additional features to the content of the page:
/// - Adds a scrollbar
/// - Adds the capability to un-focus a control like a TextFiled by clicking on
///   the background.
/// - Center the content and limit the content width when a given max width
///   constraint is exceeded.
///
///  This version works around the flaw, that you cannot mouse or touch/drag
///  scroll from the expanding margin areas like you could in a Web view.
///  Read more about it here: https://rydmike.com/blog_layout_and_theming
///  The solution is to use a Listener and PointerSignalEvent to manually
///  scroll the content when the user tries to scroll from the margin areas.
///  It still has one issue, and that is that it does not work correctly if
///  the content has both horizontal and vertically scrolling content.
///  Link to how the Listener workaround was obtained wih ChatGPT by
///  Andrea Bizzotto (GH bizz84 Twitter @biz84)
//   https://cloud.typingmind.com/share/cb35afba-1141-4db7-9201-e2fea9a92b16
///
/// This is a Flutter "Universal" Widget that only depends on the SDK and
/// can be dropped into any application.
class ResponsiveCenter extends StatelessWidget {
  /// Default constructor for the constrained PageBody.
  const ResponsiveCenter({
    super.key,
    this.controller,
    this.constraints = const BoxConstraints(maxWidth: 1000),
    this.padding = EdgeInsets.zero,
    required this.child,
  });

  /// Optional scroll controller for the constrained page body.
  ///
  /// If you use a scrolling view as child to the page body, that needs a
  /// scroll controller, we need to use the same controller here too.
  ///
  /// If null, a default controller is used.
  final ScrollController? controller;

  /// The constraints for the constrained layout.
  ///
  /// Default to max width constraint, with a value of 1000 dp.
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
    // Use a Listener on the outside to catch the PointerSignalEvent and
    // manually scroll the content when the user tries to scroll from the
    // margin areas.
    return Listener(
      onPointerSignal: (PointerSignalEvent pointerSignal) {
        final ScrollController? c = controller;
        if (pointerSignal is PointerScrollEvent && c != null) {
          final double newOffset = c.offset + pointerSignal.scrollDelta.dy;
          if (newOffset < c.position.minScrollExtent) {
            c.jumpTo(c.position.minScrollExtent);
          } else if (newOffset > c.position.maxScrollExtent) {
            c.jumpTo(c.position.maxScrollExtent);
          } else {
            c.jumpTo(newOffset);
          }
        }
      },
      // The scroll bars should be at the edge of the screen, not next to the
      // width constrained content. If we use the built-in scroll bars of the
      // ones in the scrolling child, it will be next to the child, not at the
      // edge of the screen where it belongs, this fixes that.
      child: Scrollbar(
        controller: controller,
        // This GestureDetector and tap allows us to un-focus a widget,
        // typically a TextField, by tapping somewhere outside it. This addition
        // is no longer needed on desktop builds, where it is built-in, but
        // it is not on tablet and phone builds. Here we want this feature on
        // them too and add it.
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Center(
            child: ConstrainedBox(
              constraints: constraints,
              child: ScrollConfiguration(
                behavior: const NoScrollbarBehavior(),
                child: Padding(
                  padding: padding,
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
