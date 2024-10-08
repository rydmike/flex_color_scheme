import 'package:flutter/material.dart';

/// The minimum width for a double column Layout to be used by the
/// [RowOrColumn] widget.
const double _kMinWidth = 550;

/// A widget with a builder that provides `true` if the width is greater than
/// or equal to the [minWidth] or `false` if it is less.
///
/// Value of [minWidth] defaults to [_kMinWidth].
class ResponsiveTwoWidgets extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    bool isRow,
  ) builder;

  final double minWidth;

  const ResponsiveTwoWidgets({
    super.key,
    required this.builder,
    this.minWidth = _kMinWidth,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints boxConstraints) {
      return builder(context, boxConstraints.maxWidth >= minWidth);
    });
  }
}

/// Return [firstWidget] and [lastWidget] in a [Row] or [Column] based on the
/// value of [isRow].
class RowOrColumn extends StatelessWidget {
  const RowOrColumn({
    super.key,
    required this.firstWidget,
    required this.lastWidget,
    required this.isRow,
  });

  final Widget firstWidget;
  final Widget lastWidget;
  final bool isRow;

  @override
  Widget build(BuildContext context) {
    return isRow
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(child: firstWidget),
              Expanded(child: lastWidget),
            ],
          )
        : Column(
            children: <Widget>[
              firstWidget,
              lastWidget,
            ],
          );
  }
}
