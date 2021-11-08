import 'package:flutter/material.dart';

/// Wrap the [child] with a [Tooltip] if [condition] is true, if
/// [condition] is false, just return the [child].
///
/// This is a Flutter "Universal" Widget that only depends on the SDK and
/// can be dropped into any application.
class MaybeTooltip extends StatelessWidget {
  const MaybeTooltip({
    Key? key,
    required this.condition,
    this.message,
    required this.child,
    this.padding,
    this.margin,
    this.verticalOffset,
    this.preferBelow,
  }) : super(key: key);

  /// If the [condition] is met, the child is wrapped with Tooltip.
  final bool condition;

  /// The text to display in the tooltip.
  ///
  /// The message can be null or empty to not have any tooltip, even if
  /// the condition to wrap with tooltip is true.
  final String? message;

  /// The amount of space by which to inset the tooltip's [child].
  ///
  /// Defaults to 16.0 logical pixels in each direction.
  final EdgeInsetsGeometry? padding;

  /// The empty space that surrounds the tooltip.
  ///
  /// Defines the tooltip's outer [Container.margin]. By default, a
  /// long tooltip will span the width of its window. If long enough,
  /// a tooltip might also span the window's height. This property allows
  /// one to define how much space the tooltip must be inset from the edges
  /// of their display window.
  ///
  /// If this property is null, then [TooltipThemeData.margin] is used.
  /// If [TooltipThemeData.margin] is also null, the default margin is
  /// 0.0 logical pixels on all sides.
  final EdgeInsetsGeometry? margin;

  /// The vertical gap between the widget and the displayed tooltip.
  ///
  /// When [preferBelow] is set to true and tooltips have sufficient space to
  /// display themselves, this property defines how much vertical space
  /// tooltips will position themselves under their corresponding widgets.
  /// Otherwise, tooltips will position themselves above their corresponding
  /// widgets with the given offset.
  final double? verticalOffset;

  /// Whether the tooltip defaults to being displayed below the widget.
  ///
  /// Defaults to true. If there is insufficient space to display the tooltip in
  /// the preferred direction, the tooltip will be displayed in the opposite
  /// direction.
  final bool? preferBelow;

  /// The widget below this widget in the tree.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (condition && message != null && message != '') {
      return Tooltip(
        message: message ?? '',
        padding: padding,
        margin: margin,
        verticalOffset: verticalOffset,
        preferBelow: preferBelow,
        child: child,
      );
    } else {
      return child;
    }
  }
}
