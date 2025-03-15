import 'package:flutter/material.dart';

/// A custom [ListTile] that has a built-in animated custom [trailing] action
/// that animate expands to show the [child] when clicked.
///
/// This is useful when a more compact look is desired where more information
/// is provided as an optional user based reveal action. The purpose is to make
/// UI less talkative but provide easy access to additional usage explanation.
///
/// This is a Flutter "Universal" Widget that only depends on the SDK and
/// can be dropped into any application.
class ListTileExpand extends StatefulWidget {
  const ListTileExpand({
    super.key,
    this.title,
    this.leading,
    this.subtitle,
    this.trailing,
    this.contentPadding,
    this.tileColor,
    this.onTap,
    this.dense,
    this.revealDense,
    this.enabled = true,
    this.isOpen,
    this.duration = const Duration(milliseconds: 200),
    this.child,
  });

  /// A widget to display before the title.
  ///
  /// Typically an [Icon] or a [CircleAvatar] widget.
  final Widget? leading;

  /// The primary content of the list tile.
  ///
  /// Typically a [Text] widget.
  ///
  /// This should not wrap. To enforce the single line limit, use
  /// [Text.maxLines].
  final Widget? title;

  /// Additional content displayed below the title.
  ///
  /// Typically a [Text] widget.
  final Widget? subtitle;

  /// A widget to display after the title.
  ///
  /// Typically an [Icon] widget.
  ///
  /// To show right-aligned metadata (assuming left-to-right reading order;
  /// left-aligned for right-to-left reading order), consider using a [Row] with
  /// [CrossAxisAlignment.baseline] alignment whose first item is [Expanded] and
  /// whose second child is the metadata text, instead of using the [trailing]
  /// property.
  final Widget? trailing;

  /// The [ListTileExpand]'s internal padding.
  ///
  /// Insets a [ListTileExpand]'s contents: its [leading], [title]
  /// and [trailing] widgets.
  ///
  /// If null, `EdgeInsets.symmetric(horizontal: 16.0)` is used in M2
  /// and `EdgeInsetsDirectional.only(start: 16.0, end: 24.0)` in M3.
  final EdgeInsetsGeometry? contentPadding;

  /// Defines the background color of `ListTileReveal` when `selected` is false.
  ///
  /// If this property is null and `selected` is false then
  /// [ListTileThemeData.tileColor] is used. If that is also null and
  /// `selected` is true, `selectedTileColor` is used.
  ///
  /// When that is also null, the [ListTileTheme.selectedTileColor] is
  /// used, otherwise [Colors.transparent] is used.
  final Color? tileColor;

  /// Called when the user taps this list tile.
  ///
  /// Inoperative if [enabled] is false.
  final GestureTapCallback? onTap;

  /// Whether this list tile and card operation is interactive.
  final bool enabled;

  /// Whether this list tile is part of a vertically dense list.
  ///
  /// If this property is null then its value is based on [ListTileTheme.dense].
  ///
  /// Dense list tiles default to a smaller height.
  final bool? dense;

  /// Whether the used reveal part of the ListTile is dense.
  ///
  /// If not defined, defaults to true.
  final bool? revealDense;

  /// Set to true to open the info section of the ListTile, to false to close
  /// it.
  ///
  /// If not defined, defaults to false.
  final bool? isOpen;

  /// The duration of the show and hide animation of child.
  final Duration duration;

  /// The child to reveal when the expand icon is clicked.
  final Widget? child;

  @override
  State<ListTileExpand> createState() => _ListTileExpandState();
}

class _ListTileExpandState extends State<ListTileExpand> {
  late bool _isOpen;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _isOpen = widget.isOpen ?? false;
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ListTileExpand oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isOpen != oldWidget.isOpen) _isOpen = widget.isOpen ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          tileColor: widget.tileColor,
          enabled: widget.enabled,
          contentPadding: widget.contentPadding,
          leading: widget.leading,
          dense: widget.dense,
          title: widget.title,
          subtitle: widget.subtitle,
          trailing: ExpandIcon(
            isExpanded: _isOpen,
            size: 32,
            padding: EdgeInsets.zero,
            onPressed: (_) {
              _focusNode.requestFocus();
              setState(() {
                _isOpen = !_isOpen;
              });
            },
          ),
          onTap: widget.enabled
              ? () {
                  _focusNode.requestFocus();
                  setState(() {
                    _isOpen = !_isOpen;
                  });
                }
              : null,
        ),
        AnimatedSwitcher(
          duration: widget.duration,
          transitionBuilder: (Widget child, Animation<double> animation) {
            return SizeTransition(
              sizeFactor: animation,
              axisAlignment: _isOpen ? 1 : -1,
              child: child,
            );
          },
          child: _isOpen
              ? widget.child ?? const SizedBox.shrink()
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
