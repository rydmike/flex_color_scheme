import 'package:flutter/material.dart';

/// A custom [ListTile] that has a built-in animated custom leading action
/// after the [leading] widget built in as a part of [title] that
/// reveals the [subtitle] when clicked.
///
/// This is useful when a more compact look is desired where more information
/// is provided as an optional user based reveal action. The purpose is to make
/// UI less talkative but provide easy access to additional usage explanation.
///
/// This is a Flutter "Universal" Widget that only depends on the SDK and
/// can be dropped into any application.
class ListTileReveal extends StatefulWidget {
  const ListTileReveal({
    super.key,
    this.title,
    this.leading,
    this.subtitle,
    this.trailing,
    this.contentPadding,
    this.onTap,
    this.dense,
    this.subtitleDense,
    this.enabled = true,
    this.isOpen,
    this.duration = const Duration(milliseconds: 200),
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

  /// The [ListTileReveal]'s internal padding.
  ///
  /// Insets a [ListTileReveal]'s contents: its [leading], [title], [subtitle],
  /// and [trailing] widgets.
  ///
  /// If null, `EdgeInsets.symmetric(horizontal: 16.0)` is used.
  final EdgeInsetsGeometry? contentPadding;

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

  /// Whether this list tile subtitle is dense.
  ///
  /// Dense list tiles default to a smaller height. The subtitle is also dense
  /// if dense is true.
  ///
  /// If not defined defaults to false.
  final bool? subtitleDense;

  /// Set to true to open the info section of the ListTile, to false to close
  /// it.
  ///
  /// If not defined, defaults to false.
  final bool? isOpen;

  /// The duration of the show and hide animation of child.
  final Duration duration;

  @override
  State<ListTileReveal> createState() => _ListTileRevealState();
}

class _ListTileRevealState extends State<ListTileReveal> {
  late bool _isOpen;

  @override
  void initState() {
    super.initState();
    _isOpen = widget.isOpen ?? false;
  }

  @override
  void didUpdateWidget(covariant ListTileReveal oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isOpen != oldWidget.isOpen) _isOpen = widget.isOpen ?? false;
  }

  void _handleTap() {
    setState(() {
      _isOpen = !_isOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          enabled: widget.enabled,
          contentPadding: widget.contentPadding,
          leading: widget.leading,
          dense: widget.dense,
          title: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              if (widget.title != null) widget.title!,
              if (widget.subtitle != null && widget.enabled)
                IconButton(
                  iconSize: 20,
                  // ignore: avoid_bool_literals_in_conditional_expressions
                  isSelected: widget.enabled ? _isOpen : false,
                  icon: const Icon(Icons.info_outlined),
                  selectedIcon: const Icon(Icons.info),
                  onPressed: widget.enabled ? _handleTap : null,
                ),
            ],
          ),
          trailing: widget.trailing,
          onTap: widget.enabled ? widget.onTap : null,
        ),
        AnimatedSwitcher(
          duration: widget.duration,
          transitionBuilder: (Widget child, Animation<double> animation) {
            return SizeTransition(
              sizeFactor: animation,
              child: child,
            );
          },
          child: (_isOpen && widget.subtitle != null && widget.enabled)
              ? ListTile(
                  dense: (widget.dense ?? false) ||
                      (widget.subtitleDense ?? false),
                  subtitle: widget.subtitle,
                  onTap: widget.enabled ? _handleTap : null,
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
