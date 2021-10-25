import 'package:flutter/material.dart';

/// A list tile that can be toggled via trailing widget to open and reveal
/// more content in a child Widget.
///
//  The open reveal is animated.
/// The ListTile and its revealed child are wrapped in a Card widget, it
/// is designed to placed on color of scaffold background color.
///
/// The widget is kept alive with AutomaticKeepAliveClientMixin so it does
/// not get dismissed and closed in scroll views.
class RevealListTileCard extends StatefulWidget {
  const RevealListTileCard({
    Key? key,
    this.leading,
    this.title,
    this.subtitle,
    this.contentPadding,
    this.enabled = true,
    this.closed = true,
    this.onChange,
    this.duration = const Duration(milliseconds: 200),
    this.child,
  }) : super(key: key);

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

  /// The tile's internal padding.
  ///
  /// Insets a [ListTile]'s contents: its [leading], [title], [subtitle].
  ///
  /// If null, `EdgeInsets.symmetric(horizontal: 16.0)` is used.
  final EdgeInsetsGeometry? contentPadding;

  /// Whether this list tile is interactive.
  final bool enabled;

  /// Whether widget is closed or open.
  ///
  /// Set to false to hide child.
  final bool closed;

  /// Callback called if the open/close state was changed.
  final ValueChanged<bool>? onChange;

  /// The duration of the show and hide animation of child.
  final Duration duration;

  /// The child to be revealed.
  final Widget? child;

  @override
  _RevealListTileCardState createState() => _RevealListTileCardState();
}

class _RevealListTileCardState extends State<RevealListTileCard>
    with AutomaticKeepAliveClientMixin {
  bool _closed = true;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _closed = widget.closed;
  }

  @override
  void didUpdateWidget(covariant RevealListTileCard oldWidget) {
    if (oldWidget.closed != widget.closed) {
      _closed = widget.closed;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    // Must call super.
    super.build(context);

    final ThemeData theme = Theme.of(context);
    final ColorScheme scheme = theme.colorScheme;
    final bool isDark = theme.brightness == Brightness.dark;
    final int blendFactor = isDark ? 3 : 2;

    // Get default card background color.
    Color cardColor = theme.cardColor;
    // Compute a header with fixed primary blend, to give it a different tint.
    Color headerColor =
        Color.alphaBlend(scheme.primary.withAlpha(6 * blendFactor), cardColor);

    // If card or its header color, is equal to scaffold background, we will
    // adjust it.
    if (cardColor == theme.scaffoldBackgroundColor ||
        headerColor == theme.scaffoldBackgroundColor) {
      cardColor = Color.alphaBlend(
          scheme.primary.withAlpha(4 * blendFactor), cardColor);
      headerColor = Color.alphaBlend(
          scheme.primary.withAlpha(4 * blendFactor), headerColor);
    }
    // If it was header color that was equal, same adjustment on card, may have
    // caused card to become equal to background, let's check and adjust it
    // once again, very unlikely that this would happen but possible
    if (cardColor == theme.scaffoldBackgroundColor) {
      cardColor = Color.alphaBlend(
          scheme.primary.withAlpha(2 * blendFactor), cardColor);
    }

    return Card(
      color: cardColor,
      child: Column(
        children: <Widget>[
          Theme(
            data: theme.copyWith(cardColor: headerColor),
            child: Material(
              type: MaterialType.card,
              child: ListTile(
                contentPadding: widget.contentPadding,
                leading: widget.leading,
                title: widget.title,
                trailing: ExpandIcon(
                  size: 36,
                  isExpanded: !_closed,
                  padding: EdgeInsets.zero,
                  onPressed: (_) {
                    setState(() {
                      _closed = !_closed;
                    });
                    widget.onChange?.call(_closed);
                  },
                ),
                onTap: () {
                  setState(() {
                    _closed = !_closed;
                  });
                  widget.onChange?.call(_closed);
                },
              ),
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
            child: (_closed || widget.child == null)
                ? const SizedBox.shrink()
                : widget.child,
          ),
        ],
      ),
    );
  }
}
