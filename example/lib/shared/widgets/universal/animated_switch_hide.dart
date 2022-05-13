import 'package:flutter/material.dart';

/// This widget uses a boolean condition to show/hide the [child] widget.
///
/// It is a convenience wrapper for AnimatedSwitcher where the Widget that it
/// is size animated switched to an invisible SizedBox.shrink() if no other
/// widget is provided, it then effectively removes the child via an animation
/// to a zero sized widget instead, alternatively it uses the same size
/// transition so switch to another widget.
///
/// This is a Flutter "Universal" Widget that only depends on the SDK and
/// can be dropped into any application.
class AnimatedSwitchHide extends StatelessWidget {
  const AnimatedSwitchHide({
    super.key,
    required this.showChild,
    this.duration = const Duration(milliseconds: 200),
    required this.child,
    this.switchedChild,
  });

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
