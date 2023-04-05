import 'package:flutter/material.dart';

/// A custom [SwitchListTile] that has a built-in animated custom leading action
/// as a part of [title] that reveals the [subtitle] when clicked.
///
/// This is useful when a more compact look is desired where more information
/// is provided as an optional user based reveal action. The purpose is to make
/// UI less talkative but provide easy access to additional usage explanation.
///
/// This is a Flutter "Universal" Widget that only depends on the SDK and
/// can be dropped into any application.
class SwitchListTileReveal extends StatefulWidget {
  const SwitchListTileReveal({
    super.key,
    required this.value,
    required this.onChanged,
    this.title,
    this.subtitle,
    this.contentPadding,
    this.onTap,
    this.dense,
    this.subtitleDense,
    this.enabled = true,
    this.isOpen,
    this.duration = const Duration(milliseconds: 200),
  });

  /// Whether this switch is checked.
  ///
  /// This property must not be null.
  final bool value;

  /// Called when the user toggles the switch on or off.
  ///
  /// The switch passes the new value to the callback but does not actually
  /// change state until the parent widget rebuilds the switch tile with the
  /// new value.
  ///
  /// If null, the switch will be displayed as disabled.
  ///
  /// The callback provided to [onChanged] should update the state of the parent
  /// [StatefulWidget] using the [State.setState] method, so that the parent
  /// gets rebuilt; for example:
  final ValueChanged<bool>? onChanged;

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

  /// The [SwitchListTileReveal]'s internal padding.
  ///
  /// Insets a [SwitchListTileReveal]'s contents: its [title],
  /// [subtitle] widgets.
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
  State<SwitchListTileReveal> createState() => _SwitchListTileRevealState();
}

class _SwitchListTileRevealState extends State<SwitchListTileReveal> {
  late bool _isOpen;

  @override
  void initState() {
    super.initState();
    _isOpen = widget.isOpen ?? false;
  }

  @override
  void didUpdateWidget(covariant SwitchListTileReveal oldWidget) {
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
        SwitchListTile(
          dense: widget.dense,
          contentPadding: widget.contentPadding,
          value: widget.value,
          onChanged: widget.enabled ? widget.onChanged : null,
          title: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              if (widget.title != null) widget.title!,
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
