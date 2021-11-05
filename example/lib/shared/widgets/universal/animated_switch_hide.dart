import 'package:flutter/material.dart';

/// This widget is good for using a boolean condition to show/hide the [child]
/// widget.
///
/// It is a simple convenience wrapper for AnimatedSwitcher
/// where the Widget that it is Switched to is an invisible SizedBox.shrink()
/// if no other widget is provided, it then effectively removes the child by
/// animation to a zero sized widget instead.
///
/// This is a Flutter "Universal" Widget that only depends on the SDK and
/// can be dropped into any application.
class AnimatedSwitchHide extends StatelessWidget {
  const AnimatedSwitchHide({
    Key? key,
    required this.showChild,
    this.duration = const Duration(milliseconds: 200),
    required this.child,
    this.switchedChild,
  }) : super(key: key);

  /// Set hide to true to remove the child with size transition.
  final bool showChild;

  /// The duration of the hide animation.
  final Duration duration;

  /// The widget to be conditionally hidden or switched from, when showChild
  /// if false.
  final Widget child;

  /// The widget that is shown when [showChild] is false.
  ///
  /// Defaults to [SizedBox.shrink] if null, effectively hiding the child if
  /// no other widget to be switched to is provided.
  final Widget? switchedChild;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: child,
        );
      },
      child: showChild ? child : switchedChild ?? const SizedBox.shrink(),
    );
  }
}
