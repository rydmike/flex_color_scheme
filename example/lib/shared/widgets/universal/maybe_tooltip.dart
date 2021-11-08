import 'package:flutter/material.dart';

/// Wrap the [child] with a [Tooltip] if [condition] is true, if
/// [condition] is false, just return the [child].
class MaybeTooltip extends StatelessWidget {
  const MaybeTooltip({
    Key? key,
    required this.condition,
    this.tooltip,
    required this.child,
    this.padding,
    this.margin,
  }) : super(key: key);

  final bool condition;
  final String? tooltip;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (condition && tooltip != null && tooltip != '') {
      return Tooltip(
        message: tooltip ?? '',
        padding: padding,
        margin: margin,
        child: child,
      );
    } else {
      return child;
    }
  }
}
